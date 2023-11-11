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
    Activator:SetRenderMode(RENDERMODE_TRANSALPHA)
    Activator:SetColor(Color(255, 255, 255, 0)) 

    Activator:Give("weapon_fists")
    timer.Simple(120, function()
        self.time_fim = CurTime()
        Activator:SetRenderMode(RENDERMODE_NORMAL)
        Activator:SetColor(Color(255, 255, 255, 255))
        self.weapon_ac = false
    end)
end

