# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hn_live, HnLiveWeb.Endpoint,
  url: [host: "localhost"],
  live_view: [
    signing_salt: "kdymj1+jHHtzGJKOMZP1sr/AeCwPV8Ph"
  ],
  secret_key_base: "LsQKLJnp6XHZVI9OCM6fYxaBxzgvXtQHkBe4U+0UFxzao+0jJOVomInaA5xmO5oY",
  render_errors: [view: HnLiveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HnLive.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
