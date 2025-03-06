if [407, 1604, 304, 1207].any? { |num| Spell[num].known? }
  0.6
elsif (Stats.prof == "Warrior") && (Stats.level >= 15)
  5.2
else
  30.0
end
