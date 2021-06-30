defmodule Blog.Posts.Comments.Get do
  alias Blog.{Comment, Repo}

  def call(id) do
    Repo.get(Comment, id)
  end
end
