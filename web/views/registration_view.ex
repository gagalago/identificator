defmodule Identificator.RegistrationView do
  use Identificator.Web, :view

  def render("show.json", %{identity: identity}) do
    %{data: render_one(identity, Identificator.IdentityView, "identity.json")}
  end
end
