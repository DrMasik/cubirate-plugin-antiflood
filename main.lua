-- =============================================================================
--
-- AntiFlood
-- Written by DrMasik
--
-- The best Minecraft server
-- www.cuberite.org
--

-------------------------------------------------------------------------------

gPluginName = '';

gShowConsoleDebugMessages = true;  -- Disable debug messages to console

gMsgDelay = 3;  -- Delay before send message
gWarningsBeforeKick = 2;  -- How many warnings before kick

-------------------------------------------------------------------------------

function Initialize(Plugin)
  Plugin:SetName("AntiFlood")
  Plugin:SetVersion(20151122)

  gPluginName = Plugin:GetName();

  local pluginDir = cRoot:Get():GetPluginManager():GetCurrentPlugin():GetLocalFolder();

  local msgStorageInitError = "Database initialize error";
  local msgLoadMsgLocaleFail = "Can not load message for en_US locale";

  console_log('-------------------------------------');
  console_log(gPluginName .. " initialize...")

  -- Load hooks
  hooks();

  -- Nice message :)
  console_log(gPluginName ..": Initialized " .. gPluginName .. " v." .. Plugin:GetVersion())

  console_log('-------------------------------------');

  return true
end

-------------------------------------------------------------------------------

function console_log(a_str, msg_type)
-- 0 - standart
-- 1 - debug
-- 2 - error

  local str = '';

  if msg_type == nil then
    msg_type =0;
  end

  if msg_type == 0 then
    str = a_str;
  elseif msg_type == 1 then
    if gShowConsoleDebugMessages then
      str = "Debug: ".. a_str;
    end
  else
    str = "Error: ".. a_str;
  end

  if str ~= '' then
    LOG(gPluginName ..": ".. str);
  end
end

-------------------------------------------------------------------------------

-- :%s/\s\+$//g

-- =============================================================================
