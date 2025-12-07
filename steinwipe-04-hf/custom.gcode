;BBS_P1_Template Custom G-code
;==========================================================
;----------------------LECKIESTEIN-------------------------
;==========================================================

;_SWMC Core_Apr.28.2025
;_Core Version_1
;_Released_Apr.30.2025

;____________ set travel to SteinWipe _______________
G0 F30000 ; set rapid speed
M204 S20000 ; set rapid acceleration 

; _______________ get off part ________________________
G91 ; relative
G2 Z0.5 I0.85 J0.85 P1 ; spiral lift a little
G90 ; absolute

;____________ wiper entry position - do not edit _______________
G0 X161.3 Y261.3 ; go to wiper pad entry position
G91 ; relative 

;_______ set machine specific user offset for SteinWipe __________
G0 X0.8 Y-0.3 ; change this value to suit your machine using provided checker files

;____________ set wiper speeds _______________
G0 F24000 ; Set wipe speed
M204 S20000 ; set wipe acceleration 

;wipe_pattern = x_sweep
;_______________X sweeping____________________
; CCW
G0 X43.2
G3 Y2.65 I0  J1.325
G0 X-43.2
G3 Y-2.65 I0  J-1.325
G0 X43.2
G3 Y2.65 I0  J1.325
G0 X-43.2 
G3 Y-2.65 I0  J-1.325 ; back to starting position 
G0 X43.2
G3 Y2.65 I0  J1.325
G0 X-43.2
G3 Y-2.65 I0  J-1.325
G0 X43.2
G3 Y2.65 I0  J1.325
G0 X-43.2 

;CW
G0 X43.2
G2 Y-2.65 I0 J-1.325
G0 X-43.2
G2 Y2.65 I0 J1.325
G0 X43.2
G2 Y-2.65 I0 J-1.325
G0 X-43.2 ; back to starting position 
G90 ; absolute
G0 X161.3 Y261.3 ; cancel out any user offset before updating position
G92 X161.3 Y261.3 ; tell slicer where we are to avoid travel bug

;_____________ set travel return from SteinWipe ___________________
G0 F30000 ; set rapid speed
M204 S20000 ; set rapid acceleration
G0 Y255 ; move out of wiper area
M83
