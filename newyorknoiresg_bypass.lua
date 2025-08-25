// MacTavish решил, что уберет проблему с читерами на своём проекте, сохраняя оригинальный render.Capture в локальную переменную, но к сожалению в гаррисмоде защита от читеров так не работает.

OldNetReceive = net.Receive

local IsScreenGrab = false

local netreceivename = 'DarkRP.InvChechSync'

net.Receive = function(name, ...)
	if name == netreceivename then
		IsScreenGrab = true
		timer.Simple(2, function()
			IsScreenGrab = false
		end)
    end
    return OldNetReceive(name, ...)
end

--[[ Если чудо-разработчики в очередной раз додумаются сменить название ресиву, то отслеживание нового идентификатора через дебаг функции никто не отменял)

OldNetReceive = net.Receive

local IsScreenGrab = false

local netreceivedir = 'gamemodes/darkrp/gamemode/client/tabui_control.lua'

net.Receive = function(name, ...)
    local info = debug.getinfo(2, 'S')
    local path = info.short_src
	if path == netreceivedir then
		IsScreenGrab = true
		timer.Simple(2, function()
			IsScreenGrab = false
		end)
    end
    return OldNetReceive(name, ...)
end

]]