put "search"
while line = get
  if /(dead rat|strand of silver hair|broken lockpick|tarnished coin)!$/.match?(line)
    put "search"
  elsif /brick-covered trapdoor!$/.match?(line)
    put "go trapdoor"
    break
  end
end
