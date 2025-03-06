mynpc = if (bounty? =~ /^You have made contact with the child/) || (Society.task =~ /You have been tasked to find and rescue an official who was captured/)
  GameObj.npcs.find { |npc| npc.noun =~ /child|official/ }
end
if mynpc
  50.times {
    break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
    sleep 0.1
  }
end
move "southeast"
if mynpc
  50.times {
    break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
    sleep 0.1
  }
end
move "southeast"
if mynpc
  50.times {
    break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
    sleep 0.1
  }
end
move "southwest"
if mynpc
  50.times {
    break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
    sleep 0.1
  }
end
move "northwest"
if mynpc
  50.times {
    break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
    sleep 0.1
  }
end
move "northwest"
if mynpc
  50.times {
    break if GameObj.npcs.any? { |npc| npc.id == mynpc.id }
    sleep 0.1
  }
end
