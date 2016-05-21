defmodule Identificator.AuthController do
  use Identificator.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Identificator.Identity

  def callback(%{assigns: %{ueberauth_failure: failure}} = conn, _params) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(Identificator.AuthView, "failure.json", failure: failure)
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case Identity.find_or_create(auth) do
      {:ok, identity} ->
        conn  = Guardian.Plug.api_sign_in(conn, identity)
        token = Guardian.Plug.current_token(conn)

        conn
        |> put_status(:created)
        |> put_resp_header("authorization", token)
        |> put_resp_header("location", identity_path(conn, :show, identity))
        |> render(Identificator.AuthView, "callback.json", identity: identity, token: token)
      {:error, message} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Identificator.AuthView, "password_error.json")
    end
  end
end
