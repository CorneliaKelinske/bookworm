defmodule BookwormWeb.Resolvers.Content do
  alias Bookworm.Content

  def authors(_, _, _) do
    {:ok, Content.list_authors()}
  end

  def get_author(_, %{id: id}, _) do
    {:ok, Content.get_author!(id)}
  end

  def get_author_by_name(_, %{name: name}, _) do
    {:ok, Content.get_author_by_name(name)}
  end

  def author_for_book(book, _, _) do
    {:ok, Content.get_author!(book.author_id)}
  end

  def get_book(_, %{id: id}, _) do
    {:ok, Content.get_book!(id)}
  end

  def books(_, _, _) do
    {:ok, Content.list_books()}
  end

  def get_genre(_, %{id: id}, _) do
    {:ok, Content.get_genre!(id)}
  end

  def get_genre_by_name(_, %{name: name}, _) do
    {:ok, Content.get_genre_by_name(name)}
  end

  def genres(_, _, _) do
    {:ok, Content.list_genres()}
  end

  def books_for_genre(genre, _, _) do
    query = Ecto.assoc(genre, :books)
    {:ok, Bookworm.Repo.all(query)}
  end

  def genres_for_book(book, _, _) do
    query = Ecto.assoc(book, :genres)
    {:ok, Bookworm.Repo.all(query)}
  end
end
