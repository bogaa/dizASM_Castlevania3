 
 
 
              bank_9a: db $9A                               ;0D8000|        |      ; PRG 34000
 
        mainSpriteOAM: LDA.B wGameState                     ;0D8001|A518    |000025;
                       CMP.B #$0C                           ;0D8003|C90C    |      ;
                       BNE CODE_0D800A                      ;0D8005|D003    |0D800A;
                       JMP.W CODE_0D8188                    ;0D8007|4C8881  |0D8188;
 
 
          CODE_0D800A: LDA.B #$00                           ;0D800A|A900    |      ;
                       STA.B wCollisionPointXvalDiv32-$D    ;0D800C|8505    |000012;
                       LDA.B #$40                           ;0D800E|A940    |      ;
                       STA.B wCollisionPointAbsoluteXRoom-$D;0D8010|8507    |000014;
                       LDA.B wCurrFrameStartingOamOffset    ;0D8012|A520    |00002D;
                       CLC                                  ;0D8014|18      |      ;
                       ADC.B #$44                           ;0D8015|6944    |      ;
                       STA.B wCurrFrameStartingOamOffset    ;0D8017|8520    |00002D;
                       STA.B wCollisionPointYinScreen-$D    ;0D8019|8504    |000011;
 
          CODE_0D801B: LDX.B wCollisionPointXvalDiv32-$D    ;0D801B|A605    |000012;
                       CPX.B #$1C                           ;0D801D|E01C    |      ;
                       BCS CODE_0D8041                      ;0D801F|B020    |0D8041;
                       LDA.W $0400,X                        ;0D8021|BD0004  |0D0400;
                       BEQ CODE_0D803D                      ;0D8024|F017    |0D803D;
                       LDA.W $0470,X                        ;0D8026|BD7004  |0D0470;
                       BMI CODE_0D803D                      ;0D8029|3012    |0D803D;
                       LDA.W $0454,X                        ;0D802B|BD5404  |0D0454;
                       STA.B wDoubleCurrSection-$D          ;0D802E|8500    |00000D;
                       LDA.W $041C,X                        ;0D8030|BD1C04  |0D041C;
                       STA.B wDoubleCurrRoomIdx-$D          ;0D8033|8501    |00000E;
                       LDA.W $0438,X                        ;0D8035|BD3804  |0D0438;
                       STA.B wRoomSectionChrBanksDataOffset-$D;0D8038|8502    |00000F;
                       JSR.W CODE_0D8079                    ;0D803A|207980  |0D8079;
 
          CODE_0D803D: INC.B wCollisionPointXvalDiv32-$D    ;0D803D|E605    |000012;
                       BNE CODE_0D801B                      ;0D803F|D0DA    |0D801B;
 
          CODE_0D8041: LDX.B wCollisionPointYinScreen-$D    ;0D8041|A604    |000011;
                       LDY.B wCollisionPointAbsoluteXRoom-$D;0D8043|A407    |000014;
 
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
                       ADC.B wDoubleCurrRoomIdx-$D          ;0D805E|6501    |00000E;
                       STA.W $0200,X                        ;0D8060|9D0002  |0D0200;
                       INY                                  ;0D8063|C8      |      ;
                       LDA.B wLoadCHRbeforeSwap             ;0D8064|A5B0    |0000BD;
                       BNE CODE_0D8053                      ;0D8066|D0EB    |0D8053;
 
          CODE_0D8068: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8068|B10A    |000017;
 
          CODE_0D806A: STA.W $0201,X                        ;0D806A|9D0102  |0D0201;
                       LDA.B wCurrDrawnEntityCachedAttr     ;0D806D|A510    |00001D;
                       JMP.W CODE_0D80CA                    ;0D806F|4CCA80  |0D80CA;
 
 
       UNREACH_0D8072: db $20,$7B,$81,$90,$3D               ;0D8072|        |0D817B;
                       db $B0,$3D                           ;0D8077|        |0D80B6;
 
          CODE_0D8079: LDY.W $048C,X                        ;0D8079|BC8C04  |0D048C;
                       STY.B wRoomSectionChrBanksDataOffset ;0D807C|840F    |00001C;
                       LDA.W mainSpriteAssem,Y              ;0D807E|B93E82  |0D823E;
                       STA.B wCurrNumToVramQueue            ;0D8081|8508    |000015;
                       LDA.W PTR16_0D823F,Y                 ;0D8083|B93F82  |0D823F;
                       STA.B wCoreLoadingFuncAddr-$D        ;0D8086|8509    |000016;
                       LDY.W $0400,X                        ;0D8088|BC0004  |0D0400;
                       LDA.B (wCurrNumToVramQueue),Y        ;0D808B|B108    |000015;
                       STA.B wCurrRoomSectionPlayerPosAndScreenAddr;0D808D|850A    |000017;
                       INY                                  ;0D808F|C8      |      ;
                       LDA.B (wCurrNumToVramQueue),Y        ;0D8090|B108    |000015;
                       STA.B wGameState-$D                  ;0D8092|850B    |000018;
                       LDY.B #$00                           ;0D8094|A000    |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8096|B10A    |000017;
                       STA.B wCurrDrawnEntityCachedAttr-$D  ;0D8098|8503    |000010;
                       LDA.W $04A8,X                        ;0D809A|BDA804  |0D04A8;
                       BEQ CODE_0D80F9                      ;0D809D|F05A    |0D80F9;
                       LDX.B wCollisionPointYinScreen-$D    ;0D809F|A604    |000011;
 
          CODE_0D80A1: INY                                  ;0D80A1|C8      |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D80A2|B10A    |000017;
                       BPL CODE_0D805A                      ;0D80A4|10B4    |0D805A;
                       SEC                                  ;0D80A6|38      |      ;
 
          CODE_0D80A7: ROR A                                ;0D80A7|6A      |      ;
                       BCS CODE_0D805D                      ;0D80A8|B0B3    |0D805D;
                       ADC.B wDoubleCurrRoomIdx-$D          ;0D80AA|6501    |00000E;
                       STA.W $0200,X                        ;0D80AC|9D0002  |0D0200;
                       INY                                  ;0D80AF|C8      |      ;
                       LDA.B wLoadCHRbeforeSwap             ;0D80B0|A5B0    |0000BD;
                       BNE UNREACH_0D8072                   ;0D80B2|D0BE    |0D8072;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D80B4|B10A    |000017;
                       STA.W $0201,X                        ;0D80B6|9D0102  |0D0201;
                       INY                                  ;0D80B9|C8      |      ;
                       LDA.B wDoubleCurrSection-$D          ;0D80BA|A500    |00000D;
                       BEQ CODE_0D80C6                      ;0D80BC|F008    |0D80C6;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D80BE|B10A    |000017;
                       AND.B #$FC                           ;0D80C0|29FC    |      ;
                       ORA.B wDoubleCurrSection-$D          ;0D80C2|0500    |00000D;
                       BNE CODE_0D80C8                      ;0D80C4|D002    |0D80C8;
 
          CODE_0D80C6: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D80C6|B10A    |000017;
 
          CODE_0D80C8: STA.B wCurrDrawnEntityCachedAttr     ;0D80C8|8510    |00001D;
 
          CODE_0D80CA: STA.W $0202,X                        ;0D80CA|9D0202  |0D0202;
                       INY                                  ;0D80CD|C8      |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D80CE|B10A    |000017;
                       BMI CODE_0D80EA                      ;0D80D0|3018    |0D80EA;
                       CLC                                  ;0D80D2|18      |      ;
                       ADC.B wRoomSectionChrBanksDataOffset-$D;0D80D3|6502    |00000F;
                       BCS CODE_0D80EF                      ;0D80D5|B018    |0D80EF;
 
          CODE_0D80D7: STA.W $0203,X                        ;0D80D7|9D0302  |0D0203;
 
          CODE_0D80DA: TXA                                  ;0D80DA|8A      |      ;
                       CLC                                  ;0D80DB|18      |      ;
                       ADC.B #$C4                           ;0D80DC|69C4    |      ;
                       TAX                                  ;0D80DE|AA      |      ;
                       DEC.B wCollisionPointAbsoluteXRoom-$D;0D80DF|C607    |000014;
                       BEQ CODE_0D80F6                      ;0D80E1|F013    |0D80F6;
                       DEC.B wCurrDrawnEntityCachedAttr-$D  ;0D80E3|C603    |000010;
                       BNE CODE_0D80A1                      ;0D80E5|D0BA    |0D80A1;
                       STX.B wCollisionPointYinScreen-$D    ;0D80E7|8604    |000011;
                       RTS                                  ;0D80E9|60      |      ;
 
 
          CODE_0D80EA: CLC                                  ;0D80EA|18      |      ;
                       ADC.B wRoomSectionChrBanksDataOffset-$D;0D80EB|6502    |00000F;
                       BCS CODE_0D80D7                      ;0D80ED|B0E8    |0D80D7;
 
          CODE_0D80EF: LDA.B #$F4                           ;0D80EF|A9F4    |      ;
                       STA.W $0200,X                        ;0D80F1|9D0002  |0D0200;
                       BNE CODE_0D80DA                      ;0D80F4|D0E4    |0D80DA;
 
          CODE_0D80F6: PLA                                  ;0D80F6|68      |      ;
                       PLA                                  ;0D80F7|68      |      ;
                       RTS                                  ;0D80F8|60      |      ;
 
 
          CODE_0D80F9: LDX.B wCollisionPointYinScreen-$D    ;0D80F9|A604    |000011;
 
          CODE_0D80FB: INY                                  ;0D80FB|C8      |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D80FC|B10A    |000017;
                       BPL CODE_0D815C                      ;0D80FE|105C    |0D815C;
                       SEC                                  ;0D8100|38      |      ;
 
          CODE_0D8101: ROR A                                ;0D8101|6A      |      ;
                       BCS CODE_0D815F                      ;0D8102|B05B    |0D815F;
                       ADC.B wDoubleCurrRoomIdx-$D          ;0D8104|6501    |00000E;
                       STA.W $0200,X                        ;0D8106|9D0002  |0D0200;
                       INY                                  ;0D8109|C8      |      ;
                       LDA.B wLoadCHRbeforeSwap             ;0D810A|A5B0    |0000BD;
                       BNE CODE_0D8155                      ;0D810C|D047    |0D8155;
 
          CODE_0D810E: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D810E|B10A    |000017;
 
          CODE_0D8110: STA.W $0201,X                        ;0D8110|9D0102  |0D0201;
                       INY                                  ;0D8113|C8      |      ;
                       LDA.B wDoubleCurrSection-$D          ;0D8114|A500    |00000D;
                       BEQ CODE_0D8120                      ;0D8116|F008    |0D8120;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8118|B10A    |000017;
                       AND.B #$FC                           ;0D811A|29FC    |      ;
                       ORA.B wDoubleCurrSection-$D          ;0D811C|0500    |00000D;
                       BNE CODE_0D8122                      ;0D811E|D002    |0D8122;
 
          CODE_0D8120: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8120|B10A    |000017;
 
          CODE_0D8122: EOR.B #$40                           ;0D8122|4940    |      ;
                       STA.B wCurrDrawnEntityCachedAttr     ;0D8124|8510    |00001D;
 
          CODE_0D8126: STA.W $0202,X                        ;0D8126|9D0202  |0D0202;
                       INY                                  ;0D8129|C8      |      ;
                       LDA.B #$F8                           ;0D812A|A9F8    |      ;
                       SEC                                  ;0D812C|38      |      ;
                       SBC.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D812D|F10A    |000017;
                       BMI CODE_0D8149                      ;0D812F|3018    |0D8149;
                       CLC                                  ;0D8131|18      |      ;
                       ADC.B wRoomSectionChrBanksDataOffset-$D;0D8132|6502    |00000F;
                       BCS CODE_0D814E                      ;0D8134|B018    |0D814E;
 
          CODE_0D8136: STA.W $0203,X                        ;0D8136|9D0302  |0D0203;
 
          CODE_0D8139: TXA                                  ;0D8139|8A      |      ;
                       CLC                                  ;0D813A|18      |      ;
                       ADC.B #$C4                           ;0D813B|69C4    |      ;
                       TAX                                  ;0D813D|AA      |      ;
                       DEC.B wCollisionPointAbsoluteXRoom-$D;0D813E|C607    |000014;
                       BEQ CODE_0D80F6                      ;0D8140|F0B4    |0D80F6;
                       DEC.B wCurrDrawnEntityCachedAttr-$D  ;0D8142|C603    |000010;
                       BNE CODE_0D80FB                      ;0D8144|D0B5    |0D80FB;
                       STX.B wCollisionPointYinScreen-$D    ;0D8146|8604    |000011;
                       RTS                                  ;0D8148|60      |      ;
 
 
          CODE_0D8149: CLC                                  ;0D8149|18      |      ;
                       ADC.B wRoomSectionChrBanksDataOffset-$D;0D814A|6502    |00000F;
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
                       ADC.B wDoubleCurrRoomIdx-$D          ;0D8160|6501    |00000E;
                       STA.W $0200,X                        ;0D8162|9D0002  |0D0200;
                       INY                                  ;0D8165|C8      |      ;
                       LDA.B wLoadCHRbeforeSwap             ;0D8166|A5B0    |0000BD;
                       BNE CODE_0D8174                      ;0D8168|D00A    |0D8174;
 
          CODE_0D816A: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D816A|B10A    |000017;
 
          CODE_0D816C: STA.W $0201,X                        ;0D816C|9D0102  |0D0201;
                       LDA.B wCurrDrawnEntityCachedAttr     ;0D816F|A510    |00001D;
                       JMP.W CODE_0D8126                    ;0D8171|4C2681  |0D8126;
 
 
          CODE_0D8174: JSR.W CODE_0D817B                    ;0D8174|207B81  |0D817B;
                       BCC CODE_0D816A                      ;0D8177|90F1    |0D816A;
                       BCS CODE_0D816C                      ;0D8179|B0F1    |0D816C;
 
          CODE_0D817B: LDA.B wRoomSectionChrBanksDataOffset ;0D817B|A50F    |00001C;
                       CMP.B #$16                           ;0D817D|C916    |      ;
                       BCC CODE_0D8187                      ;0D817F|9006    |0D8187;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8181|B10A    |000017;
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
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D81D2|B10A    |00000A;
                       STA.W $0201,X                        ;0D81D4|9D0102  |0D0201;
                       LDA.B wCurrDrawnEntityCachedAttr     ;0D81D7|A510    |000010;
                       JMP.W CODE_0D8222                    ;0D81D9|4C2282  |0D8222;
 
 
          CODE_0D81DC: LDY.W $048C,X                        ;0D81DC|BC8C04  |0D048C;
                       LDA.W mainSpriteAssem,Y              ;0D81DF|B93E82  |0D823E;
                       STA.B wCurrNumToVramQueue            ;0D81E2|8508    |000008;
                       LDA.W PTR16_0D823F,Y                 ;0D81E4|B93F82  |0D823F;
                       STA.B $09                            ;0D81E7|8509    |000009;
                       LDY.W $0400,X                        ;0D81E9|BC0004  |0D0400;
                       LDA.B (wCurrNumToVramQueue),Y        ;0D81EC|B108    |000008;
                       STA.B wCurrRoomSectionPlayerPosAndScreenAddr;0D81EE|850A    |00000A;
                       INY                                  ;0D81F0|C8      |      ;
                       LDA.B (wCurrNumToVramQueue),Y        ;0D81F1|B108    |000008;
                       STA.B $0B                            ;0D81F3|850B    |00000B;
                       LDY.B #$00                           ;0D81F5|A000    |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D81F7|B10A    |00000A;
                       STA.B $03                            ;0D81F9|8503    |000003;
                       LDX.B $04                            ;0D81FB|A604    |000004;
                       INY                                  ;0D81FD|C8      |      ;
 
          CODE_0D81FE: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D81FE|B10A    |00000A;
                       BPL CODE_0D81C8                      ;0D8200|10C6    |0D81C8;
                       SEC                                  ;0D8202|38      |      ;
 
          CODE_0D8203: ROR A                                ;0D8203|6A      |      ;
                       BCS CODE_0D81CB                      ;0D8204|B0C5    |0D81CB;
                       ADC.B $01                            ;0D8206|6501    |000001;
                       STA.W $0200,X                        ;0D8208|9D0002  |0D0200;
                       INY                                  ;0D820B|C8      |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D820C|B10A    |00000A;
                       STA.W $0201,X                        ;0D820E|9D0102  |0D0201;
                       INY                                  ;0D8211|C8      |      ;
                       LDA.B $00                            ;0D8212|A500    |000000;
                       BEQ CODE_0D821E                      ;0D8214|F008    |0D821E;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8216|B10A    |00000A;
                       AND.B #$FC                           ;0D8218|29FC    |      ;
                       ORA.B $00                            ;0D821A|0500    |000000;
                       BNE CODE_0D8220                      ;0D821C|D002    |0D8220;
 
          CODE_0D821E: LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D821E|B10A    |00000A;
 
          CODE_0D8220: STA.B wCurrDrawnEntityCachedAttr     ;0D8220|8510    |000010;
 
          CODE_0D8222: STA.W $0202,X                        ;0D8222|9D0202  |0D0202;
                       INY                                  ;0D8225|C8      |      ;
                       LDA.B (wCurrRoomSectionPlayerPosAndScreenAddr),Y;0D8226|B10A    |00000A;
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
 
player_spriteAssemb_00: db $02,$00,$E0,$02,$F8               ;0D83BE|        |      ;
                       db $00,$E0,$42,$00                   ;0D83C3|        |      ;
 
trevorSpriteAssemb_68: db $03,$00,$E2,$02,$F4               ;0D83C7|        |      ;
                       db $01,$E4,$FC,$01,$E6               ;0D83CC|        |      ;
                       db $04                               ;0D83D1|        |      ;
 
trevorSpriteAssemb_6A: db $04,$00,$E8,$02,$F0               ;0D83D2|        |      ;
                       db $01,$EA,$F8,$01,$EC               ;0D83D7|        |      ;
                       db $00,$01,$EE,$08                   ;0D83DC|        |      ;
 
trevorSpriteAssemb_6C: db $03,$00,$F0,$02,$F4               ;0D83E0|        |      ;
                       db $01,$F2,$FC,$01,$F4               ;0D83E5|        |      ;
                       db $04                               ;0D83EA|        |      ;
 
trevorSpriteAssemb_6E: db $04,$E0,$F6,$02,$F5               ;0D83EB|        |      ;
                       db $E1,$F8,$FD,$01,$FA               ;0D83F0|        |      ;
                       db $F8,$01,$FC,$00                   ;0D83F5|        |      ;
 
trevorSpriteAssemb_62: db $02,$F0,$5F,$01,$F8               ;0D83F9|        |      ;
                       db $F0,$5F,$41,$00                   ;0D83FE|        |      ;
 
trevorSpriteAssemb_02: db $04,$E0,$00,$00,$F8               ;0D8402|        |      ;
                       db $E1,$02,$00,$01,$04               ;0D8407|        |      ;
                       db $F8,$01,$06,$00                   ;0D840C|        |      ;
 
trevorSpriteAssemb_04: db $03,$E0,$08,$00,$F8               ;0D8410|        |      ;
                       db $E1,$0A,$00,$01,$0C               ;0D8415|        |      ;
                       db $FB                               ;0D841A|        |      ;
 
trevorSpriteAssemb_06: db $04,$E0,$0E,$00,$F8               ;0D841B|        |      ;
                       db $E1,$10,$00,$01,$12               ;0D8420|        |      ;
                       db $F8,$01,$14,$00                   ;0D8425|        |      ;
 
trevorSpriteAssemb_0A: db $04,$E0,$0E,$00,$F8               ;0D8429|        |      ;
                       db $E1,$10,$00,$01,$12               ;0D842E|        |      ;
                       db $F8,$01,$18,$00                   ;0D8433|        |      ;
 
trevorSpriteAssemb_0C: db $04,$E0,$0E,$00,$F8               ;0D8437|        |      ;
                       db $E1,$10,$00,$01,$16               ;0D843C|        |      ;
                       db $F8,$01,$14,$00                   ;0D8441|        |      ;
 
trevorSpriteAssemb_16: db $04,$E8,$00,$00,$F8               ;0D8445|        |      ;
                       db $E9,$02,$00,$09,$16               ;0D844A|        |      ;
                       db $F8,$09,$18,$00                   ;0D844F|        |      ;
 
trevorSpriteAssemb_0E: db $04,$F0,$00,$00,$F8               ;0D8453|        |      ;
                       db $F1,$02,$00,$11,$16               ;0D8458|        |      ;
                       db $F8,$11,$18,$00                   ;0D845D|        |      ;
 
trevorSpriteAssemb_18: db $04,$E0,$1A,$00,$F9               ;0D8461|        |      ;
                       db $E1,$1C,$01,$E1,$1E               ;0D8466|        |      ;
                       db $09,$01,$0C,$FF                   ;0D846B|        |      ;
 
trevorSpriteAssemb_1A: db $04,$E0,$20,$00,$F8               ;0D846F|        |      ;
                       db $E1,$22,$00,$01,$12               ;0D8474|        |      ;
                       db $F8,$01,$14,$00                   ;0D8479|        |      ;
 
trevorSpriteAssemb_1C: db $05,$E0,$24,$00,$F0               ;0D847D|        |      ;
                       db $E1,$26,$F8,$E1,$28               ;0D8482|        |      ;
                       db $00,$01,$04,$F8,$01               ;0D8487|        |      ;
                       db $06,$00                           ;0D848C|        |      ;
 
trevorSpriteAssemb_1E: db $05,$F0,$1A,$00,$F8               ;0D848E|        |      ;
                       db $F1,$1C,$00,$F1,$1E               ;0D8493|        |      ;
                       db $08,$11,$16,$F8,$11               ;0D8498|        |      ;
                       db $18,$00                           ;0D849D|        |      ;
 
trevorSpriteAssemb_20: db $04,$F0,$20,$00,$F8               ;0D849F|        |      ;
                       db $F1,$22,$00,$11,$16               ;0D84A4|        |      ;
                       db $F8,$11,$18,$00                   ;0D84A9|        |      ;
 
trevorSpriteAssemb_22: db $05,$F0,$24,$00,$F0               ;0D84AD|        |      ;
                       db $F1,$26,$F8,$F1,$28               ;0D84B2|        |      ;
                       db $00,$11,$16,$F8,$11               ;0D84B7|        |      ;
                       db $18,$00                           ;0D84BC|        |      ;
 
trevorSpriteAssemb_34: db $05,$E0,$1A,$00,$F8               ;0D84BE|        |      ;
                       db $E1,$1C,$00,$E1,$1E               ;0D84C3|        |      ;
                       db $08,$01,$12,$F8,$01               ;0D84C8|        |      ;
                       db $18,$00                           ;0D84CD|        |      ;
 
trevorSpriteAssemb_36: db $04,$E0,$20,$00,$F8               ;0D84CF|        |      ;
                       db $E1,$22,$00,$01,$12               ;0D84D4|        |      ;
                       db $F8,$01,$18,$00                   ;0D84D9|        |      ;
 
trevorSpriteAssemb_38: db $05,$E0,$24,$00,$F0               ;0D84DD|        |      ;
                       db $E1,$26,$F8,$E1,$28               ;0D84E2|        |      ;
                       db $00,$01,$12,$F8,$01               ;0D84E7|        |      ;
                       db $18,$00                           ;0D84EC|        |      ;
 
trevorSpriteAssemb_3A: db $05,$E0,$1A,$00,$F8               ;0D84EE|        |      ;
                       db $E1,$1C,$00,$E1,$1E               ;0D84F3|        |      ;
                       db $08,$01,$16,$F8,$01               ;0D84F8|        |      ;
                       db $14,$00                           ;0D84FD|        |      ;
 
trevorSpriteAssemb_3C: db $04,$E0,$20,$00,$F8               ;0D84FF|        |      ;
                       db $E1,$22,$00,$01,$16               ;0D8504|        |      ;
                       db $F8,$01,$14,$00                   ;0D8509|        |      ;
 
trevorSpriteAssemb_3E: db $05,$E0,$24,$00,$F0               ;0D850D|        |      ;
                       db $E1,$26,$F8,$E1,$28               ;0D8512|        |      ;
                       db $00,$01,$16,$F8,$01               ;0D8517|        |      ;
                       db $14,$00                           ;0D851C|        |      ;
 
trevorSpriteAssemb_10: db $04,$E0,$2A,$00,$FA               ;0D851E|        |      ;
                       db $E1,$2C,$02,$01,$2E               ;0D8523|        |      ;
                       db $F8,$01,$18,$00                   ;0D8528|        |      ;
 
trevorSpriteAssemb_12: db $04,$E0,$2A,$00,$F7               ;0D852C|        |      ;
                       db $E1,$2C,$FF,$01,$16               ;0D8531|        |      ;
                       db $F8,$01,$18,$00                   ;0D8536|        |      ;
 
trevorSpriteAssemb_14: db $04,$00,$30,$00,$E8               ;0D853A|        |      ;
                       db $01,$32,$F0,$01,$34               ;0D853F|        |      ;
                       db $F8,$01,$36,$00                   ;0D8544|        |      ;
 
trevorSpriteAssemb_24: db $02,$E0,$38,$01,$10               ;0D8548|        |      ;
                       db $01,$3A,$10                       ;0D854D|        |      ;
 
trevorSpriteAssemb_26: db $02,$E0,$3E,$01,$08               ;0D8550|        |      ;
                       db $E5,$40,$10                       ;0D8555|        |      ;
 
trevorSpriteAssemb_28: db $03,$F0,$42,$01,$D8               ;0D8558|        |      ;
                       db $F1,$44,$E0,$F1,$44               ;0D855D|        |      ;
                       db $E8                               ;0D8562|        |      ;
 
trevorSpriteAssemb_2A: db $02,$E0,$38,$01,$10               ;0D8563|        |      ;
                       db $01,$3C,$10                       ;0D8568|        |      ;
 
trevorSpriteAssemb_2C: db $02,$E0,$46,$00,$10               ;0D856B|        |      ;
                       db $01,$48,$10                       ;0D8570|        |      ;
 
trevorSpriteAssemb_2E: db $02,$E0,$4C,$00,$08               ;0D8573|        |      ;
                       db $E5,$4E,$10                       ;0D8578|        |      ;
 
trevorSpriteAssemb_30: db $03,$F0,$50,$00,$D8               ;0D857B|        |      ;
                       db $F1,$52,$E0,$F1,$52               ;0D8580|        |      ;
                       db $E8                               ;0D8585|        |      ;
 
trevorSpriteAssemb_32: db $05,$F0,$50,$00,$C8               ;0D8586|        |      ;
                       db $F1,$52,$D0,$F1,$52               ;0D858B|        |      ;
                       db $D8,$F1,$52,$E0,$F1               ;0D8590|        |      ;
                       db $52,$E8                           ;0D8595|        |      ;
 
trevorSpriteAssemb_40: db $02,$F0,$54,$01,$F8               ;0D8597|        |      ;
                       db $F0,$54,$41,$00                   ;0D859C|        |      ;
 
trevorSpriteAssemb_42: db $02,$F0,$56,$01,$F8               ;0D85A0|        |      ;
                       db $F1,$58,$00                       ;0D85A5|        |      ;
 
trevorSpriteAssemb_44: db $02,$F0,$58,$41,$F8               ;0D85A8|        |      ;
                       db $F1,$56,$00                       ;0D85AD|        |      ;
 
trevorSpriteAssemb_46: db $02,$F0,$78,$01,$F8               ;0D85B0|        |      ;
                       db $F1,$7A,$00                       ;0D85B5|        |      ;
 
trevorSpriteAssemb_48: db $02,$F0,$7A,$41,$F8               ;0D85B8|        |      ;
                       db $F1,$78,$00                       ;0D85BD|        |      ;
 
trevorSpriteAssemb_4A: db $02,$F0,$7A,$C1,$F8               ;0D85C0|        |      ;
                       db $F1,$78,$00                       ;0D85C5|        |      ;
 
trevorSpriteAssemb_4C: db $02,$F0,$78,$81,$F8               ;0D85C8|        |      ;
                       db $F1,$7A,$00                       ;0D85CD|        |      ;
 
trevorSpriteAssemb_4E: db $02,$F0,$7C,$81,$F8               ;0D85D0|        |      ;
                       db $F1,$7E,$00                       ;0D85D5|        |      ;
 
trevorSpriteAssemb_64: db $01,$F0,$62,$01,$FC               ;0D85D8|        |      ;
 
trevorSpriteAssemb_50: db $02,$F0,$66,$01,$F8               ;0D85DD|        |      ;
                       db $F1,$68,$00                       ;0D85E2|        |      ;
 
trevorSpriteAssemb_52: db $01,$F0,$5A,$01,$FC               ;0D85E5|        |      ;
 
trevorSpriteAssemb_54: db $02,$F0,$21,$01,$F8               ;0D85EA|        |      ;
                       db $F1,$23,$00                       ;0D85EF|        |      ;
 
trevorSpriteAssemb_5E: db $02,$F0,$15,$03,$F8               ;0D85F2|        |      ;
                       db $F0,$15,$43,$00                   ;0D85F7|        |      ;
 
trevorSpriteAssemb_60: db $02,$F0,$17,$03,$F8               ;0D85FB|        |      ;
                       db $F0,$17,$43,$00                   ;0D8600|        |      ;
 
sympha_SpriteAssemb_02: db $04,$E0,$00,$00,$F8               ;0D8604|        |      ;
                       db $E1,$02,$00,$01,$04               ;0D8609|        |      ;
                       db $F8,$01,$06,$00                   ;0D860E|        |      ;
 
sympha_SpriteAssemb_04: db $04,$E0,$08,$00,$F8               ;0D8612|        |      ;
                       db $E1,$0A,$00,$01,$0C               ;0D8617|        |      ;
                       db $F8,$01,$0E,$00                   ;0D861C|        |      ;
 
sympha_SpriteAssemb_06: db $04,$E0,$10,$00,$F8               ;0D8620|        |      ;
                       db $E1,$12,$00,$01,$14               ;0D8625|        |      ;
                       db $F8,$01,$16,$00                   ;0D862A|        |      ;
 
sympha_SpriteAssemb_0A: db $04,$E0,$10,$00,$F8               ;0D862E|        |      ;
                       db $E1,$12,$00,$01,$56               ;0D8633|        |      ;
                       db $F8,$01,$48,$00                   ;0D8638|        |      ;
 
sympha_SpriteAssemb_0C: db $04,$E0,$10,$00,$F8               ;0D863C|        |      ;
                       db $E1,$12,$00,$01,$46               ;0D8641|        |      ;
                       db $F8,$01,$52,$00                   ;0D8646|        |      ;
 
sympha_SpriteAssemb_16: db $04,$E8,$10,$00,$F8               ;0D864A|        |      ;
                       db $E9,$44,$00,$09,$46               ;0D864F|        |      ;
                       db $F8,$09,$48,$00                   ;0D8654|        |      ;
 
sympha_SpriteAssemb_0E: db $04,$F0,$10,$00,$F8               ;0D8658|        |      ;
                       db $F1,$44,$00,$11,$46               ;0D865D|        |      ;
                       db $F8,$11,$48,$00                   ;0D8662|        |      ;
 
sympha_SpriteAssemb_10: db $04,$E0,$5C,$00,$F7               ;0D8666|        |      ;
                       db $E1,$5E,$FF,$01,$46               ;0D866B|        |      ;
                       db $F8,$01,$48,$00                   ;0D8670|        |      ;
 
sympha_SpriteAssemb_12: db $04,$E0,$5C,$00,$F7               ;0D8674|        |      ;
                       db $E1,$5E,$FF,$01,$46               ;0D8679|        |      ;
                       db $F8,$01,$48,$00                   ;0D867E|        |      ;
 
sympha_SpriteAssemb_14: db $04,$F0,$60,$00,$E8               ;0D8682|        |      ;
                       db $F1,$62,$F0,$F1,$64               ;0D8687|        |      ;
                       db $F8,$F1,$66,$00                   ;0D868C|        |      ;
 
sympha_SpriteAssemb_18: db $04,$E0,$1E,$00,$F8               ;0D8690|        |      ;
                       db $E1,$0A,$00,$01,$0C               ;0D8695|        |      ;
                       db $F8,$01,$0E,$00                   ;0D869A|        |      ;
 
sympha_SpriteAssemb_1A: db $04,$E0,$20,$00,$F7               ;0D869E|        |      ;
                       db $E1,$12,$FF,$01,$22               ;0D86A3|        |      ;
                       db $F8,$01,$16,$00                   ;0D86A8|        |      ;
 
sympha_SpriteAssemb_1C: db $04,$F0,$4A,$00,$F9               ;0D86AC|        |      ;
                       db $F1,$12,$01,$11,$46               ;0D86B1|        |      ;
                       db $F8,$11,$48,$00                   ;0D86B6|        |      ;
 
sympha_SpriteAssemb_1E: db $04,$F0,$20,$00,$F7               ;0D86BA|        |      ;
                       db $F1,$12,$FF,$11,$46               ;0D86BF|        |      ;
                       db $F8,$11,$48,$00                   ;0D86C4|        |      ;
 
sympha_SpriteAssemb_24: db $04,$E0,$4A,$00,$F9               ;0D86C8|        |      ;
                       db $E1,$12,$01,$01,$56               ;0D86CD|        |      ;
                       db $F8,$01,$48,$00                   ;0D86D2|        |      ;
 
sympha_SpriteAssemb_26: db $04,$E0,$20,$00,$F7               ;0D86D6|        |      ;
                       db $E1,$12,$FF,$01,$56               ;0D86DB|        |      ;
                       db $F8,$01,$48,$00                   ;0D86E0|        |      ;
 
sympha_SpriteAssemb_28: db $04,$E0,$4A,$00,$F9               ;0D86E4|        |      ;
                       db $E1,$12,$01,$01,$46               ;0D86E9|        |      ;
                       db $F8,$01,$52,$00                   ;0D86EE|        |      ;
 
sympha_SpriteAssemb_2A: db $04,$E0,$20,$00,$F7               ;0D86F2|        |      ;
                       db $E1,$12,$FF,$01,$46               ;0D86F7|        |      ;
                       db $F8,$01,$52,$00                   ;0D86FC|        |      ;
 
sympha_SpriteAssemb_20: db $01,$D0,$18,$01,$F9               ;0D8700|        |      ;
 
sympha_SpriteAssemb_22: db $02,$E0,$1A,$01,$E7               ;0D8705|        |      ;
                       db $E5,$1C,$EF                       ;0D870A|        |      ;
 
sympha_SpriteAssemb_2E: db $04,$F0,$24,$00,$F8               ;0D870D|        |      ;
                       db $F1,$26,$00,$11,$46               ;0D8712|        |      ;
                       db $F8,$11,$4C,$00                   ;0D8717|        |      ;
 
sympha_SpriteAssemb_30: db $04,$E0,$24,$00,$F8               ;0D871B|        |      ;
                       db $E1,$26,$00,$01,$58               ;0D8720|        |      ;
                       db $F8,$01,$4C,$00                   ;0D8725|        |      ;
 
sympha_SpriteAssemb_32: db $04,$E0,$24,$00,$F8               ;0D8729|        |      ;
                       db $E1,$26,$00,$01,$46               ;0D872E|        |      ;
                       db $F8,$01,$54,$00                   ;0D8733|        |      ;
 
sympha_SpriteAssemb_2C: db $04,$E0,$24,$00,$F8               ;0D8737|        |      ;
                       db $E1,$26,$00,$01,$22               ;0D873C|        |      ;
                       db $F8,$01,$28,$00                   ;0D8741|        |      ;
 
sympha_SpriteAssemb_34: db $05,$F0,$2A,$00,$F0               ;0D8745|        |      ;
                       db $E1,$2C,$F8,$E1,$02               ;0D874A|        |      ;
                       db $00,$01,$2E,$F8,$01               ;0D874F|        |      ;
                       db $06,$00                           ;0D8754|        |      ;
 
sympha_SpriteAssemb_36: db $05,$F0,$2A,$00,$F0               ;0D8756|        |      ;
                       db $E1,$2C,$F8,$E1,$02               ;0D875B|        |      ;
                       db $00,$01,$4E,$F8,$01               ;0D8760|        |      ;
                       db $50,$00                           ;0D8765|        |      ;
 
sympha_SpriteAssemb_38: db $05,$F0,$2A,$00,$F0               ;0D8767|        |      ;
                       db $E1,$2C,$F8,$E1,$12               ;0D876C|        |      ;
                       db $00,$01,$5A,$F8,$01               ;0D8771|        |      ;
                       db $50,$00                           ;0D8776|        |      ;
 
sympha_SpriteAssemb_3A: db $05,$F0,$2A,$00,$F0               ;0D8778|        |      ;
                       db $E1,$2C,$F8,$E1,$12               ;0D877D|        |      ;
                       db $00,$01,$4E,$F8,$01               ;0D8782|        |      ;
                       db $06,$00                           ;0D8787|        |      ;
 
sympha_SpriteAssemb_3C: db $01,$F0,$30,$00,$FC               ;0D8789|        |      ;
 
sympha_SpriteAssemb_3E: db $03,$F0,$32,$03,$F4               ;0D878E|        |      ;
                       db $F1,$34,$FC,$F1,$36               ;0D8793|        |      ;
                       db $04                               ;0D8798|        |      ;
 
sympha_SpriteAssemb_40: db $05,$F0,$32,$03,$EC               ;0D8799|        |      ;
                       db $F1,$3A,$F4,$F1,$3A               ;0D879E|        |      ;
                       db $FC,$F1,$3A,$04,$F1               ;0D87A3|        |      ;
                       db $36,$0C                           ;0D87A8|        |      ;
 
sympha_SpriteAssemb_42: db $04,$F0,$38,$03,$F0               ;0D87AA|        |      ;
                       db $F1,$3A,$F8,$F1,$3A               ;0D87AF|        |      ;
                       db $00,$F1,$36,$08                   ;0D87B4|        |      ;
 
sympha_SpriteAssemb_44: db $02,$F0,$3C,$03,$F8               ;0D87B8|        |      ;
                       db $F1,$3E,$00                       ;0D87BD|        |      ;
 
sympha_SpriteAssemb_56: db $02,$F0,$40,$03,$F8               ;0D87C0|        |      ;
                       db $F1,$42,$00                       ;0D87C5|        |      ;
 
sympha_SpriteAssemb_46: db $01,$F0,$6E,$00,$FC               ;0D87C8|        |      ;
 
sympha_SpriteAssemb_48: db $02,$F0,$68,$00,$F8               ;0D87CD|        |      ;
                       db $F0,$68,$C0,$00                   ;0D87D2|        |      ;
 
sympha_SpriteAssemb_4A: db $02,$F0,$6A,$00,$F8               ;0D87D6|        |      ;
                       db $F0,$6A,$C0,$00                   ;0D87DB|        |      ;
 
sympha_SpriteAssemb_4C: db $02,$F0,$6C,$00,$F8               ;0D87DF|        |      ;
                       db $F0,$6C,$C0,$00                   ;0D87E4|        |      ;
 
sympha_SpriteAssemb_4E: db $02,$F0,$70,$00,$F8               ;0D87E8|        |      ;
                       db $F0,$70,$40,$00                   ;0D87ED|        |      ;
 
sympha_SpriteAssemb_50: db $02,$F0,$72,$00,$F8               ;0D87F1|        |      ;
                       db $F0,$72,$40,$00                   ;0D87F6|        |      ;
 
sympha_SpriteAssemb_52: db $02,$F0,$B1,$00,$F8               ;0D87FA|        |      ;
                       db $F1,$B3,$00                       ;0D87FF|        |      ;
 
sympha_SpriteAssemb_54: db $02,$F0,$B5,$00,$F8               ;0D8802|        |      ;
                       db $F1,$B7,$00                       ;0D8807|        |      ;
 
grant_spriteAssemb_00: db $04,$E0,$00,$00,$F4               ;0D880A|        |      ;
                       db $E1,$02,$FC,$01,$04               ;0D880F|        |      ;
                       db $F8,$01,$06,$00                   ;0D8814|        |      ;
 
grant_spriteAssemb_04: db $04,$E0,$08,$00,$F5               ;0D8818|        |      ;
                       db $E1,$0A,$FD,$01,$0C               ;0D881D|        |      ;
                       db $F8,$01,$0E,$00                   ;0D8822|        |      ;
 
grant_spriteAssemb_48: db $04,$D8,$08,$00,$F5               ;0D8826|        |      ;
                       db $D9,$0A,$FD,$F9,$0C               ;0D882B|        |      ;
                       db $F8,$F9,$0E,$00                   ;0D8830|        |      ;
 
grant_spriteAssemb_06: db $04,$E0,$10,$00,$F4               ;0D8834|        |      ;
                       db $E1,$12,$FC,$01,$14               ;0D8839|        |      ;
                       db $F8,$01,$16,$00                   ;0D883E|        |      ;
 
grant_spriteAssemb_0A: db $04,$D8,$00,$00,$F8               ;0D8842|        |      ;
                       db $D9,$02,$00,$F9,$2A               ;0D8847|        |      ;
                       db $F8,$F9,$2C,$00                   ;0D884C|        |      ;
 
grant_spriteAssemb_0C: db $04,$D8,$00,$00,$F6               ;0D8850|        |      ;
                       db $D9,$02,$FE,$F9,$26               ;0D8855|        |      ;
                       db $F8,$F9,$28,$00                   ;0D885A|        |      ;
 
grant_spriteAssemb_16: db $04,$E0,$00,$00,$F6               ;0D885E|        |      ;
                       db $E1,$02,$FE,$01,$6C               ;0D8863|        |      ;
                       db $F8,$01,$6E,$00                   ;0D8868|        |      ;
 
grant_spriteAssemb_0E: db $02,$F8,$40,$80,$F8               ;0D886C|        |      ;
                       db $F9,$42,$00                       ;0D8871|        |      ;
 
grant_spriteAssemb_10: db $04,$E2,$64,$00,$F8               ;0D8874|        |      ;
                       db $E3,$02,$00,$01,$2A               ;0D8879|        |      ;
                       db $F8,$01,$2C,$00                   ;0D887E|        |      ;
 
grant_spriteAssemb_12: db $02,$F0,$40,$80,$F8               ;0D8882|        |      ;
                       db $F1,$42,$00                       ;0D8887|        |      ;
 
grant_spriteAssemb_14: db $03,$F0,$66,$00,$F0               ;0D888A|        |      ;
                       db $F1,$68,$F8,$F1,$6A               ;0D888F|        |      ;
                       db $00                               ;0D8894|        |      ;
 
grant_spriteAssemb_18: db $02,$F0,$2E,$00,$F8               ;0D8895|        |      ;
                       db $F1,$30,$00                       ;0D889A|        |      ;
 
grant_spriteAssemb_1A: db $04,$F0,$32,$00,$F8               ;0D889D|        |      ;
                       db $F1,$34,$00,$11,$36               ;0D88A2|        |      ;
                       db $F8,$11,$38,$00                   ;0D88A7|        |      ;
 
grant_spriteAssemb_1C: db $03,$F0,$3A,$00,$F8               ;0D88AB|        |      ;
                       db $F1,$3C,$00,$F1,$3E               ;0D88B0|        |      ;
                       db $08                               ;0D88B5|        |      ;
 
grant_spriteAssemb_1E: db $02,$F0,$40,$00,$F8               ;0D88B6|        |      ;
                       db $F1,$42,$00                       ;0D88BB|        |      ;
 
grant_spriteAssemb_20: db $03,$F0,$44,$00,$F0               ;0D88BE|        |      ;
                       db $F1,$46,$F8,$F1,$48               ;0D88C3|        |      ;
                       db $00                               ;0D88C8|        |      ;
 
grant_spriteAssemb_22: db $03,$F0,$4A,$00,$F8               ;0D88C9|        |      ;
                       db $F1,$4E,$00,$11,$4C               ;0D88CE|        |      ;
                       db $F8                               ;0D88D3|        |      ;
 
grant_spriteAssemb_24: db $04,$E0,$18,$00,$F9               ;0D88D4|        |      ;
                       db $E1,$1A,$01,$01,$14               ;0D88D9|        |      ;
                       db $F8,$01,$16,$00                   ;0D88DE|        |      ;
 
grant_spriteAssemb_26: db $05,$E0,$1C,$00,$EE               ;0D88E2|        |      ;
                       db $E1,$1E,$F6,$E1,$20               ;0D88E7|        |      ;
                       db $FE,$01,$0C,$F8,$01               ;0D88EC|        |      ;
                       db $0E,$00                           ;0D88F1|        |      ;
 
grant_spriteAssemb_2A: db $04,$DA,$18,$00,$FB               ;0D88F3|        |      ;
                       db $DB,$1A,$03,$F9,$2A               ;0D88F8|        |      ;
 
                       db $F8,$F9,$2C,$00                   ;0D88FD|        |      ;
 
grant_spriteAssemb_2C: db $05,$DA,$1C,$00,$EF               ;0D8901|        |      ;
                       db $DB,$1E,$F7,$DB,$20               ;0D8906|        |      ;
 
                       db $FF,$F9,$2A,$F8,$F9               ;0D890B|        |      ;
                       db $2C,$00                           ;0D8910|        |      ;
 
grant_spriteAssemb_2E: db $04,$DA,$18,$00,$F9               ;0D8912|        |      ;
                       db $DB,$1A,$01,$F9,$26               ;0D8917|        |      ;
 
                       db $F8,$F9,$28,$00                   ;0D891C|        |      ;
 
grant_spriteAssemb_30: db $05,$DA,$1C,$00,$EE               ;0D8920|        |      ;
                       db $DB,$1E,$F6,$DB,$20               ;0D8925|        |      ;
 
                       db $FE,$F9,$26,$F8,$F9               ;0D892A|        |      ;
                       db $28,$00                           ;0D892F|        |      ;
 
grant_spriteAssemb_32: db $04,$E8,$18,$00,$FC               ;0D8931|        |      ;
                       db $E9,$1A,$04,$09,$22               ;0D8936|        |      ;
                       db $F8,$09,$24,$00                   ;0D893B|        |      ;
 
grant_spriteAssemb_34: db $05,$E8,$1C,$00,$EE               ;0D893F|        |      ;
                       db $E9,$1E,$F6,$E9,$20               ;0D8944|        |      ;
                       db $FE,$09,$22,$F8,$09               ;0D8949|        |      ;
                       db $24,$00                           ;0D894E|        |      ;
 
grant_spriteAssemb_36: db $02,$F0,$2E,$80,$F8               ;0D8950|        |      ;
                       db $F1,$30,$00                       ;0D8955|        |      ;
 
grant_spriteAssemb_38: db $04,$D0,$36,$80,$F8               ;0D8958|        |      ;
                       db $D1,$38,$00,$F1,$32               ;0D895D|        |      ;
                       db $F8,$F1,$34,$00                   ;0D8962|        |      ;
 
grant_spriteAssemb_3A: db $03,$F0,$3A,$80,$F8               ;0D8966|        |      ;
                       db $F1,$3C,$00,$F1,$3E               ;0D896B|        |      ;
                       db $08                               ;0D8970|        |      ;
 
grant_spriteAssemb_3C: db $03,$E0,$50,$00,$F8               ;0D8971|        |      ;
                       db $01,$52,$F8,$01,$54               ;0D8976|        |      ;
                       db $00                               ;0D897B|        |      ;
 
grant_spriteAssemb_3E: db $03,$E0,$52,$80,$F8               ;0D897C|        |      ;
                       db $E1,$54,$00,$01,$50               ;0D8981|        |      ;
                       db $F8                               ;0D8986|        |      ;
 
grant_spriteAssemb_40: db $03,$E0,$56,$00,$F8               ;0D8987|        |      ;
                       db $F1,$58,$00,$F1,$5A               ;0D898C|        |      ;
                       db $08                               ;0D8991|        |      ;
 
grant_spriteAssemb_42: db $03,$F0,$58,$80,$00               ;0D8992|        |      ;
                       db $F1,$5A,$08,$01,$56               ;0D8997|        |      ;
                       db $F8                               ;0D899C|        |      ;
 
grant_spriteAssemb_28: db $04,$E0,$5C,$00,$F8               ;0D899D|        |      ;
                       db $E1,$5E,$00,$01,$14               ;0D89A2|        |      ;
                       db $F8,$01,$16,$00                   ;0D89A7|        |      ;
 
grant_spriteAssemb_44: db $06,$E4,$60,$01,$E4               ;0D89AB|        |      ;
                       db $E0,$1C,$00,$EC,$E1               ;0D89B0|        |      ;
                       db $1E,$F4,$E1,$20,$FC               ;0D89B5|        |      ;
                       db $01,$14,$F8,$01,$16               ;0D89BA|        |      ;
                       db $00                               ;0D89BF|        |      ;
 
grant_spriteAssemb_46: db $04,$E8,$5C,$00,$FC               ;0D89C0|        |      ;
                       db $E9,$5E,$04,$09,$22               ;0D89C5|        |      ;
                       db $F8,$09,$24,$00                   ;0D89CA|        |      ;
 
grant_spriteAssemb_4A: db $06,$EE,$60,$01,$E6               ;0D89CE|        |      ;
                       db $EA,$1C,$00,$EE,$EB               ;0D89D3|        |      ;
                       db $1E,$F6,$EB,$20,$FE               ;0D89D8|        |      ;
                       db $09,$22,$F8,$09,$24               ;0D89DD|        |      ;
                       db $00                               ;0D89E2|        |      ;
 
grant_spriteAssemb_4C: db $04,$D8,$5C,$00,$FA               ;0D89E3|        |      ;
                       db $D9,$5E,$02,$F9,$26               ;0D89E8|        |      ;
                       db $F8,$F9,$28,$00                   ;0D89ED|        |      ;
 
grant_spriteAssemb_4E: db $06,$DC,$60,$01,$E6               ;0D89F1|        |      ;
                       db $D8,$1C,$00,$EE,$D9               ;0D89F6|        |      ;
                       db $1E,$F6,$D9,$20,$FE               ;0D89FB|        |      ;
                       db $F9,$26,$F8,$F9,$28               ;0D8A00|        |      ;
                       db $00                               ;0D8A05|        |      ;
 
grant_spriteAssemb_50: db $04,$D8,$5C,$00,$FA               ;0D8A06|        |      ;
                       db $D9,$5E,$02,$F9,$2A               ;0D8A0B|        |      ;
                       db $F8,$F9,$2C,$00                   ;0D8A10|        |      ;
 
grant_spriteAssemb_52: db $06,$DC,$60,$01,$E6               ;0D8A14|        |      ;
                       db $D8,$1C,$00,$EE,$D9               ;0D8A19|        |      ;
                       db $1E,$F6,$D9,$20,$FE               ;0D8A1E|        |      ;
                       db $F9,$2A,$F8,$F9,$2C               ;0D8A23|        |      ;
                       db $00                               ;0D8A28|        |      ;
 
alucard_spriteAssemb_01: db $05,$C0,$00,$00,$FC               ;0D8A29|        |      ;
                       db $E1,$02,$F8,$E1,$04               ;0D8A2E|        |      ;
                       db $00,$01,$06,$F9,$01               ;0D8A33|        |      ;
                       db $08,$01                           ;0D8A38|        |      ;
 
alucard_spriteAssemb_04: db $05,$C0,$0A,$00,$FC               ;0D8A3A|        |      ;
                       db $E1,$0C,$F8,$E1,$0E               ;0D8A3F|        |      ;
                       db $00,$01,$10,$F8,$01               ;0D8A44|        |      ;
                       db $12,$00                           ;0D8A49|        |      ;
 
alucard_spriteAssemb_06: db $05,$C0,$00,$00,$FC               ;0D8A4B|        |      ;
                       db $E1,$14,$F8,$E1,$16               ;0D8A50|        |      ;
                       db $00,$01,$18,$F9,$01               ;0D8A55|        |      ;
                       db $1A,$01                           ;0D8A5A|        |      ;
 
alucard_spriteAssemb_0A: db $05,$C0,$00,$00,$FC               ;0D8A5C|        |      ;
                       db $E1,$02,$F8,$E1,$04               ;0D8A61|        |      ;
                       db $00,$01,$06,$F9,$01               ;0D8A66|        |      ;
                       db $1C,$01                           ;0D8A6B|        |      ;
 
alucard_spriteAssemb_0C: db $05,$C0,$00,$00,$FC               ;0D8A6D|        |      ;
                       db $E1,$14,$F8,$E1,$16               ;0D8A72|        |      ;
                       db $00,$01,$1E,$F9,$01               ;0D8A77|        |      ;
                       db $1A,$01                           ;0D8A7C|        |      ;
 
alucard_spriteAssemb_18: db $05,$C0,$00,$00,$FB               ;0D8A7E|        |      ;
                       db $E1,$20,$F4,$E1,$22               ;0D8A83|        |      ;
                       db $FC,$01,$24,$F8,$01               ;0D8A88|        |      ;
                       db $26,$00                           ;0D8A8D|        |      ;
 
alucard_spriteAssemb_1A: db $08,$C0,$00,$00,$FC               ;0D8A8F|        |      ;
                       db $E1,$02,$F8,$E1,$28               ;0D8A94|        |      ;
                       db $00,$E1,$2A,$08,$01               ;0D8A99|        |      ;
                       db $06,$F9,$01,$2C,$00               ;0D8A9E|        |      ;
                       db $01,$2E,$08,$EB,$30               ;0D8AA3|        |      ;
                       db $10                               ;0D8AA8|        |      ;
 
alucard_spriteAssemb_1C: db $07,$C0,$00,$00,$FC               ;0D8AA9|        |      ;
                       db $E1,$02,$F8,$E1,$32               ;0D8AAE|        |      ;
                       db $00,$E1,$34,$08,$01               ;0D8AB3|        |      ;
                       db $06,$F9,$01,$2C,$00               ;0D8AB8|        |      ;
                       db $01,$2E,$08                       ;0D8ABD|        |      ;
 
alucard_spriteAssemb_16: db $04,$E8,$38,$00,$F8               ;0D8AC0|        |      ;
                       db $E9,$3A,$00,$09,$3C               ;0D8AC5|        |      ;
                       db $F8,$09,$3E,$00                   ;0D8ACA|        |      ;
 
alucard_spriteAssemb_0E: db $04,$F0,$38,$00,$F8               ;0D8ACE|        |      ;
                       db $F1,$3A,$00,$11,$3C               ;0D8AD3|        |      ;
                       db $F8,$11,$3E,$00                   ;0D8AD8|        |      ;
 
alucard_spriteAssemb_1E: db $04,$F0,$40,$00,$F8               ;0D8ADC|        |      ;
                       db $F1,$42,$00,$11,$44               ;0D8AE1|        |      ;
                       db $F8,$11,$46,$00                   ;0D8AE6|        |      ;
 
alucard_spriteAssemb_20: db $07,$F0,$38,$00,$F8               ;0D8AEA|        |      ;
                       db $F1,$48,$00,$F1,$2A               ;0D8AEF|        |      ;
                       db $08,$11,$3C,$F8,$11               ;0D8AF4|        |      ;
                       db $4A,$00,$11,$2E,$08               ;0D8AF9|        |      ;
                       db $F9,$30,$10                       ;0D8AFE|        |      ;
 
alucard_spriteAssemb_22: db $06,$F0,$38,$00,$F8               ;0D8B01|        |      ;
                       db $F1,$48,$00,$F1,$34               ;0D8B06|        |      ;
                       db $08,$11,$3C,$F8,$11               ;0D8B0B|        |      ;
                       db $4A,$00,$11,$36,$08               ;0D8B10|        |      ;
 
alucard_spriteAssemb_10: db $04,$E0,$4C,$00,$FB               ;0D8B15|        |      ;
                       db $E1,$4E,$03,$01,$50               ;0D8B1A|        |      ;
                       db $F8,$01,$52,$00                   ;0D8B1F|        |      ;
 
alucard_spriteAssemb_12: db $04,$E0,$4C,$00,$F8               ;0D8B23|        |      ;
                       db $E1,$4E,$00,$01,$36               ;0D8B28|        |      ;
                       db $F8,$01,$3E,$00                   ;0D8B2D|        |      ;
 
alucard_spriteAssemb_14: db $04,$00,$54,$00,$E8               ;0D8B31|        |      ;
                       db $01,$56,$F0,$01,$58               ;0D8B36|        |      ;
                       db $F8,$01,$5A,$00                   ;0D8B3B|        |      ;
 
alucard_spriteAssemb_24: db $02,$F0,$60,$00,$F8               ;0D8B3F|        |      ;
                       db $F1,$62,$00                       ;0D8B44|        |      ;
 
alucard_spriteAssemb_26: db $02,$F6,$64,$00,$F8               ;0D8B47|        |      ;
                       db $F7,$66,$00                       ;0D8B4C|        |      ;
 
alucard_spriteAssemb_28: db $02,$FC,$68,$00,$F8               ;0D8B4F|        |      ;
                       db $FD,$6A,$00                       ;0D8B54|        |      ;
 
alucard_spriteAssemb_2A: db $06,$F0,$38,$00,$F8               ;0D8B57|        |      ;
                       db $F1,$48,$00,$F1,$34               ;0D8B5C|        |      ;
                       db $08,$11,$3C,$F8,$11               ;0D8B61|        |      ;
                       db $4A,$00,$11,$36,$08               ;0D8B66|        |      ;
 
alucard_spriteAssemb_2C: db $07,$F0,$38,$00,$F8               ;0D8B6B|        |      ;
                       db $F1,$48,$00,$F1,$2A               ;0D8B70|        |      ;
                       db $08,$11,$3C,$F8,$11               ;0D8B75|        |      ;
                       db $4A,$00,$11,$2E,$08               ;0D8B7A|        |      ;
                       db $F9,$30,$10                       ;0D8B7F|        |      ;
 
alucard_spriteAssemb_2E: db $04,$F0,$40,$00,$F8               ;0D8B82|        |      ;
                       db $F1,$42,$00,$11,$44               ;0D8B87|        |      ;
                       db $F8,$11,$46,$00                   ;0D8B8C|        |      ;
 
alucard_spriteAssemb_30: db $04,$00,$6C,$01,$F8               ;0D8B90|        |      ;
                       db $01,$6E,$00,$F1,$40               ;0D8B95|        |      ;
                       db $F8,$F1,$42,$00                   ;0D8B9A|        |      ;
 
alucard_spriteAssemb_32: db $08,$E0,$72,$01,$F8               ;0D8B9E|        |      ;
                       db $E1,$76,$00,$01,$74               ;0D8BA3|        |      ;
                       db $F8,$01,$78,$00,$E1               ;0D8BA8|        |      ;
                       db $70,$F0,$F0,$40,$00               ;0D8BAD|        |      ;
                       db $F8,$F1,$42,$00,$E8               ;0D8BB2|        |      ;
                       db $70,$41,$08                       ;0D8BB7|        |      ;
 
alucard_spriteAssemb_34: db $08,$F0,$7A,$01,$F0               ;0D8BBA|        |      ;
                       db $F1,$7C,$F8,$11,$7E               ;0D8BBF|        |      ;
                       db $F5,$00,$60,$00,$F8               ;0D8BC4|        |      ;
                       db $01,$62,$00,$F0,$7C               ;0D8BC9|        |      ;
                       db $41,$00,$F1,$7A,$08               ;0D8BCE|        |      ;
                       db $11,$7E,$03                       ;0D8BD3|        |      ;
 
alucard_spriteAssemb_40: db $01,$F0,$5C,$03,$FC               ;0D8BD6|        |      ;
 
alucard_spriteAssemb_42: db $01,$F0,$5C,$01,$FC               ;0D8BDB|        |      ;
 
alucard_spriteAssemb_44: db $02,$F0,$5E,$01,$FC               ;0D8BE0|        |      ;
                       db $F0,$5E,$41,$00                   ;0D8BE5|        |      ;
 
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
 
enemy_spriteAssemb_FE: db $07,$F0,$71,$01,$E4               ;0D8D67|        |      ;
                       db $E1,$73,$EC,$E1,$75               ;0D8D6C|        |      ;
                       db $F4,$E1,$77,$FC,$E1               ;0D8D71|        |      ;
                       db $79,$04,$01,$7B,$FC               ;0D8D76|        |      ;
                       db $01,$7D,$04                       ;0D8D7B|        |      ;
 
    sprAssembZombie00: db $04,$E0,$80,$02,$F4               ;0D8D7E|        |      ;
                       db $E1,$82,$FC,$01,$88               ;0D8D83|        |      ;
                       db $F8,$01,$8A,$00                   ;0D8D88|        |      ;
 
    sprAssembZombie04: db $04,$E2,$80,$02,$F5               ;0D8D8C|        |      ;
                       db $E3,$82,$FD,$01,$84               ;0D8D91|        |      ;
                       db $F8,$01,$86,$00                   ;0D8D96|        |      ;
 
sprAssembZombieAppear06: db $02,$00,$90,$02,$F8               ;0D8D9A|        |      ;
                       db $00,$90,$42,$00                   ;0D8D9F|        |      ;
 
sprAssembZombieAppear08: db $02,$00,$8C,$02,$F8               ;0D8DA3|        |      ;
                       db $01,$8E,$00                       ;0D8DA8|        |      ;
 
         DATA8_0D8DAB: db $04,$E0,$92,$02,$FD               ;0D8DAB|        |      ;
                       db $E1,$94,$05,$01,$96               ;0D8DB0|        |      ;
                       db $F8,$01,$98,$00                   ;0D8DB5|        |      ;
 
      sprAssembBird0c: db $02,$00,$9A,$02,$F8               ;0D8DB9|        |      ;
                       db $01,$9C,$00                       ;0D8DBE|        |      ;
 
      sprAssembBird10: db $04,$E2,$9E,$02,$F8               ;0D8DC1|        |      ;
                       db $E3,$A0,$00,$03,$A2               ;0D8DC6|        |      ;
                       db $F8,$03,$A4,$00                   ;0D8DCB|        |      ;
 
   sprAssembBirdSit12: db $02,$00,$A6,$02,$F8               ;0D8DCF|        |      ;
                       db $01,$A8,$00                       ;0D8DD4|        |      ;
 
enemy_09_spriteAssemb_64: db $04,$E0,$D2,$02,$FD               ;0D8DD7|        |      ;
                       db $E1,$D4,$05,$01,$D6               ;0D8DDC|        |      ;
                       db $F8,$01,$D8,$00                   ;0D8DE1|        |      ;
 
enemy_09_spriteAssemb_66: db $02,$00,$DA,$02,$F8               ;0D8DE5|        |      ;
                       db $01,$DC,$00                       ;0D8DEA|        |      ;
 
enemy_09_spriteAssemb_68: db $04,$E2,$DE,$02,$F8               ;0D8DED|        |      ;
                       db $E3,$E0,$00,$03,$E2               ;0D8DF2|        |      ;
                       db $F8,$03,$E4,$00                   ;0D8DF7|        |      ;
 
enemy_09_spriteAssemb_6C: db $02,$00,$E6,$02,$F8               ;0D8DFB|        |      ;
                       db $01,$E8,$00                       ;0D8E00|        |      ;
 
enemy_spriteAssemb_14: db $01,$F0,$BE,$01,$FC               ;0D8E03|        |      ;
 
enemy_spriteAssemb_16: db $01,$F0,$B4,$01,$FC               ;0D8E08|        |      ;
 
enemy_spriteAssemb_18: db $02,$F0,$B0,$01,$F8               ;0D8E0D|        |      ;
                       db $F1,$B2,$00                       ;0D8E12|        |      ;
 
enemy_spriteAssemb_1A: db $02,$F0,$AA,$01,$F8               ;0D8E15|        |      ;
                       db $F1,$AC,$00                       ;0D8E1A|        |      ;
 
enemy_spriteAssemb_1C: db $02,$F0,$AA,$01,$F8               ;0D8E1D|        |      ;
                       db $F1,$AE,$00                       ;0D8E22|        |      ;
 
enemy_spriteAssemb_1E: db $02,$F0,$CC,$03,$F8               ;0D8E25|        |      ;
                       db $F0,$CC,$43,$00                   ;0D8E2A|        |      ;
 
enemy_spriteAssemb_20: db $02,$E8,$C0,$03,$F8               ;0D8E2E|        |      ;
                       db $E9,$C2,$00                       ;0D8E33|        |      ;
 
enemy_spriteAssemb_22: db $02,$F0,$C4,$03,$F8               ;0D8E36|        |      ;
                       db $F1,$C6,$00                       ;0D8E3B|        |      ;
 
enemy_spriteAssemb_24: db $02,$F8,$C8,$03,$F8               ;0D8E3E|        |      ;
                       db $F9,$CA,$00                       ;0D8E43|        |      ;
 
enemy_spriteAssemb_CE: db $02,$F0,$DE,$03,$F8               ;0D8E46|        |      ;
                       db $F1,$DE,$00                       ;0D8E4B|        |      ;
 
enemy_spriteAssemb_D0: db $02,$F0,$D2,$03,$F8               ;0D8E4E|        |      ;
                       db $F1,$D4,$00                       ;0D8E53|        |      ;
 
enemy_spriteAssemb_D2: db $02,$F0,$D6,$03,$F8               ;0D8E56|        |      ;
                       db $F1,$D8,$00                       ;0D8E5B|        |      ;
 
enemy_spriteAssemb_D4: db $02,$F0,$DA,$03,$F8               ;0D8E5E|        |      ;
                       db $F1,$DC,$00                       ;0D8E63|        |      ;
 
enemy_spriteAssemb_28: db $02,$F0,$EA,$01,$F8               ;0D8E66|        |      ;
                       db $F1,$EC,$00                       ;0D8E6B|        |      ;
 
enemy_spriteAssemb_2A: db $02,$F0,$EE,$01,$F8               ;0D8E6E|        |      ;
                       db $F1,$F0,$00                       ;0D8E73|        |      ;
 
enemy_09_spriteAssemb_76: db $02,$F0,$8A,$01,$F8               ;0D8E76|        |      ;
                       db $F1,$8C,$00                       ;0D8E7B|        |      ;
 
enemy_09_spriteAssemb_78: db $02,$F0,$8E,$01,$F8               ;0D8E7E|        |      ;
                       db $F1,$AE,$00                       ;0D8E83|        |      ;
 
enemy_spriteAssemb_7E: db $02,$F0,$59,$01,$F8               ;0D8E86|        |      ;
                       db $F1,$5B,$00                       ;0D8E8B|        |      ;
 
enemy_spriteAssemb_80: db $02,$F0,$5D,$01,$F8               ;0D8E8E|        |      ;
                       db $F1,$5F,$00                       ;0D8E93|        |      ;
 
enemy_spriteAssemb_2C: db $05,$F0,$D6,$01,$F0               ;0D8E96|        |      ;
                       db $E1,$D8,$F8,$E1,$DA               ;0D8E9B|        |      ;
                       db $00,$01,$DC,$F8,$01               ;0D8EA0|        |      ;
                       db $DE,$00                           ;0D8EA5|        |      ;
 
enemy_spriteAssemb_2E: db $05,$F0,$D6,$01,$EF               ;0D8EA7|        |      ;
                       db $E1,$D8,$F7,$E1,$DA               ;0D8EAC|        |      ;
                       db $FF,$01,$E0,$F8,$01               ;0D8EB1|        |      ;
                       db $E2,$00                           ;0D8EB6|        |      ;
 
enemy_spriteAssemb_30: db $08,$F0,$D6,$01,$F0               ;0D8EB8|        |      ;
                       db $E1,$D8,$F8,$E1,$E8               ;0D8EBD|        |      ;
                       db $00,$E1,$EE,$08,$01               ;0D8EC2|        |      ;
                       db $E4,$F8,$01,$E6,$00               ;0D8EC7|        |      ;
                       db $C8,$EC,$41,$06,$C9               ;0D8ECC|        |      ;
                       db $EA,$0E                           ;0D8ED1|        |      ;
 
enemy_spriteAssemb_32: db $06,$E0,$F0,$01,$ED               ;0D8ED3|        |      ;
                       db $E1,$F2,$F4,$E1,$F4               ;0D8ED8|        |      ;
                       db $FD,$01,$F6,$F0,$01               ;0D8EDD|        |      ;
                       db $F8,$F8,$01,$E6,$00               ;0D8EE2|        |      ;
 
enemy_spriteAssemb_52: db $09,$F0,$D4,$01,$F0               ;0D8EE7|        |      ;
                       db $F1,$D8,$F8,$F1,$E8               ;0D8EEC|        |      ;
                       db $00,$F1,$EE,$08,$11               ;0D8EF1|        |      ;
                       db $CE,$F2,$11,$D0,$FA               ;0D8EF6|        |      ;
                       db $11,$D2,$03,$D6,$EC               ;0D8EFB|        |      ;
                       db $41,$06,$D7,$EA,$0E               ;0D8F00|        |      ;
 
enemy_spriteAssemb_54: db $06,$F0,$F0,$01,$F1               ;0D8F05|        |      ;
                       db $F1,$F2,$F9,$F1,$F4               ;0D8F0A|        |      ;
                       db $01,$11,$CE,$F2,$11               ;0D8F0F|        |      ;
                       db $D0,$FA,$11,$D2,$02               ;0D8F14|        |      ;
 
enemy_spriteAssemb_34: db $04,$E0,$D4,$01,$F7               ;0D8F19|        |      ;
                       db $E1,$D6,$FF,$01,$D8               ;0D8F1E|        |      ;
                       db $F8,$01,$DA,$00                   ;0D8F23|        |      ;
 
enemy_spriteAssemb_36: db $04,$E2,$D4,$01,$F7               ;0D8F27|        |      ;
                       db $E3,$D6,$FF,$01,$DC               ;0D8F2C|        |      ;
                       db $F8,$01,$DE,$00                   ;0D8F31|        |      ;
 
enemy_spriteAssemb_B4: db $05,$E2,$E0,$01,$EE               ;0D8F35|        |      ;
                       db $E3,$E2,$F6,$E3,$D6               ;0D8F3A|        |      ;
                       db $FE,$01,$E4,$F8,$01               ;0D8F3F|        |      ;
                       db $DE,$00                           ;0D8F44|        |      ;
 
enemy_spriteAssemb_B6: db $06,$C0,$E6,$01,$F7               ;0D8F46|        |      ;
                       db $C1,$E8,$FF,$E1,$EA               ;0D8F4B|        |      ;
                       db $F7,$E1,$EC,$FF,$01               ;0D8F50|        |      ;
                       db $EE,$F8,$01,$DA,$00               ;0D8F55|        |      ;
 
enemy_spriteAssemb_F0: db $07,$E2,$D4,$01,$F6               ;0D8F5A|        |      ;
                       db $E3,$D6,$FE,$01,$DC               ;0D8F5F|        |      ;
                       db $F8,$01,$DE,$00,$FB               ;0D8F64|        |      ;
                       db $F0,$E0,$FB,$F2,$E8               ;0D8F69|        |      ;
                       db $FB,$F4,$F0                       ;0D8F6E|        |      ;
 
enemy_spriteAssemb_3E: db $04,$E0,$80,$01,$F8               ;0D8F71|        |      ;
                       db $E1,$82,$00,$00,$82               ;0D8F76|        |      ;
                       db $41,$F8,$01,$80,$00               ;0D8F7B|        |      ;
 
enemy_spriteAssemb_40: db $04,$E0,$FA,$01,$F8               ;0D8F80|        |      ;
                       db $E1,$FC,$00,$00,$FC               ;0D8F85|        |      ;
                       db $41,$F8,$01,$FA,$00               ;0D8F8A|        |      ;
 
enemy_spriteAssemb_42: db $04,$E0,$90,$03,$F7               ;0D8F8F|        |      ;
                       db $E1,$92,$FF,$01,$94               ;0D8F94|        |      ;
                       db $F8,$01,$96,$00                   ;0D8F99|        |      ;
 
enemy_spriteAssemb_44: db $04,$E2,$90,$03,$F5               ;0D8F9D|        |      ;
                       db $E3,$92,$FD,$01,$98               ;0D8FA2|        |      ;
                       db $F8,$01,$9A,$00                   ;0D8FA7|        |      ;
 
enemy_spriteAssemb_46: db $05,$E0,$9C,$03,$F4               ;0D8FAB|        |      ;
                       db $E1,$9E,$FC,$E1,$A0               ;0D8FB0|        |      ;
                       db $04,$01,$A2,$F8,$01               ;0D8FB5|        |      ;
                       db $A4,$00                           ;0D8FBA|        |      ;
 
enemy_spriteAssemb_48: db $04,$F0,$90,$03,$F7               ;0D8FBC|        |      ;
                       db $F1,$92,$FF,$11,$B8               ;0D8FC1|        |      ;
                       db $F8,$11,$BA,$00                   ;0D8FC6|        |      ;
 
enemy_spriteAssemb_4A: db $04,$E0,$A6,$03,$F7               ;0D8FCA|        |      ;
                       db $E1,$A8,$FF,$01,$94               ;0D8FCF|        |      ;
                       db $F8,$01,$96,$00                   ;0D8FD4|        |      ;
 
enemy_09_spriteAssemb_20: db $03,$F0,$B2,$02,$F4               ;0D8FD8|        |      ;
                       db $F1,$B4,$FC,$F1,$B6               ;0D8FDD|        |      ;
                       db $04                               ;0D8FE2|        |      ;
 
enemy_09_spriteAssemb_22: db $03,$F0,$B2,$82,$F4               ;0D8FE3|        |      ;
                       db $F1,$B4,$FC,$F1,$B6               ;0D8FE8|        |      ;
                       db $04                               ;0D8FED|        |      ;
 
enemy_spriteAssemb_4C: db $02,$F0,$84,$02,$F8               ;0D8FEE|        |      ;
                       db $F1,$86,$00                       ;0D8FF3|        |      ;
 
enemy_spriteAssemb_4E: db $02,$F0,$88,$02,$F8               ;0D8FF6|        |      ;
                       db $F1,$8A,$00                       ;0D8FFB|        |      ;
 
enemy_09_spriteAssemb_36: db $02,$F0,$E0,$01,$F8               ;0D8FFE|        |      ;
                       db $F1,$E2,$00                       ;0D9003|        |      ;
 
enemy_09_spriteAssemb_38: db $02,$F0,$E4,$01,$F8               ;0D9006|        |      ;
                       db $F1,$E6,$00                       ;0D900B|        |      ;
 
enemy_09_spriteAssemb_44: db $02,$F0,$90,$01,$F8               ;0D900E|        |      ;
                       db $F1,$92,$00                       ;0D9013|        |      ;
 
enemy_09_spriteAssemb_46: db $02,$F0,$94,$01,$F8               ;0D9016|        |      ;
                       db $F1,$96,$00                       ;0D901B|        |      ;
 
enemy_09_spriteAssemb_3A: db $02,$F0,$E8,$01,$F8               ;0D901E|        |      ;
                       db $F1,$EA,$00                       ;0D9023|        |      ;
 
enemy_09_spriteAssemb_48: db $02,$F0,$98,$01,$F8               ;0D9026|        |      ;
                       db $F1,$9A,$00                       ;0D902B|        |      ;
 
enemy_09_spriteAssemb_3C: db $02,$F0,$EC,$01,$F8               ;0D902E|        |      ;
                       db $F1,$EE,$00                       ;0D9033|        |      ;
 
enemy_09_spriteAssemb_4A: db $02,$F0,$9C,$01,$F8               ;0D9036|        |      ;
                       db $F1,$9E,$00                       ;0D903B|        |      ;
 
enemy_09_spriteAssemb_3E: db $01,$F0,$F0,$01,$FC               ;0D903E|        |      ;
 
enemy_09_spriteAssemb_4C: db $01,$F0,$A0,$01,$FC               ;0D9043|        |      ;
 
enemy_09_spriteAssemb_40: db $02,$F0,$F2,$01,$F8               ;0D9048|        |      ;
                       db $F1,$F4,$00                       ;0D904D|        |      ;
 
enemy_09_spriteAssemb_4E: db $02,$F0,$A2,$01,$F8               ;0D9050|        |      ;
                       db $F1,$A4,$00                       ;0D9055|        |      ;
 
enemy_09_spriteAssemb_42: db $02,$F0,$FA,$C1,$F8               ;0D9058|        |      ;
                       db $F1,$F8,$00                       ;0D905D|        |      ;
 
enemy_09_spriteAssemb_50: db $02,$F0,$9A,$C1,$F8               ;0D9060|        |      ;
                       db $F1,$98,$00                       ;0D9065|        |      ;
 
enemy_spriteAssemb_58: db $02,$F0,$80,$03,$F8               ;0D9068|        |      ;
                       db $F1,$82,$00                       ;0D906D|        |      ;
 
enemy_spriteAssemb_5A: db $02,$F0,$80,$03,$F8               ;0D9070|        |      ;
                       db $F1,$86,$00                       ;0D9075|        |      ;
 
enemy_spriteAssemb_5C: db $02,$F0,$84,$03,$F8               ;0D9078|        |      ;
                       db $F1,$86,$00                       ;0D907D|        |      ;
 
enemy_spriteAssemb_5E: db $02,$F0,$88,$03,$F8               ;0D9080|        |      ;
                       db $F1,$82,$00                       ;0D9085|        |      ;
 
enemy_spriteAssemb_60: db $01,$F0,$8A,$03,$FC               ;0D9088|        |      ;
 
enemy_spriteAssemb_62: db $02,$F0,$8C,$02,$F8               ;0D908D|        |      ;
                       db $F1,$8E,$00                       ;0D9092|        |      ;
 
enemy_spriteAssemb_64: db $02,$F0,$90,$02,$F8               ;0D9095|        |      ;
                       db $F1,$92,$00                       ;0D909A|        |      ;
 
enemy_spriteAssemb_66: db $02,$F0,$94,$02,$F8               ;0D909D|        |      ;
                       db $F1,$96,$00                       ;0D90A2|        |      ;
 
enemy_spriteAssemb_38: db $02,$F0,$8E,$C2,$F8               ;0D90A5|        |      ;
                       db $F1,$8C,$00                       ;0D90AA|        |      ;
 
enemy_spriteAssemb_3A: db $02,$F0,$92,$C2,$F8               ;0D90AD|        |      ;
                       db $F1,$90,$00                       ;0D90B2|        |      ;
 
enemy_spriteAssemb_3C: db $02,$F0,$96,$C2,$F8               ;0D90B5|        |      ;
                       db $F1,$94,$00                       ;0D90BA|        |      ;
 
enemy_spriteAssemb_68: db $05,$E0,$98,$01,$F8               ;0D90BD|        |      ;
                       db $E1,$9A,$00,$01,$9C               ;0D90C2|        |      ;
                       db $F8,$01,$9E,$00,$C1               ;0D90C7|        |      ;
                       db $BE,$FB                           ;0D90CC|        |      ;
 
enemy_spriteAssemb_6A: db $05,$E0,$98,$01,$F8               ;0D90CE|        |      ;
                       db $E1,$9A,$00,$01,$A0               ;0D90D3|        |      ;
                       db $F8,$01,$A2,$00,$C1               ;0D90D8|        |      ;
                       db $BE,$FB                           ;0D90DD|        |      ;
 
enemy_spriteAssemb_6C: db $05,$E0,$98,$01,$F8               ;0D90DF|        |      ;
                       db $E1,$9A,$00,$01,$A4               ;0D90E4|        |      ;
                       db $F8,$01,$A6,$00,$C1               ;0D90E9|        |      ;
                       db $BE,$FB                           ;0D90EE|        |      ;
 
enemy_spriteAssemb_70: db $04,$E0,$A8,$01,$F8               ;0D90F0|        |      ;
                       db $E1,$AA,$00,$01,$9C               ;0D90F5|        |      ;
                       db $F8,$01,$9E,$00                   ;0D90FA|        |      ;
 
enemy_spriteAssemb_72: db $02,$00,$AA,$41,$F8               ;0D90FE|        |      ;
                       db $01,$A8,$00                       ;0D9103|        |      ;
 
enemy_spriteAssemb_74: db $08,$A0,$AC,$01,$F8               ;0D9106|        |      ;
                       db $A1,$AE,$00,$C0,$AE               ;0D910B|        |      ;
                       db $41,$F8,$C1,$AC,$00               ;0D9110|        |      ;
                       db $E0,$AC,$01,$F8,$E1               ;0D9115|        |      ;
                       db $AE,$00,$00,$AE,$41               ;0D911A|        |      ;
                       db $F8,$01,$AC,$00                   ;0D911F|        |      ;
 
enemy_spriteAssemb_76: db $08,$A0,$AE,$41,$F8               ;0D9123|        |      ;
                       db $A1,$AC,$00,$C0,$AC               ;0D9128|        |      ;
                       db $01,$F8,$C1,$AE,$00               ;0D912D|        |      ;
                       db $E0,$AE,$41,$F8,$E1               ;0D9132|        |      ;
                       db $AC,$00,$00,$B0,$01               ;0D9137|        |      ;
                       db $F8,$01,$B2,$00                   ;0D913C|        |      ;
 
enemy_spriteAssemb_78: db $08,$A0,$AC,$01,$F8               ;0D9140|        |      ;
                       db $A1,$AE,$00,$C0,$AE               ;0D9145|        |      ;
                       db $41,$F8,$C1,$AC,$00               ;0D914A|        |      ;
                       db $E0,$AC,$01,$F8,$E1               ;0D914F|        |      ;
                       db $AE,$00,$01,$A0,$F8               ;0D9154|        |      ;
                       db $01,$A2,$00                       ;0D9159|        |      ;
 
enemy_spriteAssemb_7A: db $08,$A0,$AE,$41,$F8               ;0D915C|        |      ;
                       db $A1,$AC,$00,$C0,$AC               ;0D9161|        |      ;
                       db $01,$F8,$C1,$AE,$00               ;0D9166|        |      ;
                       db $E1,$B4,$F8,$E1,$B6               ;0D916B|        |      ;
                       db $00,$01,$A0,$F8,$01               ;0D9170|        |      ;
                       db $A2,$00                           ;0D9175|        |      ;
 
enemy_spriteAssemb_7C: db $06,$C0,$AE,$41,$F8               ;0D9177|        |      ;
                       db $C1,$AC,$00,$E0,$98               ;0D917C|        |      ;
                       db $01,$F8,$E1,$9A,$00               ;0D9181|        |      ;
                       db $00,$A0,$01,$F8,$01               ;0D9186|        |      ;
                       db $A2,$00                           ;0D918B|        |      ;
 
enemy_spriteAssemb_B0: db $02,$F0,$B8,$01,$F8               ;0D918D|        |      ;
                       db $F1,$BA,$00                       ;0D9192|        |      ;
 
enemy_spriteAssemb_B2: db $02,$F0,$BC,$01,$F8               ;0D9195|        |      ;
                       db $F0,$BA,$81,$00                   ;0D919A|        |      ;
 
enemy_spriteAssemb_8C: db $08,$E0,$C0,$02,$F0               ;0D919E|        |      ;
                       db $E1,$C2,$F8,$E1,$C4               ;0D91A3|        |      ;
                       db $00,$E1,$C6,$08,$01               ;0D91A8|        |      ;
                       db $C8,$F8,$01,$CA,$00               ;0D91AD|        |      ;
                       db $21,$CC,$F8,$21,$CE               ;0D91B2|        |      ;
                       db $00                               ;0D91B7|        |      ;
 
enemy_spriteAssemb_8E: db $08,$E2,$C0,$02,$F0               ;0D91B8|        |      ;
                       db $E3,$C2,$F8,$E3,$D0               ;0D91BD|        |      ;
                       db $00,$F3,$D2,$08,$03               ;0D91C2|        |      ;
                       db $C8,$F8,$03,$CA,$00               ;0D91C7|        |      ;
                       db $23,$CC,$F8,$23,$CE               ;0D91CC|        |      ;
                       db $00                               ;0D91D1|        |      ;
 
enemy_spriteAssemb_92: db $04,$E0,$C0,$01,$F7               ;0D91D2|        |      ;
                       db $E1,$C2,$FF,$01,$C4               ;0D91D7|        |      ;
                       db $F8,$01,$C6,$00                   ;0D91DC|        |      ;
 
enemy_spriteAssemb_94: db $04,$E0,$C0,$01,$F8               ;0D91E0|        |      ;
                       db $E1,$C2,$00,$01,$C8               ;0D91E5|        |      ;
                       db $F8,$01,$CA,$00                   ;0D91EA|        |      ;
 
enemy_spriteAssemb_96: db $05,$E0,$D0,$01,$F8               ;0D91EE|        |      ;
                       db $E1,$D2,$00,$E1,$D4               ;0D91F3|        |      ;
                       db $08,$01,$C4,$F8,$01               ;0D91F8|        |      ;
                       db $CE,$00                           ;0D91FD|        |      ;
 
enemy_spriteAssemb_98: db $04,$E0,$D6,$01,$FB               ;0D91FF|        |      ;
                       db $E1,$D8,$03,$01,$CC               ;0D9204|        |      ;
                       db $F8,$01,$CE,$00                   ;0D9209|        |      ;
 
enemy_spriteAssemb_9A: db $05,$E2,$DA,$01,$EE               ;0D920D|        |      ;
                       db $E1,$DC,$F6,$E1,$DE               ;0D9212|        |      ;
                       db $FE,$01,$C6,$F8,$01               ;0D9217|        |      ;
                       db $C6,$00                           ;0D921C|        |      ;
 
enemy_spriteAssemb_9C: db $04,$E0,$E2,$41,$F9               ;0D921E|        |      ;
                       db $E1,$E0,$FF,$00,$C8               ;0D9223|        |      ;
                       db $01,$F8,$01,$CA,$00               ;0D9228|        |      ;
 
enemy_spriteAssemb_9E: db $02,$00,$E0,$01,$F8               ;0D922D|        |      ;
                       db $01,$E2,$00                       ;0D9232|        |      ;
 
enemy_spriteAssemb_A0: db $02,$00,$E4,$01,$F8               ;0D9235|        |      ;
                       db $01,$E6,$00                       ;0D923A|        |      ;
 
enemy_spriteAssemb_A2: db $02,$F0,$F8,$01,$F8               ;0D923D|        |      ;
                       db $F1,$FA,$00                       ;0D9242|        |      ;
 
enemy_spriteAssemb_A4: db $01,$F0,$FC,$01,$FC               ;0D9245|        |      ;
 
enemy_spriteAssemb_A6: db $02,$F0,$FA,$41,$F8               ;0D924A|        |      ;
                       db $F1,$F8,$00                       ;0D924F|        |      ;
 
enemy_spriteAssemb_A8: db $07,$E0,$D0,$01,$F8               ;0D9252|        |      ;
                       db $E1,$D2,$00,$E1,$D4               ;0D9257|        |      ;
                       db $08,$E1,$EC,$10,$01               ;0D925C|        |      ;
                       db $C4,$F8,$01,$CE,$00               ;0D9261|        |      ;
                       db $01,$EE,$10                       ;0D9266|        |      ;
 
enemy_spriteAssemb_AA: db $07,$E0,$D0,$01,$F7               ;0D9269|        |      ;
                       db $E1,$D2,$FF,$E1,$D4               ;0D926E|        |      ;
                       db $07,$E1,$EC,$0F,$01               ;0D9273|        |      ;
                       db $E8,$F7,$01,$EA,$FF               ;0D9278|        |      ;
                       db $00,$EE,$41,$0E                   ;0D927D|        |      ;
 
enemy_spriteAssemb_AC: db $06,$E0,$D6,$01,$FB               ;0D9281|        |      ;
                       db $E1,$D8,$03,$E1,$F0               ;0D9286|        |      ;
                       db $0B,$E3,$F2,$13,$01               ;0D928B|        |      ;
                       db $CC,$F8,$01,$CE,$00               ;0D9290|        |      ;
 
enemy_spriteAssemb_EE: db $09,$F0,$F4,$01,$CE               ;0D9295|        |      ;
                       db $F1,$F6,$D6,$F1,$F6               ;0D929A|        |      ;
                       db $DE,$F1,$F6,$E6,$E3               ;0D929F|        |      ;
                       db $DA,$EE,$E1,$DC,$F6               ;0D92A4|        |      ;
                       db $E1,$DE,$FE,$01,$CC               ;0D92A9|        |      ;
                       db $F8,$01,$CE,$00                   ;0D92AE|        |      ;
 
enemy_spriteAssemb_B8: db $05,$DC,$C0,$01,$F0               ;0D92B2|        |      ;
                       db $E0,$C2,$02,$F8,$E1               ;0D92B7|        |      ;
                       db $C4,$00,$01,$C6,$F8               ;0D92BC|        |      ;
                       db $01,$C8,$00                       ;0D92C1|        |      ;
 
enemy_spriteAssemb_BA: db $05,$E0,$C0,$01,$EF               ;0D92C4|        |      ;
                       db $E0,$C2,$02,$F7,$E1               ;0D92C9|        |      ;
                       db $C4,$FF,$01,$CA,$F7               ;0D92CE|        |      ;
                       db $01,$CC,$FF                       ;0D92D3|        |      ;
 
enemy_spriteAssemb_F2: db $06,$E0,$CE,$01,$E8               ;0D92D6|        |      ;
                       db $E1,$D0,$F0,$E0,$C2               ;0D92DB|        |      ;
                       db $02,$F8,$E1,$C4,$00               ;0D92E0|        |      ;
                       db $01,$D2,$F7,$01,$D4               ;0D92E5|        |      ;
                       db $FF                               ;0D92EA|        |      ;
 
enemy_spriteAssemb_F4: db $09,$E0,$D6,$01,$D6               ;0D92EB|        |      ;
                       db $E1,$D6,$DE,$E0,$D8               ;0D92F0|        |      ;
                       db $02,$E6,$E1,$DA,$EE               ;0D92F5|        |      ;
                       db $E1,$DC,$F6,$01,$DE               ;0D92FA|        |      ;
                       db $E8,$01,$E0,$F0,$01               ;0D92FF|        |      ;
                       db $E2,$F8,$01,$E4,$00               ;0D9304|        |      ;
 
enemy_spriteAssemb_F6: db $09,$E0,$E6,$01,$D6               ;0D9309|        |      ;
                       db $E1,$E8,$DE,$E0,$D8               ;0D930E|        |      ;
                       db $02,$E6,$E1,$DA,$EE               ;0D9313|        |      ;
                       db $E1,$DC,$F6,$01,$DE               ;0D9318|        |      ;
                       db $E8,$01,$E0,$F0,$01               ;0D931D|        |      ;
                       db $E2,$F8,$01,$E4,$00               ;0D9322|        |      ;
 
enemy_spriteAssemb_F8: db $09,$F6,$E6,$01,$D6               ;0D9327|        |      ;
                       db $F7,$E8,$DE,$E2,$D8               ;0D932C|        |      ;
                       db $02,$E6,$E1,$DA,$EE               ;0D9331|        |      ;
                       db $E1,$DC,$F6,$01,$DE               ;0D9336|        |      ;
                       db $E8,$01,$E0,$F0,$01               ;0D933B|        |      ;
                       db $E2,$F8,$01,$E4,$00               ;0D9340|        |      ;
 
enemy_spriteAssemb_BC: db $04,$E0,$80,$03,$F8               ;0D9345|        |      ;
                       db $E0,$80,$43,$00,$00               ;0D934A|        |      ;
                       db $82,$03,$F8,$00,$82               ;0D934F|        |      ;
                       db $43,$00                           ;0D9354|        |      ;
 
enemy_spriteAssemb_BE: db $04,$E0,$84,$03,$F8               ;0D9356|        |      ;
                       db $E0,$84,$43,$00,$00               ;0D935B|        |      ;
                       db $86,$03,$F8,$00,$86               ;0D9360|        |      ;
                       db $43,$00                           ;0D9365|        |      ;
 
enemy_spriteAssemb_C0: db $01,$F0,$8C,$03,$FC               ;0D9367|        |      ;
 
enemy_spriteAssemb_C2: db $02,$E0,$8C,$03,$FC               ;0D936C|        |      ;
                       db $00,$8C,$03,$FC                   ;0D9371|        |      ;
 
enemy_spriteAssemb_C4: db $03,$D0,$8C,$03,$FC               ;0D9375|        |      ;
                       db $F0,$8C,$03,$FC,$10               ;0D937A|        |      ;
                       db $8C,$03,$FC                       ;0D937F|        |      ;
 
enemy_spriteAssemb_C6: db $04,$C0,$8C,$03,$FC               ;0D9382|        |      ;
                       db $E0,$8C,$03,$FC,$00               ;0D9387|        |      ;
                       db $8C,$03,$FC,$20,$8C               ;0D938C|        |      ;
                       db $03,$FC                           ;0D9391|        |      ;
 
enemy_spriteAssemb_C8: db $05,$B0,$8C,$03,$FC               ;0D9393|        |      ;
                       db $D0,$8C,$03,$FC,$F0               ;0D9398|        |      ;
                       db $8C,$03,$FC,$10,$8C               ;0D939D|        |      ;
                       db $03,$FC,$30,$8C,$03               ;0D93A2|        |      ;
                       db $FC                               ;0D93A7|        |      ;
 
enemy_spriteAssemb_D8: db $06,$A0,$8C,$03,$FC               ;0D93A8|        |      ;
                       db $C0,$8C,$03,$FC,$E0               ;0D93AD|        |      ;
                       db $8C,$03,$FC,$00,$8C               ;0D93B2|        |      ;
                       db $03,$FC,$20,$8C,$03               ;0D93B7|        |      ;
                       db $FC,$40,$8C,$03,$FC               ;0D93BC|        |      ;
 
enemy_spriteAssemb_CA: db $01,$F0,$88,$03,$FC               ;0D93C1|        |      ;
 
enemy_spriteAssemb_CC: db $01,$F0,$8A,$03,$FC               ;0D93C6|        |      ;
 
trevorSpriteAssemb_56: db $01,$F0,$EB,$03,$FC               ;0D93CB|        |      ;
 
trevorSpriteAssemb_58: db $01,$F0,$ED,$03,$FC               ;0D93D0|        |      ;
 
trevorSpriteAssemb_5A: db $01,$F0,$EF,$03,$FC               ;0D93D5|        |      ;
 
enemy_09_spriteAssemb_00: db $02,$E0,$8E,$02,$F8               ;0D93DA|        |      ;
                       db $E0,$8E,$42,$FF                   ;0D93DF|        |      ;
 
enemy_09_spriteAssemb_02: db $02,$E0,$90,$02,$F8               ;0D93E3|        |      ;
                       db $E0,$90,$42,$FF                   ;0D93E8|        |      ;
 
enemy_09_spriteAssemb_04: db $04,$E0,$92,$02,$F8               ;0D93EC|        |      ;
                       db $E0,$92,$42,$FF,$00               ;0D93F1|        |      ;
                       db $94,$02,$F8,$00,$94               ;0D93F6|        |      ;
                       db $42,$FF                           ;0D93FB|        |      ;
 
enemy_09_spriteAssemb_06: db $08,$E0,$96,$02,$E8               ;0D93FD|        |      ;
                       db $E1,$98,$F0,$E1,$9A               ;0D9402|        |      ;
                       db $F8,$E0,$9A,$42,$FF               ;0D9407|        |      ;
                       db $E1,$98,$07,$E1,$96               ;0D940C|        |      ;
                       db $0F,$00,$9C,$02,$F8               ;0D9411|        |      ;
                       db $01,$9C,$FF                       ;0D9416|        |      ;
 
enemy_09_spriteAssemb_08: db $07,$E0,$9E,$02,$F0               ;0D9419|        |      ;
                       db $E1,$A0,$F8,$E1,$A2               ;0D941E|        |      ;
                       db $00,$E1,$A4,$08,$E1               ;0D9423|        |      ;
                       db $A6,$10,$01,$A8,$F8               ;0D9428|        |      ;
                       db $01,$AA,$00                       ;0D942D|        |      ;
 
enemy_09_spriteAssemb_0A: db $05,$E0,$AE,$02,$FB               ;0D9430|        |      ;
                       db $E1,$B0,$03,$F9,$AC               ;0D9435|        |      ;
                       db $F0,$01,$B2,$F8,$01               ;0D943A|        |      ;
                       db $B4,$00                           ;0D943F|        |      ;
 
enemy_09_spriteAssemb_0C: db $06,$F0,$AC,$02,$F0               ;0D9441|        |      ;
                       db $F1,$B6,$F8,$F1,$B8               ;0D9446|        |      ;
                       db $00,$11,$BA,$F0,$11               ;0D944B|        |      ;
                       db $BC,$F8,$11,$BE,$00               ;0D9450|        |      ;
 
enemy_spriteAssemb_DE: db $03,$E0,$DE,$03,$F8               ;0D9455|        |      ;
                       db $E0,$DE,$43,$00,$00               ;0D945A|        |      ;
                       db $EA,$03,$FC                       ;0D945F|        |      ;
 
enemy_spriteAssemb_E0: db $03,$E0,$E0,$03,$F8               ;0D9462|        |      ;
                       db $E0,$E0,$43,$00,$01               ;0D9467|        |      ;
                       db $F0,$FC                           ;0D946C|        |      ;
 
enemy_spriteAssemb_E2: db $04,$E0,$E2,$03,$F4               ;0D946E|        |      ;
                       db $E1,$E4,$FC,$E0,$E2               ;0D9473|        |      ;
                       db $43,$04,$00,$EA,$03               ;0D9478|        |      ;
                       db $FC                               ;0D947D|        |      ;
 
enemy_spriteAssemb_E4: db $04,$E0,$E6,$03,$F4               ;0D947E|        |      ;
                       db $E1,$E8,$FC,$E0,$E6               ;0D9483|        |      ;
                       db $43,$04,$00,$F0,$03               ;0D9488|        |      ;
                       db $FC                               ;0D948D|        |      ;
 
enemy_spriteAssemb_E6: db $02,$F0,$DE,$03,$F8               ;0D948E|        |      ;
                       db $F0,$DE,$43,$00                   ;0D9493|        |      ;
 
enemy_spriteAssemb_E8: db $02,$F0,$E0,$03,$F8               ;0D9497|        |      ;
                       db $F0,$E0,$43,$00                   ;0D949C|        |      ;
 
enemy_spriteAssemb_DA: db $01,$F0,$EC,$03,$FC               ;0D94A0|        |      ;
 
enemy_spriteAssemb_DC: db $01,$F0,$EE,$03,$FC               ;0D94A5|        |      ;
 
enemy_spriteAssemb_EA: db $03,$F0,$E2,$03,$F4               ;0D94AA|        |      ;
                       db $F1,$E4,$FC,$F0,$E2               ;0D94AF|        |      ;
                       db $43,$04                           ;0D94B4|        |      ;
 
enemy_spriteAssemb_EC: db $03,$F0,$E6,$03,$F4               ;0D94B6|        |      ;
                       db $F1,$E8,$FC,$F0,$E6               ;0D94BB|        |      ;
                       db $43,$04                           ;0D94C0|        |      ;
 
enemy_09_spriteAssemb_0E: db $03,$F0,$84,$03,$F4               ;0D94C2|        |      ;
                       db $F1,$86,$FC,$F1,$88               ;0D94C7|        |      ;
                       db $04                               ;0D94CC|        |      ;
 
enemy_09_spriteAssemb_10: db $06,$E0,$84,$03,$F0               ;0D94CD|        |      ;
                       db $E1,$86,$F8,$E1,$A8               ;0D94D2|        |      ;
                       db $00,$01,$AA,$F8,$01               ;0D94D7|        |      ;
                       db $AC,$00,$F9,$AE,$08               ;0D94DC|        |      ;
 
enemy_09_spriteAssemb_12: db $03,$F0,$8A,$03,$F4               ;0D94E1|        |      ;
                       db $F1,$8C,$FC,$F1,$88               ;0D94E6|        |      ;
                       db $04                               ;0D94EB|        |      ;
 
enemy_09_spriteAssemb_14: db $05,$F0,$90,$03,$F0               ;0D94EC|        |      ;
                       db $E9,$92,$F8,$E1,$94               ;0D94F1|        |      ;
                       db $00,$E1,$96,$08,$01               ;0D94F6|        |      ;
                       db $98,$00                           ;0D94FB|        |      ;
 
enemy_09_spriteAssemb_5C: db $03,$F0,$80,$03,$F4               ;0D94FD|        |      ;
                       db $F1,$82,$FC,$F1,$88               ;0D9502|        |      ;
                       db $04                               ;0D9507|        |      ;
 
enemy_09_spriteAssemb_5E: db $04,$F0,$9A,$01,$F4               ;0D9508|        |      ;
                       db $F0,$80,$03,$F4,$F1               ;0D950D|        |      ;
                       db $82,$FC,$F1,$88,$04               ;0D9512|        |      ;
 
enemy_spriteAssemb_FA: db $05,$F0,$9C,$01,$EC               ;0D9517|        |      ;
                       db $F1,$9E,$F4,$F0,$80               ;0D951C|        |      ;
                       db $03,$F4,$F1,$82,$FC               ;0D9521|        |      ;
                       db $F1,$88,$04                       ;0D9526|        |      ;
 
enemy_spriteAssemb_FC: db $07,$F0,$9C,$01,$DC               ;0D9529|        |      ;
                       db $F1,$A0,$E4,$F3,$A0               ;0D952E|        |      ;
                       db $EC,$F1,$9E,$F4,$F0               ;0D9533|        |      ;
                       db $80,$03,$F4,$F1,$82               ;0D9538|        |      ;
                       db $FC,$F1,$88,$04                   ;0D953D|        |      ;
 
enemy_09_spriteAssemb_16: db $04,$E0,$95,$02,$F5               ;0D9541|        |      ;
                       db $E1,$97,$FD,$01,$99               ;0D9546|        |      ;
                       db $F8,$01,$9B,$00                   ;0D954B|        |      ;
 
enemy_09_spriteAssemb_18: db $04,$E0,$9D,$02,$F5               ;0D954F|        |      ;
                       db $E1,$9F,$FD,$01,$B0               ;0D9554|        |      ;
                       db $F8,$01,$B2,$00                   ;0D9559|        |      ;
 
enemy_09_spriteAssemb_1A: db $04,$E0,$B4,$02,$F5               ;0D955D|        |      ;
                       db $E1,$B6,$FD,$01,$B8               ;0D9562|        |      ;
                       db $F8,$01,$BA,$00                   ;0D9567|        |      ;
 
enemy_09_spriteAssemb_1C: db $02,$00,$A2,$02,$F8               ;0D956B|        |      ;
                       db $00,$A2,$42,$00                   ;0D9570|        |      ;
 
enemy_09_spriteAssemb_1E: db $02,$00,$BC,$02,$F8               ;0D9574|        |      ;
                       db $01,$BE,$00                       ;0D9579|        |      ;
 
enemy_09_spriteAssemb_24: db $05,$E0,$D8,$02,$F8               ;0D957C|        |      ;
                       db $E1,$DA,$00,$01,$DC               ;0D9581|        |      ;
                       db $F8,$01,$DE,$00,$01               ;0D9586|        |      ;
                       db $E0,$08                           ;0D958B|        |      ;
 
enemy_09_spriteAssemb_26: db $05,$E0,$E2,$02,$F8               ;0D958D|        |      ;
                       db $E1,$E4,$00,$01,$E6               ;0D9592|        |      ;
                       db $F8,$01,$E8,$00,$01               ;0D9597|        |      ;
                       db $EA,$08                           ;0D959C|        |      ;
 
enemy_09_spriteAssemb_28: db $05,$E0,$EC,$02,$F9               ;0D959E|        |      ;
                       db $E1,$EE,$01,$01,$F0               ;0D95A3|        |      ;
                       db $F8,$01,$F2,$00,$01               ;0D95A8|        |      ;
                       db $F8,$08                           ;0D95AD|        |      ;
 
enemy_09_spriteAssemb_2A: db $01,$F0,$F4,$02,$FC               ;0D95AF|        |      ;
 
enemy_09_spriteAssemb_2C: db $01,$F0,$F6,$02,$FC               ;0D95B4|        |      ;
 
enemy_09_spriteAssemb_2E: db $01,$F0,$F8,$02,$FC               ;0D95B9|        |      ;
 
enemy_09_spriteAssemb_30: db $04,$E2,$B0,$01,$F8               ;0D95BE|        |      ;
                       db $E3,$B2,$00,$01,$B4               ;0D95C3|        |      ;
                       db $F8,$01,$B6,$00                   ;0D95C8|        |      ;
 
enemy_09_spriteAssemb_32: db $04,$E2,$B0,$01,$F8               ;0D95CC|        |      ;
                       db $E3,$B2,$00,$01,$B8               ;0D95D1|        |      ;
                       db $F8,$01,$BA,$00                   ;0D95D6|        |      ;
 
enemy_09_spriteAssemb_34: db $04,$E0,$B0,$01,$F8               ;0D95DA|        |      ;
                       db $E1,$B2,$00,$01,$BC               ;0D95DF|        |      ;
                       db $F8,$01,$BE,$00                   ;0D95E4|        |      ;
 
enemy_09_spriteAssemb_56: db $04,$E2,$C0,$01,$F8               ;0D95E8|        |      ;
                       db $E3,$C2,$00,$01,$C4               ;0D95ED|        |      ;
                       db $F8,$01,$C6,$00                   ;0D95F2|        |      ;
 
enemy_09_spriteAssemb_58: db $04,$E2,$C0,$01,$F8               ;0D95F6|        |      ;
                       db $E3,$C2,$00,$01,$C8               ;0D95FB|        |      ;
                       db $F8,$01,$CA,$00                   ;0D9600|        |      ;
 
enemy_09_spriteAssemb_5A: db $04,$E0,$C0,$01,$F8               ;0D9604|        |      ;
                       db $E1,$C2,$00,$01,$CC               ;0D9609|        |      ;
                       db $F8,$01,$CE,$00                   ;0D960E|        |      ;
 
enemy_09_spriteAssemb_52: db $02,$F0,$F6,$01,$F8               ;0D9612|        |      ;
                       db $F1,$F8,$00                       ;0D9617|        |      ;
 
enemy_09_spriteAssemb_54: db $02,$F0,$FA,$01,$F8               ;0D961A|        |      ;
                       db $F1,$FC,$00                       ;0D961F|        |      ;
 
enemy_09_spriteAssemb_60: db $02,$F0,$B6,$01,$F8               ;0D9622|        |      ;
                       db $F1,$B8,$00                       ;0D9627|        |      ;
 
enemy_09_spriteAssemb_62: db $02,$F0,$BA,$01,$F8               ;0D962A|        |      ;
                       db $F1,$BC,$00                       ;0D962F|        |      ;
 
enemy_09_spriteAssemb_6E: db $09,$D0,$C0,$01,$F0               ;0D9632|        |      ;
                       db $E1,$C2,$F8,$E1,$C4               ;0D9637|        |      ;
                       db $00,$DB,$C6,$08,$D1               ;0D963C|        |      ;
                       db $C8,$10,$01,$CA,$FB               ;0D9641|        |      ;
                       db $01,$CC,$03,$1A,$84               ;0D9646|        |      ;
                       db $02,$F8,$1B,$86,$00               ;0D964B|        |      ;
 
enemy_09_spriteAssemb_70: db $0A,$E6,$CE,$01,$F0               ;0D9650|        |      ;
                       db $E1,$D0,$F8,$E1,$D2               ;0D9655|        |      ;
                       db $00,$E7,$D4,$08,$05               ;0D965A|        |      ;
                       db $D6,$F0,$01,$D8,$F8               ;0D965F|        |      ;
                       db $01,$DA,$00,$05,$DC               ;0D9664|        |      ;
                       db $08,$1E,$88,$02,$F8               ;0D9669|        |      ;
                       db $1F,$8A,$00                       ;0D966E|        |      ;
 
enemy_09_spriteAssemb_72: db $07,$D0,$C0,$01,$F0               ;0D9671|        |      ;
                       db $E1,$C2,$F8,$E1,$C4               ;0D9676|        |      ;
                       db $00,$DB,$C6,$08,$D1               ;0D967B|        |      ;
                       db $C8,$10,$01,$CA,$FB               ;0D9680|        |      ;
                       db $01,$CC,$03                       ;0D9685|        |      ;
 
enemy_09_spriteAssemb_74: db $08,$E6,$CE,$01,$F0               ;0D9688|        |      ;
                       db $E1,$D0,$F8,$E1,$D2               ;0D968D|        |      ;
                       db $00,$E7,$D4,$08,$05               ;0D9692|        |      ;
                       db $D6,$F0,$01,$D8,$F8               ;0D9697|        |      ;
                       db $01,$DA,$00,$05,$DC               ;0D969C|        |      ;
                       db $08                               ;0D96A1|        |      ;
 
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
 
boss2_spriteAssemb_00: db $0C,$F0,$C0,$03,$00               ;0D9782|        |      ;
                       db $F1,$C2,$08,$D2,$80               ;0D9787|        |      ;
                       db $02,$EE,$D3,$82,$F6               ;0D978C|        |      ;
                       db $D3,$84,$FE,$D1,$86               ;0D9791|        |      ;
                       db $E8,$F1,$88,$E8,$F1               ;0D9796|        |      ;
                       db $8A,$F0,$F1,$8C,$F8               ;0D979B|        |      ;
                       db $11,$8E,$F8,$11,$90               ;0D97A0|        |      ;
                       db $00,$11,$92,$08                   ;0D97A5|        |      ;
 
boss2_spriteAssemb_04: db $0A,$F2,$C0,$03,$FF               ;0D97A9|        |      ;
                       db $F3,$C2,$07,$D0,$80               ;0D97AE|        |      ;
                       db $02,$F0,$D1,$82,$F8               ;0D97B3|        |      ;
                       db $D1,$84,$00,$E1,$94               ;0D97B8|        |      ;
                       db $E8,$F1,$96,$F0,$F1               ;0D97BD|        |      ;
                       db $98,$F8,$11,$9A,$FA               ;0D97C2|        |      ;
                       db $11,$9C,$02                       ;0D97C7|        |      ;
 
boss2_spriteAssemb_06: db $0B,$F2,$C0,$03,$FD               ;0D97CA|        |      ;
                       db $F3,$C2,$05,$D2,$80               ;0D97CF|        |      ;
                       db $02,$F0,$D3,$82,$F8               ;0D97D4|        |      ;
                       db $D3,$84,$00,$F1,$9E               ;0D97D9|        |      ;
                       db $E8,$F1,$A0,$F0,$F1               ;0D97DE|        |      ;
                       db $A2,$F8,$11,$A4,$F8               ;0D97E3|        |      ;
                       db $11,$A6,$00,$11,$A8               ;0D97E8|        |      ;
                       db $08                               ;0D97ED|        |      ;
 
boss2_spriteAssemb_0A: db $0C,$F0,$C0,$03,$01               ;0D97EE|        |      ;
                       db $F1,$C2,$09,$D2,$80               ;0D97F3|        |      ;
                       db $02,$F3,$D3,$82,$FB               ;0D97F8|        |      ;
                       db $D3,$84,$03,$D1,$86               ;0D97FD|        |      ;
                       db $EA,$F1,$88,$EA,$F1               ;0D9802|        |      ;
                       db $8A,$F2,$F1,$8C,$FA               ;0D9807|        |      ;
                       db $11,$8E,$F8,$11,$90               ;0D980C|        |      ;
                       db $00,$11,$92,$08                   ;0D9811|        |      ;
 
boss2_spriteAssemb_0C: db $0A,$F0,$C0,$03,$01               ;0D9815|        |      ;
                       db $F1,$C2,$09,$D2,$AA               ;0D981A|        |      ;
                       db $02,$F8,$D3,$AC,$00               ;0D981F|        |      ;
                       db $D3,$AE,$08,$D3,$B0               ;0D9824|        |      ;
                       db $10,$F1,$8C,$FB,$11               ;0D9829|        |      ;
                       db $8E,$F8,$11,$90,$00               ;0D982E|        |      ;
                       db $11,$92,$08                       ;0D9833|        |      ;
 
boss2_spriteAssemb_0E: db $0D,$F2,$C0,$03,$00               ;0D9836|        |      ;
                       db $F3,$C2,$08,$D2,$80               ;0D983B|        |      ;
                       db $02,$F0,$D3,$82,$F8               ;0D9840|        |      ;
                       db $D3,$84,$00,$F7,$9E               ;0D9845|        |      ;
                       db $D8,$F7,$A0,$E0,$F5               ;0D984A|        |      ;
                       db $B2,$E8,$F1,$B4,$F0               ;0D984F|        |      ;
                       db $F1,$A2,$F8,$11,$A4               ;0D9854|        |      ;
                       db $F8,$11,$A6,$00,$11               ;0D9859|        |      ;
                       db $A8,$08                           ;0D985E|        |      ;
 
boss2_spriteAssemb_10: db $0A,$F2,$C0,$03,$FF               ;0D9860|        |      ;
                       db $F3,$C2,$07,$D0,$80               ;0D9865|        |      ;
                       db $02,$F0,$D1,$82,$F8               ;0D986A|        |      ;
                       db $D1,$84,$00,$E1,$94               ;0D986F|        |      ;
                       db $E8,$F1,$96,$F0,$F1               ;0D9874|        |      ;
                       db $98,$F8,$11,$F2,$F8               ;0D9879|        |      ;
                       db $11,$F4,$00                       ;0D987E|        |      ;
 
boss2_spriteAssemb_12: db $02,$F8,$EC,$02,$F8               ;0D9881|        |      ;
                       db $F9,$EE,$00                       ;0D9886|        |      ;
 
boss2_spriteAssemb_14: db $01,$F8,$F0,$02,$FC               ;0D9889|        |      ;
 
boss2_spriteAssemb_16: db $02,$F8,$EE,$42,$F8               ;0D988E|        |      ;
                       db $F9,$EC,$00                       ;0D9893|        |      ;
 
boss2_spriteAssemb_18: db $0A,$C2,$80,$01,$F2               ;0D9896|        |      ;
                       db $C3,$82,$FA,$C3,$84               ;0D989B|        |      ;
                       db $02,$E1,$86,$F6,$E1               ;0D98A0|        |      ;
                       db $88,$FE,$E1,$8A,$06               ;0D98A5|        |      ;
                       db $01,$8C,$FC,$01,$8E               ;0D98AA|        |      ;
                       db $04,$BA,$B4,$02,$FF               ;0D98AF|        |      ;
                       db $BB,$B6,$07                       ;0D98B4|        |      ;
 
boss2_spriteAssemb_1A: db $0A,$C0,$80,$01,$F3               ;0D98B7|        |      ;
                       db $C1,$82,$FB,$C1,$84               ;0D98BC|        |      ;
                       db $03,$E1,$90,$F7,$E1               ;0D98C1|        |      ;
                       db $92,$FF,$E1,$94,$07               ;0D98C6|        |      ;
                       db $01,$96,$FB,$01,$98               ;0D98CB|        |      ;
                       db $03,$BA,$B4,$02,$00               ;0D98D0|        |      ;
                       db $BB,$B6,$08                       ;0D98D5|        |      ;
 
boss2_spriteAssemb_1C: db $0B,$C0,$80,$01,$F4               ;0D98D8|        |      ;
                       db $C1,$82,$FC,$C1,$84               ;0D98DD|        |      ;
                       db $04,$E1,$9A,$F8,$E1               ;0D98E2|        |      ;
                       db $9C,$00,$E1,$9E,$08               ;0D98E7|        |      ;
                       db $01,$A0,$F8,$01,$A2               ;0D98EC|        |      ;
                       db $00,$01,$A4,$08,$B8               ;0D98F1|        |      ;
                       db $B4,$02,$00,$B9,$B6               ;0D98F6|        |      ;
                       db $08                               ;0D98FB|        |      ;
 
boss2_spriteAssemb_20: db $0B,$C0,$A6,$01,$F9               ;0D98FC|        |      ;
                       db $C1,$A8,$01,$C1,$AA               ;0D9901|        |      ;
                       db $09,$E1,$AC,$F8,$E1               ;0D9906|        |      ;
                       db $AE,$00,$E1,$B0,$08               ;0D990B|        |      ;
                       db $01,$A0,$F8,$01,$A2               ;0D9910|        |      ;
                       db $00,$01,$A4,$08,$B0               ;0D9915|        |      ;
                       db $B8,$02,$08,$B1,$BA               ;0D991A|        |      ;
                       db $10                               ;0D991F|        |      ;
 
boss2_spriteAssemb_22: db $0B,$C0,$80,$01,$F2               ;0D9920|        |      ;
                       db $C1,$82,$FA,$C1,$84               ;0D9925|        |      ;
                       db $02,$E1,$B2,$F6,$E1               ;0D992A|        |      ;
                       db $88,$FE,$E1,$8A,$06               ;0D992F|        |      ;
                       db $01,$8C,$FC,$01,$8E               ;0D9934|        |      ;
                       db $04,$00,$B8,$02,$E4               ;0D9939|        |      ;
                       db $01,$BA,$EC,$01,$BE               ;0D993E|        |      ;
                       db $F4                               ;0D9943|        |      ;
 
boss2_spriteAssemb_24: db $09,$A0,$C4,$02,$FB               ;0D9944|        |      ;
                       db $C1,$C6,$F3,$C1,$C8               ;0D9949|        |      ;
                       db $FB,$C1,$CA,$03,$E1               ;0D994E|        |      ;
                       db $CC,$F8,$E1,$CE,$00               ;0D9953|        |      ;
                       db $01,$D0,$F3,$01,$D2               ;0D9958|        |      ;
                       db $FB,$01,$D4,$03                   ;0D995D|        |      ;
 
boss2_spriteAssemb_26: db $04,$F0,$51,$01,$F0               ;0D9961|        |      ;
                       db $F1,$61,$F8,$F1,$53               ;0D9966|        |      ;
                       db $00,$F1,$63,$08                   ;0D996B|        |      ;
 
boss2_spriteAssemb_28: db $02,$00,$F4,$01,$FC               ;0D996F|        |      ;
                       db $18,$F4,$41,$F8                   ;0D9974|        |      ;
 
boss2_spriteAssemb_2E: db $1B,$80,$F0,$01,$FC               ;0D9978|        |      ;
                       db $91,$C4,$CC,$91,$C8               ;0D997D|        |      ;
                       db $D4,$90,$C4,$C1,$DC               ;0D9982|        |      ;
                       db $A0,$C6,$41,$E4,$A1               ;0D9987|        |      ;
                       db $C8,$EC,$A0,$C4,$01               ;0D998C|        |      ;
                       db $F4,$A0,$F2,$41,$FC               ;0D9991|        |      ;
                       db $B0,$E0,$01,$D4,$B1               ;0D9996|        |      ;
                       db $D6,$DC,$B1,$C4,$04               ;0D999B|        |      ;
                       db $C1,$D8,$CC,$C1,$F2               ;0D99A0|        |      ;
                       db $FC,$D0,$D8,$41,$D4               ;0D99A5|        |      ;
                       db $E0,$F2,$01,$F6,$E1               ;0D99AA|        |      ;
                       db $F0,$FC,$E1,$C8,$04               ;0D99AF|        |      ;
                       db $E1,$CE,$0C,$01,$F2               ;0D99B4|        |      ;
                       db $F2,$00,$F2,$C1,$FC               ;0D99B9|        |      ;
                       db $00,$C2,$01,$14,$21               ;0D99BE|        |      ;
                       db $E0,$E4,$21,$F2,$EC               ;0D99C3|        |      ;
                       db $20,$F0,$C1,$FC,$40               ;0D99C8|        |      ;
                       db $CA,$41,$E4,$40,$F2               ;0D99CD|        |      ;
                       db $01,$FC,$60,$F2,$41               ;0D99D2|        |      ;
                       db $FC                               ;0D99D7|        |      ;
 
  miscSpriteAssemb_10: db $08,$C2,$80,$01,$F2               ;0D99D8|        |      ;
                       db $C3,$82,$FA,$C3,$84               ;0D99DD|        |      ;
                       db $02,$E1,$86,$F6,$E1               ;0D99E2|        |      ;
                       db $88,$FE,$E1,$8A,$06               ;0D99E7|        |      ;
                       db $BA,$B4,$02,$FF,$BB               ;0D99EC|        |      ;
                       db $B6,$07                           ;0D99F1|        |      ;
 
boss2_spriteAssemb_3A: db $06,$E0,$80,$02,$F8               ;0D99F3|        |      ;
                       db $E1,$82,$00,$E1,$84               ;0D99F8|        |      ;
                       db $08,$01,$86,$F8,$01               ;0D99FD|        |      ;
                       db $88,$00,$01,$8A,$08               ;0D9A02|        |      ;
 
boss2_spriteAssemb_3C: db $06,$F0,$8C,$02,$E8               ;0D9A07|        |      ;
                       db $E1,$8E,$F0,$E1,$90               ;0D9A0C|        |      ;
                       db $F8,$E1,$92,$00,$01               ;0D9A11|        |      ;
                       db $94,$00,$01,$96,$08               ;0D9A16|        |      ;
 
boss2_spriteAssemb_3E: db $06,$E0,$98,$02,$F0               ;0D9A1B|        |      ;
                       db $E1,$9A,$F8,$E1,$9C               ;0D9A20|        |      ;
                       db $00,$01,$9E,$F0,$01               ;0D9A25|        |      ;
                       db $A0,$F8,$01,$A2,$00               ;0D9A2A|        |      ;
 
boss2_spriteAssemb_40: db $06,$D6,$A4,$02,$F0               ;0D9A2F|        |      ;
                       db $E1,$A6,$F8,$E1,$A8               ;0D9A34|        |      ;
                       db $00,$11,$AA,$F0,$01               ;0D9A39|        |      ;
                       db $AC,$F8,$01,$AE,$00               ;0D9A3E|        |      ;
 
boss2_spriteAssemb_42: db $06,$F0,$B0,$02,$F0               ;0D9A43|        |      ;
                       db $E1,$B2,$F8,$E1,$B4               ;0D9A48|        |      ;
                       db $00,$01,$B6,$F8,$01               ;0D9A4D|        |      ;
                       db $B8,$00,$F1,$BA,$08               ;0D9A52|        |      ;
 
boss2_spriteAssemb_44: db $07,$E0,$BC,$02,$F0               ;0D9A57|        |      ;
                       db $E1,$BE,$F8,$01,$C0               ;0D9A5C|        |      ;
                       db $F0,$01,$C2,$F8,$F1               ;0D9A61|        |      ;
                       db $C4,$00,$E9,$C6,$08               ;0D9A66|        |      ;
                       db $E1,$C8,$10                       ;0D9A6B|        |      ;
 
boss2_spriteAssemb_46: db $06,$E0,$9E,$82,$F0               ;0D9A6E|        |      ;
                       db $E1,$A0,$F8,$E1,$A2               ;0D9A73|        |      ;
                       db $00,$01,$98,$F0,$01               ;0D9A78|        |      ;
                       db $9A,$F8,$01,$9C,$00               ;0D9A7D|        |      ;
 
boss2_spriteAssemb_48: db $06,$D0,$AA,$82,$F0               ;0D9A82|        |      ;
                       db $E1,$AC,$F8,$E1,$AE               ;0D9A87|        |      ;
                       db $00,$0B,$A4,$F0,$01               ;0D9A8C|        |      ;
                       db $A6,$F8,$01,$A8,$00               ;0D9A91|        |      ;
 
boss2_spriteAssemb_4A: db $05,$F0,$CE,$02,$E8               ;0D9A96|        |      ;
                       db $F1,$D0,$F0,$F1,$D2               ;0D9A9B|        |      ;
                       db $F8,$F1,$D4,$00,$F1               ;0D9AA0|        |      ;
                       db $D6,$08                           ;0D9AA5|        |      ;
 
boss2_spriteAssemb_4C: db $02,$F0,$D8,$81,$F8               ;0D9AA7|        |      ;
                       db $F1,$DA,$00                       ;0D9AAC|        |      ;
 
boss2_spriteAssemb_4E: db $02,$F0,$DC,$02,$F8               ;0D9AAF|        |      ;
                       db $F1,$DE,$00                       ;0D9AB4|        |      ;
 
boss2_spriteAssemb_50: db $02,$F0,$DE,$42,$F8               ;0D9AB7|        |      ;
                       db $F1,$DC,$00                       ;0D9ABC|        |      ;
 
boss2_spriteAssemb_52: db $02,$F0,$DE,$C2,$F8               ;0D9ABF|        |      ;
                       db $F1,$DC,$00                       ;0D9AC4|        |      ;
 
boss2_spriteAssemb_54: db $02,$F0,$DC,$82,$F8               ;0D9AC7|        |      ;
                       db $F1,$DE,$00                       ;0D9ACC|        |      ;
 
boss2_spriteAssemb_94: db $04,$F0,$F2,$00,$F0               ;0D9ACF|        |      ;
                       db $F1,$F4,$F8,$F1,$F6               ;0D9AD4|        |      ;
                       db $00,$F1,$F8,$08                   ;0D9AD9|        |      ;
 
boss2_spriteAssemb_96: db $03,$F0,$E0,$00,$F4               ;0D9ADD|        |      ;
                       db $F1,$E2,$FC,$F1,$E4               ;0D9AE2|        |      ;
                       db $04                               ;0D9AE7|        |      ;
 
boss2_spriteAssemb_98: db $02,$F0,$CA,$02,$F8               ;0D9AE8|        |      ;
                       db $F1,$CC,$00                       ;0D9AED|        |      ;
 
boss2_spriteAssemb_56: db $0C,$E0,$82,$02,$F8               ;0D9AF0|        |      ;
                       db $E1,$84,$00,$E1,$86               ;0D9AF5|        |      ;
                       db $08,$E1,$88,$10,$E1               ;0D9AFA|        |      ;
                       db $8A,$18,$01,$8C,$F8               ;0D9AFF|        |      ;
                       db $01,$8E,$00,$01,$90               ;0D9B04|        |      ;
                       db $08,$01,$92,$10,$01               ;0D9B09|        |      ;
                       db $E0,$F0,$E0,$8A,$42               ;0D9B0E|        |      ;
                       db $E8,$E1,$88,$F0                   ;0D9B13|        |      ;
 
boss2_spriteAssemb_58: db $08,$D0,$94,$02,$F8               ;0D9B17|        |      ;
                       db $D1,$96,$00,$F1,$98               ;0D9B1C|        |      ;
                       db $F7,$F1,$9A,$FF,$F1               ;0D9B21|        |      ;
                       db $9C,$07,$11,$9E,$F6               ;0D9B26|        |      ;
                       db $11,$A0,$FE,$11,$A2               ;0D9B2B|        |      ;
                       db $06                               ;0D9B30|        |      ;
 
boss2_spriteAssemb_5A: db $07,$E0,$A4,$02,$F0               ;0D9B31|        |      ;
                       db $E1,$A6,$F8,$E1,$A8               ;0D9B36|        |      ;
                       db $00,$E1,$AA,$08,$E1               ;0D9B3B|        |      ;
                       db $AC,$10,$01,$AE,$F8               ;0D9B40|        |      ;
                       db $01,$B0,$00                       ;0D9B45|        |      ;
 
boss2_spriteAssemb_5C: db $07,$E0,$B2,$02,$F9               ;0D9B48|        |      ;
                       db $E1,$B4,$FF,$01,$B6               ;0D9B4D|        |      ;
                       db $F8,$01,$B8,$00,$01               ;0D9B52|        |      ;
                       db $BA,$08,$21,$BC,$FA               ;0D9B57|        |      ;
                       db $21,$BE,$02                       ;0D9B5C|        |      ;
 
boss2_spriteAssemb_5E: db $03,$F0,$C0,$02,$F8               ;0D9B5F|        |      ;
                       db $F1,$C2,$00,$F1,$C4               ;0D9B64|        |      ;
                       db $08                               ;0D9B69|        |      ;
 
boss2_spriteAssemb_60: db $03,$F0,$C6,$02,$FB               ;0D9B6A|        |      ;
                       db $F1,$C8,$03,$01,$CA               ;0D9B6F|        |      ;
                       db $FB,$01,$CC,$03                   ;0D9B74|        |      ;
 
boss2_spriteAssemb_62: db $02,$F0,$CE,$02,$F8               ;0D9B78|        |      ;
                       db $F1,$D0,$00                       ;0D9B7D|        |      ;
 
boss2_spriteAssemb_64: db $02,$F8,$D2,$02,$F8               ;0D9B80|        |      ;
                       db $F9,$D4,$00                       ;0D9B85|        |      ;
 
boss2_spriteAssemb_66: db $04,$E0,$D6,$02,$F8               ;0D9B88|        |      ;
                       db $E1,$D8,$00,$01,$DA               ;0D9B8D|        |      ;
                       db $F8,$01,$DC,$00                   ;0D9B92|        |      ;
 
boss2_spriteAssemb_68: db $0C,$E0,$8C,$82,$F8               ;0D9B96|        |      ;
                       db $E1,$8E,$00,$E1,$90               ;0D9B9B|        |      ;
                       db $08,$E1,$92,$10,$E1               ;0D9BA0|        |      ;
                       db $E0,$F0,$01,$82,$F8               ;0D9BA5|        |      ;
                       db $01,$84,$00,$01,$86               ;0D9BAA|        |      ;
                       db $08,$01,$88,$10,$01               ;0D9BAF|        |      ;
                       db $8A,$18,$00,$8A,$C2               ;0D9BB4|        |      ;
                       db $E8,$01,$88,$F0                   ;0D9BB9|        |      ;
 
boss2_spriteAssemb_6A: db $08,$D0,$9E,$82,$F6               ;0D9BBD|        |      ;
                       db $D1,$A0,$FE,$D1,$A2               ;0D9BC2|        |      ;
                       db $06,$F1,$98,$F7,$F1               ;0D9BC7|        |      ;
                       db $9A,$FF,$F1,$9C,$07               ;0D9BCC|        |      ;
                       db $11,$94,$F8,$11,$96               ;0D9BD1|        |      ;
                       db $00                               ;0D9BD6|        |      ;
 
boss2_spriteAssemb_6C: db $01,$00,$80,$03,$00               ;0D9BD7|        |      ;
 
boss2_spriteAssemb_6E: db $08,$E0,$82,$01,$F4               ;0D9BDC|        |      ;
                       db $E1,$84,$FC,$E1,$86               ;0D9BE1|        |      ;
                       db $04,$E1,$88,$0C,$01               ;0D9BE6|        |      ;
                       db $8A,$F4,$01,$8C,$FC               ;0D9BEB|        |      ;
                       db $01,$8E,$04,$01,$90               ;0D9BF0|        |      ;
                       db $0C                               ;0D9BF5|        |      ;
 
boss2_spriteAssemb_70: db $0A,$D4,$92,$01,$F4               ;0D9BF6|        |      ;
                       db $D1,$94,$FC,$D1,$96               ;0D9BFB|        |      ;
                       db $04,$D5,$98,$0C,$E0               ;0D9C00|        |      ;
                       db $BE,$03,$F8,$E1,$C0               ;0D9C05|        |      ;
                       db $00,$E1,$C2,$08,$01               ;0D9C0A|        |      ;
                       db $C4,$F8,$01,$C6,$00               ;0D9C0F|        |      ;
                       db $01,$C8,$08                       ;0D9C14|        |      ;
 
boss2_spriteAssemb_72: db $0E,$B0,$B6,$03,$FF               ;0D9C17|        |      ;
                       db $A0,$9A,$01,$F4,$A1               ;0D9C1C|        |      ;
                       db $9C,$FC,$A1,$9E,$04               ;0D9C21|        |      ;
                       db $A1,$A0,$0C,$C0,$B8               ;0D9C26|        |      ;
                       db $03,$F8,$C1,$BA,$00               ;0D9C2B|        |      ;
                       db $C1,$BC,$08,$E1,$BE               ;0D9C30|        |      ;
                       db $F8,$E1,$C0,$00,$E1               ;0D9C35|        |      ;
                       db $C2,$08,$01,$C4,$F8               ;0D9C3A|        |      ;
                       db $01,$C6,$00,$01,$C8               ;0D9C3F|        |      ;
                       db $08                               ;0D9C44|        |      ;
 
boss2_spriteAssemb_74: db $0A,$B0,$B6,$01,$FF               ;0D9C45|        |      ;
                       db $C0,$B8,$03,$F8,$C1               ;0D9C4A|        |      ;
                       db $BA,$00,$C1,$BC,$08               ;0D9C4F|        |      ;
                       db $E1,$BE,$F8,$E1,$C0               ;0D9C54|        |      ;
                       db $00,$E1,$C2,$08,$01               ;0D9C59|        |      ;
                       db $C4,$F8,$01,$C6,$00               ;0D9C5E|        |      ;
                       db $01,$C8,$08                       ;0D9C63|        |      ;
 
boss2_spriteAssemb_76: db $0A,$B0,$B6,$01,$FF               ;0D9C66|        |      ;
                       db $C0,$CA,$03,$F8,$C1               ;0D9C6B|        |      ;
                       db $BA,$00,$C1,$BC,$08               ;0D9C70|        |      ;
                       db $E1,$CC,$F8,$E1,$CE               ;0D9C75|        |      ;
                       db $00,$E1,$C2,$08,$01               ;0D9C7A|        |      ;
                       db $D0,$F8,$01,$D2,$00               ;0D9C7F|        |      ;
                       db $01,$C8,$08                       ;0D9C84|        |      ;
 
boss2_spriteAssemb_78: db $0D,$B0,$B6,$01,$FF               ;0D9C87|        |      ;
                       db $C0,$D4,$03,$F8,$C1               ;0D9C8C|        |      ;
                       db $D6,$00,$C1,$D8,$08               ;0D9C91|        |      ;
                       db $C1,$DA,$10,$E1,$CC               ;0D9C96|        |      ;
                       db $F8,$E1,$EA,$00,$E1               ;0D9C9B|        |      ;
                       db $EA,$08,$E1,$DC,$10               ;0D9CA0|        |      ;
                       db $01,$D0,$F8,$01,$EA               ;0D9CA5|        |      ;
                       db $00,$01,$EA,$08,$01               ;0D9CAA|        |      ;
                       db $DE,$10                           ;0D9CAF|        |      ;
 
boss2_spriteAssemb_7A: db $03,$F0,$A2,$03,$F4               ;0D9CB1|        |      ;
                       db $F1,$A4,$FC,$F0,$A2               ;0D9CB6|        |      ;
                       db $43,$04                           ;0D9CBB|        |      ;
 
boss2_spriteAssemb_7C: db $02,$F0,$A6,$03,$F8               ;0D9CBD|        |      ;
                       db $F0,$A6,$43,$00                   ;0D9CC2|        |      ;
 
boss2_spriteAssemb_7E: db $02,$F0,$A8,$03,$F8               ;0D9CC6|        |      ;
                       db $F1,$AA,$00                       ;0D9CCB|        |      ;
 
boss2_spriteAssemb_80: db $02,$F0,$AC,$03,$F8               ;0D9CCE|        |      ;
                       db $F1,$AE,$00                       ;0D9CD3|        |      ;
 
boss2_spriteAssemb_82: db $02,$F0,$AC,$83,$F8               ;0D9CD6|        |      ;
                       db $F1,$AE,$00                       ;0D9CDB|        |      ;
 
boss2_spriteAssemb_84: db $09,$C6,$B8,$03,$F8               ;0D9CDE|        |      ;
                       db $C7,$BA,$00,$C7,$BC               ;0D9CE3|        |      ;
                       db $08,$E1,$B8,$F8,$E1               ;0D9CE8|        |      ;
                       db $C0,$00,$E1,$C2,$08               ;0D9CED|        |      ;
                       db $01,$C4,$F8,$01,$C6               ;0D9CF2|        |      ;
                       db $00,$01,$C8,$08                   ;0D9CF7|        |      ;
 
boss2_spriteAssemb_86: db $08,$00,$E2,$03,$F0               ;0D9CFB|        |      ;
                       db $01,$EA,$F8,$01,$E4               ;0D9D00|        |      ;
                       db $00,$01,$E6,$08,$01               ;0D9D05|        |      ;
                       db $E8,$10,$E7,$B8,$F8               ;0D9D0A|        |      ;
                       db $E7,$BA,$00,$E7,$BC               ;0D9D0F|        |      ;
                       db $08                               ;0D9D14|        |      ;
 
boss2_spriteAssemb_88: db $05,$00,$EC,$03,$F0               ;0D9D15|        |      ;
                       db $01,$EE,$F8,$01,$F0               ;0D9D1A|        |      ;
                       db $00,$01,$F2,$08,$01               ;0D9D1F|        |      ;
                       db $F4,$10                           ;0D9D24|        |      ;
 
boss2_spriteAssemb_8A: db $05,$00,$EC,$01,$F0               ;0D9D26|        |      ;
                       db $01,$EE,$F8,$01,$F0               ;0D9D2B|        |      ;
                       db $00,$01,$F2,$08,$01               ;0D9D30|        |      ;
                       db $F4,$10                           ;0D9D35|        |      ;
 
boss2_spriteAssemb_8C: db $04,$00,$F6,$02,$F4               ;0D9D37|        |      ;
                       db $01,$F8,$FC,$01,$FA               ;0D9D3C|        |      ;
                       db $04,$01,$FC,$0C                   ;0D9D41|        |      ;
 
boss2_spriteAssemb_8E: db $04,$00,$F6,$01,$F4               ;0D9D45|        |      ;
                       db $01,$F8,$FC,$01,$FA               ;0D9D4A|        |      ;
                       db $04,$01,$FC,$0C                   ;0D9D4F|        |      ;
 
boss2_spriteAssemb_90: db $04,$E0,$57,$01,$F8               ;0D9D53|        |      ;
                       db $E1,$59,$00,$01,$69               ;0D9D58|        |      ;
                       db $F8,$01,$6B,$00                   ;0D9D5D|        |      ;
 
boss2_spriteAssemb_92: db $04,$E0,$57,$03,$F8               ;0D9D61|        |      ;
                       db $E1,$59,$00,$01,$69               ;0D9D66|        |      ;
                       db $F8,$01,$6B,$00                   ;0D9D6B|        |      ;
 
boss2_spriteAssemb_9A: db $04,$E0,$D4,$02,$F7               ;0D9D6F|        |      ;
                       db $E1,$D6,$FF,$01,$D8               ;0D9D74|        |      ;
                       db $F9,$01,$DA,$01                   ;0D9D79|        |      ;
 
boss2_spriteAssemb_9C: db $03,$EA,$C0,$02,$F4               ;0D9D7D|        |      ;
                       db $EF,$C2,$FC,$F1,$C4               ;0D9D82|        |      ;
                       db $04                               ;0D9D87|        |      ;
 
boss2_spriteAssemb_9E: db $03,$F2,$C6,$02,$F4               ;0D9D88|        |      ;
                       db $F1,$C8,$FC,$EF,$CA               ;0D9D8D|        |      ;
                       db $04                               ;0D9D92|        |      ;
 
boss2_spriteAssemb_A0: db $04,$E0,$CE,$02,$FC               ;0D9D93|        |      ;
                       db $E1,$D0,$04,$F1,$CC               ;0D9D98|        |      ;
                       db $F4,$01,$D2,$FC                   ;0D9D9D|        |      ;
 
boss2_spriteAssemb_A2: db $04,$E0,$DA,$C2,$F7               ;0D9DA1|        |      ;
                       db $E1,$D8,$FF,$01,$D6               ;0D9DA6|        |      ;
                       db $F9,$01,$D4,$01                   ;0D9DAB|        |      ;
 
boss2_spriteAssemb_A4: db $02,$F0,$E2,$02,$F8               ;0D9DAF|        |      ;
                       db $F1,$E4,$00                       ;0D9DB4|        |      ;
 
boss2_spriteAssemb_A6: db $02,$F0,$DE,$02,$F8               ;0D9DB7|        |      ;
                       db $F1,$E0,$00                       ;0D9DBC|        |      ;
 
boss2_spriteAssemb_A8: db $01,$F0,$DC,$02,$FC               ;0D9DBF|        |      ;
 
boss2_spriteAssemb_AA: db $02,$F0,$E0,$42,$F8               ;0D9DC4|        |      ;
                       db $F1,$DE,$00                       ;0D9DC9|        |      ;
 
boss2_spriteAssemb_AC: db $02,$F0,$E4,$42,$F8               ;0D9DCC|        |      ;
                       db $F1,$E2,$00                       ;0D9DD1|        |      ;
 
boss2_spriteAssemb_AE: db $01,$F0,$EA,$02,$FC               ;0D9DD4|        |      ;
 
boss2_spriteAssemb_B0: db $01,$F0,$E8,$02,$FC               ;0D9DD9|        |      ;
 
boss2_spriteAssemb_B2: db $01,$F0,$E6,$02,$FC               ;0D9DDE|        |      ;
 
boss2_spriteAssemb_B4: db $01,$F0,$E8,$82,$FC               ;0D9DE3|        |      ;
 
boss2_spriteAssemb_B6: db $01,$F0,$EA,$82,$FC               ;0D9DE8|        |      ;
 
boss2_spriteAssemb_B8: db $01,$00,$B6,$01,$FC               ;0D9DED|        |      ;
 
boss2_spriteAssemb_BA: db $02,$00,$B8,$01,$F8               ;0D9DF2|        |      ;
                       db $00,$B8,$41,$00                   ;0D9DF7|        |      ;
 
boss2_spriteAssemb_BC: db $08,$C0,$BA,$01,$F8               ;0D9DFB|        |      ;
                       db $C0,$EE,$41,$00,$E0               ;0D9E00|        |      ;
                       db $BC,$01,$F8,$E0,$BC               ;0D9E05|        |      ;
                       db $41,$00,$00,$BE,$01               ;0D9E0A|        |      ;
                       db $F0,$01,$EC,$F8,$00               ;0D9E0F|        |      ;
                       db $EC,$41,$00,$01,$BE               ;0D9E14|        |      ;
                       db $08                               ;0D9E19|        |      ;
 
boss2_spriteAssemb_BE: db $06,$E0,$EE,$01,$F8               ;0D9E1A|        |      ;
                       db $E0,$BA,$41,$00,$00               ;0D9E1F|        |      ;
                       db $F0,$01,$F0,$01,$F2               ;0D9E24|        |      ;
                       db $F8,$00,$F2,$41,$00               ;0D9E29|        |      ;
                       db $01,$F0,$08                       ;0D9E2E|        |      ;
 
boss2_spriteAssemb_C0: db $04,$00,$F4,$01,$F0               ;0D9E31|        |      ;
                       db $01,$F6,$F8,$00,$F6               ;0D9E36|        |      ;
                       db $41,$00,$01,$F4,$08               ;0D9E3B|        |      ;
 
boss2_spriteAssemb_C2: db $04,$00,$F8,$01,$F0               ;0D9E40|        |      ;
                       db $01,$F8,$F8,$00,$F8               ;0D9E45|        |      ;
                       db $41,$00,$01,$F8,$08               ;0D9E4A|        |      ;
 
boss2_spriteAssemb_C4: db $0C,$C2,$80,$02,$EF               ;0D9E4F|        |      ;
                       db $C1,$82,$F7,$C1,$84               ;0D9E54|        |      ;
                       db $00,$E1,$86,$F2,$E1               ;0D9E59|        |      ;
                       db $88,$FA,$E1,$8A,$02               ;0D9E5E|        |      ;
                       db $01,$8C,$F0,$01,$8E               ;0D9E63|        |      ;
                       db $F8,$01,$90,$00,$21               ;0D9E68|        |      ;
                       db $92,$F3,$21,$94,$FB               ;0D9E6D|        |      ;
                       db $21,$96,$03                       ;0D9E72|        |      ;
 
boss2_spriteAssemb_C6: db $0A,$C0,$80,$02,$F0               ;0D9E75|        |      ;
                       db $C1,$98,$F8,$C1,$9A               ;0D9E7A|        |      ;
                       db $00,$E1,$9C,$F0,$E1               ;0D9E7F|        |      ;
                       db $9E,$F8,$E1,$A0,$00               ;0D9E84|        |      ;
                       db $01,$A2,$F6,$01,$A4               ;0D9E89|        |      ;
                       db $FE,$21,$A6,$F8,$21               ;0D9E8E|        |      ;
                       db $A8,$00                           ;0D9E93|        |      ;
 
boss2_spriteAssemb_C8: db $0C,$C2,$80,$02,$F1               ;0D9E95|        |      ;
                       db $C1,$AA,$F9,$C1,$AC               ;0D9E9A|        |      ;
                       db $01,$E1,$AE,$F3,$E1               ;0D9E9F|        |      ;
                       db $B0,$FB,$E1,$B2,$03               ;0D9EA4|        |      ;
                       db $01,$B4,$F2,$01,$B6               ;0D9EA9|        |      ;
                       db $FA,$01,$B8,$02,$21               ;0D9EAE|        |      ;
                       db $BA,$F3,$21,$BC,$FB               ;0D9EB3|        |      ;
                       db $21,$BE,$03                       ;0D9EB8|        |      ;
 
boss2_spriteAssemb_CC: db $0C,$C2,$80,$02,$F4               ;0D9EBB|        |      ;
                       db $C1,$82,$FC,$C1,$84               ;0D9EC0|        |      ;
                       db $04,$E1,$86,$F5,$E1               ;0D9EC5|        |      ;
                       db $88,$FD,$E1,$8A,$05               ;0D9ECA|        |      ;
                       db $01,$C0,$F1,$01,$C2               ;0D9ECF|        |      ;
                       db $F9,$01,$90,$01,$21               ;0D9ED4|        |      ;
                       db $C4,$F0,$21,$C6,$FB               ;0D9ED9|        |      ;
                       db $21,$96,$03                       ;0D9EDE|        |      ;
 
boss2_spriteAssemb_CE: db $0D,$C2,$80,$02,$F6               ;0D9EE1|        |      ;
                       db $C1,$82,$FE,$C1,$84               ;0D9EE6|        |      ;
                       db $06,$E1,$C8,$F0,$E1               ;0D9EEB|        |      ;
                       db $CA,$F8,$E1,$CC,$00               ;0D9EF0|        |      ;
                       db $E1,$CE,$08,$01,$D0               ;0D9EF5|        |      ;
                       db $EB,$01,$D2,$F3,$01               ;0D9EFA|        |      ;
                       db $D4,$FB,$01,$D6,$03               ;0D9EFF|        |      ;
                       db $21,$D8,$FB,$21,$DA               ;0D9F04|        |      ;
                       db $03                               ;0D9F09|        |      ;
 
boss2_spriteAssemb_D0: db $0C,$C2,$80,$02,$EC               ;0D9F0A|        |      ;
                       db $C1,$82,$F4,$C1,$84               ;0D9F0F|        |      ;
                       db $FC,$E1,$86,$F0,$E1               ;0D9F14|        |      ;
                       db $88,$F8,$E1,$8A,$00               ;0D9F19|        |      ;
                       db $01,$8C,$EF,$01,$8E               ;0D9F1E|        |      ;
                       db $F7,$01,$90,$FF,$21               ;0D9F23|        |      ;
                       db $92,$F3,$21,$94,$FB               ;0D9F28|        |      ;
                       db $21,$96,$03                       ;0D9F2D|        |      ;
 
boss2_spriteAssemb_D2: db $0C,$C0,$DC,$02,$F4               ;0D9F30|        |      ;
                       db $C1,$DE,$FC,$C1,$E0               ;0D9F35|        |      ;
                       db $04,$E1,$E2,$F4,$E1               ;0D9F3A|        |      ;
                       db $9E,$FC,$E1,$A0,$04               ;0D9F3F|        |      ;
                       db $01,$E4,$F1,$01,$8E               ;0D9F44|        |      ;
                       db $F7,$01,$90,$01,$21               ;0D9F49|        |      ;
                       db $92,$F3,$21,$94,$FB               ;0D9F4E|        |      ;
                       db $21,$96,$03                       ;0D9F53|        |      ;
 
boss2_spriteAssemb_D4: db $0E,$C2,$80,$02,$EC               ;0D9F56|        |      ;
                       db $C1,$82,$F4,$C1,$84               ;0D9F5B|        |      ;
                       db $FC,$E1,$E6,$E0,$E1               ;0D9F60|        |      ;
                       db $E8,$E8,$E1,$EA,$F0               ;0D9F65|        |      ;
                       db $E1,$88,$F8,$E1,$8A               ;0D9F6A|        |      ;
                       db $00,$01,$E4,$EF,$01               ;0D9F6F|        |      ;
                       db $8E,$F7,$01,$90,$FF               ;0D9F74|        |      ;
                       db $21,$92,$F3,$21,$94               ;0D9F79|        |      ;
                       db $FB,$21,$96,$03                   ;0D9F7E|        |      ;
 
boss2_spriteAssemb_D6: db $09,$C2,$80,$02,$EC               ;0D9F82|        |      ;
                       db $C1,$82,$F4,$C1,$84               ;0D9F87|        |      ;
                       db $FC,$E1,$86,$F0,$E1               ;0D9F8C|        |      ;
                       db $88,$F8,$E1,$8A,$00               ;0D9F91|        |      ;
                       db $01,$EC,$F3,$01,$EE               ;0D9F96|        |      ;
                       db $FB,$01,$F0,$03                   ;0D9F9B|        |      ;
 
boss2_spriteAssemb_D8: db $06,$C2,$80,$02,$EC               ;0D9F9F|        |      ;
                       db $C1,$82,$F4,$C1,$84               ;0D9FA4|        |      ;
                       db $FC,$E1,$86,$F0,$E1               ;0D9FA9|        |      ;
                       db $88,$F8,$E1,$8A,$00               ;0D9FAE|        |      ;
 
boss2_spriteAssemb_DA: db $0B,$C0,$F2,$02,$F9               ;0D9FB3|        |      ;
                       db $C1,$F4,$01,$E1,$AE               ;0D9FB8|        |      ;
                       db $F5,$E1,$B0,$FD,$E1               ;0D9FBD|        |      ;
                       db $B2,$05,$01,$B4,$F2               ;0D9FC2|        |      ;
                       db $01,$B6,$FA,$01,$B8               ;0D9FC7|        |      ;
                       db $02,$21,$BA,$F3,$21               ;0D9FCC|        |      ;
                       db $BC,$FB,$21,$BE,$03               ;0D9FD1|        |      ;
 
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
 
  miscSpriteAssemb_00: db $02,$F0,$FA,$01,$F8               ;0DA0D6|        |      ;
                       db $F1,$FC,$00                       ;0DA0DB|        |      ;
 
  miscSpriteAssemb_02: db $0C,$C2,$80,$02,$F3               ;0DA0DE|        |      ;
                       db $C1,$82,$FB,$C1,$84               ;0DA0E3|        |      ;
                       db $03,$E1,$F6,$F5,$E1               ;0DA0E8|        |      ;
                       db $F8,$FD,$E1,$8A,$05               ;0DA0ED|        |      ;
                       db $01,$E4,$F1,$01,$8E               ;0DA0F2|        |      ;
                       db $F9,$01,$90,$01,$21               ;0DA0F7|        |      ;
                       db $92,$F3,$21,$94,$FB               ;0DA0FC|        |      ;
                       db $21,$96,$03                       ;0DA101|        |      ;
 
  miscSpriteAssemb_12: db $04,$C0,$80,$03,$F8               ;0DA104|        |      ;
                       db $C1,$82,$00,$E1,$84               ;0DA109|        |      ;
                       db $F8,$E1,$86,$00                   ;0DA10E|        |      ;
 
  miscSpriteAssemb_14: db $04,$D8,$88,$03,$F0               ;0DA112|        |      ;
                       db $E1,$8A,$F0,$E1,$8C               ;0DA117|        |      ;
                       db $F8,$E1,$8E,$00                   ;0DA11C|        |      ;
 
  miscSpriteAssemb_16: db $04,$E8,$90,$03,$E8               ;0DA120|        |      ;
                       db $E1,$92,$F0,$E1,$94               ;0DA125|        |      ;
                       db $F8,$E1,$96,$00                   ;0DA12A|        |      ;
 
  miscSpriteAssemb_18: db $05,$E0,$98,$03,$E8               ;0DA12E|        |      ;
                       db $D1,$9A,$F0,$F1,$9C               ;0DA133|        |      ;
                       db $F0,$E1,$9E,$F8,$E1               ;0DA138|        |      ;
                       db $A0,$00                           ;0DA13D|        |      ;
 
  miscSpriteAssemb_1A: db $02,$F0,$A2,$03,$F8               ;0DA13F|        |      ;
                       db $F1,$A4,$00                       ;0DA144|        |      ;
 
  miscSpriteAssemb_1C: db $02,$F0,$A6,$03,$F8               ;0DA147|        |      ;
                       db $F1,$AE,$00                       ;0DA14C|        |      ;
 
  miscSpriteAssemb_24: db $04,$F0,$A2,$03,$F8               ;0DA14F|        |      ;
                       db $F1,$A4,$00,$11,$A2               ;0DA154|        |      ;
                       db $F8,$11,$A4,$00                   ;0DA159|        |      ;
 
  miscSpriteAssemb_26: db $06,$F0,$A2,$03,$F8               ;0DA15D|        |      ;
                       db $F1,$A4,$00,$11,$A2               ;0DA162|        |      ;
                       db $F8,$11,$A4,$00,$31               ;0DA167|        |      ;
                       db $A2,$F8,$31,$A4,$00               ;0DA16C|        |      ;
 
  miscSpriteAssemb_28: db $08,$F0,$A2,$03,$F8               ;0DA171|        |      ;
                       db $F1,$A4,$00,$11,$A2               ;0DA176|        |      ;
                       db $F8,$11,$A4,$00,$31               ;0DA17B|        |      ;
                       db $A2,$F8,$31,$A4,$00               ;0DA180|        |      ;
                       db $51,$A2,$F8,$51,$A4               ;0DA185|        |      ;
                       db $00                               ;0DA18A|        |      ;
 
  miscSpriteAssemb_2A: db $0A,$F0,$A2,$03,$F8               ;0DA18B|        |      ;
                       db $F1,$A4,$00,$11,$A2               ;0DA190|        |      ;
                       db $F8,$11,$A4,$00,$31               ;0DA195|        |      ;
                       db $A2,$F8,$31,$A4,$00               ;0DA19A|        |      ;
                       db $51,$A2,$F8,$51,$A4               ;0DA19F|        |      ;
                       db $00,$71,$A2,$F8,$71               ;0DA1A4|        |      ;
                       db $A4,$00                           ;0DA1A9|        |      ;
 
  miscSpriteAssemb_2C: db $09,$D2,$9A,$03,$F2               ;0DA1AB|        |      ;
                       db $D3,$9C,$FA,$EB,$98               ;0DA1B0|        |      ;
                       db $EA,$F3,$9E,$F2,$F3               ;0DA1B5|        |      ;
                       db $A0,$FA,$11,$80,$F0               ;0DA1BA|        |      ;
                       db $11,$82,$F8,$11,$84               ;0DA1BF|        |      ;
                       db $00,$11,$86,$08                   ;0DA1C4|        |      ;
 
  miscSpriteAssemb_2E: db $09,$D0,$9A,$03,$F1               ;0DA1C8|        |      ;
                       db $D1,$9C,$F9,$E9,$98               ;0DA1CD|        |      ;
                       db $E9,$F1,$9E,$F1,$F1               ;0DA1D2|        |      ;
                       db $A0,$F9,$11,$80,$F0               ;0DA1D7|        |      ;
                       db $11,$8A,$F8,$11,$8C               ;0DA1DC|        |      ;
                       db $00,$11,$8E,$08                   ;0DA1E1|        |      ;
 
  miscSpriteAssemb_30: db $09,$D0,$9A,$03,$F0               ;0DA1E5|        |      ;
                       db $D1,$9C,$F8,$E9,$98               ;0DA1EA|        |      ;
                       db $E8,$F1,$9E,$F0,$F1               ;0DA1EF|        |      ;
                       db $A0,$F8,$11,$90,$F0               ;0DA1F4|        |      ;
                       db $11,$92,$F8,$11,$94               ;0DA1F9|        |      ;
                       db $00,$11,$96,$08                   ;0DA1FE|        |      ;
 
  miscSpriteAssemb_32: db $0B,$D2,$9A,$03,$F4               ;0DA202|        |      ;
                       db $D3,$9C,$FC,$D1,$A2               ;0DA207|        |      ;
                       db $E7,$F1,$A4,$E7,$F1               ;0DA20C|        |      ;
                       db $A6,$ED,$F1,$A8,$F5               ;0DA211|        |      ;
                       db $F1,$AA,$FD,$11,$80               ;0DA216|        |      ;
                       db $F0,$11,$82,$F8,$11               ;0DA21B|        |      ;
                       db $84,$00,$11,$86,$08               ;0DA220|        |      ;
 
  miscSpriteAssemb_34: db $0B,$D0,$9A,$03,$F5               ;0DA225|        |      ;
                       db $D1,$9C,$FD,$D1,$A2               ;0DA22A|        |      ;
                       db $E7,$F1,$A4,$E7,$F1               ;0DA22F|        |      ;
                       db $A6,$EF,$F1,$AC,$F7               ;0DA234|        |      ;
                       db $F1,$AE,$FF,$11,$80               ;0DA239|        |      ;
                       db $F0,$11,$82,$F8,$11               ;0DA23E|        |      ;
                       db $84,$00,$11,$86,$08               ;0DA243|        |      ;
 
  miscSpriteAssemb_36: db $0B,$D0,$9A,$03,$F5               ;0DA248|        |      ;
                       db $D1,$B0,$FD,$D1,$A2               ;0DA24D|        |      ;
                       db $E9,$F1,$B2,$E7,$F1               ;0DA252|        |      ;
                       db $B4,$EF,$F1,$B6,$F7               ;0DA257|        |      ;
                       db $F1,$B8,$FF,$11,$80               ;0DA25C|        |      ;
                       db $F0,$11,$82,$F8,$11               ;0DA261|        |      ;
                       db $84,$00,$11,$86,$08               ;0DA266|        |      ;
 
  miscSpriteAssemb_38: db $0C,$D0,$BA,$03,$E4               ;0DA26B|        |      ;
                       db $D1,$BC,$EC,$D1,$BE               ;0DA270|        |      ;
                       db $F4,$D1,$C0,$FC,$F1               ;0DA275|        |      ;
                       db $C2,$E4,$F1,$C4,$EC               ;0DA27A|        |      ;
                       db $F1,$C6,$F4,$F1,$C8               ;0DA27F|        |      ;
                       db $FC,$11,$80,$F0,$11               ;0DA284|        |      ;
                       db $82,$F8,$11,$84,$00               ;0DA289|        |      ;
 
                       db $11,$86,$08                       ;0DA28E|        |      ;
 
  miscSpriteAssemb_3A: db $0C,$D0,$BA,$03,$E4               ;0DA291|        |      ;
                       db $D1,$BC,$EC,$D1,$BE               ;0DA296|        |      ;
                       db $F4,$D1,$C0,$FC,$F1               ;0DA29B|        |      ;
                       db $C2,$E4,$F1,$C4,$EC               ;0DA2A0|        |      ;
                       db $F1,$CA,$F4,$F1,$CC               ;0DA2A5|        |      ;
                       db $FC,$11,$80,$F0,$11               ;0DA2AA|        |      ;
                       db $82,$F8,$11,$84,$00               ;0DA2AF|        |      ;
 
                       db $11,$86,$08                       ;0DA2B4|        |      ;
 
  miscSpriteAssemb_3C: db $0C,$D2,$BA,$03,$E8               ;0DA2B7|        |      ;
                       db $D3,$CE,$EF,$D3,$BE               ;0DA2BC|        |      ;
                       db $F7,$D3,$C0,$FF,$F3               ;0DA2C1|        |      ;
                       db $C2,$E8,$F3,$D0,$F0               ;0DA2C6|        |      ;
                       db $F3,$D2,$F8,$F3,$D4               ;0DA2CB|        |      ;
                       db $00,$11,$80,$F0,$11               ;0DA2D0|        |      ;
                       db $82,$F8,$11,$84,$00               ;0DA2D5|        |      ;
                       db $11,$86,$08                       ;0DA2DA|        |      ;
 
  miscSpriteAssemb_3E: db $09,$D0,$9A,$01,$F0               ;0DA2DD|        |      ;
                       db $D1,$9C,$F8,$E8,$98               ;0DA2E2|        |      ;
                       db $03,$E8,$F1,$9E,$F0               ;0DA2E7|        |      ;
                       db $F1,$A0,$F8,$11,$90               ;0DA2EC|        |      ;
                       db $F0,$11,$92,$F8,$11               ;0DA2F1|        |      ;
                       db $94,$00,$11,$96,$08               ;0DA2F6|        |      ;
 
  miscSpriteAssemb_40: db $03,$F0,$E6,$03,$F4               ;0DA2FB|        |      ;
                       db $F1,$E8,$FC,$F1,$EA               ;0DA300|        |      ;
                       db $04                               ;0DA305|        |      ;
 
  miscSpriteAssemb_42: db $03,$F0,$EC,$03,$F4               ;0DA306|        |      ;
                       db $F1,$EE,$FC,$F1,$F0               ;0DA30B|        |      ;
                       db $04                               ;0DA310|        |      ;
 
  miscSpriteAssemb_44: db $04,$F0,$EA,$43,$F0               ;0DA311|        |      ;
                       db $F0,$F2,$03,$F8,$F1               ;0DA316|        |      ;
                       db $F4,$00,$F1,$F0,$08               ;0DA31B|        |      ;
 
  miscSpriteAssemb_46: db $06,$D0,$F4,$43,$F8               ;0DA320|        |      ;
                       db $D1,$F2,$00,$F1,$F0               ;0DA325|        |      ;
                       db $F0,$F0,$F6,$03,$F8               ;0DA32A|        |      ;
                       db $F1,$F8,$00,$F1,$EA               ;0DA32F|        |      ;
                       db $08                               ;0DA334|        |      ;
 
  miscSpriteAssemb_48: db $08,$B0,$F2,$03,$F8               ;0DA335|        |      ;
                       db $B1,$F4,$00,$F1,$F0               ;0DA33A|        |      ;
                       db $08,$D0,$F8,$43,$F8               ;0DA33F|        |      ;
                       db $D1,$F6,$00,$F1,$EA               ;0DA344|        |      ;
                       db $F0,$F1,$F8,$F8,$F1               ;0DA349|        |      ;
                       db $F6,$00                           ;0DA34E|        |      ;
 
  miscSpriteAssemb_4A: db $03,$F0,$D6,$01,$F8               ;0DA350|        |      ;
                       db $F1,$D8,$00,$F1,$DA               ;0DA355|        |      ;
                       db $08                               ;0DA35A|        |      ;
 
  miscSpriteAssemb_4C: db $02,$F0,$DC,$01,$F8               ;0DA35B|        |      ;
                       db $F1,$DE,$00                       ;0DA360|        |      ;
 
  miscSpriteAssemb_4E: db $01,$F0,$E0,$03,$FC               ;0DA363|        |      ;
 
  miscSpriteAssemb_50: db $01,$F0,$E2,$03,$FC               ;0DA368|        |      ;
 
  miscSpriteAssemb_52: db $02,$E0,$E4,$03,$FC               ;0DA36D|        |      ;
                       db $00,$E4,$83,$FC                   ;0DA372|        |      ;
 
  miscSpriteAssemb_54: db $05,$10,$E4,$03,$0C               ;0DA376|        |      ;
                       db $11,$E6,$14,$10,$C4               ;0DA37B|        |      ;
                       db $02,$F0,$11,$C6,$F8               ;0DA380|        |      ;
                       db $11,$C8,$00                       ;0DA385|        |      ;
 
  miscSpriteAssemb_56: db $08,$10,$E8,$03,$08               ;0DA388|        |      ;
                       db $11,$EA,$10,$F0,$CC               ;0DA38D|        |      ;
                       db $02,$00,$F1,$CE,$08               ;0DA392|        |      ;
                       db $11,$D0,$F0,$11,$D2               ;0DA397|        |      ;
                       db $F8,$11,$D4,$00,$11               ;0DA39C|        |      ;
                       db $D6,$08                           ;0DA3A1|        |      ;
 
  miscSpriteAssemb_58: db $08,$10,$E8,$03,$00               ;0DA3A3|        |      ;
                       db $11,$EA,$08,$F0,$D8               ;0DA3A8|        |      ;
                       db $02,$F0,$F1,$DA,$F8               ;0DA3AD|        |      ;
                       db $F1,$DC,$00,$11,$DE               ;0DA3B2|        |      ;
                       db $F0,$11,$E0,$F8,$11               ;0DA3B7|        |      ;
                       db $E2,$00                           ;0DA3BC|        |      ;
 
  miscSpriteAssemb_5A: db $07,$E0,$F0,$02,$00               ;0DA3BE|        |      ;
                       db $DD,$80,$F1,$E1,$E6               ;0DA3C3|        |      ;
                       db $F9,$E1,$E8,$01,$01               ;0DA3C8|        |      ;
                       db $EA,$F0,$01,$EC,$F8               ;0DA3CD|        |      ;
                       db $01,$8A,$00                       ;0DA3D2|        |      ;
 
  miscSpriteAssemb_5C: db $07,$E0,$FA,$02,$EE               ;0DA3D5|        |      ;
                       db $E1,$FC,$F6,$E1,$84               ;0DA3DA|        |      ;
                       db $FE,$F1,$EE,$E6,$01               ;0DA3DF|        |      ;
                       db $EA,$F0,$01,$EC,$F8               ;0DA3E4|        |      ;
                       db $01,$8A,$00                       ;0DA3E9|        |      ;
 
  miscSpriteAssemb_5E: db $0A,$F8,$C2,$43,$E9               ;0DA3EC|        |      ;
                       db $F9,$C0,$F1,$D2,$80               ;0DA3F1|        |      ;
                       db $02,$F1,$D3,$82,$F9               ;0DA3F6|        |      ;
                       db $D3,$84,$01,$F1,$BC               ;0DA3FB|        |      ;
                       db $F9,$F1,$BE,$01,$11               ;0DA400|        |      ;
                       db $A4,$F8,$11,$A6,$00               ;0DA405|        |      ;
                       db $11,$A8,$08                       ;0DA40A|        |      ;
 
  miscSpriteAssemb_60: db $0B,$00,$C0,$03,$00               ;0DA40D|        |      ;
                       db $01,$C2,$08,$E2,$80               ;0DA412|        |      ;
                       db $02,$F0,$E3,$82,$F8               ;0DA417|        |      ;
                       db $E3,$84,$00,$01,$9E               ;0DA41C|        |      ;
                       db $E8,$01,$A0,$F0,$01               ;0DA421|        |      ;
                       db $A2,$F8,$21,$B6,$F3               ;0DA426|        |      ;
                       db $21,$B8,$FB,$21,$BA               ;0DA42B|        |      ;
                       db $03                               ;0DA430|        |      ;
 
  miscSpriteAssemb_62: db $09,$E0,$CA,$02,$F4               ;0DA431|        |      ;
                       db $E1,$CC,$FC,$E1,$CA               ;0DA436|        |      ;
                       db $04,$01,$CE,$F4,$01               ;0DA43B|        |      ;
                       db $D4,$FC,$01,$CE,$04               ;0DA440|        |      ;
                       db $21,$D0,$F4,$21,$D2               ;0DA445|        |      ;
                       db $FC,$21,$D0,$04                   ;0DA44A|        |      ;
 
  miscSpriteAssemb_64: db $09,$E0,$CA,$02,$F4               ;0DA44E|        |      ;
                       db $E1,$CC,$FC,$E1,$CA               ;0DA453|        |      ;
                       db $04,$01,$CE,$F4,$01               ;0DA458|        |      ;
                       db $D6,$FC,$01,$CE,$04               ;0DA45D|        |      ;
                       db $21,$D0,$F4,$21,$D2               ;0DA462|        |      ;
                       db $FC,$21,$D0,$04                   ;0DA467|        |      ;
 
  miscSpriteAssemb_66: db $09,$E0,$CA,$02,$F4               ;0DA46B|        |      ;
                       db $E1,$CC,$FC,$E1,$CA               ;0DA470|        |      ;
                       db $04,$01,$CE,$F4,$01               ;0DA475|        |      ;
                       db $D8,$FC,$01,$CE,$04               ;0DA47A|        |      ;
                       db $21,$D0,$F4,$21,$D2               ;0DA47F|        |      ;
                       db $FC,$21,$D0,$04                   ;0DA484|        |      ;
 
  miscSpriteAssemb_68: db $15,$C0,$80,$02,$E8               ;0DA488|        |      ;
                       db $C1,$82,$F0,$C1,$84               ;0DA48D|        |      ;
                       db $F8,$C1,$86,$00,$C1               ;0DA492|        |      ;
                       db $88,$08,$C1,$8A,$10               ;0DA497|        |      ;
                       db $E1,$8C,$E8,$E1,$8E               ;0DA49C|        |      ;
                       db $F0,$E1,$90,$F8,$E1               ;0DA4A1|        |      ;
                       db $92,$00,$E1,$94,$08               ;0DA4A6|        |      ;
                       db $E1,$96,$10,$01,$98               ;0DA4AB|        |      ;
                       db $E8,$01,$9A,$F0,$01               ;0DA4B0|        |      ;
                       db $9C,$F8,$01,$9E,$00               ;0DA4B5|        |      ;
                       db $01,$A0,$08,$01,$A2               ;0DA4BA|        |      ;
                       db $10,$21,$A4,$EE,$21               ;0DA4BF|        |      ;
                       db $A6,$F6,$21,$A8,$FE               ;0DA4C4|        |      ;
 
  miscSpriteAssemb_6A: db $11,$C0,$AA,$02,$F0               ;0DA4C9|        |      ;
                       db $C1,$84,$F8,$C1,$AC               ;0DA4CE|        |      ;
                       db $00,$C1,$AE,$08,$E1               ;0DA4D3|        |      ;
                       db $8C,$E8,$E1,$8E,$F0               ;0DA4D8|        |      ;
                       db $E1,$90,$F8,$E1,$92               ;0DA4DD|        |      ;
                       db $00,$E1,$B0,$08,$01               ;0DA4E2|        |      ;
                       db $98,$E8,$01,$9A,$F0               ;0DA4E7|        |      ;
                       db $01,$9C,$F8,$01,$9E               ;0DA4EC|        |      ;
                       db $00,$01,$B2,$08,$21               ;0DA4F1|        |      ;
                       db $A4,$EE,$21,$A6,$F6               ;0DA4F6|        |      ;
                       db $21,$A8,$FE                       ;0DA4FB|        |      ;
 
  miscSpriteAssemb_6C: db $10,$C0,$B4,$02,$F0               ;0DA4FE|        |      ;
                       db $C1,$B6,$F8,$C1,$B8               ;0DA503|        |      ;
                       db $00,$E1,$8C,$E8,$E1               ;0DA508|        |      ;
                       db $8E,$F0,$E1,$90,$F8               ;0DA50D|        |      ;
                       db $E1,$92,$00,$E1,$BA               ;0DA512|        |      ;
                       db $08,$01,$98,$E8,$01               ;0DA517|        |      ;
                       db $9A,$F0,$01,$9C,$F8               ;0DA51C|        |      ;
                       db $01,$9E,$00,$01,$A0               ;0DA521|        |      ;
                       db $08,$21,$A4,$EE,$21               ;0DA526|        |      ;
                       db $A6,$F6,$21,$A8,$FE               ;0DA52B|        |      ;
 
  miscSpriteAssemb_70: db $15,$D0,$80,$02,$E8               ;0DA530|        |      ;
                       db $D1,$82,$F0,$D1,$84               ;0DA535|        |      ;
                       db $F8,$D1,$86,$00,$D1               ;0DA53A|        |      ;
                       db $88,$08,$D1,$8A,$10               ;0DA53F|        |      ;
                       db $F1,$8C,$E8,$F1,$8E               ;0DA544|        |      ;
                       db $F0,$F1,$90,$F8,$F1               ;0DA549|        |      ;
                       db $92,$00,$F1,$94,$08               ;0DA54E|        |      ;
                       db $F1,$96,$10,$11,$BC               ;0DA553|        |      ;
                       db $E8,$11,$BE,$F0,$11               ;0DA558|        |      ;
                       db $C0,$F8,$11,$C2,$00               ;0DA55D|        |      ;
                       db $11,$A0,$08,$11,$A2               ;0DA562|        |      ;
                       db $10,$31,$C4,$F0,$31               ;0DA567|        |      ;
                       db $C6,$F8,$31,$C8,$00               ;0DA56C|        |      ;
 
  miscSpriteAssemb_AA: db $0D,$C0,$B4,$02,$F0               ;0DA571|        |      ;
                       db $C1,$B6,$F8,$C1,$B8               ;0DA576|        |      ;
                       db $00,$E1,$8C,$E8,$E1               ;0DA57B|        |      ;
                       db $8E,$F0,$E1,$90,$F8               ;0DA580|        |      ;
                       db $E1,$92,$00,$E1,$B4               ;0DA585|        |      ;
                       db $08,$01,$98,$E8,$01               ;0DA58A|        |      ;
                       db $9A,$F0,$01,$9C,$F8               ;0DA58F|        |      ;
                       db $01,$9E,$00,$01,$A0               ;0DA594|        |      ;
                       db $08                               ;0DA599|        |      ;
 
  miscSpriteAssemb_72: db $02,$D0,$F0,$01,$FC               ;0DA59A|        |      ;
                       db $F1,$F2,$FC                       ;0DA59F|        |      ;
 
  miscSpriteAssemb_74: db $03,$D0,$F4,$01,$FC               ;0DA5A2|        |      ;
                       db $F1,$F6,$F8,$F0,$F6               ;0DA5A7|        |      ;
                       db $41,$00                           ;0DA5AC|        |      ;
 
  miscSpriteAssemb_76: db $03,$D0,$F8,$01,$FC               ;0DA5AE|        |      ;
                       db $F1,$FA,$F8,$F0,$FA               ;0DA5B3|        |      ;
                       db $41,$00                           ;0DA5B8|        |      ;
 
  miscSpriteAssemb_AC: db $03,$F0,$F8,$81,$FC               ;0DA5BA|        |      ;
                       db $D1,$FA,$F8,$D0,$FA               ;0DA5BF|        |      ;
                       db $C1,$00                           ;0DA5C4|        |      ;
 
  miscSpriteAssemb_78: db $01,$F0,$FC,$01,$FC               ;0DA5C6|        |      ;
 
  miscSpriteAssemb_7A: db $06,$D0,$C0,$02,$FE               ;0DA5CB|        |      ;
                       db $F1,$C2,$F0,$F1,$C4               ;0DA5D0|        |      ;
                       db $F8,$F1,$C6,$00,$11               ;0DA5D5|        |      ;
                       db $C8,$FB,$11,$CA,$03               ;0DA5DA|        |      ;
 
  miscSpriteAssemb_7C: db $05,$D0,$C0,$02,$FF               ;0DA5DF|        |      ;
                       db $F1,$CC,$F8,$F1,$CE               ;0DA5E4|        |      ;
                       db $00,$11,$D0,$F8,$11               ;0DA5E9|        |      ;
                       db $D2,$00                           ;0DA5EE|        |      ;
 
  miscSpriteAssemb_7E: db $05,$D2,$C0,$02,$FF               ;0DA5F0|        |      ;
                       db $F1,$D4,$F8,$F1,$D6               ;0DA5F5|        |      ;
                       db $00,$11,$D8,$FC,$11               ;0DA5FA|        |      ;
                       db $DA,$04                           ;0DA5FF|        |      ;
 
  miscSpriteAssemb_80: db $07,$D0,$DE,$02,$F8               ;0DA601|        |      ;
                       db $D1,$DC,$00,$E1,$DC               ;0DA606|        |      ;
                       db $F0,$F1,$DC,$F8,$F1               ;0DA60B|        |      ;
                       db $DE,$00,$11,$C8,$FB               ;0DA610|        |      ;
                       db $11,$CA,$03                       ;0DA615|        |      ;
 
  miscSpriteAssemb_82: db $06,$F0,$DC,$82,$F8               ;0DA618|        |      ;
                       db $F1,$DC,$00,$F1,$DE               ;0DA61D|        |      ;
                       db $08,$01,$DE,$F0,$11               ;0DA622|        |      ;
                       db $C8,$FB,$11,$CA,$03               ;0DA627|        |      ;
 
  miscSpriteAssemb_84: db $04,$10,$DE,$02,$F0               ;0DA62C|        |      ;
                       db $11,$D4,$F8,$11,$D6               ;0DA631|        |      ;
                       db $00,$11,$DC,$08                   ;0DA636|        |      ;
 
  miscSpriteAssemb_86: db $04,$10,$E0,$02,$F0               ;0DA63A|        |      ;
                       db $11,$E2,$F8,$10,$E2               ;0DA63F|        |      ;
                       db $41,$00,$11,$E0,$08               ;0DA644|        |      ;
 
  miscSpriteAssemb_88: db $02,$F0,$EA,$02,$F8               ;0DA649|        |      ;
                       db $F1,$EC,$00                       ;0DA64E|        |      ;
 
  miscSpriteAssemb_8A: db $02,$F0,$EE,$02,$F8               ;0DA651|        |      ;
                       db $F0,$EC,$82,$00                   ;0DA656|        |      ;
 
  miscSpriteAssemb_8C: db $05,$D0,$B6,$01,$E8               ;0DA65A|        |      ;
                       db $E0,$AE,$02,$E4,$E1               ;0DA65F|        |      ;
                       db $B0,$EC,$F1,$B2,$F4               ;0DA664|        |      ;
                       db $11,$B4,$F4                       ;0DA669|        |      ;
 
  miscSpriteAssemb_8E: db $08,$D2,$C6,$01,$FD               ;0DA66C|        |      ;
                       db $E0,$B8,$02,$F0,$E1               ;0DA671|        |      ;
                       db $BA,$F8,$E1,$BC,$00               ;0DA676|        |      ;
                       db $01,$BE,$F4,$01,$C0               ;0DA67B|        |      ;
                       db $FC,$11,$C2,$F4,$11               ;0DA680|        |      ;
                       db $C4,$FC                           ;0DA685|        |      ;
 
  miscSpriteAssemb_90: db $0A,$CE,$AC,$01,$FC               ;0DA687|        |      ;
                       db $D0,$80,$02,$F4,$D1               ;0DA68C|        |      ;
                       db $82,$FC,$D1,$84,$04               ;0DA691|        |      ;
                       db $F1,$86,$F4,$F1,$88               ;0DA696|        |      ;
                       db $FC,$F1,$8A,$04,$11               ;0DA69B|        |      ;
                       db $8C,$F4,$11,$8E,$FC               ;0DA6A0|        |      ;
                       db $11,$90,$04                       ;0DA6A5|        |      ;
 
  miscSpriteAssemb_92: db $0A,$CE,$AC,$01,$FC               ;0DA6A8|        |      ;
                       db $D0,$80,$02,$F4,$D1               ;0DA6AD|        |      ;
                       db $92,$FC,$D1,$84,$04               ;0DA6B2|        |      ;
                       db $F1,$86,$F4,$F1,$94               ;0DA6B7|        |      ;
                       db $FC,$F1,$8A,$04,$11               ;0DA6BC|        |      ;
                       db $8C,$F4,$11,$96,$FC               ;0DA6C1|        |      ;
                       db $11,$98,$04                       ;0DA6C6|        |      ;
 
  miscSpriteAssemb_94: db $0E,$CE,$AC,$01,$FC               ;0DA6C9|        |      ;
                       db $D0,$80,$02,$F4,$D1               ;0DA6CE|        |      ;
                       db $92,$FC,$D1,$9C,$04               ;0DA6D3|        |      ;
                       db $F1,$86,$F4,$F1,$A0               ;0DA6D8|        |      ;
                       db $FC,$F1,$A2,$04,$11               ;0DA6DD|        |      ;
                       db $8C,$F4,$11,$A6,$FC               ;0DA6E2|        |      ;
                       db $11,$A8,$04,$B1,$9A               ;0DA6E7|        |      ;
                       db $04,$D1,$9E,$04,$F1               ;0DA6EC|        |      ;
                       db $A4,$04,$11,$AA,$04               ;0DA6F1|        |      ;
 
  miscSpriteAssemb_96: db $02,$F0,$C8,$03,$F8               ;0DA6F6|        |      ;
                       db $F1,$CA,$00                       ;0DA6FB|        |      ;
 
  miscSpriteAssemb_98: db $02,$F0,$E0,$03,$F8               ;0DA6FE|        |      ;
                       db $F1,$E2,$00                       ;0DA703|        |      ;
 
  miscSpriteAssemb_9A: db $03,$D0,$E4,$03,$FC               ;0DA706|        |      ;
                       db $F1,$E6,$F8,$F0,$E6               ;0DA70B|        |      ;
                       db $C3,$00                           ;0DA710|        |      ;
 
  miscSpriteAssemb_9C: db $07,$90,$E4,$43,$FC               ;0DA712|        |      ;
                       db $B0,$E6,$03,$F8,$D1               ;0DA717|        |      ;
                       db $E8,$F8,$11,$EA,$F8               ;0DA71C|        |      ;
                       db $B0,$E6,$C3,$00,$D1               ;0DA721|        |      ;
                       db $E8,$00,$11,$EA,$00               ;0DA726|        |      ;
 
  miscSpriteAssemb_9E: db $0B,$B0,$E4,$03,$FC               ;0DA72B|        |      ;
                       db $D1,$E6,$F8,$F1,$E8               ;0DA730|        |      ;
                       db $F8,$11,$EA,$F8,$31               ;0DA735|        |      ;
                       db $EA,$F8,$51,$EA,$F8               ;0DA73A|        |      ;
                       db $D0,$E6,$C3,$00,$F1               ;0DA73F|        |      ;
                       db $E8,$00,$11,$EA,$00               ;0DA744|        |      ;
                       db $31,$EA,$00,$51,$EA               ;0DA749|        |      ;
                       db $00                               ;0DA74E|        |      ;
 
  miscSpriteAssemb_A0: db $0D,$90,$E4,$03,$FC               ;0DA74F|        |      ;
                       db $B1,$E6,$F8,$D1,$E8               ;0DA754|        |      ;
                       db $F8,$F1,$E8,$F8,$11               ;0DA759|        |      ;
                       db $EA,$F8,$31,$EA,$F8               ;0DA75E|        |      ;
                       db $51,$EA,$F8,$B0,$E6               ;0DA763|        |      ;
                       db $C3,$00,$D1,$E8,$00               ;0DA768|        |      ;
                       db $F1,$E8,$00,$11,$EA               ;0DA76D|        |      ;
                       db $00,$31,$EA,$00,$51               ;0DA772|        |      ;
                       db $EA,$00                           ;0DA777|        |      ;
 
  miscSpriteAssemb_A2: db $01,$F0,$CC,$03,$FC               ;0DA779|        |      ;
 
  miscSpriteAssemb_A4: db $02,$D0,$CE,$03,$FC               ;0DA77E|        |      ;
                       db $F1,$D0,$FC                       ;0DA783|        |      ;
 
  miscSpriteAssemb_A6: db $03,$B0,$CE,$03,$FC               ;0DA786|        |      ;
                       db $D1,$D0,$FC,$F1,$D2               ;0DA78B|        |      ;
                       db $FC                               ;0DA790|        |      ;
 
  miscSpriteAssemb_A8: db $04,$90,$CE,$03,$FC               ;0DA791|        |      ;
                       db $B1,$D0,$FC,$D1,$D2               ;0DA796|        |      ;
                       db $FC,$F1,$D4,$FC                   ;0DA79B|        |      ;
 
  miscSpriteAssemb_AE: db $10,$C0,$80,$02,$F8               ;0DA79F|        |      ;
                       db $C1,$82,$00,$C1,$84               ;0DA7A4|        |      ;
                       db $08,$E1,$8A,$F0,$E1               ;0DA7A9|        |      ;
                       db $8C,$F8,$E1,$8E,$00               ;0DA7AE|        |      ;
                       db $E1,$90,$08,$01,$92               ;0DA7B3|        |      ;
                       db $F0,$01,$94,$F8,$01               ;0DA7B8|        |      ;
                       db $96,$00,$01,$98,$08               ;0DA7BD|        |      ;
                       db $21,$9A,$F5,$21,$9C               ;0DA7C2|        |      ;
                       db $FD,$21,$9E,$FB,$C2               ;0DA7C7|        |      ;
                       db $86,$01,$10,$CD,$88               ;0DA7CC|        |      ;
                       db $18                               ;0DA7D1|        |      ;
 
  miscSpriteAssemb_B0: db $10,$C0,$80,$02,$F8               ;0DA7D2|        |      ;
                       db $C1,$82,$00,$C1,$84               ;0DA7D7|        |      ;
                       db $08,$E1,$A0,$F0,$E1               ;0DA7DC|        |      ;
                       db $A2,$F8,$E1,$A4,$00               ;0DA7E1|        |      ;
                       db $E1,$A6,$08,$01,$A8               ;0DA7E6|        |      ;
                       db $F0,$01,$AA,$F8,$01               ;0DA7EB|        |      ;
                       db $AC,$00,$01,$AE,$08               ;0DA7F0|        |      ;
                       db $21,$B0,$F0,$21,$B2               ;0DA7F5|        |      ;
                       db $F8,$21,$B4,$00,$C2               ;0DA7FA|        |      ;
                       db $86,$01,$10,$CD,$88               ;0DA7FF|        |      ;
                       db $18                               ;0DA804|        |      ;
 
  miscSpriteAssemb_B2: db $12,$C0,$80,$02,$F8               ;0DA805|        |      ;
                       db $C1,$82,$00,$C1,$84               ;0DA80A|        |      ;
                       db $08,$FD,$B6,$E8,$E1               ;0DA80F|        |      ;
                       db $BA,$F0,$E1,$BC,$F8               ;0DA814|        |      ;
                       db $E1,$BE,$00,$E1,$C0               ;0DA819|        |      ;
                       db $08,$1D,$B8,$E8,$01               ;0DA81E|        |      ;
                       db $C2,$F0,$01,$C4,$F8               ;0DA823|        |      ;
                       db $01,$C6,$00,$01,$C8               ;0DA828|        |      ;
                       db $08,$21,$CA,$F0,$21               ;0DA82D|        |      ;
                       db $CC,$F8,$21,$CE,$00               ;0DA832|        |      ;
                       db $C2,$86,$01,$10,$CD               ;0DA837|        |      ;
                       db $88,$18                           ;0DA83C|        |      ;
 
  miscSpriteAssemb_B4: db $10,$C0,$80,$02,$F8               ;0DA83E|        |      ;
                       db $C1,$82,$00,$C1,$D0               ;0DA843|        |      ;
                       db $08,$E1,$D2,$F0,$E1               ;0DA848|        |      ;
                       db $D4,$F8,$E1,$D6,$00               ;0DA84D|        |      ;
                       db $E1,$90,$08,$01,$D8               ;0DA852|        |      ;
                       db $F0,$01,$DA,$F8,$01               ;0DA857|        |      ;
                       db $96,$00,$01,$98,$08               ;0DA85C|        |      ;
                       db $21,$E0,$F5,$21,$9C               ;0DA861|        |      ;
                       db $FD,$21,$9E,$05,$20               ;0DA866|        |      ;
                       db $DC,$01,$E5,$21,$DE               ;0DA86B|        |      ;
 
                       db $ED                               ;0DA870|        |      ;
 
  miscSpriteAssemb_B6: db $11,$C0,$80,$02,$F8               ;0DA871|        |      ;
                       db $C1,$82,$00,$C1,$D0               ;0DA876|        |      ;
                       db $08,$E1,$E2,$D8,$E1               ;0DA87B|        |      ;
                       db $E4,$E0,$E9,$E6,$E8               ;0DA880|        |      ;
                       db $E1,$E8,$F0,$E1,$EA               ;0DA885|        |      ;
                       db $F8,$E1,$D6,$00,$E1               ;0DA88A|        |      ;
                       db $A6,$08,$01,$EC,$F0               ;0DA88F|        |      ;
                       db $01,$EE,$F8,$01,$AC               ;0DA894|        |      ;
                       db $00,$01,$AE,$08,$21               ;0DA899|        |      ;
                       db $B0,$F0,$21,$B2,$F8               ;0DA89E|        |      ;
                       db $21,$B4,$00                       ;0DA8A3|        |      ;
 
  miscSpriteAssemb_B8: db $02,$F0,$F6,$C3,$F8               ;0DA8A6|        |      ;
                       db $F1,$F4,$00                       ;0DA8AB|        |      ;
 
  miscSpriteAssemb_BA: db $02,$F0,$F0,$03,$F8               ;0DA8AE|        |      ;
                       db $F1,$F2,$00                       ;0DA8B3|        |      ;
 
  miscSpriteAssemb_BC: db $02,$F0,$F4,$03,$F8               ;0DA8B6|        |      ;
                       db $F1,$F6,$00                       ;0DA8BB|        |      ;
 
  miscSpriteAssemb_BE: db $02,$F0,$F2,$C3,$F8               ;0DA8BE|        |      ;
                       db $F1,$F0,$00                       ;0DA8C3|        |      ;
 
  miscSpriteAssemb_C0: db $03,$E0,$80,$02,$F8               ;0DA8C6|        |      ;
                       db $01,$82,$F8,$01,$84               ;0DA8CB|        |      ;
                       db $00                               ;0DA8D0|        |      ;
 
  miscSpriteAssemb_C2: db $03,$E0,$A0,$02,$F8               ;0DA8D1|        |      ;
                       db $01,$A2,$F8,$01,$A4               ;0DA8D6|        |      ;
                       db $00                               ;0DA8DB|        |      ;
 
  miscSpriteAssemb_C4: db $03,$E0,$C0,$01,$F8               ;0DA8DC|        |      ;
                       db $01,$C2,$F8,$01,$C4               ;0DA8E1|        |      ;
                       db $00                               ;0DA8E6|        |      ;
 
  miscSpriteAssemb_C6: db $03,$E0,$86,$02,$F8               ;0DA8E7|        |      ;
                       db $01,$88,$F8,$01,$8A               ;0DA8EC|        |      ;
                       db $00                               ;0DA8F1|        |      ;
 
  miscSpriteAssemb_C8: db $03,$E0,$A6,$02,$F8               ;0DA8F2|        |      ;
                       db $01,$A8,$F8,$01,$AA               ;0DA8F7|        |      ;
                       db $00                               ;0DA8FC|        |      ;
 
  miscSpriteAssemb_CA: db $03,$E0,$C6,$01,$F8               ;0DA8FD|        |      ;
                       db $01,$C8,$F8,$01,$CA               ;0DA902|        |      ;
                       db $00                               ;0DA907|        |      ;
 
  miscSpriteAssemb_CC: db $04,$E0,$8C,$02,$F8               ;0DA908|        |      ;
                       db $E1,$90,$00,$01,$8E               ;0DA90D|        |      ;
                       db $F8,$01,$92,$00                   ;0DA912|        |      ;
 
  miscSpriteAssemb_CE: db $04,$E0,$DE,$02,$F8               ;0DA916|        |      ;
                       db $E1,$B0,$00,$01,$AE               ;0DA91B|        |      ;
                       db $F8,$01,$B2,$00                   ;0DA920|        |      ;
 
  miscSpriteAssemb_D0: db $04,$E0,$CC,$01,$F8               ;0DA924|        |      ;
                       db $E1,$CE,$00,$01,$8E               ;0DA929|        |      ;
                       db $F8,$01,$92,$00                   ;0DA92E|        |      ;
 
  miscSpriteAssemb_D2: db $04,$F0,$94,$03,$F0               ;0DA932|        |      ;
                       db $F1,$96,$F8,$F0,$96               ;0DA937|        |      ;
                       db $43,$00,$F1,$94,$08               ;0DA93C|        |      ;
 
  miscSpriteAssemb_D4: db $04,$F0,$98,$03,$F0               ;0DA941|        |      ;
                       db $F1,$9A,$F8,$F0,$9A               ;0DA946|        |      ;
                       db $43,$00,$F1,$98,$08               ;0DA94B|        |      ;
 
  miscSpriteAssemb_D6: db $01,$F0,$9C,$03,$FC               ;0DA950|        |      ;
 
  miscSpriteAssemb_D8: db $02,$D0,$B4,$03,$FC               ;0DA955|        |      ;
                       db $F1,$B6,$FC                       ;0DA95A|        |      ;
 
  miscSpriteAssemb_DA: db $02,$F0,$B8,$03,$F8               ;0DA95D|        |      ;
                       db $F1,$BA,$00                       ;0DA962|        |      ;
 
  miscSpriteAssemb_DC: db $02,$F0,$BC,$03,$F4               ;0DA965|        |      ;
                       db $F1,$BE,$FC,$F1,$D0               ;0DA96A|        |      ;
                       db $04                               ;0DA96F|        |      ;
 
  miscSpriteAssemb_DE: db $02,$F0,$D2,$03,$F4               ;0DA970|        |      ;
                       db $F1,$D4,$FC,$F0,$D2               ;0DA975|        |      ;
                       db $43,$04                           ;0DA97A|        |      ;
 
  miscSpriteAssemb_E0: db $01,$F0,$EC,$01,$00               ;0DA97C|        |      ;
 
  miscSpriteAssemb_E2: db $02,$F0,$EE,$01,$F8               ;0DA981|        |      ;
                       db $F1,$F0,$00                       ;0DA986|        |      ;
 
  miscSpriteAssemb_E4: db $02,$F0,$D6,$01,$F8               ;0DA989|        |      ;
                       db $F0,$D6,$41,$00                   ;0DA98E|        |      ;
 
  miscSpriteAssemb_E6: db $02,$F0,$D8,$01,$F8               ;0DA992|        |      ;
                       db $F0,$D8,$41,$00                   ;0DA997|        |      ;
 
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
 
         DATA8_0DA9F0: db $06,$DA,$C8,$43,$01               ;0DA9F0|        |      ;
                       db $F9,$D4,$F1,$FC,$EC               ;0DA9F5|        |      ;
                       db $83,$01,$E8,$D6,$03               ;0DA9FA|        |      ;
                       db $F9,$09,$C8,$F9,$13               ;0DA9FF|        |      ;
                       db $C8,$09                           ;0DAA04|        |      ;
 
         DATA8_0DAA06: db $03,$E0,$E8,$03,$00               ;0DAA06|        |      ;
                       db $01,$E4,$F8,$01,$E6               ;0DAA0B|        |      ;
                       db $00                               ;0DAA10|        |      ;
 
         DATA8_0DAA11: db $03,$F4,$D4,$03,$00               ;0DAA11|        |      ;
                       db $FB,$D8,$F8,$FA,$C2               ;0DAA16|        |      ;
                       db $C3,$00                           ;0DAA1B|        |      ;
 
         DATA8_0DAA1D: db $09,$D8,$C6,$C3,$F1               ;0DAA1D|        |      ;
                       db $DF,$C6,$F9,$E0,$CE               ;0DAA22|        |      ;
                       db $43,$01,$DF,$C6,$09               ;0DAA27|        |      ;
                       db $01,$C2,$F9,$EE,$DA               ;0DAA2C|        |      ;
                       db $03,$E9,$FF,$C6,$F1               ;0DAA31|        |      ;
                       db $FF,$C8,$01,$01,$DC               ;0DAA36|        |      ;
                       db $09                               ;0DAA3B|        |      ;
 
         DATA8_0DAA3C: db $03,$EE,$C8,$03,$F6               ;0DAA3C|        |      ;
                       db $FF,$C2,$06,$E2,$C2               ;0DAA41|        |      ;
                       db $C3,$FE                           ;0DAA46|        |      ;
 
         DATA8_0DAA48: db $0C,$D0,$84,$03,$F8               ;0DAA48|        |      ;
                       db $D1,$86,$00,$E1,$82               ;0DAA4D|        |      ;
                       db $F0,$F1,$8E,$F8,$F1               ;0DAA52|        |      ;
                       db $90,$00,$E1,$88,$08               ;0DAA57|        |      ;
                       db $EF,$8A,$10,$FB,$80               ;0DAA5C|        |      ;
                       db $E8,$01,$8C,$F0,$11               ;0DAA61|        |      ;
                       db $94,$F8,$11,$96,$00               ;0DAA66|        |      ;
                       db $01,$92,$08                       ;0DAA6B|        |      ;
 
         DATA8_0DAA6E: db $0C,$D0,$A0,$03,$F8               ;0DAA6E|        |      ;
                       db $D1,$A2,$00,$E1,$9A               ;0DAA73|        |      ;
                       db $F0,$F1,$BC,$F8,$F1               ;0DAA78|        |      ;
                       db $BE,$00,$E1,$A4,$08               ;0DAA7D|        |      ;
                       db $EF,$8A,$10,$FB,$98               ;0DAA82|        |      ;
                       db $E8,$01,$A6,$F0,$11               ;0DAA87|        |      ;
                       db $A8,$F8,$11,$96,$00               ;0DAA8C|        |      ;
                       db $01,$92,$08                       ;0DAA91|        |      ;
 
         DATA8_0DAA94: db $02,$DE,$E8,$43,$FE               ;0DAA94|        |      ;
                       db $FE,$EA,$03,$FD                   ;0DAA99|        |      ;
 
         DATA8_0DAA9D: db $04,$E8,$E2,$03,$EF               ;0DAA9D|        |      ;
                       db $F1,$CA,$F7,$F1,$E0               ;0DAAA2|        |      ;
                       db $FF,$09,$CA,$07                   ;0DAAA7|        |      ;
 
         DATA8_0DAAAB: db $06,$CE,$C6,$C3,$F8               ;0DAAAB|        |      ;
                       db $E0,$C6,$43,$00,$E6               ;0DAAB0|        |      ;
                       db $DA,$03,$F0,$F7,$C8               ;0DAAB5|        |      ;
                       db $F8,$03,$C6,$00,$03               ;0DAABA|        |      ;
                       db $C4,$08                           ;0DAABF|        |      ;
 
         DATA8_0DAAC1: db $06,$00,$C8,$43,$E9               ;0DAAC1|        |      ;
                       db $01,$C2,$F1,$01,$EC               ;0DAAC6|        |      ;
                       db $F9,$F5,$C8,$01,$F3               ;0DAACB|        |      ;
                       db $C2,$09,$EF,$EC,$11               ;0DAAD0|        |      ;
 
         DATA8_0DAAD5: db $03,$FC,$C2,$43,$F6               ;0DAAD5|        |      ;
                       db $F2,$C4,$03,$FE,$E5               ;0DAADA|        |      ;
                       db $DE,$06                           ;0DAADF|        |      ;
 
         DATA8_0DAAE1: db $09,$D4,$EC,$C3,$E4               ;0DAAE1|        |      ;
                       db $F6,$C4,$43,$FC,$F3               ;0DAAE6|        |      ;
                       db $C8,$04,$E7,$D2,$0C               ;0DAAEB|        |      ;
                       db $CB,$EC,$04,$F2,$C8               ;0DAAF0|        |      ;
                       db $03,$EC,$F7,$C4,$F4               ;0DAAF5|        |      ;
                       db $D7,$D4,$14,$C7,$CC               ;0DAAFA|        |      ;
                       db $0C                               ;0DAAFF|        |      ;
 
         DATA8_0DAB00: db $04,$E0,$40,$00,$F8               ;0DAB00|        |      ;
                       db $E1,$42,$00,$01,$44               ;0DAB05|        |      ;
                       db $F8,$01,$46,$00                   ;0DAB0A|        |      ;
 
         DATA8_0DAB0E: db $04,$E0,$48,$00,$F8               ;0DAB0E|        |      ;
                       db $E1,$4A,$00,$01,$4C               ;0DAB13|        |      ;
                       db $F8,$01,$4E,$00                   ;0DAB18|        |      ;
 
         DATA8_0DAB1C: db $04,$E0,$50,$00,$F8               ;0DAB1C|        |      ;
                       db $E1,$52,$00,$01,$54               ;0DAB21|        |      ;
                       db $F8,$01,$56,$00                   ;0DAB26|        |      ;
 
         DATA8_0DAB2A: db $04,$E0,$40,$00,$F4               ;0DAB2A|        |      ;
                       db $E1,$42,$FC,$01,$44               ;0DAB2F|        |      ;
                       db $F8,$01,$46,$00                   ;0DAB34|        |      ;
 
         DATA8_0DAB38: db $04,$E0,$48,$00,$F5               ;0DAB38|        |      ;
                       db $E1,$4A,$FD,$01,$4C               ;0DAB3D|        |      ;
                       db $F8,$01,$4E,$00                   ;0DAB42|        |      ;
 
         DATA8_0DAB46: db $04,$E0,$50,$00,$F4               ;0DAB46|        |      ;
                       db $E1,$52,$FC,$01,$54               ;0DAB4B|        |      ;
                       db $F8,$01,$56,$00                   ;0DAB50|        |      ;
 
         DATA8_0DAB54: db $05,$C0,$40,$00,$FC               ;0DAB54|        |      ;
                       db $E1,$42,$F8,$E1,$44               ;0DAB59|        |      ;
                       db $00,$01,$46,$F9,$01               ;0DAB5E|        |      ;
                       db $48,$01                           ;0DAB63|        |      ;
 
         DATA8_0DAB65: db $05,$C0,$4A,$00,$FC               ;0DAB65|        |      ;
                       db $E1,$4C,$F8,$E1,$4E               ;0DAB6A|        |      ;
                       db $00,$01,$50,$F8,$01               ;0DAB6F|        |      ;
                       db $52,$00                           ;0DAB74|        |      ;
 
         DATA8_0DAB76: db $05,$C0,$40,$00,$FC               ;0DAB76|        |      ;
                       db $E1,$54,$F8,$E1,$56               ;0DAB7B|        |      ;
                       db $00,$01,$58,$F9,$01               ;0DAB80|        |      ;
                       db $5A,$01                           ;0DAB85|        |      ;
 
         DATA8_0DAB87: db $02,$00,$9C,$02,$00               ;0DAB87|        |      ;
                       db $01,$9E,$08                       ;0DAB8C|        |      ;
 
         DATA8_0DAB8F: db $02,$00,$B8,$02,$00               ;0DAB8F|        |      ;
                       db $01,$BA,$08                       ;0DAB94|        |      ;
 
         DATA8_0DAB97: db $01,$00,$C0,$02,$00               ;0DAB97|        |      ;
 
         DATA8_0DAB9C: db $02,$00,$B0,$03,$F8               ;0DAB9C|        |      ;
                       db $00,$B0,$43,$00                   ;0DABA1|        |      ;
 
         DATA8_0DABA5: db $02,$00,$B2,$03,$F8               ;0DABA5|        |      ;
                       db $00,$B2,$43,$00                   ;0DABAA|        |      ;
 
         DATA8_0DABAE: db $02,$00,$B4,$03,$F8               ;0DABAE|        |      ;
                       db $00,$B4,$43,$00                   ;0DABB3|        |      ;
 
         DATA8_0DABB7: db $02,$02,$B6,$03,$F8               ;0DABB7|        |      ;
                       db $02,$B6,$43,$00                   ;0DABBC|        |      ;
 
         DATA8_0DABC0: db $02,$F0,$6A,$03,$F8               ;0DABC0|        |      ;
                       db $F1,$6C,$00                       ;0DABC5|        |      ;
 
         DATA8_0DABC8: db $01,$F0,$6E,$00,$F8               ;0DABC8|        |      ;
 
         DATA8_0DABCD: db $02,$F0,$15,$23,$F8               ;0DABCD|        |      ;
                       db $F0,$15,$63,$00                   ;0DABD2|        |      ;
 
         DATA8_0DABD6: db $02,$F0,$17,$23,$F8               ;0DABD6|        |      ;
                       db $F0,$17,$63,$00                   ;0DABDB|        |      ;
 
         DATA8_0DABDF: db $02,$F0,$DA,$41,$F8               ;0DABDF|        |      ;
                       db $F1,$D8,$00                       ;0DABE4|        |      ;
 
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
 
         DATA8_0DADCA: db $02,$F0,$B0,$82,$E8               ;0DADCA|        |      ;
                       db $F1,$FC,$F0                       ;0DADCF|        |      ;
 
         DATA8_0DADD2: db $03,$F0,$B0,$02,$E0               ;0DADD2|        |      ;
                       db $F1,$FA,$E8,$F1,$FC               ;0DADD7|        |      ;
                       db $F0                               ;0DADDC|        |      ;
 
         DATA8_0DADDD: db $04,$F0,$B0,$82,$D8               ;0DADDD|        |      ;
                       db $F1,$B4,$E0,$F1,$FA               ;0DADE2|        |      ;
                       db $E8,$F1,$FC,$F0                   ;0DADE7|        |      ;
 
         DATA8_0DADEB: db $05,$F0,$B0,$02,$D0               ;0DADEB|        |      ;
                       db $F1,$B2,$D8,$F1,$B4               ;0DADF0|        |      ;
                       db $E0,$F1,$FA,$E8,$F1               ;0DADF5|        |      ;
                       db $FC,$F0                           ;0DADFA|        |      ;
 
         DATA8_0DADFC: db $05,$F0,$B0,$82,$D0               ;0DADFC|        |      ;
                       db $F1,$B2,$D8,$F1,$B4               ;0DAE01|        |      ;
                       db $E0,$F1,$FA,$E8,$F1               ;0DAE06|        |      ;
                       db $FC,$F0                           ;0DAE0B|        |      ;
 
         DATA8_0DAE0D: db $02,$F0,$B0,$02,$F0               ;0DAE0D|        |      ;
                       db $F1,$FC,$F8                       ;0DAE12|        |      ;
 
         DATA8_0DAE15: db $02,$E8,$41,$03,$F8               ;0DAE15|        |      ;
                       db $E9,$43,$00                       ;0DAE1A|        |      ;
 
         DATA8_0DAE1D: db $02,$F0,$45,$03,$F8               ;0DAE1D|        |      ;
                       db $F1,$47,$00                       ;0DAE22|        |      ;
 
         DATA8_0DAE25: db $02,$F8,$49,$03,$F8               ;0DAE25|        |      ;
                       db $F9,$4B,$00                       ;0DAE2A|        |      ;
 
         DATA8_0DAE2D: db $01,$F0,$DA,$03,$FC               ;0DAE2D|        |      ;
 
         DATA8_0DAE32: db $02,$F0,$DC,$03,$F8               ;0DAE32|        |      ;
                       db $F1,$DE,$00                       ;0DAE37|        |      ;
 
         DATA8_0DAE3A: db $02,$F0,$77,$01,$F8               ;0DAE3A|        |      ;
                       db $F1,$79,$00                       ;0DAE3F|        |      ;
 
         DATA8_0DAE42: db $02,$F0,$7B,$01,$F8               ;0DAE42|        |      ;
                       db $F1,$7D,$00                       ;0DAE47|        |      ;
 
         DATA8_0DAE4A: db $04,$E0,$41,$02,$F4               ;0DAE4A|        |      ;
                       db $E1,$43,$FC,$01,$45               ;0DAE4F|        |      ;
                       db $F8,$01,$47,$00                   ;0DAE54|        |      ;
 
         DATA8_0DAE58: db $04,$E2,$55,$02,$F5               ;0DAE58|        |      ;
                       db $E3,$57,$FD,$01,$49               ;0DAE5D|        |      ;
                       db $F8,$01,$4B,$00                   ;0DAE62|        |      ;
 
         DATA8_0DAE66: db $05,$EE,$71,$01,$F4               ;0DAE66|        |      ;
                       db $E3,$61,$FC,$E3,$63               ;0DAE6B|        |      ;
                       db $04,$01,$65,$FC,$01               ;0DAE70|        |      ;
                       db $67,$04                           ;0DAE75|        |      ;
 
         DATA8_0DAE77: db $05,$F0,$71,$01,$F4               ;0DAE77|        |      ;
                       db $E3,$61,$FC,$E3,$63               ;0DAE7C|        |      ;
                       db $04,$01,$69,$FC,$01               ;0DAE81|        |      ;
                       db $6B,$04                           ;0DAE86|        |      ;
 
 
         DATA8_0DAE88: db $05,$EC,$71,$01,$F4               ;0DAE88|        |      ;
                       db $E1,$61,$FC,$E1,$63               ;0DAE8D|        |      ;
                       db $04,$01,$6D,$FC,$01               ;0DAE92|        |      ;
                       db $6F,$04                           ;0DAE97|        |      ;
 
         DATA8_0DAE99: db $04,$F0,$4D,$00,$F0               ;0DAE99|        |      ;
                       db $F1,$5D,$F8,$F1,$6D               ;0DAE9E|        |      ;
                       db $00,$F1,$7D,$08                   ;0DAEA3|        |      ;
 
         DATA8_0DAEA7: db $06,$C0,$05,$03,$F0               ;0DAEA7|        |      ;
                       db $C1,$0F,$F8,$E1,$07               ;0DAEAC|        |      ;
                       db $F0,$E1,$09,$F8,$01               ;0DAEB1|        |      ;
                       db $07,$F0,$01,$09,$F8               ;0DAEB6|        |      ;
 
         DATA8_0DAEBB: db $09,$C0,$0B,$03,$E8               ;0DAEBB|        |      ;
                       db $C1,$0D,$F0,$C1,$0D               ;0DAEC0|        |      ;
                       db $F8,$E1,$09,$E8,$E1               ;0DAEC5|        |      ;
                       db $09,$F0,$E1,$09,$F8               ;0DAECA|        |      ;
                       db $01,$09,$E8,$01,$09               ;0DAECF|        |      ;
                       db $F0,$01,$09,$F8                   ;0DAED4|        |      ;
 
         DATA8_0DAED8: db $02,$F0,$EA,$01,$F8               ;0DAED8|        |      ;
                       db $F1,$EC,$00                       ;0DAEDD|        |      ;
 
         DATA8_0DAEE0: db $02,$F0,$EC,$41,$F8               ;0DAEE0|        |      ;
                       db $F1,$EA,$00                       ;0DAEE5|        |      ;
 
         DATA8_0DAEE8: db $02,$F0,$EC,$C1,$F8               ;0DAEE8|        |      ;
                       db $F1,$EA,$00                       ;0DAEED|        |      ;
 
         DATA8_0DAEF0: db $02,$F0,$EA,$81,$F8               ;0DAEF0|        |      ;
                       db $F1,$EC,$00                       ;0DAEF5|        |      ;
 
         DATA8_0DAEF8: db $01,$F0,$F1,$03,$FC               ;0DAEF8|        |      ;
 
         DATA8_0DAEFD: db $01,$F0,$F3,$03,$FC               ;0DAEFD|        |      ;
 
         DATA8_0DAF02: db $02,$F0,$2B,$01,$F8               ;0DAF02|        |      ;
                       db $F0,$2B,$41,$00                   ;0DAF07|        |      ;
 
         DATA8_0DAF0B: db $02,$F0,$1D,$01,$F8               ;0DAF0B|        |      ;
                       db $F0,$1D,$41,$00                   ;0DAF10|        |      ;
 
         DATA8_0DAF14: db $02,$F0,$1F,$01,$F8               ;0DAF14|        |      ;
                       db $F0,$1F,$41,$00                   ;0DAF19|        |      ;
 
         DATA8_0DAF1D: db $04,$E0,$15,$03,$F8               ;0DAF1D|        |      ;
                       db $E0,$15,$43,$00,$00               ;0DAF22|        |      ;
                       db $19,$01,$F8,$00,$19               ;0DAF27|        |      ;
                       db $41,$00                           ;0DAF2C|        |      ;
 
         DATA8_0DAF2E: db $04,$E0,$17,$03,$F8               ;0DAF2E|        |      ;
                       db $E0,$17,$43,$00,$00               ;0DAF33|        |      ;
                       db $19,$01,$F8,$00,$19               ;0DAF38|        |      ;
                       db $41,$00                           ;0DAF3D|        |      ;
 
         DATA8_0DAF3F: db $02,$00,$15,$03,$F8               ;0DAF3F|        |      ;
                       db $00,$15,$43,$00                   ;0DAF44|        |      ;
 
         DATA8_0DAF48: db $02,$00,$17,$03,$F8               ;0DAF48|        |      ;
                       db $00,$17,$43,$00                   ;0DAF4D|        |      ;
 
         DATA8_0DAF51: db $01,$F0,$25,$03,$FC               ;0DAF51|        |      ;
 
         DATA8_0DAF56: db $02,$F0,$03,$03,$F8               ;0DAF56|        |      ;
                       db $F0,$03,$43,$00                   ;0DAF5B|        |      ;
 
         DATA8_0DAF5F: db $01,$F0,$E1,$03,$FC               ;0DAF5F|        |      ;
 
         DATA8_0DAF64: db $01,$F8,$E3,$03,$FC               ;0DAF64|        |      ;
 
         DATA8_0DAF69: db $04,$F0,$E5,$00,$F0               ;0DAF69|        |      ;
                       db $F1,$E5,$F8,$F1,$E5               ;0DAF6E|        |      ;
                       db $00,$F1,$E5,$08                   ;0DAF73|        |      ;
 
         DATA8_0DAF77: db $02,$F2,$BF,$40,$F8               ;0DAF77|        |      ;
                       db $F3,$BD,$00                       ;0DAF7C|        |      ;
 
         DATA8_0DAF7F: db $01,$F0,$E7,$01,$FC               ;0DAF7F|        |      ;
 
         DATA8_0DAF84: db $05,$E4,$E7,$01,$F8               ;0DAF84|        |      ;
                       db $E5,$E7,$00,$F5,$E7               ;0DAF89|        |      ;
                       db $F8,$F5,$E7,$FD,$F5               ;0DAF8E|        |      ;
                       db $E7,$00                           ;0DAF93|        |      ;
 
         DATA8_0DAF95: db $03,$F8,$E7,$01,$F8               ;0DAF95|        |      ;
                       db $F9,$E7,$FD,$F9,$E7               ;0DAF9A|        |      ;
                       db $00                               ;0DAF9F|        |      ;
 
         DATA8_0DAFA0: db $01,$F0,$E9,$01,$FC               ;0DAFA0|        |      ;
 
         DATA8_0DAFA5: db $02,$F0,$D1,$03,$F8               ;0DAFA5|        |      ;
                       db $F1,$D3,$00                       ;0DAFAA|        |      ;
 
         DATA8_0DAFAD: db $02,$F0,$D5,$00,$F8               ;0DAFAD|        |      ;
                       db $F1,$D7,$00                       ;0DAFB2|        |      ;
 
         DATA8_0DAFB5: db $02,$F0,$D9,$01,$F8               ;0DAFB5|        |      ;
                       db $F1,$DB,$00                       ;0DAFBA|        |      ;
 
         DATA8_0DAFBD: db $02,$F0,$F9,$03,$F8               ;0DAFBD|        |      ;
                       db $F1,$FB,$00                       ;0DAFC2|        |      ;
 
         DATA8_0DAFC5: db $02,$F0,$CD,$01,$F8               ;0DAFC5|        |      ;
                       db $F1,$CF,$00                       ;0DAFCA|        |      ;
 
         DATA8_0DAFCD: db $02,$F0,$C1,$01,$F8               ;0DAFCD|        |      ;
                       db $F1,$C9,$00                       ;0DAFD2|        |      ;
 
         DATA8_0DAFD5: db $02,$F0,$C3,$01,$F8               ;0DAFD5|        |      ;
                       db $F1,$C9,$00                       ;0DAFDA|        |      ;
 
         DATA8_0DAFDD: db $02,$F0,$C5,$01,$F8               ;0DAFDD|        |      ;
                       db $F1,$C9,$00                       ;0DAFE2|        |      ;
 
         DATA8_0DAFE5: db $02,$F0,$C7,$01,$F8               ;0DAFE5|        |      ;
                       db $F1,$C9,$00                       ;0DAFEA|        |      ;
 
         DATA8_0DAFED: db $02,$F0,$C1,$01,$F8               ;0DAFED|        |      ;
                       db $F1,$CB,$00                       ;0DAFF2|        |      ;
 
         DATA8_0DAFF5: db $02,$F0,$C3,$01,$F8               ;0DAFF5|        |      ;
                       db $F1,$CB,$00                       ;0DAFFA|        |      ;
 
         DATA8_0DAFFD: db $02,$F0,$C5,$01,$F8               ;0DAFFD|        |      ;
                       db $F1,$CB,$00                       ;0DB002|        |      ;
 
         DATA8_0DB005: db $02,$F0,$C7,$01,$F8               ;0DB005|        |      ;
                       db $F1,$CB,$00                       ;0DB00A|        |      ;
 
         DATA8_0DB00D: db $03,$F0,$C1,$01,$F4               ;0DB00D|        |      ;
                       db $F1,$CB,$FC,$F1,$C9               ;0DB012|        |      ;
                       db $04                               ;0DB017|        |      ;
 
         DATA8_0DB018: db $02,$F0,$70,$03,$F8               ;0DB018|        |      ;
                       db $F1,$72,$00                       ;0DB01D|        |      ;
 
         DATA8_0DB020: db $02,$F0,$74,$01,$F8               ;0DB020|        |      ;
                       db $F1,$76,$00                       ;0DB025|        |      ;
 
         DATA8_0DB028: db $02,$F0,$11,$01,$F8               ;0DB028|        |      ;
                       db $F1,$13,$00                       ;0DB02D|        |      ;
 
         DATA8_0DB030: db $02,$F0,$21,$01,$F8               ;0DB030|        |      ;
                       db $F1,$23,$00                       ;0DB035|        |      ;
 
         DATA8_0DB038: db $02,$F0,$F5,$03,$F8               ;0DB038|        |      ;
                       db $F0,$F5,$43,$00                   ;0DB03D|        |      ;
 
         DATA8_0DB041: db $02,$F0,$F7,$03,$F8               ;0DB041|        |      ;
                       db $F0,$F7,$43,$00                   ;0DB046|        |      ;
 
         DATA8_0DB04A: db $04,$F0,$BD,$00,$F0               ;0DB04A|        |      ;
                       db $F1,$BF,$F8,$F1,$BD               ;0DB04F|        |      ;
                       db $00,$F1,$BF,$08                   ;0DB054|        |      ;
 
         DATA8_0DB058: db $01,$00,$E7,$00,$FC               ;0DB058|        |      ;
 
         DATA8_0DB05D: db $02,$F0,$7C,$01,$F8               ;0DB05D|        |      ;
                       db $F1,$7E,$00                       ;0DB062|        |      ;
 
         DATA8_0DB065: db $02,$F0,$7C,$03,$F8               ;0DB065|        |      ;
                       db $F1,$7E,$00                       ;0DB06A|        |      ;
 
         DATA8_0DB06D: db $02,$F0,$7C,$00,$F8               ;0DB06D|        |      ;
                       db $F1,$7E,$00                       ;0DB072|        |      ;
 
         DATA8_0DB075: db $02,$F0,$98,$01,$F8               ;0DB075|        |      ;
                       db $F1,$9A,$00                       ;0DB07A|        |      ;
 
         DATA8_0DB07D: db $02,$F0,$98,$01,$F8               ;0DB07D|        |      ;
                       db $F3,$9A,$00                       ;0DB082|        |      ;
 
         DATA8_0DB085: db $02,$F0,$9C,$01,$F8               ;0DB085|        |      ;
                       db $F1,$9E,$00                       ;0DB08A|        |      ;
 
         DATA8_0DB08D: db $02,$F0,$A0,$01,$F8               ;0DB08D|        |      ;
                       db $F1,$A2,$00                       ;0DB092|        |      ;
 
         DATA8_0DB095: db $02,$F0,$A4,$01,$F8               ;0DB095|        |      ;
                       db $F1,$A6,$00                       ;0DB09A|        |      ;
 
         DATA8_0DB09D: db $02,$F2,$9A,$41,$F8               ;0DB09D|        |      ;
                       db $F1,$98,$00                       ;0DB0A2|        |      ;
 
         DATA8_0DB0A5: db $02,$F0,$9E,$41,$F8               ;0DB0A5|        |      ;
                       db $F1,$9C,$00                       ;0DB0AA|        |      ;
 
         DATA8_0DB0AD: db $02,$F0,$A2,$41,$F8               ;0DB0AD|        |      ;
                       db $F1,$A0,$00                       ;0DB0B2|        |      ;
 
         DATA8_0DB0B5: db $02,$F0,$A6,$41,$F8               ;0DB0B5|        |      ;
                       db $F1,$A4,$00                       ;0DB0BA|        |      ;
 
         DATA8_0DB0BD: db $04,$F8,$E5,$02,$F0               ;0DB0BD|        |      ;
                       db $F9,$E5,$F8,$F9,$E5               ;0DB0C2|        |      ;
                       db $00,$F9,$E5,$08                   ;0DB0C7|        |      ;
 
         DATA8_0DB0CB: db $05,$E6,$80,$02,$EE               ;0DB0CB|        |      ;
                       db $E7,$82,$F6,$E7,$84               ;0DB0D0|        |      ;
                       db $FE,$07,$86,$FE,$01               ;0DB0D5|        |      ;
                       db $88,$06                           ;0DB0DA|        |      ;
 
         DATA8_0DB0DC: db $02,$E0,$8A,$02,$F8               ;0DB0DC|        |      ;
                       db $01,$8A,$F8                       ;0DB0E1|        |      ;
 
         DATA8_0DB0E4: db $05,$FA,$80,$82,$EE               ;0DB0E4|        |      ;
                       db $FB,$82,$F6,$FB,$84               ;0DB0E9|        |      ;
                       db $FE,$DB,$86,$FE,$E1               ;0DB0EE|        |      ;
                       db $88,$06                           ;0DB0F3|        |      ;
 
         DATA8_0DB0F5: db $04,$F0,$8C,$01,$F0               ;0DB0F5|        |      ;
                       db $F1,$8C,$F8,$F1,$8C               ;0DB0FA|        |      ;
                       db $00,$F1,$8C,$08                   ;0DB0FF|        |      ;
 
         DATA8_0DB103: db $06,$E4,$8E,$01,$F0               ;0DB103|        |      ;
                       db $E1,$90,$F8,$E1,$84               ;0DB108|        |      ;
                       db $00,$01,$92,$F8,$01               ;0DB10D|        |      ;
                       db $94,$00,$FB,$88,$08               ;0DB112|        |      ;
 
         DATA8_0DB117: db $04,$E0,$96,$01,$F8               ;0DB117|        |      ;
                       db $E1,$8A,$00,$01,$96               ;0DB11C|        |      ;
                       db $F8,$01,$8A,$00                   ;0DB121|        |      ;
 
         DATA8_0DB125: db $06,$FC,$8E,$81,$F0               ;0DB125|        |      ;
                       db $E1,$92,$F8,$E1,$94               ;0DB12A|        |      ;
                       db $00,$01,$90,$F8,$01               ;0DB12F|        |      ;
                       db $84,$00,$E7,$88,$08               ;0DB134|        |      ;
 
         DATA8_0DB139: db $04,$F0,$8C,$81,$F0               ;0DB139|        |      ;
                       db $F1,$8C,$F8,$F1,$8C               ;0DB13E|        |      ;
                       db $00,$F1,$8C,$08                   ;0DB143|        |      ;
 
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
 
         DATA8_0DB17E: db $02,$F0,$AC,$02,$F8               ;0DB17E|        |      ;
                       db $F1,$AE,$00                       ;0DB183|        |      ;
 
         DATA8_0DB186: db $02,$F0,$B0,$02,$F8               ;0DB186|        |      ;
                       db $F1,$B2,$00                       ;0DB18B|        |      ;
 
         DATA8_0DB18E: db $02,$F0,$B4,$02,$F8               ;0DB18E|        |      ;
                       db $F1,$B6,$00                       ;0DB193|        |      ;
 
         DATA8_0DB196: db $08,$E0,$BC,$02,$F0               ;0DB196|        |      ;
                       db $E1,$BE,$F8,$E1,$B8               ;0DB19B|        |      ;
                       db $00,$E1,$BA,$08,$00               ;0DB1A0|        |      ;
                       db $BA,$C2,$F0,$01,$B8               ;0DB1A5|        |      ;
                       db $F8,$00,$B8,$82,$00               ;0DB1AA|        |      ;
                       db $01,$BA,$08                       ;0DB1AF|        |      ;
 
         DATA8_0DB1B2: db $08,$E0,$DF,$01,$F0               ;0DB1B2|        |      ;
                       db $E1,$DF,$F8,$E1,$DF               ;0DB1B7|        |      ;
                       db $00,$E1,$DF,$08,$01               ;0DB1BC|        |      ;
                       db $27,$F0,$01,$27,$F8               ;0DB1C1|        |      ;
                       db $01,$27,$00,$01,$27               ;0DB1C6|        |      ;
                       db $08                               ;0DB1CB|        |      ;
 
         DATA8_0DB1CC: db $08,$E0,$DF,$01,$F0               ;0DB1CC|        |      ;
                       db $E1,$DF,$F8,$E1,$DF               ;0DB1D1|        |      ;
                       db $00,$E1,$DF,$08,$01               ;0DB1D6|        |      ;
                       db $27,$F0,$01,$27,$F8               ;0DB1DB|        |      ;
                       db $01,$27,$00,$01,$27               ;0DB1E0|        |      ;
                       db $08                               ;0DB1E5|        |      ;
 
         DATA8_0DB1E6: db $02,$F0,$CA,$01,$F8               ;0DB1E6|        |      ;
                       db $F0,$CA,$41,$00                   ;0DB1EB|        |      ;
 
         DATA8_0DB1EF: db $02,$F0,$CC,$01,$F8               ;0DB1EF|        |      ;
                       db $F1,$CE,$00                       ;0DB1F4|        |      ;
 
         DATA8_0DB1F7: db $02,$F0,$CE,$41,$F8               ;0DB1F7|        |      ;
                       db $F1,$CC,$00                       ;0DB1FC|        |      ;
 
         DATA8_0DB1FF: db $01,$00,$D0,$01,$FC               ;0DB1FF|        |      ;
 
         DATA8_0DB204: db $01,$F0,$D2,$01,$FC               ;0DB204|        |      ;
 
         DATA8_0DB209: db $02,$FC,$D4,$01,$F8               ;0DB209|        |      ;
                       db $FD,$D6,$00                       ;0DB20E|        |      ;
 
         DATA8_0DB211: db $02,$FC,$CA,$81,$F8               ;0DB211|        |      ;
                       db $FC,$CA,$C1,$00                   ;0DB216|        |      ;
 
         DATA8_0DB21A: db $02,$F0,$A3,$02,$F8               ;0DB21A|        |      ;
                       db $F1,$A5,$00                       ;0DB21F|        |      ;
 
         DATA8_0DB222: db $02,$F0,$A7,$02,$F8               ;0DB222|        |      ;
                       db $F1,$A9,$00                       ;0DB227|        |      ;
 
         DATA8_0DB22A: db $02,$F0,$AB,$02,$F8               ;0DB22A|        |      ;
                       db $F0,$AB,$42,$00                   ;0DB22F|        |      ;
 
         DATA8_0DB233: db $02,$F0,$AD,$02,$F8               ;0DB233|        |      ;
                       db $F0,$AD,$42,$00                   ;0DB238|        |      ;
 
         DATA8_0DB23C: db $02,$F0,$AF,$02,$F8               ;0DB23C|        |      ;
                       db $F0,$AF,$42,$00                   ;0DB241|        |      ;
 
         DATA8_0DB245: db $02,$F0,$BD,$00,$F9               ;0DB245|        |      ;
                       db $F1,$BF,$01                       ;0DB24A|        |      ;
 
         DATA8_0DB24D: db $04,$E0,$40,$00,$F8               ;0DB24D|        |      ;
                       db $E1,$42,$00,$01,$44               ;0DB252|        |      ;
                       db $F8,$01,$46,$00                   ;0DB257|        |      ;
 
         DATA8_0DB25B: db $03,$E0,$48,$00,$F8               ;0DB25B|        |      ;
                       db $E1,$4A,$00,$01,$4C               ;0DB260|        |      ;
                       db $FC                               ;0DB265|        |      ;
 
         DATA8_0DB266: db $04,$E0,$4E,$00,$F8               ;0DB266|        |      ;
                       db $E1,$50,$00,$01,$52               ;0DB26B|        |      ;
                       db $F8,$01,$54,$00                   ;0DB270|        |      ;
 
         DATA8_0DB274: db $04,$E0,$78,$00,$F9               ;0DB274|        |      ;
                       db $E1,$50,$01,$01,$52               ;0DB279|        |      ;
                       db $F8,$01,$54,$00                   ;0DB27E|        |      ;
 
         DATA8_0DB282: db $04,$E0,$7A,$00,$F9               ;0DB282|        |      ;
                       db $E1,$50,$01,$01,$52               ;0DB287|        |      ;
                       db $F8,$01,$54,$00                   ;0DB28C|        |      ;
 
         DATA8_0DB290: db $04,$E0,$7C,$00,$F9               ;0DB290|        |      ;
                       db $E1,$50,$01,$01,$52               ;0DB295|        |      ;
                       db $F8,$01,$54,$00                   ;0DB29A|        |      ;
 
         DATA8_0DB29E: db $04,$EA,$56,$00,$F4               ;0DB29E|        |      ;
                       db $EB,$58,$FC,$0B,$5A               ;0DB2A3|        |      ;
                       db $F8,$0B,$5C,$00                   ;0DB2A8|        |      ;
 
         DATA8_0DB2AC: db $04,$EA,$5E,$00,$F5               ;0DB2AC|        |      ;
                       db $EB,$60,$FD,$0B,$62               ;0DB2B1|        |      ;
                       db $F8,$0B,$64,$00                   ;0DB2B6|        |      ;
 
         DATA8_0DB2BA: db $04,$EA,$66,$00,$F4               ;0DB2BA|        |      ;
                       db $EB,$68,$FC,$0B,$6A               ;0DB2BF|        |      ;
                       db $F8,$0B,$6C,$00                   ;0DB2C4|        |      ;
 
         DATA8_0DB2C8: db $0A,$E8,$58,$41,$EE               ;0DB2C8|        |      ;
                       db $E9,$74,$F6,$09,$5C               ;0DB2CD|        |      ;
                       db $EA,$09,$5A,$F2,$E9               ;0DB2D2|        |      ;
                       db $72,$FE,$E0,$E2,$00               ;0DB2D7|        |      ;
                       db $00,$E1,$E4,$08,$E1               ;0DB2DC|        |      ;
                       db $E6,$10,$01,$44,$08               ;0DB2E1|        |      ;
                       db $01,$46,$10                       ;0DB2E6|        |      ;
 
         DATA8_0DB2E9: db $0A,$E8,$58,$41,$EE               ;0DB2E9|        |      ;
                       db $E9,$74,$F6,$09,$5C               ;0DB2EE|        |      ;
                       db $EA,$09,$5A,$F2,$EB               ;0DB2F3|        |      ;
                       db $9E,$FE,$E0,$E8,$00               ;0DB2F8|        |      ;
                       db $00,$E1,$EA,$08,$E1               ;0DB2FD|        |      ;
                       db $E6,$10,$01,$44,$08               ;0DB302|        |      ;
                       db $01,$46,$10                       ;0DB307|        |      ;
 
         DATA8_0DB30A: db $04,$EA,$76,$00,$F5               ;0DB30A|        |      ;
                       db $EB,$58,$FD,$0B,$5A               ;0DB30F|        |      ;
                       db $F8,$0B,$5C,$00                   ;0DB314|        |      ;
 
         DATA8_0DB318: db $05,$D2,$7E,$00,$FB               ;0DB318|        |      ;
                       db $F1,$80,$F7,$F1,$82               ;0DB31D|        |      ;
                       db $FF,$11,$84,$F8,$11               ;0DB322|        |      ;
                       db $86,$00                           ;0DB327|        |      ;
 
         DATA8_0DB329: db $05,$D0,$7E,$00,$FC               ;0DB329|        |      ;
                       db $F1,$88,$F8,$F1,$8A               ;0DB32E|        |      ;
                       db $00,$11,$8C,$F8,$11               ;0DB333|        |      ;
                       db $8E,$00                           ;0DB338|        |      ;
 
         DATA8_0DB33A: db $05,$D2,$7E,$00,$FC               ;0DB33A|        |      ;
                       db $F1,$90,$F7,$F1,$92               ;0DB33F|        |      ;
                       db $FF,$11,$94,$F8,$11               ;0DB344|        |      ;
                       db $96,$00                           ;0DB349|        |      ;
 
         DATA8_0DB34B: db $0B,$D2,$7E,$43,$F5               ;0DB34B|        |      ;
                       db $F1,$82,$EF,$F1,$F6               ;0DB350|        |      ;
                       db $F7,$11,$86,$ED,$11               ;0DB355|        |      ;
                       db $84,$F5,$F1,$F4,$FF               ;0DB35A|        |      ;
                       db $F0,$E2,$00,$00,$F1               ;0DB35F|        |      ;
                       db $E4,$08,$F1,$E6,$10               ;0DB364|        |      ;
                       db $11,$44,$08,$11,$46               ;0DB369|        |      ;
                       db $10                               ;0DB36E|        |      ;
 
         DATA8_0DB36F: db $0B,$D2,$7E,$43,$F5               ;0DB36F|        |      ;
                       db $F1,$82,$EF,$F1,$F8               ;0DB374|        |      ;
                       db $FF,$11,$86,$ED,$11               ;0DB379|        |      ;
                       db $84,$F5,$F1,$FA,$F7               ;0DB37E|        |      ;
                       db $F0,$E8,$00,$00,$F1               ;0DB383|        |      ;
                       db $EA,$08,$F1,$E6,$10               ;0DB388|        |      ;
                       db $11,$44,$08,$11,$46               ;0DB38D|        |      ;
                       db $10                               ;0DB392|        |      ;
 
         DATA8_0DB393: db $05,$D2,$7E,$00,$FD               ;0DB393|        |      ;
                       db $F1,$98,$F8,$F1,$92               ;0DB398|        |      ;
                       db $00,$11,$94,$F9,$11               ;0DB39D|        |      ;
                       db $96,$01                           ;0DB3A2|        |      ;
 
         DATA8_0DB3A4: db $04,$E0,$A0,$00,$F8               ;0DB3A4|        |      ;
                       db $E1,$A2,$00,$01,$A4               ;0DB3A9|        |      ;
                       db $F8,$01,$A6,$00                   ;0DB3AE|        |      ;
 
         DATA8_0DB3B2: db $04,$E0,$A8,$00,$F8               ;0DB3B2|        |      ;
                       db $E1,$AA,$00,$01,$AC               ;0DB3B7|        |      ;
                       db $F8,$01,$AE,$00                   ;0DB3BC|        |      ;
 
         DATA8_0DB3C0: db $04,$E0,$B0,$00,$F8               ;0DB3C0|        |      ;
                       db $E1,$B2,$00,$01,$B4               ;0DB3C5|        |      ;
                       db $F8,$01,$B6,$00                   ;0DB3CA|        |      ;
 
         DATA8_0DB3CE: db $0A,$E0,$B2,$42,$EE               ;0DB3CE|        |      ;
                       db $E1,$EE,$F6,$01,$B6               ;0DB3D3|        |      ;
                       db $EE,$01,$B4,$F6,$E1               ;0DB3D8|        |      ;
                       db $EC,$FE,$E0,$E2,$00               ;0DB3DD|        |      ;
                       db $00,$E1,$E4,$08,$E1               ;0DB3E2|        |      ;
                       db $E6,$10,$01,$44,$08               ;0DB3E7|        |      ;
                       db $01,$46,$10                       ;0DB3EC|        |      ;
 
         DATA8_0DB3EF: db $0A,$E0,$B2,$42,$EE               ;0DB3EF|        |      ;
                       db $E1,$F2,$F6,$01,$B6               ;0DB3F4|        |      ;
                       db $EE,$01,$B4,$F6,$F1               ;0DB3F9|        |      ;
                       db $F0,$FE,$E0,$E8,$00               ;0DB3FE|        |      ;
                       db $00,$E1,$EA,$08,$E1               ;0DB403|        |      ;
                       db $E6,$10,$01,$44,$08               ;0DB408|        |      ;
                       db $01,$46,$10                       ;0DB40D|        |      ;
 
         DATA8_0DB410: db $04,$E0,$B8,$00,$F8               ;0DB410|        |      ;
                       db $E3,$B2,$00,$01,$B4               ;0DB415|        |      ;
                       db $F8,$01,$B6,$00                   ;0DB41A|        |      ;
 
         DATA8_0DB41E: db $0C,$A0,$F2,$01,$F8               ;0DB41E|        |      ;
                       db $A1,$CA,$00,$C1,$E0               ;0DB423|        |      ;
                       db $F0,$C1,$F0,$F8,$E1               ;0DB428|        |      ;
                       db $F2,$F8,$E1,$F0,$00               ;0DB42D|        |      ;
                       db $01,$F2,$F0,$01,$F2               ;0DB432|        |      ;
                       db $00,$21,$D6,$E8,$21               ;0DB437|        |      ;
                       db $CA,$00,$21,$DC,$08               ;0DB43C|        |      ;
                       db $41,$D6,$E0                       ;0DB441|        |      ;
 
         DATA8_0DB444: db $04,$E0,$80,$00,$F8               ;0DB444|        |      ;
                       db $E1,$82,$00,$01,$84               ;0DB449|        |      ;
                       db $F8,$01,$86,$00                   ;0DB44E|        |      ;
 
         DATA8_0DB452: db $04,$E0,$88,$00,$F8               ;0DB452|        |      ;
                       db $E1,$8A,$00,$01,$8C               ;0DB457|        |      ;
                       db $F8,$01,$8E,$00                   ;0DB45C|        |      ;
 
         DATA8_0DB460: db $04,$E0,$90,$00,$F8               ;0DB460|        |      ;
                       db $E1,$92,$00,$01,$94               ;0DB465|        |      ;
                       db $FC,$01,$96,$04                   ;0DB46A|        |      ;
 
         DATA8_0DB46E: db $08,$E0,$98,$00,$00               ;0DB46E|        |      ;
                       db $E1,$9A,$08,$E1,$9C               ;0DB473|        |      ;
                       db $10,$E1,$9E,$18,$01               ;0DB478|        |      ;
                       db $A0,$00,$01,$A2,$08               ;0DB47D|        |      ;
                       db $01,$A4,$10,$01,$A6               ;0DB482|        |      ;
                       db $18                               ;0DB487|        |      ;
 
         DATA8_0DB488: db $07,$E0,$98,$00,$00               ;0DB488|        |      ;
                       db $E1,$A8,$08,$E1,$AA               ;0DB48D|        |      ;
                       db $10,$01,$A0,$00,$01               ;0DB492|        |      ;
                       db $A2,$08,$01,$AC,$10               ;0DB497|        |      ;
                       db $01,$AE,$18                       ;0DB49C|        |      ;
 
         DATA8_0DB49F: db $04,$E0,$B0,$00,$00               ;0DB49F|        |      ;
                       db $E1,$B2,$08,$01,$B4               ;0DB4A4|        |      ;
                       db $00,$01,$B6,$08                   ;0DB4A9|        |      ;
 
         DATA8_0DB4AD: db $02,$E0,$2D,$03,$00               ;0DB4AD|        |      ;
                       db $E1,$2F,$08                       ;0DB4B2|        |      ;
 
         DATA8_0DB4B5: db $04,$E0,$8E,$01,$F7               ;0DB4B5|        |      ;
                       db $01,$90,$F1,$E0,$8E               ;0DB4BA|        |      ;
                       db $41,$01,$01,$90,$07               ;0DB4BF|        |      ;
 
         DATA8_0DB4C4: db $04,$E0,$90,$41,$F7               ;0DB4C4|        |      ;
                       db $01,$8E,$F1,$E0,$90               ;0DB4C9|        |      ;
                       db $01,$01,$01,$8E,$07               ;0DB4CE|        |      ;
 
         DATA8_0DB4D3: db $04,$E0,$80,$01,$F8               ;0DB4D3|        |      ;
                       db $E1,$82,$00,$01,$84               ;0DB4D8|        |      ;
                       db $F8,$01,$86,$00                   ;0DB4DD|        |      ;
 
         DATA8_0DB4E1: db $08,$DE,$8E,$C3,$F1               ;0DB4E1|        |      ;
                       db $DE,$8E,$83,$07,$E0               ;0DB4E6|        |      ;
                       db $82,$03,$F8,$E1,$82               ;0DB4EB|        |      ;
                       db $00,$FF,$90,$F1,$01               ;0DB4F0|        |      ;
                       db $84,$F8,$01,$86,$00               ;0DB4F5|        |      ;
                       db $FE,$90,$43,$07                   ;0DB4FA|        |      ;
 
         DATA8_0DB4FE: db $04,$E0,$80,$02,$F8               ;0DB4FE|        |      ;
                       db $E1,$82,$00,$01,$84               ;0DB503|        |      ;
                       db $F8,$01,$86,$00                   ;0DB508|        |      ;
 
         DATA8_0DB50C: db $05,$E0,$80,$02,$F8               ;0DB50C|        |      ;
                       db $E1,$82,$00,$01,$88               ;0DB511|        |      ;
                       db $F4,$01,$8A,$FC,$01               ;0DB516|        |      ;
                       db $8C,$04                           ;0DB51B|        |      ;
 
         DATA8_0DB51D: db $04,$E0,$F8,$02,$F8               ;0DB51D|        |      ;
                       db $E1,$FA,$00,$01,$FC               ;0DB522|        |      ;
                       db $F8,$01,$EE,$00                   ;0DB527|        |      ;
 
         DATA8_0DB52B: db $02,$F0,$5C,$00,$F8               ;0DB52B|        |      ;
                       db $F0,$5C,$40,$00                   ;0DB530|        |      ;
 
         DATA8_0DB534: db $08,$D0,$5E,$00,$F0               ;0DB534|        |      ;
                       db $D1,$5E,$F8,$D1,$5E               ;0DB539|        |      ;
                       db $00,$D1,$5E,$08,$F1               ;0DB53E|        |      ;
                       db $5E,$F0,$F1,$5C,$F8               ;0DB543|        |      ;
                       db $F1,$5E,$08,$F0,$5C               ;0DB548|        |      ;
                       db $40,$00                           ;0DB54D|        |      ;
 
 
         DATA8_0DB54F: db $10,$A0,$BA,$41,$F8               ;0DB54F|        |      ;
                       db $C1,$BC,$F8,$C1,$9E               ;0DB554|        |      ;
                       db $00,$E1,$A0,$00,$E1               ;0DB559|        |      ;
                       db $A2,$08,$E1,$A4,$10               ;0DB55E|        |      ;
                       db $E1,$A6,$18,$01,$A8               ;0DB563|        |      ;
                       db $00,$01,$AA,$18,$21               ;0DB568|        |      ;
                       db $B6,$F8,$21,$AC,$00               ;0DB56D|        |      ;
                       db $21,$AE,$10,$21,$B0               ;0DB572|        |      ;
                       db $18,$41,$B8,$F8,$41               ;0DB577|        |      ;
                       db $B2,$10,$41,$B4,$18               ;0DB57C|        |      ;
 
         DATA8_0DB581: db $15,$A0,$80,$21,$F8               ;0DB581|        |      ;
                       db $A1,$82,$00,$C1,$84               ;0DB586|        |      ;
                       db $F0,$C1,$86,$F8,$C1               ;0DB58B|        |      ;
                       db $88,$00,$C1,$8A,$08               ;0DB590|        |      ;
                       db $C1,$8C,$10,$E1,$8E               ;0DB595|        |      ;
                       db $E8,$E1,$90,$F0,$E1               ;0DB59A|        |      ;
                       db $94,$F8,$E1,$9E,$00               ;0DB59F|        |      ;
                       db $E1,$9E,$08,$E1,$9E               ;0DB5A4|        |      ;
                       db $10,$E1,$96,$18,$01               ;0DB5A9|        |      ;
                       db $98,$E8,$01,$9A,$F0               ;0DB5AE|        |      ;
                       db $01,$9E,$F8,$01,$9E               ;0DB5B3|        |      ;
                       db $00,$01,$9E,$08,$01               ;0DB5B8|        |      ;
                       db $9E,$10,$01,$9C,$18               ;0DB5BD|        |      ;
 
         DATA8_0DB5C2: db $10,$E0,$D4,$03,$E0               ;0DB5C2|        |      ;
                       db $E1,$D0,$F0,$E1,$D2               ;0DB5C7|        |      ;
                       db $F8,$E1,$D4,$00,$E1               ;0DB5CC|        |      ;
                       db $D6,$08,$E1,$D6,$10               ;0DB5D1|        |      ;
                       db $E1,$D8,$18,$01,$D0               ;0DB5D6|        |      ;
                       db $E8,$01,$DA,$00,$01               ;0DB5DB|        |      ;
                       db $DC,$08,$01,$DC,$10               ;0DB5E0|        |      ;
 
                       db $01,$DE,$18,$21,$DA               ;0DB5E5|        |      ;
                       db $F8,$21,$DC,$00,$21               ;0DB5EA|        |      ;
                       db $DC,$08,$21,$DE,$10               ;0DB5EF|        |      ;
 
 
         DATA8_0DB5F4: db $05,$C0,$00,$00,$FD               ;0DB5F4|        |      ;
                       db $E1,$02,$F8,$E1,$04               ;0DB5F9|        |      ;
                       db $00,$01,$06,$F8,$01               ;0DB5FE|        |      ;
                       db $08,$00                           ;0DB603|        |      ;
 
         DATA8_0DB605: db $05,$C0,$00,$00,$FD               ;0DB605|        |      ;
                       db $E1,$0A,$F8,$E1,$0C               ;0DB60A|        |      ;
                       db $00,$01,$0E,$F8,$01               ;0DB60F|        |      ;
                       db $10,$00                           ;0DB614|        |      ;
 
         DATA8_0DB616: db $06,$C0,$00,$00,$FD               ;0DB616|        |      ;
                       db $E1,$12,$F8,$E1,$14               ;0DB61B|        |      ;
                       db $00,$01,$18,$F8,$01               ;0DB620|        |      ;
                       db $1A,$00,$F9,$16,$F0               ;0DB625|        |      ;
 
         DATA8_0DB62A: db $06,$C0,$00,$00,$FD               ;0DB62A|        |      ;
                       db $E1,$1C,$F8,$E1,$1E               ;0DB62F|        |      ;
                       db $00,$01,$22,$F8,$01               ;0DB634|        |      ;
                       db $24,$00,$FF,$20,$F0               ;0DB639|        |      ;
 
         DATA8_0DB63E: db $04,$E0,$74,$02,$FA               ;0DB63E|        |      ;
                       db $E1,$76,$02,$01,$7A               ;0DB643|        |      ;
                       db $00,$01,$78,$F8                   ;0DB648|        |      ;
 
         DATA8_0DB64C: db $05,$E0,$7C,$02,$F6               ;0DB64C|        |      ;
                       db $E1,$7E,$FE,$E1,$C0               ;0DB651|        |      ;
                       db $06,$01,$7A,$00,$01               ;0DB656|        |      ;
                       db $78,$F8                           ;0DB65B|        |      ;
 
         DATA8_0DB65D: db $05,$E0,$C2,$02,$F6               ;0DB65D|        |      ;
                       db $E1,$C4,$FE,$E1,$C6               ;0DB662|        |      ;
                       db $06,$01,$7A,$00,$01               ;0DB667|        |      ;
                       db $78,$F8                           ;0DB66C|        |      ;
 
         DATA8_0DB66E: db $06,$C0,$54,$02,$F8               ;0DB66E|        |      ;
                       db $C1,$56,$00,$E1,$58               ;0DB673|        |      ;
                       db $F8,$E1,$5A,$00,$01               ;0DB678|        |      ;
                       db $5C,$F8,$01,$5E,$00               ;0DB67D|        |      ;
 
 
         DATA8_0DB682: db $07,$C0,$54,$02,$F8               ;0DB682|        |      ;
                       db $C1,$56,$00,$E1,$60               ;0DB687|        |      ;
                       db $F8,$E1,$62,$00,$01               ;0DB68C|        |      ;
                       db $66,$F8,$01,$68,$00               ;0DB691|        |      ;
                       db $F1,$64,$F0                       ;0DB696|        |      ;
 
         DATA8_0DB699: db $07,$C0,$54,$02,$F8               ;0DB699|        |      ;
                       db $C1,$56,$00,$E1,$6A               ;0DB69E|        |      ;
                       db $F8,$E1,$6C,$00,$01               ;0DB6A3|        |      ;
                       db $70,$F8,$01,$72,$00               ;0DB6A8|        |      ;
                       db $F3,$6E,$F0                       ;0DB6AD|        |      ;
 
         DATA8_0DB6B0: db $05,$C0,$26,$02,$FC               ;0DB6B0|        |      ;
                       db $E1,$28,$F8,$E1,$2A               ;0DB6B5|        |      ;
                       db $00,$01,$2C,$F8,$01               ;0DB6BA|        |      ;
                       db $2E,$00                           ;0DB6BF|        |      ;
 
         DATA8_0DB6C1: db $05,$C0,$30,$00,$FC               ;0DB6C1|        |      ;
                       db $E0,$32,$02,$F8,$E1               ;0DB6C6|        |      ;
                       db $34,$00,$01,$2C,$F8               ;0DB6CB|        |      ;
                       db $01,$2E,$00                       ;0DB6D0|        |      ;
 
         DATA8_0DB6D3: db $07,$C0,$30,$00,$FC               ;0DB6D3|        |      ;
                       db $E1,$3E,$F3,$E1,$40               ;0DB6D8|        |      ;
                       db $FB,$E0,$36,$02,$F8               ;0DB6DD|        |      ;
                       db $E1,$38,$00,$01,$2C               ;0DB6E2|        |      ;
                       db $F8,$01,$2E,$00                   ;0DB6E7|        |      ;
 
         DATA8_0DB6EB: db $06,$C0,$30,$00,$FC               ;0DB6EB|        |      ;
                       db $E1,$42,$F4,$E1,$44               ;0DB6F0|        |      ;
                       db $FC,$E0,$3A,$02,$00               ;0DB6F5|        |      ;
                       db $01,$2C,$F8,$01,$2E               ;0DB6FA|        |      ;
                       db $00                               ;0DB6FF|        |      ;
 
         DATA8_0DB700: db $06,$C0,$30,$00,$FC               ;0DB700|        |      ;
                       db $E1,$46,$F4,$E1,$48               ;0DB705|        |      ;
                       db $FC,$E0,$3C,$02,$00               ;0DB70A|        |      ;
                       db $01,$2C,$F8,$01,$2E               ;0DB70F|        |      ;
                       db $00                               ;0DB714|        |      ;
 
         DATA8_0DB715: db $0A,$C0,$4A,$00,$EF               ;0DB715|        |      ;
                       db $E1,$02,$E9,$E1,$4E               ;0DB71A|        |      ;
                       db $F0,$E1,$50,$F8,$01               ;0DB71F|        |      ;
                       db $06,$E8,$01,$08,$F0               ;0DB724|        |      ;
                       db $C1,$4C,$F8,$E0,$52               ;0DB729|        |      ;
                       db $02,$00,$01,$2C,$F8               ;0DB72E|        |      ;
                       db $01,$2E,$00                       ;0DB733|        |      ;
 
         DATA8_0DB736: db $0C,$C0,$E0,$00,$F1               ;0DB736|        |      ;
                       db $C1,$E2,$F9,$E1,$F0               ;0DB73B|        |      ;
                       db $E9,$E1,$F2,$F1,$E1               ;0DB740|        |      ;
                       db $EC,$F9,$E1,$EE,$01               ;0DB745|        |      ;
                       db $01,$06,$EB,$01,$08               ;0DB74A|        |      ;
                       db $F3,$E0,$E4,$02,$F9               ;0DB74F|        |      ;
                       db $E1,$E6,$01,$01,$E8               ;0DB754|        |      ;
                       db $F8,$01,$EA,$00                   ;0DB759|        |      ;
 
         DATA8_0DB75D: db $02,$F0,$64,$41,$F8               ;0DB75D|        |      ;
                       db $F1,$62,$00                       ;0DB762|        |      ;
 
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
                       LDA.B wDoubleCurrRoomIdx             ;0DB77D|A50E    |00000E;
                       JMP.W CODE_0DB788                    ;0DB77F|4C88B7  |0DB788;
 
                       LDA.W $0438,X                        ;0DB782|BD3804  |0D0438;
                       LDY.W $041C,X                        ;0DB785|BC1C04  |0D041C;
 
          CODE_0DB788: AND.B #$F0                           ;0DB788|29F0    |      ;
                       LSR A                                ;0DB78A|4A      |      ;
                       LSR A                                ;0DB78B|4A      |      ;
                       LSR A                                ;0DB78C|4A      |      ;
                       STA.B wCollisionPointXvalDiv32       ;0DB78D|8512    |000012;
                       TYA                                  ;0DB78F|98      |      ;
                       LDY.B wCurrScrollRoomScreen          ;0DB790|A457    |000057;
                       SEC                                  ;0DB792|38      |      ;
                       SBC.B #$30                           ;0DB793|E930    |      ;
                       BCS CODE_0DB79A                      ;0DB795|B003    |0DB79A;
                       SBC.B #$0F                           ;0DB797|E90F    |      ;
                       DEY                                  ;0DB799|88      |      ;
 
          CODE_0DB79A: CLC                                  ;0DB79A|18      |      ;
                       ADC.B wCurrScrollOffsetIntoRoomScreen;0DB79B|6556    |000056;
                       BCS CODE_0DB7A3                      ;0DB79D|B004    |0DB7A3;
                       CMP.B #$F0                           ;0DB79F|C9F0    |      ;
                       BCC CODE_0DB7A6                      ;0DB7A1|9003    |0DB7A6;
 
          CODE_0DB7A3: ADC.B #$0F                           ;0DB7A3|690F    |      ;
                       INY                                  ;0DB7A5|C8      |      ;
 
          CODE_0DB7A6: AND.B #$F0                           ;0DB7A6|29F0    |      ;
                       STA.B $00                            ;0DB7A8|8500    |000000;
                       STA.B $0B                            ;0DB7AA|850B    |00000B;
                       STY.B wRoomSectionChrBanksDataOffset ;0DB7AC|840F    |00000F;
                       LDA.B #$0A                           ;0DB7AE|A90A    |      ;
                       ASL.B $00                            ;0DB7B0|0600    |000000;
                       ROL A                                ;0DB7B2|2A      |      ;
                       ASL.B $00                            ;0DB7B3|0600    |000000;
                       ROL A                                ;0DB7B5|2A      |      ;
                       STA.B wCollisionPointAbsoluteXInRoom ;0DB7B6|8513    |000013;
                       LDA.B wCollisionPointXvalDiv32       ;0DB7B8|A512    |000012;
                       ORA.B $00                            ;0DB7BA|0500    |000000;
                       STA.B wCollisionPointXvalDiv32       ;0DB7BC|8512    |000012;
 
          CODE_0DB7BE: RTS                                  ;0DB7BE|60      |      ;
 
                       STY.B $09                            ;0DB7BF|8409    |000009;
                       LDA.B wRoomOrientation               ;0DB7C1|A568    |000068;
                       BPL UNREACH_0DB7FB                   ;0DB7C3|1036    |0DB7FB;
                       LDA.B wCurrDrawnEntityCachedAttr     ;0DB7C5|A510    |000010;
                       STA.B wDoubleCurrRoomIdx             ;0DB7C7|850E    |00000E;
                       JSR.W CODE_0DB765                    ;0DB7C9|2065B7  |0DB765;
                       JSR.W CODE_0DB8B8                    ;0DB7CC|20B8B8  |0DB8B8;
                       BNE CODE_0DB7BE                      ;0DB7CF|D0ED    |0DB7BE;
                       JSR.W CODE_0DBA05                    ;0DB7D1|2005BA  |0DBA05;
                       BMI UNREACH_0DB7E1                   ;0DB7D4|300B    |0DB7E1;
                       LDA.B #$10                           ;0DB7D6|A910    |      ;
                       db $20                               ;0DB7D8|        |      ;
                       dw CODE_0FE25F                       ;0DB7D9|        |0FE25F;
                       JSR.W CODE_0DB9A3                    ;0DB7DB|20A3B9  |0DB9A3;
                       JMP.W CODE_0DB982                    ;0DB7DE|4C82B9  |0DB982;
 
 
       UNREACH_0DB7E1: db $20,$E1,$BA,$B0,$D8               ;0DB7E1|        |0DBAE1;
                       db $AD,$1C,$04,$18,$69               ;0DB7E6|        |0D041C;
                       db $08,$85,$14,$A5,$0E               ;0DB7EB|        |      ;
                       db $85,$15,$20,$35,$E9               ;0DB7F0|        |000015;
                       db $20,$31,$B8,$4C,$3F               ;0DB7F5|        |0DB831;
                       db $B8                               ;0DB7FA|        |      ;
 
       UNREACH_0DB7FB: db $A5,$13,$85,$0E,$A5               ;0DB7FB|        |000013;
                       db $14,$85,$0F,$20,$B8               ;0DB800|        |000085;
                       db $B8,$D0,$B6,$20,$05               ;0DB805|        |      ;
                       db $BA,$30,$0E,$A9,$10               ;0DB80A|        |      ;
                       db $20,$5F,$E2,$20,$B2               ;0DB80F|        |0DE25F;
                       db $B9,$20,$A3,$B9,$4C               ;0DB814|        |0DA320;
                       db $82,$B9,$20,$E7,$BA               ;0DB819|        |0DD8D5;
                       db $B0,$3D,$20,$B2,$B9               ;0DB81E|        |0DB85D;
                       db $A4,$32,$B9,$4B,$C9               ;0DB823|        |000032;
                       db $20,$B3,$E9,$20,$31               ;0DB828|        |0DE9B3;
                       db $B8,$4C,$5E,$B8,$20               ;0DB82D|        |      ;
                       db $E4,$B9,$20,$DE,$B8               ;0DB832|        |0000B9;
                       db $20,$4B,$B9,$A9,$11               ;0DB837|        |0DB94B;
                       db $4C,$5F,$E2,$20,$83               ;0DB83C|        |0DE25F;
 
                       db $B8,$D0,$3E,$20,$91               ;0DB841|        |      ;
                       db $B8,$A5,$0E,$29,$E0               ;0DB846|        |      ;
                       db $A4,$A5,$F0,$02,$09               ;0DB84B|        |0000A5;
                       db $10,$9D,$38,$04,$AD               ;0DB850|        |0DB7EF;
                       db $1C,$04,$18,$69,$1D               ;0DB855|        |0D1804;
                       db $9D,$1C,$04,$60,$20               ;0DB85A|        |0D041C;
                       db $83,$B8,$D0,$1F,$20               ;0DB85F|        |0000B8;
                       db $91,$B8,$A5,$12,$0A               ;0DB864|        |0000B8;
                       db $0A,$0A,$29,$E0,$A4               ;0DB869|        |      ;
                       db $A5,$F0,$02,$09,$10               ;0DB86E|        |0000F0;
                       db $38,$E5,$56,$9D,$38               ;0DB873|        |      ;
                       db $04,$AD,$1C,$04,$18               ;0DB878|        |0000AD;
                       db $69,$1E,$9D,$1C,$04               ;0DB87D|        |      ;
                       db $60,$A2,$01,$BD,$4E               ;0DB882|        |      ;
 
                       db $05,$F0,$06,$E8,$E0               ;0DB887|        |0000F0;
                       db $12,$90,$F6,$E8,$60               ;0DB88C|        |000090;
                       db $20,$D7,$FE,$A9,$89               ;0DB891|        |0DFED7;
                       db $9D,$4E,$05,$A9,$0C               ;0DB896|        |0D054E;
                       db $A0,$00,$20,$5C,$EF               ;0DB89B|        |      ;
                       db $A9,$E8,$9D,$00,$04               ;0DB8A0|        |      ;
                       db $A9,$01,$9D,$57,$06               ;0DB8A5|        |      ;
                       db $9D,$A8,$04,$A9,$60               ;0DB8AA|        |0D04A8;
                       db $9D,$70,$04,$A9,$03               ;0DB8AF|        |0D0470;
                       db $9D,$54,$04,$60                   ;0DB8B4|        |0D0454;
 
          CODE_0DB8B8: LDY.B #$01                           ;0DB8B8|A001    |      ;
                       LDA.B wCurrRoomGroupStage            ;0DB8BA|A532    |000032;
                       CMP.B #$07                           ;0DB8BC|C907    |      ;
                       BEQ CODE_0DB8CB                      ;0DB8BE|F00B    |0DB8CB;
                       CMP.B #$0A                           ;0DB8C0|C90A    |      ;
                       BNE CODE_0DB8CA                      ;0DB8C2|D006    |0DB8CA;
                       LDA.B wCurrRoomSectionBlock          ;0DB8C4|A533    |000033;
                       CMP.B #$01                           ;0DB8C6|C901    |      ;
                       BEQ CODE_0DB8CB                      ;0DB8C8|F001    |0DB8CB;
 
          CODE_0DB8CA: DEY                                  ;0DB8CA|88      |      ;
 
          CODE_0DB8CB: LDA.B wDoubleCurrRoomIdx             ;0DB8CB|A50E    |00000E;
                       LSR A                                ;0DB8CD|4A      |      ;
                       LSR A                                ;0DB8CE|4A      |      ;
                       LSR A                                ;0DB8CF|4A      |      ;
                       LSR A                                ;0DB8D0|4A      |      ;
                       TAX                                  ;0DB8D1|AA      |      ;
                       INC.W $03B0,X                        ;0DB8D2|FEB003  |0D03B0;
                       LDA.W $03B0,X                        ;0DB8D5|BDB003  |0D03B0;
                       AND.W UNREACH_0DB8DC,Y               ;0DB8D8|39DCB8  |0DB8DC;
                       RTS                                  ;0DB8DB|60      |      ;
 
 
       UNREACH_0DB8DC: db $0F,$07,$A9,$00,$85               ;0DB8DC|        |00A907;
                       db $04,$A5,$12,$0A,$0A               ;0DB8E1|        |0000A5;
                       db $26,$04,$0A,$0A,$0A               ;0DB8E6|        |000004;
                       db $0A,$0A,$26,$04,$A6               ;0DB8EB|        |      ;
                       db $04,$A5,$11,$20,$32               ;0DB8F0|        |0000A5;
                       db $B9,$A6,$A5,$A5,$0D               ;0DB8F5|        |0DA5A6;
                       db $3D,$50,$BA,$DD,$50               ;0DB8FA|        |0DBA50;
                       db $BA,$F0,$40,$E0,$00               ;0DB8FF|        |      ;
                       db $F0,$04,$4A,$4A,$4A               ;0DB904|        |0DB90A;
                       db $4A,$85,$00,$A4,$09               ;0DB909|        |      ;
                       db $B9,$E0,$06,$3D,$50               ;0DB90E|        |0D06E0;
                       db $BA,$D0,$2C,$A5,$16               ;0DB913|        |      ;
                       db $48,$A5,$17,$48,$A5               ;0DB918|        |      ;
                       db $00,$20,$14,$BB,$A5               ;0DB91D|        |      ;
                       db $04,$49,$01,$AA,$A5               ;0DB922|        |000049;
                       db $0C,$20,$32,$B9,$68               ;0DB927|        |0D3220;
                       db $85,$17,$68,$85,$16               ;0DB92C|        |000017;
                       db $60,$3D,$43,$B9,$85               ;0DB931|        |      ;
 
                       db $01,$A0,$04,$B1,$16               ;0DB936|        |0000A0;
                       db $3D,$47,$B9,$05,$01               ;0DB93B|        |0DB947;
                       db $85,$0C,$60,$FC,$F3               ;0DB940|        |00000C;
                       db $CF,$3F,$03,$0C,$30               ;0DB945|        |0C033F;
                       db $C0,$A0,$00,$20,$70               ;0DB94A|        |      ;
                       db $B9,$A9,$20,$05,$12               ;0DB94F|        |0D20A9;
                       db $85,$12,$20,$70,$B9               ;0DB954|        |000012;
                       db $A9,$01,$20,$14,$ED               ;0DB959|        |      ;
                       db $A5,$14,$20,$14,$ED               ;0DB95E|        |000014;
                       db $A5,$15,$20,$14,$ED               ;0DB963|        |000015;
                       db $A5,$0C,$20,$14,$ED               ;0DB968|        |00000C;
                       db $4C,$12,$ED,$20,$94               ;0DB96D|        |0DED12;
 
                       db $B9,$B1,$16,$20,$14               ;0DB972|        |0D16B1;
                       db $ED,$C8,$B1,$16,$20               ;0DB977|        |0DB1C8;
                       db $14,$ED,$C8,$4C,$12               ;0DB97C|        |0000ED;
                       db $ED                               ;0DB981|        |0D9420;
 
          CODE_0DB982: JSR.W CODE_0DB994                    ;0DB982|2094B9  |0DB994;
                       LDY.B wCurrRoomSectionPlayerPosAndScreenAddr;0DB985|A40A    |00000A;
                       LDA.W DATA8_0DB990,Y                 ;0DB987|B990B9  |0DB990;
                       db $20                               ;0DB98A|        |      ;
                       dw CODE_0FED14                       ;0DB98B|        |0FED14;
                       db $4C                               ;0DB98D|        |      ;
 
                       dw CODE_0FED12                       ;0DB98E|        |0FED12;
 
         DATA8_0DB990: db $2C,$2E,$2F,$2D                   ;0DB990|        |      ;
 
          CODE_0DB994: LDA.B #$01                           ;0DB994|A901    |      ;
                       db $20                               ;0DB996|        |      ;
                       dw CODE_0FED14                       ;0DB997|        |0FED14;
                       LDA.B wCollisionPointXvalDiv32       ;0DB999|A512    |000012;
                       db $20                               ;0DB99B|        |      ;
                       dw CODE_0FED14                       ;0DB99C|        |0FED14;
                       LDA.B wCollisionPointAbsoluteXInRoom ;0DB99E|A513    |000013;
                       db $4C                               ;0DB9A0|        |      ;
 
                       dw CODE_0FED14                       ;0DB9A1|        |0FED14;
 
          CODE_0DB9A3: LDY.B wCurrRoomSectionPlayerPosAndScreenAddr;0DB9A3|A40A    |00000A;
                       LDA.W DATA8_0DB9AE,Y                 ;0DB9A5|B9AEB9  |0DB9AE;
                       CLC                                  ;0DB9A8|18      |      ;
                       ADC.B wCollisionPointXvalDiv32       ;0DB9A9|6512    |000012;
                       STA.B wCollisionPointXvalDiv32       ;0DB9AB|8512    |000012;
                       RTS                                  ;0DB9AD|60      |      ;
 
 
         DATA8_0DB9AE: db $00,$01,$21,$20                   ;0DB9AE|        |      ;
                       LDA.B wCollisionPointAbsoluteXInRoom ;0DB9B2|A513    |000013;
                       AND.B #$F0                           ;0DB9B4|29F0    |      ;
                       STA.B wCollisionPointXvalDiv32       ;0DB9B6|8512    |000012;
                       LDA.B wCollisionPointAbsoluteXRoom   ;0DB9B8|A514    |000014;
                       EOR.B $75                            ;0DB9BA|4575    |000075;
                       LSR A                                ;0DB9BC|4A      |      ;
                       LDA.B #$20                           ;0DB9BD|A920    |      ;
                       BCC CODE_0DB9C3                      ;0DB9BF|9002    |0DB9C3;
                       LDA.B #$24                           ;0DB9C1|A924    |      ;
 
          CODE_0DB9C3: STA.B wCollisionPointAbsoluteXInRoom ;0DB9C3|8513    |000013;
                       LDA.W $041C                          ;0DB9C5|AD1C04  |0D041C;
                       LSR A                                ;0DB9C8|4A      |      ;
                       LSR A                                ;0DB9C9|4A      |      ;
                       LSR A                                ;0DB9CA|4A      |      ;
                       LSR A                                ;0DB9CB|4A      |      ;
                       ROR.B wCollisionPointXvalDiv32       ;0DB9CC|6612    |000012;
                       LSR A                                ;0DB9CE|4A      |      ;
                       ROR.B wCollisionPointXvalDiv32       ;0DB9CF|6612    |000012;
                       LSR A                                ;0DB9D1|4A      |      ;
                       ROR.B wCollisionPointXvalDiv32       ;0DB9D2|6612    |000012;
                       ORA.B wCollisionPointAbsoluteXInRoom ;0DB9D4|0513    |000013;
                       STA.B wCollisionPointAbsoluteXInRoom ;0DB9D6|8513    |000013;
                       CLC                                  ;0DB9D8|18      |      ;
                       LDA.B #$40                           ;0DB9D9|A940    |      ;
                       ADC.B wCollisionPointXvalDiv32       ;0DB9DB|6512    |000012;
                       STA.B wCollisionPointXvalDiv32       ;0DB9DD|8512    |000012;
                       BCC CODE_0DB9E3                      ;0DB9DF|9002    |0DB9E3;
                       INC.B wCollisionPointAbsoluteXInRoom ;0DB9E1|E613    |000013;
 
          CODE_0DB9E3: RTS                                  ;0DB9E3|60      |      ;
 
                       LDA.B wCollisionPointAbsoluteXInRoom ;0DB9E4|A513    |000013;
                       AND.B #$FC                           ;0DB9E6|29FC    |      ;
                       ORA.B #$03                           ;0DB9E8|0903    |      ;
                       STA.B w015                           ;0DB9EA|8515    |000015;
                       LDA.B wCollisionPointAbsoluteXInRoom ;0DB9EC|A513    |000013;
                       AND.B #$03                           ;0DB9EE|2903    |      ;
                       ORA.B #$0C                           ;0DB9F0|090C    |      ;
                       STA.B wCollisionPointAbsoluteXRoom   ;0DB9F2|8514    |000014;
                       LDA.B wCollisionPointXvalDiv32       ;0DB9F4|A512    |000012;
                       ASL A                                ;0DB9F6|0A      |      ;
                       ROL.B wCollisionPointAbsoluteXRoom   ;0DB9F7|2614    |000014;
                       ASL A                                ;0DB9F9|0A      |      ;
                       ASL A                                ;0DB9FA|0A      |      ;
                       ASL A                                ;0DB9FB|0A      |      ;
                       ROL.B wCollisionPointAbsoluteXRoom   ;0DB9FC|2614    |000014;
                       ASL A                                ;0DB9FE|0A      |      ;
                       ROL.B wCollisionPointAbsoluteXRoom   ;0DB9FF|2614    |000014;
                       ASL A                                ;0DBA01|0A      |      ;
                       ROL.B wCollisionPointAbsoluteXRoom   ;0DBA02|2614    |000014;
                       RTS                                  ;0DBA04|60      |      ;
 
 
          CODE_0DBA05: LDA.B wCollisionValIsForRightHalfOf32x16block;0DBA05|A5A5    |0000A5;
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
                       STA.B wCurrRoomSectionPlayerPosAndScreenAddr;0DBA31|850A    |00000A;
                       ORA.B $00                            ;0DBA33|0500    |000000;
                       STA.W $06E0,Y                        ;0DBA35|99E006  |0D06E0;
                       LDA.B wCurrRoomSectionPlayerPosAndScreenAddr;0DBA38|A50A    |00000A;
                       CMP.B #$10                           ;0DBA3A|C910    |      ;
                       BCC CODE_0DBA42                      ;0DBA3C|9004    |0DBA42;
                       LSR A                                ;0DBA3E|4A      |      ;
                       LSR A                                ;0DBA3F|4A      |      ;
                       LSR A                                ;0DBA40|4A      |      ;
                       LSR A                                ;0DBA41|4A      |      ;
 
          CODE_0DBA42: SEC                                  ;0DBA42|38      |      ;
                       SBC.B #$0C                           ;0DBA43|E90C    |      ;
                       STA.B wCurrRoomSectionPlayerPosAndScreenAddr;0DBA45|850A    |00000A;
                       RTS                                  ;0DBA47|60      |      ;
 
 
         DATA8_0DBA48: db $40,$04                           ;0DBA48|        |      ;
 
 
         DATA8_0DBA4A: db $80,$08                           ;0DBA4A|        |      ;
 
         DATA8_0DBA4C: db $10,$01                           ;0DBA4C|        |      ;
 
         DATA8_0DBA4E: db $F0,$0F                           ;0DBA4E|        |      ;
 
         DATA8_0DBA50: db $0F,$F0                           ;0DBA50|        |      ;
 
          CODE_0DBA52: PHA                                  ;0DBA52|48      |      ;
                       STY.B $02                            ;0DBA53|8402    |000002;
                       LDA.B wDoubleCurrRoomIdx             ;0DBA55|A50E    |00000E;
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
 
 
         DATA8_0DBA65: db $03,$01,$00,$00,$03               ;0DBA65|        |      ;
                       db $01,$00,$01,$03,$01               ;0DBA6A|        |      ;
                       db $00,$02,$03,$03,$00               ;0DBA6F|        |      ;
                       db $00,$03,$03,$00,$01               ;0DBA74|        |      ;
                       db $03,$03,$00,$02,$07               ;0DBA79|        |      ;
                       db $00,$00,$00,$07,$05               ;0DBA7E|        |      ;
                       db $00,$00,$07,$05,$00               ;0DBA83|        |      ;
                       db $01,$07,$05,$00,$02               ;0DBA88|        |      ;
                       db $07,$05,$01,$00,$08               ;0DBA8D|        |      ;
                       db $03,$00,$01,$08,$03               ;0DBA92|        |      ;
                       db $00,$02,$08,$04,$00               ;0DBA97|        |      ;
                       db $01,$08,$04,$00,$02               ;0DBA9C|        |      ;
                       db $08,$04,$00,$04,$0A               ;0DBAA1|        |      ;
                       db $01,$00,$00,$0A,$01               ;0DBAA6|        |      ;
                       db $00,$01,$0A,$05,$00               ;0DBAAB|        |      ;
                       db $01,$0A,$05,$00,$02               ;0DBAB0|        |      ;
                       db $0A,$06,$01,$00,$0A               ;0DBAB5|        |      ;
                       db $06,$01,$01,$0A,$06               ;0DBABA|        |      ;
                       db $01,$02,$0A,$06,$01               ;0DBABF|        |      ;
                       db $03,$0B,$02,$01,$00               ;0DBAC4|        |      ;
                       db $0B,$02,$01,$01,$0E               ;0DBAC9|        |      ;
                       db $00,$01,$00,$0E,$00               ;0DBACE|        |      ;
                       db $01,$01,$0E,$00,$01               ;0DBAD3|        |      ;
                       db $02,$0E,$00,$00,$00               ;0DBAD8|        |      ;
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
                       LDA.B wDoubleCurrRoomIdx             ;0DBAF3|A50E    |00000E;
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
                       STA.B wDoubleCurrSection             ;0DBB07|850D    |00000D;
                       AND.W DATA8_0DBA4E,X                 ;0DBB09|3D4EBA  |0DBA4E;
                       CPX.B #$00                           ;0DBB0C|E000    |      ;
                       BNE CODE_0DBB14                      ;0DBB0E|D004    |0DBB14;
                       LSR A                                ;0DBB10|4A      |      ;
                       LSR A                                ;0DBB11|4A      |      ;
                       LSR A                                ;0DBB12|4A      |      ;
                       LSR A                                ;0DBB13|4A      |      ;
 
          CODE_0DBB14: STA.B $00                            ;0DBB14|8500    |000000;
                       JSR.W CODE_0DBB91                    ;0DBB16|2091BB  |0DBB91;
                       LDA.B wCurrRoomGroupStage            ;0DBB19|A532    |000032;
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
                       STA.B wCoreLoadingFuncAddr           ;0DBB35|8516    |000016;
                       LDA.B $03                            ;0DBB37|A503    |000003;
                       ADC.B #$00                           ;0DBB39|6900    |      ;
                       STA.B $17                            ;0DBB3B|8517    |000017;
                       RTS                                  ;0DBB3D|60      |      ;
 
 
          CODE_0DBB3E: LDA.W $041C                          ;0DBB3E|AD1C04  |0D041C;
                       SEC                                  ;0DBB41|38      |      ;
                       SBC.B #$20                           ;0DBB42|E920    |      ;
                       CLC                                  ;0DBB44|18      |      ;
                       ADC.B wCurrScrollOffsetIntoRoomScreen;0DBB45|6556    |000056;
                       BCS CODE_0DBB4D                      ;0DBB47|B004    |0DBB4D;
                       CMP.B #$F0                           ;0DBB49|C9F0    |      ;
                       BCC CODE_0DBB50                      ;0DBB4B|9003    |0DBB50;
 
          CODE_0DBB4D: ADC.B #$0F                           ;0DBB4D|690F    |      ;
                       SEC                                  ;0DBB4F|38      |      ;
 
          CODE_0DBB50: STA.B $0B                            ;0DBB50|850B    |00000B;
                       LDA.B wCurrScrollRoomScreen          ;0DBB52|A557    |000057;
                       ADC.B #$00                           ;0DBB54|6900    |      ;
                       STA.B $07                            ;0DBB56|8507    |000007;
                       JMP.W CODE_0DBB5F                    ;0DBB58|4C5FBB  |0DBB5F;
 
 
          CODE_0DBB5B: LDA.B wRoomSectionChrBanksDataOffset ;0DBB5B|A50F    |00000F;
                       STA.B $07                            ;0DBB5D|8507    |000007;
 
          CODE_0DBB5F: LDA.B #$1F                           ;0DBB5F|A91F    |      ;
                       STA.B $02                            ;0DBB61|8502    |000002;
                       LDA.B wCurrRoomGroupStage            ;0DBB63|A532    |000032;
                       STA.B $04                            ;0DBB65|8504    |000004;
                       LDA.B wCurrRoomSectionBlock          ;0DBB67|A533    |000033;
                       STA.B $05                            ;0DBB69|8505    |000005;
                       LDA.B wCurrRoomIdx                   ;0DBB6B|A534    |000034;
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
                       LDY.B wCurrRoomGroupStage            ;0DBB93|A432    |000032;
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
                       LDY.B wRoomSectionChrBanksDataOffset ;0DBBAE|A40F    |00000F;
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
 
         DATA8_0DBBCA: db $FF,$FF,$00,$FF,$00               ;0DBBCA|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBBCF|        |      ;
                       db $12,$00,$FF,$FF,$00               ;0DBBD4|        |      ;
                       db $FF,$FF,$FF,$FF,$00               ;0DBBD9|        |      ;
                       db $FF,$00,$FF,$00,$FF               ;0DBBDE|        |      ;
                       db $FF,$FF,$FF,$00,$FF               ;0DBBE3|        |      ;
                       db $FF,$FF,$FF,$00,$FF               ;0DBBE8|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBBED|        |      ;
                       db $00,$FF,$FF,$FF,$FF               ;0DBBF2|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBBF7|        |      ;
                       db $FF,$FF,$FF,$00,$FF               ;0DBBFC|        |      ;
 
                       db $FF,$FF,$FF,$FF,$FF               ;0DBC01|        |      ;
                       db $FF,$FF,$12,$F3,$0F               ;0DBC06|        |      ;
                       db $00,$FF,$FF,$FF,$FF               ;0DBC0B|        |      ;
                       db $FF,$FF,$00,$F0,$30               ;0DBC10|        |      ;
                       db $12,$FF,$00,$FF,$FF               ;0DBC15|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBC1A|        |      ;
                       db $FF,$00,$FF,$FF,$FF               ;0DBC1F|        |      ;
                       db $FF,$FF,$FF,$34,$FF               ;0DBC24|        |      ;
                       db $34,$FF,$34,$FF,$12               ;0DBC29|        |      ;
                       db $FF,$12,$FF,$FF,$00               ;0DBC2E|        |      ;
                       db $FF,$12,$12,$12,$12               ;0DBC33|        |      ;
                       db $12,$12,$05,$FF,$FF               ;0DBC38|        |      ;
                       db $12,$FF,$12,$FF,$FF               ;0DBC3D|        |      ;
                       db $FF,$50,$FF,$FF,$FF               ;0DBC42|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBC47|        |      ;
                       db $FF,$FF,$00,$FF,$12               ;0DBC4C|        |      ;
                       db $FF,$34,$FF,$12,$FF               ;0DBC51|        |      ;
                       db $00,$FF,$FF,$FF,$FF               ;0DBC56|        |      ;
                       db $FF,$56,$78,$56,$FF               ;0DBC5B|        |567856;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBC60|        |FFFFFF;
                       db $FF,$FF,$56,$FF,$FF               ;0DBC65|        |FF56FF;
                       db $FF,$9A,$FF,$FF,$FF               ;0DBC6A|        |FFFF9A;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBC6F|        |FFFFFF;
                       db $FF,$FF,$FF,$BC,$BC               ;0DBC74|        |BCFFFF;
                       db $FF,$FF,$FF,$DC,$BC               ;0DBC79|        |DCFFFF;
                       db $FC,$FF,$BC,$FF,$FF               ;0DBC7E|        |0DBCFF;
                       db $DC,$EC,$BC,$BC,$BC               ;0DBC83|        |00BCEC;
 
                       db $FF,$FF,$23,$11,$23               ;0DBC88|        |1123FF;
                       db $DE,$11,$23,$11,$FF               ;0DBC8D|        |0D2311;
                       db $FF,$11,$23,$11,$11               ;0DBC92|        |112311;
                       db $23,$FF,$FF,$FF,$FF               ;0DBC97|        |0000FF;
                       db $FF,$FF,$FF,$FB,$FF               ;0DBC9C|        |FBFFFF;
                       db $FF,$01,$12,$FF,$FF               ;0DBCA1|        |FF1201;
                       db $34,$FF,$34,$56,$01               ;0DBCA6|        |0000FF;
                       db $FF,$FF,$FF,$FF,$78               ;0DBCAB|        |FFFFFF;
                       db $34,$9A,$FF,$FF,$00               ;0DBCB0|        |00009A;
                       db $00,$00,$FF,$FF,$FF               ;0DBCB5|        |      ;
                       db $00,$00,$FF,$00,$FF               ;0DBCBA|        |      ;
                       db $FF,$FF,$FF                       ;0DBCBF|        |E0FFFF;
 
       UNREACH_0DBCC2: db $E0                               ;0DBCC2|        |      ;
 
       UNREACH_0DBCC3: db $BC,$E0,$BC,$E0,$BC               ;0DBCC3|        |0DBCE0;
                       db $E0,$BC,$E0,$BC,$E0               ;0DBCC8|        |      ;
                       db $BC,$E0,$BC,$EF,$BC               ;0DBCCD|        |0DBCE0;
                       db $03,$BD,$E0,$BC,$21               ;0DBCD2|        |0000BD;
                       db $BD,$67,$BD,$E0,$BC               ;0DBCD7|        |0DBD67;
                       db $E0,$BC,$80,$BD,$00               ;0DBCDC|        |      ;
                       db $00,$00,$00,$00,$7C               ;0DBCE1|        |      ;
                       db $3E,$7C,$3E,$55,$7F               ;0DBCE6|        |0D3E7C;
                       db $00,$7E,$00,$55,$00               ;0DBCEB|        |      ;
                       db $00,$00,$00,$00,$80               ;0DBCF0|        |      ;
                       db $81,$94,$91,$AA,$A0               ;0DBCF5|        |000094;
                       db $A1,$B0,$B1,$AA,$77               ;0DBCFA|        |0000B0;
                       db $00,$84,$95,$AA,$00               ;0DBCFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0DBD04|        |      ;
                       db $00,$84,$85,$AA,$AC               ;0DBD09|        |      ;
                       db $00,$B4,$AC,$FF,$84               ;0DBD0E|        |      ;
                       db $85,$94,$95,$AA,$86               ;0DBD13|        |000094;
                       db $3F,$96,$AC,$FF,$00               ;0DBD18|        |FFAC96;
                       db $AC,$AC,$00,$FF,$00               ;0DBD1D|        |0D00AC;
                       db $00,$00,$00,$00,$4D               ;0DBD22|        |      ;
                       db $4C,$5D,$5F,$FF,$00               ;0DBD27|        |0D5F5D;
 
                       db $00,$5E,$00,$FF,$5D               ;0DBD2C|        |      ;
                       db $5F,$4C,$4F,$FF,$4F               ;0DBD31|        |FF4F4C;
                       db $4C,$5F,$5D,$FF,$5D               ;0DBD36|        |0D5D5F;
                       db $00,$00,$4D,$55,$5D               ;0DBD3B|        |      ;
                       db $00,$4C,$5C,$55,$4D               ;0DBD40|        |      ;
                       db $4C,$5D,$5F,$55,$4F               ;0DBD45|        |0D5F5D;
                       db $5F,$5E,$5D,$55,$6B               ;0DBD4A|        |555D5E;
                       db $88,$7C,$6A,$55,$7E               ;0DBD4F|        |      ;
                       db $7F,$89,$7E,$55,$80               ;0DBD54|        |557E89;
                       db $81,$90,$91,$AA,$81               ;0DBD59|        |000090;
                       db $82,$91,$92,$AA,$80               ;0DBD5E|        |0D4FF2;
                       db $81,$84,$91,$AA,$00               ;0DBD63|        |000084;
                       db $00,$00,$00,$00,$40               ;0DBD68|        |      ;
                       db $41,$50,$51,$55,$84               ;0DBD6D|        |000050;
                       db $85,$94,$95,$55,$86               ;0DBD72|        |000094;
                       db $87,$96,$97,$55,$49               ;0DBD77|        |000096;
                       db $49,$48,$48,$55,$00               ;0DBD7C|        |      ;
                       db $00,$00,$00,$00,$00               ;0DBD81|        |      ;
                       db $4C,$00,$4C,$AA,$4F               ;0DBD86|        |0D4C00;
                       db $00,$4F,$00,$AA,$A8               ;0DBD8B|        |      ;
                       db $A9,$92,$B0,$FF,$96               ;0DBD90|        |      ;
                       db $00,$A6,$00,$FF,$00               ;0DBD95|        |      ;
                       db $A3,$00,$91,$55,$B7               ;0DBD9A|        |000000;
                       db $00,$3E,$00,$55,$00               ;0DBD9F|        |      ;
                       db $00,$9B,$AA,$FF,$8E               ;0DBDA4|        |      ;
                       db $9C,$AB,$9C,$FF,$9C               ;0DBDA9|        |0D9CAB;
                       db $28,$9B,$39,$FF,$00               ;0DBDAE|        |      ;
                       db $AA,$8F,$28,$FF,$3E               ;0DBDB3|        |      ;
                       db $00,$3E,$00,$55,$A9               ;0DBDB8|        |      ;
                       db $01,$20,$14,$ED,$A9               ;0DBDBD|        |000020;
                       db $00,$20,$14,$ED,$A9               ;0DBDC2|        |      ;
                       db $23,$20,$14,$ED,$A9               ;0DBDC7|        |000020;
                       db $BC,$85,$03,$A0,$00               ;0DBDCC|        |0D0385;
 
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
 
       UNREACH_0DBE61: db $1E,$20,$FF,$FF,$FF               ;0DBE61|        |0DFF20;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE66|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE6B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE70|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE7A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE7F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE84|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE89|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE8E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE93|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE98|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBE9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEA2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEA7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEAC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEB1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEB6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEBB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEC0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBECA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBECF|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBED4|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBED9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEDE|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEE3|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEE8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEF2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEF7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBEFC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF01|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF06|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF0B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF10|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF1A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF1F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF24|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF29|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF2E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF33|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF38|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF42|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF47|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF4C|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF51|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF56|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF5B|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF60|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF6A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF6F|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF74|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF79|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF7E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF83|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF88|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF92|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF97|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBF9C|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFA1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFA6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFAB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFB0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFBA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFBF|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFC4|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFC9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFCE|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFD3|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFD8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFE2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFE7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFEC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFF1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFF6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0DBFFB|        |FFFFFF;
 
