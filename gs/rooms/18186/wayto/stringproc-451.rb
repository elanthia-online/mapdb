start_time = Time.now.to_i
refill_hands = false
if GameObj.right_hand.id || GameObj.left_hand.id
  (refill_hands = true
   empty_hands
  )
end
fput "go opening"
fput "lay"
_respond "#{monsterbold_start}Waiting for 'one on the left and one on the right'.#{monsterbold_end}"
waitfor "one on the left and one on the right"
fput "lean left"
_respond "#{monsterbold_start}Waiting for 'branches off to the left just ahead'.#{monsterbold_end}"
waitfor "branches off to the left just ahead"
fput "lean left"
_respond "#{monsterbold_start}Waiting for 'Another tunnel branches off to the left just ahead'.#{monsterbold_end}"
waitfor "Another tunnel branches off to the left just ahead"
_respond "#{monsterbold_start}Waiting for 'Suddenly the tunnel turns into a nearly vertical drop'.#{monsterbold_end}"
waitfor "Suddenly the tunnel turns into a nearly vertical drop"
fput "lean left"
_respond "#{monsterbold_start}Waiting to exit the tunnels.#{monsterbold_end}"
waitfor "Obvious paths: southwest"
_respond "#{monsterbold_start}water tunnel time: #{Time.now.to_i - start_time} seconds.#{monsterbold_end}"
fill_hands if refill_hands
