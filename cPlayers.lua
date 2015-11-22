--[[
  Class contain loggined players
--]]

-- Class for player
cPlayers = {};

-- Global players handler
gPlayers = {};

-------------------------------------------------------------------------------

function cPlayers:new(aName)
  local object = {};

  -- object.uuid = uuid;
  object.name = string.lower(aName);
  object.lastMsgTime = 0;
  object.warningsCount = 0;

  setmetatable(object, self);

  self.__index = self;

  return object;
end

-------------------------------------------------------------------------------

function cPlayers:setLastMsgTime(aTime)
  self.lastMsgTime = aTime;
end

-------------------------------------------------------------------------------

function cPlayers:getLastMsgTime()
  return self.lastMsgTime;
end

-------------------------------------------------------------------------------

function cPlayers:getWarningsCount()

  return self.warningsCount;
end

-------------------------------------------------------------------------------

function cPlayers:increaseWarnings()

  self.warningsCount = self.warningsCount + 1;
end

-------------------------------------------------------------------------------

