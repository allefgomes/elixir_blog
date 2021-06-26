defmodule Blog.Posts.Comments.Create do
  alias Blog.{Comment, Repo}

  def call(post_id, attrs \\ %{}) do
    fetch_post(post_id)
    |> Ecto.build_assoc(:comments)
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  defp fetch_post(post_id) do
    Blog.get_post(post_id)
  end
end
