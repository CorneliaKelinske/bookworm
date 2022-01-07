defmodule Bookworm.Content.Genre do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bookworm.Content.Book

  schema "genres" do
    field :name, :string

    many_to_many :books, Book, join_through: "book_genres"

    timestamps()
  end

  @doc false
  def changeset(genre, attrs) do
    genre
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
