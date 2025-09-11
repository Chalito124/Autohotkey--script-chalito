# Autohotkey--script-chalito
Trick 


; ===========================
; CONFIGURACIÓN CON MENÚ
; ===========================
cliente := ""
ups := 0

NumpadDiv::  ; la tecla /
    ; Si no hay configuración → abrir menú
    if (cliente = "" or ups = 0) {
        ; Seleccionar cliente
        Menu, ClienteMenu, Add, Sharff (SS), ClienteSS
        Menu, ClienteMenu, Add, Urbano (U), ClienteU
        Menu, ClienteMenu, Add, HyR (H), ClienteH
        Menu, ClienteMenu, Show

        return  ; esperar selección
    }
    else {
        ; --- Secuencia estándar ---
        Send, {Tab}
        Send, 2

        ; Flechas arriba según UPS
        Loop, %ups%
            Send, {Up}

        ; 4 Tabs
        Loop, 4
            Send, {Tab}

        ; Cliente
        Send, %cliente%
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