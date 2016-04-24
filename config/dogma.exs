use Mix.Config
alias Dogma.Rule

config :dogma,
  rule_set: Dogma.RuleSet.All,
  exclude: [
    ~r(\Alib/vendor/),
    ~r{\Aconfig/(dev|test)\.exs\Z}
  ],
  override: [
    %Rule.LineLength{max_length: 100},
    %Rule.ModuleDoc{enabled: false}
  ]
