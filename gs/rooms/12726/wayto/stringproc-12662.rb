empty_hand if [12677, 20786].include?(Room.current.id)
swim_dir = {20786 => "down", 12677 => "down", 12987 => "beach", 12663 => "beach", 12988 => "east", 12664 => "north", 12726 => "northeast", 12665 => "north", 12666 => "north", 12989 => "northeast", 12991 => "northwest", 12667 => "north", 12668 => "north", 12727 => "northwest", 12669 => "southwest", 12990 => "northeast", 12670 => "northwest", 12728 => "southwest", 12671 => "south", 12672 => "northwest", 12673 => "east", 12674 => "fissure", 12675 => "steps", 12676 => "southwest", 12729 => "southeast", 12677 => "down"}
child = (bounty? =~ /^You have made contact with the child/) && GameObj.npcs.find { |npc| npc.noun == "child" }
while Room.current.id != 12662
  if swim_dir[Room.current.id]
    put "swim #{swim_dir[Room.current.id]}"
  else
    echo "Oh crap.. I'm lost.."
    put "swim #{checkpaths[rand(checkpaths.length)]}"
  end
  sleep 1
  waitrt?
  if child
    50.times {
      break if GameObj.npcs.any? { |npc| npc.id == child.id }
      sleep 0.1
    }
  end
end
fill_hand
