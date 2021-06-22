defmodule Blog.Posts.List do
  alias Blog.{Repo, Post}

  def call() do
    Repo.all(Post)
  end
end
