defmodule Blog.Posts.Comments.DeleteTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}
  @valid_comment %{content: "content"}

  test "delete_comment/1 -> success" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, comment} = Blog.create_comment(post.id, @valid_comment)

    assert {:ok, _struct} = Blog.delete_comment(comment.id)
  end

  test "delete_comment/1 -> failure" do
    assert {:error, message} = Blog.delete_comment(0)

    assert message == "Comment not found"
  end
end
