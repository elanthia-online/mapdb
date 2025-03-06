fput "open door"
while line = get
  if /That is already open\./.match?(line)
    break
  elsif /There doesn't seem to be any way to do that\./.match?(line)
    if GameObj.right_hand.type == "gem"
    else
      echo "In order to get past this door you must sacrifice a gem.\n Place a cheap gem in your right hand and unpause the script (;unpause) to continue."
      pause_script
      wait_until { GameObj.right_hand.name !~ /Empty/ }
    end
    fput "put ##{GameObj.right_hand.id} in vaalorn door"
    break
  end
end
fput "go door"
