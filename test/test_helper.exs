ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Identificator.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Identificator.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Identificator.Repo)

