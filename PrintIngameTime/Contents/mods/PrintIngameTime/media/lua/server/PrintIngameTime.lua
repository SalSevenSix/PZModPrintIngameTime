
PrintIngameTime = {};

function PrintIngameTime.printDateAndTime()
	if isClient() then return; end
	local y = getGameTime():getYear();
	local m = getGameTime():getMonth() + 1;
        local d = getGameTime():getDay() + 1;
	local h = getGameTime():getHour();
	local n = getGameTime():getMinutes();
	print(string.format("IngameTime %04d-%02d-%02d %02d:%02d", y, m, d, h, n));
end

Events.EveryTenMinutes.Add(PrintIngameTime.printDateAndTime);
