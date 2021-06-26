defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  def join("comments:" <> post_id, payload, socket) do
    comments = Blog.list_comments(post_id)

    {:ok, %{comments: comments}, socket}
  end

  def handle_in() do
  end
end
