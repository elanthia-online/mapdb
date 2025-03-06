color_moves = {"blue" => "n,sw,sw", "black" => "n,sw,sw,sw,s,se", "red" => "n,se,se", "yellow" => "n,se,se,se,s,sw"}
GameObj.room_desc.find { |o| o.name =~ /(blue|black|yellow|red) barrier/ }
color = $1
move_order = color_moves[color].split(",")
move_order.each { |w| move(w) }
move("go grotto")
fput "touch crystal"
move("out")
move_order.reverse_each { |w| move(reverse_direction(w)) }
move("go barrier")
