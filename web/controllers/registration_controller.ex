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
        identity
        |> RegistrationEmail.confirm
        |> Mailer.deliver

        conn
        |> put_status(:created)
        |> put_resp_header("location", identity_path(conn, :show, identity))
        |> Guardian.Plug.api_sign_in(identity)
        |> (&put_resp_header(&1, "authorization", Guardian.Plug.current_token(&1))).()
        |> render("show.json", identity: identity)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Identificator.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
