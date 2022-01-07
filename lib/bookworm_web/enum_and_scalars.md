defmodule BookwormWeb.Schema do
  use Absinthe.Schema
  alias Bookworm.Content

  query do
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

    @desc "Lists all authors"
    field :authors, list_of(:author) do
      resolve(fn _, _, _ ->
        {:ok, Content.list_authors()}
      end)
    end

    @desc "Gets a book by id"
    field :book, :book do
      arg(:id, non_null(:id))

      resolve(fn _, %{id: id}, _ ->
        {:ok, Content.get_book!(id)}
      end)
    end

    @desc "Lists all books"
    field :book_list, list_of(:book) do
      resolve(fn _, _, _ ->
        {:ok, Content.list_books()}
      end)
    end

    field :random_direction, :cardinal_direction do
      resolve(fn _, _, _ ->
        case Enum.random(1..4) do
          1 -> {:ok, :north}
          2 -> {:ok, :east}
          3 -> {:ok, :south}
          4 -> {:ok, :west}
        end
      end)
    end

    @desc "Today's date"
    field :today, :date do
      resolve(fn _, _, _ ->
        {:ok, Date.utc_today()}
      end)
    end

    @desc "A day that never happened"
    field :neverday, :date do
      resolve(fn _, _, _ ->
        Date.from_iso8601("2020-10-32")
      end)
    end

    @desc "A malformed date"
    field :malformed_day, :date do
      resolve(fn _, _, _ ->
        Date.from_iso8601("25-01-10")
      end)
    end
  end

  object :author, description: "A person who writes books" do
    field :id, :id
    field :birthplace, :string
    field :name, :string

    field :books, list_of(:book)
  end

  object :book, description: "A thing of paper, for reading" do
    field :id, :id
    field :title, :string
    field :year, :integer

    field :author, :author
  end

  enum :cardinal_direction, description: "North, east, south or west" do
    value(:north)
    value(:east)
    value(:south)
    value(:west)
  end

  scalar :date, description: "A date with a year, a month and a day (ISO8601)" do
    parse(fn input ->
      case Date.from_iso8601(input.value) do
        {:ok, date} -> {:ok, date}
        _ -> :error
      end
    end)

    serialize(fn date_struct ->
      Date.to_iso8601(date_struct)
    end)
  end
end
