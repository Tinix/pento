defmodule Pento.Repo.Migrations.CreateBlog do
  use Ecto.Migration

  def change do
    create table(:blog) do
      add :title, :string
      add :content, :text

      timestamps(type: :utc_datetime)
    end
  end
end
