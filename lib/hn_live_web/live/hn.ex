defmodule HnLiveWeb.Hn do
  use Phoenix.LiveView
  import Calendar.Strftime

  def render(assigns) do
    ~L"""
    put some content <%= @here %>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, here: "here")}
  end
end
