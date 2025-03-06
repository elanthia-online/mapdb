if GameObj.inv.find { |obj| obj.noun == "key" }
  fput "go entryway"
else
  empty_hand
  multifput "get my #{UserVars.spindrift} from my #{UserVars.keysack}", "go entryway", "put my key in my #{UserVars.keysack}"
  fill_hand
end
