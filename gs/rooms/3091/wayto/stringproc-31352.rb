if GameObj.inv.find { |obj| obj.noun == "key" }
  fput "go snow cabin"
else
  empty_hand
  multifput "get my key from my #{UserVars.key_sack}", "go snow cabin", "put my key in my #{UserVars.key_sack}"
  fill_hand
end
