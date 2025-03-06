eyespy = Spell[707]; unless eyespy.affordable?
                       echo "waiting for mana..."
                       wait_until { eyespy.affordable? }
                     end
eyespy.cast
["out", "south", "door", "northwest", "northeast", "west", "water", "grate", "southeast", "southeast", "open", "stair"].each { |dir|
  fput "tell eye to go " + dir
}
result = dothistimeout "tell eye to read basalt", 10, /The (?:wy'zio|ag'loenar|odeir'cos|beiron'fyn|ikar'fyn|quiss'fyn|erikar'fyn|lorae'tyr|shien'tyr|vakra|grk'tyr) rune glows with a pallid light on the surface of the panel of basalt/
rune = /The (wy'zio|ag'loenar|odeir'cos|beiron'fyn|ikar'fyn|quiss'fyn|erikar'fyn|lorae'tyr|shien'tyr|vakra|grk'tyr) rune glows with a pallid light on the surface of the panel of basalt/.match(result).captures.first ? fput("draw " + rune + " rune on basalt") : nil
result = dothistimeout "tell eye to read chalcedony", 10, /The (?:wy'zio|ag'loenar|odeir'cos|beiron'fyn|ikar'fyn|quiss'fyn|erikar'fyn|lorae'tyr|shien'tyr|vakra|grk'tyr) rune glows with a pallid light on the surface of the panel of chalcedony/
/The (wy'zio|ag'loenar|odeir'cos|beiron'fyn|ikar'fyn|quiss'fyn|erikar'fyn|lorae'tyr|shien'tyr|vakra|grk'tyr) rune glows with a pallid light on the surface of the panel of chalcedony/.match(result).captures.first ? fput("draw " + rune + " rune on chalcedony") : nil
fput "tell eye to return"
