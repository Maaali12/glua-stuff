AddCSLuaFile("cl_altermannconfig.lua")
AddCSLuaFile("altermannconfig.lua")
print("cl altermann load")

-- Colors
local framecolor = Color(35,37,44,220)
local framcolor2 = Color(35,37,44)
local buttoncolor = Color(53,59,72)
local white = Color(255,255,255)
local invis = Color(0,0,0,0)

--
surface.CreateFont("s12", {
    font = "Orbitron Regular",
      extended = false,
      size = 40,
      weight = 500,
})

surface.CreateFont("dialogtitle", {
    font = "Orbitron Regular",
      extended = false,
      size = 25,
      weight = 500,
})

surface.CreateFont("dialogtext", {
    font = "Orbitron Regular",
      extended = false,
      size = 19,
      weight = 100,
})

surface.CreateFont("buttontext", {
    font = "Orbitron Regular",
      extended = false,
      size = 19,
      weight = 100,
})

surface.CreateFont("QuestStartText", {
    font = "Orbitron Regular",
      extended = false,
      size = 17,
      weight = 100,
})

--
local amtext1 = ""
local amtext2 = ""
 
function questinit()
    if QuestAlterMannFortschritt.fortschritt1 == 0 then
        amtext1 = questsystem.Altermann.quest1.am1
        amtext2 = ""
        QuestButtonsAlterMann.allowtoclose = true
        QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton11
        QuestButtonsAlterMann.button3 = ""
        QuestButtonsAlterMann.button4 = ""
    end
end

questinit()

function altermann_talk()

    local dialogbox1 = vgui.Create("DFrame")

    dialogbox1:SetTitle("")
    dialogbox1:MakePopup(true)
    dialogbox1:SetSize(0,0)
    dialogbox1:ShowCloseButton(false)

    local isAnimated = true 
    
    dialogbox1:SizeTo(frameW, frameH, animTime, animDelay, animEase, function()
        isAnimated = false 
    end)

    dialogbox1.Paint = function(me, w, h)
        surface.SetDrawColor(framecolor)
        surface.DrawRect(0,0,w,h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(10,10,880,150)
        draw.SimpleText("Alter Mann :","dialogtitle",80,25,white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        draw.SimpleText(amtext1,"dialogtext",15,45,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
        draw.SimpleText(amtext2,"dialogtext",15,65,white,TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
    end

    dialogbox1.Think = function(me)
        if isAnimated then
            me:SetPos(210,550)
        end 
    end

    --

    local dialogbox2 = vgui.Create("DFrame")

    local frameW2 = 200
    local frameH2 = 170

    dialogbox2:SetTitle("")
    dialogbox2:MakePopup(true)
    dialogbox2:SetSize(0,0)
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
            me:SetPos(1120,550)
        end 
    end

    -- Buttons
    local button1 = vgui.Create("DButton", dialogbox2)
    button1:SetText("")
    button1:SetPos(10,10)
    button1:SetSize(180,30)
    button1.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestButtonsAlterMann.button1, "buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    button1.DoClick = function()
        if QuestButtonsAlterMann.allowtoclose == true then
            dialogbox1:Remove()
            dialogbox2:Remove()
        end
    end

    --
    local button2 = vgui.Create("DButton", dialogbox2)
    button2:SetText("")
    button2:SetPos(10,50)
    button2:SetSize(180,30)
    button2.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestButtonsAlterMann.button2, "buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end
    
    button2.DoClick = function()
        if QuestAlterMannFortschritt.fortschritt1 == 0 then
            amtext1 = questsystem.Altermann.quest1.am2
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton21
            QuestButtonsAlterMann.button3 = questsystem.Altermann.quest1.ambutton22
            QuestAlterMannFortschritt.fortschritt1 = QuestAlterMannFortschritt.fortschritt1 + 1
            QuestButtonsAlterMann.allowtoclose = true
        elseif QuestAlterMannFortschritt.fortschritt1 == 1 then
            amtext1 = questsystem.Altermann.quest1.am3
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton31
            QuestButtonsAlterMann.button3 = questsystem.Altermann.quest1.ambutton32
            QuestAlterMannFortschritt.fortschritt1 = QuestAlterMannFortschritt.fortschritt1 + 1
        elseif QuestAlterMannFortschritt.fortschritt1 == 2 then
            amtext1 = questsystem.Altermann.quest1.am4
            amtext2 = ""
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton41
            QuestButtonsAlterMann.button3 = questsystem.Altermann.quest1.ambutton42
            QuestAlterMannFortschritt.fortschritt1 = QuestAlterMannFortschritt.fortschritt1 + 1
        elseif QuestAlterMannFortschritt.fortschritt1 == 3 then
            dialogbox1:Remove()
            dialogbox2:Remove()
            questnotifyname = questsystem.Altermann.quest1.questname
            questnotify()
            amtext1 = questsystem.Altermann.quest1.am5
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton51
            QuestButtonsAlterMann.button3 = questsystem.Altermann.quest1.ambutton52
            QuestAlterMannFortschritt.fortschritt1 = QuestAlterMannFortschritt.fortschritt1 + 1
        elseif QuestAlterMannFortschritt.fortschritt1 == 4 then
            amtext1 = questsystem.Altermann.quest1.am6
            amtext2 = ""
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton61
            QuestButtonsAlterMann.button3 = questsystem.Altermann.quest1.ambutton62
            QuestAlterMannFortschritt.fortschritt1 = QuestAlterMannFortschritt.fortschritt1 + 1
        elseif QuestAlterMannFortschritt.fortschritt1 == 5 then
            amtext1 = questsystem.Altermann.quest1.am7
            amtext2 = questsystem.Altermann.quest1.am71
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton71
            QuestButtonsAlterMann.button3 = questsystem.Altermann.quest1.ambutton72
            QuestAlterMannFortschritt.fortschritt1 = QuestAlterMannFortschritt.fortschritt1 + 1
        end
    end

    --
    local button3 = vgui.Create("DButton",dialogbox2)
    button3:SetText("")
    button3:SetPos(10,90)
    button3:SetSize(180,30)
    button3.Paint = function(me,w,h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0,0,w,h)
        draw.SimpleText(QuestButtonsAlterMann.button3, "buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    button3.DoClick = function()
        if QuestAlterMannFortschritt.fortschritt1 == 2 then
            amtext1 = questsystem.Altermann.quest1.am32
            amtext2 = questsystem.Altermann.quest1.am33
            QuestButtonsAlterMann.button2 = questsystem.Altermann.quest1.ambutton33
            QuestButtonsAlterMann.button3 = ""
        elseif QuestAlterMannFortschritt.fortschritt == 1.2 then
            --
        end
    end

    --
    local button4 = vgui.Create("DButton", dialogbox2)
    button4:SetText("")
    button4:SetPos(10,130)
    button4:SetSize(180,30)
    button4.Paint = function(me, w, h)
        surface.SetDrawColor(framcolor2)
        surface.DrawRect(0, 0, w, h)
        draw.SimpleText(QuestButtonsAlterMann.button4, "buttontext", w * .5, h * .5, white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end
end

--
concommand.Add("mg_debug", function()
    local ply = LocalPlayer()
    ply:ChatPrint("Fortschritt Nummer:")
    ply:ChatPrint("1:")
    ply:ChatPrint(QuestAlterMannFortschritt.fortschritt1)
    ply:ChatPrint("2:")
    ply:ChatPrint(QuestAlterMannFortschritt.fortschritt2)
    ply:ChatPrint("3:")
    ply:ChatPrint(QuestAlterMannFortschritt.fortschritt3)
    ply:ChatPrint("4:")
    ply:ChatPrint(QuestAlterMannFortschritt.fortschritt4)
    ply:ChatPrint("Texte:")
    ply:ChatPrint(amtext1)
    ply:ChatPrint(amtext2)
    ply:ChatPrint("Buttons:")
    ply:ChatPrint(QuestButtonsAlterMann.button1)
    ply:ChatPrint(QuestButtonsAlterMann.button2)
    ply:ChatPrint(QuestButtonsAlterMann.button3)
    ply:ChatPrint(QuestButtonsAlterMann.button4)
end)

concommand.Add("mg_fortschrittdelete", function()
    local ply = LocalPlayer()
    QuestAlterMannFortschritt.fortschritt1 = 0
    QuestAlterMannFortschritt.fortschritt2 = 0
    QuestAlterMannFortschritt.fortschritt3 = 0
    QuestAlterMannFortschritt.fortschritt4 = 0
    questinit()
    ply:ChatPrint("[MG] Fortschritt wurde erfolgreich gelöscht!")
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

concommand.Add("mg_debugqueststart", function()
    local ply = LocalPlayer()
    questnotify()
end)


--
print("cl load")