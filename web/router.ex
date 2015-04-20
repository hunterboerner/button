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
end
