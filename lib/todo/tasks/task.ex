defmodule Todo.Tasks.Task do
  alias Todo.Tasks.Task
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: false}
  @derive {Phoenix.Param, key: :uuid}

  schema "tasks" do
    field :title, :string
    field :order, :integer, default: 0
    field :completed_at, :utc_datetime
  end

  def set_uuid(%Task{uuid: nil} = task) do
    %Task{task | uuid: Ecto.UUID.generate()}
  end

  def set_uuid(%Task{uuid: _} = task) do
    task
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> set_uuid()
    |> cast(attrs, [:title, :order, :completed_at])
  end
end
