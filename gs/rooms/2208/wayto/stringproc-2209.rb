empty_hands
begin
result = dothistimeout 'climb fissure', 2, /Round time|Roundtime|find yourself|Crawlway/
waitrt?
end until result.to_s !~ /round/i
fill_hands