defmodule Identificator.RegistrationMailer do
  import Swoosh.Email

  def confirm(identity) do
    new
    |> to(identity.email)
    |> from("hello@identificator.com")
    |> subject("Email confirmation")
    |> html_body("<h1>Hello #{identity.email}</h1>")
    |> text_body("Hello #{identity.email}\n")
  end
end
