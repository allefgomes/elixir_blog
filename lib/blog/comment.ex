defmodule Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string

    belongs_to :post, Blog.Post

    timestamps()
  end

  def changeset(comment, params), do: create_changeset(comment, params)

  defp create_changeset(comment_or_struct, params) do
    comment_or_struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
