local bhoplimit = 600
local bhopslow = 100

hook.Add( "OnPlayerHitGround", "slowbhop", function(ply, inWater, onFloater, speed)
	local vel = ply:GetVelocity()
	if bhoplimit == 0 or ( vel.x > bhoplimit or vel.x < -bhoplimit or vel.y > bhoplimit or vel.y < -bhoplimit ) then
		local doSlow = 1 + (bhopslow / 100)
		ply:SetVelocity( Vector( -( vel.x / doSlow ), -( vel.y / doSlow ), 0 ) )
	end
end)