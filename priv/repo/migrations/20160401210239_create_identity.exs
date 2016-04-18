defmodule Identificator.Repo.Migrations.CreateIdentity do
  use Ecto.Migration

  def up do
    execute ~s(CREATE EXTENSION IF NOT EXISTS "uuid-ossp")

    create table(:identities, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :user_id, :uuid, default: fragment("uuid_generate_v4()")
      add :email, :string
      add :provider, :string
      add :provider_id, :string
      add :auth_settings, :map
      add :data, :map

      timestamps
    end

    create unique_index(:identities, [:id])
    create index(:identities, [:user_id])
    create unique_index(:identities, [:provider, :provider_id])
    create unique_index(:identities, [:provider, :email])
  end

  def down do
    drop table(:identities)
  end
end
