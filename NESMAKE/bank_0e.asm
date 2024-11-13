 
 
 
              bank_9c: db $9C                               ;0E8000|        |      ; NES PRG 38000
 
          CODE_0E8001: LDA.B r_CogSize                      ;0E8001|A595    |000095;
                       ASL A                                ;0E8003|0A      |      ;
                       ASL A                                ;0E8004|0A      |      ;
                       TAY                                  ;0E8005|A8      |      ;
                       LDA.W PTR16_0E8846,Y                 ;0E8006|B94688  |0E8846;
                       STA.B r_pointerQueue                 ;0E8009|8508    |000008;
                       LDA.W PTR16_0E8847,Y                 ;0E800B|B94788  |0E8847;
                       STA.B $09                            ;0E800E|8509    |000009;
                       LDA.W PTR16_0E8848,Y                 ;0E8010|B94888  |0E8848;
                       STA.B r_temp_Xpos                    ;0E8013|850A    |00000A;
                       LDA.W PTR16_0E8849,Y                 ;0E8015|B94988  |0E8849;
                       STA.B $0B                            ;0E8018|850B    |00000B;
                       LDA.B r_knockBackDirrection          ;0E801A|A590    |000090;
                       BPL CODE_0E8035                      ;0E801C|1017    |0E8035;
                       AND.B #$7F                           ;0E801E|297F    |      ;
                       TAY                                  ;0E8020|A8      |      ;
                       LDA.W $0509                          ;0E8021|AD0905  |0E0509;
                       SEC                                  ;0E8024|38      |      ;
                       SBC.B (r_pointerQueue),Y             ;0E8025|F108    |000008;
                       STA.W $0509                          ;0E8027|8D0905  |0E0509;
                       LDA.W $04F2                          ;0E802A|ADF204  |0E04F2;
                       SBC.B #$00                           ;0E802D|E900    |      ;
                       STA.W $04F2                          ;0E802F|8DF204  |0E04F2;
                       JMP.W CODE_0E8047                    ;0E8032|4C4780  |0E8047;
 
 
          CODE_0E8035: TAY                                  ;0E8035|A8      |      ;
                       LDA.W $0509                          ;0E8036|AD0905  |0E0509;
                       CLC                                  ;0E8039|18      |      ;
                       ADC.B (r_pointerQueue),Y             ;0E803A|7108    |000008;
                       STA.W $0509                          ;0E803C|8D0905  |0E0509;
                       LDA.W $04F2                          ;0E803F|ADF204  |0E04F2;
                       ADC.B #$00                           ;0E8042|6900    |      ;
                       STA.W $04F2                          ;0E8044|8DF204  |0E04F2;
 
          CODE_0E8047: CPY.B #$34                           ;0E8047|C034    |      ;
                       BCS CODE_0E805D                      ;0E8049|B012    |0E805D;
                       LDA.W $0537                          ;0E804B|AD3705  |0E0537;
                       CLC                                  ;0E804E|18      |      ;
                       ADC.B (r_temp_Xpos),Y                ;0E804F|710A    |00000A;
                       STA.W $0537                          ;0E8051|8D3705  |0E0537;
                       LDA.W $0520                          ;0E8054|AD2005  |0E0520;
                       ADC.B #$00                           ;0E8057|6900    |      ;
                       STA.W $0520                          ;0E8059|8D2005  |0E0520;
                       RTS                                  ;0E805C|60      |      ;
 
 
          CODE_0E805D: TYA                                  ;0E805D|98      |      ;
                       SEC                                  ;0E805E|38      |      ;
                       SBC.B #$34                           ;0E805F|E934    |      ;
                       ASL A                                ;0E8061|0A      |      ;
                       TAY                                  ;0E8062|A8      |      ;
                       LDA.W $0537                          ;0E8063|AD3705  |0E0537;
                       CLC                                  ;0E8066|18      |      ;
                       ADC.W DATA8_0E8912,Y                 ;0E8067|791289  |0E8912;
                       STA.W $0537                          ;0E806A|8D3705  |0E0537;
                       LDA.W $0520                          ;0E806D|AD2005  |0E0520;
                       ADC.W DATA8_0E8913,Y                 ;0E8070|791389  |0E8913;
                       STA.W $0520                          ;0E8073|8D2005  |0E0520;
                       RTS                                  ;0E8076|60      |      ;
 
 
          CODE_0E8077: LDA.B r_knockBackDirrection          ;0E8077|A590    |000090;
                       BMI CODE_0E8091                      ;0E8079|3016    |0E8091;
                       TAY                                  ;0E807B|A8      |      ;
                       LDA.W $0509                          ;0E807C|AD0905  |0E0509;
                       SEC                                  ;0E807F|38      |      ;
                       SBC.W DATA8_0E892C,Y                 ;0E8080|F92C89  |0E892C;
                       STA.W $0509                          ;0E8083|8D0905  |0E0509;
                       LDA.W $04F2                          ;0E8086|ADF204  |0E04F2;
                       SBC.B #$00                           ;0E8089|E900    |      ;
                       STA.W $04F2                          ;0E808B|8DF204  |0E04F2;
                       JMP.W CODE_0E80A6                    ;0E808E|4CA680  |0E80A6;
 
 
          CODE_0E8091: AND.B #$7F                           ;0E8091|297F    |      ;
                       TAY                                  ;0E8093|A8      |      ;
                       LDA.W $0509                          ;0E8094|AD0905  |0E0509;
                       CLC                                  ;0E8097|18      |      ;
                       ADC.W DATA8_0E892C,Y                 ;0E8098|792C89  |0E892C;
                       STA.W $0509                          ;0E809B|8D0905  |0E0509;
                       LDA.W $04F2                          ;0E809E|ADF204  |0E04F2;
                       ADC.B #$00                           ;0E80A1|6900    |      ;
                       STA.W $04F2                          ;0E80A3|8DF204  |0E04F2;
 
          CODE_0E80A6: LDA.W $0537                          ;0E80A6|AD3705  |0E0537;
                       CLC                                  ;0E80A9|18      |      ;
                       ADC.W DATA8_0E894D,Y                 ;0E80AA|794D89  |0E894D;
                       STA.W $0537                          ;0E80AD|8D3705  |0E0537;
                       LDA.W $0520                          ;0E80B0|AD2005  |0E0520;
                       ADC.B #$00                           ;0E80B3|6900    |      ;
                       STA.W $0520                          ;0E80B5|8D2005  |0E0520;
                       RTS                                  ;0E80B8|60      |      ;
 
 
          CODE_0E80B9: LDA.B r_sceneScrollOffsetLo          ;0E80B9|A556    |000056;
                       ORA.B r_sceneScrollOffsetHi          ;0E80BB|0557    |000057;
                       BNE CODE_0E80D8                      ;0E80BD|D019    |0E80D8;
                       LDA.W $0438                          ;0E80BF|AD3804  |0E0438;
                       CMP.B #$40                           ;0E80C2|C940    |      ;
                       BCS CODE_0E80D8                      ;0E80C4|B012    |0E80D8;
                       LDA.W $041C                          ;0E80C6|AD1C04  |0E041C;
                       SEC                                  ;0E80C9|38      |      ;
                       SBC.B #$70                           ;0E80CA|E970    |      ;
                       BCS CODE_0E80D0                      ;0E80CC|B002    |0E80D0;
                       EOR.B #$FF                           ;0E80CE|49FF    |      ;
 
          CODE_0E80D0: CMP.B #$08                           ;0E80D0|C908    |      ;
                       BCS CODE_0E80D8                      ;0E80D2|B004    |0E80D8;
                       LDA.B #$0E                           ;0E80D4|A90E    |      ;
                       STA.B r_damagePlayer                 ;0E80D6|8581    |000081;
 
          CODE_0E80D8: RTS                                  ;0E80D8|60      |      ;
 
 
          CODE_0E80D9: LDA.B r_stage                        ;0E80D9|A532    |000032;
                       CMP.B #$0E                           ;0E80DB|C90E    |      ;
                       BNE CODE_0E80EE                      ;0E80DD|D00F    |0E80EE;
                       LDA.B r_blockLevel                   ;0E80DF|A533    |000033;
                       CMP.B #$01                           ;0E80E1|C901    |      ;
                       BNE CODE_0E80EE                      ;0E80E3|D009    |0E80EE;
                       LDA.B r_roomIdx                      ;0E80E5|A534    |000034;
                       CMP.B #$01                           ;0E80E7|C901    |      ;
                       BNE CODE_0E80EE                      ;0E80E9|D003    |0E80EE;
                       JSR.W CODE_0E80B9                    ;0E80EB|20B980  |0E80B9;
 
          CODE_0E80EE: LDA.W $0565                          ;0E80EE|AD6505  |0E0565;
                       CMP.B #$0A                           ;0E80F1|C90A    |      ;
                       BEQ CODE_0E80F9                      ;0E80F3|F004    |0E80F9;
                       CMP.B #$1C                           ;0E80F5|C91C    |      ;
                       BNE CODE_0E8101                      ;0E80F7|D008    |0E8101;
 
          CODE_0E80F9: LDA.W $054E                          ;0E80F9|AD4E05  |0E054E;
                       CLC                                  ;0E80FC|18      |      ;
                       ADC.B #$04                           ;0E80FD|6904    |      ;
                       BNE CODE_0E8104                      ;0E80FF|D003    |0E8104;
 
          CODE_0E8101: LDA.W $054E                          ;0E8101|AD4E05  |0E054E;
 
          CODE_0E8104: STA.B r_currPartnerID                ;0E8104|8582    |000082;
                       LDA.B r_delayElevators               ;0E8106|A5AF    |0000AF;
                       BEQ CODE_0E810C                      ;0E8108|F002    |0E810C;
                       DEC.B r_delayElevators               ;0E810A|C6AF    |0000AF;
 
          CODE_0E810C: LDA.B r_deathDelay                   ;0E810C|A5BF    |0000BF;
                       BNE CODE_0E812B                      ;0E810E|D01B    |0E812B;
                       LDA.B r_invincableFrames             ;0E8110|A580    |000080;
                       BEQ CODE_0E811E                      ;0E8112|F00A    |0E811E;
                       DEC.B r_invincableFrames             ;0E8114|C680    |000080;
                       LDY.B #$80                           ;0E8116|A080    |      ;
                       LDA.B r_gameStateLoopCounter         ;0E8118|A51A    |00001A;
                       AND.B #$01                           ;0E811A|2901    |      ;
                       BEQ CODE_0E8120                      ;0E811C|F002    |0E8120;
 
          CODE_0E811E: LDY.B #$00                           ;0E811E|A000    |      ;
 
          CODE_0E8120: STY.W $0470                          ;0E8120|8C7004  |0E0470;
                       LDA.B r_powerUpDrop                  ;0E8123|A5B7    |0000B7;
                       BNE CODE_0E8139                      ;0E8125|D012    |0E8139;
                       LDA.B r_damagePlayer                 ;0E8127|A581    |000081;
                       BNE CODE_0E812C                      ;0E8129|D001    |0E812C;
 
          CODE_0E812B: RTS                                  ;0E812B|60      |      ;
 
 
          CODE_0E812C: CMP.B #$0D                           ;0E812C|C90D    |      ;
                       BEQ CODE_0E818F                      ;0E812E|F05F    |0E818F;
                       CMP.B #$0E                           ;0E8130|C90E    |      ;
                       BEQ CODE_0E8154                      ;0E8132|F020    |0E8154;
                       AND.B #$F0                           ;0E8134|29F0    |      ;
                       BNE CODE_0E81A2                      ;0E8136|D06A    |0E81A2;
                       RTS                                  ;0E8138|60      |      ;
 
 
          CODE_0E8139: LDA.B #$00                           ;0E8139|A900    |      ;
                       STA.B r_powerUpDrop                  ;0E813B|85B7    |0000B7;
                       LDA.B r_gameTransition               ;0E813D|A52A    |00002A;
                       STA.B $9F                            ;0E813F|859F    |00009F;
                       LDA.B #$19                           ;0E8141|A919    |      ;
                       STA.B r_gameTransition               ;0E8143|852A    |00002A;
                       LDA.W $0565                          ;0E8145|AD6505  |0E0565;
                       ORA.B #$80                           ;0E8148|0980    |      ;
                       STA.W $0565                          ;0E814A|8D6505  |0E0565;
                       LDA.B #$2C                           ;0E814D|A92C    |      ;
                       STA.B r_timerGenerel                 ;0E814F|8530    |000030;
                       PLA                                  ;0E8151|68      |      ;
                       PLA                                  ;0E8152|68      |      ;
 
          CODE_0E8153: RTS                                  ;0E8153|60      |      ;
 
 
          CODE_0E8154: LDA.B #$00                           ;0E8154|A900    |      ;
                       LDX.B #$10                           ;0E8156|A210    |      ;
                       db $20                               ;0E8158|        |      ;
                       dw CODE_0FFCDD                       ;0E8159|        |0FFCDD;
                       BEQ CODE_0E8172                      ;0E815B|F015    |0E8172;
                       LDA.B r_stage                        ;0E815D|A532    |000032;
                       CMP.B #$01                           ;0E815F|C901    |      ;
                       BEQ CODE_0E8167                      ;0E8161|F004    |0E8167;
                       LDA.B r_sceneScrollOffsetLo          ;0E8163|A556    |000056;
                       BNE CODE_0E8172                      ;0E8165|D00B    |0E8172;
 
          CODE_0E8167: LDA.W $0565                          ;0E8167|AD6505  |0E0565;
                       CMP.B #$02                           ;0E816A|C902    |      ;
                       BEQ CODE_0E8173                      ;0E816C|F005    |0E8173;
                       CMP.B #$04                           ;0E816E|C904    |      ;
                       BEQ CODE_0E8173                      ;0E8170|F001    |0E8173;
 
          CODE_0E8172: RTS                                  ;0E8172|60      |      ;
 
 
          CODE_0E8173: JSR.W CODE_0E8A02                    ;0E8173|20028A  |0E8A02;
                       LDA.W $054E                          ;0E8176|AD4E05  |0E054E;
                       CMP.B #$02                           ;0E8179|C902    |      ;
                       BNE CODE_0E8186                      ;0E817B|D009    |0E8186;
                       LDA.W $041C                          ;0E817D|AD1C04  |0E041C;
                       CLC                                  ;0E8180|18      |      ;
                       ADC.B #$04                           ;0E8181|6904    |      ;
                       STA.W $041C                          ;0E8183|8D1C04  |0E041C;
 
          CODE_0E8186: LDA.B #$18                           ;0E8186|A918    |      ;
                       STA.B r_gameTransition               ;0E8188|852A    |00002A;
                       LDA.B #$00                           ;0E818A|A900    |      ;
                       STA.B r_menuSelectIdx                ;0E818C|856B    |00006B;
                       RTS                                  ;0E818E|60      |      ;
 
 
          CODE_0E818F: JSR.W CODE_0EBDC4                    ;0E818F|20C4BD  |0EBDC4;
                       LDA.B #$3C                           ;0E8192|A93C    |      ;
                       STA.W $05D4                          ;0E8194|8DD405  |0E05D4;
                       LDA.B #$28                           ;0E8197|A928    |      ;
                       STA.W $0565                          ;0E8199|8D6505  |0E0565;
                       LDA.B #$00                           ;0E819C|A900    |      ;
                       STA.W $05EB                          ;0E819E|8DEB05  |0E05EB;
                       RTS                                  ;0E81A1|60      |      ;
 
 
          CODE_0E81A2: NOP                                  ;0E81A2|EA      |      ;
                       LDA.B r_invincableFrames             ;0E81A3|A580    |000080;
                       ORA.B r_potionTimer                  ;0E81A5|05AD    |0000AD;
                       BNE CODE_0E812B                      ;0E81A7|D082    |0E812B;
                       LDA.W $054E                          ;0E81A9|AD4E05  |0E054E;
                       ASL A                                ;0E81AC|0A      |      ;
                       TAY                                  ;0E81AD|A8      |      ;
                       LDA.W PTR16_0E8298,Y                 ;0E81AE|B99882  |0E8298;
                       STA.B r_pointerQueue                 ;0E81B1|8508    |000008;
                       LDA.W PTR16_0E8299,Y                 ;0E81B3|B99982  |0E8299;
                       STA.B $09                            ;0E81B6|8509    |000009;
                       LDY.B #$00                           ;0E81B8|A000    |      ;
 
          CODE_0E81BA: LDA.B (r_pointerQueue),Y             ;0E81BA|B108    |000008;
                       BMI CODE_0E8208                      ;0E81BC|304A    |0E8208;
                       CMP.W $0565                          ;0E81BE|CD6505  |0E0565;
                       BEQ CODE_0E81C7                      ;0E81C1|F004    |0E81C7;
                       INY                                  ;0E81C3|C8      |      ;
                       INY                                  ;0E81C4|C8      |      ;
                       BNE CODE_0E81BA                      ;0E81C5|D0F3    |0E81BA;
 
          CODE_0E81C7: INY                                  ;0E81C7|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0E81C8|B108    |000008;
                       BEQ CODE_0E8153                      ;0E81CA|F087    |0E8153;
                       JSR.W CODE_0E8263                    ;0E81CC|206382  |0E8263;
                       BEQ CODE_0E820B                      ;0E81CF|F03A    |0E820B;
                       LDY.W $054E                          ;0E81D1|AC4E05  |0E054E;
                       LDA.W DATA8_0E8294,Y                 ;0E81D4|B99482  |0E8294;
                       db $20                               ;0E81D7|        |      ;
                       dw initFreezWaterEffect_01           ;0E81D8|        |0FE25F;
                       JSR.W CODE_0EBDC4                    ;0E81DA|20C4BD  |0EBDC4;
                       LDA.B #$00                           ;0E81DD|A900    |      ;
                       STA.W $0454                          ;0E81DF|8D5404  |0E0454;
                       LDA.W $0565                          ;0E81E2|AD6505  |0E0565;
                       STA.W $05D4                          ;0E81E5|8DD405  |0E05D4;
                       LDA.B #$20                           ;0E81E8|A920    |      ;
                       STA.W $05EB                          ;0E81EA|8DEB05  |0E05EB;
                       LDA.B #$01                           ;0E81ED|A901    |      ;
                       STA.W $0602                          ;0E81EF|8D0206  |0E0602;
                       LDA.B #$78                           ;0E81F2|A978    |      ;
                       STA.B r_invincableFrames             ;0E81F4|8580    |000080;
                       LDA.B #$26                           ;0E81F6|A926    |      ;
                       STA.W $0565                          ;0E81F8|8D6505  |0E0565;
                       RTS                                  ;0E81FB|60      |      ;
 
                       LDY.W $054E                          ;0E81FC|AC4E05  |0E054E;
                       LDA.W DATA8_0E8294,Y                 ;0E81FF|B99482  |0E8294;
                       db $20                               ;0E8202|        |      ;
                       dw initFreezWaterEffect_01           ;0E8203|        |0FE25F;
                       JMP.W CODE_0E8CF9                    ;0E8205|4CF98C  |0E8CF9;
 
 
          CODE_0E8208: JSR.W CODE_0E8263                    ;0E8208|206382  |0E8263;
 
          CODE_0E820B: LDY.W $054E                          ;0E820B|AC4E05  |0E054E;
                       LDA.W DATA8_0E8294,Y                 ;0E820E|B99482  |0E8294;
                       db $20                               ;0E8211|        |      ;
                       dw initFreezWaterEffect_01           ;0E8212|        |0FE25F;
                       JSR.W CODE_0EBDC4                    ;0E8214|20C4BD  |0EBDC4;
                       LDA.B #$00                           ;0E8217|A900    |      ;
                       STA.W $0454                          ;0E8219|8D5404  |0E0454;
                       LDA.W $0565                          ;0E821C|AD6505  |0E0565;
                       STA.W $05D4                          ;0E821F|8DD405  |0E05D4;
                       LDA.B #$20                           ;0E8222|A920    |      ;
                       STA.W $05EB                          ;0E8224|8DEB05  |0E05EB;
                       LDA.B #$00                           ;0E8227|A900    |      ;
                       STA.W $0602                          ;0E8229|8D0206  |0E0602;
                       LDA.B #$78                           ;0E822C|A978    |      ;
                       STA.B r_invincableFrames             ;0E822E|8580    |000080;
                       LDA.B #$26                           ;0E8230|A926    |      ;
                       STA.W $0565                          ;0E8232|8D6505  |0E0565;
                       LDA.B #$10                           ;0E8235|A910    |      ;
                       STA.W $0400                          ;0E8237|8D0004  |0E0400;
                       LDA.B #$FE                           ;0E823A|A9FE    |      ;
                       STA.W $0520                          ;0E823C|8D2005  |0E0520;
                       LDA.B #$00                           ;0E823F|A900    |      ;
                       STA.W $0537                          ;0E8241|8D3705  |0E0537;
                       LDA.B r_knockBackDirrection          ;0E8244|A590    |000090;
                       BEQ CODE_0E8253                      ;0E8246|F00B    |0E8253;
                       LDA.B #$01                           ;0E8248|A901    |      ;
                       STA.W $04A8                          ;0E824A|8DA804  |0E04A8;
                       LDA.B #$01                           ;0E824D|A901    |      ;
                       LDY.B #$00                           ;0E824F|A000    |      ;
                       BEQ CODE_0E825C                      ;0E8251|F009    |0E825C;
 
          CODE_0E8253: LDA.B #$00                           ;0E8253|A900    |      ;
                       STA.W $04A8                          ;0E8255|8DA804  |0E04A8;
                       LDA.B #$FF                           ;0E8258|A9FF    |      ;
                       LDY.B #$00                           ;0E825A|A000    |      ;
 
          CODE_0E825C: STA.W $04F2                          ;0E825C|8DF204  |0E04F2;
                       STY.W $0509                          ;0E825F|8C0905  |0E0509;
                       RTS                                  ;0E8262|60      |      ;
 
 
          CODE_0E8263: LDA.W $054E                          ;0E8263|AD4E05  |0E054E;
                       ASL A                                ;0E8266|0A      |      ;
                       TAY                                  ;0E8267|A8      |      ;
                       LDA.W PTR16_0E82E4,Y                 ;0E8268|B9E482  |0E82E4;
                       STA.B r_pointerQueue                 ;0E826B|8508    |000008;
                       LDA.W PTR16_0E82E5,Y                 ;0E826D|B9E582  |0E82E5;
                       STA.B $09                            ;0E8270|8509    |000009;
                       LDA.B r_damagePlayer                 ;0E8272|A581    |000081;
                       LSR A                                ;0E8274|4A      |      ;
                       LSR A                                ;0E8275|4A      |      ;
                       LSR A                                ;0E8276|4A      |      ;
                       LSR A                                ;0E8277|4A      |      ;
                       CMP.B #$0F                           ;0E8278|C90F    |      ;
                       BEQ CODE_0E828E                      ;0E827A|F012    |0E828E;
                       TAY                                  ;0E827C|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0E827D|B108    |000008;
                       TAY                                  ;0E827F|A8      |      ;
                       LDA.B r_HUD_healthPlayer             ;0E8280|A53C    |00003C;
                       SEC                                  ;0E8282|38      |      ;
                       SBC.W DATA8_0E830C,Y                 ;0E8283|F90C83  |0E830C;
                       BCS CODE_0E828A                      ;0E8286|B002    |0E828A;
                       LDA.B #$00                           ;0E8288|A900    |      ;
 
          CODE_0E828A: STA.B r_HUD_healthPlayer             ;0E828A|853C    |00003C;
                       CLC                                  ;0E828C|18      |      ;
                       RTS                                  ;0E828D|60      |      ;
 
 
          CODE_0E828E: LDA.B #$00                           ;0E828E|A900    |      ;
                       STA.B r_HUD_healthPlayer             ;0E8290|853C    |00003C;
                       SEC                                  ;0E8292|38      |      ;
                       RTS                                  ;0E8293|60      |      ;
 
 
         DATA8_0E8294: db $73,$75,$74,$76                   ;0E8294|        |      ;
 
         PTR16_0E8298: dw DATA8_0E82A0                      ;0E8298|        |0E82A0;
                       dw DATA8_0E82AF                      ;0E829A|        |0E82AF;
                       dw DATA8_0E82BE                      ;0E829C|        |0E82BE;
                       dw DATA8_0E82CD                      ;0E829E|        |0E82CD;
 
         DATA8_0E82A0: db $10,$01,$12,$01,$14,$01,$1E,$01   ;0E82A0|        |      ;
                       db $24,$01,$16,$00,$26,$00,$FF       ;0E82A8|        |      ;
 
         DATA8_0E82AF: db $10,$01,$12,$01,$14,$01,$1E,$01   ;0E82AF|        |      ;
                       db $24,$01,$16,$00,$26,$00,$FF       ;0E82B7|        |      ;
 
         DATA8_0E82BE: db $10,$01,$12,$01,$14,$01,$1E,$01   ;0E82BE|        |      ;
                       db $24,$01,$16,$00,$26,$00,$FF       ;0E82C6|        |      ;
 
         DATA8_0E82CD: db $10,$01,$12,$01,$14,$01,$1E,$01   ;0E82CD|        |      ;
                       db $24,$01,$16,$00,$26,$00,$30,$00   ;0E82D5|        |      ;
                       db $32,$00,$3C,$00,$3E,$00,$FF       ;0E82DD|        |      ;
 
         PTR16_0E82E4: dw DATA8_0E82EC                      ;0E82E4|        |0E82EC;
                       dw DATA8_0E82FC                      ;0E82E6|        |0E82FC;
                       dw DATA8_0E82FC                      ;0E82E8|        |0E82FC;
                       dw DATA8_0E82EC                      ;0E82EA|        |0E82EC;
 
         DATA8_0E82EC: db $00,$01,$02,$03,$04,$05,$06,$07   ;0E82EC|        |      ;
                       db $08,$09,$0A,$0B,$0C,$0D,$0E,$0F   ;0E82F4|        |      ;
 
         DATA8_0E82FC: db $00,$02,$03,$04,$05,$06,$07,$08   ;0E82FC|        |      ;
                       db $09,$0A,$0C,$0C,$0D,$0E,$0F,$0F   ;0E8304|        |      ;
 
         DATA8_0E830C: db $00,$08,$0C,$10,$14,$18,$1C,$20   ;0E830C|        |      ;
                       db $24,$28,$2C,$30,$34,$38,$3C,$40   ;0E8314|        |      ;
                       LDA.W $054E                          ;0E831C|AD4E05  |0E054E;
                       CMP.B #$03                           ;0E831F|C903    |      ;
                       BNE CODE_0E833C                      ;0E8321|D019    |0E833C;
                       LDA.B r_HUD_healthPlayer             ;0E8323|A53C    |00003C;
                       BEQ CODE_0E834D                      ;0E8325|F026    |0E834D;
                       LDY.B #$00                           ;0E8327|A000    |      ;
 
          CODE_0E8329: LDA.W UNREACH_0EA6A2,Y               ;0E8329|B9A2A6  |0EA6A2;
                       BMI CODE_0E833C                      ;0E832C|300E    |0E833C;
                       CMP.W $05D4                          ;0E832E|CDD405  |0E05D4;
                       BEQ CODE_0E8336                      ;0E8331|F003    |0E8336;
                       INY                                  ;0E8333|C8      |      ;
                       BNE CODE_0E8329                      ;0E8334|D0F3    |0E8329;
 
          CODE_0E8336: LDA.B #$3C                           ;0E8336|A93C    |      ;
                       STA.W $0565                          ;0E8338|8D6505  |0E0565;
                       RTS                                  ;0E833B|60      |      ;
 
 
          CODE_0E833C: LDA.W $0602                          ;0E833C|AD0206  |0E0602;
                       BEQ CODE_0E834D                      ;0E833F|F00C    |0E834D;
                       DEC.W $05EB                          ;0E8341|CEEB05  |0E05EB;
                       BNE CODE_0E834C                      ;0E8344|D006    |0E834C;
                       LDA.W $05D4                          ;0E8346|ADD405  |0E05D4;
                       STA.W $0565                          ;0E8349|8D6505  |0E0565;
 
          CODE_0E834C: RTS                                  ;0E834C|60      |      ;
 
 
          CODE_0E834D: LDA.B #$08                           ;0E834D|A908    |      ;
                       LDY.W $04F2                          ;0E834F|ACF204  |0E04F2;
                       BPL CODE_0E8356                      ;0E8352|1002    |0E8356;
                       LDA.B #$F8                           ;0E8354|A9F8    |      ;
 
          CODE_0E8356: STA.B r_pointerQueue                 ;0E8356|8508    |000008;
                       LDX.B #$F0                           ;0E8358|A2F0    |      ;
                       db $20                               ;0E835A|        |      ;
                       dw CODE_0FFCDD                       ;0E835B|        |0FFCDD;
                       BNE CODE_0E8368                      ;0E835D|D009    |0E8368;
                       LDA.B r_pointerQueue                 ;0E835F|A508    |000008;
                       LDX.B #$00                           ;0E8361|A200    |      ;
                       db $20                               ;0E8363|        |      ;
                       dw CODE_0FFCDD                       ;0E8364|        |0FFCDD;
                       BEQ CODE_0E836E                      ;0E8366|F006    |0E836E;
 
          CODE_0E8368: JSR.W UNREACH_0E97CF                 ;0E8368|20CF97  |0E97CF;
                       JMP.W CODE_0E8371                    ;0E836B|4C7183  |0E8371;
 
 
          CODE_0E836E: JSR.W UNREACH_0E97A1                 ;0E836E|20A197  |0E97A1;
 
          CODE_0E8371: LDA.W $0565                          ;0E8371|AD6505  |0E0565;
                       CMP.B #$02                           ;0E8374|C902    |      ;
                       BEQ CODE_0E8379                      ;0E8376|F001    |0E8379;
                       RTS                                  ;0E8378|60      |      ;
 
 
          CODE_0E8379: LDA.B #$00                           ;0E8379|A900    |      ;
                       STA.B r_timerClunk_drop              ;0E837B|85B9    |0000B9;
                       LDA.W $054E                          ;0E837D|AD4E05  |0E054E;
                       CMP.B #$02                           ;0E8380|C902    |      ;
                       BNE CODE_0E8393                      ;0E8382|D00F    |0E8393;
                       LDA.B r_conveyaerRoomEffect          ;0E8384|A58B    |00008B;
                       CMP.B #$01                           ;0E8386|C901    |      ;
                       BEQ CODE_0E8393                      ;0E8388|F009    |0E8393;
                       LDA.W $041C                          ;0E838A|AD1C04  |0E041C;
                       CLC                                  ;0E838D|18      |      ;
                       ADC.B #$04                           ;0E838E|6904    |      ;
                       STA.W $041C                          ;0E8390|8D1C04  |0E041C;
 
          CODE_0E8393: LDA.B r_HUD_healthPlayer             ;0E8393|A53C    |00003C;
                       BEQ CODE_0E8398                      ;0E8395|F001    |0E8398;
                       RTS                                  ;0E8397|60      |      ;
 
 
          CODE_0E8398: LDA.B r_deathDelay                   ;0E8398|A5BF    |0000BF;
                       BNE CODE_0E83A9                      ;0E839A|D00D    |0E83A9;
                       LDA.B #$00                           ;0E839C|A900    |      ;
                       STA.B r_HUD_healthPlayer             ;0E839E|853C    |00003C;
                       LDA.B #$2E                           ;0E83A0|A92E    |      ;
                       STA.W $0565                          ;0E83A2|8D6505  |0E0565;
                       LDA.B #$80                           ;0E83A5|A980    |      ;
                       STA.B r_deathDelay                   ;0E83A7|85BF    |0000BF;
 
          CODE_0E83A9: RTS                                  ;0E83A9|60      |      ;
 
 
          CODE_0E83AA: LDA.B r_invincableFrames             ;0E83AA|A580    |000080;
                       BNE CODE_0E83BD                      ;0E83AC|D00F    |0E83BD;
                       LDX.B #$F8                           ;0E83AE|A2F8    |      ;
                       LDA.B #$00                           ;0E83B0|A900    |      ;
                       db $20                               ;0E83B2|        |      ;
                       dw CODE_0FFCDD                       ;0E83B3|        |0FFCDD;
                       CMP.B #$05                           ;0E83B5|C905    |      ;
                       BEQ CODE_0E83BF                      ;0E83B7|F006    |0E83BF;
                       CMP.B #$07                           ;0E83B9|C907    |      ;
                       BEQ CODE_0E83BF                      ;0E83BB|F002    |0E83BF;
 
          CODE_0E83BD: CLC                                  ;0E83BD|18      |      ;
                       RTS                                  ;0E83BE|60      |      ;
 
 
          CODE_0E83BF: JSR.W CODE_0E83F4                    ;0E83BF|20F483  |0E83F4;
                       SEC                                  ;0E83C2|38      |      ;
                       RTS                                  ;0E83C3|60      |      ;
 
                       LDA.B r_conveyaerRoomEffect          ;0E83C4|A58B    |00008B;
                       CMP.B #$01                           ;0E83C6|C901    |      ;
                       BEQ CODE_0E83DD                      ;0E83C8|F013    |0E83DD;
                       CMP.B #$05                           ;0E83CA|C905    |      ;
                       BEQ CODE_0E83DD                      ;0E83CC|F00F    |0E83DD;
                       CMP.B #$06                           ;0E83CE|C906    |      ;
                       BEQ CODE_0E83DD                      ;0E83D0|F00B    |0E83DD;
                       LDX.B #$0C                           ;0E83D2|A20C    |      ;
                       LDA.B #$00                           ;0E83D4|A900    |      ;
                       db $20                               ;0E83D6|        |      ;
                       dw CODE_0FFCDD                       ;0E83D7|        |0FFCDD;
                       BNE CODE_0E83DD                      ;0E83D9|D002    |0E83DD;
                       SEC                                  ;0E83DB|38      |      ;
                       RTS                                  ;0E83DC|60      |      ;
 
 
          CODE_0E83DD: CLC                                  ;0E83DD|18      |      ;
                       RTS                                  ;0E83DE|60      |      ;
 
 
         DATA8_0E83DF: db $20                               ;0E83DF|        |      ;
                       dw CODE_0FFBE8                       ;0E83E0|        |0FFBE8;
                       LDX.B r_pointerQueue                 ;0E83E2|A608    |000008;
                       LDA.B #$FB                           ;0E83E4|A9FB    |      ;
                       db $20                               ;0E83E6|        |      ;
                       dw CODE_0FFCDD                       ;0E83E7|        |0FFCDD;
                       CMP.B #$04                           ;0E83E9|C904    |      ;
                       BEQ DATA8_0E83EF                     ;0E83EB|F002    |0E83EF;
                       SEC                                  ;0E83ED|38      |      ;
                       RTS                                  ;0E83EE|60      |      ;
 
 
         DATA8_0E83EF: db $20                               ;0E83EF|        |      ;
                       dw CODE_0FFBE8                       ;0E83F0|        |0FFBE8;
                       SEC                                  ;0E83F2|38      |      ;
                       RTS                                  ;0E83F3|60      |      ;
 
 
          CODE_0E83F4: LDA.B r_deathDelay                   ;0E83F4|A5BF    |0000BF;
                       BNE CODE_0E841C                      ;0E83F6|D024    |0E841C;
                       LDA.B #$00                           ;0E83F8|A900    |      ;
                       STA.B r_HUD_healthPlayer             ;0E83FA|853C    |00003C;
                       JMP.W CODE_0E820B                    ;0E83FC|4C0B82  |0E820B;
 
                       db $20                               ;0E83FF|        |      ;
                       dw CODE_0FFCDD                       ;0E8400|        |0FFCDD;
                       BEQ CODE_0E840A                      ;0E8402|F006    |0E840A;
                       CMP.B #$01                           ;0E8404|C901    |      ;
                       BEQ CODE_0E840A                      ;0E8406|F002    |0E840A;
                       CMP.B #$08                           ;0E8408|C908    |      ;
 
          CODE_0E840A: RTS                                  ;0E840A|60      |      ;
 
 
         DATA8_0E840B: db $20                               ;0E840B|        |      ;
                       dw CODE_0FFCDD                       ;0E840C|        |0FFCDD;
                       BEQ CODE_0E8412                      ;0E840E|F002    |0E8412;
                       CMP.B #$01                           ;0E8410|C901    |      ;
 
          CODE_0E8412: RTS                                  ;0E8412|60      |      ;
 
 
          CODE_0E8413: LDA.B r_invincableFrames             ;0E8413|A580    |000080;
                       BNE CODE_0E841C                      ;0E8415|D005    |0E841C;
                       JSR.W CODE_0E83F4                    ;0E8417|20F483  |0E83F4;
                       PLA                                  ;0E841A|68      |      ;
                       PLA                                  ;0E841B|68      |      ;
 
          CODE_0E841C: RTS                                  ;0E841C|60      |      ;
 
                       LDX.B #$0C                           ;0E841D|A20C    |      ;
                       BNE CODE_0E8423                      ;0E841F|D002    |0E8423;
                       LDX.B #$10                           ;0E8421|A210    |      ;
 
          CODE_0E8423: STX.B r_pointerQueue                 ;0E8423|8608    |000008;
                       LDA.B r_conveyaerRoomEffect          ;0E8425|A58B    |00008B;
                       CMP.B #$01                           ;0E8427|C901    |      ;
                       BNE CODE_0E842E                      ;0E8429|D003    |0E842E;
                       JMP.W CODE_0E84E0                    ;0E842B|4CE084  |0E84E0;
 
 
          CODE_0E842E: CMP.B #$05                           ;0E842E|C905    |      ;
                       BNE CODE_0E8435                      ;0E8430|D003    |0E8435;
                       JMP.W CODE_0E8513                    ;0E8432|4C1385  |0E8513;
 
 
          CODE_0E8435: CMP.B #$06                           ;0E8435|C906    |      ;
                       BNE CODE_0E843C                      ;0E8437|D003    |0E843C;
                       JMP.W CODE_0E851E                    ;0E8439|4C1E85  |0E851E;
 
 
          CODE_0E843C: LDA.B #$05                           ;0E843C|A905    |      ;
                       db $20                               ;0E843E|        |      ;
                       dw CODE_0FFCDD                       ;0E843F|        |0FFCDD;
                       BEQ CODE_0E8461                      ;0E8441|F01E    |0E8461;
                       CMP.B #$01                           ;0E8443|C901    |      ;
                       BEQ CODE_0E84C0                      ;0E8445|F079    |0E84C0;
                       CMP.B #$02                           ;0E8447|C902    |      ;
                       BEQ CODE_0E8490                      ;0E8449|F045    |0E8490;
                       CMP.B #$03                           ;0E844B|C903    |      ;
                       BEQ CODE_0E84AA                      ;0E844D|F05B    |0E84AA;
                       CMP.B #$04                           ;0E844F|C904    |      ;
                       BEQ DATA8_0E83DF                     ;0E8451|F08C    |0E83DF;
                       CMP.B #$05                           ;0E8453|C905    |      ;
                       BEQ CODE_0E8413                      ;0E8455|F0BC    |0E8413;
                       CMP.B #$07                           ;0E8457|C907    |      ;
                       BEQ CODE_0E8413                      ;0E8459|F0B8    |0E8413;
                       CMP.B #$0C                           ;0E845B|C90C    |      ;
                       BCS DATA8_0E83DF                     ;0E845D|B080    |0E83DF;
                       BCC CODE_0E848C                      ;0E845F|902B    |0E848C;
 
          CODE_0E8461: LDX.B r_pointerQueue                 ;0E8461|A608    |000008;
                       LDA.B #$FB                           ;0E8463|A9FB    |      ;
                       db $20                               ;0E8465|        |      ;
                       dw CODE_0FFCDD                       ;0E8466|        |0FFCDD;
                       BEQ CODE_0E848E                      ;0E8468|F024    |0E848E;
                       CMP.B #$01                           ;0E846A|C901    |      ;
                       BEQ CODE_0E84C9                      ;0E846C|F05B    |0E84C9;
                       CMP.B #$02                           ;0E846E|C902    |      ;
                       BEQ CODE_0E8490                      ;0E8470|F01E    |0E8490;
                       CMP.B #$03                           ;0E8472|C903    |      ;
                       BEQ CODE_0E84AA                      ;0E8474|F034    |0E84AA;
                       CMP.B #$04                           ;0E8476|C904    |      ;
                       BNE CODE_0E847D                      ;0E8478|D003    |0E847D;
                       JMP.W DATA8_0E83EF                   ;0E847A|4CEF83  |0E83EF;
 
 
          CODE_0E847D: CMP.B #$05                           ;0E847D|C905    |      ;
                       BEQ CODE_0E8413                      ;0E847F|F092    |0E8413;
                       CMP.B #$07                           ;0E8481|C907    |      ;
                       BEQ CODE_0E8413                      ;0E8483|F08E    |0E8413;
                       CMP.B #$0C                           ;0E8485|C90C    |      ;
                       BCC CODE_0E848C                      ;0E8487|9003    |0E848C;
                       JMP.W DATA8_0E83EF                   ;0E8489|4CEF83  |0E83EF;
 
 
          CODE_0E848C: SEC                                  ;0E848C|38      |      ;
                       RTS                                  ;0E848D|60      |      ;
 
 
          CODE_0E848E: CLC                                  ;0E848E|18      |      ;
                       RTS                                  ;0E848F|60      |      ;
 
 
          CODE_0E8490: LDA.B r_gameTransition               ;0E8490|A52A    |00002A;
                       CMP.B #$1B                           ;0E8492|C91B    |      ;
                       BNE CODE_0E849A                      ;0E8494|D004    |0E849A;
                       LDA.B #$00                           ;0E8496|A900    |      ;
                       BEQ CODE_0E84A6                      ;0E8498|F00C    |0E84A6;
 
          CODE_0E849A: LDA.B r_conveyaerRoomEffect          ;0E849A|A58B    |00008B;
                       CMP.B #$08                           ;0E849C|C908    |      ;
                       BNE CODE_0E84A4                      ;0E849E|D004    |0E84A4;
                       LDA.B #$09                           ;0E84A0|A909    |      ;
                       BNE CODE_0E84A6                      ;0E84A2|D002    |0E84A6;
 
          CODE_0E84A4: LDA.B #$0B                           ;0E84A4|A90B    |      ;
 
          CODE_0E84A6: STA.B r_conveyaerRoomEffect          ;0E84A6|858B    |00008B;
                       SEC                                  ;0E84A8|38      |      ;
                       RTS                                  ;0E84A9|60      |      ;
 
 
          CODE_0E84AA: LDA.B r_gameTransition               ;0E84AA|A52A    |00002A;
                       CMP.B #$1B                           ;0E84AC|C91B    |      ;
                       BNE CODE_0E84B4                      ;0E84AE|D004    |0E84B4;
                       LDA.B #$00                           ;0E84B0|A900    |      ;
                       BEQ CODE_0E84A6                      ;0E84B2|F0F2    |0E84A6;
 
          CODE_0E84B4: LDA.B r_conveyaerRoomEffect          ;0E84B4|A58B    |00008B;
                       CMP.B #$08                           ;0E84B6|C908    |      ;
                       BEQ CODE_0E84BE                      ;0E84B8|F004    |0E84BE;
                       LDA.B #$0A                           ;0E84BA|A90A    |      ;
                       STA.B r_conveyaerRoomEffect          ;0E84BC|858B    |00008B;
 
          CODE_0E84BE: SEC                                  ;0E84BE|38      |      ;
                       RTS                                  ;0E84BF|60      |      ;
 
 
          CODE_0E84C0: LDX.B r_pointerQueue                 ;0E84C0|A608    |000008;
                       LDA.B #$FB                           ;0E84C2|A9FB    |      ;
                       JSR.W DATA8_0E840B                   ;0E84C4|200B84  |0E840B;
                       BNE CODE_0E848C                      ;0E84C7|D0C3    |0E848C;
 
          CODE_0E84C9: LDA.B #$07                           ;0E84C9|A907    |      ;
                       STA.B r_conveyaerRoomEffect          ;0E84CB|858B    |00008B;
                       LDA.W $04DB                          ;0E84CD|ADDB04  |0E04DB;
                       CLC                                  ;0E84D0|18      |      ;
                       ADC.B #$40                           ;0E84D1|6940    |      ;
                       STA.W $04DB                          ;0E84D3|8DDB04  |0E04DB;
                       LDA.W $041C                          ;0E84D6|AD1C04  |0E041C;
                       ADC.B #$00                           ;0E84D9|6900    |      ;
                       STA.W $041C                          ;0E84DB|8D1C04  |0E041C;
                       SEC                                  ;0E84DE|38      |      ;
                       RTS                                  ;0E84DF|60      |      ;
 
 
          CODE_0E84E0: LDX.B r_pointerQueue                 ;0E84E0|A608    |000008;
                       LDA.B #$05                           ;0E84E2|A905    |      ;
                       db $20                               ;0E84E4|        |      ;
                       dw CODE_0FFCDD                       ;0E84E5|        |0FFCDD;
                       BNE CODE_0E84F9                      ;0E84E7|D010    |0E84F9;
                       LDX.B r_pointerQueue                 ;0E84E9|A608    |000008;
                       LDA.B #$FB                           ;0E84EB|A9FB    |      ;
                       db $20                               ;0E84ED|        |      ;
                       dw CODE_0FFCDD                       ;0E84EE|        |0FFCDD;
                       BNE CODE_0E84F9                      ;0E84F0|D007    |0E84F9;
                       LDX.B r_ConveyorRelated              ;0E84F2|A691    |000091;
                       db $20                               ;0E84F4|        |      ;
                       dw CODE_0FFE9C                       ;0E84F5|        |0FFE9C;
 
          CODE_0E84F7: SEC                                  ;0E84F7|38      |      ;
                       RTS                                  ;0E84F8|60      |      ;
 
 
          CODE_0E84F9: LDA.B #$00                           ;0E84F9|A900    |      ;
                       STA.B r_conveyaerRoomEffect          ;0E84FB|858B    |00008B;
                       JSR.W CODE_0E8A02                    ;0E84FD|20028A  |0E8A02;
                       LDY.W $054E                          ;0E8500|AC4E05  |0E054E;
                       CPY.B #$02                           ;0E8503|C002    |      ;
                       BNE CODE_0E84F7                      ;0E8505|D0F0    |0E84F7;
                       LDA.W $041C                          ;0E8507|AD1C04  |0E041C;
                       CLC                                  ;0E850A|18      |      ;
                       ADC.B #$04                           ;0E850B|6904    |      ;
                       STA.W $041C                          ;0E850D|8D1C04  |0E041C;
                       JMP.W CODE_0E84F7                    ;0E8510|4CF784  |0E84F7;
 
 
          CODE_0E8513: LDA.W $041C                          ;0E8513|AD1C04  |0E041C;
                       CLC                                  ;0E8516|18      |      ;
                       ADC.B r_ConveyorRelated              ;0E8517|6591    |000091;
                       STA.W $041C                          ;0E8519|8D1C04  |0E041C;
                       SEC                                  ;0E851C|38      |      ;
                       RTS                                  ;0E851D|60      |      ;
 
 
          CODE_0E851E: LDA.W $041C                          ;0E851E|AD1C04  |0E041C;
                       CLC                                  ;0E8521|18      |      ;
                       ADC.B r_ConveyorRelated              ;0E8522|6591    |000091;
                       STA.W $041C                          ;0E8524|8D1C04  |0E041C;
                       SEC                                  ;0E8527|38      |      ;
                       RTS                                  ;0E8528|60      |      ;
 
 
          CODE_0E8529: JSR.W CODE_0E852D                    ;0E8529|202D85  |0E852D;
                       RTS                                  ;0E852C|60      |      ;
 
 
          CODE_0E852D: LDY.B #$00                           ;0E852D|A000    |      ;
 
          CODE_0E852F: LDA.W DATA8_0E8561,Y                 ;0E852F|B96185  |0E8561;
                       CMP.B #$FF                           ;0E8532|C9FF    |      ;
                       BEQ CODE_0E8545                      ;0E8534|F00F    |0E8545;
                       INY                                  ;0E8536|C8      |      ;
                       CMP.W $0565                          ;0E8537|CD6505  |0E0565;
                       BNE CODE_0E852F                      ;0E853A|D0F3    |0E852F;
 
          CODE_0E853C: LDA.W $0454                          ;0E853C|AD5404  |0E0454;
                       AND.B #$DF                           ;0E853F|29DF    |      ;
                       STA.W $0454                          ;0E8541|8D5404  |0E0454;
                       RTS                                  ;0E8544|60      |      ;
 
 
          CODE_0E8545: LDA.B r_roomEffect                   ;0E8545|A57D    |00007D;
                       AND.B #$0F                           ;0E8547|290F    |      ;
                       ASL A                                ;0E8549|0A      |      ;
                       TAY                                  ;0E854A|A8      |      ;
                       LDA.W $041C                          ;0E854B|AD1C04  |0E041C;
                       CMP.W DATA8_0E8568,Y                 ;0E854E|D96885  |0E8568;
                       BCC CODE_0E853C                      ;0E8551|90E9    |0E853C;
                       CMP.W DATA8_0E8569,Y                 ;0E8553|D96985  |0E8569;
                       BCS CODE_0E853C                      ;0E8556|B0E4    |0E853C;
                       LDA.W $0454                          ;0E8558|AD5404  |0E0454;
                       ORA.B #$20                           ;0E855B|0920    |      ;
                       STA.W $0454                          ;0E855D|8D5404  |0E0454;
                       RTS                                  ;0E8560|60      |      ;
 
 
         DATA8_0E8561: db $0E,$10,$12,$14,$1E,$24,$FF       ;0E8561|        |      ;
 
         DATA8_0E8568: db $40                               ;0E8568|        |      ;
 
 
         DATA8_0E8569: db $A5,$80,$C5,$20,$60,$B0,$E0       ;0E8569|        |      ;
 
         DATA8_0E8570: db $A5,$68,$C9,$82,$B0,$01,$60       ;0E8570|        |      ;
                       LDA.W $041C                          ;0E8577|AD1C04  |0E041C;
                       CLC                                  ;0E857A|18      |      ;
                       ADC.B r_scrollSpd                    ;0E857B|656E    |00006E;
                       STA.W $041C                          ;0E857D|8D1C04  |0E041C;
                       LDA.B r_GrantCurrentYpos             ;0E8580|A5D3    |0000D3;
                       CLC                                  ;0E8582|18      |      ;
                       ADC.B r_scrollSpd                    ;0E8583|656E    |00006E;
                       STA.B r_GrantCurrentYpos             ;0E8585|85D3    |0000D3;
                       RTS                                  ;0E8587|60      |      ;
 
 
          CODE_0E8588: LDA.B r_roomOrientation              ;0E8588|A568    |000068;
                       BMI CODE_0E85B7                      ;0E858A|302B    |0E85B7;
                       LDA.B r_sceneScrollOffsetHi          ;0E858C|A557    |000057;
                       BMI CODE_0E85A6                      ;0E858E|3016    |0E85A6;
                       CMP.B r_scroolLock                   ;0E8590|C571    |000071;
                       BEQ CODE_0E8595                      ;0E8592|F001    |0E8595;
                       RTS                                  ;0E8594|60      |      ;
 
 
          CODE_0E8595: LDA.B r_sceneScrollOffsetLo          ;0E8595|A556    |000056;
                       CLC                                  ;0E8597|18      |      ;
                       ADC.W $0438                          ;0E8598|6D3804  |0E0438;
                       STA.W $0438                          ;0E859B|8D3804  |0E0438;
                       LDA.B r_scroolLock                   ;0E859E|A571    |000071;
                       STA.B r_sceneScrollOffsetHi          ;0E85A0|8557    |000057;
                       LDA.B #$00                           ;0E85A2|A900    |      ;
                       BEQ CODE_0E85B3                      ;0E85A4|F00D    |0E85B3;
 
          CODE_0E85A6: LDA.B r_sceneScrollOffsetLo          ;0E85A6|A556    |000056;
                       CLC                                  ;0E85A8|18      |      ;
                       ADC.W $0438                          ;0E85A9|6D3804  |0E0438;
                       STA.W $0438                          ;0E85AC|8D3804  |0E0438;
                       LDA.B #$00                           ;0E85AF|A900    |      ;
                       STA.B r_sceneScrollOffsetHi          ;0E85B1|8557    |000057;
 
          CODE_0E85B3: STA.B r_sceneScrollOffsetLo          ;0E85B3|8556    |000056;
                       STA.B r_subSceneOffsets              ;0E85B5|8558    |000058;
 
          CODE_0E85B7: RTS                                  ;0E85B7|60      |      ;
 
 
          CODE_0E85B8: LDA.B #$00                           ;0E85B8|A900    |      ;
                       STA.B r_subSceneOffsets              ;0E85BA|8558    |000058;
                       LDA.W $0565                          ;0E85BC|AD6505  |0E0565;
                       CMP.B #$16                           ;0E85BF|C916    |      ;
                       BNE CODE_0E8611                      ;0E85C1|D04E    |0E8611;
                       LDA.B r_roomOrientation              ;0E85C3|A568    |000068;
                       BMI DATA8_0E8612                     ;0E85C5|304B    |0E8612;
                       LDA.B r_PrevRoomOrientation          ;0E85C7|A573    |000073;
                       BMI DATA8_0E8616                     ;0E85C9|304B    |0E8616;
                       LDX.B #$00                           ;0E85CB|A200    |      ;
                       LDA.W $0520                          ;0E85CD|AD2005  |0E0520;
                       BMI CODE_0E85D6                      ;0E85D0|3004    |0E85D6;
                       INX                                  ;0E85D2|E8      |      ;
                       INX                                  ;0E85D3|E8      |      ;
                       INX                                  ;0E85D4|E8      |      ;
                       INX                                  ;0E85D5|E8      |      ;
 
          CODE_0E85D6: LDA.W $05EF                          ;0E85D6|ADEF05  |0E05EF;
                       BEQ CODE_0E85DD                      ;0E85D9|F002    |0E85DD;
                       INX                                  ;0E85DB|E8      |      ;
                       INX                                  ;0E85DC|E8      |      ;
 
          CODE_0E85DD: LDA.W DATA8_0E861A,X                 ;0E85DD|BD1A86  |0E861A;
                       CLC                                  ;0E85E0|18      |      ;
                       ADC.W $0438                          ;0E85E1|6D3804  |0E0438;
                       STA.W $0438                          ;0E85E4|8D3804  |0E0438;
                       LDA.W DATA8_0E861B,X                 ;0E85E7|BD1B86  |0E861B;
                       STA.W $041C                          ;0E85EA|8D1C04  |0E041C;
                       LDY.W $054E                          ;0E85ED|AC4E05  |0E054E;
                       LDA.W data_yPos,Y                    ;0E85F0|B93286  |0E8632;
                       CLC                                  ;0E85F3|18      |      ;
                       ADC.W $041C                          ;0E85F4|6D1C04  |0E041C;
                       STA.W $041C                          ;0E85F7|8D1C04  |0E041C;
                       LDA.W $0438                          ;0E85FA|AD3804  |0E0438;
                       LDX.W $05EF                          ;0E85FD|AEEF05  |0E05EF;
                       BEQ CODE_0E860A                      ;0E8600|F008    |0E860A;
                       CLC                                  ;0E8602|18      |      ;
                       ADC.W data_yPos,Y                    ;0E8603|793286  |0E8632;
                       STA.W $0438                          ;0E8606|8D3804  |0E0438;
                       RTS                                  ;0E8609|60      |      ;
 
 
          CODE_0E860A: SEC                                  ;0E860A|38      |      ;
                       SBC.W data_yPos,Y                    ;0E860B|F93286  |0E8632;
                       STA.W $0438                          ;0E860E|8D3804  |0E0438;
 
          CODE_0E8611: RTS                                  ;0E8611|60      |      ;
 
 
         DATA8_0E8612: db $A2,$08,$D0,$B7                   ;0E8612|        |      ;
 
         DATA8_0E8616: db $A2,$10,$D0,$B3                   ;0E8616|        |      ;
 
         DATA8_0E861A: db $18                               ;0E861A|        |      ;
 
         DATA8_0E861B: db $D0,$E8,$D0,$EC,$28,$15,$28,$19   ;0E861B|        |      ;
                       db $D3,$E8,$D3,$F3,$33,$0D,$33,$11   ;0E8623|        |      ;
                       db $D0,$F0,$D0,$EB,$28,$15,$28       ;0E862B|        |      ;
 
            data_yPos: db $00,$00,$04,$00                   ;0E8632|        |      ;
 
          CODE_0E8636: LDA.B r_sceneScrollOffsetLo          ;0E8636|A556    |000056;
                       BEQ CODE_0E866F                      ;0E8638|F035    |0E866F;
                       CLC                                  ;0E863A|18      |      ;
                       ADC.W $0438                          ;0E863B|6D3804  |0E0438;
                       STA.W $0438                          ;0E863E|8D3804  |0E0438;
                       RTS                                  ;0E8641|60      |      ;
 
 
          CODE_0E8642: LDA.B r_roomOrientation              ;0E8642|A568    |000068;
                       BMI CODE_0E8636                      ;0E8644|30F0    |0E8636;
                       LDA.W $0438                          ;0E8646|AD3804  |0E0438;
                       BMI CODE_0E867A                      ;0E8649|302F    |0E867A;
                       LDA.B r_sceneScrollOffsetLo          ;0E864B|A556    |000056;
                       ORA.B r_sceneScrollOffsetHi          ;0E864D|0557    |000057;
                       BEQ CODE_0E8679                      ;0E864F|F028    |0E8679;
                       LDA.B #$80                           ;0E8651|A980    |      ;
                       SEC                                  ;0E8653|38      |      ;
                       SBC.W $0438                          ;0E8654|ED3804  |0E0438;
                       STA.B r_pointerQueue                 ;0E8657|8508    |000008;
                       LDA.B r_sceneScrollOffsetLo          ;0E8659|A556    |000056;
                       SEC                                  ;0E865B|38      |      ;
                       SBC.B r_pointerQueue                 ;0E865C|E508    |000008;
                       BCS CODE_0E8672                      ;0E865E|B012    |0E8672;
                       LDY.B r_sceneScrollOffsetHi          ;0E8660|A457    |000057;
                       DEY                                  ;0E8662|88      |      ;
                       BPL CODE_0E8670                      ;0E8663|100B    |0E8670;
                       CLC                                  ;0E8665|18      |      ;
                       ADC.B #$80                           ;0E8666|6980    |      ;
                       STA.W $0438                          ;0E8668|8D3804  |0E0438;
                       LDA.B #$00                           ;0E866B|A900    |      ;
                       STA.B r_sceneScrollOffsetLo          ;0E866D|8556    |000056;
 
          CODE_0E866F: RTS                                  ;0E866F|60      |      ;
 
 
          CODE_0E8670: STY.B r_sceneScrollOffsetHi          ;0E8670|8457    |000057;
 
          CODE_0E8672: STA.B r_sceneScrollOffsetLo          ;0E8672|8556    |000056;
                       LDA.B #$80                           ;0E8674|A980    |      ;
                       STA.W $0438                          ;0E8676|8D3804  |0E0438;
 
          CODE_0E8679: RTS                                  ;0E8679|60      |      ;
 
 
          CODE_0E867A: LDA.B r_sceneScrollOffsetHi          ;0E867A|A557    |000057;
                       CMP.B r_scroolLock                   ;0E867C|C571    |000071;
                       BEQ CODE_0E8679                      ;0E867E|F0F9    |0E8679;
                       LDA.W $0438                          ;0E8680|AD3804  |0E0438;
                       SEC                                  ;0E8683|38      |      ;
                       SBC.B #$80                           ;0E8684|E980    |      ;
                       BEQ CODE_0E8679                      ;0E8686|F0F1    |0E8679;
                       STA.B r_pointerQueue                 ;0E8688|8508    |000008;
                       LDA.B r_sceneScrollOffsetLo          ;0E868A|A556    |000056;
                       CLC                                  ;0E868C|18      |      ;
                       ADC.B r_pointerQueue                 ;0E868D|6508    |000008;
                       BCC CODE_0E8672                      ;0E868F|90E1    |0E8672;
                       LDY.B r_sceneScrollOffsetHi          ;0E8691|A457    |000057;
                       INY                                  ;0E8693|C8      |      ;
                       CPY.B r_scroolLock                   ;0E8694|C471    |000071;
                       BNE CODE_0E8670                      ;0E8696|D0D8    |0E8670;
                       CLC                                  ;0E8698|18      |      ;
                       ADC.B #$80                           ;0E8699|6980    |      ;
                       STA.W $0438                          ;0E869B|8D3804  |0E0438;
                       STY.B r_sceneScrollOffsetHi          ;0E869E|8457    |000057;
                       LDA.B #$00                           ;0E86A0|A900    |      ;
                       STA.B r_sceneScrollOffsetLo          ;0E86A2|8556    |000056;
                       RTS                                  ;0E86A4|60      |      ;
 
                       CLC                                  ;0E86A5|18      |      ;
                       ADC.W $0537                          ;0E86A6|6D3705  |0E0537;
                       STA.W $0537                          ;0E86A9|8D3705  |0E0537;
                       LDA.B #$00                           ;0E86AC|A900    |      ;
                       ADC.W $0520                          ;0E86AE|6D2005  |0E0520;
                       STA.W $0520                          ;0E86B1|8D2005  |0E0520;
                       RTS                                  ;0E86B4|60      |      ;
 
 
          CODE_0E86B5: LDA.B r_roomOrientation              ;0E86B5|A568    |000068;
                       AND.B #$01                           ;0E86B7|2901    |      ;
                       BEQ CODE_0E86C3                      ;0E86B9|F008    |0E86C3;
                       LDA.B r_sceneScrollOffsetHi          ;0E86BB|A557    |000057;
                       ORA.B r_sceneScrollOffsetLo          ;0E86BD|0556    |000056;
                       BEQ CODE_0E86D6                      ;0E86BF|F015    |0E86D6;
                       BNE CODE_0E86CF                      ;0E86C1|D00C    |0E86CF;
 
          CODE_0E86C3: LDA.B r_sceneScrollOffsetHi          ;0E86C3|A557    |000057;
                       CMP.B r_scroolLock                   ;0E86C5|C571    |000071;
                       BNE CODE_0E86CF                      ;0E86C7|D006    |0E86CF;
                       LDA.B r_sceneScrollOffsetLo          ;0E86C9|A556    |000056;
                       CMP.B #$30                           ;0E86CB|C930    |      ;
                       BEQ CODE_0E86D6                      ;0E86CD|F007    |0E86D6;
 
          CODE_0E86CF: JMP.W CODE_0E8716                    ;0E86CF|4C1687  |0E8716;
 
 
          CODE_0E86D2: CMP.B #$82                           ;0E86D2|C982    |      ;
                       BCS CODE_0E86B5                      ;0E86D4|B0DF    |0E86B5;
 
          CODE_0E86D6: LDA.W $0520                          ;0E86D6|AD2005  |0E0520;
                       BMI CODE_0E86FC                      ;0E86D9|3021    |0E86FC;
                       ORA.W $0537                          ;0E86DB|0D3705  |0E0537;
                       BEQ CODE_0E8711                      ;0E86DE|F031    |0E8711;
                       LDA.B r_roomOrientation              ;0E86E0|A568    |000068;
                       AND.B #$01                           ;0E86E2|2901    |      ;
                       BEQ CODE_0E8716                      ;0E86E4|F030    |0E8716;
                       LDA.W $041C                          ;0E86E6|AD1C04  |0E041C;
                       BPL CODE_0E8716                      ;0E86E9|102B    |0E8716;
                       LDA.B r_scroolLock                   ;0E86EB|A571    |000071;
                       CMP.B r_sceneScrollOffsetHi          ;0E86ED|C557    |000057;
                       BNE CODE_0E86F7                      ;0E86EF|D006    |0E86F7;
                       LDA.B r_sceneScrollOffsetLo          ;0E86F1|A556    |000056;
                       CMP.B #$30                           ;0E86F3|C930    |      ;
                       BEQ CODE_0E8716                      ;0E86F5|F01F    |0E8716;
 
          CODE_0E86F7: LDA.B #$01                           ;0E86F7|A901    |      ;
                       STA.B r_scrollDirection              ;0E86F9|8565    |000065;
                       RTS                                  ;0E86FB|60      |      ;
 
 
          CODE_0E86FC: LDA.B r_roomOrientation              ;0E86FC|A568    |000068;
                       AND.B #$01                           ;0E86FE|2901    |      ;
                       BNE CODE_0E8716                      ;0E8700|D014    |0E8716;
                       LDA.W $041C                          ;0E8702|AD1C04  |0E041C;
                       BMI CODE_0E8716                      ;0E8705|300F    |0E8716;
                       LDA.B r_sceneScrollOffsetLo          ;0E8707|A556    |000056;
                       ORA.B r_sceneScrollOffsetHi          ;0E8709|0557    |000057;
                       BEQ CODE_0E8716                      ;0E870B|F009    |0E8716;
                       LDA.B #$00                           ;0E870D|A900    |      ;
                       STA.B r_scrollDirection              ;0E870F|8565    |000065;
 
          CODE_0E8711: RTS                                  ;0E8711|60      |      ;
 
 
          CODE_0E8712: LDA.B r_roomOrientation              ;0E8712|A568    |000068;
                       BMI CODE_0E86D2                      ;0E8714|30BC    |0E86D2;
 
          CODE_0E8716: LDA.W $04DB                          ;0E8716|ADDB04  |0E04DB;
                       CLC                                  ;0E8719|18      |      ;
                       ADC.W $0537                          ;0E871A|6D3705  |0E0537;
                       STA.W $04DB                          ;0E871D|8DDB04  |0E04DB;
                       LDA.W $041C                          ;0E8720|AD1C04  |0E041C;
                       ADC.W $0520                          ;0E8723|6D2005  |0E0520;
                       STA.W $041C                          ;0E8726|8D1C04  |0E041C;
                       RTS                                  ;0E8729|60      |      ;
 
 
          CODE_0E872A: LDY.W $04F2                          ;0E872A|ACF204  |0E04F2;
                       BPL CODE_0E8734                      ;0E872D|1005    |0E8734;
                       LDA.B r_knockBackDirrection          ;0E872F|A590    |000090;
                       BEQ CODE_0E8740                      ;0E8731|F00D    |0E8740;
 
          CODE_0E8733: RTS                                  ;0E8733|60      |      ;
 
 
          CODE_0E8734: LDA.B r_knockBackDirrection          ;0E8734|A590    |000090;
                       BEQ CODE_0E8733                      ;0E8736|F0FB    |0E8733;
                       BNE CODE_0E8740                      ;0E8738|D006    |0E8740;
 
          CODE_0E873A: LDA.B r_conveyaerRoomEffect          ;0E873A|A58B    |00008B;
                       CMP.B #$02                           ;0E873C|C902    |      ;
                       BEQ CODE_0E872A                      ;0E873E|F0EA    |0E872A;
 
          CODE_0E8740: LDA.B r_bossActiveFlag               ;0E8740|A578    |000078;
                       BNE stopScroll_if_boss_87            ;0E8742|D01E    |0E8762;
                       LDA.B r_roomOrientation              ;0E8744|A568    |000068;
                       BMI stopScroll_if_boss_87            ;0E8746|301A    |0E8762;
                       LDA.W $04F2                          ;0E8748|ADF204  |0E04F2;
                       BMI CODE_0E8782                      ;0E874B|3035    |0E8782;
                       ORA.W $0509                          ;0E874D|0D0905  |0E0509;
                       BEQ CODE_0E8781                      ;0E8750|F02F    |0E8781;
                       LDA.B r_scroolLock                   ;0E8752|A571    |000071;
                       CMP.B r_sceneScrollOffsetHi          ;0E8754|C557    |000057;
                       BEQ stopScroll_if_boss_87            ;0E8756|F00A    |0E8762;
                       LDA.W $0438                          ;0E8758|AD3804  |0E0438;
                       BPL stopScroll_if_boss_87            ;0E875B|1005    |0E8762;
                       LDA.B #$01                           ;0E875D|A901    |      ;
                       STA.B r_scrollDirection              ;0E875F|8565    |000065;
                       RTS                                  ;0E8761|60      |      ;
 
 
stopScroll_if_boss_87: LDA.W $04C4                          ;0E8762|ADC404  |0E04C4;
                       CLC                                  ;0E8765|18      |      ;
                       ADC.W $0509                          ;0E8766|6D0905  |0E0509;
                       STA.W $04C4                          ;0E8769|8DC404  |0E04C4;
                       LDA.W $0438                          ;0E876C|AD3804  |0E0438;
                       ADC.W $04F2                          ;0E876F|6DF204  |0E04F2;
                       STA.W $0438                          ;0E8772|8D3804  |0E0438;
                       LDY.B r_roomOrientation              ;0E8775|A468    |000068;
                       BMI CODE_0E87A2                      ;0E8777|3029    |0E87A2;
                       CMP.B #$18                           ;0E8779|C918    |      ;
                       BCC CODE_0E8797                      ;0E877B|901A    |0E8797;
                       CMP.B #$E9                           ;0E877D|C9E9    |      ;
                       BCS CODE_0E879B                      ;0E877F|B01A    |0E879B;
 
          CODE_0E8781: RTS                                  ;0E8781|60      |      ;
 
 
          CODE_0E8782: LDA.B r_horizontalScrollLockBridge   ;0E8782|A5C8    |0000C8;
                       BNE stopScroll_if_boss_87            ;0E8784|D0DC    |0E8762;
                       LDA.B r_sceneScrollOffsetLo          ;0E8786|A556    |000056;
                       ORA.B r_sceneScrollOffsetHi          ;0E8788|0557    |000057;
                       BEQ stopScroll_if_boss_87            ;0E878A|F0D6    |0E8762;
                       LDY.W $0438                          ;0E878C|AC3804  |0E0438;
                       DEY                                  ;0E878F|88      |      ;
                       BMI stopScroll_if_boss_87            ;0E8790|30D0    |0E8762;
                       LDA.B #$00                           ;0E8792|A900    |      ;
                       STA.B r_scrollDirection              ;0E8794|8565    |000065;
                       RTS                                  ;0E8796|60      |      ;
 
 
          CODE_0E8797: LDX.B #$00                           ;0E8797|A200    |      ;
                       BEQ DATA8_0E879D                     ;0E8799|F002    |0E879D;
 
          CODE_0E879B: LDX.B #$01                           ;0E879B|A201    |      ;
 
         DATA8_0E879D: db $20                               ;0E879D|        |      ;
                       dw CODE_0FE69A                       ;0E879E|        |0FE69A;
                       BCS CODE_0E87D2                      ;0E87A0|B030    |0E87D2;
 
          CODE_0E87A2: LDA.W $0438                          ;0E87A2|AD3804  |0E0438;
                       CMP.B #$10                           ;0E87A5|C910    |      ;
                       BCC CODE_0E87B3                      ;0E87A7|900A    |0E87B3;
                       CMP.B #$F0                           ;0E87A9|C9F0    |      ;
                       BCC CODE_0E87D1                      ;0E87AB|9024    |0E87D1;
                       LDX.B #$01                           ;0E87AD|A201    |      ;
                       LDA.B #$F0                           ;0E87AF|A9F0    |      ;
                       BNE CODE_0E87B7                      ;0E87B1|D004    |0E87B7;
 
          CODE_0E87B3: LDX.B #$00                           ;0E87B3|A200    |      ;
                       LDA.B #$10                           ;0E87B5|A910    |      ;
 
          CODE_0E87B7: STA.W $0438                          ;0E87B7|8D3804  |0E0438;
                       LDA.W $054E                          ;0E87BA|AD4E05  |0E054E;
                       CMP.B #$03                           ;0E87BD|C903    |      ;
                       BNE CODE_0E87D1                      ;0E87BF|D010    |0E87D1;
                       LDA.W $0565                          ;0E87C1|AD6505  |0E0565;
                       CMP.B #$34                           ;0E87C4|C934    |      ;
                       BNE CODE_0E87D1                      ;0E87C6|D009    |0E87D1;
                       LDA.B #$36                           ;0E87C8|A936    |      ;
                       STA.W $0565                          ;0E87CA|8D6505  |0E0565;
                       STX.W $05D8                          ;0E87CD|8ED805  |0E05D8;
                       RTS                                  ;0E87D0|60      |      ;
 
 
          CODE_0E87D1: RTS                                  ;0E87D1|60      |      ;
 
 
          CODE_0E87D2: CPX.B #$00                           ;0E87D2|E000    |      ;
                       BEQ CODE_0E87DA                      ;0E87D4|F004    |0E87DA;
                       LDA.B #$E9                           ;0E87D6|A9E9    |      ;
                       BNE CODE_0E87DC                      ;0E87D8|D002    |0E87DC;
 
          CODE_0E87DA: LDA.B #$17                           ;0E87DA|A917    |      ;
 
          CODE_0E87DC: STA.W $0438                          ;0E87DC|8D3804  |0E0438;
                       RTS                                  ;0E87DF|60      |      ;
 
 
         PTR16_0E87E0: dw DATA8_0E8825                      ;0E87E0|        |0E8825;
                       dw DATA8_0E87E4                      ;0E87E2|        |0E87E4;
 
         DATA8_0E87E4: db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0E87E4|        |      ;
                       db $FC,$FC,$FC,$FC,$FC,$FC,$F8,$F8   ;0E87EC|        |      ;
                       db $F8,$F8,$F4,$F4,$F4,$F0,$F0,$F0   ;0E87F4|        |      ;
                       db $EC,$EC,$E8,$E8,$E8,$E4,$E4,$E0   ;0E87FC|        |      ;
                       db $DC,$DC,$D8,$D8,$D4,$D0,$CC,$CC   ;0E8804|        |      ;
                       db $C8,$C4,$C0,$BC,$B8,$B8,$B0,$AC   ;0E880C|        |      ;
                       db $A8,$A4,$A0,$9C,$94,$90,$88,$84   ;0E8814|        |      ;
                       db $7C,$74,$6C,$64,$58,$4C,$40,$2C   ;0E881C|        |      ;
                       db $00                               ;0E8824|        |      ;
 
         DATA8_0E8825: db $FF,$FF,$FF,$FE,$FD,$FC,$FA,$F9   ;0E8825|        |      ;
                       db $F7,$F5,$F2,$F0,$EC,$E9,$E5,$E1   ;0E882D|        |      ;
                       db $DD,$D8,$D3,$CD,$C7,$C1,$B9,$B1   ;0E8835|        |      ;
                       db $A9,$9F,$95,$89,$7B,$6C,$59,$40   ;0E883D|        |      ;
                       db $00                               ;0E8845|        |      ;
 
         PTR16_0E8846: dw DATA8_0E884E                      ;0E8846|        |0E884E;
 
         PTR16_0E8848: dw DATA8_0E886F                      ;0E8848|        |0E886F;
                       dw DATA8_0E8890                      ;0E884A|        |0E8890;
                       dw DATA8_0E88D1                      ;0E884C|        |0E88D1;
 
         DATA8_0E884E: db $00,$08,$10,$18,$20,$28,$2F,$37   ;0E884E|        |      ;
                       db $3E,$45,$4C,$53,$59,$5F,$65,$6A   ;0E8856|        |      ;
                       db $6F,$73,$77,$7A,$7D,$7F,$80,$80   ;0E885E|        |      ;
                       db $7F,$7D,$79,$74,$6C,$62,$54,$3E   ;0E8866|        |      ;
                       db $00                               ;0E886E|        |      ;
 
         DATA8_0E886F: db $00,$00,$01,$02,$04,$06,$09,$0C   ;0E886F|        |      ;
                       db $10,$14,$19,$1E,$24,$2A,$31,$38   ;0E8877|        |      ;
                       db $40,$48,$51,$5A,$64,$6E,$79,$84   ;0E887F|        |      ;
 
                       db $90,$9C,$A9,$B6,$C4,$D2,$E1,$F0   ;0E8887|        |      ;
                       db $FF                               ;0E888F|        |      ;
 
         DATA8_0E8890: db $00,$06,$0C,$12,$18,$1E,$24,$2A   ;0E8890|        |      ;
                       db $30,$35,$3B,$41,$47,$4C,$52,$57   ;0E8898|        |      ;
                       db $5D,$62,$68,$6D,$72,$77,$7C,$81   ;0E88A0|        |      ;
                       db $85,$8A,$8F,$93,$97,$9B,$9F,$A3   ;0E88A8|        |      ;
                       db $A6,$AA,$AD,$B0,$B3,$B5,$B7,$BA   ;0E88B0|        |      ;
                       db $BB,$BD,$BE,$BF,$C0,$C0,$C0,$BF   ;0E88B8|        |      ;
                       db $BE,$BD,$BB,$B9,$B6,$B2,$AE,$A9   ;0E88C0|        |      ;
                       db $A3,$9C,$93,$89,$7D,$6F,$5C,$43   ;0E88C8|        |      ;
                       db $00                               ;0E88D0|        |      ;
 
         DATA8_0E88D1: db $00,$00,$00,$01,$02,$02,$03,$05   ;0E88D1|        |      ;
                       db $06,$08,$09,$0B,$0E,$10,$12,$15   ;0E88D9|        |      ;
                       db $18,$1B,$1E,$22,$26,$29,$2D,$32   ;0E88E1|        |      ;
                       db $36,$3B,$3F,$44,$4A,$4F,$54,$5A   ;0E88E9|        |      ;
                       db $60,$66,$6C,$73,$7A,$80,$87,$8F   ;0E88F1|        |      ;
                       db $96,$9E,$A5,$AD,$B6,$BE,$C6,$CF   ;0E88F9|        |      ;
                       db $D8,$E1,$EA,$F4,$FE,$FF,$FF,$FF   ;0E8901|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0E8909|        |      ;
                       db $FF                               ;0E8911|        |      ;
 
         DATA8_0E8912: db $00                               ;0E8912|        |      ;
 
         DATA8_0E8913: db $01,$00,$01,$10,$01,$20,$01,$20   ;0E8913|        |      ;
                       db $01,$30,$01,$40,$01,$40,$01,$50   ;0E891B|        |      ;
                       db $01,$60,$01,$70,$01,$70,$01,$80   ;0E8923|        |      ;
                       db $01                               ;0E892B|        |      ;
 
         DATA8_0E892C: db $00,$04,$08,$0C,$10,$14,$18,$1C   ;0E892C|        |      ;
                       db $20,$24,$28,$2C,$30,$34,$38,$3C   ;0E8934|        |      ;
                       db $40,$44,$48,$4C,$50,$54,$58,$5C   ;0E893C|        |      ;
                       db $60,$64,$68,$6C,$70,$74,$78,$7C   ;0E8944|        |      ;
                       db $80                               ;0E894C|        |      ;
 
         DATA8_0E894D: db $00,$00,$00,$01,$02,$02,$04,$05   ;0E894D|        |      ;
                       db $06,$08,$0A,$0C,$0F,$11,$14,$17   ;0E8955|        |      ;
                       db $1B,$1E,$22,$26,$2B,$30,$35,$3A   ;0E895D|        |      ;
                       db $40,$47,$4D,$54,$5C,$64,$6D,$76   ;0E8965|        |      ;
 
                       db $80                               ;0E896D|        |      ;
 
 
      subtractOneLife: LDA.B r_lifes                        ;0E896E|A535    |000035;
                       AND.B #$0F                           ;0E8970|290F    |      ;
                       STA.B $01                            ;0E8972|8501    |000001;
                       LDA.B r_lifes                        ;0E8974|A535    |000035;
                       AND.B #$F0                           ;0E8976|29F0    |      ;
                       STA.B $02                            ;0E8978|8502    |000002;
                       LDA.B $01                            ;0E897A|A501    |000001;
                       SEC                                  ;0E897C|38      |      ;
                       SBC.B #$01                           ;0E897D|E901    |      ;
                       BPL CODE_0E8991                      ;0E897F|1010    |0E8991;
                       SEC                                  ;0E8981|38      |      ;
                       SBC.B #$06                           ;0E8982|E906    |      ;
                       STA.B $01                            ;0E8984|8501    |000001;
                       LDA.B $02                            ;0E8986|A502    |000002;
                       SEC                                  ;0E8988|38      |      ;
                       SBC.B #$10                           ;0E8989|E910    |      ;
                       STA.B $02                            ;0E898B|8502    |000002;
                       LDA.B $01                            ;0E898D|A501    |000001;
                       AND.B #$0F                           ;0E898F|290F    |      ;
 
          CODE_0E8991: ORA.B $02                            ;0E8991|0502    |000002;
                       STA.B r_lifes                        ;0E8993|8535    |000035;
                       RTS                                  ;0E8995|60      |      ;
 
 
          CODE_0E8996: LDA.B r_lvlTimerLo                   ;0E8996|A57E    |00007E;
                       ORA.B r_lvlTimerHi                   ;0E8998|057F    |00007F;
                       BNE levelTimer                       ;0E899A|D007    |0E89A3;
                       JSR.W CODE_0E8398                    ;0E899C|209883  |0E8398;
                       JSR.W CODE_0EBDC4                    ;0E899F|20C4BD  |0EBDC4;
                       RTS                                  ;0E89A2|60      |      ;
 
 
           levelTimer: LDA.B r_lvlTimerLo                   ;0E89A3|A57E    |00007E;
                       AND.B #$0F                           ;0E89A5|290F    |      ;
                       STA.B $01                            ;0E89A7|8501    |000001;
                       LDA.B r_lvlTimerLo                   ;0E89A9|A57E    |00007E;
                       AND.B #$F0                           ;0E89AB|29F0    |      ;
                       STA.B $02                            ;0E89AD|8502    |000002;
                       LDA.B r_lvlTimerHi                   ;0E89AF|A57F    |00007F;
                       AND.B #$0F                           ;0E89B1|290F    |      ;
                       STA.B $03                            ;0E89B3|8503    |000003;
                       LDA.B r_lvlTimerHi                   ;0E89B5|A57F    |00007F;
                       AND.B #$F0                           ;0E89B7|29F0    |      ;
                       STA.B $04                            ;0E89B9|8504    |000004;
                       JSR.W CODE_0E89CF                    ;0E89BB|20CF89  |0E89CF;
                       LDA.B $01                            ;0E89BE|A501    |000001;
                       AND.B #$0F                           ;0E89C0|290F    |      ;
                       ORA.B $02                            ;0E89C2|0502    |000002;
                       STA.B r_lvlTimerLo                   ;0E89C4|857E    |00007E;
                       LDA.B $03                            ;0E89C6|A503    |000003;
                       AND.B #$0F                           ;0E89C8|290F    |      ;
                       ORA.B $04                            ;0E89CA|0504    |000004;
                       STA.B r_lvlTimerHi                   ;0E89CC|857F    |00007F;
                       RTS                                  ;0E89CE|60      |      ;
 
 
          CODE_0E89CF: LDA.B $01                            ;0E89CF|A501    |000001;
                       SEC                                  ;0E89D1|38      |      ;
                       SBC.B #$01                           ;0E89D2|E901    |      ;
                       STA.B $01                            ;0E89D4|8501    |000001;
                       BCS CODE_0E89E6                      ;0E89D6|B00E    |0E89E6;
                       SEC                                  ;0E89D8|38      |      ;
                       SBC.B #$06                           ;0E89D9|E906    |      ;
                       STA.B $01                            ;0E89DB|8501    |000001;
                       LDA.B $02                            ;0E89DD|A502    |000002;
                       SEC                                  ;0E89DF|38      |      ;
                       SBC.B #$10                           ;0E89E0|E910    |      ;
                       STA.B $02                            ;0E89E2|8502    |000002;
                       BCC CODE_0E89E7                      ;0E89E4|9001    |0E89E7;
 
          CODE_0E89E6: RTS                                  ;0E89E6|60      |      ;
 
 
          CODE_0E89E7: SEC                                  ;0E89E7|38      |      ;
                       SBC.B #$60                           ;0E89E8|E960    |      ;
                       STA.B $02                            ;0E89EA|8502    |000002;
                       LDA.B $03                            ;0E89EC|A503    |000003;
                       SEC                                  ;0E89EE|38      |      ;
                       SBC.B #$01                           ;0E89EF|E901    |      ;
                       STA.B $03                            ;0E89F1|8503    |000003;
                       BCS CODE_0E89E6                      ;0E89F3|B0F1    |0E89E6;
                       SEC                                  ;0E89F5|38      |      ;
                       SBC.B #$06                           ;0E89F6|E906    |      ;
                       STA.B $03                            ;0E89F8|8503    |000003;
                       LDA.B $04                            ;0E89FA|A504    |000004;
                       SEC                                  ;0E89FC|38      |      ;
                       SBC.B #$10                           ;0E89FD|E910    |      ;
                       STA.B $04                            ;0E89FF|8504    |000004;
                       RTS                                  ;0E8A01|60      |      ;
 
 
          CODE_0E8A02: LDA.B r_roomOrientation              ;0E8A02|A568    |000068;
                       BMI CODE_0E8A0F                      ;0E8A04|3009    |0E8A0F;
                       LDA.W $041C                          ;0E8A06|AD1C04  |0E041C;
                       AND.B #$F0                           ;0E8A09|29F0    |      ;
                       STA.W $041C                          ;0E8A0B|8D1C04  |0E041C;
                       RTS                                  ;0E8A0E|60      |      ;
 
 
          CODE_0E8A0F: CLC                                  ;0E8A0F|18      |      ;
                       LDA.W $041C                          ;0E8A10|AD1C04  |0E041C;
                       ADC.B r_sceneScrollOffsetLo          ;0E8A13|6556    |000056;
                       AND.B #$F0                           ;0E8A15|29F0    |      ;
                       SEC                                  ;0E8A17|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;0E8A18|E556    |000056;
                       CLC                                  ;0E8A1A|18      |      ;
                       ADC.B #$03                           ;0E8A1B|6903    |      ;
                       STA.W $041C                          ;0E8A1D|8D1C04  |0E041C;
 
          CODE_0E8A20: RTS                                  ;0E8A20|60      |      ;
 
 
            IRQ_stuff: LDA.B r_lvlTimerHi                   ;0E8A21|A57F    |00007F; ??
                       BNE CODE_0E8A36                      ;0E8A23|D011    |0E8A36;
                       LDA.B r_lvlTimerLo                   ;0E8A25|A57E    |00007E;
                       CMP.B #$20                           ;0E8A27|C920    |      ;
                       BCS CODE_0E8A36                      ;0E8A29|B00B    |0E8A36;
                       LDA.B r_gameStateLoopCounter         ;0E8A2B|A51A    |00001A;
                       AND.B #$3F                           ;0E8A2D|293F    |      ;
                       BNE CODE_0E8A36                      ;0E8A2F|D005    |0E8A36;
                       LDA.B #$49                           ;0E8A31|A949    |      ;
                       db $20                               ;0E8A33|        |      ;
                       dw initFreezWaterEffect_01           ;0E8A34|        |0FE25F;
 
          CODE_0E8A36: LDA.B r_gameStateLoopCounter         ;0E8A36|A51A    |00001A;
                       AND.B #$3F                           ;0E8A38|293F    |      ;
                       BNE CODE_0E8A3F                      ;0E8A3A|D003    |0E8A3F;
                       JSR.W CODE_0E8996                    ;0E8A3C|209689  |0E8996;
 
          CODE_0E8A3F: LDA.B r_stopWatchActive              ;0E8A3F|A5AB    |0000AB;
                       BEQ CODE_0E8A59                      ;0E8A41|F016    |0E8A59;
                       DEC.B r_stopWatchTimer               ;0E8A43|C6AC    |0000AC;
                       BNE CODE_0E8A4E                      ;0E8A45|D007    |0E8A4E;
                       LDA.B #$00                           ;0E8A47|A900    |      ;
                       STA.B r_stopWatchActive              ;0E8A49|85AB    |0000AB;
                       STA.W $06C9                          ;0E8A4B|8DC906  |0E06C9;
 
          CODE_0E8A4E: LDA.B r_stopWatchTimer               ;0E8A4E|A5AC    |0000AC;
                       AND.B #$3F                           ;0E8A50|293F    |      ;
                       BNE CODE_0E8A59                      ;0E8A52|D005    |0E8A59;
                       LDA.B #$3C                           ;0E8A54|A93C    |      ;
                       db $20                               ;0E8A56|        |      ;
                       dw initFreezWaterEffect_01           ;0E8A57|        |0FE25F;
 
          CODE_0E8A59: JSR.W UNREACH_0EAE52                 ;0E8A59|2052AE  |0EAE52;
                       LDA.W $0565                          ;0E8A5C|AD6505  |0E0565;
                       BMI CODE_0E8A20                      ;0E8A5F|30BF    |0E8A20;
                       JSR.W CODE_0E80D9                    ;0E8A61|20D980  |0E80D9;
                       LDA.B r_conveyaerRoomEffect          ;0E8A64|A58B    |00008B;
                       STA.B r_previousBackup88             ;0E8A66|85CF    |0000CF;
                       LDA.B r_damagePlayer                 ;0E8A68|A581    |000081;
                       AND.B #$0F                           ;0E8A6A|290F    |      ;
                       STA.B r_conveyaerRoomEffect          ;0E8A6C|858B    |00008B;
                       LDA.B #$00                           ;0E8A6E|A900    |      ;
                       STA.B r_damagePlayer                 ;0E8A70|8581    |000081;
                       LDA.B r_roomOrientation              ;0E8A72|A568    |000068;
                       BPL CODE_0E8A8D                      ;0E8A74|1017    |0E8A8D;
                       AND.B #$01                           ;0E8A76|2901    |      ;
                       BNE CODE_0E8A7E                      ;0E8A78|D004    |0E8A7E;
                       LDA.B #$00                           ;0E8A7A|A900    |      ;
                       BEQ CODE_0E8A8B                      ;0E8A7C|F00D    |0E8A8B;
 
          CODE_0E8A7E: CLC                                  ;0E8A7E|18      |      ;
                       LDA.B #$30                           ;0E8A7F|A930    |      ;
                       ADC.B r_sceneScrollOffsetLo          ;0E8A81|6556    |000056;
                       AND.B #$F0                           ;0E8A83|29F0    |      ;
                       SEC                                  ;0E8A85|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;0E8A86|E556    |000056;
                       CLC                                  ;0E8A88|18      |      ;
                       ADC.B #$03                           ;0E8A89|6903    |      ;
 
          CODE_0E8A8B: STA.B r_HighestTileToCheckForCollisionsInVertRoom;0E8A8B|85D0    |0000D0;
 
          CODE_0E8A8D: LDA.B #$02                           ;0E8A8D|A902    |      ;
                       STA.B r_scrollDirection              ;0E8A8F|8565    |000065;
                       LDY.W $054E                          ;0E8A91|AC4E05  |0E054E;
                       BEQ CODE_0E8AA2                      ;0E8A94|F00C    |0E8AA2;
                       DEY                                  ;0E8A96|88      |      ;
                       BEQ CODE_0E8AB0                      ;0E8A97|F017    |0E8AB0;
                       DEY                                  ;0E8A99|88      |      ;
                       BEQ CODE_0E8AB6                      ;0E8A9A|F01A    |0E8AB6;
                       JSR.W CODE_0EA5A8                    ;0E8A9C|20A8A5  |0EA5A8; alucard
                       JMP.W CODE_0E8AA5                    ;0E8A9F|4CA58A  |0E8AA5;
 
 
          CODE_0E8AA2: JSR.W CODE_0E937B                    ;0E8AA2|207B93  |0E937B; trevor
 
          CODE_0E8AA5: LDA.W $0565                          ;0E8AA5|AD6505  |0E0565;
                       BMI CODE_0E8AC4                      ;0E8AA8|301A    |0E8AC4;
                       JSR.W CODE_0E8BC0                    ;0E8AAA|20C08B  |0E8BC0; sypha
                       JMP.W CODE_0E8D13                    ;0E8AAD|4C138D  |0E8D13;
 
 
          CODE_0E8AB0: JSR.W UNREACH_0E9BFC                 ;0E8AB0|20FC9B  |0E9BFC; grant
                       JMP.W CODE_0E8AA5                    ;0E8AB3|4CA58A  |0E8AA5;
 
 
          CODE_0E8AB6: JSR.W UNREACH_0E9C3B                 ;0E8AB6|203B9C  |0E9C3B;
                       JMP.W CODE_0E8AA5                    ;0E8AB9|4CA58A  |0E8AA5;
 
 
 clearPlayerVertSpeed: LDA.B #$00                           ;0E8ABC|A900    |      ;
                       STA.W $0520                          ;0E8ABE|8D2005  |0E0520;
                       STA.W $0537                          ;0E8AC1|8D3705  |0E0537;
 
          CODE_0E8AC4: RTS                                  ;0E8AC4|60      |      ;
 
 
   playerState00_init: LDY.W $054E                          ;0E8AC5|AC4E05  |0E054E;
                       LDA.W charSpecGroups,Y               ;0E8AC8|B9DA8A  |0E8ADA;
                       STA.W $048C                          ;0E8ACB|8D8C04  |0E048C;
                       LDA.B #$02                           ;0E8ACE|A902    |      ;
                       STA.W $0400                          ;0E8AD0|8D0004  |0E0400;
                       INC.W $0565                          ;0E8AD3|EE6505  |0E0565;
                       INC.W $0565                          ;0E8AD6|EE6505  |0E0565;
                       RTS                                  ;0E8AD9|60      |      ;
 
 
       charSpecGroups: db $00,$02,$04,$06                   ;0E8ADA|        |      ;
                       LDA.B r_deathDelay                   ;0E8ADE|A5BF    |0000BF;
                       AND.B #$7F                           ;0E8AE0|297F    |      ;
                       db $20                               ;0E8AE2|        |      ;
                       dw jumpFromStackYXpreserved          ;0E8AE3|        |0FE86D;
                       dw CODE_0E8AEB                       ;0E8AE5|        |0E8AEB;
                       dw CODE_0E8AFF                       ;0E8AE7|        |0E8AFF;
                       dw CODE_0E8B48                       ;0E8AE9|        |0E8B48;
 
          CODE_0E8AEB: LDY.B #$00                           ;0E8AEB|A000    |      ;
                       STY.W $0593                          ;0E8AED|8C9305  |0E0593;
                       STY.W $0413                          ;0E8AF0|8C1304  |0E0413;
                       STY.B r_invincableFrames             ;0E8AF3|8480    |000080;
                       STY.W $0470                          ;0E8AF5|8C7004  |0E0470;
                       INY                                  ;0E8AF8|C8      |      ;
                       STY.W $057C                          ;0E8AF9|8C7C05  |0E057C;
                       INC.B r_deathDelay                   ;0E8AFC|E6BF    |0000BF;
                       RTS                                  ;0E8AFE|60      |      ;
 
 
          CODE_0E8AFF: JSR.W CODE_0E8B1A                    ;0E8AFF|201A8B  |0E8B1A;
                       LDA.W $057C                          ;0E8B02|AD7C05  |0E057C;
                       CMP.B #$FF                           ;0E8B05|C9FF    |      ;
                       BEQ CODE_0E8B0A                      ;0E8B07|F001    |0E8B0A;
                       RTS                                  ;0E8B09|60      |      ;
 
 
          CODE_0E8B0A: LDA.B #$4E                           ;0E8B0A|A94E    |      ;
                       db $20                               ;0E8B0C|        |      ;
                       dw initFreezWaterEffect_01           ;0E8B0D|        |0FE25F;
                       db $20                               ;0E8B0F|        |      ;
                       dw setAutoPlayFlag                   ;0E8B10|        |0FE5CE;
                       LDA.B #$64                           ;0E8B12|A964    |      ;
                       STA.W $05D4                          ;0E8B14|8DD405  |0E05D4;
                       INC.B r_deathDelay                   ;0E8B17|E6BF    |0000BF;
                       RTS                                  ;0E8B19|60      |      ;
 
 
          CODE_0E8B1A: DEC.W $057C                          ;0E8B1A|CE7C05  |0E057C;
                       BEQ CODE_0E8B20                      ;0E8B1D|F001    |0E8B20;
                       RTS                                  ;0E8B1F|60      |      ;
 
 
          CODE_0E8B20: LDA.W $0593                          ;0E8B20|AD9305  |0E0593;
                       ASL A                                ;0E8B23|0A      |      ;
                       TAY                                  ;0E8B24|A8      |      ;
                       LDA.W DATA8_0E8B4B,Y                 ;0E8B25|B94B8B  |0E8B4B;
                       STA.W $0400                          ;0E8B28|8D0004  |0E0400;
                       LDA.W DATA8_0E8B4C,Y                 ;0E8B2B|B94C8B  |0E8B4C;
                       STA.W $057C                          ;0E8B2E|8D7C05  |0E057C;
                       LDA.W $054E                          ;0E8B31|AD4E05  |0E054E;
                       ASL A                                ;0E8B34|0A      |      ;
                       CLC                                  ;0E8B35|18      |      ;
                       ADC.W $0593                          ;0E8B36|6D9305  |0E0593;
                       TAY                                  ;0E8B39|A8      |      ;
                       LDA.W DATA8_0E8B4F,Y                 ;0E8B3A|B94F8B  |0E8B4F;
                       CLC                                  ;0E8B3D|18      |      ;
                       ADC.W $041C                          ;0E8B3E|6D1C04  |0E041C;
                       STA.W $041C                          ;0E8B41|8D1C04  |0E041C;
                       INC.W $0593                          ;0E8B44|EE9305  |0E0593;
                       RTS                                  ;0E8B47|60      |      ;
 
 
          CODE_0E8B48: JMP.W CODE_0E8BA7                    ;0E8B48|4CA78B  |0E8BA7;
 
 
         DATA8_0E8B4B: db $12                               ;0E8B4B|        |      ;
 
         DATA8_0E8B4C: db $08,$14,$FF                       ;0E8B4C|        |      ;
 
         DATA8_0E8B4F: db $06,$F9,$0A,$FC,$04,$FF,$04,$FC   ;0E8B4F|        |      ;
                       LDA.B r_deathDelay                   ;0E8B57|A5BF    |0000BF;
                       AND.B #$7F                           ;0E8B59|297F    |      ;
                       TAY                                  ;0E8B5B|A8      |      ;
                       BNE CODE_0E8B8F                      ;0E8B5C|D031    |0E8B8F;
                       LDA.W $041C                          ;0E8B5E|AD1C04  |0E041C;
                       LDY.B r_roomOrientation              ;0E8B61|A468    |000068;
                       BMI CODE_0E8B6B                      ;0E8B63|3006    |0E8B6B;
                       CMP.B #$E0                           ;0E8B65|C9E0    |      ;
                       BCC CODE_0E8B71                      ;0E8B67|9008    |0E8B71;
                       BCS CODE_0E8B8C                      ;0E8B69|B021    |0E8B8C;
 
          CODE_0E8B6B: CMP.B #$E0                           ;0E8B6B|C9E0    |      ;
                       BCC CODE_0E8B71                      ;0E8B6D|9002    |0E8B71;
                       BCS CODE_0E8B8C                      ;0E8B6F|B01B    |0E8B8C;
 
          CODE_0E8B71: LDA.W $0520                          ;0E8B71|AD2005  |0E0520;
                       CMP.B #$05                           ;0E8B74|C905    |      ;
                       BCS CODE_0E8B89                      ;0E8B76|B011    |0E8B89;
                       LDA.W $0537                          ;0E8B78|AD3705  |0E0537;
                       CLC                                  ;0E8B7B|18      |      ;
                       ADC.B #$40                           ;0E8B7C|6940    |      ;
                       STA.W $0537                          ;0E8B7E|8D3705  |0E0537;
                       LDA.W $0520                          ;0E8B81|AD2005  |0E0520;
                       ADC.B #$00                           ;0E8B84|6900    |      ;
                       STA.W $0520                          ;0E8B86|8D2005  |0E0520;
 
          CODE_0E8B89: JMP.W CODE_0E8712                    ;0E8B89|4C1287  |0E8712;
 
 
          CODE_0E8B8C: INC.B r_deathDelay                   ;0E8B8C|E6BF    |0000BF;
                       RTS                                  ;0E8B8E|60      |      ;
 
 
          CODE_0E8B8F: DEY                                  ;0E8B8F|88      |      ;
                       BNE CODE_0E8BA7                      ;0E8B90|D015    |0E8BA7;
                       LDA.B #$00                           ;0E8B92|A900    |      ;
                       STA.W $0400                          ;0E8B94|8D0004  |0E0400;
                       LDA.B #$80                           ;0E8B97|A980    |      ;
                       STA.W $05D4                          ;0E8B99|8DD405  |0E05D4;
                       LDA.B #$4E                           ;0E8B9C|A94E    |      ;
                       db $20                               ;0E8B9E|        |      ;
                       dw initFreezWaterEffect_01           ;0E8B9F|        |0FE25F;
                       db $20                               ;0E8BA1|        |      ;
                       dw setAutoPlayFlag                   ;0E8BA2|        |0FE5CE;
                       INC.B r_deathDelay                   ;0E8BA4|E6BF    |0000BF;
                       RTS                                  ;0E8BA6|60      |      ;
 
 
          CODE_0E8BA7: DEC.W $05D4                          ;0E8BA7|CED405  |0E05D4;
                       BEQ CODE_0E8BAD                      ;0E8BAA|F001    |0E8BAD;
                       RTS                                  ;0E8BAC|60      |      ;
 
 
          CODE_0E8BAD: LDA.B #$05                           ;0E8BAD|A905    |      ;
                       STA.B r_gameState                    ;0E8BAF|8518    |000018;
                       LDA.B #$00                           ;0E8BB1|A900    |      ;
                       STA.B r_gameSubstate                 ;0E8BB3|8519    |000019;
                       LDA.W $0565                          ;0E8BB5|AD6505  |0E0565;
                       ORA.B #$80                           ;0E8BB8|0980    |      ;
                       STA.W $0565                          ;0E8BBA|8D6505  |0E0565;
                       db $4C                               ;0E8BBD|        |      ;
 
                       dw unsetAutoPlayFlag                 ;0E8BBE|        |0FE5CA;
 
          CODE_0E8BC0: LDA.B r_deathDelay                   ;0E8BC0|A5BF    |0000BF;
                       BEQ CODE_0E8BC5                      ;0E8BC2|F001    |0E8BC5;
 
          CODE_0E8BC4: RTS                                  ;0E8BC4|60      |      ;
 
 
          CODE_0E8BC5: LDA.B r_gameTransition               ;0E8BC5|A52A    |00002A;
                       CMP.B #$10                           ;0E8BC7|C910    |      ;
                       BEQ CODE_0E8BC4                      ;0E8BC9|F0F9    |0E8BC4;
                       LDA.B r_roomEffect                   ;0E8BCB|A57D    |00007D;
                       AND.B #$F0                           ;0E8BCD|29F0    |      ;
                       CMP.B #$50                           ;0E8BCF|C950    |      ;
                       BEQ CODE_0E8BFC                      ;0E8BD1|F029    |0E8BFC;
                       CMP.B #$60                           ;0E8BD3|C960    |      ;
                       BEQ CODE_0E8C1E                      ;0E8BD5|F047    |0E8C1E;
                       CMP.B #$70                           ;0E8BD7|C970    |      ;
                       BEQ CODE_0E8BFC                      ;0E8BD9|F021    |0E8BFC;
 
          CODE_0E8BDB: LDA.W $041C                          ;0E8BDB|AD1C04  |0E041C;
                       LDY.B r_roomOrientation              ;0E8BDE|A468    |000068;
                       BPL CODE_0E8BF4                      ;0E8BE0|1012    |0E8BF4;
                       CMP.B #$E0                           ;0E8BE2|C9E0    |      ;
                       BCS CODE_0E8BF1                      ;0E8BE4|B00B    |0E8BF1;
                       CPY.B #$83                           ;0E8BE6|C083    |      ;
                       BNE CODE_0E8BFB                      ;0E8BE8|D011    |0E8BFB;
                       CMP.B #$18                           ;0E8BEA|C918    |      ;
                       BCS CODE_0E8BFB                      ;0E8BEC|B00D    |0E8BFB;
                       JMP.W CODE_0E8398                    ;0E8BEE|4C9883  |0E8398;
 
 
          CODE_0E8BF1: JMP.W CODE_0E8CF9                    ;0E8BF1|4CF98C  |0E8CF9;
 
 
          CODE_0E8BF4: CMP.B #$E0                           ;0E8BF4|C9E0    |      ;
                       BCC CODE_0E8BFB                      ;0E8BF6|9003    |0E8BFB;
                       JMP.W CODE_0E8CF9                    ;0E8BF8|4CF98C  |0E8CF9;
 
 
          CODE_0E8BFB: RTS                                  ;0E8BFB|60      |      ;
 
 
          CODE_0E8BFC: LDA.B r_roomEffect                   ;0E8BFC|A57D    |00007D;
                       AND.B #$0F                           ;0E8BFE|290F    |      ;
                       TAY                                  ;0E8C00|A8      |      ;
                       LDA.W yPos_data01,Y                  ;0E8C01|B9568C  |0E8C56;
                       CMP.W $041C                          ;0E8C04|CD1C04  |0E041C;
                       BCS CODE_0E8BFB                      ;0E8C07|B0F2    |0E8BFB;
 
          CODE_0E8C09: LDA.B r_currPartnerID                ;0E8C09|A582    |000082;
                       CMP.B #$08                           ;0E8C0B|C908    |      ;
                       BNE CODE_0E8C18                      ;0E8C0D|D009    |0E8C18;
                       LDA.B r_gameStateLoopCounter         ;0E8C0F|A51A    |00001A;
                       AND.B #$03                           ;0E8C11|2903    |      ;
                       BNE CODE_0E8BDB                      ;0E8C13|D0C6    |0E8BDB;
                       JMP.W CODE_0E8C58                    ;0E8C15|4C588C  |0E8C58;
 
 
          CODE_0E8C18: JSR.W CODE_0E8C58                    ;0E8C18|20588C  |0E8C58;
                       JMP.W CODE_0E8CF9                    ;0E8C1B|4CF98C  |0E8CF9;
 
 
          CODE_0E8C1E: LDA.B r_roomEffect                   ;0E8C1E|A57D    |00007D;
                       AND.B #$0F                           ;0E8C20|290F    |      ;
                       BNE CODE_0E8BDB                      ;0E8C22|D0B7    |0E8BDB;
                       LDA.W $041C                          ;0E8C24|AD1C04  |0E041C;
                       CMP.B #$C0                           ;0E8C27|C9C0    |      ;
                       BCC CODE_0E8BFB                      ;0E8C29|90D0    |0E8BFB;
                       LDA.W $0438                          ;0E8C2B|AD3804  |0E0438;
                       CLC                                  ;0E8C2E|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;0E8C2F|6556    |000056;
                       STA.B r_temp_Xpos                    ;0E8C31|850A    |00000A;
                       LDA.B r_sceneScrollOffsetHi          ;0E8C33|A557    |000057;
                       ADC.B #$00                           ;0E8C35|6900    |      ;
                       STA.B $0B                            ;0E8C37|850B    |00000B;
                       CMP.B #$01                           ;0E8C39|C901    |      ;
                       BCC CODE_0E8C09                      ;0E8C3B|90CC    |0E8C09;
                       BNE CODE_0E8C48                      ;0E8C3D|D009    |0E8C48;
                       LDA.B r_temp_Xpos                    ;0E8C3F|A50A    |00000A;
                       CMP.B #$20                           ;0E8C41|C920    |      ;
                       BCC CODE_0E8C09                      ;0E8C43|90C4    |0E8C09;
                       JMP.W CODE_0E8BDB                    ;0E8C45|4CDB8B  |0E8BDB;
 
 
          CODE_0E8C48: CMP.B #$02                           ;0E8C48|C902    |      ;
                       BCC CODE_0E8BDB                      ;0E8C4A|908F    |0E8BDB;
                       BNE CODE_0E8C09                      ;0E8C4C|D0BB    |0E8C09;
                       LDA.B r_temp_Xpos                    ;0E8C4E|A50A    |00000A;
                       CMP.B #$C0                           ;0E8C50|C9C0    |      ;
                       BCC CODE_0E8BDB                      ;0E8C52|9087    |0E8BDB;
                       BCS CODE_0E8C09                      ;0E8C54|B0B3    |0E8C09;
 
          yPos_data01: db $B0,$D0                           ;0E8C56|        |      ;
 
          CODE_0E8C58: LDA.B #$23                           ;0E8C58|A923    |      ;
                       db $20                               ;0E8C5A|        |      ;
                       dw initFreezWaterEffect_01           ;0E8C5B|        |0FE25F;
                       LDA.B r_gameStateLoopCounter         ;0E8C5D|A51A    |00001A;
                       AND.B #$03                           ;0E8C5F|2903    |      ;
                       STA.B $00                            ;0E8C61|8500    |000000;
                       ASL A                                ;0E8C63|0A      |      ;
                       CLC                                  ;0E8C64|18      |      ;
                       ADC.B $00                            ;0E8C65|6500    |000000;
                       TAY                                  ;0E8C67|A8      |      ;
                       STA.B r_roomSectionChrBanksDataOffset;0E8C68|850F    |00000F;
                       LDX.B #$14                           ;0E8C6A|A214    |      ;
 
          CODE_0E8C6C: LDY.B r_roomSectionChrBanksDataOffset;0E8C6C|A40F    |00000F;
                       LDA.W DATA8_0E8CBD,Y                 ;0E8C6E|B9BD8C  |0E8CBD;
                       ASL A                                ;0E8C71|0A      |      ;
                       STA.B $00                            ;0E8C72|8500    |000000;
                       ASL A                                ;0E8C74|0A      |      ;
                       CLC                                  ;0E8C75|18      |      ;
                       ADC.B $00                            ;0E8C76|6500    |000000;
                       TAY                                  ;0E8C78|A8      |      ;
                       LDA.W DATA8_0E8CC9,Y                 ;0E8C79|B9C98C  |0E8CC9;
                       CLC                                  ;0E8C7C|18      |      ;
                       ADC.W $0438                          ;0E8C7D|6D3804  |0E0438;
                       STA.W $0438,X                        ;0E8C80|9D3804  |0E0438;
                       LDA.W yPosData03,Y                   ;0E8C83|B9CA8C  |0E8CCA;
                       CLC                                  ;0E8C86|18      |      ;
                       ADC.W $041C                          ;0E8C87|6D1C04  |0E041C;
                       SEC                                  ;0E8C8A|38      |      ;
                       SBC.B #$0C                           ;0E8C8B|E90C    |      ;
                       STA.W $041C,X                        ;0E8C8D|9D1C04  |0E041C;
                       LDA.W DATA8_0E8CCB,Y                 ;0E8C90|B9CB8C  |0E8CCB;
                       STA.W $04F2,X                        ;0E8C93|9DF204  |0E04F2;
                       LDA.W UNREACH_0E8CCC,Y               ;0E8C96|B9CC8C  |0E8CCC;
                       STA.W $0509,X                        ;0E8C99|9D0905  |0E0509;
                       LDA.W UNREACH_0E8CCD,Y               ;0E8C9C|B9CD8C  |0E8CCD;
                       STA.W $0520,X                        ;0E8C9F|9D2005  |0E0520;
                       LDA.W UNREACH_0E8CCE,Y               ;0E8CA2|B9CE8C  |0E8CCE;
                       STA.W $0537,X                        ;0E8CA5|9D3705  |0E0537;
                       LDA.B #$0C                           ;0E8CA8|A90C    |      ;
                       STA.W $054E,X                        ;0E8CAA|9D4E05  |0E054E;
                       LDA.B #$00                           ;0E8CAD|A900    |      ;
                       STA.W $0470,X                        ;0E8CAF|9D7004  |0E0470;
                       STA.W $0565,X                        ;0E8CB2|9D6505  |0E0565;
                       INC.B r_roomSectionChrBanksDataOffset;0E8CB5|E60F    |00000F;
                       INX                                  ;0E8CB7|E8      |      ;
                       CPX.B #$17                           ;0E8CB8|E017    |      ;
                       BNE CODE_0E8C6C                      ;0E8CBA|D0B0    |0E8C6C;
                       RTS                                  ;0E8CBC|60      |      ;
 
 
         DATA8_0E8CBD: db $00,$03,$04,$05,$01,$02,$02,$05   ;0E8CBD|        |      ;
                       db $01,$06,$03,$04                   ;0E8CC5|        |      ;
 
         DATA8_0E8CC9: db $08                               ;0E8CC9|        |      ;
 
           yPosData03: db $02                               ;0E8CCA|        |      ;
 
         DATA8_0E8CCB: db $01                               ;0E8CCB|        |      ;
 
       UNREACH_0E8CCC: db $00                               ;0E8CCC|        |      ;
 
       UNREACH_0E8CCD: db $FD                               ;0E8CCD|        |0E04C0;
 
       UNREACH_0E8CCE: db $C0,$04,$00,$00,$80,$FE,$80,$F8   ;0E8CCE|        |      ;
                       db $FC,$FF,$40,$FF,$40,$08,$02,$FE   ;0E8CD6|        |0E40FF;
                       db $20,$FE,$C0,$FC,$00,$01,$80,$FF   ;0E8CDE|        |0EC0FE;
                       db $80,$FD,$02,$FF,$00,$FD,$80,$02   ;0E8CE6|        |0E8CE5;
 
                       db $FE,$01,$40,$FE,$C0,$FF,$02,$02   ;0E8CEE|        |0E4001;
                       db $00,$FF,$50                       ;0E8CF6|        |      ;
 
          CODE_0E8CF9: JSR.W CODE_0EBDC4                    ;0E8CF9|20C4BD  |0EBDC4;
                       LDA.W $0520                          ;0E8CFC|AD2005  |0E0520;
                       BPL CODE_0E8D09                      ;0E8CFF|1008    |0E8D09;
                       LDA.B #$00                           ;0E8D01|A900    |      ;
                       STA.W $0520                          ;0E8D03|8D2005  |0E0520;
                       STA.W $0537                          ;0E8D06|8D3705  |0E0537;
 
          CODE_0E8D09: LDA.B #$80                           ;0E8D09|A980    |      ;
                       STA.B r_deathDelay                   ;0E8D0B|85BF    |0000BF;
                       LDA.B #$2C                           ;0E8D0D|A92C    |      ;
                       STA.W $0565                          ;0E8D0F|8D6505  |0E0565;
                       RTS                                  ;0E8D12|60      |      ;
 
 
          CODE_0E8D13: LDA.B r_gameTransition               ;0E8D13|A52A    |00002A;
                       CMP.B #$1B                           ;0E8D15|C91B    |      ;
                       BEQ CODE_0E8D89                      ;0E8D17|F070    |0E8D89;
                       LDA.B r_roomEffect                   ;0E8D19|A57D    |00007D;
                       CMP.B #$30                           ;0E8D1B|C930    |      ;
                       BEQ CODE_0E8D37                      ;0E8D1D|F018    |0E8D37;
                       CMP.B #$31                           ;0E8D1F|C931    |      ;
                       BEQ CODE_0E8D37                      ;0E8D21|F014    |0E8D37;
                       CMP.B #$41                           ;0E8D23|C941    |      ;
                       BEQ CODE_0E8D29                      ;0E8D25|F002    |0E8D29;
                       BNE CODE_0E8D8E                      ;0E8D27|D065    |0E8D8E;
 
          CODE_0E8D29: LDA.B r_gameStateLoopCounter         ;0E8D29|A51A    |00001A;
                       AND.B #$0F                           ;0E8D2B|290F    |      ;
                       BNE CODE_0E8D8E                      ;0E8D2D|D05F    |0E8D8E;
                       LDA.B #$20                           ;0E8D2F|A920    |      ;
                       db $20                               ;0E8D31|        |      ;
                       dw initFreezWaterEffect_01           ;0E8D32|        |0FE25F;
                       JMP.W CODE_0E8D8E                    ;0E8D34|4C8E8D  |0E8D8E;
 
 
          CODE_0E8D37: LDA.B r_gameStateLoopCounter         ;0E8D37|A51A    |00001A;
                       AND.B #$0F                           ;0E8D39|290F    |      ;
                       BNE CODE_0E8D7B                      ;0E8D3B|D03E    |0E8D7B;
                       LDA.B r_sceneScrollOffsetLo          ;0E8D3D|A556    |000056;
                       ADC.W $0438                          ;0E8D3F|6D3804  |0E0438;
                       STA.B $00                            ;0E8D42|8500    |000000;
                       LDA.B r_sceneScrollOffsetHi          ;0E8D44|A557    |000057;
                       ADC.B #$00                           ;0E8D46|6900    |      ;
                       STA.B $01                            ;0E8D48|8501    |000001;
                       LDA.B r_roomEffect                   ;0E8D4A|A57D    |00007D;
                       AND.B #$0F                           ;0E8D4C|290F    |      ;
                       ASL A                                ;0E8D4E|0A      |      ;
                       TAY                                  ;0E8D4F|A8      |      ;
                       LDA.W DATA8_0E8E77,Y                 ;0E8D50|B9778E  |0E8E77;
                       SEC                                  ;0E8D53|38      |      ;
                       SBC.B $00                            ;0E8D54|E500    |000000;
                       TAX                                  ;0E8D56|AA      |      ;
                       LDA.W DATA8_0E8E76,Y                 ;0E8D57|B9768E  |0E8E76;
                       SBC.B $01                            ;0E8D5A|E501    |000001;
                       BCS CODE_0E8D68                      ;0E8D5C|B00A    |0E8D68;
                       CMP.B #$FF                           ;0E8D5E|C9FF    |      ;
                       BNE CODE_0E8D76                      ;0E8D60|D014    |0E8D76;
                       CPX.B #$80                           ;0E8D62|E080    |      ;
                       BCC CODE_0E8D76                      ;0E8D64|9010    |0E8D76;
                       BCS CODE_0E8D6E                      ;0E8D66|B006    |0E8D6E;
 
          CODE_0E8D68: BNE CODE_0E8D76                      ;0E8D68|D00C    |0E8D76;
                       CPX.B #$80                           ;0E8D6A|E080    |      ;
                       BCS CODE_0E8D76                      ;0E8D6C|B008    |0E8D76;
 
          CODE_0E8D6E: LDA.B #$25                           ;0E8D6E|A925    |      ;
                       db $20                               ;0E8D70|        |      ;
                       dw initFreezWaterEffect_01           ;0E8D71|        |0FE25F;
                       JMP.W CODE_0E8D7B                    ;0E8D73|4C7B8D  |0E8D7B;
 
 
          CODE_0E8D76: LDA.B #$20                           ;0E8D76|A920    |      ;
                       db $20                               ;0E8D78|        |      ;
                       dw initFreezWaterEffect_01           ;0E8D79|        |0FE25F;
 
          CODE_0E8D7B: LDA.B r_deathDelay                   ;0E8D7B|A5BF    |0000BF;
                       BMI CODE_0E8D89                      ;0E8D7D|300A    |0E8D89;
                       LDA.B r_conveyaerRoomEffect          ;0E8D7F|A58B    |00008B;
                       CMP.B #$08                           ;0E8D81|C908    |      ;
                       BEQ CODE_0E8D8F                      ;0E8D83|F00A    |0E8D8F;
                       CMP.B #$09                           ;0E8D85|C909    |      ;
                       BEQ CODE_0E8D8F                      ;0E8D87|F006    |0E8D8F;
 
          CODE_0E8D89: LDA.B #$00                           ;0E8D89|A900    |      ;
                       STA.W $041A                          ;0E8D8B|8D1A04  |0E041A;
 
          CODE_0E8D8E: RTS                                  ;0E8D8E|60      |      ;
 
 
          CODE_0E8D8F: LDA.W $054E                          ;0E8D8F|AD4E05  |0E054E;
                       ASL A                                ;0E8D92|0A      |      ;
                       TAY                                  ;0E8D93|A8      |      ;
                       LDA.W DATA8_0E8DE3,Y                 ;0E8D94|B9E38D  |0E8DE3;
                       STA.B r_pointerQueue                 ;0E8D97|8508    |000008;
                       LDA.W DATA8_0E8DE4,Y                 ;0E8D99|B9E48D  |0E8DE4;
                       STA.B $09                            ;0E8D9C|8509    |000009;
                       LDY.B #$00                           ;0E8D9E|A000    |      ;
 
          CODE_0E8DA0: LDA.B (r_pointerQueue),Y             ;0E8DA0|B108    |000008;
                       CMP.B #$FF                           ;0E8DA2|C9FF    |      ;
                       BEQ CODE_0E8D8E                      ;0E8DA4|F0E8    |0E8D8E;
                       INY                                  ;0E8DA6|C8      |      ;
                       CMP.W $0400                          ;0E8DA7|CD0004  |0E0400;
                       BEQ CODE_0E8DB0                      ;0E8DAA|F004    |0E8DB0;
                       INY                                  ;0E8DAC|C8      |      ;
                       INY                                  ;0E8DAD|C8      |      ;
                       BNE CODE_0E8DA0                      ;0E8DAE|D0F0    |0E8DA0;
 
          CODE_0E8DB0: LDA.W $04A8                          ;0E8DB0|ADA804  |0E04A8;
                       BEQ CODE_0E8DDA                      ;0E8DB3|F025    |0E8DDA;
                       LDA.W $0438                          ;0E8DB5|AD3804  |0E0438;
                       CLC                                  ;0E8DB8|18      |      ;
                       ADC.B (r_pointerQueue),Y             ;0E8DB9|7108    |000008;
 
          CODE_0E8DBB: STA.W $0452                          ;0E8DBB|8D5204  |0E0452;
                       INY                                  ;0E8DBE|C8      |      ;
                       LDA.W $041C                          ;0E8DBF|AD1C04  |0E041C;
                       CLC                                  ;0E8DC2|18      |      ;
                       ADC.B (r_pointerQueue),Y             ;0E8DC3|7108    |000008;
                       CMP.B #$38                           ;0E8DC5|C938    |      ;
                       BCC CODE_0E8D89                      ;0E8DC7|90C0    |0E8D89;
                       STA.W $0436                          ;0E8DC9|8D3604  |0E0436;
                       LDA.B #$62                           ;0E8DCC|A962    |      ;
                       STA.W $041A                          ;0E8DCE|8D1A04  |0E041A;
                       LDA.B #$00                           ;0E8DD1|A900    |      ;
                       STA.W $046E                          ;0E8DD3|8D6E04  |0E046E;
                       STA.W $048A                          ;0E8DD6|8D8A04  |0E048A;
                       RTS                                  ;0E8DD9|60      |      ;
 
 
          CODE_0E8DDA: LDA.W $0438                          ;0E8DDA|AD3804  |0E0438;
                       SEC                                  ;0E8DDD|38      |      ;
                       SBC.B (r_pointerQueue),Y             ;0E8DDE|F108    |000008;
                       JMP.W CODE_0E8DBB                    ;0E8DE0|4CBB8D  |0E8DBB;
 
 
         DATA8_0E8DE3: db $EB                               ;0E8DE3|        |      ;
 
         DATA8_0E8DE4: db $8D,$0D,$8E,$35,$8E,$4B,$8E,$02   ;0E8DE4|        |      ;
                       db $FB,$F1,$04,$FE,$F0,$06,$FC,$F1   ;0E8DEC|        |      ;
                       db $0E,$FD,$F8,$16,$FD,$F5,$18,$03   ;0E8DF4|        |      ;
                       db $F1,$1A,$FE,$F0,$1C,$FB,$F2,$1E   ;0E8DFC|        |      ;
                       db $FD,$F9,$20,$FE,$F8,$22,$FB,$FA   ;0E8E04|        |      ;
                       db $FF,$02,$FB,$F1,$04,$FE,$F0,$06   ;0E8E0C|        |      ;
                       db $FC,$F1,$0E,$FD,$F8,$16,$FD,$F5   ;0E8E14|        |      ;
                       db $18,$FD,$F5,$1A,$FD,$F5,$1C,$FD   ;0E8E1C|        |      ;
                       db $F5,$1E,$FD,$F5,$2C,$FD,$F5,$2E   ;0E8E24|        |      ;
                       db $FD,$F5,$34,$FD,$F5,$36,$FD,$F5   ;0E8E2C|        |      ;
                       db $FF,$02,$FB,$F5,$04,$FE,$F4,$06   ;0E8E34|        |      ;
                       db $FB,$F5,$0E,$FE,$00,$16,$FB,$F5   ;0E8E3C|        |      ;
                       db $24,$FE,$F0,$26,$F8,$F4,$FF,$02   ;0E8E44|        |      ;
                       db $00,$E9,$04,$00,$E8,$06,$00,$E9   ;0E8E4C|        |      ;
                       db $0E,$FD,$F8,$16,$FD,$F5,$18,$00   ;0E8E54|        |      ;
                       db $E9,$1A,$00,$E9,$1C,$00,$E9,$1E   ;0E8E5C|        |      ;
                       db $FD,$F8,$20,$FD,$F8,$22,$FD,$F8   ;0E8E64|        |      ;
                       db $24,$00,$FD,$26,$00,$FF,$28,$00   ;0E8E6C|        |      ;
                       db $F8,$FF                           ;0E8E74|        |      ;
 
         DATA8_0E8E76: db $02                               ;0E8E76|        |      ;
 
         DATA8_0E8E77: db $80,$01,$80                       ;0E8E77|        |      ;
                       STY.W $0509                          ;0E8E7A|8C0905  |0E0509;
                       STA.W $04F2                          ;0E8E7D|8DF204  |0E04F2;
                       JSR.W clearPlayerVertSpeed           ;0E8E80|20BC8A  |0E8ABC;
                       SEC                                  ;0E8E83|38      |      ;
                       RTS                                  ;0E8E84|60      |      ;
 
                       LDA.B r_gameTransition               ;0E8E85|A52A    |00002A;
                       CMP.B #$1B                           ;0E8E87|C91B    |      ;
                       BEQ UNREACH_0E8EB5                   ;0E8E89|F02A    |0E8EB5;
                       LDA.B r_conveyaerRoomEffect          ;0E8E8B|A58B    |00008B;
                       CMP.B #$01                           ;0E8E8D|C901    |      ;
                       BEQ UNREACH_0E8EBA                   ;0E8E8F|F029    |0E8EBA;
                       CMP.B #$0C                           ;0E8E91|C90C    |      ;
                       BCS UNREACH_0E8EB5                   ;0E8E93|B020    |0E8EB5;
                       SEC                                  ;0E8E95|38      |      ;
                       SBC.B #$05                           ;0E8E96|E905    |      ;
                       BCC UNREACH_0E8EB5                   ;0E8E98|901B    |0E8EB5;
                       BNE CODE_0E8E9F                      ;0E8E9A|D003    |0E8E9F;
                       JMP.W CODE_0E8F95                    ;0E8E9C|4C958F  |0E8F95;
 
 
          CODE_0E8E9F: TAY                                  ;0E8E9F|A8      |      ;
                       DEY                                  ;0E8EA0|88      |      ;
                       BNE UNREACH_0E8EA6                   ;0E8EA1|D003    |0E8EA6;
                       JMP.W CODE_0E9023                    ;0E8EA3|4C2390  |0E9023;
 
 
       UNREACH_0E8EA6: db $88,$F0,$35,$88,$F0,$39,$88,$F0   ;0E8EA6|        |      ;
                       db $3D,$88,$F0,$41,$88,$F0,$45       ;0E8EAE|        |0EF088;
 
       UNREACH_0E8EB5: db $20,$BC,$8A,$18,$60               ;0E8EB5|        |0E8ABC;
 
       UNREACH_0E8EBA: db $A6,$91,$86,$B8,$BD,$4E,$05,$C9   ;0E8EBA|        |000091;
                       db $79,$90,$12,$20,$C2,$91,$BD,$09   ;0E8EC2|        |0E1290;
                       db $05,$18,$69,$00,$A8,$BD,$F2,$04   ;0E8ECA|        |000018;
                       db $69,$01,$4C,$57,$8F,$A0,$00,$A9   ;0E8ED2|        |      ;
                       db $01,$4C,$57,$8F,$A9,$00,$A0,$80   ;0E8EDA|        |00004C;
                       db $4C,$7A,$8E,$A9,$00,$A0,$40,$4C   ;0E8EE2|        |0E8E7A;
 
                       db $7A,$8E,$A9,$01,$A0,$C0,$4C,$7A   ;0E8EEA|        |      ;
                       db $8E,$A9,$00,$A0,$80,$4C,$7A,$8E   ;0E8EF2|        |0E00A9;
                       db $A9,$01,$A0,$80,$4C,$7A,$8E,$A5   ;0E8EFA|        |      ;
                       db $2A,$C9,$1B,$F0,$2A,$A5,$8B,$C9   ;0E8F02|        |      ;
                       db $01,$F0,$29,$C9,$0C,$B0,$20,$38   ;0E8F0A|        |0000F0;
                       db $E9,$05,$90,$1B,$D0,$03,$4C,$CF   ;0E8F12|        |      ;
                       db $8F,$A8,$88,$D0,$03,$4C,$B9,$90   ;0E8F1A|        |D088A8;
                       db $88,$F0,$4D,$88,$F0,$51,$88,$F0   ;0E8F22|        |      ;
                       db $55,$88,$F0,$59,$88,$F0,$5D,$20   ;0E8F2A|        |000088;
                       db $BC,$8A,$18,$60,$A6,$91,$86,$B8   ;0E8F32|        |0E188A;
                       db $BD,$4E,$05,$C9,$79,$90,$12,$20   ;0E8F3A|        |0E054E;
                       db $C2,$91,$BD,$09,$05,$18,$69,$00   ;0E8F42|        |      ;
                       db $A8,$BD,$F2,$04,$69,$FF,$4C,$57   ;0E8F4A|        |      ;
                       db $8F,$A9,$FF,$A0,$00,$8D,$F2,$04   ;0E8F52|        |A0FFA9;
                       db $98,$8D,$09,$05,$20,$53,$91,$B0   ;0E8F5A|        |      ;
                       db $09,$AD,$F2,$04,$AC,$09,$05,$4C   ;0E8F62|        |      ;
                       db $7A,$8E,$A9,$00,$A8,$4C,$7A,$8E   ;0E8F6A|        |      ;
                       db $A9,$FF,$A0,$80,$4C,$7A,$8E,$A9   ;0E8F72|        |      ;
                       db $FE,$A0,$40,$4C,$7A,$8E,$A9,$FF   ;0E8F7A|        |0E40A0;
                       db $A0,$C0,$4C,$7A,$8E,$A9,$FE,$A0   ;0E8F82|        |      ;
                       db $80,$4C,$7A,$8E,$A9,$FF,$A0,$80   ;0E8F8A|        |0E8FD8;
                       db $4C,$7A,$8E                       ;0E8F92|        |0E8E7A;
 
 
          CODE_0E8F95: LDA.B r_knockBackDirrection          ;0E8F95|A590    |000090;
                       AND.B #$7F                           ;0E8F97|297F    |      ;
                       STA.B $00                            ;0E8F99|8500    |000000;
                       TAY                                  ;0E8F9B|A8      |      ;
                       LDA.B r_knockBackDirrection          ;0E8F9C|A590    |000090;
                       BPL CODE_0E8FAD                      ;0E8F9E|100D    |0E8FAD;
                       LDA.W DATA8_0FFD81,Y                 ;0E8FA0|B981FD  |0FFD81;
                       STA.W $0537                          ;0E8FA3|8D3705  |0E0537;
                       LDA.B #$00                           ;0E8FA6|A900    |      ;
                       STA.W $0520                          ;0E8FA8|8D2005  |0E0520;
                       BEQ CODE_0E8FBB                      ;0E8FAB|F00E    |0E8FBB;
 
          CODE_0E8FAD: LDA.B #$00                           ;0E8FAD|A900    |      ;
                       SEC                                  ;0E8FAF|38      |      ;
                       SBC.W DATA8_0FFD81,Y                 ;0E8FB0|F981FD  |0FFD81;
                       STA.W $0537                          ;0E8FB3|8D3705  |0E0537;
                       LDA.B #$FF                           ;0E8FB6|A9FF    |      ;
                       STA.W $0520                          ;0E8FB8|8D2005  |0E0520;
 
          CODE_0E8FBB: LDA.B #$40                           ;0E8FBB|A940    |      ;
 
                       SEC                                  ;0E8FBD|38      |      ;
                       SBC.B $00                            ;0E8FBE|E500    |000000;
                       TAY                                  ;0E8FC0|A8      |      ;
                       LDA.W DATA8_0FFD81,Y                 ;0E8FC1|B981FD  |0FFD81;
                       STA.W $0509                          ;0E8FC4|8D0905  |0E0509;
                       LDA.B #$00                           ;0E8FC7|A900    |      ;
                       STA.W $04F2                          ;0E8FC9|8DF204  |0E04F2;
                       JMP.W CODE_0E9009                    ;0E8FCC|4C0990  |0E9009;
 
                       db $A5,$90,$29,$7F,$85,$00,$A8,$A5   ;0E8FCF|        |000090;
                       db $90,$30,$0D,$B9,$81,$FD,$8D,$37   ;0E8FD7|        |0E9009;
                       db $05,$A9,$00,$8D,$20,$05,$F0,$0E   ;0E8FDF|        |0000A9;
                       db $A9,$00,$38,$F9,$81,$FD,$8D,$37   ;0E8FE7|        |      ;
                       db $05,$A9,$FF,$8D,$20,$05,$A9,$40   ;0E8FEF|        |0000A9;
                       db $38,$E5,$00,$A8,$A9,$00,$38,$F9   ;0E8FF7|        |      ;
                       db $81,$FD,$8D,$09,$05,$A9,$FF,$8D   ;0E8FFF|        |0000FD;
                       db $F2,$04                           ;0E9007|        |000004;
 
          CODE_0E9009: JSR.W CODE_0E8077                    ;0E9009|207780  |0E8077;
                       JSR.W CODE_0E9153                    ;0E900C|205391  |0E9153;
                       db $B0,$02,$38,$60,$A9,$00,$8D,$F2   ;0E900F|        |0E9013;
                       db $04,$8D,$09,$05,$8D,$20,$05,$8D   ;0E9017|        |00008D;
                       db $37,$05,$38,$60                   ;0E901F|        |000005;
 
          CODE_0E9023: LDX.B r_CogwheelID                   ;0E9023|A6D4    |0000D4;
                       STX.B r_CogwheelIDbackup             ;0E9025|86D2    |0000D2;
                       LDA.B r_CogSize                      ;0E9027|A595    |000095;
                       ASL A                                ;0E9029|0A      |      ;
                       TAY                                  ;0E902A|A8      |      ;
                       LDA.W PTR16_0E87E0,Y                 ;0E902B|B9E087  |0E87E0;
                       STA.B r_pointerQueue                 ;0E902E|8508    |000008;
                       LDA.W PTR16_0E87E1,Y                 ;0E9030|B9E187  |0E87E1;
                       STA.B $09                            ;0E9033|8509    |000009;
                       LDY.B r_CogProximity                 ;0E9035|A493    |000093;
                       DEY                                  ;0E9037|88      |      ;
                       BEQ UNREACH_0E9071                   ;0E9038|F037    |0E9071;
                       DEY                                  ;0E903A|88      |      ;
                       BEQ UNREACH_0E9089                   ;0E903B|F04C    |0E9089;
                       LDA.B r_knockBackDirrection          ;0E903D|A590    |000090;
                       AND.B #$7F                           ;0E903F|297F    |      ;
                       STA.B $00                            ;0E9041|8500    |000000;
                       TAY                                  ;0E9043|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0E9044|B108    |000008;
                       STA.W $0509                          ;0E9046|8D0905  |0E0509;
                       LDA.B #$00                           ;0E9049|A900    |      ;
                       STA.W $04F2                          ;0E904B|8DF204  |0E04F2;
                       LDA.B #$40                           ;0E904E|A940    |      ;
                       SEC                                  ;0E9050|38      |      ;
                       SBC.B $00                            ;0E9051|E500    |000000;
                       TAY                                  ;0E9053|A8      |      ;
                       LDA.B r_knockBackDirrection          ;0E9054|A590    |000090;
                       BMI CODE_0E9061                      ;0E9056|3009    |0E9061;
                       LDA.B (r_pointerQueue),Y             ;0E9058|B108    |000008;
                       STA.W $0537                          ;0E905A|8D3705  |0E0537;
                       LDA.B #$00                           ;0E905D|A900    |      ;
                       BEQ CODE_0E906B                      ;0E905F|F00A    |0E906B;
 
          CODE_0E9061: LDA.B #$00                           ;0E9061|A900    |      ;
                       SEC                                  ;0E9063|38      |      ;
                       SBC.B (r_pointerQueue),Y             ;0E9064|F108    |000008;
                       STA.W $0537                          ;0E9066|8D3705  |0E0537;
                       LDA.B #$FF                           ;0E9069|A9FF    |      ;
 
          CODE_0E906B: STA.W $0520                          ;0E906B|8D2005  |0E0520;
                       JMP.W CODE_0E913E                    ;0E906E|4C3E91  |0E913E;
 
 
       UNREACH_0E9071: db $A6,$94,$BD,$F2,$04,$8D,$F2,$04   ;0E9071|        |000094;
                       db $BD,$20,$05,$8D,$20,$05,$A9,$00   ;0E9079|        |0E0520;
                       db $8D,$09,$05,$8D,$37,$05,$38,$60   ;0E9081|        |0E0509;
 
       UNREACH_0E9089: db $A5,$90,$10,$B0,$A6,$94,$BD,$F2   ;0E9089|        |000090;
                       db $04,$10,$14,$8D,$F2,$04,$BD,$20   ;0E9091|        |000010;
                       db $05,$8D,$20,$05,$A9,$00,$8D,$09   ;0E9099|        |00008D;
                       db $05,$8D,$37,$05,$4C,$3E,$91,$A9   ;0E90A1|        |00008D;
                       db $00,$8D,$09,$05,$8D,$F2,$04,$8D   ;0E90A9|        |      ;
                       db $37,$05,$8D,$20,$05,$4C,$3E,$91   ;0E90B1|        |000005;
                       db $A6,$D4,$86,$D2,$A5,$95,$0A,$A8   ;0E90B9|        |0000D4;
                       db $B9,$E0,$87,$85,$08,$B9,$E1,$87   ;0E90C1|        |0E87E0;
                       db $85,$09,$A4,$93,$88,$F0,$3A,$88   ;0E90C9|        |000009;
                       db $F0,$4F,$A5,$90,$29,$7F,$85,$00   ;0E90D1|        |0E9122;
                       db $A8,$A9,$00,$38,$F1,$08,$8D,$09   ;0E90D9|        |      ;
                       db $05,$A9,$FF,$8D,$F2,$04,$A9,$40   ;0E90E1|        |0000A9;
                       db $38,$E5,$00,$A8,$A5,$90,$30,$0C   ;0E90E9|        |      ;
                       db $A9,$00,$38,$F1,$08,$8D,$37,$05   ;0E90F1|        |      ;
                       db $A9,$FF,$D0,$07,$B1,$08,$8D,$37   ;0E90F9|        |      ;
                       db $05,$A9,$00,$8D,$20,$05,$4C,$3E   ;0E9101|        |0000A9;
                       db $91,$A6,$94,$BD,$F2,$04,$8D,$F2   ;0E9109|        |0000A6;
                       db $04,$BD,$20,$05,$8D,$20,$05,$A9   ;0E9111|        |0000BD;
                       db $00,$8D,$09,$05,$8D,$37,$05,$38   ;0E9119|        |      ;
                       db $60,$A5,$90,$30,$AD,$A6,$94,$BD   ;0E9121|        |      ;
 
                       db $F2,$04,$30,$16,$8D,$F2,$04,$BD   ;0E9129|        |000004;
                       db $20,$05,$8D,$20,$05,$A9,$00,$8D   ;0E9131|        |0E8D05;
                       db $09,$05,$8D,$37,$05               ;0E9139|        |      ;
 
          CODE_0E913E: JSR.W CODE_0E8001                    ;0E913E|200180  |0E8001;
                       SEC                                  ;0E9141|38      |      ;
                       RTS                                  ;0E9142|60      |      ;
 
                       LDA.B #$00                           ;0E9143|A900    |      ;
                       STA.W $0509                          ;0E9145|8D0905  |0E0509;
                       STA.W $04F2                          ;0E9148|8DF204  |0E04F2;
                       STA.W $0537                          ;0E914B|8D3705  |0E0537;
                       STA.W $0520                          ;0E914E|8D2005  |0E0520;
                       BEQ CODE_0E913E                      ;0E9151|F0EB    |0E913E;
 
          CODE_0E9153: LDA.W $04F2                          ;0E9153|ADF204  |0E04F2;
                       BMI CODE_0E915C                      ;0E9156|3004    |0E915C;
                       LDA.B #$08                           ;0E9158|A908    |      ;
                       BNE CODE_0E915E                      ;0E915A|D002    |0E915E;
 
          CODE_0E915C: LDA.B #$F8                           ;0E915C|A9F8    |      ;
 
          CODE_0E915E: STA.B $00                            ;0E915E|8500    |000000;
                       LDX.B #$00                           ;0E9160|A200    |      ;
                       db $20                               ;0E9162|        |      ;
                       dw CODE_0FFCDD                       ;0E9163|        |0FFCDD;
                       BEQ CODE_0E9169                      ;0E9165|F002    |0E9169;
 
          CODE_0E9167: SEC                                  ;0E9167|38      |      ;
                       RTS                                  ;0E9168|60      |      ;
 
 
          CODE_0E9169: LDY.B r_currPartnerID                ;0E9169|A482    |000082;
 
          CODE_0E916B: STY.B $01                            ;0E916B|8401    |000001;
                       LDA.W DATA8_0E9186,Y                 ;0E916D|B98691  |0E9186;
                       TAX                                  ;0E9170|AA      |      ;
                       LDA.B $00                            ;0E9171|A500    |000000;
                       db $20                               ;0E9173|        |      ;
                       dw CODE_0FFCDD                       ;0E9174|        |0FFCDD;
                       BNE CODE_0E9167                      ;0E9176|D0EF    |0E9167;
                       LDA.B $01                            ;0E9178|A501    |000001;
                       CLC                                  ;0E917A|18      |      ;
                       ADC.B #$04                           ;0E917B|6904    |      ;
                       CMP.B #$08                           ;0E917D|C908    |      ;
                       BCS CODE_0E9184                      ;0E917F|B003    |0E9184;
                       TAY                                  ;0E9181|A8      |      ;
                       BNE CODE_0E916B                      ;0E9182|D0E7    |0E916B;
 
          CODE_0E9184: CLC                                  ;0E9184|18      |      ;
                       RTS                                  ;0E9185|60      |      ;
 
 
         DATA8_0E9186: db $F0,$F0,$F4,$F0,$0F,$0F,$0B,$0F   ;0E9186|        |      ;
                       LDA.B r_conveyaerRoomEffect          ;0E918E|A58B    |00008B;
                       BNE CODE_0E9193                      ;0E9190|D001    |0E9193;
 
          CODE_0E9192: RTS                                  ;0E9192|60      |      ;
 
 
          CODE_0E9193: CMP.B #$01                           ;0E9193|C901    |      ;
                       BEQ CODE_0E91F9                      ;0E9195|F062    |0E91F9;
                       SEC                                  ;0E9197|38      |      ;
                       SBC.B #$05                           ;0E9198|E905    |      ;
                       BCC CODE_0E9192                      ;0E919A|90F6    |0E9192;
                       BNE CODE_0E91A1                      ;0E919C|D003    |0E91A1;
                       JMP.W CODE_0E9314                    ;0E919E|4C1493  |0E9314;
 
 
          CODE_0E91A1: TAY                                  ;0E91A1|A8      |      ;
                       DEY                                  ;0E91A2|88      |      ;
                       BNE UNREACH_0E91A8                   ;0E91A3|D003    |0E91A8;
                       JMP.W CODE_0E9340                    ;0E91A5|4C4093  |0E9340;
 
 
       UNREACH_0E91A8: db $88,$88,$D0,$03,$4C,$42,$92,$88   ;0E91A8|        |      ;
                       db $D0,$03,$4C,$88,$92,$88,$D0,$03   ;0E91B0|        |0E91B5;
                       db $4C,$BB,$92,$88,$D0,$03,$4C,$EE   ;0E91B8|        |0E92BB;
 
                       db $92,$60                           ;0E91C0|        |000060;
 
          CODE_0E91C2: CMP.B #$6E                           ;0E91C2|C96E    |      ;
                       BEQ UNREACH_0E91F2                   ;0E91C4|F02C    |0E91F2;
                       CMP.B #$74                           ;0E91C6|C974    |      ;
                       BEQ UNREACH_0E91F2                   ;0E91C8|F028    |0E91F2;
                       CMP.B #$76                           ;0E91CA|C976    |      ;
                       BEQ UNREACH_0E91D5                   ;0E91CC|F007    |0E91D5;
                       CMP.B #$78                           ;0E91CE|C978    |      ;
                       BEQ UNREACH_0E91D5                   ;0E91D0|F003    |0E91D5;
                       LDX.B r_ConveyorRelated              ;0E91D2|A691    |000091;
                       RTS                                  ;0E91D4|60      |      ;
 
 
       UNREACH_0E91D5: db $BD,$20,$05,$10,$F8,$A9,$FB,$A2   ;0E91D5|        |0E0520;
                       db $F8,$20,$DD,$FC,$D0,$09,$A9,$05   ;0E91DD|        |      ;
                       db $A2,$F8,$20,$DD,$FC,$F0,$E6,$A9   ;0E91E5|        |      ;
                       db $10,$85,$AF,$D0,$E0               ;0E91ED|        |0E9174;
 
       UNREACH_0E91F2: db $BD,$1D,$06,$F0,$DB,$D0,$E1       ;0E91F2|        |0E061D;
 
          CODE_0E91F9: LDX.B r_ConveyorRelated              ;0E91F9|A691    |000091;
                       STX.B r_platformIDFrozenEnemy        ;0E91FB|86B8    |0000B8;
                       LDA.W $054E,X                        ;0E91FD|BD4E05  |0E054E;
                       CMP.B #$79                           ;0E9200|C979    |      ;
                       BCC UNREACH_0E9237                   ;0E9202|9033    |0E9237;
                       JSR.W CODE_0E91C2                    ;0E9204|20C291  |0E91C2;
                       LDA.B r_currPartnerID                ;0E9207|A582    |000082;
                       CMP.B #$04                           ;0E9209|C904    |      ;
                       BCS CODE_0E9226                      ;0E920B|B019    |0E9226;
                       LDA.W $04F2,X                        ;0E920D|BDF204  |0E04F2;
                       BPL CODE_0E921D                      ;0E9210|100B    |0E921D;
                       LDA.B #$F8                           ;0E9212|A9F8    |      ;
                       LDX.B #$F0                           ;0E9214|A2F0    |      ;
                       db $20                               ;0E9216|        |      ;
                       dw CODE_0FFCDD                       ;0E9217|        |0FFCDD;
                       BNE UNREACH_0E9237                   ;0E9219|D01C    |0E9237;
                       BEQ CODE_0E9226                      ;0E921B|F009    |0E9226;
 
          CODE_0E921D: LDA.B #$08                           ;0E921D|A908    |      ;
                       LDX.B #$F0                           ;0E921F|A2F0    |      ;
                       db $20                               ;0E9221|        |      ;
                       dw CODE_0FFCDD                       ;0E9222|        |0FFCDD;
                       BNE UNREACH_0E9237                   ;0E9224|D011    |0E9237;
 
          CODE_0E9226: LDX.B r_ConveyorRelated              ;0E9226|A691    |000091;
                       LDA.W $0509,X                        ;0E9228|BD0905  |0E0509;
                       STA.W $0509                          ;0E922B|8D0905  |0E0509;
                       LDA.W $04F2,X                        ;0E922E|BDF204  |0E04F2;
                       STA.W $04F2                          ;0E9231|8DF204  |0E04F2;
                       JMP.W CODE_0E873A                    ;0E9234|4C3A87  |0E873A;
 
 
       UNREACH_0E9237: db $A9,$00,$8D,$09,$05,$8D,$F2,$04   ;0E9237|        |      ;
                       db $4C,$3A,$87,$A5,$2A,$C9,$1B,$F0   ;0E923F|        |0E873A;
 
                       db $12,$A2,$01,$A9,$F8,$20,$DD,$FC   ;0E9247|        |0000A2;
                       db $D0,$09,$A2,$F0,$A9,$F8,$20,$DD   ;0E924F|        |0E925A;
                       db $FC,$F0,$01,$60,$A5,$82,$29,$0C   ;0E9257|        |0E01F0;
                       db $D0,$0D,$A9,$FF,$8D,$F2,$04,$A9   ;0E925F|        |0E926E;
                       db $40,$8D,$09,$05,$4C,$3A,$87,$A9   ;0E9267|        |      ;
                       db $FF,$8D,$F2,$04,$A9,$A0,$8D,$09   ;0E926F|        |04F28D;
                       db $05,$4C,$3A,$87,$A9,$00,$8D,$F2   ;0E9277|        |00004C;
                       db $04,$A9,$60,$8D,$09,$05,$4C,$3A   ;0E927F|        |0000A9;
                       db $87,$A2,$01,$A9,$08,$20,$DD,$FC   ;0E9287|        |0000A2;
                       db $D0,$09,$A2,$F0,$A9,$08,$20,$DD   ;0E928F|        |0E929A;
                       db $FC,$F0,$01,$60,$A5,$82,$29,$0C   ;0E9297|        |0E01F0;
                       db $D0,$DA,$A9,$00,$8D,$F2,$04,$A9   ;0E929F|        |0E927B;
                       db $C0,$8D,$09,$05,$4C,$3A,$87,$A9   ;0E92A7|        |      ;
                       db $FF,$8D,$F2,$04,$A9,$C0,$8D,$09   ;0E92AF|        |04F28D;
                       db $05,$4C,$3A,$87,$A2,$01,$A9,$F8   ;0E92B7|        |00004C;
                       db $20,$DD,$FC,$D0,$09,$A2,$F0,$A9   ;0E92BF|        |0EFCDD;
                       db $F8,$20,$DD,$FC,$F0,$01,$60,$A5   ;0E92C7|        |      ;
                       db $82,$29,$0C,$D0,$DA,$A9,$FF,$8D   ;0E92CF|        |0E9EFB;
                       db $F2,$04,$A9,$80,$8D,$09,$05,$4C   ;0E92D7|        |000004;
                       db $3A,$87,$A9,$00,$8D,$F2,$04,$A9   ;0E92DF|        |      ;
                       db $40,$8D,$09,$05,$4C,$3A,$87,$A2   ;0E92E7|        |      ;
                       db $01,$A9,$08,$20,$DD,$FC,$D0,$09   ;0E92EF|        |0000A9;
                       db $A2,$F0,$A9,$08,$20,$DD,$FC,$F0   ;0E92F7|        |      ;
                       db $01,$60,$A5,$82,$29,$0C,$D0,$DA   ;0E92FF|        |000060;
                       db $A9,$00,$8D,$F2,$04,$A9,$80,$8D   ;0E9307|        |      ;
                       db $09,$05,$4C,$3A,$87               ;0E930F|        |      ;
 
          CODE_0E9314: LDA.B #$00                           ;0E9314|A900    |      ;
                       STA.W $0509                          ;0E9316|8D0905  |0E0509;
                       STA.W $04F2                          ;0E9319|8DF204  |0E04F2;
                       STA.W $0537                          ;0E931C|8D3705  |0E0537;
                       STA.W $0520                          ;0E931F|8D2005  |0E0520;
                       JSR.W CODE_0E8077                    ;0E9322|207780  |0E8077;
                       JSR.W CODE_0E9153                    ;0E9325|205391  |0E9153;
                       BCS CODE_0E9330                      ;0E9328|B006    |0E9330;
 
          CODE_0E932A: JSR.W CODE_0E873A                    ;0E932A|203A87  |0E873A;
                       JMP.W CODE_0E8712                    ;0E932D|4C1287  |0E8712;
 
 
          CODE_0E9330: LDA.B #$00                           ;0E9330|A900    |      ;
                       STA.W $0509                          ;0E9332|8D0905  |0E0509;
                       STA.W $04F2                          ;0E9335|8DF204  |0E04F2;
                       STA.W $0537                          ;0E9338|8D3705  |0E0537;
                       STA.W $0520                          ;0E933B|8D2005  |0E0520;
                       BEQ CODE_0E932A                      ;0E933E|F0EA    |0E932A;
 
          CODE_0E9340: LDX.B r_CogwheelID                   ;0E9340|A6D4    |0000D4;
                       STX.B r_CogwheelIDbackup             ;0E9342|86D2    |0000D2;
                       LDY.B r_CogProximity                 ;0E9344|A493    |000093;
                       DEY                                  ;0E9346|88      |      ;
                       BEQ CODE_0E9363                      ;0E9347|F01A    |0E9363;
                       DEY                                  ;0E9349|88      |      ;
                       BEQ CODE_0E9363                      ;0E934A|F017    |0E9363;
                       LDA.B #$00                           ;0E934C|A900    |      ;
                       STA.W $0509                          ;0E934E|8D0905  |0E0509;
                       STA.W $04F2                          ;0E9351|8DF204  |0E04F2;
                       STA.W $0537                          ;0E9354|8D3705  |0E0537;
                       STA.W $0520                          ;0E9357|8D2005  |0E0520;
                       JSR.W CODE_0E8001                    ;0E935A|200180  |0E8001;
 
          CODE_0E935D: JSR.W CODE_0E873A                    ;0E935D|203A87  |0E873A;
                       JMP.W CODE_0E8712                    ;0E9360|4C1287  |0E8712;
 
 
          CODE_0E9363: LDX.B r_CogID                        ;0E9363|A694    |000094;
                       LDA.W $04F2,X                        ;0E9365|BDF204  |0E04F2;
                       STA.W $04F2                          ;0E9368|8DF204  |0E04F2;
                       LDA.W $0520,X                        ;0E936B|BD2005  |0E0520;
                       STA.W $0520                          ;0E936E|8D2005  |0E0520;
                       LDA.B #$00                           ;0E9371|A900    |      ;
                       STA.W $0509                          ;0E9373|8D0905  |0E0509;
                       STA.W $0537                          ;0E9376|8D3705  |0E0537;
                       BEQ CODE_0E935D                      ;0E9379|F0E2    |0E935D;
 
          CODE_0E937B: LDY.W $0565                          ;0E937B|AC6505  |0E0565;
                       db $20                               ;0E937E|        |      ;
                       dw CODE_0FE886                       ;0E937F|        |0FE886;
                       dw playerState00_init                ;0E9381|        |0E8AC5;
                       dw UNREACH_0E9538                    ;0E9383|        |0E9538;
                       dw UNREACH_0E9660                    ;0E9385|        |0E9660;
                       dw UNREACH_0E961D                    ;0E9387|        |0E961D;
                       dw UNREACH_0E9770                    ;0E9389|        |0E9770;
                       dw UNREACH_0E9919                    ;0E938B|        |0E9919;
                       dw UNREACH_0E9770                    ;0E938D|        |0E9770;
                       dw UNREACH_0E9953                    ;0E938F|        |0E9953;
                       dw UNREACH_0E9967                    ;0E9391|        |0E9967;
                       dw UNREACH_0E998E                    ;0E9393|        |0E998E;
                       dw UNREACH_0E9A93                    ;0E9395|        |0E9A93;
                       dw UNREACH_0E9942                    ;0E9397|        |0E9942;
                       db $18,$94,$3A,$94,$65,$94,$9E,$94   ;0E9399|        |      ;
                       db $B8,$94,$D4,$94,$FF,$94,$1C,$83   ;0E93A1|        |      ;
                       db $B1,$93,$B1,$93,$57,$8B,$DE,$8A   ;0E93A9|        |      ;
                       db $A9,$02,$8D,$00,$04,$CE,$D4,$05   ;0E93B1|        |      ;
                       db $F0,$20,$A9,$02,$8D,$54,$04,$AD   ;0E93B9|        |      ;
                       db $EB,$05                           ;0E93C1|        |      ;
                       db $D0,$21,$20,$21,$84,$90,$01,$60   ;0E93C3|        |0E93E6;
                       db $A9,$01,$8D,$EB,$05,$A9,$0C,$8D   ;0E93CB|        |      ;
                       db $D8,$05,$A9,$01,$8D,$C1,$05,$60   ;0E93D3|        |      ;
                       db $A9,$00,$8D,$54,$04,$A9,$02,$8D   ;0E93DB|        |      ;
                       db $65,$05,$60,$20,$4F,$98,$AD,$C1   ;0E93E3|        |000005;
                       db $05,$F0,$F7,$A2,$10,$A9,$FB,$20   ;0E93EB|        |0000F0;
                       db $DD,$FC,$D0,$0A,$A2,$10,$A9,$05   ;0E93F3|        |0ED0FC;
                       db $20,$DD,$FC,$D0,$01,$60,$20,$02   ;0E93FB|        |0EFCDD;
                       db $8A,$A9,$00,$8D,$EB,$05,$60       ;0E9403|        |      ;
 
       UNREACH_0E940A: db $8D,$65,$05,$A9,$72,$20,$5F,$E2   ;0E940A|        |0E0565;
                       db $A9,$00,$8D,$78,$05,$60,$20,$21   ;0E9412|        |      ;
                       db $84,$B0,$08,$A9,$00,$8D,$13,$04   ;0E941A|        |0000B0;
                       db $4C,$3A,$97,$20,$8E,$91,$20,$89   ;0E9422|        |0E973A;
 
                       db $BC,$B0,$01,$60,$A9,$02,$8D,$65   ;0E942A|        |0E01B0;
                       db $05,$A9,$02,$8D,$00,$04,$38,$60   ;0E9432|        |0000A9;
                       db $20,$9C,$97,$AD,$65,$05,$C9,$26   ;0E943A|        |0E979C;
                       db $F0,$15,$C9,$02,$D0,$0C,$A9,$00   ;0E9442|        |0E9459;
                       db $85,$B9,$A9,$18,$8D,$65,$05,$4C   ;0E944A|        |0000B9;
                       db $28,$94,$20,$89,$BC,$B0,$01,$60   ;0E9452|        |      ;
                       db $A9,$08,$8D,$65,$05,$A9,$02,$8D   ;0E945A|        |      ;
                       db $00,$04,$60,$20,$21,$84,$B0,$03   ;0E9462|        |      ;
                       db $4C,$1D,$94,$20,$8E,$91,$20,$36   ;0E946A|        |0E941D;
 
                       db $99,$AD,$65,$05,$C9,$02,$D0,$13   ;0E9472|        |0E65AD;
                       db $A9,$18,$8D,$65,$05,$20,$28,$94   ;0E947A|        |      ;
                       db $AD,$65,$05,$C9,$18,$D0,$03,$20   ;0E9482|        |0E0565;
                       db $CB,$BE,$60,$20,$89,$BC,$B0,$01   ;0E948A|        |      ;
                       db $60,$A9,$0A,$8D,$65,$05,$A9,$0E   ;0E9492|        |      ;
 
                       db $8D,$00,$04,$60,$20,$89,$BC,$B0   ;0E949A|        |0E0400;
                       db $01,$60,$A9,$12,$8D,$65,$05,$60   ;0E94A2|        |000060;
 
          CODE_0E94AA: STA.W $0565                          ;0E94AA|8D6505  |0E0565;
                       LDA.B #$00                           ;0E94AD|A900    |      ;
                       STA.W $0593                          ;0E94AF|8D9305  |0E0593;
                       LDA.B #$01                           ;0E94B2|A901    |      ;
                       STA.W $057C                          ;0E94B4|8D7C05  |0E057C;
                       RTS                                  ;0E94B7|60      |      ;
 
                       db $20,$21,$84,$B0,$03,$4C,$3A,$97   ;0E94B8|        |0E8421;
                       db $20,$8E,$91,$20,$F2,$BA,$B0,$01   ;0E94C0|        |0E918E;
                       db $60,$A9,$02,$8D,$65,$05,$A9,$02   ;0E94C8|        |      ;
 
                       db $8D,$00,$04,$60,$20,$9C,$97,$AD   ;0E94D0|        |0E0400;
                       db $65,$05,$C9,$26,$F0,$15,$C9,$02   ;0E94D8|        |000005;
                       db $D0,$0C,$A9,$00,$85,$B9,$A9,$20   ;0E94E0|        |0E94EE;
                       db $8D,$65,$05,$4C,$C3,$94,$20,$F2   ;0E94E8|        |0E0565;
                       db $BA,$B0,$01,$60,$A9,$08,$8D,$65   ;0E94F0|        |      ;
                       db $05,$A9,$02,$8D,$00,$04,$60,$20   ;0E94F8|        |0000A9;
                       db $F2,$BA,$B0,$01,$60,$A9,$12,$8D   ;0E9500|        |0000BA;
                       db $65,$05,$60,$AD,$4E,$05,$C9,$02   ;0E9508|        |000005;
                       db $F0,$22,$A2,$E8,$A9,$FB,$20,$0B   ;0E9510|        |0E9534;
                       db $84,$F0,$08,$C9,$05,$F0,$04,$C9   ;0E9518|        |0000F0;
                       db $07,$D0,$13,$A2,$E8,$A9,$05,$20   ;0E9520|        |0000D0;
                       db $0B,$84,$F0,$08,$C9,$05,$F0,$04   ;0E9528|        |      ;
                       db $C9,$07,$D0,$02,$18,$60,$38,$60   ;0E9530|        |      ;
 
       UNREACH_0E9538: db $20,$21,$84,$B0,$03,$4C,$3A,$97   ;0E9538|        |0E8421;
                       db $A5,$B9,$F0,$09,$C6,$B9,$D0,$EF   ;0E9540|        |0000B9;
                       db $A9,$02,$8D,$00,$04,$A5,$26,$0A   ;0E9548|        |      ;
                       db $B0,$42,$0A,$B0,$1C,$A5,$28,$4A   ;0E9550|        |0E9594;
                       db $90,$03,$4C,$02,$96,$4A,$90,$03   ;0E9558|        |0E955D;
                       db $4C,$06,$96,$4A,$B0,$44,$4A,$B0   ;0E9560|        |0E9606;
 
                       db $4F,$A9,$02,$8D,$00,$04,$4C,$8E   ;0E9568|        |8D02A9;
                       db $91,$A5,$28,$29,$08,$D0,$13,$AD   ;0E9570|        |0000A5;
                       db $4E,$05,$C9,$03,$F0,$05,$A9,$18   ;0E9578|        |0EC905;
                       db $4C,$0A,$94,$20,$69,$BA,$B0,$07   ;0E9580|        |0E940A;
 
                       db $90,$CB,$20,$F5,$B9,$90,$E8,$A9   ;0E9588|        |0E9555;
                       db $20,$4C,$AA,$94,$20,$0B,$95,$B0   ;0E9590|        |0EAA4C;
                       db $05,$A9,$06,$8D,$65,$05,$60,$A9   ;0E9598|        |0000A9;
                       db $0A,$8D,$65,$05,$A9,$0E,$8D,$00   ;0E95A0|        |      ;
                       db $04,$60,$20,$D4,$E6,$90,$F0,$A9   ;0E95A8|        |000060;
                       db $00,$8D,$C1,$05,$A2,$01,$D0,$0C   ;0E95B0|        |      ;
                       db $20,$DF,$E6,$90,$AC,$A9,$01,$8D   ;0E95B8|        |0EE6DF;
                       db $C1,$05,$A2,$00,$A0,$00,$A5,$0A   ;0E95C0|        |000005;
                       db $0A,$90,$05,$8A,$49,$01,$AA,$C8   ;0E95C8|        |      ;
                       db $8C,$EF,$05,$8E,$A8,$04,$A5,$0B   ;0E95D0|        |0E05EF;
                       db $8D,$1D,$06,$A0,$00,$0A,$90,$01   ;0E95D8|        |0E061D;
                       db $C8,$8C,$06,$06,$A5,$0D,$F0,$06   ;0E95E0|        |      ;
                       db $A9,$FF,$A0,$00,$F0,$04,$A9,$01   ;0E95E8|        |      ;
                       db $A0,$00,$8C,$09,$05,$8D,$F2,$04   ;0E95F0|        |      ;
                       db $A9,$0E,$8D,$65,$05,$A9,$00,$4C   ;0E95F8|        |      ;
                       db $4A,$EF,$A9,$00,$F0,$02,$A9,$01   ;0E9600|        |      ;
                       db $8D,$A8,$04,$A9,$00,$8D,$F2,$04   ;0E9608|        |0E04A8;
                       db $8D,$09,$05,$A9,$04,$8D,$65,$05   ;0E9610|        |0E0509;
                       db $A9,$00,$4C,$4A,$EF               ;0E9618|        |      ;
 
       UNREACH_0E961D: db $A9,$08,$8D,$65,$05,$A5,$28,$85   ;0E961D|        |      ;
                       db $10,$A2,$00,$A9,$16,$9D,$00,$04   ;0E9625|        |0E95C9;
                       db $A9,$00,$9D,$C1,$05,$A9,$09,$9D   ;0E962D|        |      ;
                       db $D8,$05,$A5,$10,$4A,$B0,$08,$4A   ;0E9635|        |      ;
                       db $B0,$10,$A9,$00,$A8,$F0,$14,$A9   ;0E963D|        |0E964F;
                       db $00,$9D,$A8,$04,$A9,$01,$A0,$00   ;0E9645|        |      ;
                       db $F0,$09,$A9,$01,$9D,$A8,$04,$A9   ;0E964D|        |0E9658;
                       db $FF,$A0,$00,$9D,$F2,$04,$98,$9D   ;0E9655|        |9D00A0;
                       db $09,$05,$60                       ;0E965D|        |      ;
 
       UNREACH_0E9660: db $20,$21,$84,$B0,$03,$4C,$34,$97   ;0E9660|        |0E8421;
                       db $A5,$26,$0A,$90,$03,$4C,$94,$95   ;0E9668|        |000026;
                       db $0A,$B0,$1C,$A5,$28,$4A,$B0,$42   ;0E9670|        |      ;
                       db $4A,$90,$03,$4C,$F6,$96,$A9,$02   ;0E9678|        |      ;
                       db $8D,$65,$05,$20,$BC,$8A,$20,$73   ;0E9680|        |0E0565;
                       db $EF,$20,$3A,$87,$4C,$12,$87,$A5   ;0E9688|        |873A20;
                       db $28,$29,$08,$F0,$0F,$20,$F5,$B9   ;0E9690|        |      ;
                       db $90,$0A,$A9,$20,$20,$AA,$94,$20   ;0E9698|        |0E96A4;
                       db $BC,$8A,$F0,$E5,$AD,$4E,$05,$C9   ;0E96A0|        |0EF08A;
                       db $03,$F0,$08,$A9,$18,$20,$0A,$94   ;0E96A8|        |0000F0;
                       db $4C,$83,$96,$20,$69,$BA,$90,$BB   ;0E96B0|        |0E9683;
 
                       db $B0,$E0,$A9,$00,$8D,$A8,$04,$20   ;0E96B8|        |0E969A;
                       db $85,$8E,$90,$15,$A2,$00,$A9,$08   ;0E96C0|        |00008E;
                       db $20,$DD,$FC,$D0,$24,$A2,$F0,$A9   ;0E96C8|        |0EFCDD;
                       db $08,$20,$DD,$FC,$D0,$1B,$4C,$86   ;0E96D0|        |      ;
                       db $96,$A2,$00,$A9,$08,$20,$DD,$FC   ;0E96D8|        |0000A2;
                       db $D0,$0F,$A2,$F0,$A9,$08,$20,$DD   ;0E96E0|        |0E96F1;
                       db $FC,$D0,$06,$A9,$01,$A0,$00,$F0   ;0E96E8|        |0E06D0;
                       db $3A,$A9,$00,$A8,$F0,$35,$A9,$01   ;0E96F0|        |      ;
                       db $8D,$A8,$04,$20,$01,$8F,$90,$15   ;0E96F8|        |0E04A8;
                       db $A2,$00,$A9,$F8,$20,$DD,$FC,$D0   ;0E9700|        |      ;
                       db $E8,$A2,$F0,$A9,$F8,$20,$DD,$FC   ;0E9708|        |      ;
                       db $D0,$DF,$4C,$86,$96,$A2,$00,$A9   ;0E9710|        |0E96F1;
                       db $F8,$20,$DD,$FC,$D0,$D3,$A2,$F0   ;0E9718|        |      ;
                       db $A9,$F8,$20,$DD,$FC,$D0,$CA,$A9   ;0E9720|        |      ;
                       db $FF,$A0,$00,$8C,$09,$05,$8D,$F2   ;0E9728|        |8C00A0;
                       db $04,$4C,$83,$96,$20,$3A,$97,$4C   ;0E9730|        |00004C;
                       db $86,$96,$A5,$CF,$C9,$01,$F0,$04   ;0E9738|        |000096;
                       db $C9,$06,$D0,$04,$A9,$08,$85,$AF   ;0E9740|        |      ;
                       db $A9,$0C,$8D,$65,$05,$A2,$00,$A9   ;0E9748|        |      ;
                       db $0C,$9D,$D8,$05,$A9,$01,$9D,$C1   ;0E9750|        |0ED89D;
                       db $05,$BD,$A8,$04,$D0,$0C,$A9,$00   ;0E9758|        |0000BD;
                       db $A0,$20,$9D,$F2,$04,$98,$9D,$09   ;0E9760|        |      ;
                       db $05,$60,$A9,$FF,$A0,$E0,$D0,$F2   ;0E9768|        |000060;
 
       UNREACH_0E9770: db $A5,$26,$29,$40,$F0,$26,$A5,$28   ;0E9770|        |000026;
                       db $29,$08,$F0,$14,$20,$F5,$B9,$90   ;0E9778|        |      ;
                       db $0F,$A9,$22,$20,$AA,$94,$4C,$9C   ;0E9780|        |2022A9;
                       db $97,$20,$69,$BA,$90,$0E,$B0,$F1   ;0E9788|        |000020;
                       db $AD,$4E,$05,$C9,$03,$F0,$F2,$A9   ;0E9790|        |0E054E;
                       db $1A,$20,$0A,$94,$20,$AA,$83,$B0   ;0E9798|        |      ;
                       db $C8                               ;0E97A0|        |      ;
 
       UNREACH_0E97A1: db $AD,$F2,$04,$10,$14,$A2,$10,$A9   ;0E97A1|        |0E04F2;
                       db $F8,$20,$DD,$FC,$D0,$20,$A2,$08   ;0E97A9|        |      ;
                       db $A9,$F8,$20,$DD,$FC,$D0,$17,$F0   ;0E97B1|        |      ;
                       db $12,$A2,$10,$A9,$08,$20,$DD,$FC   ;0E97B9|        |0000A2;
                       db $D0,$0C,$A2,$08,$A9,$08,$20,$DD   ;0E97C1|        |0E97CF;
                       db $FC,$D0,$03,$20,$3A,$87           ;0E97C9|        |0E03D0;
 
       UNREACH_0E97CF: db $AD,$1C,$04,$85,$06,$20,$4F,$98   ;0E97CF|        |0E041C;
                       db $AD,$C1,$05,$F0,$65,$A2,$10,$A9   ;0E97D7|        |0E05C1;
                       db $FB,$20,$DD,$FC,$F0,$0C,$A2,$08   ;0E97DF|        |      ;
                       db $A9,$FB,$20,$FF,$83,$F0,$30,$4C   ;0E97E7|        |      ;
                       db $41,$98,$A2,$10,$A9,$05,$20,$DD   ;0E97EF|        |000098;
                       db $FC,$F0,$0C,$A2,$08,$A9,$05,$20   ;0E97F7|        |0E0CF0;
 
                       db $FF,$83,$F0,$1B,$4C,$41,$98,$A5   ;0E97FF|        |1BF083;
                       db $8B,$C9,$01,$F0,$0A,$C9,$05,$F0   ;0E9807|        |      ;
                       db $34,$C9,$06,$F0,$30,$D0,$2B,$A6   ;0E980F|        |0000C9;
                       db $91,$20,$9C,$FE,$4C,$3B,$98,$AD   ;0E9817|        |000020;
                       db $D8,$05,$D0,$15,$AD,$65,$05,$C9   ;0E981F|        |      ;
                       db $26,$F0,$0E,$A9,$0B,$20,$5F,$E2   ;0E9827|        |0000F0;
                       db $A9,$0C,$85,$B9,$A9,$0E,$8D,$00   ;0E982F|        |      ;
                       db $04,$20,$02,$8A,$A9,$02,$8D,$65   ;0E9837|        |000020;
                       db $05,$60,$4C,$12,$87,$A5,$06,$18   ;0E983F|        |000060;
                       db $65,$91,$8D,$1C,$04,$4C,$3B,$98   ;0E9847|        |000091;
                       db $AD,$1C,$04,$C9,$08,$B0,$11,$AD   ;0E984F|        |0E041C;
                       db $C1,$05,$D0,$0C,$AD,$65,$05,$C9   ;0E9857|        |000005;
                       db $26,$F0,$08,$A2,$00,$20,$4F,$97   ;0E985F|        |0000F0;
                       db $4C,$BF,$98,$A9,$00,$8D,$20,$05   ;0E9867|        |0E98BF;
 
                       db $8D,$37,$05,$F0,$F3,$80,$FA,$FA   ;0E986F|        |0E0537;
                       db $FA,$FA,$FA,$FB,$FB,$FB,$FB,$FB   ;0E9877|        |      ;
                       db $FD,$FD,$FD,$FD,$FD,$FE,$FE,$FE   ;0E987F|        |0EFDFD;
                       db $FF,$FF,$FF,$FF,$00,$FF,$00,$00   ;0E9887|        |FFFFFF;
                       db $00,$00,$81,$AD,$37,$05,$18,$69   ;0E988F|        |      ;
                       db $20,$8D,$37,$05,$AD,$20,$05,$69   ;0E9897|        |0E378D;
                       db $00,$8D,$20,$05,$10,$06,$A9,$00   ;0E989F|        |      ;
                       db $8D,$C1,$05,$60,$C9,$05,$90,$0A   ;0E98A7|        |0E05C1;
                       db $A9,$05,$8D,$20,$05,$A9,$00,$8D   ;0E98AF|        |      ;
                       db $37,$05,$A9,$01,$8D,$C1,$05,$60   ;0E98B7|        |000005;
                       db $AD,$65,$05,$C9,$26,$F0,$CC,$A2   ;0E98BF|        |0E0565;
                       db $00,$A9,$00,$9D,$37,$05,$9D,$DB   ;0E98C7|        |      ;
                       db $04,$BC,$D8,$05,$BD,$C1,$05,$D0   ;0E98CF|        |0000BC;
                       db $1C,$B9,$74,$98,$C9,$81,$F0,$07   ;0E98D7|        |0E74B9;
                       db $9D,$20,$05,$FE,$D8,$05,$60,$A9   ;0E98DF|        |0E0520;
                       db $00,$9D,$20,$05,$DE,$D8,$05,$A9   ;0E98E7|        |      ;
                       db $01,$9D,$C1,$05,$60,$B9,$74,$98   ;0E98EF|        |00009D;
                       db $C9,$80,$F0,$0C,$DE,$D8,$05,$49   ;0E98F7|        |      ;
                       db $FF,$18,$69,$01,$9D,$20,$05,$60   ;0E98FF|        |016918;
                       db $B9,$75,$98,$D0,$F2,$20,$69,$BA   ;0E9907|        |0E9875;
                       db $90,$25,$A9,$1C,$20,$AA,$94,$4C   ;0E990F|        |0E9936;
                       db $36,$99                           ;0E9917|        |000099;
 
       UNREACH_0E9919: db $20,$21,$84,$B0,$03,$4C,$3A,$97   ;0E9919|        |0E8421;
                       db $20,$8E,$91,$A5,$26,$29,$40,$F0   ;0E9921|        |0E918E;
                       db $0C,$AD,$4E,$05,$C9,$03,$F0,$DB   ;0E9929|        |0E4EAD;
                       db $A9,$1C,$20,$0A,$94,$A5,$28,$29   ;0E9931|        |      ;
                       db $04,$D0,$05,$A9,$02,$8D,$65,$05   ;0E9939|        |0000D0;
                       db $60                               ;0E9941|        |      ;
 
 
       UNREACH_0E9942: db $20,$89,$FB,$AD,$20,$05,$30,$03   ;0E9942|        |0EFB89;
                       db $4C,$9A,$9B,$4C,$8E,$9B,$4C,$8E   ;0E994A|        |0E9B9A;
 
                       db $9B                               ;0E9952|        |      ;
 
       UNREACH_0E9953: db $AD,$1D,$06,$F0,$09,$CE,$1D,$06   ;0E9953|        |0E061D;
                       db $20,$73,$EF,$4C,$3A,$87,$A9,$10   ;0E995B|        |0EEF73;
                       db $8D,$65,$05,$60                   ;0E9963|        |0E0565;
 
       UNREACH_0E9967: db $AD,$C1,$05,$D0,$03,$4C,$9A,$9B   ;0E9967|        |0E05C1;
                       db $4C,$8E,$9B,$A5,$28,$29,$08,$D0   ;0E996F|        |0E9B8E;
 
                       db $0C,$AD,$4E,$05,$C9,$03,$F0,$15   ;0E9977|        |0E4EAD;
                       db $A9,$1E,$4C,$0A,$94,$20,$F5,$B9   ;0E997F|        |      ;
                       db $90,$EF,$A9,$24,$4C,$AA,$94       ;0E9987|        |0E9978;
 
       UNREACH_0E998E: db $A5,$28,$29,$40,$D0,$DE,$A5,$28   ;0E998E|        |000028;
                       db $4A,$B0,$1A,$4A,$B0,$39,$4A,$90   ;0E9996|        |      ;
                       db $08,$20,$F7,$99,$B0,$0E,$4C,$9A   ;0E999E|        |      ;
                       db $9B,$4A,$90,$08,$20,$16,$9A,$B0   ;0E99A6|        |      ;
                       db $03,$4C,$8E,$9B,$60,$A9,$00,$8D   ;0E99AE|        |00004C;
                       db $A8,$04,$AD,$EF,$05,$F0,$0C,$20   ;0E99B6|        |      ;
                       db $F7,$99,$B0,$F0,$A2,$00,$A0,$00   ;0E99BE|        |000099;
                       db $4C,$AF,$9B,$20,$16,$9A,$B0,$E4   ;0E99C6|        |0E9BAF;
 
                       db $A2,$02,$A0,$08,$4C,$AF,$9B,$A9   ;0E99CE|        |      ;
                       db $01,$8D,$A8,$04,$AD,$EF,$05,$F0   ;0E99D6|        |00008D;
                       db $0C,$20,$16,$9A,$B0,$CE,$A2,$02   ;0E99DE|        |0E1620;
                       db $A0,$0C,$4C,$AF,$9B,$20,$F7,$99   ;0E99E6|        |      ;
                       db $B0,$C2,$A2,$00,$A0,$04,$4C,$AF   ;0E99EE|        |0E99B2;
                       db $9B,$AD,$1C,$04,$C9,$D7,$90,$16   ;0E99F6|        |      ;
                       db $A4,$68,$10,$12,$A5,$57,$C5,$71   ;0E99FE|        |000068;
                       db $D0,$06,$A5,$56,$C9,$30,$F0,$06   ;0E9A06|        |0E9A0E;
                       db $C0,$82,$B0,$02,$38,$60,$18,$60   ;0E9A0E|        |      ;
                       db $AD,$1C,$04,$C9,$37,$B0,$F7,$A4   ;0E9A16|        |0E041C;
                       db $68,$10,$F3,$A5,$57,$05,$56,$F0   ;0E9A1E|        |      ;
                       db $ED,$C0,$82,$B0,$E9,$38,$60,$AD   ;0E9A26|        |0E82C0;
                       db $1C,$04,$AE,$20,$05,$30,$10,$A6   ;0E9A2E|        |0EAE04;
                       db $68,$30,$06,$C9,$D3,$B0,$22,$18   ;0E9A36|        |      ;
                       db $60,$C9,$D6,$B0,$2A,$18,$60,$A6   ;0E9A3E|        |      ;
 
                       db $68,$30,$06,$C9,$29,$90,$08,$18   ;0E9A46|        |      ;
                       db $60,$C9,$34,$90,$2E,$18,$60,$A5   ;0E9A4E|        |      ;
 
                       db $2A,$C9,$10,$D0,$04,$E6,$6B,$D0   ;0E9A56|        |      ;
                       db $04,$A9,$06,$85,$2A,$A9,$96,$8D   ;0E9A5E|        |0000A9;
                       db $65,$05,$20,$85,$FB,$38,$60,$A5   ;0E9A66|        |000005;
                       db $57,$C5,$71,$D0,$06,$A5,$56,$C9   ;0E9A6E|        |0000C5;
                       db $30,$F0,$E6,$A5,$68,$C9,$83,$D0   ;0E9A76|        |0E9A68;
                       db $D4,$38,$60,$A5,$56,$05,$57,$F0   ;0E9A7E|        |000038;
                       db $D8,$A5,$68,$C9,$82,$F0,$04,$C9   ;0E9A86|        |      ;
                       db $84,$D0,$C2,$38,$60               ;0E9A8E|        |0000D0;
 
       UNREACH_0E9A93: db $20,$2D,$9A,$90,$01,$60,$20,$40   ;0E9A93|        |0E9A2D;
                       db $87,$20,$12,$87,$AD,$1D,$06,$F0   ;0E9A9B|        |000020;
                       db $4C,$CE,$1D,$06,$AD,$7C,$05,$F0   ;0E9AA3|        |0E1DCE;
                       db $04,$CE,$7C,$05,$60               ;0E9AAB|        |0000CE;
 
          CODE_0E9AB0: LDA.W r_entity_ObjectIdxes           ;0E9AB0|AD4E05  |00054E;
                       CMP.B #$02                           ;0E9AB3|C902    |      ;
                       BEQ UNREACH_0E9ACC                   ;0E9AB5|F015    |0E9ACC;
                       LDA.W r_entity_OamBaseOffset         ;0E9AB7|AD9305  |000593;
                       ASL A                                ;0E9ABA|0A      |      ;
                       TAY                                  ;0E9ABB|A8      |      ;
                       LDA.W UNREACH_0E9BEC,Y               ;0E9ABC|B9EC9B  |0E9BEC;
                       STA.W r_OamSpecIdxDoubled            ;0E9ABF|8D0004  |000400;
                       LDA.W UNREACH_0E9BED,Y               ;0E9AC2|B9ED9B  |0E9BED;
                       STA.W $057C                          ;0E9AC5|8D7C05  |0E057C;
                       INC.W $0593                          ;0E9AC8|EE9305  |0E0593;
                       RTS                                  ;0E9ACB|60      |      ;
 
 
       UNREACH_0E9ACC: db $AD,$93,$05,$0A,$A8,$B9,$F4,$9B   ;0E9ACC|        |0E0593;
                       db $8D,$00,$04,$B9,$F5,$9B,$8D,$7C   ;0E9AD4|        |0E0400;
                       db $05,$EE,$93,$05,$60,$AD,$1C,$04   ;0E9ADC|        |0000EE;
                       db $38,$E9,$04,$4C,$06,$9B,$18,$69   ;0E9AE4|        |      ;
                       db $07,$4C,$18,$9B,$A9,$00,$8D,$C4   ;0E9AEC|        |00004C;
                       db $04,$8D,$DB,$04,$A4,$68,$10,$1F   ;0E9AF4|        |00008D;
                       db $AC,$4E,$05,$C0,$02,$F0,$DE,$AD   ;0E9AFC|        |0E054E;
                       db $1C,$04,$18,$69,$03,$18,$65,$56   ;0E9B04|        |0E1804;
                       db $29,$F8,$38,$E5,$56,$C0,$02,$F0   ;0E9B0C|        |      ;
                       db $D5,$18,$69,$03,$8D,$1C,$04,$AD   ;0E9B14|        |000018;
                       db $20,$05,$30,$44,$A2,$12,$A9,$02   ;0E9B1C|        |0E3005;
                       db $20,$DD,$FC,$D0,$14,$A2,$12,$A9   ;0E9B24|        |0EFCDD;
                       db $FE,$20,$DD,$FC,$F0,$56,$A2,$1A   ;0E9B2C|        |0EDD20;
                       db $A9,$FE,$20,$DD,$FC,$F0,$4D,$D0   ;0E9B34|        |      ;
                       db $09,$A2,$1A,$A9,$02,$20,$DD,$FC   ;0E9B3C|        |      ;
                       db $F0,$42,$20,$02,$8A,$AD,$4E,$05   ;0E9B44|        |0E9B88;
                       db $C9,$02,$D0,$09,$AD,$1C,$04,$18   ;0E9B4C|        |      ;
                       db $69,$04,$8D,$1C,$04,$A9,$02,$8D   ;0E9B54|        |      ;
                       db $65,$05,$A9,$02,$8D,$00,$04,$60   ;0E9B5C|        |000005;
                       db $A2,$12,$A9,$02,$20,$DD,$FC,$D0   ;0E9B64|        |      ;
                       db $12,$A2,$12,$A9,$FE,$20,$DD,$FC   ;0E9B6C|        |0000A2;
                       db $F0,$12,$A2,$0A,$A9,$FE,$20,$DD   ;0E9B74|        |0E9B88;
                       db $FC,$F0,$C7,$A2,$0A,$A9,$02,$20   ;0E9B7C|        |0EC7F0;
                       db $DD,$FC,$F0,$BE,$A9,$12,$8D,$65   ;0E9B84|        |0EF0FC;
                       db $05,$60                           ;0E9B8C|        |000060;
 
       UNREACH_0E9B8E: db $A2,$02,$AD,$EF,$05,$8D,$A8,$04   ;0E9B8E|        |      ;
                       db $A0,$08,$D0,$0C                   ;0E9B96|        |      ;
 
       UNREACH_0E9B9A: db $A2,$00,$AD,$EF,$05,$49,$01,$8D   ;0E9B9A|        |      ;
                       db $A8,$04,$A0,$00,$AD,$A8,$04,$F0   ;0E9BA2|        |      ;
                       db $04,$C8,$C8,$C8,$C8               ;0E9BAA|        |0000C8;
 
       UNREACH_0E9BAF: db $8E,$93,$05,$B9,$DC,$9B,$8D,$F2   ;0E9BAF|        |0E0593;
                       db $04,$B9,$DD,$9B,$8D,$09,$05,$B9   ;0E9BB7|        |0000B9;
                       db $DE,$9B,$8D,$20,$05,$B9,$DF,$9B   ;0E9BBF|        |0E8D9B;
                       db $8D,$37,$05,$A9,$01,$8D,$7C,$05   ;0E9BC7|        |0E0537;
                       db $AD,$DB,$9B,$8D,$1D,$06,$A9,$14   ;0E9BCF|        |0E9BDB;
                       db $8D,$65,$05,$60,$0F,$00,$80,$00   ;0E9BD7|        |0E0565;
                       db $80,$FF,$80,$00,$80,$00,$80,$FF   ;0E9BDF|        |0E9BE0;
 
                       db $80,$FF,$80,$FF,$80               ;0E9BE7|        |0E9BE8;
 
 
       UNREACH_0E9BEC: db $04                               ;0E9BEC|        |000007;
 
       UNREACH_0E9BED: db $07,$0A,$FF,$04,$07,$0C,$FF,$48   ;0E9BED|        |00000A;
                       db $07,$0A,$FF,$48,$07,$0C,$FF       ;0E9BF5|        |00000A;
 
       UNREACH_0E9BFC: db $AC,$65,$05,$20,$86,$E8,$C5,$8A   ;0E9BFC|        |0E0565;
                       db $38,$95,$60,$96,$1D,$96,$70,$97   ;0E9C04|        |      ;
                       db $19,$99,$70,$97,$53,$99,$67,$99   ;0E9C0C|        |0E7099;
                       db $8E,$99,$93,$9A,$42,$99,$18,$94   ;0E9C14|        |0E9399;
                       db $3A,$94,$65,$94,$9E,$94,$32,$9C   ;0E9C1C|        |      ;
                       db $35,$9C,$38,$9C,$1C,$83,$B1,$93   ;0E9C24|        |00009C;
                       db $B1,$93,$57,$8B,$DE,$8A,$4C,$B8   ;0E9C2C|        |000093;
                       db $94,$4C,$D4,$94,$4C,$FF,$94       ;0E9C34|        |00004C;
 
       UNREACH_0E9C3B: db $AC,$65,$05,$20,$86,$E8,$C5,$8A   ;0E9C3B|        |0E0565;
                       db $38,$95,$3B,$9D,$92,$9E,$3C,$9F   ;0E9C43|        |      ;
                       db $D5,$9C,$3C,$9F,$53,$99,$67,$99   ;0E9C4B|        |00009C;
                       db $8E,$99,$93,$9A,$42,$99,$8B,$9C   ;0E9C53|        |0E9399;
                       db $EB,$9E,$9F,$9C,$9E,$94,$B8,$94   ;0E9C5B|        |      ;
                       db $C0,$9E,$FF,$94,$1C,$83,$B1,$93   ;0E9C63|        |      ;
                       db $B1,$93,$57,$8B,$DE,$8A,$3B,$A2   ;0E9C6B|        |000093;
                       db $65,$A3,$2E,$A4,$41,$A4,$64,$A4   ;0E9C73|        |0000A3;
                       db $77,$A4,$80,$A4,$93,$A4,$9F,$A4   ;0E9C7B|        |0000A4;
                       db $B2,$A4,$88,$A1,$26,$A2,$33,$A3   ;0E9C83|        |0000A4;
                       db $20,$1D,$84,$B0,$08,$A9,$00,$8D   ;0E9C8B|        |0E841D;
                       db $13,$04,$4C,$8D,$A0,$20,$8E,$91   ;0E9C93|        |000004;
                       db $4C,$28,$94,$60,$20,$1D,$84,$90   ;0E9C9B|        |0E9428;
 
                       db $EC,$20,$8E,$91,$20,$EB,$9C,$AD   ;0E9CA3|        |0E8E20;
                       db $65,$05,$C9,$02,$D0,$13,$A9,$18   ;0E9CAB|        |000005;
                       db $8D,$65,$05,$20,$28,$94,$AD,$65   ;0E9CB3|        |0E0565;
                       db $05,$C9,$18,$D0,$03,$20,$CB,$BE   ;0E9CBB|        |0000C9;
                       db $60,$20,$89,$BC,$B0,$01,$60,$A9   ;0E9CC3|        |      ;
 
                       db $0A,$8D,$65,$05,$A9,$0E,$8D,$00   ;0E9CCB|        |      ;
                       db $04,$60,$20,$1D,$84,$B0,$03,$4C   ;0E9CD3|        |000060;
                       db $8D,$A0,$20,$8E,$91,$A5,$26,$29   ;0E9CDB|        |0E20A0;
                       db $40,$F0,$05,$A9,$1C,$20,$0A,$94   ;0E9CE3|        |      ;
                       db $A5,$28,$29,$04,$D0,$06,$A9,$02   ;0E9CEB|        |000028;
                       db $8D,$65,$05,$60,$AD,$65,$05,$C9   ;0E9CF3|        |0E0565;
                       db $0A,$D0,$F8,$20,$C4,$83,$90,$F3   ;0E9CFB|        |      ;
                       db $20,$28,$9D,$D0,$EE,$AD,$A8,$04   ;0E9D03|        |0E9D28;
                       db $8D,$C1,$05,$20,$27,$A5,$AD,$1C   ;0E9D0B|        |0E05C1;
                       db $04,$18,$69,$0C,$85,$D3,$A9,$40   ;0E9D13|        |000018;
                       db $8D,$65,$05,$A0,$00,$8C,$93,$05   ;0E9D1B|        |0E0565;
                       db $C8,$8C,$7C,$05,$60,$A9,$05,$A2   ;0E9D23|        |      ;
                       db $0C,$20,$DD,$FC,$F0,$04,$A9,$01   ;0E9D2B|        |0EDD20;
                       db $D0,$02,$A9,$00,$CD,$A8,$04,$60   ;0E9D33|        |0E9D37;
                       db $20,$1D,$84,$B0,$03,$4C,$8D,$A0   ;0E9D3B|        |0E841D;
                       db $A5,$26,$0A,$90,$03,$4C,$FF,$9D   ;0E9D43|        |000026;
                       db $0A,$B0,$19,$A5,$28,$4A,$B0,$32   ;0E9D4B|        |      ;
                       db $4A,$B0,$66,$A9,$02,$8D,$65,$05   ;0E9D53|        |      ;
                       db $20,$BC,$8A,$20,$73,$EF,$20,$3A   ;0E9D5B|        |0E8ABC;
                       db $87,$4C,$12,$87,$A5,$28,$29,$08   ;0E9D63|        |00004C;
                       db $D0,$08,$A9,$18,$20,$0A,$94,$4C   ;0E9D6B|        |0E9D75;
                       db $5B,$9D,$20,$F5,$B9,$90,$F3,$A9   ;0E9D73|        |      ;
                       db $20,$20,$AA,$94,$20,$BC,$8A,$4C   ;0E9D7B|        |0EAA20;
                       db $61,$9D,$A9,$00,$8D,$A8,$04,$20   ;0E9D83|        |00009D;
                       db $85,$8E,$90,$15,$A2,$00,$A9,$08   ;0E9D8B|        |00008E;
                       db $20,$DD,$FC,$D0,$62,$A2,$F4,$A9   ;0E9D93|        |0EFCDD;
                       db $08,$20,$DD,$FC,$D0,$59,$4C,$5E   ;0E9D9B|        |      ;
                       db $9D,$A2,$00,$A9,$08,$20,$DD,$FC   ;0E9DA3|        |0E00A2;
                       db $D0,$6E,$A2,$F4,$A9,$08,$20,$DD   ;0E9DAB|        |0E9E1B;
                       db $FC,$D0,$44,$A9,$01,$A0,$40,$D0   ;0E9DB3|        |0E44D0;
                       db $35,$A9,$01,$8D,$A8,$04,$20,$01   ;0E9DBB|        |0000A9;
                       db $8F,$90,$15,$A2,$00,$A9,$F8,$20   ;0E9DC3|        |A21590;
                       db $DD,$FC,$D0,$2B,$A2,$F4,$A9,$F8   ;0E9DCB|        |0ED0FC;
                       db $20,$DD,$FC,$D0,$22,$4C,$5E,$9D   ;0E9DD3|        |0EFCDD;
                       db $A2,$00,$A9,$F8,$20,$0B,$84,$D0   ;0E9DDB|        |      ;
                       db $27,$A2,$F4,$A9,$F8,$20,$DD,$FC   ;0E9DE3|        |0000A2;
                       db $D0,$0D,$A9,$FE,$A0,$C0,$8C,$09   ;0E9DEB|        |0E9DFA;
                       db $05,$8D,$F2,$04,$4C,$5B,$9D,$A9   ;0E9DF3|        |00008D;
                       db $00,$A8,$F0,$F2,$A9,$06,$8D,$65   ;0E9DFB|        |      ;
                       db $05,$4C,$5B,$9D,$A9,$36,$D0,$02   ;0E9E03|        |00004C;
 
          CODE_0E9E0B: LDA.B #$18                           ;0E9E0B|A918    |      ;
                       STA.W $0400                          ;0E9E0D|8D0004  |0E0400;
                       JSR.W CODE_0E9E36                    ;0E9E10|20369E  |0E9E36;
                       LDA.B #$01                           ;0E9E13|A901    |      ;
                       BNE CODE_0E9E25                      ;0E9E15|D00E    |0E9E25;
                       LDA.B #$36                           ;0E9E17|A936    |      ;
                       BNE CODE_0E9E1D                      ;0E9E19|D002    |0E9E1D;
 
          CODE_0E9E1B: LDA.B #$18                           ;0E9E1B|A918    |      ;
 
          CODE_0E9E1D: STA.W $0400                          ;0E9E1D|8D0004  |0E0400;
                       JSR.W CODE_0E9E3F                    ;0E9E20|203F9E  |0E9E3F;
                       LDA.B #$00                           ;0E9E23|A900    |      ;
 
          CODE_0E9E25: STA.W $05C1                          ;0E9E25|8DC105  |0E05C1;
                       LDA.B #$00                           ;0E9E28|A900    |      ;
                       STA.W $05D8                          ;0E9E2A|8DD805  |0E05D8;
                       STA.W $0593                          ;0E9E2D|8D9305  |0E0593;
                       LDA.B #$30                           ;0E9E30|A930    |      ;
                       STA.W $0565                          ;0E9E32|8D6505  |0E0565;
                       RTS                                  ;0E9E35|60      |      ;
 
 
          CODE_0E9E36: LDA.W $0438                          ;0E9E36|AD3804  |0E0438;
                       CLC                                  ;0E9E39|18      |      ;
                       ADC.B #$07                           ;0E9E3A|6907    |      ;
                       JMP.W CODE_0E9E42                    ;0E9E3C|4C429E  |0E9E42;
 
 
          CODE_0E9E3F: LDA.W $0438                          ;0E9E3F|AD3804  |0E0438;
 
          CODE_0E9E42: LDY.B r_roomOrientation              ;0E9E42|A468    |000068;
                       BMI CODE_0E9E52                      ;0E9E44|300C    |0E9E52;
                       CLC                                  ;0E9E46|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;0E9E47|6556    |000056;
                       AND.B #$F8                           ;0E9E49|29F8    |      ;
                       SEC                                  ;0E9E4B|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;0E9E4C|E556    |000056;
                       STA.W $0438                          ;0E9E4E|8D3804  |0E0438;
                       RTS                                  ;0E9E51|60      |      ;
 
 
          CODE_0E9E52: AND.B #$F8                           ;0E9E52|29F8    |      ;
                       STA.W $0438                          ;0E9E54|8D3804  |0E0438;
                       RTS                                  ;0E9E57|60      |      ;
 
                       db $80,$F9,$F9,$F9,$F9,$F9,$F9,$F9   ;0E9E58|        |0E9E53;
 
                       db $F9,$F9,$F9,$F9,$F9,$F9,$F9,$F9   ;0E9E60|        |0EF9F9;
                       db $F9,$F9,$F9,$F9,$FA,$FA,$FA,$FA   ;0E9E68|        |0EF9F9;
                       db $FA,$FA,$FB,$FB,$FB,$FB,$FB,$FC   ;0E9E70|        |      ;
                       db $FC,$FC,$FC,$FC,$FD,$FD,$FD,$FD   ;0E9E78|        |0EFCFC;
                       db $FD,$FD,$FE,$FE,$FE,$FE,$FE,$FF   ;0E9E80|        |0EFEFD;
                       db $FF,$FF,$FF,$FF,$00,$00,$00,$00   ;0E9E88|        |FFFFFF;
                       db $00,$81,$A9,$0E,$8D,$00,$04,$A9   ;0E9E90|        |      ;
                       db $04,$85,$B9,$A9,$00,$8D,$C1,$05   ;0E9E98|        |000085;
                       db $A9,$1E,$8D,$D8,$05,$A9,$00,$8D   ;0E9EA0|        |      ;
                       db $EF,$05,$8D,$06,$06,$8D,$09,$05   ;0E9EA8|        |068D05;
                       db $8D,$F2,$04,$85,$9D,$A9,$01,$8D   ;0E9EB0|        |0E04F2;
                       db $1D,$06,$A9,$08,$8D,$65,$05,$60   ;0E9EB8|        |0EA906;
                       db $20,$5A,$9F,$AD,$65,$05,$C9,$26   ;0E9EC0|        |0E9F5A;
                       db $F0,$40,$C9,$02,$D0,$0C,$A9,$00   ;0E9EC8|        |0E9F0A;
                       db $85,$B9,$A9,$20,$8D,$65,$05,$4C   ;0E9ED0|        |0000B9;
                       db $C3,$94,$20,$F2,$BA,$B0,$01,$60   ;0E9ED8|        |000094;
                       db $A9,$08,$8D,$65,$05,$A9,$02,$8D   ;0E9EE0|        |      ;
                       db $00,$04,$60,$20,$5A,$9F,$AD,$65   ;0E9EE8|        |      ;
                       db $05,$C9,$26,$F0,$15,$C9,$02,$D0   ;0E9EF0|        |0000C9;
                       db $0C,$A9,$00,$85,$B9,$A9,$18,$8D   ;0E9EF8|        |0E00A9;
                       db $65,$05,$4C,$28,$94,$20,$89,$BC   ;0E9F00|        |000005;
                       db $B0,$D6,$60                       ;0E9F08|        |0E9EE0;
 
          CODE_0E9F0B: LDA.W $041C                          ;0E9F0B|AD1C04  |0E041C;
                       CLC                                  ;0E9F0E|18      |      ;
                       ADC.B #$01                           ;0E9F0F|6901    |      ;
                       STA.W $041C                          ;0E9F11|8D1C04  |0E041C;
                       JSR.W CODE_0E8A02                    ;0E9F14|20028A  |0E8A02;
                       LDA.W $041C                          ;0E9F17|AD1C04  |0E041C;
                       CLC                                  ;0E9F1A|18      |      ;
                       ADC.B #$05                           ;0E9F1B|6905    |      ;
                       STA.W $041C                          ;0E9F1D|8D1C04  |0E041C;
                       LDA.B #$02                           ;0E9F20|A902    |      ;
                       db $20                               ;0E9F22|        |      ;
                       dw clearAllEntitySprite              ;0E9F23|        |0FEF57;
                       LDA.B #$32                           ;0E9F25|A932    |      ;
                       STA.W $0565                          ;0E9F27|8D6505  |0E0565;
                       RTS                                  ;0E9F2A|60      |      ;
 
 
          CODE_0E9F2B: LDA.B #$00                           ;0E9F2B|A900    |      ;
                       BEQ CODE_0E9F31                      ;0E9F2D|F002    |0E9F31;
 
          CODE_0E9F2F: LDA.B #$FF                           ;0E9F2F|A9FF    |      ;
 
          CODE_0E9F31: LDX.B #$00                           ;0E9F31|A200    |      ;
                       JSR.W DATA8_0E840B                   ;0E9F33|200B84  |0E840B;
                       BEQ CODE_0E9F3A                      ;0E9F36|F002    |0E9F3A;
                       CLC                                  ;0E9F38|18      |      ;
                       RTS                                  ;0E9F39|60      |      ;
 
 
          CODE_0E9F3A: SEC                                  ;0E9F3A|38      |      ;
 
          CODE_0E9F3B: RTS                                  ;0E9F3B|60      |      ;
 
                       LDA.B r_curJoyPe1                    ;0E9F3C|A526    |000026;
                       AND.B #$40                           ;0E9F3E|2940    |      ;
                       BEQ CODE_0E9F5A                      ;0E9F40|F018    |0E9F5A;
                       LDA.B r_Joy1Pe                       ;0E9F42|A528    |000028;
                       AND.B #$08                           ;0E9F44|2908    |      ;
                       BNE CODE_0E9F50                      ;0E9F46|D008    |0E9F50;
 
          CODE_0E9F48: LDA.B #$1A                           ;0E9F48|A91A    |      ;
                       JSR.W UNREACH_0E940A                 ;0E9F4A|200A94  |0E940A;
                       JMP.W CODE_0E9F5A                    ;0E9F4D|4C5A9F  |0E9F5A;
 
 
          CODE_0E9F50: JSR.W CODE_0EB9F5                    ;0E9F50|20F5B9  |0EB9F5;
                       BCC CODE_0E9F48                      ;0E9F53|90F3    |0E9F48;
                       LDA.B #$22                           ;0E9F55|A922    |      ;
                       JSR.W CODE_0E94AA                    ;0E9F57|20AA94  |0E94AA;
 
          CODE_0E9F5A: JSR.W CODE_0E83AA                    ;0E9F5A|20AA83  |0E83AA;
                       BCS CODE_0E9F3B                      ;0E9F5D|B0DC    |0E9F3B;
                       LDA.B r_Joy1Pe                       ;0E9F5F|A528    |000028;
                       LSR A                                ;0E9F61|4A      |      ;
                       BCS CODE_0E9F87                      ;0E9F62|B023    |0E9F87;
                       LSR A                                ;0E9F64|4A      |      ;
                       BCC CODE_0E9FA7                      ;0E9F65|9040    |0E9FA7;
                       LDA.B #$01                           ;0E9F67|A901    |      ;
 
                       STA.W $04A8                          ;0E9F69|8DA804  |0E04A8;
                       LDA.B #$FF                           ;0E9F6C|A9FF    |      ;
                       STA.W $04F2                          ;0E9F6E|8DF204  |0E04F2;
                       LDA.B #$00                           ;0E9F71|A900    |      ;
                       STA.W $0509                          ;0E9F73|8D0905  |0E0509;
                       LDX.B #$00                           ;0E9F76|A200    |      ;
                       LDA.B #$F8                           ;0E9F78|A9F8    |      ;
                       JSR.W DATA8_0E840B                   ;0E9F7A|200B84  |0E840B;
                       BEQ CODE_0E9FA7                      ;0E9F7D|F028    |0E9FA7;
                       JSR.W CODE_0E9F2F                    ;0E9F7F|202F9F  |0E9F2F;
                       BCC CODE_0E9FA7                      ;0E9F82|9023    |0E9FA7;
                       JMP.W CODE_0E9E0B                    ;0E9F84|4C0B9E  |0E9E0B;
 
 
          CODE_0E9F87: LDA.B #$00                           ;0E9F87|A900    |      ;
                       STA.W $04A8                          ;0E9F89|8DA804  |0E04A8;
                       LDA.B #$01                           ;0E9F8C|A901    |      ;
                       STA.W $04F2                          ;0E9F8E|8DF204  |0E04F2;
                       LDA.B #$00                           ;0E9F91|A900    |      ;
                       STA.W $0509                          ;0E9F93|8D0905  |0E0509;
                       LDX.B #$00                           ;0E9F96|A200    |      ;
                       LDA.B #$08                           ;0E9F98|A908    |      ;
                       JSR.W DATA8_0E840B                   ;0E9F9A|200B84  |0E840B;
                       BEQ CODE_0E9FA7                      ;0E9F9D|F008    |0E9FA7;
                       JSR.W CODE_0E9F2B                    ;0E9F9F|202B9F  |0E9F2B;
                       BCC CODE_0E9FA7                      ;0E9FA2|9003    |0E9FA7;
                       JMP.W CODE_0E9E1B                    ;0E9FA4|4C1B9E  |0E9E1B;
 
 
          CODE_0E9FA7: LDA.B r_Joy1Pe                       ;0E9FA7|A528    |000028;
                       AND.B #$08                           ;0E9FA9|2908    |      ;
                       BEQ CODE_0E9FC1                      ;0E9FAB|F014    |0E9FC1;
                       LDX.B #$F8                           ;0E9FAD|A2F8    |      ;
                       LDA.B #$00                           ;0E9FAF|A900    |      ;
                       JSR.W DATA8_0E840B                   ;0E9FB1|200B84  |0E840B;
                       BEQ CODE_0E9FC1                      ;0E9FB4|F00B    |0E9FC1;
                       LDX.B #$00                           ;0E9FB6|A200    |      ;
                       TXA                                  ;0E9FB8|8A      |      ;
                       JSR.W DATA8_0E840B                   ;0E9FB9|200B84  |0E840B;
                       BNE CODE_0E9FC1                      ;0E9FBC|D003    |0E9FC1;
                       JMP.W CODE_0E9F0B                    ;0E9FBE|4C0B9F  |0E9F0B;
 
 
          CODE_0E9FC1: LDA.W r_entity_XposSpeed             ;0E9FC1|ADF204  |0004F2;
                       BPL CODE_0E9FE3                      ;0E9FC4|101D    |0E9FE3;
                       LDX.B #$0C                           ;0E9FC6|A20C    |      ;
                       LDA.B #$F8                           ;0E9FC8|A9F8    |      ;
                       db $20                               ;0E9FCA|        |      ;
                       dw CODE_0FFCDD                       ;0E9FCB|        |0FFCDD;
                       BNE CODE_0E9FFE                      ;0E9FCD|D02F    |0E9FFE;
                       LDX.B #$00                           ;0E9FCF|A200    |      ;
                       LDA.B #$F8                           ;0E9FD1|A9F8    |      ;
                       db $20                               ;0E9FD3|        |      ;
                       dw CODE_0FFCDD                       ;0E9FD4|        |0FFCDD;
                       BNE CODE_0E9FFE                      ;0E9FD6|D026    |0E9FFE;
                       LDX.B #$F4                           ;0E9FD8|A2F4    |      ;
                       LDA.B #$F8                           ;0E9FDA|A9F8    |      ;
                       db $20                               ;0E9FDC|        |      ;
                       dw CODE_0FFCDD                       ;0E9FDD|        |0FFCDD;
                       BEQ CODE_0EA006                      ;0E9FDF|F025    |0EA006;
                       BNE CODE_0E9FFE                      ;0E9FE1|D01B    |0E9FFE;
 
          CODE_0E9FE3: LDX.B #$0C                           ;0E9FE3|A20C    |      ;
                       LDA.B #$08                           ;0E9FE5|A908    |      ;
                       db $20                               ;0E9FE7|        |      ;
                       dw CODE_0FFCDD                       ;0E9FE8|        |0FFCDD;
                       BNE CODE_0E9FFE                      ;0E9FEA|D012    |0E9FFE;
                       LDX.B #$00                           ;0E9FEC|A200    |      ;
                       LDA.B #$08                           ;0E9FEE|A908    |      ;
                       db $20                               ;0E9FF0|        |      ;
                       dw CODE_0FFCDD                       ;0E9FF1|        |0FFCDD;
                       BNE CODE_0E9FFE                      ;0E9FF3|D009    |0E9FFE;
                       LDX.B #$F4                           ;0E9FF5|A2F4    |      ;
                       LDA.B #$08                           ;0E9FF7|A908    |      ;
                       db $20                               ;0E9FF9|        |      ;
                       dw CODE_0FFCDD                       ;0E9FFA|        |0FFCDD;
                       BEQ CODE_0EA006                      ;0E9FFC|F008    |0EA006;
 
          CODE_0E9FFE: LDA.B #$00                           ;0E9FFE|A900    |      ;
                       STA.W $04F2                          ;0EA000|8DF204  |0E04F2;
                       STA.W $0509                          ;0EA003|8D0905  |0E0509;
 
          CODE_0EA006: LDA.W $041C                          ;0EA006|AD1C04  |0E041C;
                       STA.B $06                            ;0EA009|8506    |000006;
                       JSR.W UNREACH_0EA0D1                 ;0EA00B|20D1A0  |0EA0D1;
                       LDA.W $05C1                          ;0EA00E|ADC105  |0E05C1;
                       BEQ CODE_0EA06A                      ;0EA011|F057    |0EA06A;
                       LDX.B #$0C                           ;0EA013|A20C    |      ;
                       LDA.B #$FB                           ;0EA015|A9FB    |      ;
                       db $20                               ;0EA017|        |      ;
                       dw CODE_0FFCDD                       ;0EA018|        |0FFCDD;
                       BNE CODE_0EA03E                      ;0EA01A|D022    |0EA03E;
                       LDX.B #$0C                           ;0EA01C|A20C    |      ;
                       LDA.B #$05                           ;0EA01E|A905    |      ;
                       db $20                               ;0EA020|        |      ;
                       dw CODE_0FFCDD                       ;0EA021|        |0FFCDD;
                       BNE CODE_0EA03E                      ;0EA023|D019    |0EA03E;
                       LDA.B r_conveyaerRoomEffect          ;0EA025|A58B    |00008B;
                       CMP.B #$01                           ;0EA027|C901    |      ;
                       BEQ CODE_0EA036                      ;0EA029|F00B    |0EA036;
                       CMP.B #$05                           ;0EA02B|C905    |      ;
                       BEQ CODE_0EA082                      ;0EA02D|F053    |0EA082;
                       CMP.B #$06                           ;0EA02F|C906    |      ;
                       BEQ CODE_0EA082                      ;0EA031|F04F    |0EA082;
                       JMP.W CODE_0EA064                    ;0EA033|4C64A0  |0EA064;
 
 
          CODE_0EA036: LDX.B r_ConveyorRelated              ;0EA036|A691    |000091;
                       db $20                               ;0EA038|        |      ;
                       dw CODE_0FFE9C                       ;0EA039|        |0FFE9C;
                       JMP.W CODE_0EA05D                    ;0EA03B|4C5DA0  |0EA05D;
 
 
          CODE_0EA03E: LDA.W $05D8                          ;0EA03E|ADD805  |0E05D8;
                       BNE CODE_0EA051                      ;0EA041|D00E    |0EA051;
                       LDA.B #$0B                           ;0EA043|A90B    |      ;
                       db $20                               ;0EA045|        |      ;
                       dw initFreezWaterEffect_01           ;0EA046|        |0FE25F;
                       LDA.B #$0C                           ;0EA048|A90C    |      ;
                       STA.B r_timerClunk_drop              ;0EA04A|85B9    |0000B9;
                       LDA.B #$0E                           ;0EA04C|A90E    |      ;
                       STA.W r_OamSpecIdxDoubled            ;0EA04E|8D0004  |000400;
 
          CODE_0EA051: JSR.W CODE_0E8A02                    ;0EA051|20028A  |0E8A02;
                       LDA.W r_entity_YPos                  ;0EA054|AD1C04  |00041C;
                       CLC                                  ;0EA057|18      |      ;
                       ADC.B #$04                           ;0EA058|6904    |      ;
                       STA.W $041C                          ;0EA05A|8D1C04  |0E041C;
 
          CODE_0EA05D: LDA.B #$02                           ;0EA05D|A902    |      ;
                       STA.W $0565                          ;0EA05F|8D6505  |0E0565;
                       BNE CODE_0EA067                      ;0EA062|D003    |0EA067;
 
          CODE_0EA064: JSR.W CODE_0E8712                    ;0EA064|201287  |0E8712;
 
          CODE_0EA067: JMP.W CODE_0E873A                    ;0EA067|4C3A87  |0E873A;
 
 
          CODE_0EA06A: LDX.B #$00                           ;0EA06A|A200    |      ;
                       LDA.B #$05                           ;0EA06C|A905    |      ;
                       JSR.W DATA8_0E840B                   ;0EA06E|200B84  |0E840B;
                       BNE CODE_0EA07C                      ;0EA071|D009    |0EA07C;
                       LDX.B #$00                           ;0EA073|A200    |      ;
                       LDA.B #$FB                           ;0EA075|A9FB    |      ;
                       JSR.W DATA8_0E840B                   ;0EA077|200B84  |0E840B;
                       BEQ CODE_0EA064                      ;0EA07A|F0E8    |0EA064;
 
          CODE_0EA07C: JSR.W grantStartStopClimb            ;0EA07C|208DA0  |0EA08D;
                       JMP.W CODE_0EA064                    ;0EA07F|4C64A0  |0EA064;
 
 
          CODE_0EA082: LDA.B $06                            ;0EA082|A506    |000006;
                       CLC                                  ;0EA084|18      |      ;
                       ADC.B r_ConveyorRelated              ;0EA085|6591    |000091;
                       STA.W $041C                          ;0EA087|8D1C04  |0E041C;
                       JMP.W CODE_0EA05D                    ;0EA08A|4C5DA0  |0EA05D;
 
 
  grantStartStopClimb: LDA.B #$0C                           ;0EA08D|A90C    |      ;
                       STA.W r_Player_StateDoubled          ;0EA08F|8D6505  |000565;
                       LDA.B r_previousBackup88             ;0EA092|A5CF    |0000CF;
                       CMP.B #$01                           ;0EA094|C901    |      ;
                       BEQ CODE_0EA09C                      ;0EA096|F004    |0EA09C;
                       CMP.B #$06                           ;0EA098|C906    |      ;
                       BNE CODE_0EA0A0                      ;0EA09A|D004    |0EA0A0;
 
          CODE_0EA09C: LDA.B #$10                           ;0EA09C|A910    |      ;
                       STA.B r_delayElevators               ;0EA09E|85AF    |0000AF;
 
          CODE_0EA0A0: LDA.B #$01                           ;0EA0A0|A901    |      ;
                       STA.W $05C1                          ;0EA0A2|8DC105  |0E05C1;
                       LDA.B #$38                           ;0EA0A5|A938    |      ;
                       STA.W $05D8                          ;0EA0A7|8DD805  |0E05D8;
                       LDA.B #$00                           ;0EA0AA|A900    |      ;
                       STA.W $05EF                          ;0EA0AC|8DEF05  |0E05EF;
                       STA.W $0606                          ;0EA0AF|8D0606  |0E0606;
                       STA.B $9D                            ;0EA0B2|859D    |00009D;
                       STA.B r_timerClunk_drop              ;0EA0B4|85B9    |0000B9;
                       LDA.B #$01                           ;0EA0B6|A901    |      ;
                       STA.W $061D                          ;0EA0B8|8D1D06  |0E061D;
                       LDA.W $04A8                          ;0EA0BB|ADA804  |0E04A8;
                       BNE CODE_0EA0C6                      ;0EA0BE|D006    |0EA0C6;
                       LDA.B #$00                           ;0EA0C0|A900    |      ;
                       LDY.B #$20                           ;0EA0C2|A020    |      ;
                       BNE CODE_0EA0CA                      ;0EA0C4|D004    |0EA0CA;
 
          CODE_0EA0C6: LDA.B #$FF                           ;0EA0C6|A9FF    |      ;
                       LDY.B #$E0                           ;0EA0C8|A0E0    |      ;
 
          CODE_0EA0CA: STA.W $04F2                          ;0EA0CA|8DF204  |0E04F2;
                       STY.W $0509                          ;0EA0CD|8C0905  |0E0509;
                       RTS                                  ;0EA0D0|60      |      ;
 
 
       UNREACH_0EA0D1: db $AD,$65,$05,$C9,$08,$D0,$0D,$A5   ;0EA0D1|        |0E0565;
                       db $B9,$F0,$09,$C6,$B9,$D0,$05,$A9   ;0EA0D9|        |0E09F0;
                       db $16,$8D,$00,$04,$AD,$C1,$05,$D0   ;0EA0E1|        |00008D;
                       db $0C,$A5,$9D,$D0,$12,$A5,$28,$29   ;0EA0E9|        |0E9DA5;
                       db $80,$D0,$0C,$E6,$9D,$A9,$02,$8D   ;0EA0F1|        |0EA0C3;
                       db $1D,$06,$A9,$00,$8D,$06,$06,$AD   ;0EA0F9|        |0EA906;
                       db $1C,$04,$C9,$08,$B0,$08,$AD,$C1   ;0EA101|        |0EC904;
                       db $05,$D0,$03,$20,$A0,$A0,$4C,$12   ;0EA109|        |0000D0;
                       db $A1,$A9,$00,$8D,$37,$05,$8D,$DB   ;0EA111|        |0000A9;
                       db $04,$AC,$D8,$05,$AD,$C1,$05,$D0   ;0EA119|        |0000AC;
                       db $37,$B9,$58,$9E,$C9,$81,$F0,$1D   ;0EA121|        |0000B9;
                       db $8D,$20,$05,$18,$AD,$EF,$05,$6D   ;0EA129|        |0E0520;
                       db $06,$06,$8D,$EF,$05,$AD,$D8,$05   ;0EA131|        |000006;
                       db $6D,$1D,$06,$C9,$39,$90,$02,$A9   ;0EA139|        |0E061D;
                       db $39,$8D,$D8,$05,$60,$A9,$00,$8D   ;0EA141|        |0ED88D;
                       db $20,$05,$A0,$01,$8C,$C1,$05,$CE   ;0EA149|        |0EA005;
                       db $D8,$05,$A9,$00,$8D,$EF,$05,$60   ;0EA151|        |      ;
                       db $B9,$58,$9E,$C9,$80,$F0,$23,$38   ;0EA159|        |0E9E58;
                       db $AD,$EF,$05,$ED,$06,$06,$8D,$EF   ;0EA161|        |0E05EF;
                       db $05,$AD,$D8,$05,$ED,$1D,$06,$10   ;0EA169|        |0000AD;
                       db $02,$A9,$00,$8D,$D8,$05,$B9,$58   ;0EA171|        |      ;
                       db $9E,$49,$FF,$18,$69,$01,$8D,$20   ;0EA179|        |0EFF49;
                       db $05,$60,$B9,$59,$9E,$D0,$F2,$CE   ;0EA181|        |000060;
                       db $D8,$05,$F0,$28,$A2,$F8,$A9,$00   ;0EA189|        |      ;
                       db $20,$0B,$84,$D0,$1F,$AD,$1C,$04   ;0EA191|        |0E840B;
                       db $C9,$08,$90,$13,$A9,$08,$AE,$A8   ;0EA199|        |      ;
                       db $04,$F0,$02,$A9,$F7,$A2,$00,$20   ;0EA1A1|        |0000F0;
                       db $0B,$84,$F0,$18,$4C,$12,$87,$A9   ;0EA1A9|        |      ;
                       db $08,$8D,$1C,$04,$A9,$00,$8D,$D8   ;0EA1B1|        |      ;
                       db $05,$A9,$18,$8D,$00,$04,$A9,$30   ;0EA1B9|        |0000A9;
                       db $8D,$65,$05,$60,$A9,$06,$8D,$65   ;0EA1C1|        |0E0565;
                       db $05,$60,$A9,$00,$8D,$C1,$05,$AD   ;0EA1C9|        |000060;
                       db $38,$04,$18,$69,$08,$4C,$E4,$A1   ;0EA1D1|        |      ;
                       db $A9,$01,$8D,$C1,$05,$AD,$38,$04   ;0EA1D9|        |      ;
                       db $38,$E9,$08,$8D,$D8,$05,$20,$3B   ;0EA1E1|        |      ;
                       db $A5,$A9,$3C,$8D,$65,$05,$A0,$00   ;0EA1E9|        |0000A9;
                       db $8C,$93,$05,$C8,$8C,$7C,$05,$60   ;0EA1F1|        |0E0593;
                       db $A9,$00,$8D,$C1,$05,$AD,$38,$04   ;0EA1F9|        |      ;
                       db $18,$69,$08,$4C,$12,$A2,$A9,$01   ;0EA201|        |      ;
                       db $8D,$C1,$05,$AD,$38,$04,$38,$E9   ;0EA209|        |0E05C1;
                       db $08,$8D,$D8,$05,$18,$A9,$01,$6D   ;0EA211|        |      ;
                       db $1C,$04,$8D,$1C,$04,$20,$35,$A5   ;0EA219|        |0E8D04;
                       db $A9,$38,$4C,$EC,$A1,$20,$F2,$BA   ;0EA221|        |      ;
                       db $B0,$01,$60,$A0,$00,$8C,$93,$05   ;0EA229|        |0EA22C;
                       db $C8,$8C,$7C,$05,$A9,$30,$8D,$65   ;0EA231|        |      ;
                       db $05,$60,$A5,$26,$29,$40,$F0,$0A   ;0EA239|        |000060;
                       db $20,$F5,$B9,$90,$05,$A9,$46,$4C   ;0EA241|        |0EB9F5;
                       db $AA,$94,$A5,$26,$29,$80,$F0,$1A   ;0EA249|        |      ;
                       db $A9,$44,$8D,$65,$05,$A9,$08,$8D   ;0EA251|        |      ;
                       db $D8,$05,$A9,$1A,$8D,$00,$04,$A9   ;0EA259|        |      ;
                       db $FE,$8D,$20,$05,$A9,$00,$8D,$37   ;0EA261|        |0E208D;
                       db $05,$60,$AD,$D8,$05,$F0,$04,$CE   ;0EA269|        |000060;
                       db $D8,$05,$60,$AD,$C1,$05,$F0,$44   ;0EA271|        |      ;
                       db $A5,$28,$29,$02,$F0,$21,$A2,$00   ;0EA279|        |000028;
                       db $A9,$F7,$20,$0B,$84,$F0,$32,$A2   ;0EA281|        |      ;
                       db $01,$A9,$F7,$20,$0B,$84,$D0,$03   ;0EA289|        |0000A9;
                       db $4C,$07,$A2,$A2,$FF,$A9,$F7,$20   ;0EA291|        |0EA207;
 
                       db $0B,$84,$D0,$47,$4C,$D9,$A1,$A5   ;0EA299|        |      ;
                       db $28,$29,$08,$F0,$14,$A2,$F8,$A9   ;0EA2A1|        |      ;
                       db $00,$20,$DD,$FC,$F0,$0B,$AD,$A8   ;0EA2A9|        |      ;
                       db $04,$49,$01,$8D,$A8,$04,$4C,$0B   ;0EA2B1|        |000049;
                       db $9F,$4C,$8D,$A0,$A5,$28,$29,$01   ;0EA2B9|        |A08D4C;
                       db $F0,$DD,$A2,$00,$A9,$08,$20,$0B   ;0EA2C1|        |0EA2A0;
                       db $84,$F0,$EE,$A2,$01,$A9,$08,$20   ;0EA2C9|        |0000F0;
                       db $0B,$84,$D0,$03,$4C,$F9,$A1,$A2   ;0EA2D1|        |      ;
                       db $FF,$A9,$08,$20,$0B,$84,$D0,$03   ;0EA2D9|        |2008A9;
                       db $4C,$CB,$A1,$A5,$28,$29,$04,$D0   ;0EA2E1|        |0EA1CB;
 
                       db $07,$A5,$28,$29,$08,$D0,$1F,$60   ;0EA2E9|        |0000A5;
                       db $A9,$0D,$8D,$AA,$05,$A2,$0C,$A9   ;0EA2F1|        |      ;
                       db $00,$20,$0B,$84,$D0,$0D,$A9,$01   ;0EA2F9|        |      ;
                       db $8D,$20,$05                       ;0EA301|        |0E0520;
 
          CODE_0EA304: LDA.B #$00                           ;0EA304|A900    |      ;
                       STA.W $0537                          ;0EA306|8D3705  |0E0537;
                       JSR.W CODE_0E8712                    ;0EA309|201287  |0E8712;
 
         DATA8_0EA30C: db $4C                               ;0EA30C|        |      ;
 
                       dw updateSpriteAnimFrame             ;0EA30D|        |0FEF73;
                       LDA.B #$01                           ;0EA30F|A901    |      ;
                       STA.W $05AA                          ;0EA311|8DAA05  |0E05AA;
                       LDA.W $041C                          ;0EA314|AD1C04  |0E041C;
                       CMP.B #$08                           ;0EA317|C908    |      ;
                       BCS CODE_0EA322                      ;0EA319|B007    |0EA322;
                       LDA.B #$08                           ;0EA31B|A908    |      ;
                       STA.W $041C                          ;0EA31D|8D1C04  |0E041C;
                       BNE DATA8_0EA30C                     ;0EA320|D0EA    |0EA30C;
 
          CODE_0EA322: LDX.B #$F8                           ;0EA322|A2F8    |      ;
                       LDA.B #$00                           ;0EA324|A900    |      ;
                       JSR.W DATA8_0E840B                   ;0EA326|200B84  |0E840B;
                       BNE DATA8_0EA30C                     ;0EA329|D0E1    |0EA30C;
                       LDA.B #$FF                           ;0EA32B|A9FF    |      ;
                       STA.W $0520                          ;0EA32D|8D2005  |0E0520;
                       JMP.W CODE_0EA304                    ;0EA330|4C04A3  |0EA304;
 
                       JSR.W CODE_0EBAF2                    ;0EA333|20F2BA  |0EBAF2;
                       BCS CODE_0EA339                      ;0EA336|B001    |0EA339;
                       RTS                                  ;0EA338|60      |      ;
 
 
          CODE_0EA339: LDA.B #$02                           ;0EA339|A902    |      ;
                       db $20                               ;0EA33B|        |      ;
                       dw clearAllEntitySprite              ;0EA33C|        |0FEF57;
                       LDA.B #$32                           ;0EA33E|A932    |      ;
                       STA.W $0565                          ;0EA340|8D6505  |0E0565;
                       RTS                                  ;0EA343|60      |      ;
 
                       JSR.W grantStartStopClimb            ;0EA344|208DA0  |0EA08D;
                       db $38,$60,$A2,$F8,$A9,$00,$20,$0B   ;0EA347|        |      ;
                       db $84,$F0,$F2,$C9,$05,$F0,$06,$C9   ;0EA34F|        |0000F0;
                       db $07,$F0,$02,$18,$60,$A5,$80,$D0   ;0EA357|        |0000F0;
                       db $FA,$20,$F4,$83,$38,$60,$A5,$26   ;0EA35F|        |      ;
                       db $29,$40,$F0,$0A,$20,$F5,$B9,$90   ;0EA367|        |      ;
                       db $05,$A9,$48,$4C,$AA,$94,$A5,$28   ;0EA36F|        |0000A9;
                       db $29,$08,$D0,$3B                   ;0EA377|        |      ;
                       LDA.B r_Joy1Pe                       ;0EA37B|A528    |000028;
                       LSR A                                ;0EA37D|4A      |      ;
                       BCS CODE_0EA39E                      ;0EA37E|B01E    |0EA39E;
                       LSR A                                ;0EA380|4A      |      ;
                       BCS CODE_0EA386                      ;0EA381|B003    |0EA386;
                       JMP.W grantStartStopClimb            ;0EA383|4C8DA0  |0EA08D;
 
 
          CODE_0EA386: LDX.B #$00                           ;0EA386|A200    |      ;
                       LDA.B #$F4                           ;0EA388|A9F4    |      ;
                       JSR.W DATA8_0E840B                   ;0EA38A|200B84  |0E840B;
                       BNE CODE_0EA392                      ;0EA38D|D003    |0EA392;
                       JMP.W grantStartStopClimb            ;0EA38F|4C8DA0  |0EA08D;
 
 
          CODE_0EA392: LDA.W $0438                          ;0EA392|AD3804  |0E0438;
                       SEC                                  ;0EA395|38      |      ;
                       SBC.B #$04                           ;0EA396|E904    |      ;
                       STA.W $0438                          ;0EA398|8D3804  |0E0438;
                       JMP.W CODE_0E9E0B                    ;0EA39B|4C0B9E  |0E9E0B;
 
 
          CODE_0EA39E: LDX.B #$00                           ;0EA39E|A200    |      ;
                       LDA.B #$0C                           ;0EA3A0|A90C    |      ;
                       db $20,$0B,$84,$D0,$03,$4C,$8D,$A0   ;0EA3A2|        |0E840B;
                       db $AD,$38,$04,$18,$69,$04,$8D,$38   ;0EA3AA|        |0E0438;
                       db $04,$4C,$1B,$9E,$20,$49,$A3,$B0   ;0EA3B2|        |00004C;
                       db $3B,$A2,$F8,$A9,$FF,$20,$0B,$84   ;0EA3BA|        |      ;
                       db $F0,$0C,$A2,$F8,$A9,$01,$20,$0B   ;0EA3C2|        |0EA3D0;
                       db $84,$F0,$07,$4C,$E9,$A3,$A9,$01   ;0EA3CA|        |0000F0;
                       db $D0,$02,$A9,$00,$8D,$C1,$05,$20   ;0EA3D2|        |0EA3D6;
                       db $4A,$A5,$AD,$1C,$04,$38,$E9,$08   ;0EA3DA|        |      ;
                       db $85,$D3,$A9,$34,$4C,$EC,$A1,$A5   ;0EA3E2|        |0000D3;
                       db $28,$4A,$B0,$09,$4A,$B0,$1A,$A9   ;0EA3EA|        |      ;
                       db $1E,$8D,$00,$04,$60,$A9,$00,$8D   ;0EA3F2|        |0E008D;
                       db $A8,$04,$A2,$00,$A9,$0C,$20,$0B   ;0EA3FA|        |      ;
                       db $84,$D0,$14                       ;0EA402|        |0000D0;
                       LDA.B #$01                           ;0EA405|A901    |      ; grantClimb Speed Right
                       LDY.B #$40                           ;0EA407|A040    |      ;
                       BNE CODE_0EA422                      ;0EA409|D017    |0EA422;
                       LDA.B #$01                           ;0EA40B|A901    |      ;
                       STA.W $04A8                          ;0EA40D|8DA804  |0E04A8;
                       LDX.B #$00                           ;0EA410|A200    |      ;
                       LDA.B #$F4                           ;0EA412|A9F4    |      ;
                       JSR.W DATA8_0E840B                   ;0EA414|200B84  |0E840B;
                       BEQ CODE_0EA41E                      ;0EA417|F005    |0EA41E;
                       LDA.B #$00                           ;0EA419|A900    |      ;
                       TAY                                  ;0EA41B|A8      |      ;
                       BEQ CODE_0EA422                      ;0EA41C|F004    |0EA422;
 
          CODE_0EA41E: LDA.B #$FE                           ;0EA41E|A9FE    |      ; grant climb Spee Left
                       LDY.B #$C0                           ;0EA420|A0C0    |      ;
 
          CODE_0EA422: STA.W $04F2                          ;0EA422|8DF204  |0E04F2;
                       STY.W $0509                          ;0EA425|8C0905  |0E0509;
                       db $20                               ;0EA428|        |      ;
                       dw updateSpriteAnimFrame             ;0EA429|        |0FEF73;
                       JMP.W CODE_0E873A                    ;0EA42B|4C3A87  |0E873A;
 
                       LDY.B #$00                           ;0EA42E|A000    |      ;
                       JSR.W CODE_0EA4CC                    ;0EA430|20CCA4  |0EA4CC;
                       BCS CODE_0EA436                      ;0EA433|B001    |0EA436;
                       RTS                                  ;0EA435|60      |      ;
 
 
          CODE_0EA436: LDA.B #$36                           ;0EA436|A936    |      ;
                       STA.W $0565                          ;0EA438|8D6505  |0E0565;
                       LDA.B #$08                           ;0EA43B|A908    |      ;
                       STA.W $057C                          ;0EA43D|8D7C05  |0E057C;
                       RTS                                  ;0EA440|60      |      ;
 
                       DEC.W $057C                          ;0EA441|CE7C05  |0E057C;
                       BEQ CODE_0EA447                      ;0EA444|F001    |0EA447;
                       RTS                                  ;0EA446|60      |      ;
 
 
          CODE_0EA447: LDA.W $05C1                          ;0EA447|ADC105  |0E05C1;
                       BEQ CODE_0EA452                      ;0EA44A|F006    |0EA452;
                       JSR.W CODE_0E9E1B                    ;0EA44C|201B9E  |0E9E1B;
                       JMP.W CODE_0EA455                    ;0EA44F|4C55A4  |0EA455;
 
 
          CODE_0EA452: JSR.W CODE_0E9E0B                    ;0EA452|200B9E  |0E9E0B;
 
          CODE_0EA455: LDY.B #$00                           ;0EA455|A000    |      ;
                       STY.W $0593                          ;0EA457|8C9305  |0E0593;
                       INY                                  ;0EA45A|C8      |      ;
                       STY.W $057C                          ;0EA45B|8C7C05  |0E057C;
                       LDA.B #$00                           ;0EA45E|A900    |      ;
                       STA.W $05D8                          ;0EA460|8DD805  |0E05D8;
                       RTS                                  ;0EA463|60      |      ;
 
                       LDY.B #$02                           ;0EA464|A002    |      ;
                       JSR.W CODE_0EA4CC                    ;0EA466|20CCA4  |0EA4CC;
                       BCS CODE_0EA46C                      ;0EA469|B001    |0EA46C;
                       RTS                                  ;0EA46B|60      |      ;
 
 
          CODE_0EA46C: LDA.B #$3A                           ;0EA46C|A93A    |      ;
                       STA.W $0565                          ;0EA46E|8D6505  |0E0565;
                       LDA.B #$10                           ;0EA471|A910    |      ;
                       STA.W $057C                          ;0EA473|8D7C05  |0E057C;
                       RTS                                  ;0EA476|60      |      ;
 
                       DEC.W $057C                          ;0EA477|CE7C05  |0E057C;
                       BEQ CODE_0EA47D                      ;0EA47A|F001    |0EA47D;
                       RTS                                  ;0EA47C|60      |      ;
 
 
          CODE_0EA47D: JMP.W CODE_0E9F0B                    ;0EA47D|4C0B9F  |0E9F0B;
 
                       db $A0,$04,$20,$CC,$A4,$B0,$01,$60   ;0EA480|        |      ;
                       db $A9,$3E,$8D,$65,$05,$A9,$08,$8D   ;0EA488|        |      ;
                       db $7C,$05,$60,$CE,$7C,$05,$F0,$01   ;0EA490|        |0E6005;
                       db $60,$A9,$02,$8D,$65,$05,$60,$A0   ;0EA498|        |      ;
 
                       db $06,$20,$CC,$A4,$B0,$01,$60,$A9   ;0EA4A0|        |000020;
                       db $42,$8D,$65,$05,$A9,$08,$8D,$7C   ;0EA4A8|        |      ;
                       db $05,$60,$CE,$7C,$05,$F0,$01,$60   ;0EA4B0|        |000060;
                       db $AD,$C1,$05,$F0,$06,$20,$17,$9E   ;0EA4B8|        |0E05C1;
                       db $4C,$C6,$A4,$20,$07,$9E,$A9,$00   ;0EA4C0|        |0EA4C6;
 
                       db $8D,$D8,$05,$60                   ;0EA4C8|        |0E05D8;
 
          CODE_0EA4CC: DEC.W $057C                          ;0EA4CC|CE7C05  |0E057C;
                       BEQ UNREACH_0EA4D5                   ;0EA4CF|F004    |0EA4D5;
                       CLC                                  ;0EA4D1|18      |      ;
                       RTS                                  ;0EA4D2|60      |      ;
 
                       db $38,$60                           ;0EA4D3|        |      ;
 
       UNREACH_0EA4D5: db $B9,$74,$A5,$85,$08,$B9,$75,$A5   ;0EA4D5|        |0EA574;
                       db $85,$09,$AD,$93,$05,$0A,$0A,$18   ;0EA4DD|        |000009;
                       db $6D,$93,$05,$A8,$B1,$08,$C9,$FF   ;0EA4E5|        |0E0593;
                       db $F0,$E4,$8D,$00,$04,$C8,$AD,$C1   ;0EA4ED|        |0EA4D3;
                       db $05,$F0,$09,$AD,$D8,$05,$38,$F1   ;0EA4F5|        |0000F0;
                       db $08,$4C,$07,$A5,$AD,$D8,$05,$18   ;0EA4FD|        |      ;
                       db $71,$08,$8D,$38,$04,$C8,$B1,$08   ;0EA505|        |000008;
                       db $18,$65,$D3,$8D,$1C,$04,$C8,$B1   ;0EA50D|        |      ;
                       db $08,$8D,$7C,$05,$C8,$B1,$08,$4D   ;0EA515|        |      ;
                       db $C1,$05,$8D,$A8,$04,$EE,$93,$05   ;0EA51D|        |000005;
                       db $18,$60,$AD,$C1,$05,$F0,$2C,$A9   ;0EA525|        |      ;
                       db $07,$18,$6D,$38,$04,$4C,$5E,$A5   ;0EA52D|        |000018;
                       db $20,$02,$8A,$85,$D3,$60,$AD,$1C   ;0EA535|        |0E8A02;
                       db $04,$18,$69,$01,$8D,$1C,$04,$20   ;0EA53D|        |000018;
                       db $02,$8A,$85,$D3,$60,$AD,$C1,$05   ;0EA545|        |      ;
                       db $F0,$09,$A9,$02,$18,$6D,$38,$04   ;0EA54D|        |0EA558;
                       db $4C,$5E,$A5,$18,$A9,$01,$6D,$38   ;0EA555|        |0EA55E;
 
                       db $04,$A4,$68,$30,$0C,$18,$65,$56   ;0EA55D|        |0000A4;
                       db $29,$F8,$38,$E5,$56,$8D,$D8,$05   ;0EA565|        |      ;
                       db $60,$29,$F8,$8D,$D8,$05,$60,$7C   ;0EA56D|        |      ;
 
                       db $A5,$87,$A5,$92,$A5,$9D,$A5,$3C   ;0EA575|        |000087;
                       db $00,$00,$08,$00,$18,$08,$F8,$01   ;0EA57D|        |      ;
                       db $01,$FF,$42,$00,$00,$08,$00,$1E   ;0EA585|        |0000FF;
                       db $08,$04,$01,$00,$FF,$40,$00,$00   ;0EA58D|        |      ;
                       db $08,$00,$0E,$00,$F4,$01,$00,$FF   ;0EA595|        |      ;
                       db $3E,$00,$00,$08,$00,$36,$08,$08   ;0EA59D|        |0E0000;
                       db $01,$01,$FF                       ;0EA5A5|        |000001;
 
          CODE_0EA5A8: JSR.W CODE_0EA6A7                    ;0EA5A8|20A7A6  |0EA6A7;
                       JSR.W CODE_0EA64F                    ;0EA5AB|204FA6  |0EA64F;
                       LDY.W $0565                          ;0EA5AE|AC6505  |0E0565;
                       db $20                               ;0EA5B1|        |      ;
                       dw CODE_0FE886                       ;0EA5B2|        |0FE886;
                       dw playerState00_init                ;0EA5B4|        |0E8AC5;
                       dw UNREACH_0E9538                    ;0EA5B6|        |0E9538;
                       dw UNREACH_0E9660                    ;0EA5B8|        |0E9660;
                       dw UNREACH_0E961D                    ;0EA5BA|        |0E961D;
                       dw UNREACH_0E9770                    ;0EA5BC|        |0E9770;
                       dw UNREACH_0E9919                    ;0EA5BE|        |0E9919;
                       dw UNREACH_0E9770                    ;0EA5C0|        |0E9770;
                       dw UNREACH_0E9953                    ;0EA5C2|        |0E9953;
                       dw UNREACH_0E9967                    ;0EA5C4|        |0E9967;
                       dw UNREACH_0E998E                    ;0EA5C6|        |0E998E;
                       dw UNREACH_0E9A93                    ;0EA5C8|        |0E9A93;
                       dw UNREACH_0E9942                    ;0EA5CA|        |0E9942;
                       db $F8,$A5,$F8,$A5,$F9,$A5,$F8,$A5   ;0EA5CC|        |      ;
                       db $B8,$94,$D4,$94,$FF,$94,$1C,$83   ;0EA5D4|        |      ;
                       db $B1,$93,$B1,$93,$57,$8B,$DE,$8A   ;0EA5DC|        |000093;
                       db $BB,$A6,$D3,$A6,$56,$A8,$8F,$AC   ;0EA5E4|        |      ;
                       db $C7,$AC,$07,$AD,$26,$A7,$37,$A7   ;0EA5EC|        |0000AC;
                       db $ED,$A7,$8B,$A7,$60,$20,$21,$84   ;0EA5F4|        |0E8BA7;
                       db $B0,$03,$4C,$3A,$97,$20,$8E,$91   ;0EA5FC|        |0EA601;
                       db $20,$36,$99,$AD,$65,$05,$C9,$02   ;0EA604|        |0E9936;
                       db $D0,$08,$A9,$20,$8D,$65,$05,$4C   ;0EA60C|        |0EA616;
                       db $B8,$94,$20,$F2,$BA,$B0,$01,$60   ;0EA614|        |      ;
                       db $A9,$0A,$8D,$65,$05,$A9,$0E,$8D   ;0EA61C|        |      ;
                       db $00,$04,$60,$A9,$05,$A2,$F0,$20   ;0EA624|        |      ;
                       db $0B,$84,$F0,$1D,$A9,$05,$A2,$10   ;0EA62C|        |      ;
                       db $20,$0B,$84,$F0,$14,$A9,$FB,$A2   ;0EA634|        |0E840B;
                       db $F0,$20,$0B,$84,$F0,$0B,$A9,$FB   ;0EA63C|        |0EA65E;
                       db $A2,$10,$20,$0B,$84,$F0,$02,$38   ;0EA644|        |      ;
                       db $60,$18,$60                       ;0EA64C|        |      ;
 
 
          CODE_0EA64F: LDA.B r_HUD_healthPlayer             ;0EA64F|A53C    |00003C;
                       BEQ CODE_0EA674                      ;0EA651|F021    |0EA674;
                       LDA.B r_hearts                       ;0EA653|A584    |000084;
                       BEQ CODE_0EA674                      ;0EA655|F01D    |0EA674;
                       LDA.B r_curJoyPe1                    ;0EA657|A526    |000026;
                       AND.B #$80                           ;0EA659|2980    |      ;
                       BEQ CODE_0EA674                      ;0EA65B|F017    |0EA674;
                       LDA.B r_Joy1Pe                       ;0EA65D|A528    |000028;
                       AND.B #$04                           ;0EA65F|2904    |      ;
                       BEQ CODE_0EA674                      ;0EA661|F011    |0EA674;
                       LDY.B #$00                           ;0EA663|A000    |      ;
 
          CODE_0EA665: LDA.W UNREACH_0EA697,Y               ;0EA665|B997A6  |0EA697;
                       CMP.B #$FF                           ;0EA668|C9FF    |      ;
                       BEQ UNREACH_0EA675                   ;0EA66A|F009    |0EA675;
                       CMP.W $0565                          ;0EA66C|CD6505  |0E0565;
                       BEQ CODE_0EA674                      ;0EA66F|F003    |0EA674;
                       INY                                  ;0EA671|C8      |      ;
                       BNE CODE_0EA665                      ;0EA672|D0F1    |0EA665;
 
          CODE_0EA674: RTS                                  ;0EA674|60      |      ;
 
 
       UNREACH_0EA675: db $A0,$00,$B9,$A2,$A6,$C9,$FF,$F0   ;0EA675|        |      ;
                       db $13,$CD,$65,$05,$F0,$03,$C8,$D0   ;0EA67D|        |0000CD;
                       db $F1,$20,$27,$A6,$B0,$E9,$A9,$3C   ;0EA685|        |000020;
                       db $8D,$65,$05,$60,$A9,$30,$8D,$65   ;0EA68D|        |0E0565;
                       db $05,$60                           ;0EA695|        |000060;
 
       UNREACH_0EA697: db $00,$16,$30,$32,$3C,$3E,$28,$2A   ;0EA697|        |      ;
                       db $2C,$2E,$FF                       ;0EA69F|        |0EFF2E;
 
       UNREACH_0EA6A2: db $34,$36,$38,$3A,$FF               ;0EA6A2|        |000036;
 
          CODE_0EA6A7: LDY.B #$00                           ;0EA6A7|A000    |      ;
 
          CODE_0EA6A9: LDA.W UNREACH_0EA6A2,Y               ;0EA6A9|B9A2A6  |0EA6A2;
                       BMI CODE_0EA6BA                      ;0EA6AC|300C    |0EA6BA;
                       CMP.W $0565                          ;0EA6AE|CD6505  |0E0565;
                       BEQ CODE_0EA6B6                      ;0EA6B1|F003    |0EA6B6;
                       INY                                  ;0EA6B3|C8      |      ;
                       BNE CODE_0EA6A9                      ;0EA6B4|D0F3    |0EA6A9;
 
          CODE_0EA6B6: LDA.B #$08                           ;0EA6B6|A908    |      ;
                       STA.B r_currPartnerID                ;0EA6B8|8582    |000082;
 
          CODE_0EA6BA: RTS                                  ;0EA6BA|60      |      ;
 
                       db $A9,$2F,$20,$5F,$E2,$A9,$05,$20   ;0EA6BB|        |      ;
                       db $57,$EF,$A9,$01,$8D,$C1,$05,$85   ;0EA6C3|        |0000EF;
                       db $AE,$EE,$65,$05,$EE,$65,$05,$60   ;0EA6CB|        |0E65EE;
                       db $AD,$C1,$05,$F0,$06,$CE,$C1,$05   ;0EA6D3|        |0E05C1;
                       db $4C,$EA,$A6,$AD,$93,$05,$D0,$07   ;0EA6DB|        |0EA6EA;
 
                       db $AD,$7C,$05,$C9,$01,$F0,$03,$4C   ;0EA6E3|        |0E057C;
                       db $73,$EF,$A9,$03,$20,$57,$EF,$20   ;0EA6EB|        |0000EF;
                       db $0A,$A7,$A9,$00,$8D,$37,$05,$8D   ;0EA6F3|        |      ;
                       db $20,$05,$8D,$F2,$04,$8D,$09,$05   ;0EA6FB|        |0E8D05;
                       db $EE,$65,$05,$EE,$65,$05,$60,$A9   ;0EA703|        |0E0565;
                       db $00,$AA,$20,$0B,$84,$D0,$01,$60   ;0EA70B|        |      ;
                       db $A9,$00,$A2,$08,$20,$0B,$84,$D0   ;0EA713|        |      ;
                       db $F6,$AD,$1C,$04,$18,$69,$08,$8D   ;0EA71B|        |0000AD;
                       db $1C,$04,$60,$A9,$06,$20,$57,$EF   ;0EA723|        |0E6004;
                       db $A9,$01,$8D,$C1,$05,$EE,$65,$05   ;0EA72B|        |      ;
                       db $EE,$65,$05,$60,$AD,$C1,$05,$F0   ;0EA733|        |0E0565;
                       db $06,$CE,$C1,$05,$4C,$4E,$A7,$AD   ;0EA73B|        |0000CE;
                       db $93,$05,$D0,$07,$AD,$7C,$05,$C9   ;0EA743|        |000005;
                       db $01,$F0,$03,$4C,$73,$EF,$A9,$05   ;0EA74B|        |0000F0;
                       db $A2,$10,$20,$DD,$FC,$D0,$12,$A9   ;0EA753|        |      ;
                       db $FB,$A2,$10,$20,$DD,$FC,$D0,$09   ;0EA75B|        |      ;
                       db $20,$3A,$97,$A9,$0E,$8D,$00,$04   ;0EA763|        |0E973A;
                       db $60,$20,$02,$8A,$4C,$63,$A7,$8D   ;0EA76B|        |      ;
 
                       db $AA,$05,$60,$A9,$FC,$8D,$20,$05   ;0EA773|        |      ;
                       db $A9,$00,$8D,$37,$05,$A9,$15,$8D   ;0EA77B|        |      ;
                       db $C1,$05,$A9,$3A,$8D,$65,$05,$60   ;0EA783|        |000005;
                       db $A5,$28,$29,$08,$D0,$1A,$A5,$28   ;0EA78B|        |000028;
                       db $F0,$33,$A2,$06,$A9,$00,$20,$DD   ;0EA793|        |0EA7C8;
                       db $FC,$D0,$2A,$A9,$40,$8D,$37,$05   ;0EA79B|        |0E2AD0;
                       db $A9,$00,$8D,$20,$05,$4C,$B5,$A7   ;0EA7A3|        |      ;
                       db $A9,$C0,$8D,$37,$05,$A9,$FF,$8D   ;0EA7AB|        |      ;
                       db $20,$05,$18,$AD,$DB,$04,$6D,$37   ;0EA7B3|        |0E1805;
                       db $05,$8D,$DB,$04,$AD,$1C,$04,$6D   ;0EA7BB|        |00008D;
                       db $20,$05,$8D,$1C,$04,$A2,$10,$A9   ;0EA7C3|        |0E8D05;
                       db $00,$20,$DD,$FC,$C9,$02,$F0,$0A   ;0EA7CB|        |      ;
                       db $C9,$03,$D0,$53,$A9,$FE,$A0,$80   ;0EA7D3|        |      ;
                       db $D0,$04,$A9,$01,$A0,$80,$8D,$F2   ;0EA7DB|        |0EA7E1;
                       db $04,$8C,$09,$05,$20,$73,$EF,$4C   ;0EA7E3|        |00008C;
                       db $3A,$87,$A2,$10,$A9,$00,$20,$DD   ;0EA7EB|        |      ;
                       db $FC,$C9,$02,$F0,$0A,$C9,$03,$D0   ;0EA7F3|        |0E02C9;
                       db $2E,$A9,$FE,$A0,$80,$D0,$04,$A9   ;0EA7FB|        |0EFEA9;
                       db $01,$A0,$80,$8D,$F2,$04,$8C,$09   ;0EA803|        |0000A0;
                       db $05,$AD,$1C,$04,$18,$69,$01,$8D   ;0EA80B|        |0000AD;
                       db $1C,$04,$A2,$06,$A9,$00,$20,$DD   ;0EA813|        |0EA204;
                       db $FC,$D0,$03,$4C,$3A,$87,$EE,$65   ;0EA81B|        |0E03D0;
                       db $05,$EE,$65,$05,$4C,$3A,$87,$A9   ;0EA823|        |0000EE;
                       db $34,$8D,$65,$05,$60,$A9,$40,$8D   ;0EA82B|        |00008D;
                       db $65,$05,$60,$A5,$84,$F0,$0F,$C6   ;0EA833|        |000005;
                       db $AE,$D0,$09,$A9,$3C,$85,$AE,$A9   ;0EA83B|        |0E09D0;
                       db $01,$20,$53,$E7,$18,$60,$20,$27   ;0EA843|        |000020;
                       db $A6,$B0,$F9,$38,$60,$A9,$3C,$8D   ;0EA84B|        |0000B0;
                       db $65,$05,$60,$20,$36,$A8,$B0,$F5   ;0EA853|        |000005;
                       db $A2,$10,$A9,$00,$20,$DD,$FC,$C9   ;0EA85B|        |      ;
                       db $02,$F0,$CA,$C9,$03,$F0,$C6,$AD   ;0EA863|        |      ;
                       db $F2,$04,$0D,$09,$05,$F0,$0E,$AD   ;0EA86B|        |000004;
                       db $F2,$04,$10,$04,$A0,$01,$D0,$02   ;0EA873|        |000004;
                       db $A0,$00,$8C,$A8,$04,$A5,$26,$29   ;0EA87B|        |      ;
                       db $80,$F0,$03,$4C,$76,$A7,$A5,$28   ;0EA883|        |0EA875;
                       db $4A,$B0,$47,$4A,$B0,$6B,$AD,$F2   ;0EA88B|        |      ;
                       db $04,$30,$21,$AD,$09,$05,$38,$ED   ;0EA893|        |000030;
                       db $F9,$A9,$8D,$09,$05,$AD,$F2,$04   ;0EA89B|        |0E8DA9;
                       db $E9,$00,$8D,$F2,$04,$90,$03,$4C   ;0EA8A3|        |      ;
                       db $29,$A9,$A9,$00,$8D,$F2,$04,$8D   ;0EA8AB|        |      ;
                       db $09,$05,$F0,$72,$AD,$09,$05,$18   ;0EA8B3|        |      ;
                       db $6D,$F9,$A9,$8D,$09,$05,$AD,$F2   ;0EA8BB|        |0EA9F9;
                       db $04,$69,$00,$8D,$F2,$04,$90,$5E   ;0EA8C3|        |000069;
                       db $A9,$00,$8D,$F2,$04,$8D,$09,$05   ;0EA8CB|        |      ;
                       db $F0,$54,$AD,$09,$05,$18,$6D,$FB   ;0EA8D3|        |0EA929;
                       db $A9,$8D,$09,$05,$AD,$F2,$04,$69   ;0EA8DB|        |      ;
                       db $00,$8D,$F2,$04,$30,$40,$CD,$FD   ;0EA8E3|        |      ;
                       db $A9,$D0,$3B,$AD,$FE,$A9,$CD,$09   ;0EA8EB|        |      ;
                       db $05,$B0,$33,$8D,$09,$05,$4C,$29   ;0EA8F3|        |0000B0;
                       db $A9,$AD,$09,$05,$38,$ED,$FB,$A9   ;0EA8FB|        |      ;
                       db $8D,$09,$05,$AD,$F2,$04,$E9,$00   ;0EA903|        |0E0509;
                       db $8D,$F2,$04,$10,$19,$AD,$01,$AA   ;0EA90B|        |0E04F2;
                       db $CD,$F2,$04,$90,$11,$AD,$02,$AA   ;0EA913|        |0E04F2;
                       db $CD,$09,$05,$90,$09,$8D,$09,$05   ;0EA91B|        |0E0509;
                       db $AD,$01,$AA,$8D,$F2,$04,$A5,$28   ;0EA923|        |0EAA01;
                       db $29,$04,$F0,$03,$4C,$B7,$A9,$A5   ;0EA92B|        |      ;
                       db $28,$29,$08,$D0,$45,$AD,$20,$05   ;0EA933|        |      ;
                       db $30,$22,$AD,$37,$05,$38,$ED,$FA   ;0EA93B|        |0EA95F;
                       db $A9,$8D,$37,$05,$AD,$20,$05,$E9   ;0EA943|        |      ;
                       db $00,$8D,$20,$05,$90,$03,$4C,$DB   ;0EA94B|        |      ;
                       db $A9,$A9,$00,$8D,$20,$05,$8D,$37   ;0EA953|        |      ;
                       db $05,$4C,$DB,$A9,$AD,$37,$05,$18   ;0EA95B|        |00004C;
                       db $6D,$FA,$A9,$8D,$37,$05,$AD,$20   ;0EA963|        |0EA9FA;
                       db $05,$69,$00,$8D,$20,$05,$90,$68   ;0EA96B|        |000069;
                       db $A9,$00,$8D,$20,$05,$8D,$37,$05   ;0EA973|        |      ;
                       db $F0,$5E,$AD,$37,$05,$38,$ED,$FC   ;0EA97B|        |0EA9DB;
                       db $A9,$8D,$37,$05,$AD,$20,$05,$E9   ;0EA983|        |      ;
                       db $00,$8D,$20,$05,$10,$4A,$AD,$03   ;0EA98B|        |      ;
                       db $AA,$CD,$20,$05,$90,$42,$F0,$02   ;0EA993|        |      ;
                       db $B0,$14,$AD,$04,$AA,$CD,$37,$05   ;0EA99B|        |0EA9B1;
                       db $90,$36,$8D,$37,$05,$AD,$03,$AA   ;0EA9A3|        |0EA9DB;
                       db $8D,$20,$05,$4C,$DB,$A9,$AD,$04   ;0EA9AB|        |0E0520;
                       db $AA,$4C,$A5,$A9,$AD,$37,$05,$18   ;0EA9B3|        |      ;
                       db $6D,$FC,$A9,$8D,$37,$05,$AD,$20   ;0EA9BB|        |0EA9FC;
                       db $05,$69,$00,$8D,$20,$05,$30,$10   ;0EA9C3|        |000069;
                       db $CD,$FF,$A9,$D0,$0B,$AD,$00,$AA   ;0EA9CB|        |0EA9FF;
                       db $CD,$37,$05,$B0,$03,$8D,$37,$05   ;0EA9D3|        |0E0537;
                       db $A5,$28,$29,$0F,$F0,$04,$A9,$04   ;0EA9DB|        |000028;
                       db $D0,$02,$A9,$03,$20,$72,$A7,$20   ;0EA9E3|        |0EA9E7;
                       db $05,$AA,$20,$26,$AB,$20,$73,$EF   ;0EA9EB|        |0000AA;
                       db $20,$3A,$87,$4C,$12,$87,$08,$08   ;0EA9F3|        |0E873A;
                       db $10,$10,$01,$40,$01,$00,$FE,$C0   ;0EA9FB|        |0EAA0D;
                       db $FF,$00,$AD,$65,$05,$C9,$36,$F0   ;0EAA03|        |65AD00;
                       db $4A,$AD,$F2,$04,$30,$1E,$0D,$09   ;0EAA0B|        |      ;
                       db $05,$F0,$40,$A5,$7D,$C9,$60,$F0   ;0EAA13|        |0000F0;
                       db $68,$A2,$FA,$A9,$08,$20,$DD,$FC   ;0EAA1B|        |      ;
                       db $D0,$23,$A2,$06,$A9,$08,$20,$DD   ;0EAA23|        |0EAA48;
                       db $FC,$D0,$1A,$60,$A5,$7D,$C9,$60   ;0EAA2B|        |0E1AD0;
                       db $F0,$22,$A2,$FA,$A9,$F8,$20,$DD   ;0EAA33|        |0EAA57;
                       db $FC,$D0,$0E,$A2,$06,$A9,$F8,$20   ;0EAA3B|        |0E0ED0;
                       db $DD,$FC,$D0,$05,$60,$A9,$01,$D0   ;0EAA43|        |0ED0FC;
                       db $02,$A9,$00,$8D,$D8,$05,$A9,$36   ;0EAA4B|        |      ;
                       db $8D,$65,$05,$60,$AD,$1C,$04,$C9   ;0EAA53|        |0E0565;
                       db $B0,$90,$D7,$20,$DD,$AA,$A5,$0A   ;0EAA5B|        |0EA9ED;
                       db $38,$E9,$3E,$85,$0C,$A5,$0B,$E9   ;0EAA63|        |      ;
                       db $01,$30,$0A,$D0,$C5,$A5,$0C,$C9   ;0EAA6B|        |000030;
                       db $04,$B0,$BF,$90,$D4,$C9,$FF,$D0   ;0EAA73|        |0000B0;
                       db $B9,$A5,$0C,$C9,$FC,$B0,$CA,$90   ;0EAA7B|        |0E0CA5;
                       db $B1,$AD,$1C,$04,$C9,$B0,$90,$91   ;0EAA83|        |0000AD;
                       db $20,$DD,$AA,$A5,$0A,$38,$E9,$20   ;0EAA8B|        |0EAADD;
                       db $85,$0C,$A5,$0B,$E9,$01,$30,$0A   ;0EAA93|        |00000C;
                       db $D0,$12,$A5,$0C,$C9,$04,$B0,$0C   ;0EAA9B|        |0EAAAF;
                       db $90,$A3,$C9,$FF,$D0,$8C,$A5,$0C   ;0EAAA3|        |0EAA48;
                       db $C9,$FC,$B0,$99,$A5,$0A,$38,$E9   ;0EAAAB|        |      ;
                       db $C0,$85,$0C,$A5,$0B,$E9,$02,$30   ;0EAAB3|        |      ;
                       db $0E,$F0,$03,$4C,$1C,$AA,$A5,$0C   ;0EAABB|        |0E03F0;
                       db $C9,$04,$90,$81,$4C,$1C,$AA,$C9   ;0EAAC3|        |      ;
                       db $FF,$F0,$03,$4C,$35,$AA,$A5,$0C   ;0EAACB|        |4C03F0;
                       db $C9,$FC,$90,$03,$4C,$48,$AA,$4C   ;0EAAD3|        |      ;
                       db $1C,$AA,$AD,$38,$04,$18,$65,$56   ;0EAADB|        |0EADAA;
                       db $85,$0A,$A5,$57,$69,$00,$85,$0B   ;0EAAE3|        |00000A;
                       db $60,$A5,$8B,$29,$0F,$C9,$01,$F0   ;0EAAEB|        |      ;
 
                       db $07,$C9,$0C,$F0,$03,$A9,$80,$60   ;0EAAF3|        |0000C9;
                       db $A6,$91,$BD,$4E,$05,$C9,$7D,$F0   ;0EAAFB|        |000091;
                       db $04,$C9,$82,$D0,$F0,$BD,$1C,$04   ;0EAB03|        |0000C9;
                       db $38,$ED,$1C,$04,$60,$20,$98,$83   ;0EAB0B|        |      ;
                       db $18,$60,$20,$DD,$FC,$F0,$0A,$C9   ;0EAB13|        |      ;
                       db $05,$F0,$F2,$C9,$07,$F0,$EE,$38   ;0EAB1B|        |0000F0;
                       db $60,$18,$60,$AD,$65,$05,$C9,$36   ;0EAB23|        |      ;
 
                       db $F0,$72,$AD,$20,$05,$30,$30,$0D   ;0EAB2B|        |0EAB9F;
                       db $37,$05,$F0,$68,$A5,$7D,$29,$F0   ;0EAB33|        |000005;
                       db $C9,$50,$F0,$79,$C9,$60,$D0,$03   ;0EAB3B|        |      ;
                       db $4C,$CB,$AB,$20,$EC,$AA,$C9,$80   ;0EAB43|        |0EABCB;
 
                       db $F0,$02,$90,$51,$A2,$06,$A9,$FA   ;0EAB4B|        |0EAB4F;
                       db $20,$15,$AB,$B0,$48,$A2,$06,$A9   ;0EAB53|        |0EAB15;
                       db $06,$20,$15,$AB,$B0,$3F,$60,$AD   ;0EAB5B|        |000020;
                       db $1C,$04,$C9,$40,$90,$1B,$20,$EC   ;0EAB63|        |0EC904;
                       db $AA,$C9,$80,$F0,$02,$B0,$12,$A2   ;0EAB6B|        |      ;
                       db $FA,$A9,$FA,$20,$15,$AB,$B0,$09   ;0EAB73|        |      ;
                       db $A2,$FA,$A9,$06,$20,$15,$AB,$90   ;0EAB7B|        |      ;
                       db $1B,$20,$02,$8A,$18,$69,$06,$8D   ;0EAB83|        |      ;
                       db $1C,$04,$A9,$02,$8D,$D8,$05,$A9   ;0EAB8B|        |0EA904;
                       db $00,$8D,$37,$05,$8D,$20,$05,$A9   ;0EAB93|        |      ;
                       db $36,$8D,$65,$05,$60,$AD,$65,$05   ;0EAB9B|        |00008D;
                       db $C9,$2E,$F0,$F8,$20,$02,$8A,$AD   ;0EABA3|        |      ;
                       db $1C,$04,$18,$69,$02,$8D,$1C,$04   ;0EABAB|        |0E1804;
                       db $A9,$03,$4C,$8F,$AB,$A5,$7D,$29   ;0EABB3|        |      ;
                       db $0F,$A8,$AD,$1C,$04,$D9,$0D,$AC   ;0EABBB|        |1CADA8;
                       db $90,$81,$20,$58,$8C,$4C,$A0,$AB   ;0EABC3|        |0EAB46;
                       db $A5,$7D,$29,$0F,$F0,$03,$4C,$46   ;0EABCB|        |00007D;
                       db $AB,$AD,$1C,$04,$C9,$BC,$B0,$03   ;0EABD3|        |      ;
                       db $4C,$46,$AB,$AD,$38,$04,$18,$65   ;0EABDB|        |0EAB46;
 
                       db $56,$85,$0A,$A5,$57,$69,$00,$85   ;0EABE3|        |000085;
                       db $0B,$C9,$01,$90,$D5,$D0,$09,$A5   ;0EABEB|        |      ;
                       db $0A,$C9,$20,$90,$CD,$4C,$46,$AB   ;0EABF3|        |      ;
                       db $C9,$02,$B0,$03,$4C,$46,$AB,$D0   ;0EABFB|        |      ;
                       db $C1,$A5,$0A,$C9,$C0,$B0,$BB,$4C   ;0EAC03|        |0000A5;
                       db $46,$AB,$9C,$BC,$BC,$BC,$AD,$F2   ;0EAC0B|        |0000AB;
                       db $04,$30,$13,$A2,$FA,$A9,$08,$20   ;0EAC13|        |000030;
                       db $DD,$FC,$D0,$1C,$A2,$06,$A9,$08   ;0EAC1B|        |0ED0FC;
                       db $20,$DD,$FC,$D0,$13,$60,$A2,$FA   ;0EAC23|        |0EFCDD;
                       db $A9,$F8,$20,$DD,$FC,$D0,$09,$A2   ;0EAC2B|        |      ;
                       db $06,$A9,$F8,$20,$DD,$FC,$F0,$08   ;0EAC33|        |0000A9;
                       db $A9,$00,$8D,$09,$05,$8D,$F2,$04   ;0EAC3B|        |      ;
                       db $60,$AD,$20,$05,$30,$13,$A2,$06   ;0EAC43|        |      ;
 
                       db $A9,$FA,$20,$DD,$FC,$D0,$2E,$A2   ;0EAC4B|        |      ;
                       db $06,$A9,$06,$20,$DD,$FC,$D0,$25   ;0EAC53|        |0000A9;
                       db $60,$A2,$FA,$A9,$FA,$20,$DD,$FC   ;0EAC5B|        |      ;
 
                       db $D0,$09,$A2,$FA,$A9,$06,$20,$DD   ;0EAC63|        |0EAC6E;
                       db $FC,$F0,$11,$20,$02,$8A,$18,$69   ;0EAC6B|        |0E11F0;
                       db $06,$8D,$1C,$04,$A9,$00,$8D,$37   ;0EAC73|        |00008D;
                       db $05,$8D,$20,$05,$60,$20,$02,$8A   ;0EAC7B|        |00008D;
                       db $AD,$1C,$04,$18,$69,$02,$8D,$1C   ;0EAC83|        |0E041C;
                       db $04,$4C,$77,$AC,$EE,$65,$05,$EE   ;0EAC8B|        |00004C;
                       db $65,$05,$A9,$03,$8D,$C1,$05,$AD   ;0EAC93|        |000005;
                       db $D8,$05,$C9,$02,$B0,$0F,$0A,$A8   ;0EAC9B|        |      ;
                       db $B9,$BF,$AC,$8D,$F2,$04,$B9,$C0   ;0EACA3|        |0EACBF;
                       db $AC,$8D,$09,$05,$60,$0A,$A8,$B9   ;0EACAB|        |0E098D;
                       db $BF,$AC,$8D,$20,$05,$B9,$C0,$AC   ;0EACB3|        |208DAC;
                       db $8D,$37,$05,$60,$01,$00,$FF,$00   ;0EACBB|        |0E0537;
                       db $01,$00,$FF,$00,$20,$36,$A8,$90   ;0EACC3|        |000000;
                       db $03,$4C,$50,$A8,$CE,$C1,$05,$F0   ;0EACCB|        |00004C;
                       db $14,$A9,$04,$20,$72,$A7,$20,$11   ;0EACD3|        |0000A9;
                       db $AC,$20,$44,$AC,$20,$73,$EF,$20   ;0EACDB|        |0E4420;
                       db $3A,$87,$4C,$12,$87,$AD,$D8,$05   ;0EACE3|        |      ;
                       db $C9,$02,$B0,$0A,$A9,$00,$8D,$F2   ;0EACEB|        |      ;
                       db $04,$8D,$09,$05,$F0,$08,$A9,$00   ;0EACF3|        |00008D;
                       db $8D,$20,$05,$8D,$37,$05,$A9,$34   ;0EACFB|        |0E0520;
                       db $8D,$65,$05,$60,$20,$36,$A8,$90   ;0EAD03|        |0E0565;
                       db $03,$4C,$50,$A8,$CE,$C1,$05,$D0   ;0EAD0B|        |00004C;
                       db $06,$A9,$34,$8D,$65,$05,$60,$AD   ;0EAD13|        |0000A9;
                       db $F2,$04,$0D,$09,$05,$F0,$0E,$AD   ;0EAD1B|        |000004;
                       db $F2,$04,$10,$04,$A0,$01,$D0,$02   ;0EAD23|        |000004;
                       db $A0,$00,$8C,$A8,$04,$A5,$28,$4A   ;0EAD2B|        |      ;
                       db $B0,$47,$4A,$B0,$6B,$AD,$F2,$04   ;0EAD33|        |0EAD7C;
                       db $30,$21,$AD,$09,$05,$38,$ED,$F9   ;0EAD3B|        |0EAD5E;
                       db $A9,$8D,$09,$05,$AD,$F2,$04,$E9   ;0EAD43|        |      ;
                       db $00,$8D,$F2,$04,$90,$03,$4C,$D0   ;0EAD4B|        |      ;
                       db $AD,$A9,$00,$8D,$F2,$04,$8D,$09   ;0EAD53|        |0E00A9;
                       db $05,$F0,$72,$AD,$09,$05,$18,$6D   ;0EAD5B|        |0000F0;
                       db $F9,$A9,$8D,$09,$05,$AD,$F2,$04   ;0EAD63|        |0E8DA9;
                       db $69,$00,$8D,$F2,$04,$90,$5E,$A9   ;0EAD6B|        |      ;
                       db $00,$8D,$F2,$04,$8D,$09,$05,$F0   ;0EAD73|        |      ;
                       db $54,$AD,$09,$05,$18,$6D,$FB,$A9   ;0EAD7B|        |      ;
                       db $8D,$09,$05,$AD,$F2,$04,$69,$00   ;0EAD83|        |0E0509;
                       db $8D,$F2,$04,$30,$40,$CD,$FD,$A9   ;0EAD8B|        |0E04F2;
                       db $D0,$3B,$AD,$FE,$A9,$CD,$09,$05   ;0EAD93|        |0EADD0;
                       db $B0,$33,$8D,$09,$05,$4C,$D0,$AD   ;0EAD9B|        |0EADD0;
                       db $AD,$09,$05,$38,$ED,$FB,$A9,$8D   ;0EADA3|        |0E0509;
                       db $09,$05,$AD,$F2,$04,$E9,$00,$8D   ;0EADAB|        |      ;
                       db $F2,$04,$10,$19,$AD,$01,$AA,$CD   ;0EADB3|        |000004;
                       db $F2,$04,$90,$11,$AD,$02,$AA,$CD   ;0EADBB|        |000004;
                       db $09,$05,$90,$09,$8D,$09,$05,$AD   ;0EADC3|        |      ;
                       db $01,$AA,$8D,$F2,$04,$AD,$37,$05   ;0EADCB|        |0000AA;
                       db $18,$69,$40,$8D,$37,$05,$AD,$20   ;0EADD3|        |      ;
                       db $05,$69,$00,$8D,$20,$05,$A9,$04   ;0EADDB|        |000069;
                       db $20,$72,$A7,$20,$26,$AB,$20,$05   ;0EADE3|        |0EA772;
                       db $AA,$AD,$65,$05,$C9,$36,$F0,$09   ;0EADEB|        |      ;
                       db $20,$73,$EF,$20,$3A,$87,$4C,$12   ;0EADF3|        |0EEF73;
                       db $87,$AD,$D8,$05,$C9,$02,$B0,$F0   ;0EADFB|        |0000AD;
                       db $A9,$00,$8D,$37,$05,$8D,$20,$05   ;0EAE03|        |      ;
                       db $F0,$E6,$85,$02,$84,$03,$A9,$00   ;0EAE0B|        |0EADF3;
                       db $85,$04,$85,$05,$A0,$10,$06,$00   ;0EAE13|        |000004;
                       db $26,$01,$26,$04,$26,$05,$A5,$05   ;0EAE1B|        |000001;
                       db $C5,$03,$D0,$04,$A5,$04,$C5,$02   ;0EAE23|        |000003;
                       db $90,$0E,$A5,$04,$E5,$02,$85,$04   ;0EAE2B|        |0EAE3B;
                       db $A5,$05,$E5,$03,$85,$05,$E6,$00   ;0EAE33|        |000005;
                       db $88,$D0,$DB,$60,$A9,$01,$85,$10   ;0EAE3B|        |      ;
                       db $AD,$EC,$07,$85,$12,$A9,$01,$85   ;0EAE43|        |0E07EC;
                       db $17,$BD,$4E,$05,$4C,$6D,$AE       ;0EAE4B|        |0000BD;
 
       UNREACH_0EAE52: db $A9,$00,$85,$10,$A2,$14,$A5,$82   ;0EAE52|        |      ;
                       db $85,$12,$A9,$03,$85,$17,$BD,$4E   ;0EAE5A|        |000012;
                       db $05,$D0,$08,$C6,$17,$F0,$03,$E8   ;0EAE62|        |0000D0;
                       db $D0,$F4,$60,$C9,$0C,$F0,$04,$A5   ;0EAE6A|        |0EAE60;
                       db $BF,$30,$F7,$AD,$FD,$AE,$48,$AD   ;0EAE72|        |ADF730;
                       db $FC,$AE,$48,$BD,$4E,$05,$0A,$A8   ;0EAE7A|        |0E48AE;
                       db $B9,$E0,$AE,$85,$00,$B9,$E1,$AE   ;0EAE82|        |0EAEE0;
                       db $85,$01,$BC,$65,$05,$B1,$00,$85   ;0EAE8A|        |000001;
                       db $02,$C8,$B1,$00,$85,$03,$6C,$02   ;0EAE92|        |      ;
                       db $00,$BD,$65,$05,$C9,$02,$F0,$C3   ;0EAE9A|        |      ;
                       db $BD,$38,$04,$C9,$09,$90,$12,$C9   ;0EAEA2|        |0E0438;
                       db $F8,$B0,$0E,$BD,$1C,$04,$C9,$10   ;0EAEAA|        |      ;
                       db $90,$07,$C9,$E0,$B0,$03,$4C,$65   ;0EAEB2|        |0EAEBB;
                       db $AE,$BD,$4E,$05,$C9,$06,$F0,$11   ;0EAEBA|        |0E4EBD;
                       db $A9,$00,$9D,$4E,$05,$9D,$00,$04   ;0EAEC2|        |      ;
                       db $9D,$38,$04,$9D,$1C,$04,$4C,$65   ;0EAECA|        |0E0438;
                       db $AE,$A9,$00,$9D,$38,$04,$A9,$80   ;0EAED2|        |0E00A9;
                       db $9D,$70,$04,$4C,$65,$AE,$FE,$AE   ;0EAEDA|        |0E0470;
                       db $FE,$AE,$04,$AF,$0C,$AF,$12,$AF   ;0EAEE2|        |0E04AE;
                       db $1A,$AF,$20,$AF,$26,$AF,$34,$AF   ;0EAEEA|        |      ;
                       db $3A,$AF,$40,$AF,$46,$AF,$48,$AF   ;0EAEF2|        |      ;
                       db $4E,$AF,$9A,$AE,$5C,$B4,$95,$B4   ;0EAEFA|        |0E9AAF;
                       db $D7,$B4,$5C,$B4,$F4,$B4,$2D,$B5   ;0EAF02|        |0000B4;
                       db $6F,$B5,$5C,$B4,$B2,$B6,$F4,$B6   ;0EAF0A|        |B45CB5;
                       db $5C,$B4,$52,$B7,$92,$B7,$D0,$B7   ;0EAF12|        |B752B4;
                       db $5C,$B4,$90,$B3,$DC,$B3,$EA,$B7   ;0EAF1A|        |B390B4;
                       db $23,$B8,$A4,$B8,$3A,$B0,$73,$B0   ;0EAF22|        |0000B8;
                       db $FA,$B0,$36,$B1,$7D,$B1,$F6,$B1   ;0EAF2A|        |      ;
                       db $46,$B2,$5C,$B4,$2A,$B6,$F4,$B6   ;0EAF32|        |0000B2;
                       db $5C,$B4,$B9,$B5,$D7,$B4,$5C,$B4   ;0EAF3A|        |B5B9B4;
                       db $77,$AF,$EA,$AF,$66,$AF,$9F,$B9   ;0EAF42|        |0000AF;
                       db $BA,$B9,$C0,$B9,$84,$B9,$BA,$B9   ;0EAF4A|        |      ;
                       db $C0,$B9,$20,$55,$BC,$FE,$65,$05   ;0EAF52|        |      ;
                       db $FE,$65,$05,$BC,$4E,$05,$B9,$67   ;0EAF5A|        |0E0565;
                       db $AF,$9D,$06,$06,$60,$00,$60,$60   ;0EAF62|        |06069D;
                       db $40,$30,$C0,$02,$C0,$40,$60,$20   ;0EAF6A|        |      ;
 
                       db $00,$00,$00,$00,$00,$DE,$C1,$05   ;0EAF72|        |      ;
                       db $D0,$EA,$BD,$D8,$05,$D0,$05,$A9   ;0EAF7A|        |0EAF66;
                       db $1F,$20,$5F,$E2,$A9,$06,$A0,$0B   ;0EAF82|        |E25F20;
                       db $20,$5C,$EF,$A4,$10,$B9,$A8,$04   ;0EAF8A|        |0EEF5C;
                       db $85,$00,$A0,$00,$B9,$06,$B0,$85   ;0EAF92|        |000000;
                       db $08,$B9,$07,$B0,$85,$09,$BD,$D8   ;0EAF9A|        |      ;
                       db $05,$0A,$0A,$A8,$A5,$00,$F0,$05   ;0EAFA2|        |00000A;
                       db $98,$18,$69,$0C,$A8,$B1,$08,$9D   ;0EAFAA|        |      ;
                       db $09,$05,$C8,$B1,$08,$9D,$F2,$04   ;0EAFB2|        |      ;
                       db $C8,$B1,$08,$9D,$37,$05,$C8,$B1   ;0EAFBA|        |      ;
                       db $08,$9D,$20,$05,$A9,$00,$9D,$A8   ;0EAFC2|        |      ;
                       db $04,$A4,$10,$B9,$38,$04,$9D,$38   ;0EAFCA|        |0000A4;
                       db $04,$B9,$1C,$04,$A4,$12,$C0,$07   ;0EAFD2|        |0000B9;
                       db $D0,$03,$18,$69,$06,$9D,$1C,$04   ;0EAFDA|        |0EAFDF;
                       db $A9,$18,$9D,$C1,$05,$4C,$54,$AF   ;0EAFE2|        |      ;
                       db $BD,$1D,$06,$D0,$11,$DE,$C1,$05   ;0EAFEA|        |0E061D;
                       db $F0,$0C,$20,$75,$EF,$20,$16,$B9   ;0EAFF2|        |0EB000;
                       db $20,$2F,$B9,$4C,$51,$B9,$A9,$00   ;0EAFFA|        |0EB92F;
                       db $9D,$38,$04,$60,$0A,$B0,$22,$B0   ;0EB002|        |0E0438;
                       db $80,$04,$00,$00,$26,$04,$4C,$FE   ;0EB00A|        |0EB010;
                       db $26,$04,$B4,$01,$80,$FB,$00,$00   ;0EB012|        |000004;
                       db $DA,$FB,$4C,$FE,$DA,$FB,$B4,$01   ;0EB01A|        |      ;
                       db $00,$05,$00,$00,$9C,$04,$1B,$FE   ;0EB022|        |      ;
                       db $9C,$04,$E5,$01,$00,$FB,$00,$00   ;0EB02A|        |0EE504;
                       db $64,$FB,$1B,$FE,$64,$FB,$E5,$01   ;0EB032|        |0000FB;
                       db $20,$6E,$B4,$18,$69,$01,$9D,$C2   ;0EB03A|        |0EB46E;
                       db $05,$9D,$C3,$05,$A9,$00,$9D,$38   ;0EB042|        |00009D;
                       db $04,$9D,$39,$04,$9D,$3A,$04,$9D   ;0EB04A|        |00009D;
                       db $1C,$04,$9D,$1D,$04,$9D,$1E,$04   ;0EB052|        |0E9D04;
                       db $FE,$65,$05,$FE,$65,$05,$BD,$4E   ;0EB05A|        |0E0565;
                       db $05,$9D,$4F,$05,$9D,$50,$05,$BD   ;0EB062|        |00009D;
                       db $65,$05,$9D,$66,$05,$9D,$67,$05   ;0EB06A|        |000005;
                       db $60,$DE,$C1,$05,$D0,$FA,$E0,$14   ;0EB072|        |      ;
 
                       db $D0,$05,$A9,$1E,$20,$5F,$E2,$AD   ;0EB07A|        |0EB081;
                       db $38,$04,$9D,$38,$04,$AD,$1C,$04   ;0EB082|        |      ;
                       db $9D,$1C,$04,$A9,$00,$9D,$1D,$06   ;0EB08A|        |0E041C;
                       db $E0,$14,$D0,$05,$20,$AC,$B0,$A2   ;0EB092|        |      ;
                       db $14,$8A,$38,$E9,$14,$A8,$B9,$A9   ;0EB09A|        |00008A;
                       db $B0,$9D,$C1,$05,$4C,$54,$AF,$03   ;0EB0A2|        |0EB041;
                       db $02,$01,$A9,$00,$85,$08,$A0,$01   ;0EB0AA|        |      ;
                       db $B9,$4E,$05,$D0,$10,$C8,$C0,$0D   ;0EB0B2|        |0E054E;
                       db $90,$F6,$A9,$FF,$9D,$D8,$05,$E8   ;0EB0BA|        |0EB0B2;
                       db $E0,$17,$90,$F8,$60,$B9,$70,$04   ;0EB0C2|        |      ;
                       db $30,$EB,$B9,$38,$04,$38,$FD,$38   ;0EB0CA|        |0EB0B7;
                       db $04,$B0,$05,$49,$FF,$18,$69,$01   ;0EB0D2|        |0000B0;
                       db $C9,$40,$B0,$D9,$B9,$1C,$04,$38   ;0EB0DA|        |      ;
                       db $FD,$1C,$04,$B0,$05,$49,$FF,$18   ;0EB0E2|        |0E041C;
                       db $69,$01,$C9,$80,$B0,$C7,$98,$9D   ;0EB0EA|        |      ;
                       db $D8,$05,$E8,$E0,$17,$B0,$BE,$60   ;0EB0F2|        |      ;
                       db $BD,$D8,$05,$30,$07,$FE,$65,$05   ;0EB0FA|        |0E05D8;
                       db $FE,$65,$05,$60,$20,$12,$B1,$B0   ;0EB102|        |0E0565;
                       db $F4,$98,$9D,$D8,$05,$4C,$FF,$B0   ;0EB10A|        |0E9D98;
                       db $A0,$01,$B9,$4E,$05,$D0,$07,$C8   ;0EB112|        |      ;
                       db $C0,$0D,$90,$F6,$38,$60,$B9,$70   ;0EB11A|        |      ;
                       db $04,$30,$F4,$CC,$EC,$05,$F0,$EF   ;0EB122|        |000030;
                       db $CC,$ED,$05,$F0,$EA,$CC,$EE,$05   ;0EB12A|        |0E05ED;
                       db $F0,$E5,$18,$60,$DE,$C1,$05,$D0   ;0EB132|        |0EB119;
                       db $BE,$A9,$02,$A0,$0A,$20,$5C,$EF   ;0EB13A|        |0E02A9;
                       db $AD,$7A,$B1,$9D,$C1,$05,$A9,$01   ;0EB142|        |0EB17A;
                       db $9D,$09,$05,$8A,$38,$E9,$14,$A8   ;0EB14A|        |0E0509;
                       db $AD,$A8,$04,$F0,$03,$C8,$C8,$C8   ;0EB152|        |0E04A8;
                       db $B9,$74,$B1,$9D,$EF,$05,$A9,$00   ;0EB15A|        |0EB174;
                       db $9D,$A8,$04,$AD,$38,$04,$9D,$38   ;0EB162|        |0E04A8;
                       db $04,$AD,$1C,$04,$9D,$1C,$04,$4C   ;0EB16A|        |0000AD;
                       db $54,$AF,$00,$04,$1C,$10,$0C,$14   ;0EB172|        |      ;
                       db $10,$10,$02,$DE,$C1,$05,$F0,$13   ;0EB17A|        |0EB18C;
                       db $20,$75,$EF,$20,$BB,$B2,$20,$0A   ;0EB182|        |0EEF75;
                       db $B3,$4C,$51,$B9,$A9,$FF,$9D,$D8   ;0EB18A|        |00004C;
                       db $05,$D0,$ED,$BC,$D8,$05,$30,$E8   ;0EB192|        |0000D0;
                       db $F0,$E6,$B9,$4E,$05,$F0,$ED,$B9   ;0EB19A|        |0EB182;
                       db $70,$04,$30,$E8,$BD,$1D,$06,$D0   ;0EB1A2|        |0EB1A8;
                       db $E3,$A9,$00,$85,$08,$B9,$38,$04   ;0EB1AA|        |0000A9;
                       db $38,$FD,$38,$04,$B0,$09,$49,$FF   ;0EB1B2|        |      ;
                       db $18,$69,$01,$E6,$08,$E6,$08,$85   ;0EB1BA|        |      ;
                       db $09,$B9,$1C,$04,$38,$FD,$1C,$04   ;0EB1C2|        |      ;
                       db $B0,$07,$49,$FF,$18,$69,$01,$E6   ;0EB1CA|        |0EB1D3;
                       db $08,$85,$01,$A5,$09,$A0,$00,$84   ;0EB1D2|        |      ;
                       db $00,$20,$0D,$AE,$A5,$01,$9D,$20   ;0EB1DA|        |      ;
                       db $05,$A5,$00,$9D,$37,$05,$A5,$08   ;0EB1E2|        |0000A5;
                       db $9D,$F2,$04,$FE,$65,$05,$FE,$65   ;0EB1EA|        |0E04F2;
                       db $05,$4C,$82,$B1,$20,$08,$B2,$FE   ;0EB1F2|        |00004C;
                       db $65,$05,$FE,$65,$05,$AD,$7C,$B1   ;0EB1FA|        |000005;
                       db $9D,$20,$05,$4C,$82,$B1,$A0,$00   ;0EB202|        |0E0520;
                       db $BD,$20,$05,$D9,$7E,$B3,$90,$12   ;0EB20A|        |0E0520;
                       db $D0,$0A,$BD,$37,$05,$D9,$7F,$B3   ;0EB212|        |0EB21E;
                       db $90,$08,$F0,$06,$C8,$C8,$C0,$10   ;0EB21A|        |0EB224;
                       db $90,$E6,$98,$4A,$85,$00,$BC,$F2   ;0EB222|        |0EB20A;
                       db $04,$F0,$15,$88,$F0,$0D,$88,$F0   ;0EB22A|        |0000F0;
                       db $06,$18,$69,$10,$4C,$42,$B2,$A9   ;0EB232|        |000018;
                       db $10,$D0,$02,$A9,$20,$38,$E5,$00   ;0EB23A|        |0EB20C;
                       db $9D,$F2,$04,$60,$20,$59,$B2,$90   ;0EB242|        |0E04F2;
                       db $0B,$AD,$7B,$B1,$9D,$C1,$05,$A9   ;0EB24A|        |      ;
                       db $08,$9D,$65,$05,$4C,$82,$B1,$DE   ;0EB252|        |      ;
                       db $20,$05,$D0,$39,$AD,$7C,$B1,$9D   ;0EB25A|        |0ED005;
                       db $20,$05,$BD,$F2,$04,$38,$FD,$EF   ;0EB262|        |0EBD05;
                       db $05,$85,$00,$B0,$0B,$C9,$F0,$90   ;0EB26A|        |000085;
                       db $26,$A9,$00,$38,$E5,$00,$90,$09   ;0EB272|        |0000A9;
                       db $C9,$11,$90,$1E,$A9,$20,$38,$E5   ;0EB27A|        |      ;
                       db $00,$DD,$09,$05,$90,$2B,$BD,$EF   ;0EB282|        |      ;
                       db $05,$38,$FD,$09,$05,$10,$03,$38   ;0EB28A|        |000038;
                       db $E9,$E0,$9D,$EF,$05,$18,$60,$38   ;0EB292|        |      ;
                       db $E9,$E0,$DD,$09,$05,$90,$12,$BD   ;0EB29A|        |      ;
                       db $EF,$05,$18,$7D,$09,$05,$C9,$20   ;0EB2A2|        |7D1805;
                       db $90,$02,$E9,$20,$9D,$EF,$05,$18   ;0EB2AA|        |0EB2AE;
                       db $60,$BD,$F2,$04,$9D,$EF,$05,$38   ;0EB2B2|        |      ;
 
                       db $60,$BD,$EF,$05,$C9,$08,$90,$32   ;0EB2BA|        |      ;
 
                       db $C9,$10,$90,$15,$C9,$18,$90,$08   ;0EB2C2|        |      ;
                       db $A9,$20,$38,$FD,$EF,$05,$D0,$22   ;0EB2CA|        |      ;
                       db $A9,$18,$38,$FD,$EF,$05,$4C,$DE   ;0EB2D2|        |      ;
                       db $B2,$38,$E9,$08,$0A,$A8,$38,$BD   ;0EB2DA|        |000038;
                       db $C4,$04,$F9,$6D,$B3,$9D,$C4,$04   ;0EB2E2|        |000004;
                       db $BD,$38,$04,$F9,$6C,$B3,$9D,$38   ;0EB2EA|        |0E0438;
                       db $04,$60,$0A,$A8,$18,$B9,$5B,$B3   ;0EB2F2|        |000060;
                       db $7D,$C4,$04,$9D,$C4,$04,$B9,$5A   ;0EB2FA|        |0E04C4;
                       db $B3,$7D,$38,$04,$9D,$38,$04,$60   ;0EB302|        |00007D;
                       db $BD,$EF,$05,$C9,$08,$90,$33,$C9   ;0EB30A|        |0E05EF;
                       db $10,$90,$29,$C9,$18,$90,$09,$BD   ;0EB312|        |0EB2A4;
                       db $EF,$05,$38,$E9,$18,$4C,$28,$B3   ;0EB31A|        |E93805;
                       db $A9,$18,$38,$FD,$EF,$05,$0A,$A8   ;0EB322|        |      ;
                       db $38,$BD,$DB,$04,$F9,$5B,$B3,$9D   ;0EB32A|        |      ;
                       db $DB,$04,$BD,$1C,$04,$F9,$5A,$B3   ;0EB332|        |      ;
                       db $9D,$1C,$04,$60,$A9,$10,$38,$FD   ;0EB33A|        |0E041C;
                       db $EF,$05,$0A,$A8,$18,$B9,$6D,$B3   ;0EB342|        |A80A05;
                       db $7D,$DB,$04,$9D,$DB,$04,$B9,$6C   ;0EB34A|        |0E04DB;
                       db $B3,$7D,$1C,$04,$9D,$1C,$04,$60   ;0EB352|        |00007D;
                       db $02,$00,$01,$F6,$01,$D9,$01,$A9   ;0EB35A|        |      ;
                       db $01,$6A,$01,$1C,$00,$C3,$00,$63   ;0EB362|        |00006A;
                       db $00,$00,$00,$00,$00,$63,$00,$C3   ;0EB36A|        |      ;
                       db $01,$1C,$01,$69,$01,$A9,$01,$D9   ;0EB372|        |00001C;
                       db $01,$F6,$02,$00,$00,$00,$00,$32   ;0EB37A|        |0000F6;
                       db $00,$6A,$00,$C4,$01,$00,$01,$7F   ;0EB382|        |      ;
                       db $02,$6A,$05,$06,$FF,$FF,$DE,$C1   ;0EB38A|        |      ;
                       db $05,$D0,$60,$A9,$24,$20,$5F,$E2   ;0EB392|        |0000D0;
                       db $A4,$10,$B9,$38,$04,$85,$0C,$B9   ;0EB39A|        |000010;
                       db $1C,$04,$85,$0D,$B9,$A8,$04,$85   ;0EB3A2|        |0E8504;
                       db $0E,$A9,$00,$9D,$93,$05,$A9,$02   ;0EB3AA|        |0E00A9;
                       db $9D,$8C,$04,$A9,$01,$9D,$7C,$05   ;0EB3B2|        |0E048C;
                       db $A5,$0D,$38,$E9,$08,$9D,$1C,$04   ;0EB3BA|        |00000D;
                       db $A4,$0C,$A5,$0E,$9D,$A8,$04,$F0   ;0EB3C2|        |00000C;
                       db $07,$98,$38,$E9,$18,$4C,$D6,$B3   ;0EB3CA|        |000098;
                       db $98,$18,$69,$18,$9D,$38,$04,$4C   ;0EB3D2|        |      ;
                       db $54,$AF,$20,$F6,$B3,$B0,$06,$20   ;0EB3DA|        |      ;
                       db $16,$B9,$4C,$51,$B9,$A9,$00,$9D   ;0EB3E2|        |0000B9;
                       db $4E,$05,$9D,$38,$04,$9D,$1C,$04   ;0EB3EA|        |0E9D05;
                       db $9D,$00,$04,$60,$A9,$00,$9D,$09   ;0EB3F2|        |0E0400;
                       db $05,$DE,$7C,$05,$F0,$07,$A9,$00   ;0EB3FA|        |0000DE;
                       db $9D,$F2,$04,$18,$60,$BD,$93,$05   ;0EB402|        |0E04F2;
                       db $85,$08,$0A,$18,$65,$08,$A8,$B9   ;0EB40A|        |000008;
                       db $40,$B4,$C9,$FF,$F0,$26,$85,$00   ;0EB412|        |      ;
                       db $BD,$A8,$04,$F0,$09,$A5,$00,$49   ;0EB41A|        |0E04A8;
                       db $FF,$18,$69,$01,$D0,$02,$A5,$00   ;0EB422|        |016918;
                       db $9D,$F2,$04,$B9,$41,$B4,$9D,$7C   ;0EB42A|        |0E04F2;
                       db $05,$B9,$42,$B4,$9D,$00,$04,$FE   ;0EB432|        |0000B9;
                       db $93,$05,$18,$60,$38,$60,$00,$03   ;0EB43A|        |000005;
                       db $3C,$04,$03,$3E,$04,$03,$3E,$0C   ;0EB442|        |0E0304;
                       db $03,$40,$08,$03,$40,$08,$03,$42   ;0EB44A|        |000040;
                       db $04,$03,$42,$08,$03,$44,$00,$03   ;0EB452|        |000003;
                       db $56,$FF,$20,$6E,$B4,$A9,$00,$9D   ;0EB45A|        |0000FF;
                       db $38,$04,$9D,$1C,$04,$FE,$65,$05   ;0EB462|        |      ;
                       db $FE,$65,$05,$60,$BC,$4E,$05,$B9   ;0EB46A|        |0E0565;
                       db $78,$B4,$9D,$C1,$05,$60,$00,$0A   ;0EB472|        |      ;
                       db $0A,$0A,$0A,$0C,$08,$08,$08,$08   ;0EB47A|        |      ;
                       db $10,$02,$00,$FE,$00,$FA,$80,$02   ;0EB482|        |0EB486;
                       db $00,$FE,$00,$04,$00,$FC,$00,$01   ;0EB48A|        |      ;
                       db $80,$FE,$80,$DE,$C1,$05,$D0,$D3   ;0EB492|        |0EB492;
 
                       db $A9,$13,$20,$5F,$E2,$A9,$00,$A0   ;0EB49A|        |      ;
                       db $08,$20,$5C,$EF,$AD,$A8,$04,$0A   ;0EB4A2|        |      ;
                       db $A8,$B9,$83,$B4,$9D,$F2,$04,$B9   ;0EB4AA|        |      ;
                       db $84,$B4,$9D,$09,$05,$AD,$87,$B4   ;0EB4B2|        |0000B4;
                       db $9D,$20,$05,$AD,$88,$B4,$9D,$37   ;0EB4BA|        |0E0520;
                       db $05,$A9,$00,$9D,$A8,$04,$AD,$38   ;0EB4C2|        |0000A9;
                       db $04,$9D,$38,$04,$AD,$1C,$04,$9D   ;0EB4CA|        |00009D;
                       db $1C,$04,$4C,$54,$AF,$BD,$37,$05   ;0EB4D2|        |0E4C04;
                       db $18,$69,$40,$9D,$37,$05,$BD,$20   ;0EB4DA|        |      ;
                       db $05,$69,$00,$9D,$20,$05,$20,$75   ;0EB4E2|        |000069;
                       db $EF,$20,$16,$B9,$20,$2F,$B9,$4C   ;0EB4EA|        |B91620;
                       db $51,$B9,$DE,$C1,$05,$F0,$01,$60   ;0EB4F2|        |0000B9;
                       db $A9,$00,$A0,$07,$20,$5C,$EF,$A4   ;0EB4FA|        |      ;
                       db $10,$B9,$A8,$04,$0A,$A8,$B9,$89   ;0EB502|        |0EB4BD;
                       db $B4,$9D,$F2,$04,$B9,$8A,$B4,$9D   ;0EB50A|        |00009D;
                       db $09,$05,$A9,$00,$9D,$A8,$04,$A4   ;0EB512|        |      ;
                       db $10,$B9,$38,$04,$9D,$38,$04,$38   ;0EB51A|        |0EB4D5;
                       db $B9,$1C,$04,$E9,$04,$9D,$1C,$04   ;0EB522|        |0E041C;
                       db $4C,$54,$AF,$BD,$1D,$06,$29,$0F   ;0EB52A|        |0EAF54;
 
                       db $C9,$03,$F0,$0B,$BD,$38,$04,$C9   ;0EB532|        |      ;
                       db $F1,$B0,$04,$C9,$10,$B0,$1A,$20   ;0EB53A|        |0000B0;
                       db $55,$BC,$A9,$00,$38,$FD,$09,$05   ;0EB542|        |0000BC;
                       db $9D,$09,$05,$A9,$00,$FD,$F2,$04   ;0EB54A|        |0E0509;
                       db $9D,$F2,$04,$FE,$65,$05,$FE,$65   ;0EB552|        |0E04F2;
                       db $05,$A5,$1A,$29,$0F,$D0,$05,$A9   ;0EB55A|        |0000A5;
                       db $15,$20,$5F,$E2,$20,$75,$EF,$20   ;0EB562|        |000020;
                       db $16,$B9,$4C,$51,$B9,$A4,$10,$B9   ;0EB56A|        |0000B9;
                       db $38,$04,$38,$FD,$38,$04,$B0,$05   ;0EB572|        |      ;
                       db $49,$FF,$18,$69,$01,$C9,$10,$B0   ;0EB57A|        |      ;
                       db $D8,$B9,$1C,$04,$38,$FD,$1C,$04   ;0EB582|        |      ;
                       db $B0,$05,$49,$FF,$18,$69,$01,$C9   ;0EB58A|        |0EB591;
                       db $10,$B0,$C6,$A9,$00,$9D,$38,$04   ;0EB592|        |0EB544;
                       db $60,$A5,$10,$C9,$01,$F0,$12,$A0   ;0EB59A|        |      ;
 
                       db $00,$B9,$08,$B7,$C9,$FF,$F0,$09   ;0EB5A2|        |      ;
                       db $CD,$65,$05,$F0,$08,$C8,$C8,$D0   ;0EB5AA|        |0E0565;
                       db $F0,$A0,$00,$38,$60,$18,$60,$DE   ;0EB5B2|        |0EB554;
                       db $C1,$05,$D0,$FA,$A4,$10,$B9,$38   ;0EB5BA|        |000005;
                       db $04,$85,$0C,$B9,$1C,$04,$85,$0D   ;0EB5C2|        |000085;
                       db $B9,$A8,$04,$85,$0E,$A9,$13,$20   ;0EB5CA|        |0E04A8;
                       db $5F,$E2,$20,$9B,$B5,$B0,$0F,$B9   ;0EB5D2|        |9B20E2;
                       db $09,$B7,$0A,$85,$00,$0A,$0A,$18   ;0EB5DA|        |      ;
                       db $65,$00,$79,$09,$B7,$A8,$B9,$0D   ;0EB5E2|        |000000;
                       db $B7,$18,$65,$0C,$9D,$38,$04,$B9   ;0EB5EA|        |000018;
                       db $0E,$B7,$18,$65,$0D,$9D,$1C,$04   ;0EB5F2|        |0E18B7;
                       db $A5,$0E,$59,$0F,$B7,$9D,$A8,$04   ;0EB5FA|        |00000E;
                       db $F0,$04,$C8,$C8,$C8,$C8,$B9,$10   ;0EB602|        |0EB608;
                       db $B7,$9D,$F2,$04,$B9,$11,$B7,$9D   ;0EB60A|        |00009D;
                       db $09,$05,$B9,$12,$B7,$9D,$20,$05   ;0EB612|        |      ;
                       db $B9,$13,$B7,$9D,$37,$05,$A9,$00   ;0EB61A|        |0EB713;
                       db $A0,$08,$20,$5C,$EF,$4C,$54,$AF   ;0EB622|        |      ;
                       db $DE,$C1,$05,$D0,$89,$A4,$10,$B9   ;0EB62A|        |0E05C1;
                       db $38,$04,$85,$0C,$B9,$1C,$04,$85   ;0EB632|        |      ;
                       db $0D,$B9,$A8,$04,$85,$0E,$A9,$14   ;0EB63A|        |0EA8B9;
                       db $20,$5F,$E2,$20,$9B,$B5,$B0,$0C   ;0EB642|        |0EE25F;
                       db $B9,$09,$B7,$0A,$0A,$85,$00,$0A   ;0EB64A|        |0EB709;
                       db $18,$65,$00,$A8,$B9,$2E,$B7,$9D   ;0EB652|        |      ;
                       db $00,$04,$B9,$2F,$B7,$18,$65,$0C   ;0EB65A|        |      ;
                       db $9D,$38,$04,$B9,$30,$B7,$18,$65   ;0EB662|        |0E0438;
                       db $0D,$9D,$1C,$04,$A5,$10,$C9,$01   ;0EB66A|        |0E1C9D;
                       db $F0,$10,$AD,$65,$05,$C9,$1C,$D0   ;0EB672|        |0EB684;
                       db $09,$18,$BD,$1C,$04,$69,$06,$9D   ;0EB67A|        |      ;
                       db $1C,$04,$A5,$0E,$59,$31,$B7,$9D   ;0EB682|        |0EA504;
                       db $A8,$04,$F0,$04,$C8,$C8,$C8,$C8   ;0EB68A|        |      ;
                       db $B9,$32,$B7,$9D,$F2,$04,$B9,$33   ;0EB692|        |0EB732;
                       db $B7,$9D,$09,$05,$B9,$34,$B7,$9D   ;0EB69A|        |00009D;
                       db $20,$05,$B9,$35,$B7,$9D,$37,$05   ;0EB6A2|        |0EB905;
                       db $A9,$00,$9D,$8C,$04,$4C,$54,$AF   ;0EB6AA|        |      ;
                       db $DE,$C1,$05,$D0,$50,$A9,$14,$20   ;0EB6B2|        |0E05C1;
                       db $5F,$E2,$A9,$00,$9D,$8C,$04,$A9   ;0EB6BA|        |00A9E2;
                       db $4E,$9D,$00,$04,$AD,$A8,$04,$9D   ;0EB6C2|        |0E009D;
                       db $A8,$04,$0A,$A8,$B9,$8D,$B4,$9D   ;0EB6CA|        |      ;
                       db $F2,$04,$B9,$8E,$B4,$9D,$09,$05   ;0EB6D2|        |000004;
                       db $A9,$00,$9D,$37,$05,$9D,$20,$05   ;0EB6DA|        |      ;
                       db $AD,$38,$04,$9D,$38,$04,$38,$AD   ;0EB6E2|        |0E0438;
                       db $1C,$04,$E9,$04,$9D,$1C,$04,$4C   ;0EB6EA|        |0EE904;
                       db $54,$AF,$BD,$1D,$06,$D0,$09,$20   ;0EB6F2|        |      ;
                       db $16,$B9,$20,$2F,$B9,$4C,$51,$B9   ;0EB6FA|        |0000B9;
                       db $A9,$00,$9D,$38,$04,$60,$46,$01   ;0EB702|        |      ;
                       db $48,$02,$FF,$00,$00,$00,$02,$00   ;0EB70A|        |      ;
                       db $FA,$80,$FE,$00,$FA,$80,$00,$00   ;0EB712|        |      ;
                       db $01,$02,$00,$FA,$80,$FE,$00,$FA   ;0EB71A|        |000002;
                       db $80,$00,$00,$00,$00,$00,$00,$00   ;0EB722|        |0EB724;
 
                       db $00,$00,$00,$00,$4E,$00,$FC,$00   ;0EB72A|        |      ;
                       db $04,$00,$00,$00,$FC,$00,$00,$00   ;0EB732|        |000000;
                       db $4E,$00,$00,$01,$04,$00,$00,$00   ;0EB73A|        |0E0000;
                       db $FC,$00,$00,$00,$64,$00,$00,$00   ;0EB742|        |0E0000;
                       db $00,$00,$04,$00,$00,$00,$04,$00   ;0EB74A|        |      ;
                       db $DE,$C1,$05,$D0,$3A,$A9,$00,$9D   ;0EB752|        |0E05C1;
                       db $8C,$04,$A9,$52,$9D,$00,$04,$AD   ;0EB75A|        |0EA904;
                       db $A8,$04,$0A,$A8,$B9,$91,$B4,$9D   ;0EB762|        |      ;
                       db $F2,$04,$B9,$92,$B4,$9D,$09,$05   ;0EB76A|        |000004;
                       db $A9,$FE,$9D,$20,$05,$A9,$80,$9D   ;0EB772|        |      ;
                       db $37,$05,$AD,$A8,$04,$9D,$A8,$04   ;0EB77A|        |000005;
                       db $AD,$38,$04,$9D,$38,$04,$AD,$1C   ;0EB782|        |0E0438;
                       db $04,$9D,$1C,$04,$4C,$54,$AF,$60   ;0EB78A|        |00009D;
                       db $A9,$00,$A0,$08,$20,$1E,$FC,$D0   ;0EB792|        |      ;
                       db $1A,$BD,$37,$05,$18,$69,$20,$9D   ;0EB79A|        |      ;
                       db $37,$05,$BD,$20,$05,$69,$00,$9D   ;0EB7A2|        |000005;
                       db $20,$05,$20,$16,$B9,$20,$2F,$B9   ;0EB7AA|        |0E2005;
                       db $4C,$51,$B9,$A9,$16,$20,$5F,$E2   ;0EB7B2|        |0EB951;
 
                       db $20,$55,$BC,$A9,$4C,$9D,$C1,$05   ;0EB7BA|        |0EBC55;
                       db $A9,$00,$A0,$0C,$20,$5C,$EF,$FE   ;0EB7C2|        |      ;
                       db $65,$05,$FE,$65,$05,$60,$DE,$C1   ;0EB7CA|        |000005;
                       db $05,$D0,$06,$A9,$00,$9D,$38,$04   ;0EB7D2|        |0000D0;
                       db $60,$A5,$1A,$29,$0F,$D0,$03,$20   ;0EB7DA|        |      ;
 
                       db $55,$BC,$20,$75,$EF,$4C,$51,$B9   ;0EB7E2|        |0000BC;
                       db $BD,$4E,$05,$9D,$4F,$05,$9D,$50   ;0EB7EA|        |0E054E;
                       db $05,$20,$6E,$B4,$18,$69,$01,$9D   ;0EB7F2|        |000020;
                       db $C2,$05,$9D,$C3,$05,$A9,$00,$9D   ;0EB7FA|        |      ;
                       db $38,$04,$9D,$39,$04,$9D,$3A,$04   ;0EB802|        |      ;
                       db $9D,$1C,$04,$9D,$1D,$04,$9D,$1E   ;0EB80A|        |0E041C;
                       db $04,$FE,$65,$05,$FE,$65,$05,$BD   ;0EB812|        |0000FE;
                       db $65,$05,$9D,$66,$05,$9D,$67,$05   ;0EB81A|        |000005;
                       db $60,$DE,$C1,$05,$F0,$01,$60,$A9   ;0EB822|        |      ;
 
                       db $21,$20,$5F,$E2,$A9,$02,$A0,$09   ;0EB82A|        |000020;
                       db $20,$5C,$EF,$8A,$38,$E9,$14,$0A   ;0EB832|        |0EEF5C;
                       db $0A,$A8,$B9,$F1,$B8,$9D,$F2,$04   ;0EB83A|        |      ;
                       db $B9,$F2,$B8,$9D,$09,$05,$B9,$F3   ;0EB842|        |0EB8F2;
                       db $B8,$9D,$20,$05,$B9,$F4,$B8,$9D   ;0EB84A|        |      ;
                       db $37,$05,$A9,$00,$9D,$A8,$04,$AD   ;0EB852|        |000005;
                       db $38,$04,$9D,$38,$04,$9D,$EF,$05   ;0EB85A|        |      ;
                       db $AD,$C4,$04,$9D,$C4,$04,$9D,$D8   ;0EB862|        |0E04C4;
                       db $05,$AD,$1C,$04,$9D,$1C,$04,$A9   ;0EB86A|        |0000AD;
                       db $20,$9D,$C1,$05,$4C,$54,$AF,$A9   ;0EB872|        |0EC19D;
                       db $00,$9D,$4E,$05,$9D,$00,$04,$9D   ;0EB87A|        |      ;
                       db $38,$04,$9D,$1C,$04,$E8,$E0,$17   ;0EB882|        |      ;
                       db $90,$EF,$20,$69,$B9,$90,$10,$AD   ;0EB88A|        |0EB87B;
                       db $65,$05,$09,$80,$8D,$65,$05,$A9   ;0EB892|        |000005;
                       db $1A,$85,$2A,$A9,$00,$85,$6B,$68   ;0EB89A|        |      ;
                       db $68,$60,$DE,$C1,$05,$F0,$D0,$A9   ;0EB8A2|        |      ;
                       db $00,$9D,$70,$04,$BD,$38,$04,$85   ;0EB8AA|        |      ;
                       db $09,$BD,$C4,$04,$85,$08,$BD,$EF   ;0EB8B2|        |      ;
                       db $05,$9D,$38,$04,$BD,$D8,$05,$9D   ;0EB8BA|        |00009D;
                       db $C4,$04,$A5,$09,$9D,$EF,$05,$A5   ;0EB8C2|        |000004;
                       db $08,$9D,$D8,$05,$A9,$00,$38,$FD   ;0EB8CA|        |      ;
                       db $09,$05,$9D,$09,$05,$A9,$00,$FD   ;0EB8D2|        |      ;
                       db $F2,$04,$9D,$F2,$04,$20,$75,$EF   ;0EB8DA|        |000004;
                       db $20,$16,$B9,$20,$FD,$B8,$20,$2F   ;0EB8E2|        |0EB916;
                       db $B9,$20,$51,$B9,$4C,$43,$B9,$02   ;0EB8EA|        |0E5120;
                       db $00,$00,$00,$01,$9E,$FE,$D4,$00   ;0EB8F2|        |      ;
                       db $9E,$FE,$1A,$BD,$EF,$05,$F0,$13   ;0EB8FA|        |0E1AFE;
                       db $BD,$D8,$05,$38,$FD,$09,$05,$9D   ;0EB902|        |0E05D8;
                       db $D8,$05,$BD,$EF,$05,$FD,$F2,$04   ;0EB90A|        |      ;
                       db $9D,$EF,$05,$60,$BD,$38,$04,$F0   ;0EB912|        |0E05EF;
                       db $13,$BD,$C4,$04,$18,$7D,$09,$05   ;0EB91A|        |0000BD;
                       db $9D,$C4,$04,$BD,$38,$04,$7D,$F2   ;0EB922|        |0E04C4;
                       db $04,$9D,$38,$04,$60,$BD,$DB,$04   ;0EB92A|        |00009D;
                       db $18,$7D,$37,$05,$9D,$DB,$04,$BD   ;0EB932|        |      ;
                       db $1C,$04,$7D,$20,$05,$9D,$1C,$04   ;0EB93A|        |0E7D04;
                       db $60,$A5,$68,$30,$09,$BD,$EF,$05   ;0EB942|        |      ;
 
                       db $38,$E5,$6E,$9D,$EF,$05,$60,$A5   ;0EB94A|        |      ;
                       db $68,$30,$0A,$BD,$38,$04,$38,$E5   ;0EB952|        |      ;
                       db $6E,$9D,$38,$04,$60,$BD,$1C,$04   ;0EB95A|        |0E389D;
                       db $18,$65,$6E,$9D,$1C,$04,$60,$A5   ;0EB962|        |      ;
                       db $7D,$29,$F0,$C9,$30,$D0,$0F,$A9   ;0EB96A|        |0EF029;
                       db $00,$A2,$10,$20,$DD,$FC,$C9,$02   ;0EB972|        |      ;
                       db $F0,$06,$C9,$03,$F0,$02,$18,$60   ;0EB97A|        |0EB982;
                       db $38,$60,$A9,$0E,$9D,$8C,$04,$A9   ;0EB982|        |      ;
                       db $18,$9D,$00,$04,$A9,$00,$9D,$70   ;0EB98A|        |      ;
                       db $04,$A9,$20,$9D,$C1,$05,$FE,$65   ;0EB992|        |0000A9;
                       db $05,$FE,$65,$05,$60,$A9,$0E,$9D   ;0EB99A|        |0000FE;
                       db $8C,$04,$A9,$1A,$9D,$00,$04,$A9   ;0EB9A2|        |0EA904;
                       db $00,$9D,$70,$04,$A9,$20,$9D,$C1   ;0EB9AA|        |      ;
                       db $05,$FE,$65,$05,$FE,$65,$05,$60   ;0EB9B2|        |0000FE;
                       db $FE,$65,$05,$FE,$65,$05,$DE,$C1   ;0EB9BA|        |0E0565;
                       db $05,$D0,$09,$A9,$00,$9D,$00,$04   ;0EB9C2|        |0000D0;
                       db $9D,$4E,$05,$60,$BD,$1D,$06,$D0   ;0EB9CA|        |0E054E;
                       db $1A,$BD,$37,$05,$18,$69,$40,$9D   ;0EB9D2|        |      ;
                       db $37,$05,$BD,$20,$05,$69,$00,$9D   ;0EB9DA|        |000005;
                       db $20,$05,$20,$16,$B9,$20,$2F,$B9   ;0EB9E2|        |0E2005;
                       db $4C,$51,$B9,$A9,$00,$9D,$38,$04   ;0EB9EA|        |0EB951;
 
                       db $60,$18,$60                       ;0EB9F2|        |      ;
 
 
          CODE_0EB9F5: LDX.B #$14                           ;0EB9F5|A214    |      ;
                       LDY.B r_partnerIdx                   ;0EB9F7|A43B    |00003B;
                       LDA.W $0085,Y                        ;0EB9F9|B98500  |0E0085;
                       BEQ CODE_0EBA2C                      ;0EB9FC|F02E    |0EBA2C;
                       STA.B r_pointerQueue                 ;0EB9FE|8508    |000008;
                       JSR.W CODE_0EBAA2                    ;0EBA00|20A2BA  |0EBAA2;
                       BCC CODE_0EBA2C                      ;0EBA03|9027    |0EBA2C;
                       LDY.B r_partnerIdx                   ;0EBA05|A43B    |00003B;
                       LDA.B r_pointerQueue                 ;0EBA07|A508    |000008;
                       CMP.B #$06                           ;0EBA09|C906    |      ;
                       BEQ UNREACH_0EBA5C                   ;0EBA0B|F04F    |0EBA5C;
                       CMP.B #$07                           ;0EBA0D|C907    |      ;
                       BEQ UNREACH_0EBA5C                   ;0EBA0F|F04B    |0EBA5C;
                       CMP.B #$0B                           ;0EBA11|C90B    |      ;
                       BEQ UNREACH_0EBA43                   ;0EBA13|F02E    |0EBA43;
                       LDA.W $0087,Y                        ;0EBA15|B98700  |0E0087;
                       STA.B $09                            ;0EBA18|8509    |000009;
                       LDA.B #$03                           ;0EBA1A|A903    |      ;
                       STA.B r_temp_Xpos                    ;0EBA1C|850A    |00000A;
 
          CODE_0EBA1E: LDA.W $054E,X                        ;0EBA1E|BD4E05  |0E054E;
                       BEQ UNREACH_0EBA2E                   ;0EBA21|F00B    |0EBA2E;
                       DEC.B $09                            ;0EBA23|C609    |000009;
                       BMI CODE_0EBA2C                      ;0EBA25|3005    |0EBA2C;
                       INX                                  ;0EBA27|E8      |      ;
                       DEC.B r_temp_Xpos                    ;0EBA28|C60A    |00000A;
                       BNE CODE_0EBA1E                      ;0EBA2A|D0F2    |0EBA1E;
 
          CODE_0EBA2C: CLC                                  ;0EBA2C|18      |      ;
                       RTS                                  ;0EBA2D|60      |      ;
 
 
       UNREACH_0EBA2E: db $20,$AA,$BA,$A5,$08,$9D,$4E,$05   ;0EBA2E|        |0EBAAA;
                       db $A9,$00,$9D,$65,$05,$9D,$1D,$06   ;0EBA36|        |      ;
                       db $9D,$70,$04,$38,$60               ;0EBA3E|        |0E0470;
 
       UNREACH_0EBA43: db $A5,$AB,$D0,$13,$20,$AA,$BA,$A9   ;0EBA43|        |0000AB;
                       db $B4,$85,$AC,$A9,$01,$85,$AB,$8D   ;0EBA4B|        |000085;
                       db $C9,$06,$20,$99,$E1,$18,$60,$18   ;0EBA53|        |      ;
                       db $60                               ;0EBA5B|        |      ;
 
 
       UNREACH_0EBA5C: db $AD,$62,$05,$0D,$63,$05,$0D,$64   ;0EBA5C|        |0E0562;
                       db $05,$F0,$C7,$D0,$C3,$A2,$14,$A4   ;0EBA64|        |0000F0;
                       db $3B,$B9,$8E,$00,$85,$09,$A9,$03   ;0EBA6C|        |      ;
                       db $85,$0A,$A0,$00,$BD,$4E,$05,$F0   ;0EBA74|        |00000A;
                       db $11,$C6,$09,$30,$05,$E8,$C6,$0A   ;0EBA7C|        |0000C6;
                       db $D0,$F2,$C0,$00,$F0,$02,$38,$60   ;0EBA84|        |0EBA78;
                       db $18,$60,$98,$9D,$D8,$05,$C8,$A9   ;0EBA8C|        |      ;
                       db $0A,$9D,$4E,$05,$A9,$00,$9D,$65   ;0EBA94|        |      ;
                       db $05,$9D,$1D,$06,$F0,$DB           ;0EBA9C|        |00009D;
 
          CODE_0EBAA2: LDY.B r_pointerQueue                 ;0EBAA2|A408    |000008;
                       LDA.B r_hearts                       ;0EBAA4|A584    |000084;
                       CMP.W UNREACH_0EBAB6,Y               ;0EBAA6|D9B6BA  |0EBAB6;
                       RTS                                  ;0EBAA9|60      |      ;
 
                       db $E0,$14,$90,$FB,$A4,$08,$B9,$B6   ;0EBAAA|        |      ;
                       db $BA,$4C,$53,$E7                   ;0EBAB2|        |      ;
 
       UNREACH_0EBAB6: db $00,$01,$01,$01,$01,$01,$01,$01   ;0EBAB6|        |      ;
                       db $01,$01,$00,$05                   ;0EBABE|        |000001;
 
       UNREACH_0EBAC2: db $AD,$7A,$BB,$85,$08,$AD,$7B,$BB   ;0EBAC2|        |0EBB7A;
                       db $85,$09,$A0,$00,$B9,$6F,$BB,$C9   ;0EBACA|        |000009;
                       db $FF,$F0,$39,$DD,$65,$05,$F0,$04   ;0EBAD2|        |DD39F0;
                       db $C8,$C8,$D0,$F0,$C9,$46,$D0,$09   ;0EBADA|        |      ;
                       db $AD,$AA,$05,$C9,$0D,$D0,$02,$C8   ;0EBAE2|        |0E05AA;
                       db $C8,$B9,$70,$BB,$A8,$4C,$3F,$BB   ;0EBAEA|        |      ;
 
          CODE_0EBAF2: LDX.B #$00                           ;0EBAF2|A200    |      ;
                       DEC.W $057C,X                        ;0EBAF4|DE7C05  |0E057C;
                       BEQ CODE_0EBAFB                      ;0EBAF7|F002    |0EBAFB;
                       CLC                                  ;0EBAF9|18      |      ;
                       RTS                                  ;0EBAFA|60      |      ;
 
 
          CODE_0EBAFB: LDA.W $054E,X                        ;0EBAFB|BD4E05  |0E054E;
                       CMP.B #$02                           ;0EBAFE|C902    |      ;
                       BEQ UNREACH_0EBAC2                   ;0EBB00|F0C0    |0EBAC2;
                       ASL A                                ;0EBB02|0A      |      ;
                       TAY                                  ;0EBB03|A8      |      ;
                       LDA.W UNREACH_0EBB76,Y               ;0EBB04|B976BB  |0EBB76;
                       STA.B r_pointerQueue                 ;0EBB07|8508    |000008;
                       LDA.W UNREACH_0EBB77,Y               ;0EBB09|B977BB  |0EBB77;
                       STA.B $09                            ;0EBB0C|8509    |000009;
                       LDY.B #$00                           ;0EBB0E|A000    |      ;
 
          CODE_0EBB10: LDA.W UNREACH_0EBB64,Y               ;0EBB10|B964BB  |0EBB64;
                       CMP.B #$FF                           ;0EBB13|C9FF    |      ;
                       BEQ CODE_0EBB39                      ;0EBB15|F022    |0EBB39;
                       CMP.W $0565,X                        ;0EBB17|DD6505  |0E0565;
                       BEQ CODE_0EBB20                      ;0EBB1A|F004    |0EBB20;
                       INY                                  ;0EBB1C|C8      |      ;
                       INY                                  ;0EBB1D|C8      |      ;
                       BNE CODE_0EBB10                      ;0EBB1E|D0F0    |0EBB10;
 
          CODE_0EBB20: CMP.B #$24                           ;0EBB20|C924    |      ;
                       BNE CODE_0EBB3B                      ;0EBB22|D017    |0EBB3B;
                       LDA.W $04A8,X                        ;0EBB24|BDA804  |0E04A8;
                       BEQ CODE_0EBB32                      ;0EBB27|F009    |0EBB32;
                       LDA.W $05EF,X                        ;0EBB29|BDEF05  |0E05EF;
                       BEQ CODE_0EBB3B                      ;0EBB2C|F00D    |0EBB3B;
 
          CODE_0EBB2E: INY                                  ;0EBB2E|C8      |      ;
                       INY                                  ;0EBB2F|C8      |      ;
                       BNE CODE_0EBB3B                      ;0EBB30|D009    |0EBB3B;
 
          CODE_0EBB32: LDA.W $05EF,X                        ;0EBB32|BDEF05  |0E05EF;
                       BNE CODE_0EBB3B                      ;0EBB35|D004    |0EBB3B;
                       BEQ CODE_0EBB2E                      ;0EBB37|F0F5    |0EBB2E;
 
          CODE_0EBB39: LDY.B #$00                           ;0EBB39|A000    |      ;
 
          CODE_0EBB3B: LDA.W UNREACH_0EBB65,Y               ;0EBB3B|B965BB  |0EBB65;
                       TAY                                  ;0EBB3E|A8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0EBB3F|B108    |000008;
                       STA.B r_temp_Xpos                    ;0EBB41|850A    |00000A;
                       INY                                  ;0EBB43|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;0EBB44|B108    |000008;
                       STA.B $0B                            ;0EBB46|850B    |00000B;
                       LDY.W $0593,X                        ;0EBB48|BC9305  |0E0593;
                       LDA.B (r_temp_Xpos),Y                ;0EBB4B|B10A    |00000A;
                       CMP.B #$FF                           ;0EBB4D|C9FF    |      ;
                       BEQ CODE_0EBB62                      ;0EBB4F|F011    |0EBB62;
                       STA.W $0400,X                        ;0EBB51|9D0004  |0E0400;
                       INY                                  ;0EBB54|C8      |      ;
                       LDA.B (r_temp_Xpos),Y                ;0EBB55|B10A    |00000A;
                       STA.W $057C,X                        ;0EBB57|9D7C05  |0E057C;
                       INC.W $0593,X                        ;0EBB5A|FE9305  |0E0593;
                       INC.W $0593,X                        ;0EBB5D|FE9305  |0E0593;
                       CLC                                  ;0EBB60|18      |      ;
                       RTS                                  ;0EBB61|60      |      ;
 
 
          CODE_0EBB62: SEC                                  ;0EBB62|38      |      ;
                       RTS                                  ;0EBB63|60      |      ;
 
 
       UNREACH_0EBB64: db $20                               ;0EBB64|        |0E2200;
 
       UNREACH_0EBB65: db $00,$22,$00,$1C,$02,$24,$04,$24   ;0EBB65|        |      ;
                       db $06,$FF,$46,$08,$46,$0A,$48,$0C   ;0EBB6D|        |0000FF;
                       db $FF                               ;0EBB75|        |86BB7E;
 
       UNREACH_0EBB76: db $7E                               ;0EBB76|        |0E86BB;
 
       UNREACH_0EBB77: db $BB,$86,$BB,$8E,$BB,$9C,$BB,$A4   ;0EBB77|        |      ;
                       db $BB,$AB,$BB,$B2,$BB,$BB,$BB,$C4   ;0EBB7F|        |      ;
                       db $BB,$C9,$BB,$CE,$BB,$D5,$BB,$DC   ;0EBB87|        |      ;
                       db $BB,$E1,$BB,$E6,$BB,$ED,$BB,$F4   ;0EBB8F|        |      ;
                       db $BB,$FB,$BB,$02,$BC,$09,$BC,$10   ;0EBB97|        |      ;
                       db $BC,$17,$BC,$20,$BC,$18,$05,$1A   ;0EBB9F|        |0EBC17;
                       db $07,$1C,$09,$FF,$1E,$05,$20,$07   ;0EBBA7|        |00001C;
                       db $22,$09,$FF,$34,$05,$36,$07,$38   ;0EBBAF|        |34FF09;
                       db $09,$0A,$01,$FF,$3A,$05,$3C,$07   ;0EBBB7|        |      ;
                       db $3E,$09,$0C,$01,$FF,$34,$08,$2C   ;0EBBBF|        |0E0C09;
                       db $10,$FF,$36,$08,$2E,$10,$FF,$38   ;0EBBC7|        |0EBBC8;
                       db $08,$30,$10,$0A,$01,$FF,$3A,$08   ;0EBBCF|        |      ;
                       db $32,$10,$0C,$01,$FF,$24,$08,$26   ;0EBBD7|        |000010;
                       db $0D,$FF,$32,$08,$34,$0D,$FF,$2A   ;0EBBDF|        |0E32FF;
                       db $08,$2C,$0D,$0A,$01,$FF,$2E,$08   ;0EBBE7|        |      ;
                       db $30,$0D,$0C,$01,$FF,$18,$08,$1C   ;0EBBEF|        |0EBBFE;
                       db $0D,$18,$01,$FF,$36,$08,$3A,$0D   ;0EBBF7|        |0E0118;
                       db $36,$01,$FF,$1E,$08,$22,$0D,$1E   ;0EBBFF|        |000001;
                       db $01,$FF,$18,$08,$1A,$08,$1C,$08   ;0EBC07|        |0000FF;
                       db $FF,$1E,$08,$20,$08,$22,$08,$FF   ;0EBC0F|        |20081E;
                       db $18,$08,$1A,$08,$1C,$08,$0A,$01   ;0EBC17|        |      ;
                       db $FF,$18,$08,$1A,$08,$1C,$08,$0C   ;0EBC1F|        |1A0818;
                       db $01,$FF,$A5,$74,$F0,$01,$60,$E6   ;0EBC27|        |0000FF;
                       db $74,$A4,$32,$C0,$0E,$F0,$06,$B9   ;0EBC2F|        |0000A4;
                       db $45,$BC,$4C,$5F,$E2,$A5,$33,$C9   ;0EBC37|        |0000BC;
                       db $02,$D0,$F4,$C8,$D0,$F1,$4F,$53   ;0EBC3F|        |      ;
                       db $50,$56,$55,$51,$52,$57,$54,$58   ;0EBC47|        |0EBC9F;
                       db $59,$5A,$5B,$5C,$5D,$5E,$86,$B1   ;0EBC4F|        |0E5B5A;
                       db $8A,$38,$E9,$13,$C9,$04,$B0,$1B   ;0EBC57|        |      ;
                       db $A8,$D0,$08,$86,$B1,$E0,$13,$D0   ;0EBC5F|        |      ;
                       db $12,$A0,$00,$A2,$01,$BD,$8D,$06   ;0EBC67|        |0000A0;
                       db $39,$7D,$BC,$9D,$8D,$06,$E8,$E0   ;0EBC6F|        |0EBC7D;
                       db $13,$90,$F2,$A6,$B1,$60,$FE,$FD   ;0EBC77|        |000090;
                       db $FB,$F7,$A9,$01,$85,$10,$A2,$05   ;0EBC7F|        |      ;
                       db $D0,$06,$A9,$00,$85,$10,$A2,$13   ;0EBC87|        |0EBC8F;
                       db $A4,$10,$B9,$4E,$05,$85,$11,$B9   ;0EBC8F|        |000010;
                       db $65,$05,$85,$12,$B9,$A8,$04,$85   ;0EBC97|        |000005;
                       db $13,$B9,$38,$04,$85,$14,$B9,$1C   ;0EBC9F|        |0000B9;
                       db $04,$85,$15,$B9,$EF,$05,$85,$16   ;0EBCA7|        |000085;
                       db $BD,$65,$05,$D0,$44,$20,$62,$BC   ;0EBCAF|        |0E0565;
                       db $A5,$11,$C9,$01,$F0,$0A,$C9,$02   ;0EBCB7|        |000011;
                       db $D0,$0A,$A0,$80,$A9,$04,$D0,$08   ;0EBCBF|        |0EBCCB;
                       db $A9,$03,$D0,$02,$A5,$8E,$A0,$00   ;0EBCC7|        |      ;
                       db $8C,$83,$04,$9D,$4E,$05,$A9,$00   ;0EBCCF|        |0E0483;
                       db $9D,$93,$05,$9D,$54,$04,$9D,$00   ;0EBCD7|        |0E0593;
                       db $04,$A9,$01,$9D,$7C,$05,$A4,$10   ;0EBCDF|        |0000A9;
                       db $B9,$8C,$04,$9D,$8C,$04,$B9,$A8   ;0EBCE7|        |0E048C;
                       db $04,$9D,$A8,$04,$FE,$65,$05,$18   ;0EBCEF|        |00009D;
                       db $60,$BD,$4E,$05,$C9,$01,$F0,$04   ;0EBCF7|        |      ;
 
                       db $C9,$02,$D0,$07,$A5,$1A,$29,$03   ;0EBCFF|        |      ;
                       db $9D,$54,$04,$A5,$11,$0A,$A8,$B9   ;0EBD07|        |0E0454;
                       db $DA,$BD,$85,$0C,$B9,$DB,$BD,$85   ;0EBD0F|        |      ;
                       db $0D,$A5,$14,$9D,$38,$04,$A5,$15   ;0EBD17|        |0E14A5;
                       db $A4,$12,$C0,$1C,$D0,$03,$18,$69   ;0EBD1F|        |000012;
                       db $08,$9D,$1C,$04,$A0,$00,$B1,$0C   ;0EBD27|        |      ;
                       db $C9,$FF,$D0,$03,$4C,$C6,$BD,$C5   ;0EBD2F|        |      ;
                       db $12,$F0,$04,$C8,$C8,$D0,$EF,$C9   ;0EBD37|        |0000F0;
                       db $1E,$D0,$12,$A5,$13,$F0,$08,$A5   ;0EBD3F|        |0E12D0;
                       db $16,$F0,$0A,$C8,$C8,$D0,$06,$A5   ;0EBD47|        |0000F0;
                       db $16,$D0,$02,$C8,$C8,$C8,$B1,$0C   ;0EBD4F|        |0000D0;
                       db $A8,$B9,$01,$BE,$85,$08,$B9,$02   ;0EBD57|        |      ;
                       db $BE,$85,$09,$DE,$7C,$05,$F0,$02   ;0EBD5F|        |0E0985;
                       db $18,$60,$BD,$93,$05,$85,$0F,$0A   ;0EBD67|        |      ;
                       db $18,$65,$0F,$A8,$B1,$08,$C9,$FF   ;0EBD6F|        |      ;
                       db $F0,$4D,$84,$00,$A4,$10,$99,$00   ;0EBD77|        |0EBDC6;
                       db $04,$A4,$00,$C8,$B1,$08,$9D,$7C   ;0EBD7F|        |0000A4;
                       db $05,$C8,$A5,$13,$F0,$08,$A9,$00   ;0EBD87|        |0000C8;
                       db $38,$F1,$08,$4C,$97,$BD,$B1,$08   ;0EBD8F|        |      ;
                       db $18,$65,$14,$A4,$10,$99,$38,$04   ;0EBD97|        |      ;
                       db $BD,$4E,$05,$F0,$2C,$0A,$A8,$B9   ;0EBD9F|        |0E054E;
                       db $91,$BE,$85,$08,$B9,$92,$BE,$85   ;0EBDA7|        |0000BE;
                       db $09,$A5,$0F,$0A,$A8,$B1,$08,$9D   ;0EBDAF|        |      ;
                       db $00,$04,$C8,$B1,$08,$9D,$1D,$06   ;0EBDB7|        |      ;
                       db $FE,$93,$05,$18,$60               ;0EBDBF|        |0E0593;
 
          CODE_0EBDC4: LDX.B #$13                           ;0EBDC4|A213    |      ;
                       LDA.B #$00                           ;0EBDC6|A900    |      ;
                       STA.W $0400,X                        ;0EBDC8|9D0004  |0E0400;
                       STA.W $061D,X                        ;0EBDCB|9D1D06  |0E061D;
                       SEC                                  ;0EBDCE|38      |      ;
                       RTS                                  ;0EBDCF|60      |      ;
 
                       db $A4,$12,$C0,$1C,$D0,$CE,$A9,$05   ;0EBDD0|        |000012;
                       db $D0,$CA,$E0,$BD,$EB,$BD,$F6,$BD   ;0EBDD8|        |0EBDA4;
                       db $18,$00,$1A,$00,$1C,$02,$1E,$04   ;0EBDE0|        |      ;
                       db $1E,$06,$FF,$18,$08,$1A,$08,$1C   ;0EBDE8|        |0EFF06;
                       db $0A,$1E,$0C,$1E,$0E,$FF,$18,$10   ;0EBDF0|        |      ;
                       db $1A,$10,$1C,$12,$1E,$14,$1E,$16   ;0EBDF8|        |      ;
                       db $FF,$19,$BE,$23,$BE,$2D,$BE,$3A   ;0EBE00|        |23BE19;
                       db $BE,$47,$BE,$4E,$BE,$55,$BE,$5F   ;0EBE08|        |0EBE47;
                       db $BE,$69,$BE,$73,$BE,$7D,$BE,$87   ;0EBE10|        |0EBE69;
                       db $BE,$18,$05,$00,$1A,$07,$00,$1C   ;0EBE18|        |0E0518;
                       db $09,$00,$FF,$1E,$05,$00,$20,$07   ;0EBE20|        |      ;
                       db $00,$22,$09,$00,$FF,$34,$05,$00   ;0EBE28|        |      ;
                       db $36,$07,$00,$38,$09,$00,$0A,$01   ;0EBE30|        |000007;
                       db $00,$FF,$3A,$05,$00,$3C,$07,$00   ;0EBE38|        |      ;
                       db $3E,$09,$00,$0C,$01,$00,$FF,$18   ;0EBE40|        |0E0009;
                       db $05,$00,$1A,$09,$00,$FF,$1C,$05   ;0EBE48|        |000000;
                       db $00,$1E,$09,$00,$FF,$24,$05,$00   ;0EBE50|        |      ;
                       db $26,$09,$00,$0A,$01,$00,$FF,$28   ;0EBE58|        |000009;
                       db $05,$00,$2A,$09,$00,$0C,$01,$00   ;0EBE60|        |000000;
                       db $FF,$28,$03,$00,$44,$09,$00,$28   ;0EBE68|        |000328;
                       db $02,$00,$FF,$46,$03,$00,$4A,$09   ;0EBE70|        |      ;
                       db $00,$46,$02,$00,$FF,$50,$03,$00   ;0EBE78|        |      ;
                       db $52,$09,$00,$50,$02,$00,$FF,$4C   ;0EBE80|        |000009;
                       db $03,$00,$4E,$09,$00,$4C,$02,$00   ;0EBE88|        |000000;
                       db $FF,$A5,$BE,$AD,$BE,$B5,$BE,$BD   ;0EBE90|        |ADBEA5;
                       db $BE,$9D,$BE,$C3,$BE,$00,$00,$02   ;0EBE98|        |0EBE9D;
                       db $40,$00,$00,$00,$00,$24,$00,$26   ;0EBEA0|        |      ;
                       db $00,$28,$40,$00,$00,$2C,$00,$2E   ;0EBEA8|        |      ;
                       db $00,$30,$60,$00,$00,$2C,$00,$2E   ;0EBEB0|        |      ;
                       db $00,$32,$60,$00,$00,$20,$00,$22   ;0EBEB8|        |      ;
                       db $40,$00,$00,$2A,$00,$26,$00,$28   ;0EBEC0|        |      ;
 
                       db $40,$00,$00,$AD,$4E,$05,$0A,$A8   ;0EBEC8|        |      ;
 
                       db $AD,$DA,$BD,$85,$0C,$B9,$DB,$BD   ;0EBED0|        |0EBDDA;
                       db $85,$0D,$A0,$01,$B1,$0C,$A8,$B9   ;0EBED8|        |00000D;
                       db $01,$BE,$85,$08,$B9,$02,$BE,$85   ;0EBEE0|        |0000BE;
                       db $09,$AC,$A6,$05,$88,$30,$0D,$98   ;0EBEE8|        |      ;
                       db $85,$0F,$0A,$18,$65,$0F,$A8,$B1   ;0EBEF0|        |00000F;
                       db $08,$8D,$00,$04,$60,$21,$02,$00   ;0EBEF8|        |      ;
                       db $00,$00,$02,$BF,$A2,$01,$12,$0A   ;0EBF00|        |      ;
                       db $74,$72,$00,$12,$04,$B0,$80,$00   ;0EBF08|        |000072;
                       db $0E,$0C,$10,$A0,$00,$FF,$41,$20   ;0EBF10|        |0E100C;
                       db $01,$01,$02,$2C,$30,$60,$00,$02   ;0EBF18|        |000001;
                       db $4A,$10,$44,$00,$02,$4A,$24,$34   ;0EBF20|        |      ;
                       db $00,$02,$4A,$3C,$34,$00,$02,$4A   ;0EBF28|        |      ;
                       db $50,$44,$00,$02,$4A,$58,$58,$00   ;0EBF30|        |0EBF76;
                       db $08,$8C,$A8,$40,$01,$08,$8E,$C8   ;0EBF38|        |      ;
                       db $70,$01,$0E,$04,$90,$48,$01,$0E   ;0EBF40|        |0EBF43;
                       db $04,$D0,$48,$01,$FF,$11,$01,$00   ;0EBF48|        |0000D0;
                       db $02,$04,$1C,$D8,$42,$00,$00,$4E   ;0EBF50|        |      ;
                       db $A4,$42,$01,$08,$B6,$5F,$40,$00   ;0EBF58|        |000042;
                       db $0C,$3C,$5B,$B6,$01,$0C,$3A,$46   ;0EBF60|        |0E5B3C;
                       db $9C,$01,$0C,$36,$26,$8E,$01,$0C   ;0EBF68|        |0E0C01;
                       db $38,$08,$93,$00,$FF,$81,$03,$01   ;0EBF70|        |      ;
                       db $03,$06,$36,$1D,$75,$00,$08,$46   ;0EBF78|        |000006;
                       db $56,$49,$01,$08,$46,$63,$71,$01   ;0EBF80|        |000049;
                       db $08,$44,$D0,$90,$01,$FF,$B1,$02   ;0EBF88|        |      ;
                       db $00,$00,$00,$02,$B0,$A0,$01,$08   ;0EBF90|        |      ;
                       db $32,$48,$50,$00,$0E,$38,$70,$4C   ;0EBF98|        |000048;
                       db $00,$0E,$04,$58,$7C,$01,$0E,$04   ;0EBFA0|        |      ;
                       db $C0,$38,$01,$FF,$FF,$FF,$FF,$FF   ;0EBFA8|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFB0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFB8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFC0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFC8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFD0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFD8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFE0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFE8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFF0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;0EBFF8|        |FFFFFF;
