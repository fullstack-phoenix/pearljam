defmodule Pearljam.Ninjas.Ninja do
  use Pearljam.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ninjas" do
    field :name, :string
    field :skill, :integer
    field :weapon, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(ninja, attrs) do
    ninja
    |> cast(attrs, [:name, :skill, :weapon])
    |> validate_required([:name, :skill, :weapon])
  end
end
