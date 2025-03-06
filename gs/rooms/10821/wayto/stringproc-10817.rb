loop {
  fput "swim"
  sleep 1
  waitrt?
  break if checkpaths("west") || checkpaths("east")
}
fill_hands
