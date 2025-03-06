done = false
stairs_look = dothistimeout "look staircase", 3, /you could easily scramble up them to the ledge above.|It really doesn't make much sense./
if /you could easily scramble up them to the ledge above/.match?(stairs_look)
  done = true
end
runes = {"O" => "R", "R" => "S", "Z" => "Z", "S" => "O", "E" => "E"}
result = stairs = under = nil
look = true
refill_hands = false
while done == false
  if GameObj.right_hand.id && GameObj.left_hand.id
    (refill_hands = true
     empty_hands
    )
  end
  if look == true

    result = dothistimeout "look runes", 3, /There are five protrusions with rune markings. .*? Four of the runes are lined up in a row, labeled: R, S, Z and O, in dwarven.  The last one, labeled (\w), is directly under the (\w) rune./
    if result =~ /There are five protrusions with rune markings. .*? Four of the runes are lined up in a row, labeled: R, S, Z and O, in dwarven.  The last one, labeled (\w), is directly under the (\w) rune./

      $1
      under = $2
      look = false
    else
      under = "e"
    end
  end
  result = dothistimeout "press #{runes[under.to_s]} rune", 5, /You touch the \w rune.  With a loud grinding sound, .*?.  (.*?)  Curiously the (\w) rune seems to have shifted position.  It is now lined up under the (\w) rune.|.*?Nothing happens||You touch the E rune.  With a loud grinding sound, the entire staircase lowers into the ledge./
  if result =~ /You touch the \w rune.  With a loud grinding sound, .*?.  (.*?)  Curiously the (\w) rune seems to have shifted position.  It is now lined up under the (\w) rune./

    stairs = $1
    $2
    under = $3
  elsif /.*?Nothing happens/.match?(result)
    under = "E"
    look = false
  elsif /You touch the E rune./.match?(result)
    look = true
  end
  done = true if /complete staircase/.match?(stairs)
  if under.nil? && (done == false)

    echo "something went wrong working with the runes.  Pausing go2."
    pause_script
  end
end
fill_hands if refill_hands
move("go staircase")
