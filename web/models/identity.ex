defmodule Identificator.Identity do
  use Identificator.Web, :model

  @primary_key {:id, Ecto.UUID, read_after_writes: true}
  schema "identities" do
    field :user_id, Ecto.UUID
    field :email, :string
    field :provider, :string
    field :provider_id, :string
    field :auth_settings, :map
    field :data, :map

    timestamps
  end

  @required_fields ~w(email provider auth_settings)
  @optional_fields ~w(id user_id data)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/[\w.-]+@[\w.-]+\.[\w]{2,}/)
    |> unique_constraint(:id)
  end
end
