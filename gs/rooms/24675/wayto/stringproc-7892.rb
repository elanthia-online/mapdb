result = nil
until result =~ /Obvious paths: northwest/
  fput "stand" until standing?
  result = dothistimeout "go fog", 5, /You attempt to navigate your way through the fog, but get turned around and come right back out where you started!|Obvious paths: northwest/
  if /You attempt to navigate your way through the fog, but get turned around and come right back out where you started!/.match?(result)
    sleep 0.5
    waitrt?
  end
end
UserVars.mapdb_redforest_location = nil
$go2_restart = true
