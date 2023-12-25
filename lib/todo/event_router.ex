defmodule Todo.EventRouter do
  alias Todo.Tasks.Commands.DeleteTask
  alias Todo.Tasks.Aggregates.Task
  alias Todo.Tasks.Commands.CreateTask
  use Commanded.Commands.Router

  dispatch([CreateTask, DeleteTask], to: Task, identity: :uuid)
end
