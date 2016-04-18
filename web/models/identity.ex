defmodule Identificator.Identity do
  use Identificator.Web, :model
  import Comeonin.Pbkdf2, only: [hashpwsalt: 1]

  @primary_key {:id, Ecto.UUID, read_after_writes: true}
  schema "identities" do
    field :user_id, Ecto.UUID
    field :email, :string
    field :provider, :string
    field :provider_id, :string
    field :auth_settings, :map
    field :data, :map
    field :password, :string, virtual: true

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
    |> unique_constraint(:id)
  end

  @doc """
  Creates a changeset for registration
  """
  def registration_changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(email password), @optional_fields)
    |> put_change(:provider_id, params["email"])
    |> put_change(:provider, "email")
    |> hash_password
    |> changeset
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      changeset
      |> validate_length(:password, min: 8)
      |> put_change(:auth_settings, %{"password" => hashpwsalt(password)})
    else
      changeset
    end
  end
end
