loop do
  search_result = dothistimeout "search", 5, /don't find anything|discover.*?opening|Round ?tim/
  waitrt?
  break if /discover/.match?(search_result)
end
move("go opening")
