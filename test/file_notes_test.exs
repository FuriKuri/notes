defmodule FileNotesTest do
  use ExUnit.Case

  alias Notes.File, as: NF

  test "read notes file" do
    content = NF.read("test/fixture/notes.txt") |> Enum.to_list
    assert content == ["Hello", "World", "It's me"]
  end

  test "read from empty file" do
    assert NF.read("test/fixture/empty.txt") |> Enum.to_list == []
  end

  test "add note to file" do
    file_content = File.read!("test/fixture/notes.txt")
    NF.add("test/fixture/notes.txt", "New note")
    assert NF.read("test/fixture/notes.txt") |> Enum.at(0) == "New note"
    File.write!("test/fixture/notes.txt", file_content)
  end

  test "create file if does not exists" do
    File.rm!("test/fixture/empty.txt")
    assert NF.read("test/fixture/empty.txt") == []
    assert File.exists?("test/fixture/empty.txt")
  end
end
