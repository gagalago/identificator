defmodule Identificator.Contexts.CommonContext do
  use WhiteBread.Context

  given_ ~r/^An signed in user$/, fn state ->
    {:unimplemted, state}
  end
end
