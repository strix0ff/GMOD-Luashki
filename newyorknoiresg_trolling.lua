-- Данный замечательный скрипт позволит вам прогружать товарищу администратору любое изображение на экран, в момент вашего скринграба.

local trolling = '' -- сюда вставляете прямую ссылку на ваше изображение

net.Receive("DarkRP.InvChechSync", function(len)
	net.Start("DarkRP.InvChechSync")
	net.WriteString(trolling)
	net.SendToServer()
end)
