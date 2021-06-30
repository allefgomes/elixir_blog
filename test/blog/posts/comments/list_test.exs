defmodule Blog.Posts.Comments.ListTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}
  @valid_comment %{content: "content"}

  test "list posts as an empty array" do
    {:ok, post} = Blog.create_post(@valid_post)

    assert Blog.list_comments(post.id) == []
  end

  test "list posts as non empty array" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, comment} = Blog.create_comment(post.id, @valid_comment)

    assert Blog.list_comments(post.id) == [comment]
  end
end
