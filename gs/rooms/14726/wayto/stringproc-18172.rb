flip_tags = !Script.current.want_downstream_xml
status_tags if flip_tags
go_result = dothistimeout "go bridge", 3, /which is presently pulled open|<nav rm/
status_tags if flip_tags
if /which is presently pulled open/.match?(go_result)

  climb_platform = false
  refill_hands = false
  move("go opening")
  while climb_platform == false
    waitrt?
    result = dothistimeout "climb platform", 2, /You decide to climb back down|you were able to pull yourself up|I could not find what you were referring to|You figure freeing up both hands might help./
    climb_platform = true if /you were able to pull yourself up|I could not find what you were referring to/.match?(result)
    if /You figure freeing up both hands might help./.match?(result)
      (refill_hands = true
       empty_hands)
    end
  end
  fill_hands if refill_hands == true
  buffed = false
  turn_result = dothistimeout "turn wheel", 3, /The wheel begins to move|you just don't have enough strength to budge it|already been turned and a locking bar is holding it in place./
  if /The wheel begins to move|already been turned and a locking bar is holding it in place./.match?(turn_result)
    move("down")
    move("out")
    move("go bridge")
  elsif buffed == false
    buffs = [606, 509, 9605]
    buffs.each { |num| Spell[num].cast if Spell[num].known? && Spell[num].affordable? }
    redo
  else
    echo "You don't have the strength to turn the wheel on your own.  Pausing here until you can get some help!"
    echo "`;u go2` to unpause the script once the wheel has been turned."
    pause_script
  end
end
