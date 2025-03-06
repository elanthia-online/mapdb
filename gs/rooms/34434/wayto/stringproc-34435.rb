refill_hand = false
key_worn = false
if !checkleft.nil? && !checkright.nil?
  (refill_hand = true
   empty_hand)
end
key_worn = true if GameObj.inv.find { |obj| obj.name =~ /#{UserVars.key.split(" ").join(".*?")}/ }
fput "remove my #{UserVars.key}" if key_worn
fput "get my #{UserVars.key} from my #{UserVars.key_sack}" if !key_worn
door = "bright door"
multifput "unlock #{door}", "open #{door}", "go #{door}", "close #{door}", "lock #{door}"
fput "wear my #{UserVars.key}" if key_worn
fput "put my #{UserVars.key} in my #{UserVars.key_sack}" if !key_worn
fill_hand if refill_hand
