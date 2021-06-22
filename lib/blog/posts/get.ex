defmodule Blog.Posts.Get do
  alias Blog.{Repo, Post}

  def call(id) do
    Repo.get(Post, id)
  end
end
