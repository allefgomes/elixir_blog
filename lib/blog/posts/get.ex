defmodule Blog.Posts.Get do
  alias Blog.{Post, Repo}

  def call(id) do
    Repo.get(Post, id)
  end
end
