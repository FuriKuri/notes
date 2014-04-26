defmodule FileNotesTest do
	use ExUnit.Case

	alias Notes.File, as: NF

	test "read notes file" do
		content = NF.notes("test/fixture/notes.txt") |> Enum.to_list
		assert content == ["Hello", "World", "It's me"]
	end

	test "read from empty file" do
		assert NF.notes("test/fixture/empty.txt") |> Enum.to_list == []
	end

	test "create file if does not exists" do
		File.rm!("test/fixture/empty.txt")
		assert NF.notes("test/fixture/empty.txt") == []
		assert File.exists?("test/fixture/empty.txt")
	end
end