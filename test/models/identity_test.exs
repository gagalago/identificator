defmodule Identificator.IdentityTest do
  use Identificator.ModelCase, async: true

  alias Identificator.Identity
  alias Ueberauth.Auth

  @valid_attrs fields_for(:identity)

  test "changeset with valid attributes" do
    changeset = Identity.changeset(%Identity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "registration_changeset with valid attributes" do
    changeset = Identity.registration_changeset(
      %Identity{}, fields_for(:identity, password: "password")
    )
    assert changeset.valid?
  end

  test "find_or_create find identity with valid email and password" do
    identity = :identity |> build(@valid_attrs) |> with_password |> create
    {:ok, finded_identity} = Identity.find_or_create(
      %Auth{
        provider:    :identity,
        credentials: %Auth.Credentials{other: %{password: identity.password}},
        info:        %Auth.Info{email: identity.email}
      }
    )
    assert identity.id == finded_identity.id
  end

  test "find_or_create don't find identity with unknow email" do
    identity = :identity |> build(@valid_attrs) |> with_password
    {:error, _} = Identity.find_or_create(
      %Auth{
        provider:    :identity,
        credentials: %Auth.Credentials{other: %{password: identity.password}},
        info:        %Auth.Info{email: identity.email}
      }
    )
  end
end
