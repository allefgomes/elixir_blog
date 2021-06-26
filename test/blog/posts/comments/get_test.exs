defmodule Blog.Posts.Comments.GetTest do
  use Blog.DataCase

  @valid_comment %{content: "content"}
  @valid_post %{title: "title", description: "description"}

  test "get a post by id" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, comment} = Blog.create_comment(post.id, @valid_comment)

    assert Blog.get_comment(comment.id) == comment
  end

  test "return error when don't find a post with invalid id" do
    assert nil == Blog.get_comment(0)
  end
end
