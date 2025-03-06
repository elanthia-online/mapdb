["west", "west", "northwest"].each { |d| move(d) }
fput "rub blood"
["southeast", "east", "east"].each { |d| move(d) }
fput "rub hatch"
move("go hatch")
