defmodule DestinyAPI do
  import BungieApi

  @endpoint "/Destiny2"

  @doc """
  Shorthand for search_destiny_player that just returns the destiny membership id
  """
  def get_membership_id(membership_type, username) do
    search_destiny_player(membership_type, username)["Response"] |> List.first |> Map.get("membershipId")
  end

  @doc """
  DestinyAPI.search_destiny_player(-1, "iTzSultry#1182")
  DestinyAPI.search_destiny_player(MembershipType.pc, "iTzSultry#1182")
  """
  def search_destiny_player(membership_type, displayName) do
    request(:get, "#{@endpoint}/SearchDestinyPlayer/#{membership_type}/#{URI.encode_www_form(displayName)}/")
  end

  @doc """
  ex. DestinyAPI.get_profile(4, "4611686018467866666", [DestinyComponentType.profiles, DestinyComponentType.characters])
  """
  def get_profile(membership_type, membership_id, components \\ []) do
    request(:get, "#{@endpoint}/#{membership_type}/Profile/#{membership_id}/", params: %{components: Enum.join(components, ",")})
  end
end
