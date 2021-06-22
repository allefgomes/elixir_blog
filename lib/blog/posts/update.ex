defmodule Blog.Posts.Update do
  alias Blog.{Post, Repo}

  def call(id, post_params) do
    post = Repo.get(Post, id)
    changeset = Post.changeset(post, post_params)

    Repo.update(changeset)
  end
end
