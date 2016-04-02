defmodule Identificator.IdentityTest do
  use Identificator.ModelCase, db: true

  alias Identificator.Identity

  @valid_attrs fields_for(:identity)
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Identity.changeset(%Identity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Identity.changeset(%Identity{}, @invalid_attrs)
    refute changeset.valid?
  end
end
