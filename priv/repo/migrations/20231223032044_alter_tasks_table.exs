defmodule Todo.Repo.Migrations.AlterTasksTable do
  use Ecto.Migration

  def change do
    drop table(:tasks)

    create table(:tasks, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :title, :string
      add :completed_at, :utc_datetime
      add :order, :integer, default: 0
    end
  end
end
