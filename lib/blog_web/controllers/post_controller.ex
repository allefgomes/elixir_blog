defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  alias Blog.Repo
  alias Blog.Posts.Post

  def index(conn, _params) do
    posts = Repo.all(Post)

    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get(Post, id)

    render(conn, "show.html", post: post)
  end
end
