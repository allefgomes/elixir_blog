defmodule Blog.Posts.DeleteTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}

  test "delete_post/1 -> success" do
    {:ok, post} = Blog.create_post(@valid_post)

    assert {:ok, _struct} = Blog.delete_post(post.id)
  end

  test "delete_post/1 -> failure" do
    assert {:error, message} = Blog.delete_post(0)

    assert message == "Post not found"
  end
end
