defmodule IexPostgresTest do
  use ExUnit.Case
  doctest IexPostgres

  test "greets the world" do
    assert IexPostgres.hello() == :world
  end
end
