local function download(file, path, check)
	local url = "https://raw.githubusercontent.com/panduh16/panduh/main/" .. file
	local s, r = pcall(function()
		return game:HttpGet(url, true)
	end)

	if s and r and not check then
		writefile(path, r)
		return true
	elseif s and r and check then
		if isfile(path) then
			if readfile(path) == r then
				return true
			else
				return false
			end
		else
			return false
		end

		return false
	end

	return true
end

if not isfile("newvape/version.txt") or not download("version.txt", "newvape/version.txt", true) then
	download("assets/textv4.png", "newvape/assets/new/textv4.png")
	download("assets/textvape.png", "newvape/assets/new/textvape.png")
	download("assets/guiv4.png", "newvape/assets/new/guiv4.png")
	download("assets/guivape.png", "newvape/assets/new/guivape.png")
	download("games/155615604.lua", "newvape/games/155615604.lua")
	download("version.txt", "newvape/version.txt")

	local s, r = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/panduh16/panduh/main/runtime.lua", true)
	end)

	if s and r then
		loadstring(r)()
	end
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
