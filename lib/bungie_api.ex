defmodule BungieApi do
  @moduledoc """
  Documentation for BungieApi.
  """

  @httpoison_opts [
    follow_redirect: true,
    timeout: 33_000,
    recv_timeout: 30_000
  ]

  @api_url "https://www.bungie.net/Platform"

  defp authenticated_headers(headers \\ %{}) do
    Map.put(headers, "X-API-Key", Application.get_env(:bungie_api, :api_key))
  end

  defp merge_options(options \\ []) do
    Keyword.merge(@httpoison_opts, options)
  end

  def request(method, endpoint, options) do
    request(method, endpoint, "", %{}, options)
  end

  def request(method, endpoint, body \\ "", headers \\ %{}, options \\ []) do
    hd = authenticated_headers(headers)
    ops = merge_options(options)
    {:ok, response} = HTTPoison.request(method, "#{@api_url}#{endpoint}", body, hd, ops)
    Map.get(response, :body)
    |> Poison.decode!
  end
end
