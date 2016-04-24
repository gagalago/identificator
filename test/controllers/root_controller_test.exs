defmodule Identificator.RootControllerTest do
  use Identificator.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Identificator!"
  end
end
