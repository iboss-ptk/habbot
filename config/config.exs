# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :habbot,
  ecto_repos: [Habbot.Repo]

# Configures the endpoint
config :habbot, HabbotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2BoCIJ1kUr4WuyTtGMAO3X2is/rTSM+NSdwdK+8nrNxTAy3SbGpriqNzh7roGCfn",
  render_errors: [view: HabbotWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Habbot.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
