result = dothistimeout "look pillar", 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/; if /dark eye/.match?(result)
                                                                                                                                          loop {
                                                                                                                                            wait_until { Spell[717].affordable? }
                                                                                                                                            result = cast(717, "pillar")
                                                                                                                                            /Cast Roundtime/.match?(result) ? break : nil
                                                                                                                                          }
                                                                                                                                        elsif /hazy black/.match?(result)
                                                                                                                                          loop {
                                                                                                                                            wait_until { Spell[704].affordable? }
                                                                                                                                            result = cast(704, "pillar")
                                                                                                                                            /Cast Roundtime/.match?(result) ? break : nil
                                                                                                                                          }
                                                                                                                                        elsif /slate grey/.match?(result)
                                                                                                                                          loop {
                                                                                                                                            wait_until { Spell[705].affordable? }
                                                                                                                                            result = cast(705, "pillar")
                                                                                                                                            /Cast Roundtime/.match?(result) ? break : nil
                                                                                                                                          }
                                                                                                                                        elsif /blood-drop/.match?(result)
                                                                                                                                          loop {
                                                                                                                                            wait_until { Spell[701].affordable? }
                                                                                                                                            result = cast(701, "pillar")
                                                                                                                                            /Cast Roundtime/.match?(result) ? break : nil
                                                                                                                                          }
                                                                                                                                        elsif /radiating circle/.match?(result)
                                                                                                                                          loop {
                                                                                                                                            wait_until { Spell[702].affordable? }
                                                                                                                                            result = cast(702, "pillar")
                                                                                                                                            /Cast Roundtime/.match?(result) ? break : nil
                                                                                                                                          }
                                                                                                                                        elsif /dark cloud/.match?(result)
                                                                                                                                          loop {
                                                                                                                                            wait_until { Spell[703].affordable? }
                                                                                                                                            result = cast(703, "pillar")
                                                                                                                                            /Cast Roundtime/.match?(result) ? break : nil
                                                                                                                                          }
                                                                                                                                        end
result = dothistimeout "look other pillar", 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if /dark eye/.match?(result)
  loop {
    wait_until { Spell[717].affordable? }
    result = cast(717, "other pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /hazy black/.match?(result)
  loop {
    wait_until { Spell[704].affordable? }
    result = cast(704, "other pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /slate grey/.match?(result)
  loop {
    wait_until { Spell[705].affordable? }
    result = cast(705, "other pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /blood-drop/.match?(result)
  loop {
    wait_until { Spell[701].affordable? }
    result = cast(701, "other pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /radiating circle/.match?(result)
  loop {
    wait_until { Spell[702].affordable? }
    result = cast(702, "other pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /dark cloud/.match?(result)
  loop {
    wait_until { Spell[703].affordable? }
    result = cast(703, "other pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
end
result = dothistimeout "look third pillar", 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if /dark eye/.match?(result)
  loop {
    wait_until { Spell[717].affordable? }
    result = cast(717, "third pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /hazy black/.match?(result)
  loop {
    wait_until { Spell[704].affordable? }
    result = cast(704, "third pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /slate grey/.match?(result)
  loop {
    wait_until { Spell[705].affordable? }
    result = cast(705, "third pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /blood-drop/.match?(result)
  loop {
    wait_until { Spell[701].affordable? }
    result = cast(701, "third pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /radiating circle/.match?(result)
  loop {
    wait_until { Spell[702].affordable? }
    result = cast(702, "third pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /dark cloud/.match?(result)
  loop {
    wait_until { Spell[703].affordable? }
    result = cast(703, "third pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
end
result = dothistimeout "look fourth pillar", 5, /dark cloud|dark eye|hazy black|slate grey|blood-drop|dark cloud|radiating circle|consist of/
if /dark eye/.match?(result)
  loop {
    wait_until { Spell[717].affordable? }
    result = cast(717, "fourth pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /hazy black/.match?(result)
  loop {
    wait_until { Spell[704].affordable? }
    result = cast(704, "fourth pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /slate grey/.match?(result)
  loop {
    wait_until { Spell[705].affordable? }
    result = cast(705, "fourth pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /blood-drop/.match?(result)
  loop {
    wait_until { Spell[701].affordable? }
    result = cast(701, "fourth pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /radiating circle/.match?(result)
  loop {
    wait_until { Spell[702].affordable? }
    result = cast(702, "fourth pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
elsif /dark cloud/.match?(result)
  loop {
    wait_until { Spell[703].affordable? }
    result = cast(703, "fourth pillar")
    /Cast Roundtime/.match?(result) ? break : nil
  }
end
