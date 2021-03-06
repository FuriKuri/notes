defmodule FormatterTest do
  use ExUnit.Case

  alias Notes.Formatter, as: NF

  test "width of ids where header is max" do
    entries = [{5, 1, "Two"}, {6, 2, "One"}, {7, 3, "Two"}]
    width = NF.width_of_ids(entries)
    assert width == 2
  end

  test "width of ids" do
    entries = [{1111, 1, "Five"}, {2222, 2, "One"}, {333, 3, "Very long"}]
    width = NF.width_of_ids(entries)
    assert width == 4
  end

  test "width of notes where header is max" do
    entries = [{5, 1, "Two"}, {6, 2, "One"}, {7, 3, "Two"}]
    width = NF.width_of_notes(entries)
    assert width == 4
  end

  test "width of notes" do
    entries = [{1, 1, "Five"}, {2, 2, "One"}, {3, 3, "Very long"}]
    width = NF.width_of_notes(entries)
    assert width == 9
  end

  test "width of priorities where header is max" do
    entries = [{1, 1, "Five"}, {1, 222, "One"}, {1, 33, "Very long"}]
    width = NF.width_of_priorities(entries)
    assert width == 4
  end

  test "width of priorities" do
    entries = [{1, 1, "Five"}, {1, 22222, "One"}, {1, 33, "Very long"}]
    width = NF.width_of_priorities(entries)
    assert width == 5
  end

  test "separator line" do
    line = NF.separator([3, 5, 2])
    assert line == "----+-------+---"
  end

  test "format for" do
    format = NF.format_for([3, 5, 7])
    assert format == "~-3s | ~-5s | ~-7s~n"
  end
end
