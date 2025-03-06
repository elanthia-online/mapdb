fput "open door"
while line = get
  if ["You open a large stone door.", "That is already open."].include?(line)
    fput "go door"
    break
  elsif line == "It appears to be locked."
    empty_hand
    fput "turn lock"
    fput "open door"
    fput "go door"
    fill_hand
    break
  end
end
