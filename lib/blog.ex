defmodule Blog do
  alias Blog.Posts

  defdelegate list_posts(), to: Posts.List, as: :call
  defdelegate get_post(id), to: Posts.Get, as: :call
  defdelegate create_post(params), to: Posts.Create, as: :call
  defdelegate delete_post(id), to: Posts.Delete, as: :call
  defdelegate update_post(id, post_params), to: Posts.Update, as: :call
end
