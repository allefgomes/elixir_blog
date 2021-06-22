defmodule Blog.Posts.Delete do
  def call(id) do
    Repo.get(Post, id)
    |> Repo.delete!()
  end
end
