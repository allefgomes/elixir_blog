defmodule Blog do
  alias Blog.Posts

  defdelegate create_post(params), to: Posts.Create, as: :call
end
