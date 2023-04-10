-- Hide Q Menue

local allowedRanks = {
  ["superadmin"] = true,
  ["admin"] = true,
  ["operator"] = true,
  ["moderator"] = true,
}

hook.Add("ContextMenuOpen", "hide_spawnmenu", function()
	if not allowedRanks[LocalPlayer():GetUserGroup()] then
		return false
	end
end)

hook.Add("SpawnMenuOpen", "hide_spawnmenu", function()
	if not allowedRanks[LocalPlayer():GetUserGroup()] then
		return false
	end
end)
