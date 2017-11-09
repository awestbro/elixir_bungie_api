defmodule BungieApi.BungieMembershipType do

  @memberships %{
    all: -1,
    none: 0,
    xbox: 1,
    psn: 2,
    blizzard: 4,
    demon: 10,
    bungie_next: 254,
  }

  @doc"""
    Pretty fn to get membership types by atom
  """
  def get(type) do
    Map.get(@memberships, type, -1)
  end
end
