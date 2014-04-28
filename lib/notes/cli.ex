defmodule Notes.CLI do

	@default_count 5

	def main(args) do
    	args
    		|> parse_args 
    		|> process
  end

  def parse_args(argv) do
  	parse = OptionParser.parse(argv, switches: [help: :boolean, priority: :integer],
  		aliases: [h: :help, p: :priority])
  	case parse do
  		{[help: true], _, _} -> :help
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
end