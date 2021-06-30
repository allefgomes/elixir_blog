defmodule BlogWeb.CommentsChannelTest do
  use BlogWeb.ChannelCase
  alias BlogWeb.UserSocket

  @valid_post %{title: "title", description: "description"}

  setup do
    {:ok, post} = Blog.create_post(@valid_post)
    {:ok, socket} = connect(UserSocket, %{})

    {:ok, socket: socket, post: post}
  end

  test "should connect to socket", %{socket: socket, post: post} do
    assert {:ok, comments, socket} = subscribe_and_join(socket, "comments:#{post.id}", %{})
    assert post.id == String.to_integer(socket.assigns.post_id)
    assert [] == comments.comments
  end

  test "should create a comment", %{socket: socket, post: post} do
    {:ok, _comments, socket} = subscribe_and_join(socket, "comments:#{post.id}", %{})

    ref = push(socket, "comment:add", %{"content" => "Comment 1"})

    msg = %{ comment: %{ content: "Comment 1" } }
    assert_reply ref, :ok, %{}

    refute is_nil(msg)
  end

  test "should return error when content is nil", %{socket: socket, post: post} do
    {:ok, _comments, socket} = subscribe_and_join(socket, "comments:#{post.id}", %{})

    ref = push(socket, "comment:add", %{"content" => nil})

    assert_reply ref, :error, %{}
  end
end
