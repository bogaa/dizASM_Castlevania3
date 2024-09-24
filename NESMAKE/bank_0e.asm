 
 
 
              bank_9c: db $9C                               ;0E8000|        |      ; NES PRG 38000
 
          CODE_0E8001: LDA.B r_CogSize                      ;0E8001|A595    |000095;
                       ASL A                                ;0E8003|0A      |      ;
                       ASL A                                ;0E8004|0A      |      ;
                       TAY                                  ;0E8005|A8      |      ;
                       LDA.W PTR16_0E8846,Y                 ;0E8006|B94688  |0E8846;
                       STA.B r_pointerQueue_VRAM            ;0E8009|8508    |000008;
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
                       SBC.B (r_pointerQueue_VRAM),Y        ;0E8025|F108    |000008;
                       STA.W $0509                          ;0E8027|8D0905  |0E0509;
                       LDA.W $04F2                          ;0E802A|ADF204  |0E04F2;
                       SBC.B #$00                           ;0E802D|E900    |      ;
                       STA.W $04F2                          ;0E802F|8DF204  |0E04F2;
                       JMP.W CODE_0E8047                    ;0E8032|4C4780  |0E8047;
 
 
          CODE_0E8035: TAY                                  ;0E8035|A8      |      ;
                       LDA.W $0509                          ;0E8036|AD0905  |0E0509;
                       CLC                                  ;0E8039|18      |      ;
                       ADC.B (r_pointerQueue_VRAM),Y        ;0E803A|7108    |000008;
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
                       LDA.B r_gameLoadState                ;0E813D|A52A    |00002A;
                       STA.B $9F                            ;0E813F|859F    |00009F;
                       LDA.B #$19                           ;0E8141|A919    |      ;
                       STA.B r_gameLoadState                ;0E8143|852A    |00002A;
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
                       STA.B r_gameLoadState                ;0E8188|852A    |00002A;
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
                       LDA.W DATA8_0E8298,Y                 ;0E81AE|B99882  |0E8298;
                       STA.B r_pointerQueue_VRAM            ;0E81B1|8508    |000008;
                       LDA.W DATA8_0E8299,Y                 ;0E81B3|B99982  |0E8299;
                       STA.B $09                            ;0E81B6|8509    |000009;
                       LDY.B #$00                           ;0E81B8|A000    |      ;
 
          CODE_0E81BA: LDA.B (r_pointerQueue_VRAM),Y        ;0E81BA|B108    |000008;
                       BMI CODE_0E8208                      ;0E81BC|304A    |0E8208;
                       CMP.W $0565                          ;0E81BE|CD6505  |0E0565;
                       BEQ CODE_0E81C7                      ;0E81C1|F004    |0E81C7;
                       INY                                  ;0E81C3|C8      |      ;
                       INY                                  ;0E81C4|C8      |      ;
                       BNE CODE_0E81BA                      ;0E81C5|D0F3    |0E81BA;
 
          CODE_0E81C7: INY                                  ;0E81C7|C8      |      ;
                       LDA.B (r_pointerQueue_VRAM),Y        ;0E81C8|B108    |000008;
                       BEQ CODE_0E8153                      ;0E81CA|F087    |0E8153;
                       JSR.W CODE_0E8263                    ;0E81CC|206382  |0E8263;
                       BEQ CODE_0E820B                      ;0E81CF|F03A    |0E820B;
                       LDY.W $054E                          ;0E81D1|AC4E05  |0E054E;
                       LDA.W DATA8_0E8294,Y                 ;0E81D4|B99482  |0E8294;
                       db $20                               ;0E81D7|        |      ;
                       dw CODE_0FE25F                       ;0E81D8|        |0FE25F;
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
                       dw CODE_0FE25F                       ;0E8203|        |0FE25F;
                       JMP.W CODE_0E8CF9                    ;0E8205|4CF98C  |0E8CF9;
 
 
          CODE_0E8208: JSR.W CODE_0E8263                    ;0E8208|206382  |0E8263;
 
          CODE_0E820B: LDY.W $054E                          ;0E820B|AC4E05  |0E054E;
                       LDA.W DATA8_0E8294,Y                 ;0E820E|B99482  |0E8294;
                       db $20                               ;0E8211|        |      ;
                       dw CODE_0FE25F                       ;0E8212|        |0FE25F;
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
                       LDA.W DATA8_0E82E4,Y                 ;0E8268|B9E482  |0E82E4;
                       STA.B r_pointerQueue_VRAM            ;0E826B|8508    |000008;
                       LDA.W DATA8_0E82E5,Y                 ;0E826D|B9E582  |0E82E5;
                       STA.B $09                            ;0E8270|8509    |000009;
                       LDA.B r_damagePlayer                 ;0E8272|A581    |000081;
                       LSR A                                ;0E8274|4A      |      ;
                       LSR A                                ;0E8275|4A      |      ;
                       LSR A                                ;0E8276|4A      |      ;
                       LSR A                                ;0E8277|4A      |      ;
                       CMP.B #$0F                           ;0E8278|C90F    |      ;
                       BEQ CODE_0E828E                      ;0E827A|F012    |0E828E;
                       TAY                                  ;0E827C|A8      |      ;
                       LDA.B (r_pointerQueue_VRAM),Y        ;0E827D|B108    |000008;
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
 
         DATA8_0E8298: db $A0                               ;0E8298|        |      ;
 
         DATA8_0E8299: db $82,$AF,$82,$BE,$82               ;0E8299|        |      ;
                       db $CD,$82,$10,$01,$12               ;0E829E|        |      ;
                       db $01,$14,$01,$1E,$01               ;0E82A3|        |      ;
                       db $24,$01,$16,$00,$26               ;0E82A8|        |      ;
                       db $00,$FF,$10,$01,$12               ;0E82AD|        |      ;
                       db $01,$14,$01,$1E,$01               ;0E82B2|        |      ;
                       db $24,$01,$16,$00,$26               ;0E82B7|        |      ;
                       db $00,$FF,$10,$01,$12               ;0E82BC|        |      ;
                       db $01,$14,$01,$1E,$01               ;0E82C1|        |      ;
                       db $24,$01,$16,$00,$26               ;0E82C6|        |      ;
                       db $00,$FF,$10,$01,$12               ;0E82CB|        |      ;
                       db $01,$14,$01,$1E,$01               ;0E82D0|        |      ;
                       db $24,$01,$16,$00,$26               ;0E82D5|        |      ;
                       db $00,$30,$00,$32,$00               ;0E82DA|        |      ;
                       db $3C,$00,$3E,$00,$FF               ;0E82DF|        |      ;
 
         DATA8_0E82E4: db $EC                               ;0E82E4|        |      ;
 
         DATA8_0E82E5: db $82,$FC,$82,$FC,$82               ;0E82E5|        |      ;
                       db $EC,$82,$00,$01,$02               ;0E82EA|        |      ;
                       db $03,$04,$05,$06,$07               ;0E82EF|        |      ;
                       db $08,$09,$0A,$0B,$0C               ;0E82F4|        |      ;
                       db $0D,$0E,$0F,$00,$02               ;0E82F9|        |      ;
                       db $03,$04,$05,$06,$07               ;0E82FE|        |      ;
                       db $08,$09,$0A,$0C,$0C               ;0E8303|        |      ;
                       db $0D,$0E,$0F,$0F                   ;0E8308|        |      ;
 
         DATA8_0E830C: db $00,$08,$0C,$10,$14               ;0E830C|        |      ;
                       db $18,$1C,$20,$24,$28               ;0E8311|        |      ;
                       db $2C,$30,$34,$38,$3C               ;0E8316|        |      ;
                       db $40                               ;0E831B|        |      ;
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
 
          CODE_0E8356: STA.B r_pointerQueue_VRAM            ;0E8356|8508    |000008;
                       LDX.B #$F0                           ;0E8358|A2F0    |      ;
                       db $20                               ;0E835A|        |      ;
                       dw CODE_0FFCDD                       ;0E835B|        |0FFCDD;
                       BNE CODE_0E8368                      ;0E835D|D009    |0E8368;
                       LDA.B r_pointerQueue_VRAM            ;0E835F|A508    |000008;
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
 
                       LDA.B r_invincableFrames             ;0E83AA|A580    |000080;
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
                       LDX.B r_pointerQueue_VRAM            ;0E83E2|A608    |000008;
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
 
          CODE_0E8423: STX.B r_pointerQueue_VRAM            ;0E8423|8608    |000008;
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
 
          CODE_0E8461: LDX.B r_pointerQueue_VRAM            ;0E8461|A608    |000008;
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
 
 
          CODE_0E8490: LDA.B r_gameLoadState                ;0E8490|A52A    |00002A;
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
 
 
          CODE_0E84AA: LDA.B r_gameLoadState                ;0E84AA|A52A    |00002A;
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
 
 
          CODE_0E84C0: LDX.B r_pointerQueue_VRAM            ;0E84C0|A608    |000008;
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
 
 
          CODE_0E84E0: LDX.B r_pointerQueue_VRAM            ;0E84E0|A608    |000008;
                       LDA.B #$05                           ;0E84E2|A905    |      ;
                       db $20                               ;0E84E4|        |      ;
                       dw CODE_0FFCDD                       ;0E84E5|        |0FFCDD;
                       BNE CODE_0E84F9                      ;0E84E7|D010    |0E84F9;
                       LDX.B r_pointerQueue_VRAM            ;0E84E9|A608    |000008;
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
 
                       JSR.W CODE_0E852D                    ;0E8529|202D85  |0E852D;
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
 
 
         DATA8_0E8561: db $0E,$10,$12,$14,$1E               ;0E8561|        |      ;
                       db $24,$FF                           ;0E8566|        |      ;
 
         DATA8_0E8568: db $40                               ;0E8568|        |      ;
 
 
         DATA8_0E8569: db $A5,$80,$C5,$20,$60               ;0E8569|        |      ;
                       db $B0,$E0,$A5,$68,$C9               ;0E856E|        |      ;
                       db $82,$B0,$01,$60                   ;0E8573|        |      ;
                       LDA.W $041C                          ;0E8577|AD1C04  |0E041C;
                       CLC                                  ;0E857A|18      |      ;
                       ADC.B r_scrollSpd                    ;0E857B|656E    |00006E;
                       STA.W $041C                          ;0E857D|8D1C04  |0E041C;
                       LDA.B r_GrantCurrentYpos             ;0E8580|A5D3    |0000D3;
                       CLC                                  ;0E8582|18      |      ;
                       ADC.B r_scrollSpd                    ;0E8583|656E    |00006E;
                       STA.B r_GrantCurrentYpos             ;0E8585|85D3    |0000D3;
                       RTS                                  ;0E8587|60      |      ;
 
                       LDA.B r_roomOrientation              ;0E8588|A568    |000068;
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
 
                       LDA.B #$00                           ;0E85B8|A900    |      ;
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
 
         DATA8_0E861B: db $D0,$E8,$D0,$EC,$28               ;0E861B|        |      ;
                       db $15,$28,$19,$D3,$E8               ;0E8620|        |      ;
                       db $D3,$F3,$33,$0D,$33               ;0E8625|        |      ;
                       db $11,$D0,$F0,$D0,$EB               ;0E862A|        |      ;
                       db $28,$15,$28                       ;0E862F|        |      ;
 
            data_yPos: db $00,$00,$04,$00                   ;0E8632|        |      ;
 
          CODE_0E8636: LDA.B r_sceneScrollOffsetLo          ;0E8636|A556    |000056;
                       BEQ CODE_0E866F                      ;0E8638|F035    |0E866F;
                       CLC                                  ;0E863A|18      |      ;
                       ADC.W $0438                          ;0E863B|6D3804  |0E0438;
                       STA.W $0438                          ;0E863E|8D3804  |0E0438;
                       RTS                                  ;0E8641|60      |      ;
 
                       LDA.B r_roomOrientation              ;0E8642|A568    |000068;
                       BMI CODE_0E8636                      ;0E8644|30F0    |0E8636;
                       LDA.W $0438                          ;0E8646|AD3804  |0E0438;
                       BMI CODE_0E867A                      ;0E8649|302F    |0E867A;
                       LDA.B r_sceneScrollOffsetLo          ;0E864B|A556    |000056;
                       ORA.B r_sceneScrollOffsetHi          ;0E864D|0557    |000057;
                       BEQ CODE_0E8679                      ;0E864F|F028    |0E8679;
                       LDA.B #$80                           ;0E8651|A980    |      ;
                       SEC                                  ;0E8653|38      |      ;
                       SBC.W $0438                          ;0E8654|ED3804  |0E0438;
                       STA.B r_pointerQueue_VRAM            ;0E8657|8508    |000008;
                       LDA.B r_sceneScrollOffsetLo          ;0E8659|A556    |000056;
                       SEC                                  ;0E865B|38      |      ;
                       SBC.B r_pointerQueue_VRAM            ;0E865C|E508    |000008;
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
                       STA.B r_pointerQueue_VRAM            ;0E8688|8508    |000008;
                       LDA.B r_sceneScrollOffsetLo          ;0E868A|A556    |000056;
                       CLC                                  ;0E868C|18      |      ;
                       ADC.B r_pointerQueue_VRAM            ;0E868D|6508    |000008;
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
                       dw UNREACH_0FE69A                    ;0E879E|        |0FE69A;
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
 
         DATA8_0E87E4: db $FF,$FF,$FF,$FF,$FF               ;0E87E4|        |      ;
                       db $FF,$FF,$FF,$FC,$FC               ;0E87E9|        |      ;
                       db $FC,$FC,$FC,$FC,$F8               ;0E87EE|        |      ;
                       db $F8,$F8,$F8,$F4,$F4               ;0E87F3|        |      ;
                       db $F4,$F0,$F0,$F0,$EC               ;0E87F8|        |      ;
                       db $EC,$E8,$E8,$E8,$E4               ;0E87FD|        |      ;
                       db $E4,$E0,$DC,$DC,$D8               ;0E8802|        |      ;
                       db $D8,$D4,$D0,$CC,$CC               ;0E8807|        |      ;
                       db $C8,$C4,$C0,$BC,$B8               ;0E880C|        |      ;
                       db $B8,$B0,$AC,$A8,$A4               ;0E8811|        |      ;
                       db $A0,$9C,$94,$90,$88               ;0E8816|        |      ;
                       db $84,$7C,$74,$6C,$64               ;0E881B|        |      ;
                       db $58,$4C,$40,$2C,$00               ;0E8820|        |      ;
 
         DATA8_0E8825: db $FF,$FF,$FF,$FE,$FD               ;0E8825|        |      ;
                       db $FC,$FA,$F9,$F7,$F5               ;0E882A|        |      ;
                       db $F2,$F0,$EC,$E9,$E5               ;0E882F|        |      ;
                       db $E1,$DD,$D8,$D3,$CD               ;0E8834|        |      ;
                       db $C7,$C1,$B9,$B1,$A9               ;0E8839|        |      ;
                       db $9F,$95,$89,$7B,$6C               ;0E883E|        |      ;
                       db $59,$40,$00                       ;0E8843|        |      ;
 
         PTR16_0E8846: dw DATA8_0E884E                      ;0E8846|        |0E884E;
 
         PTR16_0E8848: dw DATA8_0E886F                      ;0E8848|        |0E886F;
                       dw DATA8_0E8890                      ;0E884A|        |0E8890;
                       dw DATA8_0E88D1                      ;0E884C|        |0E88D1;
 
         DATA8_0E884E: db $00,$08,$10,$18,$20               ;0E884E|        |      ;
                       db $28,$2F,$37,$3E,$45               ;0E8853|        |      ;
                       db $4C,$53,$59,$5F,$65               ;0E8858|        |      ;
                       db $6A,$6F,$73,$77,$7A               ;0E885D|        |      ;
                       db $7D,$7F,$80,$80,$7F               ;0E8862|        |      ;
                       db $7D,$79,$74,$6C,$62               ;0E8867|        |      ;
                       db $54,$3E,$00                       ;0E886C|        |      ;
 
         DATA8_0E886F: db $00,$00,$01,$02,$04               ;0E886F|        |      ;
                       db $06,$09,$0C,$10,$14               ;0E8874|        |      ;
                       db $19,$1E,$24,$2A,$31               ;0E8879|        |      ;
                       db $38,$40,$48,$51,$5A               ;0E887E|        |      ;
                       db $64,$6E,$79,$84,$90               ;0E8883|        |      ;
                       db $9C,$A9,$B6,$C4,$D2               ;0E8888|        |      ;
                       db $E1,$F0,$FF                       ;0E888D|        |      ;
 
         DATA8_0E8890: db $00,$06,$0C,$12,$18               ;0E8890|        |      ;
                       db $1E,$24,$2A,$30,$35               ;0E8895|        |      ;
                       db $3B,$41,$47,$4C,$52               ;0E889A|        |      ;
                       db $57,$5D,$62,$68,$6D               ;0E889F|        |      ;
                       db $72,$77,$7C,$81,$85               ;0E88A4|        |      ;
                       db $8A,$8F,$93,$97,$9B               ;0E88A9|        |      ;
                       db $9F,$A3,$A6,$AA,$AD               ;0E88AE|        |      ;
                       db $B0,$B3,$B5,$B7,$BA               ;0E88B3|        |      ;
                       db $BB,$BD,$BE,$BF,$C0               ;0E88B8|        |      ;
                       db $C0,$C0,$BF,$BE,$BD               ;0E88BD|        |      ;
                       db $BB,$B9,$B6,$B2,$AE               ;0E88C2|        |      ;
                       db $A9,$A3,$9C,$93,$89               ;0E88C7|        |      ;
                       db $7D,$6F,$5C,$43,$00               ;0E88CC|        |      ;
 
         DATA8_0E88D1: db $00,$00,$00,$01,$02               ;0E88D1|        |      ;
                       db $02,$03,$05,$06,$08               ;0E88D6|        |      ;
                       db $09,$0B,$0E,$10,$12               ;0E88DB|        |      ;
                       db $15,$18,$1B,$1E,$22               ;0E88E0|        |      ;
                       db $26,$29,$2D,$32,$36               ;0E88E5|        |      ;
                       db $3B,$3F,$44,$4A,$4F               ;0E88EA|        |      ;
                       db $54,$5A,$60,$66,$6C               ;0E88EF|        |      ;
                       db $73,$7A,$80,$87,$8F               ;0E88F4|        |      ;
                       db $96,$9E,$A5,$AD,$B6               ;0E88F9|        |      ;
                       db $BE,$C6,$CF,$D8,$E1               ;0E88FE|        |      ;
                       db $EA,$F4,$FE,$FF,$FF               ;0E8903|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0E8908|        |      ;
                       db $FF,$FF,$FF,$FF,$FF               ;0E890D|        |      ;
 
         DATA8_0E8912: db $00                               ;0E8912|        |      ;
 
         DATA8_0E8913: db $01,$00,$01,$10,$01               ;0E8913|        |      ;
                       db $20,$01,$20,$01,$30               ;0E8918|        |      ;
                       db $01,$40,$01,$40,$01               ;0E891D|        |      ;
                       db $50,$01,$60,$01,$70               ;0E8922|        |      ;
                       db $01,$70,$01,$80,$01               ;0E8927|        |      ;
 
         DATA8_0E892C: db $00,$04,$08,$0C,$10               ;0E892C|        |      ;
                       db $14,$18,$1C,$20,$24               ;0E8931|        |      ;
                       db $28,$2C,$30,$34,$38               ;0E8936|        |      ;
                       db $3C,$40,$44,$48,$4C               ;0E893B|        |      ;
                       db $50,$54,$58,$5C,$60               ;0E8940|        |      ;
                       db $64,$68,$6C,$70,$74               ;0E8945|        |      ;
                       db $78,$7C,$80                       ;0E894A|        |      ;
 
         DATA8_0E894D: db $00,$00,$00,$01,$02               ;0E894D|        |      ;
                       db $02,$04,$05,$06,$08               ;0E8952|        |      ;
                       db $0A,$0C,$0F,$11,$14               ;0E8957|        |      ;
                       db $17,$1B,$1E,$22,$26               ;0E895C|        |      ;
                       db $2B,$30,$35,$3A,$40               ;0E8961|        |      ;
                       db $47,$4D,$54,$5C,$64               ;0E8966|        |      ;
                       db $6D,$76,$80                       ;0E896B|        |      ;
 
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
                       dw CODE_0FE25F                       ;0E8A34|        |0FE25F;
 
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
                       dw CODE_0FE25F                       ;0E8A57|        |0FE25F;
 
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
                       dw CODE_0FE25F                       ;0E8B0D|        |0FE25F;
                       db $20                               ;0E8B0F|        |      ;
                       dw UNREACH_0FE5CE                    ;0E8B10|        |0FE5CE;
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
 
         DATA8_0E8B4F: db $06,$F9,$0A,$FC,$04               ;0E8B4F|        |      ;
                       db $FF,$04,$FC                       ;0E8B54|        |      ;
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
                       dw CODE_0FE25F                       ;0E8B9F|        |0FE25F;
                       db $20                               ;0E8BA1|        |      ;
                       dw UNREACH_0FE5CE                    ;0E8BA2|        |0FE5CE;
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
 
                       dw UNREACH_0FE5CA                    ;0E8BBE|        |0FE5CA;
 
          CODE_0E8BC0: LDA.B r_deathDelay                   ;0E8BC0|A5BF    |0000BF;
                       BEQ CODE_0E8BC5                      ;0E8BC2|F001    |0E8BC5;
 
          CODE_0E8BC4: RTS                                  ;0E8BC4|60      |      ;
 
 
          CODE_0E8BC5: LDA.B r_gameLoadState                ;0E8BC5|A52A    |00002A;
                       CMP.B #$10                           ;0E8BC7|C910    |      ;
                       BEQ CODE_0E8BC4                      ;0E8BC9|F0F9    |0E8BC4;
                       LDA.B r_roomEffect                   ;0E8BCB|A57D    |00007D;
                       AND.B #$F0                           ;0E8BCD|29F0    |      ;
                       CMP.B #$50                           ;0E8BCF|C950    |      ;
                       BEQ CODE_0E8BFC                      ;0E8BD1|F029    |0E8BFC;
                       CMP.B #$60                           ;0E8BD3|C960    |      ;
                       BEQ UNREACH_0E8C1E                   ;0E8BD5|F047    |0E8C1E;
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
                       LDA.B r_currPartnerID                ;0E8C09|A582    |000082;
                       CMP.B #$08                           ;0E8C0B|C908    |      ;
                       BNE UNREACH_0E8C18                   ;0E8C0D|D009    |0E8C18;
                       LDA.B r_gameStateLoopCounter         ;0E8C0F|A51A    |00001A;
                       AND.B #$03                           ;0E8C11|2903    |      ;
                       BNE CODE_0E8BDB                      ;0E8C13|D0C6    |0E8BDB;
                       JMP.W CODE_0E8C58                    ;0E8C15|4C588C  |0E8C58;
 
 
       UNREACH_0E8C18: db $20,$58,$8C,$4C,$F9               ;0E8C18|        |0E8C58;
                       db $8C                               ;0E8C1D|        |0E7DA5;
 
       UNREACH_0E8C1E: db $A5,$7D,$29,$0F,$D0               ;0E8C1E|        |00007D;
                       db $B7,$AD,$1C,$04,$C9               ;0E8C23|        |0000AD;
                       db $C0,$90,$D0,$AD,$38               ;0E8C28|        |      ;
                       db $04,$18,$65,$56,$85               ;0E8C2D|        |000018;
                       db $0A,$A5,$57,$69,$00               ;0E8C32|        |      ;
                       db $85,$0B,$C9,$01,$90               ;0E8C37|        |00000B;
                       db $CC,$D0,$09,$A5,$0A               ;0E8C3C|        |0E09D0;
                       db $C9,$20,$90,$C4,$4C               ;0E8C41|        |      ;
                       db $DB,$8B,$C9,$02,$90               ;0E8C46|        |      ;
                       db $8F,$D0,$BB,$A5,$0A               ;0E8C4B|        |A5BBD0;
                       db $C9,$C0,$90,$87,$B0               ;0E8C50|        |      ;
                       db $B3                               ;0E8C55|        |0000B0;
 
          yPos_data01: db $B0,$D0                           ;0E8C56|        |      ;
 
          CODE_0E8C58: LDA.B #$23                           ;0E8C58|A923    |      ;
                       db $20                               ;0E8C5A|        |      ;
                       dw CODE_0FE25F                       ;0E8C5B|        |0FE25F;
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
 
 
         DATA8_0E8CBD: db $00,$03,$04,$05,$01               ;0E8CBD|        |      ;
                       db $02,$02,$05,$01,$06               ;0E8CC2|        |      ;
                       db $03,$04                           ;0E8CC7|        |      ;
 
         DATA8_0E8CC9: db $08                               ;0E8CC9|        |      ;
 
           yPosData03: db $02                               ;0E8CCA|        |      ;
 
         DATA8_0E8CCB: db $01                               ;0E8CCB|        |      ;
 
       UNREACH_0E8CCC: db $00                               ;0E8CCC|        |      ;
 
       UNREACH_0E8CCD: db $FD                               ;0E8CCD|        |0E04C0;
 
       UNREACH_0E8CCE: db $C0,$04,$00,$00,$80               ;0E8CCE|        |      ;
                       db $FE,$80,$F8,$FC,$FF               ;0E8CD3|        |0EF880;
                       db $40,$FF,$40,$08,$02               ;0E8CD8|        |      ;
                       db $FE,$20,$FE,$C0,$FC               ;0E8CDD|        |0EFE20;
                       db $00,$01,$80,$FF,$80               ;0E8CE2|        |      ;
                       db $FD,$02,$FF,$00,$FD               ;0E8CE7|        |0EFF02;
                       db $80,$02,$FE,$01,$40               ;0E8CEC|        |0E8CF0;
 
                       db $FE,$C0,$FF,$02,$02               ;0E8CF1|        |0EFFC0;
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
 
 
          CODE_0E8D13: LDA.B r_gameLoadState                ;0E8D13|A52A    |00002A;
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
                       dw CODE_0FE25F                       ;0E8D32|        |0FE25F;
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
                       dw CODE_0FE25F                       ;0E8D71|        |0FE25F;
                       JMP.W CODE_0E8D7B                    ;0E8D73|4C7B8D  |0E8D7B;
 
 
          CODE_0E8D76: LDA.B #$20                           ;0E8D76|A920    |      ;
                       db $20                               ;0E8D78|        |      ;
                       dw CODE_0FE25F                       ;0E8D79|        |0FE25F;
 
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
                       STA.B r_pointerQueue_VRAM            ;0E8D97|8508    |000008;
                       LDA.W DATA8_0E8DE4,Y                 ;0E8D99|B9E48D  |0E8DE4;
                       STA.B $09                            ;0E8D9C|8509    |000009;
                       LDY.B #$00                           ;0E8D9E|A000    |      ;
 
          CODE_0E8DA0: LDA.B (r_pointerQueue_VRAM),Y        ;0E8DA0|B108    |000008;
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
                       ADC.B (r_pointerQueue_VRAM),Y        ;0E8DB9|7108    |000008;
 
          CODE_0E8DBB: STA.W $0452                          ;0E8DBB|8D5204  |0E0452;
                       INY                                  ;0E8DBE|C8      |      ;
                       LDA.W $041C                          ;0E8DBF|AD1C04  |0E041C;
                       CLC                                  ;0E8DC2|18      |      ;
                       ADC.B (r_pointerQueue_VRAM),Y        ;0E8DC3|7108    |000008;
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
                       SBC.B (r_pointerQueue_VRAM),Y        ;0E8DDE|F108    |000008;
                       JMP.W CODE_0E8DBB                    ;0E8DE0|4CBB8D  |0E8DBB;
 
 
         DATA8_0E8DE3: db $EB                               ;0E8DE3|        |      ;
 
         DATA8_0E8DE4: db $8D,$0D,$8E,$35,$8E               ;0E8DE4|        |      ;
                       db $4B,$8E,$02,$FB,$F1               ;0E8DE9|        |      ;
                       db $04,$FE,$F0,$06,$FC               ;0E8DEE|        |      ;
                       db $F1,$0E,$FD,$F8,$16               ;0E8DF3|        |      ;
                       db $FD,$F5,$18,$03,$F1               ;0E8DF8|        |      ;
                       db $1A,$FE,$F0,$1C,$FB               ;0E8DFD|        |      ;
                       db $F2,$1E,$FD,$F9,$20               ;0E8E02|        |      ;
                       db $FE,$F8,$22,$FB,$FA               ;0E8E07|        |      ;
                       db $FF,$02,$FB,$F1,$04               ;0E8E0C|        |      ;
                       db $FE,$F0,$06,$FC,$F1               ;0E8E11|        |      ;
                       db $0E,$FD,$F8,$16,$FD               ;0E8E16|        |      ;
                       db $F5,$18,$FD,$F5,$1A               ;0E8E1B|        |      ;
                       db $FD,$F5,$1C,$FD,$F5               ;0E8E20|        |      ;
                       db $1E,$FD,$F5,$2C,$FD               ;0E8E25|        |      ;
                       db $F5,$2E,$FD,$F5,$34               ;0E8E2A|        |      ;
                       db $FD,$F5,$36,$FD,$F5               ;0E8E2F|        |      ;
                       db $FF,$02,$FB,$F5,$04               ;0E8E34|        |      ;
                       db $FE,$F4,$06,$FB,$F5               ;0E8E39|        |      ;
                       db $0E,$FE,$00,$16,$FB               ;0E8E3E|        |      ;
                       db $F5,$24,$FE,$F0,$26               ;0E8E43|        |      ;
                       db $F8,$F4,$FF,$02,$00               ;0E8E48|        |      ;
                       db $E9,$04,$00,$E8,$06               ;0E8E4D|        |      ;
                       db $00,$E9,$0E,$FD,$F8               ;0E8E52|        |      ;
                       db $16,$FD,$F5,$18,$00               ;0E8E57|        |      ;
                       db $E9,$1A,$00,$E9,$1C               ;0E8E5C|        |      ;
                       db $00,$E9,$1E,$FD,$F8               ;0E8E61|        |      ;
                       db $20,$FD,$F8,$22,$FD               ;0E8E66|        |      ;
                       db $F8,$24,$00,$FD,$26               ;0E8E6B|        |      ;
                       db $00,$FF,$28,$00,$F8               ;0E8E70|        |      ;
                       db $FF                               ;0E8E75|        |      ;
 
         DATA8_0E8E76: db $02                               ;0E8E76|        |      ;
 
         DATA8_0E8E77: db $80,$01,$80                       ;0E8E77|        |      ;
                       STY.W $0509                          ;0E8E7A|8C0905  |0E0509;
                       STA.W $04F2                          ;0E8E7D|8DF204  |0E04F2;
                       JSR.W clearPlayerVertSpeed           ;0E8E80|20BC8A  |0E8ABC;
                       SEC                                  ;0E8E83|38      |      ;
                       RTS                                  ;0E8E84|60      |      ;
 
                       LDA.B r_gameLoadState                ;0E8E85|A52A    |00002A;
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
 
 
       UNREACH_0E8EA6: db $88,$F0,$35,$88,$F0               ;0E8EA6|        |      ;
                       db $39,$88,$F0,$3D,$88               ;0E8EAB|        |0EF088;
                       db $F0,$41,$88,$F0,$45               ;0E8EB0|        |0E8EF3;
 
       UNREACH_0E8EB5: db $20,$BC,$8A,$18,$60               ;0E8EB5|        |0E8ABC;
 
       UNREACH_0E8EBA: db $A6,$91,$86,$B8,$BD               ;0E8EBA|        |000091;
                       db $4E,$05,$C9,$79,$90               ;0E8EBF|        |0EC905;
                       db $12,$20,$C2,$91,$BD               ;0E8EC4|        |000020;
                       db $09,$05,$18,$69,$00               ;0E8EC9|        |      ;
                       db $A8,$BD,$F2,$04,$69               ;0E8ECE|        |      ;
                       db $01,$4C,$57,$8F,$A0               ;0E8ED3|        |00004C;
                       db $00,$A9,$01,$4C,$57               ;0E8ED8|        |      ;
                       db $8F,$A9,$00,$A0,$80               ;0E8EDD|        |A000A9;
                       db $4C,$7A,$8E,$A9,$00               ;0E8EE2|        |0E8E7A;
 
                       db $A0,$40,$4C,$7A,$8E               ;0E8EE7|        |      ;
                       db $A9,$01,$A0,$C0,$4C               ;0E8EEC|        |      ;
                       db $7A,$8E,$A9,$00,$A0               ;0E8EF1|        |      ;
                       db $80,$4C,$7A,$8E,$A9               ;0E8EF6|        |0E8F44;
                       db $01,$A0,$80,$4C,$7A               ;0E8EFB|        |0000A0;
                       db $8E,$A5,$2A,$C9,$1B               ;0E8F00|        |0E2AA5;
                       db $F0,$2A,$A5,$8B,$C9               ;0E8F05|        |0E8F31;
                       db $01,$F0,$29,$C9,$0C               ;0E8F0A|        |0000F0;
                       db $B0,$20,$38,$E9,$05               ;0E8F0F|        |0E8F31;
                       db $90,$1B,$D0,$03,$4C               ;0E8F14|        |0E8F31;
                       db $CF,$8F,$A8,$88,$D0               ;0E8F19|        |88A88F;
                       db $03,$4C,$B9,$90,$88               ;0E8F1E|        |00004C;
                       db $F0,$4D,$88,$F0,$51               ;0E8F23|        |0E8F72;
                       db $88,$F0,$55,$88,$F0               ;0E8F28|        |      ;
                       db $59,$88,$F0,$5D,$20               ;0E8F2D|        |0EF088;
                       db $BC,$8A,$18,$60,$A6               ;0E8F32|        |0E188A;
                       db $91,$86,$B8,$BD,$4E               ;0E8F37|        |000086;
                       db $05,$C9,$79,$90,$12               ;0E8F3C|        |0000C9;
                       db $20,$C2,$91,$BD,$09               ;0E8F41|        |0E91C2;
                       db $05,$18,$69,$00,$A8               ;0E8F46|        |000018;
                       db $BD,$F2,$04,$69,$FF               ;0E8F4B|        |0E04F2;
                       db $4C,$57,$8F,$A9,$FF               ;0E8F50|        |0E8F57;
 
                       db $A0,$00,$8D,$F2,$04               ;0E8F55|        |      ;
                       db $98,$8D,$09,$05,$20               ;0E8F5A|        |      ;
                       db $53,$91,$B0,$09,$AD               ;0E8F5F|        |000091;
                       db $F2,$04,$AC,$09,$05               ;0E8F64|        |000004;
                       db $4C,$7A,$8E,$A9,$00               ;0E8F69|        |0E8E7A;
 
                       db $A8,$4C,$7A,$8E,$A9               ;0E8F6E|        |      ;
                       db $FF,$A0,$80,$4C,$7A               ;0E8F73|        |4C80A0;
                       db $8E,$A9,$FE,$A0,$40               ;0E8F78|        |0EFEA9;
                       db $4C,$7A,$8E,$A9,$FF               ;0E8F7D|        |0E8E7A;
 
                       db $A0,$C0,$4C,$7A,$8E               ;0E8F82|        |      ;
                       db $A9,$FE,$A0,$80,$4C               ;0E8F87|        |      ;
                       db $7A,$8E,$A9,$FF,$A0               ;0E8F8C|        |      ;
                       db $80,$4C,$7A,$8E                   ;0E8F91|        |0E8FDF;
 
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
 
                       db $A5,$90,$29,$7F,$85               ;0E8FCF|        |000090;
                       db $00,$A8,$A5,$90,$30               ;0E8FD4|        |      ;
                       db $0D,$B9,$81,$FD,$8D               ;0E8FD9|        |0E81B9;
                       db $37,$05,$A9,$00,$8D               ;0E8FDE|        |000005;
                       db $20,$05,$F0,$0E,$A9               ;0E8FE3|        |0EF005;
                       db $00,$38,$F9,$81,$FD               ;0E8FE8|        |      ;
                       db $8D,$37,$05,$A9,$FF               ;0E8FED|        |0E0537;
                       db $8D,$20,$05,$A9,$40               ;0E8FF2|        |0E0520;
                       db $38,$E5,$00,$A8,$A9               ;0E8FF7|        |      ;
                       db $00,$38,$F9,$81,$FD               ;0E8FFC|        |      ;
                       db $8D,$09,$05,$A9,$FF               ;0E9001|        |0E0509;
                       db $8D,$F2,$04                       ;0E9006|        |0E04F2;
 
          CODE_0E9009: JSR.W CODE_0E8077                    ;0E9009|207780  |0E8077;
                       JSR.W CODE_0E9153                    ;0E900C|205391  |0E9153;
                       db $B0,$02,$38,$60,$A9               ;0E900F|        |0E9013;
                       db $00,$8D,$F2,$04,$8D               ;0E9014|        |      ;
                       db $09,$05,$8D,$20,$05               ;0E9019|        |      ;
                       db $8D,$37,$05,$38,$60               ;0E901E|        |0E0537;
 
          CODE_0E9023: LDX.B r_CogwheelID                   ;0E9023|A6D4    |0000D4;
                       STX.B r_CogwheelIDbackup             ;0E9025|86D2    |0000D2;
                       LDA.B r_CogSize                      ;0E9027|A595    |000095;
                       ASL A                                ;0E9029|0A      |      ;
                       TAY                                  ;0E902A|A8      |      ;
                       LDA.W PTR16_0E87E0,Y                 ;0E902B|B9E087  |0E87E0;
                       STA.B r_pointerQueue_VRAM            ;0E902E|8508    |000008;
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
                       LDA.B (r_pointerQueue_VRAM),Y        ;0E9044|B108    |000008;
                       STA.W $0509                          ;0E9046|8D0905  |0E0509;
                       LDA.B #$00                           ;0E9049|A900    |      ;
                       STA.W $04F2                          ;0E904B|8DF204  |0E04F2;
                       LDA.B #$40                           ;0E904E|A940    |      ;
                       SEC                                  ;0E9050|38      |      ;
                       SBC.B $00                            ;0E9051|E500    |000000;
                       TAY                                  ;0E9053|A8      |      ;
                       LDA.B r_knockBackDirrection          ;0E9054|A590    |000090;
                       BMI CODE_0E9061                      ;0E9056|3009    |0E9061;
                       LDA.B (r_pointerQueue_VRAM),Y        ;0E9058|B108    |000008;
                       STA.W $0537                          ;0E905A|8D3705  |0E0537;
                       LDA.B #$00                           ;0E905D|A900    |      ;
                       BEQ CODE_0E906B                      ;0E905F|F00A    |0E906B;
 
          CODE_0E9061: LDA.B #$00                           ;0E9061|A900    |      ;
                       SEC                                  ;0E9063|38      |      ;
                       SBC.B (r_pointerQueue_VRAM),Y        ;0E9064|F108    |000008;
                       STA.W $0537                          ;0E9066|8D3705  |0E0537;
                       LDA.B #$FF                           ;0E9069|A9FF    |      ;
 
          CODE_0E906B: STA.W $0520                          ;0E906B|8D2005  |0E0520;
                       JMP.W CODE_0E913E                    ;0E906E|4C3E91  |0E913E;
 
 
       UNREACH_0E9071: db $A6,$94,$BD,$F2,$04               ;0E9071|        |000094;
                       db $8D,$F2,$04,$BD,$20               ;0E9076|        |0E04F2;
                       db $05,$8D,$20,$05,$A9               ;0E907B|        |00008D;
                       db $00,$8D,$09,$05,$8D               ;0E9080|        |      ;
                       db $37,$05,$38,$60                   ;0E9085|        |000005;
 
       UNREACH_0E9089: db $A5,$90,$10,$B0,$A6               ;0E9089|        |000090;
                       db $94,$BD,$F2,$04,$10               ;0E908E|        |0000BD;
                       db $14,$8D,$F2,$04,$BD               ;0E9093|        |00008D;
                       db $20,$05,$8D,$20,$05               ;0E9098|        |0E8D05;
                       db $A9,$00,$8D,$09,$05               ;0E909D|        |      ;
                       db $8D,$37,$05,$4C,$3E               ;0E90A2|        |0E0537;
                       db $91,$A9,$00,$8D,$09               ;0E90A7|        |0000A9;
                       db $05,$8D,$F2,$04,$8D               ;0E90AC|        |00008D;
                       db $37,$05,$8D,$20,$05               ;0E90B1|        |000005;
                       db $4C,$3E,$91,$A6,$D4               ;0E90B6|        |0E913E;
 
                       db $86,$D2,$A5,$95,$0A               ;0E90BB|        |0000D2;
                       db $A8,$B9,$E0,$87,$85               ;0E90C0|        |      ;
                       db $08,$B9,$E1,$87,$85               ;0E90C5|        |      ;
                       db $09,$A4,$93,$88,$F0               ;0E90CA|        |      ;
                       db $3A,$88,$F0,$4F,$A5               ;0E90CF|        |      ;
                       db $90,$29,$7F,$85,$00               ;0E90D4|        |0E90FF;
                       db $A8,$A9,$00,$38,$F1               ;0E90D9|        |      ;
                       db $08,$8D,$09,$05,$A9               ;0E90DE|        |      ;
                       db $FF,$8D,$F2,$04,$A9               ;0E90E3|        |04F28D;
                       db $40,$38,$E5,$00,$A8               ;0E90E8|        |      ;
                       db $A5,$90,$30,$0C,$A9               ;0E90ED|        |000090;
                       db $00,$38,$F1,$08,$8D               ;0E90F2|        |      ;
                       db $37,$05,$A9,$FF,$D0               ;0E90F7|        |000005;
                       db $07,$B1,$08,$8D,$37               ;0E90FC|        |0000B1;
                       db $05,$A9,$00,$8D,$20               ;0E9101|        |0000A9;
                       db $05,$4C,$3E,$91,$A6               ;0E9106|        |00004C;
                       db $94,$BD,$F2,$04,$8D               ;0E910B|        |0000BD;
                       db $F2,$04,$BD,$20,$05               ;0E9110|        |000004;
                       db $8D,$20,$05,$A9,$00               ;0E9115|        |0E0520;
                       db $8D,$09,$05,$8D,$37               ;0E911A|        |0E0509;
                       db $05,$38,$60,$A5,$90               ;0E911F|        |000038;
                       db $30,$AD,$A6,$94,$BD               ;0E9124|        |0E90D3;
                       db $F2,$04,$30,$16,$8D               ;0E9129|        |000004;
                       db $F2,$04,$BD,$20,$05               ;0E912E|        |000004;
                       db $8D,$20,$05,$A9,$00               ;0E9133|        |0E0520;
                       db $8D,$09,$05,$8D,$37               ;0E9138|        |0E0509;
                       db $05                               ;0E913D|        |000020;
 
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
 
 
         DATA8_0E9186: db $F0,$F0,$F4,$F0,$0F               ;0E9186|        |      ;
                       db $0F,$0B,$0F                       ;0E918B|        |      ;
                       LDA.B r_conveyaerRoomEffect          ;0E918E|A58B    |00008B;
                       BNE CODE_0E9193                      ;0E9190|D001    |0E9193;
 
          CODE_0E9192: RTS                                  ;0E9192|60      |      ;
 
 
          CODE_0E9193: CMP.B #$01                           ;0E9193|C901    |      ;
                       BEQ UNREACH_0E91F9                   ;0E9195|F062    |0E91F9;
                       SEC                                  ;0E9197|38      |      ;
                       SBC.B #$05                           ;0E9198|E905    |      ;
                       BCC CODE_0E9192                      ;0E919A|90F6    |0E9192;
                       BNE UNREACH_0E91A1                   ;0E919C|D003    |0E91A1;
                       JMP.W CODE_0E9314                    ;0E919E|4C1493  |0E9314;
 
 
       UNREACH_0E91A1: db $A8,$88,$D0,$03,$4C               ;0E91A1|        |      ;
                       db $40,$93,$88,$88,$D0               ;0E91A6|        |      ;
                       db $03,$4C,$42,$92,$88               ;0E91AB|        |00004C;
                       db $D0,$03,$4C,$88,$92               ;0E91B0|        |0E91B5;
                       db $88,$D0,$03,$4C,$BB               ;0E91B5|        |      ;
                       db $92,$88,$D0,$03,$4C               ;0E91BA|        |000088;
                       db $EE,$92,$60,$C9,$6E               ;0E91BF|        |0E6092;
                       db $F0,$2C,$C9,$74,$F0               ;0E91C4|        |0E91F2;
                       db $28,$C9,$76,$F0,$07               ;0E91C9|        |      ;
                       db $C9,$78,$F0,$03,$A6               ;0E91CE|        |      ;
                       db $91,$60,$BD,$20,$05               ;0E91D3|        |000060;
                       db $10,$F8,$A9,$FB,$A2               ;0E91D8|        |0E91D2;
                       db $F8,$20,$DD,$FC,$D0               ;0E91DD|        |      ;
                       db $09,$A9,$05,$A2,$F8               ;0E91E2|        |      ;
                       db $20,$DD,$FC,$F0,$E6               ;0E91E7|        |0EFCDD;
                       db $A9,$10,$85,$AF,$D0               ;0E91EC|        |      ;
                       db $E0,$BD,$1D,$06,$F0               ;0E91F1|        |      ;
                       db $DB,$D0,$E1                       ;0E91F6|        |      ;
 
       UNREACH_0E91F9: db $A6,$91,$86,$B8,$BD               ;0E91F9|        |000091;
                       db $4E,$05,$C9,$79,$90               ;0E91FE|        |0EC905;
                       db $33,$20,$C2,$91,$A5               ;0E9203|        |000020;
                       db $82,$C9,$04,$B0,$19               ;0E9208|        |0E96D4;
                       db $BD,$F2,$04,$10,$0B               ;0E920D|        |0E04F2;
                       db $A9,$F8,$A2,$F0,$20               ;0E9212|        |      ;
                       db $DD,$FC,$D0,$1C,$F0               ;0E9217|        |0ED0FC;
                       db $09,$A9,$08,$A2,$F0               ;0E921C|        |      ;
                       db $20,$DD,$FC,$D0,$11               ;0E9221|        |0EFCDD;
                       db $A6,$91,$BD,$09,$05               ;0E9226|        |000091;
                       db $8D,$09,$05,$BD,$F2               ;0E922B|        |0E0509;
                       db $04,$8D,$F2,$04,$4C               ;0E9230|        |00008D;
                       db $3A,$87,$A9,$00,$8D               ;0E9235|        |      ;
                       db $09,$05,$8D,$F2,$04               ;0E923A|        |      ;
                       db $4C,$3A,$87,$A5,$2A               ;0E923F|        |0E873A;
 
                       db $C9,$1B,$F0,$12,$A2               ;0E9244|        |      ;
                       db $01,$A9,$F8,$20,$DD               ;0E9249|        |0000A9;
                       db $FC,$D0,$09,$A2,$F0               ;0E924E|        |0E09D0;
                       db $A9,$F8,$20,$DD,$FC               ;0E9253|        |      ;
                       db $F0,$01,$60,$A5,$82               ;0E9258|        |0E925B;
                       db $29,$0C,$D0,$0D,$A9               ;0E925D|        |      ;
                       db $FF,$8D,$F2,$04,$A9               ;0E9262|        |04F28D;
                       db $40,$8D,$09,$05,$4C               ;0E9267|        |      ;
                       db $3A,$87,$A9,$FF,$8D               ;0E926C|        |      ;
                       db $F2,$04,$A9,$A0,$8D               ;0E9271|        |000004;
                       db $09,$05,$4C,$3A,$87               ;0E9276|        |      ;
                       db $A9,$00,$8D,$F2,$04               ;0E927B|        |      ;
                       db $A9,$60,$8D,$09,$05               ;0E9280|        |      ;
                       db $4C,$3A,$87,$A2,$01               ;0E9285|        |0E873A;
 
                       db $A9,$08,$20,$DD,$FC               ;0E928A|        |      ;
                       db $D0,$09,$A2,$F0,$A9               ;0E928F|        |0E929A;
                       db $08,$20,$DD,$FC,$F0               ;0E9294|        |      ;
                       db $01,$60,$A5,$82,$29               ;0E9299|        |000060;
                       db $0C,$D0,$DA,$A9,$00               ;0E929E|        |0EDAD0;
                       db $8D,$F2,$04,$A9,$C0               ;0E92A3|        |0E04F2;
                       db $8D,$09,$05,$4C,$3A               ;0E92A8|        |0E0509;
                       db $87,$A9,$FF,$8D,$F2               ;0E92AD|        |0000A9;
                       db $04,$A9,$C0,$8D,$09               ;0E92B2|        |0000A9;
                       db $05,$4C,$3A,$87,$A2               ;0E92B7|        |00004C;
                       db $01,$A9,$F8,$20,$DD               ;0E92BC|        |0000A9;
                       db $FC,$D0,$09,$A2,$F0               ;0E92C1|        |0E09D0;
                       db $A9,$F8,$20,$DD,$FC               ;0E92C6|        |      ;
                       db $F0,$01,$60,$A5,$82               ;0E92CB|        |0E92CE;
                       db $29,$0C,$D0,$DA,$A9               ;0E92D0|        |      ;
                       db $FF,$8D,$F2,$04,$A9               ;0E92D5|        |04F28D;
                       db $80,$8D,$09,$05,$4C               ;0E92DA|        |0E9269;
                       db $3A,$87,$A9,$00,$8D               ;0E92DF|        |      ;
                       db $F2,$04,$A9,$40,$8D               ;0E92E4|        |000004;
                       db $09,$05,$4C,$3A,$87               ;0E92E9|        |      ;
                       db $A2,$01,$A9,$08,$20               ;0E92EE|        |      ;
                       db $DD,$FC,$D0,$09,$A2               ;0E92F3|        |0ED0FC;
                       db $F0,$A9,$08,$20,$DD               ;0E92F8|        |0E92A3;
                       db $FC,$F0,$01,$60,$A5               ;0E92FD|        |0E01F0;
                       db $82,$29,$0C,$D0,$DA               ;0E9302|        |0E9F2E;
                       db $A9,$00,$8D,$F2,$04               ;0E9307|        |      ;
                       db $A9,$80,$8D,$09,$05               ;0E930C|        |      ;
                       db $4C,$3A,$87                       ;0E9311|        |0E873A;
 
 
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
                       LDX.B r_CogwheelID                   ;0E9340|A6D4    |0000D4;
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
                       db $18,$94,$3A,$94,$65               ;0E9399|        |      ;
                       db $94,$9E,$94,$B8,$94               ;0E939E|        |      ;
                       db $D4,$94,$FF,$94,$1C               ;0E93A3|        |      ;
                       db $83,$B1,$93,$B1,$93               ;0E93A8|        |      ;
                       db $57,$8B,$DE,$8A,$A9               ;0E93AD|        |      ;
                       db $02,$8D,$00,$04,$CE               ;0E93B2|        |      ;
                       db $D4,$05,$F0,$20,$A9               ;0E93B7|        |      ;
                       db $02,$8D,$54,$04,$AD               ;0E93BC|        |      ;
                       db $EB,$05                           ;0E93C1|        |      ;
                       db $D0,$21,$20,$21,$84               ;0E93C3|        |0E93E6;
                       db $90,$01,$60,$A9,$01               ;0E93C8|        |0E93CB;
                       db $8D,$EB,$05,$A9,$0C               ;0E93CD|        |0E05EB;
                       db $8D,$D8,$05,$A9,$01               ;0E93D2|        |0E05D8;
                       db $8D,$C1,$05,$60,$A9               ;0E93D7|        |0E05C1;
                       db $00,$8D,$54,$04,$A9               ;0E93DC|        |      ;
                       db $02,$8D,$65,$05,$60               ;0E93E1|        |      ;
                       db $20,$4F,$98,$AD,$C1               ;0E93E6|        |0E984F;
                       db $05,$F0,$F7,$A2,$10               ;0E93EB|        |0000F0;
                       db $A9,$FB,$20,$DD,$FC               ;0E93F0|        |      ;
                       db $D0,$0A,$A2,$10,$A9               ;0E93F5|        |0E9401;
                       db $05,$20,$DD,$FC,$D0               ;0E93FA|        |000020;
                       db $01,$60,$20,$02,$8A               ;0E93FF|        |000060;
                       db $A9,$00,$8D,$EB,$05               ;0E9404|        |      ;
                       db $60,$8D,$65,$05,$A9               ;0E9409|        |      ;
 
                       db $72,$20,$5F,$E2,$A9               ;0E940E|        |000020;
                       db $00,$8D,$78,$05,$60               ;0E9413|        |      ;
 
                       db $20,$21,$84,$B0,$08               ;0E9418|        |0E8421;
                       db $A9,$00,$8D,$13,$04               ;0E941D|        |      ;
                       db $4C,$3A,$97,$20,$8E               ;0E9422|        |0E973A;
 
                       db $91,$20,$89,$BC,$B0               ;0E9427|        |000020;
                       db $01,$60,$A9,$02,$8D               ;0E942C|        |000060;
                       db $65,$05,$A9,$02,$8D               ;0E9431|        |000005;
                       db $00,$04,$38,$60,$20               ;0E9436|        |      ;
                       db $9C,$97,$AD,$65,$05               ;0E943B|        |0EAD97;
                       db $C9,$26,$F0,$15,$C9               ;0E9440|        |      ;
                       db $02,$D0,$0C,$A9,$00               ;0E9445|        |      ;
                       db $85,$B9,$A9,$18,$8D               ;0E944A|        |0000B9;
                       db $65,$05,$4C,$28,$94               ;0E944F|        |000005;
                       db $20,$89,$BC,$B0,$01               ;0E9454|        |0EBC89;
                       db $60,$A9,$08,$8D,$65               ;0E9459|        |      ;
 
                       db $05,$A9,$02,$8D,$00               ;0E945E|        |0000A9;
                       db $04,$60,$20,$21,$84               ;0E9463|        |000060;
                       db $B0,$03,$4C,$1D,$94               ;0E9468|        |0E946D;
                       db $20,$8E,$91,$20,$36               ;0E946D|        |0E918E;
                       db $99,$AD,$65,$05,$C9               ;0E9472|        |0E65AD;
                       db $02,$D0,$13,$A9,$18               ;0E9477|        |      ;
                       db $8D,$65,$05,$20,$28               ;0E947C|        |0E0565;
                       db $94,$AD,$65,$05,$C9               ;0E9481|        |0000AD;
                       db $18,$D0,$03,$20,$CB               ;0E9486|        |      ;
                       db $BE,$60,$20,$89,$BC               ;0E948B|        |0E2060;
                       db $B0,$01,$60,$A9,$0A               ;0E9490|        |0E9493;
                       db $8D,$65,$05,$A9,$0E               ;0E9495|        |0E0565;
                       db $8D,$00,$04,$60,$20               ;0E949A|        |0E0400;
                       db $89,$BC,$B0,$01,$60               ;0E949F|        |      ;
                       db $A9,$12,$8D,$65,$05               ;0E94A4|        |      ;
                       db $60,$8D,$65,$05,$A9               ;0E94A9|        |      ;
 
                       db $00,$8D,$93,$05,$A9               ;0E94AE|        |      ;
                       db $01,$8D,$7C,$05,$60               ;0E94B3|        |00008D;
                       db $20,$21,$84,$B0,$03               ;0E94B8|        |0E8421;
                       db $4C,$3A,$97,$20,$8E               ;0E94BD|        |0E973A;
 
                       db $91,$20,$F2,$BA,$B0               ;0E94C2|        |000020;
                       db $01,$60,$A9,$02,$8D               ;0E94C7|        |000060;
                       db $65,$05,$A9,$02,$8D               ;0E94CC|        |000005;
                       db $00,$04,$60,$20,$9C               ;0E94D1|        |      ;
                       db $97,$AD,$65,$05,$C9               ;0E94D6|        |0000AD;
                       db $26,$F0,$15,$C9,$02               ;0E94DB|        |0000F0;
                       db $D0,$0C,$A9,$00,$85               ;0E94E0|        |0E94EE;
                       db $B9,$A9,$20,$8D,$65               ;0E94E5|        |0E20A9;
                       db $05,$4C,$C3,$94,$20               ;0E94EA|        |00004C;
                       db $F2,$BA,$B0,$01,$60               ;0E94EF|        |0000BA;
                       db $A9,$08,$8D,$65,$05               ;0E94F4|        |      ;
                       db $A9,$02,$8D,$00,$04               ;0E94F9|        |      ;
                       db $60,$20,$F2,$BA,$B0               ;0E94FE|        |      ;
 
                       db $01,$60,$A9,$12,$8D               ;0E9503|        |000060;
                       db $65,$05,$60,$AD,$4E               ;0E9508|        |000005;
                       db $05,$C9,$02,$F0,$22               ;0E950D|        |0000C9;
                       db $A2,$E8,$A9,$FB,$20               ;0E9512|        |      ;
                       db $0B,$84,$F0,$08,$C9               ;0E9517|        |      ;
                       db $05,$F0,$04,$C9,$07               ;0E951C|        |0000F0;
                       db $D0,$13,$A2,$E8,$A9               ;0E9521|        |0E9536;
                       db $05,$20,$0B,$84,$F0               ;0E9526|        |000020;
                       db $08,$C9,$05,$F0,$04               ;0E952B|        |      ;
                       db $C9,$07,$D0,$02,$18               ;0E9530|        |      ;
                       db $60,$38,$60                       ;0E9535|        |      ;
 
 
       UNREACH_0E9538: db $20,$21,$84,$B0,$03               ;0E9538|        |0E8421;
                       db $4C,$3A,$97,$A5,$B9               ;0E953D|        |0E973A;
 
                       db $F0,$09,$C6,$B9,$D0               ;0E9542|        |0E954D;
                       db $EF,$A9,$02,$8D,$00               ;0E9547|        |8D02A9;
                       db $04,$A5,$26,$0A,$B0               ;0E954C|        |0000A5;
                       db $42,$0A,$B0,$1C,$A5               ;0E9551|        |      ;
                       db $28,$4A,$90,$03,$4C               ;0E9556|        |      ;
                       db $02,$96,$4A,$90,$03               ;0E955B|        |      ;
                       db $4C,$06,$96,$4A,$B0               ;0E9560|        |0E9606;
 
                       db $44,$4A,$B0,$4F,$A9               ;0E9565|        |      ;
                       db $02,$8D,$00,$04,$4C               ;0E956A|        |      ;
                       db $8E,$91,$A5,$28,$29               ;0E956F|        |0EA591;
                       db $08,$D0,$13,$AD,$4E               ;0E9574|        |      ;
                       db $05,$C9,$03,$F0,$05               ;0E9579|        |0000C9;
                       db $A9,$18,$4C,$0A,$94               ;0E957E|        |      ;
                       db $20,$69,$BA,$B0,$07               ;0E9583|        |0EBA69;
                       db $90,$CB,$20,$F5,$B9               ;0E9588|        |0E9555;
                       db $90,$E8,$A9,$20,$4C               ;0E958D|        |0E9577;
                       db $AA,$94,$20,$0B,$95               ;0E9592|        |      ;
                       db $B0,$05,$A9,$06,$8D               ;0E9597|        |0E959E;
                       db $65,$05,$60,$A9,$0A               ;0E959C|        |000005;
                       db $8D,$65,$05,$A9,$0E               ;0E95A1|        |0E0565;
                       db $8D,$00,$04,$60,$20               ;0E95A6|        |0E0400;
                       db $D4,$E6,$90,$F0,$A9               ;0E95AB|        |0000E6;
                       db $00,$8D,$C1,$05,$A2               ;0E95B0|        |      ;
                       db $01,$D0,$0C,$20,$DF               ;0E95B5|        |0000D0;
                       db $E6,$90,$AC,$A9,$01               ;0E95BA|        |000090;
                       db $8D,$C1,$05,$A2,$00               ;0E95BF|        |0E05C1;
                       db $A0,$00,$A5,$0A,$0A               ;0E95C4|        |      ;
                       db $90,$05,$8A,$49,$01               ;0E95C9|        |0E95D0;
                       db $AA,$C8,$8C,$EF,$05               ;0E95CE|        |      ;
                       db $8E,$A8,$04,$A5,$0B               ;0E95D3|        |0E04A8;
                       db $8D,$1D,$06,$A0,$00               ;0E95D8|        |0E061D;
                       db $0A,$90,$01,$C8,$8C               ;0E95DD|        |      ;
                       db $06,$06,$A5,$0D,$F0               ;0E95E2|        |000006;
                       db $06,$A9,$FF,$A0,$00               ;0E95E7|        |0000A9;
                       db $F0,$04,$A9,$01,$A0               ;0E95EC|        |0E95F2;
                       db $00,$8C,$09,$05,$8D               ;0E95F1|        |      ;
                       db $F2,$04,$A9,$0E,$8D               ;0E95F6|        |000004;
                       db $65,$05,$A9,$00,$4C               ;0E95FB|        |000005;
                       db $4A,$EF,$A9,$00,$F0               ;0E9600|        |      ;
                       db $02,$A9,$01,$8D,$A8               ;0E9605|        |      ;
                       db $04,$A9,$00,$8D,$F2               ;0E960A|        |0000A9;
                       db $04,$8D,$09,$05,$A9               ;0E960F|        |00008D;
                       db $04,$8D,$65,$05,$A9               ;0E9614|        |00008D;
                       db $00,$4C,$4A,$EF                   ;0E9619|        |      ;
 
       UNREACH_0E961D: db $A9,$08,$8D,$65,$05               ;0E961D|        |      ;
                       db $A5,$28,$85,$10,$A2               ;0E9622|        |000028;
                       db $00,$A9,$16,$9D,$00               ;0E9627|        |      ;
                       db $04,$A9,$00,$9D,$C1               ;0E962C|        |0000A9;
                       db $05,$A9,$09,$9D,$D8               ;0E9631|        |0000A9;
                       db $05,$A5,$10,$4A,$B0               ;0E9636|        |0000A5;
                       db $08,$4A,$B0,$10,$A9               ;0E963B|        |      ;
                       db $00,$A8,$F0,$14,$A9               ;0E9640|        |      ;
                       db $00,$9D,$A8,$04,$A9               ;0E9645|        |      ;
                       db $01,$A0,$00,$F0,$09               ;0E964A|        |0000A0;
                       db $A9,$01,$9D,$A8,$04               ;0E964F|        |      ;
                       db $A9,$FF,$A0,$00,$9D               ;0E9654|        |      ;
                       db $F2,$04,$98,$9D,$09               ;0E9659|        |000004;
                       db $05,$60                           ;0E965E|        |000060;
 
       UNREACH_0E9660: db $20,$21,$84,$B0,$03               ;0E9660|        |0E8421;
                       db $4C,$34,$97,$A5,$26               ;0E9665|        |0E9734;
 
                       db $0A,$90,$03,$4C,$94               ;0E966A|        |      ;
                       db $95,$0A,$B0,$1C,$A5               ;0E966F|        |00000A;
                       db $28,$4A,$B0,$42,$4A               ;0E9674|        |      ;
                       db $90,$03,$4C,$F6,$96               ;0E9679|        |0E967E;
                       db $A9,$02,$8D,$65,$05               ;0E967E|        |      ;
                       db $20,$BC,$8A,$20,$73               ;0E9683|        |0E8ABC;
                       db $EF,$20,$3A,$87,$4C               ;0E9688|        |873A20;
                       db $12,$87,$A5,$28,$29               ;0E968D|        |000087;
                       db $08,$F0,$0F,$20,$F5               ;0E9692|        |      ;
                       db $B9,$90,$0A,$A9,$20               ;0E9697|        |0E0A90;
                       db $20,$AA,$94,$20,$BC               ;0E969C|        |0E94AA;
                       db $8A,$F0,$E5,$AD,$4E               ;0E96A1|        |      ;
                       db $05,$C9,$03,$F0,$08               ;0E96A6|        |0000C9;
                       db $A9,$18,$20,$0A,$94               ;0E96AB|        |      ;
                       db $4C,$83,$96,$20,$69               ;0E96B0|        |0E9683;
 
                       db $BA,$90,$BB,$B0,$E0               ;0E96B5|        |      ;
                       db $A9,$00,$8D,$A8,$04               ;0E96BA|        |      ;
                       db $20,$85,$8E,$90,$15               ;0E96BF|        |0E8E85;
                       db $A2,$00,$A9,$08,$20               ;0E96C4|        |      ;
                       db $DD,$FC,$D0,$24,$A2               ;0E96C9|        |0ED0FC;
                       db $F0,$A9,$08,$20,$DD               ;0E96CE|        |0E9679;
                       db $FC,$D0,$1B,$4C,$86               ;0E96D3|        |0E1BD0;
                       db $96,$A2,$00,$A9,$08               ;0E96D8|        |0000A2;
                       db $20,$DD,$FC,$D0,$0F               ;0E96DD|        |0EFCDD;
                       db $A2,$F0,$A9,$08,$20               ;0E96E2|        |      ;
                       db $DD,$FC,$D0,$06,$A9               ;0E96E7|        |0ED0FC;
                       db $01,$A0,$00,$F0,$3A               ;0E96EC|        |0000A0;
                       db $A9,$00,$A8,$F0,$35               ;0E96F1|        |      ;
                       db $A9,$01,$8D,$A8,$04               ;0E96F6|        |      ;
                       db $20,$01,$8F,$90,$15               ;0E96FB|        |0E8F01;
                       db $A2,$00,$A9,$F8,$20               ;0E9700|        |      ;
                       db $DD,$FC,$D0,$E8,$A2               ;0E9705|        |0ED0FC;
                       db $F0,$A9,$F8,$20,$DD               ;0E970A|        |0E96B5;
                       db $FC,$D0,$DF,$4C,$86               ;0E970F|        |0EDFD0;
                       db $96,$A2,$00,$A9,$F8               ;0E9714|        |0000A2;
                       db $20,$DD,$FC,$D0,$D3               ;0E9719|        |0EFCDD;
                       db $A2,$F0,$A9,$F8,$20               ;0E971E|        |      ;
                       db $DD,$FC,$D0,$CA,$A9               ;0E9723|        |0ED0FC;
                       db $FF,$A0,$00,$8C,$09               ;0E9728|        |8C00A0;
                       db $05,$8D,$F2,$04,$4C               ;0E972D|        |00008D;
                       db $83,$96,$20,$3A,$97               ;0E9732|        |000096;
                       db $4C,$86,$96,$A5,$CF               ;0E9737|        |0E9686;
 
                       db $C9,$01,$F0,$04,$C9               ;0E973C|        |      ;
                       db $06,$D0,$04,$A9,$08               ;0E9741|        |0000D0;
                       db $85,$AF,$A9,$0C,$8D               ;0E9746|        |0000AF;
                       db $65,$05,$A2,$00,$A9               ;0E974B|        |000005;
                       db $0C,$9D,$D8,$05,$A9               ;0E9750|        |0ED89D;
                       db $01,$9D,$C1,$05,$BD               ;0E9755|        |00009D;
                       db $A8,$04,$D0,$0C,$A9               ;0E975A|        |      ;
                       db $00,$A0,$20,$9D,$F2               ;0E975F|        |      ;
                       db $04,$98,$9D,$09,$05               ;0E9764|        |000098;
                       db $60,$A9,$FF,$A0,$E0               ;0E9769|        |      ;
 
                       db $D0,$F2                           ;0E976E|        |0E9762;
 
       UNREACH_0E9770: db $A5,$26,$29,$40,$F0               ;0E9770|        |000026;
                       db $26,$A5,$28,$29,$08               ;0E9775|        |0000A5;
                       db $F0,$14,$20,$F5,$B9               ;0E977A|        |0E9790;
                       db $90,$0F,$A9,$22,$20               ;0E977F|        |0E9790;
                       db $AA,$94,$4C,$9C,$97               ;0E9784|        |      ;
                       db $20,$69,$BA,$90,$0E               ;0E9789|        |0EBA69;
                       db $B0,$F1,$AD,$4E,$05               ;0E978E|        |0E9781;
                       db $C9,$03,$F0,$F2,$A9               ;0E9793|        |      ;
                       db $1A,$20,$0A,$94,$20               ;0E9798|        |      ;
                       db $AA,$83,$B0,$C8                   ;0E979D|        |      ;
 
       UNREACH_0E97A1: db $AD,$F2,$04,$10,$14               ;0E97A1|        |0E04F2;
                       db $A2,$10,$A9,$F8,$20               ;0E97A6|        |      ;
                       db $DD,$FC,$D0,$20,$A2               ;0E97AB|        |0ED0FC;
                       db $08,$A9,$F8,$20,$DD               ;0E97B0|        |      ;
                       db $FC,$D0,$17,$F0,$12               ;0E97B5|        |0E17D0;
                       db $A2,$10,$A9,$08,$20               ;0E97BA|        |      ;
                       db $DD,$FC,$D0,$0C,$A2               ;0E97BF|        |0ED0FC;
                       db $08,$A9,$08,$20,$DD               ;0E97C4|        |      ;
                       db $FC,$D0,$03,$20,$3A               ;0E97C9|        |0E03D0;
                       db $87                               ;0E97CE|        |0000AD;
 
       UNREACH_0E97CF: db $AD,$1C,$04,$85,$06               ;0E97CF|        |0E041C;
                       db $20,$4F,$98,$AD,$C1               ;0E97D4|        |0E984F;
                       db $05,$F0,$65,$A2,$10               ;0E97D9|        |0000F0;
                       db $A9,$FB,$20,$DD,$FC               ;0E97DE|        |      ;
                       db $F0,$0C,$A2,$08,$A9               ;0E97E3|        |0E97F1;
                       db $FB,$20,$FF,$83,$F0               ;0E97E8|        |      ;
                       db $30,$4C,$41,$98,$A2               ;0E97ED|        |0E983B;
                       db $10,$A9,$05,$20,$DD               ;0E97F2|        |0E979D;
                       db $FC,$F0,$0C,$A2,$08               ;0E97F7|        |0E0CF0;
                       db $A9,$05,$20,$FF,$83               ;0E97FC|        |      ;
                       db $F0,$1B,$4C,$41,$98               ;0E9801|        |0E981E;
                       db $A5,$8B,$C9,$01,$F0               ;0E9806|        |00008B;
                       db $0A,$C9,$05,$F0,$34               ;0E980B|        |      ;
                       db $C9,$06,$F0,$30,$D0               ;0E9810|        |      ;
                       db $2B,$A6,$91,$20,$9C               ;0E9815|        |      ;
                       db $FE,$4C,$3B,$98,$AD               ;0E981A|        |0E3B4C;
                       db $D8,$05,$D0,$15,$AD               ;0E981F|        |      ;
                       db $65,$05,$C9,$26,$F0               ;0E9824|        |000005;
                       db $0E,$A9,$0B,$20,$5F               ;0E9829|        |0E0BA9;
                       db $E2,$A9,$0C,$85,$B9               ;0E982E|        |      ;
                       db $A9,$0E,$8D,$00,$04               ;0E9833|        |      ;
                       db $20,$02,$8A,$A9,$02               ;0E9838|        |0E8A02;
                       db $8D,$65,$05,$60,$4C               ;0E983D|        |0E0565;
                       db $12,$87,$A5,$06,$18               ;0E9842|        |000087;
                       db $65,$91,$8D,$1C,$04               ;0E9847|        |000091;
                       db $4C,$3B,$98,$AD,$1C               ;0E984C|        |0E983B;
 
                       db $04,$C9,$08,$B0,$11               ;0E9851|        |0000C9;
                       db $AD,$C1,$05,$D0,$0C               ;0E9856|        |0E05C1;
                       db $AD,$65,$05,$C9,$26               ;0E985B|        |0E0565;
                       db $F0,$08,$A2,$00,$20               ;0E9860|        |0E986A;
                       db $4F,$97,$4C,$BF,$98               ;0E9865|        |BF4C97;
                       db $A9,$00,$8D,$20,$05               ;0E986A|        |      ;
                       db $8D,$37,$05,$F0,$F3               ;0E986F|        |0E0537;
                       db $80,$FA,$FA,$FA,$FA               ;0E9874|        |0E9870;
 
                       db $FA,$FB,$FB,$FB,$FB               ;0E9879|        |      ;
                       db $FB,$FD,$FD,$FD,$FD               ;0E987E|        |      ;
                       db $FD,$FE,$FE,$FE,$FF               ;0E9883|        |0EFEFE;
                       db $FF,$FF,$FF,$00,$FF               ;0E9888|        |00FFFF;
                       db $00,$00,$00,$00,$81               ;0E988D|        |      ;
                       db $AD,$37,$05,$18,$69               ;0E9892|        |0E0537;
                       db $20,$8D,$37,$05,$AD               ;0E9897|        |0E378D;
                       db $20,$05,$69,$00,$8D               ;0E989C|        |0E6905;
                       db $20,$05,$10,$06,$A9               ;0E98A1|        |0E1005;
                       db $00,$8D,$C1,$05,$60               ;0E98A6|        |      ;
                       db $C9,$05,$90,$0A,$A9               ;0E98AB|        |      ;
                       db $05,$8D,$20,$05,$A9               ;0E98B0|        |00008D;
                       db $00,$8D,$37,$05,$A9               ;0E98B5|        |      ;
                       db $01,$8D,$C1,$05,$60               ;0E98BA|        |00008D;
                       db $AD,$65,$05,$C9,$26               ;0E98BF|        |0E0565;
                       db $F0,$CC,$A2,$00,$A9               ;0E98C4|        |0E9892;
                       db $00,$9D,$37,$05,$9D               ;0E98C9|        |      ;
                       db $DB,$04,$BC,$D8,$05               ;0E98CE|        |      ;
                       db $BD,$C1,$05,$D0,$1C               ;0E98D3|        |0E05C1;
                       db $B9,$74,$98,$C9,$81               ;0E98D8|        |0E9874;
                       db $F0,$07,$9D,$20,$05               ;0E98DD|        |0E98E6;
                       db $FE,$D8,$05,$60,$A9               ;0E98E2|        |0E05D8;
                       db $00,$9D,$20,$05,$DE               ;0E98E7|        |      ;
                       db $D8,$05,$A9,$01,$9D               ;0E98EC|        |      ;
                       db $C1,$05,$60,$B9,$74               ;0E98F1|        |000005;
                       db $98,$C9,$80,$F0,$0C               ;0E98F6|        |      ;
                       db $DE,$D8,$05,$49,$FF               ;0E98FB|        |0E05D8;
                       db $18,$69,$01,$9D,$20               ;0E9900|        |      ;
                       db $05,$60,$B9,$75,$98               ;0E9905|        |000060;
                       db $D0,$F2,$20,$69,$BA               ;0E990A|        |0E98FE;
                       db $90,$25,$A9,$1C,$20               ;0E990F|        |0E9936;
                       db $AA,$94,$4C,$36,$99               ;0E9914|        |      ;
 
       UNREACH_0E9919: db $20,$21,$84,$B0,$03               ;0E9919|        |0E8421;
                       db $4C,$3A,$97,$20,$8E               ;0E991E|        |0E973A;
 
                       db $91,$A5,$26,$29,$40               ;0E9923|        |0000A5;
                       db $F0,$0C,$AD,$4E,$05               ;0E9928|        |0E9936;
                       db $C9,$03,$F0,$DB,$A9               ;0E992D|        |      ;
                       db $1C,$20,$0A,$94,$A5               ;0E9932|        |0E0A20;
                       db $28,$29,$04,$D0,$05               ;0E9937|        |      ;
                       db $A9,$02,$8D,$65,$05               ;0E993C|        |      ;
                       db $60                               ;0E9941|        |      ;
 
 
       UNREACH_0E9942: db $20,$89,$FB,$AD,$20               ;0E9942|        |0EFB89;
                       db $05,$30,$03,$4C,$9A               ;0E9947|        |000030;
                       db $9B,$4C,$8E,$9B,$4C               ;0E994C|        |      ;
                       db $8E,$9B                           ;0E9951|        |0EAD9B;
 
       UNREACH_0E9953: db $AD,$1D,$06,$F0,$09               ;0E9953|        |0E061D;
                       db $CE,$1D,$06,$20,$73               ;0E9958|        |0E061D;
                       db $EF,$4C,$3A,$87,$A9               ;0E995D|        |873A4C;
                       db $10,$8D,$65,$05,$60               ;0E9962|        |0E98F1;
 
       UNREACH_0E9967: db $AD,$C1,$05,$D0,$03               ;0E9967|        |0E05C1;
                       db $4C,$9A,$9B,$4C,$8E               ;0E996C|        |0E9B9A;
 
                       db $9B,$A5,$28,$29,$08               ;0E9971|        |      ;
                       db $D0,$0C,$AD,$4E,$05               ;0E9976|        |0E9984;
                       db $C9,$03,$F0,$15,$A9               ;0E997B|        |      ;
                       db $1E,$4C,$0A,$94,$20               ;0E9980|        |0E0A4C;
                       db $F5,$B9,$90,$EF,$A9               ;0E9985|        |0000B9;
                       db $24,$4C,$AA,$94                   ;0E998A|        |00004C;
 
       UNREACH_0E998E: db $A5,$28,$29,$40,$D0               ;0E998E|        |000028;
                       db $DE,$A5,$28,$4A,$B0               ;0E9993|        |0E28A5;
                       db $1A,$4A,$B0,$39,$4A               ;0E9998|        |      ;
                       db $90,$08,$20,$F7,$99               ;0E999D|        |0E99A7;
                       db $B0,$0E,$4C,$9A,$9B               ;0E99A2|        |0E99B2;
                       db $4A,$90,$08,$20,$16               ;0E99A7|        |      ;
                       db $9A,$B0,$03,$4C,$8E               ;0E99AC|        |      ;
                       db $9B,$60,$A9,$00,$8D               ;0E99B1|        |      ;
                       db $A8,$04,$AD,$EF,$05               ;0E99B6|        |      ;
                       db $F0,$0C,$20,$F7,$99               ;0E99BB|        |0E99C9;
                       db $B0,$F0,$A2,$00,$A0               ;0E99C0|        |0E99B2;
                       db $00,$4C,$AF,$9B,$20               ;0E99C5|        |      ;
                       db $16,$9A,$B0,$E4,$A2               ;0E99CA|        |00009A;
                       db $02,$A0,$08,$4C,$AF               ;0E99CF|        |      ;
                       db $9B,$A9,$01,$8D,$A8               ;0E99D4|        |      ;
                       db $04,$AD,$EF,$05,$F0               ;0E99D9|        |0000AD;
                       db $0C,$20,$16,$9A,$B0               ;0E99DE|        |0E1620;
                       db $CE,$A2,$02,$A0,$0C               ;0E99E3|        |0E02A2;
                       db $4C,$AF,$9B,$20,$F7               ;0E99E8|        |0E9BAF;
 
                       db $99,$B0,$C2,$A2,$00               ;0E99ED|        |0EC2B0;
                       db $A0,$04,$4C,$AF,$9B               ;0E99F2|        |      ;
                       db $AD,$1C,$04,$C9,$D7               ;0E99F7|        |0E041C;
                       db $90,$16,$A4,$68,$10               ;0E99FC|        |0E9A14;
                       db $12,$A5,$57,$C5,$71               ;0E9A01|        |0000A5;
                       db $D0,$06,$A5,$56,$C9               ;0E9A06|        |0E9A0E;
                       db $30,$F0,$06,$C0,$82               ;0E9A0B|        |0E99FD;
                       db $B0,$02,$38,$60,$18               ;0E9A10|        |0E9A14;
                       db $60,$AD,$1C,$04,$C9               ;0E9A15|        |      ;
 
                       db $37,$B0,$F7,$A4,$68               ;0E9A1A|        |0000B0;
                       db $10,$F3,$A5,$57,$05               ;0E9A1F|        |0E9A14;
                       db $56,$F0,$ED,$C0,$82               ;0E9A24|        |0000F0;
                       db $B0,$E9,$38,$60,$AD               ;0E9A29|        |0E9A14;
                       db $1C,$04,$AE,$20,$05               ;0E9A2E|        |0EAE04;
                       db $30,$10,$A6,$68,$30               ;0E9A33|        |0E9A45;
                       db $06,$C9,$D3,$B0,$22               ;0E9A38|        |0000C9;
                       db $18,$60,$C9,$D6,$B0               ;0E9A3D|        |      ;
                       db $2A,$18,$60,$A6,$68               ;0E9A42|        |      ;
                       db $30,$06,$C9,$29,$90               ;0E9A47|        |0E9A4F;
                       db $08,$18,$60,$C9,$34               ;0E9A4C|        |      ;
                       db $90,$2E,$18,$60,$A5               ;0E9A51|        |0E9A81;
                       db $2A,$C9,$10,$D0,$04               ;0E9A56|        |      ;
                       db $E6,$6B,$D0,$04,$A9               ;0E9A5B|        |00006B;
                       db $06,$85,$2A,$A9,$96               ;0E9A60|        |000085;
                       db $8D,$65,$05,$20,$85               ;0E9A65|        |0E0565;
                       db $FB,$38,$60,$A5,$57               ;0E9A6A|        |      ;
                       db $C5,$71,$D0,$06,$A5               ;0E9A6F|        |000071;
                       db $56,$C9,$30,$F0,$E6               ;0E9A74|        |0000C9;
                       db $A5,$68,$C9,$83,$D0               ;0E9A79|        |000068;
                       db $D4,$38,$60,$A5,$56               ;0E9A7E|        |000038;
                       db $05,$57,$F0,$D8,$A5               ;0E9A83|        |000057;
                       db $68,$C9,$82,$F0,$04               ;0E9A88|        |      ;
                       db $C9,$84,$D0,$C2,$38               ;0E9A8D|        |      ;
                       db $60                               ;0E9A92|        |      ;
 
 
       UNREACH_0E9A93: db $20,$2D,$9A,$90,$01               ;0E9A93|        |0E9A2D;
                       db $60,$20,$40,$87,$20               ;0E9A98|        |      ;
 
                       db $12,$87,$AD,$1D,$06               ;0E9A9D|        |000087;
                       db $F0,$4C,$CE,$1D,$06               ;0E9AA2|        |0E9AF0;
                       db $AD,$7C,$05,$F0,$04               ;0E9AA7|        |0E057C;
                       db $CE,$7C,$05,$60,$AD               ;0E9AAC|        |0E057C;
                       db $4E,$05,$C9,$02,$F0               ;0E9AB1|        |0EC905;
                       db $15,$AD,$93,$05,$0A               ;0E9AB6|        |0000AD;
                       db $A8,$B9,$EC,$9B,$8D               ;0E9ABB|        |      ;
                       db $00,$04,$B9,$ED,$9B               ;0E9AC0|        |      ;
                       db $8D,$7C,$05,$EE,$93               ;0E9AC5|        |0E057C;
                       db $05,$60,$AD,$93,$05               ;0E9ACA|        |000060;
                       db $0A,$A8,$B9,$F4,$9B               ;0E9ACF|        |      ;
                       db $8D,$00,$04,$B9,$F5               ;0E9AD4|        |0E0400;
                       db $9B,$8D,$7C,$05,$EE               ;0E9AD9|        |      ;
                       db $93,$05,$60,$AD,$1C               ;0E9ADE|        |000005;
                       db $04,$38,$E9,$04,$4C               ;0E9AE3|        |000038;
                       db $06,$9B,$18,$69,$07               ;0E9AE8|        |00009B;
                       db $4C,$18,$9B,$A9,$00               ;0E9AED|        |0E9B18;
 
                       db $8D,$C4,$04,$8D,$DB               ;0E9AF2|        |0E04C4;
                       db $04,$A4,$68,$10,$1F               ;0E9AF7|        |0000A4;
                       db $AC,$4E,$05,$C0,$02               ;0E9AFC|        |0E054E;
                       db $F0,$DE,$AD,$1C,$04               ;0E9B01|        |0E9AE1;
                       db $18,$69,$03,$18,$65               ;0E9B06|        |      ;
                       db $56,$29,$F8,$38,$E5               ;0E9B0B|        |000029;
                       db $56,$C0,$02,$F0,$D5               ;0E9B10|        |0000C0;
                       db $18,$69,$03,$8D,$1C               ;0E9B15|        |      ;
                       db $04,$AD,$20,$05,$30               ;0E9B1A|        |0000AD;
                       db $44,$A2,$12,$A9,$02               ;0E9B1F|        |      ;
                       db $20,$DD,$FC,$D0,$14               ;0E9B24|        |0EFCDD;
                       db $A2,$12,$A9,$FE,$20               ;0E9B29|        |      ;
                       db $DD,$FC,$F0,$56,$A2               ;0E9B2E|        |0EF0FC;
                       db $1A,$A9,$FE,$20,$DD               ;0E9B33|        |      ;
                       db $FC,$F0,$4D,$D0,$09               ;0E9B38|        |0E4DF0;
                       db $A2,$1A,$A9,$02,$20               ;0E9B3D|        |      ;
                       db $DD,$FC,$F0,$42,$20               ;0E9B42|        |0EF0FC;
                       db $02,$8A,$AD,$4E,$05               ;0E9B47|        |      ;
                       db $C9,$02,$D0,$09,$AD               ;0E9B4C|        |      ;
                       db $1C,$04,$18,$69,$04               ;0E9B51|        |0E1804;
                       db $8D,$1C,$04,$A9,$02               ;0E9B56|        |0E041C;
                       db $8D,$65,$05,$A9,$02               ;0E9B5B|        |0E0565;
                       db $8D,$00,$04,$60,$A2               ;0E9B60|        |0E0400;
                       db $12,$A9,$02,$20,$DD               ;0E9B65|        |0000A9;
                       db $FC,$D0,$12,$A2,$12               ;0E9B6A|        |0E12D0;
                       db $A9,$FE,$20,$DD,$FC               ;0E9B6F|        |      ;
                       db $F0,$12,$A2,$0A,$A9               ;0E9B74|        |0E9B88;
                       db $FE,$20,$DD,$FC,$F0               ;0E9B79|        |0EDD20;
                       db $C7,$A2,$0A,$A9,$02               ;0E9B7E|        |0000A2;
                       db $20,$DD,$FC,$F0,$BE               ;0E9B83|        |0EFCDD;
                       db $A9,$12,$8D,$65,$05               ;0E9B88|        |      ;
                       db $60,$A2,$02,$AD,$EF               ;0E9B8D|        |      ;
 
                       db $05,$8D,$A8,$04,$A0               ;0E9B92|        |00008D;
                       db $08,$D0,$0C,$A2,$00               ;0E9B97|        |      ;
                       db $AD,$EF,$05,$49,$01               ;0E9B9C|        |0E05EF;
                       db $8D,$A8,$04,$A0,$00               ;0E9BA1|        |0E04A8;
                       db $AD,$A8,$04,$F0,$04               ;0E9BA6|        |0E04A8;
                       db $C8,$C8,$C8,$C8,$8E               ;0E9BAB|        |      ;
                       db $93,$05,$B9,$DC,$9B               ;0E9BB0|        |000005;
                       db $8D,$F2,$04,$B9,$DD               ;0E9BB5|        |0E04F2;
                       db $9B,$8D,$09,$05,$B9               ;0E9BBA|        |      ;
                       db $DE,$9B,$8D,$20,$05               ;0E9BBF|        |0E8D9B;
                       db $B9,$DF,$9B,$8D,$37               ;0E9BC4|        |0E9BDF;
                       db $05,$A9,$01,$8D,$7C               ;0E9BC9|        |0000A9;
                       db $05,$AD,$DB,$9B,$8D               ;0E9BCE|        |0000AD;
                       db $1D,$06,$A9,$14,$8D               ;0E9BD3|        |0EA906;
                       db $65,$05,$60,$0F,$00               ;0E9BD8|        |000005;
                       db $80,$00,$80,$FF,$80               ;0E9BDD|        |0E9BDF;
                       db $00,$80,$00,$80,$FF               ;0E9BE2|        |      ;
                       db $80,$FF,$80,$FF,$80               ;0E9BE7|        |0E9BE8;
 
                       db $04,$07,$0A,$FF,$04               ;0E9BEC|        |000007;
                       db $07,$0C,$FF,$48,$07               ;0E9BF1|        |00000C;
                       db $0A,$FF,$48,$07,$0C               ;0E9BF6|        |      ;
                       db $FF                               ;0E9BFB|        |0565AC;
 
       UNREACH_0E9BFC: db $AC,$65,$05,$20,$86               ;0E9BFC|        |0E0565;
                       db $E8,$C5,$8A,$38,$95               ;0E9C01|        |      ;
                       db $60,$96,$1D,$96,$70               ;0E9C06|        |      ;
                       db $97,$19,$99,$70,$97               ;0E9C0B|        |000019;
                       db $53,$99,$67,$99,$8E               ;0E9C10|        |000099;
                       db $99,$93,$9A,$42,$99               ;0E9C15|        |0E9A93;
                       db $18,$94,$3A,$94,$65               ;0E9C1A|        |      ;
                       db $94,$9E,$94,$32,$9C               ;0E9C1F|        |00009E;
                       db $35,$9C,$38,$9C,$1C               ;0E9C24|        |00009C;
                       db $83,$B1,$93,$B1,$93               ;0E9C29|        |0000B1;
                       db $57,$8B,$DE,$8A,$4C               ;0E9C2E|        |00008B;
                       db $B8,$94,$4C,$D4,$94               ;0E9C33|        |      ;
                       db $4C,$FF,$94                       ;0E9C38|        |0E94FF;
 
 
       UNREACH_0E9C3B: db $AC,$65,$05,$20,$86               ;0E9C3B|        |0E0565;
                       db $E8,$C5,$8A,$38,$95               ;0E9C40|        |      ;
                       db $3B,$9D,$92,$9E,$3C               ;0E9C45|        |      ;
                       db $9F,$D5,$9C,$3C,$9F               ;0E9C4A|        |3C9CD5;
                       db $53,$99,$67,$99,$8E               ;0E9C4F|        |000099;
                       db $99,$93,$9A,$42,$99               ;0E9C54|        |0E9A93;
                       db $8B,$9C,$EB,$9E,$9F               ;0E9C59|        |      ;
                       db $9C,$9E,$94,$B8,$94               ;0E9C5E|        |0E949E;
                       db $C0,$9E,$FF,$94,$1C               ;0E9C63|        |      ;
                       db $83,$B1,$93,$B1,$93               ;0E9C68|        |0000B1;
                       db $57,$8B,$DE,$8A,$3B               ;0E9C6D|        |00008B;
                       db $A2,$65,$A3,$2E,$A4               ;0E9C72|        |      ;
                       db $41,$A4,$64,$A4,$77               ;0E9C77|        |0000A4;
                       db $A4,$80,$A4,$93,$A4               ;0E9C7C|        |000080;
                       db $9F,$A4,$B2,$A4,$88               ;0E9C81|        |A4B2A4;
                       db $A1,$26,$A2,$33,$A3               ;0E9C86|        |000026;
                       db $20,$1D,$84,$B0,$08               ;0E9C8B|        |0E841D;
                       db $A9,$00,$8D,$13,$04               ;0E9C90|        |      ;
                       db $4C,$8D,$A0,$20,$8E               ;0E9C95|        |0EA08D;
 
                       db $91,$4C,$28,$94,$60               ;0E9C9A|        |00004C;
                       db $20,$1D,$84,$90,$EC               ;0E9C9F|        |0E841D;
                       db $20,$8E,$91,$20,$EB               ;0E9CA4|        |0E918E;
                       db $9C,$AD,$65,$05,$C9               ;0E9CA9|        |0E65AD;
                       db $02,$D0,$13,$A9,$18               ;0E9CAE|        |      ;
                       db $8D,$65,$05,$20,$28               ;0E9CB3|        |0E0565;
                       db $94,$AD,$65,$05,$C9               ;0E9CB8|        |0000AD;
                       db $18,$D0,$03,$20,$CB               ;0E9CBD|        |      ;
                       db $BE,$60,$20,$89,$BC               ;0E9CC2|        |0E2060;
                       db $B0,$01,$60,$A9,$0A               ;0E9CC7|        |0E9CCA;
                       db $8D,$65,$05,$A9,$0E               ;0E9CCC|        |0E0565;
                       db $8D,$00,$04,$60,$20               ;0E9CD1|        |0E0400;
                       db $1D,$84,$B0,$03,$4C               ;0E9CD6|        |0EB084;
                       db $8D,$A0,$20,$8E,$91               ;0E9CDB|        |0E20A0;
                       db $A5,$26,$29,$40,$F0               ;0E9CE0|        |000026;
                       db $05,$A9,$1C,$20,$0A               ;0E9CE5|        |0000A9;
                       db $94,$A5,$28,$29,$04               ;0E9CEA|        |0000A5;
                       db $D0,$06,$A9,$02,$8D               ;0E9CEF|        |0E9CF7;
                       db $65,$05,$60,$AD,$65               ;0E9CF4|        |000005;
                       db $05,$C9,$0A,$D0,$F8               ;0E9CF9|        |0000C9;
                       db $20,$C4,$83,$90,$F3               ;0E9CFE|        |0E83C4;
                       db $20,$28,$9D,$D0,$EE               ;0E9D03|        |0E9D28;
                       db $AD,$A8,$04,$8D,$C1               ;0E9D08|        |0E04A8;
                       db $05,$20,$27,$A5,$AD               ;0E9D0D|        |000020;
                       db $1C,$04,$18,$69,$0C               ;0E9D12|        |0E1804;
                       db $85,$D3,$A9,$40,$8D               ;0E9D17|        |0000D3;
                       db $65,$05,$A0,$00,$8C               ;0E9D1C|        |000005;
                       db $93,$05,$C8,$8C,$7C               ;0E9D21|        |000005;
                       db $05,$60,$A9,$05,$A2               ;0E9D26|        |000060;
                       db $0C,$20,$DD,$FC,$F0               ;0E9D2B|        |0EDD20;
                       db $04,$A9,$01,$D0,$02               ;0E9D30|        |0000A9;
                       db $A9,$00,$CD,$A8,$04               ;0E9D35|        |      ;
                       db $60,$20,$1D,$84,$B0               ;0E9D3A|        |      ;
 
                       db $03,$4C,$8D,$A0,$A5               ;0E9D3F|        |00004C;
                       db $26,$0A,$90,$03,$4C               ;0E9D44|        |00000A;
                       db $FF,$9D,$0A,$B0,$19               ;0E9D49|        |B00A9D;
                       db $A5,$28,$4A,$B0,$32               ;0E9D4E|        |000028;
                       db $4A,$B0,$66,$A9,$02               ;0E9D53|        |      ;
                       db $8D,$65,$05,$20,$BC               ;0E9D58|        |0E0565;
                       db $8A,$20,$73,$EF,$20               ;0E9D5D|        |      ;
                       db $3A,$87,$4C,$12,$87               ;0E9D62|        |      ;
                       db $A5,$28,$29,$08,$D0               ;0E9D67|        |000028;
                       db $08,$A9,$18,$20,$0A               ;0E9D6C|        |      ;
                       db $94,$4C,$5B,$9D,$20               ;0E9D71|        |00004C;
                       db $F5,$B9,$90,$F3,$A9               ;0E9D76|        |0000B9;
                       db $20,$20,$AA,$94,$20               ;0E9D7B|        |0EAA20;
                       db $BC,$8A,$4C,$61,$9D               ;0E9D80|        |0E4C8A;
                       db $A9,$00,$8D,$A8,$04               ;0E9D85|        |      ;
                       db $20,$85,$8E,$90,$15               ;0E9D8A|        |0E8E85;
                       db $A2,$00,$A9,$08,$20               ;0E9D8F|        |      ;
                       db $DD,$FC,$D0,$62,$A2               ;0E9D94|        |0ED0FC;
                       db $F4,$A9,$08,$20,$DD               ;0E9D99|        |0E08A9;
                       db $FC,$D0,$59,$4C,$5E               ;0E9D9E|        |0E59D0;
                       db $9D,$A2,$00,$A9,$08               ;0E9DA3|        |0E00A2;
                       db $20,$DD,$FC,$D0,$6E               ;0E9DA8|        |0EFCDD;
                       db $A2,$F4,$A9,$08,$20               ;0E9DAD|        |      ;
                       db $DD,$FC,$D0,$44,$A9               ;0E9DB2|        |0ED0FC;
                       db $01,$A0,$40,$D0,$35               ;0E9DB7|        |0000A0;
                       db $A9,$01,$8D,$A8,$04               ;0E9DBC|        |      ;
                       db $20,$01,$8F,$90,$15               ;0E9DC1|        |0E8F01;
                       db $A2,$00,$A9,$F8,$20               ;0E9DC6|        |      ;
                       db $DD,$FC,$D0,$2B,$A2               ;0E9DCB|        |0ED0FC;
                       db $F4,$A9,$F8,$20,$DD               ;0E9DD0|        |0EF8A9;
                       db $FC,$D0,$22,$4C,$5E               ;0E9DD5|        |0E22D0;
                       db $9D,$A2,$00,$A9,$F8               ;0E9DDA|        |0E00A2;
                       db $20,$0B,$84,$D0,$27               ;0E9DDF|        |0E840B;
                       db $A2,$F4,$A9,$F8,$20               ;0E9DE4|        |      ;
                       db $DD,$FC,$D0,$0D,$A9               ;0E9DE9|        |0ED0FC;
                       db $FE,$A0,$C0,$8C,$09               ;0E9DEE|        |0EC0A0;
                       db $05,$8D,$F2,$04,$4C               ;0E9DF3|        |00008D;
                       db $5B,$9D,$A9,$00,$A8               ;0E9DF8|        |      ;
                       db $F0,$F2,$A9,$06,$8D               ;0E9DFD|        |0E9DF1;
                       db $65,$05,$4C,$5B,$9D               ;0E9E02|        |000005;
                       db $A9,$36,$D0,$02,$A9               ;0E9E07|        |      ;
                       db $18,$8D,$00,$04,$20               ;0E9E0C|        |      ;
                       db $36,$9E,$A9,$01,$D0               ;0E9E11|        |00009E;
                       db $0E,$A9,$36,$D0,$02               ;0E9E16|        |0E36A9;
                       db $A9,$18,$8D,$00,$04               ;0E9E1B|        |      ;
                       db $20,$3F,$9E,$A9,$00               ;0E9E20|        |0E9E3F;
                       db $8D,$C1,$05,$A9,$00               ;0E9E25|        |0E05C1;
                       db $8D,$D8,$05,$8D,$93               ;0E9E2A|        |0E05D8;
                       db $05,$A9,$30,$8D,$65               ;0E9E2F|        |0000A9;
                       db $05,$60,$AD,$38,$04               ;0E9E34|        |000060;
                       db $18,$69,$07,$4C,$42               ;0E9E39|        |      ;
                       db $9E,$AD,$38,$04,$A4               ;0E9E3E|        |0E38AD;
                       db $68,$30,$0C,$18,$65               ;0E9E43|        |      ;
                       db $56,$29,$F8,$38,$E5               ;0E9E48|        |000029;
                       db $56,$8D,$38,$04,$60               ;0E9E4D|        |00008D;
                       db $29,$F8,$8D,$38,$04               ;0E9E52|        |      ;
                       db $60,$80,$F9,$F9,$F9               ;0E9E57|        |      ;
 
                       db $F9,$F9,$F9,$F9,$F9               ;0E9E5C|        |0EF9F9;
                       db $F9,$F9,$F9,$F9,$F9               ;0E9E61|        |0EF9F9;
                       db $F9,$F9,$F9,$F9,$F9               ;0E9E66|        |0EF9F9;
                       db $F9,$FA,$FA,$FA,$FA               ;0E9E6B|        |0EFAFA;
                       db $FA,$FA,$FB,$FB,$FB               ;0E9E70|        |      ;
                       db $FB,$FB,$FC,$FC,$FC               ;0E9E75|        |      ;
                       db $FC,$FC,$FD,$FD,$FD               ;0E9E7A|        |0EFDFC;
                       db $FD,$FD,$FD,$FE,$FE               ;0E9E7F|        |0EFDFD;
                       db $FE,$FE,$FE,$FF,$FF               ;0E9E84|        |0EFEFE;
                       db $FF,$FF,$FF,$00,$00               ;0E9E89|        |00FFFF;
                       db $00,$00,$00,$81,$A9               ;0E9E8E|        |      ;
                       db $0E,$8D,$00,$04,$A9               ;0E9E93|        |0E008D;
                       db $04,$85,$B9,$A9,$00               ;0E9E98|        |000085;
                       db $8D,$C1,$05,$A9,$1E               ;0E9E9D|        |0E05C1;
                       db $8D,$D8,$05,$A9,$00               ;0E9EA2|        |0E05D8;
                       db $8D,$EF,$05,$8D,$06               ;0E9EA7|        |0E05EF;
                       db $06,$8D,$09,$05,$8D               ;0E9EAC|        |00008D;
                       db $F2,$04,$85,$9D,$A9               ;0E9EB1|        |000004;
                       db $01,$8D,$1D,$06,$A9               ;0E9EB6|        |00008D;
                       db $08,$8D,$65,$05,$60               ;0E9EBB|        |      ;
                       db $20,$5A,$9F,$AD,$65               ;0E9EC0|        |0E9F5A;
                       db $05,$C9,$26,$F0,$40               ;0E9EC5|        |0000C9;
                       db $C9,$02,$D0,$0C,$A9               ;0E9ECA|        |      ;
                       db $00,$85,$B9,$A9,$20               ;0E9ECF|        |      ;
                       db $8D,$65,$05,$4C,$C3               ;0E9ED4|        |0E0565;
                       db $94,$20,$F2,$BA,$B0               ;0E9ED9|        |000020;
                       db $01,$60,$A9,$08,$8D               ;0E9EDE|        |000060;
                       db $65,$05,$A9,$02,$8D               ;0E9EE3|        |000005;
                       db $00,$04,$60,$20,$5A               ;0E9EE8|        |      ;
                       db $9F,$AD,$65,$05,$C9               ;0E9EED|        |0565AD;
                       db $26,$F0,$15,$C9,$02               ;0E9EF2|        |0000F0;
                       db $D0,$0C,$A9,$00,$85               ;0E9EF7|        |0E9F05;
                       db $B9,$A9,$18,$8D,$65               ;0E9EFC|        |0E18A9;
                       db $05,$4C,$28,$94,$20               ;0E9F01|        |00004C;
                       db $89,$BC,$B0,$D6,$60               ;0E9F06|        |      ;
                       db $AD,$1C,$04,$18,$69               ;0E9F0B|        |0E041C;
                       db $01,$8D,$1C,$04,$20               ;0E9F10|        |00008D;
                       db $02,$8A,$AD,$1C,$04               ;0E9F15|        |      ;
                       db $18,$69,$05,$8D,$1C               ;0E9F1A|        |      ;
                       db $04,$A9,$02,$20,$57               ;0E9F1F|        |0000A9;
                       db $EF,$A9,$32,$8D,$65               ;0E9F24|        |8D32A9;
                       db $05,$60,$A9,$00,$F0               ;0E9F29|        |000060;
                       db $02,$A9,$FF,$A2,$00               ;0E9F2E|        |      ;
                       db $20,$0B,$84,$F0,$02               ;0E9F33|        |0E840B;
                       db $18,$60,$38,$60,$A5               ;0E9F38|        |      ;
                       db $26,$29,$40,$F0,$18               ;0E9F3D|        |000029;
                       db $A5,$28,$29,$08,$D0               ;0E9F42|        |000028;
                       db $08,$A9,$1A,$20,$0A               ;0E9F47|        |      ;
                       db $94,$4C,$5A,$9F,$20               ;0E9F4C|        |00004C;
                       db $F5,$B9,$90,$F3,$A9               ;0E9F51|        |0000B9;
                       db $22,$20,$AA,$94,$20               ;0E9F56|        |94AA20;
                       db $AA,$83,$B0,$DC,$A5               ;0E9F5B|        |      ;
                       db $28,$4A,$B0,$23,$4A               ;0E9F60|        |      ;
                       db $90,$40,$A9,$01,$8D               ;0E9F65|        |0E9FA7;
                       db $A8,$04,$A9,$FF,$8D               ;0E9F6A|        |      ;
                       db $F2,$04,$A9,$00,$8D               ;0E9F6F|        |000004;
                       db $09,$05,$A2,$00,$A9               ;0E9F74|        |      ;
                       db $F8,$20,$0B,$84,$F0               ;0E9F79|        |      ;
                       db $28,$20,$2F,$9F,$90               ;0E9F7E|        |      ;
                       db $23,$4C,$0B,$9E,$A9               ;0E9F83|        |00004C;
                       db $00,$8D,$A8,$04,$A9               ;0E9F88|        |      ;
                       db $01,$8D,$F2,$04,$A9               ;0E9F8D|        |00008D;
                       db $00,$8D,$09,$05,$A2               ;0E9F92|        |      ;
                       db $00,$A9,$08,$20,$0B               ;0E9F97|        |      ;
                       db $84,$F0,$08,$20,$2B               ;0E9F9C|        |0000F0;
                       db $9F,$90,$03,$4C,$1B               ;0E9FA1|        |4C0390;
                       db $9E,$A5,$28,$29,$08               ;0E9FA6|        |0E28A5;
                       db $F0,$14,$A2,$F8,$A9               ;0E9FAB|        |0E9FC1;
                       db $00,$20,$0B,$84,$F0               ;0E9FB0|        |      ;
                       db $0B,$A2,$00,$8A,$20               ;0E9FB5|        |      ;
                       db $0B,$84,$D0,$03,$4C               ;0E9FBA|        |      ;
                       db $0B,$9F,$AD,$F2,$04               ;0E9FBF|        |      ;
                       db $10,$1D,$A2,$0C,$A9               ;0E9FC4|        |0E9FE3;
                       db $F8,$20,$DD,$FC,$D0               ;0E9FC9|        |      ;
                       db $2F,$A2,$00,$A9,$F8               ;0E9FCE|        |A900A2;
                       db $20,$DD,$FC,$D0,$26               ;0E9FD3|        |0EFCDD;
                       db $A2,$F4,$A9,$F8,$20               ;0E9FD8|        |      ;
                       db $DD,$FC,$F0,$25,$D0               ;0E9FDD|        |0EF0FC;
                       db $1B,$A2,$0C,$A9,$08               ;0E9FE2|        |      ;
                       db $20,$DD,$FC,$D0,$12               ;0E9FE7|        |0EFCDD;
                       db $A2,$00,$A9,$08,$20               ;0E9FEC|        |      ;
                       db $DD,$FC,$D0,$09,$A2               ;0E9FF1|        |0ED0FC;
                       db $F4,$A9,$08,$20,$DD               ;0E9FF6|        |0E08A9;
                       db $FC,$F0,$08,$A9,$00               ;0E9FFB|        |0E08F0;
                       db $8D,$F2,$04,$8D,$09               ;0EA000|        |0E04F2;
                       db $05,$AD,$1C,$04,$85               ;0EA005|        |0000AD;
                       db $06,$20,$D1,$A0,$AD               ;0EA00A|        |000020;
                       db $C1,$05,$F0,$57,$A2               ;0EA00F|        |000005;
                       db $0C,$A9,$FB,$20,$DD               ;0EA014|        |0EFBA9;
                       db $FC,$D0,$22,$A2,$0C               ;0EA019|        |0E22D0;
                       db $A9,$05,$20,$DD,$FC               ;0EA01E|        |      ;
                       db $D0,$19,$A5,$8B,$C9               ;0EA023|        |0EA03E;
                       db $01,$F0,$0B,$C9,$05               ;0EA028|        |0000F0;
                       db $F0,$53,$C9,$06,$F0               ;0EA02D|        |0EA082;
                       db $4F,$4C,$64,$A0,$A6               ;0EA032|        |A0644C;
                       db $91,$20,$9C,$FE,$4C               ;0EA037|        |000020;
                       db $5D,$A0,$AD,$D8,$05               ;0EA03C|        |0EADA0;
                       db $D0,$0E,$A9,$0B,$20               ;0EA041|        |0EA051;
                       db $5F,$E2,$A9,$0C,$85               ;0EA046|        |0CA9E2;
                       db $B9,$A9,$0E,$8D,$00               ;0EA04B|        |0E0EA9;
                       db $04,$20,$02,$8A,$AD               ;0EA050|        |000020;
                       db $1C,$04,$18,$69,$04               ;0EA055|        |0E1804;
                       db $8D,$1C,$04,$A9,$02               ;0EA05A|        |0E041C;
                       db $8D,$65,$05,$D0,$03               ;0EA05F|        |0E0565;
                       db $20,$12,$87,$4C,$3A               ;0EA064|        |0E8712;
                       db $87,$A2,$00,$A9,$05               ;0EA069|        |0000A2;
                       db $20,$0B,$84,$D0,$09               ;0EA06E|        |0E840B;
                       db $A2,$00,$A9,$FB,$20               ;0EA073|        |      ;
                       db $0B,$84,$F0,$E8,$20               ;0EA078|        |      ;
                       db $8D,$A0,$4C,$64,$A0               ;0EA07D|        |0E4CA0;
                       db $A5,$06,$18,$65,$91               ;0EA082|        |000006;
                       db $8D,$1C,$04,$4C,$5D               ;0EA087|        |0E041C;
                       db $A0,$A9,$0C,$8D,$65               ;0EA08C|        |      ;
                       db $05,$A5,$CF,$C9,$01               ;0EA091|        |0000A5;
                       db $F0,$04,$C9,$06,$D0               ;0EA096|        |0EA09C;
                       db $04,$A9,$10,$85,$AF               ;0EA09B|        |0000A9;
                       db $A9,$01,$8D,$C1,$05               ;0EA0A0|        |      ;
                       db $A9,$38,$8D,$D8,$05               ;0EA0A5|        |      ;
                       db $A9,$00,$8D,$EF,$05               ;0EA0AA|        |      ;
                       db $8D,$06,$06,$85,$9D               ;0EA0AF|        |0E0606;
                       db $85,$B9,$A9,$01,$8D               ;0EA0B4|        |0000B9;
                       db $1D,$06,$AD,$A8,$04               ;0EA0B9|        |0EAD06;
                       db $D0,$06,$A9,$00,$A0               ;0EA0BE|        |0EA0C6;
                       db $20,$D0,$04,$A9,$FF               ;0EA0C3|        |0E04D0;
                       db $A0,$E0,$8D,$F2,$04               ;0EA0C8|        |      ;
                       db $8C,$09,$05,$60,$AD               ;0EA0CD|        |0E0509;
                       db $65,$05,$C9,$08,$D0               ;0EA0D2|        |000005;
                       db $0D,$A5,$B9,$F0,$09               ;0EA0D7|        |0EB9A5;
                       db $C6,$B9,$D0,$05,$A9               ;0EA0DC|        |0000B9;
                       db $16,$8D,$00,$04,$AD               ;0EA0E1|        |00008D;
                       db $C1,$05,$D0,$0C,$A5               ;0EA0E6|        |000005;
                       db $9D,$D0,$12,$A5,$28               ;0EA0EB|        |0E12D0;
                       db $29,$80,$D0,$0C,$E6               ;0EA0F0|        |      ;
                       db $9D,$A9,$02,$8D,$1D               ;0EA0F5|        |0E02A9;
                       db $06,$A9,$00,$8D,$06               ;0EA0FA|        |0000A9;
                       db $06,$AD,$1C,$04,$C9               ;0EA0FF|        |0000AD;
                       db $08,$B0,$08,$AD,$C1               ;0EA104|        |      ;
                       db $05,$D0,$03,$20,$A0               ;0EA109|        |0000D0;
                       db $A0,$4C,$12,$A1,$A9               ;0EA10E|        |      ;
                       db $00,$8D,$37,$05,$8D               ;0EA113|        |      ;
                       db $DB,$04,$AC,$D8,$05               ;0EA118|        |      ;
                       db $AD,$C1,$05,$D0,$37               ;0EA11D|        |0E05C1;
                       db $B9,$58,$9E,$C9,$81               ;0EA122|        |0E9E58;
                       db $F0,$1D,$8D,$20,$05               ;0EA127|        |0EA146;
                       db $18,$AD,$EF,$05,$6D               ;0EA12C|        |      ;
                       db $06,$06,$8D,$EF,$05               ;0EA131|        |000006;
                       db $AD,$D8,$05,$6D,$1D               ;0EA136|        |0E05D8;
                       db $06,$C9,$39,$90,$02               ;0EA13B|        |0000C9;
                       db $A9,$39,$8D,$D8,$05               ;0EA140|        |      ;
                       db $60,$A9,$00,$8D,$20               ;0EA145|        |      ;
 
                       db $05,$A0,$01,$8C,$C1               ;0EA14A|        |0000A0;
                       db $05,$CE,$D8,$05,$A9               ;0EA14F|        |0000CE;
                       db $00,$8D,$EF,$05,$60               ;0EA154|        |      ;
                       db $B9,$58,$9E,$C9,$80               ;0EA159|        |0E9E58;
                       db $F0,$23,$38,$AD,$EF               ;0EA15E|        |0EA183;
                       db $05,$ED,$06,$06,$8D               ;0EA163|        |0000ED;
                       db $EF,$05,$AD,$D8,$05               ;0EA168|        |D8AD05;
                       db $ED,$1D,$06,$10,$02               ;0EA16D|        |0E061D;
                       db $A9,$00,$8D,$D8,$05               ;0EA172|        |      ;
                       db $B9,$58,$9E,$49,$FF               ;0EA177|        |0E9E58;
                       db $18,$69,$01,$8D,$20               ;0EA17C|        |      ;
                       db $05,$60,$B9,$59,$9E               ;0EA181|        |000060;
                       db $D0,$F2,$CE,$D8,$05               ;0EA186|        |0EA17A;
                       db $F0,$28,$A2,$F8,$A9               ;0EA18B|        |0EA1B5;
                       db $00,$20,$0B,$84,$D0               ;0EA190|        |      ;
                       db $1F,$AD,$1C,$04,$C9               ;0EA195|        |041CAD;
                       db $08,$90,$13,$A9,$08               ;0EA19A|        |      ;
                       db $AE,$A8,$04,$F0,$02               ;0EA19F|        |0E04A8;
                       db $A9,$F7,$A2,$00,$20               ;0EA1A4|        |      ;
                       db $0B,$84,$F0,$18,$4C               ;0EA1A9|        |      ;
                       db $12,$87,$A9,$08,$8D               ;0EA1AE|        |000087;
                       db $1C,$04,$A9,$00,$8D               ;0EA1B3|        |0EA904;
                       db $D8,$05,$A9,$18,$8D               ;0EA1B8|        |      ;
                       db $00,$04,$A9,$30,$8D               ;0EA1BD|        |      ;
                       db $65,$05,$60,$A9,$06               ;0EA1C2|        |000005;
                       db $8D,$65,$05,$60,$A9               ;0EA1C7|        |0E0565;
                       db $00,$8D,$C1,$05,$AD               ;0EA1CC|        |      ;
                       db $38,$04,$18,$69,$08               ;0EA1D1|        |      ;
                       db $4C,$E4,$A1,$A9,$01               ;0EA1D6|        |0EA1E4;
 
                       db $8D,$C1,$05,$AD,$38               ;0EA1DB|        |0E05C1;
                       db $04,$38,$E9,$08,$8D               ;0EA1E0|        |000038;
                       db $D8,$05,$20,$3B,$A5               ;0EA1E5|        |      ;
                       db $A9,$3C,$8D,$65,$05               ;0EA1EA|        |      ;
                       db $A0,$00,$8C,$93,$05               ;0EA1EF|        |      ;
                       db $C8,$8C,$7C,$05,$60               ;0EA1F4|        |      ;
                       db $A9,$00,$8D,$C1,$05               ;0EA1F9|        |      ;
                       db $AD,$38,$04,$18,$69               ;0EA1FE|        |0E0438;
                       db $08,$4C,$12,$A2,$A9               ;0EA203|        |      ;
                       db $01,$8D,$C1,$05,$AD               ;0EA208|        |00008D;
                       db $38,$04,$38,$E9,$08               ;0EA20D|        |      ;
                       db $8D,$D8,$05,$18,$A9               ;0EA212|        |0E05D8;
                       db $01,$6D,$1C,$04,$8D               ;0EA217|        |00006D;
                       db $1C,$04,$20,$35,$A5               ;0EA21C|        |0E2004;
                       db $A9,$38,$4C,$EC,$A1               ;0EA221|        |      ;
                       db $20,$F2,$BA,$B0,$01               ;0EA226|        |0EBAF2;
                       db $60,$A0,$00,$8C,$93               ;0EA22B|        |      ;
 
                       db $05,$C8,$8C,$7C,$05               ;0EA230|        |0000C8;
                       db $A9,$30,$8D,$65,$05               ;0EA235|        |      ;
                       db $60,$A5,$26,$29,$40               ;0EA23A|        |      ;
 
                       db $F0,$0A,$20,$F5,$B9               ;0EA23F|        |0EA24B;
                       db $90,$05,$A9,$46,$4C               ;0EA244|        |0EA24B;
                       db $AA,$94,$A5,$26,$29               ;0EA249|        |      ;
                       db $80,$F0,$1A,$A9,$44               ;0EA24E|        |0EA240;
                       db $8D,$65,$05,$A9,$08               ;0EA253|        |0E0565;
                       db $8D,$D8,$05,$A9,$1A               ;0EA258|        |0E05D8;
                       db $8D,$00,$04,$A9,$FE               ;0EA25D|        |0E0400;
                       db $8D,$20,$05,$A9,$00               ;0EA262|        |0E0520;
                       db $8D,$37,$05,$60,$AD               ;0EA267|        |0E0537;
                       db $D8,$05,$F0,$04,$CE               ;0EA26C|        |      ;
                       db $D8,$05,$60,$AD,$C1               ;0EA271|        |      ;
                       db $05,$F0,$44,$A5,$28               ;0EA276|        |0000F0;
                       db $29,$02,$F0,$21,$A2               ;0EA27B|        |      ;
                       db $00,$A9,$F7,$20,$0B               ;0EA280|        |      ;
                       db $84,$F0,$32,$A2,$01               ;0EA285|        |0000F0;
                       db $A9,$F7,$20,$0B,$84               ;0EA28A|        |      ;
                       db $D0,$03,$4C,$07,$A2               ;0EA28F|        |0EA294;
                       db $A2,$FF,$A9,$F7,$20               ;0EA294|        |      ;
                       db $0B,$84,$D0,$47,$4C               ;0EA299|        |      ;
                       db $D9,$A1,$A5,$28,$29               ;0EA29E|        |0EA5A1;
                       db $08,$F0,$14,$A2,$F8               ;0EA2A3|        |      ;
                       db $A9,$00,$20,$DD,$FC               ;0EA2A8|        |      ;
                       db $F0,$0B,$AD,$A8,$04               ;0EA2AD|        |0EA2BA;
                       db $49,$01,$8D,$A8,$04               ;0EA2B2|        |      ;
                       db $4C,$0B,$9F,$4C,$8D               ;0EA2B7|        |0E9F0B;
 
                       db $A0,$A5,$28,$29,$01               ;0EA2BC|        |      ;
                       db $F0,$DD,$A2,$00,$A9               ;0EA2C1|        |0EA2A0;
                       db $08,$20,$0B,$84,$F0               ;0EA2C6|        |      ;
                       db $EE,$A2,$01,$A9,$08               ;0EA2CB|        |0E01A2;
                       db $20,$0B,$84,$D0,$03               ;0EA2D0|        |0E840B;
                       db $4C,$F9,$A1,$A2,$FF               ;0EA2D5|        |0EA1F9;
 
                       db $A9,$08,$20,$0B,$84               ;0EA2DA|        |      ;
                       db $D0,$03,$4C,$CB,$A1               ;0EA2DF|        |0EA2E4;
                       db $A5,$28,$29,$04,$D0               ;0EA2E4|        |000028;
                       db $07,$A5,$28,$29,$08               ;0EA2E9|        |0000A5;
                       db $D0,$1F,$60,$A9,$0D               ;0EA2EE|        |0EA30F;
                       db $8D,$AA,$05,$A2,$0C               ;0EA2F3|        |0E05AA;
                       db $A9,$00,$20,$0B,$84               ;0EA2F8|        |      ;
                       db $D0,$0D,$A9,$01,$8D               ;0EA2FD|        |0EA30C;
                       db $20,$05,$A9,$00,$8D               ;0EA302|        |0EA905;
                       db $37,$05,$20,$12,$87               ;0EA307|        |000005;
                       db $4C,$73,$EF,$A9,$01               ;0EA30C|        |0EEF73;
 
                       db $8D,$AA,$05,$AD,$1C               ;0EA311|        |0E05AA;
                       db $04,$C9,$08,$B0,$07               ;0EA316|        |0000C9;
                       db $A9,$08,$8D,$1C,$04               ;0EA31B|        |      ;
                       db $D0,$EA,$A2,$F8,$A9               ;0EA320|        |0EA30C;
                       db $00,$20,$0B,$84,$D0               ;0EA325|        |      ;
                       db $E1,$A9,$FF,$8D,$20               ;0EA32A|        |0000A9;
                       db $05,$4C,$04,$A3,$20               ;0EA32F|        |00004C;
                       db $F2,$BA,$B0,$01,$60               ;0EA334|        |0000BA;
                       db $A9,$02,$20,$57,$EF               ;0EA339|        |      ;
                       db $A9,$32,$8D,$65,$05               ;0EA33E|        |      ;
                       db $60,$20,$8D,$A0,$38               ;0EA343|        |      ;
 
                       db $60,$A2,$F8,$A9,$00               ;0EA348|        |      ;
 
                       db $20,$0B,$84,$F0,$F2               ;0EA34D|        |0E840B;
                       db $C9,$05,$F0,$06,$C9               ;0EA352|        |      ;
                       db $07,$F0,$02,$18,$60               ;0EA357|        |0000F0;
                       db $A5,$80,$D0,$FA,$20               ;0EA35C|        |000080;
                       db $F4,$83,$38,$60,$A5               ;0EA361|        |0E3883;
                       db $26,$29,$40,$F0,$0A               ;0EA366|        |000029;
                       db $20,$F5,$B9,$90,$05               ;0EA36B|        |0EB9F5;
                       db $A9,$48,$4C,$AA,$94               ;0EA370|        |      ;
                       db $A5,$28,$29,$08,$D0               ;0EA375|        |000028;
                       db $3B,$A5,$28,$4A,$B0               ;0EA37A|        |      ;
                       db $1E,$4A,$B0,$03,$4C               ;0EA37F|        |0EB04A;
                       db $8D,$A0,$A2,$00,$A9               ;0EA384|        |0EA2A0;
                       db $F4,$20,$0B,$84,$D0               ;0EA389|        |0E0B20;
                       db $03,$4C,$8D,$A0,$AD               ;0EA38E|        |00004C;
                       db $38,$04,$38,$E9,$04               ;0EA393|        |      ;
                       db $8D,$38,$04,$4C,$0B               ;0EA398|        |0E0438;
                       db $9E,$A2,$00,$A9,$0C               ;0EA39D|        |0E00A2;
                       db $20,$0B,$84,$D0,$03               ;0EA3A2|        |0E840B;
                       db $4C,$8D,$A0,$AD,$38               ;0EA3A7|        |0EA08D;
 
                       db $04,$18,$69,$04,$8D               ;0EA3AC|        |000018;
                       db $38,$04,$4C,$1B,$9E               ;0EA3B1|        |      ;
                       db $20,$49,$A3,$B0,$3B               ;0EA3B6|        |0EA349;
                       db $A2,$F8,$A9,$FF,$20               ;0EA3BB|        |      ;
                       db $0B,$84,$F0,$0C,$A2               ;0EA3C0|        |      ;
                       db $F8,$A9,$01,$20,$0B               ;0EA3C5|        |      ;
                       db $84,$F0,$07,$4C,$E9               ;0EA3CA|        |0000F0;
                       db $A3,$A9,$01,$D0,$02               ;0EA3CF|        |0000A9;
                       db $A9,$00,$8D,$C1,$05               ;0EA3D4|        |      ;
                       db $20,$4A,$A5,$AD,$1C               ;0EA3D9|        |0EA54A;
                       db $04,$38,$E9,$08,$85               ;0EA3DE|        |000038;
                       db $D3,$A9,$34,$4C,$EC               ;0EA3E3|        |0000A9;
                       db $A1,$A5,$28,$4A,$B0               ;0EA3E8|        |0000A5;
                       db $09,$4A,$B0,$1A,$A9               ;0EA3ED|        |      ;
                       db $1E,$8D,$00,$04,$60               ;0EA3F2|        |0E008D;
                       db $A9,$00,$8D,$A8,$04               ;0EA3F7|        |      ;
                       db $A2,$00,$A9,$0C,$20               ;0EA3FC|        |      ;
                       db $0B,$84,$D0,$14,$A9               ;0EA401|        |      ;
                       db $01,$A0,$40,$D0,$17               ;0EA406|        |0000A0;
                       db $A9,$01,$8D,$A8,$04               ;0EA40B|        |      ;
                       db $A2,$00,$A9,$F4,$20               ;0EA410|        |      ;
                       db $0B,$84,$F0,$05,$A9               ;0EA415|        |      ;
                       db $00,$A8,$F0,$04,$A9               ;0EA41A|        |      ;
                       db $FE,$A0,$C0,$8D,$F2               ;0EA41F|        |0EC0A0;
                       db $04,$8C,$09,$05,$20               ;0EA424|        |00008C;
                       db $73,$EF,$4C,$3A,$87               ;0EA429|        |0000EF;
                       db $A0,$00,$20,$CC,$A4               ;0EA42E|        |      ;
                       db $B0,$01,$60,$A9,$36               ;0EA433|        |0EA436;
                       db $8D,$65,$05,$A9,$08               ;0EA438|        |0E0565;
                       db $8D,$7C,$05,$60,$CE               ;0EA43D|        |0E057C;
                       db $7C,$05,$F0,$01,$60               ;0EA442|        |0EF005;
                       db $AD,$C1,$05,$F0,$06               ;0EA447|        |0E05C1;
                       db $20,$1B,$9E,$4C,$55               ;0EA44C|        |0E9E1B;
                       db $A4,$20,$0B,$9E,$A0               ;0EA451|        |000020;
                       db $00,$8C,$93,$05,$C8               ;0EA456|        |      ;
                       db $8C,$7C,$05,$A9,$00               ;0EA45B|        |0E057C;
                       db $8D,$D8,$05,$60,$A0               ;0EA460|        |0E05D8;
                       db $02,$20,$CC,$A4,$B0               ;0EA465|        |      ;
                       db $01,$60,$A9,$3A,$8D               ;0EA46A|        |000060;
                       db $65,$05,$A9,$10,$8D               ;0EA46F|        |000005;
                       db $7C,$05,$60,$CE,$7C               ;0EA474|        |0E6005;
                       db $05,$F0,$01,$60,$4C               ;0EA479|        |0000F0;
                       db $0B,$9F,$A0,$04,$20               ;0EA47E|        |      ;
                       db $CC,$A4,$B0,$01,$60               ;0EA483|        |0EB0A4;
                       db $A9,$3E,$8D,$65,$05               ;0EA488|        |      ;
                       db $A9,$08,$8D,$7C,$05               ;0EA48D|        |      ;
                       db $60,$CE,$7C,$05,$F0               ;0EA492|        |      ;
 
                       db $01,$60,$A9,$02,$8D               ;0EA497|        |000060;
                       db $65,$05,$60,$A0,$06               ;0EA49C|        |000005;
                       db $20,$CC,$A4,$B0,$01               ;0EA4A1|        |0EA4CC;
                       db $60,$A9,$42,$8D,$65               ;0EA4A6|        |      ;
 
                       db $05,$A9,$08,$8D,$7C               ;0EA4AB|        |0000A9;
                       db $05,$60,$CE,$7C,$05               ;0EA4B0|        |000060;
                       db $F0,$01,$60,$AD,$C1               ;0EA4B5|        |0EA4B8;
                       db $05,$F0,$06,$20,$17               ;0EA4BA|        |0000F0;
                       db $9E,$4C,$C6,$A4,$20               ;0EA4BF|        |0EC64C;
                       db $07,$9E,$A9,$00,$8D               ;0EA4C4|        |00009E;
                       db $D8,$05,$60,$CE,$7C               ;0EA4C9|        |      ;
                       db $05,$F0,$04,$18,$60               ;0EA4CE|        |0000F0;
                       db $38,$60,$B9,$74,$A5               ;0EA4D3|        |      ;
                       db $85,$08,$B9,$75,$A5               ;0EA4D8|        |000008;
                       db $85,$09,$AD,$93,$05               ;0EA4DD|        |000009;
                       db $0A,$0A,$18,$6D,$93               ;0EA4E2|        |      ;
                       db $05,$A8,$B1,$08,$C9               ;0EA4E7|        |0000A8;
                       db $FF,$F0,$E4,$8D,$00               ;0EA4EC|        |8DE4F0;
                       db $04,$C8,$AD,$C1,$05               ;0EA4F1|        |0000C8;
                       db $F0,$09,$AD,$D8,$05               ;0EA4F6|        |0EA501;
                       db $38,$F1,$08,$4C,$07               ;0EA4FB|        |      ;
                       db $A5,$AD,$D8,$05,$18               ;0EA500|        |0000AD;
                       db $71,$08,$8D,$38,$04               ;0EA505|        |000008;
                       db $C8,$B1,$08,$18,$65               ;0EA50A|        |      ;
                       db $D3,$8D,$1C,$04,$C8               ;0EA50F|        |00008D;
                       db $B1,$08,$8D,$7C,$05               ;0EA514|        |000008;
                       db $C8,$B1,$08,$4D,$C1               ;0EA519|        |      ;
                       db $05,$8D,$A8,$04,$EE               ;0EA51E|        |00008D;
                       db $93,$05,$18,$60,$AD               ;0EA523|        |000005;
                       db $C1,$05,$F0,$2C,$A9               ;0EA528|        |000005;
                       db $07,$18,$6D,$38,$04               ;0EA52D|        |000018;
                       db $4C,$5E,$A5,$20,$02               ;0EA532|        |0EA55E;
 
                       db $8A,$85,$D3,$60,$AD               ;0EA537|        |      ;
                       db $1C,$04,$18,$69,$01               ;0EA53C|        |0E1804;
                       db $8D,$1C,$04,$20,$02               ;0EA541|        |0E041C;
                       db $8A,$85,$D3,$60,$AD               ;0EA546|        |      ;
                       db $C1,$05,$F0,$09,$A9               ;0EA54B|        |000005;
                       db $02,$18,$6D,$38,$04               ;0EA550|        |      ;
                       db $4C,$5E,$A5,$18,$A9               ;0EA555|        |0EA55E;
 
                       db $01,$6D,$38,$04,$A4               ;0EA55A|        |00006D;
                       db $68,$30,$0C,$18,$65               ;0EA55F|        |      ;
                       db $56,$29,$F8,$38,$E5               ;0EA564|        |000029;
                       db $56,$8D,$D8,$05,$60               ;0EA569|        |00008D;
                       db $29,$F8,$8D,$D8,$05               ;0EA56E|        |      ;
                       db $60,$7C,$A5,$87,$A5               ;0EA573|        |      ;
 
                       db $92,$A5,$9D,$A5,$3C               ;0EA578|        |0000A5;
                       db $00,$00,$08,$00,$18               ;0EA57D|        |      ;
                       db $08,$F8,$01,$01,$FF               ;0EA582|        |      ;
                       db $42,$00,$00,$08,$00               ;0EA587|        |      ;
                       db $1E,$08,$04,$01,$00               ;0EA58C|        |0E0408;
                       db $FF,$40,$00,$00,$08               ;0EA591|        |000040;
                       db $00,$0E,$00,$F4,$01               ;0EA596|        |      ;
                       db $00,$FF,$3E,$00,$00               ;0EA59B|        |      ;
                       db $08,$00,$36,$08,$08               ;0EA5A0|        |      ;
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
                       db $F8,$A5,$F8,$A5,$F9               ;0EA5CC|        |      ;
                       db $A5,$F8,$A5,$B8,$94               ;0EA5D1|        |0000F8;
                       db $D4,$94,$FF,$94,$1C               ;0EA5D6|        |000094;
                       db $83,$B1,$93,$B1,$93               ;0EA5DB|        |0000B1;
                       db $57,$8B,$DE,$8A,$BB               ;0EA5E0|        |00008B;
                       db $A6,$D3,$A6,$56,$A8               ;0EA5E5|        |0000D3;
                       db $8F,$AC,$C7,$AC,$07               ;0EA5EA|        |ACC7AC;
                       db $AD,$26,$A7,$37,$A7               ;0EA5EF|        |0EA726;
                       db $ED,$A7,$8B,$A7,$60               ;0EA5F4|        |0E8BA7;
                       db $20,$21,$84,$B0,$03               ;0EA5F9|        |0E8421;
                       db $4C,$3A,$97,$20,$8E               ;0EA5FE|        |0E973A;
 
                       db $91,$20,$36,$99,$AD               ;0EA603|        |000020;
                       db $65,$05,$C9,$02,$D0               ;0EA608|        |000005;
                       db $08,$A9,$20,$8D,$65               ;0EA60D|        |      ;
                       db $05,$4C,$B8,$94,$20               ;0EA612|        |00004C;
                       db $F2,$BA,$B0,$01,$60               ;0EA617|        |0000BA;
                       db $A9,$0A,$8D,$65,$05               ;0EA61C|        |      ;
                       db $A9,$0E,$8D,$00,$04               ;0EA621|        |      ;
                       db $60,$A9,$05,$A2,$F0               ;0EA626|        |      ;
 
                       db $20,$0B,$84,$F0,$1D               ;0EA62B|        |0E840B;
                       db $A9,$05,$A2,$10,$20               ;0EA630|        |      ;
                       db $0B,$84,$F0,$14,$A9               ;0EA635|        |      ;
                       db $FB,$A2,$F0,$20,$0B               ;0EA63A|        |      ;
                       db $84,$F0,$0B,$A9,$FB               ;0EA63F|        |0000F0;
                       db $A2,$10,$20,$0B,$84               ;0EA644|        |      ;
                       db $F0,$02,$38,$60,$18               ;0EA649|        |0EA64D;
                       db $60                               ;0EA64E|        |      ;
 
 
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
 
 
       UNREACH_0EA675: db $A0,$00,$B9,$A2,$A6               ;0EA675|        |      ;
                       db $C9,$FF,$F0,$13,$CD               ;0EA67A|        |      ;
                       db $65,$05,$F0,$03,$C8               ;0EA67F|        |000005;
                       db $D0,$F1,$20,$27,$A6               ;0EA684|        |0EA677;
                       db $B0,$E9,$A9,$3C,$8D               ;0EA689|        |0EA674;
                       db $65,$05,$60,$A9,$30               ;0EA68E|        |000005;
                       db $8D,$65,$05,$60                   ;0EA693|        |0E0565;
 
       UNREACH_0EA697: db $00,$16,$30,$32,$3C               ;0EA697|        |      ;
                       db $3E,$28,$2A,$2C,$2E               ;0EA69C|        |0E2A28;
                       db $FF                               ;0EA6A1|        |383634;
 
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
 
                       db $A9,$2F,$20,$5F,$E2               ;0EA6BB|        |      ;
                       db $A9,$05,$20,$57,$EF               ;0EA6C0|        |      ;
                       db $A9,$01,$8D,$C1,$05               ;0EA6C5|        |      ;
                       db $85,$AE,$EE,$65,$05               ;0EA6CA|        |0000AE;
                       db $EE,$65,$05,$60,$AD               ;0EA6CF|        |0E0565;
                       db $C1,$05,$F0,$06,$CE               ;0EA6D4|        |000005;
                       db $C1,$05,$4C,$EA,$A6               ;0EA6D9|        |000005;
                       db $AD,$93,$05,$D0,$07               ;0EA6DE|        |0E0593;
                       db $AD,$7C,$05,$C9,$01               ;0EA6E3|        |0E057C;
                       db $F0,$03,$4C,$73,$EF               ;0EA6E8|        |0EA6ED;
                       db $A9,$03,$20,$57,$EF               ;0EA6ED|        |      ;
                       db $20,$0A,$A7,$A9,$00               ;0EA6F2|        |0EA70A;
                       db $8D,$37,$05,$8D,$20               ;0EA6F7|        |0E0537;
                       db $05,$8D,$F2,$04,$8D               ;0EA6FC|        |00008D;
                       db $09,$05,$EE,$65,$05               ;0EA701|        |      ;
                       db $EE,$65,$05,$60,$A9               ;0EA706|        |0E0565;
                       db $00,$AA,$20,$0B,$84               ;0EA70B|        |      ;
                       db $D0,$01,$60,$A9,$00               ;0EA710|        |0EA713;
                       db $A2,$08,$20,$0B,$84               ;0EA715|        |      ;
                       db $D0,$F6,$AD,$1C,$04               ;0EA71A|        |0EA712;
                       db $18,$69,$08,$8D,$1C               ;0EA71F|        |      ;
                       db $04,$60,$A9,$06,$20               ;0EA724|        |000060;
                       db $57,$EF,$A9,$01,$8D               ;0EA729|        |0000EF;
                       db $C1,$05,$EE,$65,$05               ;0EA72E|        |000005;
                       db $EE,$65,$05,$60,$AD               ;0EA733|        |0E0565;
                       db $C1,$05,$F0,$06,$CE               ;0EA738|        |000005;
                       db $C1,$05,$4C,$4E,$A7               ;0EA73D|        |000005;
                       db $AD,$93,$05,$D0,$07               ;0EA742|        |0E0593;
                       db $AD,$7C,$05,$C9,$01               ;0EA747|        |0E057C;
                       db $F0,$03,$4C,$73,$EF               ;0EA74C|        |0EA751;
                       db $A9,$05,$A2,$10,$20               ;0EA751|        |      ;
                       db $DD,$FC,$D0,$12,$A9               ;0EA756|        |0ED0FC;
                       db $FB,$A2,$10,$20,$DD               ;0EA75B|        |      ;
                       db $FC,$D0,$09,$20,$3A               ;0EA760|        |0E09D0;
                       db $97,$A9,$0E,$8D,$00               ;0EA765|        |0000A9;
                       db $04,$60,$20,$02,$8A               ;0EA76A|        |000060;
                       db $4C,$63,$A7,$8D,$AA               ;0EA76F|        |0EA763;
 
                       db $05,$60,$A9,$FC,$8D               ;0EA774|        |000060;
                       db $20,$05,$A9,$00,$8D               ;0EA779|        |0EA905;
                       db $37,$05,$A9,$15,$8D               ;0EA77E|        |000005;
                       db $C1,$05,$A9,$3A,$8D               ;0EA783|        |000005;
                       db $65,$05,$60,$A5,$28               ;0EA788|        |000005;
                       db $29,$08,$D0,$1A,$A5               ;0EA78D|        |      ;
                       db $28,$F0,$33,$A2,$06               ;0EA792|        |      ;
                       db $A9,$00,$20,$DD,$FC               ;0EA797|        |      ;
                       db $D0,$2A,$A9,$40,$8D               ;0EA79C|        |0EA7C8;
                       db $37,$05,$A9,$00,$8D               ;0EA7A1|        |000005;
                       db $20,$05,$4C,$B5,$A7               ;0EA7A6|        |0E4C05;
                       db $A9,$C0,$8D,$37,$05               ;0EA7AB|        |      ;
                       db $A9,$FF,$8D,$20,$05               ;0EA7B0|        |      ;
                       db $18,$AD,$DB,$04,$6D               ;0EA7B5|        |      ;
                       db $37,$05,$8D,$DB,$04               ;0EA7BA|        |000005;
                       db $AD,$1C,$04,$6D,$20               ;0EA7BF|        |0E041C;
                       db $05,$8D,$1C,$04,$A2               ;0EA7C4|        |00008D;
                       db $10,$A9,$00,$20,$DD               ;0EA7C9|        |0EA774;
                       db $FC,$C9,$02,$F0,$0A               ;0EA7CE|        |0E02C9;
                       db $C9,$03,$D0,$53,$A9               ;0EA7D3|        |      ;
                       db $FE,$A0,$80,$D0,$04               ;0EA7D8|        |0E80A0;
                       db $A9,$01,$A0,$80,$8D               ;0EA7DD|        |      ;
                       db $F2,$04,$8C,$09,$05               ;0EA7E2|        |000004;
                       db $20,$73,$EF,$4C,$3A               ;0EA7E7|        |0EEF73;
                       db $87,$A2,$10,$A9,$00               ;0EA7EC|        |0000A2;
                       db $20,$DD,$FC,$C9,$02               ;0EA7F1|        |0EFCDD;
                       db $F0,$0A,$C9,$03,$D0               ;0EA7F6|        |0EA802;
                       db $2E,$A9,$FE,$A0,$80               ;0EA7FB|        |0EFEA9;
                       db $D0,$04,$A9,$01,$A0               ;0EA800|        |0EA806;
                       db $80,$8D,$F2,$04,$8C               ;0EA805|        |0EA794;
                       db $09,$05,$AD,$1C,$04               ;0EA80A|        |      ;
                       db $18,$69,$01,$8D,$1C               ;0EA80F|        |      ;
                       db $04,$A2,$06,$A9,$00               ;0EA814|        |0000A2;
                       db $20,$DD,$FC,$D0,$03               ;0EA819|        |0EFCDD;
                       db $4C,$3A,$87,$EE,$65               ;0EA81E|        |0E873A;
 
                       db $05,$EE,$65,$05,$4C               ;0EA823|        |0000EE;
                       db $3A,$87,$A9,$34,$8D               ;0EA828|        |      ;
                       db $65,$05,$60,$A9,$40               ;0EA82D|        |000005;
                       db $8D,$65,$05,$60,$A5               ;0EA832|        |0E0565;
                       db $84,$F0,$0F,$C6,$AE               ;0EA837|        |0000F0;
                       db $D0,$09,$A9,$3C,$85               ;0EA83C|        |0EA847;
                       db $AE,$A9,$01,$20,$53               ;0EA841|        |0E01A9;
                       db $E7,$18,$60,$20,$27               ;0EA846|        |000018;
                       db $A6,$B0,$F9,$38,$60               ;0EA84B|        |0000B0;
                       db $A9,$3C,$8D,$65,$05               ;0EA850|        |      ;
                       db $60,$20,$36,$A8,$B0               ;0EA855|        |      ;
 
                       db $F5,$A2,$10,$A9,$00               ;0EA85A|        |0000A2;
                       db $20,$DD,$FC,$C9,$02               ;0EA85F|        |0EFCDD;
                       db $F0,$CA,$C9,$03,$F0               ;0EA864|        |0EA830;
                       db $C6,$AD,$F2,$04,$0D               ;0EA869|        |0000AD;
                       db $09,$05,$F0,$0E,$AD               ;0EA86E|        |      ;
                       db $F2,$04,$10,$04,$A0               ;0EA873|        |000004;
                       db $01,$D0,$02,$A0,$00               ;0EA878|        |0000D0;
                       db $8C,$A8,$04,$A5,$26               ;0EA87D|        |0E04A8;
                       db $29,$80,$F0,$03,$4C               ;0EA882|        |      ;
                       db $76,$A7,$A5,$28,$4A               ;0EA887|        |0000A7;
                       db $B0,$47,$4A,$B0,$6B               ;0EA88C|        |0EA8D5;
                       db $AD,$F2,$04,$30,$21               ;0EA891|        |0E04F2;
                       db $AD,$09,$05,$38,$ED               ;0EA896|        |0E0509;
                       db $F9,$A9,$8D,$09,$05               ;0EA89B|        |0E8DA9;
                       db $AD,$F2,$04,$E9,$00               ;0EA8A0|        |0E04F2;
                       db $8D,$F2,$04,$90,$03               ;0EA8A5|        |0E04F2;
                       db $4C,$29,$A9,$A9,$00               ;0EA8AA|        |0EA929;
 
                       db $8D,$F2,$04,$8D,$09               ;0EA8AF|        |0E04F2;
                       db $05,$F0,$72,$AD,$09               ;0EA8B4|        |0000F0;
                       db $05,$18,$6D,$F9,$A9               ;0EA8B9|        |000018;
                       db $8D,$09,$05,$AD,$F2               ;0EA8BE|        |0E0509;
                       db $04,$69,$00,$8D,$F2               ;0EA8C3|        |000069;
                       db $04,$90,$5E,$A9,$00               ;0EA8C8|        |000090;
                       db $8D,$F2,$04,$8D,$09               ;0EA8CD|        |0E04F2;
                       db $05,$F0,$54,$AD,$09               ;0EA8D2|        |0000F0;
                       db $05,$18,$6D,$FB,$A9               ;0EA8D7|        |000018;
                       db $8D,$09,$05,$AD,$F2               ;0EA8DC|        |0E0509;
                       db $04,$69,$00,$8D,$F2               ;0EA8E1|        |000069;
                       db $04,$30,$40,$CD,$FD               ;0EA8E6|        |000030;
                       db $A9,$D0,$3B,$AD,$FE               ;0EA8EB|        |      ;
                       db $A9,$CD,$09,$05,$B0               ;0EA8F0|        |      ;
                       db $33,$8D,$09,$05,$4C               ;0EA8F5|        |00008D;
                       db $29,$A9,$AD,$09,$05               ;0EA8FA|        |      ;
                       db $38,$ED,$FB,$A9,$8D               ;0EA8FF|        |      ;
                       db $09,$05,$AD,$F2,$04               ;0EA904|        |      ;
                       db $E9,$00,$8D,$F2,$04               ;0EA909|        |      ;
                       db $10,$19,$AD,$01,$AA               ;0EA90E|        |0EA929;
                       db $CD,$F2,$04,$90,$11               ;0EA913|        |0E04F2;
                       db $AD,$02,$AA,$CD,$09               ;0EA918|        |0EAA02;
                       db $05,$90,$09,$8D,$09               ;0EA91D|        |000090;
                       db $05,$AD,$01,$AA,$8D               ;0EA922|        |0000AD;
                       db $F2,$04,$A5,$28,$29               ;0EA927|        |000004;
                       db $04,$F0,$03,$4C,$B7               ;0EA92C|        |0000F0;
                       db $A9,$A5,$28,$29,$08               ;0EA931|        |      ;
                       db $D0,$45,$AD,$20,$05               ;0EA936|        |0EA97D;
                       db $30,$22,$AD,$37,$05               ;0EA93B|        |0EA95F;
                       db $38,$ED,$FA,$A9,$8D               ;0EA940|        |      ;
                       db $37,$05,$AD,$20,$05               ;0EA945|        |000005;
                       db $E9,$00,$8D,$20,$05               ;0EA94A|        |      ;
                       db $90,$03,$4C,$DB,$A9               ;0EA94F|        |0EA954;
                       db $A9,$00,$8D,$20,$05               ;0EA954|        |      ;
                       db $8D,$37,$05,$4C,$DB               ;0EA959|        |0E0537;
                       db $A9,$AD,$37,$05,$18               ;0EA95E|        |      ;
                       db $6D,$FA,$A9,$8D,$37               ;0EA963|        |0EA9FA;
                       db $05,$AD,$20,$05,$69               ;0EA968|        |0000AD;
                       db $00,$8D,$20,$05,$90               ;0EA96D|        |      ;
                       db $68,$A9,$00,$8D,$20               ;0EA972|        |      ;
                       db $05,$8D,$37,$05,$F0               ;0EA977|        |00008D;
                       db $5E,$AD,$37,$05,$38               ;0EA97C|        |0E37AD;
                       db $ED,$FC,$A9,$8D,$37               ;0EA981|        |0EA9FC;
                       db $05,$AD,$20,$05,$E9               ;0EA986|        |0000AD;
                       db $00,$8D,$20,$05,$10               ;0EA98B|        |      ;
                       db $4A,$AD,$03,$AA,$CD               ;0EA990|        |      ;
                       db $20,$05,$90,$42,$F0               ;0EA995|        |0E9005;
                       db $02,$B0,$14,$AD,$04               ;0EA99A|        |      ;
                       db $AA,$CD,$37,$05,$90               ;0EA99F|        |      ;
                       db $36,$8D,$37,$05,$AD               ;0EA9A4|        |00008D;
                       db $03,$AA,$8D,$20,$05               ;0EA9A9|        |0000AA;
                       db $4C,$DB,$A9,$AD,$04               ;0EA9AE|        |0EA9DB;
 
                       db $AA,$4C,$A5,$A9,$AD               ;0EA9B3|        |      ;
                       db $37,$05,$18,$6D,$FC               ;0EA9B8|        |000005;
                       db $A9,$8D,$37,$05,$AD               ;0EA9BD|        |      ;
                       db $20,$05,$69,$00,$8D               ;0EA9C2|        |0E6905;
                       db $20,$05,$30,$10,$CD               ;0EA9C7|        |0E3005;
                       db $FF,$A9,$D0,$0B,$AD               ;0EA9CC|        |0BD0A9;
                       db $00,$AA,$CD,$37,$05               ;0EA9D1|        |      ;
                       db $B0,$03,$8D,$37,$05               ;0EA9D6|        |0EA9DB;
                       db $A5,$28,$29,$0F,$F0               ;0EA9DB|        |000028;
                       db $04,$A9,$04,$D0,$02               ;0EA9E0|        |0000A9;
                       db $A9,$03,$20,$72,$A7               ;0EA9E5|        |      ;
                       db $20,$05,$AA,$20,$26               ;0EA9EA|        |0EAA05;
                       db $AB,$20,$73,$EF,$20               ;0EA9EF|        |      ;
                       db $3A,$87,$4C,$12,$87               ;0EA9F4|        |      ;
                       db $08,$08,$10,$10,$01               ;0EA9F9|        |      ;
                       db $40,$01,$00,$FE,$C0               ;0EA9FE|        |      ;
                       db $FF,$00,$AD,$65,$05               ;0EAA03|        |65AD00;
                       db $C9,$36,$F0,$4A,$AD               ;0EAA08|        |      ;
                       db $F2,$04,$30,$1E,$0D               ;0EAA0D|        |000004;
                       db $09,$05,$F0,$40,$A5               ;0EAA12|        |      ;
                       db $7D,$C9,$60,$F0,$68               ;0EAA17|        |0E60C9;
                       db $A2,$FA,$A9,$08,$20               ;0EAA1C|        |      ;
                       db $DD,$FC,$D0,$23,$A2               ;0EAA21|        |0ED0FC;
                       db $06,$A9,$08,$20,$DD               ;0EAA26|        |0000A9;
                       db $FC,$D0,$1A,$60,$A5               ;0EAA2B|        |0E1AD0;
                       db $7D,$C9,$60,$F0,$22               ;0EAA30|        |0E60C9;
                       db $A2,$FA,$A9,$F8,$20               ;0EAA35|        |      ;
                       db $DD,$FC,$D0,$0E,$A2               ;0EAA3A|        |0ED0FC;
                       db $06,$A9,$F8,$20,$DD               ;0EAA3F|        |0000A9;
                       db $FC,$D0,$05,$60,$A9               ;0EAA44|        |0E05D0;
                       db $01,$D0,$02,$A9,$00               ;0EAA49|        |0000D0;
                       db $8D,$D8,$05,$A9,$36               ;0EAA4E|        |0E05D8;
                       db $8D,$65,$05,$60,$AD               ;0EAA53|        |0E0565;
                       db $1C,$04,$C9,$B0,$90               ;0EAA58|        |0EC904;
                       db $D7,$20,$DD,$AA,$A5               ;0EAA5D|        |000020;
                       db $0A,$38,$E9,$3E,$85               ;0EAA62|        |      ;
                       db $0C,$A5,$0B,$E9,$01               ;0EAA67|        |0E0BA5;
                       db $30,$0A,$D0,$C5,$A5               ;0EAA6C|        |0EAA78;
                       db $0C,$C9,$04,$B0,$BF               ;0EAA71|        |0E04C9;
                       db $90,$D4,$C9,$FF,$D0               ;0EAA76|        |0EAA4C;
                       db $B9,$A5,$0C,$C9,$FC               ;0EAA7B|        |0E0CA5;
                       db $B0,$CA,$90,$B1,$AD               ;0EAA80|        |0EAA4C;
                       db $1C,$04,$C9,$B0,$90               ;0EAA85|        |0EC904;
                       db $91,$20,$DD,$AA,$A5               ;0EAA8A|        |000020;
                       db $0A,$38,$E9,$20,$85               ;0EAA8F|        |      ;
                       db $0C,$A5,$0B,$E9,$01               ;0EAA94|        |0E0BA5;
                       db $30,$0A,$D0,$12,$A5               ;0EAA99|        |0EAAA5;
                       db $0C,$C9,$04,$B0,$0C               ;0EAA9E|        |0E04C9;
                       db $90,$A3,$C9,$FF,$D0               ;0EAAA3|        |0EAA48;
                       db $8C,$A5,$0C,$C9,$FC               ;0EAAA8|        |0E0CA5;
                       db $B0,$99,$A5,$0A,$38               ;0EAAAD|        |0EAA48;
                       db $E9,$C0,$85,$0C,$A5               ;0EAAB2|        |      ;
                       db $0B,$E9,$02,$30,$0E               ;0EAAB7|        |      ;
                       db $F0,$03,$4C,$1C,$AA               ;0EAABC|        |0EAAC1;
                       db $A5,$0C,$C9,$04,$90               ;0EAAC1|        |00000C;
                       db $81,$4C,$1C,$AA,$C9               ;0EAAC6|        |00004C;
                       db $FF,$F0,$03,$4C,$35               ;0EAACB|        |4C03F0;
                       db $AA,$A5,$0C,$C9,$FC               ;0EAAD0|        |      ;
                       db $90,$03,$4C,$48,$AA               ;0EAAD5|        |0EAADA;
                       db $4C,$1C,$AA,$AD,$38               ;0EAADA|        |0EAA1C;
 
                       db $04,$18,$65,$56,$85               ;0EAADF|        |000018;
                       db $0A,$A5,$57,$69,$00               ;0EAAE4|        |      ;
                       db $85,$0B,$60,$A5,$8B               ;0EAAE9|        |00000B;
                       db $29,$0F,$C9,$01,$F0               ;0EAAEE|        |      ;
                       db $07,$C9,$0C,$F0,$03               ;0EAAF3|        |0000C9;
                       db $A9,$80,$60,$A6,$91               ;0EAAF8|        |      ;
                       db $BD,$4E,$05,$C9,$7D               ;0EAAFD|        |0E054E;
                       db $F0,$04,$C9,$82,$D0               ;0EAB02|        |0EAB08;
                       db $F0,$BD,$1C,$04,$38               ;0EAB07|        |0EAAC6;
                       db $ED,$1C,$04,$60,$20               ;0EAB0C|        |0E041C;
                       db $98,$83,$18,$60,$20               ;0EAB11|        |      ;
                       db $DD,$FC,$F0,$0A,$C9               ;0EAB16|        |0EF0FC;
                       db $05,$F0,$F2,$C9,$07               ;0EAB1B|        |0000F0;
                       db $F0,$EE,$38,$60,$18               ;0EAB20|        |0EAB10;
                       db $60,$AD,$65,$05,$C9               ;0EAB25|        |      ;
 
                       db $36,$F0,$72,$AD,$20               ;0EAB2A|        |0000F0;
                       db $05,$30,$30,$0D,$37               ;0EAB2F|        |000030;
                       db $05,$F0,$68,$A5,$7D               ;0EAB34|        |0000F0;
                       db $29,$F0,$C9,$50,$F0               ;0EAB39|        |      ;
                       db $79,$C9,$60,$D0,$03               ;0EAB3E|        |0E60C9;
                       db $4C,$CB,$AB,$20,$EC               ;0EAB43|        |0EABCB;
 
                       db $AA,$C9,$80,$F0,$02               ;0EAB48|        |      ;
                       db $90,$51,$A2,$06,$A9               ;0EAB4D|        |0EABA0;
                       db $FA,$20,$15,$AB,$B0               ;0EAB52|        |      ;
                       db $48,$A2,$06,$A9,$06               ;0EAB57|        |      ;
                       db $20,$15,$AB,$B0,$3F               ;0EAB5C|        |0EAB15;
                       db $60,$AD,$1C,$04,$C9               ;0EAB61|        |      ;
 
                       db $40,$90,$1B,$20,$EC               ;0EAB66|        |      ;
                       db $AA,$C9,$80,$F0,$02               ;0EAB6B|        |      ;
                       db $B0,$12,$A2,$FA,$A9               ;0EAB70|        |0EAB84;
                       db $FA,$20,$15,$AB,$B0               ;0EAB75|        |      ;
                       db $09,$A2,$FA,$A9,$06               ;0EAB7A|        |      ;
                       db $20,$15,$AB,$90,$1B               ;0EAB7F|        |0EAB15;
                       db $20,$02,$8A,$18,$69               ;0EAB84|        |0E8A02;
                       db $06,$8D,$1C,$04,$A9               ;0EAB89|        |00008D;
                       db $02,$8D,$D8,$05,$A9               ;0EAB8E|        |      ;
                       db $00,$8D,$37,$05,$8D               ;0EAB93|        |      ;
                       db $20,$05,$A9,$36,$8D               ;0EAB98|        |0EA905;
                       db $65,$05,$60,$AD,$65               ;0EAB9D|        |000005;
                       db $05,$C9,$2E,$F0,$F8               ;0EABA2|        |0000C9;
                       db $20,$02,$8A,$AD,$1C               ;0EABA7|        |0E8A02;
                       db $04,$18,$69,$02,$8D               ;0EABAC|        |000018;
                       db $1C,$04,$A9,$03,$4C               ;0EABB1|        |0EA904;
                       db $8F,$AB,$A5,$7D,$29               ;0EABB6|        |7DA5AB;
                       db $0F,$A8,$AD,$1C,$04               ;0EABBB|        |1CADA8;
                       db $D9,$0D,$AC,$90,$81               ;0EABC0|        |0EAC0D;
                       db $20,$58,$8C,$4C,$A0               ;0EABC5|        |0E8C58;
                       db $AB,$A5,$7D,$29,$0F               ;0EABCA|        |      ;
                       db $F0,$03,$4C,$46,$AB               ;0EABCF|        |0EABD4;
                       db $AD,$1C,$04,$C9,$BC               ;0EABD4|        |0E041C;
                       db $B0,$03,$4C,$46,$AB               ;0EABD9|        |0EABDE;
                       db $AD,$38,$04,$18,$65               ;0EABDE|        |0E0438;
                       db $56,$85,$0A,$A5,$57               ;0EABE3|        |000085;
                       db $69,$00,$85,$0B,$C9               ;0EABE8|        |      ;
                       db $01,$90,$D5,$D0,$09               ;0EABED|        |000090;
                       db $A5,$0A,$C9,$20,$90               ;0EABF2|        |00000A;
                       db $CD,$4C,$46,$AB,$C9               ;0EABF7|        |0E464C;
                       db $02,$B0,$03,$4C,$46               ;0EABFC|        |      ;
                       db $AB,$D0,$C1,$A5,$0A               ;0EAC01|        |      ;
                       db $C9,$C0,$B0,$BB,$4C               ;0EAC06|        |      ;
                       db $46,$AB,$9C,$BC,$BC               ;0EAC0B|        |0000AB;
                       db $BC,$AD,$F2,$04,$30               ;0EAC10|        |0EF2AD;
                       db $13,$A2,$FA,$A9,$08               ;0EAC15|        |0000A2;
                       db $20,$DD,$FC,$D0,$1C               ;0EAC1A|        |0EFCDD;
                       db $A2,$06,$A9,$08,$20               ;0EAC1F|        |      ;
                       db $DD,$FC,$D0,$13,$60               ;0EAC24|        |0ED0FC;
                       db $A2,$FA,$A9,$F8,$20               ;0EAC29|        |      ;
                       db $DD,$FC,$D0,$09,$A2               ;0EAC2E|        |0ED0FC;
                       db $06,$A9,$F8,$20,$DD               ;0EAC33|        |0000A9;
                       db $FC,$F0,$08,$A9,$00               ;0EAC38|        |0E08F0;
                       db $8D,$09,$05,$8D,$F2               ;0EAC3D|        |0E0509;
                       db $04,$60,$AD,$20,$05               ;0EAC42|        |000060;
                       db $30,$13,$A2,$06,$A9               ;0EAC47|        |0EAC5C;
                       db $FA,$20,$DD,$FC,$D0               ;0EAC4C|        |      ;
                       db $2E,$A2,$06,$A9,$06               ;0EAC51|        |0E06A2;
                       db $20,$DD,$FC,$D0,$25               ;0EAC56|        |0EFCDD;
                       db $60,$A2,$FA,$A9,$FA               ;0EAC5B|        |      ;
 
                       db $20,$DD,$FC,$D0,$09               ;0EAC60|        |0EFCDD;
                       db $A2,$FA,$A9,$06,$20               ;0EAC65|        |      ;
                       db $DD,$FC,$F0,$11,$20               ;0EAC6A|        |0EF0FC;
                       db $02,$8A,$18,$69,$06               ;0EAC6F|        |      ;
                       db $8D,$1C,$04,$A9,$00               ;0EAC74|        |0E041C;
                       db $8D,$37,$05,$8D,$20               ;0EAC79|        |0E0537;
                       db $05,$60,$20,$02,$8A               ;0EAC7E|        |000060;
                       db $AD,$1C,$04,$18,$69               ;0EAC83|        |0E041C;
                       db $02,$8D,$1C,$04,$4C               ;0EAC88|        |      ;
                       db $77,$AC,$EE,$65,$05               ;0EAC8D|        |0000AC;
                       db $EE,$65,$05,$A9,$03               ;0EAC92|        |0E0565;
                       db $8D,$C1,$05,$AD,$D8               ;0EAC97|        |0E05C1;
                       db $05,$C9,$02,$B0,$0F               ;0EAC9C|        |0000C9;
                       db $0A,$A8,$B9,$BF,$AC               ;0EACA1|        |      ;
                       db $8D,$F2,$04,$B9,$C0               ;0EACA6|        |0E04F2;
                       db $AC,$8D,$09,$05,$60               ;0EACAB|        |0E098D;
                       db $0A,$A8,$B9,$BF,$AC               ;0EACB0|        |      ;
                       db $8D,$20,$05,$B9,$C0               ;0EACB5|        |0E0520;
                       db $AC,$8D,$37,$05,$60               ;0EACBA|        |0E378D;
                       db $01,$00,$FF,$00,$01               ;0EACBF|        |000000;
                       db $00,$FF,$00,$20,$36               ;0EACC4|        |      ;
                       db $A8,$90,$03,$4C,$50               ;0EACC9|        |      ;
                       db $A8,$CE,$C1,$05,$F0               ;0EACCE|        |      ;
                       db $14,$A9,$04,$20,$72               ;0EACD3|        |0000A9;
                       db $A7,$20,$11,$AC,$20               ;0EACD8|        |000020;
                       db $44,$AC,$20,$73,$EF               ;0EACDD|        |      ;
                       db $20,$3A,$87,$4C,$12               ;0EACE2|        |0E873A;
                       db $87,$AD,$D8,$05,$C9               ;0EACE7|        |0000AD;
                       db $02,$B0,$0A,$A9,$00               ;0EACEC|        |      ;
                       db $8D,$F2,$04,$8D,$09               ;0EACF1|        |0E04F2;
                       db $05,$F0,$08,$A9,$00               ;0EACF6|        |0000F0;
                       db $8D,$20,$05,$8D,$37               ;0EACFB|        |0E0520;
                       db $05,$A9,$34,$8D,$65               ;0EAD00|        |0000A9;
                       db $05,$60,$20,$36,$A8               ;0EAD05|        |000060;
                       db $90,$03,$4C,$50,$A8               ;0EAD0A|        |0EAD0F;
                       db $CE,$C1,$05,$D0,$06               ;0EAD0F|        |0E05C1;
                       db $A9,$34,$8D,$65,$05               ;0EAD14|        |      ;
                       db $60,$AD,$F2,$04,$0D               ;0EAD19|        |      ;
 
                       db $09,$05,$F0,$0E,$AD               ;0EAD1E|        |      ;
                       db $F2,$04,$10,$04,$A0               ;0EAD23|        |000004;
                       db $01,$D0,$02,$A0,$00               ;0EAD28|        |0000D0;
                       db $8C,$A8,$04,$A5,$28               ;0EAD2D|        |0E04A8;
                       db $4A,$B0,$47,$4A,$B0               ;0EAD32|        |      ;
                       db $6B,$AD,$F2,$04,$30               ;0EAD37|        |      ;
                       db $21,$AD,$09,$05,$38               ;0EAD3C|        |0000AD;
                       db $ED,$F9,$A9,$8D,$09               ;0EAD41|        |0EA9F9;
                       db $05,$AD,$F2,$04,$E9               ;0EAD46|        |0000AD;
                       db $00,$8D,$F2,$04,$90               ;0EAD4B|        |      ;
                       db $03,$4C,$D0,$AD,$A9               ;0EAD50|        |00004C;
                       db $00,$8D,$F2,$04,$8D               ;0EAD55|        |      ;
                       db $09,$05,$F0,$72,$AD               ;0EAD5A|        |      ;
                       db $09,$05,$18,$6D,$F9               ;0EAD5F|        |      ;
                       db $A9,$8D,$09,$05,$AD               ;0EAD64|        |      ;
                       db $F2,$04,$69,$00,$8D               ;0EAD69|        |000004;
                       db $F2,$04,$90,$5E,$A9               ;0EAD6E|        |000004;
                       db $00,$8D,$F2,$04,$8D               ;0EAD73|        |      ;
                       db $09,$05,$F0,$54,$AD               ;0EAD78|        |      ;
                       db $09,$05,$18,$6D,$FB               ;0EAD7D|        |      ;
                       db $A9,$8D,$09,$05,$AD               ;0EAD82|        |      ;
                       db $F2,$04,$69,$00,$8D               ;0EAD87|        |000004;
                       db $F2,$04,$30,$40,$CD               ;0EAD8C|        |000004;
                       db $FD,$A9,$D0,$3B,$AD               ;0EAD91|        |0ED0A9;
                       db $FE,$A9,$CD,$09,$05               ;0EAD96|        |0ECDA9;
                       db $B0,$33,$8D,$09,$05               ;0EAD9B|        |0EADD0;
                       db $4C,$D0,$AD,$AD,$09               ;0EADA0|        |0EADD0;
 
                       db $05,$38,$ED,$FB,$A9               ;0EADA5|        |000038;
                       db $8D,$09,$05,$AD,$F2               ;0EADAA|        |0E0509;
                       db $04,$E9,$00,$8D,$F2               ;0EADAF|        |0000E9;
                       db $04,$10,$19,$AD,$01               ;0EADB4|        |000010;
                       db $AA,$CD,$F2,$04,$90               ;0EADB9|        |      ;
                       db $11,$AD,$02,$AA,$CD               ;0EADBE|        |0000AD;
                       db $09,$05,$90,$09,$8D               ;0EADC3|        |      ;
                       db $09,$05,$AD,$01,$AA               ;0EADC8|        |      ;
                       db $8D,$F2,$04,$AD,$37               ;0EADCD|        |0E04F2;
                       db $05,$18,$69,$40,$8D               ;0EADD2|        |000018;
                       db $37,$05,$AD,$20,$05               ;0EADD7|        |000005;
                       db $69,$00,$8D,$20,$05               ;0EADDC|        |      ;
                       db $A9,$04,$20,$72,$A7               ;0EADE1|        |      ;
                       db $20,$26,$AB,$20,$05               ;0EADE6|        |0EAB26;
                       db $AA,$AD,$65,$05,$C9               ;0EADEB|        |      ;
                       db $36,$F0,$09,$20,$73               ;0EADF0|        |0000F0;
                       db $EF,$20,$3A,$87,$4C               ;0EADF5|        |873A20;
                       db $12,$87,$AD,$D8,$05               ;0EADFA|        |000087;
                       db $C9,$02,$B0,$F0,$A9               ;0EADFF|        |      ;
                       db $00,$8D,$37,$05,$8D               ;0EAE04|        |      ;
                       db $20,$05,$F0,$E6,$85               ;0EAE09|        |0EF005;
                       db $02,$84,$03,$A9,$00               ;0EAE0E|        |      ;
                       db $85,$04,$85,$05,$A0               ;0EAE13|        |000004;
                       db $10,$06,$00,$26,$01               ;0EAE18|        |0EAE20;
                       db $26,$04,$26,$05,$A5               ;0EAE1D|        |000004;
                       db $05,$C5,$03,$D0,$04               ;0EAE22|        |0000C5;
                       db $A5,$04,$C5,$02,$90               ;0EAE27|        |000004;
                       db $0E,$A5,$04,$E5,$02               ;0EAE2C|        |0E04A5;
                       db $85,$04,$A5,$05,$E5               ;0EAE31|        |000004;
                       db $03,$85,$05,$E6,$00               ;0EAE36|        |000085;
                       db $88,$D0,$DB,$60,$A9               ;0EAE3B|        |      ;
                       db $01,$85,$10,$AD,$EC               ;0EAE40|        |000085;
                       db $07,$85,$12,$A9,$01               ;0EAE45|        |000085;
                       db $85,$17,$BD,$4E,$05               ;0EAE4A|        |000017;
                       db $4C,$6D,$AE                       ;0EAE4F|        |0EAE6D;
 
 
       UNREACH_0EAE52: db $A9,$00,$85,$10,$A2               ;0EAE52|        |      ;
                       db $14,$A5,$82,$85,$12               ;0EAE57|        |0000A5;
                       db $A9,$03,$85,$17,$BD               ;0EAE5C|        |      ;
                       db $4E,$05,$D0,$08,$C6               ;0EAE61|        |0ED005;
                       db $17,$F0,$03,$E8,$D0               ;0EAE66|        |0000F0;
                       db $F4,$60,$C9,$0C,$F0               ;0EAE6B|        |0EC960;
                       db $04,$A5,$BF,$30,$F7               ;0EAE70|        |0000A5;
                       db $AD,$FD,$AE,$48,$AD               ;0EAE75|        |0EAEFD;
                       db $FC,$AE,$48,$BD,$4E               ;0EAE7A|        |0E48AE;
                       db $05,$0A,$A8,$B9,$E0               ;0EAE7F|        |00000A;
                       db $AE,$85,$00,$B9,$E1               ;0EAE84|        |0E0085;
                       db $AE,$85,$01,$BC,$65               ;0EAE89|        |0E0185;
                       db $05,$B1,$00,$85,$02               ;0EAE8E|        |0000B1;
                       db $C8,$B1,$00,$85,$03               ;0EAE93|        |      ;
                       db $6C,$02,$00,$BD,$65               ;0EAE98|        |000002;
 
                       db $05,$C9,$02,$F0,$C3               ;0EAE9D|        |0000C9;
                       db $BD,$38,$04,$C9,$09               ;0EAEA2|        |0E0438;
                       db $90,$12,$C9,$F8,$B0               ;0EAEA7|        |0EAEBB;
                       db $0E,$BD,$1C,$04,$C9               ;0EAEAC|        |0E1CBD;
                       db $10,$90,$07,$C9,$E0               ;0EAEB1|        |0EAE43;
                       db $B0,$03,$4C,$65,$AE               ;0EAEB6|        |0EAEBB;
                       db $BD,$4E,$05,$C9,$06               ;0EAEBB|        |0E054E;
                       db $F0,$11,$A9,$00,$9D               ;0EAEC0|        |0EAED3;
                       db $4E,$05,$9D,$00,$04               ;0EAEC5|        |0E9D05;
                       db $9D,$38,$04,$9D,$1C               ;0EAECA|        |0E0438;
                       db $04,$4C,$65,$AE,$A9               ;0EAECF|        |00004C;
                       db $00,$9D,$38,$04,$A9               ;0EAED4|        |      ;
                       db $80,$9D,$70,$04,$4C               ;0EAED9|        |0EAE78;
                       db $65,$AE,$FE,$AE,$FE               ;0EAEDE|        |0000AE;
                       db $AE,$04,$AF,$0C,$AF               ;0EAEE3|        |0EAF04;
                       db $12,$AF,$1A,$AF,$20               ;0EAEE8|        |0000AF;
                       db $AF,$26,$AF,$34,$AF               ;0EAEED|        |34AF26;
                       db $3A,$AF,$40,$AF,$46               ;0EAEF2|        |      ;
                       db $AF,$48,$AF,$4E,$AF               ;0EAEF7|        |4EAF48;
                       db $9A,$AE,$5C,$B4,$95               ;0EAEFC|        |      ;
                       db $B4,$D7,$B4,$5C,$B4               ;0EAF01|        |0000D7;
                       db $F4,$B4,$2D,$B5,$6F               ;0EAF06|        |0E2DB4;
                       db $B5,$5C,$B4,$B2,$B6               ;0EAF0B|        |00005C;
                       db $F4,$B6,$5C,$B4,$52               ;0EAF10|        |0E5CB6;
                       db $B7,$92,$B7,$D0,$B7               ;0EAF15|        |000092;
                       db $5C,$B4,$90,$B3,$DC               ;0EAF1A|        |B390B4;
                       db $B3,$EA,$B7,$23,$B8               ;0EAF1F|        |0000EA;
                       db $A4,$B8,$3A,$B0,$73               ;0EAF24|        |0000B8;
                       db $B0,$FA,$B0,$36,$B1               ;0EAF29|        |0EAF25;
                       db $7D,$B1,$F6,$B1,$46               ;0EAF2E|        |0EF6B1;
                       db $B2,$5C,$B4,$2A,$B6               ;0EAF33|        |00005C;
                       db $F4,$B6,$5C,$B4,$B9               ;0EAF38|        |0E5CB6;
 
                       db $B5,$D7,$B4,$5C,$B4               ;0EAF3D|        |0000D7;
                       db $77,$AF,$EA,$AF,$66               ;0EAF42|        |0000AF;
                       db $AF,$9F,$B9,$BA,$B9               ;0EAF47|        |BAB99F;
                       db $C0,$B9,$84,$B9,$BA               ;0EAF4C|        |      ;
                       db $B9,$C0,$B9,$20,$55               ;0EAF51|        |0EB9C0;
                       db $BC,$FE,$65,$05,$FE               ;0EAF56|        |0E65FE;
                       db $65,$05,$BC,$4E,$05               ;0EAF5B|        |000005;
                       db $B9,$67,$AF,$9D,$06               ;0EAF60|        |0EAF67;
                       db $06,$60,$00,$60,$60               ;0EAF65|        |000060;
                       db $40,$30,$C0,$02,$C0               ;0EAF6A|        |      ;
 
                       db $40,$60,$20,$00,$00               ;0EAF6F|        |      ;
 
                       db $00,$00,$00,$DE,$C1               ;0EAF74|        |      ;
                       db $05,$D0,$EA,$BD,$D8               ;0EAF79|        |0000D0;
                       db $05,$D0,$05,$A9,$1F               ;0EAF7E|        |0000D0;
                       db $20,$5F,$E2,$A9,$06               ;0EAF83|        |0EE25F;
                       db $A0,$0B,$20,$5C,$EF               ;0EAF88|        |      ;
                       db $A4,$10,$B9,$A8,$04               ;0EAF8D|        |000010;
                       db $85,$00,$A0,$00,$B9               ;0EAF92|        |000000;
                       db $06,$B0,$85,$08,$B9               ;0EAF97|        |0000B0;
                       db $07,$B0,$85,$09,$BD               ;0EAF9C|        |0000B0;
                       db $D8,$05,$0A,$0A,$A8               ;0EAFA1|        |      ;
                       db $A5,$00,$F0,$05,$98               ;0EAFA6|        |000000;
                       db $18,$69,$0C,$A8,$B1               ;0EAFAB|        |      ;
                       db $08,$9D,$09,$05,$C8               ;0EAFB0|        |      ;
                       db $B1,$08,$9D,$F2,$04               ;0EAFB5|        |000008;
                       db $C8,$B1,$08,$9D,$37               ;0EAFBA|        |      ;
                       db $05,$C8,$B1,$08,$9D               ;0EAFBF|        |0000C8;
                       db $20,$05,$A9,$00,$9D               ;0EAFC4|        |0EA905;
                       db $A8,$04,$A4,$10,$B9               ;0EAFC9|        |      ;
                       db $38,$04,$9D,$38,$04               ;0EAFCE|        |      ;
                       db $B9,$1C,$04,$A4,$12               ;0EAFD3|        |0E041C;
                       db $C0,$07,$D0,$03,$18               ;0EAFD8|        |      ;
                       db $69,$06,$9D,$1C,$04               ;0EAFDD|        |      ;
                       db $A9,$18,$9D,$C1,$05               ;0EAFE2|        |      ;
                       db $4C,$54,$AF,$BD,$1D               ;0EAFE7|        |0EAF54;
 
                       db $06,$D0,$11,$DE,$C1               ;0EAFEC|        |0000D0;
                       db $05,$F0,$0C,$20,$75               ;0EAFF1|        |0000F0;
                       db $EF,$20,$16,$B9,$20               ;0EAFF6|        |B91620;
                       db $2F,$B9,$4C,$51,$B9               ;0EAFFB|        |514CB9;
                       db $A9,$00,$9D,$38,$04               ;0EB000|        |      ;
                       db $60,$0A,$B0,$22,$B0               ;0EB005|        |      ;
 
                       db $80,$04,$00,$00,$26               ;0EB00A|        |0EB010;
                       db $04,$4C,$FE,$26,$04               ;0EB00F|        |00004C;
                       db $B4,$01,$80,$FB,$00               ;0EB014|        |000001;
                       db $00,$DA,$FB,$4C,$FE               ;0EB019|        |      ;
                       db $DA,$FB,$B4,$01,$00               ;0EB01E|        |      ;
                       db $05,$00,$00,$9C,$04               ;0EB023|        |000000;
                       db $1B,$FE,$9C,$04,$E5               ;0EB028|        |      ;
                       db $01,$00,$FB,$00,$00               ;0EB02D|        |000000;
                       db $64,$FB,$1B,$FE,$64               ;0EB032|        |0000FB;
                       db $FB,$E5,$01,$20,$6E               ;0EB037|        |      ;
                       db $B4,$18,$69,$01,$9D               ;0EB03C|        |000018;
                       db $C2,$05,$9D,$C3,$05               ;0EB041|        |      ;
                       db $A9,$00,$9D,$38,$04               ;0EB046|        |      ;
                       db $9D,$39,$04,$9D,$3A               ;0EB04B|        |0E0439;
                       db $04,$9D,$1C,$04,$9D               ;0EB050|        |00009D;
                       db $1D,$04,$9D,$1E,$04               ;0EB055|        |0E9D04;
                       db $FE,$65,$05,$FE,$65               ;0EB05A|        |0E0565;
                       db $05,$BD,$4E,$05,$9D               ;0EB05F|        |0000BD;
                       db $4F,$05,$9D,$50,$05               ;0EB064|        |509D05;
                       db $BD,$65,$05,$9D,$66               ;0EB069|        |0E0565;
                       db $05,$9D,$67,$05,$60               ;0EB06E|        |00009D;
                       db $DE,$C1,$05,$D0,$FA               ;0EB073|        |0E05C1;
                       db $E0,$14,$D0,$05,$A9               ;0EB078|        |      ;
                       db $1E,$20,$5F,$E2,$AD               ;0EB07D|        |0E5F20;
                       db $38,$04,$9D,$38,$04               ;0EB082|        |      ;
                       db $AD,$1C,$04,$9D,$1C               ;0EB087|        |0E041C;
                       db $04,$A9,$00,$9D,$1D               ;0EB08C|        |0000A9;
                       db $06,$E0,$14,$D0,$05               ;0EB091|        |0000E0;
                       db $20,$AC,$B0,$A2,$14               ;0EB096|        |0EB0AC;
                       db $8A,$38,$E9,$14,$A8               ;0EB09B|        |      ;
                       db $B9,$A9,$B0,$9D,$C1               ;0EB0A0|        |0EB0A9;
                       db $05,$4C,$54,$AF,$03               ;0EB0A5|        |00004C;
                       db $02,$01,$A9,$00,$85               ;0EB0AA|        |      ;
                       db $08,$A0,$01,$B9,$4E               ;0EB0AF|        |      ;
                       db $05,$D0,$10,$C8,$C0               ;0EB0B4|        |0000D0;
                       db $0D,$90,$F6,$A9,$FF               ;0EB0B9|        |0EF690;
                       db $9D,$D8,$05,$E8,$E0               ;0EB0BE|        |0E05D8;
                       db $17,$90,$F8,$60,$B9               ;0EB0C3|        |000090;
                       db $70,$04,$30,$EB,$B9               ;0EB0C8|        |0EB0CE;
                       db $38,$04,$38,$FD,$38               ;0EB0CD|        |      ;
                       db $04,$B0,$05,$49,$FF               ;0EB0D2|        |0000B0;
                       db $18,$69,$01,$C9,$40               ;0EB0D7|        |      ;
                       db $B0,$D9,$B9,$1C,$04               ;0EB0DC|        |0EB0B7;
                       db $38,$FD,$1C,$04,$B0               ;0EB0E1|        |      ;
                       db $05,$49,$FF,$18,$69               ;0EB0E6|        |000049;
                       db $01,$C9,$80,$B0,$C7               ;0EB0EB|        |0000C9;
                       db $98,$9D,$D8,$05,$E8               ;0EB0F0|        |      ;
                       db $E0,$17,$B0,$BE,$60               ;0EB0F5|        |      ;
                       db $BD,$D8,$05,$30,$07               ;0EB0FA|        |0E05D8;
                       db $FE,$65,$05,$FE,$65               ;0EB0FF|        |0E0565;
                       db $05,$60,$20,$12,$B1               ;0EB104|        |000060;
                       db $B0,$F4,$98,$9D,$D8               ;0EB109|        |0EB0FF;
                       db $05,$4C,$FF,$B0,$A0               ;0EB10E|        |00004C;
                       db $01,$B9,$4E,$05,$D0               ;0EB113|        |0000B9;
                       db $07,$C8,$C0,$0D,$90               ;0EB118|        |0000C8;
                       db $F6,$38,$60,$B9,$70               ;0EB11D|        |000038;
                       db $04,$30,$F4,$CC,$EC               ;0EB122|        |000030;
                       db $05,$F0,$EF,$CC,$ED               ;0EB127|        |0000F0;
                       db $05,$F0,$EA,$CC,$EE               ;0EB12C|        |0000F0;
                       db $05,$F0,$E5,$18,$60               ;0EB131|        |0000F0;
                       db $DE,$C1,$05,$D0,$BE               ;0EB136|        |0E05C1;
                       db $A9,$02,$A0,$0A,$20               ;0EB13B|        |      ;
                       db $5C,$EF,$AD,$7A,$B1               ;0EB140|        |7AADEF;
                       db $9D,$C1,$05,$A9,$01               ;0EB145|        |0E05C1;
                       db $9D,$09,$05,$8A,$38               ;0EB14A|        |0E0509;
                       db $E9,$14,$A8,$AD,$A8               ;0EB14F|        |      ;
                       db $04,$F0,$03,$C8,$C8               ;0EB154|        |0000F0;
                       db $C8,$B9,$74,$B1,$9D               ;0EB159|        |      ;
                       db $EF,$05,$A9,$00,$9D               ;0EB15E|        |00A905;
                       db $A8,$04,$AD,$38,$04               ;0EB163|        |      ;
                       db $9D,$38,$04,$AD,$1C               ;0EB168|        |0E0438;
                       db $04,$9D,$1C,$04,$4C               ;0EB16D|        |00009D;
                       db $54,$AF,$00,$04,$1C               ;0EB172|        |      ;
                       db $10,$0C,$14,$10,$10               ;0EB177|        |0EB185;
                       db $02,$DE,$C1,$05,$F0               ;0EB17C|        |      ;
                       db $13,$20,$75,$EF,$20               ;0EB181|        |000020;
                       db $BB,$B2,$20,$0A,$B3               ;0EB186|        |      ;
                       db $4C,$51,$B9,$A9,$FF               ;0EB18B|        |0EB951;
 
                       db $9D,$D8,$05,$D0,$ED               ;0EB190|        |0E05D8;
                       db $BC,$D8,$05,$30,$E8               ;0EB195|        |0E05D8;
                       db $F0,$E6,$B9,$4E,$05               ;0EB19A|        |0EB182;
                       db $F0,$ED,$B9,$70,$04               ;0EB19F|        |0EB18E;
                       db $30,$E8,$BD,$1D,$06               ;0EB1A4|        |0EB18E;
                       db $D0,$E3,$A9,$00,$85               ;0EB1A9|        |0EB18E;
                       db $08,$B9,$38,$04,$38               ;0EB1AE|        |      ;
                       db $FD,$38,$04,$B0,$09               ;0EB1B3|        |0E0438;
                       db $49,$FF,$18,$69,$01               ;0EB1B8|        |      ;
                       db $E6,$08,$E6,$08,$85               ;0EB1BD|        |000008;
                       db $09,$B9,$1C,$04,$38               ;0EB1C2|        |      ;
                       db $FD,$1C,$04,$B0,$07               ;0EB1C7|        |0E041C;
                       db $49,$FF,$18,$69,$01               ;0EB1CC|        |      ;
                       db $E6,$08,$85,$01,$A5               ;0EB1D1|        |000008;
                       db $09,$A0,$00,$84,$00               ;0EB1D6|        |      ;
                       db $20,$0D,$AE,$A5,$01               ;0EB1DB|        |0EAE0D;
                       db $9D,$20,$05,$A5,$00               ;0EB1E0|        |0E0520;
                       db $9D,$37,$05,$A5,$08               ;0EB1E5|        |0E0537;
                       db $9D,$F2,$04,$FE,$65               ;0EB1EA|        |0E04F2;
                       db $05,$FE,$65,$05,$4C               ;0EB1EF|        |0000FE;
                       db $82,$B1,$20,$08,$B2               ;0EB1F4|        |0ED2A8;
                       db $FE,$65,$05,$FE,$65               ;0EB1F9|        |0E0565;
                       db $05,$AD,$7C,$B1,$9D               ;0EB1FE|        |0000AD;
                       db $20,$05,$4C,$82,$B1               ;0EB203|        |0E4C05;
                       db $A0,$00,$BD,$20,$05               ;0EB208|        |      ;
                       db $D9,$7E,$B3,$90,$12               ;0EB20D|        |0EB37E;
                       db $D0,$0A,$BD,$37,$05               ;0EB212|        |0EB21E;
                       db $D9,$7F,$B3,$90,$08               ;0EB217|        |0EB37F;
                       db $F0,$06,$C8,$C8,$C0               ;0EB21C|        |0EB224;
                       db $10,$90,$E6,$98,$4A               ;0EB221|        |0EB1B3;
                       db $85,$00,$BC,$F2,$04               ;0EB226|        |000000;
                       db $F0,$15,$88,$F0,$0D               ;0EB22B|        |0EB242;
                       db $88,$F0,$06,$18,$69               ;0EB230|        |      ;
                       db $10,$4C,$42,$B2,$A9               ;0EB235|        |0EB283;
                       db $10,$D0,$02,$A9,$20               ;0EB23A|        |0EB20C;
                       db $38,$E5,$00,$9D,$F2               ;0EB23F|        |      ;
                       db $04,$60,$20,$59,$B2               ;0EB244|        |000060;
                       db $90,$0B,$AD,$7B,$B1               ;0EB249|        |0EB256;
                       db $9D,$C1,$05,$A9,$08               ;0EB24E|        |0E05C1;
                       db $9D,$65,$05,$4C,$82               ;0EB253|        |0E0565;
                       db $B1,$DE,$20,$05,$D0               ;0EB258|        |0000DE;
                       db $39,$AD,$7C,$B1,$9D               ;0EB25D|        |0E7CAD;
                       db $20,$05,$BD,$F2,$04               ;0EB262|        |0EBD05;
                       db $38,$FD,$EF,$05,$85               ;0EB267|        |      ;
                       db $00,$B0,$0B,$C9,$F0               ;0EB26C|        |      ;
                       db $90,$26,$A9,$00,$38               ;0EB271|        |0EB299;
                       db $E5,$00,$90,$09,$C9               ;0EB276|        |000000;
                       db $11,$90,$1E,$A9,$20               ;0EB27B|        |000090;
                       db $38,$E5,$00,$DD,$09               ;0EB280|        |      ;
                       db $05,$90,$2B,$BD,$EF               ;0EB285|        |000090;
                       db $05,$38,$FD,$09,$05               ;0EB28A|        |000038;
                       db $10,$03,$38,$E9,$E0               ;0EB28F|        |0EB294;
                       db $9D,$EF,$05,$18,$60               ;0EB294|        |0E05EF;
                       db $38,$E9,$E0,$DD,$09               ;0EB299|        |      ;
                       db $05,$90,$12,$BD,$EF               ;0EB29E|        |000090;
                       db $05,$18,$7D,$09,$05               ;0EB2A3|        |000018;
                       db $C9,$20,$90,$02,$E9               ;0EB2A8|        |      ;
                       db $20,$9D,$EF,$05,$18               ;0EB2AD|        |0EEF9D;
                       db $60,$BD,$F2,$04,$9D               ;0EB2B2|        |      ;
 
                       db $EF,$05,$38,$60,$BD               ;0EB2B7|        |603805;
                       db $EF,$05,$C9,$08,$90               ;0EB2BC|        |08C905;
                       db $32,$C9,$10,$90,$15               ;0EB2C1|        |0000C9;
                       db $C9,$18,$90,$08,$A9               ;0EB2C6|        |      ;
                       db $20,$38,$FD,$EF,$05               ;0EB2CB|        |0EFD38;
                       db $D0,$22,$A9,$18,$38               ;0EB2D0|        |0EB2F4;
                       db $FD,$EF,$05,$4C,$DE               ;0EB2D5|        |0E05EF;
                       db $B2,$38,$E9,$08,$0A               ;0EB2DA|        |000038;
                       db $A8,$38,$BD,$C4,$04               ;0EB2DF|        |      ;
                       db $F9,$6D,$B3,$9D,$C4               ;0EB2E4|        |0EB36D;
                       db $04,$BD,$38,$04,$F9               ;0EB2E9|        |0000BD;
                       db $6C,$B3,$9D,$38,$04               ;0EB2EE|        |009DB3;
                       db $60,$0A,$A8,$18,$B9               ;0EB2F3|        |      ;
 
                       db $5B,$B3,$7D,$C4,$04               ;0EB2F8|        |      ;
                       db $9D,$C4,$04,$B9,$5A               ;0EB2FD|        |0E04C4;
                       db $B3,$7D,$38,$04,$9D               ;0EB302|        |00007D;
                       db $38,$04,$60,$BD,$EF               ;0EB307|        |      ;
                       db $05,$C9,$08,$90,$33               ;0EB30C|        |0000C9;
                       db $C9,$10,$90,$29,$C9               ;0EB311|        |      ;
                       db $18,$90,$09,$BD,$EF               ;0EB316|        |      ;
                       db $05,$38,$E9,$18,$4C               ;0EB31B|        |000038;
                       db $28,$B3,$A9,$18,$38               ;0EB320|        |      ;
                       db $FD,$EF,$05,$0A,$A8               ;0EB325|        |0E05EF;
                       db $38,$BD,$DB,$04,$F9               ;0EB32A|        |      ;
                       db $5B,$B3,$9D,$DB,$04               ;0EB32F|        |      ;
                       db $BD,$1C,$04,$F9,$5A               ;0EB334|        |0E041C;
                       db $B3,$9D,$1C,$04,$60               ;0EB339|        |00009D;
                       db $A9,$10,$38,$FD,$EF               ;0EB33E|        |      ;
                       db $05,$0A,$A8,$18,$B9               ;0EB343|        |00000A;
                       db $6D,$B3,$7D,$DB,$04               ;0EB348|        |0E7DB3;
                       db $9D,$DB,$04,$B9,$6C               ;0EB34D|        |0E04DB;
                       db $B3,$7D,$1C,$04,$9D               ;0EB352|        |00007D;
                       db $1C,$04,$60,$02,$00               ;0EB357|        |0E6004;
                       db $01,$F6,$01,$D9,$01               ;0EB35C|        |0000F6;
                       db $A9,$01,$6A,$01,$1C               ;0EB361|        |      ;
                       db $00,$C3,$00,$63,$00               ;0EB366|        |      ;
                       db $00,$00,$00,$00,$63               ;0EB36B|        |      ;
                       db $00,$C3,$01,$1C,$01               ;0EB370|        |      ;
                       db $69,$01,$A9,$01,$D9               ;0EB375|        |      ;
                       db $01,$F6,$02,$00,$00               ;0EB37A|        |0000F6;
                       db $00,$00,$32,$00,$6A               ;0EB37F|        |      ;
                       db $00,$C4,$01,$00,$01               ;0EB384|        |      ;
                       db $7F,$02,$6A,$05,$06               ;0EB389|        |056A02;
                       db $FF,$FF,$DE,$C1,$05               ;0EB38E|        |C1DEFF;
                       db $D0,$60,$A9,$24,$20               ;0EB393|        |0EB3F5;
                       db $5F,$E2,$A4,$10,$B9               ;0EB398|        |10A4E2;
                       db $38,$04,$85,$0C,$B9               ;0EB39D|        |      ;
                       db $1C,$04,$85,$0D,$B9               ;0EB3A2|        |0E8504;
                       db $A8,$04,$85,$0E,$A9               ;0EB3A7|        |      ;
                       db $00,$9D,$93,$05,$A9               ;0EB3AC|        |      ;
                       db $02,$9D,$8C,$04,$A9               ;0EB3B1|        |      ;
                       db $01,$9D,$7C,$05,$A5               ;0EB3B6|        |00009D;
                       db $0D,$38,$E9,$08,$9D               ;0EB3BB|        |0EE938;
                       db $1C,$04,$A4,$0C,$A5               ;0EB3C0|        |0EA404;
                       db $0E,$9D,$A8,$04,$F0               ;0EB3C5|        |0EA89D;
                       db $07,$98,$38,$E9,$18               ;0EB3CA|        |000098;
                       db $4C,$D6,$B3,$98,$18               ;0EB3CF|        |0EB3D6;
 
                       db $69,$18,$9D,$38,$04               ;0EB3D4|        |      ;
                       db $4C,$54,$AF,$20,$F6               ;0EB3D9|        |0EAF54;
 
                       db $B3,$B0,$06,$20,$16               ;0EB3DE|        |0000B0;
                       db $B9,$4C,$51,$B9,$A9               ;0EB3E3|        |0E514C;
                       db $00,$9D,$4E,$05,$9D               ;0EB3E8|        |      ;
                       db $38,$04,$9D,$1C,$04               ;0EB3ED|        |      ;
                       db $9D,$00,$04,$60,$A9               ;0EB3F2|        |0E0400;
                       db $00,$9D,$09,$05,$DE               ;0EB3F7|        |      ;
                       db $7C,$05,$F0,$07,$A9               ;0EB3FC|        |0EF005;
                       db $00,$9D,$F2,$04,$18               ;0EB401|        |      ;
                       db $60,$BD,$93,$05,$85               ;0EB406|        |      ;
 
                       db $08,$0A,$18,$65,$08               ;0EB40B|        |      ;
                       db $A8,$B9,$40,$B4,$C9               ;0EB410|        |      ;
                       db $FF,$F0,$26,$85,$00               ;0EB415|        |8526F0;
                       db $BD,$A8,$04,$F0,$09               ;0EB41A|        |0E04A8;
                       db $A5,$00,$49,$FF,$18               ;0EB41F|        |000000;
                       db $69,$01,$D0,$02,$A5               ;0EB424|        |      ;
                       db $00,$9D,$F2,$04,$B9               ;0EB429|        |      ;
                       db $41,$B4,$9D,$7C,$05               ;0EB42E|        |0000B4;
                       db $B9,$42,$B4,$9D,$00               ;0EB433|        |0EB442;
                       db $04,$FE,$93,$05,$18               ;0EB438|        |0000FE;
                       db $60,$38,$60,$00,$03               ;0EB43D|        |      ;
 
                       db $3C,$04,$03,$3E,$04               ;0EB442|        |0E0304;
                       db $03,$3E,$0C,$03,$40               ;0EB447|        |00003E;
                       db $08,$03,$40,$08,$03               ;0EB44C|        |      ;
                       db $42,$04,$03,$42,$08               ;0EB451|        |      ;
                       db $03,$44,$00,$03,$56               ;0EB456|        |000044;
                       db $FF,$20,$6E,$B4,$A9               ;0EB45B|        |B46E20;
                       db $00,$9D,$38,$04,$9D               ;0EB460|        |      ;
                       db $1C,$04,$FE,$65,$05               ;0EB465|        |0EFE04;
                       db $FE,$65,$05,$60,$BC               ;0EB46A|        |0E0565;
                       db $4E,$05,$B9,$78,$B4               ;0EB46F|        |0EB905;
                       db $9D,$C1,$05,$60,$00               ;0EB474|        |0E05C1;
                       db $0A,$0A,$0A,$0A,$0C               ;0EB479|        |      ;
                       db $08,$08,$08,$08,$10               ;0EB47E|        |      ;
                       db $02,$00,$FE,$00,$FA               ;0EB483|        |      ;
                       db $80,$02,$00,$FE,$00               ;0EB488|        |0EB48C;
 
                       db $04,$00,$FC,$00,$01               ;0EB48D|        |000000;
                       db $80,$FE,$80,$DE,$C1               ;0EB492|        |0EB492;
 
                       db $05,$D0,$D3,$A9,$13               ;0EB497|        |0000D0;
                       db $20,$5F,$E2,$A9,$00               ;0EB49C|        |0EE25F;
                       db $A0,$08,$20,$5C,$EF               ;0EB4A1|        |      ;
                       db $AD,$A8,$04,$0A,$A8               ;0EB4A6|        |0E04A8;
                       db $B9,$83,$B4,$9D,$F2               ;0EB4AB|        |0EB483;
                       db $04,$B9,$84,$B4,$9D               ;0EB4B0|        |0000B9;
                       db $09,$05,$AD,$87,$B4               ;0EB4B5|        |      ;
                       db $9D,$20,$05,$AD,$88               ;0EB4BA|        |0E0520;
                       db $B4,$9D,$37,$05,$A9               ;0EB4BF|        |00009D;
                       db $00,$9D,$A8,$04,$AD               ;0EB4C4|        |      ;
                       db $38,$04,$9D,$38,$04               ;0EB4C9|        |      ;
                       db $AD,$1C,$04,$9D,$1C               ;0EB4CE|        |0E041C;
                       db $04,$4C,$54,$AF,$BD               ;0EB4D3|        |00004C;
                       db $37,$05,$18,$69,$40               ;0EB4D8|        |000005;
                       db $9D,$37,$05,$BD,$20               ;0EB4DD|        |0E0537;
                       db $05,$69,$00,$9D,$20               ;0EB4E2|        |000069;
                       db $05,$20,$75,$EF,$20               ;0EB4E7|        |000020;
                       db $16,$B9,$20,$2F,$B9               ;0EB4EC|        |0000B9;
                       db $4C,$51,$B9,$DE,$C1               ;0EB4F1|        |0EB951;
 
                       db $05,$F0,$01,$60,$A9               ;0EB4F6|        |0000F0;
                       db $00,$A0,$07,$20,$5C               ;0EB4FB|        |      ;
                       db $EF,$A4,$10,$B9,$A8               ;0EB500|        |B910A4;
                       db $04,$0A,$A8,$B9,$89               ;0EB505|        |00000A;
                       db $B4,$9D,$F2,$04,$B9               ;0EB50A|        |00009D;
                       db $8A,$B4,$9D,$09,$05               ;0EB50F|        |      ;
                       db $A9,$00,$9D,$A8,$04               ;0EB514|        |      ;
                       db $A4,$10,$B9,$38,$04               ;0EB519|        |000010;
                       db $9D,$38,$04,$38,$B9               ;0EB51E|        |0E0438;
                       db $1C,$04,$E9,$04,$9D               ;0EB523|        |0EE904;
                       db $1C,$04,$4C,$54,$AF               ;0EB528|        |0E4C04;
                       db $BD,$1D,$06,$29,$0F               ;0EB52D|        |0E061D;
                       db $C9,$03,$F0,$0B,$BD               ;0EB532|        |      ;
                       db $38,$04,$C9,$F1,$B0               ;0EB537|        |      ;
                       db $04,$C9,$10,$B0,$1A               ;0EB53C|        |0000C9;
                       db $20,$55,$BC,$A9,$00               ;0EB541|        |0EBC55;
                       db $38,$FD,$09,$05,$9D               ;0EB546|        |      ;
                       db $09,$05,$A9,$00,$FD               ;0EB54B|        |      ;
                       db $F2,$04,$9D,$F2,$04               ;0EB550|        |000004;
                       db $FE,$65,$05,$FE,$65               ;0EB555|        |0E0565;
                       db $05,$A5,$1A,$29,$0F               ;0EB55A|        |0000A5;
                       db $D0,$05,$A9,$15,$20               ;0EB55F|        |0EB566;
                       db $5F,$E2,$20,$75,$EF               ;0EB564|        |7520E2;
                       db $20,$16,$B9,$4C,$51               ;0EB569|        |0EB916;
                       db $B9,$A4,$10,$B9,$38               ;0EB56E|        |0E10A4;
                       db $04,$38,$FD,$38,$04               ;0EB573|        |000038;
                       db $B0,$05,$49,$FF,$18               ;0EB578|        |0EB57F;
                       db $69,$01,$C9,$10,$B0               ;0EB57D|        |      ;
                       db $D8,$B9,$1C,$04,$38               ;0EB582|        |      ;
                       db $FD,$1C,$04,$B0,$05               ;0EB587|        |0E041C;
                       db $49,$FF,$18,$69,$01               ;0EB58C|        |      ;
                       db $C9,$10,$B0,$C6,$A9               ;0EB591|        |      ;
                       db $00,$9D,$38,$04,$60               ;0EB596|        |      ;
                       db $A5,$10,$C9,$01,$F0               ;0EB59B|        |000010;
                       db $12,$A0,$00,$B9,$08               ;0EB5A0|        |0000A0;
                       db $B7,$C9,$FF,$F0,$09               ;0EB5A5|        |0000C9;
                       db $CD,$65,$05,$F0,$08               ;0EB5AA|        |0E0565;
                       db $C8,$C8,$D0,$F0,$A0               ;0EB5AF|        |      ;
                       db $00,$38,$60,$18,$60               ;0EB5B4|        |      ;
                       db $DE,$C1,$05,$D0,$FA               ;0EB5B9|        |0E05C1;
                       db $A4,$10,$B9,$38,$04               ;0EB5BE|        |000010;
                       db $85,$0C,$B9,$1C,$04               ;0EB5C3|        |00000C;
                       db $85,$0D,$B9,$A8,$04               ;0EB5C8|        |00000D;
                       db $85,$0E,$A9,$13,$20               ;0EB5CD|        |00000E;
                       db $5F,$E2,$20,$9B,$B5               ;0EB5D2|        |9B20E2;
                       db $B0,$0F,$B9,$09,$B7               ;0EB5D7|        |0EB5E8;
                       db $0A,$85,$00,$0A,$0A               ;0EB5DC|        |      ;
                       db $18,$65,$00,$79,$09               ;0EB5E1|        |      ;
                       db $B7,$A8,$B9,$0D,$B7               ;0EB5E6|        |0000A8;
                       db $18,$65,$0C,$9D,$38               ;0EB5EB|        |      ;
                       db $04,$B9,$0E,$B7,$18               ;0EB5F0|        |0000B9;
                       db $65,$0D,$9D,$1C,$04               ;0EB5F5|        |00000D;
                       db $A5,$0E,$59,$0F,$B7               ;0EB5FA|        |00000E;
                       db $9D,$A8,$04,$F0,$04               ;0EB5FF|        |0E04A8;
                       db $C8,$C8,$C8,$C8,$B9               ;0EB604|        |      ;
                       db $10,$B7,$9D,$F2,$04               ;0EB609|        |0EB5C2;
                       db $B9,$11,$B7,$9D,$09               ;0EB60E|        |0EB711;
                       db $05,$B9,$12,$B7,$9D               ;0EB613|        |0000B9;
                       db $20,$05,$B9,$13,$B7               ;0EB618|        |0EB905;
                       db $9D,$37,$05,$A9,$00               ;0EB61D|        |0E0537;
                       db $A0,$08,$20,$5C,$EF               ;0EB622|        |      ;
                       db $4C,$54,$AF,$DE,$C1               ;0EB627|        |0EAF54;
 
                       db $05,$D0,$89,$A4,$10               ;0EB62C|        |0000D0;
                       db $B9,$38,$04,$85,$0C               ;0EB631|        |0E0438;
                       db $B9,$1C,$04,$85,$0D               ;0EB636|        |0E041C;
                       db $B9,$A8,$04,$85,$0E               ;0EB63B|        |0E04A8;
                       db $A9,$14,$20,$5F,$E2               ;0EB640|        |      ;
                       db $20,$9B,$B5,$B0,$0C               ;0EB645|        |0EB59B;
                       db $B9,$09,$B7,$0A,$0A               ;0EB64A|        |0EB709;
                       db $85,$00,$0A,$18,$65               ;0EB64F|        |000000;
                       db $00,$A8,$B9,$2E,$B7               ;0EB654|        |      ;
                       db $9D,$00,$04,$B9,$2F               ;0EB659|        |0E0400;
                       db $B7,$18,$65,$0C,$9D               ;0EB65E|        |000018;
                       db $38,$04,$B9,$30,$B7               ;0EB663|        |      ;
                       db $18,$65,$0D,$9D,$1C               ;0EB668|        |      ;
                       db $04,$A5,$10,$C9,$01               ;0EB66D|        |0000A5;
                       db $F0,$10,$AD,$65,$05               ;0EB672|        |0EB684;
                       db $C9,$1C,$D0,$09,$18               ;0EB677|        |      ;
                       db $BD,$1C,$04,$69,$06               ;0EB67C|        |0E041C;
                       db $9D,$1C,$04,$A5,$0E               ;0EB681|        |0E041C;
                       db $59,$31,$B7,$9D,$A8               ;0EB686|        |0EB731;
                       db $04,$F0,$04,$C8,$C8               ;0EB68B|        |0000F0;
                       db $C8,$C8,$B9,$32,$B7               ;0EB690|        |      ;
                       db $9D,$F2,$04,$B9,$33               ;0EB695|        |0E04F2;
                       db $B7,$9D,$09,$05,$B9               ;0EB69A|        |00009D;
                       db $34,$B7,$9D,$20,$05               ;0EB69F|        |0000B7;
                       db $B9,$35,$B7,$9D,$37               ;0EB6A4|        |0EB735;
                       db $05,$A9,$00,$9D,$8C               ;0EB6A9|        |0000A9;
                       db $04,$4C,$54,$AF,$DE               ;0EB6AE|        |00004C;
                       db $C1,$05,$D0,$50,$A9               ;0EB6B3|        |000005;
                       db $14,$20,$5F,$E2,$A9               ;0EB6B8|        |000020;
                       db $00,$9D,$8C,$04,$A9               ;0EB6BD|        |      ;
                       db $4E,$9D,$00,$04,$AD               ;0EB6C2|        |0E009D;
                       db $A8,$04,$9D,$A8,$04               ;0EB6C7|        |      ;
                       db $0A,$A8,$B9,$8D,$B4               ;0EB6CC|        |      ;
                       db $9D,$F2,$04,$B9,$8E               ;0EB6D1|        |0E04F2;
                       db $B4,$9D,$09,$05,$A9               ;0EB6D6|        |00009D;
                       db $00,$9D,$37,$05,$9D               ;0EB6DB|        |      ;
                       db $20,$05,$AD,$38,$04               ;0EB6E0|        |0EAD05;
                       db $9D,$38,$04,$38,$AD               ;0EB6E5|        |0E0438;
                       db $1C,$04,$E9,$04,$9D               ;0EB6EA|        |0EE904;
                       db $1C,$04,$4C,$54,$AF               ;0EB6EF|        |0E4C04;
                       db $BD,$1D,$06,$D0,$09               ;0EB6F4|        |0E061D;
                       db $20,$16,$B9,$20,$2F               ;0EB6F9|        |0EB916;
                       db $B9,$4C,$51,$B9,$A9               ;0EB6FE|        |0E514C;
                       db $00,$9D,$38,$04,$60               ;0EB703|        |      ;
                       db $46,$01,$48,$02,$FF               ;0EB708|        |000001;
                       db $00,$00,$00,$02,$00               ;0EB70D|        |      ;
                       db $FA,$80,$FE,$00,$FA               ;0EB712|        |      ;
                       db $80,$00,$00,$01,$02               ;0EB717|        |0EB719;
 
                       db $00,$FA,$80,$FE,$00               ;0EB71C|        |      ;
                       db $FA,$80,$00,$00,$00               ;0EB721|        |      ;
                       db $00,$00,$00,$00,$00               ;0EB726|        |      ;
                       db $00,$00,$00,$4E,$00               ;0EB72B|        |      ;
                       db $FC,$00,$04,$00,$00               ;0EB730|        |0E0400;
                       db $00,$FC,$00,$00,$00               ;0EB735|        |      ;
                       db $4E,$00,$00,$01,$04               ;0EB73A|        |0E0000;
                       db $00,$00,$00,$FC,$00               ;0EB73F|        |      ;
                       db $00,$00,$64,$00,$00               ;0EB744|        |      ;
                       db $00,$00,$00,$04,$00               ;0EB749|        |      ;
                       db $00,$00,$04,$00,$DE               ;0EB74E|        |      ;
                       db $C1,$05,$D0,$3A,$A9               ;0EB753|        |000005;
                       db $00,$9D,$8C,$04,$A9               ;0EB758|        |      ;
                       db $52,$9D,$00,$04,$AD               ;0EB75D|        |00009D;
                       db $A8,$04,$0A,$A8,$B9               ;0EB762|        |      ;
                       db $91,$B4,$9D,$F2,$04               ;0EB767|        |0000B4;
                       db $B9,$92,$B4,$9D,$09               ;0EB76C|        |0EB492;
                       db $05,$A9,$FE,$9D,$20               ;0EB771|        |0000A9;
                       db $05,$A9,$80,$9D,$37               ;0EB776|        |0000A9;
                       db $05,$AD,$A8,$04,$9D               ;0EB77B|        |0000AD;
                       db $A8,$04,$AD,$38,$04               ;0EB780|        |      ;
                       db $9D,$38,$04,$AD,$1C               ;0EB785|        |0E0438;
                       db $04,$9D,$1C,$04,$4C               ;0EB78A|        |00009D;
                       db $54,$AF,$60,$A9,$00               ;0EB78F|        |      ;
                       db $A0,$08,$20,$1E,$FC               ;0EB794|        |      ;
                       db $D0,$1A,$BD,$37,$05               ;0EB799|        |0EB7B5;
                       db $18,$69,$20,$9D,$37               ;0EB79E|        |      ;
                       db $05,$BD,$20,$05,$69               ;0EB7A3|        |0000BD;
                       db $00,$9D,$20,$05,$20               ;0EB7A8|        |      ;
                       db $16,$B9,$20,$2F,$B9               ;0EB7AD|        |0000B9;
                       db $4C,$51,$B9,$A9,$16               ;0EB7B2|        |0EB951;
 
                       db $20,$5F,$E2,$20,$55               ;0EB7B7|        |0EE25F;
                       db $BC,$A9,$4C,$9D,$C1               ;0EB7BC|        |0E4CA9;
                       db $05,$A9,$00,$A0,$0C               ;0EB7C1|        |0000A9;
                       db $20,$5C,$EF,$FE,$65               ;0EB7C6|        |0EEF5C;
                       db $05,$FE,$65,$05,$60               ;0EB7CB|        |0000FE;
                       db $DE,$C1,$05,$D0,$06               ;0EB7D0|        |0E05C1;
                       db $A9,$00,$9D,$38,$04               ;0EB7D5|        |      ;
                       db $60,$A5,$1A,$29,$0F               ;0EB7DA|        |      ;
 
                       db $D0,$03,$20,$55,$BC               ;0EB7DF|        |0EB7E4;
                       db $20,$75,$EF,$4C,$51               ;0EB7E4|        |0EEF75;
                       db $B9,$BD,$4E,$05,$9D               ;0EB7E9|        |0E4EBD;
                       db $4F,$05,$9D,$50,$05               ;0EB7EE|        |509D05;
                       db $20,$6E,$B4,$18,$69               ;0EB7F3|        |0EB46E;
                       db $01,$9D,$C2,$05,$9D               ;0EB7F8|        |00009D;
                       db $C3,$05,$A9,$00,$9D               ;0EB7FD|        |000005;
                       db $38,$04,$9D,$39,$04               ;0EB802|        |      ;
                       db $9D,$3A,$04,$9D,$1C               ;0EB807|        |0E043A;
                       db $04,$9D,$1D,$04,$9D               ;0EB80C|        |00009D;
                       db $1E,$04,$FE,$65,$05               ;0EB811|        |0EFE04;
                       db $FE,$65,$05,$BD,$65               ;0EB816|        |0E0565;
                       db $05,$9D,$66,$05,$9D               ;0EB81B|        |00009D;
                       db $67,$05,$60,$DE,$C1               ;0EB820|        |000005;
                       db $05,$F0,$01,$60,$A9               ;0EB825|        |0000F0;
                       db $21,$20,$5F,$E2,$A9               ;0EB82A|        |000020;
                       db $02,$A0,$09,$20,$5C               ;0EB82F|        |      ;
                       db $EF,$8A,$38,$E9,$14               ;0EB834|        |E9388A;
                       db $0A,$0A,$A8,$B9,$F1               ;0EB839|        |      ;
                       db $B8,$9D,$F2,$04,$B9               ;0EB83E|        |      ;
                       db $F2,$B8,$9D,$09,$05               ;0EB843|        |0000B8;
                       db $B9,$F3,$B8,$9D,$20               ;0EB848|        |0EB8F3;
                       db $05,$B9,$F4,$B8,$9D               ;0EB84D|        |0000B9;
                       db $37,$05,$A9,$00,$9D               ;0EB852|        |000005;
                       db $A8,$04,$AD,$38,$04               ;0EB857|        |      ;
                       db $9D,$38,$04,$9D,$EF               ;0EB85C|        |0E0438;
                       db $05,$AD,$C4,$04,$9D               ;0EB861|        |0000AD;
                       db $C4,$04,$9D,$D8,$05               ;0EB866|        |000004;
                       db $AD,$1C,$04,$9D,$1C               ;0EB86B|        |0E041C;
                       db $04,$A9,$20,$9D,$C1               ;0EB870|        |0000A9;
                       db $05,$4C,$54,$AF,$A9               ;0EB875|        |00004C;
                       db $00,$9D,$4E,$05,$9D               ;0EB87A|        |      ;
                       db $00,$04,$9D,$38,$04               ;0EB87F|        |      ;
                       db $9D,$1C,$04,$E8,$E0               ;0EB884|        |0E041C;
                       db $17,$90,$EF,$20,$69               ;0EB889|        |000090;
                       db $B9,$90,$10,$AD,$65               ;0EB88E|        |0E1090;
                       db $05,$09,$80,$8D,$65               ;0EB893|        |000009;
                       db $05,$A9,$1A,$85,$2A               ;0EB898|        |0000A9;
                       db $A9,$00,$85,$6B,$68               ;0EB89D|        |      ;
                       db $68,$60,$DE,$C1,$05               ;0EB8A2|        |      ;
                       db $F0,$D0,$A9,$00,$9D               ;0EB8A7|        |0EB879;
                       db $70,$04,$BD,$38,$04               ;0EB8AC|        |0EB8B2;
                       db $85,$09,$BD,$C4,$04               ;0EB8B1|        |000009;
                       db $85,$08,$BD,$EF,$05               ;0EB8B6|        |000008;
                       db $9D,$38,$04,$BD,$D8               ;0EB8BB|        |0E0438;
                       db $05,$9D,$C4,$04,$A5               ;0EB8C0|        |00009D;
                       db $09,$9D,$EF,$05,$A5               ;0EB8C5|        |      ;
                       db $08,$9D,$D8,$05,$A9               ;0EB8CA|        |      ;
                       db $00,$38,$FD,$09,$05               ;0EB8CF|        |      ;
                       db $9D,$09,$05,$A9,$00               ;0EB8D4|        |0E0509;
                       db $FD,$F2,$04,$9D,$F2               ;0EB8D9|        |0E04F2;
                       db $04,$20,$75,$EF,$20               ;0EB8DE|        |000020;
                       db $16,$B9,$20,$FD,$B8               ;0EB8E3|        |0000B9;
                       db $20,$2F,$B9,$20,$51               ;0EB8E8|        |0EB92F;
                       db $B9,$4C,$43,$B9,$02               ;0EB8ED|        |0E434C;
                       db $00,$00,$00,$01,$9E               ;0EB8F2|        |      ;
                       db $FE,$D4,$00,$9E,$FE               ;0EB8F7|        |0E00D4;
                       db $1A,$BD,$EF,$05,$F0               ;0EB8FC|        |      ;
                       db $13,$BD,$D8,$05,$38               ;0EB901|        |0000BD;
                       db $FD,$09,$05,$9D,$D8               ;0EB906|        |0E0509;
                       db $05,$BD,$EF,$05,$FD               ;0EB90B|        |0000BD;
                       db $F2,$04,$9D,$EF,$05               ;0EB910|        |000004;
                       db $60,$BD,$38,$04,$F0               ;0EB915|        |      ;
 
                       db $13,$BD,$C4,$04,$18               ;0EB91A|        |0000BD;
                       db $7D,$09,$05,$9D,$C4               ;0EB91F|        |0E0509;
                       db $04,$BD,$38,$04,$7D               ;0EB924|        |0000BD;
                       db $F2,$04,$9D,$38,$04               ;0EB929|        |000004;
                       db $60,$BD,$DB,$04,$18               ;0EB92E|        |      ;
 
                       db $7D,$37,$05,$9D,$DB               ;0EB933|        |0E0537;
                       db $04,$BD,$1C,$04,$7D               ;0EB938|        |0000BD;
                       db $20,$05,$9D,$1C,$04               ;0EB93D|        |0E9D05;
                       db $60,$A5,$68,$30,$09               ;0EB942|        |      ;
 
                       db $BD,$EF,$05,$38,$E5               ;0EB947|        |0E05EF;
                       db $6E,$9D,$EF,$05,$60               ;0EB94C|        |0EEF9D;
                       db $A5,$68,$30,$0A,$BD               ;0EB951|        |000068;
                       db $38,$04,$38,$E5,$6E               ;0EB956|        |      ;
                       db $9D,$38,$04,$60,$BD               ;0EB95B|        |0E0438;
                       db $1C,$04,$18,$65,$6E               ;0EB960|        |0E1804;
                       db $9D,$1C,$04,$60,$A5               ;0EB965|        |0E041C;
                       db $7D,$29,$F0,$C9,$30               ;0EB96A|        |0EF029;
                       db $D0,$0F,$A9,$00,$A2               ;0EB96F|        |0EB980;
                       db $10,$20,$DD,$FC,$C9               ;0EB974|        |0EB996;
                       db $02,$F0,$06,$C9,$03               ;0EB979|        |      ;
                       db $F0,$02,$18,$60,$38               ;0EB97E|        |0EB982;
                       db $60,$A9,$0E,$9D,$8C               ;0EB983|        |      ;
 
                       db $04,$A9,$18,$9D,$00               ;0EB988|        |0000A9;
                       db $04,$A9,$00,$9D,$70               ;0EB98D|        |0000A9;
                       db $04,$A9,$20,$9D,$C1               ;0EB992|        |0000A9;
                       db $05,$FE,$65,$05,$FE               ;0EB997|        |0000FE;
                       db $65,$05,$60,$A9,$0E               ;0EB99C|        |000005;
                       db $9D,$8C,$04,$A9,$1A               ;0EB9A1|        |0E048C;
                       db $9D,$00,$04,$A9,$00               ;0EB9A6|        |0E0400;
                       db $9D,$70,$04,$A9,$20               ;0EB9AB|        |0E0470;
                       db $9D,$C1,$05,$FE,$65               ;0EB9B0|        |0E05C1;
                       db $05,$FE,$65,$05,$60               ;0EB9B5|        |0000FE;
                       db $FE,$65,$05,$FE,$65               ;0EB9BA|        |0E0565;
                       db $05,$DE,$C1,$05,$D0               ;0EB9BF|        |0000DE;
                       db $09,$A9,$00,$9D,$00               ;0EB9C4|        |      ;
                       db $04,$9D,$4E,$05,$60               ;0EB9C9|        |00009D;
                       db $BD,$1D,$06,$D0,$1A               ;0EB9CE|        |0E061D;
                       db $BD,$37,$05,$18,$69               ;0EB9D3|        |0E0537;
                       db $40,$9D,$37,$05,$BD               ;0EB9D8|        |      ;
                       db $20,$05,$69,$00,$9D               ;0EB9DD|        |0E6905;
                       db $20,$05,$20,$16,$B9               ;0EB9E2|        |0E2005;
                       db $20,$2F,$B9,$4C,$51               ;0EB9E7|        |0EB92F;
                       db $B9,$A9,$00,$9D,$38               ;0EB9EC|        |0E00A9;
                       db $04,$60,$18,$60,$A2               ;0EB9F1|        |000060;
                       db $14,$A4,$3B,$B9,$85               ;0EB9F6|        |0000A4;
                       db $00,$F0,$2E,$85,$08               ;0EB9FB|        |      ;
                       db $20,$A2,$BA,$90,$27               ;0EBA00|        |0EBAA2;
                       db $A4,$3B,$A5,$08,$C9               ;0EBA05|        |00003B;
                       db $06,$F0,$4F,$C9,$07               ;0EBA0A|        |0000F0;
                       db $F0,$4B,$C9,$0B,$F0               ;0EBA0F|        |0EBA5C;
                       db $2E,$B9,$87,$00,$85               ;0EBA14|        |0E87B9;
                       db $09,$A9,$03,$85,$0A               ;0EBA19|        |      ;
                       db $BD,$4E,$05,$F0,$0B               ;0EBA1E|        |0E054E;
                       db $C6,$09,$30,$05,$E8               ;0EBA23|        |000009;
                       db $C6,$0A,$D0,$F2,$18               ;0EBA28|        |00000A;
                       db $60,$20,$AA,$BA,$A5               ;0EBA2D|        |      ;
 
                       db $08,$9D,$4E,$05,$A9               ;0EBA32|        |      ;
                       db $00,$9D,$65,$05,$9D               ;0EBA37|        |      ;
                       db $1D,$06,$9D,$70,$04               ;0EBA3C|        |0E9D06;
                       db $38,$60,$A5,$AB,$D0               ;0EBA41|        |      ;
                       db $13,$20,$AA,$BA,$A9               ;0EBA46|        |000020;
                       db $B4,$85,$AC,$A9,$01               ;0EBA4B|        |000085;
                       db $85,$AB,$8D,$C9,$06               ;0EBA50|        |0000AB;
                       db $20,$99,$E1,$18,$60               ;0EBA55|        |0EE199;
                       db $18,$60,$AD,$62,$05               ;0EBA5A|        |      ;
                       db $0D,$63,$05,$0D,$64               ;0EBA5F|        |0E0563;
                       db $05,$F0,$C7,$D0,$C3               ;0EBA64|        |0000F0;
                       db $A2,$14,$A4,$3B,$B9               ;0EBA69|        |      ;
                       db $8E,$00,$85,$09,$A9               ;0EBA6E|        |0E8500;
                       db $03,$85,$0A,$A0,$00               ;0EBA73|        |000085;
                       db $BD,$4E,$05,$F0,$11               ;0EBA78|        |0E054E;
                       db $C6,$09,$30,$05,$E8               ;0EBA7D|        |000009;
                       db $C6,$0A,$D0,$F2,$C0               ;0EBA82|        |00000A;
                       db $00,$F0,$02,$38,$60               ;0EBA87|        |      ;
                       db $18,$60,$98,$9D,$D8               ;0EBA8C|        |      ;
                       db $05,$C8,$A9,$0A,$9D               ;0EBA91|        |0000C8;
                       db $4E,$05,$A9,$00,$9D               ;0EBA96|        |0EA905;
                       db $65,$05,$9D,$1D,$06               ;0EBA9B|        |000005;
                       db $F0,$DB,$A4,$08,$A5               ;0EBAA0|        |0EBA7D;
                       db $84,$D9,$B6,$BA,$60               ;0EBAA5|        |0000D9;
                       db $E0,$14,$90,$FB,$A4               ;0EBAAA|        |      ;
                       db $08,$B9,$B6,$BA,$4C               ;0EBAAF|        |      ;
                       db $53,$E7,$00,$01,$01               ;0EBAB4|        |0000E7;
                       db $01,$01,$01,$01,$01               ;0EBAB9|        |000001;
                       db $01,$01,$00,$05,$AD               ;0EBABE|        |000001;
                       db $7A,$BB,$85,$08,$AD               ;0EBAC3|        |      ;
                       db $7B,$BB,$85,$09,$A0               ;0EBAC8|        |      ;
                       db $00,$B9,$6F,$BB,$C9               ;0EBACD|        |      ;
                       db $FF,$F0,$39,$DD,$65               ;0EBAD2|        |DD39F0;
                       db $05,$F0,$04,$C8,$C8               ;0EBAD7|        |0000F0;
                       db $D0,$F0,$C9,$46,$D0               ;0EBADC|        |0EBACE;
                       db $09,$AD,$AA,$05,$C9               ;0EBAE1|        |      ;
                       db $0D,$D0,$02,$C8,$C8               ;0EBAE6|        |0E02D0;
                       db $B9,$70,$BB,$A8,$4C               ;0EBAEB|        |0EBB70;
                       db $3F,$BB,$A2,$00,$DE               ;0EBAF0|        |00A2BB;
                       db $7C,$05,$F0,$02,$18               ;0EBAF5|        |0EF005;
                       db $60,$BD,$4E,$05,$C9               ;0EBAFA|        |      ;
 
                       db $02,$F0,$C0,$0A,$A8               ;0EBAFF|        |      ;
                       db $B9,$76,$BB,$85,$08               ;0EBB04|        |0EBB76;
                       db $B9,$77,$BB,$85,$09               ;0EBB09|        |0EBB77;
                       db $A0,$00,$B9,$64,$BB               ;0EBB0E|        |      ;
                       db $C9,$FF,$F0,$22,$DD               ;0EBB13|        |      ;
                       db $65,$05,$F0,$04,$C8               ;0EBB18|        |000005;
                       db $C8,$D0,$F0,$C9,$24               ;0EBB1D|        |      ;
                       db $D0,$17,$BD,$A8,$04               ;0EBB22|        |0EBB3B;
                       db $F0,$09,$BD,$EF,$05               ;0EBB27|        |0EBB32;
                       db $F0,$0D,$C8,$C8,$D0               ;0EBB2C|        |0EBB3B;
                       db $09,$BD,$EF,$05,$D0               ;0EBB31|        |      ;
                       db $04,$F0,$F5,$A0,$00               ;0EBB36|        |0000F0;
                       db $B9,$65,$BB,$A8,$B1               ;0EBB3B|        |0EBB65;
                       db $08,$85,$0A,$C8,$B1               ;0EBB40|        |      ;
                       db $08,$85,$0B,$BC,$93               ;0EBB45|        |      ;
                       db $05,$B1,$0A,$C9,$FF               ;0EBB4A|        |0000B1;
                       db $F0,$11,$9D,$00,$04               ;0EBB4F|        |0EBB62;
                       db $C8,$B1,$0A,$9D,$7C               ;0EBB54|        |      ;
                       db $05,$FE,$93,$05,$FE               ;0EBB59|        |0000FE;
                       db $93,$05,$18,$60,$38               ;0EBB5E|        |000005;
                       db $60,$20,$00,$22,$00               ;0EBB63|        |      ;
 
                       db $1C,$02,$24,$04,$24               ;0EBB68|        |0E2402;
                       db $06,$FF,$46,$08,$46               ;0EBB6D|        |0000FF;
                       db $0A,$48,$0C,$FF,$7E               ;0EBB72|        |      ;
                       db $BB,$86,$BB,$8E,$BB               ;0EBB77|        |      ;
                       db $9C,$BB,$A4,$BB,$AB               ;0EBB7C|        |0EA4BB;
                       db $BB,$B2,$BB,$BB,$BB               ;0EBB81|        |      ;
                       db $C4,$BB,$C9,$BB,$CE               ;0EBB86|        |0000BB;
                       db $BB,$D5,$BB,$DC,$BB               ;0EBB8B|        |      ;
                       db $E1,$BB,$E6,$BB,$ED               ;0EBB90|        |0000BB;
                       db $BB,$F4,$BB,$FB,$BB               ;0EBB95|        |      ;
                       db $02,$BC,$09,$BC,$10               ;0EBB9A|        |      ;
                       db $BC,$17,$BC,$20,$BC               ;0EBB9F|        |0EBC17;
                       db $18,$05,$1A,$07,$1C               ;0EBBA4|        |      ;
                       db $09,$FF,$1E,$05,$20               ;0EBBA9|        |      ;
                       db $07,$22,$09,$FF,$34               ;0EBBAE|        |000022;
                       db $05,$36,$07,$38,$09               ;0EBBB3|        |000036;
                       db $0A,$01,$FF,$3A,$05               ;0EBBB8|        |      ;
                       db $3C,$07,$3E,$09,$0C               ;0EBBBD|        |0E3E07;
                       db $01,$FF,$34,$08,$2C               ;0EBBC2|        |0000FF;
                       db $10,$FF,$36,$08,$2E               ;0EBBC7|        |0EBBC8;
                       db $10,$FF,$38,$08,$30               ;0EBBCC|        |0EBBCD;
                       db $10,$0A,$01,$FF,$3A               ;0EBBD1|        |0EBBDD;
                       db $08,$32,$10,$0C,$01               ;0EBBD6|        |      ;
                       db $FF,$24,$08,$26,$0D               ;0EBBDB|        |260824;
                       db $FF,$32,$08,$34,$0D               ;0EBBE0|        |340832;
                       db $FF,$2A,$08,$2C,$0D               ;0EBBE5|        |2C082A;
                       db $0A,$01,$FF,$2E,$08               ;0EBBEA|        |      ;
                       db $30,$0D,$0C,$01,$FF               ;0EBBEF|        |0EBBFE;
                       db $18,$08,$1C,$0D,$18               ;0EBBF4|        |      ;
                       db $01,$FF,$36,$08,$3A               ;0EBBF9|        |0000FF;
                       db $0D,$36,$01,$FF,$1E               ;0EBBFE|        |0E0136;
                       db $08,$22,$0D,$1E,$01               ;0EBC03|        |      ;
                       db $FF,$18,$08,$1A,$08               ;0EBC08|        |1A0818;
                       db $1C,$08,$FF,$1E,$08               ;0EBC0D|        |0EFF08;
                       db $20,$08,$22,$08,$FF               ;0EBC12|        |0E2208;
                       db $18,$08,$1A,$08,$1C               ;0EBC17|        |      ;
                       db $08,$0A,$01,$FF,$18               ;0EBC1C|        |      ;
                       db $08,$1A,$08,$1C,$08               ;0EBC21|        |      ;
                       db $0C,$01,$FF,$A5,$74               ;0EBC26|        |0EFF01;
                       db $F0,$01,$60,$E6,$74               ;0EBC2B|        |0EBC2E;
                       db $A4,$32,$C0,$0E,$F0               ;0EBC30|        |000032;
                       db $06,$B9,$45,$BC,$4C               ;0EBC35|        |0000B9;
                       db $5F,$E2,$A5,$33,$C9               ;0EBC3A|        |33A5E2;
                       db $02,$D0,$F4,$C8,$D0               ;0EBC3F|        |      ;
                       db $F1,$4F,$53,$50,$56               ;0EBC44|        |00004F;
                       db $55,$51,$52,$57,$54               ;0EBC49|        |000051;
                       db $58,$59,$5A,$5B,$5C               ;0EBC4E|        |      ;
                       db $5D,$5E,$86,$B1,$8A               ;0EBC53|        |0E865E;
                       db $38,$E9,$13,$C9,$04               ;0EBC58|        |      ;
                       db $B0,$1B,$A8,$D0,$08               ;0EBC5D|        |0EBC7A;
                       db $86,$B1,$E0,$13,$D0               ;0EBC62|        |0000B1;
                       db $12,$A0,$00,$A2,$01               ;0EBC67|        |0000A0;
                       db $BD,$8D,$06,$39,$7D               ;0EBC6C|        |0E068D;
                       db $BC,$9D,$8D,$06,$E8               ;0EBC71|        |0E8D9D;
                       db $E0,$13,$90,$F2,$A6               ;0EBC76|        |      ;
                       db $B1,$60,$FE,$FD,$FB               ;0EBC7B|        |000060;
                       db $F7,$A9,$01,$85,$10               ;0EBC80|        |0000A9;
                       db $A2,$05,$D0,$06,$A9               ;0EBC85|        |      ;
                       db $00,$85,$10,$A2,$13               ;0EBC8A|        |      ;
                       db $A4,$10,$B9,$4E,$05               ;0EBC8F|        |000010;
                       db $85,$11,$B9,$65,$05               ;0EBC94|        |000011;
                       db $85,$12,$B9,$A8,$04               ;0EBC99|        |000012;
                       db $85,$13,$B9,$38,$04               ;0EBC9E|        |000013;
                       db $85,$14,$B9,$1C,$04               ;0EBCA3|        |000014;
                       db $85,$15,$B9,$EF,$05               ;0EBCA8|        |000015;
                       db $85,$16,$BD,$65,$05               ;0EBCAD|        |000016;
                       db $D0,$44,$20,$62,$BC               ;0EBCB2|        |0EBCF8;
                       db $A5,$11,$C9,$01,$F0               ;0EBCB7|        |000011;
                       db $0A,$C9,$02,$D0,$0A               ;0EBCBC|        |      ;
                       db $A0,$80,$A9,$04,$D0               ;0EBCC1|        |      ;
                       db $08,$A9,$03,$D0,$02               ;0EBCC6|        |      ;
                       db $A5,$8E,$A0,$00,$8C               ;0EBCCB|        |00008E;
                       db $83,$04,$9D,$4E,$05               ;0EBCD0|        |000004;
                       db $A9,$00,$9D,$93,$05               ;0EBCD5|        |      ;
                       db $9D,$54,$04,$9D,$00               ;0EBCDA|        |0E0454;
                       db $04,$A9,$01,$9D,$7C               ;0EBCDF|        |0000A9;
                       db $05,$A4,$10,$B9,$8C               ;0EBCE4|        |0000A4;
                       db $04,$9D,$8C,$04,$B9               ;0EBCE9|        |00009D;
                       db $A8,$04,$9D,$A8,$04               ;0EBCEE|        |      ;
                       db $FE,$65,$05,$18,$60               ;0EBCF3|        |0E0565;
                       db $BD,$4E,$05,$C9,$01               ;0EBCF8|        |0E054E;
                       db $F0,$04,$C9,$02,$D0               ;0EBCFD|        |0EBD03;
                       db $07,$A5,$1A,$29,$03               ;0EBD02|        |0000A5;
                       db $9D,$54,$04,$A5,$11               ;0EBD07|        |0E0454;
                       db $0A,$A8,$B9,$DA,$BD               ;0EBD0C|        |      ;
                       db $85,$0C,$B9,$DB,$BD               ;0EBD11|        |00000C;
                       db $85,$0D,$A5,$14,$9D               ;0EBD16|        |00000D;
                       db $38,$04,$A5,$15,$A4               ;0EBD1B|        |      ;
                       db $12,$C0,$1C,$D0,$03               ;0EBD20|        |0000C0;
                       db $18,$69,$08,$9D,$1C               ;0EBD25|        |      ;
                       db $04,$A0,$00,$B1,$0C               ;0EBD2A|        |0000A0;
                       db $C9,$FF,$D0,$03,$4C               ;0EBD2F|        |      ;
                       db $C6,$BD,$C5,$12,$F0               ;0EBD34|        |0000BD;
                       db $04,$C8,$C8,$D0,$EF               ;0EBD39|        |0000C8;
                       db $C9,$1E,$D0,$12,$A5               ;0EBD3E|        |      ;
                       db $13,$F0,$08,$A5,$16               ;0EBD43|        |0000F0;
                       db $F0,$0A,$C8,$C8,$D0               ;0EBD48|        |0EBD54;
                       db $06,$A5,$16,$D0,$02               ;0EBD4D|        |0000A5;
                       db $C8,$C8,$C8,$B1,$0C               ;0EBD52|        |      ;
                       db $A8,$B9,$01,$BE,$85               ;0EBD57|        |      ;
                       db $08,$B9,$02,$BE,$85               ;0EBD5C|        |      ;
                       db $09,$DE,$7C,$05,$F0               ;0EBD61|        |      ;
                       db $02,$18,$60,$BD,$93               ;0EBD66|        |      ;
                       db $05,$85,$0F,$0A,$18               ;0EBD6B|        |000085;
                       db $65,$0F,$A8,$B1,$08               ;0EBD70|        |00000F;
                       db $C9,$FF,$F0,$4D,$84               ;0EBD75|        |      ;
                       db $00,$A4,$10,$99,$00               ;0EBD7A|        |      ;
                       db $04,$A4,$00,$C8,$B1               ;0EBD7F|        |0000A4;
                       db $08,$9D,$7C,$05,$C8               ;0EBD84|        |      ;
                       db $A5,$13,$F0,$08,$A9               ;0EBD89|        |000013;
                       db $00,$38,$F1,$08,$4C               ;0EBD8E|        |      ;
                       db $97,$BD,$B1,$08,$18               ;0EBD93|        |0000BD;
                       db $65,$14,$A4,$10,$99               ;0EBD98|        |000014;
                       db $38,$04,$BD,$4E,$05               ;0EBD9D|        |      ;
                       db $F0,$2C,$0A,$A8,$B9               ;0EBDA2|        |0EBDD0;
                       db $91,$BE,$85,$08,$B9               ;0EBDA7|        |0000BE;
                       db $92,$BE,$85,$09,$A5               ;0EBDAC|        |0000BE;
                       db $0F,$0A,$A8,$B1,$08               ;0EBDB1|        |B1A80A;
                       db $9D,$00,$04,$C8,$B1               ;0EBDB6|        |0E0400;
                       db $08,$9D,$1D,$06,$FE               ;0EBDBB|        |      ;
                       db $93,$05,$18,$60                   ;0EBDC0|        |000005;
 
          CODE_0EBDC4: LDX.B #$13                           ;0EBDC4|A213    |      ;
                       LDA.B #$00                           ;0EBDC6|A900    |      ;
                       STA.W $0400,X                        ;0EBDC8|9D0004  |0E0400;
                       STA.W $061D,X                        ;0EBDCB|9D1D06  |0E061D;
                       SEC                                  ;0EBDCE|38      |      ;
                       RTS                                  ;0EBDCF|60      |      ;
 
                       db $A4,$12,$C0,$1C,$D0               ;0EBDD0|        |000012;
                       db $CE,$A9,$05,$D0,$CA               ;0EBDD5|        |0E05A9;
                       db $E0,$BD,$EB,$BD,$F6               ;0EBDDA|        |      ;
                       db $BD,$18,$00,$1A,$00               ;0EBDDF|        |0E0018;
                       db $1C,$02,$1E,$04,$1E               ;0EBDE4|        |0E1E02;
                       db $06,$FF,$18,$08,$1A               ;0EBDE9|        |0000FF;
                       db $08,$1C,$0A,$1E,$0C               ;0EBDEE|        |      ;
                       db $1E,$0E,$FF,$18,$10               ;0EBDF3|        |0EFF0E;
                       db $1A,$10,$1C,$12,$1E               ;0EBDF8|        |      ;
                       db $14,$1E,$16,$FF,$19               ;0EBDFD|        |00001E;
                       db $BE,$23,$BE,$2D,$BE               ;0EBE02|        |0EBE23;
                       db $3A,$BE,$47,$BE,$4E               ;0EBE07|        |      ;
                       db $BE,$55,$BE,$5F,$BE               ;0EBE0C|        |0EBE55;
                       db $69,$BE,$73,$BE,$7D               ;0EBE11|        |      ;
                       db $BE,$87,$BE,$18,$05               ;0EBE16|        |0EBE87;
                       db $00,$1A,$07,$00,$1C               ;0EBE1B|        |      ;
                       db $09,$00,$FF,$1E,$05               ;0EBE20|        |      ;
                       db $00,$20,$07,$00,$22               ;0EBE25|        |      ;
                       db $09,$00,$FF,$34,$05               ;0EBE2A|        |      ;
                       db $00,$36,$07,$00,$38               ;0EBE2F|        |      ;
                       db $09,$00,$0A,$01,$00               ;0EBE34|        |      ;
                       db $FF,$3A,$05,$00,$3C               ;0EBE39|        |00053A;
                       db $07,$00,$3E,$09,$00               ;0EBE3E|        |000000;
                       db $0C,$01,$00,$FF,$18               ;0EBE43|        |0E0001;
                       db $05,$00,$1A,$09,$00               ;0EBE48|        |000000;
                       db $FF,$1C,$05,$00,$1E               ;0EBE4D|        |00051C;
                       db $09,$00,$FF,$24,$05               ;0EBE52|        |      ;
                       db $00,$26,$09,$00,$0A               ;0EBE57|        |      ;
                       db $01,$00,$FF,$28,$05               ;0EBE5C|        |000000;
                       db $00,$2A,$09,$00,$0C               ;0EBE61|        |      ;
                       db $01,$00,$FF,$28,$03               ;0EBE66|        |000000;
                       db $00,$44,$09,$00,$28               ;0EBE6B|        |      ;
                       db $02,$00,$FF,$46,$03               ;0EBE70|        |      ;
                       db $00,$4A,$09,$00,$46               ;0EBE75|        |      ;
                       db $02,$00,$FF,$50,$03               ;0EBE7A|        |      ;
                       db $00,$52,$09,$00,$50               ;0EBE7F|        |      ;
                       db $02,$00,$FF,$4C,$03               ;0EBE84|        |      ;
                       db $00,$4E,$09,$00,$4C               ;0EBE89|        |      ;
                       db $02,$00,$FF,$A5,$BE               ;0EBE8E|        |      ;
                       db $AD,$BE,$B5,$BE,$BD               ;0EBE93|        |0EB5BE;
                       db $BE,$9D,$BE,$C3,$BE               ;0EBE98|        |0EBE9D;
                       db $00,$00,$02,$40,$00               ;0EBE9D|        |      ;
                       db $00,$00,$00,$24,$00               ;0EBEA2|        |      ;
                       db $26,$00,$28,$40,$00               ;0EBEA7|        |000000;
                       db $00,$2C,$00,$2E,$00               ;0EBEAC|        |      ;
                       db $30,$60,$00,$00,$2C               ;0EBEB1|        |0EBF13;
                       db $00,$2E,$00,$32,$60               ;0EBEB6|        |      ;
                       db $00,$00,$20,$00,$22               ;0EBEBB|        |      ;
                       db $40,$00,$00,$2A,$00               ;0EBEC0|        |      ;
 
                       db $26,$00,$28,$40,$00               ;0EBEC5|        |000000;
                       db $00,$AD,$4E,$05,$0A               ;0EBECA|        |      ;
                       db $A8,$AD,$DA,$BD,$85               ;0EBECF|        |      ;
                       db $0C,$B9,$DB,$BD,$85               ;0EBED4|        |0EDBB9;
                       db $0D,$A0,$01,$B1,$0C               ;0EBED9|        |0E01A0;
                       db $A8,$B9,$01,$BE,$85               ;0EBEDE|        |      ;
                       db $08,$B9,$02,$BE,$85               ;0EBEE3|        |      ;
                       db $09,$AC,$A6,$05,$88               ;0EBEE8|        |      ;
                       db $30,$0D,$98,$85,$0F               ;0EBEED|        |0EBEFC;
                       db $0A,$18,$65,$0F,$A8               ;0EBEF2|        |      ;
                       db $B1,$08,$8D,$00,$04               ;0EBEF7|        |000008;
                       db $60,$21,$02,$00,$00               ;0EBEFC|        |      ;
 
                       db $00,$02,$BF,$A2,$01               ;0EBF01|        |      ;
                       db $12,$0A,$74,$72,$00               ;0EBF06|        |00000A;
                       db $12,$04,$B0,$80,$00               ;0EBF0B|        |000004;
                       db $0E,$0C,$10,$A0,$00               ;0EBF10|        |0E100C;
                       db $FF,$41,$20,$01,$01               ;0EBF15|        |012041;
                       db $02,$2C,$30,$60,$00               ;0EBF1A|        |      ;
                       db $02,$4A,$10,$44,$00               ;0EBF1F|        |      ;
                       db $02,$4A,$24,$34,$00               ;0EBF24|        |      ;
                       db $02,$4A,$3C,$34,$00               ;0EBF29|        |      ;
                       db $02,$4A,$50,$44,$00               ;0EBF2E|        |      ;
                       db $02,$4A,$58,$58,$00               ;0EBF33|        |      ;
                       db $08,$8C,$A8,$40,$01               ;0EBF38|        |      ;
                       db $08,$8E,$C8,$70,$01               ;0EBF3D|        |      ;
                       db $0E,$04,$90,$48,$01               ;0EBF42|        |0E9004;
                       db $0E,$04,$D0,$48,$01               ;0EBF47|        |0ED004;
                       db $FF,$11,$01,$00,$02               ;0EBF4C|        |000111;
                       db $04,$1C,$D8,$42,$00               ;0EBF51|        |00001C;
                       db $00,$4E,$A4,$42,$01               ;0EBF56|        |      ;
                       db $08,$B6,$5F,$40,$00               ;0EBF5B|        |      ;
                       db $0C,$3C,$5B,$B6,$01               ;0EBF60|        |0E5B3C;
                       db $0C,$3A,$46,$9C,$01               ;0EBF65|        |0E463A;
                       db $0C,$36,$26,$8E,$01               ;0EBF6A|        |0E2636;
                       db $0C,$38,$08,$93,$00               ;0EBF6F|        |0E0838;
                       db $FF,$81,$03,$01,$03               ;0EBF74|        |010381;
                       db $06,$36,$1D,$75,$00               ;0EBF79|        |000036;
                       db $08,$46,$56,$49,$01               ;0EBF7E|        |      ;
                       db $08,$46,$63,$71,$01               ;0EBF83|        |      ;
                       db $08,$44,$D0,$90,$01               ;0EBF88|        |      ;
                       db $FF,$B1,$02,$00,$00               ;0EBF8D|        |0002B1;
                       db $00,$02,$B0,$A0,$01               ;0EBF92|        |      ;
                       db $08,$32,$48,$50,$00               ;0EBF97|        |      ;
                       db $0E,$38,$70,$4C,$00               ;0EBF9C|        |0E7038;
                       db $0E,$04,$58,$7C,$01               ;0EBFA1|        |0E5804;
                       db $0E,$04,$C0,$38,$01               ;0EBFA6|        |0EC004;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFAB|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFB0|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFB5|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFBA|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFBF|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFC4|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFC9|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFCE|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFD3|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFD8|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFDD|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFE2|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFE7|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFEC|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFF1|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFF6|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF               ;0EBFFB|        |FFFFFF;
 
