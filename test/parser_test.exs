defmodule ParserNotesTest do
  use ExUnit.Case

  alias Notes.Parser, as: NP


  test "map priority string to integer type" do
    assert NP.notes(["1;1;Note"], 1) == [{1, 1, "Note"}]
  end

  test "map entry to a tuple" do
    assert NP.notes(["1;1;Note"], 1) == [{1, 1, "Note"}]
  end

  test "split notes into own elements" do
    assert NP.notes(["1;2;Top", "2;1;Note"], 2) == [{1, 2, "Top"}, {2, 1, "Note"}]
  end

  test "sort notes by priority" do
    assert NP.notes(["5;2;Medium", "6;1;Low", "7;3;High"], 3)
        == [{7, 3, "High"}, {5, 2, "Medium"}, {6, 1, "Low"}]
  end

  test "limit numbers of notes" do
    assert NP.notes(["1;2;Medium", "2;1;Low", "3;3;High"], 2) == [{3, 3, "High"}, {1, 2, "Medium"}]
    assert NP.notes(["1;2;Medium", "2;1;Low", "3;3;High"], 1) == [{3, 3, "High"}]
  end
end
