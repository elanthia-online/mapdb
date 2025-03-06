table = "Silk"
fput "go #{table} table" if /inviting you|invites you/.match?(dothistimeout("go #{table} table", 25, /You (?:and your group )?head over to|waves.*you.*(?:invites|inviting) you(?: and your group)? to (?:join|come sit at)/))
