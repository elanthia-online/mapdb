room = Room.current.id
fput "go cedar door"
if room == Room.current.id
  fput "close locker"
  move "go cedar door"
end
