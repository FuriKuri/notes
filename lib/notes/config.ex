defmodule Notes.Config do
	@attr "~/.notes/notes.txt"
	def note_file(),  do: Path.expand(@attr)

	@attr 5
	def default_count, do: @attr
end