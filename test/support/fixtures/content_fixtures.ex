defmodule Bookworm.ContentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookworm.Content` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        birthplace: "some birthplace",
        name: "some name"
      })
      |> Bookworm.Content.create_author()

    author
  end

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        title: "some title",
        year: 42
      })
      |> Bookworm.Content.create_book()

    book
  end
end
