if checkleft && checkright
  empty_hands
  need_fill_hands = true
else
  need_fill_hands = false
end
result = dothistimeout "pull ring", 8, /^A deep grinding sound echoes through the sepulchral halls of the shrine.  Slowly, the stone door begins to rise, drawing upwards into the top of its frame.  Inch by inch it crawls, steadily ascending to reveal light beyond.  Within a short time, it has withdrawn completely, leaving an open doorway that beckons you outside\.|^Gathering your strength, you give the brass ring a mighty tug, but it will not budge an inch\.|^Gathering your strength, you give the brass ring a mighty tug\.  Creaking, it gives a little, and you manage to pull it downward some before fatigue forces you to stop\./ until result =~ /^A deep grinding sound echoes through the sepulchral halls of the shrine.  Slowly, the stone door begins to rise, drawing upwards into the top of its frame.  Inch by inch it crawls, steadily ascending to reveal light beyond.  Within a short time, it has withdrawn completely, leaving an open doorway that beckons you outside\.|^Gathering your strength, you give the brass ring a mighty tug, but it will not budge an inch\./
waitrt?
fill_hands if need_fill_hands
move "go door"
