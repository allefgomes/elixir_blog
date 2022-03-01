defmodule BlogWeb.AuthControllerTest do
  use BlogWeb.ConnCase

  test "when callback/2 error", %{conn: conn} do
    auth = %Ueberauth.Auth{
      provider: :google,
      info: %{
        first_name: nil,
        last_name: nil,
        email: "",
        image: ""
      },
      credentials: %{
        token: "something_token"
      }
    }

    conn =
      conn
      |> assign(:ueberauth_auth, auth)
      |> get("/auth/google/callback")

    assert redirected_to(conn) == Routes.page_path(conn, :index)
  end

  test "when callback/2 succeeds", %{conn: conn} do
    auth = %Ueberauth.Auth{
      provider: :google,
      info: %{
        first_name: "Exblog",
        last_name: "Success",
        email: "exblog@example.com",
        image: "https://exblog/image.jpg"
      },
      credentials: %{
        token: "something_token"
      }
    }

    conn =
      conn
      |> assign(:ueberauth_auth, auth)
      |> get("/auth/google/callback")

    assert get_flash(conn, :info) == "Bem vindo!!! #{auth.info.email}"
  end
end
