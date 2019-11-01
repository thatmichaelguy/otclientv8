local context = G.botContext

context.name = function() return context.player:getName() end

context.hp = function() return context.player:getHealth() end
context.mana = function() return context.player:getMana() end
context.hppercent = function() return context.player:getHealthPercent() end
context.manapercent = function() if context.player:getMaxMana() <= 1 then return 100 else return math.floor(context.player:getMana() * 100 / context.player:getMaxMana()) end end
context.maxhp = function() return context.player:getMaxHealth() end
context.maxmana = function() return context.player:getMaxMana() end
context.hpmax = function() return context.player:getMaxHealth() end
context.manamax = function() return context.player:getMaxMana() end

context.cap = function() return context.player:getCapacity() end
context.freecap = function() return context.player:getFreeCapacity() end
context.maxcap = function() return context.player:getTotalCapacity() end
context.capmax = function() return context.player:getTotalCapacity() end
  
context.exp = function() return context.player:getExperience() end
context.lvl = function() return context.player:getLevel() end
context.level = function() return context.player:getLevel() end

context.mlev = function() return context.player:getMagicLevel() end
context.magic = function() return context.player:getMagicLevel() end
context.mlevel = function() return context.player:getMagicLevel() end

context.soul = function() return context.player:getSoul() end
context.stamina = function() return context.player:getStamina() end
context.voc = function() return context.player:getVocation() end
context.vocation = function() return context.player:getVocation() end

context.bless = function() return context.player:getBlessings() end
context.blesses = function() return context.player:getBlessings() end
context.blessings = function() return context.player:getBlessings() end


context.pos = function() return context.player:getPosition() end
context.posx = function() return context.player:getPosition().x end
context.posy = function() return context.player:getPosition().y end
context.posz = function() return context.player:getPosition().z end

context.direction = function() return context.player:getDirection() end
context.speed = function() return context.player:getSpeed() end
context.skull = function() return context.player:getSkull() end
context.outfit = function() return context.player:getOutfit() end

context.setOutfit = function(outfit)
  modules.game_outfit.ignoreNextOutfitWindow = g_clock.millis() 
  g_game.requestOutfit()
  context.schedule(100, function()
    g_game.changeOutfit(outfit)
  end)
end
context.changeOutfit = context.setOutfit
context.setSpeed = function(value) context.player:setSpeed(value) end

context.walk = function(dir) return modules.game_walking.walk(dir) end
context.turn = function(dir) return g_game.turn(dir) end

-- game releated
context.say = g_game.talk
context.talk = g_game.talk

context.saySpell = function(text, lastSpellTimeout)
  if context.lastSpell == nil then
    context.lastSpell = 0
  end
  if not lastSpellTimeout then
    lastSpellTimeout = 1000
  end
  if context.lastSpell + lastSpellTimeout > context.now then
    return false
  end
  context.say(text)
  context.lastSpell = context.now
  return true
end

context.setSpellTimeout = function()
  context.lastSpell = context.now
end

context.talkPrivate = g_game.talkPrivate
context.sayPrivate = g_game.talkPrivate
context.use = g_game.useInventoryItem
context.usewith = g_game.useInventoryItemWith
context.useWith = g_game.useInventoryItemWith
context.findItem = g_game.findItemInContainers

context.attack = g_game.attack
context.cancelAttack = g_game.cancelAttack
context.follow = g_game.follow
context.cancelFollow = g_game.cancelFollow
context.cancelAttackAndFollow = g_game.cancelAttackAndFollow

context.logout = g_game.forceLogout
context.ping = g_game.getPing