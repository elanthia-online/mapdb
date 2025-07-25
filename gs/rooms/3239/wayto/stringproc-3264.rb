r = dothistimeout "open rolaren gate", 10, /^You open|^That is already open|^It appears to be locked/
if /^You open|^That is already open/.match?(r)
  move "go rolaren gate"
elsif /^It appears to be locked/.match?(r)
  spell = Spell["sigil of resolve"]
  spell.known? ? Society.rank / 2 : 0
  if ((1 - (percentencumbrance / 100.0)) * Skills.to_bonus(Skills.climbing)) >= 50
    if spell.known? && !spell.active? && !Spell["POPed muscles"].active?
      echo "Waiting for stamina do sigil of rsolve..." unless stamina(spell.stamina_cost)
      wait_until { stamina(spell.stamina_cost) }
      spell.cast
    end
    move "climb rolaren gate"
  elsif Spell[704].known?
    unless Spell[704].affordable?
      echo "waiting for mana..."
      wait_until { Spell[704].affordable? }
    end
    Spell[704].cast("rolaren gate")
  elsif (num = [407, 1207].find { |n| Spell[n].known? })
    unless Spell[num].affordable?
      echo "waiting for mana..."
      wait_until { Spell[num].affordable? }
    end
    r = Spell[num].cast("rolaren gate", /^The gate vibrates slightly but nothing else happens|^A translucent force slams into the gate, but it remains unaffected/)
    redo if /^\[Spell Hindrance|^The gate vibrates slightly but nothing else happens|^A translucent force slams into the gate, but it remains unaffected/.match?(r)
    move "go rolaren gate"
  else
    echo "error: You can't get through the gate because you can't cast 704, 407, or 1207 and you suck at climbing and/or are too encumbered."
    sleep 2
    exit
  end
else
  $go2_restart = true
end
