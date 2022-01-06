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
      update_attrs = %{bio: "some updated bio", birthplace: "some updated birthplace", name: "some updated name"}

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
end
