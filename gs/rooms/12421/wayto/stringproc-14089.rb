if UserVars.rogue_password.nil? || UserVars.rogue_password.empty?
  echo "No Rogue Guild password has been set."
  echo 'example:
vars set rogue_password=kick, slap, turn, scratch, kick, slap'
  exit
end
fput "lean door"
UserVars.rogue_password.split(/, */).each { |verb| fput "#{verb} door" }
fput "go door"
