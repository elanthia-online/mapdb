id = Room.current.id
move "west" until Room.current.id != id
$go2_restart = true
