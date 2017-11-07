defmodule BungieApi.Users do
  @endpoint "/User"

  def search(search_text) do
    BungieApi.request(:get, "#{@endpoint}/SearchUsers/", params: %{q: search_text})
  end

end
