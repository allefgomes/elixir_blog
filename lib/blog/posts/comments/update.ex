defmodule Blog.Posts.Comments.Update do
  alias Blog.{Comment, Repo}

  def call(id, comment_params) do
    comment = Repo.get(Comment, id)
    changeset = Comment.changeset(comment, comment_params)

    case Repo.update(changeset) do
      {:ok, comment} -> {:ok, comment}
      {:error, changeset} -> {:error, changeset, comment}
    end
  end
end
