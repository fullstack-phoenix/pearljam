defmodule Pearljam.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :text
      add :ninja_id, references(:ninjas, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:quests, [:ninja_id])
  end
end
