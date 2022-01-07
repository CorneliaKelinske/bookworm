defmodule BookwormWeb.Schema do
  use Absinthe.Schema
  alias BookwormWeb.Resolvers

  import_types(__MODULE__.ContentTypes)


  query do
    @desc "Gets a book by id"
    field :book, :book do
      arg(:id, non_null(:id))
      resolve &Resolvers.Content.get_book/3
    end

    @desc "Gets a list of all books"
    field :books, list_of(:book) do
      resolve &Resolvers.Content.books/3
    end

    @desc "Gets an author by id"
    field :author, :author do
      arg(:id, non_null(:id))
      resolve &Resolvers.Content.get_author/3
    end

    @desc "Gets an author by name"
    field :author_by_name, :author do
      arg(:name, non_null(:string))
      resolve &Resolvers.Content.get_author_by_name/3
    end

    @desc "Gets a list of all authors"
    field :authors, list_of(:author) do
      resolve &Resolvers.Content.authors/3
    end

    @desc "Gets genre by id"
    field :genre, :genre do
      arg(:id, non_null(:id))
      resolve &Resolvers.Content.get_book/3

    end

    @desc "Gets a genre by name"
    field :genre_by_name, :genre do
      arg(:name, non_null(:string))
      resolve &Resolvers.Content.get_genre_by_name/3
    end

    @desc "Gets a list of all genres"
    field :genres, list_of(:genre) do
      resolve &Resolvers.Content.genres/3
    end
  end


end
