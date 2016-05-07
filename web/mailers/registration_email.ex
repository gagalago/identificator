defmodule Identificator.RegistrationEmail do
  use Phoenix.Swoosh, view: Identificator.RegistrationEmailView, layout: {Identificator.LayoutView, :email}

  def confirm(identity) do
    new
    |> to(identity.email)
    |> from("hello@identificator.com")
    |> subject("Email confirmation")
    |> render_body(:confirm, %{confirmation_url: confirmation_url(identity)})
  end

  defp confirmation_url(identity) do
    { :ok, jwt, claims } = Guardian.encode_and_sign(identity)
    { :ok, jwt, claims } = Guardian.refresh!(jwt, claims, %{ttl: { 48, :hours}})
    jwt
  end
end
