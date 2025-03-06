group_members = nil; clear.reverse_each { |line|
  if /^Obvious (paths|exits)/.match?(line)
    break
  elsif line =~ /^([A-Za-z ,]+) followed\.$/
    group_members = $1.split(/, | and /)
    group_members.delete_if { |m| m =~ /^[Yy]our / }
    group_members = nil if group_members.empty?
    break
  end
}
result = nil
until result
  ((celerity = Spell[506]) && celerity.known? && celerity.affordable? && !celerity.active?) ? celerity.cast : nil
  fput "search"
  result = matchtimeout(1, /you discover a narrow crevice/)
  waitrt?
  if !result then multimove "n", "s"
  end
end
fput "point crevice" if group_members
move "go crevice"
if group_members
  echo "Waiting for your group... To ditch them, ;send go "; while (group_members.length > 0) && (line = get); if line =~ /^(You reach out and hold )?([A-z][a-z]+)('s hand| joins your group)\.$/
                                                                                                                 group_members.delete $2
                                                                                                               elsif line == "go"
                                                                                                                 break
                                                                                                               end; end; end
