; da65 V2.18 - Debian 2.19-2
; Created:    2025-12-07 09:04:02
; Input file: ./output/main.nes
; Page:       1


        .setcpu "6502"

L0000           := $0000
L0005           := $0005
L0038           := $0038
L0060           := $0060
L0065           := $0065
L0066           := $0066
L006F           := $006F
L007D           := $007D
L0081           := $0081
L00A9           := $00A9
L0400           := $0400
L2000           := $2000
L2020           := $2020
L2061           := $2061
L2065           := $2065
L2074           := $2074
L2079           := $2079
L2221           := $2221
L2626           := $2626
L2800           := $2800
L2860           := $2860
L2930           := $2930
L2964           := $2964
L2A2F           := $2A2F
L2B20           := $2B20
L2D6F           := $2D6F
L2E2E           := $2E2E
L2F00           := $2F00
L2F28           := $2F28
L3000           := $3000
L3231           := $3231
L3633           := $3633
L3C20           := $3C20
L3D21           := $3D21
L3D3C           := $3D3C
L3D3D           := $3D3D
L4200           := $4200
L4300           := $4300
L434F           := $434F
L4400           := $4400
L4554           := $4554
L4560           := $4560
L4C42           := $4C42
L4E4D           := $4E4D
L4F60           := $4F60
L5250           := $5250
L5260           := $5260
L5300           := $5300
L5341           := $5341
        lsr     $5345
        .byte   $1A
        .byte   $02
        ora     ($03,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L6000:  sei
        cld
        ldx     #$00
        stx     $70
        stx     $72
        stx     $71
        stx     $73
        txs
        lda     #$20
L600F:  sta     $0200,x
        sta     $0300,x
        sta     L0400,x
        inx
        bne     L600F
        jsr     L8239
        jsr     L818A
        lda     #$00
        ldx     #$08
        sta     $02
        stx     $03
        jsr     L805D
        jsr     L8167
        jsr     L817E
        jmp     L8000

        pha
        tya
        pha
        txa
        pha
        lda     #$01
        sta     $70
        inc     $6B
        bne     L6044
        inc     $6C
L6044:  jsr     L81C2
        lda     #$20
        sta     $2006
        lda     #$00
        sta     $2006
        sta     $2005
        sta     $2005
        pla
        tax
        pla
        tay
        pla
        rti

        ldy     #$04
        .byte   $F0
L6060:  .byte   $07
        lda     #$C8
        ldx     #$80
        jmp     L6D11

L6068:  rts

        jsr     L807B
        .byte   $20
        .byte   $AB
L606E:  .byte   $80
        lda     #$00
        sta     $68
        sta     $69
        sta     $6A
        jmp     L818C

        rts

        lda     #$A8
        sta     L2000
        lda     #$1E
        sta     $2001
L6085:  lda     $2002
        bpl     L6085
        lda     #$00
        sta     $2005
        sta     $2005
        lda     #$00
        ldy     #$F0
        sta     $2003
        ldx     #$40
L609B:  sty     $2004
        sta     $2004
        sta     $2004
        sty     $2004
        dex
        bne     L609B
        rts

L60AB:  lda     $2002
        bpl     L60AB
        lda     #$3F
        sta     $2006
        lda     #$00
        sta     $2006
        ldx     #$00
L60BC:  lda     LB30C,x
        sta     $2007
        inx
        cpx     #$20
        bne     L60BC
        rts

        adc     #$80
        .byte   $7A
        .byte   $80
        jsr     LA020
        ora     $20
        and     $82,x
        ldy     #$03
        jsr     L8195
        jsr     L80CD
        jmp     L818E

        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
L6120:  jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        .byte   $20
        .byte   $20
L614C:  jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        jsr     L2020
        .byte   $20
        iny
L6166:  pha
        .byte   $AD
L6168:  ora     $AE6D
        .byte   $0E
L616C:  .byte   $6D
L616D:  jsr     L821F
L6170:  .byte   $AD
        .byte   $0F
L6172:  .byte   $6D
        .byte   $AE
L6174:  bpl     $61E3
L6176:  jsr     L821F
        ldy     #$04
        jmp     L8450

        ldy     #$00
        beq     L6189
        lda     #$2C
        ldx     #$B3
        jmp     L6D11

L6189:  rts

        lda     #$48
        ldy     $69
        ldy     #$04
        jmp     L8166

        ldy     #$01
        lda     ($A5),y
        ldy     $73
        bne     L619C
        rts

L619C:  ldx     $72
        lda     #$0E
        sta     L6DB2
L61A3:  lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     L0400,x
        sta     $2007
        inx
        dey
        beq     L6216
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     L0400,x
        sta     $2007
        inx
        dey
        beq     L6216
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     L0400,x
        sta     $2007
        inx
        dey
        beq     L6216
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     L0400,x
        sta     $2007
        inx
        dey
        beq     L6216
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     L0400,x
        sta     $2007
        inx
        dey
        beq     L6216
        dec     L6DB2
        bne     L61A3
L6216:  stx     $72
        sty     $73
        rts

        lda     #$00
        pha
        lda     $02
L6220:  sec
        sbc     #$02
        sta     $02
        bcs     L6229
        .byte   $C6
L6228:  .byte   $03
L6229:  ldy     #$01
        txa
        sta     ($02),y
        pla
        dey
        sta     ($02),y
        rts

        ldy     #$03
        lda     $85
        rts

        jsr     L00A9
        php
        .byte   $04
        .byte   $0C
        .byte   $02
        asl     a
        asl     $0E
        ora     ($09,x)
        ora     $0D
        .byte   $03
        .byte   $07
        .byte   $0F
        brk
        pla
        adc     $6C
        .byte   $6C
        .byte   $6F
L624F:  brk
        brk
        brk
        php
        .byte   $04
        .byte   $0C
        .byte   $02
        asl     a
        asl     $0E
        ora     ($09,x)
        ora     $0D
        .byte   $03
        .byte   $07
L625F:  .byte   $0F
L6260:  brk
        bmi     L6293
        bmi     L6296
        bmi     L6299
        bmi     L629C
        bmi     L629F
        bmi     L62A2
        bmi     L62A5
        bmi     L62A8
        bmi     L62AB
        bmi     L62AE
        and     ($30),y
        and     ($31),y
        and     ($32),y
        and     ($33),y
        and     ($34),y
        and     ($35),y
        and     ($36),y
        and     ($37),y
        and     (L0038),y
        and     ($39),y
        .byte   $32
        bmi     L62BE
        and     ($32),y
        .byte   $32
        .byte   $32
        .byte   $33
        .byte   $32
        .byte   $34
L6293:  .byte   $32
        and     $32,x
L6296:  rol     $32,x
        .byte   $37
L6299:  .byte   $32
        sec
        .byte   $32
L629C:  and     $3033,y
L629F:  .byte   $33
        and     ($33),y
L62A2:  .byte   $32
        .byte   $33
        .byte   $33
L62A5:  .byte   $33
        .byte   $34
        .byte   $33
L62A8:  and     $33,x
        .byte   $36
L62AB:  .byte   $33
        .byte   $37
        .byte   $33
L62AE:  sec
        .byte   $33
        and     $3034,y
        .byte   $34
        and     ($34),y
        .byte   $32
        .byte   $34
        .byte   $33
        .byte   $34
        .byte   $34
        .byte   $34
        and     $34,x
L62BE:  rol     $34,x
        .byte   $37
        .byte   $34
        sec
        .byte   $34
        and     $3035,y
        and     $31,x
        and     $32,x
        and     $33,x
        and     $34,x
        and     $35,x
        and     $36,x
        and     $37,x
        and     L0038,x
        and     $39,x
        rol     $30,x
        rol     $31,x
        rol     $32,x
        rol     $33,x
        rol     $34,x
        rol     $35,x
        rol     $36,x
        rol     $37,x
        rol     L0038,x
        rol     $39,x
        .byte   $37
        bmi     L6327
        and     ($37),y
        .byte   $32
        .byte   $37
        .byte   $33
        .byte   $37
        .byte   $34
        .byte   $37
        and     $37,x
        rol     $37,x
        .byte   $37
        .byte   $37
        sec
        .byte   $37
L6300:  and     $3038,y
        sec
        and     (L0038),y
        .byte   $32
        sec
        .byte   $33
        sec
        .byte   $34
        sec
        and     L0038,x
        rol     L0038,x
        .byte   $37
        sec
        sec
        sec
        and     $3039,y
        and     $3931,y
        .byte   $32
        and     $3933,y
        .byte   $34
        and     $3935,y
        rol     $39,x
        .byte   $37
        .byte   $39
        sec
L6327:  and     $39,y
        plp
        plp
        bmi     L634E
        .byte   $3C
        jsr     L6F70
        adc     #$6E
        .byte   $74
        adc     L0065
        .byte   $5F
        .byte   $73
        adc     #$7A
        adc     $29
        jsr     L2626
        jsr     L7028
        .byte   $6F
        adc     #$6E
        .byte   $74
        adc     L0065
        .byte   $5F
        .byte   $73
        adc     #$7A
        .byte   $65
L634E:  jsr     L3D3C
        jsr     L2F28
        rol     a
        and     ($34),y
        .byte   $33
        bit     $3120
        rol     $33,x
        rol     a
        .byte   $2F
        .byte   $69
L6360:  .byte   $73
L6361:  adc     #$7A
        adc     $3A
        .byte   $3A
        adc     L7861
L6369:  .byte   $5F
        ror     $61,x
        jmp     (L6575)

L636F:  .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        and     #$20
        adc     ($73,x)
        jsr     L2A2F
        and     ($34),y
        .byte   $33
        bit     $3120
        rol     $33,x
        rol     a
        .byte   $2F
        adc     $73,x
        adc     #$7A
        adc     $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        and     #$29
        and     #$00
        plp
        plp
        bmi     L63B8
        .byte   $3C
        jsr     L6F70
        adc     #$6E
        .byte   $74
        adc     L0065
        .byte   $5F
        .byte   $73
        adc     #$7A
        adc     $29
        jsr     L2626
        jsr     L7028
        .byte   $6F
        adc     #$6E
        .byte   $74
        adc     L0065
        .byte   $5F
        .byte   $73
        adc     #$7A
        .byte   $65
L63B8:  jsr     L3D3C
        jsr     L2F28
        rol     a
        and     ($34),y
        .byte   $33
        bit     $3120
        rol     $34,x
        rol     a
        .byte   $2F
        adc     #$73
        adc     #$7A
        adc     $3A
        .byte   $3A
        adc     L7861
        .byte   $5F
        ror     $61,x
        jmp     (L6575)

        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        and     #$20
        adc     ($73,x)
        jsr     L2A2F
        and     ($34),y
        .byte   $33
        bit     $3120
        rol     $34,x
        rol     a
        .byte   $2F
        adc     $73,x
        adc     #$7A
        adc     $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        and     #$29
        and     #$00
        plp
        .byte   $2F
        rol     a
        and     ($32),y
        .byte   $33
        .byte   $33
        bit     $3120
        .byte   $32
        .byte   $34
        bmi     L6438
        jsr     L3231
        .byte   $34
        and     ($2A),y
        .byte   $2F
        adc     L6D65
        .byte   $3A
        .byte   $3A
        .byte   $73
        adc     #$7A
        adc     $5F
        .byte   $6F
        ror     $3A
        .byte   $3A
        .byte   $3C
        .byte   $2F
        rol     a
        and     ($32),y
        .byte   $33
        .byte   $33
        bit     $3120
        .byte   $32
        .byte   $34
        bmi     L645B
        jsr     L3231
        .byte   $34
        and     ($2A),y
        .byte   $2F
        .byte   $54
        .byte   $2F
L6438:  rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        rol     L2A2F,x
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        and     #$20
        rol     $3020,x
        and     #$00
        plp
        .byte   $6F
        ror     L0066
        .byte   $73
        jsr     L3D3D
        jsr     L2A2F
        and     ($37),y
        sec
        .byte   $37
        .byte   $2C
        .byte   $20
L645B:  and     (L0038),y
        bmi     L6490
L645F:  rol     a
        .byte   $2F
        adc     L6D65
        .byte   $3A
L6465:  .byte   $3A
        .byte   $73
        adc     #$7A
L6469:  adc     $5F
        .byte   $6F
        ror     $3A
        .byte   $3A
L646F:  .byte   $3C
        .byte   $2F
        rol     a
        and     ($37),y
        sec
        .byte   $37
        bit     $3120
        sec
        bmi     L64AD
        rol     a
        .byte   $2F
        .byte   $54
        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        rol     L2A2F,x
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        and     #$29
        brk
        plp
        .byte   $2F
L6490:  rol     a
        and     ($37),y
        sec
        .byte   $37
        bit     $3120
        .byte   $37
        and     $2A34,y
        .byte   $2F
        jmp     L7961

        .byte   $6F
        adc     $74,x
        .byte   $3A
        .byte   $3A
        ror     $72
        .byte   $6F
        adc     L735F
        adc     #$7A
L64AD:  adc     $5F
        adc     ($6C,x)
        adc     #$67
        ror     L2A2F
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        .byte   $73
        adc     #$7A
        adc     $2C
        adc     ($6C,x)
        adc     #$67
        ror     $292C
        and     #$2E
        adc     #$73
        .byte   $5F
        .byte   $6F
        .byte   $6B
        plp
        and     #$00
        plp
        .byte   $2F
        rol     a
        and     ($37),y
        sec
        .byte   $37
        bit     $3120
        .byte   $37
        and     $2A33,y
        .byte   $2F
        jmp     L7961

        .byte   $6F
        adc     $74,x
        .byte   $3A
        .byte   $3A
        ror     $72
        .byte   $6F
        adc     L735F
        adc     #$7A
        adc     $5F
        adc     ($6C,x)
        adc     #$67
        ror     L2A2F
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        .byte   $73
        adc     #$7A
        .byte   $65
L6500:  bit     L6C61
        adc     #$67
        ror     $292C
        and     #$2E
        adc     #$73
        .byte   $5F
        .byte   $6F
        .byte   $6B
        plp
        and     #$00
        plp
        .byte   $2F
        rol     a
        and     ($32),y
        .byte   $33
        .byte   $33
        bit     $3120
        .byte   $32
        .byte   $34
        bmi     L654A
L6520:  .byte   $2F
        .byte   $77
        adc     #$64
        .byte   $74
        pla
        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        jmp     (L722C)

        bit     $2029
        and     $203D,x
        plp
        .byte   $62
        jmp     (L636F)

        .byte   $6B
        .byte   $5F
        jmp     (L2B20)

        jsr     L6C62
        .byte   $6F
        .byte   $63
        .byte   $6B
        .byte   $5F
        .byte   $72
        and     #$29
        brk
L654A:  .byte   $64
        adc     $73
        .byte   $74
L654E:  adc     #$6E
        adc     ($74,x)
        adc     #$6F
        ror     L6120
        ror     $2064
        .byte   $73
        .byte   $6F
        adc     $72,x
        .byte   $63
        adc     $20
        .byte   $73
        .byte   $6C
L6563:  .byte   $69
L6564:  .byte   $63
L6565:  adc     $73
L6567:  .byte   $20
L6568:  pla
        adc     ($76,x)
        .byte   $65
L656C:  .byte   $20
L656D:  .byte   $64
L656E:  adc     #$66
L6570:  ror     L0065
L6572:  .byte   $72
L6573:  .byte   $65
L6574:  .byte   $6E
L6575:  .byte   $74
L6576:  jsr     L656C
        ror     L7467
        pla
        .byte   $73
        brk
        .byte   $6F
        adc     $74,x
        jsr     L666F
        jsr     L6172
        ror     L6567
        jsr     L6E69
        .byte   $74
        adc     $67
        .byte   $72
        adc     ($6C,x)
        jsr     L7974
        bvs     L65FE
        jsr     L6F63
        ror     L6576
        .byte   $72
        .byte   $73
        adc     #$6F
        ror     L6120
        .byte   $74
        .byte   $74
        adc     $6D
        bvs     L6620
        adc     $64
        brk
        plp
        .byte   $62
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        jsr     L3D21
        jsr     L2A2F
        .byte   $34
        rol     $34,x
        bit     $3520
        .byte   $32
        rol     $2A,x
        .byte   $2F
        adc     #$73
        adc     #$7A
        adc     $3A
        .byte   $3A
        adc     L6E69
        .byte   $5F
        ror     $61,x
        jmp     (L6575)

        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        and     #$29
        brk
        plp
        .byte   $62
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        jsr     L3D21
        jsr     L2A2F
        .byte   $34
        rol     $34,x
        bit     $3520
        and     ($36),y
        rol     a
        .byte   $2F
        adc     #$73
        adc     #$7A
        adc     $3A
        .byte   $3A
        .byte   $6D
L65FE:  adc     ($78,x)
        .byte   $5F
        ror     $61,x
        jmp     (L6575)

L6606:  .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        and     #$29
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6678
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        .byte   $2D
        pla
L6620:  adc     $6C
        jmp     (L2D6F)

        ror     L7365
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        adc     #$74
        adc     $72
        .byte   $2F
L6633:  adc     #$74
        adc     $72
        adc     ($74,x)
        .byte   $6F
        .byte   $72
        rol     L7372
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L66A8
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $63
        pla
L6660:  adc     ($72,x)
        .byte   $2F
        .byte   $63
        .byte   $6F
L6665:  .byte   $6E
L6666:  ror     L0065,x
        .byte   $72
        .byte   $74
        rol     L7372
        brk
        .byte   $2F
L666F:  .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L66D7
        .byte   $63
        .byte   $65
L6678:  .byte   $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $63
        pla
        adc     ($72,x)
        .byte   $2F
        adc     L7465
        pla
        .byte   $6F
        .byte   $64
        .byte   $73
        rol     L7372
        brk
        .byte   $63
        adc     ($6E,x)
        ror     L746F
        jsr     L6572
        adc     ($6C,x)
L66A8:  jmp     (L636F)

        adc     ($74,x)
        adc     $20
        adc     ($6C,x)
        jmp     (L636F)

        adc     ($74,x)
        .byte   $6F
        .byte   $72
        .byte   $27
        .byte   $73
        jsr     L656D
        adc     L726F
        adc     L6920,y
        ror     L7020
        jmp     (L6361)

        adc     L0000
        .byte   $61
L66CC:  .byte   $73
        .byte   $73
        adc     $72
        .byte   $74
        adc     #$6F
        ror     L6620
        .byte   $61
L66D7:  adc     #$6C
        adc     $64
        .byte   $3A
        jsr     L2860
        jmp     (L6665)

        .byte   $74
        jsr     L3D3D
        jsr     L6972
        .byte   $67
        pla
        .byte   $74
        and     #$60
        asl     a
        jsr     L6C20
        adc     L0066
        .byte   $74
        .byte   $3A
        jsr     L0060
        adc     ($6E,x)
        jsr     L7265
        .byte   $72
        .byte   $6F
        .byte   $72
        jsr     L636F
        .byte   $63
        adc     $72,x
        .byte   $72
        adc     $64
        jsr     L6877
        adc     $6E
        jsr     L6F66
        .byte   $72
        adc     L7461
        .byte   $74
        adc     #$6E
        .byte   $67
        jsr     L6E61
        jsr     L7261
        .byte   $67
        adc     $6D,x
        adc     $6E
        .byte   $74
        brk
        adc     #$6E
        ror     $61,x
        jmp     (L6469)

        jsr     L6170
        .byte   $72
        adc     ($6D,x)
        adc     $74
        adc     $72
        .byte   $73
        jsr     L6F74
        jsr     L614C
        adc     L756F,y
        .byte   $74
        .byte   $3A
        .byte   $3A
        ror     $72
        .byte   $6F
        adc     L735F
        adc     #$7A
        adc     $5F
        adc     ($6C,x)
        adc     #$67
        ror     L2F00
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L67BE
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        adc     #$74
        adc     $72
        .byte   $2F
        .byte   $74
        .byte   $72
        adc     ($69,x)
        .byte   $74
        .byte   $73
        rol     L7372
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L67EC
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $73
        .byte   $74
        .byte   $72
        .byte   $2F
        bvs     L6809
        .byte   $74
        .byte   $74
        adc     $72
        ror     L722E
        .byte   $73
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L681A
        .byte   $63
        adc     $2F
        .byte   $72
        .byte   $75
L67BE:  .byte   $73
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $73
        jmp     (L6369)

        adc     $2F
        .byte   $73
        .byte   $6F
        .byte   $72
        .byte   $74
        rol     L7372
        brk
        adc     ($74,x)
        .byte   $74
        adc     $6D
        bvs     L6859
        adc     $64
        jsr     L6F74
        .byte   $20
        .byte   $69
L67EC:  ror     L6564
        sei
        jsr     L6C73
        adc     #$63
        adc     $20
        adc     $70,x
        jsr     L6F74
        jsr     L616D
        sei
        adc     #$6D
        adc     $6D,x
        jsr     L7375
        adc     #$7A
L6809:  adc     L0000
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6874
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
L681A:  and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $73
        jmp     (L6369)

        adc     $2F
        adc     L646F
        rol     L7372
        brk
        .byte   $63
        adc     ($6C,x)
        jmp     (L6465)

        jsr     L5260
        adc     $73
        .byte   $75
L6843:  jmp     ($3A74)

        .byte   $3A
        adc     $6E,x
        .byte   $77
        .byte   $72
        adc     ($70,x)
        plp
        and     #$60
        jsr     L6E6F
        jsr     L6E61
        jsr     L4560
L6859:  .byte   $72
        .byte   $72
        rts

        jsr     L6176
        jmp     (L6575)

        brk
        .byte   $63
        adc     ($6C,x)
        jmp     (L6465)

        jsr     L4F60
        bvs     L68E2
        adc     #$6F
        ror     $3A3A
        .byte   $75
L6874:  ror     L7277
L6877:  adc     ($70,x)
        plp
        and     #$60
        jsr     L6E6F
        jsr     L2061
        rts

        lsr     L6E6F
        adc     L0060
        jsr     L6176
        jmp     (L6575)

        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L68F8
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        pla
        adc     ($73,x)
        pla
        .byte   $2F
        .byte   $73
        adc     #$70
        rol     L7372
        brk
        plp
        plp
        .byte   $62
        jmp     (L636F)

        .byte   $6B
        .byte   $5F
        jmp     (L3C20)

        and     $4220,x
        jmp     L434F

        .byte   $4B
        and     #$20
        rol     $26
        jsr     L6228
        jmp     (L636F)

        .byte   $6B
        .byte   $5F
        .byte   $72
        jsr     L3D3C
        jsr     L4C42
        .byte   $4F
        .byte   $43
        .byte   $4B
L68E2:  and     #$29
        brk
        ror     $72
        .byte   $6F
        adc     L645F
        adc     #$67
        adc     #$74
        .byte   $3A
        jsr     L6172
        .byte   $64
        adc     #$78
        .byte   $20
        .byte   $69
L68F8:  .byte   $73
        jsr     L6F74
        .byte   $6F
        jsr     L6968
L6900:  .byte   $67
        pla
        jsr     L6D28
        adc     ($78,x)
        adc     #$6D
        adc     $6D,x
        jsr     L3633
        and     #$00
        adc     ($74,x)
        .byte   $74
        adc     $6D
        bvs     L698B
        adc     $64
        jsr     L6F74
        jsr     L6E69
        .byte   $64
L6920:  adc     $78
        jsr     L7473
        .byte   $72
        jsr     L7075
        jsr     L6F74
        jsr     L616D
        sei
        adc     #$6D
        adc     $6D,x
        jsr     L7375
        adc     #$7A
        adc     L0000
        adc     #$6E
        .byte   $63
        .byte   $6F
        adc     L6C70
        adc     $74
        adc     $20
        adc     $74,x
        ror     $2D
        sec
        jsr     L7962
        .byte   $74
        adc     $20
        .byte   $73
        adc     $71
        adc     L0065,x
        ror     L6563
        jsr     L7266
        .byte   $6F
        adc     L6920
        ror     L6564
        sei
L6964:  .byte   $20
        brk
L6966:  .byte   $2F
        .byte   $77
L6968:  .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L69CF
        .byte   $63
        adc     $2F
        .byte   $72
L6972:  .byte   $75
L6973:  .byte   $73
L6974:  .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        adc     #$74
        adc     $72
        .byte   $2F
        .byte   $6D
L698B:  .byte   $6F
        .byte   $64
        rol     L7372
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L69FA
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        ror     $6D
        .byte   $74
        .byte   $2F
        ror     L6D75
        rol     L7372
        brk
        adc     ($6C,x)
        adc     #$67
        ror     L6F5F
        ror     L0066
        .byte   $73
        adc     $74
        .byte   $3A
        jsr     L6C61
        adc     #$67
        .byte   $6E
        .byte   $20
L69CF:  adc     #$73
        jsr     L6F6E
        .byte   $74
        jsr     L2061
        bvs     L6A49
        .byte   $77
        adc     $72
        and     L666F
        and     L7774
        .byte   $6F
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6A4E
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

L69FA:  and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        ror     L6D75
        .byte   $2F
        adc     L646F
        rol     L7372
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6A78
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $73
        .byte   $74
        .byte   $72
        .byte   $2F
        adc     L646F
        rol     L7372
        brk
        bvs     L6AAD
        .byte   $6F
        ror     $69,x
        .byte   $64
        adc     $64
        jsr     L7473
        .byte   $72
        adc     #$6E
        .byte   $67
        .byte   $20
L6A49:  .byte   $77
        adc     ($73,x)
        .byte   $20
        .byte   $6E
L6A4E:  .byte   $6F
        .byte   $74
        jsr     L7460
        .byte   $72
        adc     L0065,x
        rts

        jsr     L726F
        jsr     L6660
        adc     ($6C,x)
        .byte   $73
        adc     L0060
        brk
        .byte   $63
        .byte   $6F
        ror     L6576
        .byte   $72
        .byte   $74
        adc     $64
        jsr     L6E69
        .byte   $74
        adc     $67
        adc     $72
        jsr     L756F
        .byte   $74
L6A78:  jsr     L666F
        jsr     L6172
        ror     L6567
        jsr     L6F66
        .byte   $72
        jsr     L6360
        pla
        adc     ($72,x)
        rts

        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6AF6
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $6F
L6AAD:  bvs     L6B23
        adc     #$6F
        ror     L722E
        .byte   $73
        brk
        .byte   $74
        .byte   $6F
        .byte   $5F
        .byte   $64
        adc     #$67
        adc     #$74
        .byte   $3A
        jsr     L6172
        .byte   $64
        adc     #$78
        jsr     L7369
        jsr     L6F74
        .byte   $6F
        jsr     L6968
        .byte   $67
        pla
        jsr     L6D28
        adc     ($78,x)
        adc     #$6D
        adc     $6D,x
        jsr     L3633
        and     #$00
        adc     #$6E
        .byte   $74
        adc     $72
        ror     L6C61
        jsr     L7265
        .byte   $72
        .byte   $6F
        .byte   $72
        .byte   $3A
        jsr     L6E65
        .byte   $74
        adc     $72
        adc     $64
L6AF6:  jsr     L6E75
        .byte   $72
        adc     $61
        .byte   $63
        pla
        adc     ($62,x)
        jmp     (L2065)

        .byte   $63
        .byte   $6F
        .byte   $64
        adc     L0000
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6B71
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
L6B23:  .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $72
L6B28:  adc     $73
        adc     $6C,x
        .byte   $74
        rol     L7372
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6B9A
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
        .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        adc     ($6C,x)
        jmp     (L636F)

        rol     L7372
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6BC2
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        and     L656E
L6B71:  .byte   $73
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        .byte   $63
        adc     $6C
        jmp     (L722E)

        .byte   $73
        brk
        ror     L6D75
        .byte   $62
        adc     $72
        jsr     L6F74
        .byte   $6F
        jsr     L6D73
        adc     ($6C,x)
        jmp     (L7420)

        .byte   $6F
        jsr     L6966
        .byte   $74
        jsr     L6E69
L6B9A:  jsr     L6174
        .byte   $72
        .byte   $67
        adc     $74
        jsr     L7974
        bvs     L6C0B
        brk
        .byte   $63
        adc     ($6E,x)
        ror     L746F
        jsr     L6170
        .byte   $72
        .byte   $73
        adc     $20
        adc     #$6E
        .byte   $74
        adc     $67
        adc     $72
        jsr     L7266
        .byte   $6F
        adc     L6520
L6BC2:  adc     L7470
        adc     L7320,y
        .byte   $74
        .byte   $72
        adc     #$6E
        .byte   $67
        brk
        ror     L6D75
        .byte   $62
        adc     $72
        jsr     L6F74
        .byte   $6F
        jsr     L616C
        .byte   $72
        .byte   $67
        adc     $20
        .byte   $74
        .byte   $6F
        jsr     L6966
        .byte   $74
        jsr     L6E69
        jsr     L6174
        .byte   $72
        .byte   $67
        adc     $74
        jsr     L7974
        bvs     L6C59
        brk
        .byte   $2F
        .byte   $77
        .byte   $6F
        .byte   $72
        .byte   $6B
        .byte   $73
        bvs     L6C5E
        .byte   $63
        adc     $2F
        .byte   $72
        adc     $73,x
        .byte   $74
        and     L6568
        jmp     (L6F6C)

        .byte   $2D
L6C0B:  ror     L7365
        .byte   $2F
        .byte   $63
        .byte   $6F
        .byte   $72
        adc     $2F
        bvs     L6C8A
        .byte   $72
        rol     L7372
        brk
        .byte   $2F
        rol     a
        .byte   $34
        rol     $34,x
L6C20:  bit     $3520
        .byte   $32
        rol     $2A,x
        .byte   $2F
        adc     #$73
        .byte   $5F
        .byte   $77
        .byte   $72
        adc     #$74
        adc     #$6E
        .byte   $67
        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        .byte   $62
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        bit     a:$29
        .byte   $2F
        rol     a
        .byte   $34
        rol     $34,x
        bit     $3520
        .byte   $32
        .byte   $34
        rol     a
        .byte   $2F
        adc     #$73
        .byte   $5F
        .byte   $77
        .byte   $72
        adc     #$74
        adc     #$6E
        .byte   $67
        .byte   $2F
        rol     a
        .byte   $3F
L6C59:  rol     a
        .byte   $2F
        plp
        .byte   $62
        .byte   $6F
L6C5E:  .byte   $72
        .byte   $72
        .byte   $6F
L6C61:  .byte   $77
L6C62:  bit     a:$29
        .byte   $2F
        rol     a
        .byte   $34
        rol     $34,x
        bit     $3520
        and     ($35),y
        rol     a
L6C70:  .byte   $2F
        adc     #$73
L6C73:  .byte   $5F
        .byte   $72
        adc     $61
        .byte   $64
L6C78:  adc     #$6E
        .byte   $67
        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        .byte   $62
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        bit     a:$29
L6C8A:  .byte   $2F
        rol     a
        .byte   $34
        rol     $34,x
        bit     $3520
        and     ($36),y
        rol     a
        .byte   $2F
        adc     #$73
        .byte   $5F
        .byte   $72
        adc     $61
        .byte   $64
        adc     #$6E
        .byte   $67
        .byte   $2F
        rol     a
        .byte   $3F
        rol     a
        .byte   $2F
        plp
        .byte   $62
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        bit     a:$29
        plp
        plp
        .byte   $6B
        .byte   $5F
        .byte   $6F
        jmp     (L2964)

        rol     L6C61
        adc     #$67
        ror     $2928
        jsr     L3D3D
        jsr     L6B28
        .byte   $5F
        ror     L7765
        and     #$2E
        adc     ($6C,x)
        adc     #$67
        ror     $2928
        and     #$00
        .byte   $63
        adc     ($6E,x)
        ror     L746F
        jsr     L6170
        .byte   $72
        .byte   $73
        adc     $20
        .byte   $63
        pla
        adc     ($72,x)
        jsr     L7266
        .byte   $6F
        adc     L6520
        adc     L7470
        adc     L7320,y
L6CF2:  .byte   $74
        .byte   $72
        adc     #$6E
        .byte   $67
        brk
        jsr     L756F
        .byte   $74
        jsr     L666F
        jsr     L6172
        ror     L6567
        jsr     L6F66
        .byte   $72
        jsr     L6C73
        .byte   $69
L6D0D:  .byte   $63
L6D0E:  .byte   $65
L6D0F:  .byte   $20
L6D10:  .byte   $6F
L6D11:  ror     $20
        jmp     (L6E65)

        .byte   $67
        .byte   $74
        pla
        jsr     L2800
        plp
        plp
        .byte   $73
L6D1F:  .byte   $65
L6D20:  jmp     ($2966)

        rol     L6F62
L6D26:  .byte   $72
L6D27:  .byte   $72
L6D28:  .byte   $6F
        .byte   $77
        and     #$2E
        .byte   $67
        adc     $74
L6D2F:  plp
L6D30:  and     #$20
L6D32:  and     $203D,x
        eor     $4E,x
        eor     $53,x
        eor     $44
        and     #$00
        adc     #$6E
        .byte   $64
        adc     $78
        jsr     L756F
        .byte   $74
        jsr     L666F
        jsr     L6F62
        adc     $6E,x
        .byte   $64
        .byte   $73
        .byte   $3A
        jsr     L6874
        adc     $20
        jmp     (L6E65)

        jsr     L7369
        jsr     L6300
        .byte   $6F
        adc     $6C,x
        .byte   $64
        .byte   $20
        .byte   $6E
L6D65:  .byte   $6F
        .byte   $74
        jsr     L6F63
        ror     L6576
        .byte   $72
        .byte   $74
        jsr     L6C73
        .byte   $69
L6D73:  .byte   $63
        .byte   $65
L6D75:  jsr     L6F74
        jsr     L7261
        .byte   $72
        adc     ($79,x)
        brk
        .byte   $74
        .byte   $6F
        .byte   $6F
        jsr     L616D
        ror     L2079
        .byte   $63
        pla
        adc     ($72,x)
        adc     ($63,x)
        .byte   $74
        adc     $72
        .byte   $73
        jsr     L6E69
        jsr     L7473
        .byte   $72
        adc     #$6E
        .byte   $67
        brk
        plp
        ror     L7765
        .byte   $5F
        .byte   $73
        adc     #$7A
        adc     $20
        .byte   $3C
        and     $2820,x
        jmp     (L7961)

        .byte   $6F
        adc     $74,x
        .byte   $29
L6DB2:  rol     L6973
        .byte   $7A
        adc     $28
        and     #$29
        brk
        adc     #$6E
        ror     $61,x
        jmp     (L6469)

        jsr     L6964
        .byte   $67
        adc     #$74
        jsr     L6F66
        adc     $6E,x
        .byte   $64
        jsr     L6E69
        jsr     L7473
        .byte   $72
        adc     #$6E
        .byte   $67
        brk
        plp
        ror     L7765
        .byte   $5F
        .byte   $73
        adc     #$7A
        adc     $20
        rol     $203D,x
        plp
        jmp     (L7961)

        .byte   $6F
        adc     $74,x
        and     #$2E
        .byte   $73
        adc     #$7A
        adc     $28
        and     #$29
        brk
        ror     L6D75
        .byte   $62
        adc     $72
        jsr     L6F6E
        .byte   $74
        jsr     L6E69
        jsr     L6874
        adc     $20
        .byte   $72
        adc     ($6E,x)
        .byte   $67
        adc     $20
        bmi     L6E3F
        rol     a:$3D
        adc     $6E,x
        bvs     L6E79
        adc     #$72
        adc     $64
        jsr     L7573
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $67
        adc     ($74,x)
        adc     $20
        ror     L006F
        adc     $6E,x
        .byte   $64
        .byte   $3A
        jsr     L6900
        ror     L6176
        jmp     (L6469)

        jsr     L7475
        ror     $2D
        sec
        jsr     L6573
L6E3F:  adc     ($75),y
        adc     $6E
        .byte   $63
        adc     $20
        .byte   $6F
        ror     $20
L6E49:  brk
        .byte   $63
        pla
        adc     ($72,x)
        jsr     L7369
        jsr     L6C61
        .byte   $77
        adc     ($79,x)
        .byte   $73
        jsr     L6176
        jmp     (L6469)

        jsr     L7475
L6E61:  ror     L0038
        brk
        .byte   $61
L6E65:  jmp     (L6572)

        .byte   $61
L6E69:  .byte   $64
        .byte   $79
L6E6B:  .byte   $20
        .byte   $6D
L6E6D:  adc     $74,x
L6E6F:  adc     ($62,x)
        jmp     (L2079)

        .byte   $62
L6E75:  .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
L6E79:  .byte   $77
        adc     $64
        brk
        plp
L6E7E:  bvs     L6EE5
        .byte   $72
        adc     #$6F
        .byte   $64
        jsr     L3D3C
        jsr     L6E6B
        .byte   $6F
        .byte   $77
        ror     L705F
        adc     $72
        adc     #$6F
        .byte   $64
        and     #$00
        adc     L6D65
        .byte   $6F
        .byte   $72
        adc     L6120,y
        jmp     (L6F6C)

        .byte   $63
        adc     ($74,x)
        adc     #$6F
        ror     L6620
        adc     ($69,x)
        jmp     (L6465)

        brk
        .byte   $73
        jmp     (L6369)

        adc     $20
        adc     #$6E
        .byte   $64
        adc     $78
        jsr     L7473
        adc     ($72,x)
        .byte   $74
        .byte   $73
        jsr     L7461
        jsr     L2800
        adc     L6469
        jsr     L3D3C
        jsr     L7328
        adc     $6C
        ror     $29
        rol     L656C
        ror     $2928
        and     #$00
        .byte   $43
        pla
        adc     ($72,x)
        bvc     L6F54
        adc     $64
        .byte   $69
L6EE5:  .byte   $63
        adc     ($74,x)
        adc     $53
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        .byte   $53
        bvs     L6F61
        adc     #$74
        eor     ($73,x)
        .byte   $63
        adc     #$69
        .byte   $57
        pla
        adc     #$74
L6F00:  adc     $73
        bvs     L6F65
        .byte   $63
        adc     L0000
        adc     ($6C,x)
        jmp     (L776F)

        .byte   $5F
        .byte   $74
        .byte   $72
        adc     ($69,x)
        jmp     (L6E69)

        .byte   $67
        .byte   $5F
        adc     $6D
        bvs     L6F8E
        adc     L4300,y
        adc     ($6E,x)
        ror     L746F
        .byte   $52
        adc     $61
        jmp     (L6F6C)

        .byte   $63
        eor     #$6E
        bvc     L6F99
        adc     ($63,x)
        adc     L0000
        eor     $73
        .byte   $63
        adc     ($70,x)
        adc     $44
        adc     L0066
        adc     ($75,x)
        jmp     (L2074)

        .byte   $7B
        jsr     L2E2E
        jsr     L007D
        plp
        .byte   $6B
        jsr     L3D3C
        .byte   $20
L6F4C:  plp
        .byte   $73
        adc     $6C
        ror     $29
        .byte   $2E
        .byte   $6C
L6F54:  adc     $6E
        plp
        and     #$29
        brk
        ror     L746F
        .byte   $20
        .byte   $79
L6F5F:  adc     $74
L6F61:  .byte   $20
L6F62:  .byte   $69
L6F63:  .byte   $6D
        .byte   $70
L6F65:  .byte   $6C
L6F66:  adc     $6D
        adc     $6E
        .byte   $74
        .byte   $65
L6F6C:  .byte   $64
        brk
L6F6E:  .byte   $4D
        .byte   $75
L6F70:  jmp     (L6974)

        .byte   $43
L6F74:  pla
        adc     ($72,x)
        eor     $71
        .byte   $53
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        adc     ($73,x)
        .byte   $73
        adc     $72
        .byte   $74
        adc     #$6F
        ror     L6620
        .byte   $61
L6F8E:  adc     #$6C
        adc     $64
        .byte   $3A
        jsr     L6F00
        ror     L796C
L6F99:  jsr     L7573
        bvs     L700E
        .byte   $6F
        .byte   $72
        .byte   $74
        jsr     L5341
        .byte   $43
        eor     #$49
        brk
        jsr     L7562
        .byte   $74
        jsr     L6874
        adc     $20
        adc     #$6E
        .byte   $64
        adc     $78
        jsr     L7369
        jsr     L7300
        jmp     (L6369)

        adc     $20
        adc     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        jsr     L6166
        adc     #$6C
        .byte   $3A
        jsr     L2000
        .byte   $62
        adc     L6574,y
        .byte   $73
        jsr     L7266
        .byte   $6F
        adc     L6920
        ror     L6564
        sei
        jsr     L5300
        bvs     L7045
        .byte   $77
        ror     L6F4C
        .byte   $63
        adc     ($6C,x)
        .byte   $4F
        .byte   $62
        ror     a
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        plp
        .byte   $63
        pla
        adc     $6E,x
        .byte   $6B
        .byte   $5F
        .byte   $73
        adc     #$7A
        adc     $20
L7000:  and     ($3D,x)
        jsr     L2930
        brk
        .byte   $43
        pla
        adc     ($72,x)
        .byte   $53
        jmp     (L6369)

L700E:  adc     $53
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        .byte   $54
        .byte   $72
        adc     L7246,y
        .byte   $6F
        .byte   $6D
        .byte   $53
L7020:  jmp     (L6369)

        adc     $45
        .byte   $72
        .byte   $72
        .byte   $6F
L7028:  .byte   $72
        brk
        .byte   $43
        pla
        adc     ($72,x)
        .byte   $54
        .byte   $72
        adc     L7246,y
        .byte   $6F
        adc     L7245
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        adc     ($6C,x)
        .byte   $72
        adc     $61
        .byte   $64
        adc     L6220,y
        .byte   $6F
L7045:  .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        adc     $64
        brk
        .byte   $44
        adc     $63
        .byte   $6F
        .byte   $64
        adc     $55
        .byte   $74
        ror     $31
        rol     $45,x
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        .byte   $53
        .byte   $70
L705F:  .byte   $6C
        .byte   $69
L7061:  .byte   $74
        .byte   $57
        pla
        adc     #$74
        adc     $73
        bvs     L70CB
        .byte   $63
        adc     L0000
        eor     #$6E
        ror     $61,x
        jmp     (L6469)

        .byte   $53
L7075:  adc     $71
        adc     L0065,x
        ror     L6563
        brk
        .byte   $54
        .byte   $72
        adc     L7246,y
        .byte   $6F
        adc     L6E49
        .byte   $74
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        .byte   $53
        bvs     L70FC
        adc     #$74
        .byte   $54
        adc     $72
        adc     L6E69
        adc     ($74,x)
        .byte   $6F
        .byte   $72
        brk
        jmp     L636F

        adc     ($6C,x)
        lsr     $75
        .byte   $74
        adc     $72,x
        adc     $4F
        .byte   $62
        ror     a
        brk
        eor     $74,x
        ror     L0038
        jmp     L736F

        .byte   $73
        adc     L6843,y
        adc     $6E,x
        .byte   $6B
        brk
        .byte   $54
        .byte   $77
        .byte   $6F
        .byte   $57
        adc     ($79,x)
        .byte   $53
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        .byte   $53
L70CB:  bvs     L712E
        .byte   $77
        ror     L7245
        .byte   $72
        .byte   $6F
        .byte   $72
        .byte   $4B
        adc     #$6E
        .byte   $64
        brk
        .byte   $42
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        eor     L7475
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        bvc     L714B
        .byte   $72
        .byte   $73
        adc     $42
        .byte   $6F
        .byte   $6F
        jmp     (L7245)

        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        bvc     L715A
        .byte   $72
        .byte   $73
        .byte   $65
L70FC:  .byte   $43
        pla
        adc     ($72,x)
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        bvc     L7169
        .byte   $72
        .byte   $73
        adc     $49
        ror     $4574
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        .byte   $53
        bvs     L7178
        .byte   $77
        ror     L624F
        ror     a
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        eor     $73
        .byte   $63
        adc     ($70,x)
        adc     $44
        adc     L0066
        adc     ($75,x)
        .byte   $6C
L712E:  .byte   $74
        brk
        eor     $73
        .byte   $63
        adc     ($70,x)
        adc     $55
        ror     L6369
        .byte   $6F
        .byte   $64
        adc     L0000
        pla
        adc     $78
        .byte   $5F
        .byte   $64
        adc     #$67
        adc     #$74
        .byte   $5F
        adc     #$64
        sei
L714B:  brk
        .byte   $53
        bvs     L71BB
        adc     #$74
        eor     #$6E
        .byte   $74
        adc     $72
        ror     L6C61
        brk
L715A:  .byte   $63
        .byte   $72
        adc     #$74
        .byte   $5F
        bvs     L71D0
        .byte   $73
        .byte   $5F
        .byte   $62
        adc     ($63,x)
        .byte   $6B
        brk
        .byte   $20
L7169:  .byte   $62
        adc     $74,x
        jsr     L6E65
        .byte   $64
        .byte   $73
        jsr     L7461
        jsr     L6000
        .byte   $2C
L7178:  asl     a
        jsr     L6972
        .byte   $67
        pla
        .byte   $74
        .byte   $3A
        jsr     L0060
        bvs     L71E6
        ror     L6369
        .byte   $6B
        adc     $64
        jsr     L7461
        jsr     L4300
        pla
        adc     ($72,x)
        .byte   $53
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        .byte   $54
        .byte   $6F
        .byte   $6F
        eor     L6E61
        adc     L6843,y
        adc     ($72,x)
        .byte   $73
        brk
        .byte   $63
        pla
        adc     ($72,x)
        .byte   $5F
        adc     #$6E
        .byte   $64
        adc     #$63
        adc     $73
        brk
        adc     $74,x
        ror     L0038
L71BB:  .byte   $5F
        adc     $6E
        .byte   $63
        .byte   $6F
        .byte   $64
        adc     $64
        brk
        eor     #$6E
        ror     $61,x
        jmp     (L6469)

        .byte   $44
        adc     #$67
        adc     #$74
L71D0:  brk
        plp
        adc     L6469
        jsr     L3D3C
        jsr     L656C
        ror     a:$29
        ror     $72
        .byte   $6F
        ror     $5F74
        .byte   $6F
        .byte   $66
L71E6:  ror     $73
        adc     $74
        brk
        adc     L6D65
        .byte   $6F
        .byte   $72
        adc     L625F,y
        adc     ($63,x)
        .byte   $6B
        brk
        .byte   $53
        adc     #$70
        pha
        adc     ($73,x)
        pla
        adc     $72
        .byte   $32
        .byte   $34
        brk
        plp
        .byte   $73
        .byte   $74
        adc     $70
        jsr     L3D21
        jsr     L2930
        brk
        .byte   $53
        .byte   $74
        .byte   $72
        .byte   $53
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        ror     $61,x
        jmp     (L6469)

        .byte   $5F
        adc     $70,x
        .byte   $5F
        .byte   $74
        .byte   $6F
        brk
        eor     $73
        .byte   $63
        adc     ($70,x)
L722C:  adc     $44
L722E:  adc     $62
        adc     $67,x
        brk
        adc     #$73
        .byte   $5F
        adc     L7461
        .byte   $63
        pla
        .byte   $5F
        .byte   $62
        .byte   $77
        brk
        .byte   $53
        adc     #$70
        and     ($33),y
        .byte   $52
L7245:  .byte   $6F
L7246:  adc     $6E,x
        .byte   $64
        .byte   $73
        brk
        adc     #$73
        .byte   $5F
        adc     L7461
        .byte   $63
        pla
        .byte   $5F
        ror     $77
        brk
        .byte   $54
        .byte   $6F
        jmp     L776F

        adc     $72
        .byte   $63
        adc     ($73,x)
L7261:  adc     L0000
        .byte   $42
        .byte   $6F
L7265:  .byte   $72
L7266:  .byte   $72
        .byte   $6F
        .byte   $77
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
L726F:  eor     $6D
        bvs     L72E7
        adc     L654E,y
        .byte   $65
L7277:  .byte   $64
        jmp     (L0065)

        .byte   $54
        .byte   $6F
        eor     $70,x
        bvs     L72E6
        .byte   $72
        .byte   $63
        adc     ($73,x)
        adc     L0000
        plp
        .byte   $73
        adc     #$7A
        adc     $20
        and     ($3D,x)
        jsr     L2930
        brk
        eor     $6D
        bvs     L730B
        adc     L7453,y
        .byte   $72
        adc     #$6E
        .byte   $67
        brk
        .byte   $53
        adc     #$70
        pha
        adc     ($73,x)
        pla
        adc     $72
        and     ($33),y
        brk
        ror     $69
        ror     L6567
        .byte   $72
        .byte   $5F
        .byte   $62
        adc     ($63,x)
        .byte   $6B
        brk
        .byte   $53
        adc     #$70
        .byte   $32
        .byte   $34
        .byte   $52
        .byte   $6F
        adc     $6E,x
        .byte   $64
        .byte   $73
        brk
        .byte   $43
        pla
        adc     ($72,x)
        eor     #$6E
        .byte   $64
        adc     #$63
        adc     $73
        brk
        .byte   $52
        adc     #$67
        pla
        .byte   $74
        .byte   $42
        .byte   $72
        adc     ($63,x)
        adc     L0000
        .byte   $3C
        .byte   $62
        .byte   $6F
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $77
        adc     $64
        rol     $4C00,x
L72E6:  .byte   $61
L72E7:  adc     L756F,y
        .byte   $74
        eor     $72
        .byte   $72
        brk
        adc     $74,x
        ror     L0038
        .byte   $5F
        .byte   $73
        adc     #$7A
        adc     L0000
        eor     $6E,x
        .byte   $64
        adc     $72
        ror     $6C
L7300:  .byte   $6F
        .byte   $77
        brk
        .byte   $53
        adc     $62,x
        ror     L726F
        .byte   $6D
        .byte   $61
L730B:  jmp     (L4200)

        adc     ($63,x)
        .byte   $6B
        .byte   $73
        jmp     (L7361)

        pla
        brk
        jmp     L6665

        .byte   $74
        .byte   $42
        .byte   $72
        adc     ($63,x)
        .byte   $65
L7320:  brk
        adc     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        .byte   $5F
        .byte   $6C
L7328:  adc     $6E
        brk
        eor     $74,x
        ror     L0038
        eor     $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        lsr     L6E6F
        adc     $45
        .byte   $72
        .byte   $72
        .byte   $6F
        .byte   $72
        brk
        bvc     L73A2
        ror     L6369
        eor     #$6E
        ror     L006F
        brk
        .byte   $53
        adc     #$70
        pha
        adc     ($73,x)
        pla
        adc     $72
        brk
        eor     #$6E
        ror     $69
        ror     L7469
        adc     L0000
        .byte   $4F
        ror     L0065,x
L735F:  .byte   $72
        .byte   $66
L7361:  jmp     (L776F)

        brk
L7365:  bvs     L73D6
        .byte   $73
        .byte   $69
L7369:  .byte   $74
        adc     #$6F
        ror     L6300
L736F:  .byte   $72
        adc     #$74
L7372:  .byte   $5F
        bvs     L73E4
L7375:  .byte   $73
        brk
        .byte   $73
        adc     $61
        .byte   $72
        .byte   $63
        pla
        adc     $72
        brk
        pla
        adc     ($79,x)
        .byte   $73
        .byte   $74
        adc     ($63,x)
        .byte   $6B
        brk
        ror     $69
        ror     L7369
        pla
        adc     $64
        brk
        jmp     L636F

        adc     ($74,x)
        adc     #$6F
        ror     $4100
        jmp     (L6F6C)

        .byte   $63
        eor     $72
L73A2:  .byte   $72
        brk
        jmp     (L636F)

        adc     ($74,x)
        adc     #$6F
        ror     L7300
        pla
        adc     $74,x
        .byte   $64
        .byte   $6F
        .byte   $77
        ror     $4C00
        adc     #$6E
        adc     $73
        eor     ($6E,x)
        adc     L7000,y
        .byte   $72
        adc     #$76
        adc     ($74,x)
        adc     L0000
        .byte   $43
        .byte   $6F
        ror     L6574
        sei
        .byte   $74
        brk
        .byte   $63
        pla
        adc     ($72,x)
        .byte   $5F
        adc     $71
L73D6:  brk
        bvs     L743A
        adc     L6F6C,y
        adc     ($64,x)
        brk
        adc     L7365
        .byte   $73
        .byte   $61
L73E4:  .byte   $67
        adc     L0000
        .byte   $62
        adc     L6574,y
        .byte   $73
        adc     $74
        brk
        adc     L7461
        .byte   $63
        pla
        adc     $72
        brk
        .byte   $47
        .byte   $72
        adc     $61
        .byte   $74
        adc     $72
        brk
        lsr     $69
        jmp     (L6574)

        .byte   $72
        brk
        .byte   $43
        adc     $6E
        .byte   $74
        adc     $72
        brk
        adc     L6D65
        .byte   $6F
        .byte   $72
        adc     $5000,y
        adc     #$6E
        ror     L6465
        brk
        .byte   $52
        adc     $6A
        adc     $63
L7420:  .byte   $74
        brk
        bvs     L7489
        .byte   $72
        adc     #$6F
        .byte   $64
        brk
        .byte   $43
        jmp     (L6E6F)

        adc     $64
        brk
        .byte   $62
        .byte   $72
        .byte   $6F
        .byte   $6B
        adc     $6E
        brk
        eor     $78
        .byte   $63
L743A:  adc     $73
        .byte   $73
        brk
        jmp     L7961

        .byte   $6F
        adc     $74,x
        brk
        adc     ($6C,x)
        adc     #$67
        ror     a:$5F
        ror     L6565
        .byte   $64
        jmp     (L0065)

L7453:  ror     $75
        .byte   $74
        adc     $72,x
        adc     L0000
        .byte   $54
        adc     L6570,y
        eor     #$64
L7460:  brk
L7461:  ror     $69
        .byte   $6E
        .byte   $67
L7465:  adc     $72
L7467:  brk
        .byte   $4E
L7469:  .byte   $6F
        .byte   $72
        adc     L6C61
        brk
L746F:  .byte   $54
L7470:  .byte   $77
        .byte   $6F
        .byte   $57
L7473:  adc     ($79,x)
L7475:  brk
        eor     $6D
        bvs     L74EE
        adc     L7300,y
        .byte   $74
        adc     ($72,x)
        .byte   $74
        brk
        lsr     $72
        .byte   $6F
        ror     a:$74
        .byte   $54
L7489:  pla
        .byte   $72
        adc     L0065
        brk
        adc     #$6E
        ror     L7265
        brk
        .byte   $52
        adc     #$67
        pla
        .byte   $74
        brk
        .byte   $73
        adc     #$7A
        adc     $5F
        brk
        .byte   $57
        adc     ($6B,x)
        adc     $72
        brk
        .byte   $73
        .byte   $74
        adc     ($74,x)
        adc     L0000
        ror     $61
        jmp     (L6573)

        brk
        eor     L7461
        .byte   $63
        pla
        brk
        .byte   $53
        bvs     L7527
        adc     #$74
        brk
        ror     $61,x
        jmp     (L6469)

        brk
        .byte   $5F
        bvs     L7539
        adc     #$76
        brk
        .byte   $42
        adc     L6574,y
        .byte   $73
        brk
        lsr     $61,x
        jmp     (L6575)

        brk
        jmp     L6E69

        adc     $73
        brk
        .byte   $53
        .byte   $74
        adc     ($74,x)
        adc     L0000
        eor     $71
        adc     $61,x
        jmp     (L4400)

        .byte   $6F
        ror     a:L0065
        .byte   $4E
L74EE:  .byte   $6F
        ror     a:L0065
        .byte   $6B
        adc     #$6E
        .byte   $64
        brk
        .byte   $53
        .byte   $6F
        adc     a:L0065
        .byte   $43
        pla
        adc     ($72,x)
        brk
        .byte   $5A
        adc     $72
        .byte   $6F
        brk
        .byte   $42
        adc     ($63,x)
        .byte   $6B
        brk
        jsr     L2020
        jsr     L4200
        .byte   $6F
        .byte   $74
        pla
        brk
        ror     $69
        jmp     (L0065)

        jmp     (L6E69)

        adc     L0000
        jmp     L6665

        .byte   $74
        brk
        .byte   $74
        .byte   $72
        .byte   $75
L7527:  adc     L0000
        adc     #$74
        adc     $72
        brk
        eor     #$74
        adc     $72
        brk
        jmp     L7365

        .byte   $73
        brk
        .byte   $54
L7539:  adc     L6570,y
        brk
        eor     L7061
        brk
        lsr     L6E61
        brk
        rts

        .byte   $3A
        jsr     L6500
        ror     a:$64
        .byte   $27
        bit     a:$20
        .byte   $4F
        ror     a:L0065
        .byte   $54
        .byte   $77
        .byte   $6F
        brk
        .byte   $63
        .byte   $6F
        jmp     (L3000)

        .byte   $6F
        brk
        bmi     L75DA
L7562:  brk
        bmi     L75C7
        brk
        rol     a:$2E
        asl     a
        adc     L2000,x
        .byte   $7B
        brk
L756F:  bit     a:$0A
        .byte   $2C
L7573:  brk
        .byte   $63
        brk
        eor     $3A00,x
        brk
        .byte   $27
        brk
        .byte   $5B
        brk
        plp
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L75C7:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L75DA:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7765:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L776F:  brk
        brk
        brk
        brk
        brk
L7774:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7861:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7961:  brk
L7962:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L796C:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7974:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7B00:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7B5A:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7B7A:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7C00:  brk
        brk
        brk
        brk
        brk
        brk
L7C06:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7C60:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7E00:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7F00:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7F66:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L7F7E:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8000:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L805D:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L807B:  brk
        brk
        brk
        brk
        brk
L8080:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L80AB:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L80CD:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8166:  brk
L8167:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L817E:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8189:  brk
L818A:  brk
        brk
L818C:  brk
        brk
L818E:  brk
        brk
        brk
        brk
        brk
        brk
        brk
L8195:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L81C2:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L81FF:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L821A:  brk
        brk
        brk
        brk
        brk
L821F:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8239:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8399:  brk
        brk
        brk
        brk
        brk
        brk
L839F:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L83CF:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L83FF:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8450:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8793:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8991:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L8E8D:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L9191:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L919F:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L922B:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        bmi     L927A
        .byte   $32
        .byte   $33
        .byte   $34
        and     $36,x
        .byte   $37
        sec
        and     $4241,y
        .byte   $43
        .byte   $44
        eor     $46
        and     $3132
        .byte   $34
        .byte   $37
        .byte   $34
        sec
        .byte   $33
        rol     $34,x
        sec
        brk
        eor     ($42,x)
        lsr     $524F
        eor     $4C41
        jsr     L5250
        .byte   $4F
        .byte   $47
        .byte   $52
        eor     ($4D,x)
        jsr     L4554
        .byte   $52
        eor     $4E49
L927A:  eor     ($54,x)
        eor     #$4F
        lsr     a:$0A
        brk
        ora     ($02,x)
        .byte   $0C
        ora     #$0A
        bpl     L92C9
        bvc     L922B
        bne     L92F3
        ror     L0066
        ror     $A6
        dey
        dey
        ror     L0066
        ror     L0066
        ror     L0066
        ror     L0066
        ror     $09
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        brk
        brk
        brk
        bvc     L9303
        eor     $25,x
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $02
        brk
        brk
        rti

        .byte   $44
        .byte   $44
        .byte   $14
        ora     ($11),y
        ora     ($11),y
        ora     ($11),y
        ora     ($11),y
        .byte   $11
L92C9:  ora     (L0000,x)
        bvs     L9333
        ror     L0066
        ror     $A6
        dey
        dey
        ror     L0066
        ror     L0066
        ror     L0066
        ror     L0066
        ror     $09
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        brk
        brk
        brk
        bvc     L9343
        eor     $25,x
        .byte   $22
        .byte   $22
        .byte   $22
L92F3:  .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $02
        brk
        brk
        rti

        .byte   $44
        .byte   $44
        .byte   $14
        ora     ($11),y
        .byte   $11
L9303:  ora     ($11),y
        ora     ($11),y
        ora     ($11),y
        ora     (L0000,x)
        bvs     L931C
        .byte   $14
        .byte   $3B
        and     $2D38,x
        .byte   $22
        .byte   $04
        clc
        php
        and     $01,x
        bpl     L9345
        .byte   $3D
        .byte   $1A
L931C:  .byte   $0F
        .byte   $14
        .byte   $3B
        and     $2D38,x
        .byte   $22
        .byte   $04
        clc
        php
        and     $01,x
        bpl     L9355
        and     L821A,x
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
L9333:  brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
L933A:  brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
L9343:  brk
        .byte   $29
L9345:  .byte   $83
        brk
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
L9355:  .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        cmp     $1D8D,y
        brk
        and     ($8B),y
        .byte   $27
        brk
        cmp     a:$03
        brk
        .byte   $32
        brk
        brk
        brk
        lsr     a
        sty     $43
        brk
        and     ($8B),y
        .byte   $27
        brk
        pha
        ora     (L0000,x)
        brk
        .byte   $3C
        brk
        brk
        brk
        sta     $1D8D,x
        brk
        and     ($8B),y
        .byte   $27
        brk
        .byte   $04
        .byte   $04
        brk
        brk
        .byte   $32
        brk
        brk
        brk
        .byte   $AF
        sty     a:$24
        and     ($8B),y
        .byte   $27
        brk
        ldy     a:$04
        brk
        .byte   $3F
        brk
        brk
        brk
        stx     $4184
        brk
        and     ($8B),y
        .byte   $27
        brk
        sta     L0000,y
        brk
        eor     L0000
        brk
        brk
        bne     L933A
        eor     (L0000,x)
        and     ($8B),y
        .byte   $27
        brk
        .byte   $8B
        brk
        brk
        brk
        eor     L0000
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $1B
        sty     a:$24
        eor     $268B,y
        brk
        and     a:L0005,x
        brk
        .byte   $2B
        brk
        brk
        brk
        adc     $8C
        bit     L0000
        eor     $268B,y
        brk
        .byte   $4B
        .byte   $04
        brk
        brk
        .byte   $2B
        brk
        brk
        brk
        rti

        sty     a:$24
        eor     $268B,y
        brk
        jsr     L0005
        brk
        .byte   $2B
        brk
        brk
        brk
        .byte   $AF
        sta     $2F
        brk
        eor     $268B,y
        brk
        .byte   $3F
        ora     L0000
        brk
        .byte   $2F
        brk
        brk
        brk
        .byte   $1B
        sta     a:$21
        eor     $268B,y
        brk
        .byte   $AB
        .byte   $02
        brk
        brk
        .byte   $34
        brk
        brk
        brk
        txa
        sty     a:$24
        eor     $268B,y
        brk
        lsr     $04,x
        brk
        brk
        .byte   $2B
        brk
        brk
        brk
        .byte   $DF
        sta     $2F
        brk
        eor     $268B,y
        brk
        eor     $04,y
        brk
        .byte   $2F
        brk
        brk
        brk
        sbc     $88
        rol     a
        brk
        .byte   $3F
        stx     $2E
        brk
        .byte   $23
        ora     (L0000,x)
        brk
        rol     a:L0000,x
        brk
        .byte   $14
        stx     a:$1A
        and     #$83
        brk
        brk
        ldx     $8A,y
        plp
        brk
        ror     $2E86
        brk
        .byte   $7B
        brk
        brk
        brk
        rti

        brk
        brk
        brk
        and     #$83
        brk
        brk
        .byte   $64
        .byte   $89
        ora     (L0000,x)
        bit     $028E
        brk
        adc     $0195
        brk
        .byte   $7C
        sta     $01,x
        brk
        adc     $0195
        brk
        and     #$83
        brk
        brk
        .byte   $44
        .byte   $8F
        ora     (L0000,x)
        .byte   $F7
        sta     a:$1C
        bit     $028E
        brk
        and     #$83
        brk
        brk
        .byte   $F7
        sta     a:$1C
        bit     $028E
        brk
        and     #$83
        brk
        brk
        .byte   $F7
        sta     a:$1C
        bit     $028E
        brk
        and     #$83
        brk
        brk
        .byte   $F7
        sta     a:$1C
        bit     $028E
        brk
        and     #$83
        brk
        brk
        ora     ($91,x)
        .byte   $89
        and     #$00
        .byte   $7F
        brk
        brk
        brk
        php
        brk
        brk
        brk
        .byte   $0F
        sta     ($89),y
        and     #$00
        sta     (L0000,x)
        brk
        brk
        php
        brk
        brk
        brk
        .byte   $07
        sta     ($89),y
        and     #$00
        .byte   $80
        brk
        brk
        brk
        php
        brk
        brk
        brk
        .byte   $0F
        sta     ($89),y
        and     #$00
        .byte   $83
        brk
        brk
        brk
        php
        brk
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        eor     L0000,x
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        rts

        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        .byte   $C2
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        .byte   $C7
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        adc     a:L0000
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        sei
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        bcc     L9582
L9582:  brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        .byte   $8B
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        stx     L0000
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        .byte   $80
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        .byte   $B3
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        .byte   $8F
        dey
        rol     a
        brk
        clv
        brk
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        .byte   $DF
        txa
        plp
        brk
        ror     $89
        rol     a
        brk
        inc     $07,x
        brk
        brk
        and     (L0000,x)
        brk
        brk
        .byte   $DF
        txa
        plp
        brk
        ror     $89
        rol     a
        brk
        .byte   $9C
        .byte   $04
        brk
        brk
        and     (L0000,x)
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $03
        .byte   $92
        .byte   $0B
        brk
        .byte   $0F
        stx     $2F
        brk
        rol     a:$01,x
        brk
        .byte   $1C
        brk
        brk
        brk
        .byte   $CB
        stx     $2D
        brk
        ror     $91,x
        .byte   $0C
        brk
        .byte   $F7
        stx     $01
        brk
        eor     $87,x
        and     LC400
        .byte   $02
        brk
        brk
        plp
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        ora     ($01,x)
        brk
        ora     ($01,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $02
        php
        php
        php
        php
        php
        php
        php
        php
        php
        php
        php
        php
        php
        php
        php
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        php
        php
        php
        php
        php
        php
        php
        .byte   $07
        .byte   $07
        .byte   $07
        .byte   $07
        .byte   $07
        .byte   $07
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        asl     $06
        php
        php
        php
        php
        php
        php
        ora     L0005
        ora     L0005
        ora     L0005
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        php
        php
        php
        php
        brk
        brk
        ora     ($02,x)
        .byte   $03
        .byte   $04
        ora     $06
        .byte   $07
        php
        ora     #$0A
        .byte   $0B
        .byte   $0C
        ora     $0F0E
        bpl     L96CB
        .byte   $12
        .byte   $13
        .byte   $14
        ora     $16,x
        .byte   $17
        clc
        ora     $1B1A,y
        .byte   $1C
        ora     $1F1E,x
        jsr     L2221
L96CB:  .byte   $23
        bit     $25
        rol     $27
        plp
        and     #$2A
        .byte   $2B
        bit     $2E2D
        .byte   $2F
        bmi     L970B
        .byte   $32
        .byte   $33
        .byte   $34
        and     $36,x
        .byte   $37
        sec
        and     $3B3A,y
        .byte   $3C
        and     $3F3E,x
        rti

        adc     ($62,x)
        .byte   $63
        .byte   $64
        adc     L0066
        .byte   $67
        pla
        adc     #$6A
        .byte   $6B
        jmp     (L6E6D)

        .byte   $6F
        bvs     L976B
        .byte   $72
        .byte   $73
        .byte   $74
        adc     $76,x
        .byte   $77
        sei
        adc     $5B7A,y
        .byte   $5C
        eor     $5F5E,x
        rts

        adc     ($62,x)
L970B:  .byte   $63
        .byte   $64
        adc     L0066
        .byte   $67
        pla
        adc     #$6A
        .byte   $6B
        jmp     (L6E6D)

        .byte   $6F
        bvs     L978B
        .byte   $72
        .byte   $73
        .byte   $74
        adc     $76,x
        .byte   $77
        sei
        adc     L7B7A,y
        .byte   $7C
        adc     L7F7E,x
        .byte   $80
        sta     ($82,x)
        .byte   $83
        sty     $85
        stx     $87
        dey
        .byte   $89
        txa
        .byte   $8B
        sty     L8E8D
        .byte   $8F
        bcc     L96CB
        .byte   $92
        .byte   $93
        sty     $95,x
        stx     $97,y
        tya
        sta     L9B9A,y
        .byte   $9C
        sta     L9F9E,x
        ldy     #$A1
        .byte   $A2
L974B:  .byte   $A3
        ldy     $A5
        ldx     $A7
        tay
        lda     #$AA
        .byte   $AB
        ldy     LAEAD
        .byte   $AF
        bcs     L970B
        .byte   $B2
        .byte   $B3
        ldy     $B5,x
        ldx     $B7,y
        clv
        lda     LBBBA,y
        ldy     LBEBD,x
        .byte   $BF
        cpy     #$C1
        .byte   $C2
L976B:  .byte   $C3
        cpy     $C5
        dec     $C7
        iny
        cmp     #$CA
        .byte   $CB
        cpy     LCECD
        .byte   $CF
        bne     L974B
        .byte   $D2
        .byte   $D3
        .byte   $D4
        cmp     $D6,x
        .byte   $D7
        cld
        cmp     LDBDA,y
        .byte   $DC
        cmp     LDFDE,x
        cpx     #$E1
        .byte   $E2
L978B:  .byte   $E3
        cpx     $E5
        inc     $E7
        inx
        sbc     #$EA
        .byte   $EB
        cpx     LEEED
        .byte   $EF
        beq     L978B
        .byte   $F2
        .byte   $F3
        .byte   $F4
        sbc     $F6,x
        .byte   $F7
        sed
        sbc     LFBFA,y
        .byte   $FC
        sbc     LFFFE,x
        brk
        ora     ($02,x)
        .byte   $03
        .byte   $04
        ora     $06
        .byte   $07
        php
        ora     #$0A
        .byte   $0B
        .byte   $0C
        ora     $0F0E
        bpl     L97CB
        .byte   $12
        .byte   $13
        .byte   $14
        ora     $16,x
        .byte   $17
        clc
        ora     $1B1A,y
        .byte   $1C
        ora     $1F1E,x
        jsr     L2221
L97CB:  .byte   $23
        bit     $25
        rol     $27
        plp
        and     #$2A
        .byte   $2B
        bit     $2E2D
        .byte   $2F
        bmi     L980B
        .byte   $32
        .byte   $33
        .byte   $34
        and     $36,x
        .byte   $37
        sec
        and     $3B3A,y
        .byte   $3C
        and     $3F3E,x
        rti

        eor     ($42,x)
        .byte   $43
        .byte   $44
        eor     $46
        .byte   $47
        pha
        eor     #$4A
        .byte   $4B
        jmp     L4E4D

        .byte   $4F
        bvc     L984B
        .byte   $52
        .byte   $53
        .byte   $54
        eor     $56,x
        .byte   $57
        cli
        eor     $5B5A,y
        .byte   $5C
        eor     $5F5E,x
        rts

        eor     ($42,x)
L980B:  .byte   $43
        .byte   $44
        eor     $46
        .byte   $47
        pha
        eor     #$4A
        .byte   $4B
        jmp     L4E4D

        .byte   $4F
        bvc     L986B
        .byte   $52
        .byte   $53
        .byte   $54
        eor     $56,x
        .byte   $57
        cli
        eor     L7B5A,y
        .byte   $7C
        adc     L7F7E,x
        .byte   $80
        sta     ($82,x)
        .byte   $83
        sty     $85
        stx     $87
        dey
        .byte   $89
        txa
        .byte   $8B
        sty     L8E8D
        .byte   $8F
        bcc     L97CB
        .byte   $92
        .byte   $93
        sty     $95,x
        stx     $97,y
        tya
        sta     L9B9A,y
        .byte   $9C
        sta     L9F9E,x
        ldy     #$A1
        .byte   $A2
L984B:  .byte   $A3
        ldy     $A5
        ldx     $A7
        tay
        lda     #$AA
        .byte   $AB
        ldy     LAEAD
        .byte   $AF
        bcs     L980B
        .byte   $B2
        .byte   $B3
        ldy     $B5,x
        ldx     $B7,y
        clv
        lda     LBBBA,y
        ldy     LBEBD,x
        .byte   $BF
        cpy     #$C1
        .byte   $C2
L986B:  .byte   $C3
L986C:  cpy     $C5
        dec     $C7
        iny
        cmp     #$CA
        .byte   $CB
L9874:  cpy     LCECD
        .byte   $CF
        bne     L984B
        .byte   $D2
        .byte   $D3
        .byte   $D4
        cmp     $D6,x
        .byte   $D7
        cld
        cmp     LDBDA,y
        .byte   $DC
        cmp     LDFDE,x
        cpx     #$E1
        .byte   $E2
L988B:  .byte   $E3
        cpx     $E5
        inc     $E7
        inx
        sbc     #$EA
        .byte   $EB
        cpx     LEEED
        .byte   $EF
        beq     L988B
        .byte   $F2
        .byte   $F3
        .byte   $F4
        sbc     $F6,x
        .byte   $F7
        sed
        sbc     LFBFA,y
        .byte   $FC
        sbc     LFFFE,x
        .byte   $5A
        .byte   $8F
        .byte   $13
        brk
        sbc     $89
        and     #$00
        bmi     L98C3
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        ror     $95
        .byte   $02
        brk
        and     #$83
        brk
        brk
        ror     $95
        .byte   $02
L98C3:  brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        ror     $95
        .byte   $02
        brk
        ror     $95
        .byte   $02
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        bpl     L986C
        .byte   $03
        brk
        and     #$83
        brk
        brk
        bpl     L9874
        .byte   $03
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        sta     $288A
        brk
        dec     a:$03,x
        brk
        ora     (L0000,x)
        brk
        brk
L9900:  .byte   $63
        dey
        .byte   $2B
        brk
        sta     $288A
        brk
        eor     $01,y
        brk
        .byte   $4B
        brk
        brk
        brk
        .byte   $7A
        sta     $01,x
        brk
        eor     $0395
        brk
        .byte   $7A
        sta     $01,x
        brk
        eor     $0395
        brk
        and     #$83
        brk
        brk
        sei
        sta     $01,x
        brk
        sei
        sta     $01,x
        brk
        and     #$83
        brk
        brk
        and     $208D,x
        brk
        tay
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $BB
        .byte   $89
        and     #$00
        sbc     $8B,x
        and     L0000
        cpx     a:$04
        brk
        eor     (L0000,x)
        brk
        brk
        rol     a
        .byte   $83
        adc     #$00
        sbc     $8B,x
        and     L0000
        inc     a:$02,x
        brk
        .byte   $52
        brk
        brk
        brk
        sty     $83,x
        adc     #$00
        sbc     $8B,x
        and     L0000
        bmi     L9979
        brk
        brk
        .byte   $52
L9979:  brk
        brk
        brk
        .byte   $BB
        .byte   $89
        and     #$00
        .byte   $F5
L9981:  .byte   $8B
        and     L0000
        .byte   $2F
        ora     #$00
        brk
        eor     (L0000,x)
        brk
        brk
        and     #$83
        brk
        brk
        bit     $028E
        brk
        and     #$83
        brk
        brk
        php
L9999:  .byte   $8B
        plp
        brk
        .byte   $B2
        .byte   $03
        brk
        brk
        ora     (L0000,x)
        brk
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        .byte   $CB
        stx     $2D
        brk
        ror     $91,x
        .byte   $0C
        brk
        eor     $95
        .byte   $03
        brk
        and     #$83
        brk
        brk
        lsr     a
        sta     $34
        brk
        .byte   $29
L99C1:  .byte   $83
        brk
        brk
        and     #$83
        brk
        brk
        .byte   $5F
        .byte   $89
        asl     L0000
        sed
        sty     a:$22
        and     #$83
        brk
        brk
        .byte   $AF
        stx     a:$16
        pla
        sta     ($0D),y
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
L99F9:  .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
L99FF:  brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        and     ($08,x)
        brk
        brk
        .byte   $43
        brk
        brk
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $1B
        php
        brk
        brk
        pha
        brk
        brk
        brk
        .byte   $F4
        .byte   $8F
        ora     (L0000),y
        .byte   $0B
        dey
        .byte   $2B
        brk
        cmp     $02,y
        brk
        .byte   $22
        brk
        brk
        brk
        .byte   $F4
        .byte   $8F
        ora     (L0000),y
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $FF
        .byte   $02
        brk
        brk
        .byte   $22
        brk
        brk
        brk
        lsr     a
        sta     $34
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $8B
        asl     L0000
        brk
        .byte   $0B
        brk
        brk
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        cmp     $06,x
        brk
        brk
        .byte   $0B
        brk
        brk
        brk
        .byte   $F4
        .byte   $8F
        ora     (L0000),y
        dec     $2C87,x
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $27
        php
        brk
        brk
        .byte   $3C
        brk
        brk
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        bit     $03
        brk
        brk
        .byte   $22
        brk
        brk
        brk
        .byte   $F4
        .byte   $8F
        ora     (L0000),y
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $52
        .byte   $03
        brk
        brk
        .byte   $22
        brk
        brk
        brk
        dec     $8E
        ora     L0000,x
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $1A
        asl     L0000
        brk
        bit     L0000
        brk
        brk
        lsr     $8F
        .byte   $13
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $43
        asl     L0000
        brk
        .byte   $22
        brk
        brk
        brk
        cmp     ($91),y
        .byte   $0C
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $A3
        .byte   $03
        brk
        brk
        and     (L0000,x)
        brk
        brk
        lsr     a
        sta     $34
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $0F
        .byte   $07
        brk
        brk
        .byte   $0B
        brk
        brk
        brk
        .byte   $87
        .byte   $92
        .byte   $0B
        brk
        .byte   $0B
        dey
        .byte   $2B
        brk
        .byte   $B7
        .byte   $02
        brk
        brk
        .byte   $1C
        brk
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        .byte   $CB
        stx     $2D
        brk
        ror     $91,x
        .byte   $0C
        brk
        .byte   $F7
        stx     $01
        brk
        .byte   $CB
        stx     $2D
        brk
        ror     $91,x
        .byte   $0C
        brk
        .byte   $F7
        stx     $01
        brk
        inc     $4B83,x
        brk
        lda     ($87),y
        bit     LFB00
        brk
        brk
        brk
        rol     a
        brk
        brk
        brk
        tsx
        dey
        rol     a
        brk
        lda     ($87),y
        bit     $1500
        ora     (L0000,x)
        brk
        eor     (L0000,x)
        brk
        brk
        .byte   $12
        sta     $37
        brk
        lda     ($87),y
        bit     $1600
        ora     (L0000,x)
        brk
        and     a:L0000,x
        brk
        lda     ($87),y
        bit     L7300
        ora     (L0000,x)
        brk
        bmi     L9B5E
L9B5E:  brk
        brk
        lda     ($87),y
        bit     L7F00
        ora     (L0000,x)
        brk
        bmi     L9B6A
L9B6A:  brk
        brk
        .byte   $2F
        stx     a:$1A
        dec     $128F
        brk
        and     #$83
        brk
        brk
        .byte   $3B
        .byte   $89
        rol     a
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        and     #$83
        brk
        brk
        .byte   $BB
        .byte   $8F
        .byte   $12
        brk
        .byte   $7C
        sta     $01,x
        brk
        ror     $95
L9B9A:  .byte   $02
        brk
        ror     $95,x
        ora     (L0000,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        ora     ($01,x)
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
L9C6F:  .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $02
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        .byte   $04
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        sta     $8F,x
        .byte   $12
        brk
        .byte   $0F
        txa
        and     #$00
        ora     $02,x
        brk
        brk
        bit     a:L0000
        brk
        sta     $8F,x
        .byte   $12
        brk
        .byte   $0F
        txa
        and     #$00
        .byte   $07
        .byte   $02
        brk
        brk
        bit     a:L0000
        brk
        .byte   $0F
        txa
        and     #$00
        .byte   $E3
        .byte   $07
        brk
        brk
        .byte   $3B
        brk
        brk
        brk
        .byte   $82
        .byte   $8F
        .byte   $12
        brk
        and     #$83
        brk
        brk
        adc     $188E,x
        brk
        .byte   $83
        .byte   $87
        and     L7B00
        ora     L0000
        brk
        .byte   $2F
        brk
        brk
        brk
        bpl     L9C6F
        rol     a
        brk
        .byte   $0F
        txa
        and     #$00
        cpy     $06
        brk
        brk
        rol     a:L0000,x
        brk
        lda     $0893
        brk
        .byte   $DF
        .byte   $80
        .byte   $02
        brk
        .byte   $04
        brk
        jsr     L0081
        brk
        brk
        brk
        cpx     #$80
        ora     (L0000,x)
        ora     (L0000,x)
        and     (L0081,x)
        brk
        brk
        brk
        brk
        sbc     ($80,x)
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $22
        sta     (L0000,x)
L9D19:  brk
        brk
        brk
        .byte   $E2
        .byte   $80
        ora     (L0000,x)
        ora     (L0000,x)
        .byte   $23
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $E3
        .byte   $80
        .byte   $04
        brk
        .byte   $04
        brk
        bit     L0081
        brk
        brk
        brk
        brk
        cpx     $80
        .byte   $0C
        brk
        .byte   $04
        brk
        and     L0081
        brk
        brk
        brk
        brk
        sbc     $80
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $27
        sta     ($26,x)
        sta     ($28,x)
        sta     (L0000,x)
        brk
L9D4E:  brk
        brk
        inc     $80
        brk
        brk
        ora     (L0000,x)
        and     #$81
        brk
        brk
        brk
        brk
        .byte   $E7
        .byte   $80
        asl     L0000
        .byte   $02
        brk
        .byte   $2B
        sta     ($2A,x)
        sta     ($2C,x)
        sta     (L0000,x)
        brk
        brk
        brk
        inx
        .byte   $80
        asl     L0000
        .byte   $02
        brk
        and     a:L0081
        brk
        brk
        brk
        sbc     #$80
        brk
        brk
        ora     (L0000,x)
        rol     a:L0081
        brk
        brk
        brk
        nop
        .byte   $80
        asl     L0000
        .byte   $02
        brk
        .byte   $2F
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $EB
        .byte   $80
        php
        brk
        .byte   $04
        brk
        bmi     L9D19
        brk
        brk
        brk
        brk
        cpx     $1880
        brk
        .byte   $04
        brk
        and     (L0081),y
        brk
        brk
        brk
        brk
        sbc     $2480
        brk
        .byte   $04
        brk
        .byte   $32
        sta     (L0000,x)
        brk
        brk
        brk
        inc     $1880
        brk
        .byte   $04
        brk
        .byte   $33
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $EF
        .byte   $80
        bit     L0000
        .byte   $04
        brk
        .byte   $34
        sta     (L0000,x)
        brk
        brk
        brk
        beq     L9D4E
        .byte   $0C
        brk
        .byte   $04
        brk
        and     L0081,x
        brk
        brk
        brk
        brk
        sbc     ($80),y
        clc
        brk
        .byte   $04
        brk
        rol     L0081,x
        brk
        brk
        brk
        brk
        .byte   $F2
        .byte   $80
        .byte   $0C
        brk
        .byte   $04
        brk
        .byte   $37
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $F3
        .byte   $80
        jsr     L0400
        brk
        sec
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $F4
        .byte   $80
        php
        brk
        ora     (L0000,x)
        and     L0081,y
        brk
        brk
        brk
        sbc     $80,x
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $3A
        sta     (L0000,x)
        brk
        brk
        brk
        inc     $80,x
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $3B
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $F7
        .byte   $80
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $3C
        sta     (L0000,x)
        brk
        brk
        brk
        sed
        .byte   $80
        .byte   $02
        brk
        .byte   $02
        brk
        and     a:L0081,x
        brk
        brk
        brk
        sbc     $0280,y
        brk
        .byte   $02
        brk
        rol     a:L0081,x
        brk
        brk
        brk
        .byte   $FA
        .byte   $80
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $3F
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $FB
        .byte   $80
        .byte   $04
        brk
        .byte   $02
        brk
        rti

        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $FC
        .byte   $80
        .byte   $02
        brk
        .byte   $02
        brk
        eor     (L0081,x)
        brk
        brk
        brk
        brk
        sbc     $0280,x
        brk
        .byte   $02
        brk
        .byte   $42
        sta     (L0000,x)
        brk
        brk
        brk
        inc     $0280,x
        brk
        .byte   $02
        brk
        .byte   $43
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $FF
        .byte   $80
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $44
        sta     (L0000,x)
        brk
        brk
        brk
        brk
        sta     ($02,x)
        brk
        .byte   $02
        brk
        eor     L0081
        brk
        brk
        brk
        brk
        .byte   $01
L9E99:  sta     ($02,x)
        brk
        .byte   $02
        brk
        lsr     L0081
        brk
        brk
        brk
        brk
        .byte   $02
        sta     ($02,x)
        brk
        .byte   $02
        brk
        .byte   $47
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $03
        sta     ($02,x)
        brk
        .byte   $02
        brk
        pha
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $04
        sta     ($02,x)
        brk
        .byte   $02
        brk
        eor     #$81
        brk
        brk
        brk
        brk
        ora     L0081
        .byte   $02
        brk
        .byte   $02
        brk
        lsr     a
L9ECF:  sta     (L0000,x)
        brk
        brk
        brk
        asl     L0081
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $4B
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $07
        sta     ($02,x)
        brk
        .byte   $02
        brk
        jmp     L0081

        brk
        brk
        brk
        php
        sta     ($02,x)
        brk
        .byte   $02
        brk
        eor     a:L0081
        brk
        brk
        brk
        ora     #$81
        .byte   $02
        brk
        .byte   $02
        brk
        lsr     a:L0081
        brk
        brk
        brk
        asl     a
        sta     ($02,x)
        brk
        .byte   $02
        brk
        .byte   $4F
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $0B
        sta     ($02,x)
        brk
        .byte   $02
        brk
        bvc     L9E99
        brk
        brk
        brk
        brk
        .byte   $0C
        sta     ($02,x)
        brk
        .byte   $02
        brk
        eor     (L0081),y
        brk
        brk
        brk
        brk
        ora     $0281
        brk
        .byte   $02
        brk
        .byte   $52
        sta     (L0000,x)
        brk
        brk
        brk
        asl     $0281
        brk
        .byte   $02
        brk
        .byte   $53
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $0F
        sta     ($02,x)
        brk
        .byte   $02
        brk
        .byte   $54
        sta     (L0000,x)
        brk
        brk
        brk
        bpl     L9ECF
        .byte   $02
        brk
        .byte   $02
        brk
        eor     L0081,x
        brk
        brk
        brk
        brk
        ora     (L0081),y
        .byte   $02
        brk
        .byte   $02
        brk
        lsr     L0081,x
        brk
        brk
        brk
        brk
        .byte   $12
        sta     ($02,x)
        brk
        .byte   $02
        brk
        .byte   $57
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $13
        sta     ($02,x)
        brk
        .byte   $02
        brk
        cli
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $14
        sta     ($02,x)
        brk
        .byte   $02
L9F81:  brk
        eor     L0081,y
        brk
        brk
        brk
        ora     L0081,x
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $5A
        sta     (L0000,x)
        brk
        brk
        brk
        asl     L0081,x
        .byte   $02
        brk
        .byte   $02
        brk
        .byte   $5B
        sta     (L0000,x)
        brk
L9F9E:  brk
L9F9F:  brk
        .byte   $17
        sta     ($02,x)
        brk
        .byte   $02
        brk
        .byte   $5C
        sta     (L0000,x)
        brk
        brk
        brk
        clc
        sta     ($02,x)
        brk
        .byte   $02
        brk
        eor     a:L0081,x
        brk
        brk
        brk
        ora     $0281,y
        brk
        .byte   $02
        brk
        lsr     a:L0081,x
        brk
        brk
        brk
        .byte   $1A
        sta     ($04,x)
        brk
        .byte   $02
        brk
        .byte   $5F
        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $1B
        sta     ($02,x)
        brk
        .byte   $02
        brk
        rts

        sta     (L0000,x)
        brk
        brk
        brk
        .byte   $1C
        sta     ($02,x)
        brk
        .byte   $02
        brk
        adc     (L0081,x)
        brk
        brk
        brk
        brk
        ora     $0281,x
        brk
        .byte   $02
        brk
        .byte   $62
        sta     (L0000,x)
        brk
        brk
        brk
        asl     $0281,x
        brk
        .byte   $02
        brk
        .byte   $63
        sta     (L0000,x)
        brk
        brk
L9FFF:  brk
        .byte   $1F
        sta     ($02,x)
        brk
        .byte   $02
        brk
        .byte   $64
        sta     (L0000,x)
        brk
        brk
        brk
        ldy     $0594
        brk
        bit     $95
        .byte   $04
        brk
        brk
        brk
        brk
        brk
        brk
        ora     (L0000,x)
        ora     ($01,x)
        brk
        .byte   $02
        .byte   $01
LA020:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        cpx     LEF6C
        jmp     (L6CF2)

        jmp     L0000

        brk
        brk
        brk
        brk
        sta     L6D1F
        stx     L6D20
        sta     L6D26
        stx     L6D27
LA049:  dey
        lda     LFFFF,y
        sta     L6D30
        dey
        lda     LFFFF,y
        sta     L6D2F
        sty     L6D32
        jsr     LFFFF
        ldy     #$FF
        bne     LA049
        rts

        jmp     LFFFF

        adc     $82
        adc     $82
        adc     $82
        adc     $82
        adc     $82
        adc     $82
        brk
        brk
        sec
        .byte   $82
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LAEAD:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LB30C:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LBBBA:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LBEBD:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LC199:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LC1F9:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LC399:  brk
        brk
        brk
        brk
        brk
        brk
LC39F:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LC3FF:  brk
LC400:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LC7C3:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LCC99:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LCECD:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LDBDA:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LDFDE:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        and     $80,x
        brk
        .byte   $80
        .byte   $5C
        .byte   $80
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        brk
        clc
        .byte   $3C
        ror     $1818,x
        clc
        clc
        brk
        clc
        .byte   $3C
        ror     $1818,x
        clc
        clc
        brk
        bpl     LE063
        .byte   $7F
        .byte   $7F
        bmi     LE047
        brk
        brk
        bpl     LE06B
        .byte   $7F
        .byte   $7F
        bmi     LE04F
        brk
        .byte   $0C
        .byte   $12
        bmi     LE0C0
        bmi     LE0A8
        .byte   $FC
LE047:  brk
        .byte   $0C
        .byte   $12
        bmi     LE0C8
        bmi     LE0B0
        .byte   $FC
LE04F:  brk
        brk
        brk
        .byte   $03
        rol     $3676,x
        rol     L0000,x
        brk
        brk
        .byte   $03
        rol     $3676,x
        rol     L0000,x
        .byte   $7F
        .byte   $7F
        brk
LE063:  brk
        brk
        brk
        brk
        brk
        .byte   $7F
        .byte   $7F
        brk
LE06B:  brk
        brk
        brk
        brk
        brk
        cpx     #$E0
        rts

        rts

        rts

        rts

        rts

        rts

        cpx     #$E0
        rts

        rts

        rts

        rts

        rts

        rts

        clc
        clc
        clc
        sed
        sed
        brk
        brk
        brk
        clc
        clc
        clc
        sed
        sed
        brk
        brk
        brk
        cpy     $3399
        ror     $CC
        sta     L6633,y
        cpy     $3399
        ror     $CC
        sta     L6633,y
        .byte   $33
        sta     L66CC,y
        .byte   $33
        sta     L66CC,y
LE0A8:  .byte   $33
        sta     L66CC,y
        .byte   $33
        sta     L66CC,y
LE0B0:  brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
LE0C0:  .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
LE0C8:  .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        .byte   $03
        brk
        brk
        brk
        brk
        cpy     $33CC
        .byte   $33
        brk
        brk
        brk
        brk
        cpy     $33CC
        .byte   $33
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $1F
        .byte   $1F
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $1F
        .byte   $1F
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $FF
        .byte   $FF
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $FF
        .byte   $FF
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $1F
        .byte   $1F
        brk
        brk
        brk
        clc
        clc
        clc
        .byte   $1F
        .byte   $1F
        brk
        brk
        brk
        brk
        brk
        brk
        sed
        sed
        clc
        clc
        clc
        brk
        brk
        brk
        sed
        sed
        clc
        clc
        clc
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        .byte   $1F
        .byte   $1F
        clc
        clc
        clc
        brk
        brk
        brk
        .byte   $1F
        .byte   $1F
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        clc
        clc
        clc
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        clc
        clc
        clc
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        clc
        clc
        clc
        clc
        clc
LE172:  clc
        sed
LE174:  sed
        clc
LE176:  clc
        clc
LE178:  clc
        clc
LE17A:  clc
        sed
LE17C:  sed
        clc
LE17E:  clc
        clc
LE180:  beq     LE172
        beq     LE174
        beq     LE176
        beq     LE178
        beq     LE17A
        beq     LE17C
        beq     LE17E
        beq     LE180
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
LE196:  .byte   $FF
        .byte   $FF
LE198:  brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
LE19E:  .byte   $FF
        .byte   $FF
LE1A0:  brk
        brk
        brk
        brk
        beq     LE196
        beq     LE198
        brk
        brk
        brk
        brk
        beq     LE19E
        beq     LE1A0
        cpy     #$C0
        bmi     LE1E4
        cpy     #$C0
        bmi     LE1E8
        cpy     #$C0
        bmi     LE1EC
        cpy     #$C0
        bmi     LE1F0
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        brk
        brk
        brk
        brk
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        brk
        brk
        brk
        brk
        brk
        brk
LE1D2:  brk
        brk
LE1D4:  .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        brk
        brk
LE1DA:  brk
        brk
LE1DC:  .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     LE1D2
LE1E2:  beq     LE1D4
LE1E4:  brk
        brk
        brk
        brk
LE1E8:  beq     LE1DA
LE1EA:  beq     LE1DC
LE1EC:  brk
        brk
        brk
        brk
LE1F0:  .byte   $F0
LE1F1:  beq     $E1E3
        beq     $E204
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     LE1EA
        beq     LE1EC
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        clc
        clc
        clc
        clc
        brk
        brk
        clc
        brk
        clc
        clc
        clc
        clc
        brk
        brk
        clc
        brk
        ror     L0066
        ror     L0000
        brk
        brk
        brk
        brk
        ror     L0066
        ror     L0000
        brk
        brk
        brk
        brk
        ror     L0066
        .byte   $FF
        ror     $FF
        ror     L0066
        brk
        ror     L0066
        .byte   $FF
        ror     $FF
        ror     L0066
        brk
        clc
        rol     $3C60,x
        asl     $7C
        clc
        brk
        clc
        rol     $3C60,x
        asl     $7C
        clc
        brk
        brk
        ror     $0C
        clc
        bmi     LE2BC
        lsr     L0000
        brk
        ror     $0C
        clc
        bmi     LE2C4
        lsr     L0000
        .byte   $3C
        ror     $3C
        sec
        .byte   $67
        ror     $3F
        brk
        .byte   $3C
        ror     $3C
        sec
        .byte   $67
        ror     $3F
        brk
        asl     $0C
        clc
        brk
        brk
        brk
        brk
        brk
        asl     $0C
        clc
        brk
        brk
        brk
        brk
        brk
        .byte   $0C
        clc
        bmi     LE2B4
        bmi     LE29E
        .byte   $0C
        brk
        .byte   $0C
        clc
        bmi     LE2BC
        bmi     LE2A6
        .byte   $0C
        brk
        bmi     LE2AA
        .byte   $0C
        .byte   $0C
        .byte   $0C
        clc
        bmi     LE298
LE298:  bmi     LE2B2
        .byte   $0C
        .byte   $0C
        .byte   $0C
        clc
LE29E:  bmi     LE2A0
LE2A0:  brk
        ror     $3C
        .byte   $FF
        .byte   $3C
        .byte   $66
LE2A6:  brk
        brk
        brk
        .byte   $66
LE2AA:  .byte   $3C
        .byte   $FF
        .byte   $3C
        ror     L0000
        brk
        brk
        clc
LE2B2:  clc
        .byte   $7E
LE2B4:  clc
        clc
        brk
        brk
        brk
        clc
        clc
        .byte   $7E
LE2BC:  clc
        clc
        brk
        brk
        brk
        brk
        brk
        brk
LE2C4:  brk
        clc
        clc
        bmi     LE2C9
LE2C9:  brk
        brk
        brk
        brk
        clc
        clc
        bmi     LE2D1
LE2D1:  brk
        brk
        ror     a:L0000,x
        brk
        brk
        brk
        brk
        brk
        ror     a:L0000,x
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        clc
        clc
        brk
        brk
        brk
        brk
        brk
        brk
        clc
        clc
        brk
        brk
        .byte   $03
        asl     $0C
        clc
        bmi     LE357
        brk
        brk
        .byte   $03
        asl     $0C
        clc
        bmi     LE35F
        brk
        .byte   $3C
        ror     $6E
        ror     L0066,x
        ror     $3C
        brk
        .byte   $3C
        ror     $6E
        ror     L0066,x
        ror     $3C
        brk
        clc
        clc
        sec
        clc
        clc
        clc
        ror     $1800,x
        clc
        sec
        clc
        clc
        clc
        ror     $3C00,x
        ror     $06
        .byte   $0C
        bmi     LE386
        ror     $3C00,x
        ror     $06
        .byte   $0C
        bmi     LE38E
        ror     $3C00,x
        ror     $06
        .byte   $1C
        asl     L0066
        .byte   $3C
        brk
        .byte   $3C
        ror     $06
        .byte   $1C
        asl     L0066
        .byte   $3C
        brk
        asl     $0E
        asl     L7F66,x
        asl     $06
        brk
        asl     $0E
        asl     L7F66,x
        asl     $06
        brk
        ror     L7C60,x
        asl     $06
        ror     $3C
LE357:  brk
        ror     L7C60,x
        asl     $06
        ror     $3C
LE35F:  brk
        .byte   $3C
        ror     L0060
        .byte   $7C
        ror     L0066
        .byte   $3C
        brk
        .byte   $3C
        ror     L0060
        .byte   $7C
        ror     L0066
        .byte   $3C
        brk
        ror     $0C66,x
        clc
        clc
        clc
        clc
        brk
        ror     $0C66,x
        clc
        clc
        clc
        clc
        brk
        .byte   $3C
        ror     L0066
        .byte   $3C
        ror     L0066
LE386:  .byte   $3C
        brk
        .byte   $3C
        ror     L0066
        .byte   $3C
        ror     L0066
LE38E:  .byte   $3C
        brk
        .byte   $3C
        ror     L0066
        rol     L6606,x
        .byte   $3C
        brk
        .byte   $3C
        ror     L0066
        rol     L6606,x
        .byte   $3C
        brk
        brk
        brk
        clc
        brk
        brk
        clc
        brk
        brk
        brk
        brk
        clc
        brk
        brk
        clc
        brk
        brk
        brk
        brk
        clc
        brk
        brk
        clc
        clc
        bmi     LE3B9
LE3B9:  brk
        clc
        brk
        brk
        clc
        clc
        bmi     LE3CF
        clc
        bmi     LE424
        bmi     LE3DE
        asl     $0E00
        clc
        bmi     LE42C
        bmi     LE3E6
        .byte   $0E
LE3CF:  brk
        brk
        brk
        ror     L7E00,x
        brk
        brk
        brk
        brk
        brk
        ror     L7E00,x
        brk
LE3DE:  brk
        brk
        bvs     LE3FA
        .byte   $0C
        asl     $0C
        clc
LE3E6:  bvs     LE3E8
LE3E8:  bvs     LE402
        .byte   $0C
        asl     $0C
        clc
        bvs     LE3F0
LE3F0:  .byte   $3C
        ror     $06
        .byte   $0C
        clc
        brk
        clc
        brk
        .byte   $3C
LE3F9:  .byte   $66
LE3FA:  asl     $0C
        clc
        brk
        clc
        brk
        .byte   $3C
        .byte   $66
LE402:  ror     L606E
        .byte   $62
        .byte   $3C
        brk
        .byte   $3C
        ror     $6E
        ror     L6260
        .byte   $3C
        brk
        clc
        .byte   $3C
        ror     $7E
        ror     L0066
        ror     L0000
        clc
        .byte   $3C
        ror     $7E
        ror     L0066
        ror     L0000
        .byte   $7C
        ror     L0066
        .byte   $7C
LE424:  ror     L0066
        .byte   $7C
        brk
        .byte   $7C
        ror     L0066
        .byte   $7C
LE42C:  ror     L0066
        .byte   $7C
        brk
        .byte   $3C
        ror     L0060
        rts

        rts

        ror     $3C
        brk
        .byte   $3C
        ror     L0060
        rts

        rts

        ror     $3C
        brk
        sei
        jmp     (L6666)

        ror     $6C
        sei
        brk
        sei
        jmp     (L6666)

        ror     $6C
        sei
        brk
        ror     L6060,x
        sei
        rts

        rts

        ror     L7E00,x
        rts

        rts

        sei
        rts

        rts

        ror     L7E00,x
        rts

        rts

        sei
        rts

        rts

        rts

        brk
        ror     L6060,x
        sei
        rts

        rts

        rts

        brk
        .byte   $3C
        ror     L0060
        ror     L6666
        .byte   $3C
        brk
        .byte   $3C
        ror     L0060
        ror     L6666
        .byte   $3C
        brk
        ror     L0066
        ror     $7E
        ror     L0066
        ror     L0000
        ror     L0066
        ror     $7E
        ror     L0066
        ror     L0000
        .byte   $3C
        clc
        clc
        clc
        clc
        clc
        .byte   $3C
        brk
        .byte   $3C
        clc
        clc
        clc
        clc
        clc
        .byte   $3C
        brk
        asl     $0C0C,x
        .byte   $0C
        .byte   $0C
        jmp     (L0038)

        asl     $0C0C,x
        .byte   $0C
        .byte   $0C
        jmp     (L0038)

        ror     $6C
        sei
        bvs     LE52D
        jmp     (L0066)

        ror     $6C
        sei
        bvs     LE535
        jmp     (L0066)

        rts

        rts

        rts

        rts

        rts

        rts

        ror     L6000,x
        rts

        rts

        rts

        rts

        rts

        ror     L6300,x
        .byte   $77
        .byte   $7F
        .byte   $6B
        .byte   $63
        .byte   $63
        .byte   $63
        brk
        .byte   $63
        .byte   $77
        .byte   $7F
        .byte   $6B
        .byte   $63
        .byte   $63
        .byte   $63
        brk
        ror     $76
        ror     L6E7E,x
        ror     L0066
        brk
        ror     $76
        ror     L6E7E,x
        ror     L0066
        brk
        .byte   $3C
        ror     L0066
        ror     L0066
        ror     $3C
        brk
        .byte   $3C
        ror     L0066
        ror     L0066
        ror     $3C
        brk
        .byte   $7C
        ror     L0066
        .byte   $7C
        rts

        rts

        rts

        brk
        .byte   $7C
        ror     L0066
        .byte   $7C
        rts

        rts

        rts

        brk
        .byte   $3C
        ror     L0066
        ror     L0066
        .byte   $3C
        asl     $3C00
        ror     L0066
        ror     L0066
        .byte   $3C
        asl     L7C00
        ror     L0066
        .byte   $7C
        sei
        jmp     (L0066)

        .byte   $7C
        ror     L0066
        .byte   $7C
        sei
LE52D:  jmp     (L0066)

        .byte   $3C
        ror     L0060
        .byte   $3C
        .byte   $06
LE535:  ror     $3C
        brk
        .byte   $3C
        ror     L0060
        .byte   $3C
        asl     L0066
        .byte   $3C
        brk
        ror     $1818,x
        clc
        clc
        clc
        clc
        brk
        ror     $1818,x
        clc
        clc
        clc
        clc
        brk
        ror     L0066
        ror     L0066
        ror     L0066
        .byte   $3C
        brk
        ror     L0066
        ror     L0066
        ror     L0066
        .byte   $3C
        brk
        ror     L0066
        ror     L0066
        ror     $3C
        clc
        brk
        ror     L0066
        ror     L0066
        ror     $3C
        clc
        brk
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $6B
        .byte   $7F
        .byte   $77
        .byte   $63
        brk
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $6B
        .byte   $7F
        .byte   $77
        .byte   $63
        brk
        ror     L0066
        .byte   $3C
        clc
        .byte   $3C
        ror     L0066
        brk
        ror     L0066
        .byte   $3C
        clc
        .byte   $3C
        ror     L0066
        brk
        ror     L0066
        ror     $3C
        clc
        clc
        clc
        brk
        ror     L0066
        ror     $3C
        clc
        clc
        clc
        brk
        ror     $0C06,x
        clc
        bmi     LE606
        ror     L7E00,x
        asl     $0C
        clc
        bmi     LE60E
        ror     $3C00,x
        bmi     LE5E3
        bmi     LE5E5
        bmi     LE5F3
        brk
        .byte   $3C
        bmi     LE5EB
        bmi     LE5ED
        bmi     LE5FB
        brk
        rts

        bmi     LE5DB
        .byte   $0C
        asl     $03
        brk
        brk
        rts

        bmi     LE5E3
        .byte   $0C
        asl     $03
        brk
        brk
        .byte   $3C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $3C
        brk
        .byte   $3C
        .byte   $0C
        .byte   $0C
LE5DB:  .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $3C
        brk
        brk
        clc
        .byte   $3C
LE5E3:  ror     L0000
LE5E5:  brk
        brk
        brk
        brk
        clc
        .byte   $3C
LE5EB:  ror     L0000
LE5ED:  brk
        brk
        brk
        brk
        brk
        brk
LE5F3:  brk
        brk
        brk
        .byte   $7F
        brk
        brk
        brk
        brk
LE5FB:  brk
        brk
        brk
        .byte   $7F
        brk
        clc
        clc
        clc
        brk
        brk
        brk
LE606:  brk
        brk
        clc
        clc
        clc
        brk
        brk
        brk
LE60E:  brk
        brk
        brk
        brk
        .byte   $3C
        asl     $3E
        ror     $3E
        brk
        brk
        brk
        .byte   $3C
        asl     $3E
        ror     $3E
        brk
        brk
        rts

        rts

        .byte   $7C
        ror     L0066
        .byte   $7C
        brk
        brk
        rts

        rts

        .byte   $7C
        ror     L0066
        .byte   $7C
        brk
        brk
        brk
        .byte   $3C
        rts

        rts

        rts

        .byte   $3C
        brk
        brk
        brk
        .byte   $3C
        rts

        rts

        rts

        .byte   $3C
        brk
        brk
        asl     $06
        rol     L6666,x
        rol     a:L0000,x
        asl     $06
        rol     L6666,x
        rol     a:L0000,x
        brk
        .byte   $3C
        ror     $7E
        rts

        .byte   $3C
        brk
        brk
        brk
        .byte   $3C
        ror     $7E
        rts

        .byte   $3C
        brk
        brk
        asl     $3E18
        clc
        clc
        clc
        brk
        brk
        asl     $3E18
        clc
        clc
        clc
        brk
        brk
        brk
        rol     L6666,x
        rol     L7C06,x
        brk
        brk
        rol     L6666,x
        rol     L7C06,x
        brk
        rts

        rts

        .byte   $7C
        ror     L0066
        ror     L0000
        brk
        rts

        rts

        .byte   $7C
        ror     L0066
        ror     L0000
        brk
        clc
        brk
        sec
        clc
        clc
        .byte   $3C
        brk
        brk
        clc
        brk
        sec
        clc
        clc
        .byte   $3C
        brk
        brk
        asl     L0000
        asl     $06
        asl     $06
        .byte   $3C
        brk
        asl     L0000
        asl     $06
        asl     $06
        .byte   $3C
        brk
        rts

        rts

        jmp     (L6C78)

        ror     L0000
        brk
        rts

        rts

        jmp     (L6C78)

        ror     L0000
        brk
        sec
        clc
        clc
        clc
        clc
        .byte   $3C
        brk
        brk
        sec
        clc
        clc
        clc
        clc
        .byte   $3C
        brk
        brk
        brk
        ror     $7F
        .byte   $7F
        .byte   $6B
        .byte   $63
        brk
        brk
        brk
        ror     $7F
        .byte   $7F
        .byte   $6B
        .byte   $63
        brk
        brk
        brk
        .byte   $7C
        ror     L0066
        ror     L0066
        brk
        brk
        brk
        .byte   $7C
        ror     L0066
        ror     L0066
        brk
        brk
        brk
        .byte   $3C
        ror     L0066
        ror     $3C
        brk
        brk
        brk
        .byte   $3C
        ror     L0066
        ror     $3C
        brk
        brk
        brk
        .byte   $7C
        ror     L0066
        .byte   $7C
        rts

        rts

        brk
        brk
        .byte   $7C
        ror     L0066
        .byte   $7C
        rts

        rts

        brk
        brk
        rol     L6666,x
        rol     $0606,x
        brk
        brk
        rol     L6666,x
        rol     $0606,x
        brk
        brk
        .byte   $7C
        ror     L0060
        rts

        rts

        brk
        brk
        brk
        .byte   $7C
        ror     L0060
        rts

        rts

        brk
        brk
        brk
        rol     $3C60,x
        asl     $7C
        brk
        brk
        brk
        rol     $3C60,x
        asl     $7C
        brk
        brk
        clc
        ror     $1818,x
        clc
        asl     a:L0000
        clc
        ror     $1818,x
        clc
        asl     a:L0000
        brk
        ror     L0066
        ror     L0066
        rol     a:L0000,x
        brk
        ror     L0066
        ror     L0066
        rol     a:L0000,x
        brk
        ror     L0066
        ror     $3C
        clc
        brk
        brk
        brk
        ror     L0066
        ror     $3C
        clc
        brk
        brk
        brk
        .byte   $63
        .byte   $6B
        .byte   $7F
        rol     a:$36,x
        brk
        brk
        .byte   $63
        .byte   $6B
        .byte   $7F
        rol     a:$36,x
        brk
        brk
        .byte   $66
LE783:  .byte   $3C
        clc
        .byte   $3C
        ror     L0000
        brk
        brk
        ror     $3C
        clc
        .byte   $3C
        ror     L0000
        brk
        brk
        ror     L0066
        ror     $3E
        .byte   $0C
        sei
        brk
        brk
        ror     L0066
        ror     $3E
        .byte   $0C
        sei
        brk
        brk
        ror     $180C,x
        bmi     LE825
        brk
        brk
        brk
        ror     $180C,x
        bmi     LE82D
        brk
        .byte   $1C
        bmi     LE7CB
        bvs     LE7CD
        bmi     LE7D3
        brk
        .byte   $1C
        bmi     LE7D3
        bvs     LE7D5
        bmi     LE7DB
        brk
        clc
        clc
        clc
LE7C3:  brk
        brk
        clc
        clc
        clc
        clc
        clc
        clc
LE7CB:  brk
LE7CC:  brk
LE7CD:  clc
        clc
        clc
        sec
        .byte   $0C
        clc
LE7D3:  .byte   $0E
        clc
LE7D5:  .byte   $0C
        sec
        brk
        sec
        .byte   $0C
        clc
LE7DB:  asl     $0C18
        sec
        brk
        .byte   $33
        .byte   $FF
        cpy     a:L0000
        brk
        brk
        brk
        .byte   $33
        .byte   $FF
        cpy     a:L0000
        brk
        brk
        brk
        brk
        brk
        brk
LE7F3:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $33
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     LFFCC
        .byte   $E7
        .byte   $C3
        sta     ($E7,x)
LE825:  .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $C3
        sta     ($E7,x)
LE82D:  .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $EF
        .byte   $CF
        .byte   $80
        .byte   $80
        .byte   $CF
        .byte   $EF
        .byte   $FF
        .byte   $FF
        .byte   $EF
        .byte   $CF
        .byte   $80
        .byte   $80
        .byte   $CF
        .byte   $EF
        .byte   $FF
        .byte   $F3
        sbc     L83CF
        .byte   $CF
        sta     LFF03,x
        .byte   $F3
        sbc     L83CF
        .byte   $CF
        sta     LFF03,x
        .byte   $FF
        .byte   $FF
        .byte   $FC
        cmp     ($89,x)
        cmp     #$C9
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FC
        cmp     ($89,x)
        cmp     #$C9
        .byte   $FF
        .byte   $80
        .byte   $80
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $80
        .byte   $80
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $1F
        .byte   $1F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $1F
        .byte   $1F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $07
        .byte   $07
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $07
        .byte   $07
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $33
        ror     $CC
        sta     L6633,y
        cpy     $3399
        ror     $CC
        sta     L6633,y
        cpy     LCC99
        ror     $33
        sta     L66CC,y
        .byte   $33
        sta     L66CC,y
        .byte   $33
        sta     L66CC,y
        .byte   $33
        sta     LFFFF,y
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $33
        .byte   $33
        cpy     LFFCC
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $33
        .byte   $33
        cpy     LE7CC
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        cpx     #$E0
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        cpx     #$E0
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        brk
        brk
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        brk
        brk
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        cpx     #$E0
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        cpx     #$E0
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $07
        .byte   $07
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $07
        .byte   $07
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        cpx     #$E0
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        cpx     #$E0
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $07
        .byte   $07
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $07
        .byte   $07
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $3F
        .byte   $3F
LE9B2:  .byte   $CF
        .byte   $CF
LE9B4:  .byte   $3F
        .byte   $3F
        .byte   $CF
        .byte   $CF
        .byte   $3F
        .byte   $3F
LE9BA:  .byte   $CF
        .byte   $CF
LE9BC:  .byte   $3F
        .byte   $3F
        .byte   $CF
        .byte   $CF
        beq     LE9B2
        beq     LE9B4
        .byte   $FF
        .byte   $FF
LE9C6:  .byte   $FF
        .byte   $FF
LE9C8:  beq     LE9BA
        beq     LE9BC
        .byte   $FF
        .byte   $FF
LE9CE:  .byte   $FF
        .byte   $FF
LE9D0:  .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        beq     LE9C6
        beq     LE9C8
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        beq     LE9CE
        beq     LE9D0
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $FF
        .byte   $FF
LE9E6:  .byte   $FF
        .byte   $FF
LE9E8:  .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $FF
        .byte   $FF
LE9EE:  .byte   $FF
        .byte   $FF
LE9F0:  .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     LE9E6
        beq     LE9E8
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     LE9EE
        beq     LE9F0
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        sta     L9999,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     L9999,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     $99,y
        sta     L9900,y
        sta     L99FF,y
        sta     L9900,y
        brk
        sta     LFF99,y
        .byte   $E7
        cmp     ($9F,x)
        .byte   $C3
        sbc     LE783,y
        .byte   $FF
        .byte   $E7
        cmp     ($9F,x)
        .byte   $C3
        sbc     LE783,y
        .byte   $FF
        .byte   $FF
        sta     LE7F3,y
        .byte   $CF
        sta     LFFB9,y
        .byte   $FF
        sta     LE7F3,y
        .byte   $CF
        sta     LFFB9,y
        .byte   $C3
        sta     LC7C3,y
        tya
        sta     LFFC0,y
        .byte   $C3
        sta     LC7C3,y
        tya
        sta     LFFC0,y
        sbc     LE7F3,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sbc     LE7F3,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $F3
        .byte   $E7
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $E7
        .byte   $F3
        .byte   $FF
        .byte   $F3
        .byte   $E7
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $E7
        .byte   $F3
        .byte   $FF
        .byte   $CF
        .byte   $E7
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $E7
        .byte   $CF
        .byte   $FF
        .byte   $CF
        .byte   $E7
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $E7
        .byte   $CF
        .byte   $FF
        .byte   $FF
        sta     $C3,y
        .byte   $C3
        sta     LFFFF,y
        .byte   $FF
        sta     $C3,y
        .byte   $C3
        sta     LFFFF,y
        .byte   $FF
        .byte   $E7
        .byte   $E7
        sta     ($E7,x)
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        sta     ($E7,x)
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $CF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $CF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FC
        sbc     LE7F3,y
        .byte   $CF
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $FC
        sbc     LE7F3,y
        .byte   $CF
        .byte   $9F
        .byte   $FF
        .byte   $C3
        sta     L8991,y
        sta     LC399,y
        .byte   $FF
        .byte   $C3
        sta     L8991,y
        sta     LC399,y
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $C7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        sta     ($FF,x)
        .byte   $E7
        .byte   $E7
        .byte   $C7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        sta     ($FF,x)
        .byte   $C3
        sta     LF3F9,y
        .byte   $CF
        .byte   $9F
        sta     ($FF,x)
        .byte   $C3
        sta     LF3F9,y
        .byte   $CF
        .byte   $9F
        sta     ($FF,x)
        .byte   $C3
        sta     LE3F9,y
        sbc     LC399,y
        .byte   $FF
        .byte   $C3
        sta     LE3F9,y
        sbc     LC399,y
        .byte   $FF
        sbc     LE1F1,y
        sta     LF980,y
        sbc     LF9FF,y
        sbc     ($E1),y
        sta     LF980,y
        sbc     L81FF,y
        .byte   $9F
        .byte   $83
        sbc     L99F9,y
        .byte   $C3
        .byte   $FF
        sta     ($9F,x)
        .byte   $83
        sbc     L99F9,y
        .byte   $C3
        .byte   $FF
        .byte   $C3
        sta     L839F,y
        sta     LC399,y
        .byte   $FF
        .byte   $C3
        sta     L839F,y
        sta     LC399,y
        .byte   $FF
        sta     ($99,x)
        .byte   $F3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        sta     ($99,x)
        .byte   $F3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $C3
        sta     LC399,y
        sta     LC399,y
        .byte   $FF
        .byte   $C3
        sta     LC399,y
        sta     LC399,y
        .byte   $FF
        .byte   $C3
        sta     LC199,y
        sbc     LC399,y
        .byte   $FF
        .byte   $C3
        sta     LC199,y
        sbc     LC399,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $CF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $CF
        sbc     ($E7),y
        .byte   $CF
        .byte   $9F
        .byte   $CF
        .byte   $E7
        sbc     ($FF),y
        sbc     ($E7),y
        .byte   $CF
        .byte   $9F
        .byte   $CF
        .byte   $E7
        sbc     ($FF),y
        .byte   $FF
        .byte   $FF
        sta     ($FF,x)
        sta     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     ($FF,x)
        sta     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $8F
        .byte   $E7
        .byte   $F3
        sbc     LE7F3,y
        .byte   $8F
        .byte   $FF
        .byte   $8F
        .byte   $E7
        .byte   $F3
        sbc     LE7F3,y
        .byte   $8F
        .byte   $FF
        .byte   $C3
        sta     LF3F9,y
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $C3
        sta     LF3F9,y
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $C3
        sta     L9191,y
        .byte   $9F
        sta     LFFC3,x
        .byte   $C3
        sta     L9191,y
        .byte   $9F
        sta     LFFC3,x
        .byte   $E7
        .byte   $C3
        sta     L9981,y
        sta     LFF99,y
        .byte   $E7
        .byte   $C3
        sta     L9981,y
        sta     LFF99,y
        .byte   $83
        sta     L8399,y
        sta     L8399,y
        .byte   $FF
        .byte   $83
        sta     L8399,y
        sta     L8399,y
        .byte   $FF
        .byte   $C3
        sta     L9F9F,y
        .byte   $9F
        sta     LFFC3,y
        .byte   $C3
        sta     L9F9F,y
        .byte   $9F
        sta     LFFC3,y
        .byte   $87
        .byte   $93
        sta     L9999,y
        .byte   $93
        .byte   $87
        .byte   $FF
        .byte   $87
        .byte   $93
        sta     L9999,y
        .byte   $93
        .byte   $87
        .byte   $FF
        sta     ($9F,x)
        .byte   $9F
        .byte   $87
        .byte   $9F
        .byte   $9F
        sta     ($FF,x)
        sta     ($9F,x)
        .byte   $9F
        .byte   $87
        .byte   $9F
        .byte   $9F
        sta     ($FF,x)
        sta     ($9F,x)
        .byte   $9F
        .byte   $87
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $FF
        sta     ($9F,x)
        .byte   $9F
        .byte   $87
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $C3
        sta     L919F,y
        sta     LC399,y
        .byte   $FF
        .byte   $C3
        sta     L919F,y
        sta     LC399,y
        .byte   $FF
        sta     L9999,y
        sta     ($99,x)
        sta     LFF99,y
        sta     L9999,y
        sta     ($99,x)
        sta     LFF99,y
        .byte   $C3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $C3
        .byte   $FF
        .byte   $C3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $C3
        .byte   $FF
        sbc     ($F3,x)
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $93
        .byte   $C7
        .byte   $FF
        sbc     ($F3,x)
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $93
        .byte   $C7
        .byte   $FF
        sta     L8793,y
        .byte   $8F
        .byte   $87
        .byte   $93
        sta     L99FF,y
        .byte   $93
        .byte   $87
        .byte   $8F
        .byte   $87
        .byte   $93
        sta     L9FFF,y
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        sta     ($FF,x)
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $9F
        sta     ($FF,x)
        .byte   $9C
        dey
        .byte   $80
        sty     $9C,x
        .byte   $9C
        .byte   $9C
        .byte   $FF
        .byte   $9C
        dey
        .byte   $80
        sty     $9C,x
        .byte   $9C
        .byte   $9C
        .byte   $FF
        sta     L8189,y
        sta     ($91,x)
        sta     LFF99,y
        sta     L8189,y
        sta     ($91,x)
        sta     LFF99,y
        .byte   $C3
        sta     L9999,y
        sta     LC399,y
        .byte   $FF
        .byte   $C3
        sta     L9999,y
        sta     LC399,y
        .byte   $FF
        .byte   $83
        sta     L8399,y
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $83
        sta     L8399,y
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $C3
        sta     L9999,y
        sta     LF1C3,y
        .byte   $FF
        .byte   $C3
        sta     L9999,y
        sta     LF1C3,y
        .byte   $FF
        .byte   $83
        sta     L8399,y
        .byte   $87
        .byte   $93
        sta     L83FF,y
        sta     L8399,y
        .byte   $87
        .byte   $93
        sta     LC3FF,y
        sta     LC39F,y
        sbc     LC399,y
        .byte   $FF
        .byte   $C3
        sta     LC39F,y
        sbc     LC399,y
        .byte   $FF
        sta     ($E7,x)
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        sta     ($E7,x)
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        sta     L9999,y
        sta     L9999,y
        .byte   $C3
        .byte   $FF
        sta     L9999,y
        sta     L9999,y
        .byte   $C3
        .byte   $FF
        sta     L9999,y
        sta     LC399,y
        .byte   $E7
        .byte   $FF
        sta     L9999,y
        sta     LC399,y
        .byte   $E7
        .byte   $FF
        .byte   $9C
        .byte   $9C
        .byte   $9C
        sty     $80,x
        dey
        .byte   $9C
        .byte   $FF
        .byte   $9C
        .byte   $9C
        .byte   $9C
        sty     $80,x
        dey
        .byte   $9C
        .byte   $FF
        sta     LC399,y
        .byte   $E7
        .byte   $C3
        sta     LFF99,y
        sta     LC399,y
        .byte   $E7
        .byte   $C3
        sta     LFF99,y
        sta     L9999,y
        .byte   $C3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        sta     L9999,y
        .byte   $C3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        sta     ($F9,x)
        .byte   $F3
        .byte   $E7
        .byte   $CF
        .byte   $9F
        sta     ($FF,x)
        sta     ($F9,x)
        .byte   $F3
        .byte   $E7
        .byte   $CF
        .byte   $9F
        sta     ($FF,x)
        .byte   $C3
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $C3
        .byte   $FF
        .byte   $C3
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $CF
        .byte   $C3
        .byte   $FF
        .byte   $9F
        .byte   $CF
        .byte   $E7
        .byte   $F3
        sbc     LFFFC,y
        .byte   $FF
        .byte   $9F
        .byte   $CF
        .byte   $E7
        .byte   $F3
        sbc     LFFFC,y
        .byte   $FF
        .byte   $C3
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $C3
        .byte   $FF
        .byte   $C3
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $F3
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $C3
        sta     LFFFF,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $C3
        sta     LFFFF,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $80
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $80
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sbc     L99C1,y
        cmp     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sbc     L99C1,y
        cmp     ($FF,x)
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     L8399,y
        .byte   $FF
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     L8399,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $C3
        .byte   $FF
        .byte   $FF
        sbc     LC1F9,y
        sta     LC199,y
        .byte   $FF
        .byte   $FF
        sbc     LC1F9,y
        sta     LC199,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     L9F81,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     L9F81,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        sbc     ($E7),y
        cmp     ($E7,x)
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        sbc     ($E7),y
        cmp     ($E7,x)
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        cmp     ($99,x)
        sta     LF9C1,y
        .byte   $83
        .byte   $FF
        .byte   $FF
        cmp     ($99,x)
        sta     LF9C1,y
        .byte   $83
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     L9999,y
        .byte   $FF
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     L9999,y
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $C7
        .byte   $E7
        .byte   $E7
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $C7
        .byte   $E7
        .byte   $E7
        .byte   $C3
        .byte   $FF
        .byte   $FF
        sbc     LF9FF,y
        sbc     LF9F9,y
        .byte   $C3
        .byte   $FF
        sbc     LF9FF,y
        sbc     LF9F9,y
        .byte   $C3
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $93
        .byte   $87
        .byte   $93
        sta     LFFFF,y
        .byte   $9F
        .byte   $9F
        .byte   $93
        .byte   $87
        .byte   $93
        sta     LFFFF,y
        .byte   $C7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $C7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     L8080,y
        sty     $9C,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     L8080,y
        sty     $9C,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     L9999,y
        sta     LFFFF,y
        .byte   $FF
        .byte   $83
        .byte   $99
        .byte   $99
LEEED:  sta     LFF99,y
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     L9999,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     L9999,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     L8399,y
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     L8399,y
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $FF
        cmp     ($99,x)
        sta     LF9C1,y
        sbc     LFFFF,y
        cmp     ($99,x)
        sta     LF9C1,y
        sbc     LFFFF,y
        .byte   $83
        sta     L9F9F,y
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     L9F9F,y
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $FF
        cmp     ($9F,x)
        .byte   $C3
        sbc     LFF83,y
        .byte   $FF
        .byte   $FF
        cmp     ($9F,x)
        .byte   $C3
        sbc     LFF83,y
        .byte   $FF
        .byte   $E7
        sta     ($E7,x)
        .byte   $E7
        .byte   $E7
        sbc     ($FF),y
        .byte   $FF
        .byte   $E7
        sta     ($E7,x)
        .byte   $E7
        .byte   $E7
        sbc     ($FF),y
        .byte   $FF
        .byte   $FF
        sta     L9999,y
        sta     LFFC1,y
        .byte   $FF
        .byte   $FF
        sta     L9999,y
        sta     LFFC1,y
        .byte   $FF
        .byte   $FF
        sta     L9999,y
        .byte   $C3
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $99
        .byte   $99
LEF6C:  sta     LE7C3,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9C
        sty     $80,x
        cmp     ($C9,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $9C
        sty     $80,x
        cmp     ($C9,x)
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     LE7C3,y
        .byte   $C3
        sta     LFFFF,y
        .byte   $FF
        sta     LE7C3,y
        .byte   $C3
        sta     LFFFF,y
        .byte   $FF
        sta     L9999,y
        cmp     ($F3,x)
        .byte   $87
        .byte   $FF
        .byte   $FF
        sta     L9999,y
        cmp     ($F3,x)
        .byte   $87
        .byte   $FF
        .byte   $FF
        sta     ($F3,x)
        .byte   $E7
        .byte   $CF
        sta     ($FF,x)
        .byte   $FF
        .byte   $FF
        sta     ($F3,x)
        .byte   $E7
        .byte   $CF
        sta     ($FF,x)
        .byte   $E3
        .byte   $CF
        .byte   $E7
        .byte   $8F
        .byte   $E7
        .byte   $CF
        .byte   $E3
        .byte   $FF
        .byte   $E3
        .byte   $CF
        .byte   $E7
        .byte   $8F
        .byte   $E7
        .byte   $CF
        .byte   $E3
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $C7
        .byte   $F3
        .byte   $E7
        sbc     ($E7),y
        .byte   $F3
        .byte   $C7
        .byte   $FF
        .byte   $C7
        .byte   $F3
        .byte   $E7
        sbc     ($E7),y
        .byte   $F3
        .byte   $C7
        .byte   $FF
        cpy     $3300
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        cpy     $3300
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LF1C3:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LF3F9:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LF980:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LF9C1:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LF9F9:  brk
        brk
        brk
        brk
        brk
        brk
LF9FF:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFB00:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFBFA:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFF03:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFF83:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFF99:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFFB9:  brk
        brk
        brk
        brk
        brk
        brk
        brk
LFFC0:  brk
LFFC1:  brk
        brk
LFFC3:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFFCC:  brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
LFFFC:  brk
        brk
LFFFE:  brk
LFFFF:  brk
