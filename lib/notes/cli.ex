defmodule Notes.CLI do
  import Notes.File, only: [ add: 2]
  import Notes.Printer, only: [ print_notes: 1, print_help: 0]
  alias Notes.Config, as: Config

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

      {_, ["list", count], _} -> {:list, count}
      {_, ["list"], _} -> {:list, Config.default_count}
  	end
  end

  def process(:help) do
    print_help
	end

  def process({:list, count}) do
    print_notes(count)
  end

  def process({:add, note, priority}) do
    add(Config.note_file, "#{priority};#{note}")
  end
end
