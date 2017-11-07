defmodule BungieApi.Users do
  @endpoint "/User"

  def search(search_text) do
    BungieApi.request(:get, "#{@endpoint}/SearchUsers/", params: %{q: search_text})
  end

  def get_memberships_by_id(membershipId, membershipType) do
    BungieApi.request(:get, "#{@endpoint}/GetMembershipsById/#{membershipId}/#{membershipType}/")
  end

end
