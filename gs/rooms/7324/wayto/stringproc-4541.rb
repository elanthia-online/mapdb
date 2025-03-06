group_members = nil
clear.reverse_each { |line|
  if /^Obvious (paths|exits)/.match?(line)
    break
  elsif line =~ /^([A-Za-z ,]+) followed\.$/
    group_members = $1.split(/, | and /)
    group_members.delete_if { |m| m =~ /^[Yy]our / }
    group_members = nil if group_members.empty?
    break
  end
}
fput "yell jaron galarn"
sleep 1
result = nil
success = /Feeling around in the darkness, you stumble upon a low opening in the wall near the ground./
matches = /Feeling around in the darkness, you stumble upon a low opening in the wall near the ground.|As you blindly search the area, you find something rooted to the ground|You feel around in the darkness as best you can, but find nothing./
until result =~ success
  fput "stand" until standing?
  result = dothistimeout "search", 5, matches
  waitrt?
end
until checkpaths("south")
  fput "go opening"
  sleep 0.2
end
fput "stand" until standing?
if group_members.to_a.length > 0
  echo 'Waiting for your group... To ditch them,
send go'
  wait_until { (group_members.to_a - GameObj.pcs.to_a.delete_if { |pc| !pc.status.nil? }.collect { |pc| pc.name }).empty? or clear.find { |line| line == "go" } }
end
