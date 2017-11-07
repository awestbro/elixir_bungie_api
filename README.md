# BungieApi

## Configuration

Add to your `config/config.exs:`
```
config :bungie_api, api_key: System.get_env("API_KEY") || "your_api_key"
```

## Usage
```ex
BungieApi.Users.search "test"
```
