function out(text)
 DEFAULT_CHAT_FRAME:AddMessage(text)
 UIErrorsFrame:AddMessage(text, 1.0, 1.0, 0, 1, 10) 
end

function Ldt_OnLoad()
  out("Ldt: OnLoad");
  SLASH_Ldt1 = "/Ldt";
  SLASH_Ldt2 = "/askdoc";
  SlashCmdList["Ldt"] = function(msg)
    Ldt_SlashCommandHandler(msg);
  end
end

function ShowMainFrame(text)
  local frame = getglobal("Ldt1");
  frame.text = frame.text or frame:CreateFontString(nil);
  frame.text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE, MONOCHROME")
  frame.text:SetAllPoints(true);
  frame.text:SetJustifyH("CENTER");
  frame.text:SetJustifyV("TOP");
  if (text) then
  local oldText = frame.text:GetText();
    if (oldText) then
      frame.text:SetText(text.."\n"..oldText);
    else
      frame.text:SetText(text);
    end
  end
  frame:Show();
end

function Ldt_OnClick(arg1)
   id = this:GetID()
   out("Ldt: OnClick: " .. this:GetName() .. " ,ID: " .. id .. " ,Button:" ..arg1)
end

function Ldt_SlashCommandHandler(msg)
    out("Ldt: " .. msg)
  if (msg == "0") then
   ReloadUI();
  end
  Ldt_Toggle(msg);
end

function Ldt_Toggle(num)
   local frame = getglobal("Ldt" .. num)
   if (frame) then
   if(  frame:IsVisible() ) then
      frame:Hide();
   else
      frame:Show();
   end
   end
end
