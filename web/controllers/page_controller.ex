defmodule Identificator.PageController do
  @moduledoc false

  use Identificator.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
