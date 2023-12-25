defmodule Todo.Tasks.Projectors.TaskProjector do
  alias Todo.Tasks.Task
  alias Todo.Tasks.Events.TaskCreated

  use Commanded.Projections.Ecto,
    name: "Todo.Tasks.Projectors.TaskProjector",
    application: Todo.EventApplication,
    # TODO: Move to eventual consistency
    consistency: :strong

  project(%TaskCreated{} = created_event, _, fn multi ->
    Ecto.Multi.insert(multi, :task, %Task{
      uuid: created_event.uuid,
      title: created_event.title,
      order: created_event.order
    })
  end)
end
