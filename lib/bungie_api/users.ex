defmodule BungieApi.Users do
  import BungieApi

  @endpoint "/User"

  def search(search_text) do
    request(:get, "#{@endpoint}/SearchUsers/", params: %{q: search_text})
  end

  def get_memberships_by_id(membershipId, membershipType) do
    request(:get, "#{@endpoint}/GetMembershipsById/#{membershipId}/#{membershipType}/")
  end

end
