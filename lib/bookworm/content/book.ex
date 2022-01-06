defmodule Bookworm.Content.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :year, :integer

    belongs_to :author, Bookworm.Content.Author

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :year, :author_id])
    |> validate_required([:title, :year, :author_id])
  end
end
