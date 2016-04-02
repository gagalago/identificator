defmodule Identificator.IdentityView do
  use Identificator.Web, :view

  def render("index.json", %{identities: identities}) do
    %{data: render_many(identities, Identificator.IdentityView, "identity.json")}
  end

  def render("show.json", %{identity: identity}) do
    %{data: render_one(identity, Identificator.IdentityView, "identity.json")}
  end

  def render("identity.json", %{identity: identity}) do
    %{
      id: identity.id,
      user_id: identity.user_id,
      email: identity.email,
      provider: identity.provider,
      auth_settings: identity.auth_settings,
      data: identity.data
    }
  end
end
