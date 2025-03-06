save_stance = checkstance
fput "stance offensive" if save_stance != "offensive"
move("climb wide hole")
fput "stance #{save_stance}" if save_stance != checkstance

$go2_restart = true
