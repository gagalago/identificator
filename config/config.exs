# This file is responsible for configuring your application and its dependencies with the aid of
# the Mix.Config module.
#
# This configuration file is loaded before any dependency and is restricted to this project.
use Mix.Config

# Configures the endpoint
config :identificator, Identificator.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "nTbE27Caxz1UIG6WRO2fzMJZ0t0tlvXNOFfNAxkMQPtRcS5CfVPPn4cIQK0pikhB",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Identificator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom of this file so it overrides
# the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

import_config "guardian.exs"

config :identificator, Identificator.Gettext, default_locale: "en"
