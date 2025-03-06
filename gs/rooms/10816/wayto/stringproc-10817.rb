loop do
  fput "swim east"
  waitrt?
  break if Room.current.id == 10817
end
