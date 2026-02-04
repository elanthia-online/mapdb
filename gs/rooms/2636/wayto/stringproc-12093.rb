fput 'go sphere'
loop do
  result = dothistimeout('east', 2, /You are surrounded by an ethereal fog.|You feel every shred of yourself torn to tiny pieces and reformed...|You can do nothing... you can feel nothing... you are nothing.../)
  break if result =~ /You feel every shred of yourself torn to tiny pieces and reformed...|You can do nothing... you can feel nothing... you are nothing.../
  break unless XMLData.room_description.empty?
end
sleep(1) while XMLData.room_description.empty?
fput 'stand' unless standing?