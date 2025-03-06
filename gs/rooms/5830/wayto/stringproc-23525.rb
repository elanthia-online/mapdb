10.times {
  result = dothistimeout "search", 5, /don't find anything|discover a rocky trail|Round ?time|...[Ww]ait/
  waitrt?
  break if /discover a rocky trail/.match?(result)
}
move("go rocky trail")
