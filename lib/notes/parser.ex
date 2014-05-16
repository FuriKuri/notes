defmodule Notes.Parser do
  @doc """
  Returns a limited sorted numbers notes in seperate tuples

  ## Exmaple
    iex> notes = ["4;1;Note one", "2;0;Note two", "1;2;Note three"]
    iex> Notes.Parser.notes(notes, 2)
    [{1, 2, "Note three"}, {4, 1, "Note one"}]
  """
  def notes(notes, count) do
    notes
      |> Enum.map(&(String.split(&1, ";")))
      |> Enum.map(fn [i, p, n] -> {binary_to_integer(i), binary_to_integer(p), n} end)
      |> Enum.sort(fn {_, a, _}, {_, b, _} -> a >= b end)
      |> Enum.take(count)
  end

  @doc """
  Returns the highest id of all note entries

  ## Example
    iex> notes = ["4;3;Note one", "2;3;Note two", "1;3;Note three"]
    iex> Notes.Parser.max_id(notes)
    4
  """
  def max_id(notes) do
    if empty_notes?(notes) do
      0
    else
      notes
        |> Enum.map(&(String.split(&1, ";")))
        |> Enum.map(fn [i, _, _] -> binary_to_integer(i) end)
        |> Enum.max
    end
  end

  def empty_notes?(notes) do
    notes
      |> Enum.map(&String.strip/1)
      |> Enum.filter(&(String.length(&1) != 0))
      |> Enum.empty?
  end
end
