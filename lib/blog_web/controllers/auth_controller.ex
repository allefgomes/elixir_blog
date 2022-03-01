defmodule BlogWeb.AuthController do
  use BlogWeb, :controller
  plug Ueberauth

  alias Blog.Accounts

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider}) do
    user_params = %{
      token: auth.credentials.token,
      email: auth.info.email,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      image: auth.info.image,
      provider: provider
    }

    case Accounts.find_or_create_users(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Bem vindo!!! #{user.email}")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _error} ->
        conn
        |> put_flash(:error, "Não foi possível fazer login com sua conta!")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end
end
