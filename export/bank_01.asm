 
                       ORG $018000
 
 
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
 
 
         DATA8_018078: db $00,$03,$02,$00,$00,$00,$00,$05   ;018078|        |      ;
 
        orbCollect_04: LDA.B #$10                           ;018080|A910    |      ;
                       STA.W $07F3                          ;018082|8DF307  |0107F3;
                       BNE CODE_0180A6                      ;018085|D01F    |0180A6;
 
        orbCollect_05: LDA.B r_lvlTimerLo                   ;018087|A57E    |00007E;
                       ORA.B r_lvlTimerHi                   ;018089|057F    |00007F;
                       BEQ CODE_01809D                      ;01808B|F010    |01809D;
                       db $20                               ;01808D|        |      ;
                       dw DATA8_0FE656                      ;01808E|        |0FE656;
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
                       dw initFreezWaterEffect_01           ;0180F3|        |0FE25F;
 
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
                       dw CODE_0FE593                       ;018139|        |0FE593;
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
                       STA.B r_gameTransition               ;018161|852A    |00002A;
                       LDA.B #$00                           ;018163|A900    |      ;
                       STA.B r_menuSelectIdx                ;018165|856B    |00006B;
                       RTS                                  ;018167|60      |      ;
 
 
          CODE_018168: LDA.B #$18                           ;018168|A918    |      ;
                       STA.B r_gameTransition               ;01816A|852A    |00002A;
                       LDA.B #$02                           ;01816C|A902    |      ;
                       STA.B r_menuSelectIdx                ;01816E|856B    |00006B;
                       RTS                                  ;018170|60      |      ;
 
 
         DATA8_018171: db $02,$01,$01,$00,$00,$00,$00,$01   ;018171|        |      ;
                       db $00,$00,$00,$00,$00,$00,$02,$00   ;018179|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;018181|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;018189|        |      ;
 
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
 
 
         DATA8_01826F: db $00,$03,$02,$00,$00,$00,$00,$04   ;01826F|        |      ;
 
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
 
 
         DATA8_0182BB: db $00,$01,$02,$00,$00,$00,$00,$03   ;0182BB|        |      ;
 
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
                       LDA.W CODE_019D69,Y                  ;01833C|B9699D  |019D69;
                       STA.B $00                            ;01833F|8500    |000000;
                       LDA.W LOOSE_OP_019D6A,Y              ;018341|B96A9D  |019D6A;
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
                       JSR.W DATA8_019181                   ;0183A5|208191  |019181;
                       LDA.B #$00                           ;0183A8|A900    |      ;
                       STA.W $07ED                          ;0183AA|8DED07  |0107ED;
                       INC.W $07EC                          ;0183AD|EEEC07  |0107EC;
                       LDA.B #$00                           ;0183B0|A900    |      ;
                       STA.B r_HUD_CHR_overwrite            ;0183B2|8572    |000072;
                       LDA.B #$80                           ;0183B4|A980    |      ;
                       STA.B r_IRQFuncIdx                   ;0183B6|853F    |00003F;
                       LDA.B #$6B                           ;0183B8|A96B    |      ;
                       db $20                               ;0183BA|        |      ;
                       dw initFreezWaterEffect_01           ;0183BB|        |0FE25F;
                       RTS                                  ;0183BD|60      |      ;
 
 
         DATA8_0183BE: db $20                               ;0183BE|        |      ;
                       dw initFreezWaterEffect_01           ;0183BF|        |0FE25F;
 
          CODE_0183C1: LDA.B $00                            ;0183C1|A500    |000000;
                       STA.B $01                            ;0183C3|8501    |000001;
                       LDA.B #$00                           ;0183C5|A900    |      ;
                       STA.B $02                            ;0183C7|8502    |000002;
                       STA.B $03                            ;0183C9|8503    |000003;
                       db $20                               ;0183CB|        |      ;
                       dw CODE_0FE777                       ;0183CC|        |0FE777;
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
                       dw CODE_018591                       ;01846A|        |018591;
                       dw CODE_0185F1                       ;01846C|        |0185F1;
                       dw CODE_018609                       ;01846E|        |018609;
                       dw DATA8_018531                      ;018470|        |018531;
                       dw CODE_01854D                       ;018472|        |01854D;
                       dw CODE_0185F1                       ;018474|        |0185F1;
                       dw CODE_018609                       ;018476|        |018609;
                       dw DATA8_018531                      ;018478|        |018531;
                       dw CODE_018556                       ;01847A|        |018556;
                       dw CODE_01866A                       ;01847C|        |01866A;
                       dw CODE_018676                       ;01847E|        |018676;
                       dw CODE_0186E4                       ;018480|        |0186E4;
                       dw CODE_018609                       ;018482|        |018609;
                       dw DATA8_018531                      ;018484|        |018531;
                       dw CODE_018578                       ;018486|        |018578;
                       dw CODE_0185F1                       ;018488|        |0185F1;
                       dw CODE_018609                       ;01848A|        |018609;
                       dw CODE_01870E                       ;01848C|        |01870E;
                       dw CODE_01873E                       ;01848E|        |01873E;
                       dw CODE_01875A                       ;018490|        |01875A;
                       dw CODE_018774                       ;018492|        |018774;
                       dw CODE_0187AE                       ;018494|        |0187AE;
                       dw DATA8_018514                      ;018496|        |018514;
                       dw CODE_01855F                       ;018498|        |01855F;
                       dw CODE_0185F1                       ;01849A|        |0185F1;
                       dw CODE_018609                       ;01849C|        |018609;
                       dw CODE_0187F5                       ;01849E|        |0187F5;
                       dw CODE_018814                       ;0184A0|        |018814;
                       dw CODE_01881D                       ;0184A2|        |01881D;
                       dw CODE_018836                       ;0184A4|        |018836;
                       dw CODE_018872                       ;0184A6|        |018872;
                       dw CODE_01889B                       ;0184A8|        |01889B;
                       dw CODE_0188DC                       ;0184AA|        |0188DC;
 
                       dw CODE_0188E0                       ;0184AC|        |0188E0;
                       dw CODE_0185F1                       ;0184AE|        |0185F1;
                       dw CODE_0188ED                       ;0184B0|        |0188ED;
 
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
                       INC.W $07F3                          ;018504|EEF307  |0007F3;
                       RTS                                  ;018507|60      |      ;
 
 
          CODE_018508: INC.W $07ED                          ;018508|EEED07  |0007ED;
                       LDA.B #$00                           ;01850B|A900    |      ;
                       STA.W $07F1                          ;01850D|8DF107  |0107F1;
                       STA.W $07F0                          ;018510|8DF007  |0107F0;
                       RTS                                  ;018513|60      |      ;
 
 
         DATA8_018514: db $A2,$01,$BC,$4E,$05,$F0,$07,$BD   ;018514|        |      ;
                       db $06,$06,$C9,$03,$F0,$05,$E8,$E0   ;01851C|        |      ;
                       db $0D,$D0,$EF,$88,$B9,$2D,$85,$D0   ;018524|        |      ;
 
         DATA8_01852C: db $09,$00,$0D,$07,$0E               ;01852C|        |      ;
 
         DATA8_018531: db $A4,$32,$B9,$45,$85,$8D,$EF,$07   ;018531|        |      ;
                       db $EE,$ED,$07,$A9,$00,$8D,$F3,$07   ;018539|        |      ;
                       db $8D,$F2,$07,$60,$00,$07,$0D,$00   ;018541|        |      ;
                       db $00,$00,$00,$0E                   ;018549|        |      ;
 
          CODE_01854D: LDY.B r_stage                        ;01854D|A432    |000032;
                       LDA.W DATA8_0185D1,Y                 ;01854F|B9D185  |0185D1;
                       TAY                                  ;018552|A8      |      ;
                       JMP.W CODE_018597                    ;018553|4C9785  |018597;
 
 
          CODE_018556: LDA.B #$00                           ;018556|A900    |      ;
                       STA.W $07EF                          ;018558|8DEF07  |0107EF;
                       LDY.B #$04                           ;01855B|A004    |      ;
                       BNE CODE_018597                      ;01855D|D038    |018597;
 
          CODE_01855F: LDA.B r_partner                      ;01855F|A53A    |00003A;
                       CMP.B #$FF                           ;018561|C9FF    |      ;
                       BEQ CODE_01856E                      ;018563|F009    |01856E;
                       LDY.B r_stage                        ;018565|A432    |000032;
                       LDA.W DATA8_0185E9,Y                 ;018567|B9E985  |0185E9;
                       TAY                                  ;01856A|A8      |      ;
                       JMP.W CODE_018597                    ;01856B|4C9785  |018597;
 
 
          CODE_01856E: LDA.B #$03                           ;01856E|A903    |      ;
                       CLC                                  ;018570|18      |      ;
                       ADC.W $07ED                          ;018571|6DED07  |0107ED;
                       STA.W $07ED                          ;018574|8DED07  |0107ED;
                       RTS                                  ;018577|60      |      ;
 
 
          CODE_018578: LDA.W $07ED                          ;018578|ADED07  |0107ED;
                       AND.B #$80                           ;01857B|2980    |      ;
                       BNE CODE_018588                      ;01857D|D009    |018588;
                       LDY.B r_stage                        ;01857F|A432    |000032;
                       LDA.W DATA8_0185D9,Y                 ;018581|B9D985  |0185D9;
                       TAY                                  ;018584|A8      |      ;
                       JMP.W CODE_018597                    ;018585|4C9785  |018597;
 
 
          CODE_018588: LDY.B r_stage                        ;018588|A432    |000032;
                       LDA.W DATA8_0185E1,Y                 ;01858A|B9E185  |0185E1;
                       TAY                                  ;01858D|A8      |      ;
                       JMP.W CODE_018597                    ;01858E|4C9785  |018597;
 
 
          CODE_018591: LDY.B r_stage                        ;018591|A432    |000032;
                       LDA.W DATA8_0185C9,Y                 ;018593|B9C985  |0185C9;
                       TAY                                  ;018596|A8      |      ;
 
          CODE_018597: LDA.W $07F3                          ;018597|ADF307  |0107F3;
                       BNE CODE_0185B1                      ;01859A|D015    |0185B1;
                       JSR.W CODE_018944                    ;01859C|204489  |018944;
                       BCS CODE_0185B5                      ;01859F|B014    |0185B5;
                       LDA.B #$04                           ;0185A1|A904    |      ;
                       STA.W $07F3                          ;0185A3|8DF307  |0107F3;
                       LDA.B r_Joy1Pe                       ;0185A6|A528    |000028;
                       AND.B #$80                           ;0185A8|2980    |      ;
                       BEQ CODE_0185B1                      ;0185AA|F005    |0185B1;
                       LDA.B #$02                           ;0185AC|A902    |      ;
                       STA.W $07F3                          ;0185AE|8DF307  |0107F3;
 
          CODE_0185B1: DEC.W $07F3                          ;0185B1|CEF307  |0107F3;
                       RTS                                  ;0185B4|60      |      ;
 
 
          CODE_0185B5: LDA.B #$00                           ;0185B5|A900    |      ;
                       STA.W $07EF                          ;0185B7|8DEF07  |0107EF;
                       STA.W $07F3                          ;0185BA|8DF307  |0107F3;
                       STA.W $07F1                          ;0185BD|8DF107  |0007F1;
                       INC.W $07ED                          ;0185C0|EEED07  |0107ED;
                       LDA.B #$FF                           ;0185C3|A9FF    |      ;
                       STA.W $07F2                          ;0185C5|8DF207  |0107F2;
                       RTS                                  ;0185C8|60      |      ;
 
 
         DATA8_0185C9: db $00,$00,$0C,$00,$00,$00,$00,$14   ;0185C9|        |      ;
 
         DATA8_0185D1: db $00,$02,$0E,$00,$00,$00,$00,$16   ;0185D1|        |      ;
 
         DATA8_0185D9: db $00,$06,$10,$00,$00,$00,$00,$18   ;0185D9|        |      ;
 
         DATA8_0185E1: db $00,$08,$12,$00,$00,$00,$00,$1A   ;0185E1|        |      ;
 
         DATA8_0185E9: db $00,$0A,$0A,$00,$00,$00,$00,$0A   ;0185E9|        |      ;
 
          CODE_0185F1: LDA.W $07F2                          ;0185F1|ADF207  |0107F2;
                       BNE CODE_0185FA                      ;0185F4|D004    |0185FA;
                       INC.W $07ED                          ;0185F6|EEED07  |0107ED;
                       RTS                                  ;0185F9|60      |      ;
 
 
          CODE_0185FA: DEC.W $07F2                          ;0185FA|CEF207  |0107F2;
                       LDA.B r_Joy1Pe                       ;0185FD|A528    |000028;
                       AND.B #$80                           ;0185FF|2980    |      ;
                       BEQ CODE_018608                      ;018601|F005    |018608;
                       LDA.B #$00                           ;018603|A900    |      ;
                       STA.W $07F2                          ;018605|8DF207  |0107F2;
 
          CODE_018608: RTS                                  ;018608|60      |      ;
 
 
          CODE_018609: LDX.B r_sceneDrawQueue               ;018609|A61D    |00001D;
                       LDA.B #$02                           ;01860B|A902    |      ;
                       STA.B $03                            ;01860D|8503    |000003;
                       LDA.W $07F1                          ;01860F|ADF107  |0107F1;
                       ASL A                                ;018612|0A      |      ;
                       ASL A                                ;018613|0A      |      ;
                       ASL A                                ;018614|0A      |      ;
                       ASL A                                ;018615|0A      |      ;
                       ASL A                                ;018616|0A      |      ;
                       ASL A                                ;018617|0A      |      ;
                       CLC                                  ;018618|18      |      ;
                       ADC.B #$C6                           ;018619|69C6    |      ;
                       STA.B $00                            ;01861B|8500    |000000;
                       LDA.B #$20                           ;01861D|A920    |      ;
                       ADC.B #$00                           ;01861F|6900    |      ;
                       STA.B $01                            ;018621|8501    |000001;
 
          CODE_018623: LDA.B #$01                           ;018623|A901    |      ;
                       JSR.W CODE_018356                    ;018625|205683  |018356;
                       LDA.B $00                            ;018628|A500    |000000;
                       JSR.W CODE_018356                    ;01862A|205683  |018356;
                       LDA.B $01                            ;01862D|A501    |000001;
                       JSR.W CODE_018356                    ;01862F|205683  |018356;
                       LDA.B #$14                           ;018632|A914    |      ;
                       STA.B $02                            ;018634|8502    |000002;
                       LDA.B #$00                           ;018636|A900    |      ;
 
          CODE_018638: JSR.W CODE_018356                    ;018638|205683  |018356;
                       DEC.B $02                            ;01863B|C602    |000002;
                       BNE CODE_018638                      ;01863D|D0F9    |018638;
                       LDA.B #$FF                           ;01863F|A9FF    |      ;
                       JSR.W CODE_018356                    ;018641|205683  |018356;
                       LDA.B $00                            ;018644|A500    |000000;
                       CLC                                  ;018646|18      |      ;
                       ADC.B #$20                           ;018647|6920    |      ;
                       STA.B $00                            ;018649|8500    |000000;
                       LDA.B $01                            ;01864B|A501    |000001;
                       ADC.B #$00                           ;01864D|6900    |      ;
                       STA.B $01                            ;01864F|8501    |000001;
                       DEC.B $03                            ;018651|C603    |000003;
                       BNE CODE_018623                      ;018653|D0CE    |018623;
                       STX.B r_sceneDrawQueue               ;018655|861D    |00001D;
                       INC.W $07F1                          ;018657|EEF107  |0107F1;
                       LDA.W $07F1                          ;01865A|ADF107  |0107F1;
                       CMP.B #$03                           ;01865D|C903    |      ;
                       BNE CODE_018669                      ;01865F|D008    |018669;
                       LDA.B #$00                           ;018661|A900    |      ;
                       STA.W $07F1                          ;018663|8DF107  |0107F1;
                       INC.W $07ED                          ;018666|EEED07  |0107ED;
 
          CODE_018669: RTS                                  ;018669|60      |      ;
 
 
          CODE_01866A: INC.W $07ED                          ;01866A|EEED07  |0107ED;
                       LDA.W $07ED                          ;01866D|ADED07  |0107ED;
                       AND.B #$7F                           ;018670|297F    |      ;
                       STA.W $07ED                          ;018672|8DED07  |0107ED;
                       RTS                                  ;018675|60      |      ;
 
 
          CODE_018676: LDA.B r_curJoyPe1                    ;018676|A526    |000026;
                       AND.B #$0C                           ;018678|290C    |      ;
                       BEQ CODE_01868A                      ;01867A|F00E    |01868A;
                       LDA.B #$72                           ;01867C|A972    |      ;
                       db $20                               ;01867E|        |      ;
                       dw initFreezWaterEffect_01           ;01867F|        |0FE25F;
                       LDA.W $07ED                          ;018681|ADED07  |0107ED;
                       CLC                                  ;018684|18      |      ;
                       ADC.B #$80                           ;018685|6980    |      ;
                       STA.W $07ED                          ;018687|8DED07  |0107ED;
 
          CODE_01868A: JSR.W CODE_0186A8                    ;01868A|20A886  |0186A8;
                       LDA.B r_curJoyPe1                    ;01868D|A526    |000026;
                       AND.B #$80                           ;01868F|2980    |      ;
                       BNE CODE_018694                      ;018691|D001    |018694;
                       RTS                                  ;018693|60      |      ;
 
 
          CODE_018694: INC.W $07ED                          ;018694|EEED07  |0107ED;
                       LDA.B #$00                           ;018697|A900    |      ;
                       STA.W $07EF                          ;018699|8DEF07  |0107EF;
                       STA.W $07F0                          ;01869C|8DF007  |0107F0;
                       STA.W $07F3                          ;01869F|8DF307  |0107F3;
                       LDA.B #$20                           ;0186A2|A920    |      ;
                       STA.W $07F2                          ;0186A4|8DF207  |0107F2;
                       RTS                                  ;0186A7|60      |      ;
 
 
          CODE_0186A8: LDY.B #$00                           ;0186A8|A000    |      ;
                       LDA.W $07ED                          ;0186AA|ADED07  |0107ED;
                       AND.B #$80                           ;0186AD|2980    |      ;
                       BEQ CODE_0186B3                      ;0186AF|F002    |0186B3;
                       LDY.B #$03                           ;0186B1|A003    |      ;
 
          CODE_0186B3: LDX.B r_sceneDrawQueue               ;0186B3|A61D    |00001D;
                       LDA.B #$02                           ;0186B5|A902    |      ;
                       JSR.W CODE_018356                    ;0186B7|205683  |018356;
                       LDA.B #$26                           ;0186BA|A926    |      ;
                       JSR.W CODE_018356                    ;0186BC|205683  |018356;
                       LDA.B #$21                           ;0186BF|A921    |      ;
                       JSR.W CODE_018356                    ;0186C1|205683  |018356;
                       LDA.B #$03                           ;0186C4|A903    |      ;
                       STA.B $00                            ;0186C6|8500    |000000;
 
          CODE_0186C8: LDA.W DATA8_0186DB,Y                 ;0186C8|B9DB86  |0186DB;
                       JSR.W CODE_018356                    ;0186CB|205683  |018356;
                       INY                                  ;0186CE|C8      |      ;
                       DEC.B $00                            ;0186CF|C600    |000000;
                       BNE CODE_0186C8                      ;0186D1|D0F5    |0186C8;
                       LDA.B #$FF                           ;0186D3|A9FF    |      ;
                       JSR.W CODE_018356                    ;0186D5|205683  |018356;
                       STX.B r_sceneDrawQueue               ;0186D8|861D    |00001D;
                       RTS                                  ;0186DA|60      |      ;
 
 
         DATA8_0186DB: db $36,$00,$00,$00,$00,$36,$00,$00   ;0186DB|        |      ;
                       db $00                               ;0186E3|        |      ;
 
          CODE_0186E4: LDA.W $07F2                          ;0186E4|ADF207  |0107F2;
                       BEQ CODE_01870A                      ;0186E7|F021    |01870A;
                       DEC.W $07F2                          ;0186E9|CEF207  |0107F2;
                       LDA.B #$0F                           ;0186EC|A90F    |      ;
                       STA.W $07EF                          ;0186EE|8DEF07  |0107EF;
                       LDA.W $07ED                          ;0186F1|ADED07  |0107ED;
                       AND.B #$80                           ;0186F4|2980    |      ;
                       BEQ CODE_0186FB                      ;0186F6|F003    |0186FB;
                       INC.W $07EF                          ;0186F8|EEEF07  |0107EF;
 
          CODE_0186FB: LDA.W $07F2                          ;0186FB|ADF207  |0107F2;
                       AND.B #$04                           ;0186FE|2904    |      ;
                       BNE CODE_018705                      ;018700|D003    |018705;
                       JMP.W CODE_0186A8                    ;018702|4CA886  |0186A8;
 
 
          CODE_018705: LDY.B #$06                           ;018705|A006    |      ;
                       JMP.W CODE_0186B3                    ;018707|4CB386  |0186B3;
 
 
          CODE_01870A: INC.W $07ED                          ;01870A|EEED07  |0107ED;
                       RTS                                  ;01870D|60      |      ;
 
 
          CODE_01870E: LDA.W $07ED                          ;01870E|ADED07  |0107ED;
                       AND.B #$80                           ;018711|2980    |      ;
                       BNE CODE_018734                      ;018713|D01F    |018734;
                       LDA.W $07EF                          ;018715|ADEF07  |0107EF;
                       BNE CODE_01872E                      ;018718|D014    |01872E;
                       LDA.W $07F3                          ;01871A|ADF307  |0107F3;
                       BEQ CODE_01872E                      ;01871D|F00F    |01872E;
                       INC.W $07ED                          ;01871F|EEED07  |0107ED;
                       LDA.B #$00                           ;018722|A900    |      ;
                       STA.W $07EF                          ;018724|8DEF07  |0107EF;
                       STA.W $07F3                          ;018727|8DF307  |0107F3;
                       STA.W $07F0                          ;01872A|8DF007  |0107F0;
                       RTS                                  ;01872D|60      |      ;
 
 
          CODE_01872E: LDA.B #$08                           ;01872E|A908    |      ;
                       STA.W $07EF                          ;018730|8DEF07  |0107EF;
                       RTS                                  ;018733|60      |      ;
 
 
          CODE_018734: LDA.B #$0B                           ;018734|A90B    |      ;
                       CLC                                  ;018736|18      |      ;
                       ADC.W $07ED                          ;018737|6DED07  |0107ED;
                       STA.W $07ED                          ;01873A|8DED07  |0107ED;
                       RTS                                  ;01873D|60      |      ;
 
 
          CODE_01873E: LDA.W $07F3                          ;01873E|ADF307  |0107F3;
                       BNE CODE_018749                      ;018741|D006    |018749;
                       LDA.B #$09                           ;018743|A909    |      ;
                       STA.W $07EF                          ;018745|8DEF07  |0107EF;
                       RTS                                  ;018748|60      |      ;
 
 
          CODE_018749: INC.W $07ED                          ;018749|EEED07  |0107ED;
                       LDA.B #$00                           ;01874C|A900    |      ;
                       STA.W $07F3                          ;01874E|8DF307  |0107F3;
                       STA.W $07EF                          ;018751|8DEF07  |0107EF;
                       LDA.B #$40                           ;018754|A940    |      ;
                       STA.W $07F0                          ;018756|8DF007  |0107F0;
                       RTS                                  ;018759|60      |      ;
 
 
          CODE_01875A: LDA.W $07F3                          ;01875A|ADF307  |0107F3;
                       BNE CODE_018765                      ;01875D|D006    |018765;
                       LDA.B #$0A                           ;01875F|A90A    |      ;
                       STA.W $07EF                          ;018761|8DEF07  |0107EF;
                       RTS                                  ;018764|60      |      ;
 
 
          CODE_018765: INC.W $07ED                          ;018765|EEED07  |0107ED;
                       LDA.B #$00                           ;018768|A900    |      ;
                       STA.W $07EF                          ;01876A|8DEF07  |0107EF;
                       STA.W $07F0                          ;01876D|8DF007  |0107F0;
                       STA.W $07F3                          ;018770|8DF307  |0107F3;
                       RTS                                  ;018773|60      |      ;
 
 
          CODE_018774: LDA.B r_partner                      ;018774|A53A    |00003A;
                       CMP.B #$FF                           ;018776|C9FF    |      ;
                       BEQ CODE_018783                      ;018778|F009    |018783;
                       LDA.B #$11                           ;01877A|A911    |      ;
                       STA.W $07EF                          ;01877C|8DEF07  |0107EF;
                       INC.W $07ED                          ;01877F|EEED07  |0107ED;
                       RTS                                  ;018782|60      |      ;
 
 
          CODE_018783: LDX.B #$01                           ;018783|A201    |      ;
 
          CODE_018785: LDA.W $054E,X                        ;018785|BD4E05  |01054E;
                       BEQ CODE_01879F                      ;018788|F015    |01879F;
                       LDA.W $0606,X                        ;01878A|BD0606  |010606;
                       CMP.B #$03                           ;01878D|C903    |      ;
                       BNE CODE_01879F                      ;01878F|D00E    |01879F;
                       DEC.W $0606,X                        ;018791|DE0606  |010606;
                       LDA.W $054E,X                        ;018794|BD4E05  |01054E;
                       SEC                                  ;018797|38      |      ;
                       SBC.B #$01                           ;018798|E901    |      ;
                       STA.B r_partner                      ;01879A|853A    |00003A;
                       JSR.W CODE_0187EC                    ;01879C|20EC87  |0187EC;
 
          CODE_01879F: INX                                  ;01879F|E8      |      ;
                       CPX.B #$0D                           ;0187A0|E00D    |      ;
                       BNE CODE_018785                      ;0187A2|D0E1    |018785;
                       LDA.B #$08                           ;0187A4|A908    |      ;
                       CLC                                  ;0187A6|18      |      ;
                       ADC.W $07ED                          ;0187A7|6DED07  |0107ED;
                       STA.W $07ED                          ;0187AA|8DED07  |0107ED;
                       RTS                                  ;0187AD|60      |      ;
 
 
          CODE_0187AE: LDA.W $07EF                          ;0187AE|ADEF07  |0107EF;
                       BNE CODE_0187EB                      ;0187B1|D038    |0187EB;
                       INC.W $07ED                          ;0187B3|EEED07  |0107ED;
                       LDX.B #$01                           ;0187B6|A201    |      ;
 
          CODE_0187B8: LDA.W $054E,X                        ;0187B8|BD4E05  |01054E;
                       BEQ CODE_0187E6                      ;0187BB|F029    |0187E6;
                       LDA.W $0606,X                        ;0187BD|BD0606  |010606;
                       CMP.B #$02                           ;0187C0|C902    |      ;
                       BEQ CODE_0187E3                      ;0187C2|F01F    |0187E3;
                       CMP.B #$03                           ;0187C4|C903    |      ;
                       BNE CODE_0187E6                      ;0187C6|D01E    |0187E6;
                       DEC.W $0606,X                        ;0187C8|DE0606  |010606;
                       LDA.W $054E,X                        ;0187CB|BD4E05  |01054E;
                       SEC                                  ;0187CE|38      |      ;
                       SBC.B #$01                           ;0187CF|E901    |      ;
                       STA.B r_partner                      ;0187D1|853A    |00003A;
                       JSR.W CODE_0187EC                    ;0187D3|20EC87  |0187EC;
                       LDA.W $054E                          ;0187D6|AD4E05  |01054E;
                       BEQ CODE_0187E6                      ;0187D9|F00B    |0187E6;
                       LDA.B r_partner                      ;0187DB|A53A    |00003A;
                       STA.W $054E                          ;0187DD|8D4E05  |01054E;
                       JMP.W CODE_0187E6                    ;0187E0|4CE687  |0187E6;
 
 
          CODE_0187E3: INC.W $0606,X                        ;0187E3|FE0606  |010606;
 
          CODE_0187E6: INX                                  ;0187E6|E8      |      ;
                       CPX.B #$0D                           ;0187E7|E00D    |      ;
                       BNE CODE_0187B8                      ;0187E9|D0CD    |0187B8;
 
          CODE_0187EB: RTS                                  ;0187EB|60      |      ;
 
 
          CODE_0187EC: LDA.B #$00                           ;0187EC|A900    |      ;
                       STA.B r_partnerWeaponLevel           ;0187EE|858F    |00008F;
                       STA.B r_subweapPartner               ;0187F0|8586    |000086;
                       STA.B r_subweapMultiplierPartner     ;0187F2|8588    |000088;
                       RTS                                  ;0187F4|60      |      ;
 
 
          CODE_0187F5: LDA.B #$12                           ;0187F5|A912    |      ;
                       STA.W $07EF                          ;0187F7|8DEF07  |0107EF;
                       LDA.B r_stage                        ;0187FA|A532    |000032;
                       CMP.B #$01                           ;0187FC|C901    |      ;
                       BEQ CODE_01880B                      ;0187FE|F00B    |01880B;
                       LDA.B #$00                           ;018800|A900    |      ;
                       STA.W $07EF                          ;018802|8DEF07  |0107EF;
                       INC.W $07ED                          ;018805|EEED07  |0107ED;
                       JMP.W CODE_018810                    ;018808|4C1088  |018810;
 
 
          CODE_01880B: LDA.B #$80                           ;01880B|A980    |      ;
                       STA.W $07F2                          ;01880D|8DF207  |0107F2;
 
          CODE_018810: INC.W $07ED                          ;018810|EEED07  |0107ED;
                       RTS                                  ;018813|60      |      ;
 
 
          CODE_018814: DEC.W $07F2                          ;018814|CEF207  |0107F2;
                       BNE CODE_01881C                      ;018817|D003    |01881C;
                       INC.W $07ED                          ;018819|EEED07  |0107ED;
 
          CODE_01881C: RTS                                  ;01881C|60      |      ;
 
 
          CODE_01881D: INC.W $07ED                          ;01881D|EEED07  |0107ED;
                       LDA.B #$07                           ;018820|A907    |      ;
                       STA.W $07F0                          ;018822|8DF007  |0107F0;
                       LDA.B #$06                           ;018825|A906    |      ;
                       STA.W $07F3                          ;018827|8DF307  |0107F3;
                       LDA.B #$00                           ;01882A|A900    |      ;
                       STA.W $07F2                          ;01882C|8DF207  |0107F2;
                       STA.W $07F1                          ;01882F|8DF107  |0107F1;
                       STA.W $07EF                          ;018832|8DEF07  |0107EF;
                       RTS                                  ;018835|60      |      ;
 
 
          CODE_018836: LDA.W $07F3                          ;018836|ADF307  |0107F3;
                       AND.B #$01                           ;018839|2901    |      ;
                       BNE CODE_018847                      ;01883B|D00A    |018847;
                       LDA.B #$20                           ;01883D|A920    |      ;
                       STA.B $17                            ;01883F|8517    |000017;
                       LDA.B r_PPUCtrl                      ;018841|A5FF    |0000FF;
                       ORA.B #$01                           ;018843|0901    |      ;
                       BNE CODE_01884F                      ;018845|D008    |01884F;
 
          CODE_018847: LDA.B #$24                           ;018847|A924    |      ;
                       STA.B $17                            ;018849|8517    |000017;
                       LDA.B r_PPUCtrl                      ;01884B|A5FF    |0000FF;
                       AND.B #$FE                           ;01884D|29FE    |      ;
 
          CODE_01884F: STA.B r_PPUCtrl                      ;01884F|85FF    |0000FF;
                       LDA.W $07F3                          ;018851|ADF307  |0107F3;
                       CMP.B #$FF                           ;018854|C9FF    |      ;
                       BEQ CODE_01885C                      ;018856|F004    |01885C;
                       JSR.W CODE_018D82                    ;018858|20828D  |018D82;
                       RTS                                  ;01885B|60      |      ;
 
 
          CODE_01885C: INC.W $07ED                          ;01885C|EEED07  |0107ED;
                       LDA.B #$00                           ;01885F|A900    |      ;
                       STA.W $07F1                          ;018861|8DF107  |0107F1;
                       STA.W $07F0                          ;018864|8DF007  |0107F0;
                       STA.W $07F2                          ;018867|8DF207  |0107F2;
                       LDA.B #$43                           ;01886A|A943    |      ;
                       STA.B r_CHR_BankBG_0c00              ;01886C|854D    |00004D;
                       db $20                               ;01886E|        |      ;
                       dw CODE_0FE35D                       ;01886F|        |0FE35D;
                       RTS                                  ;018871|60      |      ;
 
 
          CODE_018872: LDA.B #$0B                           ;018872|A90B    |      ;
                       STA.W $07EF                          ;018874|8DEF07  |0107EF;
                       LDA.B r_stage                        ;018877|A532    |000032;
                       CMP.B #$01                           ;018879|C901    |      ;
                       BNE CODE_018892                      ;01887B|D015    |018892;
                       LDA.B #$03                           ;01887D|A903    |      ;
                       STA.B $00                            ;01887F|8500    |000000;
 
         DATA8_018881: db $20                               ;018881|        |      ;
                       dw CODE_0FFEB9                       ;018882|        |0FFEB9;
                       LDA.B #$05                           ;018884|A905    |      ;
                       STA.W $054E,X                        ;018886|9D4E05  |01054E;
                       LDA.B $00                            ;018889|A500    |000000;
                       STA.W $0606,X                        ;01888B|9D0606  |010606;
                       DEC.B $00                            ;01888E|C600    |000000;
                       BNE DATA8_018881                     ;018890|D0EF    |018881;
 
          CODE_018892: INC.W $07ED                          ;018892|EEED07  |0107ED;
                       LDA.B #$00                           ;018895|A900    |      ;
                       STA.W $07F3                          ;018897|8DF307  |0107F3;
                       RTS                                  ;01889A|60      |      ;
 
 
          CODE_01889B: LDA.W $07F3                          ;01889B|ADF307  |0107F3;
                       CMP.B #$D0                           ;01889E|C9D0    |      ;
                       BEQ CODE_0188C3                      ;0188A0|F021    |0188C3;
                       LSR A                                ;0188A2|4A      |      ;
                       AND.B #$0F                           ;0188A3|290F    |      ;
                       TAY                                  ;0188A5|A8      |      ;
                       LDA.B r_stage                        ;0188A6|A532    |000032;
                       CMP.B #$01                           ;0188A8|C901    |      ;
                       BNE CODE_0188BF                      ;0188AA|D013    |0188BF;
                       LDA.W DATA8_0188CC,Y                 ;0188AC|B9CC88  |0188CC;
                       STA.B r_ScrollY                      ;0188AF|85FC    |0000FC;
                       STA.B r_ScrollX                      ;0188B1|85FD    |0000FD;
                       LDA.W $07F3                          ;0188B3|ADF307  |0107F3;
                       AND.B #$0F                           ;0188B6|290F    |      ;
                       BNE CODE_0188BF                      ;0188B8|D005    |0188BF;
                       LDA.B #$3A                           ;0188BA|A93A    |      ;
                       db $20                               ;0188BC|        |      ;
                       dw initFreezWaterEffect_01           ;0188BD|        |0FE25F;
 
          CODE_0188BF: INC.W $07F3                          ;0188BF|EEF307  |0107F3;
                       RTS                                  ;0188C2|60      |      ;
 
 
          CODE_0188C3: INC.W $07ED                          ;0188C3|EEED07  |0107ED;
                       LDA.B #$00                           ;0188C6|A900    |      ;
                       STA.W $07EF                          ;0188C8|8DEF07  |0107EF;
                       RTS                                  ;0188CB|60      |      ;
 
 
         DATA8_0188CC: db $00,$02,$01,$03,$00,$01,$01,$02   ;0188CC|        |      ;
                       db $01,$03,$00,$01,$00,$02,$03,$00   ;0188D4|        |      ;
 
          CODE_0188DC: INC.W $07ED                          ;0188DC|EEED07  |0107ED;
                       RTS                                  ;0188DF|60      |      ;
 
 
          CODE_0188E0: LDA.B #$07                           ;0188E0|A907    |      ;
                       STA.W $0160                          ;0188E2|8D6001  |010160;
                       LDA.B #$B4                           ;0188E5|A9B4    |      ;
                       STA.W $07F2                          ;0188E7|8DF207  |0107F2;
                       JMP.W CODE_0188DC                    ;0188EA|4CDC88  |0188DC;
 
 
          CODE_0188ED: LDA.B #$1E                           ;0188ED|A91E    |      ;
                       STA.B r_gameTransition               ;0188EF|852A    |00002A;
                       LDA.B #$00                           ;0188F1|A900    |      ;
                       STA.W $07EC                          ;0188F3|8DEC07  |0107EC;
                       STA.W $07ED                          ;0188F6|8DED07  |0107ED;
                       STA.W $07EE                          ;0188F9|8DEE07  |0107EE;
                       STA.W $07EF                          ;0188FC|8DEF07  |0107EF;
                       STA.W $07F0                          ;0188FF|8DF007  |0107F0;
                       STA.W $07F1                          ;018902|8DF107  |0107F1;
                       STA.W $07F2                          ;018905|8DF207  |0107F2;
                       STA.W $07F3                          ;018908|8DF307  |0107F3;
                       RTS                                  ;01890B|60      |      ;
 
 
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
 
 
          CODE_018944: LDA.W textGroups,Y                   ;018944|B9268A  |018A26;
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
 
     textDataGrant_00: db $CC,$F8,$00,$ED,$E0,$EC,$E4,$00   ;018AB2|        |      ;
                       db $E8,$F2,$00,$C6,$F1,$E0,$ED,$F3   ;018ABA|        |      ;
                       db $DB,$FF                           ;018AC2|        |      ;
 
     textDataGrant_01: db $C8,$00,$E3,$F1,$E4,$E0,$EC,$E4   ;018AC4|        |      ;
                       db $E3,$00,$C8,$00,$F6,$E0,$F2,$FF   ;018ACC|        |      ;
 
     textDataGrant_02: db $F3,$F4,$F1,$ED,$E4,$E3,$00,$E8   ;018AD4|        |      ;
                       db $ED,$F3,$EE,$00,$E0,$00,$E6,$E7   ;018ADC|        |      ;
                       db $EE,$F2,$F3,$DB,$FF               ;018AE4|        |      ;
 
         DATA8_018AE9: db $CF,$EB,$E4,$E0,$F2,$E4,$00,$F3   ;018AE9|        |      ;
                       db $E0,$EA,$E4,$00,$EC,$E4,$00,$F6   ;018AF1|        |      ;
                       db $E8,$F3,$E7,$FF                   ;018AF9|        |      ;
 
         DATA8_018AFD: db $F8,$EE,$F4,$DB,$00,$00,$CC,$F8   ;018AFD|        |      ;
                       db $00,$E5,$E0,$EC,$E8,$EB,$F8,$00   ;018B05|        |      ;
                       db $F6,$E0,$F2,$FF                   ;018B0D|        |      ;
 
         DATA8_018B11: db $EA,$E8,$EB,$EB,$E4,$E3,$00,$E1   ;018B11|        |      ;
                       db $F8,$00,$C3,$F1,$E0,$E2,$F4,$EB   ;018B19|        |      ;
                       db $E0,$DB,$FF                       ;018B21|        |      ;
 
         DATA8_018B24: db $D6,$E7,$E0,$F3,$00,$F6,$E8,$EB   ;018B24|        |      ;
                       db $EB,$00,$F8,$EE,$F4,$00,$E3,$EE   ;018B2C|        |      ;
                       db $FB,$FF                           ;018B34|        |      ;
 
         DATA8_018B36: db $00,$00,$D3,$E0,$EA,$E4,$00,$E7   ;018B36|        |      ;
                       db $E8,$EC,$00,$F6,$E8,$F3,$E7,$00   ;018B3E|        |      ;
                       db $F8,$EE,$F4,$FB,$FF               ;018B46|        |      ;
 
         DATA8_018B4B: db $00,$00,$CB,$E4,$E0,$F5,$E4,$00   ;018B4B|        |      ;
                       db $E7,$E8,$EC,$00,$E1,$E4,$E7,$E8   ;018B53|        |      ;
                       db $ED,$E3,$FB,$FF                   ;018B5B|        |      ;
 
         DATA8_018B5F: db $C8,$00,$E2,$E0,$ED,$00,$E7,$E4   ;018B5F|        |      ;
                       db $EB,$EF,$00,$F8,$EE,$F4,$FF       ;018B67|        |      ;
 
         DATA8_018B6E: db $E0,$00                           ;018B6E|        |      ;
 
         DATA8_018B70: db $EB,$EE,$F3,$00                   ;018B70|        |      ;
 
         DATA8_018B74: db $E1,$E4,$E2,$E0,$F4,$F2,$E4,$00   ;018B74|        |      ;
                       db $C8,$FF                           ;018B7C|        |      ;
 
         DATA8_018B7E: db $E0,$EC,$00,$F5,$E4,$F1,$F8,$00   ;018B7E|        |      ;
                       db $E5,$E0,$F2,$F3,$DB,$FF           ;018B86|        |      ;
 
         DATA8_018B8C: db $D3,$E7,$E0,$ED,$EA,$F2,$00,$E5   ;018B8C|        |      ;
                       db $EE,$F1,$00,$E7,$E4,$EB,$EF,$E8   ;018B94|        |      ;
                       db $ED,$E6,$FF                       ;018B9C|        |      ;
 
         DATA8_018B9F: db $EC,$E4,$DB,$00,$00,$C8,$00,$E7   ;018B9F|        |      ;
                       db $EE,$EF,$E4,$00,$F6,$E4,$00,$F2   ;018BA7|        |      ;
                       db $E4,$E4,$FF                       ;018BAF|        |      ;
 
         DATA8_018BB2: db $E4,$E0,$E2,$E7,$00,$EE,$F3,$E7   ;018BB2|        |      ;
                       db $E4,$F1,$00,$E0,$E6,$E0,$E8,$ED   ;018BBA|        |      ;
                       db $DB,$FF                           ;018BC2|        |      ;
 
         DATA8_018BC4: db $CC,$F8,$00,$E9,$EE,$E1,$00,$E8   ;018BC4|        |      ;
                       db $F2,$00,$E3,$EE,$ED,$E4,$DC,$FF   ;018BCC|        |      ;
 
         DATA8_018BD4: db $F2,$EE,$00,$F8,$EE,$F4,$00,$F2   ;018BD4|        |      ;
                       db $E7,$EE,$F4,$EB,$E3,$00,$E6,$EE   ;018BDC|        |      ;
                       db $FF                               ;018BE4|        |      ;
 
         DATA8_018BE5: db $F6,$E8,$F3,$E7,$00,$E7,$E8,$EC   ;018BE5|        |      ;
                       db $00,$E5,$EE,$F1,$00,$ED,$EE,$F6   ;018BED|        |      ;
                       db $DB,$FF                           ;018BF5|        |      ;
 
         DATA8_018BF7: db $D3,$E7,$E0,$ED,$EA,$F2,$00,$E5   ;018BF7|        |      ;
                       db $EE,$F1,$00,$E7,$E4,$EB,$EF,$E8   ;018BFF|        |      ;
                       db $ED,$E6,$FF                       ;018C07|        |      ;
 
    textDataSympha_00: db $EC,$E4,$DB,$00,$00,$C8,$DA,$EC   ;018C0A|        |      ;
                       db $00,$D2,$F8,$E5,$E0,$DC,$00,$F3   ;018C12|        |      ;
                       db $E7,$E4,$FF                       ;018C1A|        |      ;
 
         DATA8_018C1D: db $D5,$E0,$EC,$EF,$E8,$F1,$E4,$00   ;018C1D|        |      ;
                       db $C7,$F4,$ED,$F3,$E4,$F1,$DB,$FF   ;018C25|        |      ;
 
         DATA8_018C2D: db $C8,$00,$F6,$E8,$EB,$EB,$00,$E5   ;018C2D|        |      ;
                       db $EE,$EB,$EB,$EE,$F6,$FF           ;018C35|        |      ;
 
         DATA8_018C3B: db $F8,$EE,$F4,$00,$E8,$E5,$00,$F8   ;018C3B|        |      ;
                       db $EE,$F4,$00,$ED,$E4,$E4,$E3,$FF   ;018C43|        |      ;
 
         DATA8_018C4B: db $EC,$F8,$00,$E7,$E4,$EB,$EF,$DB   ;018C4B|        |      ;
                       db $FF                               ;018C53|        |      ;
 
         DATA8_018C54: db $C8,$00,$E7,$EE,$EF,$E4,$00,$E0   ;018C54|        |      ;
                       db $00,$CC,$E0,$E6,$E8,$E2,$FF       ;018C5C|        |      ;
 
         DATA8_018C63: db $D2,$EF,$E8,$F1,$E8,$F3,$00,$F6   ;018C63|        |      ;
                       db $E8,$EB,$EB,$00,$E6,$E8,$F5,$E4   ;018C6B|        |      ;
                       db $FF                               ;018C73|        |      ;
 
         DATA8_018C74: db $F4,$F2,$00,$F3,$E7,$E4,$00,$EF   ;018C74|        |      ;
                       db $EE,$F6,$E4,$F1,$DB,$FF           ;018C7C|        |      ;
 
         DATA8_018C82: db $CF,$EB,$E4,$E0,$F2,$E4,$00,$E1   ;018C82|        |      ;
                       db $E4,$00,$E2,$E0,$F1,$E4,$E5,$F4   ;018C8A|        |      ;
                       db $EB,$DB,$FF                       ;018C92|        |      ;
 
         DATA8_018C95: db $C8,$00,$E7,$EE,$EF,$E4,$00,$F8   ;018C95|        |      ;
                       db $EE,$F4,$00,$F6,$E8,$EB,$EB,$00   ;018C9D|        |      ;
                       db $E1,$E4,$FF                       ;018CA5|        |      ;
 
         DATA8_018CA8: db $F5,$E8,$E2,$F3,$EE,$F1,$E8,$EE   ;018CA8|        |      ;
                       db $F4,$F2,$DB,$FF                   ;018CB0|        |      ;
 
         DATA8_018CB4: db $C8,$DA,$EC,$00,$F2,$F4,$F1,$EF   ;018CB4|        |      ;
                       db $F1,$E8,$F2,$E4,$E3,$00,$F8,$EE   ;018CBC|        |      ;
                       db $F4,$FF                           ;018CC4|        |      ;
 
         DATA8_018CC6: db $E1,$E4,$E0,$F3,$00,$EC,$E4,$DB   ;018CC6|        |      ;
                       db $00,$00,$C8,$DA,$F5,$E4,$00,$E1   ;018CCE|        |      ;
                       db $E4,$E4,$ED,$FF                   ;018CD6|        |      ;
 
         DATA8_018CDA: db $F6,$E0,$E8,$F3,$E8,$ED,$E6,$00   ;018CDA|        |      ;
                       db $E5,$EE,$F1,$00,$F8,$EE,$F4,$DB   ;018CE2|        |      ;
                       db $FF                               ;018CEA|        |      ;
 
         DATA8_018CEB: db $C8,$00,$ED,$E4,$E4,$E3,$00,$F8   ;018CEB|        |      ;
                       db $EE,$F4,$00,$F3,$EE,$FF           ;018CF3|        |      ;
 
         DATA8_018CF9: db $E7,$E4,$EB,$EF,$00,$EC,$E4,$00   ;018CF9|        |      ;
                       db $E3,$E4,$F2,$F3,$F1,$EE,$F8,$FF   ;018D01|        |      ;
 
         DATA8_018D09: db $C3,$F1,$E0,$E2,$F4,$EB,$E0,$DB   ;018D09|        |      ;
                       db $FF                               ;018D11|        |      ;
 
         DATA8_018D12: db $C8,$DA,$EC,$00,$E6,$EB,$E0,$E3   ;018D12|        |      ;
                       db $00,$F3,$EE,$00,$E7,$E4,$E0,$F1   ;018D1A|        |      ;
                       db $FF                               ;018D22|        |      ;
 
         DATA8_018D23: db $F3,$E7,$E0,$F3,$DB,$00,$00,$CB   ;018D23|        |      ;
                       db $E4,$F3,$DA,$F2,$00,$E6,$E4,$F3   ;018D2B|        |      ;
                       db $FF                               ;018D33|        |      ;
 
         DATA8_018D34: db $E7,$E8,$EC,$00,$DB,$00,$00,$C8   ;018D34|        |      ;
                       db $00,$E0,$EC,$00,$C0,$EB,$F4,$E2   ;018D3C|        |      ;
                       db $E0,$F1,$E3,$DB,$FF               ;018D44|        |      ;
 
         DATA8_018D49: db $D6,$E4,$EB,$EB,$DC,$00,$C8,$DA   ;018D49|        |      ;
                       db $EB,$EB,$00,$E7,$E0,$F5,$E4,$00   ;018D51|        |      ;
                       db $F3,$EE,$FF                       ;018D59|        |      ;
 
         DATA8_018D5C: db $E5,$E8,$ED,$E3,$00,$F2,$EE,$EC   ;018D5C|        |      ;
                       db $E4,$EE,$ED,$E4,$00,$E4,$EB,$F2   ;018D64|        |      ;
                       db $E4,$DB,$FF                       ;018D6C|        |      ;
 
         DATA8_018D6F: db $CF,$EB,$E4,$E0,$F2,$E4,$00,$E1   ;018D6F|        |      ;
                       db $E4,$00,$E2,$E0,$F1,$E4,$E5,$F4   ;018D77|        |      ;
                       db $EB,$FA,$FF                       ;018D7F|        |      ;
 
          CODE_018D82: LDY.B #$01                           ;018D82|A001    |      ;
                       BNE CODE_018D88                      ;018D84|D002    |018D88;
 
          CODE_018D86: LDY.B #$00                           ;018D86|A000    |      ;
 
          CODE_018D88: LDA.W $07F0                          ;018D88|ADF007  |0107F0;
                       BPL CODE_018DB1                      ;018D8B|1024    |018DB1;
                       DEC.W $07F0                          ;018D8D|CEF007  |0107F0;
                       LDA.W $07F0                          ;018D90|ADF007  |0107F0;
                       AND.B #$7F                           ;018D93|297F    |      ;
                       BNE CODE_018DB0                      ;018D95|D019    |018DB0;
 
          CODE_018D97: TYA                                  ;018D97|98      |      ;
                       PHA                                  ;018D98|48      |      ;
                       JSR.W CODE_0192DA                    ;018D99|20DA92  |0192DA;
                       PLA                                  ;018D9C|68      |      ;
                       TAY                                  ;018D9D|A8      |      ;
                       CPY.B #$00                           ;018D9E|C000    |      ;
                       BEQ CODE_018DA8                      ;018DA0|F006    |018DA8;
                       DEC.W $07F3                          ;018DA2|CEF307  |0107F3;
                       JMP.W CODE_018DAB                    ;018DA5|4CAB8D  |018DAB;
 
 
          CODE_018DA8: INC.W $07F3                          ;018DA8|EEF307  |0107F3;
 
          CODE_018DAB: LDA.B #$07                           ;018DAB|A907    |      ;
                       STA.W $07F0                          ;018DAD|8DF007  |0107F0;
 
          CODE_018DB0: RTS                                  ;018DB0|60      |      ;
 
 
          CODE_018DB1: DEC.W $07F0                          ;018DB1|CEF007  |0107F0;
                       BEQ CODE_018D97                      ;018DB4|F0E1    |018D97;
 
          CODE_018DB6: LDA.W $07F3                          ;018DB6|ADF307  |0107F3;
                       ASL A                                ;018DB9|0A      |      ;
                       TAY                                  ;018DBA|A8      |      ;
                       LDA.W DATA8_019173,Y                 ;018DBB|B97391  |019173;
                       STA.B $06                            ;018DBE|8506    |000006;
                       LDA.W DATA8_019174,Y                 ;018DC0|B97491  |019174;
                       STA.B $07                            ;018DC3|8507    |000007;
                       LDA.W PTR16_018F50,Y                 ;018DC5|B9508F  |018F50;
                       STA.B $04                            ;018DC8|8504    |000004;
                       LDA.W PTR16_018F51,Y                 ;018DCA|B9518F  |018F51;
                       STA.B $05                            ;018DCD|8505    |000005;
                       LDA.B #$00                           ;018DCF|A900    |      ;
                       STA.B r_index                        ;018DD1|8510    |000010;
                       LDA.W $07F1                          ;018DD3|ADF107  |0107F1;
                       ASL A                                ;018DD6|0A      |      ;
                       ROL.B r_index                        ;018DD7|2610    |000010;
                       ASL A                                ;018DD9|0A      |      ;
                       ROL.B r_index                        ;018DDA|2610    |000010;
                       ASL A                                ;018DDC|0A      |      ;
                       ROL.B r_index                        ;018DDD|2610    |000010;
                       ASL A                                ;018DDF|0A      |      ;
                       ROL.B r_index                        ;018DE0|2610    |000010;
                       ASL A                                ;018DE2|0A      |      ;
                       ROL.B r_index                        ;018DE3|2610    |000010;
                       CLC                                  ;018DE5|18      |      ;
                       ADC.B $06                            ;018DE6|6506    |000006;
                       STA.B $06                            ;018DE8|8506    |000006;
                       STA.B r_pointerQueue                 ;018DEA|8508    |000008;
                       LDA.B $07                            ;018DEC|A507    |000007;
                       ADC.B r_index                        ;018DEE|6510    |000010;
                       STA.B $07                            ;018DF0|8507    |000007;
                       ORA.B $17                            ;018DF2|0517    |000017;
                       STA.B $09                            ;018DF4|8509    |000009;
                       LDX.B r_sceneDrawQueue               ;018DF6|A61D    |00001D;
 
          CODE_018DF8: LDA.B #$01                           ;018DF8|A901    |      ;
                       JSR.W CODE_018A21                    ;018DFA|20218A  |018A21;
                       LDA.B r_pointerQueue                 ;018DFD|A508    |000008;
 
                       JSR.W CODE_018A21                    ;018DFF|20218A  |018A21;
                       LDA.B $09                            ;018E02|A509    |000009;
                       JSR.W CODE_018A21                    ;018E04|20218A  |018A21;
 
          CODE_018E07: LDY.W $07F2                          ;018E07|ACF207  |0107F2;
                       LDA.B ($04),Y                        ;018E0A|B104    |000004;
                       CMP.B #$FF                           ;018E0C|C9FF    |      ;
                       BEQ CODE_018E6E                      ;018E0E|F05E    |018E6E;
                       CMP.B #$FE                           ;018E10|C9FE    |      ;
                       BEQ CODE_018E87                      ;018E12|F073    |018E87;
                       CMP.B #$03                           ;018E14|C903    |      ;
                       BEQ CODE_018E58                      ;018E16|F040    |018E58;
                       CMP.B #$01                           ;018E18|C901    |      ;
                       BEQ CODE_018E3A                      ;018E1A|F01E    |018E3A;
                       STA.B r_tempCurrRoomIdx              ;018E1C|850E    |00000E;
                       INY                                  ;018E1E|C8      |      ;
                       LDA.B ($04),Y                        ;018E1F|B104    |000004;
                       STA.B r_roomSectionChrBanksDataOffset;018E21|850F    |00000F;
                       CLC                                  ;018E23|18      |      ;
                       ADC.B $06                            ;018E24|6506    |000006;
                       STA.B $06                            ;018E26|8506    |000006;
                       STA.B r_pointerQueue                 ;018E28|8508    |000008;
                       LDA.B r_tempCurrRoomIdx              ;018E2A|A50E    |00000E;
 
          CODE_018E2C: JSR.W CODE_018A21                    ;018E2C|20218A  |018A21;
                       DEC.B r_roomSectionChrBanksDataOffset;018E2F|C60F    |00000F;
                       BNE CODE_018E2C                      ;018E31|D0F9    |018E2C;
                       INY                                  ;018E33|C8      |      ;
                       STY.W $07F2                          ;018E34|8CF207  |0107F2;
                       JMP.W CODE_018E07                    ;018E37|4C078E  |018E07;
 
 
          CODE_018E3A: INY                                  ;018E3A|C8      |      ;
                       STY.W $07F2                          ;018E3B|8CF207  |0107F2;
                       LDA.B ($04),Y                        ;018E3E|B104    |000004;
                       STA.B r_tempCurrSection              ;018E40|850D    |00000D;
                       JSR.W CODE_018E9F                    ;018E42|209F8E  |018E9F;
                       LDY.W $07F2                          ;018E45|ACF207  |0107F2;
                       LDA.B ($04),Y                        ;018E48|B104    |000004;
                       CLC                                  ;018E4A|18      |      ;
                       ADC.B $06                            ;018E4B|6506    |000006;
                       STA.B $06                            ;018E4D|8506    |000006;
                       STA.B r_pointerQueue                 ;018E4F|8508    |000008;
                       INY                                  ;018E51|C8      |      ;
                       STY.W $07F2                          ;018E52|8CF207  |0107F2;
                       JMP.W CODE_018E07                    ;018E55|4C078E  |018E07;
 
 
          CODE_018E58: INY                                  ;018E58|C8      |      ;
                       LDA.B ($04),Y                        ;018E59|B104    |000004;
                       CLC                                  ;018E5B|18      |      ;
                       ADC.B $06                            ;018E5C|6506    |000006;
                       STA.B $06                            ;018E5E|8506    |000006;
                       STA.B r_pointerQueue                 ;018E60|8508    |000008;
                       INY                                  ;018E62|C8      |      ;
                       STY.W $07F2                          ;018E63|8CF207  |0107F2;
                       LDA.B #$FF                           ;018E66|A9FF    |      ;
                       JSR.W CODE_018A21                    ;018E68|20218A  |018A21;
                       JMP.W CODE_018DF8                    ;018E6B|4CF88D  |018DF8;
 
 
          CODE_018E6E: INY                                  ;018E6E|C8      |      ;
                       STY.W $07F2                          ;018E6F|8CF207  |0107F2;
                       INC.W $07F1                          ;018E72|EEF107  |0107F1;
                       LDA.B #$FF                           ;018E75|A9FF    |      ;
                       JSR.W CODE_018A21                    ;018E77|20218A  |018A21;
                       STX.B r_sceneDrawQueue               ;018E7A|861D    |00001D;
                       LDA.W $07F1                          ;018E7C|ADF107  |0107F1;
                       AND.B #$01                           ;018E7F|2901    |      ;
                       BEQ CODE_018E86                      ;018E81|F003    |018E86;
                       JMP.W CODE_018DB6                    ;018E83|4CB68D  |018DB6;
 
 
          CODE_018E86: RTS                                  ;018E86|60      |      ;
 
 
          CODE_018E87: LDA.B #$FF                           ;018E87|A9FF    |      ;
                       JSR.W CODE_018A21                    ;018E89|20218A  |018A21;
                       STX.B r_sceneDrawQueue               ;018E8C|861D    |00001D;
                       LDA.W $07F0                          ;018E8E|ADF007  |0107F0;
                       ORA.B #$80                           ;018E91|0980    |      ;
                       STA.W $07F0                          ;018E93|8DF007  |0107F0;
                       LDA.B #$00                           ;018E96|A900    |      ;
                       STA.W $07F2                          ;018E98|8DF207  |0107F2;
                       STA.W $07F1                          ;018E9B|8DF107  |0107F1;
                       RTS                                  ;018E9E|60      |      ;
 
 
          CODE_018E9F: JSR.W CODE_018EBD                    ;018E9F|20BD8E  |018EBD;
 
          CODE_018EA2: JSR.W CODE_018EFA                    ;018EA2|20FA8E  |018EFA;
                       JSR.W CODE_018A21                    ;018EA5|20218A  |018A21;
                       INC.B r_tempCurrGroup                ;018EA8|E60C    |00000C;
                       DEC.B r_tempCurrSection              ;018EAA|C60D    |00000D;
                       BEQ CODE_018EBC                      ;018EAC|F00E    |018EBC;
                       LDA.B r_tempCurrGroup                ;018EAE|A50C    |00000C;
                       CMP.B #$04                           ;018EB0|C904    |      ;
                       BNE CODE_018EA2                      ;018EB2|D0EE    |018EA2;
                       INC.B r_temp_Xpos                    ;018EB4|E60A    |00000A;
                       LDA.B #$00                           ;018EB6|A900    |      ;
                       STA.B r_tempCurrGroup                ;018EB8|850C    |00000C;
                       BEQ CODE_018EA2                      ;018EBA|F0E6    |018EA2;
 
          CODE_018EBC: RTS                                  ;018EBC|60      |      ;
 
 
          CODE_018EBD: LDA.B $06                            ;018EBD|A506    |000006;
                       SEC                                  ;018EBF|38      |      ;
                       SBC.B #$80                           ;018EC0|E980    |      ;
                       STA.B r_tempCurrGroup                ;018EC2|850C    |00000C;
                       LDA.B $07                            ;018EC4|A507    |000007;
                       SBC.B #$00                           ;018EC6|E900    |      ;
                       STA.B $0B                            ;018EC8|850B    |00000B;
                       LDA.B r_tempCurrGroup                ;018ECA|A50C    |00000C;
                       AND.B #$80                           ;018ECC|2980    |      ;
                       STA.B $01                            ;018ECE|8501    |000001;
                       LDA.B $0B                            ;018ED0|A50B    |00000B;
                       AND.B #$03                           ;018ED2|2903    |      ;
                       LSR A                                ;018ED4|4A      |      ;
                       ROR.B $01                            ;018ED5|6601    |000001;
                       LSR A                                ;018ED7|4A      |      ;
                       ROR.B $01                            ;018ED8|6601    |000001;
                       LSR A                                ;018EDA|4A      |      ;
                       ROR.B $01                            ;018EDB|6601    |000001;
                       LSR A                                ;018EDD|4A      |      ;
                       ROR.B $01                            ;018EDE|6601    |000001;
                       LDA.B r_tempCurrGroup                ;018EE0|A50C    |00000C;
                       AND.B #$1F                           ;018EE2|291F    |      ;
                       LSR A                                ;018EE4|4A      |      ;
                       LSR A                                ;018EE5|4A      |      ;
                       ORA.B $01                            ;018EE6|0501    |000001;
                       STA.B r_temp_Xpos                    ;018EE8|850A    |00000A;
                       LDA.B r_tempCurrGroup                ;018EEA|A50C    |00000C;
                       AND.B #$60                           ;018EEC|2960    |      ;
                       LSR A                                ;018EEE|4A      |      ;
                       LSR A                                ;018EEF|4A      |      ;
                       LSR A                                ;018EF0|4A      |      ;
                       STA.B $0B                            ;018EF1|850B    |00000B;
                       LDA.B r_tempCurrGroup                ;018EF3|A50C    |00000C;
                       AND.B #$03                           ;018EF5|2903    |      ;
                       STA.B r_tempCurrGroup                ;018EF7|850C    |00000C;
                       RTS                                  ;018EF9|60      |      ;
 
 
          CODE_018EFA: JSR.W DATA8_018F3C                   ;018EFA|203C8F  |018F3C;
                       LDY.B r_temp_Xpos                    ;018EFD|A40A    |00000A;
                       INY                                  ;018EFF|C8      |      ;
                       db $20                               ;018F00|        |      ;
                       dw CODE_0FEB86                       ;018F01|        |0FEB86;
                       LDA.B r_stage                        ;018F03|A532    |000032;
                       ASL A                                ;018F05|0A      |      ;
                       TAY                                  ;018F06|A8      |      ;
                       db $20                               ;018F07|        |      ;
                       dw levelLoadstart                    ;018F08|        |0FEB66;
                       LDA.B #$00                           ;018F0A|A900    |      ;
                       ASL.B $00                            ;018F0C|0600    |000000;
                       ROL A                                ;018F0E|2A      |      ;
                       ASL.B $00                            ;018F0F|0600    |000000;
                       ROL A                                ;018F11|2A      |      ;
                       ASL.B $00                            ;018F12|0600    |000000;
                       ROL A                                ;018F14|2A      |      ;
                       ASL.B $00                            ;018F15|0600    |000000;
                       ROL A                                ;018F17|2A      |      ;
                       STA.B $01                            ;018F18|8501    |000001;
                       LDA.B $02                            ;018F1A|A502    |000002;
                       CLC                                  ;018F1C|18      |      ;
                       ADC.B $00                            ;018F1D|6500    |000000;
                       STA.B $00                            ;018F1F|8500    |000000;
                       LDA.B $01                            ;018F21|A501    |000001;
                       ADC.B $03                            ;018F23|6503    |000003;
                       STA.B $01                            ;018F25|8501    |000001;
                       LDA.B $0B                            ;018F27|A50B    |00000B;
                       CLC                                  ;018F29|18      |      ;
                       ADC.B r_tempCurrGroup                ;018F2A|650C    |00000C;
                       STA.B $02                            ;018F2C|8502    |000002;
                       db $20                               ;018F2E|        |      ;
                       dw CODE_0FEB9C                       ;018F2F|        |0FEB9C;
                       LDA.B $02                            ;018F31|A502    |000002;
                       RTS                                  ;018F33|60      |      ;
 
 
         DATA8_018F34: db $00,$00,$30,$00,$00,$00,$00,$30   ;018F34|        |      ;
 
         DATA8_018F3C: db $20                               ;018F3C|        |      ;
                       dw CODE_0FEB5D                       ;018F3D|        |0FEB5D;
                       LDY.B r_stage                        ;018F3F|A432    |000032;
                       LDA.W DATA8_018F34,Y                 ;018F41|B9348F  |018F34;
                       CLC                                  ;018F44|18      |      ;
                       ADC.B $00                            ;018F45|6500    |000000;
                       STA.B $00                            ;018F47|8500    |000000;
                       LDA.B $01                            ;018F49|A501    |000001;
                       ADC.B #$00                           ;018F4B|6900    |      ;
                       STA.B $01                            ;018F4D|8501    |000001;
                       RTS                                  ;018F4F|60      |      ;
 
 
         PTR16_018F50: dw DATA8_018F5E                      ;018F50|        |018F5E;
                       dw DATA8_018F7F                      ;018F52|        |018F7F;
                       dw DATA8_018FA5                      ;018F54|        |018FA5;
                       dw DATA8_018FE3                      ;018F56|        |018FE3;
                       dw DATA8_019039                      ;018F58|        |019039;
                       dw DATA8_0190A7                      ;018F5A|        |0190A7;
                       dw DATA8_01912D                      ;018F5C|        |01912D;
 
         DATA8_018F5E: db $01,$18,$FF,$01,$18,$FF,$01,$18   ;018F5E|        |      ;
                       db $FF,$01,$18,$FF,$01,$18,$FF,$01   ;018F66|        |      ;
                       db $18,$FF,$01,$18,$FF,$01,$18,$FF   ;018F6E|        |      ;
                       db $01,$18,$FF,$01,$18,$FF,$01,$18   ;018F76|        |      ;
                       db $FE                               ;018F7E|        |      ;
 
         DATA8_018F7F: db $01,$18,$FF,$01,$18,$FF,$01,$18   ;018F7F|        |      ;
                       db $FF,$01,$18,$FF,$01,$0A,$00,$04   ;018F87|        |      ;
                       db $01,$0A,$FF,$01,$0A,$00,$04,$01   ;018F8F|        |      ;
                       db $0A,$FF,$01,$18,$FF,$01,$18,$FF   ;018F97|        |      ;
                       db $01,$18,$FF,$01,$18,$FE           ;018F9F|        |      ;
 
         DATA8_018FA5: db $01,$18,$FF,$01,$18,$FF,$01,$18   ;018FA5|        |      ;
                       db $FF,$01,$09,$00,$06,$01,$09,$FF   ;018FAD|        |      ;
                       db $01,$09,$00,$01,$31,$01,$32,$02   ;018FB5|        |      ;
                       db $33,$01,$00,$01,$01,$09,$FF,$01   ;018FBD|        |      ;
                       db $09,$00,$01,$34,$01,$32,$02,$35   ;018FC5|        |      ;
                       db $01,$00,$01,$01,$09,$FF,$01,$09   ;018FCD|        |      ;
                       db $00,$06,$01,$09,$FF,$01,$18,$FF   ;018FD5|        |      ;
                       db $01,$18,$FF,$01,$18,$FE           ;018FDD|        |      ;
 
         DATA8_018FE3: db $01,$18,$FF,$01,$18,$FF,$01,$07   ;018FE3|        |      ;
                       db $00,$0A,$01,$07,$FF,$01,$07,$00   ;018FEB|        |      ;
                       db $01,$31,$01,$32,$06,$33,$01,$00   ;018FF3|        |      ;
                       db $01,$01,$07,$FF,$01,$07,$00,$01   ;018FFB|        |      ;
                       db $30,$01,$00,$06,$30,$01,$00,$01   ;019003|        |      ;
                       db $01,$07,$FF,$01,$07,$00,$01,$30   ;01900B|        |      ;
                       db $01,$00,$06,$30,$01,$00,$01,$01   ;019013|        |      ;
                       db $07,$FF,$01,$07,$00,$01,$34,$01   ;01901B|        |      ;
                       db $32,$06,$35,$01,$00,$01,$01,$07   ;019023|        |      ;
                       db $FF,$01,$07,$00,$0A,$01,$07,$FF   ;01902B|        |      ;
                       db $01,$18,$FF,$01,$18,$FE           ;019033|        |      ;
 
         DATA8_019039: db $01,$18,$FF,$01,$05,$00,$0E,$01   ;019039|        |      ;
                       db $05,$FF,$01,$05,$00,$01,$31,$01   ;019041|        |      ;
                       db $32,$0A,$33,$01,$00,$01,$01,$05   ;019049|        |      ;
                       db $FF,$01,$05,$00,$01,$30,$01,$00   ;019051|        |      ;
                       db $0A,$30,$01,$00,$01,$01,$05,$FF   ;019059|        |      ;
                       db $01,$05,$00,$01,$30,$01,$00,$0A   ;019061|        |      ;
                       db $30,$01,$00,$01,$01,$05,$FF,$01   ;019069|        |      ;
                       db $05,$00,$01,$30,$01,$00,$0A,$30   ;019071|        |      ;
                       db $01,$00,$01,$01,$05,$FF,$01,$05   ;019079|        |      ;
                       db $00,$01,$30,$01,$00,$0A,$30,$01   ;019081|        |      ;
                       db $00,$01,$01,$05,$FF,$01,$05,$00   ;019089|        |      ;
                       db $01,$34,$01,$32,$0A,$35,$01,$00   ;019091|        |      ;
                       db $01,$01,$05,$FF,$01,$05,$00,$0E   ;019099|        |      ;
                       db $01,$05,$FF,$01,$18,$FE           ;0190A1|        |      ;
 
         DATA8_0190A7: db $01,$02,$00,$14,$01,$02,$FF,$01   ;0190A7|        |      ;
                       db $02,$00,$01,$31,$01,$32,$10,$33   ;0190AF|        |      ;
                       db $01,$00,$01,$01,$02,$FF,$01,$02   ;0190B7|        |      ;
                       db $00,$01,$30,$01,$00,$10,$30,$01   ;0190BF|        |      ;
                       db $00,$01,$01,$02,$FF,$01,$02,$00   ;0190C7|        |      ;
                       db $01,$30,$01,$00,$10,$30,$01,$00   ;0190CF|        |      ;
                       db $01,$01,$02,$FF,$01,$02,$00,$01   ;0190D7|        |      ;
                       db $30,$01,$00,$10,$30,$01,$00,$01   ;0190DF|        |      ;
                       db $01,$02,$FF,$01,$02,$00,$01,$30   ;0190E7|        |      ;
                       db $01,$00,$10,$30,$01,$00,$01,$01   ;0190EF|        |      ;
                       db $02,$FF,$01,$02,$00,$01,$30,$01   ;0190F7|        |      ;
                       db $00,$10,$30,$01,$00,$01,$01,$02   ;0190FF|        |      ;
                       db $FF,$01,$02,$00,$01,$30,$01,$00   ;019107|        |      ;
                       db $10,$30,$01,$00,$01,$01,$02,$FF   ;01910F|        |      ;
                       db $01,$02,$00,$01,$34,$01,$32,$10   ;019117|        |      ;
                       db $35,$01,$00,$01,$01,$02,$FF,$01   ;01911F|        |      ;
                       db $02,$00,$14,$01,$02,$FE           ;019127|        |      ;
 
         DATA8_01912D: db $31,$01,$32,$16,$33,$01,$FF,$30   ;01912D|        |      ;
                       db $01,$00,$16,$30,$01,$FF,$30,$01   ;019135|        |      ;
                       db $00,$16,$30,$01,$FF,$30,$01,$00   ;01913D|        |      ;
                       db $16,$30,$01,$FF,$30,$01,$00,$16   ;019145|        |      ;
                       db $30,$01,$FF,$30,$01,$00,$16,$30   ;01914D|        |      ;
                       db $01,$FF,$30,$01,$00,$16,$30,$01   ;019155|        |      ;
                       db $FF,$30,$01,$00,$16,$30,$01,$FF   ;01915D|        |      ;
                       db $30,$01,$00,$16,$30,$01,$FF,$34   ;019165|        |      ;
                       db $01,$32,$16,$35,$01,$FE           ;01916D|        |      ;
 
         DATA8_019173: db $84                               ;019173|        |      ;
 
         DATA8_019174: db $00,$84,$00,$84,$00,$84,$00,$84   ;019174|        |      ;
                       db $00,$84,$00,$84,$00               ;01917C|        |      ;
 
         DATA8_019181: db $20,$82,$E1,$A9,$00,$85,$FD,$85   ;019181|        |      ;
                       db $FC,$A9,$20,$85,$00,$20,$1C,$92   ;019189|        |      ;
                       db $A9,$24,$85,$00,$20,$1C,$92,$A9   ;019191|        |      ;
                       db $24,$85,$07,$20,$CF,$91,$A9,$20   ;019199|        |      ;
                       db $85,$07,$20,$CF,$91,$A9,$23,$85   ;0191A1|        |      ;
                       db $00,$20,$3C,$92,$A9,$27,$85,$00   ;0191A9|        |      ;
                       db $20,$3C,$92,$A5,$FF,$29,$67,$09   ;0191B1|        |      ;
                       db $04,$8D,$00,$20,$A9,$20,$85,$00   ;0191B9|        |      ;
                       db $20,$65,$92,$A9,$24,$85,$00,$20   ;0191C1|        |      ;
                       db $65,$92,$20,$66,$ED,$60,$AD,$02   ;0191C9|        |      ;
                       db $20,$A5,$07,$8D,$06,$20,$A9,$80   ;0191D1|        |      ;
                       db $85,$06,$8D,$06,$20,$A9,$18,$85   ;0191D9|        |      ;
                       db $08,$A9,$20,$85,$0D,$20,$FE,$91   ;0191E1|        |      ;
                       db $C6,$08,$F0,$10,$A5,$06,$18,$69   ;0191E9|        |      ;
                       db $20,$85,$06,$A5,$07,$69,$00,$85   ;0191F1|        |      ;
                       db $07,$4C,$E2,$91,$60,$20,$BD,$8E   ;0191F9|        |      ;
                       db $20,$FA,$8E,$8D,$07,$20,$E6,$0C   ;019201|        |      ;
                       db $C6,$0D,$F0,$0E,$A5,$0C,$C9,$04   ;019209|        |      ;
                       db $D0,$EE,$E6,$0A,$A9,$00,$85,$0C   ;019211|        |      ;
                       db $F0,$E6,$60,$AD,$02,$20,$A5,$00   ;019219|        |      ;
                       db $8D,$06,$20,$A9,$00,$8D,$06,$20   ;019221|        |      ;
                       db $A2,$80,$A9,$00,$8D,$07,$20,$CA   ;019229|        |      ;
                       db $D0,$FA,$60,$00,$00,$01,$00,$00   ;019231|        |      ;
                       db $00,$00,$01                       ;019239|        |      ;
                       LDA.W $2002                          ;01923C|AD0220  |012002;
                       LDA.B $00                            ;01923F|A500    |000000;
                       STA.W $2006                          ;019241|8D0620  |012006;
                       LDA.B #$C8                           ;019244|A9C8    |      ;
                       STA.W $2006                          ;019246|8D0620  |012006;
                       LDA.B #$00                           ;019249|A900    |      ;
                       STA.B $07                            ;01924B|8507    |000007;
 
          CODE_01924D: JSR.W DATA8_018F3C                   ;01924D|203C8F  |018F3C;
                       LDA.B $07                            ;019250|A507    |000007;
                       STA.B $02                            ;019252|8502    |000002;
                       INC.B $02                            ;019254|E602    |000002;
                       JSR.W DATA8_0193FF                   ;019256|20FF93  |0193FF;
                       STA.W $2007                          ;019259|8D0720  |012007;
                       INC.B $07                            ;01925C|E607    |000007;
                       LDA.B $07                            ;01925E|A507    |000007;
                       CMP.B #$38                           ;019260|C938    |      ;
                       BNE CODE_01924D                      ;019262|D0E9    |01924D;
                       RTS                                  ;019264|60      |      ;
 
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
 
 
getHelperScreenUpdatesIndex: db $00,$00,$13,$00,$00,$00,$00,$2C   ;019296|        |      ;
 
getHelperScreenUpdatesData: dw $4202                             ;01929E|        |      ;
                       db $06,$02,$43,$06,$02,$9C,$04,$02   ;0192A0|        |      ;
                       db $9D,$04,$02,$9E,$04,$02,$9F,$04   ;0192A8|        |      ;
                       db $FE                               ;0192B0|        |      ;
 
getHelperSymphaUpdates: dw $8402                             ;0192B1|        |      ; get sympha Screen
                       db $02,$02,$85,$02,$02,$4E,$04,$02   ;0192B3|        |      ;
                       db $4F,$04,$02,$9C,$02,$02,$9D,$02   ;0192BB|        |      ;
                       db $02,$9E,$02,$02,$9F,$02,$FE,$02   ;0192C3|        |      ;
                       db $80,$04,$02,$81,$04,$02,$C2,$02   ;0192CB|        |      ;
                       db $02,$C3,$02,$02,$5E,$06,$FE       ;0192D3|        |      ;
 
          CODE_0192DA: LDY.W $07F3                          ;0192DA|ACF307  |0107F3;
                       LDA.W DATA8_019415,Y                 ;0192DD|B91594  |019415;
                       STA.B $06                            ;0192E0|8506    |000006;
                       LDA.W $07F3                          ;0192E2|ADF307  |0107F3;
                       ASL A                                ;0192E5|0A      |      ;
                       TAY                                  ;0192E6|A8      |      ;
                       LDA.W DATA8_019423,Y                 ;0192E7|B92394  |019423;
                       STA.B r_index                        ;0192EA|8510    |000010;
                       LDA.W DATA8_019424,Y                 ;0192EC|B92494  |019424;
                       STA.B r_collisionPointYinScreen      ;0192EF|8511    |000011;
                       LDY.W $07F3                          ;0192F1|ACF307  |0107F3;
                       LDA.W DATA8_01941C,Y                 ;0192F4|B91C94  |01941C;
                       STA.B r_temp_Xpos                    ;0192F7|850A    |00000A;
                       LDY.B #$00                           ;0192F9|A000    |      ;
                       LDX.B r_sceneDrawQueue               ;0192FB|A61D    |00001D;
 
          CODE_0192FD: LDA.B r_temp_Xpos                    ;0192FD|A50A    |00000A;
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
                       STA.B r_pointerQueue                 ;019315|8508    |000008;
                       LDA.B #$0A                           ;019317|A90A    |      ;
                       JSR.W CODE_018A21                    ;019319|20218A  |018A21;
                       LDA.B $09                            ;01931C|A509    |000009;
                       JSR.W CODE_018A21                    ;01931E|20218A  |018A21;
                       LDA.B r_pointerQueue                 ;019321|A508    |000008;
                       JSR.W CODE_018A21                    ;019323|20218A  |018A21;
                       LDA.B $06                            ;019326|A506    |000006;
                       JSR.W CODE_018A21                    ;019328|20218A  |018A21;
                       STX.B r_15                           ;01932B|8615    |000015;
                       LDA.B r_temp_Xpos                    ;01932D|A50A    |00000A;
                       STA.B $0B                            ;01932F|850B    |00000B;
 
          CODE_019331: LDA.B (r_index),Y                    ;019331|B110    |000010;
                       CMP.B #$FE                           ;019333|C9FE    |      ;
                       BNE CODE_01933A                      ;019335|D003    |01933A;
                       JMP.W CODE_0193D3                    ;019337|4CD393  |0193D3;
 
 
          CODE_01933A: CMP.B #$FF                           ;01933A|C9FF    |      ;
                       BEQ CODE_01937D                      ;01933C|F03F    |01937D;
                       STA.B r_collisionPointXvalDiv32      ;01933E|8512    |000012;
                       INY                                  ;019340|C8      |      ;
                       LDA.B (r_index),Y                    ;019341|B110    |000010;
                       STA.B $07                            ;019343|8507    |000007;
 
          CODE_019345: LDA.B $0B                            ;019345|A50B    |00000B;
                       AND.B #$01                           ;019347|2901    |      ;
                       BEQ CODE_019351                      ;019349|F006    |019351;
                       LDA.B #$F3                           ;01934B|A9F3    |      ;
                       STA.B r_collisionPointAbsoluteXRoom  ;01934D|8514    |000014;
                       BNE CODE_01935D                      ;01934F|D00C    |01935D;
 
          CODE_019351: JSR.W CODE_0193D6                    ;019351|20D693  |0193D6;
                       LDA.B r_coreLoadingFuncAddr          ;019354|A516    |000016;
                       STA.W $0300,X                        ;019356|9D0003  |010300;
                       LDA.B #$FC                           ;019359|A9FC    |      ;
                       STA.B r_collisionPointAbsoluteXRoom  ;01935B|8514    |000014;
 
          CODE_01935D: LDA.B r_collisionPointXvalDiv32      ;01935D|A512    |000012;
                       BEQ CODE_019364                      ;01935F|F003    |019364;
                       JMP.W CODE_01936C                    ;019361|4C6C93  |01936C;
 
 
          CODE_019364: LDA.W $0300,X                        ;019364|BD0003  |010300;
                       AND.B r_collisionPointAbsoluteXRoom  ;019367|2514    |000014;
                       STA.W $0300,X                        ;019369|9D0003  |010300;
 
          CODE_01936C: LDA.B $0B                            ;01936C|A50B    |00000B;
                       AND.B #$01                           ;01936E|2901    |      ;
                       BEQ CODE_019373                      ;019370|F001    |019373;
                       INX                                  ;019372|E8      |      ;
 
          CODE_019373: INC.B $0B                            ;019373|E60B    |00000B;
                       DEC.B $07                            ;019375|C607    |000007;
                       BNE CODE_019345                      ;019377|D0CC    |019345;
                       INY                                  ;019379|C8      |      ;
                       JMP.W CODE_019331                    ;01937A|4C3193  |019331;
 
 
          CODE_01937D: INY                                  ;01937D|C8      |      ;
                       LDA.B r_temp_Xpos                    ;01937E|A50A    |00000A;
                       CLC                                  ;019380|18      |      ;
                       ADC.B #$10                           ;019381|6910    |      ;
                       STA.B r_temp_Xpos                    ;019383|850A    |00000A;
                       LDX.B r_15                           ;019385|A615    |000015;
 
          CODE_019387: LDA.B (r_index),Y                    ;019387|B110    |000010;
                       CMP.B #$FE                           ;019389|C9FE    |      ;
                       BEQ CODE_0193D3                      ;01938B|F046    |0193D3;
                       CMP.B #$FF                           ;01938D|C9FF    |      ;
                       BEQ CODE_0193C8                      ;01938F|F037    |0193C8;
                       STA.B r_collisionPointXvalDiv32      ;019391|8512    |000012;
                       INY                                  ;019393|C8      |      ;
                       LDA.B (r_index),Y                    ;019394|B110    |000010;
                       STA.B $07                            ;019396|8507    |000007;
 
          CODE_019398: LDA.B $0B                            ;019398|A50B    |00000B;
                       AND.B #$01                           ;01939A|2901    |      ;
                       BEQ CODE_0193A4                      ;01939C|F006    |0193A4;
                       LDA.B #$3F                           ;01939E|A93F    |      ;
                       STA.B r_collisionPointAbsoluteXRoom  ;0193A0|8514    |000014;
                       BNE CODE_0193A8                      ;0193A2|D004    |0193A8;
 
          CODE_0193A4: LDA.B #$CF                           ;0193A4|A9CF    |      ;
                       STA.B r_collisionPointAbsoluteXRoom  ;0193A6|8514    |000014;
 
          CODE_0193A8: LDA.B r_collisionPointXvalDiv32      ;0193A8|A512    |000012;
                       BEQ CODE_0193AF                      ;0193AA|F003    |0193AF;
                       JMP.W CODE_0193B7                    ;0193AC|4CB793  |0193B7;
 
 
          CODE_0193AF: LDA.W $0300,X                        ;0193AF|BD0003  |010300;
                       AND.B r_collisionPointAbsoluteXRoom  ;0193B2|2514    |000014;
                       STA.W $0300,X                        ;0193B4|9D0003  |010300;
 
          CODE_0193B7: LDA.B $0B                            ;0193B7|A50B    |00000B;
                       AND.B #$01                           ;0193B9|2901    |      ;
                       BEQ CODE_0193BE                      ;0193BB|F001    |0193BE;
                       INX                                  ;0193BD|E8      |      ;
 
          CODE_0193BE: INC.B $0B                            ;0193BE|E60B    |00000B;
                       DEC.B $07                            ;0193C0|C607    |000007;
                       BNE CODE_019398                      ;0193C2|D0D4    |019398;
                       INY                                  ;0193C4|C8      |      ;
                       JMP.W CODE_019387                    ;0193C5|4C8793  |019387;
 
 
          CODE_0193C8: INY                                  ;0193C8|C8      |      ;
                       LDA.B r_temp_Xpos                    ;0193C9|A50A    |00000A;
                       CLC                                  ;0193CB|18      |      ;
                       ADC.B #$10                           ;0193CC|6910    |      ;
                       STA.B r_temp_Xpos                    ;0193CE|850A    |00000A;
                       JMP.W CODE_0192FD                    ;0193D0|4CFD92  |0192FD;
 
 
          CODE_0193D3: STX.B r_sceneDrawQueue               ;0193D3|861D    |00001D;
                       RTS                                  ;0193D5|60      |      ;
 
 
          CODE_0193D6: STY.B r_tempCurrRoomIdx              ;0193D6|840E    |00000E;
                       LDA.B r_index                        ;0193D8|A510    |000010;
                       PHA                                  ;0193DA|48      |      ;
                       LDA.B r_collisionPointYinScreen      ;0193DB|A511    |000011;
                       PHA                                  ;0193DD|48      |      ;
                       JSR.W DATA8_018F3C                   ;0193DE|203C8F  |018F3C;
                       PLA                                  ;0193E1|68      |      ;
                       STA.B r_collisionPointYinScreen      ;0193E2|8511    |000011;
                       PLA                                  ;0193E4|68      |      ;
                       STA.B r_index                        ;0193E5|8510    |000010;
                       LDA.B $0B                            ;0193E7|A50B    |00000B;
                       SEC                                  ;0193E9|38      |      ;
                       SBC.B #$20                           ;0193EA|E920    |      ;
                       STA.B r_tempCurrGroup                ;0193EC|850C    |00000C;
                       AND.B #$E0                           ;0193EE|29E0    |      ;
                       LSR A                                ;0193F0|4A      |      ;
                       LSR A                                ;0193F1|4A      |      ;
                       STA.B r_roomSectionChrBanksDataOffset;0193F2|850F    |00000F;
                       LDA.B r_tempCurrGroup                ;0193F4|A50C    |00000C;
                       AND.B #$0F                           ;0193F6|290F    |      ;
                       LSR A                                ;0193F8|4A      |      ;
                       ORA.B r_roomSectionChrBanksDataOffset;0193F9|050F    |00000F;
                       STA.B $02                            ;0193FB|8502    |000002;
                       INC.B $02                            ;0193FD|E602    |000002;
 
         DATA8_0193FF: db $20                               ;0193FF|        |      ;
                       dw CODE_0FEB9C                       ;019400|        |0FEB9C;
                       LDA.B $02                            ;019402|A502    |000002;
                       STA.B $00                            ;019404|8500    |000000;
                       LDA.B r_stage                        ;019406|A532    |000032;
                       ASL A                                ;019408|0A      |      ;
                       TAY                                  ;019409|A8      |      ;
                       db $20                               ;01940A|        |      ;
                       dw CODE_0FEB76                       ;01940B|        |0FEB76;
                       db $20                               ;01940D|        |      ;
                       dw CODE_0FEB90                       ;01940E|        |0FEB90;
                       LDA.B r_coreLoadingFuncAddr          ;019410|A516    |000016;
                       LDY.B r_tempCurrRoomIdx              ;019412|A40E    |00000E;
                       RTS                                  ;019414|60      |      ;
 
 
         DATA8_019415: db $02,$02,$04,$06,$06,$06,$06       ;019415|        |      ;
 
         DATA8_01941C: db $46,$26,$24,$22,$22,$22,$22       ;01941C|        |      ;
 
         DATA8_019423: db $31                               ;019423|        |      ;
 
         DATA8_019424: db $94,$34,$94,$40,$94,$50,$94,$6B   ;019424|        |      ;
                       db $94,$86,$94,$A9,$94,$01,$04,$FE   ;01942C|        |      ;
                       db $01,$04,$FF,$01,$04,$FF,$01,$04   ;019434|        |      ;
                       db $FF,$01,$04,$FE,$01,$08,$FF,$01   ;01943C|        |      ;
                       db $08,$FF,$01,$03,$00,$02,$01,$03   ;019444|        |      ;
                       db $FF,$01,$08,$FE,$01,$0C,$FF,$01   ;01944C|        |      ;
                       db $04,$00,$04,$01,$04,$FF,$01,$04   ;019454|        |      ;
                       db $00,$04,$01,$04,$FF,$01,$04,$00   ;01945C|        |      ;
                       db $04,$01,$04,$FF,$01,$0C,$FE,$01   ;019464|        |      ;
                       db $0C,$FF,$01,$03,$00,$06,$01,$03   ;01946C|        |      ;
                       db $FF,$01,$03,$00,$06,$01,$03,$FF   ;019474|        |      ;
                       db $01,$03,$00,$06,$01,$03,$FF,$01   ;01947C|        |      ;
                       db $0C,$FE,$01,$01,$00,$0A,$01,$01   ;019484|        |      ;
                       db $FF,$01,$01,$00,$0A,$01,$01,$FF   ;01948C|        |      ;
                       db $01,$01,$00,$0A,$01,$01,$FF,$01   ;019494|        |      ;
                       db $01,$00,$0A,$01,$01,$FF,$01,$01   ;01949C|        |      ;
                       db $00,$0A,$01,$01,$FE,$00,$0C,$FF   ;0194A4|        |      ;
                       db $00,$0C,$FF,$00,$0C,$FF,$00,$0C   ;0194AC|        |      ;
                       db $FF,$00,$0C,$FE                   ;0194B4|        |      ;
                       LDA.W $07EC                          ;0194B8|ADEC07  |0107EC;
                       BNE CODE_0194BE                      ;0194BB|D001    |0194BE;
                       RTS                                  ;0194BD|60      |      ;
 
 
          CODE_0194BE: LDA.B #$00                           ;0194BE|A900    |      ;
                       STA.B $07                            ;0194C0|8507    |000007;
                       LDX.B #$01                           ;0194C2|A201    |      ;
 
          CODE_0194C4: LDA.W $054E,X                        ;0194C4|BD4E05  |01054E;
                       BEQ CODE_0194D8                      ;0194C7|F00F    |0194D8;
                       ASL A                                ;0194C9|0A      |      ;
                       TAY                                  ;0194CA|A8      |      ;
                       LDA.W PTR16_0194E1,Y                 ;0194CB|B9E194  |0194E1;
                       STA.B $00                            ;0194CE|8500    |000000;
                       LDA.W PTR16_0194E2,Y                 ;0194D0|B9E294  |0194E2;
                       STA.B $01                            ;0194D3|8501    |000001;
                       JSR.W CODE_0194DE                    ;0194D5|20DE94  |0194DE;
 
          CODE_0194D8: INX                                  ;0194D8|E8      |      ;
                       CPX.B #$0C                           ;0194D9|E00C    |      ;
                       BNE CODE_0194C4                      ;0194DB|D0E7    |0194C4;
                       RTS                                  ;0194DD|60      |      ;
 
 
          CODE_0194DE: JMP.W ($0000)                        ;0194DE|6C0000  |000000;
 
 
         PTR16_0194E1: dw CODE_0197EF                       ;0194E1|        |0197EF;
                       dw CODE_0194F1                       ;0194E3|        |0194F1;
                       dw CODE_019549                       ;0194E5|        |019549;
                       dw CODE_01951D                       ;0194E7|        |01951D;
                       dw CODE_019575                       ;0194E9|        |019575;
                       dw CODE_0195C4                       ;0194EB|        |0195C4;
                       dw DATA8_01969A                      ;0194ED|        |01969A;
                       dw CODE_01977B                       ;0194EF|        |01977B;
 
          CODE_0194F1: LDY.B #$00                           ;0194F1|A000    |      ;
                       JSR.W CODE_0195A9                    ;0194F3|20A995  |0195A9;
                       RTS                                  ;0194F6|60      |      ;
 
 
         PTR16_0194F7: dw CODE_0197EF                       ;0194F7|        |0197EF;
                       dw CODE_0197EF                       ;0194F9|        |0197EF;
                       dw CODE_0197EF                       ;0194FB|        |0197EF;
                       dw CODE_0197EF                       ;0194FD|        |0197EF;
                       dw CODE_019877                       ;0194FF|        |019877;
                       dw CODE_019D2E                       ;019501|        |019D2E;
                       dw CODE_019A3F                       ;019503|        |019A3F;
                       dw CODE_0197EF                       ;019505|        |0197EF;
                       dw CODE_019B0B                       ;019507|        |019B0B;
                       dw CODE_019B20                       ;019509|        |019B20;
                       dw CODE_019BED                       ;01950B|        |019BED;
                       dw CODE_019C20                       ;01950D|        |019C20;
                       dw CODE_019C8F                       ;01950F|        |019C8F;
                       dw CODE_0197EF                       ;019511|        |0197EF;
                       dw CODE_0197EF                       ;019513|        |0197EF;
                       dw CODE_019BAE                       ;019515|        |019BAE;
                       dw CODE_019BB9                       ;019517|        |019BB9;
                       dw CODE_019A2A                       ;019519|        |019A2A;
                       dw CODE_019C18                       ;01951B|        |019C18;
 
          CODE_01951D: LDY.B #$04                           ;01951D|A004    |      ;
                       JSR.W CODE_0195A9                    ;01951F|20A995  |0195A9;
                       RTS                                  ;019522|60      |      ;
 
 
         PTR16_019523: dw CODE_0197EF                       ;019523|        |0197EF;
                       dw CODE_019801                       ;019525|        |019801;
                       dw CODE_0197EA                       ;019527|        |0197EA;
                       dw CODE_0197EF                       ;019529|        |0197EF;
                       dw CODE_019877                       ;01952B|        |019877;
                       dw CODE_019D2E                       ;01952D|        |019D2E;
                       dw CODE_019A3F                       ;01952F|        |019A3F;
                       dw CODE_019BDA                       ;019531|        |019BDA;
                       dw CODE_019B0B                       ;019533|        |019B0B;
                       dw CODE_019B20                       ;019535|        |019B20;
                       dw CODE_019BED                       ;019537|        |019BED;
                       dw CODE_019C20                       ;019539|        |019C20;
                       dw CODE_019C8F                       ;01953B|        |019C8F;
                       dw CODE_0197EF                       ;01953D|        |0197EF;
                       dw CODE_0197EF                       ;01953F|        |0197EF;
                       dw CODE_0197EF                       ;019541|        |0197EF;
                       dw CODE_0197EF                       ;019543|        |0197EF;
                       dw CODE_019A2A                       ;019545|        |019A2A;
                       dw CODE_019C18                       ;019547|        |019C18;
 
          CODE_019549: LDY.B #$02                           ;019549|A002    |      ;
                       JSR.W CODE_0195A9                    ;01954B|20A995  |0195A9;
                       RTS                                  ;01954E|60      |      ;
 
 
         PTR16_01954F: dw CODE_0197EF                       ;01954F|        |0197EF;
                       dw CODE_0197EF                       ;019551|        |0197EF;
                       dw CODE_0198C2                       ;019553|        |0198C2;
                       dw CODE_0197EF                       ;019555|        |0197EF;
                       dw CODE_019877                       ;019557|        |019877;
                       dw CODE_019D2E                       ;019559|        |019D2E;
                       dw CODE_019A3F                       ;01955B|        |019A3F;
                       dw CODE_0197EF                       ;01955D|        |0197EF;
                       dw CODE_019B0B                       ;01955F|        |019B0B;
                       dw CODE_019B20                       ;019561|        |019B20;
                       dw CODE_019BED                       ;019563|        |019BED;
                       dw CODE_019C20                       ;019565|        |019C20;
                       dw CODE_019C8F                       ;019567|        |019C8F;
                       dw CODE_019BC4                       ;019569|        |019BC4;
                       dw CODE_0197EF                       ;01956B|        |0197EF;
                       dw CODE_0197EF                       ;01956D|        |0197EF;
                       dw CODE_0197EF                       ;01956F|        |0197EF;
                       dw CODE_019A2A                       ;019571|        |019A2A;
                       dw CODE_019C18                       ;019573|        |019C18;
 
          CODE_019575: LDY.B #$06                           ;019575|A006    |      ;
                       JSR.W CODE_0195A9                    ;019577|20A995  |0195A9;
                       RTS                                  ;01957A|60      |      ;
 
 
         PTR16_01957B: dw CODE_0197EF                       ;01957B|        |0197EF;
                       dw CODE_0197EF                       ;01957D|        |0197EF;
                       dw CODE_0197EF                       ;01957F|        |0197EF;
                       dw CODE_0199CD                       ;019581|        |0199CD;
                       dw CODE_019877                       ;019583|        |019877;
                       dw CODE_019D2E                       ;019585|        |019D2E;
                       dw CODE_019A3F                       ;019587|        |019A3F;
                       dw CODE_0197EF                       ;019589|        |0197EF;
                       dw CODE_019B0B                       ;01958B|        |019B0B;
                       dw CODE_019B20                       ;01958D|        |019B20;
                       dw CODE_019BED                       ;01958F|        |019BED;
                       dw CODE_019C20                       ;019591|        |019C20;
                       dw CODE_019C8F                       ;019593|        |019C8F;
                       dw CODE_0197EF                       ;019595|        |0197EF;
                       dw CODE_019BCF                       ;019597|        |019BCF;
                       dw CODE_0197EF                       ;019599|        |0197EF;
                       dw CODE_0197EF                       ;01959B|        |0197EF;
                       dw CODE_019A2A                       ;01959D|        |019A2A;
                       dw CODE_019C18                       ;01959F|        |019C18;
 
         PTR16_0195A1: dw PTR16_0194F7                      ;0195A1|        |0194F7;
                       dw PTR16_01954F                      ;0195A3|        |01954F;
                       dw PTR16_019523                      ;0195A5|        |019523;
                       dw PTR16_01957B                      ;0195A7|        |01957B;
 
          CODE_0195A9: LDA.W PTR16_0195A1,Y                 ;0195A9|B9A195  |0195A1;
                       STA.B $00                            ;0195AC|8500    |000000;
                       LDA.W PTR16_0195A2,Y                 ;0195AE|B9A295  |0195A2;
                       STA.B $01                            ;0195B1|8501    |000001;
                       LDA.W $07EF                          ;0195B3|ADEF07  |0107EF;
                       ASL A                                ;0195B6|0A      |      ;
                       TAY                                  ;0195B7|A8      |      ;
                       LDA.B ($00),Y                        ;0195B8|B100    |000000;
                       STA.B $02                            ;0195BA|8502    |000002;
                       INY                                  ;0195BC|C8      |      ;
                       LDA.B ($00),Y                        ;0195BD|B100    |000000;
                       STA.B $03                            ;0195BF|8503    |000003;
                       JMP.W ($0002)                        ;0195C1|6C0200  |000002;
 
 
          CODE_0195C4: LDY.W $061D,X                        ;0195C4|BC1D06  |01061D;
                       BNE CODE_019607                      ;0195C7|D03E    |019607;
                       LDA.B #$88                           ;0195C9|A988    |      ;
                       STA.W $0470,X                        ;0195CB|9D7004  |010470;
                       LDA.B #$00                           ;0195CE|A900    |      ;
                       STA.W $041C,X                        ;0195D0|9D1C04  |01041C;
                       LDA.W $0606,X                        ;0195D3|BD0606  |010606;
                       CLC                                  ;0195D6|18      |      ;
                       ADC.W $0633,X                        ;0195D7|7D3306  |010633;
                       AND.B #$0F                           ;0195DA|290F    |      ;
                       TAY                                  ;0195DC|A8      |      ;
                       LDA.W DATA8_01968A,Y                 ;0195DD|B98A96  |01968A;
                       STA.W $0438,X                        ;0195E0|9D3804  |010438;
                       INC.W $061D,X                        ;0195E3|FE1D06  |01061D;
                       LDA.B #$00                           ;0195E6|A900    |      ;
                       STA.W $04F2,X                        ;0195E8|9DF204  |0104F2;
                       STA.W $0509,X                        ;0195EB|9D0905  |010509;
                       STA.W $0520,X                        ;0195EE|9D2005  |010520;
                       STA.W $0537,X                        ;0195F1|9D3705  |010537;
                       LDA.B #$0C                           ;0195F4|A90C    |      ;
                       LDY.B #$09                           ;0195F6|A009    |      ;
                       JSR.W CODE_019DFD                    ;0195F8|20FD9D  |019DFD;
                       JSR.W CODE_019E0D                    ;0195FB|200D9E  |019E0D;
                       LDA.W $0606,X                        ;0195FE|BD0606  |010606;
                       ASL A                                ;019601|0A      |      ;
                       ASL A                                ;019602|0A      |      ;
                       STA.W $0645,X                        ;019603|9D4506  |010645;
                       RTS                                  ;019606|60      |      ;
 
 
          CODE_019607: DEY                                  ;019607|88      |      ;
                       BNE CODE_01961B                      ;019608|D011    |01961B;
                       DEC.W $0645,X                        ;01960A|DE4506  |010645;
                       LDA.W $0645,X                        ;01960D|BD4506  |010645;
                       BNE CODE_01961A                      ;019610|D008    |01961A;
                       INC.W $061D,X                        ;019612|FE1D06  |01061D;
                       LDA.B #$40                           ;019615|A940    |      ;
                       STA.W $0470,X                        ;019617|9D7004  |010470;
 
          CODE_01961A: RTS                                  ;01961A|60      |      ;
 
 
          CODE_01961B: DEY                                  ;01961B|88      |      ;
                       BNE CODE_019642                      ;01961C|D024    |019642;
                       LDA.W $0537,X                        ;01961E|BD3705  |010537;
                       CLC                                  ;019621|18      |      ;
                       ADC.B #$20                           ;019622|6920    |      ;
                       STA.W $0537,X                        ;019624|9D3705  |010537;
                       LDA.W $0520,X                        ;019627|BD2005  |010520;
                       ADC.B #$00                           ;01962A|6900    |      ;
                       STA.W $0520,X                        ;01962C|9D2005  |010520;
                       JSR.W CODE_019DD6                    ;01962F|20D69D  |019DD6;
                       LDA.W $041C,X                        ;019632|BD1C04  |01041C;
                       CMP.B #$B8                           ;019635|C9B8    |      ;
                       BCC CODE_019641                      ;019637|9008    |019641;
                       LDA.B #$11                           ;019639|A911    |      ;
                       db $20                               ;01963B|        |      ;
                       dw initFreezWaterEffect_01           ;01963C|        |0FE25F;
                       INC.W $061D,X                        ;01963E|FE1D06  |01061D;
 
          CODE_019641: RTS                                  ;019641|60      |      ;
 
 
          CODE_019642: DEY                                  ;019642|88      |      ;
                       BNE CODE_019653                      ;019643|D00E    |019653;
                       LDA.B #$0E                           ;019645|A90E    |      ;
                       LDY.B #$0A                           ;019647|A00A    |      ;
                       JSR.W CODE_019DFD                    ;019649|20FD9D  |019DFD;
                       JSR.W CODE_019E0D                    ;01964C|200D9E  |019E0D;
                       INC.W $061D,X                        ;01964F|FE1D06  |01061D;
                       RTS                                  ;019652|60      |      ;
 
 
          CODE_019653: DEY                                  ;019653|88      |      ;
                       BNE CODE_01965F                      ;019654|D009    |01965F;
                       JSR.W CODE_019E0D                    ;019656|200D9E  |019E0D;
                       BCC CODE_01965E                      ;019659|9003    |01965E;
                       INC.W $061D,X                        ;01965B|FE1D06  |01061D;
 
          CODE_01965E: RTS                                  ;01965E|60      |      ;
 
 
          CODE_01965F: LDA.B #$00                           ;01965F|A900    |      ;
                       STA.W $061D,X                        ;019661|9D1D06  |01061D;
                       INC.W $0633,X                        ;019664|FE3306  |010633;
                       LDA.W $0633,X                        ;019667|BD3306  |010633;
                       CMP.B #$02                           ;01966A|C902    |      ;
                       BEQ CODE_01966F                      ;01966C|F001    |01966F;
                       RTS                                  ;01966E|60      |      ;
 
 
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
 
 
         DATA8_01968A: db $10,$30,$20,$50,$60,$40,$30,$40   ;01968A|        |      ;
                       db $80,$50,$70,$A0,$90,$B0,$60,$C0   ;019692|        |      ;
 
         DATA8_01969A: db $BC,$1D,$06,$D0,$35,$A9,$3F,$20   ;01969A|        |      ;
                       db $5F,$E2,$A9,$0C,$8D,$EF,$07       ;0196A2|        |      ;
                       LDA.B #$7B                           ;0196A9|A97B    |      ;
                       STA.B r_CHR_BankSpr_0c00             ;0196AB|8549    |000049;
                       db $20                               ;0196AD|        |      ;
                       dw CODE_0FE33C                       ;0196AE|        |0FE33C;
                       LDA.B #$00                           ;0196B0|A900    |      ;
                       STA.W $0633,X                        ;0196B2|9D3306  |010633;
                       STA.W $0645,X                        ;0196B5|9D4506  |010645;
                       STA.W $05D8,X                        ;0196B8|9DD805  |0105D8;
                       LDA.B #$80                           ;0196BB|A980    |      ;
                       STA.W $0470,X                        ;0196BD|9D7004  |010470;
                       LDA.B #$78                           ;0196C0|A978    |      ;
                       STA.W $0438,X                        ;0196C2|9D3804  |010438;
                       LDA.B #$90                           ;0196C5|A990    |      ;
                       STA.W $041C,X                        ;0196C7|9D1C04  |01041C;
                       INC.W $061D,X                        ;0196CA|FE1D06  |01061D;
                       LDA.B #$0A                           ;0196CD|A90A    |      ;
                       LDY.B #$0C                           ;0196CF|A00C    |      ;
                       JMP.W CODE_019DFD                    ;0196D1|4CFD9D  |019DFD;
 
                       DEY                                  ;0196D4|88      |      ;
                       BNE CODE_019732                      ;0196D5|D05B    |019732;
                       LDA.W $05D8,X                        ;0196D7|BDD805  |0105D8;
                       BNE CODE_01972C                      ;0196DA|D050    |01972C;
                       LDA.W $0633,X                        ;0196DC|BD3306  |010633;
                       ASL A                                ;0196DF|0A      |      ;
                       TAY                                  ;0196E0|A8      |      ;
                       LDA.W DATA8_01976C,Y                 ;0196E1|B96C97  |01976C;
                       STA.W $05D8,X                        ;0196E4|9DD805  |0105D8;
                       INC.W $0633,X                        ;0196E7|FE3306  |010633;
                       LDA.W DATA8_01976B,Y                 ;0196EA|B96B97  |01976B;
                       BEQ CODE_019725                      ;0196ED|F036    |019725;
                       CMP.B #$01                           ;0196EF|C901    |      ;
                       BEQ CODE_01971E                      ;0196F1|F02B    |01971E;
                       INC.W $061D,X                        ;0196F3|FE1D06  |01061D;
                       LDA.B #$04                           ;0196F6|A904    |      ;
                       STA.W $05D8,X                        ;0196F8|9DD805  |0105D8;
                       LDA.B #$07                           ;0196FB|A907    |      ;
                       STA.B $01                            ;0196FD|8501    |000001;
 
          CODE_0196FF: LDA.B #$07                           ;0196FF|A907    |      ;
                       JSR.W CODE_019D02                    ;019701|20029D  |019D02;
                       BCC CODE_01971D                      ;019704|9017    |01971D;
                       LDA.B #$00                           ;019706|A900    |      ;
                       STA.W $061D,Y                        ;019708|991D06  |01061D;
                       LDA.B $01                            ;01970B|A501    |000001;
                       STA.W $0606,Y                        ;01970D|990606  |010606;
                       ASL A                                ;019710|0A      |      ;
                       ASL A                                ;019711|0A      |      ;
                       CLC                                  ;019712|18      |      ;
                       ADC.W $041C,Y                        ;019713|791C04  |01041C;
                       STA.W $041C,Y                        ;019716|991C04  |01041C;
                       DEC.B $01                            ;019719|C601    |000001;
                       BPL CODE_0196FF                      ;01971B|10E2    |0196FF;
 
          CODE_01971D: RTS                                  ;01971D|60      |      ;
 
 
          CODE_01971E: LDA.B #$00                           ;01971E|A900    |      ;
                       STA.W $0470,X                        ;019720|9D7004  |010470;
                       BEQ CODE_01972F                      ;019723|F00A    |01972F;
 
          CODE_019725: LDA.B #$80                           ;019725|A980    |      ;
                       STA.W $0470,X                        ;019727|9D7004  |010470;
                       BNE CODE_01972F                      ;01972A|D003    |01972F;
 
          CODE_01972C: DEC.W $05D8,X                        ;01972C|DED805  |0105D8;
 
          CODE_01972F: JMP.W CODE_019E0D                    ;01972F|4C0D9E  |019E0D;
 
 
          CODE_019732: DEY                                  ;019732|88      |      ;
                       BNE CODE_019755                      ;019733|D020    |019755;
                       LDA.W $05D8,X                        ;019735|BDD805  |0105D8;
                       BEQ CODE_019745                      ;019738|F00B    |019745;
                       DEC.W $05D8,X                        ;01973A|DED805  |0105D8;
                       LDA.B #$00                           ;01973D|A900    |      ;
                       STA.W $0470,X                        ;01973F|9D7004  |010470;
                       JMP.W CODE_019E0D                    ;019742|4C0D9E  |019E0D;
 
 
          CODE_019745: LDA.B #$80                           ;019745|A980    |      ;
                       STA.W $0470,X                        ;019747|9D7004  |010470;
                       INC.W $061D,X                        ;01974A|FE1D06  |01061D;
                       LDA.B #$17                           ;01974D|A917    |      ;
                       STA.B r_CHR_BankSpr_0800             ;01974F|8548    |000048;
                       db $20                               ;019751|        |      ;
                       dw CODE_0FE33C                       ;019752|        |0FE33C;
                       RTS                                  ;019754|60      |      ;
 
 
          CODE_019755: INC.W $07ED                          ;019755|EEED07  |0107ED;
                       LDA.B #$00                           ;019758|A900    |      ;
                       STA.W $07F0                          ;01975A|8DF007  |0107F0;
                       JSR.W CODE_01966F                    ;01975D|206F96  |01966F;
                       LDA.B #$02                           ;019760|A902    |      ;
                       STA.W $054E,X                        ;019762|9D4E05  |01054E;
                       LDA.B #$80                           ;019765|A980    |      ;
                       STA.W $0470,X                        ;019767|9D7004  |010470;
                       RTS                                  ;01976A|60      |      ;
 
 
         DATA8_01976B: db $00                               ;01976B|        |      ;
 
         DATA8_01976C: db $04,$01,$02,$00,$01,$01,$01,$00   ;01976C|        |      ;
                       db $01,$01,$01,$00,$08,$FF,$00       ;019774|        |      ;
 
          CODE_01977B: LDY.W $061D,X                        ;01977B|BC1D06  |01061D;
                       BNE CODE_0197AB                      ;01977E|D02B    |0197AB;
                       LDA.B #$18                           ;019780|A918    |      ;
                       STA.W $0400,X                        ;019782|9D0004  |010400;
                       LDA.B #$0E                           ;019785|A90E    |      ;
                       STA.W $048C,X                        ;019787|9D8C04  |01048C;
                       LDA.W $0606,X                        ;01978A|BD0606  |010606;
                       ASL A                                ;01978D|0A      |      ;
                       TAY                                  ;01978E|A8      |      ;
                       LDA.W DATA8_0197CA,Y                 ;01978F|B9CA97  |0197CA;
                       STA.W $0537,X                        ;019792|9D3705  |010537;
                       LDA.W DATA8_0197CB,Y                 ;019795|B9CB97  |0197CB;
                       STA.W $0520,X                        ;019798|9D2005  |010520;
                       LDA.W DATA8_0197DA,Y                 ;01979B|B9DA97  |0197DA;
                       STA.W $0509,X                        ;01979E|9D0905  |010509;
                       LDA.W DATA8_0197DB,Y                 ;0197A1|B9DB97  |0197DB;
                       STA.W $04F2,X                        ;0197A4|9DF204  |0104F2;
                       INC.W $061D,X                        ;0197A7|FE1D06  |01061D;
                       RTS                                  ;0197AA|60      |      ;
 
 
          CODE_0197AB: LDA.W $0537,X                        ;0197AB|BD3705  |010537;
                       CLC                                  ;0197AE|18      |      ;
                       ADC.B #$20                           ;0197AF|6920    |      ;
                       STA.W $0537,X                        ;0197B1|9D3705  |010537;
                       LDA.W $0520,X                        ;0197B4|BD2005  |010520;
                       ADC.B #$00                           ;0197B7|6900    |      ;
                       STA.W $0520,X                        ;0197B9|9D2005  |010520;
                       JSR.W CODE_019DD6                    ;0197BC|20D69D  |019DD6;
                       LDA.W $041C,X                        ;0197BF|BD1C04  |01041C;
                       CMP.B #$F8                           ;0197C2|C9F8    |      ;
                       BCC CODE_0197C9                      ;0197C4|9003    |0197C9;
                       JMP.W CODE_01966F                    ;0197C6|4C6F96  |01966F;
 
 
          CODE_0197C9: RTS                                  ;0197C9|60      |      ;
 
 
         DATA8_0197CA: db $00                               ;0197CA|        |      ;
 
         DATA8_0197CB: db $FF,$C0,$FE,$E0,$FE,$B0,$FE,$00   ;0197CB|        |      ;
                       db $FF,$C0,$FE,$E0,$FE,$B0,$FE       ;0197D3|        |      ;
 
         DATA8_0197DA: db $40                               ;0197DA|        |      ;
 
         DATA8_0197DB: db $00,$80,$FF,$60,$00,$60,$FF,$B0   ;0197DB|        |      ;
                       db $FF,$90,$00,$90,$FF,$B0,$00       ;0197E3|        |      ;
 
          CODE_0197EA: LDA.B #$01                           ;0197EA|A901    |      ;
                       STA.W $0454,X                        ;0197EC|9D5404  |010454;
 
          CODE_0197EF: LDA.B #$00                           ;0197EF|A900    |      ;
                       STA.W $0537,X                        ;0197F1|9D3705  |010537;
                       STA.W $0520,X                        ;0197F4|9D2005  |010520;
                       STA.W $04F2,X                        ;0197F7|9DF204  |0104F2;
                       STA.W $04F2,X                        ;0197FA|9DF204  |0104F2;
                       STA.W $061D,X                        ;0197FD|9D1D06  |01061D;
                       RTS                                  ;019800|60      |      ;
 
 
          CODE_019801: LDY.W $07F0                          ;019801|ACF007  |0107F0;
 
                       BNE CODE_019827                      ;019804|D021    |019827;
                       JSR.W CODE_019A25                    ;019806|20259A  |019A25;
                       LDA.B #$2A                           ;019809|A92A    |      ;
                       STA.B r_CHR_BankSpr_0400             ;01980B|8547    |000047;
                       LDA.B #$2B                           ;01980D|A92B    |      ;
                       STA.B r_CHR_BankSpr_0800             ;01980F|8548    |000048;
                       db $20                               ;019811|        |      ;
                       dw CODE_0FE33C                       ;019812|        |0FE33C;
                       INC.W $07F0                          ;019814|EEF007  |0107F0;
                       LDA.B #$A0                           ;019817|A9A0    |      ;
                       STA.W $061D,X                        ;019819|9D1D06  |01061D;
                       LDA.B #$0A                           ;01981C|A90A    |      ;
                       LDY.B #$00                           ;01981E|A000    |      ;
                       JSR.W CODE_019DFD                    ;019820|20FD9D  |019DFD;
                       JSR.W CODE_019E0D                    ;019823|200D9E  |019E0D;
                       RTS                                  ;019826|60      |      ;
 
 
          CODE_019827: DEY                                  ;019827|88      |      ;
                       BNE CODE_019866                      ;019828|D03C    |019866;
                       DEC.W $061D,X                        ;01982A|DE1D06  |01061D;
                       LDA.B #$00                           ;01982D|A900    |      ;
                       STA.W $0454,X                        ;01982F|9D5404  |010454;
                       LDA.W $061D,X                        ;019832|BD1D06  |01061D;
                       BEQ CODE_019853                      ;019835|F01C    |019853;
                       LDA.W $061D,X                        ;019837|BD1D06  |01061D;
                       CMP.B #$20                           ;01983A|C920    |      ;
                       BCC CODE_01984B                      ;01983C|900D    |01984B;
                       BNE CODE_019843                      ;01983E|D003    |019843;
                       JSR.W CODE_019D33                    ;019840|20339D  |019D33;
 
          CODE_019843: AND.B #$04                           ;019843|2904    |      ;
                       BEQ CODE_019850                      ;019845|F009    |019850;
                       LDA.B #$01                           ;019847|A901    |      ;
                       BNE CODE_01984D                      ;019849|D002    |01984D;
 
          CODE_01984B: LDA.B #$01                           ;01984B|A901    |      ;
 
          CODE_01984D: STA.W $0454,X                        ;01984D|9D5404  |010454;
 
          CODE_019850: JMP.W CODE_019E0D                    ;019850|4C0D9E  |019E0D;
 
 
          CODE_019853: LDA.B #$01                           ;019853|A901    |      ;
                       STA.W $0454,X                        ;019855|9D5404  |010454;
                       INC.W $07F0                          ;019858|EEF007  |0107F0;
                       LDA.B #$0A                           ;01985B|A90A    |      ;
                       LDY.B #$0B                           ;01985D|A00B    |      ;
                       JSR.W CODE_019DFD                    ;01985F|20FD9D  |019DFD;
                       JSR.W CODE_019E0D                    ;019862|200D9E  |019E0D;
                       RTS                                  ;019865|60      |      ;
 
 
          CODE_019866: INC.W $07ED                          ;019866|EEED07  |0107ED;
                       LDA.B #$00                           ;019869|A900    |      ;
                       STA.W $07EF                          ;01986B|8DEF07  |0107EF;
                       STA.W $07F0                          ;01986E|8DF007  |0107F0;
                       LDA.B #$00                           ;019871|A900    |      ;
                       STA.W $061D,X                        ;019873|9D1D06  |01061D;
                       RTS                                  ;019876|60      |      ;
 
 
          CODE_019877: LDY.B r_stage                        ;019877|A432    |000032;
                       LDA.W DATA8_0198B6,Y                 ;019879|B9B698  |0198B6;
                       LDY.W $054E,X                        ;01987C|BC4E05  |01054E;
                       DEY                                  ;01987F|88      |      ;
                       CLC                                  ;019880|18      |      ;
                       ADC.W DATA8_0198BE,Y                 ;019881|79BE98  |0198BE;
                       STA.B $00                            ;019884|8500    |000000;
                       LDA.B #$00                           ;019886|A900    |      ;
                       STA.W $0509,X                        ;019888|9D0905  |010509;
                       STA.W $04F2,X                        ;01988B|9DF204  |0104F2;
                       LDA.W $0537,X                        ;01988E|BD3705  |010537;
                       CLC                                  ;019891|18      |      ;
                       ADC.B #$20                           ;019892|6920    |      ;
 
                       STA.W $0537,X                        ;019894|9D3705  |010537;
                       LDA.W $0520,X                        ;019897|BD2005  |010520;
                       ADC.B #$00                           ;01989A|6900    |      ;
                       STA.W $0520,X                        ;01989C|9D2005  |010520;
                       JSR.W CODE_019DD6                    ;01989F|20D69D  |019DD6;
                       LDA.W $041C,X                        ;0198A2|BD1C04  |01041C;
                       CMP.B $00                            ;0198A5|C500    |000000;
                       BCC CODE_0198B5                      ;0198A7|900C    |0198B5;
                       LDA.B $00                            ;0198A9|A500    |000000;
                       STA.W $041C,X                        ;0198AB|9D1C04  |01041C;
                       INC.B $07                            ;0198AE|E607    |000007;
                       LDA.B $07                            ;0198B0|A507    |000007;
                       STA.W $07F0                          ;0198B2|8DF007  |0107F0;
 
          CODE_0198B5: RTS                                  ;0198B5|60      |      ;
 
 
         DATA8_0198B6: db $B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0   ;0198B6|        |      ;
 
         DATA8_0198BE: db $00,$00,$00,$F8                   ;0198BE|        |      ;
 
          CODE_0198C2: LDY.W $061D,X                        ;0198C2|BC1D06  |01061D;
                       BNE CODE_0198E3                      ;0198C5|D01C    |0198E3;
                       JSR.W CODE_019D2F                    ;0198C7|202F9D  |019D2F;
                       INC.W $061D,X                        ;0198CA|FE1D06  |01061D;
                       LDA.B #$78                           ;0198CD|A978    |      ;
                       STA.W $0438,X                        ;0198CF|9D3804  |010438;
                       LDA.B #$A8                           ;0198D2|A9A8    |      ;
                       STA.W $041C,X                        ;0198D4|9D1C04  |01041C;
                       LDA.B #$00                           ;0198D7|A900    |      ;
                       STA.W $0470,X                        ;0198D9|9D7004  |010470;
                       LDA.B #$40                           ;0198DC|A940    |      ;
                       LDY.B #$0D                           ;0198DE|A00D    |      ;
                       JMP.W r_5d8_end                      ;0198E0|4CC599  |0199C5;
 
 
          CODE_0198E3: DEY                                  ;0198E3|88      |      ;
                       BNE CODE_0198FE                      ;0198E4|D018    |0198FE;
                       LDA.W $05D8,X                        ;0198E6|BDD805  |0105D8;
                       BEQ CODE_0198F1                      ;0198E9|F006    |0198F1;
                       DEC.W $05D8,X                        ;0198EB|DED805  |0105D8;
                       JMP.W CODE_019E0D                    ;0198EE|4C0D9E  |019E0D;
 
 
          CODE_0198F1: INC.W $061D,X                        ;0198F1|FE1D06  |01061D;
                       JSR.W CODE_019A25                    ;0198F4|20259A  |019A25;
                       LDA.B #$40                           ;0198F7|A940    |      ;
                       LDY.B #$0E                           ;0198F9|A00E    |      ;
                       JMP.W r_5d8_end                      ;0198FB|4CC599  |0199C5;
 
 
          CODE_0198FE: DEY                                  ;0198FE|88      |      ;
                       BNE CODE_019916                      ;0198FF|D015    |019916;
                       LDA.W $05D8,X                        ;019901|BDD805  |0105D8;
                       BEQ CODE_01990C                      ;019904|F006    |01990C;
                       DEC.W $05D8,X                        ;019906|DED805  |0105D8;
                       JMP.W CODE_019E0D                    ;019909|4C0D9E  |019E0D;
 
 
          CODE_01990C: INC.W $061D,X                        ;01990C|FE1D06  |01061D;
                       LDA.B #$40                           ;01990F|A940    |      ;
                       LDY.B #$0F                           ;019911|A00F    |      ;
                       JMP.W r_5d8_end                      ;019913|4CC599  |0199C5;
 
 
          CODE_019916: DEY                                  ;019916|88      |      ;
                       BNE CODE_019931                      ;019917|D018    |019931;
                       LDA.W $05D8,X                        ;019919|BDD805  |0105D8;
                       BEQ CODE_019924                      ;01991C|F006    |019924;
                       DEC.W $05D8,X                        ;01991E|DED805  |0105D8;
                       JMP.W CODE_019E0D                    ;019921|4C0D9E  |019E0D;
 
 
          CODE_019924: JSR.W symphaScreenUpdateStatue       ;019924|20939D  |019D93;
                       INC.W $061D,X                        ;019927|FE1D06  |01061D;
                       LDA.B #$10                           ;01992A|A910    |      ;
                       LDY.B #$10                           ;01992C|A010    |      ;
                       JMP.W r_5d8_end                      ;01992E|4CC599  |0199C5;
 
 
          CODE_019931: DEY                                  ;019931|88      |      ;
                       BNE CODE_019979                      ;019932|D045    |019979;
                       LDA.W $05D8,X                        ;019934|BDD805  |0105D8;
                       BEQ CODE_01994E                      ;019937|F015    |01994E;
                       DEC.W $05D8,X                        ;019939|DED805  |0105D8;
                       JSR.W CODE_019E0D                    ;01993C|200D9E  |019E0D;
 
          CODE_01993F: LDA.B #$00                           ;01993F|A900    |      ;
                       STA.W $0520,X                        ;019941|9D2005  |010520;
                       STA.W $0537,X                        ;019944|9D3705  |010537;
                       STA.W $04F2,X                        ;019947|9DF204  |0104F2;
                       STA.W $0509,X                        ;01994A|9D0905  |010509;
                       RTS                                  ;01994D|60      |      ;
 
 
          CODE_01994E: LDA.W $0537,X                        ;01994E|BD3705  |010537;
                       CLC                                  ;019951|18      |      ;
                       ADC.B #$10                           ;019952|6910    |      ;
                       STA.W $0537,X                        ;019954|9D3705  |010537;
                       LDA.W $0520,X                        ;019957|BD2005  |010520;
                       ADC.B #$00                           ;01995A|6900    |      ;
                       STA.W $0520,X                        ;01995C|9D2005  |010520;
                       JSR.W CODE_019DD6                    ;01995F|20D69D  |019DD6;
                       LDA.W $041C,X                        ;019962|BD1C04  |01041C;
                       CMP.B #$B8                           ;019965|C9B8    |      ;
                       BCC CODE_019978                      ;019967|900F    |019978;
                       LDA.B #$B8                           ;019969|A9B8    |      ;
                       STA.W $041C,X                        ;01996B|9D1C04  |01041C;
                       INC.W $061D,X                        ;01996E|FE1D06  |01061D;
                       LDA.B #$10                           ;019971|A910    |      ;
                       LDY.B #$11                           ;019973|A011    |      ;
                       JMP.W r_5d8_end                      ;019975|4CC599  |0199C5;
 
 
          CODE_019978: RTS                                  ;019978|60      |      ;
 
 
          CODE_019979: DEY                                  ;019979|88      |      ;
                       BNE CODE_019996                      ;01997A|D01A    |019996;
                       LDA.W $05D8,X                        ;01997C|BDD805  |0105D8;
                       BEQ CODE_019987                      ;01997F|F006    |019987;
                       DEC.W $05D8,X                        ;019981|DED805  |0105D8;
                       JMP.W CODE_019E0D                    ;019984|4C0D9E  |019E0D;
 
 
          CODE_019987: LDA.B #$B0                           ;019987|A9B0    |      ;
                       STA.W $041C,X                        ;019989|9D1C04  |01041C;
                       INC.W $061D,X                        ;01998C|FE1D06  |01061D;
                       LDA.B #$04                           ;01998F|A904    |      ;
                       LDY.B #$13                           ;019991|A013    |      ;
                       JMP.W r_5d8_end                      ;019993|4CC599  |0199C5;
 
 
          CODE_019996: LDA.W $05D8,X                        ;019996|BDD805  |0105D8;
                       BEQ CODE_0199A1                      ;019999|F006    |0199A1;
                       DEC.W $05D8,X                        ;01999B|DED805  |0105D8;
                       JMP.W CODE_019E0D                    ;01999E|4C0D9E  |019E0D;
 
 
          CODE_0199A1: INC.W $07ED                          ;0199A1|EEED07  |0107ED;
                       LDA.B #$00                           ;0199A4|A900    |      ;
                       STA.W $07EF                          ;0199A6|8DEF07  |0107EF;
                       STA.W $07F0                          ;0199A9|8DF007  |0107F0;
                       LDA.B #$00                           ;0199AC|A900    |      ;
                       STA.W $061D,X                        ;0199AE|9D1D06  |01061D;
                       JSR.W CODE_01993F                    ;0199B1|203F99  |01993F;
                       LDA.B #$2A                           ;0199B4|A92A    |      ;
                       STA.B r_CHR_BankSpr_0400             ;0199B6|8547    |000047;
                       LDA.B #$2B                           ;0199B8|A92B    |      ;
                       STA.B r_CHR_BankSpr_0800             ;0199BA|8548    |000048;
                       db $20                               ;0199BC|        |      ;
                       dw CODE_0FE33C                       ;0199BD|        |0FE33C;
                       LDA.B #$03                           ;0199BF|A903    |      ;
                       STA.W $0606,X                        ;0199C1|9D0606  |010606;
                       RTS                                  ;0199C4|60      |      ;
 
 
            r_5d8_end: STA.W r_5d8,X                        ;0199C5|9DD805  |0005D8;
                       LDA.B #$14                           ;0199C8|A914    |      ;
                       JMP.W CODE_019DFD                    ;0199CA|4CFD9D  |019DFD;
 
 
          CODE_0199CD: LDY.W $07F0                          ;0199CD|ACF007  |0107F0;
                       BNE CODE_0199F0                      ;0199D0|D01E    |0199F0;
                       JSR.W CODE_019A25                    ;0199D2|20259A  |019A25;
                       LDA.B #$2A                           ;0199D5|A92A    |      ;
                       STA.B r_CHR_BankSpr_0400             ;0199D7|8547    |000047;
                       LDA.B #$2B                           ;0199D9|A92B    |      ;
                       STA.B r_CHR_BankSpr_0800             ;0199DB|8548    |000048;
                       db $20                               ;0199DD|        |      ;
                       dw CODE_0FE33C                       ;0199DE|        |0FE33C;
                       INC.W $07F0                          ;0199E0|EEF007  |0107F0;
                       LDA.B #$0A                           ;0199E3|A90A    |      ;
                       LDY.B #$18                           ;0199E5|A018    |      ;
                       JSR.W CODE_019DFD                    ;0199E7|20FD9D  |019DFD;
                       LDA.B #$A0                           ;0199EA|A9A0    |      ;
                       STA.W $061D,X                        ;0199EC|9D1D06  |01061D;
                       RTS                                  ;0199EF|60      |      ;
 
 
          CODE_0199F0: DEY                                  ;0199F0|88      |      ;
                       BNE CODE_0199FF                      ;0199F1|D00C    |0199FF;
                       DEC.W $061D,X                        ;0199F3|DE1D06  |01061D;
                       BNE CODE_0199FC                      ;0199F6|D004    |0199FC;
                       INC.W $07F0                          ;0199F8|EEF007  |0107F0;
 
                       RTS                                  ;0199FB|60      |      ;
 
 
          CODE_0199FC: JMP.W CODE_019E0D                    ;0199FC|4C0D9E  |019E0D;
 
 
          CODE_0199FF: DEY                                  ;0199FF|88      |      ;
                       BNE CODE_019A0D                      ;019A00|D00B    |019A0D;
                       LDA.B #$0A                           ;019A02|A90A    |      ;
                       LDY.B #$33                           ;019A04|A033    |      ;
                       JSR.W DATA16_019DB4                  ;019A06|20B49D  |019DB4;
                       INC.W $07F0                          ;019A09|EEF007  |0107F0;
                       RTS                                  ;019A0C|60      |      ;
 
 
          CODE_019A0D: DEY                                  ;019A0D|88      |      ;
                       BNE CODE_019A19                      ;019A0E|D009    |019A19;
                       JSR.W CODE_019DC4                    ;019A10|20C49D  |019DC4;
                       BCC CODE_019A18                      ;019A13|9003    |019A18;
                       INC.W $07F0                          ;019A15|EEF007  |0107F0;
 
          CODE_019A18: RTS                                  ;019A18|60      |      ;
 
 
          CODE_019A19: INC.W $07ED                          ;019A19|EEED07  |0107ED;
                       LDA.B #$00                           ;019A1C|A900    |      ;
                       STA.W $07EF                          ;019A1E|8DEF07  |0107EF;
                       STA.W $07F0                          ;019A21|8DF007  |0107F0;
                       RTS                                  ;019A24|60      |      ;
 
 
          CODE_019A25: LDA.B #$41                           ;019A25|A941    |      ;
                       db $4C                               ;019A27|        |      ;
 
                       dw initFreezWaterEffect_01           ;019A28|        |0FE25F;
 
          CODE_019A2A: LDA.W $0606,X                        ;019A2A|BD0606  |010606;
                       SEC                                  ;019A2D|38      |      ;
                       SBC.B #$01                           ;019A2E|E901    |      ;
                       STA.B $01                            ;019A30|8501    |000001;
                       LDY.B $01                            ;019A32|A401    |000001;
                       LDA.W DATA8_019A3C,Y                 ;019A34|B93C9A  |019A3C;
                       STA.B $00                            ;019A37|8500    |000000;
                       JMP.W targetCalcLoop                 ;019A39|4C4E9A  |019A4E;
 
 
         DATA8_019A3C: db $B0,$50,$C0                       ;019A3C|        |      ;
 
          CODE_019A3F: LDA.W $0606,X                        ;019A3F|BD0606  |010606;
                       SEC                                  ;019A42|38      |      ;
                       SBC.B #$01                           ;019A43|E901    |      ;
                       STA.B $01                            ;019A45|8501    |000001;
                       LDY.B $01                            ;019A47|A401    |000001;
                       LDA.W DATA8_019B00,Y                 ;019A49|B9009B  |019B00;
                       STA.B $00                            ;019A4C|8500    |000000;
 
       targetCalcLoop: LDA.W $061D,X                        ;019A4E|BD1D06  |01061D;
                       BNE CODE_019A70                      ;019A51|D01D    |019A70;
                       LDA.W $054E,X                        ;019A53|BD4E05  |01054E;
                       SEC                                  ;019A56|38      |      ;
                       SBC.B #$01                           ;019A57|E901    |      ;
                       TAY                                  ;019A59|A8      |      ;
                       LDA.W DATA8_019B07,Y                 ;019A5A|B9079B  |019B07;
                       STA.W $0454,X                        ;019A5D|9D5404  |010454;
                       LDA.W DATA8_019B03,Y                 ;019A60|B9039B  |019B03;
                       TAY                                  ;019A63|A8      |      ;
                       LDA.B #$0C                           ;019A64|A90C    |      ;
                       JSR.W CODE_019DFD                    ;019A66|20FD9D  |019DFD;
                       JSR.W CODE_019E0D                    ;019A69|200D9E  |019E0D;
                       INC.W $061D,X                        ;019A6C|FE1D06  |01061D;
                       RTS                                  ;019A6F|60      |      ;
 
 
          CODE_019A70: LDA.B #$01                           ;019A70|A901    |      ;
                       STA.W $04F2,X                        ;019A72|9DF204  |0104F2;
                       LDA.B #$00                           ;019A75|A900    |      ;
                       STA.W $0509,X                        ;019A77|9D0905  |010509;
                       LDA.B #$00                           ;019A7A|A900    |      ;
                       STA.W $04A8,X                        ;019A7C|9DA804  |0104A8;
                       LDA.W $0470,X                        ;019A7F|BD7004  |010470;
                       AND.B #$01                           ;019A82|2901    |      ;
                       BEQ CODE_019A91                      ;019A84|F00B    |019A91;
                       LDA.B #$80                           ;019A86|A980    |      ;
                       STA.B $00                            ;019A88|8500    |000000;
                       LDA.W $0438,X                        ;019A8A|BD3804  |010438;
                       BMI CODE_019AB1                      ;019A8D|3022    |019AB1;
                       BPL CODE_019A9B                      ;019A8F|100A    |019A9B;
 
          CODE_019A91: LDA.B $00                            ;019A91|A500    |000000;
                       SEC                                  ;019A93|38      |      ;
                       SBC.W $0438,X                        ;019A94|FD3804  |010438;
                       STA.B $00                            ;019A97|8500    |000000;
                       BCS CODE_019AB1                      ;019A99|B016    |019AB1;
 
          CODE_019A9B: EOR.B #$FF                           ;019A9B|49FF    |      ;
                       CLC                                  ;019A9D|18      |      ;
                       ADC.B #$01                           ;019A9E|6901    |      ;
                       STA.B $00                            ;019AA0|8500    |000000;
                       LDA.B #$FF                           ;019AA2|A9FF    |      ;
                       STA.W $04F2,X                        ;019AA4|9DF204  |0104F2;
                       LDA.B #$00                           ;019AA7|A900    |      ;
                       STA.W $0509,X                        ;019AA9|9D0905  |010509;
                       LDA.B #$01                           ;019AAC|A901    |      ;
                       STA.W $04A8,X                        ;019AAE|9DA804  |0104A8;
 
          CODE_019AB1: LDA.B $00                            ;019AB1|A500    |000000;
                       CMP.B #$03                           ;019AB3|C903    |      ;
                       BCS CODE_019AF2                      ;019AB5|B03B    |019AF2;
                       LDA.B #$00                           ;019AB7|A900    |      ;
                       STA.W $04F2,X                        ;019AB9|9DF204  |0104F2;
                       STA.W $0509,X                        ;019ABC|9D0905  |010509;
                       LDA.B #$0E                           ;019ABF|A90E    |      ;
                       LDY.B r_partner                      ;019AC1|A43A    |00003A;
                       CPY.B #$FF                           ;019AC3|C0FF    |      ;
                       BNE CODE_019AC9                      ;019AC5|D002    |019AC9;
                       LDA.B #$0A                           ;019AC7|A90A    |      ;
 
          CODE_019AC9: STA.B $00                            ;019AC9|8500    |000000;
                       LDA.B #$00                           ;019ACB|A900    |      ;
                       STA.W $04A8,X                        ;019ACD|9DA804  |0104A8;
                       LDA.W $0438,X                        ;019AD0|BD3804  |010438;
                       CMP.B #$80                           ;019AD3|C980    |      ;
                       BCC CODE_019ADC                      ;019AD5|9005    |019ADC;
                       LDA.B #$01                           ;019AD7|A901    |      ;
                       STA.W $04A8,X                        ;019AD9|9DA804  |0104A8;
 
          CODE_019ADC: LDY.W $0606,X                        ;019ADC|BC0606  |010606;
                       LDA.W DATA8_019AF8,Y                 ;019ADF|B9F89A  |019AF8;
                       ORA.W $07F3                          ;019AE2|0DF307  |0107F3;
                       STA.W $07F3                          ;019AE5|8DF307  |0107F3;
                       CMP.B $00                            ;019AE8|C500    |000000;
                       BNE CODE_019AF2                      ;019AEA|D006    |019AF2;
                       LDA.B #$00                           ;019AEC|A900    |      ;
                       STA.W $07EF                          ;019AEE|8DEF07  |0107EF;
                       RTS                                  ;019AF1|60      |      ;
 
 
          CODE_019AF2: JSR.W CODE_019DD6                    ;019AF2|20D69D  |019DD6;
                       JMP.W CODE_019E0D                    ;019AF5|4C0D9E  |019E0D;
 
 
         DATA8_019AF8: db $01,$02,$04,$08,$10,$20,$40,$80   ;019AF8|        |      ;
 
         DATA8_019B00: db $B0,$D0,$50                       ;019B00|        |      ;
 
         DATA8_019B03: db $01,$02,$03,$04                   ;019B03|        |      ;
 
         DATA8_019B07: db $00,$02,$01,$03                   ;019B07|        |      ;
 
          CODE_019B0B: LDA.W r_entity_YposTarget,X          ;019B0B|BD0606  |000606;
                       SEC                                  ;019B0E|38      |      ;
                       SBC.B #$01                           ;019B0F|E901    |      ;
                       STA.B $01                            ;019B11|8501    |000001;
                       LDY.B $01                            ;019B13|A401    |000001;
                       LDA.W DATA8_019B1D,Y                 ;019B15|B91D9B  |019B1D;
                       STA.B $00                            ;019B18|8500    |000000;
                       JMP.W targetCalcLoop                 ;019B1A|4C4E9A  |019A4E;
 
 
         DATA8_019B1D: db $90,$C0,$76                       ;019B1D|        |      ;
 
          CODE_019B20: LDA.W $07F0                          ;019B20|ADF007  |0107F0;
                       BNE CODE_019B59                      ;019B23|D034    |019B59;
                       LDA.B #$4C                           ;019B25|A94C    |      ;
                       db $20                               ;019B27|        |      ;
                       dw initFreezWaterEffect_01           ;019B28|        |0FE25F;
                       LDA.W $0606,X                        ;019B2A|BD0606  |010606;
                       CMP.B #$03                           ;019B2D|C903    |      ;
                       BNE CODE_019B97                      ;019B2F|D066    |019B97;
                       INC.W $07F0                          ;019B31|EEF007  |0107F0;
                       LDA.B #$00                           ;019B34|A900    |      ;
                       STA.W $0454,X                        ;019B36|9D5404  |010454;
                       LDA.B #$80                           ;019B39|A980    |      ;
                       STA.W $0438,X                        ;019B3B|9D3804  |010438;
                       LDA.W $04A8,X                        ;019B3E|BDA804  |0104A8;
                       EOR.B #$01                           ;019B41|4901    |      ;
                       STA.W $04A8,X                        ;019B43|9DA804  |0104A8;
                       LDA.W $054E,X                        ;019B46|BD4E05  |01054E;
                       SEC                                  ;019B49|38      |      ;
                       SBC.B #$01                           ;019B4A|E901    |      ;
                       TAY                                  ;019B4C|A8      |      ;
                       LDA.W DATA8_019BAA,Y                 ;019B4D|B9AA9B  |019BAA;
                       TAY                                  ;019B50|A8      |      ;
                       LDA.B #$0C                           ;019B51|A90C    |      ;
                       JSR.W CODE_019DFD                    ;019B53|20FD9D  |019DFD;
                       JMP.W CODE_019E0D                    ;019B56|4C0D9E  |019E0D;
 
 
          CODE_019B59: LDA.W $0606,X                        ;019B59|BD0606  |010606;
                       CMP.B #$03                           ;019B5C|C903    |      ;
                       BNE CODE_019B97                      ;019B5E|D037    |019B97;
                       LDA.W $07F0                          ;019B60|ADF007  |0107F0;
                       CMP.B #$80                           ;019B63|C980    |      ;
                       BCC CODE_019B91                      ;019B65|902A    |019B91;
                       LDA.W $054E,X                        ;019B67|BD4E05  |01054E;
                       SEC                                  ;019B6A|38      |      ;
                       SBC.B #$01                           ;019B6B|E901    |      ;
                       TAY                                  ;019B6D|A8      |      ;
                       LDA.W DATA8_019B07,Y                 ;019B6E|B9079B  |019B07;
                       STA.W $0454,X                        ;019B71|9D5404  |010454;
                       LDA.B #$76                           ;019B74|A976    |      ;
                       STA.W $0438,X                        ;019B76|9D3804  |010438;
                       LDA.B #$00                           ;019B79|A900    |      ;
                       STA.W $07EF                          ;019B7B|8DEF07  |0107EF;
                       STA.W $07F0                          ;019B7E|8DF007  |0107F0;
                       LDA.W $04A8,X                        ;019B81|BDA804  |0104A8;
                       EOR.B #$01                           ;019B84|4901    |      ;
                       STA.W $04A8,X                        ;019B86|9DA804  |0104A8;
                       LDA.B #$01                           ;019B89|A901    |      ;
                       STA.W $07F3                          ;019B8B|8DF307  |0107F3;
                       JMP.W CODE_019BFF                    ;019B8E|4CFF9B  |019BFF;
 
 
          CODE_019B91: INC.W $07F0                          ;019B91|EEF007  |0107F0;
                       JMP.W CODE_019E0D                    ;019B94|4C0D9E  |019E0D;
 
 
          CODE_019B97: CMP.B #$02                           ;019B97|C902    |      ;
                       BEQ CODE_019BA9                      ;019B99|F00E    |019BA9;
                       LDA.W $07F0                          ;019B9B|ADF007  |0107F0;
                       BPL CODE_019BA4                      ;019B9E|1004    |019BA4;
                       LDA.B #$00                           ;019BA0|A900    |      ;
                       BEQ CODE_019BA6                      ;019BA2|F002    |019BA6;
 
          CODE_019BA4: LDA.B #$88                           ;019BA4|A988    |      ;
 
          CODE_019BA6: STA.W $0470,X                        ;019BA6|9D7004  |010470;
 
          CODE_019BA9: RTS                                  ;019BA9|60      |      ;
 
 
         DATA8_019BAA: db $00,$06,$07,$08                   ;019BAA|        |      ;
 
          CODE_019BAE: LDA.W $07F0                          ;019BAE|ADF007  |0107F0;
                       BNE CODE_019BEA                      ;019BB1|D037    |019BEA;
                       LDY.B #$16                           ;019BB3|A016    |      ;
                       LDA.B #$0C                           ;019BB5|A90C    |      ;
                       BNE CODE_019BE3                      ;019BB7|D02A    |019BE3;
 
          CODE_019BB9: LDA.W $07F0                          ;019BB9|ADF007  |0107F0;
                       BNE CODE_019BEA                      ;019BBC|D02C    |019BEA;
                       LDY.B #$17                           ;019BBE|A017    |      ;
                       LDA.B #$0C                           ;019BC0|A90C    |      ;
                       BNE CODE_019BE3                      ;019BC2|D01F    |019BE3;
 
          CODE_019BC4: LDA.W $07F0                          ;019BC4|ADF007  |0107F0;
                       BNE CODE_019BEA                      ;019BC7|D021    |019BEA;
                       LDY.B #$14                           ;019BC9|A014    |      ;
                       LDA.B #$0C                           ;019BCB|A90C    |      ;
                       BNE CODE_019BE3                      ;019BCD|D014    |019BE3;
 
          CODE_019BCF: LDA.W $07F0                          ;019BCF|ADF007  |0107F0;
                       BNE CODE_019BEA                      ;019BD2|D016    |019BEA;
                       LDY.B #$15                           ;019BD4|A015    |      ;
                       LDA.B #$0C                           ;019BD6|A90C    |      ;
                       BNE CODE_019BE3                      ;019BD8|D009    |019BE3;
 
          CODE_019BDA: LDA.W $07F0                          ;019BDA|ADF007  |0107F0;
                       BNE CODE_019BEA                      ;019BDD|D00B    |019BEA;
                       LDY.B #$05                           ;019BDF|A005    |      ;
                       LDA.B #$0C                           ;019BE1|A90C    |      ;
 
          CODE_019BE3: JSR.W CODE_019DFD                    ;019BE3|20FD9D  |019DFD;
                       INC.W $07F0                          ;019BE6|EEF007  |0107F0;
                       RTS                                  ;019BE9|60      |      ;
 
 
          CODE_019BEA: JMP.W CODE_019E0D                    ;019BEA|4C0D9E  |019E0D;
 
 
          CODE_019BED: LDA.W $07F0                          ;019BED|ADF007  |0107F0;
                       BEQ CODE_019C12                      ;019BF0|F020    |019C12;
                       DEC.W $07F0                          ;019BF2|CEF007  |0107F0;
                       LDA.B #$00                           ;019BF5|A900    |      ;
                       STA.W $0470,X                        ;019BF7|9D7004  |010470;
                       LDA.B #$00                           ;019BFA|A900    |      ;
                       STA.W $061D,X                        ;019BFC|9D1D06  |01061D;
 
          CODE_019BFF: LDA.W $054E,X                        ;019BFF|BD4E05  |01054E;
                       SEC                                  ;019C02|38      |      ;
                       SBC.B #$01                           ;019C03|E901    |      ;
                       TAY                                  ;019C05|A8      |      ;
                       LDA.W DATA8_019B03,Y                 ;019C06|B9039B  |019B03;
                       TAY                                  ;019C09|A8      |      ;
                       LDA.B #$0C                           ;019C0A|A90C    |      ;
                       JSR.W CODE_019DFD                    ;019C0C|20FD9D  |019DFD;
                       JMP.W CODE_019E0D                    ;019C0F|4C0D9E  |019E0D;
 
 
          CODE_019C12: LDA.B #$01                           ;019C12|A901    |      ;
                       STA.W $07F3                          ;019C14|8DF307  |0107F3;
                       RTS                                  ;019C17|60      |      ;
 
 
          CODE_019C18: LDA.W $0606,X                        ;019C18|BD0606  |010606;
                       CMP.B #$03                           ;019C1B|C903    |      ;
                       BEQ CODE_019C20                      ;019C1D|F001    |019C20;
                       RTS                                  ;019C1F|60      |      ;
 
 
          CODE_019C20: LDA.B #$01                           ;019C20|A901    |      ;
                       STA.W $04F2,X                        ;019C22|9DF204  |0104F2;
                       LDA.B #$00                           ;019C25|A900    |      ;
                       STA.W $0509,X                        ;019C27|9D0905  |010509;
                       LDA.W $0606,X                        ;019C2A|BD0606  |010606;
                       CMP.B #$03                           ;019C2D|C903    |      ;
                       BNE CODE_019C3B                      ;019C2F|D00A    |019C3B;
                       LDA.B #$FF                           ;019C31|A9FF    |      ;
                       STA.W $04F2,X                        ;019C33|9DF204  |0104F2;
                       LDA.B #$00                           ;019C36|A900    |      ;
                       STA.W $0509,X                        ;019C38|9D0905  |010509;
 
          CODE_019C3B: JSR.W CODE_019DD6                    ;019C3B|20D69D  |019DD6;
                       LDA.W $0606,X                        ;019C3E|BD0606  |010606;
                       CMP.B #$03                           ;019C41|C903    |      ;
                       BNE CODE_019C53                      ;019C43|D00E    |019C53;
                       LDA.W $0438,X                        ;019C45|BD3804  |010438;
                       CMP.B #$04                           ;019C48|C904    |      ;
                       BCC CODE_019C80                      ;019C4A|9034    |019C80;
                       LDA.B #$01                           ;019C4C|A901    |      ;
                       STA.W $04A8,X                        ;019C4E|9DA804  |0104A8;
                       BNE CODE_019C5F                      ;019C51|D00C    |019C5F;
 
          CODE_019C53: LDA.W $0438,X                        ;019C53|BD3804  |010438;
                       CMP.B #$FC                           ;019C56|C9FC    |      ;
                       BCS CODE_019C80                      ;019C58|B026    |019C80;
                       LDA.B #$00                           ;019C5A|A900    |      ;
                       STA.W $04A8,X                        ;019C5C|9DA804  |0104A8;
 
          CODE_019C5F: LDA.W $061D,X                        ;019C5F|BD1D06  |01061D;
                       BNE CODE_019C7C                      ;019C62|D018    |019C7C;
                       INC.W $061D,X                        ;019C64|FE1D06  |01061D;
                       LDA.W $054E,X                        ;019C67|BD4E05  |01054E;
                       SEC                                  ;019C6A|38      |      ;
                       SBC.B #$01                           ;019C6B|E901    |      ;
                       TAY                                  ;019C6D|A8      |      ;
                       LDA.W DATA8_019B03,Y                 ;019C6E|B9039B  |019B03;
                       TAY                                  ;019C71|A8      |      ;
                       LDA.B #$0C                           ;019C72|A90C    |      ;
                       JSR.W CODE_019DFD                    ;019C74|20FD9D  |019DFD;
                       LDA.B #$40                           ;019C77|A940    |      ;
                       STA.W $0470,X                        ;019C79|9D7004  |010470;
 
          CODE_019C7C: JMP.W CODE_019E0D                    ;019C7C|4C0D9E  |019E0D;
 
                       RTS                                  ;019C7F|60      |      ;
 
 
          CODE_019C80: LDA.B #$00                           ;019C80|A900    |      ;
                       STA.W $054E,X                        ;019C82|9D4E05  |01054E;
                       STA.W $0400,X                        ;019C85|9D0004  |010400;
                       STA.W $048C,X                        ;019C88|9D8C04  |01048C;
                       STA.W $05AA,X                        ;019C8B|9DAA05  |0105AA;
                       RTS                                  ;019C8E|60      |      ;
 
 
          CODE_019C8F: LDA.W $054E                          ;019C8F|AD4E05  |01054E;
                       BEQ CODE_019C9C                      ;019C92|F008    |019C9C;
                       LDA.W $0606,X                        ;019C94|BD0606  |010606;
                       CMP.B #$02                           ;019C97|C902    |      ;
                       BEQ CODE_019CA4                      ;019C99|F009    |019CA4;
                       RTS                                  ;019C9B|60      |      ;
 
 
          CODE_019C9C: LDA.W $0606,X                        ;019C9C|BD0606  |010606;
                       CMP.B #$01                           ;019C9F|C901    |      ;
                       BEQ CODE_019CA4                      ;019CA1|F001    |019CA4;
                       RTS                                  ;019CA3|60      |      ;
 
 
          CODE_019CA4: LDA.W $061D,X                        ;019CA4|BD1D06  |01061D;
                       BNE CODE_019CBA                      ;019CA7|D011    |019CBA;
                       JSR.W CODE_019CC0                    ;019CA9|20C09C  |019CC0;
                       INC.W $061D,X                        ;019CAC|FE1D06  |01061D;
                       LDY.W $054E,X                        ;019CAF|BC4E05  |01054E;
                       DEY                                  ;019CB2|88      |      ;
                       TYA                                  ;019CB3|98      |      ;
                       ASL A                                ;019CB4|0A      |      ;
                       LDY.B #$12                           ;019CB5|A012    |      ;
                       JMP.W CODE_019DFD                    ;019CB7|4CFD9D  |019DFD;
 
 
          CODE_019CBA: JSR.W CODE_019CC0                    ;019CBA|20C09C  |019CC0;
                       JMP.W CODE_019E0D                    ;019CBD|4C0D9E  |019E0D;
 
 
          CODE_019CC0: LDA.B #$00                           ;019CC0|A900    |      ;
                       STA.B $00                            ;019CC2|8500    |000000;
                       LDA.B #$70                           ;019CC4|A970    |      ;
                       SEC                                  ;019CC6|38      |      ;
                       SBC.W $0438,X                        ;019CC7|FD3804  |010438;
                       BCS CODE_019CD3                      ;019CCA|B007    |019CD3;
                       EOR.B #$FF                           ;019CCC|49FF    |      ;
                       CLC                                  ;019CCE|18      |      ;
                       ADC.B #$01                           ;019CCF|6901    |      ;
                       INC.B $00                            ;019CD1|E600    |000000;
 
          CODE_019CD3: CMP.B #$20                           ;019CD3|C920    |      ;
                       BCS CODE_019CF4                      ;019CD5|B01D    |019CF4;
                       LDA.B #$FF                           ;019CD7|A9FF    |      ;
                       STA.W $04F2,X                        ;019CD9|9DF204  |0104F2;
                       LDA.B $00                            ;019CDC|A500    |000000;
                       BEQ CODE_019CE5                      ;019CDE|F005    |019CE5;
                       LDA.B #$01                           ;019CE0|A901    |      ;
                       STA.W $04F2,X                        ;019CE2|9DF204  |0104F2;
 
          CODE_019CE5: LDA.B #$00                           ;019CE5|A900    |      ;
                       STA.W $0509,X                        ;019CE7|9D0905  |010509;
                       STA.W $0520,X                        ;019CEA|9D2005  |010520;
                       STA.W $0537,X                        ;019CED|9D3705  |010537;
                       JSR.W CODE_019DD6                    ;019CF0|20D69D  |019DD6;
                       RTS                                  ;019CF3|60      |      ;
 
 
          CODE_019CF4: LDA.B $00                            ;019CF4|A500    |000000;
                       STA.W $04A8,X                        ;019CF6|9DA804  |0104A8;
                       LDA.B #$00                           ;019CF9|A900    |      ;
                       STA.W $061D,X                        ;019CFB|9D1D06  |01061D;
                       STA.W $07EF                          ;019CFE|8DEF07  |0107EF;
                       RTS                                  ;019D01|60      |      ;
 
 
          CODE_019D02: STA.B r_index                        ;019D02|8510    |000010;
                       STX.B r_coreLoadingFuncAddr          ;019D04|8616    |000016;
                       db $20                               ;019D06|        |      ;
                       dw CODE_0FFEB9                       ;019D07|        |0FFEB9;
                       BNE CODE_019D2A                      ;019D09|D01F    |019D2A;
                       JSR.W CODE_01966F                    ;019D0B|206F96  |01966F;
                       TXA                                  ;019D0E|8A      |      ;
                       TAY                                  ;019D0F|A8      |      ;
                       LDX.B r_coreLoadingFuncAddr          ;019D10|A616    |000016;
                       LDA.W $0438,X                        ;019D12|BD3804  |010438;
                       STA.W $0438,Y                        ;019D15|993804  |010438;
                       LDA.W $041C,X                        ;019D18|BD1C04  |01041C;
                       STA.W $041C,Y                        ;019D1B|991C04  |01041C;
                       LDA.B r_index                        ;019D1E|A510    |000010;
                       STA.W $054E,Y                        ;019D20|994E05  |01054E;
                       LDA.B #$00                           ;019D23|A900    |      ;
                       STA.W $0454,Y                        ;019D25|995404  |010454;
                       SEC                                  ;019D28|38      |      ;
                       RTS                                  ;019D29|60      |      ;
 
 
          CODE_019D2A: LDX.B r_coreLoadingFuncAddr          ;019D2A|A616    |000016;
                       CLC                                  ;019D2C|18      |      ;
                       RTS                                  ;019D2D|60      |      ;
 
 
          CODE_019D2E: RTS                                  ;019D2E|60      |      ;
 
 
          CODE_019D2F: LDY.B #$02                           ;019D2F|A002    |      ;
                       BNE CODE_019D35                      ;019D31|D002    |019D35;
 
          CODE_019D33: LDY.B #$00                           ;019D33|A000    |      ;
 
          CODE_019D35: LDA.W CODE_019D69,Y                  ;019D35|B9699D  |019D69;
                       STA.B $00                            ;019D38|8500    |000000;
                       LDA.W LOOSE_OP_019D6A,Y              ;019D3A|B96A9D  |019D6A;
                       STA.B $01                            ;019D3D|8501    |000001;
                       STX.B r_coreLoadingFuncAddr          ;019D3F|8616    |000016;
                       LDX.B r_sceneDrawQueue               ;019D41|A61D    |00001D;
                       LDY.B #$00                           ;019D43|A000    |      ;
                       LDA.B #$01                           ;019D45|A901    |      ;
                       STA.W $0300,X                        ;019D47|9D0003  |010300;
                       INX                                  ;019D4A|E8      |      ;
 
          CODE_019D4B: LDA.B ($00),Y                        ;019D4B|B100    |000000;
                       CMP.B #$FF                           ;019D4D|C9FF    |      ;
                       BEQ CODE_019D59                      ;019D4F|F008    |019D59;
                       STA.W $0300,X                        ;019D51|9D0003  |010300;
                       INY                                  ;019D54|C8      |      ;
                       INX                                  ;019D55|E8      |      ;
                       JMP.W CODE_019D4B                    ;019D56|4C4B9D  |019D4B;
 
 
          CODE_019D59: LDA.B #$FF                           ;019D59|A9FF    |      ;
                       STA.W $0300,X                        ;019D5B|9D0003  |010300;
                       INX                                  ;019D5E|E8      |      ;
                       STX.B r_sceneDrawQueue               ;019D5F|861D    |00001D;
                       LDA.B #$04                           ;019D61|A904    |      ;
                       db $20                               ;019D63|        |      ;
                       dw screenLoadRoutine                 ;019D64|        |0FECE9;
                       LDX.B r_coreLoadingFuncAddr          ;019D66|A616    |000016;
                       RTS                                  ;019D68|60      |      ;
 
 
          CODE_019D69: ADC.W CODE_01809D                    ;019D69|6D9D80  |01809D;
                       STA.W $3F10,X                        ;019D6C|9D103F  |013F10;
                       ORA.L $372608                        ;019D6F|0F082637|372608;
                       ORA.L $351508                        ;019D73|0F081535|351508;
                       ORA.L $201121                        ;019D77|0F211120|201121;
                       ORA.L $36150F                        ;019D7B|0F0F1536|36150F;
                       SBC.L $0F3F10,X                      ;019D7F|FF103F0F|0F3F10;
                       PHP                                  ;019D83|08      |      ;
                       ROL.B r_scoreMid                     ;019D84|2637    |000037;
                       ORA.L $351508                        ;019D86|0F081535|351508;
                       ORA.L $201121                        ;019D8A|0F211120|201121;
                       ORA.L $15360F                        ;019D8E|0F0F3615|15360F;
                       SBC.L $A61686,X                      ;019D92|FF8616A6|A61686;
                       ORA.W $00A0,X                        ;019D96|1DA000  |0100A0;
 
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
 
        DATA16_019DB4: dw $8C9D                             ;019DB4|        |      ;
                       db $04,$98                           ;019DB6|        |      ;
                       STA.W $05AA,X                        ;019DB8|9DAA05  |0105AA;
                       LDA.B #$00                           ;019DBB|A900    |      ;
                       STA.W $0593,X                        ;019DBD|9D9305  |010593;
                       db $20                               ;019DC0|        |      ;
                       dw CODE_0FEF7B                       ;019DC1|        |0FEF7B;
                       RTS                                  ;019DC3|60      |      ;
 
 
          CODE_019DC4: LDA.W $0593,X                        ;019DC4|BD9305  |010593;
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
 
 
          CODE_019DD6: CLC                                  ;019DD6|18      |      ;
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
 
 
          CODE_019DFD: STA.W $048C,X                        ;019DFD|9D8C04  |01048C;
                       TYA                                  ;019E00|98      |      ;
                       STA.W $05AA,X                        ;019E01|9DAA05  |0105AA;
                       LDA.B #$00                           ;019E04|A900    |      ;
                       STA.W $0593,X                        ;019E06|9D9305  |010593;
                       STA.W $057C,X                        ;019E09|9D7C05  |01057C;
                       RTS                                  ;019E0C|60      |      ;
 
 
          CODE_019E0D: LDA.W $057C,X                        ;019E0D|BD7C05  |01057C;
                       BNE CODE_019E40                      ;019E10|D02E    |019E40;
                       LDA.W $05AA,X                        ;019E12|BDAA05  |0105AA;
                       ASL A                                ;019E15|0A      |      ;
                       TAY                                  ;019E16|A8      |      ;
                       LDA.W PTR16_019E5B,Y                 ;019E17|B95B9E  |019E5B;
                       STA.B $00                            ;019E1A|8500    |000000;
                       LDA.W PTR16_019E5C,Y                 ;019E1C|B95C9E  |019E5C;
                       STA.B $01                            ;019E1F|8501    |000001;
                       LDA.W $0593,X                        ;019E21|BD9305  |010593;
                       CMP.B #$FF                           ;019E24|C9FF    |      ;
                       BEQ CODE_019E59                      ;019E26|F031    |019E59;
                       ASL A                                ;019E28|0A      |      ;
                       TAY                                  ;019E29|A8      |      ;
                       LDA.B ($00),Y                        ;019E2A|B100    |000000;
                       CMP.B #$FE                           ;019E2C|C9FE    |      ;
                       BEQ CODE_019E4F                      ;019E2E|F01F    |019E4F;
                       CMP.B #$FF                           ;019E30|C9FF    |      ;
                       BEQ CODE_019E45                      ;019E32|F011    |019E45;
                       STA.W $057C,X                        ;019E34|9D7C05  |01057C;
                       INY                                  ;019E37|C8      |      ;
                       LDA.B ($00),Y                        ;019E38|B100    |000000;
                       STA.W $0400,X                        ;019E3A|9D0004  |010400;
                       INC.W $0593,X                        ;019E3D|FE9305  |010593;
 
          CODE_019E40: DEC.W $057C,X                        ;019E40|DE7C05  |01057C;
                       CLC                                  ;019E43|18      |      ;
                       RTS                                  ;019E44|60      |      ;
 
 
          CODE_019E45: LDA.B #$00                           ;019E45|A900    |      ;
                       STA.W $0593,X                        ;019E47|9D9305  |010593;
                       STA.W $057C,X                        ;019E4A|9D7C05  |01057C;
                       CLC                                  ;019E4D|18      |      ;
                       RTS                                  ;019E4E|60      |      ;
 
 
          CODE_019E4F: LDA.B #$00                           ;019E4F|A900    |      ;
                       STA.W $057C,X                        ;019E51|9D7C05  |01057C;
                       LDA.B #$FF                           ;019E54|A9FF    |      ;
                       STA.W $0593,X                        ;019E56|9D9305  |010593;
 
          CODE_019E59: SEC                                  ;019E59|38      |      ;
                       RTS                                  ;019E5A|60      |      ;
 
 
         PTR16_019E5B: dw DATA8_019E8D                      ;019E5B|        |019E8D;
                       dw DATA8_019E96                      ;019E5D|        |019E96;
                       dw DATA8_019E9F                      ;019E5F|        |019E9F;
                       dw DATA8_019EA8                      ;019E61|        |019EA8;
                       dw DATA8_019EB1                      ;019E63|        |019EB1;
                       dw DATA8_019EBA                      ;019E65|        |019EBA;
                       dw DATA8_019EC3                      ;019E67|        |019EC3;
                       dw DATA8_019EC8                      ;019E69|        |019EC8;
                       dw DATA8_019ECD                      ;019E6B|        |019ECD;
                       dw DATA8_019ED2                      ;019E6D|        |019ED2;
                       dw DATA8_019ED5                      ;019E6F|        |019ED5;
                       dw DATA8_019EDA                      ;019E71|        |019EDA;
                       dw DATA8_019EDD                      ;019E73|        |019EDD;
                       dw DATA8_019EE0                      ;019E75|        |019EE0;
                       dw DATA8_019EE5                      ;019E77|        |019EE5;
                       dw DATA8_019EEC                      ;019E79|        |019EEC;
                       dw DATA8_019EF5                      ;019E7B|        |019EF5;
                       dw DATA8_019EF8                      ;019E7D|        |019EF8;
                       dw DATA8_019EFB                      ;019E7F|        |019EFB;
                       dw DATA8_019F04                      ;019E81|        |019F04;
                       dw DATA8_019F07                      ;019E83|        |019F07;
                       dw DATA8_019F10                      ;019E85|        |019F10;
                       dw DATA8_019F19                      ;019E87|        |019F19;
                       dw DATA8_019F20                      ;019E89|        |019F20;
                       dw DATA8_019F2C                      ;019E8B|        |019F2C;
 
         DATA8_019E8D: db $02,$4A,$02,$94,$02,$96,$02,$98   ;019E8D|        |      ;
                       db $FF                               ;019E95|        |      ;
 
         DATA8_019E96: db $08,$70,$08,$72,$08,$74,$08,$72   ;019E96|        |      ;
                       db $FF                               ;019E9E|        |      ;
 
         DATA8_019E9F: db $08,$94,$08,$96,$08,$98,$08,$96   ;019E9F|        |      ;
                       db $FF                               ;019EA7|        |      ;
 
         DATA8_019EA8: db $08,$7C,$08,$7E,$08,$80,$08,$7E   ;019EA8|        |      ;
                       db $FF                               ;019EB0|        |      ;
 
         DATA8_019EB1: db $08,$88,$08,$8A,$08,$8C,$08,$8A   ;019EB1|        |      ;
                       db $FF                               ;019EB9|        |      ;
 
         DATA8_019EBA: db $18,$7C,$08,$86,$10,$7C,$04,$86   ;019EBA|        |      ;
                       db $FF                               ;019EC2|        |      ;
 
         DATA8_019EC3: db $08,$9A,$08,$9C,$FF               ;019EC3|        |      ;
 
         DATA8_019EC8: db $08,$82,$08,$84,$FF               ;019EC8|        |      ;
 
         DATA8_019ECD: db $08,$8E,$08,$90,$FF               ;019ECD|        |      ;
 
         DATA8_019ED2: db $08,$6E,$FF                       ;019ED2|        |      ;
 
         DATA8_019ED5: db $08,$48,$08,$4A,$FE               ;019ED5|        |      ;
 
         DATA8_019EDA: db $08,$98,$FF                       ;019EDA|        |      ;
 
         DATA8_019EDD: db $08,$2E,$FF                       ;019EDD|        |      ;
 
         DATA8_019EE0: db $02,$02,$02,$04,$FF               ;019EE0|        |      ;
 
         DATA8_019EE5: db $02,$02,$02,$04,$02,$06,$FF       ;019EE5|        |      ;
 
         DATA8_019EEC: db $02,$02,$02,$04,$02,$06,$02,$08   ;019EEC|        |      ;
                       db $FF                               ;019EF4|        |      ;
 
         DATA8_019EF5: db $08,$0A,$FF                       ;019EF5|        |      ;
 
         DATA8_019EF8: db $08,$0C,$FF                       ;019EF8|        |      ;
 
         DATA8_019EFB: db $08,$02,$08,$04,$08,$06,$08,$08   ;019EFB|        |      ;
                       db $FF                               ;019F03|        |      ;
 
         DATA8_019F04: db $08,$0E,$FF                       ;019F04|        |      ;
 
         DATA8_019F07: db $18,$98,$08,$9E,$10,$98,$04,$9E   ;019F07|        |      ;
                       db $FF                               ;019F0F|        |      ;
 
         DATA8_019F10: db $18,$8C,$08,$92,$10,$8C,$04,$92   ;019F10|        |      ;
                       db $FF                               ;019F18|        |      ;
 
         DATA8_019F19: db $08,$74,$04,$76,$10,$74,$FF       ;019F19|        |      ;
 
         DATA8_019F20: db $08,$78,$04,$74,$08,$7A,$FF,$04   ;019F20|        |      ;
                       db $74,$10,$78,$FF                   ;019F28|        |      ;
 
         DATA8_019F2C: db $02,$88,$02,$8A,$FF               ;019F2C|        |      ;
 
           irq_dataLo: dw CODE_0FE13A                       ;019F31|        |0FE13A;
                       dw IRQ_routine_01                    ;019F33|        |01A0BC;
                       dw CODE_01A0EF                       ;019F35|        |01A0EF;
                       dw CODE_01A12F                       ;019F37|        |01A12F;
                       dw CODE_01A13C                       ;019F39|        |01A13C;
                       dw CODE_01A179                       ;019F3B|        |01A179;
                       dw CODE_01A190                       ;019F3D|        |01A190;
                       dw CODE_01A1BF                       ;019F3F|        |01A1BF;
                       dw CODE_01A1E8                       ;019F41|        |01A1E8;
                       dw CODE_01A274                       ;019F43|        |01A274;
                       dw CODE_01A2A1                       ;019F45|        |01A2A1;
                       dw CODE_01A179                       ;019F47|        |01A179;
                       dw CODE_01A190                       ;019F49|        |01A190;
                       dw CODE_01A21E                       ;019F4B|        |01A21E;
                       dw CODE_01A24B                       ;019F4D|        |01A24B;
                       dw CODE_01A2A1                       ;019F4F|        |01A2A1;
                       dw CODE_01A2DC                       ;019F51|        |01A2DC;
                       dw DATA8_01A2F2                      ;019F53|        |01A2F2;
                       dw CODE_01A2F8                       ;019F55|        |01A2F8;
                       dw CODE_01A345                       ;019F57|        |01A345;
                       dw CODE_01A39B                       ;019F59|        |01A39B;
                       dw DATA8_01A3EE                      ;019F5B|        |01A3EE;
                       dw CODE_01A05A                       ;019F5D|        |01A05A;
                       dw CODE_01A00D                       ;019F5F|        |01A00D;
                       dw CODE_01A023                       ;019F61|        |01A023;
                       dw CODE_019FD9                       ;019F63|        |019FD9;
                       dw CODE_01A3F4                       ;019F65|        |01A3F4;
                       dw CODE_01A41D                       ;019F67|        |01A41D;
                       dw CODE_01A434                       ;019F69|        |01A434;
                       dw DATA8_01A458                      ;019F6B|        |01A458;
                       dw CODE_01A488                       ;019F6D|        |01A488;
                       dw CODE_01A4C8                       ;019F6F|        |01A4C8;
                       dw CODE_01A4E6                       ;019F71|        |01A4E6;
                       dw CODE_01A488                       ;019F73|        |01A488;
                       dw CODE_01A501                       ;019F75|        |01A501;
                       dw CODE_019FD1                       ;019F77|        |019FD1;
                       dw CODE_01A345                       ;019F79|        |01A345;
                       dw CODE_01A39B                       ;019F7B|        |01A39B;
                       dw CODE_01A3DA                       ;019F7D|        |01A3DA;
                       dw CODE_01A3C1                       ;019F7F|        |01A3C1;
                       dw DATA8_01A3EE                      ;019F81|        |01A3EE;
                       dw CODE_01A578                       ;019F83|        |01A578;
                       dw CODE_01A5A0                       ;019F85|        |01A5A0;
                       dw CODE_01A5D2                       ;019F87|        |01A5D2;
                       dw CODE_01A5E5                       ;019F89|        |01A5E5;
                       dw CODE_01A16A                       ;019F8B|        |01A16A;
 
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
 
          CODE_019FD9: LDA.W $2002                          ;019FD9|AD0220  |012002;
                       LDX.W $078C                          ;019FDC|AE8C07  |01078C;
                       LDA.W $078D                          ;019FDF|AD8D07  |01078D;
                       STA.W $2006                          ;019FE2|8D0620  |012006;
                       STX.W $2006                          ;019FE5|8E0620  |012006;
                       LDA.W $078A                          ;019FE8|AD8A07  |01078A;
                       STA.W $2005                          ;019FEB|8D0520  |012005;
                       LDA.B #$00                           ;019FEE|A900    |      ;
                       STA.W $2005                          ;019FF0|8D0520  |012005;
                       LDA.W $078B                          ;019FF3|AD8B07  |01078B;
                       STA.W $2000                          ;019FF6|8D0020  |012000;
                       LDY.B #$7C                           ;019FF9|A07C    |      ;
                       STY.B r_CHR_BankBG_0400              ;019FFB|844B    |00004B;
                       INY                                  ;019FFD|C8      |      ;
                       STY.B r_CHR_BankBG_0800              ;019FFE|844C    |00004C;
                       db $20                               ;01A000|        |      ;
                       dw CODE_0FE36D                       ;01A001|        |0FE36D;
                       LDY.B #$75                           ;01A003|A075    |      ;
                       STY.B r_CHR_BankBG_0400              ;01A005|844B    |00004B;
                       INY                                  ;01A007|C8      |      ;
                       STY.B r_CHR_BankBG_0800              ;01A008|844C    |00004C;
                       db $4C                               ;01A00A|        |      ;
                       dw CODE_0FE13A                       ;01A00B|        |0FE13A;
 
          CODE_01A00D: JSR.W CODE_01A097                    ;01A00D|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A010|20CB9F  |019FCB;
                       db $20                               ;01A013|        |      ;
                       dw CODE_0FE36D                       ;01A014|        |0FE36D;
                       db $20                               ;01A016|        |      ;
                       dw CODE_0FE33C                       ;01A017|        |0FE33C;
                       LDA.B $89                            ;01A019|A589    |000089;
                       STA.W $5203                          ;01A01B|8D0352  |015203;
                       INC.B r_IRQFuncDrawIdx               ;01A01E|E66D    |00006D;
                       db $4C                               ;01A020|        |      ;
 
                       dw CODE_0FE13F                       ;01A021|        |0FE13F;
 
          CODE_01A023: LDY.B #$12                           ;01A023|A012    |      ;
 
          CODE_01A025: DEY                                  ;01A025|88      |      ;
                       BNE CODE_01A025                      ;01A026|D0FD    |01A025;
                       LDA.B r_scrollStartOffsetHi          ;01A028|A570    |000070;
                       AND.B #$01                           ;01A02A|2901    |      ;
                       ORA.B #$B0                           ;01A02C|09B0    |      ;
                       TAY                                  ;01A02E|A8      |      ;
                       LDX.B #$00                           ;01A02F|A200    |      ;
                       LDA.W $2002                          ;01A031|AD0220  |012002;
                       LDA.B #$29                           ;01A034|A929    |      ;
                       STA.W $2006                          ;01A036|8D0620  |012006;
                       STX.W $2006                          ;01A039|8E0620  |012006;
                       LDA.B r_scrollStartOffsetLo          ;01A03C|A56F    |00006F;
                       STA.W $2005                          ;01A03E|8D0520  |012005;
                       LDA.B #$00                           ;01A041|A900    |      ;
                       STA.W $2005                          ;01A043|8D0520  |012005;
                       STY.W $2000                          ;01A046|8C0020  |012000;
                       LDA.B #$A4                           ;01A049|A9A4    |      ;
                       STA.W $5105                          ;01A04B|8D0551  |015105;
                       LDA.B r_gameStateLoopCounter         ;01A04E|A51A    |00001A;
                       AND.B #$01                           ;01A050|2901    |      ;
                       BNE DATA8_01A057                     ;01A052|D003    |01A057;
                       db $20                               ;01A054|        |      ;
                       dw CODE_0FE313                       ;01A055|        |0FE313;
 
         DATA8_01A057: db $4C                               ;01A057|        |      ;
                       dw CODE_0FE13A                       ;01A058|        |0FE13A;
 
          CODE_01A05A: LDA.W $07ED                          ;01A05A|ADED07  |0107ED;
                       BEQ CODE_01A071                      ;01A05D|F012    |01A071;
                       TAX                                  ;01A05F|AA      |      ;
                       TAY                                  ;01A060|A8      |      ;
                       db $20                               ;01A061|        |      ;
                       dw CODE_0FE32D                       ;01A062|        |0FE32D;
 
          CODE_01A064: LDA.B #$0B                           ;01A064|A90B    |      ;
                       STA.B r_IRQFuncAddr                  ;01A066|8544    |000044;
 
          CODE_01A068: NOP                                  ;01A068|EA      |      ;
                       DEC.B r_IRQFuncAddr                  ;01A069|C644    |000044;
                       BNE CODE_01A068                      ;01A06B|D0FB    |01A068;
                       NOP                                  ;01A06D|EA      |      ;
                       DEY                                  ;01A06E|88      |      ;
                       BNE CODE_01A064                      ;01A06F|D0F3    |01A064;
 
          CODE_01A071: LDA.W $2002                          ;01A071|AD0220  |012002;
                       LDA.B #$20                           ;01A074|A920    |      ;
                       STA.W $2006                          ;01A076|8D0620  |012006;
                       LDA.B #$C0                           ;01A079|A9C0    |      ;
                       STA.W $2006                          ;01A07B|8D0620  |012006;
                       LDA.W $2002                          ;01A07E|AD0220  |012002;
                       LDA.B #$00                           ;01A081|A900    |      ;
                       STA.W $2005                          ;01A083|8D0520  |012005;
                       LDA.B r_sceneScrollOffsetHi          ;01A086|A557    |000057;
                       EOR.B r_075                          ;01A088|4575    |000075;
                       AND.B #$01                           ;01A08A|2901    |      ;
                       ORA.B r_PPUCtrl                      ;01A08C|05FF    |0000FF;
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
 
          CODE_01A121: LDA.W $2002                          ;01A121|AD0220  |012002;
                       LDA.B $D5                            ;01A124|A5D5    |0000D5;
                       STA.W $2005                          ;01A126|8D0520  |012005;
                       LDA.B #$00                           ;01A129|A900    |      ;
                       STA.W $2005                          ;01A12B|8D0520  |012005;
                       RTS                                  ;01A12E|60      |      ;
 
 
          CODE_01A12F: LDX.B #$01                           ;01A12F|A201    |      ;
                       db $20                               ;01A131|        |      ;
                       dw wait50cycles                      ;01A132|        |0FE001;
                       JSR.W CODE_01A121                    ;01A134|2021A1  |01A121;
                       INC.B r_IRQFuncDrawIdx               ;01A137|E66D    |00006D;
                       JMP.W CODE_01A144                    ;01A139|4C44A1  |01A144;
 
 
          CODE_01A13C: LDX.B #$01                           ;01A13C|A201    |      ;
                       db $20                               ;01A13E|        |      ;
                       dw wait50cycles                      ;01A13F|        |0FE001;
                       JSR.W CODE_01A121                    ;01A141|2021A1  |01A121;
 
          CODE_01A144: LDA.B #$00                           ;01A144|A900    |      ;
                       STA.W $5105                          ;01A146|8D0551  |015105;
                       LDA.B r_IRQScanlineCmpVal            ;01A149|A543    |000043;
                       STA.W $5203                          ;01A14B|8D0352  |015203;
                       DEC.W $0780                          ;01A14E|CE8007  |010780;
                       DEC.W $0780                          ;01A151|CE8007  |010780;
                       BEQ CODE_01A163                      ;01A154|F00D    |01A163;
                       LDA.B #$04                           ;01A156|A904    |      ;
                       CLC                                  ;01A158|18      |      ;
                       ADC.B r_IRQScanlineCmpVal            ;01A159|6543    |000043;
                       STA.B r_IRQScanlineCmpVal            ;01A15B|8543    |000043;
                       JSR.W CODE_01A0DD                    ;01A15D|20DDA0  |01A0DD;
                       db $4C                               ;01A160|        |      ;
 
                       dw CODE_0FE13F                       ;01A161|        |0FE13F;
 
          CODE_01A163: LDA.B #$2D                           ;01A163|A92D    |      ;
                       STA.B r_IRQFuncDrawIdx               ;01A165|856D    |00006D;
                       db $4C                               ;01A167|        |      ;
 
                       dw CODE_0FE13F                       ;01A168|        |0FE13F;
 
          CODE_01A16A: JSR.W CODE_01A097                    ;01A16A|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A16D|20CB9F  |019FCB;
                       STA.W $5105                          ;01A170|8D0551  |015105;
                       STA.W $5105                          ;01A173|8D0551  |015105;
                       db $4C                               ;01A176|        |      ;
                       dw CODE_0FE13A                       ;01A177|        |0FE13A;
 
          CODE_01A179: LDA.B $89                            ;01A179|A589    |000089;
                       STA.W $5203                          ;01A17B|8D0352  |015203;
                       LDA.B r_scrollStartOffsetLo          ;01A17E|A56F    |00006F;
                       AND.B #$07                           ;01A180|2907    |      ;
                       EOR.B #$07                           ;01A182|4907    |      ;
                       CLC                                  ;01A184|18      |      ;
                       ADC.B #$03                           ;01A185|6903    |      ;
                       ADC.B $89                            ;01A187|6589    |000089;
                       STA.B r_IRQScanlineCmpVal            ;01A189|8543    |000043;
                       INC.B r_IRQFuncDrawIdx               ;01A18B|E66D    |00006D;
                       db $4C                               ;01A18D|        |      ;
 
                       dw CODE_0FE13F                       ;01A18E|        |0FE13F;
 
          CODE_01A190: LDA.B r_IRQScanlineCmpVal            ;01A190|A543    |000043;
                       STA.W $5203                          ;01A192|8D0352  |015203;
                       LDX.B #$0C                           ;01A195|A20C    |      ;
                       db $20                               ;01A197|        |      ;
                       dw wait50cycles                      ;01A198|        |0FE001;
                       db $20                               ;01A19A|        |      ;
                       dw CODE_0FE32D                       ;01A19B|        |0FE32D;
                       LDA.B #$55                           ;01A19D|A955    |      ;
                       STA.W $5105                          ;01A19F|8D0551  |015105;
                       LDA.B r_scrollStartOffsetLo          ;01A1A2|A56F    |00006F;
                       AND.B #$07                           ;01A1A4|2907    |      ;
                       CLC                                  ;01A1A6|18      |      ;
                       ADC.B #$01                           ;01A1A7|6901    |      ;
                       ADC.B r_IRQScanlineCmpVal            ;01A1A9|6543    |000043;
                       STA.B r_IRQScanlineCmpVal            ;01A1AB|8543    |000043;
                       LDA.B #$00                           ;01A1AD|A900    |      ;
                       ASL.B r_scrollStartOffsetLo          ;01A1AF|066F    |00006F;
                       ROL A                                ;01A1B1|2A      |      ;
                       ASL.B r_scrollStartOffsetLo          ;01A1B2|066F    |00006F;
                       ROL A                                ;01A1B4|2A      |      ;
                       CLC                                  ;01A1B5|18      |      ;
                       ADC.B #$28                           ;01A1B6|6928    |      ;
                       STA.B r_scrollStartOffsetHi          ;01A1B8|8570    |000070;
                       INC.B r_IRQFuncDrawIdx               ;01A1BA|E66D    |00006D;
                       db $4C                               ;01A1BC|        |      ;
 
                       dw CODE_0FE13F                       ;01A1BD|        |0FE13F;
 
          CODE_01A1BF: LDA.B r_IRQScanlineCmpVal            ;01A1BF|A543    |000043;
                       STA.W $5203                          ;01A1C1|8D0352  |015203;
                       LDX.B #$02                           ;01A1C4|A202    |      ;
                       db $20                               ;01A1C6|        |      ;
                       dw wait50cycles                      ;01A1C7|        |0FE001;
                       LDA.W $2002                          ;01A1C9|AD0220  |012002;
                       LDX.B r_scrollStartOffsetLo          ;01A1CC|A66F    |00006F;
                       LDA.B r_scrollStartOffsetHi          ;01A1CE|A570    |000070;
                       STA.W $2006                          ;01A1D0|8D0620  |012006;
                       STX.W $2006                          ;01A1D3|8E0620  |012006;
                       LDA.B #$00                           ;01A1D6|A900    |      ;
                       STA.W $2005                          ;01A1D8|8D0520  |012005;
                       STA.W $2005                          ;01A1DB|8D0520  |012005;
                       LDA.B #$B0                           ;01A1DE|A9B0    |      ;
                       STA.W $2000                          ;01A1E0|8D0020  |012000;
                       INC.B r_IRQFuncDrawIdx               ;01A1E3|E66D    |00006D;
                       db $4C                               ;01A1E5|        |      ;
 
                       dw CODE_0FE13F                       ;01A1E6|        |0FE13F;
 
          CODE_01A1E8: LDX.B #$01                           ;01A1E8|A201    |      ;
                       db $20                               ;01A1EA|        |      ;
                       dw wait50cycles                      ;01A1EB|        |0FE001;
                       LDA.B r_CHR_BankBG_0400              ;01A1ED|A54B    |00004B;
                       LDY.B r_CHR_BankBG_0800              ;01A1EF|A44C    |00004C;
                       LDX.B r_CHR_BankBG_0000              ;01A1F1|A64A    |00004A;
                       STA.W $5129                          ;01A1F3|8D2951  |015129;
                       STY.W $512A                          ;01A1F6|8C2A51  |01512A;
                       STX.W $5128                          ;01A1F9|8E2851  |015128;
                       LDA.B r_CHR_BankBG_0c00              ;01A1FC|A54D    |00004D;
                       STA.W $512B                          ;01A1FE|8D2B51  |01512B;
 
                       STA.W $5127                          ;01A201|8D2751  |015127;
                       STX.W $5124                          ;01A204|8E2451  |015124;
                       STY.W $5126                          ;01A207|8C2651  |015126;
                       db $20                               ;01A20A|        |      ;
                       dw CODE_0FE342                       ;01A20B|        |0FE342;
                       LDA.B r_roomEffect                   ;01A20D|A57D    |00007D;
                       AND.B #$F0                           ;01A20F|29F0    |      ;
                       CMP.B #$40                           ;01A211|C940    |      ;
                       BEQ CODE_01A218                      ;01A213|F003    |01A218;
 
         DATA8_01A215: db $4C                               ;01A215|        |      ;
 
                       dw CODE_0FE13A                       ;01A216|        |0FE13A;
 
          CODE_01A218: JSR.W chrAnimRoutine                 ;01A218|208D9F  |019F8D;
                       JMP.W DATA8_01A215                   ;01A21B|4C15A2  |01A215;
 
 
          CODE_01A21E: LDA.B r_IRQScanlineCmpVal            ;01A21E|A543    |000043;
                       STA.W $5203                          ;01A220|8D0352  |015203;
                       LDX.B #$01                           ;01A223|A201    |      ;
                       db $20                               ;01A225|        |      ;
                       dw wait50cycles                      ;01A226|        |0FE001;
                       LDA.W $2002                          ;01A228|AD0220  |012002;
                       LDX.B r_scrollStartOffsetLo          ;01A22B|A66F    |00006F;
                       LDA.B r_scrollStartOffsetHi          ;01A22D|A570    |000070;
                       STA.W $2006                          ;01A22F|8D0620  |012006;
                       STX.W $2006                          ;01A232|8E0620  |012006;
                       LDA.B #$00                           ;01A235|A900    |      ;
                       STA.W $2005                          ;01A237|8D0520  |012005;
                       STA.W $2005                          ;01A23A|8D0520  |012005;
                       LDA.B #$B0                           ;01A23D|A9B0    |      ;
                       STA.W $2000                          ;01A23F|8D0020  |012000;
                       LDA.B $7C                            ;01A242|A57C    |00007C;
                       STA.B r_IRQScanlineCmpVal            ;01A244|8543    |000043;
                       INC.B r_IRQFuncDrawIdx               ;01A246|E66D    |00006D;
                       db $4C                               ;01A248|        |      ;
 
                       dw CODE_0FE13F                       ;01A249|        |0FE13F;
 
          CODE_01A24B: LDX.B #$01                           ;01A24B|A201    |      ;
                       db $20                               ;01A24D|        |      ;
                       dw wait50cycles                      ;01A24E|        |0FE001;
                       db $20                               ;01A250|        |      ;
                       dw CODE_0FE342                       ;01A251|        |0FE342;
                       db $20                               ;01A253|        |      ;
                       dw CODE_0FE35D                       ;01A254|        |0FE35D;
                       LDA.B r_IRQScanlineCmpVal            ;01A256|A543    |000043;
                       STA.W $5203                          ;01A258|8D0352  |015203;
                       JSR.W CODE_01A307                    ;01A25B|2007A3  |01A307;
                       LDA.W $0619                          ;01A25E|AD1906  |010619;
                       SEC                                  ;01A261|38      |      ;
                       SBC.W $0630                          ;01A262|ED3006  |010630;
                       STA.B $7C                            ;01A265|857C    |00007C;
                       LDA.W $0630                          ;01A267|AD3006  |010630;
                       EOR.B #$01                           ;01A26A|4901    |      ;
                       STA.W $0630                          ;01A26C|8D3006  |010630;
                       INC.B r_IRQFuncDrawIdx               ;01A26F|E66D    |00006D;
                       db $4C                               ;01A271|        |      ;
 
                       dw CODE_0FE13F                       ;01A272|        |0FE13F;
 
          CODE_01A274: JSR.W CODE_01A097                    ;01A274|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A277|20CB9F  |019FCB;
                       db $20                               ;01A27A|        |      ;
                       dw CODE_0FE36D                       ;01A27B|        |0FE36D;
                       LDA.B $89                            ;01A27D|A589    |000089;
                       STA.W $5203                          ;01A27F|8D0352  |015203;
                       JSR.W CODE_01A307                    ;01A282|2007A3  |01A307;
                       LDA.B r_IRQFuncIdx                   ;01A285|A53F    |00003F;
                       CMP.B #$09                           ;01A287|C909    |      ;
                       BNE CODE_01A294                      ;01A289|D009    |01A294;
                       LDA.W $0619                          ;01A28B|AD1906  |010619;
                       SEC                                  ;01A28E|38      |      ;
                       SBC.W $0630                          ;01A28F|ED3006  |010630;
                       STA.B r_scannlineTarget              ;01A292|8542    |000042;
 
          CODE_01A294: LDA.W $0630                          ;01A294|AD3006  |010630;
                       EOR.B #$01                           ;01A297|4901    |      ;
                       STA.W $0630                          ;01A299|8D3006  |010630;
                       INC.B r_IRQFuncDrawIdx               ;01A29C|E66D    |00006D;
                       db $4C                               ;01A29E|        |      ;
 
                       dw CODE_0FE13F                       ;01A29F|        |0FE13F;
 
          CODE_01A2A1: LDY.B #$05                           ;01A2A1|A005    |      ;
 
         DATA8_01A2A3: db $20                               ;01A2A3|        |      ;
                       dw CODE_0FE322                       ;01A2A4|        |0FE322;
                       db $20                               ;01A2A6|        |      ;
                       dw CODE_0FE005                       ;01A2A7|        |0FE005;
                       db $20                               ;01A2A9|        |      ;
                       dw CODE_0FE352                       ;01A2AA|        |0FE352;
                       db $20                               ;01A2AC|        |      ;
                       dw CODE_0FE005                       ;01A2AD|        |0FE005;
                       db $20                               ;01A2AF|        |      ;
                       dw CODE_0FE322                       ;01A2B0|        |0FE322;
                       db $20                               ;01A2B2|        |      ;
                       dw CODE_0FE005                       ;01A2B3|        |0FE005;
                       db $20                               ;01A2B5|        |      ;
                       dw CODE_0FE352                       ;01A2B6|        |0FE352;
                       db $20                               ;01A2B8|        |      ;
                       dw CODE_0FE005                       ;01A2B9|        |0FE005;
                       db $20                               ;01A2BB|        |      ;
                       dw CODE_0FE322                       ;01A2BC|        |0FE322;
                       db $20                               ;01A2BE|        |      ;
                       dw CODE_0FE005                       ;01A2BF|        |0FE005;
                       db $20                               ;01A2C1|        |      ;
                       dw CODE_0FE352                       ;01A2C2|        |0FE352;
                       db $20                               ;01A2C4|        |      ;
                       dw CODE_0FE005                       ;01A2C5|        |0FE005;
                       db $20                               ;01A2C7|        |      ;
                       dw CODE_0FE322                       ;01A2C8|        |0FE322;
                       db $20                               ;01A2CA|        |      ;
                       dw CODE_0FE005                       ;01A2CB|        |0FE005;
                       db $20                               ;01A2CD|        |      ;
                       dw CODE_0FE352                       ;01A2CE|        |0FE352;
                       LDX.B #$10                           ;01A2D0|A210    |      ;
 
          CODE_01A2D2: DEX                                  ;01A2D2|CA      |      ;
                       BNE CODE_01A2D2                      ;01A2D3|D0FD    |01A2D2;
                       NOP                                  ;01A2D5|EA      |      ;
                       DEY                                  ;01A2D6|88      |      ;
                       BNE DATA8_01A2A3                     ;01A2D7|D0CA    |01A2A3;
                       db $4C                               ;01A2D9|        |      ;
                       dw CODE_0FE13A                       ;01A2DA|        |0FE13A;
 
          CODE_01A2DC: JSR.W CODE_01A097                    ;01A2DC|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A2DF|20CB9F  |019FCB;
                       db $20                               ;01A2E2|        |      ;
                       dw CODE_0FE36D                       ;01A2E3|        |0FE36D;
                       db $20                               ;01A2E5|        |      ;
                       dw CODE_0FE352                       ;01A2E6|        |0FE352;
                       LDA.B $89                            ;01A2E8|A589    |000089;
                       STA.W $5203                          ;01A2EA|8D0352  |015203;
                       INC.B r_IRQFuncDrawIdx               ;01A2ED|E66D    |00006D;
                       db $4C                               ;01A2EF|        |      ;
 
                       dw CODE_0FE13F                       ;01A2F0|        |0FE13F;
 
         DATA8_01A2F2: db $20                               ;01A2F2|        |      ;
                       dw CODE_0FE322                       ;01A2F3|        |0FE322;
                       db $4C                               ;01A2F5|        |      ;
                       dw CODE_0FE13A                       ;01A2F6|        |0FE13A;
 
          CODE_01A2F8: JSR.W CODE_01A097                    ;01A2F8|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A2FB|20CB9F  |019FCB;
                       db $20                               ;01A2FE|        |      ;
                       dw CODE_0FE36D                       ;01A2FF|        |0FE36D;
                       db $20                               ;01A301|        |      ;
                       dw CODE_0FE352                       ;01A302|        |0FE352;
                       db $4C                               ;01A304|        |      ;
                       dw CODE_0FE13A                       ;01A305|        |0FE13A;
 
          CODE_01A307: LDA.B #$00                           ;01A307|A900    |      ;
                       STA.W $0470                          ;01A309|8D7004  |010470;
                       LDA.W $0505                          ;01A30C|AD0505  |010505;
                       BMI CODE_01A33E                      ;01A30F|302D    |01A33E;
                       LDA.W $0630                          ;01A311|AD3006  |010630;
                       BEQ CODE_01A32D                      ;01A314|F017    |01A32D;
                       LDA.W $05D4                          ;01A316|ADD405  |0105D4;
                       SEC                                  ;01A319|38      |      ;
                       SBC.W $0505                          ;01A31A|ED0505  |010505;
                       BCC CODE_01A327                      ;01A31D|9008    |01A327;
                       CMP.B #$08                           ;01A31F|C908    |      ;
                       BCC CODE_01A327                      ;01A321|9004    |01A327;
                       STA.W $0438                          ;01A323|8D3804  |010438;
                       RTS                                  ;01A326|60      |      ;
 
 
          CODE_01A327: LDA.B #$80                           ;01A327|A980    |      ;
                       STA.W $0470                          ;01A329|8D7004  |010470;
                       RTS                                  ;01A32C|60      |      ;
 
 
          CODE_01A32D: LDA.W $05D4                          ;01A32D|ADD405  |0105D4;
                       CLC                                  ;01A330|18      |      ;
                       ADC.W $0505                          ;01A331|6D0505  |010505;
                       BCS CODE_01A327                      ;01A334|B0F1    |01A327;
                       CMP.B #$F8                           ;01A336|C9F8    |      ;
                       BCS CODE_01A327                      ;01A338|B0ED    |01A327;
                       STA.W $0438                          ;01A33A|8D3804  |010438;
                       RTS                                  ;01A33D|60      |      ;
 
 
          CODE_01A33E: LDA.W $05D4                          ;01A33E|ADD405  |0105D4;
                       STA.W $0438                          ;01A341|8D3804  |010438;
                       RTS                                  ;01A344|60      |      ;
 
 
          CODE_01A345: JSR.W CODE_01A097                    ;01A345|2097A0  |01A097;
                       JSR.W CODE_019FCB                    ;01A348|20CB9F  |019FCB;
                       db $20                               ;01A34B|        |      ;
                       dw CODE_0FE36D                       ;01A34C|        |0FE36D;
                       LDA.B $89                            ;01A34E|A589    |000089;
                       STA.W $5203                          ;01A350|8D0352  |015203;
                       LDA.B r_roomEffect                   ;01A353|A57D    |00007D;
                       AND.B #$0F                           ;01A355|290F    |      ;
                       CMP.B #$02                           ;01A357|C902    |      ;
                       BCS CODE_01A37E                      ;01A359|B023    |01A37E;
                       INC.W $0781                          ;01A35B|EE8107  |010781;
                       LDA.W $0781                          ;01A35E|AD8107  |010781;
                       CMP.B #$06                           ;01A361|C906    |      ;
                       BCC CODE_01A37E                      ;01A363|9019    |01A37E;
                       LDA.B #$00                           ;01A365|A900    |      ;
                       STA.W $0781                          ;01A367|8D8107  |010781;
                       LDY.W $0780                          ;01A36A|AC8007  |010780;
                       INY                                  ;01A36D|C8      |      ;
                       CPY.B #$03                           ;01A36E|C003    |      ;
                       BCC CODE_01A374                      ;01A370|9002    |01A374;
                       LDY.B #$00                           ;01A372|A000    |      ;
 
          CODE_01A374: STY.W $0780                          ;01A374|8C8007  |010780;
                       LDA.W DATA8_01A390,Y                 ;01A377|B990A3  |01A390;
                       STA.B r_CHR_BankBG_0400              ;01A37A|854B    |00004B;
                       STA.B r_CHR_BankSecondQuest_1400     ;01A37C|854E    |00004E;
 
          CODE_01A37E: LDA.B r_roomEffect                   ;01A37E|A57D    |00007D;
                       AND.B #$0F                           ;01A380|290F    |      ;
                       TAY                                  ;01A382|A8      |      ;
                       LDA.W DATA8_01A393,Y                 ;01A383|B993A3  |01A393;
                       CLC                                  ;01A386|18      |      ;
                       ADC.B $89                            ;01A387|6589    |000089;
                       STA.B r_IRQScanlineCmpVal            ;01A389|8543    |000043;
                       INC.B r_IRQFuncDrawIdx               ;01A38B|E66D    |00006D;
                       db $4C                               ;01A38D|        |      ;
 
                       dw CODE_0FE13F                       ;01A38E|        |0FE13F;
 
         DATA8_01A390: db $54,$55,$56                       ;01A390|        |      ;
 
         DATA8_01A393: db $30,$10,$30,$30,$30,$30,$30,$30   ;01A393|        |      ;
 
          CODE_01A39B: LDA.B r_IRQScanlineCmpVal            ;01A39B|A543    |000043;
                       STA.W $5203                          ;01A39D|8D0352  |015203;
                       LDA.B r_IRQScanlineCmpVal            ;01A3A0|A543    |000043;
                       CLC                                  ;01A3A2|18      |      ;
                       ADC.B #$40                           ;01A3A3|6940    |      ;
                       STA.B r_IRQScanlineCmpVal            ;01A3A5|8543    |000043;
                       LDA.B r_roomEffect                   ;01A3A7|A57D    |00007D;
                       AND.B #$0F                           ;01A3A9|290F    |      ;
                       CMP.B #$02                           ;01A3AB|C902    |      ;
                       BCC CODE_01A3C6                      ;01A3AD|9017    |01A3C6;
                       TAY                                  ;01A3AF|A8      |      ;
                       DEY                                  ;01A3B0|88      |      ;
                       DEY                                  ;01A3B1|88      |      ;
                       LDA.W DATA8_01A3D4,Y                 ;01A3B2|B9D4A3  |01A3D4;
                       CMP.B r_sceneScrollOffsetHi          ;01A3B5|C557    |000057;
                       BEQ CODE_01A3CF                      ;01A3B7|F016    |01A3CF;
                       LDA.B r_gameStateLoopCounter         ;01A3B9|A51A    |00001A;
                       AND.B #$03                           ;01A3BB|2903    |      ;
                       BEQ CODE_01A3CF                      ;01A3BD|F010    |01A3CF;
                       BNE DATA8_01A3CC                     ;01A3BF|D00B    |01A3CC;
 
          CODE_01A3C1: LDA.B r_IRQScanlineCmpVal            ;01A3C1|A543    |000043;
                       STA.W $5203                          ;01A3C3|8D0352  |015203;
 
          CODE_01A3C6: LDA.B r_gameStateLoopCounter         ;01A3C6|A51A    |00001A;
                       AND.B #$01                           ;01A3C8|2901    |      ;
                       BEQ CODE_01A3CF                      ;01A3CA|F003    |01A3CF;
 
         DATA8_01A3CC: db $20                               ;01A3CC|        |      ;
                       dw CODE_0FE313                       ;01A3CD|        |0FE313;
 
          CODE_01A3CF: INC.B r_IRQFuncDrawIdx               ;01A3CF|E66D    |00006D;
                       db $4C                               ;01A3D1|        |      ;
 
                       dw CODE_0FE13F                       ;01A3D2|        |0FE13F;
 
         DATA8_01A3D4: db $03,$02,$06,$02,$01,$01           ;01A3D4|        |      ;
 
          CODE_01A3DA: LDA.B r_IRQScanlineCmpVal            ;01A3DA|A543    |000043;
                       STA.W $5203                          ;01A3DC|8D0352  |015203;
                       db $20                               ;01A3DF|        |      ;
                       dw CODE_0FE33C                       ;01A3E0|        |0FE33C;
                       LDA.B r_IRQScanlineCmpVal            ;01A3E2|A543    |000043;
                       CLC                                  ;01A3E4|18      |      ;
                       ADC.B #$30                           ;01A3E5|6930    |      ;
                       STA.B r_IRQScanlineCmpVal            ;01A3E7|8543    |000043;
                       INC.B r_IRQFuncDrawIdx               ;01A3E9|E66D    |00006D;
                       db $4C                               ;01A3EB|        |      ;
 
                       dw CODE_0FE13F                       ;01A3EC|        |0FE13F;
 
         DATA8_01A3EE: db $20                               ;01A3EE|        |      ;
                       dw CODE_0FE33C                       ;01A3EF|        |0FE33C;
                       db $4C                               ;01A3F1|        |      ;
                       dw CODE_0FE13A                       ;01A3F2|        |0FE13A;
 
          CODE_01A3F4: LDA.B $89                            ;01A3F4|A589    |000089;
                       STA.W $5203                          ;01A3F6|8D0352  |015203;
                       LDY.W $0782                          ;01A3F9|AC8207  |010782;
                       STY.W $0789                          ;01A3FC|8C8907  |010789;
                       LDA.W DATA8_01A41A,Y                 ;01A3FF|B91AA4  |01A41A;
                       STA.B r_IRQFuncDrawIdx               ;01A402|856D    |00006D;
                       LDA.W $0783                          ;01A404|AD8307  |010783;
                       CLC                                  ;01A407|18      |      ;
                       ADC.B $89                            ;01A408|6589    |000089;
                       STA.W $078A                          ;01A40A|8D8A07  |01078A;
                       LDA.W $0784                          ;01A40D|AD8407  |010784;
                       CLC                                  ;01A410|18      |      ;
                       ADC.W $078A                          ;01A411|6D8A07  |01078A;
                       STA.W $078B                          ;01A414|8D8B07  |01078B;
                       db $4C                               ;01A417|        |      ;
 
                       dw CODE_0FE13F                       ;01A418|        |0FE13F;
 
         DATA8_01A41A: db $1B,$1B,$1C                       ;01A41A|        |      ;
 
          CODE_01A41D: LDA.W $078A                          ;01A41D|AD8A07  |01078A;
                       STA.W $5203                          ;01A420|8D0352  |015203;
                       JSR.W CODE_01A45E                    ;01A423|205EA4  |01A45E;
                       LDY.W $0789                          ;01A426|AC8907  |010789;
                       LDA.W DATA8_01A431,Y                 ;01A429|B931A4  |01A431;
                       STA.B r_IRQFuncDrawIdx               ;01A42C|856D    |00006D;
                       db $4C                               ;01A42E|        |      ;
 
                       dw CODE_0FE13F                       ;01A42F|        |0FE13F;
 
         DATA8_01A431: db $1D,$1C,$1D                       ;01A431|        |      ;
 
          CODE_01A434: LDX.B #$10                           ;01A434|A210    |      ;
 
          CODE_01A436: DEX                                  ;01A436|CA      |      ;
                       BPL CODE_01A436                      ;01A437|10FD    |01A436;
                       LDA.B r_PPUCtrl                      ;01A439|A5FF    |0000FF;
                       EOR.B #$01                           ;01A43B|4901    |      ;
                       STA.W $2000                          ;01A43D|8D0020  |012000;
                       JSR.W CODE_01A473                    ;01A440|2073A4  |01A473;
                       LDA.W $078B                          ;01A443|AD8B07  |01078B;
                       LDY.W $0789                          ;01A446|AC8907  |010789;
                       CPY.B #$01                           ;01A449|C001    |      ;
                       BEQ CODE_01A450                      ;01A44B|F003    |01A450;
                       LDA.W $078A                          ;01A44D|AD8A07  |01078A;
 
          CODE_01A450: STA.W $5203                          ;01A450|8D0352  |015203;
                       INC.B r_IRQFuncDrawIdx               ;01A453|E66D    |00006D;
                       db $4C                               ;01A455|        |      ;
                       dw CODE_0FE13F                       ;01A456|        |0FE13F;
 
         DATA8_01A458: db $20                               ;01A458|        |      ;
                       dw CODE_0FE32D                       ;01A459|        |0FE32D;
                       db $4C                               ;01A45B|        |      ;
                       dw CODE_0FE13A                       ;01A45C|        |0FE13A;
 
          CODE_01A45E: LDA.B #$74                           ;01A45E|A974    |      ;
                       STA.W $5128                          ;01A460|8D2851  |015128;
                       LDA.B #$77                           ;01A463|A977    |      ;
                       STA.W $512B                          ;01A465|8D2B51  |01512B;
                       LDA.B #$75                           ;01A468|A975    |      ;
                       STA.W $5129                          ;01A46A|8D2951  |015129;
                       LDA.B #$76                           ;01A46D|A976    |      ;
                       STA.W $512A                          ;01A46F|8D2A51  |01512A;
                       RTS                                  ;01A472|60      |      ;
 
 
          CODE_01A473: LDA.B #$78                           ;01A473|A978    |      ;
                       STA.W $5128                          ;01A475|8D2851  |015128;
                       LDA.B #$7A                           ;01A478|A97A    |      ;
                       STA.W $512B                          ;01A47A|8D2B51  |01512B;
                       LDA.B #$4F                           ;01A47D|A94F    |      ;
                       STA.W $5129                          ;01A47F|8D2951  |015129;
                       LDA.B #$79                           ;01A482|A979    |      ;
                       STA.W $512A                          ;01A484|8D2A51  |01512A;
                       RTS                                  ;01A487|60      |      ;
 
 
          CODE_01A488: LDA.B $89                            ;01A488|A589    |000089;
                       STA.W $5203                          ;01A48A|8D0352  |015203;
                       LDA.W $078E                          ;01A48D|AD8E07  |01078E;
                       CLC                                  ;01A490|18      |      ;
                       ADC.B $89                            ;01A491|6589    |000089;
                       STA.W $0789                          ;01A493|8D8907  |010789;
                       LDA.W $0790                          ;01A496|AD9007  |010790;
                       STA.W $078B                          ;01A499|8D8B07  |01078B;
                       LDA.W $078F                          ;01A49C|AD8F07  |01078F;
                       STA.W $078A                          ;01A49F|8D8A07  |01078A;
                       LDA.W $0793                          ;01A4A2|AD9307  |010793;
                       BEQ CODE_01A4AD                      ;01A4A5|F006    |01A4AD;
                       JSR.W CODE_01A53F                    ;01A4A7|203FA5  |01A53F;
                       JMP.W DATA8_01A4B8                   ;01A4AA|4CB8A4  |01A4B8;
 
 
          CODE_01A4AD: LDA.W $0786                          ;01A4AD|AD8607  |010786;
                       STA.W $0792                          ;01A4B0|8D9207  |010792;
                       LDX.B #$08                           ;01A4B3|A208    |      ;
                       JSR.W CODE_01A527                    ;01A4B5|2027A5  |01A527;
 
         DATA8_01A4B8: db $20                               ;01A4B8|        |      ;
                       dw CODE_0FE35D                       ;01A4B9|        |0FE35D;
                       LDA.W $078A                          ;01A4BB|AD8A07  |01078A;
                       BNE DATA8_01A4C5                     ;01A4BE|D005    |01A4C5;
                       INC.B r_IRQFuncDrawIdx               ;01A4C0|E66D    |00006D;
                       db $4C                               ;01A4C2|        |      ;
                       dw CODE_0FE13F                       ;01A4C3|        |0FE13F;
 
         DATA8_01A4C5: db $4C                               ;01A4C5|        |      ;
                       dw CODE_0FE13A                       ;01A4C6|        |0FE13A;
 
          CODE_01A4C8: LDA.W $0789                          ;01A4C8|AD8907  |010789;
                       STA.W $5203                          ;01A4CB|8D0352  |015203;
                       LDA.W $0792                          ;01A4CE|AD9207  |010792;
                       CLC                                  ;01A4D1|18      |      ;
                       ADC.B #$01                           ;01A4D2|6901    |      ;
                       LDX.B #$00                           ;01A4D4|A200    |      ;
                       JSR.W CODE_01A527                    ;01A4D6|2027A5  |01A527;
                       db $20                               ;01A4D9|        |      ;
                       dw CODE_0FE35D                       ;01A4DA|        |0FE35D;
                       LDA.W $078B                          ;01A4DC|AD8B07  |01078B;
                       BNE DATA8_01A4C5                     ;01A4DF|D0E4    |01A4C5;
                       INC.B r_IRQFuncDrawIdx               ;01A4E1|E66D    |00006D;
                       db $4C                               ;01A4E3|        |      ;
 
                       dw CODE_0FE13F                       ;01A4E4|        |0FE13F;
 
          CODE_01A4E6: LDA.W $0792                          ;01A4E6|AD9207  |010792;
                       CLC                                  ;01A4E9|18      |      ;
                       ADC.B #$02                           ;01A4EA|6902    |      ;
                       LDX.B #$04                           ;01A4EC|A204    |      ;
                       JSR.W CODE_01A527                    ;01A4EE|2027A5  |01A527;
                       db $20                               ;01A4F1|        |      ;
                       dw CODE_0FE35D                       ;01A4F2|        |0FE35D;
                       LDA.B #$7F                           ;01A4F4|A97F    |      ;
                       STA.B r_CHR_BankBG_0000              ;01A4F6|854A    |00004A;
                       STA.B r_CHR_BankBG_0400              ;01A4F8|854B    |00004B;
                       STA.B r_CHR_BankBG_0800              ;01A4FA|854C    |00004C;
                       STA.B r_CHR_BankBG_0c00              ;01A4FC|854D    |00004D;
                       db $4C                               ;01A4FE|        |      ;
                       dw CODE_0FE13A                       ;01A4FF|        |0FE13A;
 
          CODE_01A501: LDX.B #$08                           ;01A501|A208    |      ;
 
          CODE_01A503: TXA                                  ;01A503|8A      |      ;
                       LSR A                                ;01A504|4A      |      ;
                       LSR A                                ;01A505|4A      |      ;
                       LSR A                                ;01A506|4A      |      ;
                       TAY                                  ;01A507|A8      |      ;
                       LDA.W $2002                          ;01A508|AD0220  |012002;
                       LDA.W $0794,Y                        ;01A50B|B99407  |010794;
                       STA.W $2005                          ;01A50E|8D0520  |012005;
                       LDA.B #$00                           ;01A511|A900    |      ;
                       STA.W $2005                          ;01A513|8D0520  |012005;
                       LDA.B #$09                           ;01A516|A909    |      ;
                       STA.B r_IRQFuncAddr                  ;01A518|8544    |000044;
 
          CODE_01A51A: DEC.B r_IRQFuncAddr                  ;01A51A|C644    |000044;
                       BNE CODE_01A51A                      ;01A51C|D0FC    |01A51A;
                       NOP                                  ;01A51E|EA      |      ;
                       INX                                  ;01A51F|E8      |      ;
                       CPX.B #$49                           ;01A520|E049    |      ;
                       BNE CODE_01A503                      ;01A522|D0DF    |01A503;
                       db $4C                               ;01A524|        |      ;
 
                       dw CODE_0FE13A                       ;01A525|        |0FE13A;
 
          CODE_01A527: ASL A                                ;01A527|0A      |      ;
                       ASL A                                ;01A528|0A      |      ;
                       TAY                                  ;01A529|A8      |      ;
                       LDA.W DATA8_01A550,Y                 ;01A52A|B950A5  |01A550;
                       STA.B r_CHR_BankBG_0000              ;01A52D|854A    |00004A;
                       LDA.W DATA8_01A551,Y                 ;01A52F|B951A5  |01A551;
                       STA.B r_CHR_BankBG_0400              ;01A532|854B    |00004B;
                       LDA.W DATA8_01A552,Y                 ;01A534|B952A5  |01A552;
                       STA.B r_CHR_BankBG_0800              ;01A537|854C    |00004C;
                       LDA.W DATA8_01A553,Y                 ;01A539|B953A5  |01A553;
                       STA.B r_CHR_BankBG_0c00              ;01A53C|854D    |00004D;
                       RTS                                  ;01A53E|60      |      ;
 
 
          CODE_01A53F: LDA.B #$41                           ;01A53F|A941    |      ;
                       STA.B r_CHR_BankBG_0000              ;01A541|854A    |00004A;
                       LDA.B #$3E                           ;01A543|A93E    |      ;
                       STA.B r_CHR_BankBG_0400              ;01A545|854B    |00004B;
                       LDA.B #$3F                           ;01A547|A93F    |      ;
                       STA.B r_CHR_BankBG_0800              ;01A549|854C    |00004C;
                       LDA.B #$6F                           ;01A54B|A96F    |      ;
                       STA.B r_CHR_BankBG_0c00              ;01A54D|854D    |00004D;
                       RTS                                  ;01A54F|60      |      ;
 
 
         DATA8_01A550: db $41                               ;01A550|        |      ;
 
         DATA8_01A551: db $70                               ;01A551|        |      ;
 
         DATA8_01A552: db $71                               ;01A552|        |      ;
 
         DATA8_01A553: db $72,$41,$41,$5A,$6F,$41,$41,$5A   ;01A553|        |      ;
                       db $6F,$41,$3C,$3D,$6F,$41,$3E,$3F   ;01A55B|        |      ;
                       db $6F,$41,$3C,$3D,$6F,$41,$41,$5A   ;01A563|        |      ;
                       db $6F,$41,$3C,$3D,$6F,$41,$3C,$3D   ;01A56B|        |      ;
                       db $6F,$41,$3C,$3D,$6F               ;01A573|        |      ;
 
          CODE_01A578: LDA.B $89                            ;01A578|A589    |000089;
                       STA.W $5203                          ;01A57A|8D0352  |015203;
                       LDX.B #$07                           ;01A57D|A207    |      ;
 
          CODE_01A57F: LDA.W $0782,X                        ;01A57F|BD8207  |010782;
                       STA.W $0789,X                        ;01A582|9D8907  |010789;
                       DEX                                  ;01A585|CA      |      ;
                       BPL CODE_01A57F                      ;01A586|10F7    |01A57F;
                       LDA.W $078A                          ;01A588|AD8A07  |01078A;
                       CLC                                  ;01A58B|18      |      ;
                       ADC.B $89                            ;01A58C|6589    |000089;
                       STA.W $078A                          ;01A58E|8D8A07  |01078A;
                       LDA.W $078B                          ;01A591|AD8B07  |01078B;
                       CLC                                  ;01A594|18      |      ;
                       ADC.W $078A                          ;01A595|6D8A07  |01078A;
                       STA.W $078B                          ;01A598|8D8B07  |01078B;
                       INC.B r_IRQFuncDrawIdx               ;01A59B|E66D    |00006D;
                       db $4C                               ;01A59D|        |      ;
 
                       dw CODE_0FE13F                       ;01A59E|        |0FE13F;
 
          CODE_01A5A0: LDA.W $078A                          ;01A5A0|AD8A07  |01078A;
                       STA.W $5203                          ;01A5A3|8D0352  |015203;
                       LDA.B #$55                           ;01A5A6|A955    |      ;
                       STA.W $5105                          ;01A5A8|8D0551  |015105;
                       LDX.B #$05                           ;01A5AB|A205    |      ;
                       db $20                               ;01A5AD|        |      ;
                       dw wait50cycles                      ;01A5AE|        |0FE001;
                       LDA.W $2002                          ;01A5B0|AD0220  |012002;
                       LDA.W $078D                          ;01A5B3|AD8D07  |01078D;
                       STA.W $2006                          ;01A5B6|8D0620  |012006;
                       LDA.W $078C                          ;01A5B9|AD8C07  |01078C;
                       STA.W $2006                          ;01A5BC|8D0620  |012006;
                       LDA.W $078E                          ;01A5BF|AD8E07  |01078E;
                       STA.W $2005                          ;01A5C2|8D0520  |012005;
                       LDA.B #$00                           ;01A5C5|A900    |      ;
                       STA.W $2005                          ;01A5C7|8D0520  |012005;
                       db $20                               ;01A5CA|        |      ;
                       dw CODE_0FE32D                       ;01A5CB|        |0FE32D;
                       INC.B r_IRQFuncDrawIdx               ;01A5CD|E66D    |00006D;
                       db $4C                               ;01A5CF|        |      ;
 
                       dw CODE_0FE13F                       ;01A5D0|        |0FE13F;
 
          CODE_01A5D2: LDA.W $078B                          ;01A5D2|AD8B07  |01078B;
                       STA.W $5203                          ;01A5D5|8D0352  |015203;
                       LDX.B #$0C                           ;01A5D8|A20C    |      ;
                       db $20                               ;01A5DA|        |      ;
                       dw wait50cycles                      ;01A5DB|        |0FE001;
                       db $20                               ;01A5DD|        |      ;
                       dw CODE_0FE35D                       ;01A5DE|        |0FE35D;
                       INC.B r_IRQFuncDrawIdx               ;01A5E0|E66D    |00006D;
                       db $4C                               ;01A5E2|        |      ;
 
                       dw CODE_0FE13F                       ;01A5E3|        |0FE13F;
 
          CODE_01A5E5: LDX.B #$14                           ;01A5E5|A214    |      ;
                       db $20                               ;01A5E7|        |      ;
                       dw wait50cycles                      ;01A5E8|        |0FE001;
                       LDA.B #$44                           ;01A5EA|A944    |      ;
                       STA.W $5105                          ;01A5EC|8D0551  |015105;
                       LDA.W $2002                          ;01A5EF|AD0220  |012002;
                       LDA.B #$23                           ;01A5F2|A923    |      ;
                       STA.W $2006                          ;01A5F4|8D0620  |012006;
                       LDA.B #$00                           ;01A5F7|A900    |      ;
                       STA.W $2006                          ;01A5F9|8D0620  |012006;
                       LDA.B #$00                           ;01A5FC|A900    |      ;
                       STA.W $2005                          ;01A5FE|8D0520  |012005;
                       STA.W $2005                          ;01A601|8D0520  |012005;
                       LDA.B #$B0                           ;01A604|A9B0    |      ;
                       STA.W $2000                          ;01A606|8D0020  |012000;
                       db $4C                               ;01A609|        |      ;
 
                       dw CODE_0FE13A                       ;01A60A|        |0FE13A;
 
          CODE_01A60C: LDA.B r_gameSubstate                 ;01A60C|A519    |000019;
                       CMP.B #$02                           ;01A60E|C902    |      ;
                       BCC CODE_01A61B                      ;01A610|9009    |01A61B;
                       LDA.B r_curJoyPe1                    ;01A612|A526    |000026;
                       AND.B #$10                           ;01A614|2910    |      ;
                       BEQ CODE_01A61B                      ;01A616|F003    |01A61B;
                       JMP.W CODE_01A72A                    ;01A618|4C2AA7  |01A72A;
 
 
          CODE_01A61B: LDA.B r_gameSubstate                 ;01A61B|A519    |000019;
                       db $20                               ;01A61D|        |      ;
                       dw jumpFromStackYXpreserved          ;01A61E|        |0FE86D;
                       dw CODE_01A630                       ;01A620|        |01A630;
                       dw CODE_01A66B                       ;01A622|        |01A66B;
 
                       dw DATA8_01A694                      ;01A624|        |01A694;
                       dw DATA8_01A6B3                      ;01A626|        |01A6B3;
                       dw DATA8_01A6E6                      ;01A628|        |01A6E6;
                       dw DATA8_01A6F9                      ;01A62A|        |01A6F9;
                       dw CODE_01A711                       ;01A62C|        |01A711;
                       dw DATA8_01A725                      ;01A62E|        |01A725;
 
          CODE_01A630: LDA.B #$02                           ;01A630|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;01A632|851C    |00001C;
                       LDA.B #$67                           ;01A634|A967    |      ;
                       db $20                               ;01A636|        |      ;
                       dw initFreezWaterEffect_01           ;01A637|        |0FE25F;
                       LDA.B #$00                           ;01A639|A900    |      ;
                       STA.B r_CHR_BankSpr_0000             ;01A63B|8546    |000046;
                       LDA.B #$01                           ;01A63D|A901    |      ;
                       STA.B r_CHR_BankSpr_0400             ;01A63F|8547    |000047;
                       LDA.B #$16                           ;01A641|A916    |      ;
                       STA.B r_CHR_BankSpr_0800             ;01A643|8548    |000048;
                       LDA.B #$7B                           ;01A645|A97B    |      ;
                       STA.B r_CHR_BankSpr_0c00             ;01A647|8549    |000049;
                       LDA.B #$44                           ;01A649|A944    |      ;
                       STA.B r_CHR_BankBG_0000              ;01A64B|854A    |00004A;
                       LDA.B #$45                           ;01A64D|A945    |      ;
                       STA.B r_CHR_BankBG_0400              ;01A64F|854B    |00004B;
                       LDA.B #$47                           ;01A651|A947    |      ;
                       STA.B r_CHR_BankBG_0800              ;01A653|854C    |00004C;
                       LDA.B #$43                           ;01A655|A943    |      ;
                       STA.B r_CHR_BankBG_0c00              ;01A657|854D    |00004D;
                       db $20                               ;01A659|        |      ;
                       dw initClearScreen_clearIRQfunc      ;01A65A|        |0FE666;
                       db $20                               ;01A65C|        |      ;
                       dw clearAllEntityButPlayer           ;01A65D|        |0FE7F7;
                       INC.B r_gameSubstate                 ;01A65F|E619    |000019;
 
          CODE_01A661: LDA.B #$1F                           ;01A661|A91F    |      ;
                       db $20                               ;01A663|        |      ;
                       dw screenLoadRoutine                 ;01A664|        |0FECE9;
                       LDA.B #$04                           ;01A666|A904    |      ;
                       db $4C                               ;01A668|        |      ;
                       dw screenLoadRoutine                 ;01A669|        |0FECE9;
 
          CODE_01A66B: LDX.B #$16                           ;01A66B|A216    |      ;
                       LDA.B #$88                           ;01A66D|A988    |      ;
                       db $20                               ;01A66F|        |      ;
                       dw screenLoadRoutine01               ;01A670|        |0FEBD5;
                       LDY.B #$00                           ;01A672|A000    |      ;
                       JSR.W CODE_01A76D                    ;01A674|206DA7  |01A76D;
                       LDA.B #$01                           ;01A677|A901    |      ;
                       STA.W $04A8                          ;01A679|8DA804  |0104A8;
                       LDA.B #$80                           ;01A67C|A980    |      ;
                       STA.W $0438                          ;01A67E|8D3804  |010438;
                       LDA.B #$B0                           ;01A681|A9B0    |      ;
                       STA.W $041C                          ;01A683|8D1C04  |01041C;
                       INC.B r_gameSubstate                 ;01A686|E619    |000019;
                       LDA.B #$08                           ;01A688|A908    |      ;
                       STA.W $05C2                          ;01A68A|8DC205  |0105C2;
                       LDY.B #$01                           ;01A68D|A001    |      ;
                       LDA.B #$00                           ;01A68F|A900    |      ;
                       db $4C                               ;01A691|        |      ;
 
                       dw CODE_0FE58E                       ;01A692|        |0FE58E;
 
         DATA8_01A694: db $20                               ;01A694|        |      ;
                       dw CODE_0FE579                       ;01A695|        |0FE579;
                       BNE CODE_01A6B2                      ;01A697|D019    |01A6B2;
                       LDA.B #$1D                           ;01A699|A91D    |      ;
                       db $20                               ;01A69B|        |      ;
                       dw screenLoadRoutine                 ;01A69C|        |0FECE9;
                       LDA.B #$04                           ;01A69E|A904    |      ;
                       db $20                               ;01A6A0|        |      ;
                       dw screenLoadRoutine                 ;01A6A1|        |0FECE9;
                       INC.B r_gameSubstate                 ;01A6A3|E619    |000019;
                       LDA.W $05C2                          ;01A6A5|ADC205  |0105C2;
                       JSR.W CODE_01A72F                    ;01A6A8|202FA7  |01A72F;
                       LDY.B #$00                           ;01A6AB|A000    |      ;
                       LDA.B #$02                           ;01A6AD|A902    |      ;
                       db $4C                               ;01A6AF|        |      ;
                       dw CODE_0FE58E                       ;01A6B0|        |0FE58E;
 
          CODE_01A6B2: RTS                                  ;01A6B2|60      |      ;
 
 
         DATA8_01A6B3: db $20                               ;01A6B3|        |      ;
                       dw CODE_0FE579                       ;01A6B4|        |0FE579;
                       BNE CODE_01A6B2                      ;01A6B6|D0FA    |01A6B2;
                       LDA.B #$00                           ;01A6B8|A900    |      ;
                       STA.W $0401                          ;01A6BA|8D0104  |010401;
                       STA.W $048D                          ;01A6BD|8D8D04  |01048D;
                       JSR.W CODE_01A661                    ;01A6C0|2061A6  |01A661;
                       DEC.W $05C2                          ;01A6C3|CEC205  |0105C2;
                       BEQ CODE_01A6D5                      ;01A6C6|F00D    |01A6D5;
                       DEC.B r_gameSubstate                 ;01A6C8|C619    |000019;
                       LDY.W $05C2                          ;01A6CA|ACC205  |0105C2;
                       LDA.W DATA8_01A6DE,Y                 ;01A6CD|B9DEA6  |01A6DE;
                       LDY.B #$00                           ;01A6D0|A000    |      ;
                       db $4C                               ;01A6D2|        |      ;
 
                       dw CODE_0FE58E                       ;01A6D3|        |0FE58E;
 
          CODE_01A6D5: INC.B r_gameSubstate                 ;01A6D5|E619    |000019;
                       LDY.B #$00                           ;01A6D7|A000    |      ;
                       LDA.B #$40                           ;01A6D9|A940    |      ;
                       db $4C                               ;01A6DB|        |      ;
                       dw CODE_0FE58E                       ;01A6DC|        |0FE58E;
 
         DATA8_01A6DE: db $03,$03,$06,$06,$0C,$10,$10,$18   ;01A6DE|        |      ;
 
         DATA8_01A6E6: db $20                               ;01A6E6|        |      ;
                       dw CODE_0FE579                       ;01A6E7|        |0FE579;
                       BNE CODE_01A6B2                      ;01A6E9|D0C7    |01A6B2;
                       LDY.B #$01                           ;01A6EB|A001    |      ;
                       JSR.W CODE_01A76D                    ;01A6ED|206DA7  |01A76D;
                       INC.B r_gameSubstate                 ;01A6F0|E619    |000019;
                       LDY.B #$00                           ;01A6F2|A000    |      ;
                       LDA.B #$40                           ;01A6F4|A940    |      ;
                       db $4C                               ;01A6F6|        |      ;
 
                       dw CODE_0FE58E                       ;01A6F7|        |0FE58E;
 
         DATA8_01A6F9: db $20                               ;01A6F9|        |      ;
                       dw CODE_0FE579                       ;01A6FA|        |0FE579;
                       BNE CODE_01A6B2                      ;01A6FC|D0B4    |01A6B2;
                       LDY.B #$39                           ;01A6FE|A039    |      ;
                       LDA.B #$0C                           ;01A700|A90C    |      ;
                       LDX.B #$00                           ;01A702|A200    |      ;
                       db $20                               ;01A704|        |      ;
                       dw CODE_0FEF5C                       ;01A705|        |0FEF5C;
                       LDY.B #$00                           ;01A707|A000    |      ;
                       LDA.B #$20                           ;01A709|A920    |      ;
                       db $20                               ;01A70B|        |      ;
                       dw CODE_0FE58E                       ;01A70C|        |0FE58E;
 
          CODE_01A70E: INC.B r_gameSubstate                 ;01A70E|E619    |000019;
 
          CODE_01A710: RTS                                  ;01A710|60      |      ;
 
 
          CODE_01A711: LDX.B #$00                           ;01A711|A200    |      ;
                       db $20                               ;01A713|        |      ;
                       dw CODE_0FEF75                       ;01A714|        |0FEF75;
                       db $20                               ;01A716|        |      ;
                       dw CODE_0FE579                       ;01A717|        |0FE579;
                       BNE CODE_01A710                      ;01A719|D0F5    |01A710;
                       LDY.B #$00                           ;01A71B|A000    |      ;
                       LDA.B #$2C                           ;01A71D|A92C    |      ;
                       db $20                               ;01A71F|        |      ;
                       dw CODE_0FE58E                       ;01A720|        |0FE58E;
                       JMP.W CODE_01A70E                    ;01A722|4C0EA7  |01A70E;
 
 
         DATA8_01A725: db $20                               ;01A725|        |      ;
                       dw CODE_0FE579                       ;01A726|        |0FE579;
                       BNE CODE_01A710                      ;01A728|D0E6    |01A710;
 
          CODE_01A72A: LDA.B #$03                           ;01A72A|A903    |      ;
                       STA.B r_gameState                    ;01A72C|8518    |000018;
                       RTS                                  ;01A72E|60      |      ;
 
 
          CODE_01A72F: TAY                                  ;01A72F|A8      |      ;
                       LDA.W DATA8_01A764,Y                 ;01A730|B964A7  |01A764;
                       STA.W $04A9                          ;01A733|8DA904  |0104A9;
                       LDA.B #$DA                           ;01A736|A9DA    |      ;
                       STA.W $0401                          ;01A738|8D0104  |010401;
                       LDA.B #$0C                           ;01A73B|A90C    |      ;
                       STA.W $048D                          ;01A73D|8D8D04  |01048D;
                       LDA.W DATA8_01A752,Y                 ;01A740|B952A7  |01A752;
                       STA.W $0439                          ;01A743|8D3904  |010439;
                       LDA.W DATA8_01A75B,Y                 ;01A746|B95BA7  |01A75B;
                       STA.W $041D                          ;01A749|8D1D04  |01041D;
                       LDA.B #$3E                           ;01A74C|A93E    |      ;
                       db $20                               ;01A74E|        |      ;
                       dw initFreezWaterEffect_01           ;01A74F|        |0FE25F;
                       RTS                                  ;01A751|60      |      ;
 
 
         DATA8_01A752: db $00,$28,$18,$C0,$30,$D0,$D0,$20   ;01A752|        |      ;
                       db $E0                               ;01A75A|        |      ;
 
         DATA8_01A75B: db $00,$40,$40,$40,$40,$40,$40,$40   ;01A75B|        |      ;
                       db $40                               ;01A763|        |      ;
 
         DATA8_01A764: db $00,$00,$00,$01,$00,$01,$01,$00   ;01A764|        |      ;
                       db $01                               ;01A76C|        |      ;
 
          CODE_01A76D: LDA.W DATA8_01A77E,Y                 ;01A76D|B97EA7  |01A77E;
                       STA.W $0400                          ;01A770|8D0004  |010400;
                       LDA.B #$0C                           ;01A773|A90C    |      ;
                       STA.W $048C                          ;01A775|8D8C04  |01048C;
                       LDA.B #$00                           ;01A778|A900    |      ;
                       STA.W $0454                          ;01A77A|8D5404  |010454;
                       RTS                                  ;01A77D|60      |      ;
 
 
         DATA8_01A77E: db $DC,$DE                           ;01A77E|        |      ;
 
 
          CODE_01A780: LDY.B #$00                           ;01A780|A000    |      ;
                       BEQ CODE_01A7A2                      ;01A782|F01E    |01A7A2;
 
          CODE_01A784: LDY.B #$02                           ;01A784|A002    |      ;
                       BNE CODE_01A7A2                      ;01A786|D01A    |01A7A2;
 
          CODE_01A788: LDY.B #$04                           ;01A788|A004    |      ;
                       BNE CODE_01A7A2                      ;01A78A|D016    |01A7A2;
 
          CODE_01A78C: LDY.B #$06                           ;01A78C|A006    |      ;
                       BNE CODE_01A7A2                      ;01A78E|D012    |01A7A2;
 
          CODE_01A790: LDY.B #$08                           ;01A790|A008    |      ;
                       BNE CODE_01A7A2                      ;01A792|D00E    |01A7A2;
 
          CODE_01A794: LDY.B #$0A                           ;01A794|A00A    |      ;
                       BNE CODE_01A7A2                      ;01A796|D00A    |01A7A2;
 
          CODE_01A798: LDY.B #$0C                           ;01A798|A00C    |      ;
                       BNE CODE_01A7A2                      ;01A79A|D006    |01A7A2;
 
          CODE_01A79C: LDY.B #$0E                           ;01A79C|A00E    |      ;
                       BNE CODE_01A7A2                      ;01A79E|D002    |01A7A2;
                       LDY.B #$10                           ;01A7A0|A010    |      ;
 
          CODE_01A7A2: LDA.W PTR16_01A7B1,Y                 ;01A7A2|B9B1A7  |01A7B1;
                       STA.B $00                            ;01A7A5|8500    |000000;
                       LDA.W PTR16_01A7B2,Y                 ;01A7A7|B9B2A7  |01A7B2;
                       STA.B $01                            ;01A7AA|8501    |000001;
                       LDA.B #$84                           ;01A7AC|A984    |      ;
                       db $4C                               ;01A7AE|        |      ;
 
                       dw titleScreenThunderMain            ;01A7AF|        |0FE62F;
 
         PTR16_01A7B1: dw DATA8_01B6CA                      ;01A7B1|        |01B6CA;
                       dw DATA8_01B7E1                      ;01A7B3|        |01B7E1;
                       dw DATA8_01B99A                      ;01A7B5|        |01B99A;
                       dw GFX_01BA77                        ;01A7B7|        |01BA77;
                       dw GFX_01BA7C                        ;01A7B9|        |01BA7C;
 
                       dw GFX_01BABC                        ;01A7BB|        |01BABC;
                       dw GFX_01BADD                        ;01A7BD|        |01BADD;
                       dw LOOSE_OP_01B8C5                   ;01A7BF|        |01B8C5;
                       dw loadCompressedTilemap2GFX         ;01A7C1|        |0FEC04;
 
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
                       JSR.W CODE_01A788                    ;01A7DC|2088A7  |01A788;
 
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
                       dw CODE_0FE5C1                       ;01A837|        |0FE5C1;
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
                       JSR.W CODE_01AE88                    ;01A85E|2088AE  |01AE88;
                       LDX.B #$1E                           ;01A861|A21E    |      ;
                       LDA.B #$98                           ;01A863|A998    |      ;
                       db $20                               ;01A865|        |      ;
                       dw screenLoadRoutine01               ;01A866|        |0FEBD5;
                       LDX.B #$00                           ;01A868|A200    |      ;
                       JSR.W CODE_01AC7C                    ;01A86A|207CAC  |01AC7C;
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
                       dw initFreezWaterEffect_01           ;01A899|        |0FE25F;
 
       endGenerelLoad: INC.W $07EC                          ;01A89B|EEEC07  |0107EC;
                       RTS                                  ;01A89E|60      |      ;
 
 
   generalLoadTable01: JSR.W CODE_01AE8D                    ;01A89F|208DAE  |01AE8D;
                       BEQ CODE_01A8A8                      ;01A8A2|F004    |01A8A8;
                       JSR.W DATA8_01AD34                   ;01A8A4|2034AD  |01AD34;
                       RTS                                  ;01A8A7|60      |      ;
 
 
          CODE_01A8A8: LDA.B #$80                           ;01A8A8|A980    |      ;
                       STA.W $07ED                          ;01A8AA|8DED07  |0107ED;
                       LDA.B #$00                           ;01A8AD|A900    |      ;
                       STA.W $07EE                          ;01A8AF|8DEE07  |0107EE;
                       JMP.W endGenerelLoad                 ;01A8B2|4C9BA8  |01A89B;
 
 
   generalLoadTable02: JSR.W CODE_01AE8D                    ;01A8B5|208DAE  |01AE8D;
                       BEQ endGenerelLoad                   ;01A8B8|F0E1    |01A89B;
                       JSR.W CODE_01ABDB                    ;01A8BA|20DBAB  |01ABDB;
                       JSR.W DATA8_01AD34                   ;01A8BD|2034AD  |01AD34;
                       JSR.W CODE_01AE6F                    ;01A8C0|206FAE  |01AE6F;
                       RTS                                  ;01A8C3|60      |      ;
 
 
   generalLoadTable03: JSR.W CODE_01ABDB                    ;01A8C4|20DBAB  |01ABDB;
                       JSR.W DATA8_01AD34                   ;01A8C7|2034AD  |01AD34;
                       JSR.W CODE_01AE6F                    ;01A8CA|206FAE  |01AE6F;
                       LDA.B r_ScrollY                      ;01A8CD|A5FC    |0000FC;
                       BEQ endGenerelLoad                   ;01A8CF|F0CA    |01A89B;
                       RTS                                  ;01A8D1|60      |      ;
 
 
   generalLoadTable04: JSR.W CODE_01AE88                    ;01A8D2|2088AE  |01AE88;
                       LDA.B #$03                           ;01A8D5|A903    |      ;
                       STA.W $07EF                          ;01A8D7|8DEF07  |0107EF;
                       JMP.W endGenerelLoad                 ;01A8DA|4C9BA8  |01A89B;
 
 
   generalLoadTable05: JSR.W DATA8_01AD34                   ;01A8DD|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01A8E0|2022AF  |01AF22;
                       LDA.B r_ScrollY                      ;01A8E3|A5FC    |0000FC;
                       BEQ CODE_01A8E8                      ;01A8E5|F001    |01A8E8;
                       RTS                                  ;01A8E7|60      |      ;
 
 
          CODE_01A8E8: JMP.W endGenerelLoad                 ;01A8E8|4C9BA8  |01A89B;
 
 
   generalLoadTable06: JSR.W DATA8_01AD34                   ;01A8EB|2034AD  |01AD34;
                       JSR.W CODE_01A78C                    ;01A8EE|208CA7  |01A78C;
                       LDA.B #$00                           ;01A8F1|A900    |      ;
                       STA.W $07EE                          ;01A8F3|8DEE07  |0107EE;
                       JMP.W endGenerelLoad                 ;01A8F6|4C9BA8  |01A89B;
 
 
   generalLoadTable07: JSR.W DATA8_01AD34                   ;01A8F9|2034AD  |01AD34;
                       JSR.W CODE_01A790                    ;01A8FC|2090A7  |01A790;
                       BCC CODE_01A91A                      ;01A8FF|9019    |01A91A;
                       JSR.W CODE_01A794                    ;01A901|2094A7  |01A794;
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
 
 
   generalLoadTable08: JSR.W DATA8_01AD34                   ;01A91B|2034AD  |01AD34;
                       LDA.B #$00                           ;01A91E|A900    |      ;
                       STA.B r_pointerQueue                 ;01A920|8508    |000008;
                       JSR.W CODE_01A798                    ;01A922|2098A7  |01A798;
                       LDA.B r_pointerQueue                 ;01A925|A508    |000008;
                       CMP.B #$09                           ;01A927|C909    |      ;
                       BCS CODE_01A92F                      ;01A929|B004    |01A92F;
                       JSR.W generalLoadTable09             ;01A92B|2045A9  |01A945;
                       RTS                                  ;01A92E|60      |      ;
 
 
          CODE_01A92F: JSR.W CODE_01AE88                    ;01A92F|2088AE  |01AE88;
                       LDA.B #$1E                           ;01A932|A91E    |      ;
                       STA.B r_IRQFuncIdx                   ;01A934|853F    |00003F;
                       LDA.B #$80                           ;01A936|A980    |      ;
                       STA.B r_IRQStatus                    ;01A938|8540    |000040;
                       LDA.B #$01                           ;01A93A|A901    |      ;
                       STA.W $078F                          ;01A93C|8D8F07  |01078F;
                       INC.W $07EC                          ;01A93F|EEEC07  |0107EC;
                       JMP.W endGenerelLoad                 ;01A942|4C9BA8  |01A89B;
 
 
   generalLoadTable09: JSR.W CODE_01AE8D                    ;01A945|208DAE  |01AE8D;
                       BNE CODE_01A961                      ;01A948|D017    |01A961;
                       LDA.W $07EF                          ;01A94A|ADEF07  |0107EF;
                       BMI CODE_01A961                      ;01A94D|3012    |01A961;
                       LDX.B #$00                           ;01A94F|A200    |      ;
                       JSR.W CODE_01AEA2                    ;01A951|20A2AE  |01AEA2;
                       LDA.B #$08                           ;01A954|A908    |      ;
                       STA.W $07ED                          ;01A956|8DED07  |0107ED;
                       LDA.B #$00                           ;01A959|A900    |      ;
                       STA.W $07EE                          ;01A95B|8DEE07  |0107EE;
                       DEC.W $07EF                          ;01A95E|CEEF07  |0107EF;
 
          CODE_01A961: RTS                                  ;01A961|60      |      ;
 
 
   generalLoadTable0a: JSR.W DATA8_01AD34                   ;01A962|2034AD  |01AD34;
 
          CODE_01A965: LDA.B #$00                           ;01A965|A900    |      ;
                       STA.W $07EF                          ;01A967|8DEF07  |0107EF;
                       STA.W $07F0                          ;01A96A|8DF007  |0107F0;
                       STA.W $07F1                          ;01A96D|8DF107  |0107F1;
                       STA.W $07F2                          ;01A970|8DF207  |0107F2;
                       STA.W $07F3                          ;01A973|8DF307  |0107F3;
                       JMP.W endGenerelLoad                 ;01A976|4C9BA8  |01A89B;
 
 
   generalLoadTable0b: JSR.W DATA8_01AD34                   ;01A979|2034AD  |01AD34;
                       LDX.B #$02                           ;01A97C|A202    |      ;
                       JSR.W CODE_01A780                    ;01A97E|2080A7  |01A780;
                       BCS CODE_01A965                      ;01A981|B0E2    |01A965;
                       RTS                                  ;01A983|60      |      ;
 
 
   generalLoadTable0c: JSR.W DATA8_01AD34                   ;01A984|2034AD  |01AD34;
                       LDX.B #$00                           ;01A987|A200    |      ;
                       JSR.W CODE_01A780                    ;01A989|2080A7  |01A780;
                       BCS CODE_01A965                      ;01A98C|B0D7    |01A965;
                       RTS                                  ;01A98E|60      |      ;
 
 
   generalLoadTable0d: JSR.W DATA8_01AD34                   ;01A98F|2034AD  |01AD34;
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
 
 
   generalLoadTable0e: JSR.W DATA8_01AD34                   ;01A9CE|2034AD  |01AD34;
                       LDA.B r_index                        ;01A9D1|A510    |000010;
                       BNE CODE_01A9D6                      ;01A9D3|D001    |01A9D6;
                       RTS                                  ;01A9D5|60      |      ;
 
 
          CODE_01A9D6: JMP.W endGenerelLoad                 ;01A9D6|4C9BA8  |01A89B;
 
 
   generalLoadTable0f: JSR.W DATA8_01AD34                   ;01A9D9|2034AD  |01AD34;
                       LDA.B r_PPUCtrl                      ;01A9DC|A5FF    |0000FF;
                       AND.B #$FD                           ;01A9DE|29FD    |      ;
                       STA.B r_PPUCtrl                      ;01A9E0|85FF    |0000FF;
                       JSR.W CODE_01AE8D                    ;01A9E2|208DAE  |01AE8D;
                       BNE CODE_01AA00                      ;01A9E5|D019    |01AA00;
                       LDX.B #$02                           ;01A9E7|A202    |      ;
                       JSR.W CODE_01AEA2                    ;01A9E9|20A2AE  |01AEA2;
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
 
 
   generalLoadTable11: JSR.W DATA8_01AD34                   ;01AA11|2034AD  |01AD34;
                       LDX.B #$06                           ;01AA14|A206    |      ;
 
          CODE_01AA16: LDA.W $07F0                          ;01AA16|ADF007  |0107F0;
                       AND.B #$01                           ;01AA19|2901    |      ;
                       BNE CODE_01AA23                      ;01AA1B|D006    |01AA23;
                       JSR.W CODE_01A784                    ;01AA1D|2084A7  |01A784;
                       JMP.W CODE_01AA3C                    ;01AA20|4C3CAA  |01AA3C;
 
 
          CODE_01AA23: JSR.W CODE_01A79C                    ;01AA23|209CA7  |01A79C;
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
 
 
   generalLoadTable12: JSR.W DATA8_01AD34                   ;01AA40|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AA43|2022AF  |01AF22;
                       LDA.B r_ScrollY                      ;01AA46|A5FC    |0000FC;
                       BNE CODE_01AA4D                      ;01AA48|D003    |01AA4D;
                       JMP.W endGenerelLoad                 ;01AA4A|4C9BA8  |01A89B;
 
 
          CODE_01AA4D: RTS                                  ;01AA4D|60      |      ;
 
 
   generalLoadTable13: JSR.W CODE_01AA7A                    ;01AA4E|207AAA  |01AA7A;
 
   generalLoadTable14: JSR.W DATA8_01AD34                   ;01AA51|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AA54|2022AF  |01AF22;
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
                       JSR.W CODE_01AC7C                    ;01AA71|207CAC  |01AC7C;
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
 
 
   generalLoadTable16: JSR.W DATA8_01AD34                   ;01AA94|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AA97|2022AF  |01AF22;
                       LDX.B #$00                           ;01AA9A|A200    |      ;
                       JMP.W CODE_01AAD1                    ;01AA9C|4CD1AA  |01AAD1;
 
 
          CODE_01AA9F: LDA.W $07F0                          ;01AA9F|ADF007  |0107F0;
                       AND.B #$01                           ;01AAA2|2901    |      ;
                       BNE CODE_01AAAC                      ;01AAA4|D006    |01AAAC;
                       JSR.W CODE_01A784                    ;01AAA6|2084A7  |01A784;
                       JMP.W CODE_01AAC2                    ;01AAA9|4CC2AA  |01AAC2;
 
 
          CODE_01AAAC: JSR.W CODE_01A79C                    ;01AAAC|209CA7  |01A79C;
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
 
   generalLoadTable18: JSR.W DATA8_01AD34                   ;01AAC9|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AACC|2022AF  |01AF22;
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
 
 
   generalLoadTable1a: JSR.W DATA8_01AD34                   ;01AAF1|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AAF4|2022AF  |01AF22;
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
 
 
   generalLoadTable1c: JSR.W CODE_01AE8D                    ;01AB13|208DAE  |01AE8D;
                       BEQ CODE_01AB10                      ;01AB16|F0F8    |01AB10;
 
          CODE_01AB18: JSR.W CODE_01ABD5                    ;01AB18|20D5AB  |01ABD5;
                       JSR.W DATA8_01AD34                   ;01AB1B|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AB1E|2022AF  |01AF22;
 
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
 
 
   generalLoadTable1e: JSR.W CODE_01ABCB                    ;01AB40|20CBAB  |01ABCB;
                       JSR.W DATA8_01AD34                   ;01AB43|2034AD  |01AD34;
                       JSR.W CODE_01AF22                    ;01AB46|2022AF  |01AF22;
                       LDA.B r_ScrollY                      ;01AB49|A5FC    |0000FC;
                       AND.B #$FE                           ;01AB4B|29FE    |      ;
                       BNE CODE_01AB21                      ;01AB4D|D0D2    |01AB21;
                       JMP.W endGenerelLoad                 ;01AB4F|4C9BA8  |01A89B;
 
 
   generalLoadTable1f: LDA.B #$00                           ;01AB52|A900    |      ;
                       STA.B r_coreLoadingFuncAddr          ;01AB54|8516    |000016;
                       JSR.W DATA8_01AD34                   ;01AB56|2034AD  |01AD34;
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
 
         DATA8_01ABAC: db $01,$20,$01,$40,$01,$60,$01,$80   ;01ABAC|        |      ;
                       db $01,$A0,$01,$C0,$01,$E0,$01,$00   ;01ABB4|        |      ;
                       db $01,$20,$01,$40,$01,$60,$01,$80   ;01ABBC|        |      ;
                       db $01,$A0,$01,$C0,$01,$E0,$01       ;01ABC4|        |      ;
 
          CODE_01ABCB: LDA.B #$00                           ;01ABCB|A900    |      ;
                       STA.B $17                            ;01ABCD|8517    |000017;
                       LDA.B #$20                           ;01ABCF|A920    |      ;
                       STA.B r_pointerQueue                 ;01ABD1|8508    |000008;
                       BNE CODE_01ABE3                      ;01ABD3|D00E    |01ABE3;
 
          CODE_01ABD5: LDA.B #$20                           ;01ABD5|A920    |      ;
                       STA.B r_pointerQueue                 ;01ABD7|8508    |000008;
                       BNE CODE_01ABDF                      ;01ABD9|D004    |01ABDF;
 
          CODE_01ABDB: LDA.B #$28                           ;01ABDB|A928    |      ;
                       STA.B r_pointerQueue                 ;01ABDD|8508    |000008;
 
          CODE_01ABDF: LDA.B #$01                           ;01ABDF|A901    |      ;
                       STA.B $17                            ;01ABE1|8517    |000017;
 
          CODE_01ABE3: LDA.W $0783                          ;01ABE3|AD8307  |010783;
                       STA.B $00                            ;01ABE6|8500    |000000;
                       LDA.B r_ScrollY                      ;01ABE8|A5FC    |0000FC;
                       AND.B #$F8                           ;01ABEA|29F8    |      ;
                       CMP.B $00                            ;01ABEC|C500    |000000;
                       STA.W $0783                          ;01ABEE|8D8307  |010783;
                       BEQ CODE_01AC4D                      ;01ABF1|F05A    |01AC4D;
                       LDY.W $0784                          ;01ABF3|AC8407  |010784;
                       LDA.W $0785                          ;01ABF6|AD8507  |010785;
                       BNE CODE_01AC05                      ;01ABF9|D00A    |01AC05;
                       LDA.W DATA8_01AC53,Y                 ;01ABFB|B953AC  |01AC53;
                       CMP.B #$FE                           ;01ABFE|C9FE    |      ;
                       BEQ CODE_01AC4D                      ;01AC00|F04B    |01AC4D;
                       STA.W $0785                          ;01AC02|8D8507  |010785;
 
          CODE_01AC05: LDX.B r_sceneDrawQueue               ;01AC05|A61D    |00001D;
                       LDA.B #$01                           ;01AC07|A901    |      ;
                       JSR.W CODE_01AC4E                    ;01AC09|204EAC  |01AC4E;
                       LDA.B #$00                           ;01AC0C|A900    |      ;
                       STA.B $01                            ;01AC0E|8501    |000001;
                       LDA.B r_ScrollY                      ;01AC10|A5FC    |0000FC;
                       AND.B #$F8                           ;01AC12|29F8    |      ;
                       ASL A                                ;01AC14|0A      |      ;
                       ROL.B $01                            ;01AC15|2601    |000001;
                       ASL A                                ;01AC17|0A      |      ;
                       ROL.B $01                            ;01AC18|2601    |000001;
                       JSR.W CODE_01AC4E                    ;01AC1A|204EAC  |01AC4E;
                       LDA.B $01                            ;01AC1D|A501    |000001;
                       ORA.B r_pointerQueue                 ;01AC1F|0508    |000008;
                       JSR.W CODE_01AC4E                    ;01AC21|204EAC  |01AC4E;
 
          CODE_01AC24: INY                                  ;01AC24|C8      |      ;
                       LDA.W DATA8_01AC53,Y                 ;01AC25|B953AC  |01AC53;
                       CMP.B #$FF                           ;01AC28|C9FF    |      ;
                       BEQ CODE_01AC3F                      ;01AC2A|F013    |01AC3F;
                       STA.B $00                            ;01AC2C|8500    |000000;
                       INY                                  ;01AC2E|C8      |      ;
                       LDA.B $17                            ;01AC2F|A517    |000017;
                       BEQ CODE_01AC36                      ;01AC31|F003    |01AC36;
                       LDA.W DATA8_01AC53,Y                 ;01AC33|B953AC  |01AC53;
 
          CODE_01AC36: JSR.W CODE_01AC4E                    ;01AC36|204EAC  |01AC4E;
                       DEC.B $00                            ;01AC39|C600    |000000;
                       BNE CODE_01AC36                      ;01AC3B|D0F9    |01AC36;
                       BEQ CODE_01AC24                      ;01AC3D|F0E5    |01AC24;
 
          CODE_01AC3F: JSR.W CODE_01AC4E                    ;01AC3F|204EAC  |01AC4E;
                       STX.B r_sceneDrawQueue               ;01AC42|861D    |00001D;
                       DEC.W $0785                          ;01AC44|CE8507  |010785;
                       BNE CODE_01AC4D                      ;01AC47|D004    |01AC4D;
                       INY                                  ;01AC49|C8      |      ;
                       STY.W $0784                          ;01AC4A|8C8407  |010784;
 
          CODE_01AC4D: RTS                                  ;01AC4D|60      |      ;
 
 
          CODE_01AC4E: STA.W $0300,X                        ;01AC4E|9D0003  |010300;
                       INX                                  ;01AC51|E8      |      ;
                       RTS                                  ;01AC52|60      |      ;
 
 
         DATA8_01AC53: db $01,$20,$00,$FF,$01,$04,$00,$18   ;01AC53|        |      ;
                       db $6E,$04,$00,$FF,$19,$03,$00,$01   ;01AC5B|        |      ;
                       db $6D,$17,$00,$01,$6D,$04,$00,$FF   ;01AC63|        |      ;
                       db $01,$03,$00,$01,$6D,$17,$6E,$01   ;01AC6B|        |      ;
                       db $6F,$04,$00,$FF,$02,$20,$00,$FF   ;01AC73|        |      ;
                       db $FE                               ;01AC7B|        |      ;
 
          CODE_01AC7C: LDY.B #$00                           ;01AC7C|A000    |      ;
                       LDA.W PTR16_01ACD3,X                 ;01AC7E|BDD3AC  |01ACD3;
                       STA.B $00                            ;01AC81|8500    |000000;
                       LDA.W PTR16_01ACD4,X                 ;01AC83|BDD4AC  |01ACD4;
                       STA.B $01                            ;01AC86|8501    |000001;
                       LDX.B r_sceneDrawQueue               ;01AC88|A61D    |00001D;
 
          CODE_01AC8A: LDA.B #$01                           ;01AC8A|A901    |      ;
                       JSR.W CODE_01ACCE                    ;01AC8C|20CEAC  |01ACCE;
                       JSR.W CODE_01ACC6                    ;01AC8F|20C6AC  |01ACC6;
                       JSR.W CODE_01ACC6                    ;01AC92|20C6AC  |01ACC6;
 
          CODE_01AC95: LDA.B #$0F                           ;01AC95|A90F    |      ;
                       JSR.W CODE_01ACCE                    ;01AC97|20CEAC  |01ACCE;
                       LDA.B #$03                           ;01AC9A|A903    |      ;
                       STA.B $02                            ;01AC9C|8502    |000002;
 
          CODE_01AC9E: JSR.W CODE_01ACC6                    ;01AC9E|20C6AC  |01ACC6;
                       DEC.B $02                            ;01ACA1|C602    |000002;
                       BNE CODE_01AC9E                      ;01ACA3|D0F9    |01AC9E;
                       LDA.B ($00),Y                        ;01ACA5|B100    |000000;
                       CMP.B #$FE                           ;01ACA7|C9FE    |      ;
                       BEQ CODE_01ACB9                      ;01ACA9|F00E    |01ACB9;
                       CMP.B #$FF                           ;01ACAB|C9FF    |      ;
                       BEQ CODE_01ACB2                      ;01ACAD|F003    |01ACB2;
                       JMP.W CODE_01AC95                    ;01ACAF|4C95AC  |01AC95;
 
 
          CODE_01ACB2: JSR.W CODE_01ACCE                    ;01ACB2|20CEAC  |01ACCE;
                       INY                                  ;01ACB5|C8      |      ;
                       JMP.W CODE_01AC8A                    ;01ACB6|4C8AAC  |01AC8A;
 
 
          CODE_01ACB9: LDA.B #$FF                           ;01ACB9|A9FF    |      ;
                       JSR.W CODE_01ACCE                    ;01ACBB|20CEAC  |01ACCE;
                       STX.B r_sceneDrawQueue               ;01ACBE|861D    |00001D;
                       LDA.B #$04                           ;01ACC0|A904    |      ;
                       db $20                               ;01ACC2|        |      ;
                       dw screenLoadRoutine                 ;01ACC3|        |0FECE9;
                       RTS                                  ;01ACC5|60      |      ;
 
 
          CODE_01ACC6: LDA.B ($00),Y                        ;01ACC6|B100    |000000;
                       STA.W $0300,X                        ;01ACC8|9D0003  |010300;
                       INX                                  ;01ACCB|E8      |      ;
                       INY                                  ;01ACCC|C8      |      ;
                       RTS                                  ;01ACCD|60      |      ;
 
 
          CODE_01ACCE: STA.W $0300,X                        ;01ACCE|9D0003  |010300;
                       INX                                  ;01ACD1|E8      |      ;
                       RTS                                  ;01ACD2|60      |      ;
 
 
         PTR16_01ACD3: dw DATA8_01ACDD                      ;01ACD3|        |01ACDD;
                       dw DATA8_01AD16                      ;01ACD5|        |01AD16;
                       dw DATA8_01ACF8                      ;01ACD7|        |01ACF8;
                       dw DATA8_01AD07                      ;01ACD9|        |01AD07;
                       dw DATA8_01AD25                      ;01ACDB|        |01AD25;
 
         DATA8_01ACDD: db $00,$3F,$08,$17,$20,$04,$25,$20   ;01ACDD|        |      ;
                       db $08,$28,$20,$0F,$01,$20,$0F,$17   ;01ACE5|        |      ;
                       db $38,$04,$25,$38,$08,$28,$38,$0F   ;01ACED|        |      ;
                       db $01,$38,$FE                       ;01ACF5|        |      ;
 
         DATA8_01ACF8: db $00,$3F,$0F,$0F,$0F,$2C,$1B,$30   ;01ACF8|        |      ;
                       db $0F,$0F,$0F,$0F,$0F,$0F,$FE       ;01AD00|        |      ;
 
         DATA8_01AD07: db $00,$3F,$0F,$0F,$0F,$0F,$0F,$0F   ;01AD07|        |      ;
                       db $2C,$1B,$30,$0F,$0F,$0F,$FE       ;01AD0F|        |      ;
 
         DATA8_01AD16: db $00,$3F,$0F,$0F,$0F,$0F,$0F,$0F   ;01AD16|        |      ;
                       db $0F,$0F,$0F,$2C,$1B,$30,$FE       ;01AD1E|        |      ;
 
         DATA8_01AD25: db $00,$3F,$0F,$0F,$0F,$0F,$0F,$0F   ;01AD25|        |      ;
                       db $0F,$0F,$0F,$0F,$0F,$0F,$FE       ;01AD2D|        |      ;
 
         DATA8_01AD34: db $A2,$00                           ;01AD34|        |      ;
 
         DATA8_01AD36: db $BD,$4E,$05,$F0,$0F,$0A,$A8       ;01AD36|        |      ;
                       LDA.W PTR16_01AD50,Y                 ;01AD3D|B950AD  |01AD50;
                       STA.B $00                            ;01AD40|8500    |000000;
                       LDA.W PTR16_01AD51,Y                 ;01AD42|B951AD  |01AD51;
                       STA.B $01                            ;01AD45|8501    |000001;
                       JSR.W CODE_01A7E0                    ;01AD47|20E0A7  |01A7E0;
                       INX                                  ;01AD4A|E8      |      ;
                       CPX.B #$12                           ;01AD4B|E012    |      ;
                       BNE DATA8_01AD36                     ;01AD4D|D0E7    |01AD36;
                       RTS                                  ;01AD4F|60      |      ;
 
 
         PTR16_01AD50: dw CODE_01AD56                       ;01AD50|        |01AD56;
                       dw CODE_01AE05                       ;01AD52|        |01AE05;
                       dw CODE_01AD57                       ;01AD54|        |01AD57;
 
          CODE_01AD56: RTS                                  ;01AD56|60      |      ;
 
 
          CODE_01AD57: LDA.B #$00                           ;01AD57|A900    |      ;
                       STA.B r_index                        ;01AD59|8510    |000010;
                       LDA.W $05D8,X                        ;01AD5B|BDD805  |0105D8;
                       BEQ CODE_01AD64                      ;01AD5E|F004    |01AD64;
                       DEC.W $05D8,X                        ;01AD60|DED805  |0105D8;
                       RTS                                  ;01AD63|60      |      ;
 
 
          CODE_01AD64: LDA.W $07F0                          ;01AD64|ADF007  |0107F0;
                       ASL A                                ;01AD67|0A      |      ;
                       TAY                                  ;01AD68|A8      |      ;
                       LDA.W DATA8_01ADD8,Y                 ;01AD69|B9D8AD  |01ADD8;
                       BEQ CODE_01ADBB                      ;01AD6C|F04D    |01ADBB;
                       CMP.B #$FF                           ;01AD6E|C9FF    |      ;
                       BNE CODE_01AD82                      ;01AD70|D010    |01AD82;
                       LDA.B #$01                           ;01AD72|A901    |      ;
                       STA.B r_index                        ;01AD74|8510    |000010;
                       LDA.B #$00                           ;01AD76|A900    |      ;
                       STA.W $054E,X                        ;01AD78|9D4E05  |01054E;
                       STA.W $0400,X                        ;01AD7B|9D0004  |010400;
                       STA.W $048C,X                        ;01AD7E|9D8C04  |01048C;
                       RTS                                  ;01AD81|60      |      ;
 
 
          CODE_01AD82: CMP.B #$04                           ;01AD82|C904    |      ;
                       BCC CODE_01AD9B                      ;01AD84|9015    |01AD9B;
                       SEC                                  ;01AD86|38      |      ;
                       SBC.B #$04                           ;01AD87|E904    |      ;
                       PHA                                  ;01AD89|48      |      ;
                       JSR.W CODE_01ADC9                    ;01AD8A|20C9AD  |01ADC9;
                       PLA                                  ;01AD8D|68      |      ;
                       STX.B r_collisionPointXvalDiv32      ;01AD8E|8612    |000012;
                       TAX                                  ;01AD90|AA      |      ;
                       INX                                  ;01AD91|E8      |      ;
                       TXA                                  ;01AD92|8A      |      ;
                       ASL A                                ;01AD93|0A      |      ;
                       TAX                                  ;01AD94|AA      |      ;
                       JSR.W CODE_01AC7C                    ;01AD95|207CAC  |01AC7C;
                       LDX.B r_collisionPointXvalDiv32      ;01AD98|A612    |000012;
                       RTS                                  ;01AD9A|60      |      ;
 
 
          CODE_01AD9B: SEC                                  ;01AD9B|38      |      ;
                       SBC.B #$01                           ;01AD9C|E901    |      ;
                       PHA                                  ;01AD9E|48      |      ;
                       JSR.W CODE_01ADC9                    ;01AD9F|20C9AD  |01ADC9;
                       PLA                                  ;01ADA2|68      |      ;
                       TAY                                  ;01ADA3|A8      |      ;
                       LDA.W DATA8_01ADFF,Y                 ;01ADA4|B9FFAD  |01ADFF;
                       STA.W $0438,X                        ;01ADA7|9D3804  |010438;
                       LDA.W DATA8_01AE02,Y                 ;01ADAA|B902AE  |01AE02;
                       STA.W $041C,X                        ;01ADAD|9D1C04  |01041C;
                       AND.B #$40                           ;01ADB0|2940    |      ;
                       STA.W $0470,X                        ;01ADB2|9D7004  |010470;
                       LDA.B #$2E                           ;01ADB5|A92E    |      ;
                       db $20                               ;01ADB7|        |      ;
                       dw initFreezWaterEffect_01           ;01ADB8|        |0FE25F;
                       RTS                                  ;01ADBA|60      |      ;
 
 
          CODE_01ADBB: STX.B r_collisionPointXvalDiv32      ;01ADBB|8612    |000012;
                       LDX.B #$08                           ;01ADBD|A208    |      ;
                       JSR.W CODE_01AC7C                    ;01ADBF|207CAC  |01AC7C;
                       LDX.B r_collisionPointXvalDiv32      ;01ADC2|A612    |000012;
                       LDA.B #$80                           ;01ADC4|A980    |      ;
                       STA.W $0470,X                        ;01ADC6|9D7004  |010470;
 
          CODE_01ADC9: LDA.W $07F0                          ;01ADC9|ADF007  |0107F0;
                       ASL A                                ;01ADCC|0A      |      ;
                       TAY                                  ;01ADCD|A8      |      ;
                       LDA.W DATA8_01ADD9,Y                 ;01ADCE|B9D9AD  |01ADD9;
                       STA.W $05D8,X                        ;01ADD1|9DD805  |0105D8;
                       INC.W $07F0                          ;01ADD4|EEF007  |0107F0;
                       RTS                                  ;01ADD7|60      |      ;
 
 
         DATA8_01ADD8: db $00                               ;01ADD8|        |      ;
 
         DATA8_01ADD9: db $10,$01,$02,$00,$02,$04,$02,$01   ;01ADD9|        |      ;
                       db $02,$00,$02,$00,$20,$02,$02,$00   ;01ADE1|        |      ;
                       db $02,$05,$02,$02,$02,$00,$02,$00   ;01ADE9|        |      ;
                       db $20,$03,$02,$00,$02,$06,$02,$03   ;01ADF1|        |      ;
                       db $02,$00,$02,$00,$30,$FF           ;01ADF9|        |      ;
 
         DATA8_01ADFF: db $C0,$40,$80                       ;01ADFF|        |      ;
 
         DATA8_01AE02: db $60,$68,$50                       ;01AE02|        |      ;
 
          CODE_01AE05: LDA.W $04DB,X                        ;01AE05|BDDB04  |0104DB;
                       SEC                                  ;01AE08|38      |      ;
                       SBC.B #$00                           ;01AE09|E900    |      ;
                       STA.W $04DB,X                        ;01AE0B|9DDB04  |0104DB;
                       LDA.W $041C,X                        ;01AE0E|BD1C04  |01041C;
                       SBC.B #$04                           ;01AE11|E904    |      ;
                       STA.W $041C,X                        ;01AE13|9D1C04  |01041C;
                       BCS CODE_01AE24                      ;01AE16|B00C    |01AE24;
                       LDA.W $0470,X                        ;01AE18|BD7004  |010470;
                       AND.B #$01                           ;01AE1B|2901    |      ;
                       BEQ CODE_01AE24                      ;01AE1D|F005    |01AE24;
                       LDA.B #$40                           ;01AE1F|A940    |      ;
                       STA.W $0470,X                        ;01AE21|9D7004  |010470;
 
          CODE_01AE24: LDA.W $07EC                          ;01AE24|ADEC07  |0107EC;
                       CMP.B #$1F                           ;01AE27|C91F    |      ;
                       BEQ CODE_01AE55                      ;01AE29|F02A    |01AE55;
                       CMP.B #$08                           ;01AE2B|C908    |      ;
                       BNE CODE_01AE4A                      ;01AE2D|D01B    |01AE4A;
                       LDA.W $0438,X                        ;01AE2F|BD3804  |010438;
                       BMI CODE_01AE4A                      ;01AE32|3016    |01AE4A;
                       LDA.W $041C,X                        ;01AE34|BD1C04  |01041C;
                       CMP.B #$08                           ;01AE37|C908    |      ;
                       BCC CODE_01AE4A                      ;01AE39|900F    |01AE4A;
                       CMP.B #$68                           ;01AE3B|C968    |      ;
                       BCS CODE_01AE4A                      ;01AE3D|B00B    |01AE4A;
                       LDA.B #$14                           ;01AE3F|A914    |      ;
                       STA.W $048C,X                        ;01AE41|9D8C04  |01048C;
                       LDA.B #$12                           ;01AE44|A912    |      ;
                       STA.W $0400,X                        ;01AE46|9D0004  |010400;
                       RTS                                  ;01AE49|60      |      ;
 
 
          CODE_01AE4A: LDA.B #$14                           ;01AE4A|A914    |      ;
                       STA.W $048C,X                        ;01AE4C|9D8C04  |01048C;
                       LDA.B #$10                           ;01AE4F|A910    |      ;
                       STA.W $0400,X                        ;01AE51|9D0004  |010400;
                       RTS                                  ;01AE54|60      |      ;
 
 
          CODE_01AE55: INC.B r_coreLoadingFuncAddr          ;01AE55|E616    |000016;
                       LDA.W $041C,X                        ;01AE57|BD1C04  |01041C;
                       CMP.B #$04                           ;01AE5A|C904    |      ;
                       BCC CODE_01AE63                      ;01AE5C|9005    |01AE63;
                       CMP.B #$FC                           ;01AE5E|C9FC    |      ;
                       BCS CODE_01AE63                      ;01AE60|B001    |01AE63;
                       RTS                                  ;01AE62|60      |      ;
 
 
          CODE_01AE63: LDA.B #$00                           ;01AE63|A900    |      ;
                       STA.W $054E,X                        ;01AE65|9D4E05  |01054E;
                       STA.W $0400,X                        ;01AE68|9D0004  |010400;
                       STA.W $048C,X                        ;01AE6B|9D8C04  |01048C;
                       RTS                                  ;01AE6E|60      |      ;
 
 
          CODE_01AE6F: LDA.W $0780                          ;01AE6F|AD8007  |010780;
                       CLC                                  ;01AE72|18      |      ;
                       ADC.W $0782                          ;01AE73|6D8207  |010782;
                       STA.W $0782                          ;01AE76|8D8207  |010782;
                       LDA.W $0781                          ;01AE79|AD8107  |010781;
                       ADC.B r_ScrollY                      ;01AE7C|65FC    |0000FC;
                       CMP.B #$F0                           ;01AE7E|C9F0    |      ;
                       BCC CODE_01AE85                      ;01AE80|9003    |01AE85;
                       CLC                                  ;01AE82|18      |      ;
                       ADC.B #$10                           ;01AE83|6910    |      ;
 
          CODE_01AE85: STA.B r_ScrollY                      ;01AE85|85FC    |0000FC;
                       RTS                                  ;01AE87|60      |      ;
 
 
          CODE_01AE88: LDA.B #$50                           ;01AE88|A950    |      ;
                       STA.B r_updateNametable              ;01AE8A|8525    |000025;
                       RTS                                  ;01AE8C|60      |      ;
 
 
          CODE_01AE8D: LDA.W $07ED                          ;01AE8D|ADED07  |0107ED;
                       ORA.W $07EE                          ;01AE90|0DEE07  |0107EE;
                       BEQ CODE_01AEA1                      ;01AE93|F00C    |01AEA1;
                       DEC.W $07ED                          ;01AE95|CEED07  |0107ED;
                       LDY.W $07ED                          ;01AE98|ACED07  |0107ED;
                       INY                                  ;01AE9B|C8      |      ;
                       BNE CODE_01AEA1                      ;01AE9C|D003    |01AEA1;
                       DEC.W $07EE                          ;01AE9E|CEEE07  |0107EE;
 
          CODE_01AEA1: RTS                                  ;01AEA1|60      |      ;
 
 
          CODE_01AEA2: LDA.W $07EF                          ;01AEA2|ADEF07  |0107EF;
                       ASL A                                ;01AEA5|0A      |      ;
                       ASL A                                ;01AEA6|0A      |      ;
                       ASL A                                ;01AEA7|0A      |      ;
                       ASL A                                ;01AEA8|0A      |      ;
                       STA.B $04                            ;01AEA9|8504    |000004;
                       LDA.W PTR16_01AF00,X                 ;01AEAB|BD00AF  |01AF00;
                       STA.B $00                            ;01AEAE|8500    |000000;
                       LDA.W PTR16_01AF01,X                 ;01AEB0|BD01AF  |01AF01;
                       STA.B $01                            ;01AEB3|8501    |000001;
                       LDX.B r_sceneDrawQueue               ;01AEB5|A61D    |00001D;
                       LDY.B #$00                           ;01AEB7|A000    |      ;
                       LDA.B #$01                           ;01AEB9|A901    |      ;
                       JSR.W CODE_01ACCE                    ;01AEBB|20CEAC  |01ACCE;
                       JSR.W CODE_01ACC6                    ;01AEBE|20C6AC  |01ACC6;
                       JSR.W CODE_01ACC6                    ;01AEC1|20C6AC  |01ACC6;
 
          CODE_01AEC4: LDA.B #$0F                           ;01AEC4|A90F    |      ;
                       JSR.W CODE_01ACCE                    ;01AEC6|20CEAC  |01ACCE;
                       LDA.B #$03                           ;01AEC9|A903    |      ;
                       STA.B $02                            ;01AECB|8502    |000002;
 
          CODE_01AECD: LDA.B $04                            ;01AECD|A504    |000004;
                       BNE CODE_01AED5                      ;01AECF|D004    |01AED5;
                       LDA.B #$0F                           ;01AED1|A90F    |      ;
                       BNE CODE_01AEE7                      ;01AED3|D012    |01AEE7;
 
          CODE_01AED5: LDA.B ($00),Y                        ;01AED5|B100    |000000;
                       AND.B #$0F                           ;01AED7|290F    |      ;
                       STA.B $03                            ;01AED9|8503    |000003;
                       LDA.B ($00),Y                        ;01AEDB|B100    |000000;
                       AND.B #$F0                           ;01AEDD|29F0    |      ;
                       CMP.B $04                            ;01AEDF|C504    |000004;
                       BCC CODE_01AEE5                      ;01AEE1|9002    |01AEE5;
                       LDA.B $04                            ;01AEE3|A504    |000004;
 
          CODE_01AEE5: ORA.B $03                            ;01AEE5|0503    |000003;
 
          CODE_01AEE7: JSR.W CODE_01ACCE                    ;01AEE7|20CEAC  |01ACCE;
                       INY                                  ;01AEEA|C8      |      ;
                       DEC.B $02                            ;01AEEB|C602    |000002;
                       BNE CODE_01AECD                      ;01AEED|D0DE    |01AECD;
                       LDA.B ($00),Y                        ;01AEEF|B100    |000000;
                       CMP.B #$FF                           ;01AEF1|C9FF    |      ;
                       BNE CODE_01AEC4                      ;01AEF3|D0CF    |01AEC4;
                       JSR.W CODE_01ACCE                    ;01AEF5|20CEAC  |01ACCE;
                       STX.B r_sceneDrawQueue               ;01AEF8|861D    |00001D;
                       LDA.B #$04                           ;01AEFA|A904    |      ;
                       db $20                               ;01AEFC|        |      ;
                       dw screenLoadRoutine                 ;01AEFD|        |0FECE9;
                       RTS                                  ;01AEFF|60      |      ;
 
 
         PTR16_01AF00: dw DATA8_01AF04                      ;01AF00|        |01AF04;
                       dw DATA8_01AF13                      ;01AF02|        |01AF13;
 
         DATA8_01AF04: db $00,$3F,$08,$17,$20,$04,$25,$20   ;01AF04|        |      ;
                       db $08,$28,$20,$0F,$01,$20,$FF       ;01AF0C|        |      ;
 
         DATA8_01AF13: db $00,$3F,$16,$05,$20,$13,$02,$20   ;01AF13|        |      ;
                       db $14,$03,$3B,$16,$27,$10,$FF       ;01AF1B|        |      ;
 
          CODE_01AF22: LDA.B #$00                           ;01AF22|A900    |      ;
                       STA.B $00                            ;01AF24|8500    |000000;
                       LDA.W $0780                          ;01AF26|AD8007  |010780;
                       CLC                                  ;01AF29|18      |      ;
                       ADC.W $0782                          ;01AF2A|6D8207  |010782;
                       STA.W $0782                          ;01AF2D|8D8207  |010782;
 
          CODE_01AF30: BCC CODE_01AF36                      ;01AF30|9004    |01AF36;
                       LDA.B #$01                           ;01AF32|A901    |      ;
                       STA.B $00                            ;01AF34|8500    |000000;
 
          CODE_01AF36: LDA.W $0781                          ;01AF36|AD8107  |010781;
                       ADC.B r_ScrollY                      ;01AF39|65FC    |0000FC;
                       CMP.B #$F0                           ;01AF3B|C9F0    |      ;
                       BCC CODE_01AF4B                      ;01AF3D|900C    |01AF4B;
                       CLC                                  ;01AF3F|18      |      ;
                       ADC.B #$10                           ;01AF40|6910    |      ;
                       STA.B r_ScrollY                      ;01AF42|85FC    |0000FC;
                       LDA.B r_PPUCtrl                      ;01AF44|A5FF    |0000FF;
                       EOR.B #$02                           ;01AF46|4902    |      ;
                       STA.B r_PPUCtrl                      ;01AF48|85FF    |0000FF;
                       RTS                                  ;01AF4A|60      |      ;
 
 
          CODE_01AF4B: STA.B r_ScrollY                      ;01AF4B|85FC    |0000FC;
                       CLC                                  ;01AF4D|18      |      ;
                       LDA.B $00                            ;01AF4E|A500    |000000;
                       BEQ CODE_01AF53                      ;01AF50|F001    |01AF53;
                       SEC                                  ;01AF52|38      |      ;
 
          CODE_01AF53: LDA.W $0781                          ;01AF53|AD8107  |010781;
                       ADC.W $0788                          ;01AF56|6D8807  |010788;
                       STA.W $0788                          ;01AF59|8D8807  |010788;
                       LDA.W $0787                          ;01AF5C|AD8707  |010787;
                       ADC.B #$00                           ;01AF5F|6900    |      ;
                       STA.W $0787                          ;01AF61|8D8707  |010787;
                       RTS                                  ;01AF64|60      |      ;
 
 
          CODE_01AF65: LDA.B r_gameSubstate                 ;01AF65|A519    |000019;
                       db $20                               ;01AF67|        |      ;
                       dw jumpFromStackYXpreserved          ;01AF68|        |0FE86D;
                       STY.B r_delayElevators               ;01AF6A|84AF    |0000AF;
                       LDY.B r_delayElevators               ;01AF6C|A4AF    |0000AF;
                       CMP.B (r_delayElevators,X)           ;01AF6E|C1AF    |0000AF;
                       CPX.B #$AF                           ;01AF70|E0AF    |      ;
                       PEA.W $11AF                          ;01AF72|F4AF11  |0111AF;
                       BCS CODE_01AF30                      ;01AF75|B0B9    |01AF30;
                       LDA.B ($D8)                          ;01AF77|B2D8    |0000D8;
                       LDA.B ($00)                          ;01AF79|B200    |000000;
                       LDA.B ($51,S),Y                      ;01AF7B|B351    |000051;
                       LDA.B (r_roomOrientation,S),Y        ;01AF7D|B368    |000068;
                       LDA.B (r_TerrainPresent,S),Y         ;01AF7F|B396    |000096;
                       LDA.B (r_damagePlayer,S),Y           ;01AF81|B381    |000081;
                       LDA.B (r_collisionValIsForRightHalfOf32x16block,S),Y;01AF83|B3A5    |0000A5;
                       ORA.W $0830,Y                        ;01AF85|193008  |010830;
                       LDA.B #$03                           ;01AF88|A903    |      ;
                       STA.B r_counter_ShowSprBg            ;01AF8A|851C    |00001C;
                       LDA.B #$80                           ;01AF8C|A980    |      ;
                       STA.B r_gameSubstate                 ;01AF8E|8519    |000019;
                       db $20                               ;01AF90|        |      ;
                       dw setNameTableMapping_E4            ;01AF91|        |0FEBFD;
                       LDA.B #$44                           ;01AF93|A944    |      ;
                       STA.B r_updateNametable              ;01AF95|8525    |000025;
                       STA.W $5105                          ;01AF97|8D0551  |015105;
                       LDA.B #$62                           ;01AF9A|A962    |      ;
                       db $20                               ;01AF9C|        |      ;
                       dw initFreezWaterEffect_01           ;01AF9D|        |0FE25F;
                       LDA.B #$01                           ;01AF9F|A901    |      ;
                       STA.B r_gameSubstate                 ;01AFA1|8519    |000019;
                       RTS                                  ;01AFA3|60      |      ;
 
                       JSR.W CODE_01B625                    ;01AFA4|2025B6  |01B625;
                       LDX.B #$18                           ;01AFA7|A218    |      ;
                       db $20                               ;01AFA9|        |      ;
                       dw loadCompressedTilemap2GFX         ;01AFAA|        |0FEC04;
                       LDY.B #$00                           ;01AFAC|A000    |      ;
                       JSR.W CODE_01B28D                    ;01AFAE|208DB2  |01B28D;
                       db $20                               ;01AFB1|        |      ;
                       dw initBoss_00                       ;01AFB2|        |0FE2D6;
                       JSR.W CODE_01B1C7                    ;01AFB4|20C7B1  |01B1C7;
                       JSR.W CODE_01B066                    ;01AFB7|2066B0  |01B066;
                       LDA.B #$03                           ;01AFBA|A903    |      ;
                       STA.B r_counter_ShowSprBg            ;01AFBC|851C    |00001C;
                       INC.B r_gameSubstate                 ;01AFBE|E619    |000019;
                       RTS                                  ;01AFC0|60      |      ;
 
                       LDA.B r_sceneDrawQueue               ;01AFC1|A51D    |00001D;
                       STA.B r_15                           ;01AFC3|8515    |000015;
                       JSR.W CODE_01B598                    ;01AFC5|2098B5  |01B598;
                       db $20                               ;01AFC8|        |      ;
                       dw UNREACH_0FFBA4                    ;01AFC9|        |0FFBA4;
                       LDA.B $B4                            ;01AFCB|A5B4    |0000B4;
                       CMP.B #$FF                           ;01AFCD|C9FF    |      ;
                       BNE CODE_01AFDF                      ;01AFCF|D00E    |01AFDF;
                       LDA.B #$00                           ;01AFD1|A900    |      ;
                       LDX.B r_15                           ;01AFD3|A615    |000015;
                       STA.W $0300,X                        ;01AFD5|9D0003  |010300;
                       STX.B r_sceneDrawQueue               ;01AFD8|861D    |00001D;
                       JSR.W CODE_01B675                    ;01AFDA|2075B6  |01B675;
                       INC.B r_gameSubstate                 ;01AFDD|E619    |000019;
 
          CODE_01AFDF: RTS                                  ;01AFDF|60      |      ;
 
                       JSR.W CODE_01B06E                    ;01AFE0|206EB0  |01B06E;
                       LDA.B r_curJoyPe1                    ;01AFE3|A526    |000026;
                       AND.B #$10                           ;01AFE5|2910    |      ;
                       BNE CODE_01AFED                      ;01AFE7|D004    |01AFED;
                       LDA.B $2D                            ;01AFE9|A52D    |00002D;
                       BEQ CODE_01B006                      ;01AFEB|F019    |01B006;
 
          CODE_01AFED: LDY.B #$00                           ;01AFED|A000    |      ;
                       STY.B $2D                            ;01AFEF|842D    |00002D;
                       INC.B r_gameSubstate                 ;01AFF1|E619    |000019;
                       RTS                                  ;01AFF3|60      |      ;
 
                       LDY.B r_menuSelectIdx                ;01AFF4|A46B    |00006B;
                       BNE CODE_01B007                      ;01AFF6|D00F    |01B007;
                       LDA.B #$07                           ;01AFF8|A907    |      ;
                       STA.W $0160                          ;01AFFA|8D6001  |010160;
                       JSR.W CODE_01B066                    ;01AFFD|2066B0  |01B066;
                       LDA.B #$78                           ;01B000|A978    |      ;
                       STA.B r_timerGenerel                 ;01B002|8530    |000030;
                       INC.B r_gameSubstate                 ;01B004|E619    |000019;
 
          CODE_01B006: RTS                                  ;01B006|60      |      ;
 
 
          CODE_01B007: INC.B r_gameSubstate                 ;01B007|E619    |000019;
                       JMP.W CODE_01B066                    ;01B009|4C66B0  |01B066;
 
                       LDA.B #$02                           ;01B00C|A902    |      ;
                       STA.B r_gameSubstate                 ;01B00E|8519    |000019;
                       RTS                                  ;01B010|60      |      ;
 
                       JSR.W CODE_01B17A                    ;01B011|207AB1  |01B17A;
                       LDA.B #$00                           ;01B014|A900    |      ;
                       STA.W $0401                          ;01B016|8D0104  |010401;
                       LDA.B r_menuSelectIdx                ;01B019|A56B    |00006B;
                       BNE CODE_01B047                      ;01B01B|D02A    |01B047;
                       DEC.B r_timerGenerel                 ;01B01D|C630    |000030;
                       BEQ CODE_01B050                      ;01B01F|F02F    |01B050;
                       LDA.B $B4                            ;01B021|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B023|C9FF    |      ;
                       BEQ CODE_01B05C                      ;01B025|F035    |01B05C;
                       LDA.B r_timerGenerel                 ;01B027|A530    |000030;
                       CMP.B #$30                           ;01B029|C930    |      ;
                       BCS CODE_01B05C                      ;01B02B|B02F    |01B05C;
 
          CODE_01B02D: LDA.B r_sceneDrawQueue               ;01B02D|A51D    |00001D;
                       STA.B r_15                           ;01B02F|8515    |000015;
                       JSR.W CODE_01B598                    ;01B031|2098B5  |01B598;
                       db $20                               ;01B034|        |      ;
                       dw UNREACH_0FFBAF                    ;01B035|        |0FFBAF;
                       LDA.B $B4                            ;01B037|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B039|C9FF    |      ;
                       BNE CODE_01B05C                      ;01B03B|D01F    |01B05C;
                       LDA.B #$00                           ;01B03D|A900    |      ;
                       LDX.B r_15                           ;01B03F|A615    |000015;
                       STA.W $0300,X                        ;01B041|9D0003  |010300;
                       STX.B r_sceneDrawQueue               ;01B044|861D    |00001D;
                       RTS                                  ;01B046|60      |      ;
 
 
          CODE_01B047: JSR.W CODE_01B02D                    ;01B047|202DB0  |01B02D;
                       LDA.B $B4                            ;01B04A|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B04C|C9FF    |      ;
                       BNE CODE_01B05C                      ;01B04E|D00C    |01B05C;
 
          CODE_01B050: LDA.B #$00                           ;01B050|A900    |      ;
                       STA.B $2D                            ;01B052|852D    |00002D;
                       LDA.B r_menuSelectIdx                ;01B054|A56B    |00006B;
                       BEQ CODE_01B05D                      ;01B056|F005    |01B05D;
                       LDA.B #$06                           ;01B058|A906    |      ;
                       STA.B r_gameSubstate                 ;01B05A|8519    |000019;
 
          CODE_01B05C: RTS                                  ;01B05C|60      |      ;
 
 
          CODE_01B05D: LDA.B #$FF                           ;01B05D|A9FF    |      ;
                       STA.B r_partner                      ;01B05F|853A    |00003A;
                       LDA.B #$09                           ;01B061|A909    |      ;
                       db $4C                               ;01B063|        |      ;
 
                       dw CODE_0FE574                       ;01B064|        |0FE574;
 
          CODE_01B066: LDY.B #$00                           ;01B066|A000    |      ;
                       STY.B $B4                            ;01B068|84B4    |0000B4;
                       INY                                  ;01B06A|C8      |      ;
                       STY.B $B5                            ;01B06B|84B5    |0000B5;
                       RTS                                  ;01B06D|60      |      ;
 
 
          CODE_01B06E: JSR.W RAM780_func                    ;01B06E|207AB0  |01B07A;
                       JSR.W CODE_01B17A                    ;01B071|207AB1  |01B17A;
                       JSR.W CODE_01B1DC                    ;01B074|20DCB1  |01B1DC;
                       JMP.W CODE_01B14E                    ;01B077|4C4EB1  |01B14E;
 
 
          RAM780_func: LDX.B #$00                           ;01B07A|A200    |      ;
                       JSR.W CODE_01B0CC                    ;01B07C|20CCB0  |01B0CC;
                       JSR.W CODE_01B082                    ;01B07F|2082B0  |01B082;
 
          CODE_01B082: LDA.W $0781                          ;01B082|AD8107  |010781;
                       CMP.B #$03                           ;01B085|C903    |      ;
                       BCC CODE_01B0C5                      ;01B087|903C    |01B0C5;
                       LDA.B r_index                        ;01B089|A510    |000010;
                       AND.B #$0C                           ;01B08B|290C    |      ;
                       BEQ CODE_01B0AA                      ;01B08D|F01B    |01B0AA;
                       LDY.W $0780                          ;01B08F|AC8007  |010780;
                       LDA.W DATA8_01B275,Y                 ;01B092|B975B2  |01B275;
                       CMP.B #$FC                           ;01B095|C9FC    |      ;
                       BNE CODE_01B0AA                      ;01B097|D011    |01B0AA;
                       LDA.B #$02                           ;01B099|A902    |      ;
                       CPY.B #$03                           ;01B09B|C003    |      ;
                       BEQ CODE_01B0A7                      ;01B09D|F008    |01B0A7;
                       LDA.B #$05                           ;01B09F|A905    |      ;
                       CPY.B #$04                           ;01B0A1|C004    |      ;
                       BEQ CODE_01B0A7                      ;01B0A3|F002    |01B0A7;
                       LDA.B #$08                           ;01B0A5|A908    |      ;
 
          CODE_01B0A7: STA.W $0780                          ;01B0A7|8D8007  |010780;
 
          CODE_01B0AA: LDA.B r_index                        ;01B0AA|A510    |000010;
                       AND.B #$03                           ;01B0AC|2903    |      ;
                       BEQ CODE_01B0C5                      ;01B0AE|F015    |01B0C5;
                       TAX                                  ;01B0B0|AA      |      ;
                       LDY.W $0780                          ;01B0B1|AC8007  |010780;
                       LDA.W DATA8_01B275,Y                 ;01B0B4|B975B2  |01B275;
                       CMP.B #$FC                           ;01B0B7|C9FC    |      ;
                       BNE CODE_01B0C5                      ;01B0B9|D00A    |01B0C5;
                       LDA.W DATA8_01B0C6,X                 ;01B0BB|BDC6B0  |01B0C6;
                       CLC                                  ;01B0BE|18      |      ;
                       ADC.W $0780                          ;01B0BF|6D8007  |010780;
                       STA.W $0780                          ;01B0C2|8D8007  |010780;
 
          CODE_01B0C5: RTS                                  ;01B0C5|60      |      ;
 
 
         DATA8_01B0C6: db $00,$01,$FF,$01                   ;01B0C6|        |      ;
 
          CODE_01B0CA: LDX.B #$01                           ;01B0CA|A201    |      ;
 
          CODE_01B0CC: JSR.W CODE_01B12B                    ;01B0CC|202BB1  |01B12B;
                       STA.B $00                            ;01B0CF|8500    |000000;
                       AND.B #$0F                           ;01B0D1|290F    |      ;
                       BEQ CODE_01B0DA                      ;01B0D3|F005    |01B0DA;
                       LDA.B #$1A                           ;01B0D5|A91A    |      ;
                       db $20                               ;01B0D7|        |      ;
                       dw initFreezWaterEffect_01           ;01B0D8|        |0FE25F;
 
          CODE_01B0DA: LSR.B $00                            ;01B0DA|4600    |000000;
                       BCC CODE_01B0ED                      ;01B0DC|900F    |01B0ED;
                       LDA.W $0780                          ;01B0DE|AD8007  |010780;
                       ADC.B #$00                           ;01B0E1|6900    |      ;
                       CMP.W DATA8_01B127,X                 ;01B0E3|DD27B1  |01B127;
                       BCC CODE_01B0EA                      ;01B0E6|9002    |01B0EA;
                       LDA.B #$00                           ;01B0E8|A900    |      ;
 
          CODE_01B0EA: STA.W $0780                          ;01B0EA|8D8007  |010780;
 
          CODE_01B0ED: LSR.B $00                            ;01B0ED|4600    |000000;
                       BCC CODE_01B100                      ;01B0EF|900F    |01B100;
                       LDA.W $0780                          ;01B0F1|AD8007  |010780;
                       SBC.B #$01                           ;01B0F4|E901    |      ;
                       BPL CODE_01B0FD                      ;01B0F6|1005    |01B0FD;
                       LDY.W DATA8_01B127,X                 ;01B0F8|BC27B1  |01B127;
                       DEY                                  ;01B0FB|88      |      ;
                       TYA                                  ;01B0FC|98      |      ;
 
          CODE_01B0FD: STA.W $0780                          ;01B0FD|8D8007  |010780;
 
          CODE_01B100: LSR.B $00                            ;01B100|4600    |000000;
                       BCC CODE_01B113                      ;01B102|900F    |01B113;
                       LDA.W $0781                          ;01B104|AD8107  |010781;
                       ADC.B #$00                           ;01B107|6900    |      ;
                       CMP.W DATA8_01B129,X                 ;01B109|DD29B1  |01B129;
                       BCC CODE_01B110                      ;01B10C|9002    |01B110;
                       LDA.B #$00                           ;01B10E|A900    |      ;
 
          CODE_01B110: STA.W $0781                          ;01B110|8D8107  |010781;
 
          CODE_01B113: LSR.B $00                            ;01B113|4600    |000000;
                       BCC CODE_01B126                      ;01B115|900F    |01B126;
                       LDA.W $0781                          ;01B117|AD8107  |010781;
                       SBC.B #$01                           ;01B11A|E901    |      ;
                       BPL CODE_01B123                      ;01B11C|1005    |01B123;
                       LDY.W DATA8_01B129,X                 ;01B11E|BC29B1  |01B129;
                       DEY                                  ;01B121|88      |      ;
                       TYA                                  ;01B122|98      |      ;
 
          CODE_01B123: STA.W $0781                          ;01B123|8D8107  |010781;
 
          CODE_01B126: RTS                                  ;01B126|60      |      ;
 
 
         DATA8_01B127: db $09,$04                           ;01B127|        |      ;
 
         DATA8_01B129: db $04,$04                           ;01B129|        |      ;
 
          CODE_01B12B: CPX.B #$01                           ;01B12B|E001    |      ;
                       BCS CODE_01B149                      ;01B12D|B01A    |01B149;
                       CLC                                  ;01B12F|18      |      ;
                       LDY.B #$00                           ;01B130|A000    |      ;
                       LDA.B r_Joy1Pe                       ;01B132|A528    |000028;
                       AND.B #$0F                           ;01B134|290F    |      ;
                       BEQ CODE_01B142                      ;01B136|F00A    |01B142;
                       LDY.W $07B0                          ;01B138|ACB007  |0107B0;
                       INY                                  ;01B13B|C8      |      ;
                       CPY.B #$0E                           ;01B13C|C00E    |      ;
                       BCC CODE_01B142                      ;01B13E|9002    |01B142;
                       LDY.B #$00                           ;01B140|A000    |      ;
 
          CODE_01B142: STY.W $07B0                          ;01B142|8CB007  |0107B0;
                       LDA.B r_Joy1Pe                       ;01B145|A528    |000028;
                       BCS CODE_01B14B                      ;01B147|B002    |01B14B;
 
          CODE_01B149: LDA.B r_curJoyPe1                    ;01B149|A526    |000026;
 
          CODE_01B14B: STA.B r_index                        ;01B14B|8510    |000010;
                       RTS                                  ;01B14D|60      |      ;
 
 
          CODE_01B14E: LDY.B #$01                           ;01B14E|A001    |      ;
                       LDX.B #$01                           ;01B150|A201    |      ;
                       LDA.B r_gameStateLoopCounter         ;01B152|A51A    |00001A;
                       AND.B #$10                           ;01B154|2910    |      ;
                       BEQ CODE_01B174                      ;01B156|F01C    |01B174;
                       LDA.W $0785                          ;01B158|AD8507  |010785;
                       CLC                                  ;01B15B|18      |      ;
                       ADC.B #$47                           ;01B15C|6947    |      ;
                       STA.B $00                            ;01B15E|8500    |000000;
                       LDA.W $0784                          ;01B160|AD8407  |010784;
                       ASL A                                ;01B163|0A      |      ;
                       ASL A                                ;01B164|0A      |      ;
                       ASL A                                ;01B165|0A      |      ;
                       CLC                                  ;01B166|18      |      ;
                       ADC.B #$60                           ;01B167|6960    |      ;
                       STA.B $01                            ;01B169|8501    |000001;
                       JSR.W CODE_01B1AC                    ;01B16B|20ACB1  |01B1AC;
                       LDA.B #$F6                           ;01B16E|A9F6    |      ;
                       STA.W $0400,X                        ;01B170|9D0004  |010400;
                       RTS                                  ;01B173|60      |      ;
 
 
          CODE_01B174: LDA.B #$00                           ;01B174|A900    |      ;
                       STA.W $0400,X                        ;01B176|9D0004  |010400;
                       RTS                                  ;01B179|60      |      ;
 
 
          CODE_01B17A: JSR.W CODE_01B190                    ;01B17A|2090B1  |01B190;
                       LDY.B #$F8                           ;01B17D|A0F8    |      ;
                       INC.W $057C,X                        ;01B17F|FE7C05  |01057C;
                       LDA.W $057C,X                        ;01B182|BD7C05  |01057C;
                       AND.B #$08                           ;01B185|2908    |      ;
                       BNE CODE_01B18B                      ;01B187|D002    |01B18B;
                       LDY.B #$FA                           ;01B189|A0FA    |      ;
 
          CODE_01B18B: TYA                                  ;01B18B|98      |      ;
                       STA.W $0400,X                        ;01B18C|9D0004  |010400;
                       RTS                                  ;01B18F|60      |      ;
 
 
          CODE_01B190: LDY.B #$00                           ;01B190|A000    |      ;
                       LDX.B #$00                           ;01B192|A200    |      ;
                       LDA.W $0781                          ;01B194|AD8107  |010781;
                       ASL A                                ;01B197|0A      |      ;
                       ASL A                                ;01B198|0A      |      ;
                       ASL A                                ;01B199|0A      |      ;
                       ASL A                                ;01B19A|0A      |      ;
                       CLC                                  ;01B19B|18      |      ;
                       ADC.B #$88                           ;01B19C|6988    |      ;
                       STA.B $00                            ;01B19E|8500    |000000;
                       LDA.W $0780                          ;01B1A0|AD8007  |010780;
                       ASL A                                ;01B1A3|0A      |      ;
                       ASL A                                ;01B1A4|0A      |      ;
                       ASL A                                ;01B1A5|0A      |      ;
                       ASL A                                ;01B1A6|0A      |      ;
                       CLC                                  ;01B1A7|18      |      ;
                       ADC.B #$3C                           ;01B1A8|693C    |      ;
                       STA.B $01                            ;01B1AA|8501    |000001;
 
          CODE_01B1AC: LDA.B $00                            ;01B1AC|A500    |000000;
                       STA.W $041C,X                        ;01B1AE|9D1C04  |01041C;
                       LDA.B $01                            ;01B1B1|A501    |000001;
                       STA.W $0438,X                        ;01B1B3|9D3804  |010438;
                       LDA.W DATA8_01B1C3,Y                 ;01B1B6|B9C3B1  |01B1C3;
                       STA.W $048C,X                        ;01B1B9|9D8C04  |01048C;
                       LDA.W DATA8_01B1C5,Y                 ;01B1BC|B9C5B1  |01B1C5;
                       STA.W $0454,X                        ;01B1BF|9D5404  |010454;
                       RTS                                  ;01B1C2|60      |      ;
 
 
         DATA8_01B1C3: db $0C,$0C                           ;01B1C3|        |      ;
 
         DATA8_01B1C5: db $23,$00                           ;01B1C5|        |      ;
 
          CODE_01B1C7: LDX.B #$00                           ;01B1C7|A200    |      ;
 
          CODE_01B1C9: LDA.W DATA8_01B1D4,X                 ;01B1C9|BDD4B1  |01B1D4;
                       STA.B r_CHR_BankSpr_0000,X           ;01B1CC|9546    |000046;
                       INX                                  ;01B1CE|E8      |      ;
                       CPX.B #$08                           ;01B1CF|E008    |      ;
                       BCC CODE_01B1C9                      ;01B1D1|90F6    |01B1C9;
                       RTS                                  ;01B1D3|60      |      ;
 
 
         DATA8_01B1D4: db $40,$01,$00,$43,$40,$41,$42,$73   ;01B1D4|        |      ;
 
          CODE_01B1DC: LDA.B r_curJoyPe1                    ;01B1DC|A526    |000026;
                       AND.B #$C0                           ;01B1DE|29C0    |      ;
                       BEQ CODE_01B22E                      ;01B1E0|F04C    |01B22E;
                       LDA.B r_curJoyPe1                    ;01B1E2|A526    |000026;
                       AND.B #$80                           ;01B1E4|2980    |      ;
                       BEQ CODE_01B22F                      ;01B1E6|F047    |01B22F;
                       LDA.W $0781                          ;01B1E8|AD8107  |010781;
                       STA.B $00                            ;01B1EB|8500    |000000;
                       LDA.B $00                            ;01B1ED|A500    |000000;
                       BEQ CODE_01B1FB                      ;01B1EF|F00A    |01B1FB;
                       LDA.B #$00                           ;01B1F1|A900    |      ;
                       CLC                                  ;01B1F3|18      |      ;
 
          CODE_01B1F4: ADC.W DATA8_01B127                   ;01B1F4|6D27B1  |01B127;
                       DEC.B $00                            ;01B1F7|C600    |000000;
                       BNE CODE_01B1F4                      ;01B1F9|D0F9    |01B1F4;
 
          CODE_01B1FB: CLC                                  ;01B1FB|18      |      ;
                       ADC.W $0780                          ;01B1FC|6D8007  |010780;
                       TAY                                  ;01B1FF|A8      |      ;
                       LDX.W $0784                          ;01B200|AE8407  |010784;
                       LDA.W DATA8_01B25A,Y                 ;01B203|B95AB2  |01B25A;
                       CMP.B #$FF                           ;01B206|C9FF    |      ;
                       BEQ CODE_01B246                      ;01B208|F03C    |01B246;
                       CMP.B #$FE                           ;01B20A|C9FE    |      ;
                       BEQ CODE_01B24B                      ;01B20C|F03D    |01B24B;
                       CMP.B #$FD                           ;01B20E|C9FD    |      ;
                       BEQ CODE_01B23A                      ;01B210|F028    |01B23A;
                       CMP.B #$FC                           ;01B212|C9FC    |      ;
                       BEQ CODE_01B259                      ;01B214|F043    |01B259;
                       STA.W $07F8,X                        ;01B216|9DF807  |0107F8;
                       JSR.W CODE_01B27E                    ;01B219|207EB2  |01B27E;
                       LDA.B #$1B                           ;01B21C|A91B    |      ;
                       db $20                               ;01B21E|        |      ;
                       dw initFreezWaterEffect_01           ;01B21F|        |0FE25F;
                       LDY.W $0784                          ;01B221|AC8407  |010784;
                       INY                                  ;01B224|C8      |      ;
                       CPY.B #$08                           ;01B225|C008    |      ;
                       BCC CODE_01B22B                      ;01B227|9002    |01B22B;
                       LDY.B #$00                           ;01B229|A000    |      ;
 
          CODE_01B22B: STY.W $0784                          ;01B22B|8C8407  |010784;
 
          CODE_01B22E: RTS                                  ;01B22E|60      |      ;
 
 
          CODE_01B22F: JSR.W CODE_01B23A                    ;01B22F|203AB2  |01B23A;
                       LDA.B #$00                           ;01B232|A900    |      ;
                       STA.W $07F8,Y                        ;01B234|99F807  |0107F8;
                       JMP.W CODE_01B27E                    ;01B237|4C7EB2  |01B27E;
 
 
          CODE_01B23A: LDY.W $0784                          ;01B23A|AC8407  |010784;
                       DEY                                  ;01B23D|88      |      ;
                       BPL CODE_01B242                      ;01B23E|1002    |01B242;
                       LDY.B #$07                           ;01B240|A007    |      ;
 
          CODE_01B242: STY.W $0784                          ;01B242|8C8407  |010784;
                       RTS                                  ;01B245|60      |      ;
 
 
          CODE_01B246: LDA.B #$01                           ;01B246|A901    |      ;
                       STA.B $2D                            ;01B248|852D    |00002D;
                       RTS                                  ;01B24A|60      |      ;
 
 
          CODE_01B24B: LDY.W $0784                          ;01B24B|AC8407  |010784;
                       INY                                  ;01B24E|C8      |      ;
                       CPY.B #$08                           ;01B24F|C008    |      ;
                       BCC CODE_01B255                      ;01B251|9002    |01B255;
                       LDY.B #$00                           ;01B253|A000    |      ;
 
          CODE_01B255: STY.W $0784                          ;01B255|8C8407  |010784;
                       RTS                                  ;01B258|60      |      ;
 
 
          CODE_01B259: RTS                                  ;01B259|60      |      ;
 
 
         DATA8_01B25A: db $50,$51,$52,$53,$54,$55,$56,$57   ;01B25A|        |      ;
                       db $58,$59,$5A,$5B,$5C,$5D,$5E,$5F   ;01B262|        |      ;
                       db $60,$61,$62,$63,$64,$65,$66,$67   ;01B26A|        |      ;
                       db $68,$69,$00                       ;01B272|        |      ;
 
         DATA8_01B275: db $6A,$6B,$4B,$FC,$FC,$FD,$FE,$FC   ;01B275|        |      ;
                       db $FF                               ;01B27D|        |      ;
 
          CODE_01B27E: PHA                                  ;01B27E|48      |      ;
                       LDY.B #$00                           ;01B27F|A000    |      ;
                       JSR.W CODE_01B2A0                    ;01B281|20A0B2  |01B2A0;
                       PLA                                  ;01B284|68      |      ;
                       db $20                               ;01B285|        |      ;
                       dw CODE_0FED14                       ;01B286|        |0FED14;
                       db $4C                               ;01B288|        |      ;
                       dw CODE_0FED12                       ;01B289|        |0FED12;
 
          CODE_01B28B: LDY.B #$02                           ;01B28B|A002    |      ;
 
          CODE_01B28D: JSR.W CODE_01B2A0                    ;01B28D|20A0B2  |01B2A0;
                       LDY.B #$00                           ;01B290|A000    |      ;
 
          CODE_01B292: LDA.W $07F8,Y                        ;01B292|B9F807  |0107F8;
                       db $20                               ;01B295|        |      ;
                       dw CODE_0FED14                       ;01B296|        |0FED14;
                       INY                                  ;01B298|C8      |      ;
                       CPY.B #$08                           ;01B299|C008    |      ;
                       BCC CODE_01B292                      ;01B29B|90F5    |01B292;
                       db $4C                               ;01B29D|        |      ;
                       dw CODE_0FED12                       ;01B29E|        |0FED12;
 
          CODE_01B2A0: LDA.B #$01                           ;01B2A0|A901    |      ;
                       db $20                               ;01B2A2|        |      ;
                       dw CODE_0FED14                       ;01B2A3|        |0FED14;
                       LDA.W $0784                          ;01B2A5|AD8407  |010784;
                       CLC                                  ;01B2A8|18      |      ;
                       ADC.W DATA8_01B2B5,Y                 ;01B2A9|79B5B2  |01B2B5;
                       db $20                               ;01B2AC|        |      ;
                       dw CODE_0FED14                       ;01B2AD|        |0FED14;
                       LDA.W DATA8_01B2B6,Y                 ;01B2AF|B9B6B2  |01B2B6;
                       db $4C                               ;01B2B2|        |      ;
                       dw CODE_0FED14                       ;01B2B3|        |0FED14;
 
         DATA8_01B2B5: db $EC                               ;01B2B5|        |      ;
 
         DATA8_01B2B6: db $20,$AC,$20,$20,$FD,$EB           ;01B2B6|        |      ;
                       LDA.B #$98                           ;01B2BC|A998    |      ;
                       LDX.B #$1A                           ;01B2BE|A21A    |      ;
                       db $20                               ;01B2C0|        |      ;
                       dw screenLoadRoutine01               ;01B2C1|        |0FEBD5;
                       JSR.W CODE_01B675                    ;01B2C3|2075B6  |01B675;
                       JSR.W CODE_01B28B                    ;01B2C6|208BB2  |01B28B;
                       LDA.B #$02                           ;01B2C9|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;01B2CB|851C    |00001C;
                       JSR.W CODE_01B625                    ;01B2CD|2025B6  |01B625;
                       JSR.W CODE_01B066                    ;01B2D0|2066B0  |01B066;
                       INC.B r_gameSubstate                 ;01B2D3|E619    |000019;
                       JMP.W CODE_01B1C7                    ;01B2D5|4CC7B1  |01B1C7;
 
                       LDA.B $B4                            ;01B2D8|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B2DA|C9FF    |      ;
                       BEQ CODE_01B2F8                      ;01B2DC|F01A    |01B2F8;
                       LDA.B r_sceneDrawQueue               ;01B2DE|A51D    |00001D;
                       STA.B r_15                           ;01B2E0|8515    |000015;
                       JSR.W CODE_01B598                    ;01B2E2|2098B5  |01B598;
                       db $20                               ;01B2E5|        |      ;
                       dw UNREACH_0FFBA4                    ;01B2E6|        |0FFBA4;
                       LDA.B $B4                            ;01B2E8|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B2EA|C9FF    |      ;
                       BNE CODE_01B338                      ;01B2EC|D04A    |01B338;
                       LDA.B #$00                           ;01B2EE|A900    |      ;
                       LDX.B r_15                           ;01B2F0|A615    |000015;
                       STA.W $0300,X                        ;01B2F2|9D0003  |010300;
                       STX.B r_sceneDrawQueue               ;01B2F5|861D    |00001D;
                       RTS                                  ;01B2F7|60      |      ;
 
 
          CODE_01B2F8: INC.B r_gameSubstate                 ;01B2F8|E619    |000019;
                       JSR.W CODE_01B48D                    ;01B2FA|208DB4  |01B48D;
                       JMP.W CODE_01B471                    ;01B2FD|4C71B4  |01B471;
 
                       JSR.W CODE_01B3DB                    ;01B300|20DBB3  |01B3DB;
                       JSR.W CODE_01B50C                    ;01B303|200CB5  |01B50C;
                       JSR.W CODE_01B3B9                    ;01B306|20B9B3  |01B3B9;
                       LDA.B r_curJoyPe1                    ;01B309|A526    |000026;
                       AND.B #$30                           ;01B30B|2930    |      ;
                       BNE CODE_01B313                      ;01B30D|D004    |01B313;
                       LDA.B $2D                            ;01B30F|A52D    |00002D;
                       BEQ CODE_01B338                      ;01B311|F025    |01B338;
 
          CODE_01B313: LDA.B r_curJoyPe1                    ;01B313|A526    |000026;
                       AND.B #$20                           ;01B315|2920    |      ;
                       BNE CODE_01B349                      ;01B317|D030    |01B349;
                       JSR.W CODE_01B656                    ;01B319|2056B6  |01B656;
                       LDX.B #$05                           ;01B31C|A205    |      ;
                       JSR.W CODE_01B627                    ;01B31E|2027B6  |01B627;
                       LDA.W $078B                          ;01B321|AD8B07  |01078B;
                       BEQ CODE_01B339                      ;01B324|F013    |01B339;
                       LDA.B #$40                           ;01B326|A940    |      ;
                       db $20                               ;01B328|        |      ;
                       dw initFreezWaterEffect_01           ;01B329|        |0FE25F;
                       LDA.B #$09                           ;01B32B|A909    |      ;
                       STA.B r_gameSubstate                 ;01B32D|8519    |000019;
                       LDA.B #$23                           ;01B32F|A923    |      ;
                       db $20                               ;01B331|        |      ;
                       dw screenLoadRoutine                 ;01B332|        |0FECE9;
                       LDA.B #$78                           ;01B334|A978    |      ;
                       STA.B r_timerGenerel                 ;01B336|8530    |000030;
 
          CODE_01B338: RTS                                  ;01B338|60      |      ;
 
 
          CODE_01B339: LDA.B #$78                           ;01B339|A978    |      ;
                       STA.B r_timerGenerel                 ;01B33B|8530    |000030;
                       LDA.B #$07                           ;01B33D|A907    |      ;
                       STA.W $0160                          ;01B33F|8D6001  |010160;
                       LDA.B #$0A                           ;01B342|A90A    |      ;
                       STA.B r_gameSubstate                 ;01B344|8519    |000019;
                       JMP.W CODE_01B066                    ;01B346|4C66B0  |01B066;
 
 
          CODE_01B349: JSR.W CODE_01B066                    ;01B349|2066B0  |01B066;
                       LDA.B #$0B                           ;01B34C|A90B    |      ;
                       STA.B r_gameSubstate                 ;01B34E|8519    |000019;
 
          CODE_01B350: RTS                                  ;01B350|60      |      ;
 
                       LDA.B #$22                           ;01B351|A922    |      ;
                       JSR.W CODE_01B3AB                    ;01B353|20ABB3  |01B3AB;
                       DEC.B r_timerGenerel                 ;01B356|C630    |000030;
                       BNE CODE_01B350                      ;01B358|D0F6    |01B350;
                       JSR.W CODE_01B066                    ;01B35A|2066B0  |01B066;
                       LDA.B #$0C                           ;01B35D|A90C    |      ;
                       STA.B r_gameSubstate                 ;01B35F|8519    |000019;
                       LDA.B #$00                           ;01B361|A900    |      ;
                       STA.B r_sceneDrawQueue               ;01B363|851D    |00001D;
                       JMP.W CODE_01B682                    ;01B365|4C82B6  |01B682;
 
                       LDA.B $B4                            ;01B368|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B36A|C9FF    |      ;
                       BEQ CODE_01B378                      ;01B36C|F00A    |01B378;
                       LDA.B r_sceneDrawQueue               ;01B36E|A51D    |00001D;
                       STA.B r_15                           ;01B370|8515    |000015;
                       JSR.W CODE_01B598                    ;01B372|2098B5  |01B598;
                       db $20                               ;01B375|        |      ;
                       dw UNREACH_0FFBAF                    ;01B376|        |0FFBAF;
 
          CODE_01B378: DEC.B r_timerGenerel                 ;01B378|C630    |000030;
                       BNE CODE_01B350                      ;01B37A|D0D4    |01B350;
                       LDA.B #$0E                           ;01B37C|A90E    |      ;
                       db $4C                               ;01B37E|        |      ;
                       dw CODE_0FE574                       ;01B37F|        |0FE574;
                       LDA.B r_sceneDrawQueue               ;01B381|A51D    |00001D;
                       STA.B r_15                           ;01B383|8515    |000015;
                       JSR.W CODE_01B598                    ;01B385|2098B5  |01B598;
                       db $20                               ;01B388|        |      ;
                       dw UNREACH_0FFBAF                    ;01B389|        |0FFBAF;
                       LDA.B $B4                            ;01B38B|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B38D|C9FF    |      ;
                       BNE CODE_01B3AA                      ;01B38F|D019    |01B3AA;
                       LDA.B #$06                           ;01B391|A906    |      ;
                       STA.B r_gameSubstate                 ;01B393|8519    |000019;
                       RTS                                  ;01B395|60      |      ;
 
                       LDA.B r_sceneDrawQueue               ;01B396|A51D    |00001D;
                       STA.B r_15                           ;01B398|8515    |000015;
                       JSR.W CODE_01B598                    ;01B39A|2098B5  |01B598;
                       db $20                               ;01B39D|        |      ;
                       dw UNREACH_0FFBAF                    ;01B39E|        |0FFBAF;
                       LDA.B $B4                            ;01B3A0|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B3A2|C9FF    |      ;
                       BNE CODE_01B3AA                      ;01B3A4|D004    |01B3AA;
                       LDA.B #$01                           ;01B3A6|A901    |      ;
                       STA.B r_gameSubstate                 ;01B3A8|8519    |000019;
 
          CODE_01B3AA: RTS                                  ;01B3AA|60      |      ;
 
 
          CODE_01B3AB: STA.B $00                            ;01B3AB|8500    |000000;
                       LDA.B r_timerGenerel                 ;01B3AD|A530    |000030;
                       AND.B #$10                           ;01B3AF|2910    |      ;
                       ASL A                                ;01B3B1|0A      |      ;
                       ASL A                                ;01B3B2|0A      |      ;
                       ASL A                                ;01B3B3|0A      |      ;
                       ORA.B $00                            ;01B3B4|0500    |000000;
                       db $4C                               ;01B3B6|        |      ;
 
                       dw screenLoadRoutine                 ;01B3B7|        |0FECE9;
 
          CODE_01B3B9: LDA.B r_gameStateLoopCounter         ;01B3B9|A51A    |00001A;
                       AND.B #$01                           ;01B3BB|2901    |      ;
                       BNE CODE_01B3CD                      ;01B3BD|D00E    |01B3CD;
                       LDA.W $078D                          ;01B3BF|AD8D07  |01078D;
                       BEQ CODE_01B3DA                      ;01B3C2|F016    |01B3DA;
                       JSR.W CODE_01B48D                    ;01B3C4|208DB4  |01B48D;
                       LDA.B #$00                           ;01B3C7|A900    |      ;
                       STA.W $078D                          ;01B3C9|8D8D07  |01078D;
                       RTS                                  ;01B3CC|60      |      ;
 
 
          CODE_01B3CD: LDA.W $078C                          ;01B3CD|AD8C07  |01078C;
                       BEQ CODE_01B3DA                      ;01B3D0|F008    |01B3DA;
                       JSR.W CODE_01B471                    ;01B3D2|2071B4  |01B471;
                       LDA.B #$00                           ;01B3D5|A900    |      ;
                       STA.W $078C                          ;01B3D7|8D8C07  |01078C;
 
          CODE_01B3DA: RTS                                  ;01B3DA|60      |      ;
 
 
          CODE_01B3DB: JSR.W CODE_01B533                    ;01B3DB|2033B5  |01B533;
                       JSR.W CODE_01B3FB                    ;01B3DE|20FBB3  |01B3FB;
                       LDA.B r_curJoyPe1                    ;01B3E1|A526    |000026;
                       AND.B #$0F                           ;01B3E3|290F    |      ;
                       BEQ CODE_01B3F8                      ;01B3E5|F011    |01B3F8;
                       LDA.W $0781                          ;01B3E7|AD8107  |010781;
                       STA.W $0783                          ;01B3EA|8D8307  |010783;
                       LDA.W $0780                          ;01B3ED|AD8007  |010780;
                       STA.W $0782                          ;01B3F0|8D8207  |010782;
                       LDA.B #$01                           ;01B3F3|A901    |      ;
                       STA.W $078C                          ;01B3F5|8D8C07  |01078C;
 
          CODE_01B3F8: JMP.W CODE_01B0CA                    ;01B3F8|4CCAB0  |01B0CA;
 
 
          CODE_01B3FB: LDX.B #$02                           ;01B3FB|A202    |      ;
                       LDY.B #$01                           ;01B3FD|A001    |      ;
 
          CODE_01B3FF: JSR.W CODE_01B414                    ;01B3FF|2014B4  |01B414;
                       LDA.W DATA8_01B433,Y                 ;01B402|B933B4  |01B433;
                       STA.W $0438,X                        ;01B405|9D3804  |010438;
                       LDA.B #$50                           ;01B408|A950    |      ;
                       STA.W $041C,X                        ;01B40A|9D1C04  |01041C;
                       INX                                  ;01B40D|E8      |      ;
                       INY                                  ;01B40E|C8      |      ;
                       CPX.B #$05                           ;01B40F|E005    |      ;
                       BCC CODE_01B3FF                      ;01B411|90EC    |01B3FF;
                       RTS                                  ;01B413|60      |      ;
 
 
          CODE_01B414: LDA.W DATA8_01B427,Y                 ;01B414|B927B4  |01B427;
                       STA.W $0400,X                        ;01B417|9D0004  |010400;
                       LDA.W DATA8_01B42B,Y                 ;01B41A|B92BB4  |01B42B;
                       STA.W $048C,X                        ;01B41D|9D8C04  |01048C;
                       LDA.W DATA8_01B42F,Y                 ;01B420|B92FB4  |01B42F;
                       STA.W $0454,X                        ;01B423|9D5404  |010454;
                       RTS                                  ;01B426|60      |      ;
 
 
         DATA8_01B427: db $00,$42,$FC,$F4                   ;01B427|        |      ;
 
         DATA8_01B42B: db $00,$14,$0C,$0C                   ;01B42B|        |      ;
 
         DATA8_01B42F: db $00,$00,$00,$00                   ;01B42F|        |      ;
 
         DATA8_01B433: db $50,$70,$90,$B0                   ;01B433|        |      ;
 
         DATA8_01B437: db $04,$04,$86,$A4,$A4,$87,$96,$00   ;01B437|        |      ;
                       db $00,$97,$96,$00,$00,$97,$A6,$A5   ;01B43F|        |      ;
                       db $A5,$A7,$04,$04,$80,$81,$81,$82   ;01B447|        |      ;
                       db $90,$00,$00,$92,$90,$00,$00,$92   ;01B44F|        |      ;
                       db $A0,$A1,$A1,$A2,$03,$03,$86,$A4   ;01B457|        |      ;
                       db $87,$96,$00,$97,$A6,$A5,$A7,$03   ;01B45F|        |      ;
                       db $03,$80,$81,$82,$90,$00,$92,$A0   ;01B467|        |      ;
                       db $A1,$A2                           ;01B46F|        |      ;
 
          CODE_01B471: LDA.W $0783                          ;01B471|AD8307  |010783;
                       LDY.W $0782                          ;01B474|AC8207  |010782;
                       JSR.W CODE_01B4EB                    ;01B477|20EBB4  |01B4EB;
                       LDY.B #$2F                           ;01B47A|A02F    |      ;
                       JSR.W CODE_01B4A0                    ;01B47C|20A0B4  |01B4A0;
                       LDA.W $0781                          ;01B47F|AD8107  |010781;
                       LDY.W $0780                          ;01B482|AC8007  |010780;
                       JSR.W CODE_01B4EB                    ;01B485|20EBB4  |01B4EB;
                       LDY.B #$24                           ;01B488|A024    |      ;
                       JMP.W CODE_01B4A0                    ;01B48A|4CA0B4  |01B4A0;
 
 
          CODE_01B48D: LDA.W $0787                          ;01B48D|AD8707  |010787;
                       JSR.W CODE_01B4DF                    ;01B490|20DFB4  |01B4DF;
                       LDY.B #$12                           ;01B493|A012    |      ;
                       JSR.W CODE_01B4A0                    ;01B495|20A0B4  |01B4A0;
                       LDA.W $0786                          ;01B498|AD8607  |010786;
                       JSR.W CODE_01B4DF                    ;01B49B|20DFB4  |01B4DF;
                       LDY.B #$00                           ;01B49E|A000    |      ;
 
          CODE_01B4A0: LDA.W DATA8_01B437,Y                 ;01B4A0|B937B4  |01B437;
                       STA.B $03                            ;01B4A3|8503    |000003;
                       INY                                  ;01B4A5|C8      |      ;
                       LDA.W DATA8_01B437,Y                 ;01B4A6|B937B4  |01B437;
                       STA.B $04                            ;01B4A9|8504    |000004;
                       INY                                  ;01B4AB|C8      |      ;
 
          CODE_01B4AC: LDA.B #$01                           ;01B4AC|A901    |      ;
                       db $20                               ;01B4AE|        |      ;
                       dw CODE_0FED14                       ;01B4AF|        |0FED14;
                       LDA.B $00                            ;01B4B1|A500    |000000;
                       db $20                               ;01B4B3|        |      ;
                       dw CODE_0FED14                       ;01B4B4|        |0FED14;
                       LDA.B $01                            ;01B4B6|A501    |000001;
                       db $20                               ;01B4B8|        |      ;
                       dw CODE_0FED14                       ;01B4B9|        |0FED14;
                       LDA.B $04                            ;01B4BB|A504    |000004;
                       STA.B $05                            ;01B4BD|8505    |000005;
 
          CODE_01B4BF: LDA.W DATA8_01B437,Y                 ;01B4BF|B937B4  |01B437;
                       INY                                  ;01B4C2|C8      |      ;
                       db $20                               ;01B4C3|        |      ;
                       dw CODE_0FED14                       ;01B4C4|        |0FED14;
                       DEC.B $05                            ;01B4C6|C605    |000005;
                       BNE CODE_01B4BF                      ;01B4C8|D0F5    |01B4BF;
                       db $20                               ;01B4CA|        |      ;
                       dw CODE_0FED12                       ;01B4CB|        |0FED12;
                       CLC                                  ;01B4CD|18      |      ;
                       LDA.B #$20                           ;01B4CE|A920    |      ;
                       ADC.B $00                            ;01B4D0|6500    |000000;
                       STA.B $00                            ;01B4D2|8500    |000000;
                       LDA.B #$00                           ;01B4D4|A900    |      ;
                       ADC.B $01                            ;01B4D6|6501    |000001;
                       STA.B $01                            ;01B4D8|8501    |000001;
                       DEC.B $03                            ;01B4DA|C603    |000003;
                       BNE CODE_01B4AC                      ;01B4DC|D0CE    |01B4AC;
                       RTS                                  ;01B4DE|60      |      ;
 
 
          CODE_01B4DF: ASL A                                ;01B4DF|0A      |      ;
                       ASL A                                ;01B4E0|0A      |      ;
                       CLC                                  ;01B4E1|18      |      ;
                       ADC.B #$08                           ;01B4E2|6908    |      ;
                       STA.B $00                            ;01B4E4|8500    |000000;
                       LDA.B #$21                           ;01B4E6|A921    |      ;
                       STA.B $01                            ;01B4E8|8501    |000001;
                       RTS                                  ;01B4EA|60      |      ;
 
 
          CODE_01B4EB: ASL A                                ;01B4EB|0A      |      ;
                       TAX                                  ;01B4EC|AA      |      ;
                       LDA.W DATA8_01B500,X                 ;01B4ED|BD00B5  |01B500;
                       STA.B $00                            ;01B4F0|8500    |000000;
                       LDA.W DATA8_01B501,X                 ;01B4F2|BD01B5  |01B501;
                       STA.B $01                            ;01B4F5|8501    |000001;
                       LDA.B $00                            ;01B4F7|A500    |000000;
                       CLC                                  ;01B4F9|18      |      ;
                       ADC.W DATA8_01B508,Y                 ;01B4FA|7908B5  |01B508;
                       STA.B $00                            ;01B4FD|8500    |000000;
                       RTS                                  ;01B4FF|60      |      ;
 
 
         DATA8_01B500: db $C0                               ;01B500|        |      ;
 
         DATA8_01B501: db $21,$20,$22,$80,$22,$E0,$22       ;01B501|        |      ;
 
         DATA8_01B508: db $0A,$0D,$10,$13                   ;01B508|        |      ;
 
          CODE_01B50C: LDX.B #$00                           ;01B50C|A200    |      ;
                       LDA.W $0781                          ;01B50E|AD8107  |010781;
                       ASL A                                ;01B511|0A      |      ;
                       ASL A                                ;01B512|0A      |      ;
                       ASL A                                ;01B513|0A      |      ;
                       STA.B $00                            ;01B514|8500    |000000;
                       ASL A                                ;01B516|0A      |      ;
                       CLC                                  ;01B517|18      |      ;
                       ADC.B $00                            ;01B518|6500    |000000;
                       CLC                                  ;01B51A|18      |      ;
                       ADC.B #$7A                           ;01B51B|697A    |      ;
                       STA.W $041C,X                        ;01B51D|9D1C04  |01041C;
                       LDA.W $0780                          ;01B520|AD8007  |010780;
                       ASL A                                ;01B523|0A      |      ;
                       ASL A                                ;01B524|0A      |      ;
                       ASL A                                ;01B525|0A      |      ;
                       STA.B $01                            ;01B526|8501    |000001;
                       ASL A                                ;01B528|0A      |      ;
                       CLC                                  ;01B529|18      |      ;
                       ADC.B $01                            ;01B52A|6501    |000001;
                       CLC                                  ;01B52C|18      |      ;
                       ADC.B #$5D                           ;01B52D|695D    |      ;
                       STA.W $0438,X                        ;01B52F|9D3804  |010438;
 
          CODE_01B532: RTS                                  ;01B532|60      |      ;
 
 
          CODE_01B533: LDA.B r_curJoyPe1                    ;01B533|A526    |000026;
                       AND.B #$40                           ;01B535|2940    |      ;
                       BEQ CODE_01B550                      ;01B537|F017    |01B550;
                       LDA.B #$1A                           ;01B539|A91A    |      ;
                       db $20                               ;01B53B|        |      ;
                       dw initFreezWaterEffect_01           ;01B53C|        |0FE25F;
                       LDA.B #$01                           ;01B53E|A901    |      ;
                       STA.W $078D                          ;01B540|8D8D07  |01078D;
                       LDY.W $0786                          ;01B543|AC8607  |010786;
                       STY.W $0787                          ;01B546|8C8707  |010787;
                       INY                                  ;01B549|C8      |      ;
                       TYA                                  ;01B54A|98      |      ;
                       AND.B #$03                           ;01B54B|2903    |      ;
                       STA.W $0786                          ;01B54D|8D8607  |010786;
 
          CODE_01B550: LDA.B r_curJoyPe1                    ;01B550|A526    |000026;
                       AND.B #$80                           ;01B552|2980    |      ;
                       BEQ CODE_01B532                      ;01B554|F0DC    |01B532;
                       LDA.B #$1B                           ;01B556|A91B    |      ;
                       db $20                               ;01B558|        |      ;
                       dw initFreezWaterEffect_01           ;01B559|        |0FE25F;
                       LDA.W $0781                          ;01B55B|AD8107  |010781;
                       ASL A                                ;01B55E|0A      |      ;
                       ASL A                                ;01B55F|0A      |      ;
                       ADC.W $0780                          ;01B560|6D8007  |010780;
                       TAY                                  ;01B563|A8      |      ;
                       LDA.W $0781                          ;01B564|AD8107  |010781;
                       ASL A                                ;01B567|0A      |      ;
                       ASL A                                ;01B568|0A      |      ;
                       ORA.W $0780                          ;01B569|0D8007  |010780;
                       PHA                                  ;01B56C|48      |      ;
                       CLC                                  ;01B56D|18      |      ;
                       ADC.B #$05                           ;01B56E|6905    |      ;
                       TAX                                  ;01B570|AA      |      ;
                       PLA                                  ;01B571|68      |      ;
                       ASL A                                ;01B572|0A      |      ;
                       ASL A                                ;01B573|0A      |      ;
                       ORA.W $0786                          ;01B574|0D8607  |010786;
                       STA.B $00                            ;01B577|8500    |000000;
                       AND.B #$03                           ;01B579|2903    |      ;
                       BNE CODE_01B581                      ;01B57B|D004    |01B581;
                       LDA.B #$00                           ;01B57D|A900    |      ;
                       BEQ CODE_01B583                      ;01B57F|F002    |01B583;
 
          CODE_01B581: LDA.B $00                            ;01B581|A500    |000000;
 
          CODE_01B583: STA.W $0790,Y                        ;01B583|999007  |010790;
                       LDY.W $0786                          ;01B586|AC8607  |010786;
                       LDA.W $0438                          ;01B589|AD3804  |010438;
                       STA.W $0438,X                        ;01B58C|9D3804  |010438;
                       LDA.W $041C                          ;01B58F|AD1C04  |01041C;
                       STA.W $041C,X                        ;01B592|9D1C04  |01041C;
                       JMP.W CODE_01B414                    ;01B595|4C14B4  |01B414;
 
 
          CODE_01B598: LDA.B #$1E                           ;01B598|A91E    |      ;
                       db $20                               ;01B59A|        |      ;
                       dw screenLoadRoutine                 ;01B59B|        |0FECE9;
                       LDA.B #$04                           ;01B59D|A904    |      ;
                       db $4C                               ;01B59F|        |      ;
                       dw screenLoadRoutine                 ;01B5A0|        |0FECE9;
 
          CODE_01B5A2: LDA.B r_gameSubstate                 ;01B5A2|A519    |000019;
                       db $20                               ;01B5A4|        |      ;
                       dw jumpFromStackYXpreserved          ;01B5A5|        |0FE86D;
                       dw CODE_01B5AD                       ;01B5A7|        |01B5AD;
                       dw CODE_01B5E4                       ;01B5A9|        |01B5E4;
                       dw CODE_01B610                       ;01B5AB|        |01B610;
 
          CODE_01B5AD: LDA.B #$44                           ;01B5AD|A944    |      ;
                       STA.B r_updateNametable              ;01B5AF|8525    |000025;
                       STA.W $5105                          ;01B5B1|8D0551  |015105;
                       db $20                               ;01B5B4|        |      ;
                       dw setNameTableMapping_E4            ;01B5B5|        |0FEBFD;
                       LDA.B #$98                           ;01B5B7|A998    |      ;
                       LDX.B #$1A                           ;01B5B9|A21A    |      ;
                       db $20                               ;01B5BB|        |      ;
                       dw screenLoadRoutine01               ;01B5BC|        |0FEBD5;
                       db $20                               ;01B5BE|        |      ;
                       dw initBoss_00                       ;01B5BF|        |0FE2D6;
                       LDA.B #$62                           ;01B5C1|A962    |      ;
                       db $20                               ;01B5C3|        |      ;
                       dw initFreezWaterEffect_01           ;01B5C4|        |0FE25F;
                       INC.B r_gameSubstate                 ;01B5C6|E619    |000019;
                       JSR.W CODE_01B1C7                    ;01B5C8|20C7B1  |01B1C7;
                       JSR.W CODE_01B625                    ;01B5CB|2025B6  |01B625;
                       JSR.W CODE_01B675                    ;01B5CE|2075B6  |01B675;
                       JSR.W CODE_01B64A                    ;01B5D1|204AB6  |01B64A;
                       JSR.W CODE_01B28B                    ;01B5D4|208BB2  |01B28B;
                       JSR.W CODE_01B647                    ;01B5D7|2047B6  |01B647;
                       JSR.W CODE_01B066                    ;01B5DA|2066B0  |01B066;
                       LDA.B #$03                           ;01B5DD|A903    |      ;
                       STA.B r_counter_ShowSprBg            ;01B5DF|851C    |00001C;
                       JMP.W CODE_01B3FB                    ;01B5E1|4CFBB3  |01B3FB;
 
 
          CODE_01B5E4: LDA.B $B4                            ;01B5E4|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B5E6|C9FF    |      ;
                       BEQ CODE_01B604                      ;01B5E8|F01A    |01B604;
                       LDA.B r_sceneDrawQueue               ;01B5EA|A51D    |00001D;
                       STA.B r_15                           ;01B5EC|8515    |000015;
                       JSR.W CODE_01B598                    ;01B5EE|2098B5  |01B598;
                       db $20                               ;01B5F1|        |      ;
                       dw UNREACH_0FFBA4                    ;01B5F2|        |0FFBA4;
                       LDA.B $B4                            ;01B5F4|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B5F6|C9FF    |      ;
                       BNE CODE_01B60F                      ;01B5F8|D015    |01B60F;
                       LDA.B #$00                           ;01B5FA|A900    |      ;
                       LDX.B r_15                           ;01B5FC|A615    |000015;
                       STX.B r_sceneDrawQueue               ;01B5FE|861D    |00001D;
                       STA.W $0300,X                        ;01B600|9D0003  |010300;
                       RTS                                  ;01B603|60      |      ;
 
 
          CODE_01B604: LDA.B r_curJoyPe1                    ;01B604|A526    |000026;
                       AND.B #$10                           ;01B606|2910    |      ;
                       BEQ CODE_01B60F                      ;01B608|F005    |01B60F;
                       JSR.W CODE_01B066                    ;01B60A|2066B0  |01B066;
                       INC.B r_gameSubstate                 ;01B60D|E619    |000019;
 
          CODE_01B60F: RTS                                  ;01B60F|60      |      ;
 
 
          CODE_01B610: LDA.B $B4                            ;01B610|A5B4    |0000B4;
                       CMP.B #$FF                           ;01B612|C9FF    |      ;
                       BEQ CODE_01B620                      ;01B614|F00A    |01B620;
                       LDA.B r_sceneDrawQueue               ;01B616|A51D    |00001D;
                       STA.B r_15                           ;01B618|8515    |000015;
                       JSR.W CODE_01B598                    ;01B61A|2098B5  |01B598;
                       db $4C                               ;01B61D|        |      ;
                       dw UNREACH_0FFBAF                    ;01B61E|        |0FFBAF;
 
          CODE_01B620: LDA.B #$00                           ;01B620|A900    |      ;
                       db $4C                               ;01B622|        |      ;
                       dw CODE_0FE574                       ;01B623|        |0FE574;
 
          CODE_01B625: LDX.B #$00                           ;01B625|A200    |      ;
 
          CODE_01B627: LDA.B #$00                           ;01B627|A900    |      ;
 
          CODE_01B629: STA.W $0400,X                        ;01B629|9D0004  |010400;
                       STA.W $041C,X                        ;01B62C|9D1C04  |01041C;
                       STA.W $0438,X                        ;01B62F|9D3804  |010438;
                       STA.W $0454,X                        ;01B632|9D5404  |010454;
                       STA.W $0470,X                        ;01B635|9D7004  |010470;
                       STA.W $048C,X                        ;01B638|9D8C04  |01048C;
                       STA.W $04A8,X                        ;01B63B|9DA804  |0104A8;
                       STA.W $054E,X                        ;01B63E|9D4E05  |01054E;
                       INX                                  ;01B641|E8      |      ;
                       CPX.B #$17                           ;01B642|E017    |      ;
                       BCC CODE_01B629                      ;01B644|90E3    |01B629;
                       RTS                                  ;01B646|60      |      ;
 
 
          CODE_01B647: JMP.W CODE_01B940                    ;01B647|4C40B9  |01B940;
 
 
          CODE_01B64A: JSR.W CODE_01B6CD                    ;01B64A|20CDB6  |01B6CD;
                       STA.W $078A                          ;01B64D|8D8A07  |01078A;
                       JSR.W CODE_01B6EE                    ;01B650|20EEB6  |01B6EE;
                       JMP.W CODE_01B8C4                    ;01B653|4CC4B8  |01B8C4;
 
 
          CODE_01B656: JSR.W CODE_01B6CD                    ;01B656|20CDB6  |01B6CD;
                       STA.B r_index                        ;01B659|8510    |000010;
                       JSR.W CODE_01B79A                    ;01B65B|209AB7  |01B79A;
                       JSR.W CODE_01B7F0                    ;01B65E|20F0B7  |01B7F0;
                       JSR.W CODE_01B68F                    ;01B661|208FB6  |01B68F;
                       JSR.W CODE_01B82C                    ;01B664|202CB8  |01B82C;
                       db $20                               ;01B667|        |      ;
                       dw CODE_0FE593                       ;01B668|        |0FE593;
                       BCS CODE_01B66F                      ;01B66A|B003    |01B66F;
                       JSR.W CODE_01B87F                    ;01B66C|207FB8  |01B87F;
 
          CODE_01B66F: JSR.W CODE_01B756                    ;01B66F|2056B7  |01B756;
                       JMP.W CODE_01B865                    ;01B672|4C65B8  |01B865;
 
 
          CODE_01B675: LDA.B #$00                           ;01B675|A900    |      ;
                       LDX.B #$00                           ;01B677|A200    |      ;
 
          CODE_01B679: STA.W $0780,X                        ;01B679|9D8007  |010780;
                       INX                                  ;01B67C|E8      |      ;
                       CPX.B #$10                           ;01B67D|E010    |      ;
                       BCC CODE_01B679                      ;01B67F|90F8    |01B679;
                       RTS                                  ;01B681|60      |      ;
 
 
          CODE_01B682: LDY.B #$00                           ;01B682|A000    |      ;
                       LDA.B #$00                           ;01B684|A900    |      ;
 
          CODE_01B686: STA.W $0790,Y                        ;01B686|999007  |010790;
                       INY                                  ;01B689|C8      |      ;
                       CPY.B #$10                           ;01B68A|C010    |      ;
                       BCC CODE_01B686                      ;01B68C|90F8    |01B686;
                       RTS                                  ;01B68E|60      |      ;
 
 
          CODE_01B68F: LDX.B #$00                           ;01B68F|A200    |      ;
                       LDA.W $078F                          ;01B691|AD8F07  |01078F;
                       ASL A                                ;01B694|0A      |      ;
                       ASL A                                ;01B695|0A      |      ;
                       ASL A                                ;01B696|0A      |      ;
                       ADC.W $078F                          ;01B697|6D8F07  |01078F;
                       STA.B $00                            ;01B69A|8500    |000000;
 
          CODE_01B69C: LDY.B $00                            ;01B69C|A400    |000000;
                       LDA.W DATA8_01B6B2,Y                 ;01B69E|B9B2B6  |01B6B2;
                       JSR.W CODE_01B7E2                    ;01B6A1|20E2B7  |01B7E2;
                       LDA.W $0790,Y                        ;01B6A4|B99007  |010790;
                       STA.W $07A0,X                        ;01B6A7|9DA007  |0107A0;
                       INC.B $00                            ;01B6AA|E600    |000000;
                       INX                                  ;01B6AC|E8      |      ;
                       CPX.B #$09                           ;01B6AD|E009    |      ;
                       BCC CODE_01B69C                      ;01B6AF|90EB    |01B69C;
                       RTS                                  ;01B6B1|60      |      ;
 
 
         DATA8_01B6B2: db $00                               ;01B6B2|        |      ;
 
         DATA8_01B6B3: db $33,$20,$13,$22,$01,$11,$03,$32   ;01B6B3|        |      ;
                       db $12,$10,$02,$32,$23,$13,$30,$21   ;01B6BB|        |      ;
                       db $01,$31,$13,$01,$22,$10,$30       ;01B6C3|        |      ;
 
         DATA8_01B6CA: db $33,$03,$21                       ;01B6CA|        |      ;
 
          CODE_01B6CD: LDA.B #$00                           ;01B6CD|A900    |      ;
                       STA.B $00                            ;01B6CF|8500    |000000;
                       TAX                                  ;01B6D1|AA      |      ;
 
          CODE_01B6D2: LDA.W $07F8,X                        ;01B6D2|BDF807  |0107F8;
                       CLC                                  ;01B6D5|18      |      ;
                       ADC.W DATA8_01B6E6,X                 ;01B6D6|7DE6B6  |01B6E6;
                       CLC                                  ;01B6D9|18      |      ;
                       ADC.B $00                            ;01B6DA|6500    |000000;
                       STA.B $00                            ;01B6DC|8500    |000000;
                       INX                                  ;01B6DE|E8      |      ;
                       CPX.B #$08                           ;01B6DF|E008    |      ;
                       BNE CODE_01B6D2                      ;01B6E1|D0EF    |01B6D2;
                       AND.B #$07                           ;01B6E3|2907    |      ;
                       RTS                                  ;01B6E5|60      |      ;
 
 
         DATA8_01B6E6: db $07,$03,$01,$06,$02,$04,$05,$00   ;01B6E6|        |      ;
 
          CODE_01B6EE: LDA.W $078A                          ;01B6EE|AD8A07  |01078A;
                       STA.B $00                            ;01B6F1|8500    |000000;
                       LDA.B r_02e                          ;01B6F3|A52E    |00002E;
                       CMP.B #$11                           ;01B6F5|C911    |      ;
                       BCC CODE_01B6FB                      ;01B6F7|9002    |01B6FB;
                       LDA.B #$11                           ;01B6F9|A911    |      ;
 
          CODE_01B6FB: STA.B r_02e                          ;01B6FB|852E    |00002E;
                       LSR A                                ;01B6FD|4A      |      ;
                       ROL.B $00                            ;01B6FE|2600    |000000;
                       LDA.B r_gameStateLoopCounter         ;01B700|A51A    |00001A;
                       LSR A                                ;01B702|4A      |      ;
                       ROL.B $00                            ;01B703|2600    |000000;
                       ROL.B $00                            ;01B705|2600    |000000;
                       ROL.B $00                            ;01B707|2600    |000000;
                       LDA.B r_partner                      ;01B709|A53A    |00003A;
                       BPL CODE_01B70F                      ;01B70B|1002    |01B70F;
                       LDA.B #$00                           ;01B70D|A900    |      ;
 
          CODE_01B70F: ORA.B $00                            ;01B70F|0500    |000000;
                       ASL A                                ;01B711|0A      |      ;
                       ORA.W $07F6                          ;01B712|0DF607  |0107F6;
                       STA.W $0788                          ;01B715|8D8807  |010788;
                       LDA.B r_gameStateLoopCounter         ;01B718|A51A    |00001A;
                       LSR A                                ;01B71A|4A      |      ;
                       LDA.B #$50                           ;01B71B|A950    |      ;
                       BCC CODE_01B721                      ;01B71D|9002    |01B721;
                       LDA.B #$A0                           ;01B71F|A9A0    |      ;
 
          CODE_01B721: STA.B $04                            ;01B721|8504    |000004;
                       JSR.W CODE_01B72A                    ;01B723|202AB7  |01B72A;
                       STA.W $0789                          ;01B726|8D8907  |010789;
                       RTS                                  ;01B729|60      |      ;
 
 
          CODE_01B72A: LDA.W $0788                          ;01B72A|AD8807  |010788;
                       AND.B #$F0                           ;01B72D|29F0    |      ;
                       STA.B $02                            ;01B72F|8502    |000002;
                       LDA.W $0788                          ;01B731|AD8807  |010788;
                       ASL A                                ;01B734|0A      |      ;
                       ASL A                                ;01B735|0A      |      ;
                       ASL A                                ;01B736|0A      |      ;
                       ASL A                                ;01B737|0A      |      ;
                       STA.B $03                            ;01B738|8503    |000003;
                       CLC                                  ;01B73A|18      |      ;
                       ADC.B $02                            ;01B73B|6502    |000002;
                       STA.B $01                            ;01B73D|8501    |000001;
                       LDA.B $04                            ;01B73F|A504    |000004;
                       EOR.B $02                            ;01B741|4502    |000002;
                       STA.B $00                            ;01B743|8500    |000000;
                       LDA.B $04                            ;01B745|A504    |000004;
                       EOR.B $03                            ;01B747|4503    |000003;
                       CLC                                  ;01B749|18      |      ;
                       ADC.B $00                            ;01B74A|6500    |000000;
                       LSR A                                ;01B74C|4A      |      ;
                       LSR A                                ;01B74D|4A      |      ;
                       LSR A                                ;01B74E|4A      |      ;
                       LSR A                                ;01B74F|4A      |      ;
                       ORA.B $01                            ;01B750|0501    |000001;
                       CLC                                  ;01B752|18      |      ;
                       ADC.B r_02e                          ;01B753|652E    |00002E;
                       RTS                                  ;01B755|60      |      ;
 
 
          CODE_01B756: LDA.W $0788                          ;01B756|AD8807  |010788;
                       AND.B #$01                           ;01B759|2901    |      ;
                       STA.W $07F6                          ;01B75B|8DF607  |0107F6;
                       LDA.W $0788                          ;01B75E|AD8807  |010788;
                       LSR A                                ;01B761|4A      |      ;
                       AND.B #$03                           ;01B762|2903    |      ;
                       BNE CODE_01B768                      ;01B764|D002    |01B768;
                       LDA.B #$FF                           ;01B766|A9FF    |      ;
 
          CODE_01B768: STA.B r_partner                      ;01B768|853A    |00003A;
                       LDA.W $0788                          ;01B76A|AD8807  |010788;
                       AND.B #$10                           ;01B76D|2910    |      ;
                       BEQ CODE_01B777                      ;01B76F|F006    |01B777;
                       LDA.B r_02e                          ;01B771|A52E    |00002E;
                       ORA.B #$01                           ;01B773|0901    |      ;
                       STA.B r_02e                          ;01B775|852E    |00002E;
 
          CODE_01B777: LDA.W $0788                          ;01B777|AD8807  |010788;
                       LSR A                                ;01B77A|4A      |      ;
                       LSR A                                ;01B77B|4A      |      ;
                       LSR A                                ;01B77C|4A      |      ;
                       LSR A                                ;01B77D|4A      |      ;
                       LSR A                                ;01B77E|4A      |      ;
                       STA.W $078A                          ;01B77F|8D8A07  |01078A;
                       CMP.B r_index                        ;01B782|C510    |000010;
                       BEQ CODE_01B78B                      ;01B784|F005    |01B78B;
                       LDA.B #$10                           ;01B786|A910    |      ;
                       JMP.W CODE_01B7D8                    ;01B788|4CD8B7  |01B7D8;
 
 
          CODE_01B78B: LDA.B r_02e                          ;01B78B|A52E    |00002E;
                       CMP.B #$02                           ;01B78D|C902    |      ;
                       BEQ CODE_01B795                      ;01B78F|F004    |01B795;
                       CMP.B #$04                           ;01B791|C904    |      ;
                       BNE CODE_01B799                      ;01B793|D004    |01B799;
 
          CODE_01B795: LDA.B #$01                           ;01B795|A901    |      ;
                       STA.B r_GrantDefeated                ;01B797|852F    |00002F;
 
          CODE_01B799: RTS                                  ;01B799|60      |      ;
 
 
          CODE_01B79A: LDA.B #$02                           ;01B79A|A902    |      ;
                       STA.B $00                            ;01B79C|8500    |000000;
                       LDA.B #$00                           ;01B79E|A900    |      ;
                       STA.B $01                            ;01B7A0|8501    |000001;
 
          CODE_01B7A2: LDY.B $00                            ;01B7A2|A400    |000000;
                       LDA.W DATA8_01B7DF,Y                 ;01B7A4|B9DFB7  |01B7DF;
                       JSR.W CODE_01B7E2                    ;01B7A7|20E2B7  |01B7E2;
                       LDA.W $0790,Y                        ;01B7AA|B99007  |010790;
                       AND.B #$03                           ;01B7AD|2903    |      ;
                       BEQ CODE_01B7CB                      ;01B7AF|F01A    |01B7CB;
                       LDA.B $00                            ;01B7B1|A500    |000000;
                       STA.W $078F                          ;01B7B3|8D8F07  |01078F;
                       INC.B $01                            ;01B7B6|E601    |000001;
                       LDX.B #$00                           ;01B7B8|A200    |      ;
                       LDA.W $0790,Y                        ;01B7BA|B99007  |010790;
 
          CODE_01B7BD: CMP.W DATA8_01B937,X                 ;01B7BD|DD37B9  |01B937;
                       BEQ CODE_01B7C7                      ;01B7C0|F005    |01B7C7;
                       INX                                  ;01B7C2|E8      |      ;
                       CPX.B #$09                           ;01B7C3|E009    |      ;
                       BNE CODE_01B7BD                      ;01B7C5|D0F6    |01B7BD;
 
          CODE_01B7C7: TXA                                  ;01B7C7|8A      |      ;
                       ASL A                                ;01B7C8|0A      |      ;
                       STA.B r_02e                          ;01B7C9|852E    |00002E;
 
          CODE_01B7CB: DEC.B $00                            ;01B7CB|C600    |000000;
                       BPL CODE_01B7A2                      ;01B7CD|10D3    |01B7A2;
                       LDA.B $01                            ;01B7CF|A501    |000001;
                       CMP.B #$01                           ;01B7D1|C901    |      ;
                       BNE CODE_01B7D6                      ;01B7D3|D001    |01B7D6;
                       RTS                                  ;01B7D5|60      |      ;
 
 
          CODE_01B7D6: LDA.B #$01                           ;01B7D6|A901    |      ;
 
          CODE_01B7D8: ORA.W $078B                          ;01B7D8|0D8B07  |01078B;
                       STA.W $078B                          ;01B7DB|8D8B07  |01078B;
                       RTS                                  ;01B7DE|60      |      ;
 
 
         DATA8_01B7DF: db $00,$12                           ;01B7DF|        |      ;
 
         DATA8_01B7E1: db $31                               ;01B7E1|        |      ;
 
          CODE_01B7E2: PHA                                  ;01B7E2|48      |      ;
                       AND.B #$30                           ;01B7E3|2930    |      ;
                       LSR A                                ;01B7E5|4A      |      ;
                       LSR A                                ;01B7E6|4A      |      ;
                       STA.B $07                            ;01B7E7|8507    |000007;
                       PLA                                  ;01B7E9|68      |      ;
                       AND.B #$03                           ;01B7EA|2903    |      ;
                       ORA.B $07                            ;01B7EC|0507    |000007;
                       TAY                                  ;01B7EE|A8      |      ;
                       RTS                                  ;01B7EF|60      |      ;
 
 
          CODE_01B7F0: LDA.W $078F                          ;01B7F0|AD8F07  |01078F;
                       ASL A                                ;01B7F3|0A      |      ;
                       ASL A                                ;01B7F4|0A      |      ;
                       ASL A                                ;01B7F5|0A      |      ;
                       ADC.W $078F                          ;01B7F6|6D8F07  |01078F;
                       STA.B $00                            ;01B7F9|8500    |000000;
                       LDA.B #$0F                           ;01B7FB|A90F    |      ;
                       STA.B $01                            ;01B7FD|8501    |000001;
 
          CODE_01B7FF: LDY.B $01                            ;01B7FF|A401    |000001;
                       LDA.W $0790,Y                        ;01B801|B99007  |010790;
                       AND.B #$03                           ;01B804|2903    |      ;
                       BEQ CODE_01B827                      ;01B806|F01F    |01B827;
                       LDA.B $00                            ;01B808|A500    |000000;
                       STA.B $02                            ;01B80A|8502    |000002;
                       LDA.B #$09                           ;01B80C|A909    |      ;
                       STA.B $03                            ;01B80E|8503    |000003;
 
          CODE_01B810: LDY.B $02                            ;01B810|A402    |000002;
                       LDA.W DATA8_01B6B2,Y                 ;01B812|B9B2B6  |01B6B2;
                       JSR.W CODE_01B7E2                    ;01B815|20E2B7  |01B7E2;
                       CPY.B $01                            ;01B818|C401    |000001;
                       BEQ CODE_01B827                      ;01B81A|F00B    |01B827;
                       INC.B $02                            ;01B81C|E602    |000002;
                       DEC.B $03                            ;01B81E|C603    |000003;
                       BNE CODE_01B810                      ;01B820|D0EE    |01B810;
                       LDA.B #$02                           ;01B822|A902    |      ;
                       JMP.W CODE_01B7D8                    ;01B824|4CD8B7  |01B7D8;
 
 
          CODE_01B827: DEC.B $01                            ;01B827|C601    |000001;
                       BPL CODE_01B7FF                      ;01B829|10D4    |01B7FF;
                       RTS                                  ;01B82B|60      |      ;
 
 
          CODE_01B82C: LDX.B #$00                           ;01B82C|A200    |      ;
 
          CODE_01B82E: LDA.W $07A1,X                        ;01B82E|BDA107  |0107A1;
                       STA.B r_pointerQueue,X               ;01B831|9508    |000008;
                       INX                                  ;01B833|E8      |      ;
                       CPX.B #$08                           ;01B834|E008    |      ;
                       BCC CODE_01B82E                      ;01B836|90F6    |01B82E;
                       LDA.B #$00                           ;01B838|A900    |      ;
                       STA.B $00                            ;01B83A|8500    |000000;
                       STA.B $01                            ;01B83C|8501    |000001;
                       LDY.B #$00                           ;01B83E|A000    |      ;
                       LDX.B #$00                           ;01B840|A200    |      ;
 
          CODE_01B842: LSR.B r_pointerQueue,X               ;01B842|5608    |000008;
                       ROR.B $01                            ;01B844|6601    |000001;
                       LSR.B r_pointerQueue,X               ;01B846|5608    |000008;
                       ROR.B $00                            ;01B848|6600    |000000;
                       INX                                  ;01B84A|E8      |      ;
                       INY                                  ;01B84B|C8      |      ;
                       CPY.B #$08                           ;01B84C|C008    |      ;
                       BCC CODE_01B842                      ;01B84E|90F2    |01B842;
                       LDA.B $01                            ;01B850|A501    |000001;
                       STA.W $0789                          ;01B852|8D8907  |010789;
                       LDA.B $00                            ;01B855|A500    |000000;
                       STA.W $0788                          ;01B857|8D8807  |010788;
                       AND.B #$10                           ;01B85A|2910    |      ;
                       LSR A                                ;01B85C|4A      |      ;
                       LSR A                                ;01B85D|4A      |      ;
                       LSR A                                ;01B85E|4A      |      ;
                       LSR A                                ;01B85F|4A      |      ;
                       ORA.B r_02e                          ;01B860|052E    |00002E;
                       STA.B r_02e                          ;01B862|852E    |00002E;
 
          CODE_01B864: RTS                                  ;01B864|60      |      ;
 
 
          CODE_01B865: LDY.B #$50                           ;01B865|A050    |      ;
                       LDA.W $0788                          ;01B867|AD8807  |010788;
                       AND.B #$08                           ;01B86A|2908    |      ;
                       BEQ CODE_01B870                      ;01B86C|F002    |01B870;
                       LDY.B #$A0                           ;01B86E|A0A0    |      ;
 
          CODE_01B870: STY.B $04                            ;01B870|8404    |000004;
                       JSR.W CODE_01B72A                    ;01B872|202AB7  |01B72A;
                       CMP.W $0789                          ;01B875|CD8907  |010789;
                       BEQ CODE_01B864                      ;01B878|F0EA    |01B864;
                       LDA.B #$04                           ;01B87A|A904    |      ;
                       JMP.W CODE_01B7D8                    ;01B87C|4CD8B7  |01B7D8;
 
 
          CODE_01B87F: LDA.W $0788                          ;01B87F|AD8807  |010788;
                       AND.B #$01                           ;01B882|2901    |      ;
                       BNE CODE_01B8B5                      ;01B884|D02F    |01B8B5;
                       LDA.B r_02e                          ;01B886|A52E    |00002E;
                       CMP.B #$12                           ;01B888|C912    |      ;
                       BCS CODE_01B8B0                      ;01B88A|B024    |01B8B0;
                       CMP.B #$10                           ;01B88C|C910    |      ;
                       BCS CODE_01B8B5                      ;01B88E|B025    |01B8B5;
                       LDA.W $0788                          ;01B890|AD8807  |010788;
                       AND.B #$06                           ;01B893|2906    |      ;
                       STA.B $00                            ;01B895|8500    |000000;
                       BEQ CODE_01B8B5                      ;01B897|F01C    |01B8B5;
                       LDA.B r_02e                          ;01B899|A52E    |00002E;
                       AND.B #$08                           ;01B89B|2908    |      ;
                       LSR A                                ;01B89D|4A      |      ;
                       LSR A                                ;01B89E|4A      |      ;
                       LSR A                                ;01B89F|4A      |      ;
                       ORA.B $00                            ;01B8A0|0500    |000000;
                       TAY                                  ;01B8A2|A8      |      ;
                       LDA.B r_02e                          ;01B8A3|A52E    |00002E;
                       AND.B #$07                           ;01B8A5|2907    |      ;
                       TAX                                  ;01B8A7|AA      |      ;
                       LDA.W LOOSE_OP_01B8B4,Y              ;01B8A8|B9B4B8  |01B8B4;
                       AND.W DATA8_01B8BC,X                 ;01B8AB|3DBCB8  |01B8BC;
                       BNE CODE_01B8B5                      ;01B8AE|D005    |01B8B5;
 
          CODE_01B8B0: LDA.B #$08                           ;01B8B0|A908    |      ;
                       JMP.W CODE_01B7D8                    ;01B8B2|4CD8B7  |01B7D8;
 
 
          CODE_01B8B5: RTS                                  ;01B8B5|60      |      ;
 
                       db $07,$03,$2F,$FF,$00,$3D           ;01B8B6|        |      ;
 
         DATA8_01B8BC: db $80,$40,$20,$10,$08,$04,$02,$01   ;01B8BC|        |      ;
 
          CODE_01B8C4: LDA.W $0788                          ;01B8C4|AD8807  |010788;
                       STA.B $00                            ;01B8C7|8500    |000000;
                       LDA.W $0789                          ;01B8C9|AD8907  |010789;
                       STA.B $01                            ;01B8CC|8501    |000001;
                       LDX.B #$08                           ;01B8CE|A208    |      ;
                       LDA.B #$00                           ;01B8D0|A900    |      ;
 
          CODE_01B8D2: STA.B r_pointerQueue,X               ;01B8D2|9508    |000008;
                       DEX                                  ;01B8D4|CA      |      ;
                       BPL CODE_01B8D2                      ;01B8D5|10FB    |01B8D2;
                       LDX.B #$00                           ;01B8D7|A200    |      ;
 
          CODE_01B8D9: LSR.B $00                            ;01B8D9|4600    |000000;
                       ROL.B r_pointerQueue,X               ;01B8DB|3608    |000008;
                       LSR.B $01                            ;01B8DD|4601    |000001;
                       ROL.B r_pointerQueue,X               ;01B8DF|3608    |000008;
                       INX                                  ;01B8E1|E8      |      ;
                       CPX.B #$08                           ;01B8E2|E008    |      ;
                       BCC CODE_01B8D9                      ;01B8E4|90F3    |01B8D9;
                       LDA.B r_02e                          ;01B8E6|A52E    |00002E;
                       LSR A                                ;01B8E8|4A      |      ;
                       TAY                                  ;01B8E9|A8      |      ;
                       LDX.B #$02                           ;01B8EA|A202    |      ;
 
          CODE_01B8EC: LDA.W DATA8_01B937,Y                 ;01B8EC|B937B9  |01B937;
                       AND.B #$0C                           ;01B8EF|290C    |      ;
                       LSR A                                ;01B8F1|4A      |      ;
                       LSR A                                ;01B8F2|4A      |      ;
                       STA.B $00                            ;01B8F3|8500    |000000;
                       LDA.W DATA8_01B937,Y                 ;01B8F5|B937B9  |01B937;
                       AND.B #$30                           ;01B8F8|2930    |      ;
                       ORA.B $00                            ;01B8FA|0500    |000000;
                       CMP.W DATA8_01B7DF,X                 ;01B8FC|DDDFB7  |01B7DF;
                       BEQ CODE_01B904                      ;01B8FF|F003    |01B904;
                       DEX                                  ;01B901|CA      |      ;
                       BPL CODE_01B8EC                      ;01B902|10E8    |01B8EC;
 
          CODE_01B904: STX.W $078F                          ;01B904|8E8F07  |01078F;
                       TXA                                  ;01B907|8A      |      ;
                       ASL A                                ;01B908|0A      |      ;
                       ASL A                                ;01B909|0A      |      ;
                       ASL A                                ;01B90A|0A      |      ;
                       ADC.W $078F                          ;01B90B|6D8F07  |01078F;
                       TAY                                  ;01B90E|A8      |      ;
                       LDX.B #$00                           ;01B90F|A200    |      ;
 
          CODE_01B911: LDA.W DATA8_01B6B3,Y                 ;01B911|B9B3B6  |01B6B3;
                       AND.B #$30                           ;01B914|2930    |      ;
                       STA.B $01                            ;01B916|8501    |000001;
                       LDA.W DATA8_01B6B3,Y                 ;01B918|B9B3B6  |01B6B3;
                       AND.B #$03                           ;01B91B|2903    |      ;
                       ASL A                                ;01B91D|0A      |      ;
                       ASL A                                ;01B91E|0A      |      ;
                       ORA.B $01                            ;01B91F|0501    |000001;
                       ORA.B r_pointerQueue,X               ;01B921|1508    |000008;
                       STA.W $07A1,X                        ;01B923|9DA107  |0107A1;
                       INY                                  ;01B926|C8      |      ;
                       INX                                  ;01B927|E8      |      ;
                       CPX.B #$09                           ;01B928|E009    |      ;
                       BCC CODE_01B911                      ;01B92A|90E5    |01B911;
                       LDA.B r_02e                          ;01B92C|A52E    |00002E;
                       LSR A                                ;01B92E|4A      |      ;
                       TAY                                  ;01B92F|A8      |      ;
                       LDA.W DATA8_01B937,Y                 ;01B930|B937B9  |01B937;
                       STA.W $07A0                          ;01B933|8DA007  |0107A0;
                       RTS                                  ;01B936|60      |      ;
 
 
         DATA8_01B937: db $01,$1B,$02,$35,$19,$03,$37,$1A   ;01B937|        |      ;
                       db $36                               ;01B93F|        |      ;
 
          CODE_01B940: LDA.B #$00                           ;01B940|A900    |      ;
                       STA.B $00                            ;01B942|8500    |000000;
                       LDX.B #$05                           ;01B944|A205    |      ;
 
          CODE_01B946: LDY.B $00                            ;01B946|A400    |000000;
                       LDA.W $07A0,Y                        ;01B948|B9A007  |0107A0;
                       AND.B #$03                           ;01B94B|2903    |      ;
                       TAY                                  ;01B94D|A8      |      ;
                       LDA.W DATA8_01B982,Y                 ;01B94E|B982B9  |01B982;
                       STA.W $0400,X                        ;01B951|9D0004  |010400;
                       LDA.W DATA8_01B97E,Y                 ;01B954|B97EB9  |01B97E;
                       STA.W $048C,X                        ;01B957|9D8C04  |01048C;
                       LDY.B $00                            ;01B95A|A400    |000000;
                       LDA.W $07A0,Y                        ;01B95C|B9A007  |0107A0;
                       AND.B #$3C                           ;01B95F|293C    |      ;
                       LSR A                                ;01B961|4A      |      ;
                       TAY                                  ;01B962|A8      |      ;
                       LDA.W DATA8_01B986,Y                 ;01B963|B986B9  |01B986;
                       STA.W $041C,X                        ;01B966|9D1C04  |01041C;
                       LDA.W DATA8_01B987,Y                 ;01B969|B987B9  |01B987;
                       STA.W $0438,X                        ;01B96C|9D3804  |010438;
                       LDA.B #$00                           ;01B96F|A900    |      ;
                       STA.W $0454,X                        ;01B971|9D5404  |010454;
                       INX                                  ;01B974|E8      |      ;
                       INC.B $00                            ;01B975|E600    |000000;
                       LDA.B $00                            ;01B977|A500    |000000;
                       CMP.B #$09                           ;01B979|C909    |      ;
                       BCC CODE_01B946                      ;01B97B|90C9    |01B946;
                       RTS                                  ;01B97D|60      |      ;
 
 
         DATA8_01B97E: db $00,$14,$0C,$0C                   ;01B97E|        |      ;
 
         DATA8_01B982: db $00,$42,$FC,$F4                   ;01B982|        |      ;
 
         DATA8_01B986: db $7A                               ;01B986|        |      ;
 
         DATA8_01B987: db $5D,$7A,$75,$7A,$8D,$7A,$A5,$92   ;01B987|        |      ;
                       db $5D,$92,$75,$92,$8D,$92,$A5,$AA   ;01B98F|        |      ;
                       db $5D,$AA,$75                       ;01B997|        |      ;
 
         DATA8_01B99A: db $AA,$8D,$AA,$A5,$C2,$5D,$C2,$75   ;01B99A|        |      ;
                       db $C2,$8D,$C2,$A5                   ;01B9A2|        |      ;
 
RLE_tilemap_0c_nameScreen: dw $2000                             ;01B9A6|        |      ;
                       db $8E,$F6,$F7,$F6,$F7,$F6,$F7,$F6   ;01B9A8|        |      ;
                       db $F7,$F6,$F7,$F6,$F7,$F6,$F7,$06   ;01B9B0|        |      ;
                       db $00,$99,$F6,$F7,$F6,$F7,$F6,$F7   ;01B9B8|        |      ;
                       db $F6,$F7,$F6,$F7,$F6,$ED,$F6,$F6   ;01B9C0|        |      ;
                       db $F7,$F6,$F7,$F6,$F7,$F6,$F7,$F6   ;01B9C8|        |      ;
                       db $F7,$F6,$F7,$08,$00,$93,$F6,$F7   ;01B9D0|        |      ;
                       db $F6,$F7,$F6,$F7,$EB,$EC,$F6,$F7   ;01B9D8|        |      ;
                       db $F6,$F6,$F7,$F6,$F7,$F6,$F7,$F6   ;01B9E0|        |      ;
                       db $F7,$14,$00,$8B,$FC,$F7,$F6,$F7   ;01B9E8|        |      ;
                       db $F7,$F6,$F7,$F6,$F7,$F6,$F7,$14   ;01B9F0|        |      ;
                       db $00,$9C,$F6,$F7,$FD,$F7,$F6,$F6   ;01B9F8|        |      ;
                       db $F7,$F6,$F7,$FD,$F7,$00,$00,$54   ;01BA00|        |      ;
                       db $5D,$63,$54,$61,$00,$68,$5E,$64   ;01BA08|        |      ;
                       db $61,$00,$5D,$50,$5C,$54,$05,$00   ;01BA10|        |      ;
                       db $89,$F6,$F7,$F6,$F7,$F7,$F6,$F7   ;01BA18|        |      ;
                       db $F6,$F7,$16,$00,$8D,$F6,$F7,$F6   ;01BA20|        |      ;
                       db $F7,$FD,$F6,$F7,$FD,$ED,$F6,$F7   ;01BA28|        |      ;
                       db $F6,$F7,$03,$00,$81,$80,$08,$81   ;01BA30|        |      ;
                       db $81,$82,$03,$00,$8F,$F6,$F7,$F6   ;01BA38|        |      ;
                       db $F7,$FD,$F7,$F6,$F7,$ED,$F6,$ED   ;01BA40|        |      ;
                       db $F6,$F7,$F6,$F7,$04,$00,$81,$90   ;01BA48|        |      ;
                       db $08,$00,$81,$92,$04,$00,$8F,$F6   ;01BA50|        |      ;
                       db $F7,$F6,$F7,$FD,$F7,$FD,$F6,$ED   ;01BA58|        |      ;
                       db $F6,$ED,$F6,$F7,$FD,$F7,$03,$00   ;01BA60|        |      ;
                       db $81,$A0,$08,$A1,$81,$A2,$07,$00   ;01BA68|        |      ;
                       db $8B,$F6,$F7,$EB,$ED,$ED,$F6       ;01BA70|        |      ;
 
           GFX_01BA77: db $F7,$F6,$ED,$F6,$F7               ;01BA77|        |      ;
 
           GFX_01BA7C: db $14,$00,$8B,$F6,$F7,$F6,$FB,$FC   ;01BA7C|        |      ;
                       db $F6,$F7,$FD,$F7,$FD,$F7,$16,$00   ;01BA84|        |      ;
                       db $89,$F6,$F7,$FD,$F7,$FB,$FD,$ED   ;01BA8C|        |      ;
                       db $F6,$F7,$14,$00,$8D,$F6,$F7,$F6   ;01BA94|        |      ;
                       db $ED,$F6,$F7,$FD,$F6,$ED,$EB,$EC   ;01BA9C|        |      ;
                       db $FD,$F7,$12,$00,$8F,$F6,$ED,$F6   ;01BAA4|        |      ;
                       db $ED,$FD,$F7,$EB,$EC,$F7,$FB,$FB   ;01BAAC|        |      ;
                       db $FC,$F7,$F6,$F7,$10,$00,$84,$F6   ;01BAB4|        |      ;
 
           GFX_01BABC: db $F7,$F6,$F7,$03,$F6,$C8,$FB,$FC   ;01BABC|        |      ;
                       db $F6,$F7,$FD,$F7,$CB,$CC,$CD,$CE   ;01BAC4|        |      ;
                       db $CD,$CE,$CD,$CE,$CD,$CE,$CD,$CE   ;01BACC|        |      ;
                       db $CD,$CE,$CD,$CE,$CD,$CE,$CD,$CE   ;01BAD4|        |      ;
                       db $CD                               ;01BADC|        |      ;
 
           GFX_01BADD: db $CE,$CB,$CC,$F6,$ED,$F6,$ED,$ED   ;01BADD|        |      ;
                       db $F6,$ED,$FD,$DB,$DC,$DD,$DE,$DD   ;01BAE5|        |      ;
                       db $DE,$DD,$DE,$DD,$DE,$DD,$DE,$DD   ;01BAED|        |      ;
                       db $DE,$DD,$DE,$DD,$DE,$DD,$DE,$DD   ;01BAF5|        |      ;
                       db $DE,$DB,$DC,$ED,$F6,$F7,$F6,$F6   ;01BAFD|        |      ;
                       db $EC,$EB,$F7,$C0,$C1,$14,$00,$AC   ;01BB05|        |      ;
                       db $C4,$C5,$F6,$F7,$EB,$EC,$FB,$FC   ;01BB0D|        |      ;
                       db $FB,$FC,$D0,$D1,$00,$50,$00,$51   ;01BB15|        |      ;
                       db $00,$52,$00,$53,$00,$54,$00,$55   ;01BB1D|        |      ;
                       db $00,$56,$00,$57,$00,$58,$00,$00   ;01BB25|        |      ;
                       db $D4,$D5,$F7,$EB,$FB,$FC,$EB,$EC   ;01BB2D|        |      ;
                       db $EB,$FC,$E0,$E1,$14,$00,$AC,$E4   ;01BB35|        |      ;
                       db $E5,$EB,$EC,$EB,$F7,$FB,$FC,$FB   ;01BB3D|        |      ;
                       db $F7,$F0,$F1,$00,$59,$00,$5A,$00   ;01BB45|        |      ;
                       db $5B,$00,$5C,$00,$5D,$00,$5E,$00   ;01BB4D|        |      ;
                       db $5F,$00,$60,$00,$61,$00,$00,$F4   ;01BB55|        |      ;
                       db $F5,$FB,$FC,$FB,$FC,$EB,$EC,$EB   ;01BB5D|        |      ;
                       db $F6,$C2,$C3,$14,$00,$AC,$C6,$C7   ;01BB65|        |      ;
                       db $EB,$ED,$F6,$EC,$FB,$FC,$ED,$F7   ;01BB6D|        |      ;
                       db $D2,$D3,$00,$62,$00,$63,$00,$64   ;01BB75|        |      ;
                       db $00,$65,$00,$66,$00,$67,$00,$68   ;01BB7D|        |      ;
                       db $00,$69,$00,$FE,$00,$00,$D6,$D7   ;01BB85|        |      ;
                       db $FB,$FC,$FB,$FC,$EB,$EC,$EB,$EC   ;01BB8D|        |      ;
                       db $E2,$E3,$14,$00,$92,$E6,$E7,$FD   ;01BB95|        |      ;
                       db $F7,$EB,$ED,$F7,$FC,$ED,$FC,$F2   ;01BB9D|        |      ;
                       db $F3,$00,$6A,$00,$6B,$00,$4B,$05   ;01BBA5|        |      ;
                       db $00,$95,$CF,$00,$DF,$00,$00,$EE   ;01BBAD|        |      ;
                       db $EF,$00,$00,$F2,$F3,$F7,$FD,$FB   ;01BBB5|        |      ;
                       db $FC,$EB,$ED,$EB,$F7,$CB,$CC,$14   ;01BBBD|        |      ;
                       db $00,$CC,$CB,$CC,$EB,$ED,$EB,$EC   ;01BBC5|        |      ;
                       db $FB,$FC,$FB,$FC,$DB,$DC,$CD,$CE   ;01BBCD|        |      ;
                       db $CD,$CE,$CD,$CE,$CD,$CE,$CD,$CE   ;01BBD5|        |      ;
                       db $CD,$CE,$CD,$CE,$CD,$CE,$CD,$CE   ;01BBDD|        |      ;
                       db $CD,$CE,$DB,$DC,$FB,$FC,$FD,$FC   ;01BBE5|        |      ;
                       db $F6,$EC,$EB,$F7,$CB,$CC,$DD,$DE   ;01BBED|        |      ;
                       db $DD,$DE,$DD,$DE,$DD,$DE,$DD,$DE   ;01BBF5|        |      ;
                       db $DD,$DE,$DD,$DE,$DD,$DE,$DD,$DE   ;01BBFD|        |      ;
                       db $DD,$DE,$CB,$CC,$EB,$F7,$EB,$EC   ;01BC05|        |      ;
                       db $FB,$FC,$FB,$FC,$DB,$DC,$14,$F3   ;01BC0D|        |      ;
                       db $90,$DB,$DC,$FB,$FC,$FB,$FD,$EB   ;01BC15|        |      ;
                       db $EC,$EB,$F7,$F2,$F2,$F3,$F2,$F2   ;01BC1D|        |      ;
                       db $F3,$03,$F2,$82,$F3,$F2,$04,$F3   ;01BC25|        |      ;
                       db $04,$F2,$B3,$F3,$F2,$F2,$F3,$F2   ;01BC2D|        |      ;
                       db $EB,$EC,$EB,$EC,$FB,$FC,$FB,$FD   ;01BC35|        |      ;
                       db $D4,$EB,$EC,$EB,$EC,$EB,$F7,$EB   ;01BC3D|        |      ;
                       db $F7,$FD,$ED,$F6,$F7,$FD,$F7,$F6   ;01BC45|        |      ;
                       db $F7,$FB,$FC,$EC,$FB,$FC,$ED,$EB   ;01BC4D|        |      ;
                       db $FB,$FC,$FB,$FC,$FF,$FF,$0F,$03   ;01BC55|        |      ;
                       db $00,$0F,$CF,$FF,$FF,$F3,$04,$00   ;01BC5D|        |      ;
                       db $84,$FC,$FF,$FF,$3F,$04,$00,$84   ;01BC65|        |      ;
                       db $FC,$FF,$FF,$0F,$03,$00,$85,$0C   ;01BC6D|        |      ;
                       db $0F,$FF,$FF,$22,$04,$00,$84,$88   ;01BC75|        |      ;
                       db $FF,$FF,$22,$04,$00,$83,$88,$FF   ;01BC7D|        |      ;
                       db $FF,$06,$00,$81,$FF,$08,$0F,$FF   ;01BC85|        |      ;
 
          CODE_01BC8D: LDA.W $0565,X                        ;01BC8D|BD6505  |010565;
                       LSR A                                ;01BC90|4A      |      ;
                       LSR A                                ;01BC91|4A      |      ;
                       LSR A                                ;01BC92|4A      |      ;
                       LSR A                                ;01BC93|4A      |      ;
                       LSR A                                ;01BC94|4A      |      ;
                       LSR A                                ;01BC95|4A      |      ;
                       db $20                               ;01BC96|        |      ;
                       dw jumpFromStackYXpreserved          ;01BC97|        |0FE86D;
                       dw CODE_01BC9F                       ;01BC99|        |01BC9F;
                       dw CODE_01BCA7                       ;01BC9B|        |01BCA7;
                       dw CODE_01BCBC                       ;01BC9D|        |01BCBC;
 
          CODE_01BC9F: LDA.B #$80                           ;01BC9F|A980    |      ;
                       STA.W $05D8,X                        ;01BCA1|9DD805  |0105D8;
                       db $4C                               ;01BCA4|        |      ;
 
                       dw UNREACH_0FFF8A                    ;01BCA5|        |0FFF8A;
 
          CODE_01BCA7: DEC.W $05D8,X                        ;01BCA7|DED805  |0105D8;
                       BNE CODE_01BCBB                      ;01BCAA|D00F    |01BCBB;
                       LDA.B #$08                           ;01BCAC|A908    |      ;
                       STA.W $05D8,X                        ;01BCAE|9DD805  |0105D8;
                       LDA.W $0565,X                        ;01BCB1|BD6505  |010565;
                       AND.B #$BF                           ;01BCB4|29BF    |      ;
                       ORA.B #$80                           ;01BCB6|0980    |      ;
                       STA.W $0565,X                        ;01BCB8|9D6505  |010565;
 
          CODE_01BCBB: RTS                                  ;01BCBB|60      |      ;
 
 
          CODE_01BCBC: LDA.B r_gameStateLoopCounter         ;01BCBC|A51A    |00001A;
                       AND.B #$03                           ;01BCBE|2903    |      ;
                       BNE CODE_01BCBB                      ;01BCC0|D0F9    |01BCBB;
                       LDA.W $054E,X                        ;01BCC2|BD4E05  |01054E;
                       CMP.B #$57                           ;01BCC5|C957    |      ;
                       BEQ CODE_01BCF0                      ;01BCC7|F027    |01BCF0;
                       CMP.B #$5B                           ;01BCC9|C95B    |      ;
                       BEQ CODE_01BCF0                      ;01BCCB|F023    |01BCF0;
                       LDA.W $0454,X                        ;01BCCD|BD5404  |010454;
                       EOR.B #$04                           ;01BCD0|4904    |      ;
                       STA.W $0454,X                        ;01BCD2|9D5404  |010454;
                       LDA.W $05D8,X                        ;01BCD5|BDD805  |0105D8;
                       BEQ CODE_01BCDF                      ;01BCD8|F005    |01BCDF;
                       DEC.W $05D8,X                        ;01BCDA|DED805  |0105D8;
                       BNE CODE_01BCBB                      ;01BCDD|D0DC    |01BCBB;
 
          CODE_01BCDF: LDA.W $0454,X                        ;01BCDF|BD5404  |010454;
                       AND.B #$FB                           ;01BCE2|29FB    |      ;
                       STA.W $0454,X                        ;01BCE4|9D5404  |010454;
 
          CODE_01BCE7: LDA.W $0470,X                        ;01BCE7|BD7004  |010470;
                       AND.B #$FD                           ;01BCEA|29FD    |      ;
                       STA.W $0470,X                        ;01BCEC|9D7004  |010470;
 
          CODE_01BCEF: RTS                                  ;01BCEF|60      |      ;
 
 
          CODE_01BCF0: LDA.W $0454,X                        ;01BCF0|BD5404  |010454;
                       AND.B #$04                           ;01BCF3|2904    |      ;
                       BNE CODE_01BD0E                      ;01BCF5|D017    |01BD0E;
                       LDA.B #$04                           ;01BCF7|A904    |      ;
 
          CODE_01BCF9: STA.W $0454,X                        ;01BCF9|9D5404  |010454;
                       LDA.W $05D8,X                        ;01BCFC|BDD805  |0105D8;
                       BEQ CODE_01BD06                      ;01BCFF|F005    |01BD06;
                       DEC.W $05D8,X                        ;01BD01|DED805  |0105D8;
                       BNE CODE_01BCEF                      ;01BD04|D0E9    |01BCEF;
 
          CODE_01BD06: LDA.B #$03                           ;01BD06|A903    |      ;
                       STA.W $0454,X                        ;01BD08|9D5404  |010454;
                       JMP.W CODE_01BCE7                    ;01BD0B|4CE7BC  |01BCE7;
 
 
          CODE_01BD0E: LDA.B #$03                           ;01BD0E|A903    |      ;
                       BNE CODE_01BCF9                      ;01BD10|D0E7    |01BCF9;
 
          CODE_01BD12: LDY.W $0645,X                        ;01BD12|BC4506  |010645;
                       LDA.W DATA8_01BD27,Y                 ;01BD15|B927BD  |01BD27;
                       STA.B r_roomSectionChrBanksDataOffset;01BD18|850F    |00000F;
                       LDA.W DATA8_01BD47,Y                 ;01BD1A|B947BD  |01BD47;
                       TAY                                  ;01BD1D|A8      |      ;
                       LDA.W $00F0,Y                        ;01BD1E|B9F000  |0100F0;
                       ORA.B r_roomSectionChrBanksDataOffset;01BD21|050F    |00000F;
                       STA.W $00F0,Y                        ;01BD23|99F000  |0100F0;
                       RTS                                  ;01BD26|60      |      ;
 
 
         DATA8_01BD27: db $01,$02,$04,$08,$10,$20,$40,$80   ;01BD27|        |      ;
                       db $01,$02,$04,$08,$10,$20,$40,$80   ;01BD2F|        |      ;
                       db $01,$02,$04,$08,$10,$20,$40,$80   ;01BD37|        |      ;
                       db $01,$02,$04,$08,$10,$20,$40,$80   ;01BD3F|        |      ;
 
         DATA8_01BD47: db $00,$00,$00,$00,$00,$00,$00,$00   ;01BD47|        |      ;
                       db $01,$01,$01,$01,$01,$01,$01,$01   ;01BD4F|        |      ;
                       db $02,$02,$02,$02,$02,$02,$02,$02   ;01BD57|        |      ;
                       db $03,$03,$03,$03,$03,$03,$03,$03   ;01BD5F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD67|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD6F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD77|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD7F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD87|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD8F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD97|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BD9F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDA7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDAF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDB7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDBF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDC7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDCF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDD7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDDF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDE7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDEF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDF7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BDFF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE07|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE0F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE17|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE1F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE27|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE2F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE37|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE3F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE47|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE4F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE57|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE5F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE67|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE6F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE77|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE7F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE87|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE8F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE97|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BE9F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEA7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEAF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEB7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEBF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEC7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BECF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BED7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEDF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEE7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEEF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEF7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BEFF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF07|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF0F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF17|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF1F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF27|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF2F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF37|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF3F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF47|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF4F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF57|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF5F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF67|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF6F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF77|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF7F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF87|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF8F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF97|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BF9F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFA7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFAF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFB7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFBF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFC7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFCF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFD7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFDF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFE7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFEF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;01BFF7|        |      ;
                       db $FF                               ;01BFFF|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C7F8|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01C9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01CFF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01D9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01DFF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1B8|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E988|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01E9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ECF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01ED98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EDF8|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01EFF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01F9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FBF8|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FEF8|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF78|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;01FFF8|        |      ;
