defmodule Blog.Posts.Delete do
  alias Blog.{Repo, Post}

  def call(id) do
    Repo.get(Post, id)
    |> Repo.delete!()
  end
end
