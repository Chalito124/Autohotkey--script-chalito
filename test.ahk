; -- coding: UTF-8 --
#SingleInstance Force
FileEncoding, UTF-8

delay := 200   ; tiempo de espera entre pasos en ms
cliente := ""
ups := 0

NumpadDiv::  ; tecla /
if (cliente = "" or ups = 0) {
    ; Seleccionar cliente
    Menu, ClienteMenu, Add, Sharff, ClienteSS
    Menu, ClienteMenu, Add, Urbano, ClienteU
    Menu, ClienteMenu, Add, HyR, ClienteH
    Menu, ClienteMenu, Add, Sergio, ClienteS
    Menu, ClienteMenu, Show
    return
} else {
    ; --- Secuencia con clics ---
    MouseClick, left, 227, 516  ; Primer clic
    Sleep, 200  ; Retraso específico de 200 ms para el primer clic

    MouseClick, left, 213, 439  ; Clic en tipo de caja
    Sleep, 400  ; Espera 400 milisegundos mientras abre la ventanita

    if (ups = 1)
        MouseClick, left, 235, 587  ; Pequeña
    else if (ups = 2)
        MouseClick, left, 237, 552  ; Mediana
    Sleep, %delay%

    MouseClick, left, 659, 443  ; Clic en tipo de cliente
    Sleep, %delay%

    if (cliente = "SS")
        MouseClick, left, 655, 510  ; Sharff
    else if (cliente = "U")
        MouseClick, left, 659, 443  ; Urbano
    else if (cliente = "H")
        MouseClick, left, 660, 625  ; HyR
    else if (cliente = "S")
        MouseClick, left, 659, 661  ; Sergio
    Sleep, %delay%

    MouseClick, left, 1137, 655  ; Clic para finalizar
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

ClienteS:
cliente := "S"
goto SeleccionarUPS
return

SeleccionarUPS:
Menu, UPSMenu, Add, Pequeña, UPS1
Menu, UPSMenu, Add, Mediana, UPS2
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
    Send, ^w
    Sleep, 500
    Send, {F5}
    Sleep, 500
    MouseClick, left, 227, 516, 1, , , 3  ; 3 clics en la posición inicial
return
