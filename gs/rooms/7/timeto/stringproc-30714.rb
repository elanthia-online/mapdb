UserVars.mapdb_use_urchins == true and !UserVars.mapdb_urchins_expire.nil? and Time.now.to_i < UserVars.mapdb_urchins_expire and !hidden? and (!invisible?) ? 0.1 : nil
