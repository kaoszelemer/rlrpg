
local Character = Class("Character")

function Character:init(name, energy, money, aliveness, maxenergy, maxaliveness)
   self.name = name
   self.energy = energy
   self.money = money
   self.aliveness = aliveness
   self.maxenergy = maxenergy
   self.maxaliveness = maxaliveness
end


return Character