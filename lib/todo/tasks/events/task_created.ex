defmodule Todo.Tasks.Events.TaskCreated do

  @derive Jason.Encoder
  defstruct [:uuid, :title, :completed, :order]
end
