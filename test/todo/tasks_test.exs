defmodule Todo.TasksTest do
  use Todo.DataCase

  alias Todo.Tasks

  describe "tasks" do
    alias Todo.Tasks.Task

    import Todo.TasksFixtures

    @invalid_attrs %{title: nil, body: nil, order: nil, completed_at: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{title: "some title", body: "some body", order: 42, completed_at: ~N[2023-12-21 15:54:00]}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.title == "some title"
      assert task.body == "some body"
      assert task.order == 42
      assert task.completed_at == ~N[2023-12-21 15:54:00]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body", order: 43, completed_at: ~N[2023-12-22 15:54:00]}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.title == "some updated title"
      assert task.body == "some updated body"
      assert task.order == 43
      assert task.completed_at == ~N[2023-12-22 15:54:00]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
