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
empty_hands
move "climb opening"
waitrt?
fill_hands
if group_members.to_a.length > 0
  echo 'Waiting for your group... To ditch them,
send go'
  while (line = get) && (group_members.length > 0)
    if line =~ /(#{group_members.join("|")}) just arrived/
      put "hold " + $1.to_s
    elsif line =~ /^(You reach out and hold )?([A-z][a-z]+)('s hand| joins your group)\.$/
      group_members.delete $2
    elsif line == "go"
      break
    end
  end
end
