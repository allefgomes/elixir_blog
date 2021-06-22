defmodule Blog do
  alias Blog.Posts

  defdelegate list_posts(), to: Posts.List, as: :call
  defdelegate create_post(params), to: Posts.Create, as: :call
end
