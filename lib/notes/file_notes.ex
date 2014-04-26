defmodule Notes.File do
	def read(filename) do
		case File.open(filename) do
			{ :ok, file } -> IO.stream(file, :line) |> Stream.map(&String.strip(&1))
			{ :error, :enoent } -> create_file(filename)
			{ :error, msg } -> raise "Something went wrong #{msg}"
		end
	end

	defp create_file(filename) do
		unless File.exists?(Path.dirname(filename)) do
			File.mkdir_p(Path.dirname(filename))
		end
		File.touch!(filename)
		[]
	end
end