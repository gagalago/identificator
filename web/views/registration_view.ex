defmodule Identificator.RegistrationView do
  use Identificator.Web, :view

  def render("show.json", %{identity: identity, token: token}) do
    %{data: render_one(%{identity: identity, token: token}, Identificator.AuthView, "token.json")}
  end
end
