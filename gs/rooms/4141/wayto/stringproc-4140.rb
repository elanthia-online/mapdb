spell_list = [407, 1604, 304, 1207]; until dothistimeout("go gate", 5, /^The bronze gate appears to be closed\.$|^Obvious (?:paths|exits): none$/) =~ /^Obvious/; if spell_num = spell_list.find { |num| Spell[num].known? }
                                                                                                                                                                    spell = Spell[spell_num]; loop {
                                                                                                                                                                      unless spell.affordable?
                                                                                                                                                                        echo "waiting for mana..."
                                                                                                                                                                        wait_until { spell.affordable? }
                                                                                                                                                                      end
                                                                                                                                                                      break unless /^\[Spell Hindrance/.match?(spell.cast("gate"))
                                                                                                                                                                    }
                                                                                                                                                                  elsif (Stats.prof == "Warrior") && (Stats.level >= 15)
                                                                                                                                                                    empty_hands
                                                                                                                                                                    fput "batter gate"
                                                                                                                                                                    sleep 0.5
                                                                                                                                                                    waitrt?
                                                                                                                                                                    fill_hands
                                                                                                                                                                  else
                                                                                                                                                                    empty_hands
                                                                                                                                                                    dothistimeout("push bronze gate", 16, /^(?:With a shocking lack of resistance, t|T)he (?:huge )?(?:bronze )?gate .* open|^The ancient hinges of the gate creak loudly as they give way|^Summoning the power .*? gate opens|the gate slowly opens wide enough to allow passage|The bronze gate pops open|^It's opened wide enough to slip through now\.  That thick chain won't let it open any farther\.$|just (came|went) through a massive bronze gate\.$/)
                                                                                                                                                                    fill_hands
                                                                                                                                                                  end
                                     end
