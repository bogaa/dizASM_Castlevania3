 
 
 
              bank_96: db $96                               ;0B8000|        |      ; PRG 2c000
 
          CODE_0B8001: LDA.W $0470,X                        ;0B8001|BD7004  |0B0470;
                       AND.B #$FE                           ;0B8004|29FE    |      ;
                       STA.B $00                            ;0B8006|8500    |000000;
                       LDY.B #$00                           ;0B8008|A000    |      ;
                       LDA.W $04F2,X                        ;0B800A|BDF204  |0B04F2;
                       BPL CODE_0B8010                      ;0B800D|1001    |0B8010;
                       DEY                                  ;0B800F|88      |      ;
 
          CODE_0B8010: STY.B $01                            ;0B8010|8401    |000001;
                       JSR.W CODE_0B8037                    ;0B8012|203780  |0B8037;
                       LDA.W $0470,X                        ;0B8015|BD7004  |0B0470;
                       AND.B #$01                           ;0B8018|2901    |      ;
                       ADC.B $01                            ;0B801A|6501    |000001;
                       AND.B #$01                           ;0B801C|2901    |      ;
                       ORA.B $00                            ;0B801E|0500    |000000;
                       STA.W $0470,X                        ;0B8020|9D7004  |0B0470;
                       CLC                                  ;0B8023|18      |      ;
                       LDA.W $04DB,X                        ;0B8024|BDDB04  |0B04DB;
                       ADC.W $0537,X                        ;0B8027|7D3705  |0B0537;
                       STA.W $04DB,X                        ;0B802A|9DDB04  |0B04DB;
                       LDA.W $041C,X                        ;0B802D|BD1C04  |0B041C;
                       ADC.W $0520,X                        ;0B8030|7D2005  |0B0520;
                       STA.W $041C,X                        ;0B8033|9D1C04  |0B041C;
                       RTS                                  ;0B8036|60      |      ;
 
 
          CODE_0B8037: CLC                                  ;0B8037|18      |      ;
                       LDA.W $04C4,X                        ;0B8038|BDC404  |0B04C4;
                       ADC.W $0509,X                        ;0B803B|7D0905  |0B0509;
                       STA.W $04C4,X                        ;0B803E|9DC404  |0B04C4;
                       LDA.W $0438,X                        ;0B8041|BD3804  |0B0438;
                       ADC.W $04F2,X                        ;0B8044|7DF204  |0B04F2;
                       STA.W $0438,X                        ;0B8047|9D3804  |0B0438;
                       RTS                                  ;0B804A|60      |      ;
 
 
          CODE_0B804B: SEC                                  ;0B804B|38      |      ;
                       LDA.B #$00                           ;0B804C|A900    |      ;
                       SBC.W $0509,X                        ;0B804E|FD0905  |0B0509;
                       STA.W $0509,X                        ;0B8051|9D0905  |0B0509;
                       LDA.B #$00                           ;0B8054|A900    |      ;
                       SBC.W $04F2,X                        ;0B8056|FDF204  |0B04F2;
                       STA.W $04F2,X                        ;0B8059|9DF204  |0B04F2;
                       RTS                                  ;0B805C|60      |      ;
 
 
          CODE_0B805D: SEC                                  ;0B805D|38      |      ;
                       LDA.B #$00                           ;0B805E|A900    |      ;
                       SBC.W $0537,X                        ;0B8060|FD3705  |0B0537;
                       STA.W $0537,X                        ;0B8063|9D3705  |0B0537;
                       LDA.B #$00                           ;0B8066|A900    |      ;
                       SBC.W $0520,X                        ;0B8068|FD2005  |0B0520;
                       STA.W $0520,X                        ;0B806B|9D2005  |0B0520;
                       RTS                                  ;0B806E|60      |      ;
 
 
          CODE_0B806F: CLC                                  ;0B806F|18      |      ;
                       ADC.W $0509,X                        ;0B8070|7D0905  |0B0509;
                       STA.W $0509,X                        ;0B8073|9D0905  |0B0509;
                       LDA.B #$00                           ;0B8076|A900    |      ;
                       ADC.W $04F2,X                        ;0B8078|7DF204  |0B04F2;
                       STA.W $04F2,X                        ;0B807B|9DF204  |0B04F2;
                       RTS                                  ;0B807E|60      |      ;
 
 
          CODE_0B807F: CLC                                  ;0B807F|18      |      ;
                       ADC.W $0537,X                        ;0B8080|7D3705  |0B0537;
                       STA.W $0537,X                        ;0B8083|9D3705  |0B0537;
                       LDA.B #$00                           ;0B8086|A900    |      ;
                       ADC.W $0520,X                        ;0B8088|7D2005  |0B0520;
                       STA.W $0520,X                        ;0B808B|9D2005  |0B0520;
                       RTS                                  ;0B808E|60      |      ;
 
 
          CODE_0B808F: EOR.B #$FF                           ;0B808F|49FF    |      ;
                       SEC                                  ;0B8091|38      |      ;
                       ADC.W $0509,X                        ;0B8092|7D0905  |0B0509;
                       STA.W $0509,X                        ;0B8095|9D0905  |0B0509;
                       LDA.B #$FF                           ;0B8098|A9FF    |      ;
                       ADC.W $04F2,X                        ;0B809A|7DF204  |0B04F2;
                       STA.W $04F2,X                        ;0B809D|9DF204  |0B04F2;
                       RTS                                  ;0B80A0|60      |      ;
 
 
          CODE_0B80A1: EOR.B #$FF                           ;0B80A1|49FF    |      ;
                       SEC                                  ;0B80A3|38      |      ;
                       ADC.W $0537,X                        ;0B80A4|7D3705  |0B0537;
                       STA.W $0537,X                        ;0B80A7|9D3705  |0B0537;
                       LDA.B #$FF                           ;0B80AA|A9FF    |      ;
                       ADC.W $0520,X                        ;0B80AC|7D2005  |0B0520;
                       STA.W $0520,X                        ;0B80AF|9D2005  |0B0520;
                       RTS                                  ;0B80B2|60      |      ;
 
 
          CODE_0B80B3: LDA.W $0438,X                        ;0B80B3|BD3804  |0B0438;
 
          CODE_0B80B6: SEC                                  ;0B80B6|38      |      ;
                       SBC.W $0438                          ;0B80B7|ED3804  |0B0438;
                       BCS CODE_0B80C0                      ;0B80BA|B004    |0B80C0;
 
          CODE_0B80BC: EOR.B #$FF                           ;0B80BC|49FF    |      ;
                       ADC.B #$01                           ;0B80BE|6901    |      ;
 
          CODE_0B80C0: RTS                                  ;0B80C0|60      |      ;
 
 
          CODE_0B80C1: LDA.W $041C,X                        ;0B80C1|BD1C04  |0B041C;
 
          CODE_0B80C4: SEC                                  ;0B80C4|38      |      ;
                       SBC.B r_collisionPointYinScreen      ;0B80C5|E511    |000011;
                       BCS CODE_0B80C0                      ;0B80C7|B0F7    |0B80C0;
                       BCC CODE_0B80BC                      ;0B80C9|90F1    |0B80BC;
 
          CODE_0B80CB: LDA.W $0438,X                        ;0B80CB|BD3804  |0B0438;
 
          CODE_0B80CE: SEC                                  ;0B80CE|38      |      ;
                       SBC.B r_index                        ;0B80CF|E510    |000010;
                       BCS CODE_0B80C0                      ;0B80D1|B0ED    |0B80C0;
                       BCC CODE_0B80BC                      ;0B80D3|90E7    |0B80BC;
 
          CODE_0B80D5: LDA.W $041C,X                        ;0B80D5|BD1C04  |0B041C;
                       SEC                                  ;0B80D8|38      |      ;
                       SBC.W $041C                          ;0B80D9|ED1C04  |0B041C;
                       BCS CODE_0B80E2                      ;0B80DC|B004    |0B80E2;
                       EOR.B #$FF                           ;0B80DE|49FF    |      ;
                       ADC.B #$01                           ;0B80E0|6901    |      ;
 
          CODE_0B80E2: RTS                                  ;0B80E2|60      |      ;
 
 
          CODE_0B80E3: LDX.B #$09                           ;0B80E3|A209    |      ;
 
          CODE_0B80E5: LDA.W $054E,X                        ;0B80E5|BD4E05  |0B054E;
                       BEQ CODE_0B80F1                      ;0B80E8|F007    |0B80F1;
                       INX                                  ;0B80EA|E8      |      ;
                       CPX.B #$0D                           ;0B80EB|E00D    |      ;
                       BCC CODE_0B80E5                      ;0B80ED|90F6    |0B80E5;
 
          CODE_0B80EF: LDA.B #$01                           ;0B80EF|A901    |      ;
 
          CODE_0B80F1: RTS                                  ;0B80F1|60      |      ;
 
                       LDX.B #$07                           ;0B80F2|A207    |      ;
 
          CODE_0B80F4: LDA.W $054E,X                        ;0B80F4|BD4E05  |0B054E;
                       BEQ CODE_0B80F1                      ;0B80F7|F0F8    |0B80F1;
                       INX                                  ;0B80F9|E8      |      ;
                       CPX.B #$13                           ;0B80FA|E013    |      ;
                       BCC CODE_0B80F4                      ;0B80FC|90F6    |0B80F4;
                       BCS CODE_0B80EF                      ;0B80FE|B0EF    |0B80EF;
                       LDX.B #$01                           ;0B8100|A201    |      ;
 
          CODE_0B8102: LDA.W $054E,X                        ;0B8102|BD4E05  |0B054E;
                       BEQ CODE_0B810C                      ;0B8105|F005    |0B810C;
                       INX                                  ;0B8107|E8      |      ;
                       CPX.B #$13                           ;0B8108|E013    |      ;
                       BCC CODE_0B8102                      ;0B810A|90F6    |0B8102;
 
          CODE_0B810C: RTS                                  ;0B810C|60      |      ;
 
 
         clearEnemyID: LDA.B #$00                           ;0B810D|A900    |      ;
                       STA.W r_entity_AI_idx,X              ;0B810F|9DEF05  |0005EF;
 
          enemyID__EA: RTS                                  ;0B8112|60      |      ;
 
 
          CODE_0B8113: LDA.B r_stage                        ;0B8113|A532    |000032;
                       CMP.B #$08                           ;0B8115|C908    |      ;
                       BNE CODE_0B811E                      ;0B8117|D005    |0B811E;
                       LDA.B r_blockLevel                   ;0B8119|A533    |000033;
                       CMP.B #$03                           ;0B811B|C903    |      ;
                       RTS                                  ;0B811D|60      |      ;
 
 
          CODE_0B811E: CLC                                  ;0B811E|18      |      ;
 
          CODE_0B811F: RTS                                  ;0B811F|60      |      ;
 
 
   enemy_2_ID_boss_42: JSR.W CODE_0B8113                    ;0B8120|201381  |0B8113; boneKing0, grant
                       BCC CODE_0B811F                      ;0B8123|90FA    |0B811F;
                       LDA.W $041C,X                        ;0B8125|BD1C04  |0B041C;
                       CMP.B r_floodHight                   ;0B8128|C5CA    |0000CA;
                       BCC CODE_0B811F                      ;0B812A|90F3    |0B811F;
                       JSR.W enemyID_frog_4E                ;0B812C|20B284  |0B84B2;
                       SEC                                  ;0B812F|38      |      ;
                       RTS                                  ;0B8130|60      |      ;
 
 
          CODE_0B8131: LDA.B r_gameTransition               ;0B8131|A52A    |00002A;
                       CMP.B #$1B                           ;0B8133|C91B    |      ;
                       BNE CODE_0B814F                      ;0B8135|D018    |0B814F;
                       LDA.W $0470,X                        ;0B8137|BD7004  |0B0470;
                       AND.B #$02                           ;0B813A|2902    |      ;
                       BNE CODE_0B814F                      ;0B813C|D011    |0B814F;
                       JSR.W CODE_0BB6E6                    ;0B813E|20E6B6  |0BB6E6;
                       CLC                                  ;0B8141|18      |      ;
                       LDA.B $C7                            ;0B8142|A5C7    |0000C7;
                       ADC.B #$04                           ;0B8144|6904    |      ;
                       STA.W $05D8,X                        ;0B8146|9DD805  |0B05D8;
                       db $20                               ;0B8149|        |      ;
                       dw UNREACH_0FFF8A                    ;0B814A|        |0FFF8A;
                       LDA.B #$00                           ;0B814C|A900    |      ;
                       RTS                                  ;0B814E|60      |      ;
 
 
          CODE_0B814F: LDA.W $05EF,X                        ;0B814F|BDEF05  |0B05EF;
                       RTS                                  ;0B8152|60      |      ;
 
 
          enemyID__DA: LDA.B #$10                           ;0B8153|A910    |      ;
                       JSR.W CODE_0B807F                    ;0B8155|207F80  |0B807F;
                       LDY.B #$06                           ;0B8158|A006    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B815A|20A6B7  |0BB7A6;
                       BEQ enemyID__EA                      ;0B815D|F0B3    |0B8112;
                       LDX.B r_entityID_processed           ;0B815F|A66C    |00006C;
                       JSR.W CODE_0B8B91                    ;0B8161|20918B  |0B8B91;
 
          CODE_0B8164: INC.W $05C1,X                        ;0B8164|FEC105  |0B05C1;
                       db $4C                               ;0B8167|        |      ;
 
                       dw UNREACH_0FFEC8                    ;0B8168|        |0FFEC8;
 
        enemy_2_ID_44: LDA.B #$10                           ;0B816A|A910    |      ;
                       JSR.W CODE_0B807F                    ;0B816C|207F80  |0B807F;
                       LDY.B #$0E                           ;0B816F|A00E    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8171|20A6B7  |0BB7A6;
                       BEQ CODE_0B819A                      ;0B8174|F024    |0B819A;
                       LDX.B r_entityID_processed           ;0B8176|A66C    |00006C;
                       LDA.W $041C,X                        ;0B8178|BD1C04  |0B041C;
                       AND.B #$F8                           ;0B817B|29F8    |      ;
                       STA.W $041C,X                        ;0B817D|9D1C04  |0B041C;
                       JMP.W CODE_0B8164                    ;0B8180|4C6481  |0B8164;
 
 
        enemy_2_ID_3E: JSR.W CODE_0B81EF                    ;0B8183|20EF81  |0B81EF;
                       LDA.B #$10                           ;0B8186|A910    |      ;
                       JSR.W CODE_0B807F                    ;0B8188|207F80  |0B807F;
                       LDA.W $041C,X                        ;0B818B|BD1C04  |0B041C;
                       CMP.B #$F8                           ;0B818E|C9F8    |      ;
                       BCC CODE_0B819A                      ;0B8190|9008    |0B819A;
                       LDA.B #$23                           ;0B8192|A923    |      ;
                       db $20                               ;0B8194|        |      ;
                       dw initFreezWaterEffect_01           ;0B8195|        |0FE25F;
                       INC.W $05C1,X                        ;0B8197|FEC105  |0B05C1;
 
          CODE_0B819A: RTS                                  ;0B819A|60      |      ;
 
 
    enemyID_zombie_02: INC.W $05C1,X                        ;0B819B|FEC105  |0B05C1;
 
          CODE_0B819E: LDA.W $0470,X                        ;0B819E|BD7004  |0B0470;
                       AND.B #$BF                           ;0B81A1|29BF    |      ;
                       STA.W $0470,X                        ;0B81A3|9D7004  |0B0470;
                       RTS                                  ;0B81A6|60      |      ;
 
 
enemyID_fishManSwimJump_54: INC.W $05C1,X                        ;0B81A7|FEC105  |0B05C1;
 
          CODE_0B81AA: LDA.W $0470,X                        ;0B81AA|BD7004  |0B0470;
                       ORA.B #$40                           ;0B81AD|0940    |      ;
                       STA.W $0470,X                        ;0B81AF|9D7004  |0B0470;
                       RTS                                  ;0B81B2|60      |      ;
 
 
    enemyID_splash_56: INC.W $05C1,X                        ;0B81B3|FEC105  |0B05C1;
                       JMP.W CODE_0B804B                    ;0B81B6|4C4B80  |0B804B;
 
 
     enemyID_raven_06: INC.W $05C1,X                        ;0B81B9|FEC105  |0B05C1;
 
          CODE_0B81BC: LDA.W $0470,X                        ;0B81BC|BD7004  |0B0470;
                       AND.B #$F7                           ;0B81BF|29F7    |      ;
                       STA.W $0470,X                        ;0B81C1|9D7004  |0B0470;
                       RTS                                  ;0B81C4|60      |      ;
 
 
enemyID_skeletonWhip_14: INC.W $05C1,X                        ;0B81C5|FEC105  |0B05C1;
                       LDA.W $0470,X                        ;0B81C8|BD7004  |0B0470;
                       ORA.B #$88                           ;0B81CB|0988    |      ;
                       STA.W $0470,X                        ;0B81CD|9D7004  |0B0470;
                       RTS                                  ;0B81D0|60      |      ;
 
 
          enemyID__A8: INC.W $05C1,X                        ;0B81D1|FEC105  |0B05C1;
 
          CODE_0B81D4: LDA.W $0470,X                        ;0B81D4|BD7004  |0B0470;
                       ORA.B #$10                           ;0B81D7|0910    |      ;
                       STA.W $0470,X                        ;0B81D9|9D7004  |0B0470;
                       RTS                                  ;0B81DC|60      |      ;
 
 
          enemyID__A6: INC.W $05C1,X                        ;0B81DD|FEC105  |0B05C1;
                       LDA.W $0470,X                        ;0B81E0|BD7004  |0B0470;
                       AND.B #$EF                           ;0B81E3|29EF    |      ;
                       STA.W $0470,X                        ;0B81E5|9D7004  |0B0470;
                       RTS                                  ;0B81E8|60      |      ;
 
 
enemyID_boneDragonHead_5A: JSR.W CODE_0B819E                    ;0B81E9|209E81  |0B819E;
 
          CODE_0B81EC: INC.W $05C1,X                        ;0B81EC|FEC105  |0B05C1;
 
          CODE_0B81EF: LDA.W $0470,X                        ;0B81EF|BD7004  |0B0470;
                       ORA.B #$20                           ;0B81F2|0920    |      ;
                       STA.W $0470,X                        ;0B81F4|9D7004  |0B0470;
                       RTS                                  ;0B81F7|60      |      ;
 
 
          CODE_0B81F8: LDA.W $0470,X                        ;0B81F8|BD7004  |0B0470;
                       AND.B #$DF                           ;0B81FB|29DF    |      ;
                       STA.W $0470,X                        ;0B81FD|9D7004  |0B0470;
                       RTS                                  ;0B8200|60      |      ;
 
 
          enemyID__AA: INC.W $05C1,X                        ;0B8201|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B8204|A001    |      ;
                       LDA.B ($02),Y                        ;0B8206|B102    |000002;
                       STA.W $0657,X                        ;0B8208|9D5706  |0B0657;
                       RTS                                  ;0B820B|60      |      ;
 
 
     enemyID_raven_08: LDY.B #$01                           ;0B820C|A001    |      ;
                       LDA.B ($02),Y                        ;0B820E|B102    |000002;
                       STA.W $05C1,X                        ;0B8210|9DC105  |0B05C1;
                       RTS                                  ;0B8213|60      |      ;
 
 
          enemyID__C4: LDY.B #$01                           ;0B8214|A001    |      ;
                       CLC                                  ;0B8216|18      |      ;
                       LDA.B ($02),Y                        ;0B8217|B102    |000002;
                       ADC.W $0438,X                        ;0B8219|7D3804  |0B0438;
                       STA.W $0438,X                        ;0B821C|9D3804  |0B0438;
                       INY                                  ;0B821F|C8      |      ;
                       CLC                                  ;0B8220|18      |      ;
                       LDA.B ($02),Y                        ;0B8221|B102    |000002;
                       ADC.W $041C,X                        ;0B8223|7D1C04  |0B041C;
                       STA.W $041C,X                        ;0B8226|9D1C04  |0B041C;
                       INC.W $05C1,X                        ;0B8229|FEC105  |0B05C1;
 
          enemyID__E4: RTS                                  ;0B822C|60      |      ;
 
 
       enemyID_bat_0A: INC.W $05C1,X                        ;0B822D|FEC105  |0B05C1;
 
          CODE_0B8230: LDA.B #$00                           ;0B8230|A900    |      ;
                       LDY.W $0438,X                        ;0B8232|BC3804  |0B0438;
                       CPY.W $0438                          ;0B8235|CC3804  |0B0438;
                       BCC CODE_0B823C                      ;0B8238|9002    |0B823C;
                       LDA.B #$01                           ;0B823A|A901    |      ;
 
          CODE_0B823C: STA.W $04A8,X                        ;0B823C|9DA804  |0B04A8;
                       RTS                                  ;0B823F|60      |      ;
 
 
        enemy_2_ID_22: INC.W $05C1,X                        ;0B8240|FEC105  |0B05C1;
 
          CODE_0B8243: JSR.W CODE_0B8230                    ;0B8243|203082  |0B8230;
                       LDA.W $0470,X                        ;0B8246|BD7004  |0B0470;
                       AND.B #$01                           ;0B8249|2901    |      ;
                       BEQ CODE_0B8255                      ;0B824B|F008    |0B8255;
                       LDA.W $04A8,X                        ;0B824D|BDA804  |0B04A8;
                       EOR.B #$01                           ;0B8250|4901    |      ;
                       STA.W $04A8,X                        ;0B8252|9DA804  |0B04A8;
 
          CODE_0B8255: RTS                                  ;0B8255|60      |      ;
 
 
enemyID_sleepingBat_0C: INC.W $05C1,X                        ;0B8256|FEC105  |0B05C1;
 
          CODE_0B8259: SEC                                  ;0B8259|38      |      ;
                       LDA.W $054E,X                        ;0B825A|BD4E05  |0B054E;
                       SBC.B #$48                           ;0B825D|E948    |      ;
                       TAY                                  ;0B825F|A8      |      ;
                       LDA.W DATA8_0B826C,Y                 ;0B8260|B96C82  |0B826C;
                       TAY                                  ;0B8263|A8      |      ;
                       LDA.B #$08                           ;0B8264|A908    |      ;
                       db $20                               ;0B8266|        |      ;
                       dw CODE_0FEF5C                       ;0B8267|        |0FEF5C;
                       db $4C                               ;0B8269|        |      ;
 
                       dw CODE_0FEF75                       ;0B826A|        |0FEF75;
 
         DATA8_0B826C: db $00,$01,$03,$04,$02,$05,$06,$10   ;0B826C|        |      ;
                       db $07,$08,$09,$11,$0B,$0D,$00,$06   ;0B8274|        |      ;
                       db $0F,$00,$12,$05,$1B,$1C,$00,$00   ;0B827C|        |      ;
 
enemyID_skeletonWalk_26: INC.W $05C1,X                        ;0B8284|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B8287|A001    |      ;
                       LDA.B ($02),Y                        ;0B8289|B102    |000002;
                       STA.B $00                            ;0B828B|8500    |000000;
                       INY                                  ;0B828D|C8      |      ;
                       LDA.B ($02),Y                        ;0B828E|B102    |000002;
                       TAY                                  ;0B8290|A8      |      ;
                       LDA.B $00                            ;0B8291|A500    |000000;
 
         DATA8_0B8293: db $20                               ;0B8293|        |      ;
                       dw CODE_0FEF5C                       ;0B8294|        |0FEF5C;
                       db $20                               ;0B8296|        |      ;
                       dw CODE_0FEF75                       ;0B8297|        |0FEF75;
                       JMP.W CODE_0B81F8                    ;0B8299|4CF881  |0B81F8;
 
 
        enemy_2_ID_16: LDY.B #$07                           ;0B829C|A007    |      ;
                       LDA.B r_CHR_BankSpr_0800             ;0B829E|A548    |000048;
                       CMP.B #$08                           ;0B82A0|C908    |      ;
                       BNE CODE_0B82A6                      ;0B82A2|D002    |0B82A6;
                       LDY.B #$0A                           ;0B82A4|A00A    |      ;
 
          CODE_0B82A6: LDA.B #$12                           ;0B82A6|A912    |      ;
 
          CODE_0B82A8: INC.W $05C1,X                        ;0B82A8|FEC105  |0B05C1;
                       JMP.W DATA8_0B8293                   ;0B82AB|4C9382  |0B8293;
 
 
        enemy_2_ID_4C: LDY.B #$07                           ;0B82AE|A007    |      ;
                       LDA.B #$14                           ;0B82B0|A914    |      ;
                       BNE CODE_0B82A8                      ;0B82B2|D0F4    |0B82A8;
 
        enemy_2_ID_18: LDY.B #$00                           ;0B82B4|A000    |      ;
                       LDA.B r_CHR_BankSpr_0800             ;0B82B6|A548    |000048;
                       CMP.B #$08                           ;0B82B8|C908    |      ;
                       BEQ CODE_0B82BD                      ;0B82BA|F001    |0B82BD;
                       INY                                  ;0B82BC|C8      |      ;
 
          CODE_0B82BD: LDA.W DATA8_0B82D1,Y                 ;0B82BD|B9D182  |0B82D1;
                       STA.B $00                            ;0B82C0|8500    |000000;
                       LDA.W DATA8_0B82CD,Y                 ;0B82C2|B9CD82  |0B82CD;
                       LDY.B $00                            ;0B82C5|A400    |000000;
                       JSR.W CODE_0B82A8                    ;0B82C7|20A882  |0B82A8;
                       JMP.W CODE_0B82F0                    ;0B82CA|4CF082  |0B82F0;
 
 
         DATA8_0B82CD: db $08,$12,$08,$12                   ;0B82CD|        |      ;
 
         DATA8_0B82D1: db $01,$0B,$04,$0C                   ;0B82D1|        |      ;
 
        enemy_2_ID_1A: JSR.W CODE_0B8230                    ;0B82D5|203082  |0B8230;
                       JSR.W CODE_0B81EC                    ;0B82D8|20EC81  |0B81EC;
                       LDY.B #$00                           ;0B82DB|A000    |      ;
                       LDA.B r_CHR_BankSpr_0800             ;0B82DD|A548    |000048;
                       CMP.B #$08                           ;0B82DF|C908    |      ;
                       BEQ CODE_0B82E4                      ;0B82E1|F001    |0B82E4;
                       INY                                  ;0B82E3|C8      |      ;
 
          CODE_0B82E4: LDA.W DATA8_0B82CD,Y                 ;0B82E4|B9CD82  |0B82CD;
                       STA.W $048C,X                        ;0B82E7|9D8C04  |0B048C;
                       LDA.W CODE_0B8305,Y                  ;0B82EA|B90583  |0B8305;
                       STA.W $0400,X                        ;0B82ED|9D0004  |0B0400;
 
          CODE_0B82F0: LDA.B r_stage                        ;0B82F0|A532    |000032;
                       CMP.B #$05                           ;0B82F2|C905    |      ;
                       BNE CODE_0B8304                      ;0B82F4|D00E    |0B8304;
                       LDA.B r_blockLevel                   ;0B82F6|A533    |000033;
                       CMP.B #$03                           ;0B82F8|C903    |      ;
                       BNE CODE_0B8304                      ;0B82FA|D008    |0B8304;
                       LDA.W $0454,X                        ;0B82FC|BD5404  |0B0454;
                       ORA.B #$03                           ;0B82FF|0903    |      ;
                       STA.W $0454,X                        ;0B8301|9D5404  |0B0454;
 
          CODE_0B8304: RTS                                  ;0B8304|60      |      ;
 
 
          CODE_0B8305: ORA.B (r_scrollStartOffsetHi)        ;0B8305|1270    |000070;
 
        enemy_2_ID_2A: LDY.B #$02                           ;0B8307|A002    |      ;
                       LDA.B r_CHR_BankSpr_0c00             ;0B8309|A549    |000049;
                       CMP.B #$0F                           ;0B830B|C90F    |      ;
                       BEQ CODE_0B82BD                      ;0B830D|F0AE    |0B82BD;
                       INY                                  ;0B830F|C8      |      ;
                       JMP.W CODE_0B82BD                    ;0B8310|4CBD82  |0B82BD;
 
 
     enemyID_heart_9E: LDA.B #$01                           ;0B8313|A901    |      ;
                       STA.W $04A8,X                        ;0B8315|9DA804  |0B04A8;
                       LDA.B #$00                           ;0B8318|A900    |      ;
                       STA.W $0454,X                        ;0B831A|9D5404  |0B0454;
                       LDA.W $054E,X                        ;0B831D|BD4E05  |0B054E;
                       SEC                                  ;0B8320|38      |      ;
                       SBC.B #$93                           ;0B8321|E993    |      ;
                       TAY                                  ;0B8323|A8      |      ;
                       LDA.W DATA8_0B8333,Y                 ;0B8324|B93383  |0B8333;
                       STA.W $048C,X                        ;0B8327|9D8C04  |0B048C;
                       LDA.W DATA8_0B8353,Y                 ;0B832A|B95383  |0B8353;
                       STA.W $0400,X                        ;0B832D|9D0004  |0B0400;
                       JMP.W CODE_0B81EC                    ;0B8330|4CEC81  |0B81EC;
 
 
         DATA8_0B8333: db $00,$00,$00,$00,$0E,$0E,$0E,$0E   ;0B8333|        |      ;
                       db $00,$00,$00,$00,$0E,$0E,$0E,$0E   ;0B833B|        |      ;
                       db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;0B8343|        |      ;
                       db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;0B834B|        |      ;
 
         DATA8_0B8353: db $46,$42,$4E,$50,$68,$54,$56,$52   ;0B8353|        |      ;
                       db $4E,$46,$54,$54,$6A,$1C,$1E,$20   ;0B835B|        |      ;
                       db $24,$24,$24,$24,$24,$24,$24,$24   ;0B8363|        |      ;
                       db $24,$22,$10,$0E,$58,$5A,$6A,$10   ;0B836B|        |      ;
 
        enemy_2_ID_0E: INC.W $05C1,X                        ;0B8373|FEC105  |0B05C1;
                       LDA.B #$0E                           ;0B8376|A90E    |      ;
                       STA.W $048C,X                        ;0B8378|9D8C04  |0B048C;
                       SEC                                  ;0B837B|38      |      ;
                       LDA.W $054E,X                        ;0B837C|BD4E05  |0B054E;
                       SBC.B #$A3                           ;0B837F|E9A3    |      ;
                       TAY                                  ;0B8381|A8      |      ;
                       LDA.W DATA8_0B8389,Y                 ;0B8382|B98983  |0B8389;
                       STA.W $0400,X                        ;0B8385|9D0004  |0B0400;
                       RTS                                  ;0B8388|60      |      ;
 
 
         DATA8_0B8389: db $26,$28,$2A,$2C,$2E,$30,$32,$34   ;0B8389|        |      ;
                       db $70                               ;0B8391|        |      ;
 
        enemy_2_ID_10: LDY.B #$00                           ;0B8392|A000    |      ;
                       LDA.B r_CHR_BankSpr_0800             ;0B8394|A548    |000048;
                       CMP.B #$14                           ;0B8396|C914    |      ;
                       BNE CODE_0B839C                      ;0B8398|D002    |0B839C;
                       LDY.B #$0E                           ;0B839A|A00E    |      ;
 
          CODE_0B839C: STY.B $00                            ;0B839C|8400    |000000;
                       LDA.B #$12                           ;0B839E|A912    |      ;
                       STA.W $048C,X                        ;0B83A0|9D8C04  |0B048C;
                       LDY.B #$01                           ;0B83A3|A001    |      ;
                       CLC                                  ;0B83A5|18      |      ;
                       LDA.B ($02),Y                        ;0B83A6|B102    |000002;
                       ADC.B $00                            ;0B83A8|6500    |000000;
                       JMP.W CODE_0B83B7                    ;0B83AA|4CB783  |0B83B7;
 
 
  enemyID_eyeFloat_16: LDY.B #$01                           ;0B83AD|A001    |      ;
 
          CODE_0B83AF: LDA.B ($02),Y                        ;0B83AF|B102    |000002;
                       STA.W $048C,X                        ;0B83B1|9D8C04  |0B048C;
                       INY                                  ;0B83B4|C8      |      ;
                       LDA.B ($02),Y                        ;0B83B5|B102    |000002;
 
          CODE_0B83B7: STA.W $0400,X                        ;0B83B7|9D0004  |0B0400;
                       JMP.W CODE_0B81EC                    ;0B83BA|4CEC81  |0B81EC;
 
 
    enemyID_medusa_0E: JSR.W CODE_0B81F8                    ;0B83BD|20F881  |0B81F8;
                       JSR.W CODE_0B8259                    ;0B83C0|205982  |0B8259;
 
    enemyID_spider_3C: INC.W $05C1,X                        ;0B83C3|FEC105  |0B05C1;
                       JSR.W CODE_0B81AA                    ;0B83C6|20AA81  |0B81AA;
                       JSR.W CODE_0B8230                    ;0B83C9|203082  |0B8230;
                       db $20                               ;0B83CC|        |      ;
                       dw UNREACH_0FFEC8                    ;0B83CD|        |0FFEC8;
                       LDY.B #$01                           ;0B83CF|A001    |      ;
                       LDA.B ($02),Y                        ;0B83D1|B102    |000002;
                       STA.W $04F2,X                        ;0B83D3|9DF204  |0B04F2;
                       INY                                  ;0B83D6|C8      |      ;
                       LDA.B ($02),Y                        ;0B83D7|B102    |000002;
                       STA.W $0509,X                        ;0B83D9|9D0905  |0B0509;
 
          CODE_0B83DC: LDY.W $04A8,X                        ;0B83DC|BCA804  |0B04A8;
                       BEQ CODE_0B83E4                      ;0B83DF|F003    |0B83E4;
                       JMP.W CODE_0B804B                    ;0B83E1|4C4B80  |0B804B;
 
 
          CODE_0B83E4: RTS                                  ;0B83E4|60      |      ;
 
 
        enemy_2_ID_4E: JSR.W CODE_0B81F8                    ;0B83E5|20F881  |0B81F8;
                       LDY.B #$08                           ;0B83E8|A008    |      ;
                       LDA.B #$14                           ;0B83EA|A914    |      ;
                       db $20                               ;0B83EC|        |      ;
                       dw CODE_0FEF5C                       ;0B83ED|        |0FEF5C;
                       db $20                               ;0B83EF|        |      ;
                       dw CODE_0FEF75                       ;0B83F0|        |0FEF75;
                       JMP.W enemyID_spider_3C              ;0B83F2|4CC383  |0B83C3;
 
 
     enemyID_ghost_10: LDY.B #$01                           ;0B83F5|A001    |      ;
                       LDA.B ($02),Y                        ;0B83F7|B102    |000002;
                       db $20                               ;0B83F9|        |      ;
                       dw jumpFromStackYXpreserved          ;0B83FA|        |0FE86D;
                       dw CODE_0B8404                       ;0B83FC|        |0B8404;
                       dw CODE_0B8453                       ;0B83FE|        |0B8453;
                       dw CODE_0B8410                       ;0B8400|        |0B8410;
                       dw CODE_0B8428                       ;0B8402|        |0B8428;
 
          CODE_0B8404: JSR.W CODE_0B841C                    ;0B8404|201C84  |0B841C;
                       LDA.W CODE_0B840C,Y                  ;0B8407|B90C84  |0B840C;
                       BNE CODE_0B8445                      ;0B840A|D039    |0B8445;
 
          CODE_0B840C: SED                                  ;0B840C|F8      |      ;
                       BCS CODE_0B83AF                      ;0B840D|B0A0    |0B83AF;
                       INY                                  ;0B840F|C8      |      ;
 
          CODE_0B8410: JSR.W CODE_0B841C                    ;0B8410|201C84  |0B841C;
                       LDA.W CODE_0B8418,Y                  ;0B8413|B91884  |0B8418;
                       BNE CODE_0B8445                      ;0B8416|D02D    |0B8445;
 
          CODE_0B8418: PHA                                  ;0B8418|48      |      ;
                       RTS                                  ;0B8419|60      |      ;
 
                       db $50,$38                           ;0B841A|        |      ;
 
          CODE_0B841C: TXA                                  ;0B841C|8A      |      ;
                       ADC.W $0438                          ;0B841D|6D3804  |0B0438;
                       AND.B r_RNG                          ;0B8420|251F    |00001F;
                       ADC.B r_gameStateLoopCounter         ;0B8422|651A    |00001A;
                       AND.B #$03                           ;0B8424|2903    |      ;
                       TAY                                  ;0B8426|A8      |      ;
                       RTS                                  ;0B8427|60      |      ;
 
 
          CODE_0B8428: JSR.W CODE_0B841C                    ;0B8428|201C84  |0B841C;
                       LDY.W $07F6                          ;0B842B|ACF607  |0B07F6;
                       BEQ CODE_0B8433                      ;0B842E|F003    |0B8433;
                       CLC                                  ;0B8430|18      |      ;
                       ADC.B #$04                           ;0B8431|6904    |      ;
 
          CODE_0B8433: TAY                                  ;0B8433|A8      |      ;
                       LDA.W someMoreData,Y                 ;0B8434|B93984  |0B8439;
                       BNE CODE_0B8445                      ;0B8437|D00C    |0B8445;
 
         someMoreData: db $A0,$60,$70,$80,$30,$48,$38,$40   ;0B8439|        |      ;
 
enemyID_bonePillarTwo_3E: LDY.B #$01                           ;0B8441|A001    |      ;
                       LDA.B ($02),Y                        ;0B8443|B102    |000002;
 
          CODE_0B8445: STA.W $0606,X                        ;0B8445|9D0606  |0B0606;
 
          CODE_0B8448: INC.W $05C1,X                        ;0B8448|FEC105  |0B05C1;
 
          CODE_0B844B: RTS                                  ;0B844B|60      |      ;
 
 
          enemyID__40: DEC.W $0606,X                        ;0B844C|DE0606  |0B0606;
                       BNE CODE_0B844B                      ;0B844F|D0FA    |0B844B;
                       BEQ CODE_0B8448                      ;0B8451|F0F5    |0B8448;
 
          CODE_0B8453: LDY.W $07F6                          ;0B8453|ACF607  |0B07F6;
                       TXA                                  ;0B8456|8A      |      ;
                       ADC.B r_RNG                          ;0B8457|651F    |00001F;
                       AND.B #$07                           ;0B8459|2907    |      ;
                       CLC                                  ;0B845B|18      |      ;
                       ADC.W difficultyModeOffsetsForAbove,Y;0B845C|797584  |0B8475;
                       TAY                                  ;0B845F|A8      |      ;
                       LDA.W startYforSinusoidalMovement,Y  ;0B8460|B96584  |0B8465;
                       BNE CODE_0B8445                      ;0B8463|D0E0    |0B8445;
 
startYforSinusoidalMovement: db $68,$84,$62,$73,$94,$79,$81,$A7   ;0B8465|        |      ;
 
startYforSinusoidalMovementSecondQuest: db $58,$74,$42,$63,$24,$49,$31,$47   ;0B846D|        |      ;
 
difficultyModeOffsetsForAbove: db $00,$08                           ;0B8475|        |      ;
 
        enemy_2_ID_40: JSR.W CODE_0B80D5                    ;0B8477|20D580  |0B80D5;
                       CMP.B #$30                           ;0B847A|C930    |      ;
                       BCS CODE_0B8481                      ;0B847C|B003    |0B8481;
                       INC.W $05C1,X                        ;0B847E|FEC105  |0B05C1;
 
          CODE_0B8481: RTS                                  ;0B8481|60      |      ;
 
 
enemyID_shroomFloat_18: LDY.B #$01                           ;0B8482|A001    |      ;
                       LDA.B ($02),Y                        ;0B8484|B102    |000002;
                       STA.W $0606,X                        ;0B8486|9D0606  |0B0606;
                       JSR.W CODE_0B80B3                    ;0B8489|20B380  |0B80B3;
                       CMP.W $0606,X                        ;0B848C|DD0606  |0B0606;
                       BCS CODE_0B8494                      ;0B848F|B003    |0B8494;
 
          CODE_0B8491: INC.W $05C1,X                        ;0B8491|FEC105  |0B05C1;
 
          CODE_0B8494: RTS                                  ;0B8494|60      |      ;
 
 
          enemyID__9A: LDY.B #$01                           ;0B8495|A001    |      ;
                       LDA.B ($02),Y                        ;0B8497|B102    |000002;
                       STA.B $09                            ;0B8499|8509    |000009;
                       INY                                  ;0B849B|C8      |      ;
                       LDA.B ($02),Y                        ;0B849C|B102    |000002;
                       STA.B r_pointerQueue                 ;0B849E|8508    |000008;
                       JSR.W CODE_0B80B3                    ;0B84A0|20B380  |0B80B3;
                       CMP.B $09                            ;0B84A3|C509    |000009;
                       BCS CODE_0B8494                      ;0B84A5|B0ED    |0B8494;
                       JSR.W CODE_0B80D5                    ;0B84A7|20D580  |0B80D5;
                       CMP.B r_pointerQueue                 ;0B84AA|C508    |000008;
                       BCS CODE_0B8494                      ;0B84AC|B0E6    |0B8494;
                       BCC CODE_0B8491                      ;0B84AE|90E1    |0B8491;
 
          CODE_0B84B0: LDX.B r_entityID_processed           ;0B84B0|A66C    |00006C;
 
      enemyID_frog_4E: JSR.W CODE_0B8E36                    ;0B84B2|20368E  |0B8E36;
                       JMP.W clearEnemyID                   ;0B84B5|4C0D81  |0B810D;
 
 
enemyID_boneDragonRip_5C: LDY.B #$04                           ;0B84B8|A004    |      ;
                       LDA.B #$00                           ;0B84BA|A900    |      ;
                       db $20                               ;0B84BC|        |      ;
                       dw UNREACH_0FFC1E                    ;0B84BD|        |0FFC1E;
                       BEQ CODE_0B84C3                      ;0B84BF|F002    |0B84C3;
                       BNE CODE_0B84B0                      ;0B84C1|D0ED    |0B84B0;
 
          CODE_0B84C3: LDX.B r_entityID_processed           ;0B84C3|A66C    |00006C;
                       JMP.W enemyID_fleaMan_1C             ;0B84C5|4C208E  |0B8E20;
 
 
enemyID_shroomFloat_42: JSR.W enemy_2_ID_22                  ;0B84C8|204082  |0B8240;
                       LDA.W $061D,X                        ;0B84CB|BD1D06  |0B061D;
                       CMP.B #$05                           ;0B84CE|C905    |      ;
                       BCC CODE_0B84DA                      ;0B84D0|9008    |0B84DA;
                       LDA.W $04A8,X                        ;0B84D2|BDA804  |0B04A8;
                       EOR.B #$01                           ;0B84D5|4901    |      ;
                       STA.W $04A8,X                        ;0B84D7|9DA804  |0B04A8;
 
          CODE_0B84DA: JSR.W CODE_0B81AA                    ;0B84DA|20AA81  |0B81AA;
                       JSR.W CODE_0B80B3                    ;0B84DD|20B380  |0B80B3;
                       CMP.B #$50                           ;0B84E0|C950    |      ;
                       BCS CODE_0B8505                      ;0B84E2|B021    |0B8505;
                       LDA.W $04A8                          ;0B84E4|ADA804  |0B04A8;
                       CMP.W $04A8,X                        ;0B84E7|DDA804  |0B04A8;
                       BEQ CODE_0B8505                      ;0B84EA|F019    |0B8505;
                       INC.W $061D,X                        ;0B84EC|FE1D06  |0B061D;
                       LDA.B #$1C                           ;0B84EF|A91C    |      ;
                       STA.W $0606,X                        ;0B84F1|9D0606  |0B0606;
                       LDA.B #$FC                           ;0B84F4|A9FC    |      ;
                       LDY.B #$C0                           ;0B84F6|A0C0    |      ;
                       JSR.W CODE_0B8518                    ;0B84F8|201885  |0B8518;
                       LDA.B #$01                           ;0B84FB|A901    |      ;
                       LDY.B #$00                           ;0B84FD|A000    |      ;
 
          CODE_0B84FF: JSR.W CODE_0B8520                    ;0B84FF|202085  |0B8520;
                       JMP.W CODE_0B83DC                    ;0B8502|4CDC83  |0B83DC;
 
 
          CODE_0B8505: LDA.B #$24                           ;0B8505|A924    |      ;
                       STA.W $0606,X                        ;0B8507|9D0606  |0B0606;
                       LDA.B #$FF                           ;0B850A|A9FF    |      ;
                       LDY.B #$00                           ;0B850C|A000    |      ;
                       JSR.W CODE_0B8518                    ;0B850E|201885  |0B8518;
                       LDA.B #$02                           ;0B8511|A902    |      ;
                       LDY.B #$00                           ;0B8513|A000    |      ;
                       JMP.W CODE_0B84FF                    ;0B8515|4CFF84  |0B84FF;
 
 
          CODE_0B8518: STA.W $0520,X                        ;0B8518|9D2005  |0B0520;
                       TYA                                  ;0B851B|98      |      ;
                       STA.W $0537,X                        ;0B851C|9D3705  |0B0537;
                       RTS                                  ;0B851F|60      |      ;
 
 
          CODE_0B8520: STA.W $04F2,X                        ;0B8520|9DF204  |0B04F2;
                       TYA                                  ;0B8523|98      |      ;
                       STA.W $0509,X                        ;0B8524|9D0905  |0B0509;
                       RTS                                  ;0B8527|60      |      ;
 
 
      enemyID_slim_1E: INC.W $05C1,X                        ;0B8528|FEC105  |0B05C1;
                       JSR.W CODE_0B8230                    ;0B852B|203082  |0B8230;
                       JSR.W CODE_0B81AA                    ;0B852E|20AA81  |0B81AA;
                       JSR.W CODE_0B80B3                    ;0B8531|20B380  |0B80B3;
                       CMP.B #$40                           ;0B8534|C940    |      ;
                       BCS CODE_0B8505                      ;0B8536|B0CD    |0B8505;
                       LDA.W $04A8                          ;0B8538|ADA804  |0B04A8;
                       CMP.W $04A8,X                        ;0B853B|DDA804  |0B04A8;
                       BEQ CODE_0B8505                      ;0B853E|F0C5    |0B8505;
                       INC.W $0633,X                        ;0B8540|FE3306  |0B0633;
                       LDA.B #$12                           ;0B8543|A912    |      ;
                       STA.W $0606,X                        ;0B8545|9D0606  |0B0606;
                       LDA.B #$FE                           ;0B8548|A9FE    |      ;
                       LDY.B #$00                           ;0B854A|A000    |      ;
                       JSR.W CODE_0B8518                    ;0B854C|201885  |0B8518;
                       LDA.B #$01                           ;0B854F|A901    |      ;
                       LDY.B #$20                           ;0B8551|A020    |      ;
                       JMP.W CODE_0B84FF                    ;0B8553|4CFF84  |0B84FF;
 
 
  enemyID_moneyBag_88: LDA.W $041C,X                        ;0B8556|BD1C04  |0B041C;
                       CMP.B #$F8                           ;0B8559|C9F8    |      ;
                       BCC enemyID_skeletonSword_20         ;0B855B|900F    |0B856C;
                       LDA.B #$00                           ;0B855D|A900    |      ;
                       STA.W $0400,X                        ;0B855F|9D0004  |0B0400;
                       LDY.B #$01                           ;0B8562|A001    |      ;
                       LDA.B ($02),Y                        ;0B8564|B102    |000002;
                       STA.W $05C1,X                        ;0B8566|9DC105  |0B05C1;
                       db $4C                               ;0B8569|        |      ;
 
                       dw UNREACH_0FFEC8                    ;0B856A|        |0FFEC8;
 
enemyID_skeletonSword_20: LDA.W $0606,X                        ;0B856C|BD0606  |0B0606;
                       JSR.W CODE_0B807F                    ;0B856F|207F80  |0B807F;
                       LDY.B #$04                           ;0B8572|A004    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8574|20A6B7  |0BB7A6;
                       BNE CODE_0B85B2                      ;0B8577|D039    |0B85B2;
                       LDY.B #$02                           ;0B8579|A002    |      ;
                       LDX.B r_entityID_processed           ;0B857B|A66C    |00006C;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B857D|20A6B7  |0BB7A6;
                       BNE CODE_0B85AD                      ;0B8580|D02B    |0B85AD;
                       LDA.W $0520,X                        ;0B8582|BD2005  |0B0520;
                       BMI CODE_0B85AC                      ;0B8585|3025    |0B85AC;
                       LDY.B #$03                           ;0B8587|A003    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8589|20A6B7  |0BB7A6;
                       BEQ CODE_0B85AC                      ;0B858C|F01E    |0B85AC;
                       LDA.W $054E,X                        ;0B858E|BD4E05  |0B054E;
                       CMP.B #$53                           ;0B8591|C953    |      ;
                       BNE CODE_0B859A                      ;0B8593|D005    |0B859A;
                       LDA.B #$0D                           ;0B8595|A90D    |      ;
                       db $20                               ;0B8597|        |      ;
                       dw initFreezWaterEffect_01           ;0B8598|        |0FE25F;
 
          CODE_0B859A: LDX.B r_entityID_processed           ;0B859A|A66C    |00006C;
                       db $20                               ;0B859C|        |      ;
                       dw UNREACH_0FFEC8                    ;0B859D|        |0FFEC8;
                       INC.W $05C1,X                        ;0B859F|FEC105  |0B05C1;
                       LDA.W r_entity_YPos,X                ;0B85A2|BD1C04  |00041C;
                       AND.B #$F0                           ;0B85A5|29F0    |      ;
                       ORA.B #$08                           ;0B85A7|0908    |      ;
                       STA.W r_entity_YPos,X                ;0B85A9|9D1C04  |00041C;
 
          CODE_0B85AC: RTS                                  ;0B85AC|60      |      ;
 
 
          CODE_0B85AD: LDX.B r_entityID_processed           ;0B85AD|A66C    |00006C;
                       JMP.W CODE_0B895E                    ;0B85AF|4C5E89  |0B895E;
 
 
          CODE_0B85B2: LDX.B r_entityID_processed           ;0B85B2|A66C    |00006C;
                       LDA.W r_entity_YposSpeed,X           ;0B85B4|BD2005  |000520;
                       BPL CODE_0B85AC                      ;0B85B7|10F3    |0B85AC;
                       JMP.W CODE_0B805D                    ;0B85B9|4C5D80  |0B805D;
 
 
        enemy_2_ID_14: LDA.W $0606,X                        ;0B85BC|BD0606  |0B0606;
                       JSR.W CODE_0B807F                    ;0B85BF|207F80  |0B807F;
                       LDA.W $0520,X                        ;0B85C2|BD2005  |0B0520;
                       BMI CODE_0B85E7                      ;0B85C5|3020    |0B85E7;
                       LDA.B #$16                           ;0B85C7|A916    |      ;
                       STA.W $0400,X                        ;0B85C9|9D0004  |0B0400;
                       LDY.B #$08                           ;0B85CC|A008    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B85CE|20A6B7  |0BB7A6;
                       BEQ CODE_0B85E7                      ;0B85D1|F014    |0B85E7;
                       CMP.B #$01                           ;0B85D3|C901    |      ;
                       BEQ CODE_0B85E4                      ;0B85D5|F00D    |0B85E4;
                       LDA.B #$02                           ;0B85D7|A902    |      ;
                       STA.W $061D,X                        ;0B85D9|9D1D06  |0B061D;
                       LDA.B #$14                           ;0B85DC|A914    |      ;
                       STA.W $05C1,X                        ;0B85DE|9DC105  |0B05C1;
                       JMP.W CODE_0B85FE                    ;0B85E1|4CFE85  |0B85FE;
 
 
          CODE_0B85E4: INC.W $05C1,X                        ;0B85E4|FEC105  |0B05C1;
 
          CODE_0B85E7: RTS                                  ;0B85E7|60      |      ;
 
 
      enemyID_bone_B8: LDA.W $0606,X                        ;0B85E8|BD0606  |0B0606;
                       JSR.W CODE_0B807F                    ;0B85EB|207F80  |0B807F;
                       LDA.W $0520,X                        ;0B85EE|BD2005  |0B0520;
                       BMI CODE_0B85AC                      ;0B85F1|30B9    |0B85AC;
                       LDY.B #$08                           ;0B85F3|A008    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B85F5|20A6B7  |0BB7A6;
                       BEQ CODE_0B85AC                      ;0B85F8|F0B2    |0B85AC;
                       CMP.B #$01                           ;0B85FA|C901    |      ;
                       BEQ CODE_0B861A                      ;0B85FC|F01C    |0B861A;
 
          CODE_0B85FE: CLC                                  ;0B85FE|18      |      ;
                       LDA.W $041C,X                        ;0B85FF|BD1C04  |0B041C;
                       AND.B #$F0                           ;0B8602|29F0    |      ;
                       ADC.B #$08                           ;0B8604|6908    |      ;
                       STA.W $041C,X                        ;0B8606|9D1C04  |0B041C;
                       INC.W $05C1,X                        ;0B8609|FEC105  |0B05C1;
 
          CODE_0B860C: INC.W $05C1,X                        ;0B860C|FEC105  |0B05C1;
                       LDA.B #$14                           ;0B860F|A914    |      ;
                       STA.W $0400,X                        ;0B8611|9D0004  |0B0400;
                       JSR.W CODE_0B819E                    ;0B8614|209E81  |0B819E;
                       db $4C                               ;0B8617|        |      ;
 
                       dw UNREACH_0FFEC8                    ;0B8618|        |0FFEC8;
 
          CODE_0B861A: CLC                                  ;0B861A|18      |      ;
                       LDA.W $041C,X                        ;0B861B|BD1C04  |0B041C;
                       AND.B #$F0                           ;0B861E|29F0    |      ;
                       ADC.B #$10                           ;0B8620|6910    |      ;
                       STA.W $041C,X                        ;0B8622|9D1C04  |0B041C;
                       JMP.W CODE_0B860C                    ;0B8625|4C0C86  |0B860C;
 
                       LDX.B r_entityID_processed           ;0B8628|A66C    |00006C;
                       LDA.W $0520,X                        ;0B862A|BD2005  |0B0520;
                       BMI CODE_0B863D                      ;0B862D|300E    |0B863D;
                       CMP.B #$02                           ;0B862F|C902    |      ;
                       BCC CODE_0B863D                      ;0B8631|900A    |0B863D;
                       LDA.B #$02                           ;0B8633|A902    |      ;
                       STA.W $0520,X                        ;0B8635|9D2005  |0B0520;
                       LDA.B #$00                           ;0B8638|A900    |      ;
                       STA.W $0537,X                        ;0B863A|9D3705  |0B0537;
 
          CODE_0B863D: RTS                                  ;0B863D|60      |      ;
 
 
        enemy_2_ID_52: LDY.B #$01                           ;0B863E|A001    |      ;
                       LDA.B ($02),Y                        ;0B8640|B102    |000002;
                       CMP.W $041C,X                        ;0B8642|DD1C04  |0B041C;
                       BCS CODE_0B863D                      ;0B8645|B0F6    |0B863D;
                       JMP.W enemyID_frog_4E                ;0B8647|4CB284  |0B84B2;
 
 
          enemyID__E6: INC.W $05C1,X                        ;0B864A|FEC105  |0B05C1;
                       LDA.B #$00                           ;0B864D|A900    |      ;
                       STA.W $0633,X                        ;0B864F|9D3306  |0B0633;
                       LDA.W $041C,X                        ;0B8652|BD1C04  |0B041C;
                       STA.W $0606,X                        ;0B8655|9D0606  |0B0606;
                       JMP.W CODE_0B86AC                    ;0B8658|4CAC86  |0B86AC;
 
 
 enemyID_spiderweb_B0: LDY.B #$03                           ;0B865B|A003    |      ;
                       LDA.B ($02),Y                        ;0B865D|B102    |000002;
                       STA.W $061D,X                        ;0B865F|9D1D06  |0B061D;
 
 enemyID_axeKnight_22: INC.W $05C1,X                        ;0B8662|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B8665|A001    |      ;
                       LDA.B ($02),Y                        ;0B8667|B102    |000002;
                       TAY                                  ;0B8669|A8      |      ;
                       LDA.W DATA8_0B8682,Y                 ;0B866A|B98286  |0B8682;
                       STA.W $0520,X                        ;0B866D|9D2005  |0B0520;
                       LDA.W DATA8_0B868A,Y                 ;0B8670|B98A86  |0B868A;
                       STA.W $0537,X                        ;0B8673|9D3705  |0B0537;
                       LDY.B #$02                           ;0B8676|A002    |      ;
                       CLC                                  ;0B8678|18      |      ;
                       LDA.W $041C,X                        ;0B8679|BD1C04  |0B041C;
                       ADC.B ($02),Y                        ;0B867C|7102    |000002;
                       STA.W $0606,X                        ;0B867E|9D0606  |0B0606;
                       RTS                                  ;0B8681|60      |      ;
 
 
         DATA8_0B8682: db $FE,$FE,$FE,$FF,$FF,$FF,$FF,$02   ;0B8682|        |      ;
 
         DATA8_0B868A: db $00,$80,$C0,$00,$40,$F0,$A0,$00   ;0B868A|        |      ;
 
         DATA8_0B8692: db $FF,$01,$FD,$04,$FF,$01           ;0B8692|        |      ;
 
         DATA8_0B8698: db $00,$C0,$00,$C0,$00,$C0           ;0B8698|        |      ;
 
         DATA8_0B869E: db $3F,$27,$3C,$1D,$3F,$27           ;0B869E|        |      ;
 
          enemyID__E8: db $DE,$1D,$06,$D0,$22,$FE,$33,$06   ;0B86A4|        |      ;
 
          CODE_0B86AC: LDY.W $0633,X                        ;0B86AC|BC3306  |0B0633;
                       LDA.W DATA8_0B8692,Y                 ;0B86AF|B99286  |0B8692;
                       STA.W $0520,X                        ;0B86B2|9D2005  |0B0520;
                       LDA.W DATA8_0B8698,Y                 ;0B86B5|B99886  |0B8698;
                       STA.W $0537,X                        ;0B86B8|9D3705  |0B0537;
                       LDA.W DATA8_0B869E,Y                 ;0B86BB|B99E86  |0B869E;
                       STA.W $061D,X                        ;0B86BE|9D1D06  |0B061D;
                       RTS                                  ;0B86C1|60      |      ;
 
 
  enemyID_fireball_B2: DEC.W $061D,X                        ;0B86C2|DE1D06  |0B061D;
                       BNE enemyID_bonePillar3_24           ;0B86C5|D004    |0B86CB;
                       INC.W $05C1,X                        ;0B86C7|FEC105  |0B05C1;
                       RTS                                  ;0B86CA|60      |      ;
 
 
enemyID_bonePillar3_24: LDA.B r_roomOrientation              ;0B86CB|A568    |000068;
                       BPL CODE_0B86D8                      ;0B86CD|1009    |0B86D8;
                       CLC                                  ;0B86CF|18      |      ;
                       LDA.W $0606,X                        ;0B86D0|BD0606  |0B0606;
                       ADC.B r_scrollSpd                    ;0B86D3|656E    |00006E;
                       STA.W $0606,X                        ;0B86D5|9D0606  |0B0606;
 
          CODE_0B86D8: LDA.W $041C,X                        ;0B86D8|BD1C04  |0B041C;
                       SEC                                  ;0B86DB|38      |      ;
                       SBC.W $0606,X                        ;0B86DC|FD0606  |0B0606;
                       LDY.B #$00                           ;0B86DF|A000    |      ;
                       BCS CODE_0B86E4                      ;0B86E1|B001    |0B86E4;
                       DEY                                  ;0B86E3|88      |      ;
 
          CODE_0B86E4: STY.B $01                            ;0B86E4|8401    |000001;
                       STA.B $00                            ;0B86E6|8500    |000000;
 
          CODE_0B86E8: LDA.W $0537,X                        ;0B86E8|BD3705  |0B0537;
                       SEC                                  ;0B86EB|38      |      ;
                       SBC.B $00                            ;0B86EC|E500    |000000;
                       STA.W $0537,X                        ;0B86EE|9D3705  |0B0537;
                       LDA.W $0520,X                        ;0B86F1|BD2005  |0B0520;
                       SBC.B $01                            ;0B86F4|E501    |000001;
                       STA.W $0520,X                        ;0B86F6|9D2005  |0B0520;
                       RTS                                  ;0B86F9|60      |      ;
 
 
        enemy_2_ID_3A: LDA.B #$01                           ;0B86FA|A901    |      ;
                       STA.W $061D,X                        ;0B86FC|9D1D06  |0B061D;
                       JSR.W enemyID_axeKnight_22           ;0B86FF|206286  |0B8662;
 
        enemy_2_ID_3C: LDA.B r_roomOrientation              ;0B8702|A568    |000068;
                       BPL CODE_0B86D8                      ;0B8704|10D2    |0B86D8;
                       SEC                                  ;0B8706|38      |      ;
                       LDA.W $041C,X                        ;0B8707|BD1C04  |0B041C;
                       SBC.W $0606,X                        ;0B870A|FD0606  |0B0606;
                       STA.B $00                            ;0B870D|8500    |000000;
                       LDA.B #$01                           ;0B870F|A901    |      ;
                       SBC.W $061D,X                        ;0B8711|FD1D06  |0B061D;
                       STA.B $01                            ;0B8714|8501    |000001;
                       JMP.W CODE_0B86E8                    ;0B8716|4CE886  |0B86E8;
 
 
        enemy_2_ID_48: INC.W $05C1,X                        ;0B8719|FEC105  |0B05C1;
                       LDA.B #$00                           ;0B871C|A900    |      ;
                       LDY.W $041C,X                        ;0B871E|BC1C04  |0B041C;
                       BMI CODE_0B8725                      ;0B8721|3002    |0B8725;
                       LDA.B #$04                           ;0B8723|A904    |      ;
 
          CODE_0B8725: STA.W $0645,X                        ;0B8725|9D4506  |0B0645;
                       JSR.W CODE_0B873F                    ;0B8728|203F87  |0B873F;
                       LDA.B #$01                           ;0B872B|A901    |      ;
                       STA.W $0633,X                        ;0B872D|9D3306  |0B0633;
                       STA.W $061D,X                        ;0B8730|9D1D06  |0B061D;
                       LDA.W $041C,X                        ;0B8733|BD1C04  |0B041C;
                       STA.W $0606,X                        ;0B8736|9D0606  |0B0606;
                       RTS                                  ;0B8739|60      |      ;
 
 
        enemy_2_ID_4A: DEC.W $0633,X                        ;0B873A|DE3306  |0B0633;
                       BNE enemy_2_ID_3C                    ;0B873D|D0C3    |0B8702;
 
          CODE_0B873F: LDA.B r_RNG                          ;0B873F|A51F    |00001F;
                       AND.B #$03                           ;0B8741|2903    |      ;
                       CLC                                  ;0B8743|18      |      ;
                       ADC.W $0645,X                        ;0B8744|7D4506  |0B0645;
                       TAY                                  ;0B8747|A8      |      ;
                       LDA.W DATA8_0B875B,Y                 ;0B8748|B95B87  |0B875B;
                       STA.W $0520,X                        ;0B874B|9D2005  |0B0520;
                       LDA.W DATA8_0B8763,Y                 ;0B874E|B96387  |0B8763;
                       STA.W $0537,X                        ;0B8751|9D3705  |0B0537;
                       LDA.W DATA8_0B876B,Y                 ;0B8754|B96B87  |0B876B;
                       STA.W $0633,X                        ;0B8757|9D3306  |0B0633;
                       RTS                                  ;0B875A|60      |      ;
 
 
         DATA8_0B875B: db $FE,$FC,$FF,$FD,$02,$03,$01,$02   ;0B875B|        |      ;
 
         DATA8_0B8763: db $00,$80,$00,$80,$00,$80,$00,$80   ;0B8763|        |      ;
 
         DATA8_0B876B: db $3F,$4C,$1B,$28,$3F,$4C,$1B,$28   ;0B876B|        |      ;
 
       enemyID_bat_DE: LDY.B #$01                           ;0B8773|A001    |      ;
                       LDA.B ($02),Y                        ;0B8775|B102    |000002;
                       TAY                                  ;0B8777|A8      |      ;
                       LDA.W DATA8_0B878F,Y                 ;0B8778|B98F87  |0B878F;
                       STA.W $0520,X                        ;0B877B|9D2005  |0B0520;
                       LDA.W DATA8_0B8791,Y                 ;0B877E|B99187  |0B8791;
                       STA.W $0537,X                        ;0B8781|9D3705  |0B0537;
                       LDY.B #$02                           ;0B8784|A002    |      ;
                       LDA.B ($02),Y                        ;0B8786|B102    |000002;
                       STA.W $0606,X                        ;0B8788|9D0606  |0B0606;
 
          CODE_0B878B: INC.W $05C1,X                        ;0B878B|FEC105  |0B05C1;
                       RTS                                  ;0B878E|60      |      ;
 
 
         DATA8_0B878F: db $01,$00                           ;0B878F|        |      ;
 
         DATA8_0B8791: db $80,$00                           ;0B8791|        |      ;
 
 
          enemyID__E0: DEC.W $0606,X                        ;0B8793|DE0606  |0B0606;
                       BEQ CODE_0B878B                      ;0B8796|F0F3    |0B878B;
                       LDY.B #$01                           ;0B8798|A001    |      ;
                       LDA.B ($02),Y                        ;0B879A|B102    |000002;
                       JMP.W CODE_0B80A1                    ;0B879C|4CA180  |0B80A1;
 
 
       enemyID_bat_CE: LDA.B r_gameStateLoopCounter         ;0B879F|A51A    |00001A;
                       AND.B #$01                           ;0B87A1|2901    |      ;
                       BNE CODE_0B87AD                      ;0B87A3|D008    |0B87AD;
                       LDA.W $0470,X                        ;0B87A5|BD7004  |0B0470;
                       EOR.B #$08                           ;0B87A8|4908    |      ;
                       STA.W $0470,X                        ;0B87AA|9D7004  |0B0470;
 
          CODE_0B87AD: JSR.W CODE_0B80B3                    ;0B87AD|20B380  |0B80B3;
                       CMP.B #$40                           ;0B87B0|C940    |      ;
                       LDY.W $0606,X                        ;0B87B2|BC0606  |0B0606;
                       BNE CODE_0B87BA                      ;0B87B5|D003    |0B87BA;
                       BCC CODE_0B87BC                      ;0B87B7|9003    |0B87BC;
                       RTS                                  ;0B87B9|60      |      ;
 
 
          CODE_0B87BA: BCC CODE_0B87BF                      ;0B87BA|9003    |0B87BF;
 
          CODE_0B87BC: INC.W $05C1,X                        ;0B87BC|FEC105  |0B05C1;
 
          CODE_0B87BF: RTS                                  ;0B87BF|60      |      ;
 
                       JMP.W enemyID_fireball_B2            ;0B87C0|4CC286  |0B86C2;
 
 
    enemyID_embers_C0: JSR.W enemyID_fireball_B2            ;0B87C3|20C286  |0B86C2;
                       LDY.B #$0A                           ;0B87C6|A00A    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B87C8|20A6B7  |0BB7A6;
                       BNE CODE_0B87DC                      ;0B87CB|D00F    |0B87DC;
                       LDX.B r_entityID_processed           ;0B87CD|A66C    |00006C;
                       db $20                               ;0B87CF|        |      ;
                       dw UNREACH_0FFEC8                    ;0B87D0|        |0FFEC8;
                       LDA.B #$01                           ;0B87D2|A901    |      ;
                       STA.W $0520,X                        ;0B87D4|9D2005  |0B0520;
                       LDA.B #$16                           ;0B87D7|A916    |      ;
                       STA.W $05C1,X                        ;0B87D9|9DC105  |0B05C1;
 
          CODE_0B87DC: LDX.B r_entityID_processed           ;0B87DC|A66C    |00006C;
                       RTS                                  ;0B87DE|60      |      ;
 
 
enemyID_thunderStorm_C2: LDA.B #$14                           ;0B87DF|A914    |      ;
                       JSR.W CODE_0B807F                    ;0B87E1|207F80  |0B807F;
                       LDY.B #$01                           ;0B87E4|A001    |      ;
                       LDA.B ($02),Y                        ;0B87E6|B102    |000002;
                       STA.W $0606,X                        ;0B87E8|9D0606  |0B0606;
                       INY                                  ;0B87EB|C8      |      ;
                       LDA.B ($02),Y                        ;0B87EC|B102    |000002;
                       TAY                                  ;0B87EE|A8      |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B87EF|20A6B7  |0BB7A6;
                       BEQ CODE_0B87DC                      ;0B87F2|F0E8    |0B87DC;
                       LDX.B r_entityID_processed           ;0B87F4|A66C    |00006C;
                       LDA.W $0606,X                        ;0B87F6|BD0606  |0B0606;
                       STA.W $05C1,X                        ;0B87F9|9DC105  |0B05C1;
                       RTS                                  ;0B87FC|60      |      ;
 
 
          enemyID__C6: INC.W $05C1,X                        ;0B87FD|FEC105  |0B05C1;
                       db $20                               ;0B8800|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8801|        |0FFEC8;
                       LDY.B #$01                           ;0B8803|A001    |      ;
                       LDA.B ($02),Y                        ;0B8805|B102    |000002;
                       STA.W $0520,X                        ;0B8807|9D2005  |0B0520;
                       INY                                  ;0B880A|C8      |      ;
                       LDA.B ($02),Y                        ;0B880B|B102    |000002;
                       STA.W $0606,X                        ;0B880D|9D0606  |0B0606;
                       RTS                                  ;0B8810|60      |      ;
 
 
        enemy_2_ID_30: INC.W $05C1,X                        ;0B8811|FEC105  |0B05C1;
                       db $20                               ;0B8814|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8815|        |0FFEC8;
                       LDY.B #$01                           ;0B8817|A001    |      ;
                       LDA.B ($02),Y                        ;0B8819|B102    |000002;
                       BNE CODE_0B8870                      ;0B881B|D053    |0B8870;
                       LDY.B #$00                           ;0B881D|A000    |      ;
                       SEC                                  ;0B881F|38      |      ;
                       LDA.B r_floodHight                   ;0B8820|A5CA    |0000CA;
                       SBC.W $041C                          ;0B8822|ED1C04  |0B041C;
                       BCS CODE_0B882B                      ;0B8825|B004    |0B882B;
                       EOR.B #$FF                           ;0B8827|49FF    |      ;
                       ADC.B #$01                           ;0B8829|6901    |      ;
 
          CODE_0B882B: CMP.B #$38                           ;0B882B|C938    |      ;
                       BCC CODE_0B883F                      ;0B882D|9010    |0B883F;
                       INY                                  ;0B882F|C8      |      ;
                       CMP.B #$48                           ;0B8830|C948    |      ;
                       BCC CODE_0B883F                      ;0B8832|900B    |0B883F;
                       INY                                  ;0B8834|C8      |      ;
                       CMP.B #$58                           ;0B8835|C958    |      ;
                       BCC CODE_0B883F                      ;0B8837|9006    |0B883F;
                       INY                                  ;0B8839|C8      |      ;
                       CMP.B #$68                           ;0B883A|C968    |      ;
                       BCC CODE_0B883F                      ;0B883C|9001    |0B883F;
                       INY                                  ;0B883E|C8      |      ;
 
          CODE_0B883F: LDA.W DATA8_0B8884,Y                 ;0B883F|B98488  |0B8884;
                       STA.W $0537,X                        ;0B8842|9D3705  |0B0537;
                       LDA.W DATA8_0B887F,Y                 ;0B8845|B97F88  |0B887F;
                       STA.W $0520,X                        ;0B8848|9D2005  |0B0520;
                       LDA.W $0438,X                        ;0B884B|BD3804  |0B0438;
                       LDY.W $041C,X                        ;0B884E|BC1C04  |0B041C;
                       db $20                               ;0B8851|        |      ;
                       dw UNREACH_0FFC1E                    ;0B8852|        |0FFC1E;
                       BNE CODE_0B8876                      ;0B8854|D020    |0B8876;
                       LDX.B r_entityID_processed           ;0B8856|A66C    |00006C;
                       LDA.B #$22                           ;0B8858|A922    |      ;
                       db $20                               ;0B885A|        |      ;
                       dw initFreezWaterEffect_01           ;0B885B|        |0FE25F;
                       JSR.W CODE_0B81AA                    ;0B885D|20AA81  |0B81AA;
                       JSR.W CODE_0B8230                    ;0B8860|203082  |0B8230;
                       LDA.B #$08                           ;0B8863|A908    |      ;
                       STA.W $048C,X                        ;0B8865|9D8C04  |0B048C;
                       LDA.B #$46                           ;0B8868|A946    |      ;
                       STA.W $0400,X                        ;0B886A|9D0004  |0B0400;
                       JMP.W CODE_0B81EF                    ;0B886D|4CEF81  |0B81EF;
 
 
          CODE_0B8870: LDA.B #$FF                           ;0B8870|A9FF    |      ;
                       STA.W $0520,X                        ;0B8872|9D2005  |0B0520;
                       RTS                                  ;0B8875|60      |      ;
 
 
          CODE_0B8876: LDX.B r_entityID_processed           ;0B8876|A66C    |00006C;
                       JSR.W CODE_0BB584                    ;0B8878|2084B5  |0BB584;
                       STA.W $054E,X                        ;0B887B|9D4E05  |0B054E;
                       RTS                                  ;0B887E|60      |      ;
 
 
         DATA8_0B887F: db $FC,$FB,$FB,$FB,$FA               ;0B887F|        |      ;
 
         DATA8_0B8884: db $40,$C0,$80,$40,$80               ;0B8884|        |      ;
 
 
        enemy_2_ID_34: LDA.B #$20                           ;0B8889|A920    |      ;
                       JSR.W CODE_0B807F                    ;0B888B|207F80  |0B807F;
                       LDY.B #$01                           ;0B888E|A001    |      ;
                       LDA.B ($02),Y                        ;0B8890|B102    |000002;
                       BEQ CODE_0B88A7                      ;0B8892|F013    |0B88A7;
                       SEC                                  ;0B8894|38      |      ;
                       LDA.W $041C,X                        ;0B8895|BD1C04  |0B041C;
                       SBC.B #$10                           ;0B8898|E910    |      ;
                       CMP.B r_floodHight                   ;0B889A|C5CA    |0000CA;
                       BCC CODE_0B88A6                      ;0B889C|9008    |0B88A6;
                       INC.W $05C1,X                        ;0B889E|FEC105  |0B05C1;
                       JSR.W CODE_0B992B                    ;0B88A1|202B99  |0B992B;
                       LDX.B r_entityID_processed           ;0B88A4|A66C    |00006C;
 
          CODE_0B88A6: RTS                                  ;0B88A6|60      |      ;
 
 
          CODE_0B88A7: LDA.W $0520,X                        ;0B88A7|BD2005  |0B0520;
                       BMI CODE_0B88A6                      ;0B88AA|30FA    |0B88A6;
                       LDY.B #$06                           ;0B88AC|A006    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B88AE|20A6B7  |0BB7A6;
                       BEQ CODE_0B88BC                      ;0B88B1|F009    |0B88BC;
 
          CODE_0B88B3: INC.W $05C1,X                        ;0B88B3|FEC105  |0B05C1;
                       JSR.W CODE_0B8B95                    ;0B88B6|20958B  |0B8B95;
                       db $4C                               ;0B88B9|        |      ;
 
                       dw UNREACH_0FFEC8                    ;0B88BA|        |0FFEC8;
 
          CODE_0B88BC: SEC                                  ;0B88BC|38      |      ;
                       LDA.W $041C,X                        ;0B88BD|BD1C04  |0B041C;
                       SBC.B #$10                           ;0B88C0|E910    |      ;
                       CMP.B r_floodHight                   ;0B88C2|C5CA    |0000CA;
                       BCC CODE_0B88A6                      ;0B88C4|90E0    |0B88A6;
                       JSR.W CODE_0B992B                    ;0B88C6|202B99  |0B992B;
                       JMP.W enemyID_frog_4E                ;0B88C9|4CB284  |0B84B2;
 
 
       enemyID_owl_C8: LDA.W $0606,X                        ;0B88CC|BD0606  |0B0606;
                       JSR.W CODE_0B807F                    ;0B88CF|207F80  |0B807F;
                       LDY.B #$01                           ;0B88D2|A001    |      ;
                       LDA.B ($02),Y                        ;0B88D4|B102    |000002;
                       CMP.B #$01                           ;0B88D6|C901    |      ;
                       BEQ CODE_0B8909                      ;0B88D8|F02F    |0B8909;
                       CMP.B #$02                           ;0B88DA|C902    |      ;
                       BEQ CODE_0B8914                      ;0B88DC|F036    |0B8914;
                       LDY.W $0520,X                        ;0B88DE|BC2005  |0B0520;
                       BMI CODE_0B8913                      ;0B88E1|3030    |0B8913;
                       CMP.B #$03                           ;0B88E3|C903    |      ;
                       BNE CODE_0B88FD                      ;0B88E5|D016    |0B88FD;
                       LDY.B #$00                           ;0B88E7|A000    |      ;
                       LDA.B r_stage                        ;0B88E9|A532    |000032;
                       CMP.B #$08                           ;0B88EB|C908    |      ;
                       BNE CODE_0B88F5                      ;0B88ED|D006    |0B88F5;
                       INY                                  ;0B88EF|C8      |      ;
                       LDA.B r_blockLevel                   ;0B88F0|A533    |000033;
                       BNE CODE_0B88F5                      ;0B88F2|D001    |0B88F5;
                       INY                                  ;0B88F4|C8      |      ;
 
          CODE_0B88F5: LDA.W $041C,X                        ;0B88F5|BD1C04  |0B041C;
                       CMP.W DATA8_0B8937,Y                 ;0B88F8|D93789  |0B8937;
                       BCS CODE_0B892B                      ;0B88FB|B02E    |0B892B;
 
          CODE_0B88FD: LDY.B #$06                           ;0B88FD|A006    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B88FF|20A6B7  |0BB7A6;
                       BEQ CODE_0B8913                      ;0B8902|F00F    |0B8913;
                       LDX.B r_entityID_processed           ;0B8904|A66C    |00006C;
                       JMP.W CODE_0B88B3                    ;0B8906|4CB388  |0B88B3;
 
 
          CODE_0B8909: LDA.W $041C,X                        ;0B8909|BD1C04  |0B041C;
                       CMP.B #$F8                           ;0B890C|C9F8    |      ;
                       BCC CODE_0B8913                      ;0B890E|9003    |0B8913;
                       INC.W $05C1,X                        ;0B8910|FEC105  |0B05C1;
 
          CODE_0B8913: RTS                                  ;0B8913|60      |      ;
 
 
          CODE_0B8914: LDY.B #$00                           ;0B8914|A000    |      ;
                       LDA.B r_stage                        ;0B8916|A532    |000032;
                       CMP.B #$08                           ;0B8918|C908    |      ;
                       BEQ CODE_0B891D                      ;0B891A|F001    |0B891D;
                       INY                                  ;0B891C|C8      |      ;
 
          CODE_0B891D: LDA.W $041C,X                        ;0B891D|BD1C04  |0B041C;
                       CMP.W DATA8_0B8935,Y                 ;0B8920|D93589  |0B8935;
                       BCC CODE_0B8913                      ;0B8923|90EE    |0B8913;
                       INC.W $05C1,X                        ;0B8925|FEC105  |0B05C1;
                       JMP.W CODE_0B992B                    ;0B8928|4C2B99  |0B992B;
 
 
          CODE_0B892B: LDY.B #$02                           ;0B892B|A002    |      ;
                       LDA.B ($02),Y                        ;0B892D|B102    |000002;
                       STA.W $05C1,X                        ;0B892F|9DC105  |0B05C1;
                       JMP.W CODE_0B992B                    ;0B8932|4C2B99  |0B992B;
 
 
         DATA8_0B8935: db $B0,$D0                           ;0B8935|        |      ;
 
         DATA8_0B8937: db $D0,$C0,$B0                       ;0B8937|        |      ;
 
    enemyID_splash_38: LDY.B #$01                           ;0B893A|A001    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B893C|20A6B7  |0BB7A6;
                       BNE CODE_0B8957                      ;0B893F|D016    |0B8957;
                       LDX.B r_entityID_processed           ;0B8941|A66C    |00006C;
                       LDY.B #$06                           ;0B8943|A006    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8945|20A6B7  |0BB7A6;
                       BNE CODE_0B8957                      ;0B8948|D00D    |0B8957;
                       LDX.B r_entityID_processed           ;0B894A|A66C    |00006C;
                       INC.W $05C1,X                        ;0B894C|FEC105  |0B05C1;
                       db $20                               ;0B894F|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8950|        |0FFEC8;
                       LDA.B #$01                           ;0B8952|A901    |      ;
                       STA.W $0520,X                        ;0B8954|9D2005  |0B0520;
 
          CODE_0B8957: LDY.B #$00                           ;0B8957|A000    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8959|20A6B7  |0BB7A6;
                       BEQ CODE_0B8969                      ;0B895C|F00B    |0B8969;
 
          CODE_0B895E: LDA.W $04A8,X                        ;0B895E|BDA804  |0B04A8;
                       EOR.B #$01                           ;0B8961|4901    |      ;
                       STA.W $04A8,X                        ;0B8963|9DA804  |0B04A8;
                       JMP.W CODE_0B804B                    ;0B8966|4C4B80  |0B804B;
 
 
          CODE_0B8969: LDA.W $05EF,X                        ;0B8969|BDEF05  |0B05EF;
                       CMP.B #$02                           ;0B896C|C902    |      ;
                       BNE CODE_0B897D                      ;0B896E|D00D    |0B897D;
                       LDX.B r_entityID_processed           ;0B8970|A66C    |00006C;
                       DEC.W $0606,X                        ;0B8972|DE0606  |0B0606;
                       BNE CODE_0B897D                      ;0B8975|D006    |0B897D;
                       INC.W $05C1,X                        ;0B8977|FEC105  |0B05C1;
                       INC.W $05C1,X                        ;0B897A|FEC105  |0B05C1;
 
          CODE_0B897D: RTS                                  ;0B897D|60      |      ;
 
 
enemyID_headlessKnight_3A: LDY.B #$01                           ;0B897E|A001    |      ;
                       LDA.B ($02),Y                        ;0B8980|B102    |000002;
                       STA.W $0606,X                        ;0B8982|9D0606  |0B0606;
                       INY                                  ;0B8985|C8      |      ;
                       LDA.B ($02),Y                        ;0B8986|B102    |000002;
                       TAY                                  ;0B8988|A8      |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8989|20A6B7  |0BB7A6;
                       BEQ CODE_0B89A5                      ;0B898C|F017    |0B89A5;
                       LDX.B r_entityID_processed           ;0B898E|A66C    |00006C;
                       db $20                               ;0B8990|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8991|        |0FFEC8;
                       JSR.W CODE_0B81F8                    ;0B8993|20F881  |0B81F8;
                       LDA.W $041C,X                        ;0B8996|BD1C04  |0B041C;
                       AND.B #$F0                           ;0B8999|29F0    |      ;
                       STA.W $041C,X                        ;0B899B|9D1C04  |0B041C;
                       LDA.W $0606,X                        ;0B899E|BD0606  |0B0606;
                       STA.W $05C1,X                        ;0B89A1|9DC105  |0B05C1;
                       RTS                                  ;0B89A4|60      |      ;
 
 
          CODE_0B89A5: LDX.B r_entityID_processed           ;0B89A5|A66C    |00006C;
                       LDA.B #$14                           ;0B89A7|A914    |      ;
                       JMP.W CODE_0B807F                    ;0B89A9|4C7F80  |0B807F;
 
 
enemyID_skeletonBone_12: JSR.W CODE_0B81EC                    ;0B89AC|20EC81  |0B81EC;
                       LDA.B r_gameStateLoopCounter         ;0B89AF|A51A    |00001A;
                       ADC.W $0438,X                        ;0B89B1|7D3804  |0B0438;
                       AND.B #$07                           ;0B89B4|2907    |      ;
                       STA.B $00                            ;0B89B6|8500    |000000;
                       LDA.B r_blockLevel                   ;0B89B8|A533    |000033;
                       BEQ CODE_0B89BE                      ;0B89BA|F002    |0B89BE;
                       LDA.B #$01                           ;0B89BC|A901    |      ;
 
          CODE_0B89BE: CLC                                  ;0B89BE|18      |      ;
                       ADC.W $07F6                          ;0B89BF|6DF607  |0B07F6;
                       TAY                                  ;0B89C2|A8      |      ;
                       LDA.W DATA8_0B89F5,Y                 ;0B89C3|B9F589  |0B89F5;
                       ADC.B $00                            ;0B89C6|6500    |000000;
                       TAY                                  ;0B89C8|A8      |      ;
                       LDA.W DATA8_0B89DD,Y                 ;0B89C9|B9DD89  |0B89DD;
                       ADC.W $0438                          ;0B89CC|6D3804  |0B0438;
                       STA.W $0438,X                        ;0B89CF|9D3804  |0B0438;
                       LDA.W $05EF,X                        ;0B89D2|BDEF05  |0B05EF;
                       CMP.B #$14                           ;0B89D5|C914    |      ;
                       BEQ DATA8_0B89DC                     ;0B89D7|F003    |0B89DC;
                       JMP.W CODE_0B81D4                    ;0B89D9|4CD481  |0B81D4;
 
 
         DATA8_0B89DC: db $60                               ;0B89DC|        |      ;
 
 
         DATA8_0B89DD: db $68,$A0,$68,$88,$98,$78,$90,$70   ;0B89DD|        |      ;
                       db $58,$4C,$48,$A0,$5C,$60,$C0,$50   ;0B89E5|        |      ;
                       db $30,$D8,$38,$40,$38,$44,$C0,$2C   ;0B89ED|        |      ;
 
         DATA8_0B89F5: db $00,$08,$10                       ;0B89F5|        |      ;
 
enemyID_skeletonRedWhip_44: INC.W $05C1,X                        ;0B89F8|FEC105  |0B05C1;
                       LDA.B r_gameStateLoopCounter         ;0B89FB|A51A    |00001A;
                       ADC.W $0438                          ;0B89FD|6D3804  |0B0438;
                       AND.B #$07                           ;0B8A00|2907    |      ;
                       STA.B r_index                        ;0B8A02|8510    |000010;
                       LDY.B #$01                           ;0B8A04|A001    |      ;
                       LDA.B ($02),Y                        ;0B8A06|B102    |000002;
                       CLC                                  ;0B8A08|18      |      ;
                       ADC.B r_index                        ;0B8A09|6510    |000010;
                       TAY                                  ;0B8A0B|A8      |      ;
                       LDA.W DATA8_0B8A16,Y                 ;0B8A0C|B9168A  |0B8A16;
                       ADC.W $0438                          ;0B8A0F|6D3804  |0B0438;
                       STA.W $0438,X                        ;0B8A12|9D3804  |0B0438;
                       RTS                                  ;0B8A15|60      |      ;
 
 
         DATA8_0B8A16: db $40,$D0,$70,$90,$60,$C0,$50,$A0   ;0B8A16|        |      ;
 
                       db $40,$20,$E0,$D0,$10,$F0,$50,$70   ;0B8A1E|        |      ;
 
        enemy_2_ID_50: JSR.W CODE_0B81EF                    ;0B8A26|20EF81  |0B81EF;
 
    enemyID_mudMan_4C: INC.W $05C1,X                        ;0B8A29|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B8A2C|A001    |      ;
                       LDA.B ($02),Y                        ;0B8A2E|B102    |000002;
                       STA.W $061D,X                        ;0B8A30|9D1D06  |0B061D;
 
          CODE_0B8A33: INY                                  ;0B8A33|C8      |      ;
                       LDA.B ($02),Y                        ;0B8A34|B102    |000002;
                       STA.W $0606,X                        ;0B8A36|9D0606  |0B0606;
                       RTS                                  ;0B8A39|60      |      ;
 
 
enemyID_bonePillar3_60: INC.W $05C1,X                        ;0B8A3A|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B8A3D|A001    |      ;
                       LDA.B ($02),Y                        ;0B8A3F|B102    |000002;
                       STA.W $0454,X                        ;0B8A41|9D5404  |0B0454;
                       RTS                                  ;0B8A44|60      |      ;
 
 
enemyID_shroomGround_46: DEC.W $0606,X                        ;0B8A45|DE0606  |0B0606;
                       BNE CODE_0B8A64                      ;0B8A48|D01A    |0B8A64;
                       LDY.B #$01                           ;0B8A4A|A001    |      ;
                       LDA.W $0454,X                        ;0B8A4C|BD5404  |0B0454;
                       EOR.B ($02),Y                        ;0B8A4F|5102    |000002;
                       STA.W $0454,X                        ;0B8A51|9D5404  |0B0454;
                       JSR.W CODE_0B8A33                    ;0B8A54|20338A  |0B8A33;
                       DEC.W $061D,X                        ;0B8A57|DE1D06  |0B061D;
                       BNE CODE_0B8A64                      ;0B8A5A|D008    |0B8A64;
                       LDA.B #$00                           ;0B8A5C|A900    |      ;
                       STA.W $0454,X                        ;0B8A5E|9D5404  |0B0454;
 
          CODE_0B8A61: INC.W $05C1,X                        ;0B8A61|FEC105  |0B05C1;
 
          CODE_0B8A64: RTS                                  ;0B8A64|60      |      ;
 
 
enemyID_zombieSide_4A: DEC.W $0606,X                        ;0B8A65|DE0606  |0B0606;
                       BNE CODE_0B8A64                      ;0B8A68|D0FA    |0B8A64;
                       DEC.W $061D,X                        ;0B8A6A|DE1D06  |0B061D;
                       BEQ CODE_0B8A61                      ;0B8A6D|F0F2    |0B8A61;
                       LDY.B #$01                           ;0B8A6F|A001    |      ;
                       LDA.B r_stage                        ;0B8A71|A532    |000032;
                       CMP.B #$09                           ;0B8A73|C909    |      ;
                       BCC CODE_0B8A79                      ;0B8A75|9002    |0B8A79;
                       LDY.B #$02                           ;0B8A77|A002    |      ;
 
          CODE_0B8A79: LDA.B ($02),Y                        ;0B8A79|B102    |000002;
                       STA.W $0606,X                        ;0B8A7B|9D0606  |0B0606;
 
          CODE_0B8A7E: LDA.W $0470,X                        ;0B8A7E|BD7004  |0B0470;
                       AND.B #$81                           ;0B8A81|2981    |      ;
                       BNE CODE_0B8A64                      ;0B8A83|D0DF    |0B8A64;
                       LDA.W $04A8,X                        ;0B8A85|BDA804  |0B04A8;
                       ASL A                                ;0B8A88|0A      |      ;
                       TAY                                  ;0B8A89|A8      |      ;
                       LDA.W $0438                          ;0B8A8A|AD3804  |0B0438;
                       CMP.W $0438,X                        ;0B8A8D|DD3804  |0B0438;
                       BCC CODE_0B8A93                      ;0B8A90|9001    |0B8A93;
                       INY                                  ;0B8A92|C8      |      ;
 
          CODE_0B8A93: CLC                                  ;0B8A93|18      |      ;
                       LDA.W DATA8_0B8AC7,Y                 ;0B8A94|B9C78A  |0B8AC7;
                       ADC.W $0438,X                        ;0B8A97|7D3804  |0B0438;
                       STA.B $01                            ;0B8A9A|8501    |000001;
                       CLC                                  ;0B8A9C|18      |      ;
                       LDA.W DATA8_0B8ACB,Y                 ;0B8A9D|B9CB8A  |0B8ACB;
                       ADC.W $041C,X                        ;0B8AA0|7D1C04  |0B041C;
                       STA.B $02                            ;0B8AA3|8502    |000002;
                       LDA.W DATA8_0B8ACF,Y                 ;0B8AA5|B9CF8A  |0B8ACF;
                       STA.B r_temp_Xpos                    ;0B8AA8|850A    |00000A;
                       LDA.B #$58                           ;0B8AAA|A958    |      ;
                       STA.B $07                            ;0B8AAC|8507    |000007;
                       LDA.B #$40                           ;0B8AAE|A940    |      ;
                       STA.B $00                            ;0B8AB0|8500    |000000;
                       TYA                                  ;0B8AB2|98      |      ;
                       AND.B #$01                           ;0B8AB3|2901    |      ;
                       EOR.B #$01                           ;0B8AB5|4901    |      ;
                       LDY.B r_stage                        ;0B8AB7|A432    |000032;
                       CPY.B #$09                           ;0B8AB9|C009    |      ;
                       BCC CODE_0B8AC0                      ;0B8ABB|9003    |0B8AC0;
                       CLC                                  ;0B8ABD|18      |      ;
                       ADC.B #$10                           ;0B8ABE|6910    |      ;
 
          CODE_0B8AC0: TAY                                  ;0B8AC0|A8      |      ;
                       JSR.W CODE_0B8E9F                    ;0B8AC1|209F8E  |0B8E9F;
                       JMP.W CODE_0B8DCA                    ;0B8AC4|4CCA8D  |0B8DCA;
 
 
         DATA8_0B8AC7: db $F8,$08,$F8,$08                   ;0B8AC7|        |      ;
 
         DATA8_0B8ACB: db $09,$FA,$FA,$09                   ;0B8ACB|        |      ;
 
         DATA8_0B8ACF: db $00,$01,$00,$01                   ;0B8ACF|        |      ;
 
enemyID_shroomGround_48: JSR.W CODE_0B8230                    ;0B8AD3|203082  |0B8230;
                       JMP.W enemyID__40                    ;0B8AD6|4C4C84  |0B844C;
 
 
          enemyID__DC: JSR.W CODE_0B81EC                    ;0B8AD9|20EC81  |0B81EC;
                       LDA.W $0633,X                        ;0B8ADC|BD3306  |0B0633;
                       STA.W $04A8,X                        ;0B8ADF|9DA804  |0B04A8;
                       RTS                                  ;0B8AE2|60      |      ;
 
 
          enemyID__A4: INC.W $05C1,X                        ;0B8AE3|FEC105  |0B05C1;
                       JMP.W CODE_0B8A7E                    ;0B8AE6|4C7E8A  |0B8A7E;
 
 
    enemyID_candle_62: LDY.B #$01                           ;0B8AE9|A001    |      ;
                       LDA.B ($02),Y                        ;0B8AEB|B102    |000002;
                       JSR.W CODE_0B807F                    ;0B8AED|207F80  |0B807F;
                       JMP.W enemyID_fleaMan_1C             ;0B8AF0|4C208E  |0B8E20;
 
 
        enemy_2_ID_24: CLC                                  ;0B8AF3|18      |      ;
                       LDA.W $041C,X                        ;0B8AF4|BD1C04  |0B041C;
                       ADC.B #$10                           ;0B8AF7|6910    |      ;
                       STA.B $00                            ;0B8AF9|8500    |000000;
                       LDA.W $0438,X                        ;0B8AFB|BD3804  |0B0438;
                       STA.B $01                            ;0B8AFE|8501    |000001;
                       LDA.W $04A8,X                        ;0B8B00|BDA804  |0B04A8;
                       STA.B $02                            ;0B8B03|8502    |000002;
                       LDA.W $0470,X                        ;0B8B05|BD7004  |0B0470;
                       ORA.B #$60                           ;0B8B08|0960    |      ;
                       STA.B $03                            ;0B8B0A|8503    |000003;
                       STX.B r_pointerQueue                 ;0B8B0C|8608    |000008;
                       JSR.W CODE_0B8B5A                    ;0B8B0E|205A8B  |0B8B5A;
                       BNE CODE_0B8B4C                      ;0B8B11|D039    |0B8B4C;
                       STX.B $09                            ;0B8B13|8609    |000009;
                       LDX.B r_pointerQueue                 ;0B8B15|A608    |000008;
                       JSR.W CODE_0B819E                    ;0B8B17|209E81  |0B819E;
                       JSR.W CODE_0B81EF                    ;0B8B1A|20EF81  |0B81EF;
                       LDX.B $09                            ;0B8B1D|A609    |000009;
                       db $20                               ;0B8B1F|        |      ;
                       dw CODE_0FFED7                       ;0B8B20|        |0FFED7;
                       JSR.W CODE_0B8B4F                    ;0B8B22|204F8B  |0B8B4F;
                       LDA.B $02                            ;0B8B25|A502    |000002;
                       STA.W $04A8,X                        ;0B8B27|9DA804  |0B04A8;
                       LDA.B $03                            ;0B8B2A|A503    |000003;
                       STA.W $0470,X                        ;0B8B2C|9D7004  |0B0470;
                       JSR.W CODE_0B9FC9                    ;0B8B2F|20C99F  |0B9FC9;
                       LDA.B #$52                           ;0B8B32|A952    |      ;
                       STA.W $054E,X                        ;0B8B34|9D4E05  |0B054E;
                       LDA.B #$69                           ;0B8B37|A969    |      ;
                       STA.W $05EF,X                        ;0B8B39|9DEF05  |0B05EF;
                       LDX.B r_entityID_processed           ;0B8B3C|A66C    |00006C;
                       LDA.B #$72                           ;0B8B3E|A972    |      ;
                       STA.W $0400,X                        ;0B8B40|9D0004  |0B0400;
                       LDA.B #$10                           ;0B8B43|A910    |      ;
                       STA.W $0606,X                        ;0B8B45|9D0606  |0B0606;
                       INC.W $05C1,X                        ;0B8B48|FEC105  |0B05C1;
                       RTS                                  ;0B8B4B|60      |      ;
 
 
          CODE_0B8B4C: LDX.B r_entityID_processed           ;0B8B4C|A66C    |00006C;
                       RTS                                  ;0B8B4E|60      |      ;
 
 
          CODE_0B8B4F: LDA.B $00                            ;0B8B4F|A500    |000000;
                       STA.W $041C,X                        ;0B8B51|9D1C04  |0B041C;
                       LDA.B $01                            ;0B8B54|A501    |000001;
                       STA.W $0438,X                        ;0B8B56|9D3804  |0B0438;
                       RTS                                  ;0B8B59|60      |      ;
 
 
          CODE_0B8B5A: LDX.B #$01                           ;0B8B5A|A201    |      ;
 
          CODE_0B8B5C: LDA.W $054E,X                        ;0B8B5C|BD4E05  |0B054E;
                       BEQ CODE_0B8B68                      ;0B8B5F|F007    |0B8B68;
                       INX                                  ;0B8B61|E8      |      ;
                       CPX.B #$04                           ;0B8B62|E004    |      ;
                       BCC CODE_0B8B5C                      ;0B8B64|90F6    |0B8B5C;
                       LDA.B #$01                           ;0B8B66|A901    |      ;
 
          CODE_0B8B68: RTS                                  ;0B8B68|60      |      ;
 
 
        enemy_2_ID_26: JSR.W enemyID_fishManSwimJump_54     ;0B8B69|20A781  |0B81A7;
                       db $20                               ;0B8B6C|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8B6D|        |0FFEC8;
                       LDA.B #$14                           ;0B8B6F|A914    |      ;
                       STA.W $061D,X                        ;0B8B71|9D1D06  |0B061D;
                       RTS                                  ;0B8B74|60      |      ;
 
 
        enemy_2_ID_28: LDA.W $061D,X                        ;0B8B75|BD1D06  |0B061D;
                       JSR.W CODE_0B807F                    ;0B8B78|207F80  |0B807F;
                       LDY.B #$0E                           ;0B8B7B|A00E    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B8B7D|20A6B7  |0BB7A6;
                       BEQ CODE_0B8B8E                      ;0B8B80|F00C    |0B8B8E;
                       JSR.W CODE_0B8B91                    ;0B8B82|20918B  |0B8B91;
                       db $20                               ;0B8B85|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8B86|        |0FFEC8;
                       STA.W $061D,X                        ;0B8B88|9D1D06  |0B061D;
                       INC.W $05C1,X                        ;0B8B8B|FEC105  |0B05C1;
 
          CODE_0B8B8E: LDX.B r_entityID_processed           ;0B8B8E|A66C    |00006C;
                       RTS                                  ;0B8B90|60      |      ;
 
 
          CODE_0B8B91: LDA.B r_roomOrientation              ;0B8B91|A568    |000068;
                       BMI CODE_0B8B9E                      ;0B8B93|3009    |0B8B9E;
 
          CODE_0B8B95: LDA.W $041C,X                        ;0B8B95|BD1C04  |0B041C;
                       AND.B #$F0                           ;0B8B98|29F0    |      ;
                       STA.W $041C,X                        ;0B8B9A|9D1C04  |0B041C;
                       RTS                                  ;0B8B9D|60      |      ;
 
 
          CODE_0B8B9E: CLC                                  ;0B8B9E|18      |      ;
                       LDA.W $041C,X                        ;0B8B9F|BD1C04  |0B041C;
                       ADC.B r_sceneScrollOffsetLo          ;0B8BA2|6556    |000056;
                       AND.B #$F0                           ;0B8BA4|29F0    |      ;
                       SEC                                  ;0B8BA6|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;0B8BA7|E556    |000056;
                       CLC                                  ;0B8BA9|18      |      ;
                       ADC.B #$03                           ;0B8BAA|6903    |      ;
                       STA.W $041C,X                        ;0B8BAC|9D1C04  |0B041C;
                       RTS                                  ;0B8BAF|60      |      ;
 
 
        enemy_2_ID_20: INC.W $05C1,X                        ;0B8BB0|FEC105  |0B05C1;
                       LDY.B #$00                           ;0B8BB3|A000    |      ;
                       JSR.W CODE_0B80B3                    ;0B8BB5|20B380  |0B80B3;
                       CMP.B #$40                           ;0B8BB8|C940    |      ;
                       BCS CODE_0B8BBD                      ;0B8BBA|B001    |0B8BBD;
                       INY                                  ;0B8BBC|C8      |      ;
 
          CODE_0B8BBD: TYA                                  ;0B8BBD|98      |      ;
                       STA.W $0606,X                        ;0B8BBE|9D0606  |0B0606;
                       RTS                                  ;0B8BC1|60      |      ;
 
 
        enemy_2_ID_1E: INC.W $05C1,X                        ;0B8BC2|FEC105  |0B05C1;
                       LDA.B #$32                           ;0B8BC5|A932    |      ;
                       LDY.W $0400,X                        ;0B8BC7|BC0004  |0B0400;
                       CPY.B #$30                           ;0B8BCA|C030    |      ;
                       BEQ CODE_0B8BD0                      ;0B8BCC|F002    |0B8BD0;
                       LDA.B #$54                           ;0B8BCE|A954    |      ;
 
          CODE_0B8BD0: STA.W $0400,X                        ;0B8BD0|9D0004  |0B0400;
                       RTS                                  ;0B8BD3|60      |      ;
 
 
          enemyID__74: JSR.W enemyID_eyeFloat_16            ;0B8BD4|20AD83  |0B83AD;
                       CLC                                  ;0B8BD7|18      |      ;
                       LDY.B #$03                           ;0B8BD8|A003    |      ;
                       LDA.B ($02),Y                        ;0B8BDA|B102    |000002;
                       ADC.W $04A8,X                        ;0B8BDC|7DA804  |0B04A8;
                       TAY                                  ;0B8BDF|A8      |      ;
                       LDA.W DATA8_0B8BEF,Y                 ;0B8BE0|B9EF8B  |0B8BEF;
                       STA.W $04F2,X                        ;0B8BE3|9DF204  |0B04F2;
                       JSR.W CODE_0B819E                    ;0B8BE6|209E81  |0B819E;
                       JSR.W CODE_0B8001                    ;0B8BE9|200180  |0B8001;
                       db $4C                               ;0B8BEC|        |      ;
 
                       dw UNREACH_0FFEC8                    ;0B8BED|        |0FFEC8;
 
         DATA8_0B8BEF: db $08,$F8,$F8,$08,$10,$F0,$F0,$10   ;0B8BEF|        |      ;
 
        enemy_2_ID_2C: JSR.W CODE_0B81D4                    ;0B8BF7|20D481  |0B81D4;
                       JSR.W CODE_0B80E3                    ;0B8BFA|20E380  |0B80E3;
                       BNE CODE_0B8C1F                      ;0B8BFD|D020    |0B8C1F;
                       JSR.W CODE_0B81D4                    ;0B8BFF|20D481  |0B81D4;
                       LDA.B #$68                           ;0B8C02|A968    |      ;
                       STA.W $054E,X                        ;0B8C04|9D4E05  |0B054E;
                       LDA.B #$00                           ;0B8C07|A900    |      ;
                       STA.W $05EF,X                        ;0B8C09|9DEF05  |0B05EF;
                       STA.W $05C1,X                        ;0B8C0C|9DC105  |0B05C1;
                       TXA                                  ;0B8C0F|8A      |      ;
                       LDX.B r_entityID_processed           ;0B8C10|A66C    |00006C;
                       STA.W $061D,X                        ;0B8C12|9D1D06  |0B061D;
                       LDA.B #$08                           ;0B8C15|A908    |      ;
                       LDY.B #$0C                           ;0B8C17|A00C    |      ;
                       JSR.W DATA8_0B8293                   ;0B8C19|209382  |0B8293;
                       JMP.W enemyID_raven_06               ;0B8C1C|4CB981  |0B81B9;
 
 
          CODE_0B8C1F: LDX.B r_entityID_processed           ;0B8C1F|A66C    |00006C;
                       RTS                                  ;0B8C21|60      |      ;
 
 
    enemyID_multi2_A0: db $20                               ;0B8C22|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8C23|        |0FFEC8;
                       JSR.W enemyID_fishManSwimJump_54     ;0B8C25|20A781  |0B81A7;
                       LDA.B #$01                           ;0B8C28|A901    |      ;
                       STA.W $04A8,X                        ;0B8C2A|9DA804  |0B04A8;
                       LDY.B #$01                           ;0B8C2D|A001    |      ;
                       LDA.B ($02),Y                        ;0B8C2F|B102    |000002;
                       TAY                                  ;0B8C31|A8      |      ;
                       LDA.W DATA8_0B8C60,Y                 ;0B8C32|B9608C  |0B8C60;
                       STA.W $0520,X                        ;0B8C35|9D2005  |0B0520;
                       LDA.W DATA8_0B8C62,Y                 ;0B8C38|B9628C  |0B8C62;
                       STA.W $0537,X                        ;0B8C3B|9D3705  |0B0537;
                       LDA.B #$50                           ;0B8C3E|A950    |      ;
                       STA.W $0606,X                        ;0B8C40|9D0606  |0B0606;
                       STX.B r_pointerQueue                 ;0B8C43|8608    |000008;
                       LDA.W $061D,X                        ;0B8C45|BD1D06  |0B061D;
                       TAX                                  ;0B8C48|AA      |      ;
                       LDA.B #$57                           ;0B8C49|A957    |      ;
                       STA.W $05EF,X                        ;0B8C4B|9DEF05  |0B05EF;
                       LDA.B #$00                           ;0B8C4E|A900    |      ;
                       STA.W $05C1,X                        ;0B8C50|9DC105  |0B05C1;
                       LDA.B #$68                           ;0B8C53|A968    |      ;
                       STA.W $054E,X                        ;0B8C55|9D4E05  |0B054E;
                       LDA.B r_pointerQueue                 ;0B8C58|A508    |000008;
                       STA.W $0606,X                        ;0B8C5A|9D0606  |0B0606;
                       LDX.B r_entityID_processed           ;0B8C5D|A66C    |00006C;
 
          CODE_0B8C5F: RTS                                  ;0B8C5F|60      |      ;
 
 
         DATA8_0B8C60: db $01,$FE                           ;0B8C60|        |      ;
 
         DATA8_0B8C62: db $20,$D0                           ;0B8C62|        |      ;
 
    enemyID_multi3_A2: LDA.W $041C,X                        ;0B8C64|BD1C04  |0B041C;
                       CMP.B #$30                           ;0B8C67|C930    |      ;
                       BCC CODE_0B8C77                      ;0B8C69|900C    |0B8C77;
                       DEC.W $0606,X                        ;0B8C6B|DE0606  |0B0606;
                       BNE CODE_0B8C5F                      ;0B8C6E|D0EF    |0B8C5F;
                       db $20                               ;0B8C70|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8C71|        |0FFEC8;
                       INC.W $05C1,X                        ;0B8C73|FEC105  |0B05C1;
                       RTS                                  ;0B8C76|60      |      ;
 
 
          CODE_0B8C77: JSR.W CODE_0B81D4                    ;0B8C77|20D481  |0B81D4;
                       JSR.W enemyID_skeletonWhip_14        ;0B8C7A|20C581  |0B81C5;
                       LDA.B #$30                           ;0B8C7D|A930    |      ;
                       STA.W $041C,X                        ;0B8C7F|9D1C04  |0B041C;
                       db $20                               ;0B8C82|        |      ;
                       dw UNREACH_0FFEC8                    ;0B8C83|        |0FFEC8;
                       STA.W $04DB,X                        ;0B8C85|9DDB04  |0B04DB;
                       LDA.W $061D,X                        ;0B8C88|BD1D06  |0B061D;
                       TAX                                  ;0B8C8B|AA      |      ;
                       LDA.B #$00                           ;0B8C8C|A900    |      ;
                       STA.W $054E,X                        ;0B8C8E|9D4E05  |0B054E;
                       STA.W $05EF,X                        ;0B8C91|9DEF05  |0B05EF;
                       STA.W $0400,X                        ;0B8C94|9D0004  |0B0400;
                       LDX.B r_entityID_processed           ;0B8C97|A66C    |00006C;
                       RTS                                  ;0B8C99|60      |      ;
 
 
        enemy_2_ID_38: LDA.W $0606,X                        ;0B8C9A|BD0606  |0B0606;
                       TAX                                  ;0B8C9D|AA      |      ;
                       LDA.W $0438,X                        ;0B8C9E|BD3804  |0B0438;
                       STA.B r_pointerQueue                 ;0B8CA1|8508    |000008;
                       LDA.W $0470,X                        ;0B8CA3|BD7004  |0B0470;
                       ORA.B #$30                           ;0B8CA6|0930    |      ;
                       AND.B #$BB                           ;0B8CA8|29BB    |      ;
                       STA.B $09                            ;0B8CAA|8509    |000009;
                       LDA.B #$30                           ;0B8CAC|A930    |      ;
                       STA.B r_collisionPointYinScreen      ;0B8CAE|8511    |000011;
                       JSR.W CODE_0B80C1                    ;0B8CB0|20C180  |0B80C1;
                       LSR A                                ;0B8CB3|4A      |      ;
                       LSR A                                ;0B8CB4|4A      |      ;
                       LSR A                                ;0B8CB5|4A      |      ;
                       LSR A                                ;0B8CB6|4A      |      ;
                       TAY                                  ;0B8CB7|A8      |      ;
                       LDX.B r_entityID_processed           ;0B8CB8|A66C    |00006C;
                       LDA.W DATA8_0B8CDB,Y                 ;0B8CBA|B9DB8C  |0B8CDB;
                       STA.W $0400,X                        ;0B8CBD|9D0004  |0B0400;
                       LDA.B #$08                           ;0B8CC0|A908    |      ;
                       STA.W $048C,X                        ;0B8CC2|9D8C04  |0B048C;
                       LDA.B #$01                           ;0B8CC5|A901    |      ;
                       STA.W $04A8,X                        ;0B8CC7|9DA804  |0B04A8;
                       LDA.W DATA8_0B8CE5,Y                 ;0B8CCA|B9E58C  |0B8CE5;
                       STA.W $041C,X                        ;0B8CCD|9D1C04  |0B041C;
                       LDA.B r_pointerQueue                 ;0B8CD0|A508    |000008;
                       STA.W $0438,X                        ;0B8CD2|9D3804  |0B0438;
                       LDA.B $09                            ;0B8CD5|A509    |000009;
                       STA.W $0470,X                        ;0B8CD7|9D7004  |0B0470;
                       RTS                                  ;0B8CDA|60      |      ;
 
 
         DATA8_0B8CDB: db $C0,$C2,$C4,$C6,$C8,$D8,$D8,$D8   ;0B8CDB|        |      ;
                       db $D8,$D8                           ;0B8CE3|        |      ;
 
         DATA8_0B8CE5: db $30,$38,$40,$48,$50,$58,$60,$68   ;0B8CE5|        |      ;
                       db $70,$78                           ;0B8CED|        |      ;
 
 enemyID_mummyWrap_BA: LDA.B #$02                           ;0B8CEF|A902    |      ;
                       STA.W $0606,X                        ;0B8CF1|9D0606  |0B0606;
 
          CODE_0B8CF4: LDY.W $0606,X                        ;0B8CF4|BC0606  |0B0606;
                       LDA.W DATA8_0B8D1C,Y                 ;0B8CF7|B91C8D  |0B8D1C;
                       TAY                                  ;0B8CFA|A8      |      ;
                       LDA.W $0438,X                        ;0B8CFB|BD3804  |0B0438;
                       db $20                               ;0B8CFE|        |      ;
                       dw UNREACH_0FFC16                    ;0B8CFF|        |0FFC16;
                       BNE CODE_0B8D0D                      ;0B8D01|D00A    |0B8D0D;
                       LDX.B r_entityID_processed           ;0B8D03|A66C    |00006C;
                       DEC.W $0606,X                        ;0B8D05|DE0606  |0B0606;
                       BNE CODE_0B8CF4                      ;0B8D08|D0EA    |0B8CF4;
                       JMP.W enemyID_frog_4E                ;0B8D0A|4CB284  |0B84B2;
 
 
          CODE_0B8D0D: LDX.B r_entityID_processed           ;0B8D0D|A66C    |00006C;
                       LDY.W $0606,X                        ;0B8D0F|BC0606  |0B0606;
                       LDA.W DATA8_0B8D1F,Y                 ;0B8D12|B91F8D  |0B8D1F;
                       STA.W $041C,X                        ;0B8D15|9D1C04  |0B041C;
                       INC.W $05C1,X                        ;0B8D18|FEC105  |0B05C1;
                       RTS                                  ;0B8D1B|60      |      ;
 
 
         DATA8_0B8D1C: db $00,$B4,$A4                       ;0B8D1C|        |      ;
 
         DATA8_0B8D1F: db $00,$A0,$90                       ;0B8D1F|        |      ;
 
        enemy_2_ID_12: LDY.B #$01                           ;0B8D22|A001    |      ;
                       LDA.B ($02),Y                        ;0B8D24|B102    |000002;
                       STA.W $041C,X                        ;0B8D26|9D1C04  |0B041C;
                       CLC                                  ;0B8D29|18      |      ;
                       ADC.B #$10                           ;0B8D2A|6910    |      ;
                       TAY                                  ;0B8D2C|A8      |      ;
                       LDA.W $0438,X                        ;0B8D2D|BD3804  |0B0438;
                       db $20                               ;0B8D30|        |      ;
                       dw UNREACH_0FFC16                    ;0B8D31|        |0FFC16;
                       CMP.B #$01                           ;0B8D33|C901    |      ;
                       BNE CODE_0B8D57                      ;0B8D35|D020    |0B8D57;
                       BEQ CODE_0B8D72                      ;0B8D37|F039    |0B8D72;
 
 enemyID_sporeling_BE: LDA.B #$A8                           ;0B8D39|A9A8    |      ;
                       STA.W $041C,X                        ;0B8D3B|9D1C04  |0B041C;
                       CLC                                  ;0B8D3E|18      |      ;
                       ADC.B #$10                           ;0B8D3F|6910    |      ;
                       TAY                                  ;0B8D41|A8      |      ;
                       LDA.W $0438,X                        ;0B8D42|BD3804  |0B0438;
                       db $20                               ;0B8D45|        |      ;
                       dw UNREACH_0FFC16                    ;0B8D46|        |0FFC16;
                       CMP.B #$01                           ;0B8D48|C901    |      ;
                       BNE CODE_0B8D57                      ;0B8D4A|D00B    |0B8D57;
                       LDY.W $041C,X                        ;0B8D4C|BC1C04  |0B041C;
                       LDA.W $0438,X                        ;0B8D4F|BD3804  |0B0438;
                       db $20                               ;0B8D52|        |      ;
                       dw UNREACH_0FFC16                    ;0B8D53|        |0FFC16;
                       BEQ CODE_0B8D5C                      ;0B8D55|F005    |0B8D5C;
 
          CODE_0B8D57: LDX.B r_entityID_processed           ;0B8D57|A66C    |00006C;
                       JMP.W enemyID_frog_4E                ;0B8D59|4CB284  |0B84B2;
 
 
          CODE_0B8D5C: LDX.B r_entityID_processed           ;0B8D5C|A66C    |00006C;
                       SEC                                  ;0B8D5E|38      |      ;
                       LDA.W $041C,X                        ;0B8D5F|BD1C04  |0B041C;
                       SBC.B #$08                           ;0B8D62|E908    |      ;
                       STA.W $041C,X                        ;0B8D64|9D1C04  |0B041C;
                       LDA.B #$00                           ;0B8D67|A900    |      ;
                       STA.W $0400,X                        ;0B8D69|9D0004  |0B0400;
                       JSR.W CODE_0B81EF                    ;0B8D6C|20EF81  |0B81EF;
                       JSR.W CODE_0B81D4                    ;0B8D6F|20D481  |0B81D4;
 
          CODE_0B8D72: INC.W $05C1,X                        ;0B8D72|FEC105  |0B05C1;
                       RTS                                  ;0B8D75|60      |      ;
 
 
        enemy_2_ID_1C: TXA                                  ;0B8D76|8A      |      ;
                       AND.B #$01                           ;0B8D77|2901    |      ;
                       TAY                                  ;0B8D79|A8      |      ;
                       LDA.W CODE_0B8D84,Y                  ;0B8D7A|B9848D  |0B8D84;
                       STA.W $0606,X                        ;0B8D7D|9D0606  |0B0606;
                       INC.W $05C1,X                        ;0B8D80|FEC105  |0B05C1;
                       RTS                                  ;0B8D83|60      |      ;
 
 
          CODE_0B8D84: RTI                                  ;0B8D84|40      |      ;
 
                       db $D0                               ;0B8D85|        |      ;
 
     enemyID_fuzzy_CA: db $A0,$01                           ;0B8D86|        |      ;
                       LDA.B ($02),Y                        ;0B8D88|B102    |000002;
                       STA.B $00                            ;0B8D8A|8500    |000000;
                       INY                                  ;0B8D8C|C8      |      ;
                       LDA.B ($02),Y                        ;0B8D8D|B102    |000002;
                       LDY.B $00                            ;0B8D8F|A400    |000000;
                       db $20                               ;0B8D91|        |      ;
                       dw UNREACH_0FFC1E                    ;0B8D92|        |0FFC1E;
                       BNE CODE_0B8D57                      ;0B8D94|D0C1    |0B8D57;
                       LDX.B r_entityID_processed           ;0B8D96|A66C    |00006C;
                       INC.W $05C1,X                        ;0B8D98|FEC105  |0B05C1;
                       RTS                                  ;0B8D9B|60      |      ;
 
 
          enemyID__9C: LDA.B #$0E                           ;0B8D9C|A90E    |      ;
                       LDY.B #$01                           ;0B8D9E|A001    |      ;
                       JSR.W DATA8_0B8293                   ;0B8DA0|209382  |0B8293;
                       INC.W $05C1,X                        ;0B8DA3|FEC105  |0B05C1;
                       LDA.B r_blockLevel                   ;0B8DA6|A533    |000033;
                       BEQ CODE_0B8DBE                      ;0B8DA8|F014    |0B8DBE;
                       CMP.B #$01                           ;0B8DAA|C901    |      ;
                       BEQ CODE_0B8DBA                      ;0B8DAC|F00C    |0B8DBA;
                       CMP.B #$02                           ;0B8DAE|C902    |      ;
                       BEQ CODE_0B8DBA                      ;0B8DB0|F008    |0B8DBA;
                       CMP.B #$03                           ;0B8DB2|C903    |      ;
                       BEQ CODE_0B8DC4                      ;0B8DB4|F00E    |0B8DC4;
                       LDA.B r_roomIdx                      ;0B8DB6|A534    |000034;
                       BNE CODE_0B8DC4                      ;0B8DB8|D00A    |0B8DC4;
 
          CODE_0B8DBA: LDA.B #$00                           ;0B8DBA|A900    |      ;
                       BEQ CODE_0B8DC6                      ;0B8DBC|F008    |0B8DC6;
 
          CODE_0B8DBE: LDA.B r_roomIdx                      ;0B8DBE|A534    |000034;
                       CMP.B #$02                           ;0B8DC0|C902    |      ;
                       BNE CODE_0B8DBA                      ;0B8DC2|D0F6    |0B8DBA;
 
          CODE_0B8DC4: LDA.B #$03                           ;0B8DC4|A903    |      ;
 
          CODE_0B8DC6: STA.W $0454,X                        ;0B8DC6|9D5404  |0B0454;
                       RTS                                  ;0B8DC9|60      |      ;
 
 
          CODE_0B8DCA: JSR.W CODE_0B80E3                    ;0B8DCA|20E380  |0B80E3;
                       BNE CODE_0B8E0C                      ;0B8DCD|D03D    |0B8E0C;
 
         DATA8_0B8DCF: db $20                               ;0B8DCF|        |      ;
                       dw CODE_0FFED7                       ;0B8DD0|        |0FFED7;
                       LDA.B $01                            ;0B8DD2|A501    |000001;
                       STA.W $0438,X                        ;0B8DD4|9D3804  |0B0438;
                       LDA.B $02                            ;0B8DD7|A502    |000002;
                       STA.W $041C,X                        ;0B8DD9|9D1C04  |0B041C;
                       LDA.B $03                            ;0B8DDC|A503    |000003;
                       STA.W $04F2,X                        ;0B8DDE|9DF204  |0B04F2;
                       LDA.B $04                            ;0B8DE1|A504    |000004;
                       STA.W $0509,X                        ;0B8DE3|9D0905  |0B0509;
                       LDA.B $05                            ;0B8DE6|A505    |000005;
                       STA.W $0520,X                        ;0B8DE8|9D2005  |0B0520;
                       LDA.B $06                            ;0B8DEB|A506    |000006;
                       STA.W $0537,X                        ;0B8DED|9D3705  |0B0537;
                       LDA.B #$60                           ;0B8DF0|A960    |      ;
                       STA.W $0470,X                        ;0B8DF2|9D7004  |0B0470;
                       LDA.B $00                            ;0B8DF5|A500    |000000;
                       STA.W $054E,X                        ;0B8DF7|9D4E05  |0B054E;
                       LDA.B r_temp_Xpos                    ;0B8DFA|A50A    |00000A;
                       STA.W $04A8,X                        ;0B8DFC|9DA804  |0B04A8;
                       JSR.W CODE_0B9FC9                    ;0B8DFF|20C99F  |0B9FC9;
                       LDA.B $07                            ;0B8E02|A507    |000007;
                       STA.W $05EF,X                        ;0B8E04|9DEF05  |0B05EF;
                       STX.B r_pointerQueue                 ;0B8E07|8608    |000008;
                       LDX.B r_entityID_processed           ;0B8E09|A66C    |00006C;
                       RTS                                  ;0B8E0B|60      |      ;
 
 
          CODE_0B8E0C: LDX.B r_entityID_processed           ;0B8E0C|A66C    |00006C;
                       LDA.B #$00                           ;0B8E0E|A900    |      ;
                       RTS                                  ;0B8E10|60      |      ;
 
 
          CODE_0B8E11: JSR.W CODE_0B8E6F                    ;0B8E11|206F8E  |0B8E6F;
                       db $20                               ;0B8E14|        |      ;
                       dw CODE_0FFEB9                       ;0B8E15|        |0FFEB9;
                       BNE CODE_0B8E0C                      ;0B8E17|D0F3    |0B8E0C;
                       LDA.B #$00                           ;0B8E19|A900    |      ;
                       STA.B r_temp_Xpos                    ;0B8E1B|850A    |00000A;
                       JMP.W DATA8_0B8DCF                   ;0B8E1D|4CCF8D  |0B8DCF;
 
 
   enemyID_fleaMan_1C: LDA.W $0438,X                        ;0B8E20|BD3804  |0B0438;
                       CMP.B #$04                           ;0B8E23|C904    |      ;
                       BCC CODE_0B8E36                      ;0B8E25|900F    |0B8E36;
                       CMP.B #$FC                           ;0B8E27|C9FC    |      ;
                       BCS CODE_0B8E36                      ;0B8E29|B00B    |0B8E36;
                       LDA.W $041C,X                        ;0B8E2B|BD1C04  |0B041C;
                       CMP.B #$18                           ;0B8E2E|C918    |      ;
                       BCC CODE_0B8E36                      ;0B8E30|9004    |0B8E36;
                       CMP.B #$E8                           ;0B8E32|C9E8    |      ;
                       BCC CODE_0B8E3E                      ;0B8E34|9008    |0B8E3E;
 
          CODE_0B8E36: LDA.B #$00                           ;0B8E36|A900    |      ;
                       STA.W $054E,X                        ;0B8E38|9D4E05  |0B054E;
                       STA.W $0400,X                        ;0B8E3B|9D0004  |0B0400;
 
          CODE_0B8E3E: RTS                                  ;0B8E3E|60      |      ;
 
 
        enemy_2_ID_36: LDA.W $0470,X                        ;0B8E3F|BD7004  |0B0470;
                       AND.B #$81                           ;0B8E42|2981    |      ;
                       BNE CODE_0B8E51                      ;0B8E44|D00B    |0B8E51;
                       LDA.W $0438,X                        ;0B8E46|BD3804  |0B0438;
                       CMP.B #$F8                           ;0B8E49|C9F8    |      ;
                       BCS CODE_0B8E51                      ;0B8E4B|B004    |0B8E51;
                       CMP.B #$08                           ;0B8E4D|C908    |      ;
                       BCS CODE_0B8E55                      ;0B8E4F|B004    |0B8E55;
 
          CODE_0B8E51: INC.W $05C1,X                        ;0B8E51|FEC105  |0B05C1;
                       RTS                                  ;0B8E54|60      |      ;
 
 
          CODE_0B8E55: LDA.B #$32                           ;0B8E55|A932    |      ;
                       db $20                               ;0B8E57|        |      ;
                       dw initFreezWaterEffect_01           ;0B8E58|        |0FE25F;
 
enemyID_wingDeamon_1A: INC.W $05C1,X                        ;0B8E5A|FEC105  |0B05C1;
                       LDA.W $0470,X                        ;0B8E5D|BD7004  |0B0470;
                       AND.B #$81                           ;0B8E60|2981    |      ;
                       BNE CODE_0B8E3E                      ;0B8E62|D0DA    |0B8E3E;
                       LDY.B #$01                           ;0B8E64|A001    |      ;
                       LDA.B ($02),Y                        ;0B8E66|B102    |000002;
                       TAY                                  ;0B8E68|A8      |      ;
                       JSR.W CODE_0B8E6F                    ;0B8E69|206F8E  |0B8E6F;
                       JMP.W CODE_0B8DCA                    ;0B8E6C|4CCA8D  |0B8DCA;
 
 
          CODE_0B8E6F: CLC                                  ;0B8E6F|18      |      ;
                       LDA.W $041C,X                        ;0B8E70|BD1C04  |0B041C;
                       ADC.W DATA8_0B8ECC,Y                 ;0B8E73|79CC8E  |0B8ECC;
                       STA.B $02                            ;0B8E76|8502    |000002;
                       LDA.W DATA8_0B8ED4,Y                 ;0B8E78|B9D48E  |0B8ED4;
                       STA.B $07                            ;0B8E7B|8507    |000007;
                       LDA.W DATA8_0B8EC4,Y                 ;0B8E7D|B9C48E  |0B8EC4;
                       STA.B $00                            ;0B8E80|8500    |000000;
                       LDA.W DATA8_0B8EBC,Y                 ;0B8E82|B9BC8E  |0B8EBC;
                       BEQ CODE_0B8E8D                      ;0B8E85|F006    |0B8E8D;
                       LDA.W $04A8,X                        ;0B8E87|BDA804  |0B04A8;
                       EOR.W DATA8_0B8EB4,Y                 ;0B8E8A|59B48E  |0B8EB4;
 
          CODE_0B8E8D: STA.B r_temp_Xpos                    ;0B8E8D|850A    |00000A;
                       CLC                                  ;0B8E8F|18      |      ;
                       TYA                                  ;0B8E90|98      |      ;
                       ASL A                                ;0B8E91|0A      |      ;
                       ADC.W $04A8,X                        ;0B8E92|7DA804  |0B04A8;
                       TAY                                  ;0B8E95|A8      |      ;
                       CLC                                  ;0B8E96|18      |      ;
                       LDA.W DATA8_0B8EDC,Y                 ;0B8E97|B9DC8E  |0B8EDC;
                       ADC.W $0438,X                        ;0B8E9A|7D3804  |0B0438;
                       STA.B $01                            ;0B8E9D|8501    |000001;
 
          CODE_0B8E9F: LDA.W DATA8_0B8EEC,Y                 ;0B8E9F|B9EC8E  |0B8EEC;
                       STA.B $03                            ;0B8EA2|8503    |000003;
                       LDA.W DATA8_0B8EFE,Y                 ;0B8EA4|B9FE8E  |0B8EFE;
                       STA.B $04                            ;0B8EA7|8504    |000004;
                       LDA.W DATA8_0B8F10,Y                 ;0B8EA9|B9108F  |0B8F10;
                       STA.B $05                            ;0B8EAC|8505    |000005;
                       LDA.W DATA8_0B8F22,Y                 ;0B8EAE|B9228F  |0B8F22;
                       STA.B $06                            ;0B8EB1|8506    |000006;
                       RTS                                  ;0B8EB3|60      |      ;
 
 
         DATA8_0B8EB4: db $00,$00,$00,$01,$00,$00,$00,$00   ;0B8EB4|        |      ;
 
         DATA8_0B8EBC: db $01,$00,$00,$01,$00,$01,$00,$00   ;0B8EBC|        |      ;
 
         DATA8_0B8EC4: db $40,$41,$42,$40,$43,$44,$45,$41   ;0B8EC4|        |      ;
 
 
         DATA8_0B8ECC: db $FE,$F6,$04,$F7,$F4,$FB,$00,$09   ;0B8ECC|        |      ;
 
         DATA8_0B8ED4: db $58,$59,$5A,$58,$5B,$5C,$5D,$59   ;0B8ED4|        |      ;
 
         DATA8_0B8EDC: db $08,$F8,$14,$EC,$04,$FC,$08,$F8   ;0B8EDC|        |      ;
                       db $00,$00,$08,$F8,$00,$00,$08,$F8   ;0B8EE4|        |      ;
 
         DATA8_0B8EEC: db $02,$FE,$01,$FE,$00,$00,$01,$FE   ;0B8EEC|        |      ;
                       db $00,$FF,$01,$FE,$01,$FE,$01,$FE   ;0B8EF4|        |      ;
                       db $02,$FD                           ;0B8EFC|        |      ;
 
         DATA8_0B8EFE: db $00,$00,$80,$80,$00,$00,$80,$80   ;0B8EFE|        |      ;
                       db $C0,$40,$80,$80,$80,$80,$80,$80   ;0B8F06|        |      ;
                       db $40,$C0                           ;0B8F0E|        |      ;
 
 
         DATA8_0B8F10: db $00,$00,$00,$00,$01,$01,$00,$00   ;0B8F10|        |      ;
                       db $FD,$FD,$00,$00,$00,$00,$00,$00   ;0B8F18|        |      ;
                       db $00,$00                           ;0B8F20|        |      ;
 
         DATA8_0B8F22: db $00,$00,$00,$00,$80,$80,$00,$00   ;0B8F22|        |      ;
                       db $40,$40,$00,$00,$00,$00,$00,$00   ;0B8F2A|        |      ;
 
                       db $00,$00                           ;0B8F32|        |      ;
 
  enemyID_zombieGr_04: INC.W $05C1,X                        ;0B8F34|FEC105  |0B05C1;
                       LDA.B #$04                           ;0B8F37|A904    |      ;
                       STA.B r_pointerQueue                 ;0B8F39|8508    |000008;
                       LDA.W $0438,X                        ;0B8F3B|BD3804  |0B0438;
                       STA.B $00                            ;0B8F3E|8500    |000000;
                       LDA.W $041C,X                        ;0B8F40|BD1C04  |0B041C;
                       STA.B $01                            ;0B8F43|8501    |000001;
                       LDA.W $0470,X                        ;0B8F45|BD7004  |0B0470;
                       ORA.B #$40                           ;0B8F48|0940    |      ;
                       AND.B #$FB                           ;0B8F4A|29FB    |      ;
                       STA.B $09                            ;0B8F4C|8509    |000009;
 
          CODE_0B8F4E: JSR.W CODE_0B80E3                    ;0B8F4E|20E380  |0B80E3;
                       BNE CODE_0B8F8F                      ;0B8F51|D03C    |0B8F8F;
                       db $20                               ;0B8F53|        |      ;
                       dw CODE_0FFED7                       ;0B8F54|        |0FFED7;
                       LDA.B #$46                           ;0B8F56|A946    |      ;
                       STA.W $054E,X                        ;0B8F58|9D4E05  |0B054E;
                       LDA.B #$5E                           ;0B8F5B|A95E    |      ;
                       STA.W $05EF,X                        ;0B8F5D|9DEF05  |0B05EF;
                       LDA.B $09                            ;0B8F60|A509    |000009;
                       STA.W $0470,X                        ;0B8F62|9D7004  |0B0470;
                       LDA.B $00                            ;0B8F65|A500    |000000;
                       STA.W $0438,X                        ;0B8F67|9D3804  |0B0438;
                       LDA.B $01                            ;0B8F6A|A501    |000001;
                       STA.W $041C,X                        ;0B8F6C|9D1C04  |0B041C;
                       LDY.B r_pointerQueue                 ;0B8F6F|A408    |000008;
                       LDA.W DATA8_0B8F92,Y                 ;0B8F71|B9928F  |0B8F92;
                       STA.W $04F2,X                        ;0B8F74|9DF204  |0B04F2;
                       LDA.W DATA8_0B8F97,Y                 ;0B8F77|B9978F  |0B8F97;
                       STA.W $0509,X                        ;0B8F7A|9D0905  |0B0509;
                       LDA.B #$FF                           ;0B8F7D|A9FF    |      ;
                       STA.W $0520,X                        ;0B8F7F|9D2005  |0B0520;
                       LDA.W DATA8_0B8F9C,Y                 ;0B8F82|B99C8F  |0B8F9C;
                       STA.W $0537,X                        ;0B8F85|9D3705  |0B0537;
                       JSR.W CODE_0B9FC9                    ;0B8F88|20C99F  |0B9FC9;
                       DEC.B r_pointerQueue                 ;0B8F8B|C608    |000008;
                       BNE CODE_0B8F4E                      ;0B8F8D|D0BF    |0B8F4E;
 
          CODE_0B8F8F: LDX.B r_entityID_processed           ;0B8F8F|A66C    |00006C;
                       RTS                                  ;0B8F91|60      |      ;
 
 
         DATA8_0B8F92: db $00,$FF,$FF,$00,$00               ;0B8F92|        |      ;
 
         DATA8_0B8F97: db $00,$A0,$D8,$28,$50               ;0B8F97|        |      ;
 
         DATA8_0B8F9C: db $00,$C0,$80,$80,$C0               ;0B8F9C|        |      ;
 
        enemy_2_ID_46: LDA.B #$38                           ;0B8FA1|A938    |      ;
                       db $20                               ;0B8FA3|        |      ;
                       dw initFreezWaterEffect_01           ;0B8FA4|        |0FE25F;
                       LDA.W $0470,X                        ;0B8FA6|BD7004  |0B0470;
                       AND.B #$F1                           ;0B8FA9|29F1    |      ;
                       ORA.B #$60                           ;0B8FAB|0960    |      ;
                       STA.B $04                            ;0B8FAD|8504    |000004;
                       JSR.W CODE_0BB52F                    ;0B8FAF|202FB5  |0BB52F;
                       STA.W $054E,X                        ;0B8FB2|9D4E05  |0B054E;
                       LDA.W $041C,X                        ;0B8FB5|BD1C04  |0B041C;
                       STA.B $00                            ;0B8FB8|8500    |000000;
                       LDA.W $0438,X                        ;0B8FBA|BD3804  |0B0438;
                       STA.B $01                            ;0B8FBD|8501    |000001;
                       LDA.B #$03                           ;0B8FBF|A903    |      ;
                       STA.B $03                            ;0B8FC1|8503    |000003;
 
          CODE_0B8FC3: JSR.W CODE_0B80E3                    ;0B8FC3|20E380  |0B80E3;
                       BNE CODE_0B8FE4                      ;0B8FC6|D01C    |0B8FE4;
                       DEC.B $03                            ;0B8FC8|C603    |000003;
                       BEQ CODE_0B8FE4                      ;0B8FCA|F018    |0B8FE4;
                       JSR.W CODE_0B8B4F                    ;0B8FCC|204F8B  |0B8B4F;
                       LDA.B #$6C                           ;0B8FCF|A96C    |      ;
                       STA.W $054E,X                        ;0B8FD1|9D4E05  |0B054E;
                       LDA.B #$6C                           ;0B8FD4|A96C    |      ;
                       STA.W $05EF,X                        ;0B8FD6|9DEF05  |0B05EF;
                       LDA.B $04                            ;0B8FD9|A504    |000004;
                       STA.W $0470,X                        ;0B8FDB|9D7004  |0B0470;
                       JSR.W CODE_0BB52F                    ;0B8FDE|202FB5  |0BB52F;
                       JMP.W CODE_0B8FC3                    ;0B8FE1|4CC38F  |0B8FC3;
 
 
          CODE_0B8FE4: LDX.B r_entityID_processed           ;0B8FE4|A66C    |00006C;
                       RTS                                  ;0B8FE6|60      |      ;
 
 
          enemyID__D8: INC.W $05C1,X                        ;0B8FE7|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B8FEA|A001    |      ;
                       LDA.B ($02),Y                        ;0B8FEC|B102    |000002;
                       db $4C                               ;0B8FEE|        |      ;
 
                       dw initFreezWaterEffect_01           ;0B8FEF|        |0FE25F;
 
   enemyID_fireMan_52: JSR.W CODE_0B90C2                    ;0B8FF1|20C290  |0B90C2;
                       JSR.W CODE_0B93B0                    ;0B8FF4|20B093  |0B93B0;
                       LDY.B #$10                           ;0B8FF7|A010    |      ;
                       db $20                               ;0B8FF9|        |      ;
                       dw UNREACH_0FFC1E                    ;0B8FFA|        |0FFC1E;
                       BEQ CODE_0B9022                      ;0B8FFC|F024    |0B9022;
                       CMP.B #$04                           ;0B8FFE|C904    |      ;
                       BEQ CODE_0B9022                      ;0B9000|F020    |0B9022;
                       LDX.B r_entityID_processed           ;0B9002|A66C    |00006C;
                       JSR.W CODE_0B93B0                    ;0B9004|20B093  |0B93B0;
                       LDY.B #$08                           ;0B9007|A008    |      ;
                       db $20                               ;0B9009|        |      ;
                       dw UNREACH_0FFC1E                    ;0B900A|        |0FFC1E;
                       BNE CODE_0B9022                      ;0B900C|D014    |0B9022;
                       LDX.B r_entityID_processed           ;0B900E|A66C    |00006C;
                       JSR.W CODE_0B93B0                    ;0B9010|20B093  |0B93B0;
                       LDY.B #$F8                           ;0B9013|A0F8    |      ;
                       db $20                               ;0B9015|        |      ;
                       dw UNREACH_0FFC1E                    ;0B9016|        |0FFC1E;
                       BNE CODE_0B9022                      ;0B9018|D008    |0B9022;
                       LDX.B r_entityID_processed           ;0B901A|A66C    |00006C;
                       DEC.W $061D,X                        ;0B901C|DE1D06  |0B061D;
                       BEQ CODE_0B903C                      ;0B901F|F01B    |0B903C;
                       RTS                                  ;0B9021|60      |      ;
 
 
          CODE_0B9022: LDX.B r_entityID_processed           ;0B9022|A66C    |00006C;
                       JMP.W CODE_0B804B                    ;0B9024|4C4B80  |0B804B;
 
 
enemyID_fishManSwim_50: JSR.W enemy_2_ID_22                  ;0B9027|204082  |0B8240;
                       JSR.W CODE_0B81AA                    ;0B902A|20AA81  |0B81AA;
                       LDA.W $0657,X                        ;0B902D|BD5706  |0B0657;
                       ORA.B #$03                           ;0B9030|0903    |      ;
                       STA.W $0657,X                        ;0B9032|9D5706  |0B0657;
                       LDA.B #$08                           ;0B9035|A908    |      ;
                       LDY.B #$0D                           ;0B9037|A00D    |      ;
                       JSR.W DATA8_0B8293                   ;0B9039|209382  |0B8293;
 
          CODE_0B903C: LDA.W $0633,X                        ;0B903C|BD3306  |0B0633;
                       AND.B #$80                           ;0B903F|2980    |      ;
                       BNE CODE_0B9061                      ;0B9041|D01E    |0B9061;
                       LDA.W $0633,X                        ;0B9043|BD3306  |0B0633;
                       AND.B #$30                           ;0B9046|2930    |      ;
                       BEQ CODE_0B9076                      ;0B9048|F02C    |0B9076;
                       LSR A                                ;0B904A|4A      |      ;
                       LSR A                                ;0B904B|4A      |      ;
                       LSR A                                ;0B904C|4A      |      ;
                       LSR A                                ;0B904D|4A      |      ;
                       TAY                                  ;0B904E|A8      |      ;
                       DEY                                  ;0B904F|88      |      ;
                       TYA                                  ;0B9050|98      |      ;
                       ASL A                                ;0B9051|0A      |      ;
                       ASL A                                ;0B9052|0A      |      ;
                       ASL A                                ;0B9053|0A      |      ;
                       ASL A                                ;0B9054|0A      |      ;
                       STA.B $00                            ;0B9055|8500    |000000;
                       LDA.W $0633,X                        ;0B9057|BD3306  |0B0633;
                       AND.B #$CF                           ;0B905A|29CF    |      ;
                       ORA.B $00                            ;0B905C|0500    |000000;
                       STA.W $0633,X                        ;0B905E|9D3306  |0B0633;
 
          CODE_0B9061: LDA.B #$21                           ;0B9061|A921    |      ;
                       STA.W $061D,X                        ;0B9063|9D1D06  |0B061D;
                       JSR.W CODE_0B8243                    ;0B9066|204382  |0B8243;
                       JSR.W CODE_0B80B3                    ;0B9069|20B380  |0B80B3;
                       CMP.B #$60                           ;0B906C|C960    |      ;
                       BCC CODE_0B90AC                      ;0B906E|903C    |0B90AC;
                       JSR.W CODE_0B9134                    ;0B9070|203491  |0B9134;
                       JMP.W CODE_0B90AF                    ;0B9073|4CAF90  |0B90AF;
 
 
          CODE_0B9076: JSR.W CODE_0B907C                    ;0B9076|207C90  |0B907C;
                       JMP.W CODE_0B9061                    ;0B9079|4C6190  |0B9061;
 
 
          CODE_0B907C: LDA.W $0470,X                        ;0B907C|BD7004  |0B0470;
                       AND.B #$81                           ;0B907F|2981    |      ;
                       BNE CODE_0B90A9                      ;0B9081|D026    |0B90A9;
                       db $20                               ;0B9083|        |      ;
                       dw CODE_0FFEB9                       ;0B9084|        |0FFEB9;
                       BNE CODE_0B90A9                      ;0B9086|D021    |0B90A9;
                       LDX.B r_entityID_processed           ;0B9088|A66C    |00006C;
                       JSR.W CODE_0B81EF                    ;0B908A|20EF81  |0B81EF;
                       JSR.W CODE_0B819E                    ;0B908D|209E81  |0B819E;
                       LDA.B r_gameStateLoopCounter         ;0B9090|A51A    |00001A;
                       ADC.W $0438,X                        ;0B9092|7D3804  |0B0438;
                       AND.B #$01                           ;0B9095|2901    |      ;
                       TAY                                  ;0B9097|A8      |      ;
                       LDA.W CODE_0B90AA,Y                  ;0B9098|B9AA90  |0B90AA;
                       STA.W $0400,X                        ;0B909B|9D0004  |0B0400;
                       INC.W $05C1,X                        ;0B909E|FEC105  |0B05C1;
                       LDA.W $0633,X                        ;0B90A1|BD3306  |0B0633;
                       ORA.B #$10                           ;0B90A4|0910    |      ;
                       STA.W $0633,X                        ;0B90A6|9D3306  |0B0633;
 
          CODE_0B90A9: RTS                                  ;0B90A9|60      |      ;
 
 
          CODE_0B90AA: BMI CODE_0B90FE                      ;0B90AA|3052    |0B90FE;
 
          CODE_0B90AC: JSR.W CODE_0B9127                    ;0B90AC|202791  |0B9127;
 
          CODE_0B90AF: LDA.W $0470,X                        ;0B90AF|BD7004  |0B0470;
                       AND.B #$01                           ;0B90B2|2901    |      ;
                       BEQ CODE_0B90BA                      ;0B90B4|F004    |0B90BA;
                       TYA                                  ;0B90B6|98      |      ;
                       EOR.B #$01                           ;0B90B7|4901    |      ;
                       TAY                                  ;0B90B9|A8      |      ;
 
          CODE_0B90BA: TYA                                  ;0B90BA|98      |      ;
                       CLC                                  ;0B90BB|18      |      ;
                       ADC.B #$02                           ;0B90BC|6902    |      ;
                       TAY                                  ;0B90BE|A8      |      ;
                       JMP.W CODE_0B938B                    ;0B90BF|4C8B93  |0B938B;
 
 
          CODE_0B90C2: LDA.W $0633,X                        ;0B90C2|BD3306  |0B0633;
                       AND.B #$80                           ;0B90C5|2980    |      ;
                       BEQ CODE_0B90F5                      ;0B90C7|F02C    |0B90F5;
                       LDA.W $0633,X                        ;0B90C9|BD3306  |0B0633;
                       AND.B #$0F                           ;0B90CC|290F    |      ;
                       TAY                                  ;0B90CE|A8      |      ;
                       STY.B $00                            ;0B90CF|8400    |000000;
                       LDA.W $054E,Y                        ;0B90D1|B94E05  |0B054E;
                       BEQ CODE_0B90F6                      ;0B90D4|F020    |0B90F6;
                       LDY.B $00                            ;0B90D6|A400    |000000;
                       LDA.W $0438,Y                        ;0B90D8|B93804  |0B0438;
                       STA.B r_index                        ;0B90DB|8510    |000010;
                       LDX.B r_entityID_processed           ;0B90DD|A66C    |00006C;
                       JSR.W CODE_0B80CB                    ;0B90DF|20CB80  |0B80CB;
                       CMP.B #$04                           ;0B90E2|C904    |      ;
                       BCS CODE_0B90F5                      ;0B90E4|B00F    |0B90F5;
                       JSR.W CODE_0B90F6                    ;0B90E6|20F690  |0B90F6;
                       LDA.B #$00                           ;0B90E9|A900    |      ;
                       LDY.B $00                            ;0B90EB|A400    |000000;
                       STA.W $0400,Y                        ;0B90ED|990004  |0B0400;
                       STA.W $054E,Y                        ;0B90F0|994E05  |0B054E;
                       LDX.B r_entityID_processed           ;0B90F3|A66C    |00006C;
 
          CODE_0B90F5: RTS                                  ;0B90F5|60      |      ;
 
 
          CODE_0B90F6: LDA.W $0633,X                        ;0B90F6|BD3306  |0B0633;
                       AND.B #$7F                           ;0B90F9|297F    |      ;
                       STA.W $0633,X                        ;0B90FB|9D3306  |0B0633;
 
          CODE_0B90FE: RTS                                  ;0B90FE|60      |      ;
 
 
    enemyID_knight_58: LDY.B #$01                           ;0B90FF|A001    |      ;
                       LDA.W $0400,X                        ;0B9101|BD0004  |0B0400;
                       CMP.B #$32                           ;0B9104|C932    |      ;
                       BEQ CODE_0B910A                      ;0B9106|F002    |0B910A;
                       LDY.B #$07                           ;0B9108|A007    |      ;
 
          CODE_0B910A: JSR.W CODE_0B8E11                    ;0B910A|20118E  |0B8E11;
                       LDA.B r_pointerQueue                 ;0B910D|A508    |000008;
                       AND.B #$0F                           ;0B910F|290F    |      ;
                       ORA.B #$80                           ;0B9111|0980    |      ;
                       STA.B $09                            ;0B9113|8509    |000009;
                       LDA.W $0633,X                        ;0B9115|BD3306  |0B0633;
                       AND.B #$70                           ;0B9118|2970    |      ;
                       ORA.B $09                            ;0B911A|0509    |000009;
                       STA.W $0633,X                        ;0B911C|9D3306  |0B0633;
                       LDA.B #$00                           ;0B911F|A900    |      ;
                       STA.W $05C1,X                        ;0B9121|9DC105  |0B05C1;
                       JMP.W CODE_0B81F8                    ;0B9124|4CF881  |0B81F8;
 
 
          CODE_0B9127: LDY.B #$01                           ;0B9127|A001    |      ;
                       LDA.W $0438                          ;0B9129|AD3804  |0B0438;
                       CMP.W $0438,X                        ;0B912C|DD3804  |0B0438;
                       BCC CODE_0B9133                      ;0B912F|9002    |0B9133;
                       LDY.B #$00                           ;0B9131|A000    |      ;
 
          CODE_0B9133: RTS                                  ;0B9133|60      |      ;
 
 
          CODE_0B9134: LDY.B #$00                           ;0B9134|A000    |      ;
                       LDA.W $0438                          ;0B9136|AD3804  |0B0438;
                       CMP.W $0438,X                        ;0B9139|DD3804  |0B0438;
                       BCC CODE_0B9133                      ;0B913C|90F5    |0B9133;
                       LDY.B #$01                           ;0B913E|A001    |      ;
                       RTS                                  ;0B9140|60      |      ;
 
 
enemyID_boneDragonBase_5E: LDA.W $05EF,X                        ;0B9141|BDEF05  |0B05EF;
                       CMP.B #$14                           ;0B9144|C914    |      ;
                       BEQ CODE_0B914C                      ;0B9146|F004    |0B914C;
                       CMP.B #$13                           ;0B9148|C913    |      ;
                       BNE CODE_0B9153                      ;0B914A|D007    |0B9153;
 
          CODE_0B914C: LDY.B #$0D                           ;0B914C|A00D    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B914E|20A6B7  |0BB7A6;
                       BEQ DATA8_0B9192                     ;0B9151|F03F    |0B9192;
 
          CODE_0B9153: LDY.B #$05                           ;0B9153|A005    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B9155|20A6B7  |0BB7A6;
                       BEQ CODE_0B917F                      ;0B9158|F025    |0B917F;
                       JSR.W CODE_0B8B91                    ;0B915A|20918B  |0B8B91;
                       LDA.W $05EF,X                        ;0B915D|BDEF05  |0B05EF;
                       CMP.B #$29                           ;0B9160|C929    |      ;
                       BNE CODE_0B9178                      ;0B9162|D014    |0B9178;
                       LDA.B r_stage                        ;0B9164|A532    |000032;
                       CMP.B #$09                           ;0B9166|C909    |      ;
                       BNE CODE_0B9178                      ;0B9168|D00E    |0B9178;
                       LDA.B r_sceneScrollOffsetHi          ;0B916A|A557    |000057;
                       BNE CODE_0B9178                      ;0B916C|D00A    |0B9178;
                       CLC                                  ;0B916E|18      |      ;
                       LDA.B r_sceneScrollOffsetLo          ;0B916F|A556    |000056;
                       ADC.W $0438,X                        ;0B9171|7D3804  |0B0438;
                       CMP.B #$70                           ;0B9174|C970    |      ;
                       BCC CODE_0B917F                      ;0B9176|9007    |0B917F;
 
          CODE_0B9178: LDY.B #$00                           ;0B9178|A000    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B917A|20A6B7  |0BB7A6;
                       BEQ CODE_0B9184                      ;0B917D|F005    |0B9184;
 
          CODE_0B917F: LDX.B r_entityID_processed           ;0B917F|A66C    |00006C;
                       JMP.W CODE_0B895E                    ;0B9181|4C5E89  |0B895E;
 
 
          CODE_0B9184: LDX.B r_entityID_processed           ;0B9184|A66C    |00006C;
                       DEC.W $0606,X                        ;0B9186|DE0606  |0B0606;
                       BNE CODE_0B9191                      ;0B9189|D006    |0B9191;
                       JSR.W CODE_0B819E                    ;0B918B|209E81  |0B819E;
                       INC.W $05C1,X                        ;0B918E|FEC105  |0B05C1;
 
          CODE_0B9191: RTS                                  ;0B9191|60      |      ;
 
 
         DATA8_0B9192: db $20                               ;0B9192|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9193|        |0FFEC8;
                       LDA.B #$01                           ;0B9195|A901    |      ;
                       STA.W $0520,X                        ;0B9197|9D2005  |0B0520;
                       LDA.W $05EF,X                        ;0B919A|BDEF05  |0B05EF;
                       CMP.B #$14                           ;0B919D|C914    |      ;
                       BEQ CODE_0B91A5                      ;0B919F|F004    |0B91A5;
                       INC.W $05C1,X                        ;0B91A1|FEC105  |0B05C1;
                       RTS                                  ;0B91A4|60      |      ;
 
 
          CODE_0B91A5: LDA.B #$25                           ;0B91A5|A925    |      ;
                       STA.W $05C1,X                        ;0B91A7|9DC105  |0B05C1;
                       RTS                                  ;0B91AA|60      |      ;
 
 
     enemyID_harpy_CC: LDY.B #$05                           ;0B91AB|A005    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B91AD|20A6B7  |0BB7A6;
                       BEQ CODE_0B917F                      ;0B91B0|F0CD    |0B917F;
                       LDX.B r_entityID_processed           ;0B91B2|A66C    |00006C;
                       LDY.B #$00                           ;0B91B4|A000    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B91B6|20A6B7  |0BB7A6;
                       BNE CODE_0B917F                      ;0B91B9|D0C4    |0B917F;
                       LDX.B r_entityID_processed           ;0B91BB|A66C    |00006C;
                       DEC.W $0606,X                        ;0B91BD|DE0606  |0B0606;
                       BNE CODE_0B91E2                      ;0B91C0|D020    |0B91E2;
                       LDA.B #$40                           ;0B91C2|A940    |      ;
                       STA.W $0606,X                        ;0B91C4|9D0606  |0B0606;
                       JSR.W CODE_0B8230                    ;0B91C7|203082  |0B8230;
                       LDA.W $04A8,X                        ;0B91CA|BDA804  |0B04A8;
                       BNE CODE_0B91DA                      ;0B91CD|D00B    |0B91DA;
                       LDA.W $04F2,X                        ;0B91CF|BDF204  |0B04F2;
                       BPL CODE_0B91E2                      ;0B91D2|100E    |0B91E2;
                       JSR.W CODE_0B804B                    ;0B91D4|204B80  |0B804B;
                       JMP.W CODE_0B91E2                    ;0B91D7|4CE291  |0B91E2;
 
 
          CODE_0B91DA: LDA.W $04F2,X                        ;0B91DA|BDF204  |0B04F2;
                       BMI CODE_0B91E2                      ;0B91DD|3003    |0B91E2;
                       JSR.W CODE_0B804B                    ;0B91DF|204B80  |0B804B;
 
          CODE_0B91E2: LDA.W $0400,X                        ;0B91E2|BD0004  |0B0400;
                       CMP.B #$2C                           ;0B91E5|C92C    |      ;
                       BNE CODE_0B924D                      ;0B91E7|D064    |0B924D;
                       LDA.W $057C,X                        ;0B91E9|BD7C05  |0B057C;
                       CMP.B #$10                           ;0B91EC|C910    |      ;
                       BNE CODE_0B924D                      ;0B91EE|D05D    |0B924D;
                       LDY.B #$0B                           ;0B91F0|A00B    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B91F2|20A6B7  |0BB7A6;
                       BEQ CODE_0B924D                      ;0B91F5|F056    |0B924D;
                       LDX.B r_entityID_processed           ;0B91F7|A66C    |00006C;
                       LDY.W $04A8,X                        ;0B91F9|BCA804  |0B04A8;
                       CLC                                  ;0B91FC|18      |      ;
                       LDA.W $041C,X                        ;0B91FD|BD1C04  |0B041C;
                       ADC.B #$07                           ;0B9200|6907    |      ;
                       STA.B $01                            ;0B9202|8501    |000001;
                       LDA.W $0470,X                        ;0B9204|BD7004  |0B0470;
                       AND.B #$BA                           ;0B9207|29BA    |      ;
                       ORA.B #$20                           ;0B9209|0920    |      ;
                       STA.B $09                            ;0B920B|8509    |000009;
                       CLC                                  ;0B920D|18      |      ;
                       LDA.W DATA8_0B9250,Y                 ;0B920E|B95092  |0B9250;
                       ADC.W $0438,X                        ;0B9211|7D3804  |0B0438;
                       STA.B $00                            ;0B9214|8500    |000000;
                       LDA.W $0470,X                        ;0B9216|BD7004  |0B0470;
                       AND.B #$01                           ;0B9219|2901    |      ;
                       ADC.W DATA8_0B9252,Y                 ;0B921B|795292  |0B9252;
                       AND.B #$01                           ;0B921E|2901    |      ;
                       ORA.B $09                            ;0B9220|0509    |000009;
                       STA.B r_temp_Xpos                    ;0B9222|850A    |00000A;
                       JSR.W CODE_0B80E3                    ;0B9224|20E380  |0B80E3;
                       BNE CODE_0B924D                      ;0B9227|D024    |0B924D;
                       LDA.B $00                            ;0B9229|A500    |000000;
                       STA.W $0438,X                        ;0B922B|9D3804  |0B0438;
                       LDA.B $01                            ;0B922E|A501    |000001;
                       STA.W $041C,X                        ;0B9230|9D1C04  |0B041C;
                       LDA.B r_temp_Xpos                    ;0B9233|A50A    |00000A;
                       STA.W $0470,X                        ;0B9235|9D7004  |0B0470;
                       LDA.B #$00                           ;0B9238|A900    |      ;
                       STA.W $05C1,X                        ;0B923A|9DC105  |0B05C1;
                       LDA.B #$47                           ;0B923D|A947    |      ;
                       STA.W $054E,X                        ;0B923F|9D4E05  |0B054E;
                       LDA.B #$5F                           ;0B9242|A95F    |      ;
                       STA.W $05EF,X                        ;0B9244|9DEF05  |0B05EF;
                       JSR.W CODE_0B9FC9                    ;0B9247|20C99F  |0B9FC9;
                       db $20                               ;0B924A|        |      ;
                       dw UNREACH_0FFEC8                    ;0B924B|        |0FFEC8;
 
          CODE_0B924D: LDX.B r_entityID_processed           ;0B924D|A66C    |00006C;
                       RTS                                  ;0B924F|60      |      ;
 
 
         DATA8_0B9250: db $FA,$06                           ;0B9250|        |      ;
 
         DATA8_0B9252: db $FF,$00                           ;0B9252|        |      ;
 
         DATA8_0B9254: db $20                               ;0B9254|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9255|        |0FFEC8;
                       LDA.B #$01                           ;0B9257|A901    |      ;
                       STA.W $0520,X                        ;0B9259|9D2005  |0B0520;
                       INC.W $05C1,X                        ;0B925C|FEC105  |0B05C1;
                       RTS                                  ;0B925F|60      |      ;
 
 
          enemyID__76: JSR.W CODE_0B93A6                    ;0B9260|20A693  |0B93A6;
                       LDY.B #$10                           ;0B9263|A010    |      ;
                       db $20                               ;0B9265|        |      ;
                       dw UNREACH_0FFC1E                    ;0B9266|        |0FFC1E;
                       BEQ DATA8_0B9254                     ;0B9268|F0EA    |0B9254;
                       LDX.B r_entityID_processed           ;0B926A|A66C    |00006C;
                       JSR.W CODE_0B93B0                    ;0B926C|20B093  |0B93B0;
                       LDY.B #$10                           ;0B926F|A010    |      ;
                       db $20                               ;0B9271|        |      ;
                       dw UNREACH_0FFC1E                    ;0B9272|        |0FFC1E;
                       BEQ CODE_0B92D6                      ;0B9274|F060    |0B92D6;
                       CMP.B #$04                           ;0B9276|C904    |      ;
                       BEQ CODE_0B92D6                      ;0B9278|F05C    |0B92D6;
                       LDX.B r_entityID_processed           ;0B927A|A66C    |00006C;
                       JSR.W CODE_0B93B0                    ;0B927C|20B093  |0B93B0;
                       LDY.B #$08                           ;0B927F|A008    |      ;
                       db $20                               ;0B9281|        |      ;
                       dw UNREACH_0FFC1E                    ;0B9282|        |0FFC1E;
                       BNE CODE_0B92D6                      ;0B9284|D050    |0B92D6;
                       DEC.W $061D,X                        ;0B9286|DE1D06  |0B061D;
                       BNE CODE_0B92C3                      ;0B9289|D038    |0B92C3;
                       db $20                               ;0B928B|        |      ;
                       dw UNREACH_0FFEC8                    ;0B928C|        |0FFEC8;
                       INC.W $05C1,X                        ;0B928E|FEC105  |0B05C1;
                       INC.W $05C1,X                        ;0B9291|FEC105  |0B05C1;
                       INC.W $05C1,X                        ;0B9294|FEC105  |0B05C1;
                       RTS                                  ;0B9297|60      |      ;
 
 
enemyID_zombieSide_68: JSR.W CODE_0B93B0                    ;0B9298|20B093  |0B93B0;
                       LDY.B #$10                           ;0B929B|A010    |      ;
                       db $20                               ;0B929D|        |      ;
                       dw UNREACH_0FFC1E                    ;0B929E|        |0FFC1E;
                       BEQ CODE_0B92DB                      ;0B92A0|F039    |0B92DB;
                       LDX.B r_entityID_processed           ;0B92A2|A66C    |00006C;
                       JSR.W CODE_0B93BA                    ;0B92A4|20BA93  |0B93BA;
                       LDY.B #$08                           ;0B92A7|A008    |      ;
                       db $20                               ;0B92A9|        |      ;
                       dw UNREACH_0FFC1E                    ;0B92AA|        |0FFC1E;
                       BEQ CODE_0B92BC                      ;0B92AC|F00E    |0B92BC;
                       LDX.B r_entityID_processed           ;0B92AE|A66C    |00006C;
                       JSR.W CODE_0B93BA                    ;0B92B0|20BA93  |0B93BA;
                       LDY.B #$F8                           ;0B92B3|A0F8    |      ;
                       db $20                               ;0B92B5|        |      ;
                       dw UNREACH_0FFC1E                    ;0B92B6|        |0FFC1E;
                       BNE CODE_0B92D6                      ;0B92B8|D01C    |0B92D6;
                       BEQ CODE_0B92DB                      ;0B92BA|F01F    |0B92DB;
 
          CODE_0B92BC: LDX.B r_entityID_processed           ;0B92BC|A66C    |00006C;
                       DEC.W $061D,X                        ;0B92BE|DE1D06  |0B061D;
                       BEQ CODE_0B92D0                      ;0B92C1|F00D    |0B92D0;
 
          CODE_0B92C3: LDA.B #$04                           ;0B92C3|A904    |      ;
                       LDY.W $04F2,X                        ;0B92C5|BCF204  |0B04F2;
                       BPL CODE_0B92CD                      ;0B92C8|1003    |0B92CD;
                       JMP.W CODE_0B806F                    ;0B92CA|4C6F80  |0B806F;
 
 
          CODE_0B92CD: JMP.W CODE_0B808F                    ;0B92CD|4C8F80  |0B808F;
 
 
          CODE_0B92D0: LDA.B #$04                           ;0B92D0|A904    |      ;
                       STA.W $05C1,X                        ;0B92D2|9DC105  |0B05C1;
                       RTS                                  ;0B92D5|60      |      ;
 
 
          CODE_0B92D6: LDX.B r_entityID_processed           ;0B92D6|A66C    |00006C;
                       JMP.W CODE_0B804B                    ;0B92D8|4C4B80  |0B804B;
 
 
          CODE_0B92DB: LDX.B r_entityID_processed           ;0B92DB|A66C    |00006C;
                       INC.W $05C1,X                        ;0B92DD|FEC105  |0B05C1;
                       LDA.B #$01                           ;0B92E0|A901    |      ;
                       LDY.W $04F2,X                        ;0B92E2|BCF204  |0B04F2;
                       BPL CODE_0B92E9                      ;0B92E5|1002    |0B92E9;
                       LDA.B #$FF                           ;0B92E7|A9FF    |      ;
 
          CODE_0B92E9: STA.W $04F2,X                        ;0B92E9|9DF204  |0B04F2;
                       LDA.B #$FE                           ;0B92EC|A9FE    |      ;
                       STA.W $0520,X                        ;0B92EE|9D2005  |0B0520;
                       LDA.B #$00                           ;0B92F1|A900    |      ;
                       STA.W $0509,X                        ;0B92F3|9D0905  |0B0509;
                       STA.W $0537,X                        ;0B92F6|9D3705  |0B0537;
                       JMP.W CODE_0B81EF                    ;0B92F9|4CEF81  |0B81EF;
 
 
   enemyID_lantern_66: LDY.B #$01                           ;0B92FC|A001    |      ;
                       LDA.B ($02),Y                        ;0B92FE|B102    |000002;
                       STA.W $0606,X                        ;0B9300|9D0606  |0B0606;
                       LDA.B #$14                           ;0B9303|A914    |      ;
                       JSR.W CODE_0B807F                    ;0B9305|207F80  |0B807F;
                       LDA.W $0520,X                        ;0B9308|BD2005  |0B0520;
                       BMI CODE_0B931B                      ;0B930B|300E    |0B931B;
                       CMP.B #$02                           ;0B930D|C902    |      ;
                       BCC CODE_0B931B                      ;0B930F|900A    |0B931B;
                       LDA.B #$02                           ;0B9311|A902    |      ;
                       STA.W $0520,X                        ;0B9313|9D2005  |0B0520;
                       LDA.B #$00                           ;0B9316|A900    |      ;
                       STA.W $0537,X                        ;0B9318|9D3705  |0B0537;
 
          CODE_0B931B: JSR.W CODE_0B93B0                    ;0B931B|20B093  |0B93B0;
                       LDY.B #$10                           ;0B931E|A010    |      ;
                       db $20                               ;0B9320|        |      ;
                       dw UNREACH_0FFC1E                    ;0B9321|        |0FFC1E;
                       BEQ CODE_0B9341                      ;0B9323|F01C    |0B9341;
                       LDX.B r_entityID_processed           ;0B9325|A66C    |00006C;
                       LDY.B #$06                           ;0B9327|A006    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B9329|20A6B7  |0BB7A6;
                       BEQ CODE_0B9342                      ;0B932C|F014    |0B9342;
                       LDX.B r_entityID_processed           ;0B932E|A66C    |00006C;
                       db $20                               ;0B9330|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9331|        |0FFEC8;
                       INC.W $05C1,X                        ;0B9333|FEC105  |0B05C1;
                       JSR.W CODE_0B81F8                    ;0B9336|20F881  |0B81F8;
                       LDA.W $041C,X                        ;0B9339|BD1C04  |0B041C;
                       AND.B #$F0                           ;0B933C|29F0    |      ;
                       STA.W $041C,X                        ;0B933E|9D1C04  |0B041C;
 
          CODE_0B9341: RTS                                  ;0B9341|60      |      ;
 
 
          CODE_0B9342: LDX.B r_entityID_processed           ;0B9342|A66C    |00006C;
                       db $20                               ;0B9344|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9345|        |0FFEC8;
                       LDA.B #$01                           ;0B9347|A901    |      ;
                       STA.W $0520,X                        ;0B9349|9D2005  |0B0520;
                       LDA.B #$80                           ;0B934C|A980    |      ;
                       STA.W $0537,X                        ;0B934E|9D3705  |0B0537;
                       LDA.W $0606,X                        ;0B9351|BD0606  |0B0606;
                       STA.W $05C1,X                        ;0B9354|9DC105  |0B05C1;
                       RTS                                  ;0B9357|60      |      ;
 
 
          enemyID__6A: INC.W $05C1,X                        ;0B9358|FEC105  |0B05C1;
                       JSR.W CODE_0B81AA                    ;0B935B|20AA81  |0B81AA;
                       db $20                               ;0B935E|        |      ;
                       dw UNREACH_0FFEC8                    ;0B935F|        |0FFEC8;
                       LDA.B #$28                           ;0B9361|A928    |      ;
                       STA.W $061D,X                        ;0B9363|9D1D06  |0B061D;
                       JSR.W CODE_0B8230                    ;0B9366|203082  |0B8230;
                       LDA.W $0470,X                        ;0B9369|BD7004  |0B0470;
                       AND.B #$01                           ;0B936C|2901    |      ;
                       BNE CODE_0B9379                      ;0B936E|D009    |0B9379;
                       JSR.W CODE_0B80B3                    ;0B9370|20B380  |0B80B3;
                       CMP.B #$40                           ;0B9373|C940    |      ;
                       BCC CODE_0B93A0                      ;0B9375|9029    |0B93A0;
                       BCS CODE_0B9388                      ;0B9377|B00F    |0B9388;
 
          CODE_0B9379: LDA.W $04A8,X                        ;0B9379|BDA804  |0B04A8;
                       EOR.B #$01                           ;0B937C|4901    |      ;
                       STA.W $04A8,X                        ;0B937E|9DA804  |0B04A8;
                       JSR.W CODE_0B80B3                    ;0B9381|20B380  |0B80B3;
                       CMP.B #$40                           ;0B9384|C940    |      ;
                       BCS CODE_0B93A0                      ;0B9386|B018    |0B93A0;
 
          CODE_0B9388: JSR.W CODE_0B9134                    ;0B9388|203491  |0B9134;
 
          CODE_0B938B: LDA.W DATA8_0B9398,Y                 ;0B938B|B99893  |0B9398;
                       STA.W $04F2,X                        ;0B938E|9DF204  |0B04F2;
                       LDA.W DATA8_0B939C,Y                 ;0B9391|B99C93  |0B939C;
                       STA.W $0509,X                        ;0B9394|9D0905  |0B0509;
                       RTS                                  ;0B9397|60      |      ;
 
 
         DATA8_0B9398: db $FE,$01,$FF,$00                   ;0B9398|        |      ;
 
         DATA8_0B939C: db $D0,$30,$A0                       ;0B939C|        |      ;
                       RTS                                  ;0B939F|60      |      ;
 
 
          CODE_0B93A0: JSR.W CODE_0B9127                    ;0B93A0|202791  |0B9127;
                       JMP.W CODE_0B938B                    ;0B93A3|4C8B93  |0B938B;
 
 
          CODE_0B93A6: LDA.B #$FB                           ;0B93A6|A9FB    |      ;
                       LDY.W $04A8,X                        ;0B93A8|BCA804  |0B04A8;
                       BEQ CODE_0B93B9                      ;0B93AB|F00C    |0B93B9;
                       LDA.B #$05                           ;0B93AD|A905    |      ;
                       RTS                                  ;0B93AF|60      |      ;
 
 
          CODE_0B93B0: LDA.B #$F8                           ;0B93B0|A9F8    |      ;
                       LDY.W $04F2,X                        ;0B93B2|BCF204  |0B04F2;
                       BMI CODE_0B93B9                      ;0B93B5|3002    |0B93B9;
                       LDA.B #$08                           ;0B93B7|A908    |      ;
 
          CODE_0B93B9: RTS                                  ;0B93B9|60      |      ;
 
 
          CODE_0B93BA: LDA.B #$E8                           ;0B93BA|A9E8    |      ;
                       LDY.W $04F2,X                        ;0B93BC|BCF204  |0B04F2;
                       BMI CODE_0B93B9                      ;0B93BF|30F8    |0B93B9;
                       LDA.B #$18                           ;0B93C1|A918    |      ;
                       RTS                                  ;0B93C3|60      |      ;
 
 
          enemyID__6C: JSR.W CODE_0B80B3                    ;0B93C4|20B380  |0B80B3;
                       LDY.B #$01                           ;0B93C7|A001    |      ;
                       CMP.B ($02),Y                        ;0B93C9|D102    |000002;
                       BCS CODE_0B93D1                      ;0B93CB|B004    |0B93D1;
                       INC.W $05C1,X                        ;0B93CD|FEC105  |0B05C1;
                       RTS                                  ;0B93D0|60      |      ;
 
 
          CODE_0B93D1: LDY.B #$02                           ;0B93D1|A002    |      ;
                       LDA.B ($02),Y                        ;0B93D3|B102    |000002;
                       STA.W $05C1,X                        ;0B93D5|9DC105  |0B05C1;
                       RTS                                  ;0B93D8|60      |      ;
 
 
          enemyID__FC: INC.W $05C1,X                        ;0B93D9|FEC105  |0B05C1;
                       LDA.B #$0F                           ;0B93DC|A90F    |      ;
                       STA.W $0606,X                        ;0B93DE|9D0606  |0B0606;
                       LDA.B #$00                           ;0B93E1|A900    |      ;
                       STA.W $061D,X                        ;0B93E3|9D1D06  |0B061D;
                       LDA.W $0438,X                        ;0B93E6|BD3804  |0B0438;
                       ADC.W $041C,X                        ;0B93E9|7D1C04  |0B041C;
                       LSR A                                ;0B93EC|4A      |      ;
                       LSR A                                ;0B93ED|4A      |      ;
                       LSR A                                ;0B93EE|4A      |      ;
                       ADC.B r_RNG                          ;0B93EF|651F    |00001F;
                       AND.B #$07                           ;0B93F1|2907    |      ;
                       TAY                                  ;0B93F3|A8      |      ;
                       LDA.W DATA8_0B93FB,Y                 ;0B93F4|B9FB93  |0B93FB;
                       STA.W $0633,X                        ;0B93F7|9D3306  |0B0633;
 
          CODE_0B93FA: RTS                                  ;0B93FA|60      |      ;
 
 
         DATA8_0B93FB: db $73,$48,$48,$65,$63,$5C,$8F,$54   ;0B93FB|        |      ;
 
          enemyID__FA: LDA.W $0470,X                        ;0B9403|BD7004  |0B0470;
                       AND.B #$01                           ;0B9406|2901    |      ;
                       BNE CODE_0B93FA                      ;0B9408|D0F0    |0B93FA;
                       DEC.W $0606,X                        ;0B940A|DE0606  |0B0606;
                       BNE CODE_0B9426                      ;0B940D|D017    |0B9426;
                       LDA.W $061D,X                        ;0B940F|BD1D06  |0B061D;
                       EOR.B #$01                           ;0B9412|4901    |      ;
                       STA.W $061D,X                        ;0B9414|9D1D06  |0B061D;
                       TAY                                  ;0B9417|A8      |      ;
                       LDA.W DATA8_0B9439,Y                 ;0B9418|B93994  |0B9439;
                       STA.W $0606,X                        ;0B941B|9D0606  |0B0606;
                       LDA.W $0470,X                        ;0B941E|BD7004  |0B0470;
                       EOR.B #$08                           ;0B9421|4908    |      ;
                       STA.W $0470,X                        ;0B9423|9D7004  |0B0470;
 
          CODE_0B9426: LDA.W $0633,X                        ;0B9426|BD3306  |0B0633;
                       BEQ CODE_0B9430                      ;0B9429|F005    |0B9430;
                       DEC.W $0633,X                        ;0B942B|DE3306  |0B0633;
                       BNE CODE_0B9438                      ;0B942E|D008    |0B9438;
 
          CODE_0B9430: LDX.B r_entityID_processed           ;0B9430|A66C    |00006C;
                       JSR.W CODE_0B81BC                    ;0B9432|20BC81  |0B81BC;
                       INC.W $05C1,X                        ;0B9435|FEC105  |0B05C1;
 
          CODE_0B9438: RTS                                  ;0B9438|60      |      ;
 
 
         DATA8_0B9439: db $28,$07                           ;0B9439|        |      ;
 
          enemyID__FE: JSR.W enemy_2_ID_22                  ;0B943B|204082  |0B8240;
                       JSR.W CODE_0B80B3                    ;0B943E|20B380  |0B80B3;
                       AND.B #$F0                           ;0B9441|29F0    |      ;
                       LSR A                                ;0B9443|4A      |      ;
                       LSR A                                ;0B9444|4A      |      ;
                       LSR A                                ;0B9445|4A      |      ;
                       LSR A                                ;0B9446|4A      |      ;
                       TAY                                  ;0B9447|A8      |      ;
                       LDA.W DATA8_0B9473,Y                 ;0B9448|B97394  |0B9473;
                       STA.W $04F2,X                        ;0B944B|9DF204  |0B04F2;
                       LDA.W DATA8_0B947D,Y                 ;0B944E|B97D94  |0B947D;
                       STA.W $0509,X                        ;0B9451|9D0905  |0B0509;
                       LDA.W $04A8,X                        ;0B9454|BDA804  |0B04A8;
                       BEQ CODE_0B945C                      ;0B9457|F003    |0B945C;
                       JSR.W CODE_0B804B                    ;0B9459|204B80  |0B804B;
 
          CODE_0B945C: JSR.W CODE_0B80D5                    ;0B945C|20D580  |0B80D5;
                       AND.B #$F0                           ;0B945F|29F0    |      ;
                       LSR A                                ;0B9461|4A      |      ;
                       LSR A                                ;0B9462|4A      |      ;
                       LSR A                                ;0B9463|4A      |      ;
                       LSR A                                ;0B9464|4A      |      ;
                       TAY                                  ;0B9465|A8      |      ;
                       LDA.W DATA8_0B9487,Y                 ;0B9466|B98794  |0B9487;
                       STA.W $0520,X                        ;0B9469|9D2005  |0B0520;
                       LDA.W DATA8_0B9491,Y                 ;0B946C|B99194  |0B9491;
                       STA.W $0537,X                        ;0B946F|9D3705  |0B0537;
                       RTS                                  ;0B9472|60      |      ;
 
 
         DATA8_0B9473: db $00,$01,$01,$02,$02,$02,$03,$03   ;0B9473|        |      ;
                       db $03,$04                           ;0B947B|        |      ;
 
         DATA8_0B947D: db $C0,$80,$C0,$00,$80,$C0,$00,$80   ;0B947D|        |      ;
                       db $C0,$80                           ;0B9485|        |      ;
 
         DATA8_0B9487: db $01,$01,$02,$02,$02,$03,$03,$03   ;0B9487|        |      ;
                       db $04,$04                           ;0B948F|        |      ;
 
         DATA8_0B9491: db $80,$C0,$00,$80,$C0,$00,$80,$C0   ;0B9491|        |      ;
 
                       db $00,$80                           ;0B9499|        |      ;
 
        enemy_2_ID_00: LDA.W $0520,X                        ;0B949B|BD2005  |0B0520;
                       BPL CODE_0B94B8                      ;0B949E|1018    |0B94B8;
                       LDA.B #$26                           ;0B94A0|A926    |      ;
                       db $20                               ;0B94A2|        |      ;
                       dw initFreezWaterEffect_01           ;0B94A3|        |0FE25F;
                       JSR.W CODE_0B81F8                    ;0B94A5|20F881  |0B81F8;
                       LDY.B #$06                           ;0B94A8|A006    |      ;
                       LDA.B #$12                           ;0B94AA|A912    |      ;
                       db $20                               ;0B94AC|        |      ;
                       dw CODE_0FEF5C                       ;0B94AD|        |0FEF5C;
                       LDA.B #$30                           ;0B94AF|A930    |      ;
                       STA.W $0606,X                        ;0B94B1|9D0606  |0B0606;
 
          CODE_0B94B4: INC.W $05C1,X                        ;0B94B4|FEC105  |0B05C1;
 
          CODE_0B94B7: RTS                                  ;0B94B7|60      |      ;
 
 
          CODE_0B94B8: LDA.B #$10                           ;0B94B8|A910    |      ;
                       JMP.W CODE_0B80A1                    ;0B94BA|4CA180  |0B80A1;
 
 
        enemy_2_ID_02: DEC.W $0606,X                        ;0B94BD|DE0606  |0B0606;
                       BEQ CODE_0B94B4                      ;0B94C0|F0F2    |0B94B4;
                       BNE CODE_0B94B8                      ;0B94C2|D0F4    |0B94B8;
 
        enemy_2_ID_04: LDA.B #$10                           ;0B94C4|A910    |      ;
                       JSR.W CODE_0B80A1                    ;0B94C6|20A180  |0B80A1;
                       LDA.W $041C,X                        ;0B94C9|BD1C04  |0B041C;
                       CMP.B #$28                           ;0B94CC|C928    |      ;
                       BCC CODE_0B94D4                      ;0B94CE|9004    |0B94D4;
                       CMP.B #$E8                           ;0B94D0|C9E8    |      ;
                       BCC CODE_0B94B7                      ;0B94D2|90E3    |0B94B7;
 
          CODE_0B94D4: LDA.W $0645,X                        ;0B94D4|BD4506  |0B0645;
                       TAX                                  ;0B94D7|AA      |      ;
                       LDA.B #$00                           ;0B94D8|A900    |      ;
                       STA.W $07C8,X                        ;0B94DA|9DC807  |0B07C8;
                       LDX.B r_entityID_processed           ;0B94DD|A66C    |00006C;
                       JMP.W enemyID_frog_4E                ;0B94DF|4CB284  |0B84B2;
 
 
        enemy_2_ID_06: INC.W $05C1,X                        ;0B94E2|FEC105  |0B05C1;
                       db $20                               ;0B94E5|        |      ;
                       dw UNREACH_0FFEC8                    ;0B94E6|        |0FFEC8;
                       LDA.B #$FF                           ;0B94E8|A9FF    |      ;
                       STA.W $0520,X                        ;0B94EA|9D2005  |0B0520;
                       RTS                                  ;0B94ED|60      |      ;
 
 
          enemyID__78: LDY.B #$01                           ;0B94EE|A001    |      ;
                       LDA.W $0633,X                        ;0B94F0|BD3306  |0B0633;
                       CMP.B #$01                           ;0B94F3|C901    |      ;
                       BCC CODE_0B94FD                      ;0B94F5|9006    |0B94FD;
                       LDA.B #$00                           ;0B94F7|A900    |      ;
                       STA.W $0633,X                        ;0B94F9|9D3306  |0B0633;
                       INY                                  ;0B94FC|C8      |      ;
 
          CODE_0B94FD: LDA.B ($02),Y                        ;0B94FD|B102    |000002;
                       STA.W $05C1,X                        ;0B94FF|9DC105  |0B05C1;
                       RTS                                  ;0B9502|60      |      ;
 
 
          enemyID__7C: db $20                               ;0B9503|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9504|        |0FFEC8;
                       LDA.B #$FF                           ;0B9506|A9FF    |      ;
                       STA.W $0520,X                        ;0B9508|9D2005  |0B0520;
                       INC.W $05C1,X                        ;0B950B|FEC105  |0B05C1;
 
          CODE_0B950E: RTS                                  ;0B950E|60      |      ;
 
 
          enemyID__7A: LDA.B #$10                           ;0B950F|A910    |      ;
                       JSR.W CODE_0B80A1                    ;0B9511|20A180  |0B80A1;
                       LDY.B #$04                           ;0B9514|A004    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B9516|20A6B7  |0BB7A6;
                       BEQ CODE_0B9522                      ;0B9519|F007    |0B9522;
                       db $20                               ;0B951B|        |      ;
                       dw UNREACH_0FFEC8                    ;0B951C|        |0FFEC8;
                       INC.W $05C1,X                        ;0B951E|FEC105  |0B05C1;
                       RTS                                  ;0B9521|60      |      ;
 
 
          CODE_0B9522: LDA.W $041C,X                        ;0B9522|BD1C04  |0B041C;
                       CMP.B #$30                           ;0B9525|C930    |      ;
                       BCS CODE_0B950E                      ;0B9527|B0E5    |0B950E;
                       LDA.B #$00                           ;0B9529|A900    |      ;
                       STA.W $0400,X                        ;0B952B|9D0004  |0B0400;
                       db $20                               ;0B952E|        |      ;
                       dw UNREACH_0FFEC8                    ;0B952F|        |0FFEC8;
                       LDY.B #$01                           ;0B9531|A001    |      ;
                       LDA.B ($02),Y                        ;0B9533|B102    |000002;
                       STA.W $05C1,X                        ;0B9535|9DC105  |0B05C1;
                       RTS                                  ;0B9538|60      |      ;
 
 
          enemyID__80: JSR.W CODE_0B8230                    ;0B9539|203082  |0B8230;
                       LDA.B #$00                           ;0B953C|A900    |      ;
                       LDY.B #$C0                           ;0B953E|A0C0    |      ;
                       JSR.W CODE_0B84FF                    ;0B9540|20FF84  |0B84FF;
                       LDA.B #$01                           ;0B9543|A901    |      ;
                       LDY.B #$80                           ;0B9545|A080    |      ;
                       JSR.W CODE_0B8518                    ;0B9547|201885  |0B8518;
                       INC.W $05C1,X                        ;0B954A|FEC105  |0B05C1;
 
          CODE_0B954D: RTS                                  ;0B954D|60      |      ;
 
 
          enemyID__82: LDY.B #$04                           ;0B954E|A004    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B9550|20A6B7  |0BB7A6;
                       BEQ CODE_0B955D                      ;0B9553|F008    |0B955D;
                       LDX.B r_entityID_processed           ;0B9555|A66C    |00006C;
                       INC.W $0633,X                        ;0B9557|FE3306  |0B0633;
                       JMP.W DATA8_0B95AE                   ;0B955A|4CAE95  |0B95AE;
 
 
          CODE_0B955D: LDX.B r_entityID_processed           ;0B955D|A66C    |00006C;
                       LDA.B #$14                           ;0B955F|A914    |      ;
                       JSR.W CODE_0B80A1                    ;0B9561|20A180  |0B80A1;
                       LDA.W $0520,X                        ;0B9564|BD2005  |0B0520;
                       BPL CODE_0B954D                      ;0B9567|10E4    |0B954D;
                       CMP.B #$FD                           ;0B9569|C9FD    |      ;
                       BCS CODE_0B954D                      ;0B956B|B0E0    |0B954D;
                       LDA.W $041C,X                        ;0B956D|BD1C04  |0B041C;
                       CMP.B #$30                           ;0B9570|C930    |      ;
                       BCC DATA8_0B957F                     ;0B9572|900B    |0B957F;
                       LDA.B #$FD                           ;0B9574|A9FD    |      ;
                       STA.W $0520,X                        ;0B9576|9D2005  |0B0520;
                       LDA.B #$00                           ;0B9579|A900    |      ;
                       STA.W $0537,X                        ;0B957B|9D3705  |0B0537;
                       RTS                                  ;0B957E|60      |      ;
 
 
         DATA8_0B957F: db $20                               ;0B957F|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9580|        |0FFEC8;
                       STA.W $0400,X                        ;0B9582|9D0004  |0B0400;
                       LDA.B #$17                           ;0B9585|A917    |      ;
                       STA.W $05C1,X                        ;0B9587|9DC105  |0B05C1;
                       RTS                                  ;0B958A|60      |      ;
 
 
          enemyID__84: LDA.B #$30                           ;0B958B|A930    |      ;
                       STA.W $041C,X                        ;0B958D|9D1C04  |0B041C;
                       LDA.W $0438                          ;0B9590|AD3804  |0B0438;
                       STA.W $0438,X                        ;0B9593|9D3804  |0B0438;
 
          enemyID__86: LDY.B #$01                           ;0B9596|A001    |      ;
                       LDA.B ($02),Y                        ;0B9598|B102    |000002;
                       STA.W $0520,X                        ;0B959A|9D2005  |0B0520;
                       INY                                  ;0B959D|C8      |      ;
                       LDA.B ($02),Y                        ;0B959E|B102    |000002;
                       STA.W $0537,X                        ;0B95A0|9D3705  |0B0537;
                       INC.W $05C1,X                        ;0B95A3|FEC105  |0B05C1;
                       RTS                                  ;0B95A6|60      |      ;
 
 
          enemyID__7E: LDY.B #$03                           ;0B95A7|A003    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B95A9|20A6B7  |0BB7A6;
                       BEQ CODE_0B95B5                      ;0B95AC|F007    |0B95B5;
 
         DATA8_0B95AE: db $20                               ;0B95AE|        |      ;
                       dw UNREACH_0FFEC8                    ;0B95AF|        |0FFEC8;
                       INC.W $05C1,X                        ;0B95B1|FEC105  |0B05C1;
 
          CODE_0B95B4: RTS                                  ;0B95B4|60      |      ;
 
 
          CODE_0B95B5: LDA.B #$10                           ;0B95B5|A910    |      ;
                       JSR.W CODE_0B807F                    ;0B95B7|207F80  |0B807F;
                       LDA.W $0520,X                        ;0B95BA|BD2005  |0B0520;
                       CMP.B #$02                           ;0B95BD|C902    |      ;
                       BCC CODE_0B95B4                      ;0B95BF|90F3    |0B95B4;
                       LDA.B #$02                           ;0B95C1|A902    |      ;
                       STA.W $0520,X                        ;0B95C3|9D2005  |0B0520;
                       LDA.B #$00                           ;0B95C6|A900    |      ;
                       STA.W $0537,X                        ;0B95C8|9D3705  |0B0537;
                       RTS                                  ;0B95CB|60      |      ;
 
 
          enemyID__8A: LDY.B #$01                           ;0B95CC|A001    |      ;
                       LDA.B ($02),Y                        ;0B95CE|B102    |000002;
                       STA.W $061D,X                        ;0B95D0|9D1D06  |0B061D;
                       TXA                                  ;0B95D3|8A      |      ;
                       ADC.B r_gameStateLoopCounter         ;0B95D4|651A    |00001A;
                       AND.B #$07                           ;0B95D6|2907    |      ;
                       TAY                                  ;0B95D8|A8      |      ;
                       LDA.W DATA8_0B95FB,Y                 ;0B95D9|B9FB95  |0B95FB;
                       STA.W $04F2,X                        ;0B95DC|9DF204  |0B04F2;
                       LDA.W DATA8_0B9603,Y                 ;0B95DF|B90396  |0B9603;
                       STA.W $0537,X                        ;0B95E2|9D3705  |0B0537;
                       LDA.W DATA8_0B960B,Y                 ;0B95E5|B90B96  |0B960B;
                       STA.W $0520,X                        ;0B95E8|9D2005  |0B0520;
                       LDA.W DATA8_0B9613,Y                 ;0B95EB|B91396  |0B9613;
                       STA.W $0537,X                        ;0B95EE|9D3705  |0B0537;
                       LDA.W DATA8_0B961B,Y                 ;0B95F1|B91B96  |0B961B;
                       STA.W $0606,X                        ;0B95F4|9D0606  |0B0606;
                       INC.W $05C1,X                        ;0B95F7|FEC105  |0B05C1;
                       RTS                                  ;0B95FA|60      |      ;
 
 
         DATA8_0B95FB: db $01,$FF,$FF,$00,$FF,$00,$FE,$00   ;0B95FB|        |      ;
 
         DATA8_0B9603: db $20,$10,$20,$F8,$10,$D0,$D0,$C0   ;0B9603|        |      ;
 
         DATA8_0B960B: db $FF,$FE,$FE,$FE,$FF,$FE,$FE,$FE   ;0B960B|        |      ;
 
         DATA8_0B9613: db $00,$40,$C0,$20,$20,$C0,$40,$81   ;0B9613|        |      ;
 
         DATA8_0B961B: db $20,$24,$3C,$48,$30,$28,$1C,$38   ;0B961B|        |      ;
 
          enemyID__8C: db $DE,$1D,$06,$F0,$09,$BD,$06,$06   ;0B9623|        |      ;
                       JSR.W CODE_0B807F                    ;0B962B|207F80  |0B807F;
                       JMP.W enemyID_boneDragonRip_5C       ;0B962E|4CB884  |0B84B8;
 
                       JMP.W enemyID_frog_4E                ;0B9631|4CB284  |0B84B2;
 
 
       enemyID_axe_B4: LDA.B r_gameStateLoopCounter         ;0B9634|A51A    |00001A;
                       STA.W $0509,X                        ;0B9636|9D0905  |0B0509;
                       TXA                                  ;0B9639|8A      |      ;
                       ADC.B r_gameStateLoopCounter         ;0B963A|651A    |00001A;
                       AND.B #$07                           ;0B963C|2907    |      ;
                       JSR.W CODE_0B807F                    ;0B963E|207F80  |0B807F;
                       JMP.W enemyID_boneDragonRip_5C       ;0B9641|4CB884  |0B84B8;
 
 
          enemyID__8E: LDA.B #$00                           ;0B9644|A900    |      ;
                       STA.W $0633,X                        ;0B9646|9D3306  |0B0633;
                       JSR.W enemyID_fishManSwimJump_54     ;0B9649|20A781  |0B81A7;
                       LDA.B #$00                           ;0B964C|A900    |      ;
                       STA.W $061D,X                        ;0B964E|9D1D06  |0B061D;
                       db $20                               ;0B9651|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9652|        |0FFEC8;
                       JSR.W CODE_0B80D5                    ;0B9654|20D580  |0B80D5;
                       CMP.B #$40                           ;0B9657|C940    |      ;
                       BCS CODE_0B9667                      ;0B9659|B00C    |0B9667;
                       LDA.B r_RNG                          ;0B965B|A51F    |00001F;
                       AND.B #$03                           ;0B965D|2903    |      ;
                       TAY                                  ;0B965F|A8      |      ;
                       LDA.W CODE_0B9673,Y                  ;0B9660|B97396  |0B9673;
                       STA.W $0606,X                        ;0B9663|9D0606  |0B0606;
                       RTS                                  ;0B9666|60      |      ;
 
 
          CODE_0B9667: LDA.B r_RNG                          ;0B9667|A51F    |00001F;
                       AND.B #$03                           ;0B9669|2903    |      ;
                       TAY                                  ;0B966B|A8      |      ;
                       LDA.W DATA8_0B9677,Y                 ;0B966C|B97796  |0B9677;
                       STA.W $0606,X                        ;0B966F|9D0606  |0B0606;
 
          CODE_0B9672: RTS                                  ;0B9672|60      |      ;
 
 
          CODE_0B9673: JSR.W $302C                          ;0B9673|202C30  |0B302C;
                       db $38                               ;0B9676|        |      ;
 
         DATA8_0B9677: db $10,$18,$1C,$14                   ;0B9677|        |      ;
 
          enemyID__90: DEC.W $0606,X                        ;0B967B|DE0606  |0B0606;
                       BEQ CODE_0B9686                      ;0B967E|F006    |0B9686;
                       JSR.W CODE_0B8243                    ;0B9680|204382  |0B8243;
                       JMP.W CODE_0B975C                    ;0B9683|4C5C97  |0B975C;
 
 
          CODE_0B9686: LDA.B r_gameStateLoopCounter         ;0B9686|A51A    |00001A;
                       AND.B #$03                           ;0B9688|2903    |      ;
                       TAY                                  ;0B968A|A8      |      ;
                       LDA.W CODE_0B9694,Y                  ;0B968B|B99496  |0B9694;
                       STA.W $0606,X                        ;0B968E|9D0606  |0B0606;
                       JMP.W enemyID_zombie_02              ;0B9691|4C9B81  |0B819B;
 
 
          CODE_0B9694: JSR.W $1C18                          ;0B9694|20181C  |0B1C18;
                       PLP                                  ;0B9697|28      |      ;
 
          enemyID__92: DEC.W $0606,X                        ;0B9698|DE0606  |0B0606;
                       BNE CODE_0B9672                      ;0B969B|D0D5    |0B9672;
                       JSR.W CODE_0B81AA                    ;0B969D|20AA81  |0B81AA;
                       db $20                               ;0B96A0|        |      ;
                       dw UNREACH_0FFEC8                    ;0B96A1|        |0FFEC8;
                       INC.W $0633,X                        ;0B96A3|FE3306  |0B0633;
                       LDA.W $0633,X                        ;0B96A6|BD3306  |0B0633;
                       CMP.B #$08                           ;0B96A9|C908    |      ;
                       BCC CODE_0B96C7                      ;0B96AB|901A    |0B96C7;
                       JSR.W CODE_0B8230                    ;0B96AD|203082  |0B8230;
                       LDA.B #$00                           ;0B96B0|A900    |      ;
                       STA.W $05EF,X                        ;0B96B2|9DEF05  |0B05EF;
                       LDA.W $04A8,X                        ;0B96B5|BDA804  |0B04A8;
                       ASL A                                ;0B96B8|0A      |      ;
                       TAY                                  ;0B96B9|A8      |      ;
                       LDA.W DATA8_0B9750,Y                 ;0B96BA|B95097  |0B9750;
                       STA.W $04F2,X                        ;0B96BD|9DF204  |0B04F2;
                       LDA.W DATA8_0B9751,Y                 ;0B96C0|B95197  |0B9751;
                       STA.W $0509,X                        ;0B96C3|9D0905  |0B0509;
                       RTS                                  ;0B96C6|60      |      ;
 
 
          CODE_0B96C7: DEC.W $05C1,X                        ;0B96C7|DEC105  |0B05C1;
                       JSR.W CODE_0B9779                    ;0B96CA|207997  |0B9779;
                       JSR.W CODE_0B80D5                    ;0B96CD|20D580  |0B80D5;
                       CMP.B #$20                           ;0B96D0|C920    |      ;
                       BCC CODE_0B9709                      ;0B96D2|9035    |0B9709;
                       LDA.B r_RNG                          ;0B96D4|A51F    |00001F;
                       AND.B #$03                           ;0B96D6|2903    |      ;
                       ASL A                                ;0B96D8|0A      |      ;
                       TAY                                  ;0B96D9|A8      |      ;
                       LDA.W DATA8_0B9738,Y                 ;0B96DA|B93897  |0B9738;
                       STA.W $0520,X                        ;0B96DD|9D2005  |0B0520;
                       LDA.W DATA8_0B9739,Y                 ;0B96E0|B93997  |0B9739;
                       STA.W $0537,X                        ;0B96E3|9D3705  |0B0537;
                       TYA                                  ;0B96E6|98      |      ;
                       LSR A                                ;0B96E7|4A      |      ;
                       TAY                                  ;0B96E8|A8      |      ;
                       LDA.W DATA8_0B9748,Y                 ;0B96E9|B94897  |0B9748;
                       STA.W $0606,X                        ;0B96EC|9D0606  |0B0606;
                       LDA.W $04A8,X                        ;0B96EF|BDA804  |0B04A8;
                       ASL A                                ;0B96F2|0A      |      ;
                       TAY                                  ;0B96F3|A8      |      ;
                       LDA.W DATA8_0B9754,Y                 ;0B96F4|B95497  |0B9754;
                       STA.W $04F2,X                        ;0B96F7|9DF204  |0B04F2;
                       LDA.W DATA8_0B9755,Y                 ;0B96FA|B95597  |0B9755;
                       STA.W $0509,X                        ;0B96FD|9D0905  |0B0509;
 
          CODE_0B9700: LDA.W $061D,X                        ;0B9700|BD1D06  |0B061D;
                       BEQ CODE_0B9708                      ;0B9703|F003    |0B9708;
                       JMP.W CODE_0B805D                    ;0B9705|4C5D80  |0B805D;
 
 
          CODE_0B9708: RTS                                  ;0B9708|60      |      ;
 
 
          CODE_0B9709: LDA.B r_RNG                          ;0B9709|A51F    |00001F;
                       AND.B #$03                           ;0B970B|2903    |      ;
                       ASL A                                ;0B970D|0A      |      ;
                       TAY                                  ;0B970E|A8      |      ;
                       LDA.W DATA8_0B9740,Y                 ;0B970F|B94097  |0B9740;
                       STA.W $0520,X                        ;0B9712|9D2005  |0B0520;
                       LDA.W DATA8_0B9741,Y                 ;0B9715|B94197  |0B9741;
                       STA.W $0537,X                        ;0B9718|9D3705  |0B0537;
                       TYA                                  ;0B971B|98      |      ;
                       LSR A                                ;0B971C|4A      |      ;
                       TAY                                  ;0B971D|A8      |      ;
                       LDA.W DATA8_0B974C,Y                 ;0B971E|B94C97  |0B974C;
                       STA.W $0606,X                        ;0B9721|9D0606  |0B0606;
                       LDA.W $04A8,X                        ;0B9724|BDA804  |0B04A8;
                       ASL A                                ;0B9727|0A      |      ;
                       TAY                                  ;0B9728|A8      |      ;
                       LDA.W DATA8_0B9758,Y                 ;0B9729|B95897  |0B9758;
                       STA.W $04F2,X                        ;0B972C|9DF204  |0B04F2;
                       LDA.W DATA8_0B9759,Y                 ;0B972F|B95997  |0B9759;
                       STA.W $0509,X                        ;0B9732|9D0905  |0B0509;
                       JMP.W CODE_0B9700                    ;0B9735|4C0097  |0B9700;
 
 
         DATA8_0B9738: db $01                               ;0B9738|        |      ;
 
         DATA8_0B9739: db $80,$01,$C0,$02,$00,$02,$40       ;0B9739|        |      ;
 
         DATA8_0B9740: db $01                               ;0B9740|        |      ;
 
         DATA8_0B9741: db $00,$00,$A0,$00,$C0,$01,$20       ;0B9741|        |      ;
 
         DATA8_0B9748: db $60,$70,$58,$50                   ;0B9748|        |      ;
 
 
         DATA8_0B974C: db $30,$48,$38,$2C                   ;0B974C|        |      ;
 
         DATA8_0B9750: db $02                               ;0B9750|        |      ;
 
         DATA8_0B9751: db $00,$FE,$00                       ;0B9751|        |      ;
 
         DATA8_0B9754: db $00                               ;0B9754|        |      ;
 
         DATA8_0B9755: db $C0,$FF,$40                       ;0B9755|        |      ;
 
         DATA8_0B9758: db $00                               ;0B9758|        |      ;
 
         DATA8_0B9759: db $40,$FF,$C0                       ;0B9759|        |      ;
 
          CODE_0B975C: JSR.W CODE_0B976C                    ;0B975C|206C97  |0B976C;
                       LDA.B #$08                           ;0B975F|A908    |      ;
                       LDY.W $04A8,X                        ;0B9761|BCA804  |0B04A8;
                       BNE CODE_0B9769                      ;0B9764|D003    |0B9769;
                       JMP.W CODE_0B806F                    ;0B9766|4C6F80  |0B806F;
 
 
          CODE_0B9769: JMP.W CODE_0B808F                    ;0B9769|4C8F80  |0B808F;
 
 
          CODE_0B976C: LDA.B #$08                           ;0B976C|A908    |      ;
                       LDY.W $061D,X                        ;0B976E|BC1D06  |0B061D;
                       BEQ CODE_0B9776                      ;0B9771|F003    |0B9776;
                       JMP.W CODE_0B807F                    ;0B9773|4C7F80  |0B807F;
 
 
          CODE_0B9776: JMP.W CODE_0B80A1                    ;0B9776|4CA180  |0B80A1;
 
 
          CODE_0B9779: LDA.B #$00                           ;0B9779|A900    |      ;
                       LDY.W $041C,X                        ;0B977B|BC1C04  |0B041C;
                       CPY.W $041C                          ;0B977E|CC1C04  |0B041C;
                       BCC CODE_0B9785                      ;0B9781|9002    |0B9785;
                       LDA.B #$01                           ;0B9783|A901    |      ;
 
          CODE_0B9785: STA.W $061D,X                        ;0B9785|9D1D06  |0B061D;
                       RTS                                  ;0B9788|60      |      ;
 
 
          enemyID__AC: INC.W $05C1,X                        ;0B9789|FEC105  |0B05C1;
                       LDY.B #$01                           ;0B978C|A001    |      ;
                       LDA.B ($02),Y                        ;0B978E|B102    |000002;
                       STA.B r_index                        ;0B9790|8510    |000010;
                       LDA.W $0438                          ;0B9792|AD3804  |0B0438;
                       STA.B $04                            ;0B9795|8504    |000004;
                       LDA.W $041C                          ;0B9797|AD1C04  |0B041C;
                       STA.B $05                            ;0B979A|8505    |000005;
                       db $20                               ;0B979C|        |      ;
                       dw UNREACH_0FFF30                    ;0B979D|        |0FFF30;
                       LDA.B $00                            ;0B979F|A500    |000000;
 
          CODE_0B97A1: STA.B $00                            ;0B97A1|8500    |000000;
                       TAY                                  ;0B97A3|A8      |      ;
                       LDA.W DATA8_0B97E0,Y                 ;0B97A4|B9E097  |0B97E0;
                       LDY.B r_index                        ;0B97A7|A410    |000010;
 
          CODE_0B97A9: CLC                                  ;0B97A9|18      |      ;
                       ADC.W DATA8_0B9800,Y                 ;0B97AA|790098  |0B9800;
                       ASL A                                ;0B97AD|0A      |      ;
                       TAY                                  ;0B97AE|A8      |      ;
                       LDA.W DATA8_0B9803,Y                 ;0B97AF|B90398  |0B9803;
                       STA.W $0520,X                        ;0B97B2|9D2005  |0B0520;
                       LDA.W DATA8_0B9839,Y                 ;0B97B5|B93998  |0B9839;
                       STA.W $04F2,X                        ;0B97B8|9DF204  |0B04F2;
                       INY                                  ;0B97BB|C8      |      ;
                       LDA.W DATA8_0B9803,Y                 ;0B97BC|B90398  |0B9803;
                       STA.W $0537,X                        ;0B97BF|9D3705  |0B0537;
                       LDA.W DATA8_0B9839,Y                 ;0B97C2|B93998  |0B9839;
                       STA.W $0509,X                        ;0B97C5|9D0905  |0B0509;
                       LDA.B $00                            ;0B97C8|A500    |000000;
                       AND.B #$10                           ;0B97CA|2910    |      ;
                       BEQ CODE_0B97D1                      ;0B97CC|F003    |0B97D1;
                       JSR.W CODE_0B804B                    ;0B97CE|204B80  |0B804B;
 
          CODE_0B97D1: CLC                                  ;0B97D1|18      |      ;
                       LDA.B $00                            ;0B97D2|A500    |000000;
                       ADC.B #$08                           ;0B97D4|6908    |      ;
                       AND.B #$10                           ;0B97D6|2910    |      ;
                       BEQ CODE_0B97DD                      ;0B97D8|F003    |0B97DD;
                       JSR.W CODE_0B805D                    ;0B97DA|205D80  |0B805D;
 
          CODE_0B97DD: LDX.B r_entityID_processed           ;0B97DD|A66C    |00006C;
                       RTS                                  ;0B97DF|60      |      ;
 
 
         DATA8_0B97E0: db $00,$01,$02,$03,$04,$05,$06,$07   ;0B97E0|        |      ;
                       db $08,$07,$06,$05,$04,$03,$02,$01   ;0B97E8|        |      ;
                       db $00,$01,$02,$03,$04,$05,$06,$07   ;0B97F0|        |      ;
                       db $08,$07,$06,$05,$04,$03,$02,$01   ;0B97F8|        |      ;
 
         DATA8_0B9800: db $00,$12,$24                       ;0B9800|        |      ;
 
         DATA8_0B9803: db $FF,$00,$FF,$06,$FF,$14,$FF,$2C   ;0B9803|        |      ;
                       db $FF,$4C,$FF,$72,$FF,$9E,$FF,$CF   ;0B980B|        |      ;
                       db $00,$00,$FE,$80,$FE,$88,$FE,$9E   ;0B9813|        |      ;
                       db $FE,$C1,$FE,$F1,$FF,$2B,$FF,$6B   ;0B981B|        |      ;
                       db $FF,$B6,$00,$00,$FE,$00,$FE,$0B   ;0B9823|        |      ;
                       db $FE,$27,$FE,$57,$FE,$97,$FE,$E4   ;0B982B|        |      ;
                       db $FE,$3C,$FE,$9D,$00,$00           ;0B9833|        |      ;
 
         DATA8_0B9839: db $00,$00,$00,$31,$00,$62,$00,$8E   ;0B9839|        |      ;
                       db $00,$B4,$00,$D4,$00,$EC,$00,$FA   ;0B9841|        |      ;
                       db $01,$00,$00                       ;0B9849|        |      ;
 
         DATA8_0B984C: db $00,$00,$4A,$00,$93,$00,$D5,$01   ;0B984C|        |      ;
                       db $0F,$01,$3F,$01,$62,$01,$78,$01   ;0B9854|        |      ;
                       db $80,$00,$00,$00,$63,$00,$C4,$01   ;0B985C|        |      ;
                       db $1C,$01,$69,$01,$A9,$01,$D9,$01   ;0B9864|        |      ;
                       db $F5,$02,$00                       ;0B986C|        |      ;
 
          enemyID__AE: db $20,$40,$82,$18,$AD,$F6,$07,$0A   ;0B986F|        |      ;
                       db $7D,$A8,$04,$A8,$B9,$9F,$98,$9D   ;0B9877|        |      ;
                       db $F2,$04,$B9,$A3,$98,$9D,$09,$05   ;0B987F|        |      ;
                       db $A0,$00,$BD,$1C,$04,$CD,$1C,$04   ;0B9887|        |      ;
                       db $90,$01,$C8,$B9,$A7,$98,$9D,$20   ;0B988F|        |      ;
                       db $05,$B9,$A9,$98,$9D,$37,$05,$60   ;0B9897|        |      ;
                       db $00,$FF,$00,$FF,$80,$80,$C0,$40   ;0B989F|        |      ;
                       db $00,$FF,$40,$C0                   ;0B98A7|        |      ;
 
enemyID_spiderling_BC: DEC.W $0606,X                        ;0B98AB|DE0606  |0B0606;
                       BEQ CODE_0B98B7                      ;0B98AE|F007    |0B98B7;
                       LDY.B #$03                           ;0B98B0|A003    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B98B2|20A6B7  |0BB7A6;
                       BEQ CODE_0B98BD                      ;0B98B5|F006    |0B98BD;
 
          CODE_0B98B7: JSR.W CODE_0B819E                    ;0B98B7|209E81  |0B819E;
                       INC.W $05C1,X                        ;0B98BA|FEC105  |0B05C1;
 
          CODE_0B98BD: RTS                                  ;0B98BD|60      |      ;
 
 
          CODE_0B98BE: LDA.B #$17                           ;0B98BE|A917    |      ;
                       STA.W $05C1,X                        ;0B98C0|9DC105  |0B05C1;
                       RTS                                  ;0B98C3|60      |      ;
 
 
  enemyID_tearDrop_B6: JSR.W CODE_0B80D5                    ;0B98C4|20D580  |0B80D5;
                       CMP.B #$18                           ;0B98C7|C918    |      ;
                       BCS CODE_0B98D2                      ;0B98C9|B007    |0B98D2;
                       JSR.W CODE_0B80B3                    ;0B98CB|20B380  |0B80B3;
                       CMP.B #$30                           ;0B98CE|C930    |      ;
                       BCC CODE_0B98BE                      ;0B98D0|90EC    |0B98BE;
 
          CODE_0B98D2: LDA.B r_roomIdx                      ;0B98D2|A534    |000034;
                       BNE CODE_0B98DA                      ;0B98D4|D004    |0B98DA;
                       LDY.B #$00                           ;0B98D6|A000    |      ;
                       BEQ CODE_0B98DF                      ;0B98D8|F005    |0B98DF;
 
          CODE_0B98DA: LDY.B #$01                           ;0B98DA|A001    |      ;
                       LDA.B ($02),Y                        ;0B98DC|B102    |000002;
                       TAY                                  ;0B98DE|A8      |      ;
 
          CODE_0B98DF: LDA.W DATA8_0B9921,Y                 ;0B98DF|B92199  |0B9921;
                       STA.W $0520,X                        ;0B98E2|9D2005  |0B0520;
                       LDA.W DATA8_0B9923,Y                 ;0B98E5|B92399  |0B9923;
                       STA.W $0537,X                        ;0B98E8|9D3705  |0B0537;
                       LDA.W DATA8_0B9925,Y                 ;0B98EB|B92599  |0B9925;
                       STA.W $0606,X                        ;0B98EE|9D0606  |0B0606;
                       LDA.W DATA8_0B9927,Y                 ;0B98F1|B92799  |0B9927;
                       STA.W $04F2,X                        ;0B98F4|9DF204  |0B04F2;
                       LDA.W DATA8_0B9929,Y                 ;0B98F7|B92999  |0B9929;
                       STA.W $0509,X                        ;0B98FA|9D0905  |0B0509;
                       DEC.W $061D,X                        ;0B98FD|DE1D06  |0B061D;
                       BNE CODE_0B9907                      ;0B9900|D005    |0B9907;
                       LDA.B #$29                           ;0B9902|A929    |      ;
                       STA.W $05C1,X                        ;0B9904|9DC105  |0B05C1;
 
          CODE_0B9907: LDY.B #$08                           ;0B9907|A008    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B9909|20A6B7  |0BB7A6;
                       CMP.B #$01                           ;0B990C|C901    |      ;
                       BEQ CODE_0B9913                      ;0B990E|F003    |0B9913;
                       INC.W $05C1,X                        ;0B9910|FEC105  |0B05C1;
 
          CODE_0B9913: INC.W $05C1,X                        ;0B9913|FEC105  |0B05C1;
                       JSR.W CODE_0B81AA                    ;0B9916|20AA81  |0B81AA;
                       LDA.W $04A8,X                        ;0B9919|BDA804  |0B04A8;
                       BEQ CODE_0B98BD                      ;0B991C|F09F    |0B98BD;
                       JMP.W CODE_0B804B                    ;0B991E|4C4B80  |0B804B;
 
 
         DATA8_0B9921: db $FD,$FC                           ;0B9921|        |      ;
 
         DATA8_0B9923: db $00,$00                           ;0B9923|        |      ;
 
         DATA8_0B9925: db $28,$20                           ;0B9925|        |      ;
 
         DATA8_0B9927: db $01,$00                           ;0B9927|        |      ;
 
         DATA8_0B9929: db $20,$C0                           ;0B9929|        |      ;
 
          CODE_0B992B: JSR.W CODE_0B998E                    ;0B992B|208E99  |0B998E;
                       SEC                                  ;0B992E|38      |      ;
                       LDA.W $041C,X                        ;0B992F|BD1C04  |0B041C;
                       SBC.B #$18                           ;0B9932|E918    |      ;
                       STA.B $01                            ;0B9934|8501    |000001;
 
          CODE_0B9936: JSR.W CODE_0B80E3                    ;0B9936|20E380  |0B80E3;
                       BNE CODE_0B9968                      ;0B9939|D02D    |0B9968;
                       JSR.W CODE_0B996B                    ;0B993B|206B99  |0B996B;
                       LDA.B #$2A                           ;0B993E|A92A    |      ;
                       STA.W $05EF,X                        ;0B9940|9DEF05  |0B05EF;
                       JMP.W CODE_0B9936                    ;0B9943|4C3699  |0B9936;
 
 
          enemyID__D0: INC.W $05C1,X                        ;0B9946|FEC105  |0B05C1;
                       JSR.W CODE_0B998E                    ;0B9949|208E99  |0B998E;
                       LDY.B #$01                           ;0B994C|A001    |      ;
                       SEC                                  ;0B994E|38      |      ;
                       LDA.W $041C,X                        ;0B994F|BD1C04  |0B041C;
                       SBC.B ($02),Y                        ;0B9952|F102    |000002;
                       STA.B $01                            ;0B9954|8501    |000001;
 
          CODE_0B9956: JSR.W CODE_0B80E3                    ;0B9956|20E380  |0B80E3;
                       BNE CODE_0B9968                      ;0B9959|D00D    |0B9968;
                       JSR.W CODE_0B996B                    ;0B995B|206B99  |0B996B;
                       LDY.B #$02                           ;0B995E|A002    |      ;
                       LDA.B ($02),Y                        ;0B9960|B102    |000002;
                       STA.W $05EF,X                        ;0B9962|9DEF05  |0B05EF;
                       JMP.W CODE_0B9956                    ;0B9965|4C5699  |0B9956;
 
 
          CODE_0B9968: LDX.B r_entityID_processed           ;0B9968|A66C    |00006C;
                       RTS                                  ;0B996A|60      |      ;
 
 
          CODE_0B996B: LDA.B $00                            ;0B996B|A500    |000000;
                       STA.W $0438,X                        ;0B996D|9D3804  |0B0438;
                       LDA.B $01                            ;0B9970|A501    |000001;
                       STA.W $041C,X                        ;0B9972|9D1C04  |0B041C;
                       LDA.B #$68                           ;0B9975|A968    |      ;
                       STA.W $054E,X                        ;0B9977|9D4E05  |0B054E;
                       LDA.B r_tempCurrRoomIdx              ;0B997A|A50E    |00000E;
                       STA.W $0470,X                        ;0B997C|9D7004  |0B0470;
                       LDA.B #$00                           ;0B997F|A900    |      ;
                       STA.W $05C1,X                        ;0B9981|9DC105  |0B05C1;
                       STA.W $0400,X                        ;0B9984|9D0004  |0B0400;
                       STA.W $048C,X                        ;0B9987|9D8C04  |0B048C;
                       STA.W $0657,X                        ;0B998A|9D5706  |0B0657;
                       RTS                                  ;0B998D|60      |      ;
 
 
          CODE_0B998E: LDA.W $0438,X                        ;0B998E|BD3804  |0B0438;
                       STA.B $00                            ;0B9991|8500    |000000;
                       LDA.W $0470,X                        ;0B9993|BD7004  |0B0470;
                       AND.B #$FB                           ;0B9996|29FB    |      ;
                       ORA.B #$60                           ;0B9998|0960    |      ;
                       STA.B r_tempCurrRoomIdx              ;0B999A|850E    |00000E;
                       RTS                                  ;0B999C|60      |      ;
 
 
          enemyID__D6: LDX.B r_entityID_processed           ;0B999D|A66C    |00006C;
                       LDY.B #$06                           ;0B999F|A006    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B99A1|20A6B7  |0BB7A6;
                       BNE CODE_0B99B4                      ;0B99A4|D00E    |0B99B4;
                       LDX.B r_entityID_processed           ;0B99A6|A66C    |00006C;
                       db $20                               ;0B99A8|        |      ;
                       dw UNREACH_0FFEC8                    ;0B99A9|        |0FFEC8;
                       LDA.B #$01                           ;0B99AB|A901    |      ;
                       STA.W $0520,X                        ;0B99AD|9D2005  |0B0520;
                       INC.W $05C1,X                        ;0B99B0|FEC105  |0B05C1;
                       RTS                                  ;0B99B3|60      |      ;
 
 
          CODE_0B99B4: JSR.W CODE_0B8B91                    ;0B99B4|20918B  |0B8B91;
                       LDX.B r_entityID_processed           ;0B99B7|A66C    |00006C;
                       LDY.B #$08                           ;0B99B9|A008    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B99BB|20A6B7  |0BB7A6;
                       BEQ CODE_0B99EE                      ;0B99BE|F02E    |0B99EE;
                       LDX.B r_entityID_processed           ;0B99C0|A66C    |00006C;
                       LDY.B #$0C                           ;0B99C2|A00C    |      ;
                       JSR.W getCollisionTileValUsingOffsetPresets;0B99C4|20A6B7  |0BB7A6;
                       BNE CODE_0B99EE                      ;0B99C7|D025    |0B99EE;
                       LDA.W $05EF,X                        ;0B99C9|BDEF05  |0B05EF;
                       CMP.B #$71                           ;0B99CC|C971    |      ;
                       BNE CODE_0B99D5                      ;0B99CE|D005    |0B99D5;
                       JSR.W CODE_0B9A0E                    ;0B99D0|200E9A  |0B9A0E;
                       BNE CODE_0B9A09                      ;0B99D3|D034    |0B9A09;
 
          CODE_0B99D5: LDX.B r_entityID_processed           ;0B99D5|A66C    |00006C;
                       DEC.W $0606,X                        ;0B99D7|DE0606  |0B0606;
                       BEQ CODE_0B99EE                      ;0B99DA|F012    |0B99EE;
                       LDY.W $0438,X                        ;0B99DC|BC3804  |0B0438;
                       LDA.W $04A8,X                        ;0B99DF|BDA804  |0B04A8;
                       BNE CODE_0B99E9                      ;0B99E2|D005    |0B99E9;
                       CPY.B #$F4                           ;0B99E4|C0F4    |      ;
                       BCS CODE_0B99EE                      ;0B99E6|B006    |0B99EE;
                       RTS                                  ;0B99E8|60      |      ;
 
 
          CODE_0B99E9: CPY.B #$0C                           ;0B99E9|C00C    |      ;
                       BCC CODE_0B99EE                      ;0B99EB|9001    |0B99EE;
                       RTS                                  ;0B99ED|60      |      ;
 
 
          CODE_0B99EE: LDX.B r_entityID_processed           ;0B99EE|A66C    |00006C;
                       LDA.W $04A8,X                        ;0B99F0|BDA804  |0B04A8;
                       EOR.B #$01                           ;0B99F3|4901    |      ;
                       STA.W $04A8,X                        ;0B99F5|9DA804  |0B04A8;
                       JSR.W CODE_0B804B                    ;0B99F8|204B80  |0B804B;
                       LDA.B r_gameStateLoopCounter         ;0B99FB|A51A    |00001A;
                       ADC.W $0438                          ;0B99FD|6D3804  |0B0438;
                       AND.B #$03                           ;0B9A00|2903    |      ;
                       TAY                                  ;0B9A02|A8      |      ;
                       LDA.W CODE_0B9A0A,Y                  ;0B9A03|B90A9A  |0B9A0A;
                       STA.W $0606,X                        ;0B9A06|9D0606  |0B0606;
 
          CODE_0B9A09: RTS                                  ;0B9A09|60      |      ;
 
 
          CODE_0B9A0A: LDA.B #$D1                           ;0B9A0A|A9D1    |      ;
                       STA.B [r_bossSpawner],Y              ;0B9A0C|97C3    |0000C3;
 
          CODE_0B9A0E: JSR.W CODE_0B80D5                    ;0B9A0E|20D580  |0B80D5;
                       CMP.B #$08                           ;0B9A11|C908    |      ;
                       BCS CODE_0B9A36                      ;0B9A13|B021    |0B9A36;
                       JSR.W CODE_0B80B3                    ;0B9A15|20B380  |0B80B3;
                       CMP.B #$20                           ;0B9A18|C920    |      ;
                       BCS CODE_0B9A36                      ;0B9A1A|B01A    |0B9A36;
                       LDA.B #$00                           ;0B9A1C|A900    |      ;
                       LDY.W $0438,X                        ;0B9A1E|BC3804  |0B0438;
                       CPY.W $0438                          ;0B9A21|CC3804  |0B0438;
                       BCC CODE_0B9A28                      ;0B9A24|9002    |0B9A28;
                       LDA.B #$01                           ;0B9A26|A901    |      ;
 
          CODE_0B9A28: CMP.W $04A8,X                        ;0B9A28|DDA804  |0B04A8;
                       BNE CODE_0B9A36                      ;0B9A2B|D009    |0B9A36;
                       db $20                               ;0B9A2D|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9A2E|        |0FFEC8;
                       LDA.B #$05                           ;0B9A30|A905    |      ;
                       STA.W $05C1,X                        ;0B9A32|9DC105  |0B05C1;
                       RTS                                  ;0B9A35|60      |      ;
 
 
          CODE_0B9A36: LDA.B #$00                           ;0B9A36|A900    |      ;
                       RTS                                  ;0B9A38|60      |      ;
 
 
          enemyID__F2: JSR.W CODE_0B9DC5                    ;0B9A39|20C59D  |0B9DC5;
                       LDX.B r_entityID_processed           ;0B9A3C|A66C    |00006C;
                       RTS                                  ;0B9A3E|60      |      ;
 
 
          enemyID__EE: LDA.W $0470,X                        ;0B9A3F|BD7004  |0B0470;
                       AND.B #$01                           ;0B9A42|2901    |      ;
                       BNE CODE_0B9A6F                      ;0B9A44|D029    |0B9A6F;
                       LDA.W $0633,X                        ;0B9A46|BD3306  |0B0633;
                       STA.W $07ED                          ;0B9A49|8DED07  |0B07ED;
                       LDA.B #$02                           ;0B9A4C|A902    |      ;
                       STA.W $061D,X                        ;0B9A4E|9D1D06  |0B061D;
                       JSR.W enemyID_fishManSwimJump_54     ;0B9A51|20A781  |0B81A7;
                       db $20                               ;0B9A54|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9A55|        |0FFEC8;
                       LDA.B #$30                           ;0B9A57|A930    |      ;
                       STA.W $07EE                          ;0B9A59|8DEE07  |0B07EE;
                       LDA.B #$00                           ;0B9A5C|A900    |      ;
                       STA.W $07EF                          ;0B9A5E|8DEF07  |0B07EF;
                       LDY.W $07ED                          ;0B9A61|ACED07  |0B07ED;
                       LDA.W DATA8_0B9A70,Y                 ;0B9A64|B9709A  |0B9A70;
                       STA.W $04F2,X                        ;0B9A67|9DF204  |0B04F2;
 
          CODE_0B9A6A: LDA.B #$09                           ;0B9A6A|A909    |      ;
                       STA.W $0606,X                        ;0B9A6C|9D0606  |0B0606;
 
          CODE_0B9A6F: RTS                                  ;0B9A6F|60      |      ;
 
 
         DATA8_0B9A70: db $01,$FF                           ;0B9A70|        |      ;
 
         DATA8_0B9A72: db $F8,$08                           ;0B9A72|        |      ;
 
         DATA8_0B9A74: db $00,$01                           ;0B9A74|        |      ;
 
         DATA8_0B9A76: db $08,$18                           ;0B9A76|        |      ;
 
          enemyID__EC: DEC.W $0606,X                        ;0B9A78|DE0606  |0B0606;
                       BNE CODE_0B9A6F                      ;0B9A7B|D0F2    |0B9A6F;
                       LDA.W $061D,X                        ;0B9A7D|BD1D06  |0B061D;
                       CMP.B #$08                           ;0B9A80|C908    |      ;
                       BEQ CODE_0B9B02                      ;0B9A82|F07E    |0B9B02;
                       LDY.W $07ED                          ;0B9A84|ACED07  |0B07ED;
                       LDA.W DATA8_0B9A74,Y                 ;0B9A87|B9749A  |0B9A74;
                       STA.B $00                            ;0B9A8A|8500    |000000;
                       LDA.W DATA8_0B9B72,Y                 ;0B9A8C|B9729B  |0B9B72;
                       STA.B $09                            ;0B9A8F|8509    |000009;
                       CLC                                  ;0B9A91|18      |      ;
                       LDA.W $0438,X                        ;0B9A92|BD3804  |0B0438;
                       ADC.W DATA8_0B9A72,Y                 ;0B9A95|79729A  |0B9A72;
                       LDY.W $061D,X                        ;0B9A98|BC1D06  |0B061D;
                       STA.W $0438,Y                        ;0B9A9B|993804  |0B0438;
                       LDA.W $0470,X                        ;0B9A9E|BD7004  |0B0470;
                       AND.B #$BE                           ;0B9AA1|29BE    |      ;
                       STA.B r_pointerQueue                 ;0B9AA3|8508    |000008;
                       LDA.W $0470,X                        ;0B9AA5|BD7004  |0B0470;
                       AND.B #$01                           ;0B9AA8|2901    |      ;
                       ADC.B $09                            ;0B9AAA|6509    |000009;
                       AND.B #$01                           ;0B9AAC|2901    |      ;
                       ORA.B r_pointerQueue                 ;0B9AAE|0508    |000008;
                       STA.W $0470,Y                        ;0B9AB0|997004  |0B0470;
                       LDA.B $00                            ;0B9AB3|A500    |000000;
                       STA.W $04A8,Y                        ;0B9AB5|99A804  |0B04A8;
                       LDA.W $041C,X                        ;0B9AB8|BD1C04  |0B041C;
                       STA.W $041C,Y                        ;0B9ABB|991C04  |0B041C;
                       LDA.B #$12                           ;0B9ABE|A912    |      ;
                       STA.W $048C,Y                        ;0B9AC0|998C04  |0B048C;
                       LDA.B #$2D                           ;0B9AC3|A92D    |      ;
                       STA.W $05EF,Y                        ;0B9AC5|99EF05  |0B05EF;
                       LDA.B #$59                           ;0B9AC8|A959    |      ;
                       STA.W $054E,Y                        ;0B9ACA|994E05  |0B054E;
                       LDA.B #$00                           ;0B9ACD|A900    |      ;
                       STA.W $0454,Y                        ;0B9ACF|995404  |0B0454;
                       STA.W $04F2,Y                        ;0B9AD2|99F204  |0B04F2;
                       STA.W $0509,Y                        ;0B9AD5|990905  |0B0509;
                       STA.W $0520,Y                        ;0B9AD8|992005  |0B0520;
                       STA.W $0537,Y                        ;0B9ADB|993705  |0B0537;
                       STA.W $05C1,Y                        ;0B9ADE|99C105  |0B05C1;
                       LDA.B #$20                           ;0B9AE1|A920    |      ;
                       STA.W $067B,Y                        ;0B9AE3|997B06  |0B067B;
                       LDA.B #$20                           ;0B9AE6|A920    |      ;
                       STA.W $0657,Y                        ;0B9AE8|995706  |0B0657;
                       STY.B r_collisionPointYinScreen      ;0B9AEB|8411    |000011;
                       LDA.B #$42                           ;0B9AED|A942    |      ;
                       LDY.B r_CHR_BankSpr_0800             ;0B9AEF|A448    |000048;
                       CPY.B #$14                           ;0B9AF1|C014    |      ;
                       BNE CODE_0B9AF7                      ;0B9AF3|D002    |0B9AF7;
                       LDA.B #$50                           ;0B9AF5|A950    |      ;
 
          CODE_0B9AF7: LDY.B r_collisionPointYinScreen      ;0B9AF7|A411    |000011;
                       STA.W $0400,Y                        ;0B9AF9|990004  |0B0400;
                       INC.W $061D,X                        ;0B9AFC|FE1D06  |0B061D;
                       JMP.W CODE_0B9A6A                    ;0B9AFF|4C6A9A  |0B9A6A;
 
 
          CODE_0B9B02: INC.W $05C1,X                        ;0B9B02|FEC105  |0B05C1;
                       db $20                               ;0B9B05|        |      ;
                       dw UNREACH_0FFEC8                    ;0B9B06|        |0FFEC8;
                       LDA.B #$00                           ;0B9B08|A900    |      ;
                       STA.W $07EC                          ;0B9B0A|8DEC07  |0B07EC;
                       JSR.W CODE_0B819E                    ;0B9B0D|209E81  |0B819E;
                       LDY.W $07ED                          ;0B9B10|ACED07  |0B07ED;
                       LDA.W DATA8_0B9A76,Y                 ;0B9B13|B9769A  |0B9A76;
                       STA.B $07                            ;0B9B16|8507    |000007;
                       LDX.B #$01                           ;0B9B18|A201    |      ;
 
          CODE_0B9B1A: LDA.B $07                            ;0B9B1A|A507    |000007;
                       STA.W $0606,X                        ;0B9B1C|9D0606  |0B0606;
                       STA.W $061D,X                        ;0B9B1F|9D1D06  |0B061D;
                       JSR.W CODE_0B9B3C                    ;0B9B22|203C9B  |0B9B3C;
                       JSR.W CODE_0B9B4E                    ;0B9B25|204E9B  |0B9B4E;
                       INX                                  ;0B9B28|E8      |      ;
                       CPX.B #$09                           ;0B9B29|E009    |      ;
                       BCC CODE_0B9B1A                      ;0B9B2B|90ED    |0B9B1A;
                       LDX.B #$01                           ;0B9B2D|A201    |      ;
 
          CODE_0B9B2F: LDA.B #$02                           ;0B9B2F|A902    |      ;
                       STA.W $05C1,X                        ;0B9B31|9DC105  |0B05C1;
                       INX                                  ;0B9B34|E8      |      ;
                       CPX.B #$08                           ;0B9B35|E008    |      ;
                       BCC CODE_0B9B2F                      ;0B9B37|90F6    |0B9B2F;
                       LDX.B r_entityID_processed           ;0B9B39|A66C    |00006C;
                       RTS                                  ;0B9B3B|60      |      ;
 
 
          CODE_0B9B3C: TXA                                  ;0B9B3C|8A      |      ;
                       TAY                                  ;0B9B3D|A8      |      ;
                       LDA.W $0633,X                        ;0B9B3E|BD3306  |0B0633;
                       AND.B #$F0                           ;0B9B41|29F0    |      ;
                       STA.B $01                            ;0B9B43|8501    |000001;
                       LDA.W DATA8_0B9B60,Y                 ;0B9B45|B9609B  |0B9B60;
                       ORA.B $01                            ;0B9B48|0501    |000001;
                       STA.W $0633,X                        ;0B9B4A|9D3306  |0B0633;
                       RTS                                  ;0B9B4D|60      |      ;
 
 
          CODE_0B9B4E: TXA                                  ;0B9B4E|8A      |      ;
                       TAY                                  ;0B9B4F|A8      |      ;
                       LDA.W $0633,X                        ;0B9B50|BD3306  |0B0633;
                       AND.B #$0F                           ;0B9B53|290F    |      ;
                       STA.B $01                            ;0B9B55|8501    |000001;
                       LDA.W DATA8_0B9B69,Y                 ;0B9B57|B9699B  |0B9B69;
                       ORA.B $01                            ;0B9B5A|0501    |000001;
                       STA.W $0633,X                        ;0B9B5C|9D3306  |0B0633;
                       RTS                                  ;0B9B5F|60      |      ;
 
 
         DATA8_0B9B60: db $02,$02,$02,$02,$02,$02,$02,$02   ;0B9B60|        |      ;
                       db $02                               ;0B9B68|        |      ;
 
         DATA8_0B9B69: db $80,$80,$80,$80,$80,$80,$80,$80   ;0B9B69|        |      ;
                       db $80                               ;0B9B71|        |      ;
 
         DATA8_0B9B72: db $FF,$00                           ;0B9B72|        |      ;
 
          enemyID__F0: JSR.W CODE_0B9B83                    ;0B9B74|20839B  |0B9B83;
                       JSR.W CODE_0B9BF8                    ;0B9B77|20F89B  |0B9BF8;
                       JSR.W CODE_0B9DE9                    ;0B9B7A|20E99D  |0B9DE9;
                       JSR.W CODE_0B9DC5                    ;0B9B7D|20C59D  |0B9DC5;
                       LDX.B r_entityID_processed           ;0B9B80|A66C    |00006C;
                       RTS                                  ;0B9B82|60      |      ;
 
 
          CODE_0B9B83: LDX.B #$01                           ;0B9B83|A201    |      ;
 
          CODE_0B9B85: LDA.W $0633,X                        ;0B9B85|BD3306  |0B0633;
                       AND.B #$0F                           ;0B9B88|290F    |      ;
                       TAY                                  ;0B9B8A|A8      |      ;
                       DEY                                  ;0B9B8B|88      |      ;
                       BNE CODE_0B9B97                      ;0B9B8C|D009    |0B9B97;
                       JSR.W CODE_0B9B3C                    ;0B9B8E|203C9B  |0B9B3C;
                       JSR.W CODE_0B9BD3                    ;0B9B91|20D39B  |0B9BD3;
                       JMP.W CODE_0B9BA3                    ;0B9B94|4CA39B  |0B9BA3;
 
 
          CODE_0B9B97: STY.B $01                            ;0B9B97|8401    |000001;
                       LDA.W $0633,X                        ;0B9B99|BD3306  |0B0633;
                       AND.B #$F0                           ;0B9B9C|29F0    |      ;
                       ORA.B $01                            ;0B9B9E|0501    |000001;
                       STA.W $0633,X                        ;0B9BA0|9D3306  |0B0633;
 
          CODE_0B9BA3: LDA.W $0633,X                        ;0B9BA3|BD3306  |0B0633;
                       LSR A                                ;0B9BA6|4A      |      ;
                       LSR A                                ;0B9BA7|4A      |      ;
                       LSR A                                ;0B9BA8|4A      |      ;
                       LSR A                                ;0B9BA9|4A      |      ;
                       TAY                                  ;0B9BAA|A8      |      ;
                       DEY                                  ;0B9BAB|88      |      ;
                       BNE CODE_0B9BB7                      ;0B9BAC|D009    |0B9BB7;
                       JSR.W CODE_0B9B4E                    ;0B9BAE|204E9B  |0B9B4E;
                       JSR.W LOOSE_OP_0B9D10                ;0B9BB1|20109D  |0B9D10;
                       JMP.W CODE_0B9BCB                    ;0B9BB4|4CCB9B  |0B9BCB;
 
 
          CODE_0B9BB7: STY.B $01                            ;0B9BB7|8401    |000001;
                       ASL.B $01                            ;0B9BB9|0601    |000001;
                       ASL.B $01                            ;0B9BBB|0601    |000001;
                       ASL.B $01                            ;0B9BBD|0601    |000001;
                       ASL.B $01                            ;0B9BBF|0601    |000001;
                       LDA.W $0633,X                        ;0B9BC1|BD3306  |0B0633;
                       AND.B #$0F                           ;0B9BC4|290F    |      ;
                       ORA.B $01                            ;0B9BC6|0501    |000001;
                       STA.W $0633,X                        ;0B9BC8|9D3306  |0B0633;
 
          CODE_0B9BCB: INX                                  ;0B9BCB|E8      |      ;
                       CPX.B #$09                           ;0B9BCC|E009    |      ;
                       BCC CODE_0B9B85                      ;0B9BCE|90B5    |0B9B85;
                       LDX.B r_entityID_processed           ;0B9BD0|A66C    |00006C;
                       RTS                                  ;0B9BD2|60      |      ;
 
 
          CODE_0B9BD3: LDA.W $061D,X                        ;0B9BD3|BD1D06  |0B061D;
                       SEC                                  ;0B9BD6|38      |      ;
                       SBC.W $0606,X                        ;0B9BD7|FD0606  |0B0606;
                       BEQ CODE_0B9BF7                      ;0B9BDA|F01B    |0B9BF7;
                       AND.B #$10                           ;0B9BDC|2910    |      ;
                       BNE CODE_0B9BEC                      ;0B9BDE|D00C    |0B9BEC;
                       CLC                                  ;0B9BE0|18      |      ;
                       LDA.W $0606,X                        ;0B9BE1|BD0606  |0B0606;
                       ADC.B #$01                           ;0B9BE4|6901    |      ;
                       AND.B #$1F                           ;0B9BE6|291F    |      ;
                       STA.W $0606,X                        ;0B9BE8|9D0606  |0B0606;
                       RTS                                  ;0B9BEB|60      |      ;
 
 
          CODE_0B9BEC: SEC                                  ;0B9BEC|38      |      ;
                       LDA.W $0606,X                        ;0B9BED|BD0606  |0B0606;
                       SBC.B #$01                           ;0B9BF0|E901    |      ;
                       AND.B #$1F                           ;0B9BF2|291F    |      ;
                       STA.W $0606,X                        ;0B9BF4|9D0606  |0B0606;
 
          CODE_0B9BF7: RTS                                  ;0B9BF7|60      |      ;
 
 
          CODE_0B9BF8: LDA.B #$01                           ;0B9BF8|A901    |      ;
                       STA.B r_index                        ;0B9BFA|8510    |000010;
 
          CODE_0B9BFC: LDX.B r_index                        ;0B9BFC|A610    |000010;
                       CPX.B #$07                           ;0B9BFE|E007    |      ;
                       BEQ CODE_0B9C23                      ;0B9C00|F021    |0B9C23;
                       LDA.W $0438,X                        ;0B9C02|BD3804  |0B0438;
                       STA.B $04                            ;0B9C05|8504    |000004;
                       LDA.W $041C,X                        ;0B9C07|BD1C04  |0B041C;
                       STA.B $05                            ;0B9C0A|8505    |000005;
                       LDY.W $0606,X                        ;0B9C0C|BC0606  |0B0606;
                       JSR.W CODE_0B9D7F                    ;0B9C0F|207F9D  |0B9D7F;
                       CLC                                  ;0B9C12|18      |      ;
                       LDA.W DATA8_0B9C67,Y                 ;0B9C13|B9679C  |0B9C67;
                       ADC.B $05                            ;0B9C16|6505    |000005;
                       STA.W $041C,X                        ;0B9C18|9D1C04  |0B041C;
                       JSR.W CODE_0B9C89                    ;0B9C1B|20899C  |0B9C89;
                       INC.B r_index                        ;0B9C1E|E610    |000010;
                       JMP.W CODE_0B9BFC                    ;0B9C20|4CFC9B  |0B9BFC;
 
 
          CODE_0B9C23: LDA.W $0438,X                        ;0B9C23|BD3804  |0B0438;
                       STA.B $04                            ;0B9C26|8504    |000004;
                       LDA.W $041C,X                        ;0B9C28|BD1C04  |0B041C;
                       STA.B $05                            ;0B9C2B|8505    |000005;
                       LDA.W $0470,X                        ;0B9C2D|BD7004  |0B0470;
                       AND.B #$FE                           ;0B9C30|29FE    |      ;
                       STA.B $00                            ;0B9C32|8500    |000000;
                       INX                                  ;0B9C34|E8      |      ;
                       CLC                                  ;0B9C35|18      |      ;
                       LDY.W $07ED                          ;0B9C36|ACED07  |0B07ED;
                       LDA.W DATA8_0B9C87,Y                 ;0B9C39|B9879C  |0B9C87;
                       JSR.W CODE_0B9D8B                    ;0B9C3C|208B9D  |0B9D8B;
                       LDA.B $05                            ;0B9C3F|A505    |000005;
                       STA.W $041C,X                        ;0B9C41|9D1C04  |0B041C;
                       LDX.B r_entityID_processed           ;0B9C44|A66C    |00006C;
                       RTS                                  ;0B9C46|60      |      ;
 
 
         DATA8_0B9C47: db $00,$02,$03,$05,$06,$07,$08,$09   ;0B9C47|        |      ;
                       db $09,$09,$08,$07,$06,$05,$03,$02   ;0B9C4F|        |      ;
                       db $00,$FE,$FD,$FB,$FA,$F9,$F8,$F7   ;0B9C57|        |      ;
                       db $F7,$F7,$F8,$F9,$FA,$FB,$FD,$FE   ;0B9C5F|        |      ;
 
         DATA8_0B9C67: db $F7,$F7,$F8,$F9,$FA,$FB,$FD,$FE   ;0B9C67|        |      ;
                       db $00,$02,$03,$05,$06,$07,$08,$09   ;0B9C6F|        |      ;
                       db $09,$09,$08,$07,$06,$05,$03,$02   ;0B9C77|        |      ;
                       db $00,$FE,$FD,$FB,$FA,$F9,$F7,$F7   ;0B9C7F|        |      ;
 
         DATA8_0B9C87: db $0F,$F1                           ;0B9C87|        |      ;
 
          CODE_0B9C89: LDY.W $0606,X                        ;0B9C89|BC0606  |0B0606;
                       LDA.W DATA8_0B9CC8,Y                 ;0B9C8C|B9C89C  |0B9CC8;
                       STA.W $04A8,X                        ;0B9C8F|9DA804  |0B04A8;
                       LDA.W DATA8_0B9CA8,Y                 ;0B9C92|B9A89C  |0B9CA8;
                       STA.B $0B                            ;0B9C95|850B    |00000B;
                       LDA.B #$00                           ;0B9C97|A900    |      ;
                       LDY.B r_CHR_BankSpr_0800             ;0B9C99|A448    |000048;
                       CPY.B #$14                           ;0B9C9B|C014    |      ;
                       BNE CODE_0B9CA1                      ;0B9C9D|D002    |0B9CA1;
                       LDA.B #$0E                           ;0B9C9F|A90E    |      ;
 
          CODE_0B9CA1: CLC                                  ;0B9CA1|18      |      ;
                       ADC.B $0B                            ;0B9CA2|650B    |00000B;
                       STA.W $0400,X                        ;0B9CA4|9D0004  |0B0400;
                       RTS                                  ;0B9CA7|60      |      ;
 
 
         DATA8_0B9CA8: db $3E,$3E,$40,$40,$40,$40,$40,$42   ;0B9CA8|        |      ;
                       db $42,$42,$42,$44,$44,$44,$44,$46   ;0B9CB0|        |      ;
                       db $46,$46,$44,$44,$44,$44,$44,$42   ;0B9CB8|        |      ;
                       db $42,$42,$42,$46,$46,$46,$46,$44   ;0B9CC0|        |      ;
 
         DATA8_0B9CC8: db $01,$00,$00,$00,$00,$00,$00,$00   ;0B9CC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0B9CD0|        |      ;
                       db $00,$01,$01,$01,$01,$01,$01,$01   ;0B9CD8|        |      ;
                       db $01,$01,$01,$01,$01,$01,$01,$01   ;0B9CE0|        |      ;
 
          enemyID__F4: LDX.B #$01                           ;0B9CE8|A201    |      ;
                       LDA.B r_gameStateLoopCounter         ;0B9CEA|A51A    |00001A;
                       AND.B #$01                           ;0B9CEC|2901    |      ;
                       TAY                                  ;0B9CEE|A8      |      ;
 
          CODE_0B9CEF: LDA.W CODE_0B9D0C,Y                  ;0B9CEF|B90C9D  |0B9D0C;
                       STA.W $054E,X                        ;0B9CF2|9D4E05  |0B054E;
                       LDA.W LOOSE_OP_0B9D0E,Y              ;0B9CF5|B90E9D  |0B9D0E;
                       STA.W $05EF,X                        ;0B9CF8|9DEF05  |0B05EF;
                       LDA.B #$00                           ;0B9CFB|A900    |      ;
                       STA.W $05C1,X                        ;0B9CFD|9DC105  |0B05C1;
                       STA.W $0400,X                        ;0B9D00|9D0004  |0B0400;
                       STA.W $048C,X                        ;0B9D03|9D8C04  |0B048C;
                       INX                                  ;0B9D06|E8      |      ;
                       CPX.B #$09                           ;0B9D07|E009    |      ;
                       BCC CODE_0B9CEF                      ;0B9D09|90E4    |0B9CEF;
                       RTS                                  ;0B9D0B|60      |      ;
 
 
          CODE_0B9D0C: LDX.W $4EA3                          ;0B9D0C|AEA34E  |0B4EA3;
                       EOR.B r_CurrInstrumentDataAddr,S     ;0B9D0F|43E0    |0000E0;
                       db $08                               ;0B9D11|        |      ;
                       BEQ CODE_0B9D1E                      ;0B9D12|F00A    |0B9D1E;
                       TXA                                  ;0B9D14|8A      |      ;
                       TAY                                  ;0B9D15|A8      |      ;
                       INY                                  ;0B9D16|C8      |      ;
                       LDA.W $0606,Y                        ;0B9D17|B90606  |0B0606;
                       STA.W $061D,X                        ;0B9D1A|9D1D06  |0B061D;
                       RTS                                  ;0B9D1D|60      |      ;
 
 
          CODE_0B9D1E: CLC                                  ;0B9D1E|18      |      ;
                       LDY.W $07ED                          ;0B9D1F|ACED07  |0B07ED;
                       LDA.W DATA8_0B9D7D,Y                 ;0B9D22|B97D9D  |0B9D7D;
                       ADC.W $07EC                          ;0B9D25|6DEC07  |0B07EC;
                       TAY                                  ;0B9D28|A8      |      ;
                       LDA.W DATA8_0B9D3F,Y                 ;0B9D29|B93F9D  |0B9D3F;
                       CMP.B #$FF                           ;0B9D2C|C9FF    |      ;
                       BEQ CODE_0B9D37                      ;0B9D2E|F007    |0B9D37;
                       STA.W $061D,X                        ;0B9D30|9D1D06  |0B061D;
                       INC.W $07EC                          ;0B9D33|EEEC07  |0B07EC;
                       RTS                                  ;0B9D36|60      |      ;
 
 
          CODE_0B9D37: LDA.B #$00                           ;0B9D37|A900    |      ;
                       STA.W $07EC                          ;0B9D39|8DEC07  |0B07EC;
                       JMP.W CODE_0B9D1E                    ;0B9D3C|4C1E9D  |0B9D1E;
 
 
         DATA8_0B9D3F: db $08,$0E,$0E,$0A,$0A,$08,$08,$08   ;0B9D3F|        |      ;
                       db $08,$06,$04,$04,$08,$0C,$0C,$0E   ;0B9D47|        |      ;
                       db $0A,$0A,$08,$08,$0E,$0E,$0E,$0E   ;0B9D4F|        |      ;
                       db $0C,$0A,$08,$08,$08,$04,$FF,$18   ;0B9D57|        |      ;
                       db $12,$12,$16,$16,$18,$18,$18,$18   ;0B9D5F|        |      ;
                       db $1A,$14,$14,$18,$14,$14,$12,$16   ;0B9D67|        |      ;
                       db $16,$18,$18,$12,$12,$12,$12,$14   ;0B9D6F|        |      ;
                       db $16,$18,$18,$18,$14,$FF           ;0B9D77|        |      ;
 
         DATA8_0B9D7D: db $00,$1F                           ;0B9D7D|        |      ;
 
          CODE_0B9D7F: LDA.W $0470,X                        ;0B9D7F|BD7004  |0B0470;
                       AND.B #$3E                           ;0B9D82|293E    |      ;
                       STA.B $00                            ;0B9D84|8500    |000000;
                       INX                                  ;0B9D86|E8      |      ;
                       CLC                                  ;0B9D87|18      |      ;
                       LDA.W DATA8_0B9C47,Y                 ;0B9D88|B9479C  |0B9C47;
 
          CODE_0B9D8B: BPL CODE_0B9D96                      ;0B9D8B|1009    |0B9D96;
                       ADC.B $04                            ;0B9D8D|6504    |000004;
                       STA.W $0438,X                        ;0B9D8F|9D3804  |0B0438;
                       LDA.B #$FF                           ;0B9D92|A9FF    |      ;
                       BNE CODE_0B9D9D                      ;0B9D94|D007    |0B9D9D;
 
          CODE_0B9D96: ADC.B $04                            ;0B9D96|6504    |000004;
                       STA.W $0438,X                        ;0B9D98|9D3804  |0B0438;
                       LDA.B #$00                           ;0B9D9B|A900    |      ;
 
          CODE_0B9D9D: STA.B $01                            ;0B9D9D|8501    |000001;
                       DEX                                  ;0B9D9F|CA      |      ;
                       LDA.W $0470,X                        ;0B9DA0|BD7004  |0B0470;
                       AND.B #$01                           ;0B9DA3|2901    |      ;
                       ADC.B $01                            ;0B9DA5|6501    |000001;
                       AND.B #$01                           ;0B9DA7|2901    |      ;
                       ORA.B $00                            ;0B9DA9|0500    |000000;
                       INX                                  ;0B9DAB|E8      |      ;
                       STA.W $0470,X                        ;0B9DAC|9D7004  |0B0470;
                       AND.B #$01                           ;0B9DAF|2901    |      ;
                       BNE CODE_0B9DBC                      ;0B9DB1|D009    |0B9DBC;
                       LDA.W $0470,X                        ;0B9DB3|BD7004  |0B0470;
                       AND.B #$7F                           ;0B9DB6|297F    |      ;
                       STA.W $0470,X                        ;0B9DB8|9D7004  |0B0470;
                       RTS                                  ;0B9DBB|60      |      ;
 
 
          CODE_0B9DBC: LDA.W $0470,X                        ;0B9DBC|BD7004  |0B0470;
                       ORA.B #$80                           ;0B9DBF|0980    |      ;
                       STA.W $0470,X                        ;0B9DC1|9D7004  |0B0470;
                       RTS                                  ;0B9DC4|60      |      ;
 
 
          CODE_0B9DC5: LDX.B #$01                           ;0B9DC5|A201    |      ;
 
          CODE_0B9DC7: LDA.W $054E,X                        ;0B9DC7|BD4E05  |0B054E;
                       BEQ CODE_0B9DD2                      ;0B9DCA|F006    |0B9DD2;
                       INX                                  ;0B9DCC|E8      |      ;
                       CPX.B #$09                           ;0B9DCD|E009    |      ;
                       BCC CODE_0B9DC7                      ;0B9DCF|90F6    |0B9DC7;
                       RTS                                  ;0B9DD1|60      |      ;
 
 
          CODE_0B9DD2: LDX.B #$01                           ;0B9DD2|A201    |      ;
 
          CODE_0B9DD4: JSR.W enemyID_frog_4E                ;0B9DD4|20B284  |0B84B2;
                       STA.W $0470,X                        ;0B9DD7|9D7004  |0B0470;
                       INX                                  ;0B9DDA|E8      |      ;
                       CPX.B #$09                           ;0B9DDB|E009    |      ;
                       BCC CODE_0B9DD4                      ;0B9DDD|90F5    |0B9DD4;
                       LDA.W $064D                          ;0B9DDF|AD4D06  |0B064D;
                       TAX                                  ;0B9DE2|AA      |      ;
                       LDA.B #$02                           ;0B9DE3|A902    |      ;
                       STA.W $07C8,X                        ;0B9DE5|9DC807  |0B07C8;
                       RTS                                  ;0B9DE8|60      |      ;
 
 
          CODE_0B9DE9: LDA.W $07EE                          ;0B9DE9|ADEE07  |0B07EE;
                       BEQ CODE_0B9DF2                      ;0B9DEC|F004    |0B9DF2;
                       DEC.W $07EE                          ;0B9DEE|CEEE07  |0B07EE;
                       RTS                                  ;0B9DF1|60      |      ;
 
 
          CODE_0B9DF2: LDA.W $0478                          ;0B9DF2|AD7804  |0B0478;
                       AND.B #$81                           ;0B9DF5|2981    |      ;
                       BNE CODE_0B9E61                      ;0B9DF7|D068    |0B9E61;
                       LDA.W $07EF                          ;0B9DF9|ADEF07  |0B07EF;
                       BNE CODE_0B9E0C                      ;0B9DFC|D00E    |0B9E0C;
                       LDY.B #$02                           ;0B9DFE|A002    |      ;
                       JSR.W DATA8_0B9E7B                   ;0B9E00|207B9E  |0B9E7B;
                       LDA.B #$10                           ;0B9E03|A910    |      ;
                       STA.W $07EE                          ;0B9E05|8DEE07  |0B07EE;
                       INC.W $07EF                          ;0B9E08|EEEF07  |0B07EF;
                       RTS                                  ;0B9E0B|60      |      ;
 
 
          CODE_0B9E0C: JSR.W CODE_0B80E3                    ;0B9E0C|20E380  |0B80E3;
                       BNE CODE_0B9E61                      ;0B9E0F|D050    |0B9E61;
                       db $20                               ;0B9E11|        |      ;
                       dw CODE_0FFED7                       ;0B9E12|        |0FFED7;
                       LDA.B #$58                           ;0B9E14|A958    |      ;
                       STA.W $05EF,X                        ;0B9E16|9DEF05  |0B05EF;
                       LDA.B #$40                           ;0B9E19|A940    |      ;
                       STA.W $054E,X                        ;0B9E1B|9D4E05  |0B054E;
                       LDA.W $04B0                          ;0B9E1E|ADB004  |0B04B0;
                       EOR.B #$01                           ;0B9E21|4901    |      ;
                       STA.W $04A8,X                        ;0B9E23|9DA804  |0B04A8;
                       JSR.W CODE_0B9FC9                    ;0B9E26|20C99F  |0B9FC9;
                       CLC                                  ;0B9E29|18      |      ;
                       LDA.W $0424                          ;0B9E2A|AD2404  |0B0424;
                       ADC.B #$04                           ;0B9E2D|6904    |      ;
                       STA.W $041C,X                        ;0B9E2F|9D1C04  |0B041C;
                       LDA.W $0478                          ;0B9E32|AD7804  |0B0478;
                       AND.B #$BA                           ;0B9E35|29BA    |      ;
                       ORA.B #$60                           ;0B9E37|0960    |      ;
                       STA.B $09                            ;0B9E39|8509    |000009;
                       CLC                                  ;0B9E3B|18      |      ;
                       LDY.W $07ED                          ;0B9E3C|ACED07  |0B07ED;
                       LDA.W DATA8_0B9E73,Y                 ;0B9E3F|B9739E  |0B9E73;
                       ADC.W $0440                          ;0B9E42|6D4004  |0B0440;
                       STA.W $0438,X                        ;0B9E45|9D3804  |0B0438;
                       LDA.W $0478                          ;0B9E48|AD7804  |0B0478;
                       AND.B #$01                           ;0B9E4B|2901    |      ;
                       ADC.W DATA8_0B9E79,Y                 ;0B9E4D|79799E  |0B9E79;
                       AND.B #$01                           ;0B9E50|2901    |      ;
                       ORA.B $09                            ;0B9E52|0509    |000009;
                       STA.W $0470,X                        ;0B9E54|9D7004  |0B0470;
                       LDA.B #$01                           ;0B9E57|A901    |      ;
                       STA.B r_index                        ;0B9E59|8510    |000010;
                       LDA.W DATA8_0B9E75,Y                 ;0B9E5B|B9759E  |0B9E75;
                       JSR.W CODE_0B97A1                    ;0B9E5E|20A197  |0B97A1;
 
          CODE_0B9E61: LDY.B #$00                           ;0B9E61|A000    |      ;
                       JSR.W DATA8_0B9E7B                   ;0B9E63|207B9E  |0B9E7B;
                       LDA.B #$00                           ;0B9E66|A900    |      ;
                       STA.W $07EF                          ;0B9E68|8DEF07  |0B07EF;
                       LDA.B #$80                           ;0B9E6B|A980    |      ;
                       STA.W $07EE                          ;0B9E6D|8DEE07  |0B07EE;
                       LDX.B r_entityID_processed           ;0B9E70|A66C    |00006C;
                       RTS                                  ;0B9E72|60      |      ;
 
 
         DATA8_0B9E73: db $08,$F8                           ;0B9E73|        |      ;
 
         DATA8_0B9E75: db $08,$18,$3C,$4A                   ;0B9E75|        |      ;
 
         DATA8_0B9E79: db $00,$FF                           ;0B9E79|        |      ;
 
         DATA8_0B9E7B: db $A5,$49,$C9,$11,$F0,$01,$C8,$B9   ;0B9E7B|        |      ;
                       db $89,$9E,$9D,$00,$04,$60,$3A,$48   ;0B9E83|        |      ;
                       db $3C,$4A                           ;0B9E8B|        |      ;
 
        enemy_2_ID_08: LDY.W $0633,X                        ;0B9E8D|BC3306  |0B0633;
                       LDA.W DATA8_0B9F0D,Y                 ;0B9E90|B90D9F  |0B9F0D;
                       STA.W $0606,X                        ;0B9E93|9D0606  |0B0606;
                       LDA.W DATA8_0B9F15,Y                 ;0B9E96|B9159F  |0B9F15;
                       STA.W $061D,X                        ;0B9E99|9D1D06  |0B061D;
                       LDA.W DATA8_0B9F1D,Y                 ;0B9E9C|B91D9F  |0B9F1D;
                       STA.W $0633,X                        ;0B9E9F|9D3306  |0B0633;
                       JSR.W enemyID_fishManSwimJump_54     ;0B9EA2|20A781  |0B81A7;
 
          CODE_0B9EA5: CLC                                  ;0B9EA5|18      |      ;
                       LDY.W $0633,X                        ;0B9EA6|BC3306  |0B0633;
                       LDA.W DATA8_0B9F09,Y                 ;0B9EA9|B9099F  |0B9F09;
                       ADC.W $061D,X                        ;0B9EAC|7D1D06  |0B061D;
                       TAY                                  ;0B9EAF|A8      |      ;
                       LDA.W DATA8_0B9EC9,Y                 ;0B9EB0|B9C99E  |0B9EC9;
                       STA.W $04F2,X                        ;0B9EB3|9DF204  |0B04F2;
                       LDA.W DATA8_0B9ED9,Y                 ;0B9EB6|B9D99E  |0B9ED9;
                       STA.W $0509,X                        ;0B9EB9|9D0905  |0B0509;
                       LDA.W DATA8_0B9EE9,Y                 ;0B9EBC|B9E99E  |0B9EE9;
                       STA.W $0520,X                        ;0B9EBF|9D2005  |0B0520;
                       LDA.W DATA8_0B9EF9,Y                 ;0B9EC2|B9F99E  |0B9EF9;
                       STA.W $0537,X                        ;0B9EC5|9D3705  |0B0537;
                       RTS                                  ;0B9EC8|60      |      ;
 
 
         DATA8_0B9EC9: db $FF,$00,$00,$00,$FF,$00,$00,$00   ;0B9EC9|        |      ;
                       db $FF,$00,$01,$00,$FE,$00,$01,$00   ;0B9ED1|        |      ;
 
         DATA8_0B9ED9: db $80,$00,$80,$00,$40,$00,$C0,$00   ;0B9ED9|        |      ;
                       db $00,$00,$00,$00,$C0,$00,$40,$00   ;0B9EE1|        |      ;
 
         DATA8_0B9EE9: db $00,$00,$00,$FF,$00,$00,$00,$FF   ;0B9EE9|        |      ;
                       db $00,$01,$00,$FF,$00,$01,$00,$FE   ;0B9EF1|        |      ;
 
         DATA8_0B9EF9: db $00,$80,$00,$80,$00,$C0,$00,$40   ;0B9EF9|        |      ;
                       db $00,$00,$00,$00,$00,$40,$00,$C0   ;0B9F01|        |      ;
 
         DATA8_0B9F09: db $00,$04,$08,$0C                   ;0B9F09|        |      ;
 
         DATA8_0B9F0D: db $00,$01,$01,$00,$00,$00,$00,$00   ;0B9F0D|        |      ;
 
         DATA8_0B9F15: db $00,$02,$02,$00,$02,$00,$00,$00   ;0B9F15|        |      ;
 
         DATA8_0B9F1D: db $02,$01,$02,$03,$03,$00,$00,$00   ;0B9F1D|        |      ;
 
        enemy_2_ID_0A: JSR.W CODE_0B9F8E                    ;0B9F25|208E9F  |0B9F8E;
                       JSR.W DATA8_0B9F9B                   ;0B9F28|209B9F  |0B9F9B;
                       BEQ CODE_0B9F41                      ;0B9F2B|F014    |0B9F41;
                       JSR.W CODE_0B9F8E                    ;0B9F2D|208E9F  |0B9F8E;
                       ADC.B #$04                           ;0B9F30|6904    |      ;
                       JSR.W DATA8_0B9F9B                   ;0B9F32|209B9F  |0B9F9B;
                       BEQ CODE_0B9F7B                      ;0B9F35|F044    |0B9F7B;
                       LDX.B r_entityID_processed           ;0B9F37|A66C    |00006C;
                       JSR.W CODE_0B9F8E                    ;0B9F39|208E9F  |0B9F8E;
                       ADC.B #$04                           ;0B9F3C|6904    |      ;
                       JMP.W CODE_0B9F84                    ;0B9F3E|4C849F  |0B9F84;
 
 
          CODE_0B9F41: LDX.B r_entityID_processed           ;0B9F41|A66C    |00006C;
                       INC.W $05C1,X                        ;0B9F43|FEC105  |0B05C1;
                       JMP.W CODE_0B9F81                    ;0B9F46|4C819F  |0B9F81;
 
 
         DATA8_0B9F49: db $01,$02,$03,$00,$03,$00,$01,$02   ;0B9F49|        |      ;
                       db $03,$00,$01,$02,$01,$02,$03,$00   ;0B9F51|        |      ;
 
        enemy_2_ID_0C: JSR.W CODE_0B9F8E                    ;0B9F59|208E9F  |0B9F8E;
                       JSR.W DATA8_0B9F9B                   ;0B9F5C|209B9F  |0B9F9B;
                       BNE CODE_0B9F75                      ;0B9F5F|D014    |0B9F75;
                       JSR.W CODE_0B9F8E                    ;0B9F61|208E9F  |0B9F8E;
                       ADC.B #$04                           ;0B9F64|6904    |      ;
                       JSR.W DATA8_0B9F9B                   ;0B9F66|209B9F  |0B9F9B;
                       BEQ CODE_0B9F7B                      ;0B9F69|F010    |0B9F7B;
                       LDX.B r_entityID_processed           ;0B9F6B|A66C    |00006C;
                       JSR.W CODE_0B9F8E                    ;0B9F6D|208E9F  |0B9F8E;
                       ADC.B #$04                           ;0B9F70|6904    |      ;
                       JSR.W CODE_0B9F84                    ;0B9F72|20849F  |0B9F84;
 
          CODE_0B9F75: LDX.B r_entityID_processed           ;0B9F75|A66C    |00006C;
                       DEC.W $05C1,X                        ;0B9F77|DEC105  |0B05C1;
                       RTS                                  ;0B9F7A|60      |      ;
 
 
          CODE_0B9F7B: LDA.B #$7F                           ;0B9F7B|A97F    |      ;
                       STA.W $067B,X                        ;0B9F7D|9D7B06  |0B067B;
                       RTS                                  ;0B9F80|60      |      ;
 
 
          CODE_0B9F81: JSR.W CODE_0B9F8E                    ;0B9F81|208E9F  |0B9F8E;
 
          CODE_0B9F84: TAY                                  ;0B9F84|A8      |      ;
                       LDA.W DATA8_0B9F49,Y                 ;0B9F85|B9499F  |0B9F49;
                       STA.W $061D,X                        ;0B9F88|9D1D06  |0B061D;
                       JMP.W CODE_0B9EA5                    ;0B9F8B|4CA59E  |0B9EA5;
 
 
          CODE_0B9F8E: CLC                                  ;0B9F8E|18      |      ;
                       LDA.W $061D,X                        ;0B9F8F|BD1D06  |0B061D;
                       LDY.W $0606,X                        ;0B9F92|BC0606  |0B0606;
                       ADC.W DATA8_0B9F99,Y                 ;0B9F95|79999F  |0B9F99;
                       RTS                                  ;0B9F98|60      |      ;
 
 
         DATA8_0B9F99: db $00,$08                           ;0B9F99|        |      ;
 
         DATA8_0B9F9B: db $A8,$B9,$B9,$9F,$85,$00,$B9,$A9   ;0B9F9B|        |      ;
                       db $9F,$A4,$00,$4C,$1E,$FC,$07,$0C   ;0B9FA3|        |      ;
                       db $F8,$F4,$F8,$00,$07,$00,$07,$F4   ;0B9FAB|        |      ;
                       db $F8,$0C,$F8,$00,$07,$00,$0C,$F8   ;0B9FB3|        |      ;
                       db $F4,$07,$00,$07,$00,$F8,$F4,$F8   ;0B9FBB|        |      ;
                       db $0C,$07,$00,$07,$00,$F8           ;0B9FC3|        |      ;
 
          CODE_0B9FC9: LDA.W $07F6                          ;0B9FC9|ADF607  |0B07F6;
                       BNE CODE_0B9FE3                      ;0B9FCC|D015    |0B9FE3;
                       LDA.B r_stage                        ;0B9FCE|A532    |000032;
                       LDY.B #$00                           ;0B9FD0|A000    |      ;
                       CMP.B #$03                           ;0B9FD2|C903    |      ;
                       BCC CODE_0B9FDC                      ;0B9FD4|9006    |0B9FDC;
                       INY                                  ;0B9FD6|C8      |      ;
                       CMP.B #$0C                           ;0B9FD7|C90C    |      ;
                       BCC CODE_0B9FDC                      ;0B9FD9|9001    |0B9FDC;
                       INY                                  ;0B9FDB|C8      |      ;
 
          CODE_0B9FDC: LDA.W DATA8_0B9FE7,Y                 ;0B9FDC|B9E79F  |0B9FE7;
 
          CODE_0B9FDF: STA.W $0657,X                        ;0B9FDF|9D5706  |0B0657;
                       RTS                                  ;0B9FE2|60      |      ;
 
 
          CODE_0B9FE3: LDA.B #$30                           ;0B9FE3|A930    |      ;
                       BNE CODE_0B9FDF                      ;0B9FE5|D0F8    |0B9FDF;
 
         DATA8_0B9FE7: db $10,$20,$30                       ;0B9FE7|        |      ;
 
enemyID_ghostFlicker_D2: db $FE,$C1,$05                       ;0B9FEA|        |      ;
                       LDY.B #$01                           ;0B9FED|A001    |      ;
                       LDA.B ($02),Y                        ;0B9FEF|B102    |000002;
                       STA.W $061D,X                        ;0B9FF1|9D1D06  |0B061D;
                       INY                                  ;0B9FF4|C8      |      ;
                       LDA.B ($02),Y                        ;0B9FF5|B102    |000002;
                       STA.W $0606,X                        ;0B9FF7|9D0606  |0B0606;
 
          CODE_0B9FFA: RTS                                  ;0B9FFA|60      |      ;
 
 
enemyID_bleaManDrop_D4: JSR.W enemy_2_ID_boss_42             ;0B9FFB|202081  |0B8120;
                       BCS CODE_0B9FFA                      ;0B9FFE|B0FA    |0B9FFA;
                       DEC.W $0606,X                        ;0BA000|DE0606  |0B0606;
                       BNE CODE_0BA01E                      ;0BA003|D019    |0BA01E;
                       LDA.W $061D,X                        ;0BA005|BD1D06  |0B061D;
                       EOR.B #$01                           ;0BA008|4901    |      ;
                       STA.W $061D,X                        ;0BA00A|9D1D06  |0B061D;
                       TAY                                  ;0BA00D|A8      |      ;
                       LDA.W CODE_0BA039,Y                  ;0BA00E|B939A0  |0BA039;
                       STA.W $04F2,X                        ;0BA011|9DF204  |0B04F2;
                       LDA.B #$00                           ;0BA014|A900    |      ;
                       STA.W $0509,X                        ;0BA016|9D0905  |0B0509;
                       LDA.B #$38                           ;0BA019|A938    |      ;
                       STA.W $0606,X                        ;0BA01B|9D0606  |0B0606;
 
          CODE_0BA01E: LDA.W $061D,X                        ;0BA01E|BD1D06  |0B061D;
                       BEQ CODE_0BA02E                      ;0BA021|F00B    |0BA02E;
                       LDA.B #$08                           ;0BA023|A908    |      ;
                       JSR.W CODE_0B806F                    ;0BA025|206F80  |0B806F;
                       JSR.W enemyID_fleaMan_1C             ;0BA028|20208E  |0B8E20;
                       JMP.W CODE_0BA054                    ;0BA02B|4C54A0  |0BA054;
 
 
          CODE_0BA02E: LDA.B #$08                           ;0BA02E|A908    |      ;
                       JSR.W CODE_0B808F                    ;0BA030|208F80  |0B808F;
                       JSR.W enemyID_fleaMan_1C             ;0BA033|20208E  |0B8E20;
                       JMP.W CODE_0BA054                    ;0BA036|4C54A0  |0BA054;
 
 
          CODE_0BA039: ORA.B (r_PPUCtrl,X)                  ;0BA039|01FF    |0000FF;
 
          enemyID__6E: LDA.B #$18                           ;0BA03B|A918    |      ;
                       JSR.W CODE_0B807F                    ;0BA03D|207F80  |0B807F;
                       JSR.W enemyID_fleaMan_1C             ;0BA040|20208E  |0B8E20;
                       LDA.W $0520,X                        ;0BA043|BD2005  |0B0520;
                       CMP.B #$02                           ;0BA046|C902    |      ;
                       BCC CODE_0BA054                      ;0BA048|900A    |0BA054;
                       LDA.B #$03                           ;0BA04A|A903    |      ;
                       STA.W $0520,X                        ;0BA04C|9D2005  |0B0520;
                       LDA.B #$00                           ;0BA04F|A900    |      ;
                       STA.W $0537,X                        ;0BA051|9D3705  |0B0537;
 
          CODE_0BA054: JSR.W CODE_0BA0EF                    ;0BA054|20EFA0  |0BA0EF;
                       BCS CODE_0BA068                      ;0BA057|B00F    |0BA068;
                       INC.W $05C1,X                        ;0BA059|FEC105  |0B05C1;
                       INC.W $05C1,X                        ;0BA05C|FEC105  |0B05C1;
                       db $20                               ;0BA05F|        |      ;
                       dw UNREACH_0FFEC8                    ;0BA060|        |0FFEC8;
                       JSR.W CODE_0BA0FC                    ;0BA062|20FCA0  |0BA0FC;
                       db $4C                               ;0BA065|        |      ;
 
                       dw DATA8_0FE76C                      ;0BA066|        |0FE76C;
 
          CODE_0BA068: LDA.B #$00                           ;0BA068|A900    |      ;
                       LDY.W $054E,X                        ;0BA06A|BC4E05  |0B054E;
                       CPY.B #$AE                           ;0BA06D|C0AE    |      ;
                       BNE CODE_0BA075                      ;0BA06F|D004    |0BA075;
                       LDY.B #$02                           ;0BA071|A002    |      ;
                       BNE DATA8_0BA077                     ;0BA073|D002    |0BA077;
 
          CODE_0BA075: LDY.B #$08                           ;0BA075|A008    |      ;
 
         DATA8_0BA077: db $20                               ;0BA077|        |      ;
                       dw UNREACH_0FFC1E                    ;0BA078|        |0FFC1E;
                       BEQ CODE_0BA08A                      ;0BA07A|F00E    |0BA08A;
                       LDX.B r_entityID_processed           ;0BA07C|A66C    |00006C;
                       db $20                               ;0BA07E|        |      ;
                       dw UNREACH_0FFEC8                    ;0BA07F|        |0FFEC8;
                       LDA.B #$A0                           ;0BA081|A9A0    |      ;
                       STA.W $0606,X                        ;0BA083|9D0606  |0B0606;
                       INC.W $05C1,X                        ;0BA086|FEC105  |0B05C1;
 
          CODE_0BA089: RTS                                  ;0BA089|60      |      ;
 
 
          CODE_0BA08A: JSR.W CODE_0B8113                    ;0BA08A|201381  |0B8113;
                       BCC CODE_0BA089                      ;0BA08D|90FA    |0BA089;
                       LDA.W $041C,X                        ;0BA08F|BD1C04  |0B041C;
                       CMP.B r_floodHight                   ;0BA092|C5CA    |0000CA;
                       BCC CODE_0BA089                      ;0BA094|90F3    |0BA089;
                       LDA.W $054E,X                        ;0BA096|BD4E05  |0B054E;
                       CMP.B #$AE                           ;0BA099|C9AE    |      ;
                       BEQ CODE_0BA0A0                      ;0BA09B|F003    |0BA0A0;
                       JSR.W CODE_0B992B                    ;0BA09D|202B99  |0B992B;
 
          CODE_0BA0A0: JMP.W enemyID_frog_4E                ;0BA0A0|4CB284  |0B84B2;
 
 
          enemyID__70: DEC.W $0606,X                        ;0BA0A3|DE0606  |0B0606;
                       BEQ CODE_0BA0B6                      ;0BA0A6|F00E    |0BA0B6;
 
enemyID_zombieSide_E2: JSR.W CODE_0BA0EF                    ;0BA0A8|20EFA0  |0BA0EF;
                       BCS CODE_0BA0C2                      ;0BA0AB|B015    |0BA0C2;
                       INC.W $05C1,X                        ;0BA0AD|FEC105  |0B05C1;
                       JSR.W CODE_0BA0FC                    ;0BA0B0|20FCA0  |0BA0FC;
                       db $4C                               ;0BA0B3|        |      ;
 
                       dw DATA8_0FE76C                      ;0BA0B4|        |0FE76C;
 
          CODE_0BA0B6: LDA.B #$00                           ;0BA0B6|A900    |      ;
                       STA.W $0400,X                        ;0BA0B8|9D0004  |0B0400;
                       STA.W $054E,X                        ;0BA0BB|9D4E05  |0B054E;
                       STA.W $05EF,X                        ;0BA0BE|9DEF05  |0B05EF;
                       RTS                                  ;0BA0C1|60      |      ;
 
 
          CODE_0BA0C2: LDA.B #$00                           ;0BA0C2|A900    |      ;
                       LDY.B #$08                           ;0BA0C4|A008    |      ;
                       db $20                               ;0BA0C6|        |      ;
                       dw UNREACH_0FFC1E                    ;0BA0C7|        |0FFC1E;
                       BNE CODE_0BA0D3                      ;0BA0C9|D008    |0BA0D3;
                       LDX.B r_entityID_processed           ;0BA0CB|A66C    |00006C;
                       LDA.B #$01                           ;0BA0CD|A901    |      ;
                       STA.W $05C1,X                        ;0BA0CF|9DC105  |0B05C1;
                       RTS                                  ;0BA0D2|60      |      ;
 
 
          CODE_0BA0D3: LDX.B r_entityID_processed           ;0BA0D3|A66C    |00006C;
                       JMP.W enemy_2_ID_boss_42             ;0BA0D5|4C2081  |0B8120;
 
 
          enemyID__72: db $20                               ;0BA0D8|        |      ;
                       dw UNREACH_0FFEC8                    ;0BA0D9|        |0FFEC8;
                       JSR.W CODE_0B81AA                    ;0BA0DB|20AA81  |0B81AA;
                       LDY.B #$01                           ;0BA0DE|A001    |      ;
                       LDA.B ($02),Y                        ;0BA0E0|B102    |000002;
                       STA.W $0520,X                        ;0BA0E2|9D2005  |0B0520;
                       INY                                  ;0BA0E5|C8      |      ;
                       LDA.B ($02),Y                        ;0BA0E6|B102    |000002;
                       STA.W $0537,X                        ;0BA0E8|9D3705  |0B0537;
                       INC.W $05C1,X                        ;0BA0EB|FEC105  |0B05C1;
                       RTS                                  ;0BA0EE|60      |      ;
 
 
          CODE_0BA0EF: JSR.W CODE_0B80B3                    ;0BA0EF|20B380  |0B80B3;
                       CMP.B #$0C                           ;0BA0F2|C90C    |      ;
                       BCS CODE_0BA0FB                      ;0BA0F4|B005    |0BA0FB;
                       JSR.W CODE_0B80D5                    ;0BA0F6|20D580  |0B80D5;
                       CMP.B #$14                           ;0BA0F9|C914    |      ;
 
          CODE_0BA0FB: RTS                                  ;0BA0FB|60      |      ;
 
 
          CODE_0BA0FC: SEC                                  ;0BA0FC|38      |      ;
                       LDA.W $054E,X                        ;0BA0FD|BD4E05  |0B054E;
                       SBC.B #$93                           ;0BA100|E993    |      ;
                       db $20                               ;0BA102|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA103|        |0FE86D;
                       dw CODE_0BA150                       ;0BA105|        |0BA150;
                       dw LOOSE_OP_0BA15E                   ;0BA107|        |0BA15E;
                       dw CODE_0BA142                       ;0BA109|        |0BA142;
                       dw LOOSE_OP_0BA15E                   ;0BA10B|        |0BA15E;
                       dw LOOSE_OP_0BA15E                   ;0BA10D|        |0BA15E;
                       dw LOOSE_OP_0BA15E                   ;0BA10F|        |0BA15E;
                       dw LOOSE_OP_0BA15E                   ;0BA111|        |0BA15E;
                       dw LOOSE_OP_0BA15E                   ;0BA113|        |0BA15E;
                       dw CODE_0BA142                       ;0BA115|        |0BA142;
                       dw CODE_0BA150                       ;0BA117|        |0BA150;
                       dw CODE_0BA189                       ;0BA119|        |0BA189;
                       dw CODE_0BA189                       ;0BA11B|        |0BA189;
                       dw CODE_0BA141                       ;0BA11D|        |0BA141;
                       dw CODE_0BA141                       ;0BA11F|        |0BA141;
                       dw CODE_0BA1A9                       ;0BA121|        |0BA1A9;
                       dw CODE_0BA1B5                       ;0BA123|        |0BA1B5;
                       dw CODE_0BA1EF                       ;0BA125|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA127|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA129|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA12B|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA12D|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA12F|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA131|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA133|        |0BA1EF;
                       dw CODE_0BA1EF                       ;0BA135|        |0BA1EF;
                       dw CODE_0BA221                       ;0BA137|        |0BA221;
                       dw CODE_0BA22B                       ;0BA139|        |0BA22B;
                       dw CODE_0BA22B                       ;0BA13B|        |0BA22B;
                       dw CODE_0BA242                       ;0BA13D|        |0BA242;
                       dw CODE_0BA242                       ;0BA13F|        |0BA242;
 
          CODE_0BA141: RTS                                  ;0BA141|60      |      ;
 
 
          CODE_0BA142: JSR.W CODE_0BA17B                    ;0BA142|207BA1  |0BA17B;
                       LDY.W $054E                          ;0BA145|AC4E05  |0B054E;
                       LDA.W CODE_0BA14D,Y                  ;0BA148|B94DA1  |0BA14D;
                       BNE CODE_0BA16B                      ;0BA14B|D01E    |0BA16B;
 
          CODE_0BA14D: ORA.B $00,S                          ;0BA14D|0300    |000000;
                       PHP                                  ;0BA14F|08      |      ;
 
          CODE_0BA150: JSR.W CODE_0BA17B                    ;0BA150|207BA1  |0BA17B;
                       LDY.W $054E                          ;0BA153|AC4E05  |0B054E;
                       LDA.W CODE_0BA15B,Y                  ;0BA156|B95BA1  |0BA15B;
                       BNE CODE_0BA16B                      ;0BA159|D010    |0BA16B;
 
          CODE_0BA15B: ORA.B ($00,X)                        ;0BA15B|0100    |000000;
                       ORA.B #$20                           ;0BA15D|0920    |      ;
                       TDC                                  ;0BA15F|7B      |      ;
                       LDA.B (r_scoreHi,X)                  ;0BA160|A138    |000038;
                       LDA.W $054E,X                        ;0BA162|BD4E05  |0B054E;
                       SBC.B #$93                           ;0BA165|E993    |      ;
                       TAY                                  ;0BA167|A8      |      ;
                       LDA.W DATA8_0BA171,Y                 ;0BA168|B971A1  |0BA171;
 
          CODE_0BA16B: LDY.B r_partnerIdx                   ;0BA16B|A43B    |00003B;
                       STA.W $0085,Y                        ;0BA16D|998500  |0B0085;
                       RTS                                  ;0BA170|60      |      ;
 
 
         DATA8_0BA171: db $01,$02,$03,$04,$0B,$05,$06,$07   ;0BA171|        |      ;
                       db $08,$09                           ;0BA179|        |      ;
 
          CODE_0BA17B: LDA.B #$00                           ;0BA17B|A900    |      ;
                       STA.B $9C                            ;0BA17D|859C    |00009C;
                       LDY.B r_partnerIdx                   ;0BA17F|A43B    |00003B;
                       STA.W $0087,Y                        ;0BA181|998700  |0B0087;
                       LDA.B #$1C                           ;0BA184|A91C    |      ;
                       db $4C                               ;0BA186|        |      ;
 
                       dw initFreezWaterEffect_01           ;0BA187|        |0FE25F;
 
          CODE_0BA189: LDA.B #$1C                           ;0BA189|A91C    |      ;
                       db $20                               ;0BA18B|        |      ;
                       dw initFreezWaterEffect_01           ;0BA18C|        |0FE25F;
                       LDA.B #$01                           ;0BA18E|A901    |      ;
 
          CODE_0BA190: STA.B r_powerUpDrop                  ;0BA190|85B7    |0000B7;
                       LDY.B r_partnerIdx                   ;0BA192|A43B    |00003B;
                       SEC                                  ;0BA194|38      |      ;
                       LDA.W $054E,X                        ;0BA195|BD4E05  |0B054E;
                       SBC.B #$9C                           ;0BA198|E99C    |      ;
                       STA.W $008E,Y                        ;0BA19A|998E00  |0B008E;
                       LDA.B #$00                           ;0BA19D|A900    |      ;
                       STA.W $0400,X                        ;0BA19F|9D0004  |0B0400;
                       STA.W $054E,X                        ;0BA1A2|9D4E05  |0B054E;
                       STA.W $05EF,X                        ;0BA1A5|9DEF05  |0B05EF;
                       RTS                                  ;0BA1A8|60      |      ;
 
 
          CODE_0BA1A9: LDA.B #$17                           ;0BA1A9|A917    |      ;
                       db $20                               ;0BA1AB|        |      ;
                       dw initFreezWaterEffect_01           ;0BA1AC|        |0FE25F;
                       LDA.B #$B4                           ;0BA1AE|A9B4    |      ;
                       STA.B r_potionTimer                  ;0BA1B0|85AD    |0000AD;
                       LDX.B r_entityID_processed           ;0BA1B2|A66C    |00006C;
                       RTS                                  ;0BA1B4|60      |      ;
 
 
          CODE_0BA1B5: LDA.B #$4A                           ;0BA1B5|A94A    |      ;
                       db $20                               ;0BA1B7|        |      ;
                       dw initFreezWaterEffect_01           ;0BA1B8|        |0FE25F;
                       LDX.B #$01                           ;0BA1BA|A201    |      ;
 
          CODE_0BA1BC: LDA.W $054E,X                        ;0BA1BC|BD4E05  |0B054E;
                       CMP.B #$48                           ;0BA1BF|C948    |      ;
                       BCC CODE_0BA1E3                      ;0BA1C1|9020    |0BA1E3;
                       CMP.B #$68                           ;0BA1C3|C968    |      ;
                       BCS CODE_0BA1E3                      ;0BA1C5|B01C    |0BA1E3;
                       TXA                                  ;0BA1C7|8A      |      ;
                       PHA                                  ;0BA1C8|48      |      ;
                       db $20                               ;0BA1C9|        |      ;
                       dw CODE_0FE7CC                       ;0BA1CA|        |0FE7CC;
                       PLA                                  ;0BA1CC|68      |      ;
                       TAX                                  ;0BA1CD|AA      |      ;
                       LDA.B #$6F                           ;0BA1CE|A96F    |      ;
                       STA.W $054E,X                        ;0BA1D0|9D4E05  |0B054E;
                       LDA.B #$18                           ;0BA1D3|A918    |      ;
                       STA.W $05EF,X                        ;0BA1D5|9DEF05  |0B05EF;
                       LDA.B #$00                           ;0BA1D8|A900    |      ;
                       STA.W $05C1,X                        ;0BA1DA|9DC105  |0B05C1;
                       STA.W $0470,X                        ;0BA1DD|9D7004  |0B0470;
                       JSR.W CODE_0BB52F                    ;0BA1E0|202FB5  |0BB52F;
 
          CODE_0BA1E3: INX                                  ;0BA1E3|E8      |      ;
                       CPX.B #$0D                           ;0BA1E4|E00D    |      ;
                       BCC CODE_0BA1BC                      ;0BA1E6|90D4    |0BA1BC;
                       LDA.B #$20                           ;0BA1E8|A920    |      ;
                       STA.B r_rosseryFlashTimer            ;0BA1EA|85B2    |0000B2;
                       LDX.B r_entityID_processed           ;0BA1EC|A66C    |00006C;
                       RTS                                  ;0BA1EE|60      |      ;
 
 
          CODE_0BA1EF: LDA.B #$18                           ;0BA1EF|A918    |      ;
                       db $20                               ;0BA1F1|        |      ;
                       dw initFreezWaterEffect_01           ;0BA1F2|        |0FE25F;
                       SEC                                  ;0BA1F4|38      |      ;
                       LDA.W $054E,X                        ;0BA1F5|BD4E05  |0B054E;
                       SBC.B #$A3                           ;0BA1F8|E9A3    |      ;
                       TAY                                  ;0BA1FA|A8      |      ;
 
          CODE_0BA1FB: LDA.W DATA8_0BA20F,Y                 ;0BA1FB|B90FA2  |0BA20F;
                       STA.B $02                            ;0BA1FE|8502    |000002;
                       LDA.W DATA8_0BA218,Y                 ;0BA200|B918A2  |0BA218;
                       STA.B $03                            ;0BA203|8503    |000003;
                       LDA.B #$00                           ;0BA205|A900    |      ;
                       STA.B $01                            ;0BA207|8501    |000001;
                       db $20                               ;0BA209|        |      ;
                       dw CODE_0FE777                       ;0BA20A|        |0FE777;
                       LDX.B r_entityID_processed           ;0BA20C|A66C    |00006C;
                       RTS                                  ;0BA20E|60      |      ;
 
 
         DATA8_0BA20F: db $01,$02,$04,$07,$10,$20,$40,$70   ;0BA20F|        |      ;
                       db $00                               ;0BA217|        |      ;
 
         DATA8_0BA218: db $00,$00,$00,$00,$00,$00,$00,$00   ;0BA218|        |      ;
                       db $01                               ;0BA220|        |      ;
 
          CODE_0BA221: LDA.B #$01                           ;0BA221|A901    |      ;
                       STA.B $D7                            ;0BA223|85D7    |0000D7;
                       db $20                               ;0BA225|        |      ;
                       dw CODE_0FE748                       ;0BA226|        |0FE748;
 
          CODE_0BA228: LDX.B r_entityID_processed           ;0BA228|A66C    |00006C;
                       RTS                                  ;0BA22A|60      |      ;
 
 
          CODE_0BA22B: LDA.B #$1B                           ;0BA22B|A91B    |      ;
                       db $20                               ;0BA22D|        |      ;
                       dw initFreezWaterEffect_01           ;0BA22E|        |0FE25F;
                       SEC                                  ;0BA230|38      |      ;
                       LDA.W $054E,X                        ;0BA231|BD4E05  |0B054E;
                       SBC.B #$AD                           ;0BA234|E9AD    |      ;
                       TAY                                  ;0BA236|A8      |      ;
                       LDA.W CODE_0BA240,Y                  ;0BA237|B940A2  |0BA240;
                       db $20                               ;0BA23A|        |      ;
                       dw CODE_0FE760                       ;0BA23B|        |0FE760;
                       LDX.B r_entityID_processed           ;0BA23D|A66C    |00006C;
                       RTS                                  ;0BA23F|60      |      ;
 
 
          CODE_0BA240: ORA.B $01                            ;0BA240|0501    |000001;
 
          CODE_0BA242: LDA.B #$1C                           ;0BA242|A91C    |      ;
                       db $20                               ;0BA244|        |      ;
                       dw initFreezWaterEffect_01           ;0BA245|        |0FE25F;
                       LDY.B r_partnerIdx                   ;0BA247|A43B    |00003B;
                       LDA.W $0085,Y                        ;0BA249|B98500  |0B0085;
                       CMP.B #$0B                           ;0BA24C|C90B    |      ;
                       BEQ CODE_0BA264                      ;0BA24E|F014    |0BA264;
                       CMP.B #$05                           ;0BA250|C905    |      ;
                       BCC CODE_0BA258                      ;0BA252|9004    |0BA258;
                       CMP.B #$08                           ;0BA254|C908    |      ;
                       BCC CODE_0BA264                      ;0BA256|900C    |0BA264;
 
          CODE_0BA258: SEC                                  ;0BA258|38      |      ;
                       LDA.W $054E,X                        ;0BA259|BD4E05  |0B054E;
                       SBC.B #$AE                           ;0BA25C|E9AE    |      ;
                       LDY.B r_partnerIdx                   ;0BA25E|A43B    |00003B;
                       STA.W $0087,Y                        ;0BA260|998700  |0B0087;
                       RTS                                  ;0BA263|60      |      ;
 
 
          CODE_0BA264: LDA.B #$A7                           ;0BA264|A9A7    |      ;
                       STA.W $054E,X                        ;0BA266|9D4E05  |0B054E;
                       LDA.B #$47                           ;0BA269|A947    |      ;
                       STA.W $05EF,X                        ;0BA26B|9DEF05  |0B05EF;
                       LDA.B #$04                           ;0BA26E|A904    |      ;
                       STA.W $05C1,X                        ;0BA270|9DC105  |0B05C1;
                       LDY.B #$04                           ;0BA273|A004    |      ;
                       JMP.W CODE_0BA1FB                    ;0BA275|4CFBA1  |0BA1FB;
 
 
          CODE_0BA278: LDA.W $054E                          ;0BA278|AD4E05  |0B054E;
                       db $20                               ;0BA27B|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA27C|        |0FE86D;
                       STX.B $A2                            ;0BA27E|86A2    |0000A2;
                       LDY.B r_frameCounter,X               ;0BA280|B4A3    |0000A3;
                       LDY.B r_frameCounter,X               ;0BA282|B4A3    |0000A3;
                       BCS CODE_0BA228                      ;0BA284|B0A2    |0BA228;
                       LDY.B #$00                           ;0BA286|A000    |      ;
                       LDA.B r_trevorWhipLevel              ;0BA288|A58E    |00008E;
                       BEQ CODE_0BA2A5                      ;0BA28A|F019    |0BA2A5;
                       CMP.B #$02                           ;0BA28C|C902    |      ;
                       BEQ CODE_0BA2AB                      ;0BA28E|F01B    |0BA2AB;
                       LDA.B r_hearts                       ;0BA290|A584    |000084;
                       CMP.B #$08                           ;0BA292|C908    |      ;
                       BCC CODE_0BA2AB                      ;0BA294|9015    |0BA2AB;
                       INY                                  ;0BA296|C8      |      ;
 
          CODE_0BA297: LDA.W DATA8_0BA2AE,Y                 ;0BA297|B9AEA2  |0BA2AE;
                       JSR.W CODE_0BA3F8                    ;0BA29A|20F8A3  |0BA3F8;
                       BEQ CODE_0BA2AB                      ;0BA29D|F00C    |0BA2AB;
                       LDA.B $00                            ;0BA29F|A500    |000000;
                       STA.W $054E,X                        ;0BA2A1|9D4E05  |0B054E;
                       RTS                                  ;0BA2A4|60      |      ;
 
 
          CODE_0BA2A5: LDA.B r_hearts                       ;0BA2A5|A584    |000084;
                       CMP.B #$04                           ;0BA2A7|C904    |      ;
                       BCS CODE_0BA297                      ;0BA2A9|B0EC    |0BA297;
 
          CODE_0BA2AB: JMP.W CODE_0BA3B4                    ;0BA2AB|4CB4A3  |0BA3B4;
 
 
         DATA8_0BA2AE: db $9D,$9E,$A0,$00                   ;0BA2AE|        |      ;
                       LDA.B r_partnerWeaponLevel           ;0BA2B2|A58F    |00008F;
                       BEQ CODE_0BA2CF                      ;0BA2B4|F019    |0BA2CF;
                       CMP.B #$02                           ;0BA2B6|C902    |      ;
                       BEQ CODE_0BA2AB                      ;0BA2B8|F0F1    |0BA2AB;
                       LDA.B r_hearts                       ;0BA2BA|A584    |000084;
                       CMP.B #$08                           ;0BA2BC|C908    |      ;
                       BCC CODE_0BA2AB                      ;0BA2BE|90EB    |0BA2AB;
                       INY                                  ;0BA2C0|C8      |      ;
 
          CODE_0BA2C1: LDA.W DATA8_0BA2AE,Y                 ;0BA2C1|B9AEA2  |0BA2AE;
                       JSR.W CODE_0BA3F8                    ;0BA2C4|20F8A3  |0BA3F8;
                       BEQ CODE_0BA2AB                      ;0BA2C7|F0E2    |0BA2AB;
                       LDA.B $00                            ;0BA2C9|A500    |000000;
                       STA.W $054E,X                        ;0BA2CB|9D4E05  |0B054E;
                       RTS                                  ;0BA2CE|60      |      ;
 
 
          CODE_0BA2CF: LDA.B r_hearts                       ;0BA2CF|A584    |000084;
                       CMP.B #$04                           ;0BA2D1|C904    |      ;
                       BCS CODE_0BA2C1                      ;0BA2D3|B0EC    |0BA2C1;
                       JMP.W CODE_0BA3B4                    ;0BA2D5|4CB4A3  |0BA3B4;
 
 
          CODE_0BA2D8: LDY.B $D7                            ;0BA2D8|A4D7    |0000D7;
                       BEQ CODE_0BA2FC                      ;0BA2DA|F020    |0BA2FC;
 
          CODE_0BA2DC: JSR.W CODE_0BA278                    ;0BA2DC|2078A2  |0BA278;
                       JMP.W CODE_0BA2F9                    ;0BA2DF|4CF9A2  |0BA2F9;
 
 
          CODE_0BA2E2: LDA.B #$33                           ;0BA2E2|A933    |      ;
                       db $20                               ;0BA2E4|        |      ;
                       dw initFreezWaterEffect_01           ;0BA2E5|        |0FE25F;
                       LDA.W $05D8,X                        ;0BA2E7|BDD805  |0B05D8;
                       CMP.B #$AC                           ;0BA2EA|C9AC    |      ;
                       BEQ CODE_0BA2D8                      ;0BA2EC|F0EA    |0BA2D8;
                       CMP.B #$AE                           ;0BA2EE|C9AE    |      ;
                       BEQ CODE_0BA2DC                      ;0BA2F0|F0EA    |0BA2DC;
                       CMP.B #$98                           ;0BA2F2|C998    |      ;
                       BCS CODE_0BA2FC                      ;0BA2F4|B006    |0BA2FC;
                       JSR.W CODE_0BA30B                    ;0BA2F6|200BA3  |0BA30B;
 
          CODE_0BA2F9: LDA.W $054E,X                        ;0BA2F9|BD4E05  |0B054E;
 
          CODE_0BA2FC: STA.W $054E,X                        ;0BA2FC|9D4E05  |0B054E;
                       SEC                                  ;0BA2FF|38      |      ;
                       SBC.B #$60                           ;0BA300|E960    |      ;
                       STA.W $05EF,X                        ;0BA302|9DEF05  |0B05EF;
                       JSR.W CODE_0BB584                    ;0BA305|2084B5  |0BB584;
                       db $4C                               ;0BA308|        |      ;
 
                       dw CODE_0FFFAA                       ;0BA309|        |0FFFAA;
 
          CODE_0BA30B: SEC                                  ;0BA30B|38      |      ;
                       SBC.B #$93                           ;0BA30C|E993    |      ;
                       db $20                               ;0BA30E|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA30F|        |0FE86D;
                       dw CODE_0BA31B                       ;0BA311|        |0BA31B;
                       dw CODE_0BA329                       ;0BA313|        |0BA329;
                       dw CODE_0BA337                       ;0BA315|        |0BA337;
                       dw CODE_0BA345                       ;0BA317|        |0BA345;
                       dw PTR16_0BA353                      ;0BA319|        |0BA353;
 
          CODE_0BA31B: LDA.W $054E                          ;0BA31B|AD4E05  |0B054E;
                       db $20                               ;0BA31E|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA31F|        |0FE86D;
                       dw CODE_0BA358                       ;0BA321|        |0BA358;
                       dw DATA8_0BA394                      ;0BA323|        |0BA394;
                       dw CODE_0BA358                       ;0BA325|        |0BA358;
                       dw CODE_0BA3B4                       ;0BA327|        |0BA3B4;
 
          CODE_0BA329: LDA.W $054E                          ;0BA329|AD4E05  |0B054E;
                       db $20                               ;0BA32C|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA32D|        |0FE86D;
                       dw DATA8_0BA380                      ;0BA32F|        |0BA380;
 
                       dw DATA8_0BA390                      ;0BA331|        |0BA390;
                       dw CODE_0BA358                       ;0BA333|        |0BA358;
                       dw CODE_0BA3B4                       ;0BA335|        |0BA3B4;
 
          CODE_0BA337: LDA.W $054E                          ;0BA337|AD4E05  |0B054E;
                       db $20                               ;0BA33A|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA33B|        |0FE86D;
                       dw DATA8_0BA371                      ;0BA33D|        |0BA371;
                       dw DATA8_0BA394                      ;0BA33F|        |0BA394;
                       dw DATA8_0BA371                      ;0BA341|        |0BA371;
                       dw CODE_0BA3B4                       ;0BA343|        |0BA3B4;
 
          CODE_0BA345: LDA.W $054E                          ;0BA345|AD4E05  |0B054E;
                       db $20                               ;0BA348|        |      ;
                       dw jumpFromStackYXpreserved          ;0BA349|        |0FE86D;
                       dw DATA8_0BA388                      ;0BA34B|        |0BA388;
                       dw DATA8_0BA38C                      ;0BA34D|        |0BA38C;
                       dw DATA8_0BA371                      ;0BA34F|        |0BA371;
                       dw CODE_0BA3B4                       ;0BA351|        |0BA3B4;
 
         PTR16_0BA353: dw CODE_0B97A9                       ;0BA353|        |0B97A9;
                       dw DATA8_0B984C                      ;0BA355|        |0B984C;
                       LDA.B r_potionTimer,S                ;0BA357|A3AD    |0000AD;
                       db $4E,$05                           ;0BA359|        |      ;
                       BEQ CODE_0BA36C                      ;0BA35B|F00F    |0BA36C;
                       LDA.B r_subweapPartner               ;0BA35D|A586    |000086;
                       CMP.B #$09                           ;0BA35F|C909    |      ;
                       BNE CODE_0BA366                      ;0BA361|D003    |0BA366;
 
          CODE_0BA363: JMP.W CODE_0BB5CE                    ;0BA363|4CCEB5  |0BB5CE;
 
 
          CODE_0BA366: LDA.B #$93                           ;0BA366|A993    |      ;
                       STA.W $054E,X                        ;0BA368|9D4E05  |0B054E;
                       RTS                                  ;0BA36B|60      |      ;
 
 
          CODE_0BA36C: LDA.B #$93                           ;0BA36C|A993    |      ;
                       JMP.W CODE_0BA398                    ;0BA36E|4C98A3  |0BA398;
 
 
         DATA8_0BA371: db $AD,$4E,$05,$F0,$0E,$A5,$86,$C9   ;0BA371|        |      ;
                       db $08,$F0,$E7,$A9,$95,$D0,$E8       ;0BA379|        |      ;
 
         DATA8_0BA380: db $A9,$94,$D0,$14,$A9,$95,$D0,$10   ;0BA380|        |      ;
 
         DATA8_0BA388: db $A9,$96,$D0,$0C                   ;0BA388|        |      ;
 
         DATA8_0BA38C: db $A9,$99,$D0,$08                   ;0BA38C|        |      ;
 
         DATA8_0BA390: db $A9,$9A,$D0,$04                   ;0BA390|        |      ;
 
         DATA8_0BA394: db $A9,$98,$D0,$00                   ;0BA394|        |      ;
 
          CODE_0BA398: STA.B r_index                        ;0BA398|8510    |000010;
                       LDY.B r_partnerIdx                   ;0BA39A|A43B    |00003B;
                       SEC                                  ;0BA39C|38      |      ;
                       SBC.B #$93                           ;0BA39D|E993    |      ;
                       TAY                                  ;0BA39F|A8      |      ;
                       LDA.W DATA8_0BA171,Y                 ;0BA3A0|B971A1  |0BA171;
                       LDY.B r_partnerIdx                   ;0BA3A3|A43B    |00003B;
                       CMP.W $0085,Y                        ;0BA3A5|D98500  |0B0085;
                       BEQ CODE_0BA363                      ;0BA3A8|F0B9    |0BA363;
                       LDA.B r_index                        ;0BA3AA|A510    |000010;
 
          CODE_0BA3AC: STA.W $054E,X                        ;0BA3AC|9D4E05  |0B054E;
                       RTS                                  ;0BA3AF|60      |      ;
 
                       LDA.B #$AD                           ;0BA3B0|A9AD    |      ;
                       BNE CODE_0BA3AC                      ;0BA3B2|D0F8    |0BA3AC;
 
          CODE_0BA3B4: JSR.W CODE_0BA3E8                    ;0BA3B4|20E8A3  |0BA3E8;
                       BNE CODE_0BA3C3                      ;0BA3B7|D00A    |0BA3C3;
                       LDA.B $9E                            ;0BA3B9|A59E    |00009E;
                       BEQ CODE_0BA3C3                      ;0BA3BB|F006    |0BA3C3;
                       LDA.B $9C                            ;0BA3BD|A59C    |00009C;
                       CMP.B #$0A                           ;0BA3BF|C90A    |      ;
                       BCS CODE_0BA3C7                      ;0BA3C1|B004    |0BA3C7;
 
          CODE_0BA3C3: LDA.B #$AE                           ;0BA3C3|A9AE    |      ;
                       BNE CODE_0BA3AC                      ;0BA3C5|D0E5    |0BA3AC;
 
          CODE_0BA3C7: LDA.B #$00                           ;0BA3C7|A900    |      ;
                       STA.B $9C                            ;0BA3C9|859C    |00009C;
                       LDA.W $054E                          ;0BA3CB|AD4E05  |0B054E;
                       AND.B #$01                           ;0BA3CE|2901    |      ;
                       BNE CODE_0BA3C3                      ;0BA3D0|D0F1    |0BA3C3;
                       LDY.B r_partnerIdx                   ;0BA3D2|A43B    |00003B;
                       LDA.W $0087,Y                        ;0BA3D4|B98700  |0B0087;
                       CMP.W DATA8_0BA3E6,Y                 ;0BA3D7|D9E6A3  |0BA3E6;
                       BCS CODE_0BA3C3                      ;0BA3DA|B0E7    |0BA3C3;
                       TAY                                  ;0BA3DC|A8      |      ;
                       LDA.W DATA8_0BA3E4,Y                 ;0BA3DD|B9E4A3  |0BA3E4;
                       STA.W $054E,X                        ;0BA3E0|9D4E05  |0B054E;
                       RTS                                  ;0BA3E3|60      |      ;
 
 
         DATA8_0BA3E4: db $AF,$B0                           ;0BA3E4|        |      ;
 
         DATA8_0BA3E6: db $02,$02                           ;0BA3E6|        |      ;
 
          CODE_0BA3E8: LDY.B r_partnerIdx                   ;0BA3E8|A43B    |00003B;
                       LDA.W $0085,Y                        ;0BA3EA|B98500  |0B0085;
                       BEQ CODE_0BA3F5                      ;0BA3ED|F006    |0BA3F5;
                       LDA.W $054E,Y                        ;0BA3EF|B94E05  |0B054E;
                       AND.B #$01                           ;0BA3F2|2901    |      ;
                       RTS                                  ;0BA3F4|60      |      ;
 
 
          CODE_0BA3F5: LDA.B #$01                           ;0BA3F5|A901    |      ;
                       RTS                                  ;0BA3F7|60      |      ;
 
 
          CODE_0BA3F8: STA.B $00                            ;0BA3F8|8500    |000000;
                       LDY.B #$01                           ;0BA3FA|A001    |      ;
 
          CODE_0BA3FC: LDA.W $054E,Y                        ;0BA3FC|B94E05  |0B054E;
                       CMP.B $00                            ;0BA3FF|C500    |000000;
                       BEQ CODE_0BA40A                      ;0BA401|F007    |0BA40A;
                       INY                                  ;0BA403|C8      |      ;
                       CPY.B #$13                           ;0BA404|C013    |      ;
                       BCC CODE_0BA3FC                      ;0BA406|90F4    |0BA3FC;
                       LDA.B #$01                           ;0BA408|A901    |      ;
 
          CODE_0BA40A: RTS                                  ;0BA40A|60      |      ;
 
 
     entityScripts_60: db $97,$00,$00,$00,$17,$00,$00,$00   ;0BA40B|        |      ; boss hammerTime
                       db $14,$00,$00,$00,$15,$00,$00,$00   ;0BA413|        |      ;
                       db $13,$0A,$0B,$00,$16,$00,$00,$00   ;0BA41B|        |      ;
                       db $6C,$2D,$00,$00,$30,$02,$00,$00   ;0BA423|        |      ;
                       db $1A,$04,$00,$00,$1B,$00,$00,$00   ;0BA42B|        |      ;
                       db $17,$00,$00,$00,$1A,$10,$00,$00   ;0BA433|        |      ;
                       db $1B,$00,$00,$00,$7B,$03,$00,$00   ;0BA43B|        |      ;
                       db $30,$03,$00,$00,$16,$00,$00,$00   ;0BA443|        |      ;
                       db $1A,$01,$00,$00,$1B,$00,$00,$00   ;0BA44B|        |      ;
                       db $17,$00,$00,$00,$1A,$02,$00,$00   ;0BA453|        |      ;
                       db $1B,$00,$00,$00,$7C,$F9,$00,$00   ;0BA45B|        |      ;
                       db $18,$00,$00,$00                   ;0BA463|        |      ;
 
        enemy_2_ID_2E: INC.W $05C1,X                        ;0BA467|FEC105  |0B05C1;
                       db $4C                               ;0BA46A|        |      ;
 
                       dw UNREACH_0FFEC8                    ;0BA46B|        |0FFEC8;
 
   enemyID_fishMan_28: INC.W $05C1,X                        ;0BA46D|FEC105  |0B05C1;
                       JSR.W CODE_0BA524                    ;0BA470|2024A5  |0BA524;
                       AND.B #$07                           ;0BA473|2907    |      ;
                       ASL A                                ;0BA475|0A      |      ;
                       TAY                                  ;0BA476|A8      |      ;
                       LDA.W DATA8_0BA4BF,Y                 ;0BA477|B9BFA4  |0BA4BF;
                       STA.W $05D8,X                        ;0BA47A|9DD805  |0B05D8;
                       LDA.W DATA8_0BA4C0,Y                 ;0BA47D|B9C0A4  |0BA4C0;
                       STA.W $0645,X                        ;0BA480|9D4506  |0B0645;
                       LDA.B r_stage                        ;0BA483|A532    |000032;
                       CMP.B #$02                           ;0BA485|C902    |      ;
                       BNE CODE_0BA4A8                      ;0BA487|D01F    |0BA4A8;
                       LDA.B r_blockLevel                   ;0BA489|A533    |000033;
                       CMP.B #$04                           ;0BA48B|C904    |      ;
                       BNE CODE_0BA4A8                      ;0BA48D|D019    |0BA4A8;
                       LDA.W $0438,X                        ;0BA48F|BD3804  |0B0438;
                       BPL CODE_0BA49F                      ;0BA492|100B    |0BA49F;
                       JSR.W CODE_0BA524                    ;0BA494|2024A5  |0BA524;
                       ASL A                                ;0BA497|0A      |      ;
                       ASL A                                ;0BA498|0A      |      ;
                       ASL A                                ;0BA499|0A      |      ;
                       ORA.B #$80                           ;0BA49A|0980    |      ;
                       JMP.W CODE_0BA4A5                    ;0BA49C|4CA5A4  |0BA4A5;
 
 
          CODE_0BA49F: JSR.W CODE_0BA524                    ;0BA49F|2024A5  |0BA524;
                       ASL A                                ;0BA4A2|0A      |      ;
                       ASL A                                ;0BA4A3|0A      |      ;
                       ASL A                                ;0BA4A4|0A      |      ;
 
          CODE_0BA4A5: STA.W $0438,X                        ;0BA4A5|9D3804  |0B0438;
 
          CODE_0BA4A8: LDA.W $0438,X                        ;0BA4A8|BD3804  |0B0438;
                       AND.B #$7F                           ;0BA4AB|297F    |      ;
                       CMP.B #$20                           ;0BA4AD|C920    |      ;
                       BCC CODE_0BA4B9                      ;0BA4AF|9008    |0BA4B9;
                       CMP.B #$50                           ;0BA4B1|C950    |      ;
                       BCS CODE_0BA4B9                      ;0BA4B3|B004    |0BA4B9;
                       LDA.B #$58                           ;0BA4B5|A958    |      ;
                       BNE CODE_0BA4BB                      ;0BA4B7|D002    |0BA4BB;
 
          CODE_0BA4B9: LDA.B #$40                           ;0BA4B9|A940    |      ;
 
          CODE_0BA4BB: STA.W $041C,X                        ;0BA4BB|9D1C04  |0B041C;
                       RTS                                  ;0BA4BE|60      |      ;
 
 
         DATA8_0BA4BF: db $80                               ;0BA4BF|        |      ;
 
 
         DATA8_0BA4C0: db $01,$00,$02,$58,$00,$60,$00,$00   ;0BA4C0|        |      ;
                       db $01,$00,$04,$80,$01,$20,$01       ;0BA4C8|        |      ;
 
     enemyID_flame_2A: DEC.W $05D8,X                        ;0BA4CF|DED805  |0B05D8;
                       BPL CODE_0BA4E2                      ;0BA4D2|100E    |0BA4E2;
                       LDY.W $05D8,X                        ;0BA4D4|BCD805  |0B05D8;
                       INY                                  ;0BA4D7|C8      |      ;
                       BNE CODE_0BA4E2                      ;0BA4D8|D008    |0BA4E2;
                       DEC.W $0645,X                        ;0BA4DA|DE4506  |0B0645;
                       BPL CODE_0BA4E2                      ;0BA4DD|1003    |0BA4E2;
                       INC.W $05C1,X                        ;0BA4DF|FEC105  |0B05C1;
 
          CODE_0BA4E2: RTS                                  ;0BA4E2|60      |      ;
 
 
     enemyID_mummy_2C: LDA.B #$50                           ;0BA4E3|A950    |      ;
                       STA.W $0470,X                        ;0BA4E5|9D7004  |0B0470;
                       BNE CODE_0BA50F                      ;0BA4E8|D025    |0BA50F;
 
enemyID_skeletonRed_2E: LDA.B #$58                           ;0BA4EA|A958    |      ;
                       STA.W $0470,X                        ;0BA4EC|9D7004  |0B0470;
                       BNE CODE_0BA50F                      ;0BA4EF|D01E    |0BA50F;
 
     enemyID_spark_30: LDA.B #$00                           ;0BA4F1|A900    |      ;
                       STA.W $05C1,X                        ;0BA4F3|9DC105  |0B05C1;
                       RTS                                  ;0BA4F6|60      |      ;
 
 
enemyID_mummyCrumbl_34: LDY.B #$01                           ;0BA4F7|A001    |      ;
                       LDA.B ($02),Y                        ;0BA4F9|B102    |000002;
                       STA.W $05D8,X                        ;0BA4FB|9DD805  |0B05D8;
                       INC.W $05C1,X                        ;0BA4FE|FEC105  |0B05C1;
                       RTS                                  ;0BA501|60      |      ;
 
 
enemyID_skeletonCrumbl_36: DEC.W $05D8,X                        ;0BA502|DED805  |0B05D8;
                       BEQ CODE_0BA50F                      ;0BA505|F008    |0BA50F;
                       RTS                                  ;0BA507|60      |      ;
 
 
          enemyID__F6: LDY.B #$01                           ;0BA508|A001    |      ;
                       LDA.B ($02),Y                        ;0BA50A|B102    |000002;
                       STA.W $0633,X                        ;0BA50C|9D3306  |0B0633;
 
          CODE_0BA50F: INC.W $05C1,X                        ;0BA50F|FEC105  |0B05C1;
                       RTS                                  ;0BA512|60      |      ;
 
 
          enemyID__F8: DEC.W $0633,X                        ;0BA513|DE3306  |0B0633;
                       BEQ CODE_0BA50F                      ;0BA516|F0F7    |0BA50F;
                       LDY.B #$01                           ;0BA518|A001    |      ;
                       LDA.B ($02),Y                        ;0BA51A|B102    |000002;
                       CLC                                  ;0BA51C|18      |      ;
                       ADC.W $05C1,X                        ;0BA51D|7DC105  |0B05C1;
                       STA.W $05C1,X                        ;0BA520|9DC105  |0B05C1;
                       RTS                                  ;0BA523|60      |      ;
 
 
          CODE_0BA524: LDA.B r_RNG                          ;0BA524|A51F    |00001F;
                       BNE CODE_0BA52A                      ;0BA526|D002    |0BA52A;
                       LDA.B #$65                           ;0BA528|A965    |      ;
 
          CODE_0BA52A: ASL A                                ;0BA52A|0A      |      ;
                       STA.B $00                            ;0BA52B|8500    |000000;
                       LDA.B r_RNG                          ;0BA52D|A51F    |00001F;
                       LSR A                                ;0BA52F|4A      |      ;
                       CLC                                  ;0BA530|18      |      ;
                       ADC.B $00                            ;0BA531|6500    |000000;
                       STA.B r_RNG                          ;0BA533|851F    |00001F;
                       AND.B #$0F                           ;0BA535|290F    |      ;
                       RTS                                  ;0BA537|60      |      ;
 
 
     entityScripts_6b: db $20,$00,$00,$00,$A1,$00,$00,$00   ;0BA538|        |      ;
                       db $A2,$00,$00,$00                   ;0BA540|        |      ;
 
     entityScripts_6c: db $0B,$0E,$46,$00,$45,$0F,$00,$00   ;0BA544|        |      ;
                       db $46,$00,$00,$00                   ;0BA54C|        |      ;
 
     entityScripts_2c: db $88,$3A,$00,$00,$77,$00,$00,$00   ;0BA550|        |      ;
                       db $76,$00,$00,$00,$78,$00,$00,$00   ;0BA558|        |      ;
 
     entityScripts_2d: db $88,$42,$00,$00,$75,$00,$00,$00   ;0BA560|        |      ;
                       db $79,$00,$00,$00                   ;0BA568|        |      ;
 
     entityScripts_2e: db $88,$42,$00,$00,$75,$00,$00,$00   ;0BA56C|        |      ;
                       db $79,$00,$00,$00                   ;0BA574|        |      ;
 
     entityScripts_61: db $7A,$00,$00,$00                   ;0BA578|        |      ;
 
     entityScripts_64: db $8B,$00,$00,$00,$84,$00,$00,$00   ;0BA57C|        |      ;
                       db $85,$00,$00,$00,$86,$00,$00,$00   ;0BA584|        |      ;
 
     entityScripts_6f: db $A5,$00,$00,$00,$84,$00,$00,$00   ;0BA58C|        |      ;
                       db $85,$00,$00,$00,$86,$00,$00,$00   ;0BA594|        |      ;
 
     entityScripts_01: db $07,$00,$80,$00,$1C,$00,$00,$00   ;0BA59C|        |      ;
                       db $1D,$00,$01,$00                   ;0BA5A4|        |      ;
 
     entityScripts_24: db $5D,$00,$00,$00,$07,$00,$80,$00   ;0BA5A8|        |      ;
                       db $1C,$00,$00,$00,$1D,$01,$01,$00   ;0BA5B0|        |      ;
 
     entityScripts_70: db $A6,$00,$A0,$00,$1C,$00,$00,$00   ;0BA5B8|        |      ;
                       db $1D,$00,$01,$00                   ;0BA5C0|        |      ;
 
     entityScripts_02: db $09,$00,$00,$00,$05,$00,$00,$00   ;0BA5C4|        |      ;
                       db $0B,$08,$06,$00,$1F,$08,$00,$00   ;0BA5CC|        |      ;
                       db $20,$00,$00,$00,$53,$00,$00,$00   ;0BA5D4|        |      ;
                       db $0B,$08,$08,$00,$1F,$08,$00,$00   ;0BA5DC|        |      ;
                       db $20,$00,$00,$00,$08,$00,$00,$00   ;0BA5E4|        |      ;
                       db $07,$00,$80,$00,$1C,$00,$00,$00   ;0BA5EC|        |      ;
                       db $1D,$09,$01,$00,$01,$00,$00,$00   ;0BA5F4|        |      ;
                       db $0B,$08,$08,$00,$1F,$08,$00,$00   ;0BA5FC|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$06,$00   ;0BA604|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BA60C|        |      ;
                       db $27,$00,$00,$00                   ;0BA614|        |      ;
 
     entityScripts_07: db $2D,$00,$00,$00,$1E,$01,$10,$00   ;0BA618|        |      ;
                       db $95,$00,$00,$00,$9C,$07,$00,$08   ;0BA620|        |      ;
                       db $9D,$00,$00,$00                   ;0BA628|        |      ;
 
     entityScripts_6d: db $2D,$00,$00,$00,$1E,$01,$10,$00   ;0BA62C|        |      ;
                       db $13,$08,$27,$00,$A3,$00,$00,$00   ;0BA634|        |      ;
                       db $A4,$00,$00,$00                   ;0BA63C|        |      ;
 
     entityScripts_1e: db $6E,$00,$00,$00,$0B,$08,$3E,$00   ;0BA640|        |      ;
                       db $9F,$00,$00,$00,$26,$08,$04,$00   ;0BA648|        |      ;
                       db $23,$03,$04,$00,$52,$00,$00,$00   ;0BA650|        |      ;
                       db $1F,$24,$00,$00,$20,$00,$00,$00   ;0BA658|        |      ;
                       db $52,$00,$00,$00,$08,$01,$00,$00   ;0BA660|        |      ;
                       db $20,$00,$00,$00,$04,$01,$00,$00   ;0BA668|        |      ;
 
     entityScripts_12: db $6E,$00,$00,$00,$0B,$08,$3E,$00   ;0BA670|        |      ;
                       db $1F,$20,$00,$00,$20,$00,$00,$00   ;0BA678|        |      ;
                       db $26,$08,$04,$00,$23,$03,$04,$00   ;0BA680|        |      ;
                       db $26,$04,$08,$00,$25,$28,$24,$00   ;0BA688|        |      ;
                       db $04,$02,$00,$00                   ;0BA690|        |      ;
 
     entityScripts_2f: db $6E,$00,$00,$00,$0B,$08,$40,$00   ;0BA694|        |      ;
                       db $1F,$20,$00,$00,$20,$00,$00,$00   ;0BA69C|        |      ;
                       db $26,$08,$04,$00,$23,$03,$04,$00   ;0BA6A4|        |      ;
                       db $26,$04,$08,$00,$25,$28,$24,$00   ;0BA6AC|        |      ;
                       db $04,$02,$00,$00                   ;0BA6B4|        |      ;
 
     entityScripts_69: db $2D,$00,$00,$00,$1F,$10,$00,$00   ;0BA6B8|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$4C,$00   ;0BA6C0|        |      ;
                       db $93,$00,$00,$00,$94,$00,$00,$00   ;0BA6C8|        |      ;
                       db $21,$00,$00,$00,$0B,$08,$4E,$00   ;0BA6D0|        |      ;
                       db $10,$00,$00,$00,$0B,$08,$4C,$00   ;0BA6D8|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BA6E0|        |      ;
                       db $04,$06,$00,$00                   ;0BA6E8|        |      ;
 
     entityScripts_0e: db $01,$00,$00,$00,$91,$00,$00,$00   ;0BA6EC|        |      ;
                       db $06,$00,$00,$00,$1F,$28,$00,$00   ;0BA6F4|        |      ;
                       db $20,$00,$00,$00,$21,$00,$00,$00   ;0BA6FC|        |      ;
                       db $0B,$08,$4E,$00,$10,$00,$00,$00   ;0BA704|        |      ;
                       db $0B,$08,$4C,$00,$1F,$08,$00,$00   ;0BA70C|        |      ;
                       db $20,$00,$00,$00,$04,$05,$00,$00   ;0BA714|        |      ;
 
     entityScripts_05: db $07,$01,$40,$00,$11,$04,$00,$00   ;0BA71C|        |      ;
                       db $12,$00,$00,$00                   ;0BA724|        |      ;
 
     entityScripts_66: db $2D,$00,$00,$00,$1E,$01,$40,$00   ;0BA728|        |      ;
                       db $13,$08,$24,$00,$11,$04,$00,$00   ;0BA730|        |      ;
                       db $12,$00,$00,$00                   ;0BA738|        |      ;
 
     entityScripts_06: db $0B,$08,$1E,$00,$4D,$60,$20,$00   ;0BA73C|        |      ;
                       db $07,$01,$40,$00,$6F,$00,$20,$00   ;0BA744|        |      ;
                       db $70,$0A,$00,$00,$11,$04,$00,$00   ;0BA74C|        |      ;
                       db $12,$00,$00,$00                   ;0BA754|        |      ;
 
     entityScripts_6e: db $2D,$00,$00,$00,$1E,$01,$40,$00   ;0BA758|        |      ;
                       db $13,$14,$06,$00,$11,$04,$00,$00   ;0BA760|        |      ;
                       db $12,$00,$00,$00                   ;0BA768|        |      ;
 
     entityScripts_63: db $2D,$00,$00,$00,$54,$00,$00,$00   ;0BA76C|        |      ;
                       db $0B,$12,$02,$00,$7E,$00,$00,$00   ;0BA774|        |      ;
                       db $7D,$40,$00,$00,$0B,$12,$04,$00   ;0BA77C|        |      ;
                       db $1F,$03,$00,$00,$20,$00,$00,$00   ;0BA784|        |      ;
                       db $0B,$12,$06,$00,$1F,$10,$00,$00   ;0BA78C|        |      ;
                       db $20,$00,$00,$00,$53,$00,$00,$00   ;0BA794|        |      ;
                       db $0B,$12,$08,$00,$1F,$10,$00,$00   ;0BA79C|        |      ;
                       db $20,$00,$00,$00,$83,$00,$00,$00   ;0BA7A4|        |      ;
                       db $2A,$00,$00,$00,$1F,$06,$00,$00   ;0BA7AC|        |      ;
                       db $20,$00,$00,$00,$01,$00,$00,$00   ;0BA7B4|        |      ;
                       db $1F,$04,$00,$00,$20,$00,$00,$00   ;0BA7BC|        |      ;
                       db $2A,$00,$00,$00,$0B,$12,$0A,$00   ;0BA7C4|        |      ;
                       db $7F,$00,$00,$00,$80,$00,$00,$00   ;0BA7CC|        |      ;
                       db $81,$00,$00,$00,$01,$00,$00,$00   ;0BA7D4|        |      ;
                       db $05,$00,$00,$00,$1F,$20,$00,$00   ;0BA7DC|        |      ;
                       db $20,$00,$00,$00,$0B,$12,$0A,$00   ;0BA7E4|        |      ;
                       db $2A,$00,$00,$00,$7F,$00,$00,$00   ;0BA7EC|        |      ;
                       db $80,$00,$00,$00,$82,$00,$00,$00   ;0BA7F4|        |      ;
 
     entityScripts_65: db $2D,$00,$00,$00,$1E,$02,$10,$00   ;0BA7FC|        |      ;
                       db $13,$12,$08,$00,$0C,$40,$00,$00   ;0BA804|        |      ;
                       db $92,$00,$00,$00,$20,$00,$00,$00   ;0BA80C|        |      ;
                       db $0B,$12,$76,$00,$1F,$10,$00,$00   ;0BA814|        |      ;
                       db $20,$00,$00,$00,$2A,$00,$00,$00   ;0BA81C|        |      ;
                       db $13,$12,$09,$00,$00,$00,$00,$00   ;0BA824|        |      ;
 
     entityScripts_11: db $28,$00,$00,$00,$29,$00,$00,$00   ;0BA82C|        |      ;
                       db $1F,$0A,$00,$00,$20,$00,$00,$00   ;0BA834|        |      ;
                       db $8F,$00,$00,$00,$1F,$08,$00,$00   ;0BA83C|        |      ;
                       db $20,$00,$00,$00,$2C,$00,$00,$00   ;0BA844|        |      ;
 
     entityScripts_2b: db $13,$12,$05,$00,$1E,$00,$60,$00   ;0BA84C|        |      ;
                       db $6B,$00,$00,$00,$6D,$00,$00,$00   ;0BA854|        |      ;
                       db $04,$01,$00,$00                   ;0BA85C|        |      ;
 
     entityScripts_71: db $13,$14,$09,$00,$1E,$00,$90,$00   ;0BA860|        |      ;
                       db $6B,$00,$00,$00,$6D,$00,$00,$00   ;0BA868|        |      ;
                       db $04,$00,$00,$00,$0B,$14,$64,$00   ;0BA870|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BA878|        |      ;
                       db $0B,$08,$FE,$00,$1F,$16,$00,$00   ;0BA880|        |      ;
                       db $20,$00,$00,$00,$0B,$14,$64,$00   ;0BA888|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BA890|        |      ;
                       db $04,$00,$00,$00                   ;0BA898|        |      ;
 
     entityScripts_68: db $13,$08,$25,$00,$54,$00,$00,$00   ;0BA89C|        |      ;
                       db $8E,$00,$00,$00,$20,$00,$00,$00   ;0BA8A4|        |      ;
                       db $53,$00,$00,$00,$2A,$00,$00,$00   ;0BA8AC|        |      ;
                       db $13,$08,$23,$00,$1F,$16,$00,$00   ;0BA8B4|        |      ;
                       db $20,$00,$00,$00,$13,$08,$02,$00   ;0BA8BC|        |      ;
                       db $57,$00,$00,$00,$1F,$20,$00,$00   ;0BA8C4|        |      ;
                       db $20,$00,$00,$00,$04,$0A,$00,$00   ;0BA8CC|        |      ;
 
     entityScripts_08: db $13,$08,$23,$00,$2A,$00,$00,$00   ;0BA8D4|        |      ;
                       db $1F,$16,$00,$00,$20,$00,$00,$00   ;0BA8DC|        |      ;
                       db $13,$08,$02,$00,$57,$00,$00,$00   ;0BA8E4|        |      ;
                       db $1F,$20,$00,$00,$20,$00,$00,$00   ;0BA8EC|        |      ;
                       db $04,$05,$00,$00                   ;0BA8F4|        |      ;
 
     entityScripts_13: db $13,$08,$26,$00,$1E,$00,$60,$00   ;0BA8F8|        |      ; behavior 55 push
                       db $1F,$C0,$00,$00,$2F,$00,$00,$00   ;0BA900|        |      ; colusion behavier??
                       db $6D,$00,$00,$00,$04,$01,$00,$00   ;0BA908|        |      ;
 
     entityScripts_09: db $07,$00,$90,$00,$35,$00,$00,$00   ;0BA910|        |      ;
                       db $34,$00,$00,$00,$33,$0B,$00,$00   ;0BA918|        |      ;
                       db $97,$00,$00,$00,$13,$08,$17,$00   ;0BA920|        |      ;
                       db $1F,$0F,$00,$00,$20,$00,$00,$00   ;0BA928|        |      ;
                       db $0D,$04,$00,$00,$1F,$30,$00,$00   ;0BA930|        |      ;
                       db $04,$00,$00,$00,$1D,$04,$06,$00   ;0BA938|        |      ;
 
     entityScripts_17: db $30,$03,$00,$00,$07,$00,$80,$00   ;0BA940|        |      ;
                       db $1F,$60,$00,$00,$2F,$00,$00,$00   ;0BA948|        |      ;
                       db $04,$01,$00,$00,$54,$00,$00,$00   ;0BA950|        |      ;
                       db $01,$00,$00,$00,$13,$08,$22,$00   ;0BA958|        |      ;
                       db $1F,$38,$00,$00,$20,$00,$00,$00   ;0BA960|        |      ;
                       db $2D,$00,$00,$00,$1F,$50,$00,$00   ;0BA968|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$9E,$00   ;0BA970|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BA978|        |      ;
                       db $0B,$08,$9C,$00,$1F,$18,$00,$00   ;0BA980|        |      ;
                       db $20,$00,$00,$00,$53,$00,$00,$00   ;0BA988|        |      ;
                       db $04,$01,$00,$00                   ;0BA990|        |      ;
 
     entityScripts_21: db $30,$03,$00,$00,$07,$00,$80,$00   ;0BA994|        |      ;
                       db $35,$00,$00,$00,$3B,$00,$00,$00   ;0BA99C|        |      ;
                       db $6D,$00,$00,$00,$04,$00,$00,$00   ;0BA9A4|        |      ;
                       db $36,$48,$00,$00,$97,$00,$00,$00   ;0BA9AC|        |      ;
                       db $0B,$08,$AC,$00,$1F,$08,$00,$00   ;0BA9B4|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$EE,$00   ;0BA9BC|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BA9C4|        |      ;
                       db $04,$00,$00,$00,$54,$00,$00,$00   ;0BA9CC|        |      ;
                       db $97,$00,$00,$00,$13,$08,$22,$00   ;0BA9D4|        |      ;
                       db $1F,$38,$00,$00,$20,$00,$00,$00   ;0BA9DC|        |      ;
                       db $2D,$00,$00,$00,$1F,$50,$00,$00   ;0BA9E4|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$9E,$00   ;0BA9EC|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BA9F4|        |      ;
                       db $0B,$08,$9C,$00,$1F,$18,$00,$00   ;0BA9FC|        |      ;
                       db $20,$00,$00,$00,$53,$00,$00,$00   ;0BAA04|        |      ;
                       db $04,$01,$00,$00                   ;0BAA0C|        |      ;
 
     entityScripts_0a: db $07,$00,$90,$00,$35,$00,$00,$00   ;0BAA10|        |      ;
                       db $34,$00,$00,$00,$33,$12,$00,$00   ;0BAA18|        |      ;
                       db $36,$40,$00,$00,$97,$00,$00,$00   ;0BAA20|        |      ;
                       db $0B,$08,$AC,$00,$1F,$08,$00,$00   ;0BAA28|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$EE,$00   ;0BAA30|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BAA38|        |      ;
                       db $04,$00,$00,$00,$1D,$04,$06,$00   ;0BAA40|        |      ;
 
     entityScripts_0b: db $07,$01,$14,$00,$1F,$20,$00,$00   ;0BAA48|        |      ;
                       db $20,$00,$00,$00,$2D,$00,$00,$00   ;0BAA50|        |      ;
                       db $0B,$08,$5C,$00,$1F,$10,$00,$00   ;0BAA58|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$5E,$00   ;0BAA60|        |      ;
                       db $1F,$10,$00,$00,$20,$00,$00,$00   ;0BAA68|        |      ;
                       db $0B,$08,$5C,$00,$1F,$04,$00,$00   ;0BAA70|        |      ;
                       db $20,$00,$00,$00,$0D,$02,$00,$00   ;0BAA78|        |      ;
                       db $04,$00,$00,$00                   ;0BAA80|        |      ;
 
     entityScripts_0c: db $07,$00,$60,$00,$58,$04,$FF,$FF   ;0BAA84|        |      ;
                       db $59,$00,$00,$00,$57,$00,$00,$00   ;0BAA8C|        |      ;
                       db $1F,$20,$00,$00,$20,$00,$00,$00   ;0BAA94|        |      ;
                       db $04,$00,$00,$00                   ;0BAA9C|        |      ;
 
     entityScripts_22: db $13,$08,$20,$00,$4D,$20,$20,$00   ;0BAAA0|        |      ;
 
     entityScripts_23: db $13,$08,$21,$00,$1F,$2E,$00,$00   ;0BAAA8|        |      ;
                       db $20,$00,$00,$00,$02,$00,$00,$00   ;0BAAB0|        |      ;
                       db $27,$00,$00,$00                   ;0BAAB8|        |      ;
 
     entityScripts_20: db $13,$08,$1E,$00,$1F,$2E,$00,$00   ;0BAABC|        |      ;
                       db $20,$00,$00,$00,$02,$00,$00,$00   ;0BAAC4|        |      ;
                       db $27,$00,$00,$00                   ;0BAACC|        |      ;
 
     entityScripts_0d: db $07,$01,$10,$00,$73,$00,$00,$00   ;0BAAD0|        |      ;
                       db $74,$00,$00,$00                   ;0BAAD8|        |      ;
 
     entityScripts_03: db $8D,$00,$00,$00,$4D,$78,$80,$00   ;0BAADC|        |      ; 04
                       db $8C,$00,$00,$00,$47,$00,$00,$00   ;0BAAE4|        |      ;
                       db $48,$00,$00,$00,$49,$00,$00,$00   ;0BAAEC|        |      ;
 
     entityScripts_0f: db $0B,$08,$62,$00,$1F,$20,$00,$00   ;0BAAF4|        |      ;
                       db $20,$00,$00,$00,$0F,$00,$00,$00   ;0BAAFC|        |      ;
                       db $0B,$08,$64,$00,$44,$17,$00,$00   ;0BAB04|        |      ;
                       db $0B,$08,$62,$00,$1F,$10,$00,$00   ;0BAB0C|        |      ;
                       db $20,$00,$00,$00,$3C,$01,$0A,$00   ;0BAB14|        |      ;
                       db $0B,$08,$66,$00,$3E,$00,$00,$00   ;0BAB1C|        |      ;
                       db $3D,$17,$00,$00,$0B,$08,$38,$00   ;0BAB24|        |      ;
                       db $1F,$10,$00,$00,$20,$00,$00,$00   ;0BAB2C|        |      ;
                       db $0B,$08,$3A,$00,$40,$00,$00,$00   ;0BAB34|        |      ;
                       db $41,$00,$00,$00,$3C,$0D,$14,$00   ;0BAB3C|        |      ;
                       db $43,$01,$80,$00,$3F,$00,$00,$00   ;0BAB44|        |      ;
                       db $04,$00,$00,$00,$1F,$40,$00,$00   ;0BAB4C|        |      ;
                       db $20,$00,$00,$00,$42,$01,$80,$00   ;0BAB54|        |      ;
                       db $0B,$08,$3C,$00,$3F,$00,$00,$00   ;0BAB5C|        |      ;
                       db $04,$00,$00,$00                   ;0BAB64|        |      ;
 
     entityScripts_10: db $07,$00,$80,$00,$35,$00,$00,$00   ;0BAB68|        |      ;
                       db $3B,$00,$00,$00,$6D,$00,$00,$00   ;0BAB70|        |      ;
                       db $04,$00,$00,$00,$0B,$08,$B4,$00   ;0BAB78|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BAB80|        |      ;
                       db $3A,$08,$B6,$00,$1F,$08,$00,$00   ;0BAB88|        |      ;
                       db $20,$00,$00,$00,$3A,$08,$F0,$00   ;0BAB90|        |      ;
                       db $1F,$10,$00,$00,$20,$00,$00,$00   ;0BAB98|        |      ;
                       db $3A,$08,$B4,$02,$1F,$08,$00,$00   ;0BABA0|        |      ;
                       db $20,$00,$00,$00,$04,$00,$00,$00   ;0BABA8|        |      ;
 
     entityScripts_1c: db $07,$00,$60,$00,$35,$00,$00,$00   ;0BABB0|        |      ;
                       db $3B,$00,$00,$00,$6D,$00,$00,$00   ;0BABB8|        |      ;
                       db $04,$00,$00,$00,$3A,$08,$F2,$00   ;0BABC0|        |      ;
                       db $1F,$04,$00,$00,$20,$00,$00,$00   ;0BABC8|        |      ;
                       db $3A,$08,$F8,$00,$1F,$04,$00,$00   ;0BABD0|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$F4,$00   ;0BABD8|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BABE0|        |      ;
                       db $3A,$08,$F2,$02,$1F,$04,$00,$00   ;0BABE8|        |      ;
                       db $20,$00,$00,$00,$04,$00,$00,$00   ;0BABF0|        |      ;
 
     entityScripts_6a: db $98,$00,$00,$00,$68,$18,$2A,$00   ;0BABF8|        |      ;
                       db $99,$00,$00,$00,$0B,$08,$48,$00   ;0BAC00|        |      ;
                       db $1F,$06,$00,$00,$20,$00,$00,$00   ;0BAC08|        |      ;
                       db $07,$00,$70,$00,$1F,$90,$00,$00   ;0BAC10|        |      ;
                       db $2F,$00,$00,$00,$05,$00,$00,$00   ;0BAC18|        |      ;
                       db $2D,$00,$00,$00,$0B,$08,$4A,$00   ;0BAC20|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BAC28|        |      ;
                       db $0D,$03,$00,$00,$1F,$18,$00,$00   ;0BAC30|        |      ;
                       db $20,$00,$00,$00,$98,$01,$00,$00   ;0BAC38|        |      ;
                       db $2A,$00,$00,$00,$99,$01,$00,$00   ;0BAC40|        |      ;
                       db $6C,$23,$00,$00,$27,$00,$00,$00   ;0BAC48|        |      ;
 
     entityScripts_14: db $09,$00,$00,$00,$05,$00,$00,$00   ;0BAC50|        |      ;
                       db $0B,$08,$46,$00,$2A,$00,$00,$00   ;0BAC58|        |      ;
                       db $6C,$22,$00,$00,$63,$F9,$2C,$00   ;0BAC60|        |      ;
                       db $64,$00,$00,$00,$0B,$08,$48,$00   ;0BAC68|        |      ;
                       db $1F,$06,$00,$00,$20,$00,$00,$00   ;0BAC70|        |      ;
                       db $07,$00,$70,$00,$1F,$90,$00,$00   ;0BAC78|        |      ;
                       db $2F,$00,$00,$00,$05,$00,$00,$00   ;0BAC80|        |      ;
                       db $2D,$00,$00,$00,$0B,$08,$4A,$00   ;0BAC88|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BAC90|        |      ;
                       db $0D,$03,$00,$00,$1F,$18,$00,$00   ;0BAC98|        |      ;
                       db $20,$00,$00,$00,$07,$00,$70,$00   ;0BACA0|        |      ;
                       db $1F,$90,$00,$00,$2F,$00,$00,$00   ;0BACA8|        |      ;
                       db $05,$00,$00,$00,$2D,$00,$00,$00   ;0BACB0|        |      ;
                       db $0B,$08,$4A,$00,$1F,$18,$00,$00   ;0BACB8|        |      ;
                       db $20,$00,$00,$00,$0D,$03,$00,$00   ;0BACC0|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BACC8|        |      ;
                       db $63,$FF,$20,$00,$2A,$00,$00,$00   ;0BACD0|        |      ;
                       db $64,$01,$00,$00,$6C,$23,$00,$00   ;0BACD8|        |      ;
                       db $27,$00,$00,$00,$9E,$00,$00,$00   ;0BACE0|        |      ;
                       db $27,$00,$00,$00                   ;0BACE8|        |      ;
 
     entityScripts_27: db $65,$00,$00,$00,$13,$12,$02,$00   ;0BACEC|        |      ;
                       db $1E,$01,$20,$00,$58,$05,$00,$60   ;0BACF4|        |      ;
                       db $60,$00,$00,$00,$01,$00,$00,$00   ;0BACFC|        |      ;
 
                       db $05,$00,$00,$00,$62,$00,$F8,$00   ;0BAD04|        |      ;
                       db $2D,$00,$00,$00,$0B,$08,$42,$00   ;0BAD0C|        |      ;
                       db $6C,$22,$00,$00,$68,$18,$62,$00   ;0BAD14|        |      ;
 
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BAD1C|        |      ;
                       db $0B,$08,$4A,$00,$1F,$10,$00,$00   ;0BAD24|        |      ;
                       db $20,$00,$00,$00,$0D,$03,$00,$00   ;0BAD2C|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BAD34|        |      ;
                       db $62,$00,$08,$00,$04,$01,$00,$00   ;0BAD3C|        |      ;
                       db $61,$01,$0A,$00                   ;0BAD44|        |      ;
 
     entityScripts_29: db $65,$00,$00,$00,$13,$12,$02,$00   ;0BAD48|        |      ;
                       db $1E,$01,$80,$00,$90,$06,$00,$60   ;0BAD50|        |      ;
                       db $67,$00,$00,$00,$03,$00,$00,$00   ;0BAD58|        |      ;
                       db $01,$00,$00,$00,$05,$00,$00,$00   ;0BAD60|        |      ;
                       db $0B,$08,$46,$00,$2A,$00,$00,$00   ;0BAD68|        |      ;
                       db $6C,$22,$00,$00,$63,$FA,$24,$00   ;0BAD70|        |      ;
                       db $68,$18,$2A,$00,$64,$03,$2A,$00   ;0BAD78|        |      ;
                       db $0B,$08,$48,$00,$1F,$06,$00,$00   ;0BAD80|        |      ;
                       db $20,$00,$00,$00,$07,$00,$70,$00   ;0BAD88|        |      ;
                       db $1F,$90,$00,$00,$2F,$00,$00,$00   ;0BAD90|        |      ;
                       db $05,$00,$00,$00,$2D,$00,$00,$00   ;0BAD98|        |      ;
                       db $0B,$08,$4A,$00,$1F,$18,$00,$00   ;0BADA0|        |      ;
                       db $20,$00,$00,$00,$0D,$03,$00,$00   ;0BADA8|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BADB0|        |      ;
                       db $07,$00,$70,$00,$1F,$90,$00,$00   ;0BADB8|        |      ;
                       db $2F,$00,$00,$00,$05,$00,$00,$00   ;0BADC0|        |      ;
                       db $2D,$00,$00,$00,$0B,$08,$4A,$00   ;0BADC8|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BADD0|        |      ;
                       db $0D,$03,$00,$00,$1F,$18,$00,$00   ;0BADD8|        |      ;
                       db $20,$00,$00,$00,$63,$FF,$20,$00   ;0BADE0|        |      ;
                       db $2A,$00,$00,$00,$64,$02,$B0,$00   ;0BADE8|        |      ;
                       db $6C,$23,$00,$00,$27,$00,$00,$00   ;0BADF0|        |      ;
 
     entityScripts_28: db $13,$12,$03,$00,$1E,$00,$80,$00   ;0BADF8|        |      ;
                       db $1F,$40,$00,$00,$66,$00,$00,$00   ;0BAE00|        |      ;
 
     entityScripts_25: db $5F,$00,$00,$00,$6C,$0F,$00,$00   ;0BAE08|        |      ;
                       db $0B,$12,$20,$00,$1F,$12,$00,$00   ;0BAE10|        |      ;
                       db $20,$00,$00,$00,$53,$00,$00,$00   ;0BAE18|        |      ;
                       db $0B,$12,$22,$00,$1F,$08,$00,$00   ;0BAE20|        |      ;
                       db $20,$00,$00,$00,$08,$01,$00,$00   ;0BAE28|        |      ;
                       db $13,$12,$00,$00,$1E,$00,$60,$00   ;0BAE30|        |      ;
                       db $5E,$00,$00,$00,$0B,$12,$22,$00   ;0BAE38|        |      ;
                       db $1F,$08,$00,$00,$20,$00,$00,$00   ;0BAE40|        |      ;
                       db $0B,$12,$20,$00,$1F,$08,$00,$00   ;0BAE48|        |      ;
                       db $20,$00,$00,$00,$27,$00,$00,$00   ;0BAE50|        |      ;
 
     entityScripts_26: db $A7,$05,$00,$00,$89,$A8,$00,$00   ;0BAE58|        |      ;
                       db $05,$00,$00,$00,$6C,$22,$00,$00   ;0BAE60|        |      ;
                       db $5B,$01,$00,$00,$68,$00,$67,$00   ;0BAE68|        |      ;
                       db $2A,$00,$00,$00,$0B,$12,$12,$00   ;0BAE70|        |      ;
                       db $5C,$00,$00,$00,$68,$00,$67,$00   ;0BAE78|        |      ;
                       db $1F,$06,$00,$00,$20,$00,$00,$00   ;0BAE80|        |      ;
                       db $0B,$12,$10,$00,$1F,$20,$00,$00   ;0BAE88|        |      ;
                       db $20,$00,$00,$00,$05,$00,$00,$00   ;0BAE90|        |      ;
                       db $5B,$00,$00,$00,$68,$00,$67,$00   ;0BAE98|        |      ;
                       db $2A,$00,$00,$00,$0B,$12,$12,$00   ;0BAEA0|        |      ;
                       db $5C,$00,$00,$00,$68,$00,$67,$00   ;0BAEA8|        |      ;
                       db $04,$0A,$00,$00,$0B,$12,$60,$00   ;0BAEB0|        |      ;
                       db $1F,$02,$00,$00,$20,$00,$00,$00   ;0BAEB8|        |      ;
                       db $0B,$12,$62,$00,$1F,$02,$00,$00   ;0BAEC0|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$FA,$00   ;0BAEC8|        |      ;
                       db $1F,$02,$00,$00,$20,$00,$00,$00   ;0BAED0|        |      ;
                       db $0B,$08,$FC,$00,$1F,$02,$00,$00   ;0BAED8|        |      ;
                       db $20,$00,$00,$00,$0B,$08,$FA,$00   ;0BAEE0|        |      ;
                       db $1F,$02,$00,$00,$20,$00,$00,$00   ;0BAEE8|        |      ;
                       db $0B,$12,$62,$00,$1F,$02,$00,$00   ;0BAEF0|        |      ;
                       db $20,$00,$00,$00,$04,$0A,$00,$00   ;0BAEF8|        |      ;
                       db $68,$00,$67,$00,$8A,$00,$00,$00   ;0BAF00|        |      ;
                       db $A8,$C0,$00,$00                   ;0BAF08|        |      ;
 
     entityScripts_1d: db $96,$00,$00,$00,$50,$00,$00,$00   ;0BAF0C|        |      ;
                       db $53,$00,$00,$00,$51,$00,$00,$00   ;0BAF14|        |      ;
                       db $01,$00,$00,$00,$1F,$10,$00,$00   ;0BAF1C|        |      ;
                       db $20,$00,$00,$00,$9A,$06,$00,$00   ;0BAF24|        |      ;
                       db $1F,$10,$00,$00,$20,$00,$00,$00   ;0BAF2C|        |      ;
                       db $50,$01,$00,$00,$51,$00,$00,$00   ;0BAF34|        |      ;
                       db $22,$08,$00,$00,$05,$00,$00,$00   ;0BAF3C|        |      ;
                       db $08,$00,$00,$00,$20,$00,$00,$00   ;0BAF44|        |      ;
                       db $04,$00,$00,$00                   ;0BAF4C|        |      ;
 
     entityScripts_16: db $13,$08,$14,$00,$54,$00,$00,$00   ;0BAF50|        |      ;
                       db $1F,$3A,$00,$00,$20,$00,$00,$00   ;0BAF58|        |      ;
                       db $53,$00,$00,$00,$1F,$20,$00,$00   ;0BAF60|        |      ;
                       db $07,$00,$70,$00,$2F,$00,$00,$00   ;0BAF68|        |      ;
                       db $05,$00,$00,$00,$2D,$00,$00,$00   ;0BAF70|        |      ;
                       db $97,$00,$00,$00,$0D,$05,$00,$00   ;0BAF78|        |      ;
                       db $1F,$18,$00,$00,$20,$00,$00,$00   ;0BAF80|        |      ;
                       db $08,$03,$00,$00,$04,$06,$00,$00   ;0BAF88|        |      ;
 
     entityScripts_30: db $13,$0E,$00,$00,$55,$01,$00,$00   ;0BAF90|        |      ; first boss bone king
                       db $A0,$00,$00,$00                   ;0BAF98|        |      ;
 
     entityScripts_31: db $13,$0E,$02,$00,$55,$01,$00,$00   ;0BAF9C|        |      ;
                       db $00,$80,$00,$00                   ;0BAFA4|        |      ;
 
     entityScripts_32: db $4E,$00,$00,$00,$55,$01,$00,$00   ;0BAFA8|        |      ;
                       db $00,$80,$00,$00                   ;0BAFB0|        |      ;
 
     entityScripts_58: db $0B,$0E,$14,$00,$0E,$00,$00,$00   ;0BAFB4|        |      ;
 
     entityScripts_59: db $13,$0E,$03,$00,$1F,$38,$00,$00   ;0BAFBC|        |      ;
                       db $20,$00,$00,$00,$2B,$00,$00,$00   ;0BAFC4|        |      ;
                       db $00,$80,$00,$00                   ;0BAFCC|        |      ;
 
     entityScripts_5a: db $0B,$08,$60,$00,$2E,$00,$00,$00   ;0BAFD0|        |      ;
 
     entityScripts_5b: db $13,$08,$16,$00,$32,$1A,$00,$00   ;0BAFD8|        |      ;
 
     entityScripts_5c: db $13,$08,$18,$00,$11,$03,$00,$00   ;0BAFE0|        |      ;
                       db $12,$00,$00,$00                   ;0BAFE8|        |      ;
 
     entityScripts_5d: db $13,$08,$1D,$00,$56,$01,$00,$00   ;0BAFEC|        |      ;
                       db $0E,$00,$00,$00                   ;0BAFF4|        |      ;
 
     entityScripts_18: db $13,$0E,$04,$00,$1F,$10,$00,$00   ;0BAFF8|        |      ; 72
                       db $20,$00,$00,$00,$27,$00,$00,$00   ;0BB000|        |      ;
 
                       db $04,$00,$00,$00                   ;0BB008|        |      ;
 
     entityScripts_19: db $13,$08,$19,$00,$1F,$10,$00,$00   ;0BB00C|        |      ;
                       db $20,$00,$00,$00,$27,$00,$00,$00   ;0BB014|        |      ;
 
     entityScripts_1a: db $13,$08,$1A,$00,$6C,$27,$00,$00   ;0BB01C|        |      ;
                       db $1F,$20,$00,$00,$20,$00,$00,$00   ;0BB024|        |      ;
                       db $27,$00,$00,$00                   ;0BB02C|        |      ;
 
     entityScripts_1b: db $30,$00,$00,$00,$0B,$0E,$46,$00   ;0BB030|        |      ;
                       db $45,$30,$00,$00,$46,$00,$00,$00   ;0BB038|        |      ;
 
     entityScripts_2a: db $0B,$0E,$1A,$00,$45,$20,$00,$00   ;0BB040|        |      ;
                       db $46,$00,$00,$00                   ;0BB048|        |      ;
 
     entityScripts_67: db $30,$02,$00,$00                   ;0BB04C|        |      ;
 
     entityScripts_62: db $0B,$0E,$1A,$00,$45,$10,$00,$00   ;0BB050|        |      ;
                       db $46,$00,$00,$00                   ;0BB058|        |      ;
 
     entityScripts_5e: db $13,$08,$1F,$00,$1F,$28,$00,$00   ;0BB05C|        |      ;
                       db $20,$00,$00,$00,$5A,$08,$00,$00   ;0BB064|        |      ;
 
     entityScripts_5f: db $13,$12,$04,$00,$1F,$FF,$00,$00   ;0BB06C|        |      ;
                       db $20,$00,$00,$00,$0B,$12,$32,$00   ;0BB074|        |      ;
                       db $1F,$0A,$00,$00,$20,$00,$00,$00   ;0BB07C|        |      ;
                       db $27,$00,$00,$00                   ;0BB084|        |      ;
 
     entityScripts_4e: db $4F,$00,$00,$00,$39,$00,$40,$00   ;0BB088|        |      ;
                       db $69,$00,$01,$00,$6A,$00,$00,$00   ;0BB090|        |      ;
                       db $38,$00,$00,$00,$27,$00,$00,$00   ;0BB098|        |      ;
 
     entityScripts_33: db $4F,$00,$00,$00,$39,$01,$00,$00   ;0BB0A0|        |      ; 34 - 42,4c-50
                       db $37,$00,$00,$00,$38,$00,$00,$00   ;0BB0A8|        |      ;
                       db $27,$00,$00,$00                   ;0BB0B0|        |      ;
 
     entityScripts_43: db $4F,$00,$00,$00,$39,$01,$00,$00   ;0BB0B4|        |      ; 44-4b
                       db $37,$00,$00,$00,$38,$00,$00,$00   ;0BB0BC|        |      ;
                       db $87,$00,$00,$00,$1F,$38,$00,$00   ;0BB0C4|        |      ;
                       db $20,$00,$00,$00,$27,$00,$00,$00   ;0BB0CC|        |      ;
 
     entityScripts_51: db $00,$00,$00,$00                   ;0BB0D4|        |      ; 52,53
 
     entityScripts_57: db $9B,$00,$00,$00                   ;0BB0D8|        |      ;
 
         DATA8_0BB0DC: db $01                               ;0BB0DC|        |      ;
 
         DATA8_0BB0DD: db $00,$01,$00,$00,$00,$00,$00,$01   ;0BB0DD|        |      ;
                       db $0C,$71,$7C,$01,$00,$01,$00,$01   ;0BB0E5|        |      ;
                       db $00,$01,$0C,$10,$10,$01,$FC,$01   ;0BB0ED|        |      ;
                       db $1C,$01,$0C,$01,$0C,$01,$0C,$01   ;0BB0F5|        |      ;
                       db $0C,$01,$00                       ;0BB0FD|        |      ;
 
          CODE_0BB100: JMP.W CODE_0BB9D0                    ;0BB100|4CD0B9  |0BB9D0;
 
 
          CODE_0BB103: JMP.W CODE_0BB888                    ;0BB103|4C88B8  |0BB888;
 
 
          CODE_0BB106: LDA.W $0606,X                        ;0BB106|BD0606  |0B0606;
                       BNE CODE_0BB10E                      ;0BB109|D003    |0BB10E;
                       JMP.W CODE_0BB17C                    ;0BB10B|4C7CB1  |0BB17C;
 
 
          CODE_0BB10E: RTS                                  ;0BB10E|60      |      ;
 
 
          CODE_0BB10F: LDA.B r_damagePlayer                 ;0BB10F|A581    |000081;
                       CMP.B #$01                           ;0BB111|C901    |      ;
                       BEQ CODE_0BB132                      ;0BB113|F01D    |0BB132;
                       JSR.W CODE_0BB84C                    ;0BB115|204CB8  |0BB84C;
                       BCS CODE_0BB132                      ;0BB118|B018    |0BB132;
                       LDA.W $054E,X                        ;0BB11A|BD4E05  |0B054E;
                       CMP.B #$7D                           ;0BB11D|C97D    |      ;
                       BEQ CODE_0BB14F                      ;0BB11F|F02E    |0BB14F;
                       CMP.B #$82                           ;0BB121|C982    |      ;
                       BEQ CODE_0BB135                      ;0BB123|F010    |0BB135;
                       SEC                                  ;0BB125|38      |      ;
                       SBC.B #$79                           ;0BB126|E979    |      ;
                       ASL A                                ;0BB128|0A      |      ;
                       TAY                                  ;0BB129|A8      |      ;
                       LDA.W DATA8_0BB0DD,Y                 ;0BB12A|B9DDB0  |0BB0DD;
                       STA.B r_damagePlayer                 ;0BB12D|8581    |000081;
                       JMP.W CODE_0BB250                    ;0BB12F|4C50B2  |0BB250;
 
 
          CODE_0BB132: JMP.W CODE_0BB25F                    ;0BB132|4C5FB2  |0BB25F;
 
 
          CODE_0BB135: LDA.W $0606,X                        ;0BB135|BD0606  |0B0606;
                       BNE CODE_0BB143                      ;0BB138|D009    |0BB143;
                       LDA.W $0657,X                        ;0BB13A|BD5706  |0B0657;
                       BEQ CODE_0BB14C                      ;0BB13D|F00D    |0BB14C;
                       LDA.B #$1C                           ;0BB13F|A91C    |      ;
                       BNE CODE_0BB14A                      ;0BB141|D007    |0BB14A;
 
          CODE_0BB143: LDA.W $0657,X                        ;0BB143|BD5706  |0B0657;
                       BEQ CODE_0BB14C                      ;0BB146|F004    |0BB14C;
 
          CODE_0BB148: LDA.B #$0C                           ;0BB148|A90C    |      ;
 
          CODE_0BB14A: STA.B r_damagePlayer                 ;0BB14A|8581    |000081;
 
          CODE_0BB14C: JMP.W CODE_0BB250                    ;0BB14C|4C50B2  |0BB250;
 
 
          CODE_0BB14F: LDA.W $0657,X                        ;0BB14F|BD5706  |0B0657;
                       BEQ CODE_0BB14C                      ;0BB152|F0F8    |0BB14C;
                       BNE CODE_0BB148                      ;0BB154|D0F2    |0BB148;
 
          CODE_0BB156: LDA.W $0657,X                        ;0BB156|BD5706  |0B0657;
                       JMP.W CODE_0BB1BF                    ;0BB159|4CBFB1  |0BB1BF;
 
 
          CODE_0BB15C: CMP.B #$83                           ;0BB15C|C983    |      ;
                       BNE CODE_0BB163                      ;0BB15E|D003    |0BB163;
                       JMP.W CODE_0BB22E                    ;0BB160|4C2EB2  |0BB22E;
 
 
          CODE_0BB163: CMP.B #$85                           ;0BB163|C985    |      ;
                       BEQ CODE_0BB1CF                      ;0BB165|F068    |0BB1CF;
                       CMP.B #$7A                           ;0BB167|C97A    |      ;
                       BNE CODE_0BB16E                      ;0BB169|D003    |0BB16E;
                       JMP.W CODE_0BB100                    ;0BB16B|4C00B1  |0BB100;
 
 
          CODE_0BB16E: CMP.B #$7F                           ;0BB16E|C97F    |      ;
                       BNE CODE_0BB175                      ;0BB170|D003    |0BB175;
                       JMP.W CODE_0BB106                    ;0BB172|4C06B1  |0BB106;
 
 
          CODE_0BB175: CMP.B #$80                           ;0BB175|C980    |      ;
                       BNE CODE_0BB17C                      ;0BB177|D003    |0BB17C;
                       JMP.W CODE_0BB103                    ;0BB179|4C03B1  |0BB103;
 
 
          CODE_0BB17C: JSR.W CODE_0BB64C                    ;0BB17C|204CB6  |0BB64C;
                       BCC CODE_0BB184                      ;0BB17F|9003    |0BB184;
                       JMP.W CODE_0BB10F                    ;0BB181|4C0FB1  |0BB10F;
 
 
          CODE_0BB184: LDA.W $054E,X                        ;0BB184|BD4E05  |0B054E;
                       CMP.B #$7E                           ;0BB187|C97E    |      ;
                       BEQ CODE_0BB19F                      ;0BB189|F014    |0BB19F;
                       CMP.B #$84                           ;0BB18B|C984    |      ;
                       BEQ CODE_0BB19F                      ;0BB18D|F010    |0BB19F;
                       CMP.B #$86                           ;0BB18F|C986    |      ;
                       BEQ CODE_0BB19F                      ;0BB191|F00C    |0BB19F;
                       CMP.B #$87                           ;0BB193|C987    |      ;
                       BEQ CODE_0BB19F                      ;0BB195|F008    |0BB19F;
                       CMP.B #$8A                           ;0BB197|C98A    |      ;
                       BEQ CODE_0BB19F                      ;0BB199|F004    |0BB19F;
                       CMP.B #$88                           ;0BB19B|C988    |      ;
                       BNE CODE_0BB1AB                      ;0BB19D|D00C    |0BB1AB;
 
          CODE_0BB19F: LDY.B r_delayElevators               ;0BB19F|A4AF    |0000AF;
                       BEQ CODE_0BB1AB                      ;0BB1A1|F008    |0BB1AB;
                       CPX.B r_platformIDFrozenEnemy        ;0BB1A3|E4B8    |0000B8;
                       BEQ CODE_0BB132                      ;0BB1A5|F08B    |0BB132;
                       LDA.B #$00                           ;0BB1A7|A900    |      ;
                       STA.B r_delayElevators               ;0BB1A9|85AF    |0000AF;
 
          CODE_0BB1AB: CMP.B #$7D                           ;0BB1AB|C97D    |      ;
                       BEQ CODE_0BB156                      ;0BB1AD|F0A7    |0BB156;
                       CMP.B #$82                           ;0BB1AF|C982    |      ;
                       BEQ CODE_0BB156                      ;0BB1B1|F0A3    |0BB156;
                       CMP.B #$83                           ;0BB1B3|C983    |      ;
                       BEQ LOOSE_OP_0BB1C9                  ;0BB1B5|F012    |0BB1C9;
                       SEC                                  ;0BB1B7|38      |      ;
                       SBC.B #$79                           ;0BB1B8|E979    |      ;
                       ASL A                                ;0BB1BA|0A      |      ;
                       TAY                                  ;0BB1BB|A8      |      ;
                       LDA.W DATA8_0BB0DC,Y                 ;0BB1BC|B9DCB0  |0BB0DC;
 
          CODE_0BB1BF: STA.B r_damagePlayer                 ;0BB1BF|8581    |000081;
                       LDA.B #$10                           ;0BB1C1|A910    |      ;
                       STA.W $0669,X                        ;0BB1C3|9D6906  |0B0669;
                       JMP.W CODE_0BB250                    ;0BB1C6|4C50B2  |0BB250;
 
 
      LOOSE_OP_0BB1C9: db $BD                               ;0BB1C9|        |      ;
                       EOR.B [$06],Y                        ;0BB1CA|5706    |000006;
                       JMP.W CODE_0BB1BF                    ;0BB1CC|4CBFB1  |0BB1BF;
 
 
          CODE_0BB1CF: LDA.B #$00                           ;0BB1CF|A900    |      ;
                       STA.B r_CogProximity                 ;0BB1D1|8593    |000093;
                       JMP.W CODE_0BB8EE                    ;0BB1D3|4CEEB8  |0BB8EE;
 
 
          CODE_0BB1D6: JSR.W CODE_0BB663                    ;0BB1D6|2063B6  |0BB663;
                       BCS CODE_0BB1E9                      ;0BB1D9|B00E    |0BB1E9;
                       JSR.W CODE_0BB809                    ;0BB1DB|2009B8  |0BB809;
                       BCC CODE_0BB1E3                      ;0BB1DE|9003    |0BB1E3;
                       JMP.W CODE_0BB25F                    ;0BB1E0|4C5FB2  |0BB25F;
 
 
          CODE_0BB1E3: LDA.B #$01                           ;0BB1E3|A901    |      ;
                       STA.B r_damagePlayer                 ;0BB1E5|8581    |000081;
                       BNE CODE_0BB250                      ;0BB1E7|D067    |0BB250;
 
          CODE_0BB1E9: LDA.B r_damagePlayer                 ;0BB1E9|A581    |000081;
                       CMP.B #$01                           ;0BB1EB|C901    |      ;
                       BEQ CODE_0BB25F                      ;0BB1ED|F070    |0BB25F;
                       JSR.W CODE_0BB377                    ;0BB1EF|2077B3  |0BB377;
                       BCS CODE_0BB25F                      ;0BB1F2|B06B    |0BB25F;
                       LDA.B #$02                           ;0BB1F4|A902    |      ;
                       STA.B r_damagePlayer                 ;0BB1F6|8581    |000081;
                       BNE CODE_0BB250                      ;0BB1F8|D056    |0BB250;
 
          CODE_0BB1FA: RTS                                  ;0BB1FA|60      |      ;
 
 
          CODE_0BB1FB: LDA.W $0470,X                        ;0BB1FB|BD7004  |0B0470;
                       AND.B #$11                           ;0BB1FE|2911    |      ;
                       BNE CODE_0BB1FA                      ;0BB200|D0F8    |0BB1FA;
                       LDA.W $0400,X                        ;0BB202|BD0004  |0B0400;
                       BEQ CODE_0BB1FA                      ;0BB205|F0F3    |0BB1FA;
                       LDA.W $054E,X                        ;0BB207|BD4E05  |0B054E;
                       CMP.B #$1C                           ;0BB20A|C91C    |      ;
                       BEQ CODE_0BB1FA                      ;0BB20C|F0EC    |0BB1FA;
                       CMP.B #$93                           ;0BB20E|C993    |      ;
                       BCS CODE_0BB1FA                      ;0BB210|B0E8    |0BB1FA;
                       CMP.B #$90                           ;0BB212|C990    |      ;
                       BCS CODE_0BB25F                      ;0BB214|B049    |0BB25F;
                       CMP.B #$68                           ;0BB216|C968    |      ;
                       BCC CODE_0BB21E                      ;0BB218|9004    |0BB21E;
                       CMP.B #$71                           ;0BB21A|C971    |      ;
                       BCC CODE_0BB1FA                      ;0BB21C|90DC    |0BB1FA;
 
          CODE_0BB21E: LDA.B r_damagePlayer                 ;0BB21E|A581    |000081;
                       AND.B #$F0                           ;0BB220|29F0    |      ;
                       BNE CODE_0BB25F                      ;0BB222|D03B    |0BB25F;
                       LDA.W $054E,X                        ;0BB224|BD4E05  |0B054E;
                       CMP.B #$79                           ;0BB227|C979    |      ;
                       BCC CODE_0BB22E                      ;0BB229|9003    |0BB22E;
                       JMP.W CODE_0BB15C                    ;0BB22B|4C5CB1  |0BB15C;
 
 
          CODE_0BB22E: LDA.W $0470,X                        ;0BB22E|BD7004  |0B0470;
                       AND.B #$02                           ;0BB231|2902    |      ;
                       BNE CODE_0BB1D6                      ;0BB233|D0A1    |0BB1D6;
                       LDA.B r_invincableFrames             ;0BB235|A580    |000080;
                       BNE CODE_0BB25F                      ;0BB237|D026    |0BB25F;
                       JSR.W CODE_0BB377                    ;0BB239|2077B3  |0BB377;
                       BCS CODE_0BB25F                      ;0BB23C|B021    |0BB25F;
                       LDA.W $0657,X                        ;0BB23E|BD5706  |0B0657;
                       STA.B r_damagePlayer                 ;0BB241|8581    |000081;
                       LDA.W $054E,X                        ;0BB243|BD4E05  |0B054E;
                       CMP.B #$49                           ;0BB246|C949    |      ;
                       BNE CODE_0BB250                      ;0BB248|D006    |0BB250;
                       db $20                               ;0BB24A|        |      ;
                       dw UNREACH_0FFEC8                    ;0BB24B|        |0FFEC8;
                       JSR.W DATA8_0BB581                   ;0BB24D|2081B5  |0BB581;
 
          CODE_0BB250: STX.B r_ConveyorRelated              ;0BB250|8691    |000091;
                       LDY.B #$00                           ;0BB252|A000    |      ;
                       LDA.W $0438,X                        ;0BB254|BD3804  |0B0438;
                       CMP.W $0438                          ;0BB257|CD3804  |0B0438;
                       BCS CODE_0BB25D                      ;0BB25A|B001    |0BB25D;
                       INY                                  ;0BB25C|C8      |      ;
 
          CODE_0BB25D: STY.B r_knockBackDirrection          ;0BB25D|8490    |000090;
 
          CODE_0BB25F: LDA.W $054E,X                        ;0BB25F|BD4E05  |0B054E;
                       CMP.B #$16                           ;0BB262|C916    |      ;
                       BEQ CODE_0BB1FA                      ;0BB264|F094    |0BB1FA;
                       CMP.B #$47                           ;0BB266|C947    |      ;
                       BEQ CODE_0BB1FA                      ;0BB268|F090    |0BB1FA;
                       CMP.B #$71                           ;0BB26A|C971    |      ;
                       BCC CODE_0BB272                      ;0BB26C|9004    |0BB272;
                       CMP.B #$90                           ;0BB26E|C990    |      ;
                       BCC CODE_0BB1FA                      ;0BB270|9088    |0BB1FA;
 
          CODE_0BB272: LDA.W $068D,X                        ;0BB272|BD8D06  |0B068D;
                       AND.B #$01                           ;0BB275|2901    |      ;
                       BNE CODE_0BB2A0                      ;0BB277|D027    |0BB2A0;
                       LDA.W $0630                          ;0BB279|AD3006  |0B0630;
                       BEQ CODE_0BB2A0                      ;0BB27C|F022    |0BB2A0;
                       LDA.W $0413                          ;0BB27E|AD1304  |0B0413;
                       BEQ CODE_0BB2A0                      ;0BB281|F01D    |0BB2A0;
                       JSR.W CODE_0BB42A                    ;0BB283|202AB4  |0BB42A;
                       BCS CODE_0BB2A0                      ;0BB286|B018    |0BB2A0;
                       LDA.W $068D,X                        ;0BB288|BD8D06  |0B068D;
                       ORA.B #$01                           ;0BB28B|0901    |      ;
                       STA.W $068D,X                        ;0BB28D|9D8D06  |0B068D;
                       LDA.W $0630                          ;0BB290|AD3006  |0B0630;
                       JSR.W CODE_0BB30B                    ;0BB293|200BB3  |0BB30B;
                       LDA.B #$00                           ;0BB296|A900    |      ;
                       STA.B $9E                            ;0BB298|859E    |00009E;
                       JSR.W CODE_0BB601                    ;0BB29A|2001B6  |0BB601;
                       JSR.W CODE_0BB4C4                    ;0BB29D|20C4B4  |0BB4C4;
 
          CODE_0BB2A0: LDA.B #$14                           ;0BB2A0|A914    |      ;
                       STA.B $9E                            ;0BB2A2|859E    |00009E;
 
          CODE_0BB2A4: LDY.B $9E                            ;0BB2A4|A49E    |00009E;
                       LDA.W $054E,Y                        ;0BB2A6|B94E05  |0B054E;
                       BEQ CODE_0BB2F5                      ;0BB2A9|F04A    |0BB2F5;
                       JSR.W CODE_0BB301                    ;0BB2AB|2001B3  |0BB301;
                       AND.W DATA8_0BB2FE,Y                 ;0BB2AE|39FEB2  |0BB2FE;
                       BNE CODE_0BB2F5                      ;0BB2B1|D042    |0BB2F5;
                       JSR.W CODE_0BB485                    ;0BB2B3|2085B4  |0BB485;
                       BCS CODE_0BB2F5                      ;0BB2B6|B03D    |0BB2F5;
                       JSR.W CODE_0BB759                    ;0BB2B8|2059B7  |0BB759;
                       JSR.W CODE_0BB301                    ;0BB2BB|2001B3  |0BB301;
                       ORA.W DATA8_0BB2FE,Y                 ;0BB2BE|19FEB2  |0BB2FE;
                       STA.W $068D,X                        ;0BB2C1|9D8D06  |0B068D;
                       LDY.B $9E                            ;0BB2C4|A49E    |00009E;
                       LDA.W $0606,Y                        ;0BB2C6|B90606  |0B0606;
                       AND.B #$F0                           ;0BB2C9|29F0    |      ;
                       JSR.W CODE_0BB30B                    ;0BB2CB|200BB3  |0BB30B;
                       AND.B #$F0                           ;0BB2CE|29F0    |      ;
                       STA.B r_collisionPointAbsoluteXInRoom;0BB2D0|8513    |000013;
                       LDA.W $0606,Y                        ;0BB2D2|B90606  |0B0606;
                       AND.B #$0F                           ;0BB2D5|290F    |      ;
                       ORA.B r_collisionPointAbsoluteXInRoom;0BB2D7|0513    |000013;
                       STA.W $0669,X                        ;0BB2D9|9D6906  |0B0669;
                       JSR.W CODE_0BB33A                    ;0BB2DC|203AB3  |0BB33A;
                       JSR.W CODE_0BB31A                    ;0BB2DF|201AB3  |0BB31A;
                       LDA.W $054E,Y                        ;0BB2E2|B94E05  |0B054E;
                       CMP.B #$06                           ;0BB2E5|C906    |      ;
                       BNE CODE_0BB2EF                      ;0BB2E7|D006    |0BB2EF;
                       JSR.W CODE_0BB6E6                    ;0BB2E9|20E6B6  |0BB6E6;
                       JMP.W CODE_0BB2F5                    ;0BB2EC|4CF5B2  |0BB2F5;
 
 
          CODE_0BB2EF: JSR.W CODE_0BB5DD                    ;0BB2EF|20DDB5  |0BB5DD;
                       JSR.W CODE_0BB4C4                    ;0BB2F2|20C4B4  |0BB4C4;
 
          CODE_0BB2F5: INC.B $9E                            ;0BB2F5|E69E    |00009E;
                       LDA.B $9E                            ;0BB2F7|A59E    |00009E;
                       CMP.B #$17                           ;0BB2F9|C917    |      ;
                       BCC CODE_0BB2A4                      ;0BB2FB|90A7    |0BB2A4;
                       RTS                                  ;0BB2FD|60      |      ;
 
 
         DATA8_0BB2FE: db $02,$04                           ;0BB2FE|        |      ;
                       PHP                                  ;0BB300|08      |      ;
 
          CODE_0BB301: SEC                                  ;0BB301|38      |      ;
                       LDA.B $9E                            ;0BB302|A59E    |00009E;
                       SBC.B #$14                           ;0BB304|E914    |      ;
                       TAY                                  ;0BB306|A8      |      ;
                       LDA.W $068D,X                        ;0BB307|BD8D06  |0B068D;
                       RTS                                  ;0BB30A|60      |      ;
 
 
          CODE_0BB30B: CLC                                  ;0BB30B|18      |      ;
                       ADC.W $0669,X                        ;0BB30C|7D6906  |0B0669;
                       BCC CODE_0BB316                      ;0BB30F|9005    |0BB316;
                       LDA.W $0669,X                        ;0BB311|BD6906  |0B0669;
                       ORA.B #$F0                           ;0BB314|09F0    |      ;
 
          CODE_0BB316: STA.W $0669,X                        ;0BB316|9D6906  |0B0669;
                       RTS                                  ;0BB319|60      |      ;
 
 
          CODE_0BB31A: AND.B #$0F                           ;0BB31A|290F    |      ;
                       CMP.B #$03                           ;0BB31C|C903    |      ;
                       BNE CODE_0BB339                      ;0BB31E|D019    |0BB339;
                       LDA.W $054E,Y                        ;0BB320|B94E05  |0B054E;
                       CMP.B #$02                           ;0BB323|C902    |      ;
                       BNE CODE_0BB339                      ;0BB325|D012    |0BB339;
                       LDA.W $0669,Y                        ;0BB327|B96906  |0B0669;
                       ORA.B #$03                           ;0BB32A|0903    |      ;
                       STA.W $0669,Y                        ;0BB32C|996906  |0B0669;
                       LDA.W $0669,X                        ;0BB32F|BD6906  |0B0669;
                       AND.B #$F0                           ;0BB332|29F0    |      ;
                       ORA.B #$03                           ;0BB334|0903    |      ;
                       STA.W $0669,X                        ;0BB336|9D6906  |0B0669;
 
          CODE_0BB339: RTS                                  ;0BB339|60      |      ;
 
 
          CODE_0BB33A: LDA.W $054E,X                        ;0BB33A|BD4E05  |0B054E;
                       CMP.B #$67                           ;0BB33D|C967    |      ;
                       BEQ CODE_0BB358                      ;0BB33F|F017    |0BB358;
                       CMP.B #$1B                           ;0BB341|C91B    |      ;
                       BCC CODE_0BB351                      ;0BB343|900C    |0BB351;
                       CMP.B #$1F                           ;0BB345|C91F    |      ;
                       BCS CODE_0BB351                      ;0BB347|B008    |0BB351;
                       CMP.B #$1C                           ;0BB349|C91C    |      ;
                       BEQ CODE_0BB351                      ;0BB34B|F004    |0BB351;
                       LDA.B #$00                           ;0BB34D|A900    |      ;
                       BEQ CODE_0BB354                      ;0BB34F|F003    |0BB354;
 
          CODE_0BB351: LDA.W $0657,X                        ;0BB351|BD5706  |0B0657;
 
          CODE_0BB354: STA.W $061D,Y                        ;0BB354|991D06  |0B061D;
                       RTS                                  ;0BB357|60      |      ;
 
 
          CODE_0BB358: LDA.W $04A8,X                        ;0BB358|BDA804  |0B04A8;
                       BNE CODE_0BB367                      ;0BB35B|D00A    |0BB367;
                       LDA.W $0438,X                        ;0BB35D|BD3804  |0B0438;
                       CMP.W $0438,Y                        ;0BB360|D93804  |0B0438;
                       BCC CODE_0BB351                      ;0BB363|90EC    |0BB351;
                       BCS CODE_0BB36F                      ;0BB365|B008    |0BB36F;
 
          CODE_0BB367: LDA.W $0438,X                        ;0BB367|BD3804  |0B0438;
                       CMP.W $0438,Y                        ;0BB36A|D93804  |0B0438;
                       BCS CODE_0BB351                      ;0BB36D|B0E2    |0BB351;
 
          CODE_0BB36F: LDA.W $0657,X                        ;0BB36F|BD5706  |0B0657;
                       AND.B #$F0                           ;0BB372|29F0    |      ;
                       JMP.W CODE_0BB354                    ;0BB374|4C54B3  |0BB354;
 
 
          CODE_0BB377: LDY.B r_currPartnerID                ;0BB377|A482    |000082;
                       LDA.W DATA8_0BBB43,Y                 ;0BB379|B943BB  |0BBB43;
                       STA.B $00                            ;0BB37C|8500    |000000;
                       LDA.W DATA8_0BBB4C,Y                 ;0BB37E|B94CBB  |0BBB4C;
                       STA.B $01                            ;0BB381|8501    |000001;
                       LDY.W $054E,X                        ;0BB383|BC4E05  |0B054E;
                       LDA.W $048C,X                        ;0BB386|BD8C04  |0B048C;
                       CMP.B #$08                           ;0BB389|C908    |      ;
                       BNE CODE_0BB394                      ;0BB38B|D007    |0BB394;
                       LDA.W $0400,X                        ;0BB38D|BD0004  |0B0400;
                       CMP.B #$EE                           ;0BB390|C9EE    |      ;
                       BCS CODE_0BB3D4                      ;0BB392|B040    |0BB3D4;
 
          CODE_0BB394: LDA.B r_bossSpecialHitbox            ;0BB394|A5BA    |0000BA;
                       BEQ CODE_0BB3A0                      ;0BB396|F008    |0BB3A0;
                       db $20                               ;0BB398|        |      ;
                       dw CODE_0FE611                       ;0BB399|        |0FE611;
                       BCC CODE_0BB3A0                      ;0BB39B|9003    |0BB3A0;
                       JMP.W CODE_0BB763                    ;0BB39D|4C63B7  |0BB763;
 
 
          CODE_0BB3A0: CLC                                  ;0BB3A0|18      |      ;
                       LDY.W $054E,X                        ;0BB3A1|BC4E05  |0B054E;
                       LDA.W DATA8_0BBBC8,Y                 ;0BB3A4|B9C8BB  |0BBBC8;
                       ADC.B $00                            ;0BB3A7|6500    |000000;
                       STA.B $02                            ;0BB3A9|8502    |000002;
                       JSR.W CODE_0B80B3                    ;0BB3AB|20B380  |0B80B3;
                       CMP.B $02                            ;0BB3AE|C502    |000002;
                       BCS CODE_0BB3D1                      ;0BB3B0|B01F    |0BB3D1;
                       CLC                                  ;0BB3B2|18      |      ;
                       LDA.W DATA8_0BBC60,Y                 ;0BB3B3|B960BC  |0BBC60;
                       ADC.B $01                            ;0BB3B6|6501    |000001;
                       STA.B $03                            ;0BB3B8|8503    |000003;
                       LDY.B #$00                           ;0BB3BA|A000    |      ;
                       LDA.B r_currPartnerID                ;0BB3BC|A582    |000082;
                       CMP.B #$04                           ;0BB3BE|C904    |      ;
                       BCC CODE_0BB3C3                      ;0BB3C0|9001    |0BB3C3;
                       INY                                  ;0BB3C2|C8      |      ;
 
          CODE_0BB3C3: CLC                                  ;0BB3C3|18      |      ;
                       LDA.W DATA8_0BB3D2,Y                 ;0BB3C4|B9D2B3  |0BB3D2;
                       ADC.W $041C                          ;0BB3C7|6D1C04  |0B041C;
                       STA.B r_collisionPointYinScreen      ;0BB3CA|8511    |000011;
                       JSR.W CODE_0B80C1                    ;0BB3CC|20C180  |0B80C1;
                       CMP.B $03                            ;0BB3CF|C503    |000003;
 
          CODE_0BB3D1: RTS                                  ;0BB3D1|60      |      ;
 
 
         DATA8_0BB3D2: db $00,$05                           ;0BB3D2|        |      ;
 
          CODE_0BB3D4: SEC                                  ;0BB3D4|38      |      ;
                       SBC.B #$EE                           ;0BB3D5|E9EE    |      ;
                       PHA                                  ;0BB3D7|48      |      ;
                       CLC                                  ;0BB3D8|18      |      ;
                       ADC.W $04A8,X                        ;0BB3D9|7DA804  |0B04A8;
                       STA.B $07                            ;0BB3DC|8507    |000007;
                       PLA                                  ;0BB3DE|68      |      ;
                       LSR A                                ;0BB3DF|4A      |      ;
                       STA.B $06                            ;0BB3E0|8506    |000006;
                       TAY                                  ;0BB3E2|A8      |      ;
                       CLC                                  ;0BB3E3|18      |      ;
                       LDA.W DATA8_0BBB72,Y                 ;0BB3E4|B972BB  |0BBB72;
                       ADC.B $00                            ;0BB3E7|6500    |000000;
                       STA.B $02                            ;0BB3E9|8502    |000002;
                       LDY.B $07                            ;0BB3EB|A407    |000007;
                       LDA.W DATA8_0BBB84,Y                 ;0BB3ED|B984BB  |0BBB84;
                       CLC                                  ;0BB3F0|18      |      ;
                       ADC.W $0438,X                        ;0BB3F1|7D3804  |0B0438;
                       STA.B r_index                        ;0BB3F4|8510    |000010;
                       JSR.W CODE_0BB745                    ;0BB3F6|2045B7  |0BB745;
                       CMP.B $02                            ;0BB3F9|C502    |000002;
                       BCS CODE_0BB3D1                      ;0BB3FB|B0D4    |0BB3D1;
                       LDY.B $06                            ;0BB3FD|A406    |000006;
                       CLC                                  ;0BB3FF|18      |      ;
                       LDA.W DATA8_0BBB7B,Y                 ;0BB400|B97BBB  |0BBB7B;
                       ADC.B $01                            ;0BB403|6501    |000001;
                       STA.B $03                            ;0BB405|8503    |000003;
                       LDY.B $07                            ;0BB407|A407    |000007;
                       LDA.W DATA8_0BBB96,Y                 ;0BB409|B996BB  |0BBB96;
                       CLC                                  ;0BB40C|18      |      ;
                       ADC.W $041C,X                        ;0BB40D|7D1C04  |0B041C;
                       STA.B r_index                        ;0BB410|8510    |000010;
                       LDY.B #$00                           ;0BB412|A000    |      ;
                       LDA.B r_currPartnerID                ;0BB414|A582    |000082;
                       CMP.B #$04                           ;0BB416|C904    |      ;
                       BCC CODE_0BB41B                      ;0BB418|9001    |0BB41B;
                       INY                                  ;0BB41A|C8      |      ;
 
          CODE_0BB41B: CLC                                  ;0BB41B|18      |      ;
                       LDA.W DATA8_0BB3D2,Y                 ;0BB41C|B9D2B3  |0BB3D2;
                       ADC.W $041C                          ;0BB41F|6D1C04  |0B041C;
                       STA.B r_collisionPointYinScreen      ;0BB422|8511    |000011;
                       JSR.W CODE_0BB739                    ;0BB424|2039B7  |0BB739;
                       CMP.B $03                            ;0BB427|C503    |000003;
                       RTS                                  ;0BB429|60      |      ;
 
 
          CODE_0BB42A: JSR.W CODE_0B80B3                    ;0BB42A|20B380  |0B80B3;
                       CMP.B #$80                           ;0BB42D|C980    |      ;
                       BCS CODE_0BB484                      ;0BB42F|B053    |0BB484;
                       LDY.W $0561                          ;0BB431|AC6105  |0B0561;
                       LDA.W DATA8_0BBB55,Y                 ;0BB434|B955BB  |0BBB55;
                       STA.B $00                            ;0BB437|8500    |000000;
                       LDA.W DATA8_0BBB5A,Y                 ;0BB439|B95ABB  |0BBB5A;
                       STA.B $01                            ;0BB43C|8501    |000001;
                       CLC                                  ;0BB43E|18      |      ;
                       TYA                                  ;0BB43F|98      |      ;
                       ASL A                                ;0BB440|0A      |      ;
                       ADC.W $04A8                          ;0BB441|6DA804  |0B04A8;
                       TAY                                  ;0BB444|A8      |      ;
                       CLC                                  ;0BB445|18      |      ;
                       LDA.W DATA8_0BBB5F,Y                 ;0BB446|B95FBB  |0BBB5F;
                       ADC.W $0438                          ;0BB449|6D3804  |0B0438;
                       STA.B r_index                        ;0BB44C|8510    |000010;
                       CLC                                  ;0BB44E|18      |      ;
                       LDY.B r_currPartnerID                ;0BB44F|A482    |000082;
                       LDA.W $042F                          ;0BB451|AD2F04  |0B042F;
                       ADC.W DATA8_0BBB69,Y                 ;0BB454|7969BB  |0BBB69;
                       STA.B r_collisionPointYinScreen      ;0BB457|8511    |000011;
 
          CODE_0BB459: LDA.B r_bossSpecialHitbox            ;0BB459|A5BA    |0000BA;
                       BEQ CODE_0BB465                      ;0BB45B|F008    |0BB465;
                       db $20                               ;0BB45D|        |      ;
                       dw CODE_0FE611                       ;0BB45E|        |0FE611;
                       BCC CODE_0BB465                      ;0BB460|9003    |0BB465;
                       JMP.W CODE_0BB78D                    ;0BB462|4C8DB7  |0BB78D;
 
 
          CODE_0BB465: LDY.W $054E,X                        ;0BB465|BC4E05  |0B054E;
                       CLC                                  ;0BB468|18      |      ;
                       LDA.W DATA8_0BBBC8,Y                 ;0BB469|B9C8BB  |0BBBC8;
                       ADC.B $00                            ;0BB46C|6500    |000000;
                       STA.B $02                            ;0BB46E|8502    |000002;
                       JSR.W CODE_0B80CB                    ;0BB470|20CB80  |0B80CB;
                       CMP.B $02                            ;0BB473|C502    |000002;
                       BCS CODE_0BB484                      ;0BB475|B00D    |0BB484;
                       CLC                                  ;0BB477|18      |      ;
                       LDA.W DATA8_0BBC60,Y                 ;0BB478|B960BC  |0BBC60;
                       ADC.B $01                            ;0BB47B|6501    |000001;
                       STA.B $03                            ;0BB47D|8503    |000003;
                       JSR.W CODE_0B80C1                    ;0BB47F|20C180  |0B80C1;
                       CMP.B $03                            ;0BB482|C503    |000003;
 
          CODE_0BB484: RTS                                  ;0BB484|60      |      ;
 
 
          CODE_0BB485: LDY.B $9E                            ;0BB485|A49E    |00009E;
                       LDA.W $054E,Y                        ;0BB487|B94E05  |0B054E;
                       CMP.B #$05                           ;0BB48A|C905    |      ;
                       BEQ CODE_0BB4AA                      ;0BB48C|F01C    |0BB4AA;
                       TAY                                  ;0BB48E|A8      |      ;
                       LDA.W DATA8_0BBBA8,Y                 ;0BB48F|B9A8BB  |0BBBA8;
                       STA.B $00                            ;0BB492|8500    |000000;
                       LDA.W DATA8_0BBBB3,Y                 ;0BB494|B9B3BB  |0BBBB3;
 
          CODE_0BB497: STA.B $01                            ;0BB497|8501    |000001;
                       LDX.B $9E                            ;0BB499|A69E    |00009E;
                       LDA.W $0438,X                        ;0BB49B|BD3804  |0B0438;
                       STA.B r_index                        ;0BB49E|8510    |000010;
                       LDA.W $041C,X                        ;0BB4A0|BD1C04  |0B041C;
                       STA.B r_collisionPointYinScreen      ;0BB4A3|8511    |000011;
                       LDX.B r_entityID_processed           ;0BB4A5|A66C    |00006C;
                       JMP.W CODE_0BB459                    ;0BB4A7|4C59B4  |0BB459;
 
 
          CODE_0BB4AA: LDY.W $0593,X                        ;0BB4AA|BC9305  |0B0593;
                       LDA.W DATA8_0BBBBE,Y                 ;0BB4AD|B9BEBB  |0BBBBE;
                       STA.B $00                            ;0BB4B0|8500    |000000;
                       LDA.B #$08                           ;0BB4B2|A908    |      ;
                       STA.B $01                            ;0BB4B4|8501    |000001;
                       JMP.W CODE_0BB497                    ;0BB4B6|4C97B4  |0BB497;
 
 
          CODE_0BB4B9: CMP.B #$90                           ;0BB4B9|C990    |      ;
                       BCC CODE_0BB51D                      ;0BB4BB|9060    |0BB51D;
                       CMP.B #$93                           ;0BB4BD|C993    |      ;
                       BCS CODE_0BB51D                      ;0BB4BF|B05C    |0BB51D;
                       JMP.W CODE_0BA2E2                    ;0BB4C1|4CE2A2  |0BA2E2;
 
 
          CODE_0BB4C4: LDA.W $054E,X                        ;0BB4C4|BD4E05  |0B054E;
                       CMP.B #$40                           ;0BB4C7|C940    |      ;
                       BCC CODE_0BB51D                      ;0BB4C9|9052    |0BB51D;
                       CMP.B #$68                           ;0BB4CB|C968    |      ;
                       BCS CODE_0BB4B9                      ;0BB4CD|B0EA    |0BB4B9;
                       LDA.W $0470,X                        ;0BB4CF|BD7004  |0B0470;
                       AND.B #$02                           ;0BB4D2|2902    |      ;
                       BNE DATA8_0BB529                     ;0BB4D4|D053    |0BB529;
                       LDA.W $05EF,X                        ;0BB4D6|BDEF05  |0B05EF;
                       CMP.B #$2D                           ;0BB4D9|C92D    |      ;
                       BEQ CODE_0BB51E                      ;0BB4DB|F041    |0BB51E;
                       CMP.B #$2E                           ;0BB4DD|C92E    |      ;
                       BEQ CODE_0BB51E                      ;0BB4DF|F03D    |0BB51E;
                       LDA.W $0669,X                        ;0BB4E1|BD6906  |0B0669;
                       STA.B $00                            ;0BB4E4|8500    |000000;
                       AND.B #$F0                           ;0BB4E6|29F0    |      ;
                       BEQ CODE_0BB51D                      ;0BB4E8|F033    |0BB51D;
                       LSR A                                ;0BB4EA|4A      |      ;
                       LSR A                                ;0BB4EB|4A      |      ;
                       LSR A                                ;0BB4EC|4A      |      ;
                       LSR A                                ;0BB4ED|4A      |      ;
                       STA.B $01                            ;0BB4EE|8501    |000001;
                       LDA.W $0669,X                        ;0BB4F0|BD6906  |0B0669;
                       AND.B #$0F                           ;0BB4F3|290F    |      ;
                       STA.W $0669,X                        ;0BB4F5|9D6906  |0B0669;
                       SEC                                  ;0BB4F8|38      |      ;
                       LDA.W $067B,X                        ;0BB4F9|BD7B06  |0B067B;
                       SBC.B $01                            ;0BB4FC|E501    |000001;
                       STA.W $067B,X                        ;0BB4FE|9D7B06  |0B067B;
                       BEQ CODE_0BB53E                      ;0BB501|F03B    |0BB53E;
                       BMI CODE_0BB53E                      ;0BB503|3039    |0BB53E;
                       LDA.B #$29                           ;0BB505|A929    |      ;
                       db $20                               ;0BB507|        |      ;
                       dw initFreezWaterEffect_01           ;0BB508|        |0FE25F;
                       LDY.B #$00                           ;0BB50A|A000    |      ;
                       LDA.W $054E,X                        ;0BB50C|BD4E05  |0B054E;
                       CMP.B #$64                           ;0BB50F|C964    |      ;
                       BNE CODE_0BB514                      ;0BB511|D001    |0BB514;
                       INY                                  ;0BB513|C8      |      ;
 
          CODE_0BB514: LDA.W $0565,X                        ;0BB514|BD6505  |0B0565;
                       ORA.W CODE_0BB527,Y                  ;0BB517|1927B5  |0BB527;
                       STA.W $0565,X                        ;0BB51A|9D6505  |0B0565;
 
          CODE_0BB51D: RTS                                  ;0BB51D|60      |      ;
 
 
          CODE_0BB51E: LDA.B #$28                           ;0BB51E|A928    |      ;
                       db $20                               ;0BB520|        |      ;
                       dw initFreezWaterEffect_01           ;0BB521|        |0FE25F;
                       LDY.B #$00                           ;0BB523|A000    |      ;
                       BEQ CODE_0BB514                      ;0BB525|F0ED    |0BB514;
 
          CODE_0BB527: BPL CODE_0BB53D                      ;0BB527|1014    |0BB53D;
 
         DATA8_0BB529: db $20                               ;0BB529|        |      ;
                       dw CODE_0FE7CC                       ;0BB52A|        |0FE7CC;
                       db $4C                               ;0BB52C|        |      ;
 
                       dw UNREACH_0FFF7A                    ;0BB52D|        |0FFF7A;
 
          CODE_0BB52F: LDA.B #$00                           ;0BB52F|A900    |      ;
                       STA.W $05C1,X                        ;0BB531|9DC105  |0B05C1;
                       STA.W $0400,X                        ;0BB534|9D0004  |0B0400;
                       STA.W $048C,X                        ;0BB537|9D8C04  |0B048C;
                       STA.W $0657,X                        ;0BB53A|9D5706  |0B0657;
 
          CODE_0BB53D: RTS                                  ;0BB53D|60      |      ;
 
 
          CODE_0BB53E: LDA.B #$27                           ;0BB53E|A927    |      ;
                       LDY.W $054E,X                        ;0BB540|BC4E05  |0B054E;
                       CPY.B #$4D                           ;0BB543|C04D    |      ;
                       BEQ DATA8_0BB555                     ;0BB545|F00E    |0BB555;
                       CPY.B #$4E                           ;0BB547|C04E    |      ;
                       BEQ DATA8_0BB555                     ;0BB549|F00A    |0BB555;
                       CPY.B #$5B                           ;0BB54B|C05B    |      ;
                       BEQ DATA8_0BB555                     ;0BB54D|F006    |0BB555;
                       CPY.B #$57                           ;0BB54F|C057    |      ;
                       BEQ DATA8_0BB555                     ;0BB551|F002    |0BB555;
                       LDA.B #$33                           ;0BB553|A933    |      ;
 
         DATA8_0BB555: db $20                               ;0BB555|        |      ;
                       dw initFreezWaterEffect_01           ;0BB556|        |0FE25F;
                       LDA.W $054E,X                        ;0BB558|BD4E05  |0B054E;
                       CMP.B #$5B                           ;0BB55B|C95B    |      ;
                       BEQ CODE_0BB596                      ;0BB55D|F037    |0BB596;
                       CMP.B #$57                           ;0BB55F|C957    |      ;
                       BEQ CODE_0BB5B7                      ;0BB561|F054    |0BB5B7;
                       CMP.B #$59                           ;0BB563|C959    |      ;
                       BEQ DATA8_0BB581                     ;0BB565|F01A    |0BB581;
                       CMP.B #$5D                           ;0BB567|C95D    |      ;
                       BEQ CODE_0BB5BC                      ;0BB569|F051    |0BB5BC;
                       CMP.B #$48                           ;0BB56B|C948    |      ;
                       BCC DATA8_0BB581                     ;0BB56D|9012    |0BB581;
 
         DATA8_0BB56F: db $20                               ;0BB56F|        |      ;
                       dw CODE_0FE7CC                       ;0BB570|        |0FE7CC;
                       LDA.B $9E                            ;0BB572|A59E    |00009E;
                       BEQ CODE_0BB57B                      ;0BB574|F005    |0BB57B;
                       db $20                               ;0BB576|        |      ;
                       dw CODE_0FE7DC                       ;0BB577|        |0FE7DC;
                       BCS CODE_0BB593                      ;0BB579|B018    |0BB593;
 
          CODE_0BB57B: LDA.B r_gameStateLoopCounter         ;0BB57B|A51A    |00001A;
                       AND.B #$07                           ;0BB57D|2907    |      ;
                       BEQ CODE_0BB59C                      ;0BB57F|F01B    |0BB59C;
 
         DATA8_0BB581: db $20                               ;0BB581|        |      ;
                       dw CODE_0FE7C1                       ;0BB582|        |0FE7C1;
 
          CODE_0BB584: LDA.B #$00                           ;0BB584|A900    |      ;
                       STA.W $0657,X                        ;0BB586|9D5706  |0B0657;
                       STA.W $0470,X                        ;0BB589|9D7004  |0B0470;
                       STA.W $05C1,X                        ;0BB58C|9DC105  |0B05C1;
                       STA.W $0400,X                        ;0BB58F|9D0004  |0B0400;
                       RTS                                  ;0BB592|60      |      ;
 
 
          CODE_0BB593: JMP.W CODE_0BA0FC                    ;0BB593|4CFCA0  |0BA0FC;
 
 
          CODE_0BB596: LDA.B #$05                           ;0BB596|A905    |      ;
 
          CODE_0BB598: STA.W $05C1,X                        ;0BB598|9DC105  |0B05C1;
                       RTS                                  ;0BB59B|60      |      ;
 
 
          CODE_0BB59C: INC.B r_subweaponKillCount           ;0BB59C|E6CE    |0000CE;
                       LDA.B r_subweaponKillCount           ;0BB59E|A5CE    |0000CE;
                       CMP.B #$05                           ;0BB5A0|C905    |      ;
                       BCS CODE_0BB5A7                      ;0BB5A2|B003    |0BB5A7;
                       JMP.W CODE_0BB5CE                    ;0BB5A4|4CCEB5  |0BB5CE;
 
 
          CODE_0BB5A7: LDA.B #$00                           ;0BB5A7|A900    |      ;
                       STA.B r_subweaponKillCount           ;0BB5A9|85CE    |0000CE;
                       db $20                               ;0BB5AB|        |      ;
                       dw CODE_0FE7AB                       ;0BB5AC|        |0FE7AB;
                       LDA.W $054E,X                        ;0BB5AE|BD4E05  |0B054E;
                       JSR.W CODE_0BA30B                    ;0BB5B1|200BA3  |0BA30B;
                       JMP.W CODE_0BB5D1                    ;0BB5B4|4CD1B5  |0BB5D1;
 
 
          CODE_0BB5B7: LDA.B #$0F                           ;0BB5B7|A90F    |      ;
                       JMP.W CODE_0BB598                    ;0BB5B9|4C98B5  |0BB598;
 
 
          CODE_0BB5BC: LDA.W $061D,X                        ;0BB5BC|BD1D06  |0B061D;
                       TAX                                  ;0BB5BF|AA      |      ;
                       JSR.W CODE_0BB584                    ;0BB5C0|2084B5  |0BB584;
                       STA.W $054E,X                        ;0BB5C3|9D4E05  |0B054E;
                       STA.W $05EF,X                        ;0BB5C6|9DEF05  |0B05EF;
                       LDX.B r_entityID_processed           ;0BB5C9|A66C    |00006C;
                       JMP.W DATA8_0BB56F                   ;0BB5CB|4C6FB5  |0BB56F;
 
 
          CODE_0BB5CE: JSR.W CODE_0BA278                    ;0BB5CE|2078A2  |0BA278;
 
          CODE_0BB5D1: LDA.W $054E,X                        ;0BB5D1|BD4E05  |0B054E;
                       SEC                                  ;0BB5D4|38      |      ;
                       SBC.B #$60                           ;0BB5D5|E960    |      ;
                       STA.W $05EF,X                        ;0BB5D7|9DEF05  |0B05EF;
                       JMP.W CODE_0BB584                    ;0BB5DA|4C84B5  |0BB584;
 
 
          CODE_0BB5DD: JSR.W CODE_0BB637                    ;0BB5DD|2037B6  |0BB637;
                       BNE CODE_0BB634                      ;0BB5E0|D052    |0BB634;
                       LDA.B #$04                           ;0BB5E2|A904    |      ;
                       STA.B $00                            ;0BB5E4|8500    |000000;
                       LDY.B $9E                            ;0BB5E6|A49E    |00009E;
                       LDA.W $04F2,Y                        ;0BB5E8|B9F204  |0B04F2;
                       BPL CODE_0BB5F1                      ;0BB5EB|1004    |0BB5F1;
                       LDA.B #$FC                           ;0BB5ED|A9FC    |      ;
                       STA.B $00                            ;0BB5EF|8500    |000000;
 
          CODE_0BB5F1: CLC                                  ;0BB5F1|18      |      ;
                       LDA.B $00                            ;0BB5F2|A500    |000000;
                       ADC.W $0438,Y                        ;0BB5F4|793804  |0B0438;
                       STA.B $00                            ;0BB5F7|8500    |000000;
                       LDA.W $041C,Y                        ;0BB5F9|B91C04  |0B041C;
                       STA.B $01                            ;0BB5FC|8501    |000001;
                       JMP.W CODE_0BB613                    ;0BB5FE|4C13B6  |0BB613;
 
 
          CODE_0BB601: JSR.W CODE_0BB637                    ;0BB601|2037B6  |0BB637;
                       BNE CODE_0BB634                      ;0BB604|D02E    |0BB634;
                       CLC                                  ;0BB606|18      |      ;
                       LDA.W $042F                          ;0BB607|AD2F04  |0B042F;
                       ADC.B #$01                           ;0BB60A|6901    |      ;
                       STA.B $01                            ;0BB60C|8501    |000001;
                       LDA.W $0438,X                        ;0BB60E|BD3804  |0B0438;
                       STA.B $00                            ;0BB611|8500    |000000;
 
          CODE_0BB613: LDX.B #$17                           ;0BB613|A217    |      ;
                       LDA.B #$20                           ;0BB615|A920    |      ;
                       STA.W $0470,X                        ;0BB617|9D7004  |0B0470;
                       LDA.B #$12                           ;0BB61A|A912    |      ;
                       STA.W $0400,X                        ;0BB61C|9D0004  |0B0400;
                       LDA.B #$0E                           ;0BB61F|A90E    |      ;
                       STA.W $048C,X                        ;0BB621|9D8C04  |0B048C;
                       LDA.B $00                            ;0BB624|A500    |000000;
                       STA.W $0438,X                        ;0BB626|9D3804  |0B0438;
                       LDA.B $01                            ;0BB629|A501    |000001;
                       STA.W $041C,X                        ;0BB62B|9D1C04  |0B041C;
                       LDA.B #$08                           ;0BB62E|A908    |      ;
                       STA.B r_whipSparkTimer               ;0BB630|858C    |00008C;
                       LDX.B r_entityID_processed           ;0BB632|A66C    |00006C;
 
          CODE_0BB634: RTS                                  ;0BB634|60      |      ;
 
 
          CODE_0BB635: SEC                                  ;0BB635|38      |      ;
                       RTS                                  ;0BB636|60      |      ;
 
 
          CODE_0BB637: LDA.W $054E,X                        ;0BB637|BD4E05  |0B054E;
                       CMP.B #$1B                           ;0BB63A|C91B    |      ;
                       BEQ CODE_0BB649                      ;0BB63C|F00B    |0BB649;
                       CMP.B #$1C                           ;0BB63E|C91C    |      ;
                       BEQ CODE_0BB649                      ;0BB640|F007    |0BB649;
                       LDY.B #$17                           ;0BB642|A017    |      ;
                       LDA.W $0400,Y                        ;0BB644|B90004  |0B0400;
                       BEQ CODE_0BB64B                      ;0BB647|F002    |0BB64B;
 
          CODE_0BB649: LDA.B #$01                           ;0BB649|A901    |      ;
 
          CODE_0BB64B: RTS                                  ;0BB64B|60      |      ;
 
 
          CODE_0BB64C: LDY.W $054E,X                        ;0BB64C|BC4E05  |0B054E;
                       JSR.W CODE_0B80B3                    ;0BB64F|20B380  |0B80B3;
                       STA.B r_tempCurrRoomIdx              ;0BB652|850E    |00000E;
                       LDA.W DATA8_0BBBC8,Y                 ;0BB654|B9C8BB  |0BBBC8;
                       LDY.B r_currPartnerID                ;0BB657|A482    |000082;
                       CLC                                  ;0BB659|18      |      ;
                       ADC.W DATA8_0BBB43,Y                 ;0BB65A|7943BB  |0BBB43;
                       CMP.B r_tempCurrRoomIdx              ;0BB65D|C50E    |00000E;
                       BCC CODE_0BB635                      ;0BB65F|90D4    |0BB635;
                       BCS CODE_0BB66E                      ;0BB661|B00B    |0BB66E;
 
          CODE_0BB663: LDY.W $054E,X                        ;0BB663|BC4E05  |0B054E;
                       JSR.W CODE_0B80B3                    ;0BB666|20B380  |0B80B3;
                       CMP.W DATA8_0BBBC8,Y                 ;0BB669|D9C8BB  |0BBBC8;
                       BCS CODE_0BB68A                      ;0BB66C|B01C    |0BB68A;
 
          CODE_0BB66E: LDY.B r_currPartnerID                ;0BB66E|A482    |000082;
                       LDA.W DATA8_0BB68B,Y                 ;0BB670|B98BB6  |0BB68B;
                       CLC                                  ;0BB673|18      |      ;
                       ADC.W $041C                          ;0BB674|6D1C04  |0B041C;
                       STA.B r_index                        ;0BB677|8510    |000010;
                       LDY.W $054E,X                        ;0BB679|BC4E05  |0B054E;
                       SEC                                  ;0BB67C|38      |      ;
                       LDA.W $041C,X                        ;0BB67D|BD1C04  |0B041C;
                       SBC.W DATA8_0BBC60,Y                 ;0BB680|F960BC  |0BBC60;
                       STA.B r_collisionPointYinScreen      ;0BB683|8511    |000011;
                       JSR.W CODE_0BB739                    ;0BB685|2039B7  |0BB739;
                       CMP.B #$0C                           ;0BB688|C90C    |      ;
 
          CODE_0BB68A: RTS                                  ;0BB68A|60      |      ;
 
 
         DATA8_0BB68B: db $10,$10,$0C,$10,$10,$10,$0C,$10   ;0BB68B|        |      ;
                       db $04,$38                           ;0BB693|        |      ;
                       LDA.W $0400,X                        ;0BB695|BD0004  |0B0400;
                       SBC.B #$08                           ;0BB698|E908    |      ;
                       LSR A                                ;0BB69A|4A      |      ;
                       TAY                                  ;0BB69B|A8      |      ;
                       STA.B r_coreLoadingFuncAddr          ;0BB69C|8516    |000016;
                       JSR.W CODE_0B80B3                    ;0BB69E|20B380  |0B80B3;
                       CMP.W DATA8_0BB6C8,Y                 ;0BB6A1|D9C8B6  |0BB6C8;
                       BCS CODE_0BB6C7                      ;0BB6A4|B021    |0BB6C7;
                       STA.B $17                            ;0BB6A6|8517    |000017;
                       CLC                                  ;0BB6A8|18      |      ;
                       LDY.B r_currPartnerID                ;0BB6A9|A482    |000082;
                       LDA.W DATA8_0BB6DA,Y                 ;0BB6AB|B9DAB6  |0BB6DA;
                       ADC.W $041C                          ;0BB6AE|6D1C04  |0B041C;
                       STA.B r_index                        ;0BB6B1|8510    |000010;
                       SEC                                  ;0BB6B3|38      |      ;
                       LDY.W $054E,X                        ;0BB6B4|BC4E05  |0B054E;
                       LDA.W $041C,X                        ;0BB6B7|BD1C04  |0B041C;
                       SBC.W DATA8_0BBC60,Y                 ;0BB6BA|F960BC  |0BBC60;
                       STA.B r_collisionPointYinScreen      ;0BB6BD|8511    |000011;
                       JSR.W CODE_0BB739                    ;0BB6BF|2039B7  |0BB739;
                       LDY.B r_coreLoadingFuncAddr          ;0BB6C2|A416    |000016;
                       CMP.W DATA8_0BB6D1,Y                 ;0BB6C4|D9D1B6  |0BB6D1;
 
          CODE_0BB6C7: RTS                                  ;0BB6C7|60      |      ;
 
 
         DATA8_0BB6C8: db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A   ;0BB6C8|        |      ;
                       db $0A                               ;0BB6D0|        |      ;
 
         DATA8_0BB6D1: db $04,$04,$04,$04,$04,$04,$04,$04   ;0BB6D1|        |      ;
                       db $04                               ;0BB6D9|        |      ;
 
         DATA8_0BB6DA: db $10,$10,$08,$10,$08,$08,$08,$08   ;0BB6DA|        |      ;
                       db $08,$08,$08,$08                   ;0BB6E2|        |      ;
 
          CODE_0BB6E6: LDA.W $054E,X                        ;0BB6E6|BD4E05  |0B054E;
                       CMP.B #$40                           ;0BB6E9|C940    |      ;
                       BCC CODE_0BB710                      ;0BB6EB|9023    |0BB710;
                       CMP.B #$68                           ;0BB6ED|C968    |      ;
                       BCS CODE_0BB710                      ;0BB6EF|B01F    |0BB710;
                       CMP.B #$59                           ;0BB6F1|C959    |      ;
                       BEQ CODE_0BB711                      ;0BB6F3|F01C    |0BB711;
                       CMP.B #$5D                           ;0BB6F5|C95D    |      ;
                       BEQ CODE_0BB725                      ;0BB6F7|F02C    |0BB725;
                       LDA.W $0470,X                        ;0BB6F9|BD7004  |0B0470;
                       AND.B #$02                           ;0BB6FC|2902    |      ;
                       BNE CODE_0BB710                      ;0BB6FE|D010    |0BB710;
 
          CODE_0BB700: LDA.W $0470,X                        ;0BB700|BD7004  |0B0470;
                       ORA.B #$02                           ;0BB703|0902    |      ;
                       STA.W $0470,X                        ;0BB705|9D7004  |0B0470;
                       LDA.W $0565,X                        ;0BB708|BD6505  |0B0565;
                       AND.B #$3F                           ;0BB70B|293F    |      ;
                       STA.W $0565,X                        ;0BB70D|9D6505  |0B0565;
 
          CODE_0BB710: RTS                                  ;0BB710|60      |      ;
 
 
          CODE_0BB711: LDX.B #$01                           ;0BB711|A201    |      ;
 
          CODE_0BB713: LDA.W $0470,X                        ;0BB713|BD7004  |0B0470;
                       AND.B #$02                           ;0BB716|2902    |      ;
                       BNE CODE_0BB71D                      ;0BB718|D003    |0BB71D;
                       JSR.W CODE_0BB700                    ;0BB71A|2000B7  |0BB700;
 
          CODE_0BB71D: INX                                  ;0BB71D|E8      |      ;
                       CPX.B #$09                           ;0BB71E|E009    |      ;
                       BCC CODE_0BB713                      ;0BB720|90F1    |0BB713;
                       LDX.B r_entityID_processed           ;0BB722|A66C    |00006C;
                       RTS                                  ;0BB724|60      |      ;
 
 
          CODE_0BB725: LDA.W $0470,X                        ;0BB725|BD7004  |0B0470;
                       AND.B #$02                           ;0BB728|2902    |      ;
                       BNE CODE_0BB710                      ;0BB72A|D0E4    |0BB710;
                       JSR.W CODE_0BB700                    ;0BB72C|2000B7  |0BB700;
                       LDA.W $061D,X                        ;0BB72F|BD1D06  |0B061D;
                       TAX                                  ;0BB732|AA      |      ;
                       JSR.W CODE_0BB700                    ;0BB733|2000B7  |0BB700;
                       LDX.B r_entityID_processed           ;0BB736|A66C    |00006C;
                       RTS                                  ;0BB738|60      |      ;
 
 
          CODE_0BB739: SEC                                  ;0BB739|38      |      ;
                       LDA.B r_collisionPointYinScreen      ;0BB73A|A511    |000011;
                       SBC.B r_index                        ;0BB73C|E510    |000010;
                       BCS CODE_0BB744                      ;0BB73E|B004    |0BB744;
 
          CODE_0BB740: EOR.B #$FF                           ;0BB740|49FF    |      ;
                       ADC.B #$01                           ;0BB742|6901    |      ;
 
          CODE_0BB744: RTS                                  ;0BB744|60      |      ;
 
 
          CODE_0BB745: SEC                                  ;0BB745|38      |      ;
                       LDA.B r_index                        ;0BB746|A510    |000010;
                       SBC.W $0438                          ;0BB748|ED3804  |0B0438;
                       BCS CODE_0BB744                      ;0BB74B|B0F7    |0BB744;
                       BCC CODE_0BB740                      ;0BB74D|90F1    |0BB740;
                       SEC                                  ;0BB74F|38      |      ;
                       LDA.B r_index                        ;0BB750|A510    |000010;
                       SBC.W $041C                          ;0BB752|ED1C04  |0B041C;
                       BCS CODE_0BB744                      ;0BB755|B0ED    |0BB744;
                       BCC CODE_0BB740                      ;0BB757|90E7    |0BB740;
 
          CODE_0BB759: LDA.W $054E                          ;0BB759|AD4E05  |0B054E;
                       AND.B #$01                           ;0BB75C|2901    |      ;
                       BNE CODE_0BB762                      ;0BB75E|D002    |0BB762;
                       INC.B $9C                            ;0BB760|E69C    |00009C;
 
          CODE_0BB762: RTS                                  ;0BB762|60      |      ;
 
 
          CODE_0BB763: SEC                                  ;0BB763|38      |      ;
                       LDA.W $0438,X                        ;0BB764|BD3804  |0B0438;
                       SBC.B r_tempCurrGroup                ;0BB767|E50C    |00000C;
                       JSR.W CODE_0B80B6                    ;0BB769|20B680  |0B80B6;
                       CMP.B $02                            ;0BB76C|C502    |000002;
                       BCS CODE_0BB7A5                      ;0BB76E|B035    |0BB7A5;
                       LDY.B #$00                           ;0BB770|A000    |      ;
                       LDA.B r_currPartnerID                ;0BB772|A582    |000082;
                       CMP.B #$04                           ;0BB774|C904    |      ;
                       BCC CODE_0BB779                      ;0BB776|9001    |0BB779;
                       INY                                  ;0BB778|C8      |      ;
 
          CODE_0BB779: LDA.W DATA8_0BB3D2,Y                 ;0BB779|B9D2B3  |0BB3D2;
                       ADC.W $041C                          ;0BB77C|6D1C04  |0B041C;
                       STA.B r_collisionPointYinScreen      ;0BB77F|8511    |000011;
                       SEC                                  ;0BB781|38      |      ;
                       LDA.W $041C,X                        ;0BB782|BD1C04  |0B041C;
                       SBC.B r_tempCurrSection              ;0BB785|E50D    |00000D;
                       JSR.W CODE_0B80C4                    ;0BB787|20C480  |0B80C4;
                       CMP.B $03                            ;0BB78A|C503    |000003;
                       RTS                                  ;0BB78C|60      |      ;
 
 
          CODE_0BB78D: SEC                                  ;0BB78D|38      |      ;
                       LDA.W $0438,X                        ;0BB78E|BD3804  |0B0438;
                       SBC.B r_tempCurrGroup                ;0BB791|E50C    |00000C;
                       JSR.W CODE_0B80CE                    ;0BB793|20CE80  |0B80CE;
                       CMP.B $02                            ;0BB796|C502    |000002;
                       BCS CODE_0BB7A5                      ;0BB798|B00B    |0BB7A5;
                       SEC                                  ;0BB79A|38      |      ;
                       LDA.W $041C,X                        ;0BB79B|BD1C04  |0B041C;
                       SBC.B r_tempCurrSection              ;0BB79E|E50D    |00000D;
                       JSR.W CODE_0B80C4                    ;0BB7A0|20C480  |0B80C4;
                       CMP.B $03                            ;0BB7A3|C503    |000003;
 
          CODE_0BB7A5: RTS                                  ;0BB7A5|60      |      ;
 
 
getCollisionTileValUsingOffsetPresets: TYA                                  ;0BB7A6|98      |      ;
                       ASL A                                ;0BB7A7|0A      |      ;
                       LDY.W $04A8,X                        ;0BB7A8|BCA804  |0B04A8;
                       BEQ CODE_0BB7B0                      ;0BB7AB|F003    |0BB7B0;
                       CLC                                  ;0BB7AD|18      |      ;
                       ADC.B #$01                           ;0BB7AE|6901    |      ;
 
          CODE_0BB7B0: TAY                                  ;0BB7B0|A8      |      ;
                       LDA.W data_17_17bd,Y                 ;0BB7B1|B9BDB7  |0BB7BD;
                       PHA                                  ;0BB7B4|48      |      ;
                       LDA.W DATA8_0BB7E3,Y                 ;0BB7B5|B9E3B7  |0BB7E3;
                       TAY                                  ;0BB7B8|A8      |      ;
                       PLA                                  ;0BB7B9|68      |      ;
                       db $4C                               ;0BB7BA|        |      ;
 
                       dw UNREACH_0FFC1E                    ;0BB7BB|        |0FFC1E;
 
         data_17_17bd: db $08,$F8,$F8,$08,$08,$F8,$08,$F8   ;0BB7BD|        |      ;
                       db $04,$FC,$08,$F8,$04,$FC,$10,$F0   ;0BB7C5|        |      ;
                       db $08,$F8,$0C,$F4,$FC,$04,$EC,$14   ;0BB7CD|        |      ;
                       db $08,$F7,$00,$00,$00,$00,$10,$F0   ;0BB7D5|        |      ;
                       db $18,$E8,$04,$FC,$08,$F8           ;0BB7DD|        |      ;
 
         DATA8_0BB7E3: db $08,$08,$10,$10,$FC,$FC,$08,$08   ;0BB7E3|        |      ;
                       db $F8,$F8,$10,$10,$10,$10,$00,$00   ;0BB7EB|        |      ;
                       db $10,$10,$F8,$F8,$10,$10,$10,$10   ;0BB7F3|        |      ;
                       db $F4,$F4,$10,$10,$08,$08,$FC,$FC   ;0BB7FB|        |      ;
                       db $00,$00,$08,$08,$00,$00           ;0BB803|        |      ;
 
          CODE_0BB809: LDY.B #$00                           ;0BB809|A000    |      ;
 
          CODE_0BB80B: LDA.W CODE_0BB81C,Y                  ;0BB80B|B91CB8  |0BB81C;
                       BMI CODE_0BB818                      ;0BB80E|3008    |0BB818;
                       CMP.W $0565                          ;0BB810|CD6505  |0B0565;
                       BEQ CODE_0BB81A                      ;0BB813|F005    |0BB81A;
                       INY                                  ;0BB815|C8      |      ;
                       BNE CODE_0BB80B                      ;0BB816|D0F3    |0BB80B;
 
          CODE_0BB818: CLC                                  ;0BB818|18      |      ;
                       RTS                                  ;0BB819|60      |      ;
 
 
          CODE_0BB81A: SEC                                  ;0BB81A|38      |      ;
                       RTS                                  ;0BB81B|60      |      ;
 
 
          CODE_0BB81C: ASL.W $1210                          ;0BB81C|0E1012  |0B1210;
                       TRB.B $1E                            ;0BB81F|141E    |00001E;
                       BIT.B r_PPUCtrl                      ;0BB821|24FF    |0000FF;
 
          CODE_0BB823: STA.B $00                            ;0BB823|8500    |000000;
                       STX.B $04                            ;0BB825|8604    |000004;
                       STY.B $05                            ;0BB827|8405    |000005;
                       LDA.B #$00                           ;0BB829|A900    |      ;
                       STA.B $01                            ;0BB82B|8501    |000001;
                       STA.B $02                            ;0BB82D|8502    |000002;
                       LDY.B #$08                           ;0BB82F|A008    |      ;
                       LSR.B $00                            ;0BB831|4600    |000000;
 
          CODE_0BB833: BCC CODE_0BB842                      ;0BB833|900D    |0BB842;
                       CLC                                  ;0BB835|18      |      ;
                       LDA.B $04                            ;0BB836|A504    |000004;
                       ADC.B $01                            ;0BB838|6501    |000001;
                       STA.B $01                            ;0BB83A|8501    |000001;
                       LDA.B $05                            ;0BB83C|A505    |000005;
                       ADC.B $02                            ;0BB83E|6502    |000002;
                       STA.B $02                            ;0BB840|8502    |000002;
 
          CODE_0BB842: ROR.B $02                            ;0BB842|6602    |000002;
                       ROR.B $01                            ;0BB844|6601    |000001;
                       ROR.B $00                            ;0BB846|6600    |000000;
                       DEY                                  ;0BB848|88      |      ;
                       BNE CODE_0BB833                      ;0BB849|D0E8    |0BB833;
                       RTS                                  ;0BB84B|60      |      ;
 
 
          CODE_0BB84C: LDY.B r_currPartnerID                ;0BB84C|A482    |000082;
                       LDA.W DATA8_0BBB43,Y                 ;0BB84E|B943BB  |0BBB43;
                       STA.B $00                            ;0BB851|8500    |000000;
                       LDY.W $054E,X                        ;0BB853|BC4E05  |0B054E;
                       CLC                                  ;0BB856|18      |      ;
                       LDA.W DATA8_0BBBC8,Y                 ;0BB857|B9C8BB  |0BBBC8;
                       ADC.B $00                            ;0BB85A|6500    |000000;
                       STA.B $02                            ;0BB85C|8502    |000002;
                       JSR.W CODE_0B80B3                    ;0BB85E|20B380  |0B80B3;
                       CMP.B $02                            ;0BB861|C502    |000002;
                       BCS CODE_0BB887                      ;0BB863|B022    |0BB887;
                       LDY.B r_currPartnerID                ;0BB865|A482    |000082;
                       LDA.W $041C                          ;0BB867|AD1C04  |0B041C;
                       SEC                                  ;0BB86A|38      |      ;
                       SBC.W DATA8_0BB9BB,Y                 ;0BB86B|F9BBB9  |0BB9BB;
                       STA.B $03                            ;0BB86E|8503    |000003;
                       LDY.W $054E,X                        ;0BB870|BC4E05  |0B054E;
                       CLC                                  ;0BB873|18      |      ;
                       LDA.W DATA8_0BBC60,Y                 ;0BB874|B960BC  |0BBC60;
                       ADC.B #$03                           ;0BB877|6903    |      ;
                       STA.B $02                            ;0BB879|8502    |000002;
                       SEC                                  ;0BB87B|38      |      ;
                       LDA.B $03                            ;0BB87C|A503    |000003;
                       SBC.W $041C,X                        ;0BB87E|FD1C04  |0B041C;
                       BCS CODE_0BB885                      ;0BB881|B002    |0BB885;
                       EOR.B #$FF                           ;0BB883|49FF    |      ;
 
          CODE_0BB885: CMP.B $02                            ;0BB885|C502    |000002;
 
          CODE_0BB887: RTS                                  ;0BB887|60      |      ;
 
 
          CODE_0BB888: LDY.B r_currPartnerID                ;0BB888|A482    |000082;
                       LDA.W DATA8_0BB9B2,Y                 ;0BB88A|B9B2B9  |0BB9B2;
                       CLC                                  ;0BB88D|18      |      ;
                       ADC.W $041C                          ;0BB88E|6D1C04  |0B041C;
                       STA.B $00                            ;0BB891|8500    |000000;
                       LDY.B #$00                           ;0BB893|A000    |      ;
                       LDA.W $0438                          ;0BB895|AD3804  |0B0438;
                       SEC                                  ;0BB898|38      |      ;
                       SBC.W $0438,X                        ;0BB899|FD3804  |0B0438;
                       BCS CODE_0BB8A4                      ;0BB89C|B006    |0BB8A4;
                       INY                                  ;0BB89E|C8      |      ;
                       EOR.B #$FF                           ;0BB89F|49FF    |      ;
                       CLC                                  ;0BB8A1|18      |      ;
                       ADC.B #$01                           ;0BB8A2|6901    |      ;
 
          CODE_0BB8A4: CMP.B #$08                           ;0BB8A4|C908    |      ;
                       BCS CODE_0BB8DD                      ;0BB8A6|B035    |0BB8DD;
                       STY.B $01                            ;0BB8A8|8401    |000001;
                       LDY.B #$00                           ;0BB8AA|A000    |      ;
                       LDA.B $00                            ;0BB8AC|A500    |000000;
                       SEC                                  ;0BB8AE|38      |      ;
                       SBC.W $041C,X                        ;0BB8AF|FD1C04  |0B041C;
                       BCS CODE_0BB8BA                      ;0BB8B2|B006    |0BB8BA;
                       INY                                  ;0BB8B4|C8      |      ;
                       EOR.B #$FF                           ;0BB8B5|49FF    |      ;
                       CLC                                  ;0BB8B7|18      |      ;
                       ADC.B #$01                           ;0BB8B8|6901    |      ;
 
          CODE_0BB8BA: CMP.B #$08                           ;0BB8BA|C908    |      ;
                       BCS CODE_0BB8DD                      ;0BB8BC|B01F    |0BB8DD;
                       STY.B $02                            ;0BB8BE|8402    |000002;
                       STX.B r_CogID                        ;0BB8C0|8694    |000094;
                       LDA.W $0565,X                        ;0BB8C2|BD6505  |0B0565;
                       BMI CODE_0BB8DE                      ;0BB8C5|3017    |0BB8DE;
                       CMP.B #$20                           ;0BB8C7|C920    |      ;
                       BCS CODE_0BB8D1                      ;0BB8C9|B006    |0BB8D1;
                       LDA.B $01                            ;0BB8CB|A501    |000001;
                       BEQ CODE_0BB8D9                      ;0BB8CD|F00A    |0BB8D9;
                       BNE CODE_0BB8D5                      ;0BB8CF|D004    |0BB8D5;
 
          CODE_0BB8D1: LDA.B $02                            ;0BB8D1|A502    |000002;
                       BEQ CODE_0BB8D9                      ;0BB8D3|F004    |0BB8D9;
 
          CODE_0BB8D5: LDA.B #$01                           ;0BB8D5|A901    |      ;
                       BNE CODE_0BB8DB                      ;0BB8D7|D002    |0BB8DB;
 
          CODE_0BB8D9: LDA.B #$02                           ;0BB8D9|A902    |      ;
 
          CODE_0BB8DB: STA.B r_CogProximity                 ;0BB8DB|8593    |000093;
 
          CODE_0BB8DD: RTS                                  ;0BB8DD|60      |      ;
 
 
          CODE_0BB8DE: CMP.B #$E0                           ;0BB8DE|C9E0    |      ;
                       BCC CODE_0BB8E8                      ;0BB8E0|9006    |0BB8E8;
                       LDA.B $01                            ;0BB8E2|A501    |000001;
                       BNE CODE_0BB8D9                      ;0BB8E4|D0F3    |0BB8D9;
                       BEQ CODE_0BB8D5                      ;0BB8E6|F0ED    |0BB8D5;
 
          CODE_0BB8E8: LDA.B $02                            ;0BB8E8|A502    |000002;
                       BEQ CODE_0BB8D9                      ;0BB8EA|F0ED    |0BB8D9;
                       BNE CODE_0BB8D5                      ;0BB8EC|D0E7    |0BB8D5;
 
          CODE_0BB8EE: LDA.B r_delayElevators               ;0BB8EE|A5AF    |0000AF;
                       BEQ CODE_0BB8F6                      ;0BB8F0|F004    |0BB8F6;
                       CPX.B r_CogwheelIDbackup             ;0BB8F2|E4D2    |0000D2;
                       BEQ CODE_0BB8DD                      ;0BB8F4|F0E7    |0BB8DD;
 
          CODE_0BB8F6: LDA.B r_damagePlayer                 ;0BB8F6|A581    |000081;
                       CMP.B #$06                           ;0BB8F8|C906    |      ;
                       BEQ CODE_0BB8DD                      ;0BB8FA|F0E1    |0BB8DD;
                       LDY.B r_currPartnerID                ;0BB8FC|A482    |000082;
                       LDA.W DATA8_0BB9B2,Y                 ;0BB8FE|B9B2B9  |0BB9B2;
                       CLC                                  ;0BB901|18      |      ;
                       ADC.W $041C                          ;0BB902|6D1C04  |0B041C;
                       STA.B $00                            ;0BB905|8500    |000000;
                       LDA.W $0606,X                        ;0BB907|BD0606  |0B0606;
                       BEQ CODE_0BB95A                      ;0BB90A|F04E    |0BB95A;
                       LDY.B #$00                           ;0BB90C|A000    |      ;
                       LDA.W $0438                          ;0BB90E|AD3804  |0B0438;
                       SEC                                  ;0BB911|38      |      ;
                       SBC.W $0438,X                        ;0BB912|FD3804  |0B0438;
                       BCS CODE_0BB91E                      ;0BB915|B007    |0BB91E;
                       LDY.B #$80                           ;0BB917|A080    |      ;
                       EOR.B #$FF                           ;0BB919|49FF    |      ;
                       CLC                                  ;0BB91B|18      |      ;
                       ADC.B #$01                           ;0BB91C|6901    |      ;
 
          CODE_0BB91E: SEC                                  ;0BB91E|38      |      ;
                       SBC.B #$05                           ;0BB91F|E905    |      ;
                       BCS CODE_0BB925                      ;0BB921|B002    |0BB925;
                       LDA.B #$00                           ;0BB923|A900    |      ;
 
          CODE_0BB925: CMP.B #$40                           ;0BB925|C940    |      ;
                       BCS CODE_0BB8DD                      ;0BB927|B0B4    |0BB8DD;
                       STA.B r_knockBackDirrection          ;0BB929|8590    |000090;
                       TYA                                  ;0BB92B|98      |      ;
                       ORA.B r_knockBackDirrection          ;0BB92C|0590    |000090;
                       STA.B r_knockBackDirrection          ;0BB92E|8590    |000090;
                       AND.B #$7F                           ;0BB930|297F    |      ;
                       TAY                                  ;0BB932|A8      |      ;
                       LDA.W $041C,X                        ;0BB933|BD1C04  |0B041C;
                       SEC                                  ;0BB936|38      |      ;
                       SBC.W DATA8_0BBA7E,Y                 ;0BB937|F97EBA  |0BBA7E;
                       SEC                                  ;0BB93A|38      |      ;
                       SBC.B $00                            ;0BB93B|E500    |000000;
                       BCS CODE_0BB945                      ;0BB93D|B006    |0BB945;
                       CMP.B #$FB                           ;0BB93F|C9FB    |      ;
                       BCC CODE_0BB9AB                      ;0BB941|9068    |0BB9AB;
                       BCS CODE_0BB94D                      ;0BB943|B008    |0BB94D;
 
          CODE_0BB945: CPY.B #$3A                           ;0BB945|C03A    |      ;
                       BCS CODE_0BB954                      ;0BB947|B00B    |0BB954;
                       CMP.B #$04                           ;0BB949|C904    |      ;
                       BCS CODE_0BB9AB                      ;0BB94B|B05E    |0BB9AB;
 
          CODE_0BB94D: STA.B r_ConveyorRelated              ;0BB94D|8591    |000091;
                       LDA.B #$01                           ;0BB94F|A901    |      ;
                       JMP.W CODE_0BB99F                    ;0BB951|4C9FB9  |0BB99F;
 
 
          CODE_0BB954: CMP.B #$10                           ;0BB954|C910    |      ;
                       BCS CODE_0BB9AB                      ;0BB956|B053    |0BB9AB;
                       BCC CODE_0BB94D                      ;0BB958|90F3    |0BB94D;
 
          CODE_0BB95A: LDY.B #$00                           ;0BB95A|A000    |      ;
                       LDA.W $0438                          ;0BB95C|AD3804  |0B0438;
                       SEC                                  ;0BB95F|38      |      ;
                       SBC.W $0438,X                        ;0BB960|FD3804  |0B0438;
                       BCS CODE_0BB96C                      ;0BB963|B007    |0BB96C;
                       LDY.B #$80                           ;0BB965|A080    |      ;
                       EOR.B #$FF                           ;0BB967|49FF    |      ;
                       CLC                                  ;0BB969|18      |      ;
                       ADC.B #$01                           ;0BB96A|6901    |      ;
 
          CODE_0BB96C: SEC                                  ;0BB96C|38      |      ;
                       SBC.B #$05                           ;0BB96D|E905    |      ;
                       BCS CODE_0BB973                      ;0BB96F|B002    |0BB973;
                       LDA.B #$00                           ;0BB971|A900    |      ;
 
          CODE_0BB973: CMP.B #$20                           ;0BB973|C920    |      ;
                       BCS CODE_0BB9AB                      ;0BB975|B034    |0BB9AB;
                       STA.B r_knockBackDirrection          ;0BB977|8590    |000090;
                       TYA                                  ;0BB979|98      |      ;
                       ORA.B r_knockBackDirrection          ;0BB97A|0590    |000090;
                       STA.B r_knockBackDirrection          ;0BB97C|8590    |000090;
                       AND.B #$7F                           ;0BB97E|297F    |      ;
                       TAY                                  ;0BB980|A8      |      ;
                       LDA.W $041C,X                        ;0BB981|BD1C04  |0B041C;
                       SEC                                  ;0BB984|38      |      ;
                       SBC.W DATA8_0BBABF,Y                 ;0BB985|F9BFBA  |0BBABF;
                       SEC                                  ;0BB988|38      |      ;
                       SBC.B $00                            ;0BB989|E500    |000000;
                       BCS CODE_0BB993                      ;0BB98B|B006    |0BB993;
                       CMP.B #$FB                           ;0BB98D|C9FB    |      ;
                       BCC CODE_0BB9AB                      ;0BB98F|901A    |0BB9AB;
                       BCS CODE_0BB99B                      ;0BB991|B008    |0BB99B;
 
          CODE_0BB993: CPY.B #$1F                           ;0BB993|C01F    |      ;
                       BCS CODE_0BB9AC                      ;0BB995|B015    |0BB9AC;
                       CMP.B #$04                           ;0BB997|C904    |      ;
                       BCS CODE_0BB9AB                      ;0BB999|B010    |0BB9AB;
 
          CODE_0BB99B: STA.B r_ConveyorRelated              ;0BB99B|8591    |000091;
                       LDA.B #$00                           ;0BB99D|A900    |      ;
 
          CODE_0BB99F: STA.B r_CogSize                      ;0BB99F|8595    |000095;
                       STX.B r_CogwheelID                   ;0BB9A1|86D4    |0000D4;
                       LDA.B #$06                           ;0BB9A3|A906    |      ;
                       STA.B r_damagePlayer                 ;0BB9A5|8581    |000081;
                       LDA.B #$00                           ;0BB9A7|A900    |      ;
                       STA.B r_delayElevators               ;0BB9A9|85AF    |0000AF;
 
          CODE_0BB9AB: RTS                                  ;0BB9AB|60      |      ;
 
 
          CODE_0BB9AC: CMP.B #$10                           ;0BB9AC|C910    |      ;
                       BCS CODE_0BB9AB                      ;0BB9AE|B0FB    |0BB9AB;
                       BCC CODE_0BB99B                      ;0BB9B0|90E9    |0BB99B;
 
         DATA8_0BB9B2: db $10,$10,$0C,$10,$10,$10,$0C,$10   ;0BB9B2|        |      ;
                       db $08                               ;0BB9BA|        |      ;
 
         DATA8_0BB9BB: db $08,$08,$04,$08,$02,$02,$00,$02   ;0BB9BB|        |      ;
                       db $04                               ;0BB9C3|        |      ;
 
          CODE_0BB9C4: INY                                  ;0BB9C4|C8      |      ;
                       STY.B r_roomSectionChrBanksDataOffset;0BB9C5|840F    |00000F;
                       LDA.W $0565,X                        ;0BB9C7|BD6505  |0B0565;
                       SEC                                  ;0BB9CA|38      |      ;
                       SBC.B #$40                           ;0BB9CB|E940    |      ;
                       JMP.W CODE_0BB9E7                    ;0BB9CD|4CE7B9  |0BB9E7;
 
 
          CODE_0BB9D0: LDA.W $0606,X                        ;0BB9D0|BD0606  |0B0606;
                       BEQ CODE_0BB9D6                      ;0BB9D3|F001    |0BB9D6;
 
          CODE_0BB9D5: RTS                                  ;0BB9D5|60      |      ;
 
 
          CODE_0BB9D6: LDY.B #$00                           ;0BB9D6|A000    |      ;
                       LDA.W $0565,X                        ;0BB9D8|BD6505  |0B0565;
                       CMP.B #$40                           ;0BB9DB|C940    |      ;
                       BCS CODE_0BB9C4                      ;0BB9DD|B0E5    |0BB9C4;
                       STY.B r_roomSectionChrBanksDataOffset;0BB9DF|840F    |00000F;
                       LDA.B #$40                           ;0BB9E1|A940    |      ;
                       SEC                                  ;0BB9E3|38      |      ;
                       SBC.W $0565,X                        ;0BB9E4|FD6505  |0B0565;
 
          CODE_0BB9E7: STA.B $07                            ;0BB9E7|8507    |000007;
                       TAY                                  ;0BB9E9|A8      |      ;
                       LDA.W $0438,X                        ;0BB9EA|BD3804  |0B0438;
                       SEC                                  ;0BB9ED|38      |      ;
                       SBC.W DATA8_0BBAE0,Y                 ;0BB9EE|F9E0BA  |0BBAE0;
                       STA.B $09                            ;0BB9F1|8509    |000009;
                       LDX.B #$00                           ;0BB9F3|A200    |      ;
                       LDA.B $09                            ;0BB9F5|A509    |000009;
                       SEC                                  ;0BB9F7|38      |      ;
                       SBC.W $0438                          ;0BB9F8|ED3804  |0B0438;
                       BCS CODE_0BBA03                      ;0BB9FB|B006    |0BBA03;
                       INX                                  ;0BB9FD|E8      |      ;
                       EOR.B #$FF                           ;0BB9FE|49FF    |      ;
                       CLC                                  ;0BBA00|18      |      ;
                       ADC.B #$01                           ;0BBA01|6901    |      ;
 
          CODE_0BBA03: CMP.W DATA8_0BBB22,Y                 ;0BBA03|D922BB  |0BBB22;
                       BCS CODE_0BB9D5                      ;0BBA06|B0CD    |0BB9D5;
                       STA.B r_temp_Xpos                    ;0BBA08|850A    |00000A;
                       STX.B $0B                            ;0BBA0A|860B    |00000B;
                       LDX.B r_entityID_processed           ;0BBA0C|A66C    |00006C;
                       LDA.W $041C,X                        ;0BBA0E|BD1C04  |0B041C;
                       LDX.B r_roomSectionChrBanksDataOffset;0BBA11|A60F    |00000F;
                       BEQ CODE_0BBA1B                      ;0BBA13|F006    |0BBA1B;
                       SEC                                  ;0BBA15|38      |      ;
                       SBC.W DATA8_0BBB01,Y                 ;0BBA16|F901BB  |0BBB01;
                       BNE CODE_0BBA1F                      ;0BBA19|D004    |0BBA1F;
 
          CODE_0BBA1B: CLC                                  ;0BBA1B|18      |      ;
                       ADC.W DATA8_0BBB01,Y                 ;0BBA1C|7901BB  |0BBB01;
 
          CODE_0BBA1F: SEC                                  ;0BBA1F|38      |      ;
                       SBC.B #$10                           ;0BBA20|E910    |      ;
                       STA.B r_tempCurrGroup                ;0BBA22|850C    |00000C;
                       LDY.B $07                            ;0BBA24|A407    |000007;
                       LDA.W DATA8_0FFDC2,Y                 ;0BBA26|B9C2FD  |0FFDC2;
                       TAX                                  ;0BBA29|AA      |      ;
                       LDY.B #$00                           ;0BBA2A|A000    |      ;
                       LDA.B r_temp_Xpos                    ;0BBA2C|A50A    |00000A;
                       JSR.W CODE_0BB823                    ;0BBA2E|2023B8  |0BB823;
                       LDX.B r_entityID_processed           ;0BBA31|A66C    |00006C;
                       LDA.B r_roomSectionChrBanksDataOffset;0BBA33|A50F    |00000F;
                       BEQ CODE_0BBA3D                      ;0BBA35|F006    |0BBA3D;
                       LDA.B $0B                            ;0BBA37|A50B    |00000B;
                       BEQ CODE_0BBA41                      ;0BBA39|F006    |0BBA41;
                       BNE CODE_0BBA48                      ;0BBA3B|D00B    |0BBA48;
 
          CODE_0BBA3D: LDA.B $0B                            ;0BBA3D|A50B    |00000B;
                       BEQ CODE_0BBA48                      ;0BBA3F|F007    |0BBA48;
 
          CODE_0BBA41: LDA.B r_tempCurrGroup                ;0BBA41|A50C    |00000C;
                       SEC                                  ;0BBA43|38      |      ;
                       SBC.B $01                            ;0BBA44|E501    |000001;
                       BNE CODE_0BBA4D                      ;0BBA46|D005    |0BBA4D;
 
          CODE_0BBA48: LDA.B r_tempCurrGroup                ;0BBA48|A50C    |00000C;
                       CLC                                  ;0BBA4A|18      |      ;
                       ADC.B $01                            ;0BBA4B|6501    |000001;
 
          CODE_0BBA4D: STA.B r_tempCurrGroup                ;0BBA4D|850C    |00000C;
                       SEC                                  ;0BBA4F|38      |      ;
                       SBC.W $041C                          ;0BBA50|ED1C04  |0B041C;
                       BCS CODE_0BBA5B                      ;0BBA53|B006    |0BBA5B;
                       CMP.B #$F8                           ;0BBA55|C9F8    |      ;
                       BCC CODE_0BBA7D                      ;0BBA57|9024    |0BBA7D;
                       BCS CODE_0BBA5F                      ;0BBA59|B004    |0BBA5F;
 
          CODE_0BBA5B: CMP.B #$08                           ;0BBA5B|C908    |      ;
                       BCS CODE_0BBA7D                      ;0BBA5D|B01E    |0BBA7D;
 
          CODE_0BBA5F: STA.B r_ConveyorRelated              ;0BBA5F|8591    |000091;
                       LDA.B $07                            ;0BBA61|A507    |000007;
                       LDY.W $0565,X                        ;0BBA63|BC6505  |0B0565;
                       CPY.B #$40                           ;0BBA66|C040    |      ;
                       BCC CODE_0BBA6C                      ;0BBA68|9002    |0BBA6C;
                       ORA.B #$80                           ;0BBA6A|0980    |      ;
 
          CODE_0BBA6C: STA.B r_knockBackDirrection          ;0BBA6C|8590    |000090;
                       LDA.B #$01                           ;0BBA6E|A901    |      ;
                       LDY.B $0B                            ;0BBA70|A40B    |00000B;
                       BNE CODE_0BBA76                      ;0BBA72|D002    |0BBA76;
                       LDA.B #$08                           ;0BBA74|A908    |      ;
 
          CODE_0BBA76: STA.W $0645,X                        ;0BBA76|9D4506  |0B0645;
                       LDA.B #$05                           ;0BBA79|A905    |      ;
                       STA.B r_damagePlayer                 ;0BBA7B|8581    |000081;
 
          CODE_0BBA7D: RTS                                  ;0BBA7D|60      |      ;
 
 
         DATA8_0BBA7E: db $40,$40,$40,$40,$40,$40,$40,$40   ;0BBA7E|        |      ;
 
                       db $3F,$3F,$3F,$3F,$3F,$3F,$3E,$3E   ;0BBA86|        |      ;
                       db $3E,$3E,$3D,$3D,$3D,$3C,$3C,$3C   ;0BBA8E|        |      ;
                       db $3B,$3B,$3A,$3A,$3A,$39,$39,$38   ;0BBA96|        |      ;
                       db $37,$37,$36,$36,$35,$34,$33,$33   ;0BBA9E|        |      ;
                       db $32,$31,$30,$2F,$2E,$2E,$2C,$2B   ;0BBAA6|        |      ;
                       db $2A,$29,$28,$27,$25,$24,$22,$21   ;0BBAAE|        |      ;
                       db $1F,$1D,$1B,$19,$16,$13,$10,$0B   ;0BBAB6|        |      ;
                       db $00                               ;0BBABE|        |      ;
 
         DATA8_0BBABF: db $20,$20,$20,$20,$20,$20,$1F,$1F   ;0BBABF|        |      ;
                       db $1F,$1F,$1E,$1E,$1E,$1D,$1D,$1C   ;0BBAC7|        |      ;
                       db $1C,$1B,$1A,$1A,$19,$18,$17,$16   ;0BBACF|        |      ;
                       db $15,$14,$13,$11,$0F,$0E,$0B,$08   ;0BBAD7|        |      ;
                       db $00                               ;0BBADF|        |      ;
 
         DATA8_0BBAE0: db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBAE0|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$07   ;0BBAE8|        |      ;
                       db $07,$07,$07,$07,$07,$07,$07,$07   ;0BBAF0|        |      ;
                       db $07,$07,$06,$06,$06,$06,$06,$06   ;0BBAF8|        |      ;
                       db $06                               ;0BBB00|        |      ;
 
         DATA8_0BBB01: db $00,$00,$00,$01,$01,$01,$01,$01   ;0BBB01|        |      ;
                       db $02,$02,$02,$02,$02,$03,$03,$03   ;0BBB09|        |      ;
                       db $03,$03,$03,$04,$04,$04,$04,$04   ;0BBB11|        |      ;
                       db $04,$05,$05,$05,$05,$05,$05,$06   ;0BBB19|        |      ;
                       db $06                               ;0BBB21|        |      ;
 
         DATA8_0BBB22: db $3C,$3C,$3C,$3C,$3C,$3C,$3B,$3B   ;0BBB22|        |      ;
                       db $3B,$3B,$3A,$3A,$39,$39,$38,$38   ;0BBB2A|        |      ;
                       db $37,$37,$36,$36,$35,$34,$33,$33   ;0BBB32|        |      ;
                       db $32,$31,$30,$2F,$2E,$2D,$2C,$2B   ;0BBB3A|        |      ;
                       db $2A                               ;0BBB42|        |      ;
 
         DATA8_0BBB43: db $06,$06,$06,$06,$06,$06,$06,$06   ;0BBB43|        |      ;
                       db $06                               ;0BBB4B|        |      ;
 
         DATA8_0BBB4C: db $0C,$0C,$0A,$0C,$08,$08,$06,$08   ;0BBB4C|        |      ;
                       db $05                               ;0BBB54|        |      ;
 
         DATA8_0BBB55: db $14,$14,$1E,$0E,$0E               ;0BBB55|        |      ;
 
         DATA8_0BBB5A: db $03,$03,$03,$08,$03               ;0BBB5A|        |      ;
 
         DATA8_0BBB5F: db $14,$EC,$14,$EC,$1C,$E4,$10,$F0   ;0BBB5F|        |      ;
                       db $0C,$F4                           ;0BBB67|        |      ;
 
         DATA8_0BBB69: db $FE,$FC,$FC,$00,$FE,$FC,$FC,$00   ;0BBB69|        |      ;
                       db $00                               ;0BBB71|        |      ;
 
         DATA8_0BBB72: db $1A,$0C,$0C,$10,$10,$12,$12,$16   ;0BBB72|        |      ;
                       db $12                               ;0BBB7A|        |      ;
 
         DATA8_0BBB7B: db $03,$05,$03,$03,$03,$03,$03,$03   ;0BBB7B|        |      ;
                       db $03                               ;0BBB83|        |      ;
 
         DATA8_0BBB84: db $18,$E8,$10,$F0,$0C,$F4,$10,$F0   ;0BBB84|        |      ;
                       db $14,$EC,$14,$EC,$08,$F8,$0C,$F4   ;0BBB8C|        |      ;
                       db $0C,$F4                           ;0BBB94|        |      ;
 
         DATA8_0BBB96: db $00,$00,$00,$00,$FC,$FC,$FC,$FC   ;0BBB96|        |      ;
                       db $FC,$FC,$FC,$FC,$00,$00,$00,$00   ;0BBB9E|        |      ;
                       db $FC,$FC                           ;0BBBA6|        |      ;
 
         DATA8_0BBBA8: db $00,$06,$07,$06,$0C,$1C,$06,$06   ;0BBBA8|        |      ;
                       db $06,$06,$03                       ;0BBBB0|        |      ;
 
         DATA8_0BBBB3: db $00,$06,$07,$03,$0C,$04,$06,$06   ;0BBBB3|        |      ;
                       db $03,$06,$04                       ;0BBBBB|        |      ;
 
         DATA8_0BBBBE: db $00,$04,$0F,$0F,$16,$16,$12,$12   ;0BBBBE|        |      ;
                       db $0A,$0A                           ;0BBBC6|        |      ;
 
         DATA8_0BBBC8: db $08,$08,$0A,$08,$08,$10,$08,$0D   ;0BBBC8|        |      ;
                       db $0C,$18,$10,$06,$0C,$08,$08,$08   ;0BBBD0|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBBD8|        |      ;
                       db $08,$08,$08,$10,$08,$08,$08,$0C   ;0BBBE0|        |      ;
                       db $08,$08,$10,$06,$08,$08,$08,$08   ;0BBBE8|        |      ;
                       db $08,$08,$10,$08,$03,$05,$08,$08   ;0BBBF0|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBBF8|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBC00|        |      ;
                       db $03,$04,$02,$06,$04,$04,$03,$08   ;0BBC08|        |      ;
                       db $08,$08,$08,$05,$08,$08,$08,$08   ;0BBC10|        |      ;
                       db $06,$08,$0C,$06,$08,$08,$08,$08   ;0BBC18|        |      ;
                       db $08,$08,$08,$08,$08,$08,$06,$08   ;0BBC20|        |      ;
                       db $08,$08,$08,$08,$06,$08,$08,$0C   ;0BBC28|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBC30|        |      ;
                       db $08,$30,$10,$20,$80,$10,$20,$08   ;0BBC38|        |      ;
                       db $08,$08,$08,$08,$08,$11,$0C,$10   ;0BBC40|        |      ;
                       db $08,$08,$0C,$08,$0E,$08,$10,$10   ;0BBC48|        |      ;
                       db $10,$08,$10,$08,$08,$08,$08,$08   ;0BBC50|        |      ;
                       db $04,$06,$04,$02,$02,$02,$02,$02   ;0BBC58|        |      ;
 
         DATA8_0BBC60: db $0E,$10,$10,$10,$10,$10,$08,$20   ;0BBC60|        |      ;
                       db $0C,$18,$10,$0C,$14,$08,$14,$0E   ;0BBC68|        |      ;
                       db $0E,$08,$0E,$0E,$04,$0E,$0E,$0E   ;0BBC70|        |      ;
                       db $0E,$0E,$0E,$09,$0E,$0A,$14,$0E   ;0BBC78|        |      ;
                       db $06,$04,$02,$06,$08,$0E,$02,$04   ;0BBC80|        |      ;
                       db $0E,$0E,$08,$08,$03,$05,$0E,$0E   ;0BBC88|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBC90|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;0BBC98|        |      ;
                       db $04,$08,$04,$06,$02,$06,$06,$0E   ;0BBCA0|        |      ;
                       db $0E,$0E,$06,$05,$08,$0E,$0E,$0E   ;0BBCA8|        |      ;
                       db $0E,$0E,$08,$04,$0E,$0E,$0E,$0E   ;0BBCB0|        |      ;
                       db $0E,$06,$0E,$0E,$0E,$0E,$06,$0E   ;0BBCB8|        |      ;
                       db $0E,$0E,$0E,$0E,$06,$0E,$0E,$0E   ;0BBCC0|        |      ;
                       db $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E   ;0BBCC8|        |      ;
                       db $0E,$20,$28,$10,$10,$10,$28,$0E   ;0BBCD0|        |      ;
                       db $0E,$05,$05,$0E,$0E,$04,$08,$08   ;0BBCD8|        |      ;
                       db $0E,$0E,$04,$04,$08,$0E,$08,$08   ;0BBCE0|        |      ;
                       db $08,$0E,$08,$0E,$0E,$0E,$0E,$0E   ;0BBCE8|        |      ;
                       db $07,$0C,$07,$04,$04,$04,$04,$04   ;0BBCF0|        |      ;
 
          CODE_0BBCF8: RTS                                  ;0BBCF8|60      |      ;
 
                       LDA.B r_stopWatchActive              ;0BBCF9|A5AB    |0000AB;
                       BEQ CODE_0BBD02                      ;0BBCFB|F005    |0BBD02;
                       db $20                               ;0BBCFD|        |      ;
                       dw stopWatchMain                     ;0BBCFE|        |0FE7B6;
                       BCS CODE_0BBCF8                      ;0BBD00|B0F6    |0BBCF8;
 
          CODE_0BBD02: LDA.W r_entity_AI_idx,X              ;0BBD02|BDEF05  |0005EF;
                       BEQ CODE_0BBCF8                      ;0BBD05|F0F1    |0BBCF8;
                       CMP.B #$27                           ;0BBD07|C927    |      ;
                       BNE CODE_0BBD10                      ;0BBD09|D005    |0BBD10;
                       JSR.W CODE_0B8131                    ;0BBD0B|203181  |0B8131;
                       BEQ CODE_0BBCF8                      ;0BBD0E|F0E8    |0BBCF8;
 
          CODE_0BBD10: ASL A                                ;0BBD10|0A      |      ;
                       TAY                                  ;0BBD11|A8      |      ;
                       LDA.W enemyScriptTable,Y             ;0BBD12|B9A1BE  |0BBEA1;
                       STA.B $02                            ;0BBD15|8502    |000002;
                       LDA.W enemyScriptTableHi,Y           ;0BBD17|B9A2BE  |0BBEA2;
                       STA.B $03                            ;0BBD1A|8503    |000003;
                       LDA.W r_entity_script_idx,X          ;0BBD1C|BDC105  |0005C1;
                       ASL A                                ;0BBD1F|0A      |      ;
                       ASL A                                ;0BBD20|0A      |      ;
                       CLC                                  ;0BBD21|18      |      ;
                       ADC.B $02                            ;0BBD22|6502    |000002;
                       STA.B $02                            ;0BBD24|8502    |000002;
                       LDA.B $03                            ;0BBD26|A503    |000003;
                       ADC.B #$00                           ;0BBD28|6900    |      ;
                       STA.B $03                            ;0BBD2A|8503    |000003;
                       LDY.B #$00                           ;0BBD2C|A000    |      ;
                       LDA.B ($02),Y                        ;0BBD2E|B102    |000002;
                       ASL A                                ;0BBD30|0A      |      ;
                       BCS secondID_jumptable               ;0BBD31|B00E    |0BBD41;
                       TAY                                  ;0BBD33|A8      |      ;
                       LDA.W enemyIDTable00,Y               ;0BBD34|B94FBD  |0BBD4F;
                       STA.B $00                            ;0BBD37|8500    |000000;
                       LDA.W enemyIDTableHi01,Y             ;0BBD39|B950BD  |0BBD50;
                       STA.B $01                            ;0BBD3C|8501    |000001;
                       JMP.W ($0000)                        ;0BBD3E|6C0000  |000000;
 
 
   secondID_jumptable: TAY                                  ;0BBD41|A8      |      ;
                       LDA.W enemyIDTable01,Y               ;0BBD42|B94FBE  |0BBE4F;
                       STA.B $00                            ;0BBD45|8500    |000000;
                       LDA.W enemyIDTable01Hi,Y             ;0BBD47|B950BE  |0BBE50;
                       STA.B $01                            ;0BBD4A|8501    |000001;
                       JMP.W ($0000)                        ;0BBD4C|6C0000  |000000;
 
 
       enemyIDTable00: dw clearEnemyID                      ;0BBD4F|        |0B810D;
                       dw enemyID_zombie_02                 ;0BBD51|        |0B819B;
                       dw enemyID_zombieGr_04               ;0BBD53|        |0B8F34;
                       dw enemyID_raven_06                  ;0BBD55|        |0B81B9;
                       dw enemyID_raven_08                  ;0BBD57|        |0B820C;
                       dw enemyID_bat_0A                    ;0BBD59|        |0B822D;
                       dw enemyID_sleepingBat_0C            ;0BBD5B|        |0B8256;
                       dw enemyID_medusa_0E                 ;0BBD5D|        |0B83BD;
                       dw enemyID_ghost_10                  ;0BBD5F|        |0B83F5;
                       dw enemyID_skeletonBone_12           ;0BBD61|        |0B89AC;
                       dw enemyID_skeletonWhip_14           ;0BBD63|        |0B81C5;
                       dw enemyID_eyeFloat_16               ;0BBD65|        |0B83AD;
                       dw enemyID_shroomFloat_18            ;0BBD67|        |0B8482;
                       dw enemyID_wingDeamon_1A             ;0BBD69|        |0B8E5A;
                       dw enemyID_fleaMan_1C                ;0BBD6B|        |0B8E20;
                       dw enemyID_slim_1E                   ;0BBD6D|        |0B8528;
                       dw enemyID_skeletonSword_20          ;0BBD6F|        |0B856C;
                       dw enemyID_axeKnight_22              ;0BBD71|        |0B8662;
                       dw enemyID_bonePillar3_24            ;0BBD73|        |0B86CB;
                       dw enemyID_skeletonWalk_26           ;0BBD75|        |0B8284;
                       dw enemyID_fishMan_28                ;0BBD77|        |0BA46D;
                       dw enemyID_flame_2A                  ;0BBD79|        |0BA4CF;
                       dw enemyID_mummy_2C                  ;0BBD7B|        |0BA4E3;
                       dw enemyID_skeletonRed_2E            ;0BBD7D|        |0BA4EA;
                       dw enemyID_spark_30                  ;0BBD7F|        |0BA4F1;
                       dw entity_RTS_19_stub                ;0BBD81|        |0BBF8B;
                       dw enemyID_mummyCrumbl_34            ;0BBD83|        |0BA4F7;
                       dw enemyID_skeletonCrumbl_36         ;0BBD85|        |0BA502;
                       dw enemyID_splash_38                 ;0BBD87|        |0B893A;
                       dw enemyID_headlessKnight_3A         ;0BBD89|        |0B897E;
                       dw enemyID_spider_3C                 ;0BBD8B|        |0B83C3;
                       dw enemyID_bonePillarTwo_3E          ;0BBD8D|        |0B8441;
                       dw enemyID__40                       ;0BBD8F|        |0B844C;
                       dw enemyID_shroomFloat_42            ;0BBD91|        |0B84C8;
                       dw enemyID_skeletonRedWhip_44        ;0BBD93|        |0B89F8;
                       dw enemyID_shroomGround_46           ;0BBD95|        |0B8A45;
                       dw enemyID_shroomGround_48           ;0BBD97|        |0B8AD3;
                       dw enemyID_zombieSide_4A             ;0BBD99|        |0B8A65;
                       dw enemyID_mudMan_4C                 ;0BBD9B|        |0B8A29;
                       dw enemyID_frog_4E                   ;0BBD9D|        |0B84B2;
                       dw enemyID_fishManSwim_50            ;0BBD9F|        |0B9027;
                       dw enemyID_fireMan_52                ;0BBDA1|        |0B8FF1;
                       dw enemyID_fishManSwimJump_54        ;0BBDA3|        |0B81A7;
                       dw enemyID_splash_56                 ;0BBDA5|        |0B81B3;
                       dw enemyID_knight_58                 ;0BBDA7|        |0B90FF;
                       dw enemyID_boneDragonHead_5A         ;0BBDA9|        |0B81E9;
                       dw enemyID_boneDragonRip_5C          ;0BBDAB|        |0B84B8;
                       dw enemyID_boneDragonBase_5E         ;0BBDAD|        |0B9141;
                       dw enemyID_bonePillar3_60            ;0BBDAF|        |0B8A3A;
                       dw enemyID_candle_62                 ;0BBDB1|        |0B8AE9;
                       dw enemyID_candle_62                 ;0BBDB3|        |0B8AE9;
                       dw enemyID_lantern_66                ;0BBDB5|        |0B92FC;
                       dw enemyID_zombieSide_68             ;0BBDB7|        |0B9298;
                       dw enemyID__6A                       ;0BBDB9|        |0B9358;
                       dw enemyID__6C                       ;0BBDBB|        |0B93C4;
                       dw enemyID__6E                       ;0BBDBD|        |0BA03B;
                       dw enemyID__70                       ;0BBDBF|        |0BA0A3;
                       dw enemyID__72                       ;0BBDC1|        |0BA0D8;
                       dw enemyID__74                       ;0BBDC3|        |0B8BD4;
                       dw enemyID__76                       ;0BBDC5|        |0B9260;
 
                       dw enemyID__78                       ;0BBDC7|        |0B94EE;
                       dw enemyID__7A                       ;0BBDC9|        |0B950F;
                       dw enemyID__7C                       ;0BBDCB|        |0B9503;
                       dw enemyID__7E                       ;0BBDCD|        |0B95A7;
                       dw enemyID__80                       ;0BBDCF|        |0B9539;
                       dw enemyID__82                       ;0BBDD1|        |0B954E;
                       dw enemyID__84                       ;0BBDD3|        |0B958B;
                       dw enemyID__86                       ;0BBDD5|        |0B9596;
                       dw enemyID_moneyBag_88               ;0BBDD7|        |0B8556;
                       dw enemyID__8A                       ;0BBDD9|        |0B95CC;
                       dw enemyID__8C                       ;0BBDDB|        |0B9623;
                       dw enemyID__8E                       ;0BBDDD|        |0B9644;
                       dw enemyID__90                       ;0BBDDF|        |0B967B;
                       dw enemyID__92                       ;0BBDE1|        |0B9698;
                       dw enemyID__8E                       ;0BBDE3|        |0B9644;
                       dw enemyID__8E                       ;0BBDE5|        |0B9644;
                       dw enemyID__8E                       ;0BBDE7|        |0B9644;
                       dw enemyID__9A                       ;0BBDE9|        |0B8495;
                       dw enemyID__9C                       ;0BBDEB|        |0B8D9C;
                       dw enemyID_heart_9E                  ;0BBDED|        |0B8313;
                       dw enemyID_multi2_A0                 ;0BBDEF|        |0B8C22;
                       dw enemyID_multi3_A2                 ;0BBDF1|        |0B8C64;
                       dw enemyID__A4                       ;0BBDF3|        |0B8AE3;
                       dw enemyID__A6                       ;0BBDF5|        |0B81DD;
                       dw enemyID__A8                       ;0BBDF7|        |0B81D1;
                       dw enemyID__AA                       ;0BBDF9|        |0B8201;
                       dw enemyID__AC                       ;0BBDFB|        |0B9789;
                       dw enemyID__AE                       ;0BBDFD|        |0B986F;
                       dw enemyID_spiderweb_B0              ;0BBDFF|        |0B865B;
                       dw enemyID_fireball_B2               ;0BBE01|        |0B86C2;
                       dw enemyID_axe_B4                    ;0BBE03|        |0B9634;
                       dw enemyID_tearDrop_B6               ;0BBE05|        |0B98C4;
                       dw enemyID_bone_B8                   ;0BBE07|        |0B85E8;
                       dw enemyID_mummyWrap_BA              ;0BBE09|        |0B8CEF;
                       dw enemyID_spiderling_BC             ;0BBE0B|        |0B98AB;
                       dw enemyID_sporeling_BE              ;0BBE0D|        |0B8D39;
                       dw enemyID_embers_C0                 ;0BBE0F|        |0B87C3;
                       dw enemyID_thunderStorm_C2           ;0BBE11|        |0B87DF;
                       dw enemyID__C4                       ;0BBE13|        |0B8214;
                       dw enemyID__C6                       ;0BBE15|        |0B87FD;
                       dw enemyID_owl_C8                    ;0BBE17|        |0B88CC;
                       dw enemyID_fuzzy_CA                  ;0BBE19|        |0B8D86;
                       dw enemyID_harpy_CC                  ;0BBE1B|        |0B91AB;
                       dw enemyID_bat_CE                    ;0BBE1D|        |0B879F;
                       dw enemyID__D0                       ;0BBE1F|        |0B9946;
                       dw enemyID_ghostFlicker_D2           ;0BBE21|        |0B9FEA;
                       dw enemyID_bleaManDrop_D4            ;0BBE23|        |0B9FFB;
                       dw enemyID__D6                       ;0BBE25|        |0B999D;
                       dw enemyID__D8                       ;0BBE27|        |0B8FE7;
                       dw enemyID__DA                       ;0BBE29|        |0B8153;
                       dw enemyID__DC                       ;0BBE2B|        |0B8AD9;
                       dw enemyID_bat_DE                    ;0BBE2D|        |0B8773;
                       dw enemyID__E0                       ;0BBE2F|        |0B8793;
                       dw enemyID_zombieSide_E2             ;0BBE31|        |0BA0A8;
                       dw enemyID__E4                       ;0BBE33|        |0B822C;
                       dw enemyID__E6                       ;0BBE35|        |0B864A;
                       dw enemyID__E8                       ;0BBE37|        |0B86A4;
                       dw enemyID__EA                       ;0BBE39|        |0B8112;
                       dw enemyID__EC                       ;0BBE3B|        |0B9A78;
                       dw enemyID__EE                       ;0BBE3D|        |0B9A3F;
                       dw enemyID__F0                       ;0BBE3F|        |0B9B74;
                       dw enemyID__F2                       ;0BBE41|        |0B9A39;
                       dw enemyID__F4                       ;0BBE43|        |0B9CE8;
                       dw enemyID__F6                       ;0BBE45|        |0BA508;
                       dw enemyID__F8                       ;0BBE47|        |0BA513;
                       dw enemyID__FA                       ;0BBE49|        |0B9403;
                       dw enemyID__FC                       ;0BBE4B|        |0B93D9;
                       dw enemyID__FE                       ;0BBE4D|        |0B943B;
 
       enemyIDTable01: dw enemy_2_ID_00                     ;0BBE4F|        |0B949B;
                       dw enemy_2_ID_02                     ;0BBE51|        |0B94BD;
                       dw enemy_2_ID_04                     ;0BBE53|        |0B94C4;
                       dw enemy_2_ID_06                     ;0BBE55|        |0B94E2;
                       dw enemy_2_ID_08                     ;0BBE57|        |0B9E8D;
                       dw enemy_2_ID_0A                     ;0BBE59|        |0B9F25;
                       dw enemy_2_ID_0C                     ;0BBE5B|        |0B9F59;
                       dw enemy_2_ID_0E                     ;0BBE5D|        |0B8373;
                       dw enemy_2_ID_10                     ;0BBE5F|        |0B8392;
                       dw enemy_2_ID_12                     ;0BBE61|        |0B8D22;
                       dw enemy_2_ID_14                     ;0BBE63|        |0B85BC;
                       dw enemy_2_ID_16                     ;0BBE65|        |0B829C;
                       dw enemy_2_ID_18                     ;0BBE67|        |0B82B4;
                       dw enemy_2_ID_1A                     ;0BBE69|        |0B82D5;
                       dw enemy_2_ID_1C                     ;0BBE6B|        |0B8D76;
                       dw enemy_2_ID_1E                     ;0BBE6D|        |0B8BC2;
                       dw enemy_2_ID_20                     ;0BBE6F|        |0B8BB0;
                       dw enemy_2_ID_22                     ;0BBE71|        |0B8240;
 
                       dw enemy_2_ID_24                     ;0BBE73|        |0B8AF3;
                       dw enemy_2_ID_26                     ;0BBE75|        |0B8B69;
                       dw enemy_2_ID_28                     ;0BBE77|        |0B8B75;
                       dw enemy_2_ID_2A                     ;0BBE79|        |0B8307;
                       dw enemy_2_ID_2C                     ;0BBE7B|        |0B8BF7;
                       dw enemy_2_ID_2E                     ;0BBE7D|        |0BA467;
                       dw enemy_2_ID_30                     ;0BBE7F|        |0B8811;
                       dw enemy_2_ID_34                     ;0BBE81|        |0B8889;
                       dw enemy_2_ID_36                     ;0BBE83|        |0B8E3F;
                       dw enemy_2_ID_38                     ;0BBE85|        |0B8C9A;
                       dw enemy_2_ID_3A                     ;0BBE87|        |0B86FA;
                       dw enemy_2_ID_3C                     ;0BBE89|        |0B8702;
                       dw enemy_2_ID_3E                     ;0BBE8B|        |0B8183;
                       dw enemy_2_ID_40                     ;0BBE8D|        |0B8477;
                       dw enemy_2_ID_boss_42                ;0BBE8F|        |0B8120;
                       dw enemy_2_ID_44                     ;0BBE91|        |0B816A;
                       dw enemy_2_ID_46                     ;0BBE93|        |0B8FA1;
                       dw enemy_2_ID_48                     ;0BBE95|        |0B8719;
                       dw enemy_2_ID_4A                     ;0BBE97|        |0B873A;
                       dw enemy_2_ID_4C                     ;0BBE99|        |0B82AE;
                       dw enemy_2_ID_4E                     ;0BBE9B|        |0B83E5;
                       dw enemy_2_ID_50                     ;0BBE9D|        |0B8A26;
                       dw enemy_2_ID_52                     ;0BBE9F|        |0B863E;
 
     enemyScriptTable: dw entityScriptRTS_15                ;0BBEA1|        |0BBF87;
                       dw entityScripts_01                  ;0BBEA3|        |0BA59C;
                       dw entityScripts_02                  ;0BBEA5|        |0BA5C4;
                       dw entityScripts_03                  ;0BBEA7|        |0BAADC;
                       dw entityScripts_03                  ;0BBEA9|        |0BAADC;
 
                       dw entityScripts_05                  ;0BBEAB|        |0BA71C;
                       dw entityScripts_06                  ;0BBEAD|        |0BA73C;
                       dw entityScripts_07                  ;0BBEAF|        |0BA618;
                       dw entityScripts_08                  ;0BBEB1|        |0BA8D4;
                       dw entityScripts_09                  ;0BBEB3|        |0BA910;
                       dw entityScripts_0a                  ;0BBEB5|        |0BAA10;
                       dw entityScripts_0b                  ;0BBEB7|        |0BAA48;
                       dw entityScripts_0c                  ;0BBEB9|        |0BAA84;
                       dw entityScripts_0d                  ;0BBEBB|        |0BAAD0;
                       dw entityScripts_0e                  ;0BBEBD|        |0BA6EC;
                       dw entityScripts_0f                  ;0BBEBF|        |0BAAF4;
                       dw entityScripts_10                  ;0BBEC1|        |0BAB68;
                       dw entityScripts_11                  ;0BBEC3|        |0BA82C;
                       dw entityScripts_12                  ;0BBEC5|        |0BA670;
                       dw entityScripts_13                  ;0BBEC7|        |0BA8F8;
                       dw entityScripts_14                  ;0BBEC9|        |0BAC50;
                       dw entityScriptRTS_15                ;0BBECB|        |0BBF87;
                       dw entityScripts_16                  ;0BBECD|        |0BAF50;
                       dw entityScripts_17                  ;0BBECF|        |0BA940;
 
                       dw entityScripts_18                  ;0BBED1|        |0BAFF8;
                       dw entityScripts_19                  ;0BBED3|        |0BB00C;
                       dw entityScripts_1a                  ;0BBED5|        |0BB01C;
                       dw entityScripts_1b                  ;0BBED7|        |0BB030;
                       dw entityScripts_1c                  ;0BBED9|        |0BABB0;
                       dw entityScripts_1d                  ;0BBEDB|        |0BAF0C;
                       dw entityScripts_1e                  ;0BBEDD|        |0BA640;
                       dw entityScriptRTS_15                ;0BBEDF|        |0BBF87;
                       dw entityScripts_20                  ;0BBEE1|        |0BAABC;
                       dw entityScripts_21                  ;0BBEE3|        |0BA994;
                       dw entityScripts_22                  ;0BBEE5|        |0BAAA0;
                       dw entityScripts_23                  ;0BBEE7|        |0BAAA8;
                       dw entityScripts_24                  ;0BBEE9|        |0BA5A8;
                       dw entityScripts_25                  ;0BBEEB|        |0BAE08;
                       dw entityScripts_26                  ;0BBEED|        |0BAE58;
                       dw entityScripts_27                  ;0BBEEF|        |0BACEC;
                       dw entityScripts_28                  ;0BBEF1|        |0BADF8;
                       dw entityScripts_29                  ;0BBEF3|        |0BAD48;
                       dw entityScripts_2a                  ;0BBEF5|        |0BB040;
 
                       dw entityScripts_2b                  ;0BBEF7|        |0BA84C;
                       dw entityScripts_2c                  ;0BBEF9|        |0BA550;
                       dw entityScripts_2d                  ;0BBEFB|        |0BA560;
 
                       dw entityScripts_2e                  ;0BBEFD|        |0BA56C;
                       dw entityScripts_2f                  ;0BBEFF|        |0BA694;
                       dw entityScripts_30                  ;0BBF01|        |0BAF90;
                       dw entityScripts_31                  ;0BBF03|        |0BAF9C;
                       dw entityScripts_32                  ;0BBF05|        |0BAFA8;
                       dw entityScripts_33                  ;0BBF07|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF09|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF0B|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF0D|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF0F|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF11|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF13|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF15|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF17|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF19|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF1B|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF1D|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF1F|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF21|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF23|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF25|        |0BB0A0;
                       dw entityScripts_43                  ;0BBF27|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF29|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF2B|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF2D|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF2F|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF31|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF33|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF35|        |0BB0B4;
                       dw entityScripts_43                  ;0BBF37|        |0BB0B4;
                       dw entityScripts_33                  ;0BBF39|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF3B|        |0BB0A0;
                       dw entityScripts_4e                  ;0BBF3D|        |0BB088;
                       dw entityScripts_33                  ;0BBF3F|        |0BB0A0;
                       dw entityScripts_33                  ;0BBF41|        |0BB0A0;
                       dw entityScripts_51                  ;0BBF43|        |0BB0D4;
                       dw entityScripts_51                  ;0BBF45|        |0BB0D4;
                       dw entityScripts_51                  ;0BBF47|        |0BB0D4;
                       dw entityScriptRTS_15                ;0BBF49|        |0BBF87;
                       dw entityScriptRTS_15                ;0BBF4B|        |0BBF87;
                       dw entityScriptRTS_15                ;0BBF4D|        |0BBF87;
                       dw entityScripts_57                  ;0BBF4F|        |0BB0D8;
                       dw entityScripts_58                  ;0BBF51|        |0BAFB4;
                       dw entityScripts_59                  ;0BBF53|        |0BAFBC;
                       dw entityScripts_5a                  ;0BBF55|        |0BAFD0;
                       dw entityScripts_5b                  ;0BBF57|        |0BAFD8;
                       dw entityScripts_5c                  ;0BBF59|        |0BAFE0;
                       dw entityScripts_5d                  ;0BBF5B|        |0BAFEC;
                       dw entityScripts_5e                  ;0BBF5D|        |0BB05C;
                       dw entityScripts_5f                  ;0BBF5F|        |0BB06C;
                       dw entityScripts_60                  ;0BBF61|        |0BA40B;
                       dw entityScripts_61                  ;0BBF63|        |0BA578;
                       dw entityScripts_62                  ;0BBF65|        |0BB050;
                       dw entityScripts_63                  ;0BBF67|        |0BA76C;
                       dw entityScripts_64                  ;0BBF69|        |0BA57C;
                       dw entityScripts_65                  ;0BBF6B|        |0BA7FC;
                       dw entityScripts_66                  ;0BBF6D|        |0BA728;
                       dw entityScripts_67                  ;0BBF6F|        |0BB04C;
                       dw entityScripts_68                  ;0BBF71|        |0BA89C;
                       dw entityScripts_69                  ;0BBF73|        |0BA6B8;
                       dw entityScripts_6a                  ;0BBF75|        |0BABF8;
                       dw entityScripts_6b                  ;0BBF77|        |0BA538;
                       dw entityScripts_6c                  ;0BBF79|        |0BA544;
                       dw entityScripts_6d                  ;0BBF7B|        |0BA62C;
                       dw entityScripts_6e                  ;0BBF7D|        |0BA758;
                       dw entityScripts_6f                  ;0BBF7F|        |0BA58C;
                       dw entityScripts_70                  ;0BBF81|        |0BA5B8;
                       dw entityScripts_71                  ;0BBF83|        |0BA860;
                       dw entityScripts_18                  ;0BBF85|        |0BAFF8;
 
   entityScriptRTS_15: db $19,$00,$00,$00                   ;0BBF87|        |      ;
 
   entity_RTS_19_stub: RTS                                  ;0BBF8B|60      |      ;
 
                       dw entity_RTS_19_stub                ;0BBF8C|        |0BBF8B;
                       dw entity_RTS_19_stub                ;0BBF8E|        |0BBF8B;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBF90|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBF98|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFA0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFA8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFB0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFB8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFC0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFC8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFD0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFD8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFE0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFE8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFF0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0BBFF8|        |FFFFFF;
 
