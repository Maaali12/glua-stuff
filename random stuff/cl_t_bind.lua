local on = false

local function simpletoggle()
  on = !on
  if on == true then
    RunConsoleCommand("simple_thirdperson_enabled", 1)
  else
    RunConsoleCommand("simple_thirdperson_enabled", 0)
  end
end
concommand.Add( "simple_thirdperson_toggle", simpletoggle )

hook.Add("PlayerButtonDown","lucid_toggle_thirdperson",function(ply,key)
  if IsFirstTimePredicted() and key == KEY_T then
    RunConsoleCommand( "simple_thirdperson_toggle" )
  end
end)