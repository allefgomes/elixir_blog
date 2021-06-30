defmodule Blog.Posts.Comments.Delete do
  alias Blog.Repo

  def call(id) do
    case Blog.get_comment(id) do
      nil -> {:error, "Comment not found"}
      comment -> Repo.delete(comment)
    end
  end
end
