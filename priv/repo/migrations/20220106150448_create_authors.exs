defmodule Bookworm.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :birthplace, :string, default: "unknown"
      add :bio, :text, default: ""

      timestamps()
    end

    create index(:authors, [:birthplace])
  end
end
