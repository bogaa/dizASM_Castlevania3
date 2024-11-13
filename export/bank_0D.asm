 
                       ORG $0D8000
 
 
              bank_9a: db $9A                               ;0D8000|        |      ; PRG 34000
 
        mainSpriteOAM: LDA.B r_gameState                    ;0D8001|A518    |000025;
                       CMP.B #$0C                           ;0D8003|C90C    |      ;
                       BNE CODE_0D800A                      ;0D8005|D003    |0D800A;
                       JMP.W CODE_0D8188                    ;0D8007|4C8881  |0D8188;
 
 
          CODE_0D800A: LDA.B #$00                           ;0D800A|A900    |      ;
                       STA.B r_collisionPointXvalDiv32-$D   ;0D800C|8505    |000012;
                       LDA.B #$40                           ;0D800E|A940    |      ;
                       STA.B r_collisionPointAbsoluteXRoom-$D;0D8010|8507    |000014;
                       LDA.B r_spriteOffsetOAM              ;0D8012|A520    |00002D;
                       CLC                                  ;0D8014|18      |      ;
                       ADC.B #$44                           ;0D8015|6944    |      ;
                       STA.B r_spriteOffsetOAM              ;0D8017|8520    |00002D;
                       STA.B r_collisionPointYinScreen-$D   ;0D8019|8504    |000011;
 
          CODE_0D801B: LDX.B r_collisionPointXvalDiv32-$D   ;0D801B|A605    |000012;
                       CPX.B #$1C                           ;0D801D|E01C    |      ;
                       BCS CODE_0D8041                      ;0D801F|B020    |0D8041;
                       LDA.W $0400,X                        ;0D8021|BD0004  |0D0400;
                       BEQ CODE_0D803D                      ;0D8024|F017    |0D803D;
                       LDA.W $0470,X                        ;0D8026|BD7004  |0D0470;
                       BMI CODE_0D803D                      ;0D8029|3012    |0D803D;
                       LDA.W $0454,X                        ;0D802B|BD5404  |0D0454;
                       STA.B r_tempCurrSection-$D           ;0D802E|8500    |00000D;
                       LDA.W $041C,X                        ;0D8030|BD1C04  |0D041C;
                       STA.B r_tempCurrRoomIdx-$D           ;0D8033|8501    |00000E;
                       LDA.W $0438,X                        ;0D8035|BD3804  |0D0438;
                       STA.B r_roomSectionChrBanksDataOffset-$D;0D8038|8502    |00000F;
                       JSR.W CODE_0D8079                    ;0D803A|207980  |0D8079;
 
          CODE_0D803D: INC.B r_collisionPointXvalDiv32-$D   ;0D803D|E605    |000012;
                       BNE CODE_0D801B                      ;0D803F|D0DA    |0D801B;
 
          CODE_0D8041: LDX.B r_collisionPointYinScreen-$D   ;0D8041|A604    |000011;
                       LDY.B r_collisionPointAbsoluteXRoom-$D;0D8043|A407    |000014;
 
          CODE_0D8045: LDA.B #$F4                           ;0D8045|A9F4    |      ;
                       STA.W $0200,X                        ;0D8047|9D0002  |0D0200;
                       TXA                                  ;0D804A|8A      |      ;
                       CLC                                  ;0D804B|18      |      ;
                       ADC.B #$C4                           ;0D804C|69C4    |      ;
                       TAX                                  ;0D804E|AA      |      ;
                       DEY                                  ;0D804F|88      |      ;
                       BNE CODE_0D8045                      ;0D8050|D0F3    |0D8045;
                       RTS                                  ;0D8052|60      |      ;
 
 
          CODE_0D8053: JSR.W CODE_0D817B                    ;0D8053|207B81  |0D817B;
                       BCC CODE_0D8068                      ;0D8056|9010    |0D8068;
                       BCS CODE_0D806A                      ;0D8058|B010    |0D806A;
 
          CODE_0D805A: CLC                                  ;0D805A|18      |      ;
                       BCC CODE_0D80A7                      ;0D805B|904A    |0D80A7;
 
          CODE_0D805D: CLC                                  ;0D805D|18      |      ;
                       ADC.B r_tempCurrRoomIdx-$D           ;0D805E|6501    |00000E;
                       STA.W $0200,X                        ;0D8060|9D0002  |0D0200;
                       INY                                  ;0D8063|C8      |      ;
                       LDA.B r_defaultCHR                   ;0D8064|A5B0    |0000BD;
                       BNE CODE_0D8053                      ;0D8066|D0EB    |0D8053;
 
          CODE_0D8068: LDA.B (r_temp_Xpos),Y                ;0D8068|B10A    |000017;
 
          CODE_0D806A: STA.W $0201,X                        ;0D806A|9D0102  |0D0201;
                       LDA.B r_index                        ;0D806D|A510    |00001D;
                       JMP.W CODE_0D80CA                    ;0D806F|4CCA80  |0D80CA;
 
 
       UNREACH_0D8072: db $20,$7B,$81,$90,$3D,$B0,$3D       ;0D8072|        |0D817B;
 
          CODE_0D8079: LDY.W $048C,X                        ;0D8079|BC8C04  |0D048C;
                       STY.B r_roomSectionChrBanksDataOffset;0D807C|840F    |00001C;
                       LDA.W mainSpriteAssem,Y              ;0D807E|B93E82  |0D823E;
                       STA.B r_pointerQueue                 ;0D8081|8508    |000015;
                       LDA.W PTR16_0D823F,Y                 ;0D8083|B93F82  |0D823F;
                       STA.B r_coreLoadingFuncAddr-$D       ;0D8086|8509    |000016;
                       LDY.W $0400,X                        ;0D8088|BC0004  |0D0400;
                       LDA.B (r_pointerQueue),Y             ;0D808B|B108    |000015;
                       STA.B r_temp_Xpos                    ;0D808D|850A    |000017;
                       INY                                  ;0D808F|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0D8090|B108    |000015;
                       STA.B r_gameState-$D                 ;0D8092|850B    |000018;
                       LDY.B #$00                           ;0D8094|A000    |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D8096|B10A    |000017;
                       STA.B r_index-$D                     ;0D8098|8503    |000010;
                       LDA.W $04A8,X                        ;0D809A|BDA804  |0D04A8;
                       BEQ CODE_0D80F9                      ;0D809D|F05A    |0D80F9;
                       LDX.B r_collisionPointYinScreen-$D   ;0D809F|A604    |000011;
 
          CODE_0D80A1: INY                                  ;0D80A1|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D80A2|B10A    |000017;
                       BPL CODE_0D805A                      ;0D80A4|10B4    |0D805A;
                       SEC                                  ;0D80A6|38      |      ;
 
          CODE_0D80A7: ROR A                                ;0D80A7|6A      |      ;
                       BCS CODE_0D805D                      ;0D80A8|B0B3    |0D805D;
                       ADC.B r_tempCurrRoomIdx-$D           ;0D80AA|6501    |00000E;
                       STA.W $0200,X                        ;0D80AC|9D0002  |0D0200;
                       INY                                  ;0D80AF|C8      |      ;
                       LDA.B r_defaultCHR                   ;0D80B0|A5B0    |0000BD;
                       BNE UNREACH_0D8072                   ;0D80B2|D0BE    |0D8072;
                       LDA.B (r_temp_Xpos),Y                ;0D80B4|B10A    |000017;
                       STA.W $0201,X                        ;0D80B6|9D0102  |0D0201;
                       INY                                  ;0D80B9|C8      |      ;
                       LDA.B r_tempCurrSection-$D           ;0D80BA|A500    |00000D;
                       BEQ CODE_0D80C6                      ;0D80BC|F008    |0D80C6;
                       LDA.B (r_temp_Xpos),Y                ;0D80BE|B10A    |000017;
                       AND.B #$FC                           ;0D80C0|29FC    |      ;
                       ORA.B r_tempCurrSection-$D           ;0D80C2|0500    |00000D;
                       BNE CODE_0D80C8                      ;0D80C4|D002    |0D80C8;
 
          CODE_0D80C6: LDA.B (r_temp_Xpos),Y                ;0D80C6|B10A    |000017;
 
          CODE_0D80C8: STA.B r_index                        ;0D80C8|8510    |00001D;
 
          CODE_0D80CA: STA.W $0202,X                        ;0D80CA|9D0202  |0D0202;
                       INY                                  ;0D80CD|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D80CE|B10A    |000017;
                       BMI CODE_0D80EA                      ;0D80D0|3018    |0D80EA;
                       CLC                                  ;0D80D2|18      |      ;
                       ADC.B r_roomSectionChrBanksDataOffset-$D;0D80D3|6502    |00000F;
                       BCS CODE_0D80EF                      ;0D80D5|B018    |0D80EF;
 
          CODE_0D80D7: STA.W $0203,X                        ;0D80D7|9D0302  |0D0203;
 
          CODE_0D80DA: TXA                                  ;0D80DA|8A      |      ;
                       CLC                                  ;0D80DB|18      |      ;
                       ADC.B #$C4                           ;0D80DC|69C4    |      ;
                       TAX                                  ;0D80DE|AA      |      ;
                       DEC.B r_collisionPointAbsoluteXRoom-$D;0D80DF|C607    |000014;
                       BEQ CODE_0D80F6                      ;0D80E1|F013    |0D80F6;
                       DEC.B r_index-$D                     ;0D80E3|C603    |000010;
                       BNE CODE_0D80A1                      ;0D80E5|D0BA    |0D80A1;
                       STX.B r_collisionPointYinScreen-$D   ;0D80E7|8604    |000011;
                       RTS                                  ;0D80E9|60      |      ;
 
 
          CODE_0D80EA: CLC                                  ;0D80EA|18      |      ;
                       ADC.B r_roomSectionChrBanksDataOffset-$D;0D80EB|6502    |00000F;
                       BCS CODE_0D80D7                      ;0D80ED|B0E8    |0D80D7;
 
          CODE_0D80EF: LDA.B #$F4                           ;0D80EF|A9F4    |      ;
                       STA.W $0200,X                        ;0D80F1|9D0002  |0D0200;
                       BNE CODE_0D80DA                      ;0D80F4|D0E4    |0D80DA;
 
          CODE_0D80F6: PLA                                  ;0D80F6|68      |      ;
                       PLA                                  ;0D80F7|68      |      ;
                       RTS                                  ;0D80F8|60      |      ;
 
 
          CODE_0D80F9: LDX.B r_collisionPointYinScreen-$D   ;0D80F9|A604    |000011;
 
          CODE_0D80FB: INY                                  ;0D80FB|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D80FC|B10A    |000017;
                       BPL CODE_0D815C                      ;0D80FE|105C    |0D815C;
                       SEC                                  ;0D8100|38      |      ;
 
          CODE_0D8101: ROR A                                ;0D8101|6A      |      ;
                       BCS CODE_0D815F                      ;0D8102|B05B    |0D815F;
                       ADC.B r_tempCurrRoomIdx-$D           ;0D8104|6501    |00000E;
                       STA.W $0200,X                        ;0D8106|9D0002  |0D0200;
                       INY                                  ;0D8109|C8      |      ;
                       LDA.B r_defaultCHR                   ;0D810A|A5B0    |0000BD;
                       BNE CODE_0D8155                      ;0D810C|D047    |0D8155;
 
          CODE_0D810E: LDA.B (r_temp_Xpos),Y                ;0D810E|B10A    |000017;
 
          CODE_0D8110: STA.W $0201,X                        ;0D8110|9D0102  |0D0201;
                       INY                                  ;0D8113|C8      |      ;
                       LDA.B r_tempCurrSection-$D           ;0D8114|A500    |00000D;
                       BEQ CODE_0D8120                      ;0D8116|F008    |0D8120;
                       LDA.B (r_temp_Xpos),Y                ;0D8118|B10A    |000017;
                       AND.B #$FC                           ;0D811A|29FC    |      ;
                       ORA.B r_tempCurrSection-$D           ;0D811C|0500    |00000D;
                       BNE CODE_0D8122                      ;0D811E|D002    |0D8122;
 
          CODE_0D8120: LDA.B (r_temp_Xpos),Y                ;0D8120|B10A    |000017;
 
          CODE_0D8122: EOR.B #$40                           ;0D8122|4940    |      ;
                       STA.B r_index                        ;0D8124|8510    |00001D;
 
          CODE_0D8126: STA.W $0202,X                        ;0D8126|9D0202  |0D0202;
                       INY                                  ;0D8129|C8      |      ;
                       LDA.B #$F8                           ;0D812A|A9F8    |      ;
                       SEC                                  ;0D812C|38      |      ;
                       SBC.B (r_temp_Xpos),Y                ;0D812D|F10A    |000017;
                       BMI CODE_0D8149                      ;0D812F|3018    |0D8149;
                       CLC                                  ;0D8131|18      |      ;
                       ADC.B r_roomSectionChrBanksDataOffset-$D;0D8132|6502    |00000F;
                       BCS CODE_0D814E                      ;0D8134|B018    |0D814E;
 
          CODE_0D8136: STA.W $0203,X                        ;0D8136|9D0302  |0D0203;
 
          CODE_0D8139: TXA                                  ;0D8139|8A      |      ;
                       CLC                                  ;0D813A|18      |      ;
                       ADC.B #$C4                           ;0D813B|69C4    |      ;
                       TAX                                  ;0D813D|AA      |      ;
                       DEC.B r_collisionPointAbsoluteXRoom-$D;0D813E|C607    |000014;
                       BEQ CODE_0D80F6                      ;0D8140|F0B4    |0D80F6;
                       DEC.B r_index-$D                     ;0D8142|C603    |000010;
                       BNE CODE_0D80FB                      ;0D8144|D0B5    |0D80FB;
                       STX.B r_collisionPointYinScreen-$D   ;0D8146|8604    |000011;
                       RTS                                  ;0D8148|60      |      ;
 
 
          CODE_0D8149: CLC                                  ;0D8149|18      |      ;
                       ADC.B r_roomSectionChrBanksDataOffset-$D;0D814A|6502    |00000F;
                       BCS CODE_0D8136                      ;0D814C|B0E8    |0D8136;
 
          CODE_0D814E: LDA.B #$F4                           ;0D814E|A9F4    |      ;
                       STA.W $0200,X                        ;0D8150|9D0002  |0D0200;
                       BNE CODE_0D8139                      ;0D8153|D0E4    |0D8139;
 
          CODE_0D8155: JSR.W CODE_0D817B                    ;0D8155|207B81  |0D817B;
                       BCC CODE_0D810E                      ;0D8158|90B4    |0D810E;
                       BCS CODE_0D8110                      ;0D815A|B0B4    |0D8110;
 
          CODE_0D815C: CLC                                  ;0D815C|18      |      ;
                       BCC CODE_0D8101                      ;0D815D|90A2    |0D8101;
 
          CODE_0D815F: CLC                                  ;0D815F|18      |      ;
                       ADC.B r_tempCurrRoomIdx-$D           ;0D8160|6501    |00000E;
                       STA.W $0200,X                        ;0D8162|9D0002  |0D0200;
                       INY                                  ;0D8165|C8      |      ;
                       LDA.B r_defaultCHR                   ;0D8166|A5B0    |0000BD;
                       BNE CODE_0D8174                      ;0D8168|D00A    |0D8174;
 
          CODE_0D816A: LDA.B (r_temp_Xpos),Y                ;0D816A|B10A    |000017;
 
          CODE_0D816C: STA.W $0201,X                        ;0D816C|9D0102  |0D0201;
                       LDA.B r_index                        ;0D816F|A510    |00001D;
                       JMP.W CODE_0D8126                    ;0D8171|4C2681  |0D8126;
 
 
          CODE_0D8174: JSR.W CODE_0D817B                    ;0D8174|207B81  |0D817B;
                       BCC CODE_0D816A                      ;0D8177|90F1    |0D816A;
                       BCS CODE_0D816C                      ;0D8179|B0F1    |0D816C;
 
          CODE_0D817B: LDA.B r_roomSectionChrBanksDataOffset;0D817B|A50F    |00001C;
                       CMP.B #$16                           ;0D817D|C916    |      ;
                       BCC CODE_0D8187                      ;0D817F|9006    |0D8187;
                       LDA.B (r_temp_Xpos),Y                ;0D8181|B10A    |000017;
                       CLC                                  ;0D8183|18      |      ;
                       ADC.B #$80                           ;0D8184|6980    |      ;
                       SEC                                  ;0D8186|38      |      ;
 
          CODE_0D8187: RTS                                  ;0D8187|60      |      ;
 
 
          CODE_0D8188: LDA.B #$40                           ;0D8188|A940    |      ;
                       STA.B $05                            ;0D818A|8505    |000005;
                       LDA.B #$00                           ;0D818C|A900    |      ;
                       STA.B $06                            ;0D818E|8506    |000006;
                       STA.B $04                            ;0D8190|8504    |000004;
                       LDA.B #$1C                           ;0D8192|A91C    |      ;
                       STA.B $07                            ;0D8194|8507    |000007;
 
          CODE_0D8196: LDX.B $06                            ;0D8196|A606    |000006;
                       LDA.W $0400,X                        ;0D8198|BD0004  |0D0400;
                       BEQ CODE_0D81B4                      ;0D819B|F017    |0D81B4;
                       LDA.W $0470,X                        ;0D819D|BD7004  |0D0470;
                       BMI CODE_0D81B4                      ;0D81A0|3012    |0D81B4;
                       LDA.W $0454,X                        ;0D81A2|BD5404  |0D0454;
                       STA.B $00                            ;0D81A5|8500    |000000;
                       LDA.W $041C,X                        ;0D81A7|BD1C04  |0D041C;
                       STA.B $01                            ;0D81AA|8501    |000001;
                       LDA.W $0438,X                        ;0D81AC|BD3804  |0D0438;
                       STA.B $02                            ;0D81AF|8502    |000002;
                       JSR.W CODE_0D81DC                    ;0D81B1|20DC81  |0D81DC;
 
          CODE_0D81B4: INC.B $06                            ;0D81B4|E606    |000006;
                       DEC.B $07                            ;0D81B6|C607    |000007;
                       BNE CODE_0D8196                      ;0D81B8|D0DC    |0D8196;
                       LDX.B $04                            ;0D81BA|A604    |000004;
 
          CODE_0D81BC: LDA.B #$F4                           ;0D81BC|A9F4    |      ;
                       STA.W $0200,X                        ;0D81BE|9D0002  |0D0200;
                       INX                                  ;0D81C1|E8      |      ;
                       INX                                  ;0D81C2|E8      |      ;
                       INX                                  ;0D81C3|E8      |      ;
                       INX                                  ;0D81C4|E8      |      ;
                       BNE CODE_0D81BC                      ;0D81C5|D0F5    |0D81BC;
                       RTS                                  ;0D81C7|60      |      ;
 
 
          CODE_0D81C8: CLC                                  ;0D81C8|18      |      ;
                       BCC CODE_0D8203                      ;0D81C9|9038    |0D8203;
 
          CODE_0D81CB: CLC                                  ;0D81CB|18      |      ;
                       ADC.B $01                            ;0D81CC|6501    |000001;
                       STA.W $0200,X                        ;0D81CE|9D0002  |0D0200;
                       INY                                  ;0D81D1|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D81D2|B10A    |00000A;
                       STA.W $0201,X                        ;0D81D4|9D0102  |0D0201;
                       LDA.B r_index                        ;0D81D7|A510    |000010;
                       JMP.W CODE_0D8222                    ;0D81D9|4C2282  |0D8222;
 
 
          CODE_0D81DC: LDY.W $048C,X                        ;0D81DC|BC8C04  |0D048C;
                       LDA.W mainSpriteAssem,Y              ;0D81DF|B93E82  |0D823E;
                       STA.B r_pointerQueue                 ;0D81E2|8508    |000008;
                       LDA.W PTR16_0D823F,Y                 ;0D81E4|B93F82  |0D823F;
                       STA.B $09                            ;0D81E7|8509    |000009;
                       LDY.W $0400,X                        ;0D81E9|BC0004  |0D0400;
                       LDA.B (r_pointerQueue),Y             ;0D81EC|B108    |000008;
                       STA.B r_temp_Xpos                    ;0D81EE|850A    |00000A;
                       INY                                  ;0D81F0|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0D81F1|B108    |000008;
                       STA.B $0B                            ;0D81F3|850B    |00000B;
                       LDY.B #$00                           ;0D81F5|A000    |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D81F7|B10A    |00000A;
                       STA.B $03                            ;0D81F9|8503    |000003;
                       LDX.B $04                            ;0D81FB|A604    |000004;
                       INY                                  ;0D81FD|C8      |      ;
 
          CODE_0D81FE: LDA.B (r_temp_Xpos),Y                ;0D81FE|B10A    |00000A;
                       BPL CODE_0D81C8                      ;0D8200|10C6    |0D81C8;
                       SEC                                  ;0D8202|38      |      ;
 
          CODE_0D8203: ROR A                                ;0D8203|6A      |      ;
                       BCS CODE_0D81CB                      ;0D8204|B0C5    |0D81CB;
                       ADC.B $01                            ;0D8206|6501    |000001;
                       STA.W $0200,X                        ;0D8208|9D0002  |0D0200;
                       INY                                  ;0D820B|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D820C|B10A    |00000A;
                       STA.W $0201,X                        ;0D820E|9D0102  |0D0201;
                       INY                                  ;0D8211|C8      |      ;
                       LDA.B $00                            ;0D8212|A500    |000000;
                       BEQ CODE_0D821E                      ;0D8214|F008    |0D821E;
                       LDA.B (r_temp_Xpos),Y                ;0D8216|B10A    |00000A;
                       AND.B #$FC                           ;0D8218|29FC    |      ;
                       ORA.B $00                            ;0D821A|0500    |000000;
                       BNE CODE_0D8220                      ;0D821C|D002    |0D8220;
 
          CODE_0D821E: LDA.B (r_temp_Xpos),Y                ;0D821E|B10A    |00000A;
 
          CODE_0D8220: STA.B r_index                        ;0D8220|8510    |000010;
 
          CODE_0D8222: STA.W $0202,X                        ;0D8222|9D0202  |0D0202;
                       INY                                  ;0D8225|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0D8226|B10A    |00000A;
                       CLC                                  ;0D8228|18      |      ;
                       ADC.B $02                            ;0D8229|6502    |000002;
                       STA.W $0203,X                        ;0D822B|9D0302  |0D0203;
                       INY                                  ;0D822E|C8      |      ;
                       INX                                  ;0D822F|E8      |      ;
                       INX                                  ;0D8230|E8      |      ;
                       INX                                  ;0D8231|E8      |      ;
                       INX                                  ;0D8232|E8      |      ;
                       DEC.B $05                            ;0D8233|C605    |000005;
                       BEQ CODE_0D823B                      ;0D8235|F004    |0D823B;
                       DEC.B $03                            ;0D8237|C603    |000003;
                       BNE CODE_0D81FE                      ;0D8239|D0C3    |0D81FE;
 
          CODE_0D823B: STX.B $04                            ;0D823B|8604    |000004;
                       RTS                                  ;0D823D|60      |      ;
 
 
      mainSpriteAssem: dw trevor_spriteAssembList_00        ;0D823E|        |0D825C;
 
                       dw sympha_spriteAssemb_01            ;0D8240|        |0D82CC;
                       dw grantSpriteAssembList_02          ;0D8242|        |0D8324;
                       dw alucardSpriteAssemb_03            ;0D8244|        |0D8378;
                       dw enemySpriteAssembList_04          ;0D8246|        |0D8BE9;
                       dw bossAssembPointer05               ;0D8248|        |0D96A2;
                       dw bossAssembPointer06               ;0D824A|        |0DABE7;
                       dw doorETCAssembPointer07            ;0D824C|        |0DAD53;
                       dw miscSpriteList_08                 ;0D824E|        |0D9FD6;
                       dw enemyAssembList_09                ;0D8250|        |0D8CE9;
                       dw enemyAssemPointer0a               ;0D8252|        |0DACE7;
                       dw trevor_spriteAssembList_00        ;0D8254|        |0D825C;
 
                       dw sympha_spriteAssemb_01            ;0D8256|        |0D82CC;
                       dw grantSpriteAssembList_02          ;0D8258|        |0D8324;
                       dw alucardSpriteAssemb_03            ;0D825A|        |0D8378;
 
trevor_spriteAssembList_00: dw player_spriteAssemb_00            ;0D825C|        |0D83BE;
                       dw trevorSpriteAssemb_02             ;0D825E|        |0D8402;
                       dw trevorSpriteAssemb_04             ;0D8260|        |0D8410;
                       dw trevorSpriteAssemb_06             ;0D8262|        |0D841B;
                       dw trevorSpriteAssemb_04             ;0D8264|        |0D8410;
                       dw trevorSpriteAssemb_0A             ;0D8266|        |0D8429;
                       dw trevorSpriteAssemb_0C             ;0D8268|        |0D8437;
                       dw trevorSpriteAssemb_0E             ;0D826A|        |0D8453;
                       dw trevorSpriteAssemb_10             ;0D826C|        |0D851E;
                       dw trevorSpriteAssemb_12             ;0D826E|        |0D852C;
                       dw trevorSpriteAssemb_14             ;0D8270|        |0D853A;
                       dw trevorSpriteAssemb_16             ;0D8272|        |0D8445;
                       dw trevorSpriteAssemb_18             ;0D8274|        |0D8461;
                       dw trevorSpriteAssemb_1A             ;0D8276|        |0D846F;
                       dw trevorSpriteAssemb_1C             ;0D8278|        |0D847D;
                       dw trevorSpriteAssemb_1E             ;0D827A|        |0D848E;
                       dw trevorSpriteAssemb_20             ;0D827C|        |0D849F;
                       dw trevorSpriteAssemb_22             ;0D827E|        |0D84AD;
                       dw trevorSpriteAssemb_24             ;0D8280|        |0D8548;
                       dw trevorSpriteAssemb_26             ;0D8282|        |0D8550;
                       dw trevorSpriteAssemb_28             ;0D8284|        |0D8558;
                       dw trevorSpriteAssemb_2A             ;0D8286|        |0D8563;
                       dw trevorSpriteAssemb_2C             ;0D8288|        |0D856B;
                       dw trevorSpriteAssemb_2E             ;0D828A|        |0D8573;
                       dw trevorSpriteAssemb_30             ;0D828C|        |0D857B;
                       dw trevorSpriteAssemb_32             ;0D828E|        |0D8586;
                       dw trevorSpriteAssemb_34             ;0D8290|        |0D84BE;
                       dw trevorSpriteAssemb_36             ;0D8292|        |0D84CF;
                       dw trevorSpriteAssemb_38             ;0D8294|        |0D84DD;
                       dw trevorSpriteAssemb_3A             ;0D8296|        |0D84EE;
                       dw trevorSpriteAssemb_3C             ;0D8298|        |0D84FF;
                       dw trevorSpriteAssemb_3E             ;0D829A|        |0D850D;
                       dw trevorSpriteAssemb_40             ;0D829C|        |0D8597;
                       dw trevorSpriteAssemb_42             ;0D829E|        |0D85A0;
                       dw trevorSpriteAssemb_44             ;0D82A0|        |0D85A8;
                       dw trevorSpriteAssemb_46             ;0D82A2|        |0D85B0;
                       dw trevorSpriteAssemb_48             ;0D82A4|        |0D85B8;
                       dw trevorSpriteAssemb_4A             ;0D82A6|        |0D85C0;
                       dw trevorSpriteAssemb_4C             ;0D82A8|        |0D85C8;
                       dw trevorSpriteAssemb_4E             ;0D82AA|        |0D85D0;
                       dw trevorSpriteAssemb_50             ;0D82AC|        |0D85DD;
                       dw trevorSpriteAssemb_52             ;0D82AE|        |0D85E5;
                       dw trevorSpriteAssemb_54             ;0D82B0|        |0D85EA;
                       dw trevorSpriteAssemb_56             ;0D82B2|        |0D93CB;
                       dw trevorSpriteAssemb_58             ;0D82B4|        |0D93D0;
                       dw trevorSpriteAssemb_5A             ;0D82B6|        |0D93D5;
                       dw trevorSpriteAssemb_58             ;0D82B8|        |0D93D0;
                       dw trevorSpriteAssemb_5E             ;0D82BA|        |0D85F2;
                       dw trevorSpriteAssemb_60             ;0D82BC|        |0D85FB;
                       dw trevorSpriteAssemb_62             ;0D82BE|        |0D83F9;
                       dw trevorSpriteAssemb_64             ;0D82C0|        |0D85D8;
                       dw player_spriteAssemb_00            ;0D82C2|        |0D83BE;
                       dw trevorSpriteAssemb_68             ;0D82C4|        |0D83C7;
                       dw trevorSpriteAssemb_6A             ;0D82C6|        |0D83D2;
                       dw trevorSpriteAssemb_6C             ;0D82C8|        |0D83E0;
                       dw trevorSpriteAssemb_6E             ;0D82CA|        |0D83EB;
 
sympha_spriteAssemb_01: dw player_spriteAssemb_00            ;0D82CC|        |0D83BE;
                       dw sympha_SpriteAssemb_02            ;0D82CE|        |0D8604;
                       dw sympha_SpriteAssemb_04            ;0D82D0|        |0D8612;
                       dw sympha_SpriteAssemb_06            ;0D82D2|        |0D8620;
                       dw sympha_SpriteAssemb_04            ;0D82D4|        |0D8612;
                       dw sympha_SpriteAssemb_0A            ;0D82D6|        |0D862E;
                       dw sympha_SpriteAssemb_0C            ;0D82D8|        |0D863C;
                       dw sympha_SpriteAssemb_0E            ;0D82DA|        |0D8658;
                       dw sympha_SpriteAssemb_10            ;0D82DC|        |0D8666;
                       dw sympha_SpriteAssemb_12            ;0D82DE|        |0D8674;
                       dw sympha_SpriteAssemb_14            ;0D82E0|        |0D8682;
                       dw sympha_SpriteAssemb_16            ;0D82E2|        |0D864A;
                       dw sympha_SpriteAssemb_18            ;0D82E4|        |0D8690;
                       dw sympha_SpriteAssemb_1A            ;0D82E6|        |0D869E;
                       dw sympha_SpriteAssemb_1C            ;0D82E8|        |0D86AC;
                       dw sympha_SpriteAssemb_1E            ;0D82EA|        |0D86BA;
                       dw sympha_SpriteAssemb_20            ;0D82EC|        |0D8700;
                       dw sympha_SpriteAssemb_22            ;0D82EE|        |0D8705;
                       dw sympha_SpriteAssemb_24            ;0D82F0|        |0D86C8;
                       dw sympha_SpriteAssemb_26            ;0D82F2|        |0D86D6;
                       dw sympha_SpriteAssemb_28            ;0D82F4|        |0D86E4;
                       dw sympha_SpriteAssemb_2A            ;0D82F6|        |0D86F2;
                       dw sympha_SpriteAssemb_2C            ;0D82F8|        |0D8737;
                       dw sympha_SpriteAssemb_2E            ;0D82FA|        |0D870D;
                       dw sympha_SpriteAssemb_30            ;0D82FC|        |0D871B;
                       dw sympha_SpriteAssemb_32            ;0D82FE|        |0D8729;
                       dw sympha_SpriteAssemb_34            ;0D8300|        |0D8745;
                       dw sympha_SpriteAssemb_36            ;0D8302|        |0D8756;
                       dw sympha_SpriteAssemb_38            ;0D8304|        |0D8767;
                       dw sympha_SpriteAssemb_3A            ;0D8306|        |0D8778;
                       dw sympha_SpriteAssemb_3C            ;0D8308|        |0D8789;
                       dw sympha_SpriteAssemb_3E            ;0D830A|        |0D878E;
                       dw sympha_SpriteAssemb_40            ;0D830C|        |0D8799;
                       dw sympha_SpriteAssemb_42            ;0D830E|        |0D87AA;
                       dw sympha_SpriteAssemb_44            ;0D8310|        |0D87B8;
                       dw sympha_SpriteAssemb_46            ;0D8312|        |0D87C8;
                       dw sympha_SpriteAssemb_48            ;0D8314|        |0D87CD;
                       dw sympha_SpriteAssemb_4A            ;0D8316|        |0D87D6;
                       dw sympha_SpriteAssemb_4C            ;0D8318|        |0D87DF;
                       dw sympha_SpriteAssemb_4E            ;0D831A|        |0D87E8;
                       dw sympha_SpriteAssemb_50            ;0D831C|        |0D87F1;
                       dw sympha_SpriteAssemb_52            ;0D831E|        |0D87FA;
                       dw sympha_SpriteAssemb_54            ;0D8320|        |0D8802;
                       dw sympha_SpriteAssemb_56            ;0D8322|        |0D87C0;
 
grantSpriteAssembList_02: dw player_spriteAssemb_00            ;0D8324|        |0D83BE;
                       dw grant_spriteAssemb_00             ;0D8326|        |0D880A;
                       dw grant_spriteAssemb_04             ;0D8328|        |0D8818;
                       dw grant_spriteAssemb_06             ;0D832A|        |0D8834;
                       dw grant_spriteAssemb_04             ;0D832C|        |0D8818;
                       dw grant_spriteAssemb_0A             ;0D832E|        |0D8842;
                       dw grant_spriteAssemb_0C             ;0D8330|        |0D8850;
                       dw grant_spriteAssemb_0E             ;0D8332|        |0D886C;
 
                       dw grant_spriteAssemb_10             ;0D8334|        |0D8874;
                       dw grant_spriteAssemb_12             ;0D8336|        |0D8882;
 
                       dw grant_spriteAssemb_14             ;0D8338|        |0D888A;
                       dw grant_spriteAssemb_16             ;0D833A|        |0D885E;
                       dw grant_spriteAssemb_18             ;0D833C|        |0D8895;
                       dw grant_spriteAssemb_1A             ;0D833E|        |0D889D;
                       dw grant_spriteAssemb_1C             ;0D8340|        |0D88AB;
                       dw grant_spriteAssemb_1E             ;0D8342|        |0D88B6;
                       dw grant_spriteAssemb_20             ;0D8344|        |0D88BE;
                       dw grant_spriteAssemb_22             ;0D8346|        |0D88C9;
                       dw grant_spriteAssemb_24             ;0D8348|        |0D88D4;
                       dw grant_spriteAssemb_26             ;0D834A|        |0D88E2;
                       dw grant_spriteAssemb_28             ;0D834C|        |0D899D;
                       dw grant_spriteAssemb_2A             ;0D834E|        |0D88F3;
                       dw grant_spriteAssemb_2C             ;0D8350|        |0D8901;
                       dw grant_spriteAssemb_2E             ;0D8352|        |0D8912;
                       dw grant_spriteAssemb_30             ;0D8354|        |0D8920;
                       dw grant_spriteAssemb_32             ;0D8356|        |0D8931;
                       dw grant_spriteAssemb_34             ;0D8358|        |0D893F;
                       dw grant_spriteAssemb_36             ;0D835A|        |0D8950;
                       dw grant_spriteAssemb_38             ;0D835C|        |0D8958;
                       dw grant_spriteAssemb_3A             ;0D835E|        |0D8966;
                       dw grant_spriteAssemb_3C             ;0D8360|        |0D8971;
                       dw grant_spriteAssemb_3E             ;0D8362|        |0D897C;
                       dw grant_spriteAssemb_40             ;0D8364|        |0D8987;
                       dw grant_spriteAssemb_42             ;0D8366|        |0D8992;
                       dw grant_spriteAssemb_44             ;0D8368|        |0D89AB;
                       dw grant_spriteAssemb_46             ;0D836A|        |0D89C0;
                       dw grant_spriteAssemb_48             ;0D836C|        |0D8826;
                       dw grant_spriteAssemb_4A             ;0D836E|        |0D89CE;
                       dw grant_spriteAssemb_4C             ;0D8370|        |0D89E3;
                       dw grant_spriteAssemb_4E             ;0D8372|        |0D89F1;
                       dw grant_spriteAssemb_50             ;0D8374|        |0D8A06;
                       dw grant_spriteAssemb_52             ;0D8376|        |0D8A14;
 
alucardSpriteAssemb_03: dw player_spriteAssemb_00            ;0D8378|        |0D83BE;
                       dw alucard_spriteAssemb_01           ;0D837A|        |0D8A29;
                       dw alucard_spriteAssemb_04           ;0D837C|        |0D8A3A;
                       dw alucard_spriteAssemb_06           ;0D837E|        |0D8A4B;
                       dw alucard_spriteAssemb_04           ;0D8380|        |0D8A3A;
                       dw alucard_spriteAssemb_0A           ;0D8382|        |0D8A5C;
 
                       dw alucard_spriteAssemb_0C           ;0D8384|        |0D8A6D;
                       dw alucard_spriteAssemb_0E           ;0D8386|        |0D8ACE;
                       dw alucard_spriteAssemb_10           ;0D8388|        |0D8B15;
                       dw alucard_spriteAssemb_12           ;0D838A|        |0D8B23;
                       dw alucard_spriteAssemb_14           ;0D838C|        |0D8B31;
                       dw alucard_spriteAssemb_16           ;0D838E|        |0D8AC0;
                       dw alucard_spriteAssemb_18           ;0D8390|        |0D8A7E;
                       dw alucard_spriteAssemb_1A           ;0D8392|        |0D8A8F;
                       dw alucard_spriteAssemb_1C           ;0D8394|        |0D8AA9;
                       dw alucard_spriteAssemb_1E           ;0D8396|        |0D8ADC;
 
                       dw alucard_spriteAssemb_20           ;0D8398|        |0D8AEA;
                       dw alucard_spriteAssemb_22           ;0D839A|        |0D8B01;
                       dw alucard_spriteAssemb_24           ;0D839C|        |0D8B3F;
                       dw alucard_spriteAssemb_26           ;0D839E|        |0D8B47;
                       dw alucard_spriteAssemb_28           ;0D83A0|        |0D8B4F;
                       dw alucard_spriteAssemb_2A           ;0D83A2|        |0D8B57;
                       dw alucard_spriteAssemb_2C           ;0D83A4|        |0D8B6B;
 
                       dw alucard_spriteAssemb_2E           ;0D83A6|        |0D8B82;
 
                       dw alucard_spriteAssemb_30           ;0D83A8|        |0D8B90;
                       dw alucard_spriteAssemb_32           ;0D83AA|        |0D8B9E;
                       dw alucard_spriteAssemb_34           ;0D83AC|        |0D8BBA;
                       dw alucard_spriteAssemb_32           ;0D83AE|        |0D8B9E;
                       dw alucard_spriteAssemb_30           ;0D83B0|        |0D8B90;
                       dw alucard_spriteAssemb_2E           ;0D83B2|        |0D8B82;
 
                       dw alucard_spriteAssemb_2C           ;0D83B4|        |0D8B6B;
                       dw alucard_spriteAssemb_2A           ;0D83B6|        |0D8B57;
                       dw alucard_spriteAssemb_40           ;0D83B8|        |0D8BD6;
                       dw alucard_spriteAssemb_42           ;0D83BA|        |0D8BDB;
 
                       dw alucard_spriteAssemb_44           ;0D83BC|        |0D8BE0;
 
player_spriteAssemb_00: db $02,$00,$E0,$02,$F8,$00,$E0,$42   ;0D83BE|        |      ;
                       db $00                               ;0D83C6|        |      ;
 
trevorSpriteAssemb_68: db $03,$00,$E2,$02,$F4,$01,$E4,$FC   ;0D83C7|        |      ;
                       db $01,$E6,$04                       ;0D83CF|        |      ;
 
trevorSpriteAssemb_6A: db $04,$00,$E8,$02,$F0,$01,$EA,$F8   ;0D83D2|        |      ;
                       db $01,$EC,$00,$01,$EE,$08           ;0D83DA|        |      ;
 
trevorSpriteAssemb_6C: db $03,$00,$F0,$02,$F4,$01,$F2,$FC   ;0D83E0|        |      ;
                       db $01,$F4,$04                       ;0D83E8|        |      ;
 
trevorSpriteAssemb_6E: db $04,$E0,$F6,$02,$F5,$E1,$F8,$FD   ;0D83EB|        |      ;
                       db $01,$FA,$F8,$01,$FC,$00           ;0D83F3|        |      ;
 
trevorSpriteAssemb_62: db $02,$F0,$5F,$01,$F8,$F0,$5F,$41   ;0D83F9|        |      ;
                       db $00                               ;0D8401|        |      ;
 
trevorSpriteAssemb_02: db $04,$E0,$00,$00,$F8,$E1,$02,$00   ;0D8402|        |      ;
                       db $01,$04,$F8,$01,$06,$00           ;0D840A|        |      ;
 
trevorSpriteAssemb_04: db $03,$E0,$08,$00,$F8,$E1,$0A,$00   ;0D8410|        |      ;
                       db $01,$0C,$FB                       ;0D8418|        |      ;
 
trevorSpriteAssemb_06: db $04,$E0,$0E,$00,$F8,$E1,$10,$00   ;0D841B|        |      ;
                       db $01,$12,$F8,$01,$14,$00           ;0D8423|        |      ;
 
trevorSpriteAssemb_0A: db $04,$E0,$0E,$00,$F8,$E1,$10,$00   ;0D8429|        |      ;
                       db $01,$12,$F8,$01,$18,$00           ;0D8431|        |      ;
 
trevorSpriteAssemb_0C: db $04,$E0,$0E,$00,$F8,$E1,$10,$00   ;0D8437|        |      ;
                       db $01,$16,$F8,$01,$14,$00           ;0D843F|        |      ;
 
trevorSpriteAssemb_16: db $04,$E8,$00,$00,$F8,$E9,$02,$00   ;0D8445|        |      ;
                       db $09,$16,$F8,$09,$18,$00           ;0D844D|        |      ;
 
trevorSpriteAssemb_0E: db $04,$F0,$00,$00,$F8,$F1,$02,$00   ;0D8453|        |      ;
                       db $11,$16,$F8,$11,$18,$00           ;0D845B|        |      ;
 
trevorSpriteAssemb_18: db $04,$E0,$1A,$00,$F9,$E1,$1C,$01   ;0D8461|        |      ;
                       db $E1,$1E,$09,$01,$0C,$FF           ;0D8469|        |      ;
 
trevorSpriteAssemb_1A: db $04,$E0,$20,$00,$F8,$E1,$22,$00   ;0D846F|        |      ;
                       db $01,$12,$F8,$01,$14,$00           ;0D8477|        |      ;
 
trevorSpriteAssemb_1C: db $05,$E0,$24,$00,$F0,$E1,$26,$F8   ;0D847D|        |      ;
                       db $E1,$28,$00,$01,$04,$F8,$01,$06   ;0D8485|        |      ;
                       db $00                               ;0D848D|        |      ;
 
trevorSpriteAssemb_1E: db $05,$F0,$1A,$00,$F8,$F1,$1C,$00   ;0D848E|        |      ;
                       db $F1,$1E,$08,$11,$16,$F8,$11,$18   ;0D8496|        |      ;
                       db $00                               ;0D849E|        |      ;
 
trevorSpriteAssemb_20: db $04,$F0,$20,$00,$F8,$F1,$22,$00   ;0D849F|        |      ;
                       db $11,$16,$F8,$11,$18,$00           ;0D84A7|        |      ;
 
trevorSpriteAssemb_22: db $05,$F0,$24,$00,$F0,$F1,$26,$F8   ;0D84AD|        |      ;
                       db $F1,$28,$00,$11,$16,$F8,$11,$18   ;0D84B5|        |      ;
                       db $00                               ;0D84BD|        |      ;
 
trevorSpriteAssemb_34: db $05,$E0,$1A,$00,$F8,$E1,$1C,$00   ;0D84BE|        |      ;
                       db $E1,$1E,$08,$01,$12,$F8,$01,$18   ;0D84C6|        |      ;
                       db $00                               ;0D84CE|        |      ;
 
trevorSpriteAssemb_36: db $04,$E0,$20,$00,$F8,$E1,$22,$00   ;0D84CF|        |      ;
                       db $01,$12,$F8,$01,$18,$00           ;0D84D7|        |      ;
 
trevorSpriteAssemb_38: db $05,$E0,$24,$00,$F0,$E1,$26,$F8   ;0D84DD|        |      ;
                       db $E1,$28,$00,$01,$12,$F8,$01,$18   ;0D84E5|        |      ;
                       db $00                               ;0D84ED|        |      ;
 
trevorSpriteAssemb_3A: db $05,$E0,$1A,$00,$F8,$E1,$1C,$00   ;0D84EE|        |      ;
                       db $E1,$1E,$08,$01,$16,$F8,$01,$14   ;0D84F6|        |      ;
                       db $00                               ;0D84FE|        |      ;
 
trevorSpriteAssemb_3C: db $04,$E0,$20,$00,$F8,$E1,$22,$00   ;0D84FF|        |      ;
                       db $01,$16,$F8,$01,$14,$00           ;0D8507|        |      ;
 
trevorSpriteAssemb_3E: db $05,$E0,$24,$00,$F0,$E1,$26,$F8   ;0D850D|        |      ;
                       db $E1,$28,$00,$01,$16,$F8,$01,$14   ;0D8515|        |      ;
                       db $00                               ;0D851D|        |      ;
 
trevorSpriteAssemb_10: db $04,$E0,$2A,$00,$FA,$E1,$2C,$02   ;0D851E|        |      ;
                       db $01,$2E,$F8,$01,$18,$00           ;0D8526|        |      ;
 
trevorSpriteAssemb_12: db $04,$E0,$2A,$00,$F7,$E1,$2C,$FF   ;0D852C|        |      ;
                       db $01,$16,$F8,$01,$18,$00           ;0D8534|        |      ;
 
trevorSpriteAssemb_14: db $04,$00,$30,$00,$E8,$01,$32,$F0   ;0D853A|        |      ;
                       db $01,$34,$F8,$01,$36,$00           ;0D8542|        |      ;
 
trevorSpriteAssemb_24: db $02,$E0,$38,$01,$10,$01,$3A,$10   ;0D8548|        |      ;
 
trevorSpriteAssemb_26: db $02,$E0,$3E,$01,$08,$E5,$40,$10   ;0D8550|        |      ;
 
trevorSpriteAssemb_28: db $03,$F0,$42,$01,$D8,$F1,$44,$E0   ;0D8558|        |      ;
                       db $F1,$44,$E8                       ;0D8560|        |      ;
 
trevorSpriteAssemb_2A: db $02,$E0,$38,$01,$10,$01,$3C,$10   ;0D8563|        |      ;
 
trevorSpriteAssemb_2C: db $02,$E0,$46,$00,$10,$01,$48,$10   ;0D856B|        |      ;
 
trevorSpriteAssemb_2E: db $02,$E0,$4C,$00,$08,$E5,$4E,$10   ;0D8573|        |      ;
 
trevorSpriteAssemb_30: db $03,$F0,$50,$00,$D8,$F1,$52,$E0   ;0D857B|        |      ;
                       db $F1,$52,$E8                       ;0D8583|        |      ;
 
trevorSpriteAssemb_32: db $05,$F0,$50,$00,$C8,$F1,$52,$D0   ;0D8586|        |      ;
                       db $F1,$52,$D8,$F1,$52,$E0,$F1,$52   ;0D858E|        |      ;
                       db $E8                               ;0D8596|        |      ;
 
trevorSpriteAssemb_40: db $02,$F0,$54,$01,$F8,$F0,$54,$41   ;0D8597|        |      ;
                       db $00                               ;0D859F|        |      ;
 
trevorSpriteAssemb_42: db $02,$F0,$56,$01,$F8,$F1,$58,$00   ;0D85A0|        |      ;
 
trevorSpriteAssemb_44: db $02,$F0,$58,$41,$F8,$F1,$56,$00   ;0D85A8|        |      ;
 
trevorSpriteAssemb_46: db $02,$F0,$78,$01,$F8,$F1,$7A,$00   ;0D85B0|        |      ;
 
trevorSpriteAssemb_48: db $02,$F0,$7A,$41,$F8,$F1,$78,$00   ;0D85B8|        |      ;
 
trevorSpriteAssemb_4A: db $02,$F0,$7A,$C1,$F8,$F1,$78,$00   ;0D85C0|        |      ;
 
trevorSpriteAssemb_4C: db $02,$F0,$78,$81,$F8,$F1,$7A,$00   ;0D85C8|        |      ;
 
trevorSpriteAssemb_4E: db $02,$F0,$7C,$81,$F8,$F1,$7E,$00   ;0D85D0|        |      ;
 
trevorSpriteAssemb_64: db $01,$F0,$62,$01,$FC               ;0D85D8|        |      ;
 
trevorSpriteAssemb_50: db $02,$F0,$66,$01,$F8,$F1,$68,$00   ;0D85DD|        |      ;
 
trevorSpriteAssemb_52: db $01,$F0,$5A,$01,$FC               ;0D85E5|        |      ;
 
trevorSpriteAssemb_54: db $02,$F0,$21,$01,$F8,$F1,$23,$00   ;0D85EA|        |      ;
 
trevorSpriteAssemb_5E: db $02,$F0,$15,$03,$F8,$F0,$15,$43   ;0D85F2|        |      ;
                       db $00                               ;0D85FA|        |      ;
 
trevorSpriteAssemb_60: db $02,$F0,$17,$03,$F8,$F0,$17,$43   ;0D85FB|        |      ;
                       db $00                               ;0D8603|        |      ;
 
sympha_SpriteAssemb_02: db $04,$E0,$00,$00,$F8,$E1,$02,$00   ;0D8604|        |      ;
                       db $01,$04,$F8,$01,$06,$00           ;0D860C|        |      ;
 
sympha_SpriteAssemb_04: db $04,$E0,$08,$00,$F8,$E1,$0A,$00   ;0D8612|        |      ;
                       db $01,$0C,$F8,$01,$0E,$00           ;0D861A|        |      ;
 
sympha_SpriteAssemb_06: db $04,$E0,$10,$00,$F8,$E1,$12,$00   ;0D8620|        |      ;
                       db $01,$14,$F8,$01,$16,$00           ;0D8628|        |      ;
 
sympha_SpriteAssemb_0A: db $04,$E0,$10,$00,$F8,$E1,$12,$00   ;0D862E|        |      ;
                       db $01,$56,$F8,$01,$48,$00           ;0D8636|        |      ;
 
sympha_SpriteAssemb_0C: db $04,$E0,$10,$00,$F8,$E1,$12,$00   ;0D863C|        |      ;
                       db $01,$46,$F8,$01,$52,$00           ;0D8644|        |      ;
 
sympha_SpriteAssemb_16: db $04,$E8,$10,$00,$F8,$E9,$44,$00   ;0D864A|        |      ;
                       db $09,$46,$F8,$09,$48,$00           ;0D8652|        |      ;
 
sympha_SpriteAssemb_0E: db $04,$F0,$10,$00,$F8,$F1,$44,$00   ;0D8658|        |      ;
                       db $11,$46,$F8,$11,$48,$00           ;0D8660|        |      ;
 
sympha_SpriteAssemb_10: db $04,$E0,$5C,$00,$F7,$E1,$5E,$FF   ;0D8666|        |      ;
                       db $01,$46,$F8,$01,$48,$00           ;0D866E|        |      ;
 
sympha_SpriteAssemb_12: db $04,$E0,$5C,$00,$F7,$E1,$5E,$FF   ;0D8674|        |      ;
                       db $01,$46,$F8,$01,$48,$00           ;0D867C|        |      ;
 
sympha_SpriteAssemb_14: db $04,$F0,$60,$00,$E8,$F1,$62,$F0   ;0D8682|        |      ;
                       db $F1,$64,$F8,$F1,$66,$00           ;0D868A|        |      ;
 
sympha_SpriteAssemb_18: db $04,$E0,$1E,$00,$F8,$E1,$0A,$00   ;0D8690|        |      ;
                       db $01,$0C,$F8,$01,$0E,$00           ;0D8698|        |      ;
 
sympha_SpriteAssemb_1A: db $04,$E0,$20,$00,$F7,$E1,$12,$FF   ;0D869E|        |      ;
                       db $01,$22,$F8,$01,$16,$00           ;0D86A6|        |      ;
 
sympha_SpriteAssemb_1C: db $04,$F0,$4A,$00,$F9,$F1,$12,$01   ;0D86AC|        |      ;
                       db $11,$46,$F8,$11,$48,$00           ;0D86B4|        |      ;
 
sympha_SpriteAssemb_1E: db $04,$F0,$20,$00,$F7,$F1,$12,$FF   ;0D86BA|        |      ;
                       db $11,$46,$F8,$11,$48,$00           ;0D86C2|        |      ;
 
sympha_SpriteAssemb_24: db $04,$E0,$4A,$00,$F9,$E1,$12,$01   ;0D86C8|        |      ;
                       db $01,$56,$F8,$01,$48,$00           ;0D86D0|        |      ;
 
sympha_SpriteAssemb_26: db $04,$E0,$20,$00,$F7,$E1,$12,$FF   ;0D86D6|        |      ;
                       db $01,$56,$F8,$01,$48,$00           ;0D86DE|        |      ;
 
sympha_SpriteAssemb_28: db $04,$E0,$4A,$00,$F9,$E1,$12,$01   ;0D86E4|        |      ;
                       db $01,$46,$F8,$01,$52,$00           ;0D86EC|        |      ;
 
sympha_SpriteAssemb_2A: db $04,$E0,$20,$00,$F7,$E1,$12,$FF   ;0D86F2|        |      ;
                       db $01,$46,$F8,$01,$52,$00           ;0D86FA|        |      ;
 
sympha_SpriteAssemb_20: db $01,$D0,$18,$01,$F9               ;0D8700|        |      ;
 
sympha_SpriteAssemb_22: db $02,$E0,$1A,$01,$E7,$E5,$1C,$EF   ;0D8705|        |      ;
 
sympha_SpriteAssemb_2E: db $04,$F0,$24,$00,$F8,$F1,$26,$00   ;0D870D|        |      ;
                       db $11,$46,$F8,$11,$4C,$00           ;0D8715|        |      ;
 
sympha_SpriteAssemb_30: db $04,$E0,$24,$00,$F8,$E1,$26,$00   ;0D871B|        |      ;
                       db $01,$58,$F8,$01,$4C,$00           ;0D8723|        |      ;
 
sympha_SpriteAssemb_32: db $04,$E0,$24,$00,$F8,$E1,$26,$00   ;0D8729|        |      ;
                       db $01,$46,$F8,$01,$54,$00           ;0D8731|        |      ;
 
sympha_SpriteAssemb_2C: db $04,$E0,$24,$00,$F8,$E1,$26,$00   ;0D8737|        |      ;
                       db $01,$22,$F8,$01,$28,$00           ;0D873F|        |      ;
 
sympha_SpriteAssemb_34: db $05,$F0,$2A,$00,$F0,$E1,$2C,$F8   ;0D8745|        |      ;
                       db $E1,$02,$00,$01,$2E,$F8,$01,$06   ;0D874D|        |      ;
                       db $00                               ;0D8755|        |      ;
 
sympha_SpriteAssemb_36: db $05,$F0,$2A,$00,$F0,$E1,$2C,$F8   ;0D8756|        |      ;
                       db $E1,$02,$00,$01,$4E,$F8,$01,$50   ;0D875E|        |      ;
                       db $00                               ;0D8766|        |      ;
 
sympha_SpriteAssemb_38: db $05,$F0,$2A,$00,$F0,$E1,$2C,$F8   ;0D8767|        |      ;
                       db $E1,$12,$00,$01,$5A,$F8,$01,$50   ;0D876F|        |      ;
                       db $00                               ;0D8777|        |      ;
 
sympha_SpriteAssemb_3A: db $05,$F0,$2A,$00,$F0,$E1,$2C,$F8   ;0D8778|        |      ;
                       db $E1,$12,$00,$01,$4E,$F8,$01,$06   ;0D8780|        |      ;
                       db $00                               ;0D8788|        |      ;
 
sympha_SpriteAssemb_3C: db $01,$F0,$30,$00,$FC               ;0D8789|        |      ;
 
sympha_SpriteAssemb_3E: db $03,$F0,$32,$03,$F4,$F1,$34,$FC   ;0D878E|        |      ;
                       db $F1,$36,$04                       ;0D8796|        |      ;
 
sympha_SpriteAssemb_40: db $05,$F0,$32,$03,$EC,$F1,$3A,$F4   ;0D8799|        |      ;
                       db $F1,$3A,$FC,$F1,$3A,$04,$F1,$36   ;0D87A1|        |      ;
                       db $0C                               ;0D87A9|        |      ;
 
sympha_SpriteAssemb_42: db $04,$F0,$38,$03,$F0,$F1,$3A,$F8   ;0D87AA|        |      ;
                       db $F1,$3A,$00,$F1,$36,$08           ;0D87B2|        |      ;
 
sympha_SpriteAssemb_44: db $02,$F0,$3C,$03,$F8,$F1,$3E,$00   ;0D87B8|        |      ;
 
sympha_SpriteAssemb_56: db $02,$F0,$40,$03,$F8,$F1,$42,$00   ;0D87C0|        |      ;
 
sympha_SpriteAssemb_46: db $01,$F0,$6E,$00,$FC               ;0D87C8|        |      ;
 
sympha_SpriteAssemb_48: db $02,$F0,$68,$00,$F8,$F0,$68,$C0   ;0D87CD|        |      ;
                       db $00                               ;0D87D5|        |      ;
 
sympha_SpriteAssemb_4A: db $02,$F0,$6A,$00,$F8,$F0,$6A,$C0   ;0D87D6|        |      ;
                       db $00                               ;0D87DE|        |      ;
 
sympha_SpriteAssemb_4C: db $02,$F0,$6C,$00,$F8,$F0,$6C,$C0   ;0D87DF|        |      ;
                       db $00                               ;0D87E7|        |      ;
 
sympha_SpriteAssemb_4E: db $02,$F0,$70,$00,$F8,$F0,$70,$40   ;0D87E8|        |      ;
                       db $00                               ;0D87F0|        |      ;
 
sympha_SpriteAssemb_50: db $02,$F0,$72,$00,$F8,$F0,$72,$40   ;0D87F1|        |      ;
                       db $00                               ;0D87F9|        |      ;
 
sympha_SpriteAssemb_52: db $02,$F0,$B1,$00,$F8,$F1,$B3,$00   ;0D87FA|        |      ;
 
sympha_SpriteAssemb_54: db $02,$F0,$B5,$00,$F8,$F1,$B7,$00   ;0D8802|        |      ;
 
grant_spriteAssemb_00: db $04,$E0,$00,$00,$F4,$E1,$02,$FC   ;0D880A|        |      ;
                       db $01,$04,$F8,$01,$06,$00           ;0D8812|        |      ;
 
grant_spriteAssemb_04: db $04,$E0,$08,$00,$F5,$E1,$0A,$FD   ;0D8818|        |      ;
                       db $01,$0C,$F8,$01,$0E,$00           ;0D8820|        |      ;
 
grant_spriteAssemb_48: db $04,$D8,$08,$00,$F5,$D9,$0A,$FD   ;0D8826|        |      ;
                       db $F9,$0C,$F8,$F9,$0E,$00           ;0D882E|        |      ;
 
grant_spriteAssemb_06: db $04,$E0,$10,$00,$F4,$E1,$12,$FC   ;0D8834|        |      ;
                       db $01,$14,$F8,$01,$16,$00           ;0D883C|        |      ;
 
grant_spriteAssemb_0A: db $04,$D8,$00,$00,$F8,$D9,$02,$00   ;0D8842|        |      ;
                       db $F9,$2A,$F8,$F9,$2C,$00           ;0D884A|        |      ;
 
grant_spriteAssemb_0C: db $04,$D8,$00,$00,$F6,$D9,$02,$FE   ;0D8850|        |      ;
                       db $F9,$26,$F8,$F9,$28,$00           ;0D8858|        |      ;
 
grant_spriteAssemb_16: db $04,$E0,$00,$00,$F6,$E1,$02,$FE   ;0D885E|        |      ;
                       db $01,$6C,$F8,$01,$6E,$00           ;0D8866|        |      ;
 
grant_spriteAssemb_0E: db $02,$F8,$40,$80,$F8,$F9,$42,$00   ;0D886C|        |      ;
 
grant_spriteAssemb_10: db $04,$E2,$64,$00,$F8,$E3,$02,$00   ;0D8874|        |      ;
                       db $01,$2A,$F8,$01,$2C,$00           ;0D887C|        |      ;
 
grant_spriteAssemb_12: db $02,$F0,$40,$80,$F8,$F1,$42,$00   ;0D8882|        |      ;
 
grant_spriteAssemb_14: db $03,$F0,$66,$00,$F0,$F1,$68,$F8   ;0D888A|        |      ;
                       db $F1,$6A,$00                       ;0D8892|        |      ;
 
grant_spriteAssemb_18: db $02,$F0,$2E,$00,$F8,$F1,$30,$00   ;0D8895|        |      ;
 
grant_spriteAssemb_1A: db $04,$F0,$32,$00,$F8,$F1,$34,$00   ;0D889D|        |      ;
                       db $11,$36,$F8,$11,$38,$00           ;0D88A5|        |      ;
 
grant_spriteAssemb_1C: db $03,$F0,$3A,$00,$F8,$F1,$3C,$00   ;0D88AB|        |      ;
                       db $F1,$3E,$08                       ;0D88B3|        |      ;
 
grant_spriteAssemb_1E: db $02,$F0,$40,$00,$F8,$F1,$42,$00   ;0D88B6|        |      ;
 
grant_spriteAssemb_20: db $03,$F0,$44,$00,$F0,$F1,$46,$F8   ;0D88BE|        |      ;
                       db $F1,$48,$00                       ;0D88C6|        |      ;
 
grant_spriteAssemb_22: db $03,$F0,$4A,$00,$F8,$F1,$4E,$00   ;0D88C9|        |      ;
                       db $11,$4C,$F8                       ;0D88D1|        |      ;
 
grant_spriteAssemb_24: db $04,$E0,$18,$00,$F9,$E1,$1A,$01   ;0D88D4|        |      ;
                       db $01,$14,$F8,$01,$16,$00           ;0D88DC|        |      ;
 
grant_spriteAssemb_26: db $05,$E0,$1C,$00,$EE,$E1,$1E,$F6   ;0D88E2|        |      ;
                       db $E1,$20,$FE,$01,$0C,$F8,$01,$0E   ;0D88EA|        |      ;
                       db $00                               ;0D88F2|        |      ;
 
grant_spriteAssemb_2A: db $04,$DA,$18,$00,$FB,$DB,$1A,$03   ;0D88F3|        |      ;
                       db $F9,$2A,$F8,$F9,$2C,$00           ;0D88FB|        |      ;
 
grant_spriteAssemb_2C: db $05,$DA,$1C,$00,$EF,$DB,$1E,$F7   ;0D8901|        |      ;
                       db $DB,$20,$FF,$F9,$2A,$F8,$F9,$2C   ;0D8909|        |      ;
                       db $00                               ;0D8911|        |      ;
 
grant_spriteAssemb_2E: db $04,$DA,$18,$00,$F9,$DB,$1A,$01   ;0D8912|        |      ;
                       db $F9,$26,$F8,$F9,$28,$00           ;0D891A|        |      ;
 
grant_spriteAssemb_30: db $05,$DA,$1C,$00,$EE,$DB,$1E,$F6   ;0D8920|        |      ;
                       db $DB,$20,$FE,$F9,$26,$F8,$F9,$28   ;0D8928|        |      ;
                       db $00                               ;0D8930|        |      ;
 
grant_spriteAssemb_32: db $04,$E8,$18,$00,$FC,$E9,$1A,$04   ;0D8931|        |      ;
                       db $09,$22,$F8,$09,$24,$00           ;0D8939|        |      ;
 
grant_spriteAssemb_34: db $05,$E8,$1C,$00,$EE,$E9,$1E,$F6   ;0D893F|        |      ;
                       db $E9,$20,$FE,$09,$22,$F8,$09,$24   ;0D8947|        |      ;
                       db $00                               ;0D894F|        |      ;
 
grant_spriteAssemb_36: db $02,$F0,$2E,$80,$F8,$F1,$30,$00   ;0D8950|        |      ;
 
grant_spriteAssemb_38: db $04,$D0,$36,$80,$F8,$D1,$38,$00   ;0D8958|        |      ;
                       db $F1,$32,$F8,$F1,$34,$00           ;0D8960|        |      ;
 
grant_spriteAssemb_3A: db $03,$F0,$3A,$80,$F8,$F1,$3C,$00   ;0D8966|        |      ;
                       db $F1,$3E,$08                       ;0D896E|        |      ;
 
grant_spriteAssemb_3C: db $03,$E0,$50,$00,$F8,$01,$52,$F8   ;0D8971|        |      ;
                       db $01,$54,$00                       ;0D8979|        |      ;
 
grant_spriteAssemb_3E: db $03,$E0,$52,$80,$F8,$E1,$54,$00   ;0D897C|        |      ;
                       db $01,$50,$F8                       ;0D8984|        |      ;
 
grant_spriteAssemb_40: db $03,$E0,$56,$00,$F8,$F1,$58,$00   ;0D8987|        |      ;
                       db $F1,$5A,$08                       ;0D898F|        |      ;
 
grant_spriteAssemb_42: db $03,$F0,$58,$80,$00,$F1,$5A,$08   ;0D8992|        |      ;
                       db $01,$56,$F8                       ;0D899A|        |      ;
 
grant_spriteAssemb_28: db $04,$E0,$5C,$00,$F8,$E1,$5E,$00   ;0D899D|        |      ;
                       db $01,$14,$F8,$01,$16,$00           ;0D89A5|        |      ;
 
grant_spriteAssemb_44: db $06,$E4,$60,$01,$E4,$E0,$1C,$00   ;0D89AB|        |      ;
                       db $EC,$E1,$1E,$F4,$E1,$20,$FC,$01   ;0D89B3|        |      ;
                       db $14,$F8,$01,$16,$00               ;0D89BB|        |      ;
 
grant_spriteAssemb_46: db $04,$E8,$5C,$00,$FC,$E9,$5E,$04   ;0D89C0|        |      ;
                       db $09,$22,$F8,$09,$24,$00           ;0D89C8|        |      ;
 
grant_spriteAssemb_4A: db $06,$EE,$60,$01,$E6,$EA,$1C,$00   ;0D89CE|        |      ;
                       db $EE,$EB,$1E,$F6,$EB,$20,$FE,$09   ;0D89D6|        |      ;
                       db $22,$F8,$09,$24,$00               ;0D89DE|        |      ;
 
grant_spriteAssemb_4C: db $04,$D8,$5C,$00,$FA,$D9,$5E,$02   ;0D89E3|        |      ;
                       db $F9,$26,$F8,$F9,$28,$00           ;0D89EB|        |      ;
 
grant_spriteAssemb_4E: db $06,$DC,$60,$01,$E6,$D8,$1C,$00   ;0D89F1|        |      ;
                       db $EE,$D9,$1E,$F6,$D9,$20,$FE,$F9   ;0D89F9|        |      ;
                       db $26,$F8,$F9,$28,$00               ;0D8A01|        |      ;
 
grant_spriteAssemb_50: db $04,$D8,$5C,$00,$FA,$D9,$5E,$02   ;0D8A06|        |      ;
                       db $F9,$2A,$F8,$F9,$2C,$00           ;0D8A0E|        |      ;
 
grant_spriteAssemb_52: db $06,$DC,$60,$01,$E6,$D8,$1C,$00   ;0D8A14|        |      ;
                       db $EE,$D9,$1E,$F6,$D9,$20,$FE,$F9   ;0D8A1C|        |      ;
                       db $2A,$F8,$F9,$2C,$00               ;0D8A24|        |      ;
 
alucard_spriteAssemb_01: db $05,$C0,$00,$00,$FC,$E1,$02,$F8   ;0D8A29|        |      ;
                       db $E1,$04,$00,$01,$06,$F9,$01,$08   ;0D8A31|        |      ;
                       db $01                               ;0D8A39|        |      ;
 
alucard_spriteAssemb_04: db $05,$C0,$0A,$00,$FC,$E1,$0C,$F8   ;0D8A3A|        |      ;
                       db $E1,$0E,$00,$01,$10,$F8,$01,$12   ;0D8A42|        |      ;
                       db $00                               ;0D8A4A|        |      ;
 
alucard_spriteAssemb_06: db $05,$C0,$00,$00,$FC,$E1,$14,$F8   ;0D8A4B|        |      ;
                       db $E1,$16,$00,$01,$18,$F9,$01,$1A   ;0D8A53|        |      ;
                       db $01                               ;0D8A5B|        |      ;
 
alucard_spriteAssemb_0A: db $05,$C0,$00,$00,$FC,$E1,$02,$F8   ;0D8A5C|        |      ;
                       db $E1,$04,$00,$01,$06,$F9,$01,$1C   ;0D8A64|        |      ;
                       db $01                               ;0D8A6C|        |      ;
 
alucard_spriteAssemb_0C: db $05,$C0,$00,$00,$FC,$E1,$14,$F8   ;0D8A6D|        |      ;
                       db $E1,$16,$00,$01,$1E,$F9,$01,$1A   ;0D8A75|        |      ;
                       db $01                               ;0D8A7D|        |      ;
 
alucard_spriteAssemb_18: db $05,$C0,$00,$00,$FB,$E1,$20,$F4   ;0D8A7E|        |      ;
                       db $E1,$22,$FC,$01,$24,$F8,$01,$26   ;0D8A86|        |      ;
                       db $00                               ;0D8A8E|        |      ;
 
alucard_spriteAssemb_1A: db $08,$C0,$00,$00,$FC,$E1,$02,$F8   ;0D8A8F|        |      ;
                       db $E1,$28,$00,$E1,$2A,$08,$01,$06   ;0D8A97|        |      ;
                       db $F9,$01,$2C,$00,$01,$2E,$08,$EB   ;0D8A9F|        |      ;
                       db $30,$10                           ;0D8AA7|        |      ;
 
alucard_spriteAssemb_1C: db $07,$C0,$00,$00,$FC,$E1,$02,$F8   ;0D8AA9|        |      ;
                       db $E1,$32,$00,$E1,$34,$08,$01,$06   ;0D8AB1|        |      ;
                       db $F9,$01,$2C,$00,$01,$2E,$08       ;0D8AB9|        |      ;
 
alucard_spriteAssemb_16: db $04,$E8,$38,$00,$F8,$E9,$3A,$00   ;0D8AC0|        |      ;
                       db $09,$3C,$F8,$09,$3E,$00           ;0D8AC8|        |      ;
 
alucard_spriteAssemb_0E: db $04,$F0,$38,$00,$F8,$F1,$3A,$00   ;0D8ACE|        |      ;
                       db $11,$3C,$F8,$11,$3E,$00           ;0D8AD6|        |      ;
 
alucard_spriteAssemb_1E: db $04,$F0,$40,$00,$F8,$F1,$42,$00   ;0D8ADC|        |      ;
                       db $11,$44,$F8,$11,$46,$00           ;0D8AE4|        |      ;
 
alucard_spriteAssemb_20: db $07,$F0,$38,$00,$F8,$F1,$48,$00   ;0D8AEA|        |      ;
                       db $F1,$2A,$08,$11,$3C,$F8,$11,$4A   ;0D8AF2|        |      ;
                       db $00,$11,$2E,$08,$F9,$30,$10       ;0D8AFA|        |      ;
 
alucard_spriteAssemb_22: db $06,$F0,$38,$00,$F8,$F1,$48,$00   ;0D8B01|        |      ;
                       db $F1,$34,$08,$11,$3C,$F8,$11,$4A   ;0D8B09|        |      ;
                       db $00,$11,$36,$08                   ;0D8B11|        |      ;
 
alucard_spriteAssemb_10: db $04,$E0,$4C,$00,$FB,$E1,$4E,$03   ;0D8B15|        |      ;
                       db $01,$50,$F8,$01,$52,$00           ;0D8B1D|        |      ;
 
alucard_spriteAssemb_12: db $04,$E0,$4C,$00,$F8,$E1,$4E,$00   ;0D8B23|        |      ;
                       db $01,$36,$F8,$01,$3E,$00           ;0D8B2B|        |      ;
 
alucard_spriteAssemb_14: db $04,$00,$54,$00,$E8,$01,$56,$F0   ;0D8B31|        |      ;
                       db $01,$58,$F8,$01,$5A,$00           ;0D8B39|        |      ;
 
alucard_spriteAssemb_24: db $02,$F0,$60,$00,$F8,$F1,$62,$00   ;0D8B3F|        |      ;
 
alucard_spriteAssemb_26: db $02,$F6,$64,$00,$F8,$F7,$66,$00   ;0D8B47|        |      ;
 
alucard_spriteAssemb_28: db $02,$FC,$68,$00,$F8,$FD,$6A,$00   ;0D8B4F|        |      ;
 
alucard_spriteAssemb_2A: db $06,$F0,$38,$00,$F8,$F1,$48,$00   ;0D8B57|        |      ;
                       db $F1,$34,$08,$11,$3C,$F8,$11,$4A   ;0D8B5F|        |      ;
                       db $00,$11,$36,$08                   ;0D8B67|        |      ;
 
alucard_spriteAssemb_2C: db $07,$F0,$38,$00,$F8,$F1,$48,$00   ;0D8B6B|        |      ;
                       db $F1,$2A,$08,$11,$3C,$F8,$11,$4A   ;0D8B73|        |      ;
                       db $00,$11,$2E,$08,$F9,$30,$10       ;0D8B7B|        |      ;
 
alucard_spriteAssemb_2E: db $04,$F0,$40,$00,$F8,$F1,$42,$00   ;0D8B82|        |      ;
                       db $11,$44,$F8,$11,$46,$00           ;0D8B8A|        |      ;
 
alucard_spriteAssemb_30: db $04,$00,$6C,$01,$F8,$01,$6E,$00   ;0D8B90|        |      ;
                       db $F1,$40,$F8,$F1,$42,$00           ;0D8B98|        |      ;
 
alucard_spriteAssemb_32: db $08,$E0,$72,$01,$F8,$E1,$76,$00   ;0D8B9E|        |      ;
                       db $01,$74,$F8,$01,$78,$00,$E1,$70   ;0D8BA6|        |      ;
                       db $F0,$F0,$40,$00,$F8,$F1,$42,$00   ;0D8BAE|        |      ;
                       db $E8,$70,$41,$08                   ;0D8BB6|        |      ;
 
alucard_spriteAssemb_34: db $08,$F0,$7A,$01,$F0,$F1,$7C,$F8   ;0D8BBA|        |      ;
                       db $11,$7E,$F5,$00,$60,$00,$F8,$01   ;0D8BC2|        |      ;
                       db $62,$00,$F0,$7C,$41,$00,$F1,$7A   ;0D8BCA|        |      ;
                       db $08,$11,$7E,$03                   ;0D8BD2|        |      ;
 
alucard_spriteAssemb_40: db $01,$F0,$5C,$03,$FC               ;0D8BD6|        |      ;
 
alucard_spriteAssemb_42: db $01,$F0,$5C,$01,$FC               ;0D8BDB|        |      ;
 
alucard_spriteAssemb_44: db $02,$F0,$5E,$01,$FC,$F0,$5E,$41   ;0D8BE0|        |      ;
                       db $00                               ;0D8BE8|        |      ;
 
enemySpriteAssembList_04: dw sprAssembZombie00                 ;0D8BE9|        |0D8D7E;
                       dw sprAssembZombie00                 ;0D8BEB|        |0D8D7E;
                       dw sprAssembZombie04                 ;0D8BED|        |0D8D8C;
                       dw sprAssembZombieAppear06           ;0D8BEF|        |0D8D9A;
                       dw sprAssembZombieAppear08           ;0D8BF1|        |0D8DA3;
                       dw DATA8_0D8DAB                      ;0D8BF3|        |0D8DAB;
                       dw sprAssembBird0c                   ;0D8BF5|        |0D8DB9;
                       dw sprAssembBird10                   ;0D8BF7|        |0D8DC1;
                       dw sprAssembBird0c                   ;0D8BF9|        |0D8DB9;
                       dw sprAssembBirdSit12                ;0D8BFB|        |0D8DCF;
                       dw enemy_spriteAssemb_14             ;0D8BFD|        |0D8E03;
                       dw enemy_spriteAssemb_16             ;0D8BFF|        |0D8E08;
 
                       dw enemy_spriteAssemb_18             ;0D8C01|        |0D8E0D;
                       dw enemy_spriteAssemb_1A             ;0D8C03|        |0D8E15;
                       dw enemy_spriteAssemb_1C             ;0D8C05|        |0D8E1D;
                       dw enemy_spriteAssemb_1E             ;0D8C07|        |0D8E25;
                       dw enemy_spriteAssemb_20             ;0D8C09|        |0D8E2E;
                       dw enemy_spriteAssemb_22             ;0D8C0B|        |0D8E36;
                       dw enemy_spriteAssemb_24             ;0D8C0D|        |0D8E3E;
                       dw enemy_spriteAssemb_22             ;0D8C0F|        |0D8E36;
                       dw enemy_spriteAssemb_28             ;0D8C11|        |0D8E66;
                       dw enemy_spriteAssemb_2A             ;0D8C13|        |0D8E6E;
                       dw enemy_spriteAssemb_2C             ;0D8C15|        |0D8E96;
                       dw enemy_spriteAssemb_2E             ;0D8C17|        |0D8EA7;
                       dw enemy_spriteAssemb_30             ;0D8C19|        |0D8EB8;
                       dw enemy_spriteAssemb_32             ;0D8C1B|        |0D8ED3;
                       dw enemy_spriteAssemb_34             ;0D8C1D|        |0D8F19;
                       dw enemy_spriteAssemb_36             ;0D8C1F|        |0D8F27;
                       dw enemy_spriteAssemb_38             ;0D8C21|        |0D90A5;
                       dw enemy_spriteAssemb_3A             ;0D8C23|        |0D90AD;
                       dw enemy_spriteAssemb_3C             ;0D8C25|        |0D90B5;
                       dw enemy_spriteAssemb_3E             ;0D8C27|        |0D8F71;
                       dw enemy_spriteAssemb_40             ;0D8C29|        |0D8F80;
                       dw enemy_spriteAssemb_42             ;0D8C2B|        |0D8F8F;
                       dw enemy_spriteAssemb_44             ;0D8C2D|        |0D8F9D;
                       dw enemy_spriteAssemb_46             ;0D8C2F|        |0D8FAB;
                       dw enemy_spriteAssemb_48             ;0D8C31|        |0D8FBC;
                       dw enemy_spriteAssemb_4A             ;0D8C33|        |0D8FCA;
                       dw enemy_spriteAssemb_4C             ;0D8C35|        |0D8FEE;
                       dw enemy_spriteAssemb_4E             ;0D8C37|        |0D8FF6;
                       dw enemy_spriteAssemb_4E             ;0D8C39|        |0D8FF6;
                       dw enemy_spriteAssemb_52             ;0D8C3B|        |0D8EE7;
                       dw enemy_spriteAssemb_54             ;0D8C3D|        |0D8F05;
                       dw sprAssembZombie00                 ;0D8C3F|        |0D8D7E;
                       dw enemy_spriteAssemb_58             ;0D8C41|        |0D9068;
                       dw enemy_spriteAssemb_5A             ;0D8C43|        |0D9070;
                       dw enemy_spriteAssemb_5C             ;0D8C45|        |0D9078;
                       dw enemy_spriteAssemb_5E             ;0D8C47|        |0D9080;
                       dw enemy_spriteAssemb_60             ;0D8C49|        |0D9088;
                       dw enemy_spriteAssemb_62             ;0D8C4B|        |0D908D;
                       dw enemy_spriteAssemb_64             ;0D8C4D|        |0D9095;
                       dw enemy_spriteAssemb_66             ;0D8C4F|        |0D909D;
                       dw enemy_spriteAssemb_68             ;0D8C51|        |0D90BD;
                       dw enemy_spriteAssemb_6A             ;0D8C53|        |0D90CE;
                       dw enemy_spriteAssemb_6C             ;0D8C55|        |0D90DF;
                       dw enemy_spriteAssemb_6A             ;0D8C57|        |0D90CE;
                       dw enemy_spriteAssemb_70             ;0D8C59|        |0D90F0;
                       dw enemy_spriteAssemb_72             ;0D8C5B|        |0D90FE;
                       dw enemy_spriteAssemb_74             ;0D8C5D|        |0D9106;
                       dw enemy_spriteAssemb_76             ;0D8C5F|        |0D9123;
                       dw enemy_spriteAssemb_78             ;0D8C61|        |0D9140;
                       dw enemy_spriteAssemb_7A             ;0D8C63|        |0D915C;
                       dw enemy_spriteAssemb_7C             ;0D8C65|        |0D9177;
                       dw enemy_spriteAssemb_7E             ;0D8C67|        |0D8E86;
                       dw enemy_spriteAssemb_80             ;0D8C69|        |0D8E8E;
                       dw sprAssembZombie00                 ;0D8C6B|        |0D8D7E;
                       dw sprAssembZombie00                 ;0D8C6D|        |0D8D7E;
                       dw sprAssembZombie00                 ;0D8C6F|        |0D8D7E;
                       dw sprAssembZombie00                 ;0D8C71|        |0D8D7E;
                       dw sprAssembZombie00                 ;0D8C73|        |0D8D7E;
                       dw enemy_spriteAssemb_8C             ;0D8C75|        |0D919E;
                       dw enemy_spriteAssemb_8E             ;0D8C77|        |0D91B8;
                       dw enemy_spriteAssemb_8E             ;0D8C79|        |0D91B8;
                       dw enemy_spriteAssemb_92             ;0D8C7B|        |0D91D2;
                       dw enemy_spriteAssemb_94             ;0D8C7D|        |0D91E0;
                       dw enemy_spriteAssemb_96             ;0D8C7F|        |0D91EE;
                       dw enemy_spriteAssemb_98             ;0D8C81|        |0D91FF;
                       dw enemy_spriteAssemb_9A             ;0D8C83|        |0D920D;
                       dw enemy_spriteAssemb_9C             ;0D8C85|        |0D921E;
                       dw enemy_spriteAssemb_9E             ;0D8C87|        |0D922D;
                       dw enemy_spriteAssemb_A0             ;0D8C89|        |0D9235;
                       dw enemy_spriteAssemb_A2             ;0D8C8B|        |0D923D;
                       dw enemy_spriteAssemb_A4             ;0D8C8D|        |0D9245;
                       dw enemy_spriteAssemb_A6             ;0D8C8F|        |0D924A;
                       dw enemy_spriteAssemb_A8             ;0D8C91|        |0D9252;
                       dw enemy_spriteAssemb_AA             ;0D8C93|        |0D9269;
                       dw enemy_spriteAssemb_AC             ;0D8C95|        |0D9281;
                       dw enemy_spriteAssemb_AC             ;0D8C97|        |0D9281;
                       dw enemy_spriteAssemb_B0             ;0D8C99|        |0D918D;
                       dw enemy_spriteAssemb_B2             ;0D8C9B|        |0D9195;
                       dw enemy_spriteAssemb_B4             ;0D8C9D|        |0D8F35;
                       dw enemy_spriteAssemb_B6             ;0D8C9F|        |0D8F46;
                       dw enemy_spriteAssemb_B8             ;0D8CA1|        |0D92B2;
                       dw enemy_spriteAssemb_BA             ;0D8CA3|        |0D92C4;
                       dw enemy_spriteAssemb_BC             ;0D8CA5|        |0D9345;
                       dw enemy_spriteAssemb_BE             ;0D8CA7|        |0D9356;
                       dw enemy_spriteAssemb_C0             ;0D8CA9|        |0D9367;
                       dw enemy_spriteAssemb_C2             ;0D8CAB|        |0D936C;
                       dw enemy_spriteAssemb_C4             ;0D8CAD|        |0D9375;
                       dw enemy_spriteAssemb_C6             ;0D8CAF|        |0D9382;
                       dw enemy_spriteAssemb_C8             ;0D8CB1|        |0D9393;
                       dw enemy_spriteAssemb_CA             ;0D8CB3|        |0D93C1;
                       dw enemy_spriteAssemb_CC             ;0D8CB5|        |0D93C6;
                       dw enemy_spriteAssemb_CE             ;0D8CB7|        |0D8E46;
                       dw enemy_spriteAssemb_D0             ;0D8CB9|        |0D8E4E;
                       dw enemy_spriteAssemb_D2             ;0D8CBB|        |0D8E56;
                       dw enemy_spriteAssemb_D4             ;0D8CBD|        |0D8E5E;
                       dw enemy_spriteAssemb_D2             ;0D8CBF|        |0D8E56;
                       dw enemy_spriteAssemb_D8             ;0D8CC1|        |0D93A8;
                       dw enemy_spriteAssemb_DA             ;0D8CC3|        |0D94A0;
                       dw enemy_spriteAssemb_DC             ;0D8CC5|        |0D94A5;
                       dw enemy_spriteAssemb_DE             ;0D8CC7|        |0D9455;
                       dw enemy_spriteAssemb_E0             ;0D8CC9|        |0D9462;
                       dw enemy_spriteAssemb_E2             ;0D8CCB|        |0D946E;
                       dw enemy_spriteAssemb_E4             ;0D8CCD|        |0D947E;
                       dw enemy_spriteAssemb_E6             ;0D8CCF|        |0D948E;
                       dw enemy_spriteAssemb_E8             ;0D8CD1|        |0D9497;
                       dw enemy_spriteAssemb_EA             ;0D8CD3|        |0D94AA;
                       dw enemy_spriteAssemb_EC             ;0D8CD5|        |0D94B6;
                       dw enemy_spriteAssemb_EE             ;0D8CD7|        |0D9295;
                       dw enemy_spriteAssemb_F0             ;0D8CD9|        |0D8F5A;
                       dw enemy_spriteAssemb_F2             ;0D8CDB|        |0D92D6;
                       dw enemy_spriteAssemb_F4             ;0D8CDD|        |0D92EB;
                       dw enemy_spriteAssemb_F6             ;0D8CDF|        |0D9309;
                       dw enemy_spriteAssemb_F8             ;0D8CE1|        |0D9327;
                       dw enemy_spriteAssemb_FA             ;0D8CE3|        |0D9517;
                       dw enemy_spriteAssemb_FC             ;0D8CE5|        |0D9529;
                       dw enemy_spriteAssemb_FE             ;0D8CE7|        |0D8D67;
 
   enemyAssembList_09: dw sprAssembZombie00                 ;0D8CE9|        |0D8D7E;
                       dw enemy_09_spriteAssemb_00          ;0D8CEB|        |0D93DA;
                       dw enemy_09_spriteAssemb_02          ;0D8CED|        |0D93E3;
                       dw enemy_09_spriteAssemb_04          ;0D8CEF|        |0D93EC;
                       dw enemy_09_spriteAssemb_06          ;0D8CF1|        |0D93FD;
                       dw enemy_09_spriteAssemb_08          ;0D8CF3|        |0D9419;
                       dw enemy_09_spriteAssemb_0A          ;0D8CF5|        |0D9430;
                       dw enemy_09_spriteAssemb_0C          ;0D8CF7|        |0D9441;
                       dw enemy_09_spriteAssemb_0E          ;0D8CF9|        |0D94C2;
                       dw enemy_09_spriteAssemb_10          ;0D8CFB|        |0D94CD;
                       dw enemy_09_spriteAssemb_12          ;0D8CFD|        |0D94E1;
                       dw enemy_09_spriteAssemb_14          ;0D8CFF|        |0D94EC;
                       dw sprAssembZombie00                 ;0D8D01|        |0D8D7E;
                       dw enemy_09_spriteAssemb_16          ;0D8D03|        |0D9541;
                       dw enemy_09_spriteAssemb_18          ;0D8D05|        |0D954F;
                       dw enemy_09_spriteAssemb_1A          ;0D8D07|        |0D955D;
                       dw enemy_09_spriteAssemb_1C          ;0D8D09|        |0D956B;
 
                       dw enemy_09_spriteAssemb_1E          ;0D8D0B|        |0D9574;
                       dw enemy_09_spriteAssemb_20          ;0D8D0D|        |0D8FD8;
                       dw enemy_09_spriteAssemb_22          ;0D8D0F|        |0D8FE3;
                       dw enemy_09_spriteAssemb_24          ;0D8D11|        |0D957C;
                       dw enemy_09_spriteAssemb_26          ;0D8D13|        |0D958D;
                       dw enemy_09_spriteAssemb_28          ;0D8D15|        |0D959E;
                       dw enemy_09_spriteAssemb_2A          ;0D8D17|        |0D95AF;
                       dw enemy_09_spriteAssemb_2C          ;0D8D19|        |0D95B4;
                       dw enemy_09_spriteAssemb_2E          ;0D8D1B|        |0D95B9;
                       dw enemy_09_spriteAssemb_30          ;0D8D1D|        |0D95BE;
                       dw enemy_09_spriteAssemb_32          ;0D8D1F|        |0D95CC;
                       dw enemy_09_spriteAssemb_34          ;0D8D21|        |0D95DA;
                       dw enemy_09_spriteAssemb_36          ;0D8D23|        |0D8FFE;
                       dw enemy_09_spriteAssemb_38          ;0D8D25|        |0D9006;
                       dw enemy_09_spriteAssemb_3A          ;0D8D27|        |0D901E;
                       dw enemy_09_spriteAssemb_3C          ;0D8D29|        |0D902E;
                       dw enemy_09_spriteAssemb_3E          ;0D8D2B|        |0D903E;
                       dw enemy_09_spriteAssemb_40          ;0D8D2D|        |0D9048;
                       dw enemy_09_spriteAssemb_42          ;0D8D2F|        |0D9058;
                       dw enemy_09_spriteAssemb_44          ;0D8D31|        |0D900E;
                       dw enemy_09_spriteAssemb_46          ;0D8D33|        |0D9016;
                       dw enemy_09_spriteAssemb_48          ;0D8D35|        |0D9026;
                       dw enemy_09_spriteAssemb_4A          ;0D8D37|        |0D9036;
                       dw enemy_09_spriteAssemb_4C          ;0D8D39|        |0D9043;
                       dw enemy_09_spriteAssemb_4E          ;0D8D3B|        |0D9050;
                       dw enemy_09_spriteAssemb_50          ;0D8D3D|        |0D9060;
                       dw enemy_09_spriteAssemb_52          ;0D8D3F|        |0D9612;
                       dw enemy_09_spriteAssemb_54          ;0D8D41|        |0D961A;
                       dw enemy_09_spriteAssemb_56          ;0D8D43|        |0D95E8;
                       dw enemy_09_spriteAssemb_58          ;0D8D45|        |0D95F6;
                       dw enemy_09_spriteAssemb_5A          ;0D8D47|        |0D9604;
                       dw enemy_09_spriteAssemb_5C          ;0D8D49|        |0D94FD;
                       dw enemy_09_spriteAssemb_5E          ;0D8D4B|        |0D9508;
                       dw enemy_09_spriteAssemb_60          ;0D8D4D|        |0D9622;
                       dw enemy_09_spriteAssemb_62          ;0D8D4F|        |0D962A;
                       dw enemy_09_spriteAssemb_64          ;0D8D51|        |0D8DD7;
                       dw enemy_09_spriteAssemb_66          ;0D8D53|        |0D8DE5;
                       dw enemy_09_spriteAssemb_68          ;0D8D55|        |0D8DED;
                       dw enemy_09_spriteAssemb_66          ;0D8D57|        |0D8DE5;
                       dw enemy_09_spriteAssemb_6C          ;0D8D59|        |0D8DFB;
                       dw enemy_09_spriteAssemb_6E          ;0D8D5B|        |0D9632;
                       dw enemy_09_spriteAssemb_70          ;0D8D5D|        |0D9650;
                       dw enemy_09_spriteAssemb_72          ;0D8D5F|        |0D9671;
                       dw enemy_09_spriteAssemb_74          ;0D8D61|        |0D9688;
                       dw enemy_09_spriteAssemb_76          ;0D8D63|        |0D8E76;
                       dw enemy_09_spriteAssemb_78          ;0D8D65|        |0D8E7E;
 
enemy_spriteAssemb_FE: db $07,$F0,$71,$01,$E4,$E1,$73,$EC   ;0D8D67|        |      ;
                       db $E1,$75,$F4,$E1,$77,$FC,$E1,$79   ;0D8D6F|        |      ;
                       db $04,$01,$7B,$FC,$01,$7D,$04       ;0D8D77|        |      ;
 
    sprAssembZombie00: db $04,$E0,$80,$02,$F4,$E1,$82,$FC   ;0D8D7E|        |      ;
                       db $01,$88,$F8,$01,$8A,$00           ;0D8D86|        |      ;
 
    sprAssembZombie04: db $04,$E2,$80,$02,$F5,$E3,$82,$FD   ;0D8D8C|        |      ;
                       db $01,$84,$F8,$01,$86,$00           ;0D8D94|        |      ;
 
sprAssembZombieAppear06: db $02,$00,$90,$02,$F8,$00,$90,$42   ;0D8D9A|        |      ;
                       db $00                               ;0D8DA2|        |      ;
 
sprAssembZombieAppear08: db $02,$00,$8C,$02,$F8,$01,$8E,$00   ;0D8DA3|        |      ;
 
         DATA8_0D8DAB: db $04,$E0,$92,$02,$FD,$E1,$94,$05   ;0D8DAB|        |      ;
                       db $01,$96,$F8,$01,$98,$00           ;0D8DB3|        |      ;
 
      sprAssembBird0c: db $02,$00,$9A,$02,$F8,$01,$9C,$00   ;0D8DB9|        |      ;
 
      sprAssembBird10: db $04,$E2,$9E,$02,$F8,$E3,$A0,$00   ;0D8DC1|        |      ;
                       db $03,$A2,$F8,$03,$A4,$00           ;0D8DC9|        |      ;
 
   sprAssembBirdSit12: db $02,$00,$A6,$02,$F8,$01,$A8,$00   ;0D8DCF|        |      ;
 
enemy_09_spriteAssemb_64: db $04,$E0,$D2,$02,$FD,$E1,$D4,$05   ;0D8DD7|        |      ;
                       db $01,$D6,$F8,$01,$D8,$00           ;0D8DDF|        |      ;
 
enemy_09_spriteAssemb_66: db $02,$00,$DA,$02,$F8,$01,$DC,$00   ;0D8DE5|        |      ;
 
enemy_09_spriteAssemb_68: db $04,$E2,$DE,$02,$F8,$E3,$E0,$00   ;0D8DED|        |      ;
                       db $03,$E2,$F8,$03,$E4,$00           ;0D8DF5|        |      ;
 
enemy_09_spriteAssemb_6C: db $02,$00,$E6,$02,$F8,$01,$E8,$00   ;0D8DFB|        |      ;
 
enemy_spriteAssemb_14: db $01,$F0,$BE,$01,$FC               ;0D8E03|        |      ;
 
enemy_spriteAssemb_16: db $01,$F0,$B4,$01,$FC               ;0D8E08|        |      ;
 
enemy_spriteAssemb_18: db $02,$F0,$B0,$01,$F8,$F1,$B2,$00   ;0D8E0D|        |      ;
 
enemy_spriteAssemb_1A: db $02,$F0,$AA,$01,$F8,$F1,$AC,$00   ;0D8E15|        |      ;
 
enemy_spriteAssemb_1C: db $02,$F0,$AA,$01,$F8,$F1,$AE,$00   ;0D8E1D|        |      ;
 
enemy_spriteAssemb_1E: db $02,$F0,$CC,$03,$F8,$F0,$CC,$43   ;0D8E25|        |      ;
                       db $00                               ;0D8E2D|        |      ;
 
enemy_spriteAssemb_20: db $02,$E8,$C0,$03,$F8,$E9,$C2,$00   ;0D8E2E|        |      ;
 
enemy_spriteAssemb_22: db $02,$F0,$C4,$03,$F8,$F1,$C6,$00   ;0D8E36|        |      ;
 
enemy_spriteAssemb_24: db $02,$F8,$C8,$03,$F8,$F9,$CA,$00   ;0D8E3E|        |      ;
 
enemy_spriteAssemb_CE: db $02,$F0,$DE,$03,$F8,$F1,$DE,$00   ;0D8E46|        |      ;
 
enemy_spriteAssemb_D0: db $02,$F0,$D2,$03,$F8,$F1,$D4,$00   ;0D8E4E|        |      ;
 
enemy_spriteAssemb_D2: db $02,$F0,$D6,$03,$F8,$F1,$D8,$00   ;0D8E56|        |      ;
 
enemy_spriteAssemb_D4: db $02,$F0,$DA,$03,$F8,$F1,$DC,$00   ;0D8E5E|        |      ;
 
enemy_spriteAssemb_28: db $02,$F0,$EA,$01,$F8,$F1,$EC,$00   ;0D8E66|        |      ;
 
enemy_spriteAssemb_2A: db $02,$F0,$EE,$01,$F8,$F1,$F0,$00   ;0D8E6E|        |      ;
 
enemy_09_spriteAssemb_76: db $02,$F0,$8A,$01,$F8,$F1,$8C,$00   ;0D8E76|        |      ;
 
enemy_09_spriteAssemb_78: db $02,$F0,$8E,$01,$F8,$F1,$AE,$00   ;0D8E7E|        |      ;
 
enemy_spriteAssemb_7E: db $02,$F0,$59,$01,$F8,$F1,$5B,$00   ;0D8E86|        |      ;
 
enemy_spriteAssemb_80: db $02,$F0,$5D,$01,$F8,$F1,$5F,$00   ;0D8E8E|        |      ;
 
enemy_spriteAssemb_2C: db $05,$F0,$D6,$01,$F0,$E1,$D8,$F8   ;0D8E96|        |      ;
                       db $E1,$DA,$00,$01,$DC,$F8,$01,$DE   ;0D8E9E|        |      ;
                       db $00                               ;0D8EA6|        |      ;
 
enemy_spriteAssemb_2E: db $05,$F0,$D6,$01,$EF,$E1,$D8,$F7   ;0D8EA7|        |      ;
                       db $E1,$DA,$FF,$01,$E0,$F8,$01,$E2   ;0D8EAF|        |      ;
                       db $00                               ;0D8EB7|        |      ;
 
enemy_spriteAssemb_30: db $08,$F0,$D6,$01,$F0,$E1,$D8,$F8   ;0D8EB8|        |      ;
                       db $E1,$E8,$00,$E1,$EE,$08,$01,$E4   ;0D8EC0|        |      ;
                       db $F8,$01,$E6,$00,$C8,$EC,$41,$06   ;0D8EC8|        |      ;
                       db $C9,$EA,$0E                       ;0D8ED0|        |      ;
 
enemy_spriteAssemb_32: db $06,$E0,$F0,$01,$ED,$E1,$F2,$F4   ;0D8ED3|        |      ;
                       db $E1,$F4,$FD,$01,$F6,$F0,$01,$F8   ;0D8EDB|        |      ;
                       db $F8,$01,$E6,$00                   ;0D8EE3|        |      ;
 
enemy_spriteAssemb_52: db $09,$F0,$D4,$01,$F0,$F1,$D8,$F8   ;0D8EE7|        |      ;
                       db $F1,$E8,$00,$F1,$EE,$08,$11,$CE   ;0D8EEF|        |      ;
                       db $F2,$11,$D0,$FA,$11,$D2,$03,$D6   ;0D8EF7|        |      ;
                       db $EC,$41,$06,$D7,$EA,$0E           ;0D8EFF|        |      ;
 
enemy_spriteAssemb_54: db $06,$F0,$F0,$01,$F1,$F1,$F2,$F9   ;0D8F05|        |      ;
                       db $F1,$F4,$01,$11,$CE,$F2,$11,$D0   ;0D8F0D|        |      ;
                       db $FA,$11,$D2,$02                   ;0D8F15|        |      ;
 
enemy_spriteAssemb_34: db $04,$E0,$D4,$01,$F7,$E1,$D6,$FF   ;0D8F19|        |      ;
                       db $01,$D8,$F8,$01,$DA,$00           ;0D8F21|        |      ;
 
enemy_spriteAssemb_36: db $04,$E2,$D4,$01,$F7,$E3,$D6,$FF   ;0D8F27|        |      ;
                       db $01,$DC,$F8,$01,$DE,$00           ;0D8F2F|        |      ;
 
enemy_spriteAssemb_B4: db $05,$E2,$E0,$01,$EE,$E3,$E2,$F6   ;0D8F35|        |      ;
                       db $E3,$D6,$FE,$01,$E4,$F8,$01,$DE   ;0D8F3D|        |      ;
                       db $00                               ;0D8F45|        |      ;
 
enemy_spriteAssemb_B6: db $06,$C0,$E6,$01,$F7,$C1,$E8,$FF   ;0D8F46|        |      ;
                       db $E1,$EA,$F7,$E1,$EC,$FF,$01,$EE   ;0D8F4E|        |      ;
                       db $F8,$01,$DA,$00                   ;0D8F56|        |      ;
 
enemy_spriteAssemb_F0: db $07,$E2,$D4,$01,$F6,$E3,$D6,$FE   ;0D8F5A|        |      ;
                       db $01,$DC,$F8,$01,$DE,$00,$FB,$F0   ;0D8F62|        |      ;
                       db $E0,$FB,$F2,$E8,$FB,$F4,$F0       ;0D8F6A|        |      ;
 
enemy_spriteAssemb_3E: db $04,$E0,$80,$01,$F8,$E1,$82,$00   ;0D8F71|        |      ;
                       db $00,$82,$41,$F8,$01,$80,$00       ;0D8F79|        |      ;
 
enemy_spriteAssemb_40: db $04,$E0,$FA,$01,$F8,$E1,$FC,$00   ;0D8F80|        |      ;
                       db $00,$FC,$41,$F8,$01,$FA,$00       ;0D8F88|        |      ;
 
enemy_spriteAssemb_42: db $04,$E0,$90,$03,$F7,$E1,$92,$FF   ;0D8F8F|        |      ;
                       db $01,$94,$F8,$01,$96,$00           ;0D8F97|        |      ;
 
enemy_spriteAssemb_44: db $04,$E2,$90,$03,$F5,$E3,$92,$FD   ;0D8F9D|        |      ;
                       db $01,$98,$F8,$01,$9A,$00           ;0D8FA5|        |      ;
 
enemy_spriteAssemb_46: db $05,$E0,$9C,$03,$F4,$E1,$9E,$FC   ;0D8FAB|        |      ;
                       db $E1,$A0,$04,$01,$A2,$F8,$01,$A4   ;0D8FB3|        |      ;
                       db $00                               ;0D8FBB|        |      ;
 
enemy_spriteAssemb_48: db $04,$F0,$90,$03,$F7,$F1,$92,$FF   ;0D8FBC|        |      ;
                       db $11,$B8,$F8,$11,$BA,$00           ;0D8FC4|        |      ;
 
enemy_spriteAssemb_4A: db $04,$E0,$A6,$03,$F7,$E1,$A8,$FF   ;0D8FCA|        |      ;
                       db $01,$94,$F8,$01,$96,$00           ;0D8FD2|        |      ;
 
enemy_09_spriteAssemb_20: db $03,$F0,$B2,$02,$F4,$F1,$B4,$FC   ;0D8FD8|        |      ;
                       db $F1,$B6,$04                       ;0D8FE0|        |      ;
 
enemy_09_spriteAssemb_22: db $03,$F0,$B2,$82,$F4,$F1,$B4,$FC   ;0D8FE3|        |      ;
                       db $F1,$B6,$04                       ;0D8FEB|        |      ;
 
enemy_spriteAssemb_4C: db $02,$F0,$84,$02,$F8,$F1,$86,$00   ;0D8FEE|        |      ;
 
enemy_spriteAssemb_4E: db $02,$F0,$88,$02,$F8,$F1,$8A,$00   ;0D8FF6|        |      ;
 
enemy_09_spriteAssemb_36: db $02,$F0,$E0,$01,$F8,$F1,$E2,$00   ;0D8FFE|        |      ;
 
enemy_09_spriteAssemb_38: db $02,$F0,$E4,$01,$F8,$F1,$E6,$00   ;0D9006|        |      ;
 
enemy_09_spriteAssemb_44: db $02,$F0,$90,$01,$F8,$F1,$92,$00   ;0D900E|        |      ;
 
enemy_09_spriteAssemb_46: db $02,$F0,$94,$01,$F8,$F1,$96,$00   ;0D9016|        |      ;
 
enemy_09_spriteAssemb_3A: db $02,$F0,$E8,$01,$F8,$F1,$EA,$00   ;0D901E|        |      ;
 
enemy_09_spriteAssemb_48: db $02,$F0,$98,$01,$F8,$F1,$9A,$00   ;0D9026|        |      ;
 
enemy_09_spriteAssemb_3C: db $02,$F0,$EC,$01,$F8,$F1,$EE,$00   ;0D902E|        |      ;
 
enemy_09_spriteAssemb_4A: db $02,$F0,$9C,$01,$F8,$F1,$9E,$00   ;0D9036|        |      ;
 
enemy_09_spriteAssemb_3E: db $01,$F0,$F0,$01,$FC               ;0D903E|        |      ;
 
enemy_09_spriteAssemb_4C: db $01,$F0,$A0,$01,$FC               ;0D9043|        |      ;
 
enemy_09_spriteAssemb_40: db $02,$F0,$F2,$01,$F8,$F1,$F4,$00   ;0D9048|        |      ;
 
enemy_09_spriteAssemb_4E: db $02,$F0,$A2,$01,$F8,$F1,$A4,$00   ;0D9050|        |      ;
 
enemy_09_spriteAssemb_42: db $02,$F0,$FA,$C1,$F8,$F1,$F8,$00   ;0D9058|        |      ;
 
enemy_09_spriteAssemb_50: db $02,$F0,$9A,$C1,$F8,$F1,$98,$00   ;0D9060|        |      ;
 
enemy_spriteAssemb_58: db $02,$F0,$80,$03,$F8,$F1,$82,$00   ;0D9068|        |      ;
 
enemy_spriteAssemb_5A: db $02,$F0,$80,$03,$F8,$F1,$86,$00   ;0D9070|        |      ;
 
enemy_spriteAssemb_5C: db $02,$F0,$84,$03,$F8,$F1,$86,$00   ;0D9078|        |      ;
 
enemy_spriteAssemb_5E: db $02,$F0,$88,$03,$F8,$F1,$82,$00   ;0D9080|        |      ;
 
enemy_spriteAssemb_60: db $01,$F0,$8A,$03,$FC               ;0D9088|        |      ;
 
enemy_spriteAssemb_62: db $02,$F0,$8C,$02,$F8,$F1,$8E,$00   ;0D908D|        |      ;
 
enemy_spriteAssemb_64: db $02,$F0,$90,$02,$F8,$F1,$92,$00   ;0D9095|        |      ;
 
enemy_spriteAssemb_66: db $02,$F0,$94,$02,$F8,$F1,$96,$00   ;0D909D|        |      ;
 
enemy_spriteAssemb_38: db $02,$F0,$8E,$C2,$F8,$F1,$8C,$00   ;0D90A5|        |      ;
 
enemy_spriteAssemb_3A: db $02,$F0,$92,$C2,$F8,$F1,$90,$00   ;0D90AD|        |      ;
 
enemy_spriteAssemb_3C: db $02,$F0,$96,$C2,$F8,$F1,$94,$00   ;0D90B5|        |      ;
 
enemy_spriteAssemb_68: db $05,$E0,$98,$01,$F8,$E1,$9A,$00   ;0D90BD|        |      ;
                       db $01,$9C,$F8,$01,$9E,$00,$C1,$BE   ;0D90C5|        |      ;
                       db $FB                               ;0D90CD|        |      ;
 
enemy_spriteAssemb_6A: db $05,$E0,$98,$01,$F8,$E1,$9A,$00   ;0D90CE|        |      ;
                       db $01,$A0,$F8,$01,$A2,$00,$C1,$BE   ;0D90D6|        |      ;
                       db $FB                               ;0D90DE|        |      ;
 
enemy_spriteAssemb_6C: db $05,$E0,$98,$01,$F8,$E1,$9A,$00   ;0D90DF|        |      ;
                       db $01,$A4,$F8,$01,$A6,$00,$C1,$BE   ;0D90E7|        |      ;
                       db $FB                               ;0D90EF|        |      ;
 
enemy_spriteAssemb_70: db $04,$E0,$A8,$01,$F8,$E1,$AA,$00   ;0D90F0|        |      ;
                       db $01,$9C,$F8,$01,$9E,$00           ;0D90F8|        |      ;
 
enemy_spriteAssemb_72: db $02,$00,$AA,$41,$F8,$01,$A8,$00   ;0D90FE|        |      ;
 
enemy_spriteAssemb_74: db $08,$A0,$AC,$01,$F8,$A1,$AE,$00   ;0D9106|        |      ;
                       db $C0,$AE,$41,$F8,$C1,$AC,$00,$E0   ;0D910E|        |      ;
                       db $AC,$01,$F8,$E1,$AE,$00,$00,$AE   ;0D9116|        |      ;
                       db $41,$F8,$01,$AC,$00               ;0D911E|        |      ;
 
enemy_spriteAssemb_76: db $08,$A0,$AE,$41,$F8,$A1,$AC,$00   ;0D9123|        |      ;
                       db $C0,$AC,$01,$F8,$C1,$AE,$00,$E0   ;0D912B|        |      ;
                       db $AE,$41,$F8,$E1,$AC,$00,$00,$B0   ;0D9133|        |      ;
                       db $01,$F8,$01,$B2,$00               ;0D913B|        |      ;
 
enemy_spriteAssemb_78: db $08,$A0,$AC,$01,$F8,$A1,$AE,$00   ;0D9140|        |      ;
                       db $C0,$AE,$41,$F8,$C1,$AC,$00,$E0   ;0D9148|        |      ;
                       db $AC,$01,$F8,$E1,$AE,$00,$01,$A0   ;0D9150|        |      ;
                       db $F8,$01,$A2,$00                   ;0D9158|        |      ;
 
enemy_spriteAssemb_7A: db $08,$A0,$AE,$41,$F8,$A1,$AC,$00   ;0D915C|        |      ;
                       db $C0,$AC,$01,$F8,$C1,$AE,$00,$E1   ;0D9164|        |      ;
                       db $B4,$F8,$E1,$B6,$00,$01,$A0,$F8   ;0D916C|        |      ;
                       db $01,$A2,$00                       ;0D9174|        |      ;
 
enemy_spriteAssemb_7C: db $06,$C0,$AE,$41,$F8,$C1,$AC,$00   ;0D9177|        |      ;
                       db $E0,$98,$01,$F8,$E1,$9A,$00,$00   ;0D917F|        |      ;
                       db $A0,$01,$F8,$01,$A2,$00           ;0D9187|        |      ;
 
enemy_spriteAssemb_B0: db $02,$F0,$B8,$01,$F8,$F1,$BA,$00   ;0D918D|        |      ;
 
enemy_spriteAssemb_B2: db $02,$F0,$BC,$01,$F8,$F0,$BA,$81   ;0D9195|        |      ;
                       db $00                               ;0D919D|        |      ;
 
enemy_spriteAssemb_8C: db $08,$E0,$C0,$02,$F0,$E1,$C2,$F8   ;0D919E|        |      ;
                       db $E1,$C4,$00,$E1,$C6,$08,$01,$C8   ;0D91A6|        |      ;
                       db $F8,$01,$CA,$00,$21,$CC,$F8,$21   ;0D91AE|        |      ;
                       db $CE,$00                           ;0D91B6|        |      ;
 
enemy_spriteAssemb_8E: db $08,$E2,$C0,$02,$F0,$E3,$C2,$F8   ;0D91B8|        |      ;
                       db $E3,$D0,$00,$F3,$D2,$08,$03,$C8   ;0D91C0|        |      ;
                       db $F8,$03,$CA,$00,$23,$CC,$F8,$23   ;0D91C8|        |      ;
                       db $CE,$00                           ;0D91D0|        |      ;
 
enemy_spriteAssemb_92: db $04,$E0,$C0,$01,$F7,$E1,$C2,$FF   ;0D91D2|        |      ;
                       db $01,$C4,$F8,$01,$C6,$00           ;0D91DA|        |      ;
 
enemy_spriteAssemb_94: db $04,$E0,$C0,$01,$F8,$E1,$C2,$00   ;0D91E0|        |      ;
                       db $01,$C8,$F8,$01,$CA,$00           ;0D91E8|        |      ;
 
enemy_spriteAssemb_96: db $05,$E0,$D0,$01,$F8,$E1,$D2,$00   ;0D91EE|        |      ;
                       db $E1,$D4,$08,$01,$C4,$F8,$01,$CE   ;0D91F6|        |      ;
                       db $00                               ;0D91FE|        |      ;
 
enemy_spriteAssemb_98: db $04,$E0,$D6,$01,$FB,$E1,$D8,$03   ;0D91FF|        |      ;
                       db $01,$CC,$F8,$01,$CE,$00           ;0D9207|        |      ;
 
enemy_spriteAssemb_9A: db $05,$E2,$DA,$01,$EE,$E1,$DC,$F6   ;0D920D|        |      ;
                       db $E1,$DE,$FE,$01,$C6,$F8,$01,$C6   ;0D9215|        |      ;
                       db $00                               ;0D921D|        |      ;
 
enemy_spriteAssemb_9C: db $04,$E0,$E2,$41,$F9,$E1,$E0,$FF   ;0D921E|        |      ;
                       db $00,$C8,$01,$F8,$01,$CA,$00       ;0D9226|        |      ;
 
enemy_spriteAssemb_9E: db $02,$00,$E0,$01,$F8,$01,$E2,$00   ;0D922D|        |      ;
 
enemy_spriteAssemb_A0: db $02,$00,$E4,$01,$F8,$01,$E6,$00   ;0D9235|        |      ;
 
enemy_spriteAssemb_A2: db $02,$F0,$F8,$01,$F8,$F1,$FA,$00   ;0D923D|        |      ;
 
enemy_spriteAssemb_A4: db $01,$F0,$FC,$01,$FC               ;0D9245|        |      ;
 
enemy_spriteAssemb_A6: db $02,$F0,$FA,$41,$F8,$F1,$F8,$00   ;0D924A|        |      ;
 
enemy_spriteAssemb_A8: db $07,$E0,$D0,$01,$F8,$E1,$D2,$00   ;0D9252|        |      ;
                       db $E1,$D4,$08,$E1,$EC,$10,$01,$C4   ;0D925A|        |      ;
                       db $F8,$01,$CE,$00,$01,$EE,$10       ;0D9262|        |      ;
 
enemy_spriteAssemb_AA: db $07,$E0,$D0,$01,$F7,$E1,$D2,$FF   ;0D9269|        |      ;
                       db $E1,$D4,$07,$E1,$EC,$0F,$01,$E8   ;0D9271|        |      ;
                       db $F7,$01,$EA,$FF,$00,$EE,$41,$0E   ;0D9279|        |      ;
 
enemy_spriteAssemb_AC: db $06,$E0,$D6,$01,$FB,$E1,$D8,$03   ;0D9281|        |      ;
                       db $E1,$F0,$0B,$E3,$F2,$13,$01,$CC   ;0D9289|        |      ;
                       db $F8,$01,$CE,$00                   ;0D9291|        |      ;
 
enemy_spriteAssemb_EE: db $09,$F0,$F4,$01,$CE,$F1,$F6,$D6   ;0D9295|        |      ;
                       db $F1,$F6,$DE,$F1,$F6,$E6,$E3,$DA   ;0D929D|        |      ;
                       db $EE,$E1,$DC,$F6,$E1,$DE,$FE,$01   ;0D92A5|        |      ;
                       db $CC,$F8,$01,$CE,$00               ;0D92AD|        |      ;
 
enemy_spriteAssemb_B8: db $05,$DC,$C0,$01,$F0,$E0,$C2,$02   ;0D92B2|        |      ;
                       db $F8,$E1,$C4,$00,$01,$C6,$F8,$01   ;0D92BA|        |      ;
                       db $C8,$00                           ;0D92C2|        |      ;
 
enemy_spriteAssemb_BA: db $05,$E0,$C0,$01,$EF,$E0,$C2,$02   ;0D92C4|        |      ;
                       db $F7,$E1,$C4,$FF,$01,$CA,$F7,$01   ;0D92CC|        |      ;
                       db $CC,$FF                           ;0D92D4|        |      ;
 
enemy_spriteAssemb_F2: db $06,$E0,$CE,$01,$E8,$E1,$D0,$F0   ;0D92D6|        |      ;
                       db $E0,$C2,$02,$F8,$E1,$C4,$00,$01   ;0D92DE|        |      ;
                       db $D2,$F7,$01,$D4,$FF               ;0D92E6|        |      ;
 
enemy_spriteAssemb_F4: db $09,$E0,$D6,$01,$D6,$E1,$D6,$DE   ;0D92EB|        |      ;
                       db $E0,$D8,$02,$E6,$E1,$DA,$EE,$E1   ;0D92F3|        |      ;
                       db $DC,$F6,$01,$DE,$E8,$01,$E0,$F0   ;0D92FB|        |      ;
                       db $01,$E2,$F8,$01,$E4,$00           ;0D9303|        |      ;
 
enemy_spriteAssemb_F6: db $09,$E0,$E6,$01,$D6,$E1,$E8,$DE   ;0D9309|        |      ;
                       db $E0,$D8,$02,$E6,$E1,$DA,$EE,$E1   ;0D9311|        |      ;
                       db $DC,$F6,$01,$DE,$E8,$01,$E0,$F0   ;0D9319|        |      ;
                       db $01,$E2,$F8,$01,$E4,$00           ;0D9321|        |      ;
 
enemy_spriteAssemb_F8: db $09,$F6,$E6,$01,$D6,$F7,$E8,$DE   ;0D9327|        |      ;
                       db $E2,$D8,$02,$E6,$E1,$DA,$EE,$E1   ;0D932F|        |      ;
                       db $DC,$F6,$01,$DE,$E8,$01,$E0,$F0   ;0D9337|        |      ;
                       db $01,$E2,$F8,$01,$E4,$00           ;0D933F|        |      ;
 
enemy_spriteAssemb_BC: db $04,$E0,$80,$03,$F8,$E0,$80,$43   ;0D9345|        |      ;
                       db $00,$00,$82,$03,$F8,$00,$82,$43   ;0D934D|        |      ;
                       db $00                               ;0D9355|        |      ;
 
enemy_spriteAssemb_BE: db $04,$E0,$84,$03,$F8,$E0,$84,$43   ;0D9356|        |      ;
                       db $00,$00,$86,$03,$F8,$00,$86,$43   ;0D935E|        |      ;
                       db $00                               ;0D9366|        |      ;
 
enemy_spriteAssemb_C0: db $01,$F0,$8C,$03,$FC               ;0D9367|        |      ;
 
enemy_spriteAssemb_C2: db $02,$E0,$8C,$03,$FC,$00,$8C,$03   ;0D936C|        |      ;
                       db $FC                               ;0D9374|        |      ;
 
enemy_spriteAssemb_C4: db $03,$D0,$8C,$03,$FC,$F0,$8C,$03   ;0D9375|        |      ;
                       db $FC,$10,$8C,$03,$FC               ;0D937D|        |      ;
 
enemy_spriteAssemb_C6: db $04,$C0,$8C,$03,$FC,$E0,$8C,$03   ;0D9382|        |      ;
                       db $FC,$00,$8C,$03,$FC,$20,$8C,$03   ;0D938A|        |      ;
                       db $FC                               ;0D9392|        |      ;
 
enemy_spriteAssemb_C8: db $05,$B0,$8C,$03,$FC,$D0,$8C,$03   ;0D9393|        |      ;
                       db $FC,$F0,$8C,$03,$FC,$10,$8C,$03   ;0D939B|        |      ;
                       db $FC,$30,$8C,$03,$FC               ;0D93A3|        |      ;
 
enemy_spriteAssemb_D8: db $06,$A0,$8C,$03,$FC,$C0,$8C,$03   ;0D93A8|        |      ;
                       db $FC,$E0,$8C,$03,$FC,$00,$8C,$03   ;0D93B0|        |      ;
                       db $FC,$20,$8C,$03,$FC,$40,$8C,$03   ;0D93B8|        |      ;
                       db $FC                               ;0D93C0|        |      ;
 
enemy_spriteAssemb_CA: db $01,$F0,$88,$03,$FC               ;0D93C1|        |      ;
 
enemy_spriteAssemb_CC: db $01,$F0,$8A,$03,$FC               ;0D93C6|        |      ;
 
trevorSpriteAssemb_56: db $01,$F0,$EB,$03,$FC               ;0D93CB|        |      ;
 
trevorSpriteAssemb_58: db $01,$F0,$ED,$03,$FC               ;0D93D0|        |      ;
 
trevorSpriteAssemb_5A: db $01,$F0,$EF,$03,$FC               ;0D93D5|        |      ;
 
enemy_09_spriteAssemb_00: db $02,$E0,$8E,$02,$F8,$E0,$8E,$42   ;0D93DA|        |      ;
                       db $FF                               ;0D93E2|        |      ;
 
enemy_09_spriteAssemb_02: db $02,$E0,$90,$02,$F8,$E0,$90,$42   ;0D93E3|        |      ;
                       db $FF                               ;0D93EB|        |      ;
 
enemy_09_spriteAssemb_04: db $04,$E0,$92,$02,$F8,$E0,$92,$42   ;0D93EC|        |      ;
                       db $FF,$00,$94,$02,$F8,$00,$94,$42   ;0D93F4|        |      ;
                       db $FF                               ;0D93FC|        |      ;
 
enemy_09_spriteAssemb_06: db $08,$E0,$96,$02,$E8,$E1,$98,$F0   ;0D93FD|        |      ;
                       db $E1,$9A,$F8,$E0,$9A,$42,$FF,$E1   ;0D9405|        |      ;
                       db $98,$07,$E1,$96,$0F,$00,$9C,$02   ;0D940D|        |      ;
                       db $F8,$01,$9C,$FF                   ;0D9415|        |      ;
 
enemy_09_spriteAssemb_08: db $07,$E0,$9E,$02,$F0,$E1,$A0,$F8   ;0D9419|        |      ;
                       db $E1,$A2,$00,$E1,$A4,$08,$E1,$A6   ;0D9421|        |      ;
                       db $10,$01,$A8,$F8,$01,$AA,$00       ;0D9429|        |      ;
 
enemy_09_spriteAssemb_0A: db $05,$E0,$AE,$02,$FB,$E1,$B0,$03   ;0D9430|        |      ;
                       db $F9,$AC,$F0,$01,$B2,$F8,$01,$B4   ;0D9438|        |      ;
                       db $00                               ;0D9440|        |      ;
 
enemy_09_spriteAssemb_0C: db $06,$F0,$AC,$02,$F0,$F1,$B6,$F8   ;0D9441|        |      ;
                       db $F1,$B8,$00,$11,$BA,$F0,$11,$BC   ;0D9449|        |      ;
                       db $F8,$11,$BE,$00                   ;0D9451|        |      ;
 
enemy_spriteAssemb_DE: db $03,$E0,$DE,$03,$F8,$E0,$DE,$43   ;0D9455|        |      ;
                       db $00,$00,$EA,$03,$FC               ;0D945D|        |      ;
 
enemy_spriteAssemb_E0: db $03,$E0,$E0,$03,$F8,$E0,$E0,$43   ;0D9462|        |      ;
                       db $00,$01,$F0,$FC                   ;0D946A|        |      ;
 
enemy_spriteAssemb_E2: db $04,$E0,$E2,$03,$F4,$E1,$E4,$FC   ;0D946E|        |      ;
                       db $E0,$E2,$43,$04,$00,$EA,$03,$FC   ;0D9476|        |      ;
 
enemy_spriteAssemb_E4: db $04,$E0,$E6,$03,$F4,$E1,$E8,$FC   ;0D947E|        |      ;
                       db $E0,$E6,$43,$04,$00,$F0,$03,$FC   ;0D9486|        |      ;
 
enemy_spriteAssemb_E6: db $02,$F0,$DE,$03,$F8,$F0,$DE,$43   ;0D948E|        |      ;
                       db $00                               ;0D9496|        |      ;
 
enemy_spriteAssemb_E8: db $02,$F0,$E0,$03,$F8,$F0,$E0,$43   ;0D9497|        |      ;
                       db $00                               ;0D949F|        |      ;
 
enemy_spriteAssemb_DA: db $01,$F0,$EC,$03,$FC               ;0D94A0|        |      ;
 
enemy_spriteAssemb_DC: db $01,$F0,$EE,$03,$FC               ;0D94A5|        |      ;
 
enemy_spriteAssemb_EA: db $03,$F0,$E2,$03,$F4,$F1,$E4,$FC   ;0D94AA|        |      ;
                       db $F0,$E2,$43,$04                   ;0D94B2|        |      ;
 
enemy_spriteAssemb_EC: db $03,$F0,$E6,$03,$F4,$F1,$E8,$FC   ;0D94B6|        |      ;
                       db $F0,$E6,$43,$04                   ;0D94BE|        |      ;
 
enemy_09_spriteAssemb_0E: db $03,$F0,$84,$03,$F4,$F1,$86,$FC   ;0D94C2|        |      ;
                       db $F1,$88,$04                       ;0D94CA|        |      ;
 
enemy_09_spriteAssemb_10: db $06,$E0,$84,$03,$F0,$E1,$86,$F8   ;0D94CD|        |      ;
                       db $E1,$A8,$00,$01,$AA,$F8,$01,$AC   ;0D94D5|        |      ;
                       db $00,$F9,$AE,$08                   ;0D94DD|        |      ;
 
enemy_09_spriteAssemb_12: db $03,$F0,$8A,$03,$F4,$F1,$8C,$FC   ;0D94E1|        |      ;
                       db $F1,$88,$04                       ;0D94E9|        |      ;
 
enemy_09_spriteAssemb_14: db $05,$F0,$90,$03,$F0,$E9,$92,$F8   ;0D94EC|        |      ;
                       db $E1,$94,$00,$E1,$96,$08,$01,$98   ;0D94F4|        |      ;
                       db $00                               ;0D94FC|        |      ;
 
enemy_09_spriteAssemb_5C: db $03,$F0,$80,$03,$F4,$F1,$82,$FC   ;0D94FD|        |      ;
                       db $F1,$88,$04                       ;0D9505|        |      ;
 
enemy_09_spriteAssemb_5E: db $04,$F0,$9A,$01,$F4,$F0,$80,$03   ;0D9508|        |      ;
                       db $F4,$F1,$82,$FC,$F1,$88,$04       ;0D9510|        |      ;
 
enemy_spriteAssemb_FA: db $05,$F0,$9C,$01,$EC,$F1,$9E,$F4   ;0D9517|        |      ;
                       db $F0,$80,$03,$F4,$F1,$82,$FC,$F1   ;0D951F|        |      ;
                       db $88,$04                           ;0D9527|        |      ;
 
enemy_spriteAssemb_FC: db $07,$F0,$9C,$01,$DC,$F1,$A0,$E4   ;0D9529|        |      ;
                       db $F3,$A0,$EC,$F1,$9E,$F4,$F0,$80   ;0D9531|        |      ;
                       db $03,$F4,$F1,$82,$FC,$F1,$88,$04   ;0D9539|        |      ;
 
enemy_09_spriteAssemb_16: db $04,$E0,$95,$02,$F5,$E1,$97,$FD   ;0D9541|        |      ;
                       db $01,$99,$F8,$01,$9B,$00           ;0D9549|        |      ;
 
enemy_09_spriteAssemb_18: db $04,$E0,$9D,$02,$F5,$E1,$9F,$FD   ;0D954F|        |      ;
                       db $01,$B0,$F8,$01,$B2,$00           ;0D9557|        |      ;
 
enemy_09_spriteAssemb_1A: db $04,$E0,$B4,$02,$F5,$E1,$B6,$FD   ;0D955D|        |      ;
                       db $01,$B8,$F8,$01,$BA,$00           ;0D9565|        |      ;
 
enemy_09_spriteAssemb_1C: db $02,$00,$A2,$02,$F8,$00,$A2,$42   ;0D956B|        |      ;
                       db $00                               ;0D9573|        |      ;
 
enemy_09_spriteAssemb_1E: db $02,$00,$BC,$02,$F8,$01,$BE,$00   ;0D9574|        |      ;
 
enemy_09_spriteAssemb_24: db $05,$E0,$D8,$02,$F8,$E1,$DA,$00   ;0D957C|        |      ;
                       db $01,$DC,$F8,$01,$DE,$00,$01,$E0   ;0D9584|        |      ;
                       db $08                               ;0D958C|        |      ;
 
enemy_09_spriteAssemb_26: db $05,$E0,$E2,$02,$F8,$E1,$E4,$00   ;0D958D|        |      ;
                       db $01,$E6,$F8,$01,$E8,$00,$01,$EA   ;0D9595|        |      ;
                       db $08                               ;0D959D|        |      ;
 
enemy_09_spriteAssemb_28: db $05,$E0,$EC,$02,$F9,$E1,$EE,$01   ;0D959E|        |      ;
                       db $01,$F0,$F8,$01,$F2,$00,$01,$F8   ;0D95A6|        |      ;
                       db $08                               ;0D95AE|        |      ;
 
enemy_09_spriteAssemb_2A: db $01,$F0,$F4,$02,$FC               ;0D95AF|        |      ;
 
enemy_09_spriteAssemb_2C: db $01,$F0,$F6,$02,$FC               ;0D95B4|        |      ;
 
enemy_09_spriteAssemb_2E: db $01,$F0,$F8,$02,$FC               ;0D95B9|        |      ;
 
enemy_09_spriteAssemb_30: db $04,$E2,$B0,$01,$F8,$E3,$B2,$00   ;0D95BE|        |      ;
                       db $01,$B4,$F8,$01,$B6,$00           ;0D95C6|        |      ;
 
enemy_09_spriteAssemb_32: db $04,$E2,$B0,$01,$F8,$E3,$B2,$00   ;0D95CC|        |      ;
                       db $01,$B8,$F8,$01,$BA,$00           ;0D95D4|        |      ;
 
enemy_09_spriteAssemb_34: db $04,$E0,$B0,$01,$F8,$E1,$B2,$00   ;0D95DA|        |      ;
                       db $01,$BC,$F8,$01,$BE,$00           ;0D95E2|        |      ;
 
enemy_09_spriteAssemb_56: db $04,$E2,$C0,$01,$F8,$E3,$C2,$00   ;0D95E8|        |      ;
                       db $01,$C4,$F8,$01,$C6,$00           ;0D95F0|        |      ;
 
enemy_09_spriteAssemb_58: db $04,$E2,$C0,$01,$F8,$E3,$C2,$00   ;0D95F6|        |      ;
                       db $01,$C8,$F8,$01,$CA,$00           ;0D95FE|        |      ;
 
enemy_09_spriteAssemb_5A: db $04,$E0,$C0,$01,$F8,$E1,$C2,$00   ;0D9604|        |      ;
                       db $01,$CC,$F8,$01,$CE,$00           ;0D960C|        |      ;
 
enemy_09_spriteAssemb_52: db $02,$F0,$F6,$01,$F8,$F1,$F8,$00   ;0D9612|        |      ;
 
enemy_09_spriteAssemb_54: db $02,$F0,$FA,$01,$F8,$F1,$FC,$00   ;0D961A|        |      ;
 
enemy_09_spriteAssemb_60: db $02,$F0,$B6,$01,$F8,$F1,$B8,$00   ;0D9622|        |      ;
 
enemy_09_spriteAssemb_62: db $02,$F0,$BA,$01,$F8,$F1,$BC,$00   ;0D962A|        |      ;
 
enemy_09_spriteAssemb_6E: db $09,$D0,$C0,$01,$F0,$E1,$C2,$F8   ;0D9632|        |      ;
                       db $E1,$C4,$00,$DB,$C6,$08,$D1,$C8   ;0D963A|        |      ;
                       db $10,$01,$CA,$FB,$01,$CC,$03,$1A   ;0D9642|        |      ;
                       db $84,$02,$F8,$1B,$86,$00           ;0D964A|        |      ;
 
enemy_09_spriteAssemb_70: db $0A,$E6,$CE,$01,$F0,$E1,$D0,$F8   ;0D9650|        |      ;
                       db $E1,$D2,$00,$E7,$D4,$08,$05,$D6   ;0D9658|        |      ;
                       db $F0,$01,$D8,$F8,$01,$DA,$00,$05   ;0D9660|        |      ;
                       db $DC,$08,$1E,$88,$02,$F8,$1F,$8A   ;0D9668|        |      ;
 
                       db $00                               ;0D9670|        |      ;
 
enemy_09_spriteAssemb_72: db $07,$D0,$C0,$01,$F0,$E1,$C2,$F8   ;0D9671|        |      ;
                       db $E1,$C4,$00,$DB,$C6,$08,$D1,$C8   ;0D9679|        |      ;
                       db $10,$01,$CA,$FB,$01,$CC,$03       ;0D9681|        |      ;
 
enemy_09_spriteAssemb_74: db $08,$E6,$CE,$01,$F0,$E1,$D0,$F8   ;0D9688|        |      ;
                       db $E1,$D2,$00,$E7,$D4,$08,$05,$D6   ;0D9690|        |      ;
                       db $F0,$01,$D8,$F8,$01,$DA,$00,$05   ;0D9698|        |      ;
                       db $DC,$08                           ;0D96A0|        |      ;
 
 
  bossAssembPointer05: dw boss2_spriteAssemb_00             ;0D96A2|        |0D9782;
                       dw boss2_spriteAssemb_00             ;0D96A4|        |0D9782;
                       dw boss2_spriteAssemb_04             ;0D96A6|        |0D97A9;
                       dw boss2_spriteAssemb_06             ;0D96A8|        |0D97CA;
                       dw boss2_spriteAssemb_04             ;0D96AA|        |0D97A9;
                       dw boss2_spriteAssemb_0A             ;0D96AC|        |0D97EE;
                       dw boss2_spriteAssemb_0C             ;0D96AE|        |0D9815;
                       dw boss2_spriteAssemb_0E             ;0D96B0|        |0D9836;
                       dw boss2_spriteAssemb_10             ;0D96B2|        |0D9860;
 
                       dw boss2_spriteAssemb_12             ;0D96B4|        |0D9881;
                       dw boss2_spriteAssemb_14             ;0D96B6|        |0D9889;
                       dw boss2_spriteAssemb_16             ;0D96B8|        |0D988E;
                       dw boss2_spriteAssemb_18             ;0D96BA|        |0D9896;
                       dw boss2_spriteAssemb_1A             ;0D96BC|        |0D98B7;
                       dw boss2_spriteAssemb_1C             ;0D96BE|        |0D98D8;
                       dw boss2_spriteAssemb_1A             ;0D96C0|        |0D98B7;
                       dw boss2_spriteAssemb_20             ;0D96C2|        |0D98FC;
                       dw boss2_spriteAssemb_22             ;0D96C4|        |0D9920;
                       dw boss2_spriteAssemb_24             ;0D96C6|        |0D9944;
                       dw boss2_spriteAssemb_26             ;0D96C8|        |0D9961;
                       dw boss2_spriteAssemb_28             ;0D96CA|        |0D996F;
                       dw boss2_spriteAssemb_00             ;0D96CC|        |0D9782;
                       dw boss2_spriteAssemb_00             ;0D96CE|        |0D9782;
 
                       dw boss2_spriteAssemb_2E             ;0D96D0|        |0D9978;
                       dw boss2_spriteAssemb_00             ;0D96D2|        |0D9782;
                       dw boss2_spriteAssemb_00             ;0D96D4|        |0D9782;
 
                       dw boss2_spriteAssemb_00             ;0D96D6|        |0D9782;
                       dw boss2_spriteAssemb_00             ;0D96D8|        |0D9782;
                       dw boss2_spriteAssemb_00             ;0D96DA|        |0D9782;
                       dw boss2_spriteAssemb_3A             ;0D96DC|        |0D99F3;
                       dw boss2_spriteAssemb_3C             ;0D96DE|        |0D9A07;
                       dw boss2_spriteAssemb_3E             ;0D96E0|        |0D9A1B;
                       dw boss2_spriteAssemb_40             ;0D96E2|        |0D9A2F;
                       dw boss2_spriteAssemb_42             ;0D96E4|        |0D9A43;
                       dw boss2_spriteAssemb_44             ;0D96E6|        |0D9A57;
                       dw boss2_spriteAssemb_46             ;0D96E8|        |0D9A6E;
                       dw boss2_spriteAssemb_48             ;0D96EA|        |0D9A82;
                       dw boss2_spriteAssemb_4A             ;0D96EC|        |0D9A96;
                       dw boss2_spriteAssemb_4C             ;0D96EE|        |0D9AA7;
                       dw boss2_spriteAssemb_4E             ;0D96F0|        |0D9AAF;
                       dw boss2_spriteAssemb_50             ;0D96F2|        |0D9AB7;
                       dw boss2_spriteAssemb_52             ;0D96F4|        |0D9ABF;
                       dw boss2_spriteAssemb_54             ;0D96F6|        |0D9AC7;
                       dw boss2_spriteAssemb_56             ;0D96F8|        |0D9AF0;
                       dw boss2_spriteAssemb_58             ;0D96FA|        |0D9B17;
                       dw boss2_spriteAssemb_5A             ;0D96FC|        |0D9B31;
                       dw boss2_spriteAssemb_5C             ;0D96FE|        |0D9B48;
                       dw boss2_spriteAssemb_5E             ;0D9700|        |0D9B5F;
                       dw boss2_spriteAssemb_60             ;0D9702|        |0D9B6A;
                       dw boss2_spriteAssemb_62             ;0D9704|        |0D9B78;
                       dw boss2_spriteAssemb_64             ;0D9706|        |0D9B80;
 
                       dw boss2_spriteAssemb_66             ;0D9708|        |0D9B88;
                       dw boss2_spriteAssemb_68             ;0D970A|        |0D9B96;
                       dw boss2_spriteAssemb_6A             ;0D970C|        |0D9BBD;
                       dw boss2_spriteAssemb_6C             ;0D970E|        |0D9BD7;
                       dw boss2_spriteAssemb_6E             ;0D9710|        |0D9BDC;
 
                       dw boss2_spriteAssemb_70             ;0D9712|        |0D9BF6;
                       dw boss2_spriteAssemb_72             ;0D9714|        |0D9C17;
                       dw boss2_spriteAssemb_74             ;0D9716|        |0D9C45;
                       dw boss2_spriteAssemb_76             ;0D9718|        |0D9C66;
                       dw boss2_spriteAssemb_78             ;0D971A|        |0D9C87;
                       dw boss2_spriteAssemb_7A             ;0D971C|        |0D9CB1;
                       dw boss2_spriteAssemb_7C             ;0D971E|        |0D9CBD;
                       dw boss2_spriteAssemb_7E             ;0D9720|        |0D9CC6;
                       dw boss2_spriteAssemb_80             ;0D9722|        |0D9CCE;
                       dw boss2_spriteAssemb_82             ;0D9724|        |0D9CD6;
                       dw boss2_spriteAssemb_84             ;0D9726|        |0D9CDE;
                       dw boss2_spriteAssemb_86             ;0D9728|        |0D9CFB;
                       dw boss2_spriteAssemb_88             ;0D972A|        |0D9D15;
                       dw boss2_spriteAssemb_8A             ;0D972C|        |0D9D26;
                       dw boss2_spriteAssemb_8C             ;0D972E|        |0D9D37;
                       dw boss2_spriteAssemb_8E             ;0D9730|        |0D9D45;
                       dw boss2_spriteAssemb_90             ;0D9732|        |0D9D53;
                       dw boss2_spriteAssemb_92             ;0D9734|        |0D9D61;
                       dw boss2_spriteAssemb_94             ;0D9736|        |0D9ACF;
                       dw boss2_spriteAssemb_96             ;0D9738|        |0D9ADD;
                       dw boss2_spriteAssemb_98             ;0D973A|        |0D9AE8;
                       dw boss2_spriteAssemb_9A             ;0D973C|        |0D9D6F;
                       dw boss2_spriteAssemb_9C             ;0D973E|        |0D9D7D;
                       dw boss2_spriteAssemb_9E             ;0D9740|        |0D9D88;
                       dw boss2_spriteAssemb_A0             ;0D9742|        |0D9D93;
                       dw boss2_spriteAssemb_A2             ;0D9744|        |0D9DA1;
                       dw boss2_spriteAssemb_A4             ;0D9746|        |0D9DAF;
                       dw boss2_spriteAssemb_A6             ;0D9748|        |0D9DB7;
                       dw boss2_spriteAssemb_A8             ;0D974A|        |0D9DBF;
                       dw boss2_spriteAssemb_AA             ;0D974C|        |0D9DC4;
                       dw boss2_spriteAssemb_AC             ;0D974E|        |0D9DCC;
                       dw boss2_spriteAssemb_AE             ;0D9750|        |0D9DD4;
                       dw boss2_spriteAssemb_B0             ;0D9752|        |0D9DD9;
                       dw boss2_spriteAssemb_B2             ;0D9754|        |0D9DDE;
                       dw boss2_spriteAssemb_B4             ;0D9756|        |0D9DE3;
                       dw boss2_spriteAssemb_B6             ;0D9758|        |0D9DE8;
                       dw boss2_spriteAssemb_B8             ;0D975A|        |0D9DED;
                       dw boss2_spriteAssemb_BA             ;0D975C|        |0D9DF2;
                       dw boss2_spriteAssemb_BC             ;0D975E|        |0D9DFB;
                       dw boss2_spriteAssemb_BE             ;0D9760|        |0D9E1A;
                       dw boss2_spriteAssemb_C0             ;0D9762|        |0D9E31;
                       dw boss2_spriteAssemb_C2             ;0D9764|        |0D9E40;
 
                       dw boss2_spriteAssemb_C4             ;0D9766|        |0D9E4F;
                       dw boss2_spriteAssemb_C6             ;0D9768|        |0D9E75;
                       dw boss2_spriteAssemb_C8             ;0D976A|        |0D9E95;
                       dw boss2_spriteAssemb_C6             ;0D976C|        |0D9E75;
                       dw boss2_spriteAssemb_CC             ;0D976E|        |0D9EBB;
                       dw boss2_spriteAssemb_CE             ;0D9770|        |0D9EE1;
                       dw boss2_spriteAssemb_D0             ;0D9772|        |0D9F0A;
                       dw boss2_spriteAssemb_D2             ;0D9774|        |0D9F30;
                       dw boss2_spriteAssemb_D4             ;0D9776|        |0D9F56;
                       dw boss2_spriteAssemb_D6             ;0D9778|        |0D9F82;
                       dw boss2_spriteAssemb_D8             ;0D977A|        |0D9F9F;
                       dw boss2_spriteAssemb_DA             ;0D977C|        |0D9FB3;
                       dw boss2_spriteAssemb_DC             ;0D977E|        |0DA9B9;
                       dw boss2_spriteAssemb_DE             ;0D9780|        |0DA99B;
 
boss2_spriteAssemb_00: db $0C,$F0,$C0,$03,$00,$F1,$C2,$08   ;0D9782|        |      ;
                       db $D2,$80,$02,$EE,$D3,$82,$F6,$D3   ;0D978A|        |      ;
                       db $84,$FE,$D1,$86,$E8,$F1,$88,$E8   ;0D9792|        |      ;
                       db $F1,$8A,$F0,$F1,$8C,$F8,$11,$8E   ;0D979A|        |      ;
                       db $F8,$11,$90,$00,$11,$92,$08       ;0D97A2|        |      ;
 
boss2_spriteAssemb_04: db $0A,$F2,$C0,$03,$FF,$F3,$C2,$07   ;0D97A9|        |      ;
                       db $D0,$80,$02,$F0,$D1,$82,$F8,$D1   ;0D97B1|        |      ;
                       db $84,$00,$E1,$94,$E8,$F1,$96,$F0   ;0D97B9|        |      ;
                       db $F1,$98,$F8,$11,$9A,$FA,$11,$9C   ;0D97C1|        |      ;
                       db $02                               ;0D97C9|        |      ;
 
boss2_spriteAssemb_06: db $0B,$F2,$C0,$03,$FD,$F3,$C2,$05   ;0D97CA|        |      ;
                       db $D2,$80,$02,$F0,$D3,$82,$F8,$D3   ;0D97D2|        |      ;
                       db $84,$00,$F1,$9E,$E8,$F1,$A0,$F0   ;0D97DA|        |      ;
                       db $F1,$A2,$F8,$11,$A4,$F8,$11,$A6   ;0D97E2|        |      ;
                       db $00,$11,$A8,$08                   ;0D97EA|        |      ;
 
boss2_spriteAssemb_0A: db $0C,$F0,$C0,$03,$01,$F1,$C2,$09   ;0D97EE|        |      ;
                       db $D2,$80,$02,$F3,$D3,$82,$FB,$D3   ;0D97F6|        |      ;
                       db $84,$03,$D1,$86,$EA,$F1,$88,$EA   ;0D97FE|        |      ;
                       db $F1,$8A,$F2,$F1,$8C,$FA,$11,$8E   ;0D9806|        |      ;
                       db $F8,$11,$90,$00,$11,$92,$08       ;0D980E|        |      ;
 
boss2_spriteAssemb_0C: db $0A,$F0,$C0,$03,$01,$F1,$C2,$09   ;0D9815|        |      ;
                       db $D2,$AA,$02,$F8,$D3,$AC,$00,$D3   ;0D981D|        |      ;
                       db $AE,$08,$D3,$B0,$10,$F1,$8C,$FB   ;0D9825|        |      ;
                       db $11,$8E,$F8,$11,$90,$00,$11,$92   ;0D982D|        |      ;
                       db $08                               ;0D9835|        |      ;
 
boss2_spriteAssemb_0E: db $0D,$F2,$C0,$03,$00,$F3,$C2,$08   ;0D9836|        |      ;
                       db $D2,$80,$02,$F0,$D3,$82,$F8,$D3   ;0D983E|        |      ;
                       db $84,$00,$F7,$9E,$D8,$F7,$A0,$E0   ;0D9846|        |      ;
                       db $F5,$B2,$E8,$F1,$B4,$F0,$F1,$A2   ;0D984E|        |      ;
                       db $F8,$11,$A4,$F8,$11,$A6,$00,$11   ;0D9856|        |      ;
                       db $A8,$08                           ;0D985E|        |      ;
 
boss2_spriteAssemb_10: db $0A,$F2,$C0,$03,$FF,$F3,$C2,$07   ;0D9860|        |      ;
                       db $D0,$80,$02,$F0,$D1,$82,$F8,$D1   ;0D9868|        |      ;
                       db $84,$00,$E1,$94,$E8,$F1,$96,$F0   ;0D9870|        |      ;
                       db $F1,$98,$F8,$11,$F2,$F8,$11,$F4   ;0D9878|        |      ;
                       db $00                               ;0D9880|        |      ;
 
boss2_spriteAssemb_12: db $02,$F8,$EC,$02,$F8,$F9,$EE,$00   ;0D9881|        |      ;
 
boss2_spriteAssemb_14: db $01,$F8,$F0,$02,$FC               ;0D9889|        |      ;
 
boss2_spriteAssemb_16: db $02,$F8,$EE,$42,$F8,$F9,$EC,$00   ;0D988E|        |      ;
 
boss2_spriteAssemb_18: db $0A,$C2,$80,$01,$F2,$C3,$82,$FA   ;0D9896|        |      ;
                       db $C3,$84,$02,$E1,$86,$F6,$E1,$88   ;0D989E|        |      ;
                       db $FE,$E1,$8A,$06,$01,$8C,$FC,$01   ;0D98A6|        |      ;
                       db $8E,$04,$BA,$B4,$02,$FF,$BB,$B6   ;0D98AE|        |      ;
                       db $07                               ;0D98B6|        |      ;
 
boss2_spriteAssemb_1A: db $0A,$C0,$80,$01,$F3,$C1,$82,$FB   ;0D98B7|        |      ;
                       db $C1,$84,$03,$E1,$90,$F7,$E1,$92   ;0D98BF|        |      ;
                       db $FF,$E1,$94,$07,$01,$96,$FB,$01   ;0D98C7|        |      ;
                       db $98,$03,$BA,$B4,$02,$00,$BB,$B6   ;0D98CF|        |      ;
                       db $08                               ;0D98D7|        |      ;
 
boss2_spriteAssemb_1C: db $0B,$C0,$80,$01,$F4,$C1,$82,$FC   ;0D98D8|        |      ;
                       db $C1,$84,$04,$E1,$9A,$F8,$E1,$9C   ;0D98E0|        |      ;
                       db $00,$E1,$9E,$08,$01,$A0,$F8,$01   ;0D98E8|        |      ;
                       db $A2,$00,$01,$A4,$08,$B8,$B4,$02   ;0D98F0|        |      ;
                       db $00,$B9,$B6,$08                   ;0D98F8|        |      ;
 
boss2_spriteAssemb_20: db $0B,$C0,$A6,$01,$F9,$C1,$A8,$01   ;0D98FC|        |      ;
                       db $C1,$AA,$09,$E1,$AC,$F8,$E1,$AE   ;0D9904|        |      ;
                       db $00,$E1,$B0,$08,$01,$A0,$F8,$01   ;0D990C|        |      ;
                       db $A2,$00,$01,$A4,$08,$B0,$B8,$02   ;0D9914|        |      ;
                       db $08,$B1,$BA,$10                   ;0D991C|        |      ;
 
boss2_spriteAssemb_22: db $0B,$C0,$80,$01,$F2,$C1,$82,$FA   ;0D9920|        |      ;
                       db $C1,$84,$02,$E1,$B2,$F6,$E1,$88   ;0D9928|        |      ;
                       db $FE,$E1,$8A,$06,$01,$8C,$FC,$01   ;0D9930|        |      ;
                       db $8E,$04,$00,$B8,$02,$E4,$01,$BA   ;0D9938|        |      ;
                       db $EC,$01,$BE,$F4                   ;0D9940|        |      ;
 
boss2_spriteAssemb_24: db $09,$A0,$C4,$02,$FB,$C1,$C6,$F3   ;0D9944|        |      ;
                       db $C1,$C8,$FB,$C1,$CA,$03,$E1,$CC   ;0D994C|        |      ;
                       db $F8,$E1,$CE,$00,$01,$D0,$F3,$01   ;0D9954|        |      ;
                       db $D2,$FB,$01,$D4,$03               ;0D995C|        |      ;
 
boss2_spriteAssemb_26: db $04,$F0,$51,$01,$F0,$F1,$61,$F8   ;0D9961|        |      ;
                       db $F1,$53,$00,$F1,$63,$08           ;0D9969|        |      ;
 
boss2_spriteAssemb_28: db $02,$00,$F4,$01,$FC,$18,$F4,$41   ;0D996F|        |      ;
                       db $F8                               ;0D9977|        |      ;
 
boss2_spriteAssemb_2E: db $1B,$80,$F0,$01,$FC,$91,$C4,$CC   ;0D9978|        |      ;
                       db $91,$C8,$D4,$90,$C4,$C1,$DC,$A0   ;0D9980|        |      ;
                       db $C6,$41,$E4,$A1,$C8,$EC,$A0,$C4   ;0D9988|        |      ;
                       db $01,$F4,$A0,$F2,$41,$FC,$B0,$E0   ;0D9990|        |      ;
                       db $01,$D4,$B1,$D6,$DC,$B1,$C4,$04   ;0D9998|        |      ;
                       db $C1,$D8,$CC,$C1,$F2,$FC,$D0,$D8   ;0D99A0|        |      ;
                       db $41,$D4,$E0,$F2,$01,$F6,$E1,$F0   ;0D99A8|        |      ;
                       db $FC,$E1,$C8,$04,$E1,$CE,$0C,$01   ;0D99B0|        |      ;
                       db $F2,$F2,$00,$F2,$C1,$FC,$00,$C2   ;0D99B8|        |      ;
                       db $01,$14,$21,$E0,$E4,$21,$F2,$EC   ;0D99C0|        |      ;
                       db $20,$F0,$C1,$FC,$40,$CA,$41,$E4   ;0D99C8|        |      ;
                       db $40,$F2,$01,$FC,$60,$F2,$41,$FC   ;0D99D0|        |      ;
 
 
  miscSpriteAssemb_10: db $08,$C2,$80,$01,$F2,$C3,$82,$FA   ;0D99D8|        |      ;
                       db $C3,$84,$02,$E1,$86,$F6,$E1,$88   ;0D99E0|        |      ;
                       db $FE,$E1,$8A,$06,$BA,$B4,$02,$FF   ;0D99E8|        |      ;
                       db $BB,$B6,$07                       ;0D99F0|        |      ;
 
boss2_spriteAssemb_3A: db $06,$E0,$80,$02,$F8,$E1,$82,$00   ;0D99F3|        |      ;
                       db $E1,$84,$08,$01,$86,$F8,$01,$88   ;0D99FB|        |      ;
                       db $00,$01,$8A,$08                   ;0D9A03|        |      ;
 
boss2_spriteAssemb_3C: db $06,$F0,$8C,$02,$E8,$E1,$8E,$F0   ;0D9A07|        |      ;
                       db $E1,$90,$F8,$E1,$92,$00,$01,$94   ;0D9A0F|        |      ;
                       db $00,$01,$96,$08                   ;0D9A17|        |      ;
 
boss2_spriteAssemb_3E: db $06,$E0,$98,$02,$F0,$E1,$9A,$F8   ;0D9A1B|        |      ;
                       db $E1,$9C,$00,$01,$9E,$F0,$01,$A0   ;0D9A23|        |      ;
                       db $F8,$01,$A2,$00                   ;0D9A2B|        |      ;
 
boss2_spriteAssemb_40: db $06,$D6,$A4,$02,$F0,$E1,$A6,$F8   ;0D9A2F|        |      ;
                       db $E1,$A8,$00,$11,$AA,$F0,$01,$AC   ;0D9A37|        |      ;
                       db $F8,$01,$AE,$00                   ;0D9A3F|        |      ;
 
boss2_spriteAssemb_42: db $06,$F0,$B0,$02,$F0,$E1,$B2,$F8   ;0D9A43|        |      ;
                       db $E1,$B4,$00,$01,$B6,$F8,$01,$B8   ;0D9A4B|        |      ;
                       db $00,$F1,$BA,$08                   ;0D9A53|        |      ;
 
boss2_spriteAssemb_44: db $07,$E0,$BC,$02,$F0,$E1,$BE,$F8   ;0D9A57|        |      ;
                       db $01,$C0,$F0,$01,$C2,$F8,$F1,$C4   ;0D9A5F|        |      ;
                       db $00,$E9,$C6,$08,$E1,$C8,$10       ;0D9A67|        |      ;
 
boss2_spriteAssemb_46: db $06,$E0,$9E,$82,$F0,$E1,$A0,$F8   ;0D9A6E|        |      ;
                       db $E1,$A2,$00,$01,$98,$F0,$01,$9A   ;0D9A76|        |      ;
                       db $F8,$01,$9C,$00                   ;0D9A7E|        |      ;
 
boss2_spriteAssemb_48: db $06,$D0,$AA,$82,$F0,$E1,$AC,$F8   ;0D9A82|        |      ;
                       db $E1,$AE,$00,$0B,$A4,$F0,$01,$A6   ;0D9A8A|        |      ;
                       db $F8,$01,$A8,$00                   ;0D9A92|        |      ;
 
boss2_spriteAssemb_4A: db $05,$F0,$CE,$02,$E8,$F1,$D0,$F0   ;0D9A96|        |      ;
                       db $F1,$D2,$F8,$F1,$D4,$00,$F1,$D6   ;0D9A9E|        |      ;
                       db $08                               ;0D9AA6|        |      ;
 
boss2_spriteAssemb_4C: db $02,$F0,$D8,$81,$F8,$F1,$DA,$00   ;0D9AA7|        |      ;
 
boss2_spriteAssemb_4E: db $02,$F0,$DC,$02,$F8,$F1,$DE,$00   ;0D9AAF|        |      ;
 
boss2_spriteAssemb_50: db $02,$F0,$DE,$42,$F8,$F1,$DC,$00   ;0D9AB7|        |      ;
 
boss2_spriteAssemb_52: db $02,$F0,$DE,$C2,$F8,$F1,$DC,$00   ;0D9ABF|        |      ;
 
boss2_spriteAssemb_54: db $02,$F0,$DC,$82,$F8,$F1,$DE,$00   ;0D9AC7|        |      ;
 
boss2_spriteAssemb_94: db $04,$F0,$F2,$00,$F0,$F1,$F4,$F8   ;0D9ACF|        |      ;
                       db $F1,$F6,$00,$F1,$F8,$08           ;0D9AD7|        |      ;
 
boss2_spriteAssemb_96: db $03,$F0,$E0,$00,$F4,$F1,$E2,$FC   ;0D9ADD|        |      ;
                       db $F1,$E4,$04                       ;0D9AE5|        |      ;
 
boss2_spriteAssemb_98: db $02,$F0,$CA,$02,$F8,$F1,$CC,$00   ;0D9AE8|        |      ;
 
boss2_spriteAssemb_56: db $0C,$E0,$82,$02,$F8,$E1,$84,$00   ;0D9AF0|        |      ;
                       db $E1,$86,$08,$E1,$88,$10,$E1,$8A   ;0D9AF8|        |      ;
                       db $18,$01,$8C,$F8,$01,$8E,$00,$01   ;0D9B00|        |      ;
                       db $90,$08,$01,$92,$10,$01,$E0,$F0   ;0D9B08|        |      ;
                       db $E0,$8A,$42,$E8,$E1,$88,$F0       ;0D9B10|        |      ;
 
boss2_spriteAssemb_58: db $08,$D0,$94,$02,$F8,$D1,$96,$00   ;0D9B17|        |      ;
                       db $F1,$98,$F7,$F1,$9A,$FF,$F1,$9C   ;0D9B1F|        |      ;
                       db $07,$11,$9E,$F6,$11,$A0,$FE,$11   ;0D9B27|        |      ;
                       db $A2,$06                           ;0D9B2F|        |      ;
 
boss2_spriteAssemb_5A: db $07,$E0,$A4,$02,$F0,$E1,$A6,$F8   ;0D9B31|        |      ;
                       db $E1,$A8,$00,$E1,$AA,$08,$E1,$AC   ;0D9B39|        |      ;
                       db $10,$01,$AE,$F8,$01,$B0,$00       ;0D9B41|        |      ;
 
boss2_spriteAssemb_5C: db $07,$E0,$B2,$02,$F9,$E1,$B4,$FF   ;0D9B48|        |      ;
                       db $01,$B6,$F8,$01,$B8,$00,$01,$BA   ;0D9B50|        |      ;
                       db $08,$21,$BC,$FA,$21,$BE,$02       ;0D9B58|        |      ;
 
boss2_spriteAssemb_5E: db $03,$F0,$C0,$02,$F8,$F1,$C2,$00   ;0D9B5F|        |      ;
                       db $F1,$C4,$08                       ;0D9B67|        |      ;
 
boss2_spriteAssemb_60: db $03,$F0,$C6,$02,$FB,$F1,$C8,$03   ;0D9B6A|        |      ;
                       db $01,$CA,$FB,$01,$CC,$03           ;0D9B72|        |      ;
 
boss2_spriteAssemb_62: db $02,$F0,$CE,$02,$F8,$F1,$D0,$00   ;0D9B78|        |      ;
 
boss2_spriteAssemb_64: db $02,$F8,$D2,$02,$F8,$F9,$D4,$00   ;0D9B80|        |      ;
 
boss2_spriteAssemb_66: db $04,$E0,$D6,$02,$F8,$E1,$D8,$00   ;0D9B88|        |      ;
                       db $01,$DA,$F8,$01,$DC,$00           ;0D9B90|        |      ;
 
boss2_spriteAssemb_68: db $0C,$E0,$8C,$82,$F8,$E1,$8E,$00   ;0D9B96|        |      ;
                       db $E1,$90,$08,$E1,$92,$10,$E1,$E0   ;0D9B9E|        |      ;
                       db $F0,$01,$82,$F8,$01,$84,$00,$01   ;0D9BA6|        |      ;
                       db $86,$08,$01,$88,$10,$01,$8A,$18   ;0D9BAE|        |      ;
                       db $00,$8A,$C2,$E8,$01,$88,$F0       ;0D9BB6|        |      ;
 
boss2_spriteAssemb_6A: db $08,$D0,$9E,$82,$F6,$D1,$A0,$FE   ;0D9BBD|        |      ;
                       db $D1,$A2,$06,$F1,$98,$F7,$F1,$9A   ;0D9BC5|        |      ;
                       db $FF,$F1,$9C,$07,$11,$94,$F8,$11   ;0D9BCD|        |      ;
                       db $96,$00                           ;0D9BD5|        |      ;
 
boss2_spriteAssemb_6C: db $01,$00,$80,$03,$00               ;0D9BD7|        |      ;
 
boss2_spriteAssemb_6E: db $08,$E0,$82,$01,$F4,$E1,$84,$FC   ;0D9BDC|        |      ;
                       db $E1,$86,$04,$E1,$88,$0C,$01,$8A   ;0D9BE4|        |      ;
                       db $F4,$01,$8C,$FC,$01,$8E,$04,$01   ;0D9BEC|        |      ;
                       db $90,$0C                           ;0D9BF4|        |      ;
 
boss2_spriteAssemb_70: db $0A,$D4,$92,$01,$F4,$D1,$94,$FC   ;0D9BF6|        |      ;
                       db $D1,$96,$04,$D5,$98,$0C,$E0,$BE   ;0D9BFE|        |      ;
                       db $03,$F8,$E1,$C0,$00,$E1,$C2,$08   ;0D9C06|        |      ;
                       db $01,$C4,$F8,$01,$C6,$00,$01,$C8   ;0D9C0E|        |      ;
                       db $08                               ;0D9C16|        |      ;
 
boss2_spriteAssemb_72: db $0E,$B0,$B6,$03,$FF,$A0,$9A,$01   ;0D9C17|        |      ;
                       db $F4,$A1,$9C,$FC,$A1,$9E,$04,$A1   ;0D9C1F|        |      ;
                       db $A0,$0C,$C0,$B8,$03,$F8,$C1,$BA   ;0D9C27|        |      ;
                       db $00,$C1,$BC,$08,$E1,$BE,$F8,$E1   ;0D9C2F|        |      ;
                       db $C0,$00,$E1,$C2,$08,$01,$C4,$F8   ;0D9C37|        |      ;
                       db $01,$C6,$00,$01,$C8,$08           ;0D9C3F|        |      ;
 
boss2_spriteAssemb_74: db $0A,$B0,$B6,$01,$FF,$C0,$B8,$03   ;0D9C45|        |      ;
                       db $F8,$C1,$BA,$00,$C1,$BC,$08,$E1   ;0D9C4D|        |      ;
                       db $BE,$F8,$E1,$C0,$00,$E1,$C2,$08   ;0D9C55|        |      ;
                       db $01,$C4,$F8,$01,$C6,$00,$01,$C8   ;0D9C5D|        |      ;
                       db $08                               ;0D9C65|        |      ;
 
boss2_spriteAssemb_76: db $0A,$B0,$B6,$01,$FF,$C0,$CA,$03   ;0D9C66|        |      ;
                       db $F8,$C1,$BA,$00,$C1,$BC,$08,$E1   ;0D9C6E|        |      ;
                       db $CC,$F8,$E1,$CE,$00,$E1,$C2,$08   ;0D9C76|        |      ;
                       db $01,$D0,$F8,$01,$D2,$00,$01,$C8   ;0D9C7E|        |      ;
                       db $08                               ;0D9C86|        |      ;
 
boss2_spriteAssemb_78: db $0D,$B0,$B6,$01,$FF,$C0,$D4,$03   ;0D9C87|        |      ;
                       db $F8,$C1,$D6,$00,$C1,$D8,$08,$C1   ;0D9C8F|        |      ;
                       db $DA,$10,$E1,$CC,$F8,$E1,$EA,$00   ;0D9C97|        |      ;
                       db $E1,$EA,$08,$E1,$DC,$10,$01,$D0   ;0D9C9F|        |      ;
                       db $F8,$01,$EA,$00,$01,$EA,$08,$01   ;0D9CA7|        |      ;
                       db $DE,$10                           ;0D9CAF|        |      ;
 
boss2_spriteAssemb_7A: db $03,$F0,$A2,$03,$F4,$F1,$A4,$FC   ;0D9CB1|        |      ;
                       db $F0,$A2,$43,$04                   ;0D9CB9|        |      ;
 
boss2_spriteAssemb_7C: db $02,$F0,$A6,$03,$F8,$F0,$A6,$43   ;0D9CBD|        |      ;
                       db $00                               ;0D9CC5|        |      ;
 
boss2_spriteAssemb_7E: db $02,$F0,$A8,$03,$F8,$F1,$AA,$00   ;0D9CC6|        |      ;
 
boss2_spriteAssemb_80: db $02,$F0,$AC,$03,$F8,$F1,$AE,$00   ;0D9CCE|        |      ;
 
boss2_spriteAssemb_82: db $02,$F0,$AC,$83,$F8,$F1,$AE,$00   ;0D9CD6|        |      ;
 
boss2_spriteAssemb_84: db $09,$C6,$B8,$03,$F8,$C7,$BA,$00   ;0D9CDE|        |      ;
                       db $C7,$BC,$08,$E1,$B8,$F8,$E1,$C0   ;0D9CE6|        |      ;
                       db $00,$E1,$C2,$08,$01,$C4,$F8,$01   ;0D9CEE|        |      ;
                       db $C6,$00,$01,$C8,$08               ;0D9CF6|        |      ;
 
boss2_spriteAssemb_86: db $08,$00,$E2,$03,$F0,$01,$EA,$F8   ;0D9CFB|        |      ;
                       db $01,$E4,$00,$01,$E6,$08,$01,$E8   ;0D9D03|        |      ;
                       db $10,$E7,$B8,$F8,$E7,$BA,$00,$E7   ;0D9D0B|        |      ;
                       db $BC,$08                           ;0D9D13|        |      ;
 
boss2_spriteAssemb_88: db $05,$00,$EC,$03,$F0,$01,$EE,$F8   ;0D9D15|        |      ;
                       db $01,$F0,$00,$01,$F2,$08,$01,$F4   ;0D9D1D|        |      ;
                       db $10                               ;0D9D25|        |      ;
 
boss2_spriteAssemb_8A: db $05,$00,$EC,$01,$F0,$01,$EE,$F8   ;0D9D26|        |      ;
                       db $01,$F0,$00,$01,$F2,$08,$01,$F4   ;0D9D2E|        |      ;
                       db $10                               ;0D9D36|        |      ;
 
boss2_spriteAssemb_8C: db $04,$00,$F6,$02,$F4,$01,$F8,$FC   ;0D9D37|        |      ;
                       db $01,$FA,$04,$01,$FC,$0C           ;0D9D3F|        |      ;
 
boss2_spriteAssemb_8E: db $04,$00,$F6,$01,$F4,$01,$F8,$FC   ;0D9D45|        |      ;
                       db $01,$FA,$04,$01,$FC,$0C           ;0D9D4D|        |      ;
 
boss2_spriteAssemb_90: db $04,$E0,$57,$01,$F8,$E1,$59,$00   ;0D9D53|        |      ;
                       db $01,$69,$F8,$01,$6B,$00           ;0D9D5B|        |      ;
 
boss2_spriteAssemb_92: db $04,$E0,$57,$03,$F8,$E1,$59,$00   ;0D9D61|        |      ;
                       db $01,$69,$F8,$01,$6B,$00           ;0D9D69|        |      ;
 
boss2_spriteAssemb_9A: db $04,$E0,$D4,$02,$F7,$E1,$D6,$FF   ;0D9D6F|        |      ;
                       db $01,$D8,$F9,$01,$DA,$01           ;0D9D77|        |      ;
 
boss2_spriteAssemb_9C: db $03,$EA,$C0,$02,$F4,$EF,$C2,$FC   ;0D9D7D|        |      ;
                       db $F1,$C4,$04                       ;0D9D85|        |      ;
 
boss2_spriteAssemb_9E: db $03,$F2,$C6,$02,$F4,$F1,$C8,$FC   ;0D9D88|        |      ;
                       db $EF,$CA,$04                       ;0D9D90|        |      ;
 
boss2_spriteAssemb_A0: db $04,$E0,$CE,$02,$FC,$E1,$D0,$04   ;0D9D93|        |      ;
                       db $F1,$CC,$F4,$01,$D2,$FC           ;0D9D9B|        |      ;
 
boss2_spriteAssemb_A2: db $04,$E0,$DA,$C2,$F7,$E1,$D8,$FF   ;0D9DA1|        |      ;
                       db $01,$D6,$F9,$01,$D4,$01           ;0D9DA9|        |      ;
 
boss2_spriteAssemb_A4: db $02,$F0,$E2,$02,$F8,$F1,$E4,$00   ;0D9DAF|        |      ;
 
boss2_spriteAssemb_A6: db $02,$F0,$DE,$02,$F8,$F1,$E0,$00   ;0D9DB7|        |      ;
 
boss2_spriteAssemb_A8: db $01,$F0,$DC,$02,$FC               ;0D9DBF|        |      ;
 
boss2_spriteAssemb_AA: db $02,$F0,$E0,$42,$F8,$F1,$DE,$00   ;0D9DC4|        |      ;
 
boss2_spriteAssemb_AC: db $02,$F0,$E4,$42,$F8,$F1,$E2,$00   ;0D9DCC|        |      ;
 
boss2_spriteAssemb_AE: db $01,$F0,$EA,$02,$FC               ;0D9DD4|        |      ;
 
boss2_spriteAssemb_B0: db $01,$F0,$E8,$02,$FC               ;0D9DD9|        |      ;
 
boss2_spriteAssemb_B2: db $01,$F0,$E6,$02,$FC               ;0D9DDE|        |      ;
 
boss2_spriteAssemb_B4: db $01,$F0,$E8,$82,$FC               ;0D9DE3|        |      ;
 
boss2_spriteAssemb_B6: db $01,$F0,$EA,$82,$FC               ;0D9DE8|        |      ;
 
boss2_spriteAssemb_B8: db $01,$00,$B6,$01,$FC               ;0D9DED|        |      ;
 
boss2_spriteAssemb_BA: db $02,$00,$B8,$01,$F8,$00,$B8,$41   ;0D9DF2|        |      ;
                       db $00                               ;0D9DFA|        |      ;
 
boss2_spriteAssemb_BC: db $08,$C0,$BA,$01,$F8,$C0,$EE,$41   ;0D9DFB|        |      ;
                       db $00,$E0,$BC,$01,$F8,$E0,$BC,$41   ;0D9E03|        |      ;
                       db $00,$00,$BE,$01,$F0,$01,$EC,$F8   ;0D9E0B|        |      ;
                       db $00,$EC,$41,$00,$01,$BE,$08       ;0D9E13|        |      ;
 
boss2_spriteAssemb_BE: db $06,$E0,$EE,$01,$F8,$E0,$BA,$41   ;0D9E1A|        |      ;
                       db $00,$00,$F0,$01,$F0,$01,$F2,$F8   ;0D9E22|        |      ;
                       db $00,$F2,$41,$00,$01,$F0,$08       ;0D9E2A|        |      ;
 
boss2_spriteAssemb_C0: db $04,$00,$F4,$01,$F0,$01,$F6,$F8   ;0D9E31|        |      ;
                       db $00,$F6,$41,$00,$01,$F4,$08       ;0D9E39|        |      ;
 
boss2_spriteAssemb_C2: db $04,$00,$F8,$01,$F0,$01,$F8,$F8   ;0D9E40|        |      ;
                       db $00,$F8,$41,$00,$01,$F8,$08       ;0D9E48|        |      ;
 
boss2_spriteAssemb_C4: db $0C,$C2,$80,$02,$EF,$C1,$82,$F7   ;0D9E4F|        |      ;
                       db $C1,$84,$00,$E1,$86,$F2,$E1,$88   ;0D9E57|        |      ;
                       db $FA,$E1,$8A,$02,$01,$8C,$F0,$01   ;0D9E5F|        |      ;
                       db $8E,$F8,$01,$90,$00,$21,$92,$F3   ;0D9E67|        |      ;
                       db $21,$94,$FB,$21,$96,$03           ;0D9E6F|        |      ;
 
boss2_spriteAssemb_C6: db $0A,$C0,$80,$02,$F0,$C1,$98,$F8   ;0D9E75|        |      ;
                       db $C1,$9A,$00,$E1,$9C,$F0,$E1,$9E   ;0D9E7D|        |      ;
                       db $F8,$E1,$A0,$00,$01,$A2,$F6,$01   ;0D9E85|        |      ;
                       db $A4,$FE,$21,$A6,$F8,$21,$A8,$00   ;0D9E8D|        |      ;
 
boss2_spriteAssemb_C8: db $0C,$C2,$80,$02,$F1,$C1,$AA,$F9   ;0D9E95|        |      ;
                       db $C1,$AC,$01,$E1,$AE,$F3,$E1,$B0   ;0D9E9D|        |      ;
                       db $FB,$E1,$B2,$03,$01,$B4,$F2,$01   ;0D9EA5|        |      ;
                       db $B6,$FA,$01,$B8,$02,$21,$BA,$F3   ;0D9EAD|        |      ;
                       db $21,$BC,$FB,$21,$BE,$03           ;0D9EB5|        |      ;
 
boss2_spriteAssemb_CC: db $0C,$C2,$80,$02,$F4,$C1,$82,$FC   ;0D9EBB|        |      ;
                       db $C1,$84,$04,$E1,$86,$F5,$E1,$88   ;0D9EC3|        |      ;
                       db $FD,$E1,$8A,$05,$01,$C0,$F1,$01   ;0D9ECB|        |      ;
                       db $C2,$F9,$01,$90,$01,$21,$C4,$F0   ;0D9ED3|        |      ;
                       db $21,$C6,$FB,$21,$96,$03           ;0D9EDB|        |      ;
 
boss2_spriteAssemb_CE: db $0D,$C2,$80,$02,$F6,$C1,$82,$FE   ;0D9EE1|        |      ;
                       db $C1,$84,$06,$E1,$C8,$F0,$E1,$CA   ;0D9EE9|        |      ;
                       db $F8,$E1,$CC,$00,$E1,$CE,$08,$01   ;0D9EF1|        |      ;
                       db $D0,$EB,$01,$D2,$F3,$01,$D4,$FB   ;0D9EF9|        |      ;
                       db $01,$D6,$03,$21,$D8,$FB,$21,$DA   ;0D9F01|        |      ;
                       db $03                               ;0D9F09|        |      ;
 
boss2_spriteAssemb_D0: db $0C,$C2,$80,$02,$EC,$C1,$82,$F4   ;0D9F0A|        |      ;
                       db $C1,$84,$FC,$E1,$86,$F0,$E1,$88   ;0D9F12|        |      ;
                       db $F8,$E1,$8A,$00,$01,$8C,$EF,$01   ;0D9F1A|        |      ;
                       db $8E,$F7,$01,$90,$FF,$21,$92,$F3   ;0D9F22|        |      ;
                       db $21,$94,$FB,$21,$96,$03           ;0D9F2A|        |      ;
 
boss2_spriteAssemb_D2: db $0C,$C0,$DC,$02,$F4,$C1,$DE,$FC   ;0D9F30|        |      ;
                       db $C1,$E0,$04,$E1,$E2,$F4,$E1,$9E   ;0D9F38|        |      ;
                       db $FC,$E1,$A0,$04,$01,$E4,$F1,$01   ;0D9F40|        |      ;
                       db $8E,$F7,$01,$90,$01,$21,$92,$F3   ;0D9F48|        |      ;
                       db $21,$94,$FB,$21,$96,$03           ;0D9F50|        |      ;
 
boss2_spriteAssemb_D4: db $0E,$C2,$80,$02,$EC,$C1,$82,$F4   ;0D9F56|        |      ;
                       db $C1,$84,$FC,$E1,$E6,$E0,$E1,$E8   ;0D9F5E|        |      ;
                       db $E8,$E1,$EA,$F0,$E1,$88,$F8,$E1   ;0D9F66|        |      ;
                       db $8A,$00,$01,$E4,$EF,$01,$8E,$F7   ;0D9F6E|        |      ;
                       db $01,$90,$FF,$21,$92,$F3,$21,$94   ;0D9F76|        |      ;
                       db $FB,$21,$96,$03                   ;0D9F7E|        |      ;
 
boss2_spriteAssemb_D6: db $09,$C2,$80,$02,$EC,$C1,$82,$F4   ;0D9F82|        |      ;
                       db $C1,$84,$FC,$E1,$86,$F0,$E1,$88   ;0D9F8A|        |      ;
                       db $F8,$E1,$8A,$00,$01,$EC,$F3,$01   ;0D9F92|        |      ;
                       db $EE,$FB,$01,$F0,$03               ;0D9F9A|        |      ;
 
boss2_spriteAssemb_D8: db $06,$C2,$80,$02,$EC,$C1,$82,$F4   ;0D9F9F|        |      ;
                       db $C1,$84,$FC,$E1,$86,$F0,$E1,$88   ;0D9FA7|        |      ;
                       db $F8,$E1,$8A,$00                   ;0D9FAF|        |      ;
 
boss2_spriteAssemb_DA: db $0B,$C0,$F2,$02,$F9,$C1,$F4,$01   ;0D9FB3|        |      ;
                       db $E1,$AE,$F5,$E1,$B0,$FD,$E1,$B2   ;0D9FBB|        |      ;
                       db $05,$01,$B4,$F2,$01,$B6,$FA,$01   ;0D9FC3|        |      ;
                       db $B8,$02,$21,$BA,$F3,$21,$BC,$FB   ;0D9FCB|        |      ;
                       db $21,$BE,$03                       ;0D9FD3|        |      ;
 
    miscSpriteList_08: dw miscSpriteAssemb_00               ;0D9FD6|        |0DA0D6;
                       dw miscSpriteAssemb_02               ;0D9FD8|        |0DA0DE;
                       dw boss2_spriteAssemb_D4             ;0D9FDA|        |0D9F56;
                       dw miscSpriteAssemb_00               ;0D9FDC|        |0DA0D6;
                       dw boss2_spriteAssemb_0A             ;0D9FDE|        |0D97EE;
                       dw boss2_spriteAssemb_0C             ;0D9FE0|        |0D9815;
                       dw boss2_spriteAssemb_0E             ;0D9FE2|        |0D9836;
                       dw boss2_spriteAssemb_18             ;0D9FE4|        |0D9896;
                       dw miscSpriteAssemb_10               ;0D9FE6|        |0D99D8;
                       dw miscSpriteAssemb_12               ;0D9FE8|        |0DA104;
                       dw miscSpriteAssemb_14               ;0D9FEA|        |0DA112;
                       dw miscSpriteAssemb_16               ;0D9FEC|        |0DA120;
                       dw miscSpriteAssemb_18               ;0D9FEE|        |0DA12E;
                       dw miscSpriteAssemb_1A               ;0D9FF0|        |0DA13F;
                       dw miscSpriteAssemb_1C               ;0D9FF2|        |0DA147;
                       dw miscSpriteAssemb_1E               ;0D9FF4|        |0DA9C3;
                       dw miscSpriteAssemb_20               ;0D9FF6|        |0DA9A5;
                       dw miscSpriteAssemb_22               ;0D9FF8|        |0DA9AF;
                       dw miscSpriteAssemb_24               ;0D9FFA|        |0DA14F;
                       dw miscSpriteAssemb_26               ;0D9FFC|        |0DA15D;
                       dw miscSpriteAssemb_28               ;0D9FFE|        |0DA171;
                       dw miscSpriteAssemb_2A               ;0DA000|        |0DA18B;
                       dw miscSpriteAssemb_2C               ;0DA002|        |0DA1AB;
                       dw miscSpriteAssemb_2E               ;0DA004|        |0DA1C8;
                       dw miscSpriteAssemb_30               ;0DA006|        |0DA1E5;
                       dw miscSpriteAssemb_32               ;0DA008|        |0DA202;
                       dw miscSpriteAssemb_34               ;0DA00A|        |0DA225;
                       dw miscSpriteAssemb_36               ;0DA00C|        |0DA248;
                       dw miscSpriteAssemb_38               ;0DA00E|        |0DA26B;
                       dw miscSpriteAssemb_3A               ;0DA010|        |0DA291;
                       dw miscSpriteAssemb_3C               ;0DA012|        |0DA2B7;
                       dw miscSpriteAssemb_3E               ;0DA014|        |0DA2DD;
                       dw miscSpriteAssemb_40               ;0DA016|        |0DA2FB;
                       dw miscSpriteAssemb_42               ;0DA018|        |0DA306;
                       dw miscSpriteAssemb_44               ;0DA01A|        |0DA311;
                       dw miscSpriteAssemb_46               ;0DA01C|        |0DA320;
                       dw miscSpriteAssemb_48               ;0DA01E|        |0DA335;
                       dw miscSpriteAssemb_4A               ;0DA020|        |0DA350;
                       dw miscSpriteAssemb_4C               ;0DA022|        |0DA35B;
                       dw miscSpriteAssemb_4E               ;0DA024|        |0DA363;
                       dw miscSpriteAssemb_50               ;0DA026|        |0DA368;
                       dw miscSpriteAssemb_52               ;0DA028|        |0DA36D;
                       dw miscSpriteAssemb_54               ;0DA02A|        |0DA376;
                       dw miscSpriteAssemb_56               ;0DA02C|        |0DA388;
                       dw miscSpriteAssemb_58               ;0DA02E|        |0DA3A3;
                       dw miscSpriteAssemb_5A               ;0DA030|        |0DA3BE;
                       dw miscSpriteAssemb_5C               ;0DA032|        |0DA3D5;
                       dw miscSpriteAssemb_5E               ;0DA034|        |0DA3EC;
                       dw miscSpriteAssemb_60               ;0DA036|        |0DA40D;
                       dw miscSpriteAssemb_62               ;0DA038|        |0DA431;
                       dw miscSpriteAssemb_64               ;0DA03A|        |0DA44E;
                       dw miscSpriteAssemb_66               ;0DA03C|        |0DA46B;
                       dw miscSpriteAssemb_68               ;0DA03E|        |0DA488;
                       dw miscSpriteAssemb_6A               ;0DA040|        |0DA4C9;
                       dw miscSpriteAssemb_6C               ;0DA042|        |0DA4FE;
                       dw miscSpriteAssemb_6A               ;0DA044|        |0DA4C9;
                       dw miscSpriteAssemb_70               ;0DA046|        |0DA530;
                       dw miscSpriteAssemb_72               ;0DA048|        |0DA59A;
                       dw miscSpriteAssemb_74               ;0DA04A|        |0DA5A2;
                       dw miscSpriteAssemb_76               ;0DA04C|        |0DA5AE;
                       dw miscSpriteAssemb_78               ;0DA04E|        |0DA5C6;
                       dw miscSpriteAssemb_7A               ;0DA050|        |0DA5CB;
                       dw miscSpriteAssemb_7C               ;0DA052|        |0DA5DF;
                       dw miscSpriteAssemb_7E               ;0DA054|        |0DA5F0;
                       dw miscSpriteAssemb_80               ;0DA056|        |0DA601;
                       dw miscSpriteAssemb_82               ;0DA058|        |0DA618;
                       dw miscSpriteAssemb_84               ;0DA05A|        |0DA62C;
                       dw miscSpriteAssemb_86               ;0DA05C|        |0DA63A;
                       dw miscSpriteAssemb_88               ;0DA05E|        |0DA649;
                       dw miscSpriteAssemb_8A               ;0DA060|        |0DA651;
                       dw miscSpriteAssemb_8C               ;0DA062|        |0DA65A;
                       dw miscSpriteAssemb_8E               ;0DA064|        |0DA66C;
                       dw miscSpriteAssemb_90               ;0DA066|        |0DA687;
                       dw miscSpriteAssemb_92               ;0DA068|        |0DA6A8;
                       dw miscSpriteAssemb_94               ;0DA06A|        |0DA6C9;
                       dw miscSpriteAssemb_96               ;0DA06C|        |0DA6F6;
                       dw miscSpriteAssemb_98               ;0DA06E|        |0DA6FE;
                       dw miscSpriteAssemb_9A               ;0DA070|        |0DA706;
                       dw miscSpriteAssemb_9C               ;0DA072|        |0DA712;
                       dw miscSpriteAssemb_9E               ;0DA074|        |0DA72B;
                       dw miscSpriteAssemb_A0               ;0DA076|        |0DA74F;
                       dw miscSpriteAssemb_A2               ;0DA078|        |0DA779;
                       dw miscSpriteAssemb_A4               ;0DA07A|        |0DA77E;
                       dw miscSpriteAssemb_A6               ;0DA07C|        |0DA786;
                       dw miscSpriteAssemb_A8               ;0DA07E|        |0DA791;
                       dw miscSpriteAssemb_AA               ;0DA080|        |0DA571;
                       dw miscSpriteAssemb_AC               ;0DA082|        |0DA5BA;
                       dw miscSpriteAssemb_AE               ;0DA084|        |0DA79F;
                       dw miscSpriteAssemb_B0               ;0DA086|        |0DA7D2;
                       dw miscSpriteAssemb_B2               ;0DA088|        |0DA805;
                       dw miscSpriteAssemb_B4               ;0DA08A|        |0DA83E;
                       dw miscSpriteAssemb_B6               ;0DA08C|        |0DA871;
                       dw miscSpriteAssemb_B8               ;0DA08E|        |0DA8A6;
                       dw miscSpriteAssemb_BA               ;0DA090|        |0DA8AE;
                       dw miscSpriteAssemb_BC               ;0DA092|        |0DA8B6;
                       dw miscSpriteAssemb_BE               ;0DA094|        |0DA8BE;
                       dw miscSpriteAssemb_C0               ;0DA096|        |0DA8C6;
                       dw miscSpriteAssemb_C2               ;0DA098|        |0DA8D1;
                       dw miscSpriteAssemb_C4               ;0DA09A|        |0DA8DC;
 
                       dw miscSpriteAssemb_C6               ;0DA09C|        |0DA8E7;
                       dw miscSpriteAssemb_C8               ;0DA09E|        |0DA8F2;
                       dw miscSpriteAssemb_CA               ;0DA0A0|        |0DA8FD;
                       dw miscSpriteAssemb_CC               ;0DA0A2|        |0DA908;
                       dw miscSpriteAssemb_CE               ;0DA0A4|        |0DA916;
                       dw miscSpriteAssemb_D0               ;0DA0A6|        |0DA924;
                       dw miscSpriteAssemb_D2               ;0DA0A8|        |0DA932;
                       dw miscSpriteAssemb_D4               ;0DA0AA|        |0DA941;
                       dw miscSpriteAssemb_D6               ;0DA0AC|        |0DA950;
                       dw miscSpriteAssemb_D8               ;0DA0AE|        |0DA955;
                       dw miscSpriteAssemb_DA               ;0DA0B0|        |0DA95D;
                       dw miscSpriteAssemb_DC               ;0DA0B2|        |0DA965;
                       dw miscSpriteAssemb_DE               ;0DA0B4|        |0DA970;
                       dw miscSpriteAssemb_E0               ;0DA0B6|        |0DA97C;
                       dw miscSpriteAssemb_E2               ;0DA0B8|        |0DA981;
                       dw miscSpriteAssemb_E4               ;0DA0BA|        |0DA989;
                       dw miscSpriteAssemb_E6               ;0DA0BC|        |0DA992;
                       dw miscSpriteAssemb_E8               ;0DA0BE|        |0DA9A0;
                       dw miscSpriteAssemb_EA               ;0DA0C0|        |0DA9AA;
                       dw miscSpriteAssemb_EC               ;0DA0C2|        |0DA9B4;
                       dw miscSpriteAssemb_EE               ;0DA0C4|        |0DA9BE;
                       dw miscSpriteAssemb_F0               ;0DA0C6|        |0DA9C8;
                       dw miscSpriteAssemb_F2               ;0DA0C8|        |0DA9CD;
                       dw miscSpriteAssemb_F4               ;0DA0CA|        |0DA9D2;
                       dw miscSpriteAssemb_F6               ;0DA0CC|        |0DA9D7;
                       dw miscSpriteAssemb_F8               ;0DA0CE|        |0DA9DC;
                       dw miscSpriteAssemb_FA               ;0DA0D0|        |0DA9E1;
                       dw miscSpriteAssemb_FC               ;0DA0D2|        |0DA9E6;
                       dw miscSpriteAssemb_FE               ;0DA0D4|        |0DA9EB;
 
  miscSpriteAssemb_00: db $02,$F0,$FA,$01,$F8,$F1,$FC,$00   ;0DA0D6|        |      ;
 
  miscSpriteAssemb_02: db $0C,$C2,$80,$02,$F3,$C1,$82,$FB   ;0DA0DE|        |      ;
                       db $C1,$84,$03,$E1,$F6,$F5,$E1,$F8   ;0DA0E6|        |      ;
                       db $FD,$E1,$8A,$05,$01,$E4,$F1,$01   ;0DA0EE|        |      ;
                       db $8E,$F9,$01,$90,$01,$21,$92,$F3   ;0DA0F6|        |      ;
                       db $21,$94,$FB,$21,$96,$03           ;0DA0FE|        |      ;
 
  miscSpriteAssemb_12: db $04,$C0,$80,$03,$F8,$C1,$82,$00   ;0DA104|        |      ;
                       db $E1,$84,$F8,$E1,$86,$00           ;0DA10C|        |      ;
 
  miscSpriteAssemb_14: db $04,$D8,$88,$03,$F0,$E1,$8A,$F0   ;0DA112|        |      ;
                       db $E1,$8C,$F8,$E1,$8E,$00           ;0DA11A|        |      ;
 
  miscSpriteAssemb_16: db $04,$E8,$90,$03,$E8,$E1,$92,$F0   ;0DA120|        |      ;
                       db $E1,$94,$F8,$E1,$96,$00           ;0DA128|        |      ;
 
  miscSpriteAssemb_18: db $05,$E0,$98,$03,$E8,$D1,$9A,$F0   ;0DA12E|        |      ;
                       db $F1,$9C,$F0,$E1,$9E,$F8,$E1,$A0   ;0DA136|        |      ;
                       db $00                               ;0DA13E|        |      ;
 
  miscSpriteAssemb_1A: db $02,$F0,$A2,$03,$F8,$F1,$A4,$00   ;0DA13F|        |      ;
 
  miscSpriteAssemb_1C: db $02,$F0,$A6,$03,$F8,$F1,$AE,$00   ;0DA147|        |      ;
 
  miscSpriteAssemb_24: db $04,$F0,$A2,$03,$F8,$F1,$A4,$00   ;0DA14F|        |      ;
                       db $11,$A2,$F8,$11,$A4,$00           ;0DA157|        |      ;
 
  miscSpriteAssemb_26: db $06,$F0,$A2,$03,$F8,$F1,$A4,$00   ;0DA15D|        |      ;
                       db $11,$A2,$F8,$11,$A4,$00,$31,$A2   ;0DA165|        |      ;
                       db $F8,$31,$A4,$00                   ;0DA16D|        |      ;
 
  miscSpriteAssemb_28: db $08,$F0,$A2,$03,$F8,$F1,$A4,$00   ;0DA171|        |      ;
                       db $11,$A2,$F8,$11,$A4,$00,$31,$A2   ;0DA179|        |      ;
                       db $F8,$31,$A4,$00,$51,$A2,$F8,$51   ;0DA181|        |      ;
                       db $A4,$00                           ;0DA189|        |      ;
 
  miscSpriteAssemb_2A: db $0A,$F0,$A2,$03,$F8,$F1,$A4,$00   ;0DA18B|        |      ;
                       db $11,$A2,$F8,$11,$A4,$00,$31,$A2   ;0DA193|        |      ;
                       db $F8,$31,$A4,$00,$51,$A2,$F8,$51   ;0DA19B|        |      ;
                       db $A4,$00,$71,$A2,$F8,$71,$A4,$00   ;0DA1A3|        |      ;
 
  miscSpriteAssemb_2C: db $09,$D2,$9A,$03,$F2,$D3,$9C,$FA   ;0DA1AB|        |      ;
                       db $EB,$98,$EA,$F3,$9E,$F2,$F3,$A0   ;0DA1B3|        |      ;
                       db $FA,$11,$80,$F0,$11,$82,$F8,$11   ;0DA1BB|        |      ;
                       db $84,$00,$11,$86,$08               ;0DA1C3|        |      ;
 
  miscSpriteAssemb_2E: db $09,$D0,$9A,$03,$F1,$D1,$9C,$F9   ;0DA1C8|        |      ;
                       db $E9,$98,$E9,$F1,$9E,$F1,$F1,$A0   ;0DA1D0|        |      ;
                       db $F9,$11,$80,$F0,$11,$8A,$F8,$11   ;0DA1D8|        |      ;
                       db $8C,$00,$11,$8E,$08               ;0DA1E0|        |      ;
 
  miscSpriteAssemb_30: db $09,$D0,$9A,$03,$F0,$D1,$9C,$F8   ;0DA1E5|        |      ;
                       db $E9,$98,$E8,$F1,$9E,$F0,$F1,$A0   ;0DA1ED|        |      ;
                       db $F8,$11,$90,$F0,$11,$92,$F8,$11   ;0DA1F5|        |      ;
                       db $94,$00,$11,$96,$08               ;0DA1FD|        |      ;
 
  miscSpriteAssemb_32: db $0B,$D2,$9A,$03,$F4,$D3,$9C,$FC   ;0DA202|        |      ;
                       db $D1,$A2,$E7,$F1,$A4,$E7,$F1,$A6   ;0DA20A|        |      ;
                       db $ED,$F1,$A8,$F5,$F1,$AA,$FD,$11   ;0DA212|        |      ;
                       db $80,$F0,$11,$82,$F8,$11,$84,$00   ;0DA21A|        |      ;
                       db $11,$86,$08                       ;0DA222|        |      ;
 
  miscSpriteAssemb_34: db $0B,$D0,$9A,$03,$F5,$D1,$9C,$FD   ;0DA225|        |      ;
                       db $D1,$A2,$E7,$F1,$A4,$E7,$F1,$A6   ;0DA22D|        |      ;
                       db $EF,$F1,$AC,$F7,$F1,$AE,$FF,$11   ;0DA235|        |      ;
                       db $80,$F0,$11,$82,$F8,$11,$84,$00   ;0DA23D|        |      ;
                       db $11,$86,$08                       ;0DA245|        |      ;
 
  miscSpriteAssemb_36: db $0B,$D0,$9A,$03,$F5,$D1,$B0,$FD   ;0DA248|        |      ;
                       db $D1,$A2,$E9,$F1,$B2,$E7,$F1,$B4   ;0DA250|        |      ;
                       db $EF,$F1,$B6,$F7,$F1,$B8,$FF,$11   ;0DA258|        |      ;
                       db $80,$F0,$11,$82,$F8,$11,$84,$00   ;0DA260|        |      ;
                       db $11,$86,$08                       ;0DA268|        |      ;
 
  miscSpriteAssemb_38: db $0C,$D0,$BA,$03,$E4,$D1,$BC,$EC   ;0DA26B|        |      ;
                       db $D1,$BE,$F4,$D1,$C0,$FC,$F1,$C2   ;0DA273|        |      ;
                       db $E4,$F1,$C4,$EC,$F1,$C6,$F4,$F1   ;0DA27B|        |      ;
                       db $C8,$FC,$11,$80,$F0,$11,$82,$F8   ;0DA283|        |      ;
                       db $11,$84,$00,$11,$86,$08           ;0DA28B|        |      ;
 
  miscSpriteAssemb_3A: db $0C,$D0,$BA,$03,$E4,$D1,$BC,$EC   ;0DA291|        |      ;
                       db $D1,$BE,$F4,$D1,$C0,$FC,$F1,$C2   ;0DA299|        |      ;
                       db $E4,$F1,$C4,$EC,$F1,$CA,$F4,$F1   ;0DA2A1|        |      ;
                       db $CC,$FC,$11,$80,$F0,$11,$82,$F8   ;0DA2A9|        |      ;
                       db $11,$84,$00,$11,$86,$08           ;0DA2B1|        |      ;
 
  miscSpriteAssemb_3C: db $0C,$D2,$BA,$03,$E8,$D3,$CE,$EF   ;0DA2B7|        |      ;
                       db $D3,$BE,$F7,$D3,$C0,$FF,$F3,$C2   ;0DA2BF|        |      ;
                       db $E8,$F3,$D0,$F0,$F3,$D2,$F8,$F3   ;0DA2C7|        |      ;
                       db $D4,$00,$11,$80,$F0,$11,$82,$F8   ;0DA2CF|        |      ;
                       db $11,$84,$00,$11,$86,$08           ;0DA2D7|        |      ;
 
  miscSpriteAssemb_3E: db $09,$D0,$9A,$01,$F0,$D1,$9C,$F8   ;0DA2DD|        |      ;
                       db $E8,$98,$03,$E8,$F1,$9E,$F0,$F1   ;0DA2E5|        |      ;
                       db $A0,$F8,$11,$90,$F0,$11,$92,$F8   ;0DA2ED|        |      ;
                       db $11,$94,$00,$11,$96,$08           ;0DA2F5|        |      ;
 
  miscSpriteAssemb_40: db $03,$F0,$E6,$03,$F4,$F1,$E8,$FC   ;0DA2FB|        |      ;
                       db $F1,$EA,$04                       ;0DA303|        |      ;
 
  miscSpriteAssemb_42: db $03,$F0,$EC,$03,$F4,$F1,$EE,$FC   ;0DA306|        |      ;
                       db $F1,$F0,$04                       ;0DA30E|        |      ;
 
  miscSpriteAssemb_44: db $04,$F0,$EA,$43,$F0,$F0,$F2,$03   ;0DA311|        |      ;
                       db $F8,$F1,$F4,$00,$F1,$F0,$08       ;0DA319|        |      ;
 
  miscSpriteAssemb_46: db $06,$D0,$F4,$43,$F8,$D1,$F2,$00   ;0DA320|        |      ;
                       db $F1,$F0,$F0,$F0,$F6,$03,$F8,$F1   ;0DA328|        |      ;
                       db $F8,$00,$F1,$EA,$08               ;0DA330|        |      ;
 
  miscSpriteAssemb_48: db $08,$B0,$F2,$03,$F8,$B1,$F4,$00   ;0DA335|        |      ;
                       db $F1,$F0,$08,$D0,$F8,$43,$F8,$D1   ;0DA33D|        |      ;
                       db $F6,$00,$F1,$EA,$F0,$F1,$F8,$F8   ;0DA345|        |      ;
                       db $F1,$F6,$00                       ;0DA34D|        |      ;
 
  miscSpriteAssemb_4A: db $03,$F0,$D6,$01,$F8,$F1,$D8,$00   ;0DA350|        |      ;
                       db $F1,$DA,$08                       ;0DA358|        |      ;
 
  miscSpriteAssemb_4C: db $02,$F0,$DC,$01,$F8,$F1,$DE,$00   ;0DA35B|        |      ;
 
  miscSpriteAssemb_4E: db $01,$F0,$E0,$03,$FC               ;0DA363|        |      ;
 
  miscSpriteAssemb_50: db $01,$F0,$E2,$03,$FC               ;0DA368|        |      ;
 
  miscSpriteAssemb_52: db $02,$E0,$E4,$03,$FC,$00,$E4,$83   ;0DA36D|        |      ;
                       db $FC                               ;0DA375|        |      ;
 
  miscSpriteAssemb_54: db $05,$10,$E4,$03,$0C,$11,$E6,$14   ;0DA376|        |      ;
                       db $10,$C4,$02,$F0,$11,$C6,$F8,$11   ;0DA37E|        |      ;
                       db $C8,$00                           ;0DA386|        |      ;
 
  miscSpriteAssemb_56: db $08,$10,$E8,$03,$08,$11,$EA,$10   ;0DA388|        |      ;
                       db $F0,$CC,$02,$00,$F1,$CE,$08,$11   ;0DA390|        |      ;
                       db $D0,$F0,$11,$D2,$F8,$11,$D4,$00   ;0DA398|        |      ;
                       db $11,$D6,$08                       ;0DA3A0|        |      ;
 
  miscSpriteAssemb_58: db $08,$10,$E8,$03,$00,$11,$EA,$08   ;0DA3A3|        |      ;
                       db $F0,$D8,$02,$F0,$F1,$DA,$F8,$F1   ;0DA3AB|        |      ;
                       db $DC,$00,$11,$DE,$F0,$11,$E0,$F8   ;0DA3B3|        |      ;
                       db $11,$E2,$00                       ;0DA3BB|        |      ;
 
  miscSpriteAssemb_5A: db $07,$E0,$F0,$02,$00,$DD,$80,$F1   ;0DA3BE|        |      ;
                       db $E1,$E6,$F9,$E1,$E8,$01,$01,$EA   ;0DA3C6|        |      ;
                       db $F0,$01,$EC,$F8,$01,$8A,$00       ;0DA3CE|        |      ;
 
  miscSpriteAssemb_5C: db $07,$E0,$FA,$02,$EE,$E1,$FC,$F6   ;0DA3D5|        |      ;
                       db $E1,$84,$FE,$F1,$EE,$E6,$01,$EA   ;0DA3DD|        |      ;
                       db $F0,$01,$EC,$F8,$01,$8A,$00       ;0DA3E5|        |      ;
 
  miscSpriteAssemb_5E: db $0A,$F8,$C2,$43,$E9,$F9,$C0,$F1   ;0DA3EC|        |      ;
                       db $D2,$80,$02,$F1,$D3,$82,$F9,$D3   ;0DA3F4|        |      ;
                       db $84,$01,$F1,$BC,$F9,$F1,$BE,$01   ;0DA3FC|        |      ;
                       db $11,$A4,$F8,$11,$A6,$00,$11,$A8   ;0DA404|        |      ;
                       db $08                               ;0DA40C|        |      ;
 
  miscSpriteAssemb_60: db $0B,$00,$C0,$03,$00,$01,$C2,$08   ;0DA40D|        |      ;
                       db $E2,$80,$02,$F0,$E3,$82,$F8,$E3   ;0DA415|        |      ;
                       db $84,$00,$01,$9E,$E8,$01,$A0,$F0   ;0DA41D|        |      ;
                       db $01,$A2,$F8,$21,$B6,$F3,$21,$B8   ;0DA425|        |      ;
                       db $FB,$21,$BA,$03                   ;0DA42D|        |      ;
 
  miscSpriteAssemb_62: db $09,$E0,$CA,$02,$F4,$E1,$CC,$FC   ;0DA431|        |      ;
                       db $E1,$CA,$04,$01,$CE,$F4,$01,$D4   ;0DA439|        |      ;
                       db $FC,$01,$CE,$04,$21,$D0,$F4,$21   ;0DA441|        |      ;
                       db $D2,$FC,$21,$D0,$04               ;0DA449|        |      ;
 
  miscSpriteAssemb_64: db $09,$E0,$CA,$02,$F4,$E1,$CC,$FC   ;0DA44E|        |      ;
                       db $E1,$CA,$04,$01,$CE,$F4,$01,$D6   ;0DA456|        |      ;
                       db $FC,$01,$CE,$04,$21,$D0,$F4,$21   ;0DA45E|        |      ;
                       db $D2,$FC,$21,$D0,$04               ;0DA466|        |      ;
 
  miscSpriteAssemb_66: db $09,$E0,$CA,$02,$F4,$E1,$CC,$FC   ;0DA46B|        |      ;
                       db $E1,$CA,$04,$01,$CE,$F4,$01,$D8   ;0DA473|        |      ;
                       db $FC,$01,$CE,$04,$21,$D0,$F4,$21   ;0DA47B|        |      ;
                       db $D2,$FC,$21,$D0,$04               ;0DA483|        |      ;
 
  miscSpriteAssemb_68: db $15,$C0,$80,$02,$E8,$C1,$82,$F0   ;0DA488|        |      ;
                       db $C1,$84,$F8,$C1,$86,$00,$C1,$88   ;0DA490|        |      ;
                       db $08,$C1,$8A,$10,$E1,$8C,$E8,$E1   ;0DA498|        |      ;
                       db $8E,$F0,$E1,$90,$F8,$E1,$92,$00   ;0DA4A0|        |      ;
                       db $E1,$94,$08,$E1,$96,$10,$01,$98   ;0DA4A8|        |      ;
                       db $E8,$01,$9A,$F0,$01,$9C,$F8,$01   ;0DA4B0|        |      ;
                       db $9E,$00,$01,$A0,$08,$01,$A2,$10   ;0DA4B8|        |      ;
                       db $21,$A4,$EE,$21,$A6,$F6,$21,$A8   ;0DA4C0|        |      ;
                       db $FE                               ;0DA4C8|        |      ;
 
  miscSpriteAssemb_6A: db $11,$C0,$AA,$02,$F0,$C1,$84,$F8   ;0DA4C9|        |      ;
                       db $C1,$AC,$00,$C1,$AE,$08,$E1,$8C   ;0DA4D1|        |      ;
                       db $E8,$E1,$8E,$F0,$E1,$90,$F8,$E1   ;0DA4D9|        |      ;
                       db $92,$00,$E1,$B0,$08,$01,$98,$E8   ;0DA4E1|        |      ;
                       db $01,$9A,$F0,$01,$9C,$F8,$01,$9E   ;0DA4E9|        |      ;
                       db $00,$01,$B2,$08,$21,$A4,$EE,$21   ;0DA4F1|        |      ;
                       db $A6,$F6,$21,$A8,$FE               ;0DA4F9|        |      ;
 
  miscSpriteAssemb_6C: db $10,$C0,$B4,$02,$F0,$C1,$B6,$F8   ;0DA4FE|        |      ;
                       db $C1,$B8,$00,$E1,$8C,$E8,$E1,$8E   ;0DA506|        |      ;
                       db $F0,$E1,$90,$F8,$E1,$92,$00,$E1   ;0DA50E|        |      ;
                       db $BA,$08,$01,$98,$E8,$01,$9A,$F0   ;0DA516|        |      ;
                       db $01,$9C,$F8,$01,$9E,$00,$01,$A0   ;0DA51E|        |      ;
                       db $08,$21,$A4,$EE,$21,$A6,$F6,$21   ;0DA526|        |      ;
                       db $A8,$FE                           ;0DA52E|        |      ;
 
  miscSpriteAssemb_70: db $15,$D0,$80,$02,$E8,$D1,$82,$F0   ;0DA530|        |      ;
                       db $D1,$84,$F8,$D1,$86,$00,$D1,$88   ;0DA538|        |      ;
                       db $08,$D1,$8A,$10,$F1,$8C,$E8,$F1   ;0DA540|        |      ;
                       db $8E,$F0,$F1,$90,$F8,$F1,$92,$00   ;0DA548|        |      ;
                       db $F1,$94,$08,$F1,$96,$10,$11,$BC   ;0DA550|        |      ;
                       db $E8,$11,$BE,$F0,$11,$C0,$F8,$11   ;0DA558|        |      ;
                       db $C2,$00,$11,$A0,$08,$11,$A2,$10   ;0DA560|        |      ;
                       db $31,$C4,$F0,$31,$C6,$F8,$31,$C8   ;0DA568|        |      ;
                       db $00                               ;0DA570|        |      ;
 
  miscSpriteAssemb_AA: db $0D,$C0,$B4,$02,$F0,$C1,$B6,$F8   ;0DA571|        |      ;
                       db $C1,$B8,$00,$E1,$8C,$E8,$E1,$8E   ;0DA579|        |      ;
                       db $F0,$E1,$90,$F8,$E1,$92,$00,$E1   ;0DA581|        |      ;
                       db $B4,$08,$01,$98,$E8,$01,$9A,$F0   ;0DA589|        |      ;
                       db $01,$9C,$F8,$01,$9E,$00,$01,$A0   ;0DA591|        |      ;
                       db $08                               ;0DA599|        |      ;
 
  miscSpriteAssemb_72: db $02,$D0,$F0,$01,$FC,$F1,$F2,$FC   ;0DA59A|        |      ;
 
  miscSpriteAssemb_74: db $03,$D0,$F4,$01,$FC,$F1,$F6,$F8   ;0DA5A2|        |      ;
                       db $F0,$F6,$41,$00                   ;0DA5AA|        |      ;
 
  miscSpriteAssemb_76: db $03,$D0,$F8,$01,$FC,$F1,$FA,$F8   ;0DA5AE|        |      ;
                       db $F0,$FA,$41,$00                   ;0DA5B6|        |      ;
 
  miscSpriteAssemb_AC: db $03,$F0,$F8,$81,$FC,$D1,$FA,$F8   ;0DA5BA|        |      ;
                       db $D0,$FA,$C1,$00                   ;0DA5C2|        |      ;
 
  miscSpriteAssemb_78: db $01,$F0,$FC,$01,$FC               ;0DA5C6|        |      ;
 
  miscSpriteAssemb_7A: db $06,$D0,$C0,$02,$FE,$F1,$C2,$F0   ;0DA5CB|        |      ;
                       db $F1,$C4,$F8,$F1,$C6,$00,$11,$C8   ;0DA5D3|        |      ;
                       db $FB,$11,$CA,$03                   ;0DA5DB|        |      ;
 
  miscSpriteAssemb_7C: db $05,$D0,$C0,$02,$FF,$F1,$CC,$F8   ;0DA5DF|        |      ;
                       db $F1,$CE,$00,$11,$D0,$F8,$11,$D2   ;0DA5E7|        |      ;
                       db $00                               ;0DA5EF|        |      ;
 
  miscSpriteAssemb_7E: db $05,$D2,$C0,$02,$FF,$F1,$D4,$F8   ;0DA5F0|        |      ;
                       db $F1,$D6,$00,$11,$D8,$FC,$11,$DA   ;0DA5F8|        |      ;
                       db $04                               ;0DA600|        |      ;
 
  miscSpriteAssemb_80: db $07,$D0,$DE,$02,$F8,$D1,$DC,$00   ;0DA601|        |      ;
                       db $E1,$DC,$F0,$F1,$DC,$F8,$F1,$DE   ;0DA609|        |      ;
                       db $00,$11,$C8,$FB,$11,$CA,$03       ;0DA611|        |      ;
 
  miscSpriteAssemb_82: db $06,$F0,$DC,$82,$F8,$F1,$DC,$00   ;0DA618|        |      ;
                       db $F1,$DE,$08,$01,$DE,$F0,$11,$C8   ;0DA620|        |      ;
                       db $FB,$11,$CA,$03                   ;0DA628|        |      ;
 
  miscSpriteAssemb_84: db $04,$10,$DE,$02,$F0,$11,$D4,$F8   ;0DA62C|        |      ;
                       db $11,$D6,$00,$11,$DC,$08           ;0DA634|        |      ;
 
  miscSpriteAssemb_86: db $04,$10,$E0,$02,$F0,$11,$E2,$F8   ;0DA63A|        |      ;
                       db $10,$E2,$41,$00,$11,$E0,$08       ;0DA642|        |      ;
 
  miscSpriteAssemb_88: db $02,$F0,$EA,$02,$F8,$F1,$EC,$00   ;0DA649|        |      ;
 
  miscSpriteAssemb_8A: db $02,$F0,$EE,$02,$F8,$F0,$EC,$82   ;0DA651|        |      ;
                       db $00                               ;0DA659|        |      ;
 
  miscSpriteAssemb_8C: db $05,$D0,$B6,$01,$E8,$E0,$AE,$02   ;0DA65A|        |      ;
                       db $E4,$E1,$B0,$EC,$F1,$B2,$F4,$11   ;0DA662|        |      ;
                       db $B4,$F4                           ;0DA66A|        |      ;
 
  miscSpriteAssemb_8E: db $08,$D2,$C6,$01,$FD,$E0,$B8,$02   ;0DA66C|        |      ;
                       db $F0,$E1,$BA,$F8,$E1,$BC,$00,$01   ;0DA674|        |      ;
                       db $BE,$F4,$01,$C0,$FC,$11,$C2,$F4   ;0DA67C|        |      ;
                       db $11,$C4,$FC                       ;0DA684|        |      ;
 
  miscSpriteAssemb_90: db $0A,$CE,$AC,$01,$FC,$D0,$80,$02   ;0DA687|        |      ;
                       db $F4,$D1,$82,$FC,$D1,$84,$04,$F1   ;0DA68F|        |      ;
                       db $86,$F4,$F1,$88,$FC,$F1,$8A,$04   ;0DA697|        |      ;
                       db $11,$8C,$F4,$11,$8E,$FC,$11,$90   ;0DA69F|        |      ;
                       db $04                               ;0DA6A7|        |      ;
 
  miscSpriteAssemb_92: db $0A,$CE,$AC,$01,$FC,$D0,$80,$02   ;0DA6A8|        |      ;
                       db $F4,$D1,$92,$FC,$D1,$84,$04,$F1   ;0DA6B0|        |      ;
                       db $86,$F4,$F1,$94,$FC,$F1,$8A,$04   ;0DA6B8|        |      ;
                       db $11,$8C,$F4,$11,$96,$FC,$11,$98   ;0DA6C0|        |      ;
                       db $04                               ;0DA6C8|        |      ;
 
  miscSpriteAssemb_94: db $0E,$CE,$AC,$01,$FC,$D0,$80,$02   ;0DA6C9|        |      ;
                       db $F4,$D1,$92,$FC,$D1,$9C,$04,$F1   ;0DA6D1|        |      ;
                       db $86,$F4,$F1,$A0,$FC,$F1,$A2,$04   ;0DA6D9|        |      ;
                       db $11,$8C,$F4,$11,$A6,$FC,$11,$A8   ;0DA6E1|        |      ;
                       db $04,$B1,$9A,$04,$D1,$9E,$04,$F1   ;0DA6E9|        |      ;
                       db $A4,$04,$11,$AA,$04               ;0DA6F1|        |      ;
 
  miscSpriteAssemb_96: db $02,$F0,$C8,$03,$F8,$F1,$CA,$00   ;0DA6F6|        |      ;
 
  miscSpriteAssemb_98: db $02,$F0,$E0,$03,$F8,$F1,$E2,$00   ;0DA6FE|        |      ;
 
  miscSpriteAssemb_9A: db $03,$D0,$E4,$03,$FC,$F1,$E6,$F8   ;0DA706|        |      ;
                       db $F0,$E6,$C3,$00                   ;0DA70E|        |      ;
 
  miscSpriteAssemb_9C: db $07,$90,$E4,$43,$FC,$B0,$E6,$03   ;0DA712|        |      ;
                       db $F8,$D1,$E8,$F8,$11,$EA,$F8,$B0   ;0DA71A|        |      ;
                       db $E6,$C3,$00,$D1,$E8,$00,$11,$EA   ;0DA722|        |      ;
                       db $00                               ;0DA72A|        |      ;
 
  miscSpriteAssemb_9E: db $0B,$B0,$E4,$03,$FC,$D1,$E6,$F8   ;0DA72B|        |      ;
                       db $F1,$E8,$F8,$11,$EA,$F8,$31,$EA   ;0DA733|        |      ;
                       db $F8,$51,$EA,$F8,$D0,$E6,$C3,$00   ;0DA73B|        |      ;
                       db $F1,$E8,$00,$11,$EA,$00,$31,$EA   ;0DA743|        |      ;
                       db $00,$51,$EA,$00                   ;0DA74B|        |      ;
 
  miscSpriteAssemb_A0: db $0D,$90,$E4,$03,$FC,$B1,$E6,$F8   ;0DA74F|        |      ;
                       db $D1,$E8,$F8,$F1,$E8,$F8,$11,$EA   ;0DA757|        |      ;
                       db $F8,$31,$EA,$F8,$51,$EA,$F8,$B0   ;0DA75F|        |      ;
                       db $E6,$C3,$00,$D1,$E8,$00,$F1,$E8   ;0DA767|        |      ;
                       db $00,$11,$EA,$00,$31,$EA,$00,$51   ;0DA76F|        |      ;
                       db $EA,$00                           ;0DA777|        |      ;
 
  miscSpriteAssemb_A2: db $01,$F0,$CC,$03,$FC               ;0DA779|        |      ;
 
  miscSpriteAssemb_A4: db $02,$D0,$CE,$03,$FC,$F1,$D0,$FC   ;0DA77E|        |      ;
 
  miscSpriteAssemb_A6: db $03,$B0,$CE,$03,$FC,$D1,$D0,$FC   ;0DA786|        |      ;
                       db $F1,$D2,$FC                       ;0DA78E|        |      ;
 
  miscSpriteAssemb_A8: db $04,$90,$CE,$03,$FC,$B1,$D0,$FC   ;0DA791|        |      ;
                       db $D1,$D2,$FC,$F1,$D4,$FC           ;0DA799|        |      ;
 
  miscSpriteAssemb_AE: db $10,$C0,$80,$02,$F8,$C1,$82,$00   ;0DA79F|        |      ;
                       db $C1,$84,$08,$E1,$8A,$F0,$E1,$8C   ;0DA7A7|        |      ;
                       db $F8,$E1,$8E,$00,$E1,$90,$08,$01   ;0DA7AF|        |      ;
                       db $92,$F0,$01,$94,$F8,$01,$96,$00   ;0DA7B7|        |      ;
                       db $01,$98,$08,$21,$9A,$F5,$21,$9C   ;0DA7BF|        |      ;
                       db $FD,$21,$9E,$FB,$C2,$86,$01,$10   ;0DA7C7|        |      ;
                       db $CD,$88,$18                       ;0DA7CF|        |      ;
 
  miscSpriteAssemb_B0: db $10,$C0,$80,$02,$F8,$C1,$82,$00   ;0DA7D2|        |      ;
                       db $C1,$84,$08,$E1,$A0,$F0,$E1,$A2   ;0DA7DA|        |      ;
                       db $F8,$E1,$A4,$00,$E1,$A6,$08,$01   ;0DA7E2|        |      ;
                       db $A8,$F0,$01,$AA,$F8,$01,$AC,$00   ;0DA7EA|        |      ;
                       db $01,$AE,$08,$21,$B0,$F0,$21,$B2   ;0DA7F2|        |      ;
                       db $F8,$21,$B4,$00,$C2,$86,$01,$10   ;0DA7FA|        |      ;
                       db $CD,$88,$18                       ;0DA802|        |      ;
 
  miscSpriteAssemb_B2: db $12,$C0,$80,$02,$F8,$C1,$82,$00   ;0DA805|        |      ;
                       db $C1,$84,$08,$FD,$B6,$E8,$E1,$BA   ;0DA80D|        |      ;
                       db $F0,$E1,$BC,$F8,$E1,$BE,$00,$E1   ;0DA815|        |      ;
                       db $C0,$08,$1D,$B8,$E8,$01,$C2,$F0   ;0DA81D|        |      ;
                       db $01,$C4,$F8,$01,$C6,$00,$01,$C8   ;0DA825|        |      ;
                       db $08,$21,$CA,$F0,$21,$CC,$F8,$21   ;0DA82D|        |      ;
                       db $CE,$00,$C2,$86,$01,$10,$CD,$88   ;0DA835|        |      ;
                       db $18                               ;0DA83D|        |      ;
 
  miscSpriteAssemb_B4: db $10,$C0,$80,$02,$F8,$C1,$82,$00   ;0DA83E|        |      ;
                       db $C1,$D0,$08,$E1,$D2,$F0,$E1,$D4   ;0DA846|        |      ;
                       db $F8,$E1,$D6,$00,$E1,$90,$08,$01   ;0DA84E|        |      ;
                       db $D8,$F0,$01,$DA,$F8,$01,$96,$00   ;0DA856|        |      ;
                       db $01,$98,$08,$21,$E0,$F5,$21,$9C   ;0DA85E|        |      ;
                       db $FD,$21,$9E,$05,$20,$DC,$01,$E5   ;0DA866|        |      ;
                       db $21,$DE,$ED                       ;0DA86E|        |      ;
 
  miscSpriteAssemb_B6: db $11,$C0,$80,$02,$F8,$C1,$82,$00   ;0DA871|        |      ;
                       db $C1,$D0,$08,$E1,$E2,$D8,$E1,$E4   ;0DA879|        |      ;
                       db $E0,$E9,$E6,$E8,$E1,$E8,$F0,$E1   ;0DA881|        |      ;
                       db $EA,$F8,$E1,$D6,$00,$E1,$A6,$08   ;0DA889|        |      ;
                       db $01,$EC,$F0,$01,$EE,$F8,$01,$AC   ;0DA891|        |      ;
                       db $00,$01,$AE,$08,$21,$B0,$F0,$21   ;0DA899|        |      ;
                       db $B2,$F8,$21,$B4,$00               ;0DA8A1|        |      ;
 
  miscSpriteAssemb_B8: db $02,$F0,$F6,$C3,$F8,$F1,$F4,$00   ;0DA8A6|        |      ;
 
  miscSpriteAssemb_BA: db $02,$F0,$F0,$03,$F8,$F1,$F2,$00   ;0DA8AE|        |      ;
 
  miscSpriteAssemb_BC: db $02,$F0,$F4,$03,$F8,$F1,$F6,$00   ;0DA8B6|        |      ;
 
  miscSpriteAssemb_BE: db $02,$F0,$F2,$C3,$F8,$F1,$F0,$00   ;0DA8BE|        |      ;
 
  miscSpriteAssemb_C0: db $03,$E0,$80,$02,$F8,$01,$82,$F8   ;0DA8C6|        |      ;
                       db $01,$84,$00                       ;0DA8CE|        |      ;
 
  miscSpriteAssemb_C2: db $03,$E0,$A0,$02,$F8,$01,$A2,$F8   ;0DA8D1|        |      ;
                       db $01,$A4,$00                       ;0DA8D9|        |      ;
 
  miscSpriteAssemb_C4: db $03,$E0,$C0,$01,$F8,$01,$C2,$F8   ;0DA8DC|        |      ;
                       db $01,$C4,$00                       ;0DA8E4|        |      ;
 
  miscSpriteAssemb_C6: db $03,$E0,$86,$02,$F8,$01,$88,$F8   ;0DA8E7|        |      ;
                       db $01,$8A,$00                       ;0DA8EF|        |      ;
 
  miscSpriteAssemb_C8: db $03,$E0,$A6,$02,$F8,$01,$A8,$F8   ;0DA8F2|        |      ;
                       db $01,$AA,$00                       ;0DA8FA|        |      ;
 
  miscSpriteAssemb_CA: db $03,$E0,$C6,$01,$F8,$01,$C8,$F8   ;0DA8FD|        |      ;
                       db $01,$CA,$00                       ;0DA905|        |      ;
 
  miscSpriteAssemb_CC: db $04,$E0,$8C,$02,$F8,$E1,$90,$00   ;0DA908|        |      ;
                       db $01,$8E,$F8,$01,$92,$00           ;0DA910|        |      ;
 
  miscSpriteAssemb_CE: db $04,$E0,$DE,$02,$F8,$E1,$B0,$00   ;0DA916|        |      ;
                       db $01,$AE,$F8,$01,$B2,$00           ;0DA91E|        |      ;
 
  miscSpriteAssemb_D0: db $04,$E0,$CC,$01,$F8,$E1,$CE,$00   ;0DA924|        |      ;
                       db $01,$8E,$F8,$01,$92,$00           ;0DA92C|        |      ;
 
  miscSpriteAssemb_D2: db $04,$F0,$94,$03,$F0,$F1,$96,$F8   ;0DA932|        |      ;
                       db $F0,$96,$43,$00,$F1,$94,$08       ;0DA93A|        |      ;
 
  miscSpriteAssemb_D4: db $04,$F0,$98,$03,$F0,$F1,$9A,$F8   ;0DA941|        |      ;
                       db $F0,$9A,$43,$00,$F1,$98,$08       ;0DA949|        |      ;
 
  miscSpriteAssemb_D6: db $01,$F0,$9C,$03,$FC               ;0DA950|        |      ;
 
  miscSpriteAssemb_D8: db $02,$D0,$B4,$03,$FC,$F1,$B6,$FC   ;0DA955|        |      ;
 
  miscSpriteAssemb_DA: db $02,$F0,$B8,$03,$F8,$F1,$BA,$00   ;0DA95D|        |      ;
 
  miscSpriteAssemb_DC: db $02,$F0,$BC,$03,$F4,$F1,$BE,$FC   ;0DA965|        |      ;
                       db $F1,$D0,$04                       ;0DA96D|        |      ;
 
  miscSpriteAssemb_DE: db $02,$F0,$D2,$03,$F4,$F1,$D4,$FC   ;0DA970|        |      ;
                       db $F0,$D2,$43,$04                   ;0DA978|        |      ;
 
  miscSpriteAssemb_E0: db $01,$F0,$EC,$01,$00               ;0DA97C|        |      ;
 
  miscSpriteAssemb_E2: db $02,$F0,$EE,$01,$F8,$F1,$F0,$00   ;0DA981|        |      ;
 
  miscSpriteAssemb_E4: db $02,$F0,$D6,$01,$F8,$F0,$D6,$41   ;0DA989|        |      ;
                       db $00                               ;0DA991|        |      ;
 
  miscSpriteAssemb_E6: db $02,$F0,$D8,$01,$F8,$F0,$D8,$41   ;0DA992|        |      ;
                       db $00                               ;0DA99A|        |      ;
 
boss2_spriteAssemb_DE: db $01,$F0,$F4,$81,$F8               ;0DA99B|        |      ;
 
  miscSpriteAssemb_E8: db $01,$F0,$F4,$01,$FC               ;0DA9A0|        |      ;
 
  miscSpriteAssemb_20: db $01,$F0,$F6,$81,$FC               ;0DA9A5|        |      ;
 
  miscSpriteAssemb_EA: db $01,$F0,$F6,$01,$FC               ;0DA9AA|        |      ;
 
  miscSpriteAssemb_22: db $01,$F0,$F8,$81,$F8               ;0DA9AF|        |      ;
 
  miscSpriteAssemb_EC: db $01,$F0,$F8,$01,$F8               ;0DA9B4|        |      ;
 
boss2_spriteAssemb_DC: db $01,$F0,$FA,$81,$F8               ;0DA9B9|        |      ;
 
  miscSpriteAssemb_EE: db $01,$F0,$FA,$01,$F8               ;0DA9BE|        |      ;
 
  miscSpriteAssemb_1E: db $01,$F0,$FC,$01,$F8               ;0DA9C3|        |      ;
 
  miscSpriteAssemb_F0: db $01,$F0,$AC,$01,$FC               ;0DA9C8|        |      ;
 
  miscSpriteAssemb_F2: db $01,$F0,$AC,$01,$FC               ;0DA9CD|        |      ;
 
  miscSpriteAssemb_F4: db $01,$F0,$84,$01,$FC               ;0DA9D2|        |      ;
 
  miscSpriteAssemb_F6: db $01,$F0,$8A,$01,$FC               ;0DA9D7|        |      ;
 
  miscSpriteAssemb_F8: db $01,$F0,$90,$01,$FC               ;0DA9DC|        |      ;
 
  miscSpriteAssemb_FA: db $01,$F0,$80,$01,$FC               ;0DA9E1|        |      ;
 
  miscSpriteAssemb_FC: db $01,$F0,$86,$01,$FC               ;0DA9E6|        |      ;
 
  miscSpriteAssemb_FE: db $01,$F0,$8C,$01,$FC               ;0DA9EB|        |      ;
 
         DATA8_0DA9F0: db $06,$DA,$C8,$43,$01,$F9,$D4,$F1   ;0DA9F0|        |      ;
                       db $FC,$EC,$83,$01,$E8,$D6,$03,$F9   ;0DA9F8|        |      ;
                       db $09,$C8,$F9,$13,$C8,$09           ;0DAA00|        |      ;
 
         DATA8_0DAA06: db $03,$E0,$E8,$03,$00,$01,$E4,$F8   ;0DAA06|        |      ;
                       db $01,$E6,$00                       ;0DAA0E|        |      ;
 
         DATA8_0DAA11: db $03,$F4,$D4,$03,$00,$FB,$D8,$F8   ;0DAA11|        |      ;
                       db $FA,$C2,$C3,$00                   ;0DAA19|        |      ;
 
         DATA8_0DAA1D: db $09,$D8,$C6,$C3,$F1,$DF,$C6,$F9   ;0DAA1D|        |      ;
                       db $E0,$CE,$43,$01,$DF,$C6,$09,$01   ;0DAA25|        |      ;
                       db $C2,$F9,$EE,$DA,$03,$E9,$FF,$C6   ;0DAA2D|        |      ;
                       db $F1,$FF,$C8,$01,$01,$DC,$09       ;0DAA35|        |      ;
 
         DATA8_0DAA3C: db $03,$EE,$C8,$03,$F6,$FF,$C2,$06   ;0DAA3C|        |      ;
                       db $E2,$C2,$C3,$FE                   ;0DAA44|        |      ;
 
         DATA8_0DAA48: db $0C,$D0,$84,$03,$F8,$D1,$86,$00   ;0DAA48|        |      ;
                       db $E1,$82,$F0,$F1,$8E,$F8,$F1,$90   ;0DAA50|        |      ;
                       db $00,$E1,$88,$08,$EF,$8A,$10,$FB   ;0DAA58|        |      ;
                       db $80,$E8,$01,$8C,$F0,$11,$94,$F8   ;0DAA60|        |      ;
 
                       db $11,$96,$00,$01,$92,$08           ;0DAA68|        |      ;
 
         DATA8_0DAA6E: db $0C,$D0,$A0,$03,$F8,$D1,$A2,$00   ;0DAA6E|        |      ;
                       db $E1,$9A,$F0,$F1,$BC,$F8,$F1,$BE   ;0DAA76|        |      ;
                       db $00,$E1,$A4,$08,$EF,$8A,$10,$FB   ;0DAA7E|        |      ;
                       db $98,$E8,$01,$A6,$F0,$11,$A8,$F8   ;0DAA86|        |      ;
                       db $11,$96,$00,$01,$92,$08           ;0DAA8E|        |      ;
 
         DATA8_0DAA94: db $02,$DE,$E8,$43,$FE,$FE,$EA,$03   ;0DAA94|        |      ;
                       db $FD                               ;0DAA9C|        |      ;
 
         DATA8_0DAA9D: db $04,$E8,$E2,$03,$EF,$F1,$CA,$F7   ;0DAA9D|        |      ;
                       db $F1,$E0,$FF,$09,$CA,$07           ;0DAAA5|        |      ;
 
         DATA8_0DAAAB: db $06,$CE,$C6,$C3,$F8,$E0,$C6,$43   ;0DAAAB|        |      ;
                       db $00,$E6,$DA,$03,$F0,$F7,$C8,$F8   ;0DAAB3|        |      ;
                       db $03,$C6,$00,$03,$C4,$08           ;0DAABB|        |      ;
 
         DATA8_0DAAC1: db $06,$00,$C8,$43,$E9,$01,$C2,$F1   ;0DAAC1|        |      ;
                       db $01,$EC,$F9,$F5,$C8,$01,$F3,$C2   ;0DAAC9|        |      ;
                       db $09,$EF,$EC,$11                   ;0DAAD1|        |      ;
 
         DATA8_0DAAD5: db $03,$FC,$C2,$43,$F6,$F2,$C4,$03   ;0DAAD5|        |      ;
                       db $FE,$E5,$DE,$06                   ;0DAADD|        |      ;
 
         DATA8_0DAAE1: db $09,$D4,$EC,$C3,$E4,$F6,$C4,$43   ;0DAAE1|        |      ;
                       db $FC,$F3,$C8,$04,$E7,$D2,$0C,$CB   ;0DAAE9|        |      ;
                       db $EC,$04,$F2,$C8,$03,$EC,$F7,$C4   ;0DAAF1|        |      ;
                       db $F4,$D7,$D4,$14,$C7,$CC,$0C       ;0DAAF9|        |      ;
 
         DATA8_0DAB00: db $04,$E0,$40,$00,$F8,$E1,$42,$00   ;0DAB00|        |      ;
                       db $01,$44,$F8,$01,$46,$00           ;0DAB08|        |      ;
 
         DATA8_0DAB0E: db $04,$E0,$48,$00,$F8,$E1,$4A,$00   ;0DAB0E|        |      ;
                       db $01,$4C,$F8,$01,$4E,$00           ;0DAB16|        |      ;
 
         DATA8_0DAB1C: db $04,$E0,$50,$00,$F8,$E1,$52,$00   ;0DAB1C|        |      ;
                       db $01,$54,$F8,$01,$56,$00           ;0DAB24|        |      ;
 
         DATA8_0DAB2A: db $04,$E0,$40,$00,$F4,$E1,$42,$FC   ;0DAB2A|        |      ;
                       db $01,$44,$F8,$01,$46,$00           ;0DAB32|        |      ;
 
         DATA8_0DAB38: db $04,$E0,$48,$00,$F5,$E1,$4A,$FD   ;0DAB38|        |      ;
                       db $01,$4C,$F8,$01,$4E,$00           ;0DAB40|        |      ;
 
         DATA8_0DAB46: db $04,$E0,$50,$00,$F4,$E1,$52,$FC   ;0DAB46|        |      ;
                       db $01,$54,$F8,$01,$56,$00           ;0DAB4E|        |      ;
 
         DATA8_0DAB54: db $05,$C0,$40,$00,$FC,$E1,$42,$F8   ;0DAB54|        |      ;
                       db $E1,$44,$00,$01,$46,$F9,$01,$48   ;0DAB5C|        |      ;
                       db $01                               ;0DAB64|        |      ;
 
         DATA8_0DAB65: db $05,$C0,$4A,$00,$FC,$E1,$4C,$F8   ;0DAB65|        |      ;
                       db $E1,$4E,$00,$01,$50,$F8,$01,$52   ;0DAB6D|        |      ;
                       db $00                               ;0DAB75|        |      ;
 
         DATA8_0DAB76: db $05,$C0,$40,$00,$FC,$E1,$54,$F8   ;0DAB76|        |      ;
                       db $E1,$56,$00,$01,$58,$F9,$01,$5A   ;0DAB7E|        |      ;
                       db $01                               ;0DAB86|        |      ;
 
         DATA8_0DAB87: db $02,$00,$9C,$02,$00,$01,$9E,$08   ;0DAB87|        |      ;
 
         DATA8_0DAB8F: db $02,$00,$B8,$02,$00,$01,$BA,$08   ;0DAB8F|        |      ;
 
         DATA8_0DAB97: db $01,$00,$C0,$02,$00               ;0DAB97|        |      ;
 
         DATA8_0DAB9C: db $02,$00,$B0,$03,$F8,$00,$B0,$43   ;0DAB9C|        |      ;
                       db $00                               ;0DABA4|        |      ;
 
         DATA8_0DABA5: db $02,$00,$B2,$03,$F8,$00,$B2,$43   ;0DABA5|        |      ;
                       db $00                               ;0DABAD|        |      ;
 
         DATA8_0DABAE: db $02,$00,$B4,$03,$F8,$00,$B4,$43   ;0DABAE|        |      ;
                       db $00                               ;0DABB6|        |      ;
 
         DATA8_0DABB7: db $02,$02,$B6,$03,$F8,$02,$B6,$43   ;0DABB7|        |      ;
                       db $00                               ;0DABBF|        |      ;
 
         DATA8_0DABC0: db $02,$F0,$6A,$03,$F8,$F1,$6C,$00   ;0DABC0|        |      ;
 
         DATA8_0DABC8: db $01,$F0,$6E,$00,$F8               ;0DABC8|        |      ;
 
         DATA8_0DABCD: db $02,$F0,$15,$23,$F8,$F0,$15,$63   ;0DABCD|        |      ;
                       db $00                               ;0DABD5|        |      ;
 
         DATA8_0DABD6: db $02,$F0,$17,$23,$F8,$F0,$17,$63   ;0DABD6|        |      ;
                       db $00                               ;0DABDE|        |      ;
 
         DATA8_0DABDF: db $02,$F0,$DA,$41,$F8,$F1,$D8,$00   ;0DABDF|        |      ;
 
  bossAssembPointer06: dw DATA8_0DAE99                      ;0DABE7|        |0DAE99;
                       dw DATA8_0DAEA7                      ;0DABE9|        |0DAEA7;
                       dw DATA8_0DAEBB                      ;0DABEB|        |0DAEBB;
                       dw DATA8_0DAEA7                      ;0DABED|        |0DAEA7;
                       dw DATA8_0DB075                      ;0DABEF|        |0DB075;
                       dw DATA8_0DB07D                      ;0DABF1|        |0DB07D;
                       dw DATA8_0DB085                      ;0DABF3|        |0DB085;
                       dw DATA8_0DB08D                      ;0DABF5|        |0DB08D;
                       dw DATA8_0DB095                      ;0DABF7|        |0DB095;
                       dw DATA8_0DB09D                      ;0DABF9|        |0DB09D;
                       dw DATA8_0DB0A5                      ;0DABFB|        |0DB0A5;
                       dw DATA8_0DB0AD                      ;0DABFD|        |0DB0AD;
                       dw DATA8_0DB0B5                      ;0DABFF|        |0DB0B5;
                       dw DATA8_0DB0BD                      ;0DAC01|        |0DB0BD;
                       dw DATA8_0DB0CB                      ;0DAC03|        |0DB0CB;
                       dw DATA8_0DB0DC                      ;0DAC05|        |0DB0DC;
                       dw DATA8_0DB0E4                      ;0DAC07|        |0DB0E4;
                       dw DATA8_0DB0BD                      ;0DAC09|        |0DB0BD;
                       dw DATA8_0DB0F5                      ;0DAC0B|        |0DB0F5;
                       dw DATA8_0DB103                      ;0DAC0D|        |0DB103;
                       dw DATA8_0DB117                      ;0DAC0F|        |0DB117;
                       dw DATA8_0DB125                      ;0DAC11|        |0DB125;
                       dw DATA8_0DB139                      ;0DAC13|        |0DB139;
                       dw DATA8_0DB125                      ;0DAC15|        |0DB125;
                       dw DATA8_0DB117                      ;0DAC17|        |0DB117;
                       dw DATA8_0DB103                      ;0DAC19|        |0DB103;
                       dw DATA8_0DB0F5                      ;0DAC1B|        |0DB0F5;
                       dw DATA8_0DB147                      ;0DAC1D|        |0DB147;
                       dw DATA8_0DB14C                      ;0DAC1F|        |0DB14C;
                       dw DATA8_0DB151                      ;0DAC21|        |0DB151;
                       dw DATA8_0DB156                      ;0DAC23|        |0DB156;
                       dw DATA8_0DB15B                      ;0DAC25|        |0DB15B;
                       dw DATA8_0DB160                      ;0DAC27|        |0DB160;
                       dw DATA8_0DB165                      ;0DAC29|        |0DB165;
                       dw DATA8_0DB16A                      ;0DAC2B|        |0DB16A;
                       dw DATA8_0DB16F                      ;0DAC2D|        |0DB16F;
                       dw DATA8_0DB174                      ;0DAC2F|        |0DB174;
                       dw DATA8_0DB179                      ;0DAC31|        |0DB179;
                       dw DATA8_0DB17E                      ;0DAC33|        |0DB17E;
                       dw DATA8_0DB186                      ;0DAC35|        |0DB186;
                       dw DATA8_0DB18E                      ;0DAC37|        |0DB18E;
                       dw DATA8_0DB196                      ;0DAC39|        |0DB196;
                       dw DATA8_0DB1B2                      ;0DAC3B|        |0DB1B2;
                       dw DATA8_0DB1E6                      ;0DAC3D|        |0DB1E6;
                       dw DATA8_0DB1EF                      ;0DAC3F|        |0DB1EF;
                       dw DATA8_0DB1F7                      ;0DAC41|        |0DB1F7;
                       dw DATA8_0DB1FF                      ;0DAC43|        |0DB1FF;
                       dw DATA8_0DB204                      ;0DAC45|        |0DB204;
                       dw DATA8_0DB209                      ;0DAC47|        |0DB209;
                       dw DATA8_0DB211                      ;0DAC49|        |0DB211;
                       dw DATA8_0DB21A                      ;0DAC4B|        |0DB21A;
                       dw DATA8_0DB222                      ;0DAC4D|        |0DB222;
                       dw DATA8_0DB22A                      ;0DAC4F|        |0DB22A;
                       dw DATA8_0DB233                      ;0DAC51|        |0DB233;
                       dw DATA8_0DB23C                      ;0DAC53|        |0DB23C;
                       dw DATA8_0DB245                      ;0DAC55|        |0DB245;
                       dw DATA8_0DB24D                      ;0DAC57|        |0DB24D;
                       dw DATA8_0DB25B                      ;0DAC59|        |0DB25B;
                       dw DATA8_0DB266                      ;0DAC5B|        |0DB266;
                       dw DATA8_0DB274                      ;0DAC5D|        |0DB274;
                       dw DATA8_0DB282                      ;0DAC5F|        |0DB282;
                       dw DATA8_0DB290                      ;0DAC61|        |0DB290;
                       dw DATA8_0DB29E                      ;0DAC63|        |0DB29E;
                       dw DATA8_0DB2AC                      ;0DAC65|        |0DB2AC;
                       dw DATA8_0DB2BA                      ;0DAC67|        |0DB2BA;
                       dw DATA8_0DB2C8                      ;0DAC69|        |0DB2C8;
                       dw DATA8_0DB2E9                      ;0DAC6B|        |0DB2E9;
                       dw DATA8_0DB30A                      ;0DAC6D|        |0DB30A;
                       dw DATA8_0DB318                      ;0DAC6F|        |0DB318;
                       dw DATA8_0DB329                      ;0DAC71|        |0DB329;
                       dw DATA8_0DB33A                      ;0DAC73|        |0DB33A;
                       dw DATA8_0DB34B                      ;0DAC75|        |0DB34B;
                       dw DATA8_0DB36F                      ;0DAC77|        |0DB36F;
                       dw DATA8_0DB393                      ;0DAC79|        |0DB393;
                       dw DATA8_0DB3A4                      ;0DAC7B|        |0DB3A4;
                       dw DATA8_0DB3B2                      ;0DAC7D|        |0DB3B2;
                       dw DATA8_0DB3C0                      ;0DAC7F|        |0DB3C0;
                       dw DATA8_0DB3CE                      ;0DAC81|        |0DB3CE;
                       dw DATA8_0DB3EF                      ;0DAC83|        |0DB3EF;
                       dw DATA8_0DB410                      ;0DAC85|        |0DB410;
                       dw DATA8_0DA9F0                      ;0DAC87|        |0DA9F0;
                       dw DATA8_0DAA06                      ;0DAC89|        |0DAA06;
                       dw DATA8_0DAA11                      ;0DAC8B|        |0DAA11;
                       dw DATA8_0DAA1D                      ;0DAC8D|        |0DAA1D;
                       dw DATA8_0DAA3C                      ;0DAC8F|        |0DAA3C;
                       dw DATA8_0DAA48                      ;0DAC91|        |0DAA48;
                       dw DATA8_0DAA6E                      ;0DAC93|        |0DAA6E;
                       dw DATA8_0DAA94                      ;0DAC95|        |0DAA94;
                       dw DATA8_0DAA9D                      ;0DAC97|        |0DAA9D;
                       dw DATA8_0DAAAB                      ;0DAC99|        |0DAAAB;
                       dw DATA8_0DAAC1                      ;0DAC9B|        |0DAAC1;
                       dw DATA8_0DAAD5                      ;0DAC9D|        |0DAAD5;
                       dw DATA8_0DAAE1                      ;0DAC9F|        |0DAAE1;
                       dw DATA8_0DAB00                      ;0DACA1|        |0DAB00;
                       dw DATA8_0DAB0E                      ;0DACA3|        |0DAB0E;
                       dw DATA8_0DAB1C                      ;0DACA5|        |0DAB1C;
                       dw DATA8_0DAB0E                      ;0DACA7|        |0DAB0E;
                       dw DATA8_0DAB2A                      ;0DACA9|        |0DAB2A;
                       dw DATA8_0DAB38                      ;0DACAB|        |0DAB38;
                       dw DATA8_0DAB46                      ;0DACAD|        |0DAB46;
                       dw DATA8_0DAB38                      ;0DACAF|        |0DAB38;
                       dw DATA8_0DAB54                      ;0DACB1|        |0DAB54;
                       dw DATA8_0DAB65                      ;0DACB3|        |0DAB65;
                       dw DATA8_0DAB76                      ;0DACB5|        |0DAB76;
                       dw DATA8_0DAB65                      ;0DACB7|        |0DAB65;
                       dw DATA8_0DAB87                      ;0DACB9|        |0DAB87;
                       dw DATA8_0DAB87                      ;0DACBB|        |0DAB87;
                       dw DATA8_0DAB87                      ;0DACBD|        |0DAB87;
                       dw DATA8_0DAB8F                      ;0DACBF|        |0DAB8F;
                       dw DATA8_0DB41E                      ;0DACC1|        |0DB41E;
                       dw DATA8_0DB444                      ;0DACC3|        |0DB444;
                       dw DATA8_0DB452                      ;0DACC5|        |0DB452;
                       dw DATA8_0DB460                      ;0DACC7|        |0DB460;
                       dw DATA8_0DB46E                      ;0DACC9|        |0DB46E;
                       dw DATA8_0DB488                      ;0DACCB|        |0DB488;
                       dw DATA8_0DB49F                      ;0DACCD|        |0DB49F;
                       dw DATA8_0DB4AD                      ;0DACCF|        |0DB4AD;
                       dw DATA8_0DAB97                      ;0DACD1|        |0DAB97;
                       dw DATA8_0DAB9C                      ;0DACD3|        |0DAB9C;
                       dw DATA8_0DABA5                      ;0DACD5|        |0DABA5;
                       dw DATA8_0DABAE                      ;0DACD7|        |0DABAE;
                       dw DATA8_0DABB7                      ;0DACD9|        |0DABB7;
                       dw DATA8_0DABC0                      ;0DACDB|        |0DABC0;
                       dw DATA8_0DABC8                      ;0DACDD|        |0DABC8;
                       dw DATA8_0DABCD                      ;0DACDF|        |0DABCD;
                       dw DATA8_0DABD6                      ;0DACE1|        |0DABD6;
                       dw DATA8_0DABDF                      ;0DACE3|        |0DABDF;
                       dw DATA8_0DB1CC                      ;0DACE5|        |0DB1CC;
 
  enemyAssemPointer0a: dw DATA8_0DB4B5                      ;0DACE7|        |0DB4B5;
                       dw DATA8_0DB4B5                      ;0DACE9|        |0DB4B5;
                       dw DATA8_0DB4C4                      ;0DACEB|        |0DB4C4;
                       dw DATA8_0DB4D3                      ;0DACED|        |0DB4D3;
                       dw DATA8_0DB4E1                      ;0DACEF|        |0DB4E1;
                       dw DATA8_0DB4FE                      ;0DACF1|        |0DB4FE;
                       dw DATA8_0DB50C                      ;0DACF3|        |0DB50C;
                       dw DATA8_0DB51D                      ;0DACF5|        |0DB51D;
                       dw DATA8_0DB52B                      ;0DACF7|        |0DB52B;
                       dw DATA8_0DB534                      ;0DACF9|        |0DB534;
                       dw DATA8_0DB54F                      ;0DACFB|        |0DB54F;
                       dw DATA8_0DB581                      ;0DACFD|        |0DB581;
                       dw DATA8_0DB5C2                      ;0DACFF|        |0DB5C2;
                       dw DATA8_0DB5F4                      ;0DAD01|        |0DB5F4;
                       dw DATA8_0DB605                      ;0DAD03|        |0DB605;
                       dw DATA8_0DB616                      ;0DAD05|        |0DB616;
                       dw DATA8_0DB62A                      ;0DAD07|        |0DB62A;
                       dw DATA8_0DB63E                      ;0DAD09|        |0DB63E;
                       dw DATA8_0DB64C                      ;0DAD0B|        |0DB64C;
                       dw DATA8_0DB65D                      ;0DAD0D|        |0DB65D;
                       dw DATA8_0DB66E                      ;0DAD0F|        |0DB66E;
                       dw DATA8_0DB682                      ;0DAD11|        |0DB682;
                       dw DATA8_0DB699                      ;0DAD13|        |0DB699;
                       dw DATA8_0DB6B0                      ;0DAD15|        |0DB6B0;
                       dw DATA8_0DB6C1                      ;0DAD17|        |0DB6C1;
                       dw DATA8_0DB6D3                      ;0DAD19|        |0DB6D3;
                       dw DATA8_0DB6EB                      ;0DAD1B|        |0DB6EB;
                       dw DATA8_0DB700                      ;0DAD1D|        |0DB700;
                       dw DATA8_0DB6EB                      ;0DAD1F|        |0DB6EB;
                       dw DATA8_0DB6D3                      ;0DAD21|        |0DB6D3;
                       dw DATA8_0DB6EB                      ;0DAD23|        |0DB6EB;
                       dw DATA8_0DB715                      ;0DAD25|        |0DB715;
                       dw DATA8_0DB736                      ;0DAD27|        |0DB736;
                       dw DATA8_0DB75D                      ;0DAD29|        |0DB75D;
                       dw DATA8_0DADC5                      ;0DAD2B|        |0DADC5;
                       dw DATA8_0DADCA                      ;0DAD2D|        |0DADCA;
                       dw DATA8_0DADD2                      ;0DAD2F|        |0DADD2;
                       dw DATA8_0DADDD                      ;0DAD31|        |0DADDD;
                       dw DATA8_0DADEB                      ;0DAD33|        |0DADEB;
                       dw DATA8_0DADFC                      ;0DAD35|        |0DADFC;
                       dw DATA8_0DAE0D                      ;0DAD37|        |0DAE0D;
                       dw DATA8_0DAE15                      ;0DAD39|        |0DAE15;
                       dw DATA8_0DAE1D                      ;0DAD3B|        |0DAE1D;
                       dw DATA8_0DAE25                      ;0DAD3D|        |0DAE25;
                       dw DATA8_0DAE1D                      ;0DAD3F|        |0DAE1D;
                       dw DATA8_0DAE3A                      ;0DAD41|        |0DAE3A;
                       dw DATA8_0DAE42                      ;0DAD43|        |0DAE42;
                       dw DATA8_0DAE4A                      ;0DAD45|        |0DAE4A;
                       dw DATA8_0DAE58                      ;0DAD47|        |0DAE58;
                       dw DATA8_0DAE66                      ;0DAD49|        |0DAE66;
                       dw DATA8_0DAE77                      ;0DAD4B|        |0DAE77;
                       dw DATA8_0DAE88                      ;0DAD4D|        |0DAE88;
                       dw DATA8_0DAE2D                      ;0DAD4F|        |0DAE2D;
                       dw DATA8_0DAE32                      ;0DAD51|        |0DAE32;
 
doorETCAssembPointer07: dw DATA8_0DAE99                      ;0DAD53|        |0DAE99;
                       dw DATA8_0DAEF8                      ;0DAD55|        |0DAEF8;
                       dw DATA8_0DAEFD                      ;0DAD57|        |0DAEFD;
                       dw DATA8_0DAE99                      ;0DAD59|        |0DAE99;
                       dw DATA8_0DAE99                      ;0DAD5B|        |0DAE99;
                       dw DATA8_0DAF1D                      ;0DAD5D|        |0DAF1D;
                       dw DATA8_0DAF2E                      ;0DAD5F|        |0DAF2E;
                       dw DATA8_0DAF51                      ;0DAD61|        |0DAF51;
                       dw DATA8_0DAF56                      ;0DAD63|        |0DAF56;
                       dw DATA8_0DAF5F                      ;0DAD65|        |0DAF5F;
                       dw DATA8_0DAF64                      ;0DAD67|        |0DAF64;
                       dw DATA8_0DAF69                      ;0DAD69|        |0DAF69;
                       dw DATA8_0DAF7F                      ;0DAD6B|        |0DAF7F;
                       dw DATA8_0DAFA0                      ;0DAD6D|        |0DAFA0;
                       dw DATA8_0DAFA5                      ;0DAD6F|        |0DAFA5;
                       dw DATA8_0DAFAD                      ;0DAD71|        |0DAFAD;
                       dw DATA8_0DAFB5                      ;0DAD73|        |0DAFB5;
                       dw DATA8_0DAFBD                      ;0DAD75|        |0DAFBD;
                       dw DATA8_0DAFC5                      ;0DAD77|        |0DAFC5;
                       dw DATA8_0DAFCD                      ;0DAD79|        |0DAFCD;
                       dw DATA8_0DAFD5                      ;0DAD7B|        |0DAFD5;
                       dw DATA8_0DAFDD                      ;0DAD7D|        |0DAFDD;
                       dw DATA8_0DAFE5                      ;0DAD7F|        |0DAFE5;
                       dw DATA8_0DAFED                      ;0DAD81|        |0DAFED;
                       dw DATA8_0DAFF5                      ;0DAD83|        |0DAFF5;
                       dw DATA8_0DAFFD                      ;0DAD85|        |0DAFFD;
                       dw DATA8_0DB005                      ;0DAD87|        |0DB005;
                       dw DATA8_0DAED8                      ;0DAD89|        |0DAED8;
                       dw DATA8_0DAEE0                      ;0DAD8B|        |0DAEE0;
                       dw DATA8_0DAEE8                      ;0DAD8D|        |0DAEE8;
                       dw DATA8_0DAEF0                      ;0DAD8F|        |0DAEF0;
                       dw trevorSpriteAssemb_56             ;0DAD91|        |0D93CB;
                       dw trevorSpriteAssemb_58             ;0DAD93|        |0D93D0;
                       dw trevorSpriteAssemb_5A             ;0DAD95|        |0D93D5;
                       dw trevorSpriteAssemb_58             ;0DAD97|        |0D93D0;
                       dw DATA8_0DB058                      ;0DAD99|        |0DB058;
                       dw DATA8_0DAF84                      ;0DAD9B|        |0DAF84;
                       dw DATA8_0DAF95                      ;0DAD9D|        |0DAF95;
                       dw DATA8_0DAF3F                      ;0DAD9F|        |0DAF3F;
                       dw DATA8_0DAF48                      ;0DADA1|        |0DAF48;
                       dw DATA8_0DAF77                      ;0DADA3|        |0DAF77;
                       dw DATA8_0DB05D                      ;0DADA5|        |0DB05D;
                       dw DATA8_0DB065                      ;0DADA7|        |0DB065;
                       dw DATA8_0DB06D                      ;0DADA9|        |0DB06D;
                       dw DATA8_0DB018                      ;0DADAB|        |0DB018;
                       dw DATA8_0DB020                      ;0DADAD|        |0DB020;
                       dw DATA8_0DB038                      ;0DADAF|        |0DB038;
                       dw DATA8_0DB041                      ;0DADB1|        |0DB041;
                       dw DATA8_0DAF02                      ;0DADB3|        |0DAF02;
                       dw DATA8_0DAF0B                      ;0DADB5|        |0DAF0B;
                       dw DATA8_0DAF14                      ;0DADB7|        |0DAF14;
                       dw DATA8_0DAF0B                      ;0DADB9|        |0DAF0B;
                       dw DATA8_0DB028                      ;0DADBB|        |0DB028;
                       dw DATA8_0DB030                      ;0DADBD|        |0DB030;
                       dw DATA8_0DAE99                      ;0DADBF|        |0DAE99;
                       dw DATA8_0DB04A                      ;0DADC1|        |0DB04A;
                       dw DATA8_0DB00D                      ;0DADC3|        |0DB00D;
 
         DATA8_0DADC5: db $01,$F0,$B0,$02,$F0               ;0DADC5|        |      ;
 
         DATA8_0DADCA: db $02,$F0,$B0,$82,$E8,$F1,$FC,$F0   ;0DADCA|        |      ;
 
         DATA8_0DADD2: db $03,$F0,$B0,$02,$E0,$F1,$FA,$E8   ;0DADD2|        |      ;
                       db $F1,$FC,$F0                       ;0DADDA|        |      ;
 
         DATA8_0DADDD: db $04,$F0,$B0,$82,$D8,$F1,$B4,$E0   ;0DADDD|        |      ;
                       db $F1,$FA,$E8,$F1,$FC,$F0           ;0DADE5|        |      ;
 
         DATA8_0DADEB: db $05,$F0,$B0,$02,$D0,$F1,$B2,$D8   ;0DADEB|        |      ;
                       db $F1,$B4,$E0,$F1,$FA,$E8,$F1,$FC   ;0DADF3|        |      ;
                       db $F0                               ;0DADFB|        |      ;
 
         DATA8_0DADFC: db $05,$F0,$B0,$82,$D0,$F1,$B2,$D8   ;0DADFC|        |      ;
                       db $F1,$B4,$E0,$F1,$FA,$E8,$F1,$FC   ;0DAE04|        |      ;
                       db $F0                               ;0DAE0C|        |      ;
 
         DATA8_0DAE0D: db $02,$F0,$B0,$02,$F0,$F1,$FC,$F8   ;0DAE0D|        |      ;
 
         DATA8_0DAE15: db $02,$E8,$41,$03,$F8,$E9,$43,$00   ;0DAE15|        |      ;
 
         DATA8_0DAE1D: db $02,$F0,$45,$03,$F8,$F1,$47,$00   ;0DAE1D|        |      ;
 
         DATA8_0DAE25: db $02,$F8,$49,$03,$F8,$F9,$4B,$00   ;0DAE25|        |      ;
 
         DATA8_0DAE2D: db $01,$F0,$DA,$03,$FC               ;0DAE2D|        |      ;
 
         DATA8_0DAE32: db $02,$F0,$DC,$03,$F8,$F1,$DE,$00   ;0DAE32|        |      ;
 
         DATA8_0DAE3A: db $02,$F0,$77,$01,$F8,$F1,$79,$00   ;0DAE3A|        |      ;
 
         DATA8_0DAE42: db $02,$F0,$7B,$01,$F8,$F1,$7D,$00   ;0DAE42|        |      ;
 
         DATA8_0DAE4A: db $04,$E0,$41,$02,$F4,$E1,$43,$FC   ;0DAE4A|        |      ;
                       db $01,$45,$F8,$01,$47,$00           ;0DAE52|        |      ;
 
         DATA8_0DAE58: db $04,$E2,$55,$02,$F5,$E3,$57,$FD   ;0DAE58|        |      ;
                       db $01,$49,$F8,$01,$4B,$00           ;0DAE60|        |      ;
 
         DATA8_0DAE66: db $05,$EE,$71,$01,$F4,$E3,$61,$FC   ;0DAE66|        |      ;
                       db $E3,$63,$04,$01,$65,$FC,$01,$67   ;0DAE6E|        |      ;
                       db $04                               ;0DAE76|        |      ;
 
         DATA8_0DAE77: db $05,$F0,$71,$01,$F4,$E3,$61,$FC   ;0DAE77|        |      ;
                       db $E3,$63,$04,$01,$69,$FC,$01,$6B   ;0DAE7F|        |      ;
                       db $04                               ;0DAE87|        |      ;
 
         DATA8_0DAE88: db $05,$EC,$71,$01,$F4,$E1,$61,$FC   ;0DAE88|        |      ;
                       db $E1,$63,$04,$01,$6D,$FC,$01,$6F   ;0DAE90|        |      ;
                       db $04                               ;0DAE98|        |      ;
 
         DATA8_0DAE99: db $04,$F0,$4D,$00,$F0,$F1,$5D,$F8   ;0DAE99|        |      ;
                       db $F1,$6D,$00,$F1,$7D,$08           ;0DAEA1|        |      ;
 
         DATA8_0DAEA7: db $06,$C0,$05,$03,$F0,$C1,$0F,$F8   ;0DAEA7|        |      ;
                       db $E1,$07,$F0,$E1,$09,$F8,$01,$07   ;0DAEAF|        |      ;
                       db $F0,$01,$09,$F8                   ;0DAEB7|        |      ;
 
         DATA8_0DAEBB: db $09,$C0,$0B,$03,$E8,$C1,$0D,$F0   ;0DAEBB|        |      ;
                       db $C1,$0D,$F8,$E1,$09,$E8,$E1,$09   ;0DAEC3|        |      ;
                       db $F0,$E1,$09,$F8,$01,$09,$E8,$01   ;0DAECB|        |      ;
                       db $09,$F0,$01,$09,$F8               ;0DAED3|        |      ;
 
         DATA8_0DAED8: db $02,$F0,$EA,$01,$F8,$F1,$EC,$00   ;0DAED8|        |      ;
 
         DATA8_0DAEE0: db $02,$F0,$EC,$41,$F8,$F1,$EA,$00   ;0DAEE0|        |      ;
 
         DATA8_0DAEE8: db $02,$F0,$EC,$C1,$F8,$F1,$EA,$00   ;0DAEE8|        |      ;
 
         DATA8_0DAEF0: db $02,$F0,$EA,$81,$F8,$F1,$EC,$00   ;0DAEF0|        |      ;
 
         DATA8_0DAEF8: db $01,$F0,$F1,$03,$FC               ;0DAEF8|        |      ;
 
         DATA8_0DAEFD: db $01,$F0,$F3,$03,$FC               ;0DAEFD|        |      ;
 
         DATA8_0DAF02: db $02,$F0,$2B,$01,$F8,$F0,$2B,$41   ;0DAF02|        |      ;
                       db $00                               ;0DAF0A|        |      ;
 
         DATA8_0DAF0B: db $02,$F0,$1D,$01,$F8,$F0,$1D,$41   ;0DAF0B|        |      ;
                       db $00                               ;0DAF13|        |      ;
 
         DATA8_0DAF14: db $02,$F0,$1F,$01,$F8,$F0,$1F,$41   ;0DAF14|        |      ;
                       db $00                               ;0DAF1C|        |      ;
 
         DATA8_0DAF1D: db $04,$E0,$15,$03,$F8,$E0,$15,$43   ;0DAF1D|        |      ;
                       db $00,$00,$19,$01,$F8,$00,$19,$41   ;0DAF25|        |      ;
                       db $00                               ;0DAF2D|        |      ;
 
         DATA8_0DAF2E: db $04,$E0,$17,$03,$F8,$E0,$17,$43   ;0DAF2E|        |      ;
                       db $00,$00,$19,$01,$F8,$00,$19,$41   ;0DAF36|        |      ;
                       db $00                               ;0DAF3E|        |      ;
 
         DATA8_0DAF3F: db $02,$00,$15,$03,$F8,$00,$15,$43   ;0DAF3F|        |      ;
                       db $00                               ;0DAF47|        |      ;
 
         DATA8_0DAF48: db $02,$00,$17,$03,$F8,$00,$17,$43   ;0DAF48|        |      ;
                       db $00                               ;0DAF50|        |      ;
 
         DATA8_0DAF51: db $01,$F0,$25,$03,$FC               ;0DAF51|        |      ;
 
         DATA8_0DAF56: db $02,$F0,$03,$03,$F8,$F0,$03,$43   ;0DAF56|        |      ;
                       db $00                               ;0DAF5E|        |      ;
 
         DATA8_0DAF5F: db $01,$F0,$E1,$03,$FC               ;0DAF5F|        |      ;
 
         DATA8_0DAF64: db $01,$F8,$E3,$03,$FC               ;0DAF64|        |      ;
 
         DATA8_0DAF69: db $04,$F0,$E5,$00,$F0,$F1,$E5,$F8   ;0DAF69|        |      ;
                       db $F1,$E5,$00,$F1,$E5,$08           ;0DAF71|        |      ;
 
         DATA8_0DAF77: db $02,$F2,$BF,$40,$F8,$F3,$BD,$00   ;0DAF77|        |      ;
 
         DATA8_0DAF7F: db $01,$F0,$E7,$01,$FC               ;0DAF7F|        |      ;
 
         DATA8_0DAF84: db $05,$E4,$E7,$01,$F8,$E5,$E7,$00   ;0DAF84|        |      ;
                       db $F5,$E7,$F8,$F5,$E7,$FD,$F5,$E7   ;0DAF8C|        |      ;
                       db $00                               ;0DAF94|        |      ;
 
         DATA8_0DAF95: db $03,$F8,$E7,$01,$F8,$F9,$E7,$FD   ;0DAF95|        |      ;
                       db $F9,$E7,$00                       ;0DAF9D|        |      ;
 
         DATA8_0DAFA0: db $01,$F0,$E9,$01,$FC               ;0DAFA0|        |      ;
 
         DATA8_0DAFA5: db $02,$F0,$D1,$03,$F8,$F1,$D3,$00   ;0DAFA5|        |      ;
 
         DATA8_0DAFAD: db $02,$F0,$D5,$00,$F8,$F1,$D7,$00   ;0DAFAD|        |      ;
 
         DATA8_0DAFB5: db $02,$F0,$D9,$01,$F8,$F1,$DB,$00   ;0DAFB5|        |      ;
 
         DATA8_0DAFBD: db $02,$F0,$F9,$03,$F8,$F1,$FB,$00   ;0DAFBD|        |      ;
 
         DATA8_0DAFC5: db $02,$F0,$CD,$01,$F8,$F1,$CF,$00   ;0DAFC5|        |      ;
 
         DATA8_0DAFCD: db $02,$F0,$C1,$01,$F8,$F1,$C9,$00   ;0DAFCD|        |      ;
 
         DATA8_0DAFD5: db $02,$F0,$C3,$01,$F8,$F1,$C9,$00   ;0DAFD5|        |      ;
 
         DATA8_0DAFDD: db $02,$F0,$C5,$01,$F8,$F1,$C9,$00   ;0DAFDD|        |      ;
 
         DATA8_0DAFE5: db $02,$F0,$C7,$01,$F8,$F1,$C9,$00   ;0DAFE5|        |      ;
 
         DATA8_0DAFED: db $02,$F0,$C1,$01,$F8,$F1,$CB,$00   ;0DAFED|        |      ;
 
         DATA8_0DAFF5: db $02,$F0,$C3,$01,$F8,$F1,$CB,$00   ;0DAFF5|        |      ;
 
         DATA8_0DAFFD: db $02,$F0,$C5,$01,$F8,$F1,$CB,$00   ;0DAFFD|        |      ;
 
         DATA8_0DB005: db $02,$F0,$C7,$01,$F8,$F1,$CB,$00   ;0DB005|        |      ;
 
         DATA8_0DB00D: db $03,$F0,$C1,$01,$F4,$F1,$CB,$FC   ;0DB00D|        |      ;
                       db $F1,$C9,$04                       ;0DB015|        |      ;
 
         DATA8_0DB018: db $02,$F0,$70,$03,$F8,$F1,$72,$00   ;0DB018|        |      ;
 
         DATA8_0DB020: db $02,$F0,$74,$01,$F8,$F1,$76,$00   ;0DB020|        |      ;
 
         DATA8_0DB028: db $02,$F0,$11,$01,$F8,$F1,$13,$00   ;0DB028|        |      ;
 
         DATA8_0DB030: db $02,$F0,$21,$01,$F8,$F1,$23,$00   ;0DB030|        |      ;
 
         DATA8_0DB038: db $02,$F0,$F5,$03,$F8,$F0,$F5,$43   ;0DB038|        |      ;
                       db $00                               ;0DB040|        |      ;
 
         DATA8_0DB041: db $02,$F0,$F7,$03,$F8,$F0,$F7,$43   ;0DB041|        |      ;
                       db $00                               ;0DB049|        |      ;
 
         DATA8_0DB04A: db $04,$F0,$BD,$00,$F0,$F1,$BF,$F8   ;0DB04A|        |      ;
                       db $F1,$BD,$00,$F1,$BF,$08           ;0DB052|        |      ;
 
         DATA8_0DB058: db $01,$00,$E7,$00,$FC               ;0DB058|        |      ;
 
         DATA8_0DB05D: db $02,$F0,$7C,$01,$F8,$F1,$7E,$00   ;0DB05D|        |      ;
 
         DATA8_0DB065: db $02,$F0,$7C,$03,$F8,$F1,$7E,$00   ;0DB065|        |      ;
 
         DATA8_0DB06D: db $02,$F0,$7C,$00,$F8,$F1,$7E,$00   ;0DB06D|        |      ;
 
         DATA8_0DB075: db $02,$F0,$98,$01,$F8,$F1,$9A,$00   ;0DB075|        |      ;
 
         DATA8_0DB07D: db $02,$F0,$98,$01,$F8,$F3,$9A,$00   ;0DB07D|        |      ;
 
         DATA8_0DB085: db $02,$F0,$9C,$01,$F8,$F1,$9E,$00   ;0DB085|        |      ;
 
         DATA8_0DB08D: db $02,$F0,$A0,$01,$F8,$F1,$A2,$00   ;0DB08D|        |      ;
 
         DATA8_0DB095: db $02,$F0,$A4,$01,$F8,$F1,$A6,$00   ;0DB095|        |      ;
 
         DATA8_0DB09D: db $02,$F2,$9A,$41,$F8,$F1,$98,$00   ;0DB09D|        |      ;
 
         DATA8_0DB0A5: db $02,$F0,$9E,$41,$F8,$F1,$9C,$00   ;0DB0A5|        |      ;
 
         DATA8_0DB0AD: db $02,$F0,$A2,$41,$F8,$F1,$A0,$00   ;0DB0AD|        |      ;
 
         DATA8_0DB0B5: db $02,$F0,$A6,$41,$F8,$F1,$A4,$00   ;0DB0B5|        |      ;
 
         DATA8_0DB0BD: db $04,$F8,$E5,$02,$F0,$F9,$E5,$F8   ;0DB0BD|        |      ;
                       db $F9,$E5,$00,$F9,$E5,$08           ;0DB0C5|        |      ;
 
         DATA8_0DB0CB: db $05,$E6,$80,$02,$EE,$E7,$82,$F6   ;0DB0CB|        |      ;
                       db $E7,$84,$FE,$07,$86,$FE,$01,$88   ;0DB0D3|        |      ;
                       db $06                               ;0DB0DB|        |      ;
 
         DATA8_0DB0DC: db $02,$E0,$8A,$02,$F8,$01,$8A,$F8   ;0DB0DC|        |      ;
 
         DATA8_0DB0E4: db $05,$FA,$80,$82,$EE,$FB,$82,$F6   ;0DB0E4|        |      ;
                       db $FB,$84,$FE,$DB,$86,$FE,$E1,$88   ;0DB0EC|        |      ;
                       db $06                               ;0DB0F4|        |      ;
 
         DATA8_0DB0F5: db $04,$F0,$8C,$01,$F0,$F1,$8C,$F8   ;0DB0F5|        |      ;
                       db $F1,$8C,$00,$F1,$8C,$08           ;0DB0FD|        |      ;
 
         DATA8_0DB103: db $06,$E4,$8E,$01,$F0,$E1,$90,$F8   ;0DB103|        |      ;
                       db $E1,$84,$00,$01,$92,$F8,$01,$94   ;0DB10B|        |      ;
                       db $00,$FB,$88,$08                   ;0DB113|        |      ;
 
         DATA8_0DB117: db $04,$E0,$96,$01,$F8,$E1,$8A,$00   ;0DB117|        |      ;
                       db $01,$96,$F8,$01,$8A,$00           ;0DB11F|        |      ;
 
         DATA8_0DB125: db $06,$FC,$8E,$81,$F0,$E1,$92,$F8   ;0DB125|        |      ;
                       db $E1,$94,$00,$01,$90,$F8,$01,$84   ;0DB12D|        |      ;
                       db $00,$E7,$88,$08                   ;0DB135|        |      ;
 
         DATA8_0DB139: db $04,$F0,$8C,$81,$F0,$F1,$8C,$F8   ;0DB139|        |      ;
                       db $F1,$8C,$00,$F1,$8C,$08           ;0DB141|        |      ;
 
         DATA8_0DB147: db $01,$F2,$80,$02,$FC               ;0DB147|        |      ;
 
         DATA8_0DB14C: db $01,$F2,$82,$02,$FD               ;0DB14C|        |      ;
 
         DATA8_0DB151: db $01,$F2,$84,$02,$FE               ;0DB151|        |      ;
 
         DATA8_0DB156: db $01,$F4,$86,$02,$FE               ;0DB156|        |      ;
 
         DATA8_0DB15B: db $01,$F6,$88,$02,$FE               ;0DB15B|        |      ;
 
         DATA8_0DB160: db $01,$EC,$86,$82,$FE               ;0DB160|        |      ;
 
         DATA8_0DB165: db $01,$F0,$84,$82,$FE               ;0DB165|        |      ;
 
         DATA8_0DB16A: db $01,$F0,$82,$82,$FD               ;0DB16A|        |      ;
 
         DATA8_0DB16F: db $01,$F0,$80,$82,$FC               ;0DB16F|        |      ;
 
         DATA8_0DB174: db $01,$F0,$A8,$02,$FC               ;0DB174|        |      ;
 
         DATA8_0DB179: db $01,$F0,$AA,$02,$FC               ;0DB179|        |      ;
 
         DATA8_0DB17E: db $02,$F0,$AC,$02,$F8,$F1,$AE,$00   ;0DB17E|        |      ;
 
         DATA8_0DB186: db $02,$F0,$B0,$02,$F8,$F1,$B2,$00   ;0DB186|        |      ;
 
         DATA8_0DB18E: db $02,$F0,$B4,$02,$F8,$F1,$B6,$00   ;0DB18E|        |      ;
 
         DATA8_0DB196: db $08,$E0,$BC,$02,$F0,$E1,$BE,$F8   ;0DB196|        |      ;
                       db $E1,$B8,$00,$E1,$BA,$08,$00,$BA   ;0DB19E|        |      ;
                       db $C2,$F0,$01,$B8,$F8,$00,$B8,$82   ;0DB1A6|        |      ;
                       db $00,$01,$BA,$08                   ;0DB1AE|        |      ;
 
         DATA8_0DB1B2: db $08,$E0,$DF,$01,$F0,$E1,$DF,$F8   ;0DB1B2|        |      ;
                       db $E1,$DF,$00,$E1,$DF,$08,$01,$27   ;0DB1BA|        |      ;
                       db $F0,$01,$27,$F8,$01,$27,$00,$01   ;0DB1C2|        |      ;
                       db $27,$08                           ;0DB1CA|        |      ;
 
         DATA8_0DB1CC: db $08,$E0,$DF,$01,$F0,$E1,$DF,$F8   ;0DB1CC|        |      ;
                       db $E1,$DF,$00,$E1,$DF,$08,$01,$27   ;0DB1D4|        |      ;
                       db $F0,$01,$27,$F8,$01,$27,$00,$01   ;0DB1DC|        |      ;
                       db $27,$08                           ;0DB1E4|        |      ;
 
         DATA8_0DB1E6: db $02,$F0,$CA,$01,$F8,$F0,$CA,$41   ;0DB1E6|        |      ;
                       db $00                               ;0DB1EE|        |      ;
 
         DATA8_0DB1EF: db $02,$F0,$CC,$01,$F8,$F1,$CE,$00   ;0DB1EF|        |      ;
 
         DATA8_0DB1F7: db $02,$F0,$CE,$41,$F8,$F1,$CC,$00   ;0DB1F7|        |      ;
 
         DATA8_0DB1FF: db $01,$00,$D0,$01,$FC               ;0DB1FF|        |      ;
 
         DATA8_0DB204: db $01,$F0,$D2,$01,$FC               ;0DB204|        |      ;
 
         DATA8_0DB209: db $02,$FC,$D4,$01,$F8,$FD,$D6,$00   ;0DB209|        |      ;
 
         DATA8_0DB211: db $02,$FC,$CA,$81,$F8,$FC,$CA,$C1   ;0DB211|        |      ;
                       db $00                               ;0DB219|        |      ;
 
         DATA8_0DB21A: db $02,$F0,$A3,$02,$F8,$F1,$A5,$00   ;0DB21A|        |      ;
 
         DATA8_0DB222: db $02,$F0,$A7,$02,$F8,$F1,$A9,$00   ;0DB222|        |      ;
 
         DATA8_0DB22A: db $02,$F0,$AB,$02,$F8,$F0,$AB,$42   ;0DB22A|        |      ;
                       db $00                               ;0DB232|        |      ;
 
         DATA8_0DB233: db $02,$F0,$AD,$02,$F8,$F0,$AD,$42   ;0DB233|        |      ;
                       db $00                               ;0DB23B|        |      ;
 
         DATA8_0DB23C: db $02,$F0,$AF,$02,$F8,$F0,$AF,$42   ;0DB23C|        |      ;
                       db $00                               ;0DB244|        |      ;
 
         DATA8_0DB245: db $02,$F0,$BD,$00,$F9,$F1,$BF,$01   ;0DB245|        |      ;
 
         DATA8_0DB24D: db $04,$E0,$40,$00,$F8,$E1,$42,$00   ;0DB24D|        |      ;
                       db $01,$44,$F8,$01,$46,$00           ;0DB255|        |      ;
 
         DATA8_0DB25B: db $03,$E0,$48,$00,$F8,$E1,$4A,$00   ;0DB25B|        |      ;
                       db $01,$4C,$FC                       ;0DB263|        |      ;
 
         DATA8_0DB266: db $04,$E0,$4E,$00,$F8,$E1,$50,$00   ;0DB266|        |      ;
                       db $01,$52,$F8,$01,$54,$00           ;0DB26E|        |      ;
 
         DATA8_0DB274: db $04,$E0,$78,$00,$F9,$E1,$50,$01   ;0DB274|        |      ;
                       db $01,$52,$F8,$01,$54,$00           ;0DB27C|        |      ;
 
         DATA8_0DB282: db $04,$E0,$7A,$00,$F9,$E1,$50,$01   ;0DB282|        |      ;
                       db $01,$52,$F8,$01,$54,$00           ;0DB28A|        |      ;
 
         DATA8_0DB290: db $04,$E0,$7C,$00,$F9,$E1,$50,$01   ;0DB290|        |      ;
                       db $01,$52,$F8,$01,$54,$00           ;0DB298|        |      ;
 
         DATA8_0DB29E: db $04,$EA,$56,$00,$F4,$EB,$58,$FC   ;0DB29E|        |      ;
                       db $0B,$5A,$F8,$0B,$5C,$00           ;0DB2A6|        |      ;
 
         DATA8_0DB2AC: db $04,$EA,$5E,$00,$F5,$EB,$60,$FD   ;0DB2AC|        |      ;
                       db $0B,$62,$F8,$0B,$64,$00           ;0DB2B4|        |      ;
 
         DATA8_0DB2BA: db $04,$EA,$66,$00,$F4,$EB,$68,$FC   ;0DB2BA|        |      ;
                       db $0B,$6A,$F8,$0B,$6C,$00           ;0DB2C2|        |      ;
 
         DATA8_0DB2C8: db $0A,$E8,$58,$41,$EE,$E9,$74,$F6   ;0DB2C8|        |      ;
                       db $09,$5C,$EA,$09,$5A,$F2,$E9,$72   ;0DB2D0|        |      ;
                       db $FE,$E0,$E2,$00,$00,$E1,$E4,$08   ;0DB2D8|        |      ;
                       db $E1,$E6,$10,$01,$44,$08,$01,$46   ;0DB2E0|        |      ;
                       db $10                               ;0DB2E8|        |      ;
 
         DATA8_0DB2E9: db $0A,$E8,$58,$41,$EE,$E9,$74,$F6   ;0DB2E9|        |      ;
                       db $09,$5C,$EA,$09,$5A,$F2,$EB,$9E   ;0DB2F1|        |      ;
                       db $FE,$E0,$E8,$00,$00,$E1,$EA,$08   ;0DB2F9|        |      ;
                       db $E1,$E6,$10,$01,$44,$08,$01,$46   ;0DB301|        |      ;
                       db $10                               ;0DB309|        |      ;
 
         DATA8_0DB30A: db $04,$EA,$76,$00,$F5,$EB,$58,$FD   ;0DB30A|        |      ;
                       db $0B,$5A,$F8,$0B,$5C,$00           ;0DB312|        |      ;
 
         DATA8_0DB318: db $05,$D2,$7E,$00,$FB,$F1,$80,$F7   ;0DB318|        |      ;
                       db $F1,$82,$FF,$11,$84,$F8,$11,$86   ;0DB320|        |      ;
                       db $00                               ;0DB328|        |      ;
 
         DATA8_0DB329: db $05,$D0,$7E,$00,$FC,$F1,$88,$F8   ;0DB329|        |      ;
                       db $F1,$8A,$00,$11,$8C,$F8,$11,$8E   ;0DB331|        |      ;
                       db $00                               ;0DB339|        |      ;
 
         DATA8_0DB33A: db $05,$D2,$7E,$00,$FC,$F1,$90,$F7   ;0DB33A|        |      ;
                       db $F1,$92,$FF,$11,$94,$F8,$11,$96   ;0DB342|        |      ;
                       db $00                               ;0DB34A|        |      ;
 
         DATA8_0DB34B: db $0B,$D2,$7E,$43,$F5,$F1,$82,$EF   ;0DB34B|        |      ;
                       db $F1,$F6,$F7,$11,$86,$ED,$11,$84   ;0DB353|        |      ;
                       db $F5,$F1,$F4,$FF,$F0,$E2,$00,$00   ;0DB35B|        |      ;
                       db $F1,$E4,$08,$F1,$E6,$10,$11,$44   ;0DB363|        |      ;
                       db $08,$11,$46,$10                   ;0DB36B|        |      ;
 
         DATA8_0DB36F: db $0B,$D2,$7E,$43,$F5,$F1,$82,$EF   ;0DB36F|        |      ;
                       db $F1,$F8,$FF,$11,$86,$ED,$11,$84   ;0DB377|        |      ;
                       db $F5,$F1,$FA,$F7,$F0,$E8,$00,$00   ;0DB37F|        |      ;
                       db $F1,$EA,$08,$F1,$E6,$10,$11,$44   ;0DB387|        |      ;
                       db $08,$11,$46,$10                   ;0DB38F|        |      ;
 
         DATA8_0DB393: db $05,$D2,$7E,$00,$FD,$F1,$98,$F8   ;0DB393|        |      ;
                       db $F1,$92,$00,$11,$94,$F9,$11,$96   ;0DB39B|        |      ;
                       db $01                               ;0DB3A3|        |      ;
 
         DATA8_0DB3A4: db $04,$E0,$A0,$00,$F8,$E1,$A2,$00   ;0DB3A4|        |      ;
                       db $01,$A4,$F8,$01,$A6,$00           ;0DB3AC|        |      ;
 
         DATA8_0DB3B2: db $04,$E0,$A8,$00,$F8,$E1,$AA,$00   ;0DB3B2|        |      ;
                       db $01,$AC,$F8,$01,$AE,$00           ;0DB3BA|        |      ;
 
         DATA8_0DB3C0: db $04,$E0,$B0,$00,$F8,$E1,$B2,$00   ;0DB3C0|        |      ;
                       db $01,$B4,$F8,$01,$B6,$00           ;0DB3C8|        |      ;
 
         DATA8_0DB3CE: db $0A,$E0,$B2,$42,$EE,$E1,$EE,$F6   ;0DB3CE|        |      ;
                       db $01,$B6,$EE,$01,$B4,$F6,$E1,$EC   ;0DB3D6|        |      ;
                       db $FE,$E0,$E2,$00,$00,$E1,$E4,$08   ;0DB3DE|        |      ;
                       db $E1,$E6,$10,$01,$44,$08,$01,$46   ;0DB3E6|        |      ;
                       db $10                               ;0DB3EE|        |      ;
 
         DATA8_0DB3EF: db $0A,$E0,$B2,$42,$EE,$E1,$F2,$F6   ;0DB3EF|        |      ;
                       db $01,$B6,$EE,$01,$B4,$F6,$F1,$F0   ;0DB3F7|        |      ;
                       db $FE,$E0,$E8,$00,$00,$E1,$EA,$08   ;0DB3FF|        |      ;
                       db $E1,$E6,$10,$01,$44,$08,$01,$46   ;0DB407|        |      ;
                       db $10                               ;0DB40F|        |      ;
 
         DATA8_0DB410: db $04,$E0,$B8,$00,$F8,$E3,$B2,$00   ;0DB410|        |      ;
                       db $01,$B4,$F8,$01,$B6,$00           ;0DB418|        |      ;
 
         DATA8_0DB41E: db $0C,$A0,$F2,$01,$F8,$A1,$CA,$00   ;0DB41E|        |      ;
                       db $C1,$E0,$F0,$C1,$F0,$F8,$E1,$F2   ;0DB426|        |      ;
                       db $F8,$E1,$F0,$00,$01,$F2,$F0,$01   ;0DB42E|        |      ;
                       db $F2,$00,$21,$D6,$E8,$21,$CA,$00   ;0DB436|        |      ;
                       db $21,$DC,$08,$41,$D6,$E0           ;0DB43E|        |      ;
 
         DATA8_0DB444: db $04,$E0,$80,$00,$F8,$E1,$82,$00   ;0DB444|        |      ;
                       db $01,$84,$F8,$01,$86,$00           ;0DB44C|        |      ;
 
         DATA8_0DB452: db $04,$E0,$88,$00,$F8,$E1,$8A,$00   ;0DB452|        |      ;
                       db $01,$8C,$F8,$01,$8E,$00           ;0DB45A|        |      ;
 
         DATA8_0DB460: db $04,$E0,$90,$00,$F8,$E1,$92,$00   ;0DB460|        |      ;
                       db $01,$94,$FC,$01,$96,$04           ;0DB468|        |      ;
 
         DATA8_0DB46E: db $08,$E0,$98,$00,$00,$E1,$9A,$08   ;0DB46E|        |      ;
                       db $E1,$9C,$10,$E1,$9E,$18,$01,$A0   ;0DB476|        |      ;
                       db $00,$01,$A2,$08,$01,$A4,$10,$01   ;0DB47E|        |      ;
                       db $A6,$18                           ;0DB486|        |      ;
 
         DATA8_0DB488: db $07,$E0,$98,$00,$00,$E1,$A8,$08   ;0DB488|        |      ;
                       db $E1,$AA,$10,$01,$A0,$00,$01,$A2   ;0DB490|        |      ;
                       db $08,$01,$AC,$10,$01,$AE,$18       ;0DB498|        |      ;
 
         DATA8_0DB49F: db $04,$E0,$B0,$00,$00,$E1,$B2,$08   ;0DB49F|        |      ;
                       db $01,$B4,$00,$01,$B6,$08           ;0DB4A7|        |      ;
 
         DATA8_0DB4AD: db $02,$E0,$2D,$03,$00,$E1,$2F,$08   ;0DB4AD|        |      ;
 
         DATA8_0DB4B5: db $04,$E0,$8E,$01,$F7,$01,$90,$F1   ;0DB4B5|        |      ;
                       db $E0,$8E,$41,$01,$01,$90,$07       ;0DB4BD|        |      ;
 
         DATA8_0DB4C4: db $04,$E0,$90,$41,$F7,$01,$8E,$F1   ;0DB4C4|        |      ;
                       db $E0,$90,$01,$01,$01,$8E,$07       ;0DB4CC|        |      ;
 
         DATA8_0DB4D3: db $04,$E0,$80,$01,$F8,$E1,$82,$00   ;0DB4D3|        |      ;
                       db $01,$84,$F8,$01,$86,$00           ;0DB4DB|        |      ;
 
         DATA8_0DB4E1: db $08,$DE,$8E,$C3,$F1,$DE,$8E,$83   ;0DB4E1|        |      ;
                       db $07,$E0,$82,$03,$F8,$E1,$82,$00   ;0DB4E9|        |      ;
                       db $FF,$90,$F1,$01,$84,$F8,$01,$86   ;0DB4F1|        |      ;
                       db $00,$FE,$90,$43,$07               ;0DB4F9|        |      ;
 
         DATA8_0DB4FE: db $04,$E0,$80,$02,$F8,$E1,$82,$00   ;0DB4FE|        |      ;
                       db $01,$84,$F8,$01,$86,$00           ;0DB506|        |      ;
 
         DATA8_0DB50C: db $05,$E0,$80,$02,$F8,$E1,$82,$00   ;0DB50C|        |      ;
                       db $01,$88,$F4,$01,$8A,$FC,$01,$8C   ;0DB514|        |      ;
                       db $04                               ;0DB51C|        |      ;
 
         DATA8_0DB51D: db $04,$E0,$F8,$02,$F8,$E1,$FA,$00   ;0DB51D|        |      ;
                       db $01,$FC,$F8,$01,$EE,$00           ;0DB525|        |      ;
 
         DATA8_0DB52B: db $02,$F0,$5C,$00,$F8,$F0,$5C,$40   ;0DB52B|        |      ;
                       db $00                               ;0DB533|        |      ;
 
         DATA8_0DB534: db $08,$D0,$5E,$00,$F0,$D1,$5E,$F8   ;0DB534|        |      ;
                       db $D1,$5E,$00,$D1,$5E,$08,$F1,$5E   ;0DB53C|        |      ;
                       db $F0,$F1,$5C,$F8,$F1,$5E,$08,$F0   ;0DB544|        |      ;
                       db $5C,$40,$00                       ;0DB54C|        |      ;
 
         DATA8_0DB54F: db $10,$A0,$BA,$41,$F8,$C1,$BC,$F8   ;0DB54F|        |      ;
                       db $C1,$9E,$00,$E1,$A0,$00,$E1,$A2   ;0DB557|        |      ;
                       db $08,$E1,$A4,$10,$E1,$A6,$18,$01   ;0DB55F|        |      ;
                       db $A8,$00,$01,$AA,$18,$21,$B6,$F8   ;0DB567|        |      ;
                       db $21,$AC,$00,$21,$AE,$10,$21,$B0   ;0DB56F|        |      ;
                       db $18,$41,$B8,$F8,$41,$B2,$10,$41   ;0DB577|        |      ;
                       db $B4,$18                           ;0DB57F|        |      ;
 
         DATA8_0DB581: db $15,$A0,$80,$21,$F8,$A1,$82,$00   ;0DB581|        |      ;
                       db $C1,$84,$F0,$C1,$86,$F8,$C1,$88   ;0DB589|        |      ;
                       db $00,$C1,$8A,$08,$C1,$8C,$10,$E1   ;0DB591|        |      ;
                       db $8E,$E8,$E1,$90,$F0,$E1,$94,$F8   ;0DB599|        |      ;
                       db $E1,$9E,$00,$E1,$9E,$08,$E1,$9E   ;0DB5A1|        |      ;
                       db $10,$E1,$96,$18,$01,$98,$E8,$01   ;0DB5A9|        |      ;
                       db $9A,$F0,$01,$9E,$F8,$01,$9E,$00   ;0DB5B1|        |      ;
                       db $01,$9E,$08,$01,$9E,$10,$01,$9C   ;0DB5B9|        |      ;
                       db $18                               ;0DB5C1|        |      ;
 
         DATA8_0DB5C2: db $10,$E0,$D4,$03,$E0,$E1,$D0,$F0   ;0DB5C2|        |      ;
                       db $E1,$D2,$F8,$E1,$D4,$00,$E1,$D6   ;0DB5CA|        |      ;
                       db $08,$E1,$D6,$10,$E1,$D8,$18,$01   ;0DB5D2|        |      ;
                       db $D0,$E8,$01,$DA,$00,$01,$DC,$08   ;0DB5DA|        |      ;
                       db $01,$DC,$10,$01,$DE,$18,$21,$DA   ;0DB5E2|        |      ;
                       db $F8,$21,$DC,$00,$21,$DC,$08,$21   ;0DB5EA|        |      ;
                       db $DE,$10                           ;0DB5F2|        |      ;
 
         DATA8_0DB5F4: db $05,$C0,$00,$00,$FD,$E1,$02,$F8   ;0DB5F4|        |      ;
                       db $E1,$04,$00,$01,$06,$F8,$01,$08   ;0DB5FC|        |      ;
                       db $00                               ;0DB604|        |      ;
 
         DATA8_0DB605: db $05,$C0,$00,$00,$FD,$E1,$0A,$F8   ;0DB605|        |      ;
                       db $E1,$0C,$00,$01,$0E,$F8,$01,$10   ;0DB60D|        |      ;
                       db $00                               ;0DB615|        |      ;
 
         DATA8_0DB616: db $06,$C0,$00,$00,$FD,$E1,$12,$F8   ;0DB616|        |      ;
                       db $E1,$14,$00,$01,$18,$F8,$01,$1A   ;0DB61E|        |      ;
                       db $00,$F9,$16,$F0                   ;0DB626|        |      ;
 
         DATA8_0DB62A: db $06,$C0,$00,$00,$FD,$E1,$1C,$F8   ;0DB62A|        |      ;
                       db $E1,$1E,$00,$01,$22,$F8,$01,$24   ;0DB632|        |      ;
                       db $00,$FF,$20,$F0                   ;0DB63A|        |      ;
 
         DATA8_0DB63E: db $04,$E0,$74,$02,$FA,$E1,$76,$02   ;0DB63E|        |      ;
                       db $01,$7A,$00,$01,$78,$F8           ;0DB646|        |      ;
 
         DATA8_0DB64C: db $05,$E0,$7C,$02,$F6,$E1,$7E,$FE   ;0DB64C|        |      ;
                       db $E1,$C0,$06,$01,$7A,$00,$01,$78   ;0DB654|        |      ;
                       db $F8                               ;0DB65C|        |      ;
 
         DATA8_0DB65D: db $05,$E0,$C2,$02,$F6,$E1,$C4,$FE   ;0DB65D|        |      ;
                       db $E1,$C6,$06,$01,$7A,$00,$01,$78   ;0DB665|        |      ;
                       db $F8                               ;0DB66D|        |      ;
 
         DATA8_0DB66E: db $06,$C0,$54,$02,$F8,$C1,$56,$00   ;0DB66E|        |      ;
                       db $E1,$58,$F8,$E1,$5A,$00,$01,$5C   ;0DB676|        |      ;
                       db $F8,$01,$5E,$00                   ;0DB67E|        |      ;
 
         DATA8_0DB682: db $07,$C0,$54,$02,$F8,$C1,$56,$00   ;0DB682|        |      ;
                       db $E1,$60,$F8,$E1,$62,$00,$01,$66   ;0DB68A|        |      ;
                       db $F8,$01,$68,$00,$F1,$64,$F0       ;0DB692|        |      ;
 
         DATA8_0DB699: db $07,$C0,$54,$02,$F8,$C1,$56,$00   ;0DB699|        |      ;
                       db $E1,$6A,$F8,$E1,$6C,$00,$01,$70   ;0DB6A1|        |      ;
                       db $F8,$01,$72,$00,$F3,$6E,$F0       ;0DB6A9|        |      ;
 
         DATA8_0DB6B0: db $05,$C0,$26,$02,$FC,$E1,$28,$F8   ;0DB6B0|        |      ;
                       db $E1,$2A,$00,$01,$2C,$F8,$01,$2E   ;0DB6B8|        |      ;
                       db $00                               ;0DB6C0|        |      ;
 
         DATA8_0DB6C1: db $05,$C0,$30,$00,$FC,$E0,$32,$02   ;0DB6C1|        |      ;
                       db $F8,$E1,$34,$00,$01,$2C,$F8,$01   ;0DB6C9|        |      ;
                       db $2E,$00                           ;0DB6D1|        |      ;
 
         DATA8_0DB6D3: db $07,$C0,$30,$00,$FC,$E1,$3E,$F3   ;0DB6D3|        |      ;
                       db $E1,$40,$FB,$E0,$36,$02,$F8,$E1   ;0DB6DB|        |      ;
                       db $38,$00,$01,$2C,$F8,$01,$2E,$00   ;0DB6E3|        |      ;
 
         DATA8_0DB6EB: db $06,$C0,$30,$00,$FC,$E1,$42,$F4   ;0DB6EB|        |      ;
                       db $E1,$44,$FC,$E0,$3A,$02,$00,$01   ;0DB6F3|        |      ;
                       db $2C,$F8,$01,$2E,$00               ;0DB6FB|        |      ;
 
         DATA8_0DB700: db $06,$C0,$30,$00,$FC,$E1,$46,$F4   ;0DB700|        |      ;
                       db $E1,$48,$FC,$E0,$3C,$02,$00,$01   ;0DB708|        |      ;
                       db $2C,$F8,$01,$2E,$00               ;0DB710|        |      ;
 
         DATA8_0DB715: db $0A,$C0,$4A,$00,$EF,$E1,$02,$E9   ;0DB715|        |      ;
                       db $E1,$4E,$F0,$E1,$50,$F8,$01,$06   ;0DB71D|        |      ;
                       db $E8,$01,$08,$F0,$C1,$4C,$F8,$E0   ;0DB725|        |      ;
                       db $52,$02,$00,$01,$2C,$F8,$01,$2E   ;0DB72D|        |      ;
                       db $00                               ;0DB735|        |      ;
 
         DATA8_0DB736: db $0C,$C0,$E0,$00,$F1,$C1,$E2,$F9   ;0DB736|        |      ;
                       db $E1,$F0,$E9,$E1,$F2,$F1,$E1,$EC   ;0DB73E|        |      ;
                       db $F9,$E1,$EE,$01,$01,$06,$EB,$01   ;0DB746|        |      ;
                       db $08,$F3,$E0,$E4,$02,$F9,$E1,$E6   ;0DB74E|        |      ;
                       db $01,$01,$E8,$F8,$01,$EA,$00       ;0DB756|        |      ;
 
         DATA8_0DB75D: db $02,$F0,$64,$41,$F8,$F1,$62,$00   ;0DB75D|        |      ;
 
          CODE_0DB765: LDA.B #$10                           ;0DB765|A910    |      ;
                       LDY.W $054E                          ;0DB767|AC4E05  |0D054E;
                       CPY.B #$02                           ;0DB76A|C002    |      ;
                       BNE CODE_0DB770                      ;0DB76C|D002    |0DB770;
                       LDA.B #$0C                           ;0DB76E|A90C    |      ;
 
          CODE_0DB770: CLC                                  ;0DB770|18      |      ;
                       ADC.W $041C                          ;0DB771|6D1C04  |0D041C;
                       BCS CODE_0DB77A                      ;0DB774|B004    |0DB77A;
                       CMP.B #$F0                           ;0DB776|C9F0    |      ;
                       BCC CODE_0DB77C                      ;0DB778|9002    |0DB77C;
 
          CODE_0DB77A: ADC.B #$0F                           ;0DB77A|690F    |      ;
 
          CODE_0DB77C: TAY                                  ;0DB77C|A8      |      ;
                       LDA.B r_tempCurrRoomIdx              ;0DB77D|A50E    |00000E;
                       JMP.W CODE_0DB788                    ;0DB77F|4C88B7  |0DB788;
 
                       LDA.W $0438,X                        ;0DB782|BD3804  |0D0438;
                       LDY.W $041C,X                        ;0DB785|BC1C04  |0D041C;
 
          CODE_0DB788: AND.B #$F0                           ;0DB788|29F0    |      ;
                       LSR A                                ;0DB78A|4A      |      ;
                       LSR A                                ;0DB78B|4A      |      ;
                       LSR A                                ;0DB78C|4A      |      ;
                       STA.B r_collisionPointXvalDiv32      ;0DB78D|8512    |000012;
                       TYA                                  ;0DB78F|98      |      ;
                       LDY.B r_sceneScrollOffsetHi          ;0DB790|A457    |000057;
                       SEC                                  ;0DB792|38      |      ;
                       SBC.B #$30                           ;0DB793|E930    |      ;
                       BCS CODE_0DB79A                      ;0DB795|B003    |0DB79A;
                       SBC.B #$0F                           ;0DB797|E90F    |      ;
                       DEY                                  ;0DB799|88      |      ;
 
          CODE_0DB79A: CLC                                  ;0DB79A|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;0DB79B|6556    |000056;
                       BCS CODE_0DB7A3                      ;0DB79D|B004    |0DB7A3;
                       CMP.B #$F0                           ;0DB79F|C9F0    |      ;
                       BCC CODE_0DB7A6                      ;0DB7A1|9003    |0DB7A6;
 
          CODE_0DB7A3: ADC.B #$0F                           ;0DB7A3|690F    |      ;
                       INY                                  ;0DB7A5|C8      |      ;
 
          CODE_0DB7A6: AND.B #$F0                           ;0DB7A6|29F0    |      ;
                       STA.B $00                            ;0DB7A8|8500    |000000;
                       STA.B $0B                            ;0DB7AA|850B    |00000B;
                       STY.B r_roomSectionChrBanksDataOffset;0DB7AC|840F    |00000F;
                       LDA.B #$0A                           ;0DB7AE|A90A    |      ;
                       ASL.B $00                            ;0DB7B0|0600    |000000;
                       ROL A                                ;0DB7B2|2A      |      ;
                       ASL.B $00                            ;0DB7B3|0600    |000000;
                       ROL A                                ;0DB7B5|2A      |      ;
                       STA.B r_collisionPointAbsoluteXInRoom;0DB7B6|8513    |000013;
                       LDA.B r_collisionPointXvalDiv32      ;0DB7B8|A512    |000012;
                       ORA.B $00                            ;0DB7BA|0500    |000000;
                       STA.B r_collisionPointXvalDiv32      ;0DB7BC|8512    |000012;
 
          CODE_0DB7BE: RTS                                  ;0DB7BE|60      |      ;
 
                       STY.B $09                            ;0DB7BF|8409    |000009;
                       LDA.B r_roomOrientation              ;0DB7C1|A568    |000068;
                       BPL UNREACH_0DB7FB                   ;0DB7C3|1036    |0DB7FB;
                       LDA.B r_index                        ;0DB7C5|A510    |000010;
                       STA.B r_tempCurrRoomIdx              ;0DB7C7|850E    |00000E;
                       JSR.W CODE_0DB765                    ;0DB7C9|2065B7  |0DB765;
                       JSR.W CODE_0DB8B8                    ;0DB7CC|20B8B8  |0DB8B8;
                       BNE CODE_0DB7BE                      ;0DB7CF|D0ED    |0DB7BE;
                       JSR.W CODE_0DBA05                    ;0DB7D1|2005BA  |0DBA05;
                       BMI UNREACH_0DB7E1                   ;0DB7D4|300B    |0DB7E1;
                       LDA.B #$10                           ;0DB7D6|A910    |      ;
                       db $20                               ;0DB7D8|        |      ;
                       dw initFreezWaterEffect_01           ;0DB7D9|        |0FE25F;
                       JSR.W CODE_0DB9A3                    ;0DB7DB|20A3B9  |0DB9A3;
                       JMP.W CODE_0DB982                    ;0DB7DE|4C82B9  |0DB982;
 
 
       UNREACH_0DB7E1: db $20,$E1,$BA,$B0,$D8,$AD,$1C,$04   ;0DB7E1|        |0DBAE1;
                       db $18,$69,$08,$85,$14,$A5,$0E,$85   ;0DB7E9|        |      ;
                       db $15,$20,$35,$E9,$20,$31,$B8,$4C   ;0DB7F1|        |000020;
                       db $3F,$B8                           ;0DB7F9|        |13A5B8;
 
       UNREACH_0DB7FB: db $A5,$13,$85,$0E,$A5,$14,$85,$0F   ;0DB7FB|        |000013;
                       db $20,$B8,$B8,$D0,$B6,$20,$05,$BA   ;0DB803|        |0DB8B8;
                       db $30,$0E,$A9,$10,$20,$5F,$E2,$20   ;0DB80B|        |0DB81B;
                       db $B2,$B9,$20,$A3,$B9,$4C,$82,$B9   ;0DB813|        |0000B9;
                       db $20,$E7,$BA,$B0,$3D,$20,$B2,$B9   ;0DB81B|        |0DBAE7;
                       db $A4,$32,$B9,$4B,$C9,$20,$B3,$E9   ;0DB823|        |000032;
                       db $20,$31,$B8,$4C,$5E,$B8,$20,$E4   ;0DB82B|        |0DB831;
                       db $B9,$20,$DE,$B8,$20,$4B,$B9,$A9   ;0DB833|        |0DDE20;
                       db $11,$4C,$5F,$E2,$20,$83,$B8,$D0   ;0DB83B|        |00004C;
                       db $3E,$20,$91,$B8,$A5,$0E,$29,$E0   ;0DB843|        |0D9120;
                       db $A4,$A5,$F0,$02,$09,$10,$9D,$38   ;0DB84B|        |0000A5;
                       db $04,$AD,$1C,$04,$18,$69,$1D,$9D   ;0DB853|        |0000AD;
                       db $1C,$04,$60,$20,$83,$B8,$D0,$1F   ;0DB85B|        |0D6004;
                       db $20,$91,$B8,$A5,$12,$0A,$0A,$0A   ;0DB863|        |0DB891;
                       db $29,$E0,$A4,$A5,$F0,$02,$09,$10   ;0DB86B|        |      ;
                       db $38,$E5,$56,$9D,$38,$04,$AD,$1C   ;0DB873|        |      ;
                       db $04,$18,$69,$1E,$9D,$1C,$04,$60   ;0DB87B|        |000018;
                       db $A2,$01,$BD,$4E,$05,$F0,$06,$E8   ;0DB883|        |      ;
                       db $E0,$12,$90,$F6,$E8,$60,$20,$D7   ;0DB88B|        |      ;
                       db $FE,$A9,$89,$9D,$4E,$05,$A9,$0C   ;0DB893|        |0D89A9;
                       db $A0,$00,$20,$5C,$EF,$A9,$E8,$9D   ;0DB89B|        |      ;
                       db $00,$04,$A9,$01,$9D,$57,$06,$9D   ;0DB8A3|        |      ;
                       db $A8,$04,$A9,$60,$9D,$70,$04,$A9   ;0DB8AB|        |      ;
                       db $03,$9D,$54,$04,$60               ;0DB8B3|        |00009D;
 
          CODE_0DB8B8: LDY.B #$01                           ;0DB8B8|A001    |      ;
                       LDA.B r_stage                        ;0DB8BA|A532    |000032;
                       CMP.B #$07                           ;0DB8BC|C907    |      ;
                       BEQ CODE_0DB8CB                      ;0DB8BE|F00B    |0DB8CB;
                       CMP.B #$0A                           ;0DB8C0|C90A    |      ;
                       BNE CODE_0DB8CA                      ;0DB8C2|D006    |0DB8CA;
                       LDA.B r_blockLevel                   ;0DB8C4|A533    |000033;
                       CMP.B #$01                           ;0DB8C6|C901    |      ;
                       BEQ CODE_0DB8CB                      ;0DB8C8|F001    |0DB8CB;
 
          CODE_0DB8CA: DEY                                  ;0DB8CA|88      |      ;
 
          CODE_0DB8CB: LDA.B r_tempCurrRoomIdx              ;0DB8CB|A50E    |00000E;
                       LSR A                                ;0DB8CD|4A      |      ;
                       LSR A                                ;0DB8CE|4A      |      ;
                       LSR A                                ;0DB8CF|4A      |      ;
                       LSR A                                ;0DB8D0|4A      |      ;
                       TAX                                  ;0DB8D1|AA      |      ;
                       INC.W $03B0,X                        ;0DB8D2|FEB003  |0D03B0;
                       LDA.W $03B0,X                        ;0DB8D5|BDB003  |0D03B0;
                       AND.W UNREACH_0DB8DC,Y               ;0DB8D8|39DCB8  |0DB8DC;
                       RTS                                  ;0DB8DB|60      |      ;
 
 
       UNREACH_0DB8DC: db $0F,$07,$A9,$00,$85,$04,$A5,$12   ;0DB8DC|        |00A907;
                       db $0A,$0A,$26,$04,$0A,$0A,$0A,$0A   ;0DB8E4|        |      ;
                       db $0A,$26,$04,$A6,$04,$A5,$11,$20   ;0DB8EC|        |      ;
                       db $32,$B9,$A6,$A5,$A5,$0D,$3D,$50   ;0DB8F4|        |0000B9;
                       db $BA,$DD,$50,$BA,$F0,$40,$E0,$00   ;0DB8FC|        |      ;
                       db $F0,$04,$4A,$4A,$4A,$4A,$85,$00   ;0DB904|        |0DB90A;
                       db $A4,$09,$B9,$E0,$06,$3D,$50,$BA   ;0DB90C|        |000009;
                       db $D0,$2C,$A5,$16,$48,$A5,$17,$48   ;0DB914|        |0DB942;
                       db $A5,$00,$20,$14,$BB,$A5,$04,$49   ;0DB91C|        |000000;
                       db $01,$AA,$A5,$0C,$20,$32,$B9,$68   ;0DB924|        |0000AA;
                       db $85,$17,$68,$85,$16,$60,$3D,$43   ;0DB92C|        |000017;
                       db $B9,$85,$01,$A0,$04,$B1,$16,$3D   ;0DB934|        |0D0185;
                       db $47,$B9,$05,$01,$85,$0C,$60,$FC   ;0DB93C|        |0000B9;
                       db $F3,$CF,$3F,$03,$0C,$30,$C0,$A0   ;0DB944|        |0000CF;
                       db $00,$20,$70,$B9,$A9,$20,$05,$12   ;0DB94C|        |      ;
                       db $85,$12,$20,$70,$B9,$A9,$01,$20   ;0DB954|        |000012;
                       db $14,$ED,$A5,$14,$20,$14,$ED,$A5   ;0DB95C|        |0000ED;
                       db $15,$20,$14,$ED,$A5,$0C,$20,$14   ;0DB964|        |000020;
                       db $ED,$4C,$12,$ED,$20,$94,$B9,$B1   ;0DB96C|        |0D124C;
                       db $16,$20,$14,$ED,$C8,$B1,$16,$20   ;0DB974|        |000020;
                       db $14,$ED,$C8,$4C,$12,$ED           ;0DB97C|        |0000ED;
 
          CODE_0DB982: JSR.W CODE_0DB994                    ;0DB982|2094B9  |0DB994;
                       LDY.B r_temp_Xpos                    ;0DB985|A40A    |00000A;
                       LDA.W DATA8_0DB990,Y                 ;0DB987|B990B9  |0DB990;
                       db $20                               ;0DB98A|        |      ;
                       dw CODE_0FED14                       ;0DB98B|        |0FED14;
                       db $4C                               ;0DB98D|        |      ;
 
                       dw CODE_0FED12                       ;0DB98E|        |0FED12;
 
         DATA8_0DB990: db $2C,$2E,$2F,$2D                   ;0DB990|        |      ;
 
          CODE_0DB994: LDA.B #$01                           ;0DB994|A901    |      ;
                       db $20                               ;0DB996|        |      ;
                       dw CODE_0FED14                       ;0DB997|        |0FED14;
                       LDA.B r_collisionPointXvalDiv32      ;0DB999|A512    |000012;
                       db $20                               ;0DB99B|        |      ;
                       dw CODE_0FED14                       ;0DB99C|        |0FED14;
                       LDA.B r_collisionPointAbsoluteXInRoom;0DB99E|A513    |000013;
                       db $4C                               ;0DB9A0|        |      ;
 
                       dw CODE_0FED14                       ;0DB9A1|        |0FED14;
 
          CODE_0DB9A3: LDY.B r_temp_Xpos                    ;0DB9A3|A40A    |00000A;
                       LDA.W DATA8_0DB9AE,Y                 ;0DB9A5|B9AEB9  |0DB9AE;
                       CLC                                  ;0DB9A8|18      |      ;
                       ADC.B r_collisionPointXvalDiv32      ;0DB9A9|6512    |000012;
                       STA.B r_collisionPointXvalDiv32      ;0DB9AB|8512    |000012;
                       RTS                                  ;0DB9AD|60      |      ;
 
 
         DATA8_0DB9AE: db $00,$01,$21,$20                   ;0DB9AE|        |      ;
                       LDA.B r_collisionPointAbsoluteXInRoom;0DB9B2|A513    |000013;
                       AND.B #$F0                           ;0DB9B4|29F0    |      ;
                       STA.B r_collisionPointXvalDiv32      ;0DB9B6|8512    |000012;
                       LDA.B r_collisionPointAbsoluteXRoom  ;0DB9B8|A514    |000014;
                       EOR.B r_075                          ;0DB9BA|4575    |000075;
                       LSR A                                ;0DB9BC|4A      |      ;
                       LDA.B #$20                           ;0DB9BD|A920    |      ;
                       BCC CODE_0DB9C3                      ;0DB9BF|9002    |0DB9C3;
                       LDA.B #$24                           ;0DB9C1|A924    |      ;
 
          CODE_0DB9C3: STA.B r_collisionPointAbsoluteXInRoom;0DB9C3|8513    |000013;
                       LDA.W $041C                          ;0DB9C5|AD1C04  |0D041C;
                       LSR A                                ;0DB9C8|4A      |      ;
                       LSR A                                ;0DB9C9|4A      |      ;
                       LSR A                                ;0DB9CA|4A      |      ;
                       LSR A                                ;0DB9CB|4A      |      ;
                       ROR.B r_collisionPointXvalDiv32      ;0DB9CC|6612    |000012;
                       LSR A                                ;0DB9CE|4A      |      ;
                       ROR.B r_collisionPointXvalDiv32      ;0DB9CF|6612    |000012;
                       LSR A                                ;0DB9D1|4A      |      ;
                       ROR.B r_collisionPointXvalDiv32      ;0DB9D2|6612    |000012;
                       ORA.B r_collisionPointAbsoluteXInRoom;0DB9D4|0513    |000013;
                       STA.B r_collisionPointAbsoluteXInRoom;0DB9D6|8513    |000013;
                       CLC                                  ;0DB9D8|18      |      ;
                       LDA.B #$40                           ;0DB9D9|A940    |      ;
                       ADC.B r_collisionPointXvalDiv32      ;0DB9DB|6512    |000012;
                       STA.B r_collisionPointXvalDiv32      ;0DB9DD|8512    |000012;
                       BCC CODE_0DB9E3                      ;0DB9DF|9002    |0DB9E3;
                       INC.B r_collisionPointAbsoluteXInRoom;0DB9E1|E613    |000013;
 
          CODE_0DB9E3: RTS                                  ;0DB9E3|60      |      ;
 
                       LDA.B r_collisionPointAbsoluteXInRoom;0DB9E4|A513    |000013;
                       AND.B #$FC                           ;0DB9E6|29FC    |      ;
                       ORA.B #$03                           ;0DB9E8|0903    |      ;
                       STA.B r_15                           ;0DB9EA|8515    |000015;
                       LDA.B r_collisionPointAbsoluteXInRoom;0DB9EC|A513    |000013;
                       AND.B #$03                           ;0DB9EE|2903    |      ;
                       ORA.B #$0C                           ;0DB9F0|090C    |      ;
                       STA.B r_collisionPointAbsoluteXRoom  ;0DB9F2|8514    |000014;
                       LDA.B r_collisionPointXvalDiv32      ;0DB9F4|A512    |000012;
                       ASL A                                ;0DB9F6|0A      |      ;
                       ROL.B r_collisionPointAbsoluteXRoom  ;0DB9F7|2614    |000014;
                       ASL A                                ;0DB9F9|0A      |      ;
                       ASL A                                ;0DB9FA|0A      |      ;
                       ASL A                                ;0DB9FB|0A      |      ;
                       ROL.B r_collisionPointAbsoluteXRoom  ;0DB9FC|2614    |000014;
                       ASL A                                ;0DB9FE|0A      |      ;
                       ROL.B r_collisionPointAbsoluteXRoom  ;0DB9FF|2614    |000014;
                       ASL A                                ;0DBA01|0A      |      ;
                       ROL.B r_collisionPointAbsoluteXRoom  ;0DBA02|2614    |000014;
                       RTS                                  ;0DBA04|60      |      ;
 
 
          CODE_0DBA05: LDA.B r_collisionValIsForRightHalfOf32x16block;0DBA05|A5A5    |0000A5;
                       TAX                                  ;0DBA07|AA      |      ;
                       LDY.B $09                            ;0DBA08|A409    |000009;
                       LDA.W $06E0,Y                        ;0DBA0A|B9E006  |0D06E0;
                       AND.W DATA8_0DBA50,X                 ;0DBA0D|3D50BA  |0DBA50;
                       STA.B $00                            ;0DBA10|8500    |000000;
                       LDA.W $06E0,Y                        ;0DBA12|B9E006  |0D06E0;
                       AND.W DATA8_0DBA4E,X                 ;0DBA15|3D4EBA  |0DBA4E;
                       CMP.W DATA8_0DBA48,X                 ;0DBA18|DD48BA  |0DBA48;
                       BNE CODE_0DBA27                      ;0DBA1B|D00A    |0DBA27;
                       CLC                                  ;0DBA1D|18      |      ;
                       ADC.W DATA8_0DBA4A,X                 ;0DBA1E|7D4ABA  |0DBA4A;
                       JSR.W CODE_0DBA52                    ;0DBA21|2052BA  |0DBA52;
                       JMP.W CODE_0DBA2E                    ;0DBA24|4C2EBA  |0DBA2E;
 
 
          CODE_0DBA27: CLC                                  ;0DBA27|18      |      ;
                       ADC.W DATA8_0DBA4C,X                 ;0DBA28|7D4CBA  |0DBA4C;
                       JSR.W CODE_0DBA52                    ;0DBA2B|2052BA  |0DBA52;
 
          CODE_0DBA2E: AND.W DATA8_0DBA4E,X                 ;0DBA2E|3D4EBA  |0DBA4E;
                       STA.B r_temp_Xpos                    ;0DBA31|850A    |00000A;
                       ORA.B $00                            ;0DBA33|0500    |000000;
                       STA.W $06E0,Y                        ;0DBA35|99E006  |0D06E0;
                       LDA.B r_temp_Xpos                    ;0DBA38|A50A    |00000A;
                       CMP.B #$10                           ;0DBA3A|C910    |      ;
                       BCC CODE_0DBA42                      ;0DBA3C|9004    |0DBA42;
                       LSR A                                ;0DBA3E|4A      |      ;
                       LSR A                                ;0DBA3F|4A      |      ;
                       LSR A                                ;0DBA40|4A      |      ;
                       LSR A                                ;0DBA41|4A      |      ;
 
          CODE_0DBA42: SEC                                  ;0DBA42|38      |      ;
                       SBC.B #$0C                           ;0DBA43|E90C    |      ;
                       STA.B r_temp_Xpos                    ;0DBA45|850A    |00000A;
                       RTS                                  ;0DBA47|60      |      ;
 
 
         DATA8_0DBA48: db $40,$04                           ;0DBA48|        |      ;
 
 
         DATA8_0DBA4A: db $80,$08                           ;0DBA4A|        |      ;
 
         DATA8_0DBA4C: db $10,$01                           ;0DBA4C|        |      ;
 
         DATA8_0DBA4E: db $F0,$0F                           ;0DBA4E|        |      ;
 
         DATA8_0DBA50: db $0F,$F0                           ;0DBA50|        |      ;
 
          CODE_0DBA52: PHA                                  ;0DBA52|48      |      ;
                       STY.B $02                            ;0DBA53|8402    |000002;
                       LDA.B r_tempCurrRoomIdx              ;0DBA55|A50E    |00000E;
                       LSR A                                ;0DBA57|4A      |      ;
                       LSR A                                ;0DBA58|4A      |      ;
                       LSR A                                ;0DBA59|4A      |      ;
                       LSR A                                ;0DBA5A|4A      |      ;
                       TAY                                  ;0DBA5B|A8      |      ;
                       LDA.B #$00                           ;0DBA5C|A900    |      ;
                       STA.W $03B0,Y                        ;0DBA5E|99B003  |0D03B0;
                       LDY.B $02                            ;0DBA61|A402    |000002;
                       PLA                                  ;0DBA63|68      |      ;
                       RTS                                  ;0DBA64|60      |      ;
 
 
         DATA8_0DBA65: db $03,$01,$00,$00,$03,$01,$00,$01   ;0DBA65|        |      ;
                       db $03,$01,$00,$02,$03,$03,$00,$00   ;0DBA6D|        |      ;
                       db $03,$03,$00,$01,$03,$03,$00,$02   ;0DBA75|        |      ;
                       db $07,$00,$00,$00,$07,$05,$00,$00   ;0DBA7D|        |      ;
                       db $07,$05,$00,$01,$07,$05,$00,$02   ;0DBA85|        |      ;
                       db $07,$05,$01,$00,$08,$03,$00,$01   ;0DBA8D|        |      ;
                       db $08,$03,$00,$02,$08,$04,$00,$01   ;0DBA95|        |      ;
                       db $08,$04,$00,$02,$08,$04,$00,$04   ;0DBA9D|        |      ;
                       db $0A,$01,$00,$00,$0A,$01,$00,$01   ;0DBAA5|        |      ;
                       db $0A,$05,$00,$01,$0A,$05,$00,$02   ;0DBAAD|        |      ;
                       db $0A,$06,$01,$00,$0A,$06,$01,$01   ;0DBAB5|        |      ;
                       db $0A,$06,$01,$02,$0A,$06,$01,$03   ;0DBABD|        |      ;
                       db $0B,$02,$01,$00,$0B,$02,$01,$01   ;0DBAC5|        |      ;
                       db $0E,$00,$01,$00,$0E,$00,$01,$01   ;0DBACD|        |      ;
                       db $0E,$00,$01,$02,$0E,$00,$00,$00   ;0DBAD5|        |      ;
                       db $0E,$00,$00,$01                   ;0DBADD|        |      ;
                       JSR.W CODE_0DBB3E                    ;0DBAE1|203EBB  |0DBB3E;
                       BCC CODE_0DBAEC                      ;0DBAE4|9006    |0DBAEC;
 
          CODE_0DBAE6: RTS                                  ;0DBAE6|60      |      ;
 
                       JSR.W CODE_0DBB5B                    ;0DBAE7|205BBB  |0DBB5B;
                       BCS CODE_0DBAE6                      ;0DBAEA|B0FA    |0DBAE6;
 
          CODE_0DBAEC: LDA.B $03                            ;0DBAEC|A503    |000003;
                       ASL A                                ;0DBAEE|0A      |      ;
                       ASL A                                ;0DBAEF|0A      |      ;
                       ASL A                                ;0DBAF0|0A      |      ;
                       STA.B $00                            ;0DBAF1|8500    |000000;
                       LDA.B r_tempCurrRoomIdx              ;0DBAF3|A50E    |00000E;
                       LSR A                                ;0DBAF5|4A      |      ;
                       LSR A                                ;0DBAF6|4A      |      ;
                       LSR A                                ;0DBAF7|4A      |      ;
                       LSR A                                ;0DBAF8|4A      |      ;
                       LSR A                                ;0DBAF9|4A      |      ;
                       PHP                                  ;0DBAFA|08      |      ;
                       CLC                                  ;0DBAFB|18      |      ;
                       ADC.B $00                            ;0DBAFC|6500    |000000;
                       TAY                                  ;0DBAFE|A8      |      ;
                       LDA.B #$00                           ;0DBAFF|A900    |      ;
                       PLP                                  ;0DBB01|28      |      ;
                       ROL A                                ;0DBB02|2A      |      ;
                       TAX                                  ;0DBB03|AA      |      ;
                       LDA.W DATA8_0DBBCA,Y                 ;0DBB04|B9CABB  |0DBBCA;
                       STA.B r_tempCurrSection              ;0DBB07|850D    |00000D;
                       AND.W DATA8_0DBA4E,X                 ;0DBB09|3D4EBA  |0DBA4E;
                       CPX.B #$00                           ;0DBB0C|E000    |      ;
                       BNE CODE_0DBB14                      ;0DBB0E|D004    |0DBB14;
                       LSR A                                ;0DBB10|4A      |      ;
                       LSR A                                ;0DBB11|4A      |      ;
                       LSR A                                ;0DBB12|4A      |      ;
                       LSR A                                ;0DBB13|4A      |      ;
 
          CODE_0DBB14: STA.B $00                            ;0DBB14|8500    |000000;
                       JSR.W CODE_0DBB91                    ;0DBB16|2091BB  |0DBB91;
                       LDA.B r_stage                        ;0DBB19|A532    |000032;
                       ASL A                                ;0DBB1B|0A      |      ;
                       TAY                                  ;0DBB1C|A8      |      ;
                       LDA.W UNREACH_0DBCC2,Y               ;0DBB1D|B9C2BC  |0DBCC2;
                       STA.B $02                            ;0DBB20|8502    |000002;
                       LDA.W UNREACH_0DBCC3,Y               ;0DBB22|B9C3BC  |0DBCC3;
                       STA.B $03                            ;0DBB25|8503    |000003;
                       LDA.B $00                            ;0DBB27|A500    |000000;
                       ASL A                                ;0DBB29|0A      |      ;
                       ASL A                                ;0DBB2A|0A      |      ;
                       CLC                                  ;0DBB2B|18      |      ;
                       ADC.B $00                            ;0DBB2C|6500    |000000;
                       STA.B $00                            ;0DBB2E|8500    |000000;
                       CLC                                  ;0DBB30|18      |      ;
                       LDA.B $00                            ;0DBB31|A500    |000000;
                       ADC.B $02                            ;0DBB33|6502    |000002;
                       STA.B r_coreLoadingFuncAddr          ;0DBB35|8516    |000016;
                       LDA.B $03                            ;0DBB37|A503    |000003;
                       ADC.B #$00                           ;0DBB39|6900    |      ;
                       STA.B $17                            ;0DBB3B|8517    |000017;
                       RTS                                  ;0DBB3D|60      |      ;
 
 
          CODE_0DBB3E: LDA.W $041C                          ;0DBB3E|AD1C04  |0D041C;
                       SEC                                  ;0DBB41|38      |      ;
                       SBC.B #$20                           ;0DBB42|E920    |      ;
                       CLC                                  ;0DBB44|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;0DBB45|6556    |000056;
                       BCS CODE_0DBB4D                      ;0DBB47|B004    |0DBB4D;
                       CMP.B #$F0                           ;0DBB49|C9F0    |      ;
                       BCC CODE_0DBB50                      ;0DBB4B|9003    |0DBB50;
 
          CODE_0DBB4D: ADC.B #$0F                           ;0DBB4D|690F    |      ;
                       SEC                                  ;0DBB4F|38      |      ;
 
          CODE_0DBB50: STA.B $0B                            ;0DBB50|850B    |00000B;
                       LDA.B r_sceneScrollOffsetHi          ;0DBB52|A557    |000057;
                       ADC.B #$00                           ;0DBB54|6900    |      ;
                       STA.B $07                            ;0DBB56|8507    |000007;
                       JMP.W CODE_0DBB5F                    ;0DBB58|4C5FBB  |0DBB5F;
 
 
          CODE_0DBB5B: LDA.B r_roomSectionChrBanksDataOffset;0DBB5B|A50F    |00000F;
                       STA.B $07                            ;0DBB5D|8507    |000007;
 
          CODE_0DBB5F: LDA.B #$1F                           ;0DBB5F|A91F    |      ;
                       STA.B $02                            ;0DBB61|8502    |000002;
                       LDA.B r_stage                        ;0DBB63|A532    |000032;
                       STA.B $04                            ;0DBB65|8504    |000004;
                       LDA.B r_blockLevel                   ;0DBB67|A533    |000033;
                       STA.B $05                            ;0DBB69|8505    |000005;
                       LDA.B r_roomIdx                      ;0DBB6B|A534    |000034;
                       STA.B $06                            ;0DBB6D|8506    |000006;
                       LDA.B #$00                           ;0DBB6F|A900    |      ;
                       STA.B $03                            ;0DBB71|8503    |000003;
 
          CODE_0DBB73: LDA.B $03                            ;0DBB73|A503    |000003;
                       ASL A                                ;0DBB75|0A      |      ;
                       ASL A                                ;0DBB76|0A      |      ;
                       TAY                                  ;0DBB77|A8      |      ;
                       LDX.B #$00                           ;0DBB78|A200    |      ;
 
          CODE_0DBB7A: LDA.B $04,X                          ;0DBB7A|B504    |000004;
                       CMP.W DATA8_0DBA65,Y                 ;0DBB7C|D965BA  |0DBA65;
                       BNE CODE_0DBB89                      ;0DBB7F|D008    |0DBB89;
                       INY                                  ;0DBB81|C8      |      ;
                       INX                                  ;0DBB82|E8      |      ;
                       CPX.B #$04                           ;0DBB83|E004    |      ;
                       BNE CODE_0DBB7A                      ;0DBB85|D0F3    |0DBB7A;
                       CLC                                  ;0DBB87|18      |      ;
                       RTS                                  ;0DBB88|60      |      ;
 
 
          CODE_0DBB89: INC.B $03                            ;0DBB89|E603    |000003;
                       DEC.B $02                            ;0DBB8B|C602    |000002;
                       BNE CODE_0DBB73                      ;0DBB8D|D0E4    |0DBB73;
                       SEC                                  ;0DBB8F|38      |      ;
                       RTS                                  ;0DBB90|60      |      ;
 
 
          CODE_0DBB91: LDA.B $00                            ;0DBB91|A500    |000000;
                       LDY.B r_stage                        ;0DBB93|A432    |000032;
                       CPY.B #$0A                           ;0DBB95|C00A    |      ;
                       BNE CODE_0DBBAA                      ;0DBB97|D011    |0DBBAA;
                       CMP.B #$0E                           ;0DBB99|C90E    |      ;
                       BNE CODE_0DBBC5                      ;0DBB9B|D028    |0DBBC5;
                       LDA.B #$0D                           ;0DBB9D|A90D    |      ;
                       LDY.B $0B                            ;0DBB9F|A40B    |00000B;
                       CPY.B #$A0                           ;0DBBA1|C0A0    |      ;
                       BCC CODE_0DBBA7                      ;0DBBA3|9002    |0DBBA7;
                       LDA.B #$0B                           ;0DBBA5|A90B    |      ;
 
          CODE_0DBBA7: STA.B $00                            ;0DBBA7|8500    |000000;
                       RTS                                  ;0DBBA9|60      |      ;
 
 
          CODE_0DBBAA: CPY.B #$0B                           ;0DBBAA|C00B    |      ;
                       BNE CODE_0DBBC5                      ;0DBBAC|D017    |0DBBC5;
                       LDY.B r_roomSectionChrBanksDataOffset;0DBBAE|A40F    |00000F;
                       BNE CODE_0DBBC5                      ;0DBBB0|D013    |0DBBC5;
                       SEC                                  ;0DBBB2|38      |      ;
                       SBC.B #$0D                           ;0DBBB3|E90D    |      ;
                       BCC CODE_0DBBC5                      ;0DBBB5|900E    |0DBBC5;
                       ASL A                                ;0DBBB7|0A      |      ;
                       TAY                                  ;0DBBB8|A8      |      ;
                       LDA.B $0B                            ;0DBBB9|A50B    |00000B;
                       CMP.B #$A0                           ;0DBBBB|C9A0    |      ;
                       BCC CODE_0DBBC0                      ;0DBBBD|9001    |0DBBC0;
                       INY                                  ;0DBBBF|C8      |      ;
 
          CODE_0DBBC0: LDA.W DATA8_0DBBC6,Y                 ;0DBBC0|B9C6BB  |0DBBC6;
                       STA.B $00                            ;0DBBC3|8500    |000000;
 
          CODE_0DBBC5: RTS                                  ;0DBBC5|60      |      ;
 
 
         DATA8_0DBBC6: db $02,$01,$03,$04                   ;0DBBC6|        |      ;
 
         DATA8_0DBBCA: db $FF,$FF,$00,$FF,$00,$FF,$FF,$FF   ;0DBBCA|        |      ;
                       db $FF,$FF,$12,$00,$FF,$FF,$00,$FF   ;0DBBD2|        |      ;
                       db $FF,$FF,$FF,$00,$FF,$00,$FF,$00   ;0DBBDA|        |      ;
                       db $FF,$FF,$FF,$FF,$00,$FF,$FF,$FF   ;0DBBE2|        |      ;
                       db $FF,$00,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBBEA|        |      ;
                       db $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBBF2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$00,$FF,$FF   ;0DBBFA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$12,$F3   ;0DBC02|        |      ;
                       db $0F,$00,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBC0A|        |      ;
                       db $00,$F0,$30,$12,$FF,$00,$FF,$FF   ;0DBC12|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$00,$FF   ;0DBC1A|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$34,$FF,$34   ;0DBC22|        |      ;
                       db $FF,$34,$FF,$12,$FF,$12,$FF,$FF   ;0DBC2A|        |      ;
                       db $00,$FF,$12,$12,$12,$12,$12,$12   ;0DBC32|        |      ;
                       db $05,$FF,$FF,$12,$FF,$12,$FF,$FF   ;0DBC3A|        |      ;
                       db $FF,$50,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBC42|        |      ;
                       db $FF,$FF,$FF,$FF,$00,$FF,$12,$FF   ;0DBC4A|        |      ;
                       db $34,$FF,$12,$FF                   ;0DBC52|        |      ;
                       db $00,$FF,$FF,$FF,$FF,$FF,$56,$78   ;0DBC56|        |      ;
                       db $56,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBC5E|        |0000FF;
                       db $FF,$56,$FF,$FF,$FF,$9A,$FF,$FF   ;0DBC66|        |FFFF56;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBC6E|        |FFFFFF;
                       db $FF,$BC,$BC,$FF,$FF,$FF,$DC,$BC   ;0DBC76|        |FFBCBC;
                       db $FC,$FF,$BC,$FF,$FF,$DC,$EC,$BC   ;0DBC7E|        |0DBCFF;
                       db $BC,$BC,$FF,$FF,$23,$11,$23,$DE   ;0DBC86|        |0DFFBC;
                       db $11,$23,$11,$FF,$FF,$11,$23,$11   ;0DBC8E|        |000023;
                       db $11,$23,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBC96|        |000023;
                       db $FF,$FB,$FF,$FF,$01,$12,$FF,$FF   ;0DBC9E|        |FFFFFB;
                       db $34,$FF,$34,$56,$01,$FF,$FF,$FF   ;0DBCA6|        |0000FF;
                       db $FF,$78,$34,$9A,$FF,$FF,$00,$00   ;0DBCAE|        |9A3478;
                       db $00,$FF,$FF,$FF,$00,$00,$FF,$00   ;0DBCB6|        |      ;
                       db $FF,$FF,$FF,$FF                   ;0DBCBE|        |FFFFFF;
 
       UNREACH_0DBCC2: db $E0                               ;0DBCC2|        |      ;
 
       UNREACH_0DBCC3: db $BC,$E0,$BC,$E0,$BC,$E0,$BC,$E0   ;0DBCC3|        |0DBCE0;
                       db $BC,$E0,$BC,$E0,$BC,$EF,$BC,$03   ;0DBCCB|        |0DBCE0;
                       db $BD,$E0,$BC,$21,$BD,$67,$BD,$E0   ;0DBCD3|        |0DBCE0;
                       db $BC,$E0,$BC,$80,$BD,$00,$00,$00   ;0DBCDB|        |0DBCE0;
                       db $00,$00,$7C,$3E,$7C,$3E,$55,$7F   ;0DBCE3|        |      ;
                       db $00,$7E,$00,$55,$00,$00,$00,$00   ;0DBCEB|        |      ;
                       db $00,$80,$81,$94,$91,$AA,$A0,$A1   ;0DBCF3|        |      ;
                       db $B0,$B1,$AA,$77,$00,$84,$95,$AA   ;0DBCFB|        |0DBCAE;
                       db $00,$00,$00,$00,$00,$00,$00,$84   ;0DBD03|        |      ;
                       db $85,$AA,$AC,$00,$B4,$AC,$FF,$84   ;0DBD0B|        |0000AA;
                       db $85,$94,$95,$AA,$86,$3F,$96,$AC   ;0DBD13|        |000094;
                       db $FF,$00,$AC,$AC,$00,$FF,$00,$00   ;0DBD1B|        |ACAC00;
                       db $00,$00,$00,$4D,$4C,$5D,$5F,$FF   ;0DBD23|        |      ;
                       db $00,$00,$5E,$00,$FF,$5D,$5F,$4C   ;0DBD2B|        |      ;
                       db $4F,$FF,$4F,$4C,$5F,$5D,$FF,$5D   ;0DBD33|        |4C4FFF;
                       db $00,$00,$4D,$55,$5D,$00,$4C,$5C   ;0DBD3B|        |      ;
                       db $55,$4D,$4C,$5D,$5F,$55,$4F,$5F   ;0DBD43|        |00004D;
                       db $5E,$5D,$55,$6B,$88,$7C,$6A,$55   ;0DBD4B|        |0D555D;
                       db $7E,$7F,$89,$7E,$55,$80,$81,$90   ;0DBD53|        |0D897F;
                       db $91,$AA,$81,$82,$91,$92,$AA,$80   ;0DBD5B|        |0000AA;
                       db $81,$84,$91,$AA,$00,$00,$00,$00   ;0DBD63|        |000084;
                       db $00,$40,$41,$50,$51,$55,$84,$85   ;0DBD6B|        |      ;
                       db $94,$95,$55,$86,$87,$96,$97,$55   ;0DBD73|        |000095;
                       db $49,$49,$48,$48,$55,$00,$00,$00   ;0DBD7B|        |      ;
                       db $00,$00,$00,$4C,$00,$4C,$AA,$4F   ;0DBD83|        |      ;
                       db $00,$4F,$00,$AA,$A8,$A9,$92,$B0   ;0DBD8B|        |      ;
                       db $FF,$96,$00,$A6,$00,$FF,$00,$A3   ;0DBD93|        |A60096;
                       db $00,$91,$55,$B7,$00,$3E,$00,$55   ;0DBD9B|        |      ;
                       db $00,$00,$9B,$AA,$FF,$8E,$9C,$AB   ;0DBDA3|        |      ;
                       db $9C,$FF,$9C,$28,$9B,$39,$FF,$00   ;0DBDAB|        |0D9CFF;
                       db $AA,$8F,$28,$FF,$3E,$00,$3E,$00   ;0DBDB3|        |      ;
                       db $55,$A9,$01,$20,$14,$ED,$A9,$00   ;0DBDBB|        |0000A9;
                       db $20,$14,$ED,$A9,$23,$20,$14,$ED   ;0DBDC3|        |0DED14;
                       db $A9,$BC,$85,$03,$A0,$00           ;0DBDCB|        |      ;
 
          CODE_0DBDD1: LDA.B $03                            ;0DBDD1|A503    |000003;
                       db $20                               ;0DBDD3|        |      ;
                       dw CODE_0FED14                       ;0DBDD4|        |0FED14;
                       CLC                                  ;0DBDD6|18      |      ;
                       ADC.B #$02                           ;0DBDD7|6902    |      ;
                       db $20                               ;0DBDD9|        |      ;
                       dw CODE_0FED14                       ;0DBDDA|        |0FED14;
                       INY                                  ;0DBDDC|C8      |      ;
                       CPY.B #$20                           ;0DBDDD|C020    |      ;
                       BCS DATA8_0DBDEC                     ;0DBDDF|B00B    |0DBDEC;
                       CPY.B #$10                           ;0DBDE1|C010    |      ;
                       BNE CODE_0DBDD1                      ;0DBDE3|D0EC    |0DBDD1;
                       LDA.B #$BD                           ;0DBDE5|A9BD    |      ;
                       STA.B $03                            ;0DBDE7|8503    |000003;
                       JMP.W CODE_0DBDD1                    ;0DBDE9|4CD1BD  |0DBDD1;
 
 
         DATA8_0DBDEC: db $4C                               ;0DBDEC|        |      ;
 
                       dw CODE_0FED12                       ;0DBDED|        |0FED12;
                       LDA.W $07F0                          ;0DBDEF|ADF007  |0D07F0;
                       BMI CODE_0DBDFE                      ;0DBDF2|300A    |0DBDFE;
                       ORA.B #$80                           ;0DBDF4|0980    |      ;
                       STA.W $07F0                          ;0DBDF6|8DF007  |0D07F0;
                       LDA.B #$00                           ;0DBDF9|A900    |      ;
                       STA.W $07F1                          ;0DBDFB|8DF107  |0D07F1;
 
          CODE_0DBDFE: LDA.W $07F0                          ;0DBDFE|ADF007  |0D07F0;
                       ASL A                                ;0DBE01|0A      |      ;
                       TAY                                  ;0DBE02|A8      |      ;
                       LDA.B #$00                           ;0DBE03|A900    |      ;
                       STA.B $01                            ;0DBE05|8501    |000001;
                       LDA.W $07F1                          ;0DBE07|ADF107  |0D07F1;
                       ASL A                                ;0DBE0A|0A      |      ;
                       ROL.B $01                            ;0DBE0B|2601    |000001;
                       ASL A                                ;0DBE0D|0A      |      ;
                       ROL.B $01                            ;0DBE0E|2601    |000001;
                       ASL A                                ;0DBE10|0A      |      ;
                       ROL.B $01                            ;0DBE11|2601    |000001;
                       ASL A                                ;0DBE13|0A      |      ;
                       ROL.B $01                            ;0DBE14|2601    |000001;
                       ASL A                                ;0DBE16|0A      |      ;
                       ROL.B $01                            ;0DBE17|2601    |000001;
                       STA.B $00                            ;0DBE19|8500    |000000;
                       CLC                                  ;0DBE1B|18      |      ;
                       LDA.W UNREACH_0DBE5D,Y               ;0DBE1C|B95DBE  |0DBE5D;
                       ADC.B $00                            ;0DBE1F|6500    |000000;
                       STA.B $00                            ;0DBE21|8500    |000000;
                       LDA.W UNREACH_0DBE5E,Y               ;0DBE23|B95EBE  |0DBE5E;
                       ADC.B $01                            ;0DBE26|6501    |000001;
                       STA.B $01                            ;0DBE28|8501    |000001;
                       LDA.B #$01                           ;0DBE2A|A901    |      ;
                       db $20                               ;0DBE2C|        |      ;
                       dw CODE_0FED14                       ;0DBE2D|        |0FED14;
                       LDA.B $00                            ;0DBE2F|A500    |000000;
                       db $20                               ;0DBE31|        |      ;
                       dw CODE_0FED14                       ;0DBE32|        |0FED14;
                       LDA.B $01                            ;0DBE34|A501    |000001;
                       db $20                               ;0DBE36|        |      ;
                       dw CODE_0FED14                       ;0DBE37|        |0FED14;
                       LDY.B #$20                           ;0DBE39|A020    |      ;
                       LDA.B #$00                           ;0DBE3B|A900    |      ;
 
         DATA8_0DBE3D: db $20                               ;0DBE3D|        |      ;
                       dw CODE_0FED14                       ;0DBE3E|        |0FED14;
                       DEY                                  ;0DBE40|88      |      ;
                       BNE DATA8_0DBE3D                     ;0DBE41|D0FA    |0DBE3D;
                       db $20                               ;0DBE43|        |      ;
                       dw CODE_0FED12                       ;0DBE44|        |0FED12;
                       LDA.W $07F0                          ;0DBE46|ADF007  |0D07F0;
                       AND.B #$7F                           ;0DBE49|297F    |      ;
                       TAY                                  ;0DBE4B|A8      |      ;
                       INC.W $07F1                          ;0DBE4C|EEF107  |0D07F1;
                       LDA.W $07F1                          ;0DBE4F|ADF107  |0D07F1;
                       CMP.W UNREACH_0DBE61,Y               ;0DBE52|D961BE  |0DBE61;
                       BCC CODE_0DBE5C                      ;0DBE55|9005    |0DBE5C;
                       LDA.B #$FF                           ;0DBE57|A9FF    |      ;
                       STA.W $07F1                          ;0DBE59|8DF107  |0D07F1;
 
          CODE_0DBE5C: RTS                                  ;0DBE5C|60      |      ;
 
 
       UNREACH_0DBE5D: db $C0                               ;0DBE5D|        |      ;
 
       UNREACH_0DBE5E: db $20,$00,$24                       ;0DBE5E|        |0D2400;
 
       UNREACH_0DBE61: db $1E,$20,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE61|        |0DFF20;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE69|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE71|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE79|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE81|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE89|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE91|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBE99|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEA1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEA9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEB1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEB9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEC1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEC9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBED1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBED9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEE1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEE9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEF1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBEF9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF01|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF09|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF11|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF19|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF21|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF29|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF31|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF39|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF41|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF49|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF51|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF59|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF61|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF69|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF71|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF79|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF81|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF89|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF91|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBF99|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFA1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFA9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFB1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFB9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFC1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFC9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFD1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFD9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFE1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFE9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0DBFF1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF       ;0DBFF9|        |FFFFFF;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DC9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DCFF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DD9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DDFF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DE9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DECF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DED98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DEFF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF000|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF008|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF010|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF018|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF020|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF028|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF030|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF038|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF040|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF048|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF050|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF058|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF060|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF068|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF070|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF078|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF080|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF088|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF090|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF098|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF0F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF100|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF108|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF110|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF118|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF120|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF128|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF130|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF138|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF140|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF148|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF150|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF158|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF160|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF168|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF170|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF178|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF180|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF188|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF190|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF198|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF1F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF200|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF208|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF210|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF218|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF220|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF228|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF230|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF238|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF240|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF248|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF250|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF258|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF260|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF268|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF270|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF278|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF280|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF288|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF290|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF298|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF2F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF300|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF308|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF310|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF318|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF320|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF328|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF330|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF338|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF340|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF348|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF350|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF358|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF360|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF368|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF370|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF378|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF380|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF388|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF390|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF398|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF3F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF400|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF408|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF410|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF418|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF420|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF428|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF430|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF438|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF440|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF448|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF450|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF458|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF460|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF468|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF470|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF478|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF480|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF488|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF490|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF498|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF4F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF500|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF508|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF510|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF518|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF520|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF528|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF530|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF538|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF540|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF548|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF550|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF558|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF560|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF568|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF570|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF578|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF580|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF588|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF590|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF598|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF5F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF600|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF608|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF610|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF618|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF620|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF628|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF630|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF638|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF640|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF648|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF650|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF658|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF660|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF668|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF670|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF678|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF680|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF688|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF690|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF698|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF6F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF700|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF708|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF710|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF718|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF720|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF728|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF730|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF738|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF740|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF748|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF750|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF758|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF760|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF768|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF770|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF778|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF780|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF788|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF790|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF798|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF7F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF800|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF808|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF810|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF818|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF820|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF828|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF830|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF838|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF840|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF848|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF850|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF858|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF860|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF868|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF870|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF878|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF880|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF888|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF890|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF898|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF8F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF900|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF908|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF910|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF918|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF920|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF928|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF930|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF938|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF940|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF948|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF950|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF958|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF960|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF968|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF970|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF978|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF980|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF988|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF990|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF998|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9A0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9A8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9B0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9B8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9C0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9C8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9D0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9D8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9E0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9E8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9F0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DF9F8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFA98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFAF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0DFFF8|        |      ;
