loop {
  wait_until { Spell[704].affordable? }
  result = cast(704, "banner")
  break unless /Spell Hindrance/.match?(result)
}
