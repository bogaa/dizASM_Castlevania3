 
                       ORG $008000
 
 
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
 
     commonDPCMdata00: db $3F,$FC,$7F,$DC,$E1               ;00C000|        |      ; NES PRG E000
 
                       db $F9,$0F,$DF,$F7,$00               ;00C005|        |      ;
                       db $00,$00,$80,$FD,$FF               ;00C00A|        |      ;
                       db $FF,$FF,$FE,$FE,$7E               ;00C00F|        |      ;
                       db $00,$00,$04,$21,$12               ;00C014|        |      ;
                       db $FC,$FF,$FF,$FF,$07               ;00C019|        |      ;
                       db $00,$00,$00,$00,$C0               ;00C01E|        |      ;
                       db $B7,$FB,$FF,$FF,$FF               ;00C023|        |      ;
                       db $FF,$FE,$FE,$FE,$02               ;00C028|        |      ;
                       db $00,$80,$20,$44,$21               ;00C02D|        |      ;
                       db $49,$32,$46,$19,$23               ;00C032|        |      ;
                       db $F8,$FF,$FF,$FF,$FF               ;00C037|        |      ;
                       db $00,$00,$00,$00,$AF               ;00C03C|        |      ;
                       db $5F,$E6,$B3,$18,$1B               ;00C041|        |      ;
                       db $60,$C7,$79,$50,$38               ;00C046|        |      ;
                       db $11,$58,$5F,$F8,$ED               ;00C04B|        |      ;
                       db $D1,$16,$BF,$AC,$25               ;00C050|        |      ;
                       db $1C,$09,$32,$78,$9A               ;00C055|        |      ;
                       db $5E,$9E,$BE,$75,$86               ;00C05A|        |      ;
                       db $83,$48,$4A,$C9,$9D               ;00C05F|        |      ;
                       db $D9,$B0,$6D,$5E,$8D               ;00C064|        |      ;
                       db $35,$8A,$E1,$C2,$8D               ;00C069|        |      ;
                       db $EA,$D9,$F4,$29,$53               ;00C06E|        |      ;
                       db $0C,$8D,$B4,$52,$A7               ;00C073|        |      ;
                       db $9B,$C7,$B2,$72,$B2               ;00C078|        |      ;
                       db $C6,$28,$4B,$96,$D9               ;00C07D|        |      ;
                       db $26,$5E,$5D,$3C,$29               ;00C082|        |      ;
                       db $53,$51,$E6,$E2,$D1               ;00C087|        |      ;
                       db $5A,$8D,$AB,$26,$63               ;00C08C|        |      ;
                       db $95,$31,$4B,$8B,$AD               ;00C091|        |      ;
                       db $6A,$E5,$AC,$32,$E3               ;00C096|        |      ;
                       db $A4,$A9,$49,$AB,$9C               ;00C09B|        |      ;
                       db $66,$D5,$B4,$9C,$31               ;00C0A0|        |      ;
                       db $99,$34,$B5,$C9,$AA               ;00C0A5|        |      ;
 
                       db $65,$55,$35,$65,$A5               ;00C0AA|        |      ;
                       db $A6,$A3,$A9,$9A,$36               ;00C0AF|        |      ;
                       db $56,$35,$55,$59,$95               ;00C0B4|        |      ;
                       db $A5,$AA,$99,$6A,$65               ;00C0B9|        |      ;
                       db $65,$55,$55,$4D,$95               ;00C0BE|        |      ;
                       db $AA,$6A,$A6,$59,$65               ;00C0C3|        |      ;
                       db $55,$69,$96,$65,$AA               ;00C0C8|        |      ;
                       db $95,$AA,$A9,$6A,$59               ;00C0CD|        |      ;
                       db $55,$55,$55,$95,$66               ;00C0D2|        |      ;
                       db $A6,$9A,$A6,$95,$59               ;00C0D7|        |      ;
                       db $55,$55,$95,$99,$99               ;00C0DC|        |      ;
 
                       db $AA,$9A,$59,$55,$59               ;00C0E1|        |      ;
                       db $55,$55,$55,$59,$96               ;00C0E6|        |      ;
                       db $99,$6A,$66,$55,$55               ;00C0EB|        |      ;
 
                       db $55,$55,$55,$55,$AA               ;00C0F0|        |      ;
                       db $A6,$66,$56,$55,$55               ;00C0F5|        |      ;
                       db $55,$55,$55,$59,$59               ;00C0FA|        |      ;
                       db $55,$56,$56,$55,$55               ;00C0FF|        |      ;
                       db $55,$55,$55,$55,$66               ;00C104|        |      ;
                       db $65,$65,$55,$55,$55               ;00C109|        |      ;
                       db $55,$55,$FF,$55,$AA               ;00C10E|        |      ;
                       db $AA,$AA,$AA,$AA,$AA               ;00C113|        |      ;
                       db $AA,$AA,$AA,$AA,$AA               ;00C118|        |      ;
                       db $AA,$AA,$AA,$31,$37               ;00C11D|        |      ;
                       db $09,$80,$18,$60,$00               ;00C122|        |      ;
                       db $C0,$20,$2F,$3A,$A3               ;00C127|        |      ;
                       db $EE,$3C,$EF,$77,$57               ;00C12C|        |      ;
                       db $EF,$9F,$AF,$FF,$DE               ;00C131|        |      ;
                       db $BF,$9E,$C9,$24,$41               ;00C136|        |      ;
                       db $09,$09,$09,$29,$00               ;00C13B|        |      ;
                       db $A8,$6A,$6A,$AA,$A9               ;00C140|        |      ;
                       db $A6,$96,$9A,$AA,$56               ;00C145|        |      ;
                       db $55,$AA,$54,$E9,$7F               ;00C14A|        |      ;
                       db $41,$2F,$00,$80,$FA               ;00C14F|        |      ;
                       db $FF,$FF,$8D,$01,$00               ;00C154|        |      ;
                       db $80,$FF,$FF,$17,$6E               ;00C159|        |      ;
                       db $00,$00,$F8,$FC,$FF               ;00C15E|        |      ;
                       db $4F,$07,$00,$00,$FC               ;00C163|        |      ;
                       db $FF,$FF,$01,$55,$11               ;00C168|        |      ;
                       db $00,$F4,$EF,$FB,$97               ;00C16D|        |      ;
                       db $48,$0B,$00,$C0,$FF               ;00C172|        |      ;
                       db $FF,$0F,$94,$24,$41               ;00C177|        |      ;
                       db $44,$6B,$FF,$5F,$2A               ;00C17C|        |      ;
                       db $AA,$05,$00,$D4,$FE               ;00C181|        |      ;
                       db $FF,$6D,$01,$C4,$12               ;00C186|        |      ;
                       db $52,$B5,$75,$FF,$13               ;00C18B|        |      ;
                       db $28,$DA,$21,$20,$ED               ;00C190|        |      ;
                       db $BE,$FF,$45,$40,$29               ;00C195|        |      ;
                       db $91,$52,$75,$FF,$BB               ;00C19A|        |      ;
                       db $24,$80,$BA,$4A,$A4               ;00C19F|        |      ;
                       db $EA,$7E,$6F,$12,$91               ;00C1A4|        |      ;
                       db $AA,$4A,$C8,$74,$DF               ;00C1A9|        |      ;
                       db $AF,$89,$48,$4A,$52               ;00C1AE|        |      ;
                       db $B5,$B2,$EE,$B7,$A4               ;00C1B3|        |      ;
                       db $88,$54,$35,$A5,$54               ;00C1B8|        |      ;
 
                       db $ED,$6F,$55,$22,$A5               ;00C1BD|        |      ;
                       db $4A,$25,$55,$EB,$DE               ;00C1C2|        |      ;
                       db $56,$49,$A2,$92,$AA               ;00C1C7|        |      ;
                       db $AA,$56,$DB,$5D,$49               ;00C1CC|        |      ;
                       db $92,$52,$D5,$54,$AA               ;00C1D1|        |      ;
                       db $DA,$BD,$95,$44,$AA               ;00C1D6|        |      ;
                       db $AA,$54,$4A,$ED,$6E               ;00C1DB|        |      ;
                       db $AB,$52,$92,$2A,$55               ;00C1E0|        |      ;
                       db $AA,$5A,$DB,$56,$55               ;00C1E5|        |      ;
                       db $4A,$95,$52,$55,$55               ;00C1EA|        |      ;
                       db $D5,$DA,$5A,$95,$52               ;00C1EF|        |      ;
                       db $AA,$54,$55,$55,$D6               ;00C1F4|        |      ;
                       db $76,$2D,$25,$A5,$AC               ;00C1F9|        |      ;
                       db $4A,$95,$6A,$DB,$56               ;00C1FE|        |      ;
                       db $95,$52,$AA,$AA,$54               ;00C203|        |      ;
                       db $55,$AD,$B5,$96,$2A               ;00C208|        |      ;
                       db $55,$A5,$4A,$55,$D5               ;00C20D|        |      ;
                       db $AA,$B5,$AA,$AA,$54               ;00C212|        |      ;
                       db $2A,$55,$55,$D5,$AA               ;00C217|        |      ;
                       db $AD,$55,$4A,$A9,$AA               ;00C21C|        |      ;
                       db $AA,$54,$D5,$5A,$AB               ;00C221|        |      ;
                       db $AA,$52,$AA,$AA,$2A               ;00C226|        |      ;
                       db $55,$D5,$D6,$AA,$2A               ;00C22B|        |      ;
                       db $55,$95,$AA,$54,$55               ;00C230|        |      ;
                       db $6B,$55,$AB,$AA,$54               ;00C235|        |      ;
                       db $A9,$52,$55,$B5,$6A               ;00C23A|        |      ;
                       db $55,$52,$B5,$8A,$5A               ;00C23F|        |      ;
                       db $57,$42,$5D,$3B,$A4               ;00C244|        |      ;
                       db $FC,$88,$B4,$F3,$A0               ;00C249|        |      ;
                       db $EA,$70,$CD,$09,$39               ;00C24E|        |      ;
                       db $5F,$A1,$F1,$C6,$12               ;00C253|        |      ;
                       db $A7,$53,$7B,$A0,$F8               ;00C258|        |      ;
                       db $A1,$F5,$64,$81,$1F               ;00C25D|        |      ;
                       db $FC,$09,$F8,$0F,$80               ;00C262|        |      ;
                       db $FF,$01,$FC,$B0,$FE               ;00C267|        |      ;
                       db $03,$E0,$0F,$F0,$0F               ;00C26C|        |      ;
                       db $F0,$3F,$00,$FF,$01               ;00C271|        |      ;
                       db $3F,$80,$7F,$F8,$03               ;00C276|        |      ;
                       db $FC,$E0,$F0,$FF,$00               ;00C27B|        |      ;
                       db $10,$7F,$0F,$FC,$07               ;00C280|        |      ;
                       db $E0,$0F,$E0,$07,$FE               ;00C285|        |      ;
                       db $00,$7F,$F0,$0F,$C0               ;00C28A|        |      ;
                       db $7F,$C0,$0F,$F0,$1F               ;00C28F|        |      ;
                       db $08,$FF,$03,$F8,$01               ;00C294|        |      ;
                       db $F6,$FD,$03,$F0,$3F               ;00C299|        |      ;
                       db $E0,$07,$F8,$0F,$F0               ;00C29E|        |      ;
                       db $27,$E0,$07,$F0,$0F               ;00C2A3|        |      ;
                       db $F0,$3F,$C0,$1F,$80               ;00C2A8|        |      ;
                       db $3F,$F0,$FF,$00,$F0               ;00C2AD|        |      ;
                       db $1F,$F0,$0F,$F0,$3F               ;00C2B2|        |      ;
                       db $00,$FF,$00,$7E,$3E               ;00C2B7|        |      ;
                       db $F8,$20,$F0,$1F,$E0               ;00C2BC|        |      ;
                       db $3F,$80,$FD,$0F,$00               ;00C2C1|        |      ;
                       db $FF,$03,$F0,$1F,$80               ;00C2C6|        |      ;
                       db $3F,$EE,$08,$F8,$0F               ;00C2CB|        |      ;
                       db $D8,$3F,$00,$FD,$0F               ;00C2D0|        |      ;
                       db $D8,$3F,$00,$FF,$0B               ;00C2D5|        |      ;
                       db $C0,$0F,$07,$B7,$CD               ;00C2DA|        |      ;
                       db $80,$5F,$DC,$10,$CF               ;00C2DF|        |      ;
                       db $1F,$18,$F0,$DB,$C0               ;00C2E4|        |      ;
                       db $EE,$39,$C0,$83,$3F               ;00C2E9|        |      ;
                       db $06,$3E,$FE,$18,$38               ;00C2EE|        |      ;
                       db $F8,$7D,$C0,$83,$E1               ;00C2F3|        |      ;
                       db $0F,$1F,$3C,$1A,$3E               ;00C2F8|        |      ;
                       db $E0,$E1,$FF,$C0,$E1               ;00C2FD|        |      ;
                       db $01,$FC,$87,$83,$C3               ;00C302|        |      ;
                       db $FB,$00,$CE,$0F,$C7               ;00C307|        |      ;
                       db $C7,$03,$4F,$3C,$70               ;00C30C|        |      ;
                       db $87,$1F,$3E,$E0,$19               ;00C311|        |      ;
                       db $E3,$C0,$E1,$87,$FB               ;00C316|        |      ;
                       db $81,$3F,$E0,$03,$C7               ;00C31B|        |      ;
                       db $0F,$3C,$F8,$C1,$0F               ;00C320|        |      ;
                       db $B8,$7F,$C0,$87,$0F               ;00C325|        |      ;
                       db $3E,$F8,$81,$4F,$E0               ;00C32A|        |      ;
                       db $07,$FC,$E0,$7C,$F8               ;00C32F|        |      ;
                       db $30,$C0,$38,$7E,$F0               ;00C334|        |      ;
                       db $F9,$F0,$C1,$E5,$E1               ;00C339|        |      ;
                       db $83,$C3,$07,$FE,$0F               ;00C33E|        |      ;
                       db $F8,$E0,$E0,$1F,$80               ;00C343|        |      ;
                       db $61,$FF,$80,$1F,$7C               ;00C348|        |      ;
                       db $78,$E0,$0F,$F8,$0F               ;00C34D|        |      ;
                       db $78,$F0,$01,$1F,$C0               ;00C352|        |      ;
                       db $3F,$F0,$79,$F0,$E1               ;00C357|        |      ;
                       db $C3,$87,$87,$03,$C3               ;00C35C|        |      ;
                       db $0F,$7F,$C0,$07,$3F               ;00C361|        |      ;
                       db $F0,$03,$3F,$3C,$F0               ;00C366|        |      ;
                       db $B0,$37,$F8,$E0,$87               ;00C36B|        |      ;
                       db $87,$8F,$0F,$3C,$3C               ;00C370|        |      ;
                       db $38,$10,$FE,$31,$78               ;00C375|        |      ;
                       db $F8,$03,$1F,$0E,$F8               ;00C37A|        |      ;
                       db $FC,$F0,$C3,$38,$E3               ;00C37F|        |      ;
                       db $21,$2E,$38,$1E,$F3               ;00C384|        |      ;
                       db $E0,$86,$7F,$F8,$83               ;00C389|        |      ;
 
                       db $0F,$06,$3F,$C0,$1F               ;00C38E|        |      ;
                       db $F8,$01,$7E,$38,$1F               ;00C393|        |      ;
                       db $24,$FC,$70,$3C,$3C               ;00C398|        |      ;
                       db $7E,$70,$62,$1C,$0F               ;00C39D|        |      ;
                       db $1F,$1E,$1F,$3E,$78               ;00C3A2|        |      ;
                       db $78,$70,$78,$78,$3C               ;00C3A7|        |      ;
                       db $3C,$71,$0E,$3C,$B8               ;00C3AC|        |      ;
                       db $67,$0E,$DC,$63,$FC               ;00C3B1|        |      ;
                       db $E0,$78,$F0,$C3,$83               ;00C3B6|        |      ;
                       db $E1,$83,$07,$7E,$F8               ;00C3BB|        |      ;
                       db $E1,$C1,$F1,$F0,$F0               ;00C3C0|        |      ;
                       db $E1,$07,$3C,$E4,$71               ;00C3C5|        |      ;
                       db $70,$7C,$3C,$F8,$30               ;00C3CA|        |      ;
                       db $78,$3C,$1C,$FE,$81               ;00C3CF|        |      ;
                       db $07,$6F,$1C,$3F,$E0               ;00C3D4|        |      ;
                       db $1F,$1E,$3C,$8C,$71               ;00C3D9|        |      ;
                       db $1E,$C3,$0D,$87,$C3               ;00C3DE|        |      ;
                       db $E3,$E0,$C3,$C3,$0F               ;00C3E3|        |      ;
                       db $1F,$38,$7C,$78,$78               ;00C3E8|        |      ;
                       db $C8,$39,$CE,$07,$7F               ;00C3ED|        |      ;
                       db $8C,$C3,$1C,$F0,$98               ;00C3F2|        |      ;
                       db $3D,$F8,$81,$87,$C3               ;00C3F7|        |      ;
                       db $C3,$0F,$FE,$C0,$E3               ;00C3FC|        |      ;
                       db $81,$E3,$87,$C7,$0C               ;00C401|        |      ;
                       db $3F,$1C,$1E,$7C,$38               ;00C406|        |      ;
                       db $E6,$0F,$0E,$1F,$0F               ;00C40B|        |      ;
                       db $C0,$E3,$70,$78,$78               ;00C410|        |      ;
                       db $1C,$0E,$0F,$7E,$78               ;00C415|        |      ;
                       db $1C,$79,$F0,$E1,$87               ;00C41A|        |      ;
                       db $E3,$E3,$0E,$3E,$3C               ;00C41F|        |      ;
                       db $E0,$0D,$E7,$81,$C7               ;00C424|        |      ;
                       db $83,$0F,$E7,$18,$0F               ;00C429|        |      ;
                       db $78,$78,$7C,$38,$FC               ;00C42E|        |      ;
                       db $E0,$61,$C7,$19,$0F               ;00C433|        |      ;
                       db $DE,$38,$F0,$70,$78               ;00C438|        |      ;
                       db $78,$F0,$F0,$78,$78               ;00C43D|        |      ;
                       db $F8,$33,$8F,$83,$C3               ;00C442|        |      ;
                       db $C3,$C3,$C3,$07,$92               ;00C447|        |      ;
                       db $C3,$0F,$0F,$8F,$87               ;00C44C|        |      ;
                       db $83,$07,$1F,$7B,$FC               ;00C451|        |      ;
                       db $E0,$E1,$C3,$1F,$38               ;00C456|        |      ;
                       db $0E,$0E,$73,$8E,$F1               ;00C45B|        |      ;
                       db $1C,$3C,$8E,$63,$CC               ;00C460|        |      ;
                       db $38,$9C,$39,$1E,$1C               ;00C465|        |      ;
                       db $7C,$78,$F0,$70,$CF               ;00C46A|        |      ;
                       db $F8,$F0,$C3,$C7,$E3               ;00C46F|        |      ;
                       db $E0,$38,$F0,$C0,$11               ;00C474|        |      ;
                       db $77,$C6,$1C,$F3,$18               ;00C479|        |      ;
                       db $C7,$38,$E3,$C0,$1F               ;00C47E|        |      ;
                       db $C7,$0F,$3F,$78,$84               ;00C483|        |      ;
                       db $1F,$8E,$03,$0F,$3C               ;00C488|        |      ;
 
                       db $3C,$73,$DC,$21,$FE               ;00C48D|        |      ;
                       db $38,$1E,$1E,$1E,$1C               ;00C492|        |      ;
                       db $3C,$3C,$FC,$F1,$E1               ;00C497|        |      ;
                       db $F1,$C1,$03,$F8,$F0               ;00C49C|        |      ;
                       db $38,$3C,$1C,$87,$87               ;00C4A1|        |      ;
                       db $87,$C7,$0F,$8F,$87               ;00C4A6|        |      ;
                       db $19,$7E,$F8,$70,$F0               ;00C4AB|        |      ;
                       db $E0,$E1,$E1,$81,$07               ;00C4B0|        |      ;
                       db $3F,$F6,$B8,$03,$8F               ;00C4B5|        |      ;
                       db $60,$9E,$03,$3F,$87               ;00C4BA|        |      ;
                       db $0F,$8F,$63,$0E,$1F               ;00C4BF|        |      ;
                       db $F0,$C3,$63,$8C,$71               ;00C4C4|        |      ;
                       db $1C,$3C,$78,$F8,$E3               ;00C4C9|        |      ;
                       db $C1,$83,$1F,$C6,$F1               ;00C4CE|        |      ;
                       db $3C,$38,$DC,$31,$E0               ;00C4D3|        |      ;
                       db $8E,$E3,$87,$C3,$C3               ;00C4D8|        |      ;
                       db $03,$8F,$1F,$1E,$1E               ;00C4DD|        |      ;
                       db $E4,$0E,$67,$1E,$EC               ;00C4E2|        |      ;
                       db $70,$C7,$E1,$07,$1C               ;00C4E7|        |      ;
                       db $1E,$0F,$87,$3F,$78               ;00C4EC|        |      ;
                       db $38,$EC,$E1,$C3,$C1               ;00C4F1|        |      ;
                       db $C1,$13,$F3,$87,$0F               ;00C4F6|        |      ;
                       db $9E,$18,$C7,$F1,$C3               ;00C4FB|        |      ;
                       db $81,$63,$1C,$33,$8E               ;00C500|        |      ;
                       db $3B,$8E,$0F,$9C,$33               ;00C505|        |      ;
                       db $0E,$8F,$1D,$47,$3C               ;00C50A|        |      ;
                       db $9C,$73,$8E,$39,$E6               ;00C50F|        |      ;
                       db $87,$8F,$63,$38,$DC               ;00C514|        |      ;
                       db $31,$06,$0E,$0F,$C7               ;00C519|        |      ;
                       db $C3,$C3,$71,$3C,$FC               ;00C51E|        |      ;
                       db $C1,$C3,$8E,$39,$8E               ;00C523|        |      ;
                       db $0F,$1E,$CE,$06,$67               ;00C528|        |      ;
                       db $F0,$A1,$33,$C6,$19               ;00C52D|        |      ;
                       db $0F,$1E,$3E,$78,$0C               ;00C532|        |      ;
                       db $0F,$1E,$73,$F6,$E1               ;00C537|        |      ;
                       db $C0,$13,$E7,$C7,$83               ;00C53C|        |      ;
                       db $0F,$C7,$39,$8E,$39               ;00C541|        |      ;
                       db $E0,$F1,$38,$DC,$B1               ;00C546|        |      ;
                       db $71,$E0,$71,$8E,$3D               ;00C54B|        |      ;
                       db $1E,$1E,$1C,$1F,$3C               ;00C550|        |      ;
                       db $F0,$07,$1E,$1E,$8E               ;00C555|        |      ;
                       db $38,$0F,$3F,$3C,$78               ;00C55A|        |      ;
                       db $1C,$0F,$0F,$1C,$3F               ;00C55F|        |      ;
                       db $C4,$C1,$87,$3F,$BC               ;00C564|        |      ;
                       db $E1,$C3,$C3,$F1,$F0               ;00C569|        |      ;
                       db $30,$1E,$CE,$E0,$E1               ;00C56E|        |      ;
                       db $91,$07,$3E,$F1,$07               ;00C573|        |      ;
                       db $8F,$87,$07,$1F,$FC               ;00C578|        |      ;
                       db $38,$E6,$E0,$C1,$0F               ;00C57D|        |      ;
                       db $0E,$1E,$38,$1F,$E3               ;00C582|        |      ;
                       db $81,$E7,$1C,$C7,$87               ;00C587|        |      ;
                       db $0D,$C7,$71,$78,$E0               ;00C58C|        |      ;
                       db $E3,$E1,$78,$32,$FE               ;00C591|        |      ;
                       db $78,$E0,$63,$88,$07               ;00C596|        |      ;
                       db $FE,$E0,$E1,$F8,$F0               ;00C59B|        |      ;
                       db $31,$C3,$E3,$E1,$E0               ;00C5A0|        |      ;
                       db $07,$77,$46,$1E,$9C               ;00C5A5|        |      ;
                       db $C3,$C7,$61,$F8,$70               ;00C5AA|        |      ;
                       db $3C,$66,$38,$0F,$F0               ;00C5AF|        |      ;
                       db $39,$1E,$C7,$C3,$E3               ;00C5B4|        |      ;
                       db $C1,$83,$87,$87,$07               ;00C5B9|        |      ;
                       db $8F,$78,$F0,$E3,$63               ;00C5BE|        |      ;
                       db $F6,$08,$8E,$E3,$78               ;00C5C3|        |      ;
                       db $1C,$3E,$1C,$3C,$1C               ;00C5C8|        |      ;
                       db $E7,$70,$1C,$1E,$E7               ;00C5CD|        |      ;
                       db $E1,$CC,$E1,$F1,$E0               ;00C5D2|        |      ;
                       db $87,$07,$0F,$1E,$C6               ;00C5D7|        |      ;
                       db $C1,$CF,$C3,$C3,$E1               ;00C5DC|        |      ;
                       db $C1,$0F,$63,$1C,$7F               ;00C5E1|        |      ;
                       db $18,$3E,$3C,$78,$70               ;00C5E6|        |      ;
                       db $FC,$E0,$31,$7C,$3C               ;00C5EB|        |      ;
                       db $E0,$71,$3E,$07,$CF               ;00C5F0|        |      ;
                       db $F1,$70,$38,$8E,$87               ;00C5F5|        |      ;
                       db $E1,$1C,$C7,$63,$78               ;00C5FA|        |      ;
                       db $8C,$87,$C7,$E3,$03               ;00C5FF|        |      ;
                       db $3E,$78,$1C,$CE,$71               ;00C604|        |      ;
                       db $0E,$0F,$E7,$38,$26               ;00C609|        |      ;
                       db $7E,$78,$1C,$78,$3C               ;00C60E|        |      ;
                       db $61,$3C,$78,$3C,$E6               ;00C613|        |      ;
                       db $38,$8E,$E3,$E1,$78               ;00C618|        |      ;
                       db $E4,$31,$3E,$63,$1C               ;00C61D|        |      ;
                       db $C6,$F1,$78,$BC,$38               ;00C622|        |      ;
                       db $3C,$0E,$0F,$0F,$C7               ;00C627|        |      ;
                       db $F1,$01,$0F,$9F,$61               ;00C62C|        |      ;
                       db $8E,$3D,$7C,$78,$18               ;00C631|        |      ;
                       db $CE,$E1,$21,$1F,$CE               ;00C636|        |      ;
                       db $31,$7C,$3C,$BE,$E0               ;00C63B|        |      ;
                       db $18,$7C,$F8,$E0,$8D               ;00C640|        |      ;
                       db $C3,$81,$0F,$3E,$1E               ;00C645|        |      ;
                       db $0F,$1C,$E7,$71,$8C               ;00C64A|        |      ;
                       db $0F,$87,$87,$8F,$83               ;00C64F|        |      ;
                       db $C3,$A3,$C7,$C3,$E5               ;00C654|        |      ;
                       db $71,$38,$F8,$38,$3C               ;00C659|        |      ;
                       db $CE,$E0,$1D,$78,$78               ;00C65E|        |      ;
                       db $78,$78,$1C,$78,$F8               ;00C663|        |      ;
                       db $E0,$71,$0F,$67,$1C               ;00C668|        |      ;
                       db $3E,$86,$C3,$39,$7C               ;00C66D|        |      ;
                       db $9C,$C3,$1D,$0E,$0F               ;00C672|        |      ;
                       db $C7,$83,$C7,$E3,$38               ;00C677|        |      ;
                       db $98,$0F,$47,$FE,$55               ;00C67C|        |      ;
                       db $AB,$D5,$AA,$5A,$4B               ;00C681|        |      ;
                       db $95,$4A,$55,$A9,$54               ;00C686|        |      ;
                       db $D5,$D6,$AA,$A4,$35               ;00C68B|        |      ;
                       db $4B,$89,$52,$55,$D9               ;00C690|        |      ;
                       db $5B,$5F,$57,$75,$2A               ;00C695|        |      ;
                       db $49,$42,$92,$22,$4D               ;00C69A|        |      ;
                       db $D5,$76,$DB,$D7,$2A               ;00C69F|        |      ;
                       db $A5,$24,$92,$28,$52               ;00C6A4|        |      ;
                       db $A9,$7F,$DF,$DB,$6D               ;00C6A9|        |      ;
                       db $4F,$89,$20,$24,$82               ;00C6AE|        |      ;
                       db $88,$D2,$7B,$77,$AD               ;00C6B3|        |      ;
                       db $AA,$54,$8A,$41,$48               ;00C6B8|        |      ;
                       db $FF,$7F,$57,$7B,$5F               ;00C6BD|        |      ;
                       db $12,$02,$92,$22,$02               ;00C6C2|        |      ;
                       db $6A,$7B,$57,$AA,$6A               ;00C6C7|        |      ;
                       db $A5,$48,$10,$FF,$FF               ;00C6CC|        |      ;
                       db $77,$73,$7F,$45,$20               ;00C6D1|        |      ;
                       db $40,$89,$08,$2A,$B5               ;00C6D6|        |      ;
                       db $53,$95,$AA,$AA,$24               ;00C6DB|        |      ;
                       db $6A,$FF,$FF,$BF,$D6               ;00C6E0|        |      ;
                       db $57,$82,$00,$28,$49               ;00C6E5|        |      ;
                       db $88,$A8,$D6,$AC,$A4               ;00C6EA|        |      ;
                       db $D2,$8C,$DA,$FF,$FF               ;00C6EF|        |      ;
                       db $BF,$D6,$B5,$08,$08               ;00C6F4|        |      ;
                       db $20,$29,$82,$90,$D6               ;00C6F9|        |      ;
                       db $56,$25,$A9,$A6,$DD               ;00C6FE|        |      ;
                       db $FF,$FF,$AF,$DA,$35               ;00C703|        |      ;
                       db $22,$80,$A0,$A2,$80               ;00C708|        |      ;
                       db $A0,$5A,$A7,$94,$4A               ;00C70D|        |      ;
                       db $5B,$FD,$FF,$FF,$CD               ;00C712|        |      ;
                       db $7A,$8B,$02,$01,$8A               ;00C717|        |      ;
                       db $04,$22,$88,$76,$55               ;00C71C|        |      ;
                       db $52,$4A,$DB,$FF,$FF               ;00C721|        |      ;
                       db $D7,$76,$3F,$2A,$20               ;00C726|        |      ;
                       db $48,$49,$20,$08,$75               ;00C72B|        |      ;
                       db $55,$52,$4A,$DB,$FF               ;00C730|        |      ;
                       db $FF,$D7,$76,$3F,$2A               ;00C735|        |      ;
                       db $20,$48,$49,$20,$08               ;00C73A|        |      ;
                       db $75,$01,$3F,$08,$F0               ;00C73F|        |      ;
                       db $3F,$FE,$7F,$00,$8E               ;00C744|        |      ;
                       db $18,$F8,$1F,$FE,$FF               ;00C749|        |      ;
                       db $00,$08,$00,$F0,$3F               ;00C74E|        |      ;
                       db $FE,$FF,$00,$0E,$00               ;00C753|        |      ;
                       db $F0,$7F,$FE,$7F,$00               ;00C758|        |      ;
                       db $0E,$00,$F8,$1F,$FE               ;00C75D|        |      ;
                       db $7F,$00,$1F,$00,$F8               ;00C762|        |      ;
                       db $9F,$FF,$03,$00,$03               ;00C767|        |      ;
                       db $80,$FF,$EF,$FF,$07               ;00C76C|        |      ;
                       db $60,$0E,$80,$FF,$FF               ;00C771|        |      ;
                       db $07,$00,$00,$80,$FF               ;00C776|        |      ;
                       db $CF,$FF,$0F,$E0,$18               ;00C77B|        |      ;
                       db $80,$FF,$FF,$00,$1C               ;00C780|        |      ;
                       db $00,$F0,$1F,$F8,$FF               ;00C785|        |      ;
                       db $03,$7E,$00,$F0,$FF               ;00C78A|        |      ;
                       db $03,$F8,$01,$C0,$7F               ;00C78F|        |      ;
                       db $E0,$FF,$07,$F8,$07               ;00C794|        |      ;
                       db $E0,$7F,$00,$FC,$01               ;00C799|        |      ;
                       db $F0,$3F,$E0,$FF,$01               ;00C79E|        |      ;
                       db $FE,$03,$FE,$03,$80               ;00C7A3|        |      ;
                       db $07,$80,$FF,$07,$FF               ;00C7A8|        |      ;
                       db $0F,$C0,$3F,$FE,$03               ;00C7AD|        |      ;
                       db $00,$00,$80,$FF,$FF               ;00C7B2|        |      ;
                       db $FF,$0F,$C0,$FF,$3F               ;00C7B7|        |      ;
                       db $00,$00,$00,$F0,$FF               ;00C7BC|        |      ;
                       db $FE,$FF,$00,$CC,$FF               ;00C7C1|        |      ;
 
                       db $03,$00,$00,$00,$FF               ;00C7C6|        |      ;
                       db $F7,$FF,$0F,$E0,$E7               ;00C7CB|        |      ;
                       db $3F,$00,$00,$00,$F8               ;00C7D0|        |      ;
                       db $FF,$FF,$7F,$00,$3E               ;00C7D5|        |      ;
                       db $FC,$07,$00,$00,$00               ;00C7DA|        |      ;
                       db $FF,$E7,$FF,$0F,$60               ;00C7DF|        |      ;
                       db $FE,$7F,$00,$00,$00               ;00C7E4|        |      ;
                       db $F0,$FF,$FC,$FF,$01               ;00C7E9|        |      ;
                       db $DC,$F1,$1F,$00,$00               ;00C7EE|        |      ;
                       db $00,$FC,$BF,$FF,$3F               ;00C7F3|        |      ;
                       db $80,$79,$FC,$0F,$00               ;00C7F8|        |      ;
                       db $08,$00,$FE,$57,$F8               ;00C7FD|        |      ;
                       db $FF,$07,$F8,$01,$07               ;00C802|        |      ;
                       db $80,$7F,$C0,$FF,$0F               ;00C807|        |      ;
                       db $F8,$03,$0F,$00,$3F               ;00C80C|        |      ;
                       db $E0,$FF,$3F,$00,$01               ;00C811|        |      ;
                       db $1F,$00,$FE,$03,$FC               ;00C816|        |      ;
                       db $7F,$E0,$1F,$70,$00               ;00C81B|        |      ;
                       db $FE,$00,$FF,$FF,$80               ;00C820|        |      ;
                       db $7F,$00,$00,$FC,$07               ;00C825|        |      ;
                       db $F0,$FF,$0F,$FC,$83               ;00C82A|        |      ;
                       db $03,$E0,$0F,$E0,$FF               ;00C82F|        |      ;
                       db $7F,$00,$3F,$1E,$00               ;00C834|        |      ;
                       db $7F,$00,$FE,$FF,$01               ;00C839|        |      ;
                       db $F0,$7F,$00,$F8,$01               ;00C83E|        |      ;
                       db $FC,$FF,$1F,$C0,$0F               ;00C843|        |      ;
                       db $00,$E0,$3F,$C0,$FF               ;00C848|        |      ;
                       db $FF,$00,$3E,$38,$00               ;00C84D|        |      ;
                       db $7E,$C0,$FF,$FF,$1F               ;00C852|        |      ;
                       db $C0,$07,$00,$C0,$1F               ;00C857|        |      ;
                       db $E0,$FF,$FF,$01,$F0               ;00C85C|        |      ;
                       db $3F,$00,$F8,$C0,$FF               ;00C861|        |      ;
                       db $FF,$1F,$00,$0E,$00               ;00C866|        |      ;
                       db $80,$FF,$FF,$01,$FE               ;00C86B|        |      ;
                       db $1F,$C0,$0F,$00,$F0               ;00C870|        |      ;
                       db $0F,$FF,$81,$FF,$07               ;00C875|        |      ;
                       db $E0,$0F,$00,$F8,$3F               ;00C87A|        |      ;
                       db $FC,$07,$F0,$7F,$00               ;00C87F|        |      ;
                       db $7E,$00,$F8,$1F,$80               ;00C884|        |      ;
                       db $FF,$01,$FF,$0F,$E0               ;00C889|        |      ;
                       db $FF,$00,$00,$80,$FF               ;00C88E|        |      ;
                       db $07,$FC,$FF,$03,$FF               ;00C893|        |      ;
                       db $01,$00,$F8,$03,$F8               ;00C898|        |      ;
                       db $FF,$80,$FF,$FF,$03               ;00C89D|        |      ;
                       db $00,$00,$80,$FF,$BF               ;00C8A2|        |      ;
                       db $FF,$1F,$1E,$00,$00               ;00C8A7|        |      ;
                       db $F0,$FF,$1F,$00,$00               ;00C8AC|        |      ;
                       db $F0,$FF,$FF,$07,$E0               ;00C8B1|        |      ;
                       db $7F,$80,$3F,$00,$00               ;00C8B6|        |      ;
                       db $3C,$00,$FE,$FF,$FB               ;00C8BB|        |      ;
                       db $FF,$E0,$00,$00,$FF               ;00C8C0|        |      ;
                       db $01,$FE,$3F,$00,$18               ;00C8C5|        |      ;
                       db $08,$F8,$FF,$FF,$FF               ;00C8CA|        |      ;
                       db $01,$7F,$00,$7F,$00               ;00C8CF|        |      ;
                       db $E0,$33,$C0,$FF,$00               ;00C8D4|        |      ;
                       db $E0,$FE,$3F,$00,$FE               ;00C8D9|        |      ;
                       db $C1,$DF,$0F,$00,$FC               ;00C8DE|        |      ;
                       db $67,$00,$80,$FF,$3F               ;00C8E3|        |      ;
                       db $3C,$3E,$3E,$50,$00               ;00C8E8|        |      ;
                       db $FC,$03,$FE,$1F,$01               ;00C8ED|        |      ;
                       db $F8,$01,$FF,$27,$F0               ;00C8F2|        |      ;
                       db $FF,$00,$FC,$07,$00               ;00C8F7|        |      ;
                       db $3F,$80,$3F,$F8,$F9               ;00C8FC|        |      ;
                       db $FF,$00,$3E,$00,$F0               ;00C901|        |      ;
                       db $7F,$00,$FF,$3F,$1E               ;00C906|        |      ;
                       db $00,$FE,$00,$E0,$1F               ;00C90B|        |      ;
                       db $60,$FF,$FF,$01,$60               ;00C910|        |      ;
                       db $01,$FF,$0F,$00,$FE               ;00C915|        |      ;
                       db $07,$BE,$00,$7C,$F8               ;00C91A|        |      ;
                       db $FF,$01,$E0,$FF,$00               ;00C91F|        |      ;
                       db $4F,$00,$F8,$FF,$03               ;00C924|        |      ;
                       db $FC,$FF,$07,$00,$0E               ;00C929|        |      ;
                       db $0F,$E0,$7F,$00,$FF               ;00C92E|        |      ;
                       db $1F,$00,$07,$F8,$FF               ;00C933|        |      ;
                       db $61,$00,$FE,$1F,$F1               ;00C938|        |      ;
                       db $01,$F0,$85,$EF,$7F               ;00C93D|        |      ;
                       db $00,$BF,$00,$F8,$03               ;00C942|        |      ;
                       db $FE,$7F,$60,$1D                   ;00C947|        |      ;
 
         DATA8_00C94B: db $F8,$1F,$00,$10,$FA               ;00C94B|        |      ;
                       db $FF,$03,$FC,$81,$F7               ;00C950|        |      ;
                       db $24,$00,$6C,$FE,$3F               ;00C955|        |      ;
                       db $C0,$68,$1A,$FC,$87               ;00C95A|        |      ;
                       db $0D,$C0,$FF,$03,$FE               ;00C95F|        |      ;
                       db $A2,$C1,$0F,$C0,$07               ;00C964|        |      ;
                       db $FE,$1F,$F8,$1F,$00               ;00C969|        |      ;
                       db $FC,$01,$FC,$E0,$3F               ;00C96E|        |      ;
                       db $C0,$FF,$01,$F0,$0F               ;00C973|        |      ;
                       db $E0,$1F,$80,$0F,$FD               ;00C978|        |      ;
                       db $7F,$00,$FF,$00,$7C               ;00C97D|        |      ;
                       db $00,$FC,$7F,$FF,$01               ;00C982|        |      ;
                       db $E0,$7F,$00,$F0,$42               ;00C987|        |      ;
                       db $D0,$FF,$0F,$C0,$FE               ;00C98C|        |      ;
                       db $2A,$40,$C2,$5F,$80               ;00C991|        |      ;
                       db $FE,$3F,$80,$7F,$00               ;00C996|        |      ;
                       db $2F,$A8,$7E,$C0,$FF               ;00C99B|        |      ;
                       db $03,$F8,$0F,$C0,$A7               ;00C9A0|        |      ;
                       db $D2,$55,$6C,$F0,$7E               ;00C9A5|        |      ;
                       db $51,$25,$2A,$F8,$0F               ;00C9AA|        |      ;
                       db $C0,$1F,$80,$FF,$07               ;00C9AF|        |      ;
                       db $F8,$07,$FA,$0B,$7E               ;00C9B4|        |      ;
                       db $49,$C0,$3F,$E0,$41               ;00C9B9|        |      ;
                       db $B5,$4F,$E1,$3F,$00               ;00C9BE|        |      ;
                       db $FE,$03,$1F,$84,$FF               ;00C9C3|        |      ;
                       db $0F,$A8,$03,$B8,$EF               ;00C9C8|        |      ;
                       db $17,$00,$FF,$AF,$D0               ;00C9CD|        |      ;
                       db $00,$7E,$40,$FF,$2F               ;00C9D2|        |      ;
                       db $40,$FF,$03,$0B,$BA               ;00C9D7|        |      ;
                       db $02,$FC,$A3,$4D,$BD               ;00C9DC|        |      ;
                       db $84,$7F,$C0,$03,$C0               ;00C9E1|        |      ;
                       db $3F,$80,$FF,$0F,$E0               ;00C9E6|        |      ;
                       db $FF,$01,$00,$7F,$44               ;00C9EB|        |      ;
                       db $FB,$1F,$00,$FF,$6F               ;00C9F0|        |      ;
                       db $01,$7C,$AB,$01,$BF               ;00C9F5|        |      ;
                       db $00,$FE,$1F,$7E,$01               ;00C9FA|        |      ;
                       db $20,$A5,$E6,$9F,$16               ;00C9FF|        |      ;
 
                       db $EA,$02,$FC,$27,$25               ;00CA04|        |      ;
                       db $6A,$45,$AF,$50,$FF               ;00CA09|        |      ;
                       db $E0,$2A,$54,$A2,$7D               ;00CA0E|        |      ;
                       db $B0,$2A,$F8,$7F,$6C               ;00CA13|        |      ;
                       db $02,$BC,$4A,$DA,$9F               ;00CA18|        |      ;
                       db $C0,$87,$F4,$07,$00               ;00CA1D|        |      ;
                       db $FF,$07,$FD,$80,$BE               ;00CA22|        |      ;
                       db $04,$FE,$02,$E0,$FD               ;00CA27|        |      ;
                       db $00,$7B,$77,$2D                   ;00CA2C|        |      ;
 
         DATA8_00CA30: db $B0                               ;00CA30|        |      ;
 
         DATA8_00CA31: db $03                               ;00CA31|        |      ;
 
         DATA8_00CA32: db $C0,$FF,$0F,$2C,$82               ;00CA32|        |      ;
 
                       db $FF,$F4,$37,$00,$FC               ;00CA37|        |      ;
                       db $1F,$1A,$20,$BF,$C0               ;00CA3C|        |      ;
                       db $2F,$05,$D5,$17,$F5               ;00CA41|        |      ;
                       db $02,$F8,$57,$4A,$A7               ;00CA46|        |      ;
                       db $CC,$2E,$E1,$0F,$A0               ;00CA4B|        |      ;
                       db $95,$BF,$03,$F8,$7F               ;00CA50|        |      ;
                       db $00,$FF,$00,$3F,$F1               ;00CA55|        |      ;
                       db $0F,$C0,$FF,$01,$78               ;00CA5A|        |      ;
                       db $A5,$D5,$C0,$FF,$42               ;00CA5F|        |      ;
                       db $D7,$02,$C0,$42,$FF               ;00CA64|        |      ;
                       db $1F,$D8,$03,$C0,$FF               ;00CA69|        |      ;
                       db $FD,$0F,$00,$80,$A5               ;00CA6E|        |      ;
                       db $DA,$BA,$FF,$07,$00               ;00CA73|        |      ;
                       db $3F,$C0,$FF,$0F,$00               ;00CA78|        |      ;
                       db $F8,$03,$F8,$7F,$00               ;00CA7D|        |      ;
                       db $FC,$1F,$F8,$3F,$40               ;00CA82|        |      ;
                       db $00,$3F,$E0,$07,$FC               ;00CA87|        |      ;
                       db $FF,$01,$F8,$1F,$C0               ;00CA8C|        |      ;
                       db $C1,$1F,$C0,$1F,$F0               ;00CA91|        |      ;
                       db $FF,$10,$FE,$07,$F0               ;00CA96|        |      ;
                       db $C0,$1F,$00,$3F,$FC               ;00CA9B|        |      ;
                       db $0F,$E0,$FF,$01,$F0               ;00CAA0|        |      ;
                       db $7F,$00,$F0,$0F,$FE               ;00CAA5|        |      ;
                       db $01,$FE,$07,$E0,$F9               ;00CAAA|        |      ;
                       db $03,$80,$7F,$80,$7F               ;00CAAF|        |      ;
                       db $FF,$0F,$80,$7F,$01               ;00CAB4|        |      ;
                       db $00,$FF,$01,$F8,$FF               ;00CAB9|        |      ;
                       db $0F,$E0,$BF,$00,$C0               ;00CABE|        |      ;
                       db $7F,$00,$FE,$0F,$1E               ;00CAC3|        |      ;
                       db $80,$1F,$E0,$7F,$00               ;00CAC8|        |      ;
                       db $80,$FF,$1F,$F0,$3F               ;00CACD|        |      ;
                       db $00,$C0,$FF,$01,$F8               ;00CAD2|        |      ;
                       db $3F,$0C,$F8,$FF,$03               ;00CAD7|        |      ;
                       db $80,$FF,$03,$80,$7F               ;00CADC|        |      ;
                       db $00,$FE,$FF,$07,$F8               ;00CAE1|        |      ;
                       db $07,$00,$E0,$3F,$00               ;00CAE6|        |      ;
                       db $FE,$FF,$FF,$01,$C0               ;00CAEB|        |      ;
                       db $EF,$07,$00,$00,$F8               ;00CAF0|        |      ;
                       db $FF,$FF,$0F,$00,$FA               ;00CAF5|        |      ;
                       db $1F,$00,$C0,$1F,$F0               ;00CAFA|        |      ;
                       db $FF,$FF,$00,$FE,$00               ;00CAFF|        |      ;
                       db $00,$00,$7E,$E0,$FF               ;00CB04|        |      ;
                       db $FF,$1F,$F8,$03,$E0               ;00CB09|        |      ;
                       db $03,$00,$E0,$FF,$FF               ;00CB0E|        |      ;
                       db $FF,$FF,$03,$00,$C0               ;00CB13|        |      ;
                       db $03,$00,$7C,$C0,$FF               ;00CB18|        |      ;
                       db $FF,$FF,$0F,$00,$00               ;00CB1D|        |      ;
                       db $FC,$01,$00,$F8,$FF               ;00CB22|        |      ;
                       db $FF,$FF,$FF,$03,$00               ;00CB27|        |      ;
                       db $00,$00,$C0,$0F,$FC               ;00CB2C|        |      ;
                       db $FF,$FF,$1F,$7C,$00               ;00CB31|        |      ;
                       db $80,$01,$00,$F0,$7F               ;00CB36|        |      ;
                       db $FE,$FF,$7F,$00,$FC               ;00CB3B|        |      ;
                       db $1F,$00,$00,$0C,$0A               ;00CB40|        |      ;
                       db $FE,$FF,$FF,$CF,$1F               ;00CB45|        |      ;
                       db $00,$1E,$00,$00,$F8               ;00CB4A|        |      ;
                       db $7F,$E0,$3F,$FF,$00               ;00CB4F|        |      ;
                       db $FE,$1F,$80,$7F,$00               ;00CB54|        |      ;
                       db $FC,$7F,$00,$3F,$00               ;00CB59|        |      ;
                       db $6C,$FF,$01,$92,$57               ;00CB5E|        |      ;
                       db $E0,$FF,$FF,$01,$00               ;00CB63|        |      ;
                       db $A3,$3F,$00,$FF,$03               ;00CB68|        |      ;
                       db $00,$FF,$C3,$94,$FD               ;00CB6D|        |      ;
                       db $01,$3F,$F5,$0B,$F0               ;00CB72|        |      ;
                       db $03,$84,$E4,$2B,$F0               ;00CB77|        |      ;
                       db $FF,$C3,$FF,$F2,$00               ;00CB7C|        |      ;
                       db $80,$15,$74,$C0,$FF               ;00CB81|        |      ;
                       db $07,$E0,$FF,$F2,$05               ;00CB86|        |      ;
                       db $00,$60,$FF,$1F,$04               ;00CB8B|        |      ;
                       db $C0,$FF,$7F,$01,$FC               ;00CB90|        |      ;
                       db $0F,$00,$FF,$D3,$02               ;00CB95|        |      ;
                       db $80,$DF,$FF,$8F,$3E               ;00CB9A|        |      ;
                       db $00,$80,$FC,$2F,$00               ;00CB9F|        |      ;
                       db $5F,$54,$FD,$3F,$68               ;00CBA4|        |      ;
                       db $80,$5B,$F5,$02,$E0               ;00CBA9|        |      ;
                       db $47,$E9,$41,$DA,$4B               ;00CBAE|        |      ;
                       db $FF,$0F,$00,$F4,$1F               ;00CBB3|        |      ;
                       db $80,$7F,$11,$FC,$53               ;00CBB8|        |      ;
                       db $E8,$83,$FD,$03,$20               ;00CBBD|        |      ;
                       db $B6,$FF,$13,$A4,$95               ;00CBC2|        |      ;
                       db $4A,$01,$FE,$3F,$00               ;00CBC7|        |      ;
                       db $FE,$87,$2A,$E8,$7F               ;00CBCC|        |      ;
                       db $00,$F0,$0F,$F8,$FF               ;00CBD1|        |      ;
                       db $01,$80,$7F,$00,$1F               ;00CBD6|        |      ;
                       db $FA,$07,$F8,$FF,$01               ;00CBDB|        |      ;
                       db $F8,$0F,$95,$80,$37               ;00CBE0|        |      ;
                       db $C0,$FF,$3F,$01,$C1               ;00CBE5|        |      ;
                       db $FF,$01,$D0,$87,$82               ;00CBEA|        |      ;
                       db $FC,$FF,$00,$FE,$07               ;00CBEF|        |      ;
                       db $B0,$2F,$54,$48,$AA               ;00CBF4|        |      ;
                       db $3F,$90,$FE,$01,$D6               ;00CBF9|        |      ;
                       db $FB,$2B,$80,$DF,$00               ;00CBFE|        |      ;
                       db $F0,$D2,$16,$FD,$3F               ;00CC03|        |      ;
                       db $E0,$07,$FA,$03,$80               ;00CC08|        |      ;
                       db $17,$F8,$FF,$09,$D8               ;00CC0D|        |      ;
                       db $5F,$C0,$7F,$00,$E8               ;00CC12|        |      ;
                       db $6A,$7F,$94,$D8,$B4               ;00CC17|        |      ;
                       db $10,$FF,$03,$C0,$FF               ;00CC1C|        |      ;
                       db $28,$A9,$7A,$11,$D4               ;00CC21|        |      ;
                       db $BD,$A5,$40,$77,$54               ;00CC26|        |      ;
                       db $37,$DA,$0F,$C0,$8F               ;00CC2B|        |      ;
                       db $FA,$05,$B0,$2B,$60               ;00CC30|        |      ;
                       db $FF,$50,$BD,$5A,$92               ;00CC35|        |      ;
                       db $DA,$0A,$64,$47,$A8               ;00CC3A|        |      ;
                       db $56,$FF,$75,$03,$E8               ;00CC3F|        |      ;
                       db $0A,$F0,$AA,$89,$F0               ;00CC44|        |      ;
                       db $FF,$A5,$FE,$42,$02               ;00CC49|        |      ;
                       db $E0,$FF,$04,$88,$AC               ;00CC4E|        |      ;
                       db $FF,$16,$AD,$14,$29               ;00CC53|        |      ;
                       db $85,$DF,$01,$EA,$BD               ;00CC58|        |      ;
                       db $C4,$FF,$01,$54,$E1               ;00CC5D|        |      ;
                       db $1F,$80,$F7,$AE,$80               ;00CC62|        |      ;
                       db $FE,$07,$A4,$EC,$02               ;00CC67|        |      ;
                       db $F4,$0F,$FA,$07,$B9               ;00CC6C|        |      ;
                       db $A9,$BB,$00,$D9,$2D               ;00CC71|        |      ;
                       db $75,$89,$FF,$80,$7C               ;00CC76|        |      ;
                       db $CA,$04,$F4,$FF,$00               ;00CC7B|        |      ;
                       db $AC,$CA,$12,$FD,$4F               ;00CC80|        |      ;
                       db $44,$EB,$BB,$02,$F0               ;00CC85|        |      ;
                       db $09,$2F,$E0,$3F,$E8               ;00CC8A|        |      ;
                       db $7F,$5A,$01,$4A,$B6               ;00CC8F|        |      ;
                       db $93,$4A,$41,$FF,$2F               ;00CC94|        |      ;
                       db $45,$A9,$2F,$00,$2E               ;00CC99|        |      ;
                       db $DD,$A4,$BA,$D2,$25               ;00CC9E|        |      ;
                       db $A9,$5F,$65,$03,$6A               ;00CCA3|        |      ;
                       db $D2,$7F,$50,$A5,$A8               ;00CCA8|        |      ;
                       db $F5,$1E,$C0,$3F,$C0               ;00CCAD|        |      ;
                       db $9E,$54,$CA,$AD,$8A               ;00CCB2|        |      ;
                       db $D6,$D2,$4B,$D5,$55               ;00CCB7|        |      ;
                       db $01,$F4,$5F,$84,$FE               ;00CCBC|        |      ;
                       db $02,$C0,$FB,$1F,$C0               ;00CCC1|        |      ;
                       db $FD,$0D,$00,$FF,$11               ;00CCC6|        |      ;
 
                       db $80,$DE,$9B,$7F,$03               ;00CCCB|        |      ;
 
                       db $D0,$AA,$BE,$01,$D4               ;00CCD0|        |      ;
                       db $37,$A0,$FF,$FF,$00               ;00CCD5|        |      ;
                       db $E0,$07,$00,$FE,$FF               ;00CCDA|        |      ;
                       db $01,$5C,$0A,$81,$FF               ;00CCDF|        |      ;
                       db $FF,$01,$F0,$07,$00               ;00CCE4|        |      ;
                       db $F8,$FF,$60,$37,$00               ;00CCE9|        |      ;
                       db $F0,$FF,$07,$F8,$1F               ;00CCEE|        |      ;
                       db $00,$E0,$FF,$07,$00               ;00CCF3|        |      ;
                       db $FF,$FF,$03,$FE,$01               ;00CCF8|        |      ;
                       db $00,$F8,$7F,$00,$F0               ;00CCFD|        |      ;
                       db $FF,$7F,$00,$FF,$00               ;00CD02|        |      ;
                       db $00,$FF,$0F,$80,$DF               ;00CD07|        |      ;
                       db $FF,$03,$F8,$01,$00               ;00CD0C|        |      ;
                       db $F8,$3F,$80,$FF,$FF               ;00CD11|        |      ;
                       db $1F,$C0,$07,$00,$E0               ;00CD16|        |      ;
                       db $FF,$01,$70,$F4,$FF               ;00CD1B|        |      ;
                       db $03,$FE,$07,$00,$FC               ;00CD20|        |      ;
                       db $07,$F0,$FF,$00,$FC               ;00CD25|        |      ;
                       db $0F,$F8,$DF,$07,$E0               ;00CD2A|        |      ;
                       db $0F,$00,$F8,$FF,$7F               ;00CD2F|        |      ;
                       db $80,$3F,$00,$C0,$7F               ;00CD34|        |      ;
                       db $00,$FC,$FF,$01,$FE               ;00CD39|        |      ;
                       db $07,$00,$FC,$07,$F8               ;00CD3E|        |      ;
                       db $83,$01,$FC,$0F,$F0               ;00CD43|        |      ;
                       db $3F,$00,$F0,$1F,$E0               ;00CD48|        |      ;
                       db $7F,$00,$FE,$7F,$00               ;00CD4D|        |      ;
                       db $FF,$1F,$00,$FF,$01               ;00CD52|        |      ;
                       db $80,$7F,$00,$FC,$FF               ;00CD57|        |      ;
 
                       db $01,$F8,$7F,$00,$FE               ;00CD5C|        |      ;
                       db $07,$00,$FF,$80,$FF               ;00CD61|        |      ;
                       db $FF,$00,$F8,$00,$7F               ;00CD66|        |      ;
                       db $00,$06,$FA,$FF,$0F               ;00CD6B|        |      ;
                       db $80,$03,$FE,$FF,$1F               ;00CD70|        |      ;
                       db $00,$F0,$03,$E0,$FF               ;00CD75|        |      ;
                       db $01,$7C,$00,$FF,$0F               ;00CD7A|        |      ;
                       db $FF,$3F,$00,$00,$FE               ;00CD7F|        |      ;
                       db $0F,$80,$FF,$03,$C0               ;00CD84|        |      ;
                       db $0F,$00,$FF,$FF,$60               ;00CD89|        |      ;
                       db $00,$C0,$FF,$0F,$F8               ;00CD8E|        |      ;
                       db $7F,$00,$F8,$0F,$80               ;00CD93|        |      ;
                       db $FF,$FF,$FF,$03,$00               ;00CD98|        |      ;
                       db $3C,$F0,$1F,$F0,$0F               ;00CD9D|        |      ;
                       db $00,$F0,$1F,$C0,$FF               ;00CDA2|        |      ;
                       db $3F,$FE,$03,$00,$04               ;00CDA7|        |      ;
                       db $F0,$EB,$1F,$7F,$00               ;00CDAC|        |      ;
                       db $10,$FE,$1F,$0E,$C2               ;00CDB1|        |      ;
                       db $FF,$01,$3E,$00,$00               ;00CDB6|        |      ;
                       db $FF,$1F,$FC,$FF,$01               ;00CDBB|        |      ;
                       db $C0,$FB,$03,$1C,$00               ;00CDC0|        |      ;
                       db $F8,$FF,$7F,$78,$C0               ;00CDC5|        |      ;
                       db $00,$7A,$E2,$07,$FC               ;00CDCA|        |      ;
                       db $BF,$27,$00,$3F,$E0               ;00CDCF|        |      ;
                       db $00,$FF,$07,$E0,$FF               ;00CDD4|        |      ;
                       db $03,$FC,$0F,$00,$FC               ;00CDD9|        |      ;
                       db $8F,$3E,$00,$8A,$FF               ;00CDDE|        |      ;
                       db $03,$FC,$83,$AF,$0D               ;00CDE3|        |      ;
                       db $FC,$1F,$80,$87,$3E               ;00CDE8|        |      ;
                       db $00,$FE,$7F,$00,$FF               ;00CDED|        |      ;
                       db $03,$80,$FC,$06,$F0               ;00CDF2|        |      ;
                       db $3F,$7F,$00,$7E,$C0               ;00CDF7|        |      ;
                       db $49,$FA,$FD,$01,$00               ;00CDFC|        |      ;
                       db $FF,$03,$F8,$1F,$F0               ;00CE01|        |      ;
                       db $3F,$60,$CB,$0F,$81               ;00CE06|        |      ;
                       db $7F,$00,$BC,$F8,$0F               ;00CE0B|        |      ;
                       db $80,$FF,$67,$C0,$3F               ;00CE10|        |      ;
                       db $00,$FC,$C0,$3F,$70               ;00CE15|        |      ;
                       db $FB,$0B,$00,$F0,$FF               ;00CE1A|        |      ;
                       db $00,$FF,$41,$3F,$A2               ;00CE1F|        |      ;
                       db $0A,$FD,$2A,$84,$2E               ;00CE24|        |      ;
                       db $F5,$8B,$FE,$00,$FC               ;00CE29|        |      ;
                       db $10,$FF,$03,$80,$3F               ;00CE2E|        |      ;
                       db $F5,$80,$FE,$01,$7F               ;00CE33|        |      ;
                       db $B7,$01,$BC,$01,$E0               ;00CE38|        |      ;
                       db $9F,$B2,$7D,$81,$7E               ;00CE3D|        |      ;
                       db $15,$4A,$FF,$01,$F8               ;00CE42|        |      ;
                       db $07,$00,$FF,$0F,$FC               ;00CE47|        |      ;
                       db $CA,$02,$64,$FF,$03               ;00CE4C|        |      ;
                       db $68,$EE,$0F,$D0,$06               ;00CE51|        |      ;
                       db $FC,$03,$60,$FD,$7F               ;00CE56|        |      ;
                       db $00,$FC,$0F,$78,$42               ;00CE5B|        |      ;
                       db $55,$D0,$FE,$5F,$04               ;00CE60|        |      ;
                       db $F6,$0F,$80,$A2,$FF               ;00CE65|        |      ;
                       db $E0,$FF,$00,$00,$FF               ;00CE6A|        |      ;
                       db $07,$F0,$2F,$80,$2D               ;00CE6F|        |      ;
                       db $FF,$A2,$76,$91,$47               ;00CE74|        |      ;
                       db $52,$D2,$16,$EA,$07               ;00CE79|        |      ;
                       db $7D,$A2,$17,$D0,$D7               ;00CE7E|        |      ;
                       db $0B,$E0,$FF,$60,$55               ;00CE83|        |      ;
                       db $3F,$00,$AE,$FE,$01               ;00CE88|        |      ;
                       db $FC,$07,$F8,$7F,$00               ;00CE8D|        |      ;
                       db $D0,$2B,$E0,$FF,$03               ;00CE92|        |      ;
                       db $F0,$03,$1C,$FE,$0F               ;00CE97|        |      ;
                       db $A8,$E0,$1F,$F9,$25               ;00CE9C|        |      ;
                       db $09,$F8,$2F,$81,$BF               ;00CEA1|        |      ;
                       db $02,$FC,$43,$BF,$D2               ;00CEA6|        |      ;
                       db $09,$F0,$52,$3B,$72               ;00CEAB|        |      ;
                       db $41,$6A,$59,$7F,$13               ;00CEB0|        |      ;
                       db $80,$FF,$03,$3F,$40               ;00CEB5|        |      ;
                       db $47,$C9,$7A,$F5,$09               ;00CEBA|        |      ;
                       db $D0,$5F,$FC,$07,$E0               ;00CEBF|        |      ;
                       db $27,$20,$F9,$2D,$75               ;00CEC4|        |      ;
                       db $2F,$D9,$17,$60,$83               ;00CEC9|        |      ;
                       db $FF,$01,$75,$D2,$02               ;00CECE|        |      ;
                       db $F8,$2F,$4B,$E2,$1F               ;00CED3|        |      ;
                       db $A2,$AA,$74,$03,$F0               ;00CED8|        |      ;
                       db $3F,$14,$27,$93,$FE               ;00CEDD|        |      ;
                       db $4F,$A5,$00,$FF,$00               ;00CEE2|        |      ;
                       db $F8,$7E,$D1,$BE,$00               ;00CEE7|        |      ;
                       db $7C,$AB,$AA,$77,$00               ;00CEEC|        |      ;
                       db $F0,$AD,$12,$B4,$7F               ;00CEF1|        |      ;
                       db $21,$FF,$0F,$00,$78               ;00CEF6|        |      ;
                       db $81,$7F,$80,$FF,$29               ;00CEFB|        |      ;
                       db $A8,$36,$F5,$2A,$2A               ;00CF00|        |      ;
                       db $54,$0F,$E8,$1F,$B4               ;00CF05|        |      ;
                       db $F5,$5B,$A0,$D2,$AA               ;00CF0A|        |      ;
                       db $D0,$BF,$80,$0A,$FD               ;00CF0F|        |      ;
                       db $0F,$5C,$D8,$07,$C0               ;00CF14|        |      ;
                       db $FF,$0F,$00,$F8,$2F               ;00CF19|        |      ;
                       db $C0,$FF,$01,$A9,$7F               ;00CF1E|        |      ;
                       db $00,$B7,$25,$F1,$7F               ;00CF23|        |      ;
                       db $80,$75,$55,$0B,$36               ;00CF28|        |      ;
                       db $D1,$1E,$ED,$81,$6E               ;00CF2D|        |      ;
                       db $A4,$AF,$94,$A0,$B6               ;00CF32|        |      ;
                       db $BA,$90,$B6,$FD,$0F               ;00CF37|        |      ;
                       db $C0,$0F,$00,$FA,$1F               ;00CF3C|        |      ;
                       db $E8,$3F,$50,$B7,$4D               ;00CF41|        |      ;
                       db $60,$AB,$05,$FA,$87               ;00CF46|        |      ;
                       db $BE,$48,$0F,$80,$FF               ;00CF4B|        |      ;
                       db $1F,$F0,$50,$00,$FC               ;00CF50|        |      ;
                       db $1F,$EE,$BD,$00,$FE               ;00CF55|        |      ;
                       db $03,$E0,$1F,$00,$F8               ;00CF5A|        |      ;
                       db $7F,$C0,$9F,$00,$F8               ;00CF5F|        |      ;
                       db $1F,$F8,$7F,$00,$F0               ;00CF64|        |      ;
                       db $1F,$C0,$FF,$3F,$C0               ;00CF69|        |      ;
                       db $1F,$00,$F0,$0F,$F8               ;00CF6E|        |      ;
                       db $7F,$00,$3F,$00,$FE               ;00CF73|        |      ;
                       db $3F,$80,$3F,$00,$F8               ;00CF78|        |      ;
                       db $7F,$C0,$FF,$07,$00               ;00CF7D|        |      ;
                       db $36,$FE,$07,$FC,$39               ;00CF82|        |      ;
                       db $01,$FE,$42,$97,$05               ;00CF87|        |      ;
                       db $C0,$D2,$FD,$3F,$E0               ;00CF8C|        |      ;
                       db $FF,$00,$E0,$1F,$C0               ;00CF91|        |      ;
                       db $FF,$03,$80,$E3,$7F               ;00CF96|        |      ;
                       db $80,$3F,$06,$C0,$3F               ;00CF9B|        |      ;
                       db $40,$FF,$3F,$00,$CC               ;00CFA0|        |      ;
                       db $FF,$80,$FF,$05,$80               ;00CFA5|        |      ;
                       db $7F,$80,$FF,$0F,$00               ;00CFAA|        |      ;
                       db $3E,$FE,$01,$FC,$01               ;00CFAF|        |      ;
                       db $00,$FF,$07,$FC,$FF               ;00CFB4|        |      ;
                       db $00,$FC,$FB,$03,$F0               ;00CFB9|        |      ;
                       db $01,$18,$FE,$0F,$F8               ;00CFBE|        |      ;
                       db $FF,$00,$E0,$80,$FF               ;00CFC3|        |      ;
                       db $80,$3F,$1E,$C0,$FF               ;00CFC8|        |      ;
                       db $00,$FC,$3F,$00,$FF               ;00CFCD|        |      ;
                       db $F3,$01,$F8,$00,$1F               ;00CFD2|        |      ;
                       db $FC,$07,$E0,$87,$3F               ;00CFD7|        |      ;
                       db $E0,$FF,$7F,$00,$3E               ;00CFDC|        |      ;
                       db $00,$00,$FC,$1F,$00               ;00CFE1|        |      ;
                       db $FF,$07,$FC,$FF,$01               ;00CFE6|        |      ;
                       db $F8,$0F,$00,$FF,$0F               ;00CFEB|        |      ;
                       db $F0,$07,$00,$F7,$FF               ;00CFF0|        |      ;
                       db $0F,$F0,$03,$C0,$00               ;00CFF5|        |      ;
                       db $FE,$7F,$00,$FF,$01               ;00CFFA|        |      ;
                       db $80,$7F,$E0,$FF,$0F               ;00CFFF|        |      ;
                       db $00,$FC,$1F,$80,$FF               ;00D004|        |      ;
                       db $0F,$00,$00,$FC,$FF               ;00D009|        |      ;
                       db $FF,$FF,$00,$00,$C0               ;00D00E|        |      ;
                       db $FF,$08,$F9,$1F,$C0               ;00D013|        |      ;
                       db $00,$FF,$C0,$FF,$FF               ;00D018|        |      ;
                       db $07,$0C,$00,$80,$FF               ;00D01D|        |      ;
                       db $81,$DF,$0F,$E0,$03               ;00D022|        |      ;
                       db $3F,$D0,$1F,$FF,$4F               ;00D027|        |      ;
                       db $00,$F0,$00,$FC,$0B               ;00D02C|        |      ;
                       db $FF,$F9,$03,$E0,$C1               ;00D031|        |      ;
                       db $3F,$F8,$1F,$00,$F8               ;00D036|        |      ;
                       db $0F,$C0,$3F,$0D,$80               ;00D03B|        |      ;
 
                       db $1F,$FE,$07,$D8,$FE               ;00D040|        |      ;
                       db $03,$1B,$00,$D7,$7F               ;00D045|        |      ;
                       db $88,$7F,$01,$0F,$F0               ;00D04A|        |      ;
                       db $A3,$8A,$FF,$1F,$00               ;00D04F|        |      ;
                       db $27,$B3,$C0,$3F,$C0               ;00D054|        |      ;
                       db $7F,$08,$F0,$3F,$E0               ;00D059|        |      ;
                       db $7F,$1A,$F8,$07,$C0               ;00D05E|        |      ;
                       db $0F,$D8,$D4,$1F,$F0               ;00D063|        |      ;
                       db $81,$3F,$E0,$0F,$8C               ;00D068|        |      ;
                       db $E8,$FF,$00,$A8,$FF               ;00D06D|        |      ;
                       db $C0,$1F,$DA,$01,$7C               ;00D072|        |      ;
                       db $C0,$7F,$E8,$7F,$40               ;00D077|        |      ;
                       db $5B,$01,$6C,$1F,$20               ;00D07C|        |      ;
                       db $FF,$48,$AB,$EE,$AA               ;00D081|        |      ;
                       db $BA,$BA,$02,$B0,$5A               ;00D086|        |      ;
                       db $A2,$F4,$7F,$00,$FE               ;00D08B|        |      ;
                       db $37,$00,$F4,$0F,$48               ;00D090|        |      ;
 
                       db $FF,$03,$EE,$C8,$0B               ;00D095|        |      ;
                       db $E0,$17,$BD,$10,$7F               ;00D09A|        |      ;
                       db $A5,$A6,$FB,$03,$C0               ;00D09F|        |      ;
                       db $97,$8A,$F4,$7F,$00               ;00D0A4|        |      ;
                       db $E8,$07,$F0,$4F,$7F               ;00D0A9|        |      ;
                       db $C0,$0F,$B0,$F5,$12               ;00D0AE|        |      ;
                       db $E0,$BF,$BA,$45,$8A               ;00D0B3|        |      ;
                       db $6A,$01,$FF,$E3,$05               ;00D0B8|        |      ;
                       db $C0,$9F,$82,$DE,$0B               ;00D0BD|        |      ;
                       db $D0,$BB,$09,$F9,$0B               ;00D0C2|        |      ;
                       db $FC,$BD,$80,$54,$6A               ;00D0C7|        |      ;
                       db $52,$2F,$F5,$05,$F8               ;00D0CC|        |      ;
                       db $4A,$FD,$16,$C0,$3F               ;00D0D1|        |      ;
                       db $00,$FF,$41,$D9,$05               ;00D0D6|        |      ;
                       db $E8,$9F,$24,$FE,$07               ;00D0DB|        |      ;
                       db $FC,$01,$FE,$04,$B0               ;00D0E0|        |      ;
 
                       db $5F,$52,$DD,$4A,$C0               ;00D0E5|        |      ;
                       db $9F,$F8,$03,$F8,$0F               ;00D0EA|        |      ;
                       db $D0,$3F,$00,$F8,$7F               ;00D0EF|        |      ;
                       db $00,$FF,$11,$ED,$06               ;00D0F4|        |      ;
                       db $F5,$83,$E4,$B6,$00               ;00D0F9|        |      ;
                       db $FA,$D5,$2A,$F0,$3F               ;00D0FE|        |      ;
                       db $B0,$A5,$07,$F0,$97               ;00D103|        |      ;
                       db $54,$E8,$4F,$3E,$01               ;00D108|        |      ;
                       db $FF,$00,$AB,$FF,$00               ;00D10D|        |      ;
                       db $FC,$03,$54,$7D,$C1               ;00D112|        |      ;
                       db $17,$FD,$00,$B2,$7D               ;00D117|        |      ;
                       db $15,$FC,$03,$FC,$01               ;00D11C|        |      ;
                       db $6D,$6F,$01,$BF,$09               ;00D121|        |      ;
                       db $2D,$92,$DD,$BE,$00               ;00D126|        |      ;
                       db $77,$DD,$00,$7D,$52               ;00D12B|        |      ;
                       db $81,$FE,$0F,$78,$51               ;00D130|        |      ;
                       db $17,$6A,$E9,$3D,$54               ;00D135|        |      ;
                       db $55,$5B,$01,$DA,$3F               ;00D13A|        |      ;
                       db $40,$7F,$51,$91,$EA               ;00D13F|        |      ;
                       db $49,$5D,$09,$59,$3D               ;00D144|        |      ;
                       db $E2,$FF,$00,$B2,$5E               ;00D149|        |      ;
                       db $54,$2B,$92,$BA,$FF               ;00D14E|        |      ;
                       db $02,$95,$89,$EA,$E8               ;00D153|        |      ;
                       db $BB,$40,$2F,$82,$D6               ;00D158|        |      ;
                       db $7D,$08,$FA,$2F,$D0               ;00D15D|        |      ;
                       db $0F,$8A,$D4,$2F,$E8               ;00D162|        |      ;
                       db $AD,$80,$BD,$AA,$DD               ;00D167|        |      ;
                       db $03,$52,$D5,$02,$F9               ;00D16C|        |      ;
                       db $27,$E8,$FF,$40,$A8               ;00D171|        |      ;
                       db $52,$6A,$DF,$42,$6B               ;00D176|        |      ;
                       db $AA,$2B,$48,$6F,$95               ;00D17B|        |      ;
                       db $D4,$4B,$B5,$49,$A1               ;00D180|        |      ;
                       db $CC,$AA,$7E,$09,$35               ;00D185|        |      ;
                       db $6A,$0B,$DF,$A4,$5D               ;00D18A|        |      ;
                       db $E4,$0A,$B8,$42,$7F               ;00D18F|        |      ;
                       db $4B,$55,$DB,$24,$B2               ;00D194|        |      ;
                       db $24,$6D,$D2,$EE,$36               ;00D199|        |      ;
                       db $00,$5F,$B6,$05,$F8               ;00D19E|        |      ;
                       db $8F,$AA,$F4,$02,$6E               ;00D1A3|        |      ;
                       db $59,$E5,$FE,$01,$80               ;00D1A8|        |      ;
                       db $FF,$82,$E4,$D7,$0B               ;00D1AD|        |      ;
                       db $D0,$17,$25,$D5,$BF               ;00D1B2|        |      ;
                       db $04,$E0,$7F,$01,$54               ;00D1B7|        |      ;
                       db $FF,$EA,$1F,$00,$1E               ;00D1BC|        |      ;
                       db $AA,$C0,$FF,$A5,$09               ;00D1C1|        |      ;
                       db $55,$15,$FB,$E2,$02               ;00D1C6|        |      ;
                       db $F0,$05,$FE,$3F,$C0               ;00D1CB|        |      ;
 
                       db $7F,$01,$80,$FF,$01               ;00D1D0|        |      ;
                       db $F6,$7F,$00,$FE,$07               ;00D1D5|        |      ;
                       db $00,$FE,$7F,$00,$FF               ;00D1DA|        |      ;
                       db $03,$00,$FF,$03,$E0               ;00D1DF|        |      ;
                       db $FF,$01,$3E,$00,$FC               ;00D1E4|        |      ;
                       db $FF,$01,$FE,$07,$00               ;00D1E9|        |      ;
                       db $FF,$0F,$E0,$FF,$0F               ;00D1EE|        |      ;
                       db $00,$E0,$FF,$01,$7F               ;00D1F3|        |      ;
                       db $00,$00,$FE,$07,$FF               ;00D1F8|        |      ;
                       db $FF,$01,$C0,$F9,$7F               ;00D1FD|        |      ;
                       db $00,$3F,$00,$80,$FF               ;00D202|        |      ;
                       db $81,$FF,$0F,$00,$FC               ;00D207|        |      ;
                       db $FF,$07,$F0,$01,$00               ;00D20C|        |      ;
                       db $F8,$3F,$F8,$0F,$00               ;00D211|        |      ;
                       db $F0,$FF,$7F,$00,$FF               ;00D216|        |      ;
                       db $01,$80,$FF,$0F,$C0               ;00D21B|        |      ;
                       db $03,$E0,$FF,$FF,$00               ;00D220|        |      ;
                       db $FE,$00,$00,$FE,$FF               ;00D225|        |      ;
                       db $03,$F0,$80,$FF,$FF               ;00D22A|        |      ;
                       db $07,$40,$02,$00,$FC               ;00D22F|        |      ;
                       db $FF,$03,$80,$FF,$7F               ;00D234|        |      ;
                       db $FC,$0F,$C0,$81,$03               ;00D239|        |      ;
                       db $E0,$FF,$00,$E0,$7F               ;00D23E|        |      ;
                       db $FF,$87,$FF,$00,$80               ;00D243|        |      ;
                       db $1D,$00,$FF,$0F,$00               ;00D248|        |      ;
                       db $FC,$FF,$FF,$C0,$3F               ;00D24D|        |      ;
                       db $00,$00,$7F,$80,$FF               ;00D252|        |      ;
                       db $07,$00,$FE,$FF,$A3               ;00D257|        |      ;
                       db $7F,$00,$00,$70,$FD               ;00D25C|        |      ;
                       db $0F,$7C,$00,$7F,$C0               ;00D261|        |      ;
                       db $07,$FE,$0F,$3F,$70               ;00D266|        |      ;
                       db $C0,$FF,$00,$80,$FE               ;00D26B|        |      ;
                       db $03,$FF,$92,$75,$05               ;00D270|        |      ;
                       db $E0,$5F,$FC,$0F,$F0               ;00D275|        |      ;
                       db $1F,$00,$00,$96,$FA               ;00D27A|        |      ;
                       db $BF,$42,$77,$55,$FF               ;00D27F|        |      ;
                       db $01,$F0,$44,$AE,$AA               ;00D284|        |      ;
                       db $0A,$F4,$97,$F4,$2E               ;00D289|        |      ;
                       db $C0,$01,$FF,$3F,$00               ;00D28E|        |      ;
                       db $F9,$0B,$A4,$56,$5D               ;00D293|        |      ;
                       db $EB,$D2,$07,$E0,$FF               ;00D298|        |      ;
                       db $1A,$00,$BF,$C0,$56               ;00D29D|        |      ;
                       db $FC,$0B,$E8,$1F,$00               ;00D2A2|        |      ;
                       db $2F,$FF,$01,$FC,$02               ;00D2A7|        |      ;
                       db $FB,$CA,$5F,$00,$FC               ;00D2AC|        |      ;
                       db $20,$69,$FD,$1F,$80               ;00D2B1|        |      ;
                       db $1F,$80,$FF,$C7,$D6               ;00D2B6|        |      ;
                       db $0A,$B0,$22,$B4,$FF               ;00D2BB|        |      ;
                       db $00,$F8,$5F,$D0,$7F               ;00D2C0|        |      ;
                       db $00,$5F,$44,$F6,$1B               ;00D2C5|        |      ;
                       db $80,$97,$74,$D5,$DF               ;00D2CA|        |      ;
                       db $44,$03,$E8,$D6,$85               ;00D2CF|        |      ;
                       db $FA,$AF,$00,$F0,$2B               ;00D2D4|        |      ;
                       db $C1,$DF,$AA,$02,$FC               ;00D2D9|        |      ;
                       db $46,$AD,$EA,$0F,$80               ;00D2DE|        |      ;
                       db $7F,$81,$FF,$00,$3E               ;00D2E3|        |      ;
                       db $00,$9F,$FE,$01,$77               ;00D2E8|        |      ;
                       db $D4,$A2,$1B,$F0,$1F               ;00D2ED|        |      ;
                       db $D0,$83,$7F,$80,$AF               ;00D2F2|        |      ;
                       db $A4,$5A,$55,$BD,$22               ;00D2F7|        |      ;
                       db $5D,$55,$02,$FE,$23               ;00D2FC|        |      ;
                       db $45,$FC,$05,$DA,$DC               ;00D301|        |      ;
                       db $23,$FC,$2A,$0D,$B0               ;00D306|        |      ;
                       db $2B,$DE,$90,$5E,$55               ;00D30B|        |      ;
                       db $4D,$2B,$62,$D7,$7A               ;00D310|        |      ;
                       db $21,$55,$91,$F4,$5B               ;00D315|        |      ;
                       db $12,$B2,$7F,$80,$AF               ;00D31A|        |      ;
 
                       db $B6,$80,$FF,$02,$52               ;00D31F|        |      ;
                       db $FF,$56,$00,$F8,$0F               ;00D324|        |      ;
                       db $E0,$6F,$0F,$E0,$1F               ;00D329|        |      ;
                       db $A2,$6A,$BD,$16,$80               ;00D32E|        |      ;
                       db $FF,$21,$51,$7F,$00               ;00D333|        |      ;
                       db $FE,$B7,$02,$7A,$AB               ;00D338|        |      ;
                       db $12,$FE,$03,$C7,$41               ;00D33D|        |      ;
                       db $F0,$5F,$C0,$BB,$0B               ;00D342|        |      ;
                       db $00,$FF,$07,$9C,$DF               ;00D347|        |      ;
                       db $01,$F0,$3F,$40,$FB               ;00D34C|        |      ;
                       db $1F,$00,$FE,$03,$D4               ;00D351|        |      ;
                       db $FF,$01,$E0,$3F,$40               ;00D356|        |      ;
                       db $E7,$1F,$00,$FF,$03               ;00D35B|        |      ;
                       db $E8,$7F,$00,$FC,$1F               ;00D360|        |      ;
                       db $80,$EF,$07,$E0,$FF               ;00D365|        |      ;
                       db $00,$3C,$3F,$00,$FF               ;00D36A|        |      ;
                       db $07,$C2,$FB,$01,$F8               ;00D36F|        |      ;
                       db $1F,$90,$F3,$07,$C0               ;00D374|        |      ;
                       db $FF,$40,$7C,$1F,$00               ;00D379|        |      ;
                       db $FF,$07,$E8,$7B,$00               ;00D37E|        |      ;
                       db $F8,$1F,$D0,$E7,$19               ;00D383|        |      ;
                       db $C0,$FF,$80,$F2,$1F               ;00D388|        |      ;
                       db $00,$FF,$03,$F8,$3F               ;00D38D|        |      ;
 
                       db $00,$FC,$0F,$E0,$FE               ;00D392|        |      ;
                       db $01,$F0,$3F,$80,$FD               ;00D397|        |      ;
                       db $0F,$C0,$7F,$00,$F8               ;00D39C|        |      ;
                       db $3F,$80,$FF,$40,$AC               ;00D3A1|        |      ;
                       db $BF,$00,$FF,$81,$68               ;00D3A6|        |      ;
                       db $BF,$01,$FF,$01,$F0               ;00D3AB|        |      ;
                       db $1F,$01,$FF,$01,$F6               ;00D3B0|        |      ;
                       db $87,$80,$FF,$01,$FC               ;00D3B5|        |      ;
                       db $0F,$80,$FF,$03,$E1               ;00D3BA|        |      ;
                       db $1F,$C0,$FF,$00,$CE               ;00D3BF|        |      ;
                       db $5F,$80,$F7,$C1,$E0               ;00D3C4|        |      ;
                       db $FC,$C0,$7F,$70,$18               ;00D3C9|        |      ;
                       db $1E,$F0,$3F,$30,$0F               ;00D3CE|        |      ;
                       db $0E,$FC,$0F,$C4,$CF               ;00D3D3|        |      ;
                       db $01,$FE,$03,$F0,$1F               ;00D3D8|        |      ;
                       db $F0,$1F,$00,$F8,$C3               ;00D3DD|        |      ;
                       db $F8,$3E,$E0,$E1,$79               ;00D3E2|        |      ;
                       db $18,$F3,$C1,$F1,$38               ;00D3E7|        |      ;
                       db $C8,$0F,$C7,$F3,$00               ;00D3EC|        |      ;
                       db $1F,$0F,$C7,$F3,$80               ;00D3F1|        |      ;
                       db $E7,$61,$D8,$F1,$38               ;00D3F6|        |      ;
                       db $1E,$61,$78,$3F,$10               ;00D3FB|        |      ;
                       db $3E,$9C,$CF,$83,$F1               ;00D400|        |      ;
                       db $7D,$00,$1F,$EF,$81               ;00D405|        |      ;
                       db $9F,$E7,$03,$70,$76               ;00D40A|        |      ;
                       db $0F,$C0,$C7,$73,$80               ;00D40F|        |      ;
                       db $1E,$9E,$07,$F0,$E3               ;00D414|        |      ;
                       db $31,$F8,$31,$BF,$0F               ;00D419|        |      ;
                       db $80,$C7,$73,$70,$4E               ;00D41E|        |      ;
                       db $DF,$C1,$30,$9D,$07               ;00D423|        |      ;
                       db $C0,$E3,$1D,$30,$1F               ;00D428|        |      ;
                       db $E7,$07,$F0,$F8,$1F               ;00D42D|        |      ;
                       db $C0,$C7,$77,$E0,$07               ;00D432|        |      ;
                       db $F3,$01,$1C,$FC,$07               ;00D437|        |      ;
                       db $E0,$F1,$1F,$80,$1F               ;00D43C|        |      ;
                       db $CF,$C3,$78,$F8,$1F               ;00D441|        |      ;
                       db $C0,$E1,$3F,$80,$C7               ;00D446|        |      ;
                       db $F9,$00,$8E,$FF,$03               ;00D44B|        |      ;
                       db $E0,$79,$0E,$80,$8F               ;00D450|        |      ;
                       db $E7,$E1,$F8,$78,$1F               ;00D455|        |      ;
                       db $C0,$C3,$7F,$00,$8F               ;00D45A|        |      ;
                       db $FB,$00,$1E,$FE,$07               ;00D45F|        |      ;
                       db $E0,$F1,$1C,$00,$BF               ;00D464|        |      ;
                       db $CF,$01,$FF,$31,$3E               ;00D469|        |      ;
                       db $80,$C7,$FF,$00,$3C               ;00D46E|        |      ;
                       db $CF,$01,$FE,$38,$1E               ;00D473|        |      ;
                       db $00,$8F,$F3,$21,$FC               ;00D478|        |      ;
                       db $1C,$8F,$83,$E3,$79               ;00D47D|        |      ;
                       db $0C,$1C,$FE,$07,$C0               ;00D482|        |      ;
                       db $F9,$1F,$00,$C7,$FF               ;00D487|        |      ;
                       db $00,$78,$CE,$1F,$C0               ;00D48C|        |      ;
                       db $E7,$F8,$20,$3E,$8E               ;00D491|        |      ;
                       db $DF,$81,$61,$FE,$00               ;00D496|        |      ;
                       db $3C,$EE,$07,$F0,$9C               ;00D49B|        |      ;
                       db $1F,$80,$C7,$F1,$1F               ;00D4A0|        |      ;
                       db $70,$BC,$1F,$C0,$E7               ;00D4A5|        |      ;
                       db $F0,$1C,$6C,$98,$3F               ;00D4AA|        |      ;
                       db $80,$87,$FF,$01,$F8               ;00D4AF|        |      ;
                       db $9C,$0F,$E0,$C7,$F8               ;00D4B4|        |      ;
                       db $01,$7C,$FC,$0F,$80               ;00D4B9|        |      ;
                       db $8F,$F7,$01,$F8,$F8               ;00D4BE|        |      ;
                       db $1F,$80,$87,$FF,$01               ;00D4C3|        |      ;
                       db $F8,$1C,$0F,$C0,$0F               ;00D4C8|        |      ;
                       db $FB,$03,$F0,$F1,$3E               ;00D4CD|        |      ;
                       db $00,$3E,$DF,$03,$F0               ;00D4D2|        |      ;
 
                       db $E3,$7C,$0C,$3C,$DC               ;00D4D7|        |      ;
                       db $0F,$C0,$C7,$FB,$00               ;00D4DC|        |      ;
                       db $FC,$78,$1E,$07,$1F               ;00D4E1|        |      ;
                       db $87,$E3,$41,$C0,$F9               ;00D4E6|        |      ;
                       db $1D,$F0,$39,$BE,$03               ;00D4EB|        |      ;
                       db $3E,$8E,$EF,$00,$87               ;00D4F0|        |      ;
                       db $FB,$01,$E0,$F1,$3E               ;00D4F5|        |      ;
                       db $C0,$1F,$CE,$C7,$23               ;00D4FA|        |      ;
                       db $18,$CF,$7B,$00,$CE               ;00D4FF|        |      ;
                       db $F7,$00,$70,$3E,$CF               ;00D504|        |      ;
                       db $07,$78,$9E,$3F,$00               ;00D509|        |      ;
                       db $7F,$18,$1F,$C0,$1F               ;00D50E|        |      ;
                       db $C7,$63,$E0,$C7,$F1               ;00D513|        |      ;
                       db $38,$70,$E0,$7F,$02               ;00D518|        |      ;
                       db $FC,$79,$1C,$1F,$F0               ;00D51D|        |      ;
                       db $38,$DE,$03,$3C,$8C               ;00D522|        |      ;
                       db $6F,$80,$1F,$CE,$C7               ;00D527|        |      ;
                       db $03,$78,$1C,$FF,$00               ;00D52C|        |      ;
 
                       db $7E,$86,$1F,$C0,$F3               ;00D531|        |      ;
                       db $F0,$3F,$00,$1E,$FE               ;00D536|        |      ;
                       db $0F,$C0,$3F,$E0,$0F               ;00D53B|        |      ;
                       db $E0,$E3,$F8,$0F,$38               ;00D540|        |      ;
                       db $07,$FF,$83,$C1,$E1               ;00D545|        |      ;
                       db $E0,$3F,$40,$1C,$E7               ;00D54A|        |      ;
                       db $C3,$E3,$C0,$C3,$FF               ;00D54F|        |      ;
                       db $61,$00,$FE,$80,$FF               ;00D554|        |      ;
                       db $01,$E0,$F9,$7F,$00               ;00D559|        |      ;
 
                       db $8E,$E7,$81,$F1,$0F               ;00D55E|        |      ;
 
                       db $70,$FC,$0F,$00,$FF               ;00D563|        |      ;
                       db $0F,$00,$FE,$1F,$80               ;00D568|        |      ;
                       db $FF,$03,$02,$FF,$0F               ;00D56D|        |      ;
                       db $C0,$FF,$20,$E0,$FF               ;00D572|        |      ;
                       db $00,$F0,$3F,$00,$FC               ;00D577|        |      ;
                       db $7F,$00,$FE,$07,$80               ;00D57C|        |      ;
                       db $FF,$0F,$80,$FF,$11               ;00D581|        |      ;
                       db $C0,$FF,$01,$F0,$7F               ;00D586|        |      ;
                       db $00,$F0,$FF,$00,$F8               ;00D58B|        |      ;
                       db $3F,$00,$FC,$7F,$00               ;00D590|        |      ;
 
                       db $FE,$0F,$00,$FF,$0F               ;00D595|        |      ;
                       db $80,$FF,$03,$80,$FF               ;00D59A|        |      ;
 
                       db $0F,$C0,$FF,$00,$C0               ;00D59F|        |      ;
                       db $FF,$07,$E0,$7F,$20               ;00D5A4|        |      ;
                       db $E0,$FF,$01,$F8,$3F               ;00D5A9|        |      ;
                       db $00,$E0,$FF,$00,$FC               ;00D5AE|        |      ;
                       db $1F,$E0,$F0,$FF,$00               ;00D5B3|        |      ;
                       db $FC,$0F,$18,$F8,$7F               ;00D5B8|        |      ;
                       db $00,$FE,$03,$70,$F0               ;00D5BD|        |      ;
                       db $7F                               ;00D5C2|        |      ;
 
         DATA8_00D5C3: db $00,$FC,$07,$F0,$C7               ;00D5C3|        |      ;
                       db $FB,$00,$FE,$03,$F0               ;00D5C8|        |      ;
                       db $E0,$7F,$00,$FC,$1F               ;00D5CD|        |      ;
                       db $80,$E0                           ;00D5D2|        |      ;
 
         DATA8_00D5D4: db $FF                               ;00D5D4|        |      ;
 
         DATA8_00D5D5: db $01,$E2,$FF,$01,$18               ;00D5D5|        |      ;
                       db $FF,$07,$C0,$FF,$01               ;00D5DA|        |      ;
                       db $C1,$FF,$03,$E0,$FF               ;00D5DF|        |      ;
                       db $00,$C0,$FF,$03,$E0               ;00D5E4|        |      ;
                       db $FF,$00,$98,$FF,$07               ;00D5E9|        |      ;
                       db $C0,$FF,$01,$C0                   ;00D5EE|        |      ;
 
         DATA8_00D5F2: db $FF                               ;00D5F2|        |      ;
 
         DATA8_00D5F3: db $07,$E0,$FF,$00,$E0               ;00D5F3|        |      ;
                       db $FF,$01,$F0,$3F,$00               ;00D5F8|        |      ;
                       db $F0,$FF,$01,$F0,$3F               ;00D5FD|        |      ;
                       db $00,$C7,$FF,$01,$F8               ;00D602|        |      ;
                       db $1F,$60,$F0,$FF,$00               ;00D607|        |      ;
                       db $FC,$0F,$00,$FE                   ;00D60C|        |      ;
 
         DATA8_00D610: db $3F                               ;00D610|        |      ;
 
         DATA8_00D611: db $00,$FF,$07,$C0,$FE               ;00D611|        |      ;
                       db $1F,$00,$FE,$03,$78               ;00D616|        |      ;
                       db $F8,$1F,$00,$FF,$03               ;00D61B|        |      ;
                       db $0E,$FE,$1F,$80,$FF               ;00D620|        |      ;
                       db $01,$00,$FF,$0F,$E0               ;00D625|        |      ;
                       db $7F,$00,$FC,$F1                   ;00D62A|        |      ;
 
         DATA8_00D62E: db $1F                               ;00D62E|        |      ;
 
         DATA8_00D62F: db $80,$7F,$1C,$0C,$CC               ;00D62F|        |      ;
                       db $3F,$80,$FF,$03,$00               ;00D634|        |      ;
                       db $FF,$0F,$C0,$FF,$01               ;00D639|        |      ;
                       db $30,$FF,$03,$F8,$3F               ;00D63E|        |      ;
                       db $00,$1F,$BC,$0F,$80               ;00D643|        |      ;
                       db $FF,$81,$03,$FF,$07               ;00D648|        |      ;
                       db $E0,$7F,$00,$F0,$FF               ;00D64D|        |      ;
                       db $01,$F8,$1F,$00,$1F               ;00D652|        |      ;
                       db $FE,$03,$F0,$DF,$C0               ;00D657|        |      ;
                       db $C1,$F9,$09,$F0,$3F               ;00D65C|        |      ;
                       db $60,$F0,$FF,$00,$FC               ;00D661|        |      ;
                       db $0F,$C0,$FC,$3F,$00               ;00D666|        |      ;
                       db $FE,$01,$7C,$38,$3F               ;00D66B|        |      ;
                       db $00,$FF,$03,$8E,$E7               ;00D670|        |      ;
                       db $0F,$80,$FF,$00,$5F               ;00D675|        |      ;
                       db $DF,$03,$E0,$7F,$80               ;00D67A|        |      ;
                       db $87,$E3,$03,$E0,$7F               ;00D67F|        |      ;
                       db $C0,$F1,$FF,$00,$F0               ;00D684|        |      ;
                       db $1F,$E0,$3D,$3C,$00               ;00D689|        |      ;
                       db $FE,$07,$F8,$07,$F3               ;00D68E|        |      ;
                       db $03,$E0,$7F,$70,$70               ;00D693|        |      ;
                       db $7F,$00,$FE,$07,$C8               ;00D698|        |      ;
                       db $FF,$03,$C0,$FF,$00               ;00D69D|        |      ;
                       db $7E,$0C,$0F,$87,$1F               ;00D6A2|        |      ;
                       db $C0,$87,$FD,$07,$C0               ;00D6A7|        |      ;
                       db $7F,$C0,$77,$1C,$03               ;00D6AC|        |      ;
                       db $FC,$0F,$E0,$0F,$E1               ;00D6B1|        |      ;
                       db $27,$F0,$1F,$7C,$18               ;00D6B6|        |      ;
                       db $3F,$02,$FF,$03,$F8               ;00D6BB|        |      ;
                       db $57,$10,$E0,$7F,$00               ;00D6C0|        |      ;
                       db $DF,$C3,$C3,$E1,$1F               ;00D6C5|        |      ;
                       db $F0,$39,$3C,$80,$FC               ;00D6CA|        |      ;
                       db $0F,$F0,$CB,$43,$60               ;00D6CF|        |      ;
                       db $FE,$03,$7C,$3C,$0F               ;00D6D4|        |      ;
                       db $80,$FF,$C0,$F0,$7C               ;00D6D9|        |      ;
                       db $04,$FE,$07,$C0,$FF               ;00D6DE|        |      ;
                       db $03,$E0,$FF,$80,$87               ;00D6E3|        |      ;
                       db $DF,$01,$F0,$3F,$70               ;00D6E8|        |      ;
                       db $78,$1F,$80,$FF,$01               ;00D6ED|        |      ;
                       db $8F,$E3,$03,$F0,$3F               ;00D6F2|        |      ;
                       db $F0,$70,$7C,$00,$FF               ;00D6F7|        |      ;
                       db $01,$1F,$7E,$1C,$E0               ;00D6FC|        |      ;
                       db $3F,$C0,$E3,$71,$38               ;00D701|        |      ;
                       db $FC,$81,$3E,$1C,$0F               ;00D706|        |      ;
                       db $E0,$0F,$F8,$3B,$1F               ;00D70B|        |      ;
                       db $00,$FF,$01,$BE,$8F               ;00D710|        |      ;
                       db $03,$F0,$3F,$C0,$F3               ;00D715|        |      ;
                       db $38,$18,$7E,$03,$EF               ;00D71A|        |      ;
                       db $33,$C0,$F8,$0F,$F0               ;00D71F|        |      ;
                       db $79,$38,$1C,$7F,$00               ;00D724|        |      ;
                       db $8F,$E7,$C1,$F0,$3C               ;00D729|        |      ;
                       db $0C,$EF,$03,$FC,$03               ;00D72E|        |      ;
                       db $78,$F8,$0F,$C0,$7F               ;00D733|        |      ;
                       db $80,$1F,$E6,$C3,$F9               ;00D738|        |      ;
                       db $80,$87,$F3,$19,$F8               ;00D73D|        |      ;
                       db $07,$A0,$FF,$03,$F8               ;00D742|        |      ;
                       db $03,$FC,$03,$1C,$CF               ;00D747|        |      ;
                       db $33,$C0,$3F,$98,$BF               ;00D74C|        |      ;
                       db $00,$3F,$E0,$1F,$C0               ;00D751|        |      ;
                       db $3F,$C8,$1F,$83,$87               ;00D756|        |      ;
 
                       db $83,$FF,$00,$7E,$10               ;00D75B|        |      ;
                       db $FF,$80,$0F,$EE,$43               ;00D760|        |      ;
                       db $F8,$0F,$F8,$0F,$C0               ;00D765|        |      ;
                       db $1F,$E2,$3F,$C0,$0F               ;00D76A|        |      ;
                       db $E1,$13,$F8,$C3,$7D               ;00D76F|        |      ;
                       db $00,$FE,$81,$FF,$00               ;00D774|        |      ;
                       db $BE,$03,$FF,$01,$F8               ;00D779|        |      ;
                       db $63,$3C,$00,$3F,$8C               ;00D77E|        |      ;
                       db $FF,$C0,$3F,$C8,$0F               ;00D783|        |      ;
                       db $C0,$3F,$E0,$1F,$C0               ;00D788|        |      ;
                       db $3F,$C0,$5F,$C0,$1F               ;00D78D|        |      ;
                       db $FE,$01,$F8,$01,$FE               ;00D792|        |      ;
                       db $03,$FC,$30,$1F,$80               ;00D797|        |      ;
                       db $FF,$00,$FF,$01,$FE               ;00D79C|        |      ;
                       db $00,$FF,$01,$FF,$63               ;00D7A1|        |      ;
                       db $38,$00,$1F,$C7,$7F               ;00D7A6|        |      ;
                       db $C0,$0F,$E1,$39,$F0               ;00D7AB|        |      ;
                       db $1F,$C0,$0F,$E0,$0F               ;00D7B0|        |      ;
                       db $F0,$3F,$C0,$3F,$CE               ;00D7B5|        |      ;
                       db $03,$F0,$43,$F8,$1F               ;00D7BA|        |      ;
                       db $F8,$43,$7C,$00,$FE               ;00D7BF|        |      ;
                       db $03,$F7,$03,$F8,$63               ;00D7C4|        |      ;
                       db $7C,$03,$DE,$C1,$7B               ;00D7C9|        |      ;
                       db $00,$7E,$00,$FF,$81               ;00D7CE|        |      ;
                       db $7F,$80,$3F,$C0,$3F               ;00D7D3|        |      ;
 
                       db $E0,$7F,$00,$7C,$0C               ;00D7D8|        |      ;
                       db $FF,$81,$C3,$F1,$1F               ;00D7DD|        |      ;
                       db $C0,$0F,$C0,$FF,$C0               ;00D7E2|        |      ;
                       db $1F,$FC,$07,$F0,$87               ;00D7E7|        |      ;
                       db $E0,$7C,$0E,$7E,$08               ;00D7EC|        |      ;
                       db $CF,$C1,$E1,$F0,$1E               ;00D7F1|        |      ;
                       db $CC,$63,$98,$9F,$C1               ;00D7F6|        |      ;
                       db $39,$F8,$0F,$C0,$E7               ;00D7FB|        |      ;
                       db $E0,$3F,$00,$7E,$8C               ;00D800|        |      ;
                       db $C7,$F1,$00,$FF,$81               ;00D805|        |      ;
                       db $1F,$E0,$CF,$E0,$1F               ;00D80A|        |      ;
 
                       db $60,$7C,$1F,$C0,$0F               ;00D80F|        |      ;
                       db $F8,$88,$FF,$00,$FF               ;00D814|        |      ;
                       db $00,$FF,$00,$8F,$F3               ;00D819|        |      ;
                       db $08,$FC,$1F,$80,$7F               ;00D81E|        |      ;
                       db $80,$3F,$9C,$07,$C0               ;00D823|        |      ;
                       db $FF,$61,$7D,$0C,$0E               ;00D828|        |      ;
                       db $1E,$E7,$0B,$E0,$7B               ;00D82D|        |      ;
                       db $8C,$87,$C1,$E7,$31               ;00D832|        |      ;
                       db $7C,$18,$1E,$FE,$03               ;00D837|        |      ;
                       db $E0,$8F,$FC,$80,$3F               ;00D83C|        |      ;
                       db $D0,$03,$FD,$07,$F8               ;00D841|        |      ;
                       db $0F,$E0,$1B,$30,$DE               ;00D846|        |      ;
                       db $63,$E0,$FD,$03,$F8               ;00D84B|        |      ;
                       db $07,$78,$1E,$F7,$00               ;00D850|        |      ;
                       db $F0,$83,$FC,$01,$FF               ;00D855|        |      ;
                       db $04,$E2,$7F,$00,$FC               ;00D85A|        |      ;
                       db $17,$FC,$C0,$C3,$FD               ;00D85F|        |      ;
                       db $06,$FE,$00,$8F,$F8               ;00D864|        |      ;
                       db $03,$F8,$7D,$07,$E0               ;00D869|        |      ;
                       db $0F,$E0,$1F,$E4,$1F               ;00D86E|        |      ;
                       db $00,$FC,$4F,$B0,$7F               ;00D873|        |      ;
                       db $00,$07,$F3,$1F,$F0               ;00D878|        |      ;
                       db $1F,$F8,$00,$FF,$01               ;00D87D|        |      ;
                       db $FC,$49,$1C,$38,$DE               ;00D882|        |      ;
                       db $07,$E0,$3F,$E0,$E1               ;00D887|        |      ;
                       db $7F,$00,$FF,$03,$78               ;00D88C|        |      ;
                       db $F0,$3F,$80,$3F,$C0               ;00D891|        |      ;
                       db $1F,$00,$FE,$77,$80               ;00D896|        |      ;
                       db $FF,$00,$3F,$C6,$3F               ;00D89B|        |      ;
                       db $C0,$7F,$00,$E2,$FF               ;00D8A0|        |      ;
                       db $03,$38,$DC,$0F,$C0               ;00D8A5|        |      ;
                       db $1F,$F8,$07,$FC,$07               ;00D8AA|        |      ;
                       db $F8,$00,$DF,$E0,$3F               ;00D8AF|        |      ;
                       db $80,$61,$FF,$00,$FF               ;00D8B4|        |      ;
                       db $03,$F8,$07,$F0,$33               ;00D8B9|        |      ;
                       db $F0,$0F,$00,$FC,$3F               ;00D8BE|        |      ;
                       db $C0,$8F,$FF,$00,$F8               ;00D8C3|        |      ;
                       db $1F,$C0,$7F,$C0,$3E               ;00D8C8|        |      ;
                       db $E0,$3F,$00,$FF,$01               ;00D8CD|        |      ;
                       db $CC,$1F,$70,$1F,$F0               ;00D8D2|        |      ;
                       db $1F,$C0,$FF,$02,$C0               ;00D8D7|        |      ;
                       db $FF,$A0,$8F,$E0,$0F               ;00D8DC|        |      ;
                       db $78,$F0,$1F,$00,$FF               ;00D8E1|        |      ;
                       db $03,$F8,$07,$F8,$03               ;00D8E6|        |      ;
                       db $FC,$03,$7F,$E0,$07               ;00D8EB|        |      ;
                       db $FC,$03,$CE,$F1,$07               ;00D8F0|        |      ;
                       db $F0,$83,$7F,$00,$FF               ;00D8F5|        |      ;
 
                       db $00,$3F,$F8,$07,$E0               ;00D8FA|        |      ;
                       db $FF,$03,$38,$F0,$3F               ;00D8FF|        |      ;
                       db $80,$3F,$E0,$03,$FE               ;00D904|        |      ;
                       db $0F,$F0,$0F,$70,$80               ;00D909|        |      ;
                       db $FF,$01,$FE,$01,$1F               ;00D90E|        |      ;
                       db $E0,$3F,$C0,$FF,$80               ;00D913|        |      ;
                       db $0F,$F8,$0F,$F0,$3F               ;00D918|        |      ;
                       db $C0,$40,$FF,$03,$FC               ;00D91D|        |      ;
                       db $07,$0E,$E0,$7F,$80               ;00D922|        |      ;
                       db $7F,$C0,$07,$F8,$0F               ;00D927|        |      ;
                       db $F8,$0F,$F0,$C1,$FF               ;00D92C|        |      ;
                       db $00,$FF,$01,$3C,$C8               ;00D931|        |      ;
                       db $3F,$C0,$7F,$80,$03               ;00D936|        |      ;
                       db $FF,$03,$FC,$0F,$E0               ;00D93B|        |      ;
                       db $E1,$3F,$80,$FF,$00               ;00D940|        |      ;
                       db $0E,$FC,$0F,$E0,$3F               ;00D945|        |      ;
                       db $C0,$03,$FF,$03,$FC               ;00D94A|        |      ;
                       db $0F,$E0,$F0,$7F,$00               ;00D94F|        |      ;
                       db $FF,$00,$07,$F8,$1F               ;00D954|        |      ;
                       db $E0,$7F,$00,$C1,$FF               ;00D959|        |      ;
                       db $01,$FE,$03,$3E,$E0               ;00D95E|        |      ;
                       db $3F,$C0,$FF,$00,$03               ;00D963|        |      ;
                       db $FE,$0F,$F0,$3F,$C0               ;00D968|        |      ;
                       db $C0,$FF,$00,$FE,$03               ;00D96D|        |      ;
                       db $3C,$F0,$3F,$E0,$3F               ;00D972|        |      ;
                       db $C0,$07,$FE,$03,$FC               ;00D977|        |      ;
                       db $03,$E0,$E1,$7F,$00               ;00D97C|        |      ;
                       db $FF,$03,$78,$98,$7F               ;00D981|        |      ;
                       db $C0,$7F,$00,$0F,$FA               ;00D986|        |      ;
                       db $07,$F8,$0F,$70,$F0               ;00D98B|        |      ;
                       db $3F,$00,$FF,$01,$0E               ;00D990|        |      ;
                       db $FE,$0F,$E0,$3F,$80               ;00D995|        |      ;
                       db $0F,$FE,$01,$FE,$03               ;00D99A|        |      ;
                       db $E0,$61,$FE,$83,$FD               ;00D99F|        |      ;
                       db $01,$1C,$FC,$0F,$E0               ;00D9A4|        |      ;
                       db $1F,$C0,$83,$FB,$03               ;00D9A9|        |      ;
                       db $FC,$07,$F0,$01,$FF               ;00D9AE|        |      ;
                       db $81,$7F,$80,$0F,$F8               ;00D9B3|        |      ;
                       db $1F,$E0,$23,$7F,$01               ;00D9B8|        |      ;
                       db $FC,$0C,$6F,$E0,$1F               ;00D9BD|        |      ;
                       db $40,$9F,$F7,$00,$7E               ;00D9C2|        |      ;
                       db $28,$1F,$E0,$3F,$C0               ;00D9C7|        |      ;
                       db $0F,$FE,$01,$FC,$C0               ;00D9CC|        |      ;
                       db $7F,$C0,$1F,$C0,$1F               ;00D9D1|        |      ;
                       db $F0,$1F,$F0,$07,$F8               ;00D9D6|        |      ;
                       db $0F,$F0,$C1,$7F,$00               ;00D9DB|        |      ;
                       db $FF,$00,$39,$FA,$11               ;00D9E0|        |      ;
                       db $47,$3E,$0F,$C2,$1F               ;00D9E5|        |      ;
 
                       db $F8,$1F,$C0,$3F,$C0               ;00D9EA|        |      ;
                       db $03,$FE,$03,$FC,$61               ;00D9EF|        |      ;
                       db $1C,$F8,$0F,$C2,$3F               ;00D9F4|        |      ;
                       db $03,$FB,$60,$0C,$FF               ;00D9F9|        |      ;
                       db $01,$FD,$01,$FA,$30               ;00D9FE|        |      ;
                       db $7F,$10,$7E,$38,$0E               ;00DA03|        |      ;
 
                       db $3F,$C0,$7F,$00,$FE               ;00DA08|        |      ;
                       db $01,$3F,$C0,$3F,$C0               ;00DA0D|        |      ;
                       db $1F,$EC,$03,$3F,$E0               ;00DA12|        |      ;
                       db $3F,$80,$7F,$C0,$0F               ;00DA17|        |      ;
                       db $F8,$0F,$F0,$0B,$F6               ;00DA1C|        |      ;
                       db $81,$0F,$F0,$1F,$E0               ;00DA21|        |      ;
                       db $3F,$F0,$03,$FC,$03               ;00DA26|        |      ;
                       db $FC,$01,$7F,$C0,$0F               ;00DA2B|        |      ;
                       db $F8,$0F,$F0,$0F,$F0               ;00DA30|        |      ;
                       db $07,$FC,$03,$FE,$01               ;00DA35|        |      ;
                       db $8F,$F8,$60,$FE,$01               ;00DA3A|        |      ;
                       db $FC,$03,$7E,$80,$FF               ;00DA3F|        |      ;
                       db $00,$FF,$61,$70,$3C               ;00DA44|        |      ;
                       db $DC,$0F,$C0,$EF,$18               ;00DA49|        |      ;
                       db $E0,$7F,$02,$FE,$03               ;00DA4E|        |      ;
                       db $F0,$0F,$E8,$F7,$00               ;00DA53|        |      ;
                       db $F8,$0D,$FE,$02,$FF               ;00DA58|        |      ;
                       db $01,$F8,$0F,$C0,$1F               ;00DA5D|        |      ;
                       db $FC,$03,$F0,$0F,$EE               ;00DA62|        |      ;
                       db $80,$F5,$41,$F0,$FF               ;00DA67|        |      ;
                       db $00,$FC,$07,$F0,$0F               ;00DA6C|        |      ;
                       db $E0,$BF,$00,$FD,$07               ;00DA71|        |      ;
                       db $F0,$78,$3F,$00,$9F               ;00DA76|        |      ;
                       db $2F,$80,$FF,$00,$E7               ;00DA7B|        |      ;
                       db $6F,$00,$F7,$03,$FC               ;00DA80|        |      ;
                       db $07,$F0,$E2,$1F,$C0               ;00DA85|        |      ;
                       db $3F,$80,$3F,$E0,$0F               ;00DA8A|        |      ;
                       db $F8,$07,$FC,$07,$8C               ;00DA8F|        |      ;
                       db $E3,$87,$F1,$01,$FE               ;00DA94|        |      ;
                       db $03,$F8,$0F,$F8,$C2               ;00DA99|        |      ;
                       db $79,$14,$35,$DC,$1F               ;00DA9E|        |      ;
                       db $E0,$07,$EC,$9D,$07               ;00DAA3|        |      ;
                       db $E0,$E3,$7F,$00,$7E               ;00DAA8|        |      ;
                       db $80,$FF,$01,$FE,$00               ;00DAAD|        |      ;
                       db $FE,$07,$08,$F9,$3F               ;00DAB2|        |      ;
                       db $E0,$07,$4E,$F8,$1F               ;00DAB7|        |      ;
                       db $C0,$E3,$7F,$00,$7F               ;00DABC|        |      ;
                       db $00,$FE,$0F,$C0,$F4               ;00DAC1|        |      ;
                       db $7F,$00,$FF,$00,$FE               ;00DAC6|        |      ;
                       db $43,$80,$FE,$07,$F8               ;00DACB|        |      ;
                       db $07,$70,$EB,$1F,$00               ;00DAD0|        |      ;
                       db $FF,$80,$7F,$00,$3F               ;00DAD5|        |      ;
                       db $F0,$1F,$C0,$1F,$86               ;00DADA|        |      ;
                       db $FE,$03,$E0,$FF,$03               ;00DADF|        |      ;
                       db $E0,$03,$FF,$03,$B0               ;00DAE4|        |      ;
                       db $F2,$7F,$00,$7E,$00               ;00DAE9|        |      ;
                       db $FF,$81,$0F,$F0,$FF               ;00DAEE|        |      ;
                       db $00,$AA,$3E,$85,$FF               ;00DAF3|        |      ;
                       db $01,$B8,$06,$FF,$07               ;00DAF8|        |      ;
                       db $60,$FF,$01,$F0,$0F               ;00DAFD|        |      ;
                       db $F0,$2F,$4C,$00,$FF               ;00DB02|        |      ;
                       db $07,$FC,$01,$FF,$80               ;00DB07|        |      ;
                       db $1F,$E0,$3F,$F0,$04               ;00DB0C|        |      ;
                       db $FC,$1F,$E0,$0F,$F0               ;00DB11|        |      ;
                       db $0F,$F8,$07,$F0,$C2               ;00DB16|        |      ;
                       db $FF,$00,$7C,$FC,$03               ;00DB1B|        |      ;
                       db $F0,$07,$FC,$03,$7E               ;00DB20|        |      ;
                       db $00,$FF,$01,$3F,$C0               ;00DB25|        |      ;
                       db $7F,$E0,$07,$F8,$0F               ;00DB2A|        |      ;
                       db $7E,$00,$FC,$5F,$40               ;00DB2F|        |      ;
                       db $17,$7C,$14,$FF,$01               ;00DB34|        |      ;
                       db $F8,$0F,$81,$FF,$03               ;00DB39|        |      ;
                       db $F0,$17,$C4,$AF,$05               ;00DB3E|        |      ;
                       db $4D,$0B,$FC,$1F,$E0               ;00DB43|        |      ;
                       db $0F,$54,$F1,$3F,$00               ;00DB48|        |      ;
                       db $FC,$AB,$6A,$10,$FA               ;00DB4D|        |      ;
                       db $F0,$3F,$00,$FF,$0C               ;00DB52|        |      ;
                       db $E0,$E3,$7F,$00,$FE               ;00DB57|        |      ;
                       db $80,$76,$7E,$01,$3C               ;00DB5C|        |      ;
                       db $FC,$1F,$80,$1F,$F0               ;00DB61|        |      ;
                       db $83,$FA,$03,$F8,$17               ;00DB66|        |      ;
                       db $F8,$1D,$00,$FF,$81               ;00DB6B|        |      ;
                       db $FD,$B0,$04,$FC,$1F               ;00DB70|        |      ;
                       db $E0,$1F,$E0,$03,$FF               ;00DB75|        |      ;
                       db $00,$7F,$00,$FE,$1F               ;00DB7A|        |      ;
                       db $0E,$F0,$1F,$E0,$07               ;00DB7F|        |      ;
                       db $FC,$03,$F8,$83,$7F               ;00DB84|        |      ;
                       db $40,$7C,$3C,$F0,$7F               ;00DB89|        |      ;
                       db $00,$7C,$0E,$1F,$E0               ;00DB8E|        |      ;
                       db $3F,$C0,$AF,$3C,$22               ;00DB93|        |      ;
                       db $17,$F0,$1F,$F0,$0F               ;00DB98|        |      ;
                       db $E0,$3F,$C0,$1F,$F0               ;00DB9D|        |      ;
                       db $1F,$C0,$5F,$81,$F9               ;00DBA2|        |      ;
                       db $05,$F8,$1F,$E8,$03               ;00DBA7|        |      ;
                       db $FE,$01,$BE,$0E,$F8               ;00DBAC|        |      ;
                       db $0F,$E0,$07,$6F,$81               ;00DBB1|        |      ;
                       db $8D,$FE,$03,$F8,$01               ;00DBB6|        |      ;
                       db $FC,$1F,$F0,$02,$FE               ;00DBBB|        |      ;
                       db $07,$F8,$03,$78,$3F               ;00DBC0|        |      ;
                       db $81,$FD,$00,$F3,$87               ;00DBC5|        |      ;
                       db $F9,$80,$BD,$01,$FF               ;00DBCA|        |      ;
                       db $03,$F8,$81,$7F,$00               ;00DBCF|        |      ;
                       db $BF,$E3,$00,$FE,$03               ;00DBD4|        |      ;
                       db $FC,$03,$1E,$F8,$0F               ;00DBD9|        |      ;
 
                       db $E4,$07,$FC,$01,$FC               ;00DBDE|        |      ;
                       db $A7,$03,$F2,$43,$FD               ;00DBE3|        |      ;
                       db $01,$3E,$E1,$07,$E0               ;00DBE8|        |      ;
                       db $FF,$C0,$73,$B0,$D1               ;00DBED|        |      ;
                       db $0F,$C8,$0F,$E0,$EF               ;00DBF2|        |      ;
 
                       db $F0,$C1,$F0,$E1,$7B               ;00DBF7|        |      ;
                       db $20,$4F,$C9,$0B,$E7               ;00DBFC|        |      ;
 
                       db $41,$FF,$00,$FC,$0F               ;00DC01|        |      ;
                       db $E0,$E3,$B0,$F4,$B4               ;00DC06|        |      ;
                       db $15,$D8,$0F,$C8,$5F               ;00DC0B|        |      ;
                       db $C0,$F7,$60,$AC,$2F               ;00DC10|        |      ;
                       db $C0,$FF,$80,$FC,$60               ;00DC15|        |      ;
                       db $3C,$18,$3F,$3C,$06               ;00DC1A|        |      ;
                       db $FC,$0F,$0F,$E4,$0F               ;00DC1F|        |      ;
                       db $E0,$0F,$F0,$0F,$E0               ;00DC24|        |      ;
                       db $3F,$7C,$88,$3F,$C0               ;00DC29|        |      ;
                       db $7F,$80,$1F,$9B,$80               ;00DC2E|        |      ;
                       db $FF,$00,$FF,$04,$79               ;00DC33|        |      ;
 
                       db $7C,$19,$F8,$07,$FC               ;00DC38|        |      ;
                       db $03,$F0,$F3,$18,$E0               ;00DC3D|        |      ;
                       db $3F,$C0,$FB,$30,$78               ;00DC42|        |      ;
                       db $7C,$E0,$7E,$00,$FF               ;00DC47|        |      ;
                       db $80,$79,$FC,$A0,$F0               ;00DC4C|        |      ;
                       db $17,$F8,$07,$E0,$E7               ;00DC51|        |      ;
                       db $21,$E2,$77,$C0,$7F               ;00DC56|        |      ;
                       db $20,$7C,$1E,$86,$FE               ;00DC5B|        |      ;
                       db $01,$FF,$01,$F8,$31               ;00DC60|        |      ;
                       db $7C,$70,$1E,$F8,$0F               ;00DC65|        |      ;
                       db $C0,$9F,$89,$E0,$77               ;00DC6A|        |      ;
                       db $C0,$7F,$80,$BE,$4E               ;00DC6F|        |      ;
                       db $C0,$FB,$01,$FF,$00               ;00DC74|        |      ;
                       db $F9,$F0,$A1,$F0,$0B               ;00DC79|        |      ;
                       db $F8,$0F,$E4,$C7,$A1               ;00DC7E|        |      ;
                       db $C1,$E7,$C0,$7F,$E0               ;00DC83|        |      ;
                       db $78,$3C,$10,$FF,$01               ;00DC88|        |      ;
                       db $FF,$00,$F3,$71,$70               ;00DC8D|        |      ;
                       db $F8,$18,$F8,$1F,$C8               ;00DC92|        |      ;
                       db $87,$63,$C2,$EF,$C0               ;00DC97|        |      ;
                       db $77,$20,$7E,$38,$C4               ;00DC9C|        |      ;
                       db $FE,$00,$FF,$01,$FB               ;00DCA1|        |      ;
                       db $81,$F1,$F0,$2C,$F8               ;00DCA6|        |      ;
                       db $0F,$C8,$87,$47,$C0               ;00DCAB|        |      ;
                       db $7F,$C0,$2F,$F0,$67               ;00DCB0|        |      ;
                       db $B8,$C0,$DF,$02,$FE               ;00DCB5|        |      ;
                       db $03,$F0,$E3,$70,$F8               ;00DCBA|        |      ;
                       db $64,$E0,$4F,$F8,$18               ;00DCBF|        |      ;
                       db $5F,$80,$7F,$10,$BF               ;00DCC4|        |      ;
                       db $14,$1F,$AC,$87,$E2               ;00DCC9|        |      ;
                       db $55,$E0,$3F,$B0,$1E               ;00DCCE|        |      ;
                       db $A6,$8E,$6A,$09,$BE               ;00DCD3|        |      ;
                       db $8F,$C1,$F8,$A1,$F8               ;00DCD8|        |      ;
                       db $29,$E0,$FB,$30,$78               ;00DCDD|        |      ;
                       db $1E,$8C,$EF,$01,$FE               ;00DCE2|        |      ;
                       db $C1,$F0,$70,$6A,$B1               ;00DCE7|        |      ;
                       db $1B,$F0,$3F,$10,$8F               ;00DCEC|        |      ;
                       db $07,$87,$F7,$80,$FB               ;00DCF1|        |      ;
                       db $41,$7C,$10,$3F,$9C               ;00DCF6|        |      ;
                       db $07,$3C,$1F,$1E,$43               ;00DCFB|        |      ;
                       db $67,$B1,$1E,$F8,$0F               ;00DD00|        |      ;
                       db $C0,$CF,$C1,$74,$2E               ;00DD05|        |      ;
                       db $E0,$3F,$C0,$6F,$50               ;00DD0A|        |      ;
                       db $E7,$11,$D0,$7F,$E1               ;00DD0F|        |      ;
                       db $58,$BA,$28,$7E,$03               ;00DD14|        |      ;
                       db $FC,$07,$C6,$E3,$41               ;00DD19|        |      ;
                       db $F8,$17,$E0,$3F,$F0               ;00DD1E|        |      ;
                       db $38,$1C,$2E,$9F,$80               ;00DD23|        |      ;
                       db $FF,$C0,$3D,$B0,$5C               ;00DD28|        |      ;
                       db $F4,$06,$F0,$7B,$78               ;00DD2D|        |      ;
                       db $70,$0F,$E8,$87,$30               ;00DD32|        |      ;
                       db $3F,$87,$8D,$C6,$72               ;00DD37|        |      ;
                       db $59,$6A,$F8,$1C,$AC               ;00DD3C|        |      ;
                       db $2B,$D2,$A5,$96,$05               ;00DD41|        |      ;
                       db $9F,$27,$05,$FF,$01               ;00DD46|        |      ;
                       db $F8,$27,$C0,$FF,$E0               ;00DD4B|        |      ;
                       db $B0,$B8,$6A,$3C,$3C               ;00DD50|        |      ;
                       db $1A,$FC,$29,$F8,$1D               ;00DD55|        |      ;
                       db $A0,$1F,$0E,$DE,$07               ;00DD5A|        |      ;
                       db $E1,$F3,$40,$FC,$83               ;00DD5F|        |      ;
                       db $C0,$FF,$C1,$70,$38               ;00DD64|        |      ;
                       db $DE,$1A,$D4,$87,$F0               ;00DD69|        |      ;
                       db $1B,$B8,$17,$54,$75               ;00DD6E|        |      ;
                       db $7C,$60,$7F,$00,$FE               ;00DD73|        |      ;
                       db $03,$E3,$47,$0A,$FE               ;00DD78|        |      ;
                       db $0F,$06,$E6,$A9,$F0               ;00DD7D|        |      ;
                       db $3B,$0C,$7E,$C0,$FD               ;00DD82|        |      ;
                       db $01,$7C,$0F,$E2,$0F               ;00DD87|        |      ;
                       db $C0,$7F,$60,$3E,$42               ;00DD8C|        |      ;
                       db $3F,$CA,$03,$FE,$03               ;00DD91|        |      ;
                       db $F8,$A3,$FC,$E0,$34               ;00DD96|        |      ;
                       db $C0,$FF,$80,$7D,$78               ;00DD9B|        |      ;
                       db $10,$7F,$50,$8E,$F7               ;00DDA0|        |      ;
                       db $01,$FC,$81,$F8,$0F               ;00DDA5|        |      ;
                       db $78,$F8,$1F,$C0,$0F               ;00DDAA|        |      ;
                       db $84,$DF,$29,$C0,$FF               ;00DDAF|        |      ;
                       db $01,$F8,$37,$18,$FE               ;00DDB4|        |      ;
                       db $08,$F8,$3F,$20,$BE               ;00DDB9|        |      ;
                       db $06,$BA,$1F,$80,$7F               ;00DDBE|        |      ;
                       db $09,$6E,$3B,$10,$FE               ;00DDC3|        |      ;
                       db $24,$F8,$2F,$18,$FC               ;00DDC8|        |      ;
                       db $03,$F8,$0F,$10,$FF               ;00DDCD|        |      ;
                       db $05,$87,$67,$51,$FB               ;00DDD2|        |      ;
                       db $80,$E5,$C7,$C0,$5F               ;00DDD7|        |      ;
                       db $70,$2E,$1C,$7D,$C0               ;00DDDC|        |      ;
                       db $FD,$30,$78,$0F,$EC               ;00DDE1|        |      ;
                       db $07,$0A,$5F,$0F,$83               ;00DDE6|        |      ;
                       db $6F,$41,$FC,$29,$F0               ;00DDEB|        |      ;
                       db $7F,$00,$3E,$85,$C7               ;00DDF0|        |      ;
                       db $2B,$E8,$78,$3D,$30               ;00DDF5|        |      ;
                       db $FC,$07,$F8,$07,$1C               ;00DDFA|        |      ;
                       db $5E,$0F,$86,$4F,$C1               ;00DDFF|        |      ;
                       db $73,$47,$F0,$1F,$A0               ;00DE04|        |      ;
                       db $AF,$21,$C7,$73,$08               ;00DE09|        |      ;
                       db $FE,$0F,$04,$FF,$01               ;00DE0E|        |      ;
                       db $FC,$03,$C1,$FF,$82               ;00DE13|        |      ;
                       db $E2,$2B,$A4,$3B,$C3               ;00DE18|        |      ;
                       db $E1,$7B,$40,$7E,$18               ;00DE1D|        |      ;
                       db $AE,$2B,$06,$FF,$05               ;00DE22|        |      ;
                       db $E2,$AB,$C0,$FA,$03               ;00DE27|        |      ;
                       db $F0,$3F,$E0,$27,$92               ;00DE2C|        |      ;
                       db $C7,$2B,$C1,$77,$1A               ;00DE31|        |      ;
                       db $94,$3F,$01,$FF,$80               ;00DE36|        |      ;
                       db $E1,$3F,$C0,$FB,$08               ;00DE3B|        |      ;
                       db $CE,$0F,$05,$FC,$1F               ;00DE40|        |      ;
                       db $90,$1F,$D2,$F1,$01               ;00DE45|        |      ;
                       db $FD,$01,$FE,$03,$FB               ;00DE4A|        |      ;
                       db $80,$7E,$C0,$87,$FB               ;00DE4F|        |      ;
                       db $81,$F8,$21,$7C,$1E               ;00DE54|        |      ;
                       db $0D,$C3,$3F,$42,$7A               ;00DE59|        |      ;
                       db $8B,$F4,$15,$F0,$E1               ;00DE5E|        |      ;
                       db $3B,$20,$7F,$06,$AE               ;00DE63|        |      ;
                       db $87,$0E,$F8,$1F,$C0               ;00DE68|        |      ;
                       db $8F,$E0,$F7,$00,$7F               ;00DE6D|        |      ;
                       db $B0,$3E,$C0,$3F,$80               ;00DE72|        |      ;
                       db $7F,$82,$87,$FB,$01               ;00DE77|        |      ;
                       db $FC,$15,$58,$1F,$A6               ;00DE7C|        |      ;
                       db $83,$BB,$05,$F8,$1F               ;00DE81|        |      ;
                       db $C0,$3F,$C0,$7F,$10               ;00DE86|        |      ;
                       db $F8,$3F,$80,$5F,$C0               ;00DE8B|        |      ;
                       db $B7,$58,$03,$FC,$1F               ;00DE90|        |      ;
                       db $80,$FF,$01,$FE,$01               ;00DE95|        |      ;
                       db $E2,$BF,$00,$7F,$1A               ;00DE9A|        |      ;
                       db $8C,$1F,$A2,$0F,$F0               ;00DE9F|        |      ;
                       db $3F,$E0,$3F,$00,$1F               ;00DEA4|        |      ;
                       db $FB,$00,$FF,$01,$FC               ;00DEA9|        |      ;
                       db $81,$3E,$C5,$6D,$B0               ;00DEAE|        |      ;
                       db $2E,$F0,$1F,$84,$D7               ;00DEB3|        |      ;
                       db $01,$FE,$0B,$F8,$07               ;00DEB8|        |      ;
                       db $EC,$03,$FC,$86,$BC               ;00DEBD|        |      ;
                       db $0A,$45,$FF,$03,$F8               ;00DEC2|        |      ;
                       db $03,$DC,$DA,$1D,$A0               ;00DEC7|        |      ;
                       db $3F,$A0,$1F,$E0,$B7               ;00DECC|        |      ;
                       db $68,$A9,$59,$E4,$07               ;00DED1|        |      ;
                       db $F4,$17,$5A,$C1,$FD               ;00DED6|        |      ;
                       db $01,$FE,$01,$FE,$00               ;00DEDB|        |      ;
                       db $AF,$E1,$3F,$80,$7F               ;00DEE0|        |      ;
 
                       db $00,$FC,$0F,$F0,$07               ;00DEE5|        |      ;
                       db $F0,$7F,$00,$FF,$80               ;00DEEA|        |      ;
                       db $E6,$1F,$C0,$3F,$C0               ;00DEEF|        |      ;
                       db $F9,$0F,$80,$1F,$FC               ;00DEF4|        |      ;
                       db $0F,$E0,$0F,$C0,$FF               ;00DEF9|        |      ;
                       db $00,$FE,$FF,$FF,$FF               ;00DEFE|        |      ;
 
                       db $FF,$FF,$FF,$FF,$FF               ;00DF03|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF08|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF0D|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF12|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF17|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF1C|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF21|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF26|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF2B|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF30|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF35|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF3A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF3F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF44|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF49|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF4E|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF53|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF58|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF5D|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF62|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF67|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF6C|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF71|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF76|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF7B|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF80|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF85|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF8A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF8F|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF94|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF99|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DF9E|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFA3|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFA8|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFAD|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFB2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFB7|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFBC|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFC1|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFC6|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFCB|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFD0|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFD5|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFDA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFDF|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFE4|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFE9|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFEE|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFF3|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;00DFF8|        |      ;
                       db $FF,$FF,$FF                       ;00DFFD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E000|        |      ;
                       db $00,$00,$00,$00,$00               ;00E005|        |      ;
                       db $00,$00,$00,$00,$00               ;00E00A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E00F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E014|        |      ;
                       db $00,$00,$00,$00,$00               ;00E019|        |      ;
                       db $00,$00,$00,$00,$00               ;00E01E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E023|        |      ;
                       db $00,$00,$00,$00,$00               ;00E028|        |      ;
                       db $00,$00,$00,$00,$00               ;00E02D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E032|        |      ;
                       db $00,$00,$00,$00,$00               ;00E037|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E03C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E041|        |      ;
                       db $00,$00,$00,$00,$00               ;00E046|        |      ;
                       db $00,$00,$00,$00,$00               ;00E04B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E050|        |      ;
                       db $00,$00,$00,$00,$00               ;00E055|        |      ;
                       db $00,$00,$00,$00,$00               ;00E05A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E05F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E064|        |      ;
                       db $00,$00,$00,$00,$00               ;00E069|        |      ;
                       db $00,$00,$00,$00,$00               ;00E06E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E073|        |      ;
                       db $00,$00,$00,$00,$00               ;00E078|        |      ;
                       db $00,$00,$00,$00,$00               ;00E07D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E082|        |      ;
                       db $00,$00,$00,$00,$00               ;00E087|        |      ;
                       db $00,$00,$00,$00,$00               ;00E08C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E091|        |      ;
                       db $00,$00,$00,$00,$00               ;00E096|        |      ;
                       db $00,$00,$00,$00,$00               ;00E09B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0A0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0A5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0AA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0AF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0B4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0B9|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E0BE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0C3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0C8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0CD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0D2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0D7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0DC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0E1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0E6|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E0EB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0F0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0F5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0FA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E0FF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E104|        |      ;
                       db $00,$00,$00,$00,$00               ;00E109|        |      ;
                       db $00,$00,$00,$00,$00               ;00E10E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E113|        |      ;
                       db $00,$00,$00,$00,$00               ;00E118|        |      ;
                       db $00,$00,$00,$00,$00               ;00E11D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E122|        |      ;
                       db $00,$00,$00,$00,$00               ;00E127|        |      ;
                       db $00,$00,$00,$00,$00               ;00E12C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E131|        |      ;
                       db $00,$00,$00,$00,$00               ;00E136|        |      ;
                       db $00,$00,$00,$00,$00               ;00E13B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E140|        |      ;
                       db $00,$00,$00,$00,$00               ;00E145|        |      ;
                       db $00,$00,$00,$00,$00               ;00E14A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E14F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E154|        |      ;
                       db $00,$00,$00,$00,$00               ;00E159|        |      ;
                       db $00,$00,$00,$00,$00               ;00E15E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E163|        |      ;
                       db $00,$00,$00,$00,$00               ;00E168|        |      ;
                       db $00,$00,$00,$00,$00               ;00E16D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E172|        |      ;
                       db $00,$00,$00,$00,$00               ;00E177|        |      ;
                       db $00,$00,$00,$00,$00               ;00E17C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E181|        |      ;
                       db $00,$00,$00,$00,$00               ;00E186|        |      ;
                       db $00,$00,$00,$00,$00               ;00E18B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E190|        |      ;
                       db $00,$00,$00,$00,$00               ;00E195|        |      ;
                       db $00,$00,$00,$00,$00               ;00E19A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E19F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1A4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1A9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1AE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1B3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1B8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1BD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1C2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1C7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1CC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1D1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1D6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1DB|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E1E0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1E5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1EA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1EF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1F4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1F9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E1FE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E203|        |      ;
                       db $00,$00,$00,$00,$00               ;00E208|        |      ;
                       db $00,$00,$00,$00,$00               ;00E20D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E212|        |      ;
                       db $00,$00,$00,$00,$00               ;00E217|        |      ;
                       db $00,$00,$00,$00,$00               ;00E21C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E221|        |      ;
                       db $00,$00,$00,$00,$00               ;00E226|        |      ;
                       db $00,$00,$00,$00,$00               ;00E22B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E230|        |      ;
                       db $00,$00,$00,$00,$00               ;00E235|        |      ;
                       db $00,$00,$00,$00,$00               ;00E23A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E23F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E244|        |      ;
                       db $00,$00,$00,$00,$00               ;00E249|        |      ;
                       db $00,$00,$00,$00,$00               ;00E24E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E253|        |      ;
                       db $00,$00,$00,$00,$00               ;00E258|        |      ;
                       db $00,$00,$00,$00,$00               ;00E25D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E262|        |      ;
                       db $00,$00,$00,$00,$00               ;00E267|        |      ;
                       db $00,$00,$00,$00,$00               ;00E26C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E271|        |      ;
                       db $00,$00,$00,$00,$00               ;00E276|        |      ;
                       db $00,$00,$00,$00,$00               ;00E27B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E280|        |      ;
                       db $00,$00,$00,$00,$00               ;00E285|        |      ;
                       db $00,$00,$00,$00,$00               ;00E28A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E28F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E294|        |      ;
                       db $00,$00,$00,$00,$00               ;00E299|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E29E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2A3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2A8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2AD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2B2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2B7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2BC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2C1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2C6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2CB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2D0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2D5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2DA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2DF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2E4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2E9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2EE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2F3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2F8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E2FD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E302|        |      ;
                       db $00,$00,$00,$00,$00               ;00E307|        |      ;
                       db $00,$00,$00,$00,$00               ;00E30C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E311|        |      ;
                       db $00,$00,$00,$00,$00               ;00E316|        |      ;
                       db $00,$00,$00,$00,$00               ;00E31B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E320|        |      ;
                       db $00,$00,$00,$00,$00               ;00E325|        |      ;
                       db $00,$00,$00,$00,$00               ;00E32A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E32F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E334|        |      ;
                       db $00,$00,$00,$00,$00               ;00E339|        |      ;
                       db $00,$00,$00,$00,$00               ;00E33E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E343|        |      ;
                       db $00,$00,$00,$00,$00               ;00E348|        |      ;
                       db $00,$00,$00,$00,$00               ;00E34D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E352|        |      ;
                       db $00,$00,$00,$00,$00               ;00E357|        |      ;
                       db $00,$00,$00,$00,$00               ;00E35C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E361|        |      ;
                       db $00,$00,$00,$00,$00               ;00E366|        |      ;
                       db $00,$00,$00,$00,$00               ;00E36B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E370|        |      ;
                       db $00,$00,$00,$00,$00               ;00E375|        |      ;
                       db $00,$00,$00,$00,$00               ;00E37A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E37F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E384|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E389|        |      ;
                       db $00,$00,$00,$00,$00               ;00E38E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E393|        |      ;
                       db $00,$00,$00,$00,$00               ;00E398|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E39D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3A2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3A7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3AC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3B1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3B6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3BB|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E3C0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3C5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3CA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3CF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3D4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3D9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3DE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3E3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3E8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3ED|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3F2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3F7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E3FC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E401|        |      ;
                       db $00,$00,$00,$00,$00               ;00E406|        |      ;
                       db $00,$00,$00,$00,$00               ;00E40B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E410|        |      ;
                       db $00,$00,$00,$00,$00               ;00E415|        |      ;
                       db $00,$00,$00,$00,$00               ;00E41A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E41F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E424|        |      ;
                       db $00,$00,$00,$00,$00               ;00E429|        |      ;
                       db $00,$00,$00,$00,$00               ;00E42E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E433|        |      ;
                       db $00,$00,$00,$00,$00               ;00E438|        |      ;
                       db $00,$00,$00,$00,$00               ;00E43D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E442|        |      ;
                       db $00,$00,$00,$00,$00               ;00E447|        |      ;
                       db $00,$00,$00,$00,$00               ;00E44C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E451|        |      ;
                       db $00,$00,$00,$00,$00               ;00E456|        |      ;
                       db $00,$00,$00,$00,$00               ;00E45B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E460|        |      ;
                       db $00,$00,$00,$00,$00               ;00E465|        |      ;
                       db $00,$00,$00,$00,$00               ;00E46A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E46F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E474|        |      ;
                       db $00,$00,$00,$00,$00               ;00E479|        |      ;
                       db $00,$00,$00,$00,$00               ;00E47E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E483|        |      ;
                       db $00,$00,$00,$00,$00               ;00E488|        |      ;
                       db $00,$00,$00,$00,$00               ;00E48D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E492|        |      ;
                       db $00,$00,$00,$00,$00               ;00E497|        |      ;
                       db $00,$00,$00,$00,$00               ;00E49C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4A1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4A6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4AB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4B0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4B5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4BA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4BF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4C4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4C9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4CE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4D3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4D8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4DD|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E4E2|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E4E7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4EC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E4F1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4F6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E4FB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E500|        |      ;
                       db $00,$00,$00,$00,$00               ;00E505|        |      ;
                       db $00,$00,$00,$00,$00               ;00E50A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E50F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E514|        |      ;
                       db $00,$00,$00,$00,$00               ;00E519|        |      ;
                       db $00,$00,$00,$00,$00               ;00E51E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E523|        |      ;
                       db $00,$00,$00,$00,$00               ;00E528|        |      ;
                       db $00,$00,$00,$00,$00               ;00E52D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E532|        |      ;
                       db $00,$00,$00,$00,$00               ;00E537|        |      ;
                       db $00,$00,$00,$00,$00               ;00E53C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E541|        |      ;
                       db $00,$00,$00,$00,$00               ;00E546|        |      ;
                       db $00,$00,$00,$00,$00               ;00E54B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E550|        |      ;
                       db $00,$00,$00,$00,$00               ;00E555|        |      ;
                       db $00,$00,$00,$00,$00               ;00E55A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E55F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E564|        |      ;
                       db $00,$00,$00,$00,$00               ;00E569|        |      ;
                       db $00,$00,$00,$00,$00               ;00E56E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E573|        |      ;
                       db $00,$00,$00,$00,$00               ;00E578|        |      ;
                       db $00,$00,$00,$00,$00               ;00E57D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E582|        |      ;
                       db $00,$00,$00,$00,$00               ;00E587|        |      ;
                       db $00,$00,$00,$00,$00               ;00E58C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E591|        |      ;
                       db $00,$00,$00,$00,$00               ;00E596|        |      ;
                       db $00,$00,$00,$00,$00               ;00E59B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5A0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5A5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5AA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5AF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5B4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5B9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5BE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5C3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5C8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5CD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5D2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5D7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5DC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5E1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5E6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5EB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5F0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5F5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5FA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E5FF|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E604|        |      ;
                       db $00,$00,$00,$00,$00               ;00E609|        |      ;
                       db $00,$00,$00,$00,$00               ;00E60E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E613|        |      ;
                       db $00,$00,$00,$00,$00               ;00E618|        |      ;
                       db $00,$00,$00,$00,$00               ;00E61D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E622|        |      ;
                       db $00,$00,$00,$00,$00               ;00E627|        |      ;
                       db $00,$00,$00,$00,$00               ;00E62C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E631|        |      ;
                       db $00,$00,$00,$00,$00               ;00E636|        |      ;
                       db $00,$00,$00,$00,$00               ;00E63B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E640|        |      ;
                       db $00,$00,$00,$00,$00               ;00E645|        |      ;
                       db $00,$00,$00,$00,$00               ;00E64A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E64F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E654|        |      ;
                       db $00,$00,$00,$00,$00               ;00E659|        |      ;
                       db $00,$00,$00,$00,$00               ;00E65E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E663|        |      ;
                       db $00,$00,$00,$00,$00               ;00E668|        |      ;
                       db $00,$00,$00,$00,$00               ;00E66D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E672|        |      ;
                       db $00,$00,$00,$00,$00               ;00E677|        |      ;
                       db $00,$00,$00,$00,$00               ;00E67C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E681|        |      ;
                       db $00,$00,$00,$00,$00               ;00E686|        |      ;
                       db $00,$00,$00,$00,$00               ;00E68B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E690|        |      ;
                       db $00,$00,$00,$00,$00               ;00E695|        |      ;
                       db $00,$00,$00,$00,$00               ;00E69A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E69F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6A4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6A9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6AE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6B3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6B8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6BD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6C2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6C7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6CC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6D1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6D6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6DB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6E0|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E6E5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6EA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6EF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6F4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6F9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E6FE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E703|        |      ;
                       db $00,$00,$00,$00,$00               ;00E708|        |      ;
                       db $00,$00,$00,$00,$00               ;00E70D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E712|        |      ;
                       db $00,$00,$00,$00,$00               ;00E717|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E71C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E721|        |      ;
                       db $00,$00,$00,$00,$00               ;00E726|        |      ;
                       db $00,$00,$00,$00,$00               ;00E72B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E730|        |      ;
                       db $00,$00,$00,$00,$00               ;00E735|        |      ;
                       db $00,$00,$00,$00,$00               ;00E73A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E73F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E744|        |      ;
                       db $00,$00,$00,$00,$00               ;00E749|        |      ;
                       db $00,$00,$00,$00,$00               ;00E74E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E753|        |      ;
                       db $00,$00,$00,$00,$00               ;00E758|        |      ;
                       db $00,$00,$00,$00,$00               ;00E75D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E762|        |      ;
                       db $00,$00,$00,$00,$00               ;00E767|        |      ;
                       db $00,$00,$00,$00,$00               ;00E76C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E771|        |      ;
                       db $00,$00,$00,$00,$00               ;00E776|        |      ;
                       db $00,$00,$00,$00,$00               ;00E77B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E780|        |      ;
                       db $00,$00,$00,$00,$00               ;00E785|        |      ;
                       db $00,$00,$00,$00,$00               ;00E78A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E78F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E794|        |      ;
                       db $00,$00,$00,$00,$00               ;00E799|        |      ;
                       db $00,$00,$00,$00,$00               ;00E79E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7A3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7A8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7AD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7B2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7B7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7BC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7C1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7C6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7CB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7D0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7D5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7DA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7DF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7E4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7E9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7EE|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E7F3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7F8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E7FD|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E802|        |      ;
                       db $00,$00,$00,$00,$00               ;00E807|        |      ;
                       db $00,$00,$00,$00,$00               ;00E80C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E811|        |      ;
                       db $00,$00,$00,$00,$00               ;00E816|        |      ;
                       db $00,$00,$00,$00,$00               ;00E81B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E820|        |      ;
                       db $00,$00,$00,$00,$00               ;00E825|        |      ;
                       db $00,$00,$00,$00,$00               ;00E82A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E82F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E834|        |      ;
                       db $00,$00,$00,$00,$00               ;00E839|        |      ;
                       db $00,$00,$00,$00,$00               ;00E83E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E843|        |      ;
                       db $00,$00,$00,$00,$00               ;00E848|        |      ;
                       db $00,$00,$00,$00,$00               ;00E84D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E852|        |      ;
                       db $00,$00,$00,$00,$00               ;00E857|        |      ;
                       db $00,$00,$00,$00,$00               ;00E85C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E861|        |      ;
                       db $00,$00,$00,$00,$00               ;00E866|        |      ;
                       db $00,$00,$00,$00,$00               ;00E86B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E870|        |      ;
                       db $00,$00,$00,$00,$00               ;00E875|        |      ;
                       db $00,$00,$00,$00,$00               ;00E87A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E87F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E884|        |      ;
                       db $00,$00,$00,$00,$00               ;00E889|        |      ;
                       db $00,$00,$00,$00,$00               ;00E88E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E893|        |      ;
                       db $00,$00,$00,$00,$00               ;00E898|        |      ;
                       db $00,$00,$00,$00,$00               ;00E89D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8A2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8A7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8AC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8B1|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E8B6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8BB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8C0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8C5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8CA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8CF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8D4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8D9|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E8DE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8E3|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E8E8|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00E8ED|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8F2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8F7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E8FC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E901|        |      ;
                       db $00,$00,$00,$00,$00               ;00E906|        |      ;
                       db $00,$00,$00,$00,$00               ;00E90B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E910|        |      ;
                       db $00,$00,$00,$00,$00               ;00E915|        |      ;
                       db $00,$00,$00,$00,$00               ;00E91A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E91F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E924|        |      ;
                       db $00,$00,$00,$00,$00               ;00E929|        |      ;
                       db $00,$00,$00,$00,$00               ;00E92E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E933|        |      ;
                       db $00,$00,$00,$00,$00               ;00E938|        |      ;
                       db $00,$00,$00,$00,$00               ;00E93D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E942|        |      ;
                       db $00,$00,$00,$00,$00               ;00E947|        |      ;
                       db $00,$00,$00,$00,$00               ;00E94C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E951|        |      ;
                       db $00,$00,$00,$00,$00               ;00E956|        |      ;
                       db $00,$00,$00,$00,$00               ;00E95B|        |      ;
                       db $00,$00,$00,$00,$00               ;00E960|        |      ;
                       db $00,$00,$00,$00,$00               ;00E965|        |      ;
                       db $00,$00,$00,$00,$00               ;00E96A|        |      ;
                       db $00,$00,$00,$00,$00               ;00E96F|        |      ;
                       db $00,$00,$00,$00,$00               ;00E974|        |      ;
                       db $00,$00,$00,$00,$00               ;00E979|        |      ;
                       db $00,$00,$00,$00,$00               ;00E97E|        |      ;
                       db $00,$00,$00,$00,$00               ;00E983|        |      ;
                       db $00,$00,$00,$00,$00               ;00E988|        |      ;
                       db $00,$00,$00,$00,$00               ;00E98D|        |      ;
                       db $00,$00,$00,$00,$00               ;00E992|        |      ;
                       db $00,$00,$00,$00,$00               ;00E997|        |      ;
                       db $00,$00,$00,$00,$00               ;00E99C|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9A1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9A6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9AB|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9B0|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9B5|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9BA|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9BF|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9C4|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9C9|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9CE|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9D3|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9D8|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9DD|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9E2|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9E7|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9EC|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9F1|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9F6|        |      ;
                       db $00,$00,$00,$00,$00               ;00E9FB|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA00|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA05|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA0A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA0F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA14|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA19|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA1E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA23|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA28|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA2D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA32|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA37|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA3C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA41|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA46|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA4B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA50|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA55|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA5A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA5F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA64|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA69|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA6E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA73|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA78|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA7D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA82|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA87|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA8C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA91|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA96|        |      ;
                       db $00,$00,$00,$00,$00               ;00EA9B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAA0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAA5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAAA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAAF|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAB4|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAB9|        |      ;
                       db $00,$00,$00,$00,$00               ;00EABE|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAC3|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAC8|        |      ;
                       db $00,$00,$00,$00,$00               ;00EACD|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAD2|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAD7|        |      ;
                       db $00,$00,$00,$00,$00               ;00EADC|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAE1|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAE6|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAEB|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAF0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAF5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAFA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EAFF|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB04|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB09|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB0E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB13|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB18|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB1D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB22|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB27|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB2C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB31|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB36|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB3B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB40|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB45|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB4A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB4F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB54|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB59|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB5E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB63|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB68|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB6D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB72|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB77|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB7C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB81|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB86|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB8B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB90|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB95|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB9A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EB9F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBA4|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBA9|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBAE|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBB3|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBB8|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBBD|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBC2|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBC7|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBCC|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBD1|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBD6|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBDB|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00EBE0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBE5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBEA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBEF|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBF4|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBF9|        |      ;
                       db $00,$00,$00,$00,$00               ;00EBFE|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC03|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC08|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC0D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC12|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC17|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC1C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC21|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC26|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC2B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC30|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC35|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC3A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC3F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC44|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC49|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC4E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC53|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC58|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC5D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC62|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC67|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC6C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC71|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC76|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC7B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC80|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC85|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC8A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC8F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC94|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC99|        |      ;
                       db $00,$00,$00,$00,$00               ;00EC9E|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECA3|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECA8|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECAD|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECB2|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECB7|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECBC|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECC1|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECC6|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECCB|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECD0|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECD5|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECDA|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECDF|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECE4|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECE9|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECEE|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECF3|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECF8|        |      ;
                       db $00,$00,$00,$00,$00               ;00ECFD|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED02|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED07|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED0C|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED11|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED16|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED1B|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED20|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED25|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED2A|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED2F|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED34|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED39|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED3E|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED43|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED48|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED4D|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED52|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED57|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED5C|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED61|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED66|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED6B|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED70|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED75|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED7A|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED7F|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED84|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED89|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED8E|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED93|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00ED98|        |      ;
                       db $00,$00,$00,$00,$00               ;00ED9D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDA2|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDA7|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDAC|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDB1|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDB6|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDBB|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDC0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDC5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDCA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDCF|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDD4|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDD9|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDDE|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDE3|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDE8|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDED|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDF2|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDF7|        |      ;
                       db $00,$00,$00,$00,$00               ;00EDFC|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE01|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE06|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE0B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE10|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE15|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE1A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE1F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE24|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE29|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE2E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE33|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE38|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE3D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE42|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE47|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE4C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE51|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE56|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE5B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE60|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE65|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE6A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE6F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE74|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE79|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE7E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE83|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE88|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE8D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE92|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE97|        |      ;
                       db $00,$00,$00,$00,$00               ;00EE9C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEA1|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEA6|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEAB|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEB0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEB5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEBA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEBF|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEC4|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEC9|        |      ;
                       db $00,$00,$00,$00,$00               ;00EECE|        |      ;
                       db $00,$00,$00,$00,$00               ;00EED3|        |      ;
                       db $00,$00,$00,$00,$00               ;00EED8|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEDD|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00EEE2|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00EEE7|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEEC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00EEF1|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEF6|        |      ;
                       db $00,$00,$00,$00,$00               ;00EEFB|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00EF00|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF05|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF0A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF0F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF14|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF19|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF1E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF23|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF28|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF2D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF32|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF37|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF3C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF41|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF46|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF4B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF50|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF55|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF5A|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF5F|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF64|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF69|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF6E|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF73|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF78|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF7D|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF82|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF87|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF8C|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF91|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF96|        |      ;
                       db $00,$00,$00,$00,$00               ;00EF9B|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFA0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFA5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFAA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFAF|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00EFB4|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFB9|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFBE|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFC3|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFC8|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFCD|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFD2|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFD7|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFDC|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFE1|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFE6|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFEB|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFF0|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFF5|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFFA|        |      ;
                       db $00,$00,$00,$00,$00               ;00EFFF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F004|        |      ;
                       db $00,$00,$00,$00,$00               ;00F009|        |      ;
                       db $00,$00,$00,$00,$00               ;00F00E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F013|        |      ;
                       db $00,$00,$00,$00,$00               ;00F018|        |      ;
                       db $00,$00,$00,$00,$00               ;00F01D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F022|        |      ;
                       db $00,$00,$00,$00,$00               ;00F027|        |      ;
                       db $00,$00,$00,$00,$00               ;00F02C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F031|        |      ;
                       db $00,$00,$00,$00,$00               ;00F036|        |      ;
                       db $00,$00,$00,$00,$00               ;00F03B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F040|        |      ;
                       db $00,$00,$00,$00,$00               ;00F045|        |      ;
                       db $00,$00,$00,$00,$00               ;00F04A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F04F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F054|        |      ;
                       db $00,$00,$00,$00,$00               ;00F059|        |      ;
                       db $00,$00,$00,$00,$00               ;00F05E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F063|        |      ;
                       db $00,$00,$00,$00,$00               ;00F068|        |      ;
                       db $00,$00,$00,$00,$00               ;00F06D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F072|        |      ;
                       db $00,$00,$00,$00,$00               ;00F077|        |      ;
                       db $00,$00,$00,$00,$00               ;00F07C|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F081|        |      ;
                       db $00,$00,$00,$00,$00               ;00F086|        |      ;
                       db $00,$00,$00,$00,$00               ;00F08B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F090|        |      ;
                       db $00,$00,$00,$00,$00               ;00F095|        |      ;
                       db $00,$00,$00,$00,$00               ;00F09A|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F09F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0A4|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F0A9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0AE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0B3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0B8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0BD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0C2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0C7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0CC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0D1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0D6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0DB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0E0|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F0E5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0EA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0EF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0F4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0F9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F0FE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F103|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F108|        |      ;
                       db $00,$00,$00,$00,$00               ;00F10D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F112|        |      ;
                       db $00,$00,$00,$00,$00               ;00F117|        |      ;
                       db $00,$00,$00,$00,$00               ;00F11C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F121|        |      ;
                       db $00,$00,$00,$00,$00               ;00F126|        |      ;
                       db $00,$00,$00,$00,$00               ;00F12B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F130|        |      ;
                       db $00,$00,$00,$00,$00               ;00F135|        |      ;
                       db $00,$00,$00,$00,$00               ;00F13A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F13F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F144|        |      ;
                       db $00,$00,$00,$00,$00               ;00F149|        |      ;
                       db $00,$00,$00,$00,$00               ;00F14E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F153|        |      ;
                       db $00,$00,$00,$00,$00               ;00F158|        |      ;
                       db $00,$00,$00,$00,$00               ;00F15D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F162|        |      ;
                       db $00,$00,$00,$00,$00               ;00F167|        |      ;
                       db $00,$00,$00,$00,$00               ;00F16C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F171|        |      ;
                       db $00,$00,$00,$00,$00               ;00F176|        |      ;
                       db $00,$00,$00,$00,$00               ;00F17B|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F180|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F185|        |      ;
                       db $00,$00,$00,$00,$00               ;00F18A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F18F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F194|        |      ;
                       db $00,$00,$00,$00,$00               ;00F199|        |      ;
                       db $00,$00,$00,$00,$00               ;00F19E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1A3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1A8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1AD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1B2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1B7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1BC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1C1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1C6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1CB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1D0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1D5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1DA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1DF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1E4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1E9|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F1EE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1F3|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F1F8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F1FD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F202|        |      ;
                       db $00,$00,$00,$00,$00               ;00F207|        |      ;
                       db $00,$00,$00,$00,$00               ;00F20C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F211|        |      ;
                       db $00,$00,$00,$00,$00               ;00F216|        |      ;
                       db $00,$00,$00,$00,$00               ;00F21B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F220|        |      ;
                       db $00,$00,$00,$00,$00               ;00F225|        |      ;
                       db $00,$00,$00,$00,$00               ;00F22A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F22F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F234|        |      ;
                       db $00,$00,$00,$00,$00               ;00F239|        |      ;
                       db $00,$00,$00,$00,$00               ;00F23E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F243|        |      ;
                       db $00,$00,$00,$00,$00               ;00F248|        |      ;
                       db $00,$00,$00,$00,$00               ;00F24D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F252|        |      ;
                       db $00,$00,$00,$00,$00               ;00F257|        |      ;
                       db $00,$00,$00,$00,$00               ;00F25C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F261|        |      ;
                       db $00,$00,$00,$00,$00               ;00F266|        |      ;
                       db $00,$00,$00,$00,$00               ;00F26B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F270|        |      ;
                       db $00,$00,$00,$00,$00               ;00F275|        |      ;
                       db $00,$00,$00,$00,$00               ;00F27A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F27F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F284|        |      ;
                       db $00,$00,$00,$00,$00               ;00F289|        |      ;
                       db $00,$00,$00,$00,$00               ;00F28E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F293|        |      ;
                       db $00,$00,$00,$00,$00               ;00F298|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F29D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2A2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2A7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2AC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2B1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2B6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2BB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2C0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2C5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2CA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2CF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2D4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2D9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2DE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2E3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2E8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2ED|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2F2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2F7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F2FC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F301|        |      ;
                       db $00,$00,$00,$00,$00               ;00F306|        |      ;
                       db $00,$00,$00,$00,$00               ;00F30B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F310|        |      ;
                       db $00,$00,$00,$00,$00               ;00F315|        |      ;
                       db $00,$00,$00,$00,$00               ;00F31A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F31F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F324|        |      ;
                       db $00,$00,$00,$00,$00               ;00F329|        |      ;
                       db $00,$00,$00,$00,$00               ;00F32E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F333|        |      ;
                       db $00,$00,$00,$00,$00               ;00F338|        |      ;
                       db $00,$00,$00,$00,$00               ;00F33D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F342|        |      ;
                       db $00,$00,$00,$00,$00               ;00F347|        |      ;
                       db $00,$00,$00,$00,$00               ;00F34C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F351|        |      ;
                       db $00,$00,$00,$00,$00               ;00F356|        |      ;
                       db $00,$00,$00,$00,$00               ;00F35B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F360|        |      ;
                       db $00,$00,$00,$00,$00               ;00F365|        |      ;
                       db $00,$00,$00,$00,$00               ;00F36A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F36F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F374|        |      ;
                       db $00,$00,$00,$00,$00               ;00F379|        |      ;
                       db $00,$00,$00,$00,$00               ;00F37E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F383|        |      ;
                       db $00,$00,$00,$00,$00               ;00F388|        |      ;
                       db $00,$00,$00,$00,$00               ;00F38D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F392|        |      ;
                       db $00,$00,$00,$00,$00               ;00F397|        |      ;
                       db $00,$00,$00,$00,$00               ;00F39C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3A1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3A6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3AB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3B0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3B5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3BA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3BF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3C4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3C9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3CE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3D3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3D8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3DD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3E2|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F3E7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3EC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3F1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3F6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F3FB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F400|        |      ;
                       db $00,$00,$00,$00,$00               ;00F405|        |      ;
                       db $00,$00,$00,$00,$00               ;00F40A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F40F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F414|        |      ;
                       db $00,$00,$00,$00,$00               ;00F419|        |      ;
                       db $00,$00,$00,$00,$00               ;00F41E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F423|        |      ;
                       db $00,$00,$00,$00,$00               ;00F428|        |      ;
                       db $00,$00,$00,$00,$00               ;00F42D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F432|        |      ;
                       db $00,$00,$00,$00,$00               ;00F437|        |      ;
                       db $00,$00,$00,$00,$00               ;00F43C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F441|        |      ;
                       db $00,$00,$00,$00,$00               ;00F446|        |      ;
                       db $00,$00,$00,$00,$00               ;00F44B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F450|        |      ;
                       db $00,$00,$00,$00,$00               ;00F455|        |      ;
                       db $00,$00,$00,$00,$00               ;00F45A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F45F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F464|        |      ;
                       db $00,$00,$00,$00,$00               ;00F469|        |      ;
                       db $00,$00,$00,$00,$00               ;00F46E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F473|        |      ;
                       db $00,$00,$00,$00,$00               ;00F478|        |      ;
                       db $00,$00,$00,$00,$00               ;00F47D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F482|        |      ;
                       db $00,$00,$00,$00,$00               ;00F487|        |      ;
                       db $00,$00,$00,$00,$00               ;00F48C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F491|        |      ;
                       db $00,$00,$00,$00,$00               ;00F496|        |      ;
                       db $00,$00,$00,$00,$00               ;00F49B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4A0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4A5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4AA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4AF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4B4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4B9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4BE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4C3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4C8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4CD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4D2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4D7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4DC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F4E1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4E6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4EB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4F0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4F5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4FA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F4FF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F504|        |      ;
                       db $00,$00,$00,$00,$00               ;00F509|        |      ;
                       db $00,$00,$00,$00,$00               ;00F50E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F513|        |      ;
                       db $00,$00,$00,$00,$00               ;00F518|        |      ;
                       db $00,$00,$00,$00,$00               ;00F51D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F522|        |      ;
                       db $00,$00,$00,$00,$00               ;00F527|        |      ;
                       db $00,$00,$00,$00,$00               ;00F52C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F531|        |      ;
                       db $00,$00,$00,$00,$00               ;00F536|        |      ;
                       db $00,$00,$00,$00,$00               ;00F53B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F540|        |      ;
                       db $00,$00,$00,$00,$00               ;00F545|        |      ;
                       db $00,$00,$00,$00,$00               ;00F54A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F54F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F554|        |      ;
                       db $00,$00,$00,$00,$00               ;00F559|        |      ;
                       db $00,$00,$00,$00,$00               ;00F55E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F563|        |      ;
                       db $00,$00,$00,$00,$00               ;00F568|        |      ;
                       db $00,$00,$00,$00,$00               ;00F56D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F572|        |      ;
                       db $00,$00,$00,$00,$00               ;00F577|        |      ;
                       db $00,$00,$00,$00,$00               ;00F57C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F581|        |      ;
                       db $00,$00,$00,$00,$00               ;00F586|        |      ;
                       db $00,$00,$00,$00,$00               ;00F58B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F590|        |      ;
                       db $00,$00,$00,$00,$00               ;00F595|        |      ;
                       db $00,$00,$00,$00,$00               ;00F59A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F59F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5A4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5A9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5AE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5B3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5B8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5BD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5C2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5C7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5CC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5D1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5D6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5DB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5E0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5E5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5EA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5EF|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F5F4|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F5F9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F5FE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F603|        |      ;
                       db $00,$00,$00,$00,$00               ;00F608|        |      ;
                       db $00,$00,$00,$00,$00               ;00F60D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F612|        |      ;
                       db $00,$00,$00,$00,$00               ;00F617|        |      ;
                       db $00,$00,$00,$00,$00               ;00F61C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F621|        |      ;
                       db $00,$00,$00,$00,$00               ;00F626|        |      ;
                       db $00,$00,$00,$00,$00               ;00F62B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F630|        |      ;
                       db $00,$00,$00,$00,$00               ;00F635|        |      ;
                       db $00,$00,$00,$00,$00               ;00F63A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F63F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F644|        |      ;
                       db $00,$00,$00,$00,$00               ;00F649|        |      ;
                       db $00,$00,$00,$00,$00               ;00F64E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F653|        |      ;
                       db $00,$00,$00,$00,$00               ;00F658|        |      ;
                       db $00,$00,$00,$00,$00               ;00F65D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F662|        |      ;
                       db $00,$00,$00,$00,$00               ;00F667|        |      ;
                       db $00,$00,$00,$00,$00               ;00F66C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F671|        |      ;
                       db $00,$00,$00,$00,$00               ;00F676|        |      ;
                       db $00,$00,$00,$00,$00               ;00F67B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F680|        |      ;
                       db $00,$00,$00,$00,$00               ;00F685|        |      ;
                       db $00,$00,$00,$00,$00               ;00F68A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F68F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F694|        |      ;
                       db $00,$00,$00,$00,$00               ;00F699|        |      ;
                       db $00,$00,$00,$00,$00               ;00F69E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6A3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6A8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6AD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6B2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6B7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6BC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6C1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6C6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6CB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6D0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6D5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6DA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6DF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6E4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6E9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6EE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6F3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6F8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F6FD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F702|        |      ;
                       db $00,$00,$00,$00,$00               ;00F707|        |      ;
                       db $00,$00,$00,$00,$00               ;00F70C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F711|        |      ;
                       db $00,$00,$00,$00,$00               ;00F716|        |      ;
                       db $00,$00,$00,$00,$00               ;00F71B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F720|        |      ;
                       db $00,$00,$00,$00,$00               ;00F725|        |      ;
                       db $00,$00,$00,$00,$00               ;00F72A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F72F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F734|        |      ;
                       db $00,$00,$00,$00,$00               ;00F739|        |      ;
                       db $00,$00,$00,$00,$00               ;00F73E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F743|        |      ;
                       db $00,$00,$00,$00,$00               ;00F748|        |      ;
                       db $00,$00,$00,$00,$00               ;00F74D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F752|        |      ;
                       db $00,$00,$00,$00,$00               ;00F757|        |      ;
                       db $00,$00,$00,$00,$00               ;00F75C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F761|        |      ;
                       db $00,$00,$00,$00,$00               ;00F766|        |      ;
                       db $00,$00,$00,$00,$00               ;00F76B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F770|        |      ;
                       db $00,$00,$00,$00,$00               ;00F775|        |      ;
                       db $00,$00,$00,$00,$00               ;00F77A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F77F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F784|        |      ;
                       db $00,$00,$00,$00,$00               ;00F789|        |      ;
                       db $00,$00,$00,$00,$00               ;00F78E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F793|        |      ;
                       db $00,$00,$00,$00,$00               ;00F798|        |      ;
                       db $00,$00,$00,$00,$00               ;00F79D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7A2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7A7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7AC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7B1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7B6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7BB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7C0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7C5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7CA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7CF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7D4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7D9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7DE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7E3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7E8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7ED|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7F2|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F7F7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F7FC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F801|        |      ;
                       db $00,$00,$00,$00,$00               ;00F806|        |      ;
                       db $00,$00,$00,$00,$00               ;00F80B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F810|        |      ;
                       db $00,$00,$00,$00,$00               ;00F815|        |      ;
                       db $00,$00,$00,$00,$00               ;00F81A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F81F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F824|        |      ;
                       db $00,$00,$00,$00,$00               ;00F829|        |      ;
                       db $00,$00,$00,$00,$00               ;00F82E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F833|        |      ;
                       db $00,$00,$00,$00,$00               ;00F838|        |      ;
                       db $00,$00,$00,$00,$00               ;00F83D|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F842|        |      ;
                       db $00,$00,$00,$00,$00               ;00F847|        |      ;
                       db $00,$00,$00,$00,$00               ;00F84C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F851|        |      ;
                       db $00,$00,$00,$00,$00               ;00F856|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F85B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F860|        |      ;
                       db $00,$00,$00,$00,$00               ;00F865|        |      ;
                       db $00,$00,$00,$00,$00               ;00F86A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F86F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F874|        |      ;
                       db $00,$00,$00,$00,$00               ;00F879|        |      ;
                       db $00,$00,$00,$00,$00               ;00F87E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F883|        |      ;
                       db $00,$00,$00,$00,$00               ;00F888|        |      ;
                       db $00,$00,$00,$00,$00               ;00F88D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F892|        |      ;
                       db $00,$00,$00,$00,$00               ;00F897|        |      ;
                       db $00,$00,$00,$00,$00               ;00F89C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8A1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8A6|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F8AB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8B0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8B5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8BA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8BF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8C4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8C9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8CE|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8D3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8D8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8DD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8E2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8E7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8EC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F8F1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8F6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F8FB|        |      ;
                       db $00,$00,$00,$00,$00               ;00F900|        |      ;
                       db $00,$00,$00,$00,$00               ;00F905|        |      ;
                       db $00,$00,$00,$00,$00               ;00F90A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F90F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F914|        |      ;
                       db $00,$00,$00,$00,$00               ;00F919|        |      ;
                       db $00,$00,$00,$00,$00               ;00F91E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F923|        |      ;
                       db $00,$00,$00,$00,$00               ;00F928|        |      ;
                       db $00,$00,$00,$00,$00               ;00F92D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F932|        |      ;
                       db $00,$00,$00,$00,$00               ;00F937|        |      ;
                       db $00,$00,$00,$00,$00               ;00F93C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F941|        |      ;
                       db $00,$00,$00,$00,$00               ;00F946|        |      ;
                       db $00,$00,$00,$00,$00               ;00F94B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F950|        |      ;
                       db $00,$00,$00,$00,$00               ;00F955|        |      ;
                       db $00,$00,$00,$00,$00               ;00F95A|        |      ;
                       db $00,$00,$00,$00,$00               ;00F95F|        |      ;
                       db $00,$00,$00,$00,$00               ;00F964|        |      ;
                       db $00,$00,$00,$00,$00               ;00F969|        |      ;
                       db $00,$00,$00,$00,$00               ;00F96E|        |      ;
                       db $00,$00,$00,$00,$00               ;00F973|        |      ;
                       db $00,$00,$00,$00,$00               ;00F978|        |      ;
                       db $00,$00,$00,$00,$00               ;00F97D|        |      ;
                       db $00,$00,$00,$00,$00               ;00F982|        |      ;
                       db $00,$00,$00,$00,$00               ;00F987|        |      ;
                       db $00,$00,$00,$00,$00               ;00F98C|        |      ;
                       db $00,$00,$00,$00,$00               ;00F991|        |      ;
                       db $00,$00,$00,$00,$00               ;00F996|        |      ;
                       db $00,$00,$00,$00,$00               ;00F99B|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9A0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9A5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9AA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9AF|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9B4|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9B9|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9BE|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F9C3|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9C8|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9CD|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9D2|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9D7|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9DC|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9E1|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9E6|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9EB|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00F9F0|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9F5|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9FA|        |      ;
                       db $00,$00,$00,$00,$00               ;00F9FF|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA04|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA09|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA0E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA13|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA18|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA1D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA22|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA27|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA2C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA31|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA36|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA3B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA40|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA45|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA4A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA4F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA54|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA59|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA5E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA63|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA68|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA6D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA72|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA77|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA7C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA81|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA86|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA8B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA90|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FA95|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA9A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FA9F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAA4|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAA9|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAAE|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAB3|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAB8|        |      ;
                       db $00,$00,$00,$00,$00               ;00FABD|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAC2|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAC7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FACC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAD1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAD6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FADB|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAE0|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAE5|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAEA|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAEF|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAF4|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FAF9|        |      ;
                       db $00,$00,$00,$00,$00               ;00FAFE|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FB03|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB08|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB0D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB12|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB17|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB1C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB21|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB26|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB2B|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FB30|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB35|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB3A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB3F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB44|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB49|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB4E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB53|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB58|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB5D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB62|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB67|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB6C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB71|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB76|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB7B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB80|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB85|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB8A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB8F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB94|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB99|        |      ;
                       db $00,$00,$00,$00,$00               ;00FB9E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBA3|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBA8|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBAD|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBB2|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBB7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBBC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBC1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBC6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBCB|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBD0|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBD5|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBDA|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBDF|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBE4|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBE9|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBEE|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBF3|        |      ;
                       db $00,$00,$00,$00,$00               ;00FBF8|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FBFD|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FC02|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC07|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC0C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC11|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC16|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC1B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC20|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC25|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC2A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC2F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC34|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC39|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC3E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC43|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC48|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC4D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC52|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC57|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC5C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC61|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC66|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC6B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC70|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC75|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC7A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC7F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC84|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC89|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC8E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC93|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC98|        |      ;
                       db $00,$00,$00,$00,$00               ;00FC9D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCA2|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCA7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCAC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCB1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCB6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCBB|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCC0|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCC5|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCCA|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCCF|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCD4|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCD9|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCDE|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCE3|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCE8|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCED|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCF2|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCF7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FCFC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD01|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD06|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD0B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD10|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD15|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD1A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD1F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD24|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD29|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD2E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD33|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD38|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD3D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD42|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD47|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FD4C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD51|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD56|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD5B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD60|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD65|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD6A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD6F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD74|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD79|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD7E|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FD83|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD88|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD8D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD92|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD97|        |      ;
                       db $00,$00,$00,$00,$00               ;00FD9C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDA1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDA6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDAB|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDB0|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDB5|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDBA|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDBF|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDC4|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDC9|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDCE|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDD3|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDD8|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDDD|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDE2|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FDE7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDEC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDF1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDF6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FDFB|        |      ;
 
                       db $00,$00,$00,$00,$00               ;00FE00|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE05|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE0A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE0F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE14|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE19|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE1E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE23|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE28|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE2D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE32|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE37|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE3C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE41|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE46|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE4B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE50|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE55|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE5A|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE5F|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE64|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE69|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE6E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE73|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE78|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE7D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE82|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE87|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE8C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE91|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE96|        |      ;
                       db $00,$00,$00,$00,$00               ;00FE9B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEA0|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEA5|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEAA|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEAF|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEB4|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEB9|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEBE|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEC3|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEC8|        |      ;
                       db $00,$00,$00,$00,$00               ;00FECD|        |      ;
                       db $00,$00,$00,$00,$00               ;00FED2|        |      ;
                       db $00,$00,$00,$00,$00               ;00FED7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEDC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEE1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEE6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEEB|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEF0|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEF5|        |      ;
                       db $00,$00,$00,$00,$00               ;00FEFA|        |      ;
                       db $00                               ;00FEFF|        |      ;
 
          CODE_00FF00: SEC                                  ;00FF00|38      |      ;
 
                       XCE                                  ;00FF01|FB      |      ;
 
                       SEP #$30                             ;00FF02|E230    |      ;
                       JML.L resetVector                    ;00FF04|5C0BE00F|0FE00B;
 
 
                       db $00,$00,$00,$00,$00               ;00FF08|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF0D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF12|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF17|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF1C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF21|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF26|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF2B|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF30|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF35|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF3A|        |      ;
                       db $00                               ;00FF3F|        |      ;
 
          CODE_00FF40: JML.L IRQVectorStart                 ;00FF40|5C1AE10F|0FE11A;
 
                       db $00,$00,$00,$00,$00               ;00FF44|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF49|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF4E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF53|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF58|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF5D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF62|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF67|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF6C|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF71|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF76|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF7B|        |      ;
 
          CODE_00FF80: JML.L NMIVectorStart                 ;00FF80|5C53E00F|0FE053;
 
                       db $00,$00,$00,$00,$00               ;00FF84|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF89|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF8E|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF93|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF98|        |      ;
                       db $00,$00,$00,$00,$00               ;00FF9D|        |      ;
                       db $00,$00,$00,$00,$00               ;00FFA2|        |      ;
                       db $00,$00,$00,$00,$00               ;00FFA7|        |      ;
                       db $00,$00,$00,$00,$00               ;00FFAC|        |      ;
                       db $00,$00,$00,$00,$00               ;00FFB1|        |      ;
                       db $00,$00,$00,$00,$00               ;00FFB6|        |      ;
                       db $00,$00,$00,$00,$00               ;00FFBB|        |      ;
 
                       db "SUPER CASTLEVANIA 3  "           ;00FFC0|        |      ;
                       db " "                               ;00FFD5|        |      ;
                       db $00,$09,$00,$01,$A4               ;00FFD6|        |      ;
                       db $00,$75,$8A                       ;00FFDB|        |      ;
                       dw $758A,$FFFF,$FFFF                 ;00FFDE|        |      ;
 
           Native_COP: dw CODE_00FF40                       ;00FFE4|        |00FF40;
 
 
           Native_BRK: dw CODE_00FF40                       ;00FFE6|        |00FF40;
                       dw CODE_00FF40                       ;00FFE8|        |00FF40;
 
           Native_NMI: dw CODE_00FF80                       ;00FFEA|        |00FF80;
 
                       dw CODE_00FF00                       ;00FFEC|        |00FF00;
                       dw CODE_00FF40                       ;00FFEE|        |00FF40;
                       dw PTR16_00FFFF                      ;00FFF0|        |00FFFF;
                       dw PTR16_00FFFF                      ;00FFF2|        |00FFFF;
 
           Native_IRQ: dw CODE_00FF40                       ;00FFF4|        |00FF40;
 
                       dw CODE_00FF40                       ;00FFF6|        |00FF40;
                       dw CODE_00FF40                       ;00FFF8|        |00FF40;
                       dw CODE_00FF80                       ;00FFFA|        |00FF80;
 
                       dw CODE_00FF00                       ;00FFFC|        |00FF00;
 
      Emulation_RESET: dw CODE_00FF40                       ;00FFFE|        |00FF40;
 
