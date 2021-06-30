defmodule Blog.Posts.Comments.UpdateTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}
  @valid_comment %{content: "content"}
  @update_valid_comment %{content: "content updated"}
  @update_invalid_comment %{content: ""}

  test "update_post/2 -> success" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, comment} = Blog.create_comment(post.id, @valid_comment)
    {:ok, comment} = Blog.update_comment(comment.id, @update_valid_comment)

    assert comment.content == @update_valid_comment.content
  end

  test "update_post/2 -> failure" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, comment} = Blog.create_comment(post.id, @valid_comment)
    {:error, changeset, _comment} = Blog.update_comment(comment.id, @update_invalid_comment)

    assert changeset.valid? == false
  end
end
