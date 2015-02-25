local raids = {
	-- Weekly
	['Monday'] = {
		['08:00'] = {raidName = 'RatsThais'},

		['15:00'] = {raidName = 'Arachir the Ancient One'}
	},

	['Wednesday'] = {
		['12:00'] = {raidName = 'OrcsThais'}
	},

	-- By date (Day/Month)
	['31/10'] = {
		['16:00'] = {raidName = 'Halloween Hare'}
	}
}

function onThink(interval, lastExecution, thinkInterval)
	local day, date = os.date('%A'), getRealDate()

	local raidDays = {}
	if raids[day] then
		table.insert(raidDays, raids[day])
	end
	if raids[date] then
		table.insert(raidDays, raids[date])
	end

	if #raidDays == 0 then
		return true
	end

	for i = 1, #raidDays do
		local settings = raidDays[i][getRealTime()]
		if settings and not settings.alreadyExecuted then
				Game.startRaid(settings.raidName)
				settings.alreadyExecuted = true
		end
	end

	return true
end