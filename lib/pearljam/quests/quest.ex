defmodule Pearljam.Quests.Quest do
  use Pearljam.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "quests" do
    field :body, :string
    field :ninja_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
