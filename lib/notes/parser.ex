defmodule Notes.Parser do
  def notes(notes, count) do
    notes
      |> Enum.map(&(String.split(&1, ";")))
      |> Enum.map(fn [p, n] -> {binary_to_integer(p), n} end)
      |> Enum.sort(fn {a, _}, {b, _} -> a >= b end)
      |> Enum.take(count)
  end
end
