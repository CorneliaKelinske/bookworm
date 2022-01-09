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

  def create_author(_, %{input: params}, _) do
    case Content.create_author(params) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create author!",
          details:
            Ecto.Changeset.traverse_errors(
              changeset,
              fn {msg, _opts} -> msg end
            )
        }

      {:ok, author} ->
        {:ok, %{author: author}}
    end
  end

  def get_book(_, %{id: id}, _) do
    {:ok, Content.get_book!(id)}
  end

  def books(_, _, _) do
    {:ok, Content.list_books()}
  end

  def create_book(_, %{input: params}, _) do
    case Content.create_book(params) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create book!",
          details:
            Ecto.Changeset.traverse_errors(
              changeset,
              fn {msg, _opts} -> msg end
            )
        }

      {:ok, book} ->
        {:ok, %{book: book}}
    end
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

  def create_genre(_, %{input: params}, _) do
    case Content.create_genre(params) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create genre!",
          details:
            Ecto.Changeset.traverse_errors(
              changeset,
              fn {msg, _opts} -> msg end
            )
        }

      {:ok, genre} ->
        {:ok, %{genre: genre}}
    end
  end

  def update_author(_, %{id: id, attrs: attrs}, _) do
    with author <- Content.get_author!(id),
      {:ok, updated} <- Content.update_author(author, attrs) do
        {:ok, %{author: updated}}
      else
        {:error, changeset} ->
          {
            :error,
            message: "Could not update author!",
            details: Ecto.Changeset.traverse_errors(
              changeset,
              fn {msg, _opts} -> msg end
            )
          }
      end
  end

  def update_book(_, %{id: id, attrs: attrs}, _) do
    with book <- Content.get_book!(id),
      {:ok, updated} <- Content.update_book(book, attrs) do
        {:ok, %{book: updated}}
      else
        {:error, changeset} ->
          {
            :error,
            message: "Could not update book!",
            details: Ecto.Changeset.traverse_errors(
              changeset,
              fn {msg, _opts} -> msg end
            )
          }
      end
  end

  def update_genre(_, %{id: id, attrs: attrs}, _) do
    with genre <- Content.get_genre!(id),
      {:ok, updated} <- Content.update_genre(genre, attrs) do
        {:ok, %{genre: updated}}
      else
        {:error, changeset} ->
          {
            :error,
            message: "Could not update genre!",
            details: Ecto.Changeset.traverse_errors(
              changeset,
              fn {msg, _opts} -> msg end
            )
          }
      end
  end

  # Relational helpers

  def books_for_genre(genre, _, _) do
    query = Ecto.assoc(genre, :books)
    {:ok, Bookworm.Repo.all(query)}
  end

  def genres_for_book(book, _, _) do
    query = Ecto.assoc(book, :genres)
    {:ok, Bookworm.Repo.all(query)}
  end
end
