defmodule Notes.Parser do
  def notes(notes, count) do
    notes
      |> Enum.map(&(String.split(&1, ";")))
      |> Enum.map(fn [i, p, n] -> {binary_to_integer(i), binary_to_integer(p), n} end)
      |> Enum.sort(fn {_, a, _}, {_, b, _} -> a >= b end)
      |> Enum.take(count)
  end

  def max_id(notes) do
    notes
      |> Enum.map(&(String.split(&1, ";")))
      |> Enum.map(fn [i, _, _] -> binary_to_integer(i) end)
      |> Enum.max
  end
end
