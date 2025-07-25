loop {
  fput "search"
  fput "turn bent spike"
  sleep 0.2
  break unless checkpaths == ["out"]
}
wait_while { standing? }
fput "stand"
if Room.current == Room[7047]
  move "southwest"
  move "southeast"
  move "southeast"
  move "northeast"
  move "northeast"
  move "climb rubble"
  move "go opening"
  move "out"
end
if Room.current == Room[3705]
  move "south"
  move "south"
  move "west"
  move "north"
  move "north"
  move "north"
end
if Room.current == Room[3687]
  move "north"
  move "northwest"
  move "south"
  move "south"
  move "south"
  move "climb ladder"
  move "go door"
  move "north"
  move "north"
  move "north"
  move "east"
end
if Room.current == Room[7144]
  move "go door"
  move "go hole"
  move "go crack"
end
if Room.current == Room[7083]
  move "go space"
  move "east"
end
if Room.current == Room[7084]
  move "east"
  move "east"
  move "east"
  move "east"
  move "south"
end
