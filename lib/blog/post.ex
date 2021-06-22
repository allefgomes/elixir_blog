defmodule Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :description, :string

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(post, params), do: create_changeset(post, params)

  defp create_changeset(post_or_struct, params) do
    post_or_struct
    |> cast(params, [:title, :description])
    |> validate_required([:title, :description])
  end
end
