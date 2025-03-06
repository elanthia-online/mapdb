if GameObj.inv.find { |obj| obj.noun =~ /^key(?:ring)?$/ }
  fput "go pine door"
else
  empty_hand
  multifput "get my key from my #{UserVars.key_sack}", "go pine door", "put my key in my #{UserVars.key_sack}"
  fill_hand
end
