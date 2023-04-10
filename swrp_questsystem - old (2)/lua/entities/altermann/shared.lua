ENT = ENT or {}

ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.PrintName = "Alter Mann"
ENT.Category = "[MG] Quest System"
ENT.Spawnable = true 
ENT.AdminOnly = false 

function ENT:DoAnimation()
    for k,v in ipairs(self:GetSequenceList()) do
        if (v:lower():find("idle") and v != "idlenoise") then
            return self:ResetSequence(k)
        end
    end

    self:ResetSequence(4)
end

print("sh load")