defmodule Blog do
  alias Blog.{Posts, Posts.Comments}

  defdelegate list_posts(), to: Posts.List, as: :call
  defdelegate get_post(id), to: Posts.Get, as: :call
  defdelegate create_post(params), to: Posts.Create, as: :call
  defdelegate delete_post(id), to: Posts.Delete, as: :call
  defdelegate update_post(id, post_params), to: Posts.Update, as: :call

  defdelegate list_comments(id), to: Comments.List, as: :call
  defdelegate get_comment(id), to: Comments.Get, as: :call
  defdelegate create_comment(id, params), to: Comments.Create, as: :call
  defdelegate delete_comment(id), to: Comments.Delete, as: :call
  defdelegate update_comment(id, post_params), to: Comments.Update, as: :call
end
