choice = nil
res = dothistimeout "inquire", 5, /(\d)\) Vornavis/
(res =~ /(\d)\) Vornavis/) ? choice = $1 : nil
dothistimeout "order #{choice}", 5, /The cost has already been covered/
put "order confirm"
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
