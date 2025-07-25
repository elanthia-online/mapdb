force_go2 = proc { |room_num|
  go2_count = Script.running.count { |s| s.name == "go2" }
  force_start_script "go2", [room_num.to_s]
  wait_while { Script.running.count { |s| s.name == "go2" } > go2_count }
}
script = Script.self
rrcitizen = nil
if Char.citizenship == "River's Rest"
  rrcitizen = true
end
amulet = nil
driftwood = nil
close_containers = []
lootsack = if UserVars.lootsack.nil? || UserVars.lootsack.empty?
  GameObj.inv.find { |obj| obj.noun =~ /cloak|longcoat|backpack|pack/ }
else
  GameObj.inv.find { |obj| obj.name =~ /#{Regexp.escape(UserVars.lootsack.strip)}/i } || GameObj.inv.find { |obj| obj.name =~ /#{Regexp.escape(UserVars.lootsack).sub(" ", " .*")}/i }
end
find_all_containers_var = nil
find_all_containers = proc {
  if find_all_containers_var.nil?
    hp = proc { |ss|
      if /^You are wearing/.match?(ss)
        DownstreamHook.remove("find_all_container_ids")
        nil
      else
        ss
      end
    }
    DownstreamHook.add("find_all_container_ids", hp)
    restore_silent = script.silent
    restore_want_downstream = script.want_downstream
    restore_want_downstream_xml = script.want_downstream_xml
    script.silent = true
    script.want_downstream = false
    script.want_downstream_xml = true
    clear
    put "inventory containers"
    script.silent = restore_silent
    timeout = Time.now + 30
    container_ids = []
    while (Time.now < timeout) && (line = get)
      if /^You are wearing/.match?(line)
        container_ids = line.scan(/<a exist="([^"]+)"/).flatten
        break
      end
    end
    script.want_downstream = restore_want_downstream
    script.want_downstream_xml = restore_want_downstream_xml
    clear
    find_all_containers_var = container_ids.collect { |id| GameObj[id] }
  end
  find_all_containers_var
}
empty_hands
if lootsack
  if lootsack.contents.nil?
    result = dothistimeout "open ##{lootsack.id}", 2, /^You open|^Oh no|already open|^There doesn't seem to be any way to do that|^What were you referring to|^I could not find what you were referring to/
    echo result
    if lootsack.contents.nil? && result =~ (/^Oh no|already open/)
      dothistimeout "look in ##{lootsack.id}", 10, /^In the|^Peering|^You absentmindedly|^There is nothing|^That is closed|^What were you referring to|^I could not find what you were referring to|is stuffed with a variety of/
    elsif /^You open|^Oh no|already open|^You glance/.match?(result)
      close_containers.push(lootsack)
    end
  end
  if rrcitizen
    driftwood = lootsack.contents.find { |obj| obj.name == "piece of sun-washed driftwood" }
  end
  amulet = lootsack.contents.find { |obj| obj.name == "crystal amulet" }
end
if amulet.nil? && driftwood.nil?
  find_all_containers.call.each do |container|
    next if container == lootsack
    if container.contents.nil?
      result = dothistimeout "open ##{container.id}", 10, /^You open|Oh no|is already open|^There doesn't seem to be any way to do that|^What were you referring to|^I could not find what you were referring to/
      if container.contents.nil? && result =~ (/already open/)
        dothistimeout "look in ##{container.id}", 10, /^In the|^There is nothing|^That is closed|^What were you referring to|^I could not find what you were referring to|is stuffed with a variety of/
      elsif /^You open|^You glance/.match?(result)
        close_containers.push(container)
      end
    end
    if rrcitizen
      if driftwood = container.contents.find { |obj| obj.name == "piece of sun-washed driftwood" }
        break
      end
    end
    if amulet = container.contents.find { |obj| obj.name == "crystal amulet" }
      break
    end
  end
end
if rrcitizen && driftwood
  dothistimeout "_drag ##{driftwood.id} right", 10, /^You (?:carefully )?(?:remove|grab|reach|slip|tuck)|^Get what/
elsif amulet
  dothistimeout "_drag ##{amulet.id} right", 10, /^You (?:carefully )?(?:remove|grab|reach|slip|tuck)|^Get what/
elsif $go2_get_silvers
  Room.current
  force_go2.call("bank --disable-confirm")
  fput "unhide" if hidden? || invisible?
  withdraw_result = dothistimeout "withdraw 2000 silvers", 10, /hands you|don't seem to have that much/
  unless /hands you/.match?(withdraw_result)
    echo "Too poor to go to River's Rest"
    exit
  end
  force_go2.call("alchemist --disable-confirm")
  fput "unhide" if hidden? || invisible?
  fput "order 10"
  buy_result = dothistimeout "buy", 10, /hands you a crystal amulet|Looks like you might buckle under this weight/
  unless /hands you a crystal amulet/.match?(buy_result)
    echo "Too encumbered to go to River's Rest"
    exit
  end
  if righthand?("amulet")
    GameObj.right_hand
  end
  force_go2.call("bank --disable-confirm")
  fput "unhide" if hidden? || invisible?
  fput "deposit all"
  force_go2.call("6274 --disable-confirm")
else
  echo "You have no crystal amulet!  If you want this script to buy you one, issue the command: ;go2 --getsilvers=on"
  close_containers.each { |c| fput "close ##{c.id}" }
  fill_hands
  exit
end
if rrcitizen && driftwood
  fput "put my driftwood in giant's boot"
else
  fput "put my crystal amulet in giant's boot"
end
move "go giant's boot"
fill_hands
