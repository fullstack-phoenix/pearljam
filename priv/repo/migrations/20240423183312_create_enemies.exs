defmodule Pearljam.Repo.Migrations.CreateEnemies do
  use Ecto.Migration

  def change do
    create table(:enemies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :skill, :integer
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
