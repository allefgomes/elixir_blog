defmodule Blog.Posts.Create do
  alias Blog.{Post, Repo}

  def call(params) do
    params
    |> Post.build()
    |> create_post()
  end

  defp create_post({:ok, struct}), do: Repo.insert(struct)
  defp create_post({:error, _changeset} = error), do: error
end
