defmodule Notes.Config do
	def note_file() do
		Path.expand("~/.notes/notes.txt")
	end
end