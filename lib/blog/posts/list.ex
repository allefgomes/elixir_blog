defmodule Blog.Posts.List do
  alias Blog.{Post, Repo}

  def call do
    Repo.all(Post)
  end
end
