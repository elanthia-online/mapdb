worn = !GameObj[UserVars.mapdb_fwi_trinket].nil?
return_to_container_id = nil
flip_tags = !Script.current.want_downstream_xml
status_tags if flip_tags
unless worn
  refill_hands = (!GameObj.left_hand.id.nil? and !GameObj.right_hand.id.nil?)
  empty_hand if refill_hands
  trinket_pattern = /#{UserVars.mapdb_fwi_trinket.split(" ").join(".*")}/
  trinket_get_pattern = /You.*?#{UserVars.mapdb_fwi_trinket.split(" ").join(".*")}/
  link_pattern = /<a exist="(?<exist>-?\d+)" noun="(?<noun>[^"]+)">(?<name>[^<]+)<\/a>/
  get_result = dothistimeout "get my #{UserVars.mapdb_fwi_trinket}", 5, Regexp.union(trinket_get_pattern, /^Get what/)
  if GameObj[UserVars.mapdb_fwi_trinket].nil? || get_result =~ (/Get what/)
    (status_tags if flip_tags
     fail "could not find your fwi trinket: #{UserVars.mapdb_fwi_trinket.inspect}")
  end
  return_to_container_id = get_result.split("</inv>").last.scan(link_pattern).find { |exist, noun, name| !name.match(trinket_pattern) }.first
end
UserVars.mapdb_fwi_return_room = (/Isle of Four Winds|Mist Harbor/.match?(Map.current.location) ? nil : Map.current.id)
dothistimeout "turn ##{GameObj[UserVars.mapdb_fwi_trinket].id}", 5, /You get the feeling|<nav rm=/
status_tags if flip_tags
unless worn
  return_to_container_id.nil? ? fput("stow ##{GameObj[UserVars.mapdb_fwi_trinket].id}") : fput("put ##{GameObj[UserVars.mapdb_fwi_trinket].id} in ##{return_to_container_id}")
  fill_hands if refill_hands
end
$go2_restart = true
