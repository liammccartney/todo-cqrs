defmodule Todo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :title, :string
    field :body, :string
    field :order, :integer
    field :completed_at, :naive_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :body, :order, :completed_at])
    |> validate_required([:title, :body, :order, :completed_at])
  end
end
