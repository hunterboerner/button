defmodule Button.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :allow_origin
  end

  scope "/", Button do
    pipe_through :api # Use the default browser stack

    get "/", CountController, :index
    post "/", CountController, :create
    get "/latest", CountController, :latest
  end

  # Other scopes may use custom stacks.
  # scope "/api", Button do
  #   pipe_through :api
  # end

  defp allow_origin(conn, _opts) do
    headers = get_req_header(conn, "access-control-request-headers")
    |> Enum.join(", ")

    conn
    |> put_resp_header("access-control-allow-origin", "*")
    |> put_resp_header("access-control-allow-headers", headers)
    |> put_resp_header("access-control-allow-methods", "get, post, options")
    |> put_resp_header("access-control-max-age", "3600")
  end
end
