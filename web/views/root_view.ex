defmodule Identificator.RootView do
  @moduledoc false

  use Identificator.Web, :view

  def public_key do
    secret_key = :guardian |> Application.get_env(Guardian) |> Keyword.get(:secret_key)
    {_module, key} = secret_key.() |> JOSE.JWK.to_public |> JOSE.JWK.to_binary
    key
  end
end
