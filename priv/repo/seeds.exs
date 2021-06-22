# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Blog.Repo.insert!(%Blog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Blog.DatabaseSeeder do
  alias Blog.Repo
  alias Blog.Post

  def insert_post(number) do
    post = Post.changeset(
      %{
        title: "Post #{number}",
        description: "#{number} - It is a long established fact that a reader will be distracted by the readable content of a(injected humour and the like)."
      }
    )

    Repo.insert!(post)
  end
end

(1..10) |> Enum.each(fn number -> Blog.DatabaseSeeder.insert_post(number) end)
