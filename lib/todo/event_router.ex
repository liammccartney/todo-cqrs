defmodule Todo.EventRouter do
  alias Todo.Tasks.Aggregates.Task
  alias Todo.Tasks.Commands.CreateTask
  use Commanded.Commands.Router

  dispatch([CreateTask], to: Task, identity: :uuid)
end
