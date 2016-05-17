defmodule Identificator.Contexts.PasswordContext do
  use WhiteBread.Context

  Faker.locale :en
  use Phoenix.ConnTest
  import Identificator.Router.Helpers
  alias Identificator.Repo
  import Swoosh.TestAssertions
  import Identificator.Factory
  # The default endpoint for testing
  @endpoint Identificator.Endpoint

  alias Identificator.Identity

  scenario_starting_state fn state ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Identificator.Repo)
    state |> Map.put(:conn, Phoenix.ConnTest.build_conn())
  end

  given_ ~r/^An unknow user$/, fn state ->
    {:ok, state |> Map.put(:attrs, %{email: Faker.Internet.email, password: "password"})}
  end

  given_ ~r/^An user with an unvalidated account$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An user with an account$/, fn state ->
    attrs = %{email: Faker.Internet.email, password: "password"}
    create(:identity, attrs)
    {:ok, state |> Map.put(:attrs, attrs)}
  end

  when_ ~r/^He sign up with his email and password$/, fn state ->
    %{conn: conn, attrs: attrs} = state
    conn = post(conn, auth_path(conn, :callback, :identity), attrs)
    {:ok, state |> Map.put(:conn, conn)}
  end

  when_ ~r/^He sign up with an email and password$/, fn state ->
    %{conn: conn, attrs: attrs} = state
    post(conn, registration_path(conn, :create), registration: attrs)
    {:ok, state}
  end

  when_ ~r/^He sign up with only an email$/, fn state ->
    {:unimplemted, state}
  end

  when_ ~r/^He sign in with an email and password$/, fn state ->
    {:unimplemted, state}
  end

  when_ ~r/^He asks to recover his password$/, fn state ->
    {:unimplemted, state}
  end

  and_ ~r/^He has receive an recover password url$/, fn state ->
    {:unimplemted, state}
  end


  then_ ~r/^An unconfirmed account is created for this user$/, fn state ->
    %{attrs: %{email: email}} = state
    identity = Repo.get_by(Identity, %{provider: "email", email: email})
    refute identity.confirmed_at
    {:ok, state}
  end

  and_ ~r/^He receives an email with an url to validate his account$/, fn state ->
    %{attrs: %{email: email}} = state
    identity = Repo.get_by(Identity, %{provider: "email", email: email})
    assert_email_sent subject: "Email confirmation", to: identity.email
    {:ok, state}
  end

  then_ ~r/^He receives an signature of his identity$/, fn state ->
    %{conn: conn} = state
    assert json_response(conn, 201)["data"]["token"]
    {:ok, state}
  end
end
