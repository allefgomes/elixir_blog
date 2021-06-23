defmodule BlogWeb.PostsControllerTest do
  use BlogWeb.ConnCase

  @valid_post %{title: "title", description: "description"}
  @update_valid_post %{title: "title update", description: "description update"}
  @update_invalid_post %{title: "", description: "description update"}
  @invalid_post %{title: "", description: ""}

  test "GET /posts", %{conn: conn} do
    {:ok, post} = Blog.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :index))

    assert html_response(conn, 200) =~ post.title
  end

  test "GET /posts/:id", %{conn: conn} do
    {:ok, post} = Blog.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :show, post))

    assert html_response(conn, 200) =~ post.title
  end

  test "GET /posts/new", %{conn: conn} do
    conn = get(conn, Routes.post_path(conn, :new))

    assert html_response(conn, 200) =~ "Create Post"
  end

  test "GET /posts/:id/edit", %{conn: conn} do
    {:ok, post} = Blog.create_post(@valid_post)
    conn = get(conn, Routes.post_path(conn, :edit, post))

    assert html_response(conn, 200) =~ "Edit Post"
  end

  describe "POST /posts" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.post_path(conn, :create), post: @valid_post)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.post_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.post_path(conn, :create), post: @invalid_post)
      assert html_response(conn, 200) =~ "Create Post"
    end
  end

  describe "PUT /posts/:id" do
    test "redirects to show when data is valid", %{conn: conn} do
      {:ok, post} = Blog.create_post(@valid_post)
      conn = put(conn, Routes.post_path(conn, :update, post), post: @update_valid_post)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.post_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      {:ok, post} = Blog.create_post(@valid_post)
      conn = put(conn, Routes.post_path(conn, :update, post), post: @update_invalid_post)
      assert html_response(conn, 200) =~ "Edit Post"
    end
  end

  describe "DELETE /posts/:id" do
    test "deletes chosen post", %{conn: conn} do
      {:ok, post} = Blog.create_post(@valid_post)
      conn = delete(conn, Routes.post_path(conn, :delete, post))
      assert redirected_to(conn) == Routes.post_path(conn, :index)
    end

    test "redirect to index when deletes chosen post", %{conn: conn} do
      {:ok, post} = Blog.create_post(@valid_post)
      Blog.delete_post(post.id)

      conn = get(conn, Routes.post_path(conn, :show, post))
      assert redirected_to(conn) == Routes.post_path(conn, :index)
    end
  end
end
