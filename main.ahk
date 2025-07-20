#SingleInstance, Force


buttonImage := "C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\roll.png" 
stopImage   := "C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\elixir4.png"  

Gui, Add, Button, gStartLoop, Start
Gui, Show,, Image Clicker
return

StartLoop:
    SetTimer, CheckImages, 100  
return

CheckImages:
    CoordMode, Pixel, Screen
    CoordMode, Mouse, Screen

    ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\elixir4.png
    ; found the elixir and now needs to act based upon it
    if (ErrorLevel = 0) {
        if (x < 600)
            slot := 1
        else if (x < 680)
            slot := 2
        else if (x < 760)
            slot := 3
        else if (x < 860)
            slot := 4
        else if (x < 960)
            slot := 5
        else if (x < 1060)
            slot := 6
        else if (x < 1160)
            slot := 7
        else if (x < 1260)
            slot := 8
        else if (x < 1360)
            slot := 9
        else
            slot := 10
        
        FormatTime, timestamp,, yyyy-MM-dd HH:mm:ss
        FileAppend, %timestamp% - Slot: %slot% - X: %x% Y: %y%`n, %A_ScriptDir%\click_log.txt
        ; now we know which slot its in
        if(slot <=5){
            ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\dice.png
            if(ErrorLevel = 0){
                Click, %x%, %y%
            }
            Sleep, 1000
            ImageSearch, x, y, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\smalldice.png
            if(ErrorLevel = 0){
                Click, %x%, %y%
            }
            Sleep, 2500
            ;using the small dice
            Loop, %slot%{
                ImageSearch, btnX, btnY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %buttonImage%
                if(ErrorLevel = 0){
                    Click, %btnX%, %btnY%
                    FileAppend, %timestamp% - clicked, slot: %slot%, %A_ScriptDir%\click_log.txt
                }
                Click, %x%, %y%
                987686
            }
            ImageSearch, btnX, btnY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\dice.png
            Click, %btnX%, %btnY%
            Sleep, 500
            ImageSearch, btnX, btnY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\largedice.png
            Click, %btnX%, %btnY%
            Sleep, 500
        }
    ;errorlevel loop
    }

    ImageSearch, btnX, btnY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 %buttonImage%
    if (ErrorLevel = 0) {
        Click, %btnX%, %btnY%
        Sleep, 50
        Click, %btnX%, %btnY%
        Sleep, 300
        ;move the mouse 300px to the right so it won't cover the button
        MouseMove, 300, 0, 0, R
    }else{
        ImageSearch, btnX, btnY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\skip2.png
        if(ErrorLevel = 0){
            Click, %btnX%, %btnY%
            Sleep, 1000
        }else{
            ImageSearch, btnX, btnY, 0, 0, A_ScreenWidth, A_ScreenHeight, *30 C:\Users\shyskill\Downloads\Infinity Elixir Macro Game Board\skip.png
            Click, %btnX%, %btnY%
            Sleep, 1000
        }

    }
return


B::
    ExitApp


GuiClose:
    ExitApp
