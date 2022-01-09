defmodule Bookworm.ContentTest do
  use Bookworm.DataCase

  alias Bookworm.Content

  describe "authors" do
    alias Bookworm.Content.Author

    import Bookworm.ContentFixtures

    @invalid_attrs %{bio: nil, birthplace: nil, name: nil}

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Content.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Content.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{bio: "some bio", birthplace: "some birthplace", name: "some name"}

      assert {:ok, %Author{} = author} = Content.create_author(valid_attrs)
      assert author.bio == "some bio"
      assert author.birthplace == "some birthplace"
      assert author.name == "some name"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()

      update_attrs = %{
        bio: "some updated bio",
        birthplace: "some updated birthplace",
        name: "some updated name"
      }

      assert {:ok, %Author{} = author} = Content.update_author(author, update_attrs)
      assert author.bio == "some updated bio"
      assert author.birthplace == "some updated birthplace"
      assert author.name == "some updated name"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_author(author, @invalid_attrs)
      assert author == Content.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Content.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Content.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Content.change_author(author)
    end
  end

  describe "books" do
    alias Bookworm.Content.Book

    import Bookworm.ContentFixtures

    @invalid_attrs %{title: nil, year: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Content.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Content.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{title: "some title", year: 42}

      assert {:ok, %Book{} = book} = Content.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.year == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{title: "some updated title", year: 43}

      assert {:ok, %Book{} = book} = Content.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.year == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_book(book, @invalid_attrs)
      assert book == Content.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Content.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Content.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Content.change_book(book)
    end
  end

  describe "genres" do
    alias Bookworm.Content.Genre

    import Bookworm.ContentFixtures

    @invalid_attrs %{name: nil}

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Content.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Content.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Genre{} = genre} = Content.create_genre(valid_attrs)
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Genre{} = genre} = Content.update_genre(genre, update_attrs)
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_genre(genre, @invalid_attrs)
      assert genre == Content.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Content.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Content.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Content.change_genre(genre)
    end
  end

  describe "book_genres" do
    alias Bookworm.Content.BookGenre

    import Bookworm.ContentFixtures

    @invalid_attrs %{}

    test "list_book_genres/0 returns all book_genres" do
      book_genre = book_genre_fixture()
      assert Content.list_book_genres() == [book_genre]
    end

    test "get_book_genre!/1 returns the book_genre with given id" do
      book_genre = book_genre_fixture()
      assert Content.get_book_genre!(book_genre.id) == book_genre
    end

    test "create_book_genre/1 with valid data creates a book_genre" do
      valid_attrs = %{}

      assert {:ok, %BookGenre{} = book_genre} = Content.create_book_genre(valid_attrs)
    end

    test "create_book_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_book_genre(@invalid_attrs)
    end

    test "update_book_genre/2 with valid data updates the book_genre" do
      book_genre = book_genre_fixture()
      update_attrs = %{}

      assert {:ok, %BookGenre{} = book_genre} =
               Content.update_book_genre(book_genre, update_attrs)
    end

    test "update_book_genre/2 with invalid data returns error changeset" do
      book_genre = book_genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_book_genre(book_genre, @invalid_attrs)
      assert book_genre == Content.get_book_genre!(book_genre.id)
    end

    test "delete_book_genre/1 deletes the book_genre" do
      book_genre = book_genre_fixture()
      assert {:ok, %BookGenre{}} = Content.delete_book_genre(book_genre)
      assert_raise Ecto.NoResultsError, fn -> Content.get_book_genre!(book_genre.id) end
    end

    test "change_book_genre/1 returns a book_genre changeset" do
      book_genre = book_genre_fixture()
      assert %Ecto.Changeset{} = Content.change_book_genre(book_genre)
    end
  end
end
