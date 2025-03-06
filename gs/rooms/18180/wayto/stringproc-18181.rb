sleep(0.2)
refill_hands = false
if GameObj.right_hand.id || GameObj.left_hand.id
  (refill_hands = true
   empty_hands
  )
end
if !GameObj.loot.find { |o| o.name == "wooden cab" }

  dothistimeout "close dam", 3, /You push hard on the wooden dam slat and it slides closed.|It is already closed./
  _respond "#{monsterbold_start}Waiting for 'riding on the trellis'.  This may take around four and a half minutes.#{monsterbold_end}  #{Time.now}"
  waitfor "riding on the trellis, crawls down the side of the mountain and comes to a clunky stop"
end
fput "open dam"
sleep(0.5)
waitrt?
fill_hands if refill_hands
move("go cab")
