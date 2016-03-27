use Mix.Config

config :guardian, Guardian,
  allowed_algos: ["RS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "identificator",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "<guardian secret key>",
  serializer: MyApp.GuardianSerializer
