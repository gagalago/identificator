defmodule Identificator.Repo.Migrations.AddConfirmationOnIdentity do
  use Ecto.Migration

  def change do
    alter table(:identities) do
      add :confirmed_at, :datetime
    end
  end
end
