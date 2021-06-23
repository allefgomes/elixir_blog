defmodule Blog.Posts.ListTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}

  test "list posts as an empty array" do
    assert Blog.list_posts() == []
  end

  test "list posts as non empty array" do
    {:ok, post} = Blog.create_post(@valid_post)

    assert Blog.list_posts() == [post]
  end
end
