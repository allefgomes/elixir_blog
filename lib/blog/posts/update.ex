defmodule Blog.Posts.Update do
  alias Blog.{Post, Repo}

  def call(id, post_params) do
    post = Repo.get(Post, id)
    changeset = Post.changeset(post, post_params)

    case Repo.update(changeset) do
      {:ok, post} -> {:ok, post}
      {:error, changeset} -> {:error, changeset, post}
    end
  end
end
