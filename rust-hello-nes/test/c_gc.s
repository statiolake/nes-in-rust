; da65 V2.18 - Debian 2.19-2
; Created:    2025-12-07 12:09:31
; Input file: c_gc.nes
; Page:       1


        .setcpu "6502"

Lxxxx           := $0038
Lxxxx           := $004F
Lxxxx           := $0066
Lxxxx           := $2020
        lsr     $5345
        .byte   $1A
        .byte   $02
        ora     ($03,x)
        sei
        cld
        .byte   $A2
        .byte   $86
        .byte   $70
        .byte   $86
        .byte   $72
        stx     $71
        stx     $73
        txs
        lda     #$20
        sta     $0200,x
        sta     $0300,x
        .byte   $9D
        .byte   $04
        inx
        bne     Lxxxx
        .byte   $20
        .byte   $AB
        .byte   $87
        jsr     Lxxxx
        lda     #$00
        ldx     #$08
        sta     $02
        .byte   $86
        .byte   $03
        jsr     Lxxxx
        .byte   $20
        stx     $84
        jsr     Lxxxx
        .byte   $4C
        .byte   $80
        pha
        tya
        pha
        txa
        pha
        .byte   $A9
        .byte   $01
        .byte   $85
        .byte   $70
        .byte   $E6
        .byte   $6B
        .byte   $D0
        .byte   $02
        .byte   $E6
        .byte   $6C
        .byte   $20
        .byte   $5D
        .byte   $86
        .byte   $A9
        jsr     $068D
        jsr     $A9
        sta     $2006
        sta     $2005
        sta     $2005
        pla
        tax
        pla
        tay
        pla
        rti

        .byte   $A0
        .byte   $02
        .byte   $F0
        .byte   $07
        lda     #$C7
        ldx     #$80
        jmp     Lxxxx

        rts

        jsr     Lxxxx
        .byte   $20
        tax
        .byte   $80
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
        ldy     #$00
        lda     ($18),y
        inc     $18
        bne     Lxxxx
        inc     $19
        rts

        lda     Lxxxx
        sta     Lxxxx
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

        lda     Lxxxx
        bne     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        lda     Lxxxx
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

        ldy     Lxxxx
        inc     Lxxxx
        sta     Lxxxx,y
        rts

        lda     #$47
        ldx     #$60
        clc
        adc     Lxxxx
        bcc     Lxxxx
        inx
        jmp     Lxxxx

        lda     $1A
        ldx     $1B
        jmp     Lxxxx

        jsr     Lxxxx
        inc     Lxxxx
        bne     Lxxxx
        inc     Lxxxx
        bne     Lxxxx
        rts

        jsr     Lxxxx
        lda     Lxxxx
        ldx     Lxxxx
        jsr     Lxxxx
        lda     Lxxxx
        ldx     Lxxxx
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
        sta     Lxxxx,y
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
        sta     Lxxxx
        iny
        lda     ($1A),y
        sta     Lxxxx
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
        lda     Lxxxx,x
        sta     $16,x
        dex
        bpl     Lxxxx
        rts

        cmp     #$25
        bne     Lxxxx
        lda     ($18),y
        cmp     #$25
        .byte   $D0
        ora     #$20
        .byte   $CD
        .byte   $80
        jsr     Lxxxx
        jmp     Lxxxx

        lda     #$00
        ldx     #$0B
        sta     Lxxxx,x
        dex
        bpl     Lxxxx
        lda     ($18),y
        cmp     #$2D
        bne     Lxxxx
        stx     Lxxxx
        beq     Lxxxx
        cmp     #$2B
        bne     Lxxxx
        stx     Lxxxx
        beq     Lxxxx
        cmp     #$20
        bne     Lxxxx
        stx     Lxxxx
        beq     Lxxxx
        cmp     #$23
        bne     Lxxxx
        stx     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        ldx     #$20
        cmp     #$30
        bne     Lxxxx
        tax
        jsr     Lxxxx
        lda     ($18),y
        stx     Lxxxx
        cmp     #$2A
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        jsr     Lxxxx
        sta     Lxxxx
        stx     Lxxxx
        sty     Lxxxx
        sty     Lxxxx
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
        sta     Lxxxx
        stx     Lxxxx
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
        sta     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        sty     Lxxxx
        ldx     #$47
        stx     Lxxxx
        ldx     #$60
        stx     Lxxxx
        jsr     Lxxxx
        cmp     #$63
        bne     Lxxxx
        jsr     Lxxxx
        sta     Lxxxx
        lda     #$00
        sta     Lxxxx
        jmp     Lxxxx

        cmp     #$64
        beq     Lxxxx
        cmp     #$69
        bne     Lxxxx
        ldx     #$00
        lda     Lxxxx
        beq     Lxxxx
        ldx     #$20
        lda     Lxxxx
        beq     Lxxxx
        ldx     #$2B
        stx     Lxxxx
        jsr     Lxxxx
        ldy     $05
        bmi     Lxxxx
        ldy     Lxxxx
        beq     Lxxxx
        sty     Lxxxx
        inc     Lxxxx
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
        ldy     Lxxxx
        beq     Lxxxx
        pha
        stx     $12
        ora     $12
        ora     $04
        ora     $05
        ora     Lxxxx
        ora     Lxxxx
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
        stx     Lxxxx
        inx
        stx     Lxxxx
        lda     #$78
        bne     Lxxxx
        cmp     #$73
        bne     Lxxxx
        jsr     Lxxxx
        sta     Lxxxx
        stx     Lxxxx
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
        lda     Lxxxx
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
        lda     Lxxxx
        ldx     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        jmp     Lxxxx

        lda     Lxxxx
        ldx     Lxxxx
        jsr     Lxxxx
        sta     Lxxxx
        stx     Lxxxx
        lda     Lxxxx
        ora     Lxxxx
        beq     Lxxxx
        ldx     Lxxxx
        cpx     Lxxxx
        lda     Lxxxx
        tay
        sbc     Lxxxx
        bcs     Lxxxx
        stx     Lxxxx
        sty     Lxxxx
        sec
        lda     Lxxxx
        sbc     Lxxxx
        tax
        lda     Lxxxx
        sbc     Lxxxx
        bcs     Lxxxx
        lda     #$00
        tax
        eor     #$FF
        sta     Lxxxx
        txa
        eor     #$FF
        sta     Lxxxx
        lda     Lxxxx
        bne     Lxxxx
        jsr     Lxxxx
        jsr     Lxxxx
        lda     Lxxxx
        beq     Lxxxx
        jsr     Lxxxx
        jmp     Lxxxx

        iny
        clc
        tya
        adc     $02
        sta     $02
        bcc     Lxxxx
        inc     $03
        pla
        rts

        cpx     #$80
        bcs     Lxxxx
        ldy     #$00
        sty     $04
        sty     $05
        rts

        lda     Lxxxx
        ldx     Lxxxx
        jsr     Lxxxx
        lda     Lxxxx
        ldx     Lxxxx
        jsr     Lxxxx
        ldy     #$04
        jmp     Lxxxx

        ldy     #$00
        beq     Lxxxx
        lda     #$9B
        ldx     #$88
        jmp     Lxxxx

        rts

        lda     #$9B
        sta     $0A
        lda     #$88
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

        sty     Lxxxx
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
        ldy     Lxxxx
        jmp     Lxxxx

        pha
        jsr     Lxxxx
        pla
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

        jsr     Lxxxx
        sta     $6A
        jsr     Lxxxx
        sta     $69
        tay
        ldx     $6A
        jmp     Lxxxx

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

        lda     #$00
        pha
        ldy     #$20
        lda     #$00
        asl     $0A
        rol     $0B
        rol     $04
        .byte   $26
        ora     $2A
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

        lda     $73
        bne     Lxxxx
        rts

        ldy     $73
        bne     Lxxxx
        rts

        ldx     $72
        lda     #$0E
        sta     Lxxxx
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
        .byte   $BD
        .byte   $04
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
        dec     Lxxxx
        bne     Lxxxx
        stx     $72
        sty     $73
        rts

        jsr     Lxxxx
        .byte   $80
        ldy     #$C0
        cpx     #$00
        jsr     Lxxxx
        .byte   $80
        ldy     #$C0
        cpx     #$00
        .byte   $20
        rti

        rts

        .byte   $80
        ldy     #$C0
        cpx     #$00
        jsr     Lxxxx
        .byte   $80
        ldy     #$20
        jsr     Lxxxx
        jsr     Lxxxx
        and     ($21,x)
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
        sta     Lxxxx
        txa
        sta     $0D
        eor     #$FF
        sta     Lxxxx
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
        inc     Lxxxx
        beq     Lxxxx
        ldy     $12
        lda     ($0A),y
        iny
        bne     Lxxxx
        inc     $0B
        sty     $12
        jsr     Lxxxx
        jmp     Lxxxx

        inc     Lxxxx
        bne     Lxxxx
        rts

        sta     $0A
        stx     $0B
        lda     #$00
        sta     Lxxxx
        sta     Lxxxx
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
        lda     Lxxxx
        ldx     Lxxxx
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
        bne     Lxxxx
        ror     Lxxxx
        ror     $A6
        dey
        dey
        ror     Lxxxx
        ror     Lxxxx
        .byte   $66
        ror     Lxxxx
        ror     Lxxxx
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
        ror     Lxxxx
        ror     $A6
        dey
        dey
        ror     Lxxxx
        ror     Lxxxx
        ror     Lxxxx
        ror     Lxxxx
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
        bvs     Lxxxx
        .byte   $14
        .byte   $3B
        and     $2D38,x
        .byte   $22
        .byte   $04
        clc
        php
        and     $01,x
        bpl     Lxxxx
        .byte   $3D
        .byte   $1A
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
        and     $4C1A,x
        sta     Lxxxx
        stx     Lxxxx
        sta     Lxxxx
        stx     Lxxxx
        dey
        lda     Lxxxx,y
        .byte   $8D
        .byte   $26
        rts

        dey
        lda     Lxxxx,y
        sta     Lxxxx
        sty     Lxxxx
        jsr     Lxxxx
        ldy     #$FF
        bne     Lxxxx
        rts

        and     ($87),y
        and     $80,x
        .byte   $80
        .byte   $5C
        .byte   $80
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        cpy     $33CC
        .byte   $33
        clc
        .byte   $3C
        ror     $1818,x
        clc
        clc
        clc
        .byte   $3C
        ror     $1818,x
        clc
        clc
        bpl     Lxxxx
        .byte   $7F
        .byte   $7F
        bmi     Lxxxx
        bpl     Lxxxx
        .byte   $7F
        .byte   $7F
        bmi     Lxxxx
        .byte   $0C
        .byte   $12
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $FC
        .byte   $0C
        .byte   $12
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $FC
        .byte   $03
        rol     $3676,x
        rol     $00,x
        .byte   $03
        rol     $3676,x
        rol     $00,x
        .byte   $7F
        .byte   $7F
        .byte   $7F
        .byte   $7F
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
        clc
        clc
        clc
        sed
        sed
        cpy     $3399
        ror     $CC
        sta     Lxxxx,y
        cpy     $3399
        ror     $CC
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
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
        cpy     $33CC
        .byte   $33
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
        clc
        clc
        clc
        .byte   $1F
        .byte   $1F
        sed
        sed
        clc
        clc
        clc
        sed
        sed
        clc
        clc
        clc
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $1F
        .byte   $1F
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
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
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
        sed
        sed
        clc
        clc
        clc
        clc
        clc
        clc
        sed
        sed
        clc
        clc
        clc
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        cpy     #$C0
        bmi     Lxxxx
        cpy     #$C0
        bmi     Lxxxx
        cpy     #$C0
        bmi     Lxxxx
        cpy     #$C0
        bmi     Lxxxx
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
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        beq     Lxxxx
        .byte   $F0
        beq     $E1E3
        beq     $E204
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     Lxxxx
        beq     Lxxxx
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
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
        ror     Lxxxx
        ror     $00
        ror     Lxxxx
        ror     $00
        ror     Lxxxx
        .byte   $FF
        ror     $FF
        ror     Lxxxx
        ror     Lxxxx
        .byte   $FF
        ror     $FF
        ror     Lxxxx
        clc
        rol     $3C60,x
        asl     $7C
        clc
        clc
        rol     $3C60,x
        asl     $7C
        clc
        ror     $0C
        clc
        bmi     Lxxxx
        lsr     $00
        ror     $0C
        clc
        bmi     Lxxxx
        lsr     $00
        .byte   $3C
        ror     $3C
        sec
        .byte   $67
        ror     $3F
        .byte   $3C
        ror     $3C
        sec
        .byte   $67
        ror     $3F
        asl     $0C
        clc
        asl     $0C
        clc
        .byte   $0C
        clc
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $0C
        .byte   $0C
        clc
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $0C
        bmi     Lxxxx
        .byte   $0C
        .byte   $0C
        .byte   $0C
        clc
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $0C
        .byte   $0C
        .byte   $0C
        clc
        bmi     Lxxxx
        ror     $3C
        .byte   $FF
        .byte   $3C
        .byte   $66
        .byte   $66
        .byte   $3C
        .byte   $FF
        .byte   $3C
        ror     $00
        clc
        clc
        .byte   $7E
        clc
        clc
        clc
        clc
        .byte   $7E
        clc
        clc
        clc
        clc
        bmi     Lxxxx
        clc
        clc
        bmi     Lxxxx
        ror     a:$00,x
        ror     a:$00,x
        clc
        clc
        clc
        clc
        .byte   $03
        asl     $0C
        clc
        bmi     Lxxxx
        .byte   $03
        asl     $0C
        clc
        bmi     Lxxxx
        .byte   $3C
        ror     $6E
        ror     Lxxxx,x
        ror     $3C
        .byte   $3C
        ror     $6E
        ror     Lxxxx,x
        ror     $3C
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
        bmi     Lxxxx
        ror     $3C00,x
        ror     $06
        .byte   $0C
        bmi     Lxxxx
        ror     $3C00,x
        ror     $06
        .byte   $1C
        asl     Lxxxx
        .byte   $3C
        .byte   $3C
        ror     $06
        .byte   $1C
        asl     Lxxxx
        .byte   $3C
        asl     $0E
        asl     Lxxxx,x
        asl     $06
        asl     $0E
        asl     Lxxxx,x
        asl     $06
        ror     Lxxxx,x
        asl     $06
        ror     $3C
        ror     Lxxxx,x
        asl     $06
        ror     $3C
        .byte   $3C
        ror     $60
        .byte   $7C
        ror     Lxxxx
        .byte   $3C
        .byte   $3C
        ror     $60
        .byte   $7C
        ror     Lxxxx
        .byte   $3C
        ror     $0C66,x
        clc
        clc
        clc
        clc
        ror     $0C66,x
        clc
        clc
        clc
        clc
        .byte   $3C
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        .byte   $3C
        .byte   $3C
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        .byte   $3C
        .byte   $3C
        ror     Lxxxx
        rol     Lxxxx,x
        .byte   $3C
        .byte   $3C
        ror     Lxxxx
        rol     Lxxxx,x
        .byte   $3C
        clc
        clc
        clc
        clc
        clc
        clc
        clc
        bmi     Lxxxx
        clc
        clc
        clc
        bmi     Lxxxx
        clc
        bmi     Lxxxx
        bmi     Lxxxx
        asl     $0E00
        clc
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $0E
        ror     Lxxxx,x
        ror     Lxxxx,x
        bvs     Lxxxx
        .byte   $0C
        asl     $0C
        clc
        bvs     Lxxxx
        bvs     Lxxxx
        .byte   $0C
        asl     $0C
        clc
        bvs     Lxxxx
        .byte   $3C
        ror     $06
        .byte   $0C
        clc
        clc
        .byte   $3C
        .byte   $66
        asl     $0C
        clc
        clc
        .byte   $3C
        .byte   $66
        ror     Lxxxx
        .byte   $62
        .byte   $3C
        .byte   $3C
        ror     $6E
        ror     Lxxxx
        .byte   $3C
        clc
        .byte   $3C
        ror     $7E
        ror     Lxxxx
        ror     $00
        clc
        .byte   $3C
        ror     $7E
        ror     Lxxxx
        ror     $00
        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        .byte   $3C
        ror     $60
        rts

        rts

        ror     $3C
        .byte   $3C
        ror     $60
        rts

        rts

        ror     $3C
        sei
        jmp     (Lxxxx)

        ror     $6C
        sei
        sei
        jmp     (Lxxxx)

        ror     $6C
        sei
        ror     Lxxxx,x
        sei
        rts

        rts

        ror     Lxxxx,x
        rts

        rts

        sei
        rts

        rts

        ror     Lxxxx,x
        rts

        rts

        sei
        rts

        rts

        rts

        ror     Lxxxx,x
        sei
        rts

        rts

        rts

        .byte   $3C
        ror     $60
        ror     Lxxxx
        .byte   $3C
        .byte   $3C
        ror     $60
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        ror     $7E
        ror     Lxxxx
        ror     $00
        ror     Lxxxx
        ror     $7E
        ror     Lxxxx
        ror     $00
        .byte   $3C
        clc
        clc
        clc
        clc
        clc
        .byte   $3C
        .byte   $3C
        clc
        clc
        clc
        clc
        clc
        .byte   $3C
        asl     $0C0C,x
        .byte   $0C
        .byte   $0C
        jmp     (Lxxxx)

        asl     $0C0C,x
        .byte   $0C
        .byte   $0C
        jmp     (Lxxxx)

        ror     $6C
        sei
        bvs     Lxxxx
        jmp     (Lxxxx)

        ror     $6C
        sei
        bvs     Lxxxx
        jmp     (Lxxxx)

        rts

        rts

        rts

        rts

        rts

        rts

        ror     Lxxxx,x
        rts

        rts

        rts

        rts

        rts

        ror     Lxxxx,x
        .byte   $77
        .byte   $7F
        .byte   $6B
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $77
        .byte   $7F
        .byte   $6B
        .byte   $63
        .byte   $63
        .byte   $63
        ror     $76
        ror     Lxxxx,x
        ror     Lxxxx
        ror     $76
        ror     Lxxxx,x
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        ror     $3C
        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        ror     $3C
        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        rts

        rts

        rts

        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        rts

        rts

        rts

        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        .byte   $3C
        asl     $3C00
        ror     Lxxxx
        ror     Lxxxx
        .byte   $3C
        asl     Lxxxx
        ror     Lxxxx
        .byte   $7C
        sei
        jmp     (Lxxxx)

        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        sei
        jmp     (Lxxxx)

        .byte   $3C
        ror     $60
        .byte   $3C
        .byte   $06
        ror     $3C
        .byte   $3C
        ror     $60
        .byte   $3C
        asl     Lxxxx
        .byte   $3C
        ror     $1818,x
        clc
        clc
        clc
        clc
        ror     $1818,x
        clc
        clc
        clc
        clc
        ror     Lxxxx
        ror     Lxxxx
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        ror     $3C
        clc
        ror     Lxxxx
        ror     Lxxxx
        ror     $3C
        clc
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $6B
        .byte   $7F
        .byte   $77
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $63
        .byte   $6B
        .byte   $7F
        .byte   $77
        .byte   $63
        ror     Lxxxx
        .byte   $3C
        clc
        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        .byte   $3C
        clc
        .byte   $3C
        ror     Lxxxx
        ror     Lxxxx
        ror     $3C
        clc
        clc
        clc
        ror     Lxxxx
        ror     $3C
        clc
        clc
        clc
        ror     $0C06,x
        clc
        bmi     Lxxxx
        ror     Lxxxx,x
        asl     $0C
        clc
        bmi     Lxxxx
        ror     $3C00,x
        bmi     Lxxxx
        bmi     Lxxxx
        bmi     Lxxxx
        .byte   $3C
        bmi     Lxxxx
        bmi     Lxxxx
        bmi     Lxxxx
        rts

        bmi     Lxxxx
        .byte   $0C
        asl     $03
        rts

        bmi     Lxxxx
        .byte   $0C
        asl     $03
        .byte   $3C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $3C
        .byte   $3C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $0C
        .byte   $3C
        clc
        .byte   $3C
        ror     $00
        clc
        .byte   $3C
        ror     $00
        .byte   $7F
        .byte   $7F
        clc
        clc
        clc
        clc
        clc
        clc
        .byte   $3C
        asl     $3E
        ror     $3E
        .byte   $3C
        asl     $3E
        ror     $3E
        rts

        rts

        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        rts

        rts

        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        .byte   $3C
        rts

        rts

        rts

        .byte   $3C
        .byte   $3C
        rts

        rts

        rts

        .byte   $3C
        asl     $06
        rol     Lxxxx,x
        rol     a:$00,x
        asl     $06
        rol     Lxxxx,x
        rol     a:$00,x
        .byte   $3C
        ror     $7E
        rts

        .byte   $3C
        .byte   $3C
        ror     $7E
        rts

        .byte   $3C
        asl     $3E18
        clc
        clc
        clc
        asl     $3E18
        clc
        clc
        clc
        rol     Lxxxx,x
        rol     Lxxxx,x
        rol     Lxxxx,x
        rol     Lxxxx,x
        rts

        rts

        .byte   $7C
        ror     Lxxxx
        ror     $00
        rts

        rts

        .byte   $7C
        ror     Lxxxx
        ror     $00
        clc
        sec
        clc
        clc
        .byte   $3C
        clc
        sec
        clc
        clc
        .byte   $3C
        asl     $00
        asl     $06
        asl     $06
        .byte   $3C
        asl     $00
        asl     $06
        asl     $06
        .byte   $3C
        rts

        rts

        jmp     (Lxxxx)

        ror     $00
        rts

        rts

        jmp     (Lxxxx)

        ror     $00
        sec
        clc
        clc
        clc
        clc
        .byte   $3C
        sec
        clc
        clc
        clc
        clc
        .byte   $3C
        ror     $7F
        .byte   $7F
        .byte   $6B
        .byte   $63
        ror     $7F
        .byte   $7F
        .byte   $6B
        .byte   $63
        .byte   $7C
        ror     Lxxxx
        ror     Lxxxx
        .byte   $7C
        ror     Lxxxx
        ror     Lxxxx
        .byte   $3C
        ror     Lxxxx
        ror     $3C
        .byte   $3C
        ror     Lxxxx
        ror     $3C
        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        rts

        rts

        .byte   $7C
        ror     Lxxxx
        .byte   $7C
        rts

        rts

        rol     Lxxxx,x
        rol     $0606,x
        rol     Lxxxx,x
        rol     $0606,x
        .byte   $7C
        ror     $60
        rts

        rts

        .byte   $7C
        ror     $60
        rts

        rts

        rol     $3C60,x
        asl     $7C
        rol     $3C60,x
        asl     $7C
        clc
        ror     $1818,x
        clc
        asl     a:$00
        clc
        ror     $1818,x
        clc
        asl     a:$00
        ror     Lxxxx
        ror     Lxxxx
        rol     a:$00,x
        ror     Lxxxx
        ror     Lxxxx
        rol     a:$00,x
        ror     Lxxxx
        ror     $3C
        clc
        ror     Lxxxx
        ror     $3C
        clc
        .byte   $63
        .byte   $6B
        .byte   $7F
        rol     a:$36,x
        .byte   $63
        .byte   $6B
        .byte   $7F
        rol     a:$36,x
        .byte   $66
        .byte   $3C
        clc
        .byte   $3C
        ror     $00
        ror     $3C
        clc
        .byte   $3C
        ror     $00
        ror     Lxxxx
        ror     $3E
        .byte   $0C
        sei
        ror     Lxxxx
        ror     $3E
        .byte   $0C
        sei
        ror     $180C,x
        bmi     Lxxxx
        ror     $180C,x
        bmi     Lxxxx
        .byte   $1C
        bmi     Lxxxx
        bvs     Lxxxx
        bmi     Lxxxx
        .byte   $1C
        bmi     Lxxxx
        bvs     Lxxxx
        bmi     Lxxxx
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
        sec
        .byte   $0C
        clc
        .byte   $0E
        clc
        .byte   $0C
        sec
        sec
        .byte   $0C
        clc
        asl     $0C18
        sec
        .byte   $33
        .byte   $FF
        cpy     a:$00
        .byte   $33
        .byte   $FF
        cpy     a:$00
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
        cpy     Lxxxx
        .byte   $E7
        .byte   $C3
        sta     ($E7,x)
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $C3
        sta     ($E7,x)
        .byte   $E7
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
        sbc     Lxxxx
        .byte   $CF
        sta     Lxxxx,x
        .byte   $F3
        sbc     Lxxxx
        .byte   $CF
        sta     Lxxxx,x
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
        sta     Lxxxx,y
        cpy     $3399
        ror     $CC
        sta     Lxxxx,y
        cpy     Lxxxx
        ror     $33
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
        .byte   $33
        sta     Lxxxx,y
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
        cpy     Lxxxx
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $33
        .byte   $33
        cpy     Lxxxx
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
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
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
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
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
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
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
        .byte   $CF
        .byte   $CF
        .byte   $3F
        .byte   $3F
        .byte   $CF
        .byte   $CF
        .byte   $3F
        .byte   $3F
        .byte   $CF
        .byte   $CF
        .byte   $3F
        .byte   $3F
        .byte   $CF
        .byte   $CF
        beq     Lxxxx
        beq     Lxxxx
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        beq     Lxxxx
        beq     Lxxxx
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        beq     Lxxxx
        beq     Lxxxx
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        beq     Lxxxx
        beq     Lxxxx
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
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     Lxxxx
        beq     Lxxxx
        .byte   $0F
        .byte   $0F
        .byte   $0F
        .byte   $0F
        beq     Lxxxx
        beq     Lxxxx
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
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     $99,y
        sta     Lxxxx,y
        sta     Lxxxx,y
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $E7
        cmp     ($9F,x)
        .byte   $C3
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $E7
        cmp     ($9F,x)
        .byte   $C3
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
        .byte   $CF
        sta     Lxxxx,y
        .byte   $FF
        sta     Lxxxx,y
        .byte   $CF
        sta     Lxxxx,y
        .byte   $C3
        sta     Lxxxx,y
        tya
        sta     Lxxxx,y
        .byte   $C3
        sta     Lxxxx,y
        tya
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sbc     Lxxxx,y
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
        sta     Lxxxx,y
        .byte   $FF
        sta     $C3,y
        .byte   $C3
        sta     Lxxxx,y
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
        sbc     Lxxxx,y
        .byte   $CF
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $FC
        sbc     Lxxxx,y
        .byte   $CF
        .byte   $9F
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        .byte   $CF
        .byte   $9F
        sta     ($FF,x)
        .byte   $C3
        sta     Lxxxx,y
        .byte   $CF
        .byte   $9F
        sta     ($FF,x)
        .byte   $C3
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $FF
        sbc     Lxxxx,y
        sta     Lxxxx,y
        sbc     Lxxxx,y
        sbc     ($E1),y
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $9F
        .byte   $83
        sbc     Lxxxx,y
        .byte   $C3
        .byte   $FF
        sta     ($9F,x)
        .byte   $83
        sbc     Lxxxx,y
        .byte   $C3
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sbc     Lxxxx,y
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
        sbc     Lxxxx,y
        .byte   $8F
        .byte   $FF
        .byte   $8F
        .byte   $E7
        .byte   $F3
        sbc     Lxxxx,y
        .byte   $8F
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $E7
        .byte   $FF
        .byte   $E7
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $9F
        sta     Lxxxx,x
        .byte   $C3
        sta     Lxxxx,y
        .byte   $9F
        sta     Lxxxx,x
        .byte   $E7
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $E7
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $83
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $9F
        sta     Lxxxx,y
        .byte   $C3
        sta     Lxxxx,y
        .byte   $9F
        sta     Lxxxx,y
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
        .byte   $93
        .byte   $87
        .byte   $FF
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        sta     Lxxxx,y
        sta     ($99,x)
        sta     Lxxxx,y
        sta     Lxxxx,y
        sta     ($99,x)
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        .byte   $8F
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
        .byte   $93
        .byte   $87
        .byte   $8F
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        sta     ($91,x)
        sta     Lxxxx,y
        sta     Lxxxx,y
        sta     ($91,x)
        sta     Lxxxx,y
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        .byte   $9F
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        sbc     Lxxxx,y
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
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $C3
        .byte   $FF
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $C3
        .byte   $FF
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $E7
        .byte   $FF
        sta     Lxxxx,y
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        .byte   $E7
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $E7
        .byte   $C3
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $C3
        .byte   $E7
        .byte   $E7
        .byte   $E7
        .byte   $FF
        sta     Lxxxx,y
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
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $9F
        .byte   $CF
        .byte   $E7
        .byte   $F3
        sbc     Lxxxx,y
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
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $E7
        .byte   $C3
        sta     Lxxxx,y
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
        sbc     Lxxxx,y
        cmp     ($FF,x)
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sbc     Lxxxx,y
        cmp     ($FF,x)
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     Lxxxx,y
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
        sbc     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        sbc     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        .byte   $83
        .byte   $FF
        .byte   $FF
        cmp     ($99,x)
        sta     Lxxxx,y
        .byte   $83
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $83
        sta     Lxxxx,y
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
        sbc     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $C3
        .byte   $FF
        sbc     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $C3
        .byte   $FF
        .byte   $9F
        .byte   $9F
        .byte   $93
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
        .byte   $9F
        .byte   $9F
        .byte   $93
        .byte   $87
        .byte   $93
        sta     Lxxxx,y
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
        sta     Lxxxx,y
        sty     $9C,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
        sty     $9C,x
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $C3
        sta     Lxxxx,y
        .byte   $C3
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        .byte   $9F
        .byte   $9F
        .byte   $FF
        .byte   $FF
        cmp     ($99,x)
        sta     Lxxxx,y
        sbc     Lxxxx,y
        cmp     ($99,x)
        sta     Lxxxx,y
        sbc     Lxxxx,y
        .byte   $83
        sta     Lxxxx,y
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $FF
        .byte   $83
        sta     Lxxxx,y
        .byte   $9F
        .byte   $FF
        .byte   $FF
        .byte   $FF
        cmp     ($9F,x)
        .byte   $C3
        sbc     Lxxxx,y
        .byte   $FF
        .byte   $FF
        cmp     ($9F,x)
        .byte   $C3
        sbc     Lxxxx,y
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
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
        sta     Lxxxx,y
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
        .byte   $C3
        .byte   $E7
        .byte   $FF
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
        .byte   $C3
        .byte   $E7
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
        sta     Lxxxx,y
        .byte   $C3
        sta     Lxxxx,y
        .byte   $FF
        sta     Lxxxx,y
        .byte   $C3
        sta     Lxxxx,y
        .byte   $FF
        sta     Lxxxx,y
        cmp     ($F3,x)
        .byte   $87
        .byte   $FF
        .byte   $FF
        sta     Lxxxx,y
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
