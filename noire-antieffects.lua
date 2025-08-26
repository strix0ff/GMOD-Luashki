// Убирает все неприятные визуальные и звуковые эффекты при низком HP. [Screengrab detected]

DarkRP.Hud.VitalSigns = function()
end

function DarkRP.Hud.DeathScreen()
	dtg = DarkRP.DeathTime()

	if blackscr > 0 then
		if blackscr == 1 then
			dt = CurTime() + dtg
		end
		blackscr = math.Approach(blackscr, 0, FrameTime() * 0.05)
	end
	prog = ((dt - CurTime()) / dtg)

	if LocalPlayer():getDarkRPVar("KT") then
		draw.SimpleTextOutlined("ID: " .. LocalPlayer():getDarkRPVar("KT"), "MSDFont.28", sx / 2, 10, MSD.Text.d, TEXT_ALIGN_CENTER, 0, 2, color_black)
	end

	draw.SimpleTextOutlined("ВЫ МЕРТВЫ", "Noire.Big", sx / 2, sy / 2 - 100, color_white, TEXT_ALIGN_CENTER, 0, 2, color_black)

	if prog < 0.5 and prog > 0  and LocalPlayer():getDarkRPVar("karma") > 40 then
		draw.SimpleTextOutlined("Вы можете возродиться заранее засчёт вреда рассудку.", "MSDFont.28",sx / 2, sy / 2 + 50, color_white, TEXT_ALIGN_CENTER, 0, 2, color_black)
		draw.SimpleTextOutlined("Ради возрождения без последствий - дождитесь исчезновения полоски ожидания", "MSDFont.24",sx / 2, sy / 2 + 90, color_white, TEXT_ALIGN_CENTER, 0, 2, color_black)
	elseif #team.GetPlayers(13) > 0 and LocalPlayer():Team() ~= 13 then
		draw.SimpleTextOutlined("Возможно, парамедики смогут вас спасти", "MSDFont.28",sx / 2, sy / 2 + 50, color_white, TEXT_ALIGN_CENTER, 0, 2, color_black)
	end
end

function DarkRP.Hud.UnConscious()
	draw.SimpleTextOutlined("ВЫ БЕЗ СОЗНАНИЯ", "Noire.Big", sx / 2, sy / 2 - 100, color_white, TEXT_ALIGN_CENTER, 0, 2, color_black)
end