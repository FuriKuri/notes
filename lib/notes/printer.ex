defmodule Notes.Printer do
	import Notes.File, only: [ read: 1 ]
	alias Notes.Parser, as: Parser
  alias Notes.Config, as: Config

	def print_notes(count) do
		IO.puts "Print notes #{count}"
		Parser.notes(read(Config.note_file), count)
	end

	def print_help() do
		IO.puts """
		usage:
		Hello Worl
		notes add <note> [--priority n]
		notes list [count | #{Config.default_count}]
		"""
	end
end
