defmodule Blog.AccountsTest do
  use Blog.DataCase

  alias Blog.Accounts

  describe "users" do
    alias Blog.Accounts.User

    @valid_attrs %{
      email: "some email",
      first_name: "some first_name",
      image: "some image",
      last_name: "some last_name",
      provider: "some provider",
      token: "some token"
    }
    @update_attrs %{
      email: "some updated email",
      first_name: "some updated first_name",
      image: "some updated image",
      last_name: "some updated last_name",
      provider: "some updated provider",
      token: "some updated token"
    }
    @invalid_attrs %{
      email: nil,
      first_name: nil,
      image: nil,
      last_name: nil,
      provider: nil,
      token: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "find_or_create_users/1 create and return the user with given email" do
      user_params = @valid_attrs

      {:ok, user} = Accounts.find_or_create_users(user_params)
      assert user.email == Accounts.get_user_by_email!(user_params.email).email
    end

    test "find_or_create_users/1 just find the user with given email" do
      user_created = user_fixture(@valid_attrs)

      {:ok, user} = Accounts.find_or_create_users(user_created)
      assert user.email == Accounts.get_user_by_email!(user_created.email).email
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.image == "some image"
      assert user.last_name == "some last_name"
      assert user.provider == "some provider"
      assert user.token == "some token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
