8.times {
  if (celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?
    celerity.cast
  end
  dothistimeout "search", 3, /You make a careful search of the area and discover a narrow icy ledge!|You don't find anything of interest here./
  break if move "go ledge"
}
