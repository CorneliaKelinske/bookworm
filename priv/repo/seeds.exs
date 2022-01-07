# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookworm.Repo.insert!(%Bookworm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Bookworm.{Content, Repo}
Content.create_author(%{name: "L. Frank Baum", birthplace: "Chittenango, New York"})
Content.create_author(%{name: "Madeleine L'Engle", birhplace: "New York City"})

Content.create_book(%{title: "The Wizard of Oz", year: "1900", author_id: 1})
Content.create_book(%{title: "The Emerald City of Oz", year: "1910", author_id: 1})
Content.create_book(%{title: "A Wrinkle in Time", year: "1962", author_id: 2})

Content.create_author(%{name: "Arthur Conan Doyle", birthplace: "Edinburgh, Scotland"})
Content.create_author(%{name: "Emily Dickinson", birthplace: "Amherst, Massachusetts"})

Content.create_book(%{title: "The Hound of the Baskervilles", year: "1901", author_id: 3})
Content.create_book(%{title: "The Complete Poems of EMily Dickinson", year: "2010", author_id: 4})

Content.create_genre(%{name: "Non-fiction"})
Content.create_genre(%{name: "Children"})
Content.create_genre(%{name: "Fantasy"})
Content.create_genre(%{name: "Science fiction"})
Content.create_genre(%{name: "Mystery"})
Content.create_genre(%{name: "Romance"})
Content.create_genre(%{name: "Horror"})
Content.create_genre(%{name: "Graphic Novels"})
Content.create_genre(%{name: "Manga"})
Content.create_genre(%{name: "Young Adult"})
Content.create_genre(%{name: "Poetry"})

Content.create_book_genre(%{book_id: 1, genre_id: 2})
Content.create_book_genre(%{book_id: 2, genre_id: 2})
Content.create_book_genre(%{book_id: 3, genre_id: 2})
Content.create_book_genre(%{book_id: 3, genre_id: 4})
Content.create_book_genre(%{book_id: 4, genre_id: 5})
Content.create_book_genre(%{book_id: 5, genre_id: 11})
