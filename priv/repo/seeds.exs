# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HelloPhx.Repo.insert!(%HelloPhx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias HelloPhx.Repo
alias HelloPhx.Generic.Message

Repo.insert!(%Message{text: "test"})
Repo.insert!(%Message{text: "test2"})
Repo.insert!(%Message{text: "test3"})
Repo.insert!(%Message{text: "test4"})
Repo.insert!(%Message{text: "test5"})
