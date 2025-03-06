choice = nil
res = dothistimeout "inquire", 5, /(\d)\) the Sea of Fire/
(res =~ /(\d)\) the Sea of Fire/) ? choice = $1 : nil
dothistimeout "order #{choice}", 5, /You inquire with a caravan conductor about the price of a trip to the Sea of Fire\.  S?[Hh]e says, "That will be [,\d]+ silvers/
res = dothistimeout "order confirm", 5, /It doesn't look like you have enough silver to ride\.|We'll be taking that payment in silver, then\./
if /It doesn't look like you have enough silver to ride\./.match?(res)
  5.times {
    echo "Didn't have enough silver!"
    exit
  }
end
wait_until { XMLData.room_title =~ /Caravan, Wagon/ }
sleep 1
wait_until { XMLData.room_title !~ /Caravan, Wagon/ }
if GameObj.npcs.any? { |npc| npc.name =~ /thief|rogue|bandit|mugger|outlaw|highwayman|marauder|brigand|thug|robber/ }
  3.times {
    _respond "<pushBold/>BANDITS!!! BANDITS!!! BANDITS!!!<popBold/>"
  }
  exit
end
$go2_restart = true
