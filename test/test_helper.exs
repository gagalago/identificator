Faker.locale :en

{:ok, _} = Application.ensure_all_started(:ex_machina)

ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Identificator.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Identificator.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(Identificator.Repo, :manual)
