-- Place here: darkrpmodification/lua/darkrp_config/settings.lua

hook.Add("PlayerInitialSpawn", "Admin.only.props", function()
  if not GM and not GAMEMODE then
    print("[Admin only props] Fehler!: Konnte nicht geladen werden") -- Error Message, translate if you want
    return
  end
  
  local allowedRanks = {
    ["superadmin"] = true,
    ["admin"] = true,
    ["moderator"] = true,
    ["supporter"] = true,
    ["Builder"] = true,
    ["User"] = false,
  }

  function GAMEMODE:PlayerSpawnProp(ply, model)
    if allowedRanks[ply:GetUserGroup()] then return true end
    local allowed = GAMEMODE.Config.propspawning
    if not allowed then return false end
    if ply:isArrested() then return false end
    model = string.gsub(tostring(model), "\\", "/")
    model = string.gsub(tostring(model), "//", "/")
    local jobTable = ply:getJobTable()
    if jobTable.PlayerSpawnProp then
        jobTable.PlayerSpawnProp(ply, model)
    end
    return self.Sandbox.PlayerSpawnProp(self, ply, model)
  end
  hook.Remove("PlayerInitialSpawn", "Admin.only.props")
  print("[Admin only props] Erfolgreich geladen!") -- load message, translate if you want
end)