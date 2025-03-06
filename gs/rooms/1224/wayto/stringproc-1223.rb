Spell[9704].cast if Spell[9704].known? && !Spell[9704].active? && Spell[9704].affordable?
empty_hands
fput "stance offensive" if Skills.climbing < 20
move "climb boulder"
waitrt?
fput "stance defensive"
fill_hands
