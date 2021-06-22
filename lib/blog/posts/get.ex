defmodule Blog.Posts.Get do
  def call(id) do
    Repo.get(Post, id)
  end
end
