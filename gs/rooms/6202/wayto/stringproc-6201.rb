target_room_id = 6201
maze_rooms = [6210, 6208, 6203, 6205, 6204, 6207, 6206, 6209, 6202]
$minotaur_maze_dirs ||= {}
loop {
  child = if /^You have made contact with the child/.match?(bounty?)
    GameObj.npcs.find { |npc| npc.noun == "child" }
  end
  start_room = Room.current
  $minotaur_maze_dirs[start_room.id] ||= {}
  dir = $minotaur_maze_dirs[start_room.id].keys.find { |d| $minotaur_maze_dirs[start_room.id][d] == target_room_id } || XMLData.room_exits.find { |d| $minotaur_maze_dirs[start_room.id][d].nil? } || $minotaur_maze_dirs[start_room.id].keys.find { |d| $minotaur_maze_dirs[$minotaur_maze_dirs[start_room.id][d]].value?(target_room_id) } || XMLData.room_exits[rand(XMLData.room_exits.length)]
  move dir.dup
  if child
    50.times {
      break if GameObj.npcs.any? { |npc| npc.id == child.id }
      sleep 0.1
    }
  end
  end_room = Room.current
  $minotaur_maze_dirs[start_room.id][dir] = end_room.id
  if end_room.id == target_room_id
    break
  elsif !maze_rooms.include?(end_room.id)
    dir = end_room.wayto[start_room.id.to_s]
    if dir.instance_of?(Proc)
      dir.call
      if child
        50.times {
          break if GameObj.npcs.any? { |npc| npc.id == child.id }
          sleep 0.1
        }
      end
    elsif dir.instance_of?(String)
      move dir.dup
      if child
        50.times {
          break if GameObj.npcs.any? { |npc| npc.id == child.id }
          sleep 0.1
        }
      end
    end
  end
}
