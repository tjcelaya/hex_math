require IEx

defmodule HexMathTest do
  use ExUnit.Case
  doctest HexMath

  import HexMath
  alias HexMath.Cubic, as: H

  test "Equality, in case pattern matching isn't needed" do
    h = {1, 2, 3}
    assert eq(h, h)
  end

  test "hex add" do
    assert {4, -10, 6} == add({1, -3, 2}, {3, -7, 4})
  end

  test "hex subtract" do
    assert {-2, 4, -2} == subtract({1, -3, 2}, {3, -7, 4})
  end

  test "Simple neighbor check" do
    assert {1, -3, 2} == neighbor({1, -2, 1}, :northwest)
  end

  test "Neighbors are distance 1" do
    for {_dir, neigh} <- directions do
      assert 1 === distance(H.origin, neigh)
    end
  end
end
