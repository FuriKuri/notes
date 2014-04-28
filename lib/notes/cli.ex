defmodule Notes.CLI do

  import Notes.File, only: [ add: 2]
  import Notes.Config, only: [ note_file: 0]

	@default_count 5

	def main(args) do
    	args
    		|> parse_args 
    		|> process
  end

  def parse_args(argv) do
  	parse = OptionParser.parse(argv, 
      switches: [help: :boolean, priority: :integer],
  		aliases: [h: :help, p: :priority])
  	case parse do
  		{[help: true], _, _} -> :help
      {[priority: priority], ["add", note], _} -> {:add, note, priority}
      {_, ["add", note], _} -> {:add, note, 0}
  	end
  end

  def process(:help) do
		IO.puts """
		usage: 
		notes add <note> [--priority n]
		notes list [count | #{@default_count}]
		"""
		System.halt(0)
	end

  def process({:add, note, priority}) do
    IO.puts note
    IO.puts priority
    add(note_file, "#{priority};#{note}")
  end
end