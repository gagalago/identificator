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
      applications: [:phoenix, :phoenix_html, :cowboy, :logger, :gettext, :phoenix_ecto, :postgrex]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, github: "phoenixframework/phoenix", branch: "jv-ecto-2", override: true},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_ecto, ">= 3.0.0-rc"},
      {:phoenix_html, "~> 2.4"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:comeonin, "~> 2.4" },
      {:guardian, github: "potatosalad/guardian", branch: "master"},
      {:cutkey, github: "potatosalad/cutkey"},
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:dogma, "~> 0.1.4", only: [:dev, :test]},
      {:white_bread, "~> 2.6", only: [:dev, :test]},
      {:ex_machina, "~> 0.6.1", only: :test},
      {:faker, "~> 0.6", only: :test}
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
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test":       ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
