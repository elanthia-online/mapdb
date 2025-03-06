sleep(0.2)
_respond "#{monsterbold_start}Waiting for 'ledge comes into view'.  This may take around four minutes.#{monsterbold_end}  #{Time.now}"
waitfor "ledge comes into view and the cab grinds to a clunky halt"
move("out")
