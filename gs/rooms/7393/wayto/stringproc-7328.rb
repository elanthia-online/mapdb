result = nil
while result.nil? && Room.current.id == 7393
  result = dothistimeout "crawl hole", 3, /^You crawl under the low overhang/
end
wait_while { stunned? }
fput "stand" until standing?
