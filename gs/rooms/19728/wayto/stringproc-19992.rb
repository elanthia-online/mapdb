if GameObj.loot.find { |item| item.noun == "door" }
else
  fput "push stone"
  fput "stand" until standing?
end
fput "go door"
