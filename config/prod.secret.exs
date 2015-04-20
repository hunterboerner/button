use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :button, Button.Endpoint,
  secret_key_base: "Me1Yk6sE+IGr5SWc5hp5TVIV758mkQp82tXWccayywTUV4hPWTpIFvl2deIlVkfr"

# Configure your database
config :button, Button.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "button_prod"
