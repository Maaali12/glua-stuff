hook.Add("PlayerSpawnProp", "propspawnfix", function(ply, model)
    if not ply:Alive() then return false end
end)