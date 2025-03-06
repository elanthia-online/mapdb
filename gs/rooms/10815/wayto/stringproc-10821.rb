if (resolve = Spell[9704]) && resolve.known? && resolve.affordable? && !resolve.active?
  resolve.cast
end
empty_hands
move "go water"
waitrt?
