defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode.hello()
      :world

  """
  def hello do
    :world
  end

  def call_solution(day, level) do
    input = File.read!(input_path(day, level))

    IO.puts apply(String.to_existing_atom("AdventOfCode.Day#{day}Level#{level}"), :solve, [input])
  end

  def solution_path(day, level) do
    "./lib/day_#{day}/solution_level_#{level}.ex"
  end

  def directions_path(day, level) do
    "./lib/day_#{day}/directions_level_#{level}.txt"
  end

  def input_path(day, level) do
    "./lib/day_#{day}/input_level_#{level}.txt"
  end

  def test_path(day, level) do
    "./test/day_#{day}_level_#{level}.exs"
  end

  def day_directory(day) do
    "./lib/day_#{day}"
  end

  def solution_template(day, level) do
    """
    defmodule AdventOfCode.Day#{day}Level#{level} do
      @spec solve(string) :: binary
      def solve(input) do
      end
    end
    """
  end

  def test_template(day, level) do
    """
    defmodule AdventOfCodeTest.Day#{day}Level#{level} do
      use ExUnit.Case

      test "solution" do
        input = ""
        assert AdventOfCode.Day#{day}Level#{level}.solve(input) == ""
      end
    end
    """
  end
end
