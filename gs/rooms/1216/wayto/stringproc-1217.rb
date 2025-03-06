10.times {
  result = dothistimeout "search", 5, /don't find anything|discover a small footpath|Round ?time/
  waitrt?
  break if /discover a small footpath/.match?(result)
}
move "go footpath"
