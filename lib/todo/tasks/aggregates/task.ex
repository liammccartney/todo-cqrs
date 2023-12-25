defmodule Todo.Tasks.Aggregates.Task do
  defstruct [:uuid, :title, :completed, :order]

  alias Todo.Tasks.Events.TaskDeleted
  alias Todo.Tasks.Commands.DeleteTask
  alias Todo.Tasks.Aggregates.Task
  alias Todo.Tasks.Commands.CreateTask
  alias Todo.Tasks.Events.TaskCreated

  def execute(%Task{uuid: nil}, %CreateTask{} = command),
    do: %TaskCreated{
      uuid: command.uuid,
      title: command.title,
      completed: command.completed,
      order: command.order
    }
  
  def execute(%Task{}, %DeleteTask{} = command),
    do: %TaskDeleted{
      uuid: command.uuid,
    }

  def apply(%Task{} = task, %TaskCreated{} = event) do
    %Task{
      task
      | uuid: event.uuid,
        title: event.title,
        completed: event.completed,
        order: event.order
    }
  end

  def apply(%Task{} = task, %TaskDeleted{}) do
    task
  end
end
