    #include "p16f1705.inc"

    RADIX DEC           ; Use decimal numbers by default
    ERRORLEVEL -302     ; Kill messages about "Register not in bank 0"
    ERRORLEVEL -305     ; Kill messages about "Using default destination"


 GLOBAL Chip8Code
    
dataw macro instruction
    data high(instruction)
    data low(instruction)
 endm
        
PROG2 CODE 
 
Chip8Code:
; The default Chip-8 hex character set
    data    0xF0,0x90,0x90,0x90,0xF0    ; 0
    data    0x20,0x60,0x20,0x20,0x70    ; 1
    data    0xF0,0x10,0xF0,0x80,0xF0    ; 2
    data    0xF0,0x10,0xF0,0x10,0xF0    ; 3
    data    0xA0,0xA0,0xF0,0x20,0x20    ; 4 
    data    0xF0,0x80,0xF0,0x10,0xF0    ; 5
    data    0xF0,0x80,0xF0,0x90,0xF0    ; 6
    data    0xF0,0x10,0x20,0x40,0x40    ; 7
    data    0xF0,0x90,0xF0,0x90,0xF0    ; 8
    data    0xF0,0x90,0xF0,0x10,0xF0    ; 9
    data    0xF0,0x90,0xF0,0x90,0x90    ; A
    data    0xE0,0x90,0xE0,0x90,0xE0    ; B
    data    0xF0,0x80,0x80,0x80,0xF0    ; C
    data    0xE0,0x90,0x90,0x90,0xE0    ; D
    data    0xF0,0x80,0xF0,0x80,0xF0    ; E
    data    0xF0,0x80,0xF0,0x80,0x80    ; F
    
; Waste space until 0x200 (512 bytes) where the games normally begins at
    res     512-5*16

    
;; TEST - INCREMENT COUNTER FROM 0 TO F at 1HZ RATE AND SHOW IT   
;    dataw 0x620F ; 00 LD V2, 0x0F  
;    dataw 0x6000 ; 02 LD V0, 0
;    dataw 0x00E0 ; 04 CLS
;    dataw 0xF029 ; 06 LD F, V0
;    dataw 0xD005 ; 08 DRW V0, V0, nibble
;    dataw 0x7001 ; 0A ADD V0, 0x01
;    dataw 0x8022 ; 0C AND V0, V2
;    dataw 0x6132 ; 0E LD V1, 50
;    dataw 0xF115 ; 10 LD DT, V1
;;Wait:
;    dataw 0xF107  ; 12 LD V1, DT  ; Check status of delay timer
;    dataw 0x3100  ; 14 SE V1, 0   ; Skip next if delay timer is 0
;    dataw 0x1212  ; 16 JP 0x212    ; goto wait
;    dataw 0x1204  ; 18 JP 0x200
    
    
;; TEST - WAIT FOR KEYPRESS AND DRAW SPRITE LOCATIONS     
;    dataw 0xF00A ; LD V0, K
;    dataw 0x00E0 ; CLS
;    dataw 0xF029 ; LD F, V0
;    dataw 0xD005 ; DRW V0, V0, nibble
;    dataw 0x1200 ; JP 0x200

    ; VBRIX
    dataw   0x00e0
    dataw   0x23b6
    dataw   0x6007
    dataw   0xe09e
    dataw   0x1204
    dataw   0x6800
    dataw   0x6703
    dataw   0x2346
    dataw   0x224a
    dataw   0x22c0
    dataw   0x2366
    dataw   0x238a
    dataw   0x23ac
    dataw   0xf00a
    dataw   0x225a
    dataw   0x225a
    dataw   0x22d0
    dataw   0x2288
    dataw   0x3a00
    dataw   0x121c
    dataw   0x6c01
    dataw   0x23ac
    dataw   0x77ff
    dataw   0x23ac
    dataw   0x6078
    dataw   0xf015
    dataw   0xf007
    dataw   0x3000
    dataw   0x1234
    dataw   0x3700
    dataw   0x121c
    dataw   0x23ac
    dataw   0x6007
    dataw   0xe09e
    dataw   0x1242
    dataw   0x120a
    dataw   0x00fd
    dataw   0x6910
    dataw   0x6002
    dataw   0xa254
    dataw   0xd095
    dataw   0x00ee
    dataw   0x8080
    dataw   0x8080
    dataw   0x8000
    dataw   0x6001
    dataw   0xe0a1
    dataw   0x1268
    dataw   0x6004
    dataw   0xe0a1
    dataw   0x1272
    dataw   0x00ee
    dataw   0x8090
    dataw   0x70ff
    dataw   0x4000
    dataw   0x00ee
    dataw   0x127c
    dataw   0x8090
    dataw   0x7001
    dataw   0x401b
    dataw   0x00ee
    dataw   0x127c
    dataw   0x6102
    dataw   0xa254
    dataw   0xd195
    dataw   0xd105
    dataw   0x8900
    dataw   0x00ee
    dataw   0x80a0
    dataw   0x70fe
    dataw   0x3000
    dataw   0x00ee
    dataw   0x80b0
    dataw   0x8095
    dataw   0x4f00
    dataw   0x00ee
    dataw   0x8100
    dataw   0x6205
    dataw   0x8125
    dataw   0x3f00
    dataw   0x00ee
    dataw   0xa2ba
    dataw   0xf01e
    dataw   0xf065
    dataw   0x8d00
    dataw   0x4b01
    dataw   0x6d01
    dataw   0x4b1e
    dataw   0x6dff
    dataw   0x6c01
    dataw   0x600a
    dataw   0xf018
    dataw   0x00ee
    dataw   0xffff
    dataw   0x0001
    dataw   0x0100
    dataw   0xcb20
    dataw   0x7b01
    dataw   0x6a04
    dataw   0x6c01
    dataw   0x6d01
    dataw   0xa364
    dataw   0xdab1
    dataw   0x00ee
    dataw   0x80a0
    dataw   0x81b0
    dataw   0x8ac4
    dataw   0x8bd4
    dataw   0xa364
    dataw   0x4b01
    dataw   0x6d01
    dataw   0x4b1e
    dataw   0x6dff
    dataw   0x4a3e
    dataw   0x6cff
    dataw   0x4a00
    dataw   0x6c01
    dataw   0xd011
    dataw   0xdab1
    dataw   0x4f00
    dataw   0x00ee
    dataw   0x80a0
    dataw   0x6121
    dataw   0x8015
    dataw   0x4f00
    dataw   0x00ee
    dataw   0x80a0
    dataw   0x81b0
    dataw   0x70de
    dataw   0x71ff
    dataw   0x62ff
    dataw   0x63ff
    dataw   0x6403
    dataw   0x7201
    dataw   0x8045
    dataw   0x3f00
    dataw   0x130a
    dataw   0x7301
    dataw   0x8145
    dataw   0x3f00
    dataw   0x1312
    dataw   0x8020
    dataw   0x8130
    dataw   0x8024
    dataw   0x8024
    dataw   0x8134
    dataw   0x8134
    dataw   0x7022
    dataw   0x7101
    dataw   0xa386
    dataw   0xd013
    dataw   0x7eff
    dataw   0x6000
    dataw   0x8c07
    dataw   0x6002
    dataw   0xf018
    dataw   0x238a
    dataw   0x7801
    dataw   0x238a
    dataw   0x3e00
    dataw   0x00ee
    dataw   0x2366
    dataw   0x00ee
    dataw   0x00e0
    dataw   0x6000
    dataw   0x6100
    dataw   0x621f
    dataw   0xa364
    dataw   0xd011
    dataw   0xd021
    dataw   0x7001
    dataw   0x303f
    dataw   0x1350
    dataw   0xd011
    dataw   0x7101
    dataw   0x3120
    dataw   0x135a
    dataw   0x00ee
    dataw   0x8000
    dataw   0x6101
    dataw   0x630a
    dataw   0xa386
    dataw   0x6022
    dataw   0x6207
    dataw   0xd013
    dataw   0x7003
    dataw   0x72ff
    dataw   0x3200
    dataw   0x1370
    dataw   0x7103
    dataw   0x73ff
    dataw   0x3300
    dataw   0x136c
    dataw   0x6e46
    dataw   0x00ee
    dataw   0xe0a0
    dataw   0xe000
    dataw   0xa3a6
    dataw   0xf833
    dataw   0xf265
    dataw   0x6303
    dataw   0x6402
    dataw   0xf029
    dataw   0xd345
    dataw   0x7305
    dataw   0xf129
    dataw   0xd345
    dataw   0x7305
    dataw   0xf229
    dataw   0xd345
    dataw   0x00ee
    dataw   0x0000
    dataw   0x0000
    dataw   0x0000
    dataw   0x6014
    dataw   0x6102
    dataw   0xf729
    dataw   0xd015
    dataw   0x00ee ;03B6 

    dataw   0x600a ;03B8 mov r0,10 
    dataw   0x610c ;03BA mov r1,12
    dataw   0x6209 ;03BC mov r2,9
    dataw   0x6305 ;03BE mov r3,5
    dataw   0xa3ce ;03C0 mvi TitleSpr
;TtlLoop
    dataw   0xd015 ;03C2 sprite r0,r1,5
    dataw   0xf31e ;03C4 adi r3  
    dataw   0x7005 ;     add r0,5
    dataw   0x72ff ;     add r2,-1
    dataw   0x3200 ;     skeq r2,0
    dataw   0x13c0 ;     jmp TtlLoop
    dataw   0x00ee ;     rts
    dataw   0x9090
    dataw   0x9090
    dataw   0x60e0
    dataw   0x90e0
    dataw   0x90e0
    dataw   0xe090
    dataw   0xe090
    dataw   0x9020
    dataw   0x2020
    dataw   0x2020
    dataw   0x9090
    dataw   0x6090
    dataw   0x9000
    dataw   0x0060
    dataw   0x0000
    dataw   0xf090
    dataw   0xf080
    dataw   0x80f0
    dataw   0x80f0
    dataw   0x10f0
    dataw   0xe090
    dataw   0xe090
    dataw   0x9000
  
    
;; KALEID
;    dataw  0x6000
;    dataw  0x6380
;    dataw  0x611f
;    dataw  0x620f
;    dataw  0x2232
;    dataw  0xa200
;    dataw  0xf31e
;    dataw  0xf00a
;    dataw  0xf055
;    dataw  0x4000
;    dataw  0x121c
;    dataw  0x7301
;    dataw  0x3300
;    dataw  0x1208
;    dataw  0x6380
;    dataw  0xa200
;    dataw  0xf31e
;    dataw  0xf065
;    dataw  0x4000
;    dataw  0x121c
;    dataw  0x7301
;    dataw  0x4300
;    dataw  0x121c
;    dataw  0x2232
;    dataw  0x121e
;    dataw  0x4002
;    dataw  0x72ff
;    dataw  0x4004
;    dataw  0x71ff
;    dataw  0x4006
;    dataw  0x7101
;    dataw  0x4008
;    dataw  0x7201
;    dataw  0xa277
;    dataw  0x6ae0
;    dataw  0x8a12
;    dataw  0x6b1f
;    dataw  0x81b2
;    dataw  0x3a00
;    dataw  0x7201
;    dataw  0x6af0
;    dataw  0x8a22
;    dataw  0x6b0f
;    dataw  0x82b2
;    dataw  0x3a00
;    dataw  0x7101
;    dataw  0x6b1f
;    dataw  0x81b2
;    dataw  0xd121
;    dataw  0x8a10
;    dataw  0x6b1f
;    dataw  0x8b25
;    dataw  0xdab1
;    dataw  0x6a3f
;    dataw  0x8a15
;    dataw  0xdab1
;    dataw  0x8b20
;    dataw  0xdab1
;    dataw  0x00ee
;    dataw  0x0180
;    
    
;; MAZE
;    dataw   0x6000 
;    dataw   0x6100 
;    dataw   0xA222 
;    dataw   0xC201 
;    dataw   0x3201 
;    dataw   0xA21E 
;    dataw   0xD014 
;    dataw   0x7004 
;    dataw   0x3040 
;    dataw   0x1204 
;    dataw   0x6000 
;    dataw   0x7104 
;    dataw   0x3120 
;    dataw   0x1204 
;    dataw   0x121C 
;    dataw   0x8040
;    dataw   0x2010
;    dataw   0x2040
;    dataw   0x8010
;    
;    
    
    
      
    END