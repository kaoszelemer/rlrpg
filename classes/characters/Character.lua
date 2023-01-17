
local Character = Class("Character")

function Character:init(name, energy, money, aliveness)
   self.name = name
   self.energy = energy
   self.money = money
   self.aliveness = aliveness
end


return Character