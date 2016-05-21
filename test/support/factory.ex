defmodule Identificator.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Identificator.Repo
  import Comeonin.Pbkdf2, only: [hashpwsalt: 1]
  alias Identificator.Identity

  def factory(:identity) do
    %Identity{
      auth_settings: %{},
      data: %{},
      email: Faker.Internet.email,
      provider: "email",
      provider_id: Ecto.UUID.generate,
      user_id: Ecto.UUID.generate
    }
  end

  def with_password(identity) do
    password = "password"
    %{identity | auth_settings: %{password: hashpwsalt(password)}, password: password}
  end
end
