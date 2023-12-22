defmodule Todo.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        body: "some body",
        completed_at: ~N[2023-12-21 15:54:00],
        order: 42,
        title: "some title"
      })
      |> Todo.Tasks.create_task()

    task
  end
end
