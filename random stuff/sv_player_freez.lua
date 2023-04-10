-- Spieler einfrieren

hook.Add("PhysgunPickup","physgun_unfreeze",function(ply, ent)
    if IsValid(ent) and ent:IsPlayer() and ent:IsFrozen() then
        ent:Freeze(false)
        DarkRP.notify(ply, 3, 5, "Spieler freigelassen!")
    end
end)

hook.Add("PhysgunDrop","physgun_freeze",function(ply,ent)
    if ent:IsPlayer() and not ent:IsFrozen() and ply:KeyDown(IN_ATTACK2) then
        timer.Simple(0.1,function()
            ent:Freeze(true)
            DarkRP.notify(ply, 3, 5, "Spieler eingefroren!")
        end)
    end
end)