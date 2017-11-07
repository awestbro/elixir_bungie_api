defmodule BungieApiTest do
  use ExUnit.Case
  doctest BungieApi

  test "greets the world" do
    assert BungieApi.hello() == :world
  end
end
