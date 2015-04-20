defmodule Button.Endpoint do
  use Phoenix.Endpoint, otp_app: :button

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :button,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_button_key",
    signing_salt: "mC8zjwQC",
    encryption_salt: "/saBE2ix"

  plug :router, Button.Router
end
