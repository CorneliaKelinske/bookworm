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

  object :author_result do
    field :author, :author
    field :errors, list_of(:input_error)
  end

  @desc "The input to create an author"
  input_object :author_input do
    field :birthplace, :string
    field :name, :string
  end

  @desc "The input to create a book"
  input_object :book_input do
    field :author_id, :id
    field :title, :string
    field :year, :integer
  end

  @desc "The input to create a genre"
  input_object :genre_input do
    field :name, :string
  end

  object :book_result do
    field :book, :book
    field :errors, list_of(:input_error)
  end

  object :genre_result do
    field :genre, :genre
    field :errors, list_of(:input_error)
  end

  @desc "Ecto changeset errors from an input"
  object :input_error do
    field :key, :string
    field :message, :string
    field :details, :string
  end
end
