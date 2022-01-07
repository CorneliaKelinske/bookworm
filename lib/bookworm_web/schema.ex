defmodule BookwormWeb.Schema do
  use Absinthe.Schema
  alias Bookworm.Content

  query do
    @desc "Gets a book by id"
    field :book, :book do
      arg(:id, non_null(:id))
      resolve(fn _, %{id: id}, _ ->
        {:ok, Content.get_book!(id)}
      end)
    end

    @desc "Gets a list of all books"
    field :books, list_of(:book) do
      resolve(fn _, _, _ ->
        {:ok, Content.list_books()}
      end)
    end

    @desc "Gets an author by id"
    field :author, :author do
      arg(:id, non_null(:id))
      resolve(fn _, %{id: id}, _ ->
        {:ok, Content.get_author!(id)}
      end)
    end

    @desc "Gets an author by name"
    field :author_by_name, :author do
      arg(:name, non_null(:string))
      resolve(fn _, %{name: name}, _ ->
        {:ok, Content.get_author_by_name(name)}
      end)
    end

    @desc "Gets a list of all authors"
    field :authors, list_of(:author) do
      resolve(fn _, _, _ ->
        {:ok, Content.list_authors()}
      end)
    end

    @desc "Gets genre by id"
    field :genre, :genre do
      arg(:id, non_null(:id))
      resolve(fn _, %{id: id}, _ ->
        {:ok, Content.get_genre!(id)}
      end)
    end

    @desc "Gets a genre by name"
    field :genre_by_name, :genre do
      arg(:name, non_null(:string))
      resolve(fn _, %{name: name}, _ ->
        {:ok, Content.get_genre_by_name(name)}
      end)
    end

    @desc "Gets a list of all genres"
    field :genres, list_of(:genre) do
      resolve(fn _, _, _ ->
        {:ok, Content.list_genres()}
      end)
    end
  end

  @desc "A thing made of paper for reading"
  object :book do
    field :id, :id
    field :title, :string
    field :year, :integer
    field :author, :author
    
    field :genres, list_of(:genre)
  end

  @desc "A person who wrote a book"
  object :author do
    field :id, :id
    field :name, :string
    field :birthplace, :string

    field :books, list_of(:book)
    field :genres, list_of(:genre)
  end

  @desc "A genre of books"
  object :genre do
    field :id, :id
    field :name, :string

    field :books, list_of(:book)
  end
end
