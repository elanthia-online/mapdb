loop {
  wait_until { Spell[704].affordable? }
  result = cast(704, "scroll")
  break unless /Spell Hindrance/.match?(result)
}
