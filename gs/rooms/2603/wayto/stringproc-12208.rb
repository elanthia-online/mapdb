start_room = [2579, 2580, 2581, 2582, 2583, 2584, 2585, 2586, 2587, 2588, 2589, 2590, 2591, 2592, 2593, 2594, 2595, 2596, 2597, 2598, 2599, 2600, 2601, 2602, 2603, 2604, 2605, 2606, 2607, 2608, 2609, 2610, 2611, 2612, 2613, 2614, 2615, 2616, 12090, 2618, 2617, 2620, 2621, 2622, 2623, 2624, 2625, 2626, 2627, 2628, 2629, 2630, 2631, 2632, 2633]
dirs = ["southwest", "east", "southeast", "west", "west", "southwest", "east", "east", "east", "southeast", "west", "west", "west", "west", "southwest", "east", "east", "east", "east", "east", "southeast", "west", "west", "west", "west", "west", "west", "southwest", "east", "east", "east", "east", "east", "east", "east", "southeast", "west", "west", "west", "west", "west", "west", "west", "west", "southwest", "east", "east", "east", "east", "east", "east", "east", "east", "east", "west", "west", "west", "west", "west", "west", "west", "west", "west", "northeast", "east", "east", "east", "east", "east", "east", "east", "east", "northwest", "west", "west", "west", "west", "west", "west", "west", "northeast", "east", "east", "east", "east", "east", "east", "northwest", "west", "west", "west", "west", "west", "northeast", "east", "east", "east", "east", "northwest", "west", "west", "west", "northeast", "east", "east", "northwest", "west", "northeast"]
if index = start_room.index(Room.current.id)
  until checkloot.include?("maw")
    move dirs[index]
    index += 1
    index = 0 if index >= dirs.length
  end
  move "go maw"
else
  echo "error: mini-script expected a different room"
end
$go2_restart = true
