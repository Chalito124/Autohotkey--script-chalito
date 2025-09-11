delay := 150   ; tiempo de espera entre pasos en ms
cliente := ""
ups := 0

NumpadDiv::  ; tecla /
    if (cliente = "" or ups = 0) {
        ; Seleccionar cliente
        Menu, ClienteMenu, Add, Sharff (SS), ClienteSS
        Menu, ClienteMenu, Add, Urbano (U), ClienteU
        Menu, ClienteMenu, Add, HyR (H), ClienteH
        Menu, ClienteMenu, Show
        return
    } else {
        ; --- Secuencia con delay ---
        Send, {Tab}
        Sleep, %delay%

        Send, 2
        Sleep, %delay%

        Loop, %ups%
        {
            Send, {Up}
            Sleep, %delay%
        }

        Loop, 4
        {
            Send, {Tab}
            Sleep, %delay%
        }

        Send, %cliente%
        Sleep, %delay%
    }
return

; ===========================
; MENÚS
; ===========================
ClienteSS:
    cliente := "SS"
    goto SeleccionarUPS
return

ClienteU:
    cliente := "U"
    goto SeleccionarUPS
return

ClienteH:
    cliente := "H"
    goto SeleccionarUPS
return

SeleccionarUPS:
    Menu, UPSMenu, Add, Pequeña (1 UPS), UPS1
    Menu, UPSMenu, Add, Mediana (2 UPS), UPS2
    Menu, UPSMenu, Show
return

UPS1:
    ups := 1
    MsgBox, Configurado Cliente: %cliente% | UPS: %ups%`nListo para usar con "/".
return

UPS2:
    ups := 2
    MsgBox, Configurado Cliente: %cliente% | UPS: %ups%`nListo para usar con "/".
return

; ===========================
; RESET MANUAL
; ===========================
^NumpadDiv::   ; Ctrl + / = Reset
    cliente := ""
    ups := 0
    MsgBox, Configuración reiniciada. Vuelve a presionar "/" para elegir cliente y tamaño.
return