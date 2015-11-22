-- ==

--[[

  Load hooks for the plugin

--]]

function hooks()
  cPluginManager:AddHook(cPluginManager.HOOK_EXECUTE_COMMAND,    OnExecuteCommand)
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_DESTROYED,   OnPlayerDestroyed);
  cPluginManager:AddHook(cPluginManager.HOOK_CHAT,               OnChat);
end

--------------------------------------------------------------------------------

function OnChat(aPlayer, aMessage)
  return msgCheck(aPlayer);
end

--------------------------------------------------------------------------------

function msgCheck(aPlayer)

  if not aPlayer then
    return false;
  end

  -- Get player world
  local world = aPlayer:GetWorld();
  local plName = aPlayer:GetName();
  local plUID = aPlayer:GetUniqueID();

  -- is it player into send message
  if not gPlayers[plUID] then
    gPlayers[plUID] = cPlayers:new(plName);
    gPlayers[plUID]:setLastMsgTime(os.time());
    return false;
  end

  -- Check delay
  if (os.time() - gPlayers[plUID]:getLastMsgTime()) < gMsgDelay then

    -- Increase warnings count
    gPlayers[plUID]:increaseWarnings();

    -- Check warnings limit
    if gPlayers[plUID]:getWarningsCount() > gWarningsBeforeKick then
      -- Delete player object
      gPlayers[plUID] = nil;

      -- Kick player
      aPlayer:GetClientHandle():Kick("Too many spam from you (flood).");

      -- Do not show message
      return true;
    end

    -- Update last message time
    gPlayers[plUID]:setLastMsgTime(os.time());

    -- Show player warning message
    aPlayer:SendMessageWarning("Too many flood from you. You will be kicked next time");

    -- Do not show player messge
    return true;
  end

  return false;
end

--------------------------------------------------------------------------------

function OnExecuteCommand(aPlayer, aCommand)

  return msgCheck(aPlayer);
end

--------------------------------------------------------------------------------

function OnPlayerDestroyed(aPlayer)

  return false;
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- =============================================================================
