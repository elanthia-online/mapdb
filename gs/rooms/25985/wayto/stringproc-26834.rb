if GameObj.inv.find { |obj| obj.noun == "key" }
  fput "go beechwood door"
else
  empty_hand
  multifput "get my #{UserVars.journeys_end} from my #{UserVars.keysack}", "go beechwood door", "put my key in my #{UserVars.keysack}"
  fill_hand
end
