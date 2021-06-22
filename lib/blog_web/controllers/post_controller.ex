defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  alias Blog.{Post}

  def index(conn, _params) do
    posts = Blog.list_posts()

    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Blog.get_post(id)

    render(conn, "show.html", post: post)
  end

  def new(conn, _params) do
    changeset = Post.changeset(%{})

    conn
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post}) do
    case Blog.create_post(post) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post was created sucessfully!")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    post = Blog.get_post(id)
    changeset = Post.changeset(post, %{})

    conn
    |> render("edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post}) do
    IO.inspect(post)

    case Blog.update_post(id, post) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post was updated sucessfully!")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Blog.delete_post(id)

    conn
    |> put_flash(:info, "Post was deleted sucessfully!")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
