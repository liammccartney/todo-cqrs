defmodule Todo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :body, :string
      add :order, :integer
      add :completed_at, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
