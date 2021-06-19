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

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})

    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{ "post" => post }) do
    post = Post.changeset(%Post{}, post)
    |> Repo.insert()

    case post do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post was created sucessfully!")
        |> redirect(to: Routes.post_path(conn, :show, post))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
