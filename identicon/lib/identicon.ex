defmodule Identicon do
  @moduledoc """
    Module for generating reproducible identicon based on string input.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> construct_grid
    |> filter_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def save_image(image, filename) do
    File.write("#{filename}.png", image)
  end

  @doc """
    Draw image from color and pixel_map
  """
  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end
    :egd.render(image)
  end

  @doc """
    Builds pixel map from grid
  """
  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end
    %Identicon.Image{image | pixel_map: pixel_map}
  end

  @doc """
    Filters out odd squares so that only even squares are colored in final image
  """
  def filter_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end
    %Identicon.Image{image | grid: grid}
  end

  @doc """
    Constructs our grid by building a list of lists which represent
    each of the 5 rows we will have in our identicon. Each "row"
    list contains 3 values, of which the first two will be mirrored
    across to develop the symmetrical identicon.
  """
  def construct_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  @doc """
    Mirrors values across row
  """
  def mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

  @doc """
    Use pattern matching to extract RGB values from Identicon.Image struct.
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
    Converts string input into a series of unique, reproducible characters.

  ## Examples
      iex> Identicon.hash_input("fatima")
      [181, 213, 246, 123, 48, 128, 148, 19, 21, 102, 85, 171, 221, 163, 130, 163]
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
