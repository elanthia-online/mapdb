while checkpaths == ["ne", "se", "sw", "nw"]
  move ["northwest", "southwest"][rand(2)]
end
move "east" while checkpaths.include?("e")
