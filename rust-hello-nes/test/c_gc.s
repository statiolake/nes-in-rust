; da65 V2.18 - Debian 2.19-2
; Created:    2025-12-07 18:29:09
; Input file: /tmp/tmp.uahNfi4wXj
; Page:       1


        .setcpu "6502"

Lxxxx           := $2020
Lxxxx           := $2121
Lxxxx           := $6004
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
        lda     #$48
        jsr     Lxxxx
        jmp     Lxxxx

        jmp     Lxxxx

        ldx     #$00
        lda     #$00
        jmp     Lxxxx

        rts

        lda     $6000
        ldx     $6001
        jsr     Lxxxx
        lda     $6002
        ldx     $6003
        jsr     Lxxxx
        ldy     #$04
        jmp     Lxxxx

        ldy     #$00
        beq     Lxxxx
        lda     #$D6
        ldx     #$82
        jmp     Lxxxx

        rts

        lda     #$D6
        sta     $0A
        lda     #$82
        sta     $0B
        lda     #$00
        sta     $0C
        lda     #$60
        sta     $0D
        ldx     #$D6
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

        jsr     Lxxxx
        sta     $6A
        jsr     Lxxxx
        sta     $69
        tay
        ldx     $6A
        jmp     Lxxxx

        ldy     #$00
        lda     ($02),y
        inc     $02
        beq     Lxxxx
        rts

        inc     $03
        rts

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
        sta     $6029
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
        dec     $6029
        bne     Lxxxx
        stx     $72
        sty     $73
        rts

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
        lda     #$29
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
        cpy     #$01
        beq     Lxxxx
        sta     ($0A),y
        iny
        bne     Lxxxx
        rts

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
        and     a:$1A,x
        sta     $6012
        stx     $6013
        sta     $6019
        stx     $601A
        dey
        lda     Lxxxx,y
        sta     $6023
        dey
        .byte   $B9
        .byte   $FF
        .byte   $FF
        sta     $6022
        sty     $6025
        jsr     Lxxxx
        ldy     #$FF
        bne     Lxxxx
        rts

        and     $80,x
        .byte   $80
        .byte   $5C
        .byte   $80
