 
                       ORG $0A8000
 
 
              bank_94: db $94                               ;0A8000|        |      ; NES PRG 28000
 
          CODE_0A8001: CLC                                  ;0A8001|18      |      ;
                       LDA.B r_sceneScrollOffsetLo          ;0A8002|A556    |000056;
                       ADC.B #$02                           ;0A8004|6902    |      ;
                       PHA                                  ;0A8006|48      |      ;
                       LDA.B r_sceneScrollOffsetHi          ;0A8007|A557    |000057;
                       ADC.B #$00                           ;0A8009|6900    |      ;
                       STA.B r_quarterSpawner_Xpos          ;0A800B|8576    |000076;
                       PLA                                  ;0A800D|68      |      ;
                       JMP.W CODE_0A8017                    ;0A800E|4C1780  |0A8017;
 
 
          CODE_0A8011: LDA.B r_sceneScrollOffsetHi          ;0A8011|A557    |000057;
                       STA.B r_quarterSpawner_Xpos          ;0A8013|8576    |000076;
                       LDA.B r_sceneScrollOffsetLo          ;0A8015|A556    |000056;
 
          CODE_0A8017: ASL A                                ;0A8017|0A      |      ;
                       ROL.B r_quarterSpawner_Xpos          ;0A8018|2676    |000076;
                       ASL A                                ;0A801A|0A      |      ;
                       ROL.B r_quarterSpawner_Xpos          ;0A801B|2676    |000076;
                       RTS                                  ;0A801D|60      |      ;
 
 
          CODE_0A801E: LDA.B r_stage                        ;0A801E|A532    |000032;
                       ASL A                                ;0A8020|0A      |      ;
                       TAY                                  ;0A8021|A8      |      ;
                       LDA.W roomEntityDataAddresses,Y      ;0A8022|B97F93  |0A937F;
                       STA.B $06                            ;0A8025|8506    |000006;
                       LDA.W PTR16_0A9380,Y                 ;0A8027|B98093  |0A9380;
                       STA.B $07                            ;0A802A|8507    |000007;
                       LDA.B r_blockLevel                   ;0A802C|A533    |000033;
                       ASL A                                ;0A802E|0A      |      ;
                       TAY                                  ;0A802F|A8      |      ;
                       LDA.B ($06),Y                        ;0A8030|B106    |000006;
                       STA.B $04                            ;0A8032|8504    |000004;
                       INY                                  ;0A8034|C8      |      ;
                       LDA.B ($06),Y                        ;0A8035|B106    |000006;
                       STA.B $05                            ;0A8037|8505    |000005;
                       LDA.B r_roomIdx                      ;0A8039|A534    |000034;
                       ASL A                                ;0A803B|0A      |      ;
                       TAY                                  ;0A803C|A8      |      ;
                       LDA.B ($04),Y                        ;0A803D|B104    |000004;
                       STA.B r_roomEntityDataAddrSpawner    ;0A803F|8598    |000098;
                       INY                                  ;0A8041|C8      |      ;
                       LDA.B ($04),Y                        ;0A8042|B104    |000004;
                       STA.B $99                            ;0A8044|8599    |000099;
                       RTS                                  ;0A8046|60      |      ;
 
                       LDX.B #$00                           ;0A8047|A200    |      ;
 
          CODE_0A8049: LDA.B #$00                           ;0A8049|A900    |      ;
                       STA.B r_0f0,X                        ;0A804B|95F0    |0000F0;
                       INX                                  ;0A804D|E8      |      ;
                       CPX.B #$04                           ;0A804E|E004    |      ;
                       BCC CODE_0A8049                      ;0A8050|90F7    |0A8049;
                       JSR.W CODE_0A8011                    ;0A8052|201180  |0A8011;
                       JSR.W CODE_0A801E                    ;0A8055|201E80  |0A801E;
                       LDA.B #$06                           ;0A8058|A906    |      ;
                       STA.B r_tempCurrGroup                ;0A805A|850C    |00000C;
                       LDA.B r_sceneScrollOffsetLo          ;0A805C|A556    |000056;
                       AND.B #$3F                           ;0A805E|293F    |      ;
                       STA.B r_pointerQueue_VRAM            ;0A8060|8508    |000008;
                       LDA.B #$C0                           ;0A8062|A9C0    |      ;
                       SEC                                  ;0A8064|38      |      ;
                       SBC.B r_pointerQueue_VRAM            ;0A8065|E508    |000008;
                       STA.B $09                            ;0A8067|8509    |000009;
                       LDA.B #$01                           ;0A8069|A901    |      ;
                       STA.B r_temp_Xpos                    ;0A806B|850A    |00000A;
 
          CODE_0A806D: JSR.W CODE_0A80FC                    ;0A806D|20FC80  |0A80FC;
                       INC.B r_quarterSpawner_Xpos          ;0A8070|E676    |000076;
                       LDA.B $09                            ;0A8072|A509    |000009;
                       CLC                                  ;0A8074|18      |      ;
                       ADC.B #$40                           ;0A8075|6940    |      ;
                       STA.B $09                            ;0A8077|8509    |000009;
                       LDA.B r_temp_Xpos                    ;0A8079|A50A    |00000A;
                       ADC.B #$00                           ;0A807B|6900    |      ;
                       AND.B #$01                           ;0A807D|2901    |      ;
                       STA.B r_temp_Xpos                    ;0A807F|850A    |00000A;
                       DEC.B r_tempCurrGroup                ;0A8081|C60C    |00000C;
                       BNE CODE_0A806D                      ;0A8083|D0E8    |0A806D;
                       LDA.B #$FF                           ;0A8085|A9FF    |      ;
                       STA.B r_spawnerBlock                 ;0A8087|8577    |000077;
 
          CODE_0A8089: RTS                                  ;0A8089|60      |      ;
 
                       LDY.B r_scrollSpd                    ;0A808A|A46E    |00006E;
                       BEQ CODE_0A8089                      ;0A808C|F0FB    |0A8089;
                       DEY                                  ;0A808E|88      |      ;
                       BEQ CODE_0A80B9                      ;0A808F|F028    |0A80B9;
                       DEY                                  ;0A8091|88      |      ;
                       BEQ CODE_0A80AA                      ;0A8092|F016    |0A80AA;
                       LDY.B r_scrollSpd                    ;0A8094|A46E    |00006E;
                       CPY.B #$FF                           ;0A8096|C0FF    |      ;
                       BEQ CODE_0A80B9                      ;0A8098|F01F    |0A80B9;
                       LDA.B r_sceneScrollOffsetLo          ;0A809A|A556    |000056;
                       AND.B #$3F                           ;0A809C|293F    |      ;
                       CMP.B #$3F                           ;0A809E|C93F    |      ;
                       BNE CODE_0A80B9                      ;0A80A0|D017    |0A80B9;
                       LDA.B r_sceneScrollOffsetLo          ;0A80A2|A556    |000056;
                       CLC                                  ;0A80A4|18      |      ;
                       ADC.B #$01                           ;0A80A5|6901    |      ;
                       JMP.W CODE_0A80C1                    ;0A80A7|4CC180  |0A80C1;
 
 
          CODE_0A80AA: LDA.B r_sceneScrollOffsetLo          ;0A80AA|A556    |000056;
                       AND.B #$3F                           ;0A80AC|293F    |      ;
                       CMP.B #$01                           ;0A80AE|C901    |      ;
                       BNE CODE_0A80B9                      ;0A80B0|D007    |0A80B9;
                       LDA.B r_sceneScrollOffsetLo          ;0A80B2|A556    |000056;
                       AND.B #$FE                           ;0A80B4|29FE    |      ;
                       JMP.W CODE_0A80C1                    ;0A80B6|4CC180  |0A80C1;
 
 
          CODE_0A80B9: LDA.B r_sceneScrollOffsetLo          ;0A80B9|A556    |000056;
                       AND.B #$3F                           ;0A80BB|293F    |      ;
                       BNE CODE_0A8089                      ;0A80BD|D0CA    |0A8089;
                       LDA.B r_sceneScrollOffsetLo          ;0A80BF|A556    |000056;
 
          CODE_0A80C1: CMP.B r_spawnerBlock                 ;0A80C1|C577    |000077;
                       BEQ CODE_0A8089                      ;0A80C3|F0C4    |0A8089;
                       STA.B r_spawnerBlock                 ;0A80C5|8577    |000077;
                       JSR.W CODE_0A8001                    ;0A80C7|200180  |0A8001;
                       LDA.B #$00                           ;0A80CA|A900    |      ;
                       LDY.B #$C0                           ;0A80CC|A0C0    |      ;
                       LDX.B r_scrollDirection              ;0A80CE|A665    |000065;
                       BEQ CODE_0A80D6                      ;0A80D0|F004    |0A80D6;
                       LDA.B #$05                           ;0A80D2|A905    |      ;
                       LDY.B #$00                           ;0A80D4|A000    |      ;
 
          CODE_0A80D6: STY.B $09                            ;0A80D6|8409    |000009;
                       STA.B r_pointerQueue_VRAM            ;0A80D8|8508    |000008;
                       LDA.B r_sceneScrollOffsetLo          ;0A80DA|A556    |000056;
                       AND.B #$3F                           ;0A80DC|293F    |      ;
                       STA.B r_tempCurrRoomIdx              ;0A80DE|850E    |00000E;
                       AND.B #$20                           ;0A80E0|2920    |      ;
                       BEQ CODE_0A80EA                      ;0A80E2|F006    |0A80EA;
                       LDA.B r_tempCurrRoomIdx              ;0A80E4|A50E    |00000E;
                       ORA.B #$C0                           ;0A80E6|09C0    |      ;
                       BNE CODE_0A80EC                      ;0A80E8|D002    |0A80EC;
 
          CODE_0A80EA: LDA.B r_tempCurrRoomIdx              ;0A80EA|A50E    |00000E;
 
          CODE_0A80EC: CLC                                  ;0A80EC|18      |      ;
                       ADC.B $09                            ;0A80ED|6509    |000009;
                       STA.B $09                            ;0A80EF|8509    |000009;
                       LDA.B r_quarterSpawner_Xpos          ;0A80F1|A576    |000076;
                       CLC                                  ;0A80F3|18      |      ;
                       ADC.B r_pointerQueue_VRAM            ;0A80F4|6508    |000008;
                       STA.B r_quarterSpawner_Xpos          ;0A80F6|8576    |000076;
                       LDA.B #$01                           ;0A80F8|A901    |      ;
                       STA.B r_temp_Xpos                    ;0A80FA|850A    |00000A;
 
          CODE_0A80FC: LDY.B r_quarterSpawner_Xpos          ;0A80FC|A476    |000076;
                       LDX.W DATA8_0A840C,Y                 ;0A80FE|BE0C84  |0A840C;
                       LDA.B r_quarterSpawner_Xpos          ;0A8101|A576    |000076;
                       ASL A                                ;0A8103|0A      |      ;
                       TAY                                  ;0A8104|A8      |      ;
                       STY.B $0B                            ;0A8105|840B    |00000B;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8107|B198    |000098;
                       ASL A                                ;0A8109|0A      |      ;
                       BCS CODE_0A811A                      ;0A810A|B00E    |0A811A;
 
          CODE_0A810C: TAY                                  ;0A810C|A8      |      ;
                       LDA.W PTR16_0AA03F,Y                 ;0A810D|B93FA0  |0AA03F;
                       STA.B $00                            ;0A8110|8500    |000000;
                       LDA.W PTR16_0AA040,Y                 ;0A8112|B940A0  |0AA040;
                       STA.B $01                            ;0A8115|8501    |000001;
                       JMP.W CODE_0A8132                    ;0A8117|4C3281  |0A8132;
 
 
          CODE_0A811A: LDY.W $07F6                          ;0A811A|ACF607  |0A07F6;
                       BNE CODE_0A8127                      ;0A811D|D008    |0A8127;
                       CMP.B #$A0                           ;0A811F|C9A0    |      ;
                       BCC CODE_0A8127                      ;0A8121|9004    |0A8127;
                       LDA.B #$00                           ;0A8123|A900    |      ;
                       BEQ CODE_0A810C                      ;0A8125|F0E5    |0A810C;
 
          CODE_0A8127: TAY                                  ;0A8127|A8      |      ;
                       LDA.W PTR16_0AA13F,Y                 ;0A8128|B93FA1  |0AA13F;
                       STA.B $00                            ;0A812B|8500    |000000;
                       LDA.W PTR16_0AA140,Y                 ;0A812D|B940A1  |0AA140;
                       STA.B $01                            ;0A8130|8501    |000001;
 
          CODE_0A8132: LDY.B #$00                           ;0A8132|A000    |      ;
                       LDA.B ($00),Y                        ;0A8134|B100    |000000;
                       STA.W $07C2,X                        ;0A8136|9DC207  |0A07C2;
                       BEQ CODE_0A8178                      ;0A8139|F03D    |0A8178;
                       INY                                  ;0A813B|C8      |      ;
                       LDA.B ($00),Y                        ;0A813C|B100    |000000;
                       CLC                                  ;0A813E|18      |      ;
                       ADC.B $09                            ;0A813F|6509    |000009;
                       STA.W $07DA,X                        ;0A8141|9DDA07  |0A07DA;
                       LDA.B r_temp_Xpos                    ;0A8144|A50A    |00000A;
                       ADC.B #$00                           ;0A8146|6900    |      ;
                       AND.B #$01                           ;0A8148|2901    |      ;
                       STA.W $07E0,X                        ;0A814A|9DE007  |0A07E0;
                       INY                                  ;0A814D|C8      |      ;
                       LDA.B ($00),Y                        ;0A814E|B100    |000000;
                       STA.W $07D4,X                        ;0A8150|9DD407  |0A07D4;
                       INY                                  ;0A8153|C8      |      ;
                       LDA.B ($00),Y                        ;0A8154|B100    |000000;
                       STA.W $07E6,X                        ;0A8156|9DE607  |0A07E6;
                       INY                                  ;0A8159|C8      |      ;
                       LDA.B ($00),Y                        ;0A815A|B100    |000000;
                       STA.W $07CE,X                        ;0A815C|9DCE07  |0A07CE;
                       TXA                                  ;0A815F|8A      |      ;
                       PHA                                  ;0A8160|48      |      ;
                       LDA.W $07C8,X                        ;0A8161|BDC807  |0A07C8;
                       LSR A                                ;0A8164|4A      |      ;
                       LSR A                                ;0A8165|4A      |      ;
                       LSR A                                ;0A8166|4A      |      ;
                       LSR A                                ;0A8167|4A      |      ;
                       TAX                                  ;0A8168|AA      |      ;
                       LDA.W $0470,X                        ;0A8169|BD7004  |0A0470;
                       AND.B #$FB                           ;0A816C|29FB    |      ;
                       STA.W $0470,X                        ;0A816E|9D7004  |0A0470;
                       PLA                                  ;0A8171|68      |      ;
                       TAX                                  ;0A8172|AA      |      ;
                       LDA.B #$00                           ;0A8173|A900    |      ;
                       STA.W $07C8,X                        ;0A8175|9DC807  |0A07C8;
 
          CODE_0A8178: JSR.W CODE_0A848D                    ;0A8178|208D84  |0A848D;
                       BNE CODE_0A817E                      ;0A817B|D001    |0A817E;
                       RTS                                  ;0A817D|60      |      ;
 
 
          CODE_0A817E: TXA                                  ;0A817E|8A      |      ;
                       CLC                                  ;0A817F|18      |      ;
                       ADC.B #$0D                           ;0A8180|690D    |      ;
                       TAX                                  ;0A8182|AA      |      ;
                       JSR.W CODE_0A843C                    ;0A8183|203C84  |0A843C;
                       BNE DATA8_0A81E6                     ;0A8186|D05E    |0A81E6;
                       LDY.B $0B                            ;0A8188|A40B    |00000B;
                       INY                                  ;0A818A|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A818B|B198    |000098;
                       BEQ DATA8_0A81E6                     ;0A818D|F057    |0A81E6;
                       ASL A                                ;0A818F|0A      |      ;
                       BCS CODE_0A81A0                      ;0A8190|B00E    |0A81A0;
                       TAY                                  ;0A8192|A8      |      ;
                       LDA.W luminaryMetadataPointer,Y      ;0A8193|B944A6  |0AA644;
                       STA.B $00                            ;0A8196|8500    |000000;
                       LDA.W PTR16_0AA645,Y                 ;0A8198|B945A6  |0AA645;
                       STA.B $01                            ;0A819B|8501    |000001;
                       JMP.W DATA8_0A81AB                   ;0A819D|4CAB81  |0A81AB;
 
 
          CODE_0A81A0: TAY                                  ;0A81A0|A8      |      ;
                       LDA.W PTR16_0AA744,Y                 ;0A81A1|B944A7  |0AA744;
                       STA.B $00                            ;0A81A4|8500    |000000;
                       LDA.W PTR16_0AA745,Y                 ;0A81A6|B945A7  |0AA745;
                       STA.B $01                            ;0A81A9|8501    |000001;
 
         DATA8_0A81AB: db $20                               ;0A81AB|        |      ;
                       dw CODE_0FFED7                       ;0A81AC|        |0FFED7;
                       LDY.B #$00                           ;0A81AE|A000    |      ;
                       LDA.B ($00),Y                        ;0A81B0|B100    |000000;
                       STA.W $054E,X                        ;0A81B2|9D4E05  |0A054E;
                       INY                                  ;0A81B5|C8      |      ;
                       LDA.B ($00),Y                        ;0A81B6|B100    |000000;
                       STA.W $05D8,X                        ;0A81B8|9DD805  |0A05D8;
                       INY                                  ;0A81BB|C8      |      ;
                       LDA.B ($00),Y                        ;0A81BC|B100    |000000;
                       CLC                                  ;0A81BE|18      |      ;
                       ADC.B $09                            ;0A81BF|6509    |000009;
                       STA.W $0438,X                        ;0A81C1|9D3804  |0A0438;
                       LDA.B r_temp_Xpos                    ;0A81C4|A50A    |00000A;
                       ADC.B #$00                           ;0A81C6|6900    |      ;
                       AND.B #$01                           ;0A81C8|2901    |      ;
                       STA.W $0470,X                        ;0A81CA|9D7004  |0A0470;
                       INY                                  ;0A81CD|C8      |      ;
                       LDA.B ($00),Y                        ;0A81CE|B100    |000000;
                       STA.W $041C,X                        ;0A81D0|9D1C04  |0A041C;
                       LDA.W $054E,X                        ;0A81D3|BD4E05  |0A054E;
                       SEC                                  ;0A81D6|38      |      ;
                       SBC.B #$90                           ;0A81D7|E990    |      ;
                       TAY                                  ;0A81D9|A8      |      ;
                       LDA.W DATA8_0A8325,Y                 ;0A81DA|B92583  |0A8325;
                       STA.W $05EF,X                        ;0A81DD|9DEF05  |0A05EF;
                       LDA.B r_quarterSpawner_Xpos          ;0A81E0|A576    |000076;
                       STA.W $0645,X                        ;0A81E2|9D4506  |0A0645;
                       RTS                                  ;0A81E5|60      |      ;
 
 
         DATA8_0A81E6: db $20                               ;0A81E6|        |      ;
                       dw CODE_0FFED7                       ;0A81E7|        |0FFED7;
 
          CODE_0A81E9: LDA.B #$00                           ;0A81E9|A900    |      ;
                       STA.W $054E,X                        ;0A81EB|9D4E05  |0A054E;
                       STA.W $0470,X                        ;0A81EE|9D7004  |0A0470;
                       STA.W $0400,X                        ;0A81F1|9D0004  |0A0400;
                       STA.W $05EF,X                        ;0A81F4|9DEF05  |0A05EF;
                       RTS                                  ;0A81F7|60      |      ;
 
                       JSR.W CODE_0A8369                    ;0A81F8|206983  |0A8369;
                       LDA.B #$00                           ;0A81FB|A900    |      ;
                       STA.B $79                            ;0A81FD|8579    |000079;
                       STA.B $7A                            ;0A81FF|857A    |00007A;
 
          CODE_0A8201: JSR.W CODE_0A801E                    ;0A8201|201E80  |0A801E;
                       LDY.B $79                            ;0A8204|A479    |000079;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8206|B198    |000098;
                       CMP.B #$FF                           ;0A8208|C9FF    |      ;
                       BEQ CODE_0A825D                      ;0A820A|F051    |0A825D;
                       JSR.W CODE_0A831D                    ;0A820C|201D83  |0A831D;
                       LDA.B r_temp_Xpos                    ;0A820F|A50A    |00000A;
                       SEC                                  ;0A8211|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;0A8212|E556    |000056;
                       STA.B $02                            ;0A8214|8502    |000002;
                       LDA.B $09                            ;0A8216|A509    |000009;
                       SBC.B r_sceneScrollOffsetHi          ;0A8218|E557    |000057;
                       STA.B $03                            ;0A821A|8503    |000003;
                       BMI CODE_0A8253                      ;0A821C|3035    |0A8253;
                       SEC                                  ;0A821E|38      |      ;
                       LDA.B $09                            ;0A821F|A509    |000009;
                       SBC.B r_sceneScrollOffsetHi          ;0A8221|E557    |000057;
                       BEQ CODE_0A8235                      ;0A8223|F010    |0A8235;
                       SEC                                  ;0A8225|38      |      ;
                       SBC.B #$01                           ;0A8226|E901    |      ;
                       BNE CODE_0A8253                      ;0A8228|D029    |0A8253;
                       SEC                                  ;0A822A|38      |      ;
                       LDA.B $02                            ;0A822B|A502    |000002;
                       SBC.B #$10                           ;0A822D|E910    |      ;
                       STA.B $02                            ;0A822F|8502    |000002;
                       BCS CODE_0A8235                      ;0A8231|B002    |0A8235;
                       DEC.B $03                            ;0A8233|C603    |000003;
 
          CODE_0A8235: LDA.B $03                            ;0A8235|A503    |000003;
                       BNE CODE_0A8253                      ;0A8237|D01A    |0A8253;
                       LDA.B $02                            ;0A8239|A502    |000002;
                       CMP.B #$B9                           ;0A823B|C9B9    |      ;
                       BCS CODE_0A8253                      ;0A823D|B014    |0A8253;
                       LDA.B $02                            ;0A823F|A502    |000002;
                       CLC                                  ;0A8241|18      |      ;
                       ADC.B #$37                           ;0A8242|6937    |      ;
                       STA.B r_temp_Xpos                    ;0A8244|850A    |00000A;
                       CLC                                  ;0A8246|18      |      ;
                       LDA.B $7A                            ;0A8247|A57A    |00007A;
                       ADC.B #$07                           ;0A8249|6907    |      ;
                       STA.B $7A                            ;0A824B|857A    |00007A;
                       JSR.W CODE_0A8271                    ;0A824D|207182  |0A8271;
                       JMP.W CODE_0A8201                    ;0A8250|4C0182  |0A8201;
 
 
          CODE_0A8253: CLC                                  ;0A8253|18      |      ;
                       LDA.B $79                            ;0A8254|A579    |000079;
                       ADC.B #$07                           ;0A8256|6907    |      ;
                       STA.B $79                            ;0A8258|8579    |000079;
                       JMP.W CODE_0A8201                    ;0A825A|4C0182  |0A8201;
 
 
          CODE_0A825D: LDA.B $7A                            ;0A825D|A57A    |00007A;
                       STA.B $79                            ;0A825F|8579    |000079;
 
          CODE_0A8261: RTS                                  ;0A8261|60      |      ;
 
                       LDA.B r_sceneScrollOffsetLo          ;0A8262|A556    |000056;
                       AND.B #$F0                           ;0A8264|29F0    |      ;
                       CMP.B r_spawnerBlock                 ;0A8266|C577    |000077;
                       BEQ CODE_0A8261                      ;0A8268|F0F7    |0A8261;
                       STA.B r_spawnerBlock                 ;0A826A|8577    |000077;
                       JSR.W CODE_0A82D7                    ;0A826C|20D782  |0A82D7;
                       BCC CODE_0A8261                      ;0A826F|90F0    |0A8261;
 
          CODE_0A8271: CLC                                  ;0A8271|18      |      ;
                       LDA.B $79                            ;0A8272|A579    |000079;
                       ADC.B #$07                           ;0A8274|6907    |      ;
                       STA.B $79                            ;0A8276|8579    |000079;
                       INY                                  ;0A8278|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8279|B198    |000098;
                       BMI CODE_0A82A8                      ;0A827B|302B    |0A82A8;
                       JSR.W CODE_0A835B                    ;0A827D|205B83  |0A835B;
                       BNE CODE_0A82D6                      ;0A8280|D054    |0A82D6;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8282|B198    |000098;
                       STA.W $07C2,X                        ;0A8284|9DC207  |0A07C2;
                       INY                                  ;0A8287|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8288|B198    |000098;
                       STA.W $07DA,X                        ;0A828A|9DDA07  |0A07DA;
                       INY                                  ;0A828D|C8      |      ;
                       INY                                  ;0A828E|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A828F|B198    |000098;
                       STA.W $07E6,X                        ;0A8291|9DE607  |0A07E6;
                       INY                                  ;0A8294|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8295|B198    |000098;
                       STA.W $07CE,X                        ;0A8297|9DCE07  |0A07CE;
                       LDA.B r_temp_Xpos                    ;0A829A|A50A    |00000A;
                       STA.W $07D4,X                        ;0A829C|9DD407  |0A07D4;
                       LDA.B #$00                           ;0A829F|A900    |      ;
                       STA.W $07E0,X                        ;0A82A1|9DE007  |0A07E0;
                       STA.W $07C8,X                        ;0A82A4|9DC807  |0A07C8;
                       RTS                                  ;0A82A7|60      |      ;
 
 
          CODE_0A82A8: JSR.W CODE_0A834D                    ;0A82A8|204D83  |0A834D;
                       BNE CODE_0A82D6                      ;0A82AB|D029    |0A82D6;
                       db $20                               ;0A82AD|        |      ;
                       dw CODE_0FFED7                       ;0A82AE|        |0FFED7;
                       STA.W $0470,X                        ;0A82B0|9D7004  |0A0470;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A82B3|B198    |000098;
                       STA.W $054E,X                        ;0A82B5|9D4E05  |0A054E;
                       INY                                  ;0A82B8|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A82B9|B198    |000098;
                       STA.W $0438,X                        ;0A82BB|9D3804  |0A0438;
                       INY                                  ;0A82BE|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A82BF|B198    |000098;
                       STA.W $05D8,X                        ;0A82C1|9DD805  |0A05D8;
                       LDA.B r_temp_Xpos                    ;0A82C4|A50A    |00000A;
                       STA.W $041C,X                        ;0A82C6|9D1C04  |0A041C;
                       LDA.W $054E,X                        ;0A82C9|BD4E05  |0A054E;
                       SEC                                  ;0A82CC|38      |      ;
                       SBC.B #$90                           ;0A82CD|E990    |      ;
                       TAY                                  ;0A82CF|A8      |      ;
                       LDA.W DATA8_0A8325,Y                 ;0A82D0|B92583  |0A8325;
                       STA.W $05EF,X                        ;0A82D3|9DEF05  |0A05EF;
 
          CODE_0A82D6: RTS                                  ;0A82D6|60      |      ;
 
 
          CODE_0A82D7: LDY.B $79                            ;0A82D7|A479    |000079;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A82D9|B198    |000098;
                       CMP.B #$FF                           ;0A82DB|C9FF    |      ;
                       BEQ CODE_0A82F1                      ;0A82DD|F012    |0A82F1;
                       JSR.W CODE_0A831D                    ;0A82DF|201D83  |0A831D;
                       LDA.B r_temp_Xpos                    ;0A82E2|A50A    |00000A;
                       SEC                                  ;0A82E4|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;0A82E5|E556    |000056;
                       STA.B $02                            ;0A82E7|8502    |000002;
                       LDA.B $09                            ;0A82E9|A509    |000009;
                       SBC.B r_sceneScrollOffsetHi          ;0A82EB|E557    |000057;
                       STA.B $03                            ;0A82ED|8503    |000003;
                       BPL CODE_0A82F3                      ;0A82EF|1002    |0A82F3;
 
          CODE_0A82F1: CLC                                  ;0A82F1|18      |      ;
                       RTS                                  ;0A82F2|60      |      ;
 
 
          CODE_0A82F3: SEC                                  ;0A82F3|38      |      ;
                       LDA.B $09                            ;0A82F4|A509    |000009;
                       SBC.B r_sceneScrollOffsetHi          ;0A82F6|E557    |000057;
                       BEQ CODE_0A830A                      ;0A82F8|F010    |0A830A;
                       SEC                                  ;0A82FA|38      |      ;
                       SBC.B #$01                           ;0A82FB|E901    |      ;
                       BNE CODE_0A82F1                      ;0A82FD|D0F2    |0A82F1;
                       SEC                                  ;0A82FF|38      |      ;
                       LDA.B $02                            ;0A8300|A502    |000002;
                       SBC.B #$10                           ;0A8302|E910    |      ;
                       STA.B $02                            ;0A8304|8502    |000002;
                       BCS CODE_0A830A                      ;0A8306|B002    |0A830A;
                       DEC.B $03                            ;0A8308|C603    |000003;
 
          CODE_0A830A: LDA.B $03                            ;0A830A|A503    |000003;
                       BNE CODE_0A82F1                      ;0A830C|D0E3    |0A82F1;
                       LDA.B $02                            ;0A830E|A502    |000002;
                       CMP.B #$B8                           ;0A8310|C9B8    |      ;
                       BCS CODE_0A82F1                      ;0A8312|B0DD    |0A82F1;
                       LDA.B $02                            ;0A8314|A502    |000002;
                       CLC                                  ;0A8316|18      |      ;
                       ADC.B #$37                           ;0A8317|6937    |      ;
                       STA.B r_temp_Xpos                    ;0A8319|850A    |00000A;
                       SEC                                  ;0A831B|38      |      ;
                       RTS                                  ;0A831C|60      |      ;
 
 
          CODE_0A831D: STA.B $09                            ;0A831D|8509    |000009;
                       INY                                  ;0A831F|C8      |      ;
                       LDA.B (r_roomEntityDataAddrSpawner),Y;0A8320|B198    |000098;
                       STA.B r_temp_Xpos                    ;0A8322|850A    |00000A;
                       RTS                                  ;0A8324|60      |      ;
 
 
         DATA8_0A8325: db $30,$31,$32,$00,$00               ;0A8325|        |      ;
                       db $00,$00,$00,$00,$00               ;0A832A|        |      ;
                       db $51,$00,$00,$00,$00               ;0A832F|        |      ;
                       db $00,$00,$00,$00,$00               ;0A8334|        |      ;
                       db $00,$00,$00,$00,$00               ;0A8339|        |      ;
                       db $00,$00,$00,$00,$00               ;0A833E|        |      ;
                       db $00,$00,$00,$52,$00               ;0A8343|        |      ;
                       db $00,$00,$00,$00,$00               ;0A8348|        |      ;
 
          CODE_0A834D: LDX.B #$0D                           ;0A834D|A20D    |      ;
 
          CODE_0A834F: LDA.W $054E,X                        ;0A834F|BD4E05  |0A054E;
                       BEQ CODE_0A8391                      ;0A8352|F03D    |0A8391;
                       INX                                  ;0A8354|E8      |      ;
                       CPX.B #$13                           ;0A8355|E013    |      ;
                       BCC CODE_0A834F                      ;0A8357|90F6    |0A834F;
                       BCS CODE_0A838F                      ;0A8359|B034    |0A838F;
 
          CODE_0A835B: LDX.B #$00                           ;0A835B|A200    |      ;
 
          CODE_0A835D: LDA.W $07C2,X                        ;0A835D|BDC207  |0A07C2;
                       BEQ CODE_0A8391                      ;0A8360|F02F    |0A8391;
                       INX                                  ;0A8362|E8      |      ;
                       CPX.B #$06                           ;0A8363|E006    |      ;
                       BCC CODE_0A835D                      ;0A8365|90F6    |0A835D;
                       BCS CODE_0A838F                      ;0A8367|B026    |0A838F;
 
          CODE_0A8369: LDX.B #$00                           ;0A8369|A200    |      ;
                       TXA                                  ;0A836B|8A      |      ;
 
          CODE_0A836C: STA.W $07C2,X                        ;0A836C|9DC207  |0A07C2;
                       INX                                  ;0A836F|E8      |      ;
                       CPX.B #$06                           ;0A8370|E006    |      ;
                       BCC CODE_0A836C                      ;0A8372|90F8    |0A836C;
                       RTS                                  ;0A8374|60      |      ;
 
                       LDX.B #$01                           ;0A8375|A201    |      ;
 
          CODE_0A8377: LDA.W $054E,X                        ;0A8377|BD4E05  |0A054E;
                       BEQ CODE_0A8391                      ;0A837A|F015    |0A8391;
                       INX                                  ;0A837C|E8      |      ;
                       CPX.B #$03                           ;0A837D|E003    |      ;
                       BCC CODE_0A8377                      ;0A837F|90F6    |0A8377;
                       BCS CODE_0A838F                      ;0A8381|B00C    |0A838F;
 
          CODE_0A8383: LDX.B #$01                           ;0A8383|A201    |      ;
 
          CODE_0A8385: LDA.W $054E,X                        ;0A8385|BD4E05  |0A054E;
                       BEQ CODE_0A8391                      ;0A8388|F007    |0A8391;
                       INX                                  ;0A838A|E8      |      ;
                       CPX.B #$04                           ;0A838B|E004    |      ;
                       BCC CODE_0A8385                      ;0A838D|90F6    |0A8385;
 
          CODE_0A838F: LDA.B #$01                           ;0A838F|A901    |      ;
 
          CODE_0A8391: RTS                                  ;0A8391|60      |      ;
 
 
          CODE_0A8392: LDX.B #$07                           ;0A8392|A207    |      ;
 
          CODE_0A8394: LDA.W $054E,X                        ;0A8394|BD4E05  |0A054E;
                       BEQ CODE_0A8391                      ;0A8397|F0F8    |0A8391;
                       INX                                  ;0A8399|E8      |      ;
                       CPX.B #$09                           ;0A839A|E009    |      ;
                       BCC CODE_0A8394                      ;0A839C|90F6    |0A8394;
                       BCS CODE_0A838F                      ;0A839E|B0EF    |0A838F;
 
          CODE_0A83A0: LDX.B #$04                           ;0A83A0|A204    |      ;
 
          CODE_0A83A2: LDA.W $054E,X                        ;0A83A2|BD4E05  |0A054E;
                       BEQ CODE_0A8391                      ;0A83A5|F0EA    |0A8391;
                       INX                                  ;0A83A7|E8      |      ;
                       CPX.B #$07                           ;0A83A8|E007    |      ;
                       BCC CODE_0A83A2                      ;0A83AA|90F6    |0A83A2;
                       BCS CODE_0A838F                      ;0A83AC|B0E1    |0A838F;
 
          CODE_0A83AE: LDX.B #$0A                           ;0A83AE|A20A    |      ;
 
          CODE_0A83B0: LDA.W $054E,X                        ;0A83B0|BD4E05  |0A054E;
                       BEQ CODE_0A8391                      ;0A83B3|F0DC    |0A8391;
                       INX                                  ;0A83B5|E8      |      ;
                       CPX.B #$0D                           ;0A83B6|E00D    |      ;
                       BCC CODE_0A83B0                      ;0A83B8|90F6    |0A83B0;
                       BCS CODE_0A838F                      ;0A83BA|B0D3    |0A838F;
 
          CODE_0A83BC: LDX.B #$01                           ;0A83BC|A201    |      ;
 
          CODE_0A83BE: JSR.W CODE_0A81E9                    ;0A83BE|20E981  |0A81E9;
                       STA.W $0657,X                        ;0A83C1|9D5706  |0A0657;
                       STA.W $0669,X                        ;0A83C4|9D6906  |0A0669;
                       INX                                  ;0A83C7|E8      |      ;
                       CPX.B #$0D                           ;0A83C8|E00D    |      ;
                       BCC CODE_0A83BE                      ;0A83CA|90F2    |0A83BE;
                       RTS                                  ;0A83CC|60      |      ;
 
 
          CODE_0A83CD: LDY.B #$00                           ;0A83CD|A000    |      ;
                       LDA.B r_scrollSpd                    ;0A83CF|A56E    |00006E;
                       BPL CODE_0A83D4                      ;0A83D1|1001    |0A83D4;
                       DEY                                  ;0A83D3|88      |      ;
 
          CODE_0A83D4: STY.B $00                            ;0A83D4|8400    |000000;
                       LDA.B r_roomOrientation              ;0A83D6|A568    |000068;
                       BMI CODE_0A83EE                      ;0A83D8|3014    |0A83EE;
                       SEC                                  ;0A83DA|38      |      ;
                       LDA.W $07DA,X                        ;0A83DB|BDDA07  |0A07DA;
                       SBC.B r_scrollSpd                    ;0A83DE|E56E    |00006E;
                       STA.W $07DA,X                        ;0A83E0|9DDA07  |0A07DA;
                       LDA.W $07E0,X                        ;0A83E3|BDE007  |0A07E0;
                       SBC.B $00                            ;0A83E6|E500    |000000;
                       AND.B #$01                           ;0A83E8|2901    |      ;
                       STA.W $07E0,X                        ;0A83EA|9DE007  |0A07E0;
                       RTS                                  ;0A83ED|60      |      ;
 
 
          CODE_0A83EE: CLC                                  ;0A83EE|18      |      ;
                       LDA.W $07D4,X                        ;0A83EF|BDD407  |0A07D4;
                       ADC.B r_scrollSpd                    ;0A83F2|656E    |00006E;
                       STA.W $07D4,X                        ;0A83F4|9DD407  |0A07D4;
                       LDA.W $07E0,X                        ;0A83F7|BDE007  |0A07E0;
                       ADC.B $00                            ;0A83FA|6500    |000000;
                       AND.B #$01                           ;0A83FC|2901    |      ;
                       STA.W $07E0,X                        ;0A83FE|9DE007  |0A07E0;
                       LDA.W $07E0,X                        ;0A8401|BDE007  |0A07E0;
                       BEQ CODE_0A840B                      ;0A8404|F005    |0A840B;
                       LDA.B #$00                           ;0A8406|A900    |      ;
                       STA.W $07C2,X                        ;0A8408|9DC207  |0A07C2;
 
          CODE_0A840B: RTS                                  ;0A840B|60      |      ;
 
 
         DATA8_0A840C: db $00,$01,$02,$03,$04               ;0A840C|        |      ;
                       db $05,$00,$01,$02,$03               ;0A8411|        |      ;
                       db $04,$05,$00,$01,$02               ;0A8416|        |      ;
                       db $03,$04,$05,$00,$01               ;0A841B|        |      ;
                       db $02,$03,$04,$05,$00               ;0A8420|        |      ;
                       db $01,$02,$03,$04,$05               ;0A8425|        |      ;
                       db $00,$01,$02,$03,$04               ;0A842A|        |      ;
                       db $05,$00,$01,$02,$03               ;0A842F|        |      ;
                       db $04,$05,$00,$01,$02               ;0A8434|        |      ;
                       db $03,$04,$05                       ;0A8439|        |      ;
 
          CODE_0A843C: LDY.B r_quarterSpawner_Xpos          ;0A843C|A476    |000076;
                       LDA.W DATA8_0A844D,Y                 ;0A843E|B94D84  |0A844D;
                       STA.B r_roomSectionChrBanksDataOffset;0A8441|850F    |00000F;
                       LDA.W DATA8_0A846D,Y                 ;0A8443|B96D84  |0A846D;
                       TAY                                  ;0A8446|A8      |      ;
                       LDA.W $00F0,Y                        ;0A8447|B9F000  |0A00F0;
                       AND.B r_roomSectionChrBanksDataOffset;0A844A|250F    |00000F;
                       RTS                                  ;0A844C|60      |      ;
 
 
         DATA8_0A844D: db $01,$02,$04,$08,$10               ;0A844D|        |      ;
                       db $20,$40,$80,$01,$02               ;0A8452|        |      ;
                       db $04,$08,$10,$20,$40               ;0A8457|        |      ;
                       db $80,$01,$02,$04,$08               ;0A845C|        |      ;
 
                       db $10,$20,$40,$80,$01               ;0A8461|        |      ;
                       db $02,$04,$08,$10,$20               ;0A8466|        |      ;
                       db $40,$80                           ;0A846B|        |      ;
 
 
         DATA8_0A846D: db $00,$00,$00,$00,$00               ;0A846D|        |      ;
                       db $00,$00,$00,$01,$01               ;0A8472|        |      ;
                       db $01,$01,$01,$01,$01               ;0A8477|        |      ;
                       db $01,$02,$02,$02,$02               ;0A847C|        |      ;
                       db $02,$02,$02,$02,$03               ;0A8481|        |      ;
                       db $03,$03,$03,$03,$03               ;0A8486|        |      ;
                       db $03,$03                           ;0A848B|        |      ;
 
          CODE_0A848D: LDA.B r_stage                        ;0A848D|A532    |000032;
                       CMP.B #$0E                           ;0A848F|C90E    |      ;
                       BNE CODE_0A849D                      ;0A8491|D00A    |0A849D;
                       LDA.B r_blockLevel                   ;0A8493|A533    |000033;
                       CMP.B #$01                           ;0A8495|C901    |      ;
                       BNE CODE_0A849D                      ;0A8497|D004    |0A849D;
                       LDA.B r_roomIdx                      ;0A8499|A534    |000034;
                       CMP.B #$01                           ;0A849B|C901    |      ;
 
          CODE_0A849D: RTS                                  ;0A849D|60      |      ;
 
 
          CODE_0A849E: LDX.B #$01                           ;0A849E|A201    |      ;
 
          CODE_0A84A0: LDA.W $054E,X                        ;0A84A0|BD4E05  |0A054E;
                       CMP.B #$93                           ;0A84A3|C993    |      ;
                       BCC CODE_0A84C0                      ;0A84A5|9019    |0A84C0;
                       BEQ CODE_0A84D0                      ;0A84A7|F027    |0A84D0;
                       CMP.B #$95                           ;0A84A9|C995    |      ;
                       BEQ CODE_0A84D0                      ;0A84AB|F023    |0A84D0;
                       CMP.B #$97                           ;0A84AD|C997    |      ;
                       BEQ CODE_0A84C0                      ;0A84AF|F00F    |0A84C0;
                       CMP.B #$AF                           ;0A84B1|C9AF    |      ;
                       BEQ CODE_0A84BD                      ;0A84B3|F008    |0A84BD;
                       CMP.B #$B0                           ;0A84B5|C9B0    |      ;
                       BEQ CODE_0A84BD                      ;0A84B7|F004    |0A84BD;
                       CMP.B #$9F                           ;0A84B9|C99F    |      ;
                       BCS CODE_0A84C0                      ;0A84BB|B003    |0A84C0;
 
          CODE_0A84BD: JSR.W CODE_0A84D8                    ;0A84BD|20D884  |0A84D8;
 
          CODE_0A84C0: INX                                  ;0A84C0|E8      |      ;
                       CPX.B #$13                           ;0A84C1|E013    |      ;
                       BCC CODE_0A84A0                      ;0A84C3|90DB    |0A84A0;
                       LDX.B #$14                           ;0A84C5|A214    |      ;
 
          CODE_0A84C7: JSR.W CODE_0A84D8                    ;0A84C7|20D884  |0A84D8;
                       INX                                  ;0A84CA|E8      |      ;
                       CPX.B #$17                           ;0A84CB|E017    |      ;
                       BCC CODE_0A84C7                      ;0A84CD|90F8    |0A84C7;
                       RTS                                  ;0A84CF|60      |      ;
 
 
          CODE_0A84D0: LDA.B r_partner                      ;0A84D0|A53A    |00003A;
                       CMP.B #$02                           ;0A84D2|C902    |      ;
                       BNE CODE_0A84BD                      ;0A84D4|D0E7    |0A84BD;
                       BEQ CODE_0A84C0                      ;0A84D6|F0E8    |0A84C0;
 
          CODE_0A84D8: LDA.B #$00                           ;0A84D8|A900    |      ;
                       STA.W $054E,X                        ;0A84DA|9D4E05  |0A054E;
                       STA.W $0400,X                        ;0A84DD|9D0004  |0A0400;
                       STA.W $0470,X                        ;0A84E0|9D7004  |0A0470;
                       STA.W $0438,X                        ;0A84E3|9D3804  |0A0438;
                       STA.W $041C,X                        ;0A84E6|9D1C04  |0A041C;
                       RTS                                  ;0A84E9|60      |      ;
 
 
          CODE_0A84EA: LDX.B #$00                           ;0A84EA|A200    |      ;
 
          CODE_0A84EC: LDA.W $07C2,X                        ;0A84EC|BDC207  |0A07C2;
                       BEQ CODE_0A84FF                      ;0A84EF|F00E    |0A84FF;
                       STX.B r_entityID_processed           ;0A84F1|866C    |00006C;
                       LDA.B r_rosseryFlashTimer            ;0A84F3|A5B2    |0000B2;
                       BNE CODE_0A84FC                      ;0A84F5|D005    |0A84FC;
                       JSR.W CODE_0A8505                    ;0A84F7|200585  |0A8505;
                       LDX.B r_entityID_processed           ;0A84FA|A66C    |00006C;
 
          CODE_0A84FC: JSR.W CODE_0A83CD                    ;0A84FC|20CD83  |0A83CD;
 
          CODE_0A84FF: INX                                  ;0A84FF|E8      |      ;
                       CPX.B #$06                           ;0A8500|E006    |      ;
                       BCC CODE_0A84EC                      ;0A8502|90E8    |0A84EC;
                       RTS                                  ;0A8504|60      |      ;
 
 
          CODE_0A8505: LDA.W $07C2,X                        ;0A8505|BDC207  |0A07C2;
                       ASL A                                ;0A8508|0A      |      ;
                       TAY                                  ;0A8509|A8      |      ;
                       LDA.W enemySpawnerIDPointerTableLo,Y ;0A850A|B92785  |0A8527;
                       STA.B $00                            ;0A850D|8500    |000000;
                       LDA.W enemySpawnerIDPointerTableHi,Y ;0A850F|B92885  |0A8528;
                       STA.B $01                            ;0A8512|8501    |000001;
                       LDA.W $07C8,X                        ;0A8514|BDC807  |0A07C8;
                       AND.B #$0F                           ;0A8517|290F    |      ;
                       ASL A                                ;0A8519|0A      |      ;
                       TAY                                  ;0A851A|A8      |      ;
                       LDA.B ($00),Y                        ;0A851B|B100    |000000;
                       STA.B $02                            ;0A851D|8502    |000002;
                       INY                                  ;0A851F|C8      |      ;
                       LDA.B ($00),Y                        ;0A8520|B100    |000000;
                       STA.B $03                            ;0A8522|8503    |000003;
                       JMP.W ($0002)                        ;0A8524|6C0200  |000002;
 
 
enemySpawnerIDPointerTableLo: dw emptySpawner                      ;0A8527|        |0A85D3; #00  Unused address used by diverted spawners
                       dw zombieSlowRateSpawnerPointer      ;0A8529|        |0A85D7; #01  Zombie (slow rate) normal zombie
                       dw zombieSpawnFromGroundSpawnPointer ;0A852B|        |0A8629; #02  Zombie (from ground)
                       dw medusaHeadSpawnPointer            ;0A852D|        |0A8878; #03  Medusa Head (one)
                       dw wingedDeamonSpawnPointer          ;0A852F|        |0A8A13; #04  Winged Demon (one)
                       dw bossSpawnPointer                  ;0A8531|        |0A8ED1;  #05  Skull Knight (Boss)
                       dw bossSpawnPointer                  ;0A8533|        |0A8ED1; #06  Cyclops (Boss)
                       dw bossSpawnPointer                  ;0A8535|        |0A8ED1; #07  Grant (Boss)
                       dw lightningSpawnPointer08           ;0A8537|        |0A91AF; #08  Lightning (bolts) first visual effect
                       dw lightningSpawnPointer09           ;0A8539|        |0A91AB; #09  Lightning (Sypha) cinematic visual effect
                       dw lightningSpawnPointer0a           ;0A853B|        |0A921D; #0A  Lightning (clouds) boss fight visual effect
                       dw hunchbackSpawnPointer_0a          ;0A853D|        |0A8B61;  #0B  Hunchback
                       dw batFlyingSpawnPointer_0c          ;0A853F|        |0A8970; #0C  Bats (flying)[1]
                       dw batSleepSpawnPointer_0d           ;0A8541|        |0A8CB2; #0D  Bats (asleep)
                       dw bonePillarSpawnPointer            ;0A8543|        |0A8C76; #0E  Bone Pillar (3-shot)[1]
                       dw axeKnightSpawnerPointer           ;0A8545|        |0A8B2C; #0F  Axe Knight
                       dw CrowAndEyeSpawnPointer_10         ;0A8547|        |0A8BF9; #10  Crow (flying low)
                       dw swordSkelletonSpawnPointer_11     ;0A8549|        |0A8B16; #11  Skeleton (sword)[1]
                       dw fishManSpawnPointer_12            ;0A854B|        |0A86BF; #12  Fishmen (jumping) bridge variety
                       dw redSkelletonSpawnPointer_13       ;0A854D|        |0A8BAB; #13  Skeleton (whip,red)
                       dw CrowAndEyeSpawnPointer_10         ;0A854F|        |0A8BF9; #14  Floating Eye
                       dw redSkelletonSpawnPointer_13       ;0A8551|        |0A8BAB; #15  Slime Ball
                       dw redSkelletonSpawnPointer_13       ;0A8553|        |0A8BAB; #16  Skeleton (bones)
                       dw redSkelletonSpawnPointer_13       ;0A8555|        |0A8BAB; #17  Skeleton (whip,blue)
                       dw ghostSpawnerPointer_18            ;0A8557|        |0A8AAD; #18  Ghost (no flicker)
                       dw redSkelletonSpawnPointer_13       ;0A8559|        |0A8BAB; #19  Skeleton (red)
                       dw mummySpwanPointer_1a              ;0A855B|        |0A8A5F; #1A  Mummies[1]
                       dw bossSpawnPointer                  ;0A855D|        |0A8ED1; #1B  Giant Bat (Boss)
                       dw bossAlucardSpawnerPointer         ;0A855F|        |0A914A; #1C  Alucard (Boss)
                       dw bossBoneDragonKingSpawnPointer    ;0A8561|        |0A8FFC; #1D  Bone Dragon King (Boss)
                       dw bossMedusaSpawnPointer            ;0A8563|        |0A90DD; #1E  Medusa (Boss)
                       dw bossWaterDragonSpawnPointer       ;0A8565|        |0A90A0; #1F  Water Dragons (Boss)
                       dw bossSpawnPointer                  ;0A8567|        |0A8ED1; #20  Mummies + Cyclops (Boss)
                       dw bossSpawnPointer                  ;0A8569|        |0A8ED1; #21  Frankenstein's Monster (Boss)
                       dw bossSpawnPointer                  ;0A856B|        |0A8ED1; #22  UNUSED BOSS (no object, spawner position #2A)
                       dw bossSpawnPointer                  ;0A856D|        |0A8ED1; #23  Grim Reaper (Boss)
                       dw bossSpawnPointer                  ;0A856F|        |0A8ED1; #24  Doppelganger (Boss)
                       dw bossSpawnPointer                  ;0A8571|        |0A8ED1; #25  Mummy + Cyclops + Leviathan (Boss)
                       dw bossSpawnPointer                  ;0A8573|        |0A8ED1; #26  Dracula (Boss)
                       dw CrowAndEyeSpawnPointer_10         ;0A8575|        |0A8BF9; #27  Crow (flying high)
                       dw redSkelletonSpawnPointer_13       ;0A8577|        |0A8BAB; #28  Headless Pirate a.k.a. Dhuron
                       dw spiderSpawnPointer                ;0A8579|        |0A8C0F; #29  Spider
                       dw bonePiller2ShotSpawnerPointer     ;0A857B|        |0A8C9C; #2A  Bone Pillar (2-shot)
                       dw batFlyingSpawnPointer_0c          ;0A857D|        |0A8970; #2B  Bats (flying)[2] *unused in CV3j*
                       dw fuzzySpawnPointer                 ;0A857F|        |0A8AEF; #2C  Fuzz Buster[1] *unused in CV3j*
                       dw sporeSpawnerPointer               ;0A8581|        |0A8948;  #2D  Spore (floating)
                       dw sporeGroundSpawnPointer           ;0A8583|        |0A8C65;  #2E  Spore
                       dw emptySpawner                      ;0A8585|        |0A85D3;  #2F  Trap Door *unused*
                       dw emptySpawner                      ;0A8587|        |0A85D3; #30  Trap Door (spikes) *unused*
                       dw emptySpawner                      ;0A8589|        |0A85D3; #31  Gear Tooth *unused*
                       dw redSkelletonSpawnPointer_13       ;0A858B|        |0A8BAB; #32  Skeleton (blue)
                       dw emptySpawner                      ;0A858D|        |0A85D3; #33  Pendulum *unused*
                       dw emptySpawner                      ;0A858F|        |0A85D3; #34  Falling Spikes[1] *unused*
                       dw emptySpawner                      ;0A8591|        |0A85D3; #35  Falling Spikes[2] *unused*
                       dw CODE_0A8D93                       ;0A8593|        |0A8D93; #36  Water Current (4 blocks)
                       dw emptySpawner                      ;0A8595|        |0A85D3; #37  Falling Blocks *unused*
                       dw emptySpawner                      ;0A8597|        |0A85D3;  #38  Acid Drops *unused*
                       dw CODE_0A8D93                       ;0A8599|        |0A8D93; #39  Water Current (2 blocks)[1]
                       dw CODE_0A8652                       ;0A859B|        |0A8652; #3A  Zombie (fast rate)[1]
                       dw DATA8_0A87BC                      ;0A859D|        |0A87BC; #3B  Mudmen
                       dw PTR16_0A8769                      ;0A859F|        |0A8769; #3C  Frog
                       dw DATA8_0A86B3                      ;0A85A1|        |0A86B3; #3D  Fishmen (swimming) aqueduct variety
                       dw DATA8_0A86B9                      ;0A85A3|        |0A86B9;  #3E  Fishmen (swim+jump) deep water variety
                       dw redSkelletonSpawnPointer_13       ;0A85A5|        |0A8BAB;  #3F  Fire Man
                       dw hunchbackSpawnPointer_0a          ;0A85A7|        |0A8B61; #40  Knight
                       dw bonePillarSpawnPointer            ;0A85A9|        |0A8C76; #41  Bone Pillar (3-shot)[2]
                       dw PTR16_0A8DC5                      ;0A85AB|        |0A8DC5; #42  Auto-Walk (forest)
                       dw CODE_0A8CD3                       ;0A85AD|        |0A8CD3; #43  Bone Dragon
                       dw DATA8_0A8AD8                      ;0A85AF|        |0A8AD8; #44  Owl
                       dw fuzzySpawnPointer                 ;0A85B1|        |0A8AEF; #45  Fuzz Buster[2]
                       dw PTR16_0A88D0                      ;0A85B3|        |0A88D0; #46  Harpy
                       dw batFlyingSpawnPointer_0c          ;0A85B5|        |0A8970; #47  Bats Flying[3]
                       dw PTR16_0A882A                      ;0A85B7|        |0A882A;  #48  Medusa Heads (two)[1]
                       dw CODE_0A8B4D                       ;0A85B9|        |0A8B4D; #49  Skeleton (sword)[2]
                       dw DATA8_0A880F                      ;0A85BB|        |0A880F;  #4A  Medusa Heads (two)[2]
                       dw DATA8_0A8AA5                      ;0A85BD|        |0A8AA5; #4B  Ghost (w/flicker)
                       dw PTR16_0A8DC5                      ;0A85BF|        |0A8DC5; #4C  Auto-Walk (caves)
                       dw CODE_0A8D93                       ;0A85C1|        |0A8D93; #4D  Water Current (6 blocks)
                       dw CODE_0A8D93                       ;0A85C3|        |0A8D93;  #4E  Water Current (2 blocks)[2]
                       dw PTR16_0A867C                      ;0A85C5|        |0A867C;  #4F  Zombie (fast rate)[2]
 
                       dw mummySpwanPointer_1a              ;0A85C7|        |0A8A5F; #50  Mummies[2]
                       dw CODE_0A8719                       ;0A85C9|        |0A8719; #51  Flood Controller
                       dw DATA8_0A8A09                      ;0A85CB|        |0A8A09; #52  Winged Demon (two) *CV3u only*
                       dw $1960                             ;0A85CD|        |      ; ??
 
                       db $00,$00,$00                       ;0A85CF|        |      ;
 
         DATA8_0A85D2: db $60                               ;0A85D2|        |      ;
 
 
         emptySpawner: dw DATA8_0A85D2                      ;0A85D3|        |0A85D2;
                       dw DATA8_0A85D2                      ;0A85D5|        |0A85D2;
 
zombieSlowRateSpawnerPointer: dw CODE_0A85DB                       ;0A85D7|        |0A85DB;
 
                       dw CODE_0A85E6                       ;0A85D9|        |0A85E6;
 
          CODE_0A85DB: JSR.W CODE_0A85EB                    ;0A85DB|20EB85  |0A85EB;
 
          CODE_0A85DE: LDX.B r_entityID_processed           ;0A85DE|A66C    |00006C;
                       INC.W $07C8,X                        ;0A85E0|FEC807  |0A07C8;
 
          CODE_0A85E3: RTS                                  ;0A85E3|60      |      ;
 
 
          CODE_0A85E4: PHP                                  ;0A85E4|08      |      ;
                       SED                                  ;0A85E5|F8      |      ;
 
          CODE_0A85E6: DEC.W $07CE,X                        ;0A85E6|DECE07  |0A07CE;
                       BNE CODE_0A85E3                      ;0A85E9|D0F8    |0A85E3;
 
          CODE_0A85EB: JSR.W CODE_0A8DE7                    ;0A85EB|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A85EE|20738D  |0A8D73;
                       BNE CODE_0A8621                      ;0A85F1|D02E    |0A8621;
                       JSR.W CODE_0A89B3                    ;0A85F3|20B389  |0A89B3;
                       LDA.W CODE_0A85E4,Y                  ;0A85F6|B9E485  |0A85E4;
                       STA.B $00                            ;0A85F9|8500    |000000;
                       LDA.B #$B0                           ;0A85FB|A9B0    |      ;
                       STA.B $01                            ;0A85FD|8501    |000001;
                       JSR.W CODE_0A8DDE                    ;0A85FF|20DE8D  |0A8DDE;
                       LDA.W $0438,X                        ;0A8602|BD3804  |0A0438;
                       STA.B r_pointerQueue_VRAM            ;0A8605|8508    |000008;
                       TXA                                  ;0A8607|8A      |      ;
                       LDX.B r_entityID_processed           ;0A8608|A66C    |00006C;
                       STA.W $07E6,X                        ;0A860A|9DE607  |0A07E6;
                       LDY.B #$A4                           ;0A860D|A0A4    |      ;
                       LDA.B r_pointerQueue_VRAM            ;0A860F|A508    |000008;
                       db $20                               ;0A8611|        |      ;
                       dw UNREACH_0FFC16                    ;0A8612|        |0FFC16;
                       BEQ CODE_0A8621                      ;0A8614|F00B    |0A8621;
                       LDX.B r_entityID_processed           ;0A8616|A66C    |00006C;
                       LDA.W $07E6,X                        ;0A8618|BDE607  |0A07E6;
                       TAX                                  ;0A861B|AA      |      ;
                       LDA.B #$90                           ;0A861C|A990    |      ;
                       STA.W $041C,X                        ;0A861E|9D1C04  |0A041C;
 
          CODE_0A8621: LDA.B #$81                           ;0A8621|A981    |      ;
 
          CODE_0A8623: LDX.B r_entityID_processed           ;0A8623|A66C    |00006C;
                       STA.W $07CE,X                        ;0A8625|9DCE07  |0A07CE;
 
          CODE_0A8628: RTS                                  ;0A8628|60      |      ;
 
 
zombieSpawnFromGroundSpawnPointer: dw zombieGroundSpawn00               ;0A8629|        |0A862D;
                       dw zombieGroundSpawn01               ;0A862B|        |0A864B;
 
  zombieGroundSpawn00: INC.W $07C8,X                        ;0A862D|FEC807  |0A07C8;
 
          CODE_0A8630: JSR.W CODE_0A8DE7                    ;0A8630|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A8633|20738D  |0A8D73;
                       BNE CODE_0A8643                      ;0A8636|D00B    |0A8643;
                       JSR.W CODE_0A8DDE                    ;0A8638|20DE8D  |0A8DDE;
                       LDA.W $0470,X                        ;0A863B|BD7004  |0A0470;
                       ORA.B #$20                           ;0A863E|0920    |      ;
                       STA.W $0470,X                        ;0A8640|9D7004  |0A0470;
 
          CODE_0A8643: LDX.B r_entityID_processed           ;0A8643|A66C    |00006C;
                       LDA.B #$81                           ;0A8645|A981    |      ;
                       STA.W $07CE,X                        ;0A8647|9DCE07  |0A07CE;
 
          CODE_0A864A: RTS                                  ;0A864A|60      |      ;
 
 
  zombieGroundSpawn01: DEC.W $07CE,X                        ;0A864B|DECE07  |0A07CE;
                       BNE CODE_0A8628                      ;0A864E|D0D8    |0A8628;
                       BEQ CODE_0A8630                      ;0A8650|F0DE    |0A8630;
 
          CODE_0A8652: LSR.B r_subweapPartner,X             ;0A8652|5686    |000086;
                       JML.L UNREACH_612086                 ;0A8654|5C862061|612086;
 
                       db $86                               ;0A8658|        |      ;
                       JMP.W CODE_0A85DE                    ;0A8659|4CDE85  |0A85DE;
 
                       DEC.W $07CE,X                        ;0A865C|DECE07  |0A07CE;
                       BNE CODE_0A864A                      ;0A865F|D0E9    |0A864A;
                       JSR.W CODE_0A8DE7                    ;0A8661|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A8664|20738D  |0A8D73;
                       BNE CODE_0A8674                      ;0A8667|D00B    |0A8674;
                       JSR.W CODE_0A89B7                    ;0A8669|20B789  |0A89B7;
                       LDA.W CODE_0A85E4,Y                  ;0A866C|B9E485  |0A85E4;
                       STA.B $00                            ;0A866F|8500    |000000;
                       JSR.W CODE_0A8DDE                    ;0A8671|20DE8D  |0A8DDE;
 
          CODE_0A8674: LDX.B r_entityID_processed           ;0A8674|A66C    |00006C;
                       LDA.B #$47                           ;0A8676|A947    |      ;
                       STA.W $07CE,X                        ;0A8678|9DCE07  |0A07CE;
                       RTS                                  ;0A867B|60      |      ;
 
 
         PTR16_0A867C: dw CODE_0A8680                       ;0A867C|        |0A8680;
 
                       dw CODE_0A8686                       ;0A867E|        |0A8686;
 
          CODE_0A8680: JSR.W CODE_0A868B                    ;0A8680|208B86  |0A868B;
                       JMP.W CODE_0A85DE                    ;0A8683|4CDE85  |0A85DE;
 
 
          CODE_0A8686: DEC.W $07CE,X                        ;0A8686|DECE07  |0A07CE;
                       BNE CODE_0A86B2                      ;0A8689|D027    |0A86B2;
 
          CODE_0A868B: JSR.W CODE_0A8DE7                    ;0A868B|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A868E|20738D  |0A8D73;
                       BNE CODE_0A86AB                      ;0A8691|D018    |0A86AB;
                       JSR.W CODE_0A89B3                    ;0A8693|20B389  |0A89B3;
                       LDA.W CODE_0A85E4,Y                  ;0A8696|B9E485  |0A85E4;
                       STA.B $00                            ;0A8699|8500    |000000;
                       LDA.W $07F6                          ;0A869B|ADF607  |0A07F6;
                       BEQ CODE_0A86A8                      ;0A869E|F008    |0A86A8;
                       LDA.B #$70                           ;0A86A0|A970    |      ;
                       STA.B $02                            ;0A86A2|8502    |000002;
                       LDA.B #$66                           ;0A86A4|A966    |      ;
                       STA.B $03                            ;0A86A6|8503    |000003;
 
          CODE_0A86A8: JSR.W CODE_0A8DDE                    ;0A86A8|20DE8D  |0A8DDE;
 
          CODE_0A86AB: LDX.B r_entityID_processed           ;0A86AB|A66C    |00006C;
                       LDA.B #$41                           ;0A86AD|A941    |      ;
                       STA.W $07CE,X                        ;0A86AF|9DCE07  |0A07CE;
 
          CODE_0A86B2: RTS                                  ;0A86B2|60      |      ;
 
 
         DATA8_0A86B3: db $C3,$86,$FD,$86,$0E               ;0A86B3|        |      ;
                       db $87                               ;0A86B8|        |      ;
 
         DATA8_0A86B9: db $C9,$86,$FD,$86,$0E               ;0A86B9|        |      ;
                       db $87                               ;0A86BE|        |      ;
 
fishManSpawnPointer_12: dw fishManSpawn00                    ;0A86BF|        |0A86C9;
                       dw fishManSpawn01                    ;0A86C1|        |0A86EF;
                       LDA.B r_gameLoadState                ;0A86C3|A52A    |00002A;
                       CMP.B #$1B                           ;0A86C5|C91B    |      ;
                       BEQ CODE_0A86EE                      ;0A86C7|F025    |0A86EE;
 
       fishManSpawn00: LDA.W $07E0,X                        ;0A86C9|BDE007  |0A07E0;
                       BNE CODE_0A86EE                      ;0A86CC|D020    |0A86EE;
                       JSR.W CODE_0A8DE7                    ;0A86CE|20E78D  |0A8DE7;
                       JSR.W CODE_0A8E54                    ;0A86D1|20548E  |0A8E54;
                       BNE CODE_0A86EE                      ;0A86D4|D018    |0A86EE;
                       TXA                                  ;0A86D6|8A      |      ;
                       ADC.B r_gameStateLoopCounter         ;0A86D7|651A    |00001A;
                       ADC.W $0438                          ;0A86D9|6D3804  |0A0438;
                       AND.B #$01                           ;0A86DC|2901    |      ;
                       TAY                                  ;0A86DE|A8      |      ;
                       LDA.W CODE_0A85E4,Y                  ;0A86DF|B9E485  |0A85E4;
                       STA.B $00                            ;0A86E2|8500    |000000;
 
          CODE_0A86E4: JSR.W CODE_0A8DDE                    ;0A86E4|20DE8D  |0A8DDE;
 
          CODE_0A86E7: TXA                                  ;0A86E7|8A      |      ;
                       JSR.W CODE_0A85DE                    ;0A86E8|20DE85  |0A85DE;
                       STA.W $07E6,X                        ;0A86EB|9DE607  |0A07E6;
 
          CODE_0A86EE: RTS                                  ;0A86EE|60      |      ;
 
 
       fishManSpawn01: LDY.W $07E6,X                        ;0A86EF|BCE607  |0A07E6;
                       LDA.W $054E,Y                        ;0A86F2|B94E05  |0A054E;
                       BNE CODE_0A86EE                      ;0A86F5|D0F7    |0A86EE;
                       LDA.B #$00                           ;0A86F7|A900    |      ;
                       STA.W $07C8,X                        ;0A86F9|9DC807  |0A07C8;
                       RTS                                  ;0A86FC|60      |      ;
 
                       LDY.W $07E6,X                        ;0A86FD|BCE607  |0A07E6;
                       LDA.W $054E,Y                        ;0A8700|B94E05  |0A054E;
                       BNE CODE_0A86EE                      ;0A8703|D0E9    |0A86EE;
                       LDA.B #$40                           ;0A8705|A940    |      ;
 
          CODE_0A8707: STA.W $07CE,X                        ;0A8707|9DCE07  |0A07CE;
                       INC.W $07C8,X                        ;0A870A|FEC807  |0A07C8;
                       RTS                                  ;0A870D|60      |      ;
 
                       DEC.W $07CE,X                        ;0A870E|DECE07  |0A07CE;
                       BNE CODE_0A86EE                      ;0A8711|D0DB    |0A86EE;
                       LDA.B #$00                           ;0A8713|A900    |      ;
                       STA.W $07C8,X                        ;0A8715|9DC807  |0A07C8;
                       RTS                                  ;0A8718|60      |      ;
 
 
          CODE_0A8719: ORA.L $875C87,X                      ;0A8719|1F875C87|875C87;
                       ASL.W DATA8_0AA587                   ;0A871D|0E87A5  |0AA587;
                       DEX                                  ;0A8720|CA      |      ;
                       CMP.B #$80                           ;0A8721|C980    |      ;
                       BCC CODE_0A8749                      ;0A8723|9024    |0A8749;
                       JSR.W CODE_0A8DE7                    ;0A8725|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A8728|20738D  |0A8D73;
                       BNE CODE_0A8749                      ;0A872B|D01C    |0A8749;
                       LDY.W $04A8                          ;0A872D|ACA804  |0A04A8;
                       LDA.B r_RNG                          ;0A8730|A51F    |00001F;
                       AND.B #$07                           ;0A8732|2907    |      ;
                       CLC                                  ;0A8734|18      |      ;
                       ADC.W PTR16_0A875A,Y                 ;0A8735|795A87  |0A875A;
                       TAY                                  ;0A8738|A8      |      ;
                       CLC                                  ;0A8739|18      |      ;
                       LDA.W CODE_0A874A,Y                  ;0A873A|B94A87  |0A874A;
                       ADC.W $0438                          ;0A873D|6D3804  |0A0438;
                       STA.B $00                            ;0A8740|8500    |000000;
                       LDA.B r_floodHight                   ;0A8742|A5CA    |0000CA;
                       STA.B $01                            ;0A8744|8501    |000001;
                       JMP.W CODE_0A86E4                    ;0A8746|4CE486  |0A86E4;
 
 
          CODE_0A8749: RTS                                  ;0A8749|60      |      ;
 
 
          CODE_0A874A: BVC CODE_0A87AC                      ;0A874A|5060    |0A87AC;
                       CPY.B #$48                           ;0A874C|C048    |      ;
                       JMP.W $5462                          ;0A874E|4C6254  |0A5462;
 
                       dw DATA8_0AB048                      ;0A8751|        |0AB048;
                       dw DATA8_0AA8A0                      ;0A8753|        |0AA8A0;
                       dw $40C0                             ;0A8755|        |0A40C0;
                       dw DATA8_0AB0B8                      ;0A8757|        |0AB0B8;
                       dw $00C0                             ;0A8759|        |0A00C0;
                       db $08                               ;0A875B|        |      ;
                       LDY.W $07E6,X                        ;0A875C|BCE607  |0A07E6;
                       LDA.W $054E,Y                        ;0A875F|B94E05  |0A054E;
                       BNE CODE_0A86EE                      ;0A8762|D08A    |0A86EE;
                       LDA.B #$81                           ;0A8764|A981    |      ;
                       JMP.W CODE_0A8707                    ;0A8766|4C0787  |0A8707;
 
 
         PTR16_0A8769: dw CODE_0A876F                       ;0A8769|        |0A876F;
                       dw CODE_0A8787                       ;0A876B|        |0A8787;
                       dw fishManSpawn01                    ;0A876D|        |0A86EF;
 
          CODE_0A876F: JSR.W CODE_0A85DE                    ;0A876F|20DE85  |0A85DE;
 
          CODE_0A8772: LDX.B r_entityID_processed           ;0A8772|A66C    |00006C;
                       LDA.B r_gameStateLoopCounter         ;0A8774|A51A    |00001A;
                       ADC.W $0438,X                        ;0A8776|7D3804  |0A0438;
                       AND.B #$03                           ;0A8779|2903    |      ;
                       TAY                                  ;0A877B|A8      |      ;
                       LDA.W CODE_0A8783,Y                  ;0A877C|B98387  |0A8783;
                       STA.W $07CE,X                        ;0A877F|9DCE07  |0A07CE;
                       RTS                                  ;0A8782|60      |      ;
 
 
          CODE_0A8783: PHP                                  ;0A8783|08      |      ;
                       SEC                                  ;0A8784|38      |      ;
                       CLC                                  ;0A8785|18      |      ;
                       PLP                                  ;0A8786|28      |      ;
 
          CODE_0A8787: DEC.W $07CE,X                        ;0A8787|DECE07  |0A07CE;
                       BNE CODE_0A87FC                      ;0A878A|D070    |0A87FC;
                       JSR.W CODE_0A8DE7                    ;0A878C|20E78D  |0A8DE7;
                       JSR.W CODE_0A8383                    ;0A878F|208383  |0A8383;
                       BNE CODE_0A8772                      ;0A8792|D0DE    |0A8772;
                       TXA                                  ;0A8794|8A      |      ;
                       ADC.B r_gameStateLoopCounter         ;0A8795|651A    |00001A;
                       ADC.W $0438                          ;0A8797|6D3804  |0A0438;
                       AND.B #$03                           ;0A879A|2903    |      ;
                       CLC                                  ;0A879C|18      |      ;
                       LDY.W $04A8                          ;0A879D|ACA804  |0A04A8;
                       ADC.W DATA8_0A87BA,Y                 ;0A87A0|79BA87  |0A87BA;
                       TAY                                  ;0A87A3|A8      |      ;
                       LDA.W DATA8_0A87B2,Y                 ;0A87A4|B9B287  |0A87B2;
                       ADC.W $0438                          ;0A87A7|6D3804  |0A0438;
                       STA.B $00                            ;0A87AA|8500    |000000;
 
          CODE_0A87AC: JSR.W CODE_0A8DDE                    ;0A87AC|20DE8D  |0A8DDE;
                       JMP.W CODE_0A86E7                    ;0A87AF|4CE786  |0A86E7;
 
 
         DATA8_0A87B2: db $68,$58,$60,$C8,$D0               ;0A87B2|        |      ;
                       db $68,$C0,$D8                       ;0A87B7|        |      ;
 
         DATA8_0A87BA: db $00,$04                           ;0A87BA|        |      ;
 
         DATA8_0A87BC: db $C0,$87                           ;0A87BC|        |      ;
                       DEC.B r_subweapMultiplier            ;0A87BE|C687    |000087;
                       JSR.W CODE_0A87CB                    ;0A87C0|20CB87  |0A87CB;
                       JMP.W CODE_0A85DE                    ;0A87C3|4CDE85  |0A85DE;
 
                       DEC.W $07CE,X                        ;0A87C6|DECE07  |0A07CE;
                       BNE CODE_0A87FC                      ;0A87C9|D031    |0A87FC;
 
          CODE_0A87CB: JSR.W CODE_0A8DE7                    ;0A87CB|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A87CE|20738D  |0A8D73;
                       BNE CODE_0A87EE                      ;0A87D1|D01B    |0A87EE;
                       TXA                                  ;0A87D3|8A      |      ;
                       ADC.B r_gameStateLoopCounter         ;0A87D4|651A    |00001A;
                       ADC.W $0438                          ;0A87D6|6D3804  |0A0438;
                       AND.B #$07                           ;0A87D9|2907    |      ;
                       CLC                                  ;0A87DB|18      |      ;
                       LDY.W $04A8                          ;0A87DC|ACA804  |0A04A8;
                       ADC.W DATA8_0A880D,Y                 ;0A87DF|790D88  |0A880D;
                       TAY                                  ;0A87E2|A8      |      ;
                       LDA.W CODE_0A87FD,Y                  ;0A87E3|B9FD87  |0A87FD;
                       ADC.W $0438                          ;0A87E6|6D3804  |0A0438;
                       STA.B $00                            ;0A87E9|8500    |000000;
                       JSR.W CODE_0A8DDE                    ;0A87EB|20DE8D  |0A8DDE;
 
          CODE_0A87EE: LDX.B r_entityID_processed           ;0A87EE|A66C    |00006C;
                       LDA.B #$47                           ;0A87F0|A947    |      ;
                       LDY.W $07F6                          ;0A87F2|ACF607  |0A07F6;
                       BEQ CODE_0A87F9                      ;0A87F5|F002    |0A87F9;
                       LDA.B #$30                           ;0A87F7|A930    |      ;
 
          CODE_0A87F9: STA.W $07CE,X                        ;0A87F9|9DCE07  |0A07CE;
 
          CODE_0A87FC: RTS                                  ;0A87FC|60      |      ;
 
 
          CODE_0A87FD: LDY.B #$50                           ;0A87FD|A050    |      ;
                       RTS                                  ;0A87FF|60      |      ;
 
                       db $B0,$A8,$48,$58,$58               ;0A8800|        |      ;
                       db $A0,$A8,$B0,$60,$B8               ;0A8805|        |      ;
                       db $48,$58,$98                       ;0A880A|        |      ;
 
         DATA8_0A880D: db $00,$08                           ;0A880D|        |      ;
 
         DATA8_0A880F: db $13,$88,$24,$88                   ;0A880F|        |      ;
                       INC.W $07C8,X                        ;0A8813|FEC807  |0A07C8;
 
          CODE_0A8816: JSR.W CODE_0A8DE7                    ;0A8816|20E78D  |0A8DE7;
                       JSR.W CODE_0A83AE                    ;0A8819|20AE83  |0A83AE;
                       BNE CODE_0A8821                      ;0A881C|D003    |0A8821;
                       JSR.W CODE_0A883C                    ;0A881E|203C88  |0A883C;
 
          CODE_0A8821: JMP.W CODE_0A88B6                    ;0A8821|4CB688  |0A88B6;
 
                       DEC.W $07CE,X                        ;0A8824|DECE07  |0A07CE;
                       BEQ CODE_0A8816                      ;0A8827|F0ED    |0A8816;
 
          CODE_0A8829: RTS                                  ;0A8829|60      |      ;
 
 
         PTR16_0A882A: dw CODE_0A882E                       ;0A882A|        |0A882E;
                       dw DATA8_0A8872                      ;0A882C|        |0A8872;
 
          CODE_0A882E: INC.W $07C8,X                        ;0A882E|FEC807  |0A07C8;
                       JSR.W CODE_0A88B6                    ;0A8831|20B688  |0A88B6;
                       JSR.W CODE_0A8DE7                    ;0A8834|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D73                    ;0A8837|20738D  |0A8D73;
                       BNE CODE_0A8829                      ;0A883A|D0ED    |0A8829;
 
          CODE_0A883C: JSR.W CODE_0A89E5                    ;0A883C|20E589  |0A89E5;
                       LDA.W CODE_0A8882,Y                  ;0A883F|B98288  |0A8882;
                       STA.B $00                            ;0A8842|8500    |000000;
                       LDA.B #$00                           ;0A8844|A900    |      ;
                       LDY.B r_scrollSpd                    ;0A8846|A46E    |00006E;
                       BEQ CODE_0A8861                      ;0A8848|F017    |0A8861;
                       LDY.B r_roomOrientation              ;0A884A|A468    |000068;
                       BPL CODE_0A8861                      ;0A884C|1013    |0A8861;
                       LDY.B r_scrollSpd                    ;0A884E|A46E    |00006E;
                       BPL CODE_0A8854                      ;0A8850|1002    |0A8854;
                       LDA.B #$04                           ;0A8852|A904    |      ;
 
          CODE_0A8854: CLC                                  ;0A8854|18      |      ;
                       STA.B r_temp_Xpos                    ;0A8855|850A    |00000A;
                       LDA.B r_gameStateLoopCounter         ;0A8857|A51A    |00001A;
                       AND.B #$03                           ;0A8859|2903    |      ;
                       ADC.B r_temp_Xpos                    ;0A885B|650A    |00000A;
                       TAY                                  ;0A885D|A8      |      ;
                       LDA.W DATA8_0A886A,Y                 ;0A885E|B96A88  |0A886A;
 
          CODE_0A8861: CLC                                  ;0A8861|18      |      ;
                       ADC.W $041C                          ;0A8862|6D1C04  |0A041C;
                       STA.B $01                            ;0A8865|8501    |000001;
                       JMP.W CODE_0A88C4                    ;0A8867|4CC488  |0A88C4;
 
 
         DATA8_0A886A: db $C0,$B0,$E0,$D0,$40               ;0A886A|        |      ;
                       db $50,$20,$30                       ;0A886F|        |      ;
 
         DATA8_0A8872: db $DE,$CE,$07,$F0,$BA               ;0A8872|        |      ;
 
         DATA8_0A8877: db $60                               ;0A8877|        |      ;
 
 
medusaHeadSpawnPointer: dw medusaHeadSpawn00                 ;0A8878|        |0A887C;
 
                       dw medusaHeadSpawn01                 ;0A887A|        |0A8884;
 
    medusaHeadSpawn00: JSR.W CODE_0A8889                    ;0A887C|208988  |0A8889;
                       JMP.W CODE_0A85DE                    ;0A887F|4CDE85  |0A85DE;
 
 
          CODE_0A8882: PHP                                  ;0A8882|08      |      ;
                       SED                                  ;0A8883|F8      |      ;
 
    medusaHeadSpawn01: JSR.W CODE_0A8E28                    ;0A8884|20288E  |0A8E28;
                       BNE CODE_0A88C3                      ;0A8887|D03A    |0A88C3;
 
          CODE_0A8889: JSR.W CODE_0A8DE7                    ;0A8889|20E78D  |0A8DE7;
                       JSR.W CODE_0A8E54                    ;0A888C|20548E  |0A8E54;
                       BNE CODE_0A88B6                      ;0A888F|D025    |0A88B6;
                       LDA.B r_stage                        ;0A8891|A532    |000032;
                       CMP.B #$0A                           ;0A8893|C90A    |      ;
                       BNE CODE_0A88A4                      ;0A8895|D00D    |0A88A4;
                       LDA.W $041C                          ;0A8897|AD1C04  |0A041C;
                       CMP.B #$A0                           ;0A889A|C9A0    |      ;
                       BCC CODE_0A88A4                      ;0A889C|9006    |0A88A4;
                       JSR.W CODE_0A8A44                    ;0A889E|20448A  |0A8A44;
                       JMP.W CODE_0A88AC                    ;0A88A1|4CAC88  |0A88AC;
 
 
          CODE_0A88A4: JSR.W CODE_0A89F4                    ;0A88A4|20F489  |0A89F4;
                       LDA.W CODE_0A8882,Y                  ;0A88A7|B98288  |0A8882;
                       STA.B $00                            ;0A88AA|8500    |000000;
 
          CODE_0A88AC: LDA.W $041C                          ;0A88AC|AD1C04  |0A041C;
                       ADC.B #$04                           ;0A88AF|6904    |      ;
                       STA.B $01                            ;0A88B1|8501    |000001;
                       JSR.W CODE_0A88C4                    ;0A88B3|20C488  |0A88C4;
 
          CODE_0A88B6: LDA.B #$70                           ;0A88B6|A970    |      ;
                       LDY.B r_stage                        ;0A88B8|A432    |000032;
                       CPY.B #$0A                           ;0A88BA|C00A    |      ;
                       BCS CODE_0A88C0                      ;0A88BC|B002    |0A88C0;
                       LDA.B #$A0                           ;0A88BE|A9A0    |      ;
 
          CODE_0A88C0: JMP.W CODE_0A8623                    ;0A88C0|4C2386  |0A8623;
 
 
          CODE_0A88C3: RTS                                  ;0A88C3|60      |      ;
 
 
          CODE_0A88C4: LDA.W $07F6                          ;0A88C4|ADF607  |0A07F6;
                       BEQ CODE_0A88CD                      ;0A88C7|F004    |0A88CD;
                       LDA.B #$6D                           ;0A88C9|A96D    |      ;
                       STA.B $02                            ;0A88CB|8502    |000002;
 
          CODE_0A88CD: JMP.W CODE_0A8DDE                    ;0A88CD|4CDE8D  |0A8DDE;
 
 
         PTR16_0A88D0: dw CODE_0A88D4                       ;0A88D0|        |0A88D4;
                       dw CODE_0A88DF                       ;0A88D2|        |0A88DF;
 
          CODE_0A88D4: LDA.B #$00                           ;0A88D4|A900    |      ;
                       STA.W $07E6,X                        ;0A88D6|9DE607  |0A07E6;
                       JSR.W CODE_0A88E4                    ;0A88D9|20E488  |0A88E4;
                       JMP.W CODE_0A85DE                    ;0A88DC|4CDE85  |0A85DE;
 
 
          CODE_0A88DF: DEC.W $07CE,X                        ;0A88DF|DECE07  |0A07CE;
                       BNE DATA8_0A8877                     ;0A88E2|D093    |0A8877;
 
          CODE_0A88E4: JSR.W CODE_0A8DE7                    ;0A88E4|20E78D  |0A8DE7;
                       JSR.W CODE_0A83A0                    ;0A88E7|20A083  |0A83A0;
                       BNE CODE_0A8910                      ;0A88EA|D024    |0A8910;
                       LDA.W $07E6,X                        ;0A88EC|BDE607  |0A07E6;
                       CMP.B #$08                           ;0A88EF|C908    |      ;
                       BCC CODE_0A88F8                      ;0A88F1|9005    |0A88F8;
                       LDA.B #$00                           ;0A88F3|A900    |      ;
                       STA.W $07E6,X                        ;0A88F5|9DE607  |0A07E6;
 
          CODE_0A88F8: LDY.W $07E6,X                        ;0A88F8|BCE607  |0A07E6;
                       LDA.W DATA8_0A8925,Y                 ;0A88FB|B92589  |0A8925;
                       STA.B $01                            ;0A88FE|8501    |000001;
                       LDA.W DATA8_0A891D,Y                 ;0A8900|B91D89  |0A891D;
                       STA.B $00                            ;0A8903|8500    |000000;
                       INC.W $07E6,X                        ;0A8905|FEE607  |0A07E6;
                       JSR.W CODE_0A892D                    ;0A8908|202D89  |0A892D;
                       BNE CODE_0A8910                      ;0A890B|D003    |0A8910;
                       JSR.W CODE_0A8DDE                    ;0A890D|20DE8D  |0A8DDE;
 
          CODE_0A8910: LDA.B #$80                           ;0A8910|A980    |      ;
                       LDY.B r_stage                        ;0A8912|A432    |000032;
                       CPY.B #$0D                           ;0A8914|C00D    |      ;
                       BEQ CODE_0A891A                      ;0A8916|F002    |0A891A;
                       LDA.B #$FF                           ;0A8918|A9FF    |      ;
 
          CODE_0A891A: JMP.W CODE_0A8623                    ;0A891A|4C2386  |0A8623;
 
 
         DATA8_0A891D: db $F8,$F8,$08,$F8,$F8               ;0A891D|        |      ;
                       db $08,$F8,$08                       ;0A8922|        |      ;
 
         DATA8_0A8925: db $40,$60,$40,$60,$60               ;0A8925|        |      ;
 
                       db $40,$40,$60                       ;0A892A|        |      ;
 
 
          CODE_0A892D: LDA.W $0438                          ;0A892D|AD3804  |0A0438;
                       CMP.B #$C0                           ;0A8930|C9C0    |      ;
                       BCS CODE_0A893B                      ;0A8932|B007    |0A893B;
                       CMP.B #$40                           ;0A8934|C940    |      ;
                       BCC CODE_0A8942                      ;0A8936|900A    |0A8942;
 
          CODE_0A8938: LDA.B #$00                           ;0A8938|A900    |      ;
                       RTS                                  ;0A893A|60      |      ;
 
 
          CODE_0A893B: LDA.B $00                            ;0A893B|A500    |000000;
                       BPL CODE_0A8938                      ;0A893D|10F9    |0A8938;
 
          CODE_0A893F: LDA.B #$01                           ;0A893F|A901    |      ;
                       RTS                                  ;0A8941|60      |      ;
 
 
          CODE_0A8942: LDA.B $00                            ;0A8942|A500    |000000;
                       BMI CODE_0A8938                      ;0A8944|30F2    |0A8938;
                       BPL CODE_0A893F                      ;0A8946|10F7    |0A893F;
 
  sporeSpawnerPointer: dw CODE_0A894C                       ;0A8948|        |0A894C;
 
                       dw sporeSpawner01                    ;0A894A|        |0A8952;
 
          CODE_0A894C: JSR.W sporeSpawner00                 ;0A894C|205789  |0A8957;
                       JMP.W CODE_0A85DE                    ;0A894F|4CDE85  |0A85DE;
 
 
       sporeSpawner01: DEC.W $07CE,X                        ;0A8952|DECE07  |0A07CE;
                       BNE CODE_0A896D                      ;0A8955|D016    |0A896D;
 
       sporeSpawner00: LDA.B #$80                           ;0A8957|A980    |      ;
                       STA.W $07CE,X                        ;0A8959|9DCE07  |0A07CE;
                       JSR.W CODE_0A8DE7                    ;0A895C|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D7B                    ;0A895F|207B8D  |0A8D7B;
                       BNE CODE_0A896D                      ;0A8962|D009    |0A896D;
                       LDY.W $04A8                          ;0A8964|ACA804  |0A04A8;
                       LDA.W DATA8_0A896E,Y                 ;0A8967|B96E89  |0A896E;
                       JMP.W CODE_0A89A9                    ;0A896A|4CA989  |0A89A9;
 
 
          CODE_0A896D: RTS                                  ;0A896D|60      |      ;
 
 
         DATA8_0A896E: db $F8,$08                           ;0A896E|        |      ;
 
batFlyingSpawnPointer_0c: dw batFlyingSpawn00                  ;0A8970|        |0A8974;
                       dw batFlyingSpawn01                  ;0A8972|        |0A897A;
 
     batFlyingSpawn00: JSR.W CODE_0A897F                    ;0A8974|207F89  |0A897F;
                       JMP.W CODE_0A85DE                    ;0A8977|4CDE85  |0A85DE;
 
 
     batFlyingSpawn01: JSR.W CODE_0A8E28                    ;0A897A|20288E  |0A8E28;
                       BNE CODE_0A89D9                      ;0A897D|D05A    |0A89D9;
 
          CODE_0A897F: LDA.B #$C0                           ;0A897F|A9C0    |      ;
                       STA.W $07CE,X                        ;0A8981|9DCE07  |0A07CE;
                       JSR.W CODE_0A8DE7                    ;0A8984|20E78D  |0A8DE7;
                       JSR.W CODE_0A848D                    ;0A8987|208D84  |0A848D;
                       BNE CODE_0A8992                      ;0A898A|D006    |0A8992;
                       JSR.W CODE_0A8E89                    ;0A898C|20898E  |0A8E89;
                       BEQ CODE_0A89A3                      ;0A898F|F012    |0A89A3;
                       RTS                                  ;0A8991|60      |      ;
 
 
          CODE_0A8992: LDA.B r_stage                        ;0A8992|A532    |000032;
                       CMP.B #$01                           ;0A8994|C901    |      ;
                       BNE CODE_0A899E                      ;0A8996|D006    |0A899E;
                       JSR.W CODE_0A8EC3                    ;0A8998|20C38E  |0A8EC3;
                       BEQ CODE_0A89A3                      ;0A899B|F006    |0A89A3;
                       RTS                                  ;0A899D|60      |      ;
 
 
          CODE_0A899E: JSR.W CODE_0A8D7B                    ;0A899E|207B8D  |0A8D7B;
                       BNE CODE_0A89D9                      ;0A89A1|D036    |0A89D9;
 
          CODE_0A89A3: JSR.W CODE_0A89B7                    ;0A89A3|20B789  |0A89B7;
                       LDA.W CODE_0A8882,Y                  ;0A89A6|B98288  |0A8882;
 
          CODE_0A89A9: STA.B $00                            ;0A89A9|8500    |000000;
                       LDA.W $041C                          ;0A89AB|AD1C04  |0A041C;
                       STA.B $01                            ;0A89AE|8501    |000001;
 
          CODE_0A89B0: JMP.W CODE_0A8DDE                    ;0A89B0|4CDE8D  |0A8DDE;
 
 
          CODE_0A89B3: LDA.B #$01                           ;0A89B3|A901    |      ;
                       BNE CODE_0A89B9                      ;0A89B5|D002    |0A89B9;
 
          CODE_0A89B7: LDA.B #$00                           ;0A89B7|A900    |      ;
 
          CODE_0A89B9: STA.B r_roomSectionChrBanksDataOffset;0A89B9|850F    |00000F;
                       LDY.B #$01                           ;0A89BB|A001    |      ;
                       LDA.W $0438                          ;0A89BD|AD3804  |0A0438;
                       CMP.B #$50                           ;0A89C0|C950    |      ;
                       BCC CODE_0A89D9                      ;0A89C2|9015    |0A89D9;
 
          CODE_0A89C4: DEY                                  ;0A89C4|88      |      ;
                       CMP.B #$B0                           ;0A89C5|C9B0    |      ;
                       BCS CODE_0A89D9                      ;0A89C7|B010    |0A89D9;
                       LDA.B r_roomSectionChrBanksDataOffset;0A89C9|A50F    |00000F;
                       BNE CODE_0A89DA                      ;0A89CB|D00D    |0A89DA;
                       LDA.W $041C                          ;0A89CD|AD1C04  |0A041C;
                       LSR A                                ;0A89D0|4A      |      ;
                       LSR A                                ;0A89D1|4A      |      ;
                       LSR A                                ;0A89D2|4A      |      ;
                       LSR A                                ;0A89D3|4A      |      ;
                       ADC.B r_RNG                          ;0A89D4|651F    |00001F;
                       AND.B #$01                           ;0A89D6|2901    |      ;
                       TAY                                  ;0A89D8|A8      |      ;
 
          CODE_0A89D9: RTS                                  ;0A89D9|60      |      ;
 
 
          CODE_0A89DA: LDY.B #$01                           ;0A89DA|A001    |      ;
                       LDA.B r_gameStateLoopCounter         ;0A89DC|A51A    |00001A;
                       AND.B #$1F                           ;0A89DE|291F    |      ;
                       BNE CODE_0A89D9                      ;0A89E0|D0F7    |0A89D9;
                       LDY.B #$00                           ;0A89E2|A000    |      ;
                       RTS                                  ;0A89E4|60      |      ;
 
 
          CODE_0A89E5: LDA.B #$00                           ;0A89E5|A900    |      ;
                       STA.B r_roomSectionChrBanksDataOffset;0A89E7|850F    |00000F;
                       LDY.B #$01                           ;0A89E9|A001    |      ;
                       LDA.W $0438                          ;0A89EB|AD3804  |0A0438;
                       CMP.B #$60                           ;0A89EE|C960    |      ;
                       BCC CODE_0A89D9                      ;0A89F0|90E7    |0A89D9;
                       BCS CODE_0A89C4                      ;0A89F2|B0D0    |0A89C4;
 
          CODE_0A89F4: LDY.B #$01                           ;0A89F4|A001    |      ;
                       LDA.W $0438                          ;0A89F6|AD3804  |0A0438;
                       CMP.B #$40                           ;0A89F9|C940    |      ;
                       BCC CODE_0A89D9                      ;0A89FB|90DC    |0A89D9;
                       DEY                                  ;0A89FD|88      |      ;
                       CMP.B #$C0                           ;0A89FE|C9C0    |      ;
                       BCS CODE_0A89D9                      ;0A8A00|B0D7    |0A89D9;
                       LDA.W $04A8                          ;0A8A02|ADA804  |0A04A8;
                       EOR.B #$01                           ;0A8A05|4901    |      ;
                       TAY                                  ;0A8A07|A8      |      ;
                       RTS                                  ;0A8A08|60      |      ;
 
 
         DATA8_0A8A09: db $17,$8A,$0D,$8A,$DE               ;0A8A09|        |      ;
                       db $CE,$07,$F0,$10                   ;0A8A0E|        |      ;
 
         DATA8_0A8A12: db $60                               ;0A8A12|        |      ;
 
wingedDeamonSpawnPointer: dw wingedDeamonSpawn00               ;0A8A13|        |0A8A17;
                       dw wingedDeamonSpawn01               ;0A8A15|        |0A8A1D;
 
  wingedDeamonSpawn00: JSR.W CODE_0A8A22                    ;0A8A17|20228A  |0A8A22;
                       JMP.W CODE_0A85DE                    ;0A8A1A|4CDE85  |0A85DE;
 
 
  wingedDeamonSpawn01: JSR.W CODE_0A8E28                    ;0A8A1D|20288E  |0A8E28;
                       BNE DATA8_0A8A12                     ;0A8A20|D0F0    |0A8A12;
 
          CODE_0A8A22: LDA.B #$90                           ;0A8A22|A990    |      ;
                       STA.W $07CE,X                        ;0A8A24|9DCE07  |0A07CE;
                       JSR.W CODE_0A8DE7                    ;0A8A27|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D7B                    ;0A8A2A|207B8D  |0A8D7B;
                       BNE CODE_0A8AA1                      ;0A8A2D|D072    |0A8AA1;
                       JSR.W CODE_0A8A44                    ;0A8A2F|20448A  |0A8A44;
                       LDA.W $041C                          ;0A8A32|AD1C04  |0A041C;
                       CMP.B #$20                           ;0A8A35|C920    |      ;
                       BCC CODE_0A8AA1                      ;0A8A37|9068    |0A8AA1;
                       LDY.B r_roomOrientation              ;0A8A39|A468    |000068;
                       BPL CODE_0A8A3F                      ;0A8A3B|1002    |0A8A3F;
                       SBC.B #$18                           ;0A8A3D|E918    |      ;
 
          CODE_0A8A3F: STA.B $01                            ;0A8A3F|8501    |000001;
                       JMP.W CODE_0A89B0                    ;0A8A41|4CB089  |0A89B0;
 
 
          CODE_0A8A44: LDY.B #$00                           ;0A8A44|A000    |      ;
                       LDA.W $0438                          ;0A8A46|AD3804  |0A0438;
                       CMP.B #$80                           ;0A8A49|C980    |      ;
                       BCS CODE_0A8A4E                      ;0A8A4B|B001    |0A8A4E;
                       INY                                  ;0A8A4D|C8      |      ;
 
          CODE_0A8A4E: LDA.W CODE_0A8882,Y                  ;0A8A4E|B98288  |0A8882;
                       STA.B $00                            ;0A8A51|8500    |000000;
                       RTS                                  ;0A8A53|60      |      ;
 
 
         mummySpwan01: DEC.W $07CE,X                        ;0A8A54|DECE07  |0A07CE;
                       BNE CODE_0A8A5E                      ;0A8A57|D005    |0A8A5E;
                       LDA.B #$00                           ;0A8A59|A900    |      ;
                       STA.W $07C8,X                        ;0A8A5B|9DC807  |0A07C8;
 
          CODE_0A8A5E: RTS                                  ;0A8A5E|60      |      ;
 
 
 mummySpwanPointer_1a: dw mummySpwan00                      ;0A8A5F|        |0A8A63;
                       dw mummySpwan01                      ;0A8A61|        |0A8A54;
 
         mummySpwan00: LDA.W $07E0,X                        ;0A8A63|BDE007  |0A07E0;
                       BNE CODE_0A8AA1                      ;0A8A66|D039    |0A8AA1;
                       JSR.W CODE_0A8E1A                    ;0A8A68|201A8E  |0A8E1A;
                       CMP.B #$20                           ;0A8A6B|C920    |      ;
                       db $B0,$32                           ;0A8A6D|        |      ;
                       LDA.B #$02                           ;0A8A6F|A902    |      ;
                       STA.W $07E6,X                        ;0A8A71|9DE607  |0A07E6;
                       JSR.W CODE_0A85DE                    ;0A8A74|20DE85  |0A85DE;
 
          CODE_0A8A77: JSR.W CODE_0A8DE7                    ;0A8A77|20E78D  |0A8DE7;
                       JSR.W CODE_0A8E54                    ;0A8A7A|20548E  |0A8E54;
                       BNE CODE_0A8A95                      ;0A8A7D|D016    |0A8A95;
                       JSR.W CODE_0A8DDE                    ;0A8A7F|20DE8D  |0A8DDE;
                       STX.B $09                            ;0A8A82|8609    |000009;
                       LDX.B r_entityID_processed           ;0A8A84|A66C    |00006C;
                       CLC                                  ;0A8A86|18      |      ;
                       LDY.W $07E6,X                        ;0A8A87|BCE607  |0A07E6;
                       LDA.W DATA8_0A8AA2,Y                 ;0A8A8A|B9A28A  |0A8AA2;
                       ADC.W $07DA,X                        ;0A8A8D|7DDA07  |0A07DA;
                       LDX.B $09                            ;0A8A90|A609    |000009;
                       STA.W $0438,X                        ;0A8A92|9D3804  |0A0438;
 
          CODE_0A8A95: LDX.B r_entityID_processed           ;0A8A95|A66C    |00006C;
                       DEC.W $07E6,X                        ;0A8A97|DEE607  |0A07E6;
                       BNE CODE_0A8A77                      ;0A8A9A|D0DB    |0A8A77;
                       LDA.B #$28                           ;0A8A9C|A928    |      ;
                       STA.W $07CE,X                        ;0A8A9E|9DCE07  |0A07CE;
 
          CODE_0A8AA1: RTS                                  ;0A8AA1|60      |      ;
 
 
         DATA8_0A8AA2: db $00,$38,$C8                       ;0A8AA2|        |      ;
 
         DATA8_0A8AA5: db $B5,$8A,$C2,$8A,$D7               ;0A8AA5|        |      ;
                       db $8A,$57,$8C                       ;0A8AAA|        |      ;
 
ghostSpawnerPointer_18: dw CODE_0A8AB5                       ;0A8AAD|        |0A8AB5;
                       dw CODE_0A8ABD                       ;0A8AAF|        |0A8ABD;
                       dw CODE_0A8AD7                       ;0A8AB1|        |0A8AD7;
                       dw bonePillarSpawn01                 ;0A8AB3|        |0A8C57;
 
          CODE_0A8AB5: LDA.W $07E0,X                        ;0A8AB5|BDE007  |0A07E0;
                       BNE CODE_0A8AD7                      ;0A8AB8|D01D    |0A8AD7;
                       JMP.W CODE_0A85DE                    ;0A8ABA|4CDE85  |0A85DE;
 
 
          CODE_0A8ABD: DEC.W $07CE,X                        ;0A8ABD|DECE07  |0A07CE;
                       BNE CODE_0A8AD7                      ;0A8AC0|D015    |0A8AD7;
                       JSR.W CODE_0A8DE7                    ;0A8AC2|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A8AC5|BDE007  |0A07E0;
                       BNE CODE_0A8AD2                      ;0A8AC8|D008    |0A8AD2;
                       JSR.W CODE_0A8E54                    ;0A8ACA|20548E  |0A8E54;
                       BNE CODE_0A8AD2                      ;0A8ACD|D003    |0A8AD2;
                       JSR.W CODE_0A8BBE                    ;0A8ACF|20BE8B  |0A8BBE;
 
          CODE_0A8AD2: LDA.B #$80                           ;0A8AD2|A980    |      ;
                       STA.W $07CE,X                        ;0A8AD4|9DCE07  |0A07CE;
 
          CODE_0A8AD7: RTS                                  ;0A8AD7|60      |      ;
 
 
         DATA8_0A8AD8: db $DE,$8A,$EE,$8A,$E9               ;0A8AD8|        |      ;
                       db $8A,$20,$E7,$8D                   ;0A8ADD|        |      ;
                       JSR.W CODE_0A8D8B                    ;0A8AE1|208B8D  |0A8D8B;
                       BNE CODE_0A8AD7                      ;0A8AE4|D0F1    |0A8AD7;
                       JMP.W CODE_0A8BBE                    ;0A8AE6|4CBE8B  |0A8BBE;
 
                       LDA.B #$00                           ;0A8AE9|A900    |      ;
                       STA.W $07C8,X                        ;0A8AEB|9DC807  |0A07C8;
                       RTS                                  ;0A8AEE|60      |      ;
 
 
    fuzzySpawnPointer: dw fuzzySpawn00                      ;0A8AEF|        |0A8AF5;
                       dw emptySpawner05                    ;0A8AF1|        |0A8B15;
                       dw bonePillarSpawn01                 ;0A8AF3|        |0A8C57;
 
         fuzzySpawn00: LDA.W $07E0,X                        ;0A8AF5|BDE007  |0A07E0;
                       BNE emptySpawner05                   ;0A8AF8|D01B    |0A8B15;
                       JSR.W CODE_0A8DE7                    ;0A8AFA|20E78D  |0A8DE7;
                       LDA.W $07E6,X                        ;0A8AFD|BDE607  |0A07E6;
                       STA.B $04                            ;0A8B00|8504    |000004;
                       db $20                               ;0A8B02|        |      ;
                       dw CODE_0FFEB9                       ;0A8B03|        |0FFEB9;
                       BNE emptySpawner05                   ;0A8B05|D00E    |0A8B15;
                       JSR.W CODE_0A8DDE                    ;0A8B07|20DE8D  |0A8DDE;
                       JSR.W CODE_0A8BD5                    ;0A8B0A|20D58B  |0A8BD5;
                       LDA.B $04                            ;0A8B0D|A504    |000004;
                       STA.W $0633,X                        ;0A8B0F|9D3306  |0A0633;
                       JMP.W CODE_0A85DE                    ;0A8B12|4CDE85  |0A85DE;
 
 
       emptySpawner05: RTS                                  ;0A8B15|60      |      ;
 
 
swordSkelletonSpawnPointer_11: dw swordSkelleton00                  ;0A8B16|        |0A8B1C;
                       dw emptySpawn01                      ;0A8B18|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8B1A|        |0A8C57;
 
     swordSkelleton00: LDA.W $07E0,X                        ;0A8B1C|BDE007  |0A07E0;
                       BNE CODE_0A8B60                      ;0A8B1F|D03F    |0A8B60;
                       JSR.W CODE_0A8DE7                    ;0A8B21|20E78D  |0A8DE7;
                       JSR.W CODE_0A83AE                    ;0A8B24|20AE83  |0A83AE;
                       BNE CODE_0A8B60                      ;0A8B27|D037    |0A8B60;
                       JMP.W CODE_0A8BBE                    ;0A8B29|4CBE8B  |0A8BBE;
 
 
axeKnightSpawnerPointer: dw axeKnightSpawner00                ;0A8B2C|        |0A8B32;
                       dw emptySpawn01                      ;0A8B2E|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8B30|        |0A8C57;
 
   axeKnightSpawner00: LDA.W $07E0,X                        ;0A8B32|BDE007  |0A07E0;
                       BNE CODE_0A8B60                      ;0A8B35|D029    |0A8B60;
                       JSR.W CODE_0A8E9C                    ;0A8B37|209C8E  |0A8E9C;
                       BNE CODE_0A8B4A                      ;0A8B3A|D00E    |0A8B4A;
                       JSR.W CODE_0A8DE7                    ;0A8B3C|20E78D  |0A8DE7;
                       JSR.W CODE_0A8E50                    ;0A8B3F|20508E  |0A8E50;
                       BNE CODE_0A8B4A                      ;0A8B42|D006    |0A8B4A;
                       JSR.W DATA8_0A8DFF                   ;0A8B44|20FF8D  |0A8DFF;
                       JMP.W CODE_0A8BC1                    ;0A8B47|4CC18B  |0A8BC1;
 
 
          CODE_0A8B4A: JMP.W CODE_0A8BCD                    ;0A8B4A|4CCD8B  |0A8BCD;
 
 
          CODE_0A8B4D: EOR.B (r_conveyaerRoomEffect,S),Y    ;0A8B4D|538B    |00008B;
                       SED                                  ;0A8B4F|F8      |      ;
                       PHB                                  ;0A8B50|8B      |      ;
                       EOR.B [r_whipSparkTimer],Y           ;0A8B51|578C    |00008C;
                       LDA.W $07E0,X                        ;0A8B53|BDE007  |0A07E0;
                       BNE CODE_0A8B60                      ;0A8B56|D008    |0A8B60;
                       JSR.W CODE_0A8DE7                    ;0A8B58|20E78D  |0A8DE7;
                       JSR.W CODE_0A83AE                    ;0A8B5B|20AE83  |0A83AE;
                       BEQ CODE_0A8BBE                      ;0A8B5E|F05E    |0A8BBE;
 
          CODE_0A8B60: RTS                                  ;0A8B60|60      |      ;
 
 
hunchbackSpawnPointer_0a: dw hunchbackSpawn00                  ;0A8B61|        |0A8B67;
                       dw emptySpawn01                      ;0A8B63|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8B65|        |0A8C57;
 
     hunchbackSpawn00: LDA.W $07E0,X                        ;0A8B67|BDE007  |0A07E0;
                       BNE CODE_0A8BAA                      ;0A8B6A|D03E    |0A8BAA;
                       JSR.W CODE_0A8DE7                    ;0A8B6C|20E78D  |0A8DE7;
                       JSR.W CODE_0A8E54                    ;0A8B6F|20548E  |0A8E54;
                       BNE CODE_0A8BAA                      ;0A8B72|D036    |0A8BAA;
                       LDA.W $07F6                          ;0A8B74|ADF607  |0A07F6;
                       BEQ CODE_0A8BBE                      ;0A8B77|F045    |0A8BBE;
                       LDA.B $03                            ;0A8B79|A503    |000003;
                       CMP.B #$63                           ;0A8B7B|C963    |      ;
                       BNE CODE_0A8BBE                      ;0A8B7D|D03F    |0A8BBE;
                       LDA.B r_stage                        ;0A8B7F|A532    |000032;
                       CMP.B #$0C                           ;0A8B81|C90C    |      ;
                       BEQ CODE_0A8BBE                      ;0A8B83|F039    |0A8BBE;
                       CMP.B #$01                           ;0A8B85|C901    |      ;
                       BNE CODE_0A8B8F                      ;0A8B87|D006    |0A8B8F;
                       LDA.B r_roomIdx                      ;0A8B89|A534    |000034;
                       CMP.B #$01                           ;0A8B8B|C901    |      ;
                       BEQ CODE_0A8BBE                      ;0A8B8D|F02F    |0A8BBE;
 
          CODE_0A8B8F: LDA.B #$71                           ;0A8B8F|A971    |      ;
                       STA.B $02                            ;0A8B91|8502    |000002;
                       LDA.B #$67                           ;0A8B93|A967    |      ;
                       STA.B $03                            ;0A8B95|8503    |000003;
                       JSR.W DATA8_0A8DFF                   ;0A8B97|20FF8D  |0A8DFF;
                       LDA.B #$10                           ;0A8B9A|A910    |      ;
                       STA.W $067B,X                        ;0A8B9C|9D7B06  |0A067B;
                       LDA.B #$33                           ;0A8B9F|A933    |      ;
                       STA.W $0657,X                        ;0A8BA1|9D5706  |0A0657;
                       JSR.W CODE_0A8BD5                    ;0A8BA4|20D58B  |0A8BD5;
                       JMP.W CODE_0A85DE                    ;0A8BA7|4CDE85  |0A85DE;
 
 
          CODE_0A8BAA: RTS                                  ;0A8BAA|60      |      ;
 
 
redSkelletonSpawnPointer_13: dw redSkelletonSpawn00               ;0A8BAB|        |0A8BB1;
                       dw emptySpawn01                      ;0A8BAD|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8BAF|        |0A8C57;
 
  redSkelletonSpawn00: LDA.W $07E0,X                        ;0A8BB1|BDE007  |0A07E0;
                       BNE emptySpawn01                     ;0A8BB4|D042    |0A8BF8;
                       JSR.W CODE_0A8DE7                    ;0A8BB6|20E78D  |0A8DE7;
                       JSR.W CODE_0A8E54                    ;0A8BB9|20548E  |0A8E54;
                       BNE CODE_0A8BCD                      ;0A8BBC|D00F    |0A8BCD;
 
          CODE_0A8BBE: JSR.W DATA8_0A8DFF                   ;0A8BBE|20FF8D  |0A8DFF;
 
          CODE_0A8BC1: JSR.W CODE_0A9332                    ;0A8BC1|203293  |0A9332;
                       db $20                               ;0A8BC4|        |      ;
                       dw UNREACH_0FE7EC                    ;0A8BC5|        |0FE7EC;
                       JSR.W CODE_0A8BD5                    ;0A8BC7|20D58B  |0A8BD5;
                       JMP.W CODE_0A85DE                    ;0A8BCA|4CDE85  |0A85DE;
 
 
          CODE_0A8BCD: LDX.B r_entityID_processed           ;0A8BCD|A66C    |00006C;
                       LDA.B #$02                           ;0A8BCF|A902    |      ;
                       STA.W $07C8,X                        ;0A8BD1|9DC807  |0A07C8;
                       RTS                                  ;0A8BD4|60      |      ;
 
 
          CODE_0A8BD5: LDA.W $0470,X                        ;0A8BD5|BD7004  |0A0470;
                       ORA.B #$04                           ;0A8BD8|0904    |      ;
                       STA.W $0470,X                        ;0A8BDA|9D7004  |0A0470;
                       LDA.B r_entityID_processed           ;0A8BDD|A56C    |00006C;
                       STA.W $0645,X                        ;0A8BDF|9D4506  |0A0645;
                       TXA                                  ;0A8BE2|8A      |      ;
                       PHA                                  ;0A8BE3|48      |      ;
                       LDX.B r_entityID_processed           ;0A8BE4|A66C    |00006C;
                       ASL A                                ;0A8BE6|0A      |      ;
                       ASL A                                ;0A8BE7|0A      |      ;
                       ASL A                                ;0A8BE8|0A      |      ;
                       ASL A                                ;0A8BE9|0A      |      ;
                       STA.B $06                            ;0A8BEA|8506    |000006;
                       LDA.W $07C8,X                        ;0A8BEC|BDC807  |0A07C8;
                       AND.B #$0F                           ;0A8BEF|290F    |      ;
                       ORA.B $06                            ;0A8BF1|0506    |000006;
                       STA.W $07C8,X                        ;0A8BF3|9DC807  |0A07C8;
                       PLA                                  ;0A8BF6|68      |      ;
                       TAX                                  ;0A8BF7|AA      |      ;
 
         emptySpawn01: RTS                                  ;0A8BF8|60      |      ;
 
 
CrowAndEyeSpawnPointer_10: dw crowSpawn00                       ;0A8BF9|        |0A8BFF; floating eye 14
                       dw emptySpawn01                      ;0A8BFB|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8BFD|        |0A8C57;
 
          crowSpawn00: JSR.W CODE_0A8DE7                    ;0A8BFF|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A8C02|BDE007  |0A07E0;
                       BNE emptySpawn01                     ;0A8C05|D0F1    |0A8BF8;
                       JSR.W CODE_0A8E54                    ;0A8C07|20548E  |0A8E54;
                       BNE emptySpawn01                     ;0A8C0A|D0EC    |0A8BF8;
                       JMP.W CODE_0A8BBE                    ;0A8C0C|4CBE8B  |0A8BBE;
 
 
   spiderSpawnPointer: dw spiderSpawn00                     ;0A8C0F|        |0A8C15;
                       dw spiderSpawn01                     ;0A8C11|        |0A8C35;
                       dw spiderSpawn02                     ;0A8C13|        |0A8C4C;
 
 
        spiderSpawn00: JSR.W CODE_0A8DE7                    ;0A8C15|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A8C18|BDE007  |0A07E0;
                       BNE CODE_0A8C64                      ;0A8C1B|D047    |0A8C64;
                       JSR.W CODE_0A8E54                    ;0A8C1D|20548E  |0A8E54;
                       BNE CODE_0A8C64                      ;0A8C20|D042    |0A8C64;
                       JSR.W DATA8_0A8DFF                   ;0A8C22|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A8C25|203293  |0A9332;
                       db $20                               ;0A8C28|        |      ;
                       dw UNREACH_0FE7EC                    ;0A8C29|        |0FE7EC;
                       TXA                                  ;0A8C2B|8A      |      ;
                       LDX.B r_entityID_processed           ;0A8C2C|A66C    |00006C;
                       STA.W $07E6,X                        ;0A8C2E|9DE607  |0A07E6;
                       INC.W $07C8,X                        ;0A8C31|FEC807  |0A07C8;
                       RTS                                  ;0A8C34|60      |      ;
 
 
        spiderSpawn01: LDA.W $07E6,X                        ;0A8C35|BDE607  |0A07E6;
                       TAX                                  ;0A8C38|AA      |      ;
                       LDA.W $054E,X                        ;0A8C39|BD4E05  |0A054E;
                       BNE CODE_0A8C49                      ;0A8C3C|D00B    |0A8C49;
                       LDX.B r_entityID_processed           ;0A8C3E|A66C    |00006C;
                       INC.W $07C8,X                        ;0A8C40|FEC807  |0A07C8;
                       LDA.B #$80                           ;0A8C43|A980    |      ;
                       STA.W $07CE,X                        ;0A8C45|9DCE07  |0A07CE;
                       RTS                                  ;0A8C48|60      |      ;
 
 
          CODE_0A8C49: LDX.B r_entityID_processed           ;0A8C49|A66C    |00006C;
 
          CODE_0A8C4B: RTS                                  ;0A8C4B|60      |      ;
 
 
        spiderSpawn02: DEC.W $07CE,X                        ;0A8C4C|DECE07  |0A07CE;
                       BNE CODE_0A8C4B                      ;0A8C4F|D0FA    |0A8C4B;
                       LDA.B #$00                           ;0A8C51|A900    |      ;
                       STA.W $07C8,X                        ;0A8C53|9DC807  |0A07C8;
                       RTS                                  ;0A8C56|60      |      ;
 
 
    bonePillarSpawn01: LDA.W $07E0,X                        ;0A8C57|BDE007  |0A07E0; bonePillar, crow
                       BEQ emptySpawn01                     ;0A8C5A|F09C    |0A8BF8;
 
   axeKnightSpawner01: LDA.W $07C8,X                        ;0A8C5C|BDC807  |0A07C8;
                       AND.B #$F0                           ;0A8C5F|29F0    |      ;
                       STA.W $07C8,X                        ;0A8C61|9DC807  |0A07C8;
 
          CODE_0A8C64: RTS                                  ;0A8C64|60      |      ;
 
 
sporeGroundSpawnPointer: dw sporeGroundSpawn00                ;0A8C65|        |0A8C6B;
 
                       dw emptySpawn01                      ;0A8C67|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8C69|        |0A8C57;
 
   sporeGroundSpawn00: JSR.W CODE_0A8DE7                    ;0A8C6B|20E78D  |0A8DE7;
                       JSR.W CODE_0A8D83                    ;0A8C6E|20838D  |0A8D83;
                       BNE emptySpawn01                     ;0A8C71|D085    |0A8BF8;
                       JMP.W CODE_0A8BBE                    ;0A8C73|4CBE8B  |0A8BBE;
 
 
bonePillarSpawnPointer: dw bonePillarSpawn00                 ;0A8C76|        |0A8C7C;
 
                       dw emptySpawn01                      ;0A8C78|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8C7A|        |0A8C57;
 
    bonePillarSpawn00: JSR.W CODE_0A8DE7                    ;0A8C7C|20E78D  |0A8DE7;
                       LDA.W $07CE,X                        ;0A8C7F|BDCE07  |0A07CE;
                       STA.B $04                            ;0A8C82|8504    |000004;
                       LDA.W $07E0,X                        ;0A8C84|BDE007  |0A07E0;
                       BNE CODE_0A8C64                      ;0A8C87|D0DB    |0A8C64;
                       JSR.W CODE_0A8E54                    ;0A8C89|20548E  |0A8E54;
                       BNE CODE_0A8C64                      ;0A8C8C|D0D6    |0A8C64;
 
          CODE_0A8C8E: JSR.W CODE_0A8DDE                    ;0A8C8E|20DE8D  |0A8DDE;
                       JSR.W CODE_0A8BD5                    ;0A8C91|20D58B  |0A8BD5;
                       LDA.B $04                            ;0A8C94|A504    |000004;
                       STA.W $0633,X                        ;0A8C96|9D3306  |0A0633;
                       JMP.W CODE_0A85DE                    ;0A8C99|4CDE85  |0A85DE;
 
 
bonePiller2ShotSpawnerPointer: dw bonePiller2ShotSpawne00           ;0A8C9C|        |0A8CA2;
                       dw emptySpawn01                      ;0A8C9E|        |0A8BF8;
                       dw bonePillarSpawn01                 ;0A8CA0|        |0A8C57;
 
bonePiller2ShotSpawne00: JSR.W CODE_0A8DE7                    ;0A8CA2|20E78D  |0A8DE7;
                       LDA.W $07CE,X                        ;0A8CA5|BDCE07  |0A07CE;
                       STA.B $04                            ;0A8CA8|8504    |000004;
                       db $20                               ;0A8CAA|        |      ;
                       dw CODE_0FFEB9                       ;0A8CAB|        |0FFEB9;
                       BNE CODE_0A8CD2                      ;0A8CAD|D023    |0A8CD2;
                       JMP.W CODE_0A8C8E                    ;0A8CAF|4C8E8C  |0A8C8E;
 
 
batSleepSpawnPointer_0d: dw batSleepSpawn00                   ;0A8CB2|        |0A8CB8;
                       dw emptySpawn01                      ;0A8CB4|        |0A8BF8;
                       EOR.B [r_whipSparkTimer],Y           ;0A8CB6|578C    |00008C;
 
      batSleepSpawn00: JSR.W CODE_0A8DE7                    ;0A8CB8|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A8CBB|BDE007  |0A07E0;
                       BNE CODE_0A8CD2                      ;0A8CBE|D012    |0A8CD2;
                       JSR.W CODE_0A83A0                    ;0A8CC0|20A083  |0A83A0;
                       BNE CODE_0A8CCB                      ;0A8CC3|D006    |0A8CCB;
                       JSR.W CODE_0A8DDE                    ;0A8CC5|20DE8D  |0A8DDE;
                       JMP.W CODE_0A85DE                    ;0A8CC8|4CDE85  |0A85DE;
 
 
          CODE_0A8CCB: LDX.B r_entityID_processed           ;0A8CCB|A66C    |00006C;
                       LDA.B #$02                           ;0A8CCD|A902    |      ;
                       STA.W $07C8,X                        ;0A8CCF|9DC807  |0A07C8;
 
          CODE_0A8CD2: RTS                                  ;0A8CD2|60      |      ;
 
 
          CODE_0A8CD3: CMP.W $618C,Y                        ;0A8CD3|D98C61  |0A618C;
                       STA.W bonePillarSpawn01              ;0A8CD6|8D578C  |0A8C57;
                       LDA.W $07E0,X                        ;0A8CD9|BDE007  |0A07E0;
                       BNE CODE_0A8CD2                      ;0A8CDC|D0F4    |0A8CD2;
                       LDA.W $07E6,X                        ;0A8CDE|BDE607  |0A07E6;
                       STA.B $17                            ;0A8CE1|8517    |000017;
                       JSR.W CODE_0A8DE7                    ;0A8CE3|20E78D  |0A8DE7;
                       LDX.B #$01                           ;0A8CE6|A201    |      ;
                       db $20                               ;0A8CE8|        |      ;
                       dw CODE_0FFED7                       ;0A8CE9|        |0FFED7;
                       STA.W $0400,X                        ;0A8CEB|9D0004  |0A0400;
                       LDA.B $01                            ;0A8CEE|A501    |000001;
                       STA.W $041C,X                        ;0A8CF0|9D1C04  |0A041C;
                       SEC                                  ;0A8CF3|38      |      ;
                       LDA.B $00                            ;0A8CF4|A500    |000000;
                       STA.W $0438,X                        ;0A8CF6|9D3804  |0A0438;
                       LDA.B $03                            ;0A8CF9|A503    |000003;
                       STA.W $054E,X                        ;0A8CFB|9D4E05  |0A054E;
                       LDA.B #$2E                           ;0A8CFE|A92E    |      ;
                       STA.W $05EF,X                        ;0A8D00|9DEF05  |0A05EF;
                       db $20                               ;0A8D03|        |      ;
                       dw UNREACH_0FFEC8                    ;0A8D04|        |0FFEC8;
                       LDA.B #$60                           ;0A8D06|A960    |      ;
                       STA.W $0470,X                        ;0A8D08|9D7004  |0A0470;
                       LDA.B $17                            ;0A8D0B|A517    |000017;
                       STA.W $04A8,X                        ;0A8D0D|9DA804  |0A04A8;
                       JSR.W CODE_0A9332                    ;0A8D10|203293  |0A9332;
                       db $20                               ;0A8D13|        |      ;
                       dw UNREACH_0FE7EC                    ;0A8D14|        |0FE7EC;
                       LDX.B #$08                           ;0A8D16|A208    |      ;
                       db $20                               ;0A8D18|        |      ;
                       dw CODE_0FFED7                       ;0A8D19|        |0FFED7;
                       STA.W $0400,X                        ;0A8D1B|9D0004  |0A0400;
                       LDA.B $01                            ;0A8D1E|A501    |000001;
                       STA.W $041C,X                        ;0A8D20|9D1C04  |0A041C;
                       CLC                                  ;0A8D23|18      |      ;
                       LDA.B $00                            ;0A8D24|A500    |000000;
                       LDY.B $17                            ;0A8D26|A417    |000017;
                       ADC.W DATA8_0A8D62,Y                 ;0A8D28|79628D  |0A8D62;
                       STA.W $0438,X                        ;0A8D2B|9D3804  |0A0438;
                       LDA.B #$00                           ;0A8D2E|A900    |      ;
                       ADC.W DATA8_0A8D64,Y                 ;0A8D30|79648D  |0A8D64;
                       ORA.B #$60                           ;0A8D33|0960    |      ;
                       AND.B #$61                           ;0A8D35|2961    |      ;
                       STA.W $0470,X                        ;0A8D37|9D7004  |0A0470;
                       LDA.B $03                            ;0A8D3A|A503    |000003;
                       STA.W $054E,X                        ;0A8D3C|9D4E05  |0A054E;
                       LDA.B #$2C                           ;0A8D3F|A92C    |      ;
                       STA.W $05EF,X                        ;0A8D41|9DEF05  |0A05EF;
                       LDA.B $17                            ;0A8D44|A517    |000017;
                       STA.W $04A8,X                        ;0A8D46|9DA804  |0A04A8;
                       JSR.W CODE_0A9332                    ;0A8D49|203293  |0A9332;
                       db $20                               ;0A8D4C|        |      ;
                       dw UNREACH_0FE7EC                    ;0A8D4D|        |0FE7EC;
                       LDA.B r_entityID_processed           ;0A8D4F|A56C    |00006C;
                       STA.W $0645,X                        ;0A8D51|9D4506  |0A0645;
                       TXA                                  ;0A8D54|8A      |      ;
                       TAY                                  ;0A8D55|A8      |      ;
                       LDX.B r_entityID_processed           ;0A8D56|A66C    |00006C;
                       LDA.W $07E6,X                        ;0A8D58|BDE607  |0A07E6;
                       STA.W $0633,Y                        ;0A8D5B|993306  |0A0633;
                       JMP.W CODE_0A85DE                    ;0A8D5E|4CDE85  |0A85DE;
 
                       RTS                                  ;0A8D61|60      |      ;
 
 
         DATA8_0A8D62: db $08,$F8                           ;0A8D62|        |      ;
 
         DATA8_0A8D64: db $00,$FF                           ;0A8D64|        |      ;
 
          CODE_0A8D66: LDA.B r_sceneScrollOffsetLo          ;0A8D66|A556    |000056;
                       BNE CODE_0A8D72                      ;0A8D68|D008    |0A8D72;
                       LDA.W $07E0,X                        ;0A8D6A|BDE007  |0A07E0;
                       BNE CODE_0A8D72                      ;0A8D6D|D003    |0A8D72;
                       db $4C                               ;0A8D6F|        |      ;
 
                       dw CODE_0FFEB9                       ;0A8D70|        |0FFEB9;
 
          CODE_0A8D72: RTS                                  ;0A8D72|60      |      ;
 
 
          CODE_0A8D73: LDA.W $07E0,X                        ;0A8D73|BDE007  |0A07E0;
                       BNE CODE_0A8D72                      ;0A8D76|D0FA    |0A8D72;
                       JMP.W CODE_0A8383                    ;0A8D78|4C8383  |0A8383;
 
 
          CODE_0A8D7B: LDA.W $07E0,X                        ;0A8D7B|BDE007  |0A07E0;
                       BNE CODE_0A8D72                      ;0A8D7E|D0F2    |0A8D72;
                       JMP.W CODE_0A83A0                    ;0A8D80|4CA083  |0A83A0;
 
 
          CODE_0A8D83: LDA.W $07E0,X                        ;0A8D83|BDE007  |0A07E0;
                       BNE CODE_0A8D72                      ;0A8D86|D0EA    |0A8D72;
                       JMP.W CODE_0A8392                    ;0A8D88|4C9283  |0A8392;
 
 
          CODE_0A8D8B: LDA.W $07E0,X                        ;0A8D8B|BDE007  |0A07E0;
                       BNE CODE_0A8D72                      ;0A8D8E|D0E2    |0A8D72;
                       db $4C                               ;0A8D90|        |      ;
 
                       dw CODE_0FFEB9                       ;0A8D91|        |0FFEB9;
 
          CODE_0A8D93: STA.W DATA8_0FC48D,Y                 ;0A8D93|998DC4  |0FC48D;
                       STA.W bonePillarSpawn01              ;0A8D96|8D578C  |0A8C57;
                       LDA.W $07E0,X                        ;0A8D99|BDE007  |0A07E0;
                       BNE CODE_0A8DC4                      ;0A8D9C|D026    |0A8DC4;
                       JSR.W CODE_0A8DE7                    ;0A8D9E|20E78D  |0A8DE7;
                       db $20                               ;0A8DA1|        |      ;
                       dw CODE_0FFEB9                       ;0A8DA2|        |0FFEB9;
                       LDA.B #$08                           ;0A8DA4|A908    |      ;
                       STA.W $0657,X                        ;0A8DA6|9D5706  |0A0657;
 
          CODE_0A8DA9: JSR.W DATA8_0A8DFF                   ;0A8DA9|20FF8D  |0A8DFF;
                       LDA.B #$08                           ;0A8DAC|A908    |      ;
                       STA.W $0400,X                        ;0A8DAE|9D0004  |0A0400;
                       LDA.B #$00                           ;0A8DB1|A900    |      ;
                       STA.W $048C,X                        ;0A8DB3|9D8C04  |0A048C;
                       LDA.W $0470,X                        ;0A8DB6|BD7004  |0A0470;
                       ORA.B #$A8                           ;0A8DB9|09A8    |      ;
                       STA.W $0470,X                        ;0A8DBB|9D7004  |0A0470;
                       JSR.W CODE_0A8BD5                    ;0A8DBE|20D58B  |0A8BD5;
                       JMP.W CODE_0A85DE                    ;0A8DC1|4CDE85  |0A85DE;
 
 
          CODE_0A8DC4: RTS                                  ;0A8DC4|60      |      ;
 
 
         PTR16_0A8DC5: dw CODE_0A8DCB                       ;0A8DC5|        |0A8DCB;
                       dw CODE_0A8DC4                       ;0A8DC7|        |0A8DC4;
                       dw bonePillarSpawn01                 ;0A8DC9|        |0A8C57;
 
          CODE_0A8DCB: LDA.W $07E0,X                        ;0A8DCB|BDE007  |0A07E0;
                       BNE CODE_0A8DC4                      ;0A8DCE|D0F4    |0A8DC4;
                       JSR.W CODE_0A8DE7                    ;0A8DD0|20E78D  |0A8DE7;
                       db $20                               ;0A8DD3|        |      ;
                       dw CODE_0FFEB9                       ;0A8DD4|        |0FFEB9;
                       LDA.B #$0E                           ;0A8DD6|A90E    |      ;
                       STA.W $0657,X                        ;0A8DD8|9D5706  |0A0657;
                       JMP.W CODE_0A8DA9                    ;0A8DDB|4CA98D  |0A8DA9;
 
 
          CODE_0A8DDE: JSR.W DATA8_0A8DFF                   ;0A8DDE|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A8DE1|203293  |0A9332;
                       db $4C                               ;0A8DE4|        |      ;
 
                       dw UNREACH_0FE7EC                    ;0A8DE5|        |0FE7EC;
 
          CODE_0A8DE7: LDA.W $07DA,X                        ;0A8DE7|BDDA07  |0A07DA;
                       STA.B $00                            ;0A8DEA|8500    |000000;
                       LDA.W $07D4,X                        ;0A8DEC|BDD407  |0A07D4;
                       STA.B $01                            ;0A8DEF|8501    |000001;
                       LDY.W $07C2,X                        ;0A8DF1|BCC207  |0A07C2;
                       LDA.W spawnerEntityAI_Idxes,Y        ;0A8DF4|B98292  |0A9282;
                       STA.B $02                            ;0A8DF7|8502    |000002;
                       LDA.W spawnerEntityObject_Idxes,Y    ;0A8DF9|B9DA92  |0A92DA;
                       STA.B $03                            ;0A8DFC|8503    |000003;
                       RTS                                  ;0A8DFE|60      |      ;
 
 
         DATA8_0A8DFF: db $20                               ;0A8DFF|        |      ;
                       dw CODE_0FFED7                       ;0A8E00|        |0FFED7;
                       STA.W $0400,X                        ;0A8E02|9D0004  |0A0400;
                       LDA.B $00                            ;0A8E05|A500    |000000;
                       STA.W $0438,X                        ;0A8E07|9D3804  |0A0438;
                       LDA.B $01                            ;0A8E0A|A501    |000001;
                       STA.W $041C,X                        ;0A8E0C|9D1C04  |0A041C;
                       LDA.B $02                            ;0A8E0F|A502    |000002;
                       STA.W $05EF,X                        ;0A8E11|9DEF05  |0A05EF;
                       LDA.B $03                            ;0A8E14|A503    |000003;
                       STA.W $054E,X                        ;0A8E16|9D4E05  |0A054E;
                       RTS                                  ;0A8E19|60      |      ;
 
 
          CODE_0A8E1A: SEC                                  ;0A8E1A|38      |      ;
                       LDA.W $07DA,X                        ;0A8E1B|BDDA07  |0A07DA;
                       SBC.W $0438                          ;0A8E1E|ED3804  |0A0438;
                       BCS CODE_0A8E27                      ;0A8E21|B004    |0A8E27;
                       EOR.B #$FF                           ;0A8E23|49FF    |      ;
                       ADC.B #$01                           ;0A8E25|6901    |      ;
 
          CODE_0A8E27: RTS                                  ;0A8E27|60      |      ;
 
 
          CODE_0A8E28: LDY.W $07F6                          ;0A8E28|ACF607  |0A07F6;
                       BEQ CODE_0A8E46                      ;0A8E2B|F019    |0A8E46;
                       LDA.B r_stage                        ;0A8E2D|A532    |000032;
                       CMP.B #$04                           ;0A8E2F|C904    |      ;
                       BEQ CODE_0A8E3F                      ;0A8E31|F00C    |0A8E3F;
                       CMP.B #$0D                           ;0A8E33|C90D    |      ;
                       BNE CODE_0A8E4C                      ;0A8E35|D015    |0A8E4C;
                       LDA.B r_blockLevel                   ;0A8E37|A533    |000033;
                       CMP.B #$01                           ;0A8E39|C901    |      ;
                       BNE CODE_0A8E4C                      ;0A8E3B|D00F    |0A8E4C;
                       BEQ CODE_0A8E46                      ;0A8E3D|F007    |0A8E46;
 
          CODE_0A8E3F: LDA.W $07C2,X                        ;0A8E3F|BDC207  |0A07C2;
                       CMP.B #$0C                           ;0A8E42|C90C    |      ;
                       BNE CODE_0A8E4C                      ;0A8E44|D006    |0A8E4C;
 
          CODE_0A8E46: LDA.B r_gameStateLoopCounter         ;0A8E46|A51A    |00001A;
                       AND.B #$01                           ;0A8E48|2901    |      ;
                       BNE CODE_0A8E4F                      ;0A8E4A|D003    |0A8E4F;
 
          CODE_0A8E4C: DEC.W $07CE,X                        ;0A8E4C|DECE07  |0A07CE;
 
          CODE_0A8E4F: RTS                                  ;0A8E4F|60      |      ;
 
 
          CODE_0A8E50: LDA.B #$02                           ;0A8E50|A902    |      ;
                       BNE CODE_0A8E56                      ;0A8E52|D002    |0A8E56;
 
          CODE_0A8E54: LDA.B #$03                           ;0A8E54|A903    |      ;
 
          CODE_0A8E56: STA.B r_tempCurrSection              ;0A8E56|850D    |00000D;
                       LDA.B #$00                           ;0A8E58|A900    |      ;
                       STA.B r_tempCurrRoomIdx              ;0A8E5A|850E    |00000E;
                       LDA.B #$01                           ;0A8E5C|A901    |      ;
                       STA.B r_tempCurrGroup                ;0A8E5E|850C    |00000C;
                       LDA.B #$09                           ;0A8E60|A909    |      ;
                       STA.B $0B                            ;0A8E62|850B    |00000B;
 
          CODE_0A8E64: LDX.B r_tempCurrGroup                ;0A8E64|A60C    |00000C;
 
          CODE_0A8E66: LDA.W $054E,X                        ;0A8E66|BD4E05  |0A054E;
                       CMP.B $03                            ;0A8E69|C503    |000003;
                       BNE CODE_0A8E6F                      ;0A8E6B|D002    |0A8E6F;
                       INC.B r_tempCurrRoomIdx              ;0A8E6D|E60E    |00000E;
 
          CODE_0A8E6F: INX                                  ;0A8E6F|E8      |      ;
                       CPX.B $0B                            ;0A8E70|E40B    |00000B;
                       BCC CODE_0A8E66                      ;0A8E72|90F2    |0A8E66;
                       LDA.B r_tempCurrRoomIdx              ;0A8E74|A50E    |00000E;
                       CMP.B r_tempCurrSection              ;0A8E76|C50D    |00000D;
                       BCS CODE_0A8E86                      ;0A8E78|B00C    |0A8E86;
                       LDA.B $0B                            ;0A8E7A|A50B    |00000B;
                       CMP.B #$13                           ;0A8E7C|C913    |      ;
                       BEQ CODE_0A8E83                      ;0A8E7E|F003    |0A8E83;
                       db $4C                               ;0A8E80|        |      ;
 
                       dw CODE_0FFEB9                       ;0A8E81|        |0FFEB9;
 
          CODE_0A8E83: JMP.W CODE_0A834D                    ;0A8E83|4C4D83  |0A834D;
 
 
          CODE_0A8E86: LDA.B #$01                           ;0A8E86|A901    |      ;
                       RTS                                  ;0A8E88|60      |      ;
 
 
          CODE_0A8E89: LDA.B #$0D                           ;0A8E89|A90D    |      ;
                       STA.B r_tempCurrGroup                ;0A8E8B|850C    |00000C;
                       LDA.B #$13                           ;0A8E8D|A913    |      ;
                       STA.B $0B                            ;0A8E8F|850B    |00000B;
                       LDA.B #$02                           ;0A8E91|A902    |      ;
                       STA.B r_tempCurrSection              ;0A8E93|850D    |00000D;
                       LDA.B #$00                           ;0A8E95|A900    |      ;
                       STA.B r_tempCurrRoomIdx              ;0A8E97|850E    |00000E;
                       JMP.W CODE_0A8E64                    ;0A8E99|4C648E  |0A8E64;
 
 
          CODE_0A8E9C: LDY.W $07C2,X                        ;0A8E9C|BCC207  |0A07C2;
                       LDA.W spawnerEntityObject_Idxes,Y    ;0A8E9F|B9DA92  |0A92DA;
                       STA.B r_temp_Xpos                    ;0A8EA2|850A    |00000A;
                       LDX.B #$01                           ;0A8EA4|A201    |      ;
 
          CODE_0A8EA6: LDA.W $054E,X                        ;0A8EA6|BD4E05  |0A054E;
                       CMP.B r_temp_Xpos                    ;0A8EA9|C50A    |00000A;
                       BNE CODE_0A8EB4                      ;0A8EAB|D007    |0A8EB4;
                       LDA.B r_entityID_processed           ;0A8EAD|A56C    |00006C;
                       CMP.W $0645,X                        ;0A8EAF|DD4506  |0A0645;
                       BEQ CODE_0A8EBE                      ;0A8EB2|F00A    |0A8EBE;
 
          CODE_0A8EB4: INX                                  ;0A8EB4|E8      |      ;
                       CPX.B #$0D                           ;0A8EB5|E00D    |      ;
                       BCC CODE_0A8EA6                      ;0A8EB7|90ED    |0A8EA6;
                       LDX.B r_entityID_processed           ;0A8EB9|A66C    |00006C;
                       LDA.B #$00                           ;0A8EBB|A900    |      ;
                       RTS                                  ;0A8EBD|60      |      ;
 
 
          CODE_0A8EBE: LDX.B r_entityID_processed           ;0A8EBE|A66C    |00006C;
                       LDA.B #$01                           ;0A8EC0|A901    |      ;
 
          CODE_0A8EC2: RTS                                  ;0A8EC2|60      |      ;
 
 
          CODE_0A8EC3: LDX.B #$0B                           ;0A8EC3|A20B    |      ;
 
          CODE_0A8EC5: LDA.W $054E,X                        ;0A8EC5|BD4E05  |0A054E;
                       BEQ CODE_0A8EC2                      ;0A8EC8|F0F8    |0A8EC2;
                       INX                                  ;0A8ECA|E8      |      ;
                       CPX.B #$0D                           ;0A8ECB|E00D    |      ;
                       BCC CODE_0A8EC5                      ;0A8ECD|90F6    |0A8EC5;
                       BCS CODE_0A8EBE                      ;0A8ECF|B0ED    |0A8EBE;
 
     bossSpawnPointer: dw bossSpawn00                       ;0A8ED1|        |0A8ED7;
                       dw bossSpawn01                       ;0A8ED3|        |0A8EEB;
                       dw emptySpawnClose                   ;0A8ED5|        |0A8F15;
 
          bossSpawn00: JSR.W CODE_0A8F45                    ;0A8ED7|20458F  |0A8F45;
                       BCC CODE_0A8EDD                      ;0A8EDA|9001    |0A8EDD;
                       RTS                                  ;0A8EDC|60      |      ;
 
 
          CODE_0A8EDD: LDA.W $07E0,X                        ;0A8EDD|BDE007  |0A07E0;
                       BNE emptySpawnClose                  ;0A8EE0|D033    |0A8F15;
                       JSR.W CODE_0A9274                    ;0A8EE2|207492  |0A9274;
                       JSR.W CODE_0A83BC                    ;0A8EE5|20BC83  |0A83BC;
                       JMP.W CODE_0A8F0E                    ;0A8EE8|4C0E8F  |0A8F0E;
 
 
          bossSpawn01: JSR.W CODE_0A8F45                    ;0A8EEB|20458F  |0A8F45;
                       BCC CODE_0A8EF1                      ;0A8EEE|9001    |0A8EF1;
                       RTS                                  ;0A8EF0|60      |      ;
 
 
          CODE_0A8EF1: JSR.W CODE_0A8DE7                    ;0A8EF1|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A8EF4|BDE007  |0A07E0;
                       BNE emptySpawnClose                  ;0A8EF7|D01C    |0A8F15;
                       LDA.B #$80                           ;0A8EF9|A980    |      ;
                       STA.W $07F3                          ;0A8EFB|8DF307  |0A07F3;
                       LDX.B #$01                           ;0A8EFE|A201    |      ;
                       JSR.W DATA8_0A8DFF                   ;0A8F00|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A8F03|203293  |0A9332;
                       STA.B r_HUD_healthBoss               ;0A8F06|853D    |00003D;
                       JSR.W lightningSpawn01               ;0A8F08|20168F  |0A8F16;
                       JSR.W DATA8_0A8F73                   ;0A8F0B|20738F  |0A8F73;
 
          CODE_0A8F0E: LDX.B r_entityID_processed           ;0A8F0E|A66C    |00006C;
                       INC.W $07C8,X                        ;0A8F10|FEC807  |0A07C8;
                       STX.B r_bossSpawner                  ;0A8F13|86C3    |0000C3;
 
      emptySpawnClose: RTS                                  ;0A8F15|60      |      ;
 
 
     lightningSpawn01: JSR.W CODE_0A8F32                    ;0A8F16|20328F  |0A8F32;
                       BCC emptySpawnClose                  ;0A8F19|90FA    |0A8F15;
 
          CODE_0A8F1B: DEY                                  ;0A8F1B|88      |      ;
                       LDA.W DATA8_0A8F55,Y                 ;0A8F1C|B9558F  |0A8F55;
                       STA.B r_CHR_BankSpr_0800             ;0A8F1F|8548    |000048;
                       LDA.W DATA8_0A8F64,Y                 ;0A8F21|B9648F  |0A8F64;
                       STA.B r_CHR_BankSpr_0c00             ;0A8F24|8549    |000049;
                       db $4C                               ;0A8F26|        |      ;
 
                       dw CODE_0FE33C                       ;0A8F27|        |0FE33C;
                       LDY.W $054E,X                        ;0A8F29|BC4E05  |0A054E;
                       JSR.W CODE_0A8F1B                    ;0A8F2C|201B8F  |0A8F1B;
                       JMP.W CODE_0A8F78                    ;0A8F2F|4C788F  |0A8F78;
 
 
          CODE_0A8F32: LDY.W $054E,X                        ;0A8F32|BC4E05  |0A054E;
                       CPY.B #$0B                           ;0A8F35|C00B    |      ;
                       BEQ CODE_0A8F43                      ;0A8F37|F00A    |0A8F43;
                       CPY.B #$08                           ;0A8F39|C008    |      ;
                       BCS CODE_0A8F41                      ;0A8F3B|B004    |0A8F41;
                       CPY.B #$05                           ;0A8F3D|C005    |      ;
                       BCS CODE_0A8F43                      ;0A8F3F|B002    |0A8F43;
 
          CODE_0A8F41: SEC                                  ;0A8F41|38      |      ;
                       RTS                                  ;0A8F42|60      |      ;
 
 
          CODE_0A8F43: CLC                                  ;0A8F43|18      |      ;
                       RTS                                  ;0A8F44|60      |      ;
 
 
          CODE_0A8F45: LDA.B r_stage                        ;0A8F45|A532    |000032;
                       CMP.B #$01                           ;0A8F47|C901    |      ;
                       BNE CODE_0A8F53                      ;0A8F49|D008    |0A8F53;
                       LDA.B r_blockLevel                   ;0A8F4B|A533    |000033;
                       CMP.B #$03                           ;0A8F4D|C903    |      ;
                       BNE CODE_0A8F53                      ;0A8F4F|D002    |0A8F53;
                       SEC                                  ;0A8F51|38      |      ;
                       RTS                                  ;0A8F52|60      |      ;
 
 
          CODE_0A8F53: CLC                                  ;0A8F53|18      |      ;
                       RTS                                  ;0A8F54|60      |      ;
 
 
         DATA8_0A8F55: db $18,$1C,$1A,$28,$1E               ;0A8F55|        |      ;
                       db $20,$22,$20,$26,$24               ;0A8F5A|        |      ;
                       db $1C,$2C,$30,$1A,$1C               ;0A8F5F|        |      ;
 
         DATA8_0A8F64: db $19,$7B,$1B,$1D,$1F               ;0A8F64|        |      ;
                       db $21,$23,$21,$29,$25               ;0A8F69|        |      ;
                       db $2F,$2D,$31,$1B,$1D               ;0A8F6E|        |      ;
 
         DATA8_0A8F73: db $20,$32,$8F,$90,$2F               ;0A8F73|        |      ;
 
          CODE_0A8F78: LDA.W $054E,X                        ;0A8F78|BD4E05  |0A054E;
                       STA.B r_bossObject                   ;0A8F7B|85C1    |0000C1;
 
          CODE_0A8F7D: STX.B r_roomSectionChrBanksDataOffset;0A8F7D|860F    |00000F;
                       db $20                               ;0A8F7F|        |      ;
                       dw UNREACH_0FE730                    ;0A8F80|        |0FE730;
                       LDX.B r_roomSectionChrBanksDataOffset;0A8F82|A60F    |00000F;
                       LDA.B r_bossObject                   ;0A8F84|A5C1    |0000C1;
                       BEQ CODE_0A8FA0                      ;0A8F86|F018    |0A8FA0;
                       ASL A                                ;0A8F88|0A      |      ;
                       ASL A                                ;0A8F89|0A      |      ;
                       TAY                                  ;0A8F8A|A8      |      ;
                       LDA.B r_sceneDrawQueue               ;0A8F8B|A51D    |00001D;
                       SEC                                  ;0A8F8D|38      |      ;
                       SBC.B #$11                           ;0A8F8E|E911    |      ;
                       TAX                                  ;0A8F90|AA      |      ;
                       LDA.B #$04                           ;0A8F91|A904    |      ;
                       STA.B r_tempCurrRoomIdx              ;0A8F93|850E    |00000E;
 
          CODE_0A8F95: LDA.W DATA8_0A8FA8,Y                 ;0A8F95|B9A88F  |0A8FA8;
                       JSR.W CODE_0A8FA3                    ;0A8F98|20A38F  |0A8FA3;
                       INY                                  ;0A8F9B|C8      |      ;
                       DEC.B r_tempCurrRoomIdx              ;0A8F9C|C60E    |00000E;
                       BNE CODE_0A8F95                      ;0A8F9E|D0F5    |0A8F95;
 
          CODE_0A8FA0: LDX.B r_roomSectionChrBanksDataOffset;0A8FA0|A60F    |00000F;
                       RTS                                  ;0A8FA2|60      |      ;
 
 
          CODE_0A8FA3: STA.W $0300,X                        ;0A8FA3|9D0003  |0A0300;
                       INX                                  ;0A8FA6|E8      |      ;
                       RTS                                  ;0A8FA7|60      |      ;
 
 
         DATA8_0A8FA8: db $0F,$00,$00,$00,$0F               ;0A8FA8|        |      ;
                       db $0F,$12,$39,$0F,$28               ;0A8FAD|        |      ;
                       db $0F,$1B,$0F,$0F,$18               ;0A8FB2|        |      ;
                       db $38,$0F,$0F,$00,$13               ;0A8FB7|        |      ;
 
                       db $0F,$0F,$1B,$27,$0F               ;0A8FBC|        |      ;
                       db $0F,$00,$32,$0F,$0F               ;0A8FC1|        |      ;
                       db $2C,$32,$0F,$16,$28               ;0A8FC6|        |      ;
                       db $38,$0F,$0F,$16,$37               ;0A8FCB|        |      ;
                       db $0F,$0F,$10,$20,$0F               ;0A8FD0|        |      ;
                       db $04,$13,$34,$0F,$0F               ;0A8FD5|        |      ;
                       db $08,$34,$0F,$0F,$14               ;0A8FDA|        |      ;
                       db $27,$0F,$00,$10,$38               ;0A8FDF|        |      ;
                       db $00,$00,$00,$00,$00               ;0A8FE4|        |      ;
                       db $00,$00,$00,$0F,$0F               ;0A8FE9|        |      ;
                       db $04,$33,$0F,$0F,$16               ;0A8FEE|        |      ;
                       db $17,$0F,$0F,$16,$27               ;0A8FF3|        |      ;
                       db $0F,$0F,$16,$37                   ;0A8FF8|        |      ;
 
bossBoneDragonKingSpawnPointer: dw bossAlucardSpawner00              ;0A8FFC|        |0A9002;
                       dw bossBoneDragonKing01              ;0A8FFE|        |0A901C;
                       dw emptySpawner03                    ;0A9000|        |0A909F;
 
 bossAlucardSpawner00: LDA.W $07E0,X                        ;0A9002|BDE007  |0A07E0;
                       BEQ CODE_0A9008                      ;0A9005|F001    |0A9008;
                       RTS                                  ;0A9007|60      |      ;
 
 
          CODE_0A9008: JSR.W CODE_0A9274                    ;0A9008|207492  |0A9274;
                       LDX.B #$01                           ;0A900B|A201    |      ;
                       LDA.B #$0C                           ;0A900D|A90C    |      ;
                       STA.B $00                            ;0A900F|8500    |000000;
 
          CODE_0A9011: JSR.W CODE_0A83BC                    ;0A9011|20BC83  |0A83BC;
                       INX                                  ;0A9014|E8      |      ;
                       DEC.B $00                            ;0A9015|C600    |000000;
                       BNE CODE_0A9011                      ;0A9017|D0F8    |0A9011;
                       JMP.W CODE_0A8F0E                    ;0A9019|4C0E8F  |0A8F0E;
 
 
 bossBoneDragonKing01: JSR.W CODE_0A8DE7                    ;0A901C|20E78D  |0A8DE7;
                       LDA.B r_bossDragonKingHP             ;0A901F|A5BD    |0000BD;
                       STA.B r_coreLoadingFuncAddr          ;0A9021|8516    |000016;
                       LDA.B #$0C                           ;0A9023|A90C    |      ;
                       STA.B r_15                           ;0A9025|8515    |000015;
                       LDA.B r_blockLevel                   ;0A9027|A533    |000033;
                       CMP.B #$02                           ;0A9029|C902    |      ;
                       BEQ CODE_0A9035                      ;0A902B|F008    |0A9035;
                       LDA.B r_bossDragonMisc               ;0A902D|A5BE    |0000BE;
                       BNE CODE_0A9033                      ;0A902F|D002    |0A9033;
                       LDA.B #$01                           ;0A9031|A901    |      ;
 
          CODE_0A9033: STA.B r_15                           ;0A9033|8515    |000015;
 
          CODE_0A9035: LDX.B #$01                           ;0A9035|A201    |      ;
                       LDA.B #$80                           ;0A9037|A980    |      ;
                       STA.W $07F3                          ;0A9039|8DF307  |0A07F3;
                       LDA.B #$00                           ;0A903C|A900    |      ;
                       STA.B $17                            ;0A903E|8517    |000017;
 
          CODE_0A9040: JSR.W DATA8_0A8DFF                   ;0A9040|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A9043|203293  |0A9332;
                       STA.B r_HUD_healthBoss               ;0A9046|853D    |00003D;
                       LDA.B #$2D                           ;0A9048|A92D    |      ;
                       STA.B $03                            ;0A904A|8503    |000003;
                       LDA.B #$80                           ;0A904C|A980    |      ;
                       STA.B $02                            ;0A904E|8502    |000002;
                       LDA.B r_blockLevel                   ;0A9050|A533    |000033;
                       CMP.B #$02                           ;0A9052|C902    |      ;
                       BEQ CODE_0A905D                      ;0A9054|F007    |0A905D;
                       LDA.B r_coreLoadingFuncAddr          ;0A9056|A516    |000016;
                       STA.W $067B,X                        ;0A9058|9D7B06  |0A067B;
                       STA.B r_HUD_healthBoss               ;0A905B|853D    |00003D;
 
          CODE_0A905D: STX.B r_currOAM_Attr                 ;0A905D|8610    |000010;
                       LDA.B $17                            ;0A905F|A517    |000017;
                       LSR A                                ;0A9061|4A      |      ;
                       TAY                                  ;0A9062|A8      |      ;
                       LDA.B $17                            ;0A9063|A517    |000017;
                       STA.W $0606,X                        ;0A9065|9D0606  |0A0606;
                       AND.B #$01                           ;0A9068|2901    |      ;
                       BEQ DATA8_0A9077                     ;0A906A|F00B    |0A9077;
                       LDA.B r_currOAM_Attr                 ;0A906C|A510    |000010;
                       ORA.W $07EC,Y                        ;0A906E|19EC07  |0A07EC;
                       STA.W $07EC,Y                        ;0A9071|99EC07  |0A07EC;
                       JMP.W CODE_0A9080                    ;0A9074|4C8090  |0A9080;
 
 
         DATA8_0A9077: db $A5,$10,$0A,$0A,$0A               ;0A9077|        |      ;
                       db $0A,$99,$EC,$07                   ;0A907C|        |      ;
 
          CODE_0A9080: LDA.B $17                            ;0A9080|A517    |000017;
                       BNE CODE_0A9087                      ;0A9082|D003    |0A9087;
                       JSR.W lightningSpawn01               ;0A9084|20168F  |0A8F16;
 
          CODE_0A9087: INC.B $17                            ;0A9087|E617    |000017;
                       INX                                  ;0A9089|E8      |      ;
                       LDA.B $17                            ;0A908A|A517    |000017;
                       CMP.B r_15                           ;0A908C|C515    |000015;
                       BNE CODE_0A9040                      ;0A908E|D0B0    |0A9040;
                       LDX.B #$01                           ;0A9090|A201    |      ;
                       LDA.B r_15                           ;0A9092|A515    |000015;
                       STA.W $061D,X                        ;0A9094|9D1D06  |0A061D;
                       JSR.W DATA8_0A8F73                   ;0A9097|20738F  |0A8F73;
                       LDX.B r_entityID_processed           ;0A909A|A66C    |00006C;
                       INC.W $07C8,X                        ;0A909C|FEC807  |0A07C8;
 
       emptySpawner03: RTS                                  ;0A909F|60      |      ;
 
 
bossWaterDragonSpawnPointer: dw bossAlucardSpawner00              ;0A90A0|        |0A9002;
                       dw bossWaterDragonSpawn01            ;0A90A2|        |0A90A6;
                       dw CODE_0A90DC                       ;0A90A4|        |0A90DC;
 
 
bossWaterDragonSpawn01: JSR.W CODE_0A8DE7                    ;0A90A6|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A90A9|BDE007  |0A07E0;
                       BNE CODE_0A90DC                      ;0A90AC|D02E    |0A90DC;
                       LDA.B #$80                           ;0A90AE|A980    |      ;
                       STA.W $07F3                          ;0A90B0|8DF307  |0A07F3;
                       LDX.B #$01                           ;0A90B3|A201    |      ;
                       LDA.B #$02                           ;0A90B5|A902    |      ;
                       STA.B r_coreLoadingFuncAddr          ;0A90B7|8516    |000016;
 
          CODE_0A90B9: JSR.W DATA8_0A8DFF                   ;0A90B9|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A90BC|203293  |0A9332;
                       LDA.B #$40                           ;0A90BF|A940    |      ;
                       STA.B r_HUD_healthBoss               ;0A90C1|853D    |00003D;
                       LDA.B r_coreLoadingFuncAddr          ;0A90C3|A516    |000016;
                       STA.W $0645,X                        ;0A90C5|9D4506  |0A0645;
                       DEC.W $0645,X                        ;0A90C8|DE4506  |0A0645;
                       INX                                  ;0A90CB|E8      |      ;
                       DEC.B r_coreLoadingFuncAddr          ;0A90CC|C616    |000016;
                       BNE CODE_0A90B9                      ;0A90CE|D0E9    |0A90B9;
                       DEX                                  ;0A90D0|CA      |      ;
                       JSR.W lightningSpawn01               ;0A90D1|20168F  |0A8F16;
                       JSR.W DATA8_0A8F73                   ;0A90D4|20738F  |0A8F73;
                       LDX.B r_entityID_processed           ;0A90D7|A66C    |00006C;
                       INC.W $07C8,X                        ;0A90D9|FEC807  |0A07C8;
 
          CODE_0A90DC: RTS                                  ;0A90DC|60      |      ;
 
 
bossMedusaSpawnPointer: dw bossAlucardSpawner00              ;0A90DD|        |0A9002;
                       dw bossMedusaSpawn01                 ;0A90DF|        |0A90E3;
                       dw emptySpawner04                    ;0A90E1|        |0A9141;
 
    bossMedusaSpawn01: JSR.W CODE_0A8DE7                    ;0A90E3|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A90E6|BDE007  |0A07E0;
                       BNE emptySpawner04                   ;0A90E9|D056    |0A9141;
                       LDA.B #$80                           ;0A90EB|A980    |      ;
                       STA.W $07F3                          ;0A90ED|8DF307  |0A07F3;
                       LDX.B #$01                           ;0A90F0|A201    |      ;
                       LDA.B #$00                           ;0A90F2|A900    |      ;
                       STA.B r_coreLoadingFuncAddr          ;0A90F4|8516    |000016;
 
          CODE_0A90F6: JSR.W DATA8_0A8DFF                   ;0A90F6|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A90F9|203293  |0A9332;
                       STA.B r_HUD_healthBoss               ;0A90FC|853D    |00003D;
                       LDA.B r_coreLoadingFuncAddr          ;0A90FE|A516    |000016;
                       STA.W $0606,X                        ;0A9100|9D0606  |0A0606;
                       TAY                                  ;0A9103|A8      |      ;
                       LDA.B #$00                           ;0A9104|A900    |      ;
                       STA.B $17                            ;0A9106|8517    |000017;
                       LDA.W DATA8_0A9142,Y                 ;0A9108|B94291  |0A9142;
                       BPL CODE_0A9111                      ;0A910B|1004    |0A9111;
                       LDA.B #$FF                           ;0A910D|A9FF    |      ;
                       STA.B $17                            ;0A910F|8517    |000017;
 
          CODE_0A9111: LDA.W DATA8_0A9142,Y                 ;0A9111|B94291  |0A9142;
                       CLC                                  ;0A9114|18      |      ;
                       ADC.W $0438,X                        ;0A9115|7D3804  |0A0438;
                       STA.W $0438,X                        ;0A9118|9D3804  |0A0438;
                       LDA.B $17                            ;0A911B|A517    |000017;
                       ADC.B #$00                           ;0A911D|6900    |      ;
                       AND.B #$01                           ;0A911F|2901    |      ;
                       BEQ CODE_0A9127                      ;0A9121|F004    |0A9127;
                       ORA.B #$88                           ;0A9123|0988    |      ;
                       BNE CODE_0A9129                      ;0A9125|D002    |0A9129;
 
          CODE_0A9127: ORA.B #$40                           ;0A9127|0940    |      ;
 
          CODE_0A9129: STA.W $0470,X                        ;0A9129|9D7004  |0A0470;
                       INX                                  ;0A912C|E8      |      ;
                       INC.B r_coreLoadingFuncAddr          ;0A912D|E616    |000016;
                       LDA.B r_coreLoadingFuncAddr          ;0A912F|A516    |000016;
                       CMP.B #$04                           ;0A9131|C904    |      ;
                       BNE CODE_0A90F6                      ;0A9133|D0C1    |0A90F6;
                       DEX                                  ;0A9135|CA      |      ;
                       JSR.W lightningSpawn01               ;0A9136|20168F  |0A8F16;
                       JSR.W DATA8_0A8F73                   ;0A9139|20738F  |0A8F73;
                       LDX.B r_entityID_processed           ;0A913C|A66C    |00006C;
                       INC.W $07C8,X                        ;0A913E|FEC807  |0A07C8;
 
       emptySpawner04: RTS                                  ;0A9141|60      |      ;
 
 
         DATA8_0A9142: db $00,$18,$E8,$20,$E0               ;0A9142|        |      ;
                       db $2C,$D6,$09                       ;0A9147|        |      ;
 
bossAlucardSpawnerPointer: dw bossAlucardSpawner00              ;0A914A|        |0A9002;
                       dw bossAlucardSpawner01              ;0A914C|        |0A9150;
                       dw CODE_0A91A2                       ;0A914E|        |0A91A2;
 
 bossAlucardSpawner01: JSR.W CODE_0A8DE7                    ;0A9150|20E78D  |0A8DE7;
                       LDA.W $07E0,X                        ;0A9153|BDE007  |0A07E0;
                       BNE CODE_0A91A2                      ;0A9156|D04A    |0A91A2;
                       LDA.B #$80                           ;0A9158|A980    |      ;
                       STA.W $07F3                          ;0A915A|8DF307  |0A07F3;
                       LDX.B #$01                           ;0A915D|A201    |      ;
                       LDA.B #$00                           ;0A915F|A900    |      ;
                       STA.B r_coreLoadingFuncAddr          ;0A9161|8516    |000016;
 
          CODE_0A9163: JSR.W DATA8_0A8DFF                   ;0A9163|20FF8D  |0A8DFF;
                       JSR.W CODE_0A9332                    ;0A9166|203293  |0A9332;
                       LDA.B #$40                           ;0A9169|A940    |      ;
                       STA.B r_HUD_healthBoss               ;0A916B|853D    |00003D;
                       LDA.B r_coreLoadingFuncAddr          ;0A916D|A516    |000016;
                       BEQ CODE_0A9173                      ;0A916F|F002    |0A9173;
                       LDA.B #$02                           ;0A9171|A902    |      ;
 
          CODE_0A9173: STA.W $0606,X                        ;0A9173|9D0606  |0A0606;
                       ASL A                                ;0A9176|0A      |      ;
                       ASL A                                ;0A9177|0A      |      ;
                       ASL A                                ;0A9178|0A      |      ;
                       STA.W $05D8,X                        ;0A9179|9DD805  |0A05D8;
                       LDA.B #$80                           ;0A917C|A980    |      ;
                       STA.W $05EF,X                        ;0A917E|9DEF05  |0A05EF;
                       LDY.B r_coreLoadingFuncAddr          ;0A9181|A416    |000016;
                       LDA.W DATA8_0A91A3,Y                 ;0A9183|B9A391  |0A91A3;
                       CLC                                  ;0A9186|18      |      ;
                       ADC.W $0438,X                        ;0A9187|7D3804  |0A0438;
                       STA.W $0438,X                        ;0A918A|9D3804  |0A0438;
                       INX                                  ;0A918D|E8      |      ;
                       INC.B r_coreLoadingFuncAddr          ;0A918E|E616    |000016;
                       LDA.B r_coreLoadingFuncAddr          ;0A9190|A516    |000016;
                       CMP.B #$06                           ;0A9192|C906    |      ;
                       BNE CODE_0A9163                      ;0A9194|D0CD    |0A9163;
                       DEX                                  ;0A9196|CA      |      ;
                       JSR.W lightningSpawn01               ;0A9197|20168F  |0A8F16;
                       JSR.W DATA8_0A8F73                   ;0A919A|20738F  |0A8F73;
                       LDX.B r_entityID_processed           ;0A919D|A66C    |00006C;
                       INC.W $07C8,X                        ;0A919F|FEC807  |0A07C8;
 
          CODE_0A91A2: RTS                                  ;0A91A2|60      |      ;
 
 
         DATA8_0A91A3: db $00,$04,$FC,$08,$F8               ;0A91A3|        |      ;
                       db $0C,$F4,$02                       ;0A91A8|        |      ;
 
lightningSpawnPointer09: dw lightningSpawnFF                  ;0A91AB|        |0A91B3;
                       dw emptySpawnClose                   ;0A91AD|        |0A8F15;
 
lightningSpawnPointer08: dw lightningSpawn00                  ;0A91AF|        |0A91CD;
                       dw emptySpawnClose                   ;0A91B1|        |0A8F15;
 
     lightningSpawnFF: JSR.W CODE_0A8D66                    ;0A91B3|20668D  |0A8D66;
                       BNE CODE_0A9216                      ;0A91B6|D05E    |0A9216;
                       LDA.B #$00                           ;0A91B8|A900    |      ;
                       STA.B r_currOAM_Attr                 ;0A91BA|8510    |000010;
                       db $20                               ;0A91BC|        |      ;
                       dw CODE_0FFEB9                       ;0A91BD|        |0FFEB9;
                       BNE CODE_0A9216                      ;0A91BF|D055    |0A9216;
                       LDA.B #$13                           ;0A91C1|A913    |      ;
                       STA.W $054E,X                        ;0A91C3|9D4E05  |0A054E;
                       LDA.B #$00                           ;0A91C6|A900    |      ;
                       STA.W $05EF,X                        ;0A91C8|9DEF05  |0A05EF;
                       BEQ CODE_0A91E5                      ;0A91CB|F018    |0A91E5;
 
     lightningSpawn00: JSR.W CODE_0A8D66                    ;0A91CD|20668D  |0A8D66;
                       BNE CODE_0A9216                      ;0A91D0|D044    |0A9216;
                       LDA.B #$02                           ;0A91D2|A902    |      ;
                       STA.B r_currOAM_Attr                 ;0A91D4|8510    |000010;
 
         DATA8_0A91D6: db $20                               ;0A91D6|        |      ;
                       dw CODE_0FFEB9                       ;0A91D7|        |0FFEB9;
                       BNE CODE_0A9216                      ;0A91D9|D03B    |0A9216;
                       LDA.B #$78                           ;0A91DB|A978    |      ;
                       STA.W $054E,X                        ;0A91DD|9D4E05  |0A054E;
                       LDA.B #$60                           ;0A91E0|A960    |      ;
                       STA.W $05EF,X                        ;0A91E2|9DEF05  |0A05EF;
 
          CODE_0A91E5: LDY.B r_currOAM_Attr                 ;0A91E5|A410    |000010;
                       LDA.W DATA8_0A9217,Y                 ;0A91E7|B91792  |0A9217;
                       STA.W $0438,X                        ;0A91EA|9D3804  |0A0438;
                       LDA.W DATA8_0A921A,Y                 ;0A91ED|B91A92  |0A921A;
                       STA.W $041C,X                        ;0A91F0|9D1C04  |0A041C;
                       LDA.B #$00                           ;0A91F3|A900    |      ;
                       STA.W $04F2,X                        ;0A91F5|9DF204  |0A04F2;
                       STA.W $0509,X                        ;0A91F8|9D0905  |0A0509;
                       STA.W $0520,X                        ;0A91FB|9D2005  |0A0520;
                       STA.W $0537,X                        ;0A91FE|9D3705  |0A0537;
                       STA.W $05C1,X                        ;0A9201|9DC105  |0A05C1;
                       LDA.B #$C8                           ;0A9204|A9C8    |      ;
                       STA.W $0470,X                        ;0A9206|9D7004  |0A0470;
                       LDA.B r_currOAM_Attr                 ;0A9209|A510    |000010;
                       BEQ CODE_0A9211                      ;0A920B|F004    |0A9211;
                       DEC.B r_currOAM_Attr                 ;0A920D|C610    |000010;
                       BNE DATA8_0A91D6                     ;0A920F|D0C5    |0A91D6;
 
          CODE_0A9211: LDX.B r_entityID_processed           ;0A9211|A66C    |00006C;
                       INC.W $07C8,X                        ;0A9213|FEC807  |0A07C8;
 
          CODE_0A9216: RTS                                  ;0A9216|60      |      ;
 
 
         DATA8_0A9217: db $80,$40,$C0                       ;0A9217|        |      ;
 
 
         DATA8_0A921A: db $40,$50                           ;0A921A|        |      ;
 
         DATA8_0A921C: db $40                               ;0A921C|        |      ;
 
lightningSpawnPointer0a: dw lighningSpawn03                   ;0A921D|        |0A9221;
                       dw emptySpawnClose                   ;0A921F|        |0A8F15;
 
      lighningSpawn03: JSR.W CODE_0A8D66                    ;0A9221|20668D  |0A8D66; clouds
                       BNE CODE_0A9269                      ;0A9224|D043    |0A9269;
                       LDA.B #$02                           ;0A9226|A902    |      ;
                       STA.B r_currOAM_Attr                 ;0A9228|8510    |000010;
 
         DATA8_0A922A: db $20                               ;0A922A|        |      ;
                       dw CODE_0FFEB9                       ;0A922B|        |0FFEB9;
                       BNE CODE_0A9269                      ;0A922D|D03A    |0A9269;
                       LDA.B #$12                           ;0A922F|A912    |      ;
                       STA.W $054E,X                        ;0A9231|9D4E05  |0A054E;
                       LDA.B #$00                           ;0A9234|A900    |      ;
                       STA.W $05EF,X                        ;0A9236|9DEF05  |0A05EF;
                       LDY.B r_currOAM_Attr                 ;0A9239|A410    |000010;
                       TYA                                  ;0A923B|98      |      ;
                       ORA.B #$80                           ;0A923C|0980    |      ;
                       STA.W $0645,X                        ;0A923E|9D4506  |0A0645;
                       LDA.W CODE_0A926A,Y                  ;0A9241|B96A92  |0A926A;
                       STA.W $0438,X                        ;0A9244|9D3804  |0A0438;
                       LDA.W LOOSE_OP_0A926F,Y              ;0A9247|B96F92  |0A926F;
                       STA.W $041C,X                        ;0A924A|9D1C04  |0A041C;
                       LDA.B #$88                           ;0A924D|A988    |      ;
                       STA.W $0470,X                        ;0A924F|9D7004  |0A0470;
                       LDA.B #$00                           ;0A9252|A900    |      ;
                       STA.W $04F2,X                        ;0A9254|9DF204  |0A04F2;
                       STA.W $0509,X                        ;0A9257|9D0905  |0A0509;
                       STA.W $0520,X                        ;0A925A|9D2005  |0A0520;
                       STA.W $0537,X                        ;0A925D|9D3705  |0A0537;
                       DEC.B r_currOAM_Attr                 ;0A9260|C610    |000010;
                       BPL DATA8_0A922A                     ;0A9262|10C6    |0A922A;
                       LDX.B r_entityID_processed           ;0A9264|A66C    |00006C;
                       INC.W $07C8,X                        ;0A9266|FEC807  |0A07C8;
 
          CODE_0A9269: RTS                                  ;0A9269|60      |      ;
 
 
          CODE_0A926A: BMI DATA8_0A921C                     ;0A926A|30B0    |0A921C;
                       BNE DATA8_0A92BE                     ;0A926C|D050    |0A92BE;
                       BCC DATA8_0A92C0                     ;0A926E|9050    |0A92C0;
                       BVC DATA8_0A92C2                     ;0A9270|5050    |0A92C2;
                       BMI DATA8_0A92A4                     ;0A9272|3030    |0A92A4;
 
          CODE_0A9274: LDY.B #$07                           ;0A9274|A007    |      ;
                       LDA.B #$00                           ;0A9276|A900    |      ;
 
          CODE_0A9278: STA.W $07EC,Y                        ;0A9278|99EC07  |0A07EC;
                       DEY                                  ;0A927B|88      |      ;
                       BNE CODE_0A9278                      ;0A927C|D0FA    |0A9278;
                       STA.W $07EC                          ;0A927E|8DEC07  |0A07EC;
                       RTS                                  ;0A9281|60      |      ;
 
 
spawnerEntityAI_Idxes: db $00,$01,$02,$07,$0D               ;0A9282|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9287|        |      ;
                       db $00,$0E,$05,$06,$12               ;0A928C|        |      ;
                       db $11,$03,$10,$14,$21               ;0A9291|        |      ;
                       db $0B,$0F,$09,$0A,$08               ;0A9296|        |      ;
                       db $17,$16,$00,$00,$00               ;0A929B|        |      ;
                       db $00,$00,$00,$00                   ;0A92A0|        |      ;
 
         DATA8_0A92A4: db $00,$00,$00,$00,$00               ;0A92A4|        |      ;
                       db $04,$1C,$1D,$1E,$6E               ;0A92A9|        |      ;
                       db $6F,$0C,$22,$00,$00               ;0A92AE|        |      ;
                       db $00,$13,$00,$00,$00               ;0A92B3|        |      ;
                       db $00,$00,$00,$00,$24               ;0A92B8|        |      ;
                       db $25                               ;0A92BD|        |      ;
 
         DATA8_0A92BE: db $26,$27                           ;0A92BE|        |      ;
 
         DATA8_0A92C0: db $29,$28                           ;0A92C0|        |      ;
 
         DATA8_0A92C2: db $2B,$2F,$00,$2C,$63               ;0A92C2|        |      ;
                       db $64,$65,$66,$07,$10               ;0A92C7|        |      ;
                       db $07,$68,$00,$00,$00               ;0A92CC|        |      ;
                       db $01,$16,$6A,$0D,$00               ;0A92D1|        |      ;
                       db $00,$00,$00,$00                   ;0A92D6|        |      ;
 
spawnerEntityObject_Idxes: db $00,$48,$48,$4B,$51               ;0A92DA|        |      ;
                       db $01,$02,$03,$00,$00               ;0A92DF|        |      ;
                       db $00,$52,$4A,$4A,$56               ;0A92E4|        |      ;
                       db $55,$49,$54,$58,$57               ;0A92E9|        |      ;
                       db $4F,$53,$4D,$4E,$4C               ;0A92EE|        |      ;
                       db $5B,$5A,$04,$05,$06               ;0A92F3|        |      ;
                       db $0A,$08,$09,$07,$00               ;0A92F8|        |      ;
                       db $0C,$0B,$09,$0D,$49               ;0A92FD|        |      ;
                       db $5C,$5D,$56,$4A,$64               ;0A9302|        |      ;
                       db $50,$5E,$7D,$82,$80               ;0A9307|        |      ;
                       db $4D,$7F,$7E,$84,$76               ;0A930C|        |      ;
                       db $7B,$7C,$75,$48,$60               ;0A9311|        |      ;
                       db $61,$58,$58,$62,$63               ;0A9316|        |      ;
                       db $56,$74,$59,$5F,$64               ;0A931B|        |      ;
                       db $65,$4A,$4B,$54,$4B               ;0A9320|        |      ;
                       db $4C,$73,$71,$72,$48               ;0A9325|        |      ;
                       db $5A,$58,$51,$00,$00               ;0A932A|        |      ;
                       db $00,$00,$00                       ;0A932F|        |      ;
 
          CODE_0A9332: LDA.B #$40                           ;0A9332|A940    |      ;
                       LDY.W $054E,X                        ;0A9334|BC4E05  |0A054E;
                       CPY.B #$08                           ;0A9337|C008    |      ;
                       BNE CODE_0A933F                      ;0A9339|D004    |0A933F;
                       LDA.B #$20                           ;0A933B|A920    |      ;
                       BNE CODE_0A934B                      ;0A933D|D00C    |0A934B;
 
          CODE_0A933F: CPY.B #$40                           ;0A933F|C040    |      ;
                       BCC CODE_0A934B                      ;0A9341|9008    |0A934B;
                       TYA                                  ;0A9343|98      |      ;
                       SEC                                  ;0A9344|38      |      ;
                       SBC.B #$40                           ;0A9345|E940    |      ;
                       TAY                                  ;0A9347|A8      |      ;
                       LDA.W DATA8_0A934F,Y                 ;0A9348|B94F93  |0A934F;
 
          CODE_0A934B: STA.W $067B,X                        ;0A934B|9D7B06  |0A067B;
                       RTS                                  ;0A934E|60      |      ;
 
 
         DATA8_0A934F: db $04,$04,$04,$04,$04               ;0A934F|        |      ;
                       db $04,$04,$04,$02,$02               ;0A9354|        |      ;
                       db $02,$04,$0C,$02,$02               ;0A9359|        |      ;
                       db $04,$04,$04,$04,$04               ;0A935E|        |      ;
                       db $0C,$30,$24,$04,$04               ;0A9363|        |      ;
                       db $40,$06,$04,$02,$04               ;0A9368|        |      ;
 
                       db $04,$04,$04,$04,$0C               ;0A936D|        |      ;
                       db $0C,$7F,$04,$0A,$06               ;0A9372|        |      ;
                       db $04,$04,$04,$04,$04               ;0A9377|        |      ;
                       db $04,$04,$04                       ;0A937C|        |      ;
 
roomEntityDataAddresses: dw group0                            ;0A937F|        |0A939D;
                       dw group1                            ;0A9381|        |0A93A5;
                       dw group2                            ;0A9383|        |0A93B1;
                       dw group3                            ;0A9385|        |0A93BB;
                       dw group4                            ;0A9387|        |0A93C5;
                       dw group5                            ;0A9389|        |0A93CB;
                       dw group6                            ;0A938B|        |0A93D3;
                       dw group7                            ;0A938D|        |0A93D9;
                       dw group8                            ;0A938F|        |0A93E7;
                       dw DATA8_0A9BC5                      ;0A9391|        |0A9BC5;
                       dw DATA8_0A9BC9                      ;0A9393|        |0A9BC9;
                       dw DATA8_0A9BD7                      ;0A9395|        |0A9BD7;
                       dw DATA8_0A9BDD                      ;0A9397|        |0A9BDD;
                       dw DATA8_0A9BE3                      ;0A9399|        |0A9BE3;
                       dw DATA8_0A9BEB                      ;0A939B|        |0A9BEB;
 
               group0: dw PTR16_0A93F1                      ;0A939D|        |0A93F1;
                       dw PTR16_0A93F3                      ;0A939F|        |0A93F3;
                       dw PTR16_0A93FB                      ;0A93A1|        |0A93FB;
                       dw PTR16_0A93FF                      ;0A93A3|        |0A93FF;
 
               group1: dw PTR16_0A9401                      ;0A93A5|        |0A9401;
                       dw PTR16_0A9407                      ;0A93A7|        |0A9407;
                       dw PTR16_0A940D                      ;0A93A9|        |0A940D;
                       dw PTR16_0A9413                      ;0A93AB|        |0A9413;
                       dw PTR16_0A9419                      ;0A93AD|        |0A9419;
                       dw PTR16_0A941F                      ;0A93AF|        |0A941F;
 
               group2: dw PTR16_0A9425                      ;0A93B1|        |0A9425;
                       dw PTR16_0A9429                      ;0A93B3|        |0A9429;
                       dw PTR16_0A942B                      ;0A93B5|        |0A942B;
                       dw PTR16_0A942F                      ;0A93B7|        |0A942F;
                       dw PTR16_0A9435                      ;0A93B9|        |0A9435;
 
               group3: dw PTR16_0A9439                      ;0A93BB|        |0A9439;
                       dw PTR16_0A943F                      ;0A93BD|        |0A943F;
                       dw PTR16_0A9443                      ;0A93BF|        |0A9443;
                       dw PTR16_0A9447                      ;0A93C1|        |0A9447;
                       dw PTR16_0A944B                      ;0A93C3|        |0A944B;
 
               group4: dw PTR16_0A9451                      ;0A93C5|        |0A9451;
                       dw PTR16_0A9457                      ;0A93C7|        |0A9457;
                       dw PTR16_0A945D                      ;0A93C9|        |0A945D;
 
               group5: dw PTR16_0A9463                      ;0A93CB|        |0A9463;
                       dw PTR16_0A9465                      ;0A93CD|        |0A9465;
                       dw PTR16_0A9467                      ;0A93CF|        |0A9467;
                       dw PTR16_0A946B                      ;0A93D1|        |0A946B;
 
               group6: dw PTR16_0A946F                      ;0A93D3|        |0A946F;
                       dw PTR16_0A9473                      ;0A93D5|        |0A9473;
                       dw PTR16_0A9475                      ;0A93D7|        |0A9475;
 
               group7: dw PTR16_0A947B                      ;0A93D9|        |0A947B;
                       dw PTR16_0A947F                      ;0A93DB|        |0A947F;
                       dw PTR16_0A9481                      ;0A93DD|        |0A9481;
                       dw PTR16_0A9483                      ;0A93DF|        |0A9483;
                       dw PTR16_0A9485                      ;0A93E1|        |0A9485;
                       dw PTR16_0A9489                      ;0A93E3|        |0A9489;
                       dw PTR16_0A948D                      ;0A93E5|        |0A948D;
 
               group8: dw PTR16_0A948F                      ;0A93E7|        |0A948F;
                       dw PTR16_0A9493                      ;0A93E9|        |0A9493;
                       dw PTR16_0A9495                      ;0A93EB|        |0A9495;
                       dw PTR16_0A9499                      ;0A93ED|        |0A9499;
                       dw roomEnities                       ;0A93EF|        |0A949B;
 
         PTR16_0A93F1: dw DATA8_0A949D                      ;0A93F1|        |0A949D;
 
         PTR16_0A93F3: dw DATA8_0A94B9                      ;0A93F3|        |0A94B9;
                       dw DATA8_0AAC34                      ;0A93F5|        |0AAC34;
                       dw DATA8_0A94C5                      ;0A93F7|        |0A94C5;
                       dw DATA8_0A94E1                      ;0A93F9|        |0A94E1;
 
         PTR16_0A93FB: dw DATA8_0A94F5                      ;0A93FB|        |0A94F5;
                       dw DATA8_0A9511                      ;0A93FD|        |0A9511;
 
         PTR16_0A93FF: dw DATA8_0A952D                      ;0A93FF|        |0A952D;
 
         PTR16_0A9401: dw DATA8_0AAC74                      ;0A9401|        |0AAC74;
                       dw DATA8_0A9551                      ;0A9403|        |0A9551;
                       dw DATA8_0A9565                      ;0A9405|        |0A9565;
 
         PTR16_0A9407: dw DATA8_0A9579                      ;0A9407|        |0A9579;
                       dw DATA8_0AACD0                      ;0A9409|        |0AACD0;
                       dw DATA8_0A958D                      ;0A940B|        |0A958D;
 
         PTR16_0A940D: dw DATA8_0A9599                      ;0A940D|        |0A9599;
                       dw DATA8_0AAD02                      ;0A940F|        |0AAD02;
                       dw DATA8_0A95A5                      ;0A9411|        |0A95A5;
 
         PTR16_0A9413: dw DATA8_0A9599                      ;0A9413|        |0A9599;
                       dw DATA8_0AAD1F                      ;0A9415|        |0AAD1F;
                       dw DATA8_0A95A5                      ;0A9417|        |0A95A5;
 
         PTR16_0A9419: dw DATA8_0A9579                      ;0A9419|        |0A9579;
                       dw DATA8_0AAD43                      ;0A941B|        |0AAD43;
                       dw DATA8_0A958D                      ;0A941D|        |0A958D;
 
         PTR16_0A941F: dw DATA8_0AAD75                      ;0A941F|        |0AAD75;
                       dw DATA8_0A9551                      ;0A9421|        |0A9551;
                       dw DATA8_0A9565                      ;0A9423|        |0A9565;
 
         PTR16_0A9425: dw DATA8_0A95B9                      ;0A9425|        |0A95B9;
                       dw DATA8_0A95D5                      ;0A9427|        |0A95D5;
 
         PTR16_0A9429: dw DATA8_0A95F1                      ;0A9429|        |0A95F1;
 
         PTR16_0A942B: dw DATA8_0A9625                      ;0A942B|        |0A9625;
                       dw DATA8_0A9649                      ;0A942D|        |0A9649;
 
         PTR16_0A942F: dw DATA8_0A966D                      ;0A942F|        |0A966D;
                       dw DATA8_0A9679                      ;0A9431|        |0A9679;
                       dw DATA8_0A969D                      ;0A9433|        |0A969D;
 
         PTR16_0A9435: dw DATA8_0A96A9                      ;0A9435|        |0A96A9;
                       dw DATA8_0A96BD                      ;0A9437|        |0A96BD;
 
         PTR16_0A9439: dw DATA8_0A96E1                      ;0A9439|        |0A96E1;
                       dw DATA8_0A96F5                      ;0A943B|        |0A96F5;
                       dw DATA8_0A9709                      ;0A943D|        |0A9709;
 
         PTR16_0A943F: dw DATA8_0A971D                      ;0A943F|        |0A971D;
                       dw DATA8_0A9749                      ;0A9441|        |0A9749;
 
         PTR16_0A9443: dw DATA8_0A975D                      ;0A9443|        |0A975D;
                       dw DATA8_0A9781                      ;0A9445|        |0A9781;
 
         PTR16_0A9447: dw DATA8_0A9795                      ;0A9447|        |0A9795;
                       dw DATA8_0A97B1                      ;0A9449|        |0A97B1;
 
         PTR16_0A944B: dw DATA8_0A97CD                      ;0A944B|        |0A97CD;
                       dw DATA8_0A97D9                      ;0A944D|        |0A97D9;
                       dw DATA8_0A97F5                      ;0A944F|        |0A97F5;
 
         PTR16_0A9451: dw DATA8_0A9801                      ;0A9451|        |0A9801;
                       dw DATA8_0AADF4                      ;0A9453|        |0AADF4;
                       dw DATA8_0A9815                      ;0A9455|        |0A9815;
 
         PTR16_0A9457: dw DATA8_0A9821                      ;0A9457|        |0A9821;
                       dw DATA8_0AAE50                      ;0A9459|        |0AAE50;
                       dw DATA8_0A982D                      ;0A945B|        |0A982D;
 
         PTR16_0A945D: dw DATA8_0A9841                      ;0A945D|        |0A9841;
                       dw DATA8_0AAEC1                      ;0A945F|        |0AAEC1;
                       dw DATA8_0A984D                      ;0A9461|        |0A984D;
 
         PTR16_0A9463: dw DATA8_0A9869                      ;0A9463|        |0A9869;
 
         PTR16_0A9465: dw DATA8_0A987D                      ;0A9465|        |0A987D;
 
         PTR16_0A9467: dw DATA8_0A98A1                      ;0A9467|        |0A98A1;
                       dw DATA8_0A98B5                      ;0A9469|        |0A98B5;
 
         PTR16_0A946B: dw DATA8_0A98D9                      ;0A946B|        |0A98D9;
                       dw DATA8_0A98ED                      ;0A946D|        |0A98ED;
 
         PTR16_0A946F: dw DATA8_0A9911                      ;0A946F|        |0A9911;
                       dw DATA8_0A9925                      ;0A9471|        |0A9925;
 
         PTR16_0A9473: dw DATA8_0A9949                      ;0A9473|        |0A9949;
 
         PTR16_0A9475: dw DATA8_0A997D                      ;0A9475|        |0A997D;
                       dw DATA8_0A9989                      ;0A9477|        |0A9989;
                       dw DATA8_0A99A5                      ;0A9479|        |0A99A5;
 
         PTR16_0A947B: dw DATA8_0A99B9                      ;0A947B|        |0A99B9;
                       dw DATA8_0A99CD                      ;0A947D|        |0A99CD;
 
         PTR16_0A947F: dw DATA8_0A99F1                      ;0A947F|        |0A99F1;
 
         PTR16_0A9481: dw DATA8_0A9A05                      ;0A9481|        |0A9A05;
 
         PTR16_0A9483: dw DATA8_0A9A11                      ;0A9483|        |0A9A11;
 
         PTR16_0A9485: dw DATA8_0A9A25                      ;0A9485|        |0A9A25;
                       dw DATA8_0A9A49                      ;0A9487|        |0A9A49;
 
         PTR16_0A9489: dw DATA8_0A9A5D                      ;0A9489|        |0A9A5D;
                       dw DATA8_0A9A81                      ;0A948B|        |0A9A81;
 
         PTR16_0A948D: dw DATA8_0A9A95                      ;0A948D|        |0A9A95;
 
         PTR16_0A948F: dw DATA8_0A9AC1                      ;0A948F|        |0A9AC1;
                       dw DATA8_0A9AD5                      ;0A9491|        |0A9AD5;
 
         PTR16_0A9493: dw DATA8_0A9B01                      ;0A9493|        |0A9B01;
 
         PTR16_0A9495: dw DATA8_0A9B2D                      ;0A9495|        |0A9B2D;
                       dw DATA8_0A9B51                      ;0A9497|        |0A9B51;
 
         PTR16_0A9499: dw DATA8_0A9B6D                      ;0A9499|        |0A9B6D;
 
          roomEnities: db $99,$9B                           ;0A949B|        |      ;
 
         DATA8_0A949D: db $00,$00,$00,$00,$00               ;0A949D|        |      ;
                       db $00,$00,$0F,$00,$00               ;0A94A2|        |      ;
                       db $D1,$46,$00,$00,$D1               ;0A94A7|        |      ;
                       db $0C,$D0,$35,$00,$00               ;0A94AC|        |      ;
                       db $00,$00,$00,$0B,$00               ;0A94B1|        |      ;
                       db $00,$00,$00                       ;0A94B6|        |      ;
 
         DATA8_0A94B9: db $00,$00,$00,$50,$00               ;0A94B9|        |      ;
                       db $50,$A0,$68,$9F,$47               ;0A94BE|        |      ;
                       db $00,$00                           ;0A94C3|        |      ;
 
         DATA8_0A94C5: db $00,$00,$00,$00,$00               ;0A94C5|        |      ;
                       db $3F,$00,$00,$00,$3F               ;0A94CA|        |      ;
                       db $00,$63,$09,$00,$00               ;0A94CF|        |      ;
                       db $07,$00,$08,$00,$00               ;0A94D4|        |      ;
                       db $00,$99,$09,$00,$00               ;0A94D9|        |      ;
                       db $00,$00,$00                       ;0A94DE|        |      ;
 
         DATA8_0A94E1: db $00,$00,$00,$4B,$D3               ;0A94E1|        |      ;
                       db $50,$65,$4C,$00,$59               ;0A94E6|        |      ;
                       db $65,$77,$D3,$02,$1D               ;0A94EB|        |      ;
                       db $E6,$00,$10,$00,$00               ;0A94F0|        |      ;
 
         DATA8_0A94F5: db $00,$00,$00,$CC,$00               ;0A94F5|        |      ;
                       db $00,$00,$58,$00,$2E               ;0A94FA|        |      ;
                       db $10,$50,$00,$53,$0A               ;0A94FF|        |      ;
                       db $53,$00,$CD,$26,$53               ;0A9504|        |      ;
                       db $00,$53,$11,$00,$00               ;0A9509|        |      ;
                       db $00,$00,$00                       ;0A950E|        |      ;
 
         DATA8_0A9511: db $00,$00,$00,$E7,$66               ;0A9511|        |      ;
                       db $E8,$00,$00,$D4,$00               ;0A9516|        |      ;
                       db $00,$3F,$66,$EC,$D4               ;0A951B|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9520|        |      ;
                       db $66,$34,$D4,$57,$00               ;0A9525|        |      ;
                       db $57,$00,$00                       ;0A952A|        |      ;
 
         DATA8_0A952D: db $00,$00,$00,$AE,$0B               ;0A952D|        |      ;
                       db $34,$00,$54,$01,$00               ;0A9532|        |      ;
                       db $00,$00,$00,$0A,$00               ;0A9537|        |      ;
                       db $00,$0B,$00,$0E,$0D               ;0A953C|        |      ;
                       db $00,$0D,$00,$00,$00               ;0A9541|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9546|        |      ;
                       db $03,$00,$00,$DE,$00               ;0A954B|        |      ;
                       db $00                               ;0A9550|        |      ;
 
         DATA8_0A9551: db $00,$00,$5A,$00,$E3               ;0A9551|        |      ;
                       db $23,$00,$00,$00,$22               ;0A9556|        |      ;
                       db $BA,$24,$58,$73,$00               ;0A955B|        |      ;
                       db $0D,$59,$00,$00,$00               ;0A9560|        |      ;
 
         DATA8_0A9565: db $00,$00,$00,$00,$D4               ;0A9565|        |      ;
                       db $00,$00,$00,$00,$00               ;0A956A|        |      ;
                       db $00,$00,$00,$00,$D4               ;0A956F|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9574|        |      ;
 
         DATA8_0A9579: db $00,$00,$00,$00,$00               ;0A9579|        |      ;
                       db $00,$00,$74,$5C,$00               ;0A957E|        |      ;
                       db $00,$00,$00,$75,$00               ;0A9583|        |      ;
                       db $00,$00,$76,$00,$00               ;0A9588|        |      ;
 
         DATA8_0A958D: db $00,$00,$00,$00,$00               ;0A958D|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9592|        |      ;
                       db $00,$00                           ;0A9597|        |      ;
 
         DATA8_0A9599: db $00,$00,$00,$78,$00               ;0A9599|        |      ;
                       db $79,$00,$BD,$00,$F7               ;0A959E|        |      ;
                       db $00,$00                           ;0A95A3|        |      ;
 
         DATA8_0A95A5: db $00,$00,$05,$00,$00               ;0A95A5|        |      ;
                       db $94,$00,$3B,$00,$00               ;0A95AA|        |      ;
                       db $00,$96,$BB,$7B,$00               ;0A95AF|        |      ;
                       db $9D,$00,$05,$00,$00               ;0A95B4|        |      ;
 
         DATA8_0A95B9: db $00,$00,$00,$00,$00               ;0A95B9|        |      ;
                       db $29,$00,$42,$00,$3E               ;0A95BE|        |      ;
                       db $D2,$00,$00,$3F,$00               ;0A95C3|        |      ;
                       db $3F,$00,$3F,$00,$2C               ;0A95C8|        |      ;
                       db $14,$00,$D2,$02,$00               ;0A95CD|        |      ;
                       db $00,$00,$00                       ;0A95D2|        |      ;
 
         DATA8_0A95D5: db $00,$00,$00,$00,$65               ;0A95D5|        |      ;
                       db $10,$00,$00,$00,$00               ;0A95DA|        |      ;
                       db $68,$00,$00,$42,$1D               ;0A95DF|        |      ;
                       db $00,$00,$00,$00,$26               ;0A95E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0A95E9|        |      ;
                       db $00,$00,$00                       ;0A95EE|        |      ;
 
         DATA8_0A95F1: db $00,$00,$00,$00,$00               ;0A95F1|        |      ;
                       db $4D,$00,$00,$00,$4D               ;0A95F6|        |      ;
                       db $00,$00,$00,$00,$38               ;0A95FB|        |      ;
                       db $29,$37,$00,$47,$4F               ;0A9600|        |      ;
                       db $3C,$00,$45,$00,$00               ;0A9605|        |      ;
                       db $4D,$00,$00,$48,$00               ;0A960A|        |      ;
                       db $00,$00,$00,$00,$47               ;0A960F|        |      ;
                       db $51,$46,$00,$3C,$00               ;0A9614|        |      ;
                       db $00,$29,$00,$00,$00               ;0A9619|        |      ;
                       db $00,$00,$4B,$00,$2E               ;0A961E|        |      ;
                       db $00,$00                           ;0A9623|        |      ;
 
         DATA8_0A9625: db $00,$00,$00,$9D,$00               ;0A9625|        |      ;
                       db $00,$6E,$90,$26,$6D               ;0A962A|        |      ;
                       db $00,$00,$00,$00,$00               ;0A962F|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9634|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9639|        |      ;
                       db $00,$00,$00,$00,$00               ;0A963E|        |      ;
                       db $74,$00,$00,$00,$00               ;0A9643|        |      ;
                       db $00                               ;0A9648|        |      ;
 
         DATA8_0A9649: db $00,$00,$00,$00,$00               ;0A9649|        |      ;
                       db $00,$00,$00,$06,$00               ;0A964E|        |      ;
                       db $00,$00,$87,$00,$00               ;0A9653|        |      ;
                       db $00,$69,$00,$06,$00               ;0A9658|        |      ;
                       db $00,$00,$00,$00,$87               ;0A965D|        |      ;
                       db $00,$6A,$00,$00,$00               ;0A9662|        |      ;
                       db $06,$00,$00,$00,$00               ;0A9667|        |      ;
                       db $00                               ;0A966C|        |      ;
 
         DATA8_0A966D: db $00,$00,$00,$00,$00               ;0A966D|        |      ;
                       db $00,$67,$7B,$00,$2E               ;0A9672|        |      ;
                       db $00,$00                           ;0A9677|        |      ;
 
         DATA8_0A9679: db $00,$00,$00,$00,$5F               ;0A9679|        |      ;
                       db $00,$60,$00,$00,$00               ;0A967E|        |      ;
                       db $00,$00,$00,$00,$5F               ;0A9683|        |      ;
                       db $00,$00,$00,$60,$00               ;0A9688|        |      ;
                       db $00,$00,$60,$00,$60               ;0A968D|        |      ;
                       db $00,$00,$00,$5F,$00               ;0A9692|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9697|        |      ;
                       db $00                               ;0A969C|        |      ;
 
         DATA8_0A969D: db $00,$00,$00,$DC,$00               ;0A969D|        |      ;
                       db $A8,$88,$00,$00,$4D               ;0A96A2|        |      ;
                       db $00,$00                           ;0A96A7|        |      ;
 
         DATA8_0A96A9: db $00,$00,$00,$00,$00               ;0A96A9|        |      ;
                       db $00,$D7,$3F,$00,$00               ;0A96AE|        |      ;
                       db $07,$00,$08,$00,$06               ;0A96B3|        |      ;
                       db $00,$04,$00,$00,$00               ;0A96B8|        |      ;
 
         DATA8_0A96BD: db $00,$00,$00,$00,$30               ;0A96BD|        |      ;
                       db $00,$00,$2F,$30,$30               ;0A96C2|        |      ;
                       db $00,$00,$00,$51,$67               ;0A96C7|        |      ;
                       db $51,$00,$ED,$30,$00               ;0A96CC|        |      ;
                       db $00,$A5,$00,$0B,$30               ;0A96D1|        |      ;
                       db $51,$67,$00,$00,$53               ;0A96D6|        |      ;
                       db $00,$53,$00,$00,$00               ;0A96DB|        |      ;
                       db $00                               ;0A96E0|        |      ;
 
         DATA8_0A96E1: db $00,$00,$00,$17,$D2               ;0A96E1|        |      ;
                       db $7D,$00,$00,$3A,$7E               ;0A96E6|        |      ;
                       db $00,$1C,$2F,$1C,$D2               ;0A96EB|        |      ;
                       db $00,$00,$87,$00,$00               ;0A96F0|        |      ;
 
         DATA8_0A96F5: db $00,$00,$00,$13,$D6               ;0A96F5|        |      ;
                       db $1B,$2F,$15,$00,$17               ;0A96FA|        |      ;
                       db $00,$00,$00,$1B,$31               ;0A96FF|        |      ;
                       db $7F,$00,$1B,$00,$00               ;0A9704|        |      ;
 
         DATA8_0A9709: db $00,$00,$00,$00,$00               ;0A9709|        |      ;
                       db $11,$00,$00,$00,$11               ;0A970E|        |      ;
                       db $00,$1A,$00,$82,$00               ;0A9713|        |      ;
                       db $00,$00,$EE,$00,$00               ;0A9718|        |      ;
 
         DATA8_0A971D: db $00,$00,$00,$1D,$E1               ;0A971D|        |      ;
                       db $1D,$57,$1D,$00,$00               ;0A9722|        |      ;
                       db $DA,$1B,$00,$8F,$E0               ;0A9727|        |      ;
                       db $1B,$14,$1E,$00,$00               ;0A972C|        |      ;
                       db $E1,$1D,$00,$1D,$00               ;0A9731|        |      ;
                       db $1D,$00,$84,$57,$00               ;0A9736|        |      ;
                       db $00,$1F,$6E,$00,$E1               ;0A973B|        |      ;
                       db $1F,$00,$20,$16,$20               ;0A9740|        |      ;
                       db $00,$00,$00,$00                   ;0A9745|        |      ;
 
         DATA8_0A9749: db $00,$00,$00,$00,$E2               ;0A9749|        |      ;
                       db $1B,$79,$1F,$00,$00               ;0A974E|        |      ;
                       db $02,$00,$D3,$1B,$15               ;0A9753|        |      ;
                       db $12,$00,$12,$00,$00               ;0A9758|        |      ;
 
         DATA8_0A975D: db $00,$00,$00,$00,$00               ;0A975D|        |      ;
                       db $1B,$14,$86,$D4,$87               ;0A9762|        |      ;
                       db $00,$1B,$00,$00,$00               ;0A9767|        |      ;
                       db $00,$00,$00,$00,$00               ;0A976C|        |      ;
                       db $D4,$7E,$00,$00,$00               ;0A9771|        |      ;
                       db $7C,$00,$F9,$00,$00               ;0A9776|        |      ;
                       db $D4,$00,$00,$1B,$00               ;0A977B|        |      ;
                       db $00                               ;0A9780|        |      ;
 
         DATA8_0A9781: db $00,$00,$00,$00,$00               ;0A9781|        |      ;
                       db $16,$00,$00,$00,$1B               ;0A9786|        |      ;
                       db $00,$88,$00,$00,$00               ;0A978B|        |      ;
                       db $00,$27,$00,$00,$00               ;0A9790|        |      ;
 
         DATA8_0A9795: db $00,$00,$00,$8E,$5E               ;0A9795|        |      ;
                       db $31,$D5,$8B,$75,$1F               ;0A979A|        |      ;
                       db $00,$00,$D5,$1C,$75               ;0A979F|        |      ;
                       db $8C,$5E,$1C,$00,$17               ;0A97A4|        |      ;
                       db $5D,$19,$D5,$7D,$00               ;0A97A9|        |      ;
                       db $00,$00,$00                       ;0A97AE|        |      ;
 
         DATA8_0A97B1: db $00,$00,$00,$00,$00               ;0A97B1|        |      ;
                       db $17,$00,$17,$00,$00               ;0A97B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0A97BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0A97C0|        |      ;
                       db $00,$1E,$00,$86,$00               ;0A97C5|        |      ;
                       db $1E,$00,$00                       ;0A97CA|        |      ;
 
         DATA8_0A97CD: db $00,$00,$00,$32,$78               ;0A97CD|        |      ;
                       db $89,$57,$8A,$00,$00               ;0A97D2|        |      ;
                       db $00,$00                           ;0A97D7|        |      ;
 
         DATA8_0A97D9: db $00,$00,$00,$00,$00               ;0A97D9|        |      ;
                       db $00,$00,$F2,$3E,$1B               ;0A97DE|        |      ;
                       db $3E,$00,$3B,$00,$00               ;0A97E3|        |      ;
                       db $00,$00,$81,$00,$00               ;0A97E8|        |      ;
                       db $00,$00,$29,$00,$00               ;0A97ED|        |      ;
                       db $00,$00,$00                       ;0A97F2|        |      ;
 
         DATA8_0A97F5: db $00,$00,$00,$00,$3D               ;0A97F5|        |      ;
                       db $00,$3D,$00,$00,$89               ;0A97FA|        |      ;
                       db $00,$00                           ;0A97FF|        |      ;
 
         DATA8_0A9801: db $00,$00,$00,$3B,$00               ;0A9801|        |      ;
                       db $74,$00,$45,$40,$00               ;0A9806|        |      ;
                       db $00,$37,$00,$38,$3F               ;0A980B|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9810|        |      ;
 
         DATA8_0A9815: db $00,$00,$00,$B3,$41               ;0A9815|        |      ;
                       db $41,$00,$07,$00,$F1               ;0A981A|        |      ;
                       db $00,$00                           ;0A981F|        |      ;
 
         DATA8_0A9821: db $00,$00,$00,$3A,$7A               ;0A9821|        |      ;
                       db $42,$4A,$43,$00,$00               ;0A9826|        |      ;
                       db $00,$00                           ;0A982B|        |      ;
 
         DATA8_0A982D: db $00,$00,$00,$00,$32               ;0A982D|        |      ;
                       db $24,$00,$F5,$00,$23               ;0A9832|        |      ;
                       db $00,$22,$00,$23,$32               ;0A9837|        |      ;
                       db $22,$00,$23,$00,$00               ;0A983C|        |      ;
 
         DATA8_0A9841: db $00,$00,$00,$2D,$34               ;0A9841|        |      ;
                       db $FA,$D4,$3B,$00,$94               ;0A9846|        |      ;
                       db $00,$00                           ;0A984B|        |      ;
 
         DATA8_0A984D: db $00,$00,$00,$3B,$D9               ;0A984D|        |      ;
                       db $00,$44,$2E,$DA,$25               ;0A9852|        |      ;
                       db $44,$65,$DB,$21,$00               ;0A9857|        |      ;
                       db $00,$DC,$00,$00,$00               ;0A985C|        |      ;
                       db $00,$00,$24,$00,$00               ;0A9861|        |      ;
                       db $00,$00,$00                       ;0A9866|        |      ;
 
         DATA8_0A9869: db $00,$00,$00,$9D,$00               ;0A9869|        |      ;
                       db $00,$6A,$6D,$6A,$93               ;0A986E|        |      ;
                       db $00,$7A,$34,$9D,$00               ;0A9873|        |      ;
                       db $00,$10,$61,$00,$00               ;0A9878|        |      ;
 
         DATA8_0A987D: db $00,$00,$00,$E7,$00               ;0A987D|        |      ;
                       db $00,$6F,$9B,$80,$00               ;0A9882|        |      ;
                       db $00,$00,$D8,$9C,$80               ;0A9887|        |      ;
                       db $00,$6F,$6C,$00,$6C               ;0A988C|        |      ;
                       db $51,$00,$D8,$00,$6F               ;0A9891|        |      ;
                       db $6C,$00,$6C,$63,$00               ;0A9896|        |      ;
 
                       db $00,$49,$7C,$00,$00               ;0A989B|        |      ;
                       db $00                               ;0A98A0|        |      ;
 
         DATA8_0A98A1: db $00,$00,$00,$73,$0B               ;0A98A1|        |      ;
                       db $00,$00,$95,$83,$61               ;0A98A6|        |      ;
                       db $00,$96,$D4,$65,$7E               ;0A98AB|        |      ;
                       db $96,$41,$CB,$00,$00               ;0A98B0|        |      ;
 
         DATA8_0A98B5: db $00,$00,$00,$90,$00               ;0A98B5|        |      ;
                       db $93,$00,$94,$41,$00               ;0A98BA|        |      ;
                       db $82,$93,$7D,$94,$00               ;0A98BF|        |      ;
 
                       db $94,$00,$00,$00,$00               ;0A98C4|        |      ;
                       db $00,$98,$0F,$97,$00               ;0A98C9|        |      ;
                       db $00,$00,$94,$36,$94               ;0A98CE|        |      ;
                       db $41,$94,$0B,$00,$00               ;0A98D3|        |      ;
                       db $00                               ;0A98D8|        |      ;
 
         DATA8_0A98D9: db $00,$00,$00,$00,$00               ;0A98D9|        |      ;
                       db $92,$00,$78,$00,$91               ;0A98DE|        |      ;
                       db $00,$00,$62,$00,$00               ;0A98E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0A98E8|        |      ;
 
         DATA8_0A98ED: db $00,$00,$00,$90,$00               ;0A98ED|        |      ;
                       db $00,$7F,$9A,$00,$00               ;0A98F2|        |      ;
                       db $00,$00,$00,$00,$21               ;0A98F7|        |      ;
                       db $00,$21,$00,$00,$58               ;0A98FC|        |      ;
                       db $00,$00,$1B,$00,$00               ;0A9901|        |      ;
                       db $99,$00,$65,$1B,$00               ;0A9906|        |      ;
                       db $00,$00,$1B,$58,$00               ;0A990B|        |      ;
                       db $00                               ;0A9910|        |      ;
 
         DATA8_0A9911: db $00,$00,$00,$00,$6B               ;0A9911|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9916|        |      ;
                       db $00,$99,$6C,$00,$00               ;0A991B|        |      ;
                       db $00,$00,$61,$00,$00               ;0A9920|        |      ;
 
         DATA8_0A9925: db $00,$00,$00,$00,$00               ;0A9925|        |      ;
                       db $9E,$6C,$00,$00,$00               ;0A992A|        |      ;
                       db $00,$00,$00,$00,$00               ;0A992F|        |      ;
                       db $00,$6C,$00,$00,$00               ;0A9934|        |      ;
                       db $00,$00,$6C,$00,$00               ;0A9939|        |      ;
                       db $00,$00,$00,$00,$9F               ;0A993E|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9943|        |      ;
                       db $00                               ;0A9948|        |      ;
 
         DATA8_0A9949: db $00,$00,$00,$59,$0B               ;0A9949|        |      ;
                       db $59,$6B,$00,$00,$00               ;0A994E|        |      ;
                       db $6B,$00,$00,$00,$6B               ;0A9953|        |      ;
                       db $00,$00,$00,$00,$91               ;0A9958|        |      ;
                       db $6B,$00,$0B,$95,$00               ;0A995D|        |      ;
                       db $6D,$00,$A0,$6B,$00               ;0A9962|        |      ;
                       db $00,$A1,$0B,$A2,$00               ;0A9967|        |      ;
                       db $00,$6B,$A2,$0B,$00               ;0A996C|        |      ;
                       db $6B,$00,$0B,$6D,$6B               ;0A9971|        |      ;
                       db $A3,$0B,$92,$00,$96               ;0A9976|        |      ;
                       db $00,$00                           ;0A997B|        |      ;
 
         DATA8_0A997D: db $00,$00,$00,$00,$00               ;0A997D|        |      ;
                       db $00,$1E,$00,$00,$00               ;0A9982|        |      ;
                       db $00,$00                           ;0A9987|        |      ;
 
         DATA8_0A9989: db $00,$00,$00,$97,$00               ;0A9989|        |      ;
                       db $00,$00,$65,$C0,$6A               ;0A998E|        |      ;
                       db $6B,$00,$6B,$00,$00               ;0A9993|        |      ;
 
                       db $68,$8B,$6D,$8B,$68               ;0A9998|        |      ;
                       db $0B,$68,$8A,$00,$00               ;0A999D|        |      ;
                       db $61,$00,$00                       ;0A99A2|        |      ;
 
         DATA8_0A99A5: db $00,$00,$00,$59,$85               ;0A99A5|        |      ;
                       db $66,$86,$00,$68,$A2               ;0A99AA|        |      ;
                       db $00,$9D,$00,$94,$89               ;0A99AF|        |      ;
                       db $00,$57,$07,$00,$00               ;0A99B4|        |      ;
 
         DATA8_0A99B9: db $00,$00,$00,$90,$00               ;0A99B9|        |      ;
                       db $AB,$00,$00,$D3,$90               ;0A99BE|        |      ;
                       db $00,$00,$00,$00,$D3               ;0A99C3|        |      ;
                       db $AA,$00,$6C,$00,$00               ;0A99C8|        |      ;
 
         DATA8_0A99CD: db $00,$00,$00,$59,$00               ;0A99CD|        |      ;
                       db $59,$C1,$5C,$00,$59               ;0A99D2|        |      ;
                       db $C1,$A9,$00,$00,$00               ;0A99D7|        |      ;
                       db $00,$00,$F6,$00,$A2               ;0A99DC|        |      ;
                       db $00,$4C,$71,$00,$72               ;0A99E1|        |      ;
                       db $50,$00,$53,$00,$97               ;0A99E6|        |      ;
                       db $71,$68,$00,$6D,$00               ;0A99EB|        |      ;
                       db $00                               ;0A99F0|        |      ;
 
         DATA8_0A99F1: db $00,$00,$00,$F3,$8E               ;0A99F1|        |      ;
                       db $AC,$95,$AC,$00,$90               ;0A99F6|        |      ;
                       db $95,$9A,$8F,$AE,$95               ;0A99FB|        |      ;
                       db $AE,$00,$99,$00,$00               ;0A9A00|        |      ;
 
         DATA8_0A9A05: db $00,$00,$00,$AD,$00               ;0A9A05|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9A0A|        |      ;
                       db $00,$00                           ;0A9A0F|        |      ;
 
         DATA8_0A9A11: db $00,$00,$00,$F3,$71               ;0A9A11|        |      ;
                       db $5C,$C2,$3A,$00,$00               ;0A9A16|        |      ;
                       db $C2,$72,$8D,$B0,$C2               ;0A9A1B|        |      ;
                       db $00,$00,$72,$00,$00               ;0A9A20|        |      ;
 
         DATA8_0A9A25: db $00,$00,$00,$90,$C4               ;0A9A25|        |      ;
                       db $77,$00,$AC,$00,$AE               ;0A9A2A|        |      ;
                       db $00,$9B,$00,$00,$00               ;0A9A2F|        |      ;
                       db $77,$00,$96,$00,$00               ;0A9A34|        |      ;
                       db $4B,$00,$90,$00,$00               ;0A9A39|        |      ;
                       db $9B,$00,$00,$00,$6A               ;0A9A3E|        |      ;
                       db $00,$BC,$00,$00,$00               ;0A9A43|        |      ;
                       db $00                               ;0A9A48|        |      ;
 
         DATA8_0A9A49: db $00,$00,$00,$AF,$13               ;0A9A49|        |      ;
                       db $00,$00,$B0,$00,$00               ;0A9A4E|        |      ;
                       db $00,$00,$00,$00,$1F               ;0A9A53|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9A58|        |      ;
 
         DATA8_0A9A5D: db $00,$00,$00,$9D,$00               ;0A9A5D|        |      ;
                       db $96,$1C,$A1,$1C,$96               ;0A9A62|        |      ;
                       db $00,$00,$00,$AF,$92               ;0A9A67|        |      ;
                       db $92,$00,$59,$00,$6A               ;0A9A6C|        |      ;
                       db $00,$96,$00,$B1,$93               ;0A9A71|        |      ;
                       db $00,$00,$92,$92,$3C               ;0A9A76|        |      ;
                       db $93,$6C,$00,$AB,$00               ;0A9A7B|        |      ;
                       db $00                               ;0A9A80|        |      ;
 
         DATA8_0A9A81: db $00,$00,$8C,$00,$00               ;0A9A81|        |      ;
                       db $00,$00,$B5,$00,$B4               ;0A9A86|        |      ;
                       db $6E,$9D,$94,$B2,$00               ;0A9A8B|        |      ;
                       db $B3,$00,$63,$00,$00               ;0A9A90|        |      ;
 
         DATA8_0A9A95: db $00,$00,$00,$00,$00               ;0A9A95|        |      ;
                       db $00,$03,$00,$00,$00               ;0A9A9A|        |      ;
                       db $00,$74,$00,$00,$00               ;0A9A9F|        |      ;
                       db $00,$00,$00,$14,$00               ;0A9AA4|        |      ;
                       db $00,$62,$C5,$3F,$00               ;0A9AA9|        |      ;
                       db $B6,$A5,$78,$00,$00               ;0A9AAE|        |      ;
                       db $00,$00,$00,$00,$14               ;0A9AB3|        |      ;
                       db $3F,$C3,$2F,$00,$BE               ;0A9AB8|        |      ;
                       db $00,$00,$00,$00                   ;0A9ABD|        |      ;
 
         DATA8_0A9AC1: db $00,$00,$00,$00,$70               ;0A9AC1|        |      ;
                       db $61,$00,$00,$70,$65               ;0A9AC6|        |      ;
                       db $00,$64,$70,$65,$00               ;0A9ACB|        |      ;
                       db $62,$70,$63,$00,$00               ;0A9AD0|        |      ;
 
         DATA8_0A9AD5: db $00,$00,$35,$00,$00               ;0A9AD5|        |      ;
                       db $00,$00,$59,$00,$59               ;0A9ADA|        |      ;
                       db $00,$67,$39,$50,$00               ;0A9ADF|        |      ;
                       db $59,$00,$59,$00,$00               ;0A9AE4|        |      ;
                       db $56,$5E,$00,$5F,$00               ;0A9AE9|        |      ;
                       db $60,$56,$3A,$00,$00               ;0A9AEE|        |      ;
                       db $00,$EB,$00,$59,$00               ;0A9AF3|        |      ;
                       db $4B,$33,$5C,$00,$5B               ;0A9AF8|        |      ;
                       db $00,$5A,$00,$00                   ;0A9AFD|        |      ;
 
         DATA8_0A9B01: db $00,$00,$35,$00,$00               ;0A9B01|        |      ;
                       db $00,$00,$3A,$00,$3A               ;0A9B06|        |      ;
                       db $00,$3A,$00,$59,$00               ;0A9B0B|        |      ;
                       db $00,$00,$6C,$00,$6D               ;0A9B10|        |      ;
                       db $00,$00,$00,$5C,$00               ;0A9B15|        |      ;
                       db $00,$54,$6C,$54,$3A               ;0A9B1A|        |      ;
                       db $54,$59,$55,$66,$55               ;0A9B1F|        |      ;
                       db $00,$55,$68,$54,$68               ;0A9B24|        |      ;
                       db $54,$00,$00,$00                   ;0A9B29|        |      ;
 
         DATA8_0A9B2D: db $00,$00,$00,$00,$00               ;0A9B2D|        |      ;
                       db $61,$00,$5D,$00,$00               ;0A9B32|        |      ;
                       db $50,$63,$00,$6F,$00               ;0A9B37|        |      ;
                       db $6F,$00,$6F,$00,$6F               ;0A9B3C|        |      ;
                       db $00,$6F,$4F,$00,$00               ;0A9B41|        |      ;
                       db $00,$00,$6A,$00,$3A               ;0A9B46|        |      ;
                       db $00,$6E,$00,$00,$00               ;0A9B4B|        |      ;
                       db $00                               ;0A9B50|        |      ;
 
         DATA8_0A9B51: db $00,$00,$00,$00,$00               ;0A9B51|        |      ;
                       db $72,$00,$6D,$00,$71               ;0A9B56|        |      ;
                       db $00,$00,$00,$00,$53               ;0A9B5B|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9B60|        |      ;
                       db $00,$00,$20,$00,$00               ;0A9B65|        |      ;
                       db $00,$00,$00                       ;0A9B6A|        |      ;
 
         DATA8_0A9B6D: db $00,$00,$00,$00,$DE               ;0A9B6D|        |      ;
                       db $9D,$55,$00,$00,$9A               ;0A9B72|        |      ;
                       db $BF,$D2,$55,$3A,$DE               ;0A9B77|        |      ;
                       db $90,$55,$9C,$00,$93               ;0A9B7C|        |      ;
                       db $BF,$90,$55,$B8,$DE               ;0A9B81|        |      ;
                       db $00,$BF,$00,$55,$3F               ;0A9B86|        |      ;
                       db $00,$A9,$00,$00,$DE               ;0A9B8B|        |      ;
                       db $C4,$BF,$00,$55,$C3               ;0A9B90|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9B95|        |      ;
                       db $00,$00,$00,$20,$00               ;0A9B9A|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9B9F|        |      ;
                       db $00,$00,$3A,$00,$6A               ;0A9BA4|        |      ;
                       db $55,$3A,$BF,$D8,$DE               ;0A9BA9|        |      ;
                       db $3A,$55,$3A,$00,$6A               ;0A9BAE|        |      ;
                       db $55,$00,$BF,$33,$DE               ;0A9BB3|        |      ;
                       db $90,$55,$68,$BF,$90               ;0A9BB8|        |      ;
                       db $00,$3F,$55,$3F,$DE               ;0A9BBD|        |      ;
                       db $6C,$00,$00                       ;0A9BC2|        |      ;
 
         DATA8_0A9BC5: db $F1,$9B,$F5,$9B                   ;0A9BC5|        |      ;
 
         DATA8_0A9BC9: db $FB,$9B,$FF,$9B,$01               ;0A9BC9|        |      ;
                       db $9C,$03,$9C,$07,$9C               ;0A9BCE|        |      ;
                       db $0D,$9C,$11,$9C                   ;0A9BD3|        |      ;
 
         DATA8_0A9BD7: db $17,$9C,$1B,$9C,$1F               ;0A9BD7|        |      ;
                       db $9C                               ;0A9BDC|        |      ;
 
         DATA8_0A9BDD: db $25,$9C,$29,$9C,$2D               ;0A9BDD|        |      ;
                       db $9C                               ;0A9BE2|        |      ;
 
         DATA8_0A9BE3: db $2F,$9C,$35,$9C,$3B               ;0A9BE3|        |      ;
                       db $9C,$41,$9C                       ;0A9BE8|        |      ;
 
         DATA8_0A9BEB: db $45,$9C,$4B,$9C,$4F               ;0A9BEB|        |      ;
                       db $9C,$53,$9C,$6F,$9C               ;0A9BF0|        |      ;
                       db $8B,$9C,$9F,$9C,$C3               ;0A9BF5|        |      ;
                       db $9C,$D7,$9C,$E3,$9C               ;0A9BFA|        |      ;
                       db $EF,$9C,$03,$9D,$0F               ;0A9BFF|        |      ;
                       db $9D,$2B,$9D,$08,$AF               ;0A9C04|        |      ;
                       db $47,$9D,$5B,$9D,$6F               ;0A9C09|        |      ;
                       db $9D,$8B,$9D,$A7,$9D               ;0A9C0E|        |      ;
                       db $17,$AF,$B3,$9D,$C7               ;0A9C13|        |      ;
                       db $9D,$EB,$9D,$FF,$9D               ;0A9C18|        |      ;
                       db $1B,$9E,$37,$9E,$B2               ;0A9C1D|        |      ;
                       db $AF,$4B,$9E,$67,$9E               ;0A9C22|        |      ;
                       db $8B,$9E,$9F,$9E,$B3               ;0A9C27|        |      ;
                       db $9E,$C7,$9E,$03,$9F               ;0A9C2C|        |      ;
                       db $0F,$9F,$3B,$9F,$47               ;0A9C31|        |      ;
                       db $9F,$D6,$AF,$5B,$9F               ;0A9C36|        |      ;
                       db $67,$9F,$0F,$B0,$73               ;0A9C3B|        |      ;
                       db $9F,$7F,$9F,$9B,$9F               ;0A9C40|        |      ;
                       db $B7,$9F,$B1,$B0,$CB               ;0A9C45|        |      ;
                       db $9F,$DF,$9F,$F3,$9F               ;0A9C4A|        |      ;
                       db $0F,$A0,$23,$A0,$00               ;0A9C4F|        |      ;
                       db $00,$00,$9D,$0B,$6C               ;0A9C54|        |      ;
                       db $00,$68,$00,$00,$00               ;0A9C59|        |      ;
                       db $00,$B9,$C3,$0B,$EA               ;0A9C5E|        |      ;
                       db $00,$AE,$00,$E9,$00               ;0A9C63|        |      ;
                       db $42,$00,$00,$0B,$00               ;0A9C68|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9C6D|        |      ;
                       db $92,$00,$9D,$BC,$9D               ;0A9C72|        |      ;
                       db $00,$9D,$BC,$5C,$B6               ;0A9C77|        |      ;
                       db $4B,$B6,$5C,$00,$33               ;0A9C7C|        |      ;
                       db $00,$E4,$B5,$6C,$00               ;0A9C81|        |      ;
                       db $68,$00,$EB,$00,$00               ;0A9C86|        |      ;
                       db $00,$00,$00,$90,$15               ;0A9C8B|        |      ;
                       db $C0,$00,$00,$00,$68               ;0A9C90|        |      ;
                       db $00,$00,$64,$C6,$BE               ;0A9C95|        |      ;
                       db $59,$00,$96,$00,$00               ;0A9C9A|        |      ;
                       db $00,$00,$00,$42,$00               ;0A9C9F|        |      ;
                       db $3B,$00,$3B,$59,$9D               ;0A9CA4|        |      ;
                       db $0B,$00,$00,$74,$00               ;0A9CA9|        |      ;
                       db $74,$00,$C7,$00,$9D               ;0A9CAE|        |      ;
                       db $0B,$9D,$00,$00,$58               ;0A9CB3|        |      ;
                       db $00,$00,$00,$98,$99               ;0A9CB8|        |      ;
                       db $00,$68,$00,$A2,$00               ;0A9CBD|        |      ;
                       db $00,$00,$00,$02,$00               ;0A9CC2|        |      ;
                       db $00,$00,$BD,$95,$00               ;0A9CC7|        |      ;
                       db $68,$00,$00,$00,$00               ;0A9CCC|        |      ;
                       db $24,$00,$00,$00,$00               ;0A9CD1|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9CD6|        |      ;
                       db $5D,$D1,$00,$4D,$31               ;0A9CDB|        |      ;
                       db $27,$00,$00,$00,$00               ;0A9CE0|        |      ;
                       db $00,$00,$00,$00,$A2               ;0A9CE5|        |      ;
                       db $00,$26,$00,$00,$00               ;0A9CEA|        |      ;
                       db $00,$00,$00,$90,$0B               ;0A9CEF|        |      ;
                       db $50,$00,$D2,$0B,$00               ;0A9CF4|        |      ;
                       db $00,$FC,$0B,$D2,$00               ;0A9CF9|        |      ;
                       db $65,$0B,$00,$00,$00               ;0A9CFE|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D03|        |      ;
                       db $00,$00,$00,$A3,$00               ;0A9D08|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D0D|        |      ;
                       db $B3,$17,$00,$00,$00               ;0A9D12|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D17|        |      ;
                       db $00,$17,$00,$00,$00               ;0A9D1C|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D21|        |      ;
                       db $00,$17,$65,$00,$00               ;0A9D26|        |      ;
                       db $00,$00,$00,$93,$33               ;0A9D2B|        |      ;
                       db $59,$95,$59,$39,$C0               ;0A9D30|        |      ;
                       db $95,$FB,$00,$58,$00               ;0A9D35|        |      ;
                       db $D4,$33,$68,$00,$00               ;0A9D3A|        |      ;
                       db $00,$00,$1E,$00,$00               ;0A9D3F|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D44|        |      ;
                       db $00,$00,$30,$00,$00               ;0A9D49|        |      ;
                       db $2F,$00,$DE,$30,$6B               ;0A9D4E|        |      ;
                       db $64,$00,$00,$00,$30               ;0A9D53|        |      ;
                       db $C3,$00,$00,$00,$00               ;0A9D58|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D5D|        |      ;
                       db $00,$00,$00,$88,$00               ;0A9D62|        |      ;
                       db $00,$00,$88,$00,$00               ;0A9D67|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9D6C|        |      ;
                       db $00,$D5,$0B,$00,$00               ;0A9D71|        |      ;
                       db $00,$00,$00,$0B,$00               ;0A9D76|        |      ;
                       db $00,$65,$00,$65,$00               ;0A9D7B|        |      ;
                       db $00,$00,$00,$0B,$B8               ;0A9D80|        |      ;
                       db $00,$96,$00,$50,$00               ;0A9D85|        |      ;
                       db $00,$00,$00,$00,$94               ;0A9D8A|        |      ;
                       db $09,$59,$00,$90,$00               ;0A9D8F|        |      ;
                       db $93,$00,$39,$00,$90               ;0A9D94|        |      ;
                       db $09,$63,$00,$90,$00               ;0A9D99|        |      ;
                       db $9D,$00,$92,$00,$94               ;0A9D9E|        |      ;
                       db $09,$94,$00,$00,$00               ;0A9DA3|        |      ;
                       db $00,$30,$90,$2F,$00               ;0A9DA8|        |      ;
                       db $00,$96,$00,$96,$00               ;0A9DAD|        |      ;
                       db $00,$00,$00,$00,$9D               ;0A9DB2|        |      ;
                       db $34,$90,$94,$4B,$00               ;0A9DB7|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9DBC|        |      ;
                       db $2D,$00,$00,$00,$00               ;0A9DC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9DC6|        |      ;
                       db $00,$65,$00,$43,$33               ;0A9DCB|        |      ;
                       db $9D,$00,$00,$00,$D7               ;0A9DD0|        |      ;
                       db $8D,$9D,$00,$00,$00               ;0A9DD5|        |      ;
                       db $00,$00,$00,$00,$D8               ;0A9DDA|        |      ;
                       db $00,$00,$A7,$42,$A6               ;0A9DDF|        |      ;
                       db $00,$69,$93,$00,$00               ;0A9DE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9DE9|        |      ;
                       db $C9,$4E,$98,$00,$C8               ;0A9DEE|        |      ;
                       db $00,$C0,$00,$48,$00               ;0A9DF3|        |      ;
                       db $00,$00,$CB,$4E,$00               ;0A9DF8|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9DFD|        |      ;
                       db $78,$00,$CA,$00,$9D               ;0A9E02|        |      ;
                       db $AE,$65,$00,$CC,$AF               ;0A9E07|        |      ;
                       db $76,$B0,$CC,$AF,$76               ;0A9E0C|        |      ;
                       db $B0,$00,$AE,$FD,$00               ;0A9E11|        |      ;
                       db $CE,$00,$74,$00,$00               ;0A9E16|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E1B|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E20|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E25|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E2A|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E2F|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E34|        |      ;
                       db $00,$AC,$64,$9D,$00               ;0A9E39|        |      ;
                       db $00,$00,$96,$00,$00               ;0A9E3E|        |      ;
                       db $00,$00,$2D,$00,$00               ;0A9E43|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E48|        |      ;
                       db $00,$90,$00,$65,$A5               ;0A9E4D|        |      ;
                       db $00,$88,$00,$00,$00               ;0A9E52|        |      ;
                       db $9B,$90,$A5,$00,$88               ;0A9E57|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E5C|        |      ;
                       db $9C,$6C,$00,$00,$00               ;0A9E61|        |      ;
                       db $00,$00,$00,$B1,$AE               ;0A9E66|        |      ;
                       db $0B,$E3,$00,$AD,$00               ;0A9E6B|        |      ;
                       db $00,$00,$AE,$00,$AE               ;0A9E70|        |      ;
                       db $0B,$00,$B1,$AE,$00               ;0A9E75|        |      ;
                       db $AE,$00,$00,$00,$C0               ;0A9E7A|        |      ;
                       db $00,$B8,$B0,$A9,$00               ;0A9E7F|        |      ;
                       db $BF,$98,$9B,$00,$BF               ;0A9E84|        |      ;
                       db $00,$00,$00,$00,$30               ;0A9E89|        |      ;
                       db $6F,$00,$BB,$75,$BB               ;0A9E8E|        |      ;
                       db $30,$42,$75,$42,$30               ;0A9E93|        |      ;
                       db $00,$75,$C0,$00,$00               ;0A9E98|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9E9D|        |      ;
                       db $9B,$23,$72,$77,$E4               ;0A9EA2|        |      ;
                       db $00,$AB,$9A,$6C,$61               ;0A9EA7|        |      ;
                       db $72,$A4,$AB,$00,$C0               ;0A9EAC|        |      ;
                       db $00,$00,$00,$00,$99               ;0A9EB1|        |      ;
                       db $95,$00,$BF,$98,$C1               ;0A9EB6|        |      ;
                       db $00,$95,$9A,$6C,$9A               ;0A9EBB|        |      ;
                       db $6A,$98,$6C,$00,$3F               ;0A9EC0|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9EC5|        |      ;
                       db $42,$00,$B7,$00,$35               ;0A9ECA|        |      ;
                       db $00,$C2,$00,$C3,$00               ;0A9ECF|        |      ;
                       db $3E,$00,$C3,$00,$3E               ;0A9ED4|        |      ;
                       db $00,$C3,$00,$00,$00               ;0A9ED9|        |      ;
                       db $43,$00,$3E,$00,$9B               ;0A9EDE|        |      ;
                       db $00,$EF,$00,$9B,$96               ;0A9EE3|        |      ;
                       db $C3,$00,$A7,$00,$C3               ;0A9EE8|        |      ;
                       db $00,$3D,$00,$00,$00               ;0A9EED|        |      ;
                       db $00,$00,$00,$2B,$00               ;0A9EF2|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9EF7|        |      ;
                       db $00,$00,$00,$2B,$00               ;0A9EFC|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9F01|        |      ;
                       db $00,$00,$9D,$00,$00               ;0A9F06|        |      ;
                       db $00,$96,$00,$00,$00               ;0A9F0B|        |      ;
                       db $00,$00,$6E,$00,$00               ;0A9F10|        |      ;
                       db $00,$DC,$00,$00,$00               ;0A9F15|        |      ;
                       db $00,$4E,$00,$00,$00               ;0A9F1A|        |      ;
                       db $00,$2F,$00,$00,$4E               ;0A9F1F|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9F24|        |      ;
                       db $00,$00,$4E,$00,$00               ;0A9F29|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9F2E|        |      ;
                       db $00,$68,$00,$68,$00               ;0A9F33|        |      ;
                       db $90,$00,$00,$00,$00               ;0A9F38|        |      ;
                       db $00,$DA,$00,$D9,$00               ;0A9F3D|        |      ;
                       db $00,$00,$D2,$00,$00               ;0A9F42|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9F47|        |      ;
                       db $90,$00,$00,$00,$00               ;0A9F4C|        |      ;
                       db $00,$00,$00,$99,$00               ;0A9F51|        |      ;
                       db $DB,$00,$68,$00,$00               ;0A9F56|        |      ;
                       db $00,$00,$00,$9D,$00               ;0A9F5B|        |      ;
                       db $00,$AA,$00,$00,$DD               ;0A9F60|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9F65|        |      ;
                       db $DE,$5A,$00,$C6,$C4               ;0A9F6A|        |      ;
                       db $00,$C3,$00,$00,$00               ;0A9F6F|        |      ;
                       db $00,$00,$00,$0B,$00               ;0A9F74|        |      ;
                       db $D3,$00,$34,$95,$00               ;0A9F79|        |      ;
                       db $00,$00,$00,$80,$DF               ;0A9F7E|        |      ;
                       db $80,$E0,$AC,$00,$A8               ;0A9F83|        |      ;
                       db $95,$A9,$50,$00,$4B               ;0A9F88|        |      ;
                       db $AB,$6B,$3E,$4C,$AC               ;0A9F8D|        |      ;
                       db $00,$9B,$D5,$00,$00               ;0A9F92|        |      ;
                       db $A8,$3F,$00,$00,$00               ;0A9F97|        |      ;
                       db $00,$00,$00,$2C,$00               ;0A9F9C|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9FA1|        |      ;
                       db $00,$00,$92,$00,$94               ;0A9FA6|        |      ;
                       db $00,$00,$9D,$E1,$00               ;0A9FAB|        |      ;
                       db $94,$00,$00,$00,$00               ;0A9FB0|        |      ;
                       db $00,$00,$00,$00,$B3               ;0A9FB5|        |      ;
                       db $C3,$00,$00,$0B,$42               ;0A9FBA|        |      ;
                       db $00,$F8,$00,$00,$B2               ;0A9FBF|        |      ;
                       db $3A,$0B,$C3,$00,$9B               ;0A9FC4|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9FC9|        |      ;
                       db $3E,$AD,$BC,$80,$42               ;0A9FCE|        |      ;
                       db $00,$AE,$80,$96,$00               ;0A9FD3|        |      ;
                       db $00,$22,$E2,$00,$96               ;0A9FD8|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9FDD|        |      ;
                       db $9D,$15,$50,$64,$9D               ;0A9FE2|        |      ;
                       db $00,$25,$00,$68,$67               ;0A9FE7|        |      ;
                       db $6D,$30,$C3,$00,$D0               ;0A9FEC|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9FF1|        |      ;
                       db $00,$00,$00,$00,$00               ;0A9FF6|        |      ;
                       db $0B,$00,$00,$00,$00               ;0A9FFB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AA000|        |      ;
                       db $00,$00,$00,$00,$0B               ;0AA005|        |      ;
                       db $00,$00,$00,$00,$00               ;0AA00A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AA00F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AA014|        |      ;
                       db $00,$00,$00,$00,$00               ;0AA019|        |      ;
                       db $3B,$00,$96,$00,$00               ;0AA01E|        |      ;
                       db $00,$00,$2E,$00,$00               ;0AA023|        |      ;
                       db $00,$00,$00,$00,$4B               ;0AA028|        |      ;
                       db $00,$69,$00,$6D,$00               ;0AA02D|        |      ;
                       db $96,$00,$96,$00,$00               ;0AA032|        |      ;
                       db $00,$00,$00,$00,$00               ;0AA037|        |      ;
                       db $00,$00,$00                       ;0AA03C|        |      ;
 
         PTR16_0AA03F: dw DATA8_0AA207                      ;0AA03F|        |0AA207;
                       dw DATA8_0AA20C                      ;0AA041|        |0AA20C;
                       dw DATA8_0AA211                      ;0AA043|        |0AA211;
                       dw DATA8_0AA216                      ;0AA045|        |0AA216;
                       dw DATA8_0AA21B                      ;0AA047|        |0AA21B;
                       dw DATA8_0AA220                      ;0AA049|        |0AA220;
                       dw DATA8_0AA225                      ;0AA04B|        |0AA225;
                       dw DATA8_0AA22A                      ;0AA04D|        |0AA22A;
                       dw DATA8_0AA22F                      ;0AA04F|        |0AA22F;
                       dw DATA8_0AA234                      ;0AA051|        |0AA234;
                       dw DATA8_0AA239                      ;0AA053|        |0AA239;
                       dw DATA8_0AA23E                      ;0AA055|        |0AA23E;
                       dw DATA8_0AA243                      ;0AA057|        |0AA243;
                       dw DATA8_0AA248                      ;0AA059|        |0AA248;
                       dw DATA8_0AA24D                      ;0AA05B|        |0AA24D;
                       dw DATA8_0AA252                      ;0AA05D|        |0AA252;
                       dw DATA8_0AA257                      ;0AA05F|        |0AA257;
                       dw DATA8_0AA25C                      ;0AA061|        |0AA25C;
 
                       dw DATA8_0AA261                      ;0AA063|        |0AA261;
                       dw DATA8_0AA266                      ;0AA065|        |0AA266;
                       dw DATA8_0AA26B                      ;0AA067|        |0AA26B;
 
                       dw DATA8_0AA270                      ;0AA069|        |0AA270;
                       dw DATA8_0AA275                      ;0AA06B|        |0AA275;
                       dw DATA8_0AA27A                      ;0AA06D|        |0AA27A;
                       dw DATA8_0AA27F                      ;0AA06F|        |0AA27F;
                       dw DATA8_0AA284                      ;0AA071|        |0AA284;
                       dw DATA8_0AA289                      ;0AA073|        |0AA289;
                       dw DATA8_0AA28E                      ;0AA075|        |0AA28E;
                       dw DATA8_0AA293                      ;0AA077|        |0AA293;
                       dw DATA8_0AA298                      ;0AA079|        |0AA298;
                       dw DATA8_0AA29D                      ;0AA07B|        |0AA29D;
                       dw DATA8_0AA2A2                      ;0AA07D|        |0AA2A2;
                       dw DATA8_0AA2A7                      ;0AA07F|        |0AA2A7;
                       dw DATA8_0AA2AC                      ;0AA081|        |0AA2AC;
                       dw DATA8_0AA2B1                      ;0AA083|        |0AA2B1;
                       dw DATA8_0AA2B6                      ;0AA085|        |0AA2B6;
                       dw DATA8_0AA2BB                      ;0AA087|        |0AA2BB;
                       dw DATA8_0AA2C0                      ;0AA089|        |0AA2C0;
                       dw DATA8_0AA2C5                      ;0AA08B|        |0AA2C5;
                       dw DATA8_0AA2CA                      ;0AA08D|        |0AA2CA;
                       dw DATA8_0AA2CF                      ;0AA08F|        |0AA2CF;
                       dw DATA8_0AA2D4                      ;0AA091|        |0AA2D4;
                       dw DATA8_0AA2D9                      ;0AA093|        |0AA2D9;
                       dw DATA8_0AA2DE                      ;0AA095|        |0AA2DE;
                       dw DATA8_0AA2E3                      ;0AA097|        |0AA2E3;
                       dw DATA8_0AA2E8                      ;0AA099|        |0AA2E8;
                       dw DATA8_0AA2ED                      ;0AA09B|        |0AA2ED;
                       dw DATA8_0AA2F2                      ;0AA09D|        |0AA2F2;
                       dw DATA8_0AA2F7                      ;0AA09F|        |0AA2F7;
                       dw DATA8_0AA2FC                      ;0AA0A1|        |0AA2FC;
                       dw DATA8_0AA301                      ;0AA0A3|        |0AA301;
                       dw DATA8_0AA306                      ;0AA0A5|        |0AA306;
                       dw DATA8_0AA30B                      ;0AA0A7|        |0AA30B;
                       dw DATA8_0AA310                      ;0AA0A9|        |0AA310;
                       dw DATA8_0AA315                      ;0AA0AB|        |0AA315;
                       dw DATA8_0AA31A                      ;0AA0AD|        |0AA31A;
                       dw DATA8_0AA31F                      ;0AA0AF|        |0AA31F;
                       dw DATA8_0AA324                      ;0AA0B1|        |0AA324;
                       dw DATA8_0AA329                      ;0AA0B3|        |0AA329;
                       dw DATA8_0AA32E                      ;0AA0B5|        |0AA32E;
                       dw DATA8_0AA333                      ;0AA0B7|        |0AA333;
                       dw DATA8_0AA338                      ;0AA0B9|        |0AA338;
                       dw DATA8_0AA33D                      ;0AA0BB|        |0AA33D;
                       dw DATA8_0AA342                      ;0AA0BD|        |0AA342;
                       dw DATA8_0AA347                      ;0AA0BF|        |0AA347;
                       dw DATA8_0AA34C                      ;0AA0C1|        |0AA34C;
                       dw DATA8_0AA351                      ;0AA0C3|        |0AA351;
                       dw DATA8_0AA356                      ;0AA0C5|        |0AA356;
                       dw DATA8_0AA35B                      ;0AA0C7|        |0AA35B;
                       dw DATA8_0AA360                      ;0AA0C9|        |0AA360;
                       dw DATA8_0AA365                      ;0AA0CB|        |0AA365;
                       dw DATA8_0AA36A                      ;0AA0CD|        |0AA36A;
                       dw DATA8_0AA36F                      ;0AA0CF|        |0AA36F;
                       dw DATA8_0AA374                      ;0AA0D1|        |0AA374;
                       dw DATA8_0AA379                      ;0AA0D3|        |0AA379;
                       dw DATA8_0AA37E                      ;0AA0D5|        |0AA37E;
                       dw DATA8_0AA383                      ;0AA0D7|        |0AA383;
                       dw DATA8_0AA388                      ;0AA0D9|        |0AA388;
                       dw DATA8_0AA38D                      ;0AA0DB|        |0AA38D;
                       dw DATA8_0AA392                      ;0AA0DD|        |0AA392;
                       dw DATA8_0AA397                      ;0AA0DF|        |0AA397;
                       dw DATA8_0AA39C                      ;0AA0E1|        |0AA39C;
                       dw DATA8_0AA3A1                      ;0AA0E3|        |0AA3A1;
                       dw DATA8_0AA3A6                      ;0AA0E5|        |0AA3A6;
                       dw DATA8_0AA3AB                      ;0AA0E7|        |0AA3AB;
                       dw DATA8_0AA3B0                      ;0AA0E9|        |0AA3B0;
                       dw DATA8_0AA3B5                      ;0AA0EB|        |0AA3B5;
                       dw DATA8_0AA3BA                      ;0AA0ED|        |0AA3BA;
                       dw DATA8_0AA3BF                      ;0AA0EF|        |0AA3BF;
                       dw DATA8_0AA3C4                      ;0AA0F1|        |0AA3C4;
                       dw DATA8_0AA3C9                      ;0AA0F3|        |0AA3C9;
                       dw DATA8_0AA3CE                      ;0AA0F5|        |0AA3CE;
                       dw DATA8_0AA3CE                      ;0AA0F7|        |0AA3CE;
                       dw DATA8_0AA3D3                      ;0AA0F9|        |0AA3D3;
                       dw DATA8_0AA3D8                      ;0AA0FB|        |0AA3D8;
                       dw DATA8_0AA3DD                      ;0AA0FD|        |0AA3DD;
                       dw DATA8_0AA3E2                      ;0AA0FF|        |0AA3E2;
                       dw DATA8_0AA3E7                      ;0AA101|        |0AA3E7;
                       dw DATA8_0AA3EC                      ;0AA103|        |0AA3EC;
                       dw DATA8_0AA3F1                      ;0AA105|        |0AA3F1;
                       dw DATA8_0AA3F6                      ;0AA107|        |0AA3F6;
                       dw DATA8_0AA3FB                      ;0AA109|        |0AA3FB;
                       dw DATA8_0AA400                      ;0AA10B|        |0AA400;
                       dw DATA8_0AA405                      ;0AA10D|        |0AA405;
                       dw DATA8_0AA40A                      ;0AA10F|        |0AA40A;
                       dw DATA8_0AA40F                      ;0AA111|        |0AA40F;
                       dw DATA8_0AA414                      ;0AA113|        |0AA414;
                       dw DATA8_0AA419                      ;0AA115|        |0AA419;
                       dw DATA8_0AA41E                      ;0AA117|        |0AA41E;
                       dw DATA8_0AA423                      ;0AA119|        |0AA423;
                       dw DATA8_0AA428                      ;0AA11B|        |0AA428;
                       dw DATA8_0AA42D                      ;0AA11D|        |0AA42D;
                       dw DATA8_0AA432                      ;0AA11F|        |0AA432;
                       dw PTR16_0AA437                      ;0AA121|        |0AA437;
                       dw DATA8_0AA43C                      ;0AA123|        |0AA43C;
                       dw DATA8_0AA441                      ;0AA125|        |0AA441;
                       dw DATA8_0AA446                      ;0AA127|        |0AA446;
                       dw DATA8_0AA44B                      ;0AA129|        |0AA44B;
                       dw DATA8_0AA450                      ;0AA12B|        |0AA450;
                       dw DATA8_0AA455                      ;0AA12D|        |0AA455;
                       dw DATA8_0AA45A                      ;0AA12F|        |0AA45A;
                       dw DATA8_0AA45F                      ;0AA131|        |0AA45F;
                       dw DATA8_0AA464                      ;0AA133|        |0AA464;
                       dw DATA8_0AA469                      ;0AA135|        |0AA469;
                       dw DATA8_0AA46E                      ;0AA137|        |0AA46E;
                       dw PTR16_0AA473                      ;0AA139|        |0AA473;
                       dw DATA8_0AA478                      ;0AA13B|        |0AA478;
                       dw DATA8_0AA47D                      ;0AA13D|        |0AA47D;
 
         PTR16_0AA13F: dw DATA8_0AA482                      ;0AA13F|        |0AA482;
                       dw PTR16_0AA487                      ;0AA141|        |0AA487;
                       dw PTR16_0AA48C                      ;0AA143|        |0AA48C;
                       dw PTR16_0AA491                      ;0AA145|        |0AA491;
                       dw DATA8_0AA496                      ;0AA147|        |0AA496;
                       dw DATA8_0AA49B                      ;0AA149|        |0AA49B;
                       dw DATA8_0AA4A0                      ;0AA14B|        |0AA4A0;
                       dw DATA8_0AA4A5                      ;0AA14D|        |0AA4A5;
                       dw DATA8_0AA4AA                      ;0AA14F|        |0AA4AA;
                       dw DATA8_0AA4AF                      ;0AA151|        |0AA4AF;
                       dw DATA8_0AA4B4                      ;0AA153|        |0AA4B4;
                       dw DATA8_0AA4B9                      ;0AA155|        |0AA4B9;
                       dw DATA8_0AA4BE                      ;0AA157|        |0AA4BE;
                       dw DATA8_0AA4C3                      ;0AA159|        |0AA4C3;
                       dw DATA8_0AA4C8                      ;0AA15B|        |0AA4C8;
                       dw DATA8_0AA4CD                      ;0AA15D|        |0AA4CD;
                       dw DATA8_0AA4D2                      ;0AA15F|        |0AA4D2;
                       dw DATA8_0AA4D7                      ;0AA161|        |0AA4D7;
                       dw DATA8_0AA4DC                      ;0AA163|        |0AA4DC;
                       dw DATA8_0AA4E1                      ;0AA165|        |0AA4E1;
                       dw DATA8_0AA4E6                      ;0AA167|        |0AA4E6;
                       dw DATA8_0AA4EB                      ;0AA169|        |0AA4EB;
                       dw DATA8_0AA4F0                      ;0AA16B|        |0AA4F0;
                       dw DATA8_0AA4F5                      ;0AA16D|        |0AA4F5;
                       dw DATA8_0AA4FA                      ;0AA16F|        |0AA4FA;
                       dw DATA8_0AA4FF                      ;0AA171|        |0AA4FF;
                       dw DATA8_0AA504                      ;0AA173|        |0AA504;
                       dw DATA8_0AA509                      ;0AA175|        |0AA509;
                       dw DATA8_0AA50E                      ;0AA177|        |0AA50E;
                       dw DATA8_0AA513                      ;0AA179|        |0AA513;
                       dw DATA8_0AA518                      ;0AA17B|        |0AA518;
                       dw DATA8_0AA51D                      ;0AA17D|        |0AA51D;
                       dw DATA8_0AA522                      ;0AA17F|        |0AA522;
                       dw DATA8_0AA527                      ;0AA181|        |0AA527;
                       dw DATA8_0AA52C                      ;0AA183|        |0AA52C;
                       dw DATA8_0AA531                      ;0AA185|        |0AA531;
                       dw DATA8_0AA536                      ;0AA187|        |0AA536;
                       dw DATA8_0AA53B                      ;0AA189|        |0AA53B;
                       dw DATA8_0AA540                      ;0AA18B|        |0AA540;
                       dw DATA8_0AA545                      ;0AA18D|        |0AA545;
                       dw DATA8_0AA54A                      ;0AA18F|        |0AA54A;
                       dw DATA8_0AA54F                      ;0AA191|        |0AA54F;
                       dw DATA8_0AA554                      ;0AA193|        |0AA554;
                       dw DATA8_0AA559                      ;0AA195|        |0AA559;
                       dw DATA8_0AA55E                      ;0AA197|        |0AA55E;
                       dw DATA8_0AA563                      ;0AA199|        |0AA563;
                       dw DATA8_0AA568                      ;0AA19B|        |0AA568;
                       dw DATA8_0AA56D                      ;0AA19D|        |0AA56D;
                       dw DATA8_0AA572                      ;0AA19F|        |0AA572;
                       dw DATA8_0AA577                      ;0AA1A1|        |0AA577;
                       dw DATA8_0AA57C                      ;0AA1A3|        |0AA57C;
                       dw DATA8_0AA581                      ;0AA1A5|        |0AA581;
                       dw DATA8_0AA586                      ;0AA1A7|        |0AA586;
                       dw DATA8_0AA58B                      ;0AA1A9|        |0AA58B;
                       dw DATA8_0AA590                      ;0AA1AB|        |0AA590;
                       dw DATA8_0AA595                      ;0AA1AD|        |0AA595;
                       dw DATA8_0AA59A                      ;0AA1AF|        |0AA59A;
                       dw DATA8_0AA59F                      ;0AA1B1|        |0AA59F;
                       dw DATA8_0AA5A4                      ;0AA1B3|        |0AA5A4;
                       dw DATA8_0AA5A9                      ;0AA1B5|        |0AA5A9;
                       dw DATA8_0AA5AE                      ;0AA1B7|        |0AA5AE;
                       dw DATA8_0AA5B3                      ;0AA1B9|        |0AA5B3;
                       dw DATA8_0AA5B8                      ;0AA1BB|        |0AA5B8;
                       dw DATA8_0AA5BD                      ;0AA1BD|        |0AA5BD;
                       dw DATA8_0AA5C2                      ;0AA1BF|        |0AA5C2;
                       dw DATA8_0AA5C7                      ;0AA1C1|        |0AA5C7;
                       dw DATA8_0AA5CC                      ;0AA1C3|        |0AA5CC;
                       dw DATA8_0AA5D1                      ;0AA1C5|        |0AA5D1;
                       dw DATA8_0AA5D6                      ;0AA1C7|        |0AA5D6;
                       dw DATA8_0AA5DB                      ;0AA1C9|        |0AA5DB;
                       dw DATA8_0AA5E0                      ;0AA1CB|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1CD|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1CF|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1D1|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1D3|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1D5|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1D7|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1D9|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1DB|        |0AA5E0;
                       dw DATA8_0AA5E0                      ;0AA1DD|        |0AA5E0;
                       dw DATA8_0AA5E5                      ;0AA1DF|        |0AA5E5;
                       dw DATA8_0AA5EA                      ;0AA1E1|        |0AA5EA;
                       dw DATA8_0AA5EF                      ;0AA1E3|        |0AA5EF;
                       dw DATA8_0AA5F4                      ;0AA1E5|        |0AA5F4;
                       dw DATA8_0AA5F9                      ;0AA1E7|        |0AA5F9;
                       dw DATA8_0AA5FE                      ;0AA1E9|        |0AA5FE;
                       dw DATA8_0AA603                      ;0AA1EB|        |0AA603;
                       dw DATA8_0AA608                      ;0AA1ED|        |0AA608;
                       dw DATA8_0AA60D                      ;0AA1EF|        |0AA60D;
                       dw DATA8_0AA612                      ;0AA1F1|        |0AA612;
                       dw DATA8_0AA617                      ;0AA1F3|        |0AA617;
                       dw DATA8_0AA61C                      ;0AA1F5|        |0AA61C;
                       dw DATA8_0AA621                      ;0AA1F7|        |0AA621;
                       dw DATA8_0AA626                      ;0AA1F9|        |0AA626;
                       dw DATA8_0AA62B                      ;0AA1FB|        |0AA62B;
                       dw DATA8_0AA626                      ;0AA1FD|        |0AA626;
                       dw DATA8_0AA630                      ;0AA1FF|        |0AA630;
                       dw DATA8_0AA635                      ;0AA201|        |0AA635;
                       dw DATA8_0AA63A                      ;0AA203|        |0AA63A;
                       dw DATA8_0AA63F                      ;0AA205|        |0AA63F;
 
         DATA8_0AA207: db $00,$00,$00,$00,$00               ;0AA207|        |      ;
 
         DATA8_0AA20C: db $01,$20,$C0,$00,$00               ;0AA20C|        |      ;
 
         DATA8_0AA211: db $16,$20,$B0,$00,$00               ;0AA211|        |      ;
 
         DATA8_0AA216: db $05,$00,$A8,$00,$00               ;0AA216|        |      ;
 
         DATA8_0AA21B: db $06,$00,$B0,$00,$00               ;0AA21B|        |      ;
 
         DATA8_0AA220: db $07,$30,$70,$00,$00               ;0AA220|        |      ;
 
         DATA8_0AA225: db $08,$20,$C0,$00,$00               ;0AA225|        |      ;
 
         DATA8_0AA22A: db $09,$20,$40,$00,$00               ;0AA22A|        |      ;
 
         DATA8_0AA22F: db $0A,$20,$40,$00,$00               ;0AA22F|        |      ;
 
         DATA8_0AA234: db $03,$20,$C0,$00,$00               ;0AA234|        |      ;
 
         DATA8_0AA239: db $0B,$20,$88,$00,$00               ;0AA239|        |      ;
 
         DATA8_0AA23E: db $0C,$20,$98,$00,$00               ;0AA23E|        |      ;
 
         DATA8_0AA243: db $0D,$08,$98,$00,$00               ;0AA243|        |      ;
 
         DATA8_0AA248: db $0E,$08,$90,$00,$00               ;0AA248|        |      ;
 
         DATA8_0AA24D: db $02,$18,$90,$00,$00               ;0AA24D|        |      ;
 
         DATA8_0AA252: db $0F,$20,$70,$00,$00               ;0AA252|        |      ;
 
         DATA8_0AA257: db $0B,$20,$78,$00,$00               ;0AA257|        |      ;
 
         DATA8_0AA25C: db $0E,$08,$B0,$00,$01               ;0AA25C|        |      ;
 
         DATA8_0AA261: db $10,$20,$B0,$00,$00               ;0AA261|        |      ;
 
         DATA8_0AA266: db $14,$20,$40,$00,$00               ;0AA266|        |      ;
 
         DATA8_0AA26B: db $18,$20,$40,$40,$40               ;0AA26B|        |      ;
 
         DATA8_0AA270: db $16,$20,$50,$00,$00               ;0AA270|        |      ;
 
         DATA8_0AA275: db $19,$20,$90,$00,$00               ;0AA275|        |      ;
 
         DATA8_0AA27A: db $04,$20,$40,$00,$00               ;0AA27A|        |      ;
 
         DATA8_0AA27F: db $17,$20,$A0,$00,$00               ;0AA27F|        |      ;
 
         DATA8_0AA284: db $11,$08,$80,$00,$00               ;0AA284|        |      ;
 
         DATA8_0AA289: db $1A,$08,$A0,$00,$00               ;0AA289|        |      ;
 
         DATA8_0AA28E: db $12,$08,$F0,$00,$00               ;0AA28E|        |      ;
 
         DATA8_0AA293: db $15,$18,$98,$00,$00               ;0AA293|        |      ;
 
         DATA8_0AA298: db $16,$20,$A0,$00,$00               ;0AA298|        |      ;
 
         DATA8_0AA29D: db $1B,$08,$7C,$00,$00               ;0AA29D|        |      ;
 
         DATA8_0AA2A2: db $1C,$00,$A0,$00,$00               ;0AA2A2|        |      ;
 
         DATA8_0AA2A7: db $1D,$3C,$48,$00,$00               ;0AA2A7|        |      ;
 
         DATA8_0AA2AC: db $27,$18,$70,$00,$00               ;0AA2AC|        |      ;
 
         DATA8_0AA2B1: db $10,$10,$50,$00,$00               ;0AA2B1|        |      ;
 
         DATA8_0AA2B6: db $15,$08,$68,$00,$00               ;0AA2B6|        |      ;
 
         DATA8_0AA2BB: db $21,$10,$A0,$00,$00               ;0AA2BB|        |      ;
 
         DATA8_0AA2C0: db $0F,$20,$B0,$00,$00               ;0AA2C0|        |      ;
 
         DATA8_0AA2C5: db $0B,$20,$B8,$00,$00               ;0AA2C5|        |      ;
 
         DATA8_0AA2CA: db $1E,$00,$B8,$00,$00               ;0AA2CA|        |      ;
 
         DATA8_0AA2CF: db $1F,$20,$A0,$00,$00               ;0AA2CF|        |      ;
 
         DATA8_0AA2D4: db $20,$00,$90,$00,$00               ;0AA2D4|        |      ;
 
         DATA8_0AA2D9: db $22,$20,$A0,$00,$00               ;0AA2D9|        |      ;
 
         DATA8_0AA2DE: db $23,$00,$50,$00,$00               ;0AA2DE|        |      ;
 
         DATA8_0AA2E3: db $24,$20,$B0,$00,$00               ;0AA2E3|        |      ;
 
         DATA8_0AA2E8: db $25,$00,$A0,$00,$00               ;0AA2E8|        |      ;
 
         DATA8_0AA2ED: db $26,$40,$A0,$00,$00               ;0AA2ED|        |      ;
 
         DATA8_0AA2F2: db $28,$20,$90,$00,$00               ;0AA2F2|        |      ;
 
         DATA8_0AA2F7: db $29,$20,$30,$00,$00               ;0AA2F7|        |      ;
 
         DATA8_0AA2FC: db $28,$18,$70,$00,$00               ;0AA2FC|        |      ;
 
         DATA8_0AA301: db $52,$20,$40,$00,$00               ;0AA301|        |      ;
 
         DATA8_0AA306: db $11,$08,$B0,$00,$00               ;0AA306|        |      ;
 
         DATA8_0AA30B: db $0F,$20,$50,$00,$00               ;0AA30B|        |      ;
 
         DATA8_0AA310: db $43,$20,$60,$00,$00               ;0AA310|        |      ;
 
         DATA8_0AA315: db $0E,$08,$90,$00,$00               ;0AA315|        |      ;
 
         DATA8_0AA31A: db $44,$00,$7C,$00,$00               ;0AA31A|        |      ;
 
         DATA8_0AA31F: db $44,$08,$8C,$00,$00               ;0AA31F|        |      ;
 
         DATA8_0AA324: db $11,$08,$70,$00,$00               ;0AA324|        |      ;
 
         DATA8_0AA329: db $28,$20,$80,$00,$00               ;0AA329|        |      ;
 
         DATA8_0AA32E: db $28,$00,$B0,$00,$00               ;0AA32E|        |      ;
 
         DATA8_0AA333: db $44,$30,$88,$00,$00               ;0AA333|        |      ;
 
         DATA8_0AA338: db $27,$18,$40,$00,$00               ;0AA338|        |      ;
 
         DATA8_0AA33D: db $10,$18,$30,$00,$00               ;0AA33D|        |      ;
 
         DATA8_0AA342: db $41,$10,$70,$00,$00               ;0AA342|        |      ;
 
         DATA8_0AA347: db $41,$08,$70,$00,$00               ;0AA347|        |      ;
 
         DATA8_0AA34C: db $0F,$20,$90,$00,$00               ;0AA34C|        |      ;
 
         DATA8_0AA351: db $11,$08,$50,$00,$00               ;0AA351|        |      ;
 
         DATA8_0AA356: db $0E,$20,$70,$00,$00               ;0AA356|        |      ;
 
         DATA8_0AA35B: db $27,$24,$38,$00,$00               ;0AA35B|        |      ;
 
         DATA8_0AA360: db $44,$30,$8C,$00,$00               ;0AA360|        |      ;
 
         DATA8_0AA365: db $44,$34,$80,$00,$00               ;0AA365|        |      ;
 
         DATA8_0AA36A: db $44,$38,$70,$00,$00               ;0AA36A|        |      ;
 
         DATA8_0AA36F: db $44,$20,$8C,$00,$00               ;0AA36F|        |      ;
 
         DATA8_0AA374: db $45,$10,$58,$00,$00               ;0AA374|        |      ;
 
         DATA8_0AA379: db $45,$30,$58,$02,$00               ;0AA379|        |      ;
 
         DATA8_0AA37E: db $45,$10,$78,$03,$00               ;0AA37E|        |      ;
 
         DATA8_0AA383: db $45,$20,$B8,$03,$00               ;0AA383|        |      ;
 
         DATA8_0AA388: db $45,$28,$98,$04,$00               ;0AA388|        |      ;
 
         DATA8_0AA38D: db $46,$10,$40,$04,$00               ;0AA38D|        |      ;
 
         DATA8_0AA392: db $43,$00,$90,$00,$00               ;0AA392|        |      ;
 
         DATA8_0AA397: db $43,$00,$60,$00,$00               ;0AA397|        |      ;
 
         DATA8_0AA39C: db $36,$30,$58,$00,$00               ;0AA39C|        |      ;
 
         DATA8_0AA3A1: db $18,$20,$A0,$40,$40               ;0AA3A1|        |      ;
 
         DATA8_0AA3A6: db $43,$20,$90,$01,$00               ;0AA3A6|        |      ;
 
         DATA8_0AA3AB: db $3E,$20,$D0,$00,$00               ;0AA3AB|        |      ;
 
         DATA8_0AA3B0: db $47,$20,$80,$00,$00               ;0AA3B0|        |      ;
 
         DATA8_0AA3B5: db $11,$08,$A0,$00,$00               ;0AA3B5|        |      ;
 
         DATA8_0AA3BA: db $18,$20,$68,$40,$40               ;0AA3BA|        |      ;
 
         DATA8_0AA3BF: db $40,$20,$B0,$00,$00               ;0AA3BF|        |      ;
 
 
         DATA8_0AA3C4: db $40,$20,$90,$00,$00               ;0AA3C4|        |      ;
 
         DATA8_0AA3C9: db $40,$30,$B0,$00,$00               ;0AA3C9|        |      ;
 
         DATA8_0AA3CE: db $49,$20,$50,$00,$00               ;0AA3CE|        |      ;
 
         DATA8_0AA3D3: db $28,$20,$50,$00,$00               ;0AA3D3|        |      ;
 
         DATA8_0AA3D8: db $28,$20,$60,$00,$00               ;0AA3D8|        |      ;
 
         DATA8_0AA3DD: db $2D,$20,$A0,$00,$00               ;0AA3DD|        |      ;
 
         DATA8_0AA3E2: db $2E,$20,$B8,$00,$00               ;0AA3E2|        |      ;
 
         DATA8_0AA3E7: db $19,$20,$60,$00,$00               ;0AA3E7|        |      ;
 
         DATA8_0AA3EC: db $1F,$00,$00,$00,$00               ;0AA3EC|        |      ;
 
         DATA8_0AA3F1: db $39,$30,$B8,$00,$00               ;0AA3F1|        |      ;
 
         DATA8_0AA3F6: db $13,$20,$B0,$00,$00               ;0AA3F6|        |      ;
 
         DATA8_0AA3FB: db $16,$20,$70,$00,$00               ;0AA3FB|        |      ;
 
         DATA8_0AA400: db $3A,$20,$A0,$00,$00               ;0AA400|        |      ;
 
         DATA8_0AA405: db $17,$20,$B0,$00,$00               ;0AA405|        |      ;
 
         DATA8_0AA40A: db $17,$20,$90,$00,$00               ;0AA40A|        |      ;
 
         DATA8_0AA40F: db $0B,$20,$A8,$00,$00               ;0AA40F|        |      ;
 
         DATA8_0AA414: db $0B,$20,$98,$00,$00               ;0AA414|        |      ;
 
         DATA8_0AA419: db $3B,$20,$A0,$00,$00               ;0AA419|        |      ;
 
         DATA8_0AA41E: db $3C,$14,$B0,$00,$00               ;0AA41E|        |      ;
 
         DATA8_0AA423: db $27,$18,$50,$00,$00               ;0AA423|        |      ;
 
         DATA8_0AA428: db $19,$20,$50,$00,$00               ;0AA428|        |      ;
 
         DATA8_0AA42D: db $3D,$20,$88,$00,$00               ;0AA42D|        |      ;
 
         DATA8_0AA432: db $3E,$20,$B0,$00,$00               ;0AA432|        |      ;
 
         PTR16_0AA437: dw $203F                             ;0AA437|        |0A203F;
                       db $B0,$00,$00                       ;0AA439|        |      ;
 
         DATA8_0AA43C: db $1A,$30,$70,$00,$00               ;0AA43C|        |      ;
 
         DATA8_0AA441: db $41,$10,$70,$00,$01               ;0AA441|        |      ;
 
         DATA8_0AA446: db $42,$00,$B0,$00,$00               ;0AA446|        |      ;
 
         DATA8_0AA44B: db $28,$20,$A0,$00,$00               ;0AA44B|        |      ;
 
         DATA8_0AA450: db $19,$30,$B0,$00,$00               ;0AA450|        |      ;
 
         DATA8_0AA455: db $16,$20,$60,$00,$00               ;0AA455|        |      ;
 
         DATA8_0AA45A: db $16,$20,$90,$00,$00               ;0AA45A|        |      ;
 
         DATA8_0AA45F: db $18,$20,$80,$40,$40               ;0AA45F|        |      ;
 
         DATA8_0AA464: db $45,$38,$C8,$04,$00               ;0AA464|        |      ;
 
         DATA8_0AA469: db $0F,$38,$90,$00,$00               ;0AA469|        |      ;
 
         DATA8_0AA46E: db $0E,$08,$70,$00,$01               ;0AA46E|        |      ;
 
         PTR16_0AA473: dw $280E                             ;0AA473|        |0A280E;
                       db $90,$00,$01                       ;0AA475|        |      ;
 
         DATA8_0AA478: db $0E,$10,$40,$00,$00               ;0AA478|        |      ;
 
         DATA8_0AA47D: db $27,$04,$48,$00,$00               ;0AA47D|        |      ;
 
         DATA8_0AA482: db $27,$20,$50,$00,$00               ;0AA482|        |      ;
 
         PTR16_0AA487: dw $1045                             ;0AA487|        |0A1045;
                       db $78                               ;0AA489|        |      ;
                       dw $0002                             ;0AA48A|        |0A0002;
 
         PTR16_0AA48C: dw $300B                             ;0AA48C|        |0A300B;
                       db $58                               ;0AA48E|        |      ;
                       dw $0000                             ;0AA48F|        |0A0000;
 
         PTR16_0AA491: dw $080E                             ;0AA491|        |0A080E;
                       db $90,$00,$01                       ;0AA493|        |      ;
 
         DATA8_0AA496: db $10,$30,$70,$02,$00               ;0AA496|        |      ;
 
         DATA8_0AA49B: db $4B,$30,$60,$00,$00               ;0AA49B|        |      ;
 
         DATA8_0AA4A0: db $4B,$20,$70,$00,$00               ;0AA4A0|        |      ;
 
         DATA8_0AA4A5: db $0E,$08,$90,$00,$01               ;0AA4A5|        |      ;
 
         DATA8_0AA4AA: db $27,$10,$60,$00,$00               ;0AA4AA|        |      ;
 
         DATA8_0AA4AF: db $4B,$10,$90,$00,$00               ;0AA4AF|        |      ;
 
         DATA8_0AA4B4: db $0D,$08,$88,$00,$00               ;0AA4B4|        |      ;
 
         DATA8_0AA4B9: db $0D,$30,$88,$00,$00               ;0AA4B9|        |      ;
 
         DATA8_0AA4BE: db $4C,$20,$80,$00,$00               ;0AA4BE|        |      ;
 
 
         DATA8_0AA4C3: db $45,$20,$B8,$02,$00               ;0AA4C3|        |      ;
 
         DATA8_0AA4C8: db $45,$30,$B8,$02,$00               ;0AA4C8|        |      ;
 
         DATA8_0AA4CD: db $45,$30,$B8,$00,$00               ;0AA4CD|        |      ;
 
         DATA8_0AA4D2: db $45,$20,$A8,$00,$00               ;0AA4D2|        |      ;
 
         DATA8_0AA4D7: db $3F,$20,$70,$00,$00               ;0AA4D7|        |      ;
 
         DATA8_0AA4DC: db $1A,$20,$90,$00,$00               ;0AA4DC|        |      ;
 
         DATA8_0AA4E1: db $14,$20,$50,$00,$00               ;0AA4E1|        |      ;
 
         DATA8_0AA4E6: db $1A,$20,$B0,$00,$00               ;0AA4E6|        |      ;
 
         DATA8_0AA4EB: db $15,$28,$78,$00,$00               ;0AA4EB|        |      ;
 
         DATA8_0AA4F0: db $40,$20,$80,$00,$00               ;0AA4F0|        |      ;
 
 
         DATA8_0AA4F5: db $0D,$20,$60,$00,$00               ;0AA4F5|        |      ;
 
         DATA8_0AA4FA: db $0F,$20,$80,$00,$00               ;0AA4FA|        |      ;
 
         DATA8_0AA4FF: db $15,$30,$68,$00,$00               ;0AA4FF|        |      ;
 
         DATA8_0AA504: db $15,$20,$C8,$00,$00               ;0AA504|        |      ;
 
         DATA8_0AA509: db $27,$00,$30,$00,$00               ;0AA509|        |      ;
 
         DATA8_0AA50E: db $27,$10,$30,$00,$00               ;0AA50E|        |      ;
 
         DATA8_0AA513: db $4A,$20,$60,$00,$00               ;0AA513|        |      ;
 
         DATA8_0AA518: db $02,$20,$C0,$00,$00               ;0AA518|        |      ;
 
         DATA8_0AA51D: db $32,$00,$B0,$00,$00               ;0AA51D|        |      ;
 
         DATA8_0AA522: db $32,$20,$50,$00,$00               ;0AA522|        |      ;
 
         DATA8_0AA527: db $13,$20,$C0,$00,$00               ;0AA527|        |      ;
 
         DATA8_0AA52C: db $0B,$38,$78,$00,$00               ;0AA52C|        |      ;
 
         DATA8_0AA531: db $0B,$10,$B8,$00,$00               ;0AA531|        |      ;
 
         DATA8_0AA536: db $17,$20,$C0,$00,$00               ;0AA536|        |      ;
 
         DATA8_0AA53B: db $13,$20,$70,$00,$00               ;0AA53B|        |      ;
 
         DATA8_0AA540: db $0E,$20,$A0,$00,$01               ;0AA540|        |      ;
 
         DATA8_0AA545: db $0E,$20,$50,$00,$00               ;0AA545|        |      ;
 
         DATA8_0AA54A: db $3D,$20,$B8,$00,$00               ;0AA54A|        |      ;
 
         DATA8_0AA54F: db $3D,$20,$68,$00,$00               ;0AA54F|        |      ;
 
         DATA8_0AA554: db $0F,$00,$70,$00,$00               ;0AA554|        |      ;
 
         DATA8_0AA559: db $4D,$00,$48,$00,$00               ;0AA559|        |      ;
 
         DATA8_0AA55E: db $4E,$30,$98,$00,$00               ;0AA55E|        |      ;
 
         DATA8_0AA563: db $13,$20,$80,$00,$00               ;0AA563|        |      ;
 
         DATA8_0AA568: db $0E,$20,$B0,$00,$00               ;0AA568|        |      ;
 
         DATA8_0AA56D: db $0E,$30,$B0,$00,$00               ;0AA56D|        |      ;
 
         DATA8_0AA572: db $0F,$00,$60,$00,$00               ;0AA572|        |      ;
 
         DATA8_0AA577: db $4F,$14,$C0,$00,$00               ;0AA577|        |      ;
 
         DATA8_0AA57C: db $0E,$10,$80,$00,$00               ;0AA57C|        |      ;
 
         DATA8_0AA581: db $0E,$30,$80,$00,$01               ;0AA581|        |      ;
 
         DATA8_0AA586: db $11                               ;0AA586|        |      ;
 
         DATA8_0AA587: db $30,$90,$00,$00                   ;0AA587|        |      ;
 
         DATA8_0AA58B: db $11,$20,$60,$00,$00               ;0AA58B|        |      ;
 
         DATA8_0AA590: db $15,$20,$B8,$00,$00               ;0AA590|        |      ;
 
         DATA8_0AA595: db $43,$38,$60,$01,$00               ;0AA595|        |      ;
 
         DATA8_0AA59A: db $32,$00,$80,$00,$00               ;0AA59A|        |      ;
 
         DATA8_0AA59F: db $3E,$20,$D8,$00,$00               ;0AA59F|        |      ;
 
         DATA8_0AA5A4: db $32,$08,$70,$00,$00               ;0AA5A4|        |      ;
 
         DATA8_0AA5A9: db $11,$20,$50,$00,$00               ;0AA5A9|        |      ;
 
         DATA8_0AA5AE: db $50,$20,$B0,$00,$00               ;0AA5AE|        |      ;
 
         DATA8_0AA5B3: db $0E,$30,$60,$00,$00               ;0AA5B3|        |      ;
 
         DATA8_0AA5B8: db $14,$20,$48,$00,$00               ;0AA5B8|        |      ;
 
         DATA8_0AA5BD: db $51,$20,$40,$00,$00               ;0AA5BD|        |      ;
 
         DATA8_0AA5C2: db $0D,$20,$70,$00,$00               ;0AA5C2|        |      ;
 
         DATA8_0AA5C7: db $14,$20,$60,$00,$00               ;0AA5C7|        |      ;
 
         DATA8_0AA5CC: db $3F,$20,$60,$00,$00               ;0AA5CC|        |      ;
 
         DATA8_0AA5D1: db $45,$10,$A8,$02,$00               ;0AA5D1|        |      ;
 
         DATA8_0AA5D6: db $3F,$20,$C0,$00,$00               ;0AA5D6|        |      ;
 
         DATA8_0AA5DB: db $19,$20,$80,$00,$00               ;0AA5DB|        |      ;
 
         DATA8_0AA5E0: db $40,$30,$60,$00,$00               ;0AA5E0|        |      ;
 
         DATA8_0AA5E5: db $11,$08,$80,$00,$00               ;0AA5E5|        |      ;
 
         DATA8_0AA5EA: db $02,$20,$C0,$00,$00               ;0AA5EA|        |      ;
 
         DATA8_0AA5EF: db $48,$20,$60,$00,$00               ;0AA5EF|        |      ;
 
         DATA8_0AA5F4: db $18,$20,$40,$40,$40               ;0AA5F4|        |      ;
 
         DATA8_0AA5F9: db $0C,$20,$98,$00,$00               ;0AA5F9|        |      ;
 
         DATA8_0AA5FE: db $10,$20,$40,$00,$00               ;0AA5FE|        |      ;
 
         DATA8_0AA603: db $1A,$20,$50,$00,$00               ;0AA603|        |      ;
 
         DATA8_0AA608: db $13,$20,$A0,$00,$00               ;0AA608|        |      ;
 
         DATA8_0AA60D: db $3D,$20,$88,$00,$00               ;0AA60D|        |      ;
 
         DATA8_0AA612: db $0F,$30,$A0,$00,$00               ;0AA612|        |      ;
 
         DATA8_0AA617: db $45,$10,$78,$02,$00               ;0AA617|        |      ;
 
         DATA8_0AA61C: db $45,$10,$98,$02,$00               ;0AA61C|        |      ;
 
         DATA8_0AA621: db $0F,$00,$90,$00,$00               ;0AA621|        |      ;
 
         DATA8_0AA626: db $13,$20,$70,$00,$00               ;0AA626|        |      ;
 
         DATA8_0AA62B: db $47,$20,$80,$00,$00               ;0AA62B|        |      ;
 
         DATA8_0AA630: db $19,$20,$90,$00,$00               ;0AA630|        |      ;
 
         DATA8_0AA635: db $2B,$08,$88,$00,$00               ;0AA635|        |      ;
 
         DATA8_0AA63A: db $16,$20,$70,$00,$00               ;0AA63A|        |      ;
 
         DATA8_0AA63F: db $2C,$10,$78,$03,$00               ;0AA63F|        |      ;
 
luminaryMetadataPointer: dw DATA8_0AA840                      ;0AA644|        |0AA840;
 
                       dw DATA8_0AA844                      ;0AA646|        |0AA844;
                       dw DATA8_0AA848                      ;0AA648|        |0AA848;
                       dw DATA8_0AA84C                      ;0AA64A|        |0AA84C;
 
                       dw DATA8_0AA850                      ;0AA64C|        |0AA850;
                       dw DATA8_0AA854                      ;0AA64E|        |0AA854;
                       dw DATA8_0AA858                      ;0AA650|        |0AA858;
                       dw DATA8_0AA85C                      ;0AA652|        |0AA85C;
 
                       dw DATA8_0AA860                      ;0AA654|        |0AA860;
                       dw DATA8_0AA864                      ;0AA656|        |0AA864;
                       dw DATA8_0AA868                      ;0AA658|        |0AA868;
                       dw DATA8_0AA86C                      ;0AA65A|        |0AA86C;
 
                       dw DATA8_0AA870                      ;0AA65C|        |0AA870;
                       dw DATA8_0AA874                      ;0AA65E|        |0AA874;
                       dw DATA8_0AA878                      ;0AA660|        |0AA878;
                       dw DATA8_0AA87C                      ;0AA662|        |0AA87C;
 
                       dw DATA8_0AA880                      ;0AA664|        |0AA880;
                       dw DATA8_0AA884                      ;0AA666|        |0AA884;
                       dw DATA8_0AA888                      ;0AA668|        |0AA888;
                       dw DATA8_0AA88C                      ;0AA66A|        |0AA88C;
                       dw DATA8_0AA890                      ;0AA66C|        |0AA890;
                       dw DATA8_0AA894                      ;0AA66E|        |0AA894;
                       dw DATA8_0AA898                      ;0AA670|        |0AA898;
                       dw DATA8_0AA89C                      ;0AA672|        |0AA89C;
                       dw DATA8_0AA8A0                      ;0AA674|        |0AA8A0;
                       dw DATA8_0AA8A4                      ;0AA676|        |0AA8A4;
                       dw DATA8_0AA8A8                      ;0AA678|        |0AA8A8;
                       dw DATA8_0AA8AC                      ;0AA67A|        |0AA8AC;
                       dw DATA8_0AA8B0                      ;0AA67C|        |0AA8B0;
                       dw DATA8_0AA8B4                      ;0AA67E|        |0AA8B4;
                       dw DATA8_0AA8B8                      ;0AA680|        |0AA8B8;
                       dw DATA8_0AA8BC                      ;0AA682|        |0AA8BC;
                       dw DATA8_0AA8C0                      ;0AA684|        |0AA8C0;
                       dw DATA8_0AA8C4                      ;0AA686|        |0AA8C4;
                       dw DATA8_0AA8C8                      ;0AA688|        |0AA8C8;
                       dw DATA8_0AA8CC                      ;0AA68A|        |0AA8CC;
                       dw DATA8_0AA8D0                      ;0AA68C|        |0AA8D0;
                       dw DATA8_0AA8D4                      ;0AA68E|        |0AA8D4;
                       dw DATA8_0AA8D8                      ;0AA690|        |0AA8D8;
                       dw DATA8_0AA8DC                      ;0AA692|        |0AA8DC;
 
                       dw DATA8_0AA8E0                      ;0AA694|        |0AA8E0;
                       dw DATA8_0AA8E4                      ;0AA696|        |0AA8E4;
                       dw DATA8_0AA8E8                      ;0AA698|        |0AA8E8;
                       dw DATA8_0AA8EC                      ;0AA69A|        |0AA8EC;
                       dw DATA8_0AA8F0                      ;0AA69C|        |0AA8F0;
                       dw DATA8_0AA8F4                      ;0AA69E|        |0AA8F4;
                       dw DATA8_0AA8F8                      ;0AA6A0|        |0AA8F8;
                       dw DATA8_0AA8FC                      ;0AA6A2|        |0AA8FC;
                       dw DATA8_0AA900                      ;0AA6A4|        |0AA900;
                       dw DATA8_0AA904                      ;0AA6A6|        |0AA904;
                       dw DATA8_0AA908                      ;0AA6A8|        |0AA908;
                       dw DATA8_0AA90C                      ;0AA6AA|        |0AA90C;
                       dw DATA8_0AA910                      ;0AA6AC|        |0AA910;
                       dw DATA8_0AA914                      ;0AA6AE|        |0AA914;
                       dw DATA8_0AA918                      ;0AA6B0|        |0AA918;
                       dw DATA8_0AA91C                      ;0AA6B2|        |0AA91C;
                       dw DATA8_0AA920                      ;0AA6B4|        |0AA920;
                       dw DATA8_0AA924                      ;0AA6B6|        |0AA924;
                       dw DATA8_0AA928                      ;0AA6B8|        |0AA928;
                       dw DATA8_0AA92C                      ;0AA6BA|        |0AA92C;
                       dw DATA8_0AA930                      ;0AA6BC|        |0AA930;
                       dw DATA8_0AA934                      ;0AA6BE|        |0AA934;
                       dw DATA8_0AA938                      ;0AA6C0|        |0AA938;
                       dw DATA8_0AA93C                      ;0AA6C2|        |0AA93C;
                       dw DATA8_0AA940                      ;0AA6C4|        |0AA940;
 
                       dw DATA8_0AA944                      ;0AA6C6|        |0AA944;
                       dw DATA8_0AA948                      ;0AA6C8|        |0AA948;
                       dw DATA8_0AA94C                      ;0AA6CA|        |0AA94C;
                       dw DATA8_0AA950                      ;0AA6CC|        |0AA950;
                       dw DATA8_0AA954                      ;0AA6CE|        |0AA954;
                       dw DATA8_0AA958                      ;0AA6D0|        |0AA958;
                       dw DATA8_0AA95C                      ;0AA6D2|        |0AA95C;
                       dw DATA8_0AA960                      ;0AA6D4|        |0AA960;
 
                       dw DATA8_0AA964                      ;0AA6D6|        |0AA964;
                       dw DATA8_0AA968                      ;0AA6D8|        |0AA968;
                       dw DATA8_0AA96C                      ;0AA6DA|        |0AA96C;
                       dw DATA8_0AA970                      ;0AA6DC|        |0AA970;
                       dw DATA8_0AA974                      ;0AA6DE|        |0AA974;
                       dw DATA8_0AA978                      ;0AA6E0|        |0AA978;
                       dw DATA8_0AA97C                      ;0AA6E2|        |0AA97C;
                       dw DATA8_0AA980                      ;0AA6E4|        |0AA980;
 
                       dw DATA8_0AA984                      ;0AA6E6|        |0AA984;
                       dw DATA8_0AA988                      ;0AA6E8|        |0AA988;
                       dw DATA8_0AA98C                      ;0AA6EA|        |0AA98C;
                       dw DATA8_0AA990                      ;0AA6EC|        |0AA990;
                       dw DATA8_0AA994                      ;0AA6EE|        |0AA994;
                       dw DATA8_0AA998                      ;0AA6F0|        |0AA998;
                       dw DATA8_0AA99C                      ;0AA6F2|        |0AA99C;
                       dw DATA8_0AA9A0                      ;0AA6F4|        |0AA9A0;
                       dw DATA8_0AA9A4                      ;0AA6F6|        |0AA9A4;
                       dw DATA8_0AA9A8                      ;0AA6F8|        |0AA9A8;
                       dw DATA8_0AA9AC                      ;0AA6FA|        |0AA9AC;
                       dw DATA8_0AA9B0                      ;0AA6FC|        |0AA9B0;
                       dw DATA8_0AA9B4                      ;0AA6FE|        |0AA9B4;
                       dw DATA8_0AA9B8                      ;0AA700|        |0AA9B8;
                       dw DATA8_0AA9BC                      ;0AA702|        |0AA9BC;
                       dw DATA8_0AA9C0                      ;0AA704|        |0AA9C0;
                       dw DATA8_0AA9A0                      ;0AA706|        |0AA9A0;
                       dw DATA8_0AA9C4                      ;0AA708|        |0AA9C4;
                       dw DATA8_0AA9C8                      ;0AA70A|        |0AA9C8;
                       dw DATA8_0AA9CC                      ;0AA70C|        |0AA9CC;
                       dw DATA8_0AA9D0                      ;0AA70E|        |0AA9D0;
                       dw DATA8_0AA9D4                      ;0AA710|        |0AA9D4;
                       dw DATA8_0AA9D8                      ;0AA712|        |0AA9D8;
                       dw DATA8_0AA9DC                      ;0AA714|        |0AA9DC;
                       dw DATA8_0AA9E0                      ;0AA716|        |0AA9E0;
                       dw DATA8_0AA9E4                      ;0AA718|        |0AA9E4;
                       dw DATA8_0AA9E8                      ;0AA71A|        |0AA9E8;
                       dw DATA8_0AA9EC                      ;0AA71C|        |0AA9EC;
                       dw DATA8_0AA9F0                      ;0AA71E|        |0AA9F0;
                       dw DATA8_0AA9F4                      ;0AA720|        |0AA9F4;
                       dw DATA8_0AA9F8                      ;0AA722|        |0AA9F8;
                       dw DATA8_0AA9FC                      ;0AA724|        |0AA9FC;
                       dw DATA8_0AAA00                      ;0AA726|        |0AAA00;
                       dw DATA8_0AAA04                      ;0AA728|        |0AAA04;
                       dw DATA8_0AAA08                      ;0AA72A|        |0AAA08;
                       dw DATA8_0AAA0C                      ;0AA72C|        |0AAA0C;
                       dw DATA8_0AAA10                      ;0AA72E|        |0AAA10;
                       dw DATA8_0AAA14                      ;0AA730|        |0AAA14;
                       dw DATA8_0AAA18                      ;0AA732|        |0AAA18;
                       dw DATA8_0AAA1C                      ;0AA734|        |0AAA1C;
                       dw DATA8_0AAA20                      ;0AA736|        |0AAA20;
                       dw DATA8_0AAA24                      ;0AA738|        |0AAA24;
                       dw DATA8_0AAA28                      ;0AA73A|        |0AAA28;
                       dw DATA8_0AAA2C                      ;0AA73C|        |0AAA2C;
                       dw DATA8_0AAA30                      ;0AA73E|        |0AAA30;
                       dw DATA8_0AAA34                      ;0AA740|        |0AAA34;
                       dw DATA8_0AAA38                      ;0AA742|        |0AAA38;
 
         PTR16_0AA744: dw DATA8_0AAA3C                      ;0AA744|        |0AAA3C;
                       dw DATA8_0AAA40                      ;0AA746|        |0AAA40;
                       dw DATA8_0AAA44                      ;0AA748|        |0AAA44;
                       dw DATA8_0AAA48                      ;0AA74A|        |0AAA48;
                       dw DATA8_0AAA4C                      ;0AA74C|        |0AAA4C;
 
                       dw DATA8_0AAA50                      ;0AA74E|        |0AAA50;
                       dw DATA8_0AAA54                      ;0AA750|        |0AAA54;
                       dw DATA8_0AAA58                      ;0AA752|        |0AAA58;
                       dw DATA8_0AAA5C                      ;0AA754|        |0AAA5C;
 
                       dw DATA8_0AAA60                      ;0AA756|        |0AAA60;
                       dw DATA8_0AAA64                      ;0AA758|        |0AAA64;
                       dw DATA8_0AAA68                      ;0AA75A|        |0AAA68;
                       dw DATA8_0AAA6C                      ;0AA75C|        |0AAA6C;
 
                       dw DATA8_0AAA70                      ;0AA75E|        |0AAA70;
                       dw DATA8_0AAA74                      ;0AA760|        |0AAA74;
                       dw DATA8_0AAA78                      ;0AA762|        |0AAA78;
                       dw DATA8_0AAA7C                      ;0AA764|        |0AAA7C;
 
                       dw DATA8_0AAA80                      ;0AA766|        |0AAA80;
                       dw DATA8_0AAA84                      ;0AA768|        |0AAA84;
                       dw DATA8_0AAA88                      ;0AA76A|        |0AAA88;
                       dw DATA8_0AAA8C                      ;0AA76C|        |0AAA8C;
                       dw DATA8_0AAA90                      ;0AA76E|        |0AAA90;
                       dw DATA8_0AAA94                      ;0AA770|        |0AAA94;
                       dw DATA8_0AAA98                      ;0AA772|        |0AAA98;
                       dw DATA8_0AAA9C                      ;0AA774|        |0AAA9C;
                       dw DATA8_0AAAA0                      ;0AA776|        |0AAAA0;
                       dw DATA8_0AAAA4                      ;0AA778|        |0AAAA4;
                       dw DATA8_0AAAA8                      ;0AA77A|        |0AAAA8;
                       dw DATA8_0AAAAC                      ;0AA77C|        |0AAAAC;
                       dw DATA8_0AAAB0                      ;0AA77E|        |0AAAB0;
                       dw DATA8_0AAAB4                      ;0AA780|        |0AAAB4;
                       dw DATA8_0AAAB8                      ;0AA782|        |0AAAB8;
                       dw DATA8_0AAABC                      ;0AA784|        |0AAABC;
                       dw DATA8_0AAAC0                      ;0AA786|        |0AAAC0;
                       dw DATA8_0AAAC4                      ;0AA788|        |0AAAC4;
                       dw DATA8_0AAAC8                      ;0AA78A|        |0AAAC8;
                       dw DATA8_0AAACC                      ;0AA78C|        |0AAACC;
                       dw DATA8_0AAAD0                      ;0AA78E|        |0AAAD0;
                       dw DATA8_0AAAD4                      ;0AA790|        |0AAAD4;
                       dw DATA8_0AAAD8                      ;0AA792|        |0AAAD8;
                       dw DATA8_0AAADC                      ;0AA794|        |0AAADC;
 
                       dw DATA8_0AAAE0                      ;0AA796|        |0AAAE0;
                       dw DATA8_0AAAE4                      ;0AA798|        |0AAAE4;
                       dw DATA8_0AAAE8                      ;0AA79A|        |0AAAE8;
                       dw DATA8_0AAAEC                      ;0AA79C|        |0AAAEC;
                       dw DATA8_0AAAF0                      ;0AA79E|        |0AAAF0;
                       dw DATA8_0AAAF4                      ;0AA7A0|        |0AAAF4;
                       dw DATA8_0AAAF8                      ;0AA7A2|        |0AAAF8;
                       dw DATA8_0AAAFC                      ;0AA7A4|        |0AAAFC;
                       dw DATA8_0AAB00                      ;0AA7A6|        |0AAB00;
                       dw DATA8_0AAB04                      ;0AA7A8|        |0AAB04;
                       dw DATA8_0AAB08                      ;0AA7AA|        |0AAB08;
                       dw DATA8_0AAB0C                      ;0AA7AC|        |0AAB0C;
                       dw DATA8_0AAB10                      ;0AA7AE|        |0AAB10;
                       dw DATA8_0AAB14                      ;0AA7B0|        |0AAB14;
                       dw DATA8_0AAB18                      ;0AA7B2|        |0AAB18;
                       dw DATA8_0AAB1C                      ;0AA7B4|        |0AAB1C;
                       dw DATA8_0AAB20                      ;0AA7B6|        |0AAB20;
                       dw DATA8_0AAB24                      ;0AA7B8|        |0AAB24;
                       dw DATA8_0AAB28                      ;0AA7BA|        |0AAB28;
                       dw DATA8_0AAB2C                      ;0AA7BC|        |0AAB2C;
                       dw DATA8_0AAB30                      ;0AA7BE|        |0AAB30;
                       dw DATA8_0AAB34                      ;0AA7C0|        |0AAB34;
                       dw DATA8_0AAB38                      ;0AA7C2|        |0AAB38;
                       dw DATA8_0AAB3C                      ;0AA7C4|        |0AAB3C;
                       dw DATA8_0AAB40                      ;0AA7C6|        |0AAB40;
                       dw DATA8_0AAB44                      ;0AA7C8|        |0AAB44;
                       dw DATA8_0AAB48                      ;0AA7CA|        |0AAB48;
                       dw DATA8_0AAB4C                      ;0AA7CC|        |0AAB4C;
 
                       dw DATA8_0AAB50                      ;0AA7CE|        |0AAB50;
                       dw DATA8_0AAB54                      ;0AA7D0|        |0AAB54;
                       dw DATA8_0AAB58                      ;0AA7D2|        |0AAB58;
                       dw DATA8_0AAB5C                      ;0AA7D4|        |0AAB5C;
 
                       dw DATA8_0AAB60                      ;0AA7D6|        |0AAB60;
                       dw DATA8_0AAB64                      ;0AA7D8|        |0AAB64;
                       dw DATA8_0AAB68                      ;0AA7DA|        |0AAB68;
                       dw DATA8_0AAB6C                      ;0AA7DC|        |0AAB6C;
 
                       dw DATA8_0AAB70                      ;0AA7DE|        |0AAB70;
                       dw DATA8_0AAB74                      ;0AA7E0|        |0AAB74;
                       dw DATA8_0AAB78                      ;0AA7E2|        |0AAB78;
                       dw DATA8_0AAB7C                      ;0AA7E4|        |0AAB7C;
 
                       dw DATA8_0AAB80                      ;0AA7E6|        |0AAB80;
                       dw DATA8_0AAB84                      ;0AA7E8|        |0AAB84;
                       dw DATA8_0AAB88                      ;0AA7EA|        |0AAB88;
                       dw DATA8_0AAB8C                      ;0AA7EC|        |0AAB8C;
                       dw DATA8_0AAB90                      ;0AA7EE|        |0AAB90;
                       dw DATA8_0AAB94                      ;0AA7F0|        |0AAB94;
                       dw DATA8_0AAB98                      ;0AA7F2|        |0AAB98;
                       dw DATA8_0AAB9C                      ;0AA7F4|        |0AAB9C;
                       dw DATA8_0AABA0                      ;0AA7F6|        |0AABA0;
                       dw DATA8_0AABA4                      ;0AA7F8|        |0AABA4;
                       dw DATA8_0AABA8                      ;0AA7FA|        |0AABA8;
                       dw DATA8_0AABAC                      ;0AA7FC|        |0AABAC;
                       dw DATA8_0AABB0                      ;0AA7FE|        |0AABB0;
                       dw DATA8_0AABB4                      ;0AA800|        |0AABB4;
                       dw DATA8_0AABB8                      ;0AA802|        |0AABB8;
                       dw DATA8_0AABBC                      ;0AA804|        |0AABBC;
                       dw DATA8_0AABC0                      ;0AA806|        |0AABC0;
                       dw DATA8_0AABC4                      ;0AA808|        |0AABC4;
                       dw DATA8_0AABC8                      ;0AA80A|        |0AABC8;
                       dw DATA8_0AABCC                      ;0AA80C|        |0AABCC;
                       dw DATA8_0AABD0                      ;0AA80E|        |0AABD0;
                       dw DATA8_0AABD4                      ;0AA810|        |0AABD4;
                       dw DATA8_0AABD8                      ;0AA812|        |0AABD8;
                       dw DATA8_0AABDC                      ;0AA814|        |0AABDC;
 
                       dw DATA8_0AABE0                      ;0AA816|        |0AABE0;
                       dw DATA8_0AABE4                      ;0AA818|        |0AABE4;
                       dw DATA8_0AABE8                      ;0AA81A|        |0AABE8;
                       dw DATA8_0AABEC                      ;0AA81C|        |0AABEC;
                       dw DATA8_0AABF0                      ;0AA81E|        |0AABF0;
                       dw DATA8_0AABF4                      ;0AA820|        |0AABF4;
                       dw DATA8_0AABF8                      ;0AA822|        |0AABF8;
                       dw DATA8_0AABFC                      ;0AA824|        |0AABFC;
                       dw DATA8_0AAC00                      ;0AA826|        |0AAC00;
                       dw DATA8_0AAC04                      ;0AA828|        |0AAC04;
                       dw DATA8_0AAC08                      ;0AA82A|        |0AAC08;
                       dw DATA8_0AAC0C                      ;0AA82C|        |0AAC0C;
                       dw DATA8_0AAC10                      ;0AA82E|        |0AAC10;
                       dw DATA8_0AAC14                      ;0AA830|        |0AAC14;
                       dw DATA8_0AAC18                      ;0AA832|        |0AAC18;
                       dw DATA8_0AAC1C                      ;0AA834|        |0AAC1C;
                       dw DATA8_0AAC20                      ;0AA836|        |0AAC20;
                       dw DATA8_0AAC24                      ;0AA838|        |0AAC24;
                       dw DATA8_0AAC28                      ;0AA83A|        |0AAC28;
                       dw DATA8_0AAC2C                      ;0AA83C|        |0AAC2C;
                       dw DATA8_0AAC30                      ;0AA83E|        |0AAC30;
 
         DATA8_0AA840: db $00,$00,$00,$00                   ;0AA840|        |      ;
 
         DATA8_0AA844: db $90,$AE,$20,$A0                   ;0AA844|        |      ;
 
         DATA8_0AA848: db $90,$AD,$20,$50                   ;0AA848|        |      ;
 
         DATA8_0AA84C: db $90,$AE,$20,$60                   ;0AA84C|        |      ;
 
         DATA8_0AA850: db $90,$95,$02,$80                   ;0AA850|        |      ;
 
         DATA8_0AA854: db $90,$A4,$02,$40                   ;0AA854|        |      ;
 
         DATA8_0AA858: db $90,$93,$24,$88                   ;0AA858|        |      ;
 
         DATA8_0AA85C: db $90,$AD,$02,$80                   ;0AA85C|        |      ;
 
         DATA8_0AA860: db $90,$97,$02,$80                   ;0AA860|        |      ;
 
         DATA8_0AA864: db $90,$A1,$24,$8C                   ;0AA864|        |      ;
 
         DATA8_0AA868: db $90,$95,$24,$6C                   ;0AA868|        |      ;
 
         DATA8_0AA86C: db $91,$AE,$20,$C0                   ;0AA86C|        |      ;
 
         DATA8_0AA870: db $91,$AD,$00,$C0                   ;0AA870|        |      ;
 
         DATA8_0AA874: db $90,$AE,$24,$6C                   ;0AA874|        |      ;
 
         DATA8_0AA878: db $90,$A4,$24,$8C                   ;0AA878|        |      ;
 
         DATA8_0AA87C: db $91,$AE,$20,$C0                   ;0AA87C|        |      ;
 
         DATA8_0AA880: db $90,$AE,$0C,$6C                   ;0AA880|        |      ;
 
         DATA8_0AA884: db $92,$AE,$0C,$70                   ;0AA884|        |      ;
 
         DATA8_0AA888: db $92,$AE,$0C,$80                   ;0AA888|        |      ;
 
         DATA8_0AA88C: db $92,$AD,$28,$88                   ;0AA88C|        |      ;
 
         DATA8_0AA890: db $92,$94,$18,$80                   ;0AA890|        |      ;
 
         DATA8_0AA894: db $92,$A1,$28,$88                   ;0AA894|        |      ;
 
         DATA8_0AA898: db $92,$AC,$2D,$88                   ;0AA898|        |      ;
 
         DATA8_0AA89C: db $92,$AE,$28,$48                   ;0AA89C|        |      ;
 
         DATA8_0AA8A0: db $92,$AE,$18,$80                   ;0AA8A0|        |      ;
 
         DATA8_0AA8A4: db $92,$AE,$18,$78                   ;0AA8A4|        |      ;
 
         DATA8_0AA8A8: db $92,$93,$18,$78                   ;0AA8A8|        |      ;
 
         DATA8_0AA8AC: db $92,$AE,$18,$48                   ;0AA8AC|        |      ;
 
         DATA8_0AA8B0: db $92,$AE,$18,$58                   ;0AA8B0|        |      ;
 
         DATA8_0AA8B4: db $92,$AE,$30,$70                   ;0AA8B4|        |      ;
 
         DATA8_0AA8B8: db $92,$AE,$18,$68                   ;0AA8B8|        |      ;
 
         DATA8_0AA8BC: db $92,$AE,$38,$88                   ;0AA8BC|        |      ;
 
         DATA8_0AA8C0: db $92,$AE,$00,$38                   ;0AA8C0|        |      ;
 
         DATA8_0AA8C4: db $90,$A4,$22,$40                   ;0AA8C4|        |      ;
 
         DATA8_0AA8C8: db $90,$A4,$0C,$50                   ;0AA8C8|        |      ;
 
         DATA8_0AA8CC: db $90,$AE,$0C,$50                   ;0AA8CC|        |      ;
 
         DATA8_0AA8D0: db $90,$AD,$2C,$50                   ;0AA8D0|        |      ;
 
         DATA8_0AA8D4: db $90,$93,$10,$48                   ;0AA8D4|        |      ;
 
         DATA8_0AA8D8: db $91,$AE,$20,$A0                   ;0AA8D8|        |      ;
 
         DATA8_0AA8DC: db $91,$93,$20,$70                   ;0AA8DC|        |      ;
 
         DATA8_0AA8E0: db $91,$AE,$20,$80                   ;0AA8E0|        |      ;
 
         DATA8_0AA8E4: db $91,$AD,$20,$B0                   ;0AA8E4|        |      ;
 
         DATA8_0AA8E8: db $91,$A4,$20,$50                   ;0AA8E8|        |      ;
 
         DATA8_0AA8EC: db $91,$A4,$18,$C0                   ;0AA8EC|        |      ;
 
         DATA8_0AA8F0: db $90,$96,$00,$78                   ;0AA8F0|        |      ;
 
         DATA8_0AA8F4: db $90,$95,$30,$80                   ;0AA8F4|        |      ;
 
         DATA8_0AA8F8: db $90,$AE,$02,$88                   ;0AA8F8|        |      ;
 
         DATA8_0AA8FC: db $90,$AE,$10,$90                   ;0AA8FC|        |      ;
 
         DATA8_0AA900: db $90,$A4,$30,$90                   ;0AA900|        |      ;
 
         DATA8_0AA904: db $92,$AE,$08,$98                   ;0AA904|        |      ;
 
         DATA8_0AA908: db $92,$93,$28,$58                   ;0AA908|        |      ;
 
         DATA8_0AA90C: db $90,$AD,$00,$50                   ;0AA90C|        |      ;
 
         DATA8_0AA910: db $90,$A2,$24,$8C                   ;0AA910|        |      ;
 
         DATA8_0AA914: db $90,$AD,$08,$78                   ;0AA914|        |      ;
 
         DATA8_0AA918: db $90,$AE,$2A,$88                   ;0AA918|        |      ;
 
         DATA8_0AA91C: db $90,$AE,$0C,$48                   ;0AA91C|        |      ;
 
         DATA8_0AA920: db $90,$AD,$0C,$70                   ;0AA920|        |      ;
 
         DATA8_0AA924: db $90,$94,$10,$48                   ;0AA924|        |      ;
 
         DATA8_0AA928: db $90,$AE,$20,$58                   ;0AA928|        |      ;
 
         DATA8_0AA92C: db $90,$AD,$30,$68                   ;0AA92C|        |      ;
 
         DATA8_0AA930: db $90,$95,$20,$68                   ;0AA930|        |      ;
 
         DATA8_0AA934: db $90,$95,$30,$78                   ;0AA934|        |      ;
 
         DATA8_0AA938: db $90,$AD,$30,$78                   ;0AA938|        |      ;
 
         DATA8_0AA93C: db $90,$AE,$10,$78                   ;0AA93C|        |      ;
 
         DATA8_0AA940: db $90,$94,$0C,$48                   ;0AA940|        |      ;
 
         DATA8_0AA944: db $90,$AE,$0C,$38                   ;0AA944|        |      ;
 
         DATA8_0AA948: db $90,$AE,$30,$78                   ;0AA948|        |      ;
 
         DATA8_0AA94C: db $90,$96,$30,$78                   ;0AA94C|        |      ;
 
         DATA8_0AA950: db $90,$AD,$10,$70                   ;0AA950|        |      ;
 
         DATA8_0AA954: db $90,$95,$30,$50                   ;0AA954|        |      ;
 
         DATA8_0AA958: db $90,$95,$20,$98                   ;0AA958|        |      ;
 
         DATA8_0AA95C: db $90,$A6,$08,$88                   ;0AA95C|        |      ;
 
         DATA8_0AA960: db $90,$AE,$20,$38                   ;0AA960|        |      ;
 
         DATA8_0AA964: db $90,$AD,$20,$48                   ;0AA964|        |      ;
 
         DATA8_0AA968: db $90,$93,$10,$88                   ;0AA968|        |      ;
 
         DATA8_0AA96C: db $90,$AE,$20,$88                   ;0AA96C|        |      ;
 
         DATA8_0AA970: db $90,$A4,$20,$48                   ;0AA970|        |      ;
 
         DATA8_0AA974: db $91,$AE,$20,$B0                   ;0AA974|        |      ;
 
         DATA8_0AA978: db $91,$96,$20,$B0                   ;0AA978|        |      ;
 
         DATA8_0AA97C: db $91,$94,$10,$B0                   ;0AA97C|        |      ;
 
         DATA8_0AA980: db $90,$AE,$20,$48                   ;0AA980|        |      ;
 
         DATA8_0AA984: db $91,$AD,$10,$B0                   ;0AA984|        |      ;
 
         DATA8_0AA988: db $90,$97,$30,$50                   ;0AA988|        |      ;
 
         DATA8_0AA98C: db $90,$AE,$10,$A8                   ;0AA98C|        |      ;
 
         DATA8_0AA990: db $90,$AD,$24,$8C                   ;0AA990|        |      ;
 
         DATA8_0AA994: db $90,$A2,$00,$98                   ;0AA994|        |      ;
 
         DATA8_0AA998: db $90,$95,$10,$78                   ;0AA998|        |      ;
 
         DATA8_0AA99C: db $90,$AE,$00,$98                   ;0AA99C|        |      ;
 
         DATA8_0AA9A0: db $90,$A4,$10,$68                   ;0AA9A0|        |      ;
 
         DATA8_0AA9A4: db $90,$AE,$20,$68                   ;0AA9A4|        |      ;
 
         DATA8_0AA9A8: db $90,$AE,$00,$70                   ;0AA9A8|        |      ;
 
         DATA8_0AA9AC: db $90,$95,$10,$70                   ;0AA9AC|        |      ;
 
         DATA8_0AA9B0: db $90,$A4,$20,$88                   ;0AA9B0|        |      ;
 
         DATA8_0AA9B4: db $90,$97,$00,$68                   ;0AA9B4|        |      ;
 
         DATA8_0AA9B8: db $90,$AE,$08,$98                   ;0AA9B8|        |      ;
 
         DATA8_0AA9BC: db $90,$AD,$2A,$48                   ;0AA9BC|        |      ;
 
         DATA8_0AA9C0: db $90,$AE,$0C,$78                   ;0AA9C0|        |      ;
 
         DATA8_0AA9C4: db $90,$AE,$08,$68                   ;0AA9C4|        |      ;
 
         DATA8_0AA9C8: db $90,$A5,$20,$48                   ;0AA9C8|        |      ;
 
         DATA8_0AA9CC: db $90,$AD,$08,$48                   ;0AA9CC|        |      ;
 
         DATA8_0AA9D0: db $90,$AE,$10,$48                   ;0AA9D0|        |      ;
 
         DATA8_0AA9D4: db $90,$94,$20,$68                   ;0AA9D4|        |      ;
 
         DATA8_0AA9D8: db $90,$96,$28,$48                   ;0AA9D8|        |      ;
 
         DATA8_0AA9DC: db $90,$AE,$10,$88                   ;0AA9DC|        |      ;
 
         DATA8_0AA9E0: db $90,$95,$10,$88                   ;0AA9E0|        |      ;
 
         DATA8_0AA9E4: db $90,$A4,$20,$58                   ;0AA9E4|        |      ;
 
         DATA8_0AA9E8: db $90,$AD,$20,$88                   ;0AA9E8|        |      ;
 
         DATA8_0AA9EC: db $90,$AE,$10,$58                   ;0AA9EC|        |      ;
 
         DATA8_0AA9F0: db $90,$AD,$10,$88                   ;0AA9F0|        |      ;
 
         DATA8_0AA9F4: db $90,$93,$30,$68                   ;0AA9F4|        |      ;
 
         DATA8_0AA9F8: db $90,$AE,$20,$78                   ;0AA9F8|        |      ;
 
         DATA8_0AA9FC: db $90,$94,$10,$88                   ;0AA9FC|        |      ;
 
         DATA8_0AAA00: db $90,$95,$10,$38                   ;0AAA00|        |      ;
 
         DATA8_0AAA04: db $90,$AE,$10,$98                   ;0AAA04|        |      ;
 
         DATA8_0AAA08: db $90,$96,$24,$88                   ;0AAA08|        |      ;
 
         DATA8_0AAA0C: db $90,$AE,$08,$88                   ;0AAA0C|        |      ;
 
         DATA8_0AAA10: db $90,$AE,$08,$38                   ;0AAA10|        |      ;
 
         DATA8_0AAA14: db $90,$AD,$08,$38                   ;0AAA14|        |      ;
 
         DATA8_0AAA18: db $90,$AE,$20,$A8                   ;0AAA18|        |      ;
 
         DATA8_0AAA1C: db $90,$AE,$38,$48                   ;0AAA1C|        |      ;
 
         DATA8_0AAA20: db $90,$AD,$28,$88                   ;0AAA20|        |      ;
 
         DATA8_0AAA24: db $90,$95,$30,$88                   ;0AAA24|        |      ;
 
         DATA8_0AAA28: db $90,$AD,$18,$88                   ;0AAA28|        |      ;
 
         DATA8_0AAA2C: db $92,$AE,$20,$78                   ;0AAA2C|        |      ;
 
         DATA8_0AAA30: db $92,$A6,$30,$48                   ;0AAA30|        |      ;
 
         DATA8_0AAA34: db $92,$AD,$20,$58                   ;0AAA34|        |      ;
 
         DATA8_0AAA38: db $92,$97,$18,$48                   ;0AAA38|        |      ;
 
         DATA8_0AAA3C: db $92,$95,$18,$78                   ;0AAA3C|        |      ;
 
         DATA8_0AAA40: db $92,$A4,$0C,$70                   ;0AAA40|        |      ;
 
         DATA8_0AAA44: db $92,$AD,$18,$90                   ;0AAA44|        |      ;
 
         DATA8_0AAA48: db $92,$94,$18,$48                   ;0AAA48|        |      ;
 
         DATA8_0AAA4C: db $92,$A5,$34,$48                   ;0AAA4C|        |      ;
 
         DATA8_0AAA50: db $92,$96,$10,$78                   ;0AAA50|        |      ;
 
         DATA8_0AAA54: db $92,$A4,$18,$68                   ;0AAA54|        |      ;
 
         DATA8_0AAA58: db $92,$AD,$08,$40                   ;0AAA58|        |      ;
 
         DATA8_0AAA5C: db $92,$AD,$18,$68                   ;0AAA5C|        |      ;
 
         DATA8_0AAA60: db $92,$AE,$30,$68                   ;0AAA60|        |      ;
 
         DATA8_0AAA64: db $92,$AD,$30,$68                   ;0AAA64|        |      ;
 
         DATA8_0AAA68: db $92,$95,$08,$98                   ;0AAA68|        |      ;
 
         DATA8_0AAA6C: db $92,$A4,$18,$60                   ;0AAA6C|        |      ;
 
         DATA8_0AAA70: db $92,$A1,$30,$48                   ;0AAA70|        |      ;
 
         DATA8_0AAA74: db $92,$AE,$30,$58                   ;0AAA74|        |      ;
 
         DATA8_0AAA78: db $92,$95,$28,$48                   ;0AAA78|        |      ;
 
         DATA8_0AAA7C: db $90,$AE,$30,$48                   ;0AAA7C|        |      ;
 
         DATA8_0AAA80: db $90,$93,$30,$48                   ;0AAA80|        |      ;
 
         DATA8_0AAA84: db $90,$A4,$30,$68                   ;0AAA84|        |      ;
 
         DATA8_0AAA88: db $90,$AD,$30,$48                   ;0AAA88|        |      ;
 
         DATA8_0AAA8C: db $90,$AE,$30,$68                   ;0AAA8C|        |      ;
 
         DATA8_0AAA90: db $90,$AD,$10,$38                   ;0AAA90|        |      ;
 
         DATA8_0AAA94: db $90,$AE,$10,$68                   ;0AAA94|        |      ;
 
         DATA8_0AAA98: db $90,$97,$30,$48                   ;0AAA98|        |      ;
 
         DATA8_0AAA9C: db $90,$A5,$30,$A8                   ;0AAA9C|        |      ;
 
         DATA8_0AAAA0: db $90,$AD,$10,$48                   ;0AAAA0|        |      ;
 
         DATA8_0AAAA4: db $90,$95,$10,$68                   ;0AAAA4|        |      ;
 
         DATA8_0AAAA8: db $90,$AD,$30,$58                   ;0AAAA8|        |      ;
 
         DATA8_0AAAAC: db $90,$96,$30,$58                   ;0AAAAC|        |      ;
 
         DATA8_0AAAB0: db $90,$AE,$30,$88                   ;0AAAB0|        |      ;
 
         DATA8_0AAAB4: db $91,$AE,$30,$90                   ;0AAAB4|        |      ;
 
         DATA8_0AAAB8: db $91,$95,$20,$90                   ;0AAAB8|        |      ;
 
         DATA8_0AAABC: db $90,$A2,$20,$48                   ;0AAABC|        |      ;
 
         DATA8_0AAAC0: db $90,$96,$20,$68                   ;0AAAC0|        |      ;
 
         DATA8_0AAAC4: db $90,$AD,$20,$68                   ;0AAAC4|        |      ;
 
         DATA8_0AAAC8: db $90,$A2,$20,$68                   ;0AAAC8|        |      ;
 
         DATA8_0AAACC: db $90,$A1,$20,$68                   ;0AAACC|        |      ;
 
         DATA8_0AAAD0: db $91,$A4,$10,$C0                   ;0AAAD0|        |      ;
 
         DATA8_0AAAD4: db $90,$A1,$00,$A8                   ;0AAAD4|        |      ;
 
         DATA8_0AAAD8: db $90,$97,$30,$78                   ;0AAAD8|        |      ;
 
         DATA8_0AAADC: db $91,$93,$30,$70                   ;0AAADC|        |      ;
 
         DATA8_0AAAE0: db $90,$A6,$20,$40                   ;0AAAE0|        |      ;
 
         DATA8_0AAAE4: db $90,$AC,$18,$A8                   ;0AAAE4|        |      ;
 
         DATA8_0AAAE8: db $90,$AE,$10,$38                   ;0AAAE8|        |      ;
 
         DATA8_0AAAEC: db $90,$AD,$30,$A8                   ;0AAAEC|        |      ;
 
         DATA8_0AAAF0: db $90,$95,$30,$98                   ;0AAAF0|        |      ;
 
         DATA8_0AAAF4: db $90,$AE,$30,$98                   ;0AAAF4|        |      ;
 
         DATA8_0AAAF8: db $90,$AD,$38,$68                   ;0AAAF8|        |      ;
 
         DATA8_0AAAFC: db $90,$A6,$38,$58                   ;0AAAFC|        |      ;
 
         DATA8_0AAB00: db $90,$94,$30,$58                   ;0AAB00|        |      ;
 
         DATA8_0AAB04: db $90,$A4,$28,$48                   ;0AAB04|        |      ;
 
         DATA8_0AAB08: db $90,$AE,$18,$48                   ;0AAB08|        |      ;
 
         DATA8_0AAB0C: db $90,$AC,$10,$80                   ;0AAB0C|        |      ;
 
         DATA8_0AAB10: db $90,$AE,$00,$60                   ;0AAB10|        |      ;
 
         DATA8_0AAB14: db $90,$95,$30,$A8                   ;0AAB14|        |      ;
 
         DATA8_0AAB18: db $90,$AE,$30,$B8                   ;0AAB18|        |      ;
 
         DATA8_0AAB1C: db $90,$A5,$30,$38                   ;0AAB1C|        |      ;
 
         DATA8_0AAB20: db $90,$AD,$10,$B8                   ;0AAB20|        |      ;
 
         DATA8_0AAB24: db $90,$94,$10,$98                   ;0AAB24|        |      ;
 
         DATA8_0AAB28: db $90,$A5,$30,$98                   ;0AAB28|        |      ;
 
         DATA8_0AAB2C: db $90,$93,$10,$78                   ;0AAB2C|        |      ;
 
         DATA8_0AAB30: db $90,$AE,$38,$98                   ;0AAB30|        |      ;
 
         DATA8_0AAB34: db $90,$AE,$28,$88                   ;0AAB34|        |      ;
 
         DATA8_0AAB38: db $90,$AE,$10,$B8                   ;0AAB38|        |      ;
 
         DATA8_0AAB3C: db $90,$A6,$10,$98                   ;0AAB3C|        |      ;
 
         DATA8_0AAB40: db $90,$96,$20,$38                   ;0AAB40|        |      ;
 
         DATA8_0AAB44: db $90,$94,$10,$78                   ;0AAB44|        |      ;
 
         DATA8_0AAB48: db $90,$AE,$30,$58                   ;0AAB48|        |      ;
 
         DATA8_0AAB4C: db $90,$A4,$30,$58                   ;0AAB4C|        |      ;
 
         DATA8_0AAB50: db $90,$95,$10,$A8                   ;0AAB50|        |      ;
 
         DATA8_0AAB54: db $90,$96,$10,$50                   ;0AAB54|        |      ;
 
         DATA8_0AAB58: db $90,$94,$10,$68                   ;0AAB58|        |      ;
 
         DATA8_0AAB5C: db $90,$93,$20,$98                   ;0AAB5C|        |      ;
 
         DATA8_0AAB60: db $90,$A4,$30,$60                   ;0AAB60|        |      ;
 
         DATA8_0AAB64: db $90,$AE,$08,$70                   ;0AAB64|        |      ;
 
         DATA8_0AAB68: db $90,$AD,$28,$38                   ;0AAB68|        |      ;
 
         DATA8_0AAB6C: db $90,$A6,$38,$88                   ;0AAB6C|        |      ;
 
         DATA8_0AAB70: db $90,$AE,$18,$88                   ;0AAB70|        |      ;
 
         DATA8_0AAB74: db $90,$95,$38,$38                   ;0AAB74|        |      ;
 
         DATA8_0AAB78: db $90,$94,$28,$38                   ;0AAB78|        |      ;
 
         DATA8_0AAB7C: db $90,$96,$00,$A8                   ;0AAB7C|        |      ;
 
         DATA8_0AAB80: db $91,$AE,$10,$50                   ;0AAB80|        |      ;
 
         DATA8_0AAB84: db $90,$AD,$10,$58                   ;0AAB84|        |      ;
 
         DATA8_0AAB88: db $90,$96,$20,$A0                   ;0AAB88|        |      ;
 
         DATA8_0AAB8C: db $90,$AD,$10,$60                   ;0AAB8C|        |      ;
 
         DATA8_0AAB90: db $90,$95,$30,$48                   ;0AAB90|        |      ;
 
         DATA8_0AAB94: db $90,$96,$30,$A8                   ;0AAB94|        |      ;
 
         DATA8_0AAB98: db $90,$A7,$10,$58                   ;0AAB98|        |      ;
 
         DATA8_0AAB9C: db $90,$A6,$10,$48                   ;0AAB9C|        |      ;
 
         DATA8_0AABA0: db $90,$A7,$20,$58                   ;0AABA0|        |      ;
 
         DATA8_0AABA4: db $90,$A7,$20,$58                   ;0AABA4|        |      ;
 
         DATA8_0AABA8: db $90,$93,$20,$48                   ;0AABA8|        |      ;
 
         DATA8_0AABAC: db $91,$AE,$30,$B0                   ;0AABAC|        |      ;
 
         DATA8_0AABB0: db $90,$AD,$18,$48                   ;0AABB0|        |      ;
 
         DATA8_0AABB4: db $90,$AE,$30,$90                   ;0AABB4|        |      ;
 
         DATA8_0AABB8: db $90,$AE,$20,$98                   ;0AABB8|        |      ;
 
         DATA8_0AABBC: db $90,$94,$10,$38                   ;0AABBC|        |      ;
 
         DATA8_0AABC0: db $90,$A5,$20,$68                   ;0AABC0|        |      ;
 
         DATA8_0AABC4: db $90,$AD,$10,$68                   ;0AABC4|        |      ;
 
         DATA8_0AABC8: db $90,$A2,$30,$98                   ;0AABC8|        |      ;
 
         DATA8_0AABCC: db $90,$93,$10,$98                   ;0AABCC|        |      ;
 
         DATA8_0AABD0: db $90,$AD,$30,$B8                   ;0AABD0|        |      ;
 
         DATA8_0AABD4: db $90,$AA,$30,$50                   ;0AABD4|        |      ;
 
         DATA8_0AABD8: db $90,$AE,$38,$68                   ;0AABD8|        |      ;
 
         DATA8_0AABDC: db $90,$AE,$18,$68                   ;0AABDC|        |      ;
 
         DATA8_0AABE0: db $90,$97,$20,$98                   ;0AABE0|        |      ;
 
         DATA8_0AABE4: db $90,$AE,$30,$A0                   ;0AABE4|        |      ;
 
         DATA8_0AABE8: db $90,$AE,$00,$68                   ;0AABE8|        |      ;
 
         DATA8_0AABEC: db $90,$93,$30,$98                   ;0AABEC|        |      ;
 
         DATA8_0AABF0: db $91,$95,$10,$B0                   ;0AABF0|        |      ;
 
         DATA8_0AABF4: db $92,$AA,$18,$78                   ;0AABF4|        |      ;
 
         DATA8_0AABF8: db $90,$93,$30,$58                   ;0AABF8|        |      ;
 
         DATA8_0AABFC: db $90,$94,$18,$48                   ;0AABFC|        |      ;
 
         DATA8_0AAC00: db $90,$A5,$10,$74                   ;0AAC00|        |      ;
 
         DATA8_0AAC04: db $92,$AD,$18,$48                   ;0AAC04|        |      ;
 
         DATA8_0AAC08: db $90,$AE,$3C,$58                   ;0AAC08|        |      ;
 
         DATA8_0AAC0C: db $90,$96,$30,$48                   ;0AAC0C|        |      ;
 
         DATA8_0AAC10: db $90,$94,$0C,$98                   ;0AAC10|        |      ;
 
         DATA8_0AAC14: db $90,$94,$10,$B0                   ;0AAC14|        |      ;
 
         DATA8_0AAC18: db $90,$95,$10,$48                   ;0AAC18|        |      ;
 
         DATA8_0AAC1C: db $90,$AC,$28,$38                   ;0AAC1C|        |      ;
 
         DATA8_0AAC20: db $92,$95,$10,$78                   ;0AAC20|        |      ;
 
         DATA8_0AAC24: db $90,$AE,$30,$80                   ;0AAC24|        |      ;
 
         DATA8_0AAC28: db $90,$93,$20,$A0                   ;0AAC28|        |      ;
 
         DATA8_0AAC2C: db $90,$96,$10,$78                   ;0AAC2C|        |      ;
 
         DATA8_0AAC30: db $90,$AE,$18,$98                   ;0AAC30|        |      ;
 
         DATA8_0AAC34: db $01,$80,$90,$20,$A3               ;0AAC34|        |      ;
                       db $00,$00,$01,$52,$0D               ;0AAC39|        |      ;
                       db $D8,$AD,$00,$00,$01               ;0AAC3E|        |      ;
                       db $00,$90,$B8,$AE,$00               ;0AAC43|        |      ;
                       db $00,$00,$E0,$90,$28               ;0AAC48|        |      ;
                       db $AE,$00,$00,$00,$B2               ;0AAC4D|        |      ;
                       db $0D,$D8,$AD,$00,$00               ;0AAC52|        |      ;
                       db $00,$78,$0D,$28,$AD               ;0AAC57|        |      ;
                       db $00,$00,$00,$68,$90               ;0AAC5C|        |      ;
                       db $58,$AE,$00,$00,$00               ;0AAC61|        |      ;
                       db $20,$90,$40,$AD,$00               ;0AAC66|        |      ;
                       db $00,$00,$10,$90,$B8               ;0AAC6B|        |      ;
                       db $96,$00,$00,$FF                   ;0AAC70|        |      ;
 
         DATA8_0AAC74: db $02,$92,$90,$9C,$AE               ;0AAC74|        |      ;
                       db $00,$00,$02,$2C,$32               ;0AAC79|        |      ;
                       db $40,$AD,$00,$00,$02               ;0AAC7E|        |      ;
                       db $18,$90,$90,$AE,$00               ;0AAC83|        |      ;
                       db $00,$01,$F0,$90,$40               ;0AAC88|        |      ;
                       db $97,$00,$00,$01,$B8               ;0AAC8D|        |      ;
                       db $90,$D0,$AE,$00,$00               ;0AAC92|        |      ;
                       db $01,$AC,$40,$40,$AE               ;0AAC97|        |      ;
                       db $00,$00,$01,$84,$90               ;0AAC9C|        |      ;
                       db $40,$AE,$00,$00,$01               ;0AACA1|        |      ;
                       db $44,$90,$D0,$A5,$00               ;0AACA6|        |      ;
                       db $00,$01,$10,$90,$88               ;0AACAB|        |      ;
                       db $A3,$00,$00,$00,$B0               ;0AACB0|        |      ;
                       db $90,$D8,$AE,$00,$00               ;0AACB5|        |      ;
                       db $00,$50,$90,$80,$AE               ;0AACBA|        |      ;
                       db $00,$00,$00,$20,$90               ;0AACBF|        |      ;
                       db $30,$A4,$00,$00,$00               ;0AACC4|        |      ;
                       db $10,$90,$90,$AE,$00               ;0AACC9|        |      ;
                       db $00,$FF                           ;0AACCE|        |      ;
 
         DATA8_0AACD0: db $01,$80,$90,$18,$AE               ;0AACD0|        |      ;
                       db $00,$00,$01,$70,$4A               ;0AACD5|        |      ;
                       db $20,$AE,$00,$00,$01               ;0AACDA|        |      ;
                       db $68,$90,$88,$AE,$00               ;0AACDF|        |      ;
                       db $00,$01,$50,$90,$E0               ;0AACE4|        |      ;
                       db $93,$00,$00,$00,$60               ;0AACE9|        |      ;
                       db $90,$E0,$A3,$00,$00               ;0AACEE|        |      ;
                       db $00,$40,$4A,$80,$AE               ;0AACF3|        |      ;
                       db $00,$00,$00,$10,$90               ;0AACF8|        |      ;
                       db $88,$AE,$00,$00,$FF               ;0AACFD|        |      ;
 
         DATA8_0AAD02: db $02,$C0,$48,$80,$A3               ;0AAD02|        |      ;
                       db $F0,$00,$01,$E0,$48               ;0AAD07|        |      ;
                       db $80,$A3,$F0,$00,$01               ;0AAD0C|        |      ;
 
                       db $00,$48,$80,$A3,$F0               ;0AAD11|        |      ;
                       db $00,$00,$20,$48,$80               ;0AAD16|        |      ;
                       db $A3,$F0,$00,$FF                   ;0AAD1B|        |      ;
 
         DATA8_0AAD1F: db $00,$40,$48,$80,$A3               ;0AAD1F|        |      ;
                       db $0A,$00,$00,$D0,$48               ;0AAD24|        |      ;
                       db $80,$A3,$0A,$00,$01               ;0AAD29|        |      ;
 
                       db $40,$48,$80,$A3,$0A               ;0AAD2E|        |      ;
 
                       db $00,$02,$10,$48,$80               ;0AAD33|        |      ;
                       db $A3,$0A,$00,$02,$C0               ;0AAD38|        |      ;
                       db $48,$80,$A3,$0A,$00               ;0AAD3D|        |      ;
                       db $FF                               ;0AAD42|        |      ;
 
         DATA8_0AAD43: db $00,$08,$90,$88,$AE               ;0AAD43|        |      ;
                       db $00,$00,$00,$40,$4A               ;0AAD48|        |      ;
                       db $80,$AE,$00,$00,$00               ;0AAD4D|        |      ;
 
                       db $60,$90,$E0,$A3,$00               ;0AAD52|        |      ;
                       db $00,$01,$50,$90,$E0               ;0AAD57|        |      ;
                       db $AE,$00,$00,$01,$68               ;0AAD5C|        |      ;
                       db $90,$88,$AE,$00,$00               ;0AAD61|        |      ;
                       db $01,$70,$4A,$20,$AE               ;0AAD66|        |      ;
                       db $00,$00,$01,$78,$90               ;0AAD6B|        |      ;
                       db $20,$AE,$00,$00,$FF               ;0AAD70|        |      ;
 
         DATA8_0AAD75: db $00,$10,$90,$90,$AE               ;0AAD75|        |      ;
                       db $00,$00,$00,$20,$90               ;0AAD7A|        |      ;
                       db $30,$A4,$00,$00,$00               ;0AAD7F|        |      ;
                       db $50,$90,$80,$AE,$00               ;0AAD84|        |      ;
                       db $00,$00,$80,$4A,$80               ;0AAD89|        |      ;
                       db $AE,$00,$00,$00,$B0               ;0AAD8E|        |      ;
                       db $90,$D8,$AE,$00,$00               ;0AAD93|        |      ;
                       db $01,$10,$90,$88,$A3               ;0AAD98|        |      ;
                       db $00,$00,$01,$44,$90               ;0AAD9D|        |      ;
                       db $D0,$A5,$00,$00,$01               ;0AADA2|        |      ;
                       db $60,$4A,$80,$AE,$00               ;0AADA7|        |      ;
 
                       db $00,$01,$84,$90,$40               ;0AADAC|        |      ;
                       db $AE,$00,$00,$01,$A8               ;0AADB1|        |      ;
                       db $40,$40,$AE,$00,$00               ;0AADB6|        |      ;
 
                       db $01,$B8,$90,$D0,$AE               ;0AADBB|        |      ;
                       db $00,$00,$01,$D0,$4A               ;0AADC0|        |      ;
                       db $80,$AE,$00,$00,$01               ;0AADC5|        |      ;
 
                       db $F0,$90,$40,$A4,$00               ;0AADCA|        |      ;
                       db $00,$02,$18,$90,$90               ;0AADCF|        |      ;
                       db $97,$00,$00,$02,$28               ;0AADD4|        |      ;
                       db $32,$40,$AD,$00,$00               ;0AADD9|        |      ;
                       db $02,$92,$90,$9C,$AE               ;0AADDE|        |      ;
                       db $00,$00,$02,$A8,$90               ;0AADE3|        |      ;
                       db $30,$AD,$00,$00,$02               ;0AADE8|        |      ;
                       db $B0,$4C,$40,$AD,$00               ;0AADED|        |      ;
                       db $00,$FF                           ;0AADF2|        |      ;
 
         DATA8_0AADF4: db $02,$80,$90,$78,$AE               ;0AADF4|        |      ;
                       db $00,$00,$02,$60,$90               ;0AADF9|        |      ;
                       db $50,$A4,$00,$00,$02               ;0AADFE|        |      ;
                       db $40,$04,$10,$AE,$00               ;0AAE03|        |      ;
 
                       db $00,$02,$20,$90,$D0               ;0AAE08|        |      ;
                       db $AD,$00,$00,$01,$E6               ;0AAE0D|        |      ;
                       db $90,$30,$AE,$00,$00               ;0AAE12|        |      ;
                       db $01,$D0,$04,$10,$AE               ;0AAE17|        |      ;
                       db $00,$00,$01,$68,$90               ;0AAE1C|        |      ;
                       db $D0,$AE,$00,$00,$00               ;0AAE21|        |      ;
                       db $B6,$90,$70,$AD,$00               ;0AAE26|        |      ;
                       db $00,$00,$A0,$90,$28               ;0AAE2B|        |      ;
                       db $95,$00,$00,$00,$A0               ;0AAE30|        |      ;
                       db $04,$80,$AE,$00,$00               ;0AAE35|        |      ;
                       db $00,$40,$90,$D0,$AE               ;0AAE3A|        |      ;
                       db $00,$00,$00,$30,$04               ;0AAE3F|        |      ;
                       db $80,$AE,$00,$00,$00               ;0AAE44|        |      ;
                       db $10,$90,$20,$AE,$00               ;0AAE49|        |      ;
                       db $00,$FF                           ;0AAE4E|        |      ;
 
         DATA8_0AAE50: db $02,$8A,$40,$80,$A4               ;0AAE50|        |      ;
                       db $00,$00,$02,$5C,$40               ;0AAE55|        |      ;
                       db $60,$AE,$00,$00,$02               ;0AAE5A|        |      ;
 
                       db $55,$90,$50,$AE,$00               ;0AAE5F|        |      ;
                       db $00,$02,$10,$40,$50               ;0AAE64|        |      ;
                       db $A3,$00,$00,$01,$C0               ;0AAE69|        |      ;
                       db $90,$28,$AD,$00,$00               ;0AAE6E|        |      ;
                       db $01,$9E,$40,$C0,$AE               ;0AAE73|        |      ;
                       db $00,$00,$01,$5B,$40               ;0AAE78|        |      ;
                       db $C0,$AE,$00,$00,$01               ;0AAE7D|        |      ;
                       db $4A,$90,$70,$A4,$00               ;0AAE82|        |      ;
                       db $00,$01,$1E,$40,$40               ;0AAE87|        |      ;
                       db $AD,$00,$00,$00,$F0               ;0AAE8C|        |      ;
                       db $90,$B8,$AE,$00,$00               ;0AAE91|        |      ;
                       db $00,$C0,$90,$30,$A5               ;0AAE96|        |      ;
                       db $00,$00,$00,$8E,$40               ;0AAE9B|        |      ;
                       db $C0,$AD,$00,$00,$00               ;0AAEA0|        |      ;
                       db $70,$90,$90,$AE,$00               ;0AAEA5|        |      ;
                       db $00,$00,$64,$40,$40               ;0AAEAA|        |      ;
                       db $AD,$00,$00,$00,$30               ;0AAEAF|        |      ;
                       db $90,$B0,$AE,$00,$00               ;0AAEB4|        |      ;
                       db $00,$10,$90,$40,$AD               ;0AAEB9|        |      ;
                       db $00,$00,$FF                       ;0AAEBE|        |      ;
 
         DATA8_0AAEC1: db $01,$AA,$2A,$EC,$00               ;0AAEC1|        |      ;
                       db $00,$00,$01,$8A,$2A               ;0AAEC6|        |      ;
                       db $EC,$00,$00,$00,$01               ;0AAECB|        |      ;
                       db $6A,$2A,$0C,$00,$00               ;0AAED0|        |      ;
                       db $00,$01,$4A,$2A,$0C               ;0AAED5|        |      ;
                       db $00,$00,$01,$00,$CA               ;0AAEDA|        |      ;
                       db $2A,$EC,$00,$00,$01               ;0AAEDF|        |      ;
                       db $00,$8C,$2A,$0C,$00               ;0AAEE4|        |      ;
                       db $00,$01,$00,$6A,$2A               ;0AAEE9|        |      ;
                       db $EC,$00,$00,$00,$00               ;0AAEEE|        |      ;
                       db $4A,$2A,$0C,$00,$00               ;0AAEF3|        |      ;
                       db $00,$00,$2A,$2A,$EC               ;0AAEF8|        |      ;
                       db $00,$00,$00,$00,$0C               ;0AAEFD|        |      ;
                       db $2A,$0C,$00,$00,$00               ;0AAF02|        |      ;
                       db $FF,$00,$6C,$91,$30               ;0AAF07|        |      ;
                       db $AE,$00,$00,$00,$2C               ;0AAF0C|        |      ;
                       db $91,$18,$93,$00,$00               ;0AAF11|        |      ;
                       db $FF,$03,$90,$90,$E8               ;0AAF16|        |      ;
                       db $AE,$00,$00,$03,$88               ;0AAF1B|        |      ;
                       db $40,$80,$AE,$00,$00               ;0AAF20|        |      ;
 
                       db $03,$70,$90,$70,$93               ;0AAF25|        |      ;
                       db $00,$00,$03,$68,$90               ;0AAF2A|        |      ;
                       db $28,$AE,$00,$00,$03               ;0AAF2F|        |      ;
                       db $28,$90,$70,$AE,$00               ;0AAF34|        |      ;
                       db $00,$02,$D8,$11,$E0               ;0AAF39|        |      ;
                       db $AE,$00,$00,$02,$B8               ;0AAF3E|        |      ;
                       db $90,$D0,$AE,$00,$00               ;0AAF43|        |      ;
                       db $02,$A0,$90,$88,$AE               ;0AAF48|        |      ;
                       db $00,$00,$02,$68,$11               ;0AAF4D|        |      ;
                       db $A0,$AE,$00,$00,$02               ;0AAF52|        |      ;
                       db $50,$90,$40,$AE,$00               ;0AAF57|        |      ;
                       db $00,$02,$10,$90,$D0               ;0AAF5C|        |      ;
                       db $AE,$00,$00,$01,$E0               ;0AAF61|        |      ;
                       db $04,$F0,$AE,$00,$00               ;0AAF66|        |      ;
                       db $01,$D0,$40,$60,$AE               ;0AAF6B|        |      ;
                       db $00,$00,$01,$A8,$11               ;0AAF70|        |      ;
                       db $60,$AE,$00,$00,$01               ;0AAF75|        |      ;
                       db $90,$04,$F0,$AE,$00               ;0AAF7A|        |      ;
                       db $00,$01,$80,$90,$B0               ;0AAF7F|        |      ;
                       db $A2,$00,$00,$01,$40               ;0AAF84|        |      ;
                       db $90,$70,$A4,$00,$00               ;0AAF89|        |      ;
                       db $01,$20,$90,$B0,$93               ;0AAF8E|        |      ;
                       db $00,$00,$01,$0C,$40               ;0AAF93|        |      ;
                       db $D0,$93,$00,$00,$00               ;0AAF98|        |      ;
                       db $A8,$11,$50,$AE,$00               ;0AAF9D|        |      ;
                       db $00,$00,$80,$04,$F0               ;0AAFA2|        |      ;
                       db $AE,$00,$00,$00,$30               ;0AAFA7|        |      ;
                       db $04,$F0,$AE,$00,$00               ;0AAFAC|        |      ;
                       db $FF,$00,$50,$90,$10               ;0AAFB1|        |      ;
                       db $A6,$00,$00,$00,$68               ;0AAFB6|        |      ;
                       db $90,$50,$AE,$00,$00               ;0AAFBB|        |      ;
                       db $00,$B0,$90,$D0,$94               ;0AAFC0|        |      ;
                       db $00,$00,$01,$10,$90               ;0AAFC5|        |      ;
                       db $30,$AE,$00,$00,$01               ;0AAFCA|        |      ;
                       db $30,$90,$70,$AE,$00               ;0AAFCF|        |      ;
                       db $00,$FF,$01,$94,$2A               ;0AAFD4|        |      ;
                       db $EC,$00,$00,$01,$01               ;0AAFD9|        |      ;
                       db $40,$04,$F0,$AE,$00               ;0AAFDE|        |      ;
 
                       db $00,$01,$34,$2A,$14               ;0AAFE3|        |      ;
                       db $00,$00,$00,$01,$14               ;0AAFE8|        |      ;
                       db $2A,$EC,$00,$00,$00               ;0AAFED|        |      ;
                       db $00,$D4,$2A,$EC,$00               ;0AAFF2|        |      ;
                       db $00,$00,$00,$60,$04               ;0AAFF7|        |      ;
                       db $F0,$AE,$00,$00,$00               ;0AAFFC|        |      ;
                       db $54,$2A,$EC,$00,$00               ;0AB001|        |      ;
                       db $01,$00,$36,$2A,$14               ;0AB006|        |      ;
                       db $00,$00,$00,$FF,$03               ;0AB00B|        |      ;
                       db $90,$90,$30,$AE,$00               ;0AB010|        |      ;
                       db $00,$03,$94,$45,$80               ;0AB015|        |      ;
                       db $00,$00,$04,$03,$5B               ;0AB01A|        |      ;
                       db $11,$30,$00,$00,$00               ;0AB01F|        |      ;
                       db $03,$48,$90,$70,$AE               ;0AB024|        |      ;
                       db $00,$00,$03,$14,$11               ;0AB029|        |      ;
                       db $50,$00,$00,$00,$03               ;0AB02E|        |      ;
                       db $00,$90,$B0,$AE,$00               ;0AB033|        |      ;
                       db $00,$02,$B8,$90,$F0               ;0AB038|        |      ;
                       db $96,$00,$00,$02,$94               ;0AB03D|        |      ;
                       db $45,$60,$00,$00,$04               ;0AB042|        |      ;
                       db $02                               ;0AB047|        |      ;
 
         DATA8_0AB048: db $88,$90,$10,$AE,$00               ;0AB048|        |      ;
                       db $00,$02,$68,$90,$D0               ;0AB04D|        |      ;
                       db $AE,$00,$00,$02,$1C               ;0AB052|        |      ;
                       db $11,$80,$00,$00,$00               ;0AB057|        |      ;
                       db $01,$B4,$45,$80,$A4               ;0AB05C|        |      ;
                       db $00,$04,$01,$6C,$11               ;0AB061|        |      ;
                       db $70,$00,$00,$00,$01               ;0AB066|        |      ;
                       db $68,$90,$50,$AD,$00               ;0AB06B|        |      ;
                       db $00,$01,$40,$11,$60               ;0AB070|        |      ;
                       db $00,$00,$00,$01,$28               ;0AB075|        |      ;
                       db $90,$50,$AE,$00,$00               ;0AB07A|        |      ;
                       db $01,$08,$45,$50,$A4               ;0AB07F|        |      ;
                       db $00,$04,$00,$D8,$45               ;0AB084|        |      ;
                       db $80,$A4,$00,$04,$00               ;0AB089|        |      ;
                       db $C0,$90,$10,$AD,$00               ;0AB08E|        |      ;
                       db $00,$00,$60,$45,$C0               ;0AB093|        |      ;
                       db $A4,$00,$04,$00,$40               ;0AB098|        |      ;
                       db $45,$80,$A4,$00,$04               ;0AB09D|        |      ;
                       db $00,$30,$90,$90,$AE               ;0AB0A2|        |      ;
                       db $00,$00,$00,$20,$90               ;0AB0A7|        |      ;
                       db $30,$AE,$00,$00,$FF               ;0AB0AC|        |      ;
                       db $00,$D0,$48,$80,$A3               ;0AB0B1|        |      ;
                       db $F0,$00                           ;0AB0B6|        |      ;
 
         DATA8_0AB0B8: db $01,$10,$48,$80,$A3               ;0AB0B8|        |      ;
                       db $F0,$00,$01,$40,$90               ;0AB0BD|        |      ;
                       db $D0,$97,$00,$00,$01               ;0AB0C2|        |      ;
                       db $50,$48,$80,$A3,$F0               ;0AB0C7|        |      ;
                       db $00,$01,$60,$90,$8C               ;0AB0CC|        |      ;
                       db $AE,$00,$00,$01,$80               ;0AB0D1|        |      ;
                       db $48,$80,$A3,$F0,$00               ;0AB0D6|        |      ;
                       db $01,$C0,$90,$8C,$AE               ;0AB0DB|        |      ;
                       db $00,$00,$02,$18,$90               ;0AB0E0|        |      ;
                       db $D0,$AE,$00,$00,$FF               ;0AB0E5|        |      ;
 
          CODE_0AB0EA: LDA.B r_gameSubstate                 ;0AB0EA|A519    |000019;
                       db $20                               ;0AB0EC|        |      ;
                       dw jumpFromStackYXpreserved          ;0AB0ED|        |0FE86D;
                       dw DATA8_0AB119                      ;0AB0EF|        |0AB119;
                       dw gameStateC_substate01             ;0AB0F1|        |0AB135;
                       dw gameStateC_substate02             ;0AB0F3|        |0AB157;
                       dw gameStateC_substate03             ;0AB0F5|        |0AB160;
                       dw gameStateC_substate04             ;0AB0F7|        |0AB1BD;
                       dw gameStateC_substate05             ;0AB0F9|        |0AB1EF;
                       dw gameStateC_substate06             ;0AB0FB|        |0AB21D;
                       dw gameStateC_substate07             ;0AB0FD|        |0AB26C;
                       dw CODE_0AB4D9                       ;0AB0FF|        |0AB4D9;
                       dw gameStateC_substate09             ;0AB101|        |0AB4E3;
                       dw gameStateC_substate0a             ;0AB103|        |0AB31B;
                       dw DATA8_0AB378                      ;0AB105|        |0AB378;
                       dw gameStateC_substate0c             ;0AB107|        |0AB3D5;
                       dw gameStateC_substate0d             ;0AB109|        |0AB3ED;
                       dw gameStateC_substate0e             ;0AB10B|        |0AB3F5;
                       dw gameStateC_substate0f             ;0AB10D|        |0AB42D;
                       dw gameStateC_substate10             ;0AB10F|        |0AB457;
                       dw gameStateC_substate11             ;0AB111|        |0AB466;
                       dw gameStateC_substate12             ;0AB113|        |0AB4A4;
                       dw gameStateC_substate13             ;0AB115|        |0AB4AC;
                       dw gameStateC_substate14             ;0AB117|        |0AB4CA;
 
         DATA8_0AB119: db $20                               ;0AB119|        |      ;
                       dw UNREACH_0FE7F7                    ;0AB11A|        |0FE7F7;
 
gameStateC_substate00: db $20                               ;0AB11C|        |      ;
                       dw setBank_c000_1E                   ;0AB11D|        |0FE2DA;
                       LDA.B #$00                           ;0AB11F|A900    |      ;
                       STA.W $0418                          ;0AB121|8D1804  |0A0418;
                       STA.W $0419                          ;0AB124|8D1904  |0A0419;
                       STA.W $041A                          ;0AB127|8D1A04  |0A041A;
                       STA.W $041B                          ;0AB12A|8D1B04  |0A041B;
                       LDA.B #$01                           ;0AB12D|A901    |      ;
                       STA.W $0789                          ;0AB12F|8D8907  |0A0789;
                       JMP.W CODE_0AB4D9                    ;0AB132|4CD9B4  |0AB4D9;
 
 
gameStateC_substate01: JSR.W CODE_0AB5F3                    ;0AB135|20F3B5  |0AB5F3;
                       LDA.B $B4                            ;0AB138|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB13A|C9FF    |      ;
                       BEQ CODE_0AB150                      ;0AB13C|F012    |0AB150;
                       LDA.B r_sceneDrawQueue               ;0AB13E|A51D    |00001D;
                       PHA                                  ;0AB140|48      |      ;
                       LDA.B #$62                           ;0AB141|A962    |      ;
                       db $20                               ;0AB143|        |      ;
                       dw screenLoadRoutine                 ;0AB144|        |0FECE9;
                       db $20                               ;0AB146|        |      ;
                       dw UNREACH_0FE716                    ;0AB147|        |0FE716;
                       PLA                                  ;0AB149|68      |      ;
                       STA.B r_15                           ;0AB14A|8515    |000015;
                       db $20                               ;0AB14C|        |      ;
                       dw UNREACH_0FFBAF                    ;0AB14D|        |0FFBAF;
                       RTS                                  ;0AB14F|60      |      ;
 
 
          CODE_0AB150: LDA.B #$02                           ;0AB150|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;0AB152|851C    |00001C;
                       JMP.W gameStateC_incSubstate         ;0AB154|4C1AB2  |0AB21A;
 
 
gameStateC_substate02: JSR.W CODE_0AB5F3                    ;0AB157|20F3B5  |0AB5F3;
                       db $20                               ;0AB15A|        |      ;
                       dw CODE_0FE666                       ;0AB15B|        |0FE666;
                       JMP.W gameStateC_incSubstate         ;0AB15D|4C1AB2  |0AB21A;
 
 
gameStateC_substate03: JSR.W CODE_0AB5F3                    ;0AB160|20F3B5  |0AB5F3;
                       db $20                               ;0AB163|        |      ;
                       dw UNREACH_0FE7F7                    ;0AB164|        |0FE7F7;
                       JSR.W CODE_0AB452                    ;0AB166|2052B4  |0AB452;
                       JSR.W CODE_0AB19B                    ;0AB169|209BB1  |0AB19B;
                       LDA.B #$38                           ;0AB16C|A938    |      ;
                       STA.B r_CHR_BankSpr_0000             ;0AB16E|8546    |000046;
                       LDA.B #$39                           ;0AB170|A939    |      ;
                       STA.B r_CHR_BankSpr_0400             ;0AB172|8547    |000047;
                       LDA.B #$3D                           ;0AB174|A93D    |      ;
                       STA.B r_CHR_BankSpr_0800             ;0AB176|8548    |000048;
                       LDA.B #$3B                           ;0AB178|A93B    |      ;
                       STA.B r_CHR_BankSpr_0c00             ;0AB17A|8549    |000049;
                       LDA.B #$41                           ;0AB17C|A941    |      ;
                       STA.B r_CHR_BankBG_0000              ;0AB17E|854A    |00004A;
                       LDA.B #$3A                           ;0AB180|A93A    |      ;
                       STA.B r_CHR_BankBG_0400              ;0AB182|854B    |00004B;
                       LDA.B #$47                           ;0AB184|A947    |      ;
                       STA.B r_CHR_BankBG_0800              ;0AB186|854C    |00004C;
                       LDA.B #$6F                           ;0AB188|A96F    |      ;
                       STA.B r_CHR_BankBG_0c00              ;0AB18A|854D    |00004D;
                       INC.B r_gameSubstate                 ;0AB18C|E619    |000019;
                       LDA.B #$2A                           ;0AB18E|A92A    |      ;
                       db $20                               ;0AB190|        |      ;
                       dw screenLoadRoutine                 ;0AB191|        |0FECE9;
                       JSR.W CODE_0AB1A4                    ;0AB193|20A4B1  |0AB1A4;
                       LDA.B #$04                           ;0AB196|A904    |      ;
                       db $4C                               ;0AB198|        |      ;
 
                       dw screenLoadRoutine                 ;0AB199|        |0FECE9;
 
          CODE_0AB19B: LDA.B #$00                           ;0AB19B|A900    |      ;
                       STA.B r_HUD_CHR_overwrite            ;0AB19D|8572    |000072;
                       STA.B r_ScrollY                      ;0AB19F|85FC    |0000FC;
                       STA.B r_ScrollX                      ;0AB1A1|85FD    |0000FD;
                       RTS                                  ;0AB1A3|60      |      ;
 
 
          CODE_0AB1A4: JSR.W CODE_0AB1AA                    ;0AB1A4|20AAB1  |0AB1AA;
                       db $4C                               ;0AB1A7|        |      ;
 
                       dw screenLoadRoutine                 ;0AB1A8|        |0FECE9;
 
          CODE_0AB1AA: LDY.B r_partner                      ;0AB1AA|A43A    |00003A;
                       CPY.B #$FF                           ;0AB1AC|C0FF    |      ;
                       BNE CODE_0AB1B2                      ;0AB1AE|D002    |0AB1B2;
                       LDY.B #$00                           ;0AB1B0|A000    |      ;
 
          CODE_0AB1B2: STY.W $0782                          ;0AB1B2|8C8207  |0A0782;
                       LDA.W DATA8_0AB1B9,Y                 ;0AB1B5|B9B9B1  |0AB1B9;
                       RTS                                  ;0AB1B8|60      |      ;
 
 
         DATA8_0AB1B9: db $2B,$2B,$2C,$2D                   ;0AB1B9|        |      ;
 
gameStateC_substate04: JSR.W CODE_0AB5F3                    ;0AB1BD|20F3B5  |0AB5F3;
                       LDX.B #$20                           ;0AB1C0|A220    |      ;
                       db $20                               ;0AB1C2|        |      ;
                       dw loadCompressedTilemap2GFX         ;0AB1C3|        |0FEC04;
                       LDA.B #$00                           ;0AB1C5|A900    |      ;
                       LDX.B #$03                           ;0AB1C7|A203    |      ;
                       JSR.W CODE_0AB55F                    ;0AB1C9|205FB5  |0AB55F;
                       LDA.B #$01                           ;0AB1CC|A901    |      ;
                       LDX.B #$02                           ;0AB1CE|A202    |      ;
                       JSR.W CODE_0AB55F                    ;0AB1D0|205FB5  |0AB55F;
                       INC.B r_gameSubstate                 ;0AB1D3|E619    |000019;
                       LDA.B #$00                           ;0AB1D5|A900    |      ;
                       STA.W $0783                          ;0AB1D7|8D8307  |0A0783;
                       JSR.W CODE_0AB54A                    ;0AB1DA|204AB5  |0AB54A;
                       LDA.B #$44                           ;0AB1DD|A944    |      ;
                       STA.B r_updateNametable              ;0AB1DF|8525    |000025;
                       LDA.B #$23                           ;0AB1E1|A923    |      ;
                       LDX.B #$70                           ;0AB1E3|A270    |      ;
                       db $20                               ;0AB1E5|        |      ;
                       dw CODE_0FE5C1                       ;0AB1E6|        |0FE5C1;
                       LDY.B #$00                           ;0AB1E8|A000    |      ;
                       LDA.B #$80                           ;0AB1EA|A980    |      ;
                       db $4C                               ;0AB1EC|        |      ;
 
                       dw UNREACH_0FE58E                    ;0AB1ED|        |0FE58E;
 
gameStateC_substate05: JSR.W CODE_0AB5F3                    ;0AB1EF|20F3B5  |0AB5F3;
                       db $20                               ;0AB1F2|        |      ;
                       dw UNREACH_0FE579                    ;0AB1F3|        |0FE579;
                       BNE CODE_0AB21C                      ;0AB1F5|D025    |0AB21C;
                       LDA.B #$F0                           ;0AB1F7|A9F0    |      ;
                       STA.W $078A                          ;0AB1F9|8D8A07  |0A078A;
                       LDX.B #$03                           ;0AB1FC|A203    |      ;
                       LDA.B #$00                           ;0AB1FE|A900    |      ;
                       STA.W $0520,X                        ;0AB200|9D2005  |0A0520;
                       STA.W $04F2,X                        ;0AB203|9DF204  |0A04F2;
                       LDA.B #$40                           ;0AB206|A940    |      ;
                       STA.W $0537,X                        ;0AB208|9D3705  |0A0537;
                       LDA.B #$01                           ;0AB20B|A901    |      ;
                       STA.W $04F2,X                        ;0AB20D|9DF204  |0A04F2;
                       LDA.B #$01                           ;0AB210|A901    |      ;
                       STA.W $0784                          ;0AB212|8D8407  |0A0784;
                       LDA.B #$07                           ;0AB215|A907    |      ;
                       db $20                               ;0AB217|        |      ;
                       dw CODE_0FE25F                       ;0AB218|        |0FE25F;
 
gameStateC_incSubstate: INC.B r_gameSubstate                 ;0AB21A|E619    |000019;
 
          CODE_0AB21C: RTS                                  ;0AB21C|60      |      ;
 
 
gameStateC_substate06: JSR.W CODE_0AB5F3                    ;0AB21D|20F3B5  |0AB5F3;
                       DEC.W $078A                          ;0AB220|CE8A07  |0A078A;
                       BEQ CODE_0AB257                      ;0AB223|F032    |0AB257;
                       LDX.B #$03                           ;0AB225|A203    |      ;
                       CLC                                  ;0AB227|18      |      ;
                       LDA.W $04DB,X                        ;0AB228|BDDB04  |0A04DB;
                       ADC.W $0537,X                        ;0AB22B|7D3705  |0A0537;
                       STA.W $04DB,X                        ;0AB22E|9DDB04  |0A04DB;
                       LDA.W $041C,X                        ;0AB231|BD1C04  |0A041C;
                       db $7D,$20,$05                       ;0AB234|        |      ;
                       STA.W $041C,X                        ;0AB237|9D1C04  |0A041C;
                       CLC                                  ;0AB23A|18      |      ;
                       LDA.W $0438,X                        ;0AB23B|BD3804  |0A0438;
                       ADC.W $04F2,X                        ;0AB23E|7DF204  |0A04F2;
                       STA.W $0438,X                        ;0AB241|9D3804  |0A0438;
                       DEC.W $0784                          ;0AB244|CE8407  |0A0784;
                       BNE CODE_0AB256                      ;0AB247|D00D    |0AB256;
                       LDA.B #$02                           ;0AB249|A902    |      ;
                       STA.W $0784                          ;0AB24B|8D8407  |0A0784;
                       LDA.W $04F2,X                        ;0AB24E|BDF204  |0A04F2;
                       EOR.B #$FE                           ;0AB251|49FE    |      ;
                       STA.W $04F2,X                        ;0AB253|9DF204  |0A04F2;
 
          CODE_0AB256: RTS                                  ;0AB256|60      |      ;
 
 
          CODE_0AB257: LDA.B #$00                           ;0AB257|A900    |      ;
                       STA.W $0403                          ;0AB259|8D0304  |0A0403;
                       LDY.W $0782                          ;0AB25C|AC8207  |0A0782;
                       LDA.W DATA8_0AB268,Y                 ;0AB25F|B968B2  |0AB268;
                       STA.W $0783                          ;0AB262|8D8307  |0A0783;
                       JMP.W gameStateC_incSubstate         ;0AB265|4C1AB2  |0AB21A;
 
 
         DATA8_0AB268: db $00,$03,$10,$13                   ;0AB268|        |      ;
 
gameStateC_substate07: LDA.W $0783                          ;0AB26C|AD8307  |0A0783;
                       db $20                               ;0AB26F|        |      ;
                       dw jumpFromStackYXpreserved          ;0AB270|        |0FE86D;
                       dw gameStateC_783_00                 ;0AB272|        |0AB29E;
                       dw CODE_0AB2AF                       ;0AB274|        |0AB2AF;
                       dw CODE_0AB318                       ;0AB276|        |0AB318;
                       dw gameStateC_783_03                 ;0AB278|        |0AB2C1;
                       dw gameStateC_animateAndnext_783_afterTimer;0AB27A|        |0AB2B3;
                       dw gameStateC_783_05                 ;0AB27C|        |0AB2CD;
                       dw gameStateC_next_783_afterTimer    ;0AB27E|        |0AB2B8;
                       dw CODE_0AB2D2                       ;0AB280|        |0AB2D2;
                       dw gameStateC_animateAndnext_783_afterTimer;0AB282|        |0AB2B3;
                       dw CODE_0AB2DE                       ;0AB284|        |0AB2DE;
                       dw gameStateC_next_783_afterTimer    ;0AB286|        |0AB2B8;
                       dw CODE_0AB2E3                       ;0AB288|        |0AB2E3;
                       dw gameStateC_next_783_afterTimer    ;0AB28A|        |0AB2B8;
                       dw CODE_0AB2F4                       ;0AB28C|        |0AB2F4;
                       dw gameStateC_next_783_afterTimer    ;0AB28E|        |0AB2B8;
                       dw CODE_0AB318                       ;0AB290|        |0AB318;
                       dw CODE_0AB300                       ;0AB292|        |0AB300;
                       dw gameStateC_animateAndnext_783_afterTimer;0AB294|        |0AB2B3;
                       dw CODE_0AB318                       ;0AB296|        |0AB318;
                       dw CODE_0AB30C                       ;0AB298|        |0AB30C;
                       dw gameStateC_animateAndnext_783_afterTimer;0AB29A|        |0AB2B3;
                       dw CODE_0AB318                       ;0AB29C|        |0AB318;
 
    gameStateC_783_00: LDX.B #$00                           ;0AB29E|A200    |      ;
                       LDY.B #$00                           ;0AB2A0|A000    |      ;
                       JSR.W CODE_0AB521                    ;0AB2A2|2021B5  |0AB521;
                       LDA.B #$80                           ;0AB2A5|A980    |      ;
 
gameStateC_inc783_setTimerA: INC.W $0783                          ;0AB2A7|EE8307  |0A0783;
                       LDY.B #$00                           ;0AB2AA|A000    |      ;
                       db $4C                               ;0AB2AC|        |      ;
 
                       dw UNREACH_0FE58E                    ;0AB2AD|        |0FE58E;
 
          CODE_0AB2AF: LDX.B #$00                           ;0AB2AF|A200    |      ;
                       BEQ DATA8_0AB2B5                     ;0AB2B1|F002    |0AB2B5;
 
gameStateC_animateAndnext_783_afterTimer: LDX.B #$01                           ;0AB2B3|A201    |      ;
 
         DATA8_0AB2B5: db $20                               ;0AB2B5|        |      ;
                       dw CODE_0FEF75                       ;0AB2B6|        |0FEF75;
 
gameStateC_next_783_afterTimer: db $20                               ;0AB2B8|        |      ;
                       dw UNREACH_0FE579                    ;0AB2B9|        |0FE579;
                       BNE CODE_0AB2C0                      ;0AB2BB|D003    |0AB2C0;
                       INC.W $0783                          ;0AB2BD|EE8307  |0A0783;
 
          CODE_0AB2C0: RTS                                  ;0AB2C0|60      |      ;
 
 
    gameStateC_783_03: LDX.B #$01                           ;0AB2C1|A201    |      ;
                       LDY.B #$03                           ;0AB2C3|A003    |      ;
                       JSR.W CODE_0AB521                    ;0AB2C5|2021B5  |0AB521;
                       LDA.B #$18                           ;0AB2C8|A918    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB2CA|4CA7B2  |0AB2A7;
 
 
    gameStateC_783_05: LDA.B #$40                           ;0AB2CD|A940    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB2CF|4CA7B2  |0AB2A7;
 
 
          CODE_0AB2D2: LDX.B #$01                           ;0AB2D2|A201    |      ;
                       LDY.B #$04                           ;0AB2D4|A004    |      ;
                       JSR.W CODE_0AB521                    ;0AB2D6|2021B5  |0AB521;
                       LDA.B #$30                           ;0AB2D9|A930    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB2DB|4CA7B2  |0AB2A7;
 
 
          CODE_0AB2DE: LDA.B #$40                           ;0AB2DE|A940    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB2E0|4CA7B2  |0AB2A7;
 
 
          CODE_0AB2E3: LDA.B #$00                           ;0AB2E3|A900    |      ;
                       STA.W $0400                          ;0AB2E5|8D0004  |0A0400;
                       LDX.B #$01                           ;0AB2E8|A201    |      ;
                       LDA.B #$3E                           ;0AB2EA|A93E    |      ;
                       JSR.W CODE_0AB518                    ;0AB2EC|2018B5  |0AB518;
                       LDA.B #$20                           ;0AB2EF|A920    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB2F1|4CA7B2  |0AB2A7;
 
 
          CODE_0AB2F4: LDX.B #$01                           ;0AB2F4|A201    |      ;
                       LDA.B #$40                           ;0AB2F6|A940    |      ;
                       JSR.W CODE_0AB518                    ;0AB2F8|2018B5  |0AB518;
                       LDA.B #$80                           ;0AB2FB|A980    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB2FD|4CA7B2  |0AB2A7;
 
 
          CODE_0AB300: LDX.B #$01                           ;0AB300|A201    |      ;
                       LDY.B #$01                           ;0AB302|A001    |      ;
                       JSR.W CODE_0AB521                    ;0AB304|2021B5  |0AB521;
                       LDA.B #$20                           ;0AB307|A920    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB309|4CA7B2  |0AB2A7;
 
 
          CODE_0AB30C: LDX.B #$01                           ;0AB30C|A201    |      ;
                       LDY.B #$02                           ;0AB30E|A002    |      ;
                       JSR.W CODE_0AB521                    ;0AB310|2021B5  |0AB521;
                       LDA.B #$80                           ;0AB313|A980    |      ;
                       JMP.W gameStateC_inc783_setTimerA    ;0AB315|4CA7B2  |0AB2A7;
 
 
          CODE_0AB318: INC.B r_gameSubstate                 ;0AB318|E619    |000019;
                       RTS                                  ;0AB31A|60      |      ;
 
 
gameStateC_substate0a: LDY.W $0782                          ;0AB31B|AC8207  |0A0782;
                       LDA.W DATA8_0AB374,Y                 ;0AB31E|B974B3  |0AB374;
                       STA.W $0790                          ;0AB321|8D9007  |0A0790;
                       LDA.B #$28                           ;0AB324|A928    |      ;
                       STA.W $0791                          ;0AB326|8D9107  |0A0791;
                       LDA.B #$68                           ;0AB329|A968    |      ;
                       db $20                               ;0AB32B|        |      ;
                       dw CODE_0FE25F                       ;0AB32C|        |0FE25F;
                       db $20                               ;0AB32E|        |      ;
                       dw setNameTableMapping_E4            ;0AB32F|        |0FEBFD;
                       db $20                               ;0AB331|        |      ;
                       dw CODE_0FE666                       ;0AB332|        |0FE666;
                       LDA.B #$50                           ;0AB334|A950    |      ;
                       STA.B r_updateNametable              ;0AB336|8525    |000025;
                       LDY.W $0782                          ;0AB338|AC8207  |0A0782;
                       LDA.W DATA8_0AB5A5,Y                 ;0AB33B|B9A5B5  |0AB5A5;
                       STA.W $0785                          ;0AB33E|8D8507  |0A0785;
                       TAY                                  ;0AB341|A8      |      ;
                       LDA.W DATA8_0AB5A9,Y                 ;0AB342|B9A9B5  |0AB5A9;
                       JSR.W CODE_0AB5EE                    ;0AB345|20EEB5  |0AB5EE;
                       INC.W $0785                          ;0AB348|EE8507  |0A0785;
                       JSR.W CODE_0AB19B                    ;0AB34B|209BB1  |0AB19B;
                       LDA.B #$41                           ;0AB34E|A941    |      ;
                       STA.B r_CHR_BankBG_0000              ;0AB350|854A    |00004A;
                       LDA.B #$41                           ;0AB352|A941    |      ;
                       STA.B r_CHR_BankBG_0400              ;0AB354|854B    |00004B;
                       LDA.B #$36                           ;0AB356|A936    |      ;
                       STA.B r_CHR_BankBG_0800              ;0AB358|854C    |00004C;
                       LDA.B #$6F                           ;0AB35A|A96F    |      ;
                       STA.B r_CHR_BankBG_0c00              ;0AB35C|854D    |00004D;
                       LDA.B #$00                           ;0AB35E|A900    |      ;
                       STA.W $0788                          ;0AB360|8D8807  |0A0788;
                       JSR.W gameStateC_incSubstate         ;0AB363|201AB2  |0AB21A;
                       LDY.W $0782                          ;0AB366|AC8207  |0A0782;
                       LDA.W DATA8_0AB370,Y                 ;0AB369|B970B3  |0AB370;
                       STA.W $078A                          ;0AB36C|8D8A07  |0A078A;
                       RTS                                  ;0AB36F|60      |      ;
 
 
         DATA8_0AB370: db $D0,$C0,$C0,$C0                   ;0AB370|        |      ;
 
         DATA8_0AB374: db $4D,$4D,$2D,$AD                   ;0AB374|        |      ;
 
         DATA8_0AB378: db $CE,$8A,$07,$D0,$13               ;0AB378|        |      ;
                       db $20,$66,$B3                       ;0AB37D|        |      ;
                       LDY.W $0785                          ;0AB380|AC8507  |0A0785;
                       LDA.W DATA8_0AB5A9,Y                 ;0AB383|B9A9B5  |0AB5A9;
                       CMP.B #$FF                           ;0AB386|C9FF    |      ;
                       BEQ CODE_0AB3B6                      ;0AB388|F02C    |0AB3B6;
                       JSR.W CODE_0AB5EE                    ;0AB38A|20EEB5  |0AB5EE;
                       INC.W $0785                          ;0AB38D|EE8507  |0A0785;
 
          CODE_0AB390: LDY.W $0782                          ;0AB390|AC8207  |0A0782;
                       INC.W $0788                          ;0AB393|EE8807  |0A0788;
                       LDA.W $0788                          ;0AB396|AD8807  |0A0788;
                       CMP.W DATA8_0AB3D1,Y                 ;0AB399|D9D1B3  |0AB3D1;
                       BNE CODE_0AB3B5                      ;0AB39C|D017    |0AB3B5;
                       LDA.B #$00                           ;0AB39E|A900    |      ;
                       STA.W $0788                          ;0AB3A0|8D8807  |0A0788;
                       INC.B r_ScrollY                      ;0AB3A3|E6FC    |0000FC;
                       LDA.B r_ScrollY                      ;0AB3A5|A5FC    |0000FC;
                       CMP.B #$F0                           ;0AB3A7|C9F0    |      ;
                       BNE CODE_0AB3B5                      ;0AB3A9|D00A    |0AB3B5;
                       LDA.B #$00                           ;0AB3AB|A900    |      ;
                       STA.B r_ScrollY                      ;0AB3AD|85FC    |0000FC;
                       LDA.B r_PPUCtrl                      ;0AB3AF|A5FF    |0000FF;
                       EOR.B #$02                           ;0AB3B1|4902    |      ;
                       STA.B r_PPUCtrl                      ;0AB3B3|85FF    |0000FF;
 
          CODE_0AB3B5: RTS                                  ;0AB3B5|60      |      ;
 
 
          CODE_0AB3B6: LDY.W $0782                          ;0AB3B6|AC8207  |0A0782;
                       LDA.W DATA8_0AB3C9,Y                 ;0AB3B9|B9C9B3  |0AB3C9;
                       STA.B $00                            ;0AB3BC|8500    |000000;
                       LDA.W DATA8_0AB3CD,Y                 ;0AB3BE|B9CDB3  |0AB3CD;
                       LDY.B $00                            ;0AB3C1|A400    |000000;
                       db $20                               ;0AB3C3|        |      ;
                       dw UNREACH_0FE58E                    ;0AB3C4|        |0FE58E;
                       JMP.W gameStateC_incSubstate         ;0AB3C6|4C1AB2  |0AB21A;
 
 
         DATA8_0AB3C9: db $01,$02,$02,$01                   ;0AB3C9|        |      ;
 
         DATA8_0AB3CD: db $60,$00,$40,$90                   ;0AB3CD|        |      ;
 
         DATA8_0AB3D1: db $06,$06,$06,$05                   ;0AB3D1|        |      ;
 
gameStateC_substate0c: JSR.W CODE_0AB390                    ;0AB3D5|2090B3  |0AB390;
                       db $20                               ;0AB3D8|        |      ;
                       dw UNREACH_0FE579                    ;0AB3D9|        |0FE579;
                       BNE CODE_0AB3E8                      ;0AB3DB|D00B    |0AB3E8;
                       INC.B r_gameSubstate                 ;0AB3DD|E619    |000019;
                       LDY.W $0782                          ;0AB3DF|AC8207  |0A0782;
                       LDA.W CODE_0AB3E9,Y                  ;0AB3E2|B9E9B3  |0AB3E9;
                       STA.W $078A                          ;0AB3E5|8D8A07  |0A078A;
 
          CODE_0AB3E8: RTS                                  ;0AB3E8|60      |      ;
 
 
          CODE_0AB3E9: ORA.B ($01,X)                        ;0AB3E9|0101    |000001;
                       ORA.B (r_sceneAddr,X)                ;0AB3EB|0150    |000050;
 
gameStateC_substate0d: DEC.W $078A                          ;0AB3ED|CE8A07  |0A078A;
                       BNE CODE_0AB3E8                      ;0AB3F0|D0F6    |0AB3E8;
                       JMP.W CODE_0AB4D9                    ;0AB3F2|4CD9B4  |0AB4D9;
 
 
gameStateC_substate0e: LDA.B $B4                            ;0AB3F5|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB3F7|C9FF    |      ;
                       BEQ CODE_0AB417                      ;0AB3F9|F01C    |0AB417;
                       LDA.B r_sceneDrawQueue               ;0AB3FB|A51D    |00001D;
                       PHA                                  ;0AB3FD|48      |      ;
                       LDA.B #$5E                           ;0AB3FE|A95E    |      ;
                       db $20                               ;0AB400|        |      ;
                       dw screenLoadRoutine                 ;0AB401|        |0FECE9;
                       JSR.W CODE_0AB1AA                    ;0AB403|20AAB1  |0AB1AA;
                       CLC                                  ;0AB406|18      |      ;
                       ADC.B #$04                           ;0AB407|6904    |      ;
                       db $20                               ;0AB409|        |      ;
                       dw screenLoadRoutine                 ;0AB40A|        |0FECE9;
                       LDA.B #$04                           ;0AB40C|A904    |      ;
                       db $20                               ;0AB40E|        |      ;
                       dw screenLoadRoutine                 ;0AB40F|        |0FECE9;
                       PLA                                  ;0AB411|68      |      ;
                       STA.B r_15                           ;0AB412|8515    |000015;
                       db $4C                               ;0AB414|        |      ;
 
                       dw UNREACH_0FFBAF                    ;0AB415|        |0FFBAF;
 
          CODE_0AB417: LDX.B #$00                           ;0AB417|A200    |      ;
 
          CODE_0AB419: LDA.B #$00                           ;0AB419|A900    |      ;
                       STA.W $0400,X                        ;0AB41B|9D0004  |0A0400;
                       INX                                  ;0AB41E|E8      |      ;
                       CPX.B #$04                           ;0AB41F|E004    |      ;
                       BCC CODE_0AB419                      ;0AB421|90F6    |0AB419;
                       LDY.B #$00                           ;0AB423|A000    |      ;
                       LDA.B #$40                           ;0AB425|A940    |      ;
                       db $20                               ;0AB427|        |      ;
                       dw UNREACH_0FE58E                    ;0AB428|        |0FE58E;
                       JMP.W gameStateC_incSubstate         ;0AB42A|4C1AB2  |0AB21A;
 
 
gameStateC_substate0f: db $20                               ;0AB42D|        |      ;
                       dw UNREACH_0FE579                    ;0AB42E|        |0FE579;
                       BEQ CODE_0AB433                      ;0AB430|F001    |0AB433;
                       RTS                                  ;0AB432|60      |      ;
 
 
          CODE_0AB433: JSR.W CODE_0AB19B                    ;0AB433|209BB1  |0AB19B;
                       LDA.B #$41                           ;0AB436|A941    |      ;
                       STA.B r_CHR_BankBG_0000              ;0AB438|854A    |00004A;
                       LDY.B #$70                           ;0AB43A|A070    |      ;
                       STY.B r_CHR_BankBG_0400              ;0AB43C|844B    |00004B;
                       INY                                  ;0AB43E|C8      |      ;
                       STY.B r_CHR_BankBG_0800              ;0AB43F|844C    |00004C;
                       INY                                  ;0AB441|C8      |      ;
                       STY.B r_CHR_BankBG_0c00              ;0AB442|844D    |00004D;
                       LDA.B #$B2                           ;0AB444|A9B2    |      ;
                       STA.B r_PPUCtrl                      ;0AB446|85FF    |0000FF;
                       LDX.B #$22                           ;0AB448|A222    |      ;
                       LDA.B #$84                           ;0AB44A|A984    |      ;
                       db $20                               ;0AB44C|        |      ;
                       dw screenLoadRoutine01               ;0AB44D|        |0FEBD5;
                       JMP.W gameStateC_incSubstate         ;0AB44F|4C1AB2  |0AB21A;
 
 
          CODE_0AB452: LDA.B #$B0                           ;0AB452|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;0AB454|85FF    |0000FF;
                       RTS                                  ;0AB456|60      |      ;
 
 
gameStateC_substate10: LDX.B #$24                           ;0AB457|A224    |      ;
                       db $20                               ;0AB459|        |      ;
                       dw loadCompressedTilemap2GFX         ;0AB45A|        |0FEC04;
                       LDY.B #$00                           ;0AB45C|A000    |      ;
                       LDA.B #$78                           ;0AB45E|A978    |      ;
                       db $20                               ;0AB460|        |      ;
                       dw UNREACH_0FE58E                    ;0AB461|        |0FE58E;
                       JMP.W CODE_0AB4D9                    ;0AB463|4CD9B4  |0AB4D9;
 
 
gameStateC_substate11: db $20                               ;0AB466|        |      ;
                       dw UNREACH_0FE579                    ;0AB467|        |0FE579;
                       BNE CODE_0AB475                      ;0AB469|D00A    |0AB475;
                       LDY.B #$01                           ;0AB46B|A001    |      ;
                       LDA.B #$00                           ;0AB46D|A900    |      ;
                       db $20                               ;0AB46F|        |      ;
                       dw UNREACH_0FE58E                    ;0AB470|        |0FE58E;
 
          CODE_0AB472: INC.B r_gameSubstate                 ;0AB472|E619    |000019;
 
          CODE_0AB474: RTS                                  ;0AB474|60      |      ;
 
 
          CODE_0AB475: LDA.B $B4                            ;0AB475|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB477|C9FF    |      ;
                       BEQ CODE_0AB474                      ;0AB479|F0F9    |0AB474;
                       LDA.B r_sceneDrawQueue               ;0AB47B|A51D    |00001D;
                       PHA                                  ;0AB47D|48      |      ;
                       JSR.W CODE_0AB491                    ;0AB47E|2091B4  |0AB491;
                       PLA                                  ;0AB481|68      |      ;
                       STA.B r_15                           ;0AB482|8515    |000015;
                       db $20                               ;0AB484|        |      ;
                       dw UNREACH_0FFBA4                    ;0AB485|        |0FFBA4;
                       LDA.B $B4                            ;0AB487|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB489|C9FF    |      ;
                       BNE CODE_0AB474                      ;0AB48B|D0E7    |0AB474;
                       LDA.B r_15                           ;0AB48D|A515    |000015;
                       STA.B r_sceneDrawQueue               ;0AB48F|851D    |00001D;
 
          CODE_0AB491: LDA.B #$5E                           ;0AB491|A95E    |      ;
                       db $20                               ;0AB493|        |      ;
                       dw screenLoadRoutine                 ;0AB494|        |0FECE9;
                       JSR.W CODE_0AB1AA                    ;0AB496|20AAB1  |0AB1AA;
                       CLC                                  ;0AB499|18      |      ;
                       ADC.B #$04                           ;0AB49A|6904    |      ;
                       db $20                               ;0AB49C|        |      ;
                       dw screenLoadRoutine                 ;0AB49D|        |0FECE9;
                       LDA.B #$04                           ;0AB49F|A904    |      ;
                       db $4C                               ;0AB4A1|        |      ;
 
                       dw screenLoadRoutine                 ;0AB4A2|        |0FECE9;
 
gameStateC_substate12: db $20                               ;0AB4A4|        |      ;
                       dw UNREACH_0FE579                    ;0AB4A5|        |0FE579;
                       BNE CODE_0AB4D8                      ;0AB4A7|D02F    |0AB4D8;
                       JMP.W CODE_0AB4D9                    ;0AB4A9|4CD9B4  |0AB4D9;
 
 
gameStateC_substate13: LDA.B $B4                            ;0AB4AC|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB4AE|C9FF    |      ;
                       BEQ CODE_0AB472                      ;0AB4B0|F0C0    |0AB472;
                       LDA.B r_sceneDrawQueue               ;0AB4B2|A51D    |00001D;
                       PHA                                  ;0AB4B4|48      |      ;
                       LDA.B #$5E                           ;0AB4B5|A95E    |      ;
                       db $20                               ;0AB4B7|        |      ;
                       dw screenLoadRoutine                 ;0AB4B8|        |0FECE9;
                       LDA.B #$0A                           ;0AB4BA|A90A    |      ;
                       db $20                               ;0AB4BC|        |      ;
                       dw screenLoadRoutine                 ;0AB4BD|        |0FECE9;
                       LDA.B #$04                           ;0AB4BF|A904    |      ;
                       db $20                               ;0AB4C1|        |      ;
                       dw screenLoadRoutine                 ;0AB4C2|        |0FECE9;
                       PLA                                  ;0AB4C4|68      |      ;
                       STA.B r_15                           ;0AB4C5|8515    |000015;
                       db $4C                               ;0AB4C7|        |      ;
 
                       dw UNREACH_0FFBAF                    ;0AB4C8|        |0FFBAF;
 
gameStateC_substate14: LDA.W $0789                          ;0AB4CA|AD8907  |0A0789;
                       STA.W $0781                          ;0AB4CD|8D8107  |0A0781;
                       LDA.B #$0D                           ;0AB4D0|A90D    |      ;
                       STA.B r_gameState                    ;0AB4D2|8518    |000018;
                       LDA.B #$00                           ;0AB4D4|A900    |      ;
                       STA.B r_gameSubstate                 ;0AB4D6|8519    |000019;
 
          CODE_0AB4D8: RTS                                  ;0AB4D8|60      |      ;
 
 
          CODE_0AB4D9: LDY.B #$00                           ;0AB4D9|A000    |      ;
                       STY.B $B4                            ;0AB4DB|84B4    |0000B4;
                       INY                                  ;0AB4DD|C8      |      ;
                       STY.B $B5                            ;0AB4DE|84B5    |0000B5;
 
          CODE_0AB4E0: JMP.W gameStateC_incSubstate         ;0AB4E0|4C1AB2  |0AB21A;
 
 
gameStateC_substate09: LDA.B $B4                            ;0AB4E3|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB4E5|C9FF    |      ;
                       BEQ CODE_0AB507                      ;0AB4E7|F01E    |0AB507;
                       LDA.B r_sceneDrawQueue               ;0AB4E9|A51D    |00001D;
                       PHA                                  ;0AB4EB|48      |      ;
                       LDA.B #$2A                           ;0AB4EC|A92A    |      ;
                       db $20                               ;0AB4EE|        |      ;
                       dw screenLoadRoutine                 ;0AB4EF|        |0FECE9;
                       LDA.B r_sceneDrawQueue               ;0AB4F1|A51D    |00001D;
                       STA.W $0787                          ;0AB4F3|8D8707  |0A0787;
                       JSR.W CODE_0AB1A4                    ;0AB4F6|20A4B1  |0AB1A4;
                       PLA                                  ;0AB4F9|68      |      ;
                       STA.B r_15                           ;0AB4FA|8515    |000015;
                       db $20                               ;0AB4FC|        |      ;
                       dw UNREACH_0FFBAF                    ;0AB4FD|        |0FFBAF;
                       LDA.W $0787                          ;0AB4FF|AD8707  |0A0787;
                       STA.B r_sceneDrawQueue               ;0AB502|851D    |00001D;
                       JMP.W CODE_0AB1A4                    ;0AB504|4CA4B1  |0AB1A4;
 
 
          CODE_0AB507: LDA.B #$2E                           ;0AB507|A92E    |      ;
                       db $20                               ;0AB509|        |      ;
                       dw screenLoadRoutine                 ;0AB50A|        |0FECE9;
                       JSR.W CODE_0AB1AA                    ;0AB50C|20AAB1  |0AB1AA;
                       CLC                                  ;0AB50F|18      |      ;
                       ADC.B #$04                           ;0AB510|6904    |      ;
                       db $20                               ;0AB512|        |      ;
                       dw screenLoadRoutine                 ;0AB513|        |0FECE9;
                       JMP.W CODE_0AB4E0                    ;0AB515|4CE0B4  |0AB4E0;
 
 
          CODE_0AB518: STA.W $0400,X                        ;0AB518|9D0004  |0A0400;
                       LDA.B #$14                           ;0AB51B|A914    |      ;
                       STA.W $048C,X                        ;0AB51D|9D8C04  |0A048C;
                       RTS                                  ;0AB520|60      |      ;
 
 
          CODE_0AB521: LDA.B #$14                           ;0AB521|A914    |      ;
                       db $20                               ;0AB523|        |      ;
                       dw CODE_0FEF5C                       ;0AB524|        |0FEF5C;
 
                       db $4C                               ;0AB526|        |      ;
 
                       dw CODE_0FEF75                       ;0AB527|        |0FEF75;
                       LDA.W $0470,X                        ;0AB529|BD7004  |0A0470;
                       ORA.B #$20                           ;0AB52C|0920    |      ;
                       STA.W $0470,X                        ;0AB52E|9D7004  |0A0470;
 
          CODE_0AB531: RTS                                  ;0AB531|60      |      ;
 
                       LDA.W $0470,X                        ;0AB532|BD7004  |0A0470;
                       AND.B #$DF                           ;0AB535|29DF    |      ;
                       STA.W $0470,X                        ;0AB537|9D7004  |0A0470;
 
          CODE_0AB53A: RTS                                  ;0AB53A|60      |      ;
 
                       LDA.W $0400,X                        ;0AB53B|BD0004  |0A0400;
                       BEQ CODE_0AB53A                      ;0AB53E|F0FA    |0AB53A;
                       LDA.W $0470,X                        ;0AB540|BD7004  |0A0470;
                       AND.B #$20                           ;0AB543|2920    |      ;
                       BNE CODE_0AB531                      ;0AB545|D0EA    |0AB531;
                       db $4C                               ;0AB547|        |      ;
 
                       dw CODE_0FEF75                       ;0AB548|        |0FEF75;
 
          CODE_0AB54A: LDA.W $0782                          ;0AB54A|AD8207  |0A0782;
                       ASL A                                ;0AB54D|0A      |      ;
                       TAY                                  ;0AB54E|A8      |      ;
                       PHA                                  ;0AB54F|48      |      ;
                       JSR.W CODE_0AB556                    ;0AB550|2056B5  |0AB556;
                       PLA                                  ;0AB553|68      |      ;
                       TAY                                  ;0AB554|A8      |      ;
                       INY                                  ;0AB555|C8      |      ;
 
          CODE_0AB556: LDA.W DATA8_0AB595,Y                 ;0AB556|B995B5  |0AB595;
                       PHA                                  ;0AB559|48      |      ;
                       LDA.W DATA8_0AB59D,Y                 ;0AB55A|B99DB5  |0AB59D;
                       TAX                                  ;0AB55D|AA      |      ;
                       PLA                                  ;0AB55E|68      |      ;
 
          CODE_0AB55F: TAY                                  ;0AB55F|A8      |      ;
                       LDA.W DATA8_0AB57D,Y                 ;0AB560|B97DB5  |0AB57D;
                       STA.W $0400,X                        ;0AB563|9D0004  |0A0400;
                       LDA.W DATA8_0AB585,Y                 ;0AB566|B985B5  |0AB585;
                       STA.W $0438,X                        ;0AB569|9D3804  |0A0438;
                       LDA.W DATA8_0AB58D,Y                 ;0AB56C|B98DB5  |0AB58D;
                       STA.W $041C,X                        ;0AB56F|9D1C04  |0A041C;
                       LDA.B #$01                           ;0AB572|A901    |      ;
                       STA.W $04A8,X                        ;0AB574|9DA804  |0A04A8;
                       LDA.B #$14                           ;0AB577|A914    |      ;
                       STA.W $048C,X                        ;0AB579|9D8C04  |0A048C;
                       RTS                                  ;0AB57C|60      |      ;
 
 
         DATA8_0AB57D: db $16,$18,$1C,$1A,$1A               ;0AB57D|        |      ;
                       db $2E,$22,$28                       ;0AB582|        |      ;
 
         DATA8_0AB585: db $B8,$30,$40,$30,$28               ;0AB585|        |      ;
                       db $40,$40,$40                       ;0AB58A|        |      ;
 
 
         DATA8_0AB58D: db $60,$B0,$90,$90,$90               ;0AB58D|        |      ;
 
                       db $90,$90,$90                       ;0AB592|        |      ;
 
         DATA8_0AB595: db $02,$02,$03,$05,$04               ;0AB595|        |      ;
                       db $06,$04,$07                       ;0AB59A|        |      ;
 
         DATA8_0AB59D: db $00,$00,$00,$01,$00               ;0AB59D|        |      ;
                       db $01,$00,$01                       ;0AB5A2|        |      ;
 
         DATA8_0AB5A5: db $00,$11,$22,$33                   ;0AB5A5|        |      ;
 
         DATA8_0AB5A9: db $39,$3A,$3B,$3E,$3F               ;0AB5A9|        |      ;
                       db $40,$41,$42,$3C,$3D               ;0AB5AE|        |      ;
                       db $54,$54,$54,$54,$54               ;0AB5B3|        |      ;
                       db $54,$FF,$39,$3A,$3B               ;0AB5B8|        |      ;
                       db $43,$44,$45,$46,$4D               ;0AB5BD|        |      ;
                       db $3C,$3D,$54,$54,$54               ;0AB5C2|        |      ;
                       db $54,$54,$54,$FF,$39               ;0AB5C7|        |      ;
                       db $3A,$3B,$4F,$50,$51               ;0AB5CC|        |      ;
                       db $52,$53,$3C,$3D,$54               ;0AB5D1|        |      ;
                       db $54,$54,$54,$54,$54               ;0AB5D6|        |      ;
                       db $FF,$39,$3A,$3B,$55               ;0AB5DB|        |      ;
                       db $56,$57,$58,$59,$5A               ;0AB5E0|        |      ;
                       db $60,$61,$54,$54,$54               ;0AB5E5|        |      ;
                       db $54,$54,$54,$FF                   ;0AB5EA|        |      ;
 
          CODE_0AB5EE: LDX.B #$94                           ;0AB5EE|A294    |      ;
                       db $4C                               ;0AB5F0|        |      ;
 
                       dw CODE_0FECF6                       ;0AB5F1|        |0FECF6;
 
          CODE_0AB5F3: LDA.B r_Joy1Pe                       ;0AB5F3|A528    |000028;
                       AND.B #$20                           ;0AB5F5|2920    |      ;
                       BNE CODE_0AB5FE                      ;0AB5F7|D005    |0AB5FE;
                       LDA.B #$00                           ;0AB5F9|A900    |      ;
                       STA.W $0789                          ;0AB5FB|8D8907  |0A0789;
 
          CODE_0AB5FE: RTS                                  ;0AB5FE|60      |      ;
 
 
          CODE_0AB5FF: STA.B $00                            ;0AB5FF|8500    |000000;
                       ASL A                                ;0AB601|0A      |      ;
                       CLC                                  ;0AB602|18      |      ;
                       ADC.B $00                            ;0AB603|6500    |000000;
                       TAY                                  ;0AB605|A8      |      ;
                       LDA.W coreLoadingFuncs,Y             ;0AB606|B916B6  |0AB616;
                       STA.B r_coreLoadingFuncAddr          ;0AB609|8516    |000016;
                       LDA.W PTR16_0AB617,Y                 ;0AB60B|B917B6  |0AB617;
                       STA.B $17                            ;0AB60E|8517    |000017;
                       LDA.W DATA8_0AB618,Y                 ;0AB610|B918B6  |0AB618;
                       db $4C                               ;0AB613|        |      ;
 
                       dw coreLoad_00                       ;0AB614|        |0FFBBA;
 
     coreLoadingFuncs: dw CODE_00852C                       ;0AB616|        |00852C; address then bank
 
         DATA8_0AB618: db $80                               ;0AB618|        |      ;
                       dw loadPlayerCHRBank                 ;0AB619|        |008001;
                       db $80                               ;0AB61B|        |      ;
 
                       dw getCurrRoomsChrBanks              ;0AB61C|        |008013;
                       db $80                               ;0AB61E|        |      ;
                       dw coreLoad_03                       ;0AB61F|        |0FD067;
                       db $00                               ;0AB621|        |      ;
                       dw CODE_0FD0F8                       ;0AB622|        |0FD0F8;
                       db $00                               ;0AB624|        |      ;
                       dw UNREACH_0FCDB8                    ;0AB625|        |0FCDB8;
                       db $00                               ;0AB627|        |      ;
                       dw CODE_0090CD                       ;0AB628|        |0090CD;
                       db $80                               ;0AB62A|        |      ;
                       dw UNREACH_0FFBA4                    ;0AB62B|        |0FFBA4;
                       db $80                               ;0AB62D|        |      ;
 
                       dw UNREACH_0FFBAF                    ;0AB62E|        |0FFBAF;
                       db $80                               ;0AB630|        |      ;
 
 
          CODE_0AB631: LDA.B r_gameSubstate                 ;0AB631|A519    |000019;
                       db $20                               ;0AB633|        |      ;
                       dw jumpFromStackYXpreserved          ;0AB634|        |0FE86D;
                       dw gameStateD_substate0              ;0AB636|        |0AB6D5;
                       dw CODE_0AB6F1                       ;0AB638|        |0AB6F1;
                       dw CODE_0AB6FC                       ;0AB63A|        |0AB6FC;
                       dw CODE_0AB708                       ;0AB63C|        |0AB708;
                       dw CODE_0AB731                       ;0AB63E|        |0AB731;
                       dw CODE_0AB73F                       ;0AB640|        |0AB73F;
                       dw CODE_0AB779                       ;0AB642|        |0AB779;
                       dw CODE_0AB787                       ;0AB644|        |0AB787;
                       dw CODE_0AB7B3                       ;0AB646|        |0AB7B3;
                       dw CODE_0AB731                       ;0AB648|        |0AB731;
                       dw CODE_0AB73F                       ;0AB64A|        |0AB73F;
 
  gameStateD_set6bTo0: CMP.B [r_powerUpDrop]                ;0AB64C|C7B7    |0000B7;
 
          CODE_0AB64E: LDA.B #$00                           ;0AB64E|A900    |      ;
                       STA.B r_menuSelectIdx                ;0AB650|856B    |00006B;
                       RTS                                  ;0AB652|60      |      ;
 
 
          CODE_0AB653: LDA.B #$08                           ;0AB653|A908    |      ;
                       STA.B r_tranitionTimer               ;0AB655|8564    |000064;
                       LDA.B $59                            ;0AB657|A559    |000059;
                       CLC                                  ;0AB659|18      |      ;
                       ADC.B #$02                           ;0AB65A|6902    |      ;
                       STA.B $5A                            ;0AB65C|855A    |00005A;
                       RTS                                  ;0AB65E|60      |      ;
 
 
gameStateD_setB4wordTo100h: LDY.B #$00                           ;0AB65F|A000    |      ;
                       STY.B $B4                            ;0AB661|84B4    |0000B4;
                       INY                                  ;0AB663|C8      |      ;
                       STY.B $B5                            ;0AB664|84B5    |0000B5;
                       RTS                                  ;0AB666|60      |      ;
 
 
          CODE_0AB667: LDA.W $07A1                          ;0AB667|ADA107  |0A07A1;
                       BEQ CODE_0AB679                      ;0AB66A|F00D    |0AB679;
                       LDA.B #$FF                           ;0AB66C|A9FF    |      ;
                       STA.B r_collisionPointXvalDiv32      ;0AB66E|8512    |000012;
                       LDA.B #$FF                           ;0AB670|A9FF    |      ;
                       STA.B r_collisionPointYinScreen      ;0AB672|8511    |000011;
                       LDA.B #$00                           ;0AB674|A900    |      ;
                       STA.B r_currOAM_Attr                 ;0AB676|8510    |000010;
                       RTS                                  ;0AB678|60      |      ;
 
 
          CODE_0AB679: LDA.B #$00                           ;0AB679|A900    |      ;
                       STA.B r_collisionPointXvalDiv32      ;0AB67B|8512    |000012;
                       LDA.B #$01                           ;0AB67D|A901    |      ;
                       STA.B r_collisionPointYinScreen      ;0AB67F|8511    |000011;
                       LDA.B #$00                           ;0AB681|A900    |      ;
                       STA.B r_currOAM_Attr                 ;0AB683|8510    |000010;
                       RTS                                  ;0AB685|60      |      ;
 
 
          CODE_0AB686: LDA.W $07A2                          ;0AB686|ADA207  |0A07A2;
                       CLC                                  ;0AB689|18      |      ;
                       ADC.B r_currOAM_Attr                 ;0AB68A|6510    |000010;
                       STA.W $07A2                          ;0AB68C|8DA207  |0A07A2;
                       LDA.W $07A3                          ;0AB68F|ADA307  |0A07A3;
                       ADC.B r_collisionPointYinScreen      ;0AB692|6511    |000011;
                       STA.W $07A3                          ;0AB694|8DA307  |0A07A3;
                       LDA.W $07A4                          ;0AB697|ADA407  |0A07A4;
                       ADC.B r_collisionPointXvalDiv32      ;0AB69A|6512    |000012;
                       STA.W $07A4                          ;0AB69C|8DA407  |0A07A4;
                       RTS                                  ;0AB69F|60      |      ;
 
 
          CODE_0AB6A0: LDX.B #$01                           ;0AB6A0|A201    |      ;
 
          CODE_0AB6A2: LDA.W $054E,X                        ;0AB6A2|BD4E05  |0A054E;
                       BNE CODE_0AB6AD                      ;0AB6A5|D006    |0AB6AD;
 
          CODE_0AB6A7: INX                                  ;0AB6A7|E8      |      ;
                       CPX.B #$17                           ;0AB6A8|E017    |      ;
                       BCC CODE_0AB6A2                      ;0AB6AA|90F6    |0AB6A2;
                       RTS                                  ;0AB6AC|60      |      ;
 
 
          CODE_0AB6AD: SEC                                  ;0AB6AD|38      |      ;
                       LDA.W $04C4,X                        ;0AB6AE|BDC404  |0A04C4;
                       SBC.B r_currOAM_Attr                 ;0AB6B1|E510    |000010;
                       STA.W $04C4,X                        ;0AB6B3|9DC404  |0A04C4;
                       LDA.W $0438,X                        ;0AB6B6|BD3804  |0A0438;
                       SBC.B r_collisionPointYinScreen      ;0AB6B9|E511    |000011;
                       STA.W $0438,X                        ;0AB6BB|9D3804  |0A0438;
                       BCS CODE_0AB6C6                      ;0AB6BE|B006    |0AB6C6;
                       LDA.B r_collisionPointXvalDiv32      ;0AB6C0|A512    |000012;
                       BMI CODE_0AB6A7                      ;0AB6C2|30E3    |0AB6A7;
                       BPL CODE_0AB6CA                      ;0AB6C4|1004    |0AB6CA;
 
          CODE_0AB6C6: LDA.B r_collisionPointXvalDiv32      ;0AB6C6|A512    |000012;
                       BPL CODE_0AB6A7                      ;0AB6C8|10DD    |0AB6A7;
 
          CODE_0AB6CA: LDA.B #$00                           ;0AB6CA|A900    |      ;
                       STA.W $0400,X                        ;0AB6CC|9D0004  |0A0400;
                       STA.W $054E,X                        ;0AB6CF|9D4E05  |0A054E;
                       JMP.W CODE_0AB6A7                    ;0AB6D2|4CA7B6  |0AB6A7;
 
 
 gameStateD_substate0: db $20                               ;0AB6D5|        |      ;
                       dw setBank_c000_1E                   ;0AB6D6|        |0FE2DA;
                       db $20                               ;0AB6D8|        |      ;
                       dw CODE_0FE666                       ;0AB6D9|        |0FE666;
                       LDA.B r_updateNametable              ;0AB6DB|A525    |000025;
                       STA.W $5105                          ;0AB6DD|8D0551  |0A5105;
                       LDA.W $0781                          ;0AB6E0|AD8107  |0A0781;
                       PHA                                  ;0AB6E3|48      |      ;
                       db $20                               ;0AB6E4|        |      ;
                       dw clearZeroPage                     ;0AB6E5|        |0FE828;
                       PLA                                  ;0AB6E7|68      |      ;
                       STA.W $0781                          ;0AB6E8|8D8107  |0A0781;
                       db $20                               ;0AB6EB|        |      ;
                       dw setNameTableMapping_E4            ;0AB6EC|        |0FEBFD;
                       INC.B r_gameSubstate                 ;0AB6EE|E619    |000019;
                       RTS                                  ;0AB6F0|60      |      ;
 
 
          CODE_0AB6F1: LDA.B #$69                           ;0AB6F1|A969    |      ;
                       db $20                               ;0AB6F3|        |      ;
                       dw CODE_0FE25F                       ;0AB6F4|        |0FE25F;
                       JSR.W CODE_0AB64E                    ;0AB6F6|204EB6  |0AB64E;
                       INC.B r_gameSubstate                 ;0AB6F9|E619    |000019;
                       RTS                                  ;0AB6FB|60      |      ;
 
 
          CODE_0AB6FC: JSR.W gameStateD_substate2_process6bh;0AB6FC|20EEB7  |0AB7EE;
                       LDA.B r_menuSelectIdx                ;0AB6FF|A56B    |00006B;
                       CMP.B #$FF                           ;0AB701|C9FF    |      ;
                       BNE CODE_0AB707                      ;0AB703|D002    |0AB707;
                       INC.B r_gameSubstate                 ;0AB705|E619    |000019;
 
          CODE_0AB707: RTS                                  ;0AB707|60      |      ;
 
 
          CODE_0AB708: LDA.B #$02                           ;0AB708|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;0AB70A|851C    |00001C;
                       JSR.W CODE_0AB9D8                    ;0AB70C|20D8B9  |0AB9D8;
                       BCS DATA8_0AB712                     ;0AB70F|B001    |0AB712;
                       RTS                                  ;0AB711|60      |      ;
 
 
         DATA8_0AB712: db $20                               ;0AB712|        |      ;
                       dw UNREACH_0FE7F7                    ;0AB713|        |0FE7F7;
                       LDA.B #$6E                           ;0AB715|A96E    |      ;
                       STA.B r_CHR_BankBG_0800              ;0AB717|854C    |00004C;
                       LDA.B #$30                           ;0AB719|A930    |      ;
                       STA.B r_timerGenerel                 ;0AB71B|8530    |000030;
                       LDA.B #$00                           ;0AB71D|A900    |      ;
                       STA.B r_ScrollY                      ;0AB71F|85FC    |0000FC;
                       STA.B r_ScrollX                      ;0AB721|85FD    |0000FD;
                       LDA.B #$B1                           ;0AB723|A9B1    |      ;
                       STA.B r_PPUCtrl                      ;0AB725|85FF    |0000FF;
                       LDX.B #$90                           ;0AB727|A290    |      ;
                       LDA.B #$5B                           ;0AB729|A95B    |      ;
                       db $20                               ;0AB72B|        |      ;
                       dw CODE_0FECDC                       ;0AB72C|        |0FECDC;
                       INC.B r_gameSubstate                 ;0AB72E|E619    |000019;
 
          CODE_0AB730: RTS                                  ;0AB730|60      |      ;
 
 
          CODE_0AB731: DEC.B r_timerGenerel                 ;0AB731|C630    |000030;
                       BNE CODE_0AB730                      ;0AB733|D0FB    |0AB730;
                       JSR.W gameStateD_setB4wordTo100h     ;0AB735|205FB6  |0AB65F;
                       LDA.B #$78                           ;0AB738|A978    |      ;
                       STA.B r_timerGenerel                 ;0AB73A|8530    |000030;
                       INC.B r_gameSubstate                 ;0AB73C|E619    |000019;
                       RTS                                  ;0AB73E|60      |      ;
 
 
          CODE_0AB73F: DEC.B r_timerGenerel                 ;0AB73F|C630    |000030;
                       BNE CODE_0AB74A                      ;0AB741|D007    |0AB74A;
                       LDA.B #$78                           ;0AB743|A978    |      ;
                       STA.B r_timerGenerel                 ;0AB745|8530    |000030;
                       INC.B r_gameSubstate                 ;0AB747|E619    |000019;
 
          CODE_0AB749: RTS                                  ;0AB749|60      |      ;
 
 
          CODE_0AB74A: LDA.B $B4                            ;0AB74A|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB74C|C9FF    |      ;
                       BEQ CODE_0AB749                      ;0AB74E|F0F9    |0AB749;
                       LDA.B r_sceneDrawQueue               ;0AB750|A51D    |00001D;
                       PHA                                  ;0AB752|48      |      ;
                       LDA.B #$5D                           ;0AB753|A95D    |      ;
                       db $20                               ;0AB755|        |      ;
                       dw screenLoadRoutine                 ;0AB756|        |0FECE9;
                       LDA.B #$0A                           ;0AB758|A90A    |      ;
                       db $20                               ;0AB75A|        |      ;
                       dw screenLoadRoutine                 ;0AB75B|        |0FECE9;
                       LDA.B #$04                           ;0AB75D|A904    |      ;
                       db $20                               ;0AB75F|        |      ;
                       dw screenLoadRoutine                 ;0AB760|        |0FECE9;
                       PLA                                  ;0AB762|68      |      ;
                       STA.B r_15                           ;0AB763|8515    |000015;
                       LDA.B #$07                           ;0AB765|A907    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB767|20FFB5  |0AB5FF;
                       LDA.B $B4                            ;0AB76A|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB76C|C9FF    |      ;
                       BNE CODE_0AB749                      ;0AB76E|D0D9    |0AB749;
                       LDA.B r_15                           ;0AB770|A515    |000015;
                       STA.B r_sceneDrawQueue               ;0AB772|851D    |00001D;
                       LDA.B #$5D                           ;0AB774|A95D    |      ;
                       db $4C                               ;0AB776|        |      ;
 
                       dw screenLoadRoutine                 ;0AB777|        |0FECE9;
 
          CODE_0AB779: DEC.B r_timerGenerel                 ;0AB779|C630    |000030;
                       BNE CODE_0AB786                      ;0AB77B|D009    |0AB786;
                       JSR.W gameStateD_setB4wordTo100h     ;0AB77D|205FB6  |0AB65F;
                       LDA.B #$78                           ;0AB780|A978    |      ;
                       STA.B r_timerGenerel                 ;0AB782|8530    |000030;
                       INC.B r_gameSubstate                 ;0AB784|E619    |000019;
 
          CODE_0AB786: RTS                                  ;0AB786|60      |      ;
 
 
          CODE_0AB787: DEC.B r_timerGenerel                 ;0AB787|C630    |000030;
                       BNE CODE_0AB793                      ;0AB789|D008    |0AB793;
                       LDA.B #$00                           ;0AB78B|A900    |      ;
                       STA.W $07A6                          ;0AB78D|8DA607  |0A07A6;
                       INC.B r_gameSubstate                 ;0AB790|E619    |000019;
 
          CODE_0AB792: RTS                                  ;0AB792|60      |      ;
 
 
          CODE_0AB793: LDA.B $B4                            ;0AB793|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB795|C9FF    |      ;
                       BEQ CODE_0AB792                      ;0AB797|F0F9    |0AB792;
                       LDA.B r_sceneDrawQueue               ;0AB799|A51D    |00001D;
                       PHA                                  ;0AB79B|48      |      ;
                       LDA.B #$5D                           ;0AB79C|A95D    |      ;
                       db $20                               ;0AB79E|        |      ;
                       dw screenLoadRoutine                 ;0AB79F|        |0FECE9;
                       LDA.B #$0A                           ;0AB7A1|A90A    |      ;
                       db $20                               ;0AB7A3|        |      ;
                       dw screenLoadRoutine                 ;0AB7A4|        |0FECE9;
                       LDA.B #$04                           ;0AB7A6|A904    |      ;
                       db $20                               ;0AB7A8|        |      ;
                       dw screenLoadRoutine                 ;0AB7A9|        |0FECE9;
                       PLA                                  ;0AB7AB|68      |      ;
                       STA.B r_15                           ;0AB7AC|8515    |000015;
                       LDA.B #$08                           ;0AB7AE|A908    |      ;
                       JMP.W CODE_0AB5FF                    ;0AB7B0|4CFFB5  |0AB5FF;
 
 
          CODE_0AB7B3: JSR.W CODE_0AB9D8                    ;0AB7B3|20D8B9  |0AB9D8;
                       BCS CODE_0AB7B9                      ;0AB7B6|B001    |0AB7B9;
                       RTS                                  ;0AB7B8|60      |      ;
 
 
          CODE_0AB7B9: LDA.B #$08                           ;0AB7B9|A908    |      ;
                       STA.B r_timerGenerel                 ;0AB7BB|8530    |000030;
                       LDX.B #$90                           ;0AB7BD|A290    |      ;
                       LDA.B #$5C                           ;0AB7BF|A95C    |      ;
                       db $20                               ;0AB7C1|        |      ;
                       dw CODE_0FECDC                       ;0AB7C2|        |0FECDC;
                       INC.B r_gameSubstate                 ;0AB7C4|E619    |000019;
                       RTS                                  ;0AB7C6|60      |      ;
 
                       LDA.B r_curJoyPe1                    ;0AB7C7|A526    |000026;
                       AND.B #$10                           ;0AB7C9|2910    |      ;
                       BNE CODE_0AB7CE                      ;0AB7CB|D001    |0AB7CE;
                       RTS                                  ;0AB7CD|60      |      ;
 
 
          CODE_0AB7CE: LDA.B #$01                           ;0AB7CE|A901    |      ;
                       STA.W $07F6                          ;0AB7D0|8DF607  |0A07F6;
                       LDA.B #$00                           ;0AB7D3|A900    |      ;
                       STA.B r_stage                        ;0AB7D5|8532    |000032;
                       STA.B r_blockLevel                   ;0AB7D7|8533    |000033;
                       STA.B r_roomIdx                      ;0AB7D9|8534    |000034;
                       STA.B r_GrantDefeated                ;0AB7DB|852F    |00002F;
                       LDY.B r_partnerIdx                   ;0AB7DD|A43B    |00003B;
                       LDA.W $0039,Y                        ;0AB7DF|B93900  |0A0039;
                       STA.W $054E                          ;0AB7E2|8D4E05  |0A054E;
                       LDA.B #$04                           ;0AB7E5|A904    |      ;
                       STA.B r_gameState                    ;0AB7E7|8518    |000018;
                       LDA.B #$1F                           ;0AB7E9|A91F    |      ;
                       STA.B r_gameLoadState                ;0AB7EB|852A    |00002A;
                       RTS                                  ;0AB7ED|60      |      ;
 
 
gameStateD_substate2_process6bh: LDA.B r_menuSelectIdx                ;0AB7EE|A56B    |00006B;
                       db $20                               ;0AB7F0|        |      ;
                       dw jumpFromStackYXpreserved          ;0AB7F1|        |0FE86D;
                       dw gameStateD_6b_0                   ;0AB7F3|        |0AB809;
                       dw CODE_0AB84D                       ;0AB7F5|        |0AB84D;
                       dw CODE_0AB863                       ;0AB7F7|        |0AB863;
                       dw CODE_0AB893                       ;0AB7F9|        |0AB893;
                       dw CODE_0AB8A0                       ;0AB7FB|        |0AB8A0;
                       dw CODE_0AB8EB                       ;0AB7FD|        |0AB8EB;
                       dw CODE_0AB910                       ;0AB7FF|        |0AB910;
                       dw CODE_0AB917                       ;0AB801|        |0AB917;
                       dw CODE_0AB926                       ;0AB803|        |0AB926;
                       dw CODE_0AB943                       ;0AB805|        |0AB943;
                       dw CODE_0AB95B                       ;0AB807|        |0AB95B;
 
      gameStateD_6b_0: LDA.B #$02                           ;0AB809|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;0AB80B|851C    |00001C;
                       JSR.W CODE_0AB9D8                    ;0AB80D|20D8B9  |0AB9D8;
                       BCS DATA8_0AB813                     ;0AB810|B001    |0AB813;
                       RTS                                  ;0AB812|60      |      ;
 
 
         DATA8_0AB813: db $20                               ;0AB813|        |      ;
                       dw UNREACH_0FE7F7                    ;0AB814|        |0FE7F7;
                       JSR.W CODE_0AB95C                    ;0AB816|205CB9  |0AB95C;
                       LDA.B #$B0                           ;0AB819|A9B0    |      ;
                       STA.B r_PPUCtrl                      ;0AB81B|85FF    |0000FF;
                       LDA.B #$00                           ;0AB81D|A900    |      ;
                       STA.B r_ScrollX                      ;0AB81F|85FD    |0000FD;
                       LDA.B #$10                           ;0AB821|A910    |      ;
                       STA.B r_ScrollY                      ;0AB823|85FC    |0000FC;
                       LDA.B #$00                           ;0AB825|A900    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB827|20FFB5  |0AB5FF;
                       LDA.B #$01                           ;0AB82A|A901    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB82C|20FFB5  |0AB5FF;
                       LDA.B #$02                           ;0AB82F|A902    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB831|20FFB5  |0AB5FF;
                       LDA.B #$06                           ;0AB834|A906    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB836|20FFB5  |0AB5FF;
                       LDA.B #$37                           ;0AB839|A937    |      ;
                       STA.B r_CHR_BankBG_0c00              ;0AB83B|854D    |00004D;
                       LDA.B #$03                           ;0AB83D|A903    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB83F|20FFB5  |0AB5FF;
                       LDA.B #$04                           ;0AB842|A904    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB844|20FFB5  |0AB5FF;
                       JSR.W CODE_0AB653                    ;0AB847|2053B6  |0AB653;
                       INC.B r_menuSelectIdx                ;0AB84A|E66B    |00006B;
                       RTS                                  ;0AB84C|60      |      ;
 
 
          CODE_0AB84D: LDA.B #$02                           ;0AB84D|A902    |      ;
                       STA.B r_counter_ShowSprBg            ;0AB84F|851C    |00001C;
                       LDA.B #$05                           ;0AB851|A905    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB853|20FFB5  |0AB5FF;
                       BCS CODE_0AB859                      ;0AB856|B001    |0AB859;
                       RTS                                  ;0AB858|60      |      ;
 
 
          CODE_0AB859: JSR.W gameStateD_setB4wordTo100h     ;0AB859|205FB6  |0AB65F;
                       LDA.B #$78                           ;0AB85C|A978    |      ;
                       STA.B r_timerGenerel                 ;0AB85E|8530    |000030;
                       INC.B r_menuSelectIdx                ;0AB860|E66B    |00006B;
                       RTS                                  ;0AB862|60      |      ;
 
 
          CODE_0AB863: DEC.B r_timerGenerel                 ;0AB863|C630    |000030;
                       BNE CODE_0AB86E                      ;0AB865|D007    |0AB86E;
                       LDA.B #$78                           ;0AB867|A978    |      ;
                       STA.B r_timerGenerel                 ;0AB869|8530    |000030;
                       INC.B r_menuSelectIdx                ;0AB86B|E66B    |00006B;
 
          CODE_0AB86D: RTS                                  ;0AB86D|60      |      ;
 
 
          CODE_0AB86E: LDA.B $B4                            ;0AB86E|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB870|C9FF    |      ;
                       BEQ CODE_0AB86D                      ;0AB872|F0F9    |0AB86D;
                       LDA.B r_sceneDrawQueue               ;0AB874|A51D    |00001D;
                       PHA                                  ;0AB876|48      |      ;
                       LDA.B #$00                           ;0AB877|A900    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB879|20FFB5  |0AB5FF;
                       PLA                                  ;0AB87C|68      |      ;
                       STA.B r_15                           ;0AB87D|8515    |000015;
                       LDA.B #$07                           ;0AB87F|A907    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB881|20FFB5  |0AB5FF;
                       LDA.B $B4                            ;0AB884|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB886|C9FF    |      ;
                       BNE CODE_0AB86D                      ;0AB888|D0E3    |0AB86D;
                       LDA.B r_15                           ;0AB88A|A515    |000015;
                       STA.B r_sceneDrawQueue               ;0AB88C|851D    |00001D;
                       LDA.B #$00                           ;0AB88E|A900    |      ;
                       JMP.W CODE_0AB5FF                    ;0AB890|4CFFB5  |0AB5FF;
 
 
          CODE_0AB893: DEC.B r_timerGenerel                 ;0AB893|C630    |000030;
                       BEQ CODE_0AB898                      ;0AB895|F001    |0AB898;
                       RTS                                  ;0AB897|60      |      ;
 
 
          CODE_0AB898: LDA.B #$00                           ;0AB898|A900    |      ;
                       STA.W $07A5                          ;0AB89A|8DA507  |0A07A5;
                       INC.B r_menuSelectIdx                ;0AB89D|E66B    |00006B;
                       RTS                                  ;0AB89F|60      |      ;
 
 
          CODE_0AB8A0: JSR.W CODE_0ABA31                    ;0AB8A0|2031BA  |0ABA31;
                       BCS CODE_0AB8A6                      ;0AB8A3|B001    |0AB8A6;
                       RTS                                  ;0AB8A5|60      |      ;
 
 
          CODE_0AB8A6: LDA.W $07A0                          ;0AB8A6|ADA007  |0A07A0;
                       CMP.B #$04                           ;0AB8A9|C904    |      ;
                       BNE CODE_0AB8B0                      ;0AB8AB|D003    |0AB8B0;
                       JSR.W CODE_0AB8C2                    ;0AB8AD|20C2B8  |0AB8C2;
 
          CODE_0AB8B0: LDA.B #$00                           ;0AB8B0|A900    |      ;
                       STA.W $07A2                          ;0AB8B2|8DA207  |0A07A2;
                       STA.W $07A3                          ;0AB8B5|8DA307  |0A07A3;
                       STA.W $07A4                          ;0AB8B8|8DA407  |0A07A4;
                       LDA.B #$80                           ;0AB8BB|A980    |      ;
                       STA.B r_timerGenerel                 ;0AB8BD|8530    |000030;
                       INC.B r_menuSelectIdx                ;0AB8BF|E66B    |00006B;
                       RTS                                  ;0AB8C1|60      |      ;
 
 
          CODE_0AB8C2: LDA.B #$A2                           ;0AB8C2|A9A2    |      ;
                       STA.B r_VRAM_QueueDest               ;0AB8C4|8561    |000061;
                       LDA.B #$26                           ;0AB8C6|A926    |      ;
                       STA.B $62                            ;0AB8C8|8562    |000062;
                       db $20                               ;0AB8CA|        |      ;
                       dw CODE_0FE8B5                       ;0AB8CB|        |0FE8B5;
                       LDY.B #$00                           ;0AB8CD|A000    |      ;
 
          CODE_0AB8CF: LDA.W $07F8,Y                        ;0AB8CF|B9F807  |0A07F8;
                       BEQ CODE_0AB8DB                      ;0AB8D2|F007    |0AB8DB;
                       CMP.B #$4B                           ;0AB8D4|C94B    |      ;
                       BEQ CODE_0AB8E7                      ;0AB8D6|F00F    |0AB8E7;
                       CLC                                  ;0AB8D8|18      |      ;
                       ADC.B #$70                           ;0AB8D9|6970    |      ;
 
          CODE_0AB8DB: STA.W $0300,X                        ;0AB8DB|9D0003  |0A0300;
                       INX                                  ;0AB8DE|E8      |      ;
                       INY                                  ;0AB8DF|C8      |      ;
                       CPY.B #$08                           ;0AB8E0|C008    |      ;
                       BCC CODE_0AB8CF                      ;0AB8E2|90EB    |0AB8CF;
                       db $4C                               ;0AB8E4|        |      ;
 
                       dw endVRAM_queue                     ;0AB8E5|        |0FE8DE;
 
          CODE_0AB8E7: LDA.B #$F9                           ;0AB8E7|A9F9    |      ;
                       BNE CODE_0AB8DB                      ;0AB8E9|D0F0    |0AB8DB;
 
          CODE_0AB8EB: DEC.B r_timerGenerel                 ;0AB8EB|C630    |000030;
                       BNE CODE_0AB8F2                      ;0AB8ED|D003    |0AB8F2;
                       INC.B r_menuSelectIdx                ;0AB8EF|E66B    |00006B;
                       RTS                                  ;0AB8F1|60      |      ;
 
 
          CODE_0AB8F2: JSR.W CODE_0AB667                    ;0AB8F2|2067B6  |0AB667;
                       JSR.W CODE_0AB686                    ;0AB8F5|2086B6  |0AB686;
                       JSR.W CODE_0AB6A0                    ;0AB8F8|20A0B6  |0AB6A0;
                       LDA.W $07A3                          ;0AB8FB|ADA307  |0A07A3;
                       STA.B r_ScrollX                      ;0AB8FE|85FD    |0000FD;
                       LDA.W $07A4                          ;0AB900|ADA407  |0A07A4;
                       AND.B #$01                           ;0AB903|2901    |      ;
                       STA.B $00                            ;0AB905|8500    |000000;
                       LDA.B r_PPUCtrl                      ;0AB907|A5FF    |0000FF;
                       AND.B #$FE                           ;0AB909|29FE    |      ;
                       ORA.B $00                            ;0AB90B|0500    |000000;
                       STA.B r_PPUCtrl                      ;0AB90D|85FF    |0000FF;
                       RTS                                  ;0AB90F|60      |      ;
 
 
          CODE_0AB910: LDA.B #$E0                           ;0AB910|A9E0    |      ;
                       STA.B r_timerGenerel                 ;0AB912|8530    |000030;
                       INC.B r_menuSelectIdx                ;0AB914|E66B    |00006B;
                       RTS                                  ;0AB916|60      |      ;
 
 
          CODE_0AB917: DEC.B r_timerGenerel                 ;0AB917|C630    |000030;
                       BEQ CODE_0AB91C                      ;0AB919|F001    |0AB91C;
                       RTS                                  ;0AB91B|60      |      ;
 
 
          CODE_0AB91C: JSR.W gameStateD_setB4wordTo100h     ;0AB91C|205FB6  |0AB65F;
                       LDA.B #$78                           ;0AB91F|A978    |      ;
                       STA.B r_timerGenerel                 ;0AB921|8530    |000030;
                       INC.B r_menuSelectIdx                ;0AB923|E66B    |00006B;
                       RTS                                  ;0AB925|60      |      ;
 
 
          CODE_0AB926: DEC.B r_timerGenerel                 ;0AB926|C630    |000030;
                       BNE CODE_0AB92D                      ;0AB928|D003    |0AB92D;
                       INC.B r_menuSelectIdx                ;0AB92A|E66B    |00006B;
 
          CODE_0AB92C: RTS                                  ;0AB92C|60      |      ;
 
 
          CODE_0AB92D: LDA.B $B4                            ;0AB92D|A5B4    |0000B4;
                       CMP.B #$FF                           ;0AB92F|C9FF    |      ;
                       BEQ CODE_0AB92C                      ;0AB931|F0F9    |0AB92C;
                       LDA.B r_sceneDrawQueue               ;0AB933|A51D    |00001D;
                       PHA                                  ;0AB935|48      |      ;
                       LDA.B #$00                           ;0AB936|A900    |      ;
                       JSR.W CODE_0AB5FF                    ;0AB938|20FFB5  |0AB5FF;
                       PLA                                  ;0AB93B|68      |      ;
                       STA.B r_15                           ;0AB93C|8515    |000015;
                       LDA.B #$08                           ;0AB93E|A908    |      ;
                       JMP.W CODE_0AB5FF                    ;0AB940|4CFFB5  |0AB5FF;
 
 
          CODE_0AB943: LDA.B #$00                           ;0AB943|A900    |      ;
                       STA.W $07A6                          ;0AB945|8DA607  |0A07A6;
                       INC.W $07A0                          ;0AB948|EEA007  |0A07A0;
                       LDA.W $07A0                          ;0AB94B|ADA007  |0A07A0;
                       CMP.B #$05                           ;0AB94E|C905    |      ;
                       BNE CODE_0AB956                      ;0AB950|D004    |0AB956;
                       LDA.B #$FF                           ;0AB952|A9FF    |      ;
                       BNE CODE_0AB958                      ;0AB954|D002    |0AB958;
 
          CODE_0AB956: LDA.B #$00                           ;0AB956|A900    |      ;
 
          CODE_0AB958: STA.B r_menuSelectIdx                ;0AB958|856B    |00006B;
                       RTS                                  ;0AB95A|60      |      ;
 
 
          CODE_0AB95B: RTS                                  ;0AB95B|60      |      ;
 
 
          CODE_0AB95C: LDA.W $07A0                          ;0AB95C|ADA007  |0A07A0;
                       ASL A                                ;0AB95F|0A      |      ;
                       TAY                                  ;0AB960|A8      |      ;
                       LDA.W DATA8_0ABA27,Y                 ;0AB961|B927BA  |0ABA27;
                       STA.B r_pointerQueue_VRAM            ;0AB964|8508    |000008;
                       LDA.W DATA8_0ABA28,Y                 ;0AB966|B928BA  |0ABA28;
                       STA.B $09                            ;0AB969|8509    |000009;
                       LDY.B #$00                           ;0AB96B|A000    |      ;
                       db $20                               ;0AB96D|        |      ;
                       dw UNREACH_0FFB95                    ;0AB96E|        |0FFB95;
                       LSR A                                ;0AB970|4A      |      ;
                       LSR A                                ;0AB971|4A      |      ;
                       LSR A                                ;0AB972|4A      |      ;
                       LSR A                                ;0AB973|4A      |      ;
                       STA.B r_stage                        ;0AB974|8532    |000032;
                       db $20                               ;0AB976|        |      ;
                       dw UNREACH_0FFB95                    ;0AB977|        |0FFB95;
                       AND.B #$0F                           ;0AB979|290F    |      ;
                       STA.B r_blockLevel                   ;0AB97B|8533    |000033;
                       INY                                  ;0AB97D|C8      |      ;
                       db $20                               ;0AB97E|        |      ;
                       dw UNREACH_0FFB95                    ;0AB97F|        |0FFB95;
                       LSR A                                ;0AB981|4A      |      ;
                       LSR A                                ;0AB982|4A      |      ;
                       LSR A                                ;0AB983|4A      |      ;
                       LSR A                                ;0AB984|4A      |      ;
                       STA.B r_roomIdx                      ;0AB985|8534    |000034;
                       db $20                               ;0AB987|        |      ;
                       dw UNREACH_0FFB95                    ;0AB988|        |0FFB95;
                       AND.B #$0F                           ;0AB98A|290F    |      ;
                       STA.B r_sceneScrollOffsetHi          ;0AB98C|8557    |000057;
                       AND.B #$01                           ;0AB98E|2901    |      ;
                       STA.B r_075                          ;0AB990|8575    |000075;
                       LDA.B #$00                           ;0AB992|A900    |      ;
                       STA.B r_sceneScrollOffsetLo          ;0AB994|8556    |000056;
                       INY                                  ;0AB996|C8      |      ;
                       db $20                               ;0AB997|        |      ;
                       dw UNREACH_0FFB95                    ;0AB998|        |0FFB95;
                       STA.W $07A1                          ;0AB99A|8DA107  |0A07A1;
                       INY                                  ;0AB99D|C8      |      ;
                       db $20                               ;0AB99E|        |      ;
                       dw UNREACH_0FFB95                    ;0AB99F|        |0FFB95;
                       STA.W $054E                          ;0AB9A1|8D4E05  |0A054E;
                       INY                                  ;0AB9A4|C8      |      ;
                       LDX.B #$01                           ;0AB9A5|A201    |      ;
 
         DATA8_0AB9A7: db $20                               ;0AB9A7|        |      ;
                       dw UNREACH_0FFB95                    ;0AB9A8|        |0FFB95;
                       CMP.B #$FF                           ;0AB9AA|C9FF    |      ;
                       BEQ CODE_0AB9D7                      ;0AB9AC|F029    |0AB9D7;
                       STA.W $048C,X                        ;0AB9AE|9D8C04  |0A048C;
                       INY                                  ;0AB9B1|C8      |      ;
                       db $20                               ;0AB9B2|        |      ;
                       dw UNREACH_0FFB95                    ;0AB9B3|        |0FFB95;
                       STA.W $0400,X                        ;0AB9B5|9D0004  |0A0400;
                       INY                                  ;0AB9B8|C8      |      ;
                       db $20                               ;0AB9B9|        |      ;
                       dw UNREACH_0FFB95                    ;0AB9BA|        |0FFB95;
                       STA.W $0438,X                        ;0AB9BC|9D3804  |0A0438;
                       INY                                  ;0AB9BF|C8      |      ;
                       db $20                               ;0AB9C0|        |      ;
                       dw UNREACH_0FFB95                    ;0AB9C1|        |0FFB95;
                       STA.W $041C,X                        ;0AB9C3|9D1C04  |0A041C;
                       INY                                  ;0AB9C6|C8      |      ;
                       db $20                               ;0AB9C7|        |      ;
                       dw UNREACH_0FFB95                    ;0AB9C8|        |0FFB95;
                       STA.W $04A8,X                        ;0AB9CA|9DA804  |0A04A8;
                       INY                                  ;0AB9CD|C8      |      ;
                       LDA.B #$01                           ;0AB9CE|A901    |      ;
                       STA.W $054E,X                        ;0AB9D0|9D4E05  |0A054E;
                       INX                                  ;0AB9D3|E8      |      ;
                       JMP.W DATA8_0AB9A7                   ;0AB9D4|4CA7B9  |0AB9A7;
 
 
          CODE_0AB9D7: RTS                                  ;0AB9D7|60      |      ;
 
 
          CODE_0AB9D8: LDA.W $07A6                          ;0AB9D8|ADA607  |0A07A6;
                       ASL A                                ;0AB9DB|0A      |      ;
                       CLC                                  ;0AB9DC|18      |      ;
                       ADC.W $07A6                          ;0AB9DD|6DA607  |0A07A6;
                       TAY                                  ;0AB9E0|A8      |      ;
                       LDA.W DATA8_0ABA0B,Y                 ;0AB9E1|B90BBA  |0ABA0B;
                       CMP.B #$FF                           ;0AB9E4|C9FF    |      ;
                       BEQ CODE_0ABA09                      ;0AB9E6|F021    |0ABA09;
                       STA.B $62                            ;0AB9E8|8562    |000062;
                       LDA.W DATA8_0ABA0C,Y                 ;0AB9EA|B90CBA  |0ABA0C;
                       STA.B r_VRAM_QueueDest               ;0AB9ED|8561    |000061;
                       LDA.W DATA8_0ABA0D,Y                 ;0AB9EF|B90DBA  |0ABA0D;
                       STA.B r_currOAM_Attr                 ;0AB9F2|8510    |000010;
                       db $20                               ;0AB9F4|        |      ;
                       dw CODE_0FE8B5                       ;0AB9F5|        |0FE8B5;
                       LDA.B #$00                           ;0AB9F7|A900    |      ;
 
          CODE_0AB9F9: STA.W $0300,X                        ;0AB9F9|9D0003  |0A0300;
                       INX                                  ;0AB9FC|E8      |      ;
                       DEC.B r_currOAM_Attr                 ;0AB9FD|C610    |000010;
                       BNE CODE_0AB9F9                      ;0AB9FF|D0F8    |0AB9F9;
                       db $20                               ;0ABA01|        |      ;
                       dw endVRAM_queue                     ;0ABA02|        |0FE8DE;
                       INC.W $07A6                          ;0ABA04|EEA607  |0A07A6;
                       CLC                                  ;0ABA07|18      |      ;
                       RTS                                  ;0ABA08|60      |      ;
 
 
          CODE_0ABA09: SEC                                  ;0ABA09|38      |      ;
                       RTS                                  ;0ABA0A|60      |      ;
 
 
         DATA8_0ABA0B: db $24                               ;0ABA0B|        |      ;
 
         DATA8_0ABA0C: db $C0                               ;0ABA0C|        |      ;
 
         DATA8_0ABA0D: db $40,$25,$00,$40,$25               ;0ABA0D|        |      ;
 
                       db $40,$40,$25,$80,$40               ;0ABA12|        |      ;
                       db $25,$C0,$40,$26,$00               ;0ABA17|        |      ;
                       db $40,$26,$40,$40,$26               ;0ABA1C|        |      ;
 
                       db $80,$40,$26,$C0,$40               ;0ABA21|        |      ;
                       db $FF                               ;0ABA26|        |      ;
 
         DATA8_0ABA27: db $16                               ;0ABA27|        |      ;
 
         DATA8_0ABA28: db $BF,$4D,$BF,$75,$BF               ;0ABA28|        |      ;
                       db $FD,$BE,$8E,$BF                   ;0ABA2D|        |      ;
 
          CODE_0ABA31: LDA.W $07F6                          ;0ABA31|ADF607  |0A07F6;
                       BNE CODE_0ABA3F                      ;0ABA34|D009    |0ABA3F;
                       LDA.W $0781                          ;0ABA36|AD8107  |0A0781;
                       BNE CODE_0ABA3F                      ;0ABA39|D004    |0ABA3F;
                       LDY.B #$00                           ;0ABA3B|A000    |      ;
                       BEQ CODE_0ABA41                      ;0ABA3D|F002    |0ABA41;
 
          CODE_0ABA3F: LDY.B #$02                           ;0ABA3F|A002    |      ;
 
          CODE_0ABA41: LDA.W PTR16_0ABA6E,Y                 ;0ABA41|B96EBA  |0ABA6E;
                       STA.B r_pointerQueue_VRAM            ;0ABA44|8508    |000008;
                       LDA.W PTR16_0ABA6F,Y                 ;0ABA46|B96FBA  |0ABA6F;
                       STA.B $09                            ;0ABA49|8509    |000009;
                       LDA.W $07A0                          ;0ABA4B|ADA007  |0A07A0;
                       ASL A                                ;0ABA4E|0A      |      ;
                       TAY                                  ;0ABA4F|A8      |      ;
                       LDA.B (r_pointerQueue_VRAM),Y        ;0ABA50|B108    |000008;
                       STA.B r_temp_Xpos                    ;0ABA52|850A    |00000A;
                       INY                                  ;0ABA54|C8      |      ;
                       LDA.B (r_pointerQueue_VRAM),Y        ;0ABA55|B108    |000008;
                       STA.B $0B                            ;0ABA57|850B    |00000B;
                       LDY.W $07A5                          ;0ABA59|ACA507  |0A07A5;
                       LDA.B (r_temp_Xpos),Y                ;0ABA5C|B10A    |00000A;
                       CMP.B #$FF                           ;0ABA5E|C9FF    |      ;
                       BEQ CODE_0ABA6C                      ;0ABA60|F00A    |0ABA6C;
                       LDX.B #$90                           ;0ABA62|A290    |      ;
                       db $20                               ;0ABA64|        |      ;
                       dw CODE_0FECDC                       ;0ABA65|        |0FECDC;
 
                       INC.W $07A5                          ;0ABA67|EEA507  |0A07A5;
                       CLC                                  ;0ABA6A|18      |      ;
                       RTS                                  ;0ABA6B|60      |      ;
 
 
          CODE_0ABA6C: SEC                                  ;0ABA6C|38      |      ;
                       RTS                                  ;0ABA6D|60      |      ;
 
 
         PTR16_0ABA6E: dw PTR16_0ABA72                      ;0ABA6E|        |0ABA72;
                       dw PTR16_0ABA7C                      ;0ABA70|        |0ABA7C;
 
 
         PTR16_0ABA72: dw DATA8_0ABA86                      ;0ABA72|        |0ABA86;
                       dw DATA8_0ABA88                      ;0ABA74|        |0ABA88;
                       dw DATA8_0ABA8A                      ;0ABA76|        |0ABA8A;
                       dw DATA8_0ABA8C                      ;0ABA78|        |0ABA8C;
                       dw DATA8_0ABA8E                      ;0ABA7A|        |0ABA8E;
 
         PTR16_0ABA7C: dw DATA8_0ABA90                      ;0ABA7C|        |0ABA90;
                       dw DATA8_0ABA92                      ;0ABA7E|        |0ABA92;
                       dw DATA8_0ABA94                      ;0ABA80|        |0ABA94;
                       dw DATA8_0ABA96                      ;0ABA82|        |0ABA96;
                       dw DATA8_0ABA98                      ;0ABA84|        |0ABA98;
 
         DATA8_0ABA86: db $32,$FF                           ;0ABA86|        |      ;
 
         DATA8_0ABA88: db $33,$FF                           ;0ABA88|        |      ;
 
         DATA8_0ABA8A: db $34,$FF                           ;0ABA8A|        |      ;
 
         DATA8_0ABA8C: db $35,$FF                           ;0ABA8C|        |      ;
 
         DATA8_0ABA8E: db $36,$FF                           ;0ABA8E|        |      ;
 
         DATA8_0ABA90: db $37,$FF                           ;0ABA90|        |      ;
 
         DATA8_0ABA92: db $38,$FF                           ;0ABA92|        |      ;
 
         DATA8_0ABA94: db $65,$FF                           ;0ABA94|        |      ;
 
         DATA8_0ABA96: db $66,$FF                           ;0ABA96|        |      ;
 
         DATA8_0ABA98: db $36,$FF                           ;0ABA98|        |      ;
 
RLE_tilemap_10_ending02: dw $2BC0                             ;0ABA9A|        |      ;
                       db $0A,$FF,$82,$3F,$CF               ;0ABA9C|        |      ;
                       db $06,$FF,$84,$13,$44               ;0ABAA1|        |      ;
                       db $99,$AA,$04,$FF,$84               ;0ABAA6|        |      ;
                       db $55,$22,$88,$55,$04               ;0ABAAB|        |      ;
                       db $FF,$84,$55,$22,$88               ;0ABAB0|        |      ;
                       db $55,$04,$FF,$82,$F5               ;0ABAB5|        |      ;
                       db $F5,$0C,$FF,$08,$0F               ;0ABABA|        |      ;
                       db $FF,$D3,$F1,$E4,$F5               ;0ABABF|        |      ;
                       db $EE,$F1,$00,$EC,$E0               ;0ABAC4|        |      ;
                       db $E3,$E4,$00,$EC,$E0               ;0ABAC9|        |      ;
                       db $ED,$F8,$FE,$F2,$E0               ;0ABACE|        |      ;
                       db $E2,$F1,$E8,$E5,$E8               ;0ABAD3|        |      ;
                       db $E2,$E4,$F2,$DB,$00               ;0ABAD8|        |      ;
                       db $D3,$E7,$E4,$FE,$EB               ;0ABADD|        |      ;
                       db $EE,$ED,$E6,$00,$E5               ;0ABAE2|        |      ;
                       db $E8,$E6,$E7,$F3,$00               ;0ABAE7|        |      ;
                       db $E8,$F2,$FF,$EE,$F5               ;0ABAEC|        |      ;
                       db $E4,$F1,$DB,$00,$C3               ;0ABAF1|        |      ;
                       db $F1,$E0,$E2,$F4,$EB               ;0ABAF6|        |      ;
                       db $E0,$00,$E8,$F2,$FE               ;0ABAFB|        |      ;
                       db $E3,$E4,$E0,$E3,$00               ;0ABB00|        |      ;
                       db $E0,$ED,$E3,$00,$E0               ;0ABB05|        |      ;
                       db $EB,$EB,$FF,$EE,$F3               ;0ABB0A|        |      ;
                       db $E7,$E4,$F1,$00,$F2               ;0ABB0F|        |      ;
                       db $EF,$E8,$F1,$E8,$F3               ;0ABB14|        |      ;
                       db $F2,$FE,$E0,$F1,$E4               ;0ABB19|        |      ;
                       db $00,$E0,$F2,$EB,$E4               ;0ABB1E|        |      ;
                       db $E4,$EF,$DB,$FE,$00               ;0ABB23|        |      ;
                       db $FF,$C0,$E5,$F3,$E4               ;0ABB28|        |      ;
                       db $F1,$00,$F3,$E7,$E8               ;0ABB2D|        |      ;
                       db $F2,$00,$E5,$E8,$E6               ;0ABB32|        |      ;
                       db $E7,$F3,$FE,$F3,$E7               ;0ABB37|        |      ;
                       db $E4,$00,$C1,$E4,$EB               ;0ABB3C|        |      ;
                       db $EC,$EE,$ED,$F3,$00               ;0ABB41|        |      ;
                       db $ED,$E0,$EC,$E4,$FF               ;0ABB46|        |      ;
                       db $F2,$E7,$E0,$EB,$EB               ;0ABB4B|        |      ;
                       db $00,$E1,$E4,$00,$E7               ;0ABB50|        |      ;
                       db $EE,$ED,$EE,$F1,$E4               ;0ABB55|        |      ;
                       db $E3,$FE,$E1,$F8,$00               ;0ABB5A|        |      ;
                       db $E0,$EB,$EB,$00,$EF               ;0ABB5F|        |      ;
                       db $E4,$EE,$EF,$EB,$E4               ;0ABB64|        |      ;
                       db $DB,$FF,$C8,$ED,$00               ;0ABB69|        |      ;
                       db $F3,$E7,$E4,$00,$F2               ;0ABB6E|        |      ;
                       db $E7,$E0,$E3,$EE,$F6               ;0ABB73|        |      ;
                       db $F2,$DC,$FE,$E0,$00               ;0ABB78|        |      ;
                       db $EF,$E4,$F1,$F2,$EE               ;0ABB7D|        |      ;
                       db $ED,$00,$F6,$E0,$F3               ;0ABB82|        |      ;
                       db $E2,$E7,$E4,$F2,$FF               ;0ABB87|        |      ;
                       db $F3,$E7,$E4,$00,$E2               ;0ABB8C|        |      ;
                       db $E0,$F2,$F3,$EB,$E4               ;0ABB91|        |      ;
                       db $00,$E5,$E0,$EB,$EB               ;0ABB96|        |      ;
                       db $DB,$FE,$00,$FE,$D3               ;0ABB9B|        |      ;
 
                       db $F1,$E4,$F5,$EE,$F1               ;0ABBA0|        |      ;
                       db $00,$EC,$F4,$F2,$F3               ;0ABBA5|        |      ;
                       db $00,$E6,$EE,$FF,$E5               ;0ABBAA|        |      ;
                       db $EE,$F1,$00,$ED,$EE               ;0ABBAF|        |      ;
                       db $F6,$00,$E1,$F4,$F3               ;0ABBB4|        |      ;
                       db $00,$E7,$E4,$FE,$E7               ;0ABBB9|        |      ;
                       db $EE,$EF,$E4,$F2,$00               ;0ABBBE|        |      ;
                       db $F2,$EE,$EC,$E4,$E3               ;0ABBC3|        |      ;
                       db $E0,$F8,$00,$E7,$E4               ;0ABBC8|        |      ;
                       db $FF,$F6,$E8,$EB,$EB               ;0ABBCD|        |      ;
                       db $00,$E6,$E4,$F3,$00               ;0ABBD2|        |      ;
                       db $F3,$E7,$E4,$FE,$F1               ;0ABBD7|        |      ;
                       db $E4,$F2,$EF,$E4,$E2               ;0ABBDC|        |      ;
                       db $F3,$00,$F3,$E7,$E0               ;0ABBE1|        |      ;
                       db $F3,$FF,$E7,$E4,$00               ;0ABBE6|        |      ;
                       db $E3,$E4,$F2,$E4,$F1               ;0ABBEB|        |      ;
                       db $F5,$E4,$F2,$DB,$FE               ;0ABBF0|        |      ;
                       db $00,$FF,$D2,$F8,$E5               ;0ABBF5|        |      ;
                       db $E0,$DC,$00,$F3,$E7               ;0ABBFA|        |      ;
                       db $E4,$FE,$D5,$E0,$EC               ;0ABBFF|        |      ;
                       db $EF,$E8,$F1,$E4,$00               ;0ABC04|        |      ;
                       db $CA,$E8,$EB,$EB,$E4               ;0ABC09|        |      ;
                       db $F1,$FF,$E7,$E0,$F2               ;0ABC0E|        |      ;
                       db $00,$E7,$E0,$E3,$00               ;0ABC13|        |      ;
                       db $E0,$00,$E1,$E0,$E3               ;0ABC18|        |      ;
                       db $FE,$EB,$E8,$E5,$E4               ;0ABC1D|        |      ;
                       db $DC,$00,$E1,$F4,$F3               ;0ABC22|        |      ;
 
                       db $00,$F2,$E8,$ED,$E2               ;0ABC27|        |      ;
                       db $E4,$FF,$F2,$E7,$E4               ;0ABC2C|        |      ;
                       db $00,$EC,$E4,$F3,$00               ;0ABC31|        |      ;
                       db $D3,$F1,$E4,$F5,$EE               ;0ABC36|        |      ;
                       db $F1,$FE,$F2,$E7,$E4               ;0ABC3B|        |      ;
                       db $00,$E8,$F2,$00,$E1               ;0ABC40|        |      ;
                       db $E4,$E6,$E8,$ED,$ED               ;0ABC45|        |      ;
                       db $E8,$ED,$E6,$FF,$F3               ;0ABC4A|        |      ;
                       db $EE,$00,$E5,$E4,$E4               ;0ABC4F|        |      ;
                       db $EB,$00,$EC,$EE,$F1               ;0ABC54|        |      ;
                       db $E4,$FE,$E2,$EE,$EC               ;0ABC59|        |      ;
                       db $E5,$EE,$F1,$F3,$E0               ;0ABC5E|        |      ;
                       db $E1,$EB,$E4,$00,$F6               ;0ABC63|        |      ;
                       db $E8,$F3,$E7,$FF,$E7               ;0ABC68|        |      ;
                       db $E4,$F1,$F2,$E4,$EB               ;0ABC6D|        |      ;
                       db $E5,$DB,$FE,$00,$FF               ;0ABC72|        |      ;
                       db $C1,$EE,$F3,$E7,$00               ;0ABC77|        |      ;
                       db $E5,$E4,$E4,$EB,$00               ;0ABC7C|        |      ;
                       db $F3,$E7,$E4,$E8,$F1               ;0ABC81|        |      ;
                       db $FE,$E5,$F1,$E8,$E4               ;0ABC86|        |      ;
                       db $ED,$E3,$F2,$E7,$E8               ;0ABC8B|        |      ;
                       db $EF,$00,$E8,$F2,$FF               ;0ABC90|        |      ;
                       db $F2,$F3,$F1,$EE,$ED               ;0ABC95|        |      ;
                       db $E6,$E4,$F1,$00,$F2               ;0ABC9A|        |      ;
                       db $E8,$ED,$E2,$E4,$FE               ;0ABC9F|        |      ;
                       db $F3,$E7,$E4,$F8,$00               ;0ABCA4|        |      ;
                       db $F6,$EE,$F1,$EA,$E4               ;0ABCA9|        |      ;
                       db $E3,$FF,$F3,$EE,$E6               ;0ABCAE|        |      ;
                       db $E4,$F3,$E7,$E4,$F1               ;0ABCB3|        |      ;
                       db $00,$F3,$EE,$00,$F1               ;0ABCB8|        |      ;
                       db $E8,$E3,$FE,$D6,$E0               ;0ABCBD|        |      ;
                       db $EB,$EB,$E0,$E2,$E7               ;0ABCC2|        |      ;
                       db $E8,$E0,$00,$E2,$E8               ;0ABCC7|        |      ;
                       db $F3,$F8,$FF,$EE,$E5               ;0ABCCC|        |      ;
                       db $00,$E4,$F5,$E8,$EB               ;0ABCD1|        |      ;
                       db $DB,$00,$C6,$F1,$E0               ;0ABCD6|        |      ;
 
                       db $ED,$F3,$FE,$F6,$E8               ;0ABCDB|        |      ;
                       db $EB,$EB,$00,$F2,$F3               ;0ABCE0|        |      ;
                       db $E0,$F1,$F3,$00,$F3               ;0ABCE5|        |      ;
                       db $EE,$FF,$F1,$E4,$E1               ;0ABCEA|        |      ;
                       db $F4,$E8,$EB,$E3,$00               ;0ABCEF|        |      ;
                       db $F3,$E7,$E4,$FE,$E3               ;0ABCF4|        |      ;
                       db $E4,$F2,$F3,$F1,$EE               ;0ABCF9|        |      ;
                       db $F8,$E4,$E3,$00,$E0               ;0ABCFE|        |      ;
                       db $F1,$E4,$E0,$F2,$FE               ;0ABD03|        |      ;
                       db $EE,$E5,$00,$F3,$E7               ;0ABD08|        |      ;
                       db $E4,$00,$E2,$E8,$F3               ;0ABD0D|        |      ;
                       db $F8,$DB,$FE,$00,$FF               ;0ABD12|        |      ;
                       db $D3,$E7,$E4,$00,$E1               ;0ABD17|        |      ;
                       db $E0,$F3,$F3,$EB,$E4               ;0ABD1C|        |      ;
                       db $00,$F6,$E0,$F2,$FE               ;0ABD21|        |      ;
                       db $F6,$EE,$ED,$00,$E1               ;0ABD26|        |      ;
                       db $F8,$00,$D3,$F1,$E4               ;0ABD2B|        |      ;
                       db $F5,$EE,$F1,$00,$E0               ;0ABD30|        |      ;
                       db $ED,$E3,$FF,$C0,$EB               ;0ABD35|        |      ;
                       db $F4,$E2,$E0,$F1,$E3               ;0ABD3A|        |      ;
                       db $00,$E1,$F4,$F3,$FE               ;0ABD3F|        |      ;
                       db $C0,$EB,$F4,$E2,$E0               ;0ABD44|        |      ;
                       db $F1,$E3,$00,$E5,$E4               ;0ABD49|        |      ;
                       db $E4,$EB,$F2,$FF,$F0               ;0ABD4E|        |      ;
                       db $F4,$E8,$EB,$F3,$F8               ;0ABD53|        |      ;
                       db $00,$E1,$E4,$E2,$E0               ;0ABD58|        |      ;
                       db $F4,$F2,$E4,$FE,$E7               ;0ABD5D|        |      ;
                       db $E4,$00,$EA,$E8,$EB               ;0ABD62|        |      ;
                       db $EB,$E4,$E3,$00,$E7               ;0ABD67|        |      ;
                       db $E8,$F2,$FF,$F1,$E4               ;0ABD6C|        |      ;
                       db $E0,$EB,$00,$E5,$E0               ;0ABD71|        |      ;
                       db $F3,$E7,$E4,$F1,$DB               ;0ABD76|        |      ;
                       db $FE,$00,$FE,$D3,$F1               ;0ABD7B|        |      ;
                       db $E4,$F5,$EE,$F1,$00               ;0ABD80|        |      ;
                       db $F1,$E4,$E0,$EB,$E8               ;0ABD85|        |      ;
                       db $F9,$E4,$F2,$FF,$F3               ;0ABD8A|        |      ;
                       db $E7,$E8,$F2,$00,$E0               ;0ABD8F|        |      ;
                       db $F2,$00,$E7,$E4,$FE               ;0ABD94|        |      ;
                       db $F2,$F3,$E0,$ED,$E3               ;0ABD99|        |      ;
                       db $F2,$00,$F3,$E7,$E4               ;0ABD9E|        |      ;
                       db $F1,$E4,$FF,$F3,$E7               ;0ABDA3|        |      ;
                       db $E8,$ED,$EA,$E8,$ED               ;0ABDA8|        |      ;
                       db $E6,$00,$E0,$E1,$EE               ;0ABDAD|        |      ;
                       db $F4,$F3,$FE,$C0,$EB               ;0ABDB2|        |      ;
                       db $F4,$E2,$E0,$F1,$E3               ;0ABDB7|        |      ;
                       db $DB,$FE,$00,$FF,$00               ;0ABDBC|        |      ;
 
                       db $00,$00,$00,$00,$00               ;0ABDC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDC6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDCB|        |      ;
                       db $00,$00,$FE,$00,$00               ;0ABDD0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDD5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDDA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDDF|        |      ;
                       db $00,$FE,$00,$00,$00               ;0ABDE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDE9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDEE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ABDF3|        |      ;
                       db $FF,$60                           ;0ABDF8|        |      ;
 
RLE_tilemap_10_ending00: dw $2000                             ;0ABDFA|        |      ;
                       db $7E,$7D,$82,$7D,$7D               ;0ABDFC|        |      ;
                       db $10,$7F,$84,$64,$66               ;0ABE01|        |      ;
                       db $67,$67,$06,$7E,$83               ;0ABE06|        |      ;
                       db $67,$66,$66,$05,$7F               ;0ABE0B|        |      ;
                       db $03,$65,$0A,$7F,$92               ;0ABE10|        |      ;
                       db $65,$67,$7E,$67,$7E               ;0ABE15|        |      ;
                       db $7E,$77,$74,$75,$77               ;0ABE1A|        |      ;
                       db $77,$76,$7E,$7E,$67               ;0ABE1F|        |      ;
                       db $67,$65,$64,$04,$67               ;0ABE24|        |      ;
                       db $9B,$66,$65,$64,$65               ;0ABE29|        |      ;
                       db $67,$66,$7F,$7F,$7F               ;0ABE2E|        |      ;
                       db $65,$65,$67,$7E,$7E               ;0ABE33|        |      ;
                       db $7E,$74,$00,$77,$00               ;0ABE38|        |      ;
                       db $00,$00,$76,$7E,$67               ;0ABE3D|        |      ;
                       db $7E,$7E,$67,$06,$7E               ;0ABE42|        |      ;
                       db $89,$67,$7E,$7E,$7E               ;0ABE47|        |      ;
                       db $67,$66,$65,$67,$67               ;0ABE4C|        |      ;
                       db $04,$7E,$81,$77,$07               ;0ABE51|        |      ;
                       db $00,$93,$76,$75,$75               ;0ABE56|        |      ;
                       db $7E,$7E,$7E,$74,$75               ;0ABE5B|        |      ;
                       db $75,$76,$7E,$77,$76               ;0ABE60|        |      ;
                       db $7E,$75,$7E,$7E,$67               ;0ABE65|        |      ;
                       db $67,$04,$7E,$82,$75               ;0ABE6A|        |      ;
                       db $77,$07,$00,$03,$77               ;0ABE6F|        |      ;
                       db $86,$76,$75,$77,$77               ;0ABE74|        |      ;
                       db $77,$00,$06,$77,$88               ;0ABE79|        |      ;
                       db $75,$7E,$7E,$74,$76               ;0ABE7E|        |      ;
                       db $7E,$7E,$74,$0C,$00               ;0ABE83|        |      ;
                       db $84,$77,$77,$41,$42               ;0ABE88|        |      ;
                       db $08,$00,$87,$77,$76               ;0ABE8D|        |      ;
                       db $75,$75,$77,$75,$75               ;0ABE92|        |      ;
                       db $0F,$00,$8C,$51,$52               ;0ABE97|        |      ;
                       db $42,$56,$57,$41,$42               ;0ABE9C|        |      ;
                       db $00,$41,$42,$00,$77               ;0ABEA1|        |      ;
                       db $08,$00,$81,$40,$09               ;0ABEA6|        |      ;
                       db $00,$D8,$41,$42,$60               ;0ABEAB|        |      ;
                       db $62,$63,$54,$46,$51               ;0ABEB0|        |      ;
                       db $52,$42,$51,$52,$42               ;0ABEB5|        |      ;
                       db $00,$41,$42,$00,$00               ;0ABEBA|        |      ;
                       db $00,$41,$42,$00,$43               ;0ABEBF|        |      ;
                       db $78,$4F,$00,$7A,$5F               ;0ABEC4|        |      ;
                       db $00,$56,$57,$50,$51               ;0ABEC9|        |      ;
                       db $52,$7D,$46,$71,$46               ;0ABECE|        |      ;
                       db $51,$52,$52,$7D,$47               ;0ABED3|        |      ;
                       db $73,$7D,$53,$51,$52               ;0ABED8|        |      ;
                       db $57,$00,$41,$51,$52               ;0ABEDD|        |      ;
                       db $42,$43,$7D,$7D,$4F               ;0ABEE2|        |      ;
                       db $79,$7D,$4F,$7D,$63               ;0ABEE7|        |      ;
                       db $44,$45,$7D,$55,$52               ;0ABEEC|        |      ;
                       db $63,$51,$60,$45,$62               ;0ABEF1|        |      ;
                       db $7D,$7D,$7D,$55,$44               ;0ABEF6|        |      ;
                       db $45,$72,$73,$53,$51               ;0ABEFB|        |      ;
                       db $54,$7D,$4C,$4D,$4E               ;0ABF00|        |      ;
                       db $0B,$7D,$95,$55,$44               ;0ABF05|        |      ;
                       db $60,$7D,$61,$7D,$7D               ;0ABF0A|        |      ;
                       db $7D,$63,$44,$62,$7D               ;0ABF0F|        |      ;
                       db $62,$63,$60,$62,$72               ;0ABF14|        |      ;
                       db $7D,$5C,$7D,$5E,$13               ;0ABF19|        |      ;
                       db $7D,$83,$60,$61,$62               ;0ABF1E|        |      ;
                       db $06,$7D,$85,$6B,$6C               ;0ABF23|        |      ;
                       db $6B,$5D,$4E,$1A,$7D               ;0ABF28|        |      ;
                       db $86,$4E,$7B,$7C,$7B               ;0ABF2D|        |      ;
                       db $7D,$5E,$1A,$7D,$84               ;0ABF32|        |      ;
                       db $5E,$6C,$6E,$6F,$0D               ;0ABF37|        |      ;
                       db $7D,$81,$5B,$06,$7D               ;0ABF3C|        |      ;
                       db $85,$5B,$7D,$7D,$7D               ;0ABF41|        |      ;
                       db $5B,$04,$7D,$82,$6F               ;0ABF46|        |      ;
                       db $5A,$09,$7D,$03,$68               ;0ABF4B|        |      ;
                       db $0C,$7D,$84,$4A,$48               ;0ABF50|        |      ;
                       db $48,$68,$09,$7D,$87               ;0ABF55|        |      ;
                       db $5B,$7D,$7D,$68,$48               ;0ABF5A|        |      ;
                       db $68,$68,$09,$7D,$88               ;0ABF5F|        |      ;
                       db $49,$48,$4A,$7E,$58               ;0ABF64|        |      ;
                       db $58,$7E,$49,$0C,$7D               ;0ABF69|        |      ;
                       db $83,$68,$48,$4A,$09               ;0ABF6E|        |      ;
                       db $7D,$04,$7E,$04,$58               ;0ABF73|        |      ;
                       db $81,$48,$0B,$7D,$83               ;0ABF78|        |      ;
                       db $68,$4A,$69,$09,$7D               ;0ABF7D|        |      ;
                       db $8C,$58,$7E,$7E,$6A               ;0ABF82|        |      ;
                       db $7E,$58,$7E,$58,$58               ;0ABF87|        |      ;
                       db $48,$48,$49,$04,$7D               ;0ABF8C|        |      ;
                       db $87,$68,$5B,$5B,$48               ;0ABF91|        |      ;
                       db $48,$48,$4A,$08,$7D               ;0ABF96|        |      ;
                       db $98,$4B,$4B,$58,$4B               ;0ABF9B|        |      ;
                       db $4B,$69,$69,$4B,$4B               ;0ABFA0|        |      ;
                       db $7E,$4B,$6A,$7E,$49               ;0ABFA5|        |      ;
                       db $48,$68,$7D,$4A,$48               ;0ABFAA|        |      ;
                       db $4A,$58,$69,$6A,$7E               ;0ABFAF|        |      ;
                       db $08,$7D,$98,$4B,$58               ;0ABFB4|        |      ;
                       db $7E,$58,$7E,$58,$7E               ;0ABFB9|        |      ;
                       db $7E,$7E,$6A,$4B,$7E               ;0ABFBE|        |      ;
                       db $6A,$7E,$7E,$49,$4A               ;0ABFC3|        |      ;
                       db $49,$4A,$7E,$4B,$7E               ;0ABFC8|        |      ;
                       db $4B,$58,$7E,$7D,$82               ;0ABFCD|        |      ;
                       db $7D,$7D,$08,$AA,$08               ;0ABFD2|        |      ;
                       db $00,$96,$E0,$F0,$20               ;0ABFD7|        |      ;
                       db $00,$00,$EF,$F3,$E0               ;0ABFDC|        |      ;
                       db $FF,$FF,$FE,$FF,$7F               ;0ABFE1|        |      ;
                       db $9A,$AA,$AF,$AA,$AA               ;0ABFE6|        |      ;
                       db $AF,$AA,$55,$95,$12               ;0ABFEB|        |      ;
                       db $AA,$08,$0A,$FF,$FF               ;0ABFF0|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0ABFF5|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0ABFFA|        |      ;
                       db $FF                               ;0ABFFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC000|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC005|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC00A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC00F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC014|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC019|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC01E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC023|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC028|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC02D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC032|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC037|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC03C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC041|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC046|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC04B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC050|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC055|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC05A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC05F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC064|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC069|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC06E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC073|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC078|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC07D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC082|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC087|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC08C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC091|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC096|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC09B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC0FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC104|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC109|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC10E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC113|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC118|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC11D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC122|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC127|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC12C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC131|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC136|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC13B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC140|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC145|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC14A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC14F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC154|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC159|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC15E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC163|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC168|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC16D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC172|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC177|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC17C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC181|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC186|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC18B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC190|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC195|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC19A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC19F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC1FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC203|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC208|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC20D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC212|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC217|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC21C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC221|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC226|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC22B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC230|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC235|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC23A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC23F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC244|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC249|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC24E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC253|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC258|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC25D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC262|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC267|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC26C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC271|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC276|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC27B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC280|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC285|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC28A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC28F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC294|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC299|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC29E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC2FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC302|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC307|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC30C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC311|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC316|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC31B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC320|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC325|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC32A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC32F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC334|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC339|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC33E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC343|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC348|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC34D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC352|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC357|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC35C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC361|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC366|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC36B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC370|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC375|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC37A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC37F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC384|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC389|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC38E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC393|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC398|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC39D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC3FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC401|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC406|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC40B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC410|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC415|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC41A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC41F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC424|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC429|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC42E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC433|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC438|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC43D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC442|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC447|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC44C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC451|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC456|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC45B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC460|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC465|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC46A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC46F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC474|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC479|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC47E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC483|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC488|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC48D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC492|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC497|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC49C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC4FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC500|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC505|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC50A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC50F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC514|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC519|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC51E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC523|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC528|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC52D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC532|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC537|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC53C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC541|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC546|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC54B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC550|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC555|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC55A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC55F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC564|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC569|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC56E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC573|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC578|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC57D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC582|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC587|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC58C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC591|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC596|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC59B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC5FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC604|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC609|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC60E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC613|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC618|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC61D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC622|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC627|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC62C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC631|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC636|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC63B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC640|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC645|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC64A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC64F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC654|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC659|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC65E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC663|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC668|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC66D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC672|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC677|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC67C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC681|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC686|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC68B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC690|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC695|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC69A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC69F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC6FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC703|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC708|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC70D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC712|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC717|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC71C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC721|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC726|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC72B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC730|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC735|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC73A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC73F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC744|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC749|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC74E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC753|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC758|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC75D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC762|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC767|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC76C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC771|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC776|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC77B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC780|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC785|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC78A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC78F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC794|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC799|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC79E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC7FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC802|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC807|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC80C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC811|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC816|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC81B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC820|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC825|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC82A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC82F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC834|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC839|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC83E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC843|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC848|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC84D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC852|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC857|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC85C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC861|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC866|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC86B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC870|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC875|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC87A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC87F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC884|        |      ;
 
                       db $00,$00,$00,$00,$00               ;0AC889|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC88E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC893|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC898|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC89D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC8FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC901|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC906|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC90B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC910|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC915|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC91A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC91F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC924|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC929|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC92E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC933|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC938|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC93D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC942|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC947|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC94C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC951|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC956|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC95B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC960|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC965|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC96A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC96F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC974|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC979|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC97E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC983|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC988|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC98D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC992|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC997|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC99C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AC9FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA00|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA05|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA0A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA0F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA14|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA19|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA1E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA23|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA28|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA2D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA32|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA37|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA3C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA41|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA46|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA4B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA50|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA55|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA5A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA5F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA64|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA69|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA6E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA73|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA78|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA7D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA82|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA87|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA8C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA91|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA96|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACA9B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAA0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAA5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAAA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAAF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAB4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAB9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACABE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAC3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAC8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACACD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAD2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAD7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACADC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAE1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAE6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAEB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAF0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAF5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAFA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACAFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB04|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB09|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB0E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB13|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB18|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB1D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB22|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB27|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB2C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB31|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB36|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB3B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB40|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB45|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB4A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB4F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB54|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB59|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB5E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB63|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB68|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB6D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB72|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB77|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB7C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB81|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB86|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB8B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB90|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB95|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB9A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACB9F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBA4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBA9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBAE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBB3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBB8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBBD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBC2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBC7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBCC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBD1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBD6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBDB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBE0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBE5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBEA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBEF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBF4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBF9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACBFE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC03|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC08|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC0D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC12|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC17|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC1C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC21|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC26|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC2B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC30|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC35|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC3A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC3F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC44|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC49|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC4E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC53|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC58|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC5D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC62|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC67|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC6C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC71|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC76|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC7B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC80|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC85|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC8A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC8F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC94|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC99|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACC9E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCA3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCA8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCAD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCB2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCB7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCBC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCC6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCCB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCD0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCD5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCDA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCDF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCE9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCEE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCF3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCF8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACCFD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD02|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD07|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD0C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD11|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD16|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD1B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD20|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD25|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD2A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD2F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD34|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD39|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD3E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD43|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD48|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD4D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD52|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD57|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD5C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD61|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD66|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD6B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD70|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD75|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD7A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD7F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD84|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD89|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD8E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD93|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD98|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACD9D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDA2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDA7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDAC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDB1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDB6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDBB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDC0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDC5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDCA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDCF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDD4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDD9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDDE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDE3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDE8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDED|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDF2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDF7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACDFC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE01|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE06|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE0B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE10|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE15|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE1A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE1F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE24|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE29|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE2E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE33|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE38|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE3D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE42|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE47|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE4C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE51|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE56|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE5B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE60|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE65|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE6A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE6F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE74|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE79|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE7E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE83|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE88|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE8D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE92|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE97|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACE9C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEA1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEA6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEAB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEB0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEB5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEBA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEBF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEC4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEC9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACECE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACED3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACED8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEDD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEE2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEE7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEEC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEF1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEF6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACEFB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF00|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF05|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF0A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF0F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF14|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF19|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF1E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF23|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF28|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF2D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF32|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF37|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF3C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF41|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF46|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF4B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF50|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF55|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF5A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF5F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF64|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF69|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF6E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF73|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF78|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF7D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF82|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF87|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF8C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF91|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF96|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACF9B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFA0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFA5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFAA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFAF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFB4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFB9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFBE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFC3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFC8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFCD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFD2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFD7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFDC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFE1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFE6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFEB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFF0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFF5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFFA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ACFFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD004|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD009|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD00E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD013|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD018|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD01D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD022|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD027|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD02C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD031|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD036|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD03B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD040|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD045|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD04A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD04F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD054|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD059|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD05E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD063|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD068|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD06D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD072|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD077|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD07C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD081|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD086|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD08B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD090|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD095|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD09A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD09F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD0FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD103|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD108|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD10D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD112|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD117|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD11C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD121|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD126|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD12B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD130|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD135|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD13A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD13F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD144|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD149|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD14E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD153|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD158|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD15D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD162|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD167|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD16C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD171|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD176|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD17B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD180|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD185|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD18A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD18F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD194|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD199|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD19E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD1FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD202|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD207|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD20C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD211|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD216|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD21B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD220|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD225|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD22A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD22F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD234|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD239|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD23E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD243|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD248|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD24D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD252|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD257|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD25C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD261|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD266|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD26B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD270|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD275|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD27A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD27F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD284|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD289|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD28E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD293|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD298|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD29D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD2FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD301|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD306|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD30B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD310|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD315|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD31A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD31F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD324|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD329|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD32E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD333|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD338|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD33D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD342|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD347|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD34C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD351|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD356|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD35B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD360|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD365|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD36A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD36F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD374|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD379|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD37E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD383|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD388|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD38D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD392|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD397|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD39C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD3FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD400|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD405|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD40A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD40F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD414|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD419|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD41E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD423|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD428|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD42D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD432|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD437|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD43C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD441|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD446|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD44B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD450|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD455|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD45A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD45F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD464|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD469|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD46E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD473|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD478|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD47D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD482|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD487|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD48C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD491|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD496|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD49B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD4FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD504|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD509|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD50E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD513|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD518|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD51D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD522|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD527|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD52C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD531|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD536|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD53B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD540|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD545|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD54A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD54F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD554|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD559|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD55E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD563|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD568|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD56D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD572|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD577|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD57C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD581|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD586|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD58B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD590|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD595|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD59A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD59F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD5FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD603|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD608|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD60D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD612|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD617|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD61C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD621|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD626|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD62B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD630|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD635|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD63A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD63F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD644|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD649|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD64E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD653|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD658|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD65D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD662|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD667|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD66C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD671|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD676|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD67B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD680|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD685|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD68A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD68F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD694|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD699|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD69E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD6FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD702|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD707|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD70C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD711|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD716|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD71B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD720|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD725|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD72A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD72F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD734|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD739|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD73E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD743|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD748|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD74D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD752|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD757|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD75C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD761|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD766|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD76B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD770|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD775|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD77A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD77F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD784|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD789|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD78E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD793|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD798|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD79D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD7FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD801|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD806|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD80B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD810|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD815|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD81A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD81F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD824|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD829|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD82E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD833|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD838|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD83D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD842|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD847|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD84C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD851|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD856|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD85B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD860|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD865|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD86A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD86F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD874|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD879|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD87E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD883|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD888|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD88D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD892|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD897|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD89C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD8FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD900|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD905|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD90A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD90F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD914|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD919|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD91E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD923|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD928|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD92D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD932|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD937|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD93C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD941|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD946|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD94B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD950|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD955|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD95A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD95F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD964|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD969|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD96E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD973|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD978|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD97D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD982|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD987|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD98C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD991|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD996|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD99B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AD9FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA04|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA09|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA0E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA13|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA18|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA1D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA22|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA27|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA2C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA31|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA36|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA3B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA40|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA45|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA4A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA4F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA54|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA59|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA5E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA63|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA68|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA6D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA72|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA77|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA7C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA81|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA86|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA8B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA90|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA95|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA9A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADA9F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAA4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAA9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAAE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAB3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAB8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADABD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAC2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAC7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADACC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAD1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAD6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADADB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAE0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAE5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAEA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAEF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAF4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAF9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADAFE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB03|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB08|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB0D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB12|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB17|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB1C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB21|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB26|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB2B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB30|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB35|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB3A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB3F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB44|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB49|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB4E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB53|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB58|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB5D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB62|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB67|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB6C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB71|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB76|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB7B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB80|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB85|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB8A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB8F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB94|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB99|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADB9E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBA3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBA8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBAD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBB2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBB7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBBC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBC6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBCB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBD0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBD5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBDA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBDF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBE9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBEE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBF3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBF8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADBFD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC02|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC07|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC0C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC11|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC16|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC1B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC20|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC25|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC2A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC2F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC34|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC39|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC3E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC43|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC48|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC4D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC52|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC57|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC5C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC61|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC66|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC6B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC70|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC75|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC7A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC7F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC84|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC89|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC8E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC93|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC98|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADC9D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCA2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCA7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCAC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCB1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCB6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCBB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCC0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCC5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCCA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCCF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCD4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCD9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCDE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCE3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCE8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCED|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCF2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCF7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADCFC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD01|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD06|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD0B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD10|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD15|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD1A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD1F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD24|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD29|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD2E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD33|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD38|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD3D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD42|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD47|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD4C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD51|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD56|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD5B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD60|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD65|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD6A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD6F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD74|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD79|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD7E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD83|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD88|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD8D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD92|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD97|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADD9C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDA1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDA6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDAB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDB0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDB5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDBA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDBF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDC4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDC9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDCE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDD3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDD8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDDD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDE2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDE7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDEC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDF1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDF6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADDFB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE00|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE05|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE0A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE0F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE14|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE19|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE1E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE23|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE28|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE2D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE32|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE37|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE3C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE41|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE46|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE4B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE50|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE55|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE5A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE5F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE64|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE69|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE6E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE73|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE78|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE7D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE82|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE87|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE8C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE91|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE96|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADE9B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEA0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEA5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEAA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEAF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEB4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEB9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEBE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEC3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEC8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADECD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADED2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADED7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEDC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEE1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEE6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEEB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEF0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEF5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEFA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADEFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF04|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF09|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF0E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF13|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF18|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF1D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF22|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF27|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF2C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF31|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF36|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF3B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF40|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF45|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF4A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF4F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF54|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF59|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF5E|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF63|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF68|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF6D|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF72|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF77|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF7C|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF81|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF86|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF8B|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF90|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF95|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF9A|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADF9F|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFA4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFA9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFAE|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFB3|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFB8|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFBD|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFC2|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFC7|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFCC|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFD1|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFD6|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFDB|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFE0|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFE5|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFEA|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFEF|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFF4|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFF9|        |      ;
                       db $00,$00,$00,$00,$00               ;0ADFFE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE003|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE008|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE00D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE012|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE017|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE01C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE021|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE026|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE02B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE030|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE035|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE03A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE03F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE044|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE049|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE04E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE053|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE058|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE05D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE062|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE067|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE06C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE071|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE076|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE07B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE080|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE085|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE08A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE08F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE094|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE099|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE09E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE0FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE102|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE107|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE10C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE111|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE116|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE11B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE120|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE125|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE12A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE12F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE134|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE139|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE13E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE143|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE148|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE14D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE152|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE157|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE15C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE161|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE166|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE16B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE170|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE175|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE17A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE17F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE184|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE189|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE18E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE193|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE198|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE19D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE1FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE201|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE206|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE20B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE210|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE215|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE21A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE21F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE224|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE229|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE22E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE233|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE238|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE23D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE242|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE247|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE24C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE251|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE256|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE25B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE260|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE265|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE26A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE26F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE274|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE279|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE27E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE283|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE288|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE28D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE292|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE297|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE29C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE2FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE300|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE305|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE30A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE30F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE314|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE319|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE31E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE323|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE328|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE32D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE332|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE337|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE33C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE341|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE346|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE34B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE350|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE355|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE35A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE35F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE364|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE369|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE36E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE373|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE378|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE37D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE382|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE387|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE38C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE391|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE396|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE39B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE3FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE404|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE409|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE40E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE413|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE418|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE41D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE422|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE427|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE42C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE431|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE436|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE43B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE440|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE445|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE44A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE44F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE454|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE459|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE45E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE463|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE468|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE46D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE472|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE477|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE47C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE481|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE486|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE48B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE490|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE495|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE49A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE49F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE4FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE503|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE508|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE50D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE512|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE517|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE51C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE521|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE526|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE52B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE530|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE535|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE53A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE53F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE544|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE549|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE54E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE553|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE558|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE55D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE562|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE567|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE56C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE571|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE576|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE57B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE580|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE585|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE58A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE58F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE594|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE599|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE59E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE5FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE602|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE607|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE60C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE611|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE616|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE61B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE620|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE625|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE62A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE62F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE634|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE639|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE63E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE643|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE648|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE64D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE652|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE657|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE65C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE661|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE666|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE66B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE670|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE675|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE67A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE67F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE684|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE689|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE68E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE693|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE698|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE69D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE6FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE701|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE706|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE70B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE710|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE715|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE71A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE71F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE724|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE729|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE72E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE733|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE738|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE73D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE742|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE747|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE74C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE751|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE756|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE75B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE760|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE765|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE76A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE76F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE774|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE779|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE77E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE783|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE788|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE78D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE792|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE797|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE79C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE7FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE800|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE805|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE80A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE80F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE814|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE819|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE81E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE823|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE828|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE82D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE832|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE837|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE83C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE841|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE846|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE84B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE850|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE855|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE85A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE85F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE864|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE869|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE86E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE873|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE878|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE87D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE882|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE887|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE88C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE891|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE896|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE89B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE8FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE904|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE909|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE90E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE913|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE918|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE91D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE922|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE927|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE92C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE931|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE936|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE93B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE940|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE945|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE94A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE94F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE954|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE959|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE95E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE963|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE968|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE96D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE972|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE977|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE97C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE981|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE986|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE98B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE990|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE995|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE99A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE99F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AE9FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA03|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA08|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA0D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA12|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA17|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA1C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA21|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA26|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA2B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA30|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA35|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA3A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA3F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA44|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA49|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA4E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA53|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA58|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA5D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA62|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA67|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA6C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA71|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA76|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA7B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA80|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA85|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA8A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA8F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA94|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA99|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEA9E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAA3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAA8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAAD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAB2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAB7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEABC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAC6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEACB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAD0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAD5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEADA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEADF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAE9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAEE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAF3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAF8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEAFD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB02|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB07|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB0C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB11|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB16|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB1B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB20|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB25|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB2A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB2F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB34|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB39|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB3E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB43|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB48|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB4D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB52|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB57|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB5C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB61|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB66|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB6B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB70|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB75|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB7A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB7F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB84|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB89|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB8E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB93|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB98|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEB9D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBA2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBA7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBAC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBB1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBB6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBBB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBC0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBC5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBCA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBCF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBD4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBD9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBDE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBE3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBE8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBF2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBF7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEBFC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC01|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC06|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC0B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC10|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC15|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC1A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC1F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC24|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC29|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC2E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC33|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC38|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC3D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC42|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC47|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC4C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC51|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC56|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC5B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC60|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC65|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC6A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC6F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC74|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC79|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC7E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC83|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC88|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC8D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC92|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC97|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEC9C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECA1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECA6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECAB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECB0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECB5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECBA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECBF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECC4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECC9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECCE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECD3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECD8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECDD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECE2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECE7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECEC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECF1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECF6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AECFB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED00|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED05|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED0A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED0F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED14|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED19|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED1E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED23|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED28|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED2D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED32|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED37|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED3C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED41|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED46|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED4B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED50|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED55|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED5A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED5F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED64|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED69|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED6E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED73|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED78|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED7D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED82|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED87|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED8C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED91|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED96|        |      ;
                       db $00,$00,$00,$00,$00               ;0AED9B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDA0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDA5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDAA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDAF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDB4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDB9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDBE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDC3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDC8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDCD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDD2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDD7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDDC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDE1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDE6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDEB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDF0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDF5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDFA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEDFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE04|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE09|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE0E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE13|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE18|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE1D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE22|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE27|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE2C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE31|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE36|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE3B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE40|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE45|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE4A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE4F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE54|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE59|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE5E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE63|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE68|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE6D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE72|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE77|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE7C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE81|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE86|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE8B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE90|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE95|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE9A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEE9F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEA4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEA9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEAE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEB3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEB8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEBD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEC2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEC7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEECC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEED1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEED6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEDB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEE0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEE5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEEA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEEF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEF4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEF9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEEFE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF03|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF08|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF0D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF12|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF17|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF1C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF21|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF26|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF2B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF30|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF35|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF3A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF3F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF44|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF49|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF4E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF53|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF58|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF5D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF62|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF67|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF6C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF71|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF76|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF7B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF80|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF85|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF8A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF8F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF94|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF99|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEF9E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFA3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFA8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFAD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFB2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFB7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFBC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFC6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFCB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFD0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFD5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFDA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFDF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFE9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFEE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFF3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFF8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AEFFD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF002|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF007|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF00C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF011|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF016|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF01B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF020|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF025|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF02A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF02F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF034|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF039|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF03E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF043|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF048|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF04D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF052|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF057|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF05C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF061|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF066|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF06B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF070|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF075|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF07A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF07F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF084|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF089|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF08E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF093|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF098|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF09D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF0FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF101|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF106|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF10B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF110|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF115|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF11A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF11F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF124|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF129|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF12E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF133|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF138|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF13D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF142|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF147|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF14C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF151|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF156|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF15B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF160|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF165|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF16A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF16F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF174|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF179|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF17E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF183|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF188|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF18D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF192|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF197|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF19C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF1FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF200|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF205|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF20A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF20F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF214|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF219|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF21E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF223|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF228|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF22D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF232|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF237|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF23C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF241|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF246|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF24B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF250|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF255|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF25A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF25F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF264|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF269|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF26E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF273|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF278|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF27D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF282|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF287|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF28C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF291|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF296|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF29B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF2FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF304|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF309|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF30E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF313|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF318|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF31D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF322|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF327|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF32C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF331|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF336|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF33B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF340|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF345|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF34A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF34F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF354|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF359|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF35E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF363|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF368|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF36D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF372|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF377|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF37C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF381|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF386|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF38B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF390|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF395|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF39A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF39F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF3FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF403|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF408|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF40D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF412|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF417|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF41C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF421|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF426|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF42B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF430|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF435|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF43A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF43F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF444|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF449|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF44E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF453|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF458|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF45D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF462|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF467|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF46C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF471|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF476|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF47B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF480|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF485|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF48A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF48F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF494|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF499|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF49E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF4FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF502|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF507|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF50C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF511|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF516|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF51B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF520|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF525|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF52A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF52F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF534|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF539|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF53E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF543|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF548|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF54D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF552|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF557|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF55C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF561|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF566|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF56B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF570|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF575|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF57A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF57F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF584|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF589|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF58E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF593|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF598|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF59D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5A2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5A7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5AC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5B1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5B6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5BB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5C0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5C5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5CA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5CF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5D4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5D9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5DE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5E3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5E8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5ED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5F2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5F7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF5FC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF601|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF606|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF60B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF610|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF615|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF61A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF61F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF624|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF629|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF62E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF633|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF638|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF63D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF642|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF647|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF64C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF651|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF656|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF65B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF660|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF665|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF66A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF66F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF674|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF679|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF67E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF683|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF688|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF68D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF692|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF697|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF69C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6A1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6A6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6AB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6B0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6B5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6BA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6BF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6C4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6C9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6CE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6D3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6D8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6DD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6E2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6E7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6EC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6F1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6F6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF6FB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF700|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF705|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF70A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF70F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF714|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF719|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF71E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF723|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF728|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF72D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF732|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF737|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF73C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF741|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF746|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF74B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF750|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF755|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF75A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF75F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF764|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF769|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF76E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF773|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF778|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF77D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF782|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF787|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF78C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF791|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF796|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF79B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7A0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7A5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7AA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7AF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7B4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7B9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7BE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7C3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7C8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7CD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7D2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7D7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7DC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7E1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7E6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7EB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7F0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7F5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7FA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF7FF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF804|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF809|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF80E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF813|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF818|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF81D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF822|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF827|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF82C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF831|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF836|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF83B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF840|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF845|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF84A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF84F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF854|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF859|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF85E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF863|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF868|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF86D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF872|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF877|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF87C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF881|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF886|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF88B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF890|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF895|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF89A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF89F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8A4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8A9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8AE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8B3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8B8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8BD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8C2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8C7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8CC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8D1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8D6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8DB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8E0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8E5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8EA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8EF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8F4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8F9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF8FE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF903|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF908|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF90D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF912|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF917|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF91C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF921|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF926|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF92B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF930|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF935|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF93A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF93F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF944|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF949|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF94E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF953|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF958|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF95D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF962|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF967|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF96C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF971|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF976|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF97B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF980|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF985|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF98A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF98F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF994|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF999|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF99E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9A3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9A8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9AD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9B2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9B7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9BC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9C1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9C6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9CB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9D0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9D5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9DA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9DF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9E4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9E9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9EE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9F3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9F8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AF9FD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA02|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA07|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA0C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA11|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA16|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA1B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA20|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA25|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA2A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA2F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA34|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA39|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA3E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA43|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA48|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA4D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA52|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA57|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA5C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA61|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA66|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA6B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA70|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA75|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA7A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA7F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA84|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA89|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA8E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA93|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA98|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFA9D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAA2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAA7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAAC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAB1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAB6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFABB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAC0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAC5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFACA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFACF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAD4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAD9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFADE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAE3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAE8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAF2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAF7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFAFC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB01|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB06|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB0B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB10|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB15|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB1A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB1F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB24|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB29|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB2E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB33|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB38|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB3D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB42|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB47|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB4C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB51|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB56|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB5B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB60|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB65|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB6A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB6F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB74|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB79|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB7E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB83|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB88|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB8D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB92|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB97|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFB9C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBA1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBA6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBAB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBB0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBB5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBBA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBBF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBC4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBC9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBCE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBD3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBD8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBDD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBE2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBE7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBEC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBF1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBF6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFBFB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC00|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC05|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC0A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC0F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC14|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC19|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC1E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC23|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC28|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC2D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC32|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC37|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC3C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC41|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC46|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC4B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC50|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC55|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC5A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC5F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC64|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC69|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC6E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC73|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC78|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC7D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC82|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC87|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC8C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC91|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC96|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFC9B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCA0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCA5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCAA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCAF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCB4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCB9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCBE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCC3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCC8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCCD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCD2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCD7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCDC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCE1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCE6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCEB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCF0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCF5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCFA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFCFF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD04|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD09|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD0E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD13|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD18|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD1D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD22|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD27|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD2C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD31|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD36|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD3B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD40|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD45|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD4A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD4F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD54|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD59|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD5E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD63|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD68|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD6D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD72|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD77|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD7C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD81|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD86|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD8B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD90|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD95|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD9A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFD9F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDA4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDA9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDAE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDB3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDB8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDBD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDC2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDC7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDCC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDD1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDD6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDDB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDE0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDE5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDEA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDEF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDF4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDF9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFDFE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE03|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE08|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE0D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE12|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE17|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE1C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE21|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE26|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE2B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE30|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE35|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE3A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE3F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE44|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE49|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE4E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE53|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE58|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE5D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE62|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE67|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE6C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE71|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE76|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE7B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE80|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE85|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE8A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE8F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE94|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE99|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFE9E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEA3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEA8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEAD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEB2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEB7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEBC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEC1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEC6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFECB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFED0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFED5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEDA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEDF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEE4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEE9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEEE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEF3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEF8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFEFD|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF02|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF07|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF0C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF11|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF16|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF1B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF20|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF25|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF2A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF2F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF34|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF39|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF3E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF43|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF48|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF4D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF52|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF57|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF5C|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF61|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF66|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF6B|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF70|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF75|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF7A|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF7F|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF84|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF89|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF8E|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF93|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF98|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFF9D|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFA2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFA7|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFAC|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFB1|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFB6|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFBB|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFC0|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFC5|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFCA|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFCF|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFD4|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFD9|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFDE|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFE3|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFE8|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFED|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFF2|        |      ;
                       db $00,$00,$00,$00,$00               ;0AFFF7|        |      ;
                       db $00,$00,$00,$00                   ;0AFFFC|        |      ;
