until GameObj.loot.find { |o| o.noun == "gap" }
  fput "search"
  waitrt?
end
move "go gap"
