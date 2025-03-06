loop do
  fput "search"
  search_result = waitfor "discover a", "don't find anything", "Roundtime", "Round time"
  waitrt?
  break if /discover a/.match?(search_result)
end
move "go path"
