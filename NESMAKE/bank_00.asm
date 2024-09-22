 
 
 
              bank_80: db $80                               ;008000|        |      ; NES PRG 0000
 
 
    loadPlayerCHRBank: LDY.W r_EntityObjectIdxes            ;008001|AC4E05  |00054E;
                       LDA.W playerCHRBankdata,Y            ;008004|B90F80  |00800F;
                       STA.B r_ChrBankSpr_0000              ;008007|8546    |000046;
                       CLC                                  ;008009|18      |      ;
                       ADC.B #$01                           ;00800A|6901    |      ;
 
                       STA.B r_ChrBankSpr_0400              ;00800C|8547    |000047;
                       RTS                                  ;00800E|60      |      ;
 
 
    playerCHRBankdata: db $00,$04,$02,$06                   ;00800F|        |      ;
 
 getCurrRoomsChrBanks: LDA.B r_CurrRoomGroupStage           ;008013|A532    |000032;
                       ASL A                                ;008015|0A      |      ;
                       TAY                                  ;008016|A8      |      ;
                       LDA.W roomCHRbanks,Y                 ;008017|B96680  |008066;
                       STA.B r_CurrNumToVramQueue           ;00801A|8508    |000008;
                       LDA.W PTR16_008067,Y                 ;00801C|B96780  |008067;
                       STA.B $09                            ;00801F|8509    |000009;
                       LDA.B r_CurrRoomSectionBlock         ;008021|A533    |000033;
                       ASL A                                ;008023|0A      |      ;
                       ASL A                                ;008024|0A      |      ;
                       STA.B r_RoomSectionChrBanksDataOffset;008025|850F    |00000F;
                       TAY                                  ;008027|A8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;008028|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00802A|850A    |00000A;
                       INY                                  ;00802C|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00802D|B108    |000008;
                       STA.B $0B                            ;00802F|850B    |00000B;
                       LDA.B r_CurrRoomIdx                  ;008031|A534    |000034;
                       ASL A                                ;008033|0A      |      ;
                       CLC                                  ;008034|18      |      ;
                       ADC.B r_CurrRoomIdx                  ;008035|6534    |000034;
                       TAY                                  ;008037|A8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;008038|B10A    |00000A;
                       STA.B r_ChrBankBG_0400               ;00803A|854B    |00004B;
                       INY                                  ;00803C|C8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00803D|B10A    |00000A;
                       STA.B r_ChrBankBG_0800               ;00803F|854C    |00004C;
                       INY                                  ;008041|C8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;008042|B10A    |00000A;
                       STA.B r_ChrBankSecondQuest_1400      ;008044|854E    |00004E;
                       LDY.B r_RoomSectionChrBanksDataOffset;008046|A40F    |00000F;
                       INY                                  ;008048|C8      |      ;
                       INY                                  ;008049|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00804A|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00804C|850A    |00000A;
                       INY                                  ;00804E|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00804F|B108    |000008;
                       STA.B $0B                            ;008051|850B    |00000B;
                       LDA.B r_CurrRoomIdx                  ;008053|A534    |000034;
 
                       ASL A                                ;008055|0A      |      ;
                       TAY                                  ;008056|A8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;008057|B10A    |00000A;
                       STA.B r_ChrBankSpr_0800              ;008059|8548    |000048;
                       INY                                  ;00805B|C8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00805C|B10A    |00000A;
                       STA.B r_ChrBankSpr_0c00              ;00805E|8549    |000049;
                       db $20                               ;008060|        |      ;
                       dw CODE_0FE33C                       ;008061|        |0FE33C;
                       db $4C                               ;008063|        |      ;
 
                       dw CODE_0FE35D                       ;008064|        |0FE35D;
 
         roomCHRbanks: dw chrGroup00                        ;008066|        |008084;
                       dw chrGroup01                        ;008068|        |008094;
                       dw PTR16_0080AC                      ;00806A|        |0080AC;
                       dw chrGroup03                        ;00806C|        |0080C0;
                       dw chrGroup04                        ;00806E|        |0080D4;
                       dw chrGroup05                        ;008070|        |0080E0;
                       dw chrGroup06                        ;008072|        |0080F0;
                       dw chrGroup07                        ;008074|        |0080FC;
 
                       dw chrGroup08                        ;008076|        |008118;
 
                       dw chrGroup09                        ;008078|        |00812C;
                       dw chrGroup0a                        ;00807A|        |008134;
                       dw chrGroup0b                        ;00807C|        |008150;
                       dw chrGroup0c                        ;00807E|        |00815C;
 
                       dw chrGroup0d                        ;008080|        |008168;
                       dw chrGroup0e                        ;008082|        |008178;
 
           chrGroup00: dw chrGroupData00                    ;008084|        |008184;
                       dw DATA8_0082E0                      ;008086|        |0082E0;
                       dw chrGroupData01                    ;008088|        |008187;
                       dw DATA8_0082E2                      ;00808A|        |0082E2;
                       dw chrGroupData02                    ;00808C|        |008193;
                       dw DATA8_0082EA                      ;00808E|        |0082EA;
                       dw chrGroupData03                    ;008090|        |008199;
                       dw DATA8_0082EE                      ;008092|        |0082EE;
 
           chrGroup01: dw DATA8_00819C                      ;008094|        |00819C;
                       dw DATA8_0082F0                      ;008096|        |0082F0;
                       dw DATA8_0081A5                      ;008098|        |0081A5;
                       dw DATA8_0082F6                      ;00809A|        |0082F6;
                       dw DATA8_0081AE                      ;00809C|        |0081AE;
                       dw DATA8_0082FC                      ;00809E|        |0082FC;
                       dw DATA8_0081AE                      ;0080A0|        |0081AE;
                       dw DATA8_008302                      ;0080A2|        |008302;
                       dw DATA8_0081A5                      ;0080A4|        |0081A5;
                       dw DATA8_008308                      ;0080A6|        |008308;
                       dw DATA8_00819C                      ;0080A8|        |00819C;
                       dw DATA8_00830E                      ;0080AA|        |00830E;
 
         PTR16_0080AC: dw DATA8_0081B7                      ;0080AC|        |0081B7;
                       dw DATA8_008314                      ;0080AE|        |008314;
                       dw DATA8_0081BD                      ;0080B0|        |0081BD;
                       dw DATA8_008318                      ;0080B2|        |008318;
                       dw DATA8_0081C0                      ;0080B4|        |0081C0;
                       dw DATA8_00831A                      ;0080B6|        |00831A;
                       dw DATA8_0081C6                      ;0080B8|        |0081C6;
                       dw DATA8_00831E                      ;0080BA|        |00831E;
 
                       dw DATA8_0081CF                      ;0080BC|        |0081CF;
                       dw DATA8_008324                      ;0080BE|        |008324;
 
           chrGroup03: dw DATA8_0081D5                      ;0080C0|        |0081D5;
 
                       dw DATA8_008328                      ;0080C2|        |008328;
                       dw DATA8_0081DE                      ;0080C4|        |0081DE;
                       dw DATA8_00832E                      ;0080C6|        |00832E;
                       dw DATA8_0081E4                      ;0080C8|        |0081E4;
                       dw DATA8_008332                      ;0080CA|        |008332;
                       dw DATA8_0081EA                      ;0080CC|        |0081EA;
                       dw DATA8_008336                      ;0080CE|        |008336;
                       dw DATA8_0081F0                      ;0080D0|        |0081F0;
                       dw DATA8_00833A                      ;0080D2|        |00833A;
 
           chrGroup04: dw DATA8_0081F9                      ;0080D4|        |0081F9;
                       dw DATA8_008340                      ;0080D6|        |008340;
                       dw DATA8_0081F9                      ;0080D8|        |0081F9;
                       dw DATA8_008346                      ;0080DA|        |008346;
                       dw DATA8_008202                      ;0080DC|        |008202;
                       dw DATA8_00834C                      ;0080DE|        |00834C;
 
           chrGroup05: dw DATA8_00820B                      ;0080E0|        |00820B;
                       dw DATA8_008352                      ;0080E2|        |008352;
                       dw DATA8_00820B                      ;0080E4|        |00820B;
 
                       dw DATA8_008354                      ;0080E6|        |008354;
 
                       dw DATA8_00820E                      ;0080E8|        |00820E;
                       dw DATA8_008356                      ;0080EA|        |008356;
                       dw DATA8_00820E                      ;0080EC|        |00820E;
                       dw DATA8_00835A                      ;0080EE|        |00835A;
 
           chrGroup06: dw DATA8_008214                      ;0080F0|        |008214;
                       dw DATA8_00835E                      ;0080F2|        |00835E;
                       dw DATA8_00821A                      ;0080F4|        |00821A;
                       dw DATA8_008362                      ;0080F6|        |008362;
                       dw DATA8_00821D                      ;0080F8|        |00821D;
                       dw DATA8_008364                      ;0080FA|        |008364;
 
           chrGroup07: dw DATA8_008226                      ;0080FC|        |008226;
                       dw DATA8_00836A                      ;0080FE|        |00836A;
                       dw DATA8_00822C                      ;008100|        |00822C;
                       dw DATA8_00836E                      ;008102|        |00836E;
                       dw DATA8_00822C                      ;008104|        |00822C;
                       dw DATA8_008370                      ;008106|        |008370;
                       dw DATA8_00822C                      ;008108|        |00822C;
                       dw DATA8_008372                      ;00810A|        |008372;
                       dw DATA8_00822F                      ;00810C|        |00822F;
                       dw DATA8_008374                      ;00810E|        |008374;
                       dw DATA8_008235                      ;008110|        |008235;
                       dw DATA8_008378                      ;008112|        |008378;
                       dw DATA8_00823B                      ;008114|        |00823B;
                       dw DATA8_00837C                      ;008116|        |00837C;
 
           chrGroup08: dw DATA8_00823E                      ;008118|        |00823E;
                       dw DATA8_00837E                      ;00811A|        |00837E;
                       dw DATA8_008244                      ;00811C|        |008244;
                       dw DATA8_008382                      ;00811E|        |008382;
                       dw DATA8_008247                      ;008120|        |008247;
                       dw DATA8_008384                      ;008122|        |008384;
                       dw DATA8_008244                      ;008124|        |008244;
                       dw DATA8_008388                      ;008126|        |008388;
                       dw DATA8_008244                      ;008128|        |008244;
                       dw DATA8_00838A                      ;00812A|        |00838A;
 
           chrGroup09: dw DATA8_00824D                      ;00812C|        |00824D;
                       dw DATA8_00838C                      ;00812E|        |00838C;
                       dw DATA8_008253                      ;008130|        |008253;
                       dw DATA8_008390                      ;008132|        |008390;
 
           chrGroup0a: dw DATA8_00825C                      ;008134|        |00825C;
                       dw DATA8_008396                      ;008136|        |008396;
                       dw DATA8_008262                      ;008138|        |008262;
                       dw DATA8_00839A                      ;00813A|        |00839A;
                       dw DATA8_008265                      ;00813C|        |008265;
                       dw DATA8_00839C                      ;00813E|        |00839C;
                       dw DATA8_008268                      ;008140|        |008268;
                       dw DATA8_00839E                      ;008142|        |00839E;
                       dw DATA8_00826E                      ;008144|        |00826E;
                       dw DATA8_0083A2                      ;008146|        |0083A2;
                       dw DATA8_008277                      ;008148|        |008277;
                       dw DATA8_0083A8                      ;00814A|        |0083A8;
                       dw DATA8_00827D                      ;00814C|        |00827D;
                       dw DATA8_0083AC                      ;00814E|        |0083AC;
 
           chrGroup0b: dw DATA8_008286                      ;008150|        |008286;
                       dw DATA8_0083B2                      ;008152|        |0083B2;
                       dw DATA8_00828C                      ;008154|        |00828C;
                       dw DATA8_0083B6                      ;008156|        |0083B6;
                       dw DATA8_008292                      ;008158|        |008292;
                       dw DATA8_0083BA                      ;00815A|        |0083BA;
 
           chrGroup0c: dw DATA8_00829B                      ;00815C|        |00829B;
                       dw DATA8_0083C0                      ;00815E|        |0083C0;
                       dw DATA8_0082A1                      ;008160|        |0082A1;
                       dw DATA8_0083C4                      ;008162|        |0083C4;
                       dw DATA8_0082A7                      ;008164|        |0082A7;
                       dw DATA8_0083C8                      ;008166|        |0083C8;
 
           chrGroup0d: dw DATA8_0082AA                      ;008168|        |0082AA;
                       dw DATA8_0083CA                      ;00816A|        |0083CA;
                       dw DATA8_0082B3                      ;00816C|        |0082B3;
                       dw DATA8_0083D0                      ;00816E|        |0083D0;
                       dw DATA8_0082BC                      ;008170|        |0082BC;
                       dw DATA8_0083D6                      ;008172|        |0083D6;
                       dw DATA8_0082C5                      ;008174|        |0082C5;
                       dw DATA8_0083DC                      ;008176|        |0083DC;
 
           chrGroup0e: dw DATA8_0082CB                      ;008178|        |0082CB;
                       dw DATA8_0083E0                      ;00817A|        |0083E0;
                       dw DATA8_0082D4                      ;00817C|        |0082D4;
                       dw DATA8_0083E6                      ;00817E|        |0083E6;
 
                       dw DATA8_0082DA                      ;008180|        |0082DA;
                       dw DATA8_0083EA                      ;008182|        |0083EA;
 
       chrGroupData00: db $45,$47,$36                       ;008184|        |      ;
 
       chrGroupData01: db $45,$47,$36,$46,$47               ;008187|        |      ;
                       db $36,$45,$47,$36,$45               ;00818C|        |      ;
                       db $47,$36                           ;008191|        |      ;
 
       chrGroupData02: db $48,$47,$36,$48,$47               ;008193|        |      ;
                       db $36                               ;008198|        |      ;
 
       chrGroupData03: db $48,$47,$36                       ;008199|        |      ;
 
         DATA8_00819C: db $54,$49,$36,$54,$49               ;00819C|        |      ;
                       db $0B,$54,$4A,$36                   ;0081A1|        |      ;
 
         DATA8_0081A5: db $54,$4A,$36,$54,$49               ;0081A5|        |      ;
                       db $36,$54,$4A,$36                   ;0081AA|        |      ;
 
         DATA8_0081AE: db $54,$4A,$36,$54,$49               ;0081AE|        |      ;
                       db $36,$54,$49,$36                   ;0081B3|        |      ;
 
         DATA8_0081B7: db $4B,$4D,$36,$4B,$4D               ;0081B7|        |      ;
                       db $36                               ;0081BC|        |      ;
 
         DATA8_0081BD: db $4B,$4D,$36                       ;0081BD|        |      ;
 
         DATA8_0081C0: db $4C,$4D,$36,$4B,$4D               ;0081C0|        |      ;
                       db $36                               ;0081C5|        |      ;
 
         DATA8_0081C6: db $4C,$4D,$36,$4B,$4D               ;0081C6|        |      ;
                       db $36,$4C,$4D,$36                   ;0081CB|        |      ;
 
         DATA8_0081CF: db $4C,$4D,$4C,$4C,$4D               ;0081CF|        |      ;
                       db $36                               ;0081D4|        |      ;
 
         DATA8_0081D5: db $4F,$50,$36,$4F,$50               ;0081D5|        |      ;
                       db $36,$4E,$50,$36                   ;0081DA|        |      ;
 
         DATA8_0081DE: db $4F,$50,$09,$4F,$50               ;0081DE|        |      ;
                       db $36                               ;0081E3|        |      ;
 
         DATA8_0081E4: db $4F,$50,$36,$4E,$50               ;0081E4|        |      ;
                       db $36                               ;0081E9|        |      ;
 
         DATA8_0081EA: db $4E,$50,$36,$4E,$50               ;0081EA|        |      ;
                       db $36                               ;0081EF|        |      ;
 
         DATA8_0081F0: db $4F,$50,$36,$4E,$50               ;0081F0|        |      ;
                       db $36,$4E,$50,$36                   ;0081F5|        |      ;
 
         DATA8_0081F9: db $6E,$4A,$36,$6E,$4A               ;0081F9|        |      ;
                       db $36,$6E,$4A,$36                   ;0081FE|        |      ;
 
         DATA8_008202: db $6E,$4A,$36,$6E,$4A               ;008202|        |      ;
                       db $36,$53,$4A,$36                   ;008207|        |      ;
 
         DATA8_00820B: db $54,$57,$54                       ;00820B|        |      ;
 
         DATA8_00820E: db $54,$57,$36,$54,$57               ;00820E|        |      ;
                       db $36                               ;008213|        |      ;
 
         DATA8_008214: db $59,$5A,$36,$58,$5A               ;008214|        |      ;
                       db $36                               ;008219|        |      ;
 
         DATA8_00821A: db $59,$5A,$36                       ;00821A|        |      ;
 
         DATA8_00821D: db $59,$5A,$36,$59,$5A               ;00821D|        |      ;
                       db $36,$59,$5A,$36                   ;008222|        |      ;
 
         DATA8_008226: db $5B,$5D,$36,$5B,$5D               ;008226|        |      ;
                       db $36                               ;00822B|        |      ;
 
         DATA8_00822C: db $5B,$5D,$36                       ;00822C|        |      ;
 
         DATA8_00822F: db $5B,$5D,$36,$5C,$5D               ;00822F|        |      ;
                       db $5C                               ;008234|        |      ;
 
         DATA8_008235: db $5C,$5D,$36,$5C,$5D               ;008235|        |      ;
                       db $36                               ;00823A|        |      ;
 
         DATA8_00823B: db $5C,$5D,$36                       ;00823B|        |      ;
 
         DATA8_00823E: db $5E,$60,$36,$5E,$60               ;00823E|        |      ;
                       db $36                               ;008243|        |      ;
 
         DATA8_008244: db $5E,$60,$36                       ;008244|        |      ;
 
         DATA8_008247: db $5E,$60,$36,$5F,$60               ;008247|        |      ;
                       db $36                               ;00824C|        |      ;
 
         DATA8_00824D: db $61,$62,$36,$61,$62               ;00824D|        |      ;
                       db $36                               ;008252|        |      ;
 
         DATA8_008253: db $61,$62,$36,$61,$62               ;008253|        |      ;
                       db $36,$61,$62,$36                   ;008258|        |      ;
 
         DATA8_00825C: db $67,$5D,$36,$67,$5D               ;00825C|        |      ;
                       db $36                               ;008261|        |      ;
 
         DATA8_008262: db $67,$68,$36                       ;008262|        |      ;
 
         DATA8_008265: db $67,$5D,$36                       ;008265|        |      ;
 
         DATA8_008268: db $67,$5D,$36,$67,$68               ;008268|        |      ;
                       db $36                               ;00826D|        |      ;
 
         DATA8_00826E: db $67,$68,$36,$67,$68               ;00826E|        |      ;
                       db $36,$67,$68,$36                   ;008273|        |      ;
 
         DATA8_008277: db $67,$68,$36,$67,$69               ;008277|        |      ;
                       db $36                               ;00827C|        |      ;
 
         DATA8_00827D: db $67,$69,$36,$67,$69               ;00827D|        |      ;
                       db $36,$51,$69,$36                   ;008282|        |      ;
 
         DATA8_008286: db $65,$66,$36,$65,$66               ;008286|        |      ;
                       db $36                               ;00828B|        |      ;
 
         DATA8_00828C: db $65,$66,$36,$65,$66               ;00828C|        |      ;
                       db $36                               ;008291|        |      ;
 
         DATA8_008292: db $51,$66,$36,$65,$66               ;008292|        |      ;
                       db $36,$65,$66,$36                   ;008297|        |      ;
 
         DATA8_00829B: db $52,$6D,$36,$6C,$6D               ;00829B|        |      ;
                       db $36                               ;0082A0|        |      ;
 
         DATA8_0082A1: db $6C,$6D,$36,$6C,$6D               ;0082A1|        |      ;
                       db $36                               ;0082A6|        |      ;
 
         DATA8_0082A7: db $6C,$6D,$36                       ;0082A7|        |      ;
 
         DATA8_0082AA: db $4B,$4D,$36,$4B,$4D               ;0082AA|        |      ;
                       db $36,$54,$64,$36                   ;0082AF|        |      ;
 
         DATA8_0082B3: db $54,$64,$36,$54,$64               ;0082B3|        |      ;
                       db $36,$54,$64,$36                   ;0082B8|        |      ;
 
         DATA8_0082BC: db $54,$64,$36,$63,$64               ;0082BC|        |      ;
 
                       db $36,$54,$57,$36                   ;0082C1|        |      ;
 
         DATA8_0082C5: db $54,$57,$54,$63,$64               ;0082C5|        |      ;
                       db $36                               ;0082CA|        |      ;
 
         DATA8_0082CB: db $6A,$6B,$36,$54,$49               ;0082CB|        |      ;
                       db $36,$6A,$6B,$36                   ;0082D0|        |      ;
 
         DATA8_0082D4: db $6A,$6B,$36,$6A,$6B               ;0082D4|        |      ;
                       db $36                               ;0082D9|        |      ;
 
         DATA8_0082DA: db $6A,$68,$36,$6A,$33               ;0082DA|        |      ;
                       db $36                               ;0082DF|        |      ;
 
         DATA8_0082E0: db $08,$0B                           ;0082E0|        |      ;
 
         DATA8_0082E2: db $08,$13,$08,$09,$12               ;0082E2|        |      ;
 
                       db $0F,$08,$13                       ;0082E7|        |      ;
 
         DATA8_0082EA: db $0A,$0B,$08,$09                   ;0082EA|        |      ;
 
         DATA8_0082EE: db $08,$09                           ;0082EE|        |      ;
 
         DATA8_0082F0: db $14,$13,$14,$13,$12               ;0082F0|        |      ;
                       db $09                               ;0082F5|        |      ;
 
         DATA8_0082F6: db $14,$0B,$14,$0F,$18               ;0082F6|        |      ;
 
                       db $19                               ;0082FB|        |      ;
 
         DATA8_0082FC: db $14,$09,$14,$0F,$08               ;0082FC|        |      ;
                       db $0B                               ;008301|        |      ;
 
         DATA8_008302: db $14,$09,$14,$0F,$08               ;008302|        |      ;
                       db $0B                               ;008307|        |      ;
 
         DATA8_008308: db $14,$0B,$14,$0F,$18               ;008308|        |      ;
                       db $19                               ;00830D|        |      ;
 
         DATA8_00830E: db $14,$13,$14,$13,$12               ;00830E|        |      ;
 
                       db $09                               ;008313|        |      ;
 
         DATA8_008314: db $08,$0F,$0C,$13                   ;008314|        |      ;
 
         DATA8_008318: db $0C,$0D                           ;008318|        |      ;
 
         DATA8_00831A: db $0A,$13,$0A,$7B                   ;00831A|        |      ;
 
         DATA8_00831E: db $0A,$13,$0C,$0D,$08               ;00831E|        |      ;
 
                       db $19                               ;008323|        |      ;
 
         DATA8_008324: db $1C,$13,$0C,$13                   ;008324|        |      ;
 
         DATA8_008328: db $08,$0F,$0E,$0F,$12               ;008328|        |      ;
                       db $09                               ;00832D|        |      ;
 
         DATA8_00832E: db $08,$13,$08,$13                   ;00832E|        |      ;
 
         DATA8_008332: db $08,$09,$18,$19                   ;008332|        |      ;
 
         DATA8_008336: db $08,$0F,$12,$19                   ;008336|        |      ;
 
         DATA8_00833A: db $08,$13,$08,$0F,$08               ;00833A|        |      ;
                       db $19                               ;00833F|        |      ;
 
         DATA8_008340: db $12,$15,$0A,$0B,$08               ;008340|        |      ;
                       db $09                               ;008345|        |      ;
 
         DATA8_008346: db $0A,$0B,$14,$0B,$12               ;008346|        |      ;
                       db $0B                               ;00834B|        |      ;
 
         DATA8_00834C: db $08,$09,$0A,$0B,$08               ;00834C|        |      ;
                       db $09                               ;008351|        |      ;
 
         DATA8_008352: db $0A,$09                           ;008352|        |      ;
 
         DATA8_008354: db $0A,$17                           ;008354|        |      ;
 
         DATA8_008356: db $0A,$09,$0A,$09                   ;008356|        |      ;
 
         DATA8_00835A: db $0A,$0B,$0A,$17                   ;00835A|        |      ;
 
         DATA8_00835E: db $10,$09,$10,$17                   ;00835E|        |      ;
 
         DATA8_008362: db $10,$09                           ;008362|        |      ;
 
         DATA8_008364: db $18,$19,$10,$09,$08               ;008364|        |      ;
                       db $13                               ;008369|        |      ;
 
         DATA8_00836A: db $08,$15,$0E,$15                   ;00836A|        |      ;
 
         DATA8_00836E: db $0E,$0B                           ;00836E|        |      ;
 
         DATA8_008370: db $18,$15                           ;008370|        |      ;
 
         DATA8_008372: db $08,$15                           ;008372|        |      ;
 
         DATA8_008374: db $08,$15,$0E,$15                   ;008374|        |      ;
 
         DATA8_008378: db $0E,$15,$0E,$13                   ;008378|        |      ;
 
         DATA8_00837C: db $08,$13                           ;00837C|        |      ;
 
         DATA8_00837E: db $0A,$09,$14,$0B                   ;00837E|        |      ;
 
         DATA8_008382: db $0A,$11                           ;008382|        |      ;
 
         DATA8_008384: db $0A,$11,$0A,$11                   ;008384|        |      ;
 
         DATA8_008388: db $0A,$11                           ;008388|        |      ;
 
         DATA8_00838A: db $0A,$11                           ;00838A|        |      ;
 
         DATA8_00838C: db $0A,$09,$0E,$0B                   ;00838C|        |      ;
 
         DATA8_008390: db $0E,$13,$14,$09,$0A               ;008390|        |      ;
                       db $13                               ;008395|        |      ;
 
         DATA8_008396: db $08,$0F,$0A,$15                   ;008396|        |      ;
 
         DATA8_00839A: db $0A,$09                           ;00839A|        |      ;
 
         DATA8_00839C: db $0A,$15                           ;00839C|        |      ;
 
         DATA8_00839E: db $0A,$0B,$0E,$0B                   ;00839E|        |      ;
 
         DATA8_0083A2: db $0A,$0B,$0C,$13,$08               ;0083A2|        |      ;
                       db $0F                               ;0083A7|        |      ;
 
         DATA8_0083A8: db $0A,$09,$12,$0F                   ;0083A8|        |      ;
 
         DATA8_0083AC: db $0C,$0F,$14,$0B,$0E               ;0083AC|        |      ;
                       db $09                               ;0083B1|        |      ;
 
         DATA8_0083B2: db $0A,$0B,$0A,$2F                   ;0083B2|        |      ;
 
         DATA8_0083B6: db $0A                               ;0083B6|        |      ;
 
         DATA8_0083B7: db $09,$12,$09                       ;0083B7|        |      ;
 
         DATA8_0083BA: db $0A,$13,$14,$0F,$08               ;0083BA|        |      ;
                       db $13                               ;0083BF|        |      ;
 
         DATA8_0083C0: db $08,$09,$0C,$0F                   ;0083C0|        |      ;
 
         DATA8_0083C4: db $0E,$13,$0E,$09                   ;0083C4|        |      ;
 
         DATA8_0083C8: db $14,$09                           ;0083C8|        |      ;
 
         DATA8_0083CA: db $63,$64,$0A,$2F,$63               ;0083CA|        |      ;
                       db $64                               ;0083CF|        |      ;
 
         DATA8_0083D0: db $63,$64,$0A,$0B,$0A               ;0083D0|        |      ;
 
                       db $09                               ;0083D5|        |      ;
 
         DATA8_0083D6: db $14,$13,$14,$0B,$08               ;0083D6|        |      ;
                       db $09                               ;0083DB|        |      ;
 
         DATA8_0083DC: db $0A,$17,$12,$0F                   ;0083DC|        |      ;
 
         DATA8_0083E0: db $0A,$09,$14,$0F,$08               ;0083E0|        |      ;
                       db $13                               ;0083E5|        |      ;
 
         DATA8_0083E6: db $0C,$13,$12,$09                   ;0083E6|        |      ;
 
         DATA8_0083EA: db $61,$62,$61,$62,$A2               ;0083EA|        |      ;
                       db $00,$A5,$4B,$20,$F9               ;0083EF|        |      ;
                       db $83                               ;0083F4|        |      ;
                       LDX.B #$08                           ;0083F5|A208    |      ;
                       LDA.B r_ChrBankBG_0800               ;0083F7|A54C    |00004C;
                       LDY.B #$00                           ;0083F9|A000    |      ;
                       CMP.B #$33                           ;0083FB|C933    |      ;
                       BEQ CODE_008432                      ;0083FD|F033    |008432;
                       LDY.B #$02                           ;0083FF|A002    |      ;
 
                       CMP.B #$36                           ;008401|C936    |      ;
                       BEQ CODE_008432                      ;008403|F02D    |008432;
                       LDY.B #$04                           ;008405|A004    |      ;
                       CMP.B #$37                           ;008407|C937    |      ;
                       BEQ CODE_008432                      ;008409|F027    |008432;
                       SEC                                  ;00840B|38      |      ;
 
                       SBC.B #$44                           ;00840C|E944    |      ;
                       ASL A                                ;00840E|0A      |      ;
                       TAY                                  ;00840F|A8      |      ;
                       LDA.W PTR16_00843D,Y                 ;008410|B93D84  |00843D;
                       STA.B r_CurrNumToVramQueue           ;008413|8508    |000008;
                       LDA.W PTR16_00843E,Y                 ;008415|B93E84  |00843E;
 
          CODE_008418: STA.B $09                            ;008418|8509    |000009;
                       LDY.B #$00                           ;00841A|A000    |      ;
 
          CODE_00841C: LDA.B (r_CurrNumToVramQueue),Y       ;00841C|B108    |000008;
                       INY                                  ;00841E|C8      |      ;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00841F|850A    |00000A;
 
                       LDA.B (r_CurrNumToVramQueue),Y       ;008421|B108    |000008;
                       INY                                  ;008423|C8      |      ;
 
          CODE_008424: STA.W r_CurrChrBanksTileCollisionTypeOffsets,X;008424|9D7007  |000770;
                       INX                                  ;008427|E8      |      ;
                       DEC.B r_CurrRoomSectionPlayerPosAndScreenAddr;008428|C60A    |00000A;
                       BNE CODE_008424                      ;00842A|D0F8    |008424;
                       TXA                                  ;00842C|8A      |      ;
                       AND.B #$07                           ;00842D|2907    |      ;
                       BNE CODE_00841C                      ;00842F|D0EB    |00841C;
                       RTS                                  ;008431|60      |      ;
 
 
          CODE_008432: LDA.W PTR16_008493,Y                 ;008432|B99384  |008493;
                       STA.B r_CurrNumToVramQueue           ;008435|8508    |000008;
                       LDA.W PTR16_008494,Y                 ;008437|B99484  |008494;
                       JMP.W CODE_008418                    ;00843A|4C1884  |008418;
 
 
         PTR16_00843D: dw DATA8_008499                      ;00843D|        |008499;
                       dw DATA8_0084A3                      ;00843F|        |0084A3;
                       dw DATA8_008499                      ;008441|        |008499;
                       dw DATA8_0084A7                      ;008443|        |0084A7;
                       dw DATA8_008499                      ;008445|        |008499;
                       dw DATA8_0084B3                      ;008447|        |0084B3;
                       dw DATA8_0084AB                      ;008449|        |0084AB;
                       dw DATA8_008499                      ;00844B|        |008499;
 
                       dw DATA8_008499                      ;00844D|        |008499;
                       dw DATA8_0084AF                      ;00844F|        |0084AF;
                       dw DATA8_008499                      ;008451|        |008499;
                       dw DATA8_008499                      ;008453|        |008499;
                       dw DATA8_0084B3                      ;008455|        |0084B3;
                       dw DATA8_008499                      ;008457|        |008499;
                       dw DATA8_008499                      ;008459|        |008499;
                       dw DATA8_0084B9                      ;00845B|        |0084B9;
                       dw DATA8_0084BD                      ;00845D|        |0084BD;
                       dw DATA8_0084BD                      ;00845F|        |0084BD;
                       dw DATA8_0084BD                      ;008461|        |0084BD;
                       dw DATA8_0084C1                      ;008463|        |0084C1;
 
                       dw DATA8_008499                      ;008465|        |008499;
                       dw DATA8_0084C9                      ;008467|        |0084C9;
                       dw DATA8_0084CD                      ;008469|        |0084CD;
                       dw DATA8_008499                      ;00846B|        |008499;
 
                       dw DATA8_008499                      ;00846D|        |008499;
                       dw DATA8_0084D3                      ;00846F|        |0084D3;
                       dw DATA8_008499                      ;008471|        |008499;
                       dw DATA8_008499                      ;008473|        |008499;
 
                       dw DATA8_0084D9                      ;008475|        |0084D9;
                       dw DATA8_008499                      ;008477|        |008499;
                       dw DATA8_0084DF                      ;008479|        |0084DF;
                       dw DATA8_008499                      ;00847B|        |008499;
 
                       dw DATA8_0084E3                      ;00847D|        |0084E3;
                       dw DATA8_0084E7                      ;00847F|        |0084E7;
                       dw DATA8_0084EB                      ;008481|        |0084EB;
                       dw DATA8_008499                      ;008483|        |008499;
                       dw DATA8_0084F1                      ;008485|        |0084F1;
                       dw DATA8_0084F1                      ;008487|        |0084F1;
                       dw DATA8_008499                      ;008489|        |008499;
                       dw DATA8_0084F7                      ;00848B|        |0084F7;
                       dw DATA8_008499                      ;00848D|        |008499;
                       dw DATA8_0084FD                      ;00848F|        |0084FD;
                       dw DATA8_00849F                      ;008491|        |00849F;
 
         PTR16_008493: dw DATA8_00849B                      ;008493|        |00849B;
                       dw DATA8_00849B                      ;008495|        |00849B;
                       dw DATA8_00849B                      ;008497|        |00849B;
 
         DATA8_008499: db $08,$80                           ;008499|        |      ;
 
         DATA8_00849B: db $06,$BC,$02,$C0                   ;00849B|        |      ;
 
         DATA8_00849F: db $06,$7B,$02,$80                   ;00849F|        |      ;
 
         DATA8_0084A3: db $06,$7E,$02,$80                   ;0084A3|        |      ;
 
         DATA8_0084A7: db $06,$B7,$02,$C0                   ;0084A7|        |      ;
 
         DATA8_0084AB: db $06,$B9,$02,$C0                   ;0084AB|        |      ;
 
         DATA8_0084AF: db $06,$B8,$02,$C0                   ;0084AF|        |      ;
 
         DATA8_0084B3: db $04,$B8,$02,$B9,$02               ;0084B3|        |      ;
                       db $C0                               ;0084B8|        |      ;
 
         DATA8_0084B9: db $06,$7A,$02,$80                   ;0084B9|        |      ;
 
         DATA8_0084BD: db $06,$7C,$02,$80                   ;0084BD|        |      ;
 
         DATA8_0084C1: db $02,$B6,$01,$B7,$03               ;0084C1|        |      ;
                       db $B8,$02,$C0                       ;0084C6|        |      ;
 
         DATA8_0084C9: db $06,$78,$02,$80                   ;0084C9|        |      ;
 
         DATA8_0084CD: db $01,$B8,$05,$BA,$02               ;0084CD|        |      ;
                       db $C0                               ;0084D2|        |      ;
 
         DATA8_0084D3: db $04,$B2,$02,$B4,$02               ;0084D3|        |      ;
                       db $C0                               ;0084D8|        |      ;
 
         DATA8_0084D9: db $04,$BA,$02,$BB,$02               ;0084D9|        |      ;
                       db $C0                               ;0084DE|        |      ;
 
         DATA8_0084DF: db $06,$A0,$02,$C0                   ;0084DF|        |      ;
 
         DATA8_0084E3: db $06,$B8,$02,$C0                   ;0084E3|        |      ;
 
         DATA8_0084E7: db $06,$7C,$02,$80                   ;0084E7|        |      ;
 
         DATA8_0084EB: db $04,$B8,$02,$B9,$02               ;0084EB|        |      ;
                       db $C0                               ;0084F0|        |      ;
 
         DATA8_0084F1: db $04,$B2,$02,$B3,$02               ;0084F1|        |      ;
                       db $C0                               ;0084F6|        |      ;
 
         DATA8_0084F7: db $04,$B7,$02,$B8,$02               ;0084F7|        |      ;
                       db $C0                               ;0084FC|        |      ;
 
         DATA8_0084FD: db $06,$B8,$02,$C0                   ;0084FD|        |      ;
 
          CODE_008501: LDA.B r_CurrRoomGroupStage           ;008501|A532    |000032;
                       CMP.B #$0C                           ;008503|C90C    |      ;
 
                       BNE CODE_00850E                      ;008505|D007    |00850E;
                       LDY.W r_HardMode                     ;008507|ACF607  |0007F6;
                       BEQ CODE_00850E                      ;00850A|F002    |00850E;
                       LDA.B #$0F                           ;00850C|A90F    |      ;
 
          CODE_00850E: ASL A                                ;00850E|0A      |      ;
                       TAY                                  ;00850F|A8      |      ;
                       LDA.W groupPalettePointerList,Y      ;008510|B9CD85  |0085CD;
                       STA.B r_CurrNumToVramQueue           ;008513|8508    |000008;
                       LDA.W PTR16_0085CE,Y                 ;008515|B9CE85  |0085CE;
                       STA.B $09                            ;008518|8509    |000009;
                       LDA.B r_CurrRoomSectionBlock         ;00851A|A533    |000033;
                       ASL A                                ;00851C|0A      |      ;
                       ASL A                                ;00851D|0A      |      ;
                       TAY                                  ;00851E|A8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00851F|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;008521|850A    |00000A;
                       INY                                  ;008523|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;008524|B108    |000008;
                       STA.B $0B                            ;008526|850B    |00000B;
 
                       INY                                  ;008528|C8      |      ;
                       STY.B r_DoubleCurrRoomIdx            ;008529|840E    |00000E;
                       RTS                                  ;00852B|60      |      ;
 
 
          CODE_00852C: LDA.B #$09                           ;00852C|A909    |      ;
                       db $20                               ;00852E|        |      ;
                       dw screenLoadRoutine                 ;00852F|        |0FECE9;
                       JSR.W CODE_008501                    ;008531|200185  |008501;
                       LDA.B #$00                           ;008534|A900    |      ;
                       STA.B $07                            ;008536|8507    |000007;
                       LDY.B r_CurrRoomIdx                  ;008538|A434    |000034;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00853A|B10A    |00000A;
                       CMP.B #$1C                           ;00853C|C91C    |      ;
                       BCC CODE_008544                      ;00853E|9004    |008544;
                       SBC.B #$1C                           ;008540|E91C    |      ;
                       INC.B $07                            ;008542|E607    |000007;
 
          CODE_008544: STA.B $00                            ;008544|8500    |000000;
                       ASL A                                ;008546|0A      |      ;
                       ASL A                                ;008547|0A      |      ;
                       ASL A                                ;008548|0A      |      ;
                       CLC                                  ;008549|18      |      ;
                       ADC.B $00                            ;00854A|6500    |000000;
                       TAY                                  ;00854C|A8      |      ;
                       LDX.B r_VramQueueNextIdxToFill       ;00854D|A61D    |00001D;
                       LDA.B #$03                           ;00854F|A903    |      ;
                       STA.B r_DoubleCurrSection            ;008551|850D    |00000D;
 
          CODE_008553: LDA.B #$03                           ;008553|A903    |      ;
                       STA.B r_DoubleCurrGroup              ;008555|850C    |00000C;
 
          CODE_008557: LDA.B $07                            ;008557|A507    |000007;
                       BNE CODE_00856E                      ;008559|D013    |00856E;
                       LDA.W DATA8_008779,Y                 ;00855B|B97987  |008779;
 
          CODE_00855E: STA.W $02F4,X                        ;00855E|9DF402  |0002F4;
 
                       INY                                  ;008561|C8      |      ;
                       INX                                  ;008562|E8      |      ;
                       DEC.B r_DoubleCurrGroup              ;008563|C60C    |00000C;
                       BNE CODE_008557                      ;008565|D0F0    |008557;
                       INX                                  ;008567|E8      |      ;
 
                       DEC.B r_DoubleCurrSection            ;008568|C60D    |00000D;
                       BNE CODE_008553                      ;00856A|D0E7    |008553;
                       BEQ CODE_008574                      ;00856C|F006    |008574;
 
          CODE_00856E: LDA.W DATA8_008875,Y                 ;00856E|B97588  |008875;
                       JMP.W CODE_00855E                    ;008571|4C5E85  |00855E;
 
 
          CODE_008574: JSR.W CODE_0085BB                    ;008574|20BB85  |0085BB;
                       LDY.B r_DoubleCurrRoomIdx            ;008577|A40E    |00000E;
                       LDA.B (r_CurrNumToVramQueue),Y       ;008579|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00857B|850A    |00000A;
                       INY                                  ;00857D|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00857E|B108    |000008;
                       STA.B $0B                            ;008580|850B    |00000B;
                       LDY.B r_CurrRoomIdx                  ;008582|A434    |000034;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;008584|B10A    |00000A;
                       ASL A                                ;008586|0A      |      ;
                       CLC                                  ;008587|18      |      ;
                       ADC.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;008588|710A    |00000A;
                       TAY                                  ;00858A|A8      |      ;
                       LDX.B r_VramQueueNextIdxToFill       ;00858B|A61D    |00001D;
                       LDA.B #$03                           ;00858D|A903    |      ;
                       STA.B r_DoubleCurrGroup              ;00858F|850C    |00000C;
 
          CODE_008591: LDA.W DATA8_0089CE,Y                 ;008591|B9CE89  |0089CE;
                       STA.W $02F0,X                        ;008594|9DF002  |0002F0;
                       INY                                  ;008597|C8      |      ;
                       INX                                  ;008598|E8      |      ;
                       DEC.B r_DoubleCurrGroup              ;008599|C60C    |00000C;
                       BNE CODE_008591                      ;00859B|D0F4    |008591;
                       RTS                                  ;00859D|60      |      ;
 
 
          CODE_00859E: JSR.W CODE_008501                    ;00859E|200185  |008501;
                       JMP.W CODE_008574                    ;0085A1|4C7485  |008574;
 
 
          CODE_0085A4: JSR.W CODE_00859E                    ;0085A4|209E85  |00859E;
                       LDX.B r_VramQueueNextIdxToFill       ;0085A7|A61D    |00001D;
                       LDY.B #$00                           ;0085A9|A000    |      ;
 
          CODE_0085AB: LDA.W DATA8_0085B8,Y                 ;0085AB|B9B885  |0085B8;
                       STA.W $02E8,X                        ;0085AE|9DE802  |0002E8;
                       INX                                  ;0085B1|E8      |      ;
                       INY                                  ;0085B2|C8      |      ;
                       CPY.B #$03                           ;0085B3|C003    |      ;
                       BCC CODE_0085AB                      ;0085B5|90F4    |0085AB;
                       RTS                                  ;0085B7|60      |      ;
 
 
         DATA8_0085B8: db $20,$26,$37                       ;0085B8|        |      ;
 
          CODE_0085BB: LDY.W r_EntityObjectIdxes            ;0085BB|AC4E05  |00054E;
                       LDA.W paletteData,Y                  ;0085BE|B9C985  |0085C9;
                       db $20                               ;0085C1|        |      ;
                       dw screenLoadRoutine                 ;0085C2|        |0FECE9;
                       LDA.B #$04                           ;0085C4|A904    |      ;
                       db $4C                               ;0085C6|        |      ;
 
                       dw screenLoadRoutine                 ;0085C7|        |0FECE9;
 
          paletteData: db $0A,$0B,$0C,$0D                   ;0085C9|        |      ; Trevor Palette Index
 
groupPalettePointerList: dw palettePointerGroup00             ;0085CD|        |0085ED;
                       dw palettePointerGroup01             ;0085CF|        |0085FD;
                       dw palettePointerGroup02             ;0085D1|        |008615;
                       dw palettePointerGroup03             ;0085D3|        |008629;
                       dw palettePointerGroup04             ;0085D5|        |00863D;
                       dw palettePointerGroup05             ;0085D7|        |008649;
                       dw palettePointerGroup06             ;0085D9|        |008659;
                       dw palettePointerGroup07             ;0085DB|        |008665;
                       dw palettePointerGroup08             ;0085DD|        |008681;
                       dw palettePointerGroup09             ;0085DF|        |008695;
                       dw palettePointerGroup0a             ;0085E1|        |00869D;
                       dw palettePointerGroup0b             ;0085E3|        |0086B9;
                       dw palettePointerGroup0c             ;0085E5|        |0086C5;
                       dw palettePointerGroup0d             ;0085E7|        |0086D1;
                       dw palettePointerGroup0e             ;0085E9|        |0086E1;
                       dw palettePointerGroup0f             ;0085EB|        |0086ED;
 
palettePointerGroup00: dw DATA8_0086F9                      ;0085ED|        |0086F9;
                       dw DATA8_008905                      ;0085EF|        |008905;
                       dw DATA8_0086FA                      ;0085F1|        |0086FA;
                       dw DATA8_008906                      ;0085F3|        |008906;
                       dw DATA8_0086FE                      ;0085F5|        |0086FE;
                       dw DATA8_00890A                      ;0085F7|        |00890A;
                       dw DATA8_008700                      ;0085F9|        |008700;
                       dw DATA8_00890C                      ;0085FB|        |00890C;
 
palettePointerGroup01: dw DATA8_008701                      ;0085FD|        |008701;
                       dw DATA8_00890D                      ;0085FF|        |00890D;
                       dw DATA8_008704                      ;008601|        |008704;
                       dw DATA8_008910                      ;008603|        |008910;
                       dw DATA8_008707                      ;008605|        |008707;
                       dw DATA8_008913                      ;008607|        |008913;
                       dw DATA8_008707                      ;008609|        |008707;
                       dw DATA8_008913                      ;00860B|        |008913;
                       dw DATA8_008704                      ;00860D|        |008704;
                       dw DATA8_008910                      ;00860F|        |008910;
                       dw DATA8_008701                      ;008611|        |008701;
                       dw DATA8_00890D                      ;008613|        |00890D;
 
palettePointerGroup02: dw DATA8_00870A                      ;008615|        |00870A;
                       dw DATA8_008916                      ;008617|        |008916;
                       dw DATA8_00870C                      ;008619|        |00870C;
 
                       dw DATA8_008918                      ;00861B|        |008918;
                       dw DATA8_00870D                      ;00861D|        |00870D;
                       dw DATA8_008919                      ;00861F|        |008919;
                       dw DATA8_00870F                      ;008621|        |00870F;
                       dw DATA8_00891B                      ;008623|        |00891B;
                       dw DATA8_008712                      ;008625|        |008712;
                       dw DATA8_00891E                      ;008627|        |00891E;
 
palettePointerGroup03: dw DATA8_008714                      ;008629|        |008714;
                       dw DATA8_008920                      ;00862B|        |008920;
                       dw DATA8_008717                      ;00862D|        |008717;
                       dw DATA8_008923                      ;00862F|        |008923;
                       dw DATA8_008717                      ;008631|        |008717;
                       dw DATA8_008925                      ;008633|        |008925;
                       dw DATA8_008717                      ;008635|        |008717;
                       dw DATA8_008927                      ;008637|        |008927;
                       dw DATA8_008714                      ;008639|        |008714;
                       dw DATA8_008929                      ;00863B|        |008929;
 
palettePointerGroup04: dw DATA8_008719                      ;00863D|        |008719;
                       dw DATA8_00892C                      ;00863F|        |00892C;
                       dw DATA8_008719                      ;008641|        |008719;
                       dw DATA8_00892F                      ;008643|        |00892F;
                       dw DATA8_00871C                      ;008645|        |00871C;
                       dw DATA8_008932                      ;008647|        |008932;
 
palettePointerGroup05: dw DATA8_00871F                      ;008649|        |00871F;
                       dw DATA8_008935                      ;00864B|        |008935;
                       dw DATA8_00871F                      ;00864D|        |00871F;
                       dw DATA8_008936                      ;00864F|        |008936;
                       dw DATA8_008720                      ;008651|        |008720;
                       dw DATA8_008937                      ;008653|        |008937;
                       dw DATA8_008720                      ;008655|        |008720;
                       dw DATA8_008939                      ;008657|        |008939;
 
palettePointerGroup06: dw DATA8_008722                      ;008659|        |008722;
                       dw DATA8_00893B                      ;00865B|        |00893B;
                       dw DATA8_008724                      ;00865D|        |008724;
                       dw DATA8_00893D                      ;00865F|        |00893D;
                       dw DATA8_008725                      ;008661|        |008725;
                       dw DATA8_00893E                      ;008663|        |00893E;
 
palettePointerGroup07: dw DATA8_008728                      ;008665|        |008728;
                       dw DATA8_008941                      ;008667|        |008941;
                       dw DATA8_00872A                      ;008669|        |00872A;
                       dw DATA8_008943                      ;00866B|        |008943;
                       dw DATA8_00872A                      ;00866D|        |00872A;
                       dw DATA8_008944                      ;00866F|        |008944;
                       dw DATA8_00872A                      ;008671|        |00872A;
                       dw DATA8_008945                      ;008673|        |008945;
 
                       dw DATA8_00872B                      ;008675|        |00872B;
                       dw DATA8_008946                      ;008677|        |008946;
                       dw DATA8_00872D                      ;008679|        |00872D;
                       dw DATA8_008948                      ;00867B|        |008948;
                       dw DATA8_00872F                      ;00867D|        |00872F;
                       dw DATA8_00894A                      ;00867F|        |00894A;
 
palettePointerGroup08: dw DATA8_008730                      ;008681|        |008730;
                       dw DATA8_00894B                      ;008683|        |00894B;
                       dw DATA8_008732                      ;008685|        |008732;
                       dw DATA8_00894D                      ;008687|        |00894D;
                       dw DATA8_008733                      ;008689|        |008733;
                       dw DATA8_00894E                      ;00868B|        |00894E;
                       dw DATA8_008732                      ;00868D|        |008732;
                       dw DATA8_00894D                      ;00868F|        |00894D;
                       dw DATA8_008732                      ;008691|        |008732;
                       dw DATA8_00894D                      ;008693|        |00894D;
 
palettePointerGroup09: dw DATA8_008735                      ;008695|        |008735;
                       dw DATA8_008950                      ;008697|        |008950;
                       dw DATA8_008737                      ;008699|        |008737;
                       dw DATA8_008952                      ;00869B|        |008952;
 
palettePointerGroup0a: dw DATA8_00873A                      ;00869D|        |00873A;
                       dw DATA8_008954                      ;00869F|        |008954;
                       dw DATA8_00873C                      ;0086A1|        |00873C;
                       dw DATA8_008956                      ;0086A3|        |008956;
                       dw DATA8_00873D                      ;0086A5|        |00873D;
                       dw DATA8_008957                      ;0086A7|        |008957;
                       dw DATA8_00873E                      ;0086A9|        |00873E;
                       dw DATA8_008958                      ;0086AB|        |008958;
                       dw DATA8_008740                      ;0086AD|        |008740;
                       dw DATA8_00895A                      ;0086AF|        |00895A;
                       dw DATA8_008743                      ;0086B1|        |008743;
                       dw DATA8_00895D                      ;0086B3|        |00895D;
                       dw DATA8_008745                      ;0086B5|        |008745;
                       dw DATA8_00895F                      ;0086B7|        |00895F;
 
palettePointerGroup0b: dw DATA8_008748                      ;0086B9|        |008748;
                       dw DATA8_008962                      ;0086BB|        |008962;
                       dw DATA8_00874A                      ;0086BD|        |00874A;
                       dw DATA8_008964                      ;0086BF|        |008964;
                       dw DATA8_00874C                      ;0086C1|        |00874C;
                       dw DATA8_008966                      ;0086C3|        |008966;
 
palettePointerGroup0c: dw DATA8_00874F                      ;0086C5|        |00874F;
                       dw DATA8_008969                      ;0086C7|        |008969;
                       dw DATA8_008751                      ;0086C9|        |008751;
                       dw DATA8_00896B                      ;0086CB|        |00896B;
                       dw DATA8_008753                      ;0086CD|        |008753;
                       dw DATA8_00896D                      ;0086CF|        |00896D;
 
palettePointerGroup0d: dw DATA8_008754                      ;0086D1|        |008754;
                       dw DATA8_00896E                      ;0086D3|        |00896E;
                       dw DATA8_008757                      ;0086D5|        |008757;
                       dw DATA8_008971                      ;0086D7|        |008971;
                       dw DATA8_00875A                      ;0086D9|        |00875A;
                       dw DATA8_008974                      ;0086DB|        |008974;
                       dw DATA8_00875D                      ;0086DD|        |00875D;
                       dw DATA8_008977                      ;0086DF|        |008977;
 
palettePointerGroup0e: dw DATA8_00875F                      ;0086E1|        |00875F;
                       dw DATA8_008979                      ;0086E3|        |008979;
                       dw DATA8_008762                      ;0086E5|        |008762;
                       dw DATA8_00897C                      ;0086E7|        |00897C;
                       dw DATA8_008764                      ;0086E9|        |008764;
                       dw DATA8_00897E                      ;0086EB|        |00897E;
 
palettePointerGroup0f: dw DATA8_00874F                      ;0086ED|        |00874F;
 
palettePointerGroup10: dw DATA8_008980                      ;0086EF|        |008980;
 
                       dw DATA8_008751                      ;0086F1|        |008751;
                       dw DATA8_00896B                      ;0086F3|        |00896B;
 
                       dw DATA8_008753                      ;0086F5|        |008753;
                       dw DATA8_00896D                      ;0086F7|        |00896D;
 
         DATA8_0086F9: db $00                               ;0086F9|        |      ;
 
         DATA8_0086FA: db $00,$01,$03,$03                   ;0086FA|        |      ;
 
         DATA8_0086FE: db $03,$02                           ;0086FE|        |      ;
 
         DATA8_008700: db $03                               ;008700|        |      ;
 
         DATA8_008701: db $04,$04,$04                       ;008701|        |      ;
 
         DATA8_008704: db $04,$04,$05                       ;008704|        |      ;
 
         DATA8_008707: db $05,$05,$05                       ;008707|        |      ;
 
         DATA8_00870A: db $06,$06                           ;00870A|        |      ;
 
         DATA8_00870C: db $07                               ;00870C|        |      ;
 
         DATA8_00870D: db $07,$07                           ;00870D|        |      ;
 
         DATA8_00870F: db $08,$07,$07                       ;00870F|        |      ;
 
         DATA8_008712: db $08,$08                           ;008712|        |      ;
 
         DATA8_008714: db $09,$09,$09                       ;008714|        |      ;
 
         DATA8_008717: db $09,$09                           ;008717|        |      ;
 
         DATA8_008719: db $0A,$0A,$0A                       ;008719|        |      ;
 
         DATA8_00871C: db $0A,$0A,$0B                       ;00871C|        |      ;
 
         DATA8_00871F: db $0C                               ;00871F|        |      ;
 
         DATA8_008720: db $0C,$0C                           ;008720|        |      ;
 
         DATA8_008722: db $2B,$0D                           ;008722|        |      ;
 
         DATA8_008724: db $2B                               ;008724|        |      ;
 
         DATA8_008725: db $0E,$0E,$2B                       ;008725|        |      ;
 
         DATA8_008728: db $0F,$0F                           ;008728|        |      ;
 
         DATA8_00872A: db $0F                               ;00872A|        |      ;
 
         DATA8_00872B: db $0F,$10                           ;00872B|        |      ;
 
         DATA8_00872D: db $10,$10                           ;00872D|        |      ;
 
         DATA8_00872F: db $11                               ;00872F|        |      ;
 
         DATA8_008730: db $12,$12                           ;008730|        |      ;
 
         DATA8_008732: db $12                               ;008732|        |      ;
 
         DATA8_008733: db $12,$13                           ;008733|        |      ;
 
         DATA8_008735: db $14,$14                           ;008735|        |      ;
 
         DATA8_008737: db $14,$14,$14                       ;008737|        |      ;
 
         DATA8_00873A: db $18,$18                           ;00873A|        |      ;
 
         DATA8_00873C: db $18                               ;00873C|        |      ;
 
         DATA8_00873D: db $18                               ;00873D|        |      ;
 
         DATA8_00873E: db $18,$18                           ;00873E|        |      ;
 
         DATA8_008740: db $19,$19,$19                       ;008740|        |      ;
 
         DATA8_008743: db $19,$1A                           ;008743|        |      ;
 
         DATA8_008745: db $1A,$1B,$1C                       ;008745|        |      ;
 
         DATA8_008748: db $23,$23                           ;008748|        |      ;
 
         DATA8_00874A: db $23,$23                           ;00874A|        |      ;
 
         DATA8_00874C: db $23,$23,$24                       ;00874C|        |      ;
 
         DATA8_00874F: db $16,$16                           ;00874F|        |      ;
 
         DATA8_008751: db $17,$17                           ;008751|        |      ;
 
         DATA8_008753: db $16                               ;008753|        |      ;
 
         DATA8_008754: db $25,$25,$26                       ;008754|        |      ;
 
         DATA8_008757: db $26,$27,$26                       ;008757|        |      ;
 
         DATA8_00875A: db $26,$28,$29                       ;00875A|        |      ;
 
         DATA8_00875D: db $29,$2A                           ;00875D|        |      ;
 
         DATA8_00875F: db $1F,$1E,$1D                       ;00875F|        |      ;
 
         DATA8_008762: db $1F,$20                           ;008762|        |      ;
 
         DATA8_008764: db $21,$22                           ;008764|        |      ;
 
               PAL_09: db $00,$3F,$0F,$16,$26               ;008766|        |      ;
 
                       db $20,$0F,$16,$26,$20               ;00876B|        |      ;
                       db $0F,$16,$26,$20,$0F               ;008770|        |      ;
                       db $16,$26,$20,$FF                   ;008775|        |      ;
 
         DATA8_008779: db $00,$10,$1A,$00,$0B               ;008779|        |      ;
                       db $2C,$02,$00,$10,$11               ;00877E|        |      ;
 
                       db $26,$36,$30,$0C,$2B               ;008783|        |      ;
                       db $16,$25,$36,$00,$11               ;008788|        |      ;
 
                       db $1A,$02,$11,$30,$02               ;00878D|        |      ;
                       db $08,$38,$00,$10,$1A               ;008792|        |      ;
                       db $02,$12,$30,$02,$08               ;008797|        |      ;
                       db $38,$20,$02,$1B,$02               ;00879C|        |      ;
                       db $00,$10,$10,$04,$24               ;0087A1|        |      ;
                       db $33,$02,$00,$02,$00               ;0087A6|        |      ;
                       db $10,$10,$0B,$2C,$0B               ;0087AB|        |      ;
                       db $1C,$2A,$02,$09,$06               ;0087B0|        |      ;
                       db $00,$20                           ;0087B5|        |      ;
 
         DATA8_0087B7: db $18,$08,$18,$2A,$02               ;0087B7|        |      ;
                       db $09,$06,$02,$20,$13               ;0087BC|        |      ;
                       db $0B,$1C,$2A,$02,$09               ;0087C1|        |      ;
                       db $08,$02,$31,$12,$10               ;0087C6|        |      ;
                       db $08,$18,$00,$20,$10               ;0087CB|        |      ;
                       db $02,$08,$28,$00,$06               ;0087D0|        |      ;
                       db $2C,$00,$34,$22,$27               ;0087D5|        |      ;
                       db $06,$15,$1B,$02,$2C               ;0087DA|        |      ;
                       db $02,$00,$10,$02,$03               ;0087DF|        |      ;
                       db $13,$0B,$1B,$01,$02               ;0087E4|        |      ;
                       db $11,$20,$31,$11,$21               ;0087E9|        |      ;
                       db $08,$18,$2A,$08,$29               ;0087EE|        |      ;
                       db $17,$02,$11,$21,$0C               ;0087F3|        |      ;
                       db $00,$20,$08,$29,$18               ;0087F8|        |      ;
 
                       db $03,$12,$22,$08,$10               ;0087FD|        |      ;
                       db $20,$08,$0A,$00,$02               ;008802|        |      ;
                       db $11,$31,$02,$10,$20               ;008807|        |      ;
                       db $13,$03,$33,$02,$11               ;00880C|        |      ;
                       db $31,$08,$10,$20,$0B               ;008811|        |      ;
                       db $1B,$2B,$06,$16,$26               ;008816|        |      ;
                       db $02,$11,$20,$0B,$1C               ;00881B|        |      ;
 
                       db $3C,$0B,$1B,$02,$02               ;008820|        |      ;
                       db $11,$20,$08,$18,$38               ;008825|        |      ;
                       db $08,$18,$02,$01,$11               ;00882A|        |      ;
                       db $2C,$17,$27,$05,$0B               ;00882F|        |      ;
                       db $1C,$3C,$08,$18,$10               ;008834|        |      ;
                       db $07,$17,$08,$0B,$1C               ;008839|        |      ;
                       db $3C,$07,$00,$10,$16               ;00883E|        |      ;
                       db $25,$10,$02,$19,$21               ;008843|        |      ;
 
                       db $07,$00,$10,$1B,$00               ;008848|        |      ;
                       db $10,$02,$19,$21,$08               ;00884D|        |      ;
                       db $18,$20,$01,$11,$20               ;008852|        |      ;
                       db $0B,$1B,$20,$08,$18               ;008857|        |      ;
                       db $0C,$0B,$1B,$0C,$2C               ;00885C|        |      ;
                       db $27,$0C,$08,$18,$0C               ;008861|        |      ;
                       db $0C,$00,$10,$01,$11               ;008866|        |      ;
                       db $21,$08,$18,$0C,$0C               ;00886B|        |      ;
                       db $00,$10,$05,$00,$10               ;008870|        |      ;
 
         DATA8_008875: db $0C,$17,$1C,$0C,$00               ;008875|        |      ;
                       db $10,$15,$27,$20,$00               ;00887A|        |      ;
 
                       db $22,$1A,$18,$28,$20               ;00887F|        |      ;
 
                       db $22,$20,$02,$20,$0C               ;008884|        |      ;
                       db $2C,$11,$00,$20,$00               ;008889|        |      ;
                       db $08,$18,$00,$2C,$1A               ;00888E|        |      ;
                       db $00,$10,$20,$08,$18               ;008893|        |      ;
                       db $0C,$00,$2C,$1A,$00               ;008898|        |      ;
                       db $10,$20,$08,$18,$27               ;00889D|        |      ;
                       db $00,$05,$1A,$0C,$10               ;0088A2|        |      ;
                       db $27,$22,$20,$02,$10               ;0088A7|        |      ;
                       db $05,$01,$0C,$10,$27               ;0088AC|        |      ;
                       db $00,$05,$1A,$00,$04               ;0088B1|        |      ;
                       db $10,$0C,$2C,$19,$02               ;0088B6|        |      ;
                       db $04,$14,$00,$04,$10               ;0088BB|        |      ;
                       db $02,$14,$27,$02,$04               ;0088C0|        |      ;
                       db $14,$0B,$1B,$2A,$02               ;0088C5|        |      ;
                       db $0A,$08,$02,$32,$13               ;0088CA|        |      ;
                       db $01,$11,$21,$00,$10               ;0088CF|        |      ;
                       db $23,$0B,$1A,$3A,$01               ;0088D4|        |      ;
                       db $11,$21,$00,$10,$23               ;0088D9|        |      ;
                       db $05,$25,$10,$0B,$1B               ;0088DE|        |      ;
                       db $0F,$00,$10,$37,$0B               ;0088E3|        |      ;
 
                       db $1A,$3A,$0B,$12,$05               ;0088E8|        |      ;
                       db $01,$11,$20,$31,$11               ;0088ED|        |      ;
                       db $21,$01,$22,$21,$0B               ;0088F2|        |      ;
                       db $1A,$3A,$00,$10,$23               ;0088F7|        |      ;
                       db $0B,$1C,$2C,$08,$29               ;0088FC|        |      ;
                       db $17,$02,$11,$22                   ;008901|        |      ;
 
         DATA8_008905: db $04                               ;008905|        |      ;
 
         DATA8_008906: db $00,$01,$0F,$05                   ;008906|        |      ;
 
         DATA8_00890A: db $06,$04                           ;00890A|        |      ;
 
         DATA8_00890C: db $04                               ;00890C|        |      ;
 
         DATA8_00890D: db $16,$04,$0E                       ;00890D|        |      ;
 
         DATA8_008910: db $16,$16,$05                       ;008910|        |      ;
 
         DATA8_008913: db $16,$16,$05                       ;008913|        |      ;
 
         DATA8_008916: db $08,$08                           ;008916|        |      ;
 
         DATA8_008918: db $07                               ;008918|        |      ;
 
         DATA8_008919: db $06,$06                           ;008919|        |      ;
 
         DATA8_00891B: db $06,$09,$06                       ;00891B|        |      ;
 
         DATA8_00891E: db $02,$08                           ;00891E|        |      ;
 
         DATA8_008920: db $0B,$0B,$04                       ;008920|        |      ;
 
         DATA8_008923: db $05,$04                           ;008923|        |      ;
 
         DATA8_008925: db $04,$09                           ;008925|        |      ;
 
         DATA8_008927: db $0B,$09                           ;008927|        |      ;
 
         DATA8_008929: db $09,$04,$04                       ;008929|        |      ;
 
         DATA8_00892C: db $10,$07,$07                       ;00892C|        |      ;
 
         DATA8_00892F: db $0A,$0A,$07                       ;00892F|        |      ;
 
         DATA8_008932: db $05,$06,$04                       ;008932|        |      ;
 
         DATA8_008935: db $06                               ;008935|        |      ;
 
         DATA8_008936: db $06                               ;008936|        |      ;
 
         DATA8_008937: db $0C,$06                           ;008937|        |      ;
 
         DATA8_008939: db $0C,$11                           ;008939|        |      ;
 
         DATA8_00893B: db $0C,$0C                           ;00893B|        |      ;
 
         DATA8_00893D: db $0C                               ;00893D|        |      ;
 
         DATA8_00893E: db $0D,$0C,$04                       ;00893E|        |      ;
 
         DATA8_008941: db $11,$11                           ;008941|        |      ;
 
         DATA8_008943: db $0A                               ;008943|        |      ;
 
         DATA8_008944: db $11                               ;008944|        |      ;
 
         DATA8_008945: db $11                               ;008945|        |      ;
 
         DATA8_008946: db $11,$11                           ;008946|        |      ;
 
         DATA8_008948: db $0A,$10                           ;008948|        |      ;
 
         DATA8_00894A: db $11                               ;00894A|        |      ;
 
         DATA8_00894B: db $06,$13                           ;00894B|        |      ;
 
         DATA8_00894D: db $13                               ;00894D|        |      ;
 
         DATA8_00894E: db $13,$13                           ;00894E|        |      ;
 
         DATA8_008950: db $13,$0A                           ;008950|        |      ;
 
         DATA8_008952: db $15,$15                           ;008952|        |      ;
 
         DATA8_008954: db $0B,$06                           ;008954|        |      ;
 
         DATA8_008956: db $15                               ;008956|        |      ;
 
         DATA8_008957: db $06                               ;008957|        |      ;
 
         DATA8_008958: db $07,$0A                           ;008958|        |      ;
 
         DATA8_00895A: db $07,$15,$04                       ;00895A|        |      ;
 
         DATA8_00895D: db $05,$11                           ;00895D|        |      ;
 
         DATA8_00895F: db $0B,$07,$15                       ;00895F|        |      ;
 
         DATA8_008962: db $06,$06                           ;008962|        |      ;
 
         DATA8_008964: db $15,$04                           ;008964|        |      ;
 
         DATA8_008966: db $15,$15,$04                       ;008966|        |      ;
 
         DATA8_008969: db $04,$0B                           ;008969|        |      ;
 
         DATA8_00896B: db $0A,$0A                           ;00896B|        |      ;
 
         DATA8_00896D: db $17                               ;00896D|        |      ;
 
         DATA8_00896E: db $15,$06,$16                       ;00896E|        |      ;
 
         DATA8_008971: db $15,$07,$15                       ;008971|        |      ;
 
         DATA8_008974: db $15,$15,$15                       ;008974|        |      ;
 
         DATA8_008977: db $04,$0D                           ;008977|        |      ;
 
         DATA8_008979: db $15,$16,$04                       ;008979|        |      ;
 
         DATA8_00897C: db $15,$0E                           ;00897C|        |      ;
 
         DATA8_00897E: db $15,$15                           ;00897E|        |      ;
 
         DATA8_008980: db $19,$0B                           ;008980|        |      ;
 
    PAL_sprite_trevor: db $10,$3F,$0F,$08,$26               ;008982|        |      ;
                       db $37,$0F,$0F,$22,$34               ;008987|        |      ;
                       db $0F,$0F,$0F,$0F,$0F               ;00898C|        |      ;
                       db $0F,$16,$25,$FF                   ;008991|        |      ;
 
     PAL_sprite_grant: db $10,$3F,$0F,$08,$15               ;008995|        |      ;
                       db $38,$0F,$0F,$22,$34               ;00899A|        |      ;
                       db $0F,$0F,$0F,$0F,$0F               ;00899F|        |      ;
                       db $0F,$16,$25,$FF                   ;0089A4|        |      ;
 
    PAL_sprite_sympha: db $10,$3F,$0F,$21,$11               ;0089A8|        |      ;
                       db $20,$0F,$0F,$22,$34               ;0089AD|        |      ;
                       db $0F,$0F,$0F,$0F,$0F               ;0089B2|        |      ;
                       db $0F,$16,$25,$FF                   ;0089B7|        |      ;
 
   PAL_sprite_alucart: db $10,$3F,$0F,$0F,$15               ;0089BB|        |      ;
                       db $36,$0F,$0F,$22,$34               ;0089C0|        |      ;
                       db $0F,$0F,$0F,$0F,$0F               ;0089C5|        |      ;
                       db $0F,$16,$25,$FF                   ;0089CA|        |      ;
 
         DATA8_0089CE: db $0F,$32,$26,$0F,$20               ;0089CE|        |      ;
                       db $14,$26,$0F,$1B,$28               ;0089D3|        |      ;
                       db $0F,$1B,$0F,$13,$25               ;0089D8|        |      ;
 
                       db $0F,$17,$36,$0F,$15               ;0089DD|        |      ;
                       db $35,$0F,$00,$39,$0F               ;0089E2|        |      ;
                       db $13,$17,$0B,$2A,$39               ;0089E7|        |      ;
                       db $0B,$2A,$3B,$0F,$14               ;0089EC|        |      ;
                       db $32,$0F,$18,$28,$10               ;0089F1|        |      ;
                       db $00,$23,$0F,$08,$38               ;0089F6|        |      ;
                       db $02,$08,$38,$34,$00               ;0089FB|        |      ;
                       db $22,$16,$26,$20,$0F               ;008A00|        |      ;
                       db $14,$35,$0F,$13,$25               ;008A05|        |      ;
                       db $0F,$08,$38,$0F,$04               ;008A0A|        |      ;
                       db $37,$0F,$00,$10,$07               ;008A0F|        |      ;
                       db $00,$10,$00,$10,$32               ;008A14|        |      ;
                       db $0F,$17,$23                       ;008A19|        |      ;
 
         DATA8_008A1C: db $A4,$19,$D0,$15,$20               ;008A1C|        |      ;
                       db $19,$E8,$A0,$00,$84               ;008A21|        |      ;
                       db $46,$C8,$84,$47,$A9               ;008A26|        |      ;
                       db $41,$85,$4B,$A9,$00               ;008A2B|        |      ;
                       db $85,$6B,$E6,$19,$60               ;008A30|        |      ;
                       db $88,$D0,$05,$E6,$19               ;008A35|        |      ;
                       db $4C,$FD,$EB,$88,$D0               ;008A3A|        |      ;
                       db $22,$E6,$19,$A0,$00               ;008A3F|        |      ;
                       db $A5,$32,$20,$1A,$8B               ;008A44|        |      ;
                       db $A0,$02,$A5,$33,$20               ;008A49|        |      ;
                       db $1A,$8B,$A0,$04,$A5               ;008A4E|        |      ;
                       db $34,$20,$1A,$8B,$A0               ;008A53|        |      ;
                       db $06,$AD,$4E,$05,$20               ;008A58|        |      ;
                       db $1A,$8B,$4C,$32,$8B               ;008A5D|        |      ;
                       db $A5,$26,$29,$10,$D0               ;008A62|        |      ;
                       db $78,$A5,$26,$29,$20               ;008A67|        |      ;
                       db $F0,$0E,$A4,$6B,$C8               ;008A6C|        |      ;
                       db $C0,$04,$D0,$02,$A0               ;008A71|        |      ;
                       db $00,$84,$6B,$4C,$42               ;008A76|        |      ;
                       db $8A,$A5,$26,$29,$80               ;008A7B|        |      ;
                       db $F0,$26,$A4,$6B,$F0               ;008A80|        |      ;
                       db $1D,$88,$F0,$15,$88               ;008A85|        |      ;
                       db $F0,$0D,$AC,$4E,$05               ;008A8A|        |      ;
 
                       db $C8,$98,$29,$03,$8D               ;008A8F|        |      ;
                       db $4E,$05,$4C,$42,$8A               ;008A94|        |      ;
                       db $E6,$34,$4C,$42,$8A               ;008A99|        |      ;
                       db $E6,$33,$4C,$42,$8A               ;008A9E|        |      ;
                       db $E6,$32,$4C,$42,$8A               ;008AA3|        |      ;
                       db $A5,$26,$29,$40,$F0               ;008AA8|        |      ;
                       db $94,$A4,$6B,$F0,$25               ;008AAD|        |      ;
                       db $88,$F0,$19,$88,$F0               ;008AB2|        |      ;
                       db $0D,$AC,$4E,$05,$88               ;008AB7|        |      ;
                       db $98,$29,$03,$8D,$4E               ;008ABC|        |      ;
                       db $05,$4C,$42,$8A,$A5               ;008AC1|        |      ;
                       db $34,$F0,$02,$C6,$34               ;008AC6|        |      ;
 
                       db $4C,$42,$8A,$A5,$33               ;008ACB|        |      ;
                       db $F0,$02,$C6,$33,$4C               ;008AD0|        |      ;
                       db $42,$8A,$A5,$32,$F0               ;008AD5|        |      ;
 
                       db $02,$C6,$32,$4C,$42               ;008ADA|        |      ;
                       db $8A,$20,$19,$E8,$20               ;008ADF|        |      ;
                       db $84,$E6,$A9,$00,$85               ;008AE4|        |      ;
                       db $39,$AD,$4E,$05,$D0               ;008AE9|        |      ;
                       db $06,$A0,$00,$A9,$FF               ;008AEE|        |      ;
                       db $D0,$02,$A0,$01,$84               ;008AF3|        |      ;
                       db $3B,$85,$3A,$A9,$04               ;008AF8|        |      ;
                       db $85,$18,$A9,$00,$85               ;008AFD|        |      ;
                       db $2A,$60,$0E,$8B,$10               ;008B02|        |      ;
                       db $8B,$0A,$8B,$60,$70               ;008B07|        |      ;
                       db $80,$90,$30,$88,$A4               ;008B0C|        |      ;
                       db $BC,$90,$21,$D0,$21               ;008B11|        |      ;
                       db $10,$22,$50,$22,$85               ;008B16|        |      ;
                       db $08,$B9,$12,$8B,$85               ;008B1B|        |      ;
                       db $61,$B9,$13,$8B,$85               ;008B20|        |      ;
                       db $62,$20,$FC,$E8                   ;008B25|        |      ;
 
         DATA8_008B29: db $A9,$58,$8D,$38,$04               ;008B29|        |      ;
                       db $A0,$02,$D0,$07,$A9               ;008B2E|        |      ;
                       db $70,$8D,$38,$04,$A0               ;008B33|        |      ;
                       db $04,$B9,$04,$8B,$85               ;008B38|        |      ;
 
                       db $08,$B9,$05,$8B,$85               ;008B3D|        |      ;
                       db $09,$A4,$6B,$B1,$08               ;008B42|        |      ;
                       db $8D,$1C,$04,$A9,$00               ;008B47|        |      ;
 
                       db $8D,$8C,$04,$A9,$40               ;008B4C|        |      ;
                       db $8D,$00,$04,$60,$A9               ;008B51|        |      ;
                       db $CB,$8D,$1C,$04,$A0               ;008B56|        |      ;
                       db $00,$B9,$04,$8B,$85               ;008B5B|        |      ;
                       db $08,$B9,$05,$8B,$85               ;008B60|        |      ;
                       db $09,$A4,$6B,$B1,$08               ;008B65|        |      ;
                       db $8D,$38,$04,$4C,$4A               ;008B6A|        |      ;
                       db $8B                               ;008B6F|        |      ;
                       LDY.B #$02                           ;008B70|A002    |      ;
                       BNE CODE_008B76                      ;008B72|D002    |008B76;
                       LDY.B #$00                           ;008B74|A000    |      ;
 
          CODE_008B76: DEC.B $B5                            ;008B76|C6B5    |0000B5;
                       BEQ CODE_008B84                      ;008B78|F00A    |008B84;
 
                       BNE CODE_008B8A                      ;008B7A|D00E    |008B8A;
 
          CODE_008B7C: LDA.B #$FF                           ;008B7C|A9FF    |      ;
                       STA.B $B4                            ;008B7E|85B4    |0000B4;
                       LDA.B #$C0                           ;008B80|A9C0    |      ;
                       BNE CODE_008B9C                      ;008B82|D018    |008B9C;
 
          CODE_008B84: INC.B $B4                            ;008B84|E6B4    |0000B4;
                       LDA.B #$06                           ;008B86|A906    |      ;
                       STA.B $B5                            ;008B88|85B5    |0000B5;
 
          CODE_008B8A: LDA.W PTR16_008BD1,Y                 ;008B8A|B9D18B  |008BD1;
                       STA.B r_CurrDrawnEntityCachedAttr    ;008B8D|8510    |000010;
                       LDA.W PTR16_008BD2,Y                 ;008B8F|B9D28B  |008BD2;
                       STA.B r_CollisionPointYinScreen      ;008B92|8511    |000011;
                       LDY.B $B4                            ;008B94|A4B4    |0000B4;
                       LDA.B (r_CurrDrawnEntityCachedAttr),Y;008B96|B110    |000010;
                       CMP.B #$FF                           ;008B98|C9FF    |      ;
                       BEQ CODE_008B7C                      ;008B9A|F0E0    |008B7C;
 
          CODE_008B9C: STA.B r_CollisionPointXvalDiv32      ;008B9C|8512    |000012;
                       JSR.W CODE_008BA2                    ;008B9E|20A28B  |008BA2;
                       RTS                                  ;008BA1|60      |      ;
 
 
          CODE_008BA2: LDA.B #$02                           ;008BA2|A902    |      ;
                       STA.B $00                            ;008BA4|8500    |000000;
                       LDA.B r_015                          ;008BA6|A515    |000015;
 
          CODE_008BA8: CLC                                  ;008BA8|18      |      ;
                       ADC.B #$04                           ;008BA9|6904    |      ;
                       TAX                                  ;008BAB|AA      |      ;
                       LDA.B #$04                           ;008BAC|A904    |      ;
                       STA.B r_CollisionPointAbsoluteXInRoom;008BAE|8513    |000013;
 
          CODE_008BB0: LDA.B #$03                           ;008BB0|A903    |      ;
                       STA.B r_CollisionPointAbsoluteXRoom  ;008BB2|8514    |000014;
 
          CODE_008BB4: LDA.W r_VramQueue,X                  ;008BB4|BD0003  |000300;
 
          CODE_008BB7: CLC                                  ;008BB7|18      |      ;
                       ADC.B r_CollisionPointXvalDiv32      ;008BB8|6512    |000012;
                       BPL CODE_008BBE                      ;008BBA|1002    |008BBE;
                       LDA.B #$0F                           ;008BBC|A90F    |      ;
 
          CODE_008BBE: STA.W r_VramQueue,X                  ;008BBE|9D0003  |000300;
                       INX                                  ;008BC1|E8      |      ;
                       DEC.B r_CollisionPointAbsoluteXRoom  ;008BC2|C614    |000014;
                       BNE CODE_008BB4                      ;008BC4|D0EE    |008BB4;
                       INX                                  ;008BC6|E8      |      ;
                       DEC.B r_CollisionPointAbsoluteXInRoom;008BC7|C613    |000013;
                       BNE CODE_008BB0                      ;008BC9|D0E5    |008BB0;
                       TXA                                  ;008BCB|8A      |      ;
                       DEC.B $00                            ;008BCC|C600    |000000;
                       BNE CODE_008BA8                      ;008BCE|D0D8    |008BA8;
                       RTS                                  ;008BD0|60      |      ;
 
 
         PTR16_008BD1: dw DATA8_008BDC                      ;008BD1|        |008BDC;
 
                       dw DATA8_008BD5                      ;008BD3|        |008BD5;
 
         DATA8_008BD5: db $00,$C0,$D0,$E0,$F0               ;008BD5|        |      ;
                       db $00,$FF                           ;008BDA|        |      ;
 
         DATA8_008BDC: db $00,$00,$F0,$E0,$D0               ;008BDC|        |      ;
                       db $C0,$FF                           ;008BE1|        |      ;
                       LDX.B #$01                           ;008BE3|A201    |      ;
                       LDY.B #$00                           ;008BE5|A000    |      ;
                       LDA.B #$03                           ;008BE7|A903    |      ;
                       STA.B $00                            ;008BE9|8500    |000000;
                       CLC                                  ;008BEB|18      |      ;
 
          CODE_008BEC: LDA.W r_CurrScore,Y                  ;008BEC|B93600  |000036;
 
                       JSR.W CODE_008C6D                    ;008BEF|206D8C  |008C6D;
                       STA.W r_CurrScore,Y                  ;008BF2|993600  |000036;
                       INY                                  ;008BF5|C8      |      ;
                       INX                                  ;008BF6|E8      |      ;
                       DEC.B $00                            ;008BF7|C600    |000000;
                       BNE CODE_008BEC                      ;008BF9|D0F1    |008BEC;
                       BCC CODE_008C06                      ;008BFB|9009    |008C06;
                       LDA.B #$99                           ;008BFD|A999    |      ;
                       STA.B r_CurrScore                    ;008BFF|8536    |000036;
 
                       STA.B $37                            ;008C01|8537    |000037;
                       STA.B $38                            ;008C03|8538    |000038;
 
          CODE_008C05: RTS                                  ;008C05|60      |      ;
 
 
          CODE_008C06: LDA.B $38                            ;008C06|A538    |000038;
                       CMP.B r_Score4ExtraLive              ;008C08|C53E    |00003E;
                       BCC CODE_008C05                      ;008C0A|90F9    |008C05;
                       LDX.B #$05                           ;008C0C|A205    |      ;
                       LDA.B r_Score4ExtraLive              ;008C0E|A53E    |00003E;
                       CLC                                  ;008C10|18      |      ;
                       JSR.W CODE_008C69                    ;008C11|20698C  |008C69;
                       BCC CODE_008C18                      ;008C14|9002    |008C18;
                       LDA.B #$FF                           ;008C16|A9FF    |      ;
 
          CODE_008C18: STA.B r_Score4ExtraLive              ;008C18|853E    |00003E;
                       LDX.B #$01                           ;008C1A|A201    |      ;
                       LDA.B r_CurrLivesLeft                ;008C1C|A535    |000035;
 
                       CLC                                  ;008C1E|18      |      ;
                       JSR.W CODE_008C69                    ;008C1F|20698C  |008C69;
                       BCS CODE_008C2E                      ;008C22|B00A    |008C2E;
                       STA.B r_CurrLivesLeft                ;008C24|8535    |000035;
                       LDA.B #$4B                           ;008C26|A94B    |      ;
                       db $20                               ;008C28|        |      ;
                       dw CODE_0FE25F                       ;008C29|        |0FE25F;
                       JSR.W CODE_008E3C                    ;008C2B|203C8E  |008E3C;
 
          CODE_008C2E: RTS                                  ;008C2E|60      |      ;
 
                       STA.B $00                            ;008C2F|8500    |000000;
                       LDA.B r_NumHearts                    ;008C31|A584    |000084;
                       AND.B #$0F                           ;008C33|290F    |      ;
                       STA.B $01                            ;008C35|8501    |000001;
                       LDA.B r_NumHearts                    ;008C37|A584    |000084;
                       AND.B #$F0                           ;008C39|29F0    |      ;
                       STA.B $02                            ;008C3B|8502    |000002;
                       LDA.B $01                            ;008C3D|A501    |000001;
                       SEC                                  ;008C3F|38      |      ;
                       SBC.B $00                            ;008C40|E500    |000000;
                       BCS CODE_008C54                      ;008C42|B010    |008C54;
                       SEC                                  ;008C44|38      |      ;
                       SBC.B #$06                           ;008C45|E906    |      ;
                       STA.B $01                            ;008C47|8501    |000001;
                       LDA.B $02                            ;008C49|A502    |000002;
                       SEC                                  ;008C4B|38      |      ;
                       SBC.B #$10                           ;008C4C|E910    |      ;
                       STA.B $02                            ;008C4E|8502    |000002;
                       LDA.B $01                            ;008C50|A501    |000001;
                       AND.B #$0F                           ;008C52|290F    |      ;
 
          CODE_008C54: ORA.B $02                            ;008C54|0502    |000002;
 
                       STA.B r_NumHearts                    ;008C56|8584    |000084;
                       RTS                                  ;008C58|60      |      ;
 
                       LDA.B r_NumHearts                    ;008C59|A584    |000084;
                       CLC                                  ;008C5B|18      |      ;
                       JSR.W CODE_008C69                    ;008C5C|20698C  |008C69;
                       BCS CODE_008C64                      ;008C5F|B003    |008C64;
                       STA.B r_NumHearts                    ;008C61|8584    |000084;
                       RTS                                  ;008C63|60      |      ;
 
 
          CODE_008C64: LDA.B #$99                           ;008C64|A999    |      ;
                       STA.B r_NumHearts                    ;008C66|8584    |000084;
                       RTS                                  ;008C68|60      |      ;
 
 
          CODE_008C69: STX.B $00                            ;008C69|8600    |000000;
                       LDX.B #$00                           ;008C6B|A200    |      ;
 
          CODE_008C6D: STA.B $07                            ;008C6D|8507    |000007;
                       AND.B #$F0                           ;008C6F|29F0    |      ;
                       STA.B $06                            ;008C71|8506    |000006;
                       EOR.B $07                            ;008C73|4507    |000007;
                       STA.B $07                            ;008C75|8507    |000007;
                       LDA.B $00,X                          ;008C77|B500    |000000;
                       AND.B #$0F                           ;008C79|290F    |      ;
                       ADC.B $07                            ;008C7B|6507    |000007;
                       CMP.B #$0A                           ;008C7D|C90A    |      ;
                       BCC CODE_008C83                      ;008C7F|9002    |008C83;
                       ADC.B #$05                           ;008C81|6905    |      ;
 
          CODE_008C83: ADC.B $06                            ;008C83|6506    |000006;
                       STA.B $06                            ;008C85|8506    |000006;
                       LDA.B $00,X                          ;008C87|B500    |000000;
                       AND.B #$F0                           ;008C89|29F0    |      ;
                       ADC.B $06                            ;008C8B|6506    |000006;
                       BCS CODE_008C93                      ;008C8D|B004    |008C93;
                       CMP.B #$A0                           ;008C8F|C9A0    |      ;
                       BCC CODE_008C96                      ;008C91|9003    |008C96;
 
          CODE_008C93: SBC.B #$A0                           ;008C93|E9A0    |      ;
                       SEC                                  ;008C95|38      |      ;
 
          CODE_008C96: RTS                                  ;008C96|60      |      ;
 
 
          CODE_008C97: LDA.B #$20                           ;008C97|A920    |      ;
                       STA.B $62                            ;008C99|8562    |000062;
                       LDA.B #$77                           ;008C9B|A977    |      ;
                       STA.B r_VramQueueDest                ;008C9D|8561    |000061;
                       LDA.B r_NumHearts                    ;008C9F|A584    |000084;
                       STA.B r_CurrNumToVramQueue           ;008CA1|8508    |000008;
                       db $4C                               ;008CA3|        |      ;
 
                       dw UNREACH_0FE8FC                    ;008CA4|        |0FE8FC;
 
          CODE_008CA6: LDA.B #$20                           ;008CA6|A920    |      ;
                       STA.B $62                            ;008CA8|8562    |000062;
                       LDA.B #$67                           ;008CAA|A967    |      ;
                       STA.B r_VramQueueDest                ;008CAC|8561    |000061;
                       LDA.B r_PlayerHealth                 ;008CAE|A53C    |00003C;
                       STA.B r_CurrNumToVramQueue           ;008CB0|8508    |000008;
                       LDA.B #$83                           ;008CB2|A983    |      ;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;008CB4|850A    |00000A;
                       LDA.B #$84                           ;008CB6|A984    |      ;
                       STA.B $0B                            ;008CB8|850B    |00000B;
                       JSR.W DATA8_008CD1                   ;008CBA|20D18C  |008CD1;
 
                       LDA.B #$20                           ;008CBD|A920    |      ;
                       STA.B $62                            ;008CBF|8562    |000062;
                       LDA.B #$87                           ;008CC1|A987    |      ;
                       STA.B r_VramQueueDest                ;008CC3|8561    |000061;
                       LDA.B r_BossHealth                   ;008CC5|A53D    |00003D;
                       STA.B r_CurrNumToVramQueue           ;008CC7|8508    |000008;
 
                       LDA.B #$93                           ;008CC9|A993    |      ;
 
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;008CCB|850A    |00000A;
 
                       LDA.B #$94                           ;008CCD|A994    |      ;
                       STA.B $0B                            ;008CCF|850B    |00000B;
 
         DATA8_008CD1: db $20                               ;008CD1|        |      ;
                       dw CODE_0FE8B5                       ;008CD2|        |0FE8B5;
                       LDA.B #$08                           ;008CD4|A908    |      ;
                       STA.B $09                            ;008CD6|8509    |000009;
 
          CODE_008CD8: LDA.B r_CurrNumToVramQueue           ;008CD8|A508    |000008;
                       BEQ CODE_008D0D                      ;008CDA|F031    |008D0D;
                       CMP.B #$08                           ;008CDC|C908    |      ;
                       BCC CODE_008CF3                      ;008CDE|9013    |008CF3;
                       LDA.B r_CurrRoomSectionPlayerPosAndScreenAddr;008CE0|A50A    |00000A;
                       STA.W r_VramQueue,X                  ;008CE2|9D0003  |000300;
 
                       INX                                  ;008CE5|E8      |      ;
                       LDA.B r_CurrNumToVramQueue           ;008CE6|A508    |000008;
                       SEC                                  ;008CE8|38      |      ;
                       SBC.B #$08                           ;008CE9|E908    |      ;
                       STA.B r_CurrNumToVramQueue           ;008CEB|8508    |000008;
                       DEC.B $09                            ;008CED|C609    |000009;
                       BEQ CODE_008D18                      ;008CEF|F027    |008D18;
                       BNE CODE_008CD8                      ;008CF1|D0E5    |008CD8;
 
          CODE_008CF3: CMP.B #$05                           ;008CF3|C905    |      ;
                       BCS CODE_008D03                      ;008CF5|B00C    |008D03;
                       LDA.B $0B                            ;008CF7|A50B    |00000B;
                       STA.W r_VramQueue,X                  ;008CF9|9D0003  |000300;
                       INX                                  ;008CFC|E8      |      ;
                       DEC.B $09                            ;008CFD|C609    |000009;
                       BEQ CODE_008D18                      ;008CFF|F017    |008D18;
                       BNE CODE_008D0D                      ;008D01|D00A    |008D0D;
 
          CODE_008D03: LDA.B r_CurrRoomSectionPlayerPosAndScreenAddr;008D03|A50A    |00000A;
                       STA.W r_VramQueue,X                  ;008D05|9D0003  |000300;
                       INX                                  ;008D08|E8      |      ;
                       DEC.B $09                            ;008D09|C609    |000009;
                       BEQ CODE_008D18                      ;008D0B|F00B    |008D18;
 
          CODE_008D0D: LDY.B $09                            ;008D0D|A409    |000009;
                       LDA.B #$85                           ;008D0F|A985    |      ;
 
          CODE_008D11: STA.W r_VramQueue,X                  ;008D11|9D0003  |000300;
                       INX                                  ;008D14|E8      |      ;
                       DEY                                  ;008D15|88      |      ;
                       BNE CODE_008D11                      ;008D16|D0F9    |008D11;
 
          CODE_008D18: LDA.B #$FF                           ;008D18|A9FF    |      ;
                       STA.W r_VramQueue,X                  ;008D1A|9D0003  |000300;
                       INX                                  ;008D1D|E8      |      ;
                       STX.B r_VramQueueNextIdxToFill       ;008D1E|861D    |00001D;
                       RTS                                  ;008D20|60      |      ;
 
 
          CODE_008D21: LDA.B #$20                           ;008D21|A920    |      ;
                       STA.B $62                            ;008D23|8562    |000062;
                       LDA.B #$52                           ;008D25|A952    |      ;
                       STA.B r_VramQueueDest                ;008D27|8561    |000061;
                       LDA.B $7F                            ;008D29|A57F    |00007F;
                       STA.B r_CurrNumToVramQueue           ;008D2B|8508    |000008;
                       db $20                               ;008D2D|        |      ;
                       dw UNREACH_0FE8FC                    ;008D2E|        |0FE8FC;
 
                       INC.B r_VramQueueDest                ;008D30|E661    |000061;
                       INC.B r_VramQueueDest                ;008D32|E661    |000061;
                       LDA.B r_CurrTimeLeft                 ;008D34|A57E    |00007E;
                       STA.B r_CurrNumToVramQueue           ;008D36|8508    |000008;
                       db $4C                               ;008D38|        |      ;
 
                       dw UNREACH_0FE8FC                    ;008D39|        |0FE8FC;
 
          CODE_008D3B: LDA.B #$20                           ;008D3B|A920    |      ;
                       STA.B $62                            ;008D3D|8562    |000062;
                       LDA.B #$46                           ;008D3F|A946    |      ;
                       STA.B r_VramQueueDest                ;008D41|8561    |000061;
                       LDA.B $38                            ;008D43|A538    |000038;
                       STA.B r_CurrNumToVramQueue           ;008D45|8508    |000008;
                       db $20                               ;008D47|        |      ;
                       dw UNREACH_0FE8FC                    ;008D48|        |0FE8FC;
                       INC.B r_VramQueueDest                ;008D4A|E661    |000061;
                       INC.B r_VramQueueDest                ;008D4C|E661    |000061;
                       LDA.B $37                            ;008D4E|A537    |000037;
                       STA.B r_CurrNumToVramQueue           ;008D50|8508    |000008;
                       db $20                               ;008D52|        |      ;
                       dw UNREACH_0FE8FC                    ;008D53|        |0FE8FC;
                       INC.B r_VramQueueDest                ;008D55|E661    |000061;
                       INC.B r_VramQueueDest                ;008D57|E661    |000061;
                       LDA.B r_CurrScore                    ;008D59|A536    |000036;
                       STA.B r_CurrNumToVramQueue           ;008D5B|8508    |000008;
                       db $4C                               ;008D5D|        |      ;
 
                       dw UNREACH_0FE8FC                    ;008D5E|        |0FE8FC;
 
          CODE_008D60: BIT.W $5204                          ;008D60|2C0452  |005204;
                       BVC CODE_008D60                      ;008D63|50FB    |008D60;
                       RTS                                  ;008D65|60      |      ;
 
 
          CODE_008D66: JSR.W CODE_008D60                    ;008D66|20608D  |008D60;
                       JSR.W CODE_008F6A                    ;008D69|206A8F  |008F6A;
                       LDA.B #$0E                           ;008D6C|A90E    |      ;
                       db $20                               ;008D6E|        |      ;
                       dw screenLoadRoutine                 ;008D6F|        |0FECE9;
                       JSR.W CODE_008D3B                    ;008D71|203B8D  |008D3B;
                       JSR.W CODE_008CA6                    ;008D74|20A68C  |008CA6;
                       JSR.W CODE_008D21                    ;008D77|20218D  |008D21;
                       JSR.W CODE_008D96                    ;008D7A|20968D  |008D96;
                       JSR.W CODE_008C97                    ;008D7D|20978C  |008C97;
                       JSR.W CODE_008E3C                    ;008D80|203C8E  |008E3C;
                       JSR.W CODE_008E4B                    ;008D83|204B8E  |008E4B;
                       LDA.B #$24                           ;008D86|A924    |      ;
                       LDX.B r_RoomOrientation              ;008D88|A668    |000068;
                       BPL CODE_008D8F                      ;008D8A|1003    |008D8F;
 
                       SEC                                  ;008D8C|38      |      ;
                       SBC.B #$04                           ;008D8D|E904    |      ;
 
          CODE_008D8F: STA.W $0434                          ;008D8F|8D3404  |000434;
                       STA.W $0435                          ;008D92|8D3504  |000435;
                       RTS                                  ;008D95|60      |      ;
 
 
          CODE_008D96: LDA.B r_CurrRoomGroupStage           ;008D96|A532    |000032;
                       ASL A                                ;008D98|0A      |      ;
                       TAY                                  ;008D99|A8      |      ;
                       LDA.W PTR16_008DCF,Y                 ;008D9A|B9CF8D  |008DCF;
                       STA.B r_CurrNumToVramQueue           ;008D9D|8508    |000008;
                       LDA.W PTR16_008DD0,Y                 ;008D9F|B9D08D  |008DD0;
                       STA.B $09                            ;008DA2|8509    |000009;
                       LDA.B #$20                           ;008DA4|A920    |      ;
                       STA.B $62                            ;008DA6|8562    |000062;
                       LDA.B #$5B                           ;008DA8|A95B    |      ;
                       STA.B r_VramQueueDest                ;008DAA|8561    |000061;
                       db $20                               ;008DAC|        |      ;
                       dw CODE_0FE8B5                       ;008DAD|        |0FE8B5;
                       LDY.B #$00                           ;008DAF|A000    |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;008DB1|B108    |000008;
                       STA.W r_VramQueue,X                  ;008DB3|9D0003  |000300;
                       db $20                               ;008DB6|        |      ;
                       dw CODE_0FE8DD                       ;008DB7|        |0FE8DD;
 
                       LDA.B #$20                           ;008DB9|A920    |      ;
                       STA.B $62                            ;008DBB|8562    |000062;
                       LDA.B #$5E                           ;008DBD|A95E    |      ;
                       STA.B r_VramQueueDest                ;008DBF|8561    |000061;
                       db $20                               ;008DC1|        |      ;
                       dw CODE_0FE8B5                       ;008DC2|        |0FE8B5;
 
                       LDY.B r_CurrRoomSectionBlock         ;008DC4|A433    |000033;
                       INY                                  ;008DC6|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;008DC7|B108    |000008;
                       STA.W r_VramQueue,X                  ;008DC9|9D0003  |000300;
                       db $4C                               ;008DCC|        |      ;
 
                       dw CODE_0FE8DD                       ;008DCD|        |0FE8DD;
 
         PTR16_008DCF: dw DATA8_008DED                      ;008DCF|        |008DED;
                       dw DATA8_008DF2                      ;008DD1|        |008DF2;
                       dw DATA8_008DF9                      ;008DD3|        |008DF9;
                       dw DATA8_008DFF                      ;008DD5|        |008DFF;
                       dw DATA8_008E05                      ;008DD7|        |008E05;
                       dw DATA8_008E09                      ;008DD9|        |008E09;
                       dw DATA8_008E0E                      ;008DDB|        |008E0E;
                       dw DATA8_008E12                      ;008DDD|        |008E12;
                       dw DATA8_008E1A                      ;008DDF|        |008E1A;
                       dw DATA8_008E20                      ;008DE1|        |008E20;
 
                       dw DATA8_008E23                      ;008DE3|        |008E23;
 
                       dw DATA8_008E2B                      ;008DE5|        |008E2B;
                       dw DATA8_008E2F                      ;008DE7|        |008E2F;
                       dw DATA8_008E33                      ;008DE9|        |008E33;
                       dw DATA8_008E38                      ;008DEB|        |008E38;
 
         DATA8_008DED: db $42,$42,$43,$44,$45               ;008DED|        |      ;
 
         DATA8_008DF2: db $43,$42,$43,$44,$45               ;008DF2|        |      ;
                       db $46,$47                           ;008DF7|        |      ;
 
         DATA8_008DF9: db $44,$41,$42,$43,$44               ;008DF9|        |      ;
                       db $45                               ;008DFE|        |      ;
 
         DATA8_008DFF: db $45,$50,$51,$52,$53               ;008DFF|        |      ;
                       db $54                               ;008E04|        |      ;
 
         DATA8_008E05: db $46,$50,$51,$52                   ;008E05|        |      ;
 
         DATA8_008E09: db $47,$50,$51,$52,$53               ;008E09|        |      ;
 
         DATA8_008E0E: db $45,$42,$43,$44                   ;008E0E|        |      ;
 
         DATA8_008E12: db $46,$42,$43,$44,$45               ;008E12|        |      ;
                       db $46,$47,$48                       ;008E17|        |      ;
 
         DATA8_008E1A: db $47,$42,$43,$44,$45               ;008E1A|        |      ;
                       db $46                               ;008E1F|        |      ;
 
         DATA8_008E20: db $47,$42,$43                       ;008E20|        |      ;
 
         DATA8_008E23: db $48,$42,$43,$44,$45               ;008E23|        |      ;
                       db $46,$47,$48                       ;008E28|        |      ;
 
         DATA8_008E2B: db $48,$50,$51,$52                   ;008E2B|        |      ;
 
         DATA8_008E2F: db $49,$42,$43,$44                   ;008E2F|        |      ;
 
         DATA8_008E33: db $4A,$42,$43,$44,$45               ;008E33|        |      ;
 
         DATA8_008E38: db $50,$42,$43,$44                   ;008E38|        |      ;
 
          CODE_008E3C: LDA.B #$20                           ;008E3C|A920    |      ;
                       STA.B $62                            ;008E3E|8562    |000062;
                       LDA.B #$97                           ;008E40|A997    |      ;
                       STA.B r_VramQueueDest                ;008E42|8561    |000061;
                       LDY.B r_CurrLivesLeft                ;008E44|A435    |000035;
                       STY.B r_CurrNumToVramQueue           ;008E46|8408    |000008;
                       db $4C                               ;008E48|        |      ;
 
                       dw UNREACH_0FE8FC                    ;008E49|        |0FE8FC;
 
          CODE_008E4B: LDA.B r_CurrCharacterIdx             ;008E4B|A53B    |00003B;
                       EOR.B #$01                           ;008E4D|4901    |      ;
                       TAY                                  ;008E4F|A8      |      ;
                       LDA.W r_UsableChars,Y                ;008E50|B93900  |000039;
                       BMI CODE_008E5C                      ;008E53|3007    |008E5C;
                       TAY                                  ;008E55|A8      |      ;
                       LDA.W DATA8_008E5D,Y                 ;008E56|B95D8E  |008E5D;
                       db $20                               ;008E59|        |      ;
                       dw screenLoadRoutine                 ;008E5A|        |0FECE9;
 
          CODE_008E5C: RTS                                  ;008E5C|60      |      ;
 
 
         DATA8_008E5D: db $0F,$10,$11,$12                   ;008E5D|        |      ;
 
          CODE_008E61: JSR.W CODE_008E92                    ;008E61|20928E  |008E92;
                       LDY.B r_CurrCharacterIdx             ;008E64|A43B    |00003B;
 
                       LDA.W r_SubWeaponMultiplier,Y        ;008E66|B98700  |000087;
                       ASL A                                ;008E69|0A      |      ;
                       TAY                                  ;008E6A|A8      |      ;
                       LDA.W DATA8_008EC9,Y                 ;008E6B|B9C98E  |008EC9;
                       STA.W $0419                          ;008E6E|8D1904  |000419;
                       LDA.W DATA8_008ECA,Y                 ;008E71|B9CA8E  |008ECA;
                       STA.W $04A5                          ;008E74|8DA504  |0004A5;
 
                       LDY.B #$00                           ;008E77|A000    |      ;
                       STY.W $046D                          ;008E79|8C6D04  |00046D;
                       INY                                  ;008E7C|C8      |      ;
                       STY.W $04C1                          ;008E7D|8CC104  |0004C1;
                       LDA.B #$D8                           ;008E80|A9D8    |      ;
                       STA.W $0451                          ;008E82|8D5104  |000451;
                       LDA.B #$24                           ;008E85|A924    |      ;
                       LDX.B r_RoomOrientation              ;008E87|A668    |000068;
                       BPL CODE_008E8E                      ;008E89|1003    |008E8E;
                       SEC                                  ;008E8B|38      |      ;
 
          CODE_008E8C: SBC.B #$04                           ;008E8C|E904    |      ;
 
          CODE_008E8E: STA.W $0435                          ;008E8E|8D3504  |000435;
                       RTS                                  ;008E91|60      |      ;
 
 
          CODE_008E92: LDY.B r_CurrCharacterIdx             ;008E92|A43B    |00003B;
                       LDA.W r_CurrSubweapon,Y              ;008E94|B98500  |000085;
                       ASL A                                ;008E97|0A      |      ;
                       ASL A                                ;008E98|0A      |      ;
                       CLC                                  ;008E99|18      |      ;
                       ADC.W r_CurrSubweapon,Y              ;008E9A|798500  |000085;
                       TAY                                  ;008E9D|A8      |      ;
                       LDA.W DATA8_008ECF,Y                 ;008E9E|B9CF8E  |008ECF;
                       STA.W $0418                          ;008EA1|8D1804  |000418;
                       LDA.W DATA8_008ED0,Y                 ;008EA4|B9D08E  |008ED0;
 
                       STA.W $04A4                          ;008EA7|8DA404  |0004A4;
                       LDA.W DATA8_008ED1,Y                 ;008EAA|B9D18E  |008ED1;
                       STA.W $0450                          ;008EAD|8D5004  |000450;
                       LDA.W DATA8_008ED2,Y                 ;008EB0|B9D28E  |008ED2;
                       LDX.B r_RoomOrientation              ;008EB3|A668    |000068;
                       BPL CODE_008EBA                      ;008EB5|1003    |008EBA;
                       SEC                                  ;008EB7|38      |      ;
                       SBC.B #$04                           ;008EB8|E904    |      ;
 
          CODE_008EBA: STA.W $0434                          ;008EBA|8D3404  |000434;
                       LDA.W DATA8_008ED3,Y                 ;008EBD|B9D38E  |008ED3;
                       STA.W $046C                          ;008EC0|8D6C04  |00046C;
                       LDA.B #$01                           ;008EC3|A901    |      ;
                       STA.W $04C0                          ;008EC5|8DC004  |0004C0;
                       RTS                                  ;008EC8|60      |      ;
 
 
         DATA8_008EC9: db $00                               ;008EC9|        |      ;
 
         DATA8_008ECA: db $00,$58,$0E,$5A,$0E               ;008ECA|        |      ;
 
         DATA8_008ECF: db $00                               ;008ECF|        |      ;
 
         DATA8_008ED0: db $00                               ;008ED0|        |      ;
 
         DATA8_008ED1: db $00                               ;008ED1|        |      ;
 
         DATA8_008ED2: db $00                               ;008ED2|        |      ;
 
         DATA8_008ED3: db $00,$46,$00,$90,$24               ;008ED3|        |      ;
                       db $00,$42,$00,$90,$24               ;008ED8|        |      ;
                       db $00,$4E,$00,$90,$24               ;008EDD|        |      ;
                       db $00,$50,$00,$90,$24               ;008EE2|        |      ;
                       db $00,$52,$02,$90,$24               ;008EE7|        |      ;
 
                       db $03,$54,$02,$90,$24               ;008EEC|        |      ;
                       db $00,$4E,$02,$90,$24               ;008EF1|        |      ;
                       db $00,$4E,$00,$90,$24               ;008EF6|        |      ;
                       db $00,$46,$00,$90,$24               ;008EFB|        |      ;
                       db $00,$50,$00,$90,$24               ;008F00|        |      ;
 
                       db $00,$68,$0E,$90,$24               ;008F05|        |      ;
                       db $00                               ;008F0A|        |      ;
 
          CODE_008F0B: LDA.B r_RosseryFlashTimer            ;008F0B|A5B2    |0000B2;
                       BEQ CODE_008F35                      ;008F0D|F026    |008F35;
                       DEC.B r_RosseryFlashTimer            ;008F0F|C6B2    |0000B2;
                       BEQ CODE_008F19                      ;008F11|F006    |008F19;
                       LDA.B r_RosseryFlashTimer            ;008F13|A5B2    |0000B2;
 
                       AND.B #$03                           ;008F15|2903    |      ;
                       BEQ CODE_008F1F                      ;008F17|F006    |008F1F;
 
          CODE_008F19: JSR.W CODE_00859E                    ;008F19|209E85  |00859E;
                       JMP.W CODE_008F4E                    ;008F1C|4C4E8F  |008F4E;
 
 
          CODE_008F1F: JSR.W CODE_00859E                    ;008F1F|209E85  |00859E;
 
                       LDX.B r_VramQueueNextIdxToFill       ;008F22|A61D    |00001D;
                       LDA.B #$20                           ;008F24|A920    |      ;
                       STA.W $02E7,X                        ;008F26|9DE702  |0002E7;
                       STA.W $02EB,X                        ;008F29|9DEB02  |0002EB;
 
                       STA.W $02EF,X                        ;008F2C|9DEF02  |0002EF;
                       STA.W $02F3,X                        ;008F2F|9DF302  |0002F3;
                       JMP.W CODE_008F4E                    ;008F32|4C4E8F  |008F4E;
 
 
          CODE_008F35: LDA.B r_PotionTimer                  ;008F35|A5AD    |0000AD;
                       BEQ CODE_008F4E                      ;008F37|F015    |008F4E;
                       LDA.B r_GameStateLoopCounter         ;008F39|A51A    |00001A;
                       AND.B #$01                           ;008F3B|2901    |      ;
                       BEQ CODE_008F43                      ;008F3D|F004    |008F43;
                       DEC.B r_PotionTimer                  ;008F3F|C6AD    |0000AD;
                       BEQ CODE_008F19                      ;008F41|F0D6    |008F19;
 
          CODE_008F43: LDA.B r_PotionTimer                  ;008F43|A5AD    |0000AD;
                       AND.B #$01                           ;008F45|2901    |      ;
                       BEQ CODE_008F4B                      ;008F47|F002    |008F4B;
                       BNE CODE_008F19                      ;008F49|D0CE    |008F19;
 
          CODE_008F4B: JSR.W CODE_0085A4                    ;008F4B|20A485  |0085A4;
 
          CODE_008F4E: LDA.B r_GameStateLoopCounter         ;008F4E|A51A    |00001A;
                       AND.B #$03                           ;008F50|2903    |      ;
                       TAY                                  ;008F52|A8      |      ;
                       BEQ CODE_008F61                      ;008F53|F00C    |008F61;
 
                       DEY                                  ;008F55|88      |      ;
                       BEQ CODE_008F64                      ;008F56|F00C    |008F64;
                       DEY                                  ;008F58|88      |      ;
                       BEQ CODE_008F67                      ;008F59|F00C    |008F67;
                       JSR.W CODE_008E61                    ;008F5B|20618E  |008E61;
                       JMP.W CODE_008C97                    ;008F5E|4C978C  |008C97;
 
 
          CODE_008F61: JMP.W CODE_008CA6                    ;008F61|4CA68C  |008CA6;
 
 
          CODE_008F64: JMP.W CODE_008D21                    ;008F64|4C218D  |008D21;
 
 
          CODE_008F67: JMP.W CODE_008D3B                    ;008F67|4C3B8D  |008D3B;
 
 
          CODE_008F6A: LDA.B #$00                           ;008F6A|A900    |      ;
                       TAY                                  ;008F6C|A8      |      ;
 
          CODE_008F6D: STA.W $5C00,Y                        ;008F6D|99005C  |005C00;
                       INY                                  ;008F70|C8      |      ;
                       CPY.B #$C0                           ;008F71|C0C0    |      ;
                       BNE CODE_008F6D                      ;008F73|D0F8    |008F6D;
                       LDY.B #$00                           ;008F75|A000    |      ;
 
          CODE_008F77: STA.W $5FC0,Y                        ;008F77|99C05F  |005FC0;
                       INY                                  ;008F7A|C8      |      ;
                       CPY.B #$10                           ;008F7B|C010    |      ;
                       BNE CODE_008F77                      ;008F7D|D0F8    |008F77;
                       RTS                                  ;008F7F|60      |      ;
 
                       JSR.W CODE_00907F                    ;008F80|207F90  |00907F;
                       LDA.B #$00                           ;008F83|A900    |      ;
                       STA.B r_CurrScore                    ;008F85|8536    |000036;
                       STA.B $37                            ;008F87|8537    |000037;
                       STA.B $38                            ;008F89|8538    |000038;
                       LDY.B r_Checkpoint                   ;008F8B|A42E    |00002E;
                       LDA.W DATA8_008F9E,Y                 ;008F8D|B99E8F  |008F9E;
                       AND.B #$0F                           ;008F90|290F    |      ;
 
                       STA.B r_CurrRoomSectionBlock         ;008F92|8533    |000033;
                       LDA.W DATA8_008F9E,Y                 ;008F94|B99E8F  |008F9E;
 
                       LSR A                                ;008F97|4A      |      ;
                       LSR A                                ;008F98|4A      |      ;
                       LSR A                                ;008F99|4A      |      ;
                       LSR A                                ;008F9A|4A      |      ;
                       STA.B r_CurrRoomGroupStage           ;008F9B|8532    |000032;
                       RTS                                  ;008F9D|60      |      ;
 
 
         DATA8_008F9E: db $00,$10,$13,$20,$21               ;008F9E|        |      ;
                       db $30,$40,$50,$60,$70               ;008FA3|        |      ;
 
                       db $75,$80,$90,$A0,$B0               ;008FA8|        |      ;
                       db $C0,$D0,$E0                       ;008FAD|        |      ;
 
          CODE_008FB0: LDA.B r_CurrRoomGroupStage           ;008FB0|A532    |000032;
                       ASL A                                ;008FB2|0A      |      ;
                       CLC                                  ;008FB3|18      |      ;
                       ADC.B r_CurrRoomGroupStage           ;008FB4|6532    |000032;
                       TAY                                  ;008FB6|A8      |      ;
                       LDA.W DATA8_008FD1,Y                 ;008FB7|B9D18F  |008FD1;
                       CMP.B r_CurrRoomSectionBlock         ;008FBA|C533    |000033;
                       BCS CODE_008FBF                      ;008FBC|B001    |008FBF;
                       INY                                  ;008FBE|C8      |      ;
 
          CODE_008FBF: LDA.W DATA8_008FD2,Y                 ;008FBF|B9D28F  |008FD2;
                       CMP.B #$03                           ;008FC2|C903    |      ;
                       BEQ CODE_008FC9                      ;008FC4|F003    |008FC9;
 
          CODE_008FC6: STA.B r_Checkpoint                   ;008FC6|852E    |00002E;
                       RTS                                  ;008FC8|60      |      ;
 
 
          CODE_008FC9: LDY.B r_GrantDefeated                ;008FC9|A42F    |00002F;
                       BEQ CODE_008FC6                      ;008FCB|F0F9    |008FC6;
                       LDA.B #$04                           ;008FCD|A904    |      ;
                       BNE CODE_008FC6                      ;008FCF|D0F5    |008FC6;
 
         DATA8_008FD1: db $10                               ;008FD1|        |      ;
 
         DATA8_008FD2: db $00,$00,$02,$01,$02               ;008FD2|        |      ;
                       db $10,$03,$04,$10,$05               ;008FD7|        |      ;
                       db $05,$10,$06,$06,$10               ;008FDC|        |      ;
                       db $07,$07,$10,$08,$08               ;008FE1|        |      ;
                       db $04,$09,$0A,$10,$0B               ;008FE6|        |      ;
                       db $0B,$10,$0C,$0C,$10               ;008FEB|        |      ;
                       db $0D,$0D,$10,$0E,$0E               ;008FF0|        |      ;
                       db $10,$0F,$0F,$10,$10               ;008FF5|        |      ;
                       db $10,$10,$11,$11                   ;008FFA|        |      ;
 
          CODE_008FFE: LDY.B #$00                           ;008FFE|A000    |      ;
 
                       JSR.W CODE_009031                    ;009000|203190  |009031;
                       BCS CODE_00902E                      ;009003|B029    |00902E;
                       LDY.B #$02                           ;009005|A002    |      ;
                       JSR.W CODE_009031                    ;009007|203190  |009031;
                       BCS CODE_00902B                      ;00900A|B01F    |00902B;
                       LDY.B #$04                           ;00900C|A004    |      ;
                       JSR.W CODE_009031                    ;00900E|203190  |009031;
                       BCS CODE_009022                      ;009011|B00F    |009022;
                       LDY.B #$06                           ;009013|A006    |      ;
                       JSR.W CODE_009031                    ;009015|203190  |009031;
 
                       BCS CODE_009025                      ;009018|B00B    |009025;
                       LDY.B #$08                           ;00901A|A008    |      ;
                       JSR.W CODE_009031                    ;00901C|203190  |009031;
                       BCS CODE_009028                      ;00901F|B007    |009028;
                       RTS                                  ;009021|60      |      ;
 
 
          CODE_009022: LDY.B #$03                           ;009022|A003    |      ;
 
                       RTS                                  ;009024|60      |      ;
 
 
          CODE_009025: LDY.B #$04                           ;009025|A004    |      ;
                       RTS                                  ;009027|60      |      ;
 
 
          CODE_009028: LDY.B #$05                           ;009028|A005    |      ;
                       RTS                                  ;00902A|60      |      ;
 
 
          CODE_00902B: LDY.B #$02                           ;00902B|A002    |      ;
                       RTS                                  ;00902D|60      |      ;
 
 
          CODE_00902E: LDY.B #$01                           ;00902E|A001    |      ;
                       RTS                                  ;009030|60      |      ;
 
 
          CODE_009031: LDA.W DATA8_00904D,Y                 ;009031|B94D90  |00904D;
 
                       STA.B r_CurrNumToVramQueue           ;009034|8508    |000008;
                       LDA.W DATA8_00904E,Y                 ;009036|B94E90  |00904E;
                       STA.B $09                            ;009039|8509    |000009;
                       LDY.B #$00                           ;00903B|A000    |      ;
 
          CODE_00903D: LDA.W $07F8,Y                        ;00903D|B9F807  |0007F8;
                       CMP.B (r_CurrNumToVramQueue),Y       ;009040|D108    |000008;
                       BNE DATA8_00904B                     ;009042|D007    |00904B;
                       INY                                  ;009044|C8      |      ;
                       CPY.B #$08                           ;009045|C008    |      ;
                       BNE CODE_00903D                      ;009047|D0F4    |00903D;
                       SEC                                  ;009049|38      |      ;
                       RTS                                  ;00904A|60      |      ;
 
 
         DATA8_00904B: db $18,$60                           ;00904B|        |      ;
 
         DATA8_00904D: db $57                               ;00904D|        |      ;
 
         DATA8_00904E: db $90,$5F,$90,$67,$90               ;00904E|        |      ;
                       db $6F,$90,$77,$90,$57               ;009053|        |      ;
 
                       db $54,$5B,$5F,$00,$5C               ;009058|        |      ;
                       db $54,$00,$50,$5A,$50               ;00905D|        |      ;
                       db $5C,$50,$00,$00,$00               ;009062|        |      ;
                       db $5E,$5A,$64,$53,$50               ;009067|        |      ;
                       db $00,$00,$00,$64,$61               ;00906C|        |      ;
                       db $50,$63,$50,$00,$00               ;009071|        |      ;
                       db $00,$55,$64,$59,$58               ;009076|        |      ;
                       db $5C,$5E,$63,$5E                   ;00907B|        |      ;
 
          CODE_00907F: LDA.B #$B0                           ;00907F|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;009081|85FF    |0000FF;
                       JSR.W CODE_0090CD                    ;009083|20CD90  |0090CD;
                       JSR.W CODE_0090C0                    ;009086|20C090  |0090C0;
                       LDA.B #$02                           ;009089|A902    |      ;
 
                       STA.B r_Score4ExtraLive              ;00908B|853E    |00003E;
                       JSR.W CODE_008FFE                    ;00908D|20FE8F  |008FFE;
                       BCC CODE_0090B7                      ;009090|9025    |0090B7;
                       DEY                                  ;009092|88      |      ;
                       BEQ CODE_0090BC                      ;009093|F027    |0090BC;
                       DEY                                  ;009095|88      |      ;
                       BEQ CODE_0090B2                      ;009096|F01A    |0090B2;
 
                       LDA.B r_PartnerIdx                   ;009098|A53A    |00003A;
                       CMP.B #$FF                           ;00909A|C9FF    |      ;
                       BNE CODE_0090B7                      ;00909C|D019    |0090B7;
                       DEY                                  ;00909E|88      |      ;
                       BEQ CODE_0090AC                      ;00909F|F00B    |0090AC;
                       DEY                                  ;0090A1|88      |      ;
                       BEQ CODE_0090A8                      ;0090A2|F004    |0090A8;
                       LDA.B #$02                           ;0090A4|A902    |      ;
                       BNE CODE_0090AE                      ;0090A6|D006    |0090AE;
 
          CODE_0090A8: LDA.B #$01                           ;0090A8|A901    |      ;
 
                       BNE CODE_0090AE                      ;0090AA|D002    |0090AE;
 
          CODE_0090AC: LDA.B #$03                           ;0090AC|A903    |      ;
 
          CODE_0090AE: STA.B r_PartnerIdx                   ;0090AE|853A    |00003A;
                       BNE CODE_0090B7                      ;0090B0|D005    |0090B7;
 
          CODE_0090B2: LDA.B #$01                           ;0090B2|A901    |      ;
                       STA.W r_HardMode                     ;0090B4|8DF607  |0007F6;
 
          CODE_0090B7: LDA.B #$02                           ;0090B7|A902    |      ;
 
          CODE_0090B9: STA.B r_CurrLivesLeft                ;0090B9|8535    |000035;
 
                       RTS                                  ;0090BB|60      |      ;
 
 
          CODE_0090BC: LDA.B #$10                           ;0090BC|A910    |      ;
                       BNE CODE_0090B9                      ;0090BE|D0F9    |0090B9;
 
          CODE_0090C0: LDA.B #$05                           ;0090C0|A905    |      ;
                       STA.B r_NumHearts                    ;0090C2|8584    |000084;
                       LDA.B #$40                           ;0090C4|A940    |      ;
                       STA.B r_PlayerHealth                 ;0090C6|853C    |00003C;
 
          CODE_0090C8: LDA.B #$40                           ;0090C8|A940    |      ;
                       STA.B r_BossHealth                   ;0090CA|853D    |00003D;
                       RTS                                  ;0090CC|60      |      ;
 
 
          CODE_0090CD: LDA.B #$40                           ;0090CD|A940    |      ;
                       STA.B r_ChrBankBG_0000               ;0090CF|854A    |00004A;
                       LDA.B #$43                           ;0090D1|A943    |      ;
                       STA.B r_ChrBankBG_0c00               ;0090D3|854D    |00004D;
                       RTS                                  ;0090D5|60      |      ;
 
 
          CODE_0090D6: LDA.B #$00                           ;0090D6|A900    |      ;
                       STA.B r_StopWatchActive              ;0090D8|85AB    |0000AB;
                       STA.B r_StopWatchTimer               ;0090DA|85AC    |0000AC;
                       STA.W $06C9                          ;0090DC|8DC906  |0006C9;
                       STA.B r_BridgeTimer                  ;0090DF|85B3    |0000B3;
                       RTS                                  ;0090E1|60      |      ;
 
                       LDA.B #$B0                           ;0090E2|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;0090E4|85FF    |0000FF;
                       db $20                               ;0090E6|        |      ;
                       dw UNREACH_0FE666                    ;0090E7|        |0FE666;
                       JSR.W CODE_0090C8                    ;0090E9|20C890  |0090C8;
                       LDA.B #$00                           ;0090EC|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;0090EE|8D0004  |000400;
                       STA.W $0418                          ;0090F1|8D1804  |000418;
                       STA.W $0419                          ;0090F4|8D1904  |000419;
                       STA.B r_MusicLoaded                  ;0090F7|8574    |000074;
                       STA.B $75                            ;0090F9|8575    |000075;
                       STA.W r_PlayerStateDoubled           ;0090FB|8D6505  |000565;
                       JSR.W CODE_0090D6                    ;0090FE|20D690  |0090D6;
                       db $20                               ;009101|        |      ;
                       dw CODE_0FE862                       ;009102|        |0FE862;
                       JMP.W CODE_009130                    ;009104|4C3091  |009130;
 
                       LDA.B #$00                           ;009107|A900    |      ;
                       STA.W r_EntityYposSpeed              ;009109|8D2005  |000520;
                       STA.W r_EntityYposSubSpeed           ;00910C|8D3705  |000537;
                       JSR.W CODE_0090D6                    ;00910F|20D690  |0090D6;
                       db $20                               ;009112|        |      ;
                       dw CODE_0FE862                       ;009113|        |0FE862;
                       BCS CODE_009130                      ;009115|B019    |009130;
                       LDA.W r_InstrumentsSoundIdxes        ;009117|AD0701  |000107;
                       CMP.B #$5F                           ;00911A|C95F    |      ;
                       BNE CODE_009122                      ;00911C|D004    |009122;
                       LDA.B #$00                           ;00911E|A900    |      ;
                       STA.B r_MusicLoaded                  ;009120|8574    |000074;
 
          CODE_009122: LDA.B #$B0                           ;009122|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;009124|85FF    |0000FF;
                       db $20                               ;009126|        |      ;
                       dw UNREACH_0FE666                    ;009127|        |0FE666;
                       LDA.B #$00                           ;009129|A900    |      ;
                       STA.B $75                            ;00912B|8575    |000075;
                       JSR.W CODE_00917F                    ;00912D|207F91  |00917F;
 
          CODE_009130: JSR.W CODE_0090CD                    ;009130|20CD90  |0090CD;
                       LDA.B #$B0                           ;009133|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;009135|85FF    |0000FF;
                       LDA.W r_PlayerStateDoubled           ;009137|AD6505  |000565;
                       AND.B #$7F                           ;00913A|297F    |      ;
                       STA.W r_PlayerStateDoubled           ;00913C|8D6505  |000565;
                       LDA.B #$00                           ;00913F|A900    |      ;
                       STA.B $78                            ;009141|8578    |000078;
                       STA.B r_HurtInvincibilityFrames      ;009143|8580    |000080;
                       STA.B r_LoadCHRbeforeSwap            ;009145|85B0    |0000B0;
                       STA.B r_RosseryFlashTimer            ;009147|85B2    |0000B2;
                       STA.B r_PotionTimer                  ;009149|85AD    |0000AD;
                       STA.B r_CinematicsControllerBossDefeated;00914B|852C    |00002C;
                       STA.B r_FloodStop                    ;00914D|85C0    |0000C0;
                       STA.B r_BossSecondFace               ;00914F|85C2    |0000C2;
                       STA.B r_HorizontalScrollLockBridge   ;009151|85C8    |0000C8;
                       STA.B r_BossObject                   ;009153|85C1    |0000C1;
                       STA.B r_DisablePlayer                ;009155|85C4    |0000C4;
                       STA.B $C5                            ;009157|85C5    |0000C5;
                       STA.B $CC                            ;009159|85CC    |0000CC;
                       STA.B $CD                            ;00915B|85CD    |0000CD;
                       STA.B r_BossSpecialHitbox            ;00915D|85BA    |0000BA;
                       db $20                               ;00915F|        |      ;
                       dw UNREACH_0FE7F7                    ;009160|        |0FE7F7;
                       LDA.B #$00                           ;009162|A900    |      ;
                       STA.W $0417                          ;009164|8D1704  |000417;
                       STA.W $041A                          ;009167|8D1A04  |00041A;
                       STA.W $041B                          ;00916A|8D1B04  |00041B;
                       STA.W $048A                          ;00916D|8D8A04  |00048A;
                       STA.W $048B                          ;009170|8D8B04  |00048B;
                       LDX.B #$00                           ;009173|A200    |      ;
                       TXA                                  ;009175|8A      |      ;
 
          CODE_009176: STA.W r_SoundModeSongSelected,X      ;009176|9D8007  |000780;
                       INX                                  ;009179|E8      |      ;
                       CPX.B #$43                           ;00917A|E043    |      ;
                       BNE CODE_009176                      ;00917C|D0F8    |009176;
                       RTS                                  ;00917E|60      |      ;
 
 
          CODE_00917F: LDA.B #$00                           ;00917F|A900    |      ;
                       TAX                                  ;009181|AA      |      ;
 
          CODE_009182: STA.W r_CurrCollisionMapValues90,X   ;009182|9DE006  |0006E0;
                       INX                                  ;009185|E8      |      ;
 
                       CPX.B #$90                           ;009186|E090    |      ;
                       BNE CODE_009182                      ;009188|D0F8    |009182;
                       RTS                                  ;00918A|60      |      ;
 
 
          CODE_00918B: LDA.B #$B0                           ;00918B|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;00918D|85FF    |0000FF;
                       db $20                               ;00918F|        |      ;
                       dw UNREACH_0FE666                    ;009190|        |0FE666;
                       JSR.W CODE_0090CD                    ;009192|20CD90  |0090CD;
                       db $20                               ;009195|        |      ;
                       dw UNREACH_0FE5CA                    ;009196|        |0FE5CA;
                       LDA.W r_EntityObjectIdxes            ;009198|AD4E05  |00054E;
                       PHA                                  ;00919B|48      |      ;
                       LDA.B r_BossDragonKingHP             ;00919C|A5BD    |0000BD;
 
                       PHA                                  ;00919E|48      |      ;
                       LDA.B r_BossDragonMisc               ;00919F|A5BE    |0000BE;
                       PHA                                  ;0091A1|48      |      ;
                       db $20                               ;0091A2|        |      ;
 
                       dw clearZeroPage                     ;0091A3|        |0FE828;
                       PLA                                  ;0091A5|68      |      ;
                       STA.B r_BossDragonMisc               ;0091A6|85BE    |0000BE;
                       PLA                                  ;0091A8|68      |      ;
                       STA.B r_BossDragonKingHP             ;0091A9|85BD    |0000BD;
 
                       PLA                                  ;0091AB|68      |      ;
                       STA.W r_EntityObjectIdxes            ;0091AC|8D4E05  |00054E;
                       JMP.W CODE_0090C0                    ;0091AF|4CC090  |0090C0;
 
                       LDA.B #$00                           ;0091B2|A900    |      ;
                       STA.B r_HurtInvincibilityFrames      ;0091B4|8580    |000080;
                       STA.W r_EntityState                  ;0091B6|8D7004  |000470;
                       DEC.B r_GenericStateTimer            ;0091B9|C630    |000030;
                       BNE CODE_0091CD                      ;0091BB|D010    |0091CD;
                       LDA.B $9F                            ;0091BD|A59F    |00009F;
                       STA.B r_InGameSubstate               ;0091BF|852A    |00002A;
                       LDA.W r_PlayerStateDoubled           ;0091C1|AD6505  |000565;
                       AND.B #$7F                           ;0091C4|297F    |      ;
                       STA.W r_PlayerStateDoubled           ;0091C6|8D6505  |000565;
                       LDA.B #$00                           ;0091C9|A900    |      ;
                       BEQ CODE_0091D1                      ;0091CB|F004    |0091D1;
 
          CODE_0091CD: LDA.B r_GameStateLoopCounter         ;0091CD|A51A    |00001A;
                       AND.B #$03                           ;0091CF|2903    |      ;
 
          CODE_0091D1: STA.W r_EntityPaletteOverride        ;0091D1|8D5404  |000454;
                       RTS                                  ;0091D4|60      |      ;
 
                       JSR.W DATA8_0091DD                   ;0091D5|20DD91  |0091DD;
                       LDA.B #$00                           ;0091D8|A900    |      ;
                       STA.B r_InGameSubstate               ;0091DA|852A    |00002A;
                       RTS                                  ;0091DC|60      |      ;
 
 
         DATA8_0091DD: db $20                               ;0091DD|        |      ;
                       dw UNREACH_0FE795                    ;0091DE|        |0FE795;
                       LDA.B r_CurrRoomGroupStage           ;0091E0|A532    |000032;
                       CMP.B #$03                           ;0091E2|C903    |      ;
                       BEQ CODE_009209                      ;0091E4|F023    |009209;
                       CMP.B #$0A                           ;0091E6|C90A    |      ;
                       BEQ CODE_009201                      ;0091E8|F017    |009201;
                       CMP.B #$0E                           ;0091EA|C90E    |      ;
                       BEQ CODE_0091FB                      ;0091EC|F00D    |0091FB;
 
          CODE_0091EE: JSR.W CODE_0090C0                    ;0091EE|20C090  |0090C0;
 
          CODE_0091F1: LDA.B #$00                           ;0091F1|A900    |      ;
                       STA.W r_PlayerStateDoubled           ;0091F3|8D6505  |000565;
                       STA.B $75                            ;0091F6|8575    |000075;
                       STA.B r_MusicLoaded                  ;0091F8|8574    |000074;
                       RTS                                  ;0091FA|60      |      ;
 
 
          CODE_0091FB: LDA.B r_CurrRoomSectionBlock         ;0091FB|A533    |000033;
                       BEQ CODE_0091EE                      ;0091FD|F0EF    |0091EE;
                       BNE CODE_00920F                      ;0091FF|D00E    |00920F;
 
          CODE_009201: LDA.B r_CurrRoomSectionBlock         ;009201|A533    |000033;
                       CMP.B #$04                           ;009203|C904    |      ;
                       BEQ CODE_00920F                      ;009205|F008    |00920F;
                       BNE CODE_0091EE                      ;009207|D0E5    |0091EE;
 
          CODE_009209: LDA.B r_CurrRoomSectionBlock         ;009209|A533    |000033;
                       CMP.B #$03                           ;00920B|C903    |      ;
                       BNE CODE_0091EE                      ;00920D|D0DF    |0091EE;
 
          CODE_00920F: JSR.W CODE_0090C8                    ;00920F|20C890  |0090C8;
                       JMP.W CODE_0091F1                    ;009212|4CF191  |0091F1;
 
                       LDY.B #$00                           ;009215|A000    |      ;
 
                       LDA.W DATA8_009244,Y                 ;009217|B94492  |009244;
 
                       CMP.B #$FF                           ;00921A|C9FF    |      ;
                       BEQ CODE_009230                      ;00921C|F012    |009230;
                       CMP.B r_CurrRoomGroupStage           ;00921E|C532    |000032;
                       BNE DATA8_00923E                     ;009220|D01C    |00923E;
                       LDA.B r_CurrRoomSectionBlock         ;009222|A533    |000033;
                       CMP.W DATA8_009245,Y                 ;009224|D94592  |009245;
                       BNE DATA8_00923E                     ;009227|D015    |00923E;
                       LDA.B r_CurrRoomIdx                  ;009229|A534    |000034;
                       CMP.W DATA8_009246,Y                 ;00922B|D94692  |009246;
                       BNE DATA8_00923E                     ;00922E|D00E    |00923E;
 
          CODE_009230: LDA.W DATA8_009247,Y                 ;009230|B94792  |009247;
                       STA.B r_MapTransitionCheckpoint      ;009233|85A4    |0000A4;
                       LDA.B #$00                           ;009235|A900    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009237|856B    |00006B;
                       LDA.B #$17                           ;009239|A917    |      ;
                       STA.B r_InGameSubstate               ;00923B|852A    |00002A;
                       RTS                                  ;00923D|60      |      ;
 
 
         DATA8_00923E: db $C8,$C8,$C8,$C8,$D0               ;00923E|        |      ;
                       db $D3                               ;009243|        |      ;
 
         DATA8_009244: db $00                               ;009244|        |      ;
 
         DATA8_009245: db $00                               ;009245|        |      ;
 
         DATA8_009246: db $00                               ;009246|        |      ;
 
         DATA8_009247: db $00,$01,$02,$02,$01               ;009247|        |      ;
                       db $01,$05,$00,$02,$02               ;00924C|        |      ;
                       db $04,$00,$03,$03,$04               ;009251|        |      ;
                       db $01,$04,$04,$02,$02               ;009256|        |      ;
                       db $05,$05,$03,$00,$06               ;00925B|        |      ;
                       db $06,$02,$00,$07,$07               ;009260|        |      ;
                       db $04,$01,$08,$07,$06               ;009265|        |      ;
 
                       db $00,$09,$08,$04,$00               ;00926A|        |      ;
 
                       db $0A,$09,$01,$02,$0B               ;00926F|        |      ;
                       db $0A,$06,$02,$0C,$0B               ;009274|        |      ;
                       db $02,$00,$0D,$0C,$02               ;009279|        |      ;
                       db $00,$0E,$0D,$03,$01               ;00927E|        |      ;
                       db $0F,$FF,$00,$00,$00               ;009283|        |      ;
 
                       LDA.B r_MenuOptionIdxSelected        ;009288|A56B    |00006B;
                       db $20                               ;00928A|        |      ;
                       dw jumpFromStackYXpreserved          ;00928B|        |0FE86D;
                       STA.W UNREACH_0FFA92,Y               ;00928D|9992FA  |0FFA92;
                       STA.B (r_ScrollDirection)            ;009290|9265    |000065;
 
                       STA.B (r_DoubleCurrGroup,S),Y        ;009292|930C    |00000C;
                       STY.B r_CinematicsControllerBossDefeated,X;009294|942C    |00002C;
                       STY.B r_ScannlineTarget,X            ;009296|9442    |000042;
                       STY.B r_CurrFrameStartingOamOffset,X ;009298|9420    |000020;
                       LDX.B r_WhipSparkTimer               ;00929A|A68C    |00008C;
                       db $20                               ;00929C|        |      ;
                       dw UNREACH_0FE7F7                    ;00929D|        |0FE7F7;
                       LDA.B #$00                           ;00929F|A900    |      ;
                       STA.W $0417                          ;0092A1|8D1704  |000417;
                       LDY.B #$00                           ;0092A4|A000    |      ;
 
          CODE_0092A6: LDA.W DATA8_0092D5,Y                 ;0092A6|B9D592  |0092D5;
                       CMP.B #$FF                           ;0092A9|C9FF    |      ;
                       BEQ CODE_0092B5                      ;0092AB|F008    |0092B5;
                       CMP.B r_CurrRoomGroupStage           ;0092AD|C532    |000032;
                       BEQ CODE_0092B7                      ;0092AF|F006    |0092B7;
                       INY                                  ;0092B1|C8      |      ;
                       INY                                  ;0092B2|C8      |      ;
                       BNE CODE_0092A6                      ;0092B3|D0F1    |0092A6;
 
          CODE_0092B5: LDY.B #$00                           ;0092B5|A000    |      ;
 
          CODE_0092B7: LDA.W DATA8_0092D6,Y                 ;0092B7|B9D692  |0092D6;
                       ASL A                                ;0092BA|0A      |      ;
                       ASL A                                ;0092BB|0A      |      ;
                       TAY                                  ;0092BC|A8      |      ;
                       LDA.W DATA8_0092E2,Y                 ;0092BD|B9E292  |0092E2;
                       STA.W r_EntityFacingLeft             ;0092C0|8DA804  |0004A8;
                       STY.B r_AutoWalkPlayer               ;0092C3|84C6    |0000C6;
                       db $20                               ;0092C5|        |      ;
                       dw UNREACH_0FE5CE                    ;0092C6|        |0FE5CE;
                       LDA.B #$00                           ;0092C8|A900    |      ;
                       STA.W r_EntityState                  ;0092CA|8D7004  |000470;
                       LDA.B #$00                           ;0092CD|A900    |      ;
                       db $20                               ;0092CF|        |      ;
                       dw CODE_0FEF57                       ;0092D0|        |0FEF57;
                       INC.B r_MenuOptionIdxSelected        ;0092D2|E66B    |00006B;
                       RTS                                  ;0092D4|60      |      ;
 
 
         DATA8_0092D5: db $01                               ;0092D5|        |      ; c6 enity index is y offset
 
         DATA8_0092D6: db $00,$02,$01,$07,$02               ;0092D6|        |      ;
                       db $03,$03,$0A,$04,$0E               ;0092DB|        |      ;
                       db $05,$FF                           ;0092E0|        |      ;
 
         DATA8_0092E2: db $01                               ;0092E2|        |      ;
 
  afterBoss_gameState: db $04                               ;0092E3|        |      ;
 
   afterBoss_subState: db $1E                               ;0092E4|        |      ;
 
       afterBoss_Room: db $00,$00,$08,$00,$00               ;0092E5|        |      ;
                       db $01,$08,$00,$00,$00               ;0092EA|        |      ;
                       db $04,$1F,$01,$00,$04               ;0092EF|        |      ; afterMedua
                       db $1F,$01,$01,$04,$1F               ;0092F4|        |      ;
                       db $01                               ;0092F9|        |      ;
                       LDA.W r_EntityXPos                   ;0092FA|AD3804  |000438;
                       LDY.W r_EntityFacingLeft             ;0092FD|ACA804  |0004A8;
 
                       BEQ CODE_009308                      ;009300|F006    |009308;
                       CMP.B #$18                           ;009302|C918    |      ;
                       BCS CODE_009315                      ;009304|B00F    |009315;
                       BCC CODE_00930C                      ;009306|9004    |00930C;
 
          CODE_009308: CMP.B #$E8                           ;009308|C9E8    |      ;
                       BCC CODE_009315                      ;00930A|9009    |009315;
 
          CODE_00930C: LDA.B r_CurrRoomGroupStage           ;00930C|A532    |000032;
                       CMP.B #$01                           ;00930E|C901    |      ;
                       BEQ CODE_00931B                      ;009310|F009    |00931B;
                       INC.B r_MenuOptionIdxSelected        ;009312|E66B    |00006B;
                       RTS                                  ;009314|60      |      ;
 
 
          CODE_009315: JSR.W CODE_009331                    ;009315|203193  |009331;
                       db $4C                               ;009318|        |      ;
 
                       dw CODE_0FEF73                       ;009319|        |0FEF73;
 
          CODE_00931B: LDA.B #$11                           ;00931B|A911    |      ;
                       STA.B r_InGameSubstate               ;00931D|852A    |00002A;
                       LDA.B #$00                           ;00931F|A900    |      ;
                       STA.W r_BoneDragonKingRipsBossGeneral;009321|8DEC07  |0007EC;
                       STA.W $07F3                          ;009324|8DF307  |0007F3;
                       LDA.B #$00                           ;009327|A900    |      ;
                       STA.W $07ED                          ;009329|8DED07  |0007ED;
                       LDA.B #$63                           ;00932C|A963    |      ;
                       db $4C                               ;00932E|        |      ;
 
                       dw CODE_0FE25F                       ;00932F|        |0FE25F;
 
          CODE_009331: LDA.B r_GameStateLoopCounter         ;009331|A51A    |00001A;
                       AND.B #$0F                           ;009333|290F    |      ;
                       BNE CODE_00933C                      ;009335|D005    |00933C;
                       LDA.B #$09                           ;009337|A909    |      ;
                       db $20                               ;009339|        |      ;
                       dw CODE_0FE25F                       ;00933A|        |0FE25F;
 
          CODE_00933C: LDA.W r_EntityFacingLeft             ;00933C|ADA804  |0004A8;
                       BEQ CODE_009353                      ;00933F|F012    |009353;
                       LDA.W r_EntityFractionalX            ;009341|ADC404  |0004C4;
                       SEC                                  ;009344|38      |      ;
                       SBC.B #$C0                           ;009345|E9C0    |      ;
                       STA.W r_EntityFractionalX            ;009347|8DC404  |0004C4;
                       LDA.W r_EntityXPos                   ;00934A|AD3804  |000438;
                       SBC.B #$00                           ;00934D|E900    |      ;
 
                       STA.W r_EntityXPos                   ;00934F|8D3804  |000438;
                       RTS                                  ;009352|60      |      ;
 
 
          CODE_009353: LDA.W r_EntityFractionalX            ;009353|ADC404  |0004C4;
                       CLC                                  ;009356|18      |      ;
                       ADC.B #$C0                           ;009357|69C0    |      ;
                       STA.W r_EntityFractionalX            ;009359|8DC404  |0004C4;
                       LDA.W r_EntityXPos                   ;00935C|AD3804  |000438;
                       ADC.B #$00                           ;00935F|6900    |      ;
                       STA.W r_EntityXPos                   ;009361|8D3804  |000438;
                       RTS                                  ;009364|60      |      ;
 
                       INC.B r_MenuOptionIdxSelected        ;009365|E66B    |00006B;
                       LDA.B #$0C                           ;009367|A90C    |      ;
                       db $20                               ;009369|        |      ;
 
                       dw CODE_0FE25F                       ;00936A|        |0FE25F;
                       LDA.B #$3C                           ;00936C|A93C    |      ;
                       STA.B r_GenericStateTimer            ;00936E|8530    |000030;
                       LDA.B #$0C                           ;009370|A90C    |      ;
                       LDY.B #$00                           ;009372|A000    |      ;
                       LDX.B #$13                           ;009374|A213    |      ;
                       db $20                               ;009376|        |      ;
                       dw CODE_0FEF5C                       ;009377|        |0FEF5C;
                       LDA.B #$00                           ;009379|A900    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00937B|9D0004  |000400;
                       STA.W r_EntityPaletteOverride,X      ;00937E|9D5404  |000454;
                       LDA.W r_EntityYPos                   ;009381|AD1C04  |00041C;
                       ADC.B #$08                           ;009384|6908    |      ;
                       AND.B #$F0                           ;009386|29F0    |      ;
                       STA.W r_EntityYPos,X                 ;009388|9D1C04  |00041C;
                       LDA.W r_EntityFacingLeft             ;00938B|ADA804  |0004A8;
                       ASL A                                ;00938E|0A      |      ;
                       TAY                                  ;00938F|A8      |      ;
                       LDA.W CODE_009408,Y                  ;009390|B90894  |009408;
                       STA.W r_EntityXPos,X                 ;009393|9D3804  |000438;
                       LDA.W LOOSE_OP_009409,Y              ;009396|B90994  |009409;
 
                       STA.W r_EntityFacingLeft,X           ;009399|9DA804  |0004A8;
 
                       LDA.B r_CurrRoomGroupStage           ;00939C|A532    |000032;
                       CMP.B #$01                           ;00939E|C901    |      ;
                       BEQ CODE_0093F8                      ;0093A0|F056    |0093F8;
                       LDA.B #$00                           ;0093A2|A900    |      ;
                       STA.B $62                            ;0093A4|8562    |000062;
                       LDY.W r_EntityObjectIdxes            ;0093A6|AC4E05  |00054E;
                       LDA.W r_EntityYPos                   ;0093A9|AD1C04  |00041C;
                       SEC                                  ;0093AC|38      |      ;
                       SBC.W LOOSE_OP_009404,Y              ;0093AD|F90494  |009404;
                       ASL A                                ;0093B0|0A      |      ;
                       ROL.B $62                            ;0093B1|2662    |000062;
                       ASL A                                ;0093B3|0A      |      ;
                       ROL.B $62                            ;0093B4|2662    |000062;
                       AND.B #$E0                           ;0093B6|29E0    |      ;
                       STA.B r_VramQueueDest                ;0093B8|8561    |000061;
                       LDY.W r_EntityFacingLeft             ;0093BA|ACA804  |0004A8;
                       LDA.W CODE_009402,Y                  ;0093BD|B90294  |009402;
                       CLC                                  ;0093C0|18      |      ;
                       ADC.B r_VramQueueDest                ;0093C1|6561    |000061;
                       STA.B r_VramQueueDest                ;0093C3|8561    |000061;
                       LDA.B $75                            ;0093C5|A575    |000075;
                       AND.B #$01                           ;0093C7|2901    |      ;
                       STA.B $00                            ;0093C9|8500    |000000;
                       LDA.B r_ScrollDirection              ;0093CB|A565    |000065;
                       BNE CODE_0093D3                      ;0093CD|D004    |0093D3;
                       LDX.B #$24                           ;0093CF|A224    |      ;
                       BNE CODE_0093D5                      ;0093D1|D002    |0093D5;
 
          CODE_0093D3: LDX.B #$20                           ;0093D3|A220    |      ;
 
          CODE_0093D5: LDA.B r_CurrScrollRoomScreen         ;0093D5|A557    |000057;
                       AND.B #$01                           ;0093D7|2901    |      ;
                       EOR.B $00                            ;0093D9|4500    |000000;
                       BEQ CODE_0093E1                      ;0093DB|F004    |0093E1;
                       TXA                                  ;0093DD|8A      |      ;
                       EOR.B #$04                           ;0093DE|4904    |      ;
                       TAX                                  ;0093E0|AA      |      ;
 
          CODE_0093E1: TXA                                  ;0093E1|8A      |      ;
                       CLC                                  ;0093E2|18      |      ;
                       ADC.B $62                            ;0093E3|6562    |000062;
                       STA.B $62                            ;0093E5|8562    |000062;
 
         DATA8_0093E7: db $20                               ;0093E7|        |      ;
                       dw CODE_0FE8AF                       ;0093E8|        |0FE8AF;
                       LDY.B #$06                           ;0093EA|A006    |      ;
                       LDA.B #$00                           ;0093EC|A900    |      ;
 
          CODE_0093EE: STA.W r_VramQueue,X                  ;0093EE|9D0003  |000300;
                       INX                                  ;0093F1|E8      |      ;
                       DEY                                  ;0093F2|88      |      ;
                       BNE CODE_0093EE                      ;0093F3|D0F9    |0093EE;
                       db $4C                               ;0093F5|        |      ;
 
                       dw CODE_0FE8DE                       ;0093F6|        |0FE8DE;
 
          CODE_0093F8: LDA.B #$2A                           ;0093F8|A92A    |      ;
                       STA.B $62                            ;0093FA|8562    |000062;
                       LDA.B #$41                           ;0093FC|A941    |      ;
                       STA.B r_VramQueueDest                ;0093FE|8561    |000061;
 
                       BNE DATA8_0093E7                     ;009400|D0E5    |0093E7;
 
          CODE_009402: ASL.W $2001,X                        ;009402|1E0120  |002001;
                       JSR.W $2024                          ;009405|202420  |002024;
 
          CODE_009408: PEA.W $0C00                          ;009408|F4000C  |000C00;
                       ORA.B (r_AutoWalkPlayer,X)           ;00940B|01C6    |0000C6;
                       BMI LOOSE_OP_0093DF                  ;00940D|30D0    |0093DF;
                       TSB.W r_PartnerSwapDrawingLatch      ;00940F|0CA900  |0000A9;
                       db $20                               ;009412|        |      ;
                       dw CODE_0FEF57                       ;009413|        |0FEF57;
 
                       LDA.B #$14                           ;009415|A914    |      ;
                       STA.B r_GenericStateTimer            ;009417|8530    |000030;
                       INC.B r_MenuOptionIdxSelected        ;009419|E66B    |00006B;
 
          CODE_00941B: RTS                                  ;00941B|60      |      ;
 
 
                       LDX.B #$13                           ;00941C|A213    |      ;
                       db $20                               ;00941E|        |      ;
                       dw CODE_0FEF75                       ;00941F|        |0FEF75;
                       LDA.W r_EntityOamSpecIdxBaseOffset,X ;009421|BD9305  |000593;
 
                       BNE CODE_00941B                      ;009424|D0F5    |00941B;
                       LDA.B #$80                           ;009426|A980    |      ;
                       STA.W r_EntityTimeUntilNextAnimation,X;009428|9D7C05  |00057C;
                       RTS                                  ;00942B|60      |      ;
 
                       DEC.B r_GenericStateTimer            ;00942C|C630    |000030;
                       BEQ CODE_009436                      ;00942E|F006    |009436;
                       JSR.W CODE_009331                    ;009430|203193  |009331;
                       db $4C                               ;009433|        |      ;
 
                       dw CODE_0FEF73                       ;009434|        |0FEF73;
 
          CODE_009436: LDA.B #$00                           ;009436|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;009438|8D0004  |000400;
                       LDA.B #$10                           ;00943B|A910    |      ;
                       STA.B r_GenericStateTimer            ;00943D|8530    |000030;
                       INC.B r_MenuOptionIdxSelected        ;00943F|E66B    |00006B;
 
          CODE_009441: RTS                                  ;009441|60      |      ;
 
                       DEC.B r_GenericStateTimer            ;009442|C630    |000030;
                       BNE CODE_009441                      ;009444|D0FB    |009441;
                       LDA.B #$00                           ;009446|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;009448|8D0004  |000400;
                       STA.W $0418                          ;00944B|8D1804  |000418;
                       STA.W $0419                          ;00944E|8D1904  |000419;
                       LDY.B r_AutoWalkPlayer               ;009451|A4C6    |0000C6;
                       LDA.W afterBoss_gameState,Y          ;009453|B9E392  |0092E3;
                       STA.B r_GameState                    ;009456|8518    |000018;
                       LDA.W afterBoss_subState,Y           ;009458|B9E492  |0092E4;
                       STA.B r_InGameSubstate               ;00945B|852A    |00002A;
                       LDA.B r_CurrRoomSectionBlock         ;00945D|A533    |000033;
                       CLC                                  ;00945F|18      |      ;
                       ADC.W afterBoss_Room,Y               ;009460|79E592  |0092E5;
                       STA.B r_CurrRoomSectionBlock         ;009463|8533    |000033;
                       LDA.B #$00                           ;009465|A900    |      ;
                       STA.B r_GameSubstate                 ;009467|8519    |000019;
                       RTS                                  ;009469|60      |      ;
 
                       LDA.B r_MenuOptionIdxSelected        ;00946A|A56B    |00006B;
                       db $20                               ;00946C|        |      ;
                       dw jumpFromStackYXpreserved          ;00946D|        |0FE86D;
                       LDY.W LOOSE_OP_00BB94                ;00946F|AC94BB  |00BB94;
                       STY.B r_PreviousConveyanceBackup88,X ;009472|94CF    |0000CF;
                       STY.B r_UsableChars,X                ;009474|9439    |000039;
                       STA.B $9B,X                          ;009476|959B    |00009B;
                       STA.B r_SoundMetadataAddr,X          ;009478|95E8    |0000E8;
                       STA.B r_NametableMapping,X           ;00947A|9525    |000025;
                       STX.B $60,Y                          ;00947C|9660    |000060;
                       STX.B r_SizeCurrRoomNumScreens,Y     ;00947E|9671    |000071;
                       STX.B r_CurrRoomEntityDataAddrSpawner,Y;009480|9698    |000098;
                       STA.B r_SoundBankTempVar2,X          ;009482|95E5    |0000E5;
                       STA.B r_PrgBankBkup_8000,X           ;009484|9522    |000022;
                       STX.B $60,Y                          ;009486|9660    |000060;
                       STX.B r_SizeCurrRoomNumScreens,Y     ;009488|9671    |000071;
                       STX.B r_CollisionValIsForRightHalfOf32x16block,Y;00948A|96A5    |0000A5;
                       RTL                                  ;00948C|6B      |      ;
 
                       db $20                               ;00948D|        |      ;
                       dw jumpFromStackYXpreserved          ;00948E|        |0FE86D;
                       dw CODE_0094AC                       ;009490|        |0094AC;
                       dw CODE_0094BB                       ;009492|        |0094BB;
                       dw CODE_0094CF                       ;009494|        |0094CF;
                       dw CODE_00951B                       ;009496|        |00951B;
                       dw CODE_00959B                       ;009498|        |00959B;
                       dw DATA8_0095E8                      ;00949A|        |0095E8;
                       dw CODE_009625                       ;00949C|        |009625;
                       dw CODE_009682                       ;00949E|        |009682;
                       dw CODE_00969F                       ;0094A0|        |00969F;
                       dw CODE_009598                       ;0094A2|        |009598;
                       dw CODE_0095E5                       ;0094A4|        |0095E5;
                       dw CODE_009622                       ;0094A6|        |009622;
                       dw CODE_009692                       ;0094A8|        |009692;
 
                       dw CODE_00969F                       ;0094AA|        |00969F;
 
          CODE_0094AC: LDA.B #$46                           ;0094AC|A946    |      ;
                       db $20                               ;0094AE|        |      ;
                       dw CODE_0FE25F                       ;0094AF|        |0FE25F;
                       db $20                               ;0094B1|        |      ;
                       dw UNREACH_0FE5CE                    ;0094B2|        |0FE5CE;
                       LDA.B #$3C                           ;0094B4|A93C    |      ;
                       STA.B r_GenericStateTimer            ;0094B6|8530    |000030;
                       INC.B r_MenuOptionIdxSelected        ;0094B8|E66B    |00006B;
                       RTS                                  ;0094BA|60      |      ;
 
 
          CODE_0094BB: DEC.B r_GenericStateTimer            ;0094BB|C630    |000030;
                       BEQ CODE_0094C7                      ;0094BD|F008    |0094C7;
                       LDA.B r_GameStateLoopCounter         ;0094BF|A51A    |00001A;
                       AND.B #$03                           ;0094C1|2903    |      ;
                       STA.W r_EntityPaletteOverride        ;0094C3|8D5404  |000454;
                       RTS                                  ;0094C6|60      |      ;
 
 
          CODE_0094C7: LDA.B #$00                           ;0094C7|A900    |      ;
                       STA.W r_EntityPaletteOverride        ;0094C9|8D5404  |000454;
                       INC.B r_MenuOptionIdxSelected        ;0094CC|E66B    |00006B;
                       RTS                                  ;0094CE|60      |      ;
 
 
          CODE_0094CF: LDA.B #$4C                           ;0094CF|A94C    |      ;
                       STA.B r_GenericStateTimer            ;0094D1|8530    |000030;
                       LDA.W r_EntityXPos                   ;0094D3|AD3804  |000438;
                       STA.W $05D4                          ;0094D6|8DD405  |0005D4;
                       LDA.B #$00                           ;0094D9|A900    |      ;
                       STA.W $0505                          ;0094DB|8D0505  |000505;
                       STA.W $051C                          ;0094DE|8D1C05  |00051C;
 
                       STA.W r_TimerBatRiverSwap            ;0094E1|8D0206  |000602;
                       LDA.B #$10                           ;0094E4|A910    |      ;
                       STA.W r_StairsStuneTimer             ;0094E6|8DEB05  |0005EB;
                       LDA.B #$01                           ;0094E9|A901    |      ;
                       STA.W r_WeaponDamage                 ;0094EB|8D3006  |000630;
                       INC.B r_MenuOptionIdxSelected        ;0094EE|E66B    |00006B;
                       RTS                                  ;0094F0|60      |      ;
 
 
          CODE_0094F1: LDA.B r_PartnerSwapStateBackup       ;0094F1|A5AA    |0000AA;
                       CMP.B #$16                           ;0094F3|C916    |      ;
                       BEQ CODE_009509                      ;0094F5|F012    |009509;
                       LDA.B r_BossSecondFace               ;0094F7|A5C2    |0000C2;
                       BNE CODE_009509                      ;0094F9|D00E    |009509;
                       LDA.W r_EntityYPos                   ;0094FB|AD1C04  |00041C;
                       SEC                                  ;0094FE|38      |      ;
 
                       SBC.B #$4A                           ;0094FF|E94A    |      ;
                       BMI CODE_009509                      ;009501|3006    |009509;
                       CMP.B #$8E                           ;009503|C98E    |      ;
                       BCS CODE_009509                      ;009505|B002    |009509;
                       CLC                                  ;009507|18      |      ;
                       RTS                                  ;009508|60      |      ;
 
 
          CODE_009509: SEC                                  ;009509|38      |      ;
                       RTS                                  ;00950A|60      |      ;
 
 
          CODE_00950B: LDA.W r_EntityYPos                   ;00950B|AD1C04  |00041C;
                       SEC                                  ;00950E|38      |      ;
                       SBC.B #$4E                           ;00950F|E94E    |      ;
                       BMI CODE_009519                      ;009511|3006    |009519;
                       CMP.B #$8A                           ;009513|C98A    |      ;
                       BCS CODE_009519                      ;009515|B002    |009519;
                       CLC                                  ;009517|18      |      ;
                       RTS                                  ;009518|60      |      ;
 
 
          CODE_009519: SEC                                  ;009519|38      |      ;
                       RTS                                  ;00951A|60      |      ;
 
 
          CODE_00951B: JSR.W CODE_0094F1                    ;00951B|20F194  |0094F1;
                       BCS CODE_009534                      ;00951E|B014    |009534;
 
                       LDA.W r_EntityYPos                   ;009520|AD1C04  |00041C;
                       SEC                                  ;009523|38      |      ;
                       SBC.B #$18                           ;009524|E918    |      ;
                       STA.W $0619                          ;009526|8D1906  |000619;
                       TAY                                  ;009529|A8      |      ;
                       LDX.B #$2E                           ;00952A|A22E    |      ;
                       LDA.B #$09                           ;00952C|A909    |      ;
                       db $20                               ;00952E|        |      ;
                       dw UNREACH_0FE5BF                    ;00952F|        |0FE5BF;
                       INC.B r_MenuOptionIdxSelected        ;009531|E66B    |00006B;
                       RTS                                  ;009533|60      |      ;
 
 
          CODE_009534: LDA.B #$09                           ;009534|A909    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009536|856B    |00006B;
                       RTS                                  ;009538|60      |      ;
 
                       JSR.W CODE_00950B                    ;009539|200B95  |00950B;
                       BCS CODE_009550                      ;00953C|B012    |009550;
                       LDA.B #$0B                           ;00953E|A90B    |      ;
                       STA.B r_BaseIRQFuncIdx               ;009540|853F    |00003F;
                       LDA.W r_EntityYPos                   ;009542|AD1C04  |00041C;
                       SEC                                  ;009545|38      |      ;
                       SBC.B #$0C                           ;009546|E90C    |      ;
                       STA.W $0619                          ;009548|8D1906  |000619;
                       STA.B $7C                            ;00954B|857C    |00007C;
                       INC.B r_MenuOptionIdxSelected        ;00954D|E66B    |00006B;
                       RTS                                  ;00954F|60      |      ;
 
 
          CODE_009550: LDA.B #$09                           ;009550|A909    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009552|856B    |00006B;
                       RTS                                  ;009554|60      |      ;
 
 
          CODE_009555: LDA.B #$00                           ;009555|A900    |      ;
                       STA.W r_EntityState                  ;009557|8D7004  |000470;
                       LDA.W $0505                          ;00955A|AD0505  |000505;
                       BMI CODE_009589                      ;00955D|302A    |009589;
                       LDA.W r_WeaponDamage                 ;00955F|AD3006  |000630;
                       BEQ CODE_00957A                      ;009562|F016    |00957A;
                       LDA.W $05D4                          ;009564|ADD405  |0005D4;
                       SEC                                  ;009567|38      |      ;
                       SBC.W $0505                          ;009568|ED0505  |000505;
                       BCC CODE_009573                      ;00956B|9006    |009573;
                       CMP.B #$08                           ;00956D|C908    |      ;
                       BCC CODE_009573                      ;00956F|9002    |009573;
                       BCS CODE_00958C                      ;009571|B019    |00958C;
 
          CODE_009573: LDA.B #$80                           ;009573|A980    |      ;
                       STA.W r_EntityState                  ;009575|8D7004  |000470;
                       BNE CODE_00958F                      ;009578|D015    |00958F;
 
          CODE_00957A: LDA.W $05D4                          ;00957A|ADD405  |0005D4;
                       CLC                                  ;00957D|18      |      ;
                       ADC.W $0505                          ;00957E|6D0505  |000505;
                       BCS CODE_009573                      ;009581|B0F0    |009573;
                       CMP.B #$F8                           ;009583|C9F8    |      ;
                       BCS CODE_009573                      ;009585|B0EC    |009573;
                       BCC CODE_00958C                      ;009587|9003    |00958C;
 
          CODE_009589: LDA.W $05D4                          ;009589|ADD405  |0005D4;
 
          CODE_00958C: STA.W r_EntityXPos                   ;00958C|8D3804  |000438;
 
          CODE_00958F: LDA.W r_WeaponDamage                 ;00958F|AD3006  |000630;
                       EOR.B #$01                           ;009592|4901    |      ;
                       STA.W r_WeaponDamage                 ;009594|8D3006  |000630;
                       RTS                                  ;009597|60      |      ;
 
 
          CODE_009598: JSR.W CODE_009555                    ;009598|205595  |009555;
 
          CODE_00959B: DEC.B r_GenericStateTimer            ;00959B|C630    |000030;
                       BEQ CODE_0095D8                      ;00959D|F039    |0095D8;
                       LDA.W $051C                          ;00959F|AD1C05  |00051C;
                       CLC                                  ;0095A2|18      |      ;
                       ADC.W r_StairsStuneTimer             ;0095A3|6DEB05  |0005EB;
                       STA.W $051C                          ;0095A6|8D1C05  |00051C;
                       LDA.W $0505                          ;0095A9|AD0505  |000505;
 
                       ADC.W r_TimerBatRiverSwap            ;0095AC|6D0206  |000602;
                       STA.W $0505                          ;0095AF|8D0505  |000505;
                       CMP.B #$08                           ;0095B2|C908    |      ;
                       BCS CODE_0095B7                      ;0095B4|B001    |0095B7;
                       RTS                                  ;0095B6|60      |      ;
 
 
          CODE_0095B7: LDA.W r_StairsStuneTimer             ;0095B7|ADEB05  |0005EB;
                       CLC                                  ;0095BA|18      |      ;
                       ADC.B #$10                           ;0095BB|6910    |      ;
                       STA.W r_StairsStuneTimer             ;0095BD|8DEB05  |0005EB;
 
                       LDA.W r_TimerBatRiverSwap            ;0095C0|AD0206  |000602;
                       ADC.B #$00                           ;0095C3|6900    |      ;
                       STA.W r_TimerBatRiverSwap            ;0095C5|8D0206  |000602;
                       CMP.B #$08                           ;0095C8|C908    |      ;
                       BCS CODE_0095CD                      ;0095CA|B001    |0095CD;
                       RTS                                  ;0095CC|60      |      ;
 
 
          CODE_0095CD: LDA.B #$08                           ;0095CD|A908    |      ;
                       STA.W r_TimerBatRiverSwap            ;0095CF|8D0206  |000602;
                       LDA.B #$00                           ;0095D2|A900    |      ;
                       STA.W r_StairsStuneTimer             ;0095D4|8DEB05  |0005EB;
                       RTS                                  ;0095D7|60      |      ;
 
 
          CODE_0095D8: LDA.B #$80                           ;0095D8|A980    |      ;
                       STA.W r_EntityState                  ;0095DA|8D7004  |000470;
                       LDA.B #$00                           ;0095DD|A900    |      ;
                       STA.W $0413                          ;0095DF|8D1304  |000413;
                       INC.B r_MenuOptionIdxSelected        ;0095E2|E66B    |00006B;
                       RTS                                  ;0095E4|60      |      ;
 
 
          CODE_0095E5: JSR.W CODE_009555                    ;0095E5|205595  |009555;
 
         DATA8_0095E8: db $20                               ;0095E8|        |      ;
                       dw UNREACH_0FE677                    ;0095E9|        |0FE677;
                       LDA.W r_OamSpecIdxDoubled            ;0095EB|AD0004  |000400;
                       CMP.B #$48                           ;0095EE|C948    |      ;
                       BNE CODE_0095F7                      ;0095F0|D005    |0095F7;
                       LDA.B #$04                           ;0095F2|A904    |      ;
                       STA.W r_OamSpecIdxDoubled            ;0095F4|8D0004  |000400;
 
          CODE_0095F7: LDA.B r_CurrCharacterIdx             ;0095F7|A53B    |00003B;
                       EOR.B #$01                           ;0095F9|4901    |      ;
 
                       STA.B r_CurrCharacterIdx             ;0095FB|853B    |00003B;
                       TAY                                  ;0095FD|A8      |      ;
                       LDA.W r_UsableChars,Y                ;0095FE|B93900  |000039;
                       STA.W r_EntityObjectIdxes            ;009601|8D4E05  |00054E;
                       JSR.W CODE_008E4B                    ;009604|204B8E  |008E4B;
                       JSR.W CODE_008E61                    ;009607|20618E  |008E61;
                       db $20                               ;00960A|        |      ;
 
                       dw UNREACH_0FE61E                    ;00960B|        |0FE61E;
                       JSR.W loadPlayerCHRBank              ;00960D|200180  |008001;
                       db $20                               ;009610|        |      ;
                       dw CODE_0FE33C                       ;009611|        |0FE33C;
 
                       LDA.W r_EntityObjectIdxes            ;009613|AD4E05  |00054E;
                       ASL A                                ;009616|0A      |      ;
                       STA.W r_EntityOamSpecGroupDoubled    ;009617|8D8C04  |00048C;
                       LDA.B #$00                           ;00961A|A900    |      ;
                       STA.W r_EntityState                  ;00961C|8D7004  |000470;
                       INC.B r_MenuOptionIdxSelected        ;00961F|E66B    |00006B;
                       RTS                                  ;009621|60      |      ;
 
 
          CODE_009622: JSR.W CODE_009555                    ;009622|205595  |009555;
 
          CODE_009625: LDA.W $051C                          ;009625|AD1C05  |00051C;
                       SEC                                  ;009628|38      |      ;
                       SBC.W r_StairsStuneTimer             ;009629|EDEB05  |0005EB;
                       STA.W $051C                          ;00962C|8D1C05  |00051C;
                       LDA.W $0505                          ;00962F|AD0505  |000505;
                       SBC.W r_TimerBatRiverSwap            ;009632|ED0206  |000602;
                       STA.W $0505                          ;009635|8D0505  |000505;
                       CMP.B #$F0                           ;009638|C9F0    |      ;
                       BCS CODE_00965D                      ;00963A|B021    |00965D;
                       CMP.B #$08                           ;00963C|C908    |      ;
                       BCS CODE_00964B                      ;00963E|B00B    |00964B;
                       LDA.B #$10                           ;009640|A910    |      ;
                       STA.W r_StairsStuneTimer             ;009642|8DEB05  |0005EB;
                       LDA.B #$00                           ;009645|A900    |      ;
                       STA.W r_TimerBatRiverSwap            ;009647|8D0206  |000602;
                       RTS                                  ;00964A|60      |      ;
 
 
          CODE_00964B: LDA.W r_StairsStuneTimer             ;00964B|ADEB05  |0005EB;
                       SEC                                  ;00964E|38      |      ;
                       SBC.B #$10                           ;00964F|E910    |      ;
                       STA.W r_StairsStuneTimer             ;009651|8DEB05  |0005EB;
                       LDA.W r_TimerBatRiverSwap            ;009654|AD0206  |000602;
                       SBC.B #$00                           ;009657|E900    |      ;
                       STA.W r_TimerBatRiverSwap            ;009659|8D0206  |000602;
                       RTS                                  ;00965C|60      |      ;
 
 
          CODE_00965D: INC.B r_MenuOptionIdxSelected        ;00965D|E66B    |00006B;
                       RTS                                  ;00965F|60      |      ;
 
                       LDA.W $05D4                          ;009660|ADD405  |0005D4;
                       STA.W r_EntityXPos                   ;009663|8D3804  |000438;
                       LDA.B #$05                           ;009666|A905    |      ;
                       STA.B r_BaseIRQFuncIdx               ;009668|853F    |00003F;
                       LDA.B #$3C                           ;00966A|A93C    |      ;
                       STA.B r_GenericStateTimer            ;00966C|8530    |000030;
                       INC.B r_MenuOptionIdxSelected        ;00966E|E66B    |00006B;
                       RTS                                  ;009670|60      |      ;
 
                       DEC.B r_GenericStateTimer            ;009671|C630    |000030;
 
                       BEQ CODE_00967D                      ;009673|F008    |00967D;
                       LDA.B r_GameStateLoopCounter         ;009675|A51A    |00001A;
 
                       AND.B #$03                           ;009677|2903    |      ;
                       STA.W r_EntityPaletteOverride        ;009679|8D5404  |000454;
                       RTS                                  ;00967C|60      |      ;
 
 
          CODE_00967D: LDA.B #$05                           ;00967D|A905    |      ;
                       JMP.W CODE_0096AD                    ;00967F|4CAD96  |0096AD;
 
 
          CODE_009682: LDA.B r_PartnerSwapDrawingBackup     ;009682|A5A6    |0000A6;
                       STA.B r_BaseIRQFuncIdx               ;009684|853F    |00003F;
                       LDA.B r_PartnerSwapDrawingIRQPointer ;009686|A5A7    |0000A7;
                       STA.B r_BaseIRQCmpVal                ;009688|8541    |000041;
                       LDA.B $A8                            ;00968A|A5A8    |0000A8;
                       STA.B r_ScannlineTarget              ;00968C|8542    |000042;
 
                       LDA.B r_PartnerSwapDrawingLatch      ;00968E|A5A9    |0000A9;
                       STA.B r_BaseIRQStatus                ;009690|8540    |000040;
 
          CODE_009692: LDA.W $05D4                          ;009692|ADD405  |0005D4;
                       STA.W r_EntityXPos                   ;009695|8D3804  |000438;
 
                       LDA.B #$3C                           ;009698|A93C    |      ;
                       STA.B r_GenericStateTimer            ;00969A|8530    |000030;
                       INC.B r_MenuOptionIdxSelected        ;00969C|E66B    |00006B;
                       RTS                                  ;00969E|60      |      ;
 
 
          CODE_00969F: DEC.B r_GenericStateTimer            ;00969F|C630    |000030;
                       BEQ CODE_0096AB                      ;0096A1|F008    |0096AB;
                       LDA.B r_GameStateLoopCounter         ;0096A3|A51A    |00001A;
                       AND.B #$03                           ;0096A5|2903    |      ;
                       STA.W r_EntityPaletteOverride        ;0096A7|8D5404  |000454;
                       RTS                                  ;0096AA|60      |      ;
 
 
          CODE_0096AB: LDA.B r_PartnerSwapStateBackup       ;0096AB|A5AA    |0000AA;
 
          CODE_0096AD: STA.B r_InGameSubstate               ;0096AD|852A    |00002A;
                       LDA.B #$00                           ;0096AF|A900    |      ;
                       STA.W r_EntityPaletteOverride        ;0096B1|8D5404  |000454;
                       db $20                               ;0096B4|        |      ;
                       dw UNREACH_0FE5CA                    ;0096B5|        |0FE5CA;
                       LDA.B #$00                           ;0096B7|A900    |      ;
                       STA.W $0505                          ;0096B9|8D0505  |000505;
                       STA.W $051C                          ;0096BC|8D1C05  |00051C;
                       STA.W $05D4                          ;0096BF|8DD405  |0005D4;
                       STA.W r_StairsStuneTimer             ;0096C2|8DEB05  |0005EB;
                       STA.W r_TimerBatRiverSwap            ;0096C5|8D0206  |000602;
                       STA.W $0619                          ;0096C8|8D1906  |000619;
                       STA.W r_WeaponDamage                 ;0096CB|8D3006  |000630;
                       RTS                                  ;0096CE|60      |      ;
 
                       RTS                                  ;0096CF|60      |      ;
 
                       LDA.W r_PlayerStateDoubled           ;0096D0|AD6505  |000565;
                       CMP.B #$0E                           ;0096D3|C90E    |      ;
                       BCC CODE_0096F8                      ;0096D5|9021    |0096F8;
                       CMP.B #$16                           ;0096D7|C916    |      ;
                       BCS CODE_0096F8                      ;0096D9|B01D    |0096F8;
                       LDA.W r_EntityYPos                   ;0096DB|AD1C04  |00041C;
                       CMP.B #$70                           ;0096DE|C970    |      ;
                       BCS CODE_0096F8                      ;0096E0|B016    |0096F8;
                       LDA.B r_CurrentRoomEffect            ;0096E2|A57D    |00007D;
                       AND.B #$0F                           ;0096E4|290F    |      ;
                       ASL A                                ;0096E6|0A      |      ;
                       TAY                                  ;0096E7|A8      |      ;
                       LDA.W DATA8_0096FA,Y                 ;0096E8|B9FA96  |0096FA;
                       CMP.B r_CurrScrollRoomScreen         ;0096EB|C557    |000057;
                       BNE CODE_0096F8                      ;0096ED|D009    |0096F8;
                       LDA.W DATA8_0096FB,Y                 ;0096EF|B9FB96  |0096FB;
                       CMP.B r_CurrScrollOffsetIntoRoomScreen;0096F2|C556    |000056;
                       BNE CODE_0096F8                      ;0096F4|D002    |0096F8;
                       SEC                                  ;0096F6|38      |      ;
                       RTS                                  ;0096F7|60      |      ;
 
 
          CODE_0096F8: CLC                                  ;0096F8|18      |      ;
                       RTS                                  ;0096F9|60      |      ;
 
 
         DATA8_0096FA: db $00                               ;0096FA|        |      ;
 
         DATA8_0096FB: db $00,$02,$C8,$00,$00               ;0096FB|        |      ;
                       db $00,$00                           ;009700|        |      ;
                       LDY.B #$00                           ;009702|A000    |      ;
 
          CODE_009704: LDA.W DATA8_009730,Y                 ;009704|B93097  |009730;
                       CMP.B #$FF                           ;009707|C9FF    |      ;
                       BEQ CODE_00972A                      ;009709|F01F    |00972A;
                       CMP.B r_CurrRoomGroupStage           ;00970B|C532    |000032;
                       BNE CODE_009724                      ;00970D|D015    |009724;
                       LDA.W DATA8_009731,Y                 ;00970F|B93197  |009731;
                       CMP.B r_CurrRoomSectionBlock         ;009712|C533    |000033;
                       BNE CODE_009724                      ;009714|D00E    |009724;
                       LDA.W DATA8_009732,Y                 ;009716|B93297  |009732;
                       CMP.B r_CurrRoomIdx                  ;009719|C534    |000034;
                       BNE CODE_009724                      ;00971B|D007    |009724;
                       LDA.W DATA8_009733,Y                 ;00971D|B93397  |009733;
                       STA.B r_CurrentRoomEffect            ;009720|857D    |00007D;
                       SEC                                  ;009722|38      |      ;
                       RTS                                  ;009723|60      |      ;
 
 
          CODE_009724: INY                                  ;009724|C8      |      ;
                       INY                                  ;009725|C8      |      ;
                       INY                                  ;009726|C8      |      ;
                       INY                                  ;009727|C8      |      ;
                       BNE CODE_009704                      ;009728|D0DA    |009704;
 
          CODE_00972A: LDA.B #$00                           ;00972A|A900    |      ;
                       STA.B r_CurrentRoomEffect            ;00972C|857D    |00007D;
                       CLC                                  ;00972E|18      |      ;
                       RTS                                  ;00972F|60      |      ;
 
 
         DATA8_009730: db $02                               ;009730|        |      ;
 
         DATA8_009731: db $02                               ;009731|        |      ;
 
         DATA8_009732: db $01                               ;009732|        |      ;
 
         DATA8_009733: db $10,$02,$03,$01,$11               ;009733|        |      ;
 
                       db $0E,$00,$02,$12,$0E               ;009738|        |      ;
                       db $02,$00,$13,$02,$00               ;00973D|        |      ;
                       db $01,$20,$0C,$01,$01               ;009742|        |      ;
                       db $23,$05,$01,$00,$30               ;009747|        |      ;
 
                       db $0D,$03,$00,$31,$01               ;00974C|        |      ;
 
                       db $00,$00,$40,$01,$01               ;009751|        |      ;
                       db $00,$40,$01,$01,$01               ;009756|        |      ;
                       db $40,$01,$01,$02,$40               ;00975B|        |      ;
                       db $01,$02,$00,$40,$01               ;009760|        |      ;
                       db $02,$01,$40,$01,$03               ;009765|        |      ;
                       db $00,$40,$01,$03,$01               ;00976A|        |      ;
                       db $40,$01,$04,$00,$40               ;00976F|        |      ;
                       db $01,$04,$01,$40,$01               ;009774|        |      ;
                       db $04,$02,$40,$01,$05               ;009779|        |      ;
                       db $00,$40,$0E,$00,$01               ;00977E|        |      ;
                       db $40,$0D,$01,$00,$41               ;009783|        |      ;
                       db $0D,$01,$01,$41,$0D               ;009788|        |      ;
                       db $01,$02,$41,$06,$00               ;00978D|        |      ;
                       db $01,$32,$06,$00,$00               ;009792|        |      ;
                       db $33,$06,$01,$00,$34               ;009797|        |      ;
                       db $06,$02,$01,$35,$06               ;00979C|        |      ;
                       db $02,$00,$36,$06,$02               ;0097A1|        |      ;
                       db $02,$37,$08,$00,$00               ;0097A6|        |      ;
                       db $50,$08,$01,$00,$51               ;0097AB|        |      ;
                       db $08,$02,$00,$51,$05               ;0097B0|        |      ;
                       db $03,$00,$51,$09,$00               ;0097B5|        |      ;
                       db $00,$51,$0A,$01,$00               ;0097BA|        |      ;
                       db $51,$0A,$02,$00,$51               ;0097BF|        |      ;
                       db $0A,$03,$00,$51,$02               ;0097C4|        |      ;
                       db $01,$00,$51,$08,$00               ;0097C9|        |      ;
                       db $01,$60,$08,$03,$00               ;0097CE|        |      ;
                       db $71,$08,$04,$00,$71               ;0097D3|        |      ;
                       db $05,$03,$01,$80,$0C               ;0097D8|        |      ;
                       db $02,$00,$81,$FF                   ;0097DD|        |      ;
                       LDA.B r_CurrentRoomEffect            ;0097E1|A57D    |00007D;
                       AND.B #$0F                           ;0097E3|290F    |      ;
                       TAX                                  ;0097E5|AA      |      ;
                       LDY.W DATA8_0097FA,X                 ;0097E6|BCFA97  |0097FA;
                       LDX.B #$2E                           ;0097E9|A22E    |      ;
                       LDA.B r_CurrentRoomEffect            ;0097EB|A57D    |00007D;
                       CMP.B #$31                           ;0097ED|C931    |      ;
                       BNE CODE_0097F5                      ;0097EF|D004    |0097F5;
                       LDA.B #$24                           ;0097F1|A924    |      ;
                       BNE DATA8_0097F7                     ;0097F3|D002    |0097F7;
 
          CODE_0097F5: LDA.B #$13                           ;0097F5|A913    |      ;
 
         DATA8_0097F7: db $4C                               ;0097F7|        |      ;
 
                       dw UNREACH_0FE5BF                    ;0097F8|        |0FE5BF;
 
         DATA8_0097FA: db $7E,$5E,$AE,$AE,$AE               ;0097FA|        |      ;
                       db $AE,$AE                           ;0097FF|        |      ;
 
                       LDX.W r_PlayerDirectionBackup        ;009801|AEA000  |0000A0;
 
                       TYA                                  ;009804|98      |      ;
 
          CODE_009805: STA.W r_FogParallelPos,Y             ;009805|998207  |000782;
                       INY                                  ;009808|C8      |      ;
                       CPY.B #$40                           ;009809|C040    |      ;
                       BNE CODE_009805                      ;00980B|D0F8    |009805;
                       LDA.B r_CurrentRoomEffect            ;00980D|A57D    |00007D;
                       AND.B #$0F                           ;00980F|290F    |      ;
                       TAX                                  ;009811|AA      |      ;
                       LDY.W DATA8_00981C,X                 ;009812|BC1C98  |00981C;
                       LDX.B #$2E                           ;009815|A22E    |      ;
                       LDA.B #$02                           ;009817|A902    |      ;
                       db $4C                               ;009819|        |      ;
 
                       dw UNREACH_0FE5BF                    ;00981A|        |0FE5BF;
 
         DATA8_00981C: db $3F,$7F,$30                       ;00981C|        |      ;
                       LDY.B #$86                           ;00981F|A086    |      ;
                       LDA.B (r_ChrBankBG_0800),Y           ;009821|B14C    |00004C;
                       PLD                                  ;009823|2B      |      ;
                       TYA                                  ;009824|98      |      ;
 
          CODE_009825: PHA                                  ;009825|48      |      ;
                       LDA.B #$80                           ;009826|A980    |      ;
                       STA.B r_StaticLayoutBank             ;009828|85B1    |0000B1;
                       PLA                                  ;00982A|68      |      ;
                       JSR.W CODE_00985E                    ;00982B|205E98  |00985E;
 
          CODE_00982E: LDA.B #$01                           ;00982E|A901    |      ;
 
                       db $20                               ;009830|        |      ;
                       dw CODE_0FED14                       ;009831|        |0FED14;
                       db $20                               ;009833|        |      ;
                       dw alsoBank_00Load                   ;009834|        |0FED03;
                       db $20                               ;009836|        |      ;
                       dw CODE_0FED16                       ;009837|        |0FED16;
 
                       INY                                  ;009839|C8      |      ;
                       db $20                               ;00983A|        |      ;
                       dw alsoBank_00Load                   ;00983B|        |0FED03;
                       db $20                               ;00983D|        |      ;
                       dw CODE_0FED16                       ;00983E|        |0FED16;
                       INY                                  ;009840|C8      |      ;
 
         DATA8_009841: db $20                               ;009841|        |      ;
                       dw alsoBank_00Load                   ;009842|        |0FED03;
                       INY                                  ;009844|C8      |      ;
                       CMP.B #$FF                           ;009845|C9FF    |      ;
                       BNE CODE_00984C                      ;009847|D003    |00984C;
                       db $4C                               ;009849|        |      ;
 
                       dw CODE_0FED12                       ;00984A|        |0FED12;
 
          CODE_00984C: CMP.B #$FE                           ;00984C|C9FE    |      ;
                       BEQ DATA8_009858                     ;00984E|F008    |009858;
                       AND.B $02                            ;009850|2502    |000002;
                       db $20                               ;009852|        |      ;
                       dw CODE_0FED16                       ;009853|        |0FED16;
                       JMP.W DATA8_009841                   ;009855|4C4198  |009841;
 
 
         DATA8_009858: db $20                               ;009858|        |      ;
                       dw CODE_0FED12                       ;009859|        |0FED12;
                       JMP.W CODE_00982E                    ;00985B|4C2E98  |00982E;
 
 
          CODE_00985E: ASL A                                ;00985E|0A      |      ;
                       TAY                                  ;00985F|A8      |      ;
                       LDA.W group_layout,Y                 ;009860|B9E498  |0098E4;
                       STA.B $00                            ;009863|8500    |000000;
                       LDA.W PTR16_0098E5,Y                 ;009865|B9E598  |0098E5;
                       STA.B $01                            ;009868|8501    |000001;
                       LDA.B #$FF                           ;00986A|A9FF    |      ;
                       ADC.B #$00                           ;00986C|6900    |      ;
                       STA.B $02                            ;00986E|8502    |000002;
                       LDY.B #$00                           ;009870|A000    |      ;
                       RTS                                  ;009872|60      |      ;
 
 
          CODE_009873: STX.B r_StaticLayoutBank             ;009873|86B1    |0000B1;
 
                       JSR.W CODE_00985E                    ;009875|205E98  |00985E;
 
          CODE_009878: LDA.B #$01                           ;009878|A901    |      ;
                       db $20                               ;00987A|        |      ;
                       dw CODE_0FED14                       ;00987B|        |0FED14;
                       LDA.W $0790                          ;00987D|AD9007  |000790;
                       db $20                               ;009880|        |      ;
                       dw CODE_0FED16                       ;009881|        |0FED16;
                       LDA.W $0791                          ;009883|AD9107  |000791;
                       db $20                               ;009886|        |      ;
                       dw CODE_0FED16                       ;009887|        |0FED16;
 
         DATA8_009889: db $20                               ;009889|        |      ;
                       dw alsoBank_00Load                   ;00988A|        |0FED03;
                       INY                                  ;00988C|C8      |      ;
                       CMP.B #$FF                           ;00988D|C9FF    |      ;
                       BEQ DATA8_0098A6                     ;00988F|F015    |0098A6;
                       CMP.B #$FE                           ;009891|C9FE    |      ;
 
                       BEQ DATA8_00989D                     ;009893|F008    |00989D;
 
                       AND.B $02                            ;009895|2502    |000002;
 
                       db $20                               ;009897|        |      ;
 
                       dw CODE_0FED16                       ;009898|        |0FED16;
 
                       JMP.W DATA8_009889                   ;00989A|4C8998  |009889;
 
 
         DATA8_00989D: db $20                               ;00989D|        |      ;
                       dw CODE_0FED12                       ;00989E|        |0FED12;
                       JSR.W CODE_0098A9                    ;0098A0|20A998  |0098A9;
 
                       JMP.W CODE_009878                    ;0098A3|4C7898  |009878;
 
 
         DATA8_0098A6: db $20                               ;0098A6|        |      ;
 
                       dw CODE_0FED12                       ;0098A7|        |0FED12;
 
          CODE_0098A9: CLC                                  ;0098A9|18      |      ;
                       LDA.W $0790                          ;0098AA|AD9007  |000790;
                       ADC.B #$40                           ;0098AD|6940    |      ;
                       STA.W $0790                          ;0098AF|8D9007  |000790;
                       LDA.W $0791                          ;0098B2|AD9107  |000791;
                       ADC.B #$00                           ;0098B5|6900    |      ;
                       STA.W $0791                          ;0098B7|8D9107  |000791;
                       AND.B #$08                           ;0098BA|2908    |      ;
                       BNE CODE_0098DC                      ;0098BC|D01E    |0098DC;
                       LDA.W $0791                          ;0098BE|AD9107  |000791;
                       CMP.B #$23                           ;0098C1|C923    |      ;
                       BCC CODE_0098E3                      ;0098C3|901E    |0098E3;
 
          CODE_0098C5: LDA.W $0790                          ;0098C5|AD9007  |000790;
                       CMP.B #$C0                           ;0098C8|C9C0    |      ;
                       BCC CODE_0098E3                      ;0098CA|9017    |0098E3;
                       LDA.W $0791                          ;0098CC|AD9107  |000791;
                       EOR.B #$0B                           ;0098CF|490B    |      ;
                       STA.W $0791                          ;0098D1|8D9107  |000791;
                       LDA.W $0790                          ;0098D4|AD9007  |000790;
                       AND.B #$2D                           ;0098D7|292D    |      ;
                       STA.W $0790                          ;0098D9|8D9007  |000790;
 
          CODE_0098DC: LDA.W $0791                          ;0098DC|AD9107  |000791;
                       CMP.B #$2B                           ;0098DF|C92B    |      ;
                       BCS CODE_0098C5                      ;0098E1|B0E2    |0098C5;
 
          CODE_0098E3: RTS                                  ;0098E3|60      |      ;
 
 
         group_layout: dw PAL_00                            ;0098E4|        |009B43;
                       dw PAL_01                            ;0098E6|        |009B33;
                       dw PAL_01                            ;0098E8|        |009B33;
                       dw PAL_02                            ;0098EA|        |009B58;
                       dw PAL_03                            ;0098EC|        |009BAA;
                       dw PAL_04                            ;0098EE|        |009B87;
                       dw PAL_05                            ;0098F0|        |009B25;
                       dw PAL_06                            ;0098F2|        |009B2C;
                       dw PAL_08                            ;0098F4|        |009B7A;
                       dw PAL_09                            ;0098F6|        |008766;
                       dw PAL_sprite_trevor                 ;0098F8|        |008982;
 
                       dw PAL_sprite_sympha                 ;0098FA|        |0089A8;
                       dw PAL_sprite_grant                  ;0098FC|        |008995;
                       dw PAL_sprite_alucart                ;0098FE|        |0089BB;
                       dw PAL_0e                            ;009900|        |0099B4;
                       dw PAL_0f                            ;009902|        |0099FE;
                       dw PAL_10                            ;009904|        |009A1C;
                       dw PAL_11                            ;009906|        |009A0D;
                       dw PAL_12                            ;009908|        |009A2B;
                       dw PAL_13                            ;00990A|        |009BC3;
                       dw PAL_13                            ;00990C|        |009BC3;
                       dw PAL_15                            ;00990E|        |009BD6;
                       dw PAL_16                            ;009910|        |009BE9;
                       dw PAL_17                            ;009912|        |009BFC;
                       dw PAL_18                            ;009914|        |009BB0;
                       dw PAL_19                            ;009916|        |009C11;
                       dw PAL_1a                            ;009918|        |009C24;
                       dw PAL_1b                            ;00991A|        |009C37;
                       dw PAL_1c                            ;00991C|        |009C4A;
                       dw PAL_1d                            ;00991E|        |009C5D;
                       dw PAL_1e                            ;009920|        |009C70;
                       dw PAL_1f                            ;009922|        |009C93;
                       dw PAL_20                            ;009924|        |009A99;
                       dw PAL_21                            ;009926|        |009D74;
                       dw PAL_21                            ;009928|        |009D74;
                       dw PAL_23                            ;00992A|        |009D8F;
                       dw PAL_21                            ;00992C|        |009D74;
                       dw PAL_21                            ;00992E|        |009D74;
                       dw PAL_26                            ;009930|        |009B4D;
                       dw PAL_27                            ;009932|        |009B64;
                       dw PAL_28                            ;009934|        |009B6F;
                       dw $07A0                             ;009936|        |      ;
                       dw PAL_2a                            ;009938|        |009CB6;
                       dw PAL_2b                            ;00993A|        |009CC9;
                       dw PAL_2c                            ;00993C|        |009CEF;
                       dw PAL_2d                            ;00993E|        |009CDC;
                       dw PAL_2e                            ;009940|        |009D02;
                       dw PAL_2f                            ;009942|        |009D15;
 
                       dw PAL_30                            ;009944|        |009D3B;
                       dw PAL_31                            ;009946|        |009D28;
                       dw $BBEF,$BC16,$BC31                 ;009948|        |      ;
                       dw $BC50,$BC84,$BCB6                 ;00994E|        |      ;
                       dw $BCFF,$BAC0,$BAEF                 ;009954|        |      ;
                       dw $BB0D,$BB29,$BB4B                 ;00995A|        |      ;
                       dw $BB6B,$BB8C,$BBAE                 ;009960|        |      ;
                       dw $BBCE,$BBE8,$BBF7                 ;009966|        |      ;
                       dw $BC10,$BC2E,$BC4E                 ;00996C|        |      ;
                       dw $9B13,$9AAC,$9AE6                 ;009972|        |      ;
                       dw $9A60,$9A73,$9A86                 ;009978|        |      ;
                       dw $BC6C,$BC6C,$BC77                 ;00997E|        |      ;
                       dw $BC95,$BCB0,$BCCF                 ;009984|        |      ;
                       dw $BCEC,$BDC0,$BD17                 ;00998A|        |      ;
                       dw $BD38,$BD52,$BD6F                 ;009990|        |      ;
                       dw $BD8E,$BDA6,$BDB1                 ;009996|        |      ;
                       dw $BDD5,$9A4D,$9D4E                 ;00999C|        |      ;
                       dw $9A3A,$BB29,$BB4B                 ;0099A2|        |      ;
                       dw $9D61,$BCB6,$BCFF                 ;0099A8|        |      ;
 
                       dw $BD2E,$BD5C,$A285                 ;0099AE|        |      ;
 
               PAL_0e: db $40,$20,$62,$52,$5E               ;0099B4|        |      ;
                       db $61,$54,$4D,$FE,$4D               ;0099B9|        |      ;
                       db $20,$63,$58,$5C,$54               ;0099BE|        |      ;
                       db $FE,$57,$20,$51,$5B               ;0099C3|        |      ;
                       db $5A,$00,$00,$4D,$41               ;0099C8|        |      ;
                       db $FE,$60,$20,$5F,$5B               ;0099CD|        |      ;
                       db $50,$68,$54,$61,$FE               ;0099D2|        |      ;
                       db $80,$20,$54,$5D,$54               ;0099D7|        |      ;
                       db $5C,$68,$FE,$75,$20               ;0099DC|        |      ;
                       db $91,$4C,$FE,$95,$20               ;0099E1|        |      ;
                       db $5F,$4C,$FE,$70,$20               ;0099E6|        |      ;
                       db $80,$81,$81,$82,$FE               ;0099EB|        |      ;
                       db $90,$20,$90,$00,$00               ;0099F0|        |      ;
                       db $92,$FE,$B0,$20,$A0               ;0099F5|        |      ;
                       db $A1,$A1,$A2,$FF                   ;0099FA|        |      ;
 
               PAL_0f: db $7D,$20,$88,$89,$FE               ;0099FE|        |      ;
                       db $9D,$20,$98,$99,$FE               ;009A03|        |      ;
                       db $BD,$20,$A8,$A9,$FF               ;009A08|        |      ;
 
               PAL_11: db $7D,$20,$8A,$8B,$FE               ;009A0D|        |      ;
                       db $9D,$20,$9A,$9B,$FE               ;009A12|        |      ;
                       db $BD,$20,$AA,$AB,$FF               ;009A17|        |      ;
 
               PAL_10: db $7D,$20,$8C,$8D,$FE               ;009A1C|        |      ;
                       db $9D,$20,$9C,$9D,$FE               ;009A21|        |      ;
                       db $BD,$20,$AC,$AD,$FF               ;009A26|        |      ;
 
               PAL_12: db $7D,$20,$8E,$8F,$FE               ;009A2B|        |      ;
                       db $9D,$20,$9E,$9F,$FE               ;009A30|        |      ;
                       db $BD,$20,$AE,$AF,$FF               ;009A35|        |      ;
                       db $00,$3F,$0F,$16,$26               ;009A3A|        |      ;
                       db $20,$0F,$00,$04,$10               ;009A3F|        |      ;
                       db $0F,$02,$14,$27,$0F               ;009A44|        |      ;
                       db $02,$04,$14,$FF,$00               ;009A49|        |      ;
                       db $3F,$0F,$16,$26,$20               ;009A4E|        |      ;
                       db $0F,$16,$27,$10,$0F               ;009A53|        |      ;
                       db $07,$0F,$0F,$0F,$07               ;009A58|        |      ;
                       db $0F,$27,$FF,$00,$3F               ;009A5D|        |      ;
                       db $0F,$16,$26,$20,$0F               ;009A62|        |      ;
                       db $07,$17,$27,$0F,$07               ;009A67|        |      ;
                       db $0F,$0F,$0F,$07,$0F               ;009A6C|        |      ;
                       db $27,$FF,$00,$3F,$0F               ;009A71|        |      ;
 
                       db $16,$26,$20,$0F,$07               ;009A76|        |      ;
                       db $27,$37,$0F,$07,$0F               ;009A7B|        |      ;
                       db $11,$0F,$07,$11,$27               ;009A80|        |      ;
                       db $FF,$00,$3F,$0F,$16               ;009A85|        |      ;
                       db $26,$20,$0F,$17,$27               ;009A8A|        |      ;
                       db $37,$0F,$17,$21,$31               ;009A8F|        |      ;
                       db $0F,$07,$31,$37,$FF               ;009A94|        |      ;
 
               PAL_20: db $00,$3F,$0F,$16,$26               ;009A99|        |      ;
                       db $20,$0F,$22,$12,$20               ;009A9E|        |      ;
                       db $0F,$22,$0F,$0F,$0F               ;009AA3|        |      ;
                       db $22,$0F,$20,$FF,$0F               ;009AA8|        |      ;
                       db $25,$4E,$7D,$7D,$4F               ;009AAD|        |      ;
                       db $FE,$2E,$25,$5E,$78               ;009AB2|        |      ;
                       db $78,$78,$78,$5F,$FE               ;009AB7|        |      ;
                       db $4E,$25,$6E,$7E,$78               ;009ABC|        |      ;
                       db $78,$7F,$6F,$FE,$6D               ;009AC1|        |      ;
                       db $25,$40,$41,$42,$43               ;009AC6|        |      ;
                       db $44,$45,$46,$47,$FE               ;009ACB|        |      ;
                       db $8D,$25,$50,$51,$52               ;009AD0|        |      ;
                       db $53,$54,$55,$56,$57               ;009AD5|        |      ;
                       db $FE,$AD,$25,$60,$61               ;009ADA|        |      ;
                       db $62,$63,$64,$65,$66               ;009ADF|        |      ;
                       db $67,$FF,$CD,$25,$70               ;009AE4|        |      ;
                       db $71,$72,$73,$74,$75               ;009AE9|        |      ;
                       db $76,$77,$FE,$EE,$25               ;009AEE|        |      ;
                       db $48,$49,$4A,$4B,$4C               ;009AF3|        |      ;
                       db $4D,$FE,$0E,$26,$58               ;009AF8|        |      ;
                       db $59,$5A,$5B,$5C,$5D               ;009AFD|        |      ;
                       db $FE,$2E,$26,$68,$69               ;009B02|        |      ;
                       db $6A,$6B,$6C,$6D,$FE               ;009B07|        |      ;
                       db $4F,$26,$79,$7A,$7B               ;009B0C|        |      ;
                       db $7C,$FF,$D3,$27,$55               ;009B11|        |      ;
                       db $55,$55,$FE,$DB,$27               ;009B16|        |      ;
                       db $59,$7B,$55,$FE,$E3               ;009B1B|        |      ;
                       db $27,$55,$55,$55,$FF               ;009B20|        |      ;
 
               PAL_05: db $0E,$22,$47,$41,$4D               ;009B25|        |      ;
                       db $45,$FF                           ;009B2A|        |      ;
 
               PAL_06: db $0E,$22,$44,$45,$4D               ;009B2C|        |      ;
                       db $4F,$FF                           ;009B31|        |      ;
 
               PAL_01: db $CA,$22,$21,$00,$5A               ;009B33|        |      ;
                       db $5E,$5D,$50,$5C,$58               ;009B38|        |      ;
                       db $00,$42,$4A,$4A,$41               ;009B3D|        |      ;
                       db $FF                               ;009B42|        |      ;
 
               PAL_00: db $27,$23,$1E,$1F,$14               ;009B43|        |      ;
                       db $1D,$18,$1D,$16,$FF               ;009B48|        |      ;
 
               PAL_26: db $32,$23,$1F,$10,$22               ;009B4D|        |      ;
                       db $22,$26,$1E,$21,$13               ;009B52|        |      ;
                       db $FF                               ;009B57|        |      ;
 
               PAL_02: db $EC,$21,$56,$50,$5C               ;009B58|        |      ;
                       db $54,$00,$5E,$65,$54               ;009B5D|        |      ;
                       db $61,$FF                           ;009B62|        |      ;
 
               PAL_27: db $8C,$22,$52,$5E,$5D               ;009B64|        |      ;
 
                       db $63,$58,$5D,$64,$54               ;009B69|        |      ;
                       db $FF                               ;009B6E|        |      ;
 
               PAL_28: db $EC,$22,$5F,$50,$62               ;009B6F|        |      ;
                       db $62,$66,$5E,$61,$53               ;009B74|        |      ;
                       db $FF                               ;009B79|        |      ;
 
               PAL_08: db $CD,$22,$56,$50,$5C               ;009B7A|        |      ;
                       db $54,$00,$62,$63,$50               ;009B7F|        |      ;
                       db $61,$63,$FF                       ;009B84|        |      ;
 
               PAL_04: db $00,$3F,$0F,$16,$05               ;009B87|        |      ;
                       db $20,$0F,$13,$02,$20               ;009B8C|        |      ;
                       db $0F,$14,$03,$3B,$0F               ;009B91|        |      ;
                       db $16,$27,$10,$0F,$0C               ;009B96|        |      ;
 
                       db $26,$30,$0F,$0C,$2C               ;009B9B|        |      ;
                       db $30,$0F,$12,$26,$30               ;009BA0|        |      ;
                       db $0F,$06,$30,$30,$FE               ;009BA5|        |      ;
 
               PAL_03: db $00,$3F,$FE,$00,$00               ;009BAA|        |      ;
                       db $FF                               ;009BAF|        |      ;
 
               PAL_18: db $00,$3F,$0F,$07,$17               ;009BB0|        |      ;
                       db $20,$0F                           ;009BB5|        |      ;
 
         DATA8_009BB7: db $07,$17,$20,$0F,$01               ;009BB7|        |      ;
                       db $09,$08,$0F,$01,$0B               ;009BBC|        |      ;
                       db $10,$FF                           ;009BC1|        |      ;
 
               PAL_13: db $00,$3F,$0F,$07,$17               ;009BC3|        |      ;
                       db $20,$0F,$01,$12,$20               ;009BC8|        |      ;
                       db $0F,$01,$09,$08,$0F               ;009BCD|        |      ;
                       db $01,$0B,$10,$FF                   ;009BD2|        |      ;
 
               PAL_15: db $00,$3F,$0F,$07,$17               ;009BD6|        |      ;
 
                       db $20,$0F,$01,$21,$31               ;009BDB|        |      ;
                       db $0F,$01,$08,$28,$0F               ;009BE0|        |      ;
                       db $08,$18,$17,$FF                   ;009BE5|        |      ;
 
               PAL_16: db $00,$3F,$0F,$07,$17               ;009BE9|        |      ;
                       db $20,$0F,$06,$0B,$10               ;009BEE|        |      ;
                       db $0F,$01,$03,$10,$0F               ;009BF3|        |      ;
                       db $01,$1B,$3C,$FF                   ;009BF8|        |      ;
 
               PAL_17: db $2C,$21,$38,$39,$3A               ;009BFC|        |      ;
                       db $FE,$4C,$21,$55,$56               ;009C01|        |      ;
                       db $FE,$6C,$21,$75,$76               ;009C06|        |      ;
 
                       db $B1,$FE,$8D,$21,$87               ;009C0B|        |      ;
                       db $FF                               ;009C10|        |      ;
 
               PAL_19: db $00,$3F,$0F,$16,$26               ;009C11|        |      ;
                       db $20,$0F,$0B,$1B,$01               ;009C16|        |      ;
                       db $0F,$01,$11,$20,$0F               ;009C1B|        |      ;
                       db $31,$11,$21,$FF                   ;009C20|        |      ;
 
               PAL_1a: db $00,$3F,$0F,$16,$26               ;009C24|        |      ;
                       db $20,$0F,$0B,$1B,$01               ;009C29|        |      ;
                       db $0F,$11,$11,$31,$0F               ;009C2E|        |      ;
                       db $31,$11,$21,$FF                   ;009C33|        |      ;
 
               PAL_1b: db $00,$3F,$0F,$16,$26               ;009C37|        |      ;
                       db $20,$0F,$0B,$1B,$01               ;009C3C|        |      ;
 
                       db $0F,$21,$11,$21,$0F               ;009C41|        |      ;
                       db $31,$11,$21,$FF                   ;009C46|        |      ;
 
               PAL_1c: db $00,$3F,$0F,$16,$26               ;009C4A|        |      ;
 
                       db $20,$0F,$0B,$1B,$01               ;009C4F|        |      ;
                       db $0F,$31,$11,$21,$0F               ;009C54|        |      ;
                       db $31,$11,$21,$FF                   ;009C59|        |      ;
 
               PAL_1d: db $00,$3F,$0F,$06,$16               ;009C5D|        |      ;
                       db $20,$0F,$0F,$00,$0A               ;009C62|        |      ;
 
                       db $0F,$0F,$0B,$2C,$0F               ;009C67|        |      ;
                       db $00,$2B,$3C,$FF                   ;009C6C|        |      ;
 
               PAL_1e: db $00,$3F,$0F,$08,$18               ;009C70|        |      ;
                       db $38,$0F,$09,$0C,$2C               ;009C75|        |      ;
                       db $0F,$09,$00,$10,$0F               ;009C7A|        |      ;
                       db $09,$13,$10,$0F,$0F               ;009C7F|        |      ;
                       db $10,$20,$0F,$0F,$21               ;009C84|        |      ;
                       db $38,$0F,$0F,$0F,$0F               ;009C89|        |      ;
                       db $0F,$0F,$16,$25,$FF               ;009C8E|        |      ;
 
               PAL_1f: db $00,$3F,$0F,$16,$26               ;009C93|        |      ;
                       db $20,$0F,$00,$10,$1A               ;009C98|        |      ;
                       db $0F,$00,$0B,$2C,$0F               ;009C9D|        |      ;
                       db $02,$00,$10,$0F,$08               ;009CA2|        |      ;
                       db $26,$37,$0F,$0F,$22               ;009CA7|        |      ;
                       db $34,$0F,$0F,$0F,$0F               ;009CAC|        |      ;
                       db $0F,$0F,$16,$25,$FF               ;009CB1|        |      ;
 
               PAL_2a: db $00,$3F,$0F,$0F,$26               ;009CB6|        |      ;
 
                       db $16,$0F,$0F,$07,$27               ;009CBB|        |      ;
                       db $0F,$0F,$02,$23,$0F               ;009CC0|        |      ;
                       db $0F,$19,$39,$FF                   ;009CC5|        |      ;
 
               PAL_2b: db $10,$3F,$38,$08,$27               ;009CC9|        |      ;
 
                       db $38,$38,$0F,$0C,$33               ;009CCE|        |      ;
                       db $38,$21,$11,$20,$38               ;009CD3|        |      ;
                       db $08,$18,$28,$FF                   ;009CD8|        |      ;
 
               PAL_2d: db $10,$3F,$38,$08,$27               ;009CDC|        |      ;
                       db $38,$38,$0F,$0C,$33               ;009CE1|        |      ;
                       db $38,$0F,$15,$36,$38               ;009CE6|        |      ;
                       db $08,$18,$28,$FF                   ;009CEB|        |      ;
 
               PAL_2c: db $10,$3F,$38,$08,$27               ;009CEF|        |      ;
                       db $38,$38,$0F,$0C,$33               ;009CF4|        |      ;
                       db $38,$08,$15,$38,$38               ;009CF9|        |      ;
                       db $08,$18,$28,$FF                   ;009CFE|        |      ;
 
               PAL_2e: db $00,$3F,$0F,$0F,$0F               ;009D02|        |      ;
                       db $20,$0F,$0F,$0F,$0F               ;009D07|        |      ;
 
                       db $0F,$0F,$0F,$0F,$0F               ;009D0C|        |      ;
                       db $0F,$0F,$0F,$FF                   ;009D11|        |      ;
 
               PAL_2f: db $10,$3F,$0F,$08,$27               ;009D15|        |      ;
                       db $38,$0F,$0F,$0C,$33               ;009D1A|        |      ;
                       db $0F,$21,$11,$20,$0F               ;009D1F|        |      ;
                       db $08,$18,$28,$FF                   ;009D24|        |      ;
 
               PAL_31: db $10,$3F,$0F,$08,$27               ;009D28|        |      ;
                       db $38,$0F,$0F,$0C,$33               ;009D2D|        |      ;
                       db $0F,$0F,$15,$36,$0F               ;009D32|        |      ;
                       db $08,$18,$28,$FF                   ;009D37|        |      ;
 
               PAL_30: db $10,$3F,$0F,$08,$27               ;009D3B|        |      ;
                       db $38,$0F,$0F,$0C,$33               ;009D40|        |      ;
                       db $0F,$08,$15,$38,$0F               ;009D45|        |      ;
                       db $08,$18,$28,$FF,$00               ;009D4A|        |      ;
                       db $3F,$0F,$16,$05,$20               ;009D4F|        |      ;
                       db $0F,$13,$02,$20,$0F               ;009D54|        |      ;
                       db $14,$03,$3B,$0F,$0F               ;009D59|        |      ;
                       db $0F,$0F,$FF,$00,$3F               ;009D5E|        |      ;
                       db $0F,$0F,$0F,$0F,$0F               ;009D63|        |      ;
                       db $10,$05,$01,$0F,$0F               ;009D68|        |      ;
                       db $0F,$0F,$0F,$0F,$0F               ;009D6D|        |      ;
                       db $0F,$FF                           ;009D72|        |      ;
 
               PAL_21: db $2A,$22,$5D,$5E,$63               ;009D74|        |      ;
                       db $00,$52,$5E,$5C,$5F               ;009D79|        |      ;
                       db $5B,$54,$63,$54,$FE               ;009D7E|        |      ;
                       db $4B,$22,$63,$61,$68               ;009D83|        |      ;
                       db $00,$50,$56,$50,$58               ;009D88|        |      ;
                       db $5D,$FF                           ;009D8D|        |      ;
 
               PAL_23: db $08,$22,$86,$A4,$A4               ;009D8F|        |      ;
                       db $A4,$A4,$A4,$A4,$A4               ;009D94|        |      ;
                       db $A4,$A4,$A4,$A4,$A4               ;009D99|        |      ;
                       db $A4,$A4,$87,$FE,$28               ;009D9E|        |      ;
                       db $22,$96,$00,$00,$00               ;009DA3|        |      ;
                       db $00,$00,$00,$00,$00               ;009DA8|        |      ;
                       db $00,$00,$00,$00,$00               ;009DAD|        |      ;
                       db $00,$97,$FE,$48,$22               ;009DB2|        |      ;
                       db $96,$00,$00,$00,$00               ;009DB7|        |      ;
 
                       db $00,$00,$00,$00,$00               ;009DBC|        |      ;
                       db $00,$00,$00,$00,$00               ;009DC1|        |      ;
                       db $97,$FE,$68,$22,$A6               ;009DC6|        |      ;
                       db $A5,$A5,$A5,$A5,$A5               ;009DCB|        |      ;
                       db $A5,$A5,$A5,$A5,$A5               ;009DD0|        |      ;
                       db $A5,$A5,$A5,$A5,$A7               ;009DD5|        |      ;
                       db $FF,$A5,$6B,$20,$6D               ;009DDA|        |      ;
                       db $E8,$FA,$9D,$51,$9E               ;009DDF|        |      ;
                       db $88,$9E,$C5,$9E,$FF               ;009DE4|        |      ;
                       db $9E,$19,$9F,$50,$9F               ;009DE9|        |      ;
                       db $91,$9F,$AC,$9F,$F0               ;009DEE|        |      ;
                       db $9F,$08,$A0,$28,$A0               ;009DF3|        |      ;
                       db $50,$A0,$A9,$B0,$85               ;009DF8|        |      ;
                       db $FF,$A9,$00,$85,$31               ;009DFD|        |      ;
                       db $AA                               ;009E02|        |      ;
 
          CODE_009E03: STA.W r_BoneDragonKingRipsBossGeneral,X;009E03|9DEC07  |0007EC;
                       INX                                  ;009E06|E8      |      ;
                       CPX.B #$08                           ;009E07|E008    |      ;
                       BNE CODE_009E03                      ;009E09|D0F8    |009E03;
                       db $20                               ;009E0B|        |      ;
                       dw UNREACH_0FE795                    ;009E0C|        |0FE795;
                       LDA.B #$01                           ;009E0E|A901    |      ;
                       STA.B r_CinematicsControllerBossDefeated;009E10|852C    |00002C;
                       db $20                               ;009E12|        |      ;
                       dw UNREACH_0FE666                    ;009E13|        |0FE666;
                       JSR.W CODE_00A2B4                    ;009E15|20B4A2  |00A2B4;
                       db $20                               ;009E18|        |      ;
                       dw initSound                         ;009E19|        |0FE227;
                       LDA.B #$44                           ;009E1B|A944    |      ;
                       STA.W $5105                          ;009E1D|8D0551  |005105;
                       db $20                               ;009E20|        |      ;
                       dw setNameTableMapping_E4            ;009E21|        |0FEBFD;
                       JSR.W CODE_00A247                    ;009E23|2047A2  |00A247;
 
                       LDY.B r_MapTransitionCheckpoint      ;009E26|A4A4    |0000A4;
                       LDA.W DATA8_00A48B,Y                 ;009E28|B98BA4  |00A48B;
                       STA.W $07ED                          ;009E2B|8DED07  |0007ED;
                       AND.B #$1F                           ;009E2E|291F    |      ;
                       STA.W $07F1                          ;009E30|8DF107  |0007F1;
                       LDA.W DATA8_00A49C,Y                 ;009E33|B99CA4  |00A49C;
                       STA.W $07EE                          ;009E36|8DEE07  |0007EE;
                       JSR.W CODE_00A1D2                    ;009E39|20D2A1  |00A1D2;
                       JSR.W CODE_00A278                    ;009E3C|2078A2  |00A278;
                       JSR.W DATA16_00A172                  ;009E3F|2072A1  |00A172;
                       JSR.W CODE_00A06D                    ;009E42|206DA0  |00A06D;
                       LDA.B #$04                           ;009E45|A904    |      ;
                       STA.B r_CounterUntilCanShowSprBg     ;009E47|851C    |00001C;
 
          CODE_009E49: INC.B r_MenuOptionIdxSelected        ;009E49|E66B    |00006B;
                       LDA.B #$00                           ;009E4B|A900    |      ;
                       STA.W $07F3                          ;009E4D|8DF307  |0007F3;
                       RTS                                  ;009E50|60      |      ;
 
 
                       LDA.W $07ED                          ;009E51|ADED07  |0007ED;
                       AND.B #$80                           ;009E54|2980    |      ;
                       BEQ CODE_009E6F                      ;009E56|F017    |009E6F;
 
                       LDY.B #$00                           ;009E58|A000    |      ;
                       STY.B $31                            ;009E5A|8431    |000031;
                       LDA.W $07F1                          ;009E5C|ADF107  |0007F1;
                       CMP.B #$02                           ;009E5F|C902    |      ;
                       BEQ CODE_009E65                      ;009E61|F002    |009E65;
                       LDY.B #$09                           ;009E63|A009    |      ;
 
          CODE_009E65: STY.W $07EF                          ;009E65|8CEF07  |0007EF;
                       LDA.B #$00                           ;009E68|A900    |      ;
                       STA.B r_GenericStateTimer            ;009E6A|8530    |000030;
                       JMP.W CODE_009E49                    ;009E6C|4C499E  |009E49;
 
 
          CODE_009E6F: JSR.W CODE_009E49                    ;009E6F|20499E  |009E49;
                       LDA.B #$03                           ;009E72|A903    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009E74|856B    |00006B;
                       LDA.B #$40                           ;009E76|A940    |      ;
                       STA.B r_GenericStateTimer            ;009E78|8530    |000030;
                       RTS                                  ;009E7A|60      |      ;
 
 
          CODE_009E7B: LDA.B r_PPUCtrl                      ;009E7B|A5FF    |0000FF;
                       AND.B #$FC                           ;009E7D|29FC    |      ;
                       STA.B r_PPUCtrl                      ;009E7F|85FF    |0000FF;
                       LDA.B #$00                           ;009E81|A900    |      ;
                       STA.B r_ScrollX                      ;009E83|85FD    |0000FD;
                       JMP.W CODE_009E49                    ;009E85|4C499E  |009E49;
 
                       LDY.B $31                            ;009E88|A431    |000031;
                       BNE CODE_009EB6                      ;009E8A|D02A    |009EB6;
                       DEC.B r_GenericStateTimer            ;009E8C|C630    |000030;
                       BEQ CODE_009E7B                      ;009E8E|F0EB    |009E7B;
                       JSR.W DATA8_00A1FA                   ;009E90|20FAA1  |00A1FA;
                       LDA.B r_GenericStateTimer            ;009E93|A530    |000030;
                       CMP.B #$A0                           ;009E95|C9A0    |      ;
                       BCS CODE_009EB5                      ;009E97|B01C    |009EB5;
                       AND.B #$0F                           ;009E99|290F    |      ;
                       BNE CODE_009EB5                      ;009E9B|D018    |009EB5;
 
                       LDA.W $07EF                          ;009E9D|ADEF07  |0007EF;
                       JSR.W CODE_00A55F                    ;009EA0|205FA5  |00A55F;
                       INC.W $07EF                          ;009EA3|EEEF07  |0007EF;
                       LDA.W $07EF                          ;009EA6|ADEF07  |0007EF;
                       CMP.B #$09                           ;009EA9|C909    |      ;
                       BCC CODE_009EB5                      ;009EAB|9008    |009EB5;
                       BEQ CODE_009EBE                      ;009EAD|F00F    |009EBE;
                       CMP.B #$12                           ;009EAF|C912    |      ;
                       BCC CODE_009EB5                      ;009EB1|9002    |009EB5;
                       INC.B $31                            ;009EB3|E631    |000031;
 
          CODE_009EB5: RTS                                  ;009EB5|60      |      ;
 
 
          CODE_009EB6: INC.B $31                            ;009EB6|E631    |000031;
                       LDA.B $31                            ;009EB8|A531    |000031;
                       CMP.B #$3D                           ;009EBA|C93D    |      ;
                       BCC CODE_009EB5                      ;009EBC|90F7    |009EB5;
 
          CODE_009EBE: LDA.B #$20                           ;009EBE|A920    |      ;
                       STA.B r_GenericStateTimer            ;009EC0|8530    |000030;
                       JMP.W CODE_009E49                    ;009EC2|4C499E  |009E49;
 
 
                       LDA.W $07ED                          ;009EC5|ADED07  |0007ED;
                       AND.B #$20                           ;009EC8|2920    |      ;
                       BEQ CODE_009EF3                      ;009ECA|F027    |009EF3;
                       LDY.W $07F3                          ;009ECC|ACF307  |0007F3;
                       BNE CODE_009EDD                      ;009ECF|D00C    |009EDD;
                       DEC.B r_GenericStateTimer            ;009ED1|C630    |000030;
                       BNE CODE_009EFE                      ;009ED3|D029    |009EFE;
                       LDA.B #$20                           ;009ED5|A920    |      ;
                       STA.B r_GenericStateTimer            ;009ED7|8530    |000030;
 
                       INC.W $07F3                          ;009ED9|EEF307  |0007F3;
                       RTS                                  ;009EDC|60      |      ;
 
 
          CODE_009EDD: DEC.B r_GenericStateTimer            ;009EDD|C630    |000030;
                       BNE CODE_009EB5                      ;009EDF|D0D4    |009EB5;
 
                       LDA.B #$01                           ;009EE1|A901    |      ;
                       STA.W r_FogParallelPos               ;009EE3|8D8207  |000782;
                       LDA.B #$80                           ;009EE6|A980    |      ;
                       STA.W $0783                          ;009EE8|8D8307  |000783;
 
                       LDA.B #$01                           ;009EEB|A901    |      ;
                       STA.W r_EffectSpeedGeneral           ;009EED|8D8407  |000784;
                       JMP.W CODE_009E49                    ;009EF0|4C499E  |009E49;
 
 
          CODE_009EF3: JSR.W CODE_009E49                    ;009EF3|20499E  |009E49;
                       LDA.B #$05                           ;009EF6|A905    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009EF8|856B    |00006B;
                       LDA.B #$40                           ;009EFA|A940    |      ;
                       STA.B r_GenericStateTimer            ;009EFC|8530    |000030;
 
          CODE_009EFE: RTS                                  ;009EFE|60      |      ;
 
                       INC.W r_EffectSpeedGeneral           ;009EFF|EE8407  |000784;
                       DEC.W $0783                          ;009F02|CE8307  |000783;
                       BNE CODE_009EFE                      ;009F05|D0F7    |009EFE;
                       INC.W r_FogParallelPos               ;009F07|EE8207  |000782;
                       JSR.W CODE_009E49                    ;009F0A|20499E  |009E49;
 
                       LDA.B #$80                           ;009F0D|A980    |      ;
                       STA.W $0783                          ;009F0F|8D8307  |000783;
                       LDA.B #$20                           ;009F12|A920    |      ;
                       STA.B r_GenericStateTimer            ;009F14|8530    |000030;
                       JMP.W CODE_00A27F                    ;009F16|4C7FA2  |00A27F;
 
                       LDA.W $07EE                          ;009F19|ADEE07  |0007EE;
                       AND.B #$F8                           ;009F1C|29F8    |      ;
                       BEQ CODE_009F4D                      ;009F1E|F02D    |009F4D;
                       LDY.W $07F3                          ;009F20|ACF307  |0007F3;
                       BNE CODE_009F38                      ;009F23|D013    |009F38;
 
                       LDA.W $07ED                          ;009F25|ADED07  |0007ED;
                       AND.B #$20                           ;009F28|2920    |      ;
                       BNE CODE_009F30                      ;009F2A|D004    |009F30;
                       LDA.B #$EF                           ;009F2C|A9EF    |      ;
                       STA.B r_ScrollY                      ;009F2E|85FC    |0000FC;
 
          CODE_009F30: DEC.B r_GenericStateTimer            ;009F30|C630    |000030;
 
                       BNE CODE_009F84                      ;009F32|D050    |009F84;
                       INC.W $07F3                          ;009F34|EEF307  |0007F3;
                       RTS                                  ;009F37|60      |      ;
 
 
          CODE_009F38: DEC.B r_ScrollY                      ;009F38|C6FC    |0000FC;
                       LDA.B r_ScrollY                      ;009F3A|A5FC    |0000FC;
 
                       CMP.B #$F0                           ;009F3C|C9F0    |      ;
                       BCC CODE_009F44                      ;009F3E|9004    |009F44;
                       SBC.B #$10                           ;009F40|E910    |      ;
                       STA.B r_ScrollY                      ;009F42|85FC    |0000FC;
 
          CODE_009F44: LDA.W $07EE                          ;009F44|ADEE07  |0007EE;
                       AND.B #$F8                           ;009F47|29F8    |      ;
 
                       CMP.B r_ScrollY                      ;009F49|C5FC    |0000FC;
                       BCC CODE_009F84                      ;009F4B|9037    |009F84;
 
          CODE_009F4D: JMP.W CODE_009E49                    ;009F4D|4C499E  |009E49;
 
                       LDA.W $07F1                          ;009F50|ADF107  |0007F1;
                       CMP.B #$06                           ;009F53|C906    |      ;
                       BEQ CODE_009F5B                      ;009F55|F004    |009F5B;
                       CMP.B #$08                           ;009F57|C908    |      ;
                       BNE CODE_009F85                      ;009F59|D02A    |009F85;
 
          CODE_009F5B: LDA.B #$00                           ;009F5B|A900    |      ;
                       STA.B $31                            ;009F5D|8531    |000031;
                       LDA.B #$17                           ;009F5F|A917    |      ;
                       JSR.W CODE_00A272                    ;009F61|2072A2  |00A272;
                       LDX.B #$03                           ;009F64|A203    |      ;
                       LDA.B #$06                           ;009F66|A906    |      ;
                       JSR.W CODE_00A447                    ;009F68|2047A4  |00A447;
                       LDA.W $07F1                          ;009F6B|ADF107  |0007F1;
                       CMP.B #$08                           ;009F6E|C908    |      ;
                       BEQ CODE_009F79                      ;009F70|F007    |009F79;
                       LDA.B #$4F                           ;009F72|A94F    |      ;
                       STA.B r_GenericStateTimer            ;009F74|8530    |000030;
                       JMP.W CODE_009E49                    ;009F76|4C499E  |009E49;
 
 
          CODE_009F79: JSR.W CODE_009E49                    ;009F79|20499E  |009E49;
                       LDA.B #$08                           ;009F7C|A908    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009F7E|856B    |00006B;
                       LDA.B #$40                           ;009F80|A940    |      ;
                       STA.B r_GenericStateTimer            ;009F82|8530    |000030;
 
          CODE_009F84: RTS                                  ;009F84|60      |      ;
 
 
          CODE_009F85: JSR.W CODE_009E49                    ;009F85|20499E  |009E49;
                       LDA.B #$0A                           ;009F88|A90A    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009F8A|856B    |00006B;
                       LDA.B #$40                           ;009F8C|A940    |      ;
                       STA.B r_GenericStateTimer            ;009F8E|8530    |000030;
 
                       RTS                                  ;009F90|60      |      ;
 
                       JSR.W CODE_00A0A8                    ;009F91|20A8A0  |00A0A8;
                       DEC.B r_GenericStateTimer            ;009F94|C630    |000030;
                       BNE CODE_009F84                      ;009F96|D0EC    |009F84;
                       JSR.W CODE_00A084                    ;009F98|2084A0  |00A084;
                       LDA.B #$AA                           ;009F9B|A9AA    |      ;
                       STA.W $0403                          ;009F9D|8D0304  |000403;
                       JSR.W CODE_009E49                    ;009FA0|20499E  |009E49;
                       LDA.B #$0A                           ;009FA3|A90A    |      ;
                       STA.B r_MenuOptionIdxSelected        ;009FA5|856B    |00006B;
                       LDA.B #$40                           ;009FA7|A940    |      ;
 
                       STA.B r_GenericStateTimer            ;009FA9|8530    |000030;
 
          CODE_009FAB: RTS                                  ;009FAB|60      |      ;
 
                       LDY.W $07F3                          ;009FAC|ACF307  |0007F3;
                       BNE CODE_009FB9                      ;009FAF|D008    |009FB9;
                       DEC.B r_GenericStateTimer            ;009FB1|C630    |000030;
                       BNE CODE_009FAB                      ;009FB3|D0F6    |009FAB;
                       INC.W $07F3                          ;009FB5|EEF307  |0007F3;
                       RTS                                  ;009FB8|60      |      ;
 
 
          CODE_009FB9: LDA.B #$AA                           ;009FB9|A9AA    |      ;
                       STA.W $0403                          ;009FBB|8D0304  |000403;
                       LDX.B #$03                           ;009FBE|A203    |      ;
                       CLC                                  ;009FC0|18      |      ;
                       LDA.B #$24                           ;009FC1|A924    |      ;
                       ADC.W r_EntityFractionalX,X          ;009FC3|7DC404  |0004C4;
                       STA.W r_EntityFractionalX,X          ;009FC6|9DC404  |0004C4;
                       LDA.B #$00                           ;009FC9|A900    |      ;
                       ADC.W r_EntityXPos,X                 ;009FCB|7D3804  |000438;
                       STA.W r_EntityXPos,X                 ;009FCE|9D3804  |000438;
                       CLC                                  ;009FD1|18      |      ;
                       LDA.B #$F0                           ;009FD2|A9F0    |      ;
                       ADC.W r_EntityFractionalY,X          ;009FD4|7DDB04  |0004DB;
                       STA.W r_EntityFractionalY,X          ;009FD7|9DDB04  |0004DB;
                       LDA.B #$FF                           ;009FDA|A9FF    |      ;
                       ADC.W r_EntityYPos,X                 ;009FDC|7D1C04  |00041C;
                       STA.W r_EntityYPos,X                 ;009FDF|9D1C04  |00041C;
                       LDA.W r_EntityXPos,X                 ;009FE2|BD3804  |000438;
                       CMP.B #$9A                           ;009FE5|C99A    |      ;
 
                       BCC CODE_00A04F                      ;009FE7|9066    |00A04F;
                       LDA.B #$4F                           ;009FE9|A94F    |      ;
                       STA.B r_GenericStateTimer            ;009FEB|8530    |000030;
                       JMP.W CODE_009E49                    ;009FED|4C499E  |009E49;
 
                       JSR.W CODE_00A0B1                    ;009FF0|20B1A0  |00A0B1;
                       DEC.B r_GenericStateTimer            ;009FF3|C630    |000030;
                       BNE CODE_00A04F                      ;009FF5|D058    |00A04F;
                       LDA.B #$00                           ;009FF7|A900    |      ;
                       STA.W $0403                          ;009FF9|8D0304  |000403;
                       JSR.W CODE_009E49                    ;009FFC|20499E  |009E49;
                       LDA.B #$40                           ;009FFF|A940    |      ;
                       STA.B r_GenericStateTimer            ;00A001|8530    |000030; NES PRG 2000
 
          CODE_00A003: LDA.B #$20                           ;00A003|A920    |      ;
                       JMP.W CODE_00A272                    ;00A005|4C72A2  |00A272;
 
                       LDY.W $07F3                          ;00A008|ACF307  |0007F3;
                       BNE CODE_00A01B                      ;00A00B|D00E    |00A01B;
                       DEC.B r_GenericStateTimer            ;00A00D|C630    |000030;
                       BNE CODE_00A04F                      ;00A00F|D03E    |00A04F;
                       LDA.B #$20                           ;00A011|A920    |      ;
                       STA.B r_GenericStateTimer            ;00A013|8530    |000030;
                       INC.W $07F3                          ;00A015|EEF307  |0007F3;
                       JMP.W CODE_00A442                    ;00A018|4C42A4  |00A442;
 
 
          CODE_00A01B: JSR.W CODE_00A303                    ;00A01B|2003A3  |00A303;
                       DEC.B r_GenericStateTimer            ;00A01E|C630    |000030;
 
                       BNE CODE_00A04F                      ;00A020|D02D    |00A04F;
                       JSR.W CODE_00A3AD                    ;00A022|20ADA3  |00A3AD;
                       JMP.W CODE_009E49                    ;00A025|4C499E  |009E49;
 
                       JSR.W CODE_00A303                    ;00A028|2003A3  |00A303;
                       JSR.W CODE_00A0D0                    ;00A02B|20D0A0  |00A0D0;
                       INC.W $07F2                          ;00A02E|EEF207  |0007F2;
                       LDA.W $07F2                          ;00A031|ADF207  |0007F2;
                       AND.B #$0F                           ;00A034|290F    |      ;
                       BNE CODE_00A03D                      ;00A036|D005    |00A03D;
                       LDA.B #$09                           ;00A038|A909    |      ;
                       db $20                               ;00A03A|        |      ;
                       dw CODE_0FE25F                       ;00A03B|        |0FE25F;
 
          CODE_00A03D: LDA.W $0401                          ;00A03D|AD0104  |000401;
 
                       ORA.W $0402                          ;00A040|0D0204  |000402;
                       BNE CODE_00A04F                      ;00A043|D00A    |00A04F;
                       LDY.B #$00                           ;00A045|A000    |      ;
                       STY.B $B4                            ;00A047|84B4    |0000B4;
                       INY                                  ;00A049|C8      |      ;
                       STY.B $B5                            ;00A04A|84B5    |0000B5;
                       JMP.W CODE_009E49                    ;00A04C|4C499E  |009E49;
 
 
          CODE_00A04F: RTS                                  ;00A04F|60      |      ;
 
                       JSR.W CODE_00A303                    ;00A050|2003A3  |00A303;
                       LDA.B r_VramQueueNextIdxToFill       ;00A053|A51D    |00001D;
                       STA.B r_015                          ;00A055|8515    |000015;
                       LDA.B #$29                           ;00A057|A929    |      ;
                       db $20                               ;00A059|        |      ;
                       dw screenLoadRoutine                 ;00A05A|        |0FECE9;
                       LDA.B #$04                           ;00A05C|A904    |      ;
                       db $20                               ;00A05E|        |      ;
                       dw screenLoadRoutine                 ;00A05F|        |0FECE9;
                       db $20                               ;00A061|        |      ;
                       dw UNREACH_0FFBAF                    ;00A062|        |0FFBAF;
                       LDA.B $B4                            ;00A064|A5B4    |0000B4;
                       CMP.B #$FF                           ;00A066|C9FF    |      ;
                       BNE CODE_00A04F                      ;00A068|D0E5    |00A04F;
                       JMP.W DATA8_00A0F1                   ;00A06A|4CF1A0  |00A0F1;
 
 
          CODE_00A06D: LDY.B #$1E                           ;00A06D|A01E    |      ;
                       LDX.B #$01                           ;00A06F|A201    |      ;
                       LDA.B #$1A                           ;00A071|A91A    |      ;
                       db $20                               ;00A073|        |      ;
                       dw UNREACH_0FE5BF                    ;00A074|        |0FE5BF;
                       LDA.B #$80                           ;00A076|A980    |      ;
                       STA.W $0783                          ;00A078|8D8307  |000783;
                       LDA.W $07EE                          ;00A07B|ADEE07  |0007EE;
                       AND.B #$02                           ;00A07E|2902    |      ;
                       STA.W r_FogParallelPos               ;00A080|8D8207  |000782;
                       RTS                                  ;00A083|60      |      ;
 
 
          CODE_00A084: LDA.B #$00                           ;00A084|A900    |      ;
                       STA.W $0403                          ;00A086|8D0304  |000403;
                       STA.W $0404                          ;00A089|8D0404  |000404;
                       STA.W $0405                          ;00A08C|8D0504  |000405;
                       STA.W $0406                          ;00A08F|8D0604  |000406;
                       RTS                                  ;00A092|60      |      ;
 
                       LDA.B #$D6                           ;00A093|A9D6    |      ;
                       STA.W $0404                          ;00A095|8D0404  |000404;
                       LDA.B #$D8                           ;00A098|A9D8    |      ;
                       STA.W $0405                          ;00A09A|8D0504  |000405;
                       LDA.B #$D8                           ;00A09D|A9D8    |      ;
                       STA.W $0406                          ;00A09F|8D0604  |000406;
 
          CODE_00A0A2: LDA.B #$AA                           ;00A0A2|A9AA    |      ;
                       STA.W $0403                          ;00A0A4|8D0304  |000403;
                       RTS                                  ;00A0A7|60      |      ;
 
 
          CODE_00A0A8: JSR.W CODE_00A0BE                    ;00A0A8|20BEA0  |00A0BE;
 
                       LDA.W DATA8_00A0C6,Y                 ;00A0AB|B9C6A0  |00A0C6;
                       JMP.W CODE_00A0B7                    ;00A0AE|4CB7A0  |00A0B7;
 
 
          CODE_00A0B1: JSR.W CODE_00A0BE                    ;00A0B1|20BEA0  |00A0BE;
                       LDA.W DATA8_00A0CB,Y                 ;00A0B4|B9CBA0  |00A0CB;
 
          CODE_00A0B7: AND.B r_GenericStateTimer            ;00A0B7|2530    |000030;
                       BEQ CODE_00A0A2                      ;00A0B9|F0E7    |00A0A2;
                       JMP.W CODE_00A084                    ;00A0BB|4C84A0  |00A084;
 
 
          CODE_00A0BE: LDA.B r_GenericStateTimer            ;00A0BE|A530    |000030;
                       LSR A                                ;00A0C0|4A      |      ;
                       LSR A                                ;00A0C1|4A      |      ;
                       LSR A                                ;00A0C2|4A      |      ;
                       LSR A                                ;00A0C3|4A      |      ;
                       TAY                                  ;00A0C4|A8      |      ;
                       RTS                                  ;00A0C5|60      |      ;
 
 
         DATA8_00A0C6: db $10,$08,$04,$02,$01               ;00A0C6|        |      ;
 
         DATA8_00A0CB: db $01,$02,$04,$08,$10               ;00A0CB|        |      ;
 
          CODE_00A0D0: LDX.B #$01                           ;00A0D0|A201    |      ;
                       LDA.W r_OamSpecIdxDoubled,X          ;00A0D2|BD0004  |000400;
                       BEQ CODE_00A0E0                      ;00A0D5|F009    |00A0E0;
                       JSR.W DATA8_00A41D                   ;00A0D7|201DA4  |00A41D;
                       db $20                               ;00A0DA|        |      ;
                       dw CODE_0FEF75                       ;00A0DB|        |0FEF75;
                       JSR.W CODE_00A3EE                    ;00A0DD|20EEA3  |00A3EE;
 
          CODE_00A0E0: LDA.B r_PartnerIdx                   ;00A0E0|A53A    |00003A;
                       BMI CODE_00A11C                      ;00A0E2|3038    |00A11C;
                       LDX.B #$02                           ;00A0E4|A202    |      ;
                       LDA.W r_OamSpecIdxDoubled,X          ;00A0E6|BD0004  |000400;
                       BEQ CODE_00A11C                      ;00A0E9|F031    |00A11C;
                       JSR.W DATA8_00A41D                   ;00A0EB|201DA4  |00A41D;
                       db $4C                               ;00A0EE|        |      ;
 
                       dw CODE_0FEF75                       ;00A0EF|        |0FEF75;
 
         DATA8_00A0F1: db $20                               ;00A0F1|        |      ;
                       dw UNREACH_0FE666                    ;00A0F2|        |0FE666;
                       LDA.B #$44                           ;00A0F4|A944    |      ;
                       STA.B r_NametableMapping             ;00A0F6|8525    |000025;
                       LDA.B r_PPUCtrl                      ;00A0F8|A5FF    |0000FF;
                       AND.B #$FC                           ;00A0FA|29FC    |      ;
                       STA.B r_PPUCtrl                      ;00A0FC|85FF    |0000FF;
                       LDA.B #$00                           ;00A0FE|A900    |      ;
                       STA.B r_MenuOptionIdxSelected        ;00A100|856B    |00006B;
                       LDA.B #$1F                           ;00A102|A91F    |      ;
 
                       STA.B r_InGameSubstate               ;00A104|852A    |00002A;
                       LDA.B r_MapTransitionCheckpoint      ;00A106|A5A4    |0000A4;
                       ASL A                                ;00A108|0A      |      ;
                       CLC                                  ;00A109|18      |      ;
                       ADC.B r_MapTransitionCheckpoint      ;00A10A|65A4    |0000A4;
                       TAY                                  ;00A10C|A8      |      ;
                       LDA.W DATA8_00A11D,Y                 ;00A10D|B91DA1  |00A11D;
                       STA.B r_CurrRoomGroupStage           ;00A110|8532    |000032;
                       LDA.W DATA8_00A11E,Y                 ;00A112|B91EA1  |00A11E;
                       STA.B r_CurrRoomSectionBlock         ;00A115|8533    |000033;
                       LDA.W DATA8_00A11F,Y                 ;00A117|B91FA1  |00A11F;
                       STA.B r_CurrRoomIdx                  ;00A11A|8534    |000034;
 
          CODE_00A11C: RTS                                  ;00A11C|60      |      ;
 
 
         DATA8_00A11D: db $00                               ;00A11D|        |      ;
 
         DATA8_00A11E: db $00                               ;00A11E|        |      ;
 
         DATA8_00A11F: db $00,$01,$03,$02,$02               ;00A11F|        |      ;
                       db $01,$00,$03,$00,$02               ;00A124|        |      ;
                       db $04,$00,$00,$05,$00               ;00A129|        |      ;
                       db $00,$0B,$00,$00,$07               ;00A12E|        |      ;
                       db $00,$01,$07,$05,$00               ;00A133|        |      ;
                       db $09,$00,$00,$0A,$00               ;00A138|        |      ;
                       db $00,$0A,$00,$00,$0C               ;00A13D|        |      ;
                       db $00,$00,$0C,$00,$00               ;00A142|        |      ;
                       db $0D,$00,$00,$0E,$00               ;00A147|        |      ;
                       db $02                               ;00A14C|        |      ;
 
loadPointerScreenLoad: dw LOOSE_OP_00BA6A                   ;00A14D|        |00BA6A;
                       dw CODE_00BBBE                       ;00A14F|        |00BBBE;
 
                       dw DATA8_00B9FC                      ;00A151|        |00B9FC;
 
                       dw LOOSE_OP_00BA5E                   ;00A153|        |00BA5E;
 
   PPUdestLargeLayout: dw $2C80,$2FC8,$2E00                 ;00A155|        |      ;
 
                       dw $2FE0                             ;00A15B|        |      ;
 
   RLE_namScreenIndex: dw $FE0C,$1C0C,$1210                 ;00A15D|        |      ;
                       dw $1CFF,$140E,$1210                 ;00A163|        |      ;
                       dw $00FF,$0002,$4407                 ;00A169|        |      ;
                       dw $4444,$AD50,$07EE                 ;00A16F|        |      ;
                       dw $0329                             ;00A175|        |      ;
                       TAY                                  ;00A177|A8      |      ;
                       LDA.W RLE_namScreenAtri,Y            ;00A178|B96AA1  |00A16A;
                       STA.B r_CurrDrawnEntityCachedAttr    ;00A17B|8510    |000010;
                       LDA.W RLE_namScreenMapping_5105,Y    ;00A17D|B96EA1  |00A16E;
                       STA.B r_NametableMapping             ;00A180|8525    |000025;
                       STA.W $5105                          ;00A182|8D0551  |005105;
 
          CODE_00A185: LDY.B r_CurrDrawnEntityCachedAttr    ;00A185|A410    |000010;
                       LDA.B #$8A                           ;00A187|A98A    |      ;
                       LDX.W RLE_namScreenIndex,Y           ;00A189|BE5DA1  |00A15D;
                       BMI CODE_00A19C                      ;00A18C|300E    |00A19C;
                       CPX.B #$0C                           ;00A18E|E00C    |      ;
                       BNE DATA8_00A194                     ;00A190|D002    |00A194;
                       LDA.B #$98                           ;00A192|A998    |      ;
 
         DATA8_00A194: db $20                               ;00A194|        |      ;
                       dw screenLoadRoutine01               ;00A195|        |0FEBD5;
                       INC.B r_CurrDrawnEntityCachedAttr    ;00A197|E610    |000010;
                       JMP.W CODE_00A185                    ;00A199|4C85A1  |00A185;
 
 
          CODE_00A19C: CPX.B #$FF                           ;00A19C|E0FF    |      ;
                       BCS CODE_00A1C6                      ;00A19E|B026    |00A1C6;
 
                       LDA.B #$00                           ;00A1A0|A900    |      ;
                       STA.B r_CurrDrawnEntityCachedAttr    ;00A1A2|8510    |000010;
 
          CODE_00A1A4: LDY.B r_CurrDrawnEntityCachedAttr    ;00A1A4|A410    |000010;
                       LDA.W loadPointerScreenLoad,Y        ;00A1A6|B94DA1  |00A14D;
                       STA.B $00                            ;00A1A9|8500    |000000;
                       LDA.W PTR16_00A14E,Y                 ;00A1AB|B94EA1  |00A14E;
                       STA.B $01                            ;00A1AE|8501    |000001;
                       LDX.W PPUdestLargeLayout,Y           ;00A1B0|BE55A1  |00A155;
                       LDA.W DATA16_00A156,Y                ;00A1B3|B956A1  |00A156;
                       TAY                                  ;00A1B6|A8      |      ;
                       LDA.B #$8A                           ;00A1B7|A98A    |      ;
                       db $20                               ;00A1B9|        |      ;
                       dw CODE_0FEBE0                       ;00A1BA|        |0FEBE0;
                       INC.B r_CurrDrawnEntityCachedAttr    ;00A1BC|E610    |000010;
                       INC.B r_CurrDrawnEntityCachedAttr    ;00A1BE|E610    |000010;
                       LDA.B r_CurrDrawnEntityCachedAttr    ;00A1C0|A510    |000010;
                       CMP.B #$08                           ;00A1C2|C908    |      ;
                       BCC CODE_00A1A4                      ;00A1C4|90DE    |00A1A4;
 
          CODE_00A1C6: LDA.W $07F1                          ;00A1C6|ADF107  |0007F1;
                       CMP.B #$03                           ;00A1C9|C903    |      ;
                       BCC CODE_00A1DF                      ;00A1CB|9012    |00A1DF;
                       LDA.B #$17                           ;00A1CD|A917    |      ;
                       db $4C                               ;00A1CF|        |      ;
 
                       dw screenLoadRoutine                 ;00A1D0|        |0FECE9;
 
          CODE_00A1D2: JSR.W CODE_00A1E0                    ;00A1D2|20E0A1  |00A1E0;
                       LDA.B #$7F                           ;00A1D5|A97F    |      ;
                       STA.B r_ChrBankBG_0000               ;00A1D7|854A    |00004A;
                       STA.B r_ChrBankBG_0400               ;00A1D9|854B    |00004B;
                       STA.B r_ChrBankBG_0800               ;00A1DB|854C    |00004C;
                       STA.B r_ChrBankBG_0c00               ;00A1DD|854D    |00004D;
 
          CODE_00A1DF: RTS                                  ;00A1DF|60      |      ;
 
 
          CODE_00A1E0: LDA.B #$00                           ;00A1E0|A900    |      ;
                       STA.B r_ChrBankSpr_0000              ;00A1E2|8546    |000046;
                       LDY.B r_PartnerIdx                   ;00A1E4|A43A    |00003A;
                       INY                                  ;00A1E6|C8      |      ;
                       LDA.W DATA8_00A1F5,Y                 ;00A1E7|B9F5A1  |00A1F5;
                       STA.B r_ChrBankSpr_0400              ;00A1EA|8547    |000047;
                       LDA.B #$7E                           ;00A1EC|A97E    |      ;
                       STA.B r_ChrBankSpr_0800              ;00A1EE|8548    |000048;
                       LDA.B #$7B                           ;00A1F0|A97B    |      ;
                       STA.B r_ChrBankSpr_0c00              ;00A1F2|8549    |000049;
                       RTS                                  ;00A1F4|60      |      ;
 
 
         DATA8_00A1F5: db $00,$00,$04,$02,$06               ;00A1F5|        |      ;
 
         DATA8_00A1FA: db $A5,$30,$29,$0F,$D0               ;00A1FA|        |      ;
                       db $0B,$A5,$30,$C9,$D0               ;00A1FF|        |      ;
                       db $B0,$05,$A9,$3A,$20               ;00A204|        |      ;
                       db $5F,$E2,$A5,$30,$4A               ;00A209|        |      ;
                       db $4A,$4A,$4A,$A8,$B9               ;00A20E|        |      ;
                       db $37,$A2,$85,$00                   ;00A213|        |      ;
                       LDA.B r_GameStateLoopCounter         ;00A217|A51A    |00001A;
                       AND.B #$02                           ;00A219|2902    |      ;
                       BEQ CODE_00A224                      ;00A21B|F007    |00A224;
                       SEC                                  ;00A21D|38      |      ;
                       LDA.B #$00                           ;00A21E|A900    |      ;
                       SBC.B $00                            ;00A220|E500    |000000;
                       STA.B $00                            ;00A222|8500    |000000;
 
          CODE_00A224: LDA.B $00                            ;00A224|A500    |000000;
                       STA.B r_ScrollX                      ;00A226|85FD    |0000FD;
                       ASL A                                ;00A228|0A      |      ;
                       LDA.B r_PPUCtrl                      ;00A229|A5FF    |0000FF;
                       AND.B #$FE                           ;00A22B|29FE    |      ;
                       STA.B $00                            ;00A22D|8500    |000000;
                       LDA.B #$00                           ;00A22F|A900    |      ;
                       ROL A                                ;00A231|2A      |      ;
                       ORA.B $00                            ;00A232|0500    |000000;
                       STA.B r_PPUCtrl                      ;00A234|85FF    |0000FF;
                       RTS                                  ;00A236|60      |      ;
 
                       db $01,$01,$01,$01,$01               ;00A237|        |      ;
                       db $01,$02,$02,$02,$02               ;00A23C|        |      ;
                       db $02,$01,$00,$00,$00               ;00A241|        |      ;
                       db $00                               ;00A246|        |      ;
 
          CODE_00A247: LDX.B #$00                           ;00A247|A200    |      ;
                       JMP.W CODE_00A24E                    ;00A249|4C4EA2  |00A24E;
 
                       LDX.B #$03                           ;00A24C|A203    |      ;
 
          CODE_00A24E: JSR.W CODE_00A257                    ;00A24E|2057A2  |00A257;
                       INX                                  ;00A251|E8      |      ;
                       CPX.B #$1C                           ;00A252|E01C    |      ;
                       BNE CODE_00A24E                      ;00A254|D0F8    |00A24E;
                       RTS                                  ;00A256|60      |      ;
 
 
          CODE_00A257: LDA.B #$00                           ;00A257|A900    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00A259|9D0004  |000400;
                       STA.W r_EntityOamSpecGroupDoubled,X  ;00A25C|9D8C04  |00048C;
                       STA.W r_EntityXPos,X                 ;00A25F|9D3804  |000438;
                       STA.W r_EntityYPos,X                 ;00A262|9D1C04  |00041C;
                       STA.W r_EntityPaletteOverride,X      ;00A265|9D5404  |000454;
                       STA.W r_EntityState,X                ;00A268|9D7004  |000470;
                       STA.W r_EntityFacingLeft,X           ;00A26B|9DA804  |0004A8;
                       STA.W r_EntityAnimationDefIdxInSpecGroup,X;00A26E|9DAA05  |0005AA;
                       RTS                                  ;00A271|60      |      ;
 
 
          CODE_00A272: STA.W $07C1                          ;00A272|8DC107  |0007C1;
                       JMP.W CODE_00A299                    ;00A275|4C99A2  |00A299;
 
 
          CODE_00A278: LDA.W $07EE                          ;00A278|ADEE07  |0007EE;
                       AND.B #$02                           ;00A27B|2902    |      ;
                       BEQ CODE_00A289                      ;00A27D|F00A    |00A289;
 
          CODE_00A27F: LDY.B #$00                           ;00A27F|A000    |      ;
                       LDX.B #$18                           ;00A281|A218    |      ;
                       JSR.W CODE_00A2A3                    ;00A283|20A3A2  |00A2A3;
                       JSR.W CODE_00A2A3                    ;00A286|20A3A2  |00A2A3;
 
          CODE_00A289: LDA.B r_PartnerIdx                   ;00A289|A53A    |00003A;
                       BMI CODE_00A299                      ;00A28B|300C    |00A299;
                       CMP.B #$02                           ;00A28D|C902    |      ;
                       BCC CODE_00A299                      ;00A28F|9008    |00A299;
                       ASL A                                ;00A291|0A      |      ;
                       ASL A                                ;00A292|0A      |      ;
                       TAY                                  ;00A293|A8      |      ;
                       LDX.B #$14                           ;00A294|A214    |      ;
                       JSR.W CODE_00A2A3                    ;00A296|20A3A2  |00A2A3;
 
          CODE_00A299: LDA.B #$29                           ;00A299|A929    |      ;
                       db $20                               ;00A29B|        |      ;
                       dw screenLoadRoutine                 ;00A29C|        |0FECE9;
                       LDA.B #$04                           ;00A29E|A904    |      ;
                       db $4C                               ;00A2A0|        |      ;
 
                       dw screenLoadRoutine                 ;00A2A1|        |0FECE9;
 
          CODE_00A2A3: LDA.B #$04                           ;00A2A3|A904    |      ;
                       STA.B $00                            ;00A2A5|8500    |000000;
 
          CODE_00A2A7: LDA.W DATA8_00A2D3,Y                 ;00A2A7|B9D3A2  |00A2D3;
                       STA.W $07A2,X                        ;00A2AA|9DA207  |0007A2;
                       INY                                  ;00A2AD|C8      |      ;
 
                       INX                                  ;00A2AE|E8      |      ;
                       DEC.B $00                            ;00A2AF|C600    |000000;
                       BNE CODE_00A2A7                      ;00A2B1|D0F4    |00A2A7;
                       RTS                                  ;00A2B3|60      |      ;
 
 
          CODE_00A2B4: LDY.B #$10                           ;00A2B4|A010    |      ;
                       LDX.B #$00                           ;00A2B6|A200    |      ;
                       LDA.B #$08                           ;00A2B8|A908    |      ;
                       STA.B $02                            ;00A2BA|8502    |000002;
 
          CODE_00A2BC: JSR.W CODE_00A2A3                    ;00A2BC|20A3A2  |00A2A3;
                       DEC.B $02                            ;00A2BF|C602    |000002;
 
                       BNE CODE_00A2BC                      ;00A2C1|D0F9    |00A2BC;
                       LDA.B #$00                           ;00A2C3|A900    |      ;
                       STA.W $07A0                          ;00A2C5|8DA007  |0007A0;
                       LDA.B #$3F                           ;00A2C8|A93F    |      ;
                       STA.W $07A1                          ;00A2CA|8DA107  |0007A1;
                       LDA.B #$FF                           ;00A2CD|A9FF    |      ;
                       STA.W r_SpawnerID                    ;00A2CF|8DC207  |0007C2;
                       RTS                                  ;00A2D2|60      |      ;
 
 
         DATA8_00A2D3: db $0F,$0F,$16,$24,$0F               ;00A2D3|        |      ;
                       db $0F,$05,$16,$0F,$08               ;00A2D8|        |      ;
                       db $15,$38,$0F,$0F,$15               ;00A2DD|        |      ;
                       db $36,$0F,$00,$07,$17               ;00A2E2|        |      ;
                       db $0F,$07,$17,$20,$0F               ;00A2E7|        |      ;
                       db $00,$03,$13,$0F,$02               ;00A2EC|        |      ;
                       db $03,$11,$0F,$08,$28               ;00A2F1|        |      ;
                       db $37,$0F,$21,$11,$20               ;00A2F6|        |      ;
                       db $0F,$0F,$21,$20,$0F               ;00A2FB|        |      ;
 
                       db $0F,$07,$20                       ;00A300|        |      ;
 
          CODE_00A303: LDY.B #$01                           ;00A303|A001    |      ;
                       LDA.W $07F1                          ;00A305|ADF107  |0007F1;
                       BEQ CODE_00A32B                      ;00A308|F021    |00A32B;
                       CMP.B #$06                           ;00A30A|C906    |      ;
                       BEQ CODE_00A310                      ;00A30C|F002    |00A310;
                       LDY.B #$00                           ;00A30E|A000    |      ;
 
          CODE_00A310: STY.B r_CollisionPointYinScreen      ;00A310|8411    |000011;
                       INC.W r_BoneDragonKingRipsBossGeneral;00A312|EEEC07  |0007EC;
                       LDA.W $07ED                          ;00A315|ADED07  |0007ED;
                       AND.B #$1F                           ;00A318|291F    |      ;
                       CMP.B #$0E                           ;00A31A|C90E    |      ;
                       BCS CODE_00A340                      ;00A31C|B022    |00A340;
                       LDA.W r_BoneDragonKingRipsBossGeneral;00A31E|ADEC07  |0007EC;
                       AND.B #$3F                           ;00A321|293F    |      ;
                       CMP.B #$1F                           ;00A323|C91F    |      ;
                       BEQ CODE_00A377                      ;00A325|F050    |00A377;
                       CMP.B #$3F                           ;00A327|C93F    |      ;
                       BEQ CODE_00A32C                      ;00A329|F001    |00A32C;
 
          CODE_00A32B: RTS                                  ;00A32B|60      |      ;
 
 
          CODE_00A32C: LDA.B r_CollisionPointYinScreen      ;00A32C|A511    |000011;
                       BNE CODE_00A38B                      ;00A32E|D05B    |00A38B;
                       LDX.B #$03                           ;00A330|A203    |      ;
 
          CODE_00A332: LDA.W r_EntityState,X                ;00A332|BD7004  |000470;
                       AND.B #$7F                           ;00A335|297F    |      ;
                       STA.W r_EntityState,X                ;00A337|9D7004  |000470;
                       INX                                  ;00A33A|E8      |      ;
                       CPX.B #$0A                           ;00A33B|E00A    |      ;
                       BNE CODE_00A332                      ;00A33D|D0F3    |00A332;
                       RTS                                  ;00A33F|60      |      ;
 
 
          CODE_00A340: LDA.W r_BoneDragonKingRipsBossGeneral;00A340|ADEC07  |0007EC;
                       AND.B #$7F                           ;00A343|297F    |      ;
                       STA.B $00                            ;00A345|8500    |000000;
                       LDA.W r_BoneDragonKingRipsBossGeneral;00A347|ADEC07  |0007EC;
                       AND.B #$20                           ;00A34A|2920    |      ;
                       ASL A                                ;00A34C|0A      |      ;
                       ASL A                                ;00A34D|0A      |      ;
                       ORA.B $00                            ;00A34E|0500    |000000;
                       STA.W $0473                          ;00A350|8D7304  |000473;
                       LDX.B #$04                           ;00A353|A204    |      ;
                       JSR.W CODE_00A367                    ;00A355|2067A3  |00A367;
                       db $20                               ;00A358|        |      ;
                       dw CODE_0FEF75                       ;00A359|        |0FEF75;
                       LDA.W $0405                          ;00A35B|AD0504  |000405;
                       BEQ CODE_00A376                      ;00A35E|F016    |00A376;
                       INX                                  ;00A360|E8      |      ;
                       JSR.W CODE_00A367                    ;00A361|2067A3  |00A367;
                       db $4C                               ;00A364|        |      ;
 
                       dw CODE_0FEF75                       ;00A365|        |0FEF75;
 
          CODE_00A367: LDY.B #$3A                           ;00A367|A03A    |      ;
                       LDA.W $07F1                          ;00A369|ADF107  |0007F1;
                       CMP.B #$16                           ;00A36C|C916    |      ;
                       BNE CODE_00A372                      ;00A36E|D002    |00A372;
                       LDY.B #$3B                           ;00A370|A03B    |      ;
 
          CODE_00A372: TYA                                  ;00A372|98      |      ;
                       STA.W r_EntityAnimationDefIdxInSpecGroup,X;00A373|9DAA05  |0005AA;
 
          CODE_00A376: RTS                                  ;00A376|60      |      ;
 
 
          CODE_00A377: LDA.B r_CollisionPointYinScreen      ;00A377|A511    |000011;
                       BNE CODE_00A39C                      ;00A379|D021    |00A39C;
                       LDX.B #$03                           ;00A37B|A203    |      ;
 
          CODE_00A37D: LDA.W r_EntityState,X                ;00A37D|BD7004  |000470;
                       ORA.B #$80                           ;00A380|0980    |      ;
                       STA.W r_EntityState,X                ;00A382|9D7004  |000470;
                       INX                                  ;00A385|E8      |      ;
                       CPX.B #$0A                           ;00A386|E00A    |      ;
                       BNE CODE_00A37D                      ;00A388|D0F3    |00A37D;
                       RTS                                  ;00A38A|60      |      ;
 
 
          CODE_00A38B: JSR.W CODE_00A084                    ;00A38B|2084A0  |00A084;
                       LDA.B #$06                           ;00A38E|A906    |      ;
                       LDX.B #$03                           ;00A390|A203    |      ;
                       JSR.W CODE_00A447                    ;00A392|2047A4  |00A447;
                       LDA.B #$17                           ;00A395|A917    |      ;
                       STA.B r_CurrDrawnEntityCachedAttr    ;00A397|8510    |000010;
                       JMP.W CODE_00A272                    ;00A399|4C72A2  |00A272;
 
 
          CODE_00A39C: JSR.W CODE_00A0A2                    ;00A39C|20A2A0  |00A0A2;
                       LDA.B #$07                           ;00A39F|A907    |      ;
                       LDX.B #$03                           ;00A3A1|A203    |      ;
                       JSR.W CODE_00A447                    ;00A3A3|2047A4  |00A447;
                       LDA.B #$20                           ;00A3A6|A920    |      ;
                       STA.B r_CurrDrawnEntityCachedAttr    ;00A3A8|8510    |000010;
                       JMP.W CODE_00A272                    ;00A3AA|4C72A2  |00A272;
 
 
          CODE_00A3AD: LDY.B r_CurrCharacterIdx             ;00A3AD|A43B    |00003B;
                       LDA.W r_UsableChars,Y                ;00A3AF|B93900  |000039;
                       TAY                                  ;00A3B2|A8      |      ;
                       LDX.B #$01                           ;00A3B3|A201    |      ;
 
          CODE_00A3B5: LDA.W DATA8_00A419,Y                 ;00A3B5|B919A4  |00A419;
                       STA.W r_EntityPaletteOverride,X      ;00A3B8|9D5404  |000454;
                       LDA.W DATA8_00A415,Y                 ;00A3BB|B915A4  |00A415;
                       STA.W r_EntityYPos,X                 ;00A3BE|9D1C04  |00041C;
                       LDA.W DATA8_00A411,Y                 ;00A3C1|B911A4  |00A411;
                       STA.W r_EntityAnimationDefIdxInSpecGroup,X;00A3C4|9DAA05  |0005AA;
                       LDA.W DATA8_00A40D,Y                 ;00A3C7|B90DA4  |00A40D;
                       STA.W r_EntityOamSpecGroupDoubled,X  ;00A3CA|9D8C04  |00048C;
                       LDA.B #$01                           ;00A3CD|A901    |      ;
                       STA.W r_EntityTimeUntilNextAnimation,X;00A3CF|9D7C05  |00057C;
                       LDA.B #$00                           ;00A3D2|A900    |      ;
                       STA.W r_EntityOamSpecIdxBaseOffset,X ;00A3D4|9D9305  |000593;
                       LDY.B #$01                           ;00A3D7|A001    |      ;
                       LDA.W $07ED                          ;00A3D9|ADED07  |0007ED;
                       AND.B #$40                           ;00A3DC|2940    |      ;
                       BEQ CODE_00A3E2                      ;00A3DE|F002    |00A3E2;
                       LDY.B #$FF                           ;00A3E0|A0FF    |      ;
 
          CODE_00A3E2: TYA                                  ;00A3E2|98      |      ;
                       STA.W r_EntityXPos,X                 ;00A3E3|9D3804  |000438;
 
                       BPL DATA8_00A3EB                     ;00A3E6|1003    |00A3EB;
                       INC.W r_EntityFacingLeft,X           ;00A3E8|FEA804  |0004A8;
 
         DATA8_00A3EB: db $4C                               ;00A3EB|        |      ;
 
                       dw CODE_0FEF75                       ;00A3EC|        |0FEF75;
 
          CODE_00A3EE: LDA.W $0439                          ;00A3EE|AD3904  |000439;
                       CMP.B #$20                           ;00A3F1|C920    |      ;
                       BEQ CODE_00A3F9                      ;00A3F3|F004    |00A3F9;
                       CMP.B #$E0                           ;00A3F5|C9E0    |      ;
                       BNE DATA8_00A433                     ;00A3F7|D03A    |00A433;
 
          CODE_00A3F9: LDX.B #$02                           ;00A3F9|A202    |      ;
                       LDA.W r_OamSpecIdxDoubled,X          ;00A3FB|BD0004  |000400;
                       BNE DATA8_00A433                     ;00A3FE|D033    |00A433;
                       LDY.B r_PartnerIdx                   ;00A400|A43A    |00003A;
                       BMI DATA8_00A433                     ;00A402|302F    |00A433;
                       LDA.B r_CurrCharacterIdx             ;00A404|A53B    |00003B;
                       BEQ CODE_00A40A                      ;00A406|F002    |00A40A;
                       LDY.B #$00                           ;00A408|A000    |      ;
 
          CODE_00A40A: JMP.W CODE_00A3B5                    ;00A40A|4CB5A3  |00A3B5;
 
 
         DATA8_00A40D: db $00,$0C,$0C,$0C                   ;00A40D|        |      ;
 
         DATA8_00A411: db $00,$36,$37,$38                   ;00A411|        |      ;
 
         DATA8_00A415: db $C0,$C0,$C4,$C0                   ;00A415|        |      ;
 
         DATA8_00A419: db $00,$01,$01,$01                   ;00A419|        |      ;
 
         DATA8_00A41D: db $BD,$00,$04,$F0,$1C               ;00A41D|        |      ;
                       db $AD,$ED,$07,$29,$40               ;00A422|        |      ;
                       db $D0,$0B,$FE,$38,$04               ;00A427|        |      ;
                       db $BD,$38,$04,$C9,$FC               ;00A42C|        |      ;
                       db $B0,$0C                           ;00A431|        |      ;
 
         DATA8_00A433: db $60,$DE,$38,$04,$BD               ;00A433|        |      ;
                       db $38,$04,$C9,$04,$90               ;00A438|        |      ;
                       db $01,$60,$4C,$57,$A2               ;00A43D|        |      ;
 
          CODE_00A442: LDX.B #$03                           ;00A442|A203    |      ;
                       LDA.W $07F1                          ;00A444|ADF107  |0007F1;
 
          CODE_00A447: ASL A                                ;00A447|0A      |      ;
                       TAY                                  ;00A448|A8      |      ;
                       LDA.W PTR16_00A4AD,Y                 ;00A449|B9ADA4  |00A4AD;
                       STA.B $00                            ;00A44C|8500    |000000;
                       LDA.W PTR16_00A4AE,Y                 ;00A44E|B9AEA4  |00A4AE;
                       STA.B $01                            ;00A451|8501    |000001;
 
                       LDY.B #$00                           ;00A453|A000    |      ;
                       LDA.B ($00),Y                        ;00A455|B100    |000000;
                       BEQ CODE_00A48A                      ;00A457|F031    |00A48A;
                       STA.B $02                            ;00A459|8502    |000002;
                       INY                                  ;00A45B|C8      |      ;
 
          CODE_00A45C: LDA.B #$0C                           ;00A45C|A90C    |      ;
                       STA.W r_EntityOamSpecGroupDoubled,X  ;00A45E|9D8C04  |00048C;
                       LDA.B #$00                           ;00A461|A900    |      ;
                       STA.W r_EntityState,X                ;00A463|9D7004  |000470;
                       LDA.B #$00                           ;00A466|A900    |      ;
                       STA.W r_EntityPaletteOverride,X      ;00A468|9D5404  |000454;
                       LDA.B #$01                           ;00A46B|A901    |      ;
                       STA.W r_EntityFacingLeft,X           ;00A46D|9DA804  |0004A8;
                       STA.W r_EntityTimeUntilNextAnimation,X;00A470|9D7C05  |00057C;
                       LDA.B ($00),Y                        ;00A473|B100    |000000;
                       STA.W r_OamSpecIdxDoubled,X          ;00A475|9D0004  |000400;
                       INY                                  ;00A478|C8      |      ;
                       LDA.B ($00),Y                        ;00A479|B100    |000000;
                       STA.W r_EntityXPos,X                 ;00A47B|9D3804  |000438;
                       INY                                  ;00A47E|C8      |      ;
                       LDA.B ($00),Y                        ;00A47F|B100    |000000;
                       STA.W r_EntityYPos,X                 ;00A481|9D1C04  |00041C;
                       INY                                  ;00A484|C8      |      ;
                       INX                                  ;00A485|E8      |      ;
                       DEC.B $02                            ;00A486|C602    |000002;
                       BNE CODE_00A45C                      ;00A488|D0D2    |00A45C;
 
          CODE_00A48A: RTS                                  ;00A48A|60      |      ;
 
 
         DATA8_00A48B: db $01,$C2,$04,$06,$08               ;00A48B|        |      ;
                       db $49,$33,$0B,$0C,$71               ;00A490|        |      ;
                       db $F2,$52,$14,$14,$15               ;00A495|        |      ;
                       db $56,$16                           ;00A49A|        |      ;
 
         DATA8_00A49C: db $00,$00,$00,$00,$00               ;00A49C|        |      ;
                       db $00,$00,$00,$00,$01               ;00A4A1|        |      ;
                       db $D1,$D3,$73,$02,$02               ;00A4A6|        |      ;
                       db $02,$02                           ;00A4AB|        |      ;
 
         PTR16_00A4AD: dw PTR16_00A4DB                      ;00A4AD|        |00A4DB;
                       dw PTR16_00A4DB                      ;00A4AF|        |00A4DB;
                       dw DATA8_00A4E5                      ;00A4B1|        |00A4E5;
 
                       dw DATA8_00A4EF                      ;00A4B3|        |00A4EF;
                       dw DATA8_00A4EF                      ;00A4B5|        |00A4EF;
                       dw DATA8_00A4FC                      ;00A4B7|        |00A4FC;
                       dw DATA8_00A4FC                      ;00A4B9|        |00A4FC;
                       dw DATA8_00A500                      ;00A4BB|        |00A500;
                       dw DATA8_00A50A                      ;00A4BD|        |00A50A;
 
                       dw DATA8_00A514                      ;00A4BF|        |00A514;
                       dw DATA8_00A51E                      ;00A4C1|        |00A51E;
                       dw DATA8_00A51E                      ;00A4C3|        |00A51E;
                       dw DATA8_00A528                      ;00A4C5|        |00A528;
                       dw DATA8_00A532                      ;00A4C7|        |00A532;
                       dw DATA8_00A543                      ;00A4C9|        |00A543;
                       dw DATA8_00A532                      ;00A4CB|        |00A532;
                       dw DATA8_00A539                      ;00A4CD|        |00A539;
                       dw DATA8_00A532                      ;00A4CF|        |00A532;
                       dw DATA8_00A539                      ;00A4D1|        |00A539;
                       dw DATA8_00A543                      ;00A4D3|        |00A543;
                       dw DATA8_00A54A                      ;00A4D5|        |00A54A;
                       dw DATA8_00A551                      ;00A4D7|        |00A551;
                       dw DATA8_00A558                      ;00A4D9|        |00A558;
 
         PTR16_00A4DB: dw CODE_00A003                       ;00A4DB|        |00A003;
                       db $31,$49,$D6,$35,$2B               ;00A4DD|        |      ;
                       db $D8,$3F,$51                       ;00A4E2|        |      ;
 
         DATA8_00A4E5: db $03,$A2,$58,$4F,$D6               ;00A4E5|        |      ;
                       db $55,$33,$D8,$4A,$57               ;00A4EA|        |      ;
 
         DATA8_00A4EF: db $04,$A6,$35,$75,$A8               ;00A4EF|        |      ;
                       db $4F,$87,$D6,$40,$59               ;00A4F4|        |      ;
                       db $D8,$59,$83                       ;00A4F9|        |      ;
 
         DATA8_00A4FC: db $01,$AA,$77,$7B                   ;00A4FC|        |      ;
 
         DATA8_00A500: db $03,$AC,$77,$7B,$D6               ;00A500|        |      ;
                       db $5F,$73,$D8,$81,$62               ;00A505|        |      ;
 
         DATA8_00A50A: db $03,$AE,$B2,$60,$D6               ;00A50A|        |      ;
                       db $AF,$5E,$D8,$B5,$44               ;00A50F|        |      ;
 
         DATA8_00A514: db $03,$B0,$A1,$4F,$D6               ;00A514|        |      ;
                       db $AC,$52,$D8,$86,$42               ;00A519|        |      ;
 
         DATA8_00A51E: db $03,$B4,$7F,$97,$D6               ;00A51E|        |      ;
                       db $64,$91,$D8,$95,$87               ;00A523|        |      ;
 
         DATA8_00A528: db $03,$B6,$AA,$85,$D6               ;00A528|        |      ;
                       db $9B,$78,$D8,$AB,$6D               ;00A52D|        |      ;
 
         DATA8_00A532: db $02,$EA,$90,$7F,$EC               ;00A532|        |      ;
                       db $96,$6F                           ;00A537|        |      ;
 
         DATA8_00A539: db $03,$EA,$98,$7F,$EC               ;00A539|        |      ;
                       db $78,$75,$EC,$6F,$37               ;00A53E|        |      ;
 
         DATA8_00A543: db $02,$EA,$22,$77,$EC               ;00A543|        |      ;
                       db $6E,$7F                           ;00A548|        |      ;
 
         DATA8_00A54A: db $02,$EA,$7A,$87,$EC               ;00A54A|        |      ;
                       db $BF,$6F                           ;00A54F|        |      ;
 
         DATA8_00A551: db $02,$EA,$B7,$5C,$EC               ;00A551|        |      ;
                       db $AC,$2F                           ;00A556|        |      ;
 
         DATA8_00A558: db $02,$EA,$9B                       ;00A558|        |      ;
                       AND.B [r_0f0]                        ;00A55B|27F0    |0000F0;
                       ADC.B #$2F                           ;00A55D|692F    |      ;
 
          CODE_00A55F: STA.B $00                            ;00A55F|8500    |000000;
                       LDA.B #$01                           ;00A561|A901    |      ;
                       db $20                               ;00A563|        |      ;
                       dw CODE_0FED14                       ;00A564|        |0FED14;
 
                       LDA.B $00                            ;00A566|A500    |000000;
                       ASL A                                ;00A568|0A      |      ;
                       ADC.B $00                            ;00A569|6500    |000000;
                       TAY                                  ;00A56B|A8      |      ;
                       LDA.W DATA8_00A581,Y                 ;00A56C|B981A5  |00A581;
                       db $20                               ;00A56F|        |      ;
                       dw CODE_0FED16                       ;00A570|        |0FED16;
                       LDA.W DATA8_00A582,Y                 ;00A572|B982A5  |00A582;
 
                       db $20                               ;00A575|        |      ;
                       dw CODE_0FED16                       ;00A576|        |0FED16;
                       LDA.W DATA8_00A583,Y                 ;00A578|B983A5  |00A583;
                       db $20                               ;00A57B|        |      ;
                       dw CODE_0FED16                       ;00A57C|        |0FED16;
                       db $4C                               ;00A57E|        |      ;
 
                       dw CODE_0FED12                       ;00A57F|        |0FED12;
 
         DATA8_00A581: db $2C                               ;00A581|        |      ;
 
         DATA8_00A582: db $21                               ;00A582|        |      ;
 
         DATA8_00A583: db $38,$2D,$21,$39,$2E               ;00A583|        |      ;
                       db $21,$3A,$4C,$21,$55               ;00A588|        |      ;
                       db $4D,$21,$56,$6C,$21               ;00A58D|        |      ;
                       db $75,$6D,$21,$76,$6E               ;00A592|        |      ;
                       db $21,$B1,$8D,$21,$87               ;00A597|        |      ;
                       db $38,$22,$DF,$39,$22               ;00A59C|        |      ;
 
                       db $AB,$3A,$22,$D4,$57               ;00A5A1|        |      ;
                       db $22,$AB,$58,$22,$EF               ;00A5A6|        |      ;
 
                       db $59,$22,$AB,$5A,$22               ;00A5AB|        |      ;
                       db $EF,$77,$22,$D2,$78               ;00A5B0|        |      ;
                       db $22,$D3                           ;00A5B5|        |      ;
 
    gameState8_states: LDA.B r_GameSubstate                 ;00A5B7|A519    |000019;
                       db $20                               ;00A5B9|        |      ;
                       dw jumpFromStackYXpreserved          ;00A5BA|        |0FE86D;
                       dw gameState8_substate0              ;00A5BC|        |00A5D6;
                       dw gameState8_substate1              ;00A5BE|        |00A5F3;
                       dw gameState8_substate2              ;00A5C0|        |00A645;
                       dw gameState8_substate3              ;00A5C2|        |00A657;
                       dw gameState8_substate4              ;00A5C4|        |00A6B1;
                       dw gameState8_substate5              ;00A5C6|        |00A724;
                       dw gameState8_substate6              ;00A5C8|        |00A8CB;
                       dw gameState8_substate7              ;00A5CA|        |00A910;
                       dw gameState8_substate8              ;00A5CC|        |00A94B;
                       dw gameState8_substate9              ;00A5CE|        |00A9C0;
                       dw gameState8_substate10             ;00A5D0|        |00A9EA;
                       dw gameState8_substateEmpty          ;00A5D2|        |00AA04;
                       dw gameState8_substateEmpty          ;00A5D4|        |00AA04;
 
 gameState8_substate0: db $20                               ;00A5D6|        |      ;
                       dw initSound                         ;00A5D7|        |0FE227;
                       db $20                               ;00A5D9|        |      ;
                       dw setNameTableMapping_E4            ;00A5DA|        |0FEBFD;
                       db $20                               ;00A5DC|        |      ;
                       dw UNREACH_0FE78A                    ;00A5DD|        |0FE78A;
                       LDY.B #$00                           ;00A5DF|A000    |      ;
                       LDA.B r_CurrRoomGroupStage           ;00A5E1|A532    |000032;
                       CMP.B #$00                           ;00A5E3|C900    |      ;
                       BEQ CODE_00A5ED                      ;00A5E5|F006    |00A5ED;
                       INY                                  ;00A5E7|C8      |      ;
                       CMP.B #$02                           ;00A5E8|C902    |      ;
                       BEQ CODE_00A5ED                      ;00A5EA|F001    |00A5ED;
                       INY                                  ;00A5EC|C8      |      ;
 
          CODE_00A5ED: STY.W r_SoundModeSongSelected        ;00A5ED|8C8007  |000780;
                       INC.B r_GameSubstate                 ;00A5F0|E619    |000019;
                       RTS                                  ;00A5F2|60      |      ;
 
 
 gameState8_substate1: db $20                               ;00A5F3|        |      ;
                       dw UNREACH_0FE73D                    ;00A5F4|        |0FE73D;
                       LDY.B #$00                           ;00A5F6|A000    |      ;
 
          CODE_00A5F8: LDA.W screensCHR_Data,Y              ;00A5F8|B93FA6  |00A63F;
                       STA.W r_ChrBankSpr_0800,Y            ;00A5FB|994800  |000048;
                       INY                                  ;00A5FE|C8      |      ;
                       CPY.B #$06                           ;00A5FF|C006    |      ;
                       BNE CODE_00A5F8                      ;00A601|D0F5    |00A5F8;
                       LDA.B #$18                           ;00A603|A918    |      ;
                       db $20                               ;00A605|        |      ;
                       dw screenLoadRoutine                 ;00A606|        |0FECE9;
                       LDA.B #$04                           ;00A608|A904    |      ;
                       db $20                               ;00A60A|        |      ;
                       dw screenLoadRoutine                 ;00A60B|        |0FECE9;
                       LDX.B #$0C                           ;00A60D|A20C    |      ; mapScreen Bank
                       LDA.B #$98                           ;00A60F|A998    |      ;
                       db $20                               ;00A611|        |      ;
                       dw screenLoadRoutine01               ;00A612|        |0FEBD5;
                       LDA.W r_SoundModeSongSelected        ;00A614|AD8007  |000780;
                       BEQ CODE_00A61E                      ;00A617|F005    |00A61E;
                       LDA.B #$17                           ;00A619|A917    |      ;
                       db $20                               ;00A61B|        |      ;
                       dw screenLoadRoutine                 ;00A61C|        |0FECE9;
 
          CODE_00A61E: LDA.W r_SoundModeSongSelected        ;00A61E|AD8007  |000780;
 
                       ASL A                                ;00A621|0A      |      ;
                       TAY                                  ;00A622|A8      |      ;
                       LDA.W DATA16_00AE1F,Y                ;00A623|B91FAE  |00AE1F;
                       STA.B r_CurrNumToVramQueue           ;00A626|8508    |000008;
                       LDA.W DATA16_00AE20,Y                ;00A628|B920AE  |00AE20;
                       STA.B $09                            ;00A62B|8509    |000009;
                       JSR.W CODE_00AD48                    ;00A62D|2048AD  |00AD48;
 
                       LDA.B #$78                           ;00A630|A978    |      ;
                       LDY.B #$00                           ;00A632|A000    |      ;
                       db $20                               ;00A634|        |      ;
                       dw UNREACH_0FE58E                    ;00A635|        |0FE58E;
                       LDA.B #$6C                           ;00A637|A96C    |      ;
                       db $20                               ;00A639|        |      ;
                       dw CODE_0FE25F                       ;00A63A|        |0FE25F;
                       INC.B r_GameSubstate                 ;00A63C|E619    |000019;
                       RTS                                  ;00A63E|60      |      ;
 
 
      screensCHR_Data: db $7E,$7B,$74,$75,$76               ;00A63F|        |      ;
 
                       db $77                               ;00A644|        |      ;
 
 gameState8_substate2: db $20                               ;00A645|        |      ;
                       dw UNREACH_0FE579                    ;00A646|        |0FE579;
                       BEQ CODE_00A64B                      ;00A648|F001    |00A64B;
                       RTS                                  ;00A64A|60      |      ;
 
 
          CODE_00A64B: LDY.B #$00                           ;00A64B|A000    |      ;
                       STY.W r_BGanimationTimer             ;00A64D|8C8107  |000781;
                       INY                                  ;00A650|C8      |      ;
                       STY.W r_FogParallelPos               ;00A651|8C8207  |000782;
                       INC.B r_GameSubstate                 ;00A654|E619    |000019;
                       RTS                                  ;00A656|60      |      ;
 
 
 gameState8_substate3: DEC.W r_FogParallelPos               ;00A657|CE8207  |000782;
                       BEQ CODE_00A65D                      ;00A65A|F001    |00A65D;
                       RTS                                  ;00A65C|60      |      ;
 
 
          CODE_00A65D: LDA.W r_BGanimationTimer             ;00A65D|AD8107  |000781;
                       ASL A                                ;00A660|0A      |      ;
                       ASL A                                ;00A661|0A      |      ;
                       TAY                                  ;00A662|A8      |      ;
                       LDA.W gameStat08_2f4,Y               ;00A663|B99CA6  |00A69C;
                       CMP.B #$FF                           ;00A666|C9FF    |      ;
                       BEQ CODE_00A694                      ;00A668|F02A    |00A694;
                       STY.B $07                            ;00A66A|8407    |000007;
                       LDA.B #$18                           ;00A66C|A918    |      ;
                       db $20                               ;00A66E|        |      ;
                       dw screenLoadRoutine                 ;00A66F|        |0FECE9;
                       LDY.B $07                            ;00A671|A407    |000007;
                       LDA.W gameStat08_2f4,Y               ;00A673|B99CA6  |00A69C;
                       STA.W $02F4,X                        ;00A676|9DF402  |0002F4;
                       LDA.W gameStat08_2f5,Y               ;00A679|B99DA6  |00A69D;
                       STA.W $02F5,X                        ;00A67C|9DF502  |0002F5;
                       LDA.W gameStat08_2f6,Y               ;00A67F|B99EA6  |00A69E;
                       STA.W $02F6,X                        ;00A682|9DF602  |0002F6;
                       LDA.W gameStat08_782,Y               ;00A685|B99FA6  |00A69F;
                       STA.W r_FogParallelPos               ;00A688|8D8207  |000782;
                       LDA.B #$04                           ;00A68B|A904    |      ;
                       db $20                               ;00A68D|        |      ;
                       dw screenLoadRoutine                 ;00A68E|        |0FECE9;
                       INC.W r_BGanimationTimer             ;00A690|EE8107  |000781;
                       RTS                                  ;00A693|60      |      ;
 
 
          CODE_00A694: LDA.B #$00                           ;00A694|A900    |      ;
                       STA.W r_BGanimationTimer             ;00A696|8D8107  |000781;
                       INC.B r_GameSubstate                 ;00A699|E619    |000019;
                       RTS                                  ;00A69B|60      |      ;
 
 
       gameStat08_2f4: db $07                               ;00A69C|        |      ;
 
       gameStat08_2f5: db $17                               ;00A69D|        |      ;
 
       gameStat08_2f6: db $20                               ;00A69E|        |      ;
 
       gameStat08_782: db $04,$07,$07,$10,$04               ;00A69F|        |      ;
                       db $0F,$07,$10,$04,$0F               ;00A6A4|        |      ;
                       db $0F,$10,$04,$0F,$0F               ;00A6A9|        |      ;
                       db $0F,$04,$FF                       ;00A6AE|        |      ;
 
 gameState8_substate4: LDA.W r_SoundModeSongSelected        ;00A6B1|AD8007  |000780;
                       ASL A                                ;00A6B4|0A      |      ;
                       TAY                                  ;00A6B5|A8      |      ;
                       LDA.W DATA16_00AE25,Y                ;00A6B6|B925AE  |00AE25;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00A6B9|850A    |00000A;
                       LDA.W DATA16_00AE26,Y                ;00A6BB|B926AE  |00AE26;
                       STA.B $0B                            ;00A6BE|850B    |00000B;
                       LDA.W r_BGanimationTimer             ;00A6C0|AD8107  |000781;
                       ASL A                                ;00A6C3|0A      |      ;
                       TAY                                  ;00A6C4|A8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A6C5|B10A    |00000A;
                       STA.B r_CurrNumToVramQueue           ;00A6C7|8508    |000008;
                       INY                                  ;00A6C9|C8      |      ;
                       CMP.B #$FF                           ;00A6CA|C9FF    |      ;
                       BEQ CODE_00A6D9                      ;00A6CC|F00B    |00A6D9;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A6CE|B10A    |00000A;
 
          CODE_00A6D0: STA.B $09                            ;00A6D0|8509    |000009;
                       JSR.W CODE_00AD48                    ;00A6D2|2048AD  |00AD48;
 
             posXData: db $EE                               ;00A6D5|        |      ;
 
             posYData: db $81,$07,$60                       ;00A6D6|        |      ;
 
          CODE_00A6D9: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A6D9|B10A    |00000A;
                       CMP.B #$FF                           ;00A6DB|C9FF    |      ;
                       BNE CODE_00A6D0                      ;00A6DD|D0F1    |00A6D0;
 
                       LDA.W r_SoundModeSongSelected        ;00A6DF|AD8007  |000780;
                       ASL A                                ;00A6E2|0A      |      ;
                       ASL A                                ;00A6E3|0A      |      ;
                       CLC                                  ;00A6E4|18      |      ;
                       ADC.W r_SoundModeSongSelected        ;00A6E5|6D8007  |000780;
                       TAY                                  ;00A6E8|A8      |      ;
                       LDA.W moreProgrData_783,Y            ;00A6E9|B915A7  |00A715;
                       STA.W $0783                          ;00A6EC|8D8307  |000783;
                       LDA.W moreProgrData_784,Y            ;00A6EF|B916A7  |00A716;
                       STA.W r_EffectSpeedGeneral           ;00A6F2|8D8407  |000784;
                       LDA.W moreProgrData_785,Y            ;00A6F5|B917A7  |00A717;
                       STA.W r_EffectSpeedSupGeneral        ;00A6F8|8D8507  |000785;
                       LDA.W moreProgrData_786,Y            ;00A6FB|B918A7  |00A718;
                       STA.W r_PWiconGeneral                ;00A6FE|8D8607  |000786;
                       LDA.W moreProgrData_787,Y            ;00A701|B919A7  |00A719;
                       STA.W $0787                          ;00A704|8D8707  |000787;
                       LDA.B #$00                           ;00A707|A900    |      ;
                       STA.W r_PWdumpGeneral                ;00A709|8D8807  |000788;
                       STA.W $0789                          ;00A70C|8D8907  |000789;
                       STA.W $0789                          ;00A70F|8D8907  |000789;
                       INC.B r_GameSubstate                 ;00A712|E619    |000019;
                       RTS                                  ;00A714|60      |      ;
 
 
    moreProgrData_783: db $00                               ;00A715|        |      ;
 
    moreProgrData_784: db $01                               ;00A716|        |      ;
 
    moreProgrData_785: db $00                               ;00A717|        |      ;
 
    moreProgrData_786: db $01                               ;00A718|        |      ;
 
    moreProgrData_787: db $28,$00,$01,$80,$01               ;00A719|        |      ;
                       db $30,$80,$FF,$20,$01               ;00A71E|        |      ;
                       db $40                               ;00A723|        |      ;
 
 gameState8_substate5: LDA.B #$00                           ;00A724|A900    |      ;
                       LDY.W r_EffectSpeedGeneral           ;00A726|AC8407  |000784;
                       BPL CODE_00A72D                      ;00A729|1002    |00A72D;
                       LDA.B #$FF                           ;00A72B|A9FF    |      ;
 
          CODE_00A72D: STA.B $01                            ;00A72D|8501    |000001;
                       LDA.W r_PWdumpGeneral                ;00A72F|AD8807  |000788;
                       SEC                                  ;00A732|38      |      ;
                       SBC.W $0783                          ;00A733|ED8307  |000783;
                       STA.W r_PWdumpGeneral                ;00A736|8D8807  |000788;
                       LDA.B r_ScrollX                      ;00A739|A5FD    |0000FD;
                       SBC.W r_EffectSpeedGeneral           ;00A73B|ED8407  |000784;
                       STA.B r_ScrollX                      ;00A73E|85FD    |0000FD;
                       LDA.W $0789                          ;00A740|AD8907  |000789;
                       SBC.B $01                            ;00A743|E501    |000001;
 
                       STA.W $0789                          ;00A745|8D8907  |000789;
                       AND.B #$01                           ;00A748|2901    |      ;
                       STA.B $00                            ;00A74A|8500    |000000;
                       LDA.B r_PPUCtrl                      ;00A74C|A5FF    |0000FF;
                       AND.B #$FE                           ;00A74E|29FE    |      ;
                       ORA.B $00                            ;00A750|0500    |000000;
                       STA.B r_PPUCtrl                      ;00A752|85FF    |0000FF;
                       LDA.W $0789                          ;00A754|AD8907  |000789;
                       CLC                                  ;00A757|18      |      ;
                       ADC.W r_EffectSpeedSupGeneral        ;00A758|6D8507  |000785;
                       STA.W $0789                          ;00A75B|8D8907  |000789;
                       LDA.B r_ScrollY                      ;00A75E|A5FC    |0000FC;
                       ADC.W r_PWiconGeneral                ;00A760|6D8607  |000786;
                       STA.B r_ScrollY                      ;00A763|85FC    |0000FC;
                       DEC.W $0787                          ;00A765|CE8707  |000787;
                       BNE CODE_00A7A9                      ;00A768|D03F    |00A7A9;
 
                       JSR.W DATA8_00A871                   ;00A76A|2071A8  |00A871;
                       JSR.W DATA8_00A8AD                   ;00A76D|20ADA8  |00A8AD;
                       LDY.W r_SoundModeSongSelected        ;00A770|AC8007  |000780;
                       LDA.W AndMoreProgData_00,Y           ;00A773|B9AAA7  |00A7AA;
                       db $20                               ;00A776|        |      ;
                       dw screenLoadRoutine                 ;00A777|        |0FECE9;
                       LDA.B #$04                           ;00A779|A904    |      ;
                       db $20                               ;00A77B|        |      ;
                       dw screenLoadRoutine                 ;00A77C|        |0FECE9;
                       LDX.B #$59                           ;00A77E|A259    |      ;
                       LDA.B #$19                           ;00A780|A919    |      ;
                       db $20                               ;00A782|        |      ;
                       dw UNREACH_0FE5C1                    ;00A783|        |0FE5C1;
                       LDA.W r_SoundModeSongSelected        ;00A785|AD8007  |000780;
                       ASL A                                ;00A788|0A      |      ;
                       TAY                                  ;00A789|A8      |      ;
                       LDA.W AndMoreProgData_78d,Y          ;00A78A|B9ADA7  |00A7AD;
                       STA.W $078D                          ;00A78D|8D8D07  |00078D;
                       LDA.W AndMoreProgData_78c,Y          ;00A790|B9AEA7  |00A7AE;
                       STA.W $078C                          ;00A793|8D8C07  |00078C;
                       LDA.B #$00                           ;00A796|A900    |      ;
                       STA.W r_EpilogTimer                  ;00A798|8D8A07  |00078A;
                       LDA.B r_PPUCtrl                      ;00A79B|A5FF    |0000FF;
                       ORA.B #$01                           ;00A79D|0901    |      ;
                       STA.W $078B                          ;00A79F|8D8B07  |00078B;
 
                       LDA.B #$00                           ;00A7A2|A900    |      ;
                       STA.W r_BGanimationTimer             ;00A7A4|8D8107  |000781;
                       INC.B r_GameSubstate                 ;00A7A7|E619    |000019;
 
          CODE_00A7A9: RTS                                  ;00A7A9|60      |      ;
 
 
   AndMoreProgData_00: db $14,$15,$16                       ;00A7AA|        |      ;
 
  AndMoreProgData_78d: db $22                               ;00A7AD|        |      ;
 
  AndMoreProgData_78c: db $20,$22,$E0,$22,$A0               ;00A7AE|        |      ;
 
         DATA8_00A7B3: db $A5,$1A,$29,$10,$F0               ;00A7B3|        |      ;
                       db $18                               ;00A7B8|        |      ;
 
          CODE_00A7B9: LDA.B #$00                           ;00A7B9|A900    |      ;
 
          CODE_00A7BB: STA.B $07                            ;00A7BB|8507    |000007;
                       LDY.B #$00                           ;00A7BD|A000    |      ;
 
          CODE_00A7BF: LDA.W $0791,Y                        ;00A7BF|B99107  |000791;
                       CLC                                  ;00A7C2|18      |      ;
                       ADC.B #$01                           ;00A7C3|6901    |      ;
                       TAX                                  ;00A7C5|AA      |      ;
                       LDA.B $07                            ;00A7C6|A507    |000007;
                       STA.W r_EntityState,X                ;00A7C8|9D7004  |000470;
                       INY                                  ;00A7CB|C8      |      ;
                       CPY.B #$04                           ;00A7CC|C004    |      ;
                       BNE CODE_00A7BF                      ;00A7CE|D0EF    |00A7BF;
                       RTS                                  ;00A7D0|60      |      ;
 
                       LDA.B #$80                           ;00A7D1|A980    |      ;
                       BNE CODE_00A7BB                      ;00A7D3|D0E6    |00A7BB;
 
          CODE_00A7D5: LDA.W r_SoundModeSongSelected        ;00A7D5|AD8007  |000780;
                       ASL A                                ;00A7D8|0A      |      ;
                       ASL A                                ;00A7D9|0A      |      ;
                       STA.B $07                            ;00A7DA|8507    |000007;
                       TAY                                  ;00A7DC|A8      |      ;
                       LDA.W progre_pathSpriteMap_00,Y      ;00A7DD|B926A8  |00A826;
                       STA.B r_CurrNumToVramQueue           ;00A7E0|8508    |000008;
                       LDA.W DATA8_00A827,Y                 ;00A7E2|B927A8  |00A827;
                       STA.B $09                            ;00A7E5|8509    |000009;
                       LDX.B #$01                           ;00A7E7|A201    |      ;
                       LDY.B #$00                           ;00A7E9|A000    |      ;
 
          CODE_00A7EB: LDA.B (r_CurrNumToVramQueue),Y       ;00A7EB|B108    |000008;
                       CMP.B #$FF                           ;00A7ED|C9FF    |      ;
                       BEQ CODE_00A7F8                      ;00A7EF|F007    |00A7F8;
                       STA.W r_EntityState,X                ;00A7F1|9D7004  |000470;
                       INX                                  ;00A7F4|E8      |      ;
                       INY                                  ;00A7F5|C8      |      ;
                       BNE CODE_00A7EB                      ;00A7F6|D0F3    |00A7EB;
 
          CODE_00A7F8: LDY.B $07                            ;00A7F8|A407    |000007;
                       LDA.W DATA8_00A828,Y                 ;00A7FA|B928A8  |00A828;
                       STA.B r_CurrNumToVramQueue           ;00A7FD|8508    |000008;
                       LDA.W DATA8_00A829,Y                 ;00A7FF|B929A8  |00A829;
                       STA.B $09                            ;00A802|8509    |000009;
                       LDY.B #$00                           ;00A804|A000    |      ;
                       LDA.W r_EntityYPos                   ;00A806|AD1C04  |00041C;
                       CMP.B (r_CurrNumToVramQueue),Y       ;00A809|D108    |000008;
                       BCC CODE_00A80F                      ;00A80B|9002    |00A80F;
                       INY                                  ;00A80D|C8      |      ;
                       INY                                  ;00A80E|C8      |      ;
 
          CODE_00A80F: INY                                  ;00A80F|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A810|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00A812|850A    |00000A;
                       INY                                  ;00A814|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A815|B108    |000008;
                       STA.B $0B                            ;00A817|850B    |00000B;
                       LDY.B #$00                           ;00A819|A000    |      ;
 
          CODE_00A81B: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A81B|B10A    |00000A;
                       STA.W $0791,Y                        ;00A81D|999107  |000791;
                       INY                                  ;00A820|C8      |      ;
                       CPY.B #$04                           ;00A821|C004    |      ;
                       BNE CODE_00A81B                      ;00A823|D0F6    |00A81B;
 
                       RTS                                  ;00A825|60      |      ;
 
 
progre_pathSpriteMap_00: db $32                               ;00A826|        |      ;
 
         DATA8_00A827: db $A8                               ;00A827|        |      ;
 
         DATA8_00A828: db $4A                               ;00A828|        |      ;
 
         DATA8_00A829: db $A8,$3A,$A8,$4F,$A8               ;00A829|        |      ;
                       db $42,$A8,$54,$A8                   ;00A82E|        |      ;
 
showSelectionSpriteFlag: db $00,$80,$80,$80,$80               ;00A832|        |      ;
                       db $80,$80,$FF,$00,$80               ;00A837|        |      ;
                       db $80,$80,$80,$80,$80               ;00A83C|        |      ;
                       db $FF,$00,$80,$80,$80               ;00A841|        |      ;
                       db $80,$80,$80,$FF                   ;00A846|        |      ;
 
progre_pathSpriteMap_01: db $A0,$61,$A8,$65,$A8               ;00A84A|        |      ;
                       db $A0,$59,$A8,$5D,$A8               ;00A84F|        |      ;
                       db $A0,$69,$A8,$6D,$A8               ;00A854|        |      ;
                       db $01,$02,$03,$08,$04               ;00A859|        |      ;
                       db $05,$06,$08,$01,$02               ;00A85E|        |      ;
                       db $03,$08,$04,$05,$06               ;00A863|        |      ;
                       db $08,$01,$02,$03,$08               ;00A868|        |      ;
                       db $04,$05,$06,$08                   ;00A86D|        |      ;
 
         DATA8_00A871: db $AD,$80,$07,$0A,$A8               ;00A871|        |      ;
                       LDA.W DATA8_00ADD7,Y                 ;00A876|B9D7AD  |00ADD7;
                       STA.B r_CurrNumToVramQueue           ;00A879|8508    |000008;
                       LDA.W DATA8_00ADD8,Y                 ;00A87B|B9D8AD  |00ADD8;
                       STA.B $09                            ;00A87E|8509    |000009;
                       LDX.B #$01                           ;00A880|A201    |      ;
                       LDY.B #$00                           ;00A882|A000    |      ;
 
          CODE_00A884: LDA.B (r_CurrNumToVramQueue),Y       ;00A884|B108    |000008;
                       CMP.B #$FF                           ;00A886|C9FF    |      ;
                       BEQ CODE_00A8AC                      ;00A888|F022    |00A8AC;
                       STA.W r_OamSpecIdxDoubled,X          ;00A88A|9D0004  |000400;
                       LDA.B #$0C                           ;00A88D|A90C    |      ;
                       STA.W r_EntityOamSpecGroupDoubled,X  ;00A88F|9D8C04  |00048C;
                       LDA.B #$01                           ;00A892|A901    |      ;
                       STA.W r_EntityFacingLeft,X           ;00A894|9DA804  |0004A8;
                       LDA.B #$80                           ;00A897|A980    |      ;
                       STA.W r_EntityState,X                ;00A899|9D7004  |000470;
                       INY                                  ;00A89C|C8      |      ;
 
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A89D|B108    |000008;
                       STA.W r_EntityXPos,X                 ;00A89F|9D3804  |000438;
                       INY                                  ;00A8A2|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A8A3|B108    |000008;
                       STA.W r_EntityYPos,X                 ;00A8A5|9D1C04  |00041C;
                       INY                                  ;00A8A8|C8      |      ;
                       INX                                  ;00A8A9|E8      |      ;
                       BNE CODE_00A884                      ;00A8AA|D0D8    |00A884;
 
          CODE_00A8AC: RTS                                  ;00A8AC|60      |      ;
 
 
         DATA8_00A8AD: db $20                               ;00A8AD|        |      ;
                       dw UNREACH_0FE716                    ;00A8AE|        |0FE716;
                       LDY.B #$00                           ;00A8B0|A000    |      ;
                       LDA.B #$08                           ;00A8B2|A908    |      ;
                       STA.B r_DoubleCurrGroup              ;00A8B4|850C    |00000C;
 
          CODE_00A8B6: LDA.W DATA8_00A8C3,Y                 ;00A8B6|B9C3A8  |00A8C3;
                       STA.W $02EF,X                        ;00A8B9|9DEF02  |0002EF;
                       INY                                  ;00A8BC|C8      |      ;
                       INX                                  ;00A8BD|E8      |      ;
                       DEC.B r_DoubleCurrGroup              ;00A8BE|C60C    |00000C;
                       BNE CODE_00A8B6                      ;00A8C0|D0F4    |00A8B6;
                       RTS                                  ;00A8C2|60      |      ;
 
 
         DATA8_00A8C3: db $0F,$0F,$21,$20,$0F               ;00A8C3|        |      ;
                       db $0F,$07,$20                       ;00A8C8|        |      ;
 
 gameState8_substate6: JSR.W DATA8_00A7B3                   ;00A8CB|20B3A7  |00A7B3;
                       LDA.W r_SoundModeSongSelected        ;00A8CE|AD8007  |000780;
                       ASL A                                ;00A8D1|0A      |      ;
                       TAY                                  ;00A8D2|A8      |      ;
                       LDA.W DATA16_00AE2B,Y                ;00A8D3|B92BAE  |00AE2B;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00A8D6|850A    |00000A;
                       LDA.W DATA16_00AE2C,Y                ;00A8D8|B92CAE  |00AE2C;
                       STA.B $0B                            ;00A8DB|850B    |00000B;
                       LDA.W r_BGanimationTimer             ;00A8DD|AD8107  |000781;
                       ASL A                                ;00A8E0|0A      |      ;
                       TAY                                  ;00A8E1|A8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A8E2|B10A    |00000A;
                       STA.B r_CurrNumToVramQueue           ;00A8E4|8508    |000008;
                       INY                                  ;00A8E6|C8      |      ;
                       CMP.B #$FF                           ;00A8E7|C9FF    |      ;
                       BEQ CODE_00A8F6                      ;00A8E9|F00B    |00A8F6;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A8EB|B10A    |00000A;
 
          CODE_00A8ED: STA.B $09                            ;00A8ED|8509    |000009;
                       JSR.W CODE_00AD48                    ;00A8EF|2048AD  |00AD48;
                       INC.W r_BGanimationTimer             ;00A8F2|EE8107  |000781;
                       RTS                                  ;00A8F5|60      |      ;
 
 
          CODE_00A8F6: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00A8F6|B10A    |00000A;
                       CMP.B #$FF                           ;00A8F8|C9FF    |      ;
                       BNE CODE_00A8ED                      ;00A8FA|D0F1    |00A8ED;
                       LDY.W r_SoundModeSongSelected        ;00A8FC|AC8007  |000780;
                       LDA.W DATA8_00A90D,Y                 ;00A8FF|B90DA9  |00A90D;
                       STA.W r_EffectSpeedGeneral           ;00A902|8D8407  |000784;
 
                       LDA.B #$01                           ;00A905|A901    |      ;
 
                       STA.W r_FogParallelPos               ;00A907|8D8207  |000782;
                       INC.B r_GameSubstate                 ;00A90A|E619    |000019;
                       RTS                                  ;00A90C|60      |      ;
 
 
         DATA8_00A90D: db $02,$02,$FE                       ;00A90D|        |      ;
 
 gameState8_substate7: JSR.W CODE_00A7D5                    ;00A910|20D5A7  |00A7D5;
                       LDA.B #$00                           ;00A913|A900    |      ;
                       LDY.W r_EffectSpeedGeneral           ;00A915|AC8407  |000784;
                       BPL CODE_00A91C                      ;00A918|1002    |00A91C;
                       LDA.B #$FF                           ;00A91A|A9FF    |      ;
 
          CODE_00A91C: STA.B $01                            ;00A91C|8501    |000001;
                       SEC                                  ;00A91E|38      |      ;
                       LDA.W r_EpilogTimer                  ;00A91F|AD8A07  |00078A;
                       SBC.W r_EffectSpeedGeneral           ;00A922|ED8407  |000784;
                       STA.W r_EpilogTimer                  ;00A925|8D8A07  |00078A;
                       LDA.W r_FogParallelPos               ;00A928|AD8207  |000782;
                       SBC.B $01                            ;00A92B|E501    |000001;
                       STA.W r_FogParallelPos               ;00A92D|8D8207  |000782;
                       AND.B #$01                           ;00A930|2901    |      ;
                       STA.B $00                            ;00A932|8500    |000000;
                       LDA.W $078B                          ;00A934|AD8B07  |00078B;
                       AND.B #$FE                           ;00A937|29FE    |      ;
                       ORA.B $00                            ;00A939|0500    |000000;
                       STA.W $078B                          ;00A93B|8D8B07  |00078B;
                       LDA.W r_EpilogTimer                  ;00A93E|AD8A07  |00078A;
                       BNE CODE_00A94A                      ;00A941|D007    |00A94A;
                       LDA.B #$00                           ;00A943|A900    |      ;
                       STA.W r_PlayerStateDoubled           ;00A945|8D6505  |000565;
 
                       INC.B r_GameSubstate                 ;00A948|E619    |000019;
 
          CODE_00A94A: RTS                                  ;00A94A|60      |      ;
 
 
 gameState8_substate8: JSR.W CODE_00A7D5                    ;00A94B|20D5A7  |00A7D5;
                       LDA.W r_PlayerStateDoubled           ;00A94E|AD6505  |000565;
                       CMP.B #$10                           ;00A951|C910    |      ;
                       BEQ CODE_00A95F                      ;00A953|F00A    |00A95F;
                       CMP.B #$12                           ;00A955|C912    |      ;
                       BEQ CODE_00A95F                      ;00A957|F006    |00A95F;
                       JSR.W DATA8_00A7B3                   ;00A959|20B3A7  |00A7B3;
                       JMP.W CODE_00A962                    ;00A95C|4C62A9  |00A962;
 
 
          CODE_00A95F: JSR.W CODE_00A7B9                    ;00A95F|20B9A7  |00A7B9;
 
          CODE_00A962: JSR.W CODE_00AA05                    ;00A962|2005AA  |00AA05;
                       LDA.W r_PlayerStateDoubled           ;00A965|AD6505  |000565;
                       CMP.B #$12                           ;00A968|C912    |      ;
                       BNE CODE_00A9A4                      ;00A96A|D038    |00A9A4;
                       LDA.W r_SoundModeSongSelected        ;00A96C|AD8007  |000780;
                       ASL A                                ;00A96F|0A      |      ;
                       TAY                                  ;00A970|A8      |      ;
                       LDA.W progressionPointerTable,Y      ;00A971|B9A5A9  |00A9A5;
                       STA.B r_CurrNumToVramQueue           ;00A974|8508    |000008;
                       LDA.W PTR16_00A9A6,Y                 ;00A976|B9A6A9  |00A9A6;
                       STA.B $09                            ;00A979|8509    |000009;
                       LDA.W $0790                          ;00A97B|AD9007  |000790;
                       ASL A                                ;00A97E|0A      |      ;
                       CLC                                  ;00A97F|18      |      ;
                       ADC.W $0790                          ;00A980|6D9007  |000790;
                       TAY                                  ;00A983|A8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A984|B108    |000008;
                       STA.B r_CurrRoomGroupStage           ;00A986|8532    |000032;
 
                       INY                                  ;00A988|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A989|B108    |000008;
                       STA.B r_CurrRoomSectionBlock         ;00A98B|8533    |000033;
                       INY                                  ;00A98D|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00A98E|B108    |000008;
                       STA.B r_CurrRoomIdx                  ;00A990|8534    |000034;
                       LDA.B #$07                           ;00A992|A907    |      ;
                       STA.W $0160                          ;00A994|8D6001  |000160;
                       LDA.B #$B4                           ;00A997|A9B4    |      ;
                       STA.B r_GenericStateTimer            ;00A999|8530    |000030;
                       LDY.B #$00                           ;00A99B|A000    |      ;
                       STY.B $B4                            ;00A99D|84B4    |0000B4;
                       INY                                  ;00A99F|C8      |      ;
                       STY.B $B5                            ;00A9A0|84B5    |0000B5;
                       INC.B r_GameSubstate                 ;00A9A2|E619    |000019;
 
          CODE_00A9A4: RTS                                  ;00A9A4|60      |      ;
 
 
progressionPointerTable: dw goClockTower                      ;00A9A5|        |00A9AB;
                       dw goSymphaOrAlucard                 ;00A9A7|        |00A9B4;
                       dw goCryptOrWater                    ;00A9A9|        |00A9BA;
 
         goClockTower: db $01,$00,$00,$00,$00               ;00A9AB|        |      ;
                       db $00                               ;00A9B0|        |      ;
 
              goWoods: db $02,$00,$00                       ;00A9B1|        |      ;
 
    goSymphaOrAlucard: db $02,$03,$02,$06,$00               ;00A9B4|        |      ;
                       db $01                               ;00A9B9|        |      ;
 
       goCryptOrWater: db $07,$06,$00,$08,$00               ;00A9BA|        |      ;
                       db $00                               ;00A9BF|        |      ;
 
 gameState8_substate9: DEC.B r_GenericStateTimer            ;00A9C0|C630    |000030;
                       BEQ CODE_00A9CC                      ;00A9C2|F008    |00A9CC;
                       LDA.B r_GenericStateTimer            ;00A9C4|A530    |000030;
                       CMP.B #$30                           ;00A9C6|C930    |      ;
                       BCS CODE_00A9CE                      ;00A9C8|B004    |00A9CE;
                       BCC CODE_00A9CF                      ;00A9CA|9003    |00A9CF;
 
          CODE_00A9CC: INC.B r_GameSubstate                 ;00A9CC|E619    |000019;
 
          CODE_00A9CE: RTS                                  ;00A9CE|60      |      ;
 
 
          CODE_00A9CF: LDA.B $B4                            ;00A9CF|A5B4    |0000B4;
                       CMP.B #$FF                           ;00A9D1|C9FF    |      ;
                       BEQ CODE_00A9CE                      ;00A9D3|F0F9    |00A9CE;
                       LDA.B r_VramQueueNextIdxToFill       ;00A9D5|A51D    |00001D;
                       PHA                                  ;00A9D7|48      |      ;
 
                       LDY.W r_SoundModeSongSelected        ;00A9D8|AC8007  |000780;
                       LDA.W AndMoreProgData_00,Y           ;00A9DB|B9AAA7  |00A7AA;
                       db $20                               ;00A9DE|        |      ;
                       dw screenLoadRoutine                 ;00A9DF|        |0FECE9;
                       JSR.W DATA8_00A8AD                   ;00A9E1|20ADA8  |00A8AD;
                       PLA                                  ;00A9E4|68      |      ;
                       STA.B r_015                          ;00A9E5|8515    |000015;
                       db $4C                               ;00A9E7|        |      ;
 
                       dw UNREACH_0FFBAF                    ;00A9E8|        |0FFBAF;
 
gameState8_substate10: db $20                               ;00A9EA|        |      ;
                       dw setNameTableMapping_E4            ;00A9EB|        |0FEBFD;
                       LDA.W r_SoundModeSongSelected        ;00A9ED|AD8007  |000780;
                       BNE DATA8_00A9F5                     ;00A9F0|D003    |00A9F5;
                       JSR.W CODE_0090C0                    ;00A9F2|20C090  |0090C0;
 
         DATA8_00A9F5: db $20                               ;00A9F5|        |      ;
                       dw UNREACH_0FE78A                    ;00A9F6|        |0FE78A;
                       db $20                               ;00A9F8|        |      ;
 
                       dw UNREACH_0FE68F                    ;00A9F9|        |0FE68F;
 
                       LDA.B #$04                           ;00A9FB|A904    |      ;
 
                       STA.B r_GameState                    ;00A9FD|8518    |000018;
 
                       LDA.B #$00                           ;00A9FF|A900    |      ;
 
                       STA.B r_InGameSubstate               ;00AA01|852A    |00002A;
 
                       RTS                                  ;00AA03|60      |      ;
 
 
gameState8_substateEmpty: RTS                                  ;00AA04|60      |      ;
 
 
          CODE_00AA05: LDA.W r_PlayerStateDoubled           ;00AA05|AD6505  |000565;
 
          CODE_00AA08: CMP.B #$00                           ;00AA08|C900    |      ;
                       BEQ CODE_00AA46                      ;00AA0A|F03A    |00AA46;
                       CMP.B #$02                           ;00AA0C|C902    |      ;
                       BEQ CODE_00AA46                      ;00AA0E|F036    |00AA46;
                       CMP.B #$10                           ;00AA10|C910    |      ;
                       BEQ CODE_00AA46                      ;00AA12|F032    |00AA46;
                       LDA.W r_SoundModeSongSelected        ;00AA14|AD8007  |000780;
                       ASL A                                ;00AA17|0A      |      ;
                       TAY                                  ;00AA18|A8      |      ;
                       LDA.W r_EntityXPos                   ;00AA19|AD3804  |000438;
                       CMP.W DATA16_00AA61,Y                ;00AA1C|D961AA  |00AA61;
                       BCC CODE_00AA26                      ;00AA1F|9005    |00AA26;
                       CMP.W DATA16_00AA62,Y                ;00AA21|D962AA  |00AA62;
                       BCC CODE_00AA46                      ;00AA24|9020    |00AA46;
 
          CODE_00AA26: LDA.W r_EntityFacingLeft             ;00AA26|ADA804  |0004A8;
                       ASL A                                ;00AA29|0A      |      ;
                       TAY                                  ;00AA2A|A8      |      ;
                       LDA.W DATA16_00AA67,Y                ;00AA2B|B967AA  |00AA67;
                       STA.W r_EntityXposSpeed              ;00AA2E|8DF204  |0004F2;
                       LDA.W DATA16_00AA68,Y                ;00AA31|B968AA  |00AA68;
                       STA.W r_EntityXposSubSpeed           ;00AA34|8D0905  |000509;
                       LDA.B #$10                           ;00AA37|A910    |      ;
                       STA.W r_PlayerStateDoubled           ;00AA39|8D6505  |000565;
                       LDA.B #$58                           ;00AA3C|A958    |      ;
                       STA.W $0787                          ;00AA3E|8D8707  |000787;
                       LDA.B #$00                           ;00AA41|A900    |      ;
                       db $20                               ;00AA43|        |      ;
                       dw CODE_0FEF57                       ;00AA44|        |0FEF57;
 
          CODE_00AA46: LDY.W r_PlayerStateDoubled           ;00AA46|AC6505  |000565;
                       db $20                               ;00AA49|        |      ;
                       dw CODE_0FE886                       ;00AA4A|        |0FE886;
                       RTL                                  ;00AA4C|6B      |      ;
 
                       TAX                                  ;00AA4D|AA      |      ;
                       BEQ PTR16_00A9FA                     ;00AA4E|F0AA    |00A9FA;
                       ROL A                                ;00AA50|2A      |      ;
                       PLB                                  ;00AA51|AB      |      ;
                       TYX                                  ;00AA52|BB      |      ;
                       PLB                                  ;00AA53|AB      |      ;
                       BIT.B #$AC                           ;00AA54|89AC    |      ;
                       STA.W CODE_00A8AC,X                  ;00AA56|9DACA8  |00A8AC;
                       LDY.W CODE_00ACEA                    ;00AA59|ACEAAC  |00ACEA;
                       BEQ CODE_00AA08                      ;00AA5C|F0AA    |00AA08;
                       RTS                                  ;00AA5E|60      |      ;
 
                       TAX                                  ;00AA5F|AA      |      ;
                       RTS                                  ;00AA60|60      |      ;
 
 
        DATA16_00AA61: dw $C000,$C000,$FF40                 ;00AA61|        |      ;
 
        DATA16_00AA67: dw $C000,$40FF                       ;00AA67|        |      ;
                       LDY.W r_EntityObjectIdxes            ;00AA6B|AC4E05  |00054E;
                       LDA.W playPosSpdScreen,Y             ;00AA6E|B9DAAA  |00AADA;
                       STA.W r_EntityOamSpecGroupDoubled    ;00AA71|8D8C04  |00048C;
                       LDA.B #$02                           ;00AA74|A902    |      ;
                       STA.W r_OamSpecIdxDoubled            ;00AA76|8D0004  |000400;
                       LDA.W r_SoundModeSongSelected        ;00AA79|AD8007  |000780;
                       ASL A                                ;00AA7C|0A      |      ;
                       STA.B $00                            ;00AA7D|8500    |000000;
                       ASL A                                ;00AA7F|0A      |      ;
                       CLC                                  ;00AA80|18      |      ;
                       ADC.B $00                            ;00AA81|6500    |000000;
                       TAY                                  ;00AA83|A8      |      ;
                       LDA.W DATA8_00AADE,Y                 ;00AA84|B9DEAA  |00AADE;
                       STA.W r_EntityXPos                   ;00AA87|8D3804  |000438;
                       LDA.W DATA8_00AADF,Y                 ;00AA8A|B9DFAA  |00AADF;
                       LDX.W r_EntityObjectIdxes            ;00AA8D|AE4E05  |00054E;
                       CPX.B #$02                           ;00AA90|E002    |      ;
                       BNE CODE_00AA97                      ;00AA92|D003    |00AA97;
                       CLC                                  ;00AA94|18      |      ;
                       ADC.B #$04                           ;00AA95|6904    |      ;
 
          CODE_00AA97: STA.W r_EntityYPos                   ;00AA97|8D1C04  |00041C;
                       LDA.W progressionPathSelecter,Y      ;00AA9A|B9E0AA  |00AAE0;
                       STA.W r_EntityFacingLeft             ;00AA9D|8DA804  |0004A8;
                       LDA.W DATA8_00AAE1,Y                 ;00AAA0|B9E1AA  |00AAE1;
                       STA.W r_EntityXposSpeed              ;00AAA3|8DF204  |0004F2;
                       LDA.W DATA8_00AAE2,Y                 ;00AAA6|B9E2AA  |00AAE2;
                       STA.W r_EntityXposSubSpeed           ;00AAA9|8D0905  |000509;
                       LDA.W DATA8_00AAE3,Y                 ;00AAAC|B9E3AA  |00AAE3;
                       STA.W $0790                          ;00AAAF|8D9007  |000790;
                       LDA.B #$44                           ;00AAB2|A944    |      ;
                       STA.W $0787                          ;00AAB4|8D8707  |000787;
                       LDA.B #$00                           ;00AAB7|A900    |      ;
                       STA.B r_RoomOrientation              ;00AAB9|8568    |000068;
                       STA.B r_CurrScrollOffsetIntoRoomScreen;00AABB|8556    |000056;
                       STA.B r_CurrScrollRoomScreen         ;00AABD|8557    |000057;
                       LDA.W r_SoundModeSongSelected        ;00AABF|AD8007  |000780;
                       ASL A                                ;00AAC2|0A      |      ;
                       TAY                                  ;00AAC3|A8      |      ;
                       LDA.W PTR16_00AD96,Y                 ;00AAC4|B996AD  |00AD96;
                       STA.B r_CurrRoomStairsDataAddr       ;00AAC7|8569    |000069;
                       LDA.W PTR16_00AD97,Y                 ;00AAC9|B997AD  |00AD97;
                       STA.B $6A                            ;00AACC|856A    |00006A;
                       LDA.B #$00                           ;00AACE|A900    |      ;
                       db $20                               ;00AAD0|        |      ;
                       dw CODE_0FEF57                       ;00AAD1|        |0FEF57;
                       INC.W r_PlayerStateDoubled           ;00AAD3|EE6505  |000565;
                       INC.W r_PlayerStateDoubled           ;00AAD6|EE6505  |000565;
                       RTS                                  ;00AAD9|60      |      ;
 
 
     playPosSpdScreen: db $00,$02,$04,$06                   ;00AADA|        |      ; ??
 
         DATA8_00AADE: db $08                               ;00AADE|        |      ;
 
         DATA8_00AADF: db $A0                               ;00AADF|        |      ;
 
progressionPathSelecter: db $00                               ;00AAE0|        |      ;
 
         DATA8_00AAE1: db $00                               ;00AAE1|        |      ;
 
         DATA8_00AAE2: db $C0                               ;00AAE2|        |      ;
 
         DATA8_00AAE3: db $01,$08,$80,$00,$00               ;00AAE3|        |      ;
                       db $C0,$00,$F8,$80,$01               ;00AAE8|        |      ;
                       db $FF,$40,$00                       ;00AAED|        |      ;
                       LDA.B r_GameStateLoopCounter         ;00AAF0|A51A    |00001A;
                       AND.B #$0F                           ;00AAF2|290F    |      ;
                       BNE DATA8_00AAFB                     ;00AAF4|D005    |00AAFB;
                       LDA.B #$09                           ;00AAF6|A909    |      ;
                       db $20                               ;00AAF8|        |      ;
                       dw CODE_0FE25F                       ;00AAF9|        |0FE25F;
 
         DATA8_00AAFB: db $20                               ;00AAFB|        |      ;
 
                       dw CODE_0FEF73                       ;00AAFC|        |0FEF73;
                       LDA.W r_EntityFractionalX            ;00AAFE|ADC404  |0004C4;
                       CLC                                  ;00AB01|18      |      ;
                       ADC.W r_EntityXposSubSpeed           ;00AB02|6D0905  |000509;
                       STA.W r_EntityFractionalX            ;00AB05|8DC404  |0004C4;
                       LDA.W r_EntityXPos                   ;00AB08|AD3804  |000438;
                       ADC.W r_EntityXposSpeed              ;00AB0B|6DF204  |0004F2;
                       STA.W r_EntityXPos                   ;00AB0E|8D3804  |000438;
                       CMP.B #$FE                           ;00AB11|C9FE    |      ;
                       BCS CODE_00AB1E                      ;00AB13|B009    |00AB1E;
                       CMP.B #$02                           ;00AB15|C902    |      ;
                       BCC CODE_00AB1E                      ;00AB17|9005    |00AB1E;
                       DEC.W $0787                          ;00AB19|CE8707  |000787;
                       BNE CODE_00AB29                      ;00AB1C|D00B    |00AB29;
 
          CODE_00AB1E: LDA.B #$00                           ;00AB1E|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;00AB20|8D0004  |000400;
                       INC.W r_PlayerStateDoubled           ;00AB23|EE6505  |000565;
                       INC.W r_PlayerStateDoubled           ;00AB26|EE6505  |000565;
 
          CODE_00AB29: RTS                                  ;00AB29|60      |      ;
 
                       LDA.B r_Joy1ButtonsPressed           ;00AB2A|A528    |000028;
                       LSR A                                ;00AB2C|4A      |      ;
                       BCS CODE_00ABA0                      ;00AB2D|B071    |00ABA0;
                       LSR A                                ;00AB2F|4A      |      ;
                       BCS CODE_00ABA4                      ;00AB30|B072    |00ABA4;
                       LSR A                                ;00AB32|4A      |      ;
                       BCS DATA8_00AB3E                     ;00AB33|B009    |00AB3E;
                       LSR A                                ;00AB35|4A      |      ;
                       BCS DATA8_00AB4C                     ;00AB36|B014    |00AB4C;
 
          CODE_00AB38: LDA.B #$02                           ;00AB38|A902    |      ;
                       STA.W r_OamSpecIdxDoubled            ;00AB3A|8D0004  |000400;
                       RTS                                  ;00AB3D|60      |      ;
 
 
         DATA8_00AB3E: db $20                               ;00AB3E|        |      ;
                       dw UNREACH_0FE6D4                    ;00AB3F|        |0FE6D4;
                       BCC CODE_00AB38                      ;00AB41|90F5    |00AB38;
                       LDA.B #$00                           ;00AB43|A900    |      ;
                       STA.W r_EntityPhase                  ;00AB45|8DC105  |0005C1;
                       LDX.B #$01                           ;00AB48|A201    |      ;
                       BNE CODE_00AB58                      ;00AB4A|D00C    |00AB58;
 
         DATA8_00AB4C: db $20                               ;00AB4C|        |      ;
                       dw UNREACH_0FE6DF                    ;00AB4D|        |0FE6DF;
                       BCC CODE_00AB38                      ;00AB4F|90E7    |00AB38;
                       LDA.B #$01                           ;00AB51|A901    |      ;
                       STA.W r_EntityPhase                  ;00AB53|8DC105  |0005C1;
                       LDX.B #$00                           ;00AB56|A200    |      ;
 
          CODE_00AB58: LDY.B #$00                           ;00AB58|A000    |      ;
                       LDA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00AB5A|A50A    |00000A;
                       ASL A                                ;00AB5C|0A      |      ;
                       BCC CODE_00AB64                      ;00AB5D|9005    |00AB64;
                       TXA                                  ;00AB5F|8A      |      ;
                       EOR.B #$01                           ;00AB60|4901    |      ;
                       TAX                                  ;00AB62|AA      |      ;
                       INY                                  ;00AB63|C8      |      ;
 
          CODE_00AB64: STY.W r_EntityAI_idx                 ;00AB64|8CEF05  |0005EF;
                       STX.W r_EntityFacingLeft             ;00AB67|8EA804  |0004A8;
                       LDA.B $0B                            ;00AB6A|A50B    |00000B;
                       STA.W r_PixelsToWalkToStairs         ;00AB6C|8D1D06  |00061D;
                       LDY.B #$00                           ;00AB6F|A000    |      ;
                       ASL A                                ;00AB71|0A      |      ;
                       BCC CODE_00AB75                      ;00AB72|9001    |00AB75;
                       INY                                  ;00AB74|C8      |      ;
 
          CODE_00AB75: STY.W r_EntityAlarmOrStartYforSinusoidalMovement;00AB75|8C0606  |000606;
                       LDA.B r_DoubleCurrSection            ;00AB78|A50D    |00000D;
                       BEQ CODE_00AB82                      ;00AB7A|F006    |00AB82;
                       LDA.B #$FF                           ;00AB7C|A9FF    |      ;
                       LDY.B #$00                           ;00AB7E|A000    |      ;
                       BEQ CODE_00AB86                      ;00AB80|F004    |00AB86;
 
          CODE_00AB82: LDA.B #$01                           ;00AB82|A901    |      ;
                       LDY.B #$00                           ;00AB84|A000    |      ;
 
          CODE_00AB86: STY.W r_EntityXposSubSpeed           ;00AB86|8C0905  |000509;
                       STA.W r_EntityXposSpeed              ;00AB89|8DF204  |0004F2;
                       LDA.B #$08                           ;00AB8C|A908    |      ;
                       STA.W r_PlayerStateDoubled           ;00AB8E|8D6505  |000565;
                       LDA.B #$00                           ;00AB91|A900    |      ;
 
          CODE_00AB93: STA.W r_EntityAnimationDefIdxInSpecGroup;00AB93|8DAA05  |0005AA;
                       LDY.B #$02                           ;00AB96|A002    |      ;
                       STY.W r_EntityOamSpecIdxBaseOffset   ;00AB98|8C9305  |000593;
                       DEY                                  ;00AB9B|88      |      ;
                       STY.W r_EntityTimeUntilNextAnimation ;00AB9C|8C7C05  |00057C;
                       RTS                                  ;00AB9F|60      |      ;
 
 
          CODE_00ABA0: LDA.B #$00                           ;00ABA0|A900    |      ;
                       BEQ CODE_00ABA6                      ;00ABA2|F002    |00ABA6;
 
          CODE_00ABA4: LDA.B #$01                           ;00ABA4|A901    |      ;
 
          CODE_00ABA6: STA.W r_EntityFacingLeft             ;00ABA6|8DA804  |0004A8;
                       LDA.B #$00                           ;00ABA9|A900    |      ;
 
                       STA.W r_EntityXposSpeed              ;00ABAB|8DF204  |0004F2;
                       STA.W r_EntityXposSubSpeed           ;00ABAE|8D0905  |000509;
                       LDA.B #$06                           ;00ABB1|A906    |      ;
                       STA.W r_PlayerStateDoubled           ;00ABB3|8D6505  |000565;
                       LDA.B #$00                           ;00ABB6|A900    |      ;
                       JMP.W CODE_00AB93                    ;00ABB8|4C93AB  |00AB93;
 
                       LDA.B r_Joy1ButtonsPressed           ;00ABBB|A528    |000028;
                       LSR A                                ;00ABBD|4A      |      ;
                       BCS CODE_00ABDF                      ;00ABBE|B01F    |00ABDF;
                       LSR A                                ;00ABC0|4A      |      ;
                       BCS CODE_00ABFC                      ;00ABC1|B039    |00ABFC;
                       LDA.B #$04                           ;00ABC3|A904    |      ;
                       STA.W r_PlayerStateDoubled           ;00ABC5|8D6505  |000565;
 
         DATA8_00ABC8: db $20                               ;00ABC8|        |      ;
                       dw CODE_0FEF73                       ;00ABC9|        |0FEF73;
 
          CODE_00ABCB: LDA.W r_EntityFractionalX            ;00ABCB|ADC404  |0004C4;
 
                       CLC                                  ;00ABCE|18      |      ;
                       ADC.W r_EntityXposSubSpeed           ;00ABCF|6D0905  |000509;
                       STA.W r_EntityFractionalX            ;00ABD2|8DC404  |0004C4;
                       LDA.W r_EntityXPos                   ;00ABD5|AD3804  |000438;
                       ADC.W r_EntityXposSpeed              ;00ABD8|6DF204  |0004F2;
                       STA.W r_EntityXPos                   ;00ABDB|8D3804  |000438;
 
                       RTS                                  ;00ABDE|60      |      ;
 
 
          CODE_00ABDF: LDA.B #$00                           ;00ABDF|A900    |      ;
                       STA.W r_EntityFacingLeft             ;00ABE1|8DA804  |0004A8;
                       JSR.W CODE_00AC28                    ;00ABE4|2028AC  |00AC28;
                       LDY.B #$02                           ;00ABE7|A002    |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00ABE9|B10A    |00000A;
                       CMP.W r_EntityXPos                   ;00ABEB|CD3804  |000438;
                       BCC CODE_00ABF7                      ;00ABEE|9007    |00ABF7;
                       LDA.B #$01                           ;00ABF0|A901    |      ;
                       LDY.B #$00                           ;00ABF2|A000    |      ;
                       JMP.W CODE_00AC11                    ;00ABF4|4C11AC  |00AC11;
 
 
          CODE_00ABF7: LDA.B #$00                           ;00ABF7|A900    |      ;
                       TAY                                  ;00ABF9|A8      |      ;
                       BEQ CODE_00AC11                      ;00ABFA|F015    |00AC11;
 
          CODE_00ABFC: LDA.B #$01                           ;00ABFC|A901    |      ;
                       STA.W r_EntityFacingLeft             ;00ABFE|8DA804  |0004A8;
                       JSR.W CODE_00AC28                    ;00AC01|2028AC  |00AC28;
 
                       LDY.B #$01                           ;00AC04|A001    |      ;
 
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00AC06|B10A    |00000A;
                       CMP.W r_EntityXPos                   ;00AC08|CD3804  |000438;
                       BCS CODE_00ABF7                      ;00AC0B|B0EA    |00ABF7;
 
                       LDA.B #$FF                           ;00AC0D|A9FF    |      ;
                       LDY.B #$00                           ;00AC0F|A000    |      ;
 
          CODE_00AC11: STY.W r_EntityXposSubSpeed           ;00AC11|8C0905  |000509;
                       STA.W r_EntityXposSpeed              ;00AC14|8DF204  |0004F2;
                       LDA.B #$00                           ;00AC17|A900    |      ;
                       STA.W r_EntityYposSpeed              ;00AC19|8D2005  |000520;
 
                       STA.W r_EntityYposSubSpeed           ;00AC1C|8D3705  |000537;
                       JMP.W DATA8_00ABC8                   ;00AC1F|4CC8AB  |00ABC8;
 
                       LDA.B #$FF                           ;00AC22|A9FF    |      ;
                       LDY.B #$E0                           ;00AC24|A0E0    |      ;
                       BNE CODE_00AC11                      ;00AC26|D0E9    |00AC11;
 
          CODE_00AC28: LDA.W r_SoundModeSongSelected        ;00AC28|AD8007  |000780;
                       ASL A                                ;00AC2B|0A      |      ;
                       TAY                                  ;00AC2C|A8      |      ;
                       LDA.W PTR16_00ADAE,Y                 ;00AC2D|B9AEAD  |00ADAE;
                       STA.B r_CurrNumToVramQueue           ;00AC30|8508    |000008;
                       LDA.W PTR16_00ADAF,Y                 ;00AC32|B9AFAD  |00ADAF;
                       STA.B $09                            ;00AC35|8509    |000009;
                       LDA.W $0790                          ;00AC37|AD9007  |000790;
                       ASL A                                ;00AC3A|0A      |      ;
                       TAY                                  ;00AC3B|A8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AC3C|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00AC3E|850A    |00000A;
                       INY                                  ;00AC40|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AC41|B108    |000008;
                       STA.B $0B                            ;00AC43|850B    |00000B;
                       RTS                                  ;00AC45|60      |      ;
 
 
          CODE_00AC46: LDA.W r_SoundModeSongSelected        ;00AC46|AD8007  |000780;
                       ASL A                                ;00AC49|0A      |      ;
                       TAY                                  ;00AC4A|A8      |      ;
                       LDA.W PTR16_00AD9C,Y                 ;00AC4B|B99CAD  |00AD9C;
                       STA.B r_CurrNumToVramQueue           ;00AC4E|8508    |000008;
                       LDA.W PTR16_00AD9D,Y                 ;00AC50|B99DAD  |00AD9D;
                       STA.B $09                            ;00AC53|8509    |000009;
                       LDY.B #$00                           ;00AC55|A000    |      ;
 
          CODE_00AC57: LDA.B (r_CurrNumToVramQueue),Y       ;00AC57|B108    |000008;
                       CMP.B #$FF                           ;00AC59|C9FF    |      ;
                       BEQ CODE_00AC7F                      ;00AC5B|F022    |00AC7F;
                       STA.B $00                            ;00AC5D|8500    |000000;
                       LDX.W r_EntityObjectIdxes            ;00AC5F|AE4E05  |00054E;
                       CPX.B #$02                           ;00AC62|E002    |      ;
                       BNE CODE_00AC6B                      ;00AC64|D005    |00AC6B;
                       CLC                                  ;00AC66|18      |      ;
                       ADC.B #$04                           ;00AC67|6904    |      ;
                       STA.B $00                            ;00AC69|8500    |000000;
 
          CODE_00AC6B: LDA.B $00                            ;00AC6B|A500    |000000;
                       SEC                                  ;00AC6D|38      |      ;
                       SBC.W r_EntityYPos                   ;00AC6E|ED1C04  |00041C;
                       BCS CODE_00AC77                      ;00AC71|B004    |00AC77;
                       EOR.B #$FF                           ;00AC73|49FF    |      ;
                       ADC.B #$01                           ;00AC75|6901    |      ;
 
          CODE_00AC77: CMP.B #$04                           ;00AC77|C904    |      ;
                       BCC CODE_00AC81                      ;00AC79|9006    |00AC81;
                       INY                                  ;00AC7B|C8      |      ;
                       INY                                  ;00AC7C|C8      |      ;
                       BNE CODE_00AC57                      ;00AC7D|D0D8    |00AC57;
 
          CODE_00AC7F: CLC                                  ;00AC7F|18      |      ;
                       RTS                                  ;00AC80|60      |      ;
 
 
          CODE_00AC81: LDA.B $00                            ;00AC81|A500    |000000;
                       TAX                                  ;00AC83|AA      |      ;
                       INY                                  ;00AC84|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AC85|B108    |000008;
                       SEC                                  ;00AC87|38      |      ;
                       RTS                                  ;00AC88|60      |      ;
 
                       LDA.W r_PixelsToWalkToStairs         ;00AC89|AD1D06  |00061D;
                       BEQ CODE_00AC97                      ;00AC8C|F009    |00AC97;
                       DEC.W r_PixelsToWalkToStairs         ;00AC8E|CE1D06  |00061D;
                       db $20                               ;00AC91|        |      ;
                       dw CODE_0FEF73                       ;00AC92|        |0FEF73;
                       JMP.W CODE_00ABCB                    ;00AC94|4CCBAB  |00ABCB;
 
 
          CODE_00AC97: LDA.B #$0A                           ;00AC97|A90A    |      ;
                       STA.W r_PlayerStateDoubled           ;00AC99|8D6505  |000565;
                       RTS                                  ;00AC9C|60      |      ;
 
                       LDA.W r_EntityPhase                  ;00AC9D|ADC105  |0005C1;
                       BNE CODE_00ACA5                      ;00ACA0|D003    |00ACA5;
                       JMP.W DATA8_00AD3C                   ;00ACA2|4C3CAD  |00AD3C;
 
 
          CODE_00ACA5: JMP.W DATA8_00AD33                   ;00ACA5|4C33AD  |00AD33;
 
                       LDA.B r_Joy1ButtonsPressed           ;00ACA8|A528    |000028;
                       LSR A                                ;00ACAA|4A      |      ;
                       BCS CODE_00ACBA                      ;00ACAB|B00D    |00ACBA;
                       LSR A                                ;00ACAD|4A      |      ;
                       BCS CODE_00ACD2                      ;00ACAE|B022    |00ACD2;
                       LSR A                                ;00ACB0|4A      |      ;
                       BCC CODE_00ACB6                      ;00ACB1|9003    |00ACB6;
                       JMP.W DATA8_00AD3C                   ;00ACB3|4C3CAD  |00AD3C;
 
 
          CODE_00ACB6: LSR A                                ;00ACB6|4A      |      ;
                       BCS DATA8_00AD33                     ;00ACB7|B07A    |00AD33;
                       RTS                                  ;00ACB9|60      |      ;
 
 
          CODE_00ACBA: LDA.B #$00                           ;00ACBA|A900    |      ;
                       STA.W r_EntityFacingLeft             ;00ACBC|8DA804  |0004A8;
 
                       LDA.W r_EntityAI_idx                 ;00ACBF|ADEF05  |0005EF;
                       BEQ CODE_00ACCB                      ;00ACC2|F007    |00ACCB;
                       LDX.B #$00                           ;00ACC4|A200    |      ;
                       LDY.B #$00                           ;00ACC6|A000    |      ;
                       JMP.W DATA8_00AD42                   ;00ACC8|4C42AD  |00AD42;
 
 
          CODE_00ACCB: LDX.B #$02                           ;00ACCB|A202    |      ;
                       LDY.B #$08                           ;00ACCD|A008    |      ;
                       JMP.W DATA8_00AD42                   ;00ACCF|4C42AD  |00AD42;
 
 
          CODE_00ACD2: LDA.B #$01                           ;00ACD2|A901    |      ;
                       STA.W r_EntityFacingLeft             ;00ACD4|8DA804  |0004A8;
                       LDA.W r_EntityAI_idx                 ;00ACD7|ADEF05  |0005EF;
                       BEQ CODE_00ACE3                      ;00ACDA|F007    |00ACE3;
                       LDX.B #$02                           ;00ACDC|A202    |      ;
                       LDY.B #$0C                           ;00ACDE|A00C    |      ;
                       JMP.W DATA8_00AD42                   ;00ACE0|4C42AD  |00AD42;
 
 
          CODE_00ACE3: LDX.B #$00                           ;00ACE3|A200    |      ;
                       LDY.B #$04                           ;00ACE5|A004    |      ;
                       JMP.W DATA8_00AD42                   ;00ACE7|4C42AD  |00AD42;
 
 
          CODE_00ACEA: JSR.W CODE_00ABCB                    ;00ACEA|20CBAB  |00ABCB;
                       LDA.W r_EntityFractionalY            ;00ACED|ADDB04  |0004DB;
                       CLC                                  ;00ACF0|18      |      ;
                       ADC.W r_EntityYposSubSpeed           ;00ACF1|6D3705  |000537;
                       STA.W r_EntityFractionalY            ;00ACF4|8DDB04  |0004DB;
                       LDA.W r_EntityYPos                   ;00ACF7|AD1C04  |00041C;
                       ADC.W r_EntityYposSpeed              ;00ACFA|6D2005  |000520;
                       STA.W r_EntityYPos                   ;00ACFD|8D1C04  |00041C;
                       LDA.W r_PixelsToWalkToStairs         ;00AD00|AD1D06  |00061D;
                       BEQ CODE_00AD14                      ;00AD03|F00F    |00AD14;
                       DEC.W r_PixelsToWalkToStairs         ;00AD05|CE1D06  |00061D;
                       LDA.W r_EntityTimeUntilNextAnimation ;00AD08|AD7C05  |00057C;
                       BEQ DATA8_00AD11                     ;00AD0B|F004    |00AD11;
                       DEC.W r_EntityTimeUntilNextAnimation ;00AD0D|CE7C05  |00057C;
                       RTS                                  ;00AD10|60      |      ;
 
 
         DATA8_00AD11: db $4C                               ;00AD11|        |      ;
 
                       dw UNREACH_0FE6EA                    ;00AD12|        |0FE6EA;
 
          CODE_00AD14: LDA.B #$00                           ;00AD14|A900    |      ;
                       STA.W r_EntityFractionalX            ;00AD16|8DC404  |0004C4;
                       STA.W r_EntityFractionalY            ;00AD19|8DDB04  |0004DB;
                       JSR.W CODE_00AC46                    ;00AD1C|2046AC  |00AC46;
                       BCC CODE_00AD2D                      ;00AD1F|900C    |00AD2D;
                       STA.W $0790                          ;00AD21|8D9007  |000790;
                       STX.W r_EntityYPos                   ;00AD24|8E1C04  |00041C;
                       LDA.B #$04                           ;00AD27|A904    |      ;
                       STA.W r_PlayerStateDoubled           ;00AD29|8D6505  |000565;
                       RTS                                  ;00AD2C|60      |      ;
 
 
          CODE_00AD2D: LDA.B #$0C                           ;00AD2D|A90C    |      ;
                       STA.W r_PlayerStateDoubled           ;00AD2F|8D6505  |000565;
                       RTS                                  ;00AD32|60      |      ;
 
 
         DATA8_00AD33: db $20                               ;00AD33|        |      ;
                       dw UNREACH_0FE6F5                    ;00AD34|        |0FE6F5;
 
          CODE_00AD36: LDA.B #$0E                           ;00AD36|A90E    |      ;
                       STA.W r_PlayerStateDoubled           ;00AD38|8D6505  |000565;
                       RTS                                  ;00AD3B|60      |      ;
 
 
         DATA8_00AD3C: db $20                               ;00AD3C|        |      ;
                       dw UNREACH_0FE700                    ;00AD3D|        |0FE700;
                       JMP.W CODE_00AD36                    ;00AD3F|4C36AD  |00AD36;
 
 
         DATA8_00AD42: db $20                               ;00AD42|        |      ;
                       dw UNREACH_0FE70B                    ;00AD43|        |0FE70B;
                       db $4C                               ;00AD45|        |      ;
 
                       dw CODE_00AD36                       ;00AD46|        |00AD36;
 
          CODE_00AD48: LDY.B #$00                           ;00AD48|A000    |      ;
 
          CODE_00AD4A: LDA.B (r_CurrNumToVramQueue),Y       ;00AD4A|B108    |000008;
                       STA.B $62                            ;00AD4C|8562    |000062;
                       INY                                  ;00AD4E|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AD4F|B108    |000008;
                       STA.B r_VramQueueDest                ;00AD51|8561    |000061;
                       INY                                  ;00AD53|C8      |      ;
                       db $20                               ;00AD54|        |      ;
                       dw CODE_0FE8B5                       ;00AD55|        |0FE8B5;
 
          CODE_00AD57: LDA.B (r_CurrNumToVramQueue),Y       ;00AD57|B108    |000008;
                       BEQ CODE_00AD76                      ;00AD59|F01B    |00AD76;
                       CMP.B #$FF                           ;00AD5B|C9FF    |      ;
                       BEQ CODE_00AD91                      ;00AD5D|F032    |00AD91;
                       CMP.B #$FE                           ;00AD5F|C9FE    |      ;
                       BEQ CODE_00AD89                      ;00AD61|F026    |00AD89;
                       INY                                  ;00AD63|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AD64|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00AD66|850A    |00000A;
                       INY                                  ;00AD68|C8      |      ;
 
          CODE_00AD69: LDA.B (r_CurrNumToVramQueue),Y       ;00AD69|B108    |000008;
                       STA.W r_VramQueue,X                  ;00AD6B|9D0003  |000300;
                       INY                                  ;00AD6E|C8      |      ;
                       INX                                  ;00AD6F|E8      |      ;
                       DEC.B r_CurrRoomSectionPlayerPosAndScreenAddr;00AD70|C60A    |00000A;
                       BNE CODE_00AD69                      ;00AD72|D0F5    |00AD69;
                       BEQ CODE_00AD57                      ;00AD74|F0E1    |00AD57;
 
          CODE_00AD76: INY                                  ;00AD76|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AD77|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00AD79|850A    |00000A;
                       INY                                  ;00AD7B|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00AD7C|B108    |000008;
                       INY                                  ;00AD7E|C8      |      ;
 
          CODE_00AD7F: STA.W r_VramQueue,X                  ;00AD7F|9D0003  |000300;
                       INX                                  ;00AD82|E8      |      ;
                       DEC.B r_CurrRoomSectionPlayerPosAndScreenAddr;00AD83|C60A    |00000A;
                       BNE CODE_00AD7F                      ;00AD85|D0F8    |00AD7F;
                       BEQ CODE_00AD57                      ;00AD87|F0CE    |00AD57;
 
          CODE_00AD89: STX.B r_VramQueueNextIdxToFill       ;00AD89|861D    |00001D;
                       db $20                               ;00AD8B|        |      ;
                       dw CODE_0FED12                       ;00AD8C|        |0FED12;
                       INY                                  ;00AD8E|C8      |      ;
                       BNE CODE_00AD4A                      ;00AD8F|D0B9    |00AD4A;
 
          CODE_00AD91: STX.B r_VramQueueNextIdxToFill       ;00AD91|861D    |00001D;
                       db $4C                               ;00AD93|        |      ;
 
                       dw CODE_0FED12                       ;00AD94|        |0FED12;
 
         PTR16_00AD96: dw DATA8_00B864                      ;00AD96|        |00B864;
                       dw CODE_00B871                       ;00AD98|        |00B871;
                       dw LOOSE_OP_00B878                   ;00AD9A|        |00B878;
 
         PTR16_00AD9C: dw DATA8_00ADA2                      ;00AD9C|        |00ADA2;
                       dw DATA8_00ADA9                      ;00AD9E|        |00ADA9;
                       dw DATA8_00ADA9                      ;00ADA0|        |00ADA9;
 
         DATA8_00ADA2: db $80,$00,$A0,$01,$C0               ;00ADA2|        |      ;
 
                       db $02,$FF                           ;00ADA7|        |      ;
 
         DATA8_00ADA9: db $80,$00,$C0,$01,$FF               ;00ADA9|        |      ;
 
         PTR16_00ADAE: dw PTR16_00ADB4                      ;00ADAE|        |00ADB4;
                       dw PTR16_00ADBA                      ;00ADB0|        |00ADBA;
                       dw PTR16_00ADBE                      ;00ADB2|        |00ADBE;
 
         PTR16_00ADB4: dw DATA8_00ADC2                      ;00ADB4|        |00ADC2;
                       dw DATA8_00ADC5                      ;00ADB6|        |00ADC5;
                       dw DATA8_00ADC8                      ;00ADB8|        |00ADC8;
 
         PTR16_00ADBA: dw DATA8_00ADCB                      ;00ADBA|        |00ADCB;
                       dw DATA8_00ADCE                      ;00ADBC|        |00ADCE;
 
         PTR16_00ADBE: dw DATA8_00ADD1                      ;00ADBE|        |00ADD1;
                       dw DATA8_00ADD4                      ;00ADC0|        |00ADD4;
 
         DATA8_00ADC2: db $80,$80,$F8                       ;00ADC2|        |      ;
 
         DATA8_00ADC5: db $A0,$08,$80                       ;00ADC5|        |      ;
 
         DATA8_00ADC8: db $C0,$70,$F8                       ;00ADC8|        |      ;
 
         DATA8_00ADCB: db $80,$08,$F8                       ;00ADCB|        |      ;
 
         DATA8_00ADCE: db $C0,$88,$F8                       ;00ADCE|        |      ;
 
         DATA8_00ADD1: db $80,$08,$F8                       ;00ADD1|        |      ;
 
         DATA8_00ADD4: db $C0,$08,$80                       ;00ADD4|        |      ;
 
         DATA8_00ADD7: db $DD                               ;00ADD7|        |      ;
 
         DATA8_00ADD8: db $AD,$F3,$AD,$09,$AE               ;00ADD8|        |      ;
                       db $A0,$59,$21,$A2,$80               ;00ADDD|        |      ;
                       db $29,$D6,$70,$28,$D8               ;00ADE2|        |      ;
                       db $72,$0D,$A4,$6A,$30               ;00ADE7|        |      ;
                       db $A6,$61,$4D,$D6,$6E               ;00ADEC|        |      ;
                       db $24,$FF,$A6,$65,$2D               ;00ADF1|        |      ;
                       db $A8,$7F,$3F,$D6,$71               ;00ADF6|        |      ;
                       db $2D,$D8,$89,$3B,$B2               ;00ADFB|        |      ;
 
                       db $6E,$48,$D6,$71,$2D               ;00AE00|        |      ;
                       db $D8,$78,$4D,$FF,$B4               ;00AE05|        |      ;
                       db $64,$4C,$B6,$8A,$3D               ;00AE0A|        |      ;
                       db $D6,$7B,$30,$D8,$8B               ;00AE0F|        |      ;
                       db $22,$B8,$9D,$4C,$D6               ;00AE14|        |      ;
                       db $80,$32,$D8,$A9,$37               ;00AE19|        |      ;
                       dw $A3FF                             ;00AE1E|        |      ;
 
        DATA16_00AE20: dw $AFAE,$BBAE,$31AE                 ;00AE20|        |      ;
 
        DATA16_00AE26: dw $43AE,$55AE,$67AE                 ;00AE26|        |      ;
 
        DATA16_00AE2C: dw $7BAE,$8FAE,$C7AE                 ;00AE2C|        |      ;
                       dw $D3AE,$EBAE,$03AE                 ;00AE32|        |      ;
                       dw $1BAF,$4BAF,$7BAF                 ;00AE38|        |      ;
                       dw $ABAF,$FFAF,$C7FF                 ;00AE3E|        |      ;
                       dw $DFAE,$F7AE,$0FAE                 ;00AE44|        |      ;
                       dw $3FAF,$6FAF,$9FAF                 ;00AE4A|        |      ;
                       dw $CFAF,$FFAF,$C7FF                 ;00AE50|        |      ;
                       dw $DFAE,$F7AE,$0FAE                 ;00AE56|        |      ;
                       dw $27AF,$57AF,$87AF                 ;00AE5C|        |      ;
                       dw $B7AF,$FFAF,$2DFF                 ;00AE62|        |      ;
                       dw $42B1,$69B1,$8CB1                 ;00AE68|        |      ;
                       dw $C2B1,$ECB1,$22B1                 ;00AE6E|        |      ;
                       dw $3CB2,$4EB2,$FFB2                 ;00AE74|        |      ;
                       dw $DBFF,$F7AF,$3CAF                 ;00AE7A|        |      ;
                       dw $61B0,$82B0,$A1B0                 ;00AE80|        |      ;
                       dw $C6B0,$ECB0,$FBB0                 ;00AE86|        |      ;
                       dw $FFB0                             ;00AE8C|        |      ;
                       db $FF,$88,$B2,$AD,$B2               ;00AE8E|        |      ;
                       db $F2,$B2,$17,$B3,$33               ;00AE93|        |      ;
                       db $B3,$53,$B3,$7D,$B3               ;00AE98|        |      ;
                       db $A2,$B3,$B1,$B3,$FF               ;00AE9D|        |      ;
                       dw $23FF                             ;00AEA2|        |      ;
                       db $D0,$00,$05,$00,$FE               ;00AEA4|        |      ;
                       db $23,$D8,$00,$05,$00               ;00AEA9|        |      ;
                       db $FF,$23,$D8,$00,$04               ;00AEAE|        |      ;
                       db $00,$FE,$23,$E0,$00               ;00AEB3|        |      ;
                       db $04,$00,$FF,$23,$DB               ;00AEB8|        |      ;
                       db $00,$04,$00,$FE,$23               ;00AEBD|        |      ;
                       db $E3,$00,$04,$00,$FF               ;00AEC2|        |      ;
                       db $20,$83,$00,$1A,$00               ;00AEC7|        |      ;
                       db $FE,$20,$A3,$00,$1A               ;00AECC|        |      ;
                       db $00,$FF,$20,$C3,$00               ;00AED1|        |      ;
                       db $1A,$00,$FE,$20,$E3               ;00AED6|        |      ;
                       db $00,$1A,$00,$FF,$20               ;00AEDB|        |      ;
 
                       db $C3,$00,$1A,$00,$FE               ;00AEE0|        |      ;
                       db $20,$E3,$00,$1A,$00               ;00AEE5|        |      ;
                       db $FF,$21,$14,$00,$09               ;00AEEA|        |      ;
                       db $00,$FE,$21,$34,$00               ;00AEEF|        |      ;
                       db $09,$00,$FF,$21,$03               ;00AEF4|        |      ;
                       db $00,$1A,$00,$FE,$21               ;00AEF9|        |      ;
                       db $23,$00,$1A,$00,$FF               ;00AEFE|        |      ;
 
                       db $21,$54,$00,$09,$00               ;00AF03|        |      ;
                       db $FE,$21,$74,$00,$09               ;00AF08|        |      ;
                       db $00,$FF,$21,$43,$00               ;00AF0D|        |      ;
                       db $1A,$00,$FE,$21,$63               ;00AF12|        |      ;
                       db $00,$1A,$00,$FF,$21               ;00AF17|        |      ;
                       db $94,$00,$09,$00,$FE               ;00AF1C|        |      ;
                       db $21,$B4,$00,$09,$00               ;00AF21|        |      ;
                       db $FF,$21,$83,$00,$09               ;00AF26|        |      ;
                       db $00,$FE,$21,$9C,$00               ;00AF2B|        |      ;
                       db $01,$00,$FE,$21,$A3               ;00AF30|        |      ;
                       db $00,$09,$00,$FE,$21               ;00AF35|        |      ;
 
                       db $BC,$00,$01,$00,$FF               ;00AF3A|        |      ;
                       db $21,$90,$00,$0D,$00               ;00AF3F|        |      ;
                       db $FE,$21,$B0,$00,$0D               ;00AF44|        |      ;
                       db $00,$FF,$21,$D4,$00               ;00AF49|        |      ;
                       db $09,$00,$FE,$21,$F4               ;00AF4E|        |      ;
                       db $00,$09,$00,$FF,$21               ;00AF53|        |      ;
                       db $C3,$00,$09,$00,$FE               ;00AF58|        |      ;
                       db $21,$DC,$00,$01,$00               ;00AF5D|        |      ;
                       db $FE,$21,$E3,$00,$09               ;00AF62|        |      ;
 
                       db $00,$FE,$21,$FC,$00               ;00AF67|        |      ;
                       db $01,$00,$FF,$21,$D0               ;00AF6C|        |      ;
                       db $00,$0D,$00,$FE,$21               ;00AF71|        |      ;
                       db $F0,$00,$0D,$00,$FF               ;00AF76|        |      ;
                       db $22,$03,$00,$1A,$00               ;00AF7B|        |      ;
                       db $FE,$22,$23,$00,$1A               ;00AF80|        |      ;
                       db $00,$FF,$22,$03,$00               ;00AF85|        |      ;
                       db $09,$00,$FE,$22,$1C               ;00AF8A|        |      ;
                       db $00,$01,$00,$FE,$22               ;00AF8F|        |      ;
                       db $23,$00,$09,$00,$FE               ;00AF94|        |      ;
                       db $22,$3C,$00,$01,$00               ;00AF99|        |      ;
                       db $FF,$22,$10,$00,$0D               ;00AF9E|        |      ;
                       db $00,$FE,$22,$30,$00               ;00AFA3|        |      ;
                       db $0D,$00,$FF,$22,$43               ;00AFA8|        |      ;
                       db $00,$1A,$00,$FE,$22               ;00AFAD|        |      ;
 
                       db $63,$00,$1A,$00,$FF               ;00AFB2|        |      ;
                       db $22,$43,$00,$09,$00               ;00AFB7|        |      ;
                       db $FE,$22,$5C,$00,$01               ;00AFBC|        |      ;
                       db $00,$FE,$22,$63,$00               ;00AFC1|        |      ;
                       db $09,$00,$FE,$22,$7C               ;00AFC6|        |      ;
                       db $00,$01,$00,$FF,$22               ;00AFCB|        |      ;
                       db $50,$00,$0D,$00,$FE               ;00AFD0|        |      ;
                       db $22,$70,$00,$0D,$00               ;00AFD5|        |      ;
                       db $FF,$23,$20,$00,$0C               ;00AFDA|        |      ;
                       db $00,$80,$14,$7A,$00               ;00AFDF|        |      ;
                       db $45,$82,$45,$82,$00               ;00AFE4|        |      ;
                       db $00,$45,$44,$45,$46               ;00AFE9|        |      ;
                       db $56,$46,$00,$46,$56               ;00AFEE|        |      ;
                       db $00,$00,$00,$FF,$23               ;00AFF3|        |      ;
                       db $40,$80,$40,$00,$00               ;00AFF8|        |      ;
                       db $7A,$7A,$5F,$5F,$6F               ;00AFFD|        |      ;
                       db $5F,$00,$00,$81,$82               ;00B002|        |      ;
 
                       db $82,$00,$8B,$64,$80               ;00B007|        |      ;
                       db $80,$82,$00,$8B,$80               ;00B00C|        |      ;
                       db $90,$91,$45,$79,$9B               ;00B011|        |      ;
                       db $7A,$00,$46,$00,$00               ;00B016|        |      ;
                       db $00,$00,$5F,$6F,$5F               ;00B01B|        |      ;
 
                       db $7A,$7A,$6F,$5F,$00               ;00B020|        |      ;
                       db $91,$8B,$90,$00,$00               ;00B025|        |      ;
                       db $00,$91,$8B,$90,$00               ;00B02A|        |      ;
                       db $00,$64,$00,$00,$00               ;00B02F|        |      ;
                       db $00,$AB,$00,$AC,$00               ;00B034|        |      ;
                       db $00,$00,$FF,$23,$80               ;00B039|        |      ;
                       db $80,$20,$00,$00,$7A               ;00B03E|        |      ;
                       db $7A,$6F,$5F,$6F,$5F               ;00B043|        |      ;
                       db $7A,$6F,$5F,$7A,$5F               ;00B048|        |      ;
                       db $7A,$7A,$8A,$89,$8A               ;00B04D|        |      ;
                       db $89,$89,$8A,$8A,$7A               ;00B052|        |      ;
                       db $79,$8E,$7A,$8E,$79               ;00B057|        |      ;
                       db $8E,$7A,$00,$00,$FF               ;00B05C|        |      ;
                       db $20,$00,$80,$0E,$7C               ;00B061|        |      ;
                       db $7C,$7F,$7F,$7F,$7F               ;00B066|        |      ;
                       db $7F,$7F,$7F,$7F,$7F               ;00B06B|        |      ;
                       db $7F,$7E,$7D,$00,$10               ;00B070|        |      ;
                       db $7F,$00,$02,$7C,$00               ;00B075|        |      ;
                       db $0D,$00,$80,$03,$BF               ;00B07A|        |      ;
                       db $00,$00,$FF,$20,$40               ;00B07F|        |      ;
 
                       db $00,$0E,$00,$80,$01               ;00B084|        |      ;
                       db $BF,$00,$20,$00,$80               ;00B089|        |      ;
                       db $11,$BF,$00,$81,$81               ;00B08E|        |      ;
                       db $79,$45,$44,$7A,$00               ;00B093|        |      ;
                       db $00,$79,$45,$44,$79               ;00B098|        |      ;
                       db $7A,$00,$00,$FF,$20               ;00B09D|        |      ;
                       db $90,$80,$0C,$BF,$00               ;00B0A2|        |      ;
                       db $64,$90,$91,$90,$00               ;00B0A7|        |      ;
                       db $00,$87,$88,$91,$90               ;00B0AC|        |      ;
                       db $00,$15,$00,$80,$0F               ;00B0B1|        |      ;
                       db $BF,$00,$00,$00,$00               ;00B0B6|        |      ;
                       db $87,$88,$97,$98,$00               ;00B0BB|        |      ;
                       db $99,$9A,$00,$00,$00               ;00B0C0|        |      ;
                       db $FF,$20,$C0,$00,$0E               ;00B0C5|        |      ;
                       db $00,$80,$10,$7C,$7C               ;00B0CA|        |      ;
                       db $00,$00,$BF,$00,$AA               ;00B0CF|        |      ;
                       db $A9,$A7,$A8,$A7,$A8               ;00B0D4|        |      ;
                       db $A5,$A9,$AA,$A5,$00               ;00B0D9|        |      ;
                       db $10,$00,$80,$06,$7C               ;00B0DE|        |      ;
                       db $7C,$00,$00,$00,$BF               ;00B0E3|        |      ;
                       db $00,$0C,$00,$FF,$21               ;00B0E8|        |      ;
                       db $00,$00,$0E,$00,$00               ;00B0ED|        |      ;
                       db $02,$7C,$00,$0E,$7F               ;00B0F2|        |      ;
                       db $00,$02,$7C,$FF,$23               ;00B0F7|        |      ;
                       db $F0,$80,$10,$55,$55               ;00B0FC|        |      ;
                       db $55,$55,$55,$55,$55               ;00B101|        |      ;
                       db $11,$05,$05,$05,$09               ;00B106|        |      ;
                       db $0A,$06,$05,$01,$FE               ;00B10B|        |      ;
                       db $23,$C0,$80,$18,$00               ;00B110|        |      ;
                       db $00,$00,$00,$50,$50               ;00B115|        |      ;
                       db $50,$10,$00,$00,$00               ;00B11A|        |      ;
                       db $00,$08,$FE,$FB,$32               ;00B11F|        |      ;
                       db $00,$00,$00,$00,$00               ;00B124|        |      ;
                       db $00,$00,$00,$FF,$22               ;00B129|        |      ;
                       db $60,$00,$13,$00,$80               ;00B12E|        |      ;
                       db $0D,$81,$45,$44,$A2               ;00B133|        |      ;
                       db $A3,$00,$83,$84,$85               ;00B138|        |      ;
                       db $86,$A3,$00,$00,$FF               ;00B13D|        |      ;
                       db $22,$80,$00,$12,$00               ;00B142|        |      ;
                       db $80,$0C,$81,$65,$80               ;00B147|        |      ;
                       db $80,$A2,$A3,$00,$96               ;00B14C|        |      ;
                       db $94,$95,$96,$A3,$00               ;00B151|        |      ;
                       db $14,$00,$80,$0E,$65               ;00B156|        |      ;
                       db $80,$80,$80,$A2,$A3               ;00B15B|        |      ;
                       db $A4,$A6,$A4,$94,$A6               ;00B160|        |      ;
                       db $B3,$00,$00,$FF,$22               ;00B165|        |      ;
                       db $C0,$00,$12,$00,$80               ;00B16A|        |      ;
                       db $0C,$92,$BA,$BB,$BC               ;00B16F|        |      ;
 
                       db $B2,$B3,$A4,$A6,$B4               ;00B174|        |      ;
                       db $B5,$A6,$A3,$00,$05               ;00B179|        |      ;
                       db $00,$80,$07,$81,$45               ;00B17E|        |      ;
 
                       db $44,$45,$44,$45,$81               ;00B183|        |      ;
 
                       db $00,$16,$00,$FF,$23               ;00B188|        |      ;
                       db $00,$00,$03,$00,$80               ;00B18D|        |      ;
                       db $08,$91,$90,$91,$92               ;00B192|        |      ;
                       db $80,$80,$82,$79,$00               ;00B197|        |      ;
                       db $05,$00,$80,$05,$7F               ;00B19C|        |      ;
                       db $7F,$7F,$7E,$7D,$00               ;00B1A1|        |      ;
                       db $09,$7F,$80,$0E,$7C               ;00B1A6|        |      ;
                       db $7C,$00,$00,$00,$A1               ;00B1AB|        |      ;
 
                       db $00,$A1,$00,$00,$91               ;00B1B0|        |      ;
                       db $80,$8B,$7A,$00,$06               ;00B1B5|        |      ;
                       db $00,$80,$01,$7E,$00               ;00B1BA|        |      ;
 
                       db $0D,$00,$FF,$23,$40               ;00B1BF|        |      ;
                       db $80,$0C,$00,$00,$00               ;00B1C4|        |      ;
                       db $B1,$B0,$B1,$A0,$A0               ;00B1C9|        |      ;
                       db $00,$B0,$00,$A0,$00               ;00B1CE|        |      ;
                       db $05,$00,$80,$01,$BF               ;00B1D3|        |      ;
                       db $00,$1E,$00,$80,$01               ;00B1D8|        |      ;
                       db $BF,$00,$07,$00,$80               ;00B1DD|        |      ;
                       db $08,$8C,$8D,$8D,$8F               ;00B1E2|        |      ;
                       db $8C,$00,$00,$00,$FF               ;00B1E7|        |      ;
                       db $23,$80,$00,$02,$7C               ;00B1EC|        |      ;
                       db $00,$0A,$7F,$80,$11               ;00B1F1|        |      ;
                       db $7E,$7D,$7F,$7F,$00               ;00B1F6|        |      ;
                       db $81,$44,$B7,$B8,$B7               ;00B1FB|        |      ;
                       db $45,$81,$9C,$9D,$9E               ;00B200|        |      ;
                       db $9F,$9C,$00,$10,$00               ;00B205|        |      ;
                       db $80,$01,$BF,$00,$03               ;00B20A|        |      ;
                       db $00,$80,$0F,$64,$8B               ;00B20F|        |      ;
                       db $B7,$B9,$B7,$8B,$64               ;00B214|        |      ;
                       db $81,$AD,$AE,$AF,$AD               ;00B219|        |      ;
                       db $00,$00,$00,$FF,$20               ;00B21E|        |      ;
                       db $00,$00,$0E,$00,$80               ;00B223|        |      ;
                       db $12,$BF,$00,$00,$00               ;00B228|        |      ;
                       db $00,$B7,$00,$B7,$81               ;00B22D|        |      ;
                       db $BD,$BD,$00,$BE,$75               ;00B232|        |      ;
                       db $BD,$00,$00,$00,$FF               ;00B237|        |      ;
                       db $20,$20,$00,$0F,$00               ;00B23C|        |      ;
                       db $80,$01,$BF,$00,$1E               ;00B241|        |      ;
                       db $00,$00,$10,$7F,$00               ;00B246|        |      ;
                       db $02,$7C,$FF,$23,$E0               ;00B24B|        |      ;
                       db $80,$20,$00,$00,$00               ;00B250|        |      ;
                       db $00,$C0,$F0,$F0,$30               ;00B255|        |      ;
                       db $50,$50,$50,$10,$CC               ;00B25A|        |      ;
                       db $FF,$FF,$33,$55,$D5               ;00B25F|        |      ;
                       db $D5,$11,$80,$A0,$A0               ;00B264|        |      ;
                       db $20,$00,$00,$00,$00               ;00B269|        |      ;
                       db $0F,$0B,$0A,$02,$FE               ;00B26E|        |      ;
                       db $23,$C0,$80,$10,$00               ;00B273|        |      ;
                       db $00,$00,$00,$0F,$0B               ;00B278|        |      ;
                       db $0A,$02,$00,$00,$00               ;00B27D|        |      ;
                       db $00,$00,$00,$00,$00               ;00B282|        |      ;
                       db $FF,$22,$E0,$80,$20               ;00B287|        |      ;
                       db $00,$00,$7A,$4B,$4F               ;00B28C|        |      ;
                       db $00,$4E,$4C,$4F,$4D               ;00B291|        |      ;
                       db $4A,$49,$4F,$7A,$00               ;00B296|        |      ;
                       db $4A,$67,$4C,$4E,$4F               ;00B29B|        |      ;
                       db $4F,$47,$4E,$4C,$B8               ;00B2A0|        |      ;
                       db $B8,$83,$93,$86,$B8               ;00B2A5|        |      ;
                       db $00,$00,$FF,$23,$00               ;00B2AA|        |      ;
                       db $80,$40,$00,$00,$4B               ;00B2AF|        |      ;
                       db $4B,$57,$5D,$5E,$00               ;00B2B4|        |      ;
                       db $58,$59,$5A,$5B,$58               ;00B2B9|        |      ;
                       db $00,$00,$00,$69,$58               ;00B2BE|        |      ;
                       db $5E,$69,$57,$6E,$4A               ;00B2C3|        |      ;
                       db $57,$93,$B8,$4B,$A1               ;00B2C8|        |      ;
                       db $4B,$93,$00,$00,$00               ;00B2CD|        |      ;
                       db $00,$6A,$66,$68,$79               ;00B2D2|        |      ;
                       db $6E,$6C,$69,$6A,$6A               ;00B2D7|        |      ;
                       db $66,$4B,$7A,$00,$00               ;00B2DC|        |      ;
 
                       db $75,$7A,$6E,$75,$68               ;00B2E1|        |      ;
                       db $59,$5A,$5B,$00,$4B               ;00B2E6|        |      ;
                       db $4B,$B1,$4B,$4B,$00               ;00B2EB|        |      ;
                       db $00,$FF,$23,$40,$80               ;00B2F0|        |      ;
                       db $20,$00,$00,$4C,$49               ;00B2F5|        |      ;
                       db $6D,$5C,$6B,$7B,$49               ;00B2FA|        |      ;
                       db $48,$4D,$58,$4B,$4B               ;00B2FF|        |      ;
                       db $00,$00,$00,$4F,$49               ;00B304|        |      ;
                       db $5C,$6D,$69,$6A,$6B               ;00B309|        |      ;
                       db $00,$4B,$76,$77,$78               ;00B30E|        |      ;
                       db $00,$00,$00,$FF,$23               ;00B313|        |      ;
                       db $80,$00,$02,$7C,$00               ;00B318|        |      ;
                       db $11,$7F,$80,$02,$7E               ;00B31D|        |      ;
                       db $7D,$00,$09,$7F,$00               ;00B322|        |      ;
                       db $02,$7C,$00,$12,$00               ;00B327|        |      ;
                       db $80,$01,$7E,$00,$0D               ;00B32C|        |      ;
                       db $00,$FF,$20,$00,$00               ;00B331|        |      ;
                       db $11,$00,$80,$01,$BF               ;00B336|        |      ;
                       db $00,$10,$00,$80,$09               ;00B33B|        |      ;
                       db $41,$42,$41,$42,$42               ;00B340|        |      ;
                       db $43,$44,$45,$7A,$00               ;00B345|        |      ;
                       db $05,$00,$80,$01,$BF               ;00B34A|        |      ;
                       db $00,$0F,$00,$FF,$20               ;00B34F|        |      ;
                       db $40,$80,$10,$00,$00               ;00B354|        |      ;
                       db $40,$55,$63,$54,$40               ;00B359|        |      ;
                       db $52,$53,$54,$55,$82               ;00B35E|        |      ;
                       db $7A,$00,$00,$BF,$00               ;00B363|        |      ;
                       db $12,$00,$80,$0D,$50               ;00B368|        |      ;
 
                       db $51,$50,$60,$50,$00               ;00B36D|        |      ;
                       db $61,$00,$62,$64,$00               ;00B372|        |      ;
                       db $00,$BF,$00,$11,$00               ;00B377|        |      ;
                       db $FF,$20,$80,$80,$12               ;00B37C|        |      ;
                       db $00,$00,$72,$74,$72               ;00B381|        |      ;
                       db $74,$72,$70,$71,$74               ;00B386|        |      ;
                       db $72,$74,$00,$BF,$00               ;00B38B|        |      ;
                       db $00,$7C,$7C,$00,$1A               ;00B390|        |      ;
                       db $00,$80,$06,$BF,$00               ;00B395|        |      ;
                       db $00,$00,$7C,$7C,$00               ;00B39A|        |      ;
                       db $0E,$00,$FF,$20,$C0               ;00B39F|        |      ;
                       db $00,$02,$7C,$00,$0E               ;00B3A4|        |      ;
                       db $7F,$00,$02,$7C,$00               ;00B3A9|        |      ;
                       db $0E,$00,$FF,$23,$E8               ;00B3AE|        |      ;
                       db $80,$18,$D0,$50,$50               ;00B3B3|        |      ;
                       db $90,$A0,$A0,$F0,$B0               ;00B3B8|        |      ;
                       db $4D,$55,$55,$BB,$AA               ;00B3BD|        |      ;
                       db $AA,$3F,$8B,$00,$00               ;00B3C2|        |      ;
                       db $00,$00,$00,$00,$00               ;00B3C7|        |      ;
                       db $00,$FE,$23,$C0,$80               ;00B3CC|        |      ;
 
                       db $10,$FF,$FF,$FF,$33               ;00B3D1|        |      ;
                       db $00,$00,$00,$00,$0F               ;00B3D6|        |      ;
                       db $0F,$0F,$00,$00,$00               ;00B3DB|        |      ;
                       db $00,$00,$FF                       ;00B3E0|        |      ;
 
          CODE_00B3E3: LDA.B #$00                           ;00B3E3|A900    |      ;
                       STA.B r_MusicLoaded                  ;00B3E5|8574    |000074;
                       db $4C                               ;00B3E7|        |      ;
 
                       dw UNREACH_0FE795                    ;00B3E8|        |0FE795;
                       LDA.B r_MenuOptionIdxSelected        ;00B3EA|A56B    |00006B;
                       db $20                               ;00B3EC|        |      ;
                       dw jumpFromStackYXpreserved          ;00B3ED|        |0FE86D;
                       dw DATA8_00B413                      ;00B3EF|        |00B413;
                       dw DATA8_00B413                      ;00B3F1|        |00B413;
                       dw CODE_00B41F                       ;00B3F3|        |00B41F;
                       dw CODE_00B436                       ;00B3F5|        |00B436;
                       dw CODE_00B49A                       ;00B3F7|        |00B49A;
                       dw CODE_00B4CE                       ;00B3F9|        |00B4CE;
                       dw CODE_00B4EB                       ;00B3FB|        |00B4EB;
                       dw CODE_00B501                       ;00B3FD|        |00B501;
                       dw CODE_00B50C                       ;00B3FF|        |00B50C;
                       dw CODE_00B51C                       ;00B401|        |00B51C;
                       dw CODE_00B536                       ;00B403|        |00B536;
                       dw CODE_00B561                       ;00B405|        |00B561;
 
          CODE_00B407: LDA.B #$01                           ;00B407|A901    |      ;
                       STA.B $78                            ;00B409|8578    |000078;
                       db $20                               ;00B40B|        |      ;
                       dw UNREACH_0FE6C5                    ;00B40C|        |0FE6C5;
                       LDA.B #$00                           ;00B40E|A900    |      ;
                       STA.B $78                            ;00B410|8578    |000078;
                       RTS                                  ;00B412|60      |      ;
 
 
         DATA8_00B413: db $20                               ;00B413|        |      ;
                       dw setBank_c000_1E                   ;00B414|        |0FE2DA;
                       JSR.W CODE_00B3E3                    ;00B416|20E3B3  |00B3E3;
                       db $20                               ;00B419|        |      ;
                       dw UNREACH_0FE5CE                    ;00B41A|        |0FE5CE;
                       INC.B r_MenuOptionIdxSelected        ;00B41C|E66B    |00006B;
                       RTS                                  ;00B41E|60      |      ;
 
 
          CODE_00B41F: JSR.W CODE_00B83A                    ;00B41F|203AB8  |00B83A;
                       JSR.W CODE_00B7B0                    ;00B422|20B0B7  |00B7B0;
                       LDA.B #$00                           ;00B425|A900    |      ;
                       JSR.W CODE_00B71D                    ;00B427|201DB7  |00B71D;
                       INC.B r_MenuOptionIdxSelected        ;00B42A|E66B    |00006B;
                       RTS                                  ;00B42C|60      |      ;
 
 
          CODE_00B42D: LDA.B #$00                           ;00B42D|A900    |      ;
                       STA.B r_CurrScrollOffsetIntoRoomScreen;00B42F|8556    |000056;
 
                       LDA.B #$02                           ;00B431|A902    |      ;
                       STA.B r_CurrScrollRoomScreen         ;00B433|8557    |000057;
                       RTS                                  ;00B435|60      |      ;
 
 
          CODE_00B436: JSR.W CODE_008F0B                    ;00B436|200B8F  |008F0B;
                       JSR.W CODE_00B42D                    ;00B439|202DB4  |00B42D;
                       JSR.W CODE_00B407                    ;00B43C|2007B4  |00B407;
                       JSR.W CODE_00B83A                    ;00B43F|203AB8  |00B83A;
 
                       LDA.W r_PlayerStateDoubled           ;00B442|AD6505  |000565;
                       CMP.B #$02                           ;00B445|C902    |      ;
                       BEQ CODE_00B44A                      ;00B447|F001    |00B44A;
 
          CODE_00B449: RTS                                  ;00B449|60      |      ;
 
 
          CODE_00B44A: LDA.W r_EntityObjectIdxes            ;00B44A|AD4E05  |00054E;
                       CMP.B #$02                           ;00B44D|C902    |      ;
                       BNE CODE_00B455                      ;00B44F|D004    |00B455;
                       LDX.B #$0C                           ;00B451|A20C    |      ;
                       BNE CODE_00B457                      ;00B453|D002    |00B457;
 
          CODE_00B455: LDX.B #$10                           ;00B455|A210    |      ;
 
          CODE_00B457: STX.B r_CurrNumToVramQueue           ;00B457|8608    |000008;
                       LDX.B #$F0                           ;00B459|A2F0    |      ;
                       LDA.B #$FB                           ;00B45B|A9FB    |      ;
                       db $20                               ;00B45D|        |      ;
                       dw UNREACH_0FFCDD                    ;00B45E|        |0FFCDD;
                       BNE CODE_00B449                      ;00B460|D0E7    |00B449;
                       LDX.B #$F0                           ;00B462|A2F0    |      ;
                       LDA.B #$05                           ;00B464|A905    |      ;
                       db $20                               ;00B466|        |      ;
                       dw UNREACH_0FFCDD                    ;00B467|        |0FFCDD;
                       BNE CODE_00B449                      ;00B469|D0DE    |00B449;
                       LDX.B r_CurrNumToVramQueue           ;00B46B|A608    |000008;
                       LDA.B #$FB                           ;00B46D|A9FB    |      ;
                       db $20                               ;00B46F|        |      ;
                       dw UNREACH_0FFCDD                    ;00B470|        |0FFCDD;
                       BNE CODE_00B47E                      ;00B472|D00A    |00B47E;
                       LDA.B #$05                           ;00B474|A905    |      ;
                       LDX.B r_CurrNumToVramQueue           ;00B476|A608    |000008;
 
                       db $20                               ;00B478|        |      ;
                       dw UNREACH_0FFCDD                    ;00B479|        |0FFCDD;
                       BNE CODE_00B47E                      ;00B47B|D001    |00B47E;
                       RTS                                  ;00B47D|60      |      ;
 
 
          CODE_00B47E: LDA.B #$00                           ;00B47E|A900    |      ;
                       STA.B r_TimerDropClunk               ;00B480|85B9    |0000B9;
 
                       STA.W $0413                          ;00B482|8D1304  |000413;
                       STA.W $0414                          ;00B485|8D1404  |000414;
 
                       STA.W $0415                          ;00B488|8D1504  |000415;
                       STA.W $0416                          ;00B48B|8D1604  |000416;
 
                       STA.W $0562                          ;00B48E|8D6205  |000562;
 
                       STA.W $0563                          ;00B491|8D6305  |000563;
                       STA.W $0564                          ;00B494|8D6405  |000564;
                       INC.B r_MenuOptionIdxSelected        ;00B497|E66B    |00006B;
                       RTS                                  ;00B499|60      |      ;
 
 
          CODE_00B49A: LDA.W r_EntityXPos                   ;00B49A|AD3804  |000438;
                       CMP.B #$D0                           ;00B49D|C9D0    |      ;
                       BCS CODE_00B4BC                      ;00B49F|B01B    |00B4BC;
                       JSR.W CODE_00B7EE                    ;00B4A1|20EEB7  |00B7EE;
                       BCS CODE_00B4B0                      ;00B4A4|B00A    |00B4B0;
                       LDA.W r_EntityObjectIdxes,X          ;00B4A6|BD4E05  |00054E;
                       CMP.B #$05                           ;00B4A9|C905    |      ;
                       BEQ CODE_00B4BC                      ;00B4AB|F00F    |00B4BC;
                       JSR.W DATA8_00B716                   ;00B4AD|2016B7  |00B716;
 
          CODE_00B4B0: JSR.W CODE_00B72A                    ;00B4B0|202AB7  |00B72A;
                       JSR.W CODE_00B42D                    ;00B4B3|202DB4  |00B42D;
                       JSR.W CODE_00B407                    ;00B4B6|2007B4  |00B407;
                       JMP.W CODE_00B83A                    ;00B4B9|4C3AB8  |00B83A;
 
 
          CODE_00B4BC: JSR.W CODE_00B83A                    ;00B4BC|203AB8  |00B83A;
                       LDA.B #$02                           ;00B4BF|A902    |      ;
                       STA.W r_OamSpecIdxDoubled            ;00B4C1|8D0004  |000400;
                       JSR.W CODE_00B8A5                    ;00B4C4|20A5B8  |00B8A5;
                       LDA.B #$10                           ;00B4C7|A910    |      ;
                       STA.B r_GenericStateTimer            ;00B4C9|8530    |000030;
                       JMP.W CODE_00B47E                    ;00B4CB|4C7EB4  |00B47E;
 
 
          CODE_00B4CE: JSR.W CODE_00B83A                    ;00B4CE|203AB8  |00B83A;
                       JSR.W DATA8_00B859                   ;00B4D1|2059B8  |00B859;
                       DEC.B r_GenericStateTimer            ;00B4D4|C630    |000030;
                       BEQ CODE_00B4D9                      ;00B4D6|F001    |00B4D9;
                       RTS                                  ;00B4D8|60      |      ;
 
 
          CODE_00B4D9: LDY.B #$00                           ;00B4D9|A000    |      ;
                       STY.W r_EffectSpeedSupGeneral        ;00B4DB|8C8507  |000785;
                       STY.W r_PWiconGeneral                ;00B4DE|8C8607  |000786;
 
                       INY                                  ;00B4E1|C8      |      ;
                       STY.W r_EffectSpeedGeneral           ;00B4E2|8C8407  |000784;
                       STY.W $0787                          ;00B4E5|8C8707  |000787;
                       INC.B r_MenuOptionIdxSelected        ;00B4E8|E66B    |00006B;
                       RTS                                  ;00B4EA|60      |      ;
 
 
          CODE_00B4EB: JSR.W CODE_00B82C                    ;00B4EB|202CB8  |00B82C;
                       JSR.W DATA8_00B859                   ;00B4EE|2059B8  |00B859;
                       JSR.W CODE_00B5F2                    ;00B4F1|20F2B5  |00B5F2;
                       JSR.W CODE_00B90E                    ;00B4F4|200EB9  |00B90E;
                       BCS CODE_00B4FA                      ;00B4F7|B001    |00B4FA;
                       RTS                                  ;00B4F9|60      |      ;
 
 
          CODE_00B4FA: LDA.B #$00                           ;00B4FA|A900    |      ;
                       STA.B $C9                            ;00B4FC|85C9    |0000C9;
                       INC.B r_MenuOptionIdxSelected        ;00B4FE|E66B    |00006B;
                       RTS                                  ;00B500|60      |      ;
 
 
          CODE_00B501: JSR.W CODE_00B82C                    ;00B501|202CB8  |00B82C;
                       JSR.W CODE_00B63E                    ;00B504|203EB6  |00B63E;
                       BCC CODE_00B50B                      ;00B507|9002    |00B50B;
                       INC.B r_MenuOptionIdxSelected        ;00B509|E66B    |00006B;
 
          CODE_00B50B: RTS                                  ;00B50B|60      |      ;
 
 
          CODE_00B50C: JSR.W CODE_00B82C                    ;00B50C|202CB8  |00B82C;
                       JSR.W CODE_00B5F2                    ;00B50F|20F2B5  |00B5F2;
                       JSR.W DATA8_00D5C3                   ;00B512|20C3D5  |00D5C3;
                       LDA.B #$03                           ;00B515|A903    |      ;
                       STA.B r_FrameStartChrBankOverrideIdx ;00B517|8572    |000072;
                       INC.B r_MenuOptionIdxSelected        ;00B519|E66B    |00006B;
                       RTS                                  ;00B51B|60      |      ;
 
 
          CODE_00B51C: JSR.W CODE_00B82C                    ;00B51C|202CB8  |00B82C;
                       JSR.W CODE_00B5F2                    ;00B51F|20F2B5  |00B5F2;
                       JSR.W CODE_00B5DE                    ;00B522|20DEB5  |00B5DE;
                       LDA.B r_FloodHight                   ;00B525|A5CA    |0000CA;
 
                       CMP.B #$A0                           ;00B527|C9A0    |      ;
                       BCS CODE_00B535                      ;00B529|B00A    |00B535;
                       JSR.W CODE_00B79D                    ;00B52B|209DB7  |00B79D;
                       LDA.B #$06                           ;00B52E|A906    |      ;
                       JSR.W CODE_00B71D                    ;00B530|201DB7  |00B71D;
                       INC.B r_MenuOptionIdxSelected        ;00B533|E66B    |00006B;
 
          CODE_00B535: RTS                                  ;00B535|60      |      ;
 
 
          CODE_00B536: JSR.W CODE_00B5F2                    ;00B536|20F2B5  |00B5F2;
                       LDA.W r_EntityXPos                   ;00B539|AD3804  |000438;
                       CMP.B #$E8                           ;00B53C|C9E8    |      ;
                       BCS CODE_00B557                      ;00B53E|B017    |00B557;
                       JSR.W CODE_00B7EE                    ;00B540|20EEB7  |00B7EE;
                       BCS CODE_00B54B                      ;00B543|B006    |00B54B;
                       LDA.W r_EntityObjectIdxes,X          ;00B545|BD4E05  |00054E;
                       JSR.W DATA8_00B716                   ;00B548|2016B7  |00B716;
 
          CODE_00B54B: JSR.W CODE_00B72A                    ;00B54B|202AB7  |00B72A;
                       JSR.W CODE_00B42D                    ;00B54E|202DB4  |00B42D;
                       JSR.W CODE_00B407                    ;00B551|2007B4  |00B407;
                       JMP.W CODE_00B82C                    ;00B554|4C2CB8  |00B82C;
 
 
          CODE_00B557: JSR.W CODE_00B82C                    ;00B557|202CB8  |00B82C;
                       LDA.B #$02                           ;00B55A|A902    |      ;
                       STA.B r_CounterUntilCanShowSprBg     ;00B55C|851C    |00001C;
                       INC.B r_MenuOptionIdxSelected        ;00B55E|E66B    |00006B;
                       RTS                                  ;00B560|60      |      ;
 
 
          CODE_00B561: LDA.B #$02                           ;00B561|A902    |      ;
                       STA.B r_CounterUntilCanShowSprBg     ;00B563|851C    |00001C;
                       db $20                               ;00B565|        |      ;
                       dw UNREACH_0FE5CA                    ;00B566|        |0FE5CA;
                       JSR.W CODE_00B3E3                    ;00B568|20E3B3  |00B3E3;
                       LDA.B #$00                           ;00B56B|A900    |      ;
                       STA.B r_BaseIRQFuncIdx               ;00B56D|853F    |00003F;
                       STA.B r_IRQFuncDrawIdx               ;00B56F|856D    |00006D;
                       LDA.B #$40                           ;00B571|A940    |      ;
                       STA.B r_BossHealth                   ;00B573|853D    |00003D;
                       db $20                               ;00B575|        |      ;
                       dw UNREACH_0FFB85                    ;00B576|        |0FFB85;
                       INC.B r_CurrRoomSectionBlock         ;00B578|E633    |000033;
                       LDA.B #$00                           ;00B57A|A900    |      ;
                       STA.B r_CurrRoomIdx                  ;00B57C|8534    |000034;
                       LDA.B #$01                           ;00B57E|A901    |      ;
                       STA.B r_InGameSubstate               ;00B580|852A    |00002A;
                       RTS                                  ;00B582|60      |      ;
 
                       LDA.B r_DeathDelay                   ;00B583|A5BF    |0000BF;
 
                       BNE CODE_00B5ED                      ;00B585|D066    |00B5ED;
                       LDA.B r_FloodHight                   ;00B587|A5CA    |0000CA;
                       CMP.B #$32                           ;00B589|C932    |      ;
                       BCC CODE_00B599                      ;00B58B|900C    |00B599;
 
                       LDA.W r_EntityYPos                   ;00B58D|AD1C04  |00041C;
                       SEC                                  ;00B590|38      |      ;
                       SBC.B #$10                           ;00B591|E910    |      ;
                       BCC CODE_00B5CD                      ;00B593|9038    |00B5CD;
 
                       CMP.B r_FloodHight                   ;00B595|C5CA    |0000CA;
                       BCC CODE_00B5CD                      ;00B597|9034    |00B5CD;
 
          CODE_00B599: LDA.W r_PlayerStateDoubled           ;00B599|AD6505  |000565;
                       CMP.B #$08                           ;00B59C|C908    |      ;
                       BEQ DATA8_00B5C7                     ;00B59E|F027    |00B5C7;
                       CMP.B #$0C                           ;00B5A0|C90C    |      ;
                       BEQ DATA8_00B5C7                     ;00B5A2|F023    |00B5C7;
                       CMP.B #$1A                           ;00B5A4|C91A    |      ;
                       BEQ DATA8_00B5C7                     ;00B5A6|F01F    |00B5C7;
                       CMP.B #$22                           ;00B5A8|C922    |      ;
                       BEQ DATA8_00B5C7                     ;00B5AA|F01B    |00B5C7;
                       CMP.B #$0C                           ;00B5AC|C90C    |      ;
                       BEQ DATA8_00B5C7                     ;00B5AE|F017    |00B5C7;
                       CMP.B #$2C                           ;00B5B0|C92C    |      ;
                       BEQ DATA8_00B5C7                     ;00B5B2|F013    |00B5C7;
                       CMP.B #$26                           ;00B5B4|C926    |      ;
                       BNE CODE_00B5BD                      ;00B5B6|D005    |00B5BD;
                       LDA.W r_TimerBatRiverSwap            ;00B5B8|AD0206  |000602;
                       BEQ DATA8_00B5C7                     ;00B5BB|F00A    |00B5C7;
 
          CODE_00B5BD: LDA.B #$2E                           ;00B5BD|A92E    |      ;
                       STA.W r_PlayerStateDoubled           ;00B5BF|8D6505  |000565;
                       LDA.B #$80                           ;00B5C2|A980    |      ;
                       STA.B r_DeathDelay                   ;00B5C4|85BF    |0000BF;
                       RTS                                  ;00B5C6|60      |      ;
 
 
         DATA8_00B5C7: db $20                               ;00B5C7|        |      ;
                       dw UNREACH_0FE5AF                    ;00B5C8|        |0FE5AF;
                       JMP.W CODE_00B5BD                    ;00B5CA|4CBDB5  |00B5BD;
 
 
          CODE_00B5CD: LDA.B r_FloodStop                    ;00B5CD|A5C0    |0000C0;
                       BNE CODE_00B5ED                      ;00B5CF|D01C    |00B5ED;
                       LDA.W r_HardMode                     ;00B5D1|ADF607  |0007F6;
                       BNE CODE_00B5DA                      ;00B5D4|D004    |00B5DA;
                       LDA.B #$08                           ;00B5D6|A908    |      ;
 
                       BNE CODE_00B5E0                      ;00B5D8|D006    |00B5E0;
 
          CODE_00B5DA: LDA.B #$0C                           ;00B5DA|A90C    |      ;
                       BNE CODE_00B5E0                      ;00B5DC|D002    |00B5E0;
 
          CODE_00B5DE: LDA.B #$10                           ;00B5DE|A910    |      ;
 
          CODE_00B5E0: STA.B r_DoubleCurrRoomIdx            ;00B5E0|850E    |00000E;
                       LDA.B $CB                            ;00B5E2|A5CB    |0000CB;
                       SEC                                  ;00B5E4|38      |      ;
                       SBC.B r_DoubleCurrRoomIdx            ;00B5E5|E50E    |00000E;
                       STA.B $CB                            ;00B5E7|85CB    |0000CB;
                       BCS CODE_00B5ED                      ;00B5E9|B002    |00B5ED;
                       DEC.B r_FloodHight                   ;00B5EB|C6CA    |0000CA;
 
          CODE_00B5ED: LDA.B r_FloodHight                   ;00B5ED|A5CA    |0000CA;
                       STA.B r_ScannlineTarget              ;00B5EF|8542    |000042;
                       RTS                                  ;00B5F1|60      |      ;
 
 
          CODE_00B5F2: DEC.W $0787                          ;00B5F2|CE8707  |000787;
                       BEQ CODE_00B5F8                      ;00B5F5|F001    |00B5F8;
                       RTS                                  ;00B5F7|60      |      ;
 
 
          CODE_00B5F8: LDA.B r_VramQueueNextIdxToFill       ;00B5F8|A51D    |00001D;
                       PHA                                  ;00B5FA|48      |      ;
                       JSR.W CODE_00852C                    ;00B5FB|202C85  |00852C;
                       PLA                                  ;00B5FE|68      |      ;
                       TAX                                  ;00B5FF|AA      |      ;
                       LDA.W r_PWiconGeneral                ;00B600|AD8607  |000786;
                       ASL A                                ;00B603|0A      |      ;
                       CLC                                  ;00B604|18      |      ;
                       ADC.W r_PWiconGeneral                ;00B605|6D8607  |000786;
 
          CODE_00B608: TAY                                  ;00B608|A8      |      ;
                       LDA.W DATA8_00B62F,Y                 ;00B609|B92FB6  |00B62F;
                       CMP.B #$FF                           ;00B60C|C9FF    |      ;
                       BEQ CODE_00B628                      ;00B60E|F018    |00B628;
                       STA.W $0308,X                        ;00B610|9D0803  |000308;
                       LDA.W DATA8_00B630,Y                 ;00B613|B930B6  |00B630;
 
                       STA.W $0309,X                        ;00B616|9D0903  |000309;
                       LDA.W DATA8_00B631,Y                 ;00B619|B931B6  |00B631;
                       STA.W $030A,X                        ;00B61C|9D0A03  |00030A;
                       INC.W r_PWiconGeneral                ;00B61F|EE8607  |000786;
                       LDA.B #$08                           ;00B622|A908    |      ;
                       STA.W $0787                          ;00B624|8D8707  |000787;
                       RTS                                  ;00B627|60      |      ;
 
 
          CODE_00B628: LDA.B #$00                           ;00B628|A900    |      ;
                       STA.W r_PWiconGeneral                ;00B62A|8D8607  |000786;
                       BEQ CODE_00B608                      ;00B62D|F0D9    |00B608;
 
         DATA8_00B62F: db $01                               ;00B62F|        |      ;
 
         DATA8_00B630: db $11                               ;00B630|        |      ;
 
         DATA8_00B631: db $20,$01,$31,$11,$01               ;00B631|        |      ;
                       db $11,$31,$01,$20,$11               ;00B636|        |      ;
                       db $FF                               ;00B63B|        |      ;
 
          CODE_00B63C: SEC                                  ;00B63C|38      |      ;
                       RTS                                  ;00B63D|60      |      ;
 
 
          CODE_00B63E: LDY.B #$00                           ;00B63E|A000    |      ;
                       LDA.B $C9                            ;00B640|A5C9    |0000C9;
                       CMP.B #$10                           ;00B642|C910    |      ;
                       BEQ CODE_00B63C                      ;00B644|F0F6    |00B63C;
                       LSR A                                ;00B646|4A      |      ;
                       BCC CODE_00B64B                      ;00B647|9002    |00B64B;
                       LDY.B #$05                           ;00B649|A005    |      ;
 
          CODE_00B64B: STA.B $03                            ;00B64B|8503    |000003;
                       LDA.W DATA8_00B6E0,Y                 ;00B64D|B9E0B6  |00B6E0;
                       STA.B $62                            ;00B650|8562    |000062;
                       LDA.W DATA8_00B6E1,Y                 ;00B652|B9E1B6  |00B6E1;
                       STA.B r_VramQueueDest                ;00B655|8561    |000061;
                       LDA.W DATA8_00B6E2,Y                 ;00B657|B9E2B6  |00B6E2;
                       STA.B r_RoomSectionChrBanksDataOffset;00B65A|850F    |00000F;
 
                       LDA.W DATA8_00B6E3,Y                 ;00B65C|B9E3B6  |00B6E3;
                       STA.B r_DoubleCurrRoomIdx            ;00B65F|850E    |00000E;
                       LDA.W DATA8_00B6E4,Y                 ;00B661|B9E4B6  |00B6E4;
                       STA.B $02                            ;00B664|8502    |000002;
                       LDA.B $03                            ;00B666|A503    |000003;
                       ASL A                                ;00B668|0A      |      ;
                       ASL A                                ;00B669|0A      |      ;
                       LDX.B #$61                           ;00B66A|A261    |      ;
                       db $20                               ;00B66C|        |      ;
                       dw updatePointerOffset_00            ;00B66D|        |0FE899;
                       LDA.B $03                            ;00B66F|A503    |000003;
                       LDX.B #$0E                           ;00B671|A20E    |      ;
                       db $20                               ;00B673|        |      ;
                       dw updatePointerOffset_00            ;00B674|        |0FE899;
                       LDA.B #$03                           ;00B676|A903    |      ;
                       STA.B $03                            ;00B678|8503    |000003;
 
          CODE_00B67A: LDA.B $02                            ;00B67A|A502    |000002;
                       ASL A                                ;00B67C|0A      |      ;
                       TAY                                  ;00B67D|A8      |      ;
                       LDA.W DATA8_00B6EA,Y                 ;00B67E|B9EAB6  |00B6EA;
                       STA.B r_CurrNumToVramQueue           ;00B681|8508    |000008;
                       LDA.W DATA8_00B6EB,Y                 ;00B683|B9EBB6  |00B6EB;
                       STA.B $09                            ;00B686|8509    |000009;
                       LDA.B $02                            ;00B688|A502    |000002;
                       CMP.B #$05                           ;00B68A|C905    |      ;
                       BEQ DATA8_00B699                     ;00B68C|F00B    |00B699;
                       LDA.B #$04                           ;00B68E|A904    |      ;
                       STA.B $01                            ;00B690|8501    |000001;
                       db $20                               ;00B692|        |      ;
                       dw CODE_0FE8C6                       ;00B693|        |0FE8C6;
 
          CODE_00B695: LDY.B #$00                           ;00B695|A000    |      ;
                       BEQ CODE_00B6A5                      ;00B697|F00C    |00B6A5;
 
         DATA8_00B699: db $20                               ;00B699|        |      ;
                       dw CODE_0FE8C0                       ;00B69A|        |0FE8C0;
                       LDA.B #$02                           ;00B69C|A902    |      ;
                       STA.B $01                            ;00B69E|8501    |000001;
                       BNE CODE_00B695                      ;00B6A0|D0F3    |00B695;
 
         DATA8_00B6A2: db $20                               ;00B6A2|        |      ;
                       dw CODE_0FE8BB                       ;00B6A3|        |0FE8BB;
 
          CODE_00B6A5: LDA.B #$04                           ;00B6A5|A904    |      ;
                       STA.B $00                            ;00B6A7|8500    |000000;
 
          CODE_00B6A9: LDA.B (r_CurrNumToVramQueue),Y       ;00B6A9|B108    |000008;
                       db $20                               ;00B6AB|        |      ;
                       dw CODE_0FED16                       ;00B6AC|        |0FED16;
                       INY                                  ;00B6AE|C8      |      ;
                       DEC.B $00                            ;00B6AF|C600    |000000;
                       BNE CODE_00B6A9                      ;00B6B1|D0F6    |00B6A9;
                       LDA.B #$20                           ;00B6B3|A920    |      ;
                       LDX.B #$61                           ;00B6B5|A261    |      ;
                       db $20                               ;00B6B7|        |      ;
                       dw updatePointerOffset_00            ;00B6B8|        |0FE899;
                       DEC.B $01                            ;00B6BA|C601    |000001;
                       BNE DATA8_00B6A2                     ;00B6BC|D0E4    |00B6A2;
                       LDX.B r_VramQueueNextIdxToFill       ;00B6BE|A61D    |00001D;
                       LDA.B r_DoubleCurrRoomIdx            ;00B6C0|A50E    |00000E;
                       db $20                               ;00B6C2|        |      ;
                       dw CODE_0FED16                       ;00B6C3|        |0FED16;
                       LDA.B r_RoomSectionChrBanksDataOffset;00B6C5|A50F    |00000F;
                       db $20                               ;00B6C7|        |      ;
 
                       dw CODE_0FED16                       ;00B6C8|        |0FED16;
                       LDA.B #$55                           ;00B6CA|A955    |      ;
                       db $20                               ;00B6CC|        |      ;
                       dw CODE_0FED16                       ;00B6CD|        |0FED16;
                       LDA.B #$08                           ;00B6CF|A908    |      ;
 
                       LDX.B #$0E                           ;00B6D1|A20E    |      ;
                       db $20                               ;00B6D3|        |      ;
                       dw updatePointerOffset_00            ;00B6D4|        |0FE899;
                       INC.B $02                            ;00B6D6|E602    |000002;
                       DEC.B $03                            ;00B6D8|C603    |000003;
 
                       BNE CODE_00B67A                      ;00B6DA|D09E    |00B67A;
                       INC.B $C9                            ;00B6DC|E6C9    |0000C9;
                       CLC                                  ;00B6DE|18      |      ;
                       RTS                                  ;00B6DF|60      |      ;
 
 
         DATA8_00B6E0: db $29                               ;00B6E0|        |      ;
 
         DATA8_00B6E1: db $00                               ;00B6E1|        |      ;
 
         DATA8_00B6E2: db $2B                               ;00B6E2|        |      ;
 
         DATA8_00B6E3: db $D0                               ;00B6E3|        |      ;
 
         DATA8_00B6E4: db $00,$2A,$80,$2B,$E8               ;00B6E4|        |      ;
                       db $03                               ;00B6E9|        |      ;
 
         DATA8_00B6EA: db $F6                               ;00B6EA|        |      ;
 
         DATA8_00B6EB: db $B6,$06,$B7,$06,$B7               ;00B6EB|        |      ;
                       db $06,$B7,$06,$B7,$06               ;00B6F0|        |      ;
                       db $B7,$8B,$8B,$8B,$8B               ;00B6F5|        |      ;
                       db $9B,$3D,$9B,$3D,$3D               ;00B6FA|        |      ;
                       db $9B,$3D,$9B,$3D,$3D               ;00B6FF|        |      ;
                       db $3D,$3D,$3D,$3D,$3D               ;00B704|        |      ;
 
                       db $3D,$3D,$3D,$3D,$3D               ;00B709|        |      ;
 
                       db $3D,$3D,$3D,$3D,$3D               ;00B70E|        |      ;
 
                       db $3D,$3D,$3D                       ;00B713|        |      ;
 
         DATA8_00B716: db $48                               ;00B716|        |      ;
                       LDA.B #$00                           ;00B717|A900    |      ;
                       STA.W r_EntityObjectIdxes,X          ;00B719|9D4E05  |00054E;
                       PLA                                  ;00B71C|68      |      ;
 
          CODE_00B71D: STA.W r_BGanimationTimer             ;00B71D|8D8107  |000781;
                       LDY.B #$00                           ;00B720|A000    |      ;
                       STY.W r_FogParallelPos               ;00B722|8C8207  |000782;
                       INY                                  ;00B725|C8      |      ;
                       STY.W r_SoundModeSongSelected        ;00B726|8C8007  |000780;
                       RTS                                  ;00B729|60      |      ;
 
 
          CODE_00B72A: LDA.W $0783                          ;00B72A|AD8307  |000783;
                       STA.B r_Joy1ButtonsPressed           ;00B72D|8528    |000028;
 
                       STA.B r_Joy1NewButtonsPressed        ;00B72F|8526    |000026;
 
                       DEC.W r_SoundModeSongSelected        ;00B731|CE8007  |000780;
 
                       BEQ CODE_00B737                      ;00B734|F001    |00B737;
                       RTS                                  ;00B736|60      |      ;
 
 
          CODE_00B737: LDA.W r_BGanimationTimer             ;00B737|AD8107  |000781;
                       ASL A                                ;00B73A|0A      |      ;
                       TAY                                  ;00B73B|A8      |      ;
                       LDA.W DATA16_00B771,Y                ;00B73C|B971B7  |00B771;
                       STA.B r_CurrNumToVramQueue           ;00B73F|8508    |000008;
                       LDA.W PTR16_00B772,Y                 ;00B741|B972B7  |00B772;
                       STA.B $09                            ;00B744|8509    |000009;
                       LDA.W r_FogParallelPos               ;00B746|AD8207  |000782;
                       ASL A                                ;00B749|0A      |      ;
                       TAY                                  ;00B74A|A8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00B74B|B108    |000008;
                       STA.W $0783                          ;00B74D|8D8307  |000783;
                       INY                                  ;00B750|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00B751|B108    |000008;
                       STA.W r_SoundModeSongSelected        ;00B753|8D8007  |000780;
                       INC.W r_FogParallelPos               ;00B756|EE8207  |000782;
                       RTS                                  ;00B759|60      |      ;
 
 
         PTR16_00B75A: dw DATA16_00B75E                     ;00B75A|        |00B75E;
                       dw DATA16_00B76E                     ;00B75C|        |00B76E;
 
        DATA16_00B75E: dw $8020,$4001,$02A0                 ;00B75E|        |      ;
                       dw $B090,$BE03,$0490                 ;00B764|        |      ;
                       dw $70D0,$FF05                       ;00B76A|        |      ;
 
        DATA16_00B76E: dw $70E4,$8107                       ;00B76E|        |      ;
 
         PTR16_00B772: dw DATA8_0083B7                      ;00B772|        |0083B7;
                       dw DATA8_0087B7                      ;00B774|        |0087B7;
                       dw CODE_008BB7                       ;00B776|        |008BB7;
                       dw LOOSE_OP_0093B7                   ;00B778|        |0093B7;
                       dw DATA8_009BB7                      ;00B77A|        |009BB7;
                       dw DATA8_0081B7                      ;00B77C|        |0081B7;
                       dw DATA8_0087B7                      ;00B77E|        |0087B7;
                       dw $01B7                             ;00B780|        |0001B7;
                       db $FF,$01                           ;00B782|        |      ;
                       dw $0101,$81FF,$0104                 ;00B784|        |      ;
                       dw $81FF,$0108,$8110                 ;00B78A|        |      ;
                       dw $0104,$81FF,$0108                 ;00B790|        |      ;
                       dw $8120,$0104,$00FF                 ;00B796|        |      ;
                       dw $A0FF                             ;00B79C|        |      ;
                       db $02                               ;00B79E|        |      ;
                       LDA.W PTR16_00B75A,Y                 ;00B79F|B95AB7  |00B75A;
                       STA.B r_CurrNumToVramQueue           ;00B7A2|8508    |000008;
                       LDA.W PTR16_00B75B,Y                 ;00B7A4|B95BB7  |00B75B;
                       STA.B $09                            ;00B7A7|8509    |000009;
                       LDY.B #$00                           ;00B7A9|A000    |      ;
 
                       LDX.B #$01                           ;00B7AB|A201    |      ;
                       JMP.W CODE_00B7C9                    ;00B7AD|4CC9B7  |00B7C9;
 
 
          CODE_00B7B0: LDY.B #$00                           ;00B7B0|A000    |      ;
                       LDA.W PTR16_00B75A,Y                 ;00B7B2|B95AB7  |00B75A;
                       STA.B r_CurrNumToVramQueue           ;00B7B5|8508    |000008;
                       LDA.W PTR16_00B75B,Y                 ;00B7B7|B95BB7  |00B75B;
                       STA.B $09                            ;00B7BA|8509    |000009;
                       LDY.B #$00                           ;00B7BC|A000    |      ;
                       LDX.B #$01                           ;00B7BE|A201    |      ;
 
          CODE_00B7C0: JSR.W CODE_00B7C9                    ;00B7C0|20C9B7  |00B7C9;
                       INX                                  ;00B7C3|E8      |      ;
                       CPX.B #$06                           ;00B7C4|E006    |      ;
                       BCC CODE_00B7C0                      ;00B7C6|90F8    |00B7C0;
                       RTS                                  ;00B7C8|60      |      ;
 
 
          CODE_00B7C9: LDA.B #$00                           ;00B7C9|A900    |      ;
                       STA.W r_EntityOamSpecGroupDoubled,X  ;00B7CB|9D8C04  |00048C;
                       LDA.B #$00                           ;00B7CE|A900    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00B7D0|9D0004  |000400;
                       LDA.B #$00                           ;00B7D3|A900    |      ;
                       STA.W r_EntityPaletteOverride,X      ;00B7D5|9D5404  |000454;
                       STA.W r_EntityState,X                ;00B7D8|9D7004  |000470;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00B7DB|B108    |000008;
                       STA.W r_EntityXPos,X                 ;00B7DD|9D3804  |000438;
                       INY                                  ;00B7E0|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00B7E1|B108    |000008;
 
                       STA.W r_EntityYPos,X                 ;00B7E3|9D1C04  |00041C;
                       INY                                  ;00B7E6|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00B7E7|B108    |000008;
                       STA.W r_EntityObjectIdxes,X          ;00B7E9|9D4E05  |00054E;
                       INY                                  ;00B7EC|C8      |      ;
                       RTS                                  ;00B7ED|60      |      ;
 
 
          CODE_00B7EE: LDA.W r_PlayerStateDoubled           ;00B7EE|AD6505  |000565;
                       CMP.B #$02                           ;00B7F1|C902    |      ;
                       BEQ CODE_00B7FA                      ;00B7F3|F005    |00B7FA;
                       CMP.B #$04                           ;00B7F5|C904    |      ;
                       BEQ CODE_00B7FA                      ;00B7F7|F001    |00B7FA;
                       RTS                                  ;00B7F9|60      |      ;
 
 
          CODE_00B7FA: LDX.B #$01                           ;00B7FA|A201    |      ;
 
          CODE_00B7FC: LDA.W r_EntityObjectIdxes,X          ;00B7FC|BD4E05  |00054E;
                       BNE CODE_00B807                      ;00B7FF|D006    |00B807;
 
          CODE_00B801: INX                                  ;00B801|E8      |      ;
                       CPX.B #$06                           ;00B802|E006    |      ;
                       BCC CODE_00B7FC                      ;00B804|90F6    |00B7FC;
 
                       RTS                                  ;00B806|60      |      ;
 
 
          CODE_00B807: LDA.W r_EntityXPos,X                 ;00B807|BD3804  |000438;
                       SEC                                  ;00B80A|38      |      ;
                       SBC.W r_EntityXPos                   ;00B80B|ED3804  |000438;
                       BCS CODE_00B815                      ;00B80E|B005    |00B815;
                       EOR.B #$FF                           ;00B810|49FF    |      ;
                       CLC                                  ;00B812|18      |      ;
                       ADC.B #$01                           ;00B813|6901    |      ;
 
          CODE_00B815: CMP.B #$08                           ;00B815|C908    |      ;
                       BCS CODE_00B801                      ;00B817|B0E8    |00B801;
                       LDA.W r_EntityYPos,X                 ;00B819|BD1C04  |00041C;
 
                       SEC                                  ;00B81C|38      |      ;
                       SBC.W r_EntityYPos                   ;00B81D|ED1C04  |00041C;
                       BCS CODE_00B827                      ;00B820|B005    |00B827;
                       EOR.B #$FF                           ;00B822|49FF    |      ;
                       CLC                                  ;00B824|18      |      ;
                       ADC.B #$01                           ;00B825|6901    |      ;
 
          CODE_00B827: CMP.B #$08                           ;00B827|C908    |      ;
                       BCS CODE_00B801                      ;00B829|B0D6    |00B801;
                       RTS                                  ;00B82B|60      |      ;
 
 
          CODE_00B82C: LDA.B r_GameStateLoopCounter         ;00B82C|A51A    |00001A;
                       AND.B #$0F                           ;00B82E|290F    |      ;
 
                       BNE CODE_00B845                      ;00B830|D013    |00B845;
                       LDA.B #$3D                           ;00B832|A93D    |      ;
                       db $20                               ;00B834|        |      ;
                       dw CODE_0FE25F                       ;00B835|        |0FE25F;
                       JMP.W CODE_00B845                    ;00B837|4C45B8  |00B845;
 
 
          CODE_00B83A: LDA.B r_GameStateLoopCounter         ;00B83A|A51A    |00001A;
 
                       AND.B #$0F                           ;00B83C|290F    |      ;
                       BNE CODE_00B845                      ;00B83E|D005    |00B845;
                       LDA.B #$3B                           ;00B840|A93B    |      ;
                       db $20                               ;00B842|        |      ;
                       dw CODE_0FE25F                       ;00B843|        |0FE25F;
 
          CODE_00B845: LDA.B r_GameStateLoopCounter         ;00B845|A51A    |00001A;
                       AND.B #$02                           ;00B847|2902    |      ;
                       TAY                                  ;00B849|A8      |      ;
                       LDA.W DATA8_00B855,Y                 ;00B84A|B955B8  |00B855;
                       STA.B r_CurrScrollRoomScreen         ;00B84D|8557    |000057;
                       LDA.W DATA8_00B856,Y                 ;00B84F|B956B8  |00B856;
                       STA.B r_CurrScrollOffsetIntoRoomScreen;00B852|8556    |000056;
                       RTS                                  ;00B854|60      |      ;
 
 
         DATA8_00B855: db $02                               ;00B855|        |      ;
 
         DATA8_00B856: db $01,$01,$FF                       ;00B856|        |      ;
 
         DATA8_00B859: db $A2,$01                           ;00B859|        |      ;
 
         DATA8_00B85B: db $BD,$D8,$05,$D0,$0B               ;00B85B|        |      ;
                       db $A9,$00,$9D,$00                   ;00B860|        |      ;
 
         DATA8_00B864: db $04                               ;00B864|        |      ;
 
          CODE_00B865: INX                                  ;00B865|E8      |      ;
                       CPX.B #$06                           ;00B866|E006    |      ;
                       BCC DATA8_00B85B                     ;00B868|90F1    |00B85B;
                       RTS                                  ;00B86A|60      |      ;
 
                       DEC.W r_5d8,X                        ;00B86B|DED805  |0005D8;
                       LDA.B #$40                           ;00B86E|A940    |      ;
                       CLC                                  ;00B870|18      |      ;
 
          CODE_00B871: ADC.W r_EntityYposSubSpeed,X         ;00B871|7D3705  |000537;
                       STA.W r_EntityYposSubSpeed,X         ;00B874|9D3705  |000537;
                       BCC CODE_00B87C                      ;00B877|9003    |00B87C;
                       INC.W r_EntityYposSpeed,X            ;00B879|FE2005  |000520;
 
          CODE_00B87C: LDA.W r_EntityFractionalX,X          ;00B87C|BDC404  |0004C4;
                       CLC                                  ;00B87F|18      |      ;
                       ADC.W r_EntityXposSubSpeed,X         ;00B880|7D0905  |000509;
 
                       STA.W r_EntityFractionalX,X          ;00B883|9DC404  |0004C4;
                       LDA.W r_EntityXPos,X                 ;00B886|BD3804  |000438;
                       ADC.W r_EntityXposSpeed,X            ;00B889|7DF204  |0004F2;
                       STA.W r_EntityXPos,X                 ;00B88C|9D3804  |000438;
                       LDA.W r_EntityFractionalY,X          ;00B88F|BDDB04  |0004DB;
                       CLC                                  ;00B892|18      |      ;
                       ADC.W r_EntityYposSubSpeed,X         ;00B893|7D3705  |000537;
                       STA.W r_EntityFractionalY,X          ;00B896|9DDB04  |0004DB;
                       LDA.W r_EntityYPos,X                 ;00B899|BD1C04  |00041C;
                       ADC.W r_EntityYposSpeed,X            ;00B89C|7D2005  |000520;
                       STA.W r_EntityYPos,X                 ;00B89F|9D1C04  |00041C;
                       JMP.W CODE_00B865                    ;00B8A2|4C65B8  |00B865;
 
 
          CODE_00B8A5: LDX.B #$01                           ;00B8A5|A201    |      ;
                       LDY.B #$00                           ;00B8A7|A000    |      ;
 
          CODE_00B8A9: LDA.B #$20                           ;00B8A9|A920    |      ;
                       STA.W r_5d8,X                        ;00B8AB|9DD805  |0005D8;
                       LDA.B #$0E                           ;00B8AE|A90E    |      ;
                       STA.W r_EntityOamSpecGroupDoubled,X  ;00B8B0|9D8C04  |00048C;
                       LDA.B #$18                           ;00B8B3|A918    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00B8B5|9D0004  |000400;
 
                       LDA.B #$00                           ;00B8B8|A900    |      ;
                       STA.W r_EntityPaletteOverride,X      ;00B8BA|9D5404  |000454;
                       STA.W r_EntityState,X                ;00B8BD|9D7004  |000470;
                       LDA.W DATA8_00B8F0,Y                 ;00B8C0|B9F0B8  |00B8F0;
                       STA.W r_EntityXposSpeed,X            ;00B8C3|9DF204  |0004F2;
                       INY                                  ;00B8C6|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8C7|B9F0B8  |00B8F0;
                       STA.W r_EntityXposSubSpeed,X         ;00B8CA|9D0905  |000509;
                       INY                                  ;00B8CD|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8CE|B9F0B8  |00B8F0;
 
                       STA.W r_EntityYposSpeed,X            ;00B8D1|9D2005  |000520;
                       INY                                  ;00B8D4|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8D5|B9F0B8  |00B8F0;
                       STA.W r_EntityYposSubSpeed,X         ;00B8D8|9D3705  |000537;
                       INY                                  ;00B8DB|C8      |      ;
 
                       LDA.W DATA8_00B8F0,Y                 ;00B8DC|B9F0B8  |00B8F0;
                       STA.W r_EntityXPos,X                 ;00B8DF|9D3804  |000438;
                       INY                                  ;00B8E2|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8E3|B9F0B8  |00B8F0;
                       STA.W r_EntityYPos,X                 ;00B8E6|9D1C04  |00041C;
                       INY                                  ;00B8E9|C8      |      ;
                       INX                                  ;00B8EA|E8      |      ;
                       CPX.B #$06                           ;00B8EB|E006    |      ;
                       BCC CODE_00B8A9                      ;00B8ED|90BA    |00B8A9;
                       RTS                                  ;00B8EF|60      |      ;
 
 
         DATA8_00B8F0: db $FF,$80,$00,$C0,$80               ;00B8F0|        |      ;
                       db $38,$01,$C0,$01,$40               ;00B8F5|        |      ;
                       db $78,$3C,$FE,$00,$01               ;00B8FA|        |      ;
                       db $C0,$90,$34,$02,$40               ;00B8FF|        |      ;
                       db $01,$80,$74,$40,$00               ;00B904|        |      ;
                       db $C0,$01,$40,$7C,$3C               ;00B909|        |      ;
 
          CODE_00B90E: DEC.W r_EffectSpeedGeneral           ;00B90E|CE8407  |000784;
                       BEQ CODE_00B915                      ;00B911|F002    |00B915;
                       CLC                                  ;00B913|18      |      ;
                       RTS                                  ;00B914|60      |      ;
 
 
          CODE_00B915: JSR.W CODE_00B990                    ;00B915|2090B9  |00B990;
                       JSR.W CODE_00B92E                    ;00B918|202EB9  |00B92E;
                       INC.W r_EffectSpeedSupGeneral        ;00B91B|EE8507  |000785;
                       LDA.W r_EffectSpeedSupGeneral        ;00B91E|AD8507  |000785;
                       CMP.B #$0C                           ;00B921|C90C    |      ;
                       BEQ CODE_00B92C                      ;00B923|F007    |00B92C;
                       LDA.B #$06                           ;00B925|A906    |      ;
                       STA.W r_EffectSpeedGeneral           ;00B927|8D8407  |000784;
                       CLC                                  ;00B92A|18      |      ;
                       RTS                                  ;00B92B|60      |      ;
 
 
          CODE_00B92C: SEC                                  ;00B92C|38      |      ;
                       RTS                                  ;00B92D|60      |      ;
 
 
          CODE_00B92E: LDA.W r_EffectSpeedSupGeneral        ;00B92E|AD8507  |000785;
                       ASL A                                ;00B931|0A      |      ;
                       TAY                                  ;00B932|A8      |      ;
                       LDA.W DATA8_00BA12,Y                 ;00B933|B912BA  |00BA12;
                       STA.B $62                            ;00B936|8562    |000062;
                       LDA.W DATA8_00BA13,Y                 ;00B938|B913BA  |00BA13;
                       STA.B r_VramQueueDest                ;00B93B|8561    |000061;
                       db $20                               ;00B93D|        |      ;
                       dw CODE_0FE8B5                       ;00B93E|        |0FE8B5;
                       LDY.W r_EffectSpeedSupGeneral        ;00B940|AC8507  |000785;
 
                       INY                                  ;00B943|C8      |      ;
                       TYA                                  ;00B944|98      |      ;
                       AND.B #$FE                           ;00B945|29FE    |      ;
 
                       TAY                                  ;00B947|A8      |      ;
                       LDA.W DATA8_00BA3A,Y                 ;00B948|B93ABA  |00BA3A;
                       STA.B $01                            ;00B94B|8501    |000001;
                       LDA.W DATA8_00BA3B,Y                 ;00B94D|B93BBA  |00BA3B;
                       STA.B $02                            ;00B950|8502    |000002;
                       LDA.W DATA8_00BA2A                   ;00B952|AD2ABA  |00BA2A;
                       STA.B r_CurrNumToVramQueue           ;00B955|8508    |000008;
                       LDA.W DATA8_00BA2B                   ;00B957|AD2BBA  |00BA2B;
                       STA.B $09                            ;00B95A|8509    |000009;
                       JSR.W CODE_00B977                    ;00B95C|2077B9  |00B977;
                       LDA.B $02                            ;00B95F|A502    |000002;
                       STA.B $01                            ;00B961|8501    |000001;
                       LDA.W DATA8_00BA2C                   ;00B963|AD2CBA  |00BA2C;
                       STA.B r_CurrNumToVramQueue           ;00B966|8508    |000008;
                       LDA.W DATA8_00BA2D                   ;00B968|AD2DBA  |00BA2D;
                       STA.B $09                            ;00B96B|8509    |000009;
                       JSR.W CODE_00B977                    ;00B96D|2077B9  |00B977;
                       db $4C                               ;00B970|        |      ;
 
                       dw CODE_0FE8DE                       ;00B971|        |0FE8DE;
 
          CODE_00B973: LDA.B #$02                           ;00B973|A902    |      ;
                       BNE CODE_00B980                      ;00B975|D009    |00B980;
 
          CODE_00B977: LDY.W r_EffectSpeedSupGeneral        ;00B977|AC8507  |000785;
                       BEQ CODE_00B973                      ;00B97A|F0F7    |00B973;
                       INY                                  ;00B97C|C8      |      ;
                       TYA                                  ;00B97D|98      |      ;
                       AND.B #$01                           ;00B97E|2901    |      ;
 
          CODE_00B980: ASL A                                ;00B980|0A      |      ;
                       TAY                                  ;00B981|A8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00B982|B108    |000008;
 
                       AND.B $01                            ;00B984|2501    |000001;
                       INY                                  ;00B986|C8      |      ;
                       ORA.B (r_CurrNumToVramQueue),Y       ;00B987|1108    |000008;
                       STA.W r_VramQueue,X                  ;00B989|9D0003  |000300;
                       INX                                  ;00B98C|E8      |      ;
                       STX.B r_VramQueueNextIdxToFill       ;00B98D|861D    |00001D;
                       RTS                                  ;00B98F|60      |      ;
 
 
          CODE_00B990: LDA.W r_EffectSpeedSupGeneral        ;00B990|AD8507  |000785;
                       ASL A                                ;00B993|0A      |      ;
                       TAY                                  ;00B994|A8      |      ;
                       LDA.W DATA8_00B9FA,Y                 ;00B995|B9FAB9  |00B9FA;
                       STA.B $62                            ;00B998|8562    |000062;
                       LDA.W DATA8_00B9FB,Y                 ;00B99A|B9FBB9  |00B9FB;
                       STA.B r_VramQueueDest                ;00B99D|8561    |000061;
                       db $20                               ;00B99F|        |      ;
                       dw CODE_0FE8B5                       ;00B9A0|        |0FE8B5;
                       LDA.W r_EffectSpeedSupGeneral        ;00B9A2|AD8507  |000785;
                       BNE CODE_00B9AB                      ;00B9A5|D004    |00B9AB;
                       LDY.B #$08                           ;00B9A7|A008    |      ;
                       BNE CODE_00B9B5                      ;00B9A9|D00A    |00B9B5;
 
          CODE_00B9AB: CMP.B #$0B                           ;00B9AB|C90B    |      ;
                       BNE CODE_00B9B3                      ;00B9AD|D004    |00B9B3;
                       LDY.B #$11                           ;00B9AF|A011    |      ;
                       BNE CODE_00B9B5                      ;00B9B1|D002    |00B9B5;
 
          CODE_00B9B3: LDY.B #$00                           ;00B9B3|A000    |      ;
 
          CODE_00B9B5: LDA.B #$04                           ;00B9B5|A904    |      ;
                       STA.B $00                            ;00B9B7|8500    |000000;
 
          CODE_00B9B9: LDA.W DATA8_00B9E0,Y                 ;00B9B9|B9E0B9  |00B9E0;
                       CMP.B #$FF                           ;00B9BC|C9FF    |      ;
                       BEQ DATA8_00B9DD                     ;00B9BE|F01D    |00B9DD;
 
                       STA.W r_VramQueue,X                  ;00B9C0|9D0003  |000300;
                       INY                                  ;00B9C3|C8      |      ;
                       INX                                  ;00B9C4|E8      |      ;
                       DEC.B $00                            ;00B9C5|C600    |000000;
                       BNE CODE_00B9B9                      ;00B9C7|D0F0    |00B9B9;
                       db $20                               ;00B9C9|        |      ;
                       dw CODE_0FE8DE                       ;00B9CA|        |0FE8DE;
                       LDA.B #$20                           ;00B9CC|A920    |      ;
                       CLC                                  ;00B9CE|18      |      ;
                       ADC.B r_VramQueueDest                ;00B9CF|6561    |000061;
                       STA.B r_VramQueueDest                ;00B9D1|8561    |000061;
                       BCC DATA8_00B9D7                     ;00B9D3|9002    |00B9D7;
                       INC.B $62                            ;00B9D5|E662    |000062;
 
         DATA8_00B9D7: db $20                               ;00B9D7|        |      ;
                       dw CODE_0FE8B5                       ;00B9D8|        |0FE8B5;
                       JMP.W CODE_00B9B5                    ;00B9DA|4CB5B9  |00B9B5;
 
 
         DATA8_00B9DD: db $4C                               ;00B9DD|        |      ;
 
                       dw CODE_0FE8DE                       ;00B9DE|        |0FE8DE;
 
         DATA8_00B9E0: db $55,$79,$78,$55,$5A               ;00B9E0|        |      ;
                       db $5B,$5B,$78,$4C,$5C               ;00B9E5|        |      ;
                       db $6C,$7C,$4D,$5D,$6D               ;00B9EA|        |      ;
                       db $7D,$FF,$55,$79,$78               ;00B9EF|        |      ;
                       db $55,$5A,$5B,$5B,$78               ;00B9F4|        |      ;
                       db $FF                               ;00B9F9|        |      ;
 
         DATA8_00B9FA: db $20                               ;00B9FA|        |      ;
 
         DATA8_00B9FB: db $CE                               ;00B9FB|        |      ;
 
         DATA8_00B9FC: db $20,$CE,$21,$0E,$21               ;00B9FC|        |      ;
 
                       db $4E,$21,$8E,$21,$CE               ;00BA01|        |      ;
                       db $22,$0E,$22,$4E,$22               ;00BA06|        |      ;
 
                       db $8E,$22,$CE,$23,$0E               ;00BA0B|        |      ;
                       db $23,$4E                           ;00BA10|        |      ;
 
         DATA8_00BA12: db $23                               ;00BA12|        |      ;
 
         DATA8_00BA13: db $CB,$23,$D3,$23,$D3               ;00BA13|        |      ;
                       db $23,$DB,$23,$DB,$23               ;00BA18|        |      ;
                       db $E3,$23,$E3,$23,$EB               ;00BA1D|        |      ;
                       db $23,$EB,$23,$F3,$23               ;00BA22|        |      ;
 
                       db $F3,$FF,$FF                       ;00BA27|        |      ;
 
         DATA8_00BA2A: db $2E                               ;00BA2A|        |      ;
 
         DATA8_00BA2B: db $BA                               ;00BA2B|        |      ;
 
         DATA8_00BA2C: db $34                               ;00BA2C|        |      ;
 
         DATA8_00BA2D: db $BA,$F3,$04,$33,$44               ;00BA2D|        |      ;
                       db $33,$40,$FC,$01,$CC               ;00BA32|        |      ;
                       db $11,$CC,$10                       ;00BA37|        |      ;
 
         DATA8_00BA3A: db $A0                               ;00BA3A|        |      ;
 
         DATA8_00BA3B: db $A0,$2A,$8A,$BB,$E0               ;00BA3B|        |      ;
                       db $BA,$EA,$0A,$0A,$00               ;00BA40|        |      ;
                       db $00                               ;00BA45|        |      ;
                       LDA.B r_MenuOptionIdxSelected        ;00BA46|A56B    |00006B;
 
                       db $20                               ;00BA48|        |      ;
                       dw jumpFromStackYXpreserved          ;00BA49|        |0FE86D;
                       dw CODE_00BA51                       ;00BA4B|        |00BA51;
                       dw CODE_00BA59                       ;00BA4D|        |00BA59;
                       dw DATA8_00BA7F                      ;00BA4F|        |00BA7F;
 
          CODE_00BA51: LDA.B #$00                           ;00BA51|A900    |      ;
                       STA.W r_PWdumpGeneral                ;00BA53|8D8807  |000788;
                       INC.B r_MenuOptionIdxSelected        ;00BA56|E66B    |00006B;
                       RTS                                  ;00BA58|60      |      ;
 
 
          CODE_00BA59: LDA.B r_GameStateLoopCounter         ;00BA59|A51A    |00001A;
                       AND.B #$03                           ;00BA5B|2903    |      ;
                       BEQ CODE_00BA60                      ;00BA5D|F001    |00BA60;
                       RTS                                  ;00BA5F|60      |      ;
 
 
          CODE_00BA60: LDY.W r_PWdumpGeneral                ;00BA60|AC8807  |000788;
                       LDA.W DATA8_00BA7B,Y                 ;00BA63|B97BBA  |00BA7B;
                       db $20                               ;00BA66|        |      ;
                       dw screenLoadRoutine                 ;00BA67|        |0FECE9;
                       LDA.B #$04                           ;00BA69|A904    |      ;
                       db $20                               ;00BA6B|        |      ;
                       dw screenLoadRoutine                 ;00BA6C|        |0FECE9;
 
                       INC.W r_PWdumpGeneral                ;00BA6E|EE8807  |000788;
                       LDA.W r_PWdumpGeneral                ;00BA71|AD8807  |000788;
                       CMP.B #$04                           ;00BA74|C904    |      ;
                       BNE CODE_00BA7A                      ;00BA76|D002    |00BA7A;
                       INC.B r_MenuOptionIdxSelected        ;00BA78|E66B    |00006B;
 
          CODE_00BA7A: RTS                                  ;00BA7A|60      |      ;
 
 
         DATA8_00BA7B: db $1C,$1B,$1A,$19                   ;00BA7B|        |      ;
 
         DATA8_00BA7F: db $20,$95,$BA                       ;00BA7F|        |      ;
                       LDA.B r_CurrentRoomEffect            ;00BA82|A57D    |00007D;
                       AND.B #$0F                           ;00BA84|290F    |      ;
                       BEQ CODE_00BA8C                      ;00BA86|F004    |00BA8C;
                       LDA.B #$24                           ;00BA88|A924    |      ;
                       BNE CODE_00BA8E                      ;00BA8A|D002    |00BA8E;
 
          CODE_00BA8C: LDA.B #$13                           ;00BA8C|A913    |      ;
 
          CODE_00BA8E: STA.B r_BaseIRQFuncIdx               ;00BA8E|853F    |00003F;
                       LDA.B #$03                           ;00BA90|A903    |      ;
                       STA.B r_InGameSubstate               ;00BA92|852A    |00002A;
                       RTS                                  ;00BA94|60      |      ;
 
                       JSR.W CODE_00BDDA                    ;00BA95|20DABD  |00BDDA;
                       LDY.B #$00                           ;00BA98|A000    |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BA9A|B108    |000008;
                       ASL A                                ;00BA9C|0A      |      ;
                       SEC                                  ;00BA9D|38      |      ;
                       SBC.B #$02                           ;00BA9E|E902    |      ;
                       STA.B r_DoubleCurrGroup              ;00BAA0|850C    |00000C;
                       LDY.B #$01                           ;00BAA2|A001    |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BAA4|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00BAA6|850A    |00000A;
                       INY                                  ;00BAA8|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BAA9|B108    |000008;
                       STA.B $0B                            ;00BAAB|850B    |00000B;
                       JSR.W CODE_00BAC2                    ;00BAAD|20C2BA  |00BAC2;
                       LDA.B r_DoubleCurrGroup              ;00BAB0|A50C    |00000C;
                       CLC                                  ;00BAB2|18      |      ;
                       ADC.B #$02                           ;00BAB3|6902    |      ;
                       STA.B r_DoubleCurrGroup              ;00BAB5|850C    |00000C;
                       LDY.B #$03                           ;00BAB7|A003    |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BAB9|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00BABB|850A    |00000A;
                       INY                                  ;00BABD|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BABE|B108    |000008;
                       STA.B $0B                            ;00BAC0|850B    |00000B;
 
          CODE_00BAC2: LDY.B $59                            ;00BAC2|A459    |000059;
                       STY.B r_RoomSectionChrBanksDataOffset;00BAC4|840F    |00000F;
                       LDA.B #$0C                           ;00BAC6|A90C    |      ;
                       STA.B $00                            ;00BAC8|8500    |000000;
 
          CODE_00BACA: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BACA|B10A    |00000A;
                       CMP.B #$FF                           ;00BACC|C9FF    |      ;
                       BEQ CODE_00BAE5                      ;00BACE|F015    |00BAE5;
 
                       CMP.B #$AA                           ;00BAD0|C9AA    |      ;
 
                       BEQ CODE_00BAFA                      ;00BAD2|F026    |00BAFA;
                       CMP.B #$0A                           ;00BAD4|C90A    |      ;
                       BEQ CODE_00BAF0                      ;00BAD6|F018    |00BAF0;
                       CMP.B #$A5                           ;00BAD8|C9A5    |      ;
                       BEQ CODE_00BAE6                      ;00BADA|F00A    |00BAE6;
 
          CODE_00BADC: LDY.B r_RoomSectionChrBanksDataOffset;00BADC|A40F    |00000F;
                       INY                                  ;00BADE|C8      |      ;
                       STY.B r_RoomSectionChrBanksDataOffset;00BADF|840F    |00000F;
                       DEC.B $00                            ;00BAE1|C600    |000000;
                       BNE CODE_00BACA                      ;00BAE3|D0E5    |00BACA;
 
          CODE_00BAE5: RTS                                  ;00BAE5|60      |      ;
 
 
          CODE_00BAE6: JSR.W CODE_00BB07                    ;00BAE6|2007BB  |00BB07;
                       LDA.B #$00                           ;00BAE9|A900    |      ;
                       STA.W $06E1,Y                        ;00BAEB|99E106  |0006E1;
                       BEQ CODE_00BADC                      ;00BAEE|F0EC    |00BADC;
 
          CODE_00BAF0: JSR.W CODE_00BB07                    ;00BAF0|2007BB  |00BB07;
                       LDA.B #$00                           ;00BAF3|A900    |      ;
                       STA.W r_CurrCollisionMapValues90,Y   ;00BAF5|99E006  |0006E0;
                       BEQ CODE_00BADC                      ;00BAF8|F0E2    |00BADC;
 
          CODE_00BAFA: JSR.W CODE_00BB07                    ;00BAFA|2007BB  |00BB07;
                       LDA.B #$00                           ;00BAFD|A900    |      ;
                       STA.W r_CurrCollisionMapValues90,Y   ;00BAFF|99E006  |0006E0;
                       STA.W $06E1,Y                        ;00BB02|99E106  |0006E1;
                       BEQ CODE_00BADC                      ;00BB05|F0D5    |00BADC;
 
          CODE_00BB07: TYA                                  ;00BB07|98      |      ;
 
          CODE_00BB08: CMP.B #$0C                           ;00BB08|C90C    |      ;
                       BCC CODE_00BB11                      ;00BB0A|9005    |00BB11;
                       SBC.B #$0C                           ;00BB0C|E90C    |      ;
                       JMP.W CODE_00BB08                    ;00BB0E|4C08BB  |00BB08;
 
 
          CODE_00BB11: TAY                                  ;00BB11|A8      |      ;
                       LDA.W UNREACH_0FFD4C,Y               ;00BB12|B94CFD  |0FFD4C;
                       CLC                                  ;00BB15|18      |      ;
                       ADC.B r_DoubleCurrGroup              ;00BB16|650C    |00000C;
                       TAY                                  ;00BB18|A8      |      ;
                       RTS                                  ;00BB19|60      |      ;
 
                       db $A5,$6B,$20,$6D,$E8               ;00BB1A|        |      ;
                       db $27,$BB,$6C                       ;00BB1F|        |      ;
 
                       TYX                                  ;00BB22|BB      |      ;
                       INX                                  ;00BB23|E8      |      ;
                       LDY.W CODE_00BCF5,X                  ;00BB24|BCF5BC  |00BCF5;
                       LDA.B #$35                           ;00BB27|A935    |      ;
                       db $20                               ;00BB29|        |      ;
                       dw CODE_0FE25F                       ;00BB2A|        |0FE25F;
                       LDA.W r_EntityXPos                   ;00BB2C|AD3804  |000438;
                       CLC                                  ;00BB2F|18      |      ;
                       ADC.B r_CurrScrollOffsetIntoRoomScreen;00BB30|6556    |000056;
                       STA.B $00                            ;00BB32|8500    |000000;
                       LDA.B #$00                           ;00BB34|A900    |      ;
                       ADC.B r_CurrScrollRoomScreen         ;00BB36|6557    |000057;
                       LSR A                                ;00BB38|4A      |      ;
                       ROR.B $00                            ;00BB39|6600    |000000;
                       LSR A                                ;00BB3B|4A      |      ;
                       ROR.B $00                            ;00BB3C|6600    |000000;
                       LSR A                                ;00BB3E|4A      |      ;
                       ROR.B $00                            ;00BB3F|6600    |000000;
                       LSR A                                ;00BB41|4A      |      ;
                       ROR.B $00                            ;00BB42|6600    |000000;
                       LDA.B $00                            ;00BB44|A500    |000000;
                       STA.W r_FogParallelPos               ;00BB46|8D8207  |000782;
                       STA.W r_EffectSpeedGeneral           ;00BB49|8D8407  |000784;
 
                       STA.W r_PWiconGeneral                ;00BB4C|8D8607  |000786;
                       LDA.W r_EntityYPos                   ;00BB4F|AD1C04  |00041C;
                       LSR A                                ;00BB52|4A      |      ;
                       LSR A                                ;00BB53|4A      |      ;
                       LSR A                                ;00BB54|4A      |      ;
 
                       LSR A                                ;00BB55|4A      |      ;
                       LSR A                                ;00BB56|4A      |      ;
                       STA.W $0783                          ;00BB57|8D8307  |000783;
 
                       STA.W r_EffectSpeedSupGeneral        ;00BB5A|8D8507  |000785;
                       STA.W $0787                          ;00BB5D|8D8707  |000787;
                       LDA.B #$0C                           ;00BB60|A90C    |      ;
                       STA.W r_PWdumpGeneral                ;00BB62|8D8807  |000788;
 
                       LDA.B #$01                           ;00BB65|A901    |      ;
                       STA.B r_BaseIRQFuncIdx               ;00BB67|853F    |00003F;
 
                       INC.B r_MenuOptionIdxSelected        ;00BB69|E66B    |00006B;
                       RTS                                  ;00BB6B|60      |      ;
 
                       LDA.B r_GameStateLoopCounter         ;00BB6C|A51A    |00001A;
                       AND.B #$01                           ;00BB6E|2901    |      ;
 
                       BEQ CODE_00BB79                      ;00BB70|F007    |00BB79;
 
                       DEC.W r_PWdumpGeneral                ;00BB72|CE8807  |000788;
                       BNE CODE_00BB7A                      ;00BB75|D003    |00BB7A;
 
                       INC.B r_MenuOptionIdxSelected        ;00BB77|E66B    |00006B;
 
          CODE_00BB79: RTS                                  ;00BB79|60      |      ;
 
 
          CODE_00BB7A: JSR.W CODE_00BDE0                    ;00BB7A|20E0BD  |00BDE0;
                       LDX.B #$00                           ;00BB7D|A200    |      ;
                       JSR.W CODE_00BBDE                    ;00BB7F|20DEBB  |00BBDE;
                       LDY.W r_EffectSpeedGeneral           ;00BB82|AC8407  |000784;
                       DEY                                  ;00BB85|88      |      ;
                       TYA                                  ;00BB86|98      |      ;
                       LSR A                                ;00BB87|4A      |      ;
                       TAY                                  ;00BB88|A8      |      ;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BB89|B10A    |00000A;
                       CMP.B #$0A                           ;00BB8B|C90A    |      ;
                       BEQ CODE_00BBAB                      ;00BB8D|F01C    |00BBAB;
                       CMP.B #$A5                           ;00BB8F|C9A5    |      ;
                       BEQ CODE_00BBAB                      ;00BB91|F018    |00BBAB;
                       CMP.B #$AA                           ;00BB93|C9AA    |      ;
                       BEQ CODE_00BBAB                      ;00BB95|F014    |00BBAB;
                       LDY.B #$00                           ;00BB97|A000    |      ;
                       LDA.W r_EffectSpeedSupGeneral        ;00BB99|AD8507  |000785;
                       SEC                                  ;00BB9C|38      |      ;
                       SBC.B (r_CurrNumToVramQueue),Y       ;00BB9D|F108    |000008;
                       BNE CODE_00BBA6                      ;00BB9F|D005    |00BBA6;
                       INC.W r_EffectSpeedSupGeneral        ;00BBA1|EE8507  |000785;
                       BNE CODE_00BBAE                      ;00BBA4|D008    |00BBAE;
 
          CODE_00BBA6: DEC.W r_EffectSpeedSupGeneral        ;00BBA6|CE8507  |000785;
                       BNE CODE_00BBAE                      ;00BBA9|D003    |00BBAE;
 
          CODE_00BBAB: DEC.W r_EffectSpeedGeneral           ;00BBAB|CE8407  |000784;
 
          CODE_00BBAE: LDX.B #$02                           ;00BBAE|A202    |      ;
                       JSR.W CODE_00BBDE                    ;00BBB0|20DEBB  |00BBDE;
 
                       LDY.W r_PWiconGeneral                ;00BBB3|AC8607  |000786;
                       INY                                  ;00BBB6|C8      |      ;
                       TYA                                  ;00BBB7|98      |      ;
                       LSR A                                ;00BBB8|4A      |      ;
                       TAY                                  ;00BBB9|A8      |      ;
 
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BBBA|B10A    |00000A;
 
                       CMP.B #$0A                           ;00BBBC|C90A    |      ;
 
          CODE_00BBBE: BEQ CODE_00BBDA                      ;00BBBE|F01A    |00BBDA;
                       CMP.B #$A5                           ;00BBC0|C9A5    |      ;
                       BEQ CODE_00BBDA                      ;00BBC2|F016    |00BBDA;
                       CMP.B #$AA                           ;00BBC4|C9AA    |      ;
 
                       BEQ CODE_00BBDA                      ;00BBC6|F012    |00BBDA;
 
                       LDY.B #$00                           ;00BBC8|A000    |      ;
 
                       LDA.W $0787                          ;00BBCA|AD8707  |000787;
                       SEC                                  ;00BBCD|38      |      ;
                       SBC.B (r_CurrNumToVramQueue),Y       ;00BBCE|F108    |000008;
                       BNE CODE_00BBD6                      ;00BBD0|D004    |00BBD6;
                       INC.W $0787                          ;00BBD2|EE8707  |000787;
                       RTS                                  ;00BBD5|60      |      ;
 
 
          CODE_00BBD6: DEC.W $0787                          ;00BBD6|CE8707  |000787;
                       RTS                                  ;00BBD9|60      |      ;
 
 
          CODE_00BBDA: INC.W r_PWiconGeneral                ;00BBDA|EE8607  |000786;
                       RTS                                  ;00BBDD|60      |      ;
 
 
          CODE_00BBDE: STX.B r_RoomSectionChrBanksDataOffset;00BBDE|860F    |00000F;
                       LDY.B #$00                           ;00BBE0|A000    |      ;
                       LDA.W r_EffectSpeedSupGeneral,X      ;00BBE2|BD8507  |000785;
                       SEC                                  ;00BBE5|38      |      ;
                       SBC.B (r_CurrNumToVramQueue),Y       ;00BBE6|F108    |000008;
                       ASL A                                ;00BBE8|0A      |      ;
                       TAY                                  ;00BBE9|A8      |      ;
                       INY                                  ;00BBEA|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BBEB|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00BBED|850A    |00000A;
                       INY                                  ;00BBEF|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BBF0|B108    |000008;
                       STA.B $0B                            ;00BBF2|850B    |00000B;
                       LDA.W r_EffectSpeedGeneral,X         ;00BBF4|BD8407  |000784;
                       LSR A                                ;00BBF7|4A      |      ;
                       BCS CODE_00BC31                      ;00BBF8|B037    |00BC31;
                       TAY                                  ;00BBFA|A8      |      ;
                       LDA.B r_RoomSectionChrBanksDataOffset;00BBFB|A50F    |00000F;
                       BEQ CODE_00BC18                      ;00BBFD|F019    |00BC18;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BBFF|B10A    |00000A;
                       CMP.B #$AA                           ;00BC01|C9AA    |      ;
                       BEQ CODE_00BC13                      ;00BC03|F00E    |00BC13;
                       CMP.B #$A5                           ;00BC05|C9A5    |      ;
                       BEQ CODE_00BC0E                      ;00BC07|F005    |00BC0E;
                       ORA.B #$03                           ;00BC09|0903    |      ;
                       JMP.W CODE_00BC65                    ;00BC0B|4C65BC  |00BC65;
 
 
          CODE_00BC0E: ORA.B #$30                           ;00BC0E|0930    |      ;
                       JMP.W CODE_00BC65                    ;00BC10|4C65BC  |00BC65;
 
 
          CODE_00BC13: ORA.B #$33                           ;00BC13|0933    |      ;
                       JMP.W CODE_00BC65                    ;00BC15|4C65BC  |00BC65;
 
 
          CODE_00BC18: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BC18|B10A    |00000A;
                       CMP.B #$AA                           ;00BC1A|C9AA    |      ;
                       BEQ CODE_00BC2C                      ;00BC1C|F00E    |00BC2C;
                       CMP.B #$A5                           ;00BC1E|C9A5    |      ;
                       BEQ CODE_00BC27                      ;00BC20|F005    |00BC27;
                       ORA.B #$0F                           ;00BC22|090F    |      ;
                       JMP.W CODE_00BC65                    ;00BC24|4C65BC  |00BC65;
 
 
          CODE_00BC27: ORA.B #$F0                           ;00BC27|09F0    |      ;
                       JMP.W CODE_00BC65                    ;00BC29|4C65BC  |00BC65;
 
 
          CODE_00BC2C: ORA.B #$FF                           ;00BC2C|09FF    |      ;
                       JMP.W CODE_00BC65                    ;00BC2E|4C65BC  |00BC65;
 
 
          CODE_00BC31: TAY                                  ;00BC31|A8      |      ;
                       LDA.B r_RoomSectionChrBanksDataOffset;00BC32|A50F    |00000F;
                       BEQ CODE_00BC4F                      ;00BC34|F019    |00BC4F;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BC36|B10A    |00000A;
                       CMP.B #$AA                           ;00BC38|C9AA    |      ;
                       BEQ CODE_00BC4A                      ;00BC3A|F00E    |00BC4A;
                       CMP.B #$A5                           ;00BC3C|C9A5    |      ;
                       BEQ CODE_00BC45                      ;00BC3E|F005    |00BC45;
                       ORA.B #$0F                           ;00BC40|090F    |      ;
                       JMP.W CODE_00BC65                    ;00BC42|4C65BC  |00BC65;
 
 
          CODE_00BC45: ORA.B #$F0                           ;00BC45|09F0    |      ;
                       JMP.W CODE_00BC65                    ;00BC47|4C65BC  |00BC65;
 
 
          CODE_00BC4A: ORA.B #$FF                           ;00BC4A|09FF    |      ;
                       JMP.W CODE_00BC65                    ;00BC4C|4C65BC  |00BC65;
 
 
          CODE_00BC4F: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BC4F|B10A    |00000A;
                       CMP.B #$AA                           ;00BC51|C9AA    |      ;
                       BEQ CODE_00BC63                      ;00BC53|F00E    |00BC63;
                       CMP.B #$A5                           ;00BC55|C9A5    |      ;
                       BEQ CODE_00BC5E                      ;00BC57|F005    |00BC5E;
                       ORA.B #$0C                           ;00BC59|090C    |      ;
                       JMP.W CODE_00BC65                    ;00BC5B|4C65BC  |00BC65;
 
 
          CODE_00BC5E: ORA.B #$C0                           ;00BC5E|09C0    |      ;
 
                       JMP.W CODE_00BC65                    ;00BC60|4C65BC  |00BC65;
 
 
          CODE_00BC63: ORA.B #$CC                           ;00BC63|09CC    |      ;
 
          CODE_00BC65: STA.B $00                            ;00BC65|8500    |000000;
                       STY.B $01                            ;00BC67|8401    |000001;
                       TYA                                  ;00BC69|98      |      ;
                       AND.B #$07                           ;00BC6A|2907    |      ;
                       STA.B r_VramQueueDest                ;00BC6C|8561    |000061;
                       LDA.W r_EffectSpeedSupGeneral,X      ;00BC6E|BD8507  |000785;
                       ASL A                                ;00BC71|0A      |      ;
                       ASL A                                ;00BC72|0A      |      ;
                       ASL A                                ;00BC73|0A      |      ;
                       CLC                                  ;00BC74|18      |      ;
                       ADC.B r_VramQueueDest                ;00BC75|6561    |000061;
                       CLC                                  ;00BC77|18      |      ;
                       ADC.B #$C0                           ;00BC78|69C0    |      ;
                       STA.B r_VramQueueDest                ;00BC7A|8561    |000061;
                       LDA.B $75                            ;00BC7C|A575    |000075;
                       ASL A                                ;00BC7E|0A      |      ;
                       ASL A                                ;00BC7F|0A      |      ;
                       ASL A                                ;00BC80|0A      |      ;
                       AND.B #$08                           ;00BC81|2908    |      ;
                       STA.B $02                            ;00BC83|8502    |000002;
                       LDA.B $01                            ;00BC85|A501    |000001;
                       AND.B #$08                           ;00BC87|2908    |      ;
                       EOR.B $02                            ;00BC89|4502    |000002;
                       BNE CODE_00BC91                      ;00BC8B|D004    |00BC91;
                       LDA.B #$23                           ;00BC8D|A923    |      ;
                       BNE CODE_00BC93                      ;00BC8F|D002    |00BC93;
 
          CODE_00BC91: LDA.B #$27                           ;00BC91|A927    |      ;
 
          CODE_00BC93: STA.B $62                            ;00BC93|8562    |000062;
                       db $20                               ;00BC95|        |      ;
                       dw CODE_0FE8B5                       ;00BC96|        |0FE8B5;
                       LDA.B $00                            ;00BC98|A500    |000000;
                       STA.W r_VramQueue,X                  ;00BC9A|9D0003  |000300;
                       INX                                  ;00BC9D|E8      |      ;
                       STX.B r_VramQueueNextIdxToFill       ;00BC9E|861D    |00001D;
                       db $20                               ;00BCA0|        |      ;
 
                       dw CODE_0FED12                       ;00BCA1|        |0FED12;
                       LDA.B #$02                           ;00BCA3|A902    |      ;
                       STA.B $01                            ;00BCA5|8501    |000001;
                       LDX.B r_RoomSectionChrBanksDataOffset;00BCA7|A60F    |00000F;
                       LDA.W r_EffectSpeedSupGeneral,X      ;00BCA9|BD8507  |000785;
                       ASL A                                ;00BCAC|0A      |      ;
                       SEC                                  ;00BCAD|38      |      ;
                       SBC.B #$02                           ;00BCAE|E902    |      ;
                       STA.B $00                            ;00BCB0|8500    |000000;
                       LDA.B r_CurrentRoomEffect            ;00BCB2|A57D    |00007D;
                       AND.B #$0F                           ;00BCB4|290F    |      ;
                       BEQ CODE_00BCC0                      ;00BCB6|F008    |00BCC0;
                       LDA.W r_EntityYPos                   ;00BCB8|AD1C04  |00041C;
                       BPL CODE_00BCC0                      ;00BCBB|1003    |00BCC0;
                       CLC                                  ;00BCBD|18      |      ;
 
                       INC.B $00                            ;00BCBE|E600    |000000;
 
          CODE_00BCC0: LDA.W r_EffectSpeedGeneral,X         ;00BCC0|BD8407  |000784;
 
                       LSR A                                ;00BCC3|4A      |      ;
                       LSR A                                ;00BCC4|4A      |      ;
                       LSR A                                ;00BCC5|4A      |      ;
                       LSR A                                ;00BCC6|4A      |      ;
                       TAY                                  ;00BCC7|A8      |      ;
                       LDA.W r_EffectSpeedGeneral,X         ;00BCC8|BD8407  |000784;
                       AND.B #$0F                           ;00BCCB|290F    |      ;
                       LSR A                                ;00BCCD|4A      |      ;
                       ORA.W UNREACH_0FFD61,Y               ;00BCCE|1961FD  |0FFD61;
 
          CODE_00BCD1: CMP.B #$0C                           ;00BCD1|C90C    |      ;
                       BCC CODE_00BCDA                      ;00BCD3|9005    |00BCDA;
                       SBC.B #$0C                           ;00BCD5|E90C    |      ;
                       JMP.W CODE_00BCD1                    ;00BCD7|4CD1BC  |00BCD1;
 
 
          CODE_00BCDA: TAY                                  ;00BCDA|A8      |      ;
                       LDA.W UNREACH_0FFD4C,Y               ;00BCDB|B94CFD  |0FFD4C;
                       CLC                                  ;00BCDE|18      |      ;
                       ADC.B $00                            ;00BCDF|6500    |000000;
                       TAY                                  ;00BCE1|A8      |      ;
                       LDA.B #$88                           ;00BCE2|A988    |      ;
                       STA.W r_CurrCollisionMapValues90,Y   ;00BCE4|99E006  |0006E0;
                       RTS                                  ;00BCE7|60      |      ;
 
                       LDA.B #$1C                           ;00BCE8|A91C    |      ;
                       db $20                               ;00BCEA|        |      ;
                       dw screenLoadRoutine                 ;00BCEB|        |0FECE9;
                       LDA.B #$04                           ;00BCED|A904    |      ;
                       db $20                               ;00BCEF|        |      ;
                       dw screenLoadRoutine                 ;00BCF0|        |0FECE9;
                       INC.B r_MenuOptionIdxSelected        ;00BCF2|E66B    |00006B;
                       RTS                                  ;00BCF4|60      |      ;
 
 
          CODE_00BCF5: JSR.W CODE_00BDDA                    ;00BCF5|20DABD  |00BDDA;
                       LDY.B #$00                           ;00BCF8|A000    |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BCFA|B108    |000008;
                       ASL A                                ;00BCFC|0A      |      ;
                       ASL A                                ;00BCFD|0A      |      ;
                       ASL A                                ;00BCFE|0A      |      ;
                       CLC                                  ;00BCFF|18      |      ;
                       ADC.B #$C0                           ;00BD00|69C0    |      ;
                       STA.B r_VramQueueDest                ;00BD02|8561    |000061;
                       LDA.B r_CurrScrollOffsetIntoRoomScreen;00BD04|A556    |000056;
                       STA.B r_DoubleCurrGroup              ;00BD06|850C    |00000C;
                       LDA.B r_CurrScrollRoomScreen         ;00BD08|A557    |000057;
                       LSR A                                ;00BD0A|4A      |      ;
                       ROR.B r_DoubleCurrGroup              ;00BD0B|660C    |00000C;
                       LSR A                                ;00BD0D|4A      |      ;
                       ROR.B r_DoubleCurrGroup              ;00BD0E|660C    |00000C;
                       LSR A                                ;00BD10|4A      |      ;
                       ROR.B r_DoubleCurrGroup              ;00BD11|660C    |00000C;
                       LSR A                                ;00BD13|4A      |      ;
                       ROR.B r_DoubleCurrGroup              ;00BD14|660C    |00000C;
                       LSR A                                ;00BD16|4A      |      ;
                       ROR.B r_DoubleCurrGroup              ;00BD17|660C    |00000C;
                       LDA.B r_DoubleCurrGroup              ;00BD19|A50C    |00000C;
                       SEC                                  ;00BD1B|38      |      ;
                       SBC.B #$02                           ;00BD1C|E902    |      ;
                       BPL CODE_00BD22                      ;00BD1E|1002    |00BD22;
                       LDA.B #$00                           ;00BD20|A900    |      ;
 
          CODE_00BD22: STA.B r_DoubleCurrGroup              ;00BD22|850C    |00000C;
                       LDA.B $75                            ;00BD24|A575    |000075;
                       ASL A                                ;00BD26|0A      |      ;
                       ASL A                                ;00BD27|0A      |      ;
                       ASL A                                ;00BD28|0A      |      ;
                       AND.B #$08                           ;00BD29|2908    |      ;
                       STA.B $00                            ;00BD2B|8500    |000000;
                       LDA.B r_DoubleCurrGroup              ;00BD2D|A50C    |00000C;
                       AND.B #$07                           ;00BD2F|2907    |      ;
                       STA.B $02                            ;00BD31|8502    |000002;
                       LDA.B r_DoubleCurrGroup              ;00BD33|A50C    |00000C;
                       AND.B #$08                           ;00BD35|2908    |      ;
                       EOR.B $00                            ;00BD37|4500    |000000;
                       BEQ CODE_00BD3F                      ;00BD39|F004    |00BD3F;
                       LDA.B #$27                           ;00BD3B|A927    |      ;
                       BNE CODE_00BD41                      ;00BD3D|D002    |00BD41;
 
          CODE_00BD3F: LDA.B #$23                           ;00BD3F|A923    |      ;
 
          CODE_00BD41: STA.B $62                            ;00BD41|8562    |000062;
                       STA.B $04                            ;00BD43|8504    |000004;
                       LDA.B $02                            ;00BD45|A502    |000002;
                       CLC                                  ;00BD47|18      |      ;
                       ADC.B r_VramQueueDest                ;00BD48|6561    |000061;
                       STA.B r_VramQueueDest                ;00BD4A|8561    |000061;
                       STA.B $05                            ;00BD4C|8505    |000005;
                       LDY.B #$01                           ;00BD4E|A001    |      ;
 
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BD50|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00BD52|850A    |00000A;
                       INY                                  ;00BD54|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BD55|B108    |000008;
                       STA.B $0B                            ;00BD57|850B    |00000B;
                       JSR.W CODE_00BD86                    ;00BD59|2086BD  |00BD86;
                       LDA.B $04                            ;00BD5C|A504    |000004;
                       STA.B $62                            ;00BD5E|8562    |000062;
                       LDA.B $05                            ;00BD60|A505    |000005;
                       CLC                                  ;00BD62|18      |      ;
                       ADC.B #$08                           ;00BD63|6908    |      ;
                       STA.B r_VramQueueDest                ;00BD65|8561    |000061;
                       LDY.B #$03                           ;00BD67|A003    |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BD69|B108    |000008;
                       STA.B r_CurrRoomSectionPlayerPosAndScreenAddr;00BD6B|850A    |00000A;
                       INY                                  ;00BD6D|C8      |      ;
                       LDA.B (r_CurrNumToVramQueue),Y       ;00BD6E|B108    |000008;
                       STA.B $0B                            ;00BD70|850B    |00000B;
                       JSR.W CODE_00BD86                    ;00BD72|2086BD  |00BD86;
                       LDA.W r_PlayerStateDoubled           ;00BD75|AD6505  |000565;
                       AND.B #$7F                           ;00BD78|297F    |      ;
                       STA.W r_PlayerStateDoubled           ;00BD7A|8D6505  |000565;
                       LDA.B #$68                           ;00BD7D|A968    |      ;
                       STA.B $C7                            ;00BD7F|85C7    |0000C7;
                       LDA.B #$1B                           ;00BD81|A91B    |      ;
                       STA.B r_InGameSubstate               ;00BD83|852A    |00002A;
                       RTS                                  ;00BD85|60      |      ;
 
 
          CODE_00BD86: LDY.B r_DoubleCurrGroup              ;00BD86|A40C    |00000C;
                       LDA.B #$0C                           ;00BD88|A90C    |      ;
                       STA.B r_RoomSectionChrBanksDataOffset;00BD8A|850F    |00000F;
 
          CODE_00BD8C: LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BD8C|B10A    |00000A;
                       CMP.B #$FF                           ;00BD8E|C9FF    |      ;
                       BEQ CODE_00BDC5                      ;00BD90|F033    |00BDC5;
                       CMP.B #$0A                           ;00BD92|C90A    |      ;
                       BEQ DATA8_00BDC6                     ;00BD94|F030    |00BDC6;
                       CMP.B #$A5                           ;00BD96|C9A5    |      ;
                       BEQ DATA8_00BDC6                     ;00BD98|F02C    |00BDC6;
                       CMP.B #$AA                           ;00BD9A|C9AA    |      ;
                       BEQ DATA8_00BDC6                     ;00BD9C|F028    |00BDC6;
 
          CODE_00BD9E: DEC.B r_RoomSectionChrBanksDataOffset;00BD9E|C60F    |00000F;
                       BEQ CODE_00BDC5                      ;00BDA0|F023    |00BDC5;
                       LDA.B r_VramQueueDest                ;00BDA2|A561    |000061;
                       AND.B #$08                           ;00BDA4|2908    |      ;
                       STA.B $01                            ;00BDA6|8501    |000001;
                       INC.B r_VramQueueDest                ;00BDA8|E661    |000061;
                       LDA.B r_VramQueueDest                ;00BDAA|A561    |000061;
                       AND.B #$08                           ;00BDAC|2908    |      ;
                       EOR.B $01                            ;00BDAE|4501    |000001;
                       BNE CODE_00BDB5                      ;00BDB0|D003    |00BDB5;
 
          CODE_00BDB2: INY                                  ;00BDB2|C8      |      ;
                       BNE CODE_00BD8C                      ;00BDB3|D0D7    |00BD8C;
 
          CODE_00BDB5: LDA.B r_VramQueueDest                ;00BDB5|A561    |000061;
                       SEC                                  ;00BDB7|38      |      ;
                       SBC.B #$08                           ;00BDB8|E908    |      ;
                       STA.B r_VramQueueDest                ;00BDBA|8561    |000061;
                       LDA.B $62                            ;00BDBC|A562    |000062;
 
                       EOR.B #$04                           ;00BDBE|4904    |      ;
                       STA.B $62                            ;00BDC0|8562    |000062;
                       JMP.W CODE_00BDB2                    ;00BDC2|4CB2BD  |00BDB2;
 
 
          CODE_00BDC5: RTS                                  ;00BDC5|60      |      ;
 
 
         DATA8_00BDC6: db $20                               ;00BDC6|        |      ;
                       dw CODE_0FE8B5                       ;00BDC7|        |0FE8B5;
                       LDA.B (r_CurrRoomSectionPlayerPosAndScreenAddr),Y;00BDC9|B10A    |00000A;
                       STA.W r_VramQueue,X                  ;00BDCB|9D0003  |000300;
                       INX                                  ;00BDCE|E8      |      ;
                       LDA.B #$FF                           ;00BDCF|A9FF    |      ;
                       STA.W r_VramQueue,X                  ;00BDD1|9D0003  |000300;
                       INX                                  ;00BDD4|E8      |      ;
                       STX.B r_VramQueueNextIdxToFill       ;00BDD5|861D    |00001D;
                       BNE CODE_00BD9E                      ;00BDD7|D0C5    |00BD9E;
                       RTS                                  ;00BDD9|60      |      ;
 
 
          CODE_00BDDA: LDA.W $0789                          ;00BDDA|AD8907  |000789;
                       JMP.W CODE_00BDF1                    ;00BDDD|4CF1BD  |00BDF1;
 
 
          CODE_00BDE0: LDA.B r_CurrentRoomEffect            ;00BDE0|A57D    |00007D;
                       AND.B #$0F                           ;00BDE2|290F    |      ;
                       BEQ CODE_00BDEE                      ;00BDE4|F008    |00BDEE;
                       LDY.W r_EntityYPos                   ;00BDE6|AC1C04  |00041C;
                       BPL CODE_00BDEE                      ;00BDE9|1003    |00BDEE;
                       CLC                                  ;00BDEB|18      |      ;
                       ADC.B #$01                           ;00BDEC|6901    |      ;
 
          CODE_00BDEE: STA.W $0789                          ;00BDEE|8D8907  |000789;
 
          CODE_00BDF1: ASL A                                ;00BDF1|0A      |      ;
                       TAY                                  ;00BDF2|A8      |      ;
                       LDA.W DATA8_00BDFE,Y                 ;00BDF3|B9FEBD  |00BDFE;
 
                       STA.B r_CurrNumToVramQueue           ;00BDF6|8508    |000008;
                       LDA.W DATA8_00BDFF,Y                 ;00BDF8|B9FFBD  |00BDFF;
                       STA.B $09                            ;00BDFB|8509    |000009;
                       RTS                                  ;00BDFD|60      |      ;
 
 
         DATA8_00BDFE: db $72                               ;00BDFE|        |      ;
 
         DATA8_00BDFF: db $BE,$04,$BE,$09,$BE               ;00BDFF|        |      ;
                       db $03,$0E,$BE,$27,$BE               ;00BE04|        |      ;
                       db $05,$40,$BE,$59,$BE               ;00BE09|        |      ;
                       db $00,$00,$00,$00,$00               ;00BE0E|        |      ;
                       db $AA,$0A,$0A,$0A,$0A               ;00BE13|        |      ;
                       db $0A,$0A,$0A,$0A,$0A               ;00BE18|        |      ;
                       db $0A,$0A,$AA,$00,$00               ;00BE1D|        |      ;
                       db $00,$00,$00,$00,$FF               ;00BE22|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00BE27|        |      ;
                       db $AA,$00,$00,$00,$00               ;00BE2C|        |      ;
                       db $00,$00,$00,$00,$00               ;00BE31|        |      ;
                       db $00,$00,$AA,$00,$00               ;00BE36|        |      ;
                       db $00,$00,$00,$00,$FF               ;00BE3B|        |      ;
                       db $00,$00,$A5,$A5,$A5               ;00BE40|        |      ;
                       db $AA,$A5,$A5,$A5,$A5               ;00BE45|        |      ;
                       db $A5,$A5,$A5,$A5,$A5               ;00BE4A|        |      ;
 
                       db $A5,$A5,$AA,$A5,$A5               ;00BE4F|        |      ;
                       db $A5,$A5,$00,$00,$FF               ;00BE54|        |      ;
 
                       db $00,$00,$AA,$00,$00               ;00BE59|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00BE5E|        |      ;
                       db $00,$00,$00,$00,$00               ;00BE63|        |      ;
                       db $00,$00,$00,$00,$00               ;00BE68|        |      ;
                       db $00,$AA,$00,$00,$FF               ;00BE6D|        |      ;
                       db $04,$77,$BE,$98,$BE               ;00BE72|        |      ;
                       db $00,$00,$AA,$0A,$0A               ;00BE77|        |      ;
                       db $0A,$0A,$0A,$0A,$0A               ;00BE7C|        |      ;
                       db $0A,$0A,$0A,$0A,$0A               ;00BE81|        |      ;
                       db $0A,$0A,$0A,$0A,$0A               ;00BE86|        |      ;
                       db $0A,$0A,$0A,$0A,$0A               ;00BE8B|        |      ;
                       db $0A,$0A,$AA,$00,$00               ;00BE90|        |      ;
                       db $00,$00,$FF,$00,$00               ;00BE95|        |      ;
                       db $0A,$00,$00,$00,$00               ;00BE9A|        |      ;
                       db $00,$00,$00,$00,$00               ;00BE9F|        |      ;
                       db $00,$00,$00,$00,$00               ;00BEA4|        |      ;
                       db $00,$00,$00,$00,$00               ;00BEA9|        |      ;
                       db $00,$00,$00,$00,$00               ;00BEAE|        |      ;
                       db $AA,$00,$00,$00,$00               ;00BEB3|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEB8|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEBD|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEC2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEC7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BECC|        |      ;
 
                       db $FF,$FF,$FF,$FF,$FF               ;00BED1|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BED6|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEDB|        |      ;
 
                       db $FF,$FF,$FF,$FF,$FF               ;00BEE0|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEE5|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEEA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEEF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEF4|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEF9|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BEFE|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF03|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF08|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF0D|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF12|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF17|        |      ;
 
                       db $FF,$FF,$FF,$FF,$FF               ;00BF1C|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF21|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF26|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF2B|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF30|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF35|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF3A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF3F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF44|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF49|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF4E|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF53|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF58|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF5D|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF62|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF67|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF6C|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF71|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF76|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF7B|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF80|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF85|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF8A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF8F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF94|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF99|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BF9E|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFA3|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFA8|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFAD|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFB2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFB7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFBC|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFC1|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFC6|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFCB|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFD0|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFD5|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFDA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFDF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFE4|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFE9|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFEE|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFF3|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00BFF8|        |      ;
                       db $FF,$FF,$FF                       ;00BFFD|        |      ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
