defmodule Identificator.PageController do
  use Identificator.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
