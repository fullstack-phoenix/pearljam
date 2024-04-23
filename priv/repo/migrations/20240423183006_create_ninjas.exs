defmodule Pearljam.Repo.Migrations.CreateNinjas do
  use Ecto.Migration

  def change do
    create table(:ninjas, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :skill, :integer
      add :weapon, :string

      timestamps(type: :utc_datetime)
    end
  end
end
