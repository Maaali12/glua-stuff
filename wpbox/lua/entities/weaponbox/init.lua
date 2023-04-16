AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("wpgui.lua")
include("shared.lua")

resource.AddFile("arrow(1).png")
resource.AddFile("arrow(2).png")

util.AddNetworkString("ChangeColor") 
util.AddNetworkString("isHovering") 
util.AddNetworkString("selectedWeaponsTable") 
util.AddNetworkString("selectedWeaponsTableClient") 
util.AddNetworkString("RandomSupplyBool")
util.AddNetworkString("LimitedSupplyBool")
util.AddNetworkString("SetNextSelection")
util.AddNetworkString("DecreaseWeaponNumber")
util.AddNetworkString("ReturnWeaponNumberDecreased")
util.AddNetworkString("GetWeaponNumber")
util.AddNetworkString("ReturnWeaponNumber")
util.AddNetworkString("UpdateWeaponAmount")
util.AddNetworkString("LimitedSupplyAm")


function ENT:SetWeaponsTable(weaponTable,ply)
    self.weapons = weaponTable
    net.Start("selectedWeaponsTableClient")
    net.WriteEntity(self)
    net.WriteTable(weaponTable)
    net.Send(ply)
end



function ENT:SetLimitedSupplyBool(LimitedSupply)
    self.LimitedSupply = LimitedSupply
  
end


function ENT:DecreaseWeaponAmount(weaponIndex,player)
    
    if(self.InvertedWeaponTable[self.weapons[weaponIndex]] >=  1) then
        self.InvertedWeaponTable[self.weapons[weaponIndex]] = self.InvertedWeaponTable[self.weapons[weaponIndex]] -1 
    end
    net.Start("UpdateWeaponAmount")
    net.WriteEntity(self)
    net.WriteInt(self.InvertedWeaponTable[self.weapons[weaponIndex]],32)
    net.Send(player)

end


function ENT:GetWeaponAmount(weaponIndex)
    return  self.InvertedWeaponTable[self.weapons[weaponIndex]] 
end


net.Receive("GetWeaponNumber",function (len,ply)
    local ent = net.ReadEntity()
    local weaponIndex = net.ReadInt(32)
    if weaponIndex != nil && IsValid(ent) then
        local weaponAmount = ent:GetWeaponAmount(weaponIndex)
        net.Start("ReturnWeaponNumber")
        net.WriteInt(weaponAmount,32)
        net.WriteEntity(ent)
        net.Send(ply)
    end
        
    
   
end)


function ENT:SetNextSelection(right)
    if right then
        if(self.CurrentlySelected == #self.weapons) then
            self.CurrentlySelected = 1
        else                                                    
            self.CurrentlySelected= self.CurrentlySelected+1      
        end
    else
        if(self.CurrentlySelected == 1) then
            self.CurrentlySelected = #self.weapons
        else
            self.CurrentlySelected=self.CurrentlySelected-1
        end
    end
    self:SetSelectedIndex(self.CurrentlySelected)
end

    
local initialColor = nil
function ENT:Initialize()
    self:SetModel("models/items/ammocrate_smg1.mdl")
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_NONE)
    self:DrawShadow(false )
    intialColor = self:GetColor()
    self.CurrentlySelected = 1
    self:SetCanUse(true)
    self:SetSelectedIndex(1)
    
    timer.Simple(0.05,function ()
        if !IsValid(self) then return end
        self.InvertedWeaponTable = {}
        for k,v in pairs(self.weapons) do
            self.InvertedWeaponTable[v]=self:GetLimitedSupplyAmount() 
        
        end
        net.Start("UpdateWeaponAmount")
        net.WriteEntity(self)
        net.WriteInt(self.InvertedWeaponTable[self.weapons[1]],32)
        net.Broadcast()
    end)
end

local isHovering = false 

net.Receive("isHovering",function ()
    isHovering = net.ReadBool()
end)

local canUse = true

local interactionColor  = Color(218,26,26,10)
 
function ENT:Use(caller,activator)
    if self:GetCanUse() && IsValid(self) && !isHovering  then
        self:SetColor(interactionColor)
        self:SetCanUse(false)
        timer.Simple(1,function ()
            if IsValid(self)    then
                if self:GetRandomSupply() && !self:GetLimitedSupply() then
                    weapon = ents.Create(self.weapons[math.random(1,#self.weapons)])
                    weapon:SetPos(self:LocalToWorld(Vector(0,0,30)))
                    weapon:SetMoveType(MOVETYPE_NONE) 
                    weapon:SetParent(self) 
                    weapon:SetAngles(self:LocalToWorldAngles(Angle(0,90,0)) )   
                    weapon:Spawn() 
                    sound.Play( "buttons/combine_button5.wav", self:GetPos() ) 
                    self:SetColor(intialColor) 

                elseif (self:GetRandomSupply() && self:GetLimitedSupply()) then
                    if (IsValid(self) && (self:GetWeaponAmount(1) != nil &&   self:GetWeaponAmount(1) > 0)) then
                        weapon = ents.Create(self.weapons[math.random(1,#self.weapons)]) 
                        weapon:SetPos(self:LocalToWorld(Vector(0,0,30)))
                        weapon:SetMoveType(MOVETYPE_NONE) 
                        weapon:SetParent(self) 
                        weapon:SetAngles(self:LocalToWorldAngles(Angle(0,90,0)) )  
                        weapon:Spawn() 
                        sound.Play( "buttons/combine_button5.wav", self:GetPos() ) 
                        self:SetColor(intialColor)

                    else
                        sound.Play( "buttons/combine_button_locked.wav", self:GetPos() )
                        self:SetColor(intialColor)
                    end
                    self:DecreaseWeaponAmount(1,activator)
                else 
                    if (IsValid(self) && (self:GetWeaponAmount(self.CurrentlySelected) != nil &&   self:GetWeaponAmount(self.CurrentlySelected) > 0) || !self:GetLimitedSupply()) then
                        weapon = ents.Create(self.weapons[self.CurrentlySelected]) 
                        weapon:SetPos(self:LocalToWorld(Vector(0,0,30))) 
                        weapon:SetMoveType(MOVETYPE_NONE) 
                        weapon:SetParent(self) 
                        weapon:SetAngles(self:LocalToWorldAngles(Angle(0,90,0)) )  
                        weapon:Spawn() 
                        sound.Play( "buttons/combine_button5.wav", self:GetPos() ) 
                        self:SetColor(intialColor) 

                    else
                        sound.Play( "buttons/combine_button_locked.wav", self:GetPos() )
                        self:SetColor(intialColor)
                    end
                    self:DecreaseWeaponAmount(self.CurrentlySelected,activator)
                    
                end
            end
            if IsValid(self) then

                self:SetCanUse(true )
            end
        end)
    end
end

net.Receive("SetNextSelection",function ()
    ent = net.ReadEntity()
    nextSelection = net.ReadBool()
    ent:SetNextSelection(nextSelection)
end)

function ENT:Think()

end