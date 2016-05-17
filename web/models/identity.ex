defmodule Identificator.Identity do
  use Identificator.Web, :model
  import Comeonin.Pbkdf2, only: [hashpwsalt: 1]
  alias Ueberauth.Auth

  @primary_key {:id, Ecto.UUID, read_after_writes: true}
  schema "identities" do
    field :user_id, Ecto.UUID
    field :email, :string
    field :provider, :string
    field :provider_id, :string
    field :auth_settings, :map
    field :data, :map
    field :password, :string, virtual: true
    field :confirmed_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(email provider provider_id auth_settings)
  @optional_fields ~w(id user_id data)
  @providers ~w(email)

  @doc """
  Creates a default changeset
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/[\w.-]+@[\w.-]+\.[\w]{2,}/)
    |> validate_inclusion(:provider, @providers)
    |> unique_constraint(:email, name: :identities_provider_email_index)
    |> unique_constraint(:provider_id, name: :identities_provider_provider_id_index)
    |> unique_constraint(:id)
  end

  @doc """
  Creates a changeset for registration
  """
  def registration_changeset(model, params \\ %{}) do
    model = model
    |> cast(params, ~w(email password), @optional_fields)
    |> validate_length(:password, min: 8)
    model
    |> put_change(:provider, "email")
    |> put_change(:provider_id, model.changes.email)
    |> put_change(:auth_settings, %{password: hashpwsalt(model.changes.password)})
    |> changeset
  end

  def find_or_create(%Auth{provider: :identity} = auth) do
    :unimplemted
  end
end
