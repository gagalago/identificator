defmodule Identificator.Contexts.PasswordContext do
  use WhiteBread.Context

  given_ ~r/^An unknow user$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An user with an unvalidated account$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An user with an account$/, fn state ->
    {:unimplemted, state}
  end
end
