defmodule Mix.Tasks.Eggnog do
  use Mix.Task
  require AdventOfCode
  @impl Mix.Task

  def run(_) do
    IO.puts "check with eggnog help"
  end

  defmodule Setup do
    def run([]) do
      run([2021, 1, 1])
    end

    def run([year, day, level]) do
      if !File.dir?(AdventOfCode.day_directory(day)) do
        File.mkdir_p!(AdventOfCode.day_directory(day))
      end

      {input, 0} = System.cmd("nog", ["-y", "#{year}", "-d", "#{day}", "-l", "#{level}"])
      {directions, 0} = System.cmd("nog", ["-y", "#{year}", "-d", "#{day}", "-p", "-l", "#{level}"])

      File.touch(AdventOfCode.directions_path(day, level))
      File.write(AdventOfCode.directions_path(day, level), directions)
      File.touch(AdventOfCode.input_path(day, level))
      File.write(AdventOfCode.input_path(day, level), input)

      File.touch(AdventOfCode.solution_path(day, level))
      File.write(AdventOfCode.solution_path(day, level), AdventOfCode.solution_template(day, level))

      File.touch(AdventOfCode.test_path(day, level))
      File.write(AdventOfCode.test_path(day, level), AdventOfCode.test_template(day, level))
    end
  end

  defmodule Solve do
    def run([]) do
      run([1, 1])
    end

    def run([day, level]) do
      AdventOfCode.call_solution(day, level)
    end
  end

  defmodule Test do
    def run([]) do
      IO.puts "must specify day to test"
    end

    def run([day]) do
      IO.puts "testing level 1 for day #{day}"
      run([day, 1])
    end

    def run([day, level]) do
      IO.puts "testing level #{level} for day #{day}"
      System.cmd("mix", ["test", AdventOfCode.test_path(day, level)])
    end
  end

  defmodule Submit do
    def run([]) do

    end
  end
end
