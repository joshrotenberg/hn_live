defmodule HnLiveWeb.PageController do
  use HnLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
