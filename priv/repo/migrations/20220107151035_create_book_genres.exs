defmodule Bookworm.Repo.Migrations.CreateBookGenres do
  use Ecto.Migration

  def change do
    create table(:book_genres) do
      add :book_id, references(:books, on_delete: :delete_all)
      add :genre_id, references(:genres, on_delete: :delete_all)

      timestamps()
    end

    create index(:book_genres, [:book_id])
    create index(:book_genres, [:genre_id])
    create unique_index(:book_genres, [:book_id, :genre_id])
  end
end
