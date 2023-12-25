defmodule Todo.Tasks.Commands.CreateTask do
  alias Todo.Tasks.Commands.CreateTask
  defstruct [:uuid, :title, :completed, :order]

  use ExConstructor

  def set_uuid(%CreateTask{uuid: nil} = create, uuid) do
    %CreateTask{create | uuid: uuid}
  end

  def set_uuid(%CreateTask{} = create, _) do
    create
  end
end
