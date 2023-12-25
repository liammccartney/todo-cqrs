defmodule Todo.Tasks.Events.TaskDeleted do
  @derive Jason.Encoder
  defstruct [:uuid]
  
end
