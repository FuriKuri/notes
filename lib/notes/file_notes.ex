defmodule Notes.File do
  import Notes.Parser, only: [max_id: 1]

  def read(filename) do
    case File.open(filename) do
      { :ok, file } -> IO.stream(file, :line) |> Stream.map(&String.strip(&1))
      { :error, :enoent } -> create_file(filename)
      { :error, msg } -> raise "Something went wrong #{msg}"
    end
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
