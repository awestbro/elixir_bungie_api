# BungieApi

## Configuration

Add to your `config/config.exs:`
```
config :bungie_api, api_key: System.get_env("BUNGIE_API_KEY") || "your_api_key"
```

## Usage
```ex
BungieApi.Users.search "test"

BungieApi.Users.search("iTzSultry")["Response"]
|> Enum.map(&(BungieApi.Users.get_memberships_by_id(&1["membershipId"], -1)))
```
