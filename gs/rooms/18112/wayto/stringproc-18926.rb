loop {
  wait_until { Spell[704].affordable? }
  result = cast(704, "insignia")
  break unless /Spell Hindrance/.match?(result)
}
