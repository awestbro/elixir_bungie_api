# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# Get api_key from env variable or keep in secrets.exs file (not checked into version control)
config :bungie_api, api_key: System.get_env("API_KEY")

unless Application.get_env(:bungie_api, :api_key) do
    import_config "secrets.exs"
end
