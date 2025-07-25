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
fput "stand" unless standing?
fput "jump abyss"
wait_until { stunned? }
wait_while { stunned? }
fput "stand"
if group_members.to_a.length > 0
  echo 'Waiting for your group... To ditch them,
send go'
  wait_until { (group_members.to_a - GameObj.pcs.to_a.delete_if { |pc| !pc.status.nil? }.collect { |pc| pc.name }).empty? or clear.find { |line| line == "go" } }
end
