if (UserVars.mapdb_ice_mode == "wait") || ((UserVars.mapdb_ice_mode != "run") && ((percentencumbrance > 50) || ((Skills.survival < 50) && !Spell["Haste"].active?)))
  sleep 0.2
  echo "trying not to slip..."
  sleep 4
end
move "climb rope"
