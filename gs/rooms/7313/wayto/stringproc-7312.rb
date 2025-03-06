child = if /^You have made contact with the child/.match?(bounty?)
  GameObj.npcs.find { |npc| npc.noun == "child" }
end
move "southwest"
if Room.current == Room[7313]
  if child
    50.times {
      break if GameObj.npcs.any? { |npc| npc.id == child.id }
      sleep 0.1
    }
  end
  move "southwest"
end
