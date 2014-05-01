defmodule Notes.Printer do
  import Notes.File, only: [ read: 1 ]
  import Notes.Formatter, only: [
    format_for: 1,
    widths_of: 1,
    separator: 1 ]

  alias Notes.Parser, as: Parser
  alias Notes.Config, as: Config

  def print_notes(count) do
    notes = Parser.notes(read(Config.note_file), count)
    put_header_table(notes)
    put_content_table(notes)
  end

  def put_content_table(entries) do
    column_width = widths_of(entries)
    format = format_for(column_width)
    entries
      |> Enum.map(fn {i, p, n} -> [to_string(i), to_string(p), n] end)
      |> Enum.each(&(:io.format(format, &1)))
  end

  def put_header_table(entries) do
    column_width = widths_of(entries)
    format = format_for(column_width)
    :io.format(format, Notes.Formatter.header)
    IO.puts separator(column_width)
  end

  def print_help() do
    IO.puts """
    usage:
    notes add <note> [--priority n]
    notes list [count | #{Config.default_count}]
    notes rm <id>
    """
  end
end
