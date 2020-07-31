# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :csst, CsstWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cfC9MvcIOtcE5x3DWfKKHgbFHu7uZsfALIx64nmu9tKIOTzAmACcVfQfUXZAxqgR",
  render_errors: [view: CsstWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Csst.PubSub,
  live_view: [signing_salt: "uhkvVBVQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
