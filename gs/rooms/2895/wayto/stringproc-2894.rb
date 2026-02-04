resolve=Spell['Sigil of Resolve']
		haste=Spell['Haste']
		if UserVars.mapdb_ice_mode == 'wait' || Skills.survival < 50 || XMLData.encumbrance_value >= 50
			echo 'trying not to slip...'; sleep 6
		elsif resolve.known? && resolve.affordable? && !resolve.active?
			resolve.cast
		end
		result = fput 'up'
		if result =~ /^Rushing heedlessly/
			haste.cast if haste.known? && haste.affordable? && !haste.active?
			fput 'stand'
			$go2_restart = true
		end