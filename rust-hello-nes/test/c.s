; da65 V2.18 - Debian 2.19-2
; Created:    2025-12-07 12:45:14
; Input file: /tmp/tmp.PQctWb7Qj1
; Page:       1


        .setcpu "6502"

Lxxxx           := $004F
Lxxxx           := $2020
Lxxxx           := $2121
Lxxxx           := $6000
Lxxxx           := $6007
Lxxxx           := $6040
        sei
        cld
        ldx     #$00
        stx     $70
        stx     $72
        stx     $71
        stx     $73
        txs
        lda     #$20
        sta     $0200,x
        sta     $0300,x
        sta     $0400,x
        inx
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        lda     #$00
        ldx     #$08
        sta     $02
        stx     $03
        jsr     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        pha
        tya
        pha
        txa
        pha
        lda     #$01
        sta     $70
        inc     $6B
        bne     Lxxxx
        inc     $6C
        jsr     Lxxxx
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

        ldy     #$02
        beq     Lxxxx
        lda     #$C7
        ldx     #$80
        jmp     Lxxxx

        rts

        jsr     Lxxxx
        jsr     Lxxxx
        lda     #$00
        sta     $68
        sta     $69
        sta     $6A
        jmp     Lxxxx

        lda     #$A8
        sta     $2000
        lda     #$1E
        sta     $2001
        lda     $2002
        bpl     Lxxxx
        lda     #$00
        sta     $2005
        sta     $2005
        lda     #$00
        ldy     #$F0
        sta     $2003
        ldx     #$40
        sty     $2004
        sta     $2004
        sta     $2004
        sty     $2004
        dex
        bne     Lxxxx
        rts

        lda     $2002
        bpl     Lxxxx
        lda     #$3F
        sta     $2006
        lda     #$00
        sta     $2006
        ldx     #$00
        lda     Lxxxx,x
        sta     $2007
        inx
        cpx     #$20
        bne     Lxxxx
        rts

        adc     #$80
        lda     #$93
        ldx     #$88
        jsr     Lxxxx
        ldy     #$02
        jsr     Lxxxx
        jmp     Lxxxx

        jmp     Lxxxx

        ldx     #$00
        lda     #$00
        jmp     Lxxxx

        rts

        ldy     #$00
        lda     ($18),y
        inc     $18
        bne     Lxxxx
        inc     $19
        rts

        lda     $603F
        sta     $603A
        jsr     Lxxxx
        lda     #$3A
        ldx     #$60
        jsr     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        lda     $16
        sec
        sbc     #$02
        sta     $16
        bcs     Lxxxx
        dec     $17
        rts

        lda     $6044
        bne     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        lda     $6044
        bne     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        jsr     Lxxxx
        sta     $04
        stx     $05
        jsr     Lxxxx
        ldy     #$01
        lda     ($16),y
        tax
        dey
        lda     ($16),y
        rts

        ldy     #$00
        sty     $0A
        sty     $0B
        lda     ($18),y
        sec
        sbc     #$30
        bcc     Lxxxx
        cmp     #$0A
        bcs     Lxxxx
        jsr     Lxxxx
        pha
        lda     $0A
        ldx     $0B
        asl     $0A
        rol     $0B
        asl     $0A
        rol     $0B
        adc     $0A
        sta     $0A
        txa
        adc     $0B
        sta     $0B
        asl     $0A
        rol     $0B
        pla
        adc     $0A
        sta     $0A
        bcc     Lxxxx
        inc     $0B
        bcs     Lxxxx
        lda     $0A
        ldx     $0B
        rts

        ldy     $6046
        inc     $6046
        sta     $6047,y
        rts

        lda     #$47
        ldx     #$60
        clc
        adc     $6046
        bcc     Lxxxx
        inx
        jmp     Lxxxx

        lda     $1A
        ldx     $1B
        jmp     Lxxxx

        jsr     Lxxxx
        inc     Lxxxx
        bne     Lxxxx
        inc     $6041
        bne     Lxxxx
        rts

        jsr     Lxxxx
        lda     $605B
        ldx     $605C
        jsr     Lxxxx
        lda     $605D
        ldx     $605E
        jsr     Lxxxx
        jmp     Lxxxx

        sty     $0A
        jsr     Lxxxx
        jsr     Lxxxx
        lda     $0A
        jmp     Lxxxx

        sty     $0A
        jsr     Lxxxx
        jsr     Lxxxx
        lda     $0A
        jmp     Lxxxx

        pha
        ldy     #$05
        lda     $16,y
        sta     $6034,y
        dey
        bpl     Lxxxx
        pla
        sta     $16
        stx     $17
        jsr     Lxxxx
        sta     $18
        stx     $19
        jsr     Lxxxx
        sta     $1A
        stx     $1B
        lda     #$00
        tay
        sta     ($1A),y
        iny
        sta     ($1A),y
        iny
        lda     ($1A),y
        sta     $6001
        iny
        lda     ($1A),y
        sta     $6002
        lda     $18
        sta     $0A
        lda     $19
        sta     $0B
        ldy     #$00
        lda     ($18),y
        beq     Lxxxx
        cmp     #$25
        beq     Lxxxx
        iny
        bne     Lxxxx
        inc     $19
        bne     Lxxxx
        tya
        clc
        adc     $18
        sta     $18
        bcc     Lxxxx
        inc     $19
        sec
        sbc     $0A
        sta     $0C
        lda     $19
        sbc     $0B
        sta     $0D
        ora     $0C
        beq     Lxxxx
        jsr     Lxxxx
        ldy     #$05
        lda     $1B
        sta     ($02),y
        dey
        lda     $1A
        sta     ($02),y
        dey
        lda     $0B
        sta     ($02),y
        dey
        lda     $0A
        sta     ($02),y
        dey
        lda     $0D
        sta     ($02),y
        dey
        lda     $0C
        sta     ($02),y
        jsr     Lxxxx
        jsr     Lxxxx
        tax
        bne     Lxxxx
        ldx     #$05
        lda     $6034,x
        sta     $16,x
        dex
        bpl     Lxxxx
        rts

        cmp     #$25
        bne     Lxxxx
        lda     ($18),y
        cmp     #$25
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        lda     #$00
        ldx     #$0B
        sta     $603B,x
        dex
        bpl     Lxxxx
        lda     ($18),y
        cmp     #$2D
        bne     Lxxxx
        stx     $603B
        beq     Lxxxx
        cmp     #$2B
        bne     Lxxxx
        stx     $603C
        beq     Lxxxx
        cmp     #$20
        bne     Lxxxx
        stx     $603D
        beq     Lxxxx
        cmp     #$23
        bne     Lxxxx
        stx     $603E
        jsr     Lxxxx
        jmp     Lxxxx

        ldx     #$20
        cmp     #$30
        bne     Lxxxx
        tax
        jsr     Lxxxx
        lda     ($18),y
        stx     $603F
        cmp     #$2A
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        jsr     Lxxxx
        sta     Lxxxx
        stx     $6041
        sty     $6042
        sty     $6043
        lda     ($18),y
        cmp     #$2E
        bne     Lxxxx
        jsr     Lxxxx
        lda     ($18),y
        cmp     #$2A
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        jsr     Lxxxx
        sta     $6042
        stx     $6043
        lda     ($18),y
        cmp     #$7A
        beq     Lxxxx
        cmp     #$68
        beq     Lxxxx
        cmp     #$74
        beq     Lxxxx
        cmp     #$6A
        beq     Lxxxx
        cmp     #$4C
        beq     Lxxxx
        cmp     #$6C
        bne     Lxxxx
        lda     #$FF
        sta     $6044
        jsr     Lxxxx
        jmp     Lxxxx

        sty     $6046
        ldx     #$47
        stx     $605B
        ldx     #$60
        stx     $605C
        jsr     Lxxxx
        cmp     #$63
        bne     Lxxxx
        jsr     Lxxxx
        sta     $6047
        lda     #$00
        sta     $6048
        jmp     Lxxxx

        cmp     #$64
        beq     Lxxxx
        cmp     #$69
        bne     Lxxxx
        ldx     #$00
        lda     $603D
        beq     Lxxxx
        ldx     #$20
        lda     $603C
        beq     Lxxxx
        ldx     #$2B
        stx     $6045
        jsr     Lxxxx
        ldy     $05
        bmi     Lxxxx
        ldy     $6045
        beq     Lxxxx
        sty     $6047
        inc     $6046
        ldy     #$0A
        jsr     Lxxxx
        jmp     Lxxxx

        cmp     #$6E
        bne     Lxxxx
        jsr     Lxxxx
        sta     $0A
        stx     $0B
        ldy     #$00
        lda     ($1A),y
        sta     ($0A),y
        iny
        lda     ($1A),y
        sta     ($0A),y
        jmp     Lxxxx

        cmp     #$6F
        bne     Lxxxx
        jsr     Lxxxx
        ldy     $603E
        beq     Lxxxx
        pha
        stx     $12
        ora     $12
        ora     $04
        ora     $05
        ora     $6042
        ora     $6043
        beq     Lxxxx
        lda     #$30
        jsr     Lxxxx
        pla
        ldy     #$08
        jsr     Lxxxx
        jmp     Lxxxx

        cmp     #$70
        bne     Lxxxx
        ldx     #$00
        stx     $6044
        inx
        stx     $603E
        lda     #$78
        bne     Lxxxx
        cmp     #$73
        bne     Lxxxx
        jsr     Lxxxx
        sta     $605B
        stx     $605C
        jmp     Lxxxx

        cmp     #$75
        bne     Lxxxx
        jsr     Lxxxx
        ldy     #$0A
        jsr     Lxxxx
        jmp     Lxxxx

        cmp     #$78
        beq     Lxxxx
        cmp     #$58
        bne     Lxxxx
        pha
        lda     $603E
        beq     Lxxxx
        lda     #$30
        jsr     Lxxxx
        lda     #$58
        jsr     Lxxxx
        jsr     Lxxxx
        ldy     #$10
        jsr     Lxxxx
        pla
        cmp     #$78
        bne     Lxxxx
        lda     $605B
        ldx     $605C
        jsr     Lxxxx
        jmp     Lxxxx

        jmp     Lxxxx

        lda     $605B
        ldx     $605C
        jsr     Lxxxx
        sta     $605D
        stx     $605E
        lda     $6042
        ora     $6043
        beq     Lxxxx
        ldx     $6042
        cpx     $605D
        lda     $6043
        tay
        sbc     $605E
        bcs     Lxxxx
        stx     $605D
        sty     $605E
        sec
        lda     Lxxxx
        sbc     $605D
        tax
        lda     $6041
        sbc     $605E
        bcs     Lxxxx
        lda     #$00
        tax
        eor     #$FF
        sta     $6041
        txa
        eor     #$FF
        sta     Lxxxx
        lda     $603B
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        lda     $603B
        beq     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        iny
        pha
        clc
        tya
        adc     $02
        sta     $02
        bcc     Lxxxx
        inc     $03
        pla
        rts

        ldy     #$FF
        cpx     #$80
        bcs     Lxxxx
        ldy     #$00
        sty     $04
        sty     $05
        rts

        lda     $6003
        ldx     $6004
        jsr     Lxxxx
        lda     $6005
        ldx     $6006
        jsr     Lxxxx
        ldy     #$04
        jmp     Lxxxx

        ldy     #$00
        beq     Lxxxx
        lda     #$60
        ldx     #$89
        jmp     Lxxxx

        rts

        lda     #$60
        sta     $0A
        lda     #$89
        sta     $0B
        lda     #$00
        sta     $0C
        lda     #$60
        sta     $0D
        ldx     #$CB
        lda     #$FF
        sta     $12
        ldy     #$00
        inx
        beq     Lxxxx
        lda     ($0A),y
        sta     ($0C),y
        iny
        bne     Lxxxx
        inc     $0B
        inc     $0D
        bne     Lxxxx
        inc     $12
        bne     Lxxxx
        rts

        sty     $605F
        dey
        dey
        tya
        clc
        adc     $02
        sta     $0A
        ldx     $03
        bcc     Lxxxx
        inx
        stx     $0B
        ldy     #$01
        lda     ($0A),y
        tax
        dey
        lda     ($0A),y
        jsr     Lxxxx
        lda     $0A
        ldx     $0B
        jsr     Lxxxx
        ldy     $605F
        jmp     Lxxxx

        pha
        jsr     Lxxxx
        pla
        cmp     #$0D
        bne     Lxxxx
        lda     #$00
        sta     $69
        beq     Lxxxx
        cmp     #$0A
        beq     Lxxxx
        jsr     Lxxxx
        ldy     $69
        iny
        cpy     #$20
        bne     Lxxxx
        inc     $6A
        ldy     #$00
        sty     $69
        jmp     Lxxxx

        inc     $6A
        ldy     $69
        ldx     $6A
        jmp     Lxxxx

        ora     $68
        ldy     $63
        ldx     $62
        jmp     Lxxxx

        cpx     #$00
        bne     Lxxxx
        lsr     a
        tax
        lda     Lxxxx,x
        bcc     Lxxxx
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        and     #$0F
        tax
        lda     Lxxxx,x
        ldx     #$00
        rts

        sec
        lda     #$00
        tax
        rts

        lda     $02
        sec
        sbc     #$04
        sta     $02
        bcc     Lxxxx
        rts

        dec     $03
        rts

        lda     $02
        sec
        sbc     #$06
        sta     $02
        bcc     Lxxxx
        rts

        dec     $03
        rts

        jsr     Lxxxx
        sta     $6A
        jsr     Lxxxx
        sta     $69
        tay
        ldx     $6A
        jmp     Lxxxx

        ldy     #$01
        lda     ($02),y
        tax
        dey
        lda     ($02),y
        inc     $02
        beq     Lxxxx
        inc     $02
        beq     Lxxxx
        rts

        inc     $02
        inc     $03
        rts

        clc
        eor     #$FF
        adc     #$01
        pha
        txa
        eor     #$FF
        adc     #$00
        tax
        lda     $04
        eor     #$FF
        adc     #$00
        sta     $04
        lda     $05
        eor     #$FF
        adc     #$00
        sta     $05
        pla
        rts

        lda     #$00
        tax
        ldy     #$00
        sty     $04
        sty     $05
        pha
        jsr     Lxxxx
        ldy     #$03
        lda     $05
        sta     ($02),y
        dey
        lda     $04
        sta     ($02),y
        dey
        txa
        sta     ($02),y
        pla
        dey
        sta     ($02),y
        rts

        sta     $12
        jsr     Lxxxx
        sta     $0C
        stx     $0D
        sta     $0E
        stx     $0F
        jsr     Lxxxx
        jsr     Lxxxx
        sta     $04
        stx     $05
        rts

        jsr     Lxxxx
        ldx     $05
        ldy     $12
        cpy     #$0A
        bne     Lxxxx
        lda     $04
        ora     $0B
        ora     $0A
        bne     Lxxxx
        cpx     #$80
        bne     Lxxxx
        ldy     #$0B
        lda     Lxxxx,y
        sta     ($0C),y
        dey
        bpl     Lxxxx
        jmp     Lxxxx

        txa
        bpl     Lxxxx
        lda     #$2D
        ldy     #$00
        sta     ($0C),y
        inc     $0C
        bne     Lxxxx
        inc     $0D
        lda     $0A
        ldx     $0B
        jsr     Lxxxx
        sta     $0A
        stx     $0B
        jmp     Lxxxx

        jsr     Lxxxx
        lda     #$00
        pha
        ldy     #$20
        lda     #$00
        asl     $0A
        rol     $0B
        rol     $04
        rol     $05
        rol     a
        cmp     $12
        bcc     Lxxxx
        sbc     $12
        inc     $0A
        dey
        bne     Lxxxx
        tay
        lda     Lxxxx,y
        pha
        lda     $0A
        ora     $0B
        ora     $04
        ora     $05
        bne     Lxxxx
        ldy     #$00
        pla
        sta     ($0C),y
        beq     Lxxxx
        iny
        bne     Lxxxx
        lda     $0E
        ldx     $0F
        rts

        ldy     #$00
        lda     ($02),y
        inc     $02
        beq     Lxxxx
        rts

        inc     $03
        rts

        ldy     #$01
        lda     ($02),y
        sta     $0B
        dey
        lda     ($02),y
        sta     $0A
        jmp     Lxxxx

        lda     $73
        bne     Lxxxx
        rts

        lda     #$FF
        cmp     $73
        beq     Lxxxx
        rts

        sta     $76
        sty     $74
        stx     $75
        jsr     Lxxxx
        ldy     $71
        lda     $74
        sta     $0200,y
        lda     $75
        sta     $0300,y
        lda     $76
        sta     $0400,y
        iny
        sty     $71
        inc     $73
        rts

        ldy     $73
        bne     Lxxxx
        rts

        ldx     $72
        lda     #$0E
        sta     $6060
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     $0400,x
        sta     $2007
        inx
        dey
        beq     Lxxxx
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     $0400,x
        sta     $2007
        inx
        dey
        beq     Lxxxx
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     $0400,x
        sta     $2007
        inx
        dey
        beq     Lxxxx
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     $0400,x
        sta     $2007
        inx
        dey
        beq     Lxxxx
        lda     $0200,x
        sta     $2006
        lda     $0300,x
        sta     $2006
        lda     $0400,x
        sta     $2007
        inx
        dey
        beq     Lxxxx
        dec     $6060
        bne     Lxxxx
        stx     $72
        sty     $73
        rts

        lda     #$01
        jmp     Lxxxx

        lda     #$00
        ldx     #$00
        pha
        lda     $02
        sec
        sbc     #$02
        sta     $02
        bcs     Lxxxx
        dec     $03
        ldy     #$01
        txa
        sta     ($02),y
        pla
        dey
        sta     ($02),y
        rts

        tya
        clc
        adc     Lxxxx,x
        sta     $62
        lda     Lxxxx,x
        adc     #$00
        sta     $63
        rts

        jsr     Lxxxx
        .byte   $80
        ldy     #$C0
        cpx     #$00
        jsr     Lxxxx
        .byte   $80
        ldy     #$C0
        cpx     #$00
        jsr     Lxxxx
        .byte   $80
        ldy     #$C0
        cpx     #$00
        jsr     Lxxxx
        .byte   $80
        .byte   $A0
        jsr     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        and     ($21,x)
        and     ($21,x)
        and     ($21,x)
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $22
        .byte   $23
        .byte   $23
        .byte   $23
        .byte   $23
        .byte   $23
        .byte   $23
        sta     $0C
        stx     $0D
        ldx     #$00
        ldy     #$00
        lda     ($0C),y
        beq     Lxxxx
        iny
        bne     Lxxxx
        inc     $0D
        inx
        bne     Lxxxx
        tya
        rts

        sta     $0A
        stx     $0B
        sta     $0C
        stx     $0D
        ldy     #$00
        lda     ($0A),y
        beq     Lxxxx
        jsr     Lxxxx
        and     #$02
        beq     Lxxxx
        lda     ($0A),y
        adc     #$20
        sta     ($0A),y
        iny
        bne     Lxxxx
        inc     $0B
        bne     Lxxxx
        lda     $0C
        ldx     $0D
        rts

        jsr     Lxxxx
        sta     $0C
        eor     #$FF
        sta     $6032
        txa
        sta     $0D
        eor     #$FF
        sta     $6033
        jsr     Lxxxx
        jsr     Lxxxx
        sta     $0E
        stx     $0F
        ldy     #$00
        sty     $12
        lda     ($0E),y
        clc
        adc     $0C
        sta     ($0E),y
        iny
        lda     ($0E),y
        adc     $0D
        sta     ($0E),y
        inc     $6032
        beq     Lxxxx
        ldy     $12
        lda     ($0A),y
        iny
        bne     Lxxxx
        inc     $0B
        sty     $12
        jsr     Lxxxx
        jmp     Lxxxx

        inc     $6033
        bne     Lxxxx
        rts

        sta     $0A
        stx     $0B
        lda     #$00
        sta     $602C
        sta     $602D
        ldy     #$01
        lda     ($02),y
        tax
        dey
        lda     ($02),y
        jsr     Lxxxx
        ldy     #$02
        lda     #$2C
        sta     ($02),y
        iny
        .byte   $A9
        rts

        sta     ($02),y
        lda     $0A
        ldx     $0B
        jsr     Lxxxx
        lda     $602C
        ldx     $602D
        rts

        lda     #$34
        sta     $0A
        lda     #$60
        sta     $0B
        lda     #$00
        tay
        ldx     #$00
        beq     Lxxxx
        sta     ($0A),y
        iny
        bne     Lxxxx
        inc     $0B
        dex
        bne     Lxxxx
        cpy     #$2D
        beq     Lxxxx
        sta     ($0A),y
        iny
        bne     Lxxxx
        rts

        pha
        eor     $4C
        jmp     Lxxxx

        bmi     Lxxxx
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
        ora     ($02,x)
        .byte   $0C
        ora     #$0A
        bpl     Lxxxx
        bvc     Lxxxx
        .byte   $D0
        ror     $66
        ror     $66
        ldx     $88
        dey
        ror     $66
        ror     $66
        .byte   $66
        ror     $66
        ror     $66
        ora     #$00
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        bvc     Lxxxx
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
        rti

        .byte   $44
        .byte   $44
        .byte   $14
        ora     ($11),y
        ora     ($11),y
        ora     ($11),y
        ora     ($11),y
        .byte   $11
        ora     ($00,x)
        bvs     Lxxxx
        ror     $66
        ror     $A6
        dey
        dey
        ror     $66
        ror     $66
        ror     $66
        ror     $66
        ror     $09
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        .byte   $33
        bvc     Lxxxx
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
        rti

        .byte   $44
        .byte   $44
        .byte   $14
        ora     ($11),y
        .byte   $11
        ora     ($11),y
        ora     ($11),y
        ora     ($11),y
        ora     ($00,x)
        .byte   $70
        .byte   $0F
        .byte   $14
        .byte   $3B
        and     $2D38,x
        .byte   $22
        .byte   $04
        clc
        php
        and     $01,x
        bpl     Lxxxx
        and     $0F1A,x
        .byte   $14
        .byte   $3B
        and     $2D38,x
        .byte   $22
        .byte   $04
        clc
        php
        and     $01,x
        bpl     Lxxxx
        and     $4C1A,x
        sta     $6015
        stx     $6016
        sta     $601C
        stx     $601D
        dey
        lda     Lxxxx,y
        .byte   $8D
        .byte   $26
        rts

        dey
        lda     Lxxxx,y
        sta     $6025
        sty     $6028
        jsr     Lxxxx
        ldy     #$FF
        bne     Lxxxx
        rts

        inc     $87,x
        and     $80,x
        .byte   $80
        .byte   $5C
        .byte   $80
