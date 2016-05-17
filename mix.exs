defmodule Identificator.Mixfile do
  use Mix.Project

  def project do
    [
      app: :identificator,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      preferred_cli_env: ["white_bread.run": :test],
      aliases: aliases,
      deps: deps
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Identificator, []},
      applications: app_list(Mix.env)
    ]
  end

  defp app_list(:dev), do: [:dotenv | app_list]
  defp app_list(_), do: app_list
  defp app_list do
    [
      :phoenix, :phoenix_html, :cowboy, :logger, :gettext, :phoenix_ecto, :postgrex, :swoosh,
      :phoenix_swoosh, :ueberauth_identity
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support", "features"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.2-rc"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_ecto, "~> 3.0-rc"},
      {:phoenix_html, "~> 2.4"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:comeonin, "~> 2.4" },
      {:guardian, "~> 0.11.1"},
      {:ueberauth_identity, "~> 0.2"},
      {:cutkey, github: "potatosalad/cutkey"},
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:dogma, "~> 0.1", only: [:dev, :test]},
      {:white_bread, "~> 2.7", only: :test},
      {:ex_machina, "~> 0.6", only: :test},
      {:faker, "~> 0.6", only: :test},
      {:swoosh, "~> 0.3.0"},
      {:dotenv, "~> 2.1", only: [:dev, :test]},
      {:phoenix_swoosh, github: "gagalago/phoenix_swoosh", branch: "phoenix-12"}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup":      ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset":      ["ecto.drop", "ecto.setup"],
      "test":            ["ecto.create --quiet", "ecto.migrate", "test"],
      "white_bread.run": ["ecto.create --quiet", "ecto.migrate", "white_bread.run"]
    ]
  end
end
