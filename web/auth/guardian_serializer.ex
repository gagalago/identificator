defmodule Identificator.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Identificator.Repo
  alias Identificator.Identity

  def for_token(identity = %Identity{}) do
    { :ok, %{id: identity.id, user_id: identity.user_id} }
  end
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token(%{user_id: _, id: id}) do
    { :ok, Repo.get(Identity, id) }
  end
  def from_token(_), do: { :error, "Unknown resource type" }
end
