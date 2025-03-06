loop do
  fput "search"
  search_result = waitfor "don't find anything", "the opening of an escape tunnel", "nothing other than the tunnel", "Roundtime:"
  waitrt?
  break if /tunnel/.match?(search_result)
end
move "go tunnel"
