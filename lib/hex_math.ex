defmodule Point do
  defstruct [:x, :y]
end

defmodule HexMath.Cubic do
  def origin, do: {0, 0, 0}
  def from_axial({q, r}), do: {q, -q - r, r}
end

defmodule HexMath.Axial do
  def origin, do: {0, 0}
  def from_cubic({x, _y, z}), do: {x, z}
end


defmodule HexMath do

  def eq(h1, h2), do: h1 === h2

  def add({ x1, y1, z1},
          { x2, y2, z2}),
    do: { x1 + x2, y1 + y2, z1 + z2}

  def subtract({ x1, y1, z1},
                { x2, y2, z2}),
    do: { x1 - x2, y1 - y2, z1 - z2}

  def scale({ x1, y1, z1}, k),
    do: { x1 * k, y1 * k, z1 * k }

  def distance(h1, h2) when is_tuple(h1) and is_tuple(h2),
    do: subtract(h1, h2) |> hlength

  defp hlength({x, y, z}),
    do: trunc((abs(x) + abs(y) + abs(z)) / 2)

  # def distance

  @horizontal_directions %{
    east:       { 1,  0, -1},
    northeast:  { 1, -1,  0},
    northwest:  { 0, -1,  1},
    west:       {-1,  0,  1},
    southeast:  {-1,  1,  0},
    southwest:  { 0,  1, -1},
  }

  def directions, do: @horizontal_directions

  def neighbor(h, dir) when is_tuple(h) and is_atom(dir),
    do: add(h, @horizontal_directions[dir])

  # def diagonal
  # def neighbor?(x = {}, y = {}),

end

