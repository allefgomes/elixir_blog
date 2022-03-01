defmodule Blog.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Blog.Repo

  alias Blog.Accounts.User

  def find_or_create_users(attrs) do
    case get_user_by_email!(attrs.email) do
      nil -> create_user(attrs)
      user -> {:ok, user}
    end
  end

  def get_user!(id), do: Repo.get!(User, id)
  def get_user_by_email!(email), do: Repo.get_by(User, email: email)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
