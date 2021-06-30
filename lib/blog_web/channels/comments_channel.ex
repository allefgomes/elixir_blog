defmodule BlogWeb.CommentsChannel do
  use BlogWeb, :channel

  def join("comments:" <> post_id, _payload, socket) do
    comments = Blog.list_comments(post_id)

    {:ok, %{comments: comments}, assign(socket, :post_id, post_id)}
  end

  def handle_in(_name, attrs, socket) do
    response = socket.assigns.post_id
    |> Blog.create_comment(attrs)

    case response do
      {:ok, _comment} ->
         {:reply, :ok, socket}
      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end
end
