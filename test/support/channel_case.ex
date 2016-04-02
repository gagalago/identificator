defmodule Identificator.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by channel tests.

  Such tests rely on `Phoenix.ChannelTest` and also imports other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database, it must use the tag :db. For this reason,
  every test runs inside a transaction which is reset at the   beginning of the test if the test
  case is marked as db.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      use Phoenix.ChannelTest

      alias Identificator.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]


      # The default endpoint for testing
      @endpoint Identificator.Endpoint
    end
  end

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Identificator.Repo)

    :ok
  end
end
