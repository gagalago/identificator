defmodule WhiteBread.Example.Config do
  use WhiteBread.SuiteConfiguration

  context_per_feature namespace_prefix: Identificator.Contexts,
                      entry_path: "features/",
                      extra: [run_async: true]
end
