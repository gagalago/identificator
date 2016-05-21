defmodule Identificator.RegistrationController do
  use Identificator.Web, :controller

  alias Identificator.Identity
  alias Identificator.RegistrationEmail
  alias Identificator.Mailer

  plug :scrub_params, "registration" when action in [:create]

  def create(conn, %{"registration" => registration_params}) do
    changeset = Identity.registration_changeset(%Identity{}, registration_params)

    case Repo.insert(changeset) do
      {:ok, identity} ->
        claims = Guardian.Claims.app_claims |> Guardian.Claims.ttl({2, :days})
        conn   = Guardian.Plug.api_sign_in(conn, identity, claims)
        token  = Guardian.Plug.current_token(conn)

        identity
        |> RegistrationEmail.confirm(token)
        |> Mailer.deliver

        conn
        |> put_status(:created)
        |> put_resp_header("location", identity_path(conn, :show, identity))
        |> put_resp_header("authorization", token)
        |> render("show.json", identity: identity, token: token)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Identificator.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
