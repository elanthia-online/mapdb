loop do
  fput "search"
  search_result = waitfor "don't find anything", "discover a narrow opening", "Roundtime", "Round time"
  waitrt?
  break if /discover a narrow opening/.match?(search_result)
end
move "go opening"
