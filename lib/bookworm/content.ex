defmodule Bookworm.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias Bookworm.Repo

  alias Bookworm.Content.Author

  def list_authors do
    Repo.all(Author)
    |> Repo.preload(books: [:genres])
  end


  def get_author!(id) do
    Repo.get!(Author, id)
    |> Repo.preload(books: [:genres])
  end

  def get_author_by_name(name) do
    Repo.get_by(Author, name: name)
   |> Repo.preload(books: [:genres])
  end


  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end


  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end


  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end


  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.changeset(author, attrs)
  end

  alias Bookworm.Content.Book


  def list_books do
    Repo.all(Book)
    |> Repo.preload([:author, :genres])
  end


  def get_book!(id) do
    Repo.get!(Book, id)
    |> Repo.preload([:author, :genres])
  end


  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end


  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end


  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end


  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  alias Bookworm.Content.Genre


  def list_genres do
    Repo.all(Genre)
    |> Repo.preload(books: [:author])
  end


  def get_genre!(id) do
   Repo.get!(Genre, id)
   |> Repo.preload(books: [:author])
  end

  def get_genre_by_name(name) do
    Repo.get_by(Genre, name: name)
   |> Repo.preload(books: [:author])
  end


  def create_genre(attrs \\ %{}) do
    %Genre{}
    |> Genre.changeset(attrs)
    |> Repo.insert()
  end


  def update_genre(%Genre{} = genre, attrs) do
    genre
    |> Genre.changeset(attrs)
    |> Repo.update()
  end


  def delete_genre(%Genre{} = genre) do
    Repo.delete(genre)
  end


  def change_genre(%Genre{} = genre, attrs \\ %{}) do
    Genre.changeset(genre, attrs)
  end

  alias Bookworm.Content.BookGenre


  def list_book_genres do
    Repo.all(BookGenre)
  end


  def get_book_genre!(id), do: Repo.get!(BookGenre, id)


  def create_book_genre(attrs \\ %{}) do
    %BookGenre{}
    |> BookGenre.changeset(attrs)
    |> Repo.insert()
  end


  def update_book_genre(%BookGenre{} = book_genre, attrs) do
    book_genre
    |> BookGenre.changeset(attrs)
    |> Repo.update()
  end


  def delete_book_genre(%BookGenre{} = book_genre) do
    Repo.delete(book_genre)
  end


  def change_book_genre(%BookGenre{} = book_genre, attrs \\ %{}) do
    BookGenre.changeset(book_genre, attrs)
  end
end
