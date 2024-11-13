 
 
 
              bank_98: db $98                               ;0C8000|        |      ; NES PRG 30000
 
rocessNextSoundByteAlt: CPX.B #$05                           ;0C8001|E005    |      ;
                       BEQ instrument5                      ;0C8003|F032    |0C8037;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8005|B1E0    |0000E0;
                       CMP.B #$FF                           ;0C8007|C9FF    |      ;
                       BEQ CODE_0C8013                      ;0C8009|F008    |0C8013;
                       LDA.W $016E,X                        ;0C800B|BD6E01  |0C016E;
                       BPL CODE_0C8013                      ;0C800E|1003    |0C8013;
                       JMP.W CODE_0C8408                    ;0C8010|4C0884  |0C8408;
 
 
          CODE_0C8013: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8013|B1E0    |0000E0;
                       AND.B #$F0                           ;0C8015|29F0    |      ;
                       CMP.B #$C0                           ;0C8017|C9C0    |      ;
                       BCS CODE_0C801E                      ;0C8019|B003    |0C801E;
                       JMP.W CODE_0C812C                    ;0C801B|4C2C81  |0C812C;
 
 
          CODE_0C801E: AND.B #$30                           ;0C801E|2930    |      ;
                       LSR A                                ;0C8020|4A      |      ;
                       LSR A                                ;0C8021|4A      |      ;
                       LSR A                                ;0C8022|4A      |      ;
                       TAX                                  ;0C8023|AA      |      ;
                       LDA.W controlSoundByteFuncs,X        ;0C8024|BD0387  |0C8703;
                       STA.B r_SoundBankJumpAddr            ;0C8027|85E2    |0000E2;
                       LDA.W PTR16_0C8704,X                 ;0C8029|BD0487  |0C8704;
                       STA.B $E3                            ;0C802C|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;0C802E|A6EE    |0000EE;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8030|B1E0    |0000E0;
                       AND.B #$0F                           ;0C8032|290F    |      ;
                       JMP.W (r_SoundBankJumpAddr)          ;0C8034|6CE200  |0000E2;
 
 
          instrument5: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8037|B1E0    |0000E0;
                       AND.B #$F0                           ;0C8039|29F0    |      ;
                       CMP.B #$F0                           ;0C803B|C9F0    |      ;
                       BNE CODE_0C8046                      ;0C803D|D007    |0C8046;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C803F|B1E0    |0000E0;
                       AND.B #$0F                           ;0C8041|290F    |      ;
                       JMP.W CODE_0C85A3                    ;0C8043|4CA385  |0C85A3;
 
 
          CODE_0C8046: CMP.B #$D0                           ;0C8046|C9D0    |      ;
                       BEQ CODE_0C804D                      ;0C8048|F003    |0C804D;
                       JMP.W CODE_0C829B                    ;0C804A|4C9B82  |0C829B;
 
 
          CODE_0C804D: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C804D|B1E0    |0000E0;
                       AND.B #$0F                           ;0C804F|290F    |      ;
                       STA.W $010E,X                        ;0C8051|9D0E01  |0C010E;
                       INY                                  ;0C8054|C8      |      ;
                       JMP.W instrument5                    ;0C8055|4C3780  |0C8037;
 
 
          CODE_0C8058: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8058|B1E0    |0000E0;
                       LSR A                                ;0C805A|4A      |      ;
                       LSR A                                ;0C805B|4A      |      ;
                       LSR A                                ;0C805C|4A      |      ;
                       LSR A                                ;0C805D|4A      |      ;
                       CMP.B #$0C                           ;0C805E|C90C    |      ;
                       BNE CODE_0C8065                      ;0C8060|D003    |0C8065;
                       db $4C                               ;0C8062|        |      ;
 
                       dw CODE_0FE1A6                       ;0C8063|        |0FE1A6;
 
          CODE_0C8065: TAX                                  ;0C8065|AA      |      ;
                       LDA.W percussionSounds,X             ;0C8066|BD7880  |0C8078;
                       LDX.B r_CurrInstrumentIdx            ;0C8069|A6EE    |0000EE;
                       CMP.B #$6D                           ;0C806B|C96D    |      ;
                       BCC DATA8_0C8072                     ;0C806D|9003    |0C8072;
                       db $4C                               ;0C806F|        |      ;
 
                       dw CODE_0FE1AB                       ;0C8070|        |0FE1AB;
 
         DATA8_0C8072: db $20                               ;0C8072|        |      ;
                       dw initFreezWaterEffect_01           ;0C8073|        |0FE25F;
                       db $4C                               ;0C8075|        |      ;
 
                       dw CODE_0FE1A6                       ;0C8076|        |0FE1A6;
 
     percussionSounds: db $01,$02,$03,$04,$05,$70,$79,$6D   ;0C8078|        |      ;
                       db $6E,$6F,$70,$71                   ;0C8080|        |      ;
 
   endSoundCommonData: LDA.B #$01                           ;0C8084|A901    |      ;
                       STA.W $03C0,X                        ;0C8086|9DC003  |0C03C0;
                       LDA.W $015B,X                        ;0C8089|BD5B01  |0C015B;
                       db $20                               ;0C808C|        |      ;
                       dw CODE_0FE1CE                       ;0C808D|        |0FE1CE;
                       LDA.W $0189,X                        ;0C808F|BD8901  |0C0189;
                       AND.B #$0F                           ;0C8092|290F    |      ;
                       STA.W $03C3,X                        ;0C8094|9DC303  |0C03C3;
                       LDA.W $0115,X                        ;0C8097|BD1501  |0C0115;
                       AND.B #$BB                           ;0C809A|29BB    |      ;
                       ORA.B #$02                           ;0C809C|0902    |      ;
                       STA.W $0115,X                        ;0C809E|9D1501  |0C0115;
                       LDA.W $016E,X                        ;0C80A1|BD6E01  |0C016E;
                       AND.B #$DF                           ;0C80A4|29DF    |      ;
                       STA.W $016E,X                        ;0C80A6|9D6E01  |0C016E;
                       JMP.W CODE_0C8166                    ;0C80A9|4C6681  |0C8166;
 
 
          CODE_0C80AC: LDA.W $016E,X                        ;0C80AC|BD6E01  |0C016E;
                       AND.B #$DF                           ;0C80AF|29DF    |      ;
                       STA.W $016E,X                        ;0C80B1|9D6E01  |0C016E;
                       LDA.W $03D8,X                        ;0C80B4|BDD803  |0C03D8;
                       LSR A                                ;0C80B7|4A      |      ;
                       BCC CODE_0C80C2                      ;0C80B8|9008    |0C80C2;
                       LDA.W $016E,X                        ;0C80BA|BD6E01  |0C016E;
                       ORA.B #$20                           ;0C80BD|0920    |      ;
                       STA.W $016E,X                        ;0C80BF|9D6E01  |0C016E;
 
          CODE_0C80C2: RTS                                  ;0C80C2|60      |      ;
 
 
          CODE_0C80C3: AND.B #$7F                           ;0C80C3|297F    |      ;
                       STA.B r_SoundBankTempVar1            ;0C80C5|85E4    |0000E4;
                       TXA                                  ;0C80C7|8A      |      ;
                       SEC                                  ;0C80C8|38      |      ;
                       SBC.B r_SoundBankTempVar1            ;0C80C9|E5E4    |0000E4;
                       BCS CODE_0C80DE                      ;0C80CB|B011    |0C80DE;
                       SEC                                  ;0C80CD|38      |      ;
                       SBC.B #$E8                           ;0C80CE|E9E8    |      ;
                       TAX                                  ;0C80D0|AA      |      ;
                       LDA.W DATA16_0C870B,X                ;0C80D1|BD0B87  |0C870B;
                       STA.B r_SoundFrequency               ;0C80D4|85EC    |0000EC;
                       LDA.W DATA16_0C870C,X                ;0C80D6|BD0C87  |0C870C;
                       STA.B $ED                            ;0C80D9|85ED    |0000ED;
                       JMP.W CODE_0C8189                    ;0C80DB|4C8981  |0C8189;
 
 
          CODE_0C80DE: JMP.W CODE_0C817E                    ;0C80DE|4C7E81  |0C817E;
 
 
          CODE_0C80E1: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C80E1|B1E0    |0000E0;
                       AND.B #$0F                           ;0C80E3|290F    |      ;
 
          CODE_0C80E5: TAX                                  ;0C80E5|AA      |      ;
                       INX                                  ;0C80E6|E8      |      ;
                       LDA.B #$00                           ;0C80E7|A900    |      ;
                       STA.W $0193                          ;0C80E9|8D9301  |0C0193;
                       LDA.W $015D                          ;0C80EC|AD5D01  |0C015D;
                       STA.B r_SoundBankJumpAddr            ;0C80EF|85E2    |0000E2;
                       BEQ CODE_0C810A                      ;0C80F1|F017    |0C810A;
                       CMP.B #$80                           ;0C80F3|C980    |      ;
                       BCS CODE_0C8120                      ;0C80F5|B029    |0C8120;
                       INC.B r_SoundBankJumpAddr            ;0C80F7|E6E2    |0000E2;
                       LDA.B r_SoundBankJumpAddr            ;0C80F9|A5E2    |0000E2;
 
          CODE_0C80FB: DEX                                  ;0C80FB|CA      |      ;
                       BEQ CODE_0C8106                      ;0C80FC|F008    |0C8106;
                       CLC                                  ;0C80FE|18      |      ;
                       ADC.B r_SoundBankJumpAddr            ;0C80FF|65E2    |0000E2;
                       BCS CODE_0C810A                      ;0C8101|B007    |0C810A;
                       JMP.W CODE_0C80FB                    ;0C8103|4CFB80  |0C80FB;
 
 
          CODE_0C8106: CMP.B #$80                           ;0C8106|C980    |      ;
                       BCC CODE_0C810C                      ;0C8108|9002    |0C810C;
 
          CODE_0C810A: LDA.B #$90                           ;0C810A|A990    |      ;
 
          CODE_0C810C: STA.W $4008                          ;0C810C|8D0840  |0C4008;
                       JSR.W b18_waitAFewCycles2            ;0C810F|205387  |0C8753;
                       STA.W $0194                          ;0C8112|8D9401  |0C0194;
                       LDX.B r_CurrInstrumentIdx            ;0C8115|A6EE    |0000EE;
                       LDA.W $016E,X                        ;0C8117|BD6E01  |0C016E;
                       BPL CODE_0C811D                      ;0C811A|1001    |0C811D;
                       RTS                                  ;0C811C|60      |      ;
 
 
          CODE_0C811D: JMP.W CODE_0C8166                    ;0C811D|4C6681  |0C8166;
 
 
          CODE_0C8120: SEC                                  ;0C8120|38      |      ;
                       SBC.B #$80                           ;0C8121|E980    |      ;
                       JMP.W CODE_0C810C                    ;0C8123|4C0C81  |0C810C;
 
 
          CODE_0C8126: JMP.W CODE_0C80C3                    ;0C8126|4CC380  |0C80C3;
 
 
          CODE_0C8129: JMP.W endSoundCommonData             ;0C8129|4C8480  |0C8084;
 
 
          CODE_0C812C: JSR.W CODE_0C829B                    ;0C812C|209B82  |0C829B;
                       CPX.B #$02                           ;0C812F|E002    |      ;
                       BEQ CODE_0C80E1                      ;0C8131|F0AE    |0C80E1;
                       JSR.W CODE_0C80AC                    ;0C8133|20AC80  |0C80AC;
                       LDA.W $0189,X                        ;0C8136|BD8901  |0C0189;
                       BMI CODE_0C8129                      ;0C8139|30EE    |0C8129;
                       LDA.B #$00                           ;0C813B|A900    |      ;
                       STA.W $06B2,X                        ;0C813D|9DB206  |0C06B2;
                       STA.W $03C3,X                        ;0C8140|9DC303  |0C03C3;
                       STA.W $03C9,X                        ;0C8143|9DC903  |0C03C9;
                       STA.W $03C6,X                        ;0C8146|9DC603  |0C03C6;
                       STA.W $03C0,X                        ;0C8149|9DC003  |0C03C0;
                       INC.W $03C0,X                        ;0C814C|FEC003  |0C03C0;
                       STY.B r_SoundBankTempVar1            ;0C814F|84E4    |0000E4;
                       db $20                               ;0C8151|        |      ;
                       dw CODE_0FE1DE                       ;0C8152|        |0FE1DE;
                       LDY.B r_SoundBankTempVar1            ;0C8154|A4E4    |0000E4;
                       LDA.W $0115,X                        ;0C8156|BD1501  |0C0115;
                       AND.B #$B9                           ;0C8159|29B9    |      ;
                       STA.W $0115,X                        ;0C815B|9D1501  |0C0115;
                       LDA.W $016E,X                        ;0C815E|BD6E01  |0C016E;
                       AND.B #$DF                           ;0C8161|29DF    |      ;
                       STA.W $016E,X                        ;0C8163|9D6E01  |0C016E;
 
          CODE_0C8166: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8166|B1E0    |0000E0;
                       AND.B #$F0                           ;0C8168|29F0    |      ;
                       LSR A                                ;0C816A|4A      |      ;
                       LSR A                                ;0C816B|4A      |      ;
                       LSR A                                ;0C816C|4A      |      ;
                       TAX                                  ;0C816D|AA      |      ;
                       STY.B r_SoundBankJumpAddr            ;0C816E|84E2    |0000E2;
                       LDY.B r_CurrInstrumentIdx            ;0C8170|A4EE    |0000EE;
                       LDA.W $0180,Y                        ;0C8172|B98001  |0C0180;
                       BEQ CODE_0C817F                      ;0C8175|F008    |0C817F;
                       BMI CODE_0C8126                      ;0C8177|30AD    |0C8126;
                       TXA                                  ;0C8179|8A      |      ;
                       CLC                                  ;0C817A|18      |      ;
                       ADC.W $0180,Y                        ;0C817B|798001  |0C0180;
 
          CODE_0C817E: TAX                                  ;0C817E|AA      |      ;
 
          CODE_0C817F: LDA.W DATA16_0C8723,X                ;0C817F|BD2387  |0C8723;
                       STA.B r_SoundFrequency               ;0C8182|85EC    |0000EC;
                       LDA.W DATA16_0C8724,X                ;0C8184|BD2487  |0C8724;
                       STA.B $ED                            ;0C8187|85ED    |0000ED;
 
          CODE_0C8189: LDY.B r_SoundBankJumpAddr            ;0C8189|A4E2    |0000E2;
                       LDX.B r_CurrInstrumentIdx            ;0C818B|A6EE    |0000EE;
                       LDA.W $017D,X                        ;0C818D|BD7D01  |0C017D;
                       TAX                                  ;0C8190|AA      |      ;
 
          CODE_0C8191: CPX.B #$05                           ;0C8191|E005    |      ;
                       BEQ CODE_0C819C                      ;0C8193|F007    |0C819C;
                       LSR.B $ED                            ;0C8195|46ED    |0000ED;
                       ROR.B r_SoundFrequency               ;0C8197|66EC    |0000EC;
                       INX                                  ;0C8199|E8      |      ;
                       BNE CODE_0C8191                      ;0C819A|D0F5    |0C8191;
 
          CODE_0C819C: LDX.B r_CurrInstrumentIdx            ;0C819C|A6EE    |0000EE;
                       LDA.B r_SoundFrequency               ;0C819E|A5EC    |0000EC;
                       STA.W $0183,X                        ;0C81A0|9D8301  |0C0183;
                       LDA.B $ED                            ;0C81A3|A5ED    |0000ED;
                       STA.W $0186,X                        ;0C81A5|9D8601  |0C0186;
                       CPX.B #$02                           ;0C81A8|E002    |      ;
                       BEQ CODE_0C81C7                      ;0C81AA|F01B    |0C81C7;
                       LDA.W $06AC,X                        ;0C81AC|BDAC06  |0C06AC;
                       BMI CODE_0C81B4                      ;0C81AF|3003    |0C81B4;
                       JSR.W CODE_0C8229                    ;0C81B1|202982  |0C8229;
 
          CODE_0C81B4: LDA.W $016E,X                        ;0C81B4|BD6E01  |0C016E;
                       AND.B #$10                           ;0C81B7|2910    |      ;
 
                       BEQ CODE_0C81C7                      ;0C81B9|F00C    |0C81C7;
                       LDA.W $03DB,X                        ;0C81BB|BDDB03  |0C03DB;
                       BNE CODE_0C81C7                      ;0C81BE|D007    |0C81C7;
                       TYA                                  ;0C81C0|98      |      ;
                       PHA                                  ;0C81C1|48      |      ;
                       db $20                               ;0C81C2|        |      ;
                       dw CODE_0FE1EC                       ;0C81C3|        |0FE1EC;
                       PLA                                  ;0C81C5|68      |      ;
                       TAY                                  ;0C81C6|A8      |      ;
 
          CODE_0C81C7: JSR.W CODE_0C81CD                    ;0C81C7|20CD81  |0C81CD;
                       JMP.W CODE_0C86D6                    ;0C81CA|4CD686  |0C86D6;
 
 
          CODE_0C81CD: CPX.B #$06                           ;0C81CD|E006    |      ;
                       BEQ CODE_0C81FE                      ;0C81CF|F02D    |0C81FE;
                       JSR.W CODE_0C826F                    ;0C81D1|206F82  |0C826F;
                       CPX.B #$02                           ;0C81D4|E002    |      ;
                       BEQ CODE_0C81FE                      ;0C81D6|F026    |0C81FE;
                       LDA.W $016E,X                        ;0C81D8|BD6E01  |0C016E;
                       AND.B #$10                           ;0C81DB|2910    |      ;
                       BEQ CODE_0C81E7                      ;0C81DD|F008    |0C81E7;
                       LDA.W $03DE,X                        ;0C81DF|BDDE03  |0C03DE;
                       CMP.B #$FF                           ;0C81E2|C9FF    |      ;
                       BNE CODE_0C81E7                      ;0C81E4|D001    |0C81E7;
                       RTS                                  ;0C81E6|60      |      ;
 
 
          CODE_0C81E7: LDA.B $ED                            ;0C81E7|A5ED    |0000ED;
                       CMP.W $014D,X                        ;0C81E9|DD4D01  |0C014D;
                       BNE CODE_0C8200                      ;0C81EC|D012    |0C8200;
                       LDA.W $0115,X                        ;0C81EE|BD1501  |0C0115;
                       AND.B #$81                           ;0C81F1|2981    |      ;
                       CMP.B #$81                           ;0C81F3|C981    |      ;
                       BEQ CODE_0C81FE                      ;0C81F5|F007    |0C81FE;
                       LDA.W $0162,X                        ;0C81F7|BD6201  |0C0162;
                       AND.B #$10                           ;0C81FA|2910    |      ;
                       BNE CODE_0C8210                      ;0C81FC|D012    |0C8210;
 
          CODE_0C81FE: LDA.B $ED                            ;0C81FE|A5ED    |0000ED;
 
          CODE_0C8200: STA.W $014D,X                        ;0C8200|9D4D01  |0C014D;
                       ORA.B #$08                           ;0C8203|0908    |      ;
                       JSR.W CODE_0C8313                    ;0C8205|201383  |0C8313;
                       BCS CODE_0C8210                      ;0C8208|B006    |0C8210;
                       STA.W $4003,X                        ;0C820A|9D0340  |0C4003;
                       JSR.W b18_waitAFewCycles2            ;0C820D|205387  |0C8753;
 
          CODE_0C8210: LDA.B r_SoundFrequency               ;0C8210|A5EC    |0000EC;
                       LDX.B r_CurrInstrumentIdx            ;0C8212|A6EE    |0000EE;
                       CPX.B #$03                           ;0C8214|E003    |      ;
                       BCS CODE_0C821B                      ;0C8216|B003    |0C821B;
                       STA.W $0178,X                        ;0C8218|9D7801  |0C0178;
 
          CODE_0C821B: JSR.W CODE_0C8313                    ;0C821B|201383  |0C8313;
                       BCS CODE_0C8226                      ;0C821E|B006    |0C8226;
                       STA.W $4002,X                        ;0C8220|9D0240  |0C4002;
                       JSR.W b18_waitAFewCycles2            ;0C8223|205387  |0C8753;
 
          CODE_0C8226: LDX.B r_CurrInstrumentIdx            ;0C8226|A6EE    |0000EE;
                       RTS                                  ;0C8228|60      |      ;
 
 
          CODE_0C8229: STY.B r_SoundBankJumpAddr            ;0C8229|84E2    |0000E2;
                       LDA.W $06AF,X                        ;0C822B|BDAF06  |0C06AF;
                       CPX.B #$00                           ;0C822E|E000    |      ;
                       BEQ CODE_0C8234                      ;0C8230|F002    |0C8234;
                       ORA.B #$04                           ;0C8232|0904    |      ;
 
          CODE_0C8234: TAY                                  ;0C8234|A8      |      ;
                       LDA.B $ED                            ;0C8235|A5ED    |0000ED;
                       STA.W $06BF,Y                        ;0C8237|99BF06  |0C06BF;
                       LDA.B r_SoundFrequency               ;0C823A|A5EC    |0000EC;
                       STA.W $06B5,Y                        ;0C823C|99B506  |0C06B5;
                       LDA.W $06AC,X                        ;0C823F|BDAC06  |0C06AC;
                       AND.B #$40                           ;0C8242|2940    |      ;
                       BEQ CODE_0C8261                      ;0C8244|F01B    |0C8261;
                       LDA.W $06AC,X                        ;0C8246|BDAC06  |0C06AC;
                       AND.B #$BF                           ;0C8249|29BF    |      ;
                       STA.W $06AC,X                        ;0C824B|9DAC06  |0C06AC;
                       LDA.B #$03                           ;0C824E|A903    |      ;
                       STA.B r_SoundBankTempVar1            ;0C8250|85E4    |0000E4;
 
          CODE_0C8252: INY                                  ;0C8252|C8      |      ;
                       LDA.B $ED                            ;0C8253|A5ED    |0000ED;
                       STA.W $06BF,Y                        ;0C8255|99BF06  |0C06BF;
                       LDA.B r_SoundFrequency               ;0C8258|A5EC    |0000EC;
                       STA.W $06B5,Y                        ;0C825A|99B506  |0C06B5;
                       DEC.B r_SoundBankTempVar1            ;0C825D|C6E4    |0000E4;
                       BNE CODE_0C8252                      ;0C825F|D0F1    |0C8252;
 
          CODE_0C8261: LDY.B r_SoundBankJumpAddr            ;0C8261|A4E2    |0000E2;
                       INC.W $06AF,X                        ;0C8263|FEAF06  |0C06AF;
                       LDA.W $06AF,X                        ;0C8266|BDAF06  |0C06AF;
                       AND.B #$03                           ;0C8269|2903    |      ;
                       STA.W $06AF,X                        ;0C826B|9DAF06  |0C06AF;
                       RTS                                  ;0C826E|60      |      ;
 
 
          CODE_0C826F: LDA.W $0173,X                        ;0C826F|BD7301  |0C0173;
                       STA.B r_SoundBankJumpAddr            ;0C8272|85E2    |0000E2;
                       BEQ CODE_0C8287                      ;0C8274|F011    |0C8287;
                       BPL CODE_0C8288                      ;0C8276|1010    |0C8288;
                       AND.B #$7F                           ;0C8278|297F    |      ;
                       STA.B r_SoundBankJumpAddr            ;0C827A|85E2    |0000E2;
                       LDA.B r_SoundFrequency               ;0C827C|A5EC    |0000EC;
                       CLC                                  ;0C827E|18      |      ;
                       ADC.B r_SoundBankJumpAddr            ;0C827F|65E2    |0000E2;
                       STA.B r_SoundFrequency               ;0C8281|85EC    |0000EC;
                       BCC CODE_0C8287                      ;0C8283|9002    |0C8287;
                       INC.B $ED                            ;0C8285|E6ED    |0000ED;
 
          CODE_0C8287: RTS                                  ;0C8287|60      |      ;
 
 
          CODE_0C8288: LDA.B r_SoundFrequency               ;0C8288|A5EC    |0000EC;
                       SEC                                  ;0C828A|38      |      ;
                       SBC.B r_SoundBankJumpAddr            ;0C828B|E5E2    |0000E2;
                       STA.B r_SoundFrequency               ;0C828D|85EC    |0000EC;
                       BCS CODE_0C8293                      ;0C828F|B002    |0C8293;
                       DEC.B $ED                            ;0C8291|C6ED    |0000ED;
 
          CODE_0C8293: RTS                                  ;0C8293|60      |      ;
 
 
          CODE_0C8294: JSR.W processInstrument              ;0C8294|20C686  |0C86C6;
                       DEY                                  ;0C8297|88      |      ;
                       JMP.W CODE_0C8058                    ;0C8298|4C5880  |0C8058;
 
 
          CODE_0C829B: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C829B|B1E0    |0000E0;
                       AND.B #$0F                           ;0C829D|290F    |      ;
 
          CODE_0C829F: STA.B r_SoundBankJumpAddr            ;0C829F|85E2    |0000E2;
                       BEQ CODE_0C82B0                      ;0C82A1|F00D    |0C82B0;
                       LDA.W $010E,X                        ;0C82A3|BD0E01  |0C010E;
 
          CODE_0C82A6: CLC                                  ;0C82A6|18      |      ;
                       ADC.W $010E,X                        ;0C82A7|7D0E01  |0C010E;
                       DEC.B r_SoundBankJumpAddr            ;0C82AA|C6E2    |0000E2;
                       BNE CODE_0C82A6                      ;0C82AC|D0F8    |0C82A6;
                       BEQ CODE_0C82B3                      ;0C82AE|F003    |0C82B3;
 
          CODE_0C82B0: LDA.W $010E,X                        ;0C82B0|BD0E01  |0C010E;
 
          CODE_0C82B3: STA.W $0100,X                        ;0C82B3|9D0001  |0C0100;
                       CPX.B #$05                           ;0C82B6|E005    |      ;
                       BEQ CODE_0C8294                      ;0C82B8|F0DA    |0C8294;
                       CPX.B #$02                           ;0C82BA|E002    |      ;
                       BEQ CODE_0C82E7                      ;0C82BC|F029    |0C82E7;
                       LDA.W $016E,X                        ;0C82BE|BD6E01  |0C016E;
                       AND.B #$10                           ;0C82C1|2910    |      ;
                       BEQ CODE_0C82D9                      ;0C82C3|F014    |0C82D9;
                       LDA.W $03DB,X                        ;0C82C5|BDDB03  |0C03DB;
                       STA.W $03DE,X                        ;0C82C8|9DDE03  |0C03DE;
                       INC.W $03DE,X                        ;0C82CB|FEDE03  |0C03DE;
                       LDA.B #$00                           ;0C82CE|A900    |      ;
                       STA.W $06A6,X                        ;0C82D0|9DA606  |0C06A6;
                       STA.W $06A9,X                        ;0C82D3|9DA906  |0C06A9;
                       STA.W $06A0,X                        ;0C82D6|9DA006  |0C06A0;
 
          CODE_0C82D9: LDA.W $03CF,X                        ;0C82D9|BDCF03  |0C03CF;
                       JSR.W CODE_0C82E8                    ;0C82DC|20E882  |0C82E8;
                       STA.W $03CC,X                        ;0C82DF|9DCC03  |0C03CC;
                       LDA.B #$01                           ;0C82E2|A901    |      ;
                       STA.W $03D5,X                        ;0C82E4|9DD503  |0C03D5;
 
          CODE_0C82E7: RTS                                  ;0C82E7|60      |      ;
 
 
          CODE_0C82E8: AND.B #$0F                           ;0C82E8|290F    |      ;
                       STA.B r_SoundBankJumpAddr            ;0C82EA|85E2    |0000E2;
                       LDA.B #$00                           ;0C82EC|A900    |      ;
                       STA.B r_SoundBankTempVar1            ;0C82EE|85E4    |0000E4;
                       STA.B r_SoundBankTempVar2            ;0C82F0|85E5    |0000E5;
 
          CODE_0C82F2: DEC.B r_SoundBankJumpAddr            ;0C82F2|C6E2    |0000E2;
                       BMI CODE_0C8304                      ;0C82F4|300E    |0C8304;
                       CLC                                  ;0C82F6|18      |      ;
                       LDA.W $0100,X                        ;0C82F7|BD0001  |0C0100;
                       ADC.B r_SoundBankTempVar1            ;0C82FA|65E4    |0000E4;
                       STA.B r_SoundBankTempVar1            ;0C82FC|85E4    |0000E4;
                       BCC CODE_0C82F2                      ;0C82FE|90F2    |0C82F2;
                       INC.B r_SoundBankTempVar2            ;0C8300|E6E5    |0000E5;
                       BNE CODE_0C82F2                      ;0C8302|D0EE    |0C82F2;
 
          CODE_0C8304: ASL A                                ;0C8304|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;0C8305|26E5    |0000E5;
                       ASL A                                ;0C8307|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;0C8308|26E5    |0000E5;
                       ASL A                                ;0C830A|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;0C830B|26E5    |0000E5;
                       ASL A                                ;0C830D|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;0C830E|26E5    |0000E5;
                       LDA.B r_SoundBankTempVar2            ;0C8310|A5E5    |0000E5;
                       RTS                                  ;0C8312|60      |      ;
 
 
          CODE_0C8313: PHA                                  ;0C8313|48      |      ;
                       CPX.B #$00                           ;0C8314|E000    |      ;
                       BEQ CODE_0C832A                      ;0C8316|F012    |0C832A;
                       CPX.B #$01                           ;0C8318|E001    |      ;
                       BEQ CODE_0C8332                      ;0C831A|F016    |0C8332;
 
          CODE_0C831C: CLC                                  ;0C831C|18      |      ;
 
          CODE_0C831D: LDA.W currInstrHwRegOffset,X         ;0C831D|BD2383  |0C8323;
                       TAX                                  ;0C8320|AA      |      ;
                       PLA                                  ;0C8321|68      |      ;
                       RTS                                  ;0C8322|60      |      ;
 
 
 currInstrHwRegOffset: db $00,$04,$08,$00,$04,$0C,$0C       ;0C8323|        |      ;
 
          CODE_0C832A: LDA.W $010A                          ;0C832A|AD0A01  |0C010A;
                       BEQ CODE_0C831C                      ;0C832D|F0ED    |0C831C;
                       SEC                                  ;0C832F|38      |      ;
                       BNE CODE_0C831D                      ;0C8330|D0EB    |0C831D;
 
          CODE_0C8332: LDA.W $010B                          ;0C8332|AD0B01  |0C010B;
                       BEQ CODE_0C831C                      ;0C8335|F0E5    |0C831C;
                       SEC                                  ;0C8337|38      |      ;
                       BNE CODE_0C831D                      ;0C8338|D0E3    |0C831D;
 
          CODE_0C833A: JSR.W CODE_0C829F                    ;0C833A|209F82  |0C829F;
                       LDA.B #$00                           ;0C833D|A900    |      ;
                       CPX.B #$02                           ;0C833F|E002    |      ;
                       BNE CODE_0C8349                      ;0C8341|D006    |0C8349;
                       JSR.W CODE_0C867C                    ;0C8343|207C86  |0C867C;
                       JMP.W CODE_0C8356                    ;0C8346|4C5683  |0C8356;
 
 
          CODE_0C8349: LDA.B #$30                           ;0C8349|A930    |      ;
                       JSR.W CODE_0C8313                    ;0C834B|201383  |0C8313;
                       BCS CODE_0C8356                      ;0C834E|B006    |0C8356;
                       STA.W $4000,X                        ;0C8350|9D0040  |0C4000;
                       JSR.W b18_waitAFewCycles2            ;0C8353|205387  |0C8753;
 
          CODE_0C8356: LDX.B r_CurrInstrumentIdx            ;0C8356|A6EE    |0000EE;
                       LDA.W $0115,X                        ;0C8358|BD1501  |0C0115;
                       ORA.B #$40                           ;0C835B|0940    |      ;
                       STA.W $0115,X                        ;0C835D|9D1501  |0C0115;
                       JMP.W CODE_0C86D6                    ;0C8360|4CD686  |0C86D6;
 
 
          CODE_0C8363: STA.W $010E,X                        ;0C8363|9D0E01  |0C010E;
                       INY                                  ;0C8366|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8367|B1E0    |0000E0;
                       CPX.B #$02                           ;0C8369|E002    |      ;
                       BEQ CODE_0C83A0                      ;0C836B|F033    |0C83A0;
                       AND.B #$F0                           ;0C836D|29F0    |      ;
                       STA.W $0162,X                        ;0C836F|9D6201  |0C0162;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8372|B1E0    |0000E0;
                       AND.B #$0F                           ;0C8374|290F    |      ;
                       STA.W $015B,X                        ;0C8376|9D5B01  |0C015B;
                       INY                                  ;0C8379|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C837A|B1E0    |0000E0;
                       STA.W $0189,X                        ;0C837C|9D8901  |0C0189;
                       BPL CODE_0C8385                      ;0C837F|1004    |0C8385;
                       LDA.B #$00                           ;0C8381|A900    |      ;
                       BEQ CODE_0C8388                      ;0C8383|F003    |0C8388;
 
          CODE_0C8385: LDA.W $015B,X                        ;0C8385|BD5B01  |0C015B;
 
          CODE_0C8388: STA.W $0169,X                        ;0C8388|9D6901  |0C0169;
                       INY                                  ;0C838B|C8      |      ;
 
          CODE_0C838C: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C838C|B1E0    |0000E0;
                       AND.B #$0F                           ;0C838E|290F    |      ;
                       STA.W $03CF,X                        ;0C8390|9DCF03  |0C03CF;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8393|B1E0    |0000E0;
                       LSR A                                ;0C8395|4A      |      ;
                       LSR A                                ;0C8396|4A      |      ;
                       LSR A                                ;0C8397|4A      |      ;
                       LSR A                                ;0C8398|4A      |      ;
                       STA.W $03D2,X                        ;0C8399|9DD203  |0C03D2;
                       INY                                  ;0C839C|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C839D|4C0180  |0C8001;
 
 
          CODE_0C83A0: STA.W $015D                          ;0C83A0|8D5D01  |0C015D;
                       INY                                  ;0C83A3|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C83A4|4C0180  |0C8001;
 
 
          CODE_0C83A7: STA.B r_SoundBankJumpAddr            ;0C83A7|85E2    |0000E2;
                       LDA.W $016E,X                        ;0C83A9|BD6E01  |0C016E;
                       AND.B #$7F                           ;0C83AC|297F    |      ;
                       STA.W $016E,X                        ;0C83AE|9D6E01  |0C016E;
                       LDA.B r_SoundBankJumpAddr            ;0C83B1|A5E2    |0000E2;
                       CMP.B #$06                           ;0C83B3|C906    |      ;
                       BCS CODE_0C83BE                      ;0C83B5|B007    |0C83BE;
                       STA.W $017D,X                        ;0C83B7|9D7D01  |0C017D;
                       INY                                  ;0C83BA|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C83BB|4C0180  |0C8001;
 
 
          CODE_0C83BE: AND.B #$0F                           ;0C83BE|290F    |      ;
                       SEC                                  ;0C83C0|38      |      ;
                       SBC.B #$06                           ;0C83C1|E906    |      ;
                       ASL A                                ;0C83C3|0A      |      ;
                       TAX                                  ;0C83C4|AA      |      ;
                       LDA.W PTR16_0C83D4,X                 ;0C83C5|BDD483  |0C83D4;
                       STA.B r_SoundBankJumpAddr            ;0C83C8|85E2    |0000E2;
                       LDA.W PTR16_0C83D5,X                 ;0C83CA|BDD583  |0C83D5;
                       STA.B $E3                            ;0C83CD|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;0C83CF|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;0C83D1|6CE200  |0000E2;
 
 
         PTR16_0C83D4: dw CODE_0C83E8                       ;0C83D4|        |0C83E8;
                       dw CODE_0C83FF                       ;0C83D6|        |0C83FF;
                       dw CODE_0C8446                       ;0C83D8|        |0C8446;
                       dw CODE_0C844A                       ;0C83DA|        |0C844A;
                       dw CODE_0C847C                       ;0C83DC|        |0C847C;
                       dw CODE_0C848F                       ;0C83DE|        |0C848F;
                       dw CODE_0C84DD                       ;0C83E0|        |0C84DD;
                       dw CODE_0C850D                       ;0C83E2|        |0C850D;
                       dw CODE_0C851A                       ;0C83E4|        |0C851A;
                       dw CODE_0C850D                       ;0C83E6|        |0C850D;
 
          CODE_0C83E8: INY                                  ;0C83E8|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C83E9|B1E0    |0000E0;
                       STA.W $010E,X                        ;0C83EB|9D0E01  |0C010E;
                       LDA.W $016E,X                        ;0C83EE|BD6E01  |0C016E;
                       BPL CODE_0C83FB                      ;0C83F1|1008    |0C83FB;
                       LDA.W $010E,X                        ;0C83F3|BD0E01  |0C010E;
                       AND.B #$0F                           ;0C83F6|290F    |      ;
                       STA.W $010E,X                        ;0C83F8|9D0E01  |0C010E;
 
          CODE_0C83FB: INY                                  ;0C83FB|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C83FC|4C0180  |0C8001;
 
 
          CODE_0C83FF: INY                                  ;0C83FF|C8      |      ;
                       LDA.W $016E,X                        ;0C8400|BD6E01  |0C016E;
                       ORA.B #$80                           ;0C8403|0980    |      ;
                       STA.W $016E,X                        ;0C8405|9D6E01  |0C016E;
 
          CODE_0C8408: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8408|B1E0    |0000E0;
                       AND.B #$F0                           ;0C840A|29F0    |      ;
                       LSR A                                ;0C840C|4A      |      ;
                       LSR A                                ;0C840D|4A      |      ;
                       LSR A                                ;0C840E|4A      |      ;
                       TAX                                  ;0C840F|AA      |      ;
                       DEY                                  ;0C8410|88      |      ;
                       LDA.W PTR16_0C8420,X                 ;0C8411|BD2084  |0C8420;
                       STA.B r_SoundBankJumpAddr            ;0C8414|85E2    |0000E2;
                       LDA.W PTR16_0C8421,X                 ;0C8416|BD2184  |0C8421;
                       STA.B $E3                            ;0C8419|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;0C841B|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;0C841D|6CE200  |0000E2;
 
 
         PTR16_0C8420: dw startIntrumentProcessing          ;0C8420|        |0C8434;
                       dw startIntrumentProcessing          ;0C8422|        |0C8434;
                       dw startIntrumentProcessing          ;0C8424|        |0C8434;
                       dw startIntrumentProcessing          ;0C8426|        |0C8434;
                       dw startIntrumentProcessing          ;0C8428|        |0C8434;
                       dw startIntrumentProcessing          ;0C842A|        |0C8434;
                       dw startIntrumentProcessing          ;0C842C|        |0C8434;
                       dw startIntrumentProcessing          ;0C842E|        |0C8434;
                       dw startIntrumentProcessing          ;0C8430|        |0C8434;
                       dw startIntrumentProcessing          ;0C8432|        |0C8434;
 
startIntrumentProcessing: INY                                  ;0C8434|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8435|B1E0    |0000E0;
                       STA.W $0189,X                        ;0C8437|9D8901  |0C0189;
                       LDA.W $016E,X                        ;0C843A|BD6E01  |0C016E;
                       AND.B #$7F                           ;0C843D|297F    |      ;
                       STA.W $016E,X                        ;0C843F|9D6E01  |0C016E;
                       INY                                  ;0C8442|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C8443|4C0180  |0C8001;
 
 
          CODE_0C8446: INY                                  ;0C8446|C8      |      ;
                       JMP.W CODE_0C838C                    ;0C8447|4C8C83  |0C838C;
 
 
          CODE_0C844A: INY                                  ;0C844A|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C844B|B1E0    |0000E0;
                       BEQ CODE_0C8464                      ;0C844D|F015    |0C8464;
                       AND.B #$0F                           ;0C844F|290F    |      ;
                       BEQ CODE_0C8474                      ;0C8451|F021    |0C8474;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8453|B1E0    |0000E0;
                       STA.W $03D8,X                        ;0C8455|9DD803  |0C03D8;
                       LDA.W $016E,X                        ;0C8458|BD6E01  |0C016E;
                       ORA.B #$20                           ;0C845B|0920    |      ;
                       STA.W $016E,X                        ;0C845D|9D6E01  |0C016E;
 
          CODE_0C8460: INY                                  ;0C8460|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C8461|4C0180  |0C8001;
 
 
          CODE_0C8464: LDA.W $016E,X                        ;0C8464|BD6E01  |0C016E;
                       AND.B #$DF                           ;0C8467|29DF    |      ;
                       STA.W $016E,X                        ;0C8469|9D6E01  |0C016E;
                       LDA.B #$00                           ;0C846C|A900    |      ;
                       STA.W $03D8,X                        ;0C846E|9DD803  |0C03D8;
                       JMP.W CODE_0C8460                    ;0C8471|4C6084  |0C8460;
 
 
          CODE_0C8474: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8474|B1E0    |0000E0;
                       STA.W $0162,X                        ;0C8476|9D6201  |0C0162;
                       JMP.W CODE_0C8460                    ;0C8479|4C6084  |0C8460;
 
 
          CODE_0C847C: INY                                  ;0C847C|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C847D|B1E0    |0000E0;
                       BMI CODE_0C8489                      ;0C847F|3008    |0C8489;
                       ASL A                                ;0C8481|0A      |      ;
 
          CODE_0C8482: STA.W $0180,X                        ;0C8482|9D8001  |0C0180;
                       INY                                  ;0C8485|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C8486|4C0180  |0C8001;
 
 
          CODE_0C8489: ASL A                                ;0C8489|0A      |      ;
                       ORA.B #$80                           ;0C848A|0980    |      ;
                       JMP.W CODE_0C8482                    ;0C848C|4C8284  |0C8482;
 
 
          CODE_0C848F: INY                                  ;0C848F|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8490|B1E0    |0000E0;
                       BEQ CODE_0C84D2                      ;0C8492|F03E    |0C84D2;
                       SEC                                  ;0C8494|38      |      ;
                       SBC.B #$50                           ;0C8495|E950    |      ;
                       STA.W $06A3,X                        ;0C8497|9DA306  |0C06A3;
                       LDA.W $016E,X                        ;0C849A|BD6E01  |0C016E;
                       ORA.B #$10                           ;0C849D|0910    |      ;
                       STA.W $016E,X                        ;0C849F|9D6E01  |0C016E;
                       INY                                  ;0C84A2|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C84A3|B1E0    |0000E0;
                       AND.B #$F0                           ;0C84A5|29F0    |      ;
                       LSR A                                ;0C84A7|4A      |      ;
                       LSR A                                ;0C84A8|4A      |      ;
                       LSR A                                ;0C84A9|4A      |      ;
                       LSR A                                ;0C84AA|4A      |      ;
                       CMP.B #$00                           ;0C84AB|C900    |      ;
                       BEQ CODE_0C84C5                      ;0C84AD|F016    |0C84C5;
                       STA.B r_SoundBankJumpAddr            ;0C84AF|85E2    |0000E2;
                       DEC.B r_SoundBankJumpAddr            ;0C84B1|C6E2    |0000E2;
                       BEQ CODE_0C84C2                      ;0C84B3|F00D    |0C84C2;
                       LDA.W $010E,X                        ;0C84B5|BD0E01  |0C010E;
                       CLC                                  ;0C84B8|18      |      ;
 
          CODE_0C84B9: ADC.W $010E,X                        ;0C84B9|7D0E01  |0C010E;
                       DEC.B r_SoundBankJumpAddr            ;0C84BC|C6E2    |0000E2;
                       BNE CODE_0C84B9                      ;0C84BE|D0F9    |0C84B9;
                       BEQ CODE_0C84C5                      ;0C84C0|F003    |0C84C5;
 
          CODE_0C84C2: LDA.W $010E,X                        ;0C84C2|BD0E01  |0C010E;
 
          CODE_0C84C5: STA.W $03DB,X                        ;0C84C5|9DDB03  |0C03DB;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C84C8|B1E0    |0000E0;
                       AND.B #$0F                           ;0C84CA|290F    |      ;
                       STA.W $03E1,X                        ;0C84CC|9DE103  |0C03E1;
                       JMP.W CODE_0C8460                    ;0C84CF|4C6084  |0C8460;
 
 
          CODE_0C84D2: LDA.W $016E,X                        ;0C84D2|BD6E01  |0C016E;
                       AND.B #$EF                           ;0C84D5|29EF    |      ;
                       STA.W $016E,X                        ;0C84D7|9D6E01  |0C016E;
                       JMP.W CODE_0C8460                    ;0C84DA|4C6084  |0C8460;
 
 
          CODE_0C84DD: INY                                  ;0C84DD|C8      |      ;
                       LDA.W $016E,X                        ;0C84DE|BD6E01  |0C016E;
                       BPL CODE_0C84EB                      ;0C84E1|1008    |0C84EB;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C84E3|B1E0    |0000E0;
                       AND.B #$0F                           ;0C84E5|290F    |      ;
                       BEQ CODE_0C8506                      ;0C84E7|F01D    |0C8506;
                       BNE CODE_0C84EF                      ;0C84E9|D004    |0C84EF;
 
          CODE_0C84EB: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C84EB|B1E0    |0000E0;
                       BEQ CODE_0C8506                      ;0C84ED|F017    |0C8506;
 
          CODE_0C84EF: CMP.B #$04                           ;0C84EF|C904    |      ;
                       BCC CODE_0C84F8                      ;0C84F1|9005    |0C84F8;
                       SEC                                  ;0C84F3|38      |      ;
                       SBC.B #$03                           ;0C84F4|E903    |      ;
                       ORA.B #$10                           ;0C84F6|0910    |      ;
 
          CODE_0C84F8: ORA.B #$40                           ;0C84F8|0940    |      ;
                       STA.W $06AC,X                        ;0C84FA|9DAC06  |0C06AC;
                       LDA.B #$00                           ;0C84FD|A900    |      ;
                       STA.W $06AF,X                        ;0C84FF|9DAF06  |0C06AF;
 
          CODE_0C8502: INY                                  ;0C8502|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C8503|4C0180  |0C8001;
 
 
          CODE_0C8506: LDA.B #$80                           ;0C8506|A980    |      ;
                       STA.W $06AC,X                        ;0C8508|9DAC06  |0C06AC;
                       BNE CODE_0C8502                      ;0C850B|D0F5    |0C8502;
 
          CODE_0C850D: INY                                  ;0C850D|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C850E|B1E0    |0000E0;
                       STA.W $0173,X                        ;0C8510|9D7301  |0C0173;
                       LDA.W $0115,X                        ;0C8513|BD1501  |0C0115;
                       INY                                  ;0C8516|C8      |      ;
                       db $4C                               ;0C8517|        |      ;
 
                       dw CODE_0FE1FA                       ;0C8518|        |0FE1FA;
 
          CODE_0C851A: INY                                  ;0C851A|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C851B|B1E0    |0000E0;
                       STA.W $018E                          ;0C851D|8D8E01  |0C018E;
                       INY                                  ;0C8520|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C8521|4C0180  |0C8001;
 
 
          CODE_0C8524: LDA.W $0131,X                        ;0C8524|BD3101  |0C0131;
                       STA.W $0123,X                        ;0C8527|9D2301  |0C0123;
                       LDA.W $0138,X                        ;0C852A|BD3801  |0C0138;
                       STA.W $012A,X                        ;0C852D|9D2A01  |0C012A;
                       JMP.W CODE_0C8566                    ;0C8530|4C6685  |0C8566;
 
 
          CODE_0C8533: INY                                  ;0C8533|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8534|B1E0    |0000E0;
                       CMP.B #$FF                           ;0C8536|C9FF    |      ;
                       BNE CODE_0C855C                      ;0C8538|D022    |0C855C;
                       INY                                  ;0C853A|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C853B|B1E0    |0000E0;
                       STA.W $0123,X                        ;0C853D|9D2301  |0C0123;
                       STA.B r_SoundBankJumpAddr            ;0C8540|85E2    |0000E2;
                       INY                                  ;0C8542|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8543|B1E0    |0000E0;
                       STA.W $012A,X                        ;0C8545|9D2A01  |0C012A;
                       STA.B $E1                            ;0C8548|85E1    |0000E1;
                       LDA.B r_SoundBankJumpAddr            ;0C854A|A5E2    |0000E2;
                       STA.B r_CurrInstrumentDataAddr       ;0C854C|85E0    |0000E0;
                       LDY.B #$00                           ;0C854E|A000    |      ;
 
          CODE_0C8550: LDA.W $0115,X                        ;0C8550|BD1501  |0C0115;
                       LSR A                                ;0C8553|4A      |      ;
                       BCS DATA8_0C8559                     ;0C8554|B003    |0C8559;
                       JMP.W rocessNextSoundByteAlt         ;0C8556|4C0180  |0C8001;
 
 
         DATA8_0C8559: db $4C                               ;0C8559|        |      ;
 
                       dw CODE_0FE204                       ;0C855A|        |0FE204;
 
          CODE_0C855C: INC.W $011C,X                        ;0C855C|FE1C01  |0C011C;
                       CMP.W $011C,X                        ;0C855F|DD1C01  |0C011C;
                       BEQ CODE_0C8574                      ;0C8562|F010    |0C8574;
                       BCS CODE_0C8524                      ;0C8564|B0BE    |0C8524;
 
          CODE_0C8566: LDY.B #$00                           ;0C8566|A000    |      ;
                       LDA.W $0123,X                        ;0C8568|BD2301  |0C0123;
                       STA.B r_CurrInstrumentDataAddr       ;0C856B|85E0    |0000E0;
                       LDA.W $012A,X                        ;0C856D|BD2A01  |0C012A;
                       STA.B $E1                            ;0C8570|85E1    |0000E1;
                       BNE CODE_0C8550                      ;0C8572|D0DC    |0C8550;
 
          CODE_0C8574: LDA.B #$00                           ;0C8574|A900    |      ;
                       STA.W $011C,X                        ;0C8576|9D1C01  |0C011C;
                       LDA.W $0115,X                        ;0C8579|BD1501  |0C0115;
                       AND.B #$F7                           ;0C857C|29F7    |      ;
                       STA.W $0115,X                        ;0C857E|9D1501  |0C0115;
                       INY                                  ;0C8581|C8      |      ;
                       TYA                                  ;0C8582|98      |      ;
                       CLC                                  ;0C8583|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0C8584|65E0    |0000E0;
                       STA.B r_CurrInstrumentDataAddr       ;0C8586|85E0    |0000E0;
                       LDA.B #$00                           ;0C8588|A900    |      ;
                       TAY                                  ;0C858A|A8      |      ;
                       ADC.B $E1                            ;0C858B|65E1    |0000E1;
                       STA.B $E1                            ;0C858D|85E1    |0000E1;
                       LDA.W $0115,X                        ;0C858F|BD1501  |0C0115;
                       LSR A                                ;0C8592|4A      |      ;
                       BCS CODE_0C8598                      ;0C8593|B003    |0C8598;
                       JMP.W rocessNextSoundByteAlt         ;0C8595|4C0180  |0C8001;
 
 
          CODE_0C8598: LDA.W $0115,X                        ;0C8598|BD1501  |0C0115;
                       AND.B #$FB                           ;0C859B|29FB    |      ;
                       STA.W $0115,X                        ;0C859D|9D1501  |0C0115;
                       db $4C                               ;0C85A0|        |      ;
 
                       dw CODE_0FE204                       ;0C85A1|        |0FE204;
 
          CODE_0C85A3: CMP.B #$0E                           ;0C85A3|C90E    |      ;
                       BEQ CODE_0C8533                      ;0C85A5|F08C    |0C8533;
                       BCC CODE_0C85AC                      ;0C85A7|9003    |0C85AC;
                       JMP.W CODE_0C864E                    ;0C85A9|4C4E86  |0C864E;
 
 
          CODE_0C85AC: CMP.B #$0D                           ;0C85AC|C90D    |      ;
                       BEQ CODE_0C860F                      ;0C85AE|F05F    |0C860F;
                       CMP.B #$0B                           ;0C85B0|C90B    |      ;
                       BEQ CODE_0C85C3                      ;0C85B2|F00F    |0C85C3;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C85B4|B1E0    |0000E0;
                       AND.B #$0F                           ;0C85B6|290F    |      ;
                       STA.W $0169,X                        ;0C85B8|9D6901  |0C0169;
                       CPX.B #$02                           ;0C85BB|E002    |      ;
                       BEQ CODE_0C85DD                      ;0C85BD|F01E    |0C85DD;
                       INY                                  ;0C85BF|C8      |      ;
                       JMP.W rocessNextSoundByteAlt         ;0C85C0|4C0180  |0C8001;
 
 
          CODE_0C85C3: INY                                  ;0C85C3|C8      |      ;
                       TYA                                  ;0C85C4|98      |      ;
                       CLC                                  ;0C85C5|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0C85C6|65E0    |0000E0;
                       STA.W $0131,X                        ;0C85C8|9D3101  |0C0131;
                       LDA.B #$00                           ;0C85CB|A900    |      ;
                       ADC.B $E1                            ;0C85CD|65E1    |0000E1;
                       STA.W $0138,X                        ;0C85CF|9D3801  |0C0138;
                       LDA.W $0115,X                        ;0C85D2|BD1501  |0C0115;
                       ORA.B #$08                           ;0C85D5|0908    |      ;
                       STA.W $0115,X                        ;0C85D7|9D1501  |0C0115;
                       db $4C                               ;0C85DA|        |      ;
 
                       dw CODE_0FE1FA                       ;0C85DB|        |0FE1FA;
 
          CODE_0C85DD: LDA.W $016E,X                        ;0C85DD|BD6E01  |0C016E;
                       ORA.B #$80                           ;0C85E0|0980    |      ;
                       STA.W $016E,X                        ;0C85E2|9D6E01  |0C016E;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C85E5|B1E0    |0000E0;
                       AND.B #$0F                           ;0C85E7|290F    |      ;
                       STA.B r_SoundBankTempVar1            ;0C85E9|85E4    |0000E4;
                       JSR.W CODE_0C829F                    ;0C85EB|209F82  |0C829F;
                       LDA.B r_SoundBankTempVar1            ;0C85EE|A5E4    |0000E4;
                       JSR.W CODE_0C80E5                    ;0C85F0|20E580  |0C80E5;
                       LDA.W $0183,X                        ;0C85F3|BD8301  |0C0183;
                       STA.B r_SoundFrequency               ;0C85F6|85EC    |0000EC;
                       LDA.W $0186,X                        ;0C85F8|BD8601  |0C0186;
                       STA.B $ED                            ;0C85FB|85ED    |0000ED;
                       LSR.B $ED                            ;0C85FD|46ED    |0000ED;
                       ROR.B r_SoundFrequency               ;0C85FF|66EC    |0000EC;
                       JSR.W CODE_0C81FE                    ;0C8601|20FE81  |0C81FE;
                       LDA.W $016E,X                        ;0C8604|BD6E01  |0C016E;
                       AND.B #$7F                           ;0C8607|297F    |      ;
                       STA.W $016E,X                        ;0C8609|9D6E01  |0C016E;
                       JMP.W CODE_0C86D6                    ;0C860C|4CD686  |0C86D6;
 
 
          CODE_0C860F: LDA.W $0115,X                        ;0C860F|BD1501  |0C0115;
                       AND.B #$20                           ;0C8612|2920    |      ;
                       BEQ CODE_0C8619                      ;0C8614|F003    |0C8619;
                       JMP.W CODE_0C8637                    ;0C8616|4C3786  |0C8637;
 
 
          CODE_0C8619: JSR.W CODE_0C86E8                    ;0C8619|20E886  |0C86E8;
                       INY                                  ;0C861C|C8      |      ;
                       TYA                                  ;0C861D|98      |      ;
                       CLC                                  ;0C861E|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0C861F|65E0    |0000E0;
                       STA.W $013F,X                        ;0C8621|9D3F01  |0C013F;
                       LDA.B #$00                           ;0C8624|A900    |      ;
                       TAY                                  ;0C8626|A8      |      ;
                       ADC.B $E1                            ;0C8627|65E1    |0000E1;
                       STA.W $0146,X                        ;0C8629|9D4601  |0C0146;
                       LDA.W $0115,X                        ;0C862C|BD1501  |0C0115;
                       ORA.B #$20                           ;0C862F|0920    |      ;
                       STA.W $0115,X                        ;0C8631|9D1501  |0C0115;
                       JMP.W CODE_0C8566                    ;0C8634|4C6685  |0C8566;
 
 
          CODE_0C8637: LDA.W $013F,X                        ;0C8637|BD3F01  |0C013F;
                       STA.B r_CurrInstrumentDataAddr       ;0C863A|85E0    |0000E0;
                       LDA.W $0146,X                        ;0C863C|BD4601  |0C0146;
                       STA.B $E1                            ;0C863F|85E1    |0000E1;
                       LDA.W $0115,X                        ;0C8641|BD1501  |0C0115;
                       AND.B #$DF                           ;0C8644|29DF    |      ;
                       STA.W $0115,X                        ;0C8646|9D1501  |0C0115;
                       LDY.B #$00                           ;0C8649|A000    |      ;
                       db $4C                               ;0C864B|        |      ;
 
                       dw CODE_0FE1FA                       ;0C864C|        |0FE1FA;
 
          CODE_0C864E: LDA.W $0107,X                        ;0C864E|BD0701  |0C0107;
                       STA.B r_SoundBankTempVar1            ;0C8651|85E4    |0000E4;
                       LDA.B #$00                           ;0C8653|A900    |      ;
                       STA.W $0107,X                        ;0C8655|9D0701  |0C0107;
                       TXA                                  ;0C8658|8A      |      ;
                       ASL A                                ;0C8659|0A      |      ;
                       TAX                                  ;0C865A|AA      |      ;
                       LDA.W silenceFuncs,X                 ;0C865B|BDF586  |0C86F5;
                       STA.B r_SoundBankJumpAddr            ;0C865E|85E2    |0000E2;
                       LDA.W PTR16_0C86F6,X                 ;0C8660|BDF686  |0C86F6;
                       STA.B $E3                            ;0C8663|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;0C8665|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;0C8667|6CE200  |0000E2;
 
 
          CODE_0C866A: LDA.B #$30                           ;0C866A|A930    |      ;
                       JSR.W CODE_0C8313                    ;0C866C|201383  |0C8313;
                       BCS CODE_0C8677                      ;0C866F|B006    |0C8677;
                       STA.W $4000,X                        ;0C8671|9D0040  |0C4000;
                       JSR.W b18_waitAFewCycles2            ;0C8674|205387  |0C8753;
 
          CODE_0C8677: LDX.B r_CurrInstrumentIdx            ;0C8677|A6EE    |0000EE;
                       db $4C                               ;0C8679|        |      ;
 
                       dw CODE_0FE1A6                       ;0C867A|        |0FE1A6;
 
          CODE_0C867C: LDA.B #$00                           ;0C867C|A900    |      ;
                       STA.W $4008                          ;0C867E|8D0840  |0C4008;
                       db $4C                               ;0C8681|        |      ;
 
                       dw CODE_0FE1A6                       ;0C8682|        |0FE1A6;
 
          CODE_0C8684: LDX.W $018C                          ;0C8684|AE8C01  |0C018C;
                       LDA.B #$30                           ;0C8687|A930    |      ;
                       STA.W $4000,X                        ;0C8689|9D0040  |0C4000;
                       JSR.W b18_waitAFewCycles2            ;0C868C|205387  |0C8753;
                       LDA.B #$7F                           ;0C868F|A97F    |      ;
                       STA.W $4001,X                        ;0C8691|9D0140  |0C4001;
                       JSR.W b18_waitAFewCycles2            ;0C8694|205387  |0C8753;
                       LDX.B r_CurrInstrumentIdx            ;0C8697|A6EE    |0000EE;
                       LDA.W $0115,X                        ;0C8699|BD1501  |0C0115;
                       AND.B #$F9                           ;0C869C|29F9    |      ;
                       STA.W $0115,X                        ;0C869E|9D1501  |0C0115;
                       LDA.B #$00                           ;0C86A1|A900    |      ;
                       STA.W $0173,X                        ;0C86A3|9D7301  |0C0173;
                       LDA.W $0104,X                        ;0C86A6|BD0401  |0C0104;
                       BEQ CODE_0C86B6                      ;0C86A9|F00B    |0C86B6;
                       LDX.B r_CurrInstrumentIdx            ;0C86AB|A6EE    |0000EE;
                       DEX                                  ;0C86AD|CA      |      ;
                       DEX                                  ;0C86AE|CA      |      ;
                       DEX                                  ;0C86AF|CA      |      ;
                       LDY.W $018C                          ;0C86B0|AC8C01  |0C018C;
                       db $20                               ;0C86B3|        |      ;
                       dw CODE_0FE20C                       ;0C86B4|        |0FE20C;
 
          CODE_0C86B6: LDX.B r_CurrInstrumentIdx            ;0C86B6|A6EE    |0000EE;
                       db $4C                               ;0C86B8|        |      ;
 
                       dw CODE_0FE1A6                       ;0C86B9|        |0FE1A6;
 
          CODE_0C86BB: LDA.B #$30                           ;0C86BB|A930    |      ;
                       STA.W $400C                          ;0C86BD|8D0C40  |0C400C;
                       JSR.W b18_waitAFewCycles2            ;0C86C0|205387  |0C8753;
                       db $4C                               ;0C86C3|        |      ;
 
                       dw CODE_0FE1A6                       ;0C86C4|        |0FE1A6;
 
    processInstrument: INY                                  ;0C86C6|C8      |      ;
                       TYA                                  ;0C86C7|98      |      ;
                       CLC                                  ;0C86C8|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0C86C9|65E0    |0000E0;
                       STA.W $0123,X                        ;0C86CB|9D2301  |0C0123;
                       LDA.B #$00                           ;0C86CE|A900    |      ;
                       ADC.B $E1                            ;0C86D0|65E1    |0000E1;
                       STA.W $012A,X                        ;0C86D2|9D2A01  |0C012A;
                       RTS                                  ;0C86D5|60      |      ;
 
 
          CODE_0C86D6: INY                                  ;0C86D6|C8      |      ;
                       TYA                                  ;0C86D7|98      |      ;
                       CLC                                  ;0C86D8|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0C86D9|65E0    |0000E0;
                       STA.W $0123,X                        ;0C86DB|9D2301  |0C0123;
                       LDA.B #$00                           ;0C86DE|A900    |      ;
                       ADC.B $E1                            ;0C86E0|65E1    |0000E1;
                       STA.W $012A,X                        ;0C86E2|9D2A01  |0C012A;
                       db $4C                               ;0C86E5|        |      ;
 
                       dw CODE_0FE1A6                       ;0C86E6|        |0FE1A6;
 
          CODE_0C86E8: INY                                  ;0C86E8|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C86E9|B1E0    |0000E0;
                       STA.W $0123,X                        ;0C86EB|9D2301  |0C0123;
                       INY                                  ;0C86EE|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C86EF|B1E0    |0000E0;
                       STA.W $012A,X                        ;0C86F1|9D2A01  |0C012A;
                       RTS                                  ;0C86F4|60      |      ;
 
 
         silenceFuncs: dw CODE_0C866A                       ;0C86F5|        |0C866A;
                       dw CODE_0C866A                       ;0C86F7|        |0C866A;
                       dw CODE_0C867C                       ;0C86F9|        |0C867C;
                       dw CODE_0C8684                       ;0C86FB|        |0C8684;
                       dw CODE_0C8684                       ;0C86FD|        |0C8684;
                       dw CODE_0C86BB                       ;0C86FF|        |0C86BB;
                       dw CODE_0C866A                       ;0C8701|        |0C866A;
 
controlSoundByteFuncs: dw CODE_0C833A                       ;0C8703|        |0C833A;
                       dw CODE_0C8363                       ;0C8705|        |0C8363;
                       dw CODE_0C83A7                       ;0C8707|        |0C83A7;
                       dw CODE_0C85A3                       ;0C8709|        |0C85A3;
 
        DATA16_0C870B: dw $0D5C,$0C9C,$0BE8,$0B3C           ;0C870B|        |      ;
                       dw $0A9C,$0A02,$0972,$08EC           ;0C8713|        |      ;
                       dw $086C,$07F2,$0780,$0714           ;0C871B|        |      ;
 
        DATA16_0C8723: dw $06AE,$064E,$05F4,$059E           ;0C8723|        |      ;
                       dw $054E,$0501,$04B9,$0476           ;0C872B|        |      ;
                       dw $0436,$03F9,$03C0,$038A           ;0C8733|        |      ;
                       dw $0357,$0327,$02FA,$02CF           ;0C873B|        |      ;
                       dw $02A7,$0281,$025D,$023B           ;0C8743|        |      ;
                       dw $021B,$01FD,$01E0,$01C5           ;0C874B|        |      ;
 
  b18_waitAFewCycles2: NOP                                  ;0C8753|EA      |      ;
                       NOP                                  ;0C8754|EA      |      ;
                       NOP                                  ;0C8755|EA      |      ;
                       NOP                                  ;0C8756|EA      |      ;
                       NOP                                  ;0C8757|EA      |      ;
                       NOP                                  ;0C8758|EA      |      ;
                       NOP                                  ;0C8759|EA      |      ;
                       NOP                                  ;0C875A|EA      |      ;
                       NOP                                  ;0C875B|EA      |      ;
                       NOP                                  ;0C875C|EA      |      ;
                       RTS                                  ;0C875D|60      |      ;
 
 
         clearInitSnd: LDA.B #$00                           ;0C875E|A900    |      ; start Sound Engine
                       STX.B r_SoundBankJumpAddr            ;0C8760|86E2    |0000E2;
                       TAX                                  ;0C8762|AA      |      ;
 
          CODE_0C8763: STA.W $0107,X                        ;0C8763|9D0701  |0C0107;
                       INX                                  ;0C8766|E8      |      ;
                       CPX.B #$03                           ;0C8767|E003    |      ;
                       BCC CODE_0C8763                      ;0C8769|90F8    |0C8763;
                       LDA.W $0107,X                        ;0C876B|BD0701  |0C0107;
                       CMP.B #$4B                           ;0C876E|C94B    |      ;
                       BEQ CODE_0C8777                      ;0C8770|F005    |0C8777;
                       LDA.B #$00                           ;0C8772|A900    |      ;
                       STA.W $0107,X                        ;0C8774|9D0701  |0C0107;
 
          CODE_0C8777: LDA.B #$00                           ;0C8777|A900    |      ;
                       INX                                  ;0C8779|E8      |      ;
 
          CODE_0C877A: STA.W $0107,X                        ;0C877A|9D0701  |0C0107;
                       INX                                  ;0C877D|E8      |      ;
                       CPX.B #$07                           ;0C877E|E007    |      ;
                       BCC CODE_0C877A                      ;0C8780|90F8    |0C877A;
                       STA.W $0159                          ;0C8782|8D5901  |0C0159;
                       STA.W $0160                          ;0C8785|8D6001  |0C0160;
                       STA.W $0152                          ;0C8788|8D5201  |0C0152;
                       STA.B r_SoundDataBank                ;0C878B|85EB    |0000EB;
                       STA.W $06C9                          ;0C878D|8DC906  |0C06C9;
                       STA.W $018F                          ;0C8790|8D8F01  |0C018F;
                       STA.W $018E                          ;0C8793|8D8E01  |0C018E;
                       STA.W $018D                          ;0C8796|8D8D01  |0C018D;
                       STA.W $06C8                          ;0C8799|8DC806  |0C06C8;
                       LDX.B r_SoundBankJumpAddr            ;0C879C|A6E2    |0000E2;
 
          CODE_0C879E: LDA.B #$0B                           ;0C879E|A90B    |      ;
                       STA.W $4015                          ;0C87A0|8D1540  |0C4015;
                       JSR.W CODE_0C8F23                    ;0C87A3|20238F  |0C8F23;
                       LDA.W $010A                          ;0C87A6|AD0A01  |0C010A;
                       CMP.B #$4B                           ;0C87A9|C94B    |      ;
                       BEQ CODE_0C87BD                      ;0C87AB|F010    |0C87BD;
                       LDA.B #$7F                           ;0C87AD|A97F    |      ;
                       STA.W $4001                          ;0C87AF|8D0140  |0C4001;
                       JSR.W CODE_0C8F23                    ;0C87B2|20238F  |0C8F23;
                       LDA.B #$30                           ;0C87B5|A930    |      ;
                       STA.W $4000                          ;0C87B7|8D0040  |0C4000;
                       JSR.W CODE_0C8F23                    ;0C87BA|20238F  |0C8F23;
 
          CODE_0C87BD: LDA.B #$30                           ;0C87BD|A930    |      ;
                       STA.W $4008                          ;0C87BF|8D0840  |0C4008;
                       JSR.W CODE_0C8F23                    ;0C87C2|20238F  |0C8F23;
                       STA.W $4004                          ;0C87C5|8D0440  |0C4004;
                       JSR.W CODE_0C8F23                    ;0C87C8|20238F  |0C8F23;
                       STA.W $400C                          ;0C87CB|8D0C40  |0C400C;
                       JSR.W CODE_0C8F23                    ;0C87CE|20238F  |0C8F23;
                       LDA.B #$7F                           ;0C87D1|A97F    |      ;
                       STA.W $4005                          ;0C87D3|8D0540  |0C4005;
                       JSR.W CODE_0C8F23                    ;0C87D6|20238F  |0C8F23;
                       LDA.B #$0F                           ;0C87D9|A90F    |      ;
                       STA.W $4015                          ;0C87DB|8D1540  |0C4015;
                       JSR.W CODE_0C8F23                    ;0C87DE|20238F  |0C8F23;
                       RTS                                  ;0C87E1|60      |      ;
 
 
    moreSoundSettings: LDA.B #$0B                           ;0C87E2|A90B    |      ;
                       STA.W $4015                          ;0C87E4|8D1540  |0C4015;
                       JSR.W CODE_0C8F23                    ;0C87E7|20238F  |0C8F23;
                       LDA.B #$30                           ;0C87EA|A930    |      ;
                       STA.W $4008                          ;0C87EC|8D0840  |0C4008;
                       JSR.W CODE_0C8F23                    ;0C87EF|20238F  |0C8F23;
                       STA.W $4000                          ;0C87F2|8D0040  |0C4000;
                       JSR.W CODE_0C8F23                    ;0C87F5|20238F  |0C8F23;
                       STA.W $4004                          ;0C87F8|8D0440  |0C4004;
                       JSR.W CODE_0C8F23                    ;0C87FB|20238F  |0C8F23;
                       STA.W $400C                          ;0C87FE|8D0C40  |0C400C;
                       JSR.W CODE_0C8F23                    ;0C8801|20238F  |0C8F23;
                       LDA.B #$0F                           ;0C8804|A90F    |      ;
                       STA.W $4015                          ;0C8806|8D1540  |0C4015;
                       JSR.W CODE_0C8F23                    ;0C8809|20238F  |0C8F23;
                       RTS                                  ;0C880C|60      |      ;
 
 
          CODE_0C880D: LDA.W $0107                          ;0C880D|AD0701  |0C0107;
                       CMP.B #$4E                           ;0C8810|C94E    |      ;
                       BNE CODE_0C8847                      ;0C8812|D033    |0C8847;
                       LDA.B r_SoundToPlay                  ;0C8814|A5EF    |0000EF;
                       CMP.B #$06                           ;0C8816|C906    |      ;
                       BCC CODE_0C8847                      ;0C8818|902D    |0C8847;
                       RTS                                  ;0C881A|60      |      ;
 
 
          CODE_0C881B: LDA.W $0107,X                        ;0C881B|BD0701  |0C0107;
                       CMP.B #$2D                           ;0C881E|C92D    |      ;
                       BEQ CODE_0C8879                      ;0C8820|F057    |0C8879;
                       CMP.B #$16                           ;0C8822|C916    |      ;
                       BEQ CODE_0C8879                      ;0C8824|F053    |0C8879;
                       JMP.W CODE_0C8872                    ;0C8826|4C7288  |0C8872;
 
 
          CODE_0C8829: LDA.W $0107,X                        ;0C8829|BD0701  |0C0107;
                       CMP.B #$27                           ;0C882C|C927    |      ;
                       BEQ CODE_0C887E                      ;0C882E|F04E    |0C887E;
                       CMP.B #$33                           ;0C8830|C933    |      ;
                       BEQ CODE_0C887E                      ;0C8832|F04A    |0C887E;
                       JMP.W CODE_0C8872                    ;0C8834|4C7288  |0C8872;
 
 
              playSnd: STA.B r_SoundToPlay                  ;0C8837|85EF    |0000EF; plays sfx or music accumulator holds ID
                       CMP.B #$6D                           ;0C8839|C96D    |      ;
                       BCC CODE_0C8840                      ;0C883B|9003    |0C8840;
                       JMP.W CODE_0C88F9                    ;0C883D|4CF988  |0C88F9;
 
 
          CODE_0C8840: CMP.B #$4E                           ;0C8840|C94E    |      ;
                       BCC CODE_0C880D                      ;0C8842|90C9    |0C880D;
                       JSR.W clearInitSnd                   ;0C8844|205E87  |0C875E;
 
          CODE_0C8847: STX.B r_SoundBankTempVar1            ;0C8847|86E4    |0000E4;
                       STY.B r_SoundBankTempVar2            ;0C8849|84E5    |0000E5;
                       LDA.B r_SoundToPlay                  ;0C884B|A5EF    |0000EF;
                       ASL A                                ;0C884D|0A      |      ;
                       TAY                                  ;0C884E|A8      |      ;
                       LDA.W CODE_0C8F2C,Y                  ;0C884F|B92C8F  |0C8F2C; mainSoundTable-2
                       STA.B r_SoundMetadataAddr            ;0C8852|85E8    |0000E8;
                       LDA.W CODE_0C8F2D,Y                  ;0C8854|B92D8F  |0C8F2D; mainSoundTable-1
                       STA.B $E9                            ;0C8857|85E9    |0000E9;
                       LDY.B #$00                           ;0C8859|A000    |      ;
                       LDA.B (r_SoundMetadataAddr),Y        ;0C885B|B1E8    |0000E8;
                       STA.B r_SoundDataBank                ;0C885D|85EB    |0000EB;
                       INY                                  ;0C885F|C8      |      ;
                       LDA.B (r_SoundMetadataAddr),Y        ;0C8860|B1E8    |0000E8;
                       STA.B r_SoundNumInstrumentsMinus1    ;0C8862|85EA    |0000EA;
 
          CODE_0C8864: INY                                  ;0C8864|C8      |      ;
                       LDA.B (r_SoundMetadataAddr),Y        ;0C8865|B1E8    |0000E8;
                       TAX                                  ;0C8867|AA      |      ;
                       LDA.B r_SoundToPlay                  ;0C8868|A5EF    |0000EF;
                       CMP.B #$33                           ;0C886A|C933    |      ;
                       BEQ CODE_0C881B                      ;0C886C|F0AD    |0C881B;
                       CMP.B #$16                           ;0C886E|C916    |      ;
                       BEQ CODE_0C8829                      ;0C8870|F0B7    |0C8829;
 
          CODE_0C8872: LDA.B r_SoundToPlay                  ;0C8872|A5EF    |0000EF;
                       CMP.W $0107,X                        ;0C8874|DD0701  |0C0107;
                       BCS CODE_0C887E                      ;0C8877|B005    |0C887E;
 
          CODE_0C8879: INY                                  ;0C8879|C8      |      ;
                       INY                                  ;0C887A|C8      |      ;
                       JMP.W CODE_0C88ED                    ;0C887B|4CED88  |0C88ED;
 
 
          CODE_0C887E: INY                                  ;0C887E|C8      |      ;
                       LDA.B (r_SoundMetadataAddr),Y        ;0C887F|B1E8    |0000E8;
                       STA.W $0123,X                        ;0C8881|9D2301  |0C0123;
                       STA.B r_TempCurrInstrumentDataAddr   ;0C8884|85E6    |0000E6;
                       INY                                  ;0C8886|C8      |      ;
                       LDA.B (r_SoundMetadataAddr),Y        ;0C8887|B1E8    |0000E8;
                       STA.W $012A,X                        ;0C8889|9D2A01  |0C012A;
                       STA.B $E7                            ;0C888C|85E7    |0000E7;
                       LDA.B #$00                           ;0C888E|A900    |      ;
                       STA.W $011C,X                        ;0C8890|9D1C01  |0C011C;
                       LDA.B #$01                           ;0C8893|A901    |      ;
                       STA.W $0100,X                        ;0C8895|9D0001  |0C0100;
                       CPX.B #$05                           ;0C8898|E005    |      ;
                       BEQ CODE_0C88C8                      ;0C889A|F02C    |0C88C8;
                       LDA.B #$F8                           ;0C889C|A9F8    |      ;
                       STA.W $014D,X                        ;0C889E|9D4D01  |0C014D;
                       CPX.B #$06                           ;0C88A1|E006    |      ;
                       BEQ CODE_0C88C8                      ;0C88A3|F023    |0C88C8;
                       LDA.B #$00                           ;0C88A5|A900    |      ;
                       STA.W $016E,X                        ;0C88A7|9D6E01  |0C016E;
                       STA.W $0169,X                        ;0C88AA|9D6901  |0C0169;
                       STA.W $0173,X                        ;0C88AD|9D7301  |0C0173;
                       CPX.B #$03                           ;0C88B0|E003    |      ;
                       BEQ CODE_0C88C8                      ;0C88B2|F014    |0C88C8;
                       CPX.B #$04                           ;0C88B4|E004    |      ;
                       BEQ CODE_0C88C8                      ;0C88B6|F010    |0C88C8;
                       STA.W $0180,X                        ;0C88B8|9D8001  |0C0180;
                       STA.W $03D8,X                        ;0C88BB|9DD803  |0C03D8;
                       LDA.B #$01                           ;0C88BE|A901    |      ;
                       STA.W $03DE,X                        ;0C88C0|9DDE03  |0C03DE;
                       LDA.B #$80                           ;0C88C3|A980    |      ;
                       STA.W $06AC,X                        ;0C88C5|9DAC06  |0C06AC;
 
          CODE_0C88C8: LDA.B r_SoundDataBank                ;0C88C8|A5EB    |0000EB;
                       STA.W $0195,X                        ;0C88CA|9D9501  |0C0195;
                       STY.B r_SoundBankJumpAddr            ;0C88CD|84E2    |0000E2;
                       LDY.B #$00                           ;0C88CF|A000    |      ;
                       db $20                               ;0C88D1|        |      ;
                       dw music_bankSwap_00                 ;0C88D2|        |0FE1B5;
                       INY                                  ;0C88D4|C8      |      ;
                       CMP.B #$10                           ;0C88D5|C910    |      ;
                       BCC CODE_0C88E2                      ;0C88D7|9009    |0C88E2;
                       CPX.B #$03                           ;0C88D9|E003    |      ;
                       BEQ CODE_0C88E2                      ;0C88DB|F005    |0C88E2;
                       CPX.B #$04                           ;0C88DD|E004    |      ;
 
                       BEQ CODE_0C88E2                      ;0C88DF|F001    |0C88E2;
                       DEY                                  ;0C88E1|88      |      ;
 
          CODE_0C88E2: TYA                                  ;0C88E2|98      |      ;
                       STA.W $0115,X                        ;0C88E3|9D1501  |0C0115;
                       LDY.B r_SoundBankJumpAddr            ;0C88E6|A4E2    |0000E2;
                       LDA.B r_SoundToPlay                  ;0C88E8|A5EF    |0000EF;
                       STA.W $0107,X                        ;0C88EA|9D0701  |0C0107;
 
          CODE_0C88ED: DEC.B r_SoundNumInstrumentsMinus1    ;0C88ED|C6EA    |0000EA;
                       BMI CODE_0C88F4                      ;0C88EF|3003    |0C88F4;
                       JMP.W CODE_0C8864                    ;0C88F1|4C6488  |0C8864;
 
 
          CODE_0C88F4: LDX.B r_SoundBankTempVar1            ;0C88F4|A6E4    |0000E4;
                       LDY.B r_SoundBankTempVar2            ;0C88F6|A4E5    |0000E5;
                       RTS                                  ;0C88F8|60      |      ;
 
 
          CODE_0C88F9: SEC                                  ;0C88F9|38      |      ;
                       SBC.B #$6D                           ;0C88FA|E96D    |      ;
                       STA.B r_SoundToPlay                  ;0C88FC|85EF    |0000EF;
                       CMP.B #$0D                           ;0C88FE|C90D    |      ;
                       BCC CODE_0C8905                      ;0C8900|9003    |0C8905;
                       INC.W $06C8                          ;0C8902|EEC806  |0C06C8;
 
          CODE_0C8905: LDA.W $0192                          ;0C8905|AD9201  |0C0192;
                       CMP.B #$05                           ;0C8908|C905    |      ;
                       BCC CODE_0C8914                      ;0C890A|9008    |0C8914;
                       LDA.B r_SoundToPlay                  ;0C890C|A5EF    |0000EF;
                       CMP.W $0192                          ;0C890E|CD9201  |0C0192;
                       BCS CODE_0C8916                      ;0C8911|B003    |0C8916;
                       RTS                                  ;0C8913|60      |      ;
 
 
          CODE_0C8914: LDA.B r_SoundToPlay                  ;0C8914|A5EF    |0000EF;
 
          CODE_0C8916: STA.W $0192                          ;0C8916|8D9201  |0C0192;
                       STY.B r_SoundBankJumpAddr            ;0C8919|84E2    |0000E2;
                       LDA.B r_SoundToPlay                  ;0C891B|A5EF    |0000EF;
                       ASL A                                ;0C891D|0A      |      ;
                       ASL A                                ;0C891E|0A      |      ;
                       TAY                                  ;0C891F|A8      |      ;
                       LDA.W DPCM_DMC_Count_6D,Y            ;0C8920|B951A1  |0CA151;
                       LDA.B #$0F                           ;0C8923|A90F    |      ;
                       STA.W $4015                          ;0C8925|8D1540  |0C4015;
                       LDA.W DPCM_DMC_Freq_6D,Y             ;0C8928|B950A1  |0CA150;
                       STA.W $4010                          ;0C892B|8D1040  |0C4010;
                       LDA.W DPCM_DMC_Count_6D,Y            ;0C892E|B951A1  |0CA151;
                       STA.W $4011                          ;0C8931|8D1140  |0C4011;
                       LDA.W DPCM_DMC_Adress_6D,Y           ;0C8934|B952A1  |0CA152;
                       STA.W $4012                          ;0C8937|8D1240  |0C4012;
                       LDA.W DPCM_DMC_Leangth_6D,Y          ;0C893A|B953A1  |0CA153;
                       STA.W $4013                          ;0C893D|8D1340  |0C4013;
                       LDA.B #$1F                           ;0C8940|A91F    |      ;
                       STA.W $4015                          ;0C8942|8D1540  |0C4015;
                       LDY.B r_SoundBankJumpAddr            ;0C8945|A4E2    |0000E2;
                       LDA.B r_SoundToPlay                  ;0C8947|A5EF    |0000EF;
                       CMP.B #$03                           ;0C8949|C903    |      ;
                       BEQ CODE_0C894E                      ;0C894B|F001    |0C894E;
                       RTS                                  ;0C894D|60      |      ;
 
 
          CODE_0C894E: LDA.B #$01                           ;0C894E|A901    |      ;
                       JMP.W playSnd                        ;0C8950|4C3788  |0C8837;
 
 
          CODE_0C8953: STA.W $0167                          ;0C8953|8D6701  |0C0167;
                       CMP.B #$00                           ;0C8956|C900    |      ;
                       BEQ CODE_0C895D                      ;0C8958|F003    |0C895D;
                       JMP.W CODE_0C879E                    ;0C895A|4C9E87  |0C879E;
 
 
          CODE_0C895D: LDA.W $010A                          ;0C895D|AD0A01  |0C010A;
                       BEQ CODE_0C8963                      ;0C8960|F001    |0C8963;
                       RTS                                  ;0C8962|60      |      ;
 
 
          CODE_0C8963: LDA.W $0107                          ;0C8963|AD0701  |0C0107;
                       BEQ CODE_0C896F                      ;0C8966|F007    |0C896F;
                       LDX.B #$00                           ;0C8968|A200    |      ;
                       LDY.B #$00                           ;0C896A|A000    |      ;
                       JSR.W CODE_0C8986                    ;0C896C|208689  |0C8986;
 
          CODE_0C896F: LDA.W $0108                          ;0C896F|AD0801  |0C0108;
                       BEQ CODE_0C897B                      ;0C8972|F007    |0C897B;
                       LDX.B #$01                           ;0C8974|A201    |      ;
                       LDY.B #$04                           ;0C8976|A004    |      ;
                       JSR.W CODE_0C8986                    ;0C8978|208689  |0C8986;
 
          CODE_0C897B: RTS                                  ;0C897B|60      |      ;
 
 
          CODE_0C897C: LDA.B #$30                           ;0C897C|A930    |      ;
                       STA.W $4000,X                        ;0C897E|9D0040  |0C4000;
                       JSR.W CODE_0C8F23                    ;0C8981|20238F  |0C8F23;
                       BNE CODE_0C899D                      ;0C8984|D017    |0C899D;
 
          CODE_0C8986: LDA.W $0115,X                        ;0C8986|BD1501  |0C0115;
                       AND.B #$41                           ;0C8989|2941    |      ;
                       ORA.W $0167                          ;0C898B|0D6701  |0C0167;
                       ORA.W $06C9                          ;0C898E|0DC906  |0C06C9;
                       BNE CODE_0C897C                      ;0C8991|D0E9    |0C897C;
                       LDA.W $0154,X                        ;0C8993|BD5401  |0C0154;
                       STX.B $E3                            ;0C8996|86E3    |0000E3;
                       JSR.W CODE_0C8B94                    ;0C8998|20948B  |0C8B94;
                       LDX.B $E3                            ;0C899B|A6E3    |0000E3;
 
          CODE_0C899D: LDA.W $0178,X                        ;0C899D|BD7801  |0C0178;
                       STA.W $4002,Y                        ;0C89A0|990240  |0C4002;
                       JSR.W CODE_0C8F23                    ;0C89A3|20238F  |0C8F23;
                       LDA.W $014D,X                        ;0C89A6|BD4D01  |0C014D;
                       ORA.B #$08                           ;0C89A9|0908    |      ;
                       STA.W $4003,Y                        ;0C89AB|990340  |0C4003;
                       JMP.W CODE_0C8F23                    ;0C89AE|4C238F  |0C8F23;
 
 
          CODE_0C89B1: CMP.B #$01                           ;0C89B1|C901    |      ;
                       BNE CODE_0C89B8                      ;0C89B3|D003    |0C89B8;
                       JMP.W clearInitSnd                   ;0C89B5|4C5E87  |0C875E;
 
 
          CODE_0C89B8: CMP.B #$02                           ;0C89B8|C902    |      ;
                       BNE CODE_0C89C8                      ;0C89BA|D00C    |0C89C8;
                       LDA.W $0159                          ;0C89BC|AD5901  |0C0159;
                       CMP.B #$07                           ;0C89BF|C907    |      ;
                       BNE CODE_0C89C8                      ;0C89C1|D005    |0C89C8;
                       LDA.B #$00                           ;0C89C3|A900    |      ;
                       STA.W $010C                          ;0C89C5|8D0C01  |0C010C;
 
          CODE_0C89C8: INC.W $0159                          ;0C89C8|EE5901  |0C0159;
                       LDA.B #$20                           ;0C89CB|A920    |      ;
                       CMP.W $0159                          ;0C89CD|CD5901  |0C0159;
                       BNE CODE_0C89DD                      ;0C89D0|D00B    |0C89DD;
                       LDA.B #$00                           ;0C89D2|A900    |      ;
                       STA.W $0159                          ;0C89D4|8D5901  |0C0159;
                       INC.W $0152                          ;0C89D7|EE5201  |0C0152;
                       DEC.W $0160                          ;0C89DA|CE6001  |0C0160;
 
          CODE_0C89DD: RTS                                  ;0C89DD|60      |      ;
 
 
          CODE_0C89DE: LDA.W $018E                          ;0C89DE|AD8E01  |0C018E;
                       BEQ CODE_0C89FA                      ;0C89E1|F017    |0C89FA;
                       INC.W $018D                          ;0C89E3|EE8D01  |0C018D;
                       LDA.W $018D                          ;0C89E6|AD8D01  |0C018D;
                       CMP.W $018E                          ;0C89E9|CD8E01  |0C018E;
                       BNE CODE_0C89FA                      ;0C89EC|D00C    |0C89FA;
                       LDA.B #$00                           ;0C89EE|A900    |      ;
                       STA.W $018D                          ;0C89F0|8D8D01  |0C018D;
                       LDA.B #$01                           ;0C89F3|A901    |      ;
                       STA.W $018F                          ;0C89F5|8D8F01  |0C018F;
                       BNE CODE_0C89FF                      ;0C89F8|D005    |0C89FF;
 
          CODE_0C89FA: LDA.B #$00                           ;0C89FA|A900    |      ;
                       STA.W $018F                          ;0C89FC|8D8F01  |0C018F;
 
          CODE_0C89FF: LDA.W $06C8                          ;0C89FF|ADC806  |0C06C8;
                       BEQ CODE_0C8A1B                      ;0C8A02|F017    |0C8A1B;
                       INC.W $06C8                          ;0C8A04|EEC806  |0C06C8;
                       LDA.W $06C8                          ;0C8A07|ADC806  |0C06C8;
                       CMP.B #$F0                           ;0C8A0A|C9F0    |      ;
                       BNE CODE_0C8A1B                      ;0C8A0C|D00D    |0C8A1B;
                       LDA.B #$0F                           ;0C8A0E|A90F    |      ;
                       STA.W $4015                          ;0C8A10|8D1540  |0C4015;
                       JSR.W CODE_0C8F23                    ;0C8A13|20238F  |0C8F23;
                       LDA.B #$00                           ;0C8A16|A900    |      ;
                       STA.W $06C8                          ;0C8A18|8DC806  |0C06C8;
 
          CODE_0C8A1B: LDA.B r_pauseFlag                    ;0C8A1B|A52B    |00002B;
                       CMP.W $0167                          ;0C8A1D|CD6701  |0C0167;
                       BEQ CODE_0C8A25                      ;0C8A20|F003    |0C8A25;
                       JSR.W CODE_0C8953                    ;0C8A22|205389  |0C8953;
 
          CODE_0C8A25: LDA.W $0160                          ;0C8A25|AD6001  |0C0160;
                       BEQ CODE_0C8A2D                      ;0C8A28|F003    |0C8A2D;
                       JSR.W CODE_0C89B1                    ;0C8A2A|20B189  |0C89B1;
 
          CODE_0C8A2D: LDA.W $4015                          ;0C8A2D|AD1540  |0C4015;
                       AND.B #$10                           ;0C8A30|2910    |      ;
                       BNE CODE_0C8A39                      ;0C8A32|D005    |0C8A39;
                       LDA.B #$00                           ;0C8A34|A900    |      ;
                       STA.W $0192                          ;0C8A36|8D9201  |0C0192;
 
          CODE_0C8A39: LDX.B #$00                           ;0C8A39|A200    |      ;
                       LDY.B #$00                           ;0C8A3B|A000    |      ;
 
          CODE_0C8A3D: STX.B r_CurrInstrumentIdx            ;0C8A3D|86EE    |0000EE;
                       STY.W $018C                          ;0C8A3F|8C8C01  |0C018C;
                       LDA.W $0107,X                        ;0C8A42|BD0701  |0C0107;
                       BEQ CODE_0C8A4A                      ;0C8A45|F003    |0C8A4A;
                       JSR.W CODE_0C8A5E                    ;0C8A47|205E8A  |0C8A5E;
 
          CODE_0C8A4A: INX                                  ;0C8A4A|E8      |      ;
                       CPX.B #$07                           ;0C8A4B|E007    |      ;
                       BEQ CODE_0C8A56                      ;0C8A4D|F007    |0C8A56;
                       LDA.W DATA8_0C8A57,X                 ;0C8A4F|BD578A  |0C8A57;
                       TAY                                  ;0C8A52|A8      |      ;
                       JMP.W CODE_0C8A3D                    ;0C8A53|4C3D8A  |0C8A3D;
 
 
          CODE_0C8A56: RTS                                  ;0C8A56|60      |      ;
 
 
         DATA8_0C8A57: db $00,$04,$08,$00,$04,$0C,$0C       ;0C8A57|        |      ;
 
          CODE_0C8A5E: LDA.W $0167                          ;0C8A5E|AD6701  |0C0167;
                       BEQ CODE_0C8A6B                      ;0C8A61|F008    |0C8A6B;
                       LDA.W $0107,X                        ;0C8A63|BD0701  |0C0107;
                       CMP.B #$4D                           ;0C8A66|C94D    |      ;
                       BEQ CODE_0C8A76                      ;0C8A68|F00C    |0C8A76;
                       RTS                                  ;0C8A6A|60      |      ;
 
 
          CODE_0C8A6B: LDA.W $06C9                          ;0C8A6B|ADC906  |0C06C9;
                       BEQ CODE_0C8A76                      ;0C8A6E|F006    |0C8A76;
                       LDA.W $0115,X                        ;0C8A70|BD1501  |0C0115;
                       LSR A                                ;0C8A73|4A      |      ;
                       BCC CODE_0C8A56                      ;0C8A74|90E0    |0C8A56;
 
          CODE_0C8A76: CPX.B #$06                           ;0C8A76|E006    |      ;
                       BEQ CODE_0C8A9D                      ;0C8A78|F023    |0C8A9D;
                       LDA.W $0115,X                        ;0C8A7A|BD1501  |0C0115;
                       LSR A                                ;0C8A7D|4A      |      ;
                       BCS CODE_0C8A86                      ;0C8A7E|B006    |0C8A86;
 
          CODE_0C8A80: LDA.W $018F                          ;0C8A80|AD8F01  |0C018F;
                       BEQ CODE_0C8A86                      ;0C8A83|F001    |0C8A86;
                       RTS                                  ;0C8A85|60      |      ;
 
 
          CODE_0C8A86: DEC.W $0100,X                        ;0C8A86|DE0001  |0C0100;
                       BNE CODE_0C8AD0                      ;0C8A89|D045    |0C8AD0;
                       LDY.B #$00                           ;0C8A8B|A000    |      ;
                       LDA.W $0123,X                        ;0C8A8D|BD2301  |0C0123;
                       STA.B r_CurrInstrumentDataAddr       ;0C8A90|85E0    |0000E0;
                       LDA.W $012A,X                        ;0C8A92|BD2A01  |0C012A;
                       STA.B $E1                            ;0C8A95|85E1    |0000E1;
                       LDA.W $0115,X                        ;0C8A97|BD1501  |0C0115;
                       JMP.W CODE_0C8DC1                    ;0C8A9A|4CC18D  |0C8DC1;
 
 
          CODE_0C8A9D: LDA.W $0107,X                        ;0C8A9D|BD0701  |0C0107;
                       CMP.B #$06                           ;0C8AA0|C906    |      ;
                       BCC CODE_0C8A80                      ;0C8AA2|90DC    |0C8A80;
                       BCS CODE_0C8A86                      ;0C8AA4|B0E0    |0C8A86;
 
          CODE_0C8AA6: INC.W $0193                          ;0C8AA6|EE9301  |0C0193;
                       AND.B #$40                           ;0C8AA9|2940    |      ;
                       BNE CODE_0C8ACE                      ;0C8AAB|D021    |0C8ACE;
                       LDA.W $0193                          ;0C8AAD|AD9301  |0C0193;
                       AND.B #$0F                           ;0C8AB0|290F    |      ;
                       BNE CODE_0C8ACE                      ;0C8AB2|D01A    |0C8ACE;
                       LDA.W $015B,X                        ;0C8AB4|BD5B01  |0C015B;
                       BEQ CODE_0C8ACE                      ;0C8AB7|F015    |0C8ACE;
                       CMP.B #$80                           ;0C8AB9|C980    |      ;
                       BCS CODE_0C8ACE                      ;0C8ABB|B011    |0C8ACE;
                       LDA.W $0194                          ;0C8ABD|AD9401  |0C0194;
                       SEC                                  ;0C8AC0|38      |      ;
                       SBC.B #$40                           ;0C8AC1|E940    |      ;
                       BCC CODE_0C8ACE                      ;0C8AC3|9009    |0C8ACE;
                       STA.W $0194                          ;0C8AC5|8D9401  |0C0194;
                       STA.W $4008                          ;0C8AC8|8D0840  |0C4008;
                       JSR.W CODE_0C8F23                    ;0C8ACB|20238F  |0C8F23;
 
          CODE_0C8ACE: RTS                                  ;0C8ACE|60      |      ;
 
 
          CODE_0C8ACF: RTS                                  ;0C8ACF|60      |      ;
 
 
          CODE_0C8AD0: LDA.W $0115,X                        ;0C8AD0|BD1501  |0C0115;
                       CPX.B #$02                           ;0C8AD3|E002    |      ;
                       BEQ CODE_0C8AA6                      ;0C8AD5|F0CF    |0C8AA6;
                       BCS CODE_0C8ACF                      ;0C8AD7|B0F6    |0C8ACF;
                       LDA.W $0115,X                        ;0C8AD9|BD1501  |0C0115;
                       AND.B #$41                           ;0C8ADC|2941    |      ;
                       BNE CODE_0C8ACF                      ;0C8ADE|D0EF    |0C8ACF;
                       LDA.W $06AC,X                        ;0C8AE0|BDAC06  |0C06AC;
                       BMI CODE_0C8B09                      ;0C8AE3|3024    |0C8B09;
                       LDA.W $010E,X                        ;0C8AE5|BD0E01  |0C010E;
                       STA.B r_SoundBankJumpAddr            ;0C8AE8|85E2    |0000E2;
                       LDA.W $06AC,X                        ;0C8AEA|BDAC06  |0C06AC;
                       AND.B #$10                           ;0C8AED|2910    |      ;
                       BEQ CODE_0C8AF6                      ;0C8AEF|F005    |0C8AF6;
                       LDA.B r_SoundBankJumpAddr            ;0C8AF1|A5E2    |0000E2;
                       ASL A                                ;0C8AF3|0A      |      ;
                       STA.B r_SoundBankJumpAddr            ;0C8AF4|85E2    |0000E2;
 
          CODE_0C8AF6: LDA.W $0100,X                        ;0C8AF6|BD0001  |0C0100;
 
          CODE_0C8AF9: SEC                                  ;0C8AF9|38      |      ;
                       SBC.B r_SoundBankJumpAddr            ;0C8AFA|E5E2    |0000E2;
                       BEQ CODE_0C8B45                      ;0C8AFC|F047    |0C8B45;
                       BCS CODE_0C8AF9                      ;0C8AFE|B0F9    |0C8AF9;
 
          CODE_0C8B00: LDA.W $0115,X                        ;0C8B00|BD1501  |0C0115;
                       AND.B #$06                           ;0C8B03|2906    |      ;
                       CMP.B #$06                           ;0C8B05|C906    |      ;
                       BEQ CODE_0C8B1E                      ;0C8B07|F015    |0C8B1E;
 
          CODE_0C8B09: LDA.W $016E,X                        ;0C8B09|BD6E01  |0C016E;
                       AND.B #$10                           ;0C8B0C|2910    |      ;
                       BEQ CODE_0C8B1E                      ;0C8B0E|F00E    |0C8B1E;
                       DEC.W $03DE,X                        ;0C8B10|DEDE03  |0C03DE;
                       BNE CODE_0C8B1E                      ;0C8B13|D009    |0C8B1E;
                       INC.W $03DE,X                        ;0C8B15|FEDE03  |0C03DE;
                       JSR.W CODE_0C8CFA                    ;0C8B18|20FA8C  |0C8CFA;
                       JSR.W CODE_0C81CD                    ;0C8B1B|20CD81  |0C81CD;
 
          CODE_0C8B1E: DEC.W $03C0,X                        ;0C8B1E|DEC003  |0C03C0;
                       BNE CODE_0C8B3C                      ;0C8B21|D019    |0C8B3C;
                       INC.W $03C0,X                        ;0C8B23|FEC003  |0C03C0;
                       JSR.W CODE_0C8C25                    ;0C8B26|20258C  |0C8C25;
                       LDA.W $0115,X                        ;0C8B29|BD1501  |0C0115;
                       AND.B #$06                           ;0C8B2C|2906    |      ;
                       TAY                                  ;0C8B2E|A8      |      ;
                       LDA.W PTR16_0C8B3D,Y                 ;0C8B2F|B93D8B  |0C8B3D;
                       STA.B r_SoundBankJumpAddr            ;0C8B32|85E2    |0000E2;
                       LDA.W PTR16_0C8B3E,Y                 ;0C8B34|B93E8B  |0C8B3E;
                       STA.B $E3                            ;0C8B37|85E3    |0000E3;
                       JMP.W (r_SoundBankJumpAddr)          ;0C8B39|6CE200  |0000E2;
 
 
          CODE_0C8B3C: RTS                                  ;0C8B3C|60      |      ;
 
 
         PTR16_0C8B3D: dw CODE_0C8B55                       ;0C8B3D|        |0C8B55;
                       dw CODE_0C8C0A                       ;0C8B3F|        |0C8C0A;
                       dw CODE_0C8C1E                       ;0C8B41|        |0C8C1E;
                       dw CODE_0C8C77                       ;0C8B43|        |0C8C77;
 
          CODE_0C8B45: LDA.W $0183,X                        ;0C8B45|BD8301  |0C0183;
                       STA.B r_SoundFrequency               ;0C8B48|85EC    |0000EC;
                       LDA.W $0186,X                        ;0C8B4A|BD8601  |0C0186;
                       STA.B $ED                            ;0C8B4D|85ED    |0000ED;
                       JSR.W CODE_0C8229                    ;0C8B4F|202982  |0C8229;
                       JMP.W CODE_0C8B00                    ;0C8B52|4C008B  |0C8B00;
 
 
          CODE_0C8B55: LDA.W $0189,X                        ;0C8B55|BD8901  |0C0189;
                       ASL A                                ;0C8B58|0A      |      ;
                       TAY                                  ;0C8B59|A8      |      ;
                       LDA.W PTR16_0C9E25,Y                 ;0C8B5A|B9259E  |0C9E25;
                       STA.B r_SoundBankJumpAddr            ;0C8B5D|85E2    |0000E2;
                       LDA.W PTR16_0C9E26,Y                 ;0C8B5F|B9269E  |0C9E26;
                       STA.B $E3                            ;0C8B62|85E3    |0000E3;
 
          CODE_0C8B64: LDA.W $03C3,X                        ;0C8B64|BDC303  |0C03C3;
                       TAY                                  ;0C8B67|A8      |      ;
                       LDA.B (r_SoundBankJumpAddr),Y        ;0C8B68|B1E2    |0000E2;
                       CMP.B #$FB                           ;0C8B6A|C9FB    |      ;
                       BCC CODE_0C8B71                      ;0C8B6C|9003    |0C8B71;
                       JMP.W CODE_0C8BD3                    ;0C8B6E|4CD38B  |0C8BD3;
 
 
          CODE_0C8B71: CMP.B #$10                           ;0C8B71|C910    |      ;
                       BCC CODE_0C8B7C                      ;0C8B73|9007    |0C8B7C;
                       LSR A                                ;0C8B75|4A      |      ;
                       LSR A                                ;0C8B76|4A      |      ;
                       LSR A                                ;0C8B77|4A      |      ;
                       LSR A                                ;0C8B78|4A      |      ;
                       STA.W $03C0,X                        ;0C8B79|9DC003  |0C03C0;
 
          CODE_0C8B7C: INC.W $03C3,X                        ;0C8B7C|FEC303  |0C03C3;
                       LDA.B (r_SoundBankJumpAddr),Y        ;0C8B7F|B1E2    |0000E2;
                       AND.B #$0F                           ;0C8B81|290F    |      ;
                       BEQ CODE_0C8B91                      ;0C8B83|F00C    |0C8B91;
                       SEC                                  ;0C8B85|38      |      ;
                       SBC.W $06B2,X                        ;0C8B86|FDB206  |0C06B2;
                       BCC CODE_0C8B8F                      ;0C8B89|9004    |0C8B8F;
                       BEQ CODE_0C8B8F                      ;0C8B8B|F002    |0C8B8F;
                       BNE CODE_0C8B91                      ;0C8B8D|D002    |0C8B91;
 
          CODE_0C8B8F: LDA.B #$01                           ;0C8B8F|A901    |      ;
 
          CODE_0C8B91: STA.W $0154,X                        ;0C8B91|9D5401  |0C0154;
 
          CODE_0C8B94: ORA.W $0154,X                        ;0C8B94|1D5401  |0C0154;
                       BEQ CODE_0C8BA9                      ;0C8B97|F010    |0C8BA9;
                       SEC                                  ;0C8B99|38      |      ;
                       SBC.W $0169,X                        ;0C8B9A|FD6901  |0C0169;
                       BCC CODE_0C8BC5                      ;0C8B9D|9026    |0C8BC5;
                       BEQ CODE_0C8BC5                      ;0C8B9F|F024    |0C8BC5;
                       SEC                                  ;0C8BA1|38      |      ;
                       SBC.W $0152                          ;0C8BA2|ED5201  |0C0152;
                       BCC CODE_0C8BC5                      ;0C8BA5|901E    |0C8BC5;
                       BEQ CODE_0C8BC5                      ;0C8BA7|F01C    |0C8BC5;
 
          CODE_0C8BA9: STA.B r_SoundBankJumpAddr            ;0C8BA9|85E2    |0000E2;
                       LDA.W $016E,X                        ;0C8BAB|BD6E01  |0C016E;
                       AND.B #$20                           ;0C8BAE|2920    |      ;
                       BNE CODE_0C8BC9                      ;0C8BB0|D017    |0C8BC9;
                       LDA.B r_SoundBankJumpAddr            ;0C8BB2|A5E2    |0000E2;
                       ORA.W $0162,X                        ;0C8BB4|1D6201  |0C0162;
 
          CODE_0C8BB7: JSR.W CODE_0C8313                    ;0C8BB7|201383  |0C8313;
                       BCS CODE_0C8BC2                      ;0C8BBA|B006    |0C8BC2;
                       STA.W $4000,X                        ;0C8BBC|9D0040  |0C4000;
                       JSR.W CODE_0C8F23                    ;0C8BBF|20238F  |0C8F23;
 
          CODE_0C8BC2: LDX.B r_CurrInstrumentIdx            ;0C8BC2|A6EE    |0000EE;
                       RTS                                  ;0C8BC4|60      |      ;
 
 
          CODE_0C8BC5: LDA.B #$01                           ;0C8BC5|A901    |      ;
                       BNE CODE_0C8BA9                      ;0C8BC7|D0E0    |0C8BA9;
 
          CODE_0C8BC9: LDA.W $03D8,X                        ;0C8BC9|BDD803  |0C03D8;
                       AND.B #$F0                           ;0C8BCC|29F0    |      ;
                       ORA.B r_SoundBankJumpAddr            ;0C8BCE|05E2    |0000E2;
                       JMP.W CODE_0C8BB7                    ;0C8BD0|4CB78B  |0C8BB7;
 
 
          CODE_0C8BD3: CMP.B #$FE                           ;0C8BD3|C9FE    |      ;
                       BEQ CODE_0C8BE5                      ;0C8BD5|F00E    |0C8BE5;
                       BCS CODE_0C8C58                      ;0C8BD7|B07F    |0C8C58;
                       INC.W $03C3,X                        ;0C8BD9|FEC303  |0C03C3;
                       LDA.W $03C3,X                        ;0C8BDC|BDC303  |0C03C3;
                       STA.W $03C9,X                        ;0C8BDF|9DC903  |0C03C9;
                       JMP.W CODE_0C8B64                    ;0C8BE2|4C648B  |0C8B64;
 
 
          CODE_0C8BE5: INY                                  ;0C8BE5|C8      |      ;
                       INC.W $03C6,X                        ;0C8BE6|FEC603  |0C03C6;
                       LDA.B (r_SoundBankJumpAddr),Y        ;0C8BE9|B1E2    |0000E2;
                       CMP.W $03C6,X                        ;0C8BEB|DDC603  |0C03C6;
                       BNE CODE_0C8C01                      ;0C8BEE|D011    |0C8C01;
                       LDA.B #$00                           ;0C8BF0|A900    |      ;
                       STA.W $03C6,X                        ;0C8BF2|9DC603  |0C03C6;
                       STA.W $03C9,X                        ;0C8BF5|9DC903  |0C03C9;
                       INC.W $03C3,X                        ;0C8BF8|FEC303  |0C03C3;
                       INC.W $03C3,X                        ;0C8BFB|FEC303  |0C03C3;
                       JMP.W CODE_0C8B64                    ;0C8BFE|4C648B  |0C8B64;
 
 
          CODE_0C8C01: LDA.W $03C9,X                        ;0C8C01|BDC903  |0C03C9;
                       STA.W $03C3,X                        ;0C8C04|9DC303  |0C03C3;
                       JMP.W CODE_0C8B64                    ;0C8C07|4C648B  |0C8B64;
 
 
          CODE_0C8C0A: DEC.W $03C3,X                        ;0C8C0A|DEC303  |0C03C3;
                       BMI CODE_0C8C58                      ;0C8C0D|3049    |0C8C58;
                       DEC.W $0154,X                        ;0C8C0F|DE5401  |0C0154;
                       BMI CODE_0C8C1A                      ;0C8C12|3006    |0C8C1A;
                       LDA.W $0154,X                        ;0C8C14|BD5401  |0C0154;
                       JMP.W CODE_0C8B91                    ;0C8C17|4C918B  |0C8B91;
 
 
          CODE_0C8C1A: INC.W $0154,X                        ;0C8C1A|FE5401  |0C0154;
                       RTS                                  ;0C8C1D|60      |      ;
 
 
          CODE_0C8C1E: LDA.W $0115,X                        ;0C8C1E|BD1501  |0C0115;
                       AND.B #$02                           ;0C8C21|2902    |      ;
                       BNE CODE_0C8C77                      ;0C8C23|D052    |0C8C77;
 
          CODE_0C8C25: LDA.W $0115,X                        ;0C8C25|BD1501  |0C0115;
                       AND.B #$06                           ;0C8C28|2906    |      ;
                       CMP.B #$06                           ;0C8C2A|C906    |      ;
                       BEQ CODE_0C8C6A                      ;0C8C2C|F03C    |0C8C6A;
                       LDA.W $0100,X                        ;0C8C2E|BD0001  |0C0100;
                       CMP.W $03CC,X                        ;0C8C31|DDCC03  |0C03CC;
                       BCS CODE_0C8C6A                      ;0C8C34|B034    |0C8C6A;
                       LDA.W $0115,X                        ;0C8C36|BD1501  |0C0115;
                       ORA.B #$06                           ;0C8C39|0906    |      ;
                       STA.W $0115,X                        ;0C8C3B|9D1501  |0C0115;
                       LDA.W $03D8,X                        ;0C8C3E|BDD803  |0C03D8;
                       AND.B #$0C                           ;0C8C41|290C    |      ;
                       BNE CODE_0C8C6B                      ;0C8C43|D026    |0C8C6B;
                       JMP.W CODE_0C8C48                    ;0C8C45|4C488C  |0C8C48;
 
 
          CODE_0C8C48: LDA.W $03D8,X                        ;0C8C48|BDD803  |0C03D8;
                       AND.B #$02                           ;0C8C4B|2902    |      ;
                       BEQ CODE_0C8C57                      ;0C8C4D|F008    |0C8C57;
                       LDA.W $016E,X                        ;0C8C4F|BD6E01  |0C016E;
                       ORA.B #$20                           ;0C8C52|0920    |      ;
                       STA.W $016E,X                        ;0C8C54|9D6E01  |0C016E;
 
          CODE_0C8C57: RTS                                  ;0C8C57|60      |      ;
 
 
          CODE_0C8C58: LDA.W $0115,X                        ;0C8C58|BD1501  |0C0115;
                       ORA.B #$04                           ;0C8C5B|0904    |      ;
                       AND.B #$FD                           ;0C8C5D|29FD    |      ;
                       STA.W $0115,X                        ;0C8C5F|9D1501  |0C0115;
                       LDA.W $03C3,X                        ;0C8C62|BDC303  |0C03C3;
                       ORA.B #$80                           ;0C8C65|0980    |      ;
                       STA.W $03C3,X                        ;0C8C67|9DC303  |0C03C3;
 
          CODE_0C8C6A: RTS                                  ;0C8C6A|60      |      ;
 
 
          CODE_0C8C6B: LSR A                                ;0C8C6B|4A      |      ;
                       LSR A                                ;0C8C6C|4A      |      ;
                       STA.B r_SoundBankJumpAddr            ;0C8C6D|85E2    |0000E2;
                       JSR.W CODE_0C8C48                    ;0C8C6F|20488C  |0C8C48;
                       LDA.B r_SoundBankJumpAddr            ;0C8C72|A5E2    |0000E2;
                       JMP.W CODE_0C8B91                    ;0C8C74|4C918B  |0C8B91;
 
 
          CODE_0C8C77: LDA.W $06AC,X                        ;0C8C77|BDAC06  |0C06AC;
                       BMI CODE_0C8CA6                      ;0C8C7A|302A    |0C8CA6;
                       STY.B r_SoundBankJumpAddr            ;0C8C7C|84E2    |0000E2;
                       LDA.W $06AC,X                        ;0C8C7E|BDAC06  |0C06AC;
                       AND.B #$0F                           ;0C8C81|290F    |      ;
                       STA.B r_SoundBankTempVar1            ;0C8C83|85E4    |0000E4;
                       LDA.W $06AF,X                        ;0C8C85|BDAF06  |0C06AF;
                       SEC                                  ;0C8C88|38      |      ;
                       SBC.B #$01                           ;0C8C89|E901    |      ;
                       AND.B #$03                           ;0C8C8B|2903    |      ;
                       SEC                                  ;0C8C8D|38      |      ;
                       SBC.B r_SoundBankTempVar1            ;0C8C8E|E5E4    |0000E4;
                       AND.B #$03                           ;0C8C90|2903    |      ;
                       CPX.B #$00                           ;0C8C92|E000    |      ;
                       BEQ CODE_0C8C98                      ;0C8C94|F002    |0C8C98;
                       ORA.B #$04                           ;0C8C96|0904    |      ;
 
          CODE_0C8C98: TAY                                  ;0C8C98|A8      |      ;
                       LDA.W $06B5,Y                        ;0C8C99|B9B506  |0C06B5;
                       STA.B r_SoundFrequency               ;0C8C9C|85EC    |0000EC;
                       LDA.W $06BF,Y                        ;0C8C9E|B9BF06  |0C06BF;
                       STA.B $ED                            ;0C8CA1|85ED    |0000ED;
                       JSR.W CODE_0C81E7                    ;0C8CA3|20E781  |0C81E7;
 
          CODE_0C8CA6: LDA.W $03D8,X                        ;0C8CA6|BDD803  |0C03D8;
                       AND.B #$0C                           ;0C8CA9|290C    |      ;
                       BNE CODE_0C8C6A                      ;0C8CAB|D0BD    |0C8C6A;
                       LDA.W $0189,X                        ;0C8CAD|BD8901  |0C0189;
                       BMI CODE_0C8CD7                      ;0C8CB0|3025    |0C8CD7;
                       LDA.W $03C3,X                        ;0C8CB2|BDC303  |0C03C3;
                       BMI CODE_0C8CD7                      ;0C8CB5|3020    |0C8CD7;
                       DEC.W $03D5,X                        ;0C8CB7|DED503  |0C03D5;
                       BEQ CODE_0C8CBF                      ;0C8CBA|F003    |0C8CBF;
                       JMP.W CODE_0C8B55                    ;0C8CBC|4C558B  |0C8B55;
 
 
          CODE_0C8CBF: INC.W $06B2,X                        ;0C8CBF|FEB206  |0C06B2;
                       LDA.W $06B2,X                        ;0C8CC2|BDB206  |0C06B2;
                       CMP.B #$10                           ;0C8CC5|C910    |      ;
                       BCC CODE_0C8CCE                      ;0C8CC7|9005    |0C8CCE;
                       LDA.B #$0F                           ;0C8CC9|A90F    |      ;
                       STA.W $06B2,X                        ;0C8CCB|9DB206  |0C06B2;
 
          CODE_0C8CCE: LDA.W $03D2,X                        ;0C8CCE|BDD203  |0C03D2;
                       STA.W $03D5,X                        ;0C8CD1|9DD503  |0C03D5;
                       JMP.W CODE_0C8B55                    ;0C8CD4|4C558B  |0C8B55;
 
 
          CODE_0C8CD7: DEC.W $03D5,X                        ;0C8CD7|DED503  |0C03D5;
                       BNE CODE_0C8C6A                      ;0C8CDA|D08E    |0C8C6A;
                       LDA.W $03D2,X                        ;0C8CDC|BDD203  |0C03D2;
                       STA.W $03D5,X                        ;0C8CDF|9DD503  |0C03D5;
                       DEC.W $0154,X                        ;0C8CE2|DE5401  |0C0154;
                       BMI CODE_0C8CF6                      ;0C8CE5|300F    |0C8CF6;
                       LDA.B #$01                           ;0C8CE7|A901    |      ;
                       CMP.W $0154,X                        ;0C8CE9|DD5401  |0C0154;
                       BEQ CODE_0C8CF0                      ;0C8CEC|F002    |0C8CF0;
                       BCS CODE_0C8CF6                      ;0C8CEE|B006    |0C8CF6;
 
          CODE_0C8CF0: LDA.W $0154,X                        ;0C8CF0|BD5401  |0C0154;
                       JMP.W CODE_0C8B94                    ;0C8CF3|4C948B  |0C8B94;
 
 
          CODE_0C8CF6: INC.W $0154,X                        ;0C8CF6|FE5401  |0C0154;
                       RTS                                  ;0C8CF9|60      |      ;
 
 
          CODE_0C8CFA: LDA.W $06A3,X                        ;0C8CFA|BDA306  |0C06A3;
                       ASL A                                ;0C8CFD|0A      |      ;
                       TAY                                  ;0C8CFE|A8      |      ;
                       LDA.W PTR16_0C9E7B,Y                 ;0C8CFF|B97B9E  |0C9E7B;
                       STA.B r_SoundBankJumpAddr            ;0C8D02|85E2    |0000E2;
                       LDA.W PTR16_0C9E7C,Y                 ;0C8D04|B97C9E  |0C9E7C;
                       STA.B $E3                            ;0C8D07|85E3    |0000E3;
                       LDA.W $06A6,X                        ;0C8D09|BDA606  |0C06A6;
                       TAY                                  ;0C8D0C|A8      |      ;
                       LDA.B (r_SoundBankJumpAddr),Y        ;0C8D0D|B1E2    |0000E2;
                       CMP.B #$FB                           ;0C8D0F|C9FB    |      ;
                       BCS CODE_0C8D84                      ;0C8D11|B071    |0C8D84;
                       CMP.B #$10                           ;0C8D13|C910    |      ;
                       BCC CODE_0C8D1E                      ;0C8D15|9007    |0C8D1E;
                       LSR A                                ;0C8D17|4A      |      ;
                       LSR A                                ;0C8D18|4A      |      ;
                       LSR A                                ;0C8D19|4A      |      ;
                       LSR A                                ;0C8D1A|4A      |      ;
                       STA.W $03DE,X                        ;0C8D1B|9DDE03  |0C03DE;
 
          CODE_0C8D1E: INC.W $06A6,X                        ;0C8D1E|FEA606  |0C06A6;
                       LDA.B (r_SoundBankJumpAddr),Y        ;0C8D21|B1E2    |0000E2;
                       AND.B #$0F                           ;0C8D23|290F    |      ;
                       STA.B r_SoundBankJumpAddr            ;0C8D25|85E2    |0000E2;
                       CMP.B #$08                           ;0C8D27|C908    |      ;
                       BCS CODE_0C8D32                      ;0C8D29|B007    |0C8D32;
                       JSR.W CODE_0C8D40                    ;0C8D2B|20408D  |0C8D40;
                       JSR.W CODE_0C8D54                    ;0C8D2E|20548D  |0C8D54;
                       RTS                                  ;0C8D31|60      |      ;
 
 
          CODE_0C8D32: LDA.B #$10                           ;0C8D32|A910    |      ;
                       SEC                                  ;0C8D34|38      |      ;
                       SBC.B r_SoundBankJumpAddr            ;0C8D35|E5E2    |0000E2;
                       STA.B r_SoundBankJumpAddr            ;0C8D37|85E2    |0000E2;
                       JSR.W CODE_0C8D40                    ;0C8D39|20408D  |0C8D40;
                       JSR.W CODE_0C8D6A                    ;0C8D3C|206A8D  |0C8D6A;
                       RTS                                  ;0C8D3F|60      |      ;
 
 
          CODE_0C8D40: LDA.W $03E1,X                        ;0C8D40|BDE103  |0C03E1;
                       TAX                                  ;0C8D43|AA      |      ;
                       LDA.B r_SoundBankJumpAddr            ;0C8D44|A5E2    |0000E2;
 
          CODE_0C8D46: DEX                                  ;0C8D46|CA      |      ;
                       BEQ CODE_0C8D4F                      ;0C8D47|F006    |0C8D4F;
                       CLC                                  ;0C8D49|18      |      ;
                       ADC.B r_SoundBankJumpAddr            ;0C8D4A|65E2    |0000E2;
                       JMP.W CODE_0C8D46                    ;0C8D4C|4C468D  |0C8D46;
 
 
          CODE_0C8D4F: LDX.B r_CurrInstrumentIdx            ;0C8D4F|A6EE    |0000EE;
                       STA.B r_SoundBankJumpAddr            ;0C8D51|85E2    |0000E2;
                       RTS                                  ;0C8D53|60      |      ;
 
 
          CODE_0C8D54: CLC                                  ;0C8D54|18      |      ;
                       ADC.W $0183,X                        ;0C8D55|7D8301  |0C0183;
                       STA.B r_SoundFrequency               ;0C8D58|85EC    |0000EC;
                       BCC CODE_0C8D64                      ;0C8D5A|9008    |0C8D64;
                       LDA.W $0186,X                        ;0C8D5C|BD8601  |0C0186;
                       STA.B $ED                            ;0C8D5F|85ED    |0000ED;
                       INC.B $ED                            ;0C8D61|E6ED    |0000ED;
                       RTS                                  ;0C8D63|60      |      ;
 
 
          CODE_0C8D64: LDA.W $0186,X                        ;0C8D64|BD8601  |0C0186;
                       STA.B $ED                            ;0C8D67|85ED    |0000ED;
                       RTS                                  ;0C8D69|60      |      ;
 
 
          CODE_0C8D6A: LDA.W $0183,X                        ;0C8D6A|BD8301  |0C0183;
                       SEC                                  ;0C8D6D|38      |      ;
                       SBC.B r_SoundBankJumpAddr            ;0C8D6E|E5E2    |0000E2;
                       BCS CODE_0C8D7C                      ;0C8D70|B00A    |0C8D7C;
                       STA.B r_SoundFrequency               ;0C8D72|85EC    |0000EC;
                       LDA.W $0186,X                        ;0C8D74|BD8601  |0C0186;
                       STA.B $ED                            ;0C8D77|85ED    |0000ED;
                       DEC.B $ED                            ;0C8D79|C6ED    |0000ED;
                       RTS                                  ;0C8D7B|60      |      ;
 
 
          CODE_0C8D7C: STA.B r_SoundFrequency               ;0C8D7C|85EC    |0000EC;
                       LDA.W $0186,X                        ;0C8D7E|BD8601  |0C0186;
                       STA.B $ED                            ;0C8D81|85ED    |0000ED;
                       RTS                                  ;0C8D83|60      |      ;
 
 
          CODE_0C8D84: CMP.B #$FE                           ;0C8D84|C9FE    |      ;
                       BEQ CODE_0C8D96                      ;0C8D86|F00E    |0C8D96;
                       BCS CODE_0C8DBB                      ;0C8D88|B031    |0C8DBB;
                       INC.W $06A6,X                        ;0C8D8A|FEA606  |0C06A6;
                       LDA.W $06A6,X                        ;0C8D8D|BDA606  |0C06A6;
                       STA.W $06A0,X                        ;0C8D90|9DA006  |0C06A0;
                       JMP.W CODE_0C8CFA                    ;0C8D93|4CFA8C  |0C8CFA;
 
 
          CODE_0C8D96: INY                                  ;0C8D96|C8      |      ;
                       INC.W $06A9,X                        ;0C8D97|FEA906  |0C06A9;
                       LDA.B (r_SoundBankJumpAddr),Y        ;0C8D9A|B1E2    |0000E2;
                       CMP.W $06A9,X                        ;0C8D9C|DDA906  |0C06A9;
                       BNE CODE_0C8DB2                      ;0C8D9F|D011    |0C8DB2;
                       LDA.B #$00                           ;0C8DA1|A900    |      ;
                       STA.W $06A9,X                        ;0C8DA3|9DA906  |0C06A9;
                       STA.W $06A0,X                        ;0C8DA6|9DA006  |0C06A0;
                       INC.W $06A6,X                        ;0C8DA9|FEA606  |0C06A6;
                       INC.W $06A6,X                        ;0C8DAC|FEA606  |0C06A6;
                       JMP.W CODE_0C8CFA                    ;0C8DAF|4CFA8C  |0C8CFA;
 
 
          CODE_0C8DB2: LDA.W $06A0,X                        ;0C8DB2|BDA006  |0C06A0;
                       STA.W $06A6,X                        ;0C8DB5|9DA606  |0C06A6;
                       JMP.W CODE_0C8CFA                    ;0C8DB8|4CFA8C  |0C8CFA;
 
 
          CODE_0C8DBB: LDA.B #$FF                           ;0C8DBB|A9FF    |      ;
                       STA.W $03DE,X                        ;0C8DBD|9DDE03  |0C03DE;
                       RTS                                  ;0C8DC0|60      |      ;
 
 
          CODE_0C8DC1: LSR A                                ;0C8DC1|4A      |      ;
                       BCC DATA8_0C8DC7                     ;0C8DC2|9003    |0C8DC7;
                       JMP.W CODE_0C8DDE                    ;0C8DC4|4CDE8D  |0C8DDE;
 
 
         DATA8_0C8DC7: db $4C                               ;0C8DC7|        |      ;
 
                       dw music_bankSwap_01                 ;0C8DC8|        |0FE1C5;
 
         PTR16_0C8DCA: dw CODE_0C8E14                       ;0C8DCA|        |0C8E14;
                       dw CODE_0C8E1E                       ;0C8DCC|        |0C8E1E;
                       dw CODE_0C8E28                       ;0C8DCE|        |0C8E28;
                       dw CODE_0C8E31                       ;0C8DD0|        |0C8E31;
                       dw CODE_0C8E39                       ;0C8DD2|        |0C8E39;
                       dw CODE_0C850D                       ;0C8DD4|        |0C850D;
                       dw CODE_0C850D                       ;0C8DD6|        |0C850D;
                       dw CODE_0C850D                       ;0C8DD8|        |0C850D;
                       dw CODE_0C850D                       ;0C8DDA|        |0C850D;
                       dw CODE_0C8E3F                       ;0C8DDC|        |0C8E3F;
 
          CODE_0C8DDE: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8DDE|B1E0    |0000E0;
                       CMP.B #$E6                           ;0C8DE0|C9E6    |      ;
                       BCS CODE_0C8DE7                      ;0C8DE2|B003    |0C8DE7;
                       JMP.W CODE_0C8E49                    ;0C8DE4|4C498E  |0C8E49;
 
 
          CODE_0C8DE7: CMP.B #$F0                           ;0C8DE7|C9F0    |      ;
                       BCC CODE_0C8DF8                      ;0C8DE9|900D    |0C8DF8;
                       AND.B #$0F                           ;0C8DEB|290F    |      ;
                       CMP.B #$0B                           ;0C8DED|C90B    |      ;
                       BCC CODE_0C8DF4                      ;0C8DEF|9003    |0C8DF4;
                       JMP.W CODE_0C85A3                    ;0C8DF1|4CA385  |0C85A3;
 
 
          CODE_0C8DF4: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8DF4|B1E0    |0000E0;
                       BNE CODE_0C8E49                      ;0C8DF6|D051    |0C8E49;
 
          CODE_0C8DF8: CPX.B #$06                           ;0C8DF8|E006    |      ;
                       BEQ CODE_0C8E49                      ;0C8DFA|F04D    |0C8E49;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8DFC|B1E0    |0000E0;
                       AND.B #$0F                           ;0C8DFE|290F    |      ;
                       SEC                                  ;0C8E00|38      |      ;
                       SBC.B #$06                           ;0C8E01|E906    |      ;
                       ASL A                                ;0C8E03|0A      |      ;
                       TAX                                  ;0C8E04|AA      |      ;
                       LDA.W PTR16_0C8DCA,X                 ;0C8E05|BDCA8D  |0C8DCA;
                       STA.B r_SoundBankJumpAddr            ;0C8E08|85E2    |0000E2;
                       LDA.W PTR16_0C8DCB,X                 ;0C8E0A|BDCB8D  |0C8DCB;
                       STA.B $E3                            ;0C8E0D|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;0C8E0F|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;0C8E11|6CE200  |0000E2;
 
 
          CODE_0C8E14: INY                                  ;0C8E14|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E15|B1E0    |0000E0;
                       STA.W $010E,X                        ;0C8E17|9D0E01  |0C010E;
 
          CODE_0C8E1A: INY                                  ;0C8E1A|C8      |      ;
                       JMP.W CODE_0C8DDE                    ;0C8E1B|4CDE8D  |0C8DDE;
 
 
          CODE_0C8E1E: LDA.W $0115,X                        ;0C8E1E|BD1501  |0C0115;
                       ORA.B #$02                           ;0C8E21|0902    |      ;
                       STA.W $0115,X                        ;0C8E23|9D1501  |0C0115;
                       BNE CODE_0C8E1A                      ;0C8E26|D0F2    |0C8E1A;
 
          CODE_0C8E28: INY                                  ;0C8E28|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E29|B1E0    |0000E0;
                       STA.W $0169,X                        ;0C8E2B|9D6901  |0C0169;
                       JMP.W CODE_0C8E1A                    ;0C8E2E|4C1A8E  |0C8E1A;
 
 
          CODE_0C8E31: INY                                  ;0C8E31|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E32|B1E0    |0000E0;
                       STA.W $0162,X                        ;0C8E34|9D6201  |0C0162;
                       BNE CODE_0C8E1A                      ;0C8E37|D0E1    |0C8E1A;
 
          CODE_0C8E39: INY                                  ;0C8E39|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E3A|B1E0    |0000E0;
                       JMP.W CODE_0C8E8E                    ;0C8E3C|4C8E8E  |0C8E8E;
 
 
          CODE_0C8E3F: LDA.W $0115,X                        ;0C8E3F|BD1501  |0C0115;
                       AND.B #$F9                           ;0C8E42|29F9    |      ;
                       STA.W $0115,X                        ;0C8E44|9D1501  |0C0115;
                       BEQ CODE_0C8E1A                      ;0C8E47|F0D1    |0C8E1A;
 
          CODE_0C8E49: AND.B #$F0                           ;0C8E49|29F0    |      ;
                       CMP.B #$00                           ;0C8E4B|C900    |      ;
                       BNE CODE_0C8EBB                      ;0C8E4D|D06C    |0C8EBB;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E4F|B1E0    |0000E0;
                       AND.B #$0F                           ;0C8E51|290F    |      ;
                       BNE CODE_0C8E58                      ;0C8E53|D003    |0C8E58;
                       JMP.W CODE_0C8EBB                    ;0C8E55|4CBB8E  |0C8EBB;
 
 
          CODE_0C8E58: STA.W $010E,X                        ;0C8E58|9D0E01  |0C010E;
                       LDA.W $0115,X                        ;0C8E5B|BD1501  |0C0115;
                       AND.B #$F9                           ;0C8E5E|29F9    |      ;
                       STA.W $0115,X                        ;0C8E60|9D1501  |0C0115;
                       INY                                  ;0C8E63|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E64|B1E0    |0000E0;
                       CPX.B #$06                           ;0C8E66|E006    |      ;
                       BNE CODE_0C8E72                      ;0C8E68|D008    |0C8E72;
                       LDA.B #$30                           ;0C8E6A|A930    |      ;
                       STA.W $0162,X                        ;0C8E6C|9D6201  |0C0162;
                       JMP.W CODE_0C8EB3                    ;0C8E6F|4CB38E  |0C8EB3;
 
 
          CODE_0C8E72: STA.W $0162,X                        ;0C8E72|9D6201  |0C0162;
                       INY                                  ;0C8E75|C8      |      ;
                       CPX.B #$00                           ;0C8E76|E000    |      ;
                       BCS CODE_0C8E7E                      ;0C8E78|B004    |0C8E7E;
                       INY                                  ;0C8E7A|C8      |      ;
                       JMP.W CODE_0C8DDE                    ;0C8E7B|4CDE8D  |0C8DDE;
 
 
          CODE_0C8E7E: LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E7E|B1E0    |0000E0;
                       CMP.B #$88                           ;0C8E80|C988    |      ;
                       BEQ CODE_0C8EA6                      ;0C8E82|F022    |0C8EA6;
                       LDA.W $0115,X                        ;0C8E84|BD1501  |0C0115;
                       ORA.B #$80                           ;0C8E87|0980    |      ;
                       STA.W $0115,X                        ;0C8E89|9D1501  |0C0115;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8E8C|B1E0    |0000E0;
 
          CODE_0C8E8E: CPX.B #$03                           ;0C8E8E|E003    |      ;
                       BNE CODE_0C8E95                      ;0C8E90|D003    |0C8E95;
                       STA.W $0190                          ;0C8E92|8D9001  |0C0190;
 
          CODE_0C8E95: JSR.W CODE_0C8313                    ;0C8E95|201383  |0C8313;
                       BCS CODE_0C8EA0                      ;0C8E98|B006    |0C8EA0;
                       STA.W $4001,X                        ;0C8E9A|9D0140  |0C4001;
                       JSR.W CODE_0C8F23                    ;0C8E9D|20238F  |0C8F23;
 
          CODE_0C8EA0: LDX.B r_CurrInstrumentIdx            ;0C8EA0|A6EE    |0000EE;
                       INY                                  ;0C8EA2|C8      |      ;
 
          CODE_0C8EA3: JMP.W CODE_0C8DDE                    ;0C8EA3|4CDE8D  |0C8DDE;
 
 
          CODE_0C8EA6: LDA.W $0115,X                        ;0C8EA6|BD1501  |0C0115;
                       AND.B #$7F                           ;0C8EA9|297F    |      ;
                       STA.W $0115,X                        ;0C8EAB|9D1501  |0C0115;
                       LDA.B #$7F                           ;0C8EAE|A97F    |      ;
                       JMP.W CODE_0C8E8E                    ;0C8EB0|4C8E8E  |0C8E8E;
 
 
          CODE_0C8EB3: CMP.B #$00                           ;0C8EB3|C900    |      ;
                       BNE CODE_0C8EA3                      ;0C8EB5|D0EC    |0C8EA3;
                       INY                                  ;0C8EB7|C8      |      ;
                       JMP.W CODE_0C8DDE                    ;0C8EB8|4CDE8D  |0C8DDE;
 
 
          CODE_0C8EBB: CPX.B #$06                           ;0C8EBB|E006    |      ;
                       BNE CODE_0C8EC6                      ;0C8EBD|D007    |0C8EC6;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8EBF|B1E0    |0000E0;
                       CMP.B #$10                           ;0C8EC1|C910    |      ;
                       BNE CODE_0C8EC6                      ;0C8EC3|D001    |0C8EC6;
                       INY                                  ;0C8EC5|C8      |      ;
 
          CODE_0C8EC6: LDA.W $010E,X                        ;0C8EC6|BD0E01  |0C010E;
                       STA.W $0100,X                        ;0C8EC9|9D0001  |0C0100;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8ECC|B1E0    |0000E0;
                       LSR A                                ;0C8ECE|4A      |      ;
                       LSR A                                ;0C8ECF|4A      |      ;
                       LSR A                                ;0C8ED0|4A      |      ;
                       LSR A                                ;0C8ED1|4A      |      ;
                       STA.W $015B,X                        ;0C8ED2|9D5B01  |0C015B;
                       CPX.B #$06                           ;0C8ED5|E006    |      ;
                       BEQ CODE_0C8EED                      ;0C8ED7|F014    |0C8EED;
                       LDA.W $0162,X                        ;0C8ED9|BD6201  |0C0162;
                       AND.B #$10                           ;0C8EDC|2910    |      ;
                       BEQ CODE_0C8F1D                      ;0C8EDE|F03D    |0C8F1D;
                       LDA.W $015B,X                        ;0C8EE0|BD5B01  |0C015B;
                       SEC                                  ;0C8EE3|38      |      ;
                       SBC.W $0169,X                        ;0C8EE4|FD6901  |0C0169;
                       BEQ CODE_0C8EEB                      ;0C8EE7|F002    |0C8EEB;
                       BCS CODE_0C8EED                      ;0C8EE9|B002    |0C8EED;
 
          CODE_0C8EEB: LDA.B #$01                           ;0C8EEB|A901    |      ;
 
          CODE_0C8EED: ORA.W $0162,X                        ;0C8EED|1D6201  |0C0162;
 
          CODE_0C8EF0: JSR.W CODE_0C8313                    ;0C8EF0|201383  |0C8313;
                       BCS CODE_0C8EFB                      ;0C8EF3|B006    |0C8EFB;
                       STA.W $4000,X                        ;0C8EF5|9D0040  |0C4000;
                       JSR.W CODE_0C8F23                    ;0C8EF8|20238F  |0C8F23;
 
          CODE_0C8EFB: LDX.B r_CurrInstrumentIdx            ;0C8EFB|A6EE    |0000EE;
                       LDA.W $0115,X                        ;0C8EFD|BD1501  |0C0115;
                       AND.B #$02                           ;0C8F00|2902    |      ;
                       BNE CODE_0C8F1A                      ;0C8F02|D016    |0C8F1A;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8F04|B1E0    |0000E0;
                       AND.B #$0F                           ;0C8F06|290F    |      ;
                       CPX.B #$06                           ;0C8F08|E006    |      ;
                       BEQ CODE_0C8F15                      ;0C8F0A|F009    |0C8F15;
                       STA.B $ED                            ;0C8F0C|85ED    |0000ED;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8F0E|B1E0    |0000E0;
                       BEQ CODE_0C8F15                      ;0C8F10|F003    |0C8F15;
                       INY                                  ;0C8F12|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0C8F13|B1E0    |0000E0;
 
          CODE_0C8F15: STA.B r_SoundFrequency               ;0C8F15|85EC    |0000EC;
                       JSR.W CODE_0C81CD                    ;0C8F17|20CD81  |0C81CD;
 
          CODE_0C8F1A: JMP.W CODE_0C86D6                    ;0C8F1A|4CD686  |0C86D6;
 
 
          CODE_0C8F1D: LDA.W $0162,X                        ;0C8F1D|BD6201  |0C0162;
                       JMP.W CODE_0C8EF0                    ;0C8F20|4CF08E  |0C8EF0;
 
 
          CODE_0C8F23: NOP                                  ;0C8F23|EA      |      ;
                       NOP                                  ;0C8F24|EA      |      ;
                       NOP                                  ;0C8F25|EA      |      ;
                       NOP                                  ;0C8F26|EA      |      ;
                       NOP                                  ;0C8F27|EA      |      ;
                       NOP                                  ;0C8F28|EA      |      ;
                       NOP                                  ;0C8F29|EA      |      ;
                       NOP                                  ;0C8F2A|EA      |      ;
                       NOP                                  ;0C8F2B|EA      |      ;
 
          CODE_0C8F2C: NOP                                  ;0C8F2C|EA      |      ;
 
          CODE_0C8F2D: RTS                                  ;0C8F2D|60      |      ;
 
 
       mainSoundTable: dw snd_01                            ;0C8F2E|        |0C9026;
                       dw snd_lowHighHatClose_02            ;0C8F30|        |0C902B;
                       dw snd_HighHiHatHitClosed_03         ;0C8F32|        |0C9030;
                       dw snd_RideCymbal_04                 ;0C8F34|        |0C9035;
                       dw snd_HiHatHitOpen_05               ;0C8F36|        |0C903A;
                       dw snd_HiHatClose_06                 ;0C8F38|        |0C903F;
                       dw snd__07                           ;0C8F3A|        |0C9047;
                       dw snd_CollapsingTower_08            ;0C8F3C|        |0C9152;
                       dw snd_Drip_09                       ;0C8F3E|        |0C904F;
                       dw snd_landing_0A                    ;0C8F40|        |0C90B0;
                       dw snd__0b                           ;0C8F42|        |0C9057;
                       dw snd__0C                           ;0C8F44|        |0C906E;
                       dw snd__0D                           ;0C8F46|        |0C9189;
                       dw snd__0E                           ;0C8F48|        |0C918E;
                       dw snd__0F                           ;0C8F4A|        |0C9164;
                       dw snd_MudManAppear_10               ;0C8F4C|        |0C91C7;
                       dw snd__11                           ;0C8F4E|        |0C9174;
                       dw snd_AxeWeaponToss_12              ;0C8F50|        |0C9135;
                       dw snd__13                           ;0C8F52|        |0C907B;
                       dw snd__14                           ;0C8F54|        |0C9080;
                       dw snd__15                           ;0C8F56|        |0C9085;
                       dw snd__16                           ;0C8F58|        |0C908A;
                       dw snd__17                           ;0C8F5A|        |0C9092;
                       dw snd__18                           ;0C8F5C|        |0C909C;
                       dw snd_GetCash_19                    ;0C8F5E|        |0C91B5;
                       dw snd__1A                           ;0C8F60|        |0C91B0;
                       dw snd__1B                           ;0C8F62|        |0C90A1;
                       dw snd__1C                           ;0C8F64|        |0C9069;
                       dw snd_Lightning_1D                  ;0C8F66|        |0C9113;
                       dw snd_AlucardFireball_1E            ;0C8F68|        |0C9120;
                       dw snd_FlowingWater_1F               ;0C8F6A|        |0C9128;
                       dw snd__20                           ;0C8F6C|        |0C9064;
                       dw snd_EmergeSplash_21               ;0C8F6E|        |0C9118;
                       dw snd__22                           ;0C8F70|        |0C90A6;
                       dw snd_outWaterSplash_23             ;0C8F72|        |0C90AB;
                       dw snd_inWaterSplash_24              ;0C8F74|        |0C9106;
                       dw snd__25                           ;0C8F76|        |0C905F;
                       dw snd__26                           ;0C8F78|        |0C9184;
                       dw snd_OwlFlap_27                    ;0C8F7A|        |0C90C5;
                       dw snd_EnemyShattered_28             ;0C8F7C|        |0C90D5;
                       dw snd_IneffectiveAttack_29          ;0C8F7E|        |0C90B5;
                       dw snd_CyclopsPound_2A               ;0C8F80|        |0C90DD;
                       dw snd_DoorSlam_2B                   ;0C8F82|        |0C90CD;
                       dw snd__2C                           ;0C8F84|        |0C9097;
                       dw snd_Refill_2D                     ;0C8F86|        |0C90E5;
                       dw snd_TitleScreenThunder_2E         ;0C8F88|        |0C90EA;
                       dw snd_Thunder_2F                    ;0C8F8A|        |0C90F4;
                       dw snd__30                           ;0C8F8C|        |0C90FC;
                       dw snd__31                           ;0C8F8E|        |0C9101;
                       dw snd__32                           ;0C8F90|        |0C9157;
                       dw snd_CritterRassle_33              ;0C8F92|        |0C90BD;
                       dw snd__34                           ;0C8F94|        |0C9076;
                       dw snd_RiverFreeze_35                ;0C8F96|        |0C912D;
                       dw snd_TeeterTotter_36               ;0C8F98|        |0C913D;
                       dw snd_TrapDoor_37                   ;0C8F9A|        |0C9142;
                       dw snd__38                           ;0C8F9C|        |0C914A;
                       dw snd_FrozenEnemyShattered_39       ;0C8F9E|        |0C915C;
                       dw snd__3A                           ;0C8FA0|        |0C916C;
                       dw snd__3B                           ;0C8FA2|        |0C917C;
                       dw snd_MedusaArrow_3C                ;0C8FA4|        |0C910E;
                       dw snd_ClockTick_3D                  ;0C8FA6|        |0C9193;
                       dw snd_SunkenRoomQuake_3E            ;0C8FA8|        |0C91A8;
                       dw snd__3F                           ;0C8FAA|        |0C91BA;
                       dw snd__40                           ;0C8FAC|        |0C91C2;
                       dw snd__41                           ;0C8FAE|        |0C91CF;
                       dw snd__42                           ;0C8FB0|        |0C91D4;
                       dw snd_flameSplash_43                ;0C8FB2|        |0C919B;
                       dw snd__44                           ;0C8FB4|        |0C91E1;
                       dw snd__45                           ;0C8FB6|        |0C91E9;
                       dw snd__46                           ;0C8FB8|        |0C91A3;
                       dw snd__47                           ;0C8FBA|        |0C91EE;
                       dw snd__48                           ;0C8FBC|        |0C91D9;
                       dw snd_PartnerChange_49              ;0C8FBE|        |0C90EF;
                       dw snd_RosseryClear_4A               ;0C8FC0|        |0C91F6;
                       dw snd_OneUp_4B                      ;0C8FC2|        |0C91FB;
                       dw snd_MemberAccept_4C               ;0C8FC4|        |0C9203;
                       dw snd_pause_4D                      ;0C8FC6|        |0C9208;
                       dw snd_death_4E                      ;0C8FC8|        |0C920D;
                       dw snd_beginning_4F                  ;0C8FCA|        |0C921B;
                       dw snd_madForest_50                  ;0C8FCC|        |0C9229;
                       dw snd_stream_51                     ;0C8FCE|        |0C9237;
                       dw snd_deadBeat_52                   ;0C8FD0|        |0C9245;
                       dw snd_clockWork_53                  ;0C8FD2|        |0C9253;
                       dw snd_aquarius_54                   ;0C8FD4|        |0C9261;
                       dw snd_rising_55                     ;0C8FD6|        |0C926F;
                       dw snd_anxiety_56                    ;0C8FD8|        |0C927D;
                       dw snd_nightmare_57                  ;0C8FDA|        |0C928B;
                       dw snd_deamonseed_58                 ;0C8FDC|        |0C9299;
                       dw snd_Aquarius_59                   ;0C8FDE|        |0C92A7;
                       dw snd_Aquarius2_5A                  ;0C8FE0|        |0C92B5;
                       dw snd_dejavu_5B                     ;0C8FE2|        |0C92C3;
                       dw snd_riddle_5C                     ;0C8FE4|        |0C92D1;
                       dw snd_DejaVu_5D                     ;0C8FE6|        |0C92DF;
                       dw snd_overture_5E                   ;0C8FE8|        |0C92ED;
                       dw snd_bossFight_5F                  ;0C8FEA|        |0C92FB;
                       dw snd_bigBattle_60                  ;0C8FEC|        |0C9309;
                       dw snd_Boss_61                       ;0C8FEE|        |0C9317;
                       dw snd_epithap_62                    ;0C8FF0|        |0C9325;
                       dw snd_blkClear_63                   ;0C8FF2|        |0C9333;
                       dw snd_allClear_64                   ;0C8FF4|        |0C9341;
                       dw snd_gameover_65                   ;0C8FF6|        |0C934F;
                       dw snd_preload_66                    ;0C8FF8|        |0C935D;
                       dw snd_prayer_67                     ;0C8FFA|        |0C936B;
                       dw snd_evergreen_68                  ;0C8FFC|        |0C9379;
                       dw snd_flashBack_69                  ;0C8FFE|        |0C9387;
                       dw snd_pressure_6A                   ;0C9000|        |0C9395;
                       dw snd_partnerChoose_6B              ;0C9002|        |0C93A3;
                       dw snd_destiny_6C                    ;0C9004|        |0C93B1;
                       dw snd_beatLo_6D                     ;0C9006|        |0C93BF;
                       dw snd_beatMi_6E                     ;0C9008|        |0C93C3;
                       dw snd_beatHi_6F                     ;0C900A|        |0C93C7;
                       dw snd_drum_70                       ;0C900C|        |0C93CB;
                       dw snd_drum_71                       ;0C900E|        |0C93CF;
                       dw snd_whip_72                       ;0C9010|        |0C93E7;
                       dw snd_hurtHi_73                     ;0C9012|        |0C93D3;
                       dw snd_hurtMi_74                     ;0C9014|        |0C93D7;
                       dw snd_hurt_Female_75                ;0C9016|        |0C93DB;
                       dw snd_hurtLo_76                     ;0C9018|        |0C93DF;
                       dw snd_lath_77                       ;0C901A|        |0C93E3;
                       dw snd_hurt_Sypha_78                 ;0C901C|        |0C93EB;
                       dw snd_hurt_Alucard_79               ;0C901E|        |0C93EF;
                       dw snd_bossScreamHi_7A               ;0C9020|        |0C93F3;
                       dw snd_bossScreamLo_7B               ;0C9022|        |0C93F7;
                       dw snd_bossScreamMi_7C               ;0C9024|        |0C93FB;
 
               snd_01: db $98,$00,$06                       ;0C9026|        |      ;
                       dw sndTra06_01                       ;0C9029|        |0C93FF;
 
snd_lowHighHatClose_02: db $98,$00,$06                       ;0C902B|        |      ;
                       dw sndTra06_02                       ;0C902E|        |0C9405;
 
snd_HighHiHatHitClosed_03: db $98,$00,$06                       ;0C9030|        |      ;
                       dw sndTra06_03                       ;0C9033|        |0C940B;
 
    snd_RideCymbal_04: db $98,$00,$06                       ;0C9035|        |      ;
                       dw sndTra06_04                       ;0C9038|        |0C9418;
 
  snd_HiHatHitOpen_05: db $98,$00,$06                       ;0C903A|        |      ;
                       dw sndTra06_05                       ;0C903D|        |0C941F;
 
    snd_HiHatClose_06: db $98,$01,$03                       ;0C903F|        |      ;
                       dw sndTra03_06_06                    ;0C9042|        |0C9429;
                       db $06                               ;0C9044|        |      ;
                       dw sndTra03_06_06                    ;0C9045|        |0C9429;
 
              snd__07: db $98,$01,$03                       ;0C9047|        |      ;
                       dw sndTra03_07                       ;0C904A|        |0C9440;
 
                       db $06                               ;0C904C|        |      ;
                       dw sndTra06_07                       ;0C904D|        |0C9497;
 
          snd_Drip_09: db $98,$01,$03                       ;0C904F|        |      ;
                       dw sndTra03_09                       ;0C9052|        |0C94EB;
                       db $06                               ;0C9054|        |      ;
                       dw sndTra06_09                       ;0C9055|        |0C94EC;
 
              snd__0b: db $98,$01,$03                       ;0C9057|        |      ;
                       dw sndTra03_0b                       ;0C905A|        |0C94F5;
                       db $06                               ;0C905C|        |      ;
                       dw sndTra06_0b                       ;0C905D|        |0C9504;
 
              snd__25: db $98,$00,$06                       ;0C905F|        |      ;
                       dw sndTra06_25                       ;0C9062|        |0C9A0E;
 
              snd__20: db $98,$00,$06                       ;0C9064|        |      ;
                       dw sndTra06_20                       ;0C9067|        |0C9A14;
 
              snd__1C: db $98,$00,$03                       ;0C9069|        |      ;
                       dw sndTra03_1C                       ;0C906C|        |0C9518;
 
              snd__0C: db $98,$01,$03                       ;0C906E|        |      ;
                       dw sndTra03_0C                       ;0C9071|        |0C952A;
                       db $06                               ;0C9073|        |      ;
                       dw sndTra06_0C                       ;0C9074|        |0C955D;
 
              snd__34: db $98,$00,$06                       ;0C9076|        |      ;
                       dw sndTra06_34                       ;0C9079|        |0C9575;
 
              snd__13: db $98,$00,$06                       ;0C907B|        |      ;
                       dw sndTra06_13                       ;0C907E|        |0C95BE;
 
              snd__14: db $98,$00,$06                       ;0C9080|        |      ;
                       dw sndTra06_14                       ;0C9083|        |0C95C9;
 
              snd__15: db $98,$00,$06                       ;0C9085|        |      ;
                       dw sndTra06_15                       ;0C9088|        |0C95D3;
 
              snd__16: db $98,$01,$03                       ;0C908A|        |      ;
                       dw sndTra03_16                       ;0C908D|        |0C95E0;
                       db $06                               ;0C908F|        |      ;
                       dw sndTra06_16                       ;0C9090|        |0C9600;
 
              snd__17: db $98,$00,$03                       ;0C9092|        |      ;
                       dw sndTra03_17                       ;0C9095|        |0C9618;
 
              snd__2C: db $98,$00,$03                       ;0C9097|        |      ;
                       dw sndTra03_2c                       ;0C909A|        |0C9670;
 
              snd__18: db $98,$00,$03                       ;0C909C|        |      ;
                       dw sndTra03_18                       ;0C909F|        |0C9693;
 
              snd__1B: db $98,$00,$03                       ;0C90A1|        |      ;
                       dw sndTra03_1B                       ;0C90A4|        |0C96B5;
 
              snd__22: db $98,$00,$06                       ;0C90A6|        |      ;
                       dw sndTra06_22                       ;0C90A9|        |0C97D7;
 
snd_outWaterSplash_23: db $98,$00,$06                       ;0C90AB|        |      ;
                       dw sndTra06_23                       ;0C90AE|        |0C97EB;
 
       snd_landing_0A: db $98,$00,$03                       ;0C90B0|        |      ;
                       dw sndTra03_0A                       ;0C90B3|        |0C942A;
 
snd_IneffectiveAttack_29: db $98,$01,$03                       ;0C90B5|        |      ;
                       dw sndTra03_29                       ;0C90B8|        |0C992B;
                       db $06                               ;0C90BA|        |      ;
                       dw sndTra06_29                       ;0C90BB|        |0C9937;
 
 snd_CritterRassle_33: db $98,$01,$03                       ;0C90BD|        |      ;
                       dw sndTra03_33                       ;0C90C0|        |0C9592;
                       db $06                               ;0C90C2|        |      ;
                       dw sndTra06_33                       ;0C90C3|        |0C9593;
 
       snd_OwlFlap_27: db $98,$01,$03                       ;0C90C5|        |      ;
                       dw sndTra03_27                       ;0C90C8|        |0C96C8;
                       db $06                               ;0C90CA|        |      ;
                       dw sndTra06_27                       ;0C90CB|        |0C96E3;
 
      snd_DoorSlam_2B: db $98,$01,$03                       ;0C90CD|        |      ;
                       dw sndTra03_2B                       ;0C90D0|        |0C96F5;
                       db $06                               ;0C90D2|        |      ;
                       dw sndTra06_2B                       ;0C90D3|        |0C9704;
 
snd_EnemyShattered_28: db $98,$01,$03                       ;0C90D5|        |      ;
                       dw sndTra03_28                       ;0C90D8|        |0C970D;
                       db $06                               ;0C90DA|        |      ;
                       dw sndTra06_28                       ;0C90DB|        |0C972E;
 
  snd_CyclopsPound_2A: db $98,$01,$03                       ;0C90DD|        |      ;
                       dw sndTra03_2A                       ;0C90E0|        |0C9940;
 
                       db $06                               ;0C90E2|        |      ;
                       dw sndTra06_2A                       ;0C90E3|        |0C9973;
 
        snd_Refill_2D: db $98,$00,$06                       ;0C90E5|        |      ;
                       dw sndTra06_2D                       ;0C90E8|        |0C9736;
 
snd_TitleScreenThunder_2E: db $98,$00,$06                       ;0C90EA|        |      ;
                       dw sndTra06_2E                       ;0C90ED|        |0C975F;
 
 snd_PartnerChange_49: db $98,$00,$03                       ;0C90EF|        |      ;
                       dw sndTra03_49                       ;0C90F2|        |0C9778;
 
       snd_Thunder_2F: db $98,$01,$03                       ;0C90F4|        |      ;
                       dw sndTra03_2F                       ;0C90F7|        |0C9798;
                       db $06                               ;0C90F9|        |      ;
                       dw sndTra06_2F                       ;0C90FA|        |0C97C5;
 
              snd__30: db $98,$00,$06                       ;0C90FC|        |      ;
                       dw sndTra06_30                       ;0C90FF|        |0C97FE;
 
              snd__31: db $98,$00,$06                       ;0C9101|        |      ;
                       dw sndTra06_31                       ;0C9104|        |0C9812;
 
 snd_inWaterSplash_24: db $98,$01,$03                       ;0C9106|        |      ;
                       dw sndTra03_24                       ;0C9109|        |0C9821;
                       db $06                               ;0C910B|        |      ;
                       dw sndTra06_24                       ;0C910C|        |0C9853;
 
   snd_MedusaArrow_3C: db $98,$00,$03                       ;0C910E|        |      ;
                       dw sndTra03_3C                       ;0C9111|        |0C985A;
 
     snd_Lightning_1D: db $98,$00,$06                       ;0C9113|        |      ;
                       dw sndTra06_1D                       ;0C9116|        |0C986E;
 
  snd_EmergeSplash_21: db $98,$01,$03                       ;0C9118|        |      ;
                       dw sndTra03_1E_21                    ;0C911B|        |0C988B;
                       db $06                               ;0C911D|        |      ;
                       dw sndTra06_1E_21_35                 ;0C911E|        |0C988C;
 
snd_AlucardFireball_1E: db $98,$01,$03                       ;0C9120|        |      ;
                       dw sndTra03_1E_21                    ;0C9123|        |0C988B;
                       db $06                               ;0C9125|        |      ;
                       dw sndTra06_1E_21_35                 ;0C9126|        |0C988C;
 
  snd_FlowingWater_1F: db $98,$00,$06                       ;0C9128|        |      ;
                       dw sndTra06_1F                       ;0C912B|        |0C98B8;
 
   snd_RiverFreeze_35: db $98,$01,$03                       ;0C912D|        |      ;
                       dw sndTra03_35                       ;0C9130|        |0C9D10;
                       db $06                               ;0C9132|        |      ;
                       dw sndTra06_1E_21_35                 ;0C9133|        |0C988C;
 
 snd_AxeWeaponToss_12: db $98,$01,$03                       ;0C9135|        |      ;
                       dw sndTra03_12                       ;0C9138|        |0C98C3;
                       db $06                               ;0C913A|        |      ;
                       dw sndTra06_12                       ;0C913B|        |0C98CD;
 
  snd_TeeterTotter_36: db $98,$00,$03                       ;0C913D|        |      ;
                       dw sndTra03_36                       ;0C9140|        |0C98E1;
 
      snd_TrapDoor_37: db $98,$01,$03                       ;0C9142|        |      ;
                       dw sndTra03_37_39                    ;0C9145|        |0C9988;
                       db $06                               ;0C9147|        |      ;
                       dw sndTra06_37_39                    ;0C9148|        |0C99BB;
 
              snd__38: db $98,$01,$03                       ;0C914A|        |      ;
                       dw sndTra03_38                       ;0C914D|        |0C99D0;
                       db $06                               ;0C914F|        |      ;
                       dw sndTra06_38                       ;0C9150|        |0C99D1;
 
snd_CollapsingTower_08: db $98,$00,$03                       ;0C9152|        |      ;
                       dw sndTra03_08                       ;0C9155|        |0C99EC;
 
              snd__32: db $98,$00,$06                       ;0C9157|        |      ;
                       dw sndTra06_32                       ;0C915A|        |0C9A02;
 
snd_FrozenEnemyShattered_39: db $98,$01,$03                       ;0C915C|        |      ;
                       dw sndTra03_37_39                    ;0C915F|        |0C9988;
                       db $06                               ;0C9161|        |      ;
                       dw sndTra06_37_39                    ;0C9162|        |0C99BB;
 
              snd__0F: db $98,$01,$03                       ;0C9164|        |      ;
                       dw sndTra03_0F                       ;0C9167|        |0C9A1A;
                       db $06                               ;0C9169|        |      ;
                       dw sndTra06_0F                       ;0C916A|        |0C9A2E;
 
              snd__3A: db $98,$01,$03                       ;0C916C|        |      ;
                       dw sndTra03_3A                       ;0C916F|        |0C9A2F;
                       db $06                               ;0C9171|        |      ;
                       dw sndTra06_3A                       ;0C9172|        |0C9A3B;
 
              snd__11: db $98,$01,$03                       ;0C9174|        |      ;
                       dw sndTra03_11                       ;0C9177|        |0C990E;
                       db $06                               ;0C9179|        |      ;
                       dw sndTra06_11                       ;0C917A|        |0C9918;
 
              snd__3B: db $98,$01,$03                       ;0C917C|        |      ;
                       dw sndTra03_3B                       ;0C917F|        |0C9A4D;
                       db $06                               ;0C9181|        |      ;
                       dw sndTra06_3B                       ;0C9182|        |0C9A59;
 
              snd__26: db $98,$00,$06                       ;0C9184|        |      ;
                       dw sndTra06_26                       ;0C9187|        |0C9A6B;
 
 
              snd__0D: db $98,$00,$03                       ;0C9189|        |      ;
                       dw sndTra03_0D                       ;0C918C|        |0C9A93;
 
              snd__0E: db $98,$00,$06                       ;0C918E|        |      ;
                       dw sndTra06_0E                       ;0C9191|        |0C9AA4;
 
     snd_ClockTick_3D: db $98,$01,$03                       ;0C9193|        |      ;
                       dw sndTra03_3D                       ;0C9196|        |0C9ACA;
                       db $06                               ;0C9198|        |      ;
                       dw sndTra06_3D                       ;0C9199|        |0C9ADE;
 
   snd_flameSplash_43: db $98,$01,$03                       ;0C919B|        |      ;
                       dw sndTra03_43                       ;0C919E|        |0C9BEC;
                       db $06                               ;0C91A0|        |      ;
                       dw sndTra06_43                       ;0C91A1|        |0C9BFF;
 
              snd__46: db $98,$00,$03                       ;0C91A3|        |      ;
                       dw sndTra03_46                       ;0C91A6|        |0C9AE4;
 
snd_SunkenRoomQuake_3E: db $98,$01,$03                       ;0C91A8|        |      ;
                       dw sndTra03_3E                       ;0C91AB|        |0C9C7E;
                       db $06                               ;0C91AD|        |      ;
                       dw sndTra06_3E                       ;0C91AE|        |0C9C7F;
 
              snd__1A: db $98,$00,$03                       ;0C91B0|        |      ;
                       dw sndTra03_1A                       ;0C91B3|        |0C9C98;
 
       snd_GetCash_19: db $98,$00,$03                       ;0C91B5|        |      ;
                       dw sndTra03_19                       ;0C91B8|        |0C9CBE;
 
              snd__3F: db $98,$01,$03                       ;0C91BA|        |      ;
                       dw sndTra03_3F                       ;0C91BD|        |0C9CE6;
                       db $06                               ;0C91BF|        |      ;
                       dw sndTra06_3F                       ;0C91C0|        |0C9CE7;
 
              snd__40: db $98,$00,$03                       ;0C91C2|        |      ;
                       dw sndTra03_40                       ;0C91C5|        |0C9B5C;
 
  snd_MudManAppear_10: db $98,$01,$03                       ;0C91C7|        |      ;
                       dw sndTra03_10                       ;0C91CA|        |0C9B74;
                       db $06                               ;0C91CC|        |      ;
                       dw sndTra06_10                       ;0C91CD|        |0C9B99;
 
              snd__41: db $98,$00,$03                       ;0C91CF|        |      ;
                       dw sndTra03_41                       ;0C91D2|        |0C9B9A;
 
              snd__42: db $98,$00,$06                       ;0C91D4|        |      ;
                       dw sndTra06_41                       ;0C91D7|        |0C9BCF;
 
              snd__48: db $98,$01,$03                       ;0C91D9|        |      ;
                       dw sndTra03_48                       ;0C91DC|        |0C9C18;
                       db $06                               ;0C91DE|        |      ;
                       dw sndTra06_48                       ;0C91DF|        |0C9C5B;
 
              snd__44: db $98,$01,$03                       ;0C91E1|        |      ;
                       dw sndTra03_44                       ;0C91E4|        |0C9D3E;
                       db $06                               ;0C91E6|        |      ;
                       dw sndTra06_44                       ;0C91E7|        |0C9D59;
 
              snd__45: db $98,$00,$03                       ;0C91E9|        |      ;
                       dw sndTra03_45                       ;0C91EC|        |0C9D6A;
 
              snd__47: db $98,$01,$03                       ;0C91EE|        |      ;
                       dw sndTra03_47                       ;0C91F1|        |0C9D87;
                       db $06                               ;0C91F3|        |      ;
                       dw sndTra06_47                       ;0C91F4|        |0C9DAC;
 
  snd_RosseryClear_4A: db $98,$00,$03                       ;0C91F6|        |      ;
                       dw sndTra03_4A                       ;0C91F9|        |0C9646;
 
         snd_OneUp_4B: db $98,$01,$03                       ;0C91FB|        |      ;
                       dw sndTra03_4B                       ;0C91FE|        |0C95A5;
                       db $06                               ;0C9200|        |      ;
                       dw sndTra06_4B                       ;0C9201|        |0C95BD;
 
  snd_MemberAccept_4C: db $98,$00,$03                       ;0C9203|        |      ;
                       dw sndTra03_4C                       ;0C9206|        |0C9DC4;
 
         snd_pause_4D: db $98,$00,$03                       ;0C9208|        |      ;
                       dw sndTra03_4D                       ;0C920B|        |0C9E08;
 
         snd_death_4E: db $8A,$03,$00                       ;0C920D|        |      ;
                       dw sndTra00_death_4E                 ;0C9210|        |06875E;
                       db $01                               ;0C9212|        |      ;
                       dw sndTra01_death_4E                 ;0C9213|        |068776;
                       db $02                               ;0C9215|        |      ;
                       dw sndTra02_death_4E                 ;0C9216|        |06878D;
                       db $05                               ;0C9218|        |      ;
                       dw sndTra05_death_4E                 ;0C9219|        |06879E;
 
     snd_beginning_4F: db $8A,$03,$00                       ;0C921B|        |      ;
                       dw sndTra00_beginning_4F             ;0C921E|        |0687AC;
                       db $01                               ;0C9220|        |      ;
                       dw sndTra01_beginning_4F             ;0C9221|        |068A7F;
                       db $02                               ;0C9223|        |      ;
                       dw sndTra02_beginning_4F             ;0C9224|        |068C75;
                       db $05                               ;0C9226|        |      ;
                       dw sndTra05_beginning_4F             ;0C9227|        |068E43;
 
     snd_madForest_50: db $8A,$03,$00                       ;0C9229|        |      ;
                       dw sndTra00_madForest_50             ;0C922C|        |068FBE;
                       db $01                               ;0C922E|        |      ;
                       dw sndTra01_madForest_50             ;0C922F|        |069184;
                       db $02                               ;0C9231|        |      ;
                       dw sndTra02_madForest_50             ;0C9232|        |06931C;
                       db $05                               ;0C9234|        |      ;
                       dw sndTra05_madForest_50             ;0C9235|        |0694A4;
 
        snd_stream_51: db $8A,$03,$00                       ;0C9237|        |      ;
                       dw sndTra00_stream_51                ;0C923A|        |069576;
                       db $01                               ;0C923C|        |      ;
                       dw sndTra01_stream_51                ;0C923D|        |0696FD;
                       db $02                               ;0C923F|        |      ;
                       dw sndTra02_stream_51                ;0C9240|        |069868;
                       db $05                               ;0C9242|        |      ;
                       dw sndTra05_stream_51                ;0C9243|        |06996D;
 
      snd_deadBeat_52: db $8A,$03,$00                       ;0C9245|        |      ;
                       dw sndTra00_deadBeat_52              ;0C9248|        |069A03;
                       db $01                               ;0C924A|        |      ;
                       dw sndTra01_deadBeat_52              ;0C924B|        |069B5B;
                       db $02                               ;0C924D|        |      ;
                       dw sndTra02_deadBeat_52              ;0C924E|        |069CCD;
                       db $05                               ;0C9250|        |      ;
                       dw sndTra05_deadBeat_52              ;0C9251|        |069E01;
 
     snd_clockWork_53: db $8A,$03,$00                       ;0C9253|        |      ;
                       dw sndTra00_clockWork_53             ;0C9256|        |069E02;
                       db $01                               ;0C9258|        |      ;
                       dw sndTra01_clockWork_53             ;0C9259|        |069FE6;
                       db $02                               ;0C925B|        |      ;
                       dw sndTra02_clockWork_53             ;0C925C|        |06A147;
                       db $05                               ;0C925E|        |      ;
                       dw sndTra05_clockWork_53             ;0C925F|        |06A1E2;
 
      snd_aquarius_54: db $8A,$03,$00                       ;0C9261|        |      ;
                       dw sndTra00_aquarius_54_5A           ;0C9264|        |06A1E3;
                       db $01                               ;0C9266|        |      ;
                       dw sndTra01_aquarius_54_5A           ;0C9267|        |06A335;
                       db $02                               ;0C9269|        |      ;
                       dw sndTra02_aquarius_54_5A           ;0C926A|        |06A4C6;
                       db $05                               ;0C926C|        |      ;
                       dw sndTra05_aquarius_54_5A           ;0C926D|        |06A624;
 
        snd_rising_55: db $8A,$03,$00                       ;0C926F|        |      ;
                       dw sndTra00_rising_55                ;0C9272|        |06A6F2;
                       db $01                               ;0C9274|        |      ;
                       dw sndTra01_rising_55                ;0C9275|        |06AA48;
                       db $02                               ;0C9277|        |      ;
                       dw sndTra02_rising_55                ;0C9278|        |06ACC5;
                       db $05                               ;0C927A|        |      ;
                       dw sndTra03_rising_55                ;0C927B|        |06ADAA;
 
       snd_anxiety_56: db $8A,$03,$00                       ;0C927D|        |      ;
                       dw sndTra00_anxiety_56_59            ;0C9280|        |06AE3C;
                       db $01                               ;0C9282|        |      ;
                       dw sndTra01_anxiety_56_59            ;0C9283|        |06AFE0;
                       db $02                               ;0C9285|        |      ;
                       dw sndTra02_anxiety_56_59            ;0C9286|        |06B14D;
                       db $05                               ;0C9288|        |      ;
                       dw sndTra05_anxiety_56_59            ;0C9289|        |06B201;
 
     snd_nightmare_57: db $8A,$03,$00                       ;0C928B|        |      ;
                       dw sndTra00_nightMare_57             ;0C928E|        |06B2CD;
                       db $01                               ;0C9290|        |      ;
                       dw sndTra01_nightMare_57             ;0C9291|        |06B376;
                       db $02                               ;0C9293|        |      ;
                       dw sndTra02_nightMare_57             ;0C9294|        |06B40E;
                       db $05                               ;0C9296|        |      ;
                       dw sndTra05_nightMare_57             ;0C9297|        |06B474;
 
    snd_deamonseed_58: db $88,$03,$00                       ;0C9299|        |      ;
                       dw sndTra00_deamonSeed_58            ;0C929C|        |0488C9;
                       db $01                               ;0C929E|        |      ;
                       dw sndTra01_deamonSeed_58            ;0C929F|        |048A2F;
                       db $02                               ;0C92A1|        |      ;
                       dw sndTra02_deamonSeed_58            ;0C92A2|        |048BBD;
                       db $05                               ;0C92A4|        |      ;
                       dw sndTra05_deamonSeed_58            ;0C92A5|        |048C5B;
 
      snd_Aquarius_59: db $8A,$03,$00                       ;0C92A7|        |      ;
                       dw sndTra00_anxiety_56_59            ;0C92AA|        |06AE3C;
                       db $01                               ;0C92AC|        |      ;
                       dw sndTra01_anxiety_56_59            ;0C92AD|        |06AFE0;
                       db $02                               ;0C92AF|        |      ;
                       dw sndTra02_anxiety_56_59            ;0C92B0|        |06B14D;
                       db $05                               ;0C92B2|        |      ;
                       dw sndTra05_anxiety_56_59            ;0C92B3|        |06B201;
 
     snd_Aquarius2_5A: db $8A,$03,$00                       ;0C92B5|        |      ;
                       dw sndTra00_aquarius_54_5A           ;0C92B8|        |06A1E3;
                       db $01                               ;0C92BA|        |      ;
                       dw sndTra01_aquarius_54_5A           ;0C92BB|        |06A335;
                       db $02                               ;0C92BD|        |      ;
                       dw sndTra02_aquarius_54_5A           ;0C92BE|        |06A4C6;
                       db $05                               ;0C92C0|        |      ;
                       dw sndTra05_aquarius_54_5A           ;0C92C1|        |06A624;
 
        snd_dejavu_5B: db $88,$03,$00                       ;0C92C3|        |      ;
                       dw sndTra00_dejavu_5B                ;0C92C6|        |048D13;
                       db $01                               ;0C92C8|        |      ;
                       dw sndTra01_dejavu_5B                ;0C92C9|        |048E38;
                       db $02                               ;0C92CB|        |      ;
                       dw sndTra02_dejavu_5B                ;0C92CC|        |048EE4;
                       db $05                               ;0C92CE|        |      ;
                       dw sndTra05_dejavu_5B                ;0C92CF|        |048F8E;
 
        snd_riddle_5C: db $88,$03,$00                       ;0C92D1|        |      ;
                       dw sndTra00_riddle_5C                ;0C92D4|        |049026;
                       db $01                               ;0C92D6|        |      ;
                       dw sndTra01_riddle_5C                ;0C92D7|        |04922F;
                       db $02                               ;0C92D9|        |      ;
                       dw sndTra02_riddle_5C                ;0C92DA|        |049385;
                       db $05                               ;0C92DC|        |      ;
                       dw sndTra05_riddle_5C                ;0C92DD|        |049478;
 
        snd_DejaVu_5D: db $88,$03,$00                       ;0C92DF|        |      ;
                       dw sndTra00_DejaVu_5D_6A             ;0C92E2|        |04AC5F;
                       db $01                               ;0C92E4|        |      ;
                       dw sndTra01_DejaVu_5D_6A             ;0C92E5|        |04AC9A;
                       db $02                               ;0C92E7|        |      ;
                       dw sndTra02_DejaVu_5D_6A             ;0C92E8|        |04ACDE;
                       db $05                               ;0C92EA|        |      ;
                       dw sndTra05_DejaVu_5D_6A             ;0C92EB|        |04AD0B;
 
      snd_overture_5E: db $88,$03,$00                       ;0C92ED|        |      ;
                       dw sndTra00_overture_5E              ;0C92F0|        |049522;
                       db $01                               ;0C92F2|        |      ;
                       dw sndTra01_overture_5E              ;0C92F3|        |0497C6;
                       db $02                               ;0C92F5|        |      ;
                       dw sndTra02_overture_5E              ;0C92F6|        |0499A2;
                       db $05                               ;0C92F8|        |      ;
                       dw sndTra05_overture_5E              ;0C92F9|        |049A6E;
 
     snd_bossFight_5F: db $88,$03,$00                       ;0C92FB|        |      ;
                       dw sndTra00_bossFight_5F             ;0C92FE|        |049CF3;
                       db $01                               ;0C9300|        |      ;
                       dw sndTra01_bossFight_5F             ;0C9301|        |049E98;
                       db $02                               ;0C9303|        |      ;
                       dw sndTra02_bossFight_5F             ;0C9304|        |04A022;
                       db $05                               ;0C9306|        |      ;
                       dw sndTra05_bossFight_5F             ;0C9307|        |04A0E5;
 
     snd_bigBattle_60: db $88,$03,$00                       ;0C9309|        |      ;
                       dw sndTra00_bigBattle_60             ;0C930C|        |04A17D;
                       db $01                               ;0C930E|        |      ;
                       dw sndTra01_bigBattle_60             ;0C930F|        |04A303;
                       db $02                               ;0C9311|        |      ;
                       dw sndTra02_bigBattle_60             ;0C9312|        |04A4F7;
                       db $05                               ;0C9314|        |      ;
                       dw sndTra05_bigBattle_60             ;0C9315|        |04A589;
 
          snd_Boss_61: db $88,$03,$00                       ;0C9317|        |      ;
                       dw sndTra00_boss_61                  ;0C931A|        |04A658;
                       db $01                               ;0C931C|        |      ;
                       dw sndTra01_boss_61                  ;0C931D|        |04A65D;
                       db $02                               ;0C931F|        |      ;
                       dw sndTra02_boss_61                  ;0C9320|        |04A662;
                       db $05                               ;0C9322|        |      ;
                       dw sndTra05_boss_61                  ;0C9323|        |04A58F;
 
       snd_epithap_62: db $88,$03,$00                       ;0C9325|        |      ;
                       dw sndTra00_epithap_62               ;0C9328|        |04A667;
                       db $01                               ;0C932A|        |      ;
                       dw sndTra01_epithap_62               ;0C932B|        |04A737;
                       db $02                               ;0C932D|        |      ;
                       dw sndTra02_epithap_62               ;0C932E|        |04A778;
                       db $05                               ;0C9330|        |      ;
                       dw sndTra05_epithap_62               ;0C9331|        |04A79B;
 
      snd_blkClear_63: db $88,$03,$00                       ;0C9333|        |      ;
                       dw sndTra00_blkClear_63              ;0C9336|        |04875E;
                       db $01                               ;0C9338|        |      ;
                       dw sndTra01_blkClear_63              ;0C9339|        |048787;
                       db $02                               ;0C933B|        |      ;
                       dw sndTra02_blkClear_63              ;0C933C|        |0487B5;
                       db $05                               ;0C933E|        |      ;
                       dw sndTra05_blkClear_63              ;0C933F|        |0487E6;
 
      snd_allClear_64: db $88,$03,$00                       ;0C9341|        |      ;
                       dw sndTra00_allClear_64              ;0C9344|        |049BD2;
                       db $01                               ;0C9346|        |      ;
                       dw sndTra01_allClear_64              ;0C9347|        |049C31;
                       db $02                               ;0C9349|        |      ;
                       dw sndTra02_allClear_64              ;0C934A|        |049C75;
                       db $05                               ;0C934C|        |      ;
                       dw sndTra05_allClear_64              ;0C934D|        |049CD3;
 
      snd_gameover_65: db $88,$03,$00                       ;0C934F|        |      ;
                       dw sndTra00_gameover_65              ;0C9352|        |0487FF;
                       db $01                               ;0C9354|        |      ;
                       dw sndTra01_gameover_65              ;0C9355|        |048852;
                       db $02                               ;0C9357|        |      ;
                       dw sndTra02_gameover_65              ;0C9358|        |048880;
                       db $05                               ;0C935A|        |      ;
                       dw sndTra05_gameover_65              ;0C935B|        |0488A9;
 
       snd_preload_66: db $88,$03,$00                       ;0C935D|        |      ;
                       dw sndTra00_preload_66               ;0C9360|        |04A7D8;
                       db $01                               ;0C9362|        |      ;
                       dw sndTra01_preload_66               ;0C9363|        |04AA73;
                       db $02                               ;0C9365|        |      ;
                       dw sndTra02_preload_66               ;0C9366|        |04ABC1;
                       db $05                               ;0C9368|        |      ;
                       dw sndTra05_preload_66               ;0C9369|        |04AC5E;
 
        snd_prayer_67: db $8A,$03,$00                       ;0C936B|        |      ;
                       dw sndTra00_prayer_67                ;0C936E|        |06B7A2;
                       db $01                               ;0C9370|        |      ;
                       dw sndTra01_prayer_67                ;0C9371|        |06B7C9;
                       db $02                               ;0C9373|        |      ;
                       dw sndTra02_prayer_67                ;0C9374|        |06B818;
                       db $05                               ;0C9376|        |      ;
                       dw sndTra05_prayer_67                ;0C9377|        |06B830;
 
     snd_evergreen_68: db $88,$03,$00                       ;0C9379|        |      ;
                       dw sndTra00_evergreen_68             ;0C937C|        |04AEAB;
                       db $01                               ;0C937E|        |      ;
                       dw sndTra01_evergreen_68             ;0C937F|        |04AFE7;
                       db $02                               ;0C9381|        |      ;
                       dw sndTra02_evergreen_68             ;0C9382|        |04B125;
                       db $05                               ;0C9384|        |      ;
                       dw sndTra05_evergreen_68             ;0C9385|        |04B1B3;
 
     snd_flashBack_69: db $8A,$03,$00                       ;0C9387|        |      ;
                       dw sndTra00_flashBack_69             ;0C938A|        |06B475;
                       db $01                               ;0C938C|        |      ;
                       dw sndTra01_flashBack_69             ;0C938D|        |06B5EA;
                       db $02                               ;0C938F|        |      ;
                       dw sndTra02_flashBack_69             ;0C9390|        |06B691;
                       db $05                               ;0C9392|        |      ;
                       dw sndTra05_flashBack_69             ;0C9393|        |06B749;
 
      snd_pressure_6A: db $88,$03,$00                       ;0C9395|        |      ;
                       dw sndTra00_DejaVu_5D_6A             ;0C9398|        |04AC5F;
                       db $01                               ;0C939A|        |      ;
                       dw sndTra01_DejaVu_5D_6A             ;0C939B|        |04AC9A;
                       db $02                               ;0C939D|        |      ;
                       dw sndTra02_DejaVu_5D_6A             ;0C939E|        |04ACDE;
                       db $05                               ;0C93A0|        |      ;
                       dw sndTra05_DejaVu_5D_6A             ;0C93A1|        |04AD0B;
 
 snd_partnerChoose_6B: db $88,$03,$00                       ;0C93A3|        |      ;
                       dw sndTra00_partnerChoose_6B         ;0C93A6|        |04AD6A;
                       db $01                               ;0C93A8|        |      ;
                       dw sndTra01_partnerChoose_6B         ;0C93A9|        |04AD4C;
                       db $02                               ;0C93AB|        |      ;
                       dw sndTra02_partnerChoose_6B         ;0C93AC|        |04ADB5;
                       db $05                               ;0C93AE|        |      ;
                       dw sndTra05_partnerChoose_6B         ;0C93AF|        |04ADC3;
 
       snd_destiny_6C: db $88,$03,$00                       ;0C93B1|        |      ;
                       dw sndTra00_destiny_6C               ;0C93B4|        |04ADC4;
                       db $01                               ;0C93B6|        |      ;
                       dw sndTra01_destiny_6C               ;0C93B7|        |04AE24;
                       db $02                               ;0C93B9|        |      ;
                       dw sndTra02_destiny_6C               ;0C93BA|        |04AE6E;
                       db $05                               ;0C93BC|        |      ;
                       dw sndTra05_destiny_6C               ;0C93BD|        |04AEAA;
 
        snd_beatLo_6D: db $00,$07                           ;0C93BF|        |      ; are samples using this??
                       dw $A150                             ;0C93C1|        |      ;
 
        snd_beatMi_6E: db $00,$07                           ;0C93C3|        |      ;
                       dw $A154                             ;0C93C5|        |      ;
 
        snd_beatHi_6F: db $00,$07                           ;0C93C7|        |      ;
                       dw $A158                             ;0C93C9|        |      ;
 
          snd_drum_70: db $00,$07                           ;0C93CB|        |      ;
                       dw $A15C                             ;0C93CD|        |      ;
 
          snd_drum_71: db $00,$07                           ;0C93CF|        |      ;
                       dw $A160                             ;0C93D1|        |      ;
 
        snd_hurtHi_73: db $00,$07                           ;0C93D3|        |      ;
                       dw $A168                             ;0C93D5|        |      ;
 
        snd_hurtMi_74: db $00,$07                           ;0C93D7|        |      ;
                       dw $A16C                             ;0C93D9|        |      ;
 
   snd_hurt_Female_75: db $00,$07                           ;0C93DB|        |      ;
                       dw $A170                             ;0C93DD|        |      ;
 
        snd_hurtLo_76: db $00,$07                           ;0C93DF|        |      ;
                       dw $A174                             ;0C93E1|        |      ;
 
          snd_lath_77: db $00,$07                           ;0C93E3|        |      ;
                       dw $A178                             ;0C93E5|        |      ;
 
          snd_whip_72: db $00,$07                           ;0C93E7|        |      ;
                       dw $A164                             ;0C93E9|        |      ;
 
    snd_hurt_Sypha_78: db $00,$07                           ;0C93EB|        |      ;
                       dw $A17C                             ;0C93ED|        |      ;
 
  snd_hurt_Alucard_79: db $00,$07                           ;0C93EF|        |      ;
                       dw $A180                             ;0C93F1|        |      ;
 
  snd_bossScreamHi_7A: db $00,$07                           ;0C93F3|        |      ;
                       dw $A184                             ;0C93F5|        |      ;
 
  snd_bossScreamLo_7B: db $00,$07                           ;0C93F7|        |      ;
                       dw $A188                             ;0C93F9|        |      ;
 
  snd_bossScreamMi_7C: db $00,$07                           ;0C93FB|        |      ;
                       dw $A18C                             ;0C93FD|        |      ;
 
          sndTra06_01: db $01,$5D,$49,$39,$19,$FF           ;0C93FF|        |      ;
 
          sndTra06_02: db $01,$65,$24,$21,$11,$FF           ;0C9405|        |      ;
 
          sndTra06_03: db $01,$A2,$A1,$71,$61,$61,$50,$51   ;0C940B|        |      ;
                       db $50,$51,$50,$41,$FF               ;0C9413|        |      ;
 
          sndTra06_04: db $01,$B6,$96,$76,$54,$36,$FF       ;0C9418|        |      ;
 
          sndTra06_05: db $01,$EE,$86,$34,$33,$24,$13,$12   ;0C941F|        |      ;
                       db $12,$FF                           ;0C9427|        |      ;
 
       sndTra03_06_06: db $FF                               ;0C9429|        |      ;
 
          sndTra03_0A: db $03,$70,$81,$82,$00,$22,$00,$03   ;0C942A|        |      ;
                       db $B0,$81,$80,$E0,$03,$B0,$8A,$40   ;0C9432|        |      ;
                       db $F0,$21,$D4,$12,$1A,$FF           ;0C943A|        |      ;
 
          sndTra03_07: db $02,$B0,$82,$FB,$53,$00,$51,$00   ;0C9440|        |      ;
                       db $52,$00,$54,$00,$53,$00,$51,$00   ;0C9448|        |      ;
                       db $52,$00,$54,$00,$FE,$0E,$33,$00   ;0C9450|        |      ;
                       db $31,$00,$32,$00,$34,$00,$33,$00   ;0C9458|        |      ;
                       db $31,$00,$32,$00,$34,$00,$23,$00   ;0C9460|        |      ;
                       db $21,$00,$22,$00,$24,$00,$23,$00   ;0C9468|        |      ;
                       db $21,$00,$22,$00,$24,$00,$13,$00   ;0C9470|        |      ;
                       db $11,$00,$12,$00,$14,$00,$13,$00   ;0C9478|        |      ;
                       db $11,$00,$12,$00,$14,$00,$13,$00   ;0C9480|        |      ;
                       db $11,$00,$12,$00,$14,$00,$13,$00   ;0C9488|        |      ;
                       db $11,$00,$12,$00,$14,$00,$FF       ;0C9490|        |      ;
 
          sndTra06_07: db $01,$BC,$2D,$3D,$4C,$5E,$6E,$7F   ;0C9497|        |      ;
                       db $8E,$9B,$9F,$9D,$9C,$BF,$BF,$BE   ;0C949F|        |      ;
                       db $BF,$FB,$BC,$BD,$BD,$5C,$BE,$BE   ;0C94A7|        |      ;
                       db $BF,$BE,$FE,$10,$FB,$8B,$8F,$8D   ;0C94AF|        |      ;
                       db $8C,$5F,$3D,$BE,$5D,$FE,$08,$3F   ;0C94B7|        |      ;
                       db $BF,$02,$4F,$BF,$8D,$BF,$AF,$8E   ;0C94BF|        |      ;
                       db $3F,$7E,$4F,$3D,$AF,$2E,$5D,$4F   ;0C94C7|        |      ;
                       db $6E,$3F,$8E,$5F,$7E,$03,$6D,$3E   ;0C94CF|        |      ;
                       db $7F,$3E,$7E,$2D,$5F,$2E,$4F,$2F   ;0C94D7|        |      ;
                       db $3E,$2E,$3F,$1E,$2E,$2F,$1E,$2E   ;0C94DF|        |      ;
                       db $1E,$1F,$1F,$FF                   ;0C94E7|        |      ;
 
          sndTra03_09: db $FF                               ;0C94EB|        |      ;
 
          sndTra06_09: db $02,$8D,$01,$00,$00,$02,$8A,$33   ;0C94EC|        |      ;
                       db $FF                               ;0C94F4|        |      ;
 
          sndTra03_0b: db $01,$30,$88,$30,$F0,$00,$00,$01   ;0C94F5|        |      ;
                       db $F0,$88,$20,$0A,$10,$0B,$FF       ;0C94FD|        |      ;
 
          sndTra06_0b: db $01,$AE,$00,$00,$01,$AA,$93,$FF   ;0C9504|        |      ;
                       db $FF,$01,$41,$73,$B5,$E7,$02,$48   ;0C950C|        |      ;
                       db $F6,$34,$F2,$FF                   ;0C9514|        |      ;
 
          sndTra03_1C: db $07,$B0,$9B,$B0,$55,$81,$00,$70   ;0C9518|        |      ;
                       db $88,$51,$00,$31,$22,$21,$44,$11   ;0C9520|        |      ;
                       db $66,$FF                           ;0C9528|        |      ;
 
          sndTra03_0C: db $04,$70,$8A,$00,$01,$70,$8A,$D3   ;0C952A|        |      ;
                       db $CC,$83,$55,$B3,$CC,$63,$55,$93   ;0C9532|        |      ;
                       db $CC,$33,$55,$03,$B0,$82,$D1,$66   ;0C953A|        |      ;
                       db $D1,$99,$C1,$66,$B1,$99,$A1,$66   ;0C9542|        |      ;
                       db $91,$99,$81,$66,$71,$99,$51,$66   ;0C954A|        |      ;
                       db $31,$99,$21,$66,$21,$99,$11,$66   ;0C9552|        |      ;
                       db $11,$99,$FF                       ;0C955A|        |      ;
 
          sndTra06_0C: db $04,$00,$01,$00,$01,$BD,$03,$8F   ;0C955D|        |      ;
                       db $78,$6F,$02,$48,$6F,$48,$2F,$28   ;0C9565|        |      ;
                       db $1F,$18,$1F,$18,$1F,$18,$1F,$FF   ;0C956D|        |      ;
 
          sndTra06_34: db $01,$D9,$02,$BE,$AF,$04,$CA,$C8   ;0C9575|        |      ;
                       db $01,$00,$06,$86,$01,$00,$05,$64   ;0C957D|        |      ;
                       db $01,$00,$04,$33,$01,$00,$03,$12   ;0C9585|        |      ;
                       db $01,$00,$02,$11,$FF               ;0C958D|        |      ;
 
          sndTra03_33: db $FF                               ;0C9592|        |      ;
 
          sndTra06_33: db $05,$BD,$01,$BA,$BD,$BC,$BB,$BA   ;0C9593|        |      ;
                       db $B9,$B8,$B7,$C6,$C5,$A4,$A3,$A2   ;0C959B|        |      ;
                       db $A1,$FF                           ;0C95A3|        |      ;
 
          sndTra03_4B: db $05,$B0,$88,$B0,$64,$B0,$4B,$B0   ;0C95A5|        |      ;
                       db $3C,$B0,$4B,$B0,$3C,$B0,$64,$B0   ;0C95AD|        |      ;
                       db $25,$00,$40,$25,$00,$10,$25,$FF   ;0C95B5|        |      ;
 
          sndTra06_4B: db $FF                               ;0C95BD|        |      ;
 
          sndTra06_13: db $01,$41,$73,$B5,$D7,$02,$38,$C6   ;0C95BE|        |      ;
                       db $24,$C2,$FF                       ;0C95C6|        |      ;
 
          sndTra06_14: db $01,$00,$40,$81,$92,$D6,$8B,$5B   ;0C95C9|        |      ;
                       db $3C,$FF                           ;0C95D1|        |      ;
 
          sndTra06_15: db $01,$11,$33,$65,$97,$02,$18,$A6   ;0C95D3|        |      ;
                       db $14,$A1,$00,$00,$FF               ;0C95DB|        |      ;
 
          sndTra03_16: db $03,$B0,$88,$C0,$15,$C0,$10,$C0   ;0C95E0|        |      ;
                       db $2A,$C0,$20,$02,$B0,$88,$00,$03   ;0C95E8|        |      ;
                       db $B0,$88,$B0,$10,$B0,$0A,$B0,$25   ;0C95F0|        |      ;
                       db $B0,$1A,$00,$90,$15,$90,$10,$FF   ;0C95F8|        |      ;
 
          sndTra06_16: db $03,$C4,$C4,$C4,$00,$C4,$BD,$BF   ;0C9600|        |      ;
                       db $BE,$BF,$BD,$8F,$8E,$8F,$BE,$BE   ;0C9608|        |      ;
                       db $BF,$AE,$AF,$AD,$9F,$9E,$8D,$FF   ;0C9610|        |      ;
 
          sndTra03_17: db $03,$B0,$89,$10,$60,$20,$60,$30   ;0C9618|        |      ;
                       db $60,$30,$60,$40,$60,$40,$60,$50   ;0C9620|        |      ;
 
                       db $60,$60,$60,$70,$60,$80,$60,$90   ;0C9628|        |      ;
                       db $60,$A0,$60,$B0,$60,$C0,$60,$80   ;0C9630|        |      ;
                       db $60,$60,$60,$50,$60,$40,$60,$30   ;0C9638|        |      ;
 
                       db $60,$20,$60,$10,$60,$FF           ;0C9640|        |      ;
 
          sndTra03_4A: db $02,$B0,$8B,$FB,$E0,$35,$EA,$83   ;0C9646|        |      ;
                       db $F0,$7F,$EA,$8B,$E0,$35,$EA,$83   ;0C964E|        |      ;
                       db $B0,$7F,$EA,$8B,$90,$35,$EA,$83   ;0C9656|        |      ;
                       db $70,$7F,$EA,$8B,$50,$35,$EA,$83   ;0C965E|        |      ;
                       db $30,$7F,$08,$B0,$8B,$10,$35,$FE   ;0C9666|        |      ;
                       db $02,$FF                           ;0C966E|        |      ;
 
          sndTra03_2c: db $02,$B0,$9A,$11,$C0,$31,$80,$51   ;0C9670|        |      ;
                       db $40,$71,$00,$90,$C0,$B0,$80,$07   ;0C9678|        |      ;
                       db $B0,$9A,$C0,$E0,$A0,$E0,$80,$E0   ;0C9680|        |      ;
                       db $60,$E0,$40,$E0,$30,$E0,$20,$E0   ;0C9688|        |      ;
 
                       db $10,$E0,$FF                       ;0C9690|        |      ;
 
          sndTra03_18: db $04,$30,$8B,$C0,$98,$B0,$43,$A0   ;0C9693|        |      ;
                       db $AD,$90,$EE,$80,$BC,$70,$54,$60   ;0C969B|        |      ;
                       db $B4,$50,$A7,$40,$3F,$30,$67,$30   ;0C96A3|        |      ;
                       db $AA,$20,$99,$20,$6F,$10,$93,$10   ;0C96AB|        |      ;
                       db $77,$FF                           ;0C96B3|        |      ;
 
          sndTra03_1B: db $0B,$B0,$92,$B0,$50,$07,$B0,$8B   ;0C96B5|        |      ;
                       db $A0,$80,$80,$80,$40,$80,$20,$80   ;0C96BD|        |      ;
                       db $10,$80,$FF                       ;0C96C5|        |      ;
 
          sndTra03_27: db $01,$30,$88,$30,$10,$30,$20,$30   ;0C96C8|        |      ;
                       db $10,$00,$02,$B0,$88,$30,$1F,$20   ;0C96D0|        |      ;
                       db $1A,$00,$20,$1F,$00,$10,$1D,$00   ;0C96D8|        |      ;
                       db $10,$1D,$FF                       ;0C96E0|        |      ;
 
          sndTra06_27: db $05,$BD,$01,$BA,$BD,$BC,$CB,$CA   ;0C96E3|        |      ;
                       db $C9,$C8,$C7,$B6,$B5,$C4,$C3,$C2   ;0C96EB|        |      ;
                       db $C1,$FF                           ;0C96F3|        |      ;
 
          sndTra03_2B: db $01,$22,$9D,$22,$10,$10,$30,$20   ;0C96F5|        |      ;
                       db $50,$40,$70,$A6,$11,$00,$FF       ;0C96FD|        |      ;
 
          sndTra06_2B: db $03,$BF,$BF,$AE,$BF,$B1,$B2,$B3   ;0C9704|        |      ;
                       db $FF                               ;0C970C|        |      ;
 
          sndTra03_28: db $01,$70,$88,$ED,$1A,$60,$40,$60   ;0C970D|        |      ;
                       db $80,$01,$70,$88,$90,$31,$50,$30   ;0C9715|        |      ;
 
                       db $80,$30,$40,$30,$70,$30,$30,$30   ;0C971D|        |      ;
 
                       db $50,$30,$20,$30,$30,$30,$10,$30   ;0C9725|        |      ;
                       db $FF                               ;0C972D|        |      ;
 
          sndTra06_28: db $01,$CE,$C8,$02,$B8,$95,$34,$FF   ;0C972E|        |      ;
 
          sndTra06_2D: db $01,$CF,$0A,$CD,$03,$FB,$B9,$BF   ;0C9736|        |      ;
                       db $FE,$04,$0A,$CD,$01,$CF,$03,$CA   ;0C973E|        |      ;
                       db $CF,$0A,$CD,$01,$CF,$05,$CD,$CD   ;0C9746|        |      ;
                       db $CE,$CD,$CE,$CD,$CE,$CD,$9E,$8D   ;0C974E|        |      ;
                       db $7E,$6D,$5E,$4D,$3E,$2D,$1E,$1D   ;0C9756|        |      ;
                       db $FF                               ;0C975E|        |      ;
 
          sndTra06_2E: db $01,$CF,$05,$CD,$03,$FB,$B9,$BF   ;0C975F|        |      ;
                       db $FE,$02,$02,$E9,$0C,$BE,$BD,$9D   ;0C9767|        |      ;
                       db $9E,$7D,$5D,$4D,$3D,$2D,$2D,$1D   ;0C976F|        |      ;
                       db $FF                               ;0C9777|        |      ;
 
          sndTra03_49: db $01,$B0,$88,$FB,$60,$19,$80,$32   ;0C9778|        |      ;
                       db $A0,$32,$A0,$32,$A0,$32,$20,$32   ;0C9780|        |      ;
                       db $00,$FE,$04,$FB,$06,$B0,$88,$00   ;0C9788|        |      ;
                       db $00,$30,$32,$E8,$02,$FE,$03,$FF   ;0C9790|        |      ;
 
          sndTra03_2F: db $03,$B0,$88,$11,$53,$20,$FE,$30   ;0C9798|        |      ;
                       db $E2,$40,$BE,$05,$B0,$88,$60,$A9   ;0C97A0|        |      ;
                       db $60,$E2,$61,$53,$40,$A9,$40,$E2   ;0C97A8|        |      ;
                       db $41,$53,$30,$A9,$30,$E2,$31,$53   ;0C97B0|        |      ;
                       db $20,$A9,$20,$E2,$21,$53,$10,$A9   ;0C97B8|        |      ;
                       db $10,$E2,$11,$53,$FF               ;0C97C0|        |      ;
 
          sndTra06_2F: db $05,$00,$01,$BD,$04,$BD,$05,$9F   ;0C97C5|        |      ;
                       db $06,$8D,$6F,$5D,$4F,$3D,$2F,$1D   ;0C97CD|        |      ;
                       db $1F,$FF                           ;0C97D5|        |      ;
 
          sndTra06_22: db $03,$DA,$01,$00,$02,$00,$C8,$B5   ;0C97D7|        |      ;
                       db $94,$85,$74,$62,$41,$32,$22,$07   ;0C97DF|        |      ;
                       db $00,$09,$61,$FF                   ;0C97E7|        |      ;
 
          sndTra06_23: db $03,$DA,$06,$00,$04,$42,$C2,$C8   ;0C97EB|        |      ;
                       db $B5,$74,$65,$54,$04,$C2,$62,$52   ;0C97F3|        |      ;
                       db $32,$11,$FF                       ;0C97FB|        |      ;
 
          sndTra06_30: db $03,$CA,$02,$00,$BD,$04,$BF,$B8   ;0C97FE|        |      ;
                       db $B9,$A5,$A9,$88,$86,$68,$69,$48   ;0C9806|        |      ;
                       db $35,$23,$1E,$FF                   ;0C980E|        |      ;
 
          sndTra06_31: db $02,$DA,$04,$00,$03,$44,$C9,$B7   ;0C9812|        |      ;
                       db $75,$6E,$58,$35,$23,$1F,$FF       ;0C981A|        |      ;
 
          sndTra03_24: db $01,$B0,$88,$B2,$70,$53,$00,$62   ;0C9821|        |      ;
                       db $00,$73,$00,$81,$80,$00,$62,$A0   ;0C9829|        |      ;
                       db $81,$C0,$72,$1A,$82,$40,$72,$6A   ;0C9831|        |      ;
                       db $62,$D0,$55,$00,$46,$60,$42,$00   ;0C9839|        |      ;
                       db $33,$00,$00,$42,$40,$22,$64,$32   ;0C9841|        |      ;
                       db $D0,$25,$00,$26,$00,$12,$00,$13   ;0C9849|        |      ;
                       db $00,$FF                           ;0C9851|        |      ;
 
          sndTra06_24: db $01,$00,$A6,$BD,$BE,$BC,$FF       ;0C9853|        |      ;
 
          sndTra03_3C: db $01,$B0,$88,$D0,$7F,$01,$30,$88   ;0C985A|        |      ;
                       db $D0,$7F,$00,$00,$00,$00,$01,$B0   ;0C9862|        |      ;
                       db $88,$20,$7F,$FF                   ;0C986A|        |      ;
 
          sndTra06_1D: db $01,$BE,$BD,$BC,$02,$77,$78,$89   ;0C986E|        |      ;
                       db $9A,$9B,$9C,$9D,$03,$BE,$BE,$AE   ;0C9876|        |      ;
                       db $9E,$8E,$7E,$6E,$5E,$4E,$4E,$3E   ;0C987E|        |      ;
                       db $3E,$2E,$1E,$0E,$FF               ;0C9886|        |      ;
 
       sndTra03_1E_21: db $FF                               ;0C988B|        |      ;
 
    sndTra06_1E_21_35: db $01,$8F,$8D,$8F,$8A,$89,$88,$87   ;0C988C|        |      ; reused!
                       db $86,$85,$84,$00,$4D,$4C,$4B,$4A   ;0C9894|        |      ;
                       db $49,$48,$47,$46,$45,$44,$00,$2D   ;0C989C|        |      ;
                       db $2C,$2B,$2A,$29,$28,$27,$26,$25   ;0C98A4|        |      ;
                       db $24,$00,$1D,$1C,$1B,$1A,$19,$18   ;0C98AC|        |      ;
                       db $17,$16,$14,$FF                   ;0C98B4|        |      ;
 
          sndTra06_1F: db $03,$97,$00,$98,$5F,$41,$3A,$25   ;0C98B8|        |      ;
                       db $18,$1B,$FF                       ;0C98C0|        |      ;
 
          sndTra03_12: db $0F,$B0,$83,$D2,$00,$42,$00,$12   ;0C98C3|        |      ;
                       db $00,$FF                           ;0C98CB|        |      ;
 
          sndTra06_12: db $01,$00,$7C,$03,$BF,$79,$02,$BF   ;0C98CD|        |      ;
                       db $99,$9F,$79,$7F,$59,$5F,$39,$2F   ;0C98D5|        |      ;
                       db $19,$1F,$FF,$FF                   ;0C98DD|        |      ;
 
          sndTra03_36: db $01,$B0,$88,$00,$00,$00,$00,$00   ;0C98E1|        |      ;
                       db $FB,$32,$A7,$30,$10,$52,$5D,$50   ;0C98E9|        |      ;
                       db $20,$61,$FD,$60,$20,$71,$C5,$70   ;0C98F1|        |      ;
                       db $10,$81,$7D,$80,$20,$91,$40,$90   ;0C98F9|        |      ;
                       db $10,$91,$0D,$90,$20,$90,$E2,$00   ;0C9901|        |      ;
                       db $E8,$04,$FE,$02,$FF               ;0C9909|        |      ;
 
          sndTra03_11: db $0F,$B0,$83,$F2,$00,$52,$00,$12   ;0C990E|        |      ;
                       db $00,$FF                           ;0C9916|        |      ;
 
          sndTra06_11: db $01,$00,$9C,$03,$DF,$99,$02,$DF   ;0C9918|        |      ;
                       db $B9,$BF,$99,$9F,$79,$7F,$59,$3F   ;0C9920|        |      ;
                       db $29,$1F,$FF                       ;0C9928|        |      ;
 
          sndTra03_29: db $01,$22,$9D,$12,$10,$10,$30,$20   ;0C992B|        |      ;
                       db $50,$40,$70,$FF                   ;0C9933|        |      ;
 
          sndTra06_29: db $03,$BF,$BF,$AE,$BF,$B1,$B2,$B3   ;0C9937|        |      ;
                       db $FF                               ;0C993F|        |      ;
 
          sndTra03_2A: db $02,$B0,$82,$C2,$70,$03,$B0,$82   ;0C9940|        |      ;
                       db $00,$03,$B0,$82,$13,$B0,$C1,$AB   ;0C9948|        |      ;
                       db $C1,$53,$C1,$AB,$C1,$53,$B1,$AB   ;0C9950|        |      ;
                       db $A1,$53,$91,$AB,$81,$53,$71,$AB   ;0C9958|        |      ;
                       db $61,$53,$51,$AB,$41,$53,$31,$AB   ;0C9960|        |      ;
                       db $31,$53,$21,$AB,$21,$53,$11,$AB   ;0C9968|        |      ;
                       db $11,$53,$FF                       ;0C9970|        |      ;
 
          sndTra06_2A: db $01,$BC,$03,$9F,$00,$89,$7F,$02   ;0C9973|        |      ;
                       db $69,$8F,$49,$3F,$39,$2F,$29,$2F   ;0C997B|        |      ;
                       db $19,$1F,$19,$1F,$FF               ;0C9983|        |      ;
 
       sndTra03_37_39: db $02,$B0,$82,$D2,$70,$03,$B0,$82   ;0C9988|        |      ; reused
                       db $00,$03,$B0,$82,$13,$B0,$D1,$AB   ;0C9990|        |      ;
                       db $D1,$53,$D1,$AB,$D1,$53,$C1,$AB   ;0C9998|        |      ;
                       db $B1,$53,$A1,$AB,$91,$53,$81,$AB   ;0C99A0|        |      ;
                       db $71,$53,$61,$AB,$41,$53,$41,$AB   ;0C99A8|        |      ;
                       db $31,$53,$31,$AB,$21,$53,$21,$AB   ;0C99B0|        |      ;
                       db $11,$53,$FF                       ;0C99B8|        |      ;
 
       sndTra06_37_39: db $01,$CC,$03,$AF,$00,$99,$8F,$02   ;0C99BB|        |      ; reused
                       db $79,$9F,$59,$4F,$39,$3F,$29,$2F   ;0C99C3|        |      ;
                       db $19,$1F,$19,$1F,$FF               ;0C99CB|        |      ;
 
          sndTra03_38: db $FF                               ;0C99D0|        |      ;
 
          sndTra06_38: db $01,$D9,$CE,$BF,$4E,$CC,$BB,$AA   ;0C99D1|        |      ;
                       db $8A,$00,$7A,$00,$7A,$7A,$7A,$6A   ;0C99D9|        |      ;
                       db $5A,$4A,$3B,$2A,$02,$39,$39,$29   ;0C99E1|        |      ;
                       db $19,$19,$FF                       ;0C99E9|        |      ;
 
          sndTra03_08: db $01,$B0,$8B,$21,$00,$00,$05,$B0   ;0C99EC|        |      ;
                       db $8A,$00,$51,$1D,$00,$11,$53,$E6   ;0C99F4|        |      ;
                       db $20,$00,$FE,$FF,$FB,$99           ;0C99FC|        |      ;
 
          sndTra06_32: db $01,$FB,$36,$87,$25,$66,$12,$44   ;0C9A02|        |      ;
                       db $FE,$02,$33,$FF                   ;0C9A0A|        |      ;
 
          sndTra06_25: db $01,$98,$66,$0E,$97,$FF           ;0C9A0E|        |      ;
 
          sndTra06_20: db $01,$58,$46,$0E,$57,$FF           ;0C9A14|        |      ;
 
          sndTra03_0F: db $06,$B0,$8C,$24,$90,$43,$F0,$63   ;0C9A1A|        |      ;
                       db $70,$93,$00,$63,$00,$43,$00,$23   ;0C9A22|        |      ;
                       db $00,$13,$00,$FF                   ;0C9A2A|        |      ;
 
          sndTra06_0F: db $FF                               ;0C9A2E|        |      ;
 
          sndTra03_3A: db $04,$70,$82,$52,$00,$54,$00,$55   ;0C9A2F|        |      ;
                       db $00,$53,$00,$FF                   ;0C9A37|        |      ;
 
          sndTra06_3A: db $01,$8C,$8D,$8D,$3C,$8E,$8E,$8F   ;0C9A3B|        |      ;
                       db $8E,$5B,$5F,$5D,$5C,$8F,$8F,$8E   ;0C9A43|        |      ;
                       db $8F,$FF                           ;0C9A4B|        |      ;
 
          sndTra03_3B: db $04,$70,$82,$62,$00,$64,$00,$65   ;0C9A4D|        |      ;
                       db $00,$63,$00,$FF                   ;0C9A55|        |      ;
 
          sndTra06_3B: db $01,$8C,$8D,$8D,$3C,$8E,$8E,$8F   ;0C9A59|        |      ;
                       db $8E,$5B,$5F,$5D,$5C,$8F,$8F,$8E   ;0C9A61|        |      ;
                       db $8F,$FF                           ;0C9A69|        |      ;
 
          sndTra06_26: db $01,$FB,$25,$C8,$1F,$43,$00,$FE   ;0C9A6B|        |      ;
                       db $04,$12,$B6,$1F,$34,$00,$11,$75   ;0C9A73|        |      ;
                       db $1F,$23,$00,$11,$54,$1F,$23,$00   ;0C9A7B|        |      ;
                       db $11,$34,$1F,$23,$00,$11,$24,$1F   ;0C9A83|        |      ;
                       db $13,$00,$11,$24,$1F,$13,$00,$FF   ;0C9A8B|        |      ;
 
          sndTra03_0D: db $02,$B0,$9B,$63,$00,$00,$00,$04   ;0C9A93|        |      ;
                       db $B0,$8A,$61,$94,$31,$EC,$12,$36   ;0C9A9B|        |      ;
                       db $FF                               ;0C9AA3|        |      ;
 
          sndTra06_0E: db $02,$76,$2D,$42,$2F,$01,$9A,$8E   ;0C9AA4|        |      ;
                       db $7F,$2E,$7C,$6B,$5A,$4A,$3A,$2A   ;0C9AAC|        |      ;
                       db $1A,$1A,$1A,$02,$26,$1D,$22,$1F   ;0C9AB4|        |      ;
                       db $01,$3A,$4E,$2F,$1E,$4C,$2B,$5A   ;0C9ABC|        |      ;
                       db $3A,$2A,$1A,$1A,$1A,$FF           ;0C9AC4|        |      ;
 
          sndTra03_3D: db $02,$B0,$82,$C3,$00,$C1,$00,$C2   ;0C9ACA|        |      ;
                       db $00,$C4,$00,$C3,$00,$C1,$00,$C2   ;0C9AD2|        |      ;
                       db $00,$C4,$00,$FF                   ;0C9ADA|        |      ;
 
          sndTra06_3D: db $02,$CA,$CB,$0C,$CA,$FF           ;0C9ADE|        |      ;
 
          sndTra03_46: db $03,$30,$89,$10,$60,$30,$60,$40   ;0C9AE4|        |      ;
                       db $60,$50,$60,$60,$60,$70,$60,$80   ;0C9AEC|        |      ;
 
                       db $60,$90,$60,$A0,$60,$B0,$60,$C0   ;0C9AF4|        |      ;
                       db $60,$D0,$60,$E0,$60,$E0,$60,$B0   ;0C9AFC|        |      ;
                       db $60,$90,$60,$70,$60,$50,$60,$30   ;0C9B04|        |      ;
                       db $60,$20,$60,$10,$60,$0C,$30,$8D   ;0C9B0C|        |      ;
                       db $31,$60,$41,$50,$51,$40,$61,$30   ;0C9B14|        |      ;
                       db $71,$20,$81,$10,$91,$00,$A0,$F0   ;0C9B1C|        |      ;
                       db $B0,$E0,$C0,$D0,$D0,$C0,$E0,$B0   ;0C9B24|        |      ;
                       db $F0,$A0,$03,$30,$89,$10,$60,$30   ;0C9B2C|        |      ;
                       db $60,$40,$60,$50,$60,$60,$60,$70   ;0C9B34|        |      ;
                       db $60,$80,$60,$90,$60,$A0,$60,$B0   ;0C9B3C|        |      ;
                       db $60,$C0,$60,$D0,$60,$E0,$60,$E0   ;0C9B44|        |      ;
 
                       db $60,$B0,$60,$90,$60,$70,$60,$50   ;0C9B4C|        |      ;
 
                       db $60,$30,$60,$20,$60,$10,$60,$FF   ;0C9B54|        |      ;
 
          sndTra03_40: db $01,$70,$F8,$B1,$1D,$B1,$93,$FB   ;0C9B5C|        |      ;
                       db $11,$1D,$11,$93,$FE,$02,$00,$00   ;0C9B64|        |      ;
                       db $FB,$B1,$1D,$B1,$93,$FE,$0C,$FF   ;0C9B6C|        |      ;
 
          sndTra03_10: db $01,$30,$81,$E8,$02,$F0,$34,$70   ;0C9B74|        |      ;
                       db $34,$00,$00,$D0,$30,$00,$00,$B0   ;0C9B7C|        |      ;
                       db $40,$00,$00,$90,$28,$00,$80,$3B   ;0C9B84|        |      ;
 
                       db $00,$90,$18,$00,$70,$40,$00,$80   ;0C9B8C|        |      ;
                       db $70,$00,$70,$50,$FF               ;0C9B94|        |      ;
 
          sndTra06_10: db $FF                               ;0C9B99|        |      ;
 
          sndTra03_41: db $08,$B0,$8B,$ED,$40,$75,$90,$34   ;0C9B9A|        |      ;
                       db $90,$B5,$40,$34,$40,$C4,$D0,$23   ;0C9BA2|        |      ;
                       db $D0,$D4,$50,$43,$50,$D4,$00,$43   ;0C9BAA|        |      ;
                       db $00,$D3,$B0,$42,$B0,$D3,$70,$42   ;0C9BB2|        |      ;
                       db $70,$D3,$20,$42,$20,$0F,$B0,$82   ;0C9BBA|        |      ;
                       db $E6,$10,$90,$C0,$50,$C0,$30,$C0   ;0C9BC2|        |      ;
                       db $20,$C0,$10,$C0,$FF               ;0C9BCA|        |      ;
 
          sndTra06_41: db $01,$CE,$CD,$CC,$02,$87,$88,$99   ;0C9BCF|        |      ;
                       db $AA,$AB,$AC,$AD,$03,$CE,$BE,$AE   ;0C9BD7|        |      ;
                       db $9E,$7E,$5E,$FB,$6E,$FE,$30,$06   ;0C9BDF|        |      ;
                       db $4E,$3E,$2E,$1E,$FF               ;0C9BE7|        |      ;
 
          sndTra03_43: db $01,$70,$82,$B2,$22,$20,$09,$D0   ;0C9BEC|        |      ;
                       db $77,$10,$09,$10,$66,$20,$11,$E6   ;0C9BF4|        |      ;
                       db $10,$00,$FF                       ;0C9BFC|        |      ;
 
          sndTra06_43: db $01,$CD,$CC,$BB,$AA,$8A,$7A,$7A   ;0C9BFF|        |      ;
                       db $7A,$7A,$6A,$5A,$4A,$3B,$3A,$FB   ;0C9C07|        |      ;
                       db $39,$FE,$07,$29,$1A,$19,$09,$18   ;0C9C0F|        |      ;
                       db $FF                               ;0C9C17|        |      ;
 
          sndTra03_48: db $06,$B0,$88,$FB,$20,$A9,$20,$2A   ;0C9C18|        |      ;
                       db $70,$A9,$70,$2A,$80,$A9,$80,$2A   ;0C9C20|        |      ;
                       db $50,$A9,$50,$2A,$40,$A9,$40,$2A   ;0C9C28|        |      ;
                       db $30,$A9,$30,$2A,$20,$A9,$20,$2A   ;0C9C30|        |      ;
                       db $10,$A9,$10,$2A,$FE,$02,$10,$A9   ;0C9C38|        |      ;
                       db $10,$2A,$10,$A9,$10,$2A,$50,$A9   ;0C9C40|        |      ;
                       db $50,$2A,$30,$A9,$30,$2A,$20,$A9   ;0C9C48|        |      ;
                       db $20,$2A,$10,$A9,$10,$2A,$10,$A9   ;0C9C50|        |      ;
                       db $10,$2A,$FF                       ;0C9C58|        |      ;
 
          sndTra06_48: db $06,$FB,$3F,$40,$AF,$B0,$CF,$D0   ;0C9C5B|        |      ;
                       db $AF,$90,$8F,$70,$6F,$50,$4F,$30   ;0C9C63|        |      ;
                       db $2F,$20,$FE,$02,$2F,$20,$3F,$30   ;0C9C6B|        |      ;
                       db $6F,$50,$5F,$40,$3F,$20,$2F,$20   ;0C9C73|        |      ;
                       db $2F,$20,$FF                       ;0C9C7B|        |      ;
 
          sndTra03_3E: db $FF                               ;0C9C7E|        |      ;
 
          sndTra06_3E: db $01,$CF,$0A,$CD,$03,$FB,$C9,$CF   ;0C9C7F|        |      ;
                       db $FE,$04,$02,$C9,$0C,$BE,$BD,$9D   ;0C9C87|        |      ;
                       db $9E,$7D,$6D,$5D,$4D,$3D,$2D,$1D   ;0C9C8F|        |      ;
                       db $FF                               ;0C9C97|        |      ;
 
          sndTra03_1A: db $05,$B0,$88,$B0,$33,$70,$20,$E7   ;0C9C98|        |      ;
                       db $50,$30,$00,$01,$B0,$88,$00,$05   ;0C9CA0|        |      ;
                       db $B0,$88,$20,$20,$E7,$10,$00,$04   ;0C9CA8|        |      ;
                       db $B0,$88,$00,$02,$B0,$88,$10,$20   ;0C9CB0|        |      ;
                       db $E7,$00,$00,$00,$00,$FF           ;0C9CB8|        |      ;
 
          sndTra03_19: db $01,$70,$88,$90,$EC,$90,$46,$90   ;0C9CBE|        |      ;
                       db $8E,$90,$46,$90,$8E,$90,$46,$90   ;0C9CC6|        |      ;
                       db $50,$90,$F0,$90,$E0,$90,$D0,$90   ;0C9CCE|        |      ;
                       db $C0,$90,$B0,$90,$A0,$90,$90,$90   ;0C9CD6|        |      ;
                       db $80,$90,$66,$90,$44,$90,$22,$FF   ;0C9CDE|        |      ;
 
          sndTra03_3F: db $FF                               ;0C9CE6|        |      ;
 
          sndTra06_3F: db $01,$CF,$0A,$CD,$03,$FB,$C9,$CF   ;0C9CE7|        |      ;
                       db $FE,$04,$0A,$CD,$01,$CF,$03,$CA   ;0C9CEF|        |      ;
                       db $CF,$0A,$CD,$01,$CF,$05,$CD,$CD   ;0C9CF7|        |      ;
                       db $CE,$CD,$CE,$CD,$CE,$CD,$8E,$7D   ;0C9CFF|        |      ;
                       db $6E,$5D,$4E,$3D,$2E,$1D,$1E,$1D   ;0C9D07|        |      ;
                       db $FF                               ;0C9D0F|        |      ;
 
          sndTra03_35: db $05,$30,$81,$00,$01,$30,$81,$00   ;0C9D10|        |      ;
                       db $D1,$00,$00,$00,$00,$D0,$20,$00   ;0C9D18|        |      ;
                       db $00,$00,$D0,$F0,$00,$00,$00,$D0   ;0C9D20|        |      ;
                       db $1F,$00,$00,$00,$D0,$E0,$00,$00   ;0C9D28|        |      ;
                       db $00,$D0,$1E,$00,$00,$00,$D0,$D0   ;0C9D30|        |      ;
                       db $00,$00,$00,$D0,$1C,$FF           ;0C9D38|        |      ;
 
          sndTra03_44: db $05,$B0,$F8,$00,$ED,$09,$E6,$01   ;0C9D3E|        |      ;
                       db $70,$28,$E6,$02,$50,$27,$E6,$03   ;0C9D46|        |      ;
                       db $40,$27,$FB,$30,$27,$FE,$04,$00   ;0C9D4E|        |      ;
 
                       db $10,$27,$FF                       ;0C9D56|        |      ;
 
          sndTra06_44: db $01,$00,$00,$00,$00,$00,$87,$02   ;0C9D59|        |      ;
                       db $FB,$A2,$59,$FE,$04,$00,$22,$19   ;0C9D61|        |      ;
                       db $FF                               ;0C9D69|        |      ;
 
          sndTra03_45: db $06,$30,$88,$00,$B0,$64,$B0,$54   ;0C9D6A|        |      ;
                       db $B0,$47,$B0,$3C,$B0,$32,$B0,$2A   ;0C9D72|        |      ;
                       db $B0,$23,$B0,$1E,$10,$32,$10,$2A   ;0C9D7A|        |      ;
                       db $10,$23,$10,$1E,$FF               ;0C9D82|        |      ;
 
          sndTra03_47: db $03,$70,$81,$A0,$40,$05,$70,$8D   ;0C9D87|        |      ;
                       db $D1,$D0,$80,$D0,$55,$C0,$04,$F0   ;0C9D8F|        |      ;
                       db $81,$A1,$FE,$06,$D0,$81,$90,$3A   ;0C9D97|        |      ;
                       db $60,$3B,$40,$3A,$30,$3B,$20,$3A   ;0C9D9F|        |      ;
 
                       db $10,$3B,$10,$3A,$FF               ;0C9DA7|        |      ;
 
          sndTra06_47: db $05,$10,$DD,$01,$10,$DA,$10,$DD   ;0C9DAC|        |      ;
                       db $10,$DC,$10,$DB,$10,$DA,$D9,$D8   ;0C9DB4|        |      ;
                       db $D7,$D6,$D5,$D4,$D3,$D2,$D1,$FF   ;0C9DBC|        |      ;
 
          sndTra03_4C: db $06,$30,$88,$83,$FA,$82,$A7,$81   ;0C9DC4|        |      ;
                       db $FC,$81,$C5,$81,$93,$81,$53,$80   ;0C9DCC|        |      ;
                       db $FE,$80,$E2,$80,$C9,$80,$A9,$80   ;0C9DD4|        |      ;
                       db $7F,$80,$71,$80,$64,$80,$54,$80   ;0C9DDC|        |      ;
                       db $3F,$80,$38,$80,$32,$80,$2A,$80   ;0C9DE4|        |      ;
                       db $1F,$80,$1F,$40,$32,$40,$2A,$40   ;0C9DEC|        |      ;
                       db $1F,$40,$1F,$20,$32,$20,$2A,$20   ;0C9DF4|        |      ;
                       db $1F,$20,$1F,$10,$32,$10,$2A,$10   ;0C9DFC|        |      ;
                       db $1F,$10,$1F,$FF                   ;0C9E04|        |      ;
 
          sndTra03_4D: db $05,$B0,$88,$B0,$D5,$B0,$8E,$B0   ;0C9E08|        |      ;
                       db $A9,$02,$B0,$88,$C0,$6A,$B0,$6A   ;0C9E10|        |      ;
                       db $A0,$6A,$90,$6A,$80,$6A,$60,$6A   ;0C9E18|        |      ;
                       db $40,$6A,$20,$6A,$FF               ;0C9E20|        |      ;
 
 
         PTR16_0C9E25: dw DATA8_0C9EBB                      ;0C9E25|        |0C9EBB;
                       dw DATA8_0C9EBD                      ;0C9E27|        |0C9EBD;
                       dw DATA8_0C9EC8                      ;0C9E29|        |0C9EC8;
                       dw DATA8_0C9ED9                      ;0C9E2B|        |0C9ED9;
                       dw DATA8_0C9EDD                      ;0C9E2D|        |0C9EDD;
                       dw DATA8_0C9EE2                      ;0C9E2F|        |0C9EE2;
                       dw DATA8_0C9EE9                      ;0C9E31|        |0C9EE9;
                       dw DATA8_0C9EF0                      ;0C9E33|        |0C9EF0;
                       dw DATA8_0C9F05                      ;0C9E35|        |0C9F05;
                       dw DATA8_0C9F0E                      ;0C9E37|        |0C9F0E;
                       dw DATA8_0C9F15                      ;0C9E39|        |0C9F15;
                       dw DATA8_0C9F20                      ;0C9E3B|        |0C9F20;
                       dw DATA8_0C9F30                      ;0C9E3D|        |0C9F30;
                       dw DATA8_0C9F3E                      ;0C9E3F|        |0C9F3E;
                       dw DATA8_0C9F47                      ;0C9E41|        |0C9F47;
                       dw DATA8_0C9F4F                      ;0C9E43|        |0C9F4F;
                       dw DATA8_0C9F57                      ;0C9E45|        |0C9F57;
                       dw DATA8_0C9F5D                      ;0C9E47|        |0C9F5D;
                       dw DATA8_0C9F63                      ;0C9E49|        |0C9F63;
                       dw DATA8_0C9F69                      ;0C9E4B|        |0C9F69;
                       dw DATA8_0C9F6E                      ;0C9E4D|        |0C9F6E;
                       dw DATA8_0C9F7F                      ;0C9E4F|        |0C9F7F;
                       dw DATA8_0C9F83                      ;0C9E51|        |0C9F83;
                       dw DATA8_0C9F89                      ;0C9E53|        |0C9F89;
                       dw DATA8_0C9F8D                      ;0C9E55|        |0C9F8D;
                       dw DATA8_0C9F93                      ;0C9E57|        |0C9F93;
                       dw DATA8_0C9F98                      ;0C9E59|        |0C9F98;
                       dw DATA8_0C9F9D                      ;0C9E5B|        |0C9F9D;
                       dw DATA8_0C9FA3                      ;0C9E5D|        |0C9FA3;
                       dw DATA8_0C9FA8                      ;0C9E5F|        |0C9FA8;
                       dw DATA8_0C9FAD                      ;0C9E61|        |0C9FAD;
                       dw DATA8_0C9FB4                      ;0C9E63|        |0C9FB4;
                       dw DATA8_0C9FBA                      ;0C9E65|        |0C9FBA;
                       dw DATA8_0C9FC3                      ;0C9E67|        |0C9FC3;
                       dw DATA8_0C9FC7                      ;0C9E69|        |0C9FC7;
                       dw DATA8_0C9FCB                      ;0C9E6B|        |0C9FCB;
                       dw DATA8_0C9FCF                      ;0C9E6D|        |0C9FCF;
                       dw DATA8_0C9FD5                      ;0C9E6F|        |0C9FD5;
                       dw DATA8_0C9FDC                      ;0C9E71|        |0C9FDC;
                       dw DATA8_0C9FE5                      ;0C9E73|        |0C9FE5;
                       dw DATA8_0C9FF9                      ;0C9E75|        |0C9FF9;
                       dw DATA8_0C9FFD                      ;0C9E77|        |0C9FFD;
                       dw DATA8_0CA004                      ;0C9E79|        |0CA004;
 
         PTR16_0C9E7B: dw DATA8_0CA015                      ;0C9E7B|        |0CA015;
                       dw DATA8_0CA024                      ;0C9E7D|        |0CA024;
                       dw DATA8_0CA02F                      ;0C9E7F|        |0CA02F;
                       dw DATA8_0CA036                      ;0C9E81|        |0CA036;
                       dw DATA8_0CA045                      ;0C9E83|        |0CA045;
                       dw DATA8_0CA050                      ;0C9E85|        |0CA050;
                       dw DATA8_0CA057                      ;0C9E87|        |0CA057;
                       dw DATA8_0CA062                      ;0C9E89|        |0CA062;
                       dw DATA8_0CA06D                      ;0C9E8B|        |0CA06D;
                       dw DATA8_0CA074                      ;0C9E8D|        |0CA074;
                       dw DATA8_0CA07B                      ;0C9E8F|        |0CA07B;
                       dw DATA8_0CA080                      ;0C9E91|        |0CA080;
                       dw DATA8_0CA088                      ;0C9E93|        |0CA088;
                       dw DATA8_0CA094                      ;0C9E95|        |0CA094;
                       dw DATA8_0CA0A0                      ;0C9E97|        |0CA0A0;
                       dw DATA8_0CA0A8                      ;0C9E99|        |0CA0A8;
                       dw DATA8_0CA0B3                      ;0C9E9B|        |0CA0B3;
                       dw DATA8_0CA0BB                      ;0C9E9D|        |0CA0BB;
                       dw DATA8_0CA0C8                      ;0C9E9F|        |0CA0C8;
                       dw DATA8_0CA0D3                      ;0C9EA1|        |0CA0D3;
                       dw DATA8_0CA0DA                      ;0C9EA3|        |0CA0DA;
                       dw DATA8_0CA0E6                      ;0C9EA5|        |0CA0E6;
                       dw DATA8_0CA0F1                      ;0C9EA7|        |0CA0F1;
                       dw DATA8_0CA0F9                      ;0C9EA9|        |0CA0F9;
                       dw DATA8_0CA105                      ;0C9EAB|        |0CA105;
                       dw DATA8_0CA110                      ;0C9EAD|        |0CA110;
                       dw DATA8_0CA11B                      ;0C9EAF|        |0CA11B;
                       dw DATA8_0CA128                      ;0C9EB1|        |0CA128;
                       dw DATA8_0CA134                      ;0C9EB3|        |0CA134;
                       dw DATA8_0CA140                      ;0C9EB5|        |0CA140;
                       dw DATA8_0CA147                      ;0C9EB7|        |0CA147;
                       dw DATA8_0CA14F                      ;0C9EB9|        |0CA14F;
 
         DATA8_0C9EBB: db $11,$FF                           ;0C9EBB|        |      ; instrument tunning data??  VolumeTable over time??
 
         DATA8_0C9EBD: db $1D,$18,$17,$16,$15,$14,$13,$12   ;0C9EBD|        |      ;
                       db $11,$10,$FF                       ;0C9EC5|        |      ;
 
         DATA8_0C9EC8: db $18,$16,$15,$14,$13,$12,$10,$15   ;0C9EC8|        |      ;
                       db $14,$13,$12,$21,$10,$14,$13,$12   ;0C9ED0|        |      ;
                       db $FF                               ;0C9ED8|        |      ;
 
         DATA8_0C9ED9: db $14,$15,$16,$FF                   ;0C9ED9|        |      ;
 
         DATA8_0C9EDD: db $11,$12,$13,$14,$FF               ;0C9EDD|        |      ;
 
         DATA8_0C9EE2: db $21,$32,$43,$54,$65,$76,$FF       ;0C9EE2|        |      ;
 
         DATA8_0C9EE9: db $1D,$18,$17,$16,$15,$14,$FF       ;0C9EE9|        |      ;
 
         DATA8_0C9EF0: db $17,$16,$15,$14,$13,$12,$11,$11   ;0C9EF0|        |      ;
                       db $10,$16,$14,$13,$12,$11,$21,$10   ;0C9EF8|        |      ;
                       db $14,$13,$21,$31,$FF               ;0C9F00|        |      ;
 
         DATA8_0C9F05: db $2A,$16,$29,$16,$18,$17,$16,$15   ;0C9F05|        |      ;
                       db $FF                               ;0C9F0D|        |      ;
 
         DATA8_0C9F0E: db $18,$37,$16,$15,$14,$13,$FF       ;0C9F0E|        |      ;
 
         DATA8_0C9F15: db $37,$56,$45,$44,$43,$72,$11,$E2   ;0C9F15|        |      ;
                       db $E3,$E4,$FF                       ;0C9F1D|        |      ;
 
         DATA8_0C9F20: db $17,$16,$15,$F4,$F3,$F3,$F2,$F2   ;0C9F20|        |      ;
                       db $F2,$A2,$B3,$B4,$B5,$B6,$17,$FF   ;0C9F28|        |      ;
 
         DATA8_0C9F30: db $17,$16,$15,$E4,$E3,$E3,$E2,$E2   ;0C9F30|        |      ;
                       db $E3,$E4,$E5,$E6,$17,$FF           ;0C9F38|        |      ;
 
         DATA8_0C9F3E: db $18,$47,$F6,$F5,$E4,$D3,$82,$71   ;0C9F3E|        |      ;
                       db $FF                               ;0C9F46|        |      ;
 
         DATA8_0C9F47: db $16,$37,$35,$44,$43,$62,$71,$FF   ;0C9F47|        |      ;
 
         DATA8_0C9F4F: db $16,$17,$28,$26,$25,$14,$13,$FF   ;0C9F4F|        |      ;
 
         DATA8_0C9F57: db $18,$47,$56,$44,$43,$FF           ;0C9F57|        |      ;
 
         DATA8_0C9F5D: db $38,$36,$34,$23,$21,$FF           ;0C9F5D|        |      ;
 
         DATA8_0C9F63: db $18,$37,$26,$15,$14,$FF           ;0C9F63|        |      ;
 
         DATA8_0C9F69: db $28,$37,$25,$23,$FF               ;0C9F69|        |      ;
 
         DATA8_0C9F6E: db $18,$37,$66,$65,$64,$63,$52,$63   ;0C9F6E|        |      ;
                       db $64,$75,$76,$75,$74,$73,$72,$72   ;0C9F76|        |      ;
                       db $FF                               ;0C9F7E|        |      ;
 
         DATA8_0C9F7F: db $27,$15,$12,$FF                   ;0C9F7F|        |      ;
 
         DATA8_0C9F83: db $18,$26,$34,$23,$21,$FF           ;0C9F83|        |      ;
 
         DATA8_0C9F89: db $27,$25,$14,$FF                   ;0C9F89|        |      ;
 
         DATA8_0C9F8D: db $16,$25,$14,$13,$12,$FF           ;0C9F8D|        |      ;
 
         DATA8_0C9F93: db $18,$16,$25,$13,$FF               ;0C9F93|        |      ;
 
         DATA8_0C9F98: db $38,$27,$25,$24,$FF               ;0C9F98|        |      ;
 
         DATA8_0C9F9D: db $16,$27,$28,$16,$14,$FF           ;0C9F9D|        |      ;
 
         DATA8_0C9FA3: db $38,$26,$34,$23,$FF               ;0C9FA3|        |      ;
 
         DATA8_0C9FA8: db $29,$25,$24,$33,$FF               ;0C9FA8|        |      ;
 
         DATA8_0C9FAD: db $38,$16,$14,$13,$12,$11,$FF       ;0C9FAD|        |      ;
 
         DATA8_0C9FB4: db $16,$37,$35,$33,$22,$FF           ;0C9FB4|        |      ;
 
         DATA8_0C9FBA: db $18,$47,$F6,$F5,$E4,$D3,$82,$71   ;0C9FBA|        |      ;
                       db $FF                               ;0C9FC2|        |      ;
 
         DATA8_0C9FC3: db $39,$28,$25,$FF                   ;0C9FC3|        |      ;
 
         DATA8_0C9FC7: db $18,$25,$24,$FF                   ;0C9FC7|        |      ;
 
         DATA8_0C9FCB: db $14,$25,$36,$FF                   ;0C9FCB|        |      ;
 
         DATA8_0C9FCF: db $49,$48,$47,$36,$25,$FF           ;0C9FCF|        |      ;
 
         DATA8_0C9FD5: db $14,$19,$28,$25,$26,$14,$FF       ;0C9FD5|        |      ;
 
         DATA8_0C9FDC: db $23,$19,$28,$37,$35,$34,$23,$22   ;0C9FDC|        |      ;
                       db $FF                               ;0C9FE4|        |      ;
 
         DATA8_0C9FE5: db $24,$75,$86,$77,$98,$29,$98,$98   ;0C9FE5|        |      ;
                       db $97,$27,$86,$76,$85,$75,$44,$84   ;0C9FED|        |      ;
                       db $33,$32,$21,$FF                   ;0C9FF5|        |      ;
 
         DATA8_0C9FF9: db $24,$25,$36,$FF                   ;0C9FF9|        |      ;
 
         DATA8_0C9FFD: db $16,$18,$17,$16,$15,$14,$FF       ;0C9FFD|        |      ;
 
         DATA8_0CA004: db $23,$34,$65,$66,$46,$97,$57,$78   ;0CA004|        |      ;
                       db $98,$97,$27,$86,$76,$85,$75,$44   ;0CA00C|        |      ;
                       db $FF                               ;0CA014|        |      ;
 
         DATA8_0CA015: db $FB,$11,$12,$13,$12,$11,$10,$1F   ;0CA015|        |      ;
                       db $1E,$1D,$1E,$1F,$10,$FE,$FF       ;0CA01D|        |      ;
 
         DATA8_0CA024: db $FB,$21,$22,$21,$20,$2F,$2E,$2F   ;0CA024|        |      ;
                       db $20,$FE,$FF                       ;0CA02C|        |      ;
 
         DATA8_0CA02F: db $FB,$61,$20,$6F,$20,$FE,$FF       ;0CA02F|        |      ;
 
         DATA8_0CA036: db $FB,$11,$12,$13,$12,$11,$20,$1F   ;0CA036|        |      ;
                       db $1E,$1D,$1E,$1F,$20,$FE,$FF       ;0CA03E|        |      ;
 
         DATA8_0CA045: db $FB,$11,$22,$11,$20,$1F,$2E,$1F   ;0CA045|        |      ;
                       db $20,$FE,$FF                       ;0CA04D|        |      ;
 
         DATA8_0CA050: db $FB,$31,$20,$3F,$20,$FE,$FF       ;0CA050|        |      ;
 
         DATA8_0CA057: db $FB,$51,$10,$1F,$1E,$1D,$1E,$1F   ;0CA057|        |      ;
                       db $10,$FE,$FF                       ;0CA05F|        |      ;
 
         DATA8_0CA062: db $FB,$1F,$1E,$1F,$10,$11,$12,$11   ;0CA062|        |      ;
                       db $10,$FE,$FF                       ;0CA06A|        |      ;
 
         DATA8_0CA06D: db $FB,$10,$2F,$10,$21,$FE,$FF       ;0CA06D|        |      ;
 
         DATA8_0CA074: db $FB,$20,$21,$20,$2F,$FE,$FF       ;0CA074|        |      ;
 
         DATA8_0CA07B: db $FB,$30,$2F,$FE,$FF               ;0CA07B|        |      ;
 
         DATA8_0CA080: db $FB,$50,$2F,$40,$21,$10,$FE,$FF   ;0CA080|        |      ;
 
         DATA8_0CA088: db $80,$FB,$20,$11,$12,$11,$20,$1F   ;0CA088|        |      ;
                       db $1E,$1F,$FE,$FF                   ;0CA090|        |      ;
 
         DATA8_0CA094: db $60,$FB,$1F,$2E,$1F,$20,$11,$22   ;0CA094|        |      ;
                       db $11,$20,$FE,$FF                   ;0CA09C|        |      ;
 
         DATA8_0CA0A0: db $40,$FB,$30,$3F,$30,$31,$FE,$FF   ;0CA0A0|        |      ;
 
         DATA8_0CA0A8: db $FB,$1F,$2E,$1F,$20,$11,$22,$11   ;0CA0A8|        |      ;
                       db $20,$FE,$FF                       ;0CA0B0|        |      ;
 
         DATA8_0CA0B3: db $60,$FB,$3F,$20,$31,$20,$FE,$FF   ;0CA0B3|        |      ;
 
         DATA8_0CA0BB: db $80,$FB,$20,$2F,$1E,$2F,$40,$21   ;0CA0BB|        |      ;
                       db $12,$21,$20,$FE,$FF               ;0CA0C3|        |      ;
 
         DATA8_0CA0C8: db $90,$FB,$10,$1F,$1E,$1F,$10,$11   ;0CA0C8|        |      ;
                       db $12,$11,$FF                       ;0CA0D0|        |      ;
 
         DATA8_0CA0D3: db $FB,$40,$4F,$40,$41,$FE,$FF       ;0CA0D3|        |      ;
 
         DATA8_0CA0DA: db $70,$FB,$1F,$1E,$1F,$20,$11,$12   ;0CA0DA|        |      ;
                       db $11,$20,$FE,$FF                   ;0CA0E2|        |      ;
 
         DATA8_0CA0E6: db $FB,$20,$1F,$1E,$2F,$20,$11,$12   ;0CA0E6|        |      ;
                       db $21,$FE,$FF                       ;0CA0EE|        |      ;
 
         DATA8_0CA0F1: db $30,$FB,$3F,$30,$31,$30,$FE,$FF   ;0CA0F1|        |      ;
 
         DATA8_0CA0F9: db $20,$FB,$20,$21,$12,$21,$20,$2F   ;0CA0F9|        |      ;
                       db $1E,$2F,$FE,$FF                   ;0CA101|        |      ;
 
         DATA8_0CA105: db $FB,$20,$1F,$1E,$2F,$20,$21,$12   ;0CA105|        |      ;
                       db $21,$FE,$FF                       ;0CA10D|        |      ;
 
         DATA8_0CA110: db $FB,$20,$11,$22,$11,$20,$1F,$2E   ;0CA110|        |      ;
                       db $1F,$FE,$FF                       ;0CA118|        |      ;
 
         DATA8_0CA11B: db $30,$FB,$20,$2F,$1E,$1F,$20,$20   ;0CA11B|        |      ;
                       db $21,$12,$11,$FE,$FF               ;0CA123|        |      ;
 
         DATA8_0CA128: db $90,$FB,$2F,$1E,$2F,$20,$21,$12   ;0CA128|        |      ;
                       db $21,$20,$FE,$FF                   ;0CA130|        |      ;
 
         DATA8_0CA134: db $30,$FB,$2F,$2E,$2F,$20,$21,$22   ;0CA134|        |      ;
                       db $21,$20,$FE,$FF                   ;0CA13C|        |      ;
 
         DATA8_0CA140: db $FB,$10,$4F,$10,$41,$FE,$FF       ;0CA140|        |      ;
 
         DATA8_0CA147: db $70,$FB,$3F,$30,$31,$30,$FE,$FF   ;0CA147|        |      ;
 
         DATA8_0CA14F: db $FF                               ;0CA14F|        |      ;
 
     DPCM_DMC_Freq_6D: db $0C                               ;0CA150|        |      ; DMCFreq (speed)
 
    DPCM_DMC_Count_6D: db $00                               ;0CA151|        |      ; DMCCount
 
   DPCM_DMC_Adress_6D: db $05                               ;0CA152|        |      ; DMCAdress 0x1= 0x40 Base C000
 
  DPCM_DMC_Leangth_6D: db $10                               ;0CA153|        |      ; DMCLangth 0x1= 0x10
 
DPCM_samplePointDat_6E: db $0D,$00,$05,$10                   ;0CA154|        |      ;
 
DPCM_samplePointDat_6F: db $0E,$00,$05,$10                   ;0CA158|        |      ;
 
DPCM_samplePointDat_70: db $0D,$00,$01,$08                   ;0CA15C|        |      ;
 
DPCM_samplePointDat_71: db $08,$00,$00,$01                   ;0CA160|        |      ;
 
DPCM_samplePointDat_72: db $0F,$00,$09,$44                   ;0CA164|        |      ;
 
DPCM_samplePointDat_73: db $0F,$00,$1A,$0C                   ;0CA168|        |      ;
 
DPCM_samplePointDat_74: db $0E,$00,$1A,$0C                   ;0CA16C|        |      ;
 
DPCM_samplePointDat_75: db $0F,$00,$1D,$0C                   ;0CA170|        |      ;
 
DPCM_samplePointDat_76: db $0D,$00,$1A,$0C                   ;0CA174|        |      ;
 
DPCM_samplePointDat_77: db $0C,$00,$20,$B0                   ;0CA178|        |      ;
 
DPCM_samplePointDat_78: db $0F,$00,$09,$44                   ;0CA17C|        |      ;
 
DPCM_samplePointDat_79: db $0C,$7F,$20,$B0                   ;0CA180|        |      ;
 
DPCM_samplePointDat_7A: db $0B,$00,$4C,$B0                   ;0CA184|        |      ;
 
DPCM_samplePointDat_7B: db $48,$00,$4C,$BC                   ;0CA188|        |      ;
 
DPCM_samplePointDat_7C: db $4A,$00,$4C,$BC                   ;0CA18C|        |      ;
                       LDA.B r_gameSubstate                 ;0CA190|A519    |000019;
                       db $20                               ;0CA192|        |      ;
                       dw jumpFromStackYXpreserved          ;0CA193|        |0FE86D;
                       dw musicDemo_00                      ;0CA195|        |0CA19D;
                       dw musicDemo_01                      ;0CA197|        |0CA1BC;
                       dw musicDemo_02                      ;0CA199|        |0CA1C6;
                       dw musicDemo_03                      ;0CA19B|        |0CA1D0;
 
         musicDemo_00: db $20                               ;0CA19D|        |      ;
                       dw initBoss_00                       ;0CA19E|        |0FE2D6;
                       LDA.B #$80                           ;0CA1A0|A980    |      ;
                       db $20                               ;0CA1A2|        |      ;
                       dw screenLoadRoutine                 ;0CA1A3|        |0FECE9;
                       LDA.B #$A6                           ;0CA1A5|A9A6    |      ;
                       db $20                               ;0CA1A7|        |      ;
                       dw screenLoadRoutine                 ;0CA1A8|        |0FECE9;
                       LDA.B #$82                           ;0CA1AA|A982    |      ;
                       db $20                               ;0CA1AC|        |      ;
                       dw screenLoadRoutine                 ;0CA1AD|        |0FECE9;
                       LDA.B #$00                           ;0CA1AF|A900    |      ;
                       STA.W $0400                          ;0CA1B1|8D0004  |0C0400;
                       STA.B r_menuSelectIdx                ;0CA1B4|856B    |00006B;
                       STA.W $0780                          ;0CA1B6|8D8007  |0C0780;
                       INC.B r_gameSubstate                 ;0CA1B9|E619    |000019;
                       RTS                                  ;0CA1BB|60      |      ;
 
 
         musicDemo_01: LDX.B #$98                           ;0CA1BC|A298    |      ;
                       LDA.B #$67                           ;0CA1BE|A967    |      ;
                       db $20                               ;0CA1C0|        |      ;
                       dw CODE_0FECDC                       ;0CA1C1|        |0FECDC;
 
                       INC.B r_gameSubstate                 ;0CA1C3|E619    |000019;
                       RTS                                  ;0CA1C5|60      |      ;
 
 
         musicDemo_02: JSR.W CODE_0CA1DE                    ;0CA1C6|20DEA1  |0CA1DE;
                       LDA.B r_menuSelectIdx                ;0CA1C9|A56B    |00006B;
                       BPL CODE_0CA1CF                      ;0CA1CB|1002    |0CA1CF;
                       INC.B r_gameSubstate                 ;0CA1CD|E619    |000019;
 
          CODE_0CA1CF: RTS                                  ;0CA1CF|60      |      ;
 
 
         musicDemo_03: db $20                               ;0CA1D0|        |      ;
                       dw setBank_c000_1E                   ;0CA1D1|        |0FE2DA;
                       LDA.B #$00                           ;0CA1D3|A900    |      ;
                       STA.B r_menuSelectIdx                ;0CA1D5|856B    |00006B;
                       STA.B r_gameState                    ;0CA1D7|8518    |000018;
                       LDA.B #$03                           ;0CA1D9|A903    |      ;
                       STA.B r_gameSubstate                 ;0CA1DB|8519    |000019;
                       RTS                                  ;0CA1DD|60      |      ;
 
 
          CODE_0CA1DE: LDA.B r_menuSelectIdx                ;0CA1DE|A56B    |00006B;
                       db $20                               ;0CA1E0|        |      ;
                       dw jumpFromStackYXpreserved          ;0CA1E1|        |0FE86D;
                       dw CODE_0CA1E9                       ;0CA1E3|        |0CA1E9;
                       dw CODE_0CA1EC                       ;0CA1E5|        |0CA1EC;
                       dw CODE_0CA1F7                       ;0CA1E7|        |0CA1F7;
 
          CODE_0CA1E9: JSR.W drawMusicTitleDemo             ;0CA1E9|2059A2  |0CA259;
 
          CODE_0CA1EC: INC.B r_menuSelectIdx                ;0CA1EC|E66B    |00006B;
                       RTS                                  ;0CA1EE|60      |      ;
 
 
         DATA8_0CA1EF: db $20                               ;0CA1EF|        |      ;
                       dw initSound                         ;0CA1F0|        |0FE227;
                       LDA.B #$FF                           ;0CA1F2|A9FF    |      ;
                       STA.B r_menuSelectIdx                ;0CA1F4|856B    |00006B;
                       RTS                                  ;0CA1F6|60      |      ;
 
 
          CODE_0CA1F7: LDA.B r_curJoyPe1                    ;0CA1F7|A526    |000026;
                       AND.B #$10                           ;0CA1F9|2910    |      ;
                       BNE DATA8_0CA1EF                     ;0CA1FB|D0F2    |0CA1EF;
                       LDA.B r_curJoyPe1                    ;0CA1FD|A526    |000026;
                       AND.B #$08                           ;0CA1FF|2908    |      ;
                       BNE CODE_0CA227                      ;0CA201|D024    |0CA227;
                       LDA.B r_curJoyPe1                    ;0CA203|A526    |000026;
                       AND.B #$04                           ;0CA205|2904    |      ;
                       BNE CODE_0CA219                      ;0CA207|D010    |0CA219;
                       LDA.B r_curJoyPe1                    ;0CA209|A526    |000026;
                       AND.B #$80                           ;0CA20B|2980    |      ;
                       BNE DATA8_0CA216                     ;0CA20D|D007    |0CA216;
                       LDA.B r_curJoyPe1                    ;0CA20F|A526    |000026;
                       AND.B #$40                           ;0CA211|2940    |      ;
                       BNE CODE_0CA237                      ;0CA213|D022    |0CA237;
                       RTS                                  ;0CA215|60      |      ;
 
 
         DATA8_0CA216: db $4C                               ;0CA216|        |      ;
 
                       dw initSound                         ;0CA217|        |0FE227;
 
          CODE_0CA219: INC.W $0780                          ;0CA219|EE8007  |0C0780;
                       LDA.W $0780                          ;0CA21C|AD8007  |0C0780;
                       CMP.B #$19                           ;0CA21F|C919    |      ;
                       BCC CODE_0CA231                      ;0CA221|900E    |0CA231;
                       LDA.B #$19                           ;0CA223|A919    |      ;
                       BNE CODE_0CA22E                      ;0CA225|D007    |0CA22E;
 
          CODE_0CA227: DEC.W $0780                          ;0CA227|CE8007  |0C0780;
                       BPL CODE_0CA231                      ;0CA22A|1005    |0CA231;
                       LDA.B #$00                           ;0CA22C|A900    |      ;
 
          CODE_0CA22E: STA.W $0780                          ;0CA22E|8D8007  |0C0780;
 
          CODE_0CA231: JSR.W CODE_0CA240                    ;0CA231|2040A2  |0CA240;
                       JMP.W drawMusicTitleDemo             ;0CA234|4C59A2  |0CA259;
 
 
          CODE_0CA237: LDY.W $0780                          ;0CA237|AC8007  |0C0780;
                       LDA.W soundDemoIDs,Y                 ;0CA23A|B9C1A2  |0CA2C1;
                       db $4C                               ;0CA23D|        |      ;
 
                       dw initFreezWaterEffect_01           ;0CA23E|        |0FE25F;
 
          CODE_0CA240: LDA.B #$2B                           ;0CA240|A92B    |      ;
                       STA.B r_VRAM_QueueDest               ;0CA242|8561    |000061;
                       LDA.B #$23                           ;0CA244|A923    |      ;
                       STA.B $62                            ;0CA246|8562    |000062;
                       db $20                               ;0CA248|        |      ;
                       dw CODE_0FE8B5                       ;0CA249|        |0FE8B5;
                       LDY.B #$0A                           ;0CA24B|A00A    |      ;
                       LDA.B #$00                           ;0CA24D|A900    |      ;
 
          CODE_0CA24F: STA.W $0300,X                        ;0CA24F|9D0003  |0C0300;
                       INX                                  ;0CA252|E8      |      ;
                       DEY                                  ;0CA253|88      |      ;
                       BNE CODE_0CA24F                      ;0CA254|D0F9    |0CA24F;
                       db $4C                               ;0CA256|        |      ;
 
                       dw endVRAM_queue                     ;0CA257|        |0FE8DE;
 
   drawMusicTitleDemo: LDA.W $0780                          ;0CA259|AD8007  |0C0780;
                       ASL A                                ;0CA25C|0A      |      ;
                       TAY                                  ;0CA25D|A8      |      ;
                       LDA.W textPointerMusicDemo,Y         ;0CA25E|B9DBA2  |0CA2DB;
                       STA.B r_pointerQueue                 ;0CA261|8508    |000008;
                       LDA.W PTR16_0CA2DC,Y                 ;0CA263|B9DCA2  |0CA2DC;
                       STA.B $09                            ;0CA266|8509    |000009;
                       LDA.B #$2B                           ;0CA268|A92B    |      ;
                       STA.B r_VRAM_QueueDest               ;0CA26A|8561    |000061;
                       LDA.B #$23                           ;0CA26C|A923    |      ;
                       STA.B $62                            ;0CA26E|8562    |000062;
                       db $20                               ;0CA270|        |      ;
                       dw CODE_0FE8B5                       ;0CA271|        |0FE8B5;
                       LDY.B #$00                           ;0CA273|A000    |      ;
 
          CODE_0CA275: LDA.B (r_pointerQueue),Y             ;0CA275|B108    |000008;
                       CMP.B #$FF                           ;0CA277|C9FF    |      ;
                       BNE CODE_0CA27E                      ;0CA279|D003    |0CA27E;
                       db $4C                               ;0CA27B|        |      ;
 
                       dw endVRAM_queue                     ;0CA27C|        |0FE8DE;
 
          CODE_0CA27E: STA.W $0300,X                        ;0CA27E|9D0003  |0C0300;
                       INX                                  ;0CA281|E8      |      ;
                       INY                                  ;0CA282|C8      |      ;
                       BNE CODE_0CA275                      ;0CA283|D0F0    |0CA275;
 
     looksLikeText_00: db $CB,$22,$22,$1E,$24,$1D,$13,$00   ;0CA285|        |      ;
                       db $1C,$1E,$13,$14,$FE               ;0CA28D|        |      ;
 
     looksLikeText_01: db $EA,$22,$2E,$2E,$2E,$2E,$2E,$2E   ;0CA292|        |      ;
                       db $2E,$2E,$2E,$2E,$2E,$2E,$FE       ;0CA29A|        |      ;
 
     looksLikeText_02: db $09,$23,$2D,$FE                   ;0CA2A1|        |      ;
 
     looksLikeText_03: db $15,$23,$2D,$FE                   ;0CA2A5|        |      ;
 
     looksLikeText_04: db $29,$23,$2D,$FE                   ;0CA2A9|        |      ;
 
     looksLikeText_05: db $35,$23,$2D,$FE,$49,$23,$2D,$2E   ;0CA2AD|        |      ;
                       db $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E   ;0CA2B5|        |      ;
                       db $2E,$2E,$2F,$FF                   ;0CA2BD|        |      ;
 
         soundDemoIDs: db $4F,$53,$50,$56,$55,$51,$52,$57   ;0CA2C1|        |      ;
                       db $54,$58,$5B,$5C,$6A,$5E,$5F,$63   ;0CA2C9|        |      ;
                       db $60,$64,$6C,$6B,$66,$67,$62,$68   ;0CA2D1|        |      ;
                       db $69,$65                           ;0CA2D9|        |      ;
 
 textPointerMusicDemo: dw text_beginning                    ;0CA2DB|        |0CA30F;
                       dw text_clockWork                    ;0CA2DD|        |0CA319;
                       dw text_madForest                    ;0CA2DF|        |0CA323;
                       dw text_anxiety                      ;0CA2E1|        |0CA32E;
                       dw text_rising                       ;0CA2E3|        |0CA336;
                       dw text_stream                       ;0CA2E5|        |0CA33D;
                       dw text_deadBeat                     ;0CA2E7|        |0CA344;
                       dw text_nightmare                    ;0CA2E9|        |0CA34E;
                       dw text_aquarius                     ;0CA2EB|        |0CA358;
                       dw text_deamonseed                   ;0CA2ED|        |0CA361;
                       dw text_dejavu                       ;0CA2EF|        |0CA36C;
                       dw text_riddle                       ;0CA2F1|        |0CA373;
                       dw text_pressure                     ;0CA2F3|        |0CA37A;
                       dw text_overture                     ;0CA2F5|        |0CA383;
                       dw text_bossFight                    ;0CA2F7|        |0CA38C;
                       dw text_blkClear                     ;0CA2F9|        |0CA397;
                       dw text_bigBattle                    ;0CA2FB|        |0CA3A1;
                       dw text_allClear                     ;0CA2FD|        |0CA3AC;
                       dw text_destiny                      ;0CA2FF|        |0CA3B6;
                       dw text_encounter                    ;0CA301|        |0CA3BE;
                       dw text_preload                      ;0CA303|        |0CA3C8;
                       dw text_prayer                       ;0CA305|        |0CA3D0;
                       dw text_epithap                      ;0CA307|        |0CA3D7;
                       dw text_evergreen                    ;0CA309|        |0CA3DF;
                       dw text_flashBack                    ;0CA30B|        |0CA3E9;
                       dw text_gameover                     ;0CA30D|        |0CA3F4;
 
       text_beginning: db $11,$14,$16,$18,$1D,$1D,$18,$1D   ;0CA30F|        |      ;
                       db $16,$FF                           ;0CA317|        |      ;
 
       text_clockWork: db $12,$1B,$1E,$12,$1A,$26,$1E,$21   ;0CA319|        |      ;
                       db $1A,$FF                           ;0CA321|        |      ;
 
       text_madForest: db $1C,$10,$13,$00,$15,$1E,$21,$14   ;0CA323|        |      ;
                       db $22,$23,$FF                       ;0CA32B|        |      ;
 
         text_anxiety: db $10,$1D,$27,$18,$14,$23,$28,$FF   ;0CA32E|        |      ;
 
          text_rising: db $21,$18,$22,$18,$1D,$16,$FF       ;0CA336|        |      ;
 
          text_stream: db $22,$23,$21,$14,$10,$1C,$FF       ;0CA33D|        |      ;
 
        text_deadBeat: db $13,$14,$10,$13,$00,$11,$14,$10   ;0CA344|        |      ;
                       db $23,$FF                           ;0CA34C|        |      ;
 
       text_nightmare: db $1D,$18,$16,$17,$23,$1C,$10,$21   ;0CA34E|        |      ;
                       db $14,$FF                           ;0CA356|        |      ;
 
        text_aquarius: db $10,$20,$24,$10,$21,$18,$24,$22   ;0CA358|        |      ;
                       db $FF                               ;0CA360|        |      ;
 
      text_deamonseed: db $13,$14,$1C,$1E,$1D,$00,$22,$14   ;0CA361|        |      ;
                       db $14,$13,$FF                       ;0CA369|        |      ;
 
          text_dejavu: db $13,$14,$19,$10,$25,$24,$FF       ;0CA36C|        |      ;
 
          text_riddle: db $21,$18,$13,$13,$1B,$14,$FF       ;0CA373|        |      ;
 
        text_pressure: db $1F,$21,$14,$22,$22,$24,$21,$14   ;0CA37A|        |      ;
                       db $FF                               ;0CA382|        |      ;
 
        text_overture: db $1E,$25,$14,$21,$23,$24,$21,$14   ;0CA383|        |      ;
                       db $FF                               ;0CA38B|        |      ;
 
       text_bossFight: db $11,$1E,$22,$22,$00,$15,$18,$16   ;0CA38C|        |      ;
                       db $17,$23,$FF                       ;0CA394|        |      ;
 
        text_blkClear: db $11,$1B,$1A,$00,$12,$1B,$14,$10   ;0CA397|        |      ;
                       db $21,$FF                           ;0CA39F|        |      ;
 
       text_bigBattle: db $11,$18,$16,$00,$11,$10,$23,$23   ;0CA3A1|        |      ;
                       db $1B,$14,$FF                       ;0CA3A9|        |      ;
 
        text_allClear: db $10,$1B,$1B,$00,$12,$1B,$14,$10   ;0CA3AC|        |      ;
                       db $21,$FF                           ;0CA3B4|        |      ;
 
         text_destiny: db $13,$14,$22,$23,$18,$1D,$28,$FF   ;0CA3B6|        |      ;
 
       text_encounter: db $14,$1D,$12,$1E,$24,$1D,$23,$14   ;0CA3BE|        |      ;
                       db $21,$FF                           ;0CA3C6|        |      ;
 
         text_preload: db $1F,$21,$14,$1B,$24,$13,$14,$FF   ;0CA3C8|        |      ;
 
          text_prayer: db $1F,$21,$10,$28,$14,$21,$FF       ;0CA3D0|        |      ;
 
         text_epithap: db $14,$1F,$18,$23,$10,$1F,$17,$FF   ;0CA3D7|        |      ;
 
       text_evergreen: db $14,$25,$14,$21,$16,$21,$14,$14   ;0CA3DF|        |      ;
                       db $1D,$FF                           ;0CA3E7|        |      ;
 
       text_flashBack: db $15,$1B,$10,$22,$17,$00,$11,$10   ;0CA3E9|        |      ;
                       db $12,$1A,$FF                       ;0CA3F1|        |      ;
 
        text_gameover: db $16,$10,$1C,$14,$00,$1E,$25,$14   ;0CA3F4|        |      ;
                       db $21,$FF                           ;0CA3FC|        |      ;
 
          CODE_0CA3FE: LDA.B #$00                           ;0CA3FE|A900    |      ;
                       STA.B $00                            ;0CA400|8500    |000000;
                       STA.B $01                            ;0CA402|8501    |000001;
                       TAY                                  ;0CA404|A8      |      ;
 
          CODE_0CA405: LDA.B $00                            ;0CA405|A500    |000000;
                       CLC                                  ;0CA407|18      |      ;
                       ADC.B #$04                           ;0CA408|6904    |      ;
                       STA.B $00                            ;0CA40A|8500    |000000;
                       LDA.B $01                            ;0CA40C|A501    |000001;
                       ADC.B #$00                           ;0CA40E|6900    |      ;
                       STA.B $01                            ;0CA410|8501    |000001;
                       LDA.W $0782,Y                        ;0CA412|B98207  |0C0782;
                       CLC                                  ;0CA415|18      |      ;
                       ADC.B $00                            ;0CA416|6500    |000000;
                       STA.W $0782,Y                        ;0CA418|998207  |0C0782;
                       LDA.W $0783,Y                        ;0CA41B|B98307  |0C0783;
                       ADC.B $01                            ;0CA41E|6501    |000001;
                       STA.W $0783,Y                        ;0CA420|998307  |0C0783;
                       TYA                                  ;0CA423|98      |      ;
                       CLC                                  ;0CA424|18      |      ;
                       ADC.B #$12                           ;0CA425|6912    |      ;
                       AND.B #$3F                           ;0CA427|293F    |      ;
                       BEQ CODE_0CA42E                      ;0CA429|F003    |0CA42E;
                       TAY                                  ;0CA42B|A8      |      ;
                       BNE CODE_0CA405                      ;0CA42C|D0D7    |0CA405;
 
          CODE_0CA42E: RTS                                  ;0CA42E|60      |      ;
 
 
       preservY_Ram16: STY.B $00                            ;0CA42F|8400    |000000; that ram address is used for attack on stairs..
                       ASL A                                ;0CA431|0A      |      ;
                       TAY                                  ;0CA432|A8      |      ;
                       LDA.W DATA16_0CA452,Y                ;0CA433|B952A4  |0CA452;
                       STA.B r_coreLoadingFuncAddr          ;0CA436|8516    |000016;
                       LDA.W DATA16_0CA453,Y                ;0CA438|B953A4  |0CA453;
                       STA.B $17                            ;0CA43B|8517    |000017;
                       LDY.B $00                            ;0CA43D|A400    |000000;
                       RTS                                  ;0CA43F|60      |      ;
 
                       PHA                                  ;0CA440|48      |      ;
                       TXA                                  ;0CA441|8A      |      ;
                       JSR.W preservY_Ram16                 ;0CA442|202FA4  |0CA42F;
                       LDX.B r_entityID_processed           ;0CA445|A66C    |00006C;
                       PLA                                  ;0CA447|68      |      ;
                       TAY                                  ;0CA448|A8      |      ;
                       db $4C                               ;0CA449|        |      ;
 
                       dw loadBank_9                        ;0CA44A|        |0FFBCF;
 
      loadBank0e_jump: JSR.W preservY_Ram16                 ;0CA44C|202FA4  |0CA42F;
                       db $4C                               ;0CA44F|        |      ;
 
                       dw loadBank_E                        ;0CA450|        |0FFBD3;
 
        DATA16_0CA452: dw $9628,$98C8,$974F,$BA15           ;0CA452|        |      ;
                       dw $AE3F,$BAF4,$BA6B                 ;0CA45A|        |      ;
                       STA.B (r_bossDopplegangerHitbox,X)   ;0CA460|81BC    |0000BC;
                       db $DF,$88                           ;0CA462|        |      ;
                       LDA.W $0645,X                        ;0CA464|BD4506  |0C0645;
                       BEQ CODE_0CA499                      ;0CA467|F030    |0CA499;
                       CMP.B #$01                           ;0CA469|C901    |      ;
                       BEQ CODE_0CA499                      ;0CA46B|F02C    |0CA499;
                       LDA.B #$00                           ;0CA46D|A900    |      ;
                       STA.W $0669,X                        ;0CA46F|9D6906  |0C0669;
                       LDA.W r_entity_Counter,X             ;0CA472|BD3306  |000633;
                       STA.W r_entity_ObjectIdxes,X         ;0CA475|9D4E05  |00054E;
                       LDA.B #$04                           ;0CA478|A904    |      ;
                       JSR.W loadBank0e_jump                ;0CA47A|204CA4  |0CA44C;
                       LDA.W r_entity_ObjectIdxes,X         ;0CA47D|BD4E05  |00054E;
                       BEQ CODE_0CA499                      ;0CA480|F017    |0CA499;
                       CMP.B #$08                           ;0CA482|C908    |      ;
                       BEQ CODE_0CA48A                      ;0CA484|F004    |0CA48A;
                       CMP.B #$09                           ;0CA486|C909    |      ;
                       BNE CODE_0CA48E                      ;0CA488|D004    |0CA48E;
 
          CODE_0CA48A: LDA.B #$16                           ;0CA48A|A916    |      ;
                       BNE CODE_0CA491                      ;0CA48C|D003    |0CA491;
 
          CODE_0CA48E: LDA.W $048D                          ;0CA48E|AD8D04  |00048D;
 
          CODE_0CA491: STA.W r_entity_OamSpecGroupDoubled,X ;0CA491|9D8C04  |00048C;
                       LDA.B #$0F                           ;0CA494|A90F    |      ;
                       STA.W $054E,X                        ;0CA496|9D4E05  |0C054E;
 
          CODE_0CA499: RTS                                  ;0CA499|60      |      ;
 
                       RTS                                  ;0CA49A|60      |      ;
 
 
          CODE_0CA49B: LDA.W $0438                          ;0CA49B|AD3804  |0C0438;
                       SEC                                  ;0CA49E|38      |      ;
                       SBC.W $0438,X                        ;0CA49F|FD3804  |0C0438;
                       BCS CODE_0CA4A6                      ;0CA4A2|B002    |0CA4A6;
                       EOR.B #$FF                           ;0CA4A4|49FF    |      ;
 
          CODE_0CA4A6: CMP.B #$08                           ;0CA4A6|C908    |      ;
                       BCS CODE_0CA4AE                      ;0CA4A8|B004    |0CA4AE;
                       LDA.B #$04                           ;0CA4AA|A904    |      ;
                       BNE CODE_0CA4B9                      ;0CA4AC|D00B    |0CA4B9;
 
          CODE_0CA4AE: LDA.B #$02                           ;0CA4AE|A902    |      ;
                       BNE CODE_0CA4B9                      ;0CA4B0|D007    |0CA4B9;
                       LDA.W $0633,X                        ;0CA4B2|BD3306  |0C0633;
                       CMP.B #$02                           ;0CA4B5|C902    |      ;
                       BEQ CODE_0CA49B                      ;0CA4B7|F0E2    |0CA49B;
 
          CODE_0CA4B9: STA.B $00                            ;0CA4B9|8500    |000000;
                       ASL A                                ;0CA4BB|0A      |      ;
                       CLC                                  ;0CA4BC|18      |      ;
                       ADC.B $00                            ;0CA4BD|6500    |000000;
                       TAY                                  ;0CA4BF|A8      |      ;
                       LDA.W UNREACH_0CA565,Y               ;0CA4C0|B965A5  |0CA565;
                       CMP.B #$0A                           ;0CA4C3|C90A    |      ;
                       BEQ UNREACH_0CA523                   ;0CA4C5|F05C    |0CA523;
                       STA.B r_pointerQueue                 ;0CA4C7|8508    |000008;
                       LDA.W UNREACH_0CA566,Y               ;0CA4C9|B966A5  |0CA566;
                       PHA                                  ;0CA4CC|48      |      ;
                       LDA.W UNREACH_0CA567,Y               ;0CA4CD|B967A5  |0CA567;
                       PHA                                  ;0CA4D0|48      |      ;
                       LDY.B r_partnerIdx                   ;0CA4D1|A43B    |00003B;
                       LDX.B #$02                           ;0CA4D3|A202    |      ;
                       LDA.B #$03                           ;0CA4D5|A903    |      ;
                       JSR.W loadBank0e_jump                ;0CA4D7|204CA4  |0CA44C;
                       db $68,$A8,$68,$B0,$03,$A6,$6C,$60   ;0CA4DA|        |      ;
                       db $9D,$45,$06,$98,$9D,$57,$06,$BD   ;0CA4E2|        |0C0645;
                       db $4E,$05,$9D,$33,$06,$C9,$05,$F0   ;0CA4EA|        |0C9D05;
                       db $08,$C9,$0A,$F0,$04,$A9,$03,$D0   ;0CA4F2|        |      ;
                       db $02,$A9,$00,$9D,$54,$04,$A9,$0F   ;0CA4FA|        |      ;
                       db $9D,$4E,$05,$20,$C0,$A8,$BD,$45   ;0CA502|        |0C054E;
                       db $06,$85,$BC,$A9,$20,$85,$BA,$A9   ;0CA50A|        |000085;
                       db $00,$85,$BB,$A6,$6C,$A9,$00,$9D   ;0CA512|        |      ;
                       db $93,$05,$A9,$01,$9D,$7C,$05,$38   ;0CA51A|        |000005;
                       db $60                               ;0CA522|        |      ;
 
 
       UNREACH_0CA523: db $B9,$66,$A5,$48,$A2,$02,$A9,$06   ;0CA523|        |0CA566;
                       db $20,$4C,$A4,$68,$90,$31,$85,$01   ;0CA52B|        |0CA44C;
                       db $A2,$02,$BD,$4E,$05,$C9,$0A,$F0   ;0CA533|        |      ;
                       db $07,$E8,$E0,$05,$90,$F4,$B0,$D2   ;0CA53B|        |0000E8;
                       db $BD,$65,$05,$D0,$F4,$A5,$01,$9D   ;0CA543|        |0C0565;
                       db $45,$06,$BD,$4E,$05,$9D,$33,$06   ;0CA54B|        |000006;
                       db $A9,$0F,$9D,$4E,$05,$20,$C0,$A8   ;0CA553|        |      ;
                       db $A9,$30,$9D,$57,$06,$D0,$DA,$A6   ;0CA55B|        |      ;
                       db $6C,$60                           ;0CA563|        |000260;
 
       UNREACH_0CA565: db $02                               ;0CA565|        |      ;
 
       UNREACH_0CA566: db $03                               ;0CA566|        |000030;
 
       UNREACH_0CA567: db $30,$05,$02,$30,$09,$04,$30,$0A   ;0CA567|        |0CA56E;
                       db $06,$30,$08,$05,$30,$BD,$65,$05   ;0CA56F|        |000030;
                       db $48,$38,$E9,$10,$A8,$B9,$99,$A5   ;0CA577|        |      ;
                       db $9D,$65,$05,$BD,$33,$06,$9D,$4E   ;0CA57F|        |0C0565;
                       db $05,$A9,$05,$20,$4C,$A4,$A6,$6C   ;0CA587|        |0000A9;
                       db $68,$9D,$65,$05,$A9,$0B,$9D,$4E   ;0CA58F|        |      ;
                       db $05,$60,$20,$22                   ;0CA597|        |000060;
 
  entiyIndex_stuff_0B: LDA.B #$00                           ;0CA59B|A900    |      ;
                       STA.W $0657,X                        ;0CA59D|9D5706  |0C0657;
                       STA.W $05EF,X                        ;0CA5A0|9DEF05  |0C05EF;
                       STA.W $0565,X                        ;0CA5A3|9D6505  |0C0565;
                       JSR.W CODE_0CA8B8                    ;0CA5A6|20B8A8  |0CA8B8;
                       LDA.B #$01                           ;0CA5A9|A901    |      ;
                       STA.W $04A8,X                        ;0CA5AB|9DA804  |0C04A8;
                       LDA.B #$00                           ;0CA5AE|A900    |      ;
                       STA.W $0400,X                        ;0CA5B0|9D0004  |0C0400;
                       LDA.B #$01                           ;0CA5B3|A901    |      ;
                       STA.B r_defaultCHR                   ;0CA5B5|85B0    |0000B0;
                       LDA.B r_bossActiveFlag               ;0CA5B7|A578    |000078;
                       BEQ CODE_0CA5C0                      ;0CA5B9|F005    |0CA5C0;
                       LDY.B #$00                           ;0CA5BB|A000    |      ;
                       STY.W $07F3                          ;0CA5BD|8CF307  |0C07F3;
 
          CODE_0CA5C0: RTS                                  ;0CA5C0|60      |      ;
 
                       db $A6,$6C,$BD,$65,$05,$C9,$19,$90   ;0CA5C1|        |00006C;
                       db $03,$4C,$2A,$A6,$20,$B4,$A8,$A9   ;0CA5C9|        |00004C;
                       db $19,$9D,$65,$05,$4C,$2A,$A6,$DE   ;0CA5D1|        |0C659D;
                       db $06,$06,$F0,$01,$60,$BD,$65,$05   ;0CA5D9|        |000006;
                       db $29,$7F,$9D,$65,$05,$AD,$EE,$07   ;0CA5E1|        |      ;
                       db $9D,$70,$04,$A9,$01,$8D,$EF,$07   ;0CA5E9|        |0C0470;
                       db $60,$A9,$00,$9D,$69,$06,$BD,$65   ;0CA5F1|        |      ;
 
                       db $05,$09,$80,$9D,$65,$05,$A9,$0C   ;0CA5F9|        |000009;
                       db $9D,$06,$06,$BD,$70,$04,$8D,$EE   ;0CA601|        |0C0606;
                       db $07,$20,$AC,$A8,$4C,$20,$A6,$A9   ;0CA609|        |000020;
                       db $03,$A2,$08,$20,$40,$A4,$A5,$3D   ;0CA611|        |0000A2;
                       db $F0,$A6,$BD,$69,$06,$D0,$D2,$20   ;0CA619|        |0CA5C1;
                       db $6E,$A6,$90,$05,$A9,$05,$9D,$65   ;0CA621|        |0C90A6;
                       db $05,$A6,$6C,$BD,$65,$05,$30,$A7   ;0CA629|        |0000A6;
                       db $20,$6D,$E8,$8B,$A7,$9D,$A7,$AA   ;0CA631|        |0CE86D;
                       db $A7,$9D,$A7,$C0,$A7,$6C,$A7,$7D   ;0CA639|        |00009D;
                       db $A7,$9D,$A7,$AA,$A7,$9D,$A7,$C0   ;0CA641|        |00009D;
                       db $A7,$E2,$A9,$F1,$A9,$78,$AA,$04   ;0CA649|        |0000E2;
                       db $AB,$22,$AB,$7F,$AB,$22,$AB,$93   ;0CA651|        |      ;
                       db $AB,$94,$AB,$A8,$AB,$A8,$AB,$E2   ;0CA659|        |      ;
                       db $A9,$E2,$A9,$E2,$A9,$E7,$A6,$19   ;0CA661|        |      ;
                       db $A7,$39,$A7,$6B,$A7,$A6,$6C,$BD   ;0CA669|        |000039;
                       db $65,$05,$C9,$0B,$90,$0E,$C9,$19   ;0CA671|        |000005;
                       db $B0,$0A,$AD,$4E,$05,$DD,$33,$06   ;0CA679|        |0CA685;
                       db $F0,$02,$38,$60,$18,$60,$A2,$02   ;0CA681|        |0CA685;
                       db $A9,$00,$9D,$00,$04,$9D,$4E,$05   ;0CA689|        |      ;
                       db $9D,$38,$04,$9D,$1C,$04,$9D,$70   ;0CA691|        |0C0438;
                       db $04,$E8,$E0,$06,$90,$EC,$A6,$6C   ;0CA699|        |0000E8;
                       db $60,$BD,$38,$04,$85,$00,$BD,$1C   ;0CA6A1|        |      ;
 
                       db $04,$85,$01,$A2,$03,$A9,$00,$85   ;0CA6A9|        |000085;
                       db $02,$A4,$02,$18,$A5,$00,$79,$DF   ;0CA6B1|        |      ;
                       db $A6,$9D,$38,$04,$18,$A5,$01,$79   ;0CA6B9|        |00009D;
                       db $E0,$A6,$9D,$1C,$04,$20,$B4,$A8   ;0CA6C1|        |      ;
                       db $A9,$0E,$A0,$08,$20,$5C,$EF,$A9   ;0CA6C9|        |      ;
                       db $00,$9D,$54,$04,$E6,$02,$E6,$02   ;0CA6D1|        |      ;
                       db $E8,$E0,$07,$90,$D4,$60,$00,$00   ;0CA6D9|        |      ;
                       db $00,$E8,$F8,$F4,$08,$F4,$A9,$7B   ;0CA6E1|        |      ;
                       db $20,$5F,$E2,$20,$CE,$E5,$A9,$00   ;0CA6E9|        |0CE25F;
                       db $85,$03,$85,$01,$A9,$50,$85,$02   ;0CA6F1|        |000003;
                       db $20,$77,$E7,$20,$87,$A6,$20,$A2   ;0CA6F9|        |0CE777;
                       db $A6,$A6,$6C,$20,$AC,$A8,$A9,$00   ;0CA701|        |0000A6;
                       db $A8,$20,$9C,$A8,$20,$A4,$A8,$A9   ;0CA709|        |      ;
                       db $B4,$9D,$06,$06,$FE,$65,$05,$60   ;0CA711|        |00009D;
                       db $DE,$06,$06,$D0,$03,$FE,$65,$05   ;0CA719|        |0C0606;
                       db $A2,$03,$20,$75,$EF,$E8,$E0,$07   ;0CA721|        |      ;
                       db $90,$F8,$A6,$6C,$A5,$1A,$4A,$4A   ;0CA729|        |0CA723;
                       db $29,$03,$9D,$33,$06,$4C,$FC,$A7   ;0CA731|        |      ;
                       db $A9,$00,$8D,$01,$04,$8D,$03,$04   ;0CA739|        |      ;
                       db $8D,$04,$04,$8D,$05,$04,$8D,$06   ;0CA741|        |0C0404;
                       db $04,$A9,$02,$8D,$F3,$07,$AD,$69   ;0CA749|        |0000A9;
                       db $A7,$85,$00,$AD,$6A,$A7,$85,$01   ;0CA751|        |000085;
                       db $A9,$92,$20,$2F,$E6,$A6,$6C,$A9   ;0CA759|        |      ;
                       db $00,$9D,$00,$04,$9D,$4E,$05,$60   ;0CA761|        |      ;
                       db $F4,$87,$60,$20,$87,$A6,$A6,$6C   ;0CA769|        |0C6087;
                       db $A9,$18,$9D,$06,$06,$20,$AC,$A8   ;0CA771|        |      ;
                       db $FE,$65,$05,$60,$DE,$06,$06,$D0   ;0CA779|        |0C0565;
                       db $FA,$A9,$2F,$85,$49,$A9,$45,$20   ;0CA781|        |      ;
                       db $5F,$E2,$20,$B4,$A8,$A9,$20,$9D   ;0CA789|        |B420E2;
                       db $06,$06,$FE,$65,$05,$A9,$00,$A0   ;0CA791|        |000006;
                       db $0E,$4C,$5C,$EF,$DE,$06,$06,$F0   ;0CA799|        |0C5C4C;
                       db $01,$60,$20,$B0,$A8,$FE,$65,$05   ;0CA7A1|        |000060;
                       db $60,$A9,$2F,$85,$49,$20,$B4,$A8   ;0CA7A9|        |      ;
 
                       db $A9,$10,$9D,$06,$06,$FE,$65,$05   ;0CA7B1|        |      ;
                       db $A9,$00,$A0,$0F,$4C,$5C,$EF,$AD   ;0CA7B9|        |      ;
                       db $4E,$05,$20,$DA,$A7,$A5,$00,$9D   ;0CA7C1|        |0C2005;
                       db $65,$05,$A9,$04,$9D,$06,$06,$BC   ;0CA7C9|        |000005;
                       db $33,$06,$B9,$30,$A8,$9D,$57,$06   ;0CA7D1|        |000006;
                       db $60,$48,$BD,$33,$06,$C9,$02,$D0   ;0CA7D9|        |      ;
 
                       db $09,$BD,$1C,$04,$38,$E9,$04,$9D   ;0CA7E1|        |      ;
                       db $1C,$04,$68,$9D,$33,$06,$C9,$02   ;0CA7E9|        |0C6804;
                       db $D0,$09,$BD,$1C,$04,$18,$69,$04   ;0CA7F1|        |0CA7FC;
                       db $9D,$1C,$04,$BD,$33,$06,$0A,$18   ;0CA7F9|        |0C041C;
                       db $7D,$33,$06,$A8,$B9,$24,$A8,$9D   ;0CA801|        |0C0633;
                       db $8C,$04,$B9,$25,$A8,$85,$00,$B9   ;0CA809|        |0CB904;
                       db $26,$A8,$85,$48,$A8,$C8,$84,$49   ;0CA811|        |0000A8;
                       db $A9,$02,$9D,$00,$04,$A9,$02,$9D   ;0CA819|        |      ;
                       db $54,$04,$60,$16,$0C,$00,$18,$0C   ;0CA821|        |      ;
                       db $04,$1A,$0C,$02,$1C,$0C,$06,$30   ;0CA829|        |00001A;
                       db $30,$30,$30,$BD,$38,$04,$C9,$E8   ;0CA831|        |0CA863;
                       db $B0,$0A,$C9,$18,$90,$02,$18,$60   ;0CA839|        |0CA845;
                       db $A0,$00,$38,$60,$A0,$01,$38,$60   ;0CA841|        |      ;
                       db $AD,$38,$04,$38,$FD,$38,$04,$B0   ;0CA849|        |0C0438;
                       db $03,$49,$FF,$18,$60,$20,$49,$A8   ;0CA851|        |000049;
                       db $48,$B0,$04,$A9,$01,$D0,$02,$A9   ;0CA859|        |      ;
                       db $00,$9D,$A8,$04,$68,$60,$BD,$F2   ;0CA861|        |      ;
                       db $04,$10,$04,$A9,$F8,$D0,$02,$A9   ;0CA869|        |000010;
                       db $08,$85,$07,$A0,$F8,$20,$1E,$FC   ;0CA871|        |      ;
                       db $D0,$1F,$A5,$07,$A0,$00,$20,$1E   ;0CA879|        |0CA89A;
                       db $FC,$D0,$16,$18,$60,$A9,$05,$A0   ;0CA881|        |0C16D0;
                       db $10,$20,$1E,$FC,$D0,$0B,$A9,$FB   ;0CA889|        |0CA8AB;
                       db $A0,$10,$20,$1E,$FC,$D0,$02,$18   ;0CA891|        |      ;
                       db $60,$38,$60,$9D,$F2,$04,$98,$9D   ;0CA899|        |      ;
 
                       db $09,$05,$60,$9D,$20,$05,$98,$9D   ;0CA8A1|        |      ;
                       db $37,$05,$60,$A9,$30,$D0,$12,$A9   ;0CA8A9|        |000005;
                       db $50,$D0,$0E,$A9,$10,$D0,$0A       ;0CA8B1|        |0CA883;
 
          CODE_0CA8B8: LDA.B #$60                           ;0CA8B8|A960    |      ;
                       BNE CODE_0CA8C2                      ;0CA8BA|D006    |0CA8C2;
                       LDA.B #$40                           ;0CA8BC|A940    |      ;
                       BNE CODE_0CA8C2                      ;0CA8BE|D002    |0CA8C2;
                       LDA.B #$20                           ;0CA8C0|A920    |      ;
 
          CODE_0CA8C2: STA.W $0470,X                        ;0CA8C2|9D7004  |0C0470;
                       RTS                                  ;0CA8C5|60      |      ;
 
                       db $BD,$65,$05,$C9,$11,$F0,$04,$C9   ;0CA8C6|        |0C0565;
                       db $12,$D0,$08,$BD,$33,$06,$18,$69   ;0CA8CE|        |0000D0;
                       db $04,$D0,$03,$AD,$4E,$05,$8D,$EC   ;0CA8D6|        |0000D0;
                       db $07,$60,$BD,$33,$06,$0A,$0A,$0A   ;0CA8DE|        |000060;
                       db $85,$00,$A5,$1A,$29,$07,$18,$65   ;0CA8E6|        |000000;
                       db $00,$A8,$B9,$F7,$A8,$9D,$06,$06   ;0CA8EE|        |      ;
                       db $60,$09,$13,$03,$14,$0C,$1F,$11   ;0CA8F6|        |      ;
 
                       db $0F,$09,$13,$03,$14,$0C,$1F,$11   ;0CA8FE|        |031309;
                       db $0F,$09,$13,$03,$14,$0C,$1F,$11   ;0CA906|        |031309;
                       db $0F,$09,$13,$03,$14,$0C,$1F,$11   ;0CA90E|        |031309;
                       db $0F,$A9,$13,$9D,$65,$05,$BD,$33   ;0CA916|        |9D13A9;
                       db $06,$A8,$A2,$05,$B9,$3B,$A9,$9D   ;0CA91E|        |0000A8;
                       db $45,$06,$A9,$0F,$9D,$4E,$05,$A9   ;0CA926|        |000006;
                       db $00,$9D,$65,$05,$9D,$57,$06,$20   ;0CA92E|        |      ;
                       db $C0,$A8,$A6,$6C,$60,$00,$01,$A2   ;0CA936|        |      ;
                       db $02,$BD,$4E,$05,$D0,$09,$E8,$E0   ;0CA93E|        |      ;
                       db $05,$90,$F6,$A6,$6C,$18,$60,$A6   ;0CA946|        |000090;
                       db $6C,$38,$60,$20,$49,$A8,$C9,$30   ;0CA94E|        |006038;
                       db $B0,$15,$BD,$33,$06,$C9,$02,$B0   ;0CA956|        |0CA96D;
                       db $0E,$20,$3D,$A9,$B0,$07,$20,$17   ;0CA95E|        |0C3D20;
                       db $A9,$A0,$00,$38,$60,$18,$60,$20   ;0CA966|        |      ;
                       db $B2,$A4,$90,$F9,$A0,$01,$38,$60   ;0CA96E|        |0000A4;
                       db $BD,$33,$06,$9D,$4E,$05,$BD,$65   ;0CA976|        |0C0633;
                       db $05,$48,$A9,$18,$9D,$65,$05,$A2   ;0CA97E|        |000048;
                       db $05,$BD,$33,$06,$9D,$4E,$05,$A9   ;0CA986|        |0000BD;
                       db $07,$20,$4C,$A4,$B0,$04,$A9,$00   ;0CA98E|        |000020;
                       db $F0,$02,$A9,$01,$85,$01,$BD,$4E   ;0CA996|        |0CA99A;
                       db $05,$9D,$33,$06,$A9,$0F,$9D,$4E   ;0CA99E|        |00009D;
                       db $05,$BD,$1D,$06,$F0,$1A,$BC,$33   ;0CA9A6|        |0000BD;
                       db $06,$B9,$D4,$A9,$9D,$57,$06,$A9   ;0CA9AE|        |0000B9;
                       db $40,$85,$BA,$BC,$33,$06,$B9,$D8   ;0CA9B6|        |      ;
                       db $A9,$85,$BC,$B9,$DC,$A9,$85,$BB   ;0CA9BE|        |      ;
                       db $A6,$6C,$68,$9D,$65,$05,$A9,$0B   ;0CA9C6|        |00006C;
                       db $9D,$4E,$05,$46,$01,$60,$20,$30   ;0CA9CE|        |0C054E;
                       db $30,$20,$00,$01,$02,$00,$01,$02   ;0CA9D6|        |0CA9F8;
                       db $03,$04,$18,$60,$20,$C6,$A8,$20   ;0CA9DE|        |000004;
                       db $56,$A8,$20,$E0,$A8,$A9,$0C,$9D   ;0CA9E6|        |0000A8;
                       db $65,$05,$60,$20,$C6,$A8,$20,$56   ;0CA9EE|        |000005;
                       db $A8,$20,$C0,$A8,$20,$86,$A8,$B0   ;0CA9F6|        |      ;
                       db $0E,$20,$B8,$A8,$A9,$02,$20,$4C   ;0CA9FE|        |0CB820;
                       db $A4,$A9,$0F,$9D,$65,$05,$60,$A9   ;0CAA06|        |0000A9;
                       db $02,$9D,$00,$04,$BD,$06,$06,$F0   ;0CAA0E|        |      ;
                       db $05,$DE,$06,$06,$D0,$44,$20,$E0   ;0CAA16|        |0000DE;
                       db $A8,$20,$E0,$A9,$B0,$0B,$AD,$EF   ;0CAA1E|        |      ;
                       db $07,$D0,$38,$A5,$1A,$29,$01,$D0   ;0CAA26|        |0000D0;
                       db $32,$BC,$33,$06,$A9,$00,$20,$60   ;0CAA2E|        |0000BC;
                       db $EF,$20,$BC,$A8,$20,$34,$A8,$90   ;0CAA36|        |A8BC20;
                       db $0C,$84,$00,$5D,$A8,$04,$F0,$05   ;0CAA3E|        |0C0084;
                       db $A5,$00,$9D,$A8,$04,$BD,$A8,$04   ;0CAA46|        |000000;
                       db $F0,$04,$A9,$FF,$D0,$02,$A9,$01   ;0CAA4E|        |0CAA54;
                       db $A0,$00,$20,$9C,$A8,$A9,$0D,$9D   ;0CAA56|        |      ;
                       db $65,$05,$60,$A9,$00,$8D,$EF,$07   ;0CAA5E|        |000005;
                       db $20,$51,$A9,$90,$C4,$88,$F0,$01   ;0CAA66|        |0CA951;
                       db $60,$A9,$10,$9D,$65,$05,$20,$C0   ;0CAA6E|        |      ;
 
                       db $A8,$60,$20,$C6,$A8,$20,$86,$A8   ;0CAA76|        |      ;
                       db $B0,$2D,$AD,$1C,$04,$DD,$1C,$04   ;0CAA7E|        |0CAAAD;
                       db $B0,$03,$4C,$E7,$AA,$A9,$02,$20   ;0CAA86|        |0CAA8B;
                       db $4C,$A4,$A9,$0F,$9D,$65,$05,$60   ;0CAA8E|        |0CA9A4;
                       db $88,$F0,$04,$A9,$18,$D0,$02,$A9   ;0CAA96|        |      ;
                       db $E8,$9D,$38,$04,$A9,$10,$9D,$06   ;0CAA9E|        |      ;
                       db $06,$A9,$0C,$9D,$65,$05,$60,$20   ;0CAAA6|        |0000A9;
                       db $34,$A8,$B0,$E4,$20,$67,$A8,$B0   ;0CAAAE|        |0000A8;
                       db $30,$DE,$06,$06,$D0,$2A,$20,$E0   ;0CAAB6|        |0CAA96;
                       db $A9,$B0,$20,$A5,$1A,$29,$07,$A8   ;0CAABE|        |      ;
                       db $B9,$FC,$AA,$9D,$65,$05,$C9,$10   ;0CAAC6|        |0CAAFC;
                       db $F0,$21,$C9,$0C,$F0,$12,$20,$56   ;0CAACE|        |0CAAF1;
                       db $A8,$C9,$40,$B0,$0C,$A9,$00,$8D   ;0CAAD6|        |      ;
                       db $ED,$07,$60,$A9,$0E,$9D,$65,$05   ;0CAADE|        |0C6007;
                       db $60,$BD,$A8,$04,$A8,$C8,$8C,$ED   ;0CAAE6|        |      ;
 
                       db $07,$D0,$F0,$20,$51,$A9,$90,$F1   ;0CAAEE|        |0000D0;
                       db $88,$D0,$ED,$4C,$C0,$A8,$0C,$10   ;0CAAF6|        |      ;
                       db $0E,$10,$0C,$10,$0E,$0C,$20,$C6   ;0CAAFE|        |0C0C10;
                       db $A8,$20,$B8,$A8,$AC,$ED,$07,$B9   ;0CAB06|        |      ;
                       db $1B,$AB,$85,$10,$A9,$00,$20,$4C   ;0CAB0E|        |      ;
                       db $A4,$FE,$65,$05,$60,$00,$01,$02   ;0CAB16|        |0000FE;
                       db $04,$08,$40,$80,$20,$C6,$A8,$20   ;0CAB1E|        |000008;
                       db $34,$A8,$90,$0C,$88,$F0,$04,$A9   ;0CAB26|        |0000A8;
                       db $18,$D0,$02,$A9,$E8,$9D,$38,$04   ;0CAB2E|        |      ;
                       db $A9,$01,$20,$4C,$A4,$BD,$C1,$05   ;0CAB36|        |      ;
                       db $F0,$17,$BD,$1C,$04,$C9,$B4,$90   ;0CAB3E|        |0CAB57;
                       db $07,$A9,$B4,$9D,$1C,$04,$D0,$0A   ;0CAB46|        |0000A9;
                       db $A9,$00,$A0,$10,$20,$1E,$FC,$D0   ;0CAB4E|        |      ;
                       db $01,$60,$A9,$00,$A8,$20,$A4,$A8   ;0CAB56|        |000060;
                       db $20,$9C,$A8,$BD,$1C,$04,$29,$F0   ;0CAB5E|        |0CA89C;
                       db $9D,$1C,$04,$BD,$33,$06,$C9,$02   ;0CAB66|        |0C041C;
                       db $D0,$09,$BD,$1C,$04,$18,$69,$04   ;0CAB6E|        |0CAB79;
                       db $9D,$1C,$04,$A9,$0B,$9D,$65,$05   ;0CAB76|        |0C041C;
                       db $60,$20,$C6,$A8,$20,$74,$A5,$B0   ;0CAB7E|        |      ;
 
                       db $01,$60,$A9,$0C,$9D,$65,$05,$A9   ;0CAB86|        |000060;
                       db $02,$9D,$00,$04,$60,$60,$20,$C0   ;0CAB8E|        |      ;
                       db $A8,$20,$76,$A9,$B0,$01,$60,$A9   ;0CAB96|        |      ;
                       db $0B,$9D,$65,$05,$A9,$02,$9D,$00   ;0CAB9E|        |      ;
                       db $04,$60                           ;0CABA6|        |000060;
 
 RLE_tilemap_map00_06: dw $2000                             ;0CABA8|        |      ;
                       db $7E,$00,$05,$00,$99,$F0,$01,$02   ;0CABAA|        |      ;
                       db $03,$04,$05,$06,$07,$08,$46,$0A   ;0CABB2|        |      ;
                       db $0B,$0C,$0D,$0E,$0F,$09,$0A,$29   ;0CABBA|        |      ;
                       db $05,$06,$06,$19,$07,$1A,$07,$00   ;0CABC2|        |      ;
                       db $99,$10,$11,$12,$13,$14,$15,$16   ;0CABCA|        |      ;
                       db $17,$18,$AC,$CB,$1B,$1C,$1D,$1E   ;0CABD2|        |      ;
                       db $1F,$9B,$CC,$CC,$9B,$9B,$CB,$CB   ;0CABDA|        |      ;
                       db $8B,$2A,$07,$00,$93,$20,$21,$22   ;0CABE2|        |      ;
                       db $23,$24,$25,$26,$27,$28,$9B,$9B   ;0CABEA|        |      ;
                       db $2B,$2C,$2D,$2E,$2F,$9B,$9B,$AC   ;0CABF2|        |      ;
                       db $04,$CB,$82,$7B,$CF,$07,$00,$92   ;0CABFA|        |      ;
                       db $30,$31,$32,$33,$34,$35,$36,$37   ;0CAC02|        |      ;
                       db $AC,$9B,$9B,$3B,$3C,$3D,$3E,$3F   ;0CAC0A|        |      ;
                       db $9B,$CC,$03,$9B,$84,$CC,$9B,$8B   ;0CAC12|        |      ;
                       db $8C,$07,$00,$91,$40,$41,$42,$43   ;0CAC1A|        |      ;
                       db $44,$45,$46,$47,$48,$49,$4A,$4B   ;0CAC22|        |      ;
                       db $4C,$4D,$4E,$4F,$AC,$03,$CB,$85   ;0CAC2A|        |      ;
 
                       db $AC,$CB,$9B,$8B,$9C,$07,$00,$99   ;0CAC32|        |      ;
                       db $50,$51,$52,$53,$54,$28,$D1,$57   ;0CAC3A|        |      ;
                       db $58,$59,$5A,$5B,$5C,$5D,$5E,$5F   ;0CAC42|        |      ;
                       db $85,$86,$CC,$88,$89,$9B,$CB,$CC   ;0CAC4A|        |      ;
                       db $DF,$07,$00,$9A,$60,$51,$62,$63   ;0CAC52|        |      ;
                       db $64,$65,$66,$67,$68,$69,$6A,$6B   ;0CAC5A|        |      ;
                       db $6C,$6D,$6E,$6F,$95,$96,$97,$98   ;0CAC62|        |      ;
 
                       db $99,$CB,$9B,$8B,$00,$9D,$06,$00   ;0CAC6A|        |      ;
                       db $99,$70,$51,$60,$73,$5A,$74,$5A   ;0CAC72|        |      ;
                       db $77,$78,$79,$7A,$B1,$7C,$7D,$7E   ;0CAC7A|        |      ;
                       db $7F,$A5,$A6,$A7,$A8,$B9,$CB,$9B   ;0CAC82|        |      ;
                       db $7B,$AD,$07,$00,$99,$51,$62,$72   ;0CAC8A|        |      ;
                       db $62,$51,$84,$69,$6A,$00,$00,$8A   ;0CAC92|        |      ;
                       db $AC,$CB,$8D,$8E,$8F,$B5,$B6,$B7   ;0CAC9A|        |      ;
                       db $B8,$B9,$9B,$8B,$EF,$9C,$07,$00   ;0CACA2|        |      ;
                       db $8F,$59,$81,$82,$83,$61,$00,$80   ;0CACAA|        |      ;
                       db $B5,$B1,$7C,$9A,$CC,$9B,$AC,$9B   ;0CACB2|        |      ;
                       db $03,$CC,$88,$B1,$D9,$DA,$7B,$DF   ;0CACBA|        |      ;
                       db $AB,$EF,$CF,$06,$00,$99,$51,$51   ;0CACC2|        |      ;
                       db $60,$5A,$81,$90,$51,$94,$CB,$CB   ;0CACCA|        |      ;
 
                       db $CC,$9B,$CB,$9B,$CB,$9B,$9B,$8B   ;0CACD2|        |      ;
                       db $A9,$AA,$AB,$AB,$EF,$EF,$9E,$07   ;0CACDA|        |      ;
                       db $00,$99,$61,$90,$81,$69,$51,$60   ;0CACE2|        |      ;
                       db $81,$60,$94,$CB,$CC,$CC,$9B,$CC   ;0CACEA|        |      ;
                       db $CB,$7B,$DF,$EF,$AB,$BA,$BB,$BC   ;0CACF2|        |      ;
                       db $BD,$EF,$AE,$07,$00,$9A,$8E,$91   ;0CACFA|        |      ;
                       db $92,$93,$83,$81,$51,$60,$3C,$D0   ;0CAD02|        |      ;
                       db $CC,$9B,$AC,$9B,$9B,$C6,$C7,$C8   ;0CAD0A|        |      ;
                       db $C9,$CA,$E4,$7E,$CD,$CE,$AB,$CF   ;0CAD12|        |      ;
                       db $06,$00,$9A,$A0,$A1,$A2,$A3,$A4   ;0CAD1A|        |      ;
                       db $A6,$90,$71,$71,$7D,$D1,$CC,$9B   ;0CAD22|        |      ;
                       db $CC,$7B,$D6,$D7,$D8,$EF,$AB,$DB   ;0CAD2A|        |      ;
                       db $DC,$DD,$DE,$AB,$9F,$06,$00,$9A   ;0CAD32|        |      ;
                       db $B0,$CC,$CB,$9B,$B4,$B3,$18,$18   ;0CAD3A|        |      ;
                       db $36,$E0,$E1,$E2,$E3,$E4,$E5,$E6   ;0CAD42|        |      ;
                       db $E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE   ;0CAD4A|        |      ;
                       db $DF,$AF,$06,$00,$9A,$C0,$C1,$C2   ;0CAD52|        |      ;
                       db $C3,$B3,$18,$B5,$E0,$7B,$F6,$F1   ;0CAD5A|        |      ;
                       db $E5,$F3,$F4,$F5,$F6,$F7,$F8,$F9   ;0CAD62|        |      ;
                       db $FA,$FB,$FC,$FD,$FE,$BE,$BF,$7E   ;0CAD6A|        |      ;
                       db $00,$7E,$00,$47,$00,$38,$55,$08   ;0CAD72|        |      ;
                       db $05,$FF                           ;0CAD7A|        |      ;
 
RLE_tilemap_0f_castleIntro: dw $2000                             ;0CAD7C|        |      ;
                       db $44,$00,$14,$3E,$81,$67,$07,$3D   ;0CAD7E|        |      ;
                       db $04,$00,$13,$3E,$82,$76,$77,$07   ;0CAD86|        |      ;
                       db $3D,$04,$00,$15,$3E,$82,$76,$77   ;0CAD8E|        |      ;
                       db $05,$3D,$04,$00,$16,$3E,$81,$67   ;0CAD96|        |      ;
                       db $05,$3D,$04,$00,$83,$3E,$3E,$45   ;0CAD9E|        |      ;
                       db $12,$3E,$82,$76,$77,$05,$3D,$04   ;0CADA6|        |      ;
                       db $00,$8A,$3E,$45,$3E,$45,$45,$3E   ;0CADAE|        |      ;
                       db $3E,$45,$45,$3E,$03,$45,$8B,$3E   ;0CADB6|        |      ;
                       db $3E,$45,$3E,$45,$3E,$3E,$45,$3E   ;0CADBE|        |      ;
                       db $3E,$67,$04,$3D,$04,$00,$8A,$45   ;0CADC6|        |      ;
                       db $55,$45,$55,$45,$55,$45,$55,$45   ;0CADCE|        |      ;
                       db $45,$04,$55,$04,$45,$86,$55,$55   ;0CADD6|        |      ;
                       db $45,$45,$76,$77,$04,$3D,$04,$00   ;0CADDE|        |      ;
                       db $84,$55,$55,$00,$00,$05,$55,$06   ;0CADE6|        |      ;
                       db $00,$82,$55,$55,$03,$00,$84,$55   ;0CADEE|        |      ;
                       db $45,$45,$55,$04,$3D,$03,$00,$81   ;0CADF6|        |      ;
                       db $6D,$04,$00,$82,$5A,$4A,$05,$00   ;0CADFE|        |      ;
                       db $81,$40,$06,$00,$82,$5A,$4A,$03   ;0CAE06|        |      ;
                       db $00,$81,$6D,$07,$00,$89,$6D,$00   ;0CAE0E|        |      ;
                       db $49,$4A,$69,$6A,$7A,$49,$4A,$03   ;0CAE16|        |      ;
                       db $00,$81,$50,$03,$00,$89,$49,$4A   ;0CAE1E|        |      ;
                       db $69,$6A,$7A,$4A,$00,$00,$6D,$07   ;0CAE26|        |      ;
                       db $00,$81,$6D,$03,$00,$95,$55,$5A   ;0CAE2E|        |      ;
                       db $4A,$00,$00,$40,$00,$00,$60,$62   ;0CAE36|        |      ;
                       db $41,$00,$00,$7B,$79,$55,$7A,$5A   ;0CAE3E|        |      ;
                       db $4A,$00,$6D,$07,$00,$99,$6D,$00   ;0CAE46|        |      ;
                       db $49,$4A,$69,$6A,$7A,$4A,$00,$50   ;0CAE4E|        |      ;
                       db $00,$00,$41,$62,$51,$40,$00,$00   ;0CAE56|        |      ;
                       db $5A,$4A,$69,$6A,$7A,$4A,$6D,$07   ;0CAE5E|        |      ;
                       db $00,$99,$6D,$00,$46,$49,$46,$45   ;0CAE66|        |      ;
                       db $56,$56,$00,$60,$62,$41,$51,$74   ;0CAE6E|        |      ;
                       db $62,$50,$00,$69,$7A,$78,$7B,$46   ;0CAE76|        |      ;
                       db $7B,$7A,$6D,$07,$00,$84,$6D,$00   ;0CAE7E|        |      ;
                       db $69,$7B,$05,$00,$8A,$42,$70,$63   ;0CAE86|        |      ;
                       db $42,$51,$64,$60,$64,$00,$66,$03   ;0CAE8E|        |      ;
                       db $00,$83,$79,$00,$6D,$07,$00,$81   ;0CAE96|        |      ;
                       db $6D,$08,$00,$8C,$52,$70,$61,$75   ;0CAE9E|        |      ;
                       db $71,$74,$7B,$74,$00,$00,$43,$44   ;0CAEA6|        |      ;
                       db $03,$00,$81,$6D,$07,$00,$81,$6D   ;0CAEAE|        |      ;
                       db $09,$00,$8B,$51,$71,$51,$00,$75   ;0CAEB6|        |      ;
                       db $71,$51,$00,$00,$53,$54,$03,$00   ;0CAEBE|        |      ;
                       db $81,$6D,$07,$00,$81,$6D,$04,$00   ;0CAEC6|        |      ;
                       db $81,$40,$03,$00,$8C,$68,$58,$4B   ;0CAECE|        |      ;
                       db $73,$63,$51,$5B,$58,$70,$70,$42   ;0CAED6|        |      ;
                       db $54,$03,$00,$81,$6D,$07,$00,$81   ;0CAEDE|        |      ;
                       db $6D,$04,$00,$81,$50,$03,$00,$8C   ;0CAEE6|        |      ;
                       db $73,$59,$66,$73,$71,$00,$4B,$7A   ;0CAEEE|        |      ;
                       db $70,$70,$61,$62,$03,$00,$81,$6D   ;0CAEF6|        |      ;
                       db $07,$00,$81,$6D,$04,$00,$90,$60   ;0CAEFE|        |      ;
                       db $00,$00,$4B,$58,$73,$59,$65,$4B   ;0CAF06|        |      ;
                       db $5B,$65,$00,$73,$5B,$61,$62,$03   ;0CAF0E|        |      ;
                       db $00,$81,$6D,$07,$00,$81,$6D,$04   ;0CAF16|        |      ;
                       db $00,$90,$42,$70,$66,$66,$73,$66   ;0CAF1E|        |      ;
                       db $59,$66,$59,$4B,$73,$5B,$00,$4B   ;0CAF26|        |      ;
                       db $5B,$4B,$03,$00,$81,$6D,$07,$00   ;0CAF2E|        |      ;
                       db $87,$6D,$00,$46,$46,$47,$47,$48   ;0CAF36|        |      ;
                       db $05,$00,$83,$59,$00,$5B,$05,$00   ;0CAF3E|        |      ;
                       db $85,$46,$57,$57,$56,$6D,$07,$00   ;0CAF46|        |      ;
                       db $83,$6D,$00,$00,$03,$46,$83,$47   ;0CAF4E|        |      ;
                       db $47,$57,$08,$00,$88,$46,$47,$47   ;0CAF56|        |      ;
                       db $48,$56,$00,$00,$6D,$07,$00,$81   ;0CAF5E|        |      ;
                       db $6D,$05,$00,$84,$46,$46,$47,$57   ;0CAF66|        |      ;
                       db $06,$00,$81,$46,$04,$56,$03,$00   ;0CAF6E|        |      ;
                       db $81,$6D,$07,$00,$85,$6D,$00,$00   ;0CAF76|        |      ;
                       db $46,$56,$03,$00,$03,$46,$85,$56   ;0CAF7E|        |      ;
                       db $00,$00,$46,$56,$08,$00,$81,$6D   ;0CAF86|        |      ;
                       db $07,$00,$81,$6D,$06,$00,$82,$46   ;0CAF8E|        |      ;
                       db $56,$0A,$00,$86,$46,$56,$56,$00   ;0CAF96|        |      ;
                       db $00,$6D,$07,$00,$81,$6D,$17,$6E   ;0CAF9E|        |      ;
                       db $81,$6F,$44,$00,$10,$FF,$84,$3F   ;0CAFA6|        |      ;
                       db $FF                               ;0CAFAE|        |      ;
                       db $FF,$BF,$04,$FF,$85,$33,$FF,$FF   ;0CAFAF|        |FF04BF;
                       db $56,$9A,$03,$FF,$97,$33,$FF,$EF   ;0CAFB7|        |00009A;
                       db $A5,$A9,$22,$00,$0F,$FF,$FF,$FA   ;0CAFBF|        |0000A9;
                       db $BA,$AA,$F2,$FF,$00,$03,$0F,$CF   ;0CAFC7|        |      ;
                       db $0F,$0F,$CF,$33,$06,$00,$83,$0F   ;0CAFCF|        |33CF0F;
                       db $0F,$00,$FF,$A9,$00,$9D,$69,$06   ;0CAFD7|        |A9FF00;
                       db $BD,$06,$06,$A8,$D0,$47,$A9,$01   ;0CAFDF|        |0C0606;
                       db $9D,$57,$06,$A9,$00,$9D,$45,$06   ;0CAFE7|        |0C0657;
                       db $BC,$33,$06,$B9,$C1,$B2,$9D,$38   ;0CAFEF|        |0C0633;
                       db $04,$30,$03,$FE,$45,$06,$A0,$00   ;0CAFF7|        |000030;
                       db $20,$11,$B2,$A0,$00,$20,$63,$B2   ;0CAFFF|        |0CB211;
                       db $A9,$C8,$9D,$1C,$04,$A9,$20,$9D   ;0CB007|        |      ;
                       db $37,$05,$A9,$FF,$9D,$20,$05,$A9   ;0CB00F|        |000005;
                       db $00,$9D,$F2,$04,$9D,$09,$05,$FE   ;0CB017|        |      ;
                       db $06,$06,$A9,$6E,$9D,$00,$04,$A9   ;0CB01F|        |000006;
                       db $0E,$9D,$8C,$04,$60,$88,$D0,$2A   ;0CB027|        |0C8C9D;
                       db $A9,$B0,$DD,$1C,$04,$90,$22,$A9   ;0CB02F|        |      ;
                       db $E0,$9D,$09,$05,$A9,$00,$9D,$F2   ;0CB037|        |      ;
                       db $04,$BD,$45,$06,$D0,$0A,$A9,$20   ;0CB03F|        |0000BD;
                       db $9D,$09,$05,$A9,$FF,$9D,$F2,$04   ;0CB047|        |0C0509;
                       db $FE,$06,$06,$BD,$45,$06,$9D,$1D   ;0CB04F|        |0C0606;
                       db $06,$60,$88,$D0,$17,$20,$14,$B1   ;0CB057|        |000060;
                       db $A5,$11,$49,$FF,$18,$69,$01,$85   ;0CB05F|        |000011;
                       db $11,$A5,$10,$49,$FF,$69,$00,$85   ;0CB067|        |0000A5;
                       db $10,$4C,$26,$B1,$88,$D0,$0B,$BD   ;0CB06F|        |0CB0BD;
                       db $45,$06,$F0,$03,$4C,$7D,$B1,$4C   ;0CB077|        |000006;
                       db $51,$B1,$88,$D0,$06,$20,$14,$B1   ;0CB07F|        |0000B1;
                       db $4C,$26,$B1,$88,$D0,$0B,$BD,$45   ;0CB087|        |0CB126;
 
                       db $06,$D0,$03,$4C,$7D,$B1,$4C,$51   ;0CB08F|        |0000D0;
                       db $B1,$88,$D0,$27,$A9,$00,$9D,$20   ;0CB097|        |000088;
                       db $05,$9D,$37,$05,$BC,$33,$06,$B9   ;0CB09F|        |00009D;
                       db $C1,$B2,$38,$FD,$38,$04,$B0,$05   ;0CB0A7|        |0000B2;
                       db $49,$FF,$18,$69,$01,$C9,$02,$B0   ;0CB0AF|        |      ;
                       db $09,$B9,$C1,$B2,$9D,$38,$04,$FE   ;0CB0B7|        |      ;
                       db $06,$06,$60,$88,$D0,$14,$A9,$E0   ;0CB0BF|        |000006;
                       db $9D,$37,$05,$A9,$00,$9D,$20,$05   ;0CB0C7|        |0C0537;
                       db $9D,$F2,$04,$9D,$09,$05,$FE,$06   ;0CB0CF|        |0C04F2;
                       db $06,$60,$BD,$1C,$04,$C9,$C8,$90   ;0CB0D7|        |000060;
                       db $12,$A9,$C8,$9D,$1C,$04,$A0,$02   ;0CB0DF|        |0000A9;
                       db $20,$11,$B2,$A0,$02,$20,$63,$B2   ;0CB0E7|        |0CB211;
                       db $4C,$F3,$B0,$60,$A9,$00,$9D,$06   ;0CB0EF|        |0CB0F3;
 
                       db $06,$9D,$1D,$06,$FE,$33,$06,$BD   ;0CB0F7|        |00009D;
                       db $33,$06,$29,$07,$9D,$33,$06,$AD   ;0CB0FF|        |000006;
                       db $F3,$07,$C9,$01,$F0,$01,$60,$EE   ;0CB107|        |000007;
                       db $F0,$07,$4C,$A9,$B2,$BD,$33,$06   ;0CB10F|        |0CB118;
                       db $29,$01,$0A,$A8,$B9,$E1,$B2,$85   ;0CB117|        |      ;
                       db $11,$B9,$E2,$B2,$85,$10,$60,$A9   ;0CB11F|        |0000B9;
                       db $00,$9D,$20,$05,$9D,$37,$05,$BD   ;0CB127|        |      ;
                       db $1D,$06,$F0,$15,$BD,$38,$04,$C9   ;0CB12F|        |0CF006;
                       db $C8,$90,$0D,$FE,$06,$06,$A5,$10   ;0CB137|        |      ;
                       db $9D,$20,$05,$A5,$11,$9D,$37,$05   ;0CB13F|        |0C0520;
                       db $60,$BD,$38,$04,$C9,$38,$B0,$F8   ;0CB147|        |      ;
 
                       db $90,$E9,$BD,$1D,$06,$F0,$0E,$A9   ;0CB14F|        |0CB13A;
                       db $04,$20,$A9,$B1,$20,$F5,$B1,$90   ;0CB157|        |000020;
                       db $03,$FE,$06,$06,$60,$A9,$04,$20   ;0CB15F|        |0000FE;
                       db $A9,$B1,$BD,$F2,$04,$1D,$09,$05   ;0CB167|        |      ;
                       db $D0,$F2,$FE,$1D,$06,$BD,$1D,$06   ;0CB16F|        |0CB163;
                       db $29,$01,$9D,$1D,$06,$60,$BD,$1D   ;0CB177|        |      ;
                       db $06,$D0,$0E,$A9,$04,$20,$C3,$B1   ;0CB17F|        |0000D0;
                       db $20,$D7,$B1,$90,$03,$FE,$06,$06   ;0CB187|        |0CB1D7;
                       db $60,$A9,$04,$20,$C3,$B1,$BD,$F2   ;0CB18F|        |      ;
 
                       db $04,$1D,$09,$05,$D0,$C6,$FE,$1D   ;0CB197|        |00001D;
                       db $06,$BD,$1D,$06,$29,$01,$9D,$1D   ;0CB19F|        |0000BD;
                       db $06,$60,$18,$7D,$09,$05,$9D,$09   ;0CB1A7|        |000060;
                       db $05,$BD,$F2,$04,$69,$00,$9D,$F2   ;0CB1AF|        |0000BD;
                       db $04,$90,$08,$A9,$00,$9D,$09,$05   ;0CB1B7|        |000090;
                       db $9D,$F2,$04,$60,$85,$00,$BD,$09   ;0CB1BF|        |0C04F2;
                       db $05,$38,$E5,$00,$9D,$09,$05,$BD   ;0CB1C7|        |000038;
                       db $F2,$04,$E9,$00,$9D,$F2,$04,$60   ;0CB1CF|        |000004;
                       db $BD,$F2,$04,$10,$17,$C9,$FF,$D0   ;0CB1D7|        |0C04F2;
                       db $07,$BD,$09,$05,$C9,$80,$B0,$0C   ;0CB1DF|        |0000BD;
                       db $A9,$FF,$9D,$F2,$04,$A9,$80,$9D   ;0CB1E7|        |      ;
                       db $09,$05,$38,$60,$18,$60,$BD,$F2   ;0CB1EF|        |      ;
                       db $04,$30,$15,$D0,$07,$BD,$09,$05   ;0CB1F7|        |000030;
                       db $C9,$80,$90,$0C,$A9,$00,$9D,$F2   ;0CB1FF|        |      ;
                       db $04,$A9,$80,$9D,$09,$05,$38,$60   ;0CB207|        |0000A9;
                       db $18,$60,$BD,$33,$06,$85,$0F,$86   ;0CB20F|        |      ;
                       db $17,$84,$16,$A9,$00,$85,$14,$85   ;0CB217|        |000084;
                       db $15,$A6,$1D,$A9,$01,$20,$BC,$B2   ;0CB21F|        |0000A6;
                       db $A5,$15,$F0,$02,$A9,$20,$A4,$0F   ;0CB227|        |000015;
                       db $18,$79,$D1,$B2,$20,$BC,$B2,$A9   ;0CB22F|        |      ;
                       db $23,$20,$BC,$B2,$A9,$04,$85,$12   ;0CB237|        |000020;
                       db $A5,$16,$F0,$07,$A4,$14,$B9,$D9   ;0CB23F|        |000016;
                       db $B2,$E6,$14,$20,$BC,$B2,$C6,$12   ;0CB247|        |0000E6;
                       db $D0,$EE,$A9,$FF,$20,$BC,$B2,$E6   ;0CB24F|        |0CB23F;
                       db $15,$A5,$15,$C9,$02,$D0,$C4,$86   ;0CB257|        |0000A5;
                       db $1D,$A6,$17,$60,$84,$12,$A4,$0F   ;0CB25F|        |0C17A6;
                       db $B9,$C9,$B2,$A8,$A5,$12,$F0,$02   ;0CB267|        |0CB2C9;
                       db $A9,$66,$85,$10,$BD,$38,$04,$38   ;0CB26F|        |      ;
                       db $E9,$10,$29,$10,$D0,$06,$A5,$10   ;0CB277|        |      ;
                       db $99,$E0,$06,$60,$A5,$10,$29,$0F   ;0CB27F|        |0C06E0;
                       db $85,$11,$B9,$E0,$06,$29,$F0,$05   ;0CB287|        |000011;
                       db $11,$99,$E0,$06,$98,$18,$69,$0C   ;0CB28F|        |000099;
                       db $A8,$A5,$10,$29,$F0,$85,$11,$B9   ;0CB297|        |      ;
                       db $E0,$06,$29,$0F,$05,$11,$99,$E0   ;0CB29F|        |      ;
                       db $06,$60,$A0,$00,$B9,$BA,$B2,$85   ;0CB2A7|        |000060;
                       db $00,$B9,$BB,$B2,$85,$01,$A9,$92   ;0CB2AF|        |      ;
                       db $4C,$2F,$E6,$3A,$87,$9D,$00,$03   ;0CB2B7|        |0CE62F;
                       db $E8,$60,$80,$A0,$40,$90,$B0,$60   ;0CB2BF|        |      ;
                       db $50,$70,$2E,$3A,$16,$3A,$46,$22   ;0CB2C7|        |0CB339;
                       db $22,$2E,$0E,$12,$06,$10,$14,$0A   ;0CB2CF|        |120E2E;
                       db $08,$0C,$BC,$BE,$BC,$BE,$BD,$BF   ;0CB2D7|        |      ;
                       db $BD,$BF,$E0,$00,$40,$00,$A0,$05   ;0CB2DF|        |0CE0BF;
                       db $20,$B9,$FE,$20,$D7,$FE,$A9,$8B   ;0CB2E7|        |0CFEB9;
                       db $9D,$4E,$05,$A9,$0E,$9D,$8C,$04   ;0CB2EF|        |0C054E;
                       db $A9,$50,$9D,$00,$04,$A9,$70,$9D   ;0CB2F7|        |      ;
                       db $70,$04,$A9,$02,$9D,$54,$04,$A9   ;0CB2FF|        |0CB305;
                       db $80,$9D,$EF,$05,$B9,$1B,$B3,$9D   ;0CB307|        |0CB2A6;
                       db $1C,$04,$B9,$21,$B3,$9D,$38,$04   ;0CB30F|        |0CB904;
                       db $88,$10,$CD,$60,$75,$B5,$95,$85   ;0CB317|        |      ;
                       db $65,$A5,$38,$38,$58,$B8,$D8,$D8   ;0CB31F|        |0000A5;
 
RLE_tilemap_0d_PWscreen: dw $2000                             ;0CB327|        |      ;
                       db $C6,$CD,$CE,$CD,$CE,$CB,$CC,$CD   ;0CB329|        |      ;
                       db $CE,$CD,$CE,$CD,$CE,$CD,$CE,$CD   ;0CB331|        |      ;
                       db $CE,$CD,$CE,$CD,$CE,$CD,$CE,$CD   ;0CB339|        |      ;
                       db $CE,$CD,$CE,$CB,$CC,$CD,$CE,$CD   ;0CB341|        |      ;
                       db $CE,$DD,$DE,$DD,$DE,$DB,$DC,$DD   ;0CB349|        |      ;
                       db $DE,$DD,$DE,$DD,$DE,$DD,$DE,$DD   ;0CB351|        |      ;
                       db $DE,$DD,$DE,$DD,$DE,$DD,$DE,$DD   ;0CB359|        |      ;
                       db $DE,$DD,$DE,$DB,$DC,$DD,$DE,$DD   ;0CB361|        |      ;
                       db $DE,$CA,$C8,$C9,$FA,$C0,$C1,$14   ;0CB369|        |      ;
                       db $00,$8C,$C4,$C5,$C8,$C9,$CA,$C8   ;0CB371|        |      ;
                       db $DA,$D8,$D9,$DA,$D0,$D1,$14,$00   ;0CB379|        |      ;
                       db $8C,$D4,$D5,$D8,$D9,$DA,$D8,$EA   ;0CB381|        |      ;
                       db $E8,$E9,$EA,$E0,$E1,$05,$00,$81   ;0CB389|        |      ;
                       db $80,$08,$81,$81,$82,$05,$00,$8C   ;0CB391|        |      ;
 
                       db $E4,$E5,$E8,$E9,$EA,$E8,$FA,$F8   ;0CB399|        |      ;
                       db $F9,$FA,$F0,$F1,$05,$00,$81,$90   ;0CB3A1|        |      ;
                       db $08,$00,$81,$92,$05,$00,$8C,$F4   ;0CB3A9|        |      ;
                       db $F5,$F8,$F9,$DA,$F8,$CA,$C8,$C9   ;0CB3B1|        |      ;
                       db $FA,$C2,$C3,$05,$00,$81,$A0,$08   ;0CB3B9|        |      ;
                       db $A1,$81,$A2,$05,$00,$8C,$C6,$C7   ;0CB3C1|        |      ;
                       db $E8,$E9,$EA,$C8,$DA,$D8,$D9,$DA   ;0CB3C9|        |      ;
                       db $D2,$D3,$14,$00,$FE,$D6,$D7,$F8   ;0CB3D1|        |      ;
                       db $F9,$FA,$D8,$EA,$E8,$E9,$EA,$E2   ;0CB3D9|        |      ;
                       db $E3,$00,$00,$80,$81,$81,$82,$80   ;0CB3E1|        |      ;
                       db $81,$81,$82,$80,$81,$81,$82,$80   ;0CB3E9|        |      ;
                       db $81,$81,$82,$00,$00,$E6,$E7,$C8   ;0CB3F1|        |      ;
                       db $C9,$CA,$C8,$FA,$F8,$F9,$FA,$F2   ;0CB3F9|        |      ;
                       db $F3,$00,$00,$90,$00,$00,$92,$90   ;0CB401|        |      ;
                       db $00,$00,$92,$90,$00,$00,$92,$90   ;0CB409|        |      ;
                       db $00,$00,$92,$00,$00,$F2,$F3,$D8   ;0CB411|        |      ;
                       db $D9,$DA,$D8,$CD,$CE,$CD,$CE,$CB   ;0CB419|        |      ;
                       db $CC,$00,$00,$90,$00,$00,$92,$90   ;0CB421|        |      ;
                       db $00,$00,$92,$90,$00,$00,$92,$90   ;0CB429|        |      ;
                       db $00,$00,$92,$00,$00,$CB,$CC,$CD   ;0CB431|        |      ;
                       db $CE,$CD,$CE,$DD,$DE,$DD,$DE,$DB   ;0CB439|        |      ;
                       db $DC,$00,$00,$A0,$A1,$A1,$A2,$A0   ;0CB441|        |      ;
 
                       db $A1,$A1,$A2,$A0,$A1,$A1,$A2,$A0   ;0CB449|        |      ;
                       db $A1,$A1,$A2,$8E,$00,$00,$DB,$DC   ;0CB451|        |      ;
                       db $DD,$DE,$DD,$DE,$E8,$E9,$E9,$EA   ;0CB459|        |      ;
                       db $C4,$C5,$14,$00,$8C,$C0,$C1,$E8   ;0CB461|        |      ;
                       db $E9,$CA,$E8,$F8,$F9,$F9,$FA,$D4   ;0CB469|        |      ;
                       db $D5,$14,$00,$8C,$D0,$D1,$F8,$F9   ;0CB471|        |      ;
                       db $FA,$F8,$E0,$C8,$C9,$CA,$E4,$E5   ;0CB479|        |      ;
                       db $04,$00,$8C,$80,$81,$82,$80,$81   ;0CB481|        |      ;
                       db $82,$80,$81,$82,$80,$81,$82,$04   ;0CB489|        |      ;
 
                       db $00,$8C,$E0,$E1,$C8,$C9,$CA,$C8   ;0CB491|        |      ;
                       db $E8,$D8,$D9,$DA,$F4,$F5,$04,$00   ;0CB499|        |      ;
                       db $8C,$90,$00,$92,$90,$00,$92,$90   ;0CB4A1|        |      ;
                       db $00,$92,$90,$00,$92,$04,$00,$8C   ;0CB4A9|        |      ;
                       db $F0,$F1,$D8,$D9,$DA,$D8,$C8,$C9   ;0CB4B1|        |      ;
                       db $E9,$EA,$C6,$C7,$04,$00,$8C,$A0   ;0CB4B9|        |      ;
                       db $A1,$A2,$A0,$A1,$A2,$A0,$A1,$A2   ;0CB4C1|        |      ;
                       db $A0,$A1,$A2,$04,$00,$8C,$C2,$C3   ;0CB4C9|        |      ;
                       db $E8,$E9,$EA,$E8,$D8,$D9,$F9,$FA   ;0CB4D1|        |      ;
                       db $D6,$D7,$04,$00,$8C,$80,$81,$82   ;0CB4D9|        |      ;
                       db $80,$81,$82,$80,$81,$82,$80,$81   ;0CB4E1|        |      ;
                       db $82,$04,$00,$8C,$D2,$D3,$F8,$C8   ;0CB4E9|        |      ;
 
                       db $C9,$F8,$E8,$C8,$E9,$EA,$E6,$E7   ;0CB4F1|        |      ;
                       db $04,$00,$8C,$90,$00,$92,$90,$00   ;0CB4F9|        |      ;
                       db $92,$90,$00,$92,$90,$00,$92,$04   ;0CB501|        |      ;
                       db $00,$8C,$E2,$E3,$C8,$D8,$D9,$C8   ;0CB509|        |      ;
                       db $F8,$D8,$F9,$FA,$F2,$F3,$04,$00   ;0CB511|        |      ;
                       db $8C,$A0,$A1,$A2,$A0,$A1,$A2,$A0   ;0CB519|        |      ;
                       db $A1,$A2,$A0,$A1,$A2,$04,$00,$8C   ;0CB521|        |      ;
                       db $F2,$F3,$D8,$D9,$DA,$D8,$CD,$CE   ;0CB529|        |      ;
                       db $CD,$CE,$CB,$CC,$04,$00,$8C,$80   ;0CB531|        |      ;
                       db $81,$82,$80,$81,$82,$80,$81,$82   ;0CB539|        |      ;
                       db $80,$81,$82,$04,$00,$8C,$CB,$CC   ;0CB541|        |      ;
                       db $CD,$CE,$CD,$CE,$DD,$DE,$DD,$DE   ;0CB549|        |      ;
                       db $DB,$DC,$04,$00,$8C,$90,$00,$92   ;0CB551|        |      ;
                       db $90,$00,$92,$90,$00,$92,$90,$00   ;0CB559|        |      ;
                       db $92,$04,$00,$8C,$DB,$DC,$DD,$DE   ;0CB561|        |      ;
                       db $DD,$DE,$C8,$E8,$E9,$CA,$C0,$C1   ;0CB569|        |      ;
                       db $04,$00,$8C,$A0,$A1,$A2,$A0,$A1   ;0CB571|        |      ;
                       db $A2,$A0,$A1,$A2,$A0,$A1,$A2,$04   ;0CB579|        |      ;
                       db $00,$8C,$C4,$C5,$E8,$E9,$EA,$E8   ;0CB581|        |      ;
                       db $D8,$F8,$F9,$DA,$D0,$D1,$04,$00   ;0CB589|        |      ;
                       db $8C,$80,$81,$82,$80,$81,$82,$80   ;0CB591|        |      ;
                       db $81,$82,$80,$81,$82,$04,$00,$8C   ;0CB599|        |      ;
                       db $D4,$D5,$F8,$F9,$FA,$F8,$C8,$C9   ;0CB5A1|        |      ;
                       db $C8,$C9,$E0,$E1,$04,$00,$8C,$90   ;0CB5A9|        |      ;
                       db $00,$92,$90,$00,$92,$90,$00,$92   ;0CB5B1|        |      ;
                       db $90,$00,$92,$04,$00,$8C,$E4,$E5   ;0CB5B9|        |      ;
                       db $C8,$C9,$CA,$C8,$D8,$D9,$D8,$D9   ;0CB5C1|        |      ;
                       db $F0,$F1,$04,$00,$8C,$A0,$A1,$A2   ;0CB5C9|        |      ;
                       db $A0,$A1,$A2,$A0,$A1,$A2,$A0,$A1   ;0CB5D1|        |      ;
                       db $A2,$04,$00,$8C,$F4,$F5,$D8,$D9   ;0CB5D9|        |      ;
                       db $DA,$D8,$E8,$C8,$E9,$EA,$C2,$C3   ;0CB5E1|        |      ;
                       db $14,$00,$8C,$C6,$C7,$E8,$E9,$EA   ;0CB5E9|        |      ;
                       db $C8,$F8,$D8,$F9,$FA,$D2,$D3,$14   ;0CB5F1|        |      ;
                       db $00,$C8,$D6,$D7,$F8,$F9,$FA,$D8   ;0CB5F9|        |      ;
                       db $E8,$C8,$C9,$EA,$E2,$E3,$CD,$CE   ;0CB601|        |      ;
                       db $CD,$CE,$CD,$CE,$CD,$CE,$CD,$CE   ;0CB609|        |      ;
                       db $CD,$CE,$CD,$CE,$CD,$CE,$CD,$CE   ;0CB611|        |      ;
                       db $CD,$CE,$E6,$E7,$C8,$C9,$CA,$C8   ;0CB619|        |      ;
                       db $F8,$D8,$D9,$FA,$F2,$F3,$DD,$DE   ;0CB621|        |      ;
                       db $DD,$DE,$DD,$DE,$DD,$DE,$DD,$DE   ;0CB629|        |      ;
                       db $DD,$DE,$DD,$DE,$DD,$DE,$DD,$DE   ;0CB631|        |      ;
                       db $DD,$DE,$F2,$F3,$D8,$D9,$DA,$D8   ;0CB639|        |      ;
                       db $0A,$69,$04,$5A,$84,$96,$0A,$00   ;0CB641|        |      ;
                       db $66,$04,$55,$84,$99,$00,$A0,$56   ;0CB649|        |      ;
                       db $04,$55,$84,$59,$A0,$00,$66,$04   ;0CB651|        |      ;
                       db $55,$84,$99,$00,$00,$66,$04,$55   ;0CB659|        |      ;
                       db $84,$99,$00,$0A,$65,$04,$55,$84   ;0CB661|        |      ;
                       db $95,$0A,$00,$66,$04,$55,$83,$99   ;0CB669|        |      ;
                       db $00,$00,$06,$0A                   ;0CB671|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB675|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB67D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB685|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB68D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB695|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB69D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6A5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6AD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6B5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6BD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6C5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6CD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6D5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6DD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6E5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6ED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6F5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB6FD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB705|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB70D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB715|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB71D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB725|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB72D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB735|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB73D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB745|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB74D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB755|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB75D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB765|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB76D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB775|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB77D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB785|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB78D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB795|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB79D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7A5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7AD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7B5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7BD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7C5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7CD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7D5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7DD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7E5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7ED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7F5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB7FD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB805|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB80D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB815|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB81D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB825|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB82D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB835|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB83D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB845|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB84D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB855|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB85D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB865|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB86D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB875|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB87D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB885|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB88D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB895|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB89D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8A5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8AD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8B5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8BD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8C5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8CD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8D5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8DD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8E5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8ED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8F5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB8FD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB905|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB90D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB915|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB91D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB925|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB92D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB935|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB93D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB945|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB94D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB955|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB95D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB965|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB96D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB975|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB97D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB985|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB98D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB995|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB99D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9A5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9AD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9B5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9BD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9C5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9CD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9D5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9DD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9E5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9ED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9F5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CB9FD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA0D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA1D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA25|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA35|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA45|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA4D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA5D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA6D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA85|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA95|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBA9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAAD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBABD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBACD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAD5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBADD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAE5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAF5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBAFD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB0D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB1D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB25|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB35|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB45|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB4D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB5D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB6D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB85|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB95|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBB9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBAD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBBD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBCD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBD5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBE5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBF5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBBFD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC0D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC1D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC25|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC35|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC45|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC4D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC5D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC6D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC85|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC95|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBC9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCAD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCBD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCCD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCD5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCE5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCF5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBCFD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD0D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD1D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD25|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD35|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD45|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD4D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD5D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD6D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD85|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD95|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBD9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDAD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDBD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDCD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDD5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDE5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDF5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBDFD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE0D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE1D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE25|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE35|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE45|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE4D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE5D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE6D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE85|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE95|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBE9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEAD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEBD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBECD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBED5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEE5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEF5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBEFD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF05|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF0D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF15|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF1D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF25|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF2D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF35|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF3D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF45|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF4D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF55|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF5D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF65|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF6D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF75|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF7D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF85|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF8D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF95|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBF9D|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFA5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFAD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFBD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFC5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFCD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFD5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFE5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0CBFF5|        |FFFFFF;
                       db $FF,$FF,$FF                       ;0CBFFD|        |00FFFF;
 
