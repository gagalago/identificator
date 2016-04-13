defmodule Identificator.DefaultContext do
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

  given_ ~r/^An signed in user$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An signed out user with an account and an email$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An user with an unvalidated email and password identity$/, fn state ->
    {:unimplemted, state}
  end

  given_ ~r/^An signed out user with an account and an email on a provider$/, fn state ->
    {:unimplemted, state}
  end
end
