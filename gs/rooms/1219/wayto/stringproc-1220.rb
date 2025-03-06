loop do
  fput "search"
  search_result = waitfor "don't find anything", "discover a northwest path", "Roundtime", "Round time"
  waitrt?
  break if /discover a northwest path/.match?(search_result)
end
move "go path"
