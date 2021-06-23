defmodule Blog.Posts.Delete do
  alias Blog.Repo

  def call(id) do
    case Blog.get_post(id) do
      nil -> {:error, "Post not found"}
      post -> Repo.delete(post)
    end
  end
end
