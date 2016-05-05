defmodule Identificator.IdentityTest do
  use Identificator.ModelCase, async: true

  alias Identificator.Identity

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
end
