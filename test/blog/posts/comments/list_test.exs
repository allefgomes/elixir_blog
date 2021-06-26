defmodule Blog.Posts.Comments.ListTest do
  use Blog.DataCase

  @valid_post %{title: "title", description: "description"}
  @valid_comment %{content: "content"}

  test "list posts as an empty array" do
    {:ok, post} = Blog.create_post(@valid_post)

    post_preload = post |> Blog.Repo.preload(:comments)
    assert Blog.list_comments(post.id) == post_preload
  end

  test "list posts as non empty array" do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, _comment} = Blog.create_comment(post.id, @valid_comment)

    post_preload = post |> Blog.Repo.preload(:comments)
    assert Blog.list_comments(post.id) == post_preload
  end
end
