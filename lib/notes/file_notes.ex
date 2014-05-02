defmodule Notes.File do
  import Notes.Parser, only: [max_id: 1]

  def read(filename) do
    case File.open(filename) do
      { :ok, file } -> IO.stream(file, :line) |> Stream.map(&String.strip(&1)) |> Enum.to_list
      { :error, :enoent } -> create_file(filename)
      { :error, msg } -> raise "Something went wrong #{msg}"
    end
  end

  def remove(filename, id) do
    notes = read(filename)
      |> Enum.map(&(String.split(&1, ";")))
      |> Enum.map(fn [i, p, n] -> {binary_to_integer(i), binary_to_integer(p), n} end)
      |> Enum.filter(fn {current_id, _, _} -> id != to_string(current_id) end)
      |> write(filename)
  end

  def write(notes, filename) do
    content = notes
      |> Enum.map(&line/1)
      |> Enum.reduce(&("#{&2}\n#{&1}"))
    File.write!(filename, content)
  end

  def line(note) do
    note |> tuple_to_list |> Enum.join(";")
  end

  def add(filename, note) do
    next_id = max_id(read(filename)) + 1
    old_content = read(filename) |> Enum.to_list
    content = ["#{next_id};" <> note] ++ old_content
    File.write!(filename, Enum.reduce(content, &("#{&2}\n#{&1}")))
  end

  defp create_file(filename) do
    unless File.exists?(Path.dirname(filename)) do
      File.mkdir_p(Path.dirname(filename))
    end
    File.touch!(filename)
    []
  end
end
