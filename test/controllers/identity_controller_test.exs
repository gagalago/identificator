defmodule Identificator.IdentityControllerTest do
  use Identificator.ConnCase, async: true

  alias Identificator.Identity
  @valid_attrs :identity |> fields_for |> Enum.filter(fn {_, v} -> v != nil end) |> Enum.into(%{})
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all identities related to the user", %{conn: conn} do
    conn = get conn, identity_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    identity = create :identity
    conn = get conn, identity_path(conn, :show, identity)
    assert json_response(conn, 200)["data"] == %{
      "id" => identity.id,
      "user_id" => identity.user_id,
      "email" => identity.email,
      "provider" => identity.provider,
      "auth_settings" => identity.auth_settings,
      "data" => identity.data
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, identity_path(conn, :show, Ecto.UUID.generate)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn  = post conn, identity_path(conn, :create), identity: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Identity, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, identity_path(conn, :create), identity: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    identity = create :identity
    conn = put conn, identity_path(conn, :update, identity), identity: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Identity, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    identity = Repo.insert! %Identity{}
    conn = put conn, identity_path(conn, :update, identity), identity: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    identity = Repo.insert! %Identity{}
    conn = delete conn, identity_path(conn, :delete, identity)
    assert response(conn, 204)
    refute Repo.get(Identity, identity.id)
  end
end
