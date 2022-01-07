defmodule Bookworm.Content.BookGenre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_genres" do

    field :book_id, :id
    field :genre_id, :id

    timestamps()
  end

  @doc false
  def changeset(book_genre, attrs) do
    book_genre
    |> cast(attrs, [:book_id, :genre_id])
    |> validate_required([:book_id, :genre_id])
  end
end
