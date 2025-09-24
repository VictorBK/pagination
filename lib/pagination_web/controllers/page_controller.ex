defmodule PaginationWeb.PageController do
  use PaginationWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
