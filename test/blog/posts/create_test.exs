defmodule Blog.Posts.CreateTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}
  @invalid_post %{title: "", description: nil}

  test "create_post/1 -> success" do
    {:ok, post} = Blog.create_post(@valid_post)

    assert post.title == @valid_post.title
    assert post.description == @valid_post.description
  end

  test "create_post/1 -> failure" do
    {:error, changeset} = Blog.create_post(@invalid_post)

    assert changeset.valid? == false
  end
end
