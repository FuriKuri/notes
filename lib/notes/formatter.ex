defmodule Notes.Formatter do

  @attr "Prio"
  def prio_header, do: @attr
  @attr "Note"
  def note_header, do: @attr
  @attr "ID"
  def id_header, do: @attr

  def header, do: [id_header, prio_header, note_header]

  def widths_of(entries) do
    [width_of_ids(entries), width_of_priorities(entries), width_of_notes(entries)]
  end

  def max_width_of(element_fn, header_title, entries) do
    entries
      |> Enum.map(element_fn)
      |> Enum.map(&to_string/1)
      |> Enum.map(&String.length/1)
      |> Enum.max
      |> max(String.length(header_title))
  end

  def width_of_ids(entries) do
    max_width_of(fn {i, _, _} -> i end, id_header, entries)
  end

  def width_of_notes(entries) do
    max_width_of(fn {_, _, n} -> n end, note_header, entries)
  end

  def width_of_priorities(entries) do
    max_width_of(fn {_, p, _} -> p end, prio_header, entries)
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
