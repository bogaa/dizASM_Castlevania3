 
 
 
              bank_80: db $80                               ;008000|        |      ; NES PRG 0000
 
 
    loadPlayerCHRBank: LDY.W r_entity_ObjectIdxes           ;008001|AC4E05  |00054E;
                       LDA.W playerCHRBankdata,Y            ;008004|B90F80  |00800F;
                       STA.B r_CHR_BankSpr_0000             ;008007|8546    |000046;
                       CLC                                  ;008009|18      |      ;
                       ADC.B #$01                           ;00800A|6901    |      ;
 
                       STA.B r_CHR_BankSpr_0400             ;00800C|8547    |000047;
                       RTS                                  ;00800E|60      |      ;
 
 
    playerCHRBankdata: db $00,$04,$02,$06                   ;00800F|        |      ;
 
 getCurrRoomsChrBanks: LDA.B r_stage                        ;008013|A532    |000032;
                       ASL A                                ;008015|0A      |      ;
                       TAY                                  ;008016|A8      |      ;
                       LDA.W roomCHRbanks,Y                 ;008017|B96680  |008066;
                       STA.B r_pointerQueue                 ;00801A|8508    |000008;
                       LDA.W PTR16_008067,Y                 ;00801C|B96780  |008067;
                       STA.B $09                            ;00801F|8509    |000009;
                       LDA.B r_blockLevel                   ;008021|A533    |000033;
                       ASL A                                ;008023|0A      |      ;
                       ASL A                                ;008024|0A      |      ;
                       STA.B r_roomSectionChrBanksDataOffset;008025|850F    |00000F;
                       TAY                                  ;008027|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;008028|B108    |000008;
                       STA.B r_temp_Xpos                    ;00802A|850A    |00000A;
                       INY                                  ;00802C|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00802D|B108    |000008;
                       STA.B $0B                            ;00802F|850B    |00000B;
                       LDA.B r_roomIdx                      ;008031|A534    |000034;
                       ASL A                                ;008033|0A      |      ;
                       CLC                                  ;008034|18      |      ;
                       ADC.B r_roomIdx                      ;008035|6534    |000034;
                       TAY                                  ;008037|A8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;008038|B10A    |00000A;
                       STA.B r_CHR_BankBG_0400              ;00803A|854B    |00004B;
                       INY                                  ;00803C|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;00803D|B10A    |00000A;
                       STA.B r_CHR_BankBG_0800              ;00803F|854C    |00004C;
                       INY                                  ;008041|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;008042|B10A    |00000A;
                       STA.B r_CHR_BankSecondQuest_1400     ;008044|854E    |00004E;
                       LDY.B r_roomSectionChrBanksDataOffset;008046|A40F    |00000F;
                       INY                                  ;008048|C8      |      ;
                       INY                                  ;008049|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00804A|B108    |000008;
                       STA.B r_temp_Xpos                    ;00804C|850A    |00000A;
                       INY                                  ;00804E|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00804F|B108    |000008;
                       STA.B $0B                            ;008051|850B    |00000B;
                       LDA.B r_roomIdx                      ;008053|A534    |000034;
 
                       ASL A                                ;008055|0A      |      ;
                       TAY                                  ;008056|A8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;008057|B10A    |00000A;
                       STA.B r_CHR_BankSpr_0800             ;008059|8548    |000048;
                       INY                                  ;00805B|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;00805C|B10A    |00000A;
                       STA.B r_CHR_BankSpr_0c00             ;00805E|8549    |000049;
                       db $20                               ;008060|        |      ;
                       dw CODE_0FE33C                       ;008061|        |0FE33C;
                       db $4C                               ;008063|        |      ;
 
                       dw CODE_0FE35D                       ;008064|        |0FE35D;
 
         roomCHRbanks: dw chrStage_00                       ;008066|        |008084;
                       dw chrStage_01                       ;008068|        |008094;
                       dw chrStage_02                       ;00806A|        |0080AC;
                       dw chrStage_03                       ;00806C|        |0080C0;
                       dw chrStage_04                       ;00806E|        |0080D4;
                       dw chrStage_05                       ;008070|        |0080E0;
                       dw chrStage_06                       ;008072|        |0080F0;
                       dw chrStage_07                       ;008074|        |0080FC;
 
                       dw chrStage_08                       ;008076|        |008118;
 
                       dw chrStage_09                       ;008078|        |00812C;
                       dw chrStage_0a                       ;00807A|        |008134;
                       dw chrStage_0b                       ;00807C|        |008150;
                       dw chrStage_0c                       ;00807E|        |00815C;
 
                       dw chrStage_0d                       ;008080|        |008168;
                       dw chrStage_0e                       ;008082|        |008178;
 
          chrStage_00: dw stage0_BG_00                      ;008084|        |008184;
                       dw stage0_SP_00                      ;008086|        |0082E0;
                       dw stage0_BG_01                      ;008088|        |008187;
                       dw stage0_SP_01                      ;00808A|        |0082E2;
                       dw stage0_BG_02                      ;00808C|        |008193;
                       dw stage0_SP_02                      ;00808E|        |0082EA;
                       dw stage0_BG_03                      ;008090|        |008199;
                       dw stage0_SP_03                      ;008092|        |0082EE;
 
          chrStage_01: dw stage1_BG_00                      ;008094|        |00819C;
                       dw stage1_SP_00                      ;008096|        |0082F0;
                       dw stage1_BG_01                      ;008098|        |0081A5;
                       dw stage1_SP_01                      ;00809A|        |0082F6;
                       dw stage1_BG_02                      ;00809C|        |0081AE;
                       dw stage1_SP_02                      ;00809E|        |0082FC;
                       dw stage1_BG_02                      ;0080A0|        |0081AE;
                       dw stage1_SP_03                      ;0080A2|        |008302;
                       dw stage1_BG_01                      ;0080A4|        |0081A5;
                       dw stage1_SP_04                      ;0080A6|        |008308;
                       dw stage1_BG_00                      ;0080A8|        |00819C;
                       dw stage1_SP_05                      ;0080AA|        |00830E;
 
          chrStage_02: dw stage2_BG_00                      ;0080AC|        |0081B7;
                       dw stage2_SP_00                      ;0080AE|        |008314;
                       dw stage2_BG_01                      ;0080B0|        |0081BD;
                       dw stage2_SP_01                      ;0080B2|        |008318;
                       dw stage2_BG_02                      ;0080B4|        |0081C0;
                       dw stage2_SP_02                      ;0080B6|        |00831A;
                       dw stage2_BG_03                      ;0080B8|        |0081C6;
                       dw stage2_SP_03                      ;0080BA|        |00831E;
 
                       dw stage2_BG_04                      ;0080BC|        |0081CF;
                       dw stage2_SP_04                      ;0080BE|        |008324;
 
          chrStage_03: dw stage3_BG_01                      ;0080C0|        |0081D5;
 
                       dw stage3_SP_01                      ;0080C2|        |008328;
                       dw stage3_BG_02                      ;0080C4|        |0081DE;
                       dw stage3_SP_02                      ;0080C6|        |00832E;
                       dw stage3_BG_03                      ;0080C8|        |0081E4;
                       dw stage3_SP_03                      ;0080CA|        |008332;
                       dw stage3_BG_04                      ;0080CC|        |0081EA;
                       dw stage3_SP_04                      ;0080CE|        |008336;
                       dw stage3_BG_05                      ;0080D0|        |0081F0;
                       dw stage3_SP_05                      ;0080D2|        |00833A;
 
          chrStage_04: dw stage4_BG_01                      ;0080D4|        |0081F9;
                       dw stage4_SP_01                      ;0080D6|        |008340;
                       dw stage4_BG_01                      ;0080D8|        |0081F9;
                       dw stage4_SP_02                      ;0080DA|        |008346;
                       dw stage4_BG_03                      ;0080DC|        |008202;
                       dw stage4_SP_03                      ;0080DE|        |00834C;
 
          chrStage_05: dw stage5_BG_01                      ;0080E0|        |00820B;
                       dw stage5_SP_01                      ;0080E2|        |008352;
                       dw stage5_BG_01                      ;0080E4|        |00820B;
 
                       dw stage5_SP_02                      ;0080E6|        |008354;
 
                       dw stage5_BG_03                      ;0080E8|        |00820E;
                       dw stage5_SP_03                      ;0080EA|        |008356;
                       dw stage5_BG_03                      ;0080EC|        |00820E;
                       dw stage5_SP_04                      ;0080EE|        |00835A;
 
          chrStage_06: dw stage6_BG_01                      ;0080F0|        |008214;
                       dw stage6_SP_01                      ;0080F2|        |00835E;
                       dw stage6_BG_02                      ;0080F4|        |00821A;
                       dw stage6_SP_02                      ;0080F6|        |008362;
                       dw stage6_BG_03                      ;0080F8|        |00821D;
                       dw stage6_SP_03                      ;0080FA|        |008364;
 
          chrStage_07: dw stage7_BG_01                      ;0080FC|        |008226;
                       dw stage7_SP_01                      ;0080FE|        |00836A;
                       dw stage7_BG_02                      ;008100|        |00822C;
                       dw stage7_SP_02                      ;008102|        |00836E;
                       dw stage7_BG_02                      ;008104|        |00822C;
                       dw stage7_SP_03                      ;008106|        |008370;
                       dw stage7_BG_02                      ;008108|        |00822C;
                       dw stage7_SP_04                      ;00810A|        |008372;
                       dw stage7_BG_05                      ;00810C|        |00822F;
                       dw stage7_SP_05                      ;00810E|        |008374;
                       dw stage7_BG_06                      ;008110|        |008235;
                       dw stage7_SP_06                      ;008112|        |008378;
                       dw stage7_BG_07                      ;008114|        |00823B;
                       dw stage7_SP_07                      ;008116|        |00837C;
 
          chrStage_08: dw stage8_BG_01                      ;008118|        |00823E;
                       dw stage8_SP_01                      ;00811A|        |00837E;
                       dw stage8_BG_02                      ;00811C|        |008244;
                       dw stage8_SP_02                      ;00811E|        |008382;
                       dw stage8_BG_03                      ;008120|        |008247;
                       dw stage8_SP_03                      ;008122|        |008384;
                       dw stage8_BG_02                      ;008124|        |008244;
                       dw stage8_SP_04                      ;008126|        |008388;
                       dw stage8_BG_02                      ;008128|        |008244;
                       dw stage8_SP_05                      ;00812A|        |00838A;
 
          chrStage_09: dw stage9_BG_01                      ;00812C|        |00824D;
                       dw stage9_SP_01                      ;00812E|        |00838C;
                       dw stage9_BG_02                      ;008130|        |008253;
                       dw stage9_SP_02                      ;008132|        |008390;
 
          chrStage_0a: dw stageA_BG_01                      ;008134|        |00825C;
                       dw stageA_SP_01                      ;008136|        |008396;
                       dw stageA_BG_02                      ;008138|        |008262;
                       dw stageA_SP_02                      ;00813A|        |00839A;
                       dw stageA_BG_03                      ;00813C|        |008265;
                       dw stageA_SP_03                      ;00813E|        |00839C;
                       dw stageA_BG_04                      ;008140|        |008268;
                       dw stageA_SP_04                      ;008142|        |00839E;
                       dw stageA_BG_05                      ;008144|        |00826E;
                       dw stageA_SP_05                      ;008146|        |0083A2;
                       dw stageA_BG_06                      ;008148|        |008277;
                       dw stageA_SP_06                      ;00814A|        |0083A8;
                       dw stageA_BG_07                      ;00814C|        |00827D;
                       dw stageA_SP_07                      ;00814E|        |0083AC;
 
          chrStage_0b: dw stageB_BG_01                      ;008150|        |008286;
                       dw stageB_SP_01                      ;008152|        |0083B2;
                       dw stageB_BG_02                      ;008154|        |00828C;
                       dw stageB_SP_02                      ;008156|        |0083B6;
                       dw stageB_BG_03                      ;008158|        |008292;
                       dw stageB_SP_03                      ;00815A|        |0083BA;
 
          chrStage_0c: dw stageC_BG_01                      ;00815C|        |00829B;
                       dw stageC_SP_01                      ;00815E|        |0083C0;
                       dw stageC_BG_02                      ;008160|        |0082A1;
                       dw stageC_SP_02                      ;008162|        |0083C4;
                       dw stageC_BG_03                      ;008164|        |0082A7;
                       dw stageC_SP_03                      ;008166|        |0083C8;
 
          chrStage_0d: dw stageD_BG_01                      ;008168|        |0082AA;
                       dw stageD_SP_01                      ;00816A|        |0083CA;
                       dw stageD_BG_02                      ;00816C|        |0082B3;
                       dw stageD_SP_02                      ;00816E|        |0083D0;
                       dw stageD_BG_03                      ;008170|        |0082BC;
                       dw stageD_SP_03                      ;008172|        |0083D6;
                       dw stageD_BG_04                      ;008174|        |0082C5;
                       dw stageD_SP_04                      ;008176|        |0083DC;
 
          chrStage_0e: dw stageE_BG_01                      ;008178|        |0082CB;
                       dw stageE_SP_01                      ;00817A|        |0083E0;
                       dw stageE_BG_02                      ;00817C|        |0082D4;
                       dw stageE_SP_02                      ;00817E|        |0083E6;
 
                       dw stageE_BG_03                      ;008180|        |0082DA;
                       dw stageE_SP_03                      ;008182|        |0083EA;
 
         stage0_BG_00: db $45,$47,$36                       ;008184|        |      ;
 
         stage0_BG_01: db $45,$47,$36,$46,$47,$36,$45,$47   ;008187|        |      ;
                       db $36,$45,$47,$36                   ;00818F|        |      ;
 
         stage0_BG_02: db $48,$47,$36,$48,$47,$36           ;008193|        |      ;
 
         stage0_BG_03: db $48,$47,$36                       ;008199|        |      ;
 
         stage1_BG_00: db $54,$49,$36,$54,$49,$0B,$54,$4A   ;00819C|        |      ;
                       db $36                               ;0081A4|        |      ;
 
         stage1_BG_01: db $54,$4A,$36,$54,$49,$36,$54,$4A   ;0081A5|        |      ;
                       db $36                               ;0081AD|        |      ;
 
         stage1_BG_02: db $54,$4A,$36,$54,$49,$36,$54,$49   ;0081AE|        |      ;
                       db $36                               ;0081B6|        |      ;
 
         stage2_BG_00: db $4B,$4D,$36,$4B,$4D,$36           ;0081B7|        |      ;
 
         stage2_BG_01: db $4B,$4D,$36                       ;0081BD|        |      ;
 
         stage2_BG_02: db $4C,$4D,$36,$4B,$4D,$36           ;0081C0|        |      ;
 
         stage2_BG_03: db $4C,$4D,$36,$4B,$4D,$36,$4C,$4D   ;0081C6|        |      ;
                       db $36                               ;0081CE|        |      ;
 
         stage2_BG_04: db $4C,$4D,$4C,$4C,$4D,$36           ;0081CF|        |      ;
 
         stage3_BG_01: db $4F,$50,$36,$4F,$50,$36,$4E,$50   ;0081D5|        |      ;
                       db $36                               ;0081DD|        |      ;
 
         stage3_BG_02: db $4F,$50,$09,$4F,$50,$36           ;0081DE|        |      ;
 
         stage3_BG_03: db $4F,$50,$36,$4E,$50,$36           ;0081E4|        |      ;
 
         stage3_BG_04: db $4E,$50,$36,$4E,$50,$36           ;0081EA|        |      ;
 
         stage3_BG_05: db $4F,$50,$36,$4E,$50,$36,$4E,$50   ;0081F0|        |      ;
 
                       db $36                               ;0081F8|        |      ;
 
         stage4_BG_01: db $6E,$4A,$36,$6E,$4A,$36,$6E,$4A   ;0081F9|        |      ;
                       db $36                               ;008201|        |      ;
 
         stage4_BG_03: db $6E,$4A,$36,$6E,$4A,$36,$53,$4A   ;008202|        |      ;
                       db $36                               ;00820A|        |      ;
 
         stage5_BG_01: db $54,$57,$54                       ;00820B|        |      ;
 
         stage5_BG_03: db $54,$57,$36,$54,$57,$36           ;00820E|        |      ;
 
         stage6_BG_01: db $59,$5A,$36,$58,$5A,$36           ;008214|        |      ;
 
         stage6_BG_02: db $59,$5A,$36                       ;00821A|        |      ;
 
         stage6_BG_03: db $59,$5A,$36,$59,$5A,$36,$59,$5A   ;00821D|        |      ;
                       db $36                               ;008225|        |      ;
 
         stage7_BG_01: db $5B,$5D,$36,$5B,$5D,$36           ;008226|        |      ;
 
         stage7_BG_02: db $5B,$5D,$36                       ;00822C|        |      ;
 
         stage7_BG_05: db $5B,$5D,$36,$5C,$5D,$5C           ;00822F|        |      ;
 
         stage7_BG_06: db $5C,$5D,$36,$5C,$5D,$36           ;008235|        |      ;
 
         stage7_BG_07: db $5C,$5D,$36                       ;00823B|        |      ;
 
         stage8_BG_01: db $5E,$60,$36,$5E,$60,$36           ;00823E|        |      ;
 
         stage8_BG_02: db $5E,$60,$36                       ;008244|        |      ;
 
         stage8_BG_03: db $5E,$60,$36,$5F,$60,$36           ;008247|        |      ;
 
         stage9_BG_01: db $61,$62,$36,$61,$62,$36           ;00824D|        |      ;
 
         stage9_BG_02: db $61,$62,$36,$61,$62,$36,$61,$62   ;008253|        |      ;
                       db $36                               ;00825B|        |      ;
 
         stageA_BG_01: db $67,$5D,$36,$67,$5D,$36           ;00825C|        |      ;
 
         stageA_BG_02: db $67,$68,$36                       ;008262|        |      ;
 
         stageA_BG_03: db $67,$5D,$36                       ;008265|        |      ;
 
         stageA_BG_04: db $67,$5D,$36,$67,$68,$36           ;008268|        |      ;
 
         stageA_BG_05: db $67,$68,$36,$67,$68,$36,$67,$68   ;00826E|        |      ;
                       db $36                               ;008276|        |      ;
 
         stageA_BG_06: db $67,$68,$36,$67,$69,$36           ;008277|        |      ;
 
         stageA_BG_07: db $67,$69,$36,$67,$69,$36,$51,$69   ;00827D|        |      ;
                       db $36                               ;008285|        |      ;
 
         stageB_BG_01: db $65,$66,$36,$65,$66,$36           ;008286|        |      ;
 
         stageB_BG_02: db $65,$66,$36,$65,$66,$36           ;00828C|        |      ;
 
         stageB_BG_03: db $51,$66,$36,$65,$66,$36,$65,$66   ;008292|        |      ;
 
                       db $36                               ;00829A|        |      ;
 
         stageC_BG_01: db $52,$6D,$36,$6C,$6D,$36           ;00829B|        |      ;
 
         stageC_BG_02: db $6C,$6D,$36,$6C,$6D,$36           ;0082A1|        |      ;
 
         stageC_BG_03: db $6C,$6D,$36                       ;0082A7|        |      ;
 
         stageD_BG_01: db $4B,$4D,$36,$4B,$4D,$36,$54,$64   ;0082AA|        |      ;
                       db $36                               ;0082B2|        |      ;
 
         stageD_BG_02: db $54,$64,$36,$54,$64,$36,$54,$64   ;0082B3|        |      ;
 
                       db $36                               ;0082BB|        |      ;
 
         stageD_BG_03: db $54,$64,$36,$63,$64,$36,$54,$57   ;0082BC|        |      ;
                       db $36                               ;0082C4|        |      ;
 
         stageD_BG_04: db $54,$57,$54,$63,$64,$36           ;0082C5|        |      ;
 
         stageE_BG_01: db $6A,$6B,$36,$54,$49,$36,$6A,$6B   ;0082CB|        |      ;
                       db $36                               ;0082D3|        |      ;
 
         stageE_BG_02: db $6A,$6B,$36,$6A,$6B,$36           ;0082D4|        |      ;
 
         stageE_BG_03: db $6A,$68,$36,$6A,$33,$36           ;0082DA|        |      ;
 
         stage0_SP_00: db $08,$0B                           ;0082E0|        |      ;
 
         stage0_SP_01: db $08,$13,$08,$09,$12,$0F,$08,$13   ;0082E2|        |      ;
 
         stage0_SP_02: db $0A,$0B,$08,$09                   ;0082EA|        |      ;
 
         stage0_SP_03: db $08,$09                           ;0082EE|        |      ;
 
         stage1_SP_00: db $14,$13,$14,$13,$12,$09           ;0082F0|        |      ;
 
         stage1_SP_01: db $14,$0B,$14,$0F,$18,$19           ;0082F6|        |      ;
 
         stage1_SP_02: db $14,$09,$14,$0F,$08,$0B           ;0082FC|        |      ;
 
         stage1_SP_03: db $14,$09,$14,$0F,$08,$0B           ;008302|        |      ;
 
         stage1_SP_04: db $14,$0B,$14,$0F,$18,$19           ;008308|        |      ;
 
         stage1_SP_05: db $14,$13,$14,$13,$12,$09           ;00830E|        |      ;
 
         stage2_SP_00: db $08,$0F,$0C,$13                   ;008314|        |      ;
 
         stage2_SP_01: db $0C,$0D                           ;008318|        |      ;
 
         stage2_SP_02: db $0A,$13,$0A,$7B                   ;00831A|        |      ;
 
         stage2_SP_03: db $0A,$13,$0C,$0D,$08,$19           ;00831E|        |      ;
 
         stage2_SP_04: db $1C,$13,$0C,$13                   ;008324|        |      ;
 
         stage3_SP_01: db $08,$0F,$0E,$0F,$12,$09           ;008328|        |      ;
 
         stage3_SP_02: db $08,$13,$08,$13                   ;00832E|        |      ;
 
         stage3_SP_03: db $08,$09,$18,$19                   ;008332|        |      ;
 
         stage3_SP_04: db $08,$0F,$12,$19                   ;008336|        |      ;
 
         stage3_SP_05: db $08,$13,$08,$0F,$08,$19           ;00833A|        |      ;
 
         stage4_SP_01: db $12,$15,$0A,$0B,$08,$09           ;008340|        |      ;
 
         stage4_SP_02: db $0A,$0B,$14,$0B,$12,$0B           ;008346|        |      ;
 
         stage4_SP_03: db $08,$09,$0A,$0B,$08,$09           ;00834C|        |      ;
 
         stage5_SP_01: db $0A,$09                           ;008352|        |      ;
 
         stage5_SP_02: db $0A,$17                           ;008354|        |      ;
 
         stage5_SP_03: db $0A,$09,$0A,$09                   ;008356|        |      ;
 
         stage5_SP_04: db $0A,$0B,$0A,$17                   ;00835A|        |      ;
 
         stage6_SP_01: db $10,$09,$10,$17                   ;00835E|        |      ;
 
         stage6_SP_02: db $10,$09                           ;008362|        |      ;
 
         stage6_SP_03: db $18,$19,$10,$09,$08,$13           ;008364|        |      ;
 
         stage7_SP_01: db $08,$15,$0E,$15                   ;00836A|        |      ;
 
         stage7_SP_02: db $0E,$0B                           ;00836E|        |      ;
 
         stage7_SP_03: db $18,$15                           ;008370|        |      ;
 
         stage7_SP_04: db $08,$15                           ;008372|        |      ;
 
         stage7_SP_05: db $08,$15,$0E,$15                   ;008374|        |      ;
 
         stage7_SP_06: db $0E,$15,$0E,$13                   ;008378|        |      ;
 
         stage7_SP_07: db $08,$13                           ;00837C|        |      ;
 
         stage8_SP_01: db $0A,$09,$14,$0B                   ;00837E|        |      ;
 
         stage8_SP_02: db $0A,$11                           ;008382|        |      ;
 
         stage8_SP_03: db $0A,$11,$0A,$11                   ;008384|        |      ;
 
         stage8_SP_04: db $0A,$11                           ;008388|        |      ;
 
         stage8_SP_05: db $0A,$11                           ;00838A|        |      ;
 
         stage9_SP_01: db $0A,$09,$0E,$0B                   ;00838C|        |      ;
 
         stage9_SP_02: db $0E,$13,$14,$09,$0A,$13           ;008390|        |      ;
 
         stageA_SP_01: db $08,$0F,$0A,$15                   ;008396|        |      ;
 
         stageA_SP_02: db $0A,$09                           ;00839A|        |      ;
 
         stageA_SP_03: db $0A,$15                           ;00839C|        |      ;
 
         stageA_SP_04: db $0A,$0B,$0E,$0B                   ;00839E|        |      ;
 
         stageA_SP_05: db $0A,$0B,$0C,$13,$08,$0F           ;0083A2|        |      ;
 
         stageA_SP_06: db $0A,$09,$12,$0F                   ;0083A8|        |      ;
 
         stageA_SP_07: db $0C,$0F,$14,$0B,$0E,$09           ;0083AC|        |      ;
 
         stageB_SP_01: db $0A,$0B,$0A,$2F                   ;0083B2|        |      ;
 
         stageB_SP_02: db $0A,$09,$12,$09                   ;0083B6|        |      ;
 
         stageB_SP_03: db $0A,$13,$14,$0F,$08,$13           ;0083BA|        |      ;
 
         stageC_SP_01: db $08,$09,$0C,$0F                   ;0083C0|        |      ;
 
         stageC_SP_02: db $0E,$13,$0E,$09                   ;0083C4|        |      ;
 
         stageC_SP_03: db $14,$09                           ;0083C8|        |      ;
 
         stageD_SP_01: db $63,$64,$0A,$2F,$63,$64           ;0083CA|        |      ;
 
         stageD_SP_02: db $63,$64,$0A,$0B,$0A,$09           ;0083D0|        |      ;
 
         stageD_SP_03: db $14,$13,$14,$0B,$08,$09           ;0083D6|        |      ;
 
         stageD_SP_04: db $0A,$17,$12,$0F                   ;0083DC|        |      ;
 
         stageE_SP_01: db $0A,$09,$14,$0F,$08,$13           ;0083E0|        |      ;
 
         stageE_SP_02: db $0C,$13,$12,$09                   ;0083E6|        |      ;
 
         stageE_SP_03: db $61,$62,$61,$62                   ;0083EA|        |      ;
 
getCollisonBitBothSlots: LDX.B #$00                           ;0083EE|A200    |      ;
                       LDA.B r_CHR_BankBG_0400              ;0083F0|A54B    |00004B;
                       JSR.W getCollusionBits2ndSlot        ;0083F2|20F983  |0083F9;
                       LDX.B #$08                           ;0083F5|A208    |      ; 3d slot offset
                       LDA.B r_CHR_BankBG_0800              ;0083F7|A54C    |00004C;
 
getCollusionBits2ndSlot: LDY.B #$00                           ;0083F9|A000    |      ;
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
                       LDA.W collusioBitLo,Y                ;008410|B93D84  |00843D;
                       STA.B r_pointerQueue                 ;008413|8508    |000008;
                       LDA.W collusioBitHi,Y                ;008415|B93E84  |00843E;
 
          CODE_008418: STA.B $09                            ;008418|8509    |000009;
                       LDY.B #$00                           ;00841A|A000    |      ;
 
          CODE_00841C: LDA.B (r_pointerQueue),Y             ;00841C|B108    |000008;
                       INY                                  ;00841E|C8      |      ;
                       STA.B r_temp_Xpos                    ;00841F|850A    |00000A;
 
                       LDA.B (r_pointerQueue),Y             ;008421|B108    |000008;
                       INY                                  ;008423|C8      |      ;
 
          CODE_008424: STA.W r_collisionTypeCHR400,X        ;008424|9D7007  |000770;
                       INX                                  ;008427|E8      |      ;
                       DEC.B r_temp_Xpos                    ;008428|C60A    |00000A;
                       BNE CODE_008424                      ;00842A|D0F8    |008424;
                       TXA                                  ;00842C|8A      |      ;
                       AND.B #$07                           ;00842D|2907    |      ;
                       BNE CODE_00841C                      ;00842F|D0EB    |00841C;
                       RTS                                  ;008431|60      |      ;
 
 
          CODE_008432: LDA.W cullusion_CHR_33_36_37,Y       ;008432|B99384  |008493;
                       STA.B r_pointerQueue                 ;008435|8508    |000008;
                       LDA.W cullusion_CHR_33_36_37Hi,Y     ;008437|B99484  |008494;
                       JMP.W CODE_008418                    ;00843A|4C1884  |008418;
 
 
        collusioBitLo: dw no_col                            ;00843D|        |008499; CHR 44 is base value
                       dw collusion_45                      ;00843F|        |0084A3;
                       dw no_col                            ;008441|        |008499;
                       dw collusion_47                      ;008443|        |0084A7;
                       dw no_col                            ;008445|        |008499;
                       dw collusion_49                      ;008447|        |0084B3;
                       dw collusion_4a                      ;008449|        |0084AB;
                       dw no_col                            ;00844B|        |008499;
 
                       dw no_col                            ;00844D|        |008499;
                       dw collusion_4d                      ;00844F|        |0084AF;
                       dw no_col                            ;008451|        |008499;
                       dw no_col                            ;008453|        |008499;
                       dw collusion_49                      ;008455|        |0084B3;
                       dw no_col                            ;008457|        |008499;
                       dw no_col                            ;008459|        |008499;
                       dw collusion_53                      ;00845B|        |0084B9;
                       dw collusion_54                      ;00845D|        |0084BD;
                       dw collusion_54                      ;00845F|        |0084BD;
                       dw collusion_54                      ;008461|        |0084BD;
                       dw collusion_57                      ;008463|        |0084C1;
 
                       dw no_col                            ;008465|        |008499;
                       dw collusion_59                      ;008467|        |0084C9;
                       dw collusion_5a                      ;008469|        |0084CD;
                       dw no_col                            ;00846B|        |008499;
 
                       dw no_col                            ;00846D|        |008499;
                       dw collusion_unused                  ;00846F|        |0084D3;
                       dw no_col                            ;008471|        |008499;
                       dw no_col                            ;008473|        |008499;
 
                       dw collusion_60                      ;008475|        |0084D9;
                       dw no_col                            ;008477|        |008499;
                       dw collusion_62                      ;008479|        |0084DF;
                       dw no_col                            ;00847B|        |008499;
 
                       dw collusion_64                      ;00847D|        |0084E3;
                       dw collusion_65                      ;00847F|        |0084E7;
                       dw collusion_66                      ;008481|        |0084EB;
                       dw no_col                            ;008483|        |008499;
                       dw collusion_68                      ;008485|        |0084F1;
                       dw collusion_68                      ;008487|        |0084F1;
                       dw no_col                            ;008489|        |008499;
                       dw collusion_6b                      ;00848B|        |0084F7;
                       dw no_col                            ;00848D|        |008499;
                       dw collusion_6d                      ;00848F|        |0084FD;
                       dw collusion_6e                      ;008491|        |00849F;
 
cullusion_CHR_33_36_37: dw collusion_33                      ;008493|        |00849B;
                       dw collusion_33                      ;008495|        |00849B;
                       dw collusion_33                      ;008497|        |00849B;
 
               no_col: db $08,$80                           ;008499|        |      ; type, illTileID
 
         collusion_33: db $06,$BC,$02,$C0                   ;00849B|        |      ;
 
         collusion_6e: db $06,$7B,$02,$80                   ;00849F|        |      ;
 
         collusion_45: db $06,$7E,$02,$80                   ;0084A3|        |      ;
 
         collusion_47: db $06,$B7,$02,$C0                   ;0084A7|        |      ;
 
         collusion_4a: db $06,$B9,$02,$C0                   ;0084AB|        |      ;
 
         collusion_4d: db $06,$B8,$02,$C0                   ;0084AF|        |      ;
 
         collusion_49: db $04,$B8,$02,$B9,$02,$C0           ;0084B3|        |      ;
 
         collusion_53: db $06,$7A,$02,$80                   ;0084B9|        |      ;
 
         collusion_54: db $06,$7C,$02,$80                   ;0084BD|        |      ;
 
         collusion_57: db $02,$B6,$01,$B7,$03,$B8,$02,$C0   ;0084C1|        |      ;
 
         collusion_59: db $06,$78,$02,$80                   ;0084C9|        |      ;
 
         collusion_5a: db $01,$B8,$05,$BA,$02,$C0           ;0084CD|        |      ;
 
     collusion_unused: db $04,$B2,$02,$B4,$02,$C0           ;0084D3|        |      ;
 
         collusion_60: db $04,$BA,$02,$BB,$02,$C0           ;0084D9|        |      ;
 
         collusion_62: db $06,$A0,$02,$C0                   ;0084DF|        |      ;
 
         collusion_64: db $06,$B8,$02,$C0                   ;0084E3|        |      ;
 
         collusion_65: db $06,$7C,$02,$80                   ;0084E7|        |      ;
 
         collusion_66: db $04,$B8,$02,$B9,$02,$C0           ;0084EB|        |      ;
 
         collusion_68: db $04,$B2,$02,$B3,$02,$C0           ;0084F1|        |      ;
 
         collusion_6b: db $04,$B7,$02,$B8,$02,$C0           ;0084F7|        |      ;
 
         collusion_6d: db $06,$B8,$02,$C0                   ;0084FD|        |      ;
 
          CODE_008501: LDA.B r_stage                        ;008501|A532    |000032;
                       CMP.B #$0C                           ;008503|C90C    |      ;
 
                       BNE CODE_00850E                      ;008505|D007    |00850E;
                       LDY.W r_hardMode                     ;008507|ACF607  |0007F6;
                       BEQ CODE_00850E                      ;00850A|F002    |00850E;
                       LDA.B #$0F                           ;00850C|A90F    |      ;
 
          CODE_00850E: ASL A                                ;00850E|0A      |      ;
                       TAY                                  ;00850F|A8      |      ;
                       LDA.W groupPalettePointerList,Y      ;008510|B9CD85  |0085CD;
                       STA.B r_pointerQueue                 ;008513|8508    |000008;
                       LDA.W PTR16_0085CE,Y                 ;008515|B9CE85  |0085CE;
                       STA.B $09                            ;008518|8509    |000009;
                       LDA.B r_blockLevel                   ;00851A|A533    |000033;
                       ASL A                                ;00851C|0A      |      ;
                       ASL A                                ;00851D|0A      |      ;
                       TAY                                  ;00851E|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00851F|B108    |000008;
                       STA.B r_temp_Xpos                    ;008521|850A    |00000A;
                       INY                                  ;008523|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;008524|B108    |000008;
                       STA.B $0B                            ;008526|850B    |00000B;
 
                       INY                                  ;008528|C8      |      ;
                       STY.B r_tempCurrRoomIdx              ;008529|840E    |00000E;
                       RTS                                  ;00852B|60      |      ;
 
 
          CODE_00852C: LDA.B #$09                           ;00852C|A909    |      ;
                       db $20                               ;00852E|        |      ;
                       dw screenLoadRoutine                 ;00852F|        |0FECE9;
                       JSR.W CODE_008501                    ;008531|200185  |008501;
                       LDA.B #$00                           ;008534|A900    |      ;
                       STA.B $07                            ;008536|8507    |000007;
                       LDY.B r_roomIdx                      ;008538|A434    |000034;
                       LDA.B (r_temp_Xpos),Y                ;00853A|B10A    |00000A;
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
                       LDX.B r_sceneDrawQueue               ;00854D|A61D    |00001D;
                       LDA.B #$03                           ;00854F|A903    |      ;
                       STA.B r_tempCurrSection              ;008551|850D    |00000D;
 
          CODE_008553: LDA.B #$03                           ;008553|A903    |      ;
                       STA.B r_tempCurrGroup                ;008555|850C    |00000C;
 
          CODE_008557: LDA.B $07                            ;008557|A507    |000007;
                       BNE CODE_00856E                      ;008559|D013    |00856E;
                       LDA.W DATA8_008779,Y                 ;00855B|B97987  |008779;
 
          CODE_00855E: STA.W $02F4,X                        ;00855E|9DF402  |0002F4;
 
                       INY                                  ;008561|C8      |      ;
                       INX                                  ;008562|E8      |      ;
                       DEC.B r_tempCurrGroup                ;008563|C60C    |00000C;
                       BNE CODE_008557                      ;008565|D0F0    |008557;
                       INX                                  ;008567|E8      |      ;
 
                       DEC.B r_tempCurrSection              ;008568|C60D    |00000D;
                       BNE CODE_008553                      ;00856A|D0E7    |008553;
                       BEQ CODE_008574                      ;00856C|F006    |008574;
 
          CODE_00856E: LDA.W DATA8_008875,Y                 ;00856E|B97588  |008875;
                       JMP.W CODE_00855E                    ;008571|4C5E85  |00855E;
 
 
          CODE_008574: JSR.W CODE_0085BB                    ;008574|20BB85  |0085BB;
                       LDY.B r_tempCurrRoomIdx              ;008577|A40E    |00000E;
                       LDA.B (r_pointerQueue),Y             ;008579|B108    |000008;
                       STA.B r_temp_Xpos                    ;00857B|850A    |00000A;
                       INY                                  ;00857D|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00857E|B108    |000008;
                       STA.B $0B                            ;008580|850B    |00000B;
                       LDY.B r_roomIdx                      ;008582|A434    |000034;
                       LDA.B (r_temp_Xpos),Y                ;008584|B10A    |00000A;
                       ASL A                                ;008586|0A      |      ;
                       CLC                                  ;008587|18      |      ;
                       ADC.B (r_temp_Xpos),Y                ;008588|710A    |00000A;
                       TAY                                  ;00858A|A8      |      ;
                       LDX.B r_sceneDrawQueue               ;00858B|A61D    |00001D;
                       LDA.B #$03                           ;00858D|A903    |      ;
                       STA.B r_tempCurrGroup                ;00858F|850C    |00000C;
 
          CODE_008591: LDA.W DATA8_0089CE,Y                 ;008591|B9CE89  |0089CE;
                       STA.W $02F0,X                        ;008594|9DF002  |0002F0;
                       INY                                  ;008597|C8      |      ;
                       INX                                  ;008598|E8      |      ;
                       DEC.B r_tempCurrGroup                ;008599|C60C    |00000C;
                       BNE CODE_008591                      ;00859B|D0F4    |008591;
                       RTS                                  ;00859D|60      |      ;
 
 
          CODE_00859E: JSR.W CODE_008501                    ;00859E|200185  |008501;
                       JMP.W CODE_008574                    ;0085A1|4C7485  |008574;
 
 
          CODE_0085A4: JSR.W CODE_00859E                    ;0085A4|209E85  |00859E;
                       LDX.B r_sceneDrawQueue               ;0085A7|A61D    |00001D;
                       LDY.B #$00                           ;0085A9|A000    |      ;
 
          CODE_0085AB: LDA.W DATA8_0085B8,Y                 ;0085AB|B9B885  |0085B8;
                       STA.W $02E8,X                        ;0085AE|9DE802  |0002E8;
                       INX                                  ;0085B1|E8      |      ;
                       INY                                  ;0085B2|C8      |      ;
                       CPY.B #$03                           ;0085B3|C003    |      ;
                       BCC CODE_0085AB                      ;0085B5|90F4    |0085AB;
                       RTS                                  ;0085B7|60      |      ;
 
 
         DATA8_0085B8: db $20,$26,$37                       ;0085B8|        |      ;
 
          CODE_0085BB: LDY.W r_entity_ObjectIdxes           ;0085BB|AC4E05  |00054E;
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
 
               PAL_09: db $00,$3F,$0F,$16,$26,$20,$0F,$16   ;008766|        |      ;
                       db $26,$20,$0F,$16,$26,$20,$0F,$16   ;00876E|        |      ;
                       db $26,$20,$FF                       ;008776|        |      ;
 
         DATA8_008779: db $00,$10,$1A,$00,$0B,$2C,$02,$00   ;008779|        |      ;
                       db $10,$11,$26,$36,$30,$0C,$2B,$16   ;008781|        |      ;
                       db $25,$36,$00,$11,$1A,$02,$11,$30   ;008789|        |      ;
 
                       db $02,$08,$38,$00,$10,$1A,$02,$12   ;008791|        |      ;
                       db $30,$02,$08,$38,$20,$02,$1B,$02   ;008799|        |      ;
                       db $00,$10,$10,$04,$24,$33,$02,$00   ;0087A1|        |      ;
                       db $02,$00,$10,$10,$0B,$2C,$0B,$1C   ;0087A9|        |      ;
                       db $2A,$02,$09,$06,$00,$20,$18,$08   ;0087B1|        |      ;
                       db $18,$2A,$02,$09,$06,$02,$20,$13   ;0087B9|        |      ;
                       db $0B,$1C,$2A,$02,$09,$08,$02,$31   ;0087C1|        |      ;
                       db $12,$10,$08,$18,$00,$20,$10,$02   ;0087C9|        |      ;
                       db $08,$28,$00,$06,$2C,$00,$34,$22   ;0087D1|        |      ;
                       db $27,$06,$15,$1B,$02,$2C,$02,$00   ;0087D9|        |      ;
 
                       db $10,$02,$03,$13,$0B,$1B,$01,$02   ;0087E1|        |      ;
                       db $11,$20,$31,$11,$21,$08,$18,$2A   ;0087E9|        |      ;
                       db $08,$29,$17,$02,$11,$21,$0C,$00   ;0087F1|        |      ;
                       db $20,$08,$29,$18,$03,$12,$22,$08   ;0087F9|        |      ;
 
                       db $10,$20,$08,$0A,$00,$02,$11,$31   ;008801|        |      ;
                       db $02,$10,$20,$13,$03,$33,$02,$11   ;008809|        |      ;
                       db $31,$08,$10,$20,$0B,$1B,$2B,$06   ;008811|        |      ;
                       db $16,$26,$02,$11,$20,$0B,$1C,$3C   ;008819|        |      ;
                       db $0B,$1B,$02,$02,$11,$20,$08,$18   ;008821|        |      ;
                       db $38,$08,$18,$02,$01,$11,$2C,$17   ;008829|        |      ;
                       db $27,$05,$0B,$1C,$3C,$08,$18,$10   ;008831|        |      ;
                       db $07,$17,$08,$0B,$1C,$3C,$07,$00   ;008839|        |      ;
                       db $10,$16,$25,$10,$02,$19,$21,$07   ;008841|        |      ;
 
                       db $00,$10,$1B,$00,$10,$02,$19,$21   ;008849|        |      ;
                       db $08,$18,$20,$01,$11,$20,$0B,$1B   ;008851|        |      ;
                       db $20,$08,$18,$0C,$0B,$1B,$0C,$2C   ;008859|        |      ;
                       db $27,$0C,$08,$18,$0C,$0C,$00,$10   ;008861|        |      ;
                       db $01,$11,$21,$08,$18,$0C,$0C,$00   ;008869|        |      ;
                       db $10,$05,$00,$10                   ;008871|        |      ;
 
         DATA8_008875: db $0C,$17,$1C,$0C,$00,$10,$15,$27   ;008875|        |      ;
                       db $20,$00,$22,$1A,$18,$28,$20,$22   ;00887D|        |      ;
                       db $20,$02,$20,$0C,$2C,$11,$00,$20   ;008885|        |      ;
                       db $00,$08,$18,$00,$2C,$1A,$00,$10   ;00888D|        |      ;
                       db $20,$08,$18,$0C,$00,$2C,$1A,$00   ;008895|        |      ;
                       db $10,$20,$08,$18,$27,$00,$05,$1A   ;00889D|        |      ;
                       db $0C,$10,$27,$22,$20,$02,$10,$05   ;0088A5|        |      ;
                       db $01,$0C,$10,$27,$00,$05,$1A,$00   ;0088AD|        |      ;
                       db $04,$10,$0C,$2C,$19,$02,$04,$14   ;0088B5|        |      ;
                       db $00,$04,$10,$02,$14,$27,$02,$04   ;0088BD|        |      ;
                       db $14,$0B,$1B,$2A,$02,$0A,$08,$02   ;0088C5|        |      ;
                       db $32,$13,$01,$11,$21,$00,$10,$23   ;0088CD|        |      ;
                       db $0B,$1A,$3A,$01,$11,$21,$00,$10   ;0088D5|        |      ;
                       db $23,$05,$25,$10,$0B,$1B,$0F,$00   ;0088DD|        |      ;
                       db $10,$37,$0B,$1A,$3A,$0B,$12,$05   ;0088E5|        |      ;
                       db $01,$11,$20,$31,$11,$21,$01,$22   ;0088ED|        |      ;
                       db $21,$0B,$1A,$3A,$00,$10,$23,$0B   ;0088F5|        |      ;
                       db $1C,$2C,$08,$29,$17,$02,$11,$22   ;0088FD|        |      ;
 
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
 
    PAL_sprite_trevor: db $10,$3F,$0F,$08,$26,$37,$0F,$0F   ;008982|        |      ;
                       db $22,$34,$0F,$0F,$0F,$0F,$0F,$0F   ;00898A|        |      ;
                       db $16,$25,$FF                       ;008992|        |      ;
 
     PAL_sprite_grant: db $10,$3F,$0F,$08,$15,$38,$0F,$0F   ;008995|        |      ;
                       db $22,$34,$0F,$0F,$0F,$0F,$0F,$0F   ;00899D|        |      ;
                       db $16,$25,$FF                       ;0089A5|        |      ;
 
    PAL_sprite_sympha: db $10,$3F,$0F,$21,$11,$20,$0F,$0F   ;0089A8|        |      ;
                       db $22,$34,$0F,$0F,$0F,$0F,$0F,$0F   ;0089B0|        |      ;
                       db $16,$25,$FF                       ;0089B8|        |      ;
 
   PAL_sprite_alucart: db $10,$3F,$0F,$0F,$15,$36,$0F,$0F   ;0089BB|        |      ;
                       db $22,$34,$0F,$0F,$0F,$0F,$0F,$0F   ;0089C3|        |      ;
                       db $16,$25,$FF                       ;0089CB|        |      ;
 
         DATA8_0089CE: db $0F,$32,$26,$0F,$20,$14,$26,$0F   ;0089CE|        |      ;
                       db $1B,$28,$0F,$1B,$0F,$13,$25,$0F   ;0089D6|        |      ;
                       db $17,$36,$0F,$15,$35,$0F,$00,$39   ;0089DE|        |      ;
                       db $0F,$13,$17,$0B,$2A,$39,$0B,$2A   ;0089E6|        |      ;
                       db $3B,$0F,$14,$32,$0F,$18,$28,$10   ;0089EE|        |      ;
                       db $00,$23,$0F,$08,$38,$02,$08,$38   ;0089F6|        |      ;
                       db $34,$00,$22,$16,$26,$20,$0F,$14   ;0089FE|        |      ;
                       db $35,$0F,$13,$25,$0F,$08,$38,$0F   ;008A06|        |      ;
                       db $04,$37,$0F,$00,$10,$07,$00,$10   ;008A0E|        |      ;
 
                       db $00,$10,$32,$0F,$17,$23           ;008A16|        |      ;
 
         DATA8_008A1C: db $A4,$19,$D0,$15,$20,$19,$E8,$A0   ;008A1C|        |      ;
                       db $00,$84,$46,$C8,$84,$47,$A9,$41   ;008A24|        |      ;
                       db $85,$4B,$A9,$00,$85,$6B,$E6,$19   ;008A2C|        |      ;
                       db $60,$88,$D0,$05,$E6,$19,$4C,$FD   ;008A34|        |      ;
                       db $EB,$88,$D0,$22,$E6,$19,$A0,$00   ;008A3C|        |      ;
                       db $A5,$32,$20,$1A,$8B,$A0,$02,$A5   ;008A44|        |      ;
                       db $33,$20,$1A,$8B,$A0,$04,$A5,$34   ;008A4C|        |      ;
                       db $20,$1A,$8B,$A0,$06,$AD,$4E,$05   ;008A54|        |      ;
                       db $20,$1A,$8B,$4C,$32,$8B,$A5,$26   ;008A5C|        |      ;
                       db $29,$10,$D0,$78,$A5,$26,$29,$20   ;008A64|        |      ;
                       db $F0,$0E,$A4,$6B,$C8,$C0,$04,$D0   ;008A6C|        |      ;
                       db $02,$A0,$00,$84,$6B,$4C,$42,$8A   ;008A74|        |      ;
                       db $A5,$26,$29,$80,$F0,$26,$A4,$6B   ;008A7C|        |      ;
                       db $F0,$1D,$88,$F0,$15,$88,$F0,$0D   ;008A84|        |      ;
                       db $AC,$4E,$05,$C8,$98,$29,$03,$8D   ;008A8C|        |      ;
                       db $4E,$05,$4C,$42,$8A,$E6,$34,$4C   ;008A94|        |      ;
                       db $42,$8A,$E6,$33,$4C,$42,$8A,$E6   ;008A9C|        |      ;
                       db $32,$4C,$42,$8A,$A5,$26,$29,$40   ;008AA4|        |      ;
                       db $F0,$94,$A4,$6B,$F0,$25,$88,$F0   ;008AAC|        |      ;
                       db $19,$88,$F0,$0D,$AC,$4E,$05,$88   ;008AB4|        |      ;
                       db $98,$29,$03,$8D,$4E,$05,$4C,$42   ;008ABC|        |      ;
                       db $8A,$A5,$34,$F0,$02,$C6,$34,$4C   ;008AC4|        |      ;
                       db $42,$8A,$A5,$33,$F0,$02,$C6,$33   ;008ACC|        |      ;
                       db $4C,$42,$8A,$A5,$32,$F0,$02,$C6   ;008AD4|        |      ;
                       db $32,$4C,$42,$8A,$20,$19,$E8,$20   ;008ADC|        |      ;
                       db $84,$E6,$A9,$00,$85,$39,$AD,$4E   ;008AE4|        |      ;
                       db $05,$D0,$06,$A0,$00,$A9,$FF,$D0   ;008AEC|        |      ;
                       db $02,$A0,$01,$84,$3B,$85,$3A,$A9   ;008AF4|        |      ;
                       db $04,$85,$18,$A9,$00,$85,$2A,$60   ;008AFC|        |      ;
                       db $0E,$8B,$10,$8B,$0A,$8B,$60,$70   ;008B04|        |      ;
                       db $80,$90,$30,$88,$A4,$BC,$90,$21   ;008B0C|        |      ;
                       db $D0,$21,$10,$22,$50,$22,$85,$08   ;008B14|        |      ;
                       db $B9,$12,$8B,$85,$61,$B9,$13,$8B   ;008B1C|        |      ;
                       db $85,$62,$20,$FC,$E8               ;008B24|        |      ;
 
         DATA8_008B29: db $A9,$58,$8D,$38,$04,$A0,$02,$D0   ;008B29|        |      ;
                       db $07,$A9,$70,$8D,$38,$04,$A0,$04   ;008B31|        |      ;
                       db $B9,$04,$8B,$85,$08,$B9,$05,$8B   ;008B39|        |      ;
                       db $85,$09,$A4,$6B,$B1,$08,$8D,$1C   ;008B41|        |      ;
                       db $04,$A9,$00,$8D,$8C,$04,$A9,$40   ;008B49|        |      ;
                       db $8D,$00,$04,$60                   ;008B51|        |      ;
 
         DATA8_008B55: db $A9,$CB,$8D,$1C,$04,$A0,$00,$B9   ;008B55|        |      ;
                       db $04,$8B,$85,$08,$B9,$05,$8B,$85   ;008B5D|        |      ;
                       db $09,$A4,$6B,$B1,$08,$8D,$38,$04   ;008B65|        |      ;
                       db $4C,$4A,$8B                       ;008B6D|        |      ;
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
                       STA.B r_index                        ;008B8D|8510    |000010;
                       LDA.W PTR16_008BD2,Y                 ;008B8F|B9D28B  |008BD2;
                       STA.B r_collisionPointYinScreen      ;008B92|8511    |000011;
                       LDY.B $B4                            ;008B94|A4B4    |0000B4;
                       LDA.B (r_index),Y                    ;008B96|B110    |000010;
                       CMP.B #$FF                           ;008B98|C9FF    |      ;
                       BEQ CODE_008B7C                      ;008B9A|F0E0    |008B7C;
 
          CODE_008B9C: STA.B r_collisionPointXvalDiv32      ;008B9C|8512    |000012;
                       JSR.W CODE_008BA2                    ;008B9E|20A28B  |008BA2;
                       RTS                                  ;008BA1|60      |      ;
 
 
          CODE_008BA2: LDA.B #$02                           ;008BA2|A902    |      ;
                       STA.B $00                            ;008BA4|8500    |000000;
                       LDA.B r_15                           ;008BA6|A515    |000015;
 
          CODE_008BA8: CLC                                  ;008BA8|18      |      ;
                       ADC.B #$04                           ;008BA9|6904    |      ;
                       TAX                                  ;008BAB|AA      |      ;
                       LDA.B #$04                           ;008BAC|A904    |      ;
                       STA.B r_collisionPointAbsoluteXInRoom;008BAE|8513    |000013;
 
          CODE_008BB0: LDA.B #$03                           ;008BB0|A903    |      ;
                       STA.B r_collisionPointAbsoluteXRoom  ;008BB2|8514    |000014;
 
          CODE_008BB4: LDA.W r_VramQueue,X                  ;008BB4|BD0003  |000300;
                       CLC                                  ;008BB7|18      |      ;
                       ADC.B r_collisionPointXvalDiv32      ;008BB8|6512    |000012;
                       BPL CODE_008BBE                      ;008BBA|1002    |008BBE;
                       LDA.B #$0F                           ;008BBC|A90F    |      ;
 
          CODE_008BBE: STA.W r_VramQueue,X                  ;008BBE|9D0003  |000300;
                       INX                                  ;008BC1|E8      |      ;
                       DEC.B r_collisionPointAbsoluteXRoom  ;008BC2|C614    |000014;
                       BNE CODE_008BB4                      ;008BC4|D0EE    |008BB4;
                       INX                                  ;008BC6|E8      |      ;
                       DEC.B r_collisionPointAbsoluteXInRoom;008BC7|C613    |000013;
                       BNE CODE_008BB0                      ;008BC9|D0E5    |008BB0;
                       TXA                                  ;008BCB|8A      |      ;
                       DEC.B $00                            ;008BCC|C600    |000000;
                       BNE CODE_008BA8                      ;008BCE|D0D8    |008BA8;
                       RTS                                  ;008BD0|60      |      ;
 
 
         PTR16_008BD1: dw DATA8_008BDC                      ;008BD1|        |008BDC;
 
                       dw DATA8_008BD5                      ;008BD3|        |008BD5;
 
         DATA8_008BD5: db $00,$C0,$D0,$E0,$F0,$00,$FF       ;008BD5|        |      ;
 
         DATA8_008BDC: db $00,$00,$F0,$E0,$D0,$C0,$FF       ;008BDC|        |      ;
 
          CODE_008BE3: LDX.B #$01                           ;008BE3|A201    |      ;
                       LDY.B #$00                           ;008BE5|A000    |      ;
                       LDA.B #$03                           ;008BE7|A903    |      ;
                       STA.B $00                            ;008BE9|8500    |000000;
                       CLC                                  ;008BEB|18      |      ;
 
          CODE_008BEC: LDA.W r_scoreLo,Y                    ;008BEC|B93600  |000036;
 
                       JSR.W CODE_008C6D                    ;008BEF|206D8C  |008C6D;
                       STA.W r_scoreLo,Y                    ;008BF2|993600  |000036;
                       INY                                  ;008BF5|C8      |      ;
                       INX                                  ;008BF6|E8      |      ;
                       DEC.B $00                            ;008BF7|C600    |000000;
                       BNE CODE_008BEC                      ;008BF9|D0F1    |008BEC;
                       BCC CODE_008C06                      ;008BFB|9009    |008C06;
                       LDA.B #$99                           ;008BFD|A999    |      ;
                       STA.B r_scoreLo                      ;008BFF|8536    |000036;
 
                       STA.B r_scoreMid                     ;008C01|8537    |000037;
                       STA.B r_scoreHi                      ;008C03|8538    |000038;
 
          CODE_008C05: RTS                                  ;008C05|60      |      ;
 
 
          CODE_008C06: LDA.B r_scoreHi                      ;008C06|A538    |000038;
                       CMP.B r_score4ExtraLive              ;008C08|C53E    |00003E;
                       BCC CODE_008C05                      ;008C0A|90F9    |008C05;
                       LDX.B #$05                           ;008C0C|A205    |      ;
                       LDA.B r_score4ExtraLive              ;008C0E|A53E    |00003E;
                       CLC                                  ;008C10|18      |      ;
                       JSR.W CODE_008C69                    ;008C11|20698C  |008C69;
                       BCC CODE_008C18                      ;008C14|9002    |008C18;
                       LDA.B #$FF                           ;008C16|A9FF    |      ;
 
          CODE_008C18: STA.B r_score4ExtraLive              ;008C18|853E    |00003E;
 
          CODE_008C1A: LDX.B #$01                           ;008C1A|A201    |      ;
                       LDA.B r_lifes                        ;008C1C|A535    |000035;
 
                       CLC                                  ;008C1E|18      |      ;
                       JSR.W CODE_008C69                    ;008C1F|20698C  |008C69;
                       BCS CODE_008C2E                      ;008C22|B00A    |008C2E;
                       STA.B r_lifes                        ;008C24|8535    |000035;
                       LDA.B #$4B                           ;008C26|A94B    |      ;
                       db $20                               ;008C28|        |      ;
                       dw initFreezWaterEffect_01           ;008C29|        |0FE25F;
                       JSR.W CODE_008E3C                    ;008C2B|203C8E  |008E3C;
 
          CODE_008C2E: RTS                                  ;008C2E|60      |      ;
 
 
          CODE_008C2F: STA.B $00                            ;008C2F|8500    |000000;
                       LDA.B r_hearts                       ;008C31|A584    |000084;
                       AND.B #$0F                           ;008C33|290F    |      ;
                       STA.B $01                            ;008C35|8501    |000001;
                       LDA.B r_hearts                       ;008C37|A584    |000084;
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
 
                       STA.B r_hearts                       ;008C56|8584    |000084;
                       RTS                                  ;008C58|60      |      ;
 
 
          CODE_008C59: LDA.B r_hearts                       ;008C59|A584    |000084;
                       CLC                                  ;008C5B|18      |      ;
                       JSR.W CODE_008C69                    ;008C5C|20698C  |008C69;
                       BCS CODE_008C64                      ;008C5F|B003    |008C64;
                       STA.B r_hearts                       ;008C61|8584    |000084;
                       RTS                                  ;008C63|60      |      ;
 
 
          CODE_008C64: LDA.B #$99                           ;008C64|A999    |      ;
                       STA.B r_hearts                       ;008C66|8584    |000084;
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
                       STA.B r_VRAM_QueueDest               ;008C9D|8561    |000061;
                       LDA.B r_hearts                       ;008C9F|A584    |000084;
                       STA.B r_pointerQueue                 ;008CA1|8508    |000008;
                       db $4C                               ;008CA3|        |      ;
 
                       dw CODE_0FE8FC                       ;008CA4|        |0FE8FC;
 
          CODE_008CA6: LDA.B #$20                           ;008CA6|A920    |      ;
                       STA.B $62                            ;008CA8|8562    |000062;
                       LDA.B #$67                           ;008CAA|A967    |      ;
                       STA.B r_VRAM_QueueDest               ;008CAC|8561    |000061;
                       LDA.B r_HUD_healthPlayer             ;008CAE|A53C    |00003C;
                       STA.B r_pointerQueue                 ;008CB0|8508    |000008;
                       LDA.B #$83                           ;008CB2|A983    |      ;
                       STA.B r_temp_Xpos                    ;008CB4|850A    |00000A;
                       LDA.B #$84                           ;008CB6|A984    |      ;
                       STA.B $0B                            ;008CB8|850B    |00000B;
                       JSR.W DATA8_008CD1                   ;008CBA|20D18C  |008CD1;
 
                       LDA.B #$20                           ;008CBD|A920    |      ;
                       STA.B $62                            ;008CBF|8562    |000062;
                       LDA.B #$87                           ;008CC1|A987    |      ;
                       STA.B r_VRAM_QueueDest               ;008CC3|8561    |000061;
                       LDA.B r_HUD_healthBoss               ;008CC5|A53D    |00003D;
                       STA.B r_pointerQueue                 ;008CC7|8508    |000008;
 
                       LDA.B #$93                           ;008CC9|A993    |      ;
 
                       STA.B r_temp_Xpos                    ;008CCB|850A    |00000A;
 
                       LDA.B #$94                           ;008CCD|A994    |      ;
                       STA.B $0B                            ;008CCF|850B    |00000B;
 
         DATA8_008CD1: db $20                               ;008CD1|        |      ;
                       dw CODE_0FE8B5                       ;008CD2|        |0FE8B5;
                       LDA.B #$08                           ;008CD4|A908    |      ;
                       STA.B $09                            ;008CD6|8509    |000009;
 
          CODE_008CD8: LDA.B r_pointerQueue                 ;008CD8|A508    |000008;
                       BEQ CODE_008D0D                      ;008CDA|F031    |008D0D;
                       CMP.B #$08                           ;008CDC|C908    |      ;
                       BCC CODE_008CF3                      ;008CDE|9013    |008CF3;
                       LDA.B r_temp_Xpos                    ;008CE0|A50A    |00000A;
                       STA.W r_VramQueue,X                  ;008CE2|9D0003  |000300;
 
                       INX                                  ;008CE5|E8      |      ;
                       LDA.B r_pointerQueue                 ;008CE6|A508    |000008;
                       SEC                                  ;008CE8|38      |      ;
                       SBC.B #$08                           ;008CE9|E908    |      ;
                       STA.B r_pointerQueue                 ;008CEB|8508    |000008;
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
 
          CODE_008D03: LDA.B r_temp_Xpos                    ;008D03|A50A    |00000A;
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
                       STX.B r_sceneDrawQueue               ;008D1E|861D    |00001D;
                       RTS                                  ;008D20|60      |      ;
 
 
          CODE_008D21: LDA.B #$20                           ;008D21|A920    |      ;
                       STA.B $62                            ;008D23|8562    |000062;
                       LDA.B #$52                           ;008D25|A952    |      ;
                       STA.B r_VRAM_QueueDest               ;008D27|8561    |000061;
                       LDA.B r_lvlTimerHi                   ;008D29|A57F    |00007F;
                       STA.B r_pointerQueue                 ;008D2B|8508    |000008;
                       db $20                               ;008D2D|        |      ;
                       dw CODE_0FE8FC                       ;008D2E|        |0FE8FC;
 
                       INC.B r_VRAM_QueueDest               ;008D30|E661    |000061;
                       INC.B r_VRAM_QueueDest               ;008D32|E661    |000061;
                       LDA.B r_lvlTimerLo                   ;008D34|A57E    |00007E;
                       STA.B r_pointerQueue                 ;008D36|8508    |000008;
                       db $4C                               ;008D38|        |      ;
 
                       dw CODE_0FE8FC                       ;008D39|        |0FE8FC;
 
          CODE_008D3B: LDA.B #$20                           ;008D3B|A920    |      ;
                       STA.B $62                            ;008D3D|8562    |000062;
                       LDA.B #$46                           ;008D3F|A946    |      ;
                       STA.B r_VRAM_QueueDest               ;008D41|8561    |000061;
                       LDA.B r_scoreHi                      ;008D43|A538    |000038;
                       STA.B r_pointerQueue                 ;008D45|8508    |000008;
                       db $20                               ;008D47|        |      ;
                       dw CODE_0FE8FC                       ;008D48|        |0FE8FC;
                       INC.B r_VRAM_QueueDest               ;008D4A|E661    |000061;
                       INC.B r_VRAM_QueueDest               ;008D4C|E661    |000061;
                       LDA.B r_scoreMid                     ;008D4E|A537    |000037;
                       STA.B r_pointerQueue                 ;008D50|8508    |000008;
                       db $20                               ;008D52|        |      ;
                       dw CODE_0FE8FC                       ;008D53|        |0FE8FC;
                       INC.B r_VRAM_QueueDest               ;008D55|E661    |000061;
                       INC.B r_VRAM_QueueDest               ;008D57|E661    |000061;
                       LDA.B r_scoreLo                      ;008D59|A536    |000036;
                       STA.B r_pointerQueue                 ;008D5B|8508    |000008;
                       db $4C                               ;008D5D|        |      ;
 
                       dw CODE_0FE8FC                       ;008D5E|        |0FE8FC;
 
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
                       LDX.B r_roomOrientation              ;008D88|A668    |000068;
                       BPL CODE_008D8F                      ;008D8A|1003    |008D8F;
 
                       SEC                                  ;008D8C|38      |      ;
                       SBC.B #$04                           ;008D8D|E904    |      ;
 
          CODE_008D8F: STA.W $0434                          ;008D8F|8D3404  |000434;
                       STA.W $0435                          ;008D92|8D3504  |000435;
                       RTS                                  ;008D95|60      |      ;
 
 
          CODE_008D96: LDA.B r_stage                        ;008D96|A532    |000032;
                       ASL A                                ;008D98|0A      |      ;
                       TAY                                  ;008D99|A8      |      ;
                       LDA.W PTR16_008DCF,Y                 ;008D9A|B9CF8D  |008DCF;
                       STA.B r_pointerQueue                 ;008D9D|8508    |000008;
                       LDA.W PTR16_008DD0,Y                 ;008D9F|B9D08D  |008DD0;
                       STA.B $09                            ;008DA2|8509    |000009;
                       LDA.B #$20                           ;008DA4|A920    |      ;
                       STA.B $62                            ;008DA6|8562    |000062;
                       LDA.B #$5B                           ;008DA8|A95B    |      ;
                       STA.B r_VRAM_QueueDest               ;008DAA|8561    |000061;
                       db $20                               ;008DAC|        |      ;
                       dw CODE_0FE8B5                       ;008DAD|        |0FE8B5;
                       LDY.B #$00                           ;008DAF|A000    |      ;
                       LDA.B (r_pointerQueue),Y             ;008DB1|B108    |000008;
                       STA.W r_VramQueue,X                  ;008DB3|9D0003  |000300;
                       db $20                               ;008DB6|        |      ;
                       dw CODE_0FE8DD                       ;008DB7|        |0FE8DD;
 
                       LDA.B #$20                           ;008DB9|A920    |      ;
                       STA.B $62                            ;008DBB|8562    |000062;
                       LDA.B #$5E                           ;008DBD|A95E    |      ;
                       STA.B r_VRAM_QueueDest               ;008DBF|8561    |000061;
                       db $20                               ;008DC1|        |      ;
                       dw CODE_0FE8B5                       ;008DC2|        |0FE8B5;
 
                       LDY.B r_blockLevel                   ;008DC4|A433    |000033;
                       INY                                  ;008DC6|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;008DC7|B108    |000008;
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
 
         DATA8_008DF2: db $43,$42,$43,$44,$45,$46,$47       ;008DF2|        |      ;
 
         DATA8_008DF9: db $44,$41,$42,$43,$44,$45           ;008DF9|        |      ;
 
         DATA8_008DFF: db $45,$50,$51,$52,$53,$54           ;008DFF|        |      ;
 
         DATA8_008E05: db $46,$50,$51,$52                   ;008E05|        |      ;
 
         DATA8_008E09: db $47,$50,$51,$52,$53               ;008E09|        |      ;
 
         DATA8_008E0E: db $45,$42,$43,$44                   ;008E0E|        |      ;
 
         DATA8_008E12: db $46,$42,$43,$44,$45,$46,$47,$48   ;008E12|        |      ;
 
         DATA8_008E1A: db $47,$42,$43,$44,$45,$46           ;008E1A|        |      ;
 
         DATA8_008E20: db $47,$42,$43                       ;008E20|        |      ;
 
         DATA8_008E23: db $48,$42,$43,$44,$45,$46,$47,$48   ;008E23|        |      ;
 
         DATA8_008E2B: db $48,$50,$51,$52                   ;008E2B|        |      ;
 
         DATA8_008E2F: db $49,$42,$43,$44                   ;008E2F|        |      ;
 
         DATA8_008E33: db $4A,$42,$43,$44,$45               ;008E33|        |      ;
 
         DATA8_008E38: db $50,$42,$43,$44                   ;008E38|        |      ;
 
          CODE_008E3C: LDA.B #$20                           ;008E3C|A920    |      ;
                       STA.B $62                            ;008E3E|8562    |000062;
                       LDA.B #$97                           ;008E40|A997    |      ;
                       STA.B r_VRAM_QueueDest               ;008E42|8561    |000061;
                       LDY.B r_lifes                        ;008E44|A435    |000035;
                       STY.B r_pointerQueue                 ;008E46|8408    |000008;
                       db $4C                               ;008E48|        |      ;
 
                       dw CODE_0FE8FC                       ;008E49|        |0FE8FC;
 
          CODE_008E4B: LDA.B r_partnerIdx                   ;008E4B|A53B    |00003B;
                       EOR.B #$01                           ;008E4D|4901    |      ;
                       TAY                                  ;008E4F|A8      |      ;
                       LDA.W r_039,Y                        ;008E50|B93900  |000039;
                       BMI CODE_008E5C                      ;008E53|3007    |008E5C;
                       TAY                                  ;008E55|A8      |      ;
                       LDA.W DATA8_008E5D,Y                 ;008E56|B95D8E  |008E5D;
                       db $20                               ;008E59|        |      ;
                       dw screenLoadRoutine                 ;008E5A|        |0FECE9;
 
          CODE_008E5C: RTS                                  ;008E5C|60      |      ;
 
 
         DATA8_008E5D: db $0F,$10,$11,$12                   ;008E5D|        |      ;
 
          CODE_008E61: JSR.W CODE_008E92                    ;008E61|20928E  |008E92;
                       LDY.B r_partnerIdx                   ;008E64|A43B    |00003B;
 
                       LDA.W r_subweapMultiplier,Y          ;008E66|B98700  |000087;
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
                       LDX.B r_roomOrientation              ;008E87|A668    |000068;
                       BPL CODE_008E8E                      ;008E89|1003    |008E8E;
                       SEC                                  ;008E8B|38      |      ;
 
                       SBC.B #$04                           ;008E8C|E904    |      ;
 
          CODE_008E8E: STA.W $0435                          ;008E8E|8D3504  |000435;
                       RTS                                  ;008E91|60      |      ;
 
 
          CODE_008E92: LDY.B r_partnerIdx                   ;008E92|A43B    |00003B;
                       LDA.W r_subweap,Y                    ;008E94|B98500  |000085;
                       ASL A                                ;008E97|0A      |      ;
                       ASL A                                ;008E98|0A      |      ;
                       CLC                                  ;008E99|18      |      ;
                       ADC.W r_subweap,Y                    ;008E9A|798500  |000085;
                       TAY                                  ;008E9D|A8      |      ;
                       LDA.W DATA8_008ECF,Y                 ;008E9E|B9CF8E  |008ECF;
                       STA.W $0418                          ;008EA1|8D1804  |000418;
                       LDA.W DATA8_008ED0,Y                 ;008EA4|B9D08E  |008ED0;
 
                       STA.W $04A4                          ;008EA7|8DA404  |0004A4;
                       LDA.W DATA8_008ED1,Y                 ;008EAA|B9D18E  |008ED1;
                       STA.W $0450                          ;008EAD|8D5004  |000450;
                       LDA.W DATA8_008ED2,Y                 ;008EB0|B9D28E  |008ED2;
                       LDX.B r_roomOrientation              ;008EB3|A668    |000068;
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
 
         DATA8_008ED3: db $00,$46,$00,$90,$24,$00,$42,$00   ;008ED3|        |      ;
                       db $90,$24,$00,$4E,$00,$90,$24,$00   ;008EDB|        |      ;
                       db $50,$00,$90,$24,$00,$52,$02,$90   ;008EE3|        |      ;
                       db $24,$03,$54,$02,$90,$24,$00,$4E   ;008EEB|        |      ;
                       db $02,$90,$24,$00,$4E,$00,$90,$24   ;008EF3|        |      ;
                       db $00,$46,$00,$90,$24,$00,$50,$00   ;008EFB|        |      ;
 
                       db $90,$24,$00,$68,$0E,$90,$24,$00   ;008F03|        |      ;
 
          CODE_008F0B: LDA.B r_rosseryFlashTimer            ;008F0B|A5B2    |0000B2;
                       BEQ CODE_008F35                      ;008F0D|F026    |008F35;
                       DEC.B r_rosseryFlashTimer            ;008F0F|C6B2    |0000B2;
                       BEQ CODE_008F19                      ;008F11|F006    |008F19;
                       LDA.B r_rosseryFlashTimer            ;008F13|A5B2    |0000B2;
 
                       AND.B #$03                           ;008F15|2903    |      ;
                       BEQ CODE_008F1F                      ;008F17|F006    |008F1F;
 
          CODE_008F19: JSR.W CODE_00859E                    ;008F19|209E85  |00859E;
                       JMP.W CODE_008F4E                    ;008F1C|4C4E8F  |008F4E;
 
 
          CODE_008F1F: JSR.W CODE_00859E                    ;008F1F|209E85  |00859E;
 
                       LDX.B r_sceneDrawQueue               ;008F22|A61D    |00001D;
                       LDA.B #$20                           ;008F24|A920    |      ;
                       STA.W $02E7,X                        ;008F26|9DE702  |0002E7;
                       STA.W $02EB,X                        ;008F29|9DEB02  |0002EB;
 
                       STA.W $02EF,X                        ;008F2C|9DEF02  |0002EF;
                       STA.W $02F3,X                        ;008F2F|9DF302  |0002F3;
                       JMP.W CODE_008F4E                    ;008F32|4C4E8F  |008F4E;
 
 
          CODE_008F35: LDA.B r_potionTimer                  ;008F35|A5AD    |0000AD;
                       BEQ CODE_008F4E                      ;008F37|F015    |008F4E;
                       LDA.B r_gameStateLoopCounter         ;008F39|A51A    |00001A;
                       AND.B #$01                           ;008F3B|2901    |      ;
                       BEQ CODE_008F43                      ;008F3D|F004    |008F43;
                       DEC.B r_potionTimer                  ;008F3F|C6AD    |0000AD;
                       BEQ CODE_008F19                      ;008F41|F0D6    |008F19;
 
          CODE_008F43: LDA.B r_potionTimer                  ;008F43|A5AD    |0000AD;
                       AND.B #$01                           ;008F45|2901    |      ;
                       BEQ CODE_008F4B                      ;008F47|F002    |008F4B;
                       BNE CODE_008F19                      ;008F49|D0CE    |008F19;
 
          CODE_008F4B: JSR.W CODE_0085A4                    ;008F4B|20A485  |0085A4;
 
          CODE_008F4E: LDA.B r_gameStateLoopCounter         ;008F4E|A51A    |00001A;
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
 
 
          CODE_008F80: JSR.W CODE_00907F                    ;008F80|207F90  |00907F;
                       LDA.B #$00                           ;008F83|A900    |      ;
                       STA.B r_scoreLo                      ;008F85|8536    |000036;
                       STA.B r_scoreMid                     ;008F87|8537    |000037;
                       STA.B r_scoreHi                      ;008F89|8538    |000038;
                       LDY.B r_02e                          ;008F8B|A42E    |00002E;
                       LDA.W DATA8_008F9E,Y                 ;008F8D|B99E8F  |008F9E;
                       AND.B #$0F                           ;008F90|290F    |      ;
 
                       STA.B r_blockLevel                   ;008F92|8533    |000033;
                       LDA.W DATA8_008F9E,Y                 ;008F94|B99E8F  |008F9E;
 
                       LSR A                                ;008F97|4A      |      ;
                       LSR A                                ;008F98|4A      |      ;
                       LSR A                                ;008F99|4A      |      ;
                       LSR A                                ;008F9A|4A      |      ;
                       STA.B r_stage                        ;008F9B|8532    |000032;
                       RTS                                  ;008F9D|60      |      ;
 
 
         DATA8_008F9E: db $00,$10,$13,$20,$21,$30,$40,$50   ;008F9E|        |      ;
                       db $60,$70,$75,$80,$90,$A0,$B0,$C0   ;008FA6|        |      ;
                       db $D0,$E0                           ;008FAE|        |      ;
 
          CODE_008FB0: LDA.B r_stage                        ;008FB0|A532    |000032;
                       ASL A                                ;008FB2|0A      |      ;
                       CLC                                  ;008FB3|18      |      ;
                       ADC.B r_stage                        ;008FB4|6532    |000032;
                       TAY                                  ;008FB6|A8      |      ;
                       LDA.W DATA8_008FD1,Y                 ;008FB7|B9D18F  |008FD1;
                       CMP.B r_blockLevel                   ;008FBA|C533    |000033;
                       BCS CODE_008FBF                      ;008FBC|B001    |008FBF;
                       INY                                  ;008FBE|C8      |      ;
 
          CODE_008FBF: LDA.W DATA8_008FD2,Y                 ;008FBF|B9D28F  |008FD2;
                       CMP.B #$03                           ;008FC2|C903    |      ;
                       BEQ CODE_008FC9                      ;008FC4|F003    |008FC9;
 
          CODE_008FC6: STA.B r_02e                          ;008FC6|852E    |00002E;
                       RTS                                  ;008FC8|60      |      ;
 
 
          CODE_008FC9: LDY.B r_GrantDefeated                ;008FC9|A42F    |00002F;
                       BEQ CODE_008FC6                      ;008FCB|F0F9    |008FC6;
                       LDA.B #$04                           ;008FCD|A904    |      ;
                       BNE CODE_008FC6                      ;008FCF|D0F5    |008FC6;
 
         DATA8_008FD1: db $10                               ;008FD1|        |      ;
 
         DATA8_008FD2: db $00,$00,$02,$01,$02,$10,$03,$04   ;008FD2|        |      ;
                       db $10,$05,$05,$10,$06,$06,$10,$07   ;008FDA|        |      ;
                       db $07,$10,$08,$08,$04,$09,$0A,$10   ;008FE2|        |      ;
                       db $0B,$0B,$10,$0C,$0C,$10,$0D,$0D   ;008FEA|        |      ;
                       db $10,$0E,$0E,$10,$0F,$0F,$10,$10   ;008FF2|        |      ;
                       db $10,$10,$11,$11                   ;008FFA|        |      ;
 
          CODE_008FFE: LDY.B #$00                           ;008FFE|A000    |      ;
 
                       JSR.W bonusNameCheckCS               ;009000|203190  |009031;
                       BCS CODE_00902E                      ;009003|B029    |00902E;
 
          CODE_009005: LDY.B #$02                           ;009005|A002    |      ;
                       JSR.W bonusNameCheckCS               ;009007|203190  |009031;
                       BCS CODE_00902B                      ;00900A|B01F    |00902B;
                       LDY.B #$04                           ;00900C|A004    |      ;
                       JSR.W bonusNameCheckCS               ;00900E|203190  |009031;
                       BCS CODE_009022                      ;009011|B00F    |009022;
                       LDY.B #$06                           ;009013|A006    |      ;
                       JSR.W bonusNameCheckCS               ;009015|203190  |009031;
 
                       BCS CODE_009025                      ;009018|B00B    |009025;
                       LDY.B #$08                           ;00901A|A008    |      ;
                       JSR.W bonusNameCheckCS               ;00901C|203190  |009031;
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
 
 
     bonusNameCheckCS: LDA.W extraNameCheckLo,Y             ;009031|B94D90  |00904D;
 
                       STA.B r_pointerQueue                 ;009034|8508    |000008;
                       LDA.W extraNameCheckHi,Y             ;009036|B94E90  |00904E;
                       STA.B $09                            ;009039|8509    |000009;
                       LDY.B #$00                           ;00903B|A000    |      ;
 
          CODE_00903D: LDA.W $07F8,Y                        ;00903D|B9F807  |0007F8;
                       CMP.B (r_pointerQueue),Y             ;009040|D108    |000008;
                       BNE CODE_00904B                      ;009042|D007    |00904B;
                       INY                                  ;009044|C8      |      ;
                       CPY.B #$08                           ;009045|C008    |      ;
                       BNE CODE_00903D                      ;009047|D0F4    |00903D;
                       SEC                                  ;009049|38      |      ;
                       RTS                                  ;00904A|60      |      ;
 
 
          CODE_00904B: CLC                                  ;00904B|18      |      ;
                       RTS                                  ;00904C|60      |      ;
 
 
     extraNameCheckLo: dw DATA8_009057                      ;00904D|        |009057;
                       dw DATA8_00905F                      ;00904F|        |00905F;
                       dw DATA8_009067                      ;009051|        |009067;
                       dw DATA8_00906F                      ;009053|        |00906F;
                       dw DATA8_009077                      ;009055|        |009077;
 
         DATA8_009057: db $57,$54,$5B,$5F,$00,$5C,$54,$00   ;009057|        |      ;
 
         DATA8_00905F: db $50,$5A,$50,$5C,$50,$00,$00,$00   ;00905F|        |      ;
 
         DATA8_009067: db $5E,$5A,$64,$53,$50,$00,$00,$00   ;009067|        |      ;
 
         DATA8_00906F: db $64,$61,$50,$63,$50,$00,$00,$00   ;00906F|        |      ;
 
         DATA8_009077: db $55,$64,$59,$58,$5C,$5E,$63,$5E   ;009077|        |      ;
 
          CODE_00907F: LDA.B #$B0                           ;00907F|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;009081|85FF    |0000FF;
                       JSR.W setDefaultCHR                  ;009083|20CD90  |0090CD;
                       JSR.W startingStats                  ;009086|20C090  |0090C0;
                       LDA.B #$02                           ;009089|A902    |      ;
 
                       STA.B r_score4ExtraLive              ;00908B|853E    |00003E;
                       JSR.W CODE_008FFE                    ;00908D|20FE8F  |008FFE;
                       BCC CODE_0090B7                      ;009090|9025    |0090B7;
                       DEY                                  ;009092|88      |      ;
                       BEQ CODE_0090BC                      ;009093|F027    |0090BC;
                       DEY                                  ;009095|88      |      ;
                       BEQ CODE_0090B2                      ;009096|F01A    |0090B2;
 
                       LDA.B r_partner                      ;009098|A53A    |00003A;
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
 
          CODE_0090AE: STA.B r_partner                      ;0090AE|853A    |00003A;
                       BNE CODE_0090B7                      ;0090B0|D005    |0090B7;
 
          CODE_0090B2: LDA.B #$01                           ;0090B2|A901    |      ;
                       STA.W r_hardMode                     ;0090B4|8DF607  |0007F6;
 
          CODE_0090B7: LDA.B #$02                           ;0090B7|A902    |      ;
 
          CODE_0090B9: STA.B r_lifes                        ;0090B9|8535    |000035;
 
                       RTS                                  ;0090BB|60      |      ;
 
 
          CODE_0090BC: LDA.B #$10                           ;0090BC|A910    |      ;
                       BNE CODE_0090B9                      ;0090BE|D0F9    |0090B9;
 
        startingStats: LDA.B #$05                           ;0090C0|A905    |      ;
                       STA.B r_hearts                       ;0090C2|8584    |000084;
                       LDA.B #$40                           ;0090C4|A940    |      ;
                       STA.B r_HUD_healthPlayer             ;0090C6|853C    |00003C;
 
     bossHealthRefill: LDA.B #$40                           ;0090C8|A940    |      ;
                       STA.B r_HUD_healthBoss               ;0090CA|853D    |00003D;
                       RTS                                  ;0090CC|60      |      ;
 
 
        setDefaultCHR: LDA.B #$40                           ;0090CD|A940    |      ;
                       STA.B r_CHR_BankBG_0000              ;0090CF|854A    |00004A;
                       LDA.B #$43                           ;0090D1|A943    |      ;
                       STA.B r_CHR_BankBG_0c00              ;0090D3|854D    |00004D;
                       RTS                                  ;0090D5|60      |      ;
 
 
clearStopWatchActions: LDA.B #$00                           ;0090D6|A900    |      ;
                       STA.B r_stopWatchActive              ;0090D8|85AB    |0000AB;
                       STA.B r_stopWatchTimer               ;0090DA|85AC    |0000AC;
                       STA.W r_sound_musicStop              ;0090DC|8DC906  |0006C9;
                       STA.B r_bridgeTimer                  ;0090DF|85B3    |0000B3;
                       RTS                                  ;0090E1|60      |      ;
 
 
          CODE_0090E2: LDA.B #$B0                           ;0090E2|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;0090E4|85FF    |0000FF;
                       db $20                               ;0090E6|        |      ;
                       dw initClearScreen_clearIRQfunc      ;0090E7|        |0FE666;
                       JSR.W bossHealthRefill               ;0090E9|20C890  |0090C8;
                       LDA.B #$00                           ;0090EC|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;0090EE|8D0004  |000400;
                       STA.W $0418                          ;0090F1|8D1804  |000418;
                       STA.W $0419                          ;0090F4|8D1904  |000419;
                       STA.B r_074                          ;0090F7|8574    |000074;
                       STA.B r_075                          ;0090F9|8575    |000075;
                       STA.W r_Player_StateDoubled          ;0090FB|8D6505  |000565;
                       JSR.W clearStopWatchActions          ;0090FE|20D690  |0090D6;
                       db $20                               ;009101|        |      ;
                       dw CODE_0FE862                       ;009102|        |0FE862;
                       JMP.W CODE_009130                    ;009104|4C3091  |009130;
 
 
          CODE_009107: LDA.B #$00                           ;009107|A900    |      ;
                       STA.W r_entity_YposSpeed             ;009109|8D2005  |000520;
                       STA.W r_entity_YposSubSpeed          ;00910C|8D3705  |000537;
                       JSR.W clearStopWatchActions          ;00910F|20D690  |0090D6;
                       db $20                               ;009112|        |      ;
                       dw CODE_0FE862                       ;009113|        |0FE862;
                       BCS CODE_009130                      ;009115|B019    |009130;
 
          CODE_009117: LDA.W r_InstrumentsSoundIdxes        ;009117|AD0701  |000107;
                       CMP.B #$5F                           ;00911A|C95F    |      ;
                       BNE CODE_009122                      ;00911C|D004    |009122;
                       LDA.B #$00                           ;00911E|A900    |      ;
                       STA.B r_074                          ;009120|8574    |000074;
 
          CODE_009122: LDA.B #$B0                           ;009122|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;009124|85FF    |0000FF;
                       db $20                               ;009126|        |      ;
                       dw initClearScreen_clearIRQfunc      ;009127|        |0FE666;
                       LDA.B #$00                           ;009129|A900    |      ;
                       STA.B r_075                          ;00912B|8575    |000075;
                       JSR.W clearCollisionMap              ;00912D|207F91  |00917F;
 
          CODE_009130: JSR.W setDefaultCHR                  ;009130|20CD90  |0090CD;
                       LDA.B #$B0                           ;009133|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;009135|85FF    |0000FF;
                       LDA.W r_Player_StateDoubled          ;009137|AD6505  |000565;
                       AND.B #$7F                           ;00913A|297F    |      ;
                       STA.W r_Player_StateDoubled          ;00913C|8D6505  |000565;
                       LDA.B #$00                           ;00913F|A900    |      ;
                       STA.B r_bossActiveFlag               ;009141|8578    |000078;
                       STA.B r_invincableFrames             ;009143|8580    |000080;
                       STA.B r_defaultCHR                   ;009145|85B0    |0000B0;
                       STA.B r_rosseryFlashTimer            ;009147|85B2    |0000B2;
                       STA.B r_potionTimer                  ;009149|85AD    |0000AD;
                       STA.B r_autoPlay                     ;00914B|852C    |00002C;
                       STA.B r_floodStop                    ;00914D|85C0    |0000C0;
                       STA.B r_bossSecondFace               ;00914F|85C2    |0000C2;
                       STA.B r_horizontalScrollLockBridge   ;009151|85C8    |0000C8;
                       STA.B r_bossObject                   ;009153|85C1    |0000C1;
                       STA.B r_disablePlayer                ;009155|85C4    |0000C4;
                       STA.B $C5                            ;009157|85C5    |0000C5;
                       STA.B $CC                            ;009159|85CC    |0000CC;
                       STA.B $CD                            ;00915B|85CD    |0000CD;
                       STA.B r_bossSpecialHitbox            ;00915D|85BA    |0000BA;
                       db $20                               ;00915F|        |      ;
                       dw clearAllEntityButPlayer           ;009160|        |0FE7F7;
                       LDA.B #$00                           ;009162|A900    |      ;
                       STA.W $0417                          ;009164|8D1704  |000417;
                       STA.W $041A                          ;009167|8D1A04  |00041A;
                       STA.W $041B                          ;00916A|8D1B04  |00041B;
                       STA.W $048A                          ;00916D|8D8A04  |00048A;
                       STA.W $048B                          ;009170|8D8B04  |00048B;
                       LDX.B #$00                           ;009173|A200    |      ;
                       TXA                                  ;009175|8A      |      ;
 
          CODE_009176: STA.W r_soundModeSongSelected,X      ;009176|9D8007  |000780;
                       INX                                  ;009179|E8      |      ;
                       CPX.B #$43                           ;00917A|E043    |      ;
                       BNE CODE_009176                      ;00917C|D0F8    |009176;
                       RTS                                  ;00917E|60      |      ;
 
 
    clearCollisionMap: LDA.B #$00                           ;00917F|A900    |      ;
                       TAX                                  ;009181|AA      |      ;
 
          CODE_009182: STA.W r_collisionMap,X               ;009182|9DE006  |0006E0;
                       INX                                  ;009185|E8      |      ;
 
                       CPX.B #$90                           ;009186|E090    |      ;
                       BNE CODE_009182                      ;009188|D0F8    |009182;
                       RTS                                  ;00918A|60      |      ;
 
 
          CODE_00918B: LDA.B #$B0                           ;00918B|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;00918D|85FF    |0000FF;
                       db $20                               ;00918F|        |      ;
                       dw initClearScreen_clearIRQfunc      ;009190|        |0FE666;
                       JSR.W setDefaultCHR                  ;009192|20CD90  |0090CD;
                       db $20                               ;009195|        |      ;
                       dw unsetAutoPlayFlag                 ;009196|        |0FE5CA;
                       LDA.W r_entity_ObjectIdxes           ;009198|AD4E05  |00054E;
                       PHA                                  ;00919B|48      |      ;
                       LDA.B r_bossDragonKingHP             ;00919C|A5BD    |0000BD;
 
                       PHA                                  ;00919E|48      |      ;
                       LDA.B r_bossDragonMisc               ;00919F|A5BE    |0000BE;
                       PHA                                  ;0091A1|48      |      ;
                       db $20                               ;0091A2|        |      ;
 
                       dw clearZeroPage                     ;0091A3|        |0FE828;
                       PLA                                  ;0091A5|68      |      ;
                       STA.B r_bossDragonMisc               ;0091A6|85BE    |0000BE;
                       PLA                                  ;0091A8|68      |      ;
                       STA.B r_bossDragonKingHP             ;0091A9|85BD    |0000BD;
 
                       PLA                                  ;0091AB|68      |      ;
                       STA.W r_entity_ObjectIdxes           ;0091AC|8D4E05  |00054E;
                       JMP.W startingStats                  ;0091AF|4CC090  |0090C0;
 
 
          CODE_0091B2: LDA.B #$00                           ;0091B2|A900    |      ;
                       STA.B r_invincableFrames             ;0091B4|8580    |000080;
                       STA.W r_entity_Effect                ;0091B6|8D7004  |000470;
                       DEC.B r_timerGenerel                 ;0091B9|C630    |000030;
                       BNE CODE_0091CD                      ;0091BB|D010    |0091CD;
                       LDA.B $9F                            ;0091BD|A59F    |00009F;
                       STA.B r_gameTransition               ;0091BF|852A    |00002A;
                       LDA.W r_Player_StateDoubled          ;0091C1|AD6505  |000565;
                       AND.B #$7F                           ;0091C4|297F    |      ;
                       STA.W r_Player_StateDoubled          ;0091C6|8D6505  |000565;
                       LDA.B #$00                           ;0091C9|A900    |      ;
                       BEQ CODE_0091D1                      ;0091CB|F004    |0091D1;
 
          CODE_0091CD: LDA.B r_gameStateLoopCounter         ;0091CD|A51A    |00001A;
                       AND.B #$03                           ;0091CF|2903    |      ;
 
          CODE_0091D1: STA.W r_entity_PaletteOverride       ;0091D1|8D5404  |000454;
                       RTS                                  ;0091D4|60      |      ;
 
 
          CODE_0091D5: JSR.W DATA8_0091DD                   ;0091D5|20DD91  |0091DD;
                       LDA.B #$00                           ;0091D8|A900    |      ;
                       STA.B r_gameTransition               ;0091DA|852A    |00002A;
                       RTS                                  ;0091DC|60      |      ;
 
 
         DATA8_0091DD: db $20                               ;0091DD|        |      ;
                       dw swap2Bank_00_Plus                 ;0091DE|        |0FE795;
                       LDA.B r_stage                        ;0091E0|A532    |000032;
                       CMP.B #$03                           ;0091E2|C903    |      ;
                       BEQ CODE_009209                      ;0091E4|F023    |009209;
                       CMP.B #$0A                           ;0091E6|C90A    |      ;
                       BEQ CODE_009201                      ;0091E8|F017    |009201;
                       CMP.B #$0E                           ;0091EA|C90E    |      ;
                       BEQ CODE_0091FB                      ;0091EC|F00D    |0091FB;
 
          CODE_0091EE: JSR.W startingStats                  ;0091EE|20C090  |0090C0;
 
          CODE_0091F1: LDA.B #$00                           ;0091F1|A900    |      ;
                       STA.W r_Player_StateDoubled          ;0091F3|8D6505  |000565;
                       STA.B r_075                          ;0091F6|8575    |000075;
                       STA.B r_074                          ;0091F8|8574    |000074;
                       RTS                                  ;0091FA|60      |      ;
 
 
          CODE_0091FB: LDA.B r_blockLevel                   ;0091FB|A533    |000033;
                       BEQ CODE_0091EE                      ;0091FD|F0EF    |0091EE;
                       BNE CODE_00920F                      ;0091FF|D00E    |00920F;
 
          CODE_009201: LDA.B r_blockLevel                   ;009201|A533    |000033;
                       CMP.B #$04                           ;009203|C904    |      ;
                       BEQ CODE_00920F                      ;009205|F008    |00920F;
                       BNE CODE_0091EE                      ;009207|D0E5    |0091EE;
 
          CODE_009209: LDA.B r_blockLevel                   ;009209|A533    |000033;
                       CMP.B #$03                           ;00920B|C903    |      ;
                       BNE CODE_0091EE                      ;00920D|D0DF    |0091EE;
 
          CODE_00920F: JSR.W bossHealthRefill               ;00920F|20C890  |0090C8;
                       JMP.W CODE_0091F1                    ;009212|4CF191  |0091F1;
 
 
          CODE_009215: LDY.B #$00                           ;009215|A000    |      ;
 
          CODE_009217: LDA.W progressionLookUp_stage,Y      ;009217|B94492  |009244;
 
                       CMP.B #$FF                           ;00921A|C9FF    |      ;
                       BEQ CODE_009230                      ;00921C|F012    |009230;
                       CMP.B r_stage                        ;00921E|C532    |000032;
                       BNE CODE_00923E                      ;009220|D01C    |00923E;
                       LDA.B r_blockLevel                   ;009222|A533    |000033;
                       CMP.W progressionLookUp_block,Y      ;009224|D94592  |009245;
                       BNE CODE_00923E                      ;009227|D015    |00923E;
                       LDA.B r_roomIdx                      ;009229|A534    |000034;
                       CMP.W progressionLookUp_room,Y       ;00922B|D94692  |009246;
                       BNE CODE_00923E                      ;00922E|D00E    |00923E;
 
          CODE_009230: LDA.W newProgressionIndex_a4,Y       ;009230|B94792  |009247;
                       STA.B r_0a4                          ;009233|85A4    |0000A4;
                       LDA.B #$00                           ;009235|A900    |      ;
                       STA.B r_menuSelectIdx                ;009237|856B    |00006B;
                       LDA.B #$17                           ;009239|A917    |      ;
                       STA.B r_gameTransition               ;00923B|852A    |00002A;
                       RTS                                  ;00923D|60      |      ;
 
 
          CODE_00923E: INY                                  ;00923E|C8      |      ;
                       INY                                  ;00923F|C8      |      ;
                       INY                                  ;009240|C8      |      ;
                       INY                                  ;009241|C8      |      ;
                       BNE CODE_009217                      ;009242|D0D3    |009217;
 
progressionLookUp_stage: db $00                               ;009244|        |      ;
 
progressionLookUp_block: db $00                               ;009245|        |      ;
 
progressionLookUp_room: db $00                               ;009246|        |      ;
 
newProgressionIndex_a4: db $00,$01,$02,$02,$01,$01,$05,$00   ;009247|        |      ;
                       db $02,$02,$04,$00,$03,$03,$04,$01   ;00924F|        |      ;
                       db $04,$04,$02,$02,$05,$05,$03,$00   ;009257|        |      ;
                       db $06,$06,$02,$00,$07,$07,$04,$01   ;00925F|        |      ;
                       db $08,$07,$06,$00,$09,$08,$04,$00   ;009267|        |      ;
 
                       db $0A,$09,$01,$02,$0B,$0A,$06,$02   ;00926F|        |      ;
                       db $0C,$0B,$02,$00,$0D,$0C,$02,$00   ;009277|        |      ;
                       db $0E,$0D,$03,$01,$0F,$FF,$00,$00   ;00927F|        |      ;
                       db $00                               ;009287|        |      ;
 
          CODE_009288: LDA.B r_menuSelectIdx                ;009288|A56B    |00006B;
                       db $20                               ;00928A|        |      ;
                       dw jumpFromStackYXpreserved          ;00928B|        |0FE86D;
                       dw CODE_009299                       ;00928D|        |009299;
                       dw CODE_0092FA                       ;00928F|        |0092FA;
 
                       dw CODE_009365                       ;009291|        |009365;
                       dw CODE_00940C                       ;009293|        |00940C;
                       dw CODE_00942C                       ;009295|        |00942C;
                       dw CODE_009442                       ;009297|        |009442;
 
          CODE_009299: JSR.W CODE_008CA6                    ;009299|20A68C  |008CA6;
                       db $20                               ;00929C|        |      ;
                       dw clearAllEntityButPlayer           ;00929D|        |0FE7F7;
                       LDA.B #$00                           ;00929F|A900    |      ;
                       STA.W $0417                          ;0092A1|8D1704  |000417;
                       LDY.B #$00                           ;0092A4|A000    |      ;
 
     findBossRoomLoop: LDA.W checkBossStage,Y               ;0092A6|B9D592  |0092D5;
                       CMP.B #$FF                           ;0092A9|C9FF    |      ;
                       BEQ CODE_0092B5                      ;0092AB|F008    |0092B5;
                       CMP.B r_stage                        ;0092AD|C532    |000032;
                       BEQ CODE_0092B7                      ;0092AF|F006    |0092B7;
                       INY                                  ;0092B1|C8      |      ;
                       INY                                  ;0092B2|C8      |      ;
                       BNE findBossRoomLoop                 ;0092B3|D0F1    |0092A6;
 
          CODE_0092B5: LDY.B #$00                           ;0092B5|A000    |      ;
 
          CODE_0092B7: LDA.W getBossProgressIndex,Y         ;0092B7|B9D692  |0092D6;
                       ASL A                                ;0092BA|0A      |      ;
                       ASL A                                ;0092BB|0A      |      ;
                       TAY                                  ;0092BC|A8      |      ;
                       LDA.W afterBoss_AutoPlay_Dir,Y       ;0092BD|B9E292  |0092E2;
                       STA.W r_entity_FacingLeft            ;0092C0|8DA804  |0004A8;
                       STY.B r_autoWalkPlayer               ;0092C3|84C6    |0000C6;
                       db $20                               ;0092C5|        |      ;
                       dw setAutoPlayFlag                   ;0092C6|        |0FE5CE;
                       LDA.B #$00                           ;0092C8|A900    |      ;
                       STA.W r_entity_Effect                ;0092CA|8D7004  |000470;
                       LDA.B #$00                           ;0092CD|A900    |      ;
                       db $20                               ;0092CF|        |      ;
                       dw clearAllEntitySprite              ;0092D0|        |0FEF57;
                       INC.B r_menuSelectIdx                ;0092D2|E66B    |00006B;
                       RTS                                  ;0092D4|60      |      ;
 
 
       checkBossStage: db $01                               ;0092D5|        |      ; c6 enity index is y offset
 
 getBossProgressIndex: db $00,$02,$01,$07,$02,$03,$03,$0A   ;0092D6|        |      ;
                       db $04,$0E,$05,$FF                   ;0092DE|        |      ;
 
afterBoss_AutoPlay_Dir: db $01                               ;0092E2|        |      ;
 
         DATA8_0092E3: db $04                               ;0092E3|        |      ;
 
         DATA8_0092E4: db $1E                               ;0092E4|        |      ;
 
         DATA8_0092E5: db $00,$00,$08,$00,$00,$01,$08,$00   ;0092E5|        |      ;
                       db $00,$00,$04,$1F,$01,$00,$04,$1F   ;0092ED|        |      ;
                       db $01,$01,$04,$1F,$01               ;0092F5|        |      ;
 
          CODE_0092FA: LDA.W r_entity_XPos                  ;0092FA|AD3804  |000438;
                       LDY.W r_entity_FacingLeft            ;0092FD|ACA804  |0004A8;
 
                       BEQ CODE_009308                      ;009300|F006    |009308;
                       CMP.B #$18                           ;009302|C918    |      ;
                       BCS CODE_009315                      ;009304|B00F    |009315;
                       BCC CODE_00930C                      ;009306|9004    |00930C;
 
          CODE_009308: CMP.B #$E8                           ;009308|C9E8    |      ;
                       BCC CODE_009315                      ;00930A|9009    |009315;
 
          CODE_00930C: LDA.B r_stage                        ;00930C|A532    |000032;
                       CMP.B #$01                           ;00930E|C901    |      ;
                       BEQ CODE_00931B                      ;009310|F009    |00931B;
                       INC.B r_menuSelectIdx                ;009312|E66B    |00006B;
                       RTS                                  ;009314|60      |      ;
 
 
          CODE_009315: JSR.W CODE_009331                    ;009315|203193  |009331;
                       db $4C                               ;009318|        |      ;
 
                       dw updateSpriteAnimFrame             ;009319|        |0FEF73;
 
          CODE_00931B: LDA.B #$11                           ;00931B|A911    |      ;
                       STA.B r_gameTransition               ;00931D|852A    |00002A;
                       LDA.B #$00                           ;00931F|A900    |      ;
                       STA.W r_bossBoneDragonKingRips       ;009321|8DEC07  |0007EC;
                       STA.W $07F3                          ;009324|8DF307  |0007F3;
                       LDA.B #$00                           ;009327|A900    |      ;
                       STA.W $07ED                          ;009329|8DED07  |0007ED;
                       LDA.B #$63                           ;00932C|A963    |      ;
                       db $4C                               ;00932E|        |      ;
 
                       dw initFreezWaterEffect_01           ;00932F|        |0FE25F;
 
          CODE_009331: LDA.B r_gameStateLoopCounter         ;009331|A51A    |00001A;
                       AND.B #$0F                           ;009333|290F    |      ;
                       BNE CODE_00933C                      ;009335|D005    |00933C;
                       LDA.B #$09                           ;009337|A909    |      ;
                       db $20                               ;009339|        |      ;
                       dw initFreezWaterEffect_01           ;00933A|        |0FE25F;
 
          CODE_00933C: LDA.W r_entity_FacingLeft            ;00933C|ADA804  |0004A8;
                       BEQ CODE_009353                      ;00933F|F012    |009353;
                       LDA.W r_entity_FractionalX           ;009341|ADC404  |0004C4;
                       SEC                                  ;009344|38      |      ;
                       SBC.B #$C0                           ;009345|E9C0    |      ;
                       STA.W r_entity_FractionalX           ;009347|8DC404  |0004C4;
                       LDA.W r_entity_XPos                  ;00934A|AD3804  |000438;
                       SBC.B #$00                           ;00934D|E900    |      ;
 
                       STA.W r_entity_XPos                  ;00934F|8D3804  |000438;
                       RTS                                  ;009352|60      |      ;
 
 
          CODE_009353: LDA.W r_entity_FractionalX           ;009353|ADC404  |0004C4;
                       CLC                                  ;009356|18      |      ;
                       ADC.B #$C0                           ;009357|69C0    |      ;
                       STA.W r_entity_FractionalX           ;009359|8DC404  |0004C4;
                       LDA.W r_entity_XPos                  ;00935C|AD3804  |000438;
                       ADC.B #$00                           ;00935F|6900    |      ;
                       STA.W r_entity_XPos                  ;009361|8D3804  |000438;
                       RTS                                  ;009364|60      |      ;
 
 
          CODE_009365: INC.B r_menuSelectIdx                ;009365|E66B    |00006B;
                       LDA.B #$0C                           ;009367|A90C    |      ;
                       db $20                               ;009369|        |      ;
 
                       dw initFreezWaterEffect_01           ;00936A|        |0FE25F;
                       LDA.B #$3C                           ;00936C|A93C    |      ;
                       STA.B r_timerGenerel                 ;00936E|8530    |000030;
                       LDA.B #$0C                           ;009370|A90C    |      ;
                       LDY.B #$00                           ;009372|A000    |      ;
                       LDX.B #$13                           ;009374|A213    |      ;
                       db $20                               ;009376|        |      ;
                       dw CODE_0FEF5C                       ;009377|        |0FEF5C;
                       LDA.B #$00                           ;009379|A900    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00937B|9D0004  |000400;
                       STA.W r_entity_PaletteOverride,X     ;00937E|9D5404  |000454;
                       LDA.W r_entity_YPos                  ;009381|AD1C04  |00041C;
                       ADC.B #$08                           ;009384|6908    |      ;
                       AND.B #$F0                           ;009386|29F0    |      ;
                       STA.W r_entity_YPos,X                ;009388|9D1C04  |00041C;
                       LDA.W r_entity_FacingLeft            ;00938B|ADA804  |0004A8;
                       ASL A                                ;00938E|0A      |      ;
                       TAY                                  ;00938F|A8      |      ;
                       LDA.W DATA16_009408,Y                ;009390|B90894  |009408;
                       STA.W r_entity_XPos,X                ;009393|9D3804  |000438;
                       LDA.W DATA16_009409,Y                ;009396|B90994  |009409;
 
                       STA.W r_entity_FacingLeft,X          ;009399|9DA804  |0004A8;
 
                       LDA.B r_stage                        ;00939C|A532    |000032;
                       CMP.B #$01                           ;00939E|C901    |      ;
                       BEQ CODE_0093F8                      ;0093A0|F056    |0093F8;
                       LDA.B #$00                           ;0093A2|A900    |      ;
                       STA.B $62                            ;0093A4|8562    |000062;
                       LDY.W r_entity_ObjectIdxes           ;0093A6|AC4E05  |00054E;
                       LDA.W r_entity_YPos                  ;0093A9|AD1C04  |00041C;
                       SEC                                  ;0093AC|38      |      ;
                       SBC.W DATA16_009404,Y                ;0093AD|F90494  |009404;
                       ASL A                                ;0093B0|0A      |      ;
                       ROL.B $62                            ;0093B1|2662    |000062;
                       ASL A                                ;0093B3|0A      |      ;
                       ROL.B $62                            ;0093B4|2662    |000062;
                       AND.B #$E0                           ;0093B6|29E0    |      ;
                       STA.B r_VRAM_QueueDest               ;0093B8|8561    |000061;
                       LDY.W r_entity_FacingLeft            ;0093BA|ACA804  |0004A8;
                       LDA.W DATA16_009402,Y                ;0093BD|B90294  |009402;
                       CLC                                  ;0093C0|18      |      ;
                       ADC.B r_VRAM_QueueDest               ;0093C1|6561    |000061;
                       STA.B r_VRAM_QueueDest               ;0093C3|8561    |000061;
                       LDA.B r_075                          ;0093C5|A575    |000075;
                       AND.B #$01                           ;0093C7|2901    |      ;
                       STA.B $00                            ;0093C9|8500    |000000;
                       LDA.B r_scrollDirection              ;0093CB|A565    |000065;
                       BNE CODE_0093D3                      ;0093CD|D004    |0093D3;
                       LDX.B #$24                           ;0093CF|A224    |      ;
                       BNE CODE_0093D5                      ;0093D1|D002    |0093D5;
 
          CODE_0093D3: LDX.B #$20                           ;0093D3|A220    |      ;
 
          CODE_0093D5: LDA.B r_sceneScrollOffsetHi          ;0093D5|A557    |000057;
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
 
                       dw endVRAM_queue                     ;0093F6|        |0FE8DE;
 
          CODE_0093F8: LDA.B #$2A                           ;0093F8|A92A    |      ;
                       STA.B $62                            ;0093FA|8562    |000062;
                       LDA.B #$41                           ;0093FC|A941    |      ;
                       STA.B r_VRAM_QueueDest               ;0093FE|8561    |000061;
 
                       BNE DATA8_0093E7                     ;009400|D0E5    |0093E7;
 
        DATA16_009402: dw $011E                             ;009402|        |      ;
 
        DATA16_009404: dw $2020,$2024                       ;009404|        |      ;
 
        DATA16_009408: dw $00F4,$010C                       ;009408|        |      ;
 
          CODE_00940C: DEC.B r_timerGenerel                 ;00940C|C630    |000030;
                       BNE CODE_00941C                      ;00940E|D00C    |00941C;
                       LDA.B #$00                           ;009410|A900    |      ;
                       db $20                               ;009412|        |      ;
                       dw clearAllEntitySprite              ;009413|        |0FEF57;
 
                       LDA.B #$14                           ;009415|A914    |      ;
                       STA.B r_timerGenerel                 ;009417|8530    |000030;
                       INC.B r_menuSelectIdx                ;009419|E66B    |00006B;
 
          CODE_00941B: RTS                                  ;00941B|60      |      ;
 
 
          CODE_00941C: LDX.B #$13                           ;00941C|A213    |      ;
                       db $20                               ;00941E|        |      ;
                       dw CODE_0FEF75                       ;00941F|        |0FEF75;
                       LDA.W r_entity_OamBaseOffset,X       ;009421|BD9305  |000593;
 
                       BNE CODE_00941B                      ;009424|D0F5    |00941B;
                       LDA.B #$80                           ;009426|A980    |      ;
                       STA.W r_entity_AnimTimer,X           ;009428|9D7C05  |00057C;
                       RTS                                  ;00942B|60      |      ;
 
 
          CODE_00942C: DEC.B r_timerGenerel                 ;00942C|C630    |000030;
                       BEQ CODE_009436                      ;00942E|F006    |009436;
                       JSR.W CODE_009331                    ;009430|203193  |009331;
                       db $4C                               ;009433|        |      ;
 
                       dw updateSpriteAnimFrame             ;009434|        |0FEF73;
 
          CODE_009436: LDA.B #$00                           ;009436|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;009438|8D0004  |000400;
                       LDA.B #$10                           ;00943B|A910    |      ;
                       STA.B r_timerGenerel                 ;00943D|8530    |000030;
                       INC.B r_menuSelectIdx                ;00943F|E66B    |00006B;
 
          CODE_009441: RTS                                  ;009441|60      |      ;
 
 
          CODE_009442: DEC.B r_timerGenerel                 ;009442|C630    |000030;
                       BNE CODE_009441                      ;009444|D0FB    |009441;
                       LDA.B #$00                           ;009446|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;009448|8D0004  |000400;
                       STA.W $0418                          ;00944B|8D1804  |000418;
                       STA.W $0419                          ;00944E|8D1904  |000419;
                       LDY.B r_autoWalkPlayer               ;009451|A4C6    |0000C6;
                       LDA.W DATA8_0092E3,Y                 ;009453|B9E392  |0092E3;
                       STA.B r_gameState                    ;009456|8518    |000018;
                       LDA.W DATA8_0092E4,Y                 ;009458|B9E492  |0092E4;
                       STA.B r_gameTransition               ;00945B|852A    |00002A;
                       LDA.B r_blockLevel                   ;00945D|A533    |000033;
                       CLC                                  ;00945F|18      |      ;
                       ADC.W DATA8_0092E5,Y                 ;009460|79E592  |0092E5;
                       STA.B r_blockLevel                   ;009463|8533    |000033;
                       LDA.B #$00                           ;009465|A900    |      ;
                       STA.B r_gameSubstate                 ;009467|8519    |000019;
                       RTS                                  ;009469|60      |      ;
 
 
          CODE_00946A: LDA.B r_menuSelectIdx                ;00946A|A56B    |00006B;
                       db $20                               ;00946C|        |      ;
                       dw jumpFromStackYXpreserved          ;00946D|        |0FE86D;
                       LDY.W LOOSE_OP_00BB94                ;00946F|AC94BB  |00BB94;
                       STY.B r_previousBackup88,X           ;009472|94CF    |0000CF;
                       STY.B r_039,X                        ;009474|9439    |000039;
                       STA.B $9B,X                          ;009476|959B    |00009B;
                       STA.B r_SoundMetadataAddr,X          ;009478|95E8    |0000E8;
                       STA.B r_updateNametable,X            ;00947A|9525    |000025;
                       STX.B $60,Y                          ;00947C|9660    |000060;
                       STX.B r_scroolLock,Y                 ;00947E|9671    |000071;
                       STX.B r_roomEntityDataAddrSpawner,Y  ;009480|9698    |000098;
                       STA.B r_SoundBankTempVar2,X          ;009482|95E5    |0000E5;
                       STA.B r_PrgBankBkup_8000,X           ;009484|9522    |000022;
                       STX.B $60,Y                          ;009486|9660    |000060;
                       STX.B r_scroolLock,Y                 ;009488|9671    |000071;
                       STX.B r_collisionValIsForRightHalfOf32x16block,Y;00948A|96A5    |0000A5;
                       RTL                                  ;00948C|6B      |      ;
 
                       db $20                               ;00948D|        |      ;
                       dw jumpFromStackYXpreserved          ;00948E|        |0FE86D;
 
   characterSwapState: dw characterSwapState_00             ;009490|        |0094AC;
                       dw characterSwapState_01             ;009492|        |0094BB;
                       dw characterSwapState_02             ;009494|        |0094CF;
                       dw characterSwapState_03             ;009496|        |00951B;
                       dw characterSwapState_04             ;009498|        |00959B;
                       dw characterSwapState_05             ;00949A|        |0095E8;
                       dw characterSwapState_06             ;00949C|        |009625;
                       dw characterSwapState_07             ;00949E|        |009682;
                       dw characterSwapState_08             ;0094A0|        |00969F;
                       dw characterSwapState_09             ;0094A2|        |009598;
                       dw characterSwapState_0a             ;0094A4|        |0095E5;
                       dw characterSwapState_0b             ;0094A6|        |009622;
                       dw characterSwapState_0c             ;0094A8|        |009692;
 
                       dw characterSwapState_08             ;0094AA|        |00969F;
 
characterSwapState_00: LDA.B #$46                           ;0094AC|A946    |      ;
                       db $20                               ;0094AE|        |      ;
                       dw initFreezWaterEffect_01           ;0094AF|        |0FE25F;
                       db $20                               ;0094B1|        |      ;
                       dw setAutoPlayFlag                   ;0094B2|        |0FE5CE;
                       LDA.B #$3C                           ;0094B4|A93C    |      ;
                       STA.B r_timerGenerel                 ;0094B6|8530    |000030;
                       INC.B r_menuSelectIdx                ;0094B8|E66B    |00006B;
                       RTS                                  ;0094BA|60      |      ;
 
 
characterSwapState_01: DEC.B r_timerGenerel                 ;0094BB|C630    |000030;
                       BEQ CODE_0094C7                      ;0094BD|F008    |0094C7;
                       LDA.B r_gameStateLoopCounter         ;0094BF|A51A    |00001A;
                       AND.B #$03                           ;0094C1|2903    |      ;
                       STA.W r_entity_PaletteOverride       ;0094C3|8D5404  |000454;
                       RTS                                  ;0094C6|60      |      ;
 
 
          CODE_0094C7: LDA.B #$00                           ;0094C7|A900    |      ;
                       STA.W r_entity_PaletteOverride       ;0094C9|8D5404  |000454;
                       INC.B r_menuSelectIdx                ;0094CC|E66B    |00006B;
                       RTS                                  ;0094CE|60      |      ;
 
 
characterSwapState_02: LDA.B #$4C                           ;0094CF|A94C    |      ;
                       STA.B r_timerGenerel                 ;0094D1|8530    |000030;
                       LDA.W r_entity_XPos                  ;0094D3|AD3804  |000438;
                       STA.W $05D4                          ;0094D6|8DD405  |0005D4;
                       LDA.B #$00                           ;0094D9|A900    |      ;
                       STA.W $0505                          ;0094DB|8D0505  |000505;
                       STA.W $051C                          ;0094DE|8D1C05  |00051C;
 
                       STA.W r_boss_batRiverSwap            ;0094E1|8D0206  |000602;
                       LDA.B #$10                           ;0094E4|A910    |      ;
                       STA.W r_stairsStuneTimer             ;0094E6|8DEB05  |0005EB;
                       LDA.B #$01                           ;0094E9|A901    |      ;
                       STA.W r_weaponDamage                 ;0094EB|8D3006  |000630;
                       INC.B r_menuSelectIdx                ;0094EE|E66B    |00006B;
                       RTS                                  ;0094F0|60      |      ;
 
 
    partnerState16Fix: LDA.B r_partnerSwapStateBackup       ;0094F1|A5AA    |0000AA;
                       CMP.B #$16                           ;0094F3|C916    |      ;
                       BEQ CODE_009509                      ;0094F5|F012    |009509;
                       LDA.B r_bossSecondFace               ;0094F7|A5C2    |0000C2;
                       BNE CODE_009509                      ;0094F9|D00E    |009509;
                       LDA.W r_entity_YPos                  ;0094FB|AD1C04  |00041C;
                       SEC                                  ;0094FE|38      |      ;
 
                       SBC.B #$4A                           ;0094FF|E94A    |      ;
                       BMI CODE_009509                      ;009501|3006    |009509;
                       CMP.B #$8E                           ;009503|C98E    |      ;
                       BCS CODE_009509                      ;009505|B002    |009509;
                       CLC                                  ;009507|18      |      ;
                       RTS                                  ;009508|60      |      ;
 
 
          CODE_009509: SEC                                  ;009509|38      |      ;
                       RTS                                  ;00950A|60      |      ;
 
 
          CODE_00950B: LDA.W r_entity_YPos                  ;00950B|AD1C04  |00041C;
                       SEC                                  ;00950E|38      |      ;
                       SBC.B #$4E                           ;00950F|E94E    |      ;
                       BMI CODE_009519                      ;009511|3006    |009519;
                       CMP.B #$8A                           ;009513|C98A    |      ;
                       BCS CODE_009519                      ;009515|B002    |009519;
                       CLC                                  ;009517|18      |      ;
                       RTS                                  ;009518|60      |      ;
 
 
          CODE_009519: SEC                                  ;009519|38      |      ;
                       RTS                                  ;00951A|60      |      ;
 
 
characterSwapState_03: JSR.W partnerState16Fix              ;00951B|20F194  |0094F1;
                       BCS CODE_009534                      ;00951E|B014    |009534;
 
                       LDA.W r_entity_YPos                  ;009520|AD1C04  |00041C;
                       SEC                                  ;009523|38      |      ;
                       SBC.B #$18                           ;009524|E918    |      ;
                       STA.W $0619                          ;009526|8D1906  |000619;
                       TAY                                  ;009529|A8      |      ;
                       LDX.B #$2E                           ;00952A|A22E    |      ;
                       LDA.B #$09                           ;00952C|A909    |      ;
                       db $20                               ;00952E|        |      ;
                       dw CODE_0FE5BF                       ;00952F|        |0FE5BF;
                       INC.B r_menuSelectIdx                ;009531|E66B    |00006B;
                       RTS                                  ;009533|60      |      ;
 
 
          CODE_009534: LDA.B #$09                           ;009534|A909    |      ;
                       STA.B r_menuSelectIdx                ;009536|856B    |00006B;
                       RTS                                  ;009538|60      |      ;
 
                       JSR.W CODE_00950B                    ;009539|200B95  |00950B;
                       BCS CODE_009550                      ;00953C|B012    |009550;
                       LDA.B #$0B                           ;00953E|A90B    |      ;
                       STA.B r_IRQFuncIdx                   ;009540|853F    |00003F;
                       LDA.W r_entity_YPos                  ;009542|AD1C04  |00041C;
                       SEC                                  ;009545|38      |      ;
                       SBC.B #$0C                           ;009546|E90C    |      ;
                       STA.W $0619                          ;009548|8D1906  |000619;
                       STA.B $7C                            ;00954B|857C    |00007C;
                       INC.B r_menuSelectIdx                ;00954D|E66B    |00006B;
                       RTS                                  ;00954F|60      |      ;
 
 
          CODE_009550: LDA.B #$09                           ;009550|A909    |      ;
                       STA.B r_menuSelectIdx                ;009552|856B    |00006B;
                       RTS                                  ;009554|60      |      ;
 
 
        swapEffect_00: LDA.B #$00                           ;009555|A900    |      ;
                       STA.W r_entity_Effect                ;009557|8D7004  |000470;
                       LDA.W $0505                          ;00955A|AD0505  |000505;
                       BMI CODE_009589                      ;00955D|302A    |009589;
                       LDA.W r_weaponDamage                 ;00955F|AD3006  |000630;
                       BEQ CODE_00957A                      ;009562|F016    |00957A;
                       LDA.W $05D4                          ;009564|ADD405  |0005D4;
                       SEC                                  ;009567|38      |      ;
                       SBC.W $0505                          ;009568|ED0505  |000505;
                       BCC CODE_009573                      ;00956B|9006    |009573;
                       CMP.B #$08                           ;00956D|C908    |      ;
                       BCC CODE_009573                      ;00956F|9002    |009573;
                       BCS CODE_00958C                      ;009571|B019    |00958C;
 
          CODE_009573: LDA.B #$80                           ;009573|A980    |      ;
                       STA.W r_entity_Effect                ;009575|8D7004  |000470;
                       BNE CODE_00958F                      ;009578|D015    |00958F;
 
          CODE_00957A: LDA.W $05D4                          ;00957A|ADD405  |0005D4;
                       CLC                                  ;00957D|18      |      ;
                       ADC.W $0505                          ;00957E|6D0505  |000505;
                       BCS CODE_009573                      ;009581|B0F0    |009573;
                       CMP.B #$F8                           ;009583|C9F8    |      ;
                       BCS CODE_009573                      ;009585|B0EC    |009573;
                       BCC CODE_00958C                      ;009587|9003    |00958C;
 
          CODE_009589: LDA.W $05D4                          ;009589|ADD405  |0005D4;
 
          CODE_00958C: STA.W r_entity_XPos                  ;00958C|8D3804  |000438;
 
          CODE_00958F: LDA.W r_weaponDamage                 ;00958F|AD3006  |000630;
                       EOR.B #$01                           ;009592|4901    |      ;
                       STA.W r_weaponDamage                 ;009594|8D3006  |000630;
                       RTS                                  ;009597|60      |      ;
 
 
characterSwapState_09: JSR.W swapEffect_00                  ;009598|205595  |009555;
 
characterSwapState_04: DEC.B r_timerGenerel                 ;00959B|C630    |000030;
                       BEQ CODE_0095D8                      ;00959D|F039    |0095D8;
                       LDA.W $051C                          ;00959F|AD1C05  |00051C;
                       CLC                                  ;0095A2|18      |      ;
                       ADC.W r_stairsStuneTimer             ;0095A3|6DEB05  |0005EB;
                       STA.W $051C                          ;0095A6|8D1C05  |00051C;
                       LDA.W $0505                          ;0095A9|AD0505  |000505;
 
                       ADC.W r_boss_batRiverSwap            ;0095AC|6D0206  |000602;
                       STA.W $0505                          ;0095AF|8D0505  |000505;
                       CMP.B #$08                           ;0095B2|C908    |      ;
                       BCS CODE_0095B7                      ;0095B4|B001    |0095B7;
                       RTS                                  ;0095B6|60      |      ;
 
 
          CODE_0095B7: LDA.W r_stairsStuneTimer             ;0095B7|ADEB05  |0005EB;
                       CLC                                  ;0095BA|18      |      ;
                       ADC.B #$10                           ;0095BB|6910    |      ;
                       STA.W r_stairsStuneTimer             ;0095BD|8DEB05  |0005EB;
 
                       LDA.W r_boss_batRiverSwap            ;0095C0|AD0206  |000602;
                       ADC.B #$00                           ;0095C3|6900    |      ;
                       STA.W r_boss_batRiverSwap            ;0095C5|8D0206  |000602;
                       CMP.B #$08                           ;0095C8|C908    |      ;
                       BCS CODE_0095CD                      ;0095CA|B001    |0095CD;
                       RTS                                  ;0095CC|60      |      ;
 
 
          CODE_0095CD: LDA.B #$08                           ;0095CD|A908    |      ;
                       STA.W r_boss_batRiverSwap            ;0095CF|8D0206  |000602;
                       LDA.B #$00                           ;0095D2|A900    |      ;
                       STA.W r_stairsStuneTimer             ;0095D4|8DEB05  |0005EB;
                       RTS                                  ;0095D7|60      |      ;
 
 
          CODE_0095D8: LDA.B #$80                           ;0095D8|A980    |      ;
                       STA.W r_entity_Effect                ;0095DA|8D7004  |000470;
                       LDA.B #$00                           ;0095DD|A900    |      ;
                       STA.W $0413                          ;0095DF|8D1304  |000413;
                       INC.B r_menuSelectIdx                ;0095E2|E66B    |00006B;
                       RTS                                  ;0095E4|60      |      ;
 
 
characterSwapState_0a: JSR.W swapEffect_00                  ;0095E5|205595  |009555;
 
characterSwapState_05: db $20                               ;0095E8|        |      ;
                       dw CODE_0FE677                       ;0095E9|        |0FE677;
                       LDA.W r_OamSpecIdxDoubled            ;0095EB|AD0004  |000400;
                       CMP.B #$48                           ;0095EE|C948    |      ;
                       BNE CODE_0095F7                      ;0095F0|D005    |0095F7;
                       LDA.B #$04                           ;0095F2|A904    |      ;
                       STA.W r_OamSpecIdxDoubled            ;0095F4|8D0004  |000400;
 
          CODE_0095F7: LDA.B r_partnerIdx                   ;0095F7|A53B    |00003B;
                       EOR.B #$01                           ;0095F9|4901    |      ;
 
                       STA.B r_partnerIdx                   ;0095FB|853B    |00003B;
                       TAY                                  ;0095FD|A8      |      ;
                       LDA.W r_039,Y                        ;0095FE|B93900  |000039;
                       STA.W r_entity_ObjectIdxes           ;009601|8D4E05  |00054E;
                       JSR.W CODE_008E4B                    ;009604|204B8E  |008E4B;
                       JSR.W CODE_008E61                    ;009607|20618E  |008E61;
                       db $20                               ;00960A|        |      ;
 
                       dw CODE_0FE61E                       ;00960B|        |0FE61E;
                       JSR.W loadPlayerCHRBank              ;00960D|200180  |008001;
                       db $20                               ;009610|        |      ;
                       dw CODE_0FE33C                       ;009611|        |0FE33C;
 
                       LDA.W r_entity_ObjectIdxes           ;009613|AD4E05  |00054E;
                       ASL A                                ;009616|0A      |      ;
                       STA.W r_entity_OamSpecGroupDoubled   ;009617|8D8C04  |00048C;
                       LDA.B #$00                           ;00961A|A900    |      ;
                       STA.W r_entity_Effect                ;00961C|8D7004  |000470;
                       INC.B r_menuSelectIdx                ;00961F|E66B    |00006B;
                       RTS                                  ;009621|60      |      ;
 
 
characterSwapState_0b: JSR.W swapEffect_00                  ;009622|205595  |009555;
 
characterSwapState_06: LDA.W $051C                          ;009625|AD1C05  |00051C;
                       SEC                                  ;009628|38      |      ;
                       SBC.W r_stairsStuneTimer             ;009629|EDEB05  |0005EB;
                       STA.W $051C                          ;00962C|8D1C05  |00051C;
                       LDA.W $0505                          ;00962F|AD0505  |000505;
                       SBC.W r_boss_batRiverSwap            ;009632|ED0206  |000602;
                       STA.W $0505                          ;009635|8D0505  |000505;
                       CMP.B #$F0                           ;009638|C9F0    |      ;
                       BCS CODE_00965D                      ;00963A|B021    |00965D;
                       CMP.B #$08                           ;00963C|C908    |      ;
                       BCS CODE_00964B                      ;00963E|B00B    |00964B;
                       LDA.B #$10                           ;009640|A910    |      ;
                       STA.W r_stairsStuneTimer             ;009642|8DEB05  |0005EB;
                       LDA.B #$00                           ;009645|A900    |      ;
                       STA.W r_boss_batRiverSwap            ;009647|8D0206  |000602;
                       RTS                                  ;00964A|60      |      ;
 
 
          CODE_00964B: LDA.W r_stairsStuneTimer             ;00964B|ADEB05  |0005EB;
                       SEC                                  ;00964E|38      |      ;
                       SBC.B #$10                           ;00964F|E910    |      ;
                       STA.W r_stairsStuneTimer             ;009651|8DEB05  |0005EB;
                       LDA.W r_boss_batRiverSwap            ;009654|AD0206  |000602;
                       SBC.B #$00                           ;009657|E900    |      ;
                       STA.W r_boss_batRiverSwap            ;009659|8D0206  |000602;
                       RTS                                  ;00965C|60      |      ;
 
 
          CODE_00965D: INC.B r_menuSelectIdx                ;00965D|E66B    |00006B;
                       RTS                                  ;00965F|60      |      ;
 
                       LDA.W $05D4                          ;009660|ADD405  |0005D4;
                       STA.W r_entity_XPos                  ;009663|8D3804  |000438;
                       LDA.B #$05                           ;009666|A905    |      ;
                       STA.B r_IRQFuncIdx                   ;009668|853F    |00003F;
                       LDA.B #$3C                           ;00966A|A93C    |      ;
                       STA.B r_timerGenerel                 ;00966C|8530    |000030;
                       INC.B r_menuSelectIdx                ;00966E|E66B    |00006B;
                       RTS                                  ;009670|60      |      ;
 
                       DEC.B r_timerGenerel                 ;009671|C630    |000030;
 
                       BEQ CODE_00967D                      ;009673|F008    |00967D;
                       LDA.B r_gameStateLoopCounter         ;009675|A51A    |00001A;
 
                       AND.B #$03                           ;009677|2903    |      ;
                       STA.W r_entity_PaletteOverride       ;009679|8D5404  |000454;
                       RTS                                  ;00967C|60      |      ;
 
 
          CODE_00967D: LDA.B #$05                           ;00967D|A905    |      ;
                       JMP.W CODE_0096AD                    ;00967F|4CAD96  |0096AD;
 
 
characterSwapState_07: LDA.B r_partnerSwapDrawingBackup     ;009682|A5A6    |0000A6;
                       STA.B r_IRQFuncIdx                   ;009684|853F    |00003F;
                       LDA.B r_partnerSwapDrawingIRQPointer ;009686|A5A7    |0000A7;
                       STA.B r_IRQCmpVal                    ;009688|8541    |000041;
                       LDA.B $A8                            ;00968A|A5A8    |0000A8;
                       STA.B r_scannlineTarget              ;00968C|8542    |000042;
 
                       LDA.B r_partnerSwapDrawingLatch      ;00968E|A5A9    |0000A9;
                       STA.B r_IRQStatus                    ;009690|8540    |000040;
 
characterSwapState_0c: LDA.W $05D4                          ;009692|ADD405  |0005D4;
                       STA.W r_entity_XPos                  ;009695|8D3804  |000438;
 
                       LDA.B #$3C                           ;009698|A93C    |      ;
                       STA.B r_timerGenerel                 ;00969A|8530    |000030;
                       INC.B r_menuSelectIdx                ;00969C|E66B    |00006B;
                       RTS                                  ;00969E|60      |      ;
 
 
characterSwapState_08: DEC.B r_timerGenerel                 ;00969F|C630    |000030;
                       BEQ CODE_0096AB                      ;0096A1|F008    |0096AB;
                       LDA.B r_gameStateLoopCounter         ;0096A3|A51A    |00001A;
                       AND.B #$03                           ;0096A5|2903    |      ;
                       STA.W r_entity_PaletteOverride       ;0096A7|8D5404  |000454;
                       RTS                                  ;0096AA|60      |      ;
 
 
          CODE_0096AB: LDA.B r_partnerSwapStateBackup       ;0096AB|A5AA    |0000AA;
 
          CODE_0096AD: STA.B r_gameTransition               ;0096AD|852A    |00002A;
                       LDA.B #$00                           ;0096AF|A900    |      ;
                       STA.W r_entity_PaletteOverride       ;0096B1|8D5404  |000454;
                       db $20                               ;0096B4|        |      ;
                       dw unsetAutoPlayFlag                 ;0096B5|        |0FE5CA;
                       LDA.B #$00                           ;0096B7|A900    |      ;
                       STA.W $0505                          ;0096B9|8D0505  |000505;
                       STA.W $051C                          ;0096BC|8D1C05  |00051C;
                       STA.W $05D4                          ;0096BF|8DD405  |0005D4;
                       STA.W r_stairsStuneTimer             ;0096C2|8DEB05  |0005EB;
                       STA.W r_boss_batRiverSwap            ;0096C5|8D0206  |000602;
                       STA.W $0619                          ;0096C8|8D1906  |000619;
                       STA.W r_weaponDamage                 ;0096CB|8D3006  |000630;
                       RTS                                  ;0096CE|60      |      ;
 
 
          CODE_0096CF: RTS                                  ;0096CF|60      |      ;
 
 
          CODE_0096D0: LDA.W r_Player_StateDoubled          ;0096D0|AD6505  |000565;
                       CMP.B #$0E                           ;0096D3|C90E    |      ;
                       BCC CODE_0096F8                      ;0096D5|9021    |0096F8;
                       CMP.B #$16                           ;0096D7|C916    |      ;
                       BCS CODE_0096F8                      ;0096D9|B01D    |0096F8;
                       LDA.W r_entity_YPos                  ;0096DB|AD1C04  |00041C;
                       CMP.B #$70                           ;0096DE|C970    |      ;
                       BCS CODE_0096F8                      ;0096E0|B016    |0096F8;
                       LDA.B r_roomEffect                   ;0096E2|A57D    |00007D;
                       AND.B #$0F                           ;0096E4|290F    |      ;
                       ASL A                                ;0096E6|0A      |      ;
                       TAY                                  ;0096E7|A8      |      ;
                       LDA.W DATA8_0096FA,Y                 ;0096E8|B9FA96  |0096FA;
                       CMP.B r_sceneScrollOffsetHi          ;0096EB|C557    |000057;
                       BNE CODE_0096F8                      ;0096ED|D009    |0096F8;
                       LDA.W DATA8_0096FB,Y                 ;0096EF|B9FB96  |0096FB;
                       CMP.B r_sceneScrollOffsetLo          ;0096F2|C556    |000056;
                       BNE CODE_0096F8                      ;0096F4|D002    |0096F8;
                       SEC                                  ;0096F6|38      |      ;
                       RTS                                  ;0096F7|60      |      ;
 
 
          CODE_0096F8: CLC                                  ;0096F8|18      |      ;
                       RTS                                  ;0096F9|60      |      ;
 
 
         DATA8_0096FA: db $00                               ;0096FA|        |      ;
 
         DATA8_0096FB: db $00,$02,$C8,$00,$00,$00,$00       ;0096FB|        |      ;
 
          CODE_009702: LDY.B #$00                           ;009702|A000    |      ;
 
          CODE_009704: LDA.W DATA8_009730,Y                 ;009704|B93097  |009730;
                       CMP.B #$FF                           ;009707|C9FF    |      ;
                       BEQ CODE_00972A                      ;009709|F01F    |00972A;
                       CMP.B r_stage                        ;00970B|C532    |000032;
                       BNE CODE_009724                      ;00970D|D015    |009724;
                       LDA.W DATA8_009731,Y                 ;00970F|B93197  |009731;
                       CMP.B r_blockLevel                   ;009712|C533    |000033;
                       BNE CODE_009724                      ;009714|D00E    |009724;
                       LDA.W DATA8_009732,Y                 ;009716|B93297  |009732;
                       CMP.B r_roomIdx                      ;009719|C534    |000034;
                       BNE CODE_009724                      ;00971B|D007    |009724;
                       LDA.W DATA8_009733,Y                 ;00971D|B93397  |009733;
                       STA.B r_roomEffect                   ;009720|857D    |00007D;
                       SEC                                  ;009722|38      |      ;
                       RTS                                  ;009723|60      |      ;
 
 
          CODE_009724: INY                                  ;009724|C8      |      ;
                       INY                                  ;009725|C8      |      ;
                       INY                                  ;009726|C8      |      ;
                       INY                                  ;009727|C8      |      ;
                       BNE CODE_009704                      ;009728|D0DA    |009704;
 
          CODE_00972A: LDA.B #$00                           ;00972A|A900    |      ;
                       STA.B r_roomEffect                   ;00972C|857D    |00007D;
                       CLC                                  ;00972E|18      |      ;
                       RTS                                  ;00972F|60      |      ;
 
 
         DATA8_009730: db $02                               ;009730|        |      ;
 
         DATA8_009731: db $02                               ;009731|        |      ;
 
         DATA8_009732: db $01                               ;009732|        |      ;
 
         DATA8_009733: db $10,$02,$03,$01,$11,$0E,$00,$02   ;009733|        |      ;
                       db $12,$0E,$02,$00,$13,$02,$00,$01   ;00973B|        |      ;
                       db $20,$0C,$01,$01,$23,$05,$01,$00   ;009743|        |      ;
                       db $30,$0D,$03,$00,$31,$01,$00,$00   ;00974B|        |      ;
                       db $40,$01,$01,$00,$40,$01,$01,$01   ;009753|        |      ;
                       db $40,$01,$01,$02,$40,$01,$02,$00   ;00975B|        |      ;
                       db $40,$01,$02,$01,$40,$01,$03,$00   ;009763|        |      ;
                       db $40,$01,$03,$01,$40,$01,$04,$00   ;00976B|        |      ;
                       db $40,$01,$04,$01,$40,$01,$04,$02   ;009773|        |      ;
                       db $40,$01,$05,$00,$40,$0E,$00,$01   ;00977B|        |      ;
                       db $40,$0D,$01,$00,$41,$0D,$01,$01   ;009783|        |      ;
                       db $41,$0D,$01,$02,$41,$06,$00,$01   ;00978B|        |      ;
                       db $32,$06,$00,$00,$33,$06,$01,$00   ;009793|        |      ;
                       db $34,$06,$02,$01,$35,$06,$02,$00   ;00979B|        |      ;
                       db $36,$06,$02,$02,$37,$08,$00,$00   ;0097A3|        |      ;
                       db $50,$08,$01,$00,$51,$08,$02,$00   ;0097AB|        |      ;
                       db $51,$05,$03,$00,$51,$09,$00,$00   ;0097B3|        |      ;
                       db $51,$0A,$01,$00,$51,$0A,$02,$00   ;0097BB|        |      ;
                       db $51,$0A,$03,$00,$51,$02,$01,$00   ;0097C3|        |      ;
                       db $51,$08,$00,$01,$60,$08,$03,$00   ;0097CB|        |      ;
                       db $71,$08,$04,$00,$71,$05,$03,$01   ;0097D3|        |      ;
                       db $80,$0C,$02,$00,$81,$FF           ;0097DB|        |      ;
 
          CODE_0097E1: LDA.B r_roomEffect                   ;0097E1|A57D    |00007D;
                       AND.B #$0F                           ;0097E3|290F    |      ;
                       TAX                                  ;0097E5|AA      |      ;
                       LDY.W DATA8_0097FA,X                 ;0097E6|BCFA97  |0097FA;
                       LDX.B #$2E                           ;0097E9|A22E    |      ;
                       LDA.B r_roomEffect                   ;0097EB|A57D    |00007D;
                       CMP.B #$31                           ;0097ED|C931    |      ;
                       BNE CODE_0097F5                      ;0097EF|D004    |0097F5;
                       LDA.B #$24                           ;0097F1|A924    |      ;
                       BNE DATA8_0097F7                     ;0097F3|D002    |0097F7;
 
          CODE_0097F5: LDA.B #$13                           ;0097F5|A913    |      ;
 
         DATA8_0097F7: db $4C                               ;0097F7|        |      ;
 
                       dw CODE_0FE5BF                       ;0097F8|        |0FE5BF;
 
         DATA8_0097FA: db $7E,$5E,$AE,$AE,$AE,$AE,$AE       ;0097FA|        |      ;
 
                       LDX.W r_playerDirBKP                 ;009801|AEA000  |0000A0;
 
                       TYA                                  ;009804|98      |      ;
 
          CODE_009805: STA.W r_FogParallelPos,Y             ;009805|998207  |000782;
                       INY                                  ;009808|C8      |      ;
                       CPY.B #$40                           ;009809|C040    |      ;
                       BNE CODE_009805                      ;00980B|D0F8    |009805;
                       LDA.B r_roomEffect                   ;00980D|A57D    |00007D;
                       AND.B #$0F                           ;00980F|290F    |      ;
                       TAX                                  ;009811|AA      |      ;
                       LDY.W DATA8_00981C,X                 ;009812|BC1C98  |00981C;
                       LDX.B #$2E                           ;009815|A22E    |      ;
                       LDA.B #$02                           ;009817|A902    |      ;
                       db $4C                               ;009819|        |      ;
 
                       dw CODE_0FE5BF                       ;00981A|        |0FE5BF;
 
         DATA8_00981C: db $3F,$7F,$30                       ;00981C|        |      ;
                       LDY.B #$86                           ;00981F|A086    |      ;
                       LDA.B (r_CHR_BankBG_0800),Y          ;009821|B14C    |00004C;
                       PLD                                  ;009823|2B      |      ;
                       TYA                                  ;009824|98      |      ;
 
          CODE_009825: PHA                                  ;009825|48      |      ;
                       LDA.B #$80                           ;009826|A980    |      ;
                       STA.B r_enemyCHR_idx                 ;009828|85B1    |0000B1;
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
 
 
          CODE_009873: STX.B r_enemyCHR_idx                 ;009873|86B1    |0000B1;
 
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
                       dw $BBEF,$BC16,$BC31,$BC50           ;009948|        |      ;
                       dw $BC84,$BCB6,$BCFF,$BAC0           ;009950|        |      ;
                       dw $BAEF,$BB0D,$BB29,$BB4B           ;009958|        |      ;
                       dw $BB6B,$BB8C,$BBAE,$BBCE           ;009960|        |      ;
                       dw $BBE8,$BBF7,$BC10,$BC2E           ;009968|        |      ;
                       dw $BC4E,$9B13,$9AAC,$9AE6           ;009970|        |      ;
                       dw $9A60,$9A73,$9A86,$BC6C           ;009978|        |      ;
                       dw $BC6C,$BC77,$BC95,$BCB0           ;009980|        |      ;
                       dw $BCCF,$BCEC,$BDC0,$BD17           ;009988|        |      ;
                       dw $BD38,$BD52,$BD6F,$BD8E           ;009990|        |      ;
                       dw $BDA6,$BDB1,$BDD5,$9A4D           ;009998|        |      ;
                       dw $9D4E,$9A3A,$BB29,$BB4B           ;0099A0|        |      ;
                       dw $9D61,$BCB6,$BCFF,$BD2E           ;0099A8|        |      ;
                       dw $BD5C,$A285                       ;0099B0|        |      ;
 
               PAL_0e: db $40,$20,$62,$52,$5E,$61,$54,$4D   ;0099B4|        |      ;
                       db $FE,$4D,$20,$63,$58,$5C,$54,$FE   ;0099BC|        |      ;
                       db $57,$20,$51,$5B,$5A,$00,$00,$4D   ;0099C4|        |      ;
                       db $41,$FE,$60,$20,$5F,$5B,$50,$68   ;0099CC|        |      ;
                       db $54,$61,$FE,$80,$20,$54,$5D,$54   ;0099D4|        |      ;
                       db $5C,$68,$FE,$75,$20,$91,$4C,$FE   ;0099DC|        |      ;
                       db $95,$20,$5F,$4C,$FE,$70,$20,$80   ;0099E4|        |      ;
                       db $81,$81,$82,$FE,$90,$20,$90,$00   ;0099EC|        |      ;
                       db $00,$92,$FE,$B0,$20,$A0,$A1,$A1   ;0099F4|        |      ;
                       db $A2,$FF                           ;0099FC|        |      ;
 
               PAL_0f: db $7D,$20,$88,$89,$FE,$9D,$20,$98   ;0099FE|        |      ;
                       db $99,$FE,$BD,$20,$A8,$A9,$FF       ;009A06|        |      ;
 
               PAL_11: db $7D,$20,$8A,$8B,$FE,$9D,$20,$9A   ;009A0D|        |      ;
                       db $9B,$FE,$BD,$20,$AA,$AB,$FF       ;009A15|        |      ;
 
               PAL_10: db $7D,$20,$8C,$8D,$FE,$9D,$20,$9C   ;009A1C|        |      ;
                       db $9D,$FE,$BD,$20,$AC,$AD,$FF       ;009A24|        |      ;
 
               PAL_12: db $7D,$20,$8E,$8F,$FE,$9D,$20,$9E   ;009A2B|        |      ;
                       db $9F,$FE,$BD,$20,$AE,$AF,$FF,$00   ;009A33|        |      ;
                       db $3F,$0F,$16,$26,$20,$0F,$00,$04   ;009A3B|        |      ;
                       db $10,$0F,$02,$14,$27,$0F,$02,$04   ;009A43|        |      ;
                       db $14,$FF,$00,$3F,$0F,$16,$26,$20   ;009A4B|        |      ;
                       db $0F,$16,$27,$10,$0F,$07,$0F,$0F   ;009A53|        |      ;
                       db $0F,$07,$0F,$27,$FF,$00,$3F,$0F   ;009A5B|        |      ;
                       db $16,$26,$20,$0F,$07,$17,$27,$0F   ;009A63|        |      ;
                       db $07,$0F,$0F,$0F,$07,$0F,$27,$FF   ;009A6B|        |      ;
                       db $00,$3F,$0F,$16,$26,$20,$0F,$07   ;009A73|        |      ;
                       db $27,$37,$0F,$07,$0F,$11,$0F,$07   ;009A7B|        |      ;
                       db $11,$27,$FF,$00,$3F,$0F,$16,$26   ;009A83|        |      ;
                       db $20,$0F,$17,$27,$37,$0F,$17,$21   ;009A8B|        |      ;
                       db $31,$0F,$07,$31,$37,$FF           ;009A93|        |      ;
 
               PAL_20: db $00,$3F,$0F,$16,$26,$20,$0F,$22   ;009A99|        |      ;
                       db $12,$20,$0F,$22,$0F,$0F,$0F,$22   ;009AA1|        |      ;
                       db $0F,$20,$FF,$0F,$25,$4E,$7D,$7D   ;009AA9|        |      ;
                       db $4F,$FE,$2E,$25,$5E,$78,$78,$78   ;009AB1|        |      ;
                       db $78,$5F,$FE,$4E,$25,$6E,$7E,$78   ;009AB9|        |      ;
                       db $78,$7F,$6F,$FE,$6D,$25,$40,$41   ;009AC1|        |      ;
                       db $42,$43,$44,$45,$46,$47,$FE,$8D   ;009AC9|        |      ;
                       db $25,$50,$51,$52,$53,$54,$55,$56   ;009AD1|        |      ;
                       db $57,$FE,$AD,$25,$60,$61,$62,$63   ;009AD9|        |      ;
                       db $64,$65,$66,$67,$FF,$CD,$25,$70   ;009AE1|        |      ;
                       db $71,$72,$73,$74,$75,$76,$77,$FE   ;009AE9|        |      ;
                       db $EE,$25,$48,$49,$4A,$4B,$4C,$4D   ;009AF1|        |      ;
                       db $FE,$0E,$26,$58,$59,$5A,$5B,$5C   ;009AF9|        |      ;
                       db $5D,$FE,$2E,$26,$68,$69,$6A,$6B   ;009B01|        |      ;
                       db $6C,$6D,$FE,$4F,$26,$79,$7A,$7B   ;009B09|        |      ;
                       db $7C,$FF,$D3,$27,$55,$55,$55,$FE   ;009B11|        |      ;
                       db $DB,$27,$59,$7B,$55,$FE,$E3,$27   ;009B19|        |      ;
                       db $55,$55,$55,$FF                   ;009B21|        |      ;
 
               PAL_05: db $0E,$22,$47,$41,$4D,$45,$FF       ;009B25|        |      ;
 
               PAL_06: db $0E,$22,$44,$45,$4D,$4F,$FF       ;009B2C|        |      ;
 
               PAL_01: db $CA,$22,$21,$00,$5A,$5E,$5D,$50   ;009B33|        |      ;
                       db $5C,$58,$00,$42,$4A,$4A,$41,$FF   ;009B3B|        |      ;
 
               PAL_00: db $27,$23,$1E,$1F,$14,$1D,$18,$1D   ;009B43|        |      ;
                       db $16,$FF                           ;009B4B|        |      ;
 
               PAL_26: db $32,$23,$1F,$10,$22,$22,$26,$1E   ;009B4D|        |      ;
                       db $21,$13,$FF                       ;009B55|        |      ;
 
               PAL_02: db $EC,$21,$56,$50,$5C,$54,$00,$5E   ;009B58|        |      ;
 
                       db $65,$54,$61,$FF                   ;009B60|        |      ;
 
               PAL_27: db $8C,$22,$52,$5E,$5D,$63,$58,$5D   ;009B64|        |      ;
                       db $64,$54,$FF                       ;009B6C|        |      ;
 
               PAL_28: db $EC,$22,$5F,$50,$62,$62,$66,$5E   ;009B6F|        |      ;
                       db $61,$53,$FF                       ;009B77|        |      ;
 
               PAL_08: db $CD,$22,$56,$50,$5C,$54,$00,$62   ;009B7A|        |      ;
                       db $63,$50,$61,$63,$FF               ;009B82|        |      ;
 
               PAL_04: db $00,$3F,$0F,$16,$05,$20,$0F,$13   ;009B87|        |      ;
                       db $02,$20,$0F,$14,$03,$3B,$0F,$16   ;009B8F|        |      ;
                       db $27,$10,$0F,$0C,$26,$30,$0F,$0C   ;009B97|        |      ;
                       db $2C,$30,$0F,$12,$26,$30,$0F,$06   ;009B9F|        |      ;
                       db $30,$30,$FE                       ;009BA7|        |      ;
 
               PAL_03: db $00,$3F,$FE,$00,$00,$FF           ;009BAA|        |      ;
 
               PAL_18: db $00,$3F,$0F,$07,$17,$20,$0F,$07   ;009BB0|        |      ;
                       db $17,$20,$0F,$01,$09,$08,$0F,$01   ;009BB8|        |      ;
                       db $0B,$10,$FF                       ;009BC0|        |      ;
 
               PAL_13: db $00,$3F,$0F,$07,$17,$20,$0F,$01   ;009BC3|        |      ;
 
                       db $12,$20,$0F,$01,$09,$08,$0F,$01   ;009BCB|        |      ;
                       db $0B,$10,$FF                       ;009BD3|        |      ;
 
               PAL_15: db $00,$3F,$0F,$07,$17,$20,$0F,$01   ;009BD6|        |      ;
 
                       db $21,$31,$0F,$01,$08,$28,$0F,$08   ;009BDE|        |      ;
                       db $18,$17,$FF                       ;009BE6|        |      ;
 
               PAL_16: db $00,$3F,$0F,$07,$17,$20,$0F,$06   ;009BE9|        |      ;
                       db $0B,$10,$0F,$01,$03,$10,$0F,$01   ;009BF1|        |      ;
                       db $1B,$3C,$FF                       ;009BF9|        |      ;
 
               PAL_17: db $2C,$21,$38,$39,$3A,$FE,$4C,$21   ;009BFC|        |      ;
                       db $55,$56,$FE,$6C,$21,$75,$76,$B1   ;009C04|        |      ;
                       db $FE,$8D,$21,$87,$FF               ;009C0C|        |      ;
 
               PAL_19: db $00,$3F,$0F,$16,$26,$20,$0F,$0B   ;009C11|        |      ;
                       db $1B,$01,$0F,$01,$11,$20,$0F,$31   ;009C19|        |      ;
                       db $11,$21,$FF                       ;009C21|        |      ;
 
               PAL_1a: db $00,$3F,$0F,$16,$26,$20,$0F,$0B   ;009C24|        |      ;
                       db $1B,$01,$0F,$11,$11,$31,$0F,$31   ;009C2C|        |      ;
                       db $11,$21,$FF                       ;009C34|        |      ;
 
               PAL_1b: db $00,$3F,$0F,$16,$26,$20,$0F,$0B   ;009C37|        |      ;
                       db $1B,$01,$0F,$21,$11,$21,$0F,$31   ;009C3F|        |      ;
 
                       db $11,$21,$FF                       ;009C47|        |      ;
 
               PAL_1c: db $00,$3F,$0F,$16,$26,$20,$0F,$0B   ;009C4A|        |      ;
                       db $1B,$01,$0F,$31,$11,$21,$0F,$31   ;009C52|        |      ;
                       db $11,$21,$FF                       ;009C5A|        |      ;
 
               PAL_1d: db $00,$3F,$0F,$06,$16,$20,$0F,$0F   ;009C5D|        |      ;
                       db $00,$0A,$0F,$0F,$0B,$2C,$0F,$00   ;009C65|        |      ;
                       db $2B,$3C,$FF                       ;009C6D|        |      ;
 
               PAL_1e: db $00,$3F,$0F,$08,$18,$38,$0F,$09   ;009C70|        |      ;
                       db $0C,$2C,$0F,$09,$00,$10,$0F,$09   ;009C78|        |      ;
                       db $13,$10,$0F,$0F,$10,$20,$0F,$0F   ;009C80|        |      ;
                       db $21,$38,$0F,$0F,$0F,$0F,$0F,$0F   ;009C88|        |      ;
                       db $16,$25,$FF                       ;009C90|        |      ;
 
               PAL_1f: db $00,$3F,$0F,$16,$26,$20,$0F,$00   ;009C93|        |      ;
                       db $10,$1A,$0F,$00,$0B,$2C,$0F,$02   ;009C9B|        |      ;
                       db $00,$10,$0F,$08,$26,$37,$0F,$0F   ;009CA3|        |      ;
                       db $22,$34,$0F,$0F,$0F,$0F,$0F,$0F   ;009CAB|        |      ;
                       db $16,$25,$FF                       ;009CB3|        |      ;
 
               PAL_2a: db $00,$3F,$0F,$0F,$26,$16,$0F,$0F   ;009CB6|        |      ;
                       db $07,$27,$0F,$0F,$02,$23,$0F,$0F   ;009CBE|        |      ;
                       db $19,$39,$FF                       ;009CC6|        |      ;
 
               PAL_2b: db $10,$3F,$38,$08,$27,$38,$38,$0F   ;009CC9|        |      ;
                       db $0C,$33,$38,$21,$11,$20,$38,$08   ;009CD1|        |      ;
                       db $18,$28,$FF                       ;009CD9|        |      ;
 
               PAL_2d: db $10,$3F,$38,$08,$27,$38,$38,$0F   ;009CDC|        |      ;
                       db $0C,$33,$38,$0F,$15,$36,$38,$08   ;009CE4|        |      ;
                       db $18,$28,$FF                       ;009CEC|        |      ;
 
               PAL_2c: db $10,$3F,$38,$08,$27,$38,$38,$0F   ;009CEF|        |      ;
                       db $0C,$33,$38,$08,$15,$38,$38,$08   ;009CF7|        |      ;
 
                       db $18,$28,$FF                       ;009CFF|        |      ;
 
               PAL_2e: db $00,$3F,$0F,$0F,$0F,$20,$0F,$0F   ;009D02|        |      ;
                       db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;009D0A|        |      ;
                       db $0F,$0F,$FF                       ;009D12|        |      ;
 
               PAL_2f: db $10,$3F,$0F,$08,$27,$38,$0F,$0F   ;009D15|        |      ;
                       db $0C,$33,$0F,$21,$11,$20,$0F,$08   ;009D1D|        |      ;
                       db $18,$28,$FF                       ;009D25|        |      ;
 
               PAL_31: db $10,$3F,$0F,$08,$27,$38,$0F,$0F   ;009D28|        |      ;
                       db $0C,$33,$0F,$0F,$15,$36,$0F,$08   ;009D30|        |      ;
                       db $18,$28,$FF                       ;009D38|        |      ;
 
               PAL_30: db $10,$3F,$0F,$08,$27,$38,$0F,$0F   ;009D3B|        |      ;
                       db $0C,$33,$0F,$08,$15,$38,$0F,$08   ;009D43|        |      ;
                       db $18,$28,$FF,$00,$3F,$0F,$16,$05   ;009D4B|        |      ;
                       db $20,$0F,$13,$02,$20,$0F,$14,$03   ;009D53|        |      ;
                       db $3B,$0F,$0F,$0F,$0F,$FF,$00,$3F   ;009D5B|        |      ;
                       db $0F,$0F,$0F,$0F,$0F,$10,$05,$01   ;009D63|        |      ;
                       db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;009D6B|        |      ;
                       db $FF                               ;009D73|        |      ;
 
               PAL_21: db $2A,$22,$5D,$5E,$63,$00,$52,$5E   ;009D74|        |      ;
                       db $5C,$5F,$5B,$54,$63,$54,$FE,$4B   ;009D7C|        |      ;
                       db $22,$63,$61,$68,$00,$50,$56,$50   ;009D84|        |      ;
                       db $58,$5D,$FF                       ;009D8C|        |      ;
 
               PAL_23: db $08,$22,$86,$A4,$A4,$A4,$A4,$A4   ;009D8F|        |      ;
                       db $A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4   ;009D97|        |      ;
                       db $A4,$87,$FE,$28,$22,$96,$00,$00   ;009D9F|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;009DA7|        |      ;
                       db $00,$00,$00,$00,$97,$FE,$48,$22   ;009DAF|        |      ;
                       db $96,$00,$00,$00,$00,$00,$00,$00   ;009DB7|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$97   ;009DBF|        |      ;
                       db $FE,$68,$22,$A6,$A5,$A5,$A5,$A5   ;009DC7|        |      ;
                       db $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5   ;009DCF|        |      ;
                       db $A5,$A5,$A7,$FF                   ;009DD7|        |      ;
 
         DATA8_009DDB: db $A5,$6B,$20,$6D,$E8,$FA,$9D,$51   ;009DDB|        |      ;
                       db $9E,$88,$9E,$C5,$9E,$FF,$9E,$19   ;009DE3|        |      ;
                       db $9F,$50,$9F,$91,$9F,$AC,$9F,$F0   ;009DEB|        |      ;
                       db $9F,$08,$A0,$28,$A0,$50,$A0,$A9   ;009DF3|        |      ;
 
                       db $B0,$85,$FF,$A9,$00,$85,$31,$AA   ;009DFB|        |      ;
 
          CODE_009E03: STA.W r_bossBoneDragonKingRips,X     ;009E03|9DEC07  |0007EC;
                       INX                                  ;009E06|E8      |      ;
                       CPX.B #$08                           ;009E07|E008    |      ;
                       BNE CODE_009E03                      ;009E09|D0F8    |009E03;
                       db $20                               ;009E0B|        |      ;
                       dw swap2Bank_00_Plus                 ;009E0C|        |0FE795;
                       LDA.B #$01                           ;009E0E|A901    |      ;
                       STA.B r_autoPlay                     ;009E10|852C    |00002C;
                       db $20                               ;009E12|        |      ;
                       dw initClearScreen_clearIRQfunc      ;009E13|        |0FE666;
                       JSR.W CODE_00A2B4                    ;009E15|20B4A2  |00A2B4;
                       db $20                               ;009E18|        |      ;
                       dw initSound                         ;009E19|        |0FE227;
                       LDA.B #$44                           ;009E1B|A944    |      ;
                       STA.W $5105                          ;009E1D|8D0551  |005105;
                       db $20                               ;009E20|        |      ;
                       dw setNameTableMapping_E4            ;009E21|        |0FEBFD;
                       JSR.W CODE_00A247                    ;009E23|2047A2  |00A247;
 
                       LDY.B r_0a4                          ;009E26|A4A4    |0000A4;
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
                       STA.B r_counter_ShowSprBg            ;009E47|851C    |00001C;
 
          CODE_009E49: INC.B r_menuSelectIdx                ;009E49|E66B    |00006B;
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
                       STA.B r_timerGenerel                 ;009E6A|8530    |000030;
                       JMP.W CODE_009E49                    ;009E6C|4C499E  |009E49;
 
 
          CODE_009E6F: JSR.W CODE_009E49                    ;009E6F|20499E  |009E49;
                       LDA.B #$03                           ;009E72|A903    |      ;
                       STA.B r_menuSelectIdx                ;009E74|856B    |00006B;
                       LDA.B #$40                           ;009E76|A940    |      ;
                       STA.B r_timerGenerel                 ;009E78|8530    |000030;
                       RTS                                  ;009E7A|60      |      ;
 
 
          CODE_009E7B: LDA.B r_PPUCtrl                      ;009E7B|A5FF    |0000FF;
                       AND.B #$FC                           ;009E7D|29FC    |      ;
                       STA.B r_PPUCtrl                      ;009E7F|85FF    |0000FF;
                       LDA.B #$00                           ;009E81|A900    |      ;
                       STA.B r_ScrollX                      ;009E83|85FD    |0000FD;
                       JMP.W CODE_009E49                    ;009E85|4C499E  |009E49;
 
                       LDY.B $31                            ;009E88|A431    |000031;
                       BNE CODE_009EB6                      ;009E8A|D02A    |009EB6;
                       DEC.B r_timerGenerel                 ;009E8C|C630    |000030;
                       BEQ CODE_009E7B                      ;009E8E|F0EB    |009E7B;
                       JSR.W DATA8_00A1FA                   ;009E90|20FAA1  |00A1FA;
                       LDA.B r_timerGenerel                 ;009E93|A530    |000030;
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
                       STA.B r_timerGenerel                 ;009EC0|8530    |000030;
                       JMP.W CODE_009E49                    ;009EC2|4C499E  |009E49;
 
 
                       LDA.W $07ED                          ;009EC5|ADED07  |0007ED;
                       AND.B #$20                           ;009EC8|2920    |      ;
                       BEQ CODE_009EF3                      ;009ECA|F027    |009EF3;
                       LDY.W $07F3                          ;009ECC|ACF307  |0007F3;
                       BNE CODE_009EDD                      ;009ECF|D00C    |009EDD;
                       DEC.B r_timerGenerel                 ;009ED1|C630    |000030;
                       BNE CODE_009EFE                      ;009ED3|D029    |009EFE;
                       LDA.B #$20                           ;009ED5|A920    |      ;
                       STA.B r_timerGenerel                 ;009ED7|8530    |000030;
 
                       INC.W $07F3                          ;009ED9|EEF307  |0007F3;
                       RTS                                  ;009EDC|60      |      ;
 
 
          CODE_009EDD: DEC.B r_timerGenerel                 ;009EDD|C630    |000030;
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
                       STA.B r_menuSelectIdx                ;009EF8|856B    |00006B;
                       LDA.B #$40                           ;009EFA|A940    |      ;
                       STA.B r_timerGenerel                 ;009EFC|8530    |000030;
 
          CODE_009EFE: RTS                                  ;009EFE|60      |      ;
 
                       INC.W r_EffectSpeedGeneral           ;009EFF|EE8407  |000784;
                       DEC.W $0783                          ;009F02|CE8307  |000783;
                       BNE CODE_009EFE                      ;009F05|D0F7    |009EFE;
                       INC.W r_FogParallelPos               ;009F07|EE8207  |000782;
                       JSR.W CODE_009E49                    ;009F0A|20499E  |009E49;
 
                       LDA.B #$80                           ;009F0D|A980    |      ;
                       STA.W $0783                          ;009F0F|8D8307  |000783;
                       LDA.B #$20                           ;009F12|A920    |      ;
                       STA.B r_timerGenerel                 ;009F14|8530    |000030;
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
 
          CODE_009F30: DEC.B r_timerGenerel                 ;009F30|C630    |000030;
 
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
                       STA.B r_timerGenerel                 ;009F74|8530    |000030;
                       JMP.W CODE_009E49                    ;009F76|4C499E  |009E49;
 
 
          CODE_009F79: JSR.W CODE_009E49                    ;009F79|20499E  |009E49;
                       LDA.B #$08                           ;009F7C|A908    |      ;
                       STA.B r_menuSelectIdx                ;009F7E|856B    |00006B;
                       LDA.B #$40                           ;009F80|A940    |      ;
                       STA.B r_timerGenerel                 ;009F82|8530    |000030;
 
          CODE_009F84: RTS                                  ;009F84|60      |      ;
 
 
          CODE_009F85: JSR.W CODE_009E49                    ;009F85|20499E  |009E49;
                       LDA.B #$0A                           ;009F88|A90A    |      ;
                       STA.B r_menuSelectIdx                ;009F8A|856B    |00006B;
                       LDA.B #$40                           ;009F8C|A940    |      ;
                       STA.B r_timerGenerel                 ;009F8E|8530    |000030;
 
                       RTS                                  ;009F90|60      |      ;
 
                       JSR.W CODE_00A0A8                    ;009F91|20A8A0  |00A0A8;
                       DEC.B r_timerGenerel                 ;009F94|C630    |000030;
                       BNE CODE_009F84                      ;009F96|D0EC    |009F84;
                       JSR.W CODE_00A084                    ;009F98|2084A0  |00A084;
                       LDA.B #$AA                           ;009F9B|A9AA    |      ;
                       STA.W $0403                          ;009F9D|8D0304  |000403;
                       JSR.W CODE_009E49                    ;009FA0|20499E  |009E49;
                       LDA.B #$0A                           ;009FA3|A90A    |      ;
                       STA.B r_menuSelectIdx                ;009FA5|856B    |00006B;
                       LDA.B #$40                           ;009FA7|A940    |      ;
 
                       STA.B r_timerGenerel                 ;009FA9|8530    |000030;
 
          CODE_009FAB: RTS                                  ;009FAB|60      |      ;
 
                       LDY.W $07F3                          ;009FAC|ACF307  |0007F3;
                       BNE CODE_009FB9                      ;009FAF|D008    |009FB9;
                       DEC.B r_timerGenerel                 ;009FB1|C630    |000030;
                       BNE CODE_009FAB                      ;009FB3|D0F6    |009FAB;
                       INC.W $07F3                          ;009FB5|EEF307  |0007F3;
                       RTS                                  ;009FB8|60      |      ;
 
 
          CODE_009FB9: LDA.B #$AA                           ;009FB9|A9AA    |      ;
                       STA.W $0403                          ;009FBB|8D0304  |000403;
                       LDX.B #$03                           ;009FBE|A203    |      ;
                       CLC                                  ;009FC0|18      |      ;
                       LDA.B #$24                           ;009FC1|A924    |      ;
                       ADC.W r_entity_FractionalX,X         ;009FC3|7DC404  |0004C4;
                       STA.W r_entity_FractionalX,X         ;009FC6|9DC404  |0004C4;
                       LDA.B #$00                           ;009FC9|A900    |      ;
                       ADC.W r_entity_XPos,X                ;009FCB|7D3804  |000438;
                       STA.W r_entity_XPos,X                ;009FCE|9D3804  |000438;
                       CLC                                  ;009FD1|18      |      ;
                       LDA.B #$F0                           ;009FD2|A9F0    |      ;
                       ADC.W r_entity_FractionalY,X         ;009FD4|7DDB04  |0004DB;
                       STA.W r_entity_FractionalY,X         ;009FD7|9DDB04  |0004DB;
                       LDA.B #$FF                           ;009FDA|A9FF    |      ;
                       ADC.W r_entity_YPos,X                ;009FDC|7D1C04  |00041C;
                       STA.W r_entity_YPos,X                ;009FDF|9D1C04  |00041C;
                       LDA.W r_entity_XPos,X                ;009FE2|BD3804  |000438;
                       CMP.B #$9A                           ;009FE5|C99A    |      ;
 
                       BCC CODE_00A04F                      ;009FE7|9066    |00A04F;
                       LDA.B #$4F                           ;009FE9|A94F    |      ;
                       STA.B r_timerGenerel                 ;009FEB|8530    |000030;
                       JMP.W CODE_009E49                    ;009FED|4C499E  |009E49;
 
                       JSR.W CODE_00A0B1                    ;009FF0|20B1A0  |00A0B1;
                       DEC.B r_timerGenerel                 ;009FF3|C630    |000030;
                       BNE CODE_00A04F                      ;009FF5|D058    |00A04F;
                       LDA.B #$00                           ;009FF7|A900    |      ;
                       STA.W $0403                          ;009FF9|8D0304  |000403;
                       JSR.W CODE_009E49                    ;009FFC|20499E  |009E49;
                       LDA.B #$40                           ;009FFF|A940    |      ;
                       STA.B r_timerGenerel                 ;00A001|8530    |000030; NES PRG 2000
 
          CODE_00A003: LDA.B #$20                           ;00A003|A920    |      ;
                       JMP.W CODE_00A272                    ;00A005|4C72A2  |00A272;
 
                       LDY.W $07F3                          ;00A008|ACF307  |0007F3;
                       BNE CODE_00A01B                      ;00A00B|D00E    |00A01B;
                       DEC.B r_timerGenerel                 ;00A00D|C630    |000030;
                       BNE CODE_00A04F                      ;00A00F|D03E    |00A04F;
                       LDA.B #$20                           ;00A011|A920    |      ;
                       STA.B r_timerGenerel                 ;00A013|8530    |000030;
                       INC.W $07F3                          ;00A015|EEF307  |0007F3;
                       JMP.W CODE_00A442                    ;00A018|4C42A4  |00A442;
 
 
          CODE_00A01B: JSR.W CODE_00A303                    ;00A01B|2003A3  |00A303;
                       DEC.B r_timerGenerel                 ;00A01E|C630    |000030;
 
                       BNE CODE_00A04F                      ;00A020|D02D    |00A04F;
                       JSR.W CODE_00A3AD                    ;00A022|20ADA3  |00A3AD;
                       JMP.W CODE_009E49                    ;00A025|4C499E  |009E49;
 
                       JSR.W CODE_00A303                    ;00A028|2003A3  |00A303;
                       JSR.W progressionAfterMap            ;00A02B|20D0A0  |00A0D0;
                       INC.W $07F2                          ;00A02E|EEF207  |0007F2;
                       LDA.W $07F2                          ;00A031|ADF207  |0007F2;
                       AND.B #$0F                           ;00A034|290F    |      ;
                       BNE CODE_00A03D                      ;00A036|D005    |00A03D;
                       LDA.B #$09                           ;00A038|A909    |      ;
                       db $20                               ;00A03A|        |      ;
                       dw initFreezWaterEffect_01           ;00A03B|        |0FE25F;
 
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
                       LDA.B r_sceneDrawQueue               ;00A053|A51D    |00001D;
                       STA.B r_15                           ;00A055|8515    |000015;
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
                       dw CODE_0FE5BF                       ;00A074|        |0FE5BF;
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
 
          CODE_00A0B7: AND.B r_timerGenerel                 ;00A0B7|2530    |000030;
                       BEQ CODE_00A0A2                      ;00A0B9|F0E7    |00A0A2;
                       JMP.W CODE_00A084                    ;00A0BB|4C84A0  |00A084;
 
 
          CODE_00A0BE: LDA.B r_timerGenerel                 ;00A0BE|A530    |000030;
                       LSR A                                ;00A0C0|4A      |      ;
                       LSR A                                ;00A0C1|4A      |      ;
                       LSR A                                ;00A0C2|4A      |      ;
                       LSR A                                ;00A0C3|4A      |      ;
                       TAY                                  ;00A0C4|A8      |      ;
                       RTS                                  ;00A0C5|60      |      ;
 
 
         DATA8_00A0C6: db $10,$08,$04,$02,$01               ;00A0C6|        |      ;
 
         DATA8_00A0CB: db $01,$02,$04,$08,$10               ;00A0CB|        |      ;
 
  progressionAfterMap: LDX.B #$01                           ;00A0D0|A201    |      ;
                       LDA.W r_OamSpecIdxDoubled,X          ;00A0D2|BD0004  |000400;
                       BEQ CODE_00A0E0                      ;00A0D5|F009    |00A0E0;
                       JSR.W DATA8_00A41D                   ;00A0D7|201DA4  |00A41D;
                       db $20                               ;00A0DA|        |      ;
                       dw CODE_0FEF75                       ;00A0DB|        |0FEF75;
                       JSR.W CODE_00A3EE                    ;00A0DD|20EEA3  |00A3EE;
 
          CODE_00A0E0: LDA.B r_partner                      ;00A0E0|A53A    |00003A;
                       BMI CODE_00A11C                      ;00A0E2|3038    |00A11C;
                       LDX.B #$02                           ;00A0E4|A202    |      ;
                       LDA.W r_OamSpecIdxDoubled,X          ;00A0E6|BD0004  |000400;
                       BEQ CODE_00A11C                      ;00A0E9|F031    |00A11C;
                       JSR.W DATA8_00A41D                   ;00A0EB|201DA4  |00A41D;
                       db $4C                               ;00A0EE|        |      ;
 
                       dw CODE_0FEF75                       ;00A0EF|        |0FEF75;
 
         DATA8_00A0F1: db $20                               ;00A0F1|        |      ;
                       dw initClearScreen_clearIRQfunc      ;00A0F2|        |0FE666;
                       LDA.B #$44                           ;00A0F4|A944    |      ;
                       STA.B r_updateNametable              ;00A0F6|8525    |000025;
                       LDA.B r_PPUCtrl                      ;00A0F8|A5FF    |0000FF;
                       AND.B #$FC                           ;00A0FA|29FC    |      ;
                       STA.B r_PPUCtrl                      ;00A0FC|85FF    |0000FF;
                       LDA.B #$00                           ;00A0FE|A900    |      ;
                       STA.B r_menuSelectIdx                ;00A100|856B    |00006B;
                       LDA.B #$1F                           ;00A102|A91F    |      ;
 
                       STA.B r_gameTransition               ;00A104|852A    |00002A;
                       LDA.B r_0a4                          ;00A106|A5A4    |0000A4;
                       ASL A                                ;00A108|0A      |      ;
                       CLC                                  ;00A109|18      |      ;
                       ADC.B r_0a4                          ;00A10A|65A4    |0000A4;
                       TAY                                  ;00A10C|A8      |      ;
                       LDA.W progressionTableStage,Y        ;00A10D|B91DA1  |00A11D;
                       STA.B r_stage                        ;00A110|8532    |000032;
                       LDA.W progressionTableBlock,Y        ;00A112|B91EA1  |00A11E;
                       STA.B r_blockLevel                   ;00A115|8533    |000033;
                       LDA.W progressionTableRoom,Y         ;00A117|B91FA1  |00A11F;
                       STA.B r_roomIdx                      ;00A11A|8534    |000034;
 
          CODE_00A11C: RTS                                  ;00A11C|60      |      ;
 
 
progressionTableStage: db $00                               ;00A11D|        |      ;
 
progressionTableBlock: db $00                               ;00A11E|        |      ;
 
 progressionTableRoom: db $00,$01,$03,$02,$02,$01,$00,$03   ;00A11F|        |      ;
                       db $00,$02,$04,$00,$00,$05,$00,$00   ;00A127|        |      ;
                       db $0B,$00,$00,$07,$00,$01,$07,$05   ;00A12F|        |      ;
                       db $00,$09,$00,$00,$0A,$00,$00,$0A   ;00A137|        |      ;
 
                       db $00,$00,$0C,$00,$00,$0C,$00,$00   ;00A13F|        |      ;
                       db $0D,$00,$00,$0E,$00,$02           ;00A147|        |      ;
 
loadPointerScreenLoad: dw LOOSE_OP_00BA6A                   ;00A14D|        |00BA6A;
                       dw CODE_00BBBE                       ;00A14F|        |00BBBE;
 
                       dw DATA8_00B9FC                      ;00A151|        |00B9FC;
 
                       dw LOOSE_OP_00BA5E                   ;00A153|        |00BA5E;
 
   PPUdestLargeLayout: dw $2C80,$2FC8,$2E00,$2FE0           ;00A155|        |      ;
 
   RLE_namScreenIndex: dw $FE0C,$1C0C,$1210,$1CFF           ;00A15D|        |      ;
                       dw $140E,$1210,$00FF,$0002           ;00A165|        |      ;
                       dw $4407,$4444,$AD50,$07EE           ;00A16D|        |      ;
                       dw $0329                             ;00A175|        |      ;
                       TAY                                  ;00A177|A8      |      ;
                       LDA.W RLE_namScreenAtri,Y            ;00A178|B96AA1  |00A16A;
                       STA.B r_index                        ;00A17B|8510    |000010;
                       LDA.W RLE_namScreenMapping_5105,Y    ;00A17D|B96EA1  |00A16E;
                       STA.B r_updateNametable              ;00A180|8525    |000025;
                       STA.W $5105                          ;00A182|8D0551  |005105;
 
          CODE_00A185: LDY.B r_index                        ;00A185|A410    |000010;
                       LDA.B #$8A                           ;00A187|A98A    |      ;
                       LDX.W RLE_namScreenIndex,Y           ;00A189|BE5DA1  |00A15D;
                       BMI CODE_00A19C                      ;00A18C|300E    |00A19C;
                       CPX.B #$0C                           ;00A18E|E00C    |      ;
                       BNE DATA8_00A194                     ;00A190|D002    |00A194;
                       LDA.B #$98                           ;00A192|A998    |      ;
 
         DATA8_00A194: db $20                               ;00A194|        |      ;
                       dw screenLoadRoutine01               ;00A195|        |0FEBD5;
                       INC.B r_index                        ;00A197|E610    |000010;
                       JMP.W CODE_00A185                    ;00A199|4C85A1  |00A185;
 
 
          CODE_00A19C: CPX.B #$FF                           ;00A19C|E0FF    |      ;
                       BCS CODE_00A1C6                      ;00A19E|B026    |00A1C6;
 
                       LDA.B #$00                           ;00A1A0|A900    |      ;
                       STA.B r_index                        ;00A1A2|8510    |000010;
 
          CODE_00A1A4: LDY.B r_index                        ;00A1A4|A410    |000010;
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
                       INC.B r_index                        ;00A1BC|E610    |000010;
                       INC.B r_index                        ;00A1BE|E610    |000010;
                       LDA.B r_index                        ;00A1C0|A510    |000010;
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
                       STA.B r_CHR_BankBG_0000              ;00A1D7|854A    |00004A;
                       STA.B r_CHR_BankBG_0400              ;00A1D9|854B    |00004B;
                       STA.B r_CHR_BankBG_0800              ;00A1DB|854C    |00004C;
                       STA.B r_CHR_BankBG_0c00              ;00A1DD|854D    |00004D;
 
          CODE_00A1DF: RTS                                  ;00A1DF|60      |      ;
 
 
          CODE_00A1E0: LDA.B #$00                           ;00A1E0|A900    |      ;
                       STA.B r_CHR_BankSpr_0000             ;00A1E2|8546    |000046;
                       LDY.B r_partner                      ;00A1E4|A43A    |00003A;
                       INY                                  ;00A1E6|C8      |      ;
                       LDA.W DATA8_00A1F5,Y                 ;00A1E7|B9F5A1  |00A1F5;
                       STA.B r_CHR_BankSpr_0400             ;00A1EA|8547    |000047;
                       LDA.B #$7E                           ;00A1EC|A97E    |      ;
                       STA.B r_CHR_BankSpr_0800             ;00A1EE|8548    |000048;
                       LDA.B #$7B                           ;00A1F0|A97B    |      ;
                       STA.B r_CHR_BankSpr_0c00             ;00A1F2|8549    |000049;
                       RTS                                  ;00A1F4|60      |      ;
 
 
         DATA8_00A1F5: db $00,$00,$04,$02,$06               ;00A1F5|        |      ;
 
         DATA8_00A1FA: db $A5,$30,$29,$0F,$D0,$0B,$A5,$30   ;00A1FA|        |      ;
                       db $C9,$D0,$B0,$05,$A9,$3A,$20,$5F   ;00A202|        |      ;
                       db $E2,$A5,$30,$4A,$4A,$4A,$4A,$A8   ;00A20A|        |      ;
                       db $B9,$37,$A2,$85,$00               ;00A212|        |      ;
                       LDA.B r_gameStateLoopCounter         ;00A217|A51A    |00001A;
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
 
                       db $01,$01,$01,$01,$01,$01,$02,$02   ;00A237|        |      ;
                       db $02,$02,$02,$01,$00,$00,$00,$00   ;00A23F|        |      ;
 
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
                       STA.W r_entity_OamSpecGroupDoubled,X ;00A25C|9D8C04  |00048C;
                       STA.W r_entity_XPos,X                ;00A25F|9D3804  |000438;
                       STA.W r_entity_YPos,X                ;00A262|9D1C04  |00041C;
                       STA.W r_entity_PaletteOverride,X     ;00A265|9D5404  |000454;
                       STA.W r_entity_Effect,X              ;00A268|9D7004  |000470;
                       STA.W r_entity_FacingLeft,X          ;00A26B|9DA804  |0004A8;
                       STA.W r_entity_AnimGroup,X           ;00A26E|9DAA05  |0005AA;
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
 
          CODE_00A289: LDA.B r_partner                      ;00A289|A53A    |00003A;
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
                       STA.W r_spawnerID                    ;00A2CF|8DC207  |0007C2;
                       RTS                                  ;00A2D2|60      |      ;
 
 
         DATA8_00A2D3: db $0F,$0F,$16,$24,$0F,$0F,$05,$16   ;00A2D3|        |      ;
 
                       db $0F,$08,$15,$38,$0F,$0F,$15,$36   ;00A2DB|        |      ;
                       db $0F,$00,$07,$17,$0F,$07,$17,$20   ;00A2E3|        |      ;
                       db $0F,$00,$03,$13,$0F,$02,$03,$11   ;00A2EB|        |      ;
                       db $0F,$08,$28,$37,$0F,$21,$11,$20   ;00A2F3|        |      ;
                       db $0F,$0F,$21,$20,$0F,$0F,$07,$20   ;00A2FB|        |      ;
 
          CODE_00A303: LDY.B #$01                           ;00A303|A001    |      ;
                       LDA.W $07F1                          ;00A305|ADF107  |0007F1;
                       BEQ CODE_00A32B                      ;00A308|F021    |00A32B;
                       CMP.B #$06                           ;00A30A|C906    |      ;
                       BEQ CODE_00A310                      ;00A30C|F002    |00A310;
                       LDY.B #$00                           ;00A30E|A000    |      ;
 
          CODE_00A310: STY.B r_collisionPointYinScreen      ;00A310|8411    |000011;
                       INC.W r_bossBoneDragonKingRips       ;00A312|EEEC07  |0007EC;
                       LDA.W $07ED                          ;00A315|ADED07  |0007ED;
                       AND.B #$1F                           ;00A318|291F    |      ;
                       CMP.B #$0E                           ;00A31A|C90E    |      ;
                       BCS CODE_00A340                      ;00A31C|B022    |00A340;
                       LDA.W r_bossBoneDragonKingRips       ;00A31E|ADEC07  |0007EC;
                       AND.B #$3F                           ;00A321|293F    |      ;
                       CMP.B #$1F                           ;00A323|C91F    |      ;
                       BEQ CODE_00A377                      ;00A325|F050    |00A377;
                       CMP.B #$3F                           ;00A327|C93F    |      ;
                       BEQ CODE_00A32C                      ;00A329|F001    |00A32C;
 
          CODE_00A32B: RTS                                  ;00A32B|60      |      ;
 
 
          CODE_00A32C: LDA.B r_collisionPointYinScreen      ;00A32C|A511    |000011;
                       BNE CODE_00A38B                      ;00A32E|D05B    |00A38B;
                       LDX.B #$03                           ;00A330|A203    |      ;
 
          CODE_00A332: LDA.W r_entity_Effect,X              ;00A332|BD7004  |000470;
                       AND.B #$7F                           ;00A335|297F    |      ;
                       STA.W r_entity_Effect,X              ;00A337|9D7004  |000470;
                       INX                                  ;00A33A|E8      |      ;
                       CPX.B #$0A                           ;00A33B|E00A    |      ;
                       BNE CODE_00A332                      ;00A33D|D0F3    |00A332;
                       RTS                                  ;00A33F|60      |      ;
 
 
          CODE_00A340: LDA.W r_bossBoneDragonKingRips       ;00A340|ADEC07  |0007EC;
                       AND.B #$7F                           ;00A343|297F    |      ;
                       STA.B $00                            ;00A345|8500    |000000;
                       LDA.W r_bossBoneDragonKingRips       ;00A347|ADEC07  |0007EC;
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
                       STA.W r_entity_AnimGroup,X           ;00A373|9DAA05  |0005AA;
 
          CODE_00A376: RTS                                  ;00A376|60      |      ;
 
 
          CODE_00A377: LDA.B r_collisionPointYinScreen      ;00A377|A511    |000011;
                       BNE CODE_00A39C                      ;00A379|D021    |00A39C;
                       LDX.B #$03                           ;00A37B|A203    |      ;
 
          CODE_00A37D: LDA.W r_entity_Effect,X              ;00A37D|BD7004  |000470;
                       ORA.B #$80                           ;00A380|0980    |      ;
                       STA.W r_entity_Effect,X              ;00A382|9D7004  |000470;
                       INX                                  ;00A385|E8      |      ;
                       CPX.B #$0A                           ;00A386|E00A    |      ;
                       BNE CODE_00A37D                      ;00A388|D0F3    |00A37D;
                       RTS                                  ;00A38A|60      |      ;
 
 
          CODE_00A38B: JSR.W CODE_00A084                    ;00A38B|2084A0  |00A084;
                       LDA.B #$06                           ;00A38E|A906    |      ;
                       LDX.B #$03                           ;00A390|A203    |      ;
                       JSR.W CODE_00A447                    ;00A392|2047A4  |00A447;
                       LDA.B #$17                           ;00A395|A917    |      ;
                       STA.B r_index                        ;00A397|8510    |000010;
                       JMP.W CODE_00A272                    ;00A399|4C72A2  |00A272;
 
 
          CODE_00A39C: JSR.W CODE_00A0A2                    ;00A39C|20A2A0  |00A0A2;
                       LDA.B #$07                           ;00A39F|A907    |      ;
                       LDX.B #$03                           ;00A3A1|A203    |      ;
                       JSR.W CODE_00A447                    ;00A3A3|2047A4  |00A447;
                       LDA.B #$20                           ;00A3A6|A920    |      ;
                       STA.B r_index                        ;00A3A8|8510    |000010;
                       JMP.W CODE_00A272                    ;00A3AA|4C72A2  |00A272;
 
 
          CODE_00A3AD: LDY.B r_partnerIdx                   ;00A3AD|A43B    |00003B;
                       LDA.W r_039,Y                        ;00A3AF|B93900  |000039;
                       TAY                                  ;00A3B2|A8      |      ;
                       LDX.B #$01                           ;00A3B3|A201    |      ;
 
          CODE_00A3B5: LDA.W DATA8_00A419,Y                 ;00A3B5|B919A4  |00A419;
                       STA.W r_entity_PaletteOverride,X     ;00A3B8|9D5404  |000454;
                       LDA.W DATA8_00A415,Y                 ;00A3BB|B915A4  |00A415;
                       STA.W r_entity_YPos,X                ;00A3BE|9D1C04  |00041C;
                       LDA.W DATA8_00A411,Y                 ;00A3C1|B911A4  |00A411;
                       STA.W r_entity_AnimGroup,X           ;00A3C4|9DAA05  |0005AA;
                       LDA.W DATA8_00A40D,Y                 ;00A3C7|B90DA4  |00A40D;
                       STA.W r_entity_OamSpecGroupDoubled,X ;00A3CA|9D8C04  |00048C;
                       LDA.B #$01                           ;00A3CD|A901    |      ;
                       STA.W r_entity_AnimTimer,X           ;00A3CF|9D7C05  |00057C;
                       LDA.B #$00                           ;00A3D2|A900    |      ;
                       STA.W r_entity_OamBaseOffset,X       ;00A3D4|9D9305  |000593;
                       LDY.B #$01                           ;00A3D7|A001    |      ;
                       LDA.W $07ED                          ;00A3D9|ADED07  |0007ED;
                       AND.B #$40                           ;00A3DC|2940    |      ;
                       BEQ CODE_00A3E2                      ;00A3DE|F002    |00A3E2;
                       LDY.B #$FF                           ;00A3E0|A0FF    |      ;
 
          CODE_00A3E2: TYA                                  ;00A3E2|98      |      ;
                       STA.W r_entity_XPos,X                ;00A3E3|9D3804  |000438;
 
                       BPL DATA8_00A3EB                     ;00A3E6|1003    |00A3EB;
                       INC.W r_entity_FacingLeft,X          ;00A3E8|FEA804  |0004A8;
 
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
                       LDY.B r_partner                      ;00A400|A43A    |00003A;
                       BMI DATA8_00A433                     ;00A402|302F    |00A433;
                       LDA.B r_partnerIdx                   ;00A404|A53B    |00003B;
                       BEQ CODE_00A40A                      ;00A406|F002    |00A40A;
                       LDY.B #$00                           ;00A408|A000    |      ;
 
          CODE_00A40A: JMP.W CODE_00A3B5                    ;00A40A|4CB5A3  |00A3B5;
 
 
         DATA8_00A40D: db $00,$0C,$0C,$0C                   ;00A40D|        |      ;
 
         DATA8_00A411: db $00,$36,$37,$38                   ;00A411|        |      ;
 
         DATA8_00A415: db $C0,$C0,$C4,$C0                   ;00A415|        |      ;
 
         DATA8_00A419: db $00,$01,$01,$01                   ;00A419|        |      ;
 
         DATA8_00A41D: db $BD,$00,$04,$F0,$1C,$AD,$ED,$07   ;00A41D|        |      ;
                       db $29,$40,$D0,$0B,$FE,$38,$04,$BD   ;00A425|        |      ;
                       db $38,$04,$C9,$FC,$B0,$0C           ;00A42D|        |      ;
 
         DATA8_00A433: db $60,$DE,$38,$04,$BD,$38,$04,$C9   ;00A433|        |      ;
 
                       db $04,$90,$01,$60,$4C,$57,$A2       ;00A43B|        |      ;
 
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
                       STA.W r_entity_OamSpecGroupDoubled,X ;00A45E|9D8C04  |00048C;
                       LDA.B #$00                           ;00A461|A900    |      ;
                       STA.W r_entity_Effect,X              ;00A463|9D7004  |000470;
                       LDA.B #$00                           ;00A466|A900    |      ;
                       STA.W r_entity_PaletteOverride,X     ;00A468|9D5404  |000454;
                       LDA.B #$01                           ;00A46B|A901    |      ;
                       STA.W r_entity_FacingLeft,X          ;00A46D|9DA804  |0004A8;
                       STA.W r_entity_AnimTimer,X           ;00A470|9D7C05  |00057C;
                       LDA.B ($00),Y                        ;00A473|B100    |000000;
                       STA.W r_OamSpecIdxDoubled,X          ;00A475|9D0004  |000400;
                       INY                                  ;00A478|C8      |      ;
                       LDA.B ($00),Y                        ;00A479|B100    |000000;
                       STA.W r_entity_XPos,X                ;00A47B|9D3804  |000438;
                       INY                                  ;00A47E|C8      |      ;
                       LDA.B ($00),Y                        ;00A47F|B100    |000000;
                       STA.W r_entity_YPos,X                ;00A481|9D1C04  |00041C;
                       INY                                  ;00A484|C8      |      ;
                       INX                                  ;00A485|E8      |      ;
                       DEC.B $02                            ;00A486|C602    |000002;
                       BNE CODE_00A45C                      ;00A488|D0D2    |00A45C;
 
          CODE_00A48A: RTS                                  ;00A48A|60      |      ;
 
 
         DATA8_00A48B: db $01,$C2,$04,$06,$08,$49,$33,$0B   ;00A48B|        |      ;
                       db $0C,$71,$F2,$52,$14,$14,$15,$56   ;00A493|        |      ;
                       db $16                               ;00A49B|        |      ;
 
         DATA8_00A49C: db $00,$00,$00,$00,$00,$00,$00,$00   ;00A49C|        |      ;
                       db $00,$01,$D1,$D3,$73,$02,$02,$02   ;00A4A4|        |      ;
                       db $02                               ;00A4AC|        |      ;
 
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
                       db $31,$49,$D6,$35,$2B,$D8,$3F,$51   ;00A4DD|        |      ;
 
         DATA8_00A4E5: db $03,$A2,$58,$4F,$D6,$55,$33,$D8   ;00A4E5|        |      ;
                       db $4A,$57                           ;00A4ED|        |      ;
 
         DATA8_00A4EF: db $04,$A6,$35,$75,$A8,$4F,$87,$D6   ;00A4EF|        |      ;
                       db $40,$59,$D8,$59,$83               ;00A4F7|        |      ;
 
         DATA8_00A4FC: db $01,$AA,$77,$7B                   ;00A4FC|        |      ;
 
         DATA8_00A500: db $03,$AC,$77,$7B,$D6,$5F,$73,$D8   ;00A500|        |      ;
 
                       db $81,$62                           ;00A508|        |      ;
 
         DATA8_00A50A: db $03,$AE,$B2,$60,$D6,$AF,$5E,$D8   ;00A50A|        |      ;
                       db $B5,$44                           ;00A512|        |      ;
 
         DATA8_00A514: db $03,$B0,$A1,$4F,$D6,$AC,$52,$D8   ;00A514|        |      ;
                       db $86,$42                           ;00A51C|        |      ;
 
         DATA8_00A51E: db $03,$B4,$7F,$97,$D6,$64,$91,$D8   ;00A51E|        |      ;
                       db $95,$87                           ;00A526|        |      ;
 
         DATA8_00A528: db $03,$B6,$AA,$85,$D6,$9B,$78,$D8   ;00A528|        |      ;
                       db $AB,$6D                           ;00A530|        |      ;
 
         DATA8_00A532: db $02,$EA,$90,$7F,$EC,$96,$6F       ;00A532|        |      ;
 
         DATA8_00A539: db $03,$EA,$98,$7F,$EC,$78,$75,$EC   ;00A539|        |      ;
                       db $6F,$37                           ;00A541|        |      ;
 
         DATA8_00A543: db $02,$EA,$22,$77,$EC,$6E,$7F       ;00A543|        |      ;
 
         DATA8_00A54A: db $02,$EA,$7A,$87,$EC,$BF,$6F       ;00A54A|        |      ;
 
         DATA8_00A551: db $02,$EA,$B7,$5C,$EC,$AC,$2F       ;00A551|        |      ;
 
         DATA8_00A558: db $02,$EA,$9B,$27,$F0,$69,$2F       ;00A558|        |      ;
 
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
 
         DATA8_00A583: db $38,$2D,$21,$39,$2E,$21,$3A,$4C   ;00A583|        |      ;
                       db $21,$55,$4D,$21,$56,$6C,$21,$75   ;00A58B|        |      ;
                       db $6D,$21,$76,$6E,$21,$B1,$8D,$21   ;00A593|        |      ;
                       db $87,$38,$22,$DF,$39,$22,$AB,$3A   ;00A59B|        |      ;
                       db $22,$D4,$57,$22,$AB,$58,$22,$EF   ;00A5A3|        |      ;
 
                       db $59,$22,$AB,$5A,$22,$EF,$77,$22   ;00A5AB|        |      ;
                       db $D2,$78,$22,$D3                   ;00A5B3|        |      ;
 
    gameState8_states: LDA.B r_gameSubstate                 ;00A5B7|A519    |000019;
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
                       dw stageTransition_69                ;00A5DD|        |0FE78A;
                       LDY.B #$00                           ;00A5DF|A000    |      ;
                       LDA.B r_stage                        ;00A5E1|A532    |000032;
                       CMP.B #$00                           ;00A5E3|C900    |      ;
                       BEQ CODE_00A5ED                      ;00A5E5|F006    |00A5ED;
                       INY                                  ;00A5E7|C8      |      ;
                       CMP.B #$02                           ;00A5E8|C902    |      ;
                       BEQ CODE_00A5ED                      ;00A5EA|F001    |00A5ED;
                       INY                                  ;00A5EC|C8      |      ;
 
          CODE_00A5ED: STY.W r_soundModeSongSelected        ;00A5ED|8C8007  |000780; stage progression 0 1 2
                       INC.B r_gameSubstate                 ;00A5F0|E619    |000019;
                       RTS                                  ;00A5F2|60      |      ;
 
 
 gameState8_substate1: db $20                               ;00A5F3|        |      ;
                       dw CODE_0FE73D                       ;00A5F4|        |0FE73D;
                       LDY.B #$00                           ;00A5F6|A000    |      ;
 
          CODE_00A5F8: LDA.W screensCHR_Data,Y              ;00A5F8|B93FA6  |00A63F;
                       STA.W r_CHR_BankSpr_0800,Y           ;00A5FB|994800  |000048;
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
                       LDA.W r_soundModeSongSelected        ;00A614|AD8007  |000780;
                       BEQ CODE_00A61E                      ;00A617|F005    |00A61E;
                       LDA.B #$17                           ;00A619|A917    |      ;
                       db $20                               ;00A61B|        |      ;
                       dw screenLoadRoutine                 ;00A61C|        |0FECE9;
 
          CODE_00A61E: LDA.W r_soundModeSongSelected        ;00A61E|AD8007  |000780;
 
                       ASL A                                ;00A621|0A      |      ;
                       TAY                                  ;00A622|A8      |      ;
                       LDA.W progression_780,Y              ;00A623|B91FAE  |00AE1F;
                       STA.B r_pointerQueue                 ;00A626|8508    |000008;
                       LDA.W PTR16_00AE20,Y                 ;00A628|B920AE  |00AE20;
                       STA.B $09                            ;00A62B|8509    |000009;
                       JSR.W CODE_00AD48                    ;00A62D|2048AD  |00AD48;
 
                       LDA.B #$78                           ;00A630|A978    |      ;
                       LDY.B #$00                           ;00A632|A000    |      ;
                       db $20                               ;00A634|        |      ;
                       dw CODE_0FE58E                       ;00A635|        |0FE58E;
                       LDA.B #$6C                           ;00A637|A96C    |      ;
                       db $20                               ;00A639|        |      ;
                       dw initFreezWaterEffect_01           ;00A63A|        |0FE25F;
                       INC.B r_gameSubstate                 ;00A63C|E619    |000019;
                       RTS                                  ;00A63E|60      |      ;
 
 
      screensCHR_Data: db $7E,$7B,$74,$75,$76,$77           ;00A63F|        |      ;
 
 gameState8_substate2: db $20                               ;00A645|        |      ;
                       dw CODE_0FE579                       ;00A646|        |0FE579;
                       BEQ CODE_00A64B                      ;00A648|F001    |00A64B;
                       RTS                                  ;00A64A|60      |      ;
 
 
          CODE_00A64B: LDY.B #$00                           ;00A64B|A000    |      ;
                       STY.W r_animTimerBG_CHR              ;00A64D|8C8107  |000781;
                       INY                                  ;00A650|C8      |      ;
                       STY.W r_FogParallelPos               ;00A651|8C8207  |000782;
                       INC.B r_gameSubstate                 ;00A654|E619    |000019;
                       RTS                                  ;00A656|60      |      ;
 
 
 gameState8_substate3: DEC.W r_FogParallelPos               ;00A657|CE8207  |000782;
                       BEQ CODE_00A65D                      ;00A65A|F001    |00A65D;
                       RTS                                  ;00A65C|60      |      ;
 
 
          CODE_00A65D: LDA.W r_animTimerBG_CHR              ;00A65D|AD8107  |000781;
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
                       INC.W r_animTimerBG_CHR              ;00A690|EE8107  |000781;
                       RTS                                  ;00A693|60      |      ;
 
 
          CODE_00A694: LDA.B #$00                           ;00A694|A900    |      ;
                       STA.W r_animTimerBG_CHR              ;00A696|8D8107  |000781;
                       INC.B r_gameSubstate                 ;00A699|E619    |000019;
                       RTS                                  ;00A69B|60      |      ;
 
 
       gameStat08_2f4: db $07                               ;00A69C|        |      ;
 
       gameStat08_2f5: db $17                               ;00A69D|        |      ;
 
       gameStat08_2f6: db $20                               ;00A69E|        |      ;
 
       gameStat08_782: db $04,$07,$07,$10,$04,$0F,$07,$10   ;00A69F|        |      ;
                       db $04,$0F,$0F,$10,$04,$0F,$0F,$0F   ;00A6A7|        |      ;
                       db $04,$FF                           ;00A6AF|        |      ;
 
 gameState8_substate4: LDA.W r_soundModeSongSelected        ;00A6B1|AD8007  |000780;
                       ASL A                                ;00A6B4|0A      |      ;
                       TAY                                  ;00A6B5|A8      |      ;
                       LDA.W PTR16_00AE25,Y                 ;00A6B6|B925AE  |00AE25;
                       STA.B r_temp_Xpos                    ;00A6B9|850A    |00000A;
                       LDA.W PTR16_00AE26,Y                 ;00A6BB|B926AE  |00AE26;
                       STA.B $0B                            ;00A6BE|850B    |00000B;
                       LDA.W r_animTimerBG_CHR              ;00A6C0|AD8107  |000781;
                       ASL A                                ;00A6C3|0A      |      ;
                       TAY                                  ;00A6C4|A8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;00A6C5|B10A    |00000A;
                       STA.B r_pointerQueue                 ;00A6C7|8508    |000008;
                       INY                                  ;00A6C9|C8      |      ;
                       CMP.B #$FF                           ;00A6CA|C9FF    |      ;
                       BEQ CODE_00A6D9                      ;00A6CC|F00B    |00A6D9;
                       LDA.B (r_temp_Xpos),Y                ;00A6CE|B10A    |00000A;
 
          CODE_00A6D0: STA.B $09                            ;00A6D0|8509    |000009;
                       JSR.W CODE_00AD48                    ;00A6D2|2048AD  |00AD48;
 
             posXData: db $EE                               ;00A6D5|        |      ;
 
             posYData: db $81,$07,$60                       ;00A6D6|        |      ;
 
          CODE_00A6D9: LDA.B (r_temp_Xpos),Y                ;00A6D9|B10A    |00000A;
                       CMP.B #$FF                           ;00A6DB|C9FF    |      ;
                       BNE CODE_00A6D0                      ;00A6DD|D0F1    |00A6D0;
 
                       LDA.W r_soundModeSongSelected        ;00A6DF|AD8007  |000780;
                       ASL A                                ;00A6E2|0A      |      ;
                       ASL A                                ;00A6E3|0A      |      ;
                       CLC                                  ;00A6E4|18      |      ;
                       ADC.W r_soundModeSongSelected        ;00A6E5|6D8007  |000780;
                       TAY                                  ;00A6E8|A8      |      ;
                       LDA.W moreProgrData_783,Y            ;00A6E9|B915A7  |00A715;
                       STA.W $0783                          ;00A6EC|8D8307  |000783;
                       LDA.W moreProgrData_784,Y            ;00A6EF|B916A7  |00A716;
                       STA.W r_EffectSpeedGeneral           ;00A6F2|8D8407  |000784;
                       LDA.W moreProgrData_785,Y            ;00A6F5|B917A7  |00A717;
                       STA.W r_EffectSpeedSupGeneral        ;00A6F8|8D8507  |000785;
                       LDA.W moreProgrData_786,Y            ;00A6FB|B918A7  |00A718;
                       STA.W r_PW_iconGeneral               ;00A6FE|8D8607  |000786;
                       LDA.W moreProgrData_787,Y            ;00A701|B919A7  |00A719;
                       STA.W $0787                          ;00A704|8D8707  |000787;
                       LDA.B #$00                           ;00A707|A900    |      ;
                       STA.W r_PW_dumpGeneral               ;00A709|8D8807  |000788;
                       STA.W $0789                          ;00A70C|8D8907  |000789;
                       STA.W $0789                          ;00A70F|8D8907  |000789;
                       INC.B r_gameSubstate                 ;00A712|E619    |000019;
                       RTS                                  ;00A714|60      |      ;
 
 
    moreProgrData_783: db $00                               ;00A715|        |      ;
 
    moreProgrData_784: db $01                               ;00A716|        |      ;
 
    moreProgrData_785: db $00                               ;00A717|        |      ;
 
    moreProgrData_786: db $01                               ;00A718|        |      ;
 
    moreProgrData_787: db $28,$00,$01,$80,$01,$30,$80,$FF   ;00A719|        |      ;
                       db $20,$01,$40                       ;00A721|        |      ;
 
 gameState8_substate5: LDA.B #$00                           ;00A724|A900    |      ;
                       LDY.W r_EffectSpeedGeneral           ;00A726|AC8407  |000784;
                       BPL CODE_00A72D                      ;00A729|1002    |00A72D;
                       LDA.B #$FF                           ;00A72B|A9FF    |      ;
 
          CODE_00A72D: STA.B $01                            ;00A72D|8501    |000001;
                       LDA.W r_PW_dumpGeneral               ;00A72F|AD8807  |000788;
                       SEC                                  ;00A732|38      |      ;
                       SBC.W $0783                          ;00A733|ED8307  |000783;
                       STA.W r_PW_dumpGeneral               ;00A736|8D8807  |000788;
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
                       ADC.W r_PW_iconGeneral               ;00A760|6D8607  |000786;
                       STA.B r_ScrollY                      ;00A763|85FC    |0000FC;
                       DEC.W $0787                          ;00A765|CE8707  |000787;
                       BNE CODE_00A7A9                      ;00A768|D03F    |00A7A9;
 
                       JSR.W progre_pathSpriteMap_01        ;00A76A|2071A8  |00A871;
                       JSR.W DATA8_00A8AD                   ;00A76D|20ADA8  |00A8AD;
                       LDY.W r_soundModeSongSelected        ;00A770|AC8007  |000780;
                       LDA.W AndMoreProgData_00,Y           ;00A773|B9AAA7  |00A7AA;
                       db $20                               ;00A776|        |      ;
                       dw screenLoadRoutine                 ;00A777|        |0FECE9;
                       LDA.B #$04                           ;00A779|A904    |      ;
                       db $20                               ;00A77B|        |      ;
                       dw screenLoadRoutine                 ;00A77C|        |0FECE9;
                       LDX.B #$59                           ;00A77E|A259    |      ;
                       LDA.B #$19                           ;00A780|A919    |      ;
                       db $20                               ;00A782|        |      ;
                       dw CODE_0FE5C1                       ;00A783|        |0FE5C1;
                       LDA.W r_soundModeSongSelected        ;00A785|AD8007  |000780;
                       ASL A                                ;00A788|0A      |      ;
                       TAY                                  ;00A789|A8      |      ;
                       LDA.W AndMoreProgData_78d,Y          ;00A78A|B9ADA7  |00A7AD;
                       STA.W $078D                          ;00A78D|8D8D07  |00078D;
                       LDA.W AndMoreProgData_78c,Y          ;00A790|B9AEA7  |00A7AE;
                       STA.W $078C                          ;00A793|8D8C07  |00078C;
                       LDA.B #$00                           ;00A796|A900    |      ;
                       STA.W r_epilogTimer                  ;00A798|8D8A07  |00078A;
                       LDA.B r_PPUCtrl                      ;00A79B|A5FF    |0000FF;
                       ORA.B #$01                           ;00A79D|0901    |      ;
                       STA.W $078B                          ;00A79F|8D8B07  |00078B;
 
                       LDA.B #$00                           ;00A7A2|A900    |      ;
                       STA.W r_animTimerBG_CHR              ;00A7A4|8D8107  |000781;
                       INC.B r_gameSubstate                 ;00A7A7|E619    |000019;
 
          CODE_00A7A9: RTS                                  ;00A7A9|60      |      ;
 
 
   AndMoreProgData_00: db $14,$15,$16                       ;00A7AA|        |      ;
 
  AndMoreProgData_78d: dw $2022,$E022,$A022                 ;00A7AD|        |      ;
 
          CODE_00A7B3: LDA.B r_gameStateLoopCounter         ;00A7B3|A51A    |00001A;
                       AND.B #$10                           ;00A7B5|2910    |      ;
                       BEQ CODE_00A7D1                      ;00A7B7|F018    |00A7D1;
 
          CODE_00A7B9: LDA.B #$00                           ;00A7B9|A900    |      ;
 
          CODE_00A7BB: STA.B $07                            ;00A7BB|8507    |000007;
                       LDY.B #$00                           ;00A7BD|A000    |      ;
 
          CODE_00A7BF: LDA.W $0791,Y                        ;00A7BF|B99107  |000791;
                       CLC                                  ;00A7C2|18      |      ;
                       ADC.B #$01                           ;00A7C3|6901    |      ;
                       TAX                                  ;00A7C5|AA      |      ;
                       LDA.B $07                            ;00A7C6|A507    |000007;
                       STA.W r_entity_Effect,X              ;00A7C8|9D7004  |000470;
                       INY                                  ;00A7CB|C8      |      ;
                       CPY.B #$04                           ;00A7CC|C004    |      ;
                       BNE CODE_00A7BF                      ;00A7CE|D0EF    |00A7BF;
                       RTS                                  ;00A7D0|60      |      ;
 
 
          CODE_00A7D1: LDA.B #$80                           ;00A7D1|A980    |      ;
                       BNE CODE_00A7BB                      ;00A7D3|D0E6    |00A7BB;
 
          CODE_00A7D5: LDA.W r_soundModeSongSelected        ;00A7D5|AD8007  |000780;
                       ASL A                                ;00A7D8|0A      |      ;
                       ASL A                                ;00A7D9|0A      |      ;
                       STA.B $07                            ;00A7DA|8507    |000007;
                       TAY                                  ;00A7DC|A8      |      ;
                       LDA.W progre_pathSpriteMap_00,Y      ;00A7DD|B926A8  |00A826;
                       STA.B r_pointerQueue                 ;00A7E0|8508    |000008;
                       LDA.W PTR16_00A827,Y                 ;00A7E2|B927A8  |00A827;
                       STA.B $09                            ;00A7E5|8509    |000009;
                       LDX.B #$01                           ;00A7E7|A201    |      ;
                       LDY.B #$00                           ;00A7E9|A000    |      ;
 
          CODE_00A7EB: LDA.B (r_pointerQueue),Y             ;00A7EB|B108    |000008;
                       CMP.B #$FF                           ;00A7ED|C9FF    |      ;
                       BEQ CODE_00A7F8                      ;00A7EF|F007    |00A7F8;
                       STA.W r_entity_Effect,X              ;00A7F1|9D7004  |000470;
                       INX                                  ;00A7F4|E8      |      ;
                       INY                                  ;00A7F5|C8      |      ;
                       BNE CODE_00A7EB                      ;00A7F6|D0F3    |00A7EB;
 
          CODE_00A7F8: LDY.B $07                            ;00A7F8|A407    |000007;
                       LDA.W PTR16_00A828,Y                 ;00A7FA|B928A8  |00A828;
                       STA.B r_pointerQueue                 ;00A7FD|8508    |000008;
                       LDA.W PTR16_00A829,Y                 ;00A7FF|B929A8  |00A829;
                       STA.B $09                            ;00A802|8509    |000009;
                       LDY.B #$00                           ;00A804|A000    |      ;
                       LDA.W r_entity_YPos                  ;00A806|AD1C04  |00041C;
                       CMP.B (r_pointerQueue),Y             ;00A809|D108    |000008;
                       BCC CODE_00A80F                      ;00A80B|9002    |00A80F;
                       INY                                  ;00A80D|C8      |      ;
                       INY                                  ;00A80E|C8      |      ;
 
          CODE_00A80F: INY                                  ;00A80F|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00A810|B108    |000008;
                       STA.B r_temp_Xpos                    ;00A812|850A    |00000A;
                       INY                                  ;00A814|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00A815|B108    |000008;
                       STA.B $0B                            ;00A817|850B    |00000B;
                       LDY.B #$00                           ;00A819|A000    |      ;
 
          CODE_00A81B: LDA.B (r_temp_Xpos),Y                ;00A81B|B10A    |00000A;
                       STA.W $0791,Y                        ;00A81D|999107  |000791;
                       INY                                  ;00A820|C8      |      ;
                       CPY.B #$04                           ;00A821|C004    |      ;
                       BNE CODE_00A81B                      ;00A823|D0F6    |00A81B;
 
                       RTS                                  ;00A825|60      |      ;
 
 
progre_pathSpriteMap_00: dw showSelectionSpriteFlag           ;00A826|        |00A832;
 
         PTR16_00A828: dw spriteMapPointer00                ;00A828|        |00A84A;
                       dw DATA8_00A83A                      ;00A82A|        |00A83A;
                       dw DATA8_00A84F                      ;00A82C|        |00A84F;
                       dw DATA8_00A842                      ;00A82E|        |00A842;
 
                       dw DATA8_00A854                      ;00A830|        |00A854;
 
showSelectionSpriteFlag: db $00,$80,$80,$80,$80,$80,$80,$FF   ;00A832|        |      ;
 
         DATA8_00A83A: db $00,$80,$80,$80,$80,$80,$80,$FF   ;00A83A|        |      ;
 
         DATA8_00A842: db $00,$80,$80,$80,$80,$80,$80,$FF   ;00A842|        |      ;
 
   spriteMapPointer00: db $A0                               ;00A84A|        |      ;
                       dw DATA8_00A861                      ;00A84B|        |00A861;
                       dw DATA8_00A865                      ;00A84D|        |00A865;
 
         DATA8_00A84F: db $A0                               ;00A84F|        |      ;
                       dw DATA8_00A859                      ;00A850|        |00A859;
                       dw DATA8_00A85D                      ;00A852|        |00A85D;
 
         DATA8_00A854: db $A0                               ;00A854|        |      ;
                       dw DATA8_00A869                      ;00A855|        |00A869;
                       dw DATA8_00A86D                      ;00A857|        |00A86D;
 
         DATA8_00A859: db $01,$02,$03,$08                   ;00A859|        |      ;
 
         DATA8_00A85D: db $04,$05,$06,$08                   ;00A85D|        |      ;
 
         DATA8_00A861: db $01,$02,$03,$08                   ;00A861|        |      ;
 
         DATA8_00A865: db $04,$05,$06,$08                   ;00A865|        |      ;
 
         DATA8_00A869: db $01,$02,$03,$08                   ;00A869|        |      ;
 
         DATA8_00A86D: db $04,$05,$06,$08                   ;00A86D|        |      ;
 
progre_pathSpriteMap_01: LDA.W r_soundModeSongSelected        ;00A871|AD8007  |000780;
                       ASL A                                ;00A874|0A      |      ;
                       TAY                                  ;00A875|A8      |      ;
                       LDA.W DATA8_00ADD7,Y                 ;00A876|B9D7AD  |00ADD7;
                       STA.B r_pointerQueue                 ;00A879|8508    |000008;
                       LDA.W DATA8_00ADD8,Y                 ;00A87B|B9D8AD  |00ADD8;
                       STA.B $09                            ;00A87E|8509    |000009;
                       LDX.B #$01                           ;00A880|A201    |      ;
                       LDY.B #$00                           ;00A882|A000    |      ;
 
          CODE_00A884: LDA.B (r_pointerQueue),Y             ;00A884|B108    |000008;
                       CMP.B #$FF                           ;00A886|C9FF    |      ;
                       BEQ CODE_00A8AC                      ;00A888|F022    |00A8AC;
                       STA.W r_OamSpecIdxDoubled,X          ;00A88A|9D0004  |000400;
                       LDA.B #$0C                           ;00A88D|A90C    |      ;
                       STA.W r_entity_OamSpecGroupDoubled,X ;00A88F|9D8C04  |00048C;
                       LDA.B #$01                           ;00A892|A901    |      ;
                       STA.W r_entity_FacingLeft,X          ;00A894|9DA804  |0004A8;
                       LDA.B #$80                           ;00A897|A980    |      ;
                       STA.W r_entity_Effect,X              ;00A899|9D7004  |000470;
                       INY                                  ;00A89C|C8      |      ;
 
                       LDA.B (r_pointerQueue),Y             ;00A89D|B108    |000008;
                       STA.W r_entity_XPos,X                ;00A89F|9D3804  |000438;
                       INY                                  ;00A8A2|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00A8A3|B108    |000008;
                       STA.W r_entity_YPos,X                ;00A8A5|9D1C04  |00041C;
                       INY                                  ;00A8A8|C8      |      ;
                       INX                                  ;00A8A9|E8      |      ;
                       BNE CODE_00A884                      ;00A8AA|D0D8    |00A884;
 
          CODE_00A8AC: RTS                                  ;00A8AC|60      |      ;
 
 
         DATA8_00A8AD: db $20                               ;00A8AD|        |      ;
                       dw CODE_0FE716                       ;00A8AE|        |0FE716;
                       LDY.B #$00                           ;00A8B0|A000    |      ;
                       LDA.B #$08                           ;00A8B2|A908    |      ;
                       STA.B r_tempCurrGroup                ;00A8B4|850C    |00000C;
 
          CODE_00A8B6: LDA.W DATA8_00A8C3,Y                 ;00A8B6|B9C3A8  |00A8C3;
                       STA.W $02EF,X                        ;00A8B9|9DEF02  |0002EF;
                       INY                                  ;00A8BC|C8      |      ;
                       INX                                  ;00A8BD|E8      |      ;
                       DEC.B r_tempCurrGroup                ;00A8BE|C60C    |00000C;
                       BNE CODE_00A8B6                      ;00A8C0|D0F4    |00A8B6;
                       RTS                                  ;00A8C2|60      |      ;
 
 
         DATA8_00A8C3: db $0F,$0F,$21,$20,$0F,$0F,$07,$20   ;00A8C3|        |      ;
 
 gameState8_substate6: JSR.W CODE_00A7B3                    ;00A8CB|20B3A7  |00A7B3;
                       LDA.W r_soundModeSongSelected        ;00A8CE|AD8007  |000780;
                       ASL A                                ;00A8D1|0A      |      ;
                       TAY                                  ;00A8D2|A8      |      ;
                       LDA.W PTR16_00AE2B,Y                 ;00A8D3|B92BAE  |00AE2B;
                       STA.B r_temp_Xpos                    ;00A8D6|850A    |00000A;
                       LDA.W PTR16_00AE2C,Y                 ;00A8D8|B92CAE  |00AE2C;
                       STA.B $0B                            ;00A8DB|850B    |00000B;
                       LDA.W r_animTimerBG_CHR              ;00A8DD|AD8107  |000781;
                       ASL A                                ;00A8E0|0A      |      ;
                       TAY                                  ;00A8E1|A8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;00A8E2|B10A    |00000A;
                       STA.B r_pointerQueue                 ;00A8E4|8508    |000008;
                       INY                                  ;00A8E6|C8      |      ;
                       CMP.B #$FF                           ;00A8E7|C9FF    |      ;
                       BEQ CODE_00A8F6                      ;00A8E9|F00B    |00A8F6;
                       LDA.B (r_temp_Xpos),Y                ;00A8EB|B10A    |00000A;
 
          CODE_00A8ED: STA.B $09                            ;00A8ED|8509    |000009;
                       JSR.W CODE_00AD48                    ;00A8EF|2048AD  |00AD48;
                       INC.W r_animTimerBG_CHR              ;00A8F2|EE8107  |000781;
                       RTS                                  ;00A8F5|60      |      ;
 
 
          CODE_00A8F6: LDA.B (r_temp_Xpos),Y                ;00A8F6|B10A    |00000A;
                       CMP.B #$FF                           ;00A8F8|C9FF    |      ;
                       BNE CODE_00A8ED                      ;00A8FA|D0F1    |00A8ED;
                       LDY.W r_soundModeSongSelected        ;00A8FC|AC8007  |000780;
                       LDA.W DATA8_00A90D,Y                 ;00A8FF|B90DA9  |00A90D;
                       STA.W r_EffectSpeedGeneral           ;00A902|8D8407  |000784;
 
                       LDA.B #$01                           ;00A905|A901    |      ;
 
                       STA.W r_FogParallelPos               ;00A907|8D8207  |000782;
                       INC.B r_gameSubstate                 ;00A90A|E619    |000019;
                       RTS                                  ;00A90C|60      |      ;
 
 
         DATA8_00A90D: db $02,$02,$FE                       ;00A90D|        |      ;
 
 gameState8_substate7: JSR.W CODE_00A7D5                    ;00A910|20D5A7  |00A7D5;
                       LDA.B #$00                           ;00A913|A900    |      ;
                       LDY.W r_EffectSpeedGeneral           ;00A915|AC8407  |000784;
                       BPL CODE_00A91C                      ;00A918|1002    |00A91C;
                       LDA.B #$FF                           ;00A91A|A9FF    |      ;
 
          CODE_00A91C: STA.B $01                            ;00A91C|8501    |000001;
                       SEC                                  ;00A91E|38      |      ;
                       LDA.W r_epilogTimer                  ;00A91F|AD8A07  |00078A;
                       SBC.W r_EffectSpeedGeneral           ;00A922|ED8407  |000784;
                       STA.W r_epilogTimer                  ;00A925|8D8A07  |00078A;
                       LDA.W r_FogParallelPos               ;00A928|AD8207  |000782;
                       SBC.B $01                            ;00A92B|E501    |000001;
                       STA.W r_FogParallelPos               ;00A92D|8D8207  |000782;
                       AND.B #$01                           ;00A930|2901    |      ;
                       STA.B $00                            ;00A932|8500    |000000;
                       LDA.W $078B                          ;00A934|AD8B07  |00078B;
                       AND.B #$FE                           ;00A937|29FE    |      ;
                       ORA.B $00                            ;00A939|0500    |000000;
                       STA.W $078B                          ;00A93B|8D8B07  |00078B;
                       LDA.W r_epilogTimer                  ;00A93E|AD8A07  |00078A;
                       BNE CODE_00A94A                      ;00A941|D007    |00A94A;
                       LDA.B #$00                           ;00A943|A900    |      ;
                       STA.W r_Player_StateDoubled          ;00A945|8D6505  |000565;
 
                       INC.B r_gameSubstate                 ;00A948|E619    |000019;
 
          CODE_00A94A: RTS                                  ;00A94A|60      |      ;
 
 
 gameState8_substate8: JSR.W CODE_00A7D5                    ;00A94B|20D5A7  |00A7D5;
                       LDA.W r_Player_StateDoubled          ;00A94E|AD6505  |000565;
                       CMP.B #$10                           ;00A951|C910    |      ;
                       BEQ CODE_00A95F                      ;00A953|F00A    |00A95F;
                       CMP.B #$12                           ;00A955|C912    |      ;
                       BEQ CODE_00A95F                      ;00A957|F006    |00A95F;
                       JSR.W CODE_00A7B3                    ;00A959|20B3A7  |00A7B3;
                       JMP.W choosePathProgression          ;00A95C|4C62A9  |00A962;
 
 
          CODE_00A95F: JSR.W CODE_00A7B9                    ;00A95F|20B9A7  |00A7B9;
 
choosePathProgression: JSR.W CODE_00AA05                    ;00A962|2005AA  |00AA05;
                       LDA.W r_Player_StateDoubled          ;00A965|AD6505  |000565;
                       CMP.B #$12                           ;00A968|C912    |      ;
                       BNE CODE_00A9A4                      ;00A96A|D038    |00A9A4;
                       LDA.W r_soundModeSongSelected        ;00A96C|AD8007  |000780;
                       ASL A                                ;00A96F|0A      |      ;
                       TAY                                  ;00A970|A8      |      ;
                       LDA.W progressionPointerTable,Y      ;00A971|B9A5A9  |00A9A5;
                       STA.B r_pointerQueue                 ;00A974|8508    |000008;
                       LDA.W progressionPointerTableHi,Y    ;00A976|B9A6A9  |00A9A6;
                       STA.B $09                            ;00A979|8509    |000009;
                       LDA.W $0790                          ;00A97B|AD9007  |000790;
                       ASL A                                ;00A97E|0A      |      ;
                       CLC                                  ;00A97F|18      |      ;
                       ADC.W $0790                          ;00A980|6D9007  |000790;
                       TAY                                  ;00A983|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00A984|B108    |000008;
                       STA.B r_stage                        ;00A986|8532    |000032;
 
                       INY                                  ;00A988|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00A989|B108    |000008;
                       STA.B r_blockLevel                   ;00A98B|8533    |000033;
                       INY                                  ;00A98D|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00A98E|B108    |000008;
                       STA.B r_roomIdx                      ;00A990|8534    |000034;
                       LDA.B #$07                           ;00A992|A907    |      ;
                       STA.W $0160                          ;00A994|8D6001  |000160;
                       LDA.B #$B4                           ;00A997|A9B4    |      ;
                       STA.B r_timerGenerel                 ;00A999|8530    |000030;
                       LDY.B #$00                           ;00A99B|A000    |      ;
                       STY.B $B4                            ;00A99D|84B4    |0000B4;
                       INY                                  ;00A99F|C8      |      ;
                       STY.B $B5                            ;00A9A0|84B5    |0000B5;
                       INC.B r_gameSubstate                 ;00A9A2|E619    |000019;
 
          CODE_00A9A4: RTS                                  ;00A9A4|60      |      ;
 
 
progressionPointerTable: dw goClockTower                      ;00A9A5|        |00A9AB;
                       dw goSymphaOrAlucard                 ;00A9A7|        |00A9B4;
                       dw goCryptOrWater                    ;00A9A9|        |00A9BA;
 
         goClockTower: db $01,$00,$00,$00,$00,$00           ;00A9AB|        |      ;
 
              goWoods: db $02,$00,$00                       ;00A9B1|        |      ;
 
    goSymphaOrAlucard: db $02,$03,$02,$06,$00,$01           ;00A9B4|        |      ;
 
       goCryptOrWater: db $07,$06,$00,$08,$00,$00           ;00A9BA|        |      ;
 
 gameState8_substate9: DEC.B r_timerGenerel                 ;00A9C0|C630    |000030;
                       BEQ CODE_00A9CC                      ;00A9C2|F008    |00A9CC;
                       LDA.B r_timerGenerel                 ;00A9C4|A530    |000030;
                       CMP.B #$30                           ;00A9C6|C930    |      ;
                       BCS CODE_00A9CE                      ;00A9C8|B004    |00A9CE;
                       BCC CODE_00A9CF                      ;00A9CA|9003    |00A9CF;
 
          CODE_00A9CC: INC.B r_gameSubstate                 ;00A9CC|E619    |000019;
 
          CODE_00A9CE: RTS                                  ;00A9CE|60      |      ;
 
 
          CODE_00A9CF: LDA.B $B4                            ;00A9CF|A5B4    |0000B4;
                       CMP.B #$FF                           ;00A9D1|C9FF    |      ;
                       BEQ CODE_00A9CE                      ;00A9D3|F0F9    |00A9CE;
                       LDA.B r_sceneDrawQueue               ;00A9D5|A51D    |00001D;
                       PHA                                  ;00A9D7|48      |      ;
 
                       LDY.W r_soundModeSongSelected        ;00A9D8|AC8007  |000780;
                       LDA.W AndMoreProgData_00,Y           ;00A9DB|B9AAA7  |00A7AA;
                       db $20                               ;00A9DE|        |      ;
                       dw screenLoadRoutine                 ;00A9DF|        |0FECE9;
                       JSR.W DATA8_00A8AD                   ;00A9E1|20ADA8  |00A8AD;
                       PLA                                  ;00A9E4|68      |      ;
                       STA.B r_15                           ;00A9E5|8515    |000015;
                       db $4C                               ;00A9E7|        |      ;
 
                       dw UNREACH_0FFBAF                    ;00A9E8|        |0FFBAF;
 
gameState8_substate10: db $20                               ;00A9EA|        |      ;
                       dw setNameTableMapping_E4            ;00A9EB|        |0FEBFD;
                       LDA.W r_soundModeSongSelected        ;00A9ED|AD8007  |000780;
                       BNE DATA8_00A9F5                     ;00A9F0|D003    |00A9F5;
                       JSR.W startingStats                  ;00A9F2|20C090  |0090C0;
 
         DATA8_00A9F5: db $20                               ;00A9F5|        |      ;
                       dw stageTransition_69                ;00A9F6|        |0FE78A;
                       db $20                               ;00A9F8|        |      ;
 
                       dw CODE_0FE68F                       ;00A9F9|        |0FE68F;
 
                       LDA.B #$04                           ;00A9FB|A904    |      ;
 
                       STA.B r_gameState                    ;00A9FD|8518    |000018;
 
                       LDA.B #$00                           ;00A9FF|A900    |      ;
 
                       STA.B r_gameTransition               ;00AA01|852A    |00002A;
 
                       RTS                                  ;00AA03|60      |      ;
 
 
gameState8_substateEmpty: RTS                                  ;00AA04|60      |      ;
 
 
          CODE_00AA05: LDA.W r_Player_StateDoubled          ;00AA05|AD6505  |000565;
 
          CODE_00AA08: CMP.B #$00                           ;00AA08|C900    |      ;
                       BEQ CODE_00AA46                      ;00AA0A|F03A    |00AA46;
                       CMP.B #$02                           ;00AA0C|C902    |      ;
                       BEQ CODE_00AA46                      ;00AA0E|F036    |00AA46;
                       CMP.B #$10                           ;00AA10|C910    |      ;
                       BEQ CODE_00AA46                      ;00AA12|F032    |00AA46;
                       LDA.W r_soundModeSongSelected        ;00AA14|AD8007  |000780;
                       ASL A                                ;00AA17|0A      |      ;
                       TAY                                  ;00AA18|A8      |      ;
                       LDA.W r_entity_XPos                  ;00AA19|AD3804  |000438;
                       CMP.W DATA16_00AA61,Y                ;00AA1C|D961AA  |00AA61;
                       BCC CODE_00AA26                      ;00AA1F|9005    |00AA26;
                       CMP.W DATA16_00AA62,Y                ;00AA21|D962AA  |00AA62;
                       BCC CODE_00AA46                      ;00AA24|9020    |00AA46;
 
          CODE_00AA26: LDA.W r_entity_FacingLeft            ;00AA26|ADA804  |0004A8;
                       ASL A                                ;00AA29|0A      |      ;
                       TAY                                  ;00AA2A|A8      |      ;
                       LDA.W DATA16_00AA67,Y                ;00AA2B|B967AA  |00AA67;
                       STA.W r_entity_XposSpeed             ;00AA2E|8DF204  |0004F2;
                       LDA.W DATA16_00AA68,Y                ;00AA31|B968AA  |00AA68;
                       STA.W r_entity_XposSubSpeed          ;00AA34|8D0905  |000509;
                       LDA.B #$10                           ;00AA37|A910    |      ;
                       STA.W r_Player_StateDoubled          ;00AA39|8D6505  |000565;
                       LDA.B #$58                           ;00AA3C|A958    |      ;
                       STA.W $0787                          ;00AA3E|8D8707  |000787;
                       LDA.B #$00                           ;00AA41|A900    |      ;
                       db $20                               ;00AA43|        |      ;
                       dw clearAllEntitySprite              ;00AA44|        |0FEF57;
 
          CODE_00AA46: LDY.W r_Player_StateDoubled          ;00AA46|AC6505  |000565;
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
                       LDY.W r_entity_ObjectIdxes           ;00AA6B|AC4E05  |00054E;
                       LDA.W playPosSpdScreen,Y             ;00AA6E|B9DAAA  |00AADA;
                       STA.W r_entity_OamSpecGroupDoubled   ;00AA71|8D8C04  |00048C;
                       LDA.B #$02                           ;00AA74|A902    |      ;
                       STA.W r_OamSpecIdxDoubled            ;00AA76|8D0004  |000400;
                       LDA.W r_soundModeSongSelected        ;00AA79|AD8007  |000780;
                       ASL A                                ;00AA7C|0A      |      ;
                       STA.B $00                            ;00AA7D|8500    |000000;
                       ASL A                                ;00AA7F|0A      |      ;
                       CLC                                  ;00AA80|18      |      ;
                       ADC.B $00                            ;00AA81|6500    |000000;
                       TAY                                  ;00AA83|A8      |      ;
                       LDA.W DATA8_00AADE,Y                 ;00AA84|B9DEAA  |00AADE;
                       STA.W r_entity_XPos                  ;00AA87|8D3804  |000438;
                       LDA.W DATA8_00AADF,Y                 ;00AA8A|B9DFAA  |00AADF;
                       LDX.W r_entity_ObjectIdxes           ;00AA8D|AE4E05  |00054E;
                       CPX.B #$02                           ;00AA90|E002    |      ;
                       BNE CODE_00AA97                      ;00AA92|D003    |00AA97;
                       CLC                                  ;00AA94|18      |      ;
                       ADC.B #$04                           ;00AA95|6904    |      ;
 
          CODE_00AA97: STA.W r_entity_YPos                  ;00AA97|8D1C04  |00041C;
                       LDA.W progressionPathSelecter,Y      ;00AA9A|B9E0AA  |00AAE0;
                       STA.W r_entity_FacingLeft            ;00AA9D|8DA804  |0004A8;
                       LDA.W DATA8_00AAE1,Y                 ;00AAA0|B9E1AA  |00AAE1;
                       STA.W r_entity_XposSpeed             ;00AAA3|8DF204  |0004F2;
                       LDA.W DATA8_00AAE2,Y                 ;00AAA6|B9E2AA  |00AAE2;
                       STA.W r_entity_XposSubSpeed          ;00AAA9|8D0905  |000509;
                       LDA.W DATA8_00AAE3,Y                 ;00AAAC|B9E3AA  |00AAE3;
                       STA.W $0790                          ;00AAAF|8D9007  |000790;
                       LDA.B #$44                           ;00AAB2|A944    |      ;
                       STA.W $0787                          ;00AAB4|8D8707  |000787;
                       LDA.B #$00                           ;00AAB7|A900    |      ;
                       STA.B r_roomOrientation              ;00AAB9|8568    |000068;
                       STA.B r_sceneScrollOffsetLo          ;00AABB|8556    |000056;
                       STA.B r_sceneScrollOffsetHi          ;00AABD|8557    |000057;
                       LDA.W r_soundModeSongSelected        ;00AABF|AD8007  |000780;
                       ASL A                                ;00AAC2|0A      |      ;
                       TAY                                  ;00AAC3|A8      |      ;
                       LDA.W PTR16_00AD96,Y                 ;00AAC4|B996AD  |00AD96;
                       STA.B r_currRoomStairsDataAddr       ;00AAC7|8569    |000069;
                       LDA.W PTR16_00AD97,Y                 ;00AAC9|B997AD  |00AD97;
                       STA.B $6A                            ;00AACC|856A    |00006A;
                       LDA.B #$00                           ;00AACE|A900    |      ;
                       db $20                               ;00AAD0|        |      ;
                       dw clearAllEntitySprite              ;00AAD1|        |0FEF57;
                       INC.W r_Player_StateDoubled          ;00AAD3|EE6505  |000565;
                       INC.W r_Player_StateDoubled          ;00AAD6|EE6505  |000565;
                       RTS                                  ;00AAD9|60      |      ;
 
 
     playPosSpdScreen: db $00,$02,$04,$06                   ;00AADA|        |      ; ??
 
         DATA8_00AADE: db $08                               ;00AADE|        |      ;
 
         DATA8_00AADF: db $A0                               ;00AADF|        |      ;
 
progressionPathSelecter: db $00                               ;00AAE0|        |      ;
 
         DATA8_00AAE1: db $00                               ;00AAE1|        |      ;
 
         DATA8_00AAE2: db $C0                               ;00AAE2|        |      ;
 
         DATA8_00AAE3: db $01,$08,$80,$00,$00,$C0,$00,$F8   ;00AAE3|        |      ;
                       db $80,$01,$FF,$40,$00               ;00AAEB|        |      ;
                       LDA.B r_gameStateLoopCounter         ;00AAF0|A51A    |00001A;
                       AND.B #$0F                           ;00AAF2|290F    |      ;
                       BNE DATA8_00AAFB                     ;00AAF4|D005    |00AAFB;
                       LDA.B #$09                           ;00AAF6|A909    |      ;
                       db $20                               ;00AAF8|        |      ;
                       dw initFreezWaterEffect_01           ;00AAF9|        |0FE25F;
 
         DATA8_00AAFB: db $20                               ;00AAFB|        |      ;
 
                       dw updateSpriteAnimFrame             ;00AAFC|        |0FEF73;
                       LDA.W r_entity_FractionalX           ;00AAFE|ADC404  |0004C4;
                       CLC                                  ;00AB01|18      |      ;
                       ADC.W r_entity_XposSubSpeed          ;00AB02|6D0905  |000509;
                       STA.W r_entity_FractionalX           ;00AB05|8DC404  |0004C4;
                       LDA.W r_entity_XPos                  ;00AB08|AD3804  |000438;
                       ADC.W r_entity_XposSpeed             ;00AB0B|6DF204  |0004F2;
                       STA.W r_entity_XPos                  ;00AB0E|8D3804  |000438;
                       CMP.B #$FE                           ;00AB11|C9FE    |      ;
                       BCS CODE_00AB1E                      ;00AB13|B009    |00AB1E;
                       CMP.B #$02                           ;00AB15|C902    |      ;
                       BCC CODE_00AB1E                      ;00AB17|9005    |00AB1E;
                       DEC.W $0787                          ;00AB19|CE8707  |000787;
                       BNE CODE_00AB29                      ;00AB1C|D00B    |00AB29;
 
          CODE_00AB1E: LDA.B #$00                           ;00AB1E|A900    |      ;
                       STA.W r_OamSpecIdxDoubled            ;00AB20|8D0004  |000400;
                       INC.W r_Player_StateDoubled          ;00AB23|EE6505  |000565;
                       INC.W r_Player_StateDoubled          ;00AB26|EE6505  |000565;
 
          CODE_00AB29: RTS                                  ;00AB29|60      |      ;
 
                       LDA.B r_Joy1Pe                       ;00AB2A|A528    |000028;
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
                       dw CODE_0FE6D4                       ;00AB3F|        |0FE6D4;
                       BCC CODE_00AB38                      ;00AB41|90F5    |00AB38;
                       LDA.B #$00                           ;00AB43|A900    |      ;
                       STA.W r_entity_script_idx            ;00AB45|8DC105  |0005C1;
                       LDX.B #$01                           ;00AB48|A201    |      ;
                       BNE CODE_00AB58                      ;00AB4A|D00C    |00AB58;
 
         DATA8_00AB4C: db $20                               ;00AB4C|        |      ;
                       dw CODE_0FE6DF                       ;00AB4D|        |0FE6DF;
                       BCC CODE_00AB38                      ;00AB4F|90E7    |00AB38;
                       LDA.B #$01                           ;00AB51|A901    |      ;
                       STA.W r_entity_script_idx            ;00AB53|8DC105  |0005C1;
                       LDX.B #$00                           ;00AB56|A200    |      ;
 
          CODE_00AB58: LDY.B #$00                           ;00AB58|A000    |      ;
                       LDA.B r_temp_Xpos                    ;00AB5A|A50A    |00000A;
                       ASL A                                ;00AB5C|0A      |      ;
                       BCC CODE_00AB64                      ;00AB5D|9005    |00AB64;
                       TXA                                  ;00AB5F|8A      |      ;
                       EOR.B #$01                           ;00AB60|4901    |      ;
                       TAX                                  ;00AB62|AA      |      ;
                       INY                                  ;00AB63|C8      |      ;
 
          CODE_00AB64: STY.W r_entity_AI_idx                ;00AB64|8CEF05  |0005EF;
                       STX.W r_entity_FacingLeft            ;00AB67|8EA804  |0004A8;
                       LDA.B $0B                            ;00AB6A|A50B    |00000B;
                       STA.W r_stairs_PixelToWalk           ;00AB6C|8D1D06  |00061D;
                       LDY.B #$00                           ;00AB6F|A000    |      ;
                       ASL A                                ;00AB71|0A      |      ;
                       BCC CODE_00AB75                      ;00AB72|9001    |00AB75;
                       INY                                  ;00AB74|C8      |      ;
 
          CODE_00AB75: STY.W r_entity_YposTarget            ;00AB75|8C0606  |000606;
                       LDA.B r_tempCurrSection              ;00AB78|A50D    |00000D;
                       BEQ CODE_00AB82                      ;00AB7A|F006    |00AB82;
                       LDA.B #$FF                           ;00AB7C|A9FF    |      ;
                       LDY.B #$00                           ;00AB7E|A000    |      ;
                       BEQ CODE_00AB86                      ;00AB80|F004    |00AB86;
 
          CODE_00AB82: LDA.B #$01                           ;00AB82|A901    |      ;
                       LDY.B #$00                           ;00AB84|A000    |      ;
 
          CODE_00AB86: STY.W r_entity_XposSubSpeed          ;00AB86|8C0905  |000509;
                       STA.W r_entity_XposSpeed             ;00AB89|8DF204  |0004F2;
                       LDA.B #$08                           ;00AB8C|A908    |      ;
                       STA.W r_Player_StateDoubled          ;00AB8E|8D6505  |000565;
                       LDA.B #$00                           ;00AB91|A900    |      ;
 
          CODE_00AB93: STA.W r_entity_AnimGroup             ;00AB93|8DAA05  |0005AA;
                       LDY.B #$02                           ;00AB96|A002    |      ;
                       STY.W r_entity_OamBaseOffset         ;00AB98|8C9305  |000593;
                       DEY                                  ;00AB9B|88      |      ;
                       STY.W r_entity_AnimTimer             ;00AB9C|8C7C05  |00057C;
                       RTS                                  ;00AB9F|60      |      ;
 
 
          CODE_00ABA0: LDA.B #$00                           ;00ABA0|A900    |      ;
                       BEQ CODE_00ABA6                      ;00ABA2|F002    |00ABA6;
 
          CODE_00ABA4: LDA.B #$01                           ;00ABA4|A901    |      ;
 
          CODE_00ABA6: STA.W r_entity_FacingLeft            ;00ABA6|8DA804  |0004A8;
                       LDA.B #$00                           ;00ABA9|A900    |      ;
 
                       STA.W r_entity_XposSpeed             ;00ABAB|8DF204  |0004F2;
                       STA.W r_entity_XposSubSpeed          ;00ABAE|8D0905  |000509;
                       LDA.B #$06                           ;00ABB1|A906    |      ;
                       STA.W r_Player_StateDoubled          ;00ABB3|8D6505  |000565;
                       LDA.B #$00                           ;00ABB6|A900    |      ;
                       JMP.W CODE_00AB93                    ;00ABB8|4C93AB  |00AB93;
 
                       LDA.B r_Joy1Pe                       ;00ABBB|A528    |000028;
                       LSR A                                ;00ABBD|4A      |      ;
                       BCS CODE_00ABDF                      ;00ABBE|B01F    |00ABDF;
                       LSR A                                ;00ABC0|4A      |      ;
                       BCS CODE_00ABFC                      ;00ABC1|B039    |00ABFC;
                       LDA.B #$04                           ;00ABC3|A904    |      ;
                       STA.W r_Player_StateDoubled          ;00ABC5|8D6505  |000565;
 
         DATA8_00ABC8: db $20                               ;00ABC8|        |      ;
                       dw updateSpriteAnimFrame             ;00ABC9|        |0FEF73;
 
          CODE_00ABCB: LDA.W r_entity_FractionalX           ;00ABCB|ADC404  |0004C4;
 
                       CLC                                  ;00ABCE|18      |      ;
                       ADC.W r_entity_XposSubSpeed          ;00ABCF|6D0905  |000509;
                       STA.W r_entity_FractionalX           ;00ABD2|8DC404  |0004C4;
                       LDA.W r_entity_XPos                  ;00ABD5|AD3804  |000438;
                       ADC.W r_entity_XposSpeed             ;00ABD8|6DF204  |0004F2;
                       STA.W r_entity_XPos                  ;00ABDB|8D3804  |000438;
 
                       RTS                                  ;00ABDE|60      |      ;
 
 
          CODE_00ABDF: LDA.B #$00                           ;00ABDF|A900    |      ;
                       STA.W r_entity_FacingLeft            ;00ABE1|8DA804  |0004A8;
                       JSR.W CODE_00AC28                    ;00ABE4|2028AC  |00AC28;
                       LDY.B #$02                           ;00ABE7|A002    |      ;
                       LDA.B (r_temp_Xpos),Y                ;00ABE9|B10A    |00000A;
                       CMP.W r_entity_XPos                  ;00ABEB|CD3804  |000438;
                       BCC CODE_00ABF7                      ;00ABEE|9007    |00ABF7;
                       LDA.B #$01                           ;00ABF0|A901    |      ;
                       LDY.B #$00                           ;00ABF2|A000    |      ;
                       JMP.W CODE_00AC11                    ;00ABF4|4C11AC  |00AC11;
 
 
          CODE_00ABF7: LDA.B #$00                           ;00ABF7|A900    |      ;
                       TAY                                  ;00ABF9|A8      |      ;
                       BEQ CODE_00AC11                      ;00ABFA|F015    |00AC11;
 
          CODE_00ABFC: LDA.B #$01                           ;00ABFC|A901    |      ;
                       STA.W r_entity_FacingLeft            ;00ABFE|8DA804  |0004A8;
                       JSR.W CODE_00AC28                    ;00AC01|2028AC  |00AC28;
 
                       LDY.B #$01                           ;00AC04|A001    |      ;
 
                       LDA.B (r_temp_Xpos),Y                ;00AC06|B10A    |00000A;
                       CMP.W r_entity_XPos                  ;00AC08|CD3804  |000438;
                       BCS CODE_00ABF7                      ;00AC0B|B0EA    |00ABF7;
 
                       LDA.B #$FF                           ;00AC0D|A9FF    |      ;
                       LDY.B #$00                           ;00AC0F|A000    |      ;
 
          CODE_00AC11: STY.W r_entity_XposSubSpeed          ;00AC11|8C0905  |000509;
                       STA.W r_entity_XposSpeed             ;00AC14|8DF204  |0004F2;
                       LDA.B #$00                           ;00AC17|A900    |      ;
                       STA.W r_entity_YposSpeed             ;00AC19|8D2005  |000520;
 
                       STA.W r_entity_YposSubSpeed          ;00AC1C|8D3705  |000537;
                       JMP.W DATA8_00ABC8                   ;00AC1F|4CC8AB  |00ABC8;
 
                       LDA.B #$FF                           ;00AC22|A9FF    |      ;
                       LDY.B #$E0                           ;00AC24|A0E0    |      ;
                       BNE CODE_00AC11                      ;00AC26|D0E9    |00AC11;
 
          CODE_00AC28: LDA.W r_soundModeSongSelected        ;00AC28|AD8007  |000780;
                       ASL A                                ;00AC2B|0A      |      ;
                       TAY                                  ;00AC2C|A8      |      ;
                       LDA.W PTR16_00ADAE,Y                 ;00AC2D|B9AEAD  |00ADAE;
                       STA.B r_pointerQueue                 ;00AC30|8508    |000008;
                       LDA.W PTR16_00ADAF,Y                 ;00AC32|B9AFAD  |00ADAF;
                       STA.B $09                            ;00AC35|8509    |000009;
                       LDA.W $0790                          ;00AC37|AD9007  |000790;
                       ASL A                                ;00AC3A|0A      |      ;
                       TAY                                  ;00AC3B|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00AC3C|B108    |000008;
                       STA.B r_temp_Xpos                    ;00AC3E|850A    |00000A;
                       INY                                  ;00AC40|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00AC41|B108    |000008;
                       STA.B $0B                            ;00AC43|850B    |00000B;
                       RTS                                  ;00AC45|60      |      ;
 
 
          CODE_00AC46: LDA.W r_soundModeSongSelected        ;00AC46|AD8007  |000780;
                       ASL A                                ;00AC49|0A      |      ;
                       TAY                                  ;00AC4A|A8      |      ;
                       LDA.W PTR16_00AD9C,Y                 ;00AC4B|B99CAD  |00AD9C;
                       STA.B r_pointerQueue                 ;00AC4E|8508    |000008;
                       LDA.W PTR16_00AD9D,Y                 ;00AC50|B99DAD  |00AD9D;
                       STA.B $09                            ;00AC53|8509    |000009;
                       LDY.B #$00                           ;00AC55|A000    |      ;
 
          CODE_00AC57: LDA.B (r_pointerQueue),Y             ;00AC57|B108    |000008;
                       CMP.B #$FF                           ;00AC59|C9FF    |      ;
                       BEQ CODE_00AC7F                      ;00AC5B|F022    |00AC7F;
                       STA.B $00                            ;00AC5D|8500    |000000;
                       LDX.W r_entity_ObjectIdxes           ;00AC5F|AE4E05  |00054E;
                       CPX.B #$02                           ;00AC62|E002    |      ;
                       BNE CODE_00AC6B                      ;00AC64|D005    |00AC6B;
                       CLC                                  ;00AC66|18      |      ;
                       ADC.B #$04                           ;00AC67|6904    |      ;
                       STA.B $00                            ;00AC69|8500    |000000;
 
          CODE_00AC6B: LDA.B $00                            ;00AC6B|A500    |000000;
                       SEC                                  ;00AC6D|38      |      ;
                       SBC.W r_entity_YPos                  ;00AC6E|ED1C04  |00041C;
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
                       LDA.B (r_pointerQueue),Y             ;00AC85|B108    |000008;
                       SEC                                  ;00AC87|38      |      ;
                       RTS                                  ;00AC88|60      |      ;
 
                       LDA.W r_stairs_PixelToWalk           ;00AC89|AD1D06  |00061D;
                       BEQ CODE_00AC97                      ;00AC8C|F009    |00AC97;
                       DEC.W r_stairs_PixelToWalk           ;00AC8E|CE1D06  |00061D;
                       db $20                               ;00AC91|        |      ;
                       dw updateSpriteAnimFrame             ;00AC92|        |0FEF73;
                       JMP.W CODE_00ABCB                    ;00AC94|4CCBAB  |00ABCB;
 
 
          CODE_00AC97: LDA.B #$0A                           ;00AC97|A90A    |      ;
                       STA.W r_Player_StateDoubled          ;00AC99|8D6505  |000565;
                       RTS                                  ;00AC9C|60      |      ;
 
                       LDA.W r_entity_script_idx            ;00AC9D|ADC105  |0005C1;
                       BNE CODE_00ACA5                      ;00ACA0|D003    |00ACA5;
                       JMP.W DATA8_00AD3C                   ;00ACA2|4C3CAD  |00AD3C;
 
 
          CODE_00ACA5: JMP.W DATA8_00AD33                   ;00ACA5|4C33AD  |00AD33;
 
                       LDA.B r_Joy1Pe                       ;00ACA8|A528    |000028;
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
                       STA.W r_entity_FacingLeft            ;00ACBC|8DA804  |0004A8;
 
                       LDA.W r_entity_AI_idx                ;00ACBF|ADEF05  |0005EF;
                       BEQ CODE_00ACCB                      ;00ACC2|F007    |00ACCB;
                       LDX.B #$00                           ;00ACC4|A200    |      ;
                       LDY.B #$00                           ;00ACC6|A000    |      ;
                       JMP.W DATA8_00AD42                   ;00ACC8|4C42AD  |00AD42;
 
 
          CODE_00ACCB: LDX.B #$02                           ;00ACCB|A202    |      ;
                       LDY.B #$08                           ;00ACCD|A008    |      ;
                       JMP.W DATA8_00AD42                   ;00ACCF|4C42AD  |00AD42;
 
 
          CODE_00ACD2: LDA.B #$01                           ;00ACD2|A901    |      ;
                       STA.W r_entity_FacingLeft            ;00ACD4|8DA804  |0004A8;
                       LDA.W r_entity_AI_idx                ;00ACD7|ADEF05  |0005EF;
                       BEQ CODE_00ACE3                      ;00ACDA|F007    |00ACE3;
                       LDX.B #$02                           ;00ACDC|A202    |      ;
                       LDY.B #$0C                           ;00ACDE|A00C    |      ;
                       JMP.W DATA8_00AD42                   ;00ACE0|4C42AD  |00AD42;
 
 
          CODE_00ACE3: LDX.B #$00                           ;00ACE3|A200    |      ;
                       LDY.B #$04                           ;00ACE5|A004    |      ;
                       JMP.W DATA8_00AD42                   ;00ACE7|4C42AD  |00AD42;
 
 
          CODE_00ACEA: JSR.W CODE_00ABCB                    ;00ACEA|20CBAB  |00ABCB;
                       LDA.W r_entity_FractionalY           ;00ACED|ADDB04  |0004DB;
                       CLC                                  ;00ACF0|18      |      ;
                       ADC.W r_entity_YposSubSpeed          ;00ACF1|6D3705  |000537;
                       STA.W r_entity_FractionalY           ;00ACF4|8DDB04  |0004DB;
                       LDA.W r_entity_YPos                  ;00ACF7|AD1C04  |00041C;
                       ADC.W r_entity_YposSpeed             ;00ACFA|6D2005  |000520;
                       STA.W r_entity_YPos                  ;00ACFD|8D1C04  |00041C;
                       LDA.W r_stairs_PixelToWalk           ;00AD00|AD1D06  |00061D;
                       BEQ CODE_00AD14                      ;00AD03|F00F    |00AD14;
                       DEC.W r_stairs_PixelToWalk           ;00AD05|CE1D06  |00061D;
                       LDA.W r_entity_AnimTimer             ;00AD08|AD7C05  |00057C;
                       BEQ DATA8_00AD11                     ;00AD0B|F004    |00AD11;
                       DEC.W r_entity_AnimTimer             ;00AD0D|CE7C05  |00057C;
                       RTS                                  ;00AD10|60      |      ;
 
 
         DATA8_00AD11: db $4C                               ;00AD11|        |      ;
 
                       dw CODE_0FE6EA                       ;00AD12|        |0FE6EA;
 
          CODE_00AD14: LDA.B #$00                           ;00AD14|A900    |      ;
                       STA.W r_entity_FractionalX           ;00AD16|8DC404  |0004C4;
                       STA.W r_entity_FractionalY           ;00AD19|8DDB04  |0004DB;
                       JSR.W CODE_00AC46                    ;00AD1C|2046AC  |00AC46;
                       BCC CODE_00AD2D                      ;00AD1F|900C    |00AD2D;
                       STA.W $0790                          ;00AD21|8D9007  |000790;
                       STX.W r_entity_YPos                  ;00AD24|8E1C04  |00041C;
                       LDA.B #$04                           ;00AD27|A904    |      ;
                       STA.W r_Player_StateDoubled          ;00AD29|8D6505  |000565;
                       RTS                                  ;00AD2C|60      |      ;
 
 
          CODE_00AD2D: LDA.B #$0C                           ;00AD2D|A90C    |      ;
                       STA.W r_Player_StateDoubled          ;00AD2F|8D6505  |000565;
                       RTS                                  ;00AD32|60      |      ;
 
 
         DATA8_00AD33: db $20                               ;00AD33|        |      ;
                       dw CODE_0FE6F5                       ;00AD34|        |0FE6F5;
 
          CODE_00AD36: LDA.B #$0E                           ;00AD36|A90E    |      ;
                       STA.W r_Player_StateDoubled          ;00AD38|8D6505  |000565;
                       RTS                                  ;00AD3B|60      |      ;
 
 
         DATA8_00AD3C: db $20                               ;00AD3C|        |      ;
                       dw CODE_0FE700                       ;00AD3D|        |0FE700;
                       JMP.W CODE_00AD36                    ;00AD3F|4C36AD  |00AD36;
 
 
         DATA8_00AD42: db $20                               ;00AD42|        |      ;
                       dw CODE_0FE70B                       ;00AD43|        |0FE70B;
                       db $4C                               ;00AD45|        |      ;
 
                       dw CODE_00AD36                       ;00AD46|        |00AD36;
 
          CODE_00AD48: LDY.B #$00                           ;00AD48|A000    |      ;
 
          CODE_00AD4A: LDA.B (r_pointerQueue),Y             ;00AD4A|B108    |000008;
                       STA.B $62                            ;00AD4C|8562    |000062;
                       INY                                  ;00AD4E|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00AD4F|B108    |000008;
                       STA.B r_VRAM_QueueDest               ;00AD51|8561    |000061;
                       INY                                  ;00AD53|C8      |      ;
                       db $20                               ;00AD54|        |      ;
                       dw CODE_0FE8B5                       ;00AD55|        |0FE8B5;
 
          CODE_00AD57: LDA.B (r_pointerQueue),Y             ;00AD57|B108    |000008;
                       BEQ CODE_00AD76                      ;00AD59|F01B    |00AD76;
                       CMP.B #$FF                           ;00AD5B|C9FF    |      ;
                       BEQ CODE_00AD91                      ;00AD5D|F032    |00AD91;
                       CMP.B #$FE                           ;00AD5F|C9FE    |      ;
                       BEQ CODE_00AD89                      ;00AD61|F026    |00AD89;
                       INY                                  ;00AD63|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00AD64|B108    |000008;
                       STA.B r_temp_Xpos                    ;00AD66|850A    |00000A;
                       INY                                  ;00AD68|C8      |      ;
 
          CODE_00AD69: LDA.B (r_pointerQueue),Y             ;00AD69|B108    |000008;
                       STA.W r_VramQueue,X                  ;00AD6B|9D0003  |000300;
                       INY                                  ;00AD6E|C8      |      ;
                       INX                                  ;00AD6F|E8      |      ;
                       DEC.B r_temp_Xpos                    ;00AD70|C60A    |00000A;
                       BNE CODE_00AD69                      ;00AD72|D0F5    |00AD69;
                       BEQ CODE_00AD57                      ;00AD74|F0E1    |00AD57;
 
          CODE_00AD76: INY                                  ;00AD76|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00AD77|B108    |000008;
                       STA.B r_temp_Xpos                    ;00AD79|850A    |00000A;
                       INY                                  ;00AD7B|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00AD7C|B108    |000008;
                       INY                                  ;00AD7E|C8      |      ;
 
          CODE_00AD7F: STA.W r_VramQueue,X                  ;00AD7F|9D0003  |000300;
                       INX                                  ;00AD82|E8      |      ;
                       DEC.B r_temp_Xpos                    ;00AD83|C60A    |00000A;
                       BNE CODE_00AD7F                      ;00AD85|D0F8    |00AD7F;
                       BEQ CODE_00AD57                      ;00AD87|F0CE    |00AD57;
 
          CODE_00AD89: STX.B r_sceneDrawQueue               ;00AD89|861D    |00001D;
                       db $20                               ;00AD8B|        |      ;
                       dw CODE_0FED12                       ;00AD8C|        |0FED12;
                       INY                                  ;00AD8E|C8      |      ;
                       BNE CODE_00AD4A                      ;00AD8F|D0B9    |00AD4A;
 
          CODE_00AD91: STX.B r_sceneDrawQueue               ;00AD91|861D    |00001D;
                       db $4C                               ;00AD93|        |      ;
 
                       dw CODE_0FED12                       ;00AD94|        |0FED12;
 
         PTR16_00AD96: dw DATA8_00B864                      ;00AD96|        |00B864;
                       dw CODE_00B871                       ;00AD98|        |00B871;
                       dw LOOSE_OP_00B878                   ;00AD9A|        |00B878;
 
         PTR16_00AD9C: dw DATA8_00ADA2                      ;00AD9C|        |00ADA2;
                       dw DATA8_00ADA9                      ;00AD9E|        |00ADA9;
                       dw DATA8_00ADA9                      ;00ADA0|        |00ADA9;
 
         DATA8_00ADA2: db $80,$00,$A0,$01,$C0,$02,$FF       ;00ADA2|        |      ;
 
 
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
 
         DATA8_00ADD8: db $AD,$F3,$AD,$09,$AE,$A0,$59,$21   ;00ADD8|        |      ;
                       db $A2,$80,$29,$D6,$70,$28,$D8,$72   ;00ADE0|        |      ;
                       db $0D,$A4,$6A,$30,$A6,$61,$4D,$D6   ;00ADE8|        |      ;
                       db $6E,$24,$FF,$A6,$65,$2D,$A8,$7F   ;00ADF0|        |      ;
                       db $3F,$D6,$71,$2D,$D8,$89,$3B,$B2   ;00ADF8|        |      ;
 
                       db $6E,$48,$D6,$71,$2D,$D8,$78,$4D   ;00AE00|        |      ;
                       db $FF,$B4,$64,$4C,$B6,$8A,$3D,$D6   ;00AE08|        |      ;
                       db $7B,$30,$D8,$8B,$22,$B8,$9D,$4C   ;00AE10|        |      ;
                       db $D6,$80,$32,$D8,$A9,$37,$FF       ;00AE18|        |      ;
 
      progression_780: dw DATA8_00AEA3                      ;00AE1F|        |00AEA3;
                       dw DATA8_00AEAF                      ;00AE21|        |00AEAF;
                       dw DATA8_00AEBB                      ;00AE23|        |00AEBB;
 
         PTR16_00AE25: dw onceAgainPointers                 ;00AE25|        |00AE31;
                       dw PTR16_00AE43                      ;00AE27|        |00AE43;
                       dw PTR16_00AE55                      ;00AE29|        |00AE55;
 
         PTR16_00AE2B: dw PTR16_00AE67                      ;00AE2B|        |00AE67;
 
                       dw PTR16_00AE7B                      ;00AE2D|        |00AE7B;
                       dw PTR16_00AE8F                      ;00AE2F|        |00AE8F;
 
    onceAgainPointers: dw DATA8_00AEC7                      ;00AE31|        |00AEC7;
                       dw DATA8_00AED3                      ;00AE33|        |00AED3;
                       dw DATA8_00AEEB                      ;00AE35|        |00AEEB;
                       dw DATA8_00AF03                      ;00AE37|        |00AF03;
                       dw DATA8_00AF1B                      ;00AE39|        |00AF1B;
                       dw DATA8_00AF4B                      ;00AE3B|        |00AF4B;
                       dw DATA8_00AF7B                      ;00AE3D|        |00AF7B;
                       dw DATA8_00AFAB                      ;00AE3F|        |00AFAB;
                       dw $FFFF                             ;00AE41|        |      ;
 
         PTR16_00AE43: dw DATA8_00AEC7                      ;00AE43|        |00AEC7;
                       dw DATA8_00AEDF                      ;00AE45|        |00AEDF;
                       dw DATA8_00AEF7                      ;00AE47|        |00AEF7;
                       dw DATA8_00AF0F                      ;00AE49|        |00AF0F;
                       dw DATA8_00AF3F                      ;00AE4B|        |00AF3F;
                       dw DATA8_00AF6F                      ;00AE4D|        |00AF6F;
                       dw DATA8_00AF9F                      ;00AE4F|        |00AF9F;
                       dw DATA8_00AFCF                      ;00AE51|        |00AFCF;
                       dw $FFFF                             ;00AE53|        |      ;
 
         PTR16_00AE55: dw DATA8_00AEC7                      ;00AE55|        |00AEC7;
                       dw DATA8_00AEDF                      ;00AE57|        |00AEDF;
                       dw DATA8_00AEF7                      ;00AE59|        |00AEF7;
                       dw DATA8_00AF0F                      ;00AE5B|        |00AF0F;
                       dw DATA8_00AF27                      ;00AE5D|        |00AF27;
                       dw DATA8_00AF57                      ;00AE5F|        |00AF57;
 
                       dw DATA8_00AF87                      ;00AE61|        |00AF87;
                       dw DATA8_00AFB7                      ;00AE63|        |00AFB7;
                       dw $FFFF                             ;00AE65|        |      ;
 
         PTR16_00AE67: dw DATA8_00B12D                      ;00AE67|        |00B12D;
                       dw DATA8_00B142                      ;00AE69|        |00B142;
                       dw DATA8_00B169                      ;00AE6B|        |00B169;
                       dw DATA8_00B18C                      ;00AE6D|        |00B18C;
                       dw DATA8_00B1C2                      ;00AE6F|        |00B1C2;
                       dw DATA8_00B1EC                      ;00AE71|        |00B1EC;
                       dw DATA8_00B222                      ;00AE73|        |00B222;
                       dw DATA8_00B23C                      ;00AE75|        |00B23C;
                       dw DATA8_00B24E                      ;00AE77|        |00B24E;
                       dw $FFFF                             ;00AE79|        |      ;
 
         PTR16_00AE7B: dw DATA8_00AFDB                      ;00AE7B|        |00AFDB;
                       dw DATA8_00AFF7                      ;00AE7D|        |00AFF7;
                       dw DATA8_00B03C                      ;00AE7F|        |00B03C;
                       dw DATA8_00B061                      ;00AE81|        |00B061;
                       dw DATA8_00B082                      ;00AE83|        |00B082;
                       dw DATA8_00B0A1                      ;00AE85|        |00B0A1;
                       dw DATA8_00B0C6                      ;00AE87|        |00B0C6;
                       dw DATA8_00B0EC                      ;00AE89|        |00B0EC;
                       dw DATA8_00B0FB                      ;00AE8B|        |00B0FB;
                       dw $FFFF                             ;00AE8D|        |      ;
 
         PTR16_00AE8F: dw DATA8_00B288                      ;00AE8F|        |00B288;
                       dw DATA8_00B2AD                      ;00AE91|        |00B2AD;
                       dw DATA8_00B2F2                      ;00AE93|        |00B2F2;
                       dw DATA8_00B317                      ;00AE95|        |00B317;
                       dw DATA8_00B333                      ;00AE97|        |00B333;
                       dw DATA8_00B353                      ;00AE99|        |00B353;
                       dw DATA8_00B37D                      ;00AE9B|        |00B37D;
                       dw DATA8_00B3A2                      ;00AE9D|        |00B3A2;
                       dw DATA8_00B3B1                      ;00AE9F|        |00B3B1;
                       dw $FFFF                             ;00AEA1|        |      ;
 
         DATA8_00AEA3: db $23,$D0,$00,$05,$00,$FE,$23,$D8   ;00AEA3|        |      ;
                       db $00,$05,$00,$FF                   ;00AEAB|        |      ;
 
         DATA8_00AEAF: db $23,$D8,$00,$04,$00,$FE,$23,$E0   ;00AEAF|        |      ;
                       db $00,$04,$00,$FF                   ;00AEB7|        |      ;
 
         DATA8_00AEBB: db $23,$DB,$00,$04,$00,$FE,$23,$E3   ;00AEBB|        |      ;
                       db $00,$04,$00,$FF                   ;00AEC3|        |      ;
 
         DATA8_00AEC7: db $20,$83,$00,$1A,$00,$FE,$20,$A3   ;00AEC7|        |      ;
                       db $00,$1A,$00,$FF                   ;00AECF|        |      ;
 
         DATA8_00AED3: db $20,$C3,$00,$1A,$00,$FE,$20,$E3   ;00AED3|        |      ;
                       db $00,$1A,$00,$FF                   ;00AEDB|        |      ;
 
         DATA8_00AEDF: db $20,$C3,$00,$1A,$00,$FE,$20,$E3   ;00AEDF|        |      ;
                       db $00,$1A,$00,$FF                   ;00AEE7|        |      ;
 
         DATA8_00AEEB: db $21,$14,$00,$09,$00,$FE,$21,$34   ;00AEEB|        |      ;
                       db $00,$09,$00,$FF                   ;00AEF3|        |      ;
 
         DATA8_00AEF7: db $21,$03,$00,$1A,$00,$FE,$21,$23   ;00AEF7|        |      ;
                       db $00,$1A,$00,$FF                   ;00AEFF|        |      ;
 
         DATA8_00AF03: db $21,$54,$00,$09,$00,$FE,$21,$74   ;00AF03|        |      ;
                       db $00,$09,$00,$FF                   ;00AF0B|        |      ;
 
         DATA8_00AF0F: db $21,$43,$00,$1A,$00,$FE,$21,$63   ;00AF0F|        |      ;
                       db $00,$1A,$00,$FF                   ;00AF17|        |      ;
 
         DATA8_00AF1B: db $21,$94,$00,$09,$00,$FE,$21,$B4   ;00AF1B|        |      ;
                       db $00,$09,$00,$FF                   ;00AF23|        |      ;
 
         DATA8_00AF27: db $21,$83,$00,$09,$00,$FE,$21,$9C   ;00AF27|        |      ;
                       db $00,$01,$00,$FE,$21,$A3,$00,$09   ;00AF2F|        |      ;
                       db $00,$FE,$21,$BC,$00,$01,$00,$FF   ;00AF37|        |      ;
 
         DATA8_00AF3F: db $21,$90,$00,$0D,$00,$FE,$21,$B0   ;00AF3F|        |      ;
                       db $00,$0D,$00,$FF                   ;00AF47|        |      ;
 
         DATA8_00AF4B: db $21,$D4,$00,$09,$00,$FE,$21,$F4   ;00AF4B|        |      ;
                       db $00,$09,$00,$FF                   ;00AF53|        |      ;
 
         DATA8_00AF57: db $21,$C3,$00,$09,$00,$FE,$21,$DC   ;00AF57|        |      ;
                       db $00,$01,$00,$FE,$21,$E3,$00,$09   ;00AF5F|        |      ;
 
                       db $00,$FE,$21,$FC,$00,$01,$00,$FF   ;00AF67|        |      ;
 
         DATA8_00AF6F: db $21,$D0,$00,$0D,$00,$FE,$21,$F0   ;00AF6F|        |      ;
                       db $00,$0D,$00,$FF                   ;00AF77|        |      ;
 
         DATA8_00AF7B: db $22,$03,$00,$1A,$00,$FE,$22,$23   ;00AF7B|        |      ;
                       db $00,$1A,$00,$FF                   ;00AF83|        |      ;
 
         DATA8_00AF87: db $22,$03,$00,$09,$00,$FE,$22,$1C   ;00AF87|        |      ;
                       db $00,$01,$00,$FE,$22,$23,$00,$09   ;00AF8F|        |      ;
                       db $00,$FE,$22,$3C,$00,$01,$00,$FF   ;00AF97|        |      ;
 
         DATA8_00AF9F: db $22,$10,$00,$0D,$00,$FE,$22,$30   ;00AF9F|        |      ;
                       db $00,$0D,$00,$FF                   ;00AFA7|        |      ;
 
         DATA8_00AFAB: db $22,$43,$00,$1A,$00,$FE,$22,$63   ;00AFAB|        |      ;
                       db $00,$1A,$00,$FF                   ;00AFB3|        |      ;
 
         DATA8_00AFB7: db $22,$43,$00,$09,$00,$FE,$22,$5C   ;00AFB7|        |      ;
 
                       db $00,$01,$00,$FE,$22,$63,$00,$09   ;00AFBF|        |      ;
                       db $00,$FE,$22,$7C,$00,$01,$00,$FF   ;00AFC7|        |      ;
 
         DATA8_00AFCF: db $22,$50,$00,$0D,$00,$FE,$22,$70   ;00AFCF|        |      ;
                       db $00,$0D,$00,$FF                   ;00AFD7|        |      ;
 
         DATA8_00AFDB: db $23,$20,$00,$0C,$00,$80,$14,$7A   ;00AFDB|        |      ;
                       db $00,$45,$82,$45,$82,$00,$00,$45   ;00AFE3|        |      ;
                       db $44,$45,$46,$56,$46,$00,$46,$56   ;00AFEB|        |      ;
                       db $00,$00,$00,$FF                   ;00AFF3|        |      ;
 
         DATA8_00AFF7: db $23,$40,$80,$40,$00,$00,$7A,$7A   ;00AFF7|        |      ;
                       db $5F,$5F,$6F,$5F,$00,$00,$81,$82   ;00AFFF|        |      ;
 
                       db $82,$00,$8B,$64,$80,$80,$82,$00   ;00B007|        |      ;
                       db $8B,$80,$90,$91,$45,$79,$9B,$7A   ;00B00F|        |      ;
                       db $00,$46,$00,$00,$00,$00,$5F,$6F   ;00B017|        |      ;
                       db $5F,$7A,$7A,$6F,$5F,$00,$91,$8B   ;00B01F|        |      ;
                       db $90,$00,$00,$00,$91,$8B,$90,$00   ;00B027|        |      ;
                       db $00,$64,$00,$00,$00,$00,$AB,$00   ;00B02F|        |      ;
                       db $AC,$00,$00,$00,$FF               ;00B037|        |      ;
 
         DATA8_00B03C: db $23,$80,$80,$20,$00,$00,$7A,$7A   ;00B03C|        |      ;
                       db $6F,$5F,$6F,$5F,$7A,$6F,$5F,$7A   ;00B044|        |      ;
                       db $5F,$7A,$7A,$8A,$89,$8A,$89,$89   ;00B04C|        |      ;
                       db $8A,$8A,$7A,$79,$8E,$7A,$8E,$79   ;00B054|        |      ;
                       db $8E,$7A,$00,$00,$FF               ;00B05C|        |      ;
 
         DATA8_00B061: db $20,$00,$80,$0E,$7C,$7C,$7F,$7F   ;00B061|        |      ;
                       db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F   ;00B069|        |      ;
                       db $7E,$7D,$00,$10,$7F,$00,$02,$7C   ;00B071|        |      ;
                       db $00,$0D,$00,$80,$03,$BF,$00,$00   ;00B079|        |      ;
                       db $FF                               ;00B081|        |      ;
 
         DATA8_00B082: db $20,$40,$00,$0E,$00,$80,$01,$BF   ;00B082|        |      ;
                       db $00,$20,$00,$80,$11,$BF,$00,$81   ;00B08A|        |      ;
                       db $81,$79,$45,$44,$7A,$00,$00,$79   ;00B092|        |      ;
                       db $45,$44,$79,$7A,$00,$00,$FF       ;00B09A|        |      ;
 
         DATA8_00B0A1: db $20,$90,$80,$0C,$BF,$00,$64,$90   ;00B0A1|        |      ;
 
                       db $91,$90,$00,$00,$87,$88,$91,$90   ;00B0A9|        |      ;
                       db $00,$15,$00,$80,$0F,$BF,$00,$00   ;00B0B1|        |      ;
                       db $00,$00,$87,$88,$97,$98,$00,$99   ;00B0B9|        |      ;
                       db $9A,$00,$00,$00,$FF               ;00B0C1|        |      ;
 
         DATA8_00B0C6: db $20,$C0,$00,$0E,$00,$80,$10,$7C   ;00B0C6|        |      ;
                       db $7C,$00,$00,$BF,$00,$AA,$A9,$A7   ;00B0CE|        |      ;
                       db $A8,$A7,$A8,$A5,$A9,$AA,$A5,$00   ;00B0D6|        |      ;
                       db $10,$00,$80,$06,$7C,$7C,$00,$00   ;00B0DE|        |      ;
                       db $00,$BF,$00,$0C,$00,$FF           ;00B0E6|        |      ;
 
         DATA8_00B0EC: db $21,$00,$00,$0E,$00,$00,$02,$7C   ;00B0EC|        |      ;
                       db $00,$0E,$7F,$00,$02,$7C,$FF       ;00B0F4|        |      ;
 
         DATA8_00B0FB: db $23,$F0,$80,$10,$55,$55,$55,$55   ;00B0FB|        |      ;
                       db $55,$55,$55,$11,$05,$05,$05,$09   ;00B103|        |      ;
                       db $0A,$06,$05,$01,$FE,$23,$C0,$80   ;00B10B|        |      ;
                       db $18,$00,$00,$00,$00,$50,$50,$50   ;00B113|        |      ;
                       db $10,$00,$00,$00,$00,$08,$FE,$FB   ;00B11B|        |      ;
                       db $32,$00,$00,$00,$00,$00,$00,$00   ;00B123|        |      ;
                       db $00,$FF                           ;00B12B|        |      ;
 
         DATA8_00B12D: db $22,$60,$00,$13,$00,$80,$0D,$81   ;00B12D|        |      ;
                       db $45,$44,$A2,$A3,$00,$83,$84,$85   ;00B135|        |      ;
                       db $86,$A3,$00,$00,$FF               ;00B13D|        |      ;
 
         DATA8_00B142: db $22,$80,$00,$12,$00,$80,$0C,$81   ;00B142|        |      ;
                       db $65,$80,$80,$A2,$A3,$00,$96,$94   ;00B14A|        |      ;
                       db $95,$96,$A3,$00,$14,$00,$80,$0E   ;00B152|        |      ;
                       db $65,$80,$80,$80,$A2,$A3,$A4,$A6   ;00B15A|        |      ;
                       db $A4,$94,$A6,$B3,$00,$00,$FF       ;00B162|        |      ;
 
         DATA8_00B169: db $22,$C0,$00,$12,$00,$80,$0C,$92   ;00B169|        |      ;
                       db $BA,$BB,$BC,$B2,$B3,$A4,$A6,$B4   ;00B171|        |      ;
                       db $B5,$A6,$A3,$00,$05,$00,$80,$07   ;00B179|        |      ;
                       db $81,$45,$44,$45,$44,$45,$81,$00   ;00B181|        |      ;
                       db $16,$00,$FF                       ;00B189|        |      ;
 
         DATA8_00B18C: db $23,$00,$00,$03,$00,$80,$08,$91   ;00B18C|        |      ;
                       db $90,$91,$92,$80,$80,$82,$79,$00   ;00B194|        |      ;
                       db $05,$00,$80,$05,$7F,$7F,$7F,$7E   ;00B19C|        |      ;
                       db $7D,$00,$09,$7F,$80,$0E,$7C,$7C   ;00B1A4|        |      ;
                       db $00,$00,$00,$A1,$00,$A1,$00,$00   ;00B1AC|        |      ;
                       db $91,$80,$8B,$7A,$00,$06,$00,$80   ;00B1B4|        |      ;
                       db $01,$7E,$00,$0D,$00,$FF           ;00B1BC|        |      ;
 
         DATA8_00B1C2: db $23,$40,$80,$0C,$00,$00,$00,$B1   ;00B1C2|        |      ;
                       db $B0,$B1,$A0,$A0,$00,$B0,$00,$A0   ;00B1CA|        |      ;
                       db $00,$05,$00,$80,$01,$BF,$00,$1E   ;00B1D2|        |      ;
                       db $00,$80,$01,$BF,$00,$07,$00,$80   ;00B1DA|        |      ;
                       db $08,$8C,$8D,$8D,$8F,$8C,$00,$00   ;00B1E2|        |      ;
                       db $00,$FF                           ;00B1EA|        |      ;
 
         DATA8_00B1EC: db $23,$80,$00,$02,$7C,$00,$0A,$7F   ;00B1EC|        |      ;
                       db $80,$11,$7E,$7D,$7F,$7F,$00,$81   ;00B1F4|        |      ;
                       db $44,$B7,$B8,$B7,$45,$81,$9C,$9D   ;00B1FC|        |      ;
                       db $9E,$9F,$9C,$00,$10,$00,$80,$01   ;00B204|        |      ;
                       db $BF,$00,$03,$00,$80,$0F,$64,$8B   ;00B20C|        |      ;
                       db $B7,$B9,$B7,$8B,$64,$81,$AD,$AE   ;00B214|        |      ;
                       db $AF,$AD,$00,$00,$00,$FF           ;00B21C|        |      ;
 
         DATA8_00B222: db $20,$00,$00,$0E,$00,$80,$12,$BF   ;00B222|        |      ;
                       db $00,$00,$00,$00,$B7,$00,$B7,$81   ;00B22A|        |      ;
                       db $BD,$BD,$00,$BE,$75,$BD,$00,$00   ;00B232|        |      ;
                       db $00,$FF                           ;00B23A|        |      ;
 
         DATA8_00B23C: db $20,$20,$00,$0F,$00,$80,$01,$BF   ;00B23C|        |      ;
                       db $00,$1E,$00,$00,$10,$7F,$00,$02   ;00B244|        |      ;
                       db $7C,$FF                           ;00B24C|        |      ;
 
         DATA8_00B24E: db $23,$E0,$80,$20,$00,$00,$00,$00   ;00B24E|        |      ;
                       db $C0,$F0,$F0,$30,$50,$50,$50,$10   ;00B256|        |      ;
                       db $CC,$FF,$FF,$33,$55,$D5,$D5,$11   ;00B25E|        |      ;
                       db $80,$A0,$A0,$20,$00,$00,$00,$00   ;00B266|        |      ;
                       db $0F,$0B,$0A,$02,$FE,$23,$C0,$80   ;00B26E|        |      ;
                       db $10,$00,$00,$00,$00,$0F,$0B,$0A   ;00B276|        |      ;
                       db $02,$00,$00,$00,$00,$00,$00,$00   ;00B27E|        |      ;
                       db $00,$FF                           ;00B286|        |      ;
 
         DATA8_00B288: db $22,$E0,$80,$20,$00,$00,$7A,$4B   ;00B288|        |      ;
                       db $4F,$00,$4E,$4C,$4F,$4D,$4A,$49   ;00B290|        |      ;
                       db $4F,$7A,$00,$4A,$67,$4C,$4E,$4F   ;00B298|        |      ;
                       db $4F,$47,$4E,$4C,$B8,$B8,$83,$93   ;00B2A0|        |      ;
                       db $86,$B8,$00,$00,$FF               ;00B2A8|        |      ;
 
         DATA8_00B2AD: db $23,$00,$80,$40,$00,$00,$4B,$4B   ;00B2AD|        |      ;
                       db $57,$5D,$5E,$00,$58,$59,$5A,$5B   ;00B2B5|        |      ;
                       db $58,$00,$00,$00,$69,$58,$5E,$69   ;00B2BD|        |      ;
                       db $57,$6E,$4A,$57,$93,$B8,$4B,$A1   ;00B2C5|        |      ;
                       db $4B,$93,$00,$00,$00,$00,$6A,$66   ;00B2CD|        |      ;
                       db $68,$79,$6E,$6C,$69,$6A,$6A,$66   ;00B2D5|        |      ;
                       db $4B,$7A,$00,$00,$75,$7A,$6E,$75   ;00B2DD|        |      ;
                       db $68,$59,$5A,$5B,$00,$4B,$4B,$B1   ;00B2E5|        |      ;
                       db $4B,$4B,$00,$00,$FF               ;00B2ED|        |      ;
 
         DATA8_00B2F2: db $23,$40,$80,$20,$00,$00,$4C,$49   ;00B2F2|        |      ;
                       db $6D,$5C,$6B,$7B,$49,$48,$4D,$58   ;00B2FA|        |      ;
                       db $4B,$4B,$00,$00,$00,$4F,$49,$5C   ;00B302|        |      ;
                       db $6D,$69,$6A,$6B,$00,$4B,$76,$77   ;00B30A|        |      ;
                       db $78,$00,$00,$00,$FF               ;00B312|        |      ;
 
         DATA8_00B317: db $23,$80,$00,$02,$7C,$00,$11,$7F   ;00B317|        |      ;
                       db $80,$02,$7E,$7D,$00,$09,$7F,$00   ;00B31F|        |      ;
                       db $02,$7C,$00,$12,$00,$80,$01,$7E   ;00B327|        |      ;
                       db $00,$0D,$00,$FF                   ;00B32F|        |      ;
 
         DATA8_00B333: db $20,$00,$00,$11,$00,$80,$01,$BF   ;00B333|        |      ;
                       db $00,$10,$00,$80,$09,$41,$42,$41   ;00B33B|        |      ;
                       db $42,$42,$43,$44,$45,$7A,$00,$05   ;00B343|        |      ;
                       db $00,$80,$01,$BF,$00,$0F,$00,$FF   ;00B34B|        |      ;
 
         DATA8_00B353: db $20,$40,$80,$10,$00,$00,$40,$55   ;00B353|        |      ;
 
                       db $63,$54,$40,$52,$53,$54,$55,$82   ;00B35B|        |      ;
                       db $7A,$00,$00,$BF,$00,$12,$00,$80   ;00B363|        |      ;
                       db $0D,$50,$51,$50,$60,$50,$00,$61   ;00B36B|        |      ;
                       db $00,$62,$64,$00,$00,$BF,$00,$11   ;00B373|        |      ;
                       db $00,$FF                           ;00B37B|        |      ;
 
         DATA8_00B37D: db $20,$80,$80,$12,$00,$00,$72,$74   ;00B37D|        |      ;
                       db $72,$74,$72,$70,$71,$74,$72,$74   ;00B385|        |      ;
                       db $00,$BF,$00,$00,$7C,$7C,$00,$1A   ;00B38D|        |      ;
                       db $00,$80,$06,$BF,$00,$00,$00,$7C   ;00B395|        |      ;
                       db $7C,$00,$0E,$00,$FF               ;00B39D|        |      ;
 
         DATA8_00B3A2: db $20,$C0,$00,$02,$7C,$00,$0E,$7F   ;00B3A2|        |      ;
                       db $00,$02,$7C,$00,$0E,$00,$FF       ;00B3AA|        |      ;
 
         DATA8_00B3B1: db $23,$E8,$80,$18,$D0,$50,$50,$90   ;00B3B1|        |      ;
                       db $A0,$A0,$F0,$B0,$4D,$55,$55,$BB   ;00B3B9|        |      ;
                       db $AA,$AA,$3F,$8B,$00,$00,$00,$00   ;00B3C1|        |      ;
 
                       db $00,$00,$00,$00,$FE,$23,$C0,$80   ;00B3C9|        |      ;
 
                       db $10,$FF,$FF,$FF,$33,$00,$00,$00   ;00B3D1|        |      ;
                       db $00,$0F,$0F,$0F,$00,$00,$00,$00   ;00B3D9|        |      ;
                       db $00,$FF                           ;00B3E1|        |      ;
 
          CODE_00B3E3: LDA.B #$00                           ;00B3E3|A900    |      ;
                       STA.B r_074                          ;00B3E5|8574    |000074;
                       db $4C                               ;00B3E7|        |      ;
 
                       dw swap2Bank_00_Plus                 ;00B3E8|        |0FE795;
 
bossBoneDragonWaterScene: LDA.B r_menuSelectIdx                ;00B3EA|A56B    |00006B;
                       db $20                               ;00B3EC|        |      ;
                       dw jumpFromStackYXpreserved          ;00B3ED|        |0FE86D;
                       dw ram_6bTransit_00                  ;00B3EF|        |00B413;
                       dw ram_6bTransit_00                  ;00B3F1|        |00B413;
                       dw ram_6bTransit_02                  ;00B3F3|        |00B41F;
                       dw ram_6bTransit_03                  ;00B3F5|        |00B436;
                       dw ram_6bTransit_04                  ;00B3F7|        |00B49A;
                       dw ram_6bTransit_05                  ;00B3F9|        |00B4CE;
                       dw ram_6bTransit_06                  ;00B3FB|        |00B4EB;
                       dw ram_6bTransit_07                  ;00B3FD|        |00B501;
                       dw ram_6bTransit_08                  ;00B3FF|        |00B50C;
                       dw ram_6bTransit_09                  ;00B401|        |00B51C;
                       dw ram_6bTransit_0a                  ;00B403|        |00B536;
                       dw ram_6b_boneDragonBossTrans_0b     ;00B405|        |00B561;
 
          CODE_00B407: LDA.B #$01                           ;00B407|A901    |      ;
                       STA.B r_bossActiveFlag               ;00B409|8578    |000078;
                       db $20                               ;00B40B|        |      ;
                       dw CODE_0FE6C5                       ;00B40C|        |0FE6C5;
                       LDA.B #$00                           ;00B40E|A900    |      ;
                       STA.B r_bossActiveFlag               ;00B410|8578    |000078;
                       RTS                                  ;00B412|60      |      ;
 
 
     ram_6bTransit_00: db $20                               ;00B413|        |      ;
                       dw setBank_c000_1E                   ;00B414|        |0FE2DA;
                       JSR.W CODE_00B3E3                    ;00B416|20E3B3  |00B3E3;
                       db $20                               ;00B419|        |      ;
                       dw setAutoPlayFlag                   ;00B41A|        |0FE5CE;
                       INC.B r_menuSelectIdx                ;00B41C|E66B    |00006B;
                       RTS                                  ;00B41E|60      |      ;
 
 
     ram_6bTransit_02: JSR.W CODE_00B83A                    ;00B41F|203AB8  |00B83A;
                       JSR.W CODE_00B7B0                    ;00B422|20B0B7  |00B7B0;
                       LDA.B #$00                           ;00B425|A900    |      ;
                       JSR.W CODE_00B71D                    ;00B427|201DB7  |00B71D;
                       INC.B r_menuSelectIdx                ;00B42A|E66B    |00006B;
                       RTS                                  ;00B42C|60      |      ;
 
 
          CODE_00B42D: LDA.B #$00                           ;00B42D|A900    |      ;
                       STA.B r_sceneScrollOffsetLo          ;00B42F|8556    |000056;
 
                       LDA.B #$02                           ;00B431|A902    |      ;
                       STA.B r_sceneScrollOffsetHi          ;00B433|8557    |000057;
                       RTS                                  ;00B435|60      |      ;
 
 
     ram_6bTransit_03: JSR.W CODE_008F0B                    ;00B436|200B8F  |008F0B;
                       JSR.W CODE_00B42D                    ;00B439|202DB4  |00B42D;
                       JSR.W CODE_00B407                    ;00B43C|2007B4  |00B407;
                       JSR.W CODE_00B83A                    ;00B43F|203AB8  |00B83A;
 
                       LDA.W r_Player_StateDoubled          ;00B442|AD6505  |000565;
                       CMP.B #$02                           ;00B445|C902    |      ;
                       BEQ CODE_00B44A                      ;00B447|F001    |00B44A;
 
          CODE_00B449: RTS                                  ;00B449|60      |      ;
 
 
          CODE_00B44A: LDA.W r_entity_ObjectIdxes           ;00B44A|AD4E05  |00054E;
                       CMP.B #$02                           ;00B44D|C902    |      ;
                       BNE CODE_00B455                      ;00B44F|D004    |00B455;
                       LDX.B #$0C                           ;00B451|A20C    |      ;
                       BNE CODE_00B457                      ;00B453|D002    |00B457;
 
          CODE_00B455: LDX.B #$10                           ;00B455|A210    |      ;
 
          CODE_00B457: STX.B r_pointerQueue                 ;00B457|8608    |000008;
                       LDX.B #$F0                           ;00B459|A2F0    |      ;
                       LDA.B #$FB                           ;00B45B|A9FB    |      ;
                       db $20                               ;00B45D|        |      ;
                       dw CODE_0FFCDD                       ;00B45E|        |0FFCDD;
                       BNE CODE_00B449                      ;00B460|D0E7    |00B449;
                       LDX.B #$F0                           ;00B462|A2F0    |      ;
                       LDA.B #$05                           ;00B464|A905    |      ;
                       db $20                               ;00B466|        |      ;
                       dw CODE_0FFCDD                       ;00B467|        |0FFCDD;
                       BNE CODE_00B449                      ;00B469|D0DE    |00B449;
                       LDX.B r_pointerQueue                 ;00B46B|A608    |000008;
                       LDA.B #$FB                           ;00B46D|A9FB    |      ;
                       db $20                               ;00B46F|        |      ;
                       dw CODE_0FFCDD                       ;00B470|        |0FFCDD;
                       BNE CODE_00B47E                      ;00B472|D00A    |00B47E;
                       LDA.B #$05                           ;00B474|A905    |      ;
                       LDX.B r_pointerQueue                 ;00B476|A608    |000008;
 
                       db $20                               ;00B478|        |      ;
                       dw CODE_0FFCDD                       ;00B479|        |0FFCDD;
                       BNE CODE_00B47E                      ;00B47B|D001    |00B47E;
                       RTS                                  ;00B47D|60      |      ;
 
 
          CODE_00B47E: LDA.B #$00                           ;00B47E|A900    |      ;
                       STA.B r_timerClunk_drop              ;00B480|85B9    |0000B9;
 
                       STA.W $0413                          ;00B482|8D1304  |000413;
                       STA.W $0414                          ;00B485|8D1404  |000414;
 
                       STA.W $0415                          ;00B488|8D1504  |000415;
                       STA.W $0416                          ;00B48B|8D1604  |000416;
 
          CODE_00B48E: STA.W $0562                          ;00B48E|8D6205  |000562;
 
                       STA.W $0563                          ;00B491|8D6305  |000563;
                       STA.W $0564                          ;00B494|8D6405  |000564;
                       INC.B r_menuSelectIdx                ;00B497|E66B    |00006B;
                       RTS                                  ;00B499|60      |      ;
 
 
     ram_6bTransit_04: LDA.W r_entity_XPos                  ;00B49A|AD3804  |000438;
                       CMP.B #$D0                           ;00B49D|C9D0    |      ;
                       BCS CODE_00B4BC                      ;00B49F|B01B    |00B4BC;
                       JSR.W CODE_00B7EE                    ;00B4A1|20EEB7  |00B7EE;
                       BCS CODE_00B4B0                      ;00B4A4|B00A    |00B4B0;
                       LDA.W r_entity_ObjectIdxes,X         ;00B4A6|BD4E05  |00054E;
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
                       STA.B r_timerGenerel                 ;00B4C9|8530    |000030;
                       JMP.W CODE_00B47E                    ;00B4CB|4C7EB4  |00B47E;
 
 
     ram_6bTransit_05: JSR.W CODE_00B83A                    ;00B4CE|203AB8  |00B83A;
                       JSR.W DATA8_00B859                   ;00B4D1|2059B8  |00B859;
                       DEC.B r_timerGenerel                 ;00B4D4|C630    |000030;
                       BEQ CODE_00B4D9                      ;00B4D6|F001    |00B4D9;
                       RTS                                  ;00B4D8|60      |      ;
 
 
          CODE_00B4D9: LDY.B #$00                           ;00B4D9|A000    |      ;
                       STY.W r_EffectSpeedSupGeneral        ;00B4DB|8C8507  |000785;
                       STY.W r_PW_iconGeneral               ;00B4DE|8C8607  |000786;
 
                       INY                                  ;00B4E1|C8      |      ;
                       STY.W r_EffectSpeedGeneral           ;00B4E2|8C8407  |000784;
                       STY.W $0787                          ;00B4E5|8C8707  |000787;
                       INC.B r_menuSelectIdx                ;00B4E8|E66B    |00006B;
                       RTS                                  ;00B4EA|60      |      ;
 
 
     ram_6bTransit_06: JSR.W CODE_00B82C                    ;00B4EB|202CB8  |00B82C;
                       JSR.W DATA8_00B859                   ;00B4EE|2059B8  |00B859;
                       JSR.W CODE_00B5F2                    ;00B4F1|20F2B5  |00B5F2;
                       JSR.W CODE_00B90E                    ;00B4F4|200EB9  |00B90E;
                       BCS CODE_00B4FA                      ;00B4F7|B001    |00B4FA;
                       RTS                                  ;00B4F9|60      |      ;
 
 
          CODE_00B4FA: LDA.B #$00                           ;00B4FA|A900    |      ;
                       STA.B $C9                            ;00B4FC|85C9    |0000C9;
                       INC.B r_menuSelectIdx                ;00B4FE|E66B    |00006B;
                       RTS                                  ;00B500|60      |      ;
 
 
     ram_6bTransit_07: JSR.W CODE_00B82C                    ;00B501|202CB8  |00B82C;
                       JSR.W CODE_00B63E                    ;00B504|203EB6  |00B63E;
                       BCC CODE_00B50B                      ;00B507|9002    |00B50B;
                       INC.B r_menuSelectIdx                ;00B509|E66B    |00006B;
 
          CODE_00B50B: RTS                                  ;00B50B|60      |      ;
 
 
     ram_6bTransit_08: JSR.W CODE_00B82C                    ;00B50C|202CB8  |00B82C;
                       JSR.W CODE_00B5F2                    ;00B50F|20F2B5  |00B5F2;
                       JSR.W DATA8_00D5C3                   ;00B512|20C3D5  |00D5C3;
                       LDA.B #$03                           ;00B515|A903    |      ;
                       STA.B r_HUD_CHR_overwrite            ;00B517|8572    |000072;
                       INC.B r_menuSelectIdx                ;00B519|E66B    |00006B;
                       RTS                                  ;00B51B|60      |      ;
 
 
     ram_6bTransit_09: JSR.W CODE_00B82C                    ;00B51C|202CB8  |00B82C;
                       JSR.W CODE_00B5F2                    ;00B51F|20F2B5  |00B5F2;
                       JSR.W CODE_00B5DE                    ;00B522|20DEB5  |00B5DE;
                       LDA.B r_floodHight                   ;00B525|A5CA    |0000CA;
 
                       CMP.B #$A0                           ;00B527|C9A0    |      ;
                       BCS CODE_00B535                      ;00B529|B00A    |00B535;
                       JSR.W CODE_00B79D                    ;00B52B|209DB7  |00B79D;
                       LDA.B #$06                           ;00B52E|A906    |      ;
                       JSR.W CODE_00B71D                    ;00B530|201DB7  |00B71D;
                       INC.B r_menuSelectIdx                ;00B533|E66B    |00006B;
 
          CODE_00B535: RTS                                  ;00B535|60      |      ;
 
 
     ram_6bTransit_0a: JSR.W CODE_00B5F2                    ;00B536|20F2B5  |00B5F2;
                       LDA.W r_entity_XPos                  ;00B539|AD3804  |000438;
                       CMP.B #$E8                           ;00B53C|C9E8    |      ;
                       BCS CODE_00B557                      ;00B53E|B017    |00B557;
                       JSR.W CODE_00B7EE                    ;00B540|20EEB7  |00B7EE;
                       BCS CODE_00B54B                      ;00B543|B006    |00B54B;
                       LDA.W r_entity_ObjectIdxes,X         ;00B545|BD4E05  |00054E;
                       JSR.W DATA8_00B716                   ;00B548|2016B7  |00B716;
 
          CODE_00B54B: JSR.W CODE_00B72A                    ;00B54B|202AB7  |00B72A;
                       JSR.W CODE_00B42D                    ;00B54E|202DB4  |00B42D;
                       JSR.W CODE_00B407                    ;00B551|2007B4  |00B407;
                       JMP.W CODE_00B82C                    ;00B554|4C2CB8  |00B82C;
 
 
          CODE_00B557: JSR.W CODE_00B82C                    ;00B557|202CB8  |00B82C;
                       LDA.B #$02                           ;00B55A|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;00B55C|851C    |00001C;
                       INC.B r_menuSelectIdx                ;00B55E|E66B    |00006B;
                       RTS                                  ;00B560|60      |      ;
 
 
ram_6b_boneDragonBossTrans_0b: LDA.B #$02                           ;00B561|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;00B563|851C    |00001C;
                       db $20                               ;00B565|        |      ;
                       dw unsetAutoPlayFlag                 ;00B566|        |0FE5CA;
                       JSR.W CODE_00B3E3                    ;00B568|20E3B3  |00B3E3;
                       LDA.B #$00                           ;00B56B|A900    |      ;
                       STA.B r_IRQFuncIdx                   ;00B56D|853F    |00003F;
                       STA.B r_IRQFuncDrawIdx               ;00B56F|856D    |00006D;
                       LDA.B #$40                           ;00B571|A940    |      ;
                       STA.B r_HUD_healthBoss               ;00B573|853D    |00003D;
                       db $20                               ;00B575|        |      ;
                       dw UNREACH_0FFB85                    ;00B576|        |0FFB85;
                       INC.B r_blockLevel                   ;00B578|E633    |000033;
                       LDA.B #$00                           ;00B57A|A900    |      ;
                       STA.B r_roomIdx                      ;00B57C|8534    |000034;
                       LDA.B #$01                           ;00B57E|A901    |      ;
                       STA.B r_gameTransition               ;00B580|852A    |00002A;
                       RTS                                  ;00B582|60      |      ;
 
 
          CODE_00B583: LDA.B r_deathDelay                   ;00B583|A5BF    |0000BF;
 
                       BNE CODE_00B5ED                      ;00B585|D066    |00B5ED;
                       LDA.B r_floodHight                   ;00B587|A5CA    |0000CA;
                       CMP.B #$32                           ;00B589|C932    |      ;
                       BCC CODE_00B599                      ;00B58B|900C    |00B599;
 
                       LDA.W r_entity_YPos                  ;00B58D|AD1C04  |00041C;
                       SEC                                  ;00B590|38      |      ;
                       SBC.B #$10                           ;00B591|E910    |      ;
                       BCC CODE_00B5CD                      ;00B593|9038    |00B5CD;
 
                       CMP.B r_floodHight                   ;00B595|C5CA    |0000CA;
                       BCC CODE_00B5CD                      ;00B597|9034    |00B5CD;
 
          CODE_00B599: LDA.W r_Player_StateDoubled          ;00B599|AD6505  |000565;
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
                       LDA.W r_boss_batRiverSwap            ;00B5B8|AD0206  |000602;
                       BEQ DATA8_00B5C7                     ;00B5BB|F00A    |00B5C7;
 
          CODE_00B5BD: LDA.B #$2E                           ;00B5BD|A92E    |      ;
                       STA.W r_Player_StateDoubled          ;00B5BF|8D6505  |000565;
                       LDA.B #$80                           ;00B5C2|A980    |      ;
                       STA.B r_deathDelay                   ;00B5C4|85BF    |0000BF;
                       RTS                                  ;00B5C6|60      |      ;
 
 
         DATA8_00B5C7: db $20                               ;00B5C7|        |      ;
                       dw CODE_0FE5AF                       ;00B5C8|        |0FE5AF;
                       JMP.W CODE_00B5BD                    ;00B5CA|4CBDB5  |00B5BD;
 
 
          CODE_00B5CD: LDA.B r_floodStop                    ;00B5CD|A5C0    |0000C0;
                       BNE CODE_00B5ED                      ;00B5CF|D01C    |00B5ED;
                       LDA.W r_hardMode                     ;00B5D1|ADF607  |0007F6;
                       BNE CODE_00B5DA                      ;00B5D4|D004    |00B5DA;
                       LDA.B #$08                           ;00B5D6|A908    |      ;
 
                       BNE CODE_00B5E0                      ;00B5D8|D006    |00B5E0;
 
          CODE_00B5DA: LDA.B #$0C                           ;00B5DA|A90C    |      ;
                       BNE CODE_00B5E0                      ;00B5DC|D002    |00B5E0;
 
          CODE_00B5DE: LDA.B #$10                           ;00B5DE|A910    |      ;
 
          CODE_00B5E0: STA.B r_tempCurrRoomIdx              ;00B5E0|850E    |00000E;
                       LDA.B $CB                            ;00B5E2|A5CB    |0000CB;
                       SEC                                  ;00B5E4|38      |      ;
                       SBC.B r_tempCurrRoomIdx              ;00B5E5|E50E    |00000E;
                       STA.B $CB                            ;00B5E7|85CB    |0000CB;
                       BCS CODE_00B5ED                      ;00B5E9|B002    |00B5ED;
                       DEC.B r_floodHight                   ;00B5EB|C6CA    |0000CA;
 
          CODE_00B5ED: LDA.B r_floodHight                   ;00B5ED|A5CA    |0000CA;
                       STA.B r_scannlineTarget              ;00B5EF|8542    |000042;
                       RTS                                  ;00B5F1|60      |      ;
 
 
          CODE_00B5F2: DEC.W $0787                          ;00B5F2|CE8707  |000787;
                       BEQ CODE_00B5F8                      ;00B5F5|F001    |00B5F8;
                       RTS                                  ;00B5F7|60      |      ;
 
 
          CODE_00B5F8: LDA.B r_sceneDrawQueue               ;00B5F8|A51D    |00001D;
                       PHA                                  ;00B5FA|48      |      ;
                       JSR.W CODE_00852C                    ;00B5FB|202C85  |00852C;
                       PLA                                  ;00B5FE|68      |      ;
                       TAX                                  ;00B5FF|AA      |      ;
                       LDA.W r_PW_iconGeneral               ;00B600|AD8607  |000786;
                       ASL A                                ;00B603|0A      |      ;
                       CLC                                  ;00B604|18      |      ;
                       ADC.W r_PW_iconGeneral               ;00B605|6D8607  |000786;
 
          CODE_00B608: TAY                                  ;00B608|A8      |      ;
                       LDA.W DATA8_00B62F,Y                 ;00B609|B92FB6  |00B62F;
                       CMP.B #$FF                           ;00B60C|C9FF    |      ;
                       BEQ CODE_00B628                      ;00B60E|F018    |00B628;
                       STA.W $0308,X                        ;00B610|9D0803  |000308;
                       LDA.W DATA8_00B630,Y                 ;00B613|B930B6  |00B630;
 
                       STA.W $0309,X                        ;00B616|9D0903  |000309;
                       LDA.W DATA8_00B631,Y                 ;00B619|B931B6  |00B631;
                       STA.W $030A,X                        ;00B61C|9D0A03  |00030A;
                       INC.W r_PW_iconGeneral               ;00B61F|EE8607  |000786;
                       LDA.B #$08                           ;00B622|A908    |      ;
                       STA.W $0787                          ;00B624|8D8707  |000787;
                       RTS                                  ;00B627|60      |      ;
 
 
          CODE_00B628: LDA.B #$00                           ;00B628|A900    |      ;
                       STA.W r_PW_iconGeneral               ;00B62A|8D8607  |000786;
                       BEQ CODE_00B608                      ;00B62D|F0D9    |00B608;
 
         DATA8_00B62F: db $01                               ;00B62F|        |      ;
 
         DATA8_00B630: db $11                               ;00B630|        |      ;
 
         DATA8_00B631: db $20,$01,$31,$11,$01,$11,$31,$01   ;00B631|        |      ;
                       db $20,$11,$FF                       ;00B639|        |      ;
 
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
                       STA.B r_VRAM_QueueDest               ;00B655|8561    |000061;
                       LDA.W DATA8_00B6E2,Y                 ;00B657|B9E2B6  |00B6E2;
                       STA.B r_roomSectionChrBanksDataOffset;00B65A|850F    |00000F;
 
                       LDA.W DATA8_00B6E3,Y                 ;00B65C|B9E3B6  |00B6E3;
                       STA.B r_tempCurrRoomIdx              ;00B65F|850E    |00000E;
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
                       STA.B r_pointerQueue                 ;00B681|8508    |000008;
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
 
          CODE_00B6A9: LDA.B (r_pointerQueue),Y             ;00B6A9|B108    |000008;
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
                       LDX.B r_sceneDrawQueue               ;00B6BE|A61D    |00001D;
                       LDA.B r_tempCurrRoomIdx              ;00B6C0|A50E    |00000E;
                       db $20                               ;00B6C2|        |      ;
                       dw CODE_0FED16                       ;00B6C3|        |0FED16;
                       LDA.B r_roomSectionChrBanksDataOffset;00B6C5|A50F    |00000F;
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
 
         DATA8_00B6E4: db $00,$2A,$80,$2B,$E8,$03           ;00B6E4|        |      ;
 
         DATA8_00B6EA: db $F6                               ;00B6EA|        |      ;
 
         DATA8_00B6EB: db $B6,$06,$B7,$06,$B7,$06,$B7,$06   ;00B6EB|        |      ;
                       db $B7,$06,$B7,$8B,$8B,$8B,$8B,$9B   ;00B6F3|        |      ;
                       db $3D,$9B,$3D,$3D,$9B,$3D,$9B,$3D   ;00B6FB|        |      ;
                       db $3D,$3D,$3D,$3D,$3D,$3D,$3D,$3D   ;00B703|        |      ;
                       db $3D,$3D,$3D,$3D,$3D,$3D,$3D,$3D   ;00B70B|        |      ;
 
                       db $3D,$3D,$3D                       ;00B713|        |      ;
 
         DATA8_00B716: db $48                               ;00B716|        |      ;
                       LDA.B #$00                           ;00B717|A900    |      ;
                       STA.W r_entity_ObjectIdxes,X         ;00B719|9D4E05  |00054E;
                       PLA                                  ;00B71C|68      |      ;
 
          CODE_00B71D: STA.W r_animTimerBG_CHR              ;00B71D|8D8107  |000781;
                       LDY.B #$00                           ;00B720|A000    |      ;
                       STY.W r_FogParallelPos               ;00B722|8C8207  |000782;
                       INY                                  ;00B725|C8      |      ;
                       STY.W r_soundModeSongSelected        ;00B726|8C8007  |000780;
                       RTS                                  ;00B729|60      |      ;
 
 
          CODE_00B72A: LDA.W $0783                          ;00B72A|AD8307  |000783;
                       STA.B r_Joy1Pe                       ;00B72D|8528    |000028;
 
                       STA.B r_curJoyPe1                    ;00B72F|8526    |000026;
 
                       DEC.W r_soundModeSongSelected        ;00B731|CE8007  |000780;
 
                       BEQ CODE_00B737                      ;00B734|F001    |00B737;
                       RTS                                  ;00B736|60      |      ;
 
 
          CODE_00B737: LDA.W r_animTimerBG_CHR              ;00B737|AD8107  |000781;
                       ASL A                                ;00B73A|0A      |      ;
                       TAY                                  ;00B73B|A8      |      ;
                       LDA.W DATA16_00B771,Y                ;00B73C|B971B7  |00B771;
                       STA.B r_pointerQueue                 ;00B73F|8508    |000008;
                       LDA.W DATA8_00B772,Y                 ;00B741|B972B7  |00B772;
                       STA.B $09                            ;00B744|8509    |000009;
                       LDA.W r_FogParallelPos               ;00B746|AD8207  |000782;
                       ASL A                                ;00B749|0A      |      ;
                       TAY                                  ;00B74A|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00B74B|B108    |000008;
                       STA.W $0783                          ;00B74D|8D8307  |000783;
                       INY                                  ;00B750|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00B751|B108    |000008;
                       STA.W r_soundModeSongSelected        ;00B753|8D8007  |000780;
                       INC.W r_FogParallelPos               ;00B756|EE8207  |000782;
                       RTS                                  ;00B759|60      |      ;
 
 
         PTR16_00B75A: dw DATA16_00B75E                     ;00B75A|        |00B75E;
                       dw DATA16_00B76E                     ;00B75C|        |00B76E;
 
        DATA16_00B75E: dw $8020,$4001,$02A0,$B090           ;00B75E|        |      ;
                       dw $BE03,$0490,$70D0,$FF05           ;00B766|        |      ;
 
        DATA16_00B76E: dw $70E4,$8107                       ;00B76E|        |      ;
 
         DATA8_00B772: db $B7,$83,$B7,$87,$B7,$8B,$B7,$93   ;00B772|        |      ;
                       db $B7,$9B,$B7,$81,$B7,$87,$B7,$01   ;00B77A|        |      ;
                       db $FF,$01,$01,$01,$FF,$81,$04,$01   ;00B782|        |      ;
                       db $FF,$81,$08,$01,$10,$81,$04,$01   ;00B78A|        |      ;
                       db $FF,$81,$08,$01,$20,$81,$04,$01   ;00B792|        |      ;
                       db $FF,$00,$FF                       ;00B79A|        |      ;
 
          CODE_00B79D: LDY.B #$02                           ;00B79D|A002    |      ;
                       LDA.W PTR16_00B75A,Y                 ;00B79F|B95AB7  |00B75A;
                       STA.B r_pointerQueue                 ;00B7A2|8508    |000008;
                       LDA.W PTR16_00B75B,Y                 ;00B7A4|B95BB7  |00B75B;
                       STA.B $09                            ;00B7A7|8509    |000009;
                       LDY.B #$00                           ;00B7A9|A000    |      ;
 
                       LDX.B #$01                           ;00B7AB|A201    |      ;
                       JMP.W CODE_00B7C9                    ;00B7AD|4CC9B7  |00B7C9;
 
 
          CODE_00B7B0: LDY.B #$00                           ;00B7B0|A000    |      ;
                       LDA.W PTR16_00B75A,Y                 ;00B7B2|B95AB7  |00B75A;
                       STA.B r_pointerQueue                 ;00B7B5|8508    |000008;
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
                       STA.W r_entity_OamSpecGroupDoubled,X ;00B7CB|9D8C04  |00048C;
                       LDA.B #$00                           ;00B7CE|A900    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00B7D0|9D0004  |000400;
                       LDA.B #$00                           ;00B7D3|A900    |      ;
                       STA.W r_entity_PaletteOverride,X     ;00B7D5|9D5404  |000454;
                       STA.W r_entity_Effect,X              ;00B7D8|9D7004  |000470;
                       LDA.B (r_pointerQueue),Y             ;00B7DB|B108    |000008;
                       STA.W r_entity_XPos,X                ;00B7DD|9D3804  |000438;
                       INY                                  ;00B7E0|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00B7E1|B108    |000008;
 
                       STA.W r_entity_YPos,X                ;00B7E3|9D1C04  |00041C;
                       INY                                  ;00B7E6|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00B7E7|B108    |000008;
                       STA.W r_entity_ObjectIdxes,X         ;00B7E9|9D4E05  |00054E;
                       INY                                  ;00B7EC|C8      |      ;
                       RTS                                  ;00B7ED|60      |      ;
 
 
          CODE_00B7EE: LDA.W r_Player_StateDoubled          ;00B7EE|AD6505  |000565;
                       CMP.B #$02                           ;00B7F1|C902    |      ;
                       BEQ CODE_00B7FA                      ;00B7F3|F005    |00B7FA;
                       CMP.B #$04                           ;00B7F5|C904    |      ;
                       BEQ CODE_00B7FA                      ;00B7F7|F001    |00B7FA;
                       RTS                                  ;00B7F9|60      |      ;
 
 
          CODE_00B7FA: LDX.B #$01                           ;00B7FA|A201    |      ;
 
          CODE_00B7FC: LDA.W r_entity_ObjectIdxes,X         ;00B7FC|BD4E05  |00054E;
                       BNE CODE_00B807                      ;00B7FF|D006    |00B807;
 
          CODE_00B801: INX                                  ;00B801|E8      |      ;
                       CPX.B #$06                           ;00B802|E006    |      ;
                       BCC CODE_00B7FC                      ;00B804|90F6    |00B7FC;
 
                       RTS                                  ;00B806|60      |      ;
 
 
          CODE_00B807: LDA.W r_entity_XPos,X                ;00B807|BD3804  |000438;
                       SEC                                  ;00B80A|38      |      ;
                       SBC.W r_entity_XPos                  ;00B80B|ED3804  |000438;
                       BCS CODE_00B815                      ;00B80E|B005    |00B815;
                       EOR.B #$FF                           ;00B810|49FF    |      ;
                       CLC                                  ;00B812|18      |      ;
                       ADC.B #$01                           ;00B813|6901    |      ;
 
          CODE_00B815: CMP.B #$08                           ;00B815|C908    |      ;
                       BCS CODE_00B801                      ;00B817|B0E8    |00B801;
                       LDA.W r_entity_YPos,X                ;00B819|BD1C04  |00041C;
 
                       SEC                                  ;00B81C|38      |      ;
                       SBC.W r_entity_YPos                  ;00B81D|ED1C04  |00041C;
                       BCS CODE_00B827                      ;00B820|B005    |00B827;
                       EOR.B #$FF                           ;00B822|49FF    |      ;
                       CLC                                  ;00B824|18      |      ;
                       ADC.B #$01                           ;00B825|6901    |      ;
 
          CODE_00B827: CMP.B #$08                           ;00B827|C908    |      ;
                       BCS CODE_00B801                      ;00B829|B0D6    |00B801;
                       RTS                                  ;00B82B|60      |      ;
 
 
          CODE_00B82C: LDA.B r_gameStateLoopCounter         ;00B82C|A51A    |00001A;
                       AND.B #$0F                           ;00B82E|290F    |      ;
 
                       BNE CODE_00B845                      ;00B830|D013    |00B845;
                       LDA.B #$3D                           ;00B832|A93D    |      ;
                       db $20                               ;00B834|        |      ;
                       dw initFreezWaterEffect_01           ;00B835|        |0FE25F;
                       JMP.W CODE_00B845                    ;00B837|4C45B8  |00B845;
 
 
          CODE_00B83A: LDA.B r_gameStateLoopCounter         ;00B83A|A51A    |00001A;
 
                       AND.B #$0F                           ;00B83C|290F    |      ;
                       BNE CODE_00B845                      ;00B83E|D005    |00B845;
                       LDA.B #$3B                           ;00B840|A93B    |      ;
                       db $20                               ;00B842|        |      ;
                       dw initFreezWaterEffect_01           ;00B843|        |0FE25F;
 
          CODE_00B845: LDA.B r_gameStateLoopCounter         ;00B845|A51A    |00001A;
                       AND.B #$02                           ;00B847|2902    |      ;
                       TAY                                  ;00B849|A8      |      ;
                       LDA.W DATA8_00B855,Y                 ;00B84A|B955B8  |00B855;
                       STA.B r_sceneScrollOffsetHi          ;00B84D|8557    |000057;
                       LDA.W DATA8_00B856,Y                 ;00B84F|B956B8  |00B856;
                       STA.B r_sceneScrollOffsetLo          ;00B852|8556    |000056;
                       RTS                                  ;00B854|60      |      ;
 
 
         DATA8_00B855: db $02                               ;00B855|        |      ;
 
         DATA8_00B856: db $01,$01,$FF                       ;00B856|        |      ;
 
         DATA8_00B859: db $A2,$01                           ;00B859|        |      ;
 
         DATA8_00B85B: db $BD,$D8,$05,$D0,$0B,$A9,$00,$9D   ;00B85B|        |      ;
                       db $00                               ;00B863|        |      ;
 
         DATA8_00B864: db $04                               ;00B864|        |      ;
 
          CODE_00B865: INX                                  ;00B865|E8      |      ;
                       CPX.B #$06                           ;00B866|E006    |      ;
                       BCC DATA8_00B85B                     ;00B868|90F1    |00B85B;
                       RTS                                  ;00B86A|60      |      ;
 
                       DEC.W r_5d8,X                        ;00B86B|DED805  |0005D8;
                       LDA.B #$40                           ;00B86E|A940    |      ;
                       CLC                                  ;00B870|18      |      ;
 
          CODE_00B871: ADC.W r_entity_YposSubSpeed,X        ;00B871|7D3705  |000537;
                       STA.W r_entity_YposSubSpeed,X        ;00B874|9D3705  |000537;
                       BCC CODE_00B87C                      ;00B877|9003    |00B87C;
                       INC.W r_entity_YposSpeed,X           ;00B879|FE2005  |000520;
 
          CODE_00B87C: LDA.W r_entity_FractionalX,X         ;00B87C|BDC404  |0004C4;
                       CLC                                  ;00B87F|18      |      ;
                       ADC.W r_entity_XposSubSpeed,X        ;00B880|7D0905  |000509;
 
                       STA.W r_entity_FractionalX,X         ;00B883|9DC404  |0004C4;
                       LDA.W r_entity_XPos,X                ;00B886|BD3804  |000438;
                       ADC.W r_entity_XposSpeed,X           ;00B889|7DF204  |0004F2;
                       STA.W r_entity_XPos,X                ;00B88C|9D3804  |000438;
                       LDA.W r_entity_FractionalY,X         ;00B88F|BDDB04  |0004DB;
                       CLC                                  ;00B892|18      |      ;
                       ADC.W r_entity_YposSubSpeed,X        ;00B893|7D3705  |000537;
                       STA.W r_entity_FractionalY,X         ;00B896|9DDB04  |0004DB;
                       LDA.W r_entity_YPos,X                ;00B899|BD1C04  |00041C;
                       ADC.W r_entity_YposSpeed,X           ;00B89C|7D2005  |000520;
                       STA.W r_entity_YPos,X                ;00B89F|9D1C04  |00041C;
                       JMP.W CODE_00B865                    ;00B8A2|4C65B8  |00B865;
 
 
          CODE_00B8A5: LDX.B #$01                           ;00B8A5|A201    |      ;
                       LDY.B #$00                           ;00B8A7|A000    |      ;
 
          CODE_00B8A9: LDA.B #$20                           ;00B8A9|A920    |      ;
                       STA.W r_5d8,X                        ;00B8AB|9DD805  |0005D8;
                       LDA.B #$0E                           ;00B8AE|A90E    |      ;
                       STA.W r_entity_OamSpecGroupDoubled,X ;00B8B0|9D8C04  |00048C;
                       LDA.B #$18                           ;00B8B3|A918    |      ;
                       STA.W r_OamSpecIdxDoubled,X          ;00B8B5|9D0004  |000400;
 
                       LDA.B #$00                           ;00B8B8|A900    |      ;
                       STA.W r_entity_PaletteOverride,X     ;00B8BA|9D5404  |000454;
                       STA.W r_entity_Effect,X              ;00B8BD|9D7004  |000470;
                       LDA.W DATA8_00B8F0,Y                 ;00B8C0|B9F0B8  |00B8F0;
                       STA.W r_entity_XposSpeed,X           ;00B8C3|9DF204  |0004F2;
                       INY                                  ;00B8C6|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8C7|B9F0B8  |00B8F0;
                       STA.W r_entity_XposSubSpeed,X        ;00B8CA|9D0905  |000509;
                       INY                                  ;00B8CD|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8CE|B9F0B8  |00B8F0;
 
                       STA.W r_entity_YposSpeed,X           ;00B8D1|9D2005  |000520;
                       INY                                  ;00B8D4|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8D5|B9F0B8  |00B8F0;
                       STA.W r_entity_YposSubSpeed,X        ;00B8D8|9D3705  |000537;
                       INY                                  ;00B8DB|C8      |      ;
 
                       LDA.W DATA8_00B8F0,Y                 ;00B8DC|B9F0B8  |00B8F0;
                       STA.W r_entity_XPos,X                ;00B8DF|9D3804  |000438;
                       INY                                  ;00B8E2|C8      |      ;
                       LDA.W DATA8_00B8F0,Y                 ;00B8E3|B9F0B8  |00B8F0;
                       STA.W r_entity_YPos,X                ;00B8E6|9D1C04  |00041C;
                       INY                                  ;00B8E9|C8      |      ;
                       INX                                  ;00B8EA|E8      |      ;
                       CPX.B #$06                           ;00B8EB|E006    |      ;
                       BCC CODE_00B8A9                      ;00B8ED|90BA    |00B8A9;
                       RTS                                  ;00B8EF|60      |      ;
 
 
         DATA8_00B8F0: db $FF,$80,$00,$C0,$80,$38,$01,$C0   ;00B8F0|        |      ;
                       db $01,$40,$78,$3C,$FE,$00,$01,$C0   ;00B8F8|        |      ;
                       db $90,$34,$02,$40,$01,$80,$74,$40   ;00B900|        |      ;
                       db $00,$C0,$01,$40,$7C,$3C           ;00B908|        |      ;
 
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
                       STA.B r_VRAM_QueueDest               ;00B93B|8561    |000061;
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
                       STA.B r_pointerQueue                 ;00B955|8508    |000008;
                       LDA.W DATA8_00BA2B                   ;00B957|AD2BBA  |00BA2B;
                       STA.B $09                            ;00B95A|8509    |000009;
                       JSR.W CODE_00B977                    ;00B95C|2077B9  |00B977;
                       LDA.B $02                            ;00B95F|A502    |000002;
                       STA.B $01                            ;00B961|8501    |000001;
                       LDA.W DATA8_00BA2C                   ;00B963|AD2CBA  |00BA2C;
                       STA.B r_pointerQueue                 ;00B966|8508    |000008;
                       LDA.W DATA8_00BA2D                   ;00B968|AD2DBA  |00BA2D;
                       STA.B $09                            ;00B96B|8509    |000009;
                       JSR.W CODE_00B977                    ;00B96D|2077B9  |00B977;
                       db $4C                               ;00B970|        |      ;
 
                       dw endVRAM_queue                     ;00B971|        |0FE8DE;
 
          CODE_00B973: LDA.B #$02                           ;00B973|A902    |      ;
                       BNE CODE_00B980                      ;00B975|D009    |00B980;
 
          CODE_00B977: LDY.W r_EffectSpeedSupGeneral        ;00B977|AC8507  |000785;
                       BEQ CODE_00B973                      ;00B97A|F0F7    |00B973;
                       INY                                  ;00B97C|C8      |      ;
                       TYA                                  ;00B97D|98      |      ;
                       AND.B #$01                           ;00B97E|2901    |      ;
 
          CODE_00B980: ASL A                                ;00B980|0A      |      ;
                       TAY                                  ;00B981|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00B982|B108    |000008;
 
                       AND.B $01                            ;00B984|2501    |000001;
                       INY                                  ;00B986|C8      |      ;
                       ORA.B (r_pointerQueue),Y             ;00B987|1108    |000008;
                       STA.W r_VramQueue,X                  ;00B989|9D0003  |000300;
                       INX                                  ;00B98C|E8      |      ;
                       STX.B r_sceneDrawQueue               ;00B98D|861D    |00001D;
                       RTS                                  ;00B98F|60      |      ;
 
 
          CODE_00B990: LDA.W r_EffectSpeedSupGeneral        ;00B990|AD8507  |000785;
                       ASL A                                ;00B993|0A      |      ;
                       TAY                                  ;00B994|A8      |      ;
                       LDA.W DATA8_00B9FA,Y                 ;00B995|B9FAB9  |00B9FA;
                       STA.B $62                            ;00B998|8562    |000062;
                       LDA.W DATA8_00B9FB,Y                 ;00B99A|B9FBB9  |00B9FB;
                       STA.B r_VRAM_QueueDest               ;00B99D|8561    |000061;
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
                       dw endVRAM_queue                     ;00B9CA|        |0FE8DE;
                       LDA.B #$20                           ;00B9CC|A920    |      ;
                       CLC                                  ;00B9CE|18      |      ;
                       ADC.B r_VRAM_QueueDest               ;00B9CF|6561    |000061;
                       STA.B r_VRAM_QueueDest               ;00B9D1|8561    |000061;
                       BCC DATA8_00B9D7                     ;00B9D3|9002    |00B9D7;
                       INC.B $62                            ;00B9D5|E662    |000062;
 
         DATA8_00B9D7: db $20                               ;00B9D7|        |      ;
                       dw CODE_0FE8B5                       ;00B9D8|        |0FE8B5;
                       JMP.W CODE_00B9B5                    ;00B9DA|4CB5B9  |00B9B5;
 
 
         DATA8_00B9DD: db $4C                               ;00B9DD|        |      ;
 
                       dw endVRAM_queue                     ;00B9DE|        |0FE8DE;
 
         DATA8_00B9E0: db $55,$79,$78,$55,$5A,$5B,$5B,$78   ;00B9E0|        |      ;
                       db $4C,$5C,$6C,$7C,$4D,$5D,$6D,$7D   ;00B9E8|        |      ;
                       db $FF,$55,$79,$78,$55,$5A,$5B,$5B   ;00B9F0|        |      ;
                       db $78,$FF                           ;00B9F8|        |      ;
 
         DATA8_00B9FA: db $20                               ;00B9FA|        |      ;
 
         DATA8_00B9FB: db $CE                               ;00B9FB|        |      ;
 
         DATA8_00B9FC: db $20,$CE,$21,$0E,$21,$4E,$21,$8E   ;00B9FC|        |      ;
 
                       db $21,$CE,$22,$0E,$22,$4E,$22,$8E   ;00BA04|        |      ;
 
                       db $22,$CE,$23,$0E,$23,$4E           ;00BA0C|        |      ;
 
         DATA8_00BA12: db $23                               ;00BA12|        |      ;
 
         DATA8_00BA13: db $CB,$23,$D3,$23,$D3,$23,$DB,$23   ;00BA13|        |      ;
                       db $DB,$23,$E3,$23,$E3,$23,$EB,$23   ;00BA1B|        |      ;
                       db $EB,$23,$F3,$23,$F3,$FF,$FF       ;00BA23|        |      ;
 
         DATA8_00BA2A: db $2E                               ;00BA2A|        |      ;
 
         DATA8_00BA2B: db $BA                               ;00BA2B|        |      ;
 
         DATA8_00BA2C: db $34                               ;00BA2C|        |      ;
 
         DATA8_00BA2D: db $BA,$F3,$04,$33,$44,$33,$40,$FC   ;00BA2D|        |      ;
                       db $01,$CC,$11,$CC,$10               ;00BA35|        |      ;
 
         DATA8_00BA3A: db $A0                               ;00BA3A|        |      ;
 
         DATA8_00BA3B: db $A0,$2A,$8A,$BB,$E0,$BA,$EA,$0A   ;00BA3B|        |      ;
                       db $0A,$00,$00                       ;00BA43|        |      ;
 
          CODE_00BA46: LDA.B r_menuSelectIdx                ;00BA46|A56B    |00006B;
 
                       db $20                               ;00BA48|        |      ;
                       dw jumpFromStackYXpreserved          ;00BA49|        |0FE86D;
                       dw CODE_00BA51                       ;00BA4B|        |00BA51;
                       dw CODE_00BA59                       ;00BA4D|        |00BA59;
                       dw DATA8_00BA7F                      ;00BA4F|        |00BA7F;
 
          CODE_00BA51: LDA.B #$00                           ;00BA51|A900    |      ;
                       STA.W r_PW_dumpGeneral               ;00BA53|8D8807  |000788;
                       INC.B r_menuSelectIdx                ;00BA56|E66B    |00006B;
                       RTS                                  ;00BA58|60      |      ;
 
 
          CODE_00BA59: LDA.B r_gameStateLoopCounter         ;00BA59|A51A    |00001A;
                       AND.B #$03                           ;00BA5B|2903    |      ;
                       BEQ CODE_00BA60                      ;00BA5D|F001    |00BA60;
                       RTS                                  ;00BA5F|60      |      ;
 
 
          CODE_00BA60: LDY.W r_PW_dumpGeneral               ;00BA60|AC8807  |000788;
                       LDA.W DATA8_00BA7B,Y                 ;00BA63|B97BBA  |00BA7B;
                       db $20                               ;00BA66|        |      ;
                       dw screenLoadRoutine                 ;00BA67|        |0FECE9;
                       LDA.B #$04                           ;00BA69|A904    |      ;
                       db $20                               ;00BA6B|        |      ;
                       dw screenLoadRoutine                 ;00BA6C|        |0FECE9;
 
                       INC.W r_PW_dumpGeneral               ;00BA6E|EE8807  |000788;
                       LDA.W r_PW_dumpGeneral               ;00BA71|AD8807  |000788;
                       CMP.B #$04                           ;00BA74|C904    |      ;
                       BNE CODE_00BA7A                      ;00BA76|D002    |00BA7A;
                       INC.B r_menuSelectIdx                ;00BA78|E66B    |00006B;
 
          CODE_00BA7A: RTS                                  ;00BA7A|60      |      ;
 
 
         DATA8_00BA7B: db $1C,$1B,$1A,$19                   ;00BA7B|        |      ;
 
         DATA8_00BA7F: db $20,$95,$BA                       ;00BA7F|        |      ;
                       LDA.B r_roomEffect                   ;00BA82|A57D    |00007D;
                       AND.B #$0F                           ;00BA84|290F    |      ;
                       BEQ CODE_00BA8C                      ;00BA86|F004    |00BA8C;
                       LDA.B #$24                           ;00BA88|A924    |      ;
                       BNE CODE_00BA8E                      ;00BA8A|D002    |00BA8E;
 
          CODE_00BA8C: LDA.B #$13                           ;00BA8C|A913    |      ;
 
          CODE_00BA8E: STA.B r_IRQFuncIdx                   ;00BA8E|853F    |00003F;
                       LDA.B #$03                           ;00BA90|A903    |      ;
                       STA.B r_gameTransition               ;00BA92|852A    |00002A;
                       RTS                                  ;00BA94|60      |      ;
 
                       JSR.W freezWaterRoutine              ;00BA95|20DABD  |00BDDA;
                       LDY.B #$00                           ;00BA98|A000    |      ;
                       LDA.B (r_pointerQueue),Y             ;00BA9A|B108    |000008;
                       ASL A                                ;00BA9C|0A      |      ;
                       SEC                                  ;00BA9D|38      |      ;
                       SBC.B #$02                           ;00BA9E|E902    |      ;
                       STA.B r_tempCurrGroup                ;00BAA0|850C    |00000C;
                       LDY.B #$01                           ;00BAA2|A001    |      ;
                       LDA.B (r_pointerQueue),Y             ;00BAA4|B108    |000008;
                       STA.B r_temp_Xpos                    ;00BAA6|850A    |00000A;
                       INY                                  ;00BAA8|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00BAA9|B108    |000008;
                       STA.B $0B                            ;00BAAB|850B    |00000B;
                       JSR.W CODE_00BAC2                    ;00BAAD|20C2BA  |00BAC2;
                       LDA.B r_tempCurrGroup                ;00BAB0|A50C    |00000C;
                       CLC                                  ;00BAB2|18      |      ;
                       ADC.B #$02                           ;00BAB3|6902    |      ;
                       STA.B r_tempCurrGroup                ;00BAB5|850C    |00000C;
                       LDY.B #$03                           ;00BAB7|A003    |      ;
                       LDA.B (r_pointerQueue),Y             ;00BAB9|B108    |000008;
                       STA.B r_temp_Xpos                    ;00BABB|850A    |00000A;
                       INY                                  ;00BABD|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00BABE|B108    |000008;
                       STA.B $0B                            ;00BAC0|850B    |00000B;
 
          CODE_00BAC2: LDY.B $59                            ;00BAC2|A459    |000059;
                       STY.B r_roomSectionChrBanksDataOffset;00BAC4|840F    |00000F;
                       LDA.B #$0C                           ;00BAC6|A90C    |      ;
                       STA.B $00                            ;00BAC8|8500    |000000;
 
          CODE_00BACA: LDA.B (r_temp_Xpos),Y                ;00BACA|B10A    |00000A;
                       CMP.B #$FF                           ;00BACC|C9FF    |      ;
                       BEQ CODE_00BAE5                      ;00BACE|F015    |00BAE5;
 
                       CMP.B #$AA                           ;00BAD0|C9AA    |      ;
 
                       BEQ CODE_00BAFA                      ;00BAD2|F026    |00BAFA;
                       CMP.B #$0A                           ;00BAD4|C90A    |      ;
                       BEQ CODE_00BAF0                      ;00BAD6|F018    |00BAF0;
                       CMP.B #$A5                           ;00BAD8|C9A5    |      ;
                       BEQ CODE_00BAE6                      ;00BADA|F00A    |00BAE6;
 
          CODE_00BADC: LDY.B r_roomSectionChrBanksDataOffset;00BADC|A40F    |00000F;
                       INY                                  ;00BADE|C8      |      ;
                       STY.B r_roomSectionChrBanksDataOffset;00BADF|840F    |00000F;
                       DEC.B $00                            ;00BAE1|C600    |000000;
                       BNE CODE_00BACA                      ;00BAE3|D0E5    |00BACA;
 
          CODE_00BAE5: RTS                                  ;00BAE5|60      |      ;
 
 
          CODE_00BAE6: JSR.W CODE_00BB07                    ;00BAE6|2007BB  |00BB07;
                       LDA.B #$00                           ;00BAE9|A900    |      ;
                       STA.W $06E1,Y                        ;00BAEB|99E106  |0006E1;
                       BEQ CODE_00BADC                      ;00BAEE|F0EC    |00BADC;
 
          CODE_00BAF0: JSR.W CODE_00BB07                    ;00BAF0|2007BB  |00BB07;
                       LDA.B #$00                           ;00BAF3|A900    |      ;
                       STA.W r_collisionMap,Y               ;00BAF5|99E006  |0006E0;
                       BEQ CODE_00BADC                      ;00BAF8|F0E2    |00BADC;
 
          CODE_00BAFA: JSR.W CODE_00BB07                    ;00BAFA|2007BB  |00BB07;
                       LDA.B #$00                           ;00BAFD|A900    |      ;
                       STA.W r_collisionMap,Y               ;00BAFF|99E006  |0006E0;
                       STA.W $06E1,Y                        ;00BB02|99E106  |0006E1;
                       BEQ CODE_00BADC                      ;00BB05|F0D5    |00BADC;
 
          CODE_00BB07: TYA                                  ;00BB07|98      |      ;
 
          CODE_00BB08: CMP.B #$0C                           ;00BB08|C90C    |      ;
                       BCC CODE_00BB11                      ;00BB0A|9005    |00BB11;
                       SBC.B #$0C                           ;00BB0C|E90C    |      ;
                       JMP.W CODE_00BB08                    ;00BB0E|4C08BB  |00BB08;
 
 
          CODE_00BB11: TAY                                  ;00BB11|A8      |      ;
                       LDA.W OAM_attribTableFF,Y            ;00BB12|B94CFD  |0FFD4C;
                       CLC                                  ;00BB15|18      |      ;
                       ADC.B r_tempCurrGroup                ;00BB16|650C    |00000C;
                       TAY                                  ;00BB18|A8      |      ;
                       RTS                                  ;00BB19|60      |      ;
 
 
 freezWaterRoutine_00: LDA.B r_menuSelectIdx                ;00BB1A|A56B    |00006B;
                       db $20                               ;00BB1C|        |      ;
                       dw jumpFromStackYXpreserved          ;00BB1D|        |0FE86D;
 
      freezWaterState: dw freezWaterState_00                ;00BB1F|        |00BB27;
                       dw freezWaterState_01                ;00BB21|        |00BB6C;
 
                       dw freezWaterState_02                ;00BB23|        |00BCE8;
                       dw freezWaterState_03                ;00BB25|        |00BCF5;
 
   freezWaterState_00: LDA.B #$35                           ;00BB27|A935    |      ;
                       db $20                               ;00BB29|        |      ;
                       dw initFreezWaterEffect_01           ;00BB2A|        |0FE25F;
                       LDA.W r_entity_XPos                  ;00BB2C|AD3804  |000438;
                       CLC                                  ;00BB2F|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;00BB30|6556    |000056;
                       STA.B $00                            ;00BB32|8500    |000000;
                       LDA.B #$00                           ;00BB34|A900    |      ;
                       ADC.B r_sceneScrollOffsetHi          ;00BB36|6557    |000057;
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
 
                       STA.W r_PW_iconGeneral               ;00BB4C|8D8607  |000786;
                       LDA.W r_entity_YPos                  ;00BB4F|AD1C04  |00041C;
                       LSR A                                ;00BB52|4A      |      ;
                       LSR A                                ;00BB53|4A      |      ;
                       LSR A                                ;00BB54|4A      |      ;
 
                       LSR A                                ;00BB55|4A      |      ;
                       LSR A                                ;00BB56|4A      |      ;
                       STA.W $0783                          ;00BB57|8D8307  |000783;
 
                       STA.W r_EffectSpeedSupGeneral        ;00BB5A|8D8507  |000785;
                       STA.W $0787                          ;00BB5D|8D8707  |000787;
                       LDA.B #$0C                           ;00BB60|A90C    |      ;
                       STA.W r_PW_dumpGeneral               ;00BB62|8D8807  |000788;
 
                       LDA.B #$01                           ;00BB65|A901    |      ;
                       STA.B r_IRQFuncIdx                   ;00BB67|853F    |00003F;
 
                       INC.B r_menuSelectIdx                ;00BB69|E66B    |00006B;
                       RTS                                  ;00BB6B|60      |      ;
 
 
   freezWaterState_01: LDA.B r_gameStateLoopCounter         ;00BB6C|A51A    |00001A;
                       AND.B #$01                           ;00BB6E|2901    |      ;
 
                       BEQ CODE_00BB79                      ;00BB70|F007    |00BB79;
 
                       DEC.W r_PW_dumpGeneral               ;00BB72|CE8807  |000788;
                       BNE CODE_00BB7A                      ;00BB75|D003    |00BB7A;
 
                       INC.B r_menuSelectIdx                ;00BB77|E66B    |00006B;
 
          CODE_00BB79: RTS                                  ;00BB79|60      |      ;
 
 
          CODE_00BB7A: JSR.W CODE_00BDE0                    ;00BB7A|20E0BD  |00BDE0;
                       LDX.B #$00                           ;00BB7D|A200    |      ;
                       JSR.W CODE_00BBDE                    ;00BB7F|20DEBB  |00BBDE;
                       LDY.W r_EffectSpeedGeneral           ;00BB82|AC8407  |000784;
                       DEY                                  ;00BB85|88      |      ;
                       TYA                                  ;00BB86|98      |      ;
                       LSR A                                ;00BB87|4A      |      ;
                       TAY                                  ;00BB88|A8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;00BB89|B10A    |00000A;
                       CMP.B #$0A                           ;00BB8B|C90A    |      ;
                       BEQ CODE_00BBAB                      ;00BB8D|F01C    |00BBAB;
                       CMP.B #$A5                           ;00BB8F|C9A5    |      ;
                       BEQ CODE_00BBAB                      ;00BB91|F018    |00BBAB;
                       CMP.B #$AA                           ;00BB93|C9AA    |      ;
                       BEQ CODE_00BBAB                      ;00BB95|F014    |00BBAB;
                       LDY.B #$00                           ;00BB97|A000    |      ;
                       LDA.W r_EffectSpeedSupGeneral        ;00BB99|AD8507  |000785;
                       SEC                                  ;00BB9C|38      |      ;
                       SBC.B (r_pointerQueue),Y             ;00BB9D|F108    |000008;
                       BNE CODE_00BBA6                      ;00BB9F|D005    |00BBA6;
                       INC.W r_EffectSpeedSupGeneral        ;00BBA1|EE8507  |000785;
                       BNE CODE_00BBAE                      ;00BBA4|D008    |00BBAE;
 
          CODE_00BBA6: DEC.W r_EffectSpeedSupGeneral        ;00BBA6|CE8507  |000785;
                       BNE CODE_00BBAE                      ;00BBA9|D003    |00BBAE;
 
          CODE_00BBAB: DEC.W r_EffectSpeedGeneral           ;00BBAB|CE8407  |000784;
 
          CODE_00BBAE: LDX.B #$02                           ;00BBAE|A202    |      ;
                       JSR.W CODE_00BBDE                    ;00BBB0|20DEBB  |00BBDE;
 
                       LDY.W r_PW_iconGeneral               ;00BBB3|AC8607  |000786;
                       INY                                  ;00BBB6|C8      |      ;
                       TYA                                  ;00BBB7|98      |      ;
                       LSR A                                ;00BBB8|4A      |      ;
                       TAY                                  ;00BBB9|A8      |      ;
 
                       LDA.B (r_temp_Xpos),Y                ;00BBBA|B10A    |00000A;
 
                       CMP.B #$0A                           ;00BBBC|C90A    |      ;
 
          CODE_00BBBE: BEQ CODE_00BBDA                      ;00BBBE|F01A    |00BBDA;
                       CMP.B #$A5                           ;00BBC0|C9A5    |      ;
                       BEQ CODE_00BBDA                      ;00BBC2|F016    |00BBDA;
                       CMP.B #$AA                           ;00BBC4|C9AA    |      ;
 
                       BEQ CODE_00BBDA                      ;00BBC6|F012    |00BBDA;
 
                       LDY.B #$00                           ;00BBC8|A000    |      ;
 
                       LDA.W $0787                          ;00BBCA|AD8707  |000787;
                       SEC                                  ;00BBCD|38      |      ;
                       SBC.B (r_pointerQueue),Y             ;00BBCE|F108    |000008;
                       BNE CODE_00BBD6                      ;00BBD0|D004    |00BBD6;
                       INC.W $0787                          ;00BBD2|EE8707  |000787;
                       RTS                                  ;00BBD5|60      |      ;
 
 
          CODE_00BBD6: DEC.W $0787                          ;00BBD6|CE8707  |000787;
                       RTS                                  ;00BBD9|60      |      ;
 
 
          CODE_00BBDA: INC.W r_PW_iconGeneral               ;00BBDA|EE8607  |000786;
                       RTS                                  ;00BBDD|60      |      ;
 
 
          CODE_00BBDE: STX.B r_roomSectionChrBanksDataOffset;00BBDE|860F    |00000F;
                       LDY.B #$00                           ;00BBE0|A000    |      ;
                       LDA.W r_EffectSpeedSupGeneral,X      ;00BBE2|BD8507  |000785;
                       SEC                                  ;00BBE5|38      |      ;
                       SBC.B (r_pointerQueue),Y             ;00BBE6|F108    |000008;
                       ASL A                                ;00BBE8|0A      |      ;
                       TAY                                  ;00BBE9|A8      |      ;
                       INY                                  ;00BBEA|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00BBEB|B108    |000008;
                       STA.B r_temp_Xpos                    ;00BBED|850A    |00000A;
                       INY                                  ;00BBEF|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00BBF0|B108    |000008;
                       STA.B $0B                            ;00BBF2|850B    |00000B;
                       LDA.W r_EffectSpeedGeneral,X         ;00BBF4|BD8407  |000784;
                       LSR A                                ;00BBF7|4A      |      ;
                       BCS CODE_00BC31                      ;00BBF8|B037    |00BC31;
                       TAY                                  ;00BBFA|A8      |      ;
                       LDA.B r_roomSectionChrBanksDataOffset;00BBFB|A50F    |00000F;
                       BEQ CODE_00BC18                      ;00BBFD|F019    |00BC18;
                       LDA.B (r_temp_Xpos),Y                ;00BBFF|B10A    |00000A;
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
 
 
          CODE_00BC18: LDA.B (r_temp_Xpos),Y                ;00BC18|B10A    |00000A;
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
                       LDA.B r_roomSectionChrBanksDataOffset;00BC32|A50F    |00000F;
                       BEQ CODE_00BC4F                      ;00BC34|F019    |00BC4F;
                       LDA.B (r_temp_Xpos),Y                ;00BC36|B10A    |00000A;
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
 
 
          CODE_00BC4F: LDA.B (r_temp_Xpos),Y                ;00BC4F|B10A    |00000A;
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
                       STA.B r_VRAM_QueueDest               ;00BC6C|8561    |000061;
                       LDA.W r_EffectSpeedSupGeneral,X      ;00BC6E|BD8507  |000785;
                       ASL A                                ;00BC71|0A      |      ;
                       ASL A                                ;00BC72|0A      |      ;
                       ASL A                                ;00BC73|0A      |      ;
                       CLC                                  ;00BC74|18      |      ;
                       ADC.B r_VRAM_QueueDest               ;00BC75|6561    |000061;
                       CLC                                  ;00BC77|18      |      ;
                       ADC.B #$C0                           ;00BC78|69C0    |      ;
                       STA.B r_VRAM_QueueDest               ;00BC7A|8561    |000061;
                       LDA.B r_075                          ;00BC7C|A575    |000075;
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
                       STX.B r_sceneDrawQueue               ;00BC9E|861D    |00001D;
                       db $20                               ;00BCA0|        |      ;
 
                       dw CODE_0FED12                       ;00BCA1|        |0FED12;
                       LDA.B #$02                           ;00BCA3|A902    |      ;
                       STA.B $01                            ;00BCA5|8501    |000001;
                       LDX.B r_roomSectionChrBanksDataOffset;00BCA7|A60F    |00000F;
                       LDA.W r_EffectSpeedSupGeneral,X      ;00BCA9|BD8507  |000785;
                       ASL A                                ;00BCAC|0A      |      ;
                       SEC                                  ;00BCAD|38      |      ;
                       SBC.B #$02                           ;00BCAE|E902    |      ;
                       STA.B $00                            ;00BCB0|8500    |000000;
                       LDA.B r_roomEffect                   ;00BCB2|A57D    |00007D;
                       AND.B #$0F                           ;00BCB4|290F    |      ;
                       BEQ CODE_00BCC0                      ;00BCB6|F008    |00BCC0;
                       LDA.W r_entity_YPos                  ;00BCB8|AD1C04  |00041C;
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
                       ORA.W freezWaterData,Y               ;00BCCE|1961FD  |0FFD61;
 
           findValueC: CMP.B #$0C                           ;00BCD1|C90C    |      ;
                       BCC updateCollusion                  ;00BCD3|9005    |00BCDA;
                       SBC.B #$0C                           ;00BCD5|E90C    |      ;
                       JMP.W findValueC                     ;00BCD7|4CD1BC  |00BCD1;
 
 
      updateCollusion: TAY                                  ;00BCDA|A8      |      ;
                       LDA.W OAM_attribTableFF,Y            ;00BCDB|B94CFD  |0FFD4C;
                       CLC                                  ;00BCDE|18      |      ;
                       ADC.B $00                            ;00BCDF|6500    |000000;
                       TAY                                  ;00BCE1|A8      |      ;
                       LDA.B #$88                           ;00BCE2|A988    |      ;
                       STA.W r_collisionMap,Y               ;00BCE4|99E006  |0006E0;
                       RTS                                  ;00BCE7|60      |      ;
 
 
   freezWaterState_02: LDA.B #$1C                           ;00BCE8|A91C    |      ;
                       db $20                               ;00BCEA|        |      ;
                       dw screenLoadRoutine                 ;00BCEB|        |0FECE9;
                       LDA.B #$04                           ;00BCED|A904    |      ;
                       db $20                               ;00BCEF|        |      ;
                       dw screenLoadRoutine                 ;00BCF0|        |0FECE9;
                       INC.B r_menuSelectIdx                ;00BCF2|E66B    |00006B;
                       RTS                                  ;00BCF4|60      |      ;
 
 
   freezWaterState_03: JSR.W freezWaterRoutine              ;00BCF5|20DABD  |00BDDA;
                       LDY.B #$00                           ;00BCF8|A000    |      ;
                       LDA.B (r_pointerQueue),Y             ;00BCFA|B108    |000008;
                       ASL A                                ;00BCFC|0A      |      ;
                       ASL A                                ;00BCFD|0A      |      ;
                       ASL A                                ;00BCFE|0A      |      ;
                       CLC                                  ;00BCFF|18      |      ;
                       ADC.B #$C0                           ;00BD00|69C0    |      ;
                       STA.B r_VRAM_QueueDest               ;00BD02|8561    |000061;
                       LDA.B r_sceneScrollOffsetLo          ;00BD04|A556    |000056;
                       STA.B r_tempCurrGroup                ;00BD06|850C    |00000C;
                       LDA.B r_sceneScrollOffsetHi          ;00BD08|A557    |000057;
                       LSR A                                ;00BD0A|4A      |      ;
                       ROR.B r_tempCurrGroup                ;00BD0B|660C    |00000C;
                       LSR A                                ;00BD0D|4A      |      ;
                       ROR.B r_tempCurrGroup                ;00BD0E|660C    |00000C;
                       LSR A                                ;00BD10|4A      |      ;
                       ROR.B r_tempCurrGroup                ;00BD11|660C    |00000C;
                       LSR A                                ;00BD13|4A      |      ;
                       ROR.B r_tempCurrGroup                ;00BD14|660C    |00000C;
                       LSR A                                ;00BD16|4A      |      ;
                       ROR.B r_tempCurrGroup                ;00BD17|660C    |00000C;
                       LDA.B r_tempCurrGroup                ;00BD19|A50C    |00000C;
                       SEC                                  ;00BD1B|38      |      ;
                       SBC.B #$02                           ;00BD1C|E902    |      ;
                       BPL CODE_00BD22                      ;00BD1E|1002    |00BD22;
                       LDA.B #$00                           ;00BD20|A900    |      ;
 
          CODE_00BD22: STA.B r_tempCurrGroup                ;00BD22|850C    |00000C;
                       LDA.B r_075                          ;00BD24|A575    |000075;
                       ASL A                                ;00BD26|0A      |      ;
                       ASL A                                ;00BD27|0A      |      ;
                       ASL A                                ;00BD28|0A      |      ;
                       AND.B #$08                           ;00BD29|2908    |      ;
                       STA.B $00                            ;00BD2B|8500    |000000;
                       LDA.B r_tempCurrGroup                ;00BD2D|A50C    |00000C;
                       AND.B #$07                           ;00BD2F|2907    |      ;
                       STA.B $02                            ;00BD31|8502    |000002;
                       LDA.B r_tempCurrGroup                ;00BD33|A50C    |00000C;
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
                       ADC.B r_VRAM_QueueDest               ;00BD48|6561    |000061;
                       STA.B r_VRAM_QueueDest               ;00BD4A|8561    |000061;
                       STA.B $05                            ;00BD4C|8505    |000005;
                       LDY.B #$01                           ;00BD4E|A001    |      ;
 
                       LDA.B (r_pointerQueue),Y             ;00BD50|B108    |000008;
                       STA.B r_temp_Xpos                    ;00BD52|850A    |00000A;
                       INY                                  ;00BD54|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00BD55|B108    |000008;
                       STA.B $0B                            ;00BD57|850B    |00000B;
                       JSR.W CODE_00BD86                    ;00BD59|2086BD  |00BD86;
                       LDA.B $04                            ;00BD5C|A504    |000004;
                       STA.B $62                            ;00BD5E|8562    |000062;
                       LDA.B $05                            ;00BD60|A505    |000005;
                       CLC                                  ;00BD62|18      |      ;
                       ADC.B #$08                           ;00BD63|6908    |      ;
                       STA.B r_VRAM_QueueDest               ;00BD65|8561    |000061;
                       LDY.B #$03                           ;00BD67|A003    |      ;
                       LDA.B (r_pointerQueue),Y             ;00BD69|B108    |000008;
                       STA.B r_temp_Xpos                    ;00BD6B|850A    |00000A;
                       INY                                  ;00BD6D|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;00BD6E|B108    |000008;
                       STA.B $0B                            ;00BD70|850B    |00000B;
                       JSR.W CODE_00BD86                    ;00BD72|2086BD  |00BD86;
                       LDA.W r_Player_StateDoubled          ;00BD75|AD6505  |000565;
                       AND.B #$7F                           ;00BD78|297F    |      ;
                       STA.W r_Player_StateDoubled          ;00BD7A|8D6505  |000565;
                       LDA.B #$68                           ;00BD7D|A968    |      ;
                       STA.B $C7                            ;00BD7F|85C7    |0000C7;
                       LDA.B #$1B                           ;00BD81|A91B    |      ;
                       STA.B r_gameTransition               ;00BD83|852A    |00002A;
                       RTS                                  ;00BD85|60      |      ;
 
 
          CODE_00BD86: LDY.B r_tempCurrGroup                ;00BD86|A40C    |00000C;
                       LDA.B #$0C                           ;00BD88|A90C    |      ;
                       STA.B r_roomSectionChrBanksDataOffset;00BD8A|850F    |00000F;
 
          CODE_00BD8C: LDA.B (r_temp_Xpos),Y                ;00BD8C|B10A    |00000A;
                       CMP.B #$FF                           ;00BD8E|C9FF    |      ;
                       BEQ CODE_00BDC5                      ;00BD90|F033    |00BDC5;
                       CMP.B #$0A                           ;00BD92|C90A    |      ;
                       BEQ DATA8_00BDC6                     ;00BD94|F030    |00BDC6;
                       CMP.B #$A5                           ;00BD96|C9A5    |      ;
                       BEQ DATA8_00BDC6                     ;00BD98|F02C    |00BDC6;
                       CMP.B #$AA                           ;00BD9A|C9AA    |      ;
                       BEQ DATA8_00BDC6                     ;00BD9C|F028    |00BDC6;
 
          CODE_00BD9E: DEC.B r_roomSectionChrBanksDataOffset;00BD9E|C60F    |00000F;
                       BEQ CODE_00BDC5                      ;00BDA0|F023    |00BDC5;
                       LDA.B r_VRAM_QueueDest               ;00BDA2|A561    |000061;
                       AND.B #$08                           ;00BDA4|2908    |      ;
                       STA.B $01                            ;00BDA6|8501    |000001;
                       INC.B r_VRAM_QueueDest               ;00BDA8|E661    |000061;
                       LDA.B r_VRAM_QueueDest               ;00BDAA|A561    |000061;
                       AND.B #$08                           ;00BDAC|2908    |      ;
                       EOR.B $01                            ;00BDAE|4501    |000001;
                       BNE CODE_00BDB5                      ;00BDB0|D003    |00BDB5;
 
          CODE_00BDB2: INY                                  ;00BDB2|C8      |      ;
                       BNE CODE_00BD8C                      ;00BDB3|D0D7    |00BD8C;
 
          CODE_00BDB5: LDA.B r_VRAM_QueueDest               ;00BDB5|A561    |000061;
                       SEC                                  ;00BDB7|38      |      ;
                       SBC.B #$08                           ;00BDB8|E908    |      ;
                       STA.B r_VRAM_QueueDest               ;00BDBA|8561    |000061;
                       LDA.B $62                            ;00BDBC|A562    |000062;
 
                       EOR.B #$04                           ;00BDBE|4904    |      ;
                       STA.B $62                            ;00BDC0|8562    |000062;
                       JMP.W CODE_00BDB2                    ;00BDC2|4CB2BD  |00BDB2;
 
 
          CODE_00BDC5: RTS                                  ;00BDC5|60      |      ;
 
 
         DATA8_00BDC6: db $20                               ;00BDC6|        |      ;
                       dw CODE_0FE8B5                       ;00BDC7|        |0FE8B5;
                       LDA.B (r_temp_Xpos),Y                ;00BDC9|B10A    |00000A;
                       STA.W r_VramQueue,X                  ;00BDCB|9D0003  |000300;
                       INX                                  ;00BDCE|E8      |      ;
                       LDA.B #$FF                           ;00BDCF|A9FF    |      ;
                       STA.W r_VramQueue,X                  ;00BDD1|9D0003  |000300;
                       INX                                  ;00BDD4|E8      |      ;
                       STX.B r_sceneDrawQueue               ;00BDD5|861D    |00001D;
                       BNE CODE_00BD9E                      ;00BDD7|D0C5    |00BD9E;
                       RTS                                  ;00BDD9|60      |      ;
 
 
    freezWaterRoutine: LDA.W $0789                          ;00BDDA|AD8907  |000789;
                       JMP.W freezWater_SetUpdatePPU        ;00BDDD|4CF1BD  |00BDF1;
 
 
          CODE_00BDE0: LDA.B r_roomEffect                   ;00BDE0|A57D    |00007D;
                       AND.B #$0F                           ;00BDE2|290F    |      ;
                       BEQ CODE_00BDEE                      ;00BDE4|F008    |00BDEE;
                       LDY.W r_entity_YPos                  ;00BDE6|AC1C04  |00041C;
                       BPL CODE_00BDEE                      ;00BDE9|1003    |00BDEE;
                       CLC                                  ;00BDEB|18      |      ;
                       ADC.B #$01                           ;00BDEC|6901    |      ;
 
          CODE_00BDEE: STA.W $0789                          ;00BDEE|8D8907  |000789;
 
freezWater_SetUpdatePPU: ASL A                                ;00BDF1|0A      |      ;
                       TAY                                  ;00BDF2|A8      |      ;
                       LDA.W PTR16_00BDFE,Y                 ;00BDF3|B9FEBD  |00BDFE;
 
                       STA.B r_pointerQueue                 ;00BDF6|8508    |000008;
                       LDA.W PTR16_00BDFF,Y                 ;00BDF8|B9FFBD  |00BDFF;
                       STA.B $09                            ;00BDFB|8509    |000009;
                       RTS                                  ;00BDFD|60      |      ;
 
 
         PTR16_00BDFE: dw DATA8_00BE72                      ;00BDFE|        |00BE72;
                       dw DATA8_00BE04                      ;00BE00|        |00BE04;
 
                       dw DATA8_00BE09                      ;00BE02|        |00BE09;
 
         DATA8_00BE04: db $03,$0E,$BE,$27,$BE               ;00BE04|        |      ;
 
         DATA8_00BE09: db $05,$40,$BE,$59,$BE,$00,$00,$00   ;00BE09|        |      ;
                       db $00,$00,$AA,$0A,$0A,$0A,$0A,$0A   ;00BE11|        |      ;
                       db $0A,$0A,$0A,$0A,$0A,$0A,$AA,$00   ;00BE19|        |      ;
                       db $00,$00,$00,$00,$00,$FF,$00,$00   ;00BE21|        |      ;
                       db $00,$00,$00,$AA,$00,$00,$00,$00   ;00BE29|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$AA   ;00BE31|        |      ;
                       db $00,$00,$00,$00,$00,$00,$FF,$00   ;00BE39|        |      ;
                       db $00,$A5,$A5,$A5,$AA,$A5,$A5,$A5   ;00BE41|        |      ;
                       db $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5   ;00BE49|        |      ;
                       db $AA,$A5,$A5,$A5,$A5,$00,$00,$FF   ;00BE51|        |      ;
 
                       db $00,$00,$AA,$00,$00,$00,$00,$00   ;00BE59|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;00BE61|        |      ;
                       db $00,$00,$00,$00,$00,$AA,$00,$00   ;00BE69|        |      ;
                       db $FF                               ;00BE71|        |      ;
 
         DATA8_00BE72: db $04,$77,$BE,$98,$BE,$00,$00,$AA   ;00BE72|        |      ;
                       db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;00BE7A|        |      ;
                       db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;00BE82|        |      ;
                       db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;00BE8A|        |      ;
 
                       db $AA,$00,$00,$00,$00,$FF,$00,$00   ;00BE92|        |      ;
                       db $0A,$00,$00,$00,$00,$00,$00,$00   ;00BE9A|        |      ;
 
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;00BEA2|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;00BEAA|        |      ;
                       db $00,$AA,$00,$00,$00,$00,$FF,$FF   ;00BEB2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEBA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEC2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BECA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BED2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEDA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEE2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEEA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEF2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BEFA|        |      ;
 
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF02|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF0A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF12|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF1A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF22|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF2A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF32|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF3A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF42|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF4A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF52|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF5A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF62|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF6A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF72|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF7A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF82|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF8A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF92|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BF9A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFA2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFAA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFB2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFBA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFC2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFCA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFD2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFDA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFE2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFEA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;00BFF2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF           ;00BFFA|        |      ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
