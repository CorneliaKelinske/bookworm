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
