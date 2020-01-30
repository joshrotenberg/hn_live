defmodule HnLiveWeb.Hn do
  use Phoenix.LiveView
  import Calendar.Strftime

  @default_story_type :top

  def radio_tag(assigns) do
    assigns = Enum.into(assigns, %{})

    ~L"""
    <input type="radio" name="<%= @name %>" value="<%= @value %>"
      <%= if String.to_atom(@value) == @checked, do: "checked" %> />
    """
  end

  def render(assigns) do
    HnLiveWeb.PageView.render("hn.html", assigns)
  end

  def mount(_session, socket) do
    if connected?(socket), do: :timer.send_interval(60000, self(), :tick)

    {:ok, update_stories(socket, @default_story_type)}
  end

  def handle_event("set-story-type", %{"type" => type}, socket) do
    {:noreply, update_stories(socket, String.to_atom(type))}
  end

  def handle_info(:tick, socket) do
    {:noreply, update_stories(socket, socket.assigns.type)}
  end

  defp update_stories(socket, type) do
    {:ok, ids} = HN.stories(type)

    stories =
      ids
      |> Enum.map(&Task.async(fn -> HN.item!(&1) end))
      |> Enum.map(&Task.await/1)
      |> Enum.filter(fn story -> story != nil end)
      |> Enum.filter(fn story -> story.deleted == nil end)

    assign(socket, stories: stories, type: type, time: :calendar.local_time())
  end
end
