cur_stance = checkstance
empty_hands
fput("stance offensive") if cur_stance != "offensive"
move("climb exposed basalt")
fill_hands
fput("stance " + cur_stance) if cur_stance != "offensive"
$go2_restart = true
