unless move "go door"
  echo "Waiting for the door to open... "
  waitfor "You hear a soft click from the door and it suddenly flies open."
  move "go door"
end
