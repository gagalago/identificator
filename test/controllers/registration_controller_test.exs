# defmodule Identificator.RegistrationControllerTest do
#   use Identificator.ConnCase, db: true
#
#   alias Identificator.Identity
#   @attrs %{email: Faker.Internet.email, password: "azertyuiop"}
#
#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end
#
#   test "create an identity when data is valid", %{conn: conn} do
#     conn  = post conn, registration_path(conn, :create), identity: @attrs
#     assert json_response(conn, 201)["data"]["id"]
#     assert Repo.get_by(Identity, %{provider: :email, email: attrs.email})
#   end
#
#   test "does not create an identity when email is already used", %{conn: conn} do
#     identity = create :identity, email: @attrs.email
#     conn  = post conn, registration_path(conn, :create), identity: @attrs
#     assert json_response(conn, 422)["errors"].any? "email already used."
#   end
# end
