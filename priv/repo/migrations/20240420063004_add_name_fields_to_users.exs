defmodule Pearljam.Repo.Migrations.AddNameFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string, default: "user", null: false
      add :first_name, :string
      add :last_name, :string
      add :name, :string
      add :image, :string

      add :data, :map
    end

    create index(:users, :data, using: "gin")
  end
end
