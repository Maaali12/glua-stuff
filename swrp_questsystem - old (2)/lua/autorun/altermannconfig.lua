questsystem = {}

if SERVER then
    print("Hello")
end
--Name
QuestAltermannName = {
    AM0Name = "Alter Mann",
    AM1Name = "Lupa Schmakulo",
    AMName = 0,
}

--Fortschritt
QuestAlterMannFortschritt = {
    fortschritt1 = 0,
    fortschritt2 = 0,
    fortschritt3 = 0,
    fortschritt4 = 0,
}


--Freundschaft
QuestAlterMannFreundschaft = {
    Freundschaft = 0,
}

--Buttons
QuestButtonsAlterMann = {
    button1 = "Schließen",
    button2 = "",
    button3 = "",
    button4 = "",
    allowtoclose = true,
}

--Quests
questsystem.Altermann = {}
questsystem.Altermann.quest1 = {
    questname = "Quest: Der Fremde Mann",
    am1 = "Hallo Fremder! Wie kann ich dir Helfen?",
    ambutton11 = "Wer bist du?",
    ambutton12 = "",
    ambutton13 = "",
    --
    am2 = "Du möchtest Wissen wer ich bin?",
    ambutton21 = "Ja gerne!",
    ambutton22 = "",
    ambutton23 = "",
    ambutton24 = "",
    --
    am3 = "Bevor ich dir meinen Namen verrate, musst du etwas für mich erledigen.",
    am31 = "",
    ambutton31 = "Was denn?",
    ambutton32 = "Nö! Kannst mich mal!",
    ambutton33 = "okey...",
    am32 = "Na komm schon. Tu mir diesen gefallen.",
    am33 = "Du wirst es nicht bereuen!",
    --
    am4 = "Du sollst zu unserer Schmiedin gehen und etwas für mich abholen.",
    ambutton41 = "Alles Klar!",
    ambutton42 = "",
    ambutton43 = "",
    --
    am5 = "Und? Warst du bei ihr?",
    ambutton51 = "Ja!",
    ambutton52 = "Noch nicht.",
    ambutton53 = "",
    --
    am6 = "Nun da du mir ein gefallen getan hast, werde ich dir meinen Namen nenen...",
    am61 = "",
    ambutton61 = "Wie lautet er?",
    ambutton62 = "",
    ambutton63 = "",
    --
    am7 = "Mein Name lautet: ...",
    am71 = "Lupa Schmakulo!"
    ambutton71 = "",
    ambutton72 = "",

}
