if (celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?
  celerity.cast
end
until dothistimeout("search", 3, /anything of interest|rough hole/) =~ /rough hole/ do end
move "go hole"
