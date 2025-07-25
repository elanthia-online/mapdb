unless move "go door"
  push_result = dothistimeout "push tine", 10, /^Slowly, the stone ring surrounding the crown rotates, finally stopping with the tine set with the|^You grasp the top tine and try to turn it, but it won't even budge.$/ until push_result =~ /^Slowly, the stone ring surrounding the crown rotates, finally stopping with the tine set with the (?:reflective glass stone aligned with the word 'Honor'|clear crystal stone aligned with the word 'Truth'|milky white stone aligned with the word 'Piety'|dull grey stone aligned with the word 'Humility'|flawless silver stone aligned with the word 'Faith'|veil iron stone aligned with the word 'Courage').$|^You grasp the top tine and try to turn it, but it won't even budge.$/
  unless push_result.nil? || (push_result == "You grasp the top tine and try to turn it, but it won't even budge.")
    unless mana < 100
      castables = [110, 120, 140, 210, 216, 230, 420, 425, 430, 520, 540, 620, 625, 650, 1040, 1110, 1115, 1601, 1602, 1603, 1604, 1607, 1613, 1614, 1615].sort { |a, b| a.to_s[-2..] <=> b.to_s[-2..] }.reverse.collect { |n| Spell[n] }
      castables.delete_if { |spell| spell.nil? or !spell.known? }
      mana5spells = [105, 205, 305, 405, 505, 605, 705, 905, 1005, 1105, 1205, 1605].collect { |n| Spell[n] }
      mana5spells.delete_if { |spell| spell.nil? or !spell.known? }
      mana_needed = 100
      while (mana_needed > 0) && ((Spell[515].active? && (spell = mana5spells.find { |s| s.known? })) || (spell = castables.find { |s| s.mana_cost <= mana_needed }) || (spell = castables.reverse.find { |s| s.mana_cost >= mana_needed }))
        loop {
          cast_result = spell.cast("crown")
          break unless /^\[Spell Hindrance for/.match?(cast_result)
        }
        mana_needed -= spell.mana_cost
        sleep 0.1
      end
    end
    fput "release" if Spell[515].active? && (checkprep != "None")
    fput "touch crown"
    fput "say Aenatumgana"
    sleep 0.5
  end
  move "go door"
end
