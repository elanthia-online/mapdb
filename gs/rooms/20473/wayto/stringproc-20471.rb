if (resolve = Spell[9704]) && resolve.known? && resolve.affordable? && !resolve.active?
  resolve.cast
end
if (waterwalking = Spell[112]) && waterwalking.known? && waterwalking.affordable? && !waterwalking.active?
  waterwalking.cast
end
fput(Spell[112].active? ? "go west" : "swim west")
