defmodule Notes.Formatter do

  @attr "Prio"
  def prio_header, do: @attr
  @attr "Note"
  def note_header, do: @attr

  def width_of_notes(entries) do
    entries
      |> Enum.map(fn {_, n} -> n end)
      |> Enum.map(&String.length/1)
      |> Enum.max
      |> max(String.length(note_header))
  end

  def width_of_priorities(entries) do
    entries
      |> Enum.map(fn {p, _} -> p end)
      |> Enum.map(&to_string/1)
      |> Enum.map(&String.length/1)
      |> Enum.max
      |> max(String.length(prio_header))
  end

  def separator(column_widths) do
    Enum.map_join(column_widths, "-+-",
      fn width -> List.duplicate("-", width) end)
  end

  def format_for(column_width) do
    Enum.map_join(column_width, " | ",
      fn width -> "~-#{width}s" end) <> "~n"
  end
end
