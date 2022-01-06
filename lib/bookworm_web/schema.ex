defmodule BookwormWeb.Schema do
  use Absinthe.Schema

  query do
    field :book_list, list_of(:book)
  end

  object :book do
    field :id, :id
    field :title, :string
    field :year, :integer
  end
end
