defmodule Bookworm.Content.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :bio, :string, default: ""
    field :birthplace, :string, default: "unknown"
    field :name, :string

    has_many :books, Bookworm.Content.Book

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :birthplace, :bio])
    |> validate_required([:name])
  end
end
