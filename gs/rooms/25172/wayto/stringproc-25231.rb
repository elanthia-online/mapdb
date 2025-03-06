save_stance = checkstance
fput "stance offensive" if save_stance != "offensive"
put "climb latrine pit"
move("climb latrine pit")
fput "stance #{save_stance}" if save_stance != checkstance

$go2_restart = true
