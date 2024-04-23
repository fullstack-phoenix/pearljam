defmodule Pearljam.Enemies.Enemy do
  use Pearljam.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "enemies" do
    field :name, :string
    field :description, :string
    field :skill, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(enemy, attrs) do
    enemy
    |> cast(attrs, [:name, :skill, :description])
    |> validate_required([:name, :skill, :description])
  end
end
