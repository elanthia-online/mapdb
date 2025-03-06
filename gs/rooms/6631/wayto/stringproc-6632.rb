if (celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?
  celerity.cast
end
until dothistimeout("search", 3, /anything of interest|concealed door/) =~ /concealed door/ do end
move "go door"
