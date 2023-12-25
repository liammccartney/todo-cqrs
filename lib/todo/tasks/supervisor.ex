defmodule Todo.Tasks.Supervisor do
  use Supervisor

  alias Todo.Tasks

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_) do
    Supervisor.init(
      [
        Tasks.Projectors.TaskProjector
      ],
      strategy: :one_for_one
    )
  end
end
