while Room.current.id == 30115
  fput "north"
  waitrt
end
(Room.current.id != 29867) ? $go2_restart = true : nil
