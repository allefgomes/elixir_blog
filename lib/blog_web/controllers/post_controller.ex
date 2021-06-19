defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  def index(conn, _params) do
    posts = [
      %{id: 1, title: "Post 1", url: "#"},
      %{id: 2, title: "Post 2", url: "#"},
      %{id: 3, title: "Post 3", url: "#"},
      %{id: 4, title: "Post 4", url: "#"}
    ]

    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = %{id: id, title: "Post 1", url: "#"}

    render(conn, "show.html", post: post)
  end
end
