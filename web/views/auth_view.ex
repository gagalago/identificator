defmodule Identificator.AuthView do
  use Identificator.Web, :view

  def render("callback.json", %{identity: identity, token: token}) do
    %{data: render_one(%{identity: identity, token: token}, Identificator.AuthView, "token.json")}
  end

  def render("token.json", %{auth: %{identity: identity, token: token}}) do
    identity |> render_one(Identificator.IdentityView, "identity.json") |> Map.put(:token, token)
  end
end
