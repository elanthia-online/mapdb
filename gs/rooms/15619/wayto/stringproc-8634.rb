open_regex = /^You open|^That is already open\.$|^There doesn't seem to be any way to do that\.$|^What were you referring to\?|^I could not find what you were referring to\./
get_regex = /^You (?:shield the opening of .*? from view as you |discreetly |carefully |deftly )?(?:remove|draw|grab|reach|slip|tuck|retrieve|already have|unsheathe|detach)|^Get what\?$|^Why don't you leave some for others\?$|^You need a free hand|^You already have that/
put_regex = /^You (?:attempt to shield .*? from view as you |discreetly |carefully |absent-mindedly )?(?:put|place|slip|tuck|add|hang|drop|untie your|find an incomplete bundle|wipe off .*? and sheathe)|^A sigh of grateful pleasure can be heard as you feed .*? to your|^As you place|^I could not find what you were referring to\.$|^Your bundle would be too large|^The .+ is too large to be bundled\.|^As you place your|^The .*? is already a bundle|^Your .*? won't fit in .*?\.$|^You can't .+ It's closed!$|^You can't put/

sack_name = UserVars.day_pass_sack
sack =
  GameObj.inv.find { |obj| obj.noun == sack_name } ||
  GameObj.inv.find { |obj| obj.name == sack_name } ||
  GameObj.inv.find { |obj| obj.name =~ /\b#{Regexp.escape(sack_name)}$/i } ||
  GameObj.inv.find { |obj| obj.name =~ /\b#{sack_name.split(" ").collect { |n| Regexp.escape(n) }.join(".*\\b")}/i }

close_sack = false
if sack.contents.nil?
  open_result = dothistimeout "open ##{sack.id}", 10, open_regex
  if /^You open/.match?(open_result)
    close_sack = true
  else
    dothistimeout "look in ##{sack.id}", 10, /In the .*? you see/
  end
end
empty_hand
$mapdb_day_passes.keys.each { |id|
  if $mapdb_day_passes[id][:expires] < (Time.now - 10)
    dothistimeout "_drag ##{id} drop", 2, /^As you let go|^You drop/
    $mapdb_day_passes.delete(id)
  end
}
pass_id = $mapdb_day_passes.keys.find { |id| $mapdb_day_passes[id][:towns].include?("Wehnimer's Landing") and $mapdb_day_passes[id][:towns].include?("Icemule Trace") and $mapdb_day_passes[id][:expires] > (Time.now + 10) }
if pass_id
  dothistimeout "get ##{pass_id}", 10, get_regex
elsif /^(yes|true)$|\bimt,wl\b/i.match?(UserVars.mapdb_buy_day_pass.to_s)
  move "go corridor"
  fput "unhide" if hidden? || invisible?
  dothistimeout "ask halfling for wehnimer", 10, /says to you/
  result = dothistimeout "ask halfling for wehnimer", 10, /don't have enough|quickly hands you/
  if (result =~ /don't have enough/) && $go2_get_silvers
    ["out", "go gate", "southeast", "southeast", "northeast", "southeast", "south", "west", "south", "east", "east", "south", "south", "east", "north", "north", "go archway"].each { |dir| move dir }
    dothistimeout "withdraw 5000", 10, /carefully records|through the books/
    ["out", "south", "south", "west", "north", "north", "west", "west", "north", "east", "north", "northwest", "southwest", "northwest", "northwest", "go gate", "go door"].each { |dir| move dir }
    fput "unhide" if hidden? || invisible?
    result = dothistimeout "ask halfling for wehnimer", 10, /says to you|don't have enough|quickly hands you/
    if /says to you/.match?(result)
      result = dothistimeout "ask halfling for wehnimer", 10, /don't have enough|quickly hands you/
    end
  end
  if /quickly hands you/.match?(result)
    if GameObj.right_hand.noun == "pass"
      pass_id = GameObj.right_hand.id
    elsif GameObj.left_hand.noun == "pass"
      pass_id = GameObj.left_hand.id
    end
    fput "look ##{pass_id}"
    move "go corridor"
  elsif /don't have enough/.match?(result)
    echo "error: You are too poor to buy Chronomage day passes.  Turning off buy_day_pass setting."
    sleep 3
    UserVars.mapdb_buy_day_pass = "no"
  end
end
if pass_id
  dothistimeout "raise ##{pass_id}", 10, /whirlwind of color subsides|pass is expired|not valid for departures|As you go to raise your pass, you realize|Raise what/
  dothistimeout "_drag ##{pass_id} ##{sack.id}", 10, put_regex
else
  $mapdb_day_passes.clear
  UserVars.mapdb_find_day_pass = "yes"
  $restart_go2 = true
end
fill_hand
if close_sack
  dothistimeout "close ##{sack.id}", 2, /^You close/
end
