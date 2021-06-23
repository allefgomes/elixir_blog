defmodule Blog.Posts.GetTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}

  test "get a post by id" do
    {:ok, post} = Blog.create_post(@valid_post)

    assert Blog.get_post(post.id) == post
  end

  test "return error when don't find a post with invalid id" do
    assert nil == Blog.get_post(0)
  end
end
