
PrintIngameTime = {};

PrintIngameTime.printDateAndTime = function()
	if isClient() then return; end
	local y = getGameTime():getYear();
	local m = getGameTime():getMonth() + 1;
        local d = getGameTime():getDay() + 1;
	local h = getGameTime():getHour();
	local n = getGameTime():getMinutes();
	print(string.format("IngameTime %04d-%02d-%02d %02d:%02d", y, m, d, h, n));
end

PrintIngameTime.onCharacterDeath = function(character)
	if isClient() then return; end
	if character:isZombie() then return; end
	local position = character:getCurrentSquare();
	local message = {};
	message[1] = 'PlayerDeath { "player": "';
	message[2] = character:getUsername();
	message[3] = '", "hours": ';
	message[4] = character:getHoursSurvived();
	message[5] = ', "zkills": ';
	message[6] = character:getZombieKills();
	message[7] = ', "position": { "x": ';
	message[8] = position:getX();
	message[9] = ', "y": ';
	message[10] = position:getY();
	message[11] = ', "z": ';
	message[12] = position:getZ();
	message[13] = ' }}';
	print(table.concat(message));
end

Events.EveryTenMinutes.Add(PrintIngameTime.printDateAndTime);
Events.OnCharacterDeath.Add(PrintIngameTime.onCharacterDeath);
