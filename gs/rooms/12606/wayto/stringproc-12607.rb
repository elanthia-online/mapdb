10.times {
  if (celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?
    celerity.cast
  end
  dothistimeout "search", 3, /^You (?:carefully )?search|^You don't find anything|^You find nothing else/
  waitrt?
  r = dothistimeout "get crack", 3, /^I could not find|^You reach out|^Get what?/
  break if /^You reach out/.match?(r)
}
empty_hands
move "climb face"
waitrt?
fill_hands
