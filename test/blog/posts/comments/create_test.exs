defmodule Blog.Posts.Comments.CreateTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}
  @valid_comment %{content: "content"}
  @invalid_comment %{content: ""}

  test "create_comment/2 -> success" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, comment} = Blog.create_comment(post.id, @valid_comment)

    assert comment.content == @valid_comment.content
  end

  test "create_comment/2 -> failure" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:error, changeset} = Blog.create_comment(post.id, @invalid_comment)

    assert changeset.valid? == false
  end
end
