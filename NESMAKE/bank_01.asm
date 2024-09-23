 
 
 
              bank_82: db $82                               ;018000|        |      ; NES PRG 4000
 
  orbCollectedRoutine: LDY.B #$00                           ;018001|A000    |      ;
                       JSR.W pointerPointJumper             ;018003|200C89  |01890C;
                       RTS                                  ;018006|60      |      ;
 
 
           orbCollSub: dw orbCollect_00                     ;018007|        |018027;
                       dw orbCollect_01                     ;018009|        |01838A;
                       dw orbCollect_03                     ;01800B|        |018038;
                       dw orbCollect_01                     ;01800D|        |01838A;
                       dw orbCollect_04                     ;01800F|        |018080;
                       dw orbCollect_05                     ;018011|        |018087;
                       dw orbCollect_01                     ;018013|        |01838A;
                       dw orbCollect_07                     ;018015|        |0180C3;
                       dw orbCollect_01                     ;018017|        |01838A;
                       dw orbCollect_09                     ;018019|        |0180EA;
                       dw orbCollect_0a                     ;01801B|        |0180F8;
                       dw orbCollect_01                     ;01801D|        |01838A;
                       dw progressionEventSelecter          ;01801F|        |018116;
                       dw orbCollect_0d                     ;018021|        |018048;
                       dw orbCollect_0e                     ;018023|        |018191;
                       dw orbCollect_0f                     ;018025|        |018277;
 
        orbCollect_00: LDA.B #$00                           ;018027|A900    |      ;
                       STA.W $041A                          ;018029|8D1A04  |01041A;
                       STA.W $041B                          ;01802C|8D1B04  |01041B;
                       LDA.B #$FF                           ;01802F|A9FF    |      ;
 
          CODE_018031: STA.W $07F3                          ;018031|8DF307  |0107F3;
 
          CODE_018034: INC.W $07ED                          ;018034|EEED07  |0107ED;
                       RTS                                  ;018037|60      |      ;
 
 
        orbCollect_03: LDA.B r_stage                        ;018038|A532    |000032;
                       CMP.B #$0E                           ;01803A|C90E    |      ;
                       BNE CODE_018042                      ;01803C|D004    |018042;
                       LDA.B #$D0                           ;01803E|A9D0    |      ;
                       BNE CODE_018031                      ;018040|D0EF    |018031;
 
          CODE_018042: INC.W $07ED                          ;018042|EEED07  |0107ED;
                       JMP.W CODE_018034                    ;018045|4C3480  |018034;
 
 
        orbCollect_0d: LDY.B r_stage                        ;018048|A432    |000032;
                       LDA.W DATA8_018078,Y                 ;01804A|B97880  |018078;
                       STA.B $00                            ;01804D|8500    |000000;
                       LDX.B #$01                           ;01804F|A201    |      ;
 
          CODE_018051: LDA.W $054E,X                        ;018051|BD4E05  |01054E;
                       CMP.B $00                            ;018054|C500    |000000;
                       BEQ CODE_01805B                      ;018056|F003    |01805B;
                       JSR.W CODE_01966F                    ;018058|206F96  |01966F;
 
          CODE_01805B: INX                                  ;01805B|E8      |      ;
                       CPX.B #$0D                           ;01805C|E00D    |      ;
                       BNE CODE_018051                      ;01805E|D0F1    |018051;
                       INC.W $07ED                          ;018060|EEED07  |0107ED;
                       LDA.B #$00                           ;018063|A900    |      ;
                       STA.W $0413                          ;018065|8D1304  |010413;
                       STA.W $0414                          ;018068|8D1404  |010414;
                       STA.W $0415                          ;01806B|8D1504  |010415;
                       STA.W $0416                          ;01806E|8D1604  |010416;
                       STA.W $0418                          ;018071|8D1804  |010418;
                       STA.W $0419                          ;018074|8D1904  |010419;
                       RTS                                  ;018077|60      |      ;
 
 
         DATA8_018078: db $00,$03,$02,$00,$00               ;018078|        |      ;
                       db $00,$00,$05                       ;01807D|        |      ;
 
        orbCollect_04: LDA.B #$10                           ;018080|A910    |      ;
                       STA.W $07F3                          ;018082|8DF307  |0107F3;
                       BNE CODE_0180A6                      ;018085|D01F    |0180A6;
 
        orbCollect_05: LDA.B r_lvlTimerLo                   ;018087|A57E    |00007E;
                       ORA.B r_lvlTimerHi                   ;018089|057F    |00007F;
                       BEQ CODE_01809D                      ;01808B|F010    |01809D;
                       db $20                               ;01808D|        |      ;
                       dw UNREACH_0FE656                    ;01808E|        |0FE656;
                       JMP.W CODE_0180AA                    ;018090|4CAA80  |0180AA;
 
 
          CODE_018093: LDA.B #$02                           ;018093|A902    |      ;
                       STA.W $07F3                          ;018095|8DF307  |0107F3;
                       RTS                                  ;018098|60      |      ;
 
 
          CODE_018099: DEC.W $07F3                          ;018099|CEF307  |0107F3;
                       RTS                                  ;01809C|60      |      ;
 
 
          CODE_01809D: LDA.B #$12                           ;01809D|A912    |      ;
                       BNE CODE_0180A3                      ;01809F|D002    |0180A3;
 
          CODE_0180A1: LDA.B #$40                           ;0180A1|A940    |      ;
 
          CODE_0180A3: STA.W $07F3                          ;0180A3|8DF307  |0107F3;
 
          CODE_0180A6: INC.W $07ED                          ;0180A6|EEED07  |0107ED;
                       RTS                                  ;0180A9|60      |      ;
 
 
          CODE_0180AA: LDA.B #$10                           ;0180AA|A910    |      ;
                       STA.B $00                            ;0180AC|8500    |000000;
                       LDA.W $07F3                          ;0180AE|ADF307  |0107F3;
                       BNE CODE_0180BD                      ;0180B1|D00A    |0180BD;
                       LDA.B #$08                           ;0180B3|A908    |      ;
                       STA.W $07F3                          ;0180B5|8DF307  |0107F3;
                       LDA.B #$19                           ;0180B8|A919    |      ;
                       JMP.W DATA8_0183BE                   ;0180BA|4CBE83  |0183BE;
 
 
          CODE_0180BD: DEC.W $07F3                          ;0180BD|CEF307  |0107F3;
                       JMP.W CODE_0183C1                    ;0180C0|4CC183  |0183C1;
 
 
        orbCollect_07: LDA.W $07F3                          ;0180C3|ADF307  |0107F3;
                       BNE CODE_018099                      ;0180C6|D0D1    |018099;
                       LDA.B r_hearts                       ;0180C8|A584    |000084;
                       BEQ CODE_0180A1                      ;0180CA|F0D5    |0180A1;
                       DEC.B r_hearts                       ;0180CC|C684    |000084;
                       LDA.B r_hearts                       ;0180CE|A584    |000084;
                       AND.B #$0F                           ;0180D0|290F    |      ;
                       CMP.B #$0A                           ;0180D2|C90A    |      ;
                       BCC CODE_0180DE                      ;0180D4|9008    |0180DE;
                       LDA.B r_hearts                       ;0180D6|A584    |000084;
                       AND.B #$F0                           ;0180D8|29F0    |      ;
                       ORA.B #$09                           ;0180DA|0909    |      ;
                       STA.B r_hearts                       ;0180DC|8584    |000084;
 
          CODE_0180DE: JSR.W CODE_018093                    ;0180DE|209380  |018093;
                       LDA.B #$20                           ;0180E1|A920    |      ;
                       STA.B $00                            ;0180E3|8500    |000000;
                       LDA.B #$1A                           ;0180E5|A91A    |      ;
                       JMP.W DATA8_0183BE                   ;0180E7|4CBE83  |0183BE;
 
 
        orbCollect_09: LDA.B r_HUD_healthPlayer             ;0180EA|A53C    |00003C;
                       CMP.B #$40                           ;0180EC|C940    |      ;
                       BEQ CODE_0180F5                      ;0180EE|F005    |0180F5;
                       LDA.B #$2C                           ;0180F0|A92C    |      ;
                       db $20                               ;0180F2|        |      ;
                       dw CODE_0FE25F                       ;0180F3|        |0FE25F;
 
          CODE_0180F5: JMP.W CODE_0180A6                    ;0180F5|4CA680  |0180A6;
 
 
        orbCollect_0a: LDA.W $07F3                          ;0180F8|ADF307  |0107F3;
                       BNE CODE_018099                      ;0180FB|D09C    |018099;
                       LDA.B r_HUD_healthPlayer             ;0180FD|A53C    |00003C;
                       CLC                                  ;0180FF|18      |      ;
                       ADC.B #$04                           ;018100|6904    |      ;
                       CMP.B #$40                           ;018102|C940    |      ;
                       BCS CODE_01810F                      ;018104|B009    |01810F;
                       STA.B r_HUD_healthPlayer             ;018106|853C    |00003C;
                       LDA.B #$00                           ;018108|A900    |      ;
                       STA.B $00                            ;01810A|8500    |000000;
                       JMP.W CODE_0183C1                    ;01810C|4CC183  |0183C1;
 
 
          CODE_01810F: LDA.B #$40                           ;01810F|A940    |      ;
                       STA.B r_HUD_healthPlayer             ;018111|853C    |00003C;
                       JMP.W CODE_0180A1                    ;018113|4CA180  |0180A1;
 
 
progressionEventSelecter: LDA.B r_stage                        ;018116|A532    |000032;
                       CMP.B #$01                           ;018118|C901    |      ;
                       BNE CODE_01811E                      ;01811A|D002    |01811E;
                       STA.B r_GrantDefeated                ;01811C|852F    |00002F;
 
          CODE_01811E: LDY.B r_stage                        ;01811E|A432    |000032;
                       LDA.W DATA8_018171,Y                 ;018120|B97181  |018171;
                       BEQ CODE_01815F                      ;018123|F03A    |01815F;
                       CMP.B #$02                           ;018125|C902    |      ;
                       BEQ CODE_01814C                      ;018127|F023    |01814C;
                       CPY.B #$01                           ;018129|C001    |      ;
                       BNE CODE_018133                      ;01812B|D006    |018133;
                       LDA.B r_blockLevel                   ;01812D|A533    |000033;
                       CMP.B #$05                           ;01812F|C905    |      ;
                       BEQ CODE_018168                      ;018131|F035    |018168;
 
          CODE_018133: LDA.W $07F6                          ;018133|ADF607  |0107F6;
                       BNE CODE_01815F                      ;018136|D027    |01815F;
                       db $20                               ;018138|        |      ;
                       dw UNREACH_0FE593                    ;018139|        |0FE593;
                       BCS CODE_01815F                      ;01813B|B022    |01815F;
                       LDY.B r_stage                        ;01813D|A432    |000032;
                       CPY.B #$07                           ;01813F|C007    |      ;
                       BNE CODE_018149                      ;018141|D006    |018149;
                       LDA.B r_blockLevel                   ;018143|A533    |000033;
                       CMP.B #$06                           ;018145|C906    |      ;
                       BEQ CODE_01815F                      ;018147|F016    |01815F;
 
          CODE_018149: JMP.W CODE_0180A6                    ;018149|4CA680  |0180A6;
 
 
          CODE_01814C: LDA.B r_stage                        ;01814C|A532    |000032;
                       CMP.B #$0E                           ;01814E|C90E    |      ;
                       BNE CODE_018156                      ;018150|D004    |018156;
                       LDA.B #$0C                           ;018152|A90C    |      ; initiate ending sequance
                       BNE CODE_018158                      ;018154|D002    |018158;
 
          CODE_018156: LDA.B #$08                           ;018156|A908    |      ; initiate map sequance
 
          CODE_018158: STA.B r_gameState                    ;018158|8518    |000018;
                       LDA.B #$00                           ;01815A|A900    |      ;
                       STA.B r_gameSubstate                 ;01815C|8519    |000019;
                       RTS                                  ;01815E|60      |      ;
 
 
          CODE_01815F: LDA.B #$1E                           ;01815F|A91E    |      ;
                       STA.B r_gameLoadState                ;018161|852A    |00002A;
                       LDA.B #$00                           ;018163|A900    |      ;
                       STA.B r_menuSelectIdx                ;018165|856B    |00006B;
                       RTS                                  ;018167|60      |      ;
 
 
          CODE_018168: LDA.B #$18                           ;018168|A918    |      ;
                       STA.B r_gameLoadState                ;01816A|852A    |00002A;
                       LDA.B #$02                           ;01816C|A902    |      ;
                       STA.B r_menuSelectIdx                ;01816E|856B    |00006B;
                       RTS                                  ;018170|60      |      ;
 
 
         DATA8_018171: db $02,$01,$01,$00,$00               ;018171|        |      ;
                       db $00,$00,$01,$00,$00               ;018176|        |      ;
                       db $00,$00,$00,$00,$02               ;01817B|        |      ;
                       db $00,$00,$00,$00,$00               ;018180|        |      ;
                       db $00,$00,$00,$00,$00               ;018185|        |      ;
                       db $00,$00,$00,$00,$00               ;01818A|        |      ;
                       db $00,$00                           ;01818F|        |      ;
 
        orbCollect_0e: LDA.B #$04                           ;018191|A904    |      ;
                       STA.B $00                            ;018193|8500    |000000;
                       LDA.B #$00                           ;018195|A900    |      ;
                       STA.B $01                            ;018197|8501    |000001;
                       LDX.B #$01                           ;018199|A201    |      ;
 
          CODE_01819B: LDA.W $054E,X                        ;01819B|BD4E05  |01054E;
                       BEQ CODE_0181BA                      ;01819E|F01A    |0181BA;
                       LDY.B r_stage                        ;0181A0|A432    |000032;
                       CPY.B #$02                           ;0181A2|C002    |      ;
                       BNE CODE_0181AC                      ;0181A4|D006    |0181AC;
                       JSR.W CODE_01966F                    ;0181A6|206F96  |01966F;
                       JMP.W CODE_018263                    ;0181A9|4C6382  |018263;
 
 
          CODE_0181AC: LDA.W DATA8_01826F,Y                 ;0181AC|B96F82  |01826F;
                       STA.W $054E,X                        ;0181AF|9D4E05  |01054E;
                       LDA.B #$03                           ;0181B2|A903    |      ;
                       STA.W $0606,X                        ;0181B4|9D0606  |010606;
                       JMP.W CODE_018263                    ;0181B7|4C6382  |018263;
 
 
          CODE_0181BA: LDA.B $00                            ;0181BA|A500    |000000;
                       CMP.B #$01                           ;0181BC|C901    |      ;
                       BNE CODE_0181C3                      ;0181BE|D003    |0181C3;
                       JMP.W CODE_018245                    ;0181C0|4C4582  |018245;
 
 
          CODE_0181C3: LDA.B $01                            ;0181C3|A501    |000001;
                       BNE CODE_01820D                      ;0181C5|D046    |01820D;
                       LDA.W $054E                          ;0181C7|AD4E05  |01054E;
                       BEQ CODE_0181D0                      ;0181CA|F004    |0181D0;
                       LDA.B #$02                           ;0181CC|A902    |      ;
                       BNE CODE_0181D2                      ;0181CE|D002    |0181D2;
 
          CODE_0181D0: LDA.B #$01                           ;0181D0|A901    |      ;
 
          CODE_0181D2: STA.W $0606,X                        ;0181D2|9D0606  |010606;
                       LDY.W $054E                          ;0181D5|AC4E05  |01054E;
                       INY                                  ;0181D8|C8      |      ;
                       TYA                                  ;0181D9|98      |      ;
                       STA.W $054E,X                        ;0181DA|9D4E05  |01054E;
                       LDA.W $0400                          ;0181DD|AD0004  |010400;
                       STA.W $0400,X                        ;0181E0|9D0004  |010400;
                       LDA.W $048C                          ;0181E3|AD8C04  |01048C;
                       STA.W $048C,X                        ;0181E6|9D8C04  |01048C;
                       LDA.W $04A8                          ;0181E9|ADA804  |0104A8;
                       STA.W $04A8,X                        ;0181EC|9DA804  |0104A8;
                       LDA.B #$40                           ;0181EF|A940    |      ;
                       STA.W $0470,X                        ;0181F1|9D7004  |010470;
                       LDA.W $0438                          ;0181F4|AD3804  |010438;
                       STA.W $0438,X                        ;0181F7|9D3804  |010438;
                       LDA.W $041C                          ;0181FA|AD1C04  |01041C;
                       STA.W $041C,X                        ;0181FD|9D1C04  |01041C;
                       LDA.W $0470                          ;018200|AD7004  |010470;
                       ORA.B #$80                           ;018203|0980    |      ;
                       STA.W $0470                          ;018205|8D7004  |010470;
                       INC.B $01                            ;018208|E601    |000001;
                       JMP.W CODE_018263                    ;01820A|4C6382  |018263;
 
 
          CODE_01820D: LDY.B r_partner                      ;01820D|A43A    |00003A;
                       CPY.B #$FF                           ;01820F|C0FF    |      ;
                       BEQ CODE_018263                      ;018211|F050    |018263;
                       LDA.W $054E                          ;018213|AD4E05  |01054E;
                       BNE CODE_01821C                      ;018216|D004    |01821C;
                       LDA.B #$02                           ;018218|A902    |      ;
                       BNE CODE_01821E                      ;01821A|D002    |01821E;
 
          CODE_01821C: LDA.B #$01                           ;01821C|A901    |      ;
 
          CODE_01821E: STA.W $0606,X                        ;01821E|9D0606  |010606;
                       LDY.W $054E                          ;018221|AC4E05  |01054E;
                       BNE CODE_01822A                      ;018224|D004    |01822A;
                       LDY.B r_partner                      ;018226|A43A    |00003A;
                       BNE CODE_01822C                      ;018228|D002    |01822C;
 
          CODE_01822A: LDY.B r_039                          ;01822A|A439    |000039;
 
          CODE_01822C: LDA.W DATA8_018286,Y                 ;01822C|B98682  |018286;
                       STA.W $0400,X                        ;01822F|9D0004  |010400;
                       LDA.W DATA8_01828A,Y                 ;018232|B98A82  |01828A;
                       STA.W $048C,X                        ;018235|9D8C04  |01048C;
                       INY                                  ;018238|C8      |      ;
                       TYA                                  ;018239|98      |      ;
                       STA.W $054E,X                        ;01823A|9D4E05  |01054E;
                       LDA.B #$80                           ;01823D|A980    |      ;
                       STA.W $0470,X                        ;01823F|9D7004  |010470;
                       JMP.W CODE_018263                    ;018242|4C6382  |018263;
 
 
          CODE_018245: LDA.B r_stage                        ;018245|A532    |000032;
                       CMP.B #$02                           ;018247|C902    |      ;
                       BNE CODE_018263                      ;018249|D018    |018263;
                       LDA.B #$06                           ;01824B|A906    |      ;
                       STA.W $054E,X                        ;01824D|9D4E05  |01054E;
                       LDA.B #$80                           ;018250|A980    |      ;
                       STA.W $0470,X                        ;018252|9D7004  |010470;
                       LDA.B #$00                           ;018255|A900    |      ;
                       STA.W $0400,X                        ;018257|9D0004  |010400;
                       STA.W $048C,X                        ;01825A|9D8C04  |01048C;
                       STA.W $0606,X                        ;01825D|9D0606  |010606;
                       STA.W $061D,X                        ;018260|9D1D06  |01061D;
 
          CODE_018263: INX                                  ;018263|E8      |      ;
                       DEC.B $00                            ;018264|C600    |000000;
                       BEQ CODE_01826B                      ;018266|F003    |01826B;
                       JMP.W CODE_01819B                    ;018268|4C9B81  |01819B;
 
 
          CODE_01826B: INC.W $07ED                          ;01826B|EEED07  |0107ED;
                       RTS                                  ;01826E|60      |      ;
 
 
         DATA8_01826F: db $00,$03,$02,$00,$00               ;01826F|        |      ;
                       db $00,$00,$04                       ;018274|        |      ;
 
        orbCollect_0f: LDA.B #$00                           ;018277|A900    |      ;
                       STA.W $07ED                          ;018279|8DED07  |0107ED;
                       STA.W $07F3                          ;01827C|8DF307  |0107F3;
                       INC.W $07EC                          ;01827F|EEEC07  |0107EC;
                       db $20                               ;018282|        |      ;
                       dw setBank_c000_1E                   ;018283|        |0FE2DA;
                       RTS                                  ;018285|60      |      ;
 
 
         DATA8_018286: db $02,$02,$02,$02                   ;018286|        |      ;
 
         DATA8_01828A: db $00,$02,$04,$06                   ;01828A|        |      ;
                       LDY.B #$02                           ;01828E|A002    |      ;
                       JSR.W pointerPointJumper             ;018290|200C89  |01890C;
                       RTS                                  ;018293|60      |      ;
 
 
        orbFriends_01: dw CODE_0182A0                       ;018294|        |0182A0;
                       dw CODE_0182B0                       ;018296|        |0182B0;
                       dw CODE_0182CC                       ;018298|        |0182CC;
                       dw CODE_01835B                       ;01829A|        |01835B;
                       dw orbCollect_01                     ;01829C|        |01838A;
                       dw CODE_018393                       ;01829E|        |018393;
 
          CODE_0182A0: LDA.B r_stage                        ;0182A0|A532    |000032;
                       CMP.B #$02                           ;0182A2|C902    |      ;
                       BNE CODE_0182A7                      ;0182A4|D001    |0182A7;
                       RTS                                  ;0182A6|60      |      ;
 
 
          CODE_0182A7: INC.W $07ED                          ;0182A7|EEED07  |0107ED;
                       LDA.B #$00                           ;0182AA|A900    |      ;
                       STA.W $07F0                          ;0182AC|8DF007  |0107F0;
                       RTS                                  ;0182AF|60      |      ;
 
 
          CODE_0182B0: LDY.B r_stage                        ;0182B0|A432    |000032;
                       LDA.W DATA8_0182BB,Y                 ;0182B2|B9BB82  |0182BB;
                       STA.W $07EF                          ;0182B5|8DEF07  |0107EF;
                       JMP.W CODE_0182C3                    ;0182B8|4CC382  |0182C3;
 
 
         DATA8_0182BB: db $00,$01,$02,$00,$00               ;0182BB|        |      ;
                       db $00,$00,$03                       ;0182C0|        |      ;
 
          CODE_0182C3: LDA.B #$01                           ;0182C3|A901    |      ;
                       STA.B $B5                            ;0182C5|85B5    |0000B5;
                       LDA.B #$00                           ;0182C7|A900    |      ;
                       STA.B $B4                            ;0182C9|85B4    |0000B4;
                       RTS                                  ;0182CB|60      |      ;
 
 
          CODE_0182CC: LDA.B $B4                            ;0182CC|A5B4    |0000B4;
                       CMP.B #$FF                           ;0182CE|C9FF    |      ;
                       BEQ CODE_01830A                      ;0182D0|F038    |01830A;
                       LDA.B r_sceneDrawQueue               ;0182D2|A51D    |00001D;
                       PHA                                  ;0182D4|48      |      ;
                       JSR.W CODE_01831E                    ;0182D5|201E83  |01831E;
                       LDA.W $07EC                          ;0182D8|ADEC07  |0107EC;
                       CMP.B #$02                           ;0182DB|C902    |      ;
                       BCS CODE_0182F3                      ;0182DD|B014    |0182F3;
                       PLA                                  ;0182DF|68      |      ;
                       STA.B r_15                           ;0182E0|8515    |000015;
                       LDY.B #$00                           ;0182E2|A000    |      ;
 
          CODE_0182E4: LDA.W PTR16_01831A,Y                 ;0182E4|B91A83  |01831A;
                       STA.B $00                            ;0182E7|8500    |000000;
                       LDA.W PTR16_01831B,Y                 ;0182E9|B91B83  |01831B;
                       STA.B $01                            ;0182EC|8501    |000001;
                       LDA.B #$80                           ;0182EE|A980    |      ;
                       db $4C                               ;0182F0|        |      ;
 
                       dw titleScreenThunderMain            ;0182F1|        |0FE62F;
 
          CODE_0182F3: PLA                                  ;0182F3|68      |      ;
                       STA.B r_15                           ;0182F4|8515    |000015;
                       PHA                                  ;0182F6|48      |      ;
                       LDY.B #$02                           ;0182F7|A002    |      ;
                       JSR.W CODE_0182E4                    ;0182F9|20E482  |0182E4;
                       PLA                                  ;0182FC|68      |      ;
                       STA.B r_15                           ;0182FD|8515    |000015;
                       LDA.B $B4                            ;0182FF|A5B4    |0000B4;
                       CMP.B #$05                           ;018301|C905    |      ;
                       BNE CODE_018309                      ;018303|D004    |018309;
                       LDA.B #$FF                           ;018305|A9FF    |      ;
                       STA.B $B4                            ;018307|85B4    |0000B4;
 
          CODE_018309: RTS                                  ;018309|60      |      ;
 
 
          CODE_01830A: LDA.B #$B0                           ;01830A|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;01830C|85FF    |0000FF;
                       INC.W $07ED                          ;01830E|EEED07  |0107ED;
                       LDA.B #$00                           ;018311|A900    |      ;
                       STA.W $07F1                          ;018313|8DF107  |0107F1;
                       STA.W $07F2                          ;018316|8DF207  |0107F2;
                       RTS                                  ;018319|60      |      ;
 
 
         PTR16_01831A: dw DATA8_018B74                      ;01831A|        |018B74;
                       dw DATA8_018B70                      ;01831C|        |018B70;
 
          CODE_01831E: LDY.B #$00                           ;01831E|A000    |      ;
                       LDA.W PTR16_018332,Y                 ;018320|B93283  |018332;
                       STA.B $00                            ;018323|8500    |000000;
                       LDA.W PTR16_018333,Y                 ;018325|B93383  |018333;
                       STA.B $01                            ;018328|8501    |000001;
                       LDA.B #$80                           ;01832A|A980    |      ;
                       db $20                               ;01832C|        |      ;
                       dw titleScreenThunderMain            ;01832D|        |0FE62F;
                       JMP.W CODE_018334                    ;01832F|4C3483  |018334;
 
 
         PTR16_018332: dw DATA8_01852C                      ;018332|        |01852C;
 
          CODE_018334: LDA.B r_sceneDrawQueue               ;018334|A51D    |00001D;
                       SEC                                  ;018336|38      |      ;
                       SBC.B #$19                           ;018337|E919    |      ;
                       TAX                                  ;018339|AA      |      ;
                       LDY.B #$00                           ;01833A|A000    |      ;
                       LDA.W UNREACH_019D69,Y               ;01833C|B9699D  |019D69;
                       STA.B $00                            ;01833F|8500    |000000;
                       LDA.W UNREACH_019D6A,Y               ;018341|B96A9D  |019D6A;
                       STA.B $01                            ;018344|8501    |000001;
                       LDY.B #$02                           ;018346|A002    |      ;
 
          CODE_018348: LDA.B ($00),Y                        ;018348|B100    |000000;
                       JSR.W CODE_018356                    ;01834A|205683  |018356;
                       CMP.B #$FF                           ;01834D|C9FF    |      ;
                       BEQ CODE_018355                      ;01834F|F004    |018355;
                       INY                                  ;018351|C8      |      ;
                       JMP.W CODE_018348                    ;018352|4C4883  |018348;
 
 
          CODE_018355: RTS                                  ;018355|60      |      ;
 
 
          CODE_018356: STA.W $0300,X                        ;018356|9D0003  |010300;
                       INX                                  ;018359|E8      |      ;
                       RTS                                  ;01835A|60      |      ;
 
 
          CODE_01835B: LDA.B #$04                           ;01835B|A904    |      ;
                       STA.W $07EF                          ;01835D|8DEF07  |0107EF;
                       LDA.B #$00                           ;018360|A900    |      ;
                       STA.B $00                            ;018362|8500    |000000;
                       LDX.B #$01                           ;018364|A201    |      ;
 
          CODE_018366: LDA.W $054E,X                        ;018366|BD4E05  |01054E;
                       BEQ CODE_01836D                      ;018369|F002    |01836D;
                       INC.B $00                            ;01836B|E600    |000000;
 
          CODE_01836D: INX                                  ;01836D|E8      |      ;
                       CPX.B #$0D                           ;01836E|E00D    |      ;
                       BNE CODE_018366                      ;018370|D0F4    |018366;
                       LDA.W $07F0                          ;018372|ADF007  |0107F0;
                       CMP.B $00                            ;018375|C500    |000000;
                       BCC CODE_018389                      ;018377|9010    |018389;
                       INC.W $07ED                          ;018379|EEED07  |0107ED;
                       LDA.B #$00                           ;01837C|A900    |      ;
                       STA.W $07EF                          ;01837E|8DEF07  |0107EF;
                       STA.W $07F0                          ;018381|8DF007  |0107F0;
                       LDA.B #$01                           ;018384|A901    |      ;
                       STA.W $07F3                          ;018386|8DF307  |0107F3;
 
          CODE_018389: RTS                                  ;018389|60      |      ;
 
 
        orbCollect_01: DEC.W $07F3                          ;01838A|CEF307  |0107F3;
                       BNE CODE_018392                      ;01838D|D003    |018392;
                       INC.W $07ED                          ;01838F|EEED07  |0107ED;
 
          CODE_018392: RTS                                  ;018392|60      |      ;
 
 
          CODE_018393: LDA.B #$1D                           ;018393|A91D    |      ;
                       STA.B r_CHR_BankSpr_0c00             ;018395|8549    |000049;
                       db $20                               ;018397|        |      ;
                       dw CODE_0FE33C                       ;018398|        |0FE33C;
                       LDA.B #$41                           ;01839A|A941    |      ;
                       STA.B r_CHR_BankBG_0000              ;01839C|854A    |00004A;
                       LDA.B #$6F                           ;01839E|A96F    |      ;
                       STA.B r_CHR_BankBG_0c00              ;0183A0|854D    |00004D;
                       db $20                               ;0183A2|        |      ;
                       dw CODE_0FE35D                       ;0183A3|        |0FE35D;
                       JSR.W UNREACH_019181                 ;0183A5|208191  |019181;
                       LDA.B #$00                           ;0183A8|A900    |      ;
                       STA.W $07ED                          ;0183AA|8DED07  |0107ED;
                       INC.W $07EC                          ;0183AD|EEEC07  |0107EC;
                       LDA.B #$00                           ;0183B0|A900    |      ;
                       STA.B r_HUD_CHR_overwrite            ;0183B2|8572    |000072;
                       LDA.B #$80                           ;0183B4|A980    |      ;
                       STA.B r_IRQFuncIdx                   ;0183B6|853F    |00003F;
                       LDA.B #$6B                           ;0183B8|A96B    |      ;
                       db $20                               ;0183BA|        |      ;
                       dw CODE_0FE25F                       ;0183BB|        |0FE25F;
                       RTS                                  ;0183BD|60      |      ;
 
 
         DATA8_0183BE: db $20                               ;0183BE|        |      ;
                       dw CODE_0FE25F                       ;0183BF|        |0FE25F;
 
          CODE_0183C1: LDA.B $00                            ;0183C1|A500    |000000;
                       STA.B $01                            ;0183C3|8501    |000001;
                       LDA.B #$00                           ;0183C5|A900    |      ;
                       STA.B $02                            ;0183C7|8502    |000002;
                       STA.B $03                            ;0183C9|8503    |000003;
                       db $20                               ;0183CB|        |      ;
                       dw UNREACH_0FE777                    ;0183CC|        |0FE777;
                       RTS                                  ;0183CE|60      |      ;
 
                       LDY.B #$04                           ;0183CF|A004    |      ;
                       JSR.W pointerPointJumper             ;0183D1|200C89  |01890C;
                       RTS                                  ;0183D4|60      |      ;
 
 
        orbFriends_02: dw CODE_0183DD                       ;0183D5|        |0183DD;
                       dw CODE_0183FD                       ;0183D7|        |0183FD;
                       dw CODE_01844A                       ;0183D9|        |01844A;
                       dw CODE_01844D                       ;0183DB|        |01844D;
 
          CODE_0183DD: JSR.W CODE_018931                    ;0183DD|203189  |018931;
                       LDA.B #$0B                           ;0183E0|A90B    |      ;
                       STA.B $00                            ;0183E2|8500    |000000;
                       LDX.B #$01                           ;0183E4|A201    |      ;
 
          CODE_0183E6: LDA.W $0606,X                        ;0183E6|BD0606  |010606;
                       CMP.B #$01                           ;0183E9|C901    |      ;
                       BNE CODE_0183F4                      ;0183EB|D007    |0183F4;
                       TXA                                  ;0183ED|8A      |      ;
                       STA.W $07F1                          ;0183EE|8DF107  |0107F1;
                       JMP.W CODE_0183F9                    ;0183F1|4CF983  |0183F9;
 
 
          CODE_0183F4: INX                                  ;0183F4|E8      |      ;
                       DEC.B $00                            ;0183F5|C600    |000000;
                       BNE CODE_0183E6                      ;0183F7|D0ED    |0183E6;
 
          CODE_0183F9: INC.W $07ED                          ;0183F9|EEED07  |0107ED;
                       RTS                                  ;0183FC|60      |      ;
 
 
          CODE_0183FD: LDA.B #$0B                           ;0183FD|A90B    |      ;
                       STA.B $00                            ;0183FF|8500    |000000;
                       LDX.B #$01                           ;018401|A201    |      ;
 
          CODE_018403: LDA.W $0606,X                        ;018403|BD0606  |010606;
                       CMP.B #$02                           ;018406|C902    |      ;
                       BNE CODE_018435                      ;018408|D02B    |018435;
                       STX.B $01                            ;01840A|8601    |000001;
                       LDY.W $07F1                          ;01840C|ACF107  |0107F1;
                       LDA.W $054E                          ;01840F|AD4E05  |01054E;
                       BEQ CODE_018419                      ;018412|F005    |018419;
                       TXA                                  ;018414|8A      |      ;
                       TAY                                  ;018415|A8      |      ;
                       LDX.W $07F1                          ;018416|AEF107  |0107F1;
 
          CODE_018419: LDA.W $041C,Y                        ;018419|B91C04  |01041C;
                       STA.W $041C,X                        ;01841C|9D1C04  |01041C;
                       LDA.W $0438,Y                        ;01841F|B93804  |010438;
                       CLC                                  ;018422|18      |      ;
                       ADC.B #$10                           ;018423|6910    |      ;
                       STA.W $0438,X                        ;018425|9D3804  |010438;
                       LDA.W $0470,X                        ;018428|BD7004  |010470;
                       AND.B #$7F                           ;01842B|297F    |      ;
                       STA.W $0470,X                        ;01842D|9D7004  |010470;
                       LDX.B $01                            ;018430|A601    |000001;
                       JMP.W CODE_01843A                    ;018432|4C3A84  |01843A;
 
 
          CODE_018435: INX                                  ;018435|E8      |      ;
                       DEC.B $00                            ;018436|C600    |000000;
                       BNE CODE_018403                      ;018438|D0C9    |018403;
 
          CODE_01843A: INC.W $07ED                          ;01843A|EEED07  |0107ED;
                       LDA.B #$00                           ;01843D|A900    |      ;
                       STA.W $07F3                          ;01843F|8DF307  |0107F3;
                       LDA.B #$06                           ;018442|A906    |      ;
                       STA.W $07EF                          ;018444|8DEF07  |0107EF;
                       JMP.W CODE_0182C3                    ;018447|4CC382  |0182C3;
 
 
          CODE_01844A: JMP.W CODE_0182CC                    ;01844A|4CCC82  |0182CC;
 
 
          CODE_01844D: LDA.W $07EF                          ;01844D|ADEF07  |0107EF;
                       BNE CODE_01845D                      ;018450|D00B    |01845D;
                       INC.W $07EC                          ;018452|EEEC07  |0107EC;
                       LDA.B #$00                           ;018455|A900    |      ;
                       STA.W $07ED                          ;018457|8DED07  |0107ED;
                       STA.W $07F3                          ;01845A|8DF307  |0107F3;
 
          CODE_01845D: RTS                                  ;01845D|60      |      ;
 
                       LDY.B #$06                           ;01845E|A006    |      ;
                       JSR.W pointerPointJumper             ;018460|200C89  |01890C;
                       RTS                                  ;018463|60      |      ;
 
 
        orbFriends_03: dw CODE_0184B2                       ;018464|        |0184B2;
                       dw CODE_0184C6                       ;018466|        |0184C6;
                       dw DATA8_018531                      ;018468|        |018531;
                       dw UNREACH_018591                    ;01846A|        |018591;
                       dw UNREACH_0185F1                    ;01846C|        |0185F1;
                       dw UNREACH_018609                    ;01846E|        |018609;
                       dw DATA8_018531                      ;018470|        |018531;
                       dw DATA8_01854D                      ;018472|        |01854D;
                       dw UNREACH_0185F1                    ;018474|        |0185F1;
                       dw UNREACH_018609                    ;018476|        |018609;
                       dw DATA8_018531                      ;018478|        |018531;
                       dw DATA8_018556                      ;01847A|        |018556;
                       dw UNREACH_01866A                    ;01847C|        |01866A;
                       dw UNREACH_018676                    ;01847E|        |018676;
                       dw UNREACH_0186E4                    ;018480|        |0186E4;
                       dw UNREACH_018609                    ;018482|        |018609;
                       dw DATA8_018531                      ;018484|        |018531;
                       dw UNREACH_018578                    ;018486|        |018578;
                       dw UNREACH_0185F1                    ;018488|        |0185F1;
                       dw UNREACH_018609                    ;01848A|        |018609;
                       dw UNREACH_01870E                    ;01848C|        |01870E;
                       dw UNREACH_01873E                    ;01848E|        |01873E;
                       dw UNREACH_01875A                    ;018490|        |01875A;
                       dw UNREACH_018774                    ;018492|        |018774;
                       dw UNREACH_0187AE                    ;018494|        |0187AE;
                       dw DATA8_018514                      ;018496|        |018514;
                       dw DATA8_01855F                      ;018498|        |01855F;
                       dw UNREACH_0185F1                    ;01849A|        |0185F1;
                       dw UNREACH_018609                    ;01849C|        |018609;
                       dw UNREACH_0187F5                    ;01849E|        |0187F5;
                       dw UNREACH_018814                    ;0184A0|        |018814;
                       dw UNREACH_01881D                    ;0184A2|        |01881D;
                       dw UNREACH_018836                    ;0184A4|        |018836;
                       dw UNREACH_018872                    ;0184A6|        |018872;
                       dw UNREACH_01889B                    ;0184A8|        |01889B;
                       dw UNREACH_0188DC                    ;0184AA|        |0188DC;
 
                       dw UNREACH_0188E0                    ;0184AC|        |0188E0;
                       dw UNREACH_0185F1                    ;0184AE|        |0185F1;
                       dw UNREACH_0188ED                    ;0184B0|        |0188ED;
 
          CODE_0184B2: INC.W $07ED                          ;0184B2|EEED07  |0107ED;
                       LDA.B #$07                           ;0184B5|A907    |      ;
                       STA.W $07F0                          ;0184B7|8DF007  |0107F0;
                       LDA.B #$00                           ;0184BA|A900    |      ;
                       STA.W $07F2                          ;0184BC|8DF207  |0107F2;
                       STA.W $07F1                          ;0184BF|8DF107  |0107F1;
                       STA.W $07F3                          ;0184C2|8DF307  |0107F3;
                       RTS                                  ;0184C5|60      |      ;
 
 
          CODE_0184C6: LDA.W $07F3                          ;0184C6|ADF307  |0107F3;
                       CMP.B #$07                           ;0184C9|C907    |      ;
                       BCS CODE_0184E5                      ;0184CB|B018    |0184E5;
                       AND.B #$01                           ;0184CD|2901    |      ;
                       BNE CODE_0184DB                      ;0184CF|D00A    |0184DB;
                       LDA.B #$20                           ;0184D1|A920    |      ;
                       STA.B $17                            ;0184D3|8517    |000017;
                       LDA.B r_PPUCtrl                      ;0184D5|A5FF    |0000FF;
                       ORA.B #$01                           ;0184D7|0901    |      ;
                       BNE CODE_0184E3                      ;0184D9|D008    |0184E3;
 
          CODE_0184DB: LDA.B #$24                           ;0184DB|A924    |      ;
                       STA.B $17                            ;0184DD|8517    |000017;
                       LDA.B r_PPUCtrl                      ;0184DF|A5FF    |0000FF;
                       AND.B #$FE                           ;0184E1|29FE    |      ;
 
          CODE_0184E3: STA.B r_PPUCtrl                      ;0184E3|85FF    |0000FF;
 
          CODE_0184E5: LDA.W $07F3                          ;0184E5|ADF307  |0107F3;
                       CMP.B #$07                           ;0184E8|C907    |      ;
                       BEQ CODE_0184F4                      ;0184EA|F008    |0184F4;
                       CMP.B #$08                           ;0184EC|C908    |      ;
                       BEQ CODE_018508                      ;0184EE|F018    |018508;
                       JSR.W CODE_018D86                    ;0184F0|20868D  |018D86;
                       RTS                                  ;0184F3|60      |      ;
 
 
          CODE_0184F4: LDA.B #$24                           ;0184F4|A924    |      ;
                       STA.B $17                            ;0184F6|8517    |000017;
                       LDA.B r_PPUCtrl                      ;0184F8|A5FF    |0000FF;
                       AND.B #$FE                           ;0184FA|29FE    |      ;
                       STA.B r_PPUCtrl                      ;0184FC|85FF    |0000FF;
                       DEC.W $07F3                          ;0184FE|CEF307  |0107F3;
                       JSR.W CODE_018D86                    ;018501|20868D  |018D86;
                       INC.W $07F3                          ;018504|EEF307  |0107F3;
                       RTS                                  ;018507|60      |      ;
 
 
          CODE_018508: INC.W $07ED                          ;018508|EEED07  |0107ED;
                       LDA.B #$00                           ;01850B|A900    |      ;
                       STA.W $07F1                          ;01850D|8DF107  |0107F1;
                       STA.W $07F0                          ;018510|8DF007  |0107F0;
                       RTS                                  ;018513|60      |      ;
 
 
         DATA8_018514: db $A2,$01,$BC,$4E,$05               ;018514|        |      ;
                       db $F0,$07,$BD,$06,$06               ;018519|        |      ;
                       db $C9,$03,$F0,$05,$E8               ;01851E|        |      ;
                       db $E0,$0D,$D0,$EF,$88               ;018523|        |      ;
                       db $B9,$2D,$85,$D0                   ;018528|        |      ;
 
         DATA8_01852C: db $09,$00,$0D,$07,$0E               ;01852C|        |      ;
 
         DATA8_018531: db $A4,$32,$B9,$45,$85               ;018531|        |      ;
                       db $8D,$EF,$07,$EE,$ED               ;018536|        |      ;
                       db $07,$A9,$00,$8D,$F3               ;01853B|        |      ;
                       db $07,$8D,$F2,$07,$60               ;018540|        |      ;
                       db $00,$07,$0D,$00,$00               ;018545|        |      ;
                       db $00,$00,$0E                       ;01854A|        |      ;
 
         DATA8_01854D: db $A4,$32,$B9,$D1,$85               ;01854D|        |      ;
                       db $A8,$4C,$97,$85                   ;018552|        |      ;
 
         DATA8_018556: db $A9,$00,$8D,$EF,$07               ;018556|        |      ;
                       db $A0,$04,$D0,$38                   ;01855B|        |      ;
 
         DATA8_01855F: db $A5,$3A,$C9                       ;01855F|        |      ;
                       db $FF,$F0,$09,$A4,$32               ;018562|        |A409F0;
                       db $B9,$E9,$85,$A8,$4C               ;018567|        |0185E9;
                       db $97,$85,$A9,$03,$18               ;01856C|        |000085;
                       db $6D,$ED,$07,$8D,$ED               ;018571|        |0107ED;
                       db $07,$60                           ;018576|        |000060;
 
       UNREACH_018578: db $AD,$ED,$07,$29,$80               ;018578|        |0107ED;
                       db $D0,$09,$A4,$32,$B9               ;01857D|        |018588;
                       db $D9,$85,$A8,$4C,$97               ;018582|        |01A885;
                       db $85,$A4,$32,$B9,$E1               ;018587|        |0000A4;
                       db $85,$A8,$4C,$97,$85               ;01858C|        |0000A8;
 
       UNREACH_018591: db $A4,$32,$B9,$C9,$85               ;018591|        |000032;
                       db $A8,$AD,$F3,$07,$D0               ;018596|        |      ;
                       db $15,$20,$44,$89,$B0               ;01859B|        |000020;
                       db $14,$A9,$04,$8D,$F3               ;0185A0|        |0000A9;
                       db $07,$A5,$28,$29,$80               ;0185A5|        |0000A5;
                       db $F0,$05,$A9,$02,$8D               ;0185AA|        |0185B1;
                       db $F3,$07,$CE,$F3,$07               ;0185AF|        |000007;
                       db $60,$A9,$00,$8D,$EF               ;0185B4|        |      ;
                       db $07,$8D,$F3,$07,$8D               ;0185B9|        |00008D;
                       db $F1,$07,$EE,$ED,$07               ;0185BE|        |000007;
                       db $A9,$FF,$8D,$F2,$07               ;0185C3|        |      ;
                       db $60,$00,$00,$0C,$00               ;0185C8|        |      ;
                       db $00,$00,$00,$14,$00               ;0185CD|        |      ;
                       db $02,$0E,$00,$00,$00               ;0185D2|        |      ;
                       db $00,$16,$00,$06,$10               ;0185D7|        |      ;
                       db $00,$00,$00,$00,$18               ;0185DC|        |      ;
                       db $00,$08,$12,$00,$00               ;0185E1|        |      ;
                       db $00,$00,$1A,$00,$0A               ;0185E6|        |      ;
                       db $0A,$00,$00,$00,$00               ;0185EB|        |      ;
                       db $0A                               ;0185F0|        |      ;
 
       UNREACH_0185F1: db $AD,$F2,$07,$D0,$04               ;0185F1|        |0107F2;
                       db $EE,$ED,$07,$60,$CE               ;0185F6|        |0107ED;
                       db $F2,$07,$A5,$28,$29               ;0185FB|        |000007;
                       db $80,$F0,$05,$A9,$00               ;018600|        |0185F2;
                       db $8D,$F2,$07,$60                   ;018605|        |0107F2;
 
       UNREACH_018609: db $A6,$1D,$A9,$02,$85               ;018609|        |00001D;
                       db $03,$AD,$F1,$07,$0A               ;01860E|        |0000AD;
                       db $0A,$0A,$0A,$0A,$0A               ;018613|        |      ;
                       db $18,$69,$C6,$85,$00               ;018618|        |      ;
                       db $A9,$20,$69,$00,$85               ;01861D|        |      ;
                       db $01,$A9,$01,$20,$56               ;018622|        |0000A9;
                       db $83,$A5,$00,$20,$56               ;018627|        |0000A5;
                       db $83,$A5,$01,$20,$56               ;01862C|        |0000A5;
                       db $83,$A9,$14,$85,$02               ;018631|        |0000A9;
                       db $A9,$00,$20,$56,$83               ;018636|        |      ;
                       db $C6,$02,$D0,$F9,$A9               ;01863B|        |000002;
                       db $FF,$20,$56,$83,$A5               ;018640|        |835620;
                       db $00,$18,$69,$20,$85               ;018645|        |      ;
                       db $00,$A5,$01,$69,$00               ;01864A|        |      ;
                       db $85,$01,$C6,$03,$D0               ;01864F|        |000001;
                       db $CE,$86,$1D,$EE,$F1               ;018654|        |011D86;
                       db $07,$AD,$F1,$07,$C9               ;018659|        |0000AD;
                       db $03,$D0,$08,$A9,$00               ;01865E|        |0000D0;
                       db $8D,$F1,$07,$EE,$ED               ;018663|        |0107F1;
                       db $07,$60                           ;018668|        |000060;
 
       UNREACH_01866A: db $EE,$ED,$07,$AD,$ED               ;01866A|        |0107ED;
                       db $07,$29,$7F,$8D,$ED               ;01866F|        |000029;
                       db $07,$60                           ;018674|        |000060;
 
       UNREACH_018676: db $A5,$26,$29,$0C,$F0               ;018676|        |000026;
                       db $0E,$A9,$72,$20,$5F               ;01867B|        |0172A9;
                       db $E2,$AD,$ED,$07,$18               ;018680|        |      ;
                       db $69,$80,$8D,$ED,$07               ;018685|        |      ;
                       db $20,$A8,$86,$A5,$26               ;01868A|        |0186A8;
                       db $29,$80,$D0,$01,$60               ;01868F|        |      ;
                       db $EE,$ED,$07,$A9,$00               ;018694|        |0107ED;
                       db $8D,$EF,$07,$8D,$F0               ;018699|        |0107EF;
                       db $07,$8D,$F3,$07,$A9               ;01869E|        |00008D;
                       db $20,$8D,$F2,$07,$60               ;0186A3|        |01F28D;
                       db $A0,$00,$AD,$ED,$07               ;0186A8|        |      ;
                       db $29,$80,$F0,$02,$A0               ;0186AD|        |      ;
                       db $03,$A6,$1D,$A9,$02               ;0186B2|        |0000A6;
                       db $20,$56,$83,$A9,$26               ;0186B7|        |018356;
                       db $20,$56,$83,$A9,$21               ;0186BC|        |018356;
                       db $20,$56,$83,$A9,$03               ;0186C1|        |018356;
                       db $85,$00,$B9,$DB,$86               ;0186C6|        |000000;
                       db $20,$56,$83,$C8,$C6               ;0186CB|        |018356;
                       db $00,$D0,$F5,$A9,$FF               ;0186D0|        |      ;
                       db $20,$56,$83,$86,$1D               ;0186D5|        |018356;
                       db $60,$36,$00,$00,$00               ;0186DA|        |      ;
                       db $00,$36,$00,$00,$00               ;0186DF|        |      ;
 
       UNREACH_0186E4: db $AD,$F2,$07,$F0,$21               ;0186E4|        |0107F2;
                       db $CE,$F2,$07,$A9,$0F               ;0186E9|        |0107F2;
                       db $8D,$EF,$07,$AD,$ED               ;0186EE|        |0107EF;
                       db $07,$29,$80,$F0,$03               ;0186F3|        |000029;
                       db $EE,$EF,$07,$AD,$F2               ;0186F8|        |0107EF;
                       db $07,$29,$04,$D0,$03               ;0186FD|        |000029;
                       db $4C,$A8,$86,$A0,$06               ;018702|        |0186A8;
                       db $4C,$B3,$86,$EE,$ED               ;018707|        |0186B3;
                       db $07,$60                           ;01870C|        |000060;
 
       UNREACH_01870E: db $AD,$ED,$07,$29,$80               ;01870E|        |0107ED;
                       db $D0,$1F,$AD,$EF,$07               ;018713|        |018734;
                       db $D0,$14,$AD,$F3,$07               ;018718|        |01872E;
                       db $F0,$0F,$EE,$ED,$07               ;01871D|        |01872E;
                       db $A9,$00,$8D,$EF,$07               ;018722|        |      ;
                       db $8D,$F3,$07,$8D,$F0               ;018727|        |0107F3;
                       db $07,$60,$A9,$08,$8D               ;01872C|        |000060;
                       db $EF,$07,$60,$A9,$0B               ;018731|        |A96007;
                       db $18,$6D,$ED,$07,$8D               ;018736|        |      ;
                       db $ED,$07,$60                       ;01873B|        |016007;
 
       UNREACH_01873E: db $AD,$F3,$07,$D0,$06               ;01873E|        |0107F3;
                       db $A9,$09,$8D,$EF,$07               ;018743|        |      ;
                       db $60,$EE,$ED,$07,$A9               ;018748|        |      ;
                       db $00,$8D,$F3,$07,$8D               ;01874D|        |      ;
                       db $EF,$07,$A9,$40,$8D               ;018752|        |40A907;
                       db $F0,$07,$60                       ;018757|        |018760;
 
       UNREACH_01875A: db $AD,$F3,$07,$D0,$06               ;01875A|        |0107F3;
                       db $A9,$0A,$8D,$EF,$07               ;01875F|        |      ;
                       db $60,$EE,$ED,$07,$A9               ;018764|        |      ;
                       db $00,$8D,$EF,$07,$8D               ;018769|        |      ;
                       db $F0,$07,$8D,$F3,$07               ;01876E|        |018777;
                       db $60                               ;018773|        |      ;
 
       UNREACH_018774: db $A5,$3A,$C9,$FF,$F0               ;018774|        |00003A;
                       db $09,$A9,$11,$8D,$EF               ;018779|        |      ;
                       db $07,$EE,$ED,$07,$60               ;01877E|        |0000EE;
                       db $A2,$01,$BD,$4E,$05               ;018783|        |      ;
                       db $F0,$15,$BD,$06,$06               ;018788|        |01879F;
                       db $C9,$03,$D0,$0E,$DE               ;01878D|        |      ;
                       db $06,$06,$BD,$4E,$05               ;018792|        |000006;
                       db $38,$E9,$01,$85,$3A               ;018797|        |      ;
                       db $20,$EC,$87,$E8,$E0               ;01879C|        |0187EC;
                       db $0D,$D0,$E1,$A9,$08               ;0187A1|        |01E1D0;
                       db $18,$6D,$ED,$07,$8D               ;0187A6|        |      ;
                       db $ED,$07,$60                       ;0187AB|        |016007;
 
       UNREACH_0187AE: db $AD,$EF,$07,$D0,$38               ;0187AE|        |0107EF;
                       db $EE,$ED,$07,$A2,$01               ;0187B3|        |0107ED;
                       db $BD,$4E,$05,$F0,$29               ;0187B8|        |01054E;
                       db $BD,$06,$06,$C9,$02               ;0187BD|        |010606;
                       db $F0,$1F,$C9,$03,$D0               ;0187C2|        |0187E3;
                       db $1E,$DE,$06,$06,$BD               ;0187C7|        |0106DE;
                       db $4E,$05,$38,$E9,$01               ;0187CC|        |013805;
                       db $85,$3A,$20,$EC,$87               ;0187D1|        |00003A;
                       db $AD,$4E,$05,$F0,$0B               ;0187D6|        |01054E;
                       db $A5,$3A,$8D,$4E,$05               ;0187DB|        |00003A;
                       db $4C,$E6,$87,$FE,$06               ;0187E0|        |0187E6;
                       db $06,$E8,$E0,$0D,$D0               ;0187E5|        |0000E8;
                       db $CD,$60,$A9,$00,$85               ;0187EA|        |01A960;
                       db $8F,$85,$86,$85,$88               ;0187EF|        |858685;
                       db $60                               ;0187F4|        |      ;
 
       UNREACH_0187F5: db $A9,$12,$8D,$EF,$07               ;0187F5|        |      ;
                       db $A5,$32,$C9,$01,$F0               ;0187FA|        |000032;
                       db $0B,$A9,$00,$8D,$EF               ;0187FF|        |      ;
                       db $07,$EE,$ED,$07,$4C               ;018804|        |0000EE;
                       db $10,$88,$A9,$80,$8D               ;018809|        |018793;
                       db $F2,$07,$EE,$ED,$07               ;01880E|        |000007;
                       db $60                               ;018813|        |      ;
 
       UNREACH_018814: db $CE,$F2,$07,$D0,$03               ;018814|        |0107F2;
                       db $EE,$ED,$07,$60                   ;018819|        |0107ED;
 
       UNREACH_01881D: db $EE,$ED,$07,$A9,$07               ;01881D|        |0107ED;
                       db $8D,$F0,$07,$A9,$06               ;018822|        |0107F0;
                       db $8D,$F3,$07,$A9,$00               ;018827|        |0107F3;
                       db $8D,$F2,$07,$8D,$F1               ;01882C|        |0107F2;
                       db $07,$8D,$EF,$07,$60               ;018831|        |00008D;
 
       UNREACH_018836: db $AD,$F3,$07,$29,$01               ;018836|        |0107F3;
                       db $D0,$0A,$A9,$20,$85               ;01883B|        |018847;
                       db $17,$A5,$FF,$09,$01               ;018840|        |0000A5;
                       db $D0,$08,$A9,$24,$85               ;018845|        |01884F;
                       db $17,$A5,$FF,$29,$FE               ;01884A|        |0000A5;
                       db $85,$FF,$AD,$F3,$07               ;01884F|        |0000FF;
                       db $C9,$FF,$F0,$04,$20               ;018854|        |      ;
                       db $82,$8D,$60,$EE,$ED               ;018859|        |01E8E9;
                       db $07,$A9,$00,$8D,$F1               ;01885E|        |0000A9;
                       db $07,$8D,$F0,$07,$8D               ;018863|        |00008D;
                       db $F2,$07,$A9,$43,$85               ;018868|        |000007;
                       db $4D,$20,$5D,$E3,$60               ;01886D|        |015D20;
 
       UNREACH_018872: db $A9,$0B,$8D,$EF,$07               ;018872|        |      ;
                       db $A5,$32,$C9,$01,$D0               ;018877|        |000032;
                       db $15,$A9,$03,$85,$00               ;01887C|        |0000A9;
                       db $20,$B9,$FE,$A9,$05               ;018881|        |01FEB9;
                       db $9D,$4E,$05,$A5,$00               ;018886|        |01054E;
                       db $9D,$06,$06,$C6,$00               ;01888B|        |010606;
                       db $D0,$EF,$EE,$ED,$07               ;018890|        |018881;
                       db $A9,$00,$8D,$F3,$07               ;018895|        |      ;
                       db $60                               ;01889A|        |      ;
 
       UNREACH_01889B: db $AD,$F3,$07,$C9,$D0               ;01889B|        |0107F3;
                       db $F0,$21,$4A,$29,$0F               ;0188A0|        |0188C3;
                       db $A8,$A5,$32,$C9,$01               ;0188A5|        |      ;
                       db $D0,$13,$B9,$CC,$88               ;0188AA|        |0188BF;
                       db $85,$FC,$85,$FD,$AD               ;0188AF|        |0000FC;
                       db $F3,$07,$29,$0F,$D0               ;0188B4|        |000007;
                       db $05,$A9,$3A,$20,$5F               ;0188B9|        |0000A9;
                       db $E2,$EE,$F3,$07,$60               ;0188BE|        |      ;
                       db $EE,$ED,$07,$A9,$00               ;0188C3|        |0107ED;
                       db $8D,$EF,$07,$60,$00               ;0188C8|        |0107EF;
                       db $02,$01,$03,$00,$01               ;0188CD|        |      ;
                       db $01,$02,$01,$03,$00               ;0188D2|        |000002;
                       db $01,$00,$02,$03,$00               ;0188D7|        |000000;
 
       UNREACH_0188DC: db $EE,$ED,$07,$60                   ;0188DC|        |0107ED;
 
       UNREACH_0188E0: db $A9,$07,$8D,$60,$01               ;0188E0|        |      ;
                       db $A9,$B4,$8D,$F2,$07               ;0188E5|        |      ;
                       db $4C,$DC,$88                       ;0188EA|        |0188DC;
 
       UNREACH_0188ED: db $A9,$1E,$85,$2A,$A9               ;0188ED|        |      ;
                       db $00,$8D,$EC,$07,$8D               ;0188F2|        |      ;
                       db $ED,$07,$8D,$EE,$07               ;0188F7|        |018D07;
                       db $8D,$EF,$07,$8D,$F0               ;0188FC|        |0107EF;
                       db $07,$8D,$F1,$07,$8D               ;018901|        |00008D;
                       db $F2,$07,$8D,$F3,$07               ;018906|        |000007;
                       db $60                               ;01890B|        |      ;
 
   pointerPointJumper: LDA.W pointerPointTable00,Y          ;01890C|B92989  |018929;
                       STA.B $00                            ;01890F|8500    |000000;
                       LDA.W pointerPointTable01,Y          ;018911|B92A89  |01892A;
                       STA.B $01                            ;018914|8501    |000001;
                       LDA.W $07ED                          ;018916|ADED07  |0107ED;
                       AND.B #$7F                           ;018919|297F    |      ;
                       ASL A                                ;01891B|0A      |      ;
                       TAY                                  ;01891C|A8      |      ;
                       LDA.B ($00),Y                        ;01891D|B100    |000000;
                       STA.B $02                            ;01891F|8502    |000002;
                       INY                                  ;018921|C8      |      ;
                       LDA.B ($00),Y                        ;018922|B100    |000000;
                       STA.B $03                            ;018924|8503    |000003;
                       JMP.W ($0002)                        ;018926|6C0200  |000002;
 
 
  pointerPointTable00: dw orbCollSub                        ;018929|        |018007;
                       dw orbFriends_01                     ;01892B|        |018294;
                       dw orbFriends_02                     ;01892D|        |0183D5;
                       dw orbFriends_03                     ;01892F|        |018464;
 
          CODE_018931: LDX.B #$0D                           ;018931|A20D    |      ;
 
          CODE_018933: LDA.B #$00                           ;018933|A900    |      ;
                       STA.W $0400,X                        ;018935|9D0004  |010400;
                       STA.W $054E,X                        ;018938|9D4E05  |01054E;
                       STA.W $0470,X                        ;01893B|9D7004  |010470;
                       INX                                  ;01893E|E8      |      ;
                       CPX.B #$13                           ;01893F|E013    |      ;
                       BCC CODE_018933                      ;018941|90F0    |018933;
                       RTS                                  ;018943|60      |      ;
 
                       LDA.W textGroups,Y                   ;018944|B9268A  |018A26;
                       STA.B $00                            ;018947|8500    |000000;
                       LDA.W PTR16_018A27,Y                 ;018949|B9278A  |018A27;
                       STA.B $01                            ;01894C|8501    |000001;
                       LDA.W $07F2                          ;01894E|ADF207  |0107F2;
                       ASL A                                ;018951|0A      |      ;
                       TAY                                  ;018952|A8      |      ;
                       LDA.B ($00),Y                        ;018953|B100    |000000;
                       CMP.B #$FF                           ;018955|C9FF    |      ;
                       BNE CODE_018966                      ;018957|D00D    |018966;
                       INY                                  ;018959|C8      |      ;
                       LDA.B ($00),Y                        ;01895A|B100    |000000;
                       CMP.B #$FF                           ;01895C|C9FF    |      ;
                       BNE CODE_018963                      ;01895E|D003    |018963;
                       JMP.W CODE_018A1F                    ;018960|4C1F8A  |018A1F;
 
 
          CODE_018963: DEY                                  ;018963|88      |      ;
                       LDA.B ($00),Y                        ;018964|B100    |000000;
 
          CODE_018966: STA.B $02                            ;018966|8502    |000002;
                       INY                                  ;018968|C8      |      ;
                       LDA.B ($00),Y                        ;018969|B100    |000000;
                       STA.B $03                            ;01896B|8503    |000003;
                       LDY.W $07F1                          ;01896D|ACF107  |0107F1;
                       LDA.B ($02),Y                        ;018970|B102    |000002;
                       CMP.B #$FF                           ;018972|C9FF    |      ;
                       BNE CODE_018979                      ;018974|D003    |018979;
                       JMP.W CODE_018A15                    ;018976|4C158A  |018A15;
 
 
          CODE_018979: STA.B $04                            ;018979|8504    |000004;
                       LDX.B r_sceneDrawQueue               ;01897B|A61D    |00001D;
                       LDA.B #$01                           ;01897D|A901    |      ;
                       JSR.W CODE_018A21                    ;01897F|20218A  |018A21;
                       LDA.W $07F2                          ;018982|ADF207  |0107F2;
                       ASL A                                ;018985|0A      |      ;
                       ASL A                                ;018986|0A      |      ;
                       ASL A                                ;018987|0A      |      ;
                       ASL A                                ;018988|0A      |      ;
                       ASL A                                ;018989|0A      |      ;
                       ASL A                                ;01898A|0A      |      ;
                       CLC                                  ;01898B|18      |      ;
                       ADC.W $07F1                          ;01898C|6DF107  |0107F1;
                       CLC                                  ;01898F|18      |      ;
                       ADC.B #$E6                           ;018990|69E6    |      ;
                       STA.B $00                            ;018992|8500    |000000;
                       LDA.B #$20                           ;018994|A920    |      ;
                       ADC.B #$00                           ;018996|6900    |      ;
                       STA.B $01                            ;018998|8501    |000001;
                       LDA.B $00                            ;01899A|A500    |000000;
                       JSR.W CODE_018A21                    ;01899C|20218A  |018A21;
                       LDA.B $01                            ;01899F|A501    |000001;
                       JSR.W CODE_018A21                    ;0189A1|20218A  |018A21;
                       LDA.B $04                            ;0189A4|A504    |000004;
                       CMP.B #$40                           ;0189A6|C940    |      ;
                       BCC CODE_0189BA                      ;0189A8|9010    |0189BA;
                       CMP.B #$C0                           ;0189AA|C9C0    |      ;
                       BCS CODE_0189BA                      ;0189AC|B00C    |0189BA;
                       CMP.B #$80                           ;0189AE|C980    |      ;
                       BCC CODE_0189B8                      ;0189B0|9006    |0189B8;
                       AND.B #$1F                           ;0189B2|291F    |      ;
                       ORA.B #$C0                           ;0189B4|09C0    |      ;
                       BNE CODE_0189BA                      ;0189B6|D002    |0189BA;
 
          CODE_0189B8: AND.B #$1F                           ;0189B8|291F    |      ;
 
          CODE_0189BA: JSR.W CODE_018A21                    ;0189BA|20218A  |018A21;
                       LDA.B #$FF                           ;0189BD|A9FF    |      ;
                       JSR.W CODE_018A21                    ;0189BF|20218A  |018A21;
                       STX.B r_sceneDrawQueue               ;0189C2|861D    |00001D;
                       LDA.B $04                            ;0189C4|A504    |000004;
                       CMP.B #$40                           ;0189C6|C940    |      ;
                       BCC CODE_018A10                      ;0189C8|9046    |018A10;
                       CMP.B #$C0                           ;0189CA|C9C0    |      ;
                       BCS CODE_018A10                      ;0189CC|B042    |018A10;
                       CMP.B #$80                           ;0189CE|C980    |      ;
                       BCC CODE_0189D8                      ;0189D0|9006    |0189D8;
                       CMP.B #$A0                           ;0189D2|C9A0    |      ;
                       BCS CODE_0189E4                      ;0189D4|B00E    |0189E4;
                       BCC CODE_0189E0                      ;0189D6|9008    |0189E0;
 
          CODE_0189D8: CMP.B #$60                           ;0189D8|C960    |      ;
                       BCS CODE_0189E4                      ;0189DA|B008    |0189E4;
                       LDA.B #$10                           ;0189DC|A910    |      ;
                       BNE CODE_0189E6                      ;0189DE|D006    |0189E6;
 
          CODE_0189E0: LDA.B #$10                           ;0189E0|A910    |      ;
                       BNE CODE_0189E6                      ;0189E2|D002    |0189E6;
 
          CODE_0189E4: LDA.B #$C0                           ;0189E4|A9C0    |      ;
 
          CODE_0189E6: STA.B $04                            ;0189E6|8504    |000004;
                       LDA.B $00                            ;0189E8|A500    |000000;
                       SEC                                  ;0189EA|38      |      ;
                       SBC.B #$20                           ;0189EB|E920    |      ;
                       STA.B $00                            ;0189ED|8500    |000000;
                       LDA.B $01                            ;0189EF|A501    |000001;
                       SBC.B #$00                           ;0189F1|E900    |      ;
                       STA.B $01                            ;0189F3|8501    |000001;
                       LDA.B #$01                           ;0189F5|A901    |      ;
                       JSR.W CODE_018A21                    ;0189F7|20218A  |018A21;
                       LDA.B $00                            ;0189FA|A500    |000000;
                       JSR.W CODE_018A21                    ;0189FC|20218A  |018A21;
                       LDA.B $01                            ;0189FF|A501    |000001;
                       JSR.W CODE_018A21                    ;018A01|20218A  |018A21;
                       LDA.B $04                            ;018A04|A504    |000004;
                       JSR.W CODE_018A21                    ;018A06|20218A  |018A21;
                       LDA.B #$FF                           ;018A09|A9FF    |      ;
                       JSR.W CODE_018A21                    ;018A0B|20218A  |018A21;
                       STX.B r_sceneDrawQueue               ;018A0E|861D    |00001D;
 
          CODE_018A10: INC.W $07F1                          ;018A10|EEF107  |0107F1;
                       CLC                                  ;018A13|18      |      ;
                       RTS                                  ;018A14|60      |      ;
 
 
          CODE_018A15: INC.W $07F2                          ;018A15|EEF207  |0107F2;
                       LDA.B #$00                           ;018A18|A900    |      ;
                       STA.W $07F1                          ;018A1A|8DF107  |0107F1;
                       CLC                                  ;018A1D|18      |      ;
                       RTS                                  ;018A1E|60      |      ;
 
 
          CODE_018A1F: SEC                                  ;018A1F|38      |      ;
                       RTS                                  ;018A20|60      |      ;
 
 
          CODE_018A21: STA.W $0300,X                        ;018A21|9D0003  |010300;
                       INX                                  ;018A24|E8      |      ;
                       RTS                                  ;018A25|60      |      ;
 
 
           textGroups: dw textPointersGrant_00              ;018A26|        |018A42;
                       dw textPointersGrant_01              ;018A28|        |018A4A;
                       dw textPointert_02                   ;018A2A|        |018A52;
                       dw textPointert_03                   ;018A2C|        |018A5A;
                       dw textPointert_04                   ;018A2E|        |018A62;
                       dw textPointert_05                   ;018A30|        |018A6A;
                       dw textPointert_06                   ;018A32|        |018A72;
                       dw textPointert_07                   ;018A34|        |018A7A;
                       dw textPointert_08                   ;018A36|        |018A82;
                       dw textPointert_09                   ;018A38|        |018A8A;
                       dw textPointert_0a                   ;018A3A|        |018A92;
                       dw textPointert_0b                   ;018A3C|        |018A9A;
                       dw textPointert_0c                   ;018A3E|        |018AA2;
                       dw textPointert_0d                   ;018A40|        |018AAA;
 
 textPointersGrant_00: dw textDataGrant_00                  ;018A42|        |018AB2;
                       dw textDataGrant_01                  ;018A44|        |018AC4;
                       dw textDataGrant_02                  ;018A46|        |018AD4;
                       dw $FFFF                             ;018A48|        |      ;
 
 textPointersGrant_01: dw DATA8_018AE9                      ;018A4A|        |018AE9;
                       dw DATA8_018AFD                      ;018A4C|        |018AFD;
                       dw DATA8_018B11                      ;018A4E|        |018B11;
                       dw $FFFF                             ;018A50|        |      ;
 
      textPointert_02: dw DATA8_018B24                      ;018A52|        |018B24;
                       dw DATA8_018B36                      ;018A54|        |018B36;
                       dw DATA8_018B4B                      ;018A56|        |018B4B;
                       dw $FFFF                             ;018A58|        |      ;
 
      textPointert_03: dw DATA8_018B5F                      ;018A5A|        |018B5F;
                       dw DATA8_018B6E                      ;018A5C|        |018B6E;
                       dw DATA8_018B7E                      ;018A5E|        |018B7E;
                       dw $FFFF                             ;018A60|        |      ;
 
      textPointert_04: dw DATA8_018B8C                      ;018A62|        |018B8C;
                       dw DATA8_018B9F                      ;018A64|        |018B9F;
                       dw DATA8_018BB2                      ;018A66|        |018BB2;
                       dw $FFFF                             ;018A68|        |      ;
 
      textPointert_05: dw DATA8_018BC4                      ;018A6A|        |018BC4;
                       dw DATA8_018BD4                      ;018A6C|        |018BD4;
                       dw DATA8_018BE5                      ;018A6E|        |018BE5;
                       dw $FFFF                             ;018A70|        |      ;
 
      textPointert_06: dw DATA8_018BF7                      ;018A72|        |018BF7;
                       dw textDataSympha_00                 ;018A74|        |018C0A;
                       dw DATA8_018C1D                      ;018A76|        |018C1D;
                       dw $FFFF                             ;018A78|        |      ;
 
      textPointert_07: dw DATA8_018C2D                      ;018A7A|        |018C2D;
                       dw DATA8_018C3B                      ;018A7C|        |018C3B;
                       dw DATA8_018C4B                      ;018A7E|        |018C4B;
                       dw $FFFF                             ;018A80|        |      ;
 
      textPointert_08: dw DATA8_018C54                      ;018A82|        |018C54;
                       dw DATA8_018C63                      ;018A84|        |018C63;
                       dw DATA8_018C74                      ;018A86|        |018C74;
                       dw $FFFF                             ;018A88|        |      ;
 
      textPointert_09: dw DATA8_018C82                      ;018A8A|        |018C82;
                       dw DATA8_018C95                      ;018A8C|        |018C95;
                       dw DATA8_018CA8                      ;018A8E|        |018CA8;
                       dw $FFFF                             ;018A90|        |      ;
 
      textPointert_0a: dw DATA8_018CB4                      ;018A92|        |018CB4;
                       dw DATA8_018CC6                      ;018A94|        |018CC6;
                       dw DATA8_018CDA                      ;018A96|        |018CDA;
                       dw $FFFF                             ;018A98|        |      ;
 
      textPointert_0b: dw DATA8_018CEB                      ;018A9A|        |018CEB;
                       dw DATA8_018CF9                      ;018A9C|        |018CF9;
                       dw DATA8_018D09                      ;018A9E|        |018D09;
                       dw $FFFF                             ;018AA0|        |      ;
 
      textPointert_0c: dw DATA8_018D12                      ;018AA2|        |018D12;
                       dw DATA8_018D23                      ;018AA4|        |018D23;
                       dw DATA8_018D34                      ;018AA6|        |018D34;
                       dw $FFFF                             ;018AA8|        |      ;
 
      textPointert_0d: dw DATA8_018D49                      ;018AAA|        |018D49;
                       dw DATA8_018D5C                      ;018AAC|        |018D5C;
                       dw DATA8_018D6F                      ;018AAE|        |018D6F;
                       dw $FFFF                             ;018AB0|        |      ;
 
     textDataGrant_00: db $CC,$F8,$00,$ED,$E0               ;018AB2|        |      ;
                       db $EC,$E4,$00,$E8,$F2               ;018AB7|        |      ;
                       db $00,$C6,$F1,$E0,$ED               ;018ABC|        |      ;
                       db $F3,$DB,$FF                       ;018AC1|        |      ;
 
     textDataGrant_01: db $C8,$00,$E3,$F1,$E4               ;018AC4|        |      ;
                       db $E0,$EC,$E4,$E3,$00               ;018AC9|        |      ;
                       db $C8,$00,$F6,$E0,$F2               ;018ACE|        |      ;
                       db $FF                               ;018AD3|        |      ;
 
     textDataGrant_02: db $F3,$F4,$F1,$ED,$E4               ;018AD4|        |      ;
                       db $E3,$00,$E8,$ED,$F3               ;018AD9|        |      ;
                       db $EE,$00,$E0,$00,$E6               ;018ADE|        |      ;
                       db $E7,$EE,$F2,$F3,$DB               ;018AE3|        |      ;
                       db $FF                               ;018AE8|        |      ;
 
         DATA8_018AE9: db $CF,$EB,$E4,$E0,$F2               ;018AE9|        |      ;
                       db $E4,$00,$F3,$E0,$EA               ;018AEE|        |      ;
                       db $E4,$00,$EC,$E4,$00               ;018AF3|        |      ;
                       db $F6,$E8,$F3,$E7,$FF               ;018AF8|        |      ;
 
         DATA8_018AFD: db $F8,$EE,$F4,$DB,$00               ;018AFD|        |      ;
                       db $00,$CC,$F8,$00,$E5               ;018B02|        |      ;
                       db $E0,$EC,$E8,$EB,$F8               ;018B07|        |      ;
                       db $00,$F6,$E0,$F2,$FF               ;018B0C|        |      ;
 
         DATA8_018B11: db $EA,$E8,$EB,$EB,$E4               ;018B11|        |      ;
                       db $E3,$00,$E1,$F8,$00               ;018B16|        |      ;
                       db $C3,$F1,$E0,$E2,$F4               ;018B1B|        |      ;
                       db $EB,$E0,$DB,$FF                   ;018B20|        |      ;
 
         DATA8_018B24: db $D6,$E7,$E0,$F3,$00               ;018B24|        |      ;
                       db $F6,$E8,$EB,$EB,$00               ;018B29|        |      ;
                       db $F8,$EE,$F4,$00,$E3               ;018B2E|        |      ;
                       db $EE,$FB,$FF                       ;018B33|        |      ;
 
         DATA8_018B36: db $00,$00,$D3,$E0,$EA               ;018B36|        |      ;
                       db $E4,$00,$E7,$E8,$EC               ;018B3B|        |      ;
                       db $00,$F6,$E8,$F3,$E7               ;018B40|        |      ;
                       db $00,$F8,$EE,$F4,$FB               ;018B45|        |      ;
                       db $FF                               ;018B4A|        |      ;
 
         DATA8_018B4B: db $00,$00,$CB,$E4,$E0               ;018B4B|        |      ;
                       db $F5,$E4,$00,$E7,$E8               ;018B50|        |      ;
                       db $EC,$00,$E1,$E4,$E7               ;018B55|        |      ;
                       db $E8,$ED,$E3,$FB,$FF               ;018B5A|        |      ;
 
         DATA8_018B5F: db $C8,$00,$E2,$E0,$ED               ;018B5F|        |      ;
                       db $00,$E7,$E4,$EB,$EF               ;018B64|        |      ;
                       db $00,$F8,$EE,$F4,$FF               ;018B69|        |      ;
 
         DATA8_018B6E: db $E0,$00                           ;018B6E|        |      ;
 
         DATA8_018B70: db $EB,$EE,$F3,$00                   ;018B70|        |      ;
 
         DATA8_018B74: db $E1,$E4,$E2,$E0,$F4               ;018B74|        |      ;
                       db $F2,$E4,$00,$C8,$FF               ;018B79|        |      ;
 
         DATA8_018B7E: db $E0,$EC,$00,$F5,$E4               ;018B7E|        |      ;
                       db $F1,$F8,$00,$E5,$E0               ;018B83|        |      ;
                       db $F2,$F3,$DB,$FF                   ;018B88|        |      ;
 
         DATA8_018B8C: db $D3,$E7,$E0,$ED,$EA               ;018B8C|        |      ;
                       db $F2,$00,$E5,$EE,$F1               ;018B91|        |      ;
                       db $00,$E7,$E4,$EB,$EF               ;018B96|        |      ;
                       db $E8,$ED,$E6,$FF                   ;018B9B|        |      ;
 
         DATA8_018B9F: db $EC,$E4,$DB,$00,$00               ;018B9F|        |      ;
                       db $C8,$00,$E7,$EE,$EF               ;018BA4|        |      ;
                       db $E4,$00,$F6,$E4,$00               ;018BA9|        |      ;
                       db $F2,$E4,$E4,$FF                   ;018BAE|        |      ;
 
         DATA8_018BB2: db $E4,$E0,$E2,$E7,$00               ;018BB2|        |      ;
                       db $EE,$F3,$E7,$E4,$F1               ;018BB7|        |      ;
                       db $00,$E0,$E6,$E0,$E8               ;018BBC|        |      ;
                       db $ED,$DB,$FF                       ;018BC1|        |      ;
 
         DATA8_018BC4: db $CC,$F8,$00,$E9,$EE               ;018BC4|        |      ;
                       db $E1,$00,$E8,$F2,$00               ;018BC9|        |      ;
                       db $E3,$EE,$ED,$E4,$DC               ;018BCE|        |      ;
                       db $FF                               ;018BD3|        |      ;
 
         DATA8_018BD4: db $F2,$EE,$00,$F8,$EE               ;018BD4|        |      ;
                       db $F4,$00,$F2,$E7,$EE               ;018BD9|        |      ;
                       db $F4,$EB,$E3,$00,$E6               ;018BDE|        |      ;
                       db $EE,$FF                           ;018BE3|        |      ;
 
         DATA8_018BE5: db $F6,$E8,$F3,$E7,$00               ;018BE5|        |      ;
                       db $E7,$E8,$EC,$00,$E5               ;018BEA|        |      ;
                       db $EE,$F1,$00,$ED,$EE               ;018BEF|        |      ;
                       db $F6,$DB,$FF                       ;018BF4|        |      ;
 
         DATA8_018BF7: db $D3,$E7,$E0,$ED,$EA               ;018BF7|        |      ;
                       db $F2,$00,$E5,$EE,$F1               ;018BFC|        |      ;
                       db $00,$E7,$E4,$EB,$EF               ;018C01|        |      ;
                       db $E8,$ED,$E6,$FF                   ;018C06|        |      ;
 
    textDataSympha_00: db $EC,$E4,$DB,$00,$00               ;018C0A|        |      ;
                       db $C8,$DA,$EC,$00,$D2               ;018C0F|        |      ;
                       db $F8,$E5,$E0,$DC,$00               ;018C14|        |      ;
                       db $F3,$E7,$E4,$FF                   ;018C19|        |      ;
 
         DATA8_018C1D: db $D5,$E0,$EC,$EF,$E8               ;018C1D|        |      ;
                       db $F1,$E4,$00,$C7,$F4               ;018C22|        |      ;
                       db $ED,$F3,$E4,$F1,$DB               ;018C27|        |      ;
                       db $FF                               ;018C2C|        |      ;
 
         DATA8_018C2D: db $C8,$00,$F6,$E8,$EB               ;018C2D|        |      ;
                       db $EB,$00,$E5,$EE,$EB               ;018C32|        |      ;
                       db $EB,$EE,$F6,$FF                   ;018C37|        |      ;
 
         DATA8_018C3B: db $F8,$EE,$F4,$00,$E8               ;018C3B|        |      ;
                       db $E5,$00,$F8,$EE,$F4               ;018C40|        |      ;
                       db $00,$ED,$E4,$E4,$E3               ;018C45|        |      ;
                       db $FF                               ;018C4A|        |      ;
 
         DATA8_018C4B: db $EC,$F8,$00,$E7,$E4               ;018C4B|        |      ;
                       db $EB,$EF,$DB,$FF                   ;018C50|        |      ;
 
         DATA8_018C54: db $C8,$00,$E7,$EE,$EF               ;018C54|        |      ;
                       db $E4,$00,$E0,$00,$CC               ;018C59|        |      ;
                       db $E0,$E6,$E8,$E2,$FF               ;018C5E|        |      ;
 
         DATA8_018C63: db $D2,$EF,$E8,$F1,$E8               ;018C63|        |      ;
                       db $F3,$00,$F6,$E8,$EB               ;018C68|        |      ;
                       db $EB,$00,$E6,$E8,$F5               ;018C6D|        |      ;
                       db $E4,$FF                           ;018C72|        |      ;
 
         DATA8_018C74: db $F4,$F2,$00,$F3,$E7               ;018C74|        |      ;
                       db $E4,$00,$EF,$EE,$F6               ;018C79|        |      ;
                       db $E4,$F1,$DB,$FF                   ;018C7E|        |      ;
 
         DATA8_018C82: db $CF,$EB,$E4,$E0,$F2               ;018C82|        |      ;
                       db $E4,$00,$E1,$E4,$00               ;018C87|        |      ;
                       db $E2,$E0,$F1,$E4,$E5               ;018C8C|        |      ;
                       db $F4,$EB,$DB,$FF                   ;018C91|        |      ;
 
         DATA8_018C95: db $C8,$00,$E7,$EE,$EF               ;018C95|        |      ;
                       db $E4,$00,$F8,$EE,$F4               ;018C9A|        |      ;
                       db $00,$F6,$E8,$EB,$EB               ;018C9F|        |      ;
                       db $00,$E1,$E4,$FF                   ;018CA4|        |      ;
 
         DATA8_018CA8: db $F5,$E8,$E2,$F3,$EE               ;018CA8|        |      ;
                       db $F1,$E8,$EE,$F4,$F2               ;018CAD|        |      ;
                       db $DB,$FF                           ;018CB2|        |      ;
 
         DATA8_018CB4: db $C8,$DA,$EC,$00,$F2               ;018CB4|        |      ;
                       db $F4,$F1,$EF,$F1,$E8               ;018CB9|        |      ;
                       db $F2,$E4,$E3,$00,$F8               ;018CBE|        |      ;
                       db $EE,$F4,$FF                       ;018CC3|        |      ;
 
         DATA8_018CC6: db $E1,$E4,$E0,$F3,$00               ;018CC6|        |      ;
                       db $EC,$E4,$DB,$00,$00               ;018CCB|        |      ;
                       db $C8,$DA,$F5,$E4,$00               ;018CD0|        |      ;
                       db $E1,$E4,$E4,$ED,$FF               ;018CD5|        |      ;
 
         DATA8_018CDA: db $F6,$E0,$E8,$F3,$E8               ;018CDA|        |      ;
                       db $ED,$E6,$00,$E5,$EE               ;018CDF|        |      ;
                       db $F1,$00,$F8,$EE,$F4               ;018CE4|        |      ;
                       db $DB,$FF                           ;018CE9|        |      ;
 
         DATA8_018CEB: db $C8,$00,$ED,$E4,$E4               ;018CEB|        |      ;
                       db $E3,$00,$F8,$EE,$F4               ;018CF0|        |      ;
                       db $00,$F3,$EE,$FF                   ;018CF5|        |      ;
 
         DATA8_018CF9: db $E7,$E4,$EB,$EF,$00               ;018CF9|        |      ;
                       db $EC,$E4,$00,$E3,$E4               ;018CFE|        |      ;
                       db $F2,$F3,$F1,$EE,$F8               ;018D03|        |      ;
                       db $FF                               ;018D08|        |      ;
 
         DATA8_018D09: db $C3,$F1,$E0,$E2,$F4               ;018D09|        |      ;
                       db $EB,$E0,$DB,$FF                   ;018D0E|        |      ;
 
         DATA8_018D12: db $C8,$DA,$EC,$00,$E6               ;018D12|        |      ;
                       db $EB,$E0,$E3,$00,$F3               ;018D17|        |      ;
                       db $EE,$00,$E7,$E4,$E0               ;018D1C|        |      ;
                       db $F1,$FF                           ;018D21|        |      ;
 
         DATA8_018D23: db $F3,$E7,$E0,$F3,$DB               ;018D23|        |      ;
                       db $00,$00,$CB,$E4,$F3               ;018D28|        |      ;
                       db $DA,$F2,$00,$E6,$E4               ;018D2D|        |      ;
                       db $F3,$FF                           ;018D32|        |      ;
 
         DATA8_018D34: db $E7,$E8,$EC,$00,$DB               ;018D34|        |      ;
                       db $00,$00,$C8,$00,$E0               ;018D39|        |      ;
                       db $EC,$00,$C0,$EB,$F4               ;018D3E|        |      ;
                       db $E2,$E0,$F1,$E3,$DB               ;018D43|        |      ;
                       db $FF                               ;018D48|        |      ;
 
         DATA8_018D49: db $D6,$E4,$EB,$EB,$DC               ;018D49|        |      ;
                       db $00,$C8,$DA,$EB,$EB               ;018D4E|        |      ;
                       db $00,$E7,$E0,$F5,$E4               ;018D53|        |      ;
                       db $00,$F3,$EE,$FF                   ;018D58|        |      ;
 
         DATA8_018D5C: db $E5,$E8,$ED,$E3,$00               ;018D5C|        |      ;
                       db $F2,$EE,$EC,$E4,$EE               ;018D61|        |      ;
                       db $ED,$E4,$00,$E4,$EB               ;018D66|        |      ;
                       db $F2,$E4,$DB,$FF                   ;018D6B|        |      ;
 
         DATA8_018D6F: db $CF,$EB,$E4,$E0,$F2               ;018D6F|        |      ;
                       db $E4,$00,$E1,$E4,$00               ;018D74|        |      ;
                       db $E2,$E0,$F1,$E4,$E5               ;018D79|        |      ;
                       db $F4,$EB,$FA,$FF                   ;018D7E|        |      ;
                       LDY.B #$01                           ;018D82|A001    |      ;
                       BNE CODE_018D88                      ;018D84|D002    |018D88;
 
          CODE_018D86: LDY.B #$00                           ;018D86|A000    |      ;
 
          CODE_018D88: LDA.W $07F0                          ;018D88|ADF007  |0107F0;
                       BPL UNREACH_018DB1                   ;018D8B|1024    |018DB1;
                       DEC.W $07F0                          ;018D8D|CEF007  |0107F0;
                       LDA.W $07F0                          ;018D90|ADF007  |0107F0;
                       AND.B #$7F                           ;018D93|297F    |      ;
                       BNE CODE_018DB0                      ;018D95|D019    |018DB0;
                       TYA                                  ;018D97|98      |      ;
                       PHA                                  ;018D98|48      |      ;
                       JSR.W CODE_0192DA                    ;018D99|20DA92  |0192DA;
                       PLA                                  ;018D9C|68      |      ;
                       TAY                                  ;018D9D|A8      |      ;
                       CPY.B #$00                           ;018D9E|C000    |      ;
                       BEQ UNREACH_018DA8                   ;018DA0|F006    |018DA8;
                       DEC.W $07F3                          ;018DA2|CEF307  |0107F3;
                       JMP.W CODE_018DAB                    ;018DA5|4CAB8D  |018DAB;
 
 
       UNREACH_018DA8: db $EE,$F3,$07                       ;018DA8|        |0107F3;
 
          CODE_018DAB: LDA.B #$07                           ;018DAB|A907    |      ;
                       STA.W $07F0                          ;018DAD|8DF007  |0107F0;
 
          CODE_018DB0: RTS                                  ;018DB0|60      |      ;
 
 
       UNREACH_018DB1: db $CE,$F0,$07,$F0,$E1               ;018DB1|        |0107F0;
                       db $AD,$F3,$07,$0A,$A8               ;018DB6|        |0107F3;
                       db $B9,$73,$91,$85,$06               ;018DBB|        |019173;
                       db $B9,$74,$91,$85,$07               ;018DC0|        |019174;
                       db $B9,$50,$8F,$85,$04               ;018DC5|        |018F50;
                       db $B9,$51,$8F,$85,$05               ;018DCA|        |018F51;
                       db $A9,$00,$85,$10,$AD               ;018DCF|        |      ;
                       db $F1,$07,$0A,$26,$10               ;018DD4|        |000007;
                       db $0A,$26,$10,$0A,$26               ;018DD9|        |      ;
                       db $10,$0A,$26,$10,$0A               ;018DDE|        |018DEA;
                       db $26,$10,$18,$65,$06               ;018DE3|        |000010;
                       db $85,$06,$85,$08,$A5               ;018DE8|        |000006;
                       db $07,$65,$10,$85,$07               ;018DED|        |000065;
                       db $05,$17,$85,$09,$A6               ;018DF2|        |000017;
                       db $1D,$A9,$01,$20,$21               ;018DF7|        |0101A9;
                       db $8A,$A5,$08,$20,$21               ;018DFC|        |      ;
                       db $8A,$A5,$09,$20,$21               ;018E01|        |      ;
                       db $8A,$AC,$F2,$07,$B1               ;018E06|        |      ;
                       db $04,$C9,$FF,$F0,$5E               ;018E0B|        |0000C9;
                       db $C9,$FE,$F0,$73,$C9               ;018E10|        |      ;
                       db $03,$F0,$40,$C9,$01               ;018E15|        |0000F0;
                       db $F0,$1E,$85,$0E,$C8               ;018E1A|        |018E3A;
                       db $B1,$04,$85,$0F,$18               ;018E1F|        |000004;
                       db $65,$06,$85,$06,$85               ;018E24|        |000006;
                       db $08,$A5,$0E,$20,$21               ;018E29|        |      ;
                       db $8A,$C6,$0F,$D0,$F9               ;018E2E|        |      ;
                       db $C8,$8C,$F2,$07,$4C               ;018E33|        |      ;
                       db $07,$8E,$C8,$8C,$F2               ;018E38|        |00008E;
                       db $07,$B1,$04,$85,$0D               ;018E3D|        |0000B1;
                       db $20,$9F,$8E,$AC,$F2               ;018E42|        |018E9F;
                       db $07,$B1,$04,$18,$65               ;018E47|        |0000B1;
                       db $06,$85,$06,$85,$08               ;018E4C|        |000085;
                       db $C8,$8C,$F2,$07,$4C               ;018E51|        |      ;
                       db $07,$8E,$C8,$B1,$04               ;018E56|        |00008E;
                       db $18,$65,$06,$85,$06               ;018E5B|        |      ;
                       db $85,$08,$C8,$8C,$F2               ;018E60|        |000008;
                       db $07,$A9,$FF,$20,$21               ;018E65|        |0000A9;
                       db $8A,$4C,$F8,$8D,$C8               ;018E6A|        |      ;
                       db $8C,$F2,$07,$EE,$F1               ;018E6F|        |0107F2;
                       db $07,$A9,$FF,$20,$21               ;018E74|        |0000A9;
                       db $8A,$86,$1D,$AD,$F1               ;018E79|        |      ;
                       db $07,$29,$01,$F0,$03               ;018E7E|        |000029;
                       db $4C,$B6,$8D,$60,$A9               ;018E83|        |018DB6;
                       db $FF,$20,$21,$8A,$86               ;018E88|        |8A2120;
                       db $1D,$AD,$F0,$07,$09               ;018E8D|        |01F0AD;
                       db $80,$8D,$F0,$07,$A9               ;018E92|        |018E21;
                       db $00,$8D,$F2,$07,$8D               ;018E97|        |      ;
                       db $F1,$07,$60,$20,$BD               ;018E9C|        |000007;
                       db $8E,$20,$FA,$8E,$20               ;018EA1|        |01FA20;
                       db $21,$8A,$E6,$0C,$C6               ;018EA6|        |00008A;
                       db $0D,$F0,$0E,$A5,$0C               ;018EAB|        |010EF0;
                       db $C9,$04,$D0,$EE,$E6               ;018EB0|        |      ;
                       db $0A,$A9,$00,$85,$0C               ;018EB5|        |      ;
                       db $F0,$E6,$60,$A5,$06               ;018EBA|        |018EA2;
                       db $38,$E9,$80,$85,$0C               ;018EBF|        |      ;
                       db $A5,$07,$E9,$00,$85               ;018EC4|        |000007;
                       db $0B,$A5,$0C,$29,$80               ;018EC9|        |      ;
                       db $85,$01,$A5,$0B,$29               ;018ECE|        |000001;
                       db $03,$4A,$66,$01,$4A               ;018ED3|        |00004A;
                       db $66,$01,$4A,$66,$01               ;018ED8|        |000001;
                       db $4A,$66,$01,$A5,$0C               ;018EDD|        |      ;
                       db $29,$1F,$4A,$4A,$05               ;018EE2|        |      ;
                       db $01,$85,$0A,$A5,$0C               ;018EE7|        |000085;
                       db $29,$60,$4A,$4A,$4A               ;018EEC|        |      ;
                       db $85,$0B,$A5,$0C,$29               ;018EF1|        |00000B;
                       db $03,$85,$0C,$60,$20               ;018EF6|        |000085;
                       db $3C,$8F,$A4,$0A,$C8               ;018EFB|        |01A48F;
                       db $20,$86,$EB,$A5,$32               ;018F00|        |01EB86;
                       db $0A,$A8,$20,$66,$EB               ;018F05|        |      ;
                       db $A9,$00,$06,$00,$2A               ;018F0A|        |      ;
                       db $06,$00,$2A,$06,$00               ;018F0F|        |000000;
                       db $2A,$06,$00,$2A,$85               ;018F14|        |      ;
                       db $01,$A5,$02,$18,$65               ;018F19|        |0000A5;
                       db $00,$85,$00,$A5,$01               ;018F1E|        |      ;
                       db $65,$03,$85,$01,$A5               ;018F23|        |000003;
                       db $0B,$18,$65,$0C,$85               ;018F28|        |      ;
                       db $02,$20,$9C,$EB,$A5               ;018F2D|        |      ;
                       db $02,$60,$00,$00,$30               ;018F32|        |      ;
                       db $00,$00,$00,$00,$30               ;018F37|        |      ;
                       db $20,$5D,$EB,$A4,$32               ;018F3C|        |01EB5D;
                       db $B9,$34,$8F,$18,$65               ;018F41|        |018F34;
                       db $00,$85,$00,$A5,$01               ;018F46|        |      ;
                       db $69,$00,$85,$01,$60               ;018F4B|        |      ;
                       db $5E,$8F,$7F,$8F,$A5               ;018F50|        |017F8F;
                       db $8F,$E3,$8F,$39,$90               ;018F55|        |398FE3;
                       db $A7,$90,$2D,$91,$01               ;018F5A|        |000090;
                       db $18,$FF,$01,$18,$FF               ;018F5F|        |      ;
                       db $01,$18,$FF,$01,$18               ;018F64|        |000018;
                       db $FF,$01,$18,$FF,$01               ;018F69|        |FF1801;
                       db $18,$FF,$01,$18,$FF               ;018F6E|        |      ;
                       db $01,$18,$FF,$01,$18               ;018F73|        |000018;
                       db $FF,$01,$18,$FF,$01               ;018F78|        |FF1801;
                       db $18,$FE,$01,$18,$FF               ;018F7D|        |      ;
                       db $01,$18,$FF,$01,$18               ;018F82|        |000018;
                       db $FF,$01,$18,$FF,$01               ;018F87|        |FF1801;
                       db $0A,$00,$04,$01,$0A               ;018F8C|        |      ;
                       db $FF,$01,$0A,$00,$04               ;018F91|        |000A01;
                       db $01,$0A,$FF,$01,$18               ;018F96|        |00000A;
                       db $FF,$01,$18,$FF,$01               ;018F9B|        |FF1801;
                       db $18,$FF,$01,$18,$FE               ;018FA0|        |      ;
                       db $01,$18,$FF,$01,$18               ;018FA5|        |000018;
                       db $FF,$01,$18,$FF,$01               ;018FAA|        |FF1801;
                       db $09,$00,$06,$01,$09               ;018FAF|        |      ;
                       db $FF,$01,$09,$00,$01               ;018FB4|        |000901;
                       db $31,$01,$32,$02,$33               ;018FB9|        |000001;
                       db $01,$00,$01,$01,$09               ;018FBE|        |000000;
                       db $FF,$01,$09,$00,$01               ;018FC3|        |000901;
                       db $34,$01,$32,$02,$35               ;018FC8|        |000001;
                       db $01,$00,$01,$01,$09               ;018FCD|        |000000;
                       db $FF,$01,$09,$00,$06               ;018FD2|        |000901;
                       db $01,$09,$FF,$01,$18               ;018FD7|        |000009;
                       db $FF,$01,$18,$FF,$01               ;018FDC|        |FF1801;
                       db $18,$FE,$01,$18,$FF               ;018FE1|        |      ;
                       db $01,$18,$FF,$01,$07               ;018FE6|        |000018;
                       db $00,$0A,$01,$07,$FF               ;018FEB|        |      ;
                       db $01,$07,$00,$01,$31               ;018FF0|        |000007;
                       db $01,$32,$06,$33,$01               ;018FF5|        |000032;
                       db $00,$01,$01,$07,$FF               ;018FFA|        |      ;
                       db $01,$07,$00,$01,$30               ;018FFF|        |000007;
                       db $01,$00,$06,$30,$01               ;019004|        |000000;
                       db $00,$01,$01,$07,$FF               ;019009|        |      ;
                       db $01,$07,$00,$01,$30               ;01900E|        |000007;
                       db $01,$00,$06,$30,$01               ;019013|        |000000;
                       db $00,$01,$01,$07,$FF               ;019018|        |      ;
                       db $01,$07,$00,$01,$34               ;01901D|        |000007;
                       db $01,$32,$06,$35,$01               ;019022|        |000032;
                       db $00,$01,$01,$07,$FF               ;019027|        |      ;
                       db $01,$07,$00,$0A,$01               ;01902C|        |000007;
                       db $07,$FF,$01,$18,$FF               ;019031|        |0000FF;
                       db $01,$18,$FE,$01,$18               ;019036|        |000018;
                       db $FF,$01,$05,$00,$0E               ;01903B|        |000501;
                       db $01,$05,$FF,$01,$05               ;019040|        |000005;
                       db $00,$01,$31,$01,$32               ;019045|        |      ;
                       db $0A,$33,$01,$00,$01               ;01904A|        |      ;
                       db $01,$05,$FF,$01,$05               ;01904F|        |000005;
                       db $00,$01,$30,$01,$00               ;019054|        |      ;
                       db $0A,$30,$01,$00,$01               ;019059|        |      ;
                       db $01,$05,$FF,$01,$05               ;01905E|        |000005;
                       db $00,$01,$30,$01,$00               ;019063|        |      ;
                       db $0A,$30,$01,$00,$01               ;019068|        |      ;
                       db $01,$05,$FF,$01,$05               ;01906D|        |000005;
                       db $00,$01,$30,$01,$00               ;019072|        |      ;
                       db $0A,$30,$01,$00,$01               ;019077|        |      ;
                       db $01,$05,$FF,$01,$05               ;01907C|        |000005;
                       db $00,$01,$30,$01,$00               ;019081|        |      ;
                       db $0A,$30,$01,$00,$01               ;019086|        |      ;
                       db $01,$05,$FF,$01,$05               ;01908B|        |000005;
                       db $00,$01,$34,$01,$32               ;019090|        |      ;
                       db $0A,$35,$01,$00,$01               ;019095|        |      ;
                       db $01,$05,$FF,$01,$05               ;01909A|        |000005;
                       db $00,$0E,$01,$05,$FF               ;01909F|        |      ;
                       db $01,$18,$FE,$01,$02               ;0190A4|        |000018;
                       db $00,$14,$01,$02,$FF               ;0190A9|        |      ;
                       db $01,$02,$00,$01,$31               ;0190AE|        |000002;
                       db $01,$32,$10,$33,$01               ;0190B3|        |000032;
                       db $00,$01,$01,$02,$FF               ;0190B8|        |      ;
                       db $01,$02,$00,$01,$30               ;0190BD|        |000002;
                       db $01,$00,$10,$30,$01               ;0190C2|        |000000;
                       db $00,$01,$01,$02,$FF               ;0190C7|        |      ;
                       db $01,$02,$00,$01,$30               ;0190CC|        |000002;
                       db $01,$00,$10,$30,$01               ;0190D1|        |000000;
                       db $00,$01,$01,$02,$FF               ;0190D6|        |      ;
                       db $01,$02,$00,$01,$30               ;0190DB|        |000002;
                       db $01,$00,$10,$30,$01               ;0190E0|        |000000;
                       db $00,$01,$01,$02,$FF               ;0190E5|        |      ;
                       db $01,$02,$00,$01,$30               ;0190EA|        |000002;
                       db $01,$00,$10,$30,$01               ;0190EF|        |000000;
                       db $00,$01,$01,$02,$FF               ;0190F4|        |      ;
                       db $01,$02,$00,$01,$30               ;0190F9|        |000002;
                       db $01,$00,$10,$30,$01               ;0190FE|        |000000;
                       db $00,$01,$01,$02,$FF               ;019103|        |      ;
                       db $01,$02,$00,$01,$30               ;019108|        |000002;
                       db $01,$00,$10,$30,$01               ;01910D|        |000000;
                       db $00,$01,$01,$02,$FF               ;019112|        |      ;
                       db $01,$02,$00,$01,$34               ;019117|        |000002;
                       db $01,$32,$10,$35,$01               ;01911C|        |000032;
                       db $00,$01,$01,$02,$FF               ;019121|        |      ;
                       db $01,$02,$00,$14,$01               ;019126|        |000002;
                       db $02,$FE,$31,$01,$32               ;01912B|        |      ;
                       db $16,$33,$01,$FF,$30               ;019130|        |000033;
                       db $01,$00,$16,$30,$01               ;019135|        |000000;
                       db $FF,$30,$01,$00,$16               ;01913A|        |000130;
                       db $30,$01,$FF,$30,$01               ;01913F|        |019142;
                       db $00,$16,$30,$01,$FF               ;019144|        |      ;
                       db $30,$01,$00,$16,$30               ;019149|        |01914C;
                       db $01,$FF,$30,$01,$00               ;01914E|        |0000FF;
                       db $16,$30,$01,$FF,$30               ;019153|        |000030;
                       db $01,$00,$16,$30,$01               ;019158|        |000000;
                       db $FF,$30,$01,$00,$16               ;01915D|        |000130;
                       db $30,$01,$FF,$30,$01               ;019162|        |019165;
                       db $00,$16,$30,$01,$FF               ;019167|        |      ;
                       db $34,$01,$32,$16,$35               ;01916C|        |000001;
                       db $01,$FE,$84,$00,$84               ;019171|        |0000FE;
                       db $00,$84,$00,$84,$00               ;019176|        |      ;
                       db $84,$00,$84,$00,$84               ;01917B|        |000000;
                       db $00                               ;019180|        |      ;
 
       UNREACH_019181: db $20,$82,$E1,$A9,$00               ;019181|        |01E182;
                       db $85,$FD,$85,$FC,$A9               ;019186|        |0000FD;
                       db $20,$85,$00,$20,$1C               ;01918B|        |010085;
                       db $92,$A9,$24,$85,$00               ;019190|        |0000A9;
                       db $20,$1C,$92,$A9,$24               ;019195|        |01921C;
                       db $85,$07,$20,$CF,$91               ;01919A|        |000007;
                       db $A9,$20,$85,$07,$20               ;01919F|        |      ;
                       db $CF,$91,$A9,$23,$85               ;0191A4|        |23A991;
                       db $00,$20,$3C,$92,$A9               ;0191A9|        |      ;
                       db $27,$85,$00,$20,$3C               ;0191AE|        |000085;
                       db $92,$A5,$FF,$29,$67               ;0191B3|        |0000A5;
                       db $09,$04,$8D,$00,$20               ;0191B8|        |      ;
                       db $A9,$20,$85,$00,$20               ;0191BD|        |      ;
                       db $65,$92,$A9,$24,$85               ;0191C2|        |000092;
                       db $00,$20,$65,$92,$20               ;0191C7|        |      ;
                       db $66,$ED,$60,$AD,$02               ;0191CC|        |0000ED;
                       db $20,$A5,$07,$8D,$06               ;0191D1|        |0107A5;
                       db $20,$A9,$80,$85,$06               ;0191D6|        |0180A9;
                       db $8D,$06,$20,$A9,$18               ;0191DB|        |012006;
                       db $85,$08,$A9,$20,$85               ;0191E0|        |000008;
                       db $0D,$20,$FE,$91,$C6               ;0191E5|        |01FE20;
                       db $08,$F0,$10,$A5,$06               ;0191EA|        |      ;
                       db $18,$69,$20,$85,$06               ;0191EF|        |      ;
                       db $A5,$07,$69,$00,$85               ;0191F4|        |000007;
                       db $07,$4C,$E2,$91,$60               ;0191F9|        |00004C;
                       db $20,$BD,$8E,$20,$FA               ;0191FE|        |018EBD;
                       db $8E,$8D,$07,$20,$E6               ;019203|        |01078D;
                       db $0C,$C6,$0D,$F0,$0E               ;019208|        |010DC6;
                       db $A5,$0C,$C9,$04,$D0               ;01920D|        |00000C;
                       db $EE,$E6,$0A,$A9,$00               ;019212|        |010AE6;
                       db $85,$0C,$F0,$E6,$60               ;019217|        |00000C;
                       db $AD,$02,$20,$A5,$00               ;01921C|        |012002;
                       db $8D,$06,$20,$A9,$00               ;019221|        |012006;
                       db $8D,$06,$20,$A2,$80               ;019226|        |012006;
                       db $A9,$00,$8D,$07,$20               ;01922B|        |      ;
                       db $CA,$D0,$FA,$60,$00               ;019230|        |      ;
                       db $00,$01,$00,$00,$00               ;019235|        |      ;
                       db $00,$01,$AD,$02,$20               ;01923A|        |      ;
                       db $A5,$00,$8D,$06,$20               ;01923F|        |000000;
                       db $A9,$C8,$8D,$06,$20               ;019244|        |      ;
                       db $A9,$00,$85,$07,$20               ;019249|        |      ;
                       db $3C,$8F,$A5,$07,$85               ;01924E|        |01A58F;
                       db $02,$E6,$02,$20,$FF               ;019253|        |      ;
                       db $93,$8D,$07,$20,$E6               ;019258|        |00008D;
                       db $07,$A5,$07,$C9,$38               ;01925D|        |0000A5;
                       db $D0,$E9,$60                       ;019262|        |01924D;
                       LDY.B r_stage                        ;019265|A432    |000032;
                       LDA.W getHelperScreenUpdatesIndex,Y  ;019267|B99692  |019296;
                       TAY                                  ;01926A|A8      |      ;
 
          CODE_01926B: LDA.W getHelperScreenUpdatesData,Y   ;01926B|B99E92  |01929E;
                       CMP.B #$FE                           ;01926E|C9FE    |      ;
                       BEQ CODE_019295                      ;019270|F023    |019295;
                       LDA.W $2002                          ;019272|AD0220  |012002;
                       LDA.W getHelperScreenUpdatesData,Y   ;019275|B99E92  |01929E;
                       ORA.B $00                            ;019278|0500    |000000;
                       STA.W $2006                          ;01927A|8D0620  |012006;
                       INY                                  ;01927D|C8      |      ;
                       LDA.W getHelperScreenUpdatesData,Y   ;01927E|B99E92  |01929E;
                       STA.W $2006                          ;019281|8D0620  |012006;
                       INY                                  ;019284|C8      |      ;
                       LDA.W getHelperScreenUpdatesData,Y   ;019285|B99E92  |01929E;
                       TAX                                  ;019288|AA      |      ;
                       LDA.B #$00                           ;019289|A900    |      ;
 
          CODE_01928B: STA.W $2007                          ;01928B|8D0720  |012007;
                       DEX                                  ;01928E|CA      |      ;
                       BNE CODE_01928B                      ;01928F|D0FA    |01928B;
                       INY                                  ;019291|C8      |      ;
                       JMP.W CODE_01926B                    ;019292|4C6B92  |01926B;
 
 
          CODE_019295: RTS                                  ;019295|60      |      ;
 
 
getHelperScreenUpdatesIndex: db $00,$00,$13,$00,$00               ;019296|        |      ;
                       db $00,$00,$2C                       ;01929B|        |      ;
 
getHelperScreenUpdatesData: dw $4202                             ;01929E|        |      ;
                       db $06,$02,$43,$06,$02               ;0192A0|        |      ;
                       db $9C,$04,$02,$9D,$04               ;0192A5|        |      ;
                       db $02,$9E,$04,$02,$9F               ;0192AA|        |      ;
                       db $04,$FE                           ;0192AF|        |      ;
 
getHelperSymphaUpdates: dw $8402                             ;0192B1|        |      ; get sympha Screen
                       db $02,$02,$85,$02,$02               ;0192B3|        |      ;
                       db $4E,$04,$02,$4F,$04               ;0192B8|        |      ;
                       db $02,$9C,$02,$02,$9D               ;0192BD|        |      ;
                       db $02,$02,$9E,$02,$02               ;0192C2|        |      ;
                       db $9F,$02,$FE,$02,$80               ;0192C7|        |      ;
                       db $04,$02,$81,$04,$02               ;0192CC|        |      ;
                       db $C2,$02,$02,$C3,$02               ;0192D1|        |      ;
                       db $02,$5E,$06,$FE                   ;0192D6|        |      ;
 
          CODE_0192DA: LDY.W $07F3                          ;0192DA|ACF307  |0107F3;
                       LDA.W UNREACH_019415,Y               ;0192DD|B91594  |019415;
                       STA.B $06                            ;0192E0|8506    |000006;
                       LDA.W $07F3                          ;0192E2|ADF307  |0107F3;
                       ASL A                                ;0192E5|0A      |      ;
                       TAY                                  ;0192E6|A8      |      ;
                       LDA.W UNREACH_019423,Y               ;0192E7|B92394  |019423;
                       STA.B r_currOAM_Attr                 ;0192EA|8510    |000010;
                       LDA.W UNREACH_019424,Y               ;0192EC|B92494  |019424;
                       STA.B r_collisionPointYinScreen      ;0192EF|8511    |000011;
                       LDY.W $07F3                          ;0192F1|ACF307  |0107F3;
                       LDA.W UNREACH_01941C,Y               ;0192F4|B91C94  |01941C;
                       STA.B r_temp_Xpos                    ;0192F7|850A    |00000A;
                       LDY.B #$00                           ;0192F9|A000    |      ;
                       LDX.B r_sceneDrawQueue               ;0192FB|A61D    |00001D;
                       LDA.B r_temp_Xpos                    ;0192FD|A50A    |00000A;
                       AND.B #$0F                           ;0192FF|290F    |      ;
                       LSR A                                ;019301|4A      |      ;
                       STA.B $09                            ;019302|8509    |000009;
                       LDA.B r_temp_Xpos                    ;019304|A50A    |00000A;
                       AND.B #$E0                           ;019306|29E0    |      ;
                       LSR A                                ;019308|4A      |      ;
                       LSR A                                ;019309|4A      |      ;
                       ORA.B $09                            ;01930A|0509    |000009;
                       CLC                                  ;01930C|18      |      ;
                       ADC.B #$C0                           ;01930D|69C0    |      ;
                       STA.B $09                            ;01930F|8509    |000009;
                       LDA.B $17                            ;019311|A517    |000017;
                       ORA.B #$03                           ;019313|0903    |      ;
                       STA.B r_pointerQueue_VRAM            ;019315|8508    |000008;
                       LDA.B #$0A                           ;019317|A90A    |      ;
                       JSR.W CODE_018A21                    ;019319|20218A  |018A21;
                       LDA.B $09                            ;01931C|A509    |000009;
                       JSR.W CODE_018A21                    ;01931E|20218A  |018A21;
                       LDA.B r_pointerQueue_VRAM            ;019321|A508    |000008;
                       JSR.W CODE_018A21                    ;019323|20218A  |018A21;
                       LDA.B $06                            ;019326|A506    |000006;
                       JSR.W CODE_018A21                    ;019328|20218A  |018A21;
                       STX.B r_15                           ;01932B|8615    |000015;
                       LDA.B r_temp_Xpos                    ;01932D|A50A    |00000A;
                       STA.B $0B                            ;01932F|850B    |00000B;
                       LDA.B (r_currOAM_Attr),Y             ;019331|B110    |000010;
                       CMP.B #$FE                           ;019333|C9FE    |      ;
                       BNE UNREACH_01933A                   ;019335|D003    |01933A;
                       JMP.W CODE_0193D3                    ;019337|4CD393  |0193D3;
 
 
       UNREACH_01933A: db $C9,$FF,$F0,$3F,$85               ;01933A|        |      ;
                       db $12,$C8,$B1,$10,$85               ;01933F|        |0000C8;
                       db $07,$A5,$0B,$29,$01               ;019344|        |0000A5;
                       db $F0,$06,$A9,$F3,$85               ;019349|        |019351;
                       db $14,$D0,$0C,$20,$D6               ;01934E|        |0000D0;
                       db $93,$A5,$16,$9D,$00               ;019353|        |0000A5;
                       db $03,$A9,$FC,$85,$14               ;019358|        |0000A9;
                       db $A5,$12,$F0,$03,$4C               ;01935D|        |000012;
                       db $6C,$93,$BD,$00,$03               ;019362|        |00BD93;
                       db $25,$14,$9D,$00,$03               ;019367|        |000014;
                       db $A5,$0B,$29,$01,$F0               ;01936C|        |00000B;
                       db $01,$E8,$E6,$0B,$C6               ;019371|        |0000E8;
                       db $07,$D0,$CC,$C8,$4C               ;019376|        |0000D0;
                       db $31,$93,$C8,$A5,$0A               ;01937B|        |000093;
                       db $18,$69,$10,$85,$0A               ;019380|        |      ;
                       db $A6,$15,$B1,$10,$C9               ;019385|        |000015;
                       db $FE,$F0,$46,$C9,$FF               ;01938A|        |0146F0;
                       db $F0,$37,$85,$12,$C8               ;01938F|        |0193C8;
                       db $B1,$10,$85,$07,$A5               ;019394|        |000010;
                       db $0B,$29,$01,$F0,$06               ;019399|        |      ;
                       db $A9,$3F,$85,$14,$D0               ;01939E|        |      ;
                       db $04,$A9,$CF,$85,$14               ;0193A3|        |0000A9;
                       db $A5,$12,$F0,$03,$4C               ;0193A8|        |000012;
                       db $B7,$93,$BD,$00,$03               ;0193AD|        |000093;
                       db $25,$14,$9D,$00,$03               ;0193B2|        |000014;
                       db $A5,$0B,$29,$01,$F0               ;0193B7|        |00000B;
                       db $01,$E8,$E6,$0B,$C6               ;0193BC|        |0000E8;
                       db $07,$D0,$D4,$C8,$4C               ;0193C1|        |0000D0;
                       db $87,$93,$C8,$A5,$0A               ;0193C6|        |000093;
                       db $18,$69,$10,$85,$0A               ;0193CB|        |      ;
                       db $4C,$FD,$92                       ;0193D0|        |0192FD;
 
          CODE_0193D3: STX.B r_sceneDrawQueue               ;0193D3|861D    |00001D;
                       RTS                                  ;0193D5|60      |      ;
 
                       db $84,$0E,$A5,$10,$48               ;0193D6|        |00000E;
                       db $A5,$11,$48,$20,$3C               ;0193DB|        |000011;
                       db $8F,$68,$85,$11,$68               ;0193E0|        |118568;
                       db $85,$10,$A5,$0B,$38               ;0193E5|        |000010;
                       db $E9,$20,$85,$0C,$29               ;0193EA|        |      ;
                       db $E0,$4A,$4A,$85,$0F               ;0193EF|        |      ;
                       db $A5,$0C,$29,$0F,$4A               ;0193F4|        |00000C;
                       db $05,$0F,$85,$02,$E6               ;0193F9|        |00000F;
                       db $02,$20,$9C,$EB,$A5               ;0193FE|        |      ;
                       db $02,$85,$00,$A5,$32               ;019403|        |      ;
                       db $0A,$A8,$20,$76,$EB               ;019408|        |      ;
                       db $20,$90,$EB,$A5,$16               ;01940D|        |01EB90;
                       db $A4,$0E,$60                       ;019412|        |00000E;
 
       UNREACH_019415: db $02,$02,$04,$06,$06               ;019415|        |      ;
                       db $06,$06                           ;01941A|        |000006;
 
       UNREACH_01941C: db $46,$26,$24,$22,$22               ;01941C|        |000026;
                       db $22,$22                           ;019421|        |943122;
 
       UNREACH_019423: db $31                               ;019423|        |000094;
 
       UNREACH_019424: db $94,$34,$94,$40,$94               ;019424|        |000034;
                       db $50,$94,$6B,$94,$86               ;019429|        |0193BF;
                       db $94,$A9,$94,$01,$04               ;01942E|        |0000A9;
                       db $FE,$01,$04,$FF,$01               ;019433|        |010401;
                       db $04,$FF,$01,$04,$FF               ;019438|        |0000FF;
                       db $01,$04,$FE,$01,$08               ;01943D|        |000004;
                       db $FF,$01,$08,$FF,$01               ;019442|        |FF0801;
                       db $03,$00,$02,$01,$03               ;019447|        |000000;
                       db $FF,$01,$08,$FE,$01               ;01944C|        |FE0801;
                       db $0C,$FF,$01,$04,$00               ;019451|        |0101FF;
                       db $04,$01,$04,$FF,$01               ;019456|        |000001;
                       db $04,$00,$04,$01,$04               ;01945B|        |000000;
                       db $FF,$01,$04,$00,$04               ;019460|        |000401;
                       db $01,$04,$FF,$01,$0C               ;019465|        |000004;
                       db $FE,$01,$0C,$FF,$01               ;01946A|        |010C01;
                       db $03,$00,$06,$01,$03               ;01946F|        |000000;
                       db $FF,$01,$03,$00,$06               ;019474|        |000301;
                       db $01,$03,$FF,$01,$03               ;019479|        |000003;
                       db $00,$06,$01,$03,$FF               ;01947E|        |      ;
                       db $01,$0C,$FE,$01,$01               ;019483|        |00000C;
                       db $00,$0A,$01,$01,$FF               ;019488|        |      ;
                       db $01,$01,$00,$0A,$01               ;01948D|        |000001;
                       db $01,$FF,$01,$01,$00               ;019492|        |0000FF;
                       db $0A,$01,$01,$FF,$01               ;019497|        |      ;
                       db $01,$00,$0A,$01,$01               ;01949C|        |000000;
                       db $FF,$01,$01,$00,$0A               ;0194A1|        |000101;
                       db $01,$01,$FE,$00,$0C               ;0194A6|        |000001;
                       db $FF,$00,$0C,$FF,$00               ;0194AB|        |FF0C00;
                       db $0C,$FF,$00,$0C,$FF               ;0194B0|        |0100FF;
                       db $00,$0C,$FE,$AD,$EC               ;0194B5|        |      ;
                       db $07,$D0,$01,$60,$A9               ;0194BA|        |0000D0;
                       db $00,$85,$07,$A2,$01               ;0194BF|        |      ;
                       db $BD,$4E,$05,$F0,$0F               ;0194C4|        |01054E;
                       db $0A,$A8,$B9,$E1,$94               ;0194C9|        |      ;
                       db $85,$00,$B9,$E2,$94               ;0194CE|        |000000;
                       db $85,$01,$20,$DE,$94               ;0194D3|        |000001;
                       db $E8,$E0,$0C,$D0,$E7               ;0194D8|        |      ;
                       db $60,$6C,$00,$00,$EF               ;0194DD|        |      ;
                       db $97,$F1,$94,$49,$95               ;0194E2|        |0000F1;
                       db $1D,$95,$75,$95,$C4               ;0194E7|        |017595;
                       db $95,$9A,$96,$7B,$97               ;0194EC|        |00009A;
                       db $A0,$00,$20,$A9,$95               ;0194F1|        |      ;
                       db $60,$EF,$97,$EF,$97               ;0194F6|        |      ;
                       db $EF,$97,$EF,$97,$77               ;0194FB|        |97EF97;
                       db $98,$2E,$9D,$3F,$9A               ;019500|        |      ;
                       db $EF,$97,$0B,$9B,$20               ;019505|        |9B0B97;
                       db $9B,$ED,$9B,$20,$9C               ;01950A|        |      ;
                       db $8F,$9C,$EF,$97,$EF               ;01950F|        |97EF9C;
                       db $97,$AE,$9B,$B9,$9B               ;019514|        |0000AE;
                       db $2A,$9A,$18,$9C,$A0               ;019519|        |      ;
                       db $04,$20,$A9,$95,$60               ;01951E|        |000020;
                       db $EF,$97,$01,$98,$EA               ;019523|        |980197;
                       db $97,$EF,$97,$77,$98               ;019528|        |0000EF;
                       db $2E,$9D,$3F,$9A,$DA               ;01952D|        |013F9D;
                       db $9B,$0B,$9B,$20,$9B               ;019532|        |      ;
                       db $ED,$9B,$20,$9C,$8F               ;019537|        |01209B;
                       db $9C,$EF,$97,$EF,$97               ;01953C|        |0197EF;
                       db $EF,$97,$EF,$97,$2A               ;019541|        |97EF97;
                       db $9A,$18,$9C,$A0,$02               ;019546|        |      ;
                       db $20,$A9,$95,$60,$EF               ;01954B|        |0195A9;
                       db $97,$EF,$97,$C2,$98               ;019550|        |0000EF;
                       db $EF,$97,$77,$98,$2E               ;019555|        |987797;
                       db $9D,$3F,$9A,$EF,$97               ;01955A|        |019A3F;
                       db $0B,$9B,$20,$9B,$ED               ;01955F|        |      ;
                       db $9B,$20,$9C,$8F,$9C               ;019564|        |      ;
                       db $C4,$9B,$EF,$97,$EF               ;019569|        |00009B;
                       db $97,$EF,$97,$2A,$9A               ;01956E|        |0000EF;
                       db $18,$9C,$A0,$06,$20               ;019573|        |      ;
                       db $A9,$95,$60,$EF,$97               ;019578|        |      ;
                       db $EF,$97,$EF,$97,$CD               ;01957D|        |97EF97;
                       db $99,$77,$98,$2E,$9D               ;019582|        |019877;
                       db $3F,$9A,$EF,$97,$0B               ;019587|        |97EF9A;
                       db $9B,$20,$9B,$ED,$9B               ;01958C|        |      ;
                       db $20,$9C,$8F,$9C,$EF               ;019591|        |018F9C;
                       db $97,$CF,$9B,$EF,$97               ;019596|        |0000CF;
                       db $EF,$97,$2A,$9A,$18               ;01959B|        |9A2A97;
                       db $9C,$F7,$94,$4F,$95               ;0195A0|        |0194F7;
                       db $23,$95,$7B,$95,$B9               ;0195A5|        |000095;
                       db $A1,$95,$85,$00,$B9               ;0195AA|        |000095;
                       db $A2,$95,$85,$01,$AD               ;0195AF|        |      ;
                       db $EF,$07,$0A,$A8,$B1               ;0195B4|        |A80A07;
                       db $00,$85,$02,$C8,$B1               ;0195B9|        |      ;
                       db $00,$85,$03,$6C,$02               ;0195BE|        |      ;
                       db $00,$BC,$1D,$06,$D0               ;0195C3|        |      ;
                       db $3E,$A9,$88,$9D,$70               ;0195C8|        |0188A9;
                       db $04,$A9,$00,$9D,$1C               ;0195CD|        |0000A9;
                       db $04,$BD,$06,$06,$18               ;0195D2|        |0000BD;
                       db $7D,$33,$06,$29,$0F               ;0195D7|        |010633;
                       db $A8,$B9,$8A,$96,$9D               ;0195DC|        |      ;
                       db $38,$04,$FE,$1D,$06               ;0195E1|        |      ;
                       db $A9,$00,$9D,$F2,$04               ;0195E6|        |      ;
                       db $9D,$09,$05,$9D,$20               ;0195EB|        |010509;
                       db $05,$9D,$37,$05,$A9               ;0195F0|        |00009D;
                       db $0C,$A0,$09,$20,$FD               ;0195F5|        |0109A0;
                       db $9D,$20,$0D,$9E,$BD               ;0195FA|        |010D20;
                       db $06,$06,$0A,$0A,$9D               ;0195FF|        |000006;
                       db $45,$06,$60,$88,$D0               ;019604|        |000006;
                       db $11,$DE,$45,$06,$BD               ;019609|        |0000DE;
                       db $45,$06,$D0,$08,$FE               ;01960E|        |000006;
                       db $1D,$06,$A9,$40,$9D               ;019613|        |01A906;
                       db $70,$04,$60,$88,$D0               ;019618|        |01961E;
                       db $24,$BD,$37,$05,$18               ;01961D|        |0000BD;
                       db $69,$20,$9D,$37,$05               ;019622|        |      ;
                       db $BD,$20,$05,$69,$00               ;019627|        |010520;
                       db $9D,$20,$05,$20,$D6               ;01962C|        |010520;
                       db $9D,$BD,$1C,$04,$C9               ;019631|        |011CBD;
                       db $B8,$90,$08,$A9,$11               ;019636|        |      ;
                       db $20,$5F,$E2,$FE,$1D               ;01963B|        |01E25F;
                       db $06,$60,$88,$D0,$0E               ;019640|        |000060;
                       db $A9,$0E,$A0,$0A,$20               ;019645|        |      ;
                       db $FD,$9D,$20,$0D,$9E               ;01964A|        |01209D;
                       db $FE,$1D,$06,$60,$88               ;01964F|        |01061D;
                       db $D0,$09,$20,$0D,$9E               ;019654|        |01965F;
                       db $90,$03,$FE,$1D,$06               ;019659|        |01965E;
                       db $60,$A9,$00,$9D,$1D               ;01965E|        |      ;
                       db $06,$FE,$33,$06,$BD               ;019663|        |0000FE;
                       db $33,$06,$C9,$02,$F0               ;019668|        |000006;
                       db $01,$60                           ;01966D|        |000060;
 
          CODE_01966F: LDA.B #$00                           ;01966F|A900    |      ;
                       STA.W $054E,X                        ;019671|9D4E05  |01054E;
                       STA.W $0606,X                        ;019674|9D0606  |010606;
                       STA.W $061D,X                        ;019677|9D1D06  |01061D;
                       STA.W $0633,X                        ;01967A|9D3306  |010633;
                       STA.W $0645,X                        ;01967D|9D4506  |010645;
                       STA.W $0400,X                        ;019680|9D0004  |010400;
                       STA.W $048C,X                        ;019683|9D8C04  |01048C;
                       STA.W $05AA,X                        ;019686|9DAA05  |0105AA;
                       RTS                                  ;019689|60      |      ;
 
                       db $10,$30,$20,$50,$60               ;01968A|        |0196BC;
                       db $40,$30,$40,$80,$50               ;01968F|        |      ;
                       db $70,$A0,$90,$B0,$60               ;019694|        |019636;
                       db $C0,$BC,$1D,$06,$D0               ;019699|        |      ;
                       db $35,$A9,$3F,$20,$5F               ;01969E|        |0000A9;
                       db $E2,$A9,$0C,$8D,$EF               ;0196A3|        |      ;
                       db $07,$A9,$7B,$85,$49               ;0196A8|        |0000A9;
                       db $20,$3C,$E3,$A9,$00               ;0196AD|        |01E33C;
                       db $9D,$33,$06,$9D,$45               ;0196B2|        |010633;
                       db $06,$9D,$D8,$05,$A9               ;0196B7|        |00009D;
                       db $80,$9D,$70,$04,$A9               ;0196BC|        |01965B;
                       db $78,$9D,$38,$04,$A9               ;0196C1|        |      ;
                       db $90,$9D,$1C,$04,$FE               ;0196C6|        |019665;
                       db $1D,$06,$A9,$0A,$A0               ;0196CB|        |01A906;
                       db $0C,$4C,$FD,$9D,$88               ;0196D0|        |01FD4C;
                       db $D0,$5B,$BD,$D8,$05               ;0196D5|        |019732;
                       db $D0,$50,$BD,$33,$06               ;0196DA|        |01972C;
                       db $0A,$A8,$B9,$6C,$97               ;0196DF|        |      ;
                       db $9D,$D8,$05,$FE,$33               ;0196E4|        |0105D8;
                       db $06,$B9,$6B,$97,$F0               ;0196E9|        |0000B9;
                       db $36,$C9,$01,$F0,$2B               ;0196EE|        |0000C9;
                       db $FE,$1D,$06,$A9,$04               ;0196F3|        |01061D;
                       db $9D,$D8,$05,$A9,$07               ;0196F8|        |0105D8;
                       db $85,$01,$A9,$07,$20               ;0196FD|        |000001;
                       db $02,$9D,$90,$17,$A9               ;019702|        |      ;
                       db $00,$99,$1D,$06,$A5               ;019707|        |      ;
                       db $01,$99,$06,$06,$0A               ;01970C|        |000099;
                       db $0A,$18,$79,$1C,$04               ;019711|        |      ;
                       db $99,$1C,$04,$C6,$01               ;019716|        |01041C;
                       db $10,$E2,$60,$A9,$00               ;01971B|        |0196FF;
                       db $9D,$70,$04,$F0,$0A               ;019720|        |010470;
                       db $A9,$80,$9D,$70,$04               ;019725|        |      ;
                       db $D0,$03,$DE,$D8,$05               ;01972A|        |01972F;
                       db $4C,$0D,$9E,$88,$D0               ;01972F|        |019E0D;
                       db $20,$BD,$D8,$05,$F0               ;019734|        |01D8BD;
                       db $0B,$DE,$D8,$05,$A9               ;019739|        |      ;
                       db $00,$9D,$70,$04,$4C               ;01973E|        |      ;
                       db $0D,$9E,$A9,$80,$9D               ;019743|        |01A99E;
                       db $70,$04,$FE,$1D,$06               ;019748|        |01974E;
                       db $A9,$17,$85,$48,$20               ;01974D|        |      ;
                       db $3C,$E3,$60,$EE,$ED               ;019752|        |0160E3;
                       db $07,$A9,$00,$8D,$F0               ;019757|        |0000A9;
                       db $07,$20,$6F,$96,$A9               ;01975C|        |000020;
                       db $02,$9D,$4E,$05,$A9               ;019761|        |      ;
                       db $80,$9D,$70,$04,$60               ;019766|        |019705;
                       db $00,$04,$01,$02,$00               ;01976B|        |      ;
                       db $01,$01,$01,$00,$01               ;019770|        |000001;
                       db $01,$01,$00,$08,$FF               ;019775|        |000001;
                       db $00,$BC,$1D,$06,$D0               ;01977A|        |      ;
                       db $2B,$A9,$18,$9D,$00               ;01977F|        |      ;
                       db $04,$A9,$0E,$9D,$8C               ;019784|        |0000A9;
                       db $04,$BD,$06,$06,$0A               ;019789|        |0000BD;
                       db $A8,$B9,$CA,$97,$9D               ;01978E|        |      ;
                       db $37,$05,$B9,$CB,$97               ;019793|        |000005;
                       db $9D,$20,$05,$B9,$DA               ;019798|        |010520;
                       db $97,$9D,$09,$05,$B9               ;01979D|        |00009D;
                       db $DB,$97,$9D,$F2,$04               ;0197A2|        |      ;
                       db $FE,$1D,$06,$60,$BD               ;0197A7|        |01061D;
                       db $37,$05,$18,$69,$20               ;0197AC|        |000005;
                       db $9D,$37,$05,$BD,$20               ;0197B1|        |010537;
                       db $05,$69,$00,$9D,$20               ;0197B6|        |000069;
                       db $05,$20,$D6,$9D,$BD               ;0197BB|        |000020;
                       db $1C,$04,$C9,$F8,$90               ;0197C0|        |01C904;
                       db $03,$4C,$6F,$96,$60               ;0197C5|        |00004C;
                       db $00,$FF,$C0,$FE,$E0               ;0197CA|        |      ;
                       db $FE,$B0,$FE,$00,$FF               ;0197CF|        |01FEB0;
                       db $C0,$FE,$E0,$FE,$B0               ;0197D4|        |      ;
                       db $FE,$40,$00,$80,$FF               ;0197D9|        |010040;
                       db $60,$00,$60,$FF,$B0               ;0197DE|        |      ;
                       db $FF,$90,$00,$90,$FF               ;0197E3|        |900090;
                       db $B0,$00,$A9,$01,$9D               ;0197E8|        |0197EA;
                       db $54,$04,$A9,$00,$9D               ;0197ED|        |      ;
                       db $37,$05,$9D,$20,$05               ;0197F2|        |000005;
                       db $9D,$F2,$04,$9D,$F2               ;0197F7|        |0104F2;
                       db $04,$9D,$1D,$06,$60               ;0197FC|        |00009D;
                       db $AC,$F0,$07,$D0,$21               ;019801|        |0107F0;
                       db $20,$25,$9A,$A9,$2A               ;019806|        |019A25;
                       db $85,$47,$A9,$2B,$85               ;01980B|        |000047;
                       db $48,$20,$3C,$E3,$EE               ;019810|        |      ;
                       db $F0,$07,$A9,$A0,$9D               ;019815|        |01981E;
                       db $1D,$06,$A9,$0A,$A0               ;01981A|        |01A906;
                       db $00,$20,$FD,$9D,$20               ;01981F|        |      ;
                       db $0D,$9E,$60,$88,$D0               ;019824|        |01609E;
                       db $3C,$DE,$1D,$06,$A9               ;019829|        |011DDE;
                       db $00,$9D,$54,$04,$BD               ;01982E|        |      ;
                       db $1D,$06,$F0,$1C,$BD               ;019833|        |01F006;
                       db $1D,$06,$C9,$20,$90               ;019838|        |01C906;
                       db $0D,$D0,$03,$20,$33               ;01983D|        |0103D0;
                       db $9D,$29,$04,$F0,$09               ;019842|        |010429;
                       db $A9,$01,$D0,$02,$A9               ;019847|        |      ;
                       db $01,$9D,$54,$04,$4C               ;01984C|        |00009D;
                       db $0D,$9E,$A9,$01,$9D               ;019851|        |01A99E;
                       db $54,$04,$EE,$F0,$07               ;019856|        |      ;
                       db $A9,$0A,$A0,$0B,$20               ;01985B|        |      ;
                       db $FD,$9D,$20,$0D,$9E               ;019860|        |01209D;
                       db $60,$EE,$ED,$07,$A9               ;019865|        |      ;
                       db $00,$8D,$EF,$07,$8D               ;01986A|        |      ;
                       db $F0,$07,$A9,$00,$9D               ;01986F|        |019878;
                       db $1D,$06,$60,$A4,$32               ;019874|        |016006;
                       db $B9,$B6,$98,$BC,$4E               ;019879|        |0198B6;
                       db $05,$88,$18,$79,$BE               ;01987E|        |000088;
                       db $98,$85,$00,$A9,$00               ;019883|        |      ;
                       db $9D,$09,$05,$9D,$F2               ;019888|        |010509;
                       db $04,$BD,$37,$05,$18               ;01988D|        |0000BD;
                       db $69,$20,$9D,$37,$05               ;019892|        |      ;
                       db $BD,$20,$05,$69,$00               ;019897|        |010520;
                       db $9D,$20,$05,$20,$D6               ;01989C|        |010520;
                       db $9D,$BD,$1C,$04,$C5               ;0198A1|        |011CBD;
                       db $00,$90,$0C,$A5,$00               ;0198A6|        |      ;
                       db $9D,$1C,$04,$E6,$07               ;0198AB|        |01041C;
                       db $A5,$07,$8D,$F0,$07               ;0198B0|        |000007;
                       db $60,$B0,$B0,$B0,$B0               ;0198B5|        |      ;
                       db $B0,$B0,$B0,$B0,$00               ;0198BA|        |01986C;
                       db $00,$00,$F8,$BC,$1D               ;0198BF|        |      ;
                       db $06,$D0,$1C,$20,$2F               ;0198C4|        |0000D0;
                       db $9D,$FE,$1D,$06,$A9               ;0198C9|        |011DFE;
                       db $78,$9D,$38,$04,$A9               ;0198CE|        |      ;
                       db $A8,$9D,$1C,$04,$A9               ;0198D3|        |      ;
                       db $00,$9D,$70,$04,$A9               ;0198D8|        |      ;
                       db $40,$A0,$0D,$4C,$C5               ;0198DD|        |      ;
                       db $99,$88,$D0,$18,$BD               ;0198E2|        |01D088;
                       db $D8,$05,$F0,$06,$DE               ;0198E7|        |      ;
                       db $D8,$05,$4C,$0D,$9E               ;0198EC|        |      ;
                       db $FE,$1D,$06,$20,$25               ;0198F1|        |01061D;
                       db $9A,$A9,$40,$A0,$0E               ;0198F6|        |      ;
                       db $4C,$C5,$99,$88,$D0               ;0198FB|        |0199C5;
                       db $15,$BD,$D8,$05,$F0               ;019900|        |0000BD;
                       db $06,$DE,$D8,$05,$4C               ;019905|        |0000DE;
                       db $0D,$9E,$FE,$1D,$06               ;01990A|        |01FE9E;
                       db $A9,$40,$A0,$0F,$4C               ;01990F|        |      ;
                       db $C5,$99,$88,$D0,$18               ;019914|        |000099;
                       db $BD,$D8,$05,$F0,$06               ;019919|        |0105D8;
                       db $DE,$D8,$05,$4C,$0D               ;01991E|        |0105D8;
                       db $9E                               ;019923|        |019320;
                       JSR.W symphaScreenUpdateStatue       ;019924|20939D  |019D93;
                       db $FE,$1D,$06,$A9,$10               ;019927|        |01061D;
                       db $A0,$10,$4C,$C5,$99               ;01992C|        |      ;
                       db $88,$D0,$45,$BD,$D8               ;019931|        |      ;
                       db $05,$F0,$15,$DE,$D8               ;019936|        |0000F0;
                       db $05,$20,$0D,$9E,$A9               ;01993B|        |000020;
                       db $00,$9D,$20,$05,$9D               ;019940|        |      ;
                       db $37,$05,$9D,$F2,$04               ;019945|        |000005;
                       db $9D,$09,$05,$60,$BD               ;01994A|        |010509;
                       db $37,$05,$18,$69,$10               ;01994F|        |000005;
                       db $9D,$37,$05,$BD,$20               ;019954|        |010537;
                       db $05,$69,$00,$9D,$20               ;019959|        |000069;
                       db $05,$20,$D6,$9D,$BD               ;01995E|        |000020;
                       db $1C,$04,$C9,$B8,$90               ;019963|        |01C904;
                       db $0F,$A9,$B8,$9D,$1C               ;019968|        |9DB8A9;
                       db $04,$FE,$1D,$06,$A9               ;01996D|        |0000FE;
                       db $10,$A0,$11,$4C,$C5               ;019972|        |019914;
                       db $99,$60,$88,$D0,$1A               ;019977|        |018860;
                       db $BD,$D8,$05,$F0,$06               ;01997C|        |0105D8;
                       db $DE,$D8,$05,$4C,$0D               ;019981|        |0105D8;
                       db $9E,$A9,$B0,$9D,$1C               ;019986|        |01B0A9;
                       db $04,$FE,$1D,$06,$A9               ;01998B|        |0000FE;
                       db $04,$A0,$13,$4C,$C5               ;019990|        |0000A0;
                       db $99,$BD,$D8,$05,$F0               ;019995|        |01D8BD;
                       db $06,$DE,$D8,$05,$4C               ;01999A|        |0000DE;
                       db $0D,$9E,$EE,$ED,$07               ;01999F|        |01EE9E;
                       db $A9,$00,$8D,$EF,$07               ;0199A4|        |      ;
                       db $8D,$F0,$07,$A9,$00               ;0199A9|        |0107F0;
                       db $9D,$1D,$06,$20,$3F               ;0199AE|        |01061D;
                       db $99,$A9,$2A,$85,$47               ;0199B3|        |012AA9;
                       db $A9,$2B,$85,$48,$20               ;0199B8|        |      ;
                       db $3C,$E3,$A9,$03,$9D               ;0199BD|        |01A9E3;
                       db $06,$06,$60,$9D,$D8               ;0199C2|        |000006;
                       db $05,$A9,$14,$4C,$FD               ;0199C7|        |0000A9;
                       db $9D,$AC,$F0,$07,$D0               ;0199CC|        |01F0AC;
                       db $1E,$20,$25,$9A,$A9               ;0199D1|        |012520;
                       db $2A,$85,$47,$A9,$2B               ;0199D6|        |      ;
                       db $85,$48,$20,$3C,$E3               ;0199DB|        |000048;
                       db $EE,$F0,$07,$A9,$0A               ;0199E0|        |0107F0;
                       db $A0,$18,$20,$FD,$9D               ;0199E5|        |      ;
                       db $A9,$A0,$9D,$1D,$06               ;0199EA|        |      ;
                       db $60,$88,$D0,$0C,$DE               ;0199EF|        |      ;
                       db $1D,$06,$D0,$04,$EE               ;0199F4|        |01D006;
                       db $F0,$07,$60,$4C,$0D               ;0199F9|        |019A02;
                       db $9E,$88,$D0,$0B,$A9               ;0199FE|        |01D088;
                       db $0A,$A0,$33,$20,$B4               ;019A03|        |      ;
                       db $9D,$EE,$F0,$07,$60               ;019A08|        |01F0EE;
                       db $88,$D0,$09,$20,$C4               ;019A0D|        |      ;
                       db $9D,$90,$03,$EE,$F0               ;019A12|        |010390;
                       db $07,$60,$EE,$ED,$07               ;019A17|        |000060;
                       db $A9,$00,$8D,$EF,$07               ;019A1C|        |      ;
                       db $8D,$F0,$07,$60,$A9               ;019A21|        |0107F0;
                       db $41,$4C,$5F,$E2,$BD               ;019A26|        |00004C;
                       db $06,$06,$38,$E9,$01               ;019A2B|        |000006;
                       db $85,$01,$A4,$01,$B9               ;019A30|        |000001;
                       db $3C,$9A,$85,$00,$4C               ;019A35|        |01859A;
                       db $4E,$9A,$B0,$50,$C0               ;019A3A|        |01B09A;
                       db $BD,$06,$06,$38,$E9               ;019A3F|        |010606;
                       db $01,$85,$01,$A4,$01               ;019A44|        |000085;
                       db $B9,$00,$9B,$85,$00               ;019A49|        |019B00;
                       db $BD,$1D,$06,$D0,$1D               ;019A4E|        |01061D;
                       db $BD,$4E,$05,$38,$E9               ;019A53|        |01054E;
                       db $01,$A8,$B9,$07,$9B               ;019A58|        |0000A8;
                       db $9D,$54,$04,$B9,$03               ;019A5D|        |010454;
                       db $9B,$A8,$A9,$0C,$20               ;019A62|        |      ;
                       db $FD,$9D,$20,$0D,$9E               ;019A67|        |01209D;
                       db $FE,$1D,$06,$60,$A9               ;019A6C|        |01061D;
                       db $01,$9D,$F2,$04,$A9               ;019A71|        |00009D;
                       db $00,$9D,$09,$05,$A9               ;019A76|        |      ;
                       db $00,$9D,$A8,$04,$BD               ;019A7B|        |      ;
                       db $70,$04,$29,$01,$F0               ;019A80|        |019A86;
                       db $0B,$A9,$80,$85,$00               ;019A85|        |      ;
                       db $BD,$38,$04,$30,$22               ;019A8A|        |010438;
                       db $10,$0A,$A5,$00,$38               ;019A8F|        |019A9B;
                       db $FD,$38,$04,$85,$00               ;019A94|        |010438;
                       db $B0,$16,$49,$FF,$18               ;019A99|        |019AB1;
                       db $69,$01,$85,$00,$A9               ;019A9E|        |      ;
                       db $FF,$9D,$F2,$04,$A9               ;019AA3|        |04F29D;
                       db $00,$9D,$09,$05,$A9               ;019AA8|        |      ;
                       db $01,$9D,$A8,$04,$A5               ;019AAD|        |00009D;
                       db $00,$C9,$03,$B0,$3B               ;019AB2|        |      ;
                       db $A9,$00,$9D,$F2,$04               ;019AB7|        |      ;
                       db $9D,$09,$05,$A9,$0E               ;019ABC|        |010509;
                       db $A4,$3A,$C0,$FF,$D0               ;019AC1|        |00003A;
                       db $02,$A9,$0A,$85,$00               ;019AC6|        |      ;
                       db $A9,$00,$9D,$A8,$04               ;019ACB|        |      ;
                       db $BD,$38,$04,$C9,$80               ;019AD0|        |010438;
                       db $90,$05,$A9,$01,$9D               ;019AD5|        |019ADC;
                       db $A8,$04,$BC,$06,$06               ;019ADA|        |      ;
                       db $B9,$F8,$9A,$0D,$F3               ;019ADF|        |019AF8;
                       db $07,$8D,$F3,$07,$C5               ;019AE4|        |00008D;
                       db $00,$D0,$06,$A9,$00               ;019AE9|        |      ;
                       db $8D,$EF,$07,$60,$20               ;019AEE|        |0107EF;
                       db $D6,$9D,$4C,$0D,$9E               ;019AF3|        |00009D;
                       db $01,$02,$04,$08,$10               ;019AF8|        |000002;
                       db $20,$40,$80,$B0,$D0               ;019AFD|        |018040;
                       db $50,$01,$02,$03,$04               ;019B02|        |019B05;
                       db $00,$02,$01,$03,$BD               ;019B07|        |      ;
                       db $06,$06,$38,$E9,$01               ;019B0C|        |000006;
                       db $85,$01,$A4,$01,$B9               ;019B11|        |000001;
                       db $1D,$9B,$85,$00,$4C               ;019B16|        |01859B;
                       db $4E,$9A,$90,$C0,$76               ;019B1B|        |01909A;
                       db $AD,$F0,$07,$D0,$34               ;019B20|        |0107F0;
                       db $A9,$4C,$20,$5F,$E2               ;019B25|        |      ;
                       db $BD,$06,$06,$C9,$03               ;019B2A|        |010606;
                       db $D0,$66,$EE,$F0,$07               ;019B2F|        |019B97;
                       db $A9,$00,$9D,$54,$04               ;019B34|        |      ;
                       db $A9,$80,$9D,$38,$04               ;019B39|        |      ;
                       db $BD,$A8,$04,$49,$01               ;019B3E|        |0104A8;
                       db $9D,$A8,$04,$BD,$4E               ;019B43|        |0104A8;
                       db $05,$38,$E9,$01,$A8               ;019B48|        |000038;
                       db $B9,$AA,$9B,$A8,$A9               ;019B4D|        |019BAA;
                       db $0C,$20,$FD,$9D,$4C               ;019B52|        |01FD20;
                       db $0D,$9E,$BD,$06,$06               ;019B57|        |01BD9E;
                       db $C9,$03,$D0,$37,$AD               ;019B5C|        |      ;
                       db $F0,$07,$C9,$80,$90               ;019B61|        |019B6A;
                       db $2A,$BD,$4E,$05,$38               ;019B66|        |      ;
                       db $E9,$01,$A8,$B9,$07               ;019B6B|        |      ;
                       db $9B,$9D,$54,$04,$A9               ;019B70|        |      ;
                       db $76,$9D,$38,$04,$A9               ;019B75|        |00009D;
                       db $00,$8D,$EF,$07,$8D               ;019B7A|        |      ;
                       db $F0,$07,$BD,$A8,$04               ;019B7F|        |019B88;
                       db $49,$01,$9D,$A8,$04               ;019B84|        |      ;
                       db $A9,$01,$8D,$F3,$07               ;019B89|        |      ;
                       db $4C,$FF,$9B,$EE,$F0               ;019B8E|        |019BFF;
                       db $07,$4C,$0D,$9E,$C9               ;019B93|        |00004C;
                       db $02,$F0,$0E,$AD,$F0               ;019B98|        |      ;
                       db $07,$10,$04,$A9,$00               ;019B9D|        |000010;
                       db $F0,$02,$A9,$88,$9D               ;019BA2|        |019BA6;
                       db $70,$04,$60,$00,$06               ;019BA7|        |019BAD;
                       db $07,$08,$AD,$F0,$07               ;019BAC|        |000008;
                       db $D0,$37,$A0,$16,$A9               ;019BB1|        |019BEA;
                       db $0C,$D0,$2A,$AD,$F0               ;019BB6|        |012AD0;
                       db $07,$D0,$2C,$A0,$17               ;019BBB|        |0000D0;
                       db $A9,$0C,$D0,$1F,$AD               ;019BC0|        |      ;
                       db $F0,$07,$D0,$21,$A0               ;019BC5|        |019BCE;
                       db $14,$A9,$0C,$D0,$14               ;019BCA|        |0000A9;
                       db $AD,$F0,$07,$D0,$16               ;019BCF|        |0107F0;
                       db $A0,$15,$A9,$0C,$D0               ;019BD4|        |      ;
                       db $09,$AD,$F0,$07,$D0               ;019BD9|        |      ;
                       db $0B,$A0,$05,$A9,$0C               ;019BDE|        |      ;
                       db $20,$FD,$9D,$EE,$F0               ;019BE3|        |019DFD;
                       db $07,$60,$4C,$0D,$9E               ;019BE8|        |000060;
                       db $AD,$F0,$07,$F0,$20               ;019BED|        |0107F0;
                       db $CE,$F0,$07,$A9,$00               ;019BF2|        |0107F0;
                       db $9D,$70,$04,$A9,$00               ;019BF7|        |010470;
                       db $9D,$1D,$06,$BD,$4E               ;019BFC|        |01061D;
                       db $05,$38,$E9,$01,$A8               ;019C01|        |000038;
                       db $B9,$03,$9B,$A8,$A9               ;019C06|        |019B03;
                       db $0C,$20,$FD,$9D,$4C               ;019C0B|        |01FD20;
                       db $0D,$9E,$A9,$01,$8D               ;019C10|        |01A99E;
                       db $F3,$07,$60,$BD,$06               ;019C15|        |000007;
                       db $06,$C9,$03,$F0,$01               ;019C1A|        |0000C9;
                       db $60,$A9,$01,$9D,$F2               ;019C1F|        |      ;
                       db $04,$A9,$00,$9D,$09               ;019C24|        |0000A9;
                       db $05,$BD,$06,$06,$C9               ;019C29|        |0000BD;
                       db $03,$D0,$0A,$A9,$FF               ;019C2E|        |0000D0;
                       db $9D,$F2,$04,$A9,$00               ;019C33|        |0104F2;
                       db $9D,$09,$05,$20,$D6               ;019C38|        |010509;
                       db $9D,$BD,$06,$06,$C9               ;019C3D|        |0106BD;
                       db $03,$D0,$0E,$BD,$38               ;019C42|        |0000D0;
                       db $04,$C9,$04,$90,$34               ;019C47|        |0000C9;
                       db $A9,$01,$9D,$A8,$04               ;019C4C|        |      ;
                       db $D0,$0C,$BD,$38,$04               ;019C51|        |019C5F;
                       db $C9,$FC,$B0,$26,$A9               ;019C56|        |      ;
                       db $00,$9D,$A8,$04,$BD               ;019C5B|        |      ;
                       db $1D,$06,$D0,$18,$FE               ;019C60|        |01D006;
                       db $1D,$06,$BD,$4E,$05               ;019C65|        |01BD06;
                       db $38,$E9,$01,$A8,$B9               ;019C6A|        |      ;
                       db $03,$9B,$A8,$A9,$0C               ;019C6F|        |00009B;
                       db $20,$FD,$9D,$A9,$40               ;019C74|        |019DFD;
                       db $9D,$70,$04,$4C,$0D               ;019C79|        |010470;
                       db $9E,$60,$A9,$00,$9D               ;019C7E|        |01A960;
                       db $4E,$05,$9D,$00,$04               ;019C83|        |019D05;
                       db $9D,$8C,$04,$9D,$AA               ;019C88|        |01048C;
                       db $05,$60,$AD,$4E,$05               ;019C8D|        |000060;
                       db $F0,$08,$BD,$06,$06               ;019C92|        |019C9C;
                       db $C9,$02,$F0,$09,$60               ;019C97|        |      ;
                       db $BD,$06,$06,$C9,$01               ;019C9C|        |010606;
                       db $F0,$01,$60,$BD,$1D               ;019CA1|        |019CA4;
                       db $06,$D0,$11,$20,$C0               ;019CA6|        |0000D0;
                       db $9C,$FE,$1D,$06,$BC               ;019CAB|        |011DFE;
                       db $4E,$05,$88,$98,$0A               ;019CB0|        |018805;
                       db $A0,$12,$4C,$FD,$9D               ;019CB5|        |      ;
                       db $20,$C0,$9C,$4C,$0D               ;019CBA|        |019CC0;
                       db $9E,$A9,$00,$85,$00               ;019CBF|        |0100A9;
                       db $A9,$70,$38,$FD,$38               ;019CC4|        |      ;
                       db $04,$B0,$07,$49,$FF               ;019CC9|        |0000B0;
                       db $18,$69,$01,$E6,$00               ;019CCE|        |      ;
                       db $C9,$20,$B0,$1D,$A9               ;019CD3|        |      ;
                       db $FF,$9D,$F2,$04,$A5               ;019CD8|        |04F29D;
                       db $00,$F0,$05,$A9,$01               ;019CDD|        |      ;
                       db $9D,$F2,$04,$A9,$00               ;019CE2|        |0104F2;
                       db $9D,$09,$05,$9D,$20               ;019CE7|        |010509;
                       db $05,$9D,$37,$05,$20               ;019CEC|        |00009D;
                       db $D6,$9D,$60,$A5,$00               ;019CF1|        |00009D;
                       db $9D,$A8,$04,$A9,$00               ;019CF6|        |0104A8;
                       db $9D,$1D,$06,$8D,$EF               ;019CFB|        |01061D;
                       db $07,$60,$85,$10,$86               ;019D00|        |000060;
                       db $16,$20,$B9,$FE,$D0               ;019D05|        |000020;
                       db $1F,$20,$6F,$96,$8A               ;019D0A|        |966F20;
                       db $A8,$A6,$16,$BD,$38               ;019D0F|        |      ;
                       db $04,$99,$38,$04,$BD               ;019D14|        |000099;
                       db $1C,$04,$99,$1C,$04               ;019D19|        |019904;
                       db $A5,$10,$99,$4E,$05               ;019D1E|        |000010;
                       db $A9,$00,$99,$54,$04               ;019D23|        |      ;
                       db $38,$60,$A6,$16,$18               ;019D28|        |      ;
                       db $60,$60,$A0,$02,$D0               ;019D2D|        |      ;
                       db $02,$A0,$00,$B9,$69               ;019D32|        |      ;
                       db $9D,$85,$00,$B9,$6A               ;019D37|        |010085;
                       db $9D,$85,$01,$86,$16               ;019D3C|        |010185;
                       db $A6,$1D,$A0,$00,$A9               ;019D41|        |00001D;
                       db $01,$9D,$00,$03,$E8               ;019D46|        |00009D;
                       db $B1,$00,$C9,$FF,$F0               ;019D4B|        |000000;
                       db $08,$9D,$00,$03,$C8               ;019D50|        |      ;
                       db $E8,$4C,$4B,$9D,$A9               ;019D55|        |      ;
                       db $FF,$9D,$00,$03,$E8               ;019D5A|        |03009D;
                       db $86,$1D,$A9,$04,$20               ;019D5F|        |00001D;
                       db $E9,$EC,$A6,$16,$60               ;019D64|        |      ;
 
       UNREACH_019D69: db $6D                               ;019D69|        |01809D;
 
       UNREACH_019D6A: db $9D,$80,$9D,$10,$3F               ;019D6A|        |019D80;
                       db $0F,$08,$26,$37,$0F               ;019D6F|        |372608;
                       db $08,$15,$35,$0F,$21               ;019D74|        |      ;
                       db $11,$20,$0F,$0F,$15               ;019D79|        |000020;
                       db $36,$FF,$10,$3F,$0F               ;019D7E|        |0000FF;
                       db $08,$26,$37,$0F,$08               ;019D83|        |      ;
                       db $15,$35,$0F,$21,$11               ;019D88|        |000035;
                       db $20,$0F,$0F,$36,$15               ;019D8D|        |010F0F;
                       db $FF                               ;019D92|        |A61686;
 
symphaScreenUpdateStatue: STX.B r_coreLoadingFuncAddr          ;019D93|8616    |000016;
                       LDX.B r_sceneDrawQueue               ;019D95|A61D    |00001D;
                       LDY.B #$00                           ;019D97|A000    |      ;
 
          CODE_019D99: LDA.W screenClearUpdate00,Y          ;019D99|B9AA9D  |019DAA;
                       STA.W $0300,X                        ;019D9C|9D0003  |010300;
                       INY                                  ;019D9F|C8      |      ;
                       INX                                  ;019DA0|E8      |      ;
                       CPY.B #$0A                           ;019DA1|C00A    |      ;
                       BNE CODE_019D99                      ;019DA3|D0F4    |019D99;
                       STX.B r_sceneDrawQueue               ;019DA5|861D    |00001D;
                       LDX.B r_coreLoadingFuncAddr          ;019DA7|A616    |000016;
                       RTS                                  ;019DA9|60      |      ;
 
 
  screenClearUpdate00: db $03                               ;019DAA|        |      ;
                       dw $266E                             ;019DAB|        |      ;
                       db $04,$00,$03                       ;019DAD|        |      ;
                       dw $266F                             ;019DB0|        |      ;
                       db $04,$00                           ;019DB2|        |      ;
                       dw $8C9D                             ;019DB4|        |      ;
                       db $04,$98,$9D,$AA,$05               ;019DB6|        |000098;
                       LDA.B #$00                           ;019DBB|A900    |      ;
                       STA.W $0593,X                        ;019DBD|9D9305  |010593;
                       db $20                               ;019DC0|        |      ;
                       dw CODE_0FEF7B                       ;019DC1|        |0FEF7B;
                       RTS                                  ;019DC3|60      |      ;
 
                       LDA.W $0593,X                        ;019DC4|BD9305  |010593;
                       BNE DATA8_019DCF                     ;019DC7|D006    |019DCF;
                       LDY.W $057C,X                        ;019DC9|BC7C05  |01057C;
                       DEY                                  ;019DCC|88      |      ;
                       BEQ CODE_019DD4                      ;019DCD|F005    |019DD4;
 
         DATA8_019DCF: db $20                               ;019DCF|        |      ;
                       dw CODE_0FEF75                       ;019DD0|        |0FEF75;
                       CLC                                  ;019DD2|18      |      ;
                       RTS                                  ;019DD3|60      |      ;
 
 
          CODE_019DD4: SEC                                  ;019DD4|38      |      ;
                       RTS                                  ;019DD5|60      |      ;
 
                       CLC                                  ;019DD6|18      |      ;
                       LDA.W $0509,X                        ;019DD7|BD0905  |010509;
                       ADC.W $04C4,X                        ;019DDA|7DC404  |0104C4;
                       STA.W $04C4,X                        ;019DDD|9DC404  |0104C4;
                       LDA.W $04F2,X                        ;019DE0|BDF204  |0104F2;
                       ADC.W $0438,X                        ;019DE3|7D3804  |010438;
                       STA.W $0438,X                        ;019DE6|9D3804  |010438;
                       CLC                                  ;019DE9|18      |      ;
                       LDA.W $0537,X                        ;019DEA|BD3705  |010537;
                       ADC.W $04DB,X                        ;019DED|7DDB04  |0104DB;
                       STA.W $04DB,X                        ;019DF0|9DDB04  |0104DB;
                       LDA.W $0520,X                        ;019DF3|BD2005  |010520;
                       ADC.W $041C,X                        ;019DF6|7D1C04  |01041C;
                       STA.W $041C,X                        ;019DF9|9D1C04  |01041C;
                       RTS                                  ;019DFC|60      |      ;
 
                       db $9D,$8C,$04,$98,$9D               ;019DFD|        |01048C;
                       db $AA,$05,$A9,$00,$9D               ;019E02|        |      ;
                       db $93,$05,$9D,$7C,$05               ;019E07|        |000005;
                       db $60,$BD,$7C,$05,$D0               ;019E0C|        |      ;
                       db $2E,$BD,$AA,$05,$0A               ;019E11|        |01AABD;
                       db $A8,$B9,$5B,$9E,$85               ;019E16|        |      ;
                       db $00,$B9,$5C,$9E,$85               ;019E1B|        |      ;
                       db $01,$BD,$93,$05,$C9               ;019E20|        |0000BD;
                       db $FF,$F0,$31,$0A,$A8               ;019E25|        |0A31F0;
                       db $B1,$00,$C9,$FE,$F0               ;019E2A|        |000000;
                       db $1F,$C9,$FF,$F0,$11               ;019E2F|        |F0FFC9;
                       db $9D,$7C,$05,$C8,$B1               ;019E34|        |01057C;
                       db $00,$9D,$00,$04,$FE               ;019E39|        |      ;
                       db $93,$05,$DE,$7C,$05               ;019E3E|        |000005;
                       db $18,$60,$A9,$00,$9D               ;019E43|        |      ;
                       db $93,$05,$9D,$7C,$05               ;019E48|        |000005;
                       db $18,$60,$A9,$00,$9D               ;019E4D|        |      ;
                       db $7C,$05,$A9,$FF,$9D               ;019E52|        |01A905;
                       db $93,$05,$38,$60,$8D               ;019E57|        |000005;
                       db $9E,$96,$9E,$9F,$9E               ;019E5C|        |019E96;
                       db $A8,$9E,$B1,$9E,$BA               ;019E61|        |      ;
                       db $9E,$C3,$9E,$C8,$9E               ;019E66|        |019EC3;
                       db $CD,$9E,$D2,$9E,$D5               ;019E6B|        |01D29E;
                       db $9E,$DA,$9E,$DD,$9E               ;019E70|        |019EDA;
                       db $E0,$9E,$E5,$9E,$EC               ;019E75|        |      ;
                       db $9E,$F5,$9E,$F8,$9E               ;019E7A|        |019EF5;
                       db $FB,$9E,$04,$9F,$07               ;019E7F|        |      ;
                       db $9F,$10,$9F,$19,$9F               ;019E84|        |199F10;
                       db $20,$9F,$2C,$9F,$02               ;019E89|        |012C9F;
                       db $4A,$02,$94,$02,$96               ;019E8E|        |      ;
                       db $02,$98,$FF,$08,$70               ;019E93|        |      ;
                       db $08,$72,$08,$74,$08               ;019E98|        |      ;
                       db $72,$FF,$08,$94,$08               ;019E9D|        |0000FF;
                       db $96,$08,$98,$08,$96               ;019EA2|        |000008;
                       db $FF,$08,$7C,$08,$7E               ;019EA7|        |087C08;
                       db $08,$80,$08,$7E,$FF               ;019EAC|        |      ;
                       db $08,$88,$08,$8A,$08               ;019EB1|        |      ;
                       db $8C,$08,$8A,$FF,$18               ;019EB6|        |018A08;
                       db $7C,$08,$86,$10,$7C               ;019EBB|        |018608;
                       db $04,$86,$FF,$08,$9A               ;019EC0|        |000086;
                       db $08,$9C,$FF,$08,$82               ;019EC5|        |      ;
                       db $08,$84,$FF,$08,$8E               ;019ECA|        |      ;
                       db $08,$90,$FF,$08,$6E               ;019ECF|        |      ;
                       db $FF,$08,$48,$08,$4A               ;019ED4|        |084808;
                       db $FE,$08,$98,$FF,$08               ;019ED9|        |019808;
                       db $2E,$FF,$02,$02,$02               ;019EDE|        |0102FF;
                       db $04,$FF,$02,$02,$02               ;019EE3|        |0000FF;
                       db $04,$02,$06,$FF,$02               ;019EE8|        |000002;
                       db $02,$02,$04,$02,$06               ;019EED|        |      ;
                       db $02,$08,$FF,$08,$0A               ;019EF2|        |      ;
                       db $FF,$08,$0C,$FF,$08               ;019EF7|        |FF0C08;
                       db $02,$08,$04,$08,$06               ;019EFC|        |      ;
                       db $08,$08,$FF,$08,$0E               ;019F01|        |      ;
                       db $FF,$18,$98,$08,$9E               ;019F06|        |089818;
                       db $10,$98,$04,$9E,$FF               ;019F0B|        |019EA5;
                       db $18,$8C,$08,$92,$10               ;019F10|        |      ;
                       db $8C,$04,$92,$FF,$08               ;019F15|        |019204;
                       db $74,$04,$76,$10,$74               ;019F1A|        |000004;
                       db $FF,$08,$78,$04,$74               ;019F1F|        |047808;
                       db $08,$7A,$FF,$04,$74               ;019F24|        |      ;
                       db $10,$78,$FF,$02,$88               ;019F29|        |019FA3;
                       db $02,$8A,$FF                       ;019F2E|        |      ;
 
           irq_dataLo: dw CODE_0FE13A                       ;019F31|        |0FE13A;
                       dw IRQ_routine_01                    ;019F33|        |01A0BC;
                       dw CODE_01A0EF                       ;019F35|        |01A0EF;
                       dw UNREACH_01A12F                    ;019F37|        |01A12F;
                       dw UNREACH_01A13C                    ;019F39|        |01A13C;
                       dw UNREACH_01A179                    ;019F3B|        |01A179;
                       dw UNREACH_01A190                    ;019F3D|        |01A190;
                       dw UNREACH_01A1BF                    ;019F3F|        |01A1BF;
                       dw UNREACH_01A1E8                    ;019F41|        |01A1E8;
                       dw UNREACH_01A274                    ;019F43|        |01A274;
                       dw UNREACH_01A2A1                    ;019F45|        |01A2A1;
                       dw UNREACH_01A179                    ;019F47|        |01A179;
                       dw UNREACH_01A190                    ;019F49|        |01A190;
                       dw UNREACH_01A21E                    ;019F4B|        |01A21E;
                       dw UNREACH_01A24B                    ;019F4D|        |01A24B;
                       dw UNREACH_01A2A1                    ;019F4F|        |01A2A1;
                       dw UNREACH_01A2DC                    ;019F51|        |01A2DC;
                       dw UNREACH_01A2F2                    ;019F53|        |01A2F2;
                       dw UNREACH_01A2F8                    ;019F55|        |01A2F8;
                       dw UNREACH_01A345                    ;019F57|        |01A345;
                       dw UNREACH_01A39B                    ;019F59|        |01A39B;
                       dw UNREACH_01A3EE                    ;019F5B|        |01A3EE;
                       dw UNREACH_01A05A                    ;019F5D|        |01A05A;
                       dw UNREACH_01A00D                    ;019F5F|        |01A00D;
                       dw UNREACH_01A023                    ;019F61|        |01A023;
                       dw UNREACH_019FD9                    ;019F63|        |019FD9;
                       dw UNREACH_01A3F4                    ;019F65|        |01A3F4;
                       dw UNREACH_01A41D                    ;019F67|        |01A41D;
                       dw UNREACH_01A434                    ;019F69|        |01A434;
                       dw UNREACH_01A458                    ;019F6B|        |01A458;
                       dw UNREACH_01A488                    ;019F6D|        |01A488;
                       dw UNREACH_01A4C8                    ;019F6F|        |01A4C8;
                       dw UNREACH_01A4E6                    ;019F71|        |01A4E6;
                       dw UNREACH_01A488                    ;019F73|        |01A488;
                       dw UNREACH_01A501                    ;019F75|        |01A501;
                       dw CODE_019FD1                       ;019F77|        |019FD1;
                       dw UNREACH_01A345                    ;019F79|        |01A345;
                       dw UNREACH_01A39B                    ;019F7B|        |01A39B;
                       dw UNREACH_01A3DA                    ;019F7D|        |01A3DA;
                       dw UNREACH_01A3C1                    ;019F7F|        |01A3C1;
                       dw UNREACH_01A3EE                    ;019F81|        |01A3EE;
                       dw UNREACH_01A578                    ;019F83|        |01A578;
                       dw UNREACH_01A5A0                    ;019F85|        |01A5A0;
                       dw UNREACH_01A5D2                    ;019F87|        |01A5D2;
                       dw UNREACH_01A5E5                    ;019F89|        |01A5E5;
                       dw UNREACH_01A16A                    ;019F8B|        |01A16A;
 
       chrAnimRoutine: DEC.W $0781                          ;019F8D|CE8107  |010781;
                       BNE CODE_019FB8                      ;019F90|D026    |019FB8;
                       LDA.B r_roomEffect                   ;019F92|A57D    |00007D;
                       AND.B #$0F                           ;019F94|290F    |      ;
                       ASL A                                ;019F96|0A      |      ;
                       TAY                                  ;019F97|A8      |      ;
                       LDA.W gearCHRanimPointerLo,Y         ;019F98|B9BD9F  |019FBD;
                       STA.B r_IRQFuncAddr                  ;019F9B|8544    |000044;
                       LDA.W gearCHRanimPointerHi,Y         ;019F9D|B9BE9F  |019FBE;
                       STA.B $45                            ;019FA0|8545    |000045;
                       LDY.B #$00                           ;019FA2|A000    |      ;
                       LDA.B (r_IRQFuncAddr),Y              ;019FA4|B144    |000044;
                       STA.W $0781                          ;019FA6|8D8107  |010781;
                       LDY.W $0780                          ;019FA9|AC8007  |010780;
                       INY                                  ;019FAC|C8      |      ;
 
          CODE_019FAD: LDA.B (r_IRQFuncAddr),Y              ;019FAD|B144    |000044;
                       CMP.B #$FF                           ;019FAF|C9FF    |      ;
                       BEQ resetCHRanim                     ;019FB1|F006    |019FB9;
                       STA.B r_CHR_BankBG_0400              ;019FB3|854B    |00004B;
                       STY.W $0780                          ;019FB5|8C8007  |010780;
 
          CODE_019FB8: RTS                                  ;019FB8|60      |      ;
 
 
         resetCHRanim: LDY.B #$01                           ;019FB9|A001    |      ;
                       BNE CODE_019FAD                      ;019FBB|D0F0    |019FAD;
 
 gearCHRanimPointerLo: dw gearCHRanim00                     ;019FBD|        |019FC1;
                       dw gearCHRanim01                     ;019FBF|        |019FC6;
 
        gearCHRanim00: db $0A,$54,$55,$56,$FF               ;019FC1|        |      ;
 
        gearCHRanim01: db $06,$54,$55,$56,$FF               ;019FC6|        |      ;
 
          CODE_019FCB: LDA.B #$44                           ;019FCB|A944    |      ;
                       STA.W $5105                          ;019FCD|8D0551  |015105;
                       RTS                                  ;019FD0|60      |      ;
 
 
          CODE_019FD1: LDA.B #$7F                           ;019FD1|A97F    |      ;
                       STA.W $5122                          ;019FD3|8D2251  |015122;
                       db $4C                               ;019FD6|        |      ;
 
                       dw CODE_0FE13A                       ;019FD7|        |0FE13A;
 
       UNREACH_019FD9: db $AD,$02,$20,$AE,$8C               ;019FD9|        |012002;
                       db $07,$AD,$8D,$07,$8D               ;019FDE|        |0000AD;
                       db $06,$20,$8E,$06,$20               ;019FE3|        |000020;
                       db $AD,$8A,$07,$8D,$05               ;019FE8|        |01078A;
                       db $20,$A9,$00,$8D,$05               ;019FED|        |0100A9;
                       db $20,$AD,$8B,$07,$8D               ;019FF2|        |018BAD;
                       db $00,$20,$A0,$7C,$84               ;019FF7|        |      ;
                       db $4B,$C8,$84,$4C,$20               ;019FFC|        |      ;
                       db $6D,$E3,$A0,$75,$84               ;01A001|        |01A0E3;
                       db $4B,$C8,$84,$4C,$4C               ;01A006|        |      ;
                       db $3A,$E1                           ;01A00B|        |      ;
 
       UNREACH_01A00D: db $20,$97,$A0,$20,$CB               ;01A00D|        |01A097;
                       db $9F,$20,$6D,$E3,$20               ;01A012|        |E36D20;
                       db $3C,$E3,$A5,$89,$8D               ;01A017|        |01A5E3;
                       db $03,$52,$E6,$6D,$4C               ;01A01C|        |000052;
                       db $3F,$E1                           ;01A021|        |12A0E1;
 
       UNREACH_01A023: db $A0,$12,$88,$D0,$FD               ;01A023|        |      ;
                       db $A5,$70,$29,$01,$09               ;01A028|        |000070;
                       db $B0,$A8,$A2,$00,$AD               ;01A02D|        |019FD7;
                       db $02,$20,$A9,$29,$8D               ;01A032|        |      ;
                       db $06,$20,$8E,$06,$20               ;01A037|        |000020;
                       db $A5,$6F,$8D,$05,$20               ;01A03C|        |00006F;
                       db $A9,$00,$8D,$05,$20               ;01A041|        |      ;
                       db $8C,$00,$20,$A9,$A4               ;01A046|        |012000;
                       db $8D,$05,$51,$A5,$1A               ;01A04B|        |015105;
                       db $29,$01,$D0,$03,$20               ;01A050|        |      ;
                       db $13,$E3,$4C,$3A,$E1               ;01A055|        |0000E3;
 
       UNREACH_01A05A: db $AD,$ED,$07,$F0,$12               ;01A05A|        |0107ED;
                       db $AA,$A8,$20,$2D,$E3               ;01A05F|        |      ;
                       db $A9,$0B,$85,$44,$EA               ;01A064|        |      ;
                       db $C6,$44,$D0,$FB,$EA               ;01A069|        |000044;
                       db $88,$D0,$F3,$AD,$02               ;01A06E|        |      ;
                       db $20,$A9,$20,$8D,$06               ;01A073|        |0120A9;
                       db $20,$A9,$C0,$8D,$06               ;01A078|        |01C0A9;
                       db $20,$AD,$02,$20,$A9               ;01A07D|        |0102AD;
                       db $00,$8D,$05,$20,$A5               ;01A082|        |      ;
                       db $57,$45,$75,$29,$01               ;01A087|        |000045;
                       db $05,$FF                           ;01A08C|        |0000FF;
                       STA.W $2000                          ;01A08E|8D0020  |012000;
                       db $20                               ;01A091|        |      ;
                       dw CODE_0FE35D                       ;01A092|        |0FE35D;
                       db $4C                               ;01A094|        |      ;
 
                       dw CODE_0FE13A                       ;01A095|        |0FE13A;
 
          CODE_01A097: LDX.B #$03                           ;01A097|A203    |      ;
                       db $20                               ;01A099|        |      ;
                       dw wait50cycles                      ;01A09A|        |0FE001;
                       LDA.B r_075                          ;01A09C|A575    |000075;
                       AND.B #$01                           ;01A09E|2901    |      ;
                       STA.B r_IRQFuncAddr                  ;01A0A0|8544    |000044;
                       LDA.B r_scrollStartOffsetHi          ;01A0A2|A570    |000070;
                       AND.B #$01                           ;01A0A4|2901    |      ;
                       EOR.B r_IRQFuncAddr                  ;01A0A6|4544    |000044;
                       ORA.B #$B0                           ;01A0A8|09B0    |      ;
                       TAX                                  ;01A0AA|AA      |      ;
                       LDA.W $2002                          ;01A0AB|AD0220  |012002;
                       LDA.B r_scrollStartOffsetLo          ;01A0AE|A56F    |00006F;
                       STA.W $2005                          ;01A0B0|8D0520  |012005;
                       LDA.B #$00                           ;01A0B3|A900    |      ;
                       STA.W $2005                          ;01A0B5|8D0520  |012005;
                       STX.W $2000                          ;01A0B8|8E0020  |012000;
                       RTS                                  ;01A0BB|60      |      ;
 
 
       IRQ_routine_01: JSR.W CODE_01A097                    ;01A0BC|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A0BF|20CB9F  |019FCB;
                       db $20                               ;01A0C2|        |      ;
                       dw CODE_0FE36D                       ;01A0C3|        |0FE36D;
                       LDA.B r_roomEffect                   ;01A0C5|A57D    |00007D;
                       AND.B #$F0                           ;01A0C7|29F0    |      ;
                       CMP.B #$40                           ;01A0C9|C940    |      ;
                       BEQ CODE_01A0D7                      ;01A0CB|F00A    |01A0D7;
                       LDA.B r_defaultCHR                   ;01A0CD|A5B0    |0000B0;
                       BEQ DATA8_01A0D4                     ;01A0CF|F003    |01A0D4;
                       db $20                               ;01A0D1|        |      ;
                       dw CODE_0FE33C                       ;01A0D2|        |0FE33C;
 
         DATA8_01A0D4: db $4C                               ;01A0D4|        |      ;
 
                       dw CODE_0FE13A                       ;01A0D5|        |0FE13A;
 
          CODE_01A0D7: JSR.W chrAnimRoutine                 ;01A0D7|208D9F  |019F8D;
                       JMP.W DATA8_01A0D4                   ;01A0DA|4CD4A0  |01A0D4;
 
 
          CODE_01A0DD: LDY.W $0780                          ;01A0DD|AC8007  |010780;
                       LDA.B r_scrollStartOffsetLo          ;01A0E0|A56F    |00006F;
                       CLC                                  ;01A0E2|18      |      ;
                       ADC.W $0783,Y                        ;01A0E3|798307  |010783;
                       STA.B $D5                            ;01A0E6|85D5    |0000D5;
                       LDA.B r_scrollStartOffsetHi          ;01A0E8|A570    |000070;
                       ADC.B #$00                           ;01A0EA|6900    |      ;
                       STA.B $D6                            ;01A0EC|85D6    |0000D6;
                       RTS                                  ;01A0EE|60      |      ;
 
 
          CODE_01A0EF: JSR.W CODE_01A097                    ;01A0EF|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A0F2|20CB9F  |019FCB;
                       STA.W $5105                          ;01A0F5|8D0551  |015105;
                       STA.W $5105                          ;01A0F8|8D0551  |015105;
                       db $20                               ;01A0FB|        |      ;
                       dw CODE_0FE36D                       ;01A0FC|        |0FE36D;
                       LDA.B $89                            ;01A0FE|A589    |000089;
                       STA.W $5203                          ;01A100|8D0352  |015203;
                       LDA.B r_roomEffect                   ;01A103|A57D    |00007D;
                       AND.B #$0F                           ;01A105|290F    |      ;
                       TAY                                  ;01A107|A8      |      ;
                       LDA.W DATA8_01A11D,Y                 ;01A108|B91DA1  |01A11D;
                       STA.W $0780                          ;01A10B|8D8007  |010780;
                       JSR.W CODE_01A0DD                    ;01A10E|20DDA0  |01A0DD;
                       LDA.B #$04                           ;01A111|A904    |      ;
                       CLC                                  ;01A113|18      |      ;
                       ADC.B $89                            ;01A114|6589    |000089;
                       STA.B r_IRQScanlineCmpVal            ;01A116|8543    |000043;
                       INC.B r_IRQFuncDrawIdx               ;01A118|E66D    |00006D;
                       db $4C                               ;01A11A|        |      ;
 
                       dw CODE_0FE13F                       ;01A11B|        |0FE13F;
 
         DATA8_01A11D: db $2E,$1E,$16,$1E                   ;01A11D|        |      ;
                       LDA.W $2002                          ;01A121|AD0220  |012002;
                       LDA.B $D5                            ;01A124|A5D5    |0000D5;
                       STA.W $2005                          ;01A126|8D0520  |012005;
                       LDA.B #$00                           ;01A129|A900    |      ;
                       STA.W $2005                          ;01A12B|8D0520  |012005;
                       RTS                                  ;01A12E|60      |      ;
 
 
       UNREACH_01A12F: db $A2,$01,$20,$01,$E0               ;01A12F|        |      ;
                       db $20,$21,$A1,$E6,$6D               ;01A134|        |01A121;
                       db $4C,$44,$A1                       ;01A139|        |01A144;
 
       UNREACH_01A13C: db $A2,$01,$20,$01,$E0               ;01A13C|        |      ;
                       db $20,$21,$A1,$A9,$00               ;01A141|        |01A121;
                       db $8D,$05,$51,$A5,$43               ;01A146|        |015105;
                       db $8D,$03,$52,$CE,$80               ;01A14B|        |015203;
                       db $07,$CE,$80,$07,$F0               ;01A150|        |0000CE;
                       db $0D,$A9,$04,$18,$65               ;01A155|        |0104A9;
                       db $43,$85,$43,$20,$DD               ;01A15A|        |000085;
                       db $A0,$4C,$3F,$E1,$A9               ;01A15F|        |      ;
                       db $2D,$85,$6D,$4C,$3F               ;01A164|        |016D85;
                       db $E1                               ;01A169|        |000020;
 
       UNREACH_01A16A: db $20,$97,$A0,$20,$CB               ;01A16A|        |01A097;
                       db $9F,$8D,$05,$51,$8D               ;01A16F|        |51058D;
                       db $05,$51,$4C,$3A,$E1               ;01A174|        |000051;
 
       UNREACH_01A179: db $A5,$89,$8D,$03,$52               ;01A179|        |000089;
                       db $A5,$6F,$29,$07,$49               ;01A17E|        |00006F;
                       db $07,$18,$69,$03,$65               ;01A183|        |000018;
                       db $89,$85,$43,$E6,$6D               ;01A188|        |      ;
                       db $4C,$3F,$E1                       ;01A18D|        |01E13F;
 
       UNREACH_01A190: db $A5,$43,$8D,$03,$52               ;01A190|        |000043;
                       db $A2,$0C,$20,$01,$E0               ;01A195|        |      ;
                       db $20,$2D,$E3,$A9,$55               ;01A19A|        |01E32D;
                       db $8D,$05,$51,$A5,$6F               ;01A19F|        |015105;
                       db $29,$07,$18,$69,$01               ;01A1A4|        |      ;
                       db $65,$43,$85,$43,$A9               ;01A1A9|        |000043;
                       db $00,$06,$6F,$2A,$06               ;01A1AE|        |      ;
                       db $6F,$2A,$18,$69,$28               ;01A1B3|        |69182A;
                       db $85,$70,$E6,$6D,$4C               ;01A1B8|        |000070;
                       db $3F,$E1                           ;01A1BD|        |43A5E1;
 
       UNREACH_01A1BF: db $A5,$43,$8D,$03,$52               ;01A1BF|        |000043;
                       db $A2,$02,$20,$01,$E0               ;01A1C4|        |      ;
                       db $AD,$02,$20,$A6,$6F               ;01A1C9|        |012002;
                       db $A5,$70,$8D,$06,$20               ;01A1CE|        |000070;
                       db $8E,$06,$20,$A9,$00               ;01A1D3|        |012006;
                       db $8D,$05,$20,$8D,$05               ;01A1D8|        |012005;
                       db $20,$A9,$B0,$8D,$00               ;01A1DD|        |01B0A9;
                       db $20,$E6,$6D,$4C,$3F               ;01A1E2|        |016DE6;
                       db $E1                               ;01A1E7|        |0000A2;
 
       UNREACH_01A1E8: db $A2,$01,$20,$01,$E0               ;01A1E8|        |      ;
                       db $A5,$4B,$A4,$4C,$A6               ;01A1ED|        |00004B;
                       db $4A,$8D,$29,$51,$8C               ;01A1F2|        |      ;
                       db $2A,$51,$8E,$28,$51               ;01A1F7|        |      ;
                       db $A5,$4D,$8D,$2B,$51               ;01A1FC|        |00004D;
 
                       db $8D,$27,$51,$8E,$24               ;01A201|        |015127;
                       db $51,$8C,$26,$51,$20               ;01A206|        |00008C;
                       db $42,$E3,$A5,$7D,$29               ;01A20B|        |      ;
                       db $F0,$C9,$40,$F0,$03               ;01A210|        |01A1DB;
                       db $4C,$3A,$E1,$20,$8D               ;01A215|        |01E13A;
                       db $9F,$4C,$15,$A2                   ;01A21A|        |A2154C;
 
       UNREACH_01A21E: db $A5,$43,$8D,$03,$52               ;01A21E|        |000043;
                       db $A2,$01,$20,$01,$E0               ;01A223|        |      ;
                       db $AD,$02,$20,$A6,$6F               ;01A228|        |012002;
                       db $A5,$70,$8D,$06,$20               ;01A22D|        |000070;
                       db $8E,$06,$20,$A9,$00               ;01A232|        |012006;
                       db $8D,$05,$20,$8D,$05               ;01A237|        |012005;
                       db $20,$A9,$B0,$8D,$00               ;01A23C|        |01B0A9;
                       db $20,$A5,$7C,$85,$43               ;01A241|        |017CA5;
                       db $E6,$6D,$4C,$3F,$E1               ;01A246|        |00006D;
 
       UNREACH_01A24B: db $A2,$01,$20,$01,$E0               ;01A24B|        |      ;
                       db $20,$42,$E3,$20,$5D               ;01A250|        |01E342;
                       db $E3,$A5,$43,$8D,$03               ;01A255|        |0000A5;
                       db $52,$20,$07,$A3,$AD               ;01A25A|        |000020;
                       db $19,$06,$38,$ED,$30               ;01A25F|        |013806;
                       db $06,$85,$7C,$AD,$30               ;01A264|        |000085;
                       db $06,$49,$01,$8D,$30               ;01A269|        |000049;
                       db $06,$E6,$6D,$4C,$3F               ;01A26E|        |0000E6;
                       db $E1                               ;01A273|        |000020;
 
       UNREACH_01A274: db $20,$97,$A0,$20,$CB               ;01A274|        |01A097;
                       db $9F,$20,$6D,$E3,$A5               ;01A279|        |E36D20;
                       db $89,$8D,$03,$52,$20               ;01A27E|        |      ;
                       db $07,$A3,$A5,$3F,$C9               ;01A283|        |0000A3;
                       db $09,$D0,$09,$AD,$19               ;01A288|        |      ;
                       db $06,$38,$ED,$30,$06               ;01A28D|        |000038;
                       db $85,$42,$AD,$30,$06               ;01A292|        |000042;
                       db $49,$01,$8D,$30,$06               ;01A297|        |      ;
                       db $E6,$6D,$4C,$3F,$E1               ;01A29C|        |00006D;
 
       UNREACH_01A2A1: db $A0,$05,$20,$22,$E3               ;01A2A1|        |      ;
                       db $20,$05,$E0,$20,$52               ;01A2A6|        |01E005;
                       db $E3,$20,$05,$E0,$20               ;01A2AB|        |000020;
                       db $22,$E3,$20,$05,$E0               ;01A2B0|        |0520E3;
                       db $20,$52,$E3,$20,$05               ;01A2B5|        |01E352;
                       db $E0,$20,$22,$E3,$20               ;01A2BA|        |      ;
                       db $05,$E0,$20,$52,$E3               ;01A2BF|        |0000E0;
                       db $20,$05,$E0,$20,$22               ;01A2C4|        |01E005;
                       db $E3,$20,$05,$E0,$20               ;01A2C9|        |000020;
                       db $52,$E3,$A2,$10,$CA               ;01A2CE|        |0000E3;
                       db $D0,$FD,$EA,$88,$D0               ;01A2D3|        |01A2D2;
                       db $CA,$4C,$3A,$E1                   ;01A2D8|        |      ;
 
       UNREACH_01A2DC: db $20,$97,$A0,$20,$CB               ;01A2DC|        |01A097;
                       db $9F,$20,$6D,$E3,$20               ;01A2E1|        |E36D20;
                       db $52,$E3,$A5,$89,$8D               ;01A2E6|        |0000E3;
                       db $03,$52,$E6,$6D,$4C               ;01A2EB|        |000052;
                       db $3F,$E1                           ;01A2F0|        |2220E1;
 
       UNREACH_01A2F2: db $20,$22,$E3,$4C,$3A               ;01A2F2|        |01E322;
                       db $E1                               ;01A2F7|        |000020;
 
       UNREACH_01A2F8: db $20,$97,$A0,$20,$CB               ;01A2F8|        |01A097;
                       db $9F,$20,$6D,$E3,$20               ;01A2FD|        |E36D20;
                       db $52,$E3,$4C,$3A,$E1               ;01A302|        |0000E3;
                       db $A9,$00,$8D,$70,$04               ;01A307|        |      ;
                       db $AD,$05,$05,$30,$2D               ;01A30C|        |010505;
                       db $AD,$30,$06,$F0,$17               ;01A311|        |010630;
                       db $AD,$D4,$05,$38,$ED               ;01A316|        |0105D4;
                       db $05,$05,$90,$08,$C9               ;01A31B|        |000005;
                       db $08,$90,$04,$8D,$38               ;01A320|        |      ;
                       db $04,$60,$A9,$80,$8D               ;01A325|        |000060;
                       db $70,$04,$60,$AD,$D4               ;01A32A|        |01A330;
                       db $05,$18,$6D,$05,$05               ;01A32F|        |000018;
                       db $B0,$F1,$C9,$F8,$B0               ;01A334|        |01A327;
                       db $ED,$8D,$38,$04,$60               ;01A339|        |01388D;
                       db $AD,$D4,$05,$8D,$38               ;01A33E|        |0105D4;
                       db $04,$60                           ;01A343|        |000060;
 
       UNREACH_01A345: db $20,$97,$A0,$20,$CB               ;01A345|        |01A097;
                       db $9F,$20,$6D,$E3,$A5               ;01A34A|        |E36D20;
                       db $89,$8D,$03,$52,$A5               ;01A34F|        |      ;
                       db $7D,$29,$0F,$C9,$02               ;01A354|        |010F29;
                       db $B0,$23,$EE,$81,$07               ;01A359|        |01A37E;
                       db $AD,$81,$07,$C9,$06               ;01A35E|        |010781;
                       db $90,$19,$A9,$00,$8D               ;01A363|        |01A37E;
                       db $81,$07,$AC,$80,$07               ;01A368|        |000007;
                       db $C8,$C0,$03,$90,$02               ;01A36D|        |      ;
                       db $A0,$00,$8C,$80,$07               ;01A372|        |      ;
                       db $B9,$90,$A3,$85,$4B               ;01A377|        |01A390;
                       db $85,$4E,$A5,$7D,$29               ;01A37C|        |00004E;
                       db $0F,$A8,$B9,$93,$A3               ;01A381|        |93B9A8;
                       db $18,$65,$89,$85,$43               ;01A386|        |      ;
                       db $E6,$6D,$4C,$3F,$E1               ;01A38B|        |00006D;
                       db $54,$55,$56,$30,$10               ;01A390|        |      ;
                       db $30,$30,$30,$30,$30               ;01A395|        |01A3C7;
                       db $30                               ;01A39A|        |01A341;
 
       UNREACH_01A39B: db $A5,$43,$8D,$03,$52               ;01A39B|        |000043;
                       db $A5,$43,$18,$69,$40               ;01A3A0|        |000043;
                       db $85,$43,$A5,$7D,$29               ;01A3A5|        |000043;
                       db $0F,$C9,$02,$90,$17               ;01A3AA|        |9002C9;
                       db $A8,$88,$88,$B9,$D4               ;01A3AF|        |      ;
                       db $A3,$C5,$57,$F0,$16               ;01A3B4|        |0000C5;
                       db $A5,$1A,$29,$03,$F0               ;01A3B9|        |00001A;
                       db $10,$D0,$0B                       ;01A3BE|        |01A390;
 
       UNREACH_01A3C1: db $A5,$43,$8D,$03,$52               ;01A3C1|        |000043;
                       db $A5,$1A,$29,$01,$F0               ;01A3C6|        |00001A;
                       db $03,$20,$13,$E3,$E6               ;01A3CB|        |000020;
                       db $6D,$4C,$3F,$E1,$03               ;01A3D0|        |013F4C;
                       db $02,$06,$02,$01,$01               ;01A3D5|        |      ;
 
       UNREACH_01A3DA: db $A5,$43,$8D,$03,$52               ;01A3DA|        |000043;
                       db $20,$3C,$E3,$A5,$43               ;01A3DF|        |01E33C;
                       db $18,$69,$30,$85,$43               ;01A3E4|        |      ;
                       db $E6,$6D,$4C,$3F,$E1               ;01A3E9|        |00006D;
 
       UNREACH_01A3EE: db $20,$3C,$E3,$4C,$3A               ;01A3EE|        |01E33C;
                       db $E1                               ;01A3F3|        |0000A5;
 
       UNREACH_01A3F4: db $A5,$89,$8D,$03,$52               ;01A3F4|        |000089;
                       db $AC,$82,$07,$8C,$89               ;01A3F9|        |010782;
                       db $07,$B9,$1A,$A4,$85               ;01A3FE|        |0000B9;
                       db $6D,$AD,$83,$07,$18               ;01A403|        |0183AD;
                       db $65,$89,$8D,$8A,$07               ;01A408|        |000089;
                       db $AD,$84,$07,$18,$6D               ;01A40D|        |010784;
                       db $8A,$07,$8D,$8B,$07               ;01A412|        |      ;
                       db $4C,$3F,$E1,$1B,$1B               ;01A417|        |01E13F;
                       db $1C                               ;01A41C|        |018AAD;
 
       UNREACH_01A41D: db $AD,$8A,$07,$8D,$03               ;01A41D|        |01078A;
                       db $52,$20,$5E,$A4,$AC               ;01A422|        |000020;
                       db $89,$07,$B9,$31,$A4               ;01A427|        |      ;
                       db $85,$6D,$4C,$3F,$E1               ;01A42C|        |00006D;
                       db $1D,$1C,$1D                       ;01A431|        |011D1C;
 
       UNREACH_01A434: db $A2,$10,$CA,$10,$FD               ;01A434|        |      ;
                       db $A5,$FF,$49,$01,$8D               ;01A439|        |0000FF;
                       db $00,$20,$20,$73,$A4               ;01A43E|        |      ;
                       db $AD,$8B,$07,$AC,$89               ;01A443|        |01078B;
                       db $07,$C0,$01,$F0,$03               ;01A448|        |0000C0;
                       db $AD,$8A,$07,$8D,$03               ;01A44D|        |01078A;
                       db $52,$E6,$6D,$4C,$3F               ;01A452|        |0000E6;
                       db $E1                               ;01A457|        |000020;
 
       UNREACH_01A458: db $20,$2D,$E3,$4C,$3A               ;01A458|        |01E32D;
                       db $E1,$A9,$74,$8D,$28               ;01A45D|        |0000A9;
                       db $51,$A9,$77,$8D,$2B               ;01A462|        |0000A9;
                       db $51,$A9,$75,$8D,$29               ;01A467|        |0000A9;
                       db $51,$A9,$76,$8D,$2A               ;01A46C|        |0000A9;
                       db $51,$60,$A9,$78,$8D               ;01A471|        |000060;
                       db $28,$51,$A9,$7A,$8D               ;01A476|        |      ;
                       db $2B,$51,$A9,$4F,$8D               ;01A47B|        |      ;
                       db $29,$51,$A9,$79,$8D               ;01A480|        |      ;
                       db $2A,$51,$60                       ;01A485|        |      ;
 
       UNREACH_01A488: db $A5,$89,$8D,$03,$52               ;01A488|        |000089;
                       db $AD,$8E,$07,$18,$65               ;01A48D|        |01078E;
                       db $89,$8D,$89,$07,$AD               ;01A492|        |      ;
                       db $90,$07,$8D,$8B,$07               ;01A497|        |01A4A0;
                       db $AD,$8F,$07,$8D,$8A               ;01A49C|        |01078F;
                       db $07,$AD,$93,$07,$F0               ;01A4A1|        |0000AD;
                       db $06,$20,$3F,$A5,$4C               ;01A4A6|        |000020;
                       db $B8,$A4,$AD,$86,$07               ;01A4AB|        |      ;
                       db $8D,$92,$07,$A2,$08               ;01A4B0|        |010792;
                       db $20,$27,$A5,$20,$5D               ;01A4B5|        |01A527;
                       db $E3,$AD,$8A,$07,$D0               ;01A4BA|        |0000AD;
                       db $05,$E6,$6D,$4C,$3F               ;01A4BF|        |0000E6;
                       db $E1,$4C,$3A,$E1                   ;01A4C4|        |00004C;
 
       UNREACH_01A4C8: db $AD,$89,$07,$8D,$03               ;01A4C8|        |010789;
                       db $52,$AD,$92,$07,$18               ;01A4CD|        |0000AD;
                       db $69,$01,$A2,$00,$20               ;01A4D2|        |      ;
                       db $27,$A5,$20,$5D,$E3               ;01A4D7|        |0000A5;
                       db $AD,$8B,$07,$D0,$E4               ;01A4DC|        |01078B;
                       db $E6,$6D,$4C,$3F,$E1               ;01A4E1|        |00006D;
 
       UNREACH_01A4E6: db $AD,$92,$07,$18,$69               ;01A4E6|        |010792;
                       db $02,$A2,$04,$20,$27               ;01A4EB|        |      ;
                       db $A5,$20,$5D,$E3,$A9               ;01A4F0|        |000020;
                       db $7F,$85,$4A,$85,$4B               ;01A4F5|        |854A85;
                       db $85,$4C,$85,$4D,$4C               ;01A4FA|        |00004C;
                       db $3A,$E1                           ;01A4FF|        |      ;
 
       UNREACH_01A501: db $A2,$08,$8A,$4A,$4A               ;01A501|        |      ;
                       db $4A,$A8,$AD,$02,$20               ;01A506|        |      ;
                       db $B9,$94,$07,$8D,$05               ;01A50B|        |010794;
                       db $20,$A9,$00,$8D,$05               ;01A510|        |0100A9;
                       db $20,$A9,$09,$85,$44               ;01A515|        |0109A9;
                       db $C6,$44,$D0,$FC,$EA               ;01A51A|        |000044;
                       db $E8,$E0,$49,$D0,$DF               ;01A51F|        |      ;
                       db $4C,$3A,$E1,$0A,$0A               ;01A524|        |01E13A;
                       db $A8,$B9,$50,$A5,$85               ;01A529|        |      ;
                       db $4A,$B9,$51,$A5,$85               ;01A52E|        |      ;
                       db $4B,$B9,$52,$A5,$85               ;01A533|        |      ;
                       db $4C,$B9,$53,$A5,$85               ;01A538|        |0153B9;
                       db $4D,$60,$A9,$41,$85               ;01A53D|        |01A960;
                       db $4A,$A9,$3E,$85,$4B               ;01A542|        |      ;
                       db $A9,$3F,$85,$4C,$A9               ;01A547|        |      ;
                       db $6F,$85,$4D,$60,$41               ;01A54C|        |604D85;
                       db $70,$71,$72,$41,$41               ;01A551|        |01A5C4;
                       db $5A,$6F,$41,$41,$5A               ;01A556|        |      ;
                       db $6F,$41,$3C,$3D,$6F               ;01A55B|        |3D3C41;
                       db $41,$3E,$3F,$6F,$41               ;01A560|        |00003E;
                       db $3C,$3D,$6F,$41,$41               ;01A565|        |016F3D;
                       db $5A,$6F,$41,$3C,$3D               ;01A56A|        |      ;
                       db $6F,$41,$3C,$3D,$6F               ;01A56F|        |3D3C41;
                       db $41,$3C,$3D,$6F                   ;01A574|        |00003C;
 
       UNREACH_01A578: db $A5,$89,$8D,$03,$52               ;01A578|        |000089;
                       db $A2,$07,$BD,$82,$07               ;01A57D|        |      ;
                       db $9D,$89,$07,$CA,$10               ;01A582|        |010789;
                       db $F7,$AD,$8A,$07,$18               ;01A587|        |0000AD;
                       db $65,$89,$8D,$8A,$07               ;01A58C|        |000089;
                       db $AD,$8B,$07,$18,$6D               ;01A591|        |01078B;
                       db $8A,$07,$8D,$8B,$07               ;01A596|        |      ;
                       db $E6,$6D,$4C,$3F,$E1               ;01A59B|        |00006D;
 
       UNREACH_01A5A0: db $AD,$8A,$07,$8D,$03               ;01A5A0|        |01078A;
                       db $52,$A9,$55,$8D,$05               ;01A5A5|        |0000A9;
                       db $51,$A2,$05,$20,$01               ;01A5AA|        |0000A2;
                       db $E0,$AD,$02,$20,$AD               ;01A5AF|        |      ;
                       db $8D,$07,$8D,$06,$20               ;01A5B4|        |018D07;
                       db $AD,$8C,$07,$8D,$06               ;01A5B9|        |01078C;
                       db $20,$AD,$8E,$07,$8D               ;01A5BE|        |018EAD;
                       db $05,$20,$A9,$00,$8D               ;01A5C3|        |000020;
                       db $05,$20,$20,$2D,$E3               ;01A5C8|        |000020;
                       db $E6,$6D,$4C,$3F,$E1               ;01A5CD|        |00006D;
 
       UNREACH_01A5D2: db $AD,$8B,$07,$8D,$03               ;01A5D2|        |01078B;
                       db $52,$A2,$0C,$20,$01               ;01A5D7|        |0000A2;
                       db $E0,$20,$5D,$E3,$E6               ;01A5DC|        |      ;
                       db $6D,$4C,$3F,$E1                   ;01A5E1|        |013F4C;
 
       UNREACH_01A5E5: db $A2,$14,$20,$01,$E0               ;01A5E5|        |      ;
                       db $A9,$44,$8D,$05,$51               ;01A5EA|        |      ;
                       db $AD,$02,$20,$A9,$23               ;01A5EF|        |012002;
                       db $8D,$06,$20,$A9,$00               ;01A5F4|        |012006;
                       db $8D,$06,$20,$A9,$00               ;01A5F9|        |012006;
                       db $8D,$05,$20,$8D,$05               ;01A5FE|        |012005;
                       db $20,$A9,$B0,$8D,$00               ;01A603|        |01B0A9;
                       db $20,$4C,$3A,$E1                   ;01A608|        |013A4C;
 
       UNREACH_01A60C: db $A5,$19,$C9,$02,$90               ;01A60C|        |000019;
                       db $09,$A5,$26,$29,$10               ;01A611|        |      ;
                       db $F0,$03,$4C,$2A,$A7               ;01A616|        |01A61B;
                       db $A5,$19,$20,$6D,$E8               ;01A61B|        |000019;
                       db $30,$A6,$6B,$A6,$94               ;01A620|        |01A5C8;
                       db $A6,$B3,$A6,$E6,$A6               ;01A625|        |0000B3;
                       db $F9,$A6,$11,$A7,$25               ;01A62A|        |0111A6;
                       db $A7,$A9,$02,$85,$1C               ;01A62F|        |0000A9;
                       db $A9,$67,$20,$5F,$E2               ;01A634|        |      ;
                       db $A9,$00,$85,$46,$A9               ;01A639|        |      ;
                       db $01,$85,$47,$A9,$16               ;01A63E|        |000085;
                       db $85,$48,$A9,$7B,$85               ;01A643|        |000048;
                       db $49,$A9,$44,$85,$4A               ;01A648|        |      ;
                       db $A9,$45,$85,$4B,$A9               ;01A64D|        |      ;
                       db $47,$85,$4C,$A9,$43               ;01A652|        |000085;
                       db $85,$4D,$20,$66,$E6               ;01A657|        |00004D;
                       db $20,$F7,$E7,$E6,$19               ;01A65C|        |01E7F7;
                       db $A9,$1F,$20,$E9,$EC               ;01A661|        |      ;
                       db $A9,$04,$4C,$E9,$EC               ;01A666|        |      ;
                       db $A2,$16,$A9,$88,$20               ;01A66B|        |      ;
                       db $D5,$EB,$A0,$00,$20               ;01A670|        |0000EB;
                       db $6D,$A7,$A9,$01,$8D               ;01A675|        |01A9A7;
                       db $A8,$04,$A9,$80,$8D               ;01A67A|        |      ;
                       db $38,$04,$A9,$B0,$8D               ;01A67F|        |      ;
                       db $1C,$04,$E6,$19,$A9               ;01A684|        |01E604;
                       db $08,$8D,$C2,$05,$A0               ;01A689|        |      ;
                       db $01,$A9,$00,$4C,$8E               ;01A68E|        |0000A9;
                       db $E5,$20,$79,$E5,$D0               ;01A693|        |000020;
                       db $19,$A9,$1D,$20,$E9               ;01A698|        |011DA9;
                       db $EC,$A9,$04,$20,$E9               ;01A69D|        |0104A9;
                       db $EC,$E6,$19,$AD,$C2               ;01A6A2|        |0119E6;
                       db $05,$20,$2F,$A7,$A0               ;01A6A7|        |000020;
                       db $00,$A9,$02,$4C,$8E               ;01A6AC|        |      ;
                       db $E5,$60,$20,$79,$E5               ;01A6B1|        |000060;
                       db $D0,$FA,$A9,$00,$8D               ;01A6B6|        |01A6B2;
                       db $01,$04,$8D,$8D,$04               ;01A6BB|        |000004;
                       db $20,$61,$A6,$CE,$C2               ;01A6C0|        |01A661;
                       db $05,$F0,$0D,$C6,$19               ;01A6C5|        |0000F0;
                       db $AC,$C2,$05,$B9,$DE               ;01A6CA|        |0105C2;
                       db $A6,$A0,$00,$4C,$8E               ;01A6CF|        |0000A0;
                       db $E5,$E6,$19,$A0,$00               ;01A6D4|        |0000E6;
                       db $A9,$40,$4C,$8E,$E5               ;01A6D9|        |      ;
                       db $03,$03,$06,$06,$0C               ;01A6DE|        |000003;
                       db $10,$10,$18,$20,$79               ;01A6E3|        |01A6F5;
                       db $E5,$D0,$C7,$A0,$01               ;01A6E8|        |0000D0;
                       db $20,$6D,$A7,$E6,$19               ;01A6ED|        |01A76D;
                       db $A0,$00,$A9,$40,$4C               ;01A6F2|        |      ;
                       db $8E,$E5,$20,$79,$E5               ;01A6F7|        |0120E5;
                       db $D0,$B4,$A0,$39,$A9               ;01A6FC|        |01A6B2;
                       db $0C,$A2,$00,$20,$5C               ;01A701|        |0100A2;
                       db $EF,$A0,$00,$A9,$20               ;01A706|        |A900A0;
                       db $20,$8E,$E5,$E6,$19               ;01A70B|        |01E58E;
                       db $60,$A2,$00,$20,$75               ;01A710|        |      ;
                       db $EF,$20,$79,$E5,$D0               ;01A715|        |E57920;
                       db $F5,$A0,$00,$A9,$2C               ;01A71A|        |0000A0;
                       db $20,$8E,$E5,$4C,$0E               ;01A71F|        |01E58E;
                       db $A7,$20,$79,$E5,$D0               ;01A724|        |000020;
                       db $E6,$A9,$03,$85,$18               ;01A729|        |0000A9;
                       db $60,$A8,$B9,$64,$A7               ;01A72E|        |      ;
                       db $8D,$A9,$04,$A9,$DA               ;01A733|        |0104A9;
                       db $8D,$01,$04,$A9,$0C               ;01A738|        |010401;
                       db $8D,$8D,$04,$B9,$52               ;01A73D|        |01048D;
                       db $A7,$8D,$39,$04,$B9               ;01A742|        |00008D;
                       db $5B,$A7,$8D,$1D,$04               ;01A747|        |      ;
                       db $A9,$3E,$20,$5F,$E2               ;01A74C|        |      ;
                       db $60,$00,$28,$18,$C0               ;01A751|        |      ;
                       db $30,$D0,$D0,$20,$E0               ;01A756|        |01A728;
                       db $00,$40,$40,$40,$40               ;01A75B|        |      ;
                       db $40,$40,$40,$40,$00               ;01A760|        |      ;
                       db $00,$00,$01,$00,$01               ;01A765|        |      ;
                       db $01,$00,$01,$B9,$7E               ;01A76A|        |000000;
                       db $A7,$8D,$00,$04,$A9               ;01A76F|        |00008D;
                       db $0C,$8D,$8C,$04,$A9               ;01A774|        |018C8D;
                       db $00,$8D,$54,$04,$60               ;01A779|        |      ;
                       db $DC,$DE                           ;01A77E|        |00A0DE;
 
       UNREACH_01A780: db $A0,$00,$F0,$1E                   ;01A780|        |      ;
 
       UNREACH_01A784: db $A0,$02,$D0,$1A                   ;01A784|        |      ;
 
       UNREACH_01A788: db $A0,$04,$D0,$16                   ;01A788|        |      ;
 
       UNREACH_01A78C: db $A0,$06,$D0,$12                   ;01A78C|        |      ;
 
       UNREACH_01A790: db $A0,$08,$D0,$0E                   ;01A790|        |      ;
 
       UNREACH_01A794: db $A0,$0A,$D0,$0A                   ;01A794|        |      ;
 
       UNREACH_01A798: db $A0,$0C,$D0,$06                   ;01A798|        |      ;
 
       UNREACH_01A79C: db $A0,$0E,$D0,$02,$A0               ;01A79C|        |      ;
                       db $10,$B9,$B1,$A7,$85               ;01A7A1|        |01A75C;
                       db $00,$B9,$B2,$A7,$85               ;01A7A6|        |      ;
                       db $01,$A9,$84,$4C,$2F               ;01A7AB|        |0000A9;
                       db $E6,$CA,$B6,$E1,$B7               ;01A7B0|        |0000CA;
                       db $9A,$B9,$77,$BA,$7C               ;01A7B5|        |      ;
                       db $BA,$BC,$BA,$DD,$BA               ;01A7BA|        |      ;
                       db $C5,$B8,$04,$EC                   ;01A7BF|        |0000B8;
 
          CODE_01A7C3: LDA.W $07EC                          ;01A7C3|ADEC07  |0107EC;
                       ASL A                                ;01A7C6|0A      |      ;
                       TAY                                  ;01A7C7|A8      |      ;
                       LDA.W PTR16_01A7E3,Y                 ;01A7C8|B9E3A7  |01A7E3;
                       STA.B $00                            ;01A7CB|8500    |000000;
                       LDA.W PTR16_01A7E4,Y                 ;01A7CD|B9E4A7  |01A7E4;
                       STA.B $01                            ;01A7D0|8501    |000001;
                       JSR.W CODE_01A7E0                    ;01A7D2|20E0A7  |01A7E0;
                       LDA.W $07EC                          ;01A7D5|ADEC07  |0107EC;
                       CMP.B #$10                           ;01A7D8|C910    |      ;
                       BCC CODE_01A7DF                      ;01A7DA|9003    |01A7DF;
                       JSR.W UNREACH_01A788                 ;01A7DC|2088A7  |01A788;
 
          CODE_01A7DF: RTS                                  ;01A7DF|60      |      ;
 
 
          CODE_01A7E0: JMP.W ($0000)                        ;01A7E0|6C0000  |000000;
 
 
         PTR16_01A7E3: dw generalLoadTable00                ;01A7E3|        |01A825;
                       dw generalLoadTable01                ;01A7E5|        |01A89F;
                       dw generalLoadTable02                ;01A7E7|        |01A8B5;
                       dw generalLoadTable03                ;01A7E9|        |01A8C4;
                       dw generalLoadTable04                ;01A7EB|        |01A8D2;
                       dw generalLoadTable05                ;01A7ED|        |01A8DD;
                       dw generalLoadTable06                ;01A7EF|        |01A8EB;
                       dw generalLoadTable07                ;01A7F1|        |01A8F9;
                       dw generalLoadTable08                ;01A7F3|        |01A91B;
                       dw generalLoadTable09                ;01A7F5|        |01A945;
                       dw generalLoadTable0a                ;01A7F7|        |01A962;
                       dw generalLoadTable0b                ;01A7F9|        |01A979;
                       dw generalLoadTable0c                ;01A7FB|        |01A984;
                       dw generalLoadTable0d                ;01A7FD|        |01A98F;
                       dw generalLoadTable0e                ;01A7FF|        |01A9CE;
                       dw generalLoadTable0f                ;01A801|        |01A9D9;
                       dw generalLoadTable10                ;01A803|        |01AA0E;
                       dw generalLoadTable11                ;01A805|        |01AA11;
                       dw generalLoadTable12                ;01A807|        |01AA40;
                       dw generalLoadTable13                ;01A809|        |01AA4E;
                       dw generalLoadTable14                ;01A80B|        |01AA51;
                       dw generalLoadTable15                ;01A80D|        |01AA6F;
                       dw generalLoadTable16                ;01A80F|        |01AA94;
                       dw generalLoadTable17                ;01A811|        |01AAC6;
                       dw generalLoadTable18                ;01A813|        |01AAC9;
                       dw generalLoadTable19                ;01A815|        |01AAE5;
                       dw generalLoadTable1a                ;01A817|        |01AAF1;
                       dw generalLoadTable1b                ;01A819|        |01AAFC;
                       dw generalLoadTable1c                ;01A81B|        |01AB13;
                       dw generalLoadTable1d                ;01A81D|        |01AB22;
                       dw generalLoadTable1e                ;01A81F|        |01AB40;
                       dw generalLoadTable1f                ;01A821|        |01AB52;
                       dw generalLoadTable20                ;01A823|        |01AB65;
 
   generalLoadTable00: db $20                               ;01A825|        |      ;
                       dw setBank_c000_1E                   ;01A826|        |0FE2DA;
                       LDX.B #$24                           ;01A828|A224    |      ;
                       LDA.B #$00                           ;01A82A|A900    |      ;
 
          CODE_01A82C: STA.W $0780,X                        ;01A82C|9D8007  |010780;
                       DEX                                  ;01A82F|CA      |      ;
                       BPL CODE_01A82C                      ;01A830|10FA    |01A82C;
                       LDA.B #$1E                           ;01A832|A91E    |      ;
                       LDX.B #$08                           ;01A834|A208    |      ;
                       db $20                               ;01A836|        |      ;
                       dw UNREACH_0FE5C1                    ;01A837|        |0FE5C1;
                       LDA.B #$80                           ;01A839|A980    |      ;
                       STA.W $0791                          ;01A83B|8D9107  |010791;
                       LDA.B #$01                           ;01A83E|A901    |      ;
                       STA.W $0793                          ;01A840|8D9307  |010793;
                       LDA.B #$7F                           ;01A843|A97F    |      ;
                       STA.B r_CHR_BankBG_0000              ;01A845|854A    |00004A;
                       STA.B r_CHR_BankBG_0400              ;01A847|854B    |00004B;
                       STA.B r_CHR_BankBG_0800              ;01A849|854C    |00004C;
                       STA.B r_CHR_BankBG_0c00              ;01A84B|854D    |00004D;
                       LDA.B #$00                           ;01A84D|A900    |      ;
                       STA.B r_CHR_BankSpr_0000             ;01A84F|8546    |000046;
                       LDA.B #$01                           ;01A851|A901    |      ;
                       STA.B r_CHR_BankSpr_0400             ;01A853|8547    |000047;
                       db $20                               ;01A855|        |      ;
                       dw CODE_0FE33C                       ;01A856|        |0FE33C;
                       JSR.W CODE_01AB73                    ;01A858|2073AB  |01AB73;
                       db $20                               ;01A85B|        |      ;
                       dw setNameTableMapping_E4            ;01A85C|        |0FEBFD;
                       JSR.W UNREACH_01AE88                 ;01A85E|2088AE  |01AE88;
                       LDX.B #$1E                           ;01A861|A21E    |      ;
                       LDA.B #$98                           ;01A863|A998    |      ;
                       db $20                               ;01A865|        |      ;
                       dw screenLoadRoutine01               ;01A866|        |0FEBD5;
                       LDX.B #$00                           ;01A868|A200    |      ;
                       JSR.W UNREACH_01AC7C                 ;01A86A|207CAC  |01AC7C;
                       LDA.B #$55                           ;01A86D|A955    |      ;
                       STA.B r_updateNametable              ;01A86F|8525    |000025;
                       LDA.B r_PPUCtrl                      ;01A871|A5FF    |0000FF;
                       ORA.B #$02                           ;01A873|0902    |      ;
                       STA.B r_PPUCtrl                      ;01A875|85FF    |0000FF;
                       LDA.B #$00                           ;01A877|A900    |      ;
                       STA.W $0780                          ;01A879|8D8007  |010780;
                       LDA.B #$02                           ;01A87C|A902    |      ;
                       STA.W $0781                          ;01A87E|8D8107  |010781;
                       LDA.B #$80                           ;01A881|A980    |      ;
                       STA.W $07ED                          ;01A883|8DED07  |0107ED;
                       LDA.B #$00                           ;01A886|A900    |      ;
                       STA.W $07EE                          ;01A888|8DEE07  |0107EE;
                       LDA.B #$00                           ;01A88B|A900    |      ;
                       STA.W $0783                          ;01A88D|8D8307  |010783;
                       STA.W $0784                          ;01A890|8D8407  |010784;
                       STA.W $0785                          ;01A893|8D8507  |010785;
                       LDA.B #$66                           ;01A896|A966    |      ;
                       db $20                               ;01A898|        |      ;
                       dw CODE_0FE25F                       ;01A899|        |0FE25F;
 
       endGenerelLoad: INC.W $07EC                          ;01A89B|EEEC07  |0107EC;
                       RTS                                  ;01A89E|60      |      ;
 
 
   generalLoadTable01: JSR.W UNREACH_01AE8D                 ;01A89F|208DAE  |01AE8D;
                       BEQ CODE_01A8A8                      ;01A8A2|F004    |01A8A8;
                       JSR.W UNREACH_01AD34                 ;01A8A4|2034AD  |01AD34;
                       RTS                                  ;01A8A7|60      |      ;
 
 
          CODE_01A8A8: LDA.B #$80                           ;01A8A8|A980    |      ;
                       STA.W $07ED                          ;01A8AA|8DED07  |0107ED;
                       LDA.B #$00                           ;01A8AD|A900    |      ;
                       STA.W $07EE                          ;01A8AF|8DEE07  |0107EE;
                       JMP.W endGenerelLoad                 ;01A8B2|4C9BA8  |01A89B;
 
 
   generalLoadTable02: JSR.W UNREACH_01AE8D                 ;01A8B5|208DAE  |01AE8D;
                       BEQ endGenerelLoad                   ;01A8B8|F0E1    |01A89B;
                       JSR.W UNREACH_01ABDB                 ;01A8BA|20DBAB  |01ABDB;
                       JSR.W UNREACH_01AD34                 ;01A8BD|2034AD  |01AD34;
                       JSR.W UNREACH_01AE6F                 ;01A8C0|206FAE  |01AE6F;
                       RTS                                  ;01A8C3|60      |      ;
 
 
   generalLoadTable03: JSR.W UNREACH_01ABDB                 ;01A8C4|20DBAB  |01ABDB;
                       JSR.W UNREACH_01AD34                 ;01A8C7|2034AD  |01AD34;
                       JSR.W UNREACH_01AE6F                 ;01A8CA|206FAE  |01AE6F;
                       LDA.B r_ScrollY                      ;01A8CD|A5FC    |0000FC;
                       BEQ endGenerelLoad                   ;01A8CF|F0CA    |01A89B;
                       RTS                                  ;01A8D1|60      |      ;
 
 
   generalLoadTable04: JSR.W UNREACH_01AE88                 ;01A8D2|2088AE  |01AE88;
                       LDA.B #$03                           ;01A8D5|A903    |      ;
                       STA.W $07EF                          ;01A8D7|8DEF07  |0107EF;
                       JMP.W endGenerelLoad                 ;01A8DA|4C9BA8  |01A89B;
 
 
   generalLoadTable05: JSR.W UNREACH_01AD34                 ;01A8DD|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01A8E0|2022AF  |01AF22;
                       LDA.B r_ScrollY                      ;01A8E3|A5FC    |0000FC;
                       BEQ CODE_01A8E8                      ;01A8E5|F001    |01A8E8;
                       RTS                                  ;01A8E7|60      |      ;
 
 
          CODE_01A8E8: JMP.W endGenerelLoad                 ;01A8E8|4C9BA8  |01A89B;
 
 
   generalLoadTable06: JSR.W UNREACH_01AD34                 ;01A8EB|2034AD  |01AD34;
                       JSR.W UNREACH_01A78C                 ;01A8EE|208CA7  |01A78C;
                       LDA.B #$00                           ;01A8F1|A900    |      ;
                       STA.W $07EE                          ;01A8F3|8DEE07  |0107EE;
                       JMP.W endGenerelLoad                 ;01A8F6|4C9BA8  |01A89B;
 
 
   generalLoadTable07: JSR.W UNREACH_01AD34                 ;01A8F9|2034AD  |01AD34;
                       JSR.W UNREACH_01A790                 ;01A8FC|2090A7  |01A790;
                       BCC CODE_01A91A                      ;01A8FF|9019    |01A91A;
                       JSR.W UNREACH_01A794                 ;01A901|2094A7  |01A794;
                       LDA.B #$21                           ;01A904|A921    |      ;
                       STA.B r_IRQFuncIdx                   ;01A906|853F    |00003F;
                       LDA.B #$01                           ;01A908|A901    |      ;
                       STA.W $078F                          ;01A90A|8D8F07  |01078F;
                       LDA.B #$80                           ;01A90D|A980    |      ;
                       STA.W $07ED                          ;01A90F|8DED07  |0107ED;
                       LDA.B #$00                           ;01A912|A900    |      ;
                       STA.W $07EE                          ;01A914|8DEE07  |0107EE;
                       JMP.W endGenerelLoad                 ;01A917|4C9BA8  |01A89B;
 
 
          CODE_01A91A: RTS                                  ;01A91A|60      |      ;
 
 
   generalLoadTable08: JSR.W UNREACH_01AD34                 ;01A91B|2034AD  |01AD34;
                       LDA.B #$00                           ;01A91E|A900    |      ;
                       STA.B r_pointerQueue_VRAM            ;01A920|8508    |000008;
                       JSR.W UNREACH_01A798                 ;01A922|2098A7  |01A798;
                       LDA.B r_pointerQueue_VRAM            ;01A925|A508    |000008;
                       CMP.B #$09                           ;01A927|C909    |      ;
                       BCS CODE_01A92F                      ;01A929|B004    |01A92F;
                       JSR.W generalLoadTable09             ;01A92B|2045A9  |01A945;
                       RTS                                  ;01A92E|60      |      ;
 
 
          CODE_01A92F: JSR.W UNREACH_01AE88                 ;01A92F|2088AE  |01AE88;
                       LDA.B #$1E                           ;01A932|A91E    |      ;
                       STA.B r_IRQFuncIdx                   ;01A934|853F    |00003F;
                       LDA.B #$80                           ;01A936|A980    |      ;
                       STA.B r_IRQStatus                    ;01A938|8540    |000040;
                       LDA.B #$01                           ;01A93A|A901    |      ;
                       STA.W $078F                          ;01A93C|8D8F07  |01078F;
                       INC.W $07EC                          ;01A93F|EEEC07  |0107EC;
                       JMP.W endGenerelLoad                 ;01A942|4C9BA8  |01A89B;
 
 
   generalLoadTable09: JSR.W UNREACH_01AE8D                 ;01A945|208DAE  |01AE8D;
                       BNE CODE_01A961                      ;01A948|D017    |01A961;
                       LDA.W $07EF                          ;01A94A|ADEF07  |0107EF;
                       BMI CODE_01A961                      ;01A94D|3012    |01A961;
                       LDX.B #$00                           ;01A94F|A200    |      ;
                       JSR.W UNREACH_01AEA2                 ;01A951|20A2AE  |01AEA2;
                       LDA.B #$08                           ;01A954|A908    |      ;
                       STA.W $07ED                          ;01A956|8DED07  |0107ED;
                       LDA.B #$00                           ;01A959|A900    |      ;
                       STA.W $07EE                          ;01A95B|8DEE07  |0107EE;
                       DEC.W $07EF                          ;01A95E|CEEF07  |0107EF;
 
          CODE_01A961: RTS                                  ;01A961|60      |      ;
 
 
   generalLoadTable0a: JSR.W UNREACH_01AD34                 ;01A962|2034AD  |01AD34;
 
          CODE_01A965: LDA.B #$00                           ;01A965|A900    |      ;
                       STA.W $07EF                          ;01A967|8DEF07  |0107EF;
                       STA.W $07F0                          ;01A96A|8DF007  |0107F0;
                       STA.W $07F1                          ;01A96D|8DF107  |0107F1;
                       STA.W $07F2                          ;01A970|8DF207  |0107F2;
                       STA.W $07F3                          ;01A973|8DF307  |0107F3;
                       JMP.W endGenerelLoad                 ;01A976|4C9BA8  |01A89B;
 
 
   generalLoadTable0b: JSR.W UNREACH_01AD34                 ;01A979|2034AD  |01AD34;
                       LDX.B #$02                           ;01A97C|A202    |      ;
                       JSR.W UNREACH_01A780                 ;01A97E|2080A7  |01A780;
                       BCS CODE_01A965                      ;01A981|B0E2    |01A965;
                       RTS                                  ;01A983|60      |      ;
 
 
   generalLoadTable0c: JSR.W UNREACH_01AD34                 ;01A984|2034AD  |01AD34;
                       LDX.B #$00                           ;01A987|A200    |      ;
                       JSR.W UNREACH_01A780                 ;01A989|2080A7  |01A780;
                       BCS CODE_01A965                      ;01A98C|B0D7    |01A965;
                       RTS                                  ;01A98E|60      |      ;
 
 
   generalLoadTable0d: JSR.W UNREACH_01AD34                 ;01A98F|2034AD  |01AD34;
                       LDA.B r_PPUCtrl                      ;01A992|A5FF    |0000FF;
                       ORA.B #$02                           ;01A994|0902    |      ;
                       STA.B r_PPUCtrl                      ;01A996|85FF    |0000FF;
                       LDX.B #$10                           ;01A998|A210    |      ;
                       LDA.B #$02                           ;01A99A|A902    |      ;
                       STA.W $054E,X                        ;01A99C|9D4E05  |01054E;
                       LDA.B #$80                           ;01A99F|A980    |      ;
                       STA.W $0470,X                        ;01A9A1|9D7004  |010470;
                       LDA.B #$00                           ;01A9A4|A900    |      ;
                       STA.W $07EF                          ;01A9A6|8DEF07  |0107EF;
                       STA.W $07F0                          ;01A9A9|8DF007  |0107F0;
                       LDA.B #$7B                           ;01A9AC|A97B    |      ;
                       STA.B r_CHR_BankSpr_0c00             ;01A9AE|8549    |000049;
                       db $20                               ;01A9B0|        |      ;
                       dw CODE_0FE33C                       ;01A9B1|        |0FE33C;
                       LDA.B #$0C                           ;01A9B3|A90C    |      ;
 
                       STA.W $048C,X                        ;01A9B5|9D8C04  |01048C;
                       LDA.B #$DA                           ;01A9B8|A9DA    |      ;
                       STA.W $0400,X                        ;01A9BA|9D0004  |010400;
                       LDA.B #$00                           ;01A9BD|A900    |      ;
                       STA.W $0786                          ;01A9BF|8D8607  |010786;
                       STA.W $0793                          ;01A9C2|8D9307  |010793;
                       STA.W $0787                          ;01A9C5|8D8707  |010787;
                       STA.W $0788                          ;01A9C8|8D8807  |010788;
                       JMP.W endGenerelLoad                 ;01A9CB|4C9BA8  |01A89B;
 
 
   generalLoadTable0e: JSR.W UNREACH_01AD34                 ;01A9CE|2034AD  |01AD34;
                       LDA.B r_currOAM_Attr                 ;01A9D1|A510    |000010;
                       BNE CODE_01A9D6                      ;01A9D3|D001    |01A9D6;
                       RTS                                  ;01A9D5|60      |      ;
 
 
          CODE_01A9D6: JMP.W endGenerelLoad                 ;01A9D6|4C9BA8  |01A89B;
 
 
   generalLoadTable0f: JSR.W UNREACH_01AD34                 ;01A9D9|2034AD  |01AD34;
                       LDA.B r_PPUCtrl                      ;01A9DC|A5FF    |0000FF;
                       AND.B #$FD                           ;01A9DE|29FD    |      ;
                       STA.B r_PPUCtrl                      ;01A9E0|85FF    |0000FF;
                       JSR.W UNREACH_01AE8D                 ;01A9E2|208DAE  |01AE8D;
                       BNE CODE_01AA00                      ;01A9E5|D019    |01AA00;
                       LDX.B #$02                           ;01A9E7|A202    |      ;
                       JSR.W UNREACH_01AEA2                 ;01A9E9|20A2AE  |01AEA2;
                       LDA.B #$08                           ;01A9EC|A908    |      ;
                       STA.W $07ED                          ;01A9EE|8DED07  |0107ED;
                       LDA.B #$00                           ;01A9F1|A900    |      ;
                       STA.W $07EE                          ;01A9F3|8DEE07  |0107EE;
                       INC.W $07EF                          ;01A9F6|EEEF07  |0107EF;
                       LDA.W $07EF                          ;01A9F9|ADEF07  |0107EF;
                       CMP.B #$04                           ;01A9FC|C904    |      ;
                       BEQ CODE_01AA01                      ;01A9FE|F001    |01AA01;
 
          CODE_01AA00: RTS                                  ;01AA00|60      |      ;
 
 
          CODE_01AA01: LDA.B #$48                           ;01AA01|A948    |      ;
                       STA.W $0780                          ;01AA03|8D8007  |010780;
                       LDA.B #$00                           ;01AA06|A900    |      ;
                       STA.W $0781                          ;01AA08|8D8107  |010781;
                       JMP.W endGenerelLoad                 ;01AA0B|4C9BA8  |01A89B;
 
 
   generalLoadTable10: JMP.W CODE_01AA7A                    ;01AA0E|4C7AAA  |01AA7A;
 
 
   generalLoadTable11: JSR.W UNREACH_01AD34                 ;01AA11|2034AD  |01AD34;
                       LDX.B #$06                           ;01AA14|A206    |      ;
 
          CODE_01AA16: LDA.W $07F0                          ;01AA16|ADF007  |0107F0;
                       AND.B #$01                           ;01AA19|2901    |      ;
                       BNE CODE_01AA23                      ;01AA1B|D006    |01AA23;
                       JSR.W UNREACH_01A784                 ;01AA1D|2084A7  |01A784;
                       JMP.W CODE_01AA3C                    ;01AA20|4C3CAA  |01AA3C;
 
 
          CODE_01AA23: JSR.W UNREACH_01A79C                 ;01AA23|209CA7  |01A79C;
                       INC.W $07EF                          ;01AA26|EEEF07  |0107EF;
                       LDA.W $07EF                          ;01AA29|ADEF07  |0107EF;
                       CMP.B #$20                           ;01AA2C|C920    |      ;
                       BNE CODE_01AA3C                      ;01AA2E|D00C    |01AA3C;
 
          CODE_01AA30: LDA.B #$00                           ;01AA30|A900    |      ;
                       STA.W $0783                          ;01AA32|8D8307  |010783;
                       LDA.B #$01                           ;01AA35|A901    |      ;
                       STA.B r_ScrollY                      ;01AA37|85FC    |0000FC;
                       JMP.W CODE_01AA83                    ;01AA39|4C83AA  |01AA83;
 
 
          CODE_01AA3C: INC.W $07F0                          ;01AA3C|EEF007  |0107F0;
                       RTS                                  ;01AA3F|60      |      ;
 
 
   generalLoadTable12: JSR.W UNREACH_01AD34                 ;01AA40|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AA43|2022AF  |01AF22;
                       LDA.B r_ScrollY                      ;01AA46|A5FC    |0000FC;
                       BNE CODE_01AA4D                      ;01AA48|D003    |01AA4D;
                       JMP.W endGenerelLoad                 ;01AA4A|4C9BA8  |01A89B;
 
 
          CODE_01AA4D: RTS                                  ;01AA4D|60      |      ;
 
 
   generalLoadTable13: JSR.W CODE_01AA7A                    ;01AA4E|207AAA  |01AA7A;
 
   generalLoadTable14: JSR.W UNREACH_01AD34                 ;01AA51|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AA54|2022AF  |01AF22;
                       LDX.B #$08                           ;01AA57|A208    |      ;
                       LDA.W $0783                          ;01AA59|AD8307  |010783;
                       STA.B $00                            ;01AA5C|8500    |000000;
                       LDA.B r_ScrollY                      ;01AA5E|A5FC    |0000FC;
                       BEQ CODE_01AA30                      ;01AA60|F0CE    |01AA30;
                       AND.B #$FC                           ;01AA62|29FC    |      ;
                       CMP.B $00                            ;01AA64|C500    |000000;
                       STA.W $0783                          ;01AA66|8D8307  |010783;
                       BEQ CODE_01AA6E                      ;01AA69|F003    |01AA6E;
                       JMP.W CODE_01AA16                    ;01AA6B|4C16AA  |01AA16;
 
 
          CODE_01AA6E: RTS                                  ;01AA6E|60      |      ;
 
 
   generalLoadTable15: LDX.B #$00                           ;01AA6F|A200    |      ;
                       JSR.W UNREACH_01AC7C                 ;01AA71|207CAC  |01AC7C;
                       JSR.W CODE_01AA7A                    ;01AA74|207AAA  |01AA7A;
                       JMP.W generalLoadTable16             ;01AA77|4C94AA  |01AA94;
 
 
          CODE_01AA7A: LDA.B #$00                           ;01AA7A|A900    |      ;
                       STA.W $0783                          ;01AA7C|8D8307  |010783;
                       LDA.B #$01                           ;01AA7F|A901    |      ;
                       STA.B r_ScrollY                      ;01AA81|85FC    |0000FC;
 
          CODE_01AA83: LDA.B #$00                           ;01AA83|A900    |      ;
                       STA.W $07EF                          ;01AA85|8DEF07  |0107EF;
                       STA.W $07F0                          ;01AA88|8DF007  |0107F0;
                       STA.W $07F1                          ;01AA8B|8DF107  |0107F1;
                       STA.W $07F2                          ;01AA8E|8DF207  |0107F2;
                       JMP.W endGenerelLoad                 ;01AA91|4C9BA8  |01A89B;
 
 
   generalLoadTable16: JSR.W UNREACH_01AD34                 ;01AA94|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AA97|2022AF  |01AF22;
                       LDX.B #$00                           ;01AA9A|A200    |      ;
                       JMP.W CODE_01AAD1                    ;01AA9C|4CD1AA  |01AAD1;
 
 
          CODE_01AA9F: LDA.W $07F0                          ;01AA9F|ADF007  |0107F0;
                       AND.B #$01                           ;01AAA2|2901    |      ;
                       BNE CODE_01AAAC                      ;01AAA4|D006    |01AAAC;
                       JSR.W UNREACH_01A784                 ;01AAA6|2084A7  |01A784;
                       JMP.W CODE_01AAC2                    ;01AAA9|4CC2AA  |01AAC2;
 
 
          CODE_01AAAC: JSR.W UNREACH_01A79C                 ;01AAAC|209CA7  |01A79C;
                       INC.W $07EF                          ;01AAAF|EEEF07  |0107EF;
                       LDA.B r_ScrollY                      ;01AAB2|A5FC    |0000FC;
                       BNE CODE_01AAC2                      ;01AAB4|D00C    |01AAC2;
                       LDA.B #$00                           ;01AAB6|A900    |      ;
                       STA.W $0783                          ;01AAB8|8D8307  |010783;
                       LDA.B #$01                           ;01AABB|A901    |      ;
                       STA.B r_ScrollY                      ;01AABD|85FC    |0000FC;
                       JMP.W CODE_01AA83                    ;01AABF|4C83AA  |01AA83;
 
 
          CODE_01AAC2: INC.W $07F0                          ;01AAC2|EEF007  |0107F0;
                       RTS                                  ;01AAC5|60      |      ;
 
 
   generalLoadTable17: JSR.W CODE_01AA7A                    ;01AAC6|207AAA  |01AA7A;
 
   generalLoadTable18: JSR.W UNREACH_01AD34                 ;01AAC9|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AACC|2022AF  |01AF22;
                       LDX.B #$02                           ;01AACF|A202    |      ;
 
          CODE_01AAD1: LDA.W $0783                          ;01AAD1|AD8307  |010783;
                       STA.B $00                            ;01AAD4|8500    |000000;
                       LDA.B r_ScrollY                      ;01AAD6|A5FC    |0000FC;
                       AND.B #$FC                           ;01AAD8|29FC    |      ;
                       CMP.B $00                            ;01AADA|C500    |000000;
                       STA.W $0783                          ;01AADC|8D8307  |010783;
                       BEQ CODE_01AAE4                      ;01AADF|F003    |01AAE4;
                       JMP.W CODE_01AA9F                    ;01AAE1|4C9FAA  |01AA9F;
 
 
          CODE_01AAE4: RTS                                  ;01AAE4|60      |      ;
 
 
   generalLoadTable19: LDA.B #$00                           ;01AAE5|A900    |      ;
                       STA.W $0783                          ;01AAE7|8D8307  |010783;
                       LDA.B #$01                           ;01AAEA|A901    |      ;
                       STA.B r_ScrollY                      ;01AAEC|85FC    |0000FC;
                       JMP.W endGenerelLoad                 ;01AAEE|4C9BA8  |01A89B;
 
 
   generalLoadTable1a: JSR.W UNREACH_01AD34                 ;01AAF1|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AAF4|2022AF  |01AF22;
                       LDX.B #$04                           ;01AAF7|A204    |      ;
                       JMP.W CODE_01AAD1                    ;01AAF9|4CD1AA  |01AAD1;
 
 
   generalLoadTable1b: LDA.B #$55                           ;01AAFC|A955    |      ;
                       STA.B r_updateNametable              ;01AAFE|8525    |000025;
                       LDA.B #$80                           ;01AB00|A980    |      ;
                       STA.W $07ED                          ;01AB02|8DED07  |0107ED;
                       LDA.B #$00                           ;01AB05|A900    |      ;
                       STA.W $07EE                          ;01AB07|8DEE07  |0107EE;
                       STA.W $0784                          ;01AB0A|8D8407  |010784;
                       STA.W $0785                          ;01AB0D|8D8507  |010785;
 
          CODE_01AB10: JMP.W endGenerelLoad                 ;01AB10|4C9BA8  |01A89B;
 
 
   generalLoadTable1c: JSR.W UNREACH_01AE8D                 ;01AB13|208DAE  |01AE8D;
                       BEQ CODE_01AB10                      ;01AB16|F0F8    |01AB10;
 
          CODE_01AB18: JSR.W UNREACH_01ABD5                 ;01AB18|20D5AB  |01ABD5;
                       JSR.W UNREACH_01AD34                 ;01AB1B|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AB1E|2022AF  |01AF22;
 
          CODE_01AB21: RTS                                  ;01AB21|60      |      ;
 
 
   generalLoadTable1d: JSR.W CODE_01AB18                    ;01AB22|2018AB  |01AB18;
                       LDA.B r_ScrollY                      ;01AB25|A5FC    |0000FC;
                       BNE CODE_01AB21                      ;01AB27|D0F8    |01AB21;
                       LDA.B #$00                           ;01AB29|A900    |      ;
                       STA.W $0780                          ;01AB2B|8D8007  |010780;
                       LDA.B #$02                           ;01AB2E|A902    |      ;
                       STA.W $0781                          ;01AB30|8D8107  |010781;
                       LDA.B #$00                           ;01AB33|A900    |      ;
                       STA.W $0784                          ;01AB35|8D8407  |010784;
                       STA.W $0785                          ;01AB38|8D8507  |010785;
                       INC.B r_ScrollY                      ;01AB3B|E6FC    |0000FC;
                       JMP.W endGenerelLoad                 ;01AB3D|4C9BA8  |01A89B;
 
 
   generalLoadTable1e: JSR.W UNREACH_01ABCB                 ;01AB40|20CBAB  |01ABCB;
                       JSR.W UNREACH_01AD34                 ;01AB43|2034AD  |01AD34;
                       JSR.W UNREACH_01AF22                 ;01AB46|2022AF  |01AF22;
                       LDA.B r_ScrollY                      ;01AB49|A5FC    |0000FC;
                       AND.B #$FE                           ;01AB4B|29FE    |      ;
                       BNE CODE_01AB21                      ;01AB4D|D0D2    |01AB21;
                       JMP.W endGenerelLoad                 ;01AB4F|4C9BA8  |01A89B;
 
 
   generalLoadTable1f: LDA.B #$00                           ;01AB52|A900    |      ;
                       STA.B r_coreLoadingFuncAddr          ;01AB54|8516    |000016;
                       JSR.W UNREACH_01AD34                 ;01AB56|2034AD  |01AD34;
                       LDA.B r_coreLoadingFuncAddr          ;01AB59|A516    |000016;
                       BEQ CODE_01AB5E                      ;01AB5B|F001    |01AB5E;
                       RTS                                  ;01AB5D|60      |      ;
 
 
          CODE_01AB5E: LDA.B #$44                           ;01AB5E|A944    |      ;
                       STA.B r_updateNametable              ;01AB60|8525    |000025;
                       JMP.W endGenerelLoad                 ;01AB62|4C9BA8  |01A89B;
 
 
   generalLoadTable20: LDA.B #$00                           ;01AB65|A900    |      ;
                       STA.B r_gameSubstate                 ;01AB67|8519    |000019;
                       LDA.B r_PPUCtrl                      ;01AB69|A5FF    |0000FF;
                       AND.B #$F0                           ;01AB6B|29F0    |      ;
                       STA.B r_PPUCtrl                      ;01AB6D|85FF    |0000FF;
                       db $20                               ;01AB6F|        |      ;
                       dw setNameTableMapping_E4            ;01AB70|        |0FEBFD;
                       RTS                                  ;01AB72|60      |      ;
 
 
          CODE_01AB73: LDX.B #$00                           ;01AB73|A200    |      ;
 
          CODE_01AB75: LDA.B #$01                           ;01AB75|A901    |      ;
                       STA.W $054E,X                        ;01AB77|9D4E05  |01054E;
                       LDA.B #$14                           ;01AB7A|A914    |      ;
                       STA.W $048C,X                        ;01AB7C|9D8C04  |01048C;
                       LDA.B #$10                           ;01AB7F|A910    |      ;
                       STA.W $0400,X                        ;01AB81|9D0004  |010400;
                       TXA                                  ;01AB84|8A      |      ;
                       ASL A                                ;01AB85|0A      |      ;
                       TAY                                  ;01AB86|A8      |      ;
                       LDA.W DATA8_01ABAB,Y                 ;01AB87|B9ABAB  |01ABAB;
                       STA.W $041C,X                        ;01AB8A|9D1C04  |01041C;
                       LDA.W DATA8_01ABAC,Y                 ;01AB8D|B9ACAB  |01ABAC;
                       ORA.B #$80                           ;01AB90|0980    |      ;
                       STA.W $0470,X                        ;01AB92|9D7004  |010470;
                       CPX.B #$08                           ;01AB95|E008    |      ;
                       BCC CODE_01ABA0                      ;01AB97|9007    |01ABA0;
                       LDA.B #$F0                           ;01AB99|A9F0    |      ;
                       STA.W $0438,X                        ;01AB9B|9D3804  |010438;
                       BNE CODE_01ABA5                      ;01AB9E|D005    |01ABA5;
 
          CODE_01ABA0: LDA.B #$10                           ;01ABA0|A910    |      ;
                       STA.W $0438,X                        ;01ABA2|9D3804  |010438;
 
          CODE_01ABA5: INX                                  ;01ABA5|E8      |      ;
                       CPX.B #$10                           ;01ABA6|E010    |      ;
                       BNE CODE_01AB75                      ;01ABA8|D0CB    |01AB75;
                       RTS                                  ;01ABAA|60      |      ;
 
 
         DATA8_01ABAB: db $00                               ;01ABAB|        |      ;
 
         DATA8_01ABAC: db $01,$20,$01,$40,$01               ;01ABAC|        |      ;
                       db $60,$01,$80,$01,$A0               ;01ABB1|        |      ;
                       db $01,$C0,$01,$E0,$01               ;01ABB6|        |      ;
                       db $00,$01,$20                       ;01ABBB|        |      ;
                       db $01,$40,$01,$60,$01               ;01ABBE|        |000040;
                       db $80,$01,$A0,$01,$C0               ;01ABC3|        |01ABC6;
                       db $01,$E0,$01                       ;01ABC8|        |0000E0;
 
       UNREACH_01ABCB: db $A9,$00,$85,$17,$A9               ;01ABCB|        |      ;
                       db $20,$85,$08,$D0,$0E               ;01ABD0|        |010885;
 
       UNREACH_01ABD5: db $A9,$20,$85,$08,$D0               ;01ABD5|        |      ;
                       db $04                               ;01ABDA|        |0000A9;
 
       UNREACH_01ABDB: db $A9,$28,$85,$08,$A9               ;01ABDB|        |      ;
                       db $01,$85,$17,$AD,$83               ;01ABE0|        |000085;
                       db $07,$85,$00,$A5,$FC               ;01ABE5|        |000085;
                       db $29,$F8,$C5,$00,$8D               ;01ABEA|        |      ;
                       db $83,$07,$F0,$5A,$AC               ;01ABEF|        |000007;
                       db $84,$07,$AD,$85,$07               ;01ABF4|        |000007;
                       db $D0,$0A,$B9,$53,$AC               ;01ABF9|        |01AC05;
                       db $C9,$FE,$F0,$4B,$8D               ;01ABFE|        |      ;
                       db $85,$07,$A6,$1D,$A9               ;01AC03|        |000007;
                       db $01,$20,$4E,$AC,$A9               ;01AC08|        |000020;
                       db $00,$85,$01,$A5,$FC               ;01AC0D|        |      ;
                       db $29,$F8,$0A,$26,$01               ;01AC12|        |      ;
                       db $0A,$26,$01,$20,$4E               ;01AC17|        |      ;
                       db $AC,$A5,$01,$05,$08               ;01AC1C|        |0101A5;
                       db $20,$4E,$AC,$C8,$B9               ;01AC21|        |01AC4E;
                       db $53,$AC,$C9,$FF,$F0               ;01AC26|        |0000AC;
                       db $13,$85,$00,$C8,$A5               ;01AC2B|        |000085;
                       db $17,$F0,$03,$B9,$53               ;01AC30|        |0000F0;
                       db $AC,$20,$4E,$AC,$C6               ;01AC35|        |014E20;
                       db $00,$D0,$F9,$F0,$E5               ;01AC3A|        |      ;
                       db $20,$4E,$AC,$86,$1D               ;01AC3F|        |01AC4E;
                       db $CE,$85,$07,$D0,$04               ;01AC44|        |010785;
                       db $C8,$8C,$84,$07,$60               ;01AC49|        |      ;
                       db $9D,$00,$03,$E8,$60               ;01AC4E|        |010300;
                       db $01,$20,$00,$FF,$01               ;01AC53|        |000020;
                       db $04,$00,$18,$6E,$04               ;01AC58|        |000000;
                       db $00,$FF,$19,$03,$00               ;01AC5D|        |      ;
                       db $01,$6D,$17,$00,$01               ;01AC62|        |00006D;
                       db $6D,$04,$00,$FF,$01               ;01AC67|        |010004;
                       db $03,$00,$01,$6D,$17               ;01AC6C|        |000000;
                       db $6E,$01,$6F,$04,$00               ;01AC71|        |016F01;
                       db $FF,$02,$20,$00,$FF               ;01AC76|        |002002;
                       db $FE                               ;01AC7B|        |0100A0;
 
       UNREACH_01AC7C: db $A0,$00,$BD,$D3,$AC               ;01AC7C|        |      ;
                       db $85,$00,$BD,$D4,$AC               ;01AC81|        |000000;
                       db $85,$01,$A6,$1D,$A9               ;01AC86|        |000001;
                       db $01,$20,$CE,$AC,$20               ;01AC8B|        |000020;
                       db $C6,$AC,$20,$C6,$AC               ;01AC90|        |0000AC;
                       db $A9,$0F,$20,$CE,$AC               ;01AC95|        |      ;
                       db $A9,$03,$85,$02,$20               ;01AC9A|        |      ;
                       db $C6,$AC,$C6,$02,$D0               ;01AC9F|        |0000AC;
                       db $F9,$B1,$00,$C9,$FE               ;01ACA4|        |0100B1;
                       db $F0,$0E,$C9,$FF,$F0               ;01ACA9|        |01ACB9;
                       db $03,$4C,$95,$AC,$20               ;01ACAE|        |00004C;
                       db $CE,$AC,$C8,$4C,$8A               ;01ACB3|        |01C8AC;
                       db $AC,$A9,$FF,$20,$CE               ;01ACB8|        |01FFA9;
                       db $AC,$86,$1D,$A9,$04               ;01ACBD|        |011D86;
                       db $20,$E9,$EC,$60,$B1               ;01ACC2|        |01ECE9;
                       db $00,$9D,$00,$03,$E8               ;01ACC7|        |      ;
                       db $C8,$60,$9D,$00,$03               ;01ACCC|        |      ;
                       db $E8,$60,$DD,$AC,$16               ;01ACD1|        |      ;
                       db $AD,$F8,$AC,$07,$AD               ;01ACD6|        |01ACF8;
                       db $25,$AD,$00,$3F,$08               ;01ACDB|        |0000AD;
                       db $17,$20,$04,$25,$20               ;01ACE0|        |000020;
                       db $08,$28,$20,$0F,$01               ;01ACE5|        |      ;
                       db $20,$0F,$17,$38,$04               ;01ACEA|        |01170F;
                       db $25,$38,$08,$28,$38               ;01ACEF|        |000038;
                       db $0F,$01,$38,$FE,$00               ;01ACF4|        |FE3801;
                       db $3F,$0F,$0F,$0F,$2C               ;01ACF9|        |0F0F0F;
                       db $1B,$30,$0F,$0F,$0F               ;01ACFE|        |      ;
                       db $0F,$0F,$0F,$FE,$00               ;01AD03|        |FE0F0F;
                       db $3F,$0F,$0F,$0F,$0F               ;01AD08|        |0F0F0F;
                       db $0F,$0F,$2C,$1B,$30               ;01AD0D|        |1B2C0F;
                       db $0F,$0F,$0F,$FE,$00               ;01AD12|        |FE0F0F;
                       db $3F,$0F,$0F,$0F,$0F               ;01AD17|        |0F0F0F;
                       db $0F,$0F,$0F,$0F,$0F               ;01AD1C|        |0F0F0F;
                       db $2C,$1B,$30,$FE,$00               ;01AD21|        |01301B;
                       db $3F,$0F,$0F,$0F,$0F               ;01AD26|        |0F0F0F;
                       db $0F,$0F,$0F,$0F,$0F               ;01AD2B|        |0F0F0F;
                       db $0F,$0F,$0F,$FE                   ;01AD30|        |FE0F0F;
 
       UNREACH_01AD34: db $A2,$00,$BD,$4E,$05               ;01AD34|        |      ;
                       db $F0,$0F,$0A,$A8,$B9               ;01AD39|        |01AD4A;
                       db $50,$AD,$85,$00,$B9               ;01AD3E|        |01ACED;
                       db $51,$AD,$85,$01,$20               ;01AD43|        |0000AD;
                       db $E0,$A7,$E8,$E0,$12               ;01AD48|        |      ;
                       db $D0,$E7,$60,$56,$AD               ;01AD4D|        |01AD36;
                       db $05,$AE,$57,$AD,$60               ;01AD52|        |0000AE;
                       db $A9,$00,$85,$10,$BD               ;01AD57|        |      ;
                       db $D8,$05,$F0,$04,$DE               ;01AD5C|        |      ;
                       db $D8,$05,$60,$AD,$F0               ;01AD61|        |      ;
                       db $07,$0A,$A8,$B9,$D8               ;01AD66|        |00000A;
                       db $AD,$F0,$4D,$C9,$FF               ;01AD6B|        |014DF0;
                       db $D0,$10,$A9,$01,$85               ;01AD70|        |01AD82;
                       db $10,$A9,$00,$9D,$4E               ;01AD75|        |01AD20;
                       db $05,$9D,$00,$04,$9D               ;01AD7A|        |00009D;
                       db $8C,$04,$60,$C9,$04               ;01AD7F|        |016004;
                       db $90,$15,$38,$E9,$04               ;01AD84|        |01AD9B;
                       db $48,$20,$C9,$AD,$68               ;01AD89|        |      ;
                       db $86,$12,$AA,$E8,$8A               ;01AD8E|        |000012;
                       db $0A,$AA,$20,$7C,$AC               ;01AD93|        |      ;
                       db $A6,$12,$60,$38,$E9               ;01AD98|        |000012;
                       db $01,$48,$20,$C9,$AD               ;01AD9D|        |000048;
                       db $68,$A8,$B9,$FF,$AD               ;01ADA2|        |      ;
                       db $9D,$38,$04,$B9,$02               ;01ADA7|        |010438;
                       db $AE,$9D,$1C,$04,$29               ;01ADAC|        |011C9D;
                       db $40,$9D,$70,$04,$A9               ;01ADB1|        |      ;
                       db $2E,$20,$5F,$E2,$60               ;01ADB6|        |015F20;
                       db $86,$12,$A2,$08,$20               ;01ADBB|        |000012;
                       db $7C,$AC,$A6,$12,$A9               ;01ADC0|        |01A6AC;
                       db $80,$9D,$70,$04,$AD               ;01ADC5|        |01AD64;
                       db $F0,$07,$0A,$A8,$B9               ;01ADCA|        |01ADD3;
                       db $D9,$AD,$9D,$D8,$05               ;01ADCF|        |019DAD;
                       db $EE,$F0,$07,$60,$00               ;01ADD4|        |0107F0;
                       db $10,$01,$02,$00,$02               ;01ADD9|        |01ADDC;
                       db $04,$02,$01,$02,$00               ;01ADDE|        |000002;
                       db $02,$00,$20,$02,$02               ;01ADE3|        |      ;
                       db $00,$02,$05,$02,$02               ;01ADE8|        |      ;
                       db $02,$00,$02,$00,$20               ;01ADED|        |      ;
                       db $03,$02,$00,$02,$06               ;01ADF2|        |000002;
                       db $02,$03,$02,$00,$02               ;01ADF7|        |      ;
                       db $00,$30,$FF,$C0,$40               ;01ADFC|        |      ;
                       db $80,$60,$68,$50,$BD               ;01AE01|        |01AE63;
                       db $DB,$04,$38,$E9,$00               ;01AE06|        |      ;
                       db $9D,$DB,$04,$BD,$1C               ;01AE0B|        |0104DB;
                       db $04,$E9,$04,$9D,$1C               ;01AE10|        |0000E9;
                       db $04,$B0,$0C,$BD,$70               ;01AE15|        |0000B0;
                       db $04,$29,$01,$F0,$05               ;01AE1A|        |000029;
                       db $A9,$40,$9D,$70,$04               ;01AE1F|        |      ;
                       db $AD,$EC,$07,$C9,$1F               ;01AE24|        |0107EC;
                       db $F0,$2A,$C9,$08,$D0               ;01AE29|        |01AE55;
                       db $1B,$BD,$38,$04,$30               ;01AE2E|        |      ;
                       db $16,$BD,$1C,$04,$C9               ;01AE33|        |0000BD;
                       db $08,$90,$0F,$C9,$68               ;01AE38|        |      ;
                       db $B0,$0B,$A9,$14,$9D               ;01AE3D|        |01AE4A;
                       db $8C,$04,$A9,$12,$9D               ;01AE42|        |01A904;
                       db $00,$04,$60,$A9,$14               ;01AE47|        |      ;
                       db $9D,$8C,$04,$A9,$10               ;01AE4C|        |01048C;
                       db $9D,$00,$04,$60,$E6               ;01AE51|        |010400;
                       db $16,$BD,$1C,$04,$C9               ;01AE56|        |0000BD;
                       db $04,$90,$05,$C9,$FC               ;01AE5B|        |000090;
                       db $B0,$01,$60,$A9,$00               ;01AE60|        |01AE63;
                       db $9D,$4E,$05,$9D,$00               ;01AE65|        |01054E;
                       db $04,$9D,$8C,$04,$60               ;01AE6A|        |00009D;
 
       UNREACH_01AE6F: db $AD,$80,$07,$18,$6D               ;01AE6F|        |010780;
                       db $82,$07,$8D,$82,$07               ;01AE74|        |013B7E;
                       db $AD,$81,$07,$65,$FC               ;01AE79|        |010781;
                       db $C9,$F0,$90,$03,$18               ;01AE7E|        |      ;
                       db $69,$10,$85,$FC,$60               ;01AE83|        |      ;
 
       UNREACH_01AE88: db $A9,$50,$85,$25,$60               ;01AE88|        |      ;
 
       UNREACH_01AE8D: db $AD,$ED,$07,$0D,$EE               ;01AE8D|        |0107ED;
                       db $07,$F0,$0C,$CE,$ED               ;01AE92|        |0000F0;
                       db $07,$AC,$ED,$07,$C8               ;01AE97|        |0000AC;
                       db $D0,$03,$CE,$EE,$07               ;01AE9C|        |01AEA1;
                       db $60                               ;01AEA1|        |      ;
 
       UNREACH_01AEA2: db $AD,$EF,$07,$0A,$0A               ;01AEA2|        |0107EF;
                       db $0A,$0A,$85,$04,$BD               ;01AEA7|        |      ;
                       db $00,$AF,$85,$00,$BD               ;01AEAC|        |      ;
                       db $01,$AF,$85,$01,$A6               ;01AEB1|        |0000AF;
                       db $1D,$A0,$00,$A9,$01               ;01AEB6|        |0100A0;
                       db $20,$CE,$AC,$20,$C6               ;01AEBB|        |01ACCE;
                       db $AC,$20,$C6,$AC,$A9               ;01AEC0|        |01C620;
                       db $0F,$20,$CE,$AC,$A9               ;01AEC5|        |ACCE20;
                       db $03,$85,$02,$A5,$04               ;01AECA|        |000085;
                       db $D0,$04,$A9,$0F,$D0               ;01AECF|        |01AED5;
                       db $12,$B1,$00,$29,$0F               ;01AED4|        |0000B1;
                       db $85,$03,$B1,$00,$29               ;01AED9|        |000003;
                       db $F0,$C5,$04,$90,$02               ;01AEDE|        |01AEA5;
                       db $A5,$04,$05,$03,$20               ;01AEE3|        |000004;
                       db $CE,$AC,$C8,$C6,$02               ;01AEE8|        |01C8AC;
                       db $D0,$DE,$B1,$00,$C9               ;01AEED|        |01AECD;
                       db $FF,$D0,$CF,$20,$CE               ;01AEF2|        |20CFD0;
                       db $AC,$86,$1D,$A9,$04               ;01AEF7|        |011D86;
                       db $20,$E9,$EC,$60,$04               ;01AEFC|        |01ECE9;
                       db $AF,$13,$AF,$00,$3F               ;01AF01|        |00AF13;
                       db $08,$17,$20,$04,$25               ;01AF06|        |      ;
                       db $20,$08,$28,$20,$0F               ;01AF0B|        |012808;
                       db $01,$20,$FF,$00,$3F               ;01AF10|        |000020;
                       db $16,$05,$20,$13,$02               ;01AF15|        |000005;
                       db $20,$14,$03,$3B,$16               ;01AF1A|        |010314;
                       db $27,$10,$FF                       ;01AF1F|        |000010;
 
       UNREACH_01AF22: db $A9,$00,$85,$00,$AD               ;01AF22|        |      ;
                       db $80,$07,$18,$6D,$82               ;01AF27|        |01AF30;
                       db $07,$8D,$82,$07,$90               ;01AF2C|        |00008D;
                       db $04,$A9,$01,$85,$00               ;01AF31|        |0000A9;
                       db $AD,$81,$07,$65,$FC               ;01AF36|        |010781;
                       db $C9,$F0,$90,$0C,$18               ;01AF3B|        |      ;
                       db $69,$10,$85,$FC,$A5               ;01AF40|        |      ;
                       db $FF,$49,$02,$85,$FF               ;01AF45|        |850249;
                       db $60,$85,$FC,$18,$A5               ;01AF4A|        |      ;
                       db $00,$F0,$01,$38,$AD               ;01AF4F|        |      ;
                       db $81,$07,$6D,$88,$07               ;01AF54|        |000007;
                       db $8D,$88,$07,$AD,$87               ;01AF59|        |010788;
                       db $07,$69,$00,$8D,$87               ;01AF5E|        |000069;
                       db $07,$60                           ;01AF63|        |000060;
 
       UNREACH_01AF65: db $A5,$19,$20,$6D,$E8               ;01AF65|        |000019;
                       db $84,$AF,$A4,$AF,$C1               ;01AF6A|        |0000AF;
                       db $AF,$E0,$AF,$F4,$AF               ;01AF6F|        |F4AFE0;
                       db $11,$B0,$B9,$B2,$D8               ;01AF74|        |0000B0;
                       db $B2,$00,$B3,$51,$B3               ;01AF79|        |000000;
                       db $68,$B3,$96,$B3,$81               ;01AF7E|        |      ;
                       db $B3,$A5,$19,$30,$08               ;01AF83|        |0000A5;
                       db $A9,$03,$85,$1C,$A9               ;01AF88|        |      ;
                       db $80,$85,$19,$20,$FD               ;01AF8D|        |01AF14;
                       db $EB,$A9,$44,$85,$25               ;01AF92|        |      ;
                       db $8D,$05,$51,$A9,$62               ;01AF97|        |015105;
                       db $20,$5F,$E2,$A9,$01               ;01AF9C|        |01E25F;
                       db $85,$19,$60,$20,$25               ;01AFA1|        |000019;
                       db $B6,$A2,$18,$20,$04               ;01AFA6|        |0000A2;
                       db $EC,$A0,$00,$20,$8D               ;01AFAB|        |0100A0;
                       db $B2,$20,$D6,$E2,$20               ;01AFB0|        |000020;
                       db $C7,$B1,$20,$66,$B0               ;01AFB5|        |0000B1;
                       db $A9,$03,$85,$1C,$E6               ;01AFBA|        |      ;
                       db $19,$60,$A5,$1D,$85               ;01AFBF|        |01A560;
                       db $15,$20,$98,$B5,$20               ;01AFC4|        |000020;
                       db $A4,$FB,$A5,$B4,$C9               ;01AFC9|        |0000FB;
                       db $FF,$D0,$0E,$A9,$00               ;01AFCE|        |A90ED0;
                       db $A6,$15,$9D,$00,$03               ;01AFD3|        |000015;
                       db $86,$1D,$20,$75,$B6               ;01AFD8|        |00001D;
                       db $E6,$19,$60,$20,$6E               ;01AFDD|        |000019;
                       db $B0,$A5,$26,$29,$10               ;01AFE2|        |01AF89;
                       db $D0,$04,$A5,$2D,$F0               ;01AFE7|        |01AFED;
                       db $19,$A0,$00,$84,$2D               ;01AFEC|        |0100A0;
                       db $E6,$19,$60,$A4,$6B               ;01AFF1|        |000019;
                       db $D0,$0F,$A9,$07,$8D               ;01AFF6|        |01B007;
                       db $60,$01,$20,$66,$B0               ;01AFFB|        |      ;
                       db $A9,$78,$85,$30,$E6               ;01B000|        |      ;
                       db $19,$60,$E6,$19,$4C               ;01B005|        |01E660;
                       db $66,$B0,$A9,$02,$85               ;01B00A|        |0000B0;
                       db $19,$60,$20,$7A,$B1               ;01B00F|        |012060;
                       db $A9,$00,$8D,$01,$04               ;01B014|        |      ;
                       db $A5,$6B,$D0,$2A,$C6               ;01B019|        |00006B;
                       db $30,$F0,$2F,$A5,$B4               ;01B01E|        |01B010;
                       db $C9,$FF,$F0,$35,$A5               ;01B023|        |      ;
                       db $30,$C9,$30,$B0,$2F               ;01B028|        |01AFF3;
                       db $A5,$1D,$85,$15,$20               ;01B02D|        |00001D;
                       db $98,$B5,$20,$AF,$FB               ;01B032|        |      ;
                       db $A5,$B4,$C9,$FF,$D0               ;01B037|        |0000B4;
                       db $1F,$A9,$00,$A6,$15               ;01B03C|        |A600A9;
                       db $9D,$00,$03,$86,$1D               ;01B041|        |010300;
                       db $60,$20,$2D,$B0,$A5               ;01B046|        |      ;
                       db $B4,$C9,$FF,$D0,$0C               ;01B04B|        |0000C9;
                       db $A9,$00,$85,$2D,$A5               ;01B050|        |      ;
                       db $6B,$F0,$05,$A9,$06               ;01B055|        |      ;
                       db $85,$19,$60,$A9,$FF               ;01B05A|        |000019;
                       db $85,$3A,$A9,$09,$4C               ;01B05F|        |00003A;
                       db $74,$E5,$A0,$00,$84               ;01B064|        |0000E5;
                       db $B4,$C8,$84,$B5,$60               ;01B069|        |0000C8;
                       db $20,$7A,$B0,$20,$7A               ;01B06E|        |01B07A;
                       db $B1,$20,$DC,$B1,$4C               ;01B073|        |000020;
                       db $4E,$B1,$A2,$00,$20               ;01B078|        |01A2B1;
                       db $CC,$B0,$20,$82,$B0               ;01B07D|        |0120B0;
                       db $AD,$81,$07,$C9,$03               ;01B082|        |010781;
                       db $90,$3C,$A5,$10,$29               ;01B087|        |01B0C5;
                       db $0C,$F0,$1B,$AC,$80               ;01B08C|        |011BF0;
                       db $07,$B9,$75,$B2,$C9               ;01B091|        |0000B9;
                       db $FC,$D0,$11,$A9,$02               ;01B096|        |0111D0;
                       db $C0,$03,$F0,$08,$A9               ;01B09B|        |      ;
                       db $05,$C0,$04,$F0,$02               ;01B0A0|        |0000C0;
                       db $A9,$08,$8D,$80,$07               ;01B0A5|        |      ;
                       db $A5,$10,$29,$03,$F0               ;01B0AA|        |000010;
                       db $15,$AA,$AC,$80,$07               ;01B0AF|        |0000AA;
                       db $B9,$75,$B2,$C9,$FC               ;01B0B4|        |01B275;
                       db $D0,$0A,$BD,$C6,$B0               ;01B0B9|        |01B0C5;
                       db $18,$6D,$80,$07,$8D               ;01B0BE|        |      ;
                       db $80,$07,$60,$00,$01               ;01B0C3|        |01B0CC;
                       db $FF,$01,$A2,$01,$20               ;01B0C8|        |01A201;
                       db $2B,$B1,$85,$00,$29               ;01B0CD|        |      ;
                       db $0F,$F0,$05,$A9,$1A               ;01B0D2|        |A905F0;
                       db $20,$5F,$E2,$46,$00               ;01B0D7|        |01E25F;
                       db $90,$0F,$AD,$80,$07               ;01B0DC|        |01B0ED;
                       db $69,$00,$DD,$27,$B1               ;01B0E1|        |      ;
                       db $90,$02,$A9,$00,$8D               ;01B0E6|        |01B0EA;
                       db $80,$07,$46,$00,$90               ;01B0EB|        |01B0F4;
                       db $0F,$AD,$80,$07,$E9               ;01B0F0|        |0780AD;
                       db $01,$10,$05,$BC,$27               ;01B0F5|        |000010;
                       db $B1,$88,$98,$8D,$80               ;01B0FA|        |000088;
                       db $07,$46,$00,$90,$0F               ;01B0FF|        |000046;
                       db $AD,$81,$07,$69,$00               ;01B104|        |010781;
                       db $DD,$29,$B1,$90,$02               ;01B109|        |01B129;
                       db $A9,$00,$8D,$81,$07               ;01B10E|        |      ;
                       db $46,$00,$90,$0F,$AD               ;01B113|        |000000;
                       db $81,$07,$E9,$01,$10               ;01B118|        |000007;
                       db $05,$BC,$29,$B1,$88               ;01B11D|        |0000BC;
                       db $98,$8D,$81,$07,$60               ;01B122|        |      ;
                       db $09,$04,$04,$04,$E0               ;01B127|        |      ;
                       db $01,$B0,$1A,$18,$A0               ;01B12C|        |0000B0;
                       db $00,$A5,$28,$29,$0F               ;01B131|        |      ;
                       db $F0,$0A,$AC,$B0,$07               ;01B136|        |01B142;
                       db $C8,$C0,$0E,$90,$02               ;01B13B|        |      ;
                       db $A0,$00,$8C,$B0,$07               ;01B140|        |      ;
                       db $A5,$28,$B0,$02,$A5               ;01B145|        |000028;
                       db $26,$85,$10,$60,$A0               ;01B14A|        |000085;
                       db $01,$A2,$01,$A5,$1A               ;01B14F|        |0000A2;
                       db $29,$10,$F0,$1C,$AD               ;01B154|        |      ;
                       db $85,$07,$18,$69,$47               ;01B159|        |000007;
                       db $85,$00,$AD,$84,$07               ;01B15E|        |000000;
                       db $0A,$0A,$0A,$18,$69               ;01B163|        |      ;
                       db $60,$85,$01,$20,$AC               ;01B168|        |      ;
                       db $B1,$A9,$F6,$9D,$00               ;01B16D|        |0000A9;
                       db $04,$60,$A9,$00,$9D               ;01B172|        |000060;
                       db $00,$04,$60,$20,$90               ;01B177|        |      ;
                       db $B1,$A0,$F8,$FE,$7C               ;01B17C|        |0000A0;
                       db $05,$BD,$7C,$05,$29               ;01B181|        |0000BD;
                       db $08,$D0,$02,$A0,$FA               ;01B186|        |      ;
                       db $98,$9D,$00,$04,$60               ;01B18B|        |      ;
                       db $A0,$00,$A2,$00,$AD               ;01B190|        |      ;
                       db $81,$07,$0A,$0A,$0A               ;01B195|        |000007;
                       db $0A,$18,$69,$88,$85               ;01B19A|        |      ;
                       db $00,$AD,$80,$07,$0A               ;01B19F|        |      ;
                       db $0A,$0A,$0A,$18,$69               ;01B1A4|        |      ;
                       db $3C,$85,$01,$A5,$00               ;01B1A9|        |010185;
                       db $9D,$1C,$04,$A5,$01               ;01B1AE|        |01041C;
                       db $9D,$38,$04,$B9,$C3               ;01B1B3|        |010438;
                       db $B1,$9D,$8C,$04,$B9               ;01B1B8|        |00009D;
                       db $C5,$B1,$9D,$54,$04               ;01B1BD|        |0000B1;
                       db $60,$0C,$0C,$23,$00               ;01B1C2|        |      ;
                       db $A2,$00,$BD,$D4,$B1               ;01B1C7|        |      ;
                       db $95,$46,$E8,$E0,$08               ;01B1CC|        |000046;
                       db $90,$F6,$60,$40,$01               ;01B1D1|        |01B1C9;
                       db $00,$43,$40,$41,$42               ;01B1D6|        |      ;
                       db $73,$A5,$26,$29,$C0               ;01B1DB|        |0000A5;
                       db $F0,$4C,$A5,$26,$29               ;01B1E0|        |01B22E;
                       db $80,$F0,$47,$AD,$81               ;01B1E5|        |01B1D7;
                       db $07,$85,$00,$A5,$00               ;01B1EA|        |000085;
                       db $F0,$0A,$A9,$00,$18               ;01B1EF|        |01B1FB;
                       db $6D,$27,$B1,$C6,$00               ;01B1F4|        |01B127;
                       db $D0,$F9,$18,$6D,$80               ;01B1F9|        |01B1F4;
                       db $07,$A8,$AE,$84,$07               ;01B1FE|        |0000A8;
                       db $B9,$5A,$B2,$C9,$FF               ;01B203|        |01B25A;
                       db $F0,$3C,$C9,$FE,$F0               ;01B208|        |01B246;
                       db $3D,$C9,$FD,$F0,$28               ;01B20D|        |01FDC9;
                       db $C9,$FC,$F0,$43,$9D               ;01B212|        |      ;
                       db $F8,$07,$20,$7E,$B2               ;01B217|        |      ;
                       db $A9,$1B,$20,$5F,$E2               ;01B21C|        |      ;
                       db $AC,$84,$07,$C8,$C0               ;01B221|        |010784;
                       db $08,$90,$02,$A0,$00               ;01B226|        |      ;
                       db $8C,$84,$07,$60,$20               ;01B22B|        |010784;
                       db $3A,$B2,$A9,$00,$99               ;01B230|        |      ;
                       db $F8,$07,$4C,$7E,$B2               ;01B235|        |      ;
                       db $AC,$84,$07,$88,$10               ;01B23A|        |010784;
                       db $02,$A0,$07,$8C,$84               ;01B23F|        |      ;
                       db $07,$60,$A9,$01,$85               ;01B244|        |000060;
                       db $2D,$60,$AC,$84,$07               ;01B249|        |01AC60;
                       db $C8,$C0,$08,$90,$02               ;01B24E|        |      ;
                       db $A0,$00,$8C,$84,$07               ;01B253|        |      ;
                       db $60,$60,$50,$51,$52               ;01B258|        |      ;
                       db $53,$54,$55,$56,$57               ;01B25D|        |000054;
                       db $58,$59,$5A,$5B,$5C               ;01B262|        |      ;
                       db $5D,$5E,$5F,$60,$61               ;01B267|        |015F5E;
                       db $62,$63,$64,$65,$66               ;01B26C|        |0116D2;
                       db $67,$68,$69,$00,$6A               ;01B271|        |000068;
                       db $6B,$4B,$FC,$FC,$FD               ;01B276|        |      ;
                       db $FE,$FC,$FF,$48,$A0               ;01B27B|        |01FFFC;
                       db $00,$20,$A0,$B2,$68               ;01B280|        |      ;
                       db $20,$14,$ED,$4C,$12               ;01B285|        |01ED14;
                       db $ED,$A0,$02,$20,$A0               ;01B28A|        |0102A0;
                       db $B2,$A0,$00,$B9,$F8               ;01B28F|        |0000A0;
                       db $07,$20,$14,$ED,$C8               ;01B294|        |000020;
                       db $C0,$08,$90,$F5,$4C               ;01B299|        |      ;
                       db $12,$ED,$A9,$01,$20               ;01B29E|        |0000ED;
                       db $14,$ED,$AD,$84,$07               ;01B2A3|        |0000ED;
                       db $18,$79,$B5,$B2,$20               ;01B2A8|        |      ;
                       db $14,$ED,$B9,$B6,$B2               ;01B2AD|        |0000ED;
                       db $4C,$14,$ED,$EC,$20               ;01B2B2|        |01ED14;
                       db $AC,$20,$20,$FD,$EB               ;01B2B7|        |012020;
                       db $A9,$98,$A2,$1A,$20               ;01B2BC|        |      ;
                       db $D5,$EB,$20,$75,$B6               ;01B2C1|        |0000EB;
                       db $20,$8B,$B2,$A9,$02               ;01B2C6|        |01B28B;
                       db $85,$1C,$20,$25,$B6               ;01B2CB|        |00001C;
                       db $20,$66,$B0,$E6,$19               ;01B2D0|        |01B066;
                       db $4C,$C7,$B1,$A5,$B4               ;01B2D5|        |01B1C7;
                       db $C9,$FF,$F0,$1A,$A5               ;01B2DA|        |      ;
                       db $1D,$85,$15,$20,$98               ;01B2DF|        |011585;
                       db $B5,$20,$A4,$FB,$A5               ;01B2E4|        |000020;
                       db $B4,$C9,$FF,$D0,$4A               ;01B2E9|        |0000C9;
                       db $A9,$00,$A6,$15,$9D               ;01B2EE|        |      ;
                       db $00,$03,$86,$1D,$60               ;01B2F3|        |      ;
                       db $E6,$19,$20,$8D,$B4               ;01B2F8|        |000019;
                       db $4C,$71,$B4,$20,$DB               ;01B2FD|        |01B471;
                       db $B3,$20,$0C,$B5,$20               ;01B302|        |000020;
                       db $B9,$B3,$A5,$26,$29               ;01B307|        |01A5B3;
                       db $30,$D0,$04,$A5,$2D               ;01B30C|        |01B2DE;
                       db $F0,$25,$A5,$26,$29               ;01B311|        |01B338;
                       db $20,$D0,$30,$20,$56               ;01B316|        |0130D0;
                       db $B6,$A2,$05,$20,$27               ;01B31B|        |0000A2;
                       db $B6,$AD,$8B,$07,$F0               ;01B320|        |0000AD;
                       db $13,$A9,$40,$20,$5F               ;01B325|        |0000A9;
                       db $E2,$A9,$09,$85,$19               ;01B32A|        |      ;
                       db $A9,$23,$20,$E9,$EC               ;01B32F|        |      ;
                       db $A9,$78,$85,$30,$60               ;01B334|        |      ;
                       db $A9,$78,$85,$30,$A9               ;01B339|        |      ;
                       db $07,$8D,$60,$01,$A9               ;01B33E|        |00008D;
                       db $0A,$85,$19,$4C,$66               ;01B343|        |      ;
                       db $B0,$20,$66,$B0,$A9               ;01B348|        |01B36A;
                       db $0B,$85,$19,$60,$A9               ;01B34D|        |      ;
                       db $22,$20,$AB,$B3,$C6               ;01B352|        |B3AB20;
                       db $30,$D0,$F6,$20,$66               ;01B357|        |01B329;
                       db $B0,$A9,$0C,$85,$19               ;01B35C|        |01B307;
                       db $A9,$00,$85,$1D,$4C               ;01B361|        |      ;
                       db $82,$B6,$A5,$B4,$C9               ;01B366|        |01591F;
                       db $FF,$F0,$0A,$A5,$1D               ;01B36B|        |A50AF0;
                       db $85,$15,$20,$98,$B5               ;01B370|        |000015;
                       db $20,$AF,$FB,$C6,$30               ;01B375|        |01FBAF;
                       db $D0,$D4,$A9,$0E,$4C               ;01B37A|        |01B350;
                       db $74,$E5,$A5,$1D,$85               ;01B37F|        |0000E5;
                       db $15,$20,$98,$B5,$20               ;01B384|        |000020;
                       db $AF,$FB,$A5,$B4,$C9               ;01B389|        |B4A5FB;
                       db $FF,$D0,$19,$A9,$06               ;01B38E|        |A919D0;
                       db $85,$19,$60,$A5,$1D               ;01B393|        |000019;
                       db $85,$15,$20,$98,$B5               ;01B398|        |000015;
                       db $20,$AF,$FB,$A5,$B4               ;01B39D|        |01FBAF;
                       db $C9,$FF,$D0,$04,$A9               ;01B3A2|        |      ;
                       db $01,$85,$19,$60,$85               ;01B3A7|        |000085;
                       db $00,$A5,$30,$29,$10               ;01B3AC|        |      ;
                       db $0A,$0A,$0A,$05,$00               ;01B3B1|        |      ;
                       db $4C,$E9,$EC,$A5,$1A               ;01B3B6|        |01ECE9;
                       db $29,$01,$D0,$0E,$AD               ;01B3BB|        |      ;
                       db $8D,$07,$F0,$16,$20               ;01B3C0|        |01F007;
                       db $8D,$B4,$A9,$00,$8D               ;01B3C5|        |01A9B4;
                       db $8D,$07,$60,$AD,$8C               ;01B3CA|        |016007;
                       db $07,$F0,$08,$20,$71               ;01B3CF|        |0000F0;
                       db $B4,$A9,$00,$8D,$8C               ;01B3D4|        |0000A9;
                       db $07,$60,$20,$33,$B5               ;01B3D9|        |000060;
                       db $20,$FB,$B3,$A5,$26               ;01B3DE|        |01B3FB;
                       db $29,$0F,$F0,$11,$AD               ;01B3E3|        |      ;
                       db $81,$07,$8D,$83,$07               ;01B3E8|        |000007;
                       db $AD,$80,$07,$8D,$82               ;01B3ED|        |010780;
                       db $07,$A9,$01,$8D,$8C               ;01B3F2|        |0000A9;
                       db $07,$4C,$CA,$B0,$A2               ;01B3F7|        |00004C;
                       db $02,$A0,$01,$20,$14               ;01B3FC|        |      ;
                       db $B4,$B9,$33,$B4,$9D               ;01B401|        |0000B9;
                       db $38,$04,$A9,$50,$9D               ;01B406|        |      ;
                       db $1C,$04,$E8,$C8,$E0               ;01B40B|        |01E804;
                       db $05,$90,$EC,$60,$B9               ;01B410|        |000090;
                       db $27,$B4,$9D,$00,$04               ;01B415|        |0000B4;
                       db $B9,$2B,$B4,$9D,$8C               ;01B41A|        |01B42B;
                       db $04,$B9,$2F,$B4,$9D               ;01B41F|        |0000B9;
                       db $54,$04,$60,$00,$42               ;01B424|        |      ;
                       db $FC,$F4,$00,$14,$0C               ;01B429|        |0100F4;
                       db $0C,$00,$00,$00,$00               ;01B42E|        |010000;
                       db $50,$70,$90,$B0,$04               ;01B433|        |01B4A5;
                       db $04,$86,$A4,$A4,$87               ;01B438|        |000086;
                       db $96,$00,$00,$97,$96               ;01B43D|        |000000;
                       db $00,$00,$97,$A6,$A5               ;01B442|        |      ;
                       db $A5,$A7,$04,$04,$80               ;01B447|        |0000A7;
                       db $81,$81,$82,$90,$00               ;01B44C|        |000081;
                       db $00,$92,$90,$00,$00               ;01B451|        |      ;
                       db $92,$A0,$A1,$A1,$A2               ;01B456|        |0000A0;
                       db $03,$03,$86,$A4,$87               ;01B45B|        |000003;
                       db $96,$00,$97,$A6,$A5               ;01B460|        |000000;
                       db $A7,$03,$03,$80,$81               ;01B465|        |000003;
                       db $82,$90,$00,$92,$A0               ;01B46A|        |01B4FD;
                       db $A1,$A2,$AD,$83,$07               ;01B46F|        |0000A2;
                       db $AC,$82,$07,$20,$EB               ;01B474|        |010782;
                       db $B4,$A0,$2F,$20,$A0               ;01B479|        |0000A0;
                       db $B4,$AD,$81,$07,$AC               ;01B47E|        |0000AD;
                       db $80,$07,$20,$EB,$B4               ;01B483|        |01B48C;
                       db $A0,$24,$4C,$A0,$B4               ;01B488|        |      ;
                       db $AD,$87,$07,$20,$DF               ;01B48D|        |010787;
                       db $B4,$A0,$12,$20,$A0               ;01B492|        |0000A0;
                       db $B4,$AD,$86,$07,$20               ;01B497|        |0000AD;
                       db $DF,$B4,$A0,$00,$B9               ;01B49C|        |00A0B4;
                       db $37,$B4,$85,$03,$C8               ;01B4A1|        |0000B4;
                       db $B9,$37,$B4,$85,$04               ;01B4A6|        |01B437;
                       db $C8,$A9,$01,$20,$14               ;01B4AB|        |      ;
                       db $ED,$A5,$00,$20,$14               ;01B4B0|        |0100A5;
                       db $ED,$A5,$01,$20,$14               ;01B4B5|        |0101A5;
                       db $ED,$A5,$04,$85,$05               ;01B4BA|        |0104A5;
                       db $B9,$37,$B4,$C8,$20               ;01B4BF|        |01B437;
                       db $14,$ED,$C6,$05,$D0               ;01B4C4|        |0000ED;
                       db $F5,$20,$12,$ED,$18               ;01B4C9|        |000020;
                       db $A9,$20,$65,$00,$85               ;01B4CE|        |      ;
                       db $00,$A9,$00,$65,$01               ;01B4D3|        |      ;
                       db $85,$01,$C6,$03,$D0               ;01B4D8|        |000001;
                       db $CE,$60,$0A,$0A,$18               ;01B4DD|        |010A60;
                       db $69,$08,$85,$00,$A9               ;01B4E2|        |      ;
                       db $21,$85,$01,$60,$0A               ;01B4E7|        |000085;
                       db $AA,$BD,$00,$B5,$85               ;01B4EC|        |      ;
                       db $00,$BD,$01,$B5,$85               ;01B4F1|        |      ;
                       db $01,$A5,$00,$18,$79               ;01B4F6|        |0000A5;
                       db $08,$B5,$85,$00,$60               ;01B4FB|        |      ;
                       db $C0,$21,$20,$22,$80               ;01B500|        |      ;
                       db $22,$E0,$22,$0A,$0D               ;01B505|        |0A22E0;
                       db $10,$13,$A2,$00,$AD               ;01B50A|        |01B51F;
                       db $81,$07,$0A,$0A,$0A               ;01B50F|        |000007;
                       db $85,$00,$0A,$18,$65               ;01B514|        |000000;
                       db $00,$18,$69,$7A,$9D               ;01B519|        |      ;
                       db $1C,$04,$AD,$80,$07               ;01B51E|        |01AD04;
                       db $0A,$0A,$0A,$85,$01               ;01B523|        |      ;
                       db $0A,$18,$65,$01,$18               ;01B528|        |      ;
                       db $69,$5D,$9D,$38,$04               ;01B52D|        |      ;
                       db $60,$A5,$26,$29,$40               ;01B532|        |      ;
                       db $F0,$17,$A9,$1A,$20               ;01B537|        |01B550;
                       db $5F,$E2,$A9,$01,$8D               ;01B53C|        |01A9E2;
                       db $8D,$07,$AC,$86,$07               ;01B541|        |01AC07;
                       db $8C,$87,$07,$C8,$98               ;01B546|        |010787;
                       db $29,$03,$8D,$86,$07               ;01B54B|        |      ;
                       db $A5,$26,$29,$80,$F0               ;01B550|        |000026;
                       db $DC,$A9,$1B,$20,$5F               ;01B555|        |001BA9;
                       db $E2,$AD,$81,$07,$0A               ;01B55A|        |      ;
                       db $0A,$6D,$80,$07,$A8               ;01B55F|        |      ;
                       db $AD,$81,$07,$0A,$0A               ;01B564|        |010781;
                       db $0D,$80,$07,$48,$18               ;01B569|        |010780;
                       db $69,$05,$AA,$68,$0A               ;01B56E|        |      ;
                       db $0A,$0D,$86,$07,$85               ;01B573|        |      ;
                       db $00,$29,$03,$D0,$04               ;01B578|        |      ;
                       db $A9,$00,$F0,$02,$A5               ;01B57D|        |      ;
                       db $00,$99,$90,$07,$AC               ;01B582|        |      ;
                       db $86,$07,$AD,$38,$04               ;01B587|        |000007;
                       db $9D,$38,$04,$AD,$1C               ;01B58C|        |010438;
                       db $04,$9D,$1C,$04,$4C               ;01B591|        |00009D;
                       db $14,$B4,$A9,$1E,$20               ;01B596|        |0000B4;
                       db $E9,$EC,$A9,$04,$4C               ;01B59B|        |      ;
                       db $E9,$EC                           ;01B5A0|        |      ;
 
       UNREACH_01B5A2: db $A5,$19,$20,$6D,$E8               ;01B5A2|        |000019;
                       db $AD,$B5,$E4,$B5,$10               ;01B5A7|        |01E4B5;
                       db $B6,$A9,$44,$85,$25               ;01B5AC|        |0000A9;
                       db $8D,$05,$51,$20,$FD               ;01B5B1|        |015105;
                       db $EB,$A9,$98,$A2,$1A               ;01B5B6|        |      ;
                       db $20,$D5,$EB,$20,$D6               ;01B5BB|        |01EBD5;
                       db $E2,$A9,$62,$20,$5F               ;01B5C0|        |      ;
                       db $E2,$E6,$19,$20,$C7               ;01B5C5|        |      ;
                       db $B1,$20,$25,$B6,$20               ;01B5CA|        |000020;
                       db $75,$B6,$20,$4A,$B6               ;01B5CF|        |0000B6;
                       db $20,$8B,$B2,$20,$47               ;01B5D4|        |01B28B;
                       db $B6,$20,$66,$B0,$A9               ;01B5D9|        |000020;
                       db $03,$85,$1C,$4C,$FB               ;01B5DE|        |000085;
                       db $B3,$A5,$B4,$C9,$FF               ;01B5E3|        |0000A5;
                       db $F0,$1A,$A5,$1D,$85               ;01B5E8|        |01B604;
                       db $15,$20,$98,$B5,$20               ;01B5ED|        |000020;
                       db $A4,$FB,$A5,$B4,$C9               ;01B5F2|        |0000FB;
                       db $FF,$D0,$15,$A9,$00               ;01B5F7|        |A915D0;
                       db $A6,$15,$86,$1D,$9D               ;01B5FC|        |000015;
                       db $00,$03,$60,$A5,$26               ;01B601|        |      ;
                       db $29,$10,$F0,$05,$20               ;01B606|        |      ;
                       db $66,$B0,$E6,$19,$60               ;01B60B|        |0000B0;
                       db $A5,$B4,$C9,$FF,$F0               ;01B610|        |0000B4;
                       db $0A,$A5,$1D,$85,$15               ;01B615|        |      ;
                       db $20,$98,$B5,$4C,$AF               ;01B61A|        |01B598;
                       db $FB,$A9,$00,$4C,$74               ;01B61F|        |      ;
                       db $E5,$A2,$00,$A9,$00               ;01B624|        |0000A2;
                       db $9D,$00,$04,$9D,$1C               ;01B629|        |010400;
                       db $04,$9D,$38,$04,$9D               ;01B62E|        |00009D;
                       db $54,$04,$9D,$70,$04               ;01B633|        |      ;
                       db $9D,$8C,$04,$9D,$A8               ;01B638|        |01048C;
                       db $04,$9D,$4E,$05,$E8               ;01B63D|        |00009D;
                       db $E0,$17,$90,$E3,$60               ;01B642|        |      ;
                       db $4C,$40,$B9,$20,$CD               ;01B647|        |01B940;
                       db $B6,$8D,$8A,$07,$20               ;01B64C|        |00008D;
                       db $EE,$B6,$4C,$C4,$B8               ;01B651|        |014CB6;
                       db $20,$CD,$B6,$85,$10               ;01B656|        |01B6CD;
                       db $20,$9A,$B7,$20,$F0               ;01B65B|        |01B79A;
                       db $B7,$20,$8F,$B6,$20               ;01B660|        |000020;
                       db $2C,$B8,$20,$93,$E5               ;01B665|        |0120B8;
                       db $B0,$03,$20,$7F,$B8               ;01B66A|        |01B66F;
                       db $20,$56,$B7,$4C,$65               ;01B66F|        |01B756;
                       db $B8,$A9,$00,$A2,$00               ;01B674|        |      ;
                       db $9D,$80,$07,$E8,$E0               ;01B679|        |010780;
                       db $10,$90,$F8,$60,$A0               ;01B67E|        |01B610;
                       db $00,$A9,$00,$99,$90               ;01B683|        |      ;
                       db $07,$C8,$C0,$10,$90               ;01B688|        |0000C8;
                       db $F8,$60,$A2,$00,$AD               ;01B68D|        |      ;
                       db $8F,$07,$0A,$0A,$0A               ;01B692|        |0A0A07;
                       db $6D,$8F,$07,$85,$00               ;01B697|        |01078F;
                       db $A4,$00,$B9,$B2,$B6               ;01B69C|        |000000;
                       db $20,$E2,$B7,$B9,$90               ;01B6A1|        |01B7E2;
                       db $07,$9D,$A0,$07,$E6               ;01B6A6|        |00009D;
                       db $00,$E8,$E0,$09,$90               ;01B6AB|        |      ;
                       db $EB,$60,$00,$33,$20               ;01B6B0|        |      ;
                       db $13,$22,$01,$11,$03               ;01B6B5|        |000022;
                       db $32,$12,$10,$02,$32               ;01B6BA|        |000012;
                       db $23,$13,$30,$21,$01               ;01B6BF|        |000013;
                       db $31,$13,$01,$22,$10               ;01B6C4|        |000013;
                       db $30,$33,$03,$21,$A9               ;01B6C9|        |01B6FE;
                       db $00,$85,$00,$AA,$BD               ;01B6CE|        |      ;
                       db $F8,$07,$18,$7D,$E6               ;01B6D3|        |      ;
                       db $B6,$18,$65,$00,$85               ;01B6D8|        |000018;
                       db $00,$E8,$E0,$08,$D0               ;01B6DD|        |      ;
                       db $EF,$29,$07,$60,$07               ;01B6E2|        |600729;
                       db $03,$01,$06,$02,$04               ;01B6E7|        |000001;
                       db $05,$00,$AD,$8A,$07               ;01B6EC|        |000000;
                       db $85,$00,$A5,$2E,$C9               ;01B6F1|        |000000;
                       db $11,$90,$02,$A9,$11               ;01B6F6|        |000090;
                       db $85,$2E,$4A,$26,$00               ;01B6FB|        |00002E;
                       db $A5,$1A,$4A,$26,$00               ;01B700|        |00001A;
                       db $26,$00,$26,$00,$A5               ;01B705|        |000000;
                       db $3A,$10,$02,$A9,$00               ;01B70A|        |      ;
                       db $05,$00,$0A,$0D,$F6               ;01B70F|        |000000;
                       db $07,$8D,$88,$07,$A5               ;01B714|        |00008D;
                       db $1A,$4A,$A9,$50,$90               ;01B719|        |      ;
                       db $02,$A9,$A0,$85,$04               ;01B71E|        |      ;
                       db $20,$2A,$B7,$8D,$89               ;01B723|        |01B72A;
                       db $07,$60,$AD,$88,$07               ;01B728|        |000060;
                       db $29,$F0,$85,$02,$AD               ;01B72D|        |      ;
                       db $88,$07,$0A,$0A,$0A               ;01B732|        |      ;
                       db $0A,$85,$03,$18,$65               ;01B737|        |      ;
                       db $02,$85,$01,$A5,$04               ;01B73C|        |      ;
                       db $45,$02,$85,$00,$A5               ;01B741|        |000002;
                       db $04,$45,$03,$18,$65               ;01B746|        |000045;
                       db $00,$4A,$4A,$4A,$4A               ;01B74B|        |      ;
                       db $05,$01,$18,$65,$2E               ;01B750|        |000001;
                       db $60,$AD,$88,$07,$29               ;01B755|        |      ;
                       db $01,$8D,$F6,$07,$AD               ;01B75A|        |00008D;
                       db $88,$07,$4A,$29,$03               ;01B75F|        |      ;
                       db $D0,$02,$A9,$FF,$85               ;01B764|        |01B768;
                       db $3A,$AD,$88,$07,$29               ;01B769|        |      ;
                       db $10,$F0,$06,$A5,$2E               ;01B76E|        |01B760;
                       db $09,$01,$85,$2E,$AD               ;01B773|        |      ;
                       db $88,$07,$4A,$4A,$4A               ;01B778|        |      ;
                       db $4A,$4A,$8D,$8A,$07               ;01B77D|        |      ;
                       db $C5,$10,$F0,$05,$A9               ;01B782|        |000010;
                       db $10,$4C,$D8,$B7,$A5               ;01B787|        |01B7D5;
                       db $2E,$C9,$02,$F0,$04               ;01B78C|        |0102C9;
                       db $C9,$04,$D0,$04,$A9               ;01B791|        |      ;
                       db $01,$85,$2F,$60,$A9               ;01B796|        |000085;
                       db $02,$85,$00,$A9,$00               ;01B79B|        |      ;
                       db $85,$01,$A4,$00,$B9               ;01B7A0|        |000001;
                       db $DF,$B7,$20,$E2,$B7               ;01B7A5|        |E220B7;
                       db $B9,$90,$07,$29,$03               ;01B7AA|        |010790;
                       db $F0,$1A,$A5,$00,$8D               ;01B7AF|        |01B7CB;
                       db $8F,$07,$E6,$01,$A2               ;01B7B4|        |01E607;
                       db $00,$B9,$90,$07,$DD               ;01B7B9|        |      ;
                       db $37,$B9,$F0,$05,$E8               ;01B7BE|        |0000B9;
                       db $E0,$09,$D0,$F6,$8A               ;01B7C3|        |      ;
                       db $0A,$85,$2E,$C6,$00               ;01B7C8|        |      ;
                       db $10,$D3,$A5,$01,$C9               ;01B7CD|        |01B7A2;
                       db $01,$D0,$01,$60,$A9               ;01B7D2|        |0000D0;
                       db $01,$0D,$8B,$07,$8D               ;01B7D7|        |00000D;
                       db $8B,$07,$60,$00,$12               ;01B7DC|        |      ;
                       db $31,$48,$29,$30,$4A               ;01B7E1|        |000048;
                       db $4A,$85,$07,$68,$29               ;01B7E6|        |      ;
                       db $03,$05,$07,$A8,$60               ;01B7EB|        |000005;
                       db $AD,$8F,$07,$0A,$0A               ;01B7F0|        |01078F;
                       db $0A,$6D,$8F,$07,$85               ;01B7F5|        |      ;
                       db $00,$A9,$0F,$85,$01               ;01B7FA|        |      ;
                       db $A4,$01,$B9,$90,$07               ;01B7FF|        |000001;
                       db $29,$03,$F0,$1F,$A5               ;01B804|        |      ;
                       db $00,$85,$02,$A9,$09               ;01B809|        |      ;
                       db $85,$03,$A4,$02,$B9               ;01B80E|        |000003;
                       db $B2,$B6,$20,$E2,$B7               ;01B813|        |0000B6;
                       db $C4,$01,$F0,$0B,$E6               ;01B818|        |000001;
                       db $02,$C6,$03,$D0,$EE               ;01B81D|        |      ;
                       db $A9,$02,$4C,$D8,$B7               ;01B822|        |      ;
                       db $C6,$01,$10,$D4,$60               ;01B827|        |000001;
                       db $A2,$00,$BD,$A1,$07               ;01B82C|        |      ;
                       db $95,$08,$E8,$E0,$08               ;01B831|        |000008;
                       db $90,$F6,$A9,$00,$85               ;01B836|        |01B82E;
                       db $00,$85,$01,$A0,$00               ;01B83B|        |      ;
                       db $A2,$00,$56,$08,$66               ;01B840|        |      ;
                       db $01,$56,$08,$66,$00               ;01B845|        |000056;
                       db $E8,$C8,$C0,$08,$90               ;01B84A|        |      ;
                       db $F2,$A5,$01,$8D,$89               ;01B84F|        |0000A5;
                       db $07,$A5,$00,$8D,$88               ;01B854|        |0000A5;
                       db $07,$29,$10,$4A,$4A               ;01B859|        |000029;
                       db $4A,$4A,$05,$2E,$85               ;01B85E|        |      ;
                       db $2E,$60,$A0,$50,$AD               ;01B863|        |01A060;
                       db $88,$07,$29,$08,$F0               ;01B868|        |      ;
                       db $02,$A0,$A0,$84,$04               ;01B86D|        |      ;
                       db $20,$2A,$B7,$CD,$89               ;01B872|        |01B72A;
                       db $07,$F0,$EA,$A9,$04               ;01B877|        |0000F0;
                       db $4C,$D8,$B7,$AD,$88               ;01B87C|        |01B7D8;
                       db $07,$29,$01,$D0,$2F               ;01B881|        |000029;
                       db $A5,$2E,$C9,$12,$B0               ;01B886|        |00002E;
                       db $24,$C9,$10,$B0,$25               ;01B88B|        |0000C9;
                       db $AD,$88,$07,$29,$06               ;01B890|        |010788;
                       db $85,$00,$F0,$1C,$A5               ;01B895|        |000000;
                       db $2E,$29,$08,$4A,$4A               ;01B89A|        |010829;
                       db $4A,$05,$00,$A8,$A5               ;01B89F|        |      ;
                       db $2E,$29,$07,$AA,$B9               ;01B8A4|        |010729;
                       db $B4,$B8,$3D,$BC,$B8               ;01B8A9|        |0000B8;
                       db $D0,$05,$A9,$08,$4C               ;01B8AE|        |01B8B5;
                       db $D8,$B7,$60,$07,$03               ;01B8B3|        |      ;
                       db $2F,$FF,$00,$3D,$80               ;01B8B8|        |3D00FF;
                       db $40,$20,$10,$08,$04               ;01B8BD|        |      ;
                       db $02,$01,$AD,$88,$07               ;01B8C2|        |      ;
                       db $85,$00,$AD,$89,$07               ;01B8C7|        |000000;
                       db $85,$01,$A2,$08,$A9               ;01B8CC|        |000001;
                       db $00,$95,$08,$CA,$10               ;01B8D1|        |      ;
                       db $FB,$A2,$00,$46,$00               ;01B8D6|        |      ;
                       db $36,$08,$46,$01,$36               ;01B8DB|        |000008;
                       db $08,$E8,$E0,$08,$90               ;01B8E0|        |      ;
                       db $F3,$A5,$2E,$4A,$A8               ;01B8E5|        |0000A5;
                       db $A2,$02,$B9,$37,$B9               ;01B8EA|        |      ;
                       db $29,$0C,$4A,$4A,$85               ;01B8EF|        |      ;
                       db $00,$B9,$37,$B9,$29               ;01B8F4|        |      ;
                       db $30,$05,$00,$DD,$DF               ;01B8F9|        |01B900;
                       db $B7,$F0,$03,$CA,$10               ;01B8FE|        |0000F0;
                       db $E8,$8E,$8F,$07,$8A               ;01B903|        |      ;
                       db $0A,$0A,$0A,$6D,$8F               ;01B908|        |      ;
                       db $07,$A8,$A2,$00,$B9               ;01B90D|        |0000A8;
                       db $B3,$B6,$29,$30,$85               ;01B912|        |0000B6;
                       db $01,$B9,$B3,$B6,$29               ;01B917|        |0000B9;
                       db $03,$0A,$0A,$05,$01               ;01B91C|        |00000A;
                       db $15,$08,$9D,$A1,$07               ;01B921|        |000008;
                       db $C8,$E8,$E0,$09,$90               ;01B926|        |      ;
                       db $E5,$A5,$2E,$4A,$A8               ;01B92B|        |0000A5;
                       db $B9,$37,$B9,$8D,$A0               ;01B930|        |01B937;
                       db $07,$60,$01,$1B,$02               ;01B935|        |000060;
                       db $35,$19,$03,$37,$1A               ;01B93A|        |000019;
                       db $36,$A9,$00,$85,$00               ;01B93F|        |0000A9;
                       db $A2,$05,$A4,$00,$B9               ;01B944|        |      ;
                       db $A0,$07,$29,$03,$A8               ;01B949|        |      ;
                       db $B9,$82,$B9,$9D,$00               ;01B94E|        |01B982;
                       db $04,$B9,$7E,$B9,$9D               ;01B953|        |0000B9;
                       db $8C,$04,$A4,$00,$B9               ;01B958|        |01A404;
                       db $A0,$07,$29,$3C,$4A               ;01B95D|        |      ;
                       db $A8,$B9,$86,$B9,$9D               ;01B962|        |      ;
                       db $1C,$04,$B9,$87,$B9               ;01B967|        |01B904;
                       db $9D,$38,$04,$A9,$00               ;01B96C|        |010438;
                       db $9D,$54,$04,$E8,$E6               ;01B971|        |010454;
                       db $00,$A5,$00,$C9,$09               ;01B976|        |      ;
                       db $90,$C9,$60,$00,$14               ;01B97B|        |01B946;
                       db $0C,$0C,$00,$42,$FC               ;01B980|        |01000C;
                       db $F4,$7A,$5D,$7A,$75               ;01B985|        |015D7A;
                       db $7A,$8D,$7A,$A5,$92               ;01B98A|        |      ;
                       db $5D,$92,$75,$92,$8D               ;01B98F|        |017592;
                       db $92,$A5,$AA,$5D,$AA               ;01B994|        |0000A5;
                       db $75,$AA,$8D,$AA,$A5               ;01B999|        |0000AA;
                       db $C2,$5D,$C2,$75,$C2               ;01B99E|        |      ;
                       db $8D,$C2,$A5                       ;01B9A3|        |01A5C2;
 
RLE_tilemap_0c_nameScreen: db $00,$20,$8E,$F6,$F7               ;01B9A6|        |      ;
                       db $F6,$F7,$F6,$F7,$F6               ;01B9AB|        |0000F7;
                       db $F7,$F6,$F7,$F6,$F7               ;01B9B0|        |0000F6;
                       db $F6,$F7,$06,$00,$99               ;01B9B5|        |0000F7;
                       db $F6,$F7,$F6,$F7,$F6               ;01B9BA|        |0000F7;
                       db $F7,$F6,$F7,$F6,$F7               ;01B9BF|        |0000F6;
                       db $F6,$ED,$F6,$F6,$F7               ;01B9C4|        |0000ED;
                       db $F6,$F7,$F6,$F7,$F6               ;01B9C9|        |0000F7;
                       db $F7,$F6,$F7,$F6,$F7               ;01B9CE|        |0000F6;
                       db $08,$00,$93,$F6,$F7               ;01B9D3|        |      ;
                       db $F6,$F7,$F6,$F7,$EB               ;01B9D8|        |0000F7;
                       db $EC,$F6,$F7,$F6,$F6               ;01B9DD|        |01F7F6;
                       db $F7,$F6,$F7,$F6,$F7               ;01B9E2|        |0000F6;
                       db $F6,$F7,$14,$00,$8B               ;01B9E7|        |0000F7;
                       db $FC,$F7,$F6,$F7,$F7               ;01B9EC|        |01F6F7;
                       db $F6,$F7,$F6,$F7,$F6               ;01B9F1|        |0000F7;
                       db $F7,$14,$00,$9C,$F6               ;01B9F6|        |000014;
                       db $F7,$FD,$F7,$F6,$F6               ;01B9FB|        |0000FD;
                       db $F7,$F6,$F7,$FD,$F7               ;01BA00|        |0000F6;
                       db $00,$00,$54,$5D,$63               ;01BA05|        |      ;
                       db $54,$61,$00,$68,$5E               ;01BA0A|        |      ;
                       db $64,$61,$00,$5D,$50               ;01BA0F|        |000061;
                       db $5C,$54,$05,$00,$89               ;01BA14|        |000554;
                       db $F6,$F7,$F6,$F7,$F7               ;01BA19|        |0000F7;
                       db $F6,$F7,$F6,$F7,$16               ;01BA1E|        |0000F7;
                       db $00,$8D,$F6,$F7,$F6               ;01BA23|        |      ;
                       db $F7,$FD,$F6,$F7,$FD               ;01BA28|        |0000FD;
                       db $ED,$F6,$F7,$F6,$F7               ;01BA2D|        |01F7F6;
                       db $03,$00,$81,$80,$08               ;01BA32|        |000000;
                       db $81,$81,$82,$03,$00               ;01BA37|        |000081;
                       db $8F,$F6,$F7,$F6,$F7               ;01BA3C|        |F6F7F6;
                       db $FD,$F7,$F6,$F7,$ED               ;01BA41|        |01F6F7;
                       db $F6,$ED,$F6,$F7,$F6               ;01BA46|        |0000ED;
                       db $F7,$04,$00,$81,$90               ;01BA4B|        |000004;
                       db $08,$00,$81,$92,$04               ;01BA50|        |      ;
                       db $00,$8F,$F6,$F7,$F6               ;01BA55|        |      ;
                       db $F7,$FD,$F7,$FD,$F6               ;01BA5A|        |0000FD;
                       db $ED,$F6,$ED,$F6,$F7               ;01BA5F|        |01EDF6;
                       db $FD,$F7,$03,$00,$81               ;01BA64|        |0103F7;
                       db $A0,$08,$A1,$81,$A2               ;01BA69|        |      ;
                       db $07,$00,$8B,$F6,$F7               ;01BA6E|        |000000;
                       db $EB,$ED,$ED,$F6,$F7               ;01BA73|        |      ;
                       db $F6,$ED,$F6,$F7,$14               ;01BA78|        |0000ED;
                       db $00,$8B,$F6,$F7,$F6               ;01BA7D|        |      ;
                       db $FB,$FC,$F6,$F7,$FD               ;01BA82|        |      ;
                       db $F7,$FD,$F7,$16,$00               ;01BA87|        |0000FD;
                       db $89,$F6,$F7,$FD,$F7               ;01BA8C|        |      ;
                       db $FB,$FD,$ED,$F6,$F7               ;01BA91|        |      ;
                       db $14,$00,$8D,$F6,$F7               ;01BA96|        |000000;
                       db $F6,$ED,$F6,$F7,$FD               ;01BA9B|        |0000ED;
                       db $F6,$ED,$EB,$EC,$FD               ;01BAA0|        |0000ED;
                       db $F7,$12,$00,$8F,$F6               ;01BAA5|        |000012;
                       db $ED,$F6,$ED,$FD,$F7               ;01BAAA|        |01EDF6;
                       db $EB,$EC,$F7,$FB,$FB               ;01BAAF|        |      ;
                       db $FC,$F7,$F6,$F7,$10               ;01BAB4|        |01F6F7;
                       db $00,$84,$F6,$F7,$F6               ;01BAB9|        |      ;
                       db $F7,$03,$F6,$C8,$FB               ;01BABE|        |000003;
                       db $FC,$F6,$F7,$FD,$F7               ;01BAC3|        |01F7F6;
                       db $CB,$CC,$CD,$CE,$CD               ;01BAC8|        |      ;
                       db $CE,$CD,$CE,$CD,$CE               ;01BACD|        |01CECD;
                       db $CD,$CE,$CD,$CE,$CD               ;01BAD2|        |01CDCE;
                       db $CE,$CD,$CE,$CD,$CE               ;01BAD7|        |01CECD;
                       db $CD,$CE,$CB,$CC,$F6               ;01BADC|        |01CBCE;
                       db $ED,$F6,$ED,$ED,$F6               ;01BAE1|        |01EDF6;
                       db $ED,$FD,$DB,$DC,$DD               ;01BAE6|        |01DBFD;
                       db $DE,$DD,$DE,$DD,$DE               ;01BAEB|        |01DEDD;
                       db $DD,$DE,$DD,$DE,$DD               ;01BAF0|        |01DDDE;
                       db $DE,$DD,$DE,$DD,$DE               ;01BAF5|        |01DEDD;
                       db $DD,$DE,$DD,$DE,$DB               ;01BAFA|        |01DDDE;
                       db $DC,$ED,$F6,$F7,$F6               ;01BAFF|        |00F6ED;
                       db $F6,$EC,$EB,$F7,$C0               ;01BB04|        |0000EC;
                       db $C1,$14,$00,$AC,$C4               ;01BB09|        |000014;
                       db $C5,$F6,$F7,$EB,$EC               ;01BB0E|        |0000F6;
                       db $FB,$FC,$FB,$FC,$D0               ;01BB13|        |      ;
                       db $D1,$00,$50,$00,$51               ;01BB18|        |000000;
                       db $00,$52,$00,$53,$00               ;01BB1D|        |      ;
                       db $54,$00,$55,$00,$56               ;01BB22|        |      ;
                       db $00,$57,$00,$58,$00               ;01BB27|        |      ;
                       db $00,$D4,$D5,$F7,$EB               ;01BB2C|        |      ;
                       db $FB,$FC,$EB,$EC,$EB               ;01BB31|        |      ;
                       db $FC,$E0,$E1,$14,$00               ;01BB36|        |01E1E0;
                       db $AC,$E4,$E5,$EB,$EC               ;01BB3B|        |01E5E4;
                       db $EB,$F7,$FB,$FC,$FB               ;01BB40|        |      ;
                       db $F7,$F0,$F1,$00,$59               ;01BB45|        |0000F0;
                       db $00,$5A,$00,$5B,$00               ;01BB4A|        |      ;
                       db $5C,$00,$5D,$00,$5E               ;01BB4F|        |005D00;
                       db $00,$5F,$00,$60,$00               ;01BB54|        |      ;
                       db $61,$00,$00,$F4,$F5               ;01BB59|        |000000;
                       db $FB,$FC,$FB,$FC,$EB               ;01BB5E|        |      ;
                       db $EC,$EB,$F6,$C2,$C3               ;01BB63|        |01F6EB;
                       db $14,$00,$AC,$C6,$C7               ;01BB68|        |000000;
                       db $EB,$ED,$F6,$EC,$FB               ;01BB6D|        |      ;
                       db $FC,$ED,$F7,$D2,$D3               ;01BB72|        |01F7ED;
                       db $00,$62,$00,$63,$00               ;01BB77|        |      ;
                       db $64,$00,$65,$00,$66               ;01BB7C|        |000000;
                       db $00,$67,$00,$68,$00               ;01BB81|        |      ;
                       db $69,$00,$FE,$00,$00               ;01BB86|        |      ;
                       db $D6,$D7,$FB,$FC,$FB               ;01BB8B|        |0000D7;
                       db $FC,$EB,$EC,$EB,$EC               ;01BB90|        |01ECEB;
                       db $E2,$E3,$14,$00,$92               ;01BB95|        |      ;
                       db $E6,$E7,$FD,$F7,$EB               ;01BB9A|        |0000E7;
                       db $ED,$F7,$FC,$ED,$FC               ;01BB9F|        |01FCF7;
                       db $F2,$F3,$00,$6A,$00               ;01BBA4|        |0000F3;
                       db $6B,$00,$4B,$05,$00               ;01BBA9|        |      ;
                       db $95,$CF,$00,$DF,$00               ;01BBAE|        |0000CF;
                       db $00,$EE,$EF,$00,$00               ;01BBB3|        |      ;
                       db $F2,$F3,$F7,$FD,$FB               ;01BBB8|        |0000F3;
                       db $FC,$EB,$ED,$EB,$F7               ;01BBBD|        |01EDEB;
                       db $CB,$CC,$14,$00,$CC               ;01BBC2|        |      ;
                       db $CB,$CC,$EB,$ED,$EB               ;01BBC7|        |      ;
                       db $EC,$FB,$FC,$FB,$FC               ;01BBCC|        |01FCFB;
                       db $DB,$DC,$CD,$CE,$CD               ;01BBD1|        |      ;
                       db $CE,$CD,$CE,$CD,$CE               ;01BBD6|        |01CECD;
                       db $CD,$CE,$CD,$CE,$CD               ;01BBDB|        |01CDCE;
                       db $CE,$CD,$CE,$CD,$CE               ;01BBE0|        |01CECD;
                       db $CD,$CE,$DB,$DC,$FB               ;01BBE5|        |01DBCE;
                       db $FC,$FD,$FC,$F6,$EC               ;01BBEA|        |01FCFD;
                       db $EB,$F7,$CB,$CC,$DD               ;01BBEF|        |      ;
                       db $DE,$DD,$DE,$DD,$DE               ;01BBF4|        |01DEDD;
                       db $DD,$DE,$DD,$DE,$DD               ;01BBF9|        |01DDDE;
                       db $DE,$DD,$DE,$DD,$DE               ;01BBFE|        |01DEDD;
                       db $DD,$DE,$DD,$DE,$CB               ;01BC03|        |01DDDE;
                       db $CC,$EB,$F7,$EB,$EC               ;01BC08|        |01F7EB;
                       db $FB,$FC,$FB,$FC,$DB               ;01BC0D|        |      ;
                       db $DC,$14,$F3,$90,$DB               ;01BC12|        |00F314;
                       db $DC,$FB,$FC,$FB,$FD               ;01BC17|        |00FCFB;
                       db $EB,$EC,$EB,$F7,$F2               ;01BC1C|        |      ;
                       db $F2,$F3,$F2,$F2,$F3               ;01BC21|        |0000F3;
                       db $03,$F2,$82,$F3,$F2               ;01BC26|        |0000F2;
                       db $04,$F3,$04,$F2,$B3               ;01BC2B|        |0000F3;
                       db $F3,$F2,$F2,$F3,$F2               ;01BC30|        |0000F2;
                       db $EB,$EC,$EB,$EC,$FB               ;01BC35|        |      ;
                       db $FC,$FB,$FD,$D4,$EB               ;01BC3A|        |01FDFB;
                       db $EC,$EB,$EC,$EB,$F7               ;01BC3F|        |01ECEB;
                       db $EB,$F7,$FD,$ED,$F6               ;01BC44|        |      ;
                       db $F7,$FD,$F7,$F6,$F7               ;01BC49|        |0000FD;
                       db $FB,$FC,$EC,$FB,$FC               ;01BC4E|        |      ;
                       db $ED,$EB,$FB,$FC,$FB               ;01BC53|        |01FBEB;
                       db $FC,$FF,$FF,$0F,$03               ;01BC58|        |01FFFF;
                       db $00,$0F,$CF,$FF,$FF               ;01BC5D|        |      ;
                       db $F3,$04,$00,$84,$FC               ;01BC62|        |000004;
                       db $FF,$FF,$3F,$04,$00               ;01BC67|        |043FFF;
                       db $84,$FC,$FF,$FF,$0F               ;01BC6C|        |0000FC;
                       db $03,$00,$85,$0C,$0F               ;01BC71|        |000000;
                       db $FF,$FF,$22,$04,$00               ;01BC76|        |0422FF;
                       db $84,$88,$FF,$FF,$22               ;01BC7B|        |000088;
                       db $04,$00,$83,$88,$FF               ;01BC80|        |000000;
                       db $FF,$06,$00,$81,$FF               ;01BC85|        |810006;
                       db $08,$0F,$FF,$BD,$65               ;01BC8A|        |      ;
                       db $05,$4A,$4A,$4A,$4A               ;01BC8F|        |00004A;
                       db $4A,$4A,$20,$6D,$E8               ;01BC94|        |      ;
                       db $9F,$BC,$A7,$BC,$BC               ;01BC99|        |BCA7BC;
                       db $BC,$A9,$80,$9D,$D8               ;01BC9E|        |0180A9;
                       db $05,$4C,$8A,$FF,$DE               ;01BCA3|        |00004C;
                       db $D8,$05,$D0,$0F,$A9               ;01BCA8|        |      ;
                       db $08,$9D,$D8,$05,$BD               ;01BCAD|        |      ;
                       db $65,$05,$29,$BF,$09               ;01BCB2|        |000005;
                       db $80,$9D,$65,$05,$60               ;01BCB7|        |01BC56;
                       db $A5,$1A,$29,$03,$D0               ;01BCBC|        |00001A;
                       db $F9,$BD,$4E,$05,$C9               ;01BCC1|        |014EBD;
                       db $57,$F0,$27,$C9,$5B               ;01BCC6|        |0000F0;
                       db $F0,$23,$BD,$54,$04               ;01BCCB|        |01BCF0;
                       db $49,$04,$9D,$54,$04               ;01BCD0|        |      ;
                       db $BD,$D8,$05,$F0,$05               ;01BCD5|        |0105D8;
                       db $DE,$D8,$05,$D0,$DC               ;01BCDA|        |0105D8;
                       db $BD,$54,$04,$29,$FB               ;01BCDF|        |010454;
                       db $9D,$54,$04,$BD,$70               ;01BCE4|        |010454;
                       db $04,$29,$FD,$9D,$70               ;01BCE9|        |000029;
                       db $04,$60,$BD,$54,$04               ;01BCEE|        |000060;
                       db $29,$04,$D0,$17,$A9               ;01BCF3|        |      ;
                       db $04,$9D,$54,$04,$BD               ;01BCF8|        |00009D;
                       db $D8,$05,$F0,$05,$DE               ;01BCFD|        |      ;
                       db $D8,$05,$D0,$E9,$A9               ;01BD02|        |      ;
                       db $03,$9D,$54,$04,$4C               ;01BD07|        |00009D;
                       db $E7,$BC,$A9,$03,$D0               ;01BD0C|        |0000BC;
                       db $E7,$BC,$45,$06,$B9               ;01BD11|        |0000BC;
                       db $27,$BD,$85,$0F,$B9               ;01BD16|        |0000BD;
                       db $47,$BD,$A8,$B9,$F0               ;01BD1B|        |0000BD;
                       db $00,$05,$0F,$99,$F0               ;01BD20|        |      ;
                       db $00,$60,$01,$02,$04               ;01BD25|        |      ;
                       db $08,$10,$20,$40,$80               ;01BD2A|        |      ;
                       db $01,$02,$04,$08,$10               ;01BD2F|        |000002;
                       db $20,$40,$80,$01,$02               ;01BD34|        |018040;
                       db $04,$08,$10,$20,$40               ;01BD39|        |000008;
                       db $80,$01,$02,$04,$08               ;01BD3E|        |01BD41;
                       db $10,$20,$40,$80,$00               ;01BD43|        |01BD65;
                       db $00,$00,$00,$00,$00               ;01BD48|        |      ;
                       db $00,$00,$01,$01,$01               ;01BD4D|        |      ;
                       db $01,$01,$01,$01,$01               ;01BD52|        |000001;
                       db $02,$02,$02,$02,$02               ;01BD57|        |      ;
                       db $02,$02,$02,$03,$03               ;01BD5C|        |      ;
                       db $03,$03,$03,$03,$03               ;01BD61|        |000003;
                       db $03,$FF,$FF,$FF,$FF               ;01BD66|        |0000FF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD6B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD70|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD7A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD7F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD84|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD89|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD8E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD93|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD98|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BD9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDA2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDA7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDAC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDB1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDB6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDBB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDC0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDCA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDCF|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDD4|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDD9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDDE|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDE3|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDE8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDF2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDF7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BDFC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE01|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE06|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE0B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE10|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE1A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE1F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE24|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE29|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE2E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE33|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE38|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE42|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE47|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE4C|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE51|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE56|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE5B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE60|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE6A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE6F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE74|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE79|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE7E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE83|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE88|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE92|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE97|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BE9C|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEA1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEA6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEAB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEB0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEBA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEBF|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEC4|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEC9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BECE|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BED3|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BED8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEE2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEE7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEEC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEF1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEF6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BEFB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF00|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF0A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF0F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF14|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF19|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF1E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF23|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF28|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF32|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF37|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF3C|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF41|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF46|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF4B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF50|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF5A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF5F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF64|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF69|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF6E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF73|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF78|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF82|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF87|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF8C|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF91|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF96|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BF9B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFA0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFAA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFAF|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFB4|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFB9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFBE|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFC3|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFC8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFCD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFD2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFD7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFDC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFE1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFE6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFEB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFF0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFF5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;01BFFA|        |FFFFFF;
                       db $FF                               ;01BFFF|        |000000;
 
 
 
 
 
