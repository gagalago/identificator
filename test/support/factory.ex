defmodule Identificator.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Identificator.Repo
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
end
