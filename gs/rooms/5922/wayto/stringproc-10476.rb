move "go niche"
while Room.current.id == 5922
  line = get?
  if line.nil?
    sleep 0.2
  elsif line == "Your eyes have recovered from the poor light within the niche."
    move "go niche"
    break
  end
end
