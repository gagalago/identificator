defmodule Identificator.Contexts.PasswordContext do
  use WhiteBread.Context

  Faker.locale :en
  use Phoenix.ConnTest
  import Identificator.Router.Helpers
  alias Identificator.Repo
  # The default endpoint for testing
  @endpoint Identificator.Endpoint

  alias Identificator.Identity

  feature_starting_state fn  ->
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Identificator.Repo)
    %{conn: Phoenix.ConnTest.build_conn()}
  end

  given_ ~r/^An unknow user$/, fn state ->
    {:ok, state |> Map.put(:attr, %{email: Faker.Internet.email, password: "password"})}
  end

  given_ ~r/^An user with an unvalidated account$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An user with an account$/, fn state ->
    {:unimplemted, state}
  end

  when_ ~r/^He want to sign up with an email and password$/, fn state ->
    %{conn: conn, attr: attrs} = state
    post(conn, registration_path(conn, :create), registration: attrs)
    {:ok, state}
  end

  when_ ~r/^He want to sign up with only an email$/, fn state ->
    {:unimplemted, state}
  end

  then_ ~r/^An unconfirmed account is created for this user$/, fn state ->
    %{attr: %{email: email}} = state
    identity = Repo.get_by(Identity, %{provider: "email", email: email})
    refute identity.confirmed_at
    {:ok, state}
  end

  and_ ~r/^He receives an email with an url to validate his account$/, fn state ->
    {:unimplemted, state}
  end
end
