defmodule Blog.Posts.UpdateTest do
  use Blog.DataCase

  @valid_post %{ title: "title", description: "description" }
  @update_valid_post %{ title: "title updated", description: "description updated" }
  @invalid_post %{ title: "", description: nil }

  test "update_post/2 -> success" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, post} = Blog.update_post(post.id, @update_valid_post)

    assert post.title == @update_valid_post.title
    assert post.description == @update_valid_post.description
  end

  test "update_post/2 -> failure" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:error, changeset} = Blog.update_post(post.id, @invalid_post)

    assert changeset.valid? == false
  end
end
