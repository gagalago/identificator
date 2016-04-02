defmodule Identificator.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Identificator.Repo
  alias Identificator.Identity

  def factory(:identity) do
    %Identity{
      auth_settings: %{},
      data: %{},
      email: Faker.Internet.email,
      id: Ecto.UUID.generate,
      provider: "email",
      user_id: Ecto.UUID.generate
    }
  end
end
