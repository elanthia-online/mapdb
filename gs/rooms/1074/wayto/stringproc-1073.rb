$group_members = nil; clear.reverse_each { |line|
  if /^Obvious (paths|exits)/.match?(line)
    break
  elsif line =~ /^([A-Za-z ,]+) followed\.$/
    $group_members = $1.split(/, | and /)
    $group_members.delete_if { |m| m =~ /^[Yy]our / }
    $group_members = nil if $group_members.empty?
    break
  end
}
empty_hands
move "climb ladder"
waitrt?
