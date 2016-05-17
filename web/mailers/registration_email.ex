defmodule Identificator.RegistrationEmail do
  alias Identificator.RegistrationEmailView
  alias Identificator.LayoutView
  use Phoenix.Swoosh, view: RegistrationEmailView, layout: {LayoutView, :email}

  def confirm(identity, token) do
    new
    |> to(identity.email)
    |> from("hello@identificator.com")
    |> subject("Email confirmation")
    |> render_body(:confirm, %{confirmation_url: token})
  end
end
