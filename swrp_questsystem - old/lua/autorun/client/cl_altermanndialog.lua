-- Colors
local framecolor = Color(35, 37, 44, 220)
local framcolor2 = Color(35, 37, 44)
local buttoncolor = Color(53, 59, 72)
local white = Color(255, 255, 255)
local invis = Color(0, 0, 0, 0)

-- Fonts
surface.CreateFont("quest_system.standard", {
    font = "Orbitron Regular",
      extended = false,
      size = 40,
      weight = 500,
})

surface.CreateFont("quest_system.dialogtitle", {
    font = "Orbitron Regular",
      extended = false,
      size = 25,
      weight = 500,
})

surface.CreateFont("quest_system.dialogtext", {
    font = "Orbitron Regular",
      extended = false,
      size = 19,
      weight = 100,
})

surface.CreateFont("quest_system.buttontext", {
    font = "Orbitron Regular",
      extended = false,
      size = 19,
      weight = 100,
})

surface.CreateFont("quest_system.QuestStartText", {
    font = "Orbitron Regular",
      extended = false,
      size = 17,
      weight = 100,
})

--
function altermann_talk()

    local frameW = 900
    local frameH = 170
    local animTime = 0.5
    local animDelay = 0
    local animEase = .25
    
    local dialogbox1 = vgui.Create("DFrame")

    dialogbox1:SetTitle("")
    dialogbox1:MakePopup(true)
    dialogbox1:SetSize(0, 0)
    dialogbox1:ShowCloseButton(false)

    local isAnimated = true 
    
    dialogbox1:SizeTo(frameW, frameH, animTime, animDelay, animEase, function()
        isAnimated = false 
    end)

    dialogbox1.Paint = function(me, w, h)
        surface.SetDrawColor(framecolor)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(10, 10, 880, 150)
        draw.SimpleText("Alter Mann :","quest_system.dialogtitle",80,25,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        draw.SimpleText(am0,"quest_system.dialogtext",15,60,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
    end

    dialogbox1.Think = function(me)
        if isAnimated then
            me:SetPos(210, 550)
        end 
    end

    --

    local dialogbox2 = vgui.Create("DFrame")

    local frameW2 = 200
    local frameH2 = 170

    dialogbox2:SetTitle("")
    dialogbox2:MakePopup(true)
    dialogbox2:SetSize(0, 0)
    dialogbox2:ShowCloseButton(false)

    dialogbox2:SizeTo(frameW2, frameH2, animTime, animDelay, animEase, function()
        isAnimated = false 
    end)

    dialogbox2.Paint = function(me, w, h)
        surface.SetDrawColor(framecolor)
        surface.DrawRect(0, 0, w, h)
    end

    dialogbox2.Think = function(me)
        if isAnimated then
            me:SetPos(1120, 550)
        end 
    end

    -- Buttons
    local QuestSystem = {}
    local QuestSystem.buttons = {
        button_1 = ""
        button_2 = ""
        button_3 = ""
        button_4 = "Test"
    }
    
    

    local allowtoclose = true
    
    local button1 = vgui.Create("DButton", dialogbox2)
    button1:SetText("")
    button1:SetPos(10, 50)
    button1:SetSize(180, 30)
    button1.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestSystem.buttons.button_1, "quest_system.buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    amfortschritt = 0
    
    button1.DoClick = function()
        if amfortschritt == 0 then
            am0 = am1
            amfortschritt = amfortschritt + 1
            textbutton1 = "Ja gerne!"
            print(amfortschritt)
        elseif amfortschritt == 1 then
            am0 = am2
            amfortschritt = amfortschritt + 1
            textbutton1 = "Okey"
            print(amfortschritt)
        elseif amfortschritt == 2 then
            am0 = am3 
            amfortschritt = amfortschritt + 1
            textbutton1 = "Gar kein Problem!"
            dialogbox1:Remove()
            dialogbox2:Remove()
            print(amfortschritt)
        elseif amfortschritt == 3 then
            am0 = am4 
            amfortschritt = amfortschritt + 1
            print(amfortschritt)
        elseif amfortschritt == 4 then
            am0 = am5 
            amfortschritt = amfortschritt + 1
            print(amfortschritt)
        end
    end

    --
    local button2 = vgui.Create("DButton", dialogbox2)
    button2:SetText("")
    button2:SetPos(10, 90)
    button2:SetSize(180, 30)
    button2.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestSystem.buttons.button_2, "quest_system.buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    --
    local button3 = vgui.Create("DButton", dialogbox2)
    button3:SetText("")
    button3:SetPos(10, 130)
    button3:SetSize(180, 30)
    button3.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestSystem.buttons.button_3, "quest_system.buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    --Close button
    local closebutton = vgui.Create("DButton", dialogbox2)
    closebutton:SetText("")
    closebutton:SetPos(10, 10)
    closebutton:SetSize(180, 30)
    closebutton.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestSystem.buttons.button_4, "quest_system.buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    closebutton.DoClick = function()
        if allowtoclose == true then
            dialogbox1:Remove()
            dialogbox2:Remove()
        end
    end
end

--
function startquest()
    local frameW = 300
    local frameH = 170
    local animTime = 1.5
    local animDelay = 0
    local animEase = .30
    
    local startquest = vgui.Create("DFrame")

    startquest:SetTitle("")
    startquest:MakePopup(true)
    startquest:SetSize(0, 0)
    startquest:ShowCloseButton(true)

    local isAnimated = true 
    
    startquest:SizeTo(frameW, frameH, animTime, animDelay, animEase, function()
        isAnimated = false 
    end)

    startquest.Paint = function(me, w, h)
        surface.SetDrawColor(framecolor)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(10, 10, 280, 150)
        draw.SimpleText(QuestAltermann1.questnameam1,"quest_system.QuestStartText",15,13,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
        draw.SimpleText("Der Alte Mann braucht deine Hilfe!","QuestStartText",15,60,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
    end

    startquest.Think = function(me)
        if isAnimated then
            me:SetPos(50,150)
        end 
    end
end

--
concommand.Add("mg_debug", function()
    local ply = LocalPlayer()
    ply:ChatPrint("Fortschritt Nummer:")
    ply:ChatPrint(amfortschritt)
    ply:ChatPrint("AM Code:")
    ply:ChatPrint(am)
end)

concommand.Add("mg_fortschrittdelete", function()
    local ply = LocalPlayer()
    amfortschritt = 0
    ply:ChatPrint("Fortschritt wurde erfolgreich gelöscht!")
end)

concommand.Add("mg_name", function()
    local ply = LocalPlayer()
    local namechange = 0
    if namechange == 0 then
        QuestAltermannName.AMName = 0
        namechange = namechange + 1
        print(namechange)
    elseif namechange == 1 then
        QuestAltermannName.AMName = 1
        namechange = namechange - 1
        print(namechange)
    end
    checkfornamechange_am()
    ply:ChatPrint("Name Geändert.")
end)

concommand.Add("starwuest", function()
    local ply = LocalPlayer()
    startquest()
end)