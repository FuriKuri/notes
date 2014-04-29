defmodule Notes.Printer do
	import Notes.File, only: [ read: 1 ]
  alias Notes.Config, as: Config

	def print_notes(count) do
		IO.puts "Print notes #{count}"
		read(Config.note_file)
	end

	def print_help() do
		IO.puts """
		usage: 
		notes add <note> [--priority n]
		notes list [count | #{Config.default_count}]
		"""
	end
end