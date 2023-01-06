defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def main(input) do
    hash_input(input)
    |> pick_color
    |> build_grid
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
    #{c, _} = Enum.split(hash, 3)
    #{r, g, b} = c
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
  end

  #def get_pixels(hash) do
  #  pixels = for row <- Enum.chunk_every(hash, 3) do
  #    left = for p <- row do
  #      rem(p, 2)
  #    end
  #    {_, right} = Enum.split(Enum.reverse(left), 1)
  #    left ++ right
  #  end

  #  {pixels, _} = Enum.split(pixels, 25)
  #  List.flatten(pixels)
  #end
end
