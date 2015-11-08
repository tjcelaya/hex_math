defmodule HexMath.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hex_math,
      version: "0.0.2",
      elixir: "~> 1.1",
      deps: [],
      description: "Library for working with hex grids.",
      package: package
    ]
  end

  def application, do: []

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Tomas Celaya <tjcelaya@gmail.com>"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tjcelaya/hex_math"}
    ]
  end
end
