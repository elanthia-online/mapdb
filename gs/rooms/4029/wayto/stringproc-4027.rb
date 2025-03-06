loop do
  move "north"
  break if Room.current.id == 4027
end
