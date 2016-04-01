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

  when_ ~r/^He give an email and password$/, fn state ->
    {:unimplemted, state}
  end

  and_ ~r/^He has receive an validation url$/, fn state ->
    {:unimplemted, state}
  end

  when_ ~r/^He ask to recover his password$/, fn state ->
    {:unimplemted, state}
  end

  then_ ~r/^An unconfirmed account is created for this user$/, fn state ->
    {:unimplemted, state}
  end

  when_ ~r/^He go to this url$/, fn state ->
    {:unimplemted, state}
  end

  then_ ~r/^He receive an email with an url to change his password$/, fn state ->
    {:unimplemted, state}
  end

  when_ ~r/^He go on an url to change his password$/, fn state ->
    {:unimplemted, state}
  end

  and_ ~r/^He receive an email with an url to validate his account$/, fn state ->
    {:unimplemted, state}
  end

  then_ ~r/^His account is validated$/, fn state ->
    {:unimplemted, state}
  end

  and_ ~r/^he provide his previous and next password$/, fn state ->
    {:unimplemted, state}
  end

  and_ ~r/^His account is updated$/, fn state ->
    {:unimplemted, state}
  end
end
