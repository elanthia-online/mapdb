loop {
  result = dothistimeout "push lever", 3, /Ok, you push a heavy steel lever protruding from a slit in one wall.  Now what?|Summoning all your strength, you manage to push a heavy steel lever protruding from a slit in one wall forward just enough to lower a wooden drawbridge.|You try to push the heavy steel lever, but it won't budge!/
  break if /Ok, you push a heavy steel lever protruding from a slit in one wall.  Now what?|Summoning all your strength, you manage to push a heavy steel lever protruding from a slit in one wall forward just enough to lower a wooden drawbridge./.match?(result)
}
waitrt?
move "go drawbridge"
