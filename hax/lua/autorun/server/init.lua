hook.Add( "PlayerSay", "CommandIndent", function( ply, text, public )
	text = string.lower( text )
	if ( text == "!gui" ) then
		local frame = vgui.Create("DFrame")
		frame:SetPos(1,1)
		frame:SetTitle("TEST GUI")
		frame:SetVisible(true)
		frame:SetDraggable(true)
		frame:ShowCloseButton(true)
		frame:SetMouseInputEnabled(true)
		frame:SetKeyboardInputEnabled(true)
		frame:MakePopup()
	end
	if ( text == "!kill" ) then
		ply:Kill()
		return ""
	end
	if ( string.sub(text, 1, 5) == "!heal") then
		if ( string.sub(text, 6) == "") then
			ply:SetHealth(ply:GetMaxHealth())
		else
			ply:SetHealth(ply:Health() + string.sub(text, 6))
			if ( ply:Health() > ply:GetMaxHealth()) then
				ply:SetHealth(ply:GetMaxHealth())
			end
		end
		return text
	end
	if ( string.sub(text, 1, 5) == "!hurt") then
		if (string.sub(text, 6) == "") then
			ply:Kill()
		else
			ply:SetHealth(ply:Health() - string.sub(text, 6))
		end
		return text
	end
	if ( text == "!god") then
		if ( ply:HasGodMode() == true) then
			ply:GodDisable()
			ply:PrintMessage( HUD_PRINTTALK, "GOD: false")
			return text
		end
		if ( ply:HasGodMode() == false) then
			ply:GodEnable()
			ply:PrintMessage( HUD_PRINTTALK, "GOD: true" )
			return text
		end
	end
	if ( string.sub(text, 1, 5) == "!cmd") then
		game.ConsoleCommand(string.sub(text, 4) .. "\n")
	end
end )