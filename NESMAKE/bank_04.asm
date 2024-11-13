 
 
 
              bank_88: db $88                               ;048000|        |      ; NES PRG 10000
 
processNextSoundByteAlt: CPX.B #$05                           ;048001|E005    |      ;
                       BEQ CODE_048037                      ;048003|F032    |048037;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048005|B1E0    |0000E0;
                       CMP.B #$FF                           ;048007|C9FF    |      ;
                       BEQ CODE_048013                      ;048009|F008    |048013;
                       LDA.W $016E,X                        ;04800B|BD6E01  |04016E;
                       BPL CODE_048013                      ;04800E|1003    |048013;
                       JMP.W CODE_048408                    ;048010|4C0884  |048408;
 
 
          CODE_048013: LDA.B (r_CurrInstrumentDataAddr),Y   ;048013|B1E0    |0000E0;
                       AND.B #$F0                           ;048015|29F0    |      ;
                       CMP.B #$C0                           ;048017|C9C0    |      ;
                       BCS CODE_04801E                      ;048019|B003    |04801E;
                       JMP.W CODE_04812C                    ;04801B|4C2C81  |04812C;
 
 
          CODE_04801E: AND.B #$30                           ;04801E|2930    |      ;
                       LSR A                                ;048020|4A      |      ;
                       LSR A                                ;048021|4A      |      ;
                       LSR A                                ;048022|4A      |      ;
                       TAX                                  ;048023|AA      |      ;
                       LDA.W someJumpTablePointer01Lo,X     ;048024|BD0387  |048703;
                       STA.B r_SoundBankJumpAddr            ;048027|85E2    |0000E2;
                       LDA.W someJumpTablePointer01Hi,X     ;048029|BD0487  |048704;
                       STA.B $E3                            ;04802C|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;04802E|A6EE    |0000EE;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048030|B1E0    |0000E0;
                       AND.B #$0F                           ;048032|290F    |      ;
                       JMP.W (r_SoundBankJumpAddr)          ;048034|6CE200  |0000E2;
 
 
          CODE_048037: LDA.B (r_CurrInstrumentDataAddr),Y   ;048037|B1E0    |0000E0;
                       AND.B #$F0                           ;048039|29F0    |      ;
                       CMP.B #$F0                           ;04803B|C9F0    |      ;
                       BNE CODE_048046                      ;04803D|D007    |048046;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04803F|B1E0    |0000E0;
                       AND.B #$0F                           ;048041|290F    |      ;
                       JMP.W CODE_0485A3                    ;048043|4CA385  |0485A3;
 
 
          CODE_048046: CMP.B #$D0                           ;048046|C9D0    |      ;
                       BEQ CODE_04804D                      ;048048|F003    |04804D;
                       JMP.W CODE_04829B                    ;04804A|4C9B82  |04829B;
 
 
          CODE_04804D: LDA.B (r_CurrInstrumentDataAddr),Y   ;04804D|B1E0    |0000E0;
                       AND.B #$0F                           ;04804F|290F    |      ;
                       STA.W $010E,X                        ;048051|9D0E01  |04010E;
                       INY                                  ;048054|C8      |      ;
                       JMP.W CODE_048037                    ;048055|4C3780  |048037;
 
 
          CODE_048058: LDA.B (r_CurrInstrumentDataAddr),Y   ;048058|B1E0    |0000E0;
                       LSR A                                ;04805A|4A      |      ;
                       LSR A                                ;04805B|4A      |      ;
                       LSR A                                ;04805C|4A      |      ;
                       LSR A                                ;04805D|4A      |      ;
                       CMP.B #$0C                           ;04805E|C90C    |      ;
                       BNE CODE_048065                      ;048060|D003    |048065;
                       db $4C                               ;048062|        |      ;
 
                       dw CODE_0FE1A6                       ;048063|        |0FE1A6;
 
          CODE_048065: TAX                                  ;048065|AA      |      ;
                       LDA.W DATA8_048078,X                 ;048066|BD7880  |048078;
                       LDX.B r_CurrInstrumentIdx            ;048069|A6EE    |0000EE;
                       CMP.B #$6D                           ;04806B|C96D    |      ;
                       BCC DATA8_048072                     ;04806D|9003    |048072;
                       db $4C                               ;04806F|        |      ;
 
                       dw CODE_0FE1AB                       ;048070|        |0FE1AB;
 
         DATA8_048072: db $20                               ;048072|        |      ;
                       dw initFreezWaterEffect_01           ;048073|        |0FE25F;
                       db $4C                               ;048075|        |      ;
                       dw CODE_0FE1A6                       ;048076|        |0FE1A6;
 
         DATA8_048078: db $01,$02,$03,$04,$05,$70,$79,$6D   ;048078|        |      ;
                       db $6E,$6F,$70,$71                   ;048080|        |      ;
 
          CODE_048084: LDA.B #$01                           ;048084|A901    |      ;
                       STA.W $03C0,X                        ;048086|9DC003  |0403C0;
                       LDA.W $015B,X                        ;048089|BD5B01  |04015B;
                       db $20                               ;04808C|        |      ;
                       dw CODE_0FE1CE                       ;04808D|        |0FE1CE;
                       LDA.W $0189,X                        ;04808F|BD8901  |040189;
                       AND.B #$0F                           ;048092|290F    |      ;
                       STA.W $03C3,X                        ;048094|9DC303  |0403C3;
                       LDA.W $0115,X                        ;048097|BD1501  |040115;
                       AND.B #$BB                           ;04809A|29BB    |      ;
                       ORA.B #$02                           ;04809C|0902    |      ;
                       STA.W $0115,X                        ;04809E|9D1501  |040115;
                       LDA.W $016E,X                        ;0480A1|BD6E01  |04016E;
                       AND.B #$DF                           ;0480A4|29DF    |      ;
                       STA.W $016E,X                        ;0480A6|9D6E01  |04016E;
                       JMP.W CODE_048166                    ;0480A9|4C6681  |048166;
 
 
          CODE_0480AC: LDA.W $016E,X                        ;0480AC|BD6E01  |04016E;
                       AND.B #$DF                           ;0480AF|29DF    |      ;
                       STA.W $016E,X                        ;0480B1|9D6E01  |04016E;
                       LDA.W $03D8,X                        ;0480B4|BDD803  |0403D8;
                       LSR A                                ;0480B7|4A      |      ;
                       BCC CODE_0480C2                      ;0480B8|9008    |0480C2;
                       LDA.W $016E,X                        ;0480BA|BD6E01  |04016E;
                       ORA.B #$20                           ;0480BD|0920    |      ;
                       STA.W $016E,X                        ;0480BF|9D6E01  |04016E;
 
          CODE_0480C2: RTS                                  ;0480C2|60      |      ;
 
 
          CODE_0480C3: AND.B #$7F                           ;0480C3|297F    |      ;
                       STA.B r_SoundBankTempVar1            ;0480C5|85E4    |0000E4;
                       TXA                                  ;0480C7|8A      |      ;
                       SEC                                  ;0480C8|38      |      ;
                       SBC.B r_SoundBankTempVar1            ;0480C9|E5E4    |0000E4;
                       BCS CODE_0480DE                      ;0480CB|B011    |0480DE;
                       SEC                                  ;0480CD|38      |      ;
                       SBC.B #$E8                           ;0480CE|E9E8    |      ;
                       TAX                                  ;0480D0|AA      |      ;
                       LDA.W lowerFrequencyData,X           ;0480D1|BD0B87  |04870B;
                       STA.B r_SoundFrequency               ;0480D4|85EC    |0000EC;
                       LDA.W DATA16_04870C,X                ;0480D6|BD0C87  |04870C;
                       STA.B $ED                            ;0480D9|85ED    |0000ED;
                       JMP.W CODE_048189                    ;0480DB|4C8981  |048189;
 
 
          CODE_0480DE: JMP.W CODE_04817E                    ;0480DE|4C7E81  |04817E;
 
 
          CODE_0480E1: LDA.B (r_CurrInstrumentDataAddr),Y   ;0480E1|B1E0    |0000E0;
                       AND.B #$0F                           ;0480E3|290F    |      ;
 
          CODE_0480E5: TAX                                  ;0480E5|AA      |      ;
                       INX                                  ;0480E6|E8      |      ;
                       LDA.B #$00                           ;0480E7|A900    |      ;
                       STA.W $0193                          ;0480E9|8D9301  |040193;
                       LDA.W $015D                          ;0480EC|AD5D01  |04015D;
                       STA.B r_SoundBankJumpAddr            ;0480EF|85E2    |0000E2;
                       BEQ CODE_04810A                      ;0480F1|F017    |04810A;
                       CMP.B #$80                           ;0480F3|C980    |      ;
                       BCS CODE_048120                      ;0480F5|B029    |048120;
                       INC.B r_SoundBankJumpAddr            ;0480F7|E6E2    |0000E2;
                       LDA.B r_SoundBankJumpAddr            ;0480F9|A5E2    |0000E2;
 
          CODE_0480FB: DEX                                  ;0480FB|CA      |      ;
                       BEQ CODE_048106                      ;0480FC|F008    |048106;
                       CLC                                  ;0480FE|18      |      ;
                       ADC.B r_SoundBankJumpAddr            ;0480FF|65E2    |0000E2;
                       BCS CODE_04810A                      ;048101|B007    |04810A;
                       JMP.W CODE_0480FB                    ;048103|4CFB80  |0480FB;
 
 
          CODE_048106: CMP.B #$80                           ;048106|C980    |      ;
                       BCC CODE_04810C                      ;048108|9002    |04810C;
 
          CODE_04810A: LDA.B #$90                           ;04810A|A990    |      ;
 
          CODE_04810C: STA.W $4008                          ;04810C|8D0840  |044008;
                       JSR.W wait10_nop                     ;04810F|205387  |048753;
                       STA.W $0194                          ;048112|8D9401  |040194;
                       LDX.B r_CurrInstrumentIdx            ;048115|A6EE    |0000EE;
                       LDA.W $016E,X                        ;048117|BD6E01  |04016E;
                       BPL CODE_04811D                      ;04811A|1001    |04811D;
                       RTS                                  ;04811C|60      |      ;
 
 
          CODE_04811D: JMP.W CODE_048166                    ;04811D|4C6681  |048166;
 
 
          CODE_048120: SEC                                  ;048120|38      |      ;
                       SBC.B #$80                           ;048121|E980    |      ;
                       JMP.W CODE_04810C                    ;048123|4C0C81  |04810C;
 
 
          CODE_048126: JMP.W CODE_0480C3                    ;048126|4CC380  |0480C3;
 
 
          CODE_048129: JMP.W CODE_048084                    ;048129|4C8480  |048084;
 
 
          CODE_04812C: JSR.W CODE_04829B                    ;04812C|209B82  |04829B;
                       CPX.B #$02                           ;04812F|E002    |      ;
                       BEQ CODE_0480E1                      ;048131|F0AE    |0480E1;
                       JSR.W CODE_0480AC                    ;048133|20AC80  |0480AC;
                       LDA.W $0189,X                        ;048136|BD8901  |040189;
                       BMI CODE_048129                      ;048139|30EE    |048129;
                       LDA.B #$00                           ;04813B|A900    |      ;
                       STA.W $06B2,X                        ;04813D|9DB206  |0406B2;
                       STA.W $03C3,X                        ;048140|9DC303  |0403C3;
                       STA.W $03C9,X                        ;048143|9DC903  |0403C9;
                       STA.W $03C6,X                        ;048146|9DC603  |0403C6;
                       STA.W $03C0,X                        ;048149|9DC003  |0403C0;
                       INC.W $03C0,X                        ;04814C|FEC003  |0403C0;
                       STY.B r_SoundBankTempVar1            ;04814F|84E4    |0000E4;
                       db $20                               ;048151|        |      ;
                       dw CODE_0FE1DE                       ;048152|        |0FE1DE;
                       LDY.B r_SoundBankTempVar1            ;048154|A4E4    |0000E4;
                       LDA.W $0115,X                        ;048156|BD1501  |040115;
                       AND.B #$B9                           ;048159|29B9    |      ;
                       STA.W $0115,X                        ;04815B|9D1501  |040115;
                       LDA.W $016E,X                        ;04815E|BD6E01  |04016E;
                       AND.B #$DF                           ;048161|29DF    |      ;
                       STA.W $016E,X                        ;048163|9D6E01  |04016E;
 
          CODE_048166: LDA.B (r_CurrInstrumentDataAddr),Y   ;048166|B1E0    |0000E0;
                       AND.B #$F0                           ;048168|29F0    |      ;
                       LSR A                                ;04816A|4A      |      ;
                       LSR A                                ;04816B|4A      |      ;
                       LSR A                                ;04816C|4A      |      ;
                       TAX                                  ;04816D|AA      |      ;
                       STY.B r_SoundBankJumpAddr            ;04816E|84E2    |0000E2;
                       LDY.B r_CurrInstrumentIdx            ;048170|A4EE    |0000EE;
                       LDA.W $0180,Y                        ;048172|B98001  |040180;
                       BEQ CODE_04817F                      ;048175|F008    |04817F;
                       BMI CODE_048126                      ;048177|30AD    |048126;
                       TXA                                  ;048179|8A      |      ;
                       CLC                                  ;04817A|18      |      ;
                       ADC.W $0180,Y                        ;04817B|798001  |040180;
 
          CODE_04817E: TAX                                  ;04817E|AA      |      ;
 
          CODE_04817F: LDA.W higherFrequencyData,X          ;04817F|BD2387  |048723;
                       STA.B r_SoundFrequency               ;048182|85EC    |0000EC;
                       LDA.W DATA16_048724,X                ;048184|BD2487  |048724;
                       STA.B $ED                            ;048187|85ED    |0000ED;
 
          CODE_048189: LDY.B r_SoundBankJumpAddr            ;048189|A4E2    |0000E2;
                       LDX.B r_CurrInstrumentIdx            ;04818B|A6EE    |0000EE;
                       LDA.W $017D,X                        ;04818D|BD7D01  |04017D;
                       TAX                                  ;048190|AA      |      ;
 
          CODE_048191: CPX.B #$05                           ;048191|E005    |      ;
                       BEQ CODE_04819C                      ;048193|F007    |04819C;
                       LSR.B $ED                            ;048195|46ED    |0000ED;
                       ROR.B r_SoundFrequency               ;048197|66EC    |0000EC;
                       INX                                  ;048199|E8      |      ;
                       BNE CODE_048191                      ;04819A|D0F5    |048191;
 
          CODE_04819C: LDX.B r_CurrInstrumentIdx            ;04819C|A6EE    |0000EE;
                       LDA.B r_SoundFrequency               ;04819E|A5EC    |0000EC;
                       STA.W $0183,X                        ;0481A0|9D8301  |040183;
                       LDA.B $ED                            ;0481A3|A5ED    |0000ED;
                       STA.W $0186,X                        ;0481A5|9D8601  |040186;
                       CPX.B #$02                           ;0481A8|E002    |      ;
                       BEQ CODE_0481C7                      ;0481AA|F01B    |0481C7;
                       LDA.W $06AC,X                        ;0481AC|BDAC06  |0406AC;
                       BMI CODE_0481B4                      ;0481AF|3003    |0481B4;
                       JSR.W CODE_048229                    ;0481B1|202982  |048229;
 
          CODE_0481B4: LDA.W $016E,X                        ;0481B4|BD6E01  |04016E;
                       AND.B #$10                           ;0481B7|2910    |      ;
                       BEQ CODE_0481C7                      ;0481B9|F00C    |0481C7;
                       LDA.W $03DB,X                        ;0481BB|BDDB03  |0403DB;
                       BNE CODE_0481C7                      ;0481BE|D007    |0481C7;
                       TYA                                  ;0481C0|98      |      ;
                       PHA                                  ;0481C1|48      |      ;
                       db $20                               ;0481C2|        |      ;
                       dw CODE_0FE1EC                       ;0481C3|        |0FE1EC;
                       PLA                                  ;0481C5|68      |      ;
                       TAY                                  ;0481C6|A8      |      ;
 
          CODE_0481C7: JSR.W CODE_0481CD                    ;0481C7|20CD81  |0481CD;
                       JMP.W CODE_0486D6                    ;0481CA|4CD686  |0486D6;
 
 
          CODE_0481CD: CPX.B #$06                           ;0481CD|E006    |      ;
                       BEQ CODE_0481FE                      ;0481CF|F02D    |0481FE;
                       JSR.W CODE_04826F                    ;0481D1|206F82  |04826F;
                       CPX.B #$02                           ;0481D4|E002    |      ;
                       BEQ CODE_0481FE                      ;0481D6|F026    |0481FE;
                       LDA.W $016E,X                        ;0481D8|BD6E01  |04016E;
                       AND.B #$10                           ;0481DB|2910    |      ;
                       BEQ CODE_0481E7                      ;0481DD|F008    |0481E7;
                       LDA.W $03DE,X                        ;0481DF|BDDE03  |0403DE;
                       CMP.B #$FF                           ;0481E2|C9FF    |      ;
                       BNE CODE_0481E7                      ;0481E4|D001    |0481E7;
                       RTS                                  ;0481E6|60      |      ;
 
 
          CODE_0481E7: LDA.B $ED                            ;0481E7|A5ED    |0000ED;
                       CMP.W $014D,X                        ;0481E9|DD4D01  |04014D;
                       BNE CODE_048200                      ;0481EC|D012    |048200;
                       LDA.W $0115,X                        ;0481EE|BD1501  |040115;
                       AND.B #$81                           ;0481F1|2981    |      ;
                       CMP.B #$81                           ;0481F3|C981    |      ;
                       BEQ CODE_0481FE                      ;0481F5|F007    |0481FE;
                       LDA.W $0162,X                        ;0481F7|BD6201  |040162;
                       AND.B #$10                           ;0481FA|2910    |      ;
                       BNE CODE_048210                      ;0481FC|D012    |048210;
 
          CODE_0481FE: LDA.B $ED                            ;0481FE|A5ED    |0000ED;
 
          CODE_048200: STA.W $014D,X                        ;048200|9D4D01  |04014D;
                       ORA.B #$08                           ;048203|0908    |      ;
                       JSR.W secIf2ndSquareInUseElseRetHwRegOffset;048205|201383  |048313;
                       BCS CODE_048210                      ;048208|B006    |048210;
                       STA.W $4003,X                        ;04820A|9D0340  |044003;
                       JSR.W wait10_nop                     ;04820D|205387  |048753;
 
          CODE_048210: LDA.B r_SoundFrequency               ;048210|A5EC    |0000EC;
                       LDX.B r_CurrInstrumentIdx            ;048212|A6EE    |0000EE;
                       CPX.B #$03                           ;048214|E003    |      ;
                       BCS CODE_04821B                      ;048216|B003    |04821B;
                       STA.W $0178,X                        ;048218|9D7801  |040178;
 
          CODE_04821B: JSR.W secIf2ndSquareInUseElseRetHwRegOffset;04821B|201383  |048313;
                       BCS CODE_048226                      ;04821E|B006    |048226;
                       STA.W $4002,X                        ;048220|9D0240  |044002;
                       JSR.W wait10_nop                     ;048223|205387  |048753;
 
          CODE_048226: LDX.B r_CurrInstrumentIdx            ;048226|A6EE    |0000EE;
                       RTS                                  ;048228|60      |      ;
 
 
          CODE_048229: STY.B r_SoundBankJumpAddr            ;048229|84E2    |0000E2;
                       LDA.W $06AF,X                        ;04822B|BDAF06  |0406AF;
                       CPX.B #$00                           ;04822E|E000    |      ;
                       BEQ CODE_048234                      ;048230|F002    |048234;
                       ORA.B #$04                           ;048232|0904    |      ;
 
          CODE_048234: TAY                                  ;048234|A8      |      ;
                       LDA.B $ED                            ;048235|A5ED    |0000ED;
                       STA.W $06BF,Y                        ;048237|99BF06  |0406BF;
                       LDA.B r_SoundFrequency               ;04823A|A5EC    |0000EC;
                       STA.W $06B5,Y                        ;04823C|99B506  |0406B5;
                       LDA.W $06AC,X                        ;04823F|BDAC06  |0406AC;
                       AND.B #$40                           ;048242|2940    |      ;
                       BEQ CODE_048261                      ;048244|F01B    |048261;
                       LDA.W $06AC,X                        ;048246|BDAC06  |0406AC;
                       AND.B #$BF                           ;048249|29BF    |      ;
                       STA.W $06AC,X                        ;04824B|9DAC06  |0406AC;
                       LDA.B #$03                           ;04824E|A903    |      ;
                       STA.B r_SoundBankTempVar1            ;048250|85E4    |0000E4;
 
          CODE_048252: INY                                  ;048252|C8      |      ;
                       LDA.B $ED                            ;048253|A5ED    |0000ED;
                       STA.W $06BF,Y                        ;048255|99BF06  |0406BF;
                       LDA.B r_SoundFrequency               ;048258|A5EC    |0000EC;
                       STA.W $06B5,Y                        ;04825A|99B506  |0406B5;
                       DEC.B r_SoundBankTempVar1            ;04825D|C6E4    |0000E4;
                       BNE CODE_048252                      ;04825F|D0F1    |048252;
 
          CODE_048261: LDY.B r_SoundBankJumpAddr            ;048261|A4E2    |0000E2;
                       INC.W $06AF,X                        ;048263|FEAF06  |0406AF;
                       LDA.W $06AF,X                        ;048266|BDAF06  |0406AF;
                       AND.B #$03                           ;048269|2903    |      ;
                       STA.W $06AF,X                        ;04826B|9DAF06  |0406AF;
                       RTS                                  ;04826E|60      |      ;
 
 
          CODE_04826F: LDA.W $0173,X                        ;04826F|BD7301  |040173;
                       STA.B r_SoundBankJumpAddr            ;048272|85E2    |0000E2;
                       BEQ CODE_048287                      ;048274|F011    |048287;
                       BPL CODE_048288                      ;048276|1010    |048288;
                       AND.B #$7F                           ;048278|297F    |      ;
                       STA.B r_SoundBankJumpAddr            ;04827A|85E2    |0000E2;
                       LDA.B r_SoundFrequency               ;04827C|A5EC    |0000EC;
                       CLC                                  ;04827E|18      |      ;
                       ADC.B r_SoundBankJumpAddr            ;04827F|65E2    |0000E2;
                       STA.B r_SoundFrequency               ;048281|85EC    |0000EC;
                       BCC CODE_048287                      ;048283|9002    |048287;
                       INC.B $ED                            ;048285|E6ED    |0000ED;
 
          CODE_048287: RTS                                  ;048287|60      |      ;
 
 
          CODE_048288: LDA.B r_SoundFrequency               ;048288|A5EC    |0000EC;
                       SEC                                  ;04828A|38      |      ;
                       SBC.B r_SoundBankJumpAddr            ;04828B|E5E2    |0000E2;
                       STA.B r_SoundFrequency               ;04828D|85EC    |0000EC;
                       BCS CODE_048293                      ;04828F|B002    |048293;
                       DEC.B $ED                            ;048291|C6ED    |0000ED;
 
          CODE_048293: RTS                                  ;048293|60      |      ;
 
 
          CODE_048294: JSR.W CODE_0486C6                    ;048294|20C686  |0486C6;
                       DEY                                  ;048297|88      |      ;
                       JMP.W CODE_048058                    ;048298|4C5880  |048058;
 
 
          CODE_04829B: LDA.B (r_CurrInstrumentDataAddr),Y   ;04829B|B1E0    |0000E0;
                       AND.B #$0F                           ;04829D|290F    |      ;
 
          CODE_04829F: STA.B r_SoundBankJumpAddr            ;04829F|85E2    |0000E2;
                       BEQ CODE_0482B0                      ;0482A1|F00D    |0482B0;
                       LDA.W $010E,X                        ;0482A3|BD0E01  |04010E;
 
          CODE_0482A6: CLC                                  ;0482A6|18      |      ;
                       ADC.W $010E,X                        ;0482A7|7D0E01  |04010E;
                       DEC.B r_SoundBankJumpAddr            ;0482AA|C6E2    |0000E2;
                       BNE CODE_0482A6                      ;0482AC|D0F8    |0482A6;
                       BEQ CODE_0482B3                      ;0482AE|F003    |0482B3;
 
          CODE_0482B0: LDA.W $010E,X                        ;0482B0|BD0E01  |04010E;
 
          CODE_0482B3: STA.W $0100,X                        ;0482B3|9D0001  |040100;
                       CPX.B #$05                           ;0482B6|E005    |      ;
                       BEQ CODE_048294                      ;0482B8|F0DA    |048294;
                       CPX.B #$02                           ;0482BA|E002    |      ;
                       BEQ CODE_0482E7                      ;0482BC|F029    |0482E7;
                       LDA.W $016E,X                        ;0482BE|BD6E01  |04016E;
                       AND.B #$10                           ;0482C1|2910    |      ;
                       BEQ CODE_0482D9                      ;0482C3|F014    |0482D9;
                       LDA.W $03DB,X                        ;0482C5|BDDB03  |0403DB;
                       STA.W $03DE,X                        ;0482C8|9DDE03  |0403DE;
                       INC.W $03DE,X                        ;0482CB|FEDE03  |0403DE;
                       LDA.B #$00                           ;0482CE|A900    |      ;
                       STA.W $06A6,X                        ;0482D0|9DA606  |0406A6;
                       STA.W $06A9,X                        ;0482D3|9DA906  |0406A9;
                       STA.W $06A0,X                        ;0482D6|9DA006  |0406A0;
 
          CODE_0482D9: LDA.W $03CF,X                        ;0482D9|BDCF03  |0403CF;
                       JSR.W CODE_0482E8                    ;0482DC|20E882  |0482E8;
                       STA.W $03CC,X                        ;0482DF|9DCC03  |0403CC;
                       LDA.B #$01                           ;0482E2|A901    |      ;
                       STA.W $03D5,X                        ;0482E4|9DD503  |0403D5;
 
          CODE_0482E7: RTS                                  ;0482E7|60      |      ;
 
 
          CODE_0482E8: AND.B #$0F                           ;0482E8|290F    |      ;
                       STA.B r_SoundBankJumpAddr            ;0482EA|85E2    |0000E2;
                       LDA.B #$00                           ;0482EC|A900    |      ;
                       STA.B r_SoundBankTempVar1            ;0482EE|85E4    |0000E4;
                       STA.B r_SoundBankTempVar2            ;0482F0|85E5    |0000E5;
 
          CODE_0482F2: DEC.B r_SoundBankJumpAddr            ;0482F2|C6E2    |0000E2;
                       BMI CODE_048304                      ;0482F4|300E    |048304;
                       CLC                                  ;0482F6|18      |      ;
                       LDA.W $0100,X                        ;0482F7|BD0001  |040100;
                       ADC.B r_SoundBankTempVar1            ;0482FA|65E4    |0000E4;
                       STA.B r_SoundBankTempVar1            ;0482FC|85E4    |0000E4;
                       BCC CODE_0482F2                      ;0482FE|90F2    |0482F2;
                       INC.B r_SoundBankTempVar2            ;048300|E6E5    |0000E5;
                       BNE CODE_0482F2                      ;048302|D0EE    |0482F2;
 
          CODE_048304: ASL A                                ;048304|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;048305|26E5    |0000E5;
                       ASL A                                ;048307|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;048308|26E5    |0000E5;
                       ASL A                                ;04830A|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;04830B|26E5    |0000E5;
                       ASL A                                ;04830D|0A      |      ;
                       ROL.B r_SoundBankTempVar2            ;04830E|26E5    |0000E5;
                       LDA.B r_SoundBankTempVar2            ;048310|A5E5    |0000E5;
                       RTS                                  ;048312|60      |      ;
 
 
secIf2ndSquareInUseElseRetHwRegOffset: PHA                                  ;048313|48      |      ;
                       CPX.B #$00                           ;048314|E000    |      ;
                       BEQ CODE_04832A                      ;048316|F012    |04832A;
                       CPX.B #$01                           ;048318|E001    |      ;
                       BEQ CODE_048332                      ;04831A|F016    |048332;
 
          CODE_04831C: CLC                                  ;04831C|18      |      ;
 
          CODE_04831D: LDA.W DATA8_048323,X                 ;04831D|BD2383  |048323;
                       TAX                                  ;048320|AA      |      ;
                       PLA                                  ;048321|68      |      ;
                       RTS                                  ;048322|60      |      ;
 
 
         DATA8_048323: db $00,$04,$08,$00,$04,$0C,$0C       ;048323|        |      ;
 
          CODE_04832A: LDA.W $010A                          ;04832A|AD0A01  |04010A;
                       BEQ CODE_04831C                      ;04832D|F0ED    |04831C;
                       SEC                                  ;04832F|38      |      ;
                       BNE CODE_04831D                      ;048330|D0EB    |04831D;
 
          CODE_048332: LDA.W $010B                          ;048332|AD0B01  |04010B;
                       BEQ CODE_04831C                      ;048335|F0E5    |04831C;
                       SEC                                  ;048337|38      |      ;
                       BNE CODE_04831D                      ;048338|D0E3    |04831D;
 
          CODE_04833A: JSR.W CODE_04829F                    ;04833A|209F82  |04829F;
                       LDA.B #$00                           ;04833D|A900    |      ;
                       CPX.B #$02                           ;04833F|E002    |      ;
                       BNE CODE_048349                      ;048341|D006    |048349;
                       JSR.W CODE_04867C                    ;048343|207C86  |04867C;
                       JMP.W CODE_048356                    ;048346|4C5683  |048356;
 
 
          CODE_048349: LDA.B #$30                           ;048349|A930    |      ;
                       JSR.W secIf2ndSquareInUseElseRetHwRegOffset;04834B|201383  |048313;
                       BCS CODE_048356                      ;04834E|B006    |048356;
                       STA.W $4000,X                        ;048350|9D0040  |044000;
                       JSR.W wait10_nop                     ;048353|205387  |048753;
 
          CODE_048356: LDX.B r_CurrInstrumentIdx            ;048356|A6EE    |0000EE;
                       LDA.W $0115,X                        ;048358|BD1501  |040115;
                       ORA.B #$40                           ;04835B|0940    |      ;
                       STA.W $0115,X                        ;04835D|9D1501  |040115;
                       JMP.W CODE_0486D6                    ;048360|4CD686  |0486D6;
 
 
          CODE_048363: STA.W $010E,X                        ;048363|9D0E01  |04010E;
                       INY                                  ;048366|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048367|B1E0    |0000E0;
                       CPX.B #$02                           ;048369|E002    |      ;
                       BEQ CODE_0483A0                      ;04836B|F033    |0483A0;
                       AND.B #$F0                           ;04836D|29F0    |      ;
                       STA.W $0162,X                        ;04836F|9D6201  |040162;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048372|B1E0    |0000E0;
                       AND.B #$0F                           ;048374|290F    |      ;
                       STA.W $015B,X                        ;048376|9D5B01  |04015B;
                       INY                                  ;048379|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04837A|B1E0    |0000E0;
                       STA.W $0189,X                        ;04837C|9D8901  |040189;
                       BPL CODE_048385                      ;04837F|1004    |048385;
                       LDA.B #$00                           ;048381|A900    |      ;
                       BEQ CODE_048388                      ;048383|F003    |048388;
 
          CODE_048385: LDA.W $015B,X                        ;048385|BD5B01  |04015B;
 
          CODE_048388: STA.W $0169,X                        ;048388|9D6901  |040169;
                       INY                                  ;04838B|C8      |      ;
 
          CODE_04838C: LDA.B (r_CurrInstrumentDataAddr),Y   ;04838C|B1E0    |0000E0;
                       AND.B #$0F                           ;04838E|290F    |      ;
                       STA.W $03CF,X                        ;048390|9DCF03  |0403CF;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048393|B1E0    |0000E0;
                       LSR A                                ;048395|4A      |      ;
                       LSR A                                ;048396|4A      |      ;
                       LSR A                                ;048397|4A      |      ;
                       LSR A                                ;048398|4A      |      ;
                       STA.W $03D2,X                        ;048399|9DD203  |0403D2;
                       INY                                  ;04839C|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;04839D|4C0180  |048001;
 
 
          CODE_0483A0: STA.W $015D                          ;0483A0|8D5D01  |04015D;
                       INY                                  ;0483A3|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;0483A4|4C0180  |048001;
 
 
          CODE_0483A7: STA.B r_SoundBankJumpAddr            ;0483A7|85E2    |0000E2;
                       LDA.W $016E,X                        ;0483A9|BD6E01  |04016E;
                       AND.B #$7F                           ;0483AC|297F    |      ;
                       STA.W $016E,X                        ;0483AE|9D6E01  |04016E;
                       LDA.B r_SoundBankJumpAddr            ;0483B1|A5E2    |0000E2;
                       CMP.B #$06                           ;0483B3|C906    |      ;
                       BCS CODE_0483BE                      ;0483B5|B007    |0483BE;
                       STA.W $017D,X                        ;0483B7|9D7D01  |04017D;
                       INY                                  ;0483BA|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;0483BB|4C0180  |048001;
 
 
          CODE_0483BE: AND.B #$0F                           ;0483BE|290F    |      ;
                       SEC                                  ;0483C0|38      |      ;
                       SBC.B #$06                           ;0483C1|E906    |      ;
                       ASL A                                ;0483C3|0A      |      ;
                       TAX                                  ;0483C4|AA      |      ;
                       LDA.W PTR16_0483D4,X                 ;0483C5|BDD483  |0483D4;
                       STA.B r_SoundBankJumpAddr            ;0483C8|85E2    |0000E2;
                       LDA.W PTR16_0483D5,X                 ;0483CA|BDD583  |0483D5;
                       STA.B $E3                            ;0483CD|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;0483CF|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;0483D1|6CE200  |0000E2;
 
 
         PTR16_0483D4: dw CODE_0483E8                       ;0483D4|        |0483E8;
                       dw CODE_0483FF                       ;0483D6|        |0483FF;
                       dw CODE_048446                       ;0483D8|        |048446;
                       dw CODE_04844A                       ;0483DA|        |04844A;
                       dw CODE_04847C                       ;0483DC|        |04847C;
                       dw CODE_04848F                       ;0483DE|        |04848F;
                       dw CODE_0484DD                       ;0483E0|        |0484DD;
                       dw CODE_04850D                       ;0483E2|        |04850D;
                       dw CODE_04851A                       ;0483E4|        |04851A;
                       dw CODE_04850D                       ;0483E6|        |04850D;
 
          CODE_0483E8: INY                                  ;0483E8|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0483E9|B1E0    |0000E0;
                       STA.W $010E,X                        ;0483EB|9D0E01  |04010E;
                       LDA.W $016E,X                        ;0483EE|BD6E01  |04016E;
                       BPL CODE_0483FB                      ;0483F1|1008    |0483FB;
                       LDA.W $010E,X                        ;0483F3|BD0E01  |04010E;
                       AND.B #$0F                           ;0483F6|290F    |      ;
                       STA.W $010E,X                        ;0483F8|9D0E01  |04010E;
 
          CODE_0483FB: INY                                  ;0483FB|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;0483FC|4C0180  |048001;
 
 
          CODE_0483FF: INY                                  ;0483FF|C8      |      ;
                       LDA.W $016E,X                        ;048400|BD6E01  |04016E;
                       ORA.B #$80                           ;048403|0980    |      ;
                       STA.W $016E,X                        ;048405|9D6E01  |04016E;
 
          CODE_048408: LDA.B (r_CurrInstrumentDataAddr),Y   ;048408|B1E0    |0000E0;
                       AND.B #$F0                           ;04840A|29F0    |      ;
                       LSR A                                ;04840C|4A      |      ;
                       LSR A                                ;04840D|4A      |      ;
                       LSR A                                ;04840E|4A      |      ;
                       TAX                                  ;04840F|AA      |      ;
                       DEY                                  ;048410|88      |      ;
                       LDA.W PTR16_048420,X                 ;048411|BD2084  |048420;
                       STA.B r_SoundBankJumpAddr            ;048414|85E2    |0000E2;
                       LDA.W PTR16_048421,X                 ;048416|BD2184  |048421;
                       STA.B $E3                            ;048419|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;04841B|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;04841D|6CE200  |0000E2;
 
 
         PTR16_048420: dw allSameSoundFunction              ;048420|        |048434;
                       dw allSameSoundFunction              ;048422|        |048434;
                       dw allSameSoundFunction              ;048424|        |048434;
                       dw allSameSoundFunction              ;048426|        |048434;
                       dw allSameSoundFunction              ;048428|        |048434;
                       dw allSameSoundFunction              ;04842A|        |048434;
                       dw allSameSoundFunction              ;04842C|        |048434;
                       dw allSameSoundFunction              ;04842E|        |048434;
                       dw allSameSoundFunction              ;048430|        |048434;
                       dw allSameSoundFunction              ;048432|        |048434;
 
 allSameSoundFunction: INY                                  ;048434|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048435|B1E0    |0000E0;
                       STA.W r_InstrumentEnvelope1Idx,X     ;048437|9D8901  |000189;
                       LDA.W r_AudioChannelAttributesDuty,X ;04843A|BD6E01  |00016E;
                       AND.B #$7F                           ;04843D|297F    |      ;
                       STA.W r_AudioChannelAttributesDuty,X ;04843F|9D6E01  |00016E;
                       INY                                  ;048442|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;048443|4C0180  |048001;
 
 
          CODE_048446: INY                                  ;048446|C8      |      ;
                       JMP.W CODE_04838C                    ;048447|4C8C83  |04838C;
 
 
          CODE_04844A: INY                                  ;04844A|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04844B|B1E0    |0000E0;
                       BEQ CODE_048464                      ;04844D|F015    |048464;
                       AND.B #$0F                           ;04844F|290F    |      ;
                       BEQ CODE_048474                      ;048451|F021    |048474;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048453|B1E0    |0000E0;
                       STA.W $03D8,X                        ;048455|9DD803  |0403D8;
                       LDA.W $016E,X                        ;048458|BD6E01  |04016E;
                       ORA.B #$20                           ;04845B|0920    |      ;
                       STA.W $016E,X                        ;04845D|9D6E01  |04016E;
 
  channelProcesing_00: INY                                  ;048460|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;048461|4C0180  |048001;
 
 
          CODE_048464: LDA.W r_AudioChannelAttributesDuty,X ;048464|BD6E01  |00016E;
                       AND.B #$DF                           ;048467|29DF    |      ;
                       STA.W r_AudioChannelAttributesDuty,X ;048469|9D6E01  |00016E;
                       LDA.B #$00                           ;04846C|A900    |      ;
                       STA.W $03D8,X                        ;04846E|9DD803  |0403D8;
                       JMP.W channelProcesing_00            ;048471|4C6084  |048460;
 
 
          CODE_048474: LDA.B (r_CurrInstrumentDataAddr),Y   ;048474|B1E0    |0000E0;
                       STA.W $0162,X                        ;048476|9D6201  |040162;
                       JMP.W channelProcesing_00            ;048479|4C6084  |048460;
 
 
          CODE_04847C: INY                                  ;04847C|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04847D|B1E0    |0000E0;
                       BMI CODE_048489                      ;04847F|3008    |048489;
                       ASL A                                ;048481|0A      |      ;
 
          CODE_048482: STA.W $0180,X                        ;048482|9D8001  |040180;
                       INY                                  ;048485|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;048486|4C0180  |048001;
 
 
          CODE_048489: ASL A                                ;048489|0A      |      ;
                       ORA.B #$80                           ;04848A|0980    |      ;
                       JMP.W CODE_048482                    ;04848C|4C8284  |048482;
 
 
          CODE_04848F: INY                                  ;04848F|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048490|B1E0    |0000E0;
                       BEQ CODE_0484D2                      ;048492|F03E    |0484D2;
                       SEC                                  ;048494|38      |      ;
                       SBC.B #$50                           ;048495|E950    |      ;
                       STA.W $06A3,X                        ;048497|9DA306  |0406A3;
                       LDA.W $016E,X                        ;04849A|BD6E01  |04016E;
                       ORA.B #$10                           ;04849D|0910    |      ;
                       STA.W $016E,X                        ;04849F|9D6E01  |04016E;
                       INY                                  ;0484A2|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0484A3|B1E0    |0000E0;
                       AND.B #$F0                           ;0484A5|29F0    |      ;
                       LSR A                                ;0484A7|4A      |      ;
                       LSR A                                ;0484A8|4A      |      ;
                       LSR A                                ;0484A9|4A      |      ;
                       LSR A                                ;0484AA|4A      |      ;
                       CMP.B #$00                           ;0484AB|C900    |      ;
                       BEQ CODE_0484C5                      ;0484AD|F016    |0484C5;
                       STA.B r_SoundBankJumpAddr            ;0484AF|85E2    |0000E2;
                       DEC.B r_SoundBankJumpAddr            ;0484B1|C6E2    |0000E2;
                       BEQ CODE_0484C2                      ;0484B3|F00D    |0484C2;
                       LDA.W $010E,X                        ;0484B5|BD0E01  |04010E;
                       CLC                                  ;0484B8|18      |      ;
 
          CODE_0484B9: ADC.W $010E,X                        ;0484B9|7D0E01  |04010E;
                       DEC.B r_SoundBankJumpAddr            ;0484BC|C6E2    |0000E2;
                       BNE CODE_0484B9                      ;0484BE|D0F9    |0484B9;
                       BEQ CODE_0484C5                      ;0484C0|F003    |0484C5;
 
          CODE_0484C2: LDA.W $010E,X                        ;0484C2|BD0E01  |04010E;
 
          CODE_0484C5: STA.W $03DB,X                        ;0484C5|9DDB03  |0403DB;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0484C8|B1E0    |0000E0;
                       AND.B #$0F                           ;0484CA|290F    |      ;
                       STA.W $03E1,X                        ;0484CC|9DE103  |0403E1;
                       JMP.W channelProcesing_00            ;0484CF|4C6084  |048460;
 
 
          CODE_0484D2: LDA.W $016E,X                        ;0484D2|BD6E01  |04016E;
                       AND.B #$EF                           ;0484D5|29EF    |      ;
                       STA.W $016E,X                        ;0484D7|9D6E01  |04016E;
                       JMP.W channelProcesing_00            ;0484DA|4C6084  |048460;
 
 
          CODE_0484DD: INY                                  ;0484DD|C8      |      ;
                       LDA.W $016E,X                        ;0484DE|BD6E01  |04016E;
                       BPL CODE_0484EB                      ;0484E1|1008    |0484EB;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0484E3|B1E0    |0000E0;
                       AND.B #$0F                           ;0484E5|290F    |      ;
                       BEQ CODE_048506                      ;0484E7|F01D    |048506;
                       BNE CODE_0484EF                      ;0484E9|D004    |0484EF;
 
          CODE_0484EB: LDA.B (r_CurrInstrumentDataAddr),Y   ;0484EB|B1E0    |0000E0;
                       BEQ CODE_048506                      ;0484ED|F017    |048506;
 
          CODE_0484EF: CMP.B #$04                           ;0484EF|C904    |      ;
                       BCC CODE_0484F8                      ;0484F1|9005    |0484F8;
                       SEC                                  ;0484F3|38      |      ;
                       SBC.B #$03                           ;0484F4|E903    |      ;
                       ORA.B #$10                           ;0484F6|0910    |      ;
 
          CODE_0484F8: ORA.B #$40                           ;0484F8|0940    |      ;
                       STA.W $06AC,X                        ;0484FA|9DAC06  |0406AC;
                       LDA.B #$00                           ;0484FD|A900    |      ;
                       STA.W $06AF,X                        ;0484FF|9DAF06  |0406AF;
 
          CODE_048502: INY                                  ;048502|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;048503|4C0180  |048001;
 
 
          CODE_048506: LDA.B #$80                           ;048506|A980    |      ;
                       STA.W $06AC,X                        ;048508|9DAC06  |0406AC;
                       BNE CODE_048502                      ;04850B|D0F5    |048502;
 
          CODE_04850D: INY                                  ;04850D|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04850E|B1E0    |0000E0;
                       STA.W $0173,X                        ;048510|9D7301  |040173;
                       LDA.W $0115,X                        ;048513|BD1501  |040115;
                       INY                                  ;048516|C8      |      ;
                       db $4C                               ;048517|        |      ;
 
                       dw CODE_0FE1FA                       ;048518|        |0FE1FA;
 
          CODE_04851A: INY                                  ;04851A|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04851B|B1E0    |0000E0;
                       STA.W $018E                          ;04851D|8D8E01  |04018E;
                       INY                                  ;048520|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;048521|4C0180  |048001;
 
 
          CODE_048524: LDA.W $0131,X                        ;048524|BD3101  |040131;
                       STA.W $0123,X                        ;048527|9D2301  |040123;
                       LDA.W $0138,X                        ;04852A|BD3801  |040138;
                       STA.W $012A,X                        ;04852D|9D2A01  |04012A;
                       JMP.W CODE_048566                    ;048530|4C6685  |048566;
 
 
          CODE_048533: INY                                  ;048533|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048534|B1E0    |0000E0;
                       CMP.B #$FF                           ;048536|C9FF    |      ;
                       BNE CODE_04855C                      ;048538|D022    |04855C;
                       INY                                  ;04853A|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;04853B|B1E0    |0000E0;
                       STA.W $0123,X                        ;04853D|9D2301  |040123;
                       STA.B r_SoundBankJumpAddr            ;048540|85E2    |0000E2;
                       INY                                  ;048542|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;048543|B1E0    |0000E0;
                       STA.W $012A,X                        ;048545|9D2A01  |04012A;
                       STA.B $E1                            ;048548|85E1    |0000E1;
                       LDA.B r_SoundBankJumpAddr            ;04854A|A5E2    |0000E2;
                       STA.B r_CurrInstrumentDataAddr       ;04854C|85E0    |0000E0;
                       LDY.B #$00                           ;04854E|A000    |      ;
 
          CODE_048550: LDA.W $0115,X                        ;048550|BD1501  |040115;
                       LSR A                                ;048553|4A      |      ;
                       BCS DATA8_048559                     ;048554|B003    |048559;
                       JMP.W processNextSoundByteAlt        ;048556|4C0180  |048001;
 
 
         DATA8_048559: db $4C                               ;048559|        |      ;
                       dw CODE_0FE204                       ;04855A|        |0FE204;
 
          CODE_04855C: INC.W $011C,X                        ;04855C|FE1C01  |04011C;
                       CMP.W $011C,X                        ;04855F|DD1C01  |04011C;
                       BEQ CODE_048574                      ;048562|F010    |048574;
                       BCS CODE_048524                      ;048564|B0BE    |048524;
 
          CODE_048566: LDY.B #$00                           ;048566|A000    |      ;
                       LDA.W $0123,X                        ;048568|BD2301  |040123;
                       STA.B r_CurrInstrumentDataAddr       ;04856B|85E0    |0000E0;
                       LDA.W $012A,X                        ;04856D|BD2A01  |04012A;
                       STA.B $E1                            ;048570|85E1    |0000E1;
                       BNE CODE_048550                      ;048572|D0DC    |048550;
 
          CODE_048574: LDA.B #$00                           ;048574|A900    |      ;
                       STA.W $011C,X                        ;048576|9D1C01  |04011C;
                       LDA.W $0115,X                        ;048579|BD1501  |040115;
                       AND.B #$F7                           ;04857C|29F7    |      ;
                       STA.W $0115,X                        ;04857E|9D1501  |040115;
                       INY                                  ;048581|C8      |      ;
                       TYA                                  ;048582|98      |      ;
                       CLC                                  ;048583|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;048584|65E0    |0000E0;
                       STA.B r_CurrInstrumentDataAddr       ;048586|85E0    |0000E0;
                       LDA.B #$00                           ;048588|A900    |      ;
                       TAY                                  ;04858A|A8      |      ;
                       ADC.B $E1                            ;04858B|65E1    |0000E1;
                       STA.B $E1                            ;04858D|85E1    |0000E1;
                       LDA.W $0115,X                        ;04858F|BD1501  |040115;
                       LSR A                                ;048592|4A      |      ;
                       BCS CODE_048598                      ;048593|B003    |048598;
                       JMP.W processNextSoundByteAlt        ;048595|4C0180  |048001;
 
 
          CODE_048598: LDA.W $0115,X                        ;048598|BD1501  |040115;
                       AND.B #$FB                           ;04859B|29FB    |      ;
                       STA.W $0115,X                        ;04859D|9D1501  |040115;
                       db $4C                               ;0485A0|        |      ;
 
                       dw CODE_0FE204                       ;0485A1|        |0FE204;
 
          CODE_0485A3: CMP.B #$0E                           ;0485A3|C90E    |      ;
                       BEQ CODE_048533                      ;0485A5|F08C    |048533;
                       BCC CODE_0485AC                      ;0485A7|9003    |0485AC;
                       JMP.W CODE_04864E                    ;0485A9|4C4E86  |04864E;
 
 
          CODE_0485AC: CMP.B #$0D                           ;0485AC|C90D    |      ;
                       BEQ CODE_04860F                      ;0485AE|F05F    |04860F;
                       CMP.B #$0B                           ;0485B0|C90B    |      ;
                       BEQ CODE_0485C3                      ;0485B2|F00F    |0485C3;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0485B4|B1E0    |0000E0;
                       AND.B #$0F                           ;0485B6|290F    |      ;
                       STA.W $0169,X                        ;0485B8|9D6901  |040169;
                       CPX.B #$02                           ;0485BB|E002    |      ;
                       BEQ CODE_0485DD                      ;0485BD|F01E    |0485DD;
                       INY                                  ;0485BF|C8      |      ;
                       JMP.W processNextSoundByteAlt        ;0485C0|4C0180  |048001;
 
 
          CODE_0485C3: INY                                  ;0485C3|C8      |      ;
                       TYA                                  ;0485C4|98      |      ;
                       CLC                                  ;0485C5|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0485C6|65E0    |0000E0;
                       STA.W $0131,X                        ;0485C8|9D3101  |040131;
                       LDA.B #$00                           ;0485CB|A900    |      ;
                       ADC.B $E1                            ;0485CD|65E1    |0000E1;
                       STA.W $0138,X                        ;0485CF|9D3801  |040138;
                       LDA.W $0115,X                        ;0485D2|BD1501  |040115;
                       ORA.B #$08                           ;0485D5|0908    |      ;
                       STA.W $0115,X                        ;0485D7|9D1501  |040115;
                       db $4C                               ;0485DA|        |      ;
 
                       dw CODE_0FE1FA                       ;0485DB|        |0FE1FA;
 
          CODE_0485DD: LDA.W $016E,X                        ;0485DD|BD6E01  |04016E;
                       ORA.B #$80                           ;0485E0|0980    |      ;
                       STA.W $016E,X                        ;0485E2|9D6E01  |04016E;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0485E5|B1E0    |0000E0;
                       AND.B #$0F                           ;0485E7|290F    |      ;
                       STA.B r_SoundBankTempVar1            ;0485E9|85E4    |0000E4;
                       JSR.W CODE_04829F                    ;0485EB|209F82  |04829F;
                       LDA.B r_SoundBankTempVar1            ;0485EE|A5E4    |0000E4;
                       JSR.W CODE_0480E5                    ;0485F0|20E580  |0480E5;
                       LDA.W $0183,X                        ;0485F3|BD8301  |040183;
                       STA.B r_SoundFrequency               ;0485F6|85EC    |0000EC;
                       LDA.W $0186,X                        ;0485F8|BD8601  |040186;
                       STA.B $ED                            ;0485FB|85ED    |0000ED;
                       LSR.B $ED                            ;0485FD|46ED    |0000ED;
                       ROR.B r_SoundFrequency               ;0485FF|66EC    |0000EC;
                       JSR.W CODE_0481FE                    ;048601|20FE81  |0481FE;
                       LDA.W $016E,X                        ;048604|BD6E01  |04016E;
                       AND.B #$7F                           ;048607|297F    |      ;
                       STA.W $016E,X                        ;048609|9D6E01  |04016E;
                       JMP.W CODE_0486D6                    ;04860C|4CD686  |0486D6;
 
 
          CODE_04860F: LDA.W $0115,X                        ;04860F|BD1501  |040115;
                       AND.B #$20                           ;048612|2920    |      ;
                       BEQ CODE_048619                      ;048614|F003    |048619;
                       JMP.W CODE_048637                    ;048616|4C3786  |048637;
 
 
          CODE_048619: JSR.W CODE_0486E8                    ;048619|20E886  |0486E8;
                       INY                                  ;04861C|C8      |      ;
                       TYA                                  ;04861D|98      |      ;
                       CLC                                  ;04861E|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;04861F|65E0    |0000E0;
                       STA.W $013F,X                        ;048621|9D3F01  |04013F;
                       LDA.B #$00                           ;048624|A900    |      ;
                       TAY                                  ;048626|A8      |      ;
                       ADC.B $E1                            ;048627|65E1    |0000E1;
                       STA.W $0146,X                        ;048629|9D4601  |040146;
                       LDA.W $0115,X                        ;04862C|BD1501  |040115;
                       ORA.B #$20                           ;04862F|0920    |      ;
                       STA.W $0115,X                        ;048631|9D1501  |040115;
                       JMP.W CODE_048566                    ;048634|4C6685  |048566;
 
 
          CODE_048637: LDA.W $013F,X                        ;048637|BD3F01  |04013F;
                       STA.B r_CurrInstrumentDataAddr       ;04863A|85E0    |0000E0;
                       LDA.W $0146,X                        ;04863C|BD4601  |040146;
                       STA.B $E1                            ;04863F|85E1    |0000E1;
                       LDA.W $0115,X                        ;048641|BD1501  |040115;
                       AND.B #$DF                           ;048644|29DF    |      ;
                       STA.W $0115,X                        ;048646|9D1501  |040115;
                       LDY.B #$00                           ;048649|A000    |      ;
                       db $4C                               ;04864B|        |      ;
 
                       dw CODE_0FE1FA                       ;04864C|        |0FE1FA;
 
          CODE_04864E: LDA.W $0107,X                        ;04864E|BD0701  |040107;
                       STA.B r_SoundBankTempVar1            ;048651|85E4    |0000E4;
                       LDA.B #$00                           ;048653|A900    |      ;
                       STA.W $0107,X                        ;048655|9D0701  |040107;
                       TXA                                  ;048658|8A      |      ;
                       ASL A                                ;048659|0A      |      ;
                       TAX                                  ;04865A|AA      |      ;
                       LDA.W someJumpTablePointer00Lo,X     ;04865B|BDF586  |0486F5;
                       STA.B r_SoundBankJumpAddr            ;04865E|85E2    |0000E2;
                       LDA.W someJumpTablePointer00Hi,X     ;048660|BDF686  |0486F6;
                       STA.B $E3                            ;048663|85E3    |0000E3;
                       LDX.B r_CurrInstrumentIdx            ;048665|A6EE    |0000EE;
                       JMP.W (r_SoundBankJumpAddr)          ;048667|6CE200  |0000E2;
 
 
silenceSndChannelIf2ndInUse: LDA.B #$30                           ;04866A|A930    |      ;
                       JSR.W secIf2ndSquareInUseElseRetHwRegOffset;04866C|201383  |048313;
                       BCS CODE_048677                      ;04866F|B006    |048677;
                       STA.W $4000,X                        ;048671|9D0040  |044000;
                       JSR.W wait10_nop                     ;048674|205387  |048753;
 
          CODE_048677: LDX.B r_CurrInstrumentIdx            ;048677|A6EE    |0000EE;
                       db $4C                               ;048679|        |      ;
 
                       dw CODE_0FE1A6                       ;04867A|        |0FE1A6;
 
          CODE_04867C: LDA.B #$00                           ;04867C|A900    |      ;
                       STA.W $4008                          ;04867E|8D0840  |044008;
                       db $4C                               ;048681|        |      ;
 
                       dw CODE_0FE1A6                       ;048682|        |0FE1A6;
 
          CODE_048684: LDX.W $018C                          ;048684|AE8C01  |04018C;
                       LDA.B #$30                           ;048687|A930    |      ;
                       STA.W $4000,X                        ;048689|9D0040  |044000;
                       JSR.W wait10_nop                     ;04868C|205387  |048753;
                       LDA.B #$7F                           ;04868F|A97F    |      ;
                       STA.W $4001,X                        ;048691|9D0140  |044001;
                       JSR.W wait10_nop                     ;048694|205387  |048753;
                       LDX.B r_CurrInstrumentIdx            ;048697|A6EE    |0000EE;
                       LDA.W $0115,X                        ;048699|BD1501  |040115;
                       AND.B #$F9                           ;04869C|29F9    |      ;
                       STA.W $0115,X                        ;04869E|9D1501  |040115;
                       LDA.B #$00                           ;0486A1|A900    |      ;
                       STA.W $0173,X                        ;0486A3|9D7301  |040173;
                       LDA.W $0104,X                        ;0486A6|BD0401  |040104;
                       BEQ CODE_0486B6                      ;0486A9|F00B    |0486B6;
                       LDX.B r_CurrInstrumentIdx            ;0486AB|A6EE    |0000EE;
                       DEX                                  ;0486AD|CA      |      ;
                       DEX                                  ;0486AE|CA      |      ;
                       DEX                                  ;0486AF|CA      |      ;
                       LDY.W $018C                          ;0486B0|AC8C01  |04018C;
                       db $20                               ;0486B3|        |      ;
                       dw CODE_0FE20C                       ;0486B4|        |0FE20C;
 
          CODE_0486B6: LDX.B r_CurrInstrumentIdx            ;0486B6|A6EE    |0000EE;
                       db $4C                               ;0486B8|        |      ;
 
                       dw CODE_0FE1A6                       ;0486B9|        |0FE1A6;
 
          CODE_0486BB: LDA.B #$30                           ;0486BB|A930    |      ;
                       STA.W $400C                          ;0486BD|8D0C40  |04400C;
                       JSR.W wait10_nop                     ;0486C0|205387  |048753;
                       db $4C                               ;0486C3|        |      ;
 
                       dw CODE_0FE1A6                       ;0486C4|        |0FE1A6;
 
          CODE_0486C6: INY                                  ;0486C6|C8      |      ;
                       TYA                                  ;0486C7|98      |      ;
                       CLC                                  ;0486C8|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0486C9|65E0    |0000E0;
                       STA.W $0123,X                        ;0486CB|9D2301  |040123;
                       LDA.B #$00                           ;0486CE|A900    |      ;
                       ADC.B $E1                            ;0486D0|65E1    |0000E1;
                       STA.W $012A,X                        ;0486D2|9D2A01  |04012A;
                       RTS                                  ;0486D5|60      |      ;
 
 
          CODE_0486D6: INY                                  ;0486D6|C8      |      ;
                       TYA                                  ;0486D7|98      |      ;
                       CLC                                  ;0486D8|18      |      ;
                       ADC.B r_CurrInstrumentDataAddr       ;0486D9|65E0    |0000E0;
                       STA.W $0123,X                        ;0486DB|9D2301  |040123;
                       LDA.B #$00                           ;0486DE|A900    |      ;
                       ADC.B $E1                            ;0486E0|65E1    |0000E1;
                       STA.W $012A,X                        ;0486E2|9D2A01  |04012A;
                       db $4C                               ;0486E5|        |      ;
 
                       dw CODE_0FE1A6                       ;0486E6|        |0FE1A6;
 
          CODE_0486E8: INY                                  ;0486E8|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0486E9|B1E0    |0000E0;
                       STA.W $0123,X                        ;0486EB|9D2301  |040123;
                       INY                                  ;0486EE|C8      |      ;
                       LDA.B (r_CurrInstrumentDataAddr),Y   ;0486EF|B1E0    |0000E0;
                       STA.W $012A,X                        ;0486F1|9D2A01  |04012A;
                       RTS                                  ;0486F4|60      |      ;
 
 
someJumpTablePointer00Lo: dw silenceSndChannelIf2ndInUse       ;0486F5|        |04866A;
                       dw silenceSndChannelIf2ndInUse       ;0486F7|        |04866A;
                       dw CODE_04867C                       ;0486F9|        |04867C;
                       dw CODE_048684                       ;0486FB|        |048684;
                       dw CODE_048684                       ;0486FD|        |048684;
                       dw CODE_0486BB                       ;0486FF|        |0486BB;
                       dw silenceSndChannelIf2ndInUse       ;048701|        |04866A;
 
someJumpTablePointer01Lo: dw CODE_04833A                       ;048703|        |04833A;
                       dw CODE_048363                       ;048705|        |048363;
                       dw CODE_0483A7                       ;048707|        |0483A7;
                       dw CODE_0485A3                       ;048709|        |0485A3;
 
   lowerFrequencyData: dw $0D5C,$0C9C,$0BE8,$0B3C           ;04870B|        |      ; C1
                       dw $0A9C,$0A02,$0972,$08EC           ;048713|        |      ; E1
                       dw $086C,$07F2,$0780,$0714           ;04871B|        |      ; G#1
 
  higherFrequencyData: dw $06AE,$064E,$05F4,$059E           ;048723|        |      ; C2
                       dw $054E,$0501,$04B9,$0476           ;04872B|        |      ; E2
                       dw $0436,$03F9,$03C0,$038A           ;048733|        |      ; G#2
                       dw $0357,$0327,$02FA,$02CF           ;04873B|        |      ; C3
                       dw $02A7,$0281,$025D,$023B           ;048743|        |      ; E3
                       dw $021B,$01FD,$01E0,$01C5           ;04874B|        |      ; G#3
 
           wait10_nop: NOP                                  ;048753|EA      |      ;
                       NOP                                  ;048754|EA      |      ;
                       NOP                                  ;048755|EA      |      ;
                       NOP                                  ;048756|EA      |      ;
                       NOP                                  ;048757|EA      |      ;
                       NOP                                  ;048758|EA      |      ;
                       NOP                                  ;048759|EA      |      ;
                       NOP                                  ;04875A|EA      |      ;
                       NOP                                  ;04875B|EA      |      ;
                       NOP                                  ;04875C|EA      |      ;
                       RTS                                  ;04875D|60      |      ;
 
 
 sndTra00_blkClear_63: db $D8,$79,$85,$27,$E9,$B9,$EB,$67   ;04875E|        |      ;
                       db $21,$E3,$00,$00,$C0,$40,$C0,$70   ;048766|        |      ;
                       db $C0,$E8,$45,$E2,$20,$E9,$B7,$01   ;04876E|        |      ;
                       db $E3,$71,$91,$51,$00,$40,$90,$80   ;048776|        |      ;
                       db $90,$B0,$E9,$00,$E8,$34,$E2,$09   ;04877E|        |      ;
                       db $FF                               ;048786|        |      ;
 
 sndTra01_blkClear_63: db $D8,$79,$84,$46,$E9,$B9,$EB,$67   ;048787|        |      ;
                       db $21,$E3,$90,$B0,$C0,$E2,$00,$C0   ;04878F|        |      ;
                       db $20,$C0,$70,$E8,$34,$50,$40,$20   ;048797|        |      ;
                       db $00,$40,$20,$00,$E3,$B0,$90,$B0   ;04879F|        |      ;
                       db $E2,$00,$E3,$B0,$E2,$00,$20,$E9   ;0487A7|        |      ;
                       db $00,$E8,$34,$E2,$49,$FF           ;0487AF|        |      ;
 
 sndTra02_blkClear_63: db $D8,$12,$E4,$90,$E3,$90,$E4,$90   ;0487B5|        |      ;
                       db $E3,$90,$E4,$B0,$E3,$B0,$E4,$B0   ;0487BD|        |      ;
                       db $E3,$B0,$E3,$00,$E2,$00,$E3,$00   ;0487C5|        |      ;
                       db $E2,$00,$E3,$20,$E2,$20,$E3,$20   ;0487CD|        |      ;
                       db $E2,$20,$D8,$16,$E3,$40,$30,$40   ;0487D5|        |      ;
                       db $E4,$40,$60,$80,$D8,$00,$E4,$99   ;0487DD|        |      ;
                       db $FF                               ;0487E5|        |      ;
 
 sndTra05_blkClear_63: db $D8,$FB,$D1,$B0,$D7,$10,$D8,$10   ;0487E6|        |      ;
                       db $10,$10,$FE,$04,$D4,$40,$40,$D8   ;0487EE|        |      ;
                       db $FB,$40,$FE,$05,$D1,$B1,$D7,$21   ;0487F6|        |      ;
                       db $FF                               ;0487FE|        |      ;
 
 sndTra00_gameover_65: db $D7,$77,$84,$12,$E9,$B1,$EB,$50   ;0487FF|        |      ;
                       db $52,$E3,$A0,$20,$70,$A0,$E2,$20   ;048807|        |      ;
                       db $E3,$70,$A0,$E2,$20,$70,$E3,$A0   ;04880F|        |      ;
                       db $E2,$20,$70,$50,$E3,$90,$E2,$00   ;048817|        |      ;
                       db $50,$E9,$00,$40,$E3,$70,$A0,$E2   ;04881F|        |      ;
                       db $11,$E3,$70,$A0,$E2,$10,$20,$E3   ;048827|        |      ;
                       db $60,$90,$E2,$00,$E3,$60,$90,$E2   ;04882F|        |      ;
                       db $20,$00,$E6,$08,$E3,$A1,$E6,$09   ;048837|        |      ;
                       db $E2,$21,$E6,$0A,$11,$E6,$0B,$01   ;04883F|        |      ;
                       db $E3,$E6,$01,$B5,$95,$E6,$0C,$E8   ;048847|        |      ;
                       db $00,$B6,$FF                       ;04884F|        |      ;
 
 sndTra01_gameover_65: db $D7,$70,$09,$11,$E9,$B1,$EB,$50   ;048852|        |      ;
                       db $51,$E2,$20,$E3,$70,$A0,$E2,$20   ;04885A|        |      ;
                       db $70,$E3,$A0,$E2,$20,$70,$A0,$20   ;048862|        |      ;
                       db $70,$A0,$90,$00,$50,$90,$E9,$31   ;04886A|        |      ;
                       db $72,$41,$40,$60,$70,$62,$42,$61   ;048872|        |      ;
                       db $E6,$19,$E8,$00,$76,$FF           ;04887A|        |      ;
 
 sndTra02_gameover_65: db $D7,$12,$E4,$70,$F0,$70,$F0,$50   ;048880|        |      ;
                       db $F0,$50,$F0,$30,$F0,$30,$F0,$20   ;048888|        |      ;
                       db $F0,$20,$F0,$11,$F0,$11,$F0,$10   ;048890|        |      ;
                       db $F0,$21,$F0,$21,$F0,$20,$F0,$D7   ;048898|        |      ;
                       db $00,$E6,$13,$73,$E6,$0C,$E5,$77   ;0488A0|        |      ;
                       db $FF                               ;0488A8|        |      ;
 
 sndTra05_gameover_65: db $D1,$FB,$B0,$2C,$16,$16,$FE,$04   ;0488A9|        |      ;
                       db $FB,$B0,$2C,$46,$B0,$2C,$46,$B0   ;0488B1|        |      ;
                       db $15,$46,$FE,$02,$B0,$1E,$1F,$C1   ;0488B9|        |      ;
                       db $B0,$1F,$C2,$1F,$C5,$B0,$2C,$FF   ;0488C1|        |      ;
 
sndTra00_deamonSeed_58: db $D9,$78,$88,$17,$CF,$CF,$CF,$C8   ;0488C9|        |      ;
                       db $E9,$B1,$E5,$80,$F5,$80,$F0,$70   ;0488D1|        |      ;
                       db $F5,$70,$F0,$60,$F5,$60,$F0,$70   ;0488D9|        |      ;
                       db $E9,$00                           ;0488E1|        |      ;
 
 loopPo_DeamonSeed_00: db $D9,$77,$85,$13,$EB,$54,$32,$EC   ;0488E3|        |      ;
                       db $02,$E9,$74,$E4,$A2,$E8,$19,$E3   ;0488EB|        |      ;
                       db $21,$71,$E8,$12,$6A,$E4,$A1,$E3   ;0488F3|        |      ;
                       db $20,$E8,$19,$71,$E8,$12,$68,$50   ;0488FB|        |      ;
                       db $50,$F3,$50,$50,$F5,$50,$50,$F7   ;048903|        |      ;
                       db $50,$50,$50,$C6,$CF,$E8,$13,$F0   ;04890B|        |      ;
                       db $E4,$A2,$E8,$19,$E3,$21,$71,$E8   ;048913|        |      ;
                       db $12,$6A,$E4,$A1,$E3,$20,$E8,$19   ;04891B|        |      ;
                       db $71,$E8,$12,$68,$EC,$00,$EB,$00   ;048923|        |      ;
                       db $D9,$F6,$84,$19,$E3,$A0,$A0,$D9   ;04892B|        |      ;
                       db $77,$87,$17,$E9,$B1,$E5,$00,$00   ;048933|        |      ;
                       db $00,$F3,$00,$ED,$01,$F4,$E2,$00   ;04893B|        |      ;
                       db $ED,$00,$F5,$E5,$00,$00,$F0,$80   ;048943|        |      ;
                       db $F5,$80,$F0,$70,$F4,$ED,$01,$E3   ;04894B|        |      ;
                       db $B0,$ED,$00,$F0,$E5,$60,$F5,$60   ;048953|        |      ;
                       db $F0,$70,$00,$00,$ED,$01,$F4,$E3   ;04895B|        |      ;
                       db $A0,$ED,$00,$F0,$E5,$00,$00,$F3   ;048963|        |      ;
                       db $00,$F0,$20,$F4,$20,$ED,$01,$F5   ;04896B|        |      ;
                       db $E3,$90,$ED,$00,$F0,$E5,$30,$F5   ;048973|        |      ;
                       db $30,$F4,$ED,$01,$E3,$80,$ED,$00   ;04897B|        |      ;
                       db $F5,$E5,$40,$ED,$01,$F4,$E3,$70   ;048983|        |      ;
                       db $ED,$00,$F0,$E5,$40,$00,$D9,$76   ;04898B|        |      ;
                       db $84,$13,$EB,$54,$32,$E9,$74,$E3   ;048993|        |      ;
                       db $32,$E8,$12,$E6,$12,$0A,$E6,$09   ;04899B|        |      ;
                       db $E8,$15,$E3,$31,$21,$11,$20,$32   ;0489A3|        |      ;
                       db $22,$12,$02,$E4,$B1,$A1,$E8,$13   ;0489AB|        |      ;
                       db $A2,$E8,$12,$EB,$54,$33,$E6,$0F   ;0489B3|        |      ;
                       db $5E,$E9,$00,$EC,$00,$EB,$00,$E6   ;0489BB|        |      ;
                       db $09,$C0,$D1,$34,$80,$00,$E4,$F3   ;0489C3|        |      ;
                       db $10,$21,$31,$41,$51,$F2,$61,$71   ;0489CB|        |      ;
                       db $81,$F1,$91,$A1,$B1,$F0,$E3,$01   ;0489D3|        |      ;
                       db $11,$21,$FB,$D9,$37,$85,$18,$EC   ;0489DB|        |      ;
                       db $00,$E3,$30,$30,$C0,$D9,$77,$87   ;0489E3|        |      ;
                       db $17,$E9,$B1,$ED,$02,$E5,$70,$70   ;0489EB|        |      ;
                       db $F5,$70,$F0,$E9,$00,$FE,$02,$ED   ;0489F3|        |      ;
                       db $00,$D9,$37,$85,$18,$E9,$31,$E3   ;0489FB|        |      ;
                       db $30,$30,$C1,$30,$30,$C0,$D9,$77   ;048A03|        |      ;
                       db $87,$19,$E9,$B1,$ED,$02,$E5,$70   ;048A0B|        |      ;
                       db $70,$F5,$70,$E9,$00,$ED,$00,$D9   ;048A13|        |      ;
                       db $37,$85,$18,$E3,$30,$30,$E6,$06   ;048A1B|        |      ;
                       db $E8,$18,$C1,$31,$41,$51,$61,$71   ;048A23|        |      ;
                       db $FE,$FF                           ;048A2B|        |      ;
                       dw loopPo_DeamonSeed_00              ;048A2D|        |0488E3;
 
sndTra01_deamonSeed_58: db $D9,$78,$88,$17,$E9,$B1,$E5,$FB   ;048A2F|        |      ;
                       db $00,$00,$00,$00,$00,$F3,$00,$F5   ;048A37|        |      ;
                       db $00,$00,$00,$F0,$80,$F5,$80,$F0   ;048A3F|        |      ;
                       db $70,$F5,$70,$F0,$60,$F5,$60,$F0   ;048A47|        |      ;
                       db $70,$FE,$03,$00,$00,$00,$00,$00   ;048A4F|        |      ;
                       db $F3,$00,$F5,$00,$00,$00,$D9,$75   ;048A57|        |      ;
                       db $83,$18,$EC,$02,$E9,$31,$E4,$70   ;048A5F|        |      ;
                       db $E3,$30,$E2,$00,$30,$E1,$30,$E0   ;048A67|        |      ;
                       db $00,$30                           ;048A6F|        |      ;
 
         MUSIC_048A71: db $D9,$F8,$85,$13,$EB,$54,$32,$EC   ;048A71|        |      ;
                       db $02,$E9,$35,$E3,$32,$E8,$19,$71   ;048A79|        |      ;
                       db $E2,$01,$E8,$12,$E3,$BA,$31,$70   ;048A81|        |      ;
                       db $E8,$19,$E2,$01,$E8,$12,$E3,$B8   ;048A89|        |      ;
                       db $A0,$A0,$F3,$A0,$A0,$F4,$A0,$A0   ;048A91|        |      ;
                       db $F5,$A0,$A0,$F6,$A0,$D9,$77,$87   ;048A99|        |      ;
                       db $17,$EC,$00,$E9,$B1,$E5,$80,$F5   ;048AA1|        |      ;
                       db $80,$F0,$70,$F5,$70,$F0,$60,$F5   ;048AA9|        |      ;
                       db $60,$F0,$70,$00,$00,$00,$00,$00   ;048AB1|        |      ;
                       db $F3,$00,$F5,$00,$00,$00,$F0,$80   ;048AB9|        |      ;
                       db $F5,$80,$F0,$70,$F5,$70,$F0,$60   ;048AC1|        |      ;
                       db $F5,$60,$F0,$70,$D9,$F8,$85,$13   ;048AC9|        |      ;
                       db $EB,$54,$32,$EC,$02,$E9,$35,$E3   ;048AD1|        |      ;
                       db $32,$E8,$19,$71,$E2,$01,$E8,$12   ;048AD9|        |      ;
                       db $E3,$BA,$31,$70,$E8,$19,$E2,$01   ;048AE1|        |      ;
                       db $E8,$12,$E3,$B8,$EC,$00,$E8,$13   ;048AE9|        |      ;
                       db $E2,$20,$20,$E9,$00,$C0,$F4,$20   ;048AF1|        |      ;
                       db $20,$C0,$F0,$00,$F6,$20,$C0,$F4   ;048AF9|        |      ;
                       db $00,$C0,$F5,$00,$F0,$E3,$B0,$F6   ;048B01|        |      ;
                       db $E2,$00,$C0,$F4,$E3,$B0,$C0,$F5   ;048B09|        |      ;
                       db $B0,$F0,$A0,$F6,$B0,$C0,$F4,$A0   ;048B11|        |      ;
                       db $C0,$F5,$A0,$F0,$90,$F6,$A0,$C0   ;048B19|        |      ;
                       db $F0,$80,$F6,$90,$F0,$70,$F6,$90   ;048B21|        |      ;
                       db $F4,$70,$F0,$EC,$02,$E9,$35,$E3   ;048B29|        |      ;
                       db $82,$E8,$12,$E6,$12,$3A,$E6,$09   ;048B31|        |      ;
                       db $E8,$15,$81,$71,$61,$70,$82,$72   ;048B39|        |      ;
                       db $62,$52,$41,$31,$E8,$13,$32,$E8   ;048B41|        |      ;
                       db $12,$E6,$0F,$E4,$EB,$55,$34,$AE   ;048B49|        |      ;
                       db $E6,$09,$C0,$E9,$00,$E9,$30,$E6   ;048B51|        |      ;
                       db $01,$F4,$50,$61,$71,$F3,$81,$91   ;048B59|        |      ;
                       db $A1,$F2,$B1,$E3,$01,$F1,$11,$21   ;048B61|        |      ;
                       db $31,$F0,$41,$51,$61,$EB,$00,$D9   ;048B69|        |      ;
                       db $38,$85,$1A,$EC,$00,$E9,$71,$E3   ;048B71|        |      ;
                       db $70,$70,$C0,$E9,$00,$F4,$70,$F6   ;048B79|        |      ;
                       db $70,$C0,$F0,$EC,$00,$E9,$71,$E3   ;048B81|        |      ;
                       db $70,$70,$C0,$E9,$00,$F4,$70,$F6   ;048B89|        |      ;
                       db $70,$C0,$F0,$E9,$71,$70,$70,$E9   ;048B91|        |      ;
                       db $00,$C0,$F6,$70,$F0,$E9,$71,$70   ;048B99|        |      ;
                       db $70,$C0,$E9,$00,$F4,$70,$F6,$70   ;048BA1|        |      ;
                       db $C0,$F0,$E9,$71,$70,$70,$E6,$0C   ;048BA9|        |      ;
                       db $C0,$E8,$17,$70,$80,$90,$A0,$B0   ;048BB1|        |      ;
                       db $FE,$FF                           ;048BB9|        |      ;
                       dw MUSIC_048A71                      ;048BBB|        |048A71;
 
sndTra02_deamonSeed_58: db $D9,$12,$E4,$FB,$00,$00,$00,$00   ;048BBD|        |      ;
                       db $00,$00,$C2,$81,$71,$61,$70,$FE   ;048BC5|        |      ;
                       db $04                               ;048BCD|        |      ;
 
         MUSIC_048BCE: db $D9,$12,$E4,$FB,$00,$00,$00,$00   ;048BCE|        |      ;
                       db $00,$00,$C2,$81,$71,$61,$70,$FE   ;048BD6|        |      ;
                       db $04,$D9,$12,$FB,$E4,$00,$00,$00   ;048BDE|        |      ;
                       db $00,$00,$00,$C2,$81,$71,$61,$70   ;048BE6|        |      ;
                       db $FE,$02,$D9,$12,$E4,$00,$00,$00   ;048BEE|        |      ;
                       db $00,$00,$00,$C2,$81,$71,$61,$70   ;048BF6|        |      ;
                       db $00,$00,$00,$00,$01,$21,$C0,$31   ;048BFE|        |      ;
                       db $41,$70,$40,$00,$D9,$12,$FB,$E4   ;048C06|        |      ;
                       db $50,$50,$50,$50,$50,$50,$C2,$E3   ;048C0E|        |      ;
                       db $11,$01,$E4,$B1,$E3,$00,$FE,$02   ;048C16|        |      ;
                       db $12,$02,$E4,$B2,$A2,$91,$81,$FB   ;048C1E|        |      ;
                       db $00,$00,$00,$00,$00,$00,$C2,$81   ;048C26|        |      ;
                       db $71,$61,$70,$FE,$02,$D9,$12,$FB   ;048C2E|        |      ;
                       db $E3,$70,$70,$C0,$E4,$70,$70,$C0   ;048C36|        |      ;
                       db $FE,$02,$E3,$70,$70,$C1,$70,$70   ;048C3E|        |      ;
                       db $C0,$E4,$70,$70,$E3,$C0,$70,$70   ;048C46|        |      ;
                       db $E6,$0C,$C0,$E4,$70,$80,$90,$A0   ;048C4E|        |      ;
                       db $B0,$FE,$FF                       ;048C56|        |      ;
                       dw MUSIC_048BCE                      ;048C59|        |048BCE;
 
sndTra05_deamonSeed_58: db $D9,$FB,$D1,$B0,$17,$D9,$C0,$10   ;048C5B|        |      ;
                       db $B0,$41,$11,$10,$B0,$10,$B0,$41   ;048C63|        |      ;
                       db $11,$FE,$03,$D1,$B0,$17,$D9,$C0   ;048C6B|        |      ;
                       db $10,$B0,$41,$11,$10,$B0,$10,$B0   ;048C73|        |      ;
                       db $41,$10,$20                       ;048C7B|        |      ;
 
         MUSIC_048C7E: db $D9,$FB,$D1,$B0,$17,$D9,$C0,$10   ;048C7E|        |      ;
                       db $B0,$41,$11,$10,$B0,$10,$B0,$41   ;048C86|        |      ;
                       db $11,$FE,$03,$D1,$B0,$17,$D9,$C0   ;048C8E|        |      ;
                       db $10,$B0,$41,$11,$10,$B0,$10,$B0   ;048C96|        |      ;
                       db $41,$10,$20,$D9,$FB,$D1,$B0,$17   ;048C9E|        |      ;
                       db $D9,$C0,$10,$B0,$41,$11,$10,$B0   ;048CA6|        |      ;
                       db $10,$B0,$41,$11,$FE,$02,$D9,$B1   ;048CAE|        |      ;
                       db $10,$B0,$41,$11,$10,$B0,$10,$B0   ;048CB6|        |      ;
                       db $41,$11,$B1,$10,$B0,$41,$11,$10   ;048CBE|        |      ;
                       db $B0,$10,$B0,$41,$10,$20,$D9,$FB   ;048CC6|        |      ;
                       db $D1,$B0,$17,$D9,$C0,$10,$B0,$41   ;048CCE|        |      ;
                       db $11,$10,$B0,$10,$B0,$41,$11,$FE   ;048CD6|        |      ;
                       db $04,$D1,$B0,$17,$D9,$C0,$10,$B0   ;048CDE|        |      ;
                       db $41,$11,$10,$B0,$10,$B0,$41,$10   ;048CE6|        |      ;
                       db $20,$D9,$40,$40,$C0,$B0,$B0,$C0   ;048CEE|        |      ;
                       db $40,$40,$C0,$B0,$B0,$C0,$40,$40   ;048CF6|        |      ;
                       db $C1,$40,$40,$C0,$B0,$B0,$C0,$40   ;048CFE|        |      ;
                       db $40,$D1,$2B,$FB,$B0,$10,$C9,$FE   ;048D06|        |      ;
                       db $05,$FE,$FF                       ;048D0E|        |      ;
                       dw MUSIC_048C7E                      ;048D11|        |048C7E;
 
   sndTra00_dejavu_5B: db $D7,$76,$83,$17,$E3,$90,$90,$F4   ;048D13|        |      ;
                       db $50,$F0,$90,$F4,$50,$F0,$93,$E9   ;048D1B|        |      ;
                       db $B0,$90,$E2,$20,$90,$E9,$70,$E6   ;048D23|        |      ;
                       db $01,$E4,$93,$F4,$E9,$B0,$E2,$22   ;048D2B|        |      ;
                       db $F0,$E9,$70,$E4,$93,$F4,$E9,$B0   ;048D33|        |      ;
                       db $E2,$92,$F0,$E9,$70,$E6,$07,$E3   ;048D3B|        |      ;
                       db $20,$40,$52,$E4,$A2,$E3,$51,$40   ;048D43|        |      ;
                       db $E8,$35,$E3,$73,$E8,$17,$E4,$70   ;048D4B|        |      ;
                       db $E3,$00,$70,$90,$90,$F4,$50,$F0   ;048D53|        |      ;
                       db $90,$F4,$50,$F0,$93,$E9,$B0,$90   ;048D5B|        |      ;
                       db $E2,$20,$90,$E9,$70,$E6,$01,$E4   ;048D63|        |      ;
                       db $93,$F4,$E9,$B0,$E2,$22,$F0,$E9   ;048D6B|        |      ;
                       db $70,$E4,$93,$F4,$E9,$B0,$E2,$92   ;048D73|        |      ;
                       db $F0,$E9,$70,$E6,$07,$E3,$20,$40   ;048D7B|        |      ;
                       db $52,$E4,$A2,$E3,$51,$53,$43,$D7   ;048D83|        |      ;
                       db $76,$84,$1A,$FB,$C1,$E3,$92,$E2   ;048D8B|        |      ;
                       db $22,$10,$20,$10,$00,$F2,$80,$90   ;048D93|        |      ;
                       db $80,$ED,$01,$50,$F4,$91,$ED,$00   ;048D9B|        |      ;
                       db $E8,$18,$F0,$50,$20,$F5,$50,$20   ;048DA3|        |      ;
                       db $F0,$E3,$50,$20,$F5,$50,$F0,$50   ;048DAB|        |      ;
                       db $20,$50,$20,$50,$20,$50,$FE,$02   ;048DB3|        |      ;
                       db $D7,$75,$83,$27,$E9,$B1,$E3,$A2   ;048DBB|        |      ;
                       db $E2,$12,$41,$22,$E3,$92,$51,$A2   ;048DC3|        |      ;
                       db $E2,$12,$41,$22,$E3,$90,$F4,$E2   ;048DCB|        |      ;
                       db $21,$E3,$90,$E2,$20,$F0,$E3,$A2   ;048DD3|        |      ;
                       db $E2,$12,$41,$22,$E3,$92,$51,$A2   ;048DDB|        |      ;
                       db $E2,$12,$41,$12,$42,$71,$E9,$00   ;048DE3|        |      ;
                       db $D7,$37,$84,$17,$E9,$71,$E2,$90   ;048DEB|        |      ;
                       db $90,$E3,$90,$E8,$77,$EB,$55,$31   ;048DF3|        |      ;
                       db $99,$E8,$17,$E9,$00,$EC,$02,$20   ;048DFB|        |      ;
                       db $10,$00,$E4,$51,$51,$A0,$E3,$22   ;048E03|        |      ;
                       db $E4,$71,$71,$E3,$00,$42,$E9,$71   ;048E0B|        |      ;
                       db $EC,$00,$E2,$90,$90,$E3,$90,$E8   ;048E13|        |      ;
                       db $77,$99,$E8,$17,$E9,$00,$EC,$02   ;048E1B|        |      ;
                       db $20,$10,$00,$E4,$51,$51,$A0,$E3   ;048E23|        |      ;
                       db $22,$E4,$73,$E5,$90,$E4,$02,$EC   ;048E2B|        |      ;
                       db $00,$FE,$FF                       ;048E33|        |      ;
                       dw sndTra00_dejavu_5B                ;048E36|        |048D13;
 
   sndTra01_dejavu_5B: db $D7,$77,$84,$19,$EB,$54,$32,$E9   ;048E38|        |      ;
                       db $B1,$E2,$20,$21,$01,$E8,$25,$E3   ;048E40|        |      ;
                       db $B5,$21,$40,$50,$70,$92,$22,$91   ;048E48|        |      ;
                       db $70,$E2,$06,$E8,$19,$20,$21,$01   ;048E50|        |      ;
                       db $E8,$25,$E3,$B5,$21,$40,$50,$70   ;048E58|        |      ;
                       db $92,$22,$91,$E8,$45,$77,$E8,$1A   ;048E60|        |      ;
                       db $FB,$C1,$E2,$22,$92,$80,$90,$80   ;048E68|        |      ;
                       db $E8,$7A,$54,$E8,$1A,$91,$90,$81   ;048E70|        |      ;
                       db $80,$71,$91,$90,$81,$80,$71,$E8   ;048E78|        |      ;
                       db $1A,$FE,$02,$D7,$77,$83,$15,$E9   ;048E80|        |      ;
                       db $B1,$E2,$12,$42,$A1,$92,$52,$21   ;048E88|        |      ;
                       db $12,$42,$A1,$92,$20,$F4,$91,$20   ;048E90|        |      ;
                       db $90,$F0,$12,$42,$A1,$92,$52,$21   ;048E98|        |      ;
                       db $42,$72,$A1,$92,$B2,$E1,$11,$E9   ;048EA0|        |      ;
                       db $00,$D7,$78,$84,$17,$E9,$B1,$E1   ;048EA8|        |      ;
                       db $20,$20,$E2,$20,$E8,$77,$2C,$E8   ;048EB0|        |      ;
                       db $18,$E9,$00,$E4,$A1,$A1,$E3,$20   ;048EB8|        |      ;
                       db $52,$01,$01,$40,$72,$E9,$B1,$E8   ;048EC0|        |      ;
                       db $17,$E1,$20,$20,$E2,$20,$E8,$77   ;048EC8|        |      ;
                       db $2C,$E9,$00,$E8,$18,$E4,$A1,$A1   ;048ED0|        |      ;
                       db $E3,$20,$52,$03,$E4,$90,$E3,$02   ;048ED8|        |      ;
                       db $FE,$FF                           ;048EE0|        |      ;
                       dw sndTra01_dejavu_5B                ;048EE2|        |048E38;
 
   sndTra02_dejavu_5B: db $D7,$10,$FB,$E4,$21,$20,$20,$21   ;048EE4|        |      ;
                       db $20,$20,$21,$20,$20,$F0,$20,$F0   ;048EEC|        |      ;
                       db $E3,$00,$E5,$A1,$A0,$A0,$F3,$E4   ;048EF4|        |      ;
                       db $01,$F1,$00,$00,$00,$00,$21,$20   ;048EFC|        |      ;
                       db $20,$21,$20,$20,$21,$20,$20,$F0   ;048F04|        |      ;
                       db $20,$F0,$E3,$00,$E5,$A1,$A0,$A0   ;048F0C|        |      ;
                       db $F1,$E4,$A0,$B0,$E3,$00,$00,$00   ;048F14|        |      ;
                       db $00,$E4,$03,$FB,$D7,$10,$E3,$21   ;048F1C|        |      ;
                       db $E4,$20,$20,$20,$21,$20,$21,$20   ;048F24|        |      ;
                       db $E4,$20,$F0,$20,$E3,$20,$00,$E4   ;048F2C|        |      ;
                       db $A1,$A0,$A0,$F0,$A1,$A0,$E5,$A0   ;048F34|        |      ;
                       db $E4,$A0,$D7,$00,$E3,$90,$A0,$90   ;048F3C|        |      ;
                       db $A0,$90,$A0,$FE,$02,$D7,$20,$E4   ;048F44|        |      ;
                       db $17,$27,$47,$54,$D7,$10,$E5,$90   ;048F4C|        |      ;
                       db $E4,$20,$50,$D7,$20,$77,$57,$D7   ;048F54|        |      ;
                       db $10,$72,$72,$71,$42,$72,$91,$E3   ;048F5C|        |      ;
                       db $21,$20,$E4,$20,$20,$E3,$20,$01   ;048F64|        |      ;
                       db $21,$C5,$E4,$A1,$A1,$C3,$E3,$01   ;048F6C|        |      ;
                       db $01,$C3,$21,$20,$E4,$20,$20,$E3   ;048F74|        |      ;
                       db $20,$01,$21,$C5,$E4,$A1,$A1,$C3   ;048F7C|        |      ;
                       db $E3,$03,$E5,$90,$E4,$02,$FE,$FF   ;048F84|        |      ;
                       dw sndTra02_dejavu_5B                ;048F8C|        |048EE4;
 
   sndTra05_dejavu_5B: db $D7,$FB,$B1,$B0,$B0,$41,$10,$B0   ;048F8E|        |      ;
                       db $B1,$B0,$B0,$40,$B0,$B0,$B0,$B1   ;048F96|        |      ;
                       db $B0,$B0,$41,$10,$10,$B1,$40,$B0   ;048F9E|        |      ;
                       db $40,$40,$40,$10,$FE,$02,$FB,$B1   ;048FA6|        |      ;
                       db $B0,$B0,$40,$10,$10,$10,$B1,$B0   ;048FAE|        |      ;
                       db $B0,$40,$B0,$B0,$B0,$B1,$B0,$B0   ;048FB6|        |      ;
                       db $40,$B0,$10,$B0,$B1,$41,$41,$40   ;048FBE|        |      ;
                       db $40,$FE,$02,$FB,$B1,$B0,$B0,$40   ;048FC6|        |      ;
                       db $10,$10,$10,$B1,$B0,$B0,$40,$B0   ;048FCE|        |      ;
                       db $B0,$B0,$FE,$03,$B1,$B0,$B0,$B0   ;048FD6|        |      ;
                       db $B0,$10,$B0,$D1,$42,$43,$D7,$40   ;048FDE|        |      ;
                       db $40,$B0,$B0,$B0,$B0,$B0,$B1,$B0   ;048FE6|        |      ;
                       db $B0,$40,$40,$10,$B0,$B1,$B0,$B0   ;048FEE|        |      ;
                       db $41,$10,$10,$FB,$B1,$B1,$40,$40   ;048FF6|        |      ;
                       db $10,$10,$FE,$02,$B1,$B0,$B0,$40   ;048FFE|        |      ;
                       db $40,$10,$B0,$B1,$D1,$14,$B3,$B4   ;049006|        |      ;
                       db $D7,$41,$10,$10,$B1,$B0,$B0,$40   ;04900E|        |      ;
                       db $40,$10,$B0,$B1,$11,$D1,$B0,$25   ;049016|        |      ;
                       db $B0,$25,$D7,$C1,$FE,$FF           ;04901E|        |      ;
                       dw sndTra05_dejavu_5B                ;049024|        |048F8E;
 
   sndTra00_riddle_5C: db $D1,$77,$85,$19,$EB,$50,$43,$E9   ;049026|        |      ;
                       db $B1,$E4,$74,$74,$73,$D7,$78,$84   ;04902E|        |      ;
                       db $43,$7D,$D1,$78,$85,$19,$54,$54   ;049036|        |      ;
                       db $53,$D7,$78,$84,$43,$5D,$D1,$78   ;04903E|        |      ;
                       db $85,$19,$34,$34,$33,$D7,$78,$84   ;049046|        |      ;
                       db $43,$3D,$D1,$78,$85,$19,$54,$54   ;04904E|        |      ;
                       db $55,$D7,$78,$84,$64,$E6,$0C,$5D   ;049056|        |      ;
                       db $EB,$00,$E9,$00                   ;04905E|        |      ;
 
         MUSIC_049062: db $D4,$35,$83,$18,$EC,$01,$FB,$E4   ;049062|        |      ;
                       db $00,$30,$70,$E3,$00,$30,$70,$E2   ;04906A|        |      ;
                       db $00,$30,$70,$E1,$00,$30,$70,$E0   ;049072|        |      ;
                       db $00,$E1,$70,$30,$00,$E2,$70,$30   ;04907A|        |      ;
                       db $00,$E3,$70,$30,$00,$E4,$70,$30   ;049082|        |      ;
                       db $FE,$02,$FB,$20,$90,$E3,$00,$20   ;04908A|        |      ;
                       db $60,$90,$E2,$00,$20,$60,$90,$E1   ;049092|        |      ;
                       db $00,$20,$60,$20,$00,$E2,$90,$60   ;04909A|        |      ;
                       db $20,$00,$E3,$90,$60,$20,$00,$E4   ;0490A2|        |      ;
                       db $90,$20,$90,$E3,$00,$20,$60,$90   ;0490AA|        |      ;
                       db $E2,$00,$20,$60,$90,$E1,$00,$20   ;0490B2|        |      ;
                       db $60,$20,$00,$E2,$90,$60,$20,$00   ;0490BA|        |      ;
                       db $E3,$90,$60,$20,$E2,$00,$E3,$90   ;0490C2|        |      ;
                       db $FB,$E5,$70,$E4,$20,$50,$70,$B0   ;0490CA|        |      ;
                       db $E3,$20,$50,$70,$B0,$E2,$20,$50   ;0490D2|        |      ;
                       db $70,$B0,$70,$50,$20,$E3,$B0,$70   ;0490DA|        |      ;
                       db $50,$20,$E4,$B0,$70,$50,$E5,$B0   ;0490E2|        |      ;
                       db $70,$E4,$20,$50,$B0,$E3,$20,$50   ;0490EA|        |      ;
                       db $B0,$E2,$20,$70,$B0,$E1,$20,$50   ;0490F2|        |      ;
                       db $70,$50,$20,$E2,$B0,$70,$50,$20   ;0490FA|        |      ;
                       db $E3,$B0,$70,$50,$20,$E4,$70,$00   ;049102|        |      ;
                       db $70,$E3,$00,$30,$70,$E2,$00,$30   ;04910A|        |      ;
                       db $70,$E1,$00,$30,$70,$E0,$00,$30   ;049112|        |      ;
                       db $00,$E1,$70,$30,$00,$E2,$70,$30   ;04911A|        |      ;
                       db $00,$E3,$70,$30,$00,$E4,$70,$20   ;049122|        |      ;
                       db $90,$E3,$00,$20,$60,$90,$E2,$00   ;04912A|        |      ;
                       db $20,$50,$90,$E1,$00,$20,$E5,$70   ;049132|        |      ;
                       db $E4,$20,$50,$70,$B0,$E3,$20,$50   ;04913A|        |      ;
                       db $60,$B0,$E2,$20,$50,$70,$EC,$00   ;049142|        |      ;
                       db $D6,$70,$06,$19,$ED,$03,$E5,$82   ;04914A|        |      ;
                       db $E4,$02,$31,$72,$52,$31,$22,$32   ;049152|        |      ;
                       db $51,$C0,$E5,$A2,$E4,$01,$21,$ED   ;04915A|        |      ;
                       db $00,$D6,$76,$83,$19,$E3,$02,$22   ;049162|        |      ;
                       db $31,$A2,$82,$71,$52,$82,$EC,$02   ;04916A|        |      ;
                       db $E2,$01,$01,$E3,$B1,$91,$B1,$EC   ;049172|        |      ;
                       db $00,$D6,$75,$83,$12,$E9,$B1,$E2   ;04917A|        |      ;
                       db $30,$20,$00,$30,$20,$00,$E3,$B0   ;049182|        |      ;
                       db $E2,$20,$00,$E3,$B0,$70,$B0,$E2   ;04918A|        |      ;
                       db $00,$40,$50,$70,$80,$70,$50,$80   ;049192|        |      ;
                       db $70,$50,$40,$70,$50,$40,$00,$40   ;04919A|        |      ;
                       db $60,$90,$B0,$E1,$00,$E9,$00,$D1   ;0491A2|        |      ;
                       db $B6,$82,$00,$E0,$74,$D1,$B4,$80   ;0491AA|        |      ;
                       db $00,$60,$50,$40,$30,$20,$10,$00   ;0491B2|        |      ;
                       db $C1,$F2,$E0,$74,$60,$50,$40,$30   ;0491BA|        |      ;
                       db $20,$10,$00,$C1,$F3,$74,$60,$50   ;0491C2|        |      ;
                       db $40,$30,$20,$10,$00,$C1,$F4,$74   ;0491CA|        |      ;
                       db $60,$50,$40,$30,$20,$10,$00,$C1   ;0491D2|        |      ;
                       db $74,$60,$50,$40,$30,$20,$10,$00   ;0491DA|        |      ;
                       db $C1,$CF,$C9,$ED,$00,$D6,$37,$84   ;0491E2|        |      ;
                       db $00,$E3,$22,$D1,$31,$80,$00,$10   ;0491EA|        |      ;
                       db $00,$E4,$B0,$A0,$90,$80,$D6,$37   ;0491F2|        |      ;
                       db $84,$00,$E3,$32,$D1,$31,$80,$00   ;0491FA|        |      ;
                       db $20,$10,$00,$E4,$B0,$A0,$90,$D6   ;049202|        |      ;
                       db $37,$84,$00,$E3,$42,$D1,$31,$80   ;04920A|        |      ;
                       db $00,$30,$20,$10,$00,$E4,$B0,$A0   ;049212|        |      ;
                       db $D6,$37,$84,$00,$E3,$52,$D1,$31   ;04921A|        |      ;
                       db $80,$00,$40,$30,$20,$10,$00,$E4   ;049222|        |      ;
                       db $B0,$FE,$FF                       ;04922A|        |      ;
                       dw MUSIC_049062                      ;04922D|        |049062;
 
   sndTra01_riddle_5C: db $D7,$37,$86,$19,$EC,$03,$E9,$75   ;04922F|        |      ;
                       db $FB,$E2,$30,$E3,$70,$E2,$00,$20   ;049237|        |      ;
                       db $FE,$03,$30,$E3,$70,$E2,$00,$30   ;04923F|        |      ;
                       db $FB,$E2,$20,$E3,$50,$A0,$E2,$00   ;049247|        |      ;
                       db $FE,$03,$20,$E3,$50,$A0,$E2,$20   ;04924F|        |      ;
                       db $FB,$E2,$00,$E3,$30,$80,$A0,$FE   ;049257|        |      ;
                       db $03,$E2,$00,$E3,$30,$80,$E2,$00   ;04925F|        |      ;
                       db $E9,$71,$EC,$00,$E7,$84,$E8,$42   ;049267|        |      ;
                       db $E6,$08,$21,$E6,$09,$E3,$A1,$E6   ;04926F|        |      ;
                       db $0A,$51,$E6,$0B,$31,$EB,$50,$32   ;049277|        |      ;
                       db $E6,$0C,$28,$E9,$00               ;04927F|        |      ;
 
         MUSIC_049284: db $D6,$78,$84,$34,$EB,$50,$41,$E3   ;049284|        |      ;
                       db $30,$20,$33,$70,$60,$72,$E2,$01   ;04928C|        |      ;
                       db $E3,$B0,$E2,$01,$30,$20,$37,$E3   ;049294|        |      ;
                       db $71,$E2,$01,$31,$72,$68,$E1,$02   ;04929C|        |      ;
                       db $E6,$11,$E8,$75,$E2,$65,$E6,$06   ;0492A4|        |      ;
                       db $E8,$34,$E3,$50,$40,$53,$B0,$90   ;0492AC|        |      ;
                       db $B2,$E2,$21,$00,$21,$50,$40,$56   ;0492B4|        |      ;
                       db $E3,$80,$B0,$E2,$20,$50,$80,$70   ;0492BC|        |      ;
                       db $50,$3B,$53,$66,$78,$E8,$19,$E3   ;0492C4|        |      ;
                       db $82,$E2,$02,$31,$72,$52,$31,$22   ;0492CC|        |      ;
                       db $32,$51,$C0,$E3,$A2,$E2,$01,$21   ;0492D4|        |      ;
                       db $E3,$82,$A2,$E2,$01,$72,$52,$31   ;0492DC|        |      ;
                       db $EB,$50,$31,$E8,$58,$24,$30,$50   ;0492E4|        |      ;
                       db $60,$E8,$45,$77,$EB,$00,$D6,$76   ;0492EC|        |      ;
                       db $82,$18,$E2,$70,$50,$30,$70,$50   ;0492F4|        |      ;
                       db $30,$20,$50,$30,$20,$00,$20,$40   ;0492FC|        |      ;
                       db $70,$80,$A0,$E1,$00,$E2,$A0,$80   ;049304|        |      ;
                       db $E1,$00,$E2,$A0,$80,$70,$A0,$80   ;04930C|        |      ;
                       db $70,$50,$70,$90,$E1,$00,$20,$30   ;049314|        |      ;
                       db $D6,$78,$84,$18,$EC,$02,$E1,$70   ;04931C|        |      ;
                       db $20,$00,$E2,$70,$20,$00,$E3,$70   ;049324|        |      ;
                       db $20,$00,$E4,$70,$20,$00,$E5,$70   ;04932C|        |      ;
                       db $E4,$00,$20,$50,$EC,$00,$D6,$38   ;049334|        |      ;
                       db $84,$00,$E3,$B2,$D1,$32,$80,$00   ;04933C|        |      ;
                       db $A0,$90,$80,$F1,$70,$60,$50,$D6   ;049344|        |      ;
                       db $38,$84,$00,$E2,$02,$D1,$32,$80   ;04934C|        |      ;
                       db $00,$E3,$B0,$A0,$90,$F1,$80,$70   ;049354|        |      ;
                       db $60,$D6,$38,$84,$00,$E2,$12,$D1   ;04935C|        |      ;
                       db $32,$80,$00,$00,$E3,$B0,$A0,$F1   ;049364|        |      ;
                       db $90,$80,$70,$D6,$38,$84,$00,$E2   ;04936C|        |      ;
                       db $22,$D1,$31,$80,$00,$10,$00,$E3   ;049374|        |      ;
                       db $B0,$F1,$A0,$90,$80,$FE,$FF       ;04937C|        |      ;
                       dw MUSIC_049284                      ;049383|        |049284;
 
   sndTra02_riddle_5C: db $D7,$00,$E3,$0E,$C0,$0E,$C0,$0E   ;049385|        |      ;
                       db $C0,$E6,$17,$05,$C1               ;04938D|        |      ;
 
         MUSIC_049392: db $D3,$06,$E3,$03,$03,$05,$D3,$05   ;049392|        |      ;
                       db $03,$03,$01,$03,$D3,$06,$E4,$73   ;04939A|        |      ;
                       db $E3,$03,$03,$05,$D3,$05,$03,$03   ;0493A2|        |      ;
                       db $01,$03,$D3,$06,$33,$23,$23,$25   ;0493AA|        |      ;
                       db $D3,$05,$23,$23,$21,$23,$D3,$06   ;0493B2|        |      ;
                       db $E4,$93,$E3,$23,$23,$25,$D3,$05   ;0493BA|        |      ;
                       db $23,$21,$41,$21,$51,$21,$61,$21   ;0493C2|        |      ;
                       db $D6,$0B,$E4,$71,$71,$72,$71,$71   ;0493CA|        |      ;
                       db $70,$71,$E3,$21,$E4,$71,$71,$72   ;0493D2|        |      ;
                       db $71,$70,$90,$70,$A0,$70,$B0,$70   ;0493DA|        |      ;
                       db $E3,$01,$01,$02,$01,$01,$00,$00   ;0493E2|        |      ;
                       db $30,$70,$00,$21,$21,$21,$E4,$90   ;0493EA|        |      ;
                       db $71,$D6,$0D,$E3,$70,$50,$30,$20   ;0493F2|        |      ;
                       db $00,$E4,$B0,$70,$D6,$0B,$E5,$82   ;0493FA|        |      ;
                       db $E4,$02,$31,$72,$52,$31,$22,$32   ;049402|        |      ;
                       db $51,$C0,$E5,$A2,$E4,$01,$21,$E4   ;04940A|        |      ;
                       db $82,$A2,$E3,$01,$72,$52,$31,$22   ;049412|        |      ;
                       db $22,$21,$D6,$0E,$E4,$70,$90,$B0   ;04941A|        |      ;
                       db $E3,$00,$20,$30,$50,$70,$D3,$00   ;049422|        |      ;
                       db $E3,$06,$C0,$E4,$A6,$C0,$86,$C0   ;04942A|        |      ;
                       db $76,$C0,$56,$C0,$46,$C0,$56,$C0   ;049432|        |      ;
                       db $66,$C0,$D6,$10,$E4,$70,$70,$70   ;04943A|        |      ;
                       db $70,$F1,$70,$71,$F0,$70,$70,$F1   ;049442|        |      ;
                       db $70,$F0,$D6,$00,$72,$D1,$00,$60   ;04944A|        |      ;
                       db $50,$40,$30,$C1,$D6,$00,$92,$D1   ;049452|        |      ;
                       db $00,$80,$70,$60,$50,$C1,$D6,$00   ;04945A|        |      ;
                       db $A2,$D1,$00,$90,$80,$70,$60,$C1   ;049462|        |      ;
                       db $D6,$00,$B2,$D1,$00,$A0,$90,$80   ;04946A|        |      ;
                       db $70,$C1,$FE,$FF                   ;049472|        |      ;
                       dw MUSIC_049392                      ;049476|        |049392;
 
   sndTra05_riddle_5C: db $D1,$FB,$B0,$13,$14,$13,$D7,$21   ;049478|        |      ;
                       db $13,$13,$13,$D1,$FE,$03,$B0,$13   ;049480|        |      ;
                       db $14,$15,$D9,$21,$DA,$11,$DB,$C1   ;049488|        |      ;
                       db $DC,$14,$23                       ;049490|        |      ;
 
         MUSIC_049493: db $D1,$FB,$B0,$1A,$B0,$1A,$B0,$1A   ;049493|        |      ;
                       db $15,$B5,$15,$B5,$15,$B5,$B0,$1A   ;04949B|        |      ;
                       db $AB,$FE,$04,$FB,$B0,$1A,$B0,$1A   ;0494A3|        |      ;
                       db $B0,$1A,$15,$B5,$15,$B5,$15,$B5   ;0494AB|        |      ;
                       db $B0,$1A,$AB,$FE,$03,$B0,$1A,$B0   ;0494B3|        |      ;
                       db $1A,$B0,$1A,$15,$B5,$15,$B5,$15   ;0494BB|        |      ;
                       db $B5,$B0,$1A,$A5,$A5,$FB,$B0,$1A   ;0494C3|        |      ;
                       db $15,$15,$FE,$0B,$A5,$B5,$A5,$A5   ;0494CB|        |      ;
                       db $AB,$15,$15,$B5,$A5,$A5,$A5,$B5   ;0494D3|        |      ;
                       db $A5,$A5,$A5,$A5,$A5,$A5,$A5,$FB   ;0494DB|        |      ;
                       db $A0,$2A,$CB,$FE,$02,$A0,$2A,$B5   ;0494E3|        |      ;
                       db $B5,$A0,$24,$B5,$A5,$A5,$A0,$2A   ;0494EB|        |      ;
                       db $CB,$FB,$A0,$2A,$B5,$B5,$FE,$02   ;0494F3|        |      ;
                       db $A0,$24,$A5,$A5,$A5,$B0,$24,$B5   ;0494FB|        |      ;
                       db $B5,$B5,$AB,$B5,$B5,$15,$B5,$B5   ;049503|        |      ;
                       db $B5,$A5,$B5,$A5,$A5,$A0,$2A,$CB   ;04950B|        |      ;
                       db $A0,$2A,$CB,$B0,$2A,$A5,$A5,$A5   ;049513|        |      ;
                       db $A5,$A5,$A5,$FE,$FF               ;04951B|        |      ;
                       dw MUSIC_049493                      ;049520|        |049493;
 
 sndTra00_overture_5E: db $D1,$39,$84,$12,$E3,$59,$D1,$34   ;049522|        |      ;
                       db $80,$00,$40,$30,$20,$F1,$10,$00   ;04952A|        |      ;
                       db $E4,$B0,$A0,$F2,$90,$80,$70,$E9   ;049532|        |      ;
                       db $B0,$F2,$E2,$29,$10,$00,$E3,$F2   ;04953A|        |      ;
                       db $B0,$A0,$F3,$90,$80,$70,$60,$50   ;049542|        |      ;
                       db $40,$D4,$B1,$80,$00,$ED,$01,$E3   ;04954A|        |      ;
                       db $50,$60,$70,$80,$90,$A0,$B0,$E2   ;049552|        |      ;
                       db $00,$10,$2F,$2F,$23,$DA,$36,$83   ;04955A|        |      ;
                       db $17,$EC,$01,$E9,$71,$E3,$90,$50   ;049562|        |      ;
                       db $90,$FB,$80,$40,$FE,$09,$80,$90   ;04956A|        |      ;
                       db $50,$90,$80,$40,$80,$70,$30,$70   ;049572|        |      ;
                       db $FB,$50,$20,$FE,$06,$50,$E2,$50   ;04957A|        |      ;
                       db $00,$50,$FB,$E2,$40,$E3,$B0,$FE   ;049582|        |      ;
                       db $09,$E2,$40,$50,$00,$50,$40,$E3   ;04958A|        |      ;
                       db $B0,$E2,$40,$30,$E3,$A0,$E2,$30   ;049592|        |      ;
                       db $FB,$E2,$20,$E3,$90,$FE,$06,$E2   ;04959A|        |      ;
                       db $20,$EC,$00,$E9,$00,$D1,$39,$84   ;0495A2|        |      ;
                       db $12,$E3,$49,$D1,$34,$80,$00,$30   ;0495AA|        |      ;
                       db $20,$10,$F1,$00,$E4,$B0,$A0,$90   ;0495B2|        |      ;
                       db $F2,$80,$70,$60,$E9,$B0,$F2,$E2   ;0495BA|        |      ;
                       db $29,$10,$00,$E3,$F2,$B0,$A0,$F3   ;0495C2|        |      ;
                       db $90,$80,$70,$60,$50,$40,$D4,$B1   ;0495CA|        |      ;
                       db $80,$00,$ED,$01,$E3,$50,$60,$70   ;0495D2|        |      ;
                       db $80,$90,$A0,$B0,$E2,$00,$10,$2F   ;0495DA|        |      ;
                       db $2F,$23,$DA,$77,$84,$18,$EC,$01   ;0495E2|        |      ;
                       db $E9,$78,$E3,$90,$E2,$20,$50,$90   ;0495EA|        |      ;
                       db $DA,$36,$83,$17,$E9,$71,$B0,$70   ;0495F2|        |      ;
                       db $B0,$FB,$90,$50,$FE,$07,$90,$B0   ;0495FA|        |      ;
                       db $70,$B0,$90,$50,$90,$90,$40,$90   ;049602|        |      ;
                       db $FB,$70,$20,$FE,$06,$70,$E3,$90   ;04960A|        |      ;
                       db $E2,$20,$50,$90,$E1,$20,$E2,$B0   ;049612|        |      ;
                       db $E1,$20,$FB,$E1,$20,$E2,$90,$FE   ;04961A|        |      ;
                       db $07,$E1,$20,$00,$E2,$70,$E1,$00   ;049622|        |      ;
                       db $00,$E2,$60,$E1,$00,$E2,$00,$E3   ;04962A|        |      ;
                       db $70,$E2,$00,$FB,$E2,$00,$E3,$60   ;049632|        |      ;
                       db $FE,$06,$E2,$00,$E3,$90,$50,$90   ;04963A|        |      ;
                       db $50,$20,$50,$80,$40,$80,$B0,$80   ;049642|        |      ;
                       db $B0,$90,$50,$FB,$E2,$00,$E3,$90   ;04964A|        |      ;
                       db $FE,$04,$E3,$B0,$70,$B0,$E2,$20   ;049652|        |      ;
                       db $F1,$E9,$00,$E9,$B0,$E3,$70,$B0   ;04965A|        |      ;
                       db $E2,$20,$70,$B0,$E1,$20,$70,$F0   ;049662|        |      ;
                       db $E9,$30,$E9,$71,$E2,$20,$E3,$A0   ;04966A|        |      ;
                       db $E2,$20,$50,$20,$50,$40,$00,$40   ;049672|        |      ;
                       db $70,$40,$E2,$90,$50,$90,$50,$20   ;04967A|        |      ;
                       db $50,$80,$40,$80,$B0,$80,$B0,$90   ;049682|        |      ;
                       db $50,$E1,$00,$E9,$B0,$E9,$00,$E2   ;04968A|        |      ;
                       db $50,$90,$E1,$00,$50,$90,$E0,$00   ;049692|        |      ;
                       db $50,$E9,$30,$E9,$71,$E3,$B0,$E2   ;04969A|        |      ;
                       db $40,$E3,$B0,$E2,$20,$E3,$B0,$E2   ;0496A2|        |      ;
                       db $40,$10,$E2,$90,$10,$40,$10,$90   ;0496AA|        |      ;
                       db $20,$A0,$20,$50,$20,$A0,$40,$90   ;0496B2|        |      ;
                       db $70,$90,$50,$90,$40,$90,$20,$90   ;0496BA|        |      ;
                       db $70,$40,$70,$40,$EC,$00,$E9,$00   ;0496C2|        |      ;
                       db $D1,$39,$84,$00,$E2,$49,$D1,$34   ;0496CA|        |      ;
                       db $80,$00,$30,$20,$10,$F1,$00,$E3   ;0496D2|        |      ;
                       db $B0,$A0,$F2,$90,$80,$70,$60,$DA   ;0496DA|        |      ;
                       db $70,$06,$18,$E9,$B1,$ED,$03,$E5   ;0496E2|        |      ;
                       db $91,$91,$ED,$00,$E9,$00,$D1,$39   ;0496EA|        |      ;
                       db $84,$00,$E2,$49,$D1,$34,$80,$00   ;0496F2|        |      ;
                       db $30,$20,$10,$F1,$00,$E3,$B0,$A0   ;0496FA|        |      ;
                       db $F2,$90,$80,$70,$60,$DA,$70,$06   ;049702|        |      ;
                       db $18,$ED,$03,$E9,$B1,$E5,$91,$ED   ;04970A|        |      ;
                       db $00,$E9,$00,$D1,$39,$84,$00,$E2   ;049712|        |      ;
                       db $49,$D1,$34,$80,$00,$30,$20,$10   ;04971A|        |      ;
                       db $F1,$00,$E3,$B0,$A0,$F2,$90,$80   ;049722|        |      ;
                       db $70,$60,$D1,$39,$84,$00,$E2,$49   ;04972A|        |      ;
                       db $D1,$34,$80,$00,$30,$20,$10,$F1   ;049732|        |      ;
                       db $00,$E3,$B0,$F2,$A0,$90,$F3,$80   ;04973A|        |      ;
                       db $70,$F4,$60,$D1,$39,$84,$00,$E3   ;049742|        |      ;
                       db $79,$D1,$34,$80,$00,$60,$50,$40   ;04974A|        |      ;
                       db $F1,$30,$20,$F2,$10,$00,$F3,$E4   ;049752|        |      ;
                       db $B0,$A0,$F4,$90,$D1,$39,$84,$00   ;04975A|        |      ;
                       db $E2,$49,$D1,$34,$80,$00,$30,$20   ;049762|        |      ;
                       db $10,$F1,$00,$E3,$B0,$F2,$A0,$90   ;04976A|        |      ;
                       db $F3,$80,$70,$F4,$60,$D1,$39,$84   ;049772|        |      ;
                       db $00,$E2,$29,$D1,$34,$80,$00,$10   ;04977A|        |      ;
                       db $00,$E3,$B0,$F1,$A0,$90,$F2,$80   ;049782|        |      ;
                       db $70,$F3,$60,$50,$F4,$40,$D1,$39   ;04978A|        |      ;
                       db $84,$00,$E2,$39,$D1,$34,$80,$00   ;049792|        |      ;
                       db $20,$10,$00,$F1,$E3,$B0,$A0,$F2   ;04979A|        |      ;
                       db $90,$80,$F3,$70,$60,$F4,$50,$D1   ;0497A2|        |      ;
                       db $39,$84,$00,$E2,$49,$D1,$34,$80   ;0497AA|        |      ;
                       db $00,$30,$20,$10,$F1,$00,$E3,$B0   ;0497B2|        |      ;
                       db $F2,$A0,$90,$F3,$80,$70,$F4,$60   ;0497BA|        |      ;
                       db $FE,$FF                           ;0497C2|        |      ;
                       dw sndTra00_overture_5E              ;0497C4|        |049522;
 
 sndTra01_overture_5E: db $D1,$39,$84,$00,$E3,$99,$D1,$34   ;0497C6|        |      ;
                       db $80,$00,$80,$70,$60,$F1,$50,$40   ;0497CE|        |      ;
                       db $30,$20,$F2,$10,$00,$E4,$B0,$D4   ;0497D6|        |      ;
                       db $B2,$80,$00,$E3,$20,$30,$40,$50   ;0497DE|        |      ;
                       db $60,$70,$80,$90,$A0,$B0,$E2,$00   ;0497E6|        |      ;
                       db $10,$2F,$2F,$22,$12,$DA,$70,$0B   ;0497EE|        |      ;
                       db $12,$EB,$50,$53,$E2,$02,$E6,$13   ;0497F6|        |      ;
                       db $E3,$B9,$E6,$0A,$E2,$02,$E3,$B2   ;0497FE|        |      ;
                       db $A2,$EB,$56,$51,$E7,$0C,$9C,$EB   ;049806|        |      ;
                       db $50,$51,$E7,$0B,$E2,$92,$E6,$13   ;04980E|        |      ;
                       db $89,$E6,$0A,$EB,$50,$52,$92,$82   ;049816|        |      ;
                       db $72,$E7,$0C,$6C,$EB,$00,$D1,$39   ;04981E|        |      ;
                       db $84,$00,$E3,$99,$D1,$34,$80,$00   ;049826|        |      ;
                       db $80,$70,$60,$F1,$50,$40,$30,$20   ;04982E|        |      ;
                       db $F2,$10,$00,$E4,$B0,$D4,$B2,$80   ;049836|        |      ;
                       db $00,$E3,$20,$30,$40,$50,$60,$70   ;04983E|        |      ;
                       db $80,$90,$A0,$B0,$E2,$00,$10,$2F   ;049846|        |      ;
                       db $2F,$25,$DA,$78,$84,$12,$EB,$50   ;04984E|        |      ;
                       db $51,$E2,$20,$50,$90,$E1,$20,$DA   ;049856|        |      ;
                       db $70,$0C,$12,$42,$2E,$42,$22,$02   ;04985E|        |      ;
                       db $E2,$BC,$DA,$78,$84,$12,$20,$50   ;049866|        |      ;
                       db $90,$E1,$20,$DA,$70,$0C,$12,$72   ;04986E|        |      ;
                       db $5E,$42,$42,$E2,$42,$4C,$DA,$77   ;049876|        |      ;
                       db $84,$12,$EB,$50,$42,$E2,$22,$E3   ;04987E|        |      ;
                       db $92,$B2,$E2,$42,$01,$57,$22,$77   ;049886|        |      ;
                       db $52,$A2,$72,$E1,$01,$EB,$50,$51   ;04988E|        |      ;
                       db $E1,$22,$E2,$92,$B2,$E1,$42,$01   ;049896|        |      ;
                       db $57,$E2,$22,$72,$42,$92,$51,$A3   ;04989E|        |      ;
                       db $72,$EB,$50,$41,$E1,$06,$EB,$00   ;0498A6|        |      ;
                       db $00,$00,$00,$00,$D1,$39,$84,$00   ;0498AE|        |      ;
                       db $E2,$99,$D1,$34,$80,$00,$80,$70   ;0498B6|        |      ;
                       db $60,$F1,$50,$40,$30,$20,$F2,$10   ;0498BE|        |      ;
                       db $00,$E3,$B0,$E2,$99,$F3,$80,$70   ;0498C6|        |      ;
                       db $60,$F4,$50,$40,$30,$20,$F5,$10   ;0498CE|        |      ;
                       db $00,$E3,$B0,$E6,$0A,$C1,$D1,$39   ;0498D6|        |      ;
                       db $84,$00,$E2,$99,$D1,$34,$80,$00   ;0498DE|        |      ;
                       db $80,$70,$60,$F1,$50,$40,$30,$20   ;0498E6|        |      ;
                       db $F2,$10,$00,$E3,$B0,$E2,$99,$F3   ;0498EE|        |      ;
                       db $80,$70,$60,$F4,$50,$40,$30,$20   ;0498F6|        |      ;
                       db $F5,$10,$00,$E3,$B0,$D1,$39,$84   ;0498FE|        |      ;
                       db $00,$E2,$99,$D1,$34,$80,$00,$80   ;049906|        |      ;
                       db $70,$60,$F1,$50,$40,$30,$20,$F2   ;04990E|        |      ;
                       db $10,$00,$E3,$B0,$FB,$D1,$39,$84   ;049916|        |      ;
                       db $00,$E1,$19,$D1,$34,$80,$00,$00   ;04991E|        |      ;
                       db $E2,$B0,$A0,$F1,$90,$80,$F2,$70   ;049926|        |      ;
                       db $60,$F3,$50,$40,$F4,$30,$EA,$8C   ;04992E|        |      ;
                       db $FE,$02,$EA,$00,$D1,$39,$84,$00   ;049936|        |      ;
                       db $E2,$99,$D1,$34,$80,$00,$80,$70   ;04993E|        |      ;
                       db $60,$F1,$50,$40,$F2,$30,$20,$F3   ;049946|        |      ;
                       db $10,$00,$F4,$E3,$B0,$D1,$39,$84   ;04994E|        |      ;
                       db $00,$E2,$79,$D1,$34,$80,$00,$60   ;049956|        |      ;
                       db $50,$40,$F1,$30,$20,$F2,$10,$00   ;04995E|        |      ;
                       db $F3,$E3,$B0,$A0,$F4,$90,$D1,$39   ;049966|        |      ;
                       db $84,$00,$E2,$89,$D1,$34,$80,$00   ;04996E|        |      ;
                       db $70,$60,$50,$F1,$40,$30,$F2,$20   ;049976|        |      ;
                       db $10,$F3,$00,$E3,$B0,$F4,$A0,$D1   ;04997E|        |      ;
                       db $39,$84,$00,$E2,$99,$D1,$34,$80   ;049986|        |      ;
                       db $00,$80,$70,$60,$F1,$50,$40,$F2   ;04998E|        |      ;
                       db $30,$20,$F3,$10,$00,$F4,$E3,$B0   ;049996|        |      ;
                       db $FE,$FF                           ;04999E|        |      ;
                       dw sndTra01_overture_5E              ;0499A0|        |0497C6;
 
 sndTra02_overture_5E: db $D1,$00,$E1,$29,$10,$00,$E2,$B0   ;0499A2|        |      ;
                       db $A0,$90,$80,$70,$60,$50,$40,$DA   ;0499AA|        |      ;
                       db $12,$E4,$21,$21,$21,$21,$21,$21   ;0499B2|        |      ;
                       db $21,$21,$21,$21,$E4,$FB,$21,$21   ;0499BA|        |      ;
                       db $21,$21,$21,$21,$21,$21,$21,$21   ;0499C2|        |      ;
                       db $21,$FE,$04,$D1,$00,$E1,$29,$10   ;0499CA|        |      ;
                       db $00,$E2,$B0,$A0,$90,$80,$70,$60   ;0499D2|        |      ;
                       db $50,$40,$DA,$12,$E4,$21,$21,$21   ;0499DA|        |      ;
                       db $21,$21,$21,$21,$21,$21,$21,$E3   ;0499E2|        |      ;
                       db $20,$90,$E2,$20,$50,$E4,$FB,$21   ;0499EA|        |      ;
                       db $FE,$14,$E3,$20,$90,$E2,$20,$50   ;0499F2|        |      ;
                       db $E4,$FB,$21,$FE,$14,$E4,$FB,$21   ;0499FA|        |      ;
                       db $21,$21,$21,$21,$21,$21,$21,$21   ;049A02|        |      ;
                       db $21,$21,$FE,$02,$E4,$21,$21,$21   ;049A0A|        |      ;
                       db $21,$21,$21,$21,$21,$21,$21,$21   ;049A12|        |      ;
                       db $41,$41,$41,$41,$41,$41,$41,$41   ;049A1A|        |      ;
                       db $41,$41,$41,$41,$41,$41,$91,$91   ;049A22|        |      ;
                       db $D1,$00,$E3,$99,$80,$70,$60,$50   ;049A2A|        |      ;
                       db $40,$30,$20,$10,$00,$E4,$B0,$DA   ;049A32|        |      ;
                       db $12,$E5,$91,$91,$D1,$00,$E3,$99   ;049A3A|        |      ;
                       db $80,$70,$60,$50,$40,$30,$20,$10   ;049A42|        |      ;
                       db $00,$E4,$B0,$DA,$12,$E5,$91,$D1   ;049A4A|        |      ;
                       db $00,$E3,$99,$80,$70,$60,$50,$40   ;049A52|        |      ;
                       db $30,$20,$10,$00,$E4,$B0,$DA,$12   ;049A5A|        |      ;
                       db $E3,$91,$E4,$91,$91,$71,$81,$91   ;049A62|        |      ;
                       db $FE,$FF                           ;049A6A|        |      ;
                       dw sndTra02_overture_5E              ;049A6C|        |0499A2;
 
 sndTra05_overture_5E: db $D1,$B0,$28,$19,$B0,$18,$19,$A0   ;049A6E|        |      ;
                       db $28,$19,$B0,$18,$B0,$18,$19,$A0   ;049A76|        |      ;
                       db $28,$19,$B0,$18,$19,$B0,$18,$A0   ;049A7E|        |      ;
                       db $18,$29,$B0,$18,$B0,$18,$19,$A0   ;049A86|        |      ;
                       db $28,$19,$B0,$28,$FB,$B0,$18,$19   ;049A8E|        |      ;
                       db $B0,$18,$19,$A0,$28,$19,$B0,$18   ;049A96|        |      ;
                       db $B0,$18,$19,$A0,$28,$19,$B0,$18   ;049A9E|        |      ;
                       db $19,$B0,$18,$A0,$18,$29,$B0,$18   ;049AA6|        |      ;
                       db $B0,$18,$19,$A0,$28,$19,$B0,$18   ;049AAE|        |      ;
                       db $FE,$04,$B0,$28,$19,$B0,$18,$19   ;049AB6|        |      ;
                       db $A0,$28,$19,$B0,$18,$B0,$18,$19   ;049ABE|        |      ;
                       db $A0,$28,$19,$B0,$18,$19,$B0,$18   ;049AC6|        |      ;
                       db $A0,$18,$29,$B0,$18,$B0,$18,$19   ;049ACE|        |      ;
                       db $A0,$28,$19,$B0,$28,$FB,$B0,$18   ;049AD6|        |      ;
                       db $19,$B0,$18,$19,$A0,$28,$19,$B0   ;049ADE|        |      ;
                       db $18,$B0,$18,$19,$A0,$28,$19,$B0   ;049AE6|        |      ;
                       db $18,$19,$B0,$18,$A0,$18,$29,$B0   ;049AEE|        |      ;
                       db $18,$B0,$18,$19,$A0,$28,$19,$B0   ;049AF6|        |      ;
                       db $18,$FE,$04,$B0,$18,$19,$B0,$18   ;049AFE|        |      ;
                       db $19,$A0,$28,$19,$B0,$18,$B0,$18   ;049B06|        |      ;
                       db $19,$A0,$28,$19,$B0,$18,$19,$B0   ;049B0E|        |      ;
                       db $18,$A0,$18,$29,$B0,$18,$B0,$18   ;049B16|        |      ;
                       db $19,$A0,$28,$19,$B0,$18,$B0,$18   ;049B1E|        |      ;
                       db $19,$B0,$18,$19,$A0,$28,$19,$B0   ;049B26|        |      ;
                       db $18,$B0,$18,$19,$A0,$28,$19,$B0   ;049B2E|        |      ;
                       db $18,$19,$B0,$18,$A0,$18,$29,$B0   ;049B36|        |      ;
                       db $18,$A0,$18,$A0,$18,$A0,$18,$A0   ;049B3E|        |      ;
                       db $18,$A0,$18,$B0,$18,$19,$B0,$18   ;049B46|        |      ;
                       db $19,$A0,$28,$19,$B0,$18,$B0,$18   ;049B4E|        |      ;
                       db $19,$A0,$28,$19,$B0,$18,$19,$B0   ;049B56|        |      ;
                       db $18,$A0,$18,$29,$B0,$18,$B0,$18   ;049B5E|        |      ;
                       db $19,$A0,$28,$19,$B0,$18,$B0,$18   ;049B66|        |      ;
                       db $19,$B0,$18,$19,$A0,$28,$A0,$18   ;049B6E|        |      ;
                       db $B0,$18,$B0,$18,$19,$A0,$28,$A0   ;049B76|        |      ;
                       db $18,$A0,$18,$B0,$18,$B0,$18,$19   ;049B7E|        |      ;
                       db $A0,$28,$A0,$18,$B0,$18,$B0,$18   ;049B86|        |      ;
                       db $19,$A0,$28,$19,$A0,$18,$19,$B0   ;049B8E|        |      ;
                       db $28,$19,$A0,$18,$A0,$18,$A0,$18   ;049B96|        |      ;
                       db $A0,$18,$A0,$18,$A0,$18,$A0,$48   ;049B9E|        |      ;
                       db $C9,$B0,$48,$C9,$A0,$48,$C9,$B0   ;049BA6|        |      ;
                       db $48,$C9,$A0,$48,$C9,$B0,$48,$C9   ;049BAE|        |      ;
                       db $A0,$28,$A0,$28,$B0,$28,$B0,$28   ;049BB6|        |      ;
                       db $B0,$28,$B0,$28,$A0,$18,$A0,$18   ;049BBE|        |      ;
                       db $A0,$18,$A0,$18,$A0,$18,$A0,$18   ;049BC6|        |      ;
                       db $FE,$FF                           ;049BCE|        |      ;
                       dw sndTra05_overture_5E              ;049BD0|        |049A6E;
 
 sndTra00_allClear_64: db $D7,$74,$81,$45,$EB,$66,$01,$ED   ;049BD2|        |      ;
                       db $01,$E3,$41,$90,$E2,$00,$40,$E3   ;049BDA|        |      ;
                       db $70,$B0,$E2,$20,$70,$50,$40,$20   ;049BE2|        |      ;
                       db $00,$40,$20,$00,$E3,$B0,$ED,$00   ;049BEA|        |      ;
                       db $D7,$73,$81,$68,$94,$B0,$E2,$00   ;049BF2|        |      ;
                       db $D7,$70,$22,$24,$E3,$81,$91,$A1   ;049BFA|        |      ;
                       db $B1,$D7,$77,$84,$64,$E2,$40,$E3   ;049C02|        |      ;
                       db $90,$E2,$00,$40,$50,$E3,$90,$E2   ;049C0A|        |      ;
                       db $20,$50,$40,$E3,$90,$E2,$00,$40   ;049C12|        |      ;
                       db $E6,$08,$20,$E3,$50,$A0,$E2,$20   ;049C1A|        |      ;
                       db $E6,$09,$E2,$10,$E3,$B0,$E8,$00   ;049C22|        |      ;
                       db $E2,$1C,$E6,$01,$F7,$15,$FF       ;049C2A|        |      ;
 
 sndTra01_allClear_64: db $D7,$79,$84,$47,$EB,$66,$01,$E3   ;049C31|        |      ;
                       db $40,$90,$E2,$00,$40,$E3,$70,$B0   ;049C39|        |      ;
                       db $E2,$20,$70,$50,$40,$20,$00,$40   ;049C41|        |      ;
                       db $20,$00,$E3,$B0,$E8,$12,$EC,$02   ;049C49|        |      ;
                       db $E3,$94,$D7,$78,$83,$23,$E3,$B0   ;049C51|        |      ;
                       db $E2,$00,$20,$EC,$00,$EB,$00,$D7   ;049C59|        |      ;
                       db $70,$21,$24,$41,$61,$71,$81,$EB   ;049C61|        |      ;
                       db $6E,$51,$E6,$12,$E8,$00,$9D,$E6   ;049C69|        |      ;
                       db $01,$F7,$95,$FF                   ;049C71|        |      ;
 
 sndTra02_allClear_64: db $D7,$13,$E4,$90,$E3,$90,$E4,$90   ;049C75|        |      ;
                       db $E3,$90,$E4,$B0,$E3,$B0,$E4,$B0   ;049C7D|        |      ;
                       db $E3,$B0,$00,$E2,$00,$E3,$00,$E2   ;049C85|        |      ;
                       db $00,$E3,$20,$E2,$20,$E3,$20,$E2   ;049C8D|        |      ;
                       db $20,$FB,$E3,$40,$E2,$40,$FE,$04   ;049C95|        |      ;
                       db $FB,$E4,$40,$E3,$40,$FE,$04,$E4   ;049C9D|        |      ;
                       db $90,$E3,$90,$E4,$90,$E3,$90,$E4   ;049CA5|        |      ;
                       db $20,$E3,$20,$E4,$20,$E3,$20,$E4   ;049CAD|        |      ;
                       db $50,$E3,$50,$E4,$50,$E3,$50,$D8   ;049CB5|        |      ;
                       db $00,$E4,$A0,$E3,$A0,$E4,$A0,$E3   ;049CBD|        |      ;
                       db $A0,$D8,$11,$E4,$90,$90,$D8,$00   ;049CC5|        |      ;
                       db $E4,$9E,$D1,$00,$91,$FF           ;049CCD|        |      ;
 
 sndTra05_allClear_64: db $D1,$FB,$B0,$1C,$16,$16,$FE,$06   ;049CD3|        |      ;
                       db $FB,$B0,$25,$16,$FE,$04,$FB,$B0   ;049CDB|        |      ;
                       db $2C,$16,$16,$FE,$03,$B0,$2C,$18   ;049CE3|        |      ;
                       db $18,$B0,$26,$B0,$26,$B0,$26,$FF   ;049CEB|        |      ;
 
sndTra00_bossFight_5F: db $D6,$76,$81,$10,$E9,$31,$EB,$50   ;049CF3|        |      ;
                       db $32,$E6,$12,$E3,$82,$E6,$01,$78   ;049CFB|        |      ;
                       db $E9,$00,$D1,$73,$80,$00,$61,$51   ;049D03|        |      ;
                       db $41,$31,$F2,$78,$61,$51,$41,$31   ;049D0B|        |      ;
                       db $F3,$78,$61,$51,$41,$C2,$F0,$DA   ;049D13|        |      ;
                       db $76,$81,$00,$E9,$31,$A4,$EB,$00   ;049D1B|        |      ;
                       db $E6,$01,$98,$E9,$00,$D1,$73,$80   ;049D23|        |      ;
                       db $00,$81,$71,$61,$51,$F2,$98,$81   ;049D2B|        |      ;
                       db $71,$61,$51,$F3,$94,$80,$70,$60   ;049D33|        |      ;
                       db $51,$F0,$D3,$76,$81,$00,$EB,$50   ;049D3B|        |      ;
                       db $32,$E9,$31,$E2,$0D,$E6,$01,$E3   ;049D43|        |      ;
                       db $B8,$E9,$00,$D1,$73,$80,$00,$A1   ;049D4B|        |      ;
                       db $91,$81,$71,$F2,$B8,$A1,$91,$81   ;049D53|        |      ;
                       db $71,$61,$F0,$D6,$76,$81,$00,$E9   ;049D5B|        |      ;
                       db $31,$E2,$25,$E6,$01,$18,$E9,$00   ;049D63|        |      ;
                       db $D1,$72,$80,$00,$01,$E3,$B1,$A1   ;049D6B|        |      ;
                       db $91,$F2,$E2,$18,$01,$E3,$B1,$A1   ;049D73|        |      ;
                       db $91,$81,$EB,$00                   ;049D7B|        |      ;
 
         MUSIC_049D7F: db $D6,$70,$07,$00,$E9,$B1,$E3,$FB   ;049D7F|        |      ;
                       db $63,$53,$43,$33,$23,$33,$FE,$04   ;049D87|        |      ;
                       db $D6,$37,$84,$18,$EC,$02,$E9,$38   ;049D8F|        |      ;
                       db $FB,$E4,$B0,$E3,$20,$50,$80,$B0   ;049D97|        |      ;
                       db $E2,$20,$50,$80,$B0,$E1,$20,$50   ;049D9F|        |      ;
                       db $80,$B0,$80,$50,$20,$E2,$B0,$80   ;049DA7|        |      ;
                       db $50,$20,$E3,$B0,$80,$50,$20,$FE   ;049DAF|        |      ;
                       db $02,$00,$30,$60,$90,$E2,$00,$30   ;049DB7|        |      ;
                       db $60,$90,$E1,$00,$30,$60,$90,$E0   ;049DBF|        |      ;
                       db $00,$E1,$90,$60,$30,$00,$E2,$90   ;049DC7|        |      ;
                       db $60,$30,$00,$E3,$90,$60,$30,$60   ;049DCF|        |      ;
                       db $90,$E2,$00,$30,$60,$90,$E1,$00   ;049DD7|        |      ;
                       db $30,$60,$90,$E0,$00,$30,$60,$30   ;049DDF|        |      ;
                       db $00,$E1,$90,$60,$30,$00,$E2,$90   ;049DE7|        |      ;
                       db $60,$30,$00,$E3,$90,$EC,$00,$EA   ;049DEF|        |      ;
                       db $01,$D6,$70,$07,$00,$E9,$B1,$E3   ;049DF7|        |      ;
                       db $FB,$63,$53,$43,$33,$23,$33,$FE   ;049DFF|        |      ;
                       db $04,$EA,$01,$D6,$37,$84,$18,$EC   ;049E07|        |      ;
                       db $02,$E9,$38,$FB,$E2,$B0,$80,$50   ;049E0F|        |      ;
                       db $20,$E3,$B0,$80,$50,$80,$B0,$E2   ;049E17|        |      ;
                       db $20,$50,$80,$B0,$80,$50,$20,$E3   ;049E1F|        |      ;
                       db $B0,$80,$50,$80,$B0,$E2,$20,$50   ;049E27|        |      ;
                       db $B0,$E1,$20,$E2,$B0,$80,$50,$20   ;049E2F|        |      ;
                       db $E3,$B0,$80,$B0,$E2,$20,$50,$80   ;049E37|        |      ;
                       db $B0,$E1,$20,$E2,$B0,$80,$50,$20   ;049E3F|        |      ;
                       db $E3,$B0,$80,$B0,$E2,$20,$50,$80   ;049E47|        |      ;
                       db $B0,$E1,$00,$E2,$90,$60,$30,$00   ;049E4F|        |      ;
                       db $E3,$90,$60,$90,$E2,$00,$30,$60   ;049E57|        |      ;
                       db $90,$E1,$00,$E2,$90,$60,$30,$00   ;049E5F|        |      ;
                       db $E3,$90,$60,$90,$E2,$00,$30,$60   ;049E67|        |      ;
                       db $E1,$00,$30,$00,$E2,$90,$60,$30   ;049E6F|        |      ;
                       db $00,$E3,$90,$E2,$00,$30,$60,$90   ;049E77|        |      ;
                       db $E1,$30,$60,$30,$00,$E2,$90,$60   ;049E7F|        |      ;
                       db $30,$E1,$90,$60,$30,$00,$E2,$90   ;049E87|        |      ;
                       db $60,$EA,$00,$EC,$00,$FE,$FF       ;049E8F|        |      ;
                       dw MUSIC_049D7F                      ;049E96|        |049D7F;
 
sndTra01_bossFight_5F: db $D6,$76,$81,$10,$E9,$31,$EB,$50   ;049E98|        |      ;
                       db $32,$E6,$12,$E2,$52,$E6,$01,$48   ;049EA0|        |      ;
                       db $E9,$00,$D1,$73,$80,$00,$31,$21   ;049EA8|        |      ;
                       db $11,$01,$F2,$48,$31,$21,$11,$01   ;049EB0|        |      ;
                       db $F3,$48,$31,$21,$11,$C2,$F0,$DA   ;049EB8|        |      ;
                       db $76,$81,$00,$E9,$31,$74,$E6,$01   ;049EC0|        |      ;
                       db $68,$E9,$00,$D1,$73,$80,$00,$51   ;049EC8|        |      ;
                       db $41,$31,$21,$F2,$68,$51,$41,$31   ;049ED0|        |      ;
                       db $21,$F3,$64,$50,$40,$30,$21,$F0   ;049ED8|        |      ;
                       db $D3,$76,$81,$00,$E9,$31,$9D,$E6   ;049EE0|        |      ;
                       db $01,$88,$E9,$00,$D1,$73,$80,$00   ;049EE8|        |      ;
                       db $71,$61,$51,$41,$F2,$88,$71,$61   ;049EF0|        |      ;
                       db $51,$41,$31,$F0,$D6,$76,$81,$00   ;049EF8|        |      ;
                       db $E9,$31,$B5,$E6,$01,$A8,$E9,$00   ;049F00|        |      ;
                       db $D1,$72,$80,$00,$91,$81,$71,$61   ;049F08|        |      ;
                       db $F2,$A8,$71,$61,$51,$41,$31,$EB   ;049F10|        |      ;
                       db $00                               ;049F18|        |      ;
 
         MUSIC_049F19: db $D6,$37,$85,$17,$EC,$02,$E2,$FB   ;049F19|        |      ;
                       db $90,$80,$70,$60,$70,$80,$FE,$0E   ;049F21|        |      ;
                       db $90,$80,$70,$60,$50,$40,$30,$20   ;049F29|        |      ;
                       db $10,$00,$E3,$B0,$A0,$EC,$00,$D6   ;049F31|        |      ;
                       db $F7,$82,$00,$EB,$50,$53,$E3,$B2   ;049F39|        |      ;
                       db $D1,$F4,$80,$00,$B1,$E2,$01,$11   ;049F41|        |      ;
                       db $21,$31,$41,$53,$E6,$0A,$E8,$56   ;049F49|        |      ;
                       db $5A,$D6,$F7,$82,$00,$22,$D1,$F4   ;049F51|        |      ;
                       db $80,$00,$21,$31,$41,$51,$61,$71   ;049F59|        |      ;
                       db $83,$E6,$0A,$E8,$56,$8A,$D6,$F7   ;049F61|        |      ;
                       db $82,$00,$02,$D1,$F4,$80,$00,$01   ;049F69|        |      ;
                       db $11,$21,$31,$41,$51,$63,$E6,$0A   ;049F71|        |      ;
                       db $E8,$56,$6A,$D6,$F7,$82,$00,$32   ;049F79|        |      ;
                       db $D1,$F4,$80,$00,$31,$41,$51,$61   ;049F81|        |      ;
                       db $71,$81,$E6,$06,$98,$D6,$F7,$82   ;049F89|        |      ;
                       db $54,$81,$71,$61,$51,$41,$EB,$00   ;049F91|        |      ;
                       db $EA,$01,$D6,$37,$85,$17,$EC,$02   ;049F99|        |      ;
                       db $E2,$FB,$90,$80,$70,$60,$70,$80   ;049FA1|        |      ;
                       db $FE,$0E,$90,$80,$70,$60,$50,$40   ;049FA9|        |      ;
                       db $30,$20,$10,$00,$E3,$B0,$A0,$EC   ;049FB1|        |      ;
                       db $00,$EA,$01,$D6,$F7,$82,$00,$EB   ;049FB9|        |      ;
                       db $50,$53,$E3,$B2,$D1,$F4,$80,$00   ;049FC1|        |      ;
                       db $B1,$E2,$01,$11,$21,$31,$41,$53   ;049FC9|        |      ;
                       db $E6,$0A,$E8,$56,$5A,$D6,$F7,$82   ;049FD1|        |      ;
                       db $00,$22,$D1,$F4,$80,$00,$21,$31   ;049FD9|        |      ;
                       db $41,$51,$61,$71,$83,$E6,$0A,$E8   ;049FE1|        |      ;
                       db $56,$8A,$D6,$F7,$82,$00,$02,$D1   ;049FE9|        |      ;
                       db $F4,$80,$00,$01,$11,$21,$31,$41   ;049FF1|        |      ;
                       db $51,$63,$E6,$0A,$E8,$56,$6A,$D6   ;049FF9|        |      ;
                       db $F7,$82,$00,$32,$D1,$F4,$80,$00   ;04A001|        |      ;
                       db $31,$41,$51,$61,$71,$81,$E6,$06   ;04A009|        |      ;
                       db $9A,$D6,$F7,$82,$54,$81,$91,$81   ;04A011|        |      ;
                       db $91,$EB,$00,$EA,$00,$FE,$FF       ;04A019|        |      ;
                       dw MUSIC_049F19                      ;04A020|        |049F19;
 
sndTra02_bossFight_5F: db $D1,$40,$E6,$1B,$E4,$50,$70,$E6   ;04A022|        |      ;
                       db $1A,$80,$90,$E6,$19,$70,$E6,$18   ;04A02A|        |      ;
                       db $90,$E6,$17,$A0,$E6,$16,$B0,$D1   ;04A032|        |      ;
                       db $38,$E6,$15,$90,$E6,$14,$B0,$D1   ;04A03A|        |      ;
                       db $34,$E6,$13,$E3,$00,$D1,$30,$E6   ;04A042|        |      ;
                       db $12,$10,$E4,$B0,$E3,$00,$10,$20   ;04A04A|        |      ;
 
         MUSIC_04A052: db $D6,$00,$E3,$0B,$E4,$6B,$9B,$E3   ;04A052|        |      ;
                       db $33,$23,$13,$D6,$00,$0B,$E4,$6B   ;04A05A|        |      ;
                       db $9B,$3B,$D6,$20,$E3,$21,$01,$E4   ;04A062|        |      ;
                       db $B1,$91,$85,$91,$B1,$E3,$01,$21   ;04A06A|        |      ;
                       db $41,$51,$41,$21,$01,$E4,$B5,$E3   ;04A072|        |      ;
                       db $11,$21,$41,$51,$21,$31,$11,$01   ;04A07A|        |      ;
                       db $E4,$A1,$95,$A1,$E3,$01,$11,$31   ;04A082|        |      ;
                       db $51,$61,$51,$31,$11,$05,$11,$31   ;04A08A|        |      ;
                       db $51,$61,$31,$EA,$01,$D6,$00,$E3   ;04A092|        |      ;
                       db $0B,$E4,$6B,$9B,$E3,$33,$23,$13   ;04A09A|        |      ;
                       db $D6,$00,$0B,$E4,$6B,$9B,$3B,$EA   ;04A0A2|        |      ;
                       db $01,$D6,$20,$E3,$21,$01,$E4,$B1   ;04A0AA|        |      ;
                       db $91,$85,$91,$B1,$E3,$01,$21,$41   ;04A0B2|        |      ;
                       db $51,$41,$21,$01,$E4,$B5,$E3,$11   ;04A0BA|        |      ;
                       db $21,$41,$51,$21,$31,$11,$01,$E4   ;04A0C2|        |      ;
                       db $A1,$95,$A1,$E3,$01,$11,$31,$51   ;04A0CA|        |      ;
                       db $61,$51,$31,$11,$07,$E4,$B1,$E3   ;04A0D2|        |      ;
                       db $01,$E4,$B1,$E3,$01,$EA,$00,$FE   ;04A0DA|        |      ;
                       db $FF                               ;04A0E2|        |      ;
                       dw MUSIC_04A052                      ;04A0E3|        |04A052;
 
sndTra05_bossFight_5F: db $D1,$B0,$2F,$C9,$D3,$18,$D2,$4C   ;04A0E5|        |      ;
                       db $1C,$D1,$B0,$2F,$C7,$D4,$15,$45   ;04A0ED|        |      ;
                       db $D3,$16,$D1,$B0,$2F,$C3,$D3,$16   ;04A0F5|        |      ;
                       db $45,$15,$D1,$B0,$24,$15,$15,$15   ;04A0FD|        |      ;
                       db $15,$15,$45,$15,$15,$15,$15,$15   ;04A105|        |      ;
 
         MUSIC_04A10D: db $D6,$FB,$D1,$B0,$14,$D6,$C4,$15   ;04A10D|        |      ;
                       db $45,$15,$D1,$B0,$14,$D6,$C4,$15   ;04A115|        |      ;
                       db $41,$41,$C1,$15,$FE,$02,$D6,$FB   ;04A11D|        |      ;
                       db $D1,$B0,$14,$D6,$C4,$15,$45,$15   ;04A125|        |      ;
                       db $D1,$B0,$14,$D6,$C4,$15,$41,$41   ;04A12D|        |      ;
                       db $C1,$15,$FE,$02,$D6,$FB,$D1,$B0   ;04A135|        |      ;
                       db $14,$D6,$C4,$15,$45,$15,$D1,$B0   ;04A13D|        |      ;
                       db $14,$D6,$C4,$15,$41,$41,$C1,$15   ;04A145|        |      ;
                       db $FE,$02,$D6,$D1,$B0,$14,$D6,$C4   ;04A14D|        |      ;
                       db $15,$45,$15,$D1,$B0,$14,$D6,$C4   ;04A155|        |      ;
                       db $15,$41,$41,$C1,$15,$D1,$B0,$14   ;04A15D|        |      ;
                       db $D6,$C4,$15,$45,$15,$D1,$B0,$14   ;04A165|        |      ;
                       db $D6,$C4,$15,$41,$41,$11,$D1,$FB   ;04A16D|        |      ;
                       db $B0,$2A,$FE,$03,$FE,$FF           ;04A175|        |      ;
                       dw MUSIC_04A10D                      ;04A17B|        |04A10D;
 
sndTra00_bigBattle_60: db $EE,$08,$D6,$77,$83,$65,$C3       ;04A17D|        |      ;
 
         MUSIC_04A184: db $D6,$77,$83,$65,$EB,$50,$33,$E9   ;04A184|        |      ;
                       db $B1,$E4,$A9,$A0,$A0,$E3,$19,$10   ;04A18C|        |      ;
                       db $10,$03,$03,$01,$10,$20,$31,$01   ;04A194|        |      ;
                       db $61,$31,$91,$E2,$01,$D6,$77,$84   ;04A19C|        |      ;
                       db $64,$EB,$50,$32,$E9,$B1,$E4,$A4   ;04A1A4|        |      ;
                       db $A0,$FB,$E4,$A0,$E3,$20,$FE,$03   ;04A1AC|        |      ;
                       db $E3,$14,$10,$10,$40,$10,$40,$10   ;04A1B4|        |      ;
                       db $40,$04,$00,$00,$30,$00,$30,$00   ;04A1BC|        |      ;
                       db $30,$E4,$A4,$A0,$A0,$E3,$21,$50   ;04A1C4|        |      ;
                       db $40,$30,$E9,$00,$D6,$77,$84,$64   ;04A1CC|        |      ;
                       db $EB,$50,$32,$E9,$B1,$E4,$A4,$A0   ;04A1D4|        |      ;
                       db $FB,$E4,$A0,$E3,$20,$FE,$03,$E3   ;04A1DC|        |      ;
                       db $14,$10,$10,$40,$10,$40,$10,$40   ;04A1E4|        |      ;
                       db $04,$00,$00,$30,$00,$30,$00,$30   ;04A1EC|        |      ;
                       db $E4,$A4,$A0,$A0,$E3,$21,$50,$40   ;04A1F4|        |      ;
                       db $30,$E9,$00,$D6,$77,$83,$22,$FB   ;04A1FC|        |      ;
                       db $E4,$A0,$70,$FE,$04,$E3,$20,$E4   ;04A204|        |      ;
                       db $70,$A0,$20,$FB,$E3,$00,$E4,$90   ;04A20C|        |      ;
                       db $FE,$04,$E3,$30,$E4,$90,$E3,$00   ;04A214|        |      ;
                       db $E4,$60,$FB,$E3,$20,$E4,$80,$FE   ;04A21C|        |      ;
                       db $04,$E3,$20,$30,$40,$50,$F1,$B0   ;04A224|        |      ;
                       db $20,$80,$B0,$F0,$E2,$20,$E3,$50   ;04A22C|        |      ;
                       db $B0,$E2,$20,$50,$E3,$80,$E2,$20   ;04A234|        |      ;
                       db $50,$D6,$77,$84,$64,$EB,$54,$21   ;04A23C|        |      ;
                       db $E2,$34,$E3,$70,$E2,$30,$20,$00   ;04A244|        |      ;
                       db $20,$30,$50,$74,$10,$40,$60,$70   ;04A24C|        |      ;
                       db $60,$70,$40,$C0,$D6,$38,$85,$19   ;04A254|        |      ;
                       db $E9,$B1,$30,$30,$F5,$30,$F0,$60   ;04A25C|        |      ;
                       db $60,$F5,$30,$F0,$60,$F5,$60,$F0   ;04A264|        |      ;
                       db $D6,$77,$84,$64,$ED,$03,$E5,$80   ;04A26C|        |      ;
                       db $90,$A0,$E4,$00,$20,$40,$60,$ED   ;04A274|        |      ;
                       db $00,$E9,$00,$D6,$77,$83,$22,$FB   ;04A27C|        |      ;
                       db $E4,$A0,$70,$FE,$04,$E3,$20,$E4   ;04A284|        |      ;
                       db $70,$A0,$20,$FB,$E3,$00,$E4,$90   ;04A28C|        |      ;
                       db $FE,$04,$E3,$30,$E4,$90,$E3,$00   ;04A294|        |      ;
                       db $E4,$60,$FB,$E3,$20,$E4,$80,$FE   ;04A29C|        |      ;
                       db $04,$E3,$20,$30,$40,$50,$F1,$B0   ;04A2A4|        |      ;
                       db $20,$80,$B0,$F0,$E2,$20,$E3,$50   ;04A2AC|        |      ;
                       db $B0,$E2,$20,$50,$E3,$80,$E2,$20   ;04A2B4|        |      ;
                       db $50,$D6,$77,$84,$64,$EB,$54,$21   ;04A2BC|        |      ;
                       db $E2,$34,$E3,$70,$E2,$30,$20,$00   ;04A2C4|        |      ;
                       db $20,$30,$50,$74,$10,$40,$60,$70   ;04A2CC|        |      ;
                       db $60,$70,$40,$C0,$D6,$38,$85,$19   ;04A2D4|        |      ;
                       db $E9,$B1,$30,$30,$F5,$30,$F0,$60   ;04A2DC|        |      ;
                       db $60,$F5,$30,$F0,$60,$F5,$60,$F0   ;04A2E4|        |      ;
                       db $D6,$77,$84,$64,$ED,$03,$E5,$80   ;04A2EC|        |      ;
                       db $90,$A0,$E4,$00,$20,$40,$60,$ED   ;04A2F4|        |      ;
                       db $00,$E9,$00,$FE,$FF               ;04A2FC|        |      ;
                       dw MUSIC_04A184                      ;04A301|        |04A184;
 
sndTra01_bigBattle_60: db $D6,$78,$84,$17,$C3               ;04A303|        |      ;
 
         MUSIC_04A308: db $D6,$78,$84,$17,$E9,$35,$EC,$02   ;04A308|        |      ;
                       db $E3,$20,$70,$A0,$E2,$20,$FB,$E3   ;04A310|        |      ;
                       db $A0,$70,$20,$E2,$20,$FE,$02,$E3   ;04A318|        |      ;
                       db $40,$70,$A0,$E2,$40,$FB,$10,$E3   ;04A320|        |      ;
                       db $A0,$70,$E2,$40,$FE,$02,$E3,$30   ;04A328|        |      ;
                       db $60,$E2,$00,$30,$FB,$00,$E3,$90   ;04A330|        |      ;
                       db $60,$E2,$30,$FE,$02,$E3,$90,$E2   ;04A338|        |      ;
                       db $00,$30,$60,$00,$30,$60,$E1,$00   ;04A340|        |      ;
                       db $E2,$A0,$90,$70,$60,$D6,$78,$84   ;04A348|        |      ;
                       db $17,$E9,$35,$EC,$02,$E3,$20,$70   ;04A350|        |      ;
                       db $A0,$E2,$20,$FB,$E3,$A0,$70,$20   ;04A358|        |      ;
                       db $E2,$20,$FE,$02,$E3,$40,$70,$A0   ;04A360|        |      ;
                       db $E2,$40,$FB,$10,$E3,$A0,$70,$E2   ;04A368|        |      ;
                       db $40,$FE,$02,$E3,$30,$60,$E2,$00   ;04A370|        |      ;
                       db $30,$FB,$00,$E3,$90,$60,$E2,$30   ;04A378|        |      ;
                       db $FE,$02,$E3,$20,$70,$A0,$E2,$20   ;04A380|        |      ;
                       db $FB,$E3,$A0,$70,$20,$E2,$20,$FE   ;04A388|        |      ;
                       db $02,$D6,$78,$84,$17,$E9,$35,$EC   ;04A390|        |      ;
                       db $02,$E3,$20,$70,$A0,$E2,$20,$FB   ;04A398|        |      ;
                       db $E3,$A0,$70,$20,$E2,$20,$FE,$02   ;04A3A0|        |      ;
                       db $E3,$40,$70,$A0,$E2,$40,$FB,$10   ;04A3A8|        |      ;
                       db $E3,$A0,$70,$E2,$40,$FE,$02,$E3   ;04A3B0|        |      ;
                       db $30,$60,$E2,$00,$30,$FB,$00,$E3   ;04A3B8|        |      ;
                       db $90,$60,$E2,$30,$FE,$02,$E3,$20   ;04A3C0|        |      ;
                       db $70,$A0,$E2,$20,$FB,$E3,$A0,$70   ;04A3C8|        |      ;
                       db $20,$E2,$20,$FE,$02,$D6,$7A,$84   ;04A3D0|        |      ;
                       db $17,$F2,$E9,$35,$EC,$02,$E3,$70   ;04A3D8|        |      ;
                       db $20,$70,$20,$70,$20,$70,$E2,$20   ;04A3E0|        |      ;
                       db $00,$E3,$A0,$90,$70,$90,$30,$90   ;04A3E8|        |      ;
                       db $30,$90,$30,$90,$E2,$30,$20,$00   ;04A3F0|        |      ;
                       db $E3,$A0,$90,$B0,$50,$B0,$50,$B0   ;04A3F8|        |      ;
                       db $50,$B0,$E2,$50,$30,$20,$00,$E3   ;04A400|        |      ;
                       db $B0,$F3,$E2,$20,$E3,$80,$B0,$E2   ;04A408|        |      ;
                       db $20,$F2,$50,$E3,$B0,$E2,$20,$F1   ;04A410|        |      ;
                       db $50,$80,$F0,$20,$50,$80,$D6,$78   ;04A418|        |      ;
                       db $84,$64,$E9,$00,$EC,$02,$EB,$54   ;04A420|        |      ;
                       db $21,$E2,$75,$E8,$17,$E9,$74,$70   ;04A428|        |      ;
                       db $50,$30,$50,$70,$90,$E8,$64,$E9   ;04A430|        |      ;
                       db $00,$A5,$E8,$17,$E9,$74,$70,$90   ;04A438|        |      ;
                       db $A0,$90,$A0,$70,$C0,$EC,$00,$E9   ;04A440|        |      ;
                       db $30,$E9,$B1,$60,$60,$F5,$60,$F0   ;04A448|        |      ;
                       db $A0,$A0,$F5,$60,$F0,$90,$F5,$A0   ;04A450|        |      ;
                       db $F0,$E3,$80,$90,$A0,$E2,$00,$20   ;04A458|        |      ;
                       db $40,$60,$EB,$00,$D6,$7A,$84,$17   ;04A460|        |      ;
                       db $F2,$E9,$35,$EC,$02,$E3,$70,$20   ;04A468|        |      ;
                       db $70,$20,$70,$20,$70,$E2,$20,$00   ;04A470|        |      ;
                       db $E3,$A0,$90,$70,$90,$30,$90,$30   ;04A478|        |      ;
                       db $90,$30,$90,$E2,$30,$20,$00,$E3   ;04A480|        |      ;
                       db $A0,$90,$B0,$50,$B0,$50,$B0,$50   ;04A488|        |      ;
                       db $B0,$E2,$50,$30,$20,$00,$E3,$B0   ;04A490|        |      ;
                       db $F3,$E2,$20,$E3,$80,$B0,$E2,$20   ;04A498|        |      ;
                       db $F2,$50,$E3,$B0,$E2,$20,$F1,$50   ;04A4A0|        |      ;
                       db $80,$F0,$20,$50,$80,$D6,$78,$84   ;04A4A8|        |      ;
                       db $64,$E9,$00,$EC,$02,$EB,$54,$21   ;04A4B0|        |      ;
                       db $E2,$75,$E8,$17,$E9,$74,$70,$50   ;04A4B8|        |      ;
                       db $30,$50,$70,$90,$E8,$64,$E9,$00   ;04A4C0|        |      ;
                       db $A5,$E8,$17,$E9,$74,$70,$90,$A0   ;04A4C8|        |      ;
                       db $90,$A0,$70,$C0,$EC,$00,$E9,$30   ;04A4D0|        |      ;
                       db $E9,$B1,$60,$60,$F5,$60,$F0,$A0   ;04A4D8|        |      ;
                       db $A0,$F5,$60,$F0,$90,$F5,$A0,$F0   ;04A4E0|        |      ;
                       db $E3,$80,$90,$A0,$E2,$00,$20,$40   ;04A4E8|        |      ;
                       db $60,$EB,$00,$FE,$FF               ;04A4F0|        |      ;
                       dw MUSIC_04A308                      ;04A4F5|        |04A308;
 
sndTra02_bigBattle_60: db $D6,$00,$C3                       ;04A4F7|        |      ;
 
         MUSIC_04A4FA: db $D6,$00,$FB,$D6,$00,$E3,$28,$C0   ;04A4FA|        |      ;
                       db $D6,$11,$20,$20,$FE,$02,$23,$23   ;04A502|        |      ;
                       db $23,$21,$21,$21,$21,$21,$21,$D6   ;04A50A|        |      ;
                       db $10,$FB,$E4,$70,$F0,$FE,$16,$20   ;04A512|        |      ;
                       db $40,$50,$60,$D6,$10,$FB,$E4,$70   ;04A51A|        |      ;
                       db $F0,$FE,$16,$20,$40,$50,$60,$D6   ;04A522|        |      ;
                       db $10,$FB,$E4,$70,$F0,$FE,$18,$D6   ;04A52A|        |      ;
                       db $10,$FB,$E4,$70,$F0,$FE,$05,$50   ;04A532|        |      ;
                       db $F0,$FB,$40,$F0,$FE,$06,$20,$E2   ;04A53A|        |      ;
                       db $00,$00,$E4,$20,$E2,$30,$30,$E4   ;04A542|        |      ;
                       db $20,$E2,$20,$E4,$20,$80,$90,$A0   ;04A54A|        |      ;
                       db $E3,$00,$20,$40,$60,$D6,$10,$FB   ;04A552|        |      ;
                       db $E4,$70,$F0,$FE,$18,$D6,$10,$FB   ;04A55A|        |      ;
                       db $E4,$70,$F0,$FE,$05,$50,$F0,$FB   ;04A562|        |      ;
                       db $40,$F0,$FE,$06,$20,$E2,$00,$00   ;04A56A|        |      ;
                       db $E4,$20,$E2,$30,$30,$E4,$20,$E2   ;04A572|        |      ;
                       db $20,$E4,$20,$80,$90,$A0,$E3,$00   ;04A57A|        |      ;
                       db $20,$40,$60,$FE,$FF               ;04A582|        |      ;
                       dw MUSIC_04A4FA                      ;04A587|        |04A4FA;
 
sndTra05_bigBattle_60: db $D1,$FB,$A0,$22,$FE,$06           ;04A589|        |      ;
 
     sndTra05_boss_61: db $D6,$FB,$D1,$B0,$24,$D6,$C8,$D1   ;04A58F|        |      ;
                       db $B0,$24,$B0,$24,$FE,$02,$FB,$B0   ;04A597|        |      ;
                       db $2A,$CB,$FE,$03,$B0,$2A,$B0,$2A   ;04A59F|        |      ;
                       db $B0,$2A,$B0,$14,$B0,$14,$B0,$14   ;04A5A7|        |      ;
                       db $B0,$24,$B0,$24,$B0,$24           ;04A5AF|        |      ;
 
         MUSIC_04A5B5: db $D1,$FB,$B0,$2A,$A0,$2A,$B0,$24   ;04A5B5|        |      ;
                       db $B5,$A0,$2A,$B0,$24,$B5,$A0,$2A   ;04A5BD|        |      ;
                       db $FE,$08,$D1,$FB,$B0,$2A,$A0,$2A   ;04A5C5|        |      ;
                       db $B0,$24,$B5,$A0,$2A,$B0,$24,$B5   ;04A5CD|        |      ;
                       db $A0,$2A,$FE,$04,$D1,$FB,$B0,$2A   ;04A5D5|        |      ;
                       db $A0,$2A,$B0,$24,$B5,$A0,$2A,$B0   ;04A5DD|        |      ;
                       db $24,$B5,$A0,$2A,$FE,$02,$B5,$A5   ;04A5E5|        |      ;
                       db $A5,$B5,$A5,$A5,$B5,$B5,$A5,$A5   ;04A5ED|        |      ;
                       db $A5,$A5,$A5,$A5,$A5,$A5,$D1,$FB   ;04A5F5|        |      ;
                       db $B0,$2A,$A0,$2A,$B0,$24,$B5,$A0   ;04A5FD|        |      ;
                       db $2A,$B0,$24,$B5,$A0,$2A,$FE,$04   ;04A605|        |      ;
                       db $D1,$FB,$B0,$2A,$A0,$2A,$B0,$24   ;04A60D|        |      ;
                       db $B5,$A0,$2A,$B0,$24,$B5,$A0,$2A   ;04A615|        |      ;
                       db $FE,$02,$B5,$A5,$A5,$B5,$A5,$A5   ;04A61D|        |      ;
                       db $B5,$B5,$A5,$A5,$A5,$A5,$A5,$A5   ;04A625|        |      ;
                       db $A5,$A5,$D6,$FB,$D1,$B0,$24,$D6   ;04A62D|        |      ;
                       db $C2,$B0,$A0,$A1,$D1,$B0,$2A,$B0   ;04A635|        |      ;
                       db $24,$B0,$24,$FE,$03,$B0,$2A,$B0   ;04A63D|        |      ;
                       db $2A,$B0,$2A,$B0,$14,$B0,$14,$B0   ;04A645|        |      ;
                       db $14,$B0,$24,$B0,$24,$B0,$24,$FE   ;04A64D|        |      ;
                       db $FF                               ;04A655|        |      ;
                       dw MUSIC_04A5B5                      ;04A656|        |04A5B5;
 
     sndTra00_boss_61: db $EA,$01,$FD,$84,$A1               ;04A658|        |      ;
 
     sndTra01_boss_61: db $EA,$01,$FD,$08,$A3               ;04A65D|        |      ;
 
     sndTra02_boss_61: db $EA,$01,$FD,$FA,$A4               ;04A662|        |      ;
 
  sndTra00_epithap_62: db $DA,$72,$80,$00,$ED,$01,$E4,$11   ;04A667|        |      ;
 
         MUSIC_04A66F: db $DA,$72,$80,$00,$ED,$01,$E4,$11   ;04A66F|        |      ;
                       db $81,$71,$33,$63,$13,$05,$11,$31   ;04A677|        |      ;
                       db $41,$61,$11,$81,$71,$33,$63,$13   ;04A67F|        |      ;
                       db $05,$11,$81,$E3,$11,$01,$DA,$72   ;04A687|        |      ;
                       db $80,$11,$ED,$01,$E4,$11,$B1,$81   ;04A68F|        |      ;
                       db $7F,$C9,$11,$B1,$81,$71,$41,$75   ;04A697|        |      ;
                       db $D1,$33,$80,$00,$F3,$E4,$A1,$B1   ;04A69F|        |      ;
                       db $E3,$01,$11,$F2,$21,$31,$41,$F1   ;04A6A7|        |      ;
                       db $51,$61,$71,$F0,$80,$90,$A0,$B0   ;04A6AF|        |      ;
                       db $E2,$00,$10,$20,$30,$40,$50,$60   ;04A6B7|        |      ;
                       db $70,$80,$90,$A0,$B0,$E1,$00,$10   ;04A6BF|        |      ;
                       db $20,$E3,$A0,$B0,$E2,$00,$10,$20   ;04A6C7|        |      ;
                       db $30,$40,$50,$60,$70,$80,$90,$A0   ;04A6CF|        |      ;
                       db $B0,$E1,$00,$10,$20,$F1,$E3,$A0   ;04A6D7|        |      ;
                       db $B0,$E2,$00,$10,$20,$30,$40,$50   ;04A6DF|        |      ;
                       db $60,$70,$80,$90,$A0,$B0,$E1,$00   ;04A6E7|        |      ;
                       db $10,$20,$F2,$E3,$A0,$B0,$E2,$00   ;04A6EF|        |      ;
                       db $10,$20,$30,$40,$50,$60,$70,$80   ;04A6F7|        |      ;
                       db $90,$A0,$B0,$E1,$00,$10,$20,$F3   ;04A6FF|        |      ;
                       db $E3,$A0,$B0,$E2,$00,$10,$20,$30   ;04A707|        |      ;
                       db $40,$50,$60,$70,$80,$90,$A0,$B0   ;04A70F|        |      ;
                       db $E1,$00,$10,$20,$F4,$E3,$A0,$B0   ;04A717|        |      ;
                       db $E2,$00,$10,$20,$30,$40,$50,$60   ;04A71F|        |      ;
                       db $70,$80,$90,$A0,$B0,$E1,$00,$10   ;04A727|        |      ;
                       db $20,$E6,$06,$C5,$FE,$FF           ;04A72F|        |      ;
                       dw MUSIC_04A66F                      ;04A735|        |04A66F;
 
  sndTra01_epithap_62: db $DA,$70,$08,$23,$EB,$50,$22,$E4   ;04A737|        |      ;
                       db $11,$81,$71,$33,$63,$13,$E8,$12   ;04A73F|        |      ;
                       db $05,$E8,$23,$11,$31,$41,$61,$11   ;04A747|        |      ;
                       db $81,$71,$33,$63,$13,$E8,$12,$05   ;04A74F|        |      ;
                       db $E8,$23,$11,$81,$E3,$11,$01,$DA   ;04A757|        |      ;
                       db $70,$08,$23,$EB,$50,$32,$E4,$11   ;04A75F|        |      ;
                       db $B1,$81,$E8,$54,$7F,$C9,$11,$B1   ;04A767|        |      ;
                       db $81,$71,$41,$7F,$C5,$FE,$FF       ;04A76F|        |      ;
                       dw sndTra01_epithap_62               ;04A776|        |04A737;
 
  sndTra02_epithap_62: db $DA,$00,$FB,$E4,$15,$05,$65,$E5   ;04A778|        |      ;
                       db $A5,$B3,$E4,$03,$FE,$02,$DA,$00   ;04A780|        |      ;
                       db $E4,$11,$61,$11,$0D,$CB,$11,$61   ;04A788|        |      ;
                       db $11,$01,$E5,$91,$E4,$05,$CF,$FE   ;04A790|        |      ;
                       db $FF                               ;04A798|        |      ;
                       dw sndTra02_epithap_62               ;04A799|        |04A778;
 
  sndTra05_epithap_62: db $DA,$B1,$11,$21,$B3,$11,$21,$41   ;04A79B|        |      ;
                       db $FB,$B1,$11,$21,$B3,$11,$21,$41   ;04A7A3|        |      ;
                       db $FE,$03,$DA,$B1,$11,$21,$43,$11   ;04A7AB|        |      ;
                       db $21,$41,$D1,$B5,$6F,$C5,$6F,$C3   ;04A7B3|        |      ;
                       db $6F,$C1,$6F,$6F,$61,$DA,$11,$21   ;04A7BB|        |      ;
                       db $41,$41,$B1,$11,$21,$11,$11,$21   ;04A7C3|        |      ;
                       db $41,$B1,$11,$21,$41,$11,$11,$21   ;04A7CB|        |      ;
                       db $41,$FE,$FF                       ;04A7D3|        |      ;
                       dw sndTra05_epithap_62               ;04A7D6|        |04A79B;
 
  sndTra00_preload_66: db $DB,$F2,$80,$00,$ED,$01,$E4,$94   ;04A7D8|        |      ;
                       db $E3,$45,$71,$61,$21,$4B,$E4,$93   ;04A7E0|        |      ;
                       db $E3,$45,$71,$61,$21,$44,$D1,$F4   ;04A7E8|        |      ;
                       db $82,$00,$64,$75,$94,$B5,$E2,$DB   ;04A7F0|        |      ;
                       db $79,$85,$53,$EC,$02,$E2,$01,$E3   ;04A7F8|        |      ;
                       db $41,$E4,$91,$E3,$41,$E8,$12,$B0   ;04A800|        |      ;
                       db $90,$70,$50,$E8,$53,$81,$11,$51   ;04A808|        |      ;
                       db $E3,$11,$E8,$12,$70,$50,$30,$10   ;04A810|        |      ;
                       db $E8,$53,$01,$E4,$71,$E3,$01,$E4   ;04A818|        |      ;
                       db $71,$E3,$01,$E8,$12,$20,$00,$EB   ;04A820|        |      ;
                       db $50,$33,$EC,$00,$E4,$73,$EB,$00   ;04A828|        |      ;
                       db $93,$EB,$50,$33,$B8,$DB,$32,$81   ;04A830|        |      ;
                       db $12,$ED,$01,$E3,$00,$20,$30,$70   ;04A838|        |      ;
                       db $E2,$00,$20,$30,$70,$E1,$00,$20   ;04A840|        |      ;
                       db $30,$70,$E3,$00,$20,$60,$90,$E2   ;04A848|        |      ;
                       db $00,$20,$60,$90,$E1,$00,$20,$60   ;04A850|        |      ;
                       db $90,$E3,$00,$20,$50,$80,$E2,$00   ;04A858|        |      ;
                       db $20,$50,$80,$E1,$00,$20,$50,$80   ;04A860|        |      ;
                       db $E4,$B0,$E3,$20,$50,$80,$B0,$E2   ;04A868|        |      ;
                       db $20,$50,$80,$B0,$E1,$20,$50,$ED   ;04A870|        |      ;
                       db $00,$DB,$37,$84,$18,$EC,$01,$E9   ;04A878|        |      ;
                       db $38,$E3,$00,$20,$30,$70,$E2,$00   ;04A880|        |      ;
                       db $20,$30,$70,$E1,$00,$20,$30,$70   ;04A888|        |      ;
                       db $E3,$00,$20,$60,$90,$E2,$00,$20   ;04A890|        |      ;
                       db $60,$90,$E1,$00,$20,$60,$90,$E4   ;04A898|        |      ;
                       db $B0,$E3,$20,$50,$80,$B0,$E2,$20   ;04A8A0|        |      ;
                       db $50,$80,$B0,$E1,$20,$50,$70,$E4   ;04A8A8|        |      ;
                       db $A0,$E3,$10,$40,$70,$A0,$E2,$10   ;04A8B0|        |      ;
                       db $40,$70,$A0,$E1,$10,$40,$70,$E4   ;04A8B8|        |      ;
                       db $90,$A0,$E3,$00,$50,$90,$A0,$E2   ;04A8C0|        |      ;
                       db $00,$50,$90,$A0,$E1,$00,$50,$E4   ;04A8C8|        |      ;
                       db $80,$E3,$00,$20,$50,$80,$E2,$00   ;04A8D0|        |      ;
                       db $20,$50,$80,$E1,$00,$20,$50,$E4   ;04A8D8|        |      ;
                       db $70,$E3,$00,$20,$50,$70,$E2,$00   ;04A8E0|        |      ;
                       db $20,$50,$70,$E1,$00,$20,$50,$E4   ;04A8E8|        |      ;
                       db $70,$B0,$E3,$20,$50,$70,$B0,$E2   ;04A8F0|        |      ;
                       db $20,$50,$70,$B0,$E1,$20,$50,$DB   ;04A8F8|        |      ;
                       db $37,$84,$18,$EC,$01,$E9,$38,$E4   ;04A900|        |      ;
                       db $30,$E3,$20,$30,$70,$E2,$00,$20   ;04A908|        |      ;
                       db $30,$70,$E1,$00,$20,$30,$70,$E4   ;04A910|        |      ;
                       db $20,$E3,$20,$60,$90,$E2,$00,$20   ;04A918|        |      ;
                       db $60,$90,$E1,$00,$20,$60,$90,$E4   ;04A920|        |      ;
                       db $20,$E3,$20,$50,$80,$B0,$E2,$20   ;04A928|        |      ;
                       db $50,$80,$B0,$E1,$20,$50,$70,$E4   ;04A930|        |      ;
                       db $10,$E3,$10,$40,$70,$A0,$E2,$10   ;04A938|        |      ;
                       db $40,$70,$A0,$E1,$10,$40,$70,$E4   ;04A940|        |      ;
                       db $90,$A0,$E3,$00,$50,$90,$A0,$E2   ;04A948|        |      ;
                       db $00,$50,$90,$A0,$E1,$00,$50,$E4   ;04A950|        |      ;
                       db $00,$E3,$00,$20,$50,$80,$E2,$00   ;04A958|        |      ;
                       db $20,$50,$80,$E1,$00,$20,$50,$E4   ;04A960|        |      ;
                       db $00,$E3,$00,$20,$50,$70,$E2,$00   ;04A968|        |      ;
                       db $20,$50,$70,$E1,$00,$20,$50,$E5   ;04A970|        |      ;
                       db $B0,$E4,$B0,$E3,$20,$50,$70,$B0   ;04A978|        |      ;
                       db $E2,$20,$50,$70,$B0,$E1,$20,$50   ;04A980|        |      ;
                       db $DB,$B7,$85,$17,$EC,$03,$E9,$B4   ;04A988|        |      ;
                       db $ED,$01,$E4,$31,$ED,$00,$81,$E3   ;04A990|        |      ;
                       db $31,$81,$E2,$31,$81,$E4,$01,$71   ;04A998|        |      ;
                       db $E3,$01,$71,$E2,$01,$71,$E4,$11   ;04A9A0|        |      ;
                       db $81,$E3,$11,$81,$E2,$11,$81,$E4   ;04A9A8|        |      ;
                       db $01,$71,$E3,$21,$71,$B1,$E2,$71   ;04A9B0|        |      ;
                       db $E4,$31,$81,$E3,$31,$81,$E2,$31   ;04A9B8|        |      ;
                       db $81,$E4,$01,$71,$E3,$01,$71,$E2   ;04A9C0|        |      ;
                       db $01,$71,$E4,$11,$81,$E3,$11,$81   ;04A9C8|        |      ;
                       db $E2,$11,$81,$E3,$01,$21,$71,$EC   ;04A9D0|        |      ;
                       db $00,$E8,$12,$E9,$70,$E4,$B0,$90   ;04A9D8|        |      ;
                       db $EB,$50,$22,$B3,$DB,$77,$85,$64   ;04A9E0|        |      ;
                       db $EC,$02,$E3,$31,$E4,$A1,$71,$A1   ;04A9E8|        |      ;
                       db $E3,$31,$71,$51,$11,$51,$EC,$00   ;04A9F0|        |      ;
                       db $DB,$F7,$85,$12,$80,$70,$51,$30   ;04A9F8|        |      ;
                       db $10,$DB,$77,$85,$64,$EC,$02,$31   ;04AA00|        |      ;
                       db $01,$E4,$81,$E3,$01,$31,$01,$51   ;04AA08|        |      ;
                       db $E4,$B1,$E3,$31,$E4,$B1,$E3,$11   ;04AA10|        |      ;
                       db $E4,$B1,$E8,$67,$FB,$E3,$30,$E4   ;04AA18|        |      ;
                       db $A0,$70,$A0,$FE,$02,$E3,$30,$E4   ;04AA20|        |      ;
                       db $A0,$ED,$01,$E3,$30,$ED,$00,$70   ;04AA28|        |      ;
                       db $50,$10,$E4,$80,$E3,$10,$50,$10   ;04AA30|        |      ;
                       db $EC,$00,$DB,$F7,$85,$12,$80,$70   ;04AA38|        |      ;
                       db $51,$30,$10,$DB,$77,$85,$67,$EC   ;04AA40|        |      ;
                       db $02,$FB,$ED,$01,$30,$ED,$00,$00   ;04AA48|        |      ;
                       db $E4,$80,$E3,$00,$FE,$02,$DB,$F7   ;04AA50|        |      ;
                       db $85,$12,$EC,$00,$01,$10,$00,$DB   ;04AA58|        |      ;
                       db $F6,$82,$00,$E4,$B3,$DD,$F3,$80   ;04AA60|        |      ;
                       db $00,$B3,$DF,$F2,$80,$12,$EB,$50   ;04AA68|        |      ;
                       db $03,$BF,$FF                       ;04AA70|        |      ;
 
  sndTra01_preload_66: db $D1,$F6,$82,$00,$ED,$02,$E4,$91   ;04AA73|        |      ;
                       db $DB,$F4,$80,$12,$93,$DB,$F6,$82   ;04AA7B|        |      ;
                       db $12,$E3,$45,$71,$61,$21,$4B,$E4   ;04AA83|        |      ;
                       db $93,$E3,$45,$71,$61,$21,$DB,$F6   ;04AA8B|        |      ;
                       db $82,$00,$43,$D1,$F4,$80,$12,$48   ;04AA93|        |      ;
                       db $D1,$F8,$84,$12,$64,$75,$94,$B5   ;04AA9B|        |      ;
                       db $E2,$04,$25,$DB,$FA,$85,$12,$ED   ;04AAA3|        |      ;
                       db $00,$EB,$50,$32,$E2,$47,$20,$00   ;04AAAB|        |      ;
                       db $E3,$B0,$90,$E2,$07,$E3,$A0,$80   ;04AAB3|        |      ;
                       db $70,$50,$7B,$E4,$B3,$E3,$03,$27   ;04AABB|        |      ;
                       db $DB,$38,$85,$18,$E3,$00,$20,$30   ;04AAC3|        |      ;
                       db $70,$E2,$00,$20,$30,$70,$E1,$00   ;04AACB|        |      ;
                       db $20,$30,$70,$E3,$00,$20,$60,$90   ;04AAD3|        |      ;
                       db $E2,$00,$20,$60,$90,$E1,$00,$20   ;04AADB|        |      ;
                       db $60,$90,$E3,$00,$20,$50,$80,$E2   ;04AAE3|        |      ;
                       db $00,$20,$50,$80,$E1,$00,$20,$50   ;04AAEB|        |      ;
                       db $80,$E4,$B0,$E3,$20,$50,$80,$B0   ;04AAF3|        |      ;
                       db $E2,$20,$50,$80,$B0,$E1,$20,$50   ;04AAFB|        |      ;
                       db $80,$DB,$FA,$85,$11,$EB,$50,$36   ;04AB03|        |      ;
                       db $E4,$77,$81,$71,$67,$21,$31,$55   ;04AB0B|        |      ;
                       db $81,$71,$51,$43,$53,$73,$E3,$02   ;04AB13|        |      ;
                       db $E4,$50,$55,$01,$55,$31,$21,$01   ;04AB1B|        |      ;
                       db $EB,$50,$31,$29,$01,$27,$31,$51   ;04AB23|        |      ;
                       db $DB,$FA,$85,$11,$EB,$50,$36,$E4   ;04AB2B|        |      ;
                       db $77,$81,$71,$67,$21,$31,$55,$81   ;04AB33|        |      ;
                       db $71,$51,$43,$53,$73,$E3,$02,$E4   ;04AB3B|        |      ;
                       db $50,$55,$01,$55,$31,$21,$01,$EB   ;04AB43|        |      ;
                       db $50,$31,$29,$01,$29,$30,$50,$DB   ;04AB4B|        |      ;
                       db $FA,$85,$11,$EB,$50,$36,$E4,$30   ;04AB53|        |      ;
                       db $20,$07,$30,$50,$30,$20,$07,$00   ;04AB5B|        |      ;
                       db $20,$33,$13,$83,$79,$EB,$50,$33   ;04AB63|        |      ;
                       db $F1,$E3,$30,$50,$30,$20,$07,$30   ;04AB6B|        |      ;
                       db $50,$30,$20,$07,$00,$20,$33,$13   ;04AB73|        |      ;
                       db $83,$79,$30,$50,$DB,$F8,$84,$12   ;04AB7B|        |      ;
                       db $EB,$50,$32,$E3,$70,$80,$70,$80   ;04AB83|        |      ;
                       db $A5,$31,$A5,$E2,$00,$E3,$A0,$81   ;04AB8B|        |      ;
                       db $71,$72,$80,$EB,$50,$33,$35,$50   ;04AB93|        |      ;
                       db $30,$EB,$50,$22,$83,$73,$53,$70   ;04AB9B|        |      ;
                       db $80,$70,$80,$A5,$31,$A5,$E2,$00   ;04ABA3|        |      ;
                       db $E3,$A0,$81,$71,$72,$80,$35,$50   ;04ABAB|        |      ;
                       db $30,$83,$E6,$0D,$73,$EB,$50,$33   ;04ABB3|        |      ;
                       db $E6,$0F,$E8,$62,$5F,$FF           ;04ABBB|        |      ;
 
  sndTra02_preload_66: db $DB,$00,$E3,$93,$E2,$45,$71,$61   ;04ABC1|        |      ;
                       db $21,$4B,$E3,$93,$E2,$45,$71,$61   ;04ABC9|        |      ;
                       db $21,$45,$E4,$71,$DB,$00,$E3,$5B   ;04ABD1|        |      ;
                       db $1B,$2B,$E4,$7F,$DB,$00,$CB,$CB   ;04ABD9|        |      ;
                       db $CB,$CB,$DB,$00,$E3,$FB,$0A,$C0   ;04ABE1|        |      ;
                       db $FE,$06,$7A,$C0,$E4,$7A,$C0,$DB   ;04ABE9|        |      ;
                       db $00,$FB,$E3,$07,$E4,$03,$FE,$06   ;04ABF1|        |      ;
                       db $77,$E3,$23,$77,$E4,$73,$DB,$17   ;04ABF9|        |      ;
                       db $E4,$81,$81,$81,$81,$81,$81,$31   ;04AC01|        |      ;
                       db $31,$31,$31,$31,$31,$11,$11,$11   ;04AC09|        |      ;
                       db $11,$11,$11,$21,$21,$21,$21,$71   ;04AC11|        |      ;
                       db $71,$81,$81,$81,$81,$81,$81,$31   ;04AC19|        |      ;
                       db $31,$31,$31,$31,$31,$11,$11,$11   ;04AC21|        |      ;
                       db $11,$11,$11,$71,$71,$71,$71,$71   ;04AC29|        |      ;
                       db $51,$DB,$19,$E4,$FB,$33,$33,$33   ;04AC31|        |      ;
                       db $FE,$04,$DB,$17,$FB,$E4,$31,$F1   ;04AC39|        |      ;
                       db $31,$F1,$31,$F1,$FE,$03,$DB,$00   ;04AC41|        |      ;
                       db $16,$D1,$00,$01,$E5,$B1,$A1,$91   ;04AC49|        |      ;
                       db $81,$71,$62,$52,$43,$33,$24,$16   ;04AC51|        |      ;
                       db $DF,$00,$E5,$1D,$FF               ;04AC59|        |      ;
 
  sndTra05_preload_66: db $FF                               ;04AC5E|        |      ;
 
sndTra00_DejaVu_5D_6A: db $D8,$72,$24,$35,$E3,$92,$C0,$90   ;04AC5F|        |      ;
                       db $C0,$A2,$C0,$A0,$C0,$E2,$02,$C0   ;04AC67|        |      ;
                       db $00,$C0,$E8,$56,$E3,$B2,$A2,$E3   ;04AC6F|        |      ;
                       db $42,$90,$E2,$10,$40,$E3,$52,$A0   ;04AC77|        |      ;
                       db $E2,$20,$50,$E3,$62,$B0,$E2,$30   ;04AC7F|        |      ;
                       db $60,$F4,$E3,$00,$70,$F3,$E2,$00   ;04AC87|        |      ;
                       db $E3,$10,$F2,$80,$F1,$E2,$10,$FE   ;04AC8F|        |      ;
                       db $FF                               ;04AC97|        |      ;
                       dw sndTra00_DejaVu_5D_6A             ;04AC98|        |04AC5F;
 
sndTra01_DejaVu_5D_6A: db $D8,$32,$25,$2A,$EC,$03,$E9,$34   ;04AC9A|        |      ;
                       db $FB,$E1,$50,$20,$50,$20,$50,$20   ;04ACA2|        |      ;
                       db $FE,$04,$D8,$30,$26,$22,$EC,$00   ;04ACAA|        |      ;
                       db $E9,$75,$E1,$10,$E2,$90,$E1,$10   ;04ACB2|        |      ;
                       db $E1,$92,$E1,$20,$E2,$A0,$E1,$20   ;04ACBA|        |      ;
                       db $E1,$A2,$E1,$30,$E2,$B0,$E1,$30   ;04ACC2|        |      ;
                       db $E1,$B2,$F4,$E2,$70,$F3,$E1,$00   ;04ACCA|        |      ;
                       db $70,$F2,$E2,$80,$E1,$10,$F1,$80   ;04ACD2|        |      ;
                       db $FE,$FF                           ;04ACDA|        |      ;
                       dw sndTra01_DejaVu_5D_6A             ;04ACDC|        |04AC9A;
 
sndTra02_DejaVu_5D_6A: db $D8,$12,$FB,$E3,$20,$E2,$20,$E3   ;04ACDE|        |      ;
                       db $20,$E2,$20,$E3,$20,$E2,$20,$FE   ;04ACE6|        |      ;
                       db $04,$FB,$E4,$90,$E3,$90,$E4,$90   ;04ACEE|        |      ;
                       db $E3,$90,$E4,$90,$E3,$90,$FE,$03   ;04ACF6|        |      ;
                       db $E4,$90,$E3,$90,$E4,$90,$90,$90   ;04ACFE|        |      ;
                       db $90,$FE,$FF                       ;04AD06|        |      ;
                       dw sndTra02_DejaVu_5D_6A             ;04AD09|        |04ACDE;
 
sndTra05_DejaVu_5D_6A: db $D8,$FB,$D1,$B0,$D7,$20,$D8,$20   ;04AD0B|        |      ;
                       db $B0,$10,$40,$D1,$B0,$D7,$20,$FE   ;04AD13|        |      ;
                       db $04,$D8,$B0,$20,$B0,$D1,$B0,$D7   ;04AD1B|        |      ;
                       db $20,$D8,$10,$D1,$B0,$D7,$20,$D8   ;04AD23|        |      ;
                       db $B0,$20,$B0,$D1,$40,$D7,$20,$D8   ;04AD2B|        |      ;
                       db $B0,$D1,$40,$D7,$20,$D8,$B0,$20   ;04AD33|        |      ;
                       db $B0,$20,$B0,$20,$D4,$40,$40,$D8   ;04AD3B|        |      ;
                       db $40,$40,$40,$40,$40,$FE,$FF       ;04AD43|        |      ;
                       dw sndTra05_DejaVu_5D_6A             ;04AD4A|        |04AD0B;
 
sndTra01_partnerChoose_6B: db $D8,$B7,$83,$73,$EB,$68,$41,$E2   ;04AD4C|        |      ;
                       db $4F,$3B,$E3,$B3,$E2,$2F,$1B,$E3   ;04AD54|        |      ;
                       db $93,$E2,$0B,$E3,$A3,$B3,$83,$E2   ;04AD5C|        |      ;
                       db $53,$33,$FE,$FF                   ;04AD64|        |      ;
                       dw sndTra01_partnerChoose_6B         ;04AD68|        |04AD4C;
 
sndTra00_partnerChoose_6B: db $D8,$B6,$84,$46,$EC,$02,$E4,$91   ;04AD6A|        |      ;
                       db $B1,$E3,$01,$41,$91,$B1,$E2,$01   ;04AD72|        |      ;
                       db $41,$F4,$61,$F0,$E3,$B1,$91,$61   ;04AD7A|        |      ;
                       db $31,$E4,$B1,$91,$61,$71,$91,$A1   ;04AD82|        |      ;
                       db $E3,$21,$71,$91,$A1,$E2,$21,$F4   ;04AD8A|        |      ;
                       db $41,$F0,$E3,$91,$71,$41,$11,$E4   ;04AD92|        |      ;
                       db $91,$71,$41,$51,$71,$81,$E3,$01   ;04AD9A|        |      ;
                       db $51,$71,$81,$E2,$01,$E4,$41,$51   ;04ADA2|        |      ;
                       db $81,$B1,$E3,$21,$51,$81,$B1,$FE   ;04ADAA|        |      ;
                       db $FF                               ;04ADB2|        |      ;
                       dw sndTra00_partnerChoose_6B         ;04ADB3|        |04AD6A;
 
sndTra02_partnerChoose_6B: db $D8,$00,$E4,$9F,$BF,$7F,$9F,$5F   ;04ADB5|        |      ;
                       db $47,$87,$FE,$FF                   ;04ADBD|        |      ;
                       dw sndTra02_partnerChoose_6B         ;04ADC1|        |04ADB5;
 
sndTra05_partnerChoose_6B: db $FF                               ;04ADC3|        |      ;
 
  sndTra00_destiny_6C: db $DE,$78,$83,$11,$F1,$EB,$69,$43   ;04ADC4|        |      ;
                       db $E4,$8F,$F5,$E9,$B1,$E6,$01,$89   ;04ADCC|        |      ;
                       db $E6,$09,$E8,$36,$F2,$E4,$71,$ED   ;04ADD4|        |      ;
                       db $03,$81,$71,$F1,$81,$71,$F0,$E8   ;04ADDC|        |      ;
                       db $37,$FB,$E4,$81,$71,$FE,$03,$ED   ;04ADE4|        |      ;
                       db $00,$ED,$00,$DE,$77,$84,$23,$F1   ;04ADEC|        |      ;
                       db $EB,$69,$43,$E3,$8F,$F5,$E9,$B1   ;04ADF4|        |      ;
                       db $E6,$01,$89,$E6,$09,$E8,$36,$F1   ;04ADFC|        |      ;
                       db $E3,$71,$ED,$03,$81,$71,$F0,$81   ;04AE04|        |      ;
                       db $71,$F0,$E3,$81,$41,$E8,$48,$E8   ;04AE0C|        |      ;
                       db $34,$03,$E8,$45,$10,$20,$30,$40   ;04AE14|        |      ;
                       db $E9,$00,$ED,$00,$FE,$FF           ;04AE1C|        |      ;
                       dw sndTra00_destiny_6C               ;04AE22|        |04ADC4;
 
  sndTra01_destiny_6C: db $D9,$79,$85,$37,$E9,$B1,$FB,$E3   ;04AE24|        |      ;
                       db $01,$E4,$B1,$FE,$04,$F1,$FB,$E3   ;04AE2C|        |      ;
                       db $01,$E4,$B1,$FE,$04,$F0,$FB,$E3   ;04AE34|        |      ;
                       db $01,$E4,$B1,$FE,$04,$D9,$78,$85   ;04AE3C|        |      ;
                       db $45,$E9,$B1,$FB,$E2,$01,$E3,$B1   ;04AE44|        |      ;
                       db $FE,$04,$F1,$FB,$E2,$01,$E3,$B1   ;04AE4C|        |      ;
                       db $FE,$04,$F0,$E2,$01,$E3,$B1,$E2   ;04AE54|        |      ;
                       db $01,$E3,$81,$E8,$24,$E8,$46,$43   ;04AE5C|        |      ;
                       db $E8,$45,$50,$60,$70,$80,$FE,$FF   ;04AE64|        |      ;
                       dw sndTra01_destiny_6C               ;04AE6C|        |04AE24;
 
  sndTra02_destiny_6C: db $D9,$00,$E3,$5B,$49,$D1,$00,$55   ;04AE6E|        |      ;
                       db $65,$75,$D9,$00,$89,$D1,$00,$72   ;04AE76|        |      ;
                       db $62,$52,$42,$32,$22,$D9,$00,$19   ;04AE7E|        |      ;
                       db $30,$40,$D9,$00,$E3,$5B,$49,$D1   ;04AE86|        |      ;
                       db $00,$55,$65,$75,$D9,$00,$89,$D1   ;04AE8E|        |      ;
                       db $00,$72,$62,$52,$42,$32,$22,$D9   ;04AE96|        |      ;
                       db $19,$11,$51,$13,$30,$40,$50,$60   ;04AE9E|        |      ;
                       db $FE,$FF                           ;04AEA6|        |      ;
                       dw sndTra02_destiny_6C               ;04AEA8|        |04AE6E;
 
  sndTra05_destiny_6C: db $FF                               ;04AEAA|        |      ;
 
sndTra00_evergreen_68: db $D8,$B4,$23,$24,$ED,$01,$E3,$A3   ;04AEAB|        |      ;
                       db $E2,$01,$21,$71,$ED,$00,$D8,$B1   ;04AEB3|        |      ;
                       db $27,$34,$E2,$21,$01,$E3,$A1,$F3   ;04AEBB|        |      ;
                       db $9B,$F2,$21,$91,$73,$01,$21,$43   ;04AEC3|        |      ;
                       db $E4,$71,$E3,$01,$EB,$6A,$21,$73   ;04AECB|        |      ;
                       db $33,$53,$73,$55,$E4,$AD,$E3,$13   ;04AED3|        |      ;
                       db $43,$77,$E4,$71,$E3,$01,$41,$01   ;04AEDB|        |      ;
                       db $41,$71,$D8,$B2,$28,$12,$63,$F2   ;04AEE3|        |      ;
                       db $63,$F1,$73,$F0,$93,$EB,$00,$D8   ;04AEEB|        |      ;
                       db $76,$82,$45,$EC,$01,$EB,$6B,$21   ;04AEF3|        |      ;
                       db $E3,$25,$73,$E2,$21,$01,$E3,$A1   ;04AEFB|        |      ;
                       db $EB,$00,$E8,$45,$F1,$99,$EB,$6B   ;04AF03|        |      ;
                       db $11,$F0,$E4,$A1,$E3,$01,$21,$73   ;04AF0B|        |      ;
                       db $01,$21,$43,$E4,$71,$E3,$01,$73   ;04AF13|        |      ;
                       db $33,$53,$73,$57,$E4,$AB,$E8,$24   ;04AF1B|        |      ;
                       db $E3,$13,$43,$77,$E9,$74,$E8,$34   ;04AF23|        |      ;
                       db $EC,$03,$E4,$71,$E3,$01,$41,$01   ;04AF2B|        |      ;
                       db $41,$71,$E9,$00,$63,$E4,$93,$E3   ;04AF33|        |      ;
                       db $23,$63,$D8,$B6,$83,$28,$E9,$B4   ;04AF3B|        |      ;
                       db $EC,$02,$E3,$71,$71,$71,$71,$01   ;04AF43|        |      ;
                       db $01,$01,$01,$FB,$E4,$91,$91,$FE   ;04AF4B|        |      ;
                       db $04,$F1,$E3,$A1,$21,$91,$21,$71   ;04AF53|        |      ;
                       db $21,$51,$21,$31,$E4,$91,$E3,$01   ;04AF5B|        |      ;
                       db $31,$21,$01,$E4,$A1,$91,$E9,$00   ;04AF63|        |      ;
                       db $EC,$00,$D8,$B2,$81,$00,$E3,$73   ;04AF6B|        |      ;
                       db $D8,$72,$27,$58,$EB,$6B,$23,$E4   ;04AF73|        |      ;
                       db $23,$73,$93,$A7,$93,$A3,$EB,$00   ;04AF7B|        |      ;
                       db $71,$01,$71,$E3,$03,$E4,$71,$E3   ;04AF83|        |      ;
                       db $01,$73,$E4,$71,$A1,$31,$51,$E4   ;04AF8B|        |      ;
                       db $91,$E3,$01,$51,$EC,$00,$D8,$72   ;04AF93|        |      ;
                       db $28,$23,$EC,$02,$E9,$74,$E4,$A1   ;04AF9B|        |      ;
                       db $71,$A1,$E3,$21,$71,$E4,$A1,$E3   ;04AFA3|        |      ;
                       db $21,$73,$E4,$71,$E3,$21,$E4,$71   ;04AFAB|        |      ;
                       db $E3,$71,$E4,$71,$E3,$21,$E4,$71   ;04AFB3|        |      ;
                       db $E3,$71,$E4,$71,$E3,$01,$73,$E4   ;04AFBB|        |      ;
                       db $71,$E3,$01,$21,$31,$E4,$71,$A1   ;04AFC3|        |      ;
                       db $E3,$31,$51,$E4,$91,$E3,$01,$51   ;04AFCB|        |      ;
                       db $E8,$22,$23,$E6,$09,$E4,$73,$E3   ;04AFD3|        |      ;
                       db $03,$E6,$0C,$F3,$E3,$73,$DD,$73   ;04AFDB|        |      ;
                       db $2A,$15,$2C,$FF                   ;04AFE3|        |      ;
 
sndTra01_evergreen_68: db $D8,$B1,$28,$12,$EB,$6A,$31,$E3   ;04AFE7|        |      ;
                       db $A1,$E2,$01,$21,$E7,$27,$E8,$56   ;04AFEF|        |      ;
                       db $7D,$23,$03,$E3,$A3,$E8,$27,$E2   ;04AFF7|        |      ;
                       db $25,$00,$E3,$B0,$E2,$0B,$E3,$73   ;04AFFF|        |      ;
                       db $93,$A3,$A5,$51,$57,$43,$73,$93   ;04B007|        |      ;
                       db $A3,$E8,$45,$E2,$0D,$E8,$27,$E3   ;04B00F|        |      ;
                       db $A0,$E2,$00,$21,$E3,$21,$91,$21   ;04B017|        |      ;
                       db $E2,$21,$E3,$21,$E2,$01,$E3,$21   ;04B01F|        |      ;
                       db $D8,$B1,$28,$12,$EB,$6A,$31,$E3   ;04B027|        |      ;
                       db $A1,$E2,$01,$21,$E7,$27,$E8,$56   ;04B02F|        |      ;
                       db $7D,$23,$03,$E3,$A3,$E8,$27,$E2   ;04B037|        |      ;
                       db $25,$00,$E3,$B0,$E2,$0B,$E3,$73   ;04B03F|        |      ;
                       db $93,$A3,$A5,$51,$57,$43,$73,$93   ;04B047|        |      ;
                       db $A3,$E8,$45,$E2,$0D,$E8,$27,$E3   ;04B04F|        |      ;
                       db $A0,$E2,$00,$2B,$01,$21,$EB,$00   ;04B057|        |      ;
                       db $D8,$B7,$83,$34,$EB,$6B,$11,$E2   ;04B05F|        |      ;
                       db $35,$21,$E8,$45,$01,$E3,$A1,$91   ;04B067|        |      ;
                       db $71,$61,$21,$61,$91,$E2,$01,$E3   ;04B06F|        |      ;
                       db $91,$E2,$01,$31,$E8,$37,$23,$03   ;04B077|        |      ;
                       db $E3,$A3,$93,$E8,$11,$75,$90,$70   ;04B07F|        |      ;
                       db $E8,$34,$67,$D8,$B7,$83,$68,$EC   ;04B087|        |      ;
                       db $02,$E9,$B4,$E3,$71,$21,$71,$21   ;04B08F|        |      ;
                       db $91,$21,$71,$91,$A1,$21,$E2,$21   ;04B097|        |      ;
                       db $E3,$21,$E2,$01,$E3,$21,$A1,$21   ;04B09F|        |      ;
                       db $E8,$35,$EB,$6C,$11,$E8,$34,$E2   ;04B0A7|        |      ;
                       db $25,$E8,$46,$00,$E3,$B0,$E2,$01   ;04B0AF|        |      ;
                       db $E3,$01,$71,$E2,$01,$E3,$A1,$E4   ;04B0B7|        |      ;
                       db $A1,$E3,$31,$A1,$91,$01,$51,$91   ;04B0BF|        |      ;
                       db $D8,$B7,$83,$68,$EC,$02,$E9,$B4   ;04B0C7|        |      ;
                       db $E3,$71,$E2,$21,$71,$21,$91,$21   ;04B0CF|        |      ;
                       db $71,$91,$A1,$21,$E1,$21,$E2,$21   ;04B0D7|        |      ;
                       db $E1,$01,$E2,$21,$A1,$21,$E8,$23   ;04B0DF|        |      ;
                       db $EB,$6A,$11,$E1,$25,$E8,$34,$00   ;04B0E7|        |      ;
                       db $E2,$B0,$F1,$E1,$01,$F0,$D8,$B6   ;04B0EF|        |      ;
                       db $83,$46,$E2,$01,$71,$E1,$01,$E2   ;04B0F7|        |      ;
                       db $A1,$E3,$A1,$E2,$31,$A1,$91,$01   ;04B0FF|        |      ;
                       db $51,$91,$E8,$00,$73,$D9,$B2,$28   ;04B107|        |      ;
                       db $11,$EB,$6A,$21,$03,$23,$E6,$0C   ;04B10F|        |      ;
                       db $E3,$93,$E6,$0A,$B0,$90,$E7,$27   ;04B117|        |      ;
                       db $E6,$0C,$E8,$00,$BC,$FF           ;04B11F|        |      ;
 
sndTra02_evergreen_68: db $D8,$00,$E4,$7A,$C0,$73,$5B,$71   ;04B125|        |      ;
                       db $51,$4A,$C0,$43,$35,$A3,$E3,$71   ;04B12D|        |      ;
                       db $51,$31,$E4,$2F,$19,$E3,$13,$E4   ;04B135|        |      ;
                       db $11,$27,$97,$E3,$21,$E4,$91,$23   ;04B13D|        |      ;
                       db $43,$63,$D8,$16,$E4,$73,$73,$73   ;04B145|        |      ;
                       db $71,$71,$53,$53,$53,$53,$43,$43   ;04B14D|        |      ;
                       db $43,$41,$41,$33,$33,$33,$33,$23   ;04B155|        |      ;
                       db $23,$23,$23,$13,$13,$13,$13,$FB   ;04B15D|        |      ;
                       db $23,$FE,$06,$21,$91,$E3,$21,$11   ;04B165|        |      ;
                       db $D8,$09,$E3,$01,$01,$01,$01,$31   ;04B16D|        |      ;
                       db $31,$31,$31,$21,$21,$21,$21,$61   ;04B175|        |      ;
                       db $61,$61,$61,$D8,$17,$73,$53,$33   ;04B17D|        |      ;
                       db $23,$03,$E4,$93,$E3,$23,$E4,$23   ;04B185|        |      ;
                       db $D8,$00,$E4,$7F,$5D,$70,$50,$4F   ;04B18D|        |      ;
                       db $37,$57,$D8,$00,$E4,$7F,$5D,$70   ;04B195|        |      ;
                       db $50,$4F,$37,$57,$7D,$D4,$00,$E4   ;04B19D|        |      ;
                       db $70,$50,$40,$30,$20,$00,$E5,$A0   ;04B1A5|        |      ;
                       db $90,$DC,$00,$E5,$7E,$FF           ;04B1AD|        |      ;
 
sndTra05_evergreen_68: db $FF                               ;04B1B3|        |      ;
 
          CODE_04B1B4: LDA.B r_disablePlayer                ;04B1B4|A5C4    |0000C4;
                       ORA.B $C5                            ;04B1B6|05C5    |0000C5;
                       BNE CODE_04B1E4                      ;04B1B8|D02A    |04B1E4;
                       LDA.B r_partnerIdx                   ;04B1BA|A53B    |00003B;
                       EOR.B #$01                           ;04B1BC|4901    |      ;
                       TAY                                  ;04B1BE|A8      |      ;
                       LDA.W $0039,Y                        ;04B1BF|B93900  |040039;
                       BMI CODE_04B1E4                      ;04B1C2|3020    |04B1E4;
                       LDA.W $0565                          ;04B1C4|AD6505  |040565;
                       CMP.B #$2C                           ;04B1C7|C92C    |      ;
                       BEQ CODE_04B1E4                      ;04B1C9|F019    |04B1E4;
                       CMP.B #$2E                           ;04B1CB|C92E    |      ;
                       BEQ CODE_04B1E4                      ;04B1CD|F015    |04B1E4;
                       LDA.B r_roomOrientation              ;04B1CF|A568    |000068;
                       BMI CODE_04B1E0                      ;04B1D1|300D    |04B1E0;
                       JSR.W CODE_04B1E6                    ;04B1D3|20E6B1  |04B1E6;
                       LDA.B #$0B                           ;04B1D6|A90B    |      ;
 
          CODE_04B1D8: STA.B r_gameTransition               ;04B1D8|852A    |00002A;
                       LDA.B #$00                           ;04B1DA|A900    |      ;
                       STA.B r_menuSelectIdx                ;04B1DC|856B    |00006B;
                       SEC                                  ;04B1DE|38      |      ;
                       RTS                                  ;04B1DF|60      |      ;
 
 
          CODE_04B1E0: LDA.B #$0C                           ;04B1E0|A90C    |      ;
                       BNE CODE_04B1D8                      ;04B1E2|D0F4    |04B1D8;
 
          CODE_04B1E4: CLC                                  ;04B1E4|18      |      ;
                       RTS                                  ;04B1E5|60      |      ;
 
 
          CODE_04B1E6: LDA.B r_IRQFuncIdx                   ;04B1E6|A53F    |00003F;
                       STA.B r_partnerSwapDrawingBackup     ;04B1E8|85A6    |0000A6;
                       LDA.B r_IRQCmpVal                    ;04B1EA|A541    |000041;
                       STA.B r_partnerSwapDrawingIRQPointer ;04B1EC|85A7    |0000A7;
                       LDA.B r_scannlineTarget              ;04B1EE|A542    |000042;
                       STA.B $A8                            ;04B1F0|85A8    |0000A8;
                       LDA.B r_IRQStatus                    ;04B1F2|A540    |000040;
                       STA.B r_partnerSwapDrawingLatch      ;04B1F4|85A9    |0000A9;
                       LDA.B r_gameTransition               ;04B1F6|A52A    |00002A;
                       STA.B r_partnerSwapStateBackup       ;04B1F8|85AA    |0000AA;
                       RTS                                  ;04B1FA|60      |      ;
 
 
          CODE_04B1FB: JSR.W CODE_04B213                    ;04B1FB|2013B2  |04B213;
                       LDA.B r_partner                      ;04B1FE|A53A    |00003A;
                       CMP.B #$02                           ;04B200|C902    |      ;
                       BNE CODE_04B210                      ;04B202|D00C    |04B210;
                       LDY.B r_partnerIdx                   ;04B204|A43B    |00003B;
                       LDA.W yPosOffstStomething,Y          ;04B206|B911B2  |04B211;
                       CLC                                  ;04B209|18      |      ;
                       ADC.W r_entity_YPos                  ;04B20A|6D1C04  |00041C;
                       STA.W $041C                          ;04B20D|8D1C04  |04041C;
 
          CODE_04B210: RTS                                  ;04B210|60      |      ;
 
 
  yPosOffstStomething: db $04,$FC                           ;04B211|        |      ;
 
          CODE_04B213: LDY.B r_partner                      ;04B213|A43A    |00003A;
                       DEY                                  ;04B215|88      |      ;
                       TYA                                  ;04B216|98      |      ;
                       ASL A                                ;04B217|0A      |      ;
                       ASL A                                ;04B218|0A      |      ;
                       STA.B $00                            ;04B219|8500    |000000;
                       LDA.B r_partnerIdx                   ;04B21B|A53B    |00003B;
                       ASL A                                ;04B21D|0A      |      ;
                       CLC                                  ;04B21E|18      |      ;
                       ADC.B $00                            ;04B21F|6500    |000000;
                       TAY                                  ;04B221|A8      |      ;
                       LDA.W PTR16_04B269,Y                 ;04B222|B969B2  |04B269;
                       STA.B r_pointerQueue                 ;04B225|8508    |000008;
                       LDA.W PTR16_04B26A,Y                 ;04B227|B96AB2  |04B26A;
                       STA.B $09                            ;04B22A|8509    |000009;
                       LDA.W $0565                          ;04B22C|AD6505  |040565;
                       LSR A                                ;04B22F|4A      |      ;
                       TAY                                  ;04B230|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;04B231|B108    |000008;
                       STA.W $0565                          ;04B233|8D6505  |040565;
                       BEQ CODE_04B263                      ;04B236|F02B    |04B263;
                       CMP.B #$12                           ;04B238|C912    |      ;
                       BNE CODE_04B268                      ;04B23A|D02C    |04B268;
                       LDA.B #$00                           ;04B23C|A900    |      ;
                       STA.W $0413                          ;04B23E|8D1304  |040413;
                       STA.W $0630                          ;04B241|8D3006  |040630;
                       LDA.W $04A8                          ;04B244|ADA804  |0404A8;
                       BEQ CODE_04B250                      ;04B247|F007    |04B250;
                       LDA.W $05EF                          ;04B249|ADEF05  |0405EF;
                       BEQ CODE_04B257                      ;04B24C|F009    |04B257;
                       BNE CODE_04B25D                      ;04B24E|D00D    |04B25D;
 
          CODE_04B250: LDA.W $05EF                          ;04B250|ADEF05  |0405EF;
                       BNE CODE_04B257                      ;04B253|D002    |04B257;
                       BEQ CODE_04B25D                      ;04B255|F006    |04B25D;
 
          CODE_04B257: LDA.B #$0A                           ;04B257|A90A    |      ;
                       STA.W $0400                          ;04B259|8D0004  |040400;
                       RTS                                  ;04B25C|60      |      ;
 
 
          CODE_04B25D: LDA.B #$0C                           ;04B25D|A90C    |      ;
                       STA.W $0400                          ;04B25F|8D0004  |040400;
                       RTS                                  ;04B262|60      |      ;
 
 
          CODE_04B263: LDA.B #$02                           ;04B263|A902    |      ;
                       STA.W $0400                          ;04B265|8D0004  |040400;
 
          CODE_04B268: RTS                                  ;04B268|60      |      ;
 
 
         PTR16_04B269: dw DATA8_04B2B5                      ;04B269|        |04B2B5;
                       dw DATA8_04B2CF                      ;04B26B|        |04B2CF;
                       dw DATA8_04B275                      ;04B26D|        |04B275;
                       dw DATA8_04B28F                      ;04B26F|        |04B28F;
                       dw DATA8_04B2E9                      ;04B271|        |04B2E9;
                       dw DATA8_04B303                      ;04B273|        |04B303;
 
         DATA8_04B275: db $00,$02,$04,$00,$00,$0A,$00,$0E   ;04B275|        |      ;
                       db $10,$12,$14,$16,$00,$00,$00,$12   ;04B27D|        |      ;
                       db $00,$00,$12,$26,$28,$2A,$2C,$2E   ;04B285|        |      ;
                       db $00,$00                           ;04B28D|        |      ;
 
         DATA8_04B28F: db $00,$02,$04,$00,$00,$0A,$00,$0E   ;04B28F|        |      ;
                       db $10,$12,$14,$16,$00,$00,$00,$12   ;04B297|        |      ;
                       db $00,$00,$12,$26,$28,$2A,$2C,$2E   ;04B29F|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;04B2A7|        |      ;
                       db $00,$00,$00,$00,$00,$00           ;04B2AF|        |      ;
 
         DATA8_04B2B5: db $00,$02,$04,$06,$08,$0A,$0C,$0E   ;04B2B5|        |      ;
                       db $10,$12,$14,$16,$00,$00,$00,$12   ;04B2BD|        |      ;
                       db $00,$00,$12,$26,$28,$2A,$2C,$2E   ;04B2C5|        |      ;
                       db $00,$00                           ;04B2CD|        |      ;
 
         DATA8_04B2CF: db $00,$02,$04,$06,$08,$0A,$0C,$0E   ;04B2CF|        |      ;
                       db $10,$12,$14,$16,$00,$00,$00,$12   ;04B2D7|        |      ;
                       db $00,$00,$12,$26,$28,$2A,$2C,$2E   ;04B2DF|        |      ;
                       db $00,$00                           ;04B2E7|        |      ;
 
         DATA8_04B2E9: db $00,$02,$04,$06,$08,$0A,$0C,$0E   ;04B2E9|        |      ;
                       db $10,$12,$14,$16,$00,$00,$00,$12   ;04B2F1|        |      ;
                       db $00,$00,$12,$26,$28,$2A,$2C,$2E   ;04B2F9|        |      ;
                       db $00,$00                           ;04B301|        |      ;
 
         DATA8_04B303: db $00,$02,$04,$06,$08,$0A,$0C,$0E   ;04B303|        |      ;
                       db $10,$12,$14,$16,$00,$00,$00,$12   ;04B30B|        |      ;
                       db $00,$00,$12,$26,$28,$2A,$2C,$2E   ;04B313|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;04B31B|        |      ;
                       db $00,$00,$A5,$32,$0A,$A8,$B9,$AD   ;04B323|        |      ;
                       db $B3,$85,$08,$B9,$AE,$B3,$85,$09   ;04B32B|        |      ;
                       db $A4,$33,$B1,$08,$29,$0F,$85,$34   ;04B333|        |      ;
                       db $B1,$08,$4A,$4A,$4A,$4A,$85,$7F   ;04B33B|        |      ;
                       db $A9,$00,$85,$7E,$60               ;04B343|        |      ;
 
         DATA8_04B348: db $A5,$34,$48,$20,$25,$B3,$68,$85   ;04B348|        |      ;
                       db $34,$4C,$57,$B3                   ;04B350|        |      ;
 
         DATA8_04B354: db $20,$25,$B3,$20,$6B,$B3,$AD,$4E   ;04B354|        |      ;
                       db $05,$C9,$02,$D0,$09,$AD,$1C,$04   ;04B35C|        |      ;
                       db $18,$69,$04,$8D,$1C,$04,$60,$A5   ;04B364|        |      ;
                       db $32,$0A,$A8,$B9,$0B,$B4,$85,$08   ;04B36C|        |      ;
                       db $B9,$0C,$B4,$85,$09,$A5,$33,$0A   ;04B374|        |      ;
                       db $A8,$B1,$08,$85,$0A,$C8,$B1,$08   ;04B37C|        |      ;
                       db $85,$0B,$A5,$34,$0A,$A8,$B1,$0A   ;04B384|        |      ;
                       db $29,$F0,$8D,$38,$04,$B1,$0A,$0A   ;04B38C|        |      ;
                       db $0A,$0A,$0A,$8D,$1C,$04,$C8,$B1   ;04B394|        |      ;
                       db $0A,$85,$57,$A0,$00,$84,$56,$AD   ;04B39C|        |      ;
                       db $38,$04,$10,$01,$C8,$8C,$A8,$04   ;04B3A4|        |      ;
                       db $60,$CB,$B3,$CF,$B3,$D5,$B3,$DA   ;04B3AC|        |      ;
                       db $B3,$DF,$B3,$E2,$B3,$E6,$B3,$E9   ;04B3B4|        |      ;
                       db $B3,$F0,$B3,$F5,$B3,$F7,$B3,$FE   ;04B3BC|        |      ;
                       db $B3,$01,$B4,$04,$B4,$08,$B4       ;04B3C4|        |      ;
                       db $50,$40,$31,$20,$40,$30,$20,$42   ;04B3CB|        |04B40D;
                       db $32,$22,$30,$20,$10,$32,$21,$42   ;04B3D3|        |000022;
                       db $30,$20,$30,$22,$40,$30,$20,$50   ;04B3DB|        |04B3FD;
                       db $40,$31,$21,$41,$30,$22,$61,$50   ;04B3E3|        |      ;
                       db $50,$40,$30,$20,$20,$41,$30,$20   ;04B3EB|        |04B42D;
                       db $20,$10,$30,$20,$50,$40,$30,$20   ;04B3F3|        |043010;
                       db $50,$40,$30,$50,$40,$32,$40,$30   ;04B3FB|        |04B43D;
                       db $20,$50,$40,$30,$20,$32,$20,$30   ;04B403|        |044050;
                       db $29,$B4,$31,$B4,$3D,$B4,$47,$B4   ;04B40B|        |      ;
                       db $51,$B4,$57,$B4,$5F,$B4,$65,$B4   ;04B413|        |0000B4;
                       db $73,$B4,$7D,$B4,$81,$B4,$8F,$B4   ;04B41B|        |0000B4;
                       db $95,$B4,$9B,$B4,$A3,$B4,$A9,$B4   ;04B423|        |0000B4;
                       db $AB,$B4,$B3,$B4,$B7,$B4,$B9,$B4   ;04B42B|        |      ;
                       db $BF,$B4,$C5,$B4,$CB,$B4,$D1,$B4   ;04B433|        |B4C5B4;
                       db $D7,$B4,$DD,$B4,$E1,$B4,$E3,$B4   ;04B43B|        |0000B4;
                       db $E7,$B4,$ED,$B4,$F1,$B4,$F7,$B4   ;04B443|        |0000B4;
                       db $FB,$B4,$FF,$B4,$03,$B5,$09,$B5   ;04B44B|        |      ;
                       db $0F,$B5,$15,$B5,$1B,$B5,$1D,$B5   ;04B453|        |B515B5;
                       db $1F,$B5,$23,$B5,$27,$B5,$2B,$B5   ;04B45B|        |B523B5;
                       db $2D,$B5,$33,$B5,$37,$B5,$39,$B5   ;04B463|        |0433B5;
                       db $3B,$B5,$3D,$B5,$41,$B5,$45,$B5   ;04B46B|        |      ;
                       db $47,$B5,$4B,$B5,$4D,$B5,$51,$B5   ;04B473|        |0000B5;
                       db $53,$B5,$55,$B5,$59,$B5,$5F,$B5   ;04B47B|        |0000B5;
                       db $63,$B5,$65,$B5,$67,$B5,$6B,$B5   ;04B483|        |0000B5;
                       db $71,$B5,$75,$B5,$7B,$B5,$7F,$B5   ;04B48B|        |0000B5;
                       db $83,$B5,$89,$B5,$8D,$B5,$91,$B5   ;04B493|        |0000B5;
                       db $93,$B5,$99,$B5,$9F,$B5,$A5,$B5   ;04B49B|        |0000B5;
                       db $A9,$B5,$AF,$B5,$B3,$B5,$2C,$00   ;04B4A3|        |      ;
                       db $2B,$00,$3A,$00,$5A,$00,$4B,$00   ;04B4AB|        |      ;
                       db $88,$00,$39,$00,$3B,$00,$3A,$00   ;04B4B3|        |      ;
                       db $7A,$01,$8B,$00,$4B,$00,$29,$00   ;04B4BB|        |      ;
                       db $99,$00,$29,$00,$C6,$00,$C9,$01   ;04B4C3|        |042900;
                       db $54,$00,$24,$00,$29,$01,$4B,$00   ;04B4CB|        |      ;
                       db $29,$00,$99,$00,$3A,$00,$7A,$01   ;04B4D3|        |      ;
                       db $E7,$01,$2B,$00,$2A,$02,$4B,$00   ;04B4DB|        |000001;
                       db $2B,$00,$8A,$00,$E5,$00,$85,$00   ;04B4E3|        |      ;
                       db $2B,$00,$49,$00,$E9,$03,$45,$00   ;04B4EB|        |      ;
                       db $45,$00,$87,$00,$29,$00,$7B,$00   ;04B4F3|        |000000;
                       db $E7,$03,$C7,$00,$2B,$00,$7B,$00   ;04B4FB|        |000003;
                       db $48,$00,$46,$00,$29,$00,$39,$00   ;04B503|        |      ;
                       db $8A,$00,$8B,$00,$28,$00,$2A,$00   ;04B50B|        |      ;
                       db $8B,$01,$E7,$00,$CA,$00,$4A,$00   ;04B513|        |      ;
                       db $3B,$00,$27,$00,$27,$00,$27,$00   ;04B51B|        |      ;
                       db $27,$00,$47,$00,$29,$00,$29,$00   ;04B523|        |000000;
                       db $29,$00,$29,$00,$47,$00,$29,$00   ;04B52B|        |      ;
                       db $46,$00,$29,$00,$26,$00,$26,$00   ;04B533|        |000000;
                       db $25,$00,$25,$00,$3B,$00,$2B,$00   ;04B53B|        |000000;
                       db $8B,$01,$E9,$04,$E7,$01,$E7,$04   ;04B543|        |      ;
                       db $E9,$04,$E9,$03,$5A,$00,$2B,$00   ;04B54B|        |      ;
                       db $89,$04,$E9,$02,$9B,$02,$D9,$01   ;04B553|        |      ;
                       db $3A,$00,$8B,$00,$3B,$00,$4B,$00   ;04B55B|        |      ;
                       db $E7,$01,$F7,$00,$E7,$02,$85,$00   ;04B563|        |000001;
                       db $8A,$00,$9B,$00,$8B,$01,$E7,$02   ;04B56B|        |      ;
                       db $E9,$02,$E9,$00,$E9,$00,$8B,$00   ;04B573|        |      ;
                       db $27,$00,$47,$00,$27,$00,$89,$00   ;04B57B|        |000000;
                       db $88,$00,$44,$00,$27,$00,$2C,$00   ;04B583|        |      ;
                       db $4A,$00,$2A,$00,$6C,$00,$8C,$00   ;04B58B|        |      ;
                       db $2B,$00,$AB,$00,$88,$00,$EB,$01   ;04B593|        |      ;
                       db $D8,$00,$2B,$00,$2B,$00,$2A,$00   ;04B59B|        |      ;
                       db $6A,$00,$EA,$02,$EB,$02,$E8,$01   ;04B5A3|        |      ;
                       db $24,$00,$E7,$01,$E8,$01,$AC,$02   ;04B5AB|        |000000;
                       db $E7,$01,$88,$01                   ;04B5B3|        |000001;
 
       UNREACH_04B5B7: db $A5,$1F,$29,$03,$85,$09,$A5,$32   ;04B5B7|        |00001F;
                       db $0A,$0A,$18,$65,$09,$A8,$B9,$CC   ;04B5BF|        |      ;
                       db $B5,$9D,$4E,$05,$60,$95,$93,$93   ;04B5C7|        |00009D;
                       db $97,$93,$95,$97,$95,$93,$97,$93   ;04B5CF|        |000093;
                       db $95,$93,$95,$93,$95,$93,$95,$97   ;04B5D7|        |000093;
                       db $95,$95,$95,$97,$95,$95,$95,$97   ;04B5DF|        |000095;
                       db $95,$97,$95,$93,$95,$97,$95,$93   ;04B5E7|        |000097;
                       db $93,$97,$95,$93,$93,$94,$96,$93   ;04B5EF|        |000097;
                       db $94,$97,$97,$93,$95,$97,$94,$96   ;04B5F7|        |000097;
                       db $93,$97,$97,$93,$95,$93,$96,$95   ;04B5FF|        |000097;
                       db $97,$97,$93,$95,$96               ;04B607|        |000097;
 
            stopWatch: LDY.W r_entity_AI_idx,X              ;04B60C|BCEF05  |0005EF;
                       LDA.W r_entity_script_idx,X          ;04B60F|BDC105  |0005C1;
                       CMP.W enemyStopWatchEffect,Y         ;04B612|D916B6  |04B616;
                       RTS                                  ;04B615|60      |      ;
 
 
 enemyStopWatchEffect: db $FF,$01,$03,$01,$01,$01,$01,$03   ;04B616|        |      ;
                       db $02,$01,$01,$01,$01,$01,$03,$01   ;04B61E|        |      ;
                       db $01,$01,$02,$01,$00,$00,$01,$02   ;04B626|        |      ;
                       db $FF,$FF,$FF,$FF,$01,$00,$02,$FF   ;04B62E|        |      ;
                       db $FF,$02,$01,$02,$02,$03,$01,$02   ;04B636|        |      ;
                       db $01,$02,$FF,$01,$01,$01,$01,$02   ;04B63E|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04B646|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04B64E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04B656|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04B65E|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04B666|        |FFFFFF;
                       db $01,$01,$01,$01,$01,$02,$01,$01   ;04B66E|        |000001;
                       db $FF,$FF,$01,$03,$01,$03,$03,$FF   ;04B676|        |0301FF;
                       db $02,$04,$01,$FF,$FF,$03,$03,$01   ;04B67E|        |      ;
                       db $01,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04B686|        |0000FF;
 
       UNREACH_04B68E: db $38,$BD,$4E,$05,$E9,$40,$A8,$B9   ;04B68E|        |      ;
                       db $A1,$B6,$9D,$EF,$05,$A9,$68,$9D   ;04B696|        |0000B6;
                       db $4E,$05,$60,$18,$18,$18,$18,$18   ;04B69E|        |046005;
                       db $18,$18,$18,$18,$18,$18,$18,$18   ;04B6A6|        |      ;
                       db $18,$1A,$18,$20,$18,$18,$18,$18   ;04B6AE|        |      ;
                       db $18,$18,$18,$18,$61,$19,$1A,$18   ;04B6B6|        |      ;
                       db $18,$23,$18,$18,$18,$18,$18,$18   ;04B6BE|        |      ;
                       db $18,$18,$18,$18,$18,$18,$18,$18   ;04B6C6|        |      ;
                       db $18,$18,$18,$00,$01,$01,$00,$03   ;04B6CE|        |      ;
                       db $01,$02,$02,$01,$01,$02,$02,$03   ;04B6D6|        |000002;
                       db $05,$04,$01,$00,$07,$00,$04,$03   ;04B6DE|        |000004;
                       db $02,$01,$03,$00,$02,$02,$04,$01   ;04B6E6|        |      ;
                       db $02,$00,$00,$50,$00,$00,$50,$00   ;04B6EE|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;04B6F6|        |      ;
                       db $00,$00,$00,$50,$00,$50,$00,$00   ;04B6FE|        |      ;
                       db $00,$00,$00,$50,$00,$00,$00,$00   ;04B706|        |      ;
                       db $00,$00,$00                       ;04B70E|        |      ;
 
       UNREACH_04B711: db $BD,$4E,$05,$C9,$48,$90,$17,$38   ;04B711|        |04054E;
                       db $E9,$48,$A8,$B9,$D1,$B6,$85,$02   ;04B719|        |      ;
                       db $B9,$F1,$B6,$85,$01,$A9,$00,$85   ;04B721|        |04B6F1;
                       db $03,$20,$77,$E7,$A6,$6C,$60       ;04B729|        |000020;
 
       UNREACH_04B730: db $BD,$70,$04,$29,$01,$D0,$07,$BD   ;04B730|        |040470;
                       db $70,$04,$29,$08,$F0,$44,$BD,$70   ;04B738|        |04B73E;
                       db $04,$09,$80,$9D,$70,$04,$20,$DA   ;04B740|        |000009;
                       db $B8,$F0,$04,$E0,$0D,$B0,$3B,$BD   ;04B748|        |      ;
                       db $70,$04,$29,$01,$F0,$34,$BD,$4E   ;04B750|        |04B756;
                       db $05,$C9,$90,$B0,$0F,$20,$AD,$B7   ;04B758|        |0000C9;
                       db $90,$28,$BD,$70,$04,$29,$04,$F0   ;04B760|        |04B78A;
                       db $03,$20,$3E,$B8,$BD,$4E,$05,$C9   ;04B768|        |000020;
                       db $5D,$F0,$18,$A9,$00,$9D,$4E,$05   ;04B770|        |0418F0;
                       db $9D,$70,$04,$9D,$00,$04,$9D,$EF   ;04B778|        |040470;
                       db $05,$60,$BD,$70,$04,$29,$7F,$9D   ;04B780|        |000060;
                       db $70,$04,$60,$BD,$1D,$06,$AA,$BD   ;04B788|        |04B78E;
                       db $70,$04,$29,$81,$F0,$03,$20,$9B   ;04B790|        |04B796;
                       db $B7,$A6,$6C,$A9,$00,$9D,$57,$06   ;04B798|        |0000A6;
                       db $9D,$70,$04,$9D,$C1,$05,$9D,$00   ;04B7A0|        |040470;
                       db $04,$9D,$4E,$05,$60,$C9,$40,$90   ;04B7A8|        |00009D;
                       db $47,$C9,$77,$B0,$43,$38,$E9,$40   ;04B7B0|        |0000C9;
                       db $A8,$B9,$06,$B8,$F0,$46,$C9,$02   ;04B7B8|        |      ;
                       db $F0,$25,$BD,$38,$04,$C9,$E0,$B0   ;04B7C0|        |04B7E7;
                       db $04,$C9,$20,$B0,$12,$BD,$70,$04   ;04B7C8|        |0000C9;
                       db $29,$02,$D0,$13,$BD,$70,$04,$09   ;04B7D0|        |      ;
                       db $40,$9D,$70,$04,$4C,$E7,$B7,$BD   ;04B7D8|        |      ;
                       db $70,$04,$29,$BF,$9D,$70,$04,$BD   ;04B7E0|        |04B7E6;
                       db $4E,$05,$C9,$59,$F0,$0C,$BD,$38   ;04B7E8|        |04C905;
                       db $04,$C9,$D0,$B0,$03,$C9,$31,$60   ;04B7F0|        |0000C9;
                       db $18,$60,$BD,$38,$04,$C9,$C0,$B0   ;04B7F8|        |      ;
                       db $F7,$C9,$41,$60,$38,$60,$00,$00   ;04B800|        |0000C9;
                       db $00,$00,$00,$00,$00,$00,$00,$02   ;04B808|        |      ;
                       db $02,$00,$02,$01,$01,$02,$02,$00   ;04B810|        |      ;
                       db $02,$02,$01,$01,$01,$01,$02,$02   ;04B818|        |      ;
                       db $01,$01,$01,$02,$02,$02,$02,$02   ;04B820|        |000001;
                       db $01,$01,$01,$02,$02,$02,$02,$02   ;04B828|        |000001;
                       db $02,$02,$02,$02,$02,$02,$02,$02   ;04B830|        |      ;
                       db $02,$02,$02,$02,$02,$02,$BD,$45   ;04B838|        |      ;
                       db $06,$AA,$A9,$03,$BC,$C2,$07,$C0   ;04B840|        |0000AA;
                       db $18,$F0,$06,$C0,$4B,$F0,$02,$A9   ;04B848|        |      ;
                       db $02,$9D,$C8,$07,$A6,$6C,$60       ;04B850|        |      ;
 
       UNREACH_04B857: db $BD,$4E,$05,$C9,$40,$90,$0E,$C9   ;04B857|        |04054E;
                       db $76,$B0,$0A,$BD,$1C,$04,$C9,$F8   ;04B85F|        |0000B0;
                       db $90,$03,$4C,$6C,$B7,$60           ;04B867|        |04B86C;
 
       UNREACH_04B86D: db $BD,$4E,$05,$4A,$90,$07,$A8,$B9   ;04B86D|        |04054E;
                       db $89,$B8,$29,$0F,$60,$A8,$B9,$89   ;04B875|        |      ;
                       db $B8,$4A,$4A,$4A,$4A,$60           ;04B87D|        |      ;
 
       UNREACH_04B883: db $02,$04,$06,$08,$10,$18,$45,$34   ;04B883|        |      ;
                       db $44,$44,$24,$44,$44,$44,$44,$44   ;04B88B|        |      ;
                       db $44,$44,$44,$44,$44,$44,$44,$04   ;04B893|        |      ;
                       db $44,$44,$44,$44,$44,$44,$44,$44   ;04B89B|        |      ;
                       db $44,$44,$44,$44,$44,$44,$11,$12   ;04B8A3|        |      ;
                       db $04,$44,$42,$13,$34,$43,$44,$32   ;04B8AB|        |000044;
                       db $44,$44,$43,$44,$43,$34,$43,$44   ;04B8B3|        |      ;
                       db $34,$44,$44,$44,$44,$44,$44,$44   ;04B8BB|        |000044;
                       db $44,$44,$42,$34,$41,$43,$44,$34   ;04B8C3|        |      ;
                       db $44,$33,$34,$34,$44,$44           ;04B8CB|        |      ;
 
       UNREACH_04B8D1: db $10,$10,$0C,$10,$10,$10,$0C,$10   ;04B8D1|        |04B8E3;
                       db $04,$A5,$32,$C9,$0E,$D0,$0A,$A5   ;04B8D9|        |0000A5;
                       db $33,$C9,$01,$D0,$04,$A5,$34,$C9   ;04B8E1|        |0000C9;
                       db $01,$60                           ;04B8E9|        |000060;
 
          CODE_04B8EB: LDX.B #$01                           ;04B8EB|A201    |      ;
 
          CODE_04B8ED: LDA.W $054E,X                        ;04B8ED|BD4E05  |04054E;
                       BEQ CODE_04B8FD                      ;04B8F0|F00B    |04B8FD;
                       CMP.B #$6C                           ;04B8F2|C96C    |      ;
                       BEQ CODE_04B904                      ;04B8F4|F00E    |04B904;
                       LDA.W $0470,X                        ;04B8F6|BD7004  |040470;
                       AND.B #$02                           ;04B8F9|2902    |      ;
                       BNE CODE_04B904                      ;04B8FB|D007    |04B904;
 
          CODE_04B8FD: INX                                  ;04B8FD|E8      |      ;
                       CPX.B #$0D                           ;04B8FE|E00D    |      ;
                       BCC CODE_04B8ED                      ;04B900|90EB    |04B8ED;
                       CLC                                  ;04B902|18      |      ;
                       RTS                                  ;04B903|60      |      ;
 
 
          CODE_04B904: SEC                                  ;04B904|38      |      ;
                       RTS                                  ;04B905|60      |      ;
 
 
          CODE_04B906: LDA.W $0470,X                        ;04B906|BD7004  |040470;
                       AND.B #$FE                           ;04B909|29FE    |      ;
                       STA.B $01                            ;04B90B|8501    |000001;
                       LDY.B #$00                           ;04B90D|A000    |      ;
                       LDA.B r_scrollSpd                    ;04B90F|A56E    |00006E;
                       BPL CODE_04B914                      ;04B911|1001    |04B914;
                       DEY                                  ;04B913|88      |      ;
 
          CODE_04B914: STY.B $00                            ;04B914|8400    |000000;
                       LDA.B r_roomOrientation              ;04B916|A568    |000068;
                       BMI CODE_04B932                      ;04B918|3018    |04B932;
                       SEC                                  ;04B91A|38      |      ;
                       LDA.W $0438,X                        ;04B91B|BD3804  |040438;
                       SBC.B r_scrollSpd                    ;04B91E|E56E    |00006E;
                       STA.W $0438,X                        ;04B920|9D3804  |040438;
                       LDA.W $0470,X                        ;04B923|BD7004  |040470;
                       AND.B #$01                           ;04B926|2901    |      ;
                       SBC.B $00                            ;04B928|E500    |000000;
                       AND.B #$01                           ;04B92A|2901    |      ;
                       ORA.B $01                            ;04B92C|0501    |000001;
                       STA.W $0470,X                        ;04B92E|9D7004  |040470;
                       RTS                                  ;04B931|60      |      ;
 
 
          CODE_04B932: AND.B #$01                           ;04B932|2901    |      ;
                       BNE CODE_04B965                      ;04B934|D02F    |04B965;
                       CLC                                  ;04B936|18      |      ;
                       LDA.W $041C,X                        ;04B937|BD1C04  |04041C;
                       ADC.B r_scrollSpd                    ;04B93A|656E    |00006E;
                       STA.W $041C,X                        ;04B93C|9D1C04  |04041C;
                       LDA.W $0470,X                        ;04B93F|BD7004  |040470;
                       AND.B #$01                           ;04B942|2901    |      ;
                       ADC.B $00                            ;04B944|6500    |000000;
                       AND.B #$01                           ;04B946|2901    |      ;
                       ORA.B $01                            ;04B948|0501    |000001;
                       STA.W $0470,X                        ;04B94A|9D7004  |040470;
                       AND.B #$01                           ;04B94D|2901    |      ;
                       BEQ CODE_04B983                      ;04B94F|F032    |04B983;
 
          CODE_04B951: LDA.W $054E,X                        ;04B951|BD4E05  |04054E;
                       CMP.B #$90                           ;04B954|C990    |      ;
                       BCS CODE_04B95C                      ;04B956|B004    |04B95C;
                       CMP.B #$78                           ;04B958|C978    |      ;
                       BCS CODE_04B964                      ;04B95A|B008    |04B964;
 
          CODE_04B95C: LDA.B #$00                           ;04B95C|A900    |      ;
                       STA.W $054E,X                        ;04B95E|9D4E05  |04054E;
                       STA.W $0400,X                        ;04B961|9D0004  |040400;
 
          CODE_04B964: RTS                                  ;04B964|60      |      ;
 
 
          CODE_04B965: CLC                                  ;04B965|18      |      ;
                       LDA.W $041C,X                        ;04B966|BD1C04  |04041C;
                       ADC.B r_scrollSpd                    ;04B969|656E    |00006E;
                       STA.W $041C,X                        ;04B96B|9D1C04  |04041C;
                       LDA.W $0470,X                        ;04B96E|BD7004  |040470;
                       AND.B #$01                           ;04B971|2901    |      ;
                       ADC.B $00                            ;04B973|6500    |000000;
                       AND.B #$01                           ;04B975|2901    |      ;
                       ORA.B $01                            ;04B977|0501    |000001;
                       STA.W $0470,X                        ;04B979|9D7004  |040470;
                       LDA.W $041C,X                        ;04B97C|BD1C04  |04041C;
                       CMP.B #$30                           ;04B97F|C930    |      ;
                       BCC CODE_04B951                      ;04B981|90CE    |04B951;
 
          CODE_04B983: LDA.B r_scrollSpd                    ;04B983|A56E    |00006E;
                       BEQ CODE_04B9AB                      ;04B985|F024    |04B9AB;
                       LDA.W $054E,X                        ;04B987|BD4E05  |04054E;
                       CMP.B #$4B                           ;04B98A|C94B    |      ;
                       BNE CODE_04B9AB                      ;04B98C|D01D    |04B9AB;
                       LDY.B #$00                           ;04B98E|A000    |      ;
                       LDA.B r_roomOrientation              ;04B990|A568    |000068;
                       AND.B #$01                           ;04B992|2901    |      ;
                       BEQ CODE_04B998                      ;04B994|F002    |04B998;
                       LDY.B #$FF                           ;04B996|A0FF    |      ;
 
          CODE_04B998: STY.B $04                            ;04B998|8404    |000004;
                       CLC                                  ;04B99A|18      |      ;
                       LDA.W $0606,X                        ;04B99B|BD0606  |040606;
                       ADC.B r_scrollSpd                    ;04B99E|656E    |00006E;
                       STA.W $0606,X                        ;04B9A0|9D0606  |040606;
                       LDA.W $061D,X                        ;04B9A3|BD1D06  |04061D;
                       ADC.B $04                            ;04B9A6|6504    |000004;
                       STA.W $061D,X                        ;04B9A8|9D1D06  |04061D;
 
          CODE_04B9AB: RTS                                  ;04B9AB|60      |      ;
 
 
          CODE_04B9AC: LDA.B r_bossSpecialHitbox            ;04B9AC|A5BA    |0000BA;
                       CMP.B #$FF                           ;04B9AE|C9FF    |      ;
                       BEQ CODE_04BA28                      ;04B9B0|F076    |04BA28;
                       LDA.W $054E,X                        ;04B9B2|BD4E05  |04054E;
                       STA.B $09                            ;04B9B5|8509    |000009;
                       LDA.B r_bossSpecialHitbox            ;04B9B7|A5BA    |0000BA;
                       STA.B r_pointerQueue                 ;04B9B9|8508    |000008;
                       LDY.B #$00                           ;04B9BB|A000    |      ;
 
          CODE_04B9BD: LSR.B r_pointerQueue                 ;04B9BD|4608    |000008;
                       BCC CODE_04B9C8                      ;04B9BF|9007    |04B9C8;
                       LDA.W DATA8_04BA3E,Y                 ;04B9C1|B93EBA  |04BA3E;
                       CMP.B $09                            ;04B9C4|C509    |000009;
                       BEQ CODE_04B9D1                      ;04B9C6|F009    |04B9D1;
 
          CODE_04B9C8: BEQ CODE_04BA26                      ;04B9C8|F05C    |04BA26;
                       INY                                  ;04B9CA|C8      |      ;
                       CPY.B #$08                           ;04B9CB|C008    |      ;
                       BNE CODE_04B9BD                      ;04B9CD|D0EE    |04B9BD;
                       BEQ CODE_04BA26                      ;04B9CF|F055    |04BA26;
 
          CODE_04B9D1: TYA                                  ;04B9D1|98      |      ;
                       ASL A                                ;04B9D2|0A      |      ;
                       TAY                                  ;04B9D3|A8      |      ;
                       LDA.W PTR16_04BA59,Y                 ;04B9D4|B959BA  |04BA59;
                       STA.B r_pointerQueue                 ;04B9D7|8508    |000008;
                       LDA.W PTR16_04BA5A,Y                 ;04B9D9|B95ABA  |04BA5A;
                       STA.B $09                            ;04B9DC|8509    |000009;
                       LDA.B r_bossDopplegangerHitbox       ;04B9DE|A5BC    |0000BC;
                       ASL A                                ;04B9E0|0A      |      ;
                       TAY                                  ;04B9E1|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;04B9E2|B108    |000008;
                       STA.B r_temp_Xpos                    ;04B9E4|850A    |00000A;
                       INY                                  ;04B9E6|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;04B9E7|B108    |000008;
                       STA.B $0B                            ;04B9E9|850B    |00000B;
                       LDA.B #$00                           ;04B9EB|A900    |      ;
                       STA.B r_tempCurrGroup                ;04B9ED|850C    |00000C;
                       STA.B r_tempCurrSection              ;04B9EF|850D    |00000D;
                       LDY.B r_bossMeleeHitbox              ;04B9F1|A4BB    |0000BB;
                       BEQ CODE_04BA16                      ;04B9F3|F021    |04BA16;
                       DEY                                  ;04B9F5|88      |      ;
                       LDA.W DATA8_04BA46,Y                 ;04B9F6|B946BA  |04BA46;
                       CMP.W $054E,X                        ;04B9F9|DD4E05  |04054E;
                       BNE CODE_04BA16                      ;04B9FC|D018    |04BA16;
                       TYA                                  ;04B9FE|98      |      ;
                       ASL A                                ;04B9FF|0A      |      ;
                       TAY                                  ;04BA00|A8      |      ;
                       LDA.W DATA8_04BA4D,Y                 ;04BA01|B94DBA  |04BA4D;
                       STA.B r_tempCurrGroup                ;04BA04|850C    |00000C;
                       LDA.W $04A8,X                        ;04BA06|BDA804  |0404A8;
                       BNE CODE_04BA11                      ;04BA09|D006    |04BA11;
                       LDA.B r_tempCurrGroup                ;04BA0B|A50C    |00000C;
                       EOR.B #$FF                           ;04BA0D|49FF    |      ;
                       STA.B r_tempCurrGroup                ;04BA0F|850C    |00000C;
 
          CODE_04BA11: LDA.W DATA8_04BA4E,Y                 ;04BA11|B94EBA  |04BA4E;
                       STA.B r_tempCurrSection              ;04BA14|850D    |00000D;
 
          CODE_04BA16: CLC                                  ;04BA16|18      |      ;
                       LDA.B r_temp_Xpos                    ;04BA17|A50A    |00000A;
                       ADC.B $00                            ;04BA19|6500    |000000;
                       STA.B $02                            ;04BA1B|8502    |000002;
                       CLC                                  ;04BA1D|18      |      ;
                       LDA.B $0B                            ;04BA1E|A50B    |00000B;
                       ADC.B $01                            ;04BA20|6501    |000001;
                       STA.B $03                            ;04BA22|8503    |000003;
                       SEC                                  ;04BA24|38      |      ;
                       RTS                                  ;04BA25|60      |      ;
 
 
          CODE_04BA26: CLC                                  ;04BA26|18      |      ;
                       RTS                                  ;04BA27|60      |      ;
 
 
          CODE_04BA28: LDY.W $0606,X                        ;04BA28|BC0606  |040606;
                       LDA.W DATA8_04BA8E,Y                 ;04BA2B|B98EBA  |04BA8E;
                       STA.B r_temp_Xpos                    ;04BA2E|850A    |00000A;
                       LDA.W DATA8_04BA92,Y                 ;04BA30|B992BA  |04BA92;
                       STA.B $0B                            ;04BA33|850B    |00000B;
                       LDA.B #$00                           ;04BA35|A900    |      ;
                       STA.B r_tempCurrGroup                ;04BA37|850C    |00000C;
                       STA.B r_tempCurrSection              ;04BA39|850D    |00000D;
                       JMP.W CODE_04BA16                    ;04BA3B|4C16BA  |04BA16;
 
 
         DATA8_04BA3E: db $0D,$29,$0C,$08,$00,$00,$0F,$00   ;04BA3E|        |      ;
 
         DATA8_04BA46: db $0F,$0F,$0F,$0F,$0C,$08,$00       ;04BA46|        |      ;
 
         DATA8_04BA4D: db $1C                               ;04BA4D|        |      ;
 
         DATA8_04BA4E: db $00,$1C,$00,$24,$00,$14,$00,$00   ;04BA4E|        |      ;
                       db $10,$00,$08                       ;04BA56|        |      ;
 
         PTR16_04BA59: dw DATA8_04BA69                      ;04BA59|        |04BA69;
                       dw DATA8_04BA6D                      ;04BA5B|        |04BA6D;
                       dw DATA8_04BA71                      ;04BA5D|        |04BA71;
                       dw DATA8_04BA73                      ;04BA5F|        |04BA73;
                       dw DATA8_04BA75                      ;04BA61|        |04BA75;
                       dw DATA8_04BA78                      ;04BA63|        |04BA78;
                       dw DATA8_04BA86                      ;04BA65|        |04BA86;
                       dw DATA8_04BA8C                      ;04BA67|        |04BA8C;
 
         DATA8_04BA69: db $08,$10,$08,$08                   ;04BA69|        |      ;
 
         DATA8_04BA6D: db $04,$08,$04,$06                   ;04BA6D|        |      ;
 
         DATA8_04BA71: db $12,$24                           ;04BA71|        |      ;
 
         DATA8_04BA73: db $08,$08                           ;04BA73|        |      ;
 
         DATA8_04BA75: db $00,$00,$00                       ;04BA75|        |      ;
 
         DATA8_04BA78: db $08,$08,$08,$08,$08,$08,$08,$08   ;04BA78|        |      ;
                       db $08,$08,$08,$08,$08,$08           ;04BA80|        |      ;
 
         DATA8_04BA86: db $0C,$04,$0C,$06,$14,$06           ;04BA86|        |      ;
 
         DATA8_04BA8C: db $08,$04                           ;04BA8C|        |      ;
 
         DATA8_04BA8E: db $18,$10,$08,$06                   ;04BA8E|        |      ;
 
         DATA8_04BA92: db $10,$10,$08,$06                   ;04BA92|        |      ;
 
          CODE_04BA96: LDA.B #$00                           ;04BA96|A900    |      ;
                       STA.W $067B,X                        ;04BA98|9D7B06  |04067B;
                       db $20                               ;04BA9B|        |      ;
                       dw CODE_0FE6B5                       ;04BA9C|        |0FE6B5;
                       TXA                                  ;04BA9E|8A      |      ;
                       PHA                                  ;04BA9F|48      |      ;
                       LDA.B #$65                           ;04BAA0|A965    |      ;
                       JSR.W CODE_04BABB                    ;04BAA2|20BBBA  |04BABB;
                       LDX.B #$01                           ;04BAA5|A201    |      ;
 
          CODE_04BAA7: LDA.W $054E,X                        ;04BAA7|BD4E05  |04054E;
                       CMP.B #$04                           ;04BAAA|C904    |      ;
                       BNE CODE_04BAB1                      ;04BAAC|D003    |04BAB1;
                       JSR.W CODE_04BAB9                    ;04BAAE|20B9BA  |04BAB9;
 
          CODE_04BAB1: INX                                  ;04BAB1|E8      |      ;
                       CPX.B #$0D                           ;04BAB2|E00D    |      ;
                       BCC CODE_04BAA7                      ;04BAB4|90F1    |04BAA7;
                       PLA                                  ;04BAB6|68      |      ;
                       TAX                                  ;04BAB7|AA      |      ;
                       RTS                                  ;04BAB8|60      |      ;
 
 
          CODE_04BAB9: LDA.B #$18                           ;04BAB9|A918    |      ;
 
          CODE_04BABB: STA.W $05EF,X                        ;04BABB|9DEF05  |0405EF;
                       LDA.B #$68                           ;04BABE|A968    |      ;
                       STA.W $054E,X                        ;04BAC0|9D4E05  |04054E;
                       LDA.B #$00                           ;04BAC3|A900    |      ;
                       STA.W $0400,X                        ;04BAC5|9D0004  |040400;
                       STA.W $048C,X                        ;04BAC8|9D8C04  |04048C;
                       STA.W $05C1,X                        ;04BACB|9DC105  |0405C1;
                       LDA.B #$30                           ;04BACE|A930    |      ;
                       STA.W $0470,X                        ;04BAD0|9D7004  |040470;
                       RTS                                  ;04BAD3|60      |      ;
 
 
RLE_tilemap_0b_prayerScreen: dw $2000                             ;04BAD4|        |      ;
                       db $40,$00,$06,$3D,$81,$54,$07,$00   ;04BAD6|        |      ;
                       db $84,$47,$6B,$68,$6D,$09,$00,$0B   ;04BADE|        |      ;
                       db $3D,$84,$00,$00,$47,$67,$04,$00   ;04BAE6|        |      ;
                       db $8E,$42,$43,$44,$45,$60,$00,$47   ;04BAEE|        |      ;
                       db $89,$44,$6D,$00,$00,$00,$B5,$06   ;04BAF6|        |      ;
                       db $3D,$96,$54,$00,$64,$63,$00,$00   ;04BAFE|        |      ;
                       db $67,$68,$A8,$AB,$00,$A8,$52,$53   ;04BB06|        |      ;
                       db $53,$55,$56,$60,$6A,$6B,$6A,$2A   ;04BB0E|        |      ;
                       db $04,$00,$04,$3D,$04,$00,$9E,$3D   ;04BB16|        |      ;
                       db $54,$60,$47,$6A,$AF,$AA,$A8,$26   ;04BB1E|        |      ;
                       db $61,$62,$00,$00,$65,$66,$3D,$68   ;04BB26|        |      ;
                       db $6A,$68,$6C,$60,$00,$00,$00,$B5   ;04BB2E|        |      ;
                       db $3D,$3D,$3D,$63,$64,$04,$00,$88   ;04BB36|        |      ;
                       db $3D,$68,$6B,$6D,$AA,$AB,$A8,$71   ;04BB3E|        |      ;
                       db $04,$00,$88,$76,$3D,$3D,$2A,$3D   ;04BB46|        |      ;
                       db $6B,$68,$6D,$06,$00,$82,$3D,$70   ;04BB4E|        |      ;
                       db $04,$00,$88,$42,$43,$44,$45,$AB   ;04BB56|        |      ;
                       db $77,$AB,$48,$04,$00,$D4,$49,$3D   ;04BB5E|        |      ;
                       db $6C,$8A,$42,$43,$44,$45,$00,$00   ;04BB66|        |      ;
                       db $63,$64,$63,$64,$3D,$70,$00,$00   ;04BB6E|        |      ;
                       db $00,$A8,$52,$53,$53,$55,$56,$60   ;04BB76|        |      ;
                       db $3D,$71,$01,$02,$03,$00,$69,$3D   ;04BB7E|        |      ;
                       db $00,$A8,$52,$53,$53,$55,$56,$60   ;04BB86|        |      ;
                       db $3D,$70,$3D,$70,$3D,$70,$00,$00   ;04BB8E|        |      ;
                       db $26,$61,$62,$00,$00,$65,$66,$3D   ;04BB96|        |      ;
                       db $3D,$10,$11,$12,$13,$14,$15,$3D   ;04BB9E|        |      ;
                       db $26,$61,$62,$00,$00,$65,$66,$3D   ;04BBA6|        |      ;
                       db $B5,$70,$3D,$70,$B5,$70,$00,$00   ;04BBAE|        |      ;
                       db $A8,$71,$04,$00,$8C,$76,$3D,$3D   ;04BBB6|        |      ;
                       db $20,$21,$22,$23,$24,$25,$3D,$A8   ;04BBBE|        |      ;
                       db $71,$04,$00,$83,$76,$3D,$60,$06   ;04BBC6|        |      ;
                       db $00,$83,$26,$AA,$48,$04,$00,$8C   ;04BBCE|        |      ;
                       db $49,$3D,$3D,$30,$31,$32,$33,$34   ;04BBD6|        |      ;
                       db $35,$3D,$AA,$48,$04,$00,$84,$49   ;04BBDE|        |      ;
                       db $3D,$6C,$6D,$06,$00,$82,$A9,$58   ;04BBE6|        |      ;
                       db $04,$00,$8C,$59,$67,$3D,$06,$07   ;04BBEE|        |      ;
                       db $08,$09,$0A,$0B,$3D,$A9,$58,$04   ;04BBF6|        |      ;
                       db $00,$85,$59,$67,$6B,$8A,$60,$04   ;04BBFE|        |      ;
                       db $00,$83,$26,$3D,$71,$04,$00,$8C   ;04BC06|        |      ;
                       db $69,$59,$3D,$16,$17,$18,$19,$1A   ;04BC0E|        |      ;
                       db $1B,$3D,$3D,$71,$04,$00,$8C,$69   ;04BC16|        |      ;
                       db $59,$68,$6A,$6C,$6D,$00,$00,$00   ;04BC1E|        |      ;
                       db $47,$3D,$58,$04,$00,$8C,$49,$3D   ;04BC26|        |      ;
                       db $3D,$71,$27,$28,$29,$00,$49,$3D   ;04BC2E|        |      ;
                       db $3D,$58,$04,$00,$FE,$49,$3D,$6D   ;04BC36|        |      ;
                       db $68,$6B,$8A,$00,$00,$64,$77,$AA   ;04BC3E|        |      ;
                       db $36,$AF,$A9,$AF,$A8,$79,$59,$6C   ;04BC46|        |      ;
                       db $36,$37,$38,$39,$37,$79,$3D,$AA   ;04BC4E|        |      ;
                       db $36,$AF,$A9,$AF,$A9,$79,$59,$69   ;04BC56|        |      ;
                       db $6B,$68,$6A,$AB,$6D,$2A,$6C,$A9   ;04BC5E|        |      ;
                       db $6C,$6C,$3D,$AB,$6C,$6C,$3D,$2A   ;04BC66|        |      ;
                       db $3D,$3D,$1C,$1D,$7A,$78,$3D,$AB   ;04BC6E|        |      ;
                       db $6D,$2A,$77,$AB,$3D,$3D,$89,$2A   ;04BC76|        |      ;
                       db $6C,$6C,$68,$67,$6B,$6A,$6B,$6C   ;04BC7E|        |      ;
                       db $00,$00,$00,$6C,$77,$6D,$67,$6C   ;04BC86|        |      ;
                       db $2C,$2D,$2E,$2E,$2F,$B5,$89,$67   ;04BC8E|        |      ;
                       db $6B,$6A,$6B,$8A,$78,$3D,$3D,$6C   ;04BC96|        |      ;
                       db $2A,$77,$2A,$75,$A9,$A9,$A8,$AF   ;04BC9E|        |      ;
                       db $A8,$AF,$A8,$A8,$A9,$75,$75,$73   ;04BCA6|        |      ;
                       db $74,$73,$74,$75,$73,$73,$74,$75   ;04BCAE|        |      ;
                       db $75,$73,$74,$92,$75,$73,$A9,$AA   ;04BCB6|        |      ;
                       db $AF,$A8,$AF,$A8,$B1,$72,$72,$AF   ;04BCBE|        |      ;
                       db $AA,$AA,$AA,$72,$AF,$B1,$09,$72   ;04BCC6|        |      ;
                       db $81,$B1,$05,$72,$8F,$B1,$72,$B1   ;04BCCE|        |      ;
                       db $AF,$AA,$AA,$AF,$67,$77,$3D,$3D   ;04BCD6|        |      ;
                       db $AB,$AF,$AB,$89,$05,$3D,$83,$78   ;04BCDE|        |      ;
                       db $77,$77,$04,$3D,$84,$77,$77,$7A   ;04BCE6|        |      ;
                       db $78,$04,$3D,$FE,$77,$A9,$AB,$78   ;04BCEE|        |      ;
                       db $68,$6B,$8A,$6C,$89,$91,$92,$3D   ;04BCF6|        |      ;
                       db $3D,$91,$92,$77,$7A,$7A,$77,$7A   ;04BCFE|        |      ;
                       db $77,$78,$89,$3D,$3D,$91,$92,$3D   ;04BD06|        |      ;
                       db $3D,$91,$92,$77,$89,$91,$92,$77   ;04BD0E|        |      ;
                       db $4E,$4B,$4E,$4F,$3D,$00,$00,$3D   ;04BD16|        |      ;
                       db $3D,$00,$00,$59,$0C,$0E,$0E,$0F   ;04BD1E|        |      ;
                       db $0E,$0E,$0F,$0D,$3D,$00,$00,$3D   ;04BD26|        |      ;
                       db $3D,$00,$00,$67,$4A,$4E,$4B,$4B   ;04BD2E|        |      ;
                       db $5B,$8D,$5E,$5F,$3D,$8E,$8E,$3D   ;04BD36|        |      ;
                       db $3D,$8E,$8E,$7A,$8C,$1E,$78,$78   ;04BD3E|        |      ;
                       db $77,$7A,$1F,$00,$77,$8E,$8E,$3D   ;04BD46|        |      ;
                       db $3D,$8E,$8E,$77,$5A,$6F,$5B,$5E   ;04BD4E|        |      ;
                       db $4B,$4B,$4E,$4B,$4E,$4F,$AA,$A9   ;04BD56|        |      ;
                       db $AF,$AA,$77,$8C,$3B,$3C,$3B,$3C   ;04BD5E|        |      ;
                       db $3B,$3C,$3B,$3C,$6C,$78,$A9,$6C   ;04BD66|        |      ;
                       db $4A,$4E,$C6,$4B,$4E,$4B,$4B,$4E   ;04BD6E|        |      ;
                       db $4E,$5B,$5E,$6F,$5E,$5E,$5F,$AB   ;04BD76|        |      ;
                       db $78,$77,$AB,$6C,$3C,$3C,$3B,$3C   ;04BD7E|        |      ;
                       db $3C,$3C,$3B,$3C,$3C,$3B,$B5,$6C   ;04BD86|        |      ;
                       db $00,$5A,$6F,$5B,$6F,$5B,$5E,$8D   ;04BD8E|        |      ;
                       db $5B,$7E,$7F,$7E,$7F,$7E,$7F,$7E   ;04BD96|        |      ;
                       db $7F,$7E,$7F,$7E,$7F,$7E,$7F,$7E   ;04BD9E|        |      ;
                       db $7F,$7E,$7F,$7E,$7F,$7E,$7F,$7E   ;04BDA6|        |      ;
                       db $7F,$7E,$7F,$7E,$7F,$7E,$7F,$7E   ;04BDAE|        |      ;
                       db $7F,$60,$00,$82,$FF,$FF,$04,$5F   ;04BDB6|        |      ;
                       db $84,$DF,$FF,$FF,$57,$04,$55,$8F   ;04BDBE|        |      ;
                       db $5D,$FF,$7F,$55,$55,$AA,$AA,$55   ;04BDC6|        |      ;
                       db $55,$5F,$55,$55,$55,$9A,$6A,$06   ;04BDCE|        |      ;
                       db $55,$82,$59,$56,$06,$55,$8B,$A5   ;04BDD6|        |      ;
                       db $A5,$55,$55,$55,$05,$05,$09,$0A   ;04BDDE|        |      ;
                       db $0A,$06,$0A,$05                   ;04BDE6|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BDEA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BDF2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BDFA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE02|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE0A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE12|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE1A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE22|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE2A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE32|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE3A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE42|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE4A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE52|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE5A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE62|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE6A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE72|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE7A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE82|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE8A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE92|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BE9A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEA2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEAA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEB2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEBA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEC2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BECA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BED2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEDA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEE2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEEA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEF2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BEFA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF02|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF0A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF12|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF1A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF22|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF2A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF32|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF3A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF42|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF4A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF52|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF5A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF62|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF6A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF72|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF7A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF82|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF8A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF92|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BF9A|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFA2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFAA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFB2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFBA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFC2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFCA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFD2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFDA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFE2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFEA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;04BFF2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF           ;04BFFA|        |FFFFFF;
