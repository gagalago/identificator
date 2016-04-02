defmodule Identificator.IdentityController do
  use Identificator.Web, :controller

  alias Identificator.Identity

  plug :scrub_params, "identity" when action in [:create, :update]

  def index(conn, _params) do
    identities = Repo.all(Identity)
    render(conn, "index.json", identities: identities)
  end

  def create(conn, %{"identity" => identity_params}) do
    changeset = Identity.changeset(%Identity{}, identity_params)

    case Repo.insert(changeset) do
      {:ok, identity} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", identity_path(conn, :show, identity))
        |> render("show.json", identity: identity)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Identificator.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    identity = Repo.get!(Identity, id)
    render(conn, "show.json", identity: identity)
  end

  def update(conn, %{"id" => id, "identity" => identity_params}) do
    identity = Repo.get!(Identity, id)
    changeset = Identity.changeset(identity, identity_params)

    case Repo.update(changeset) do
      {:ok, identity} ->
        render(conn, "show.json", identity: identity)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Identificator.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    identity = Repo.get!(Identity, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(identity)

    send_resp(conn, :no_content, "")
  end
end
