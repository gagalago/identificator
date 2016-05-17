use Mix.Config

config :ueberauth, Ueberauth,
  providers: [
    identity: {Ueberauth.Strategy.Identity, [
      callback_methods: ["POST"],
      callback_path: "/api/identity/callback"
    ]}
  ]
