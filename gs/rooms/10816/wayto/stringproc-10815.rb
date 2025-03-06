loop do
  fput "swim north"
  waitrt?
  break if Room.current.id == 10815
end
