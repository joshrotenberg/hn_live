defmodule HnLiveWeb.Hn.Components.Story do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="hero"><a href="<%= @story.url %>"><%= @story.title %></a></br>
    score: <%= @story.score %>
    by: <a href="https://news.ycombinator.com/user?id=<%= @story.by %>"><%= @story.by %></a>
    <%= if @story.descendants do %>
    comments: <a href="https://news.ycombinator.com/item?id=<%= @story.id %>"><%= @story.descendants %></a></div>
    <% end %>
    """
  end
end
