defmodule BookwormWeb.Schema do
  use Absinthe.Schema
  alias Bookworm.Content

  query do
    field :books, list_of(:book), description: "A list of books" do
      resolve fn _, _, _ ->
        {:ok, Content.list_books()}
      end
    end
    field :authors, list_of(:author), description: "A list of authors" do
      resolve fn _, _, _ ->
        {:ok, Content.list_authors()}
      end
    end
  end

  @desc "A thing made of paper for reading"
  object :book do
    field :id, :id
    field :title, :string
    field :year, :integer
    field :author, :author
  end

  @desc "A person who wrote a book"
  object :author do
    field :id, :id
    field :name, :string
    field :birthplace, :string

    field :books, list_of(:book)
  end
end
