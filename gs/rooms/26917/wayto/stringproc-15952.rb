room = Room.current.id
fput "go opening"
if room == Room.current.id
  fput "close locker"
  move "go opening"
end
