defmodule Blog.Posts.List do
  def call do
    Repo.all(Post)
  end
end
