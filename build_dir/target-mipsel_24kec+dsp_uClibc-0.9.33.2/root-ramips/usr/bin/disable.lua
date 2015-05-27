require("uci")


function disablesta()
	local value = 1


	local x = uci.cursor()

	x:set("wireless","sta","disabled",value)
	x:commit("wireless")

	io.popen("/etc/init.d/network restart")
	print("STA mode is disabled!")
end


function checkssid()

	local count = 0
	local f = io.popen("iwinfo | grep ESSID")
	for l in f:lines() do
		local found = l:match("unknown")
		if found then
			count = count +1
		end
	end
	
	if count > 0 then
		disablesta()
		print("Wifi is restarted")
	end
end

checkssid()

