3.times {
  waitrt?
  fput "stand" unless standing?
  waitrt?
  climb_result = dothistimeout "climb stone", 3, /^(?:You start to climb the column of stone, but it proves so slippery that you slide back down and end up on the ground in a heap\.|You dance lightly up the column of stone and into the area beyond\.)$/
  break if /^You dance/.match?(climb_result)
}
