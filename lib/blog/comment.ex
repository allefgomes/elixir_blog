defmodule Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content]}
  schema "comments" do
    field :content, :string

    belongs_to :post, Blog.Post
    timestamps()
  end

  def changeset(comment, params) do
    comment
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
