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
move "climb stair"
if group_members
  echo "Waiting for your group... "
  loop do
    if get =~ /^(You reach out and hold )?([A-z][a-z]+)('s hand| joins your group)\.$/
      group_members.delete $2
    end
    break unless group_members.length > 0
  end
end
waitrt?
