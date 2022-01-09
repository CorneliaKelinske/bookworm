defmodule BookwormWeb.Schema do
  use Absinthe.Schema
  alias BookwormWeb.Resolvers

  import_types(__MODULE__.ContentTypes)

  query do
    @desc "Gets a book by id"
    field :book, :book do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Content.get_book/3)
    end

    @desc "Gets a list of all books"
    field :books, list_of(:book) do
      resolve(&Resolvers.Content.books/3)
    end

    @desc "Gets an author by id"
    field :author, :author do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Content.get_author/3)
    end

    @desc "Gets an author by name"
    field :author_by_name, :author do
      arg(:name, non_null(:string))
      resolve(&Resolvers.Content.get_author_by_name/3)
    end

    @desc "Gets a list of all authors"
    field :authors, list_of(:author) do
      resolve(&Resolvers.Content.authors/3)
    end

    @desc "Gets genre by id"
    field :genre, :genre do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Content.get_book/3)
    end

    @desc "Gets a genre by name"
    field :genre_by_name, :genre do
      arg(:name, non_null(:string))
      resolve(&Resolvers.Content.get_genre_by_name/3)
    end

    @desc "Gets a list of all genres"
    field :genres, list_of(:genre) do
      resolve(&Resolvers.Content.genres/3)
    end
  end

  mutation do
    @desc "Creates an author"
    field :create_author, :author_result do
      arg(:input, non_null(:author_input))
      resolve(&Resolvers.Content.create_author/3)
    end

    @desc "Creates a book"
    field :create_book, :book_result do
      arg(:input, non_null(:book_input))
      resolve(&Resolvers.Content.create_book/3)
    end

    @desc "Creates a genre"
    field :create_genre, :genre_result do
      arg(:input, non_null(:genre_input))
      resolve(&Resolvers.Content.create_genre/3)
    end

    @desc "Updates an author"
    field :update_author, :author_result do
      arg(:id, non_null(:id))
      arg(:attrs, non_null(:author_input))
      resolve(&Resolvers.Content.update_author/3)
    end

    @desc "Updates a book"
    field :update_book, :book_result do
      arg(:id, non_null(:id))
      arg(:attrs, non_null(:book_input))
      resolve(&Resolvers.Content.update_book/3)
    end

    @desc "Updates a genre"
    field :update_genre, :genre_result do
      arg(:id, non_null(:id))
      arg(:attrs, non_null(:genre_input))
      resolve(&Resolvers.Content.update_genre/3)
    end
  end
end
