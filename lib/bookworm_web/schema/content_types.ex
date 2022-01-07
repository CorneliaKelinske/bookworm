defmodule BookwormWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  alias BookwormWeb.Resolvers

  object :author, description: "A person who writes books" do
    field :id, :id
    field :birthplace, :string
    field :name, :string

    field :books, list_of(:book)
    field :genres, list_of(:genre)
  end

  object :book, description: "A thing of paper, for reading" do
    field :id, :id
    field :title, :string
    field :year, :integer

    field :author, :author do
      resolve(&Resolvers.Content.author_for_book/3)
    end

    field :genres, list_of(:genre) do
      resolve(&Resolvers.Content.genres_for_book/3)
    end
  end

  object :genre, description: "A genre of books" do
    field :id, :id
    field :name, :string

    field :books, list_of(:book) do
      resolve(&Resolvers.Content.books_for_genre/3)
    end
  end
end

