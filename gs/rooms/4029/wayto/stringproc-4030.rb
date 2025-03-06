loop do
  move "south"
  break if Room.current.id == 4030
end
