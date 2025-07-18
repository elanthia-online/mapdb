start_room = [12240, 12229, 12228, 12219, 12217, 12220, 12231, 12230, 12232, 12235, 12236, 12238, 12239, 12237, 12234, nil, 12233]
dirs = ["southwest", "southwest", "southwest", "up", "northwest", "east", "northwest", "northeast", "down", "southeast", "southeast", "southeast", "up", "northeast", "west", "southeast", "northwest", "northwest", "northeast", "up"]
if index = start_room.index(Room.current.id)
  until checkloot.include?("fissure")
    move dirs[index]
    index += 1
    index = 0 if index >= dirs.length
  end
  5.times {
    waitrt?
    fput "stand" unless standing?
    waitrt?
    result = dothistimeout "push fissure", 3, /^Grasping the distorted edges|^A wide fissure cannot be opened any farther\.|^As you move to touch a sealed fissure|^What were you referring to\?/
    waitrt?
    fput "stand" unless standing?
    waitrt?
    break if /^A wide fissure cannot be opened any farther\./.match?(result)
  }
  move "go fissure"
else
  echo "error: mini-script expected a different room"
end
$go2_restart = true
