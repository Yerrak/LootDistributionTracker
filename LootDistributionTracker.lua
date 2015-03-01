function HelloWorld() 
  print("Hello, World!");
end

local frame = CreateFrame("FRAME", "FooAddonFrame");
frame:RegisterEvent("CHAT_MSG_LOOT");
local function eventHandler(...)

  if LOOTS == nil then
      LOOTS = {};
    end


  local args = {...};
  local msg = args[3];

  if string.match(msg, "Beute") or string.match(msg, "Loot") then

      local item = string.match(string.match(msg, 'item:%d+'), '%d+');
      local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount = GetItemInfo(item);
      item = sLink;

  --  printTable( mysplit(msg, "%S"));
    local player = mysplit(msg, "%s")[1];
    

    if string.match(player, "Ihr") or string.match(player, "You") then
      player = UnitName("player");  
    end

    local name, type, difficultyIndex, difficultyName, maxPlayers, dynamicDifficulty,
      isDynamic, mapID = GetInstanceInfo();

      table.insert(LOOTS, player.."|"..item.."|"..mapID);

    postLootInformation(item, player, mapID);
  end
end
frame:SetScript("OnEvent", eventHandler);

function postLootInformation(item, player, mapID)
  print(item, player, mapID);
end

function printTable(table)
    for k, v in pairs( table ) do
        print(k, v)
    end
end

function mysplit(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "[^"..sep.."]+") do
            t[i] = str
            i = i + 1
    end
    return t
end