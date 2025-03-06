if (celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?
  celerity.cast
end
fput "search"
move "go camouflaged opening"
