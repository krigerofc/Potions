AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_init.lua')

include('shared.lua')

function ENT:Initialize()
    self:SetModel("models/props_junk/glassjug01.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self.timer = CurTime()

    local phy = self:GetPhysicsObject()

    if phy:IsValid() then
        phy:Wake()
    end

end


function ENT:Use(Activator, Caller, UseType, Integer)
    self:Remove()
    Activator:Ignite(20, 1)
    Activator:TakeDamage(70)

end

