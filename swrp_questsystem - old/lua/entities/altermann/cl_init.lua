include("shared.lua")
AddCSLuaFile("cl_altermannconfig.lua")
AddCSLuaFile("altermannconfig.lua")
local ply = LocalPlayer()

local amname = ""

function checkfornamechange_am()
    if QuestAltermannName.AMName == 0 then
        amname = QuestAltermannName.AMName1
    else
        amname = QuestAltermannName.AMName2
    end
end

checkfornamechange_am()

function ENT:Draw()
    self:DrawModel()
    local ang = self:GetAngles()
    local lpos = Vector(0, 0, 80)
    local pos = self:LocalToWorld(lpos)
    ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
    ang:RotateAroundAxis(self:GetAngles():Up(), 90)
    surface.SetFont("s12")
    
    checkfornamechange_am()
    TLength = surface.GetTextSize("Alter Mann") + 50
    
    cam.Start3D2D(pos, ang, 0.1)
    draw.RoundedBox(5, (TLength / 2) * -1, 0, TLength, 50, Color(0, 0, 0, 200))
    draw.SimpleText(amname, "s12", 0, 0, Color(255, 255, 255), 1, 0)
    cam.End3D2D()
end

print(TLength)
ENT.AutomaticFrameAdvance = true
function ENT:Initialize()
    self:DoAnimation()
end

function ENT:Think()
    if ((self.nextAnimCheck or 0) < CurTime()) then
        self:DoAnimation()
        self.nextAnimCheck = CurTime() + 25
    end
    self:SetNextClientThink(CurTime() + 0.25)
    return true
end

net.Receive("altermann_talk1",function()
    local altermann_rage = 15
    if AlterMann == false then
        if altermann_rage == 5 then
            ply:ChatPrint("Rede ich wie ein Droide du Affe? Ich hab gesagt ich habe keine Zeit! und verpiss dich jetzt!")
            altermann_rage = altermann_rage - 15
        else
            ply:ChatPrint("Hey! Ich bin gerade zu beschäftigt um mit dir zu reden. Komm Später wieder.")
            altermann_rage = altermann_rage + 1  
        end
    else
        altermann_talk() 
    end
end)