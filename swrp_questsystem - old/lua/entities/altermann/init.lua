AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/player/eli.mdl")
	self:SetHullType(HULL_HUMAN) 
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE) 
	self:DropToFloor(true)
end

util.AddNetworkString("altermann_talk1")

function ENT:AcceptInput( Name, Activator, Caller )	
	if Name == "Use" and Caller:IsPlayer() then
		net.Start("altermann_talk1")
		net.Send(Caller)
	end
end