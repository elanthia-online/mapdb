if (celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?
  celerity.cast
end
fput "search"
waitrt?
move "go crack"
waitrt?
