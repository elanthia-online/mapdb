fput "open door"
while line = get
  if ["You open the nearly invisible stone door.", "That is already open."].include?(line)
    fput "go door"
    break
  elsif line == "It appears to be locked."
    empty_hands
    fput "get lockpick"
    fput "pick door"
    fput "stow lockpick"
    fill_hands
    fput "open door"
    fput "go door"
    break
  end
end
