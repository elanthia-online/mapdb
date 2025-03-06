empty_hands
loop do
  result = dothistimeout "climb fissure", 2, /Round time|Roundtime|find yourself|Crawlway/
  waitrt?
  break if !/round/i.match?(result.to_s)
end
fill_hands
