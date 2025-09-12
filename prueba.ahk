; -- coding: UTF-8 --
#SingleInstance Force
FileEncoding, UTF-8

delay := 150   ; tiempo de espera entre pasos en ms
cliente := ""
ups := 0

NumpadDiv::  ; tecla /
if (cliente = "" or ups = 0) {
    ; Seleccionar cliente
    Menu, ClienteMenu, Add, Sharff , ClienteSS
    Menu, ClienteMenu, Add, Urbano , ClienteU
    Menu, ClienteMenu, Add, HyR , ClienteH
    Menu, ClienteMenu, Show
    return
} else {
    ; --- Secuencia con delay ---
    Send, {Tab}
    Sleep, %delay%

    SendInput, {Numpad2}  
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
Menu, UPSMenu, Add, Pequeña , UPS1
Menu, UPSMenu, Add, Mediana , UPS2
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

; ===========================
; SECUENCIA NUMPAD MULT
; ===========================
NumpadMult::
    SetTitleMatchMode, 2
    ControlSend, , ^w, NombreDeLaVentana  ; Reemplaza con el título de la ventana
    Sleep, 500
    ControlSend, , {F5}, NombreDeLaVentana
    Sleep, 500
    ControlSend, , {Tab 3}, NombreDeLaVentana
return
