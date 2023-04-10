local framecolor = Color(35,37,44,220)
local framcolor2 = Color(35,37,44)
local buttoncolor = Color(53,59,72)
local white = Color(255,255,255)
local invis = Color(0,0,0,0)
--
questnotifyname = ""

function questnotify()
    local NotifyPanel = vgui.Create("DNotify")
    NotifyPanel:SetPos(15,15)
    NotifyPanel:SetSize(250,160)
    NotifyPanel:SetLife(5)

    -- Gray background panel
    local bg = vgui.Create("DPanel", NotifyPanel)
    bg:Dock(FILL)
    bg:SetBackgroundColor(framecolor)

    -- A yellow label message (parented to background panel)
    local lbl = vgui.Create("DLabel", bg)
    lbl:SetPos(10, -10)
    lbl:SetSize(128, 72)
    lbl:SetText(questnotifyname)
    lbl:SetTextColor(white)
    lbl:SetFont("GModNotify")
    lbl:SetWrap(false)

    -- Add the background panel to the notification
    NotifyPanel:AddItem(bg)
end
concommand.Add("mg_notify", function()
    questnotify()
end)