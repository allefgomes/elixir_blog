defmodule Blog.Posts.Comments.List do
  alias Blog.Repo

  def call(post_id) do
    post_with_comments =
      post_id
      |> fetch_post()
      |> Repo.preload(:comments)

    post_with_comments.comments
  end

  defp fetch_post(post_id) do
    Blog.get_post(post_id)
  end
end
