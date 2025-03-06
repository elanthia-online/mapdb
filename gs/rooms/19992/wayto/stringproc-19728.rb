fput "open door"
while line = get
  if line == "It's locked, Blazyn!"
    empty_hand
    fput "turn lock"
    fput "open door"
    fput "go door"
    fill_hand
  else
    fput "go door"
  end
  break
end
