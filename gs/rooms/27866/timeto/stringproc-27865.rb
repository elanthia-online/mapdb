key = GameObj.inv.find { |k|
  k.name == "cord-strung delicate brass key"
}
(!key.nil?) ? 5 : nil
