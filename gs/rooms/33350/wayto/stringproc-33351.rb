if GameObj.inv.find { |obj| obj.noun == "key" }
  fput "go brick-covered door"
else
  empty_hand
  multifput "get my #{UserVars.safe_harbor} from my #{UserVars.keysack}", "go brick-covered door", "put my key in my #{UserVars.keysack}"
  fill_hand
end
