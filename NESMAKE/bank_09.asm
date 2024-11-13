 
 
 
              bank_92: db $92                               ;098000|        |      ; NES PRG 24000
 
          CODE_098001: JSR.W endStopWatchAction             ;098001|204082  |098240;
                       LDY.W $054E,X                        ;098004|BC4E05  |09054E;
                       CPY.B #$2D                           ;098007|C02D    |      ;
                       BEQ CODE_09800F                      ;098009|F004    |09800F;
                       CPY.B #$10                           ;09800B|C010    |      ;
                       BCS CODE_09801A                      ;09800D|B00B    |09801A;
 
          CODE_09800F: JSR.W CODE_098478                    ;09800F|207884  |098478;
                       BEQ entiyIndex_stuff_XX              ;098012|F00C    |098020;
                       JSR.W CODE_09826D                    ;098014|206D82  |09826D;
                       BCC entiyIndex_stuff_XX              ;098017|9007    |098020;
                       RTS                                  ;098019|60      |      ;
 
 
          CODE_09801A: JSR.W CODE_098252                    ;09801A|205282  |098252;
                       BCC entiyIndex_stuff_XX              ;09801D|9001    |098020;
                       RTS                                  ;09801F|60      |      ;
 
 
  entiyIndex_stuff_XX: JSR.W CODE_09834F                    ;098020|204F83  |09834F;
                       BCC CODE_098026                      ;098023|9001    |098026;
                       RTS                                  ;098025|60      |      ;
 
 
          CODE_098026: LDA.W $07F3                          ;098026|ADF307  |0907F3;
                       AND.B #$7F                           ;098029|297F    |      ;
                       CMP.B #$02                           ;09802B|C902    |      ;
                       BCC CODE_09803B                      ;09802D|900C    |09803B;
                       LDA.W $054E,X                        ;09802F|BD4E05  |09054E;
                       CMP.B #$16                           ;098032|C916    |      ;
                       BEQ CODE_09803B                      ;098034|F005    |09803B;
                       CMP.B #$1A                           ;098036|C91A    |      ;
                       BEQ CODE_09803B                      ;098038|F001    |09803B;
                       RTS                                  ;09803A|60      |      ;
 
 
          CODE_09803B: LDA.W $054E,X                        ;09803B|BD4E05  |09054E;
                       CMP.B #$10                           ;09803E|C910    |      ;
                       BCC CODE_098054                      ;098040|9012    |098054;
                       CMP.B #$2D                           ;098042|C92D    |      ;
                       BEQ CODE_098054                      ;098044|F00E    |098054;
                       LDA.W $05EF,X                        ;098046|BDEF05  |0905EF;
                       BMI CODE_09804E                      ;098049|3003    |09804E;
                       db $20                               ;09804B|        |      ;
                       dw CODE_0FE604                       ;09804C|        |0FE604;
 
          CODE_09804E: LDA.W $054E,X                        ;09804E|BD4E05  |09054E;
                       BNE CODE_098054                      ;098051|D001    |098054;
                       RTS                                  ;098053|60      |      ;
 
 
          CODE_098054: LDA.B r_bossActiveFlag               ;098054|A578    |000078;
                       BNE skipStuff_09                     ;098056|D022    |09807A;
                       JSR.W UNREACH_0984BF                 ;098058|20BF84  |0984BF;
                       BCS skipStuff_09                     ;09805B|B01D    |09807A;
                       LDA.B r_sceneScrollOffsetLo          ;09805D|A556    |000056;
                       BNE skipStuff_09                     ;09805F|D019    |09807A;
 
             initBoss: LDA.B #$01                           ;098061|A901    |      ;
                       STA.B r_bossActiveFlag               ;098063|8578    |000078;
                       db $20                               ;098065|        |      ;
                       dw initBoss_00                       ;098066|        |0FE2D6;
                       db $20                               ;098068|        |      ;
                       dw CODE_0FFFBA                       ;098069|        |0FFFBA;
                       LDA.B #$00                           ;09806B|A900    |      ; region C000-DFFF is swapped with bank 7
                       STA.B r_scrollSpd                    ;09806D|856E    |00006E;
                       LDA.B r_stage                        ;09806F|A532    |000032;
                       CMP.B #$0E                           ;098071|C90E    |      ;
                       BEQ skipStuff_09                     ;098073|F005    |09807A;
                       LDA.B #$5F                           ;098075|A95F    |      ;
                       db $20                               ;098077|        |      ;
                       dw initFreezWaterEffect_01           ;098078|        |0FE25F;
 
         skipStuff_09: LDA.W $07F3                          ;09807A|ADF307  |0907F3;
                       AND.B #$80                           ;09807D|2980    |      ;
                       BEQ CODE_0980AE                      ;09807F|F02D    |0980AE;
                       LDA.W $054E,X                        ;098081|BD4E05  |09054E;
                       CMP.B #$26                           ;098084|C926    |      ;
                       BEQ CODE_0980AE                      ;098086|F026    |0980AE;
                       ASL A                                ;098088|0A      |      ;
                       TAY                                  ;098089|A8      |      ;
                       LDA.W PTR16_098178,Y                 ;09808A|B97881  |098178;
                       STA.B $00                            ;09808D|8500    |000000;
                       LDA.W PTR16_098179,Y                 ;09808F|B97981  |098179;
                       STA.B $01                            ;098092|8501    |000001;
                       JSR.W loadEnityIndex_jmp             ;098094|203D81  |09813D;
                       LDA.B #$00                           ;098097|A900    |      ;
                       STA.W $0657,X                        ;098099|9D5706  |090657;
                       LDA.W $07F3                          ;09809C|ADF307  |0907F3;
                       AND.B #$BF                           ;09809F|29BF    |      ;
                       BNE CODE_0980C5                      ;0980A1|D022    |0980C5;
                       LDA.W $0470,X                        ;0980A3|BD7004  |090470;
                       AND.B #$EF                           ;0980A6|29EF    |      ;
                       STA.W $0470,X                        ;0980A8|9D7004  |090470;
                       JMP.W CODE_0980D4                    ;0980AB|4CD480  |0980D4;
 
 
          CODE_0980AE: LDA.B r_sceneScrollOffsetLo          ;0980AE|A556    |000056;
                       BEQ CODE_0980B3                      ;0980B0|F001    |0980B3;
 
          CODE_0980B2: RTS                                  ;0980B2|60      |      ;
 
 
          CODE_0980B3: LDA.W r_entity_ObjectIdxes,X         ;0980B3|BD4E05  |00054E;
                       ASL A                                ;0980B6|0A      |      ;
                       TAY                                  ;0980B7|A8      |      ;
                       LDA.W nextEndityIndexLo,Y            ;0980B8|B9D481  |0981D4;
                       STA.B $00                            ;0980BB|8500    |000000;
                       LDA.W nextEndityIndexHi,Y            ;0980BD|B9D581  |0981D5;
                       STA.B $01                            ;0980C0|8501    |000001;
                       JSR.W loadEnityIndex_jmp             ;0980C2|203D81  |09813D;
 
          CODE_0980C5: LDA.W $07F3                          ;0980C5|ADF307  |0907F3;
                       AND.B #$BF                           ;0980C8|29BF    |      ;
                       BEQ CODE_0980D4                      ;0980CA|F008    |0980D4;
                       LDA.W $0470,X                        ;0980CC|BD7004  |090470;
                       ORA.B #$10                           ;0980CF|0910    |      ;
                       STA.W $0470,X                        ;0980D1|9D7004  |090470;
 
          CODE_0980D4: LDY.W $054E,X                        ;0980D4|BC4E05  |09054E;
                       CPY.B #$2D                           ;0980D7|C02D    |      ;
                       BEQ CODE_0980DF                      ;0980D9|F004    |0980DF;
                       CPY.B #$10                           ;0980DB|C010    |      ;
                       BCS CODE_0980E5                      ;0980DD|B006    |0980E5;
 
          CODE_0980DF: JSR.W CODE_098252                    ;0980DF|205282  |098252;
                       JSR.W CODE_098437                    ;0980E2|203784  |098437;
 
          CODE_0980E5: LDA.W $05EF,X                        ;0980E5|BDEF05  |0905EF;
                       ASL A                                ;0980E8|0A      |      ;
                       BEQ CODE_0980B2                      ;0980E9|F0C7    |0980B2;
                       TAY                                  ;0980EB|A8      |      ;
                       LDA.W UNREACH_0989EF,Y               ;0980EC|B9EF89  |0989EF;
                       STA.B $04                            ;0980EF|8504    |000004;
                       LDA.W UNREACH_0989F0,Y               ;0980F1|B9F089  |0989F0;
                       STA.B $05                            ;0980F4|8505    |000005;
                       LDA.W $05C1,X                        ;0980F6|BDC105  |0905C1;
                       ASL A                                ;0980F9|0A      |      ;
                       TAY                                  ;0980FA|A8      |      ;
                       LDA.B ($04),Y                        ;0980FB|B104    |000004;
                       STA.B r_collisionPointXvalDiv32      ;0980FD|8512    |000012;
                       INY                                  ;0980FF|C8      |      ;
                       LDA.B ($04),Y                        ;098100|B104    |000004;
                       TAY                                  ;098102|A8      |      ;
                       ASL A                                ;098103|0A      |      ;
                       CLC                                  ;098104|18      |      ;
                       ADC.W CODE_098138                    ;098105|6D3881  |098138;
                       STA.B $00                            ;098108|8500    |000000;
                       LDA.W LOOSE_OP_098139                ;09810A|AD3981  |098139;
                       ADC.B #$00                           ;09810D|6900    |      ;
                       STA.B $01                            ;09810F|8501    |000001;
                       LDA.B ($00),Y                        ;098111|B100    |000000;
                       STA.B r_collisionPointAbsoluteXInRoom;098113|8513    |000013;
                       INY                                  ;098115|C8      |      ;
                       LDA.B ($00),Y                        ;098116|B100    |000000;
                       STA.B r_collisionPointAbsoluteXRoom  ;098118|8514    |000014;
                       INY                                  ;09811A|C8      |      ;
                       LDA.B ($00),Y                        ;09811B|B100    |000000;
                       STA.B r_15                           ;09811D|8515    |000015;
                       LDA.B #$12                           ;09811F|A912    |      ;
                       STA.B $02                            ;098121|8502    |000002;
                       LDA.B #$00                           ;098123|A900    |      ;
                       STA.B $03                            ;098125|8503    |000003;
                       LDA.B r_collisionPointXvalDiv32      ;098127|A512    |000012;
                       ASL A                                ;098129|0A      |      ;
                       TAY                                  ;09812A|A8      |      ;
                       LDA.W PTR16_098671,Y                 ;09812B|B97186  |098671;
                       STA.B $00                            ;09812E|8500    |000000;
                       LDA.W PTR16_098672,Y                 ;098130|B97286  |098672;
                       STA.B $01                            ;098133|8501    |000001;
                       JMP.W jmp_00                         ;098135|4C3A81  |09813A;
 
 
          CODE_098138: LDA.B [r_knockBackDirrection]        ;098138|A790    |000090;
 
               jmp_00: JMP.W ($0000)                        ;09813A|6C0000  |000000;
 
 
   loadEnityIndex_jmp: LDY.W r_entity_ObjectIdxes,X         ;09813D|BC4E05  |00054E;
                       LDA.W seemsToBeABankTable,Y          ;098140|B94881  |098148;
                       BEQ jmp_00                           ;098143|F0F5    |09813A;
                       db $4C                               ;098145|        |      ;
 
                       dw titleScreenThunderMain            ;098146|        |0FE62F;
 
  seemsToBeABankTable: db $00,$00,$00,$86,$00,$00,$00,$86   ;098148|        |      ; ??
                       db $86,$86,$86,$98,$86,$00,$86,$98   ;098150|        |      ;
                       db $00,$00,$00,$00,$86,$86,$90,$00   ;098158|        |      ;
                       db $86,$86,$00,$86,$86,$86,$86,$00   ;098160|        |      ;
                       db $00,$00,$00,$86,$00,$00,$00,$86   ;098168|        |      ;
                       db $00,$00,$86,$86,$8A,$00,$00,$00   ;098170|        |      ;
 
         PTR16_098178: dw emptyEntiyIndex                   ;098178|        |098230;
                       dw entiyIndex_stuff_01               ;09817A|        |09A14F;
                       dw entiyIndex_stuff_02               ;09817C|        |09A4C9;
                       dw entiyIndex_stuff_03               ;09817E|        |038DD7;
                       dw entiyIndex_stuff_04               ;098180|        |09A931;
                       dw entiyIndex_stuff_05               ;098182|        |09ABAF;
                       dw entiyIndex_stuff_06               ;098184|        |09AEE9;
                       dw entiyIndex_stuff_07               ;098186|        |03931B;
                       dw entiyIndex_stuff_08               ;098188|        |038004;
                       dw entiyIndex_stuff_09               ;09818A|        |03851A;
                       dw entiyIndex_stuff_0A               ;09818C|        |03950F;
                       dw entiyIndex_stuff_0B               ;09818E|        |0CA59B;
                       dw entiyIndex_stuff_0C               ;098190|        |0399BE;
                       dw entiyIndex_stuff_0D               ;098192|        |09B4EF;
                       dw entiyIndex_stuff_RTS_0E           ;098194|        |038020;
                       dw $8230                             ;098196|        |      ; entiyIndex_stuff_0F seems off??
                       dw emptyEntiyIndex                   ;098198|        |098230;
                       dw emptyEntiyIndex                   ;09819A|        |098230;
                       dw emptyEntiyIndex                   ;09819C|        |098230;
                       dw emptyEntiyIndex                   ;09819E|        |098230;
                       dw entiyIndex_stuff_RTS_0E           ;0981A0|        |038020;
                       dw entiyIndex_stuff_RTS_0E           ;0981A2|        |038020;
                       dw $8230                             ;0981A4|        |      ;  entiyIndex_stuff_16 seems off as well..
                       dw emptyEntiyIndex                   ;0981A6|        |098230;
                       dw $8230,$8230,$89B3,$8230           ;0981A8|        |      ;
                       dw $8230                             ;0981B0|        |      ;
                       dw entiyIndex_stuff_RTS_0E           ;0981B2|        |038020;
                       dw entiyIndex_stuff_RTS_0E           ;0981B4|        |038020;
                       dw emptyEntiyIndex                   ;0981B6|        |098230;
                       dw emptyEntiyIndex                   ;0981B8|        |098230;
                       dw emptyEntiyIndex                   ;0981BA|        |098230;
                       dw emptyEntiyIndex                   ;0981BC|        |098230;
                       dw entiyIndex_stuff_RTS_0E           ;0981BE|        |038020;
                       dw emptyEntiyIndex                   ;0981C0|        |098230;
                       dw emptyEntiyIndex                   ;0981C2|        |098230;
                       dw entiyIndex_stuff_XX               ;0981C4|        |098020;
                       dw entiyIndex_stuff_RTS_0E           ;0981C6|        |038020;
                       dw $898B,$BCB8,$8020,$9CF6           ;0981C8|        |      ;
                       dw $BC75,$AEE9                       ;0981D0|        |      ;
 
    nextEndityIndexLo: dw emptyEntiyIndex                   ;0981D4|        |098230;
                       dw $A1F5,$A5DF,$8E12,$A992           ;0981D6|        |      ;
                       dw $AC3D,$AF86,$937C,$8021           ;0981DE|        |      ;
                       dw $8A34,$968F,$A610,$9A14           ;0981E6|        |      ;
                       dw $B5AC,$8A3F,$A464,$A49A           ;0981EE|        |      ;
                       dw $A44B,$A803,$A87F,$9275           ;0981F6|        |      ;
                       dw $92B9,$BED9,$AEBB,$94BB           ;0981FE|        |      ;
                       dw $94D4,$89B3,$8416,$84CA           ;098206|        |      ;
                       dw $986A,$98EA,$A530,$A584           ;09820E|        |      ;
                       dw $AC01,$A193,$8DA2,$B8A9           ;098216|        |      ;
                       dw $B56E,$B49F,$8C02,$898B           ;09821E|        |      ;
                       dw $BCB8,$8020,$9CF6,$BC75           ;098226|        |      ;
                       dw $B046                             ;09822E|        |      ;
 
      emptyEntiyIndex: RTS                                  ;098230|60      |      ;
 
                       LDA.W $0669,X                        ;098231|BD6906  |090669;
                       BEQ emptyEntiyIndex                  ;098234|F0FA    |098230;
                       LDA.B #$00                           ;098236|A900    |      ;
                       STA.W $0669,X                        ;098238|9D6906  |090669;
                       LDA.B #$28                           ;09823B|A928    |      ;
                       db $4C                               ;09823D|        |      ;
 
                       dw initFreezWaterEffect_01           ;09823E|        |0FE25F;
 
   endStopWatchAction: LDA.B r_bossActiveFlag               ;098240|A578    |000078;
                       BEQ CODE_098251                      ;098242|F00D    |098251;
                       LDA.B r_stopWatchActive              ;098244|A5AB    |0000AB;
                       BEQ CODE_098251                      ;098246|F009    |098251;
                       LDY.B r_stopWatchTimer               ;098248|A4AC    |0000AC;
                       DEY                                  ;09824A|88      |      ;
                       BEQ CODE_098251                      ;09824B|F004    |098251;
                       LDA.B #$01                           ;09824D|A901    |      ;
                       STA.B r_stopWatchTimer               ;09824F|85AC    |0000AC;
 
          CODE_098251: RTS                                  ;098251|60      |      ;
 
 
          CODE_098252: LDY.W $054E,X                        ;098252|BC4E05  |09054E;
                       LDA.W UNREACH_098317,Y               ;098255|B91783  |098317;
                       STA.B $02                            ;098258|8502    |000002;
                       BEQ CODE_0982C8                      ;09825A|F06C    |0982C8;
                       JSR.W CODE_098478                    ;09825C|207884  |098478;
                       BNE CODE_09826D                      ;09825F|D00C    |09826D;
                       LDA.W $0669,X                        ;098261|BD6906  |090669;
                       AND.B #$0F                           ;098264|290F    |      ;
                       CMP.B #$02                           ;098266|C902    |      ;
                       BNE CODE_0982C8                      ;098268|D05E    |0982C8;
                       JMP.W CODE_0983C5                    ;09826A|4CC583  |0983C5;
 
 
          CODE_09826D: LDA.W $0669,X                        ;09826D|BD6906  |090669;
                       AND.B #$F0                           ;098270|29F0    |      ;
                       BNE CODE_0982CA                      ;098272|D056    |0982CA;
 
        till790isZero: DEC.W $0790,X                        ;098274|DE9007  |090790;
                       BNE CODE_0982B5                      ;098277|D03C    |0982B5;
 
          CODE_098279: LDA.W r_entity_PaletteOverride,X     ;098279|BD5404  |000454;
                       AND.B #$F3                           ;09827C|29F3    |      ;
                       STA.W $0454,X                        ;09827E|9D5404  |090454;
                       LDA.W $054E,X                        ;098281|BD4E05  |09054E;
                       CMP.B #$23                           ;098284|C923    |      ;
                       BEQ CODE_098290                      ;098286|F008    |098290;
                       CMP.B #$06                           ;098288|C906    |      ;
                       BEQ CODE_098290                      ;09828A|F004    |098290;
                       CMP.B #$2D                           ;09828C|C92D    |      ;
                       BNE CODE_098294                      ;09828E|D004    |098294;
 
          CODE_098290: LDA.B #$60                           ;098290|A960    |      ;
                       BNE CODE_09829B                      ;098292|D007    |09829B;
 
          CODE_098294: LDA.W $0470,X                        ;098294|BD7004  |090470;
                       AND.B #$DF                           ;098297|29DF    |      ;
                       ORA.B #$40                           ;098299|0940    |      ;
 
          CODE_09829B: STA.W $0470,X                        ;09829B|9D7004  |090470;
 
          CODE_09829E: JSR.W CODE_09848A                    ;09829E|208A84  |09848A;
                       LDY.B $00                            ;0982A1|A400    |000000;
                       LDA.B #$FF                           ;0982A3|A9FF    |      ;
                       SEC                                  ;0982A5|38      |      ;
                       SBC.B $01                            ;0982A6|E501    |000001;
                       AND.W $00C4,Y                        ;0982A8|39C400  |0900C4;
                       STA.W $00C4,Y                        ;0982AB|99C400  |0900C4;
                       LDA.B #$00                           ;0982AE|A900    |      ;
                       STA.W $0669,X                        ;0982B0|9D6906  |090669;
                       SEC                                  ;0982B3|38      |      ;
                       RTS                                  ;0982B4|60      |      ;
 
 
          CODE_0982B5: LDY.W $0790,X                        ;0982B5|BC9007  |090790;
                       CPY.B #$0E                           ;0982B8|C00E    |      ;
                       BNE CODE_0982C6                      ;0982BA|D00A    |0982C6;
                       LDA.W $054E,X                        ;0982BC|BD4E05  |09054E;
                       CMP.B #$06                           ;0982BF|C906    |      ;
                       BNE CODE_0982C6                      ;0982C1|D003    |0982C6;
                       JSR.W CODE_0983AD                    ;0982C3|20AD83  |0983AD;
 
          CODE_0982C6: SEC                                  ;0982C6|38      |      ;
                       RTS                                  ;0982C7|60      |      ;
 
 
          CODE_0982C8: CLC                                  ;0982C8|18      |      ;
                       RTS                                  ;0982C9|60      |      ;
 
 
          CODE_0982CA: LDA.W $054E,X                        ;0982CA|BD4E05  |09054E;
                       CMP.B #$06                           ;0982CD|C906    |      ;
                       BEQ CODE_09830F                      ;0982CF|F03E    |09830F;
                       CMP.B #$10                           ;0982D1|C910    |      ;
                       BCC CODE_0982F0                      ;0982D3|901B    |0982F0;
                       CMP.B #$2D                           ;0982D5|C92D    |      ;
                       BEQ CODE_09830F                      ;0982D7|F036    |09830F;
                       LDA.W UNREACH_0984BD                 ;0982D9|ADBD84  |0984BD;
                       STA.B $00                            ;0982DC|8500    |000000;
                       LDA.W UNREACH_0984BE                 ;0982DE|ADBE84  |0984BE;
 
                       STA.B $01                            ;0982E1|8501    |000001;
                       LDA.B #$8A                           ;0982E3|A98A    |      ;
                       db $20                               ;0982E5|        |      ;
                       dw titleScreenThunderMain            ;0982E6|        |0FE62F;
                       LDX.B r_entityID_processed           ;0982E8|A66C    |00006C;
                       JSR.W CODE_09873A                    ;0982EA|203A87  |09873A;
                       JMP.W CODE_09829E                    ;0982ED|4C9E82  |09829E;
 
 
          CODE_0982F0: CMP.B #$0C                           ;0982F0|C90C    |      ;
                       BEQ CODE_09830F                      ;0982F2|F01B    |09830F;
                       CMP.B #$08                           ;0982F4|C908    |      ;
                       BNE CODE_0982FD                      ;0982F6|D005    |0982FD;
                       LDA.W $0606,X                        ;0982F8|BD0606  |090606;
                       BMI CODE_09830F                      ;0982FB|3012    |09830F;
 
          CODE_0982FD: LDA.B #$01                           ;0982FD|A901    |      ;
                       JSR.W UNREACH_098905                 ;0982FF|200589  |098905;
                       LDA.W $067B,X                        ;098302|BD7B06  |09067B;
                       BNE CODE_09830F                      ;098305|D008    |09830F;
                       LDA.B #$00                           ;098307|A900    |      ;
                       STA.W $0790,X                        ;098309|9D9007  |090790;
                       JMP.W CODE_098279                    ;09830C|4C7982  |098279;
 
 
          CODE_09830F: LDA.B #$00                           ;09830F|A900    |      ;
                       STA.W $0669,X                        ;098311|9D6906  |090669;
                       JMP.W till790isZero                  ;098314|4C7482  |098274;
 
 
       UNREACH_098317: db $00,$20,$20,$20,$10,$20,$10,$20   ;098317|        |      ;
                       db $20,$20,$20,$20,$3C,$20,$20,$00   ;09831F|        |092020;
                       db $00,$40,$00,$00,$40,$40,$00,$40   ;098327|        |      ;
                       db $40,$40,$00,$00,$00,$40,$00,$00   ;09832F|        |      ;
                       db $00,$00,$00,$40,$00,$00,$00,$20   ;098337|        |      ;
                       db $00,$00,$00,$40,$00,$10,$00,$00   ;09833F|        |      ;
 
       UNREACH_098347: db $01,$02,$04,$08,$10,$20,$40,$80   ;098347|        |000002;
 
          CODE_09834F: JSR.W CODE_098481                    ;09834F|208184  |098481;
                       BEQ CODE_0983A7                      ;098352|F053    |0983A7;
                       LDA.W $0470,X                        ;098354|BD7004  |090470;
                       ORA.B #$20                           ;098357|0920    |      ;
                       STA.W $0470,X                        ;098359|9D7004  |090470;
                       DEC.W $0790,X                        ;09835C|DE9007  |090790;
                       BNE CODE_09837E                      ;09835F|D01D    |09837E;
                       LDA.W $0470,X                        ;098361|BD7004  |090470;
                       AND.B #$DF                           ;098364|29DF    |      ;
                       ORA.B #$40                           ;098366|0940    |      ;
                       STA.W $0470,X                        ;098368|9D7004  |090470;
                       JSR.W CODE_09848A                    ;09836B|208A84  |09848A;
                       LDY.B $00                            ;09836E|A400    |000000;
                       LDA.B #$FF                           ;098370|A9FF    |      ;
                       SEC                                  ;098372|38      |      ;
                       SBC.B $01                            ;098373|E501    |000001;
                       AND.W $00CC,Y                        ;098375|39CC00  |0900CC;
                       STA.W $00CC,Y                        ;098378|99CC00  |0900CC;
                       JMP.W CODE_0983A5                    ;09837B|4CA583  |0983A5;
 
 
          CODE_09837E: LDY.W $054E,X                        ;09837E|BC4E05  |09054E;
                       LDA.W UNREACH_09849D,Y               ;098381|B99D84  |09849D;
                       BEQ CODE_0983A5                      ;098384|F01F    |0983A5;
                       LDA.W $0790,X                        ;098386|BD9007  |090790;
                       AND.B #$03                           ;098389|2903    |      ;
                       BNE CODE_0983A5                      ;09838B|D018    |0983A5;
                       LDA.B #$02                           ;09838D|A902    |      ;
                       STA.B $00                            ;09838F|8500    |000000;
                       LDA.W $0790,X                        ;098391|BD9007  |090790;
                       AND.B #$04                           ;098394|2904    |      ;
                       BEQ CODE_09839C                      ;098396|F004    |09839C;
                       LDA.B #$FE                           ;098398|A9FE    |      ;
                       STA.B $00                            ;09839A|8500    |000000;
 
          CODE_09839C: LDA.W $0438,X                        ;09839C|BD3804  |090438;
                       CLC                                  ;09839F|18      |      ;
                       ADC.B $00                            ;0983A0|6500    |000000;
                       STA.W $0438,X                        ;0983A2|9D3804  |090438;
 
          CODE_0983A5: SEC                                  ;0983A5|38      |      ;
                       RTS                                  ;0983A6|60      |      ;
 
 
          CODE_0983A7: CLC                                  ;0983A7|18      |      ;
                       RTS                                  ;0983A8|60      |      ;
 
 
          CODE_0983A9: LDA.B #$11                           ;0983A9|A911    |      ;
                       BNE CODE_0983AF                      ;0983AB|D002    |0983AF;
 
          CODE_0983AD: LDA.B #$10                           ;0983AD|A910    |      ;
 
          CODE_0983AF: STA.B $02                            ;0983AF|8502    |000002;
                       LDX.B #$02                           ;0983B1|A202    |      ;
 
          CODE_0983B3: LDA.W $054E,X                        ;0983B3|BD4E05  |09054E;
                       CMP.B #$2D                           ;0983B6|C92D    |      ;
                       BNE CODE_0983C2                      ;0983B8|D008    |0983C2;
                       JSR.W CODE_09840D                    ;0983BA|200D84  |09840D;
                       INX                                  ;0983BD|E8      |      ;
                       CPX.B #$0D                           ;0983BE|E00D    |      ;
                       BNE CODE_0983B3                      ;0983C0|D0F1    |0983B3;
 
          CODE_0983C2: LDX.B r_entityID_processed           ;0983C2|A66C    |00006C;
                       RTS                                  ;0983C4|60      |      ;
 
 
          CODE_0983C5: LDA.W $054E,X                        ;0983C5|BD4E05  |09054E;
                       CMP.B #$08                           ;0983C8|C908    |      ;
                       BEQ CODE_0983D9                      ;0983CA|F00D    |0983D9;
                       CMP.B #$06                           ;0983CC|C906    |      ;
                       BEQ CODE_0983F8                      ;0983CE|F028    |0983F8;
                       CMP.B #$2D                           ;0983D0|C92D    |      ;
                       BEQ UNREACH_0983FD                   ;0983D2|F029    |0983FD;
                       JSR.W CODE_098412                    ;0983D4|201284  |098412;
                       SEC                                  ;0983D7|38      |      ;
                       RTS                                  ;0983D8|60      |      ;
 
 
          CODE_0983D9: LDA.W $0645,X                        ;0983D9|BD4506  |090645;
                       STA.B r_tempCurrRoomIdx              ;0983DC|850E    |00000E;
                       LDX.B #$01                           ;0983DE|A201    |      ;
 
          CODE_0983E0: LDA.W $054E,X                        ;0983E0|BD4E05  |09054E;
                       CMP.B #$08                           ;0983E3|C908    |      ;
                       BNE CODE_0983F1                      ;0983E5|D00A    |0983F1;
                       LDA.W $0645,X                        ;0983E7|BD4506  |090645;
                       CMP.B r_tempCurrRoomIdx              ;0983EA|C50E    |00000E;
                       BNE CODE_0983F1                      ;0983EC|D003    |0983F1;
                       JSR.W CODE_09840D                    ;0983EE|200D84  |09840D;
 
          CODE_0983F1: INX                                  ;0983F1|E8      |      ;
                       CPX.B #$0D                           ;0983F2|E00D    |      ;
                       BCC CODE_0983E0                      ;0983F4|90EA    |0983E0;
                       BCS UNREACH_098409                   ;0983F6|B011    |098409;
 
          CODE_0983F8: JSR.W CODE_0983A9                    ;0983F8|20A983  |0983A9;
                       db $C6,$02                           ;0983FB|        |000002;
 
       UNREACH_0983FD: db $A2,$01,$BD,$4E,$05,$C9,$06,$D0   ;0983FD|        |      ;
                       db $03,$20,$0D,$84                   ;098405|        |000020;
 
       UNREACH_098409: db $A6,$6C,$38                       ;098409|        |00006C;
 
       UNREACH_09840C: db $60                               ;09840C|        |      ;
 
          CODE_09840D: JSR.W CODE_098478                    ;09840D|207884  |098478;
                       BNE UNREACH_09840C                   ;098410|D0FA    |09840C;
 
          CODE_098412: LDA.B $01                            ;098412|A501    |000001;
                       ORA.W $00C4,Y                        ;098414|19C400  |0900C4;
                       STA.W $00C4,Y                        ;098417|99C400  |0900C4;
                       LDA.B $02                            ;09841A|A502    |000002;
                       STA.W $0790,X                        ;09841C|9D9007  |090790;
                       LDA.W $0454,X                        ;09841F|BD5404  |090454;
                       ORA.B #$04                           ;098422|0904    |      ;
                       STA.W $0454,X                        ;098424|9D5404  |090454;
                       LDA.W $0470,X                        ;098427|BD7004  |090470;
                       AND.B #$BF                           ;09842A|29BF    |      ;
                       ORA.B #$20                           ;09842C|0920    |      ;
                       STA.W $0470,X                        ;09842E|9D7004  |090470;
                       LDA.B #$00                           ;098431|A900    |      ;
                       STA.W $0669,X                        ;098433|9D6906  |090669;
                       RTS                                  ;098436|60      |      ;
 
 
          CODE_098437: LDY.W $054E,X                        ;098437|BC4E05  |09054E;
                       CPY.B #$2D                           ;09843A|C02D    |      ;
                       BEQ CODE_098442                      ;09843C|F004    |098442;
                       CPY.B #$10                           ;09843E|C010    |      ;
                       BCS CODE_098472                      ;098440|B030    |098472;
 
          CODE_098442: LDA.W UNREACH_0984AD,Y               ;098442|B9AD84  |0984AD;
                       STA.B $02                            ;098445|8502    |000002;
                       BEQ CODE_098472                      ;098447|F029    |098472;
                       JSR.W CODE_098478                    ;098449|207884  |098478;
                       BNE CODE_098472                      ;09844C|D024    |098472;
                       JSR.W CODE_098481                    ;09844E|208184  |098481;
                       BNE CODE_098472                      ;098451|D01F    |098472;
                       LDA.W $0669,X                        ;098453|BD6906  |090669;
                       AND.B #$F0                           ;098456|29F0    |      ;
                       BEQ CODE_098472                      ;098458|F018    |098472;
                       JSR.W CODE_09848A                    ;09845A|208A84  |09848A;
                       LDY.B $00                            ;09845D|A400    |000000;
                       ORA.W $00CC,Y                        ;09845F|19CC00  |0900CC;
                       STA.W $00CC,Y                        ;098462|99CC00  |0900CC;
                       LDA.B $02                            ;098465|A502    |000002;
                       STA.W $0790,X                        ;098467|9D9007  |090790;
                       LDA.W $0470,X                        ;09846A|BD7004  |090470;
                       AND.B #$BF                           ;09846D|29BF    |      ;
                       STA.W $0470,X                        ;09846F|9D7004  |090470;
 
          CODE_098472: LDA.B #$00                           ;098472|A900    |      ;
                       STA.W $0669,X                        ;098474|9D6906  |090669;
                       RTS                                  ;098477|60      |      ;
 
 
          CODE_098478: JSR.W CODE_09848A                    ;098478|208A84  |09848A;
                       LDY.B $00                            ;09847B|A400    |000000;
                       AND.W $00C4,Y                        ;09847D|39C400  |0900C4;
                       RTS                                  ;098480|60      |      ;
 
 
          CODE_098481: JSR.W CODE_09848A                    ;098481|208A84  |09848A;
                       LDY.B $00                            ;098484|A400    |000000;
                       AND.W $00CC,Y                        ;098486|39CC00  |0900CC;
                       RTS                                  ;098489|60      |      ;
 
 
          CODE_09848A: LDY.B #$00                           ;09848A|A000    |      ;
                       CPX.B #$08                           ;09848C|E008    |      ;
                       BCC CODE_098491                      ;09848E|9001    |098491;
                       INY                                  ;098490|C8      |      ;
 
          CODE_098491: STY.B $00                            ;098491|8400    |000000;
                       TXA                                  ;098493|8A      |      ;
                       AND.B #$07                           ;098494|2907    |      ;
                       TAY                                  ;098496|A8      |      ;
                       LDA.W UNREACH_098347,Y               ;098497|B94783  |098347;
                       STA.B $01                            ;09849A|8501    |000001;
                       RTS                                  ;09849C|60      |      ;
 
 
       UNREACH_09849D: db $00,$01,$01,$01,$00,$00,$00,$01   ;09849D|        |      ;
                       db $00,$01,$01,$00,$00,$00,$00,$00   ;0984A5|        |      ;
 
       UNREACH_0984AD: db $00,$08,$08,$08,$00,$00,$00,$08   ;0984AD|        |      ;
                       db $00,$04,$08,$00,$0C,$00,$08,$00   ;0984B5|        |      ;
 
       UNREACH_0984BD: db $C1                               ;0984BD|        |0000BB;
 
       UNREACH_0984BE: db $BB                               ;0984BE|        |      ;
 
       UNREACH_0984BF: db $BC,$4E,$05,$C0,$2D,$D0,$04,$A0   ;0984BF|        |09054E;
                       db $06,$D0,$06,$C0,$10,$90,$02,$18   ;0984C7|        |0000D0;
                       db $60,$B9,$9A,$85,$F0,$03,$4C,$55   ;0984CF|        |      ;
                       db $85,$BD,$70,$04,$29,$01,$F0,$74   ;0984D7|        |0000BD;
                       db $A8,$B9,$AE,$85,$F0,$6E,$A5,$32   ;0984DF|        |      ;
                       db $D9,$CE,$85,$F0,$06,$B9,$DE,$85   ;0984E7|        |0985CE;
                       db $4C,$F5,$84,$B9,$BE,$85,$F0,$0E   ;0984EF|        |0984F5;
                       db $C9,$FF,$F0,$58,$BD,$38,$04,$C9   ;0984F7|        |      ;
                       db $20,$90,$51,$4C,$0C,$85,$BD,$38   ;0984FF|        |095190;
                       db $04,$C9,$E0,$B0,$47,$A4,$C3,$B9   ;098507|        |0000C9;
                       db $C2,$07,$C9,$05,$90,$11,$C9,$0B   ;09850F|        |      ;
                       db $90,$08,$C9,$1B,$90,$09,$C9,$27   ;098517|        |098521;
                       db $B0,$05,$A9,$00,$99,$C8,$07,$A9   ;09851F|        |098526;
                       db $00,$85,$C1,$A0,$02,$20,$7F,$85   ;098527|        |      ;
                       db $A9,$80,$20,$2F,$E6,$A0,$00,$20   ;09852F|        |      ;
                       db $7F,$85,$A9,$80,$20,$2F,$E6,$A2   ;098537|        |80A985;
                       db $01,$BD,$4E,$05,$C9,$40,$B0,$03   ;09853F|        |0000BD;
                       db $20,$3A,$87,$E8,$E0,$0D,$D0,$F1   ;098547|        |09873A;
                       db $A6,$6C,$38,$60,$18,$60,$A5,$56   ;09854F|        |00006C;
                       db $D0,$FA,$C0,$06,$D0,$0A,$A5,$33   ;098557|        |098553;
                       db $C9,$02,$F0,$12,$A9,$00,$F0,$11   ;09855F|        |      ;
                       db $C0,$07,$D0,$0A,$A5,$32,$C9,$04   ;098567|        |      ;
                       db $F0,$04,$A9,$01,$D0,$03,$B9,$8A   ;09856F|        |098575;
                       db $85,$C5,$57,$F0,$D7,$4C,$0C,$85   ;098577|        |0000C5;
                       db $B9,$AA,$85,$85,$00,$B9,$AB,$85   ;09857F|        |0985AA;
                       db $85,$01,$60,$00,$00,$00,$00,$00   ;098587|        |000001;
                       db $01,$02,$02,$01,$00,$01,$00,$00   ;09858F|        |000002;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;098597|        |      ;
                       db $01,$01,$01,$01,$00,$01,$00,$00   ;09859F|        |000001;
                       db $00,$00,$00,$13,$80,$9E,$85,$00   ;0985A7|        |      ;
                       db $02,$01,$01,$02,$01,$01,$02,$01   ;0985AF|        |      ;
                       db $01,$01,$01,$01,$01,$00,$00,$00   ;0985B7|        |000001;
                       db $00,$00,$01,$FF,$00,$00,$00,$00   ;0985BF|        |      ;
                       db $00,$00,$01,$00,$01,$00,$00,$00   ;0985C7|        |      ;
                       db $00,$00,$00,$06,$00,$00,$04,$00   ;0985CF|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;0985D7|        |      ;
                       db $01,$00,$00,$00,$00,$00,$00,$00   ;0985DF|        |000000;
                       db $00,$00,$00,$00,$00,$00,$00       ;0985E7|        |      ;
 
          CODE_0985EE: LDA.W $0470,X                        ;0985EE|BD7004  |090470;
                       AND.B #$01                           ;0985F1|2901    |      ;
                       BNE CODE_0985FF                      ;0985F3|D00A    |0985FF;
                       LDA.W $0470,X                        ;0985F5|BD7004  |090470;
                       AND.B #$77                           ;0985F8|2977    |      ;
                       ORA.B #$40                           ;0985FA|0940    |      ;
                       JMP.W CODE_098604                    ;0985FC|4C0486  |098604;
 
 
          CODE_0985FF: LDA.W $0470,X                        ;0985FF|BD7004  |090470;
                       ORA.B #$88                           ;098602|0988    |      ;
 
          CODE_098604: STA.W $0470,X                        ;098604|9D7004  |090470;
                       RTS                                  ;098607|60      |      ;
 
                       LDA.B #$00                           ;098608|A900    |      ;
                       STA.B $17                            ;09860A|8517    |000017;
                       LDA.W $0438                          ;09860C|AD3804  |090438;
                       SEC                                  ;09860F|38      |      ;
                       SBC.W $0438,X                        ;098610|FD3804  |090438;
                       STA.B $00                            ;098613|8500    |000000;
                       BCS CODE_098624                      ;098615|B00D    |098624;
                       LDA.B #$01                           ;098617|A901    |      ;
                       STA.B $17                            ;098619|8517    |000017;
                       LDA.B $00                            ;09861B|A500    |000000;
                       EOR.B #$FF                           ;09861D|49FF    |      ;
                       CLC                                  ;09861F|18      |      ;
                       ADC.B #$01                           ;098620|6901    |      ;
                       STA.B $00                            ;098622|8500    |000000;
 
          CODE_098624: LDA.W $041C                          ;098624|AD1C04  |09041C;
                       SEC                                  ;098627|38      |      ;
                       SBC.W $041C,X                        ;098628|FD1C04  |09041C;
                       BCS CODE_098632                      ;09862B|B005    |098632;
                       EOR.B #$FF                           ;09862D|49FF    |      ;
                       CLC                                  ;09862F|18      |      ;
                       ADC.B #$01                           ;098630|6901    |      ;
 
          CODE_098632: CMP.B #$28                           ;098632|C928    |      ;
                       BCC CODE_098642                      ;098634|900C    |098642;
                       LDA.W $054E,X                        ;098636|BD4E05  |09054E;
                       CMP.B #$01                           ;098639|C901    |      ;
                       BNE CODE_098642                      ;09863B|D005    |098642;
                       LDA.W $04A8,X                        ;09863D|BDA804  |0904A8;
                       STA.B $17                            ;098640|8517    |000017;
 
          CODE_098642: RTS                                  ;098642|60      |      ;
 
                       LDA.B $17                            ;098643|A517    |000017;
                       STA.W $04A8,X                        ;098645|9DA804  |0904A8;
                       TAY                                  ;098648|A8      |      ;
                       LDA.W DATA8_09864D,Y                 ;098649|B94D86  |09864D;
                       RTS                                  ;09864C|60      |      ;
 
 
         DATA8_09864D: db $04,$0C                           ;09864D|        |      ;
 
setEnityAi_scriptInex: STA.B $00                            ;09864F|8500    |000000;
                       LDA.W $05EF,X                        ;098651|BDEF05  |0905EF;
                       AND.B #$80                           ;098654|2980    |      ;
                       ORA.B $00                            ;098656|0500    |000000;
                       STA.W $05EF,X                        ;098658|9DEF05  |0905EF;
                       LDA.B #$00                           ;09865B|A900    |      ;
                       STA.W $05C1,X                        ;09865D|9DC105  |0905C1;
 
 wiredRTS_returnPoint: RTS                                  ;098660|60      |      ;
 
                       STA.B $02                            ;098661|8502    |000002;
                       TXA                                  ;098663|8A      |      ;
                       PHA                                  ;098664|48      |      ;
                       LDA.B #$00                           ;098665|A900    |      ;
                       STA.B $01                            ;098667|8501    |000001;
                       STA.B $03                            ;098669|8503    |000003;
                       db $20                               ;09866B|        |      ;
                       dw CODE_0FE777                       ;09866C|        |0FE777;
                       PLA                                  ;09866E|68      |      ;
                       TAX                                  ;09866F|AA      |      ;
                       RTS                                  ;098670|60      |      ;
 
 
         PTR16_098671: dw CODE_099584                       ;098671|        |099584; enity script execution??
                       dw UNREACH_099619                    ;098673|        |099619;
                       dw UNREACH_099653                    ;098675|        |099653;
                       dw UNREACH_099571                    ;098677|        |099571;
                       dw UNREACH_099560                    ;098679|        |099560;
                       dw UNREACH_099707                    ;09867B|        |099707;
                       dw UNREACH_099710                    ;09867D|        |099710;
                       dw UNREACH_099779                    ;09867F|        |099779;
                       dw UNREACH_099831                    ;098681|        |099831;
                       dw UNREACH_09974A                    ;098683|        |09974A;
                       dw UNREACH_09972B                    ;098685|        |09972B;
                       dw UNREACH_099552                    ;098687|        |099552;
                       dw UNREACH_099517                    ;098689|        |099517;
                       dw UNREACH_099555                    ;09868B|        |099555;
                       dw UNREACH_0995E0                    ;09868D|        |0995E0;
                       dw UNREACH_099577                    ;09868F|        |099577;
                       dw UNREACH_0994F4                    ;098691|        |0994F4;
                       dw UNREACH_099473                    ;098693|        |099473;
                       dw UNREACH_09949D                    ;098695|        |09949D;
                       dw UNREACH_09945B                    ;098697|        |09945B;
                       dw UNREACH_099441                    ;098699|        |099441;
                       dw UNREACH_09944C                    ;09869B|        |09944C;
                       dw UNREACH_0993BA                    ;09869D|        |0993BA;
                       dw UNREACH_099401                    ;09869F|        |099401;
                       dw UNREACH_099653                    ;0986A1|        |099653;
                       dw UNREACH_099B00                    ;0986A3|        |099B00;
 
                       dw UNREACH_099BE4                    ;0986A5|        |099BE4;
                       dw UNREACH_09971F                    ;0986A7|        |09971F;
                       dw UNREACH_099569                    ;0986A9|        |099569;
                       dw UNREACH_09920C                    ;0986AB|        |09920C;
                       dw UNREACH_09934C                    ;0986AD|        |09934C;
                       dw UNREACH_099369                    ;0986AF|        |099369;
                       dw UNREACH_099E48                    ;0986B1|        |099E48;
                       dw CODE_09870A                       ;0986B3|        |09870A;
                       dw UNREACH_09995A                    ;0986B5|        |09995A;
                       dw UNREACH_099921                    ;0986B7|        |099921;
                       dw UNREACH_099921                    ;0986B9|        |099921;
                       dw UNREACH_099F00                    ;0986BB|        |099F00;
                       dw UNREACH_099F76                    ;0986BD|        |099F76;
                       dw UNREACH_099FC4                    ;0986BF|        |099FC4;
                       dw UNREACH_099FF7                    ;0986C1|        |099FF7;
                       dw UNREACH_09A009                    ;0986C3|        |09A009;
                       dw CODE_098707                       ;0986C5|        |098707;
                       dw UNREACH_099E40                    ;0986C7|        |099E40;
                       dw UNREACH_09A00C                    ;0986C9|        |09A00C;
                       dw UNREACH_09A082                    ;0986CB|        |09A082;
                       dw UNREACH_09A0EB                    ;0986CD|        |09A0EB;
                       dw UNREACH_09A0F5                    ;0986CF|        |09A0F5;
                       dw UNREACH_09A101                    ;0986D1|        |09A101;
                       dw UNREACH_09A126                    ;0986D3|        |09A126;
                       dw UNREACH_099DEF                    ;0986D5|        |099DEF;
                       dw UNREACH_099DD7                    ;0986D7|        |099DD7;
                       dw UNREACH_099DB9                    ;0986D9|        |099DB9;
                       dw UNREACH_099DA3                    ;0986DB|        |099DA3;
                       dw UNREACH_099DAE                    ;0986DD|        |099DAE;
                       dw UNREACH_099D96                    ;0986DF|        |099D96;
                       dw UNREACH_099D6A                    ;0986E1|        |099D6A;
                       dw UNREACH_099D5E                    ;0986E3|        |099D5E;
                       dw UNREACH_099D54                    ;0986E5|        |099D54;
                       dw UNREACH_099D2C                    ;0986E7|        |099D2C;
                       dw UNREACH_099D36                    ;0986E9|        |099D36;
                       dw UNREACH_099D40                    ;0986EB|        |099D40;
                       dw UNREACH_099D21                    ;0986ED|        |099D21;
                       dw UNREACH_099CC4                    ;0986EF|        |099CC4;
                       dw UNREACH_099D45                    ;0986F1|        |099D45;
                       dw UNREACH_099C5E                    ;0986F3|        |099C5E;
                       dw UNREACH_099961                    ;0986F5|        |099961;
                       dw UNREACH_099AF6                    ;0986F7|        |099AF6;
                       dw UNREACH_099653                    ;0986F9|        |099653;
                       dw UNREACH_099D78                    ;0986FB|        |099D78;
                       dw UNREACH_099C2C                    ;0986FD|        |099C2C;
                       dw UNREACH_099D45                    ;0986FF|        |099D45;
                       dw UNREACH_09A027                    ;098701|        |09A027;
                       dw UNREACH_099C04                    ;098703|        |099C04;
                       dw UNREACH_099C18                    ;098705|        |099C18;
 
          CODE_098707: INC.W r_entity_script_idx,X          ;098707|FEC105  |0005C1;
 
          CODE_09870A: RTS                                  ;09870A|60      |      ;
 
                       LDA.W $0606,X                        ;09870B|BD0606  |090606;
                       CMP.B #$02                           ;09870E|C902    |      ;
                       BCC CODE_098714                      ;098710|9002    |098714;
                       CLC                                  ;098712|18      |      ;
                       RTS                                  ;098713|60      |      ;
 
 
          CODE_098714: STX.B r_index                        ;098714|8610    |000010;
                       db $20                               ;098716|        |      ;
                       dw CODE_0FFEB9                       ;098717|        |0FFEB9;
                       BNE CODE_098736                      ;098719|D01B    |098736;
                       LDA.B #$00                           ;09871B|A900    |      ;
                       STA.W $0454,X                        ;09871D|9D5404  |090454;
                       LDA.B #$11                           ;098720|A911    |      ;
                       STA.W $054E,X                        ;098722|9D4E05  |09054E;
                       JSR.W CODE_098779                    ;098725|207987  |098779;
                       LDA.B #$04                           ;098728|A904    |      ;
                       STA.W $0565,X                        ;09872A|9D6505  |090565;
                       TXA                                  ;09872D|8A      |      ;
                       TAY                                  ;09872E|A8      |      ;
                       LDX.B r_index                        ;09872F|A610    |000010;
                       INC.W $0606,X                        ;098731|FE0606  |090606;
                       SEC                                  ;098734|38      |      ;
                       RTS                                  ;098735|60      |      ;
 
 
          CODE_098736: LDX.B r_index                        ;098736|A610    |000010;
                       CLC                                  ;098738|18      |      ;
                       RTS                                  ;098739|60      |      ;
 
 
          CODE_09873A: LDA.B #$00                           ;09873A|A900    |      ;
                       STA.W $054E,X                        ;09873C|9D4E05  |09054E;
                       STA.W $0400,X                        ;09873F|9D0004  |090400;
                       STA.W $048C,X                        ;098742|9D8C04  |09048C;
 
          CODE_098745: LDA.B #$00                           ;098745|A900    |      ;
                       STA.W $05D8,X                        ;098747|9DD805  |0905D8;
                       STA.W $05EF,X                        ;09874A|9DEF05  |0905EF;
                       STA.W $0606,X                        ;09874D|9D0606  |090606;
                       STA.W $061D,X                        ;098750|9D1D06  |09061D;
                       STA.W $0633,X                        ;098753|9D3306  |090633;
                       STA.W $0645,X                        ;098756|9D4506  |090645;
                       STA.W $0657,X                        ;098759|9D5706  |090657;
                       STA.W $0669,X                        ;09875C|9D6906  |090669;
                       STA.W $067B,X                        ;09875F|9D7B06  |09067B;
                       STA.W $068D,X                        ;098762|9D8D06  |09068D;
                       RTS                                  ;098765|60      |      ;
 
 
          CODE_098766: STA.B r_collisionPointYinScreen      ;098766|8511    |000011;
                       STX.B r_index                        ;098768|8610    |000010;
 
    someReturingPoint: db $20                               ;09876A|        |      ;
                       dw CODE_0FFEB9                       ;09876B|        |0FFEB9;
                       BNE CODE_098775                      ;09876D|D006    |098775;
                       JSR.W CODE_098779                    ;09876F|207987  |098779;
                       JMP.W CODE_0987D1                    ;098772|4CD187  |0987D1;
 
 
          CODE_098775: LDX.B r_index                        ;098775|A610    |000010;
                       CLC                                  ;098777|18      |      ;
                       RTS                                  ;098778|60      |      ;
 
 
          CODE_098779: JSR.W CODE_098745                    ;098779|204587  |098745;
                       LDY.B r_index                        ;09877C|A410    |000010;
                       LDA.W $0438,Y                        ;09877E|B93804  |090438;
                       STA.W $0438,X                        ;098781|9D3804  |090438;
                       LDA.B r_collisionPointYinScreen      ;098784|A511    |000011;
                       CMP.B #$29                           ;098786|C929    |      ;
                       BEQ CODE_09879D                      ;098788|F013    |09879D;
                       CMP.B #$18                           ;09878A|C918    |      ;
                       BEQ CODE_0987B1                      ;09878C|F023    |0987B1;
                       CMP.B #$1A                           ;09878E|C91A    |      ;
                       BEQ CODE_0987BB                      ;098790|F029    |0987BB;
                       CMP.B #$1B                           ;098792|C91B    |      ;
                       BEQ CODE_0987A7                      ;098794|F011    |0987A7;
 
          CODE_098796: LDA.W $041C,Y                        ;098796|B91C04  |09041C;
                       STA.W $041C,X                        ;098799|9D1C04  |09041C;
                       RTS                                  ;09879C|60      |      ;
 
 
          CODE_09879D: CLC                                  ;09879D|18      |      ;
                       LDA.W $041C,Y                        ;09879E|B91C04  |09041C;
                       ADC.B #$18                           ;0987A1|6918    |      ;
                       STA.W $041C,X                        ;0987A3|9D1C04  |09041C;
                       RTS                                  ;0987A6|60      |      ;
 
 
          CODE_0987A7: CLC                                  ;0987A7|18      |      ;
                       LDA.W $041C,Y                        ;0987A8|B91C04  |09041C;
                       ADC.B #$08                           ;0987AB|6908    |      ;
                       STA.W $041C,X                        ;0987AD|9D1C04  |09041C;
                       RTS                                  ;0987B0|60      |      ;
 
 
          CODE_0987B1: CLC                                  ;0987B1|18      |      ;
                       LDA.W $041C,Y                        ;0987B2|B91C04  |09041C;
                       ADC.B #$10                           ;0987B5|6910    |      ;
                       STA.W $041C,X                        ;0987B7|9D1C04  |09041C;
                       RTS                                  ;0987BA|60      |      ;
 
 
          CODE_0987BB: LDA.B r_stage                        ;0987BB|A532    |000032;
                       BEQ CODE_0987A7                      ;0987BD|F0E8    |0987A7;
                       CMP.B #$07                           ;0987BF|C907    |      ;
                       BEQ CODE_0987A7                      ;0987C1|F0E4    |0987A7;
                       BNE CODE_098796                      ;0987C3|D0D1    |098796;
                       STA.B r_collisionPointYinScreen      ;0987C5|8511    |000011;
                       STX.B r_index                        ;0987C7|8610    |000010;
                       JSR.W CODE_0987E5                    ;0987C9|20E587  |0987E5;
                       BNE CODE_0987E1                      ;0987CC|D013    |0987E1;
                       JSR.W CODE_098779                    ;0987CE|207987  |098779;
 
          CODE_0987D1: LDA.B #$00                           ;0987D1|A900    |      ;
                       STA.W $0454,X                        ;0987D3|9D5404  |090454;
                       TXA                                  ;0987D6|8A      |      ;
                       TAY                                  ;0987D7|A8      |      ;
                       LDA.B r_collisionPointYinScreen      ;0987D8|A511    |000011;
                       STA.W $054E,X                        ;0987DA|9D4E05  |09054E;
                       LDX.B r_index                        ;0987DD|A610    |000010;
                       SEC                                  ;0987DF|38      |      ;
                       RTS                                  ;0987E0|60      |      ;
 
 
          CODE_0987E1: LDX.B r_index                        ;0987E1|A610    |000010;
                       CLC                                  ;0987E3|18      |      ;
                       RTS                                  ;0987E4|60      |      ;
 
 
          CODE_0987E5: LDX.B #$01                           ;0987E5|A201    |      ;
 
          CODE_0987E7: LDA.W $054E,X                        ;0987E7|BD4E05  |09054E;
                       BEQ CODE_0987F3                      ;0987EA|F007    |0987F3;
                       INX                                  ;0987EC|E8      |      ;
                       CPX.B #$13                           ;0987ED|E013    |      ;
                       BNE CODE_0987E7                      ;0987EF|D0F6    |0987E7;
                       LDA.B #$01                           ;0987F1|A901    |      ;
 
          CODE_0987F3: RTS                                  ;0987F3|60      |      ;
 
 
          CODE_0987F4: STA.B r_pointerQueue                 ;0987F4|8508    |000008;
                       LDA.W $07F3                          ;0987F6|ADF307  |0907F3;
                       BNE CODE_098829                      ;0987F9|D02E    |098829;
                       LDA.W $067B,X                        ;0987FB|BD7B06  |09067B;
                       BEQ CODE_098803                      ;0987FE|F003    |098803;
                       JMP.W clc_rts                        ;098800|4CCB88  |0988CB;
 
 
          CODE_098803: LDA.B r_stage                        ;098803|A532    |000032;
                       CMP.B #$0E                           ;098805|C90E    |      ;
                       BNE CODE_098814                      ;098807|D00B    |098814;
                       LDA.W $07EC                          ;098809|ADEC07  |0907EC;
                       CMP.B #$02                           ;09880C|C902    |      ;
                       BNE CODE_098814                      ;09880E|D004    |098814;
                       LDA.B #$7C                           ;098810|A97C    |      ;
                       BNE DATA8_098816                     ;098812|D002    |098816;
 
          CODE_098814: LDA.B #$7B                           ;098814|A97B    |      ;
 
         DATA8_098816: db $20                               ;098816|        |      ;
                       dw initFreezWaterEffect_01           ;098817|        |0FE25F;
                       LDA.B #$01                           ;098819|A901    |      ;
                       STA.W $07F3                          ;09881B|8DF307  |0907F3;
                       LDA.B #$00                           ;09881E|A900    |      ;
                       STA.W $0657,X                        ;098820|9D5706  |090657;
                       STA.W $05EF,X                        ;098823|9DEF05  |0905EF;
                       db $4C                               ;098826|        |      ;
 
                       dw UNREACH_0FFEC8                    ;098827|        |0FFEC8;
 
          CODE_098829: LDA.W $07F3                          ;098829|ADF307  |0907F3;
                       CMP.B #$02                           ;09882C|C902    |      ;
                       BEQ CODE_098833                      ;09882E|F003    |098833;
                       JMP.W sec_rts                        ;098830|4CC988  |0988C9;
 
 
          CODE_098833: LDA.B r_stage                        ;098833|A532    |000032;
                       CMP.B #$0A                           ;098835|C90A    |      ;
                       BNE CODE_098842                      ;098837|D009    |098842;
                       LDA.B r_blockLevel                   ;098839|A533    |000033;
                       CMP.B #$03                           ;09883B|C903    |      ;
                       BNE CODE_098842                      ;09883D|D003    |098842;
                       JMP.W CODE_0988CD                    ;09883F|4CCD88  |0988CD;
 
 
          CODE_098842: LDA.B r_stage                        ;098842|A532    |000032;
                       CMP.B #$03                           ;098844|C903    |      ;
                       BNE CODE_098877                      ;098846|D02F    |098877;
                       LDA.B r_blockLevel                   ;098848|A533    |000033;
                       CMP.B #$02                           ;09884A|C902    |      ;
                       BNE CODE_098877                      ;09884C|D029    |098877;
                       LDA.B #$74                           ;09884E|A974    |      ;
                       JSR.W CODE_098766                    ;098850|206687  |098766;
                       LDA.B #$B0                           ;098853|A9B0    |      ;
                       STA.W $0438,Y                        ;098855|993804  |090438;
                       STA.W $041C,Y                        ;098858|991C04  |09041C;
                       LDA.B #$A8                           ;09885B|A9A8    |      ;
                       STA.W $0470,Y                        ;09885D|997004  |090470;
                       LDA.B #$00                           ;098860|A900    |      ;
                       STA.W $05EF,Y                        ;098862|99EF05  |0905EF;
                       LDA.B #$02                           ;098865|A902    |      ;
                       STA.W $0400,Y                        ;098867|990004  |090400;
                       LDA.B #$0E                           ;09886A|A90E    |      ;
                       STA.W $0657,Y                        ;09886C|995706  |090657;
                       LDA.B #$03                           ;09886F|A903    |      ;
                       STA.W $07F3                          ;098871|8DF307  |0907F3;
                       JMP.W CODE_0987F4                    ;098874|4CF487  |0987F4;
 
 
          CODE_098877: LDA.B #$16                           ;098877|A916    |      ;
                       JSR.W CODE_098766                    ;098879|206687  |098766;
                       BCC clc_rts                          ;09887C|904D    |0988CB;
                       LDA.B #$03                           ;09887E|A903    |      ;
                       STA.W $07F3                          ;098880|8DF307  |0907F3;
                       LDA.B #$63                           ;098883|A963    |      ;
                       STA.W $05EF,Y                        ;098885|99EF05  |0905EF;
                       LDA.B #$80                           ;098888|A980    |      ;
                       STA.W $0438,Y                        ;09888A|993804  |090438;
                       STA.W $041C,Y                        ;09888D|991C04  |09041C;
                       LDA.B r_stage                        ;098890|A532    |000032;
                       CMP.B #$08                           ;098892|C908    |      ;
                       BNE CODE_0988A6                      ;098894|D010    |0988A6;
                       LDA.B r_blockLevel                   ;098896|A533    |000033;
                       CMP.B #$02                           ;098898|C902    |      ;
                       BEQ CODE_0988A6                      ;09889A|F00A    |0988A6;
                       LDA.B #$60                           ;09889C|A960    |      ;
                       STA.W $041C,Y                        ;09889E|991C04  |09041C;
                       LDA.B #$90                           ;0988A1|A990    |      ;
                       STA.W $0438,Y                        ;0988A3|993804  |090438;
 
          CODE_0988A6: LDA.B #$48                           ;0988A6|A948    |      ;
                       db $20                               ;0988A8|        |      ;
                       dw initFreezWaterEffect_01           ;0988A9|        |0FE25F;
                       db $20                               ;0988AB|        |      ;
                       dw setAutoPlayFlag                   ;0988AC|        |0FE5CE;
                       LDA.B #$00                           ;0988AE|A900    |      ;
                       STA.W $05C1,Y                        ;0988B0|99C105  |0905C1;
                       db $20                               ;0988B3|        |      ;
                       dw UNREACH_0FFEC8                    ;0988B4|        |0FFEC8;
                       STA.W $05EF,X                        ;0988B6|9DEF05  |0905EF;
                       STA.W $0657,X                        ;0988B9|9D5706  |090657;
                       LDA.B r_pointerQueue                 ;0988BC|A508    |000008;
                       BNE sec_rts                          ;0988BE|D009    |0988C9;
                       STA.W $054E,X                        ;0988C0|9D4E05  |09054E;
                       STA.W $0470,X                        ;0988C3|9D7004  |090470;
                       STA.W $0400,X                        ;0988C6|9D0004  |090400;
 
              sec_rts: SEC                                  ;0988C9|38      |      ;
                       RTS                                  ;0988CA|60      |      ;
 
 
              clc_rts: CLC                                  ;0988CB|18      |      ;
                       RTS                                  ;0988CC|60      |      ;
 
 
          CODE_0988CD: LDA.B #$73                           ;0988CD|A973    |      ;
                       JSR.W CODE_098766                    ;0988CF|206687  |098766;
                       db $A9,$D0,$99,$38,$04,$A9,$B0,$99   ;0988D2|        |      ;
                       db $1C,$04,$4C,$5B,$88,$98,$85,$00   ;0988DA|        |094C04;
                       db $BD,$69,$06,$29,$F0,$F0,$1B,$A5   ;0988E2|        |090669;
                       db $32,$C9,$0E,$D0,$0B,$AD,$EC,$07   ;0988EA|        |0000C9;
                       db $C9,$02,$D0,$04,$A9,$47,$D0,$02   ;0988F2|        |      ;
                       db $A9,$2B,$20,$5F,$E2,$20,$22,$89   ;0988FA|        |      ;
                       db $85,$3D,$60                       ;098902|        |00003D;
 
       UNREACH_098905: db $85,$00,$BD,$69,$06,$29,$F0       ;098905|        |000000;
                       BEQ CODE_098921                      ;09890C|F013    |098921;
                       LDA.B #$2B                           ;09890E|A92B    |      ;
                       db $20                               ;098910|        |      ;
                       dw initFreezWaterEffect_01           ;098911|        |0FE25F;
                       JSR.W CODE_098922                    ;098913|202289  |098922;
                       LDA.B r_HUD_healthBoss               ;098916|A53D    |00003D;
                       SEC                                  ;098918|38      |      ;
                       SBC.B $00                            ;098919|E500    |000000;
                       BCS CODE_09891F                      ;09891B|B002    |09891F;
                       LDA.B #$00                           ;09891D|A900    |      ;
 
          CODE_09891F: STA.B r_HUD_healthBoss               ;09891F|853D    |00003D;
 
          CODE_098921: RTS                                  ;098921|60      |      ;
 
 
          CODE_098922: LDA.W $0669,X                        ;098922|BD6906  |090669;
                       CLC                                  ;098925|18      |      ;
                       ADC.B #$10                           ;098926|6910    |      ;
                       LSR A                                ;098928|4A      |      ;
                       LSR A                                ;098929|4A      |      ;
                       AND.B #$F8                           ;09892A|29F8    |      ;
                       CLC                                  ;09892C|18      |      ;
                       ADC.B $00                            ;09892D|6500    |000000;
                       TAY                                  ;09892F|A8      |      ;
                       LDA.W bossHealth,Y                   ;098930|B95389  |098953;
                       STA.B $00                            ;098933|8500    |000000;
                       LDA.W $067B,X                        ;098935|BD7B06  |09067B;
                       SEC                                  ;098938|38      |      ;
                       SBC.B $00                            ;098939|E500    |000000;
                       BCS CODE_09894F                      ;09893B|B012    |09894F;
                       CLC                                  ;09893D|18      |      ;
                       ADC.B $00                            ;09893E|6500    |000000;
                       STA.B $00                            ;098940|8500    |000000;
                       LDA.W $067B,X                        ;098942|BD7B06  |09067B;
                       BNE CODE_09894D                      ;098945|D006    |09894D;
                       LDA.B #$00                           ;098947|A900    |      ;
                       STA.B $00                            ;098949|8500    |000000;
                       BEQ CODE_09894F                      ;09894B|F002    |09894F;
 
          CODE_09894D: LDA.B #$00                           ;09894D|A900    |      ;
 
          CODE_09894F: STA.W r_entity_Health,X              ;09894F|9D7B06  |00067B;
                       RTS                                  ;098952|60      |      ;
 
 
           bossHealth: db $00,$00,$00,$00,$00,$00,$00,$00   ;098953|        |      ; boss HP
                       db $04,$03,$03,$02,$01,$01,$00,$00   ;09895B|        |      ;
                       db $06,$05,$04,$03,$02,$01,$00,$00   ;098963|        |      ;
                       db $08,$07,$06,$04,$03,$02,$00,$00   ;09896B|        |      ;
                       db $0A,$09,$08,$05,$04,$02,$00,$00   ;098973|        |      ;
                       db $0C,$0B,$0A,$06,$05,$03,$00,$00   ;09897B|        |      ;
                       db $0E,$0D,$0C,$08,$06,$04,$00,$00   ;098983|        |      ;
 
                       LDA.W $05EF,X                        ;09898B|BDEF05  |0905EF;
                       AND.B #$7F                           ;09898E|297F    |      ;
                       CMP.B #$5C                           ;098990|C95C    |      ;
                       BEQ CODE_0989C8                      ;098992|F034    |0989C8;
                       LDA.B #$00                           ;098994|A900    |      ;
                       STA.W $0454,X                        ;098996|9D5404  |090454;
                       LDA.B #$40                           ;098999|A940    |      ;
                       STA.W $0470,X                        ;09899B|9D7004  |090470;
                       LDA.W $041C,X                        ;09899E|BD1C04  |09041C;
                       CLC                                  ;0989A1|18      |      ;
                       ADC.B #$10                           ;0989A2|6910    |      ;
                       STA.W $041C,X                        ;0989A4|9D1C04  |09041C;
                       LDA.B #$0E                           ;0989A7|A90E    |      ;
                       LDY.B #$08                           ;0989A9|A008    |      ;
                       db $20                               ;0989AB|        |      ;
                       dw CODE_0FEF5C                       ;0989AC|        |0FEF5C;
                       LDA.B #$DC                           ;0989AE|A9DC    |      ;
                       JMP.W setEnityAi_scriptInex          ;0989B0|4C4F86  |09864F;
 
                       LDA.W $05EF,X                        ;0989B3|BDEF05  |0905EF;
                       AND.B #$7F                           ;0989B6|297F    |      ;
                       CMP.B #$30                           ;0989B8|C930    |      ;
                       BEQ CODE_0989C8                      ;0989BA|F00C    |0989C8;
                       LDA.B #$0E                           ;0989BC|A90E    |      ;
                       LDY.B #$08                           ;0989BE|A008    |      ;
                       db $20                               ;0989C0|        |      ;
                       dw CODE_0FEF5C                       ;0989C1|        |0FEF5C;
                       LDA.B #$30                           ;0989C3|A930    |      ;
                       JMP.W setEnityAi_scriptInex          ;0989C5|4C4F86  |09864F;
 
 
          CODE_0989C8: LDA.W $05C1,X                        ;0989C8|BDC105  |0905C1;
                       CMP.B #$0D                           ;0989CB|C90D    |      ;
                       BNE CODE_0989EE                      ;0989CD|D01F    |0989EE;
                       LDA.B r_stage                        ;0989CF|A532    |000032;
                       CMP.B #$0A                           ;0989D1|C90A    |      ;
                       BEQ CODE_0989E3                      ;0989D3|F00E    |0989E3;
                       CMP.B #$0B                           ;0989D5|C90B    |      ;
                       BEQ CODE_0989E3                      ;0989D7|F00A    |0989E3;
                       CMP.B #$03                           ;0989D9|C903    |      ;
                       BNE CODE_0989EE                      ;0989DB|D011    |0989EE;
                       LDA.B r_blockLevel                   ;0989DD|A533    |000033;
                       CMP.B #$04                           ;0989DF|C904    |      ;
                       BNE CODE_0989EE                      ;0989E1|D00B    |0989EE;
 
          CODE_0989E3: JMP.W CODE_09873A                    ;0989E3|4C3A87  |09873A;
 
                       LDA.W $05EF,X                        ;0989E6|BDEF05  |0905EF;
                       AND.B #$80                           ;0989E9|2980    |      ;
                       STA.W $05EF,X                        ;0989EB|9DEF05  |0905EF;
 
          CODE_0989EE: RTS                                  ;0989EE|60      |      ;
 
 
       UNREACH_0989EF: db $BB                               ;0989EF|        |      ;
 
       UNREACH_0989F0: db $8A,$BD,$8A,$D5,$8A,$E1,$8A,$EB   ;0989F0|        |      ;
                       db $8A,$F3,$8A,$FD,$8A,$03,$8B,$0B   ;0989F8|        |      ;
                       db $8B,$11,$8B,$17,$8B,$2B,$8B,$31   ;098A00|        |      ;
                       db $8B,$37,$8B,$3D,$8B,$7B,$8B,$71   ;098A08|        |      ;
                       db $8B,$4B,$8B,$8D,$8B,$AD,$8B,$9B   ;098A10|        |      ;
                       db $8B,$A7,$8B,$AF,$8B,$B9,$8B,$BF   ;098A18|        |      ;
                       db $8B,$CD,$8B,$DB,$8B,$E5,$8B,$ED   ;098A20|        |      ;
                       db $8B,$05,$8C,$0B,$8C,$15,$8C,$1F   ;098A28|        |      ;
                       db $8C,$33,$8C,$39,$8C,$3B,$8C,$4D   ;098A30|        |098C33;
                       db $8C,$69,$8C,$5B,$8C,$89,$8C,$97   ;098A38|        |098C69;
                       db $8C,$B5,$8C,$CD,$8C,$E5,$8C,$EB   ;098A40|        |098CB5;
                       db $8C,$03,$8D,$1B,$8D,$21,$8D,$69   ;098A48|        |098D03;
                       db $8D,$85,$8D,$A1,$8D,$AD,$8D,$B5   ;098A50|        |098D85;
                       db $8D,$BB,$8D,$C1,$8D,$C7,$8D,$EB   ;098A58|        |098DBB;
                       db $8D,$09,$8E,$0F,$8E,$21,$8E,$2B   ;098A60|        |098E09;
                       db $8E,$33,$8E,$49,$8E,$57,$8E,$5D   ;098A68|        |098E33;
                       db $8E,$63,$8E,$77,$8E,$89,$8E,$8F   ;098A70|        |098E63;
                       db $8E,$A1,$8E,$AB,$8E,$B1,$8E,$B7   ;098A78|        |098EA1;
                       db $8E,$BD,$8E,$D7,$8E,$F5,$8E,$FB   ;098A80|        |098EBD;
                       db $8E,$27,$8F,$F5,$8E,$4F,$8F,$53   ;098A88|        |098F27;
                       db $8F,$57,$8F,$67,$8F,$83,$8F,$D3   ;098A90|        |678F57;
                       db $8F,$11,$90,$B7,$8B,$15,$90,$2D   ;098A98|        |B79011;
                       db $90,$31,$90,$49,$90,$37,$8D,$4D   ;098AA0|        |098AD3;
                       db $8D,$4D,$90,$5B,$90,$5F,$90,$7B   ;098AA8|        |09904D;
                       db $90,$95,$90,$95,$90,$A1,$90,$53   ;098AB0|        |098A47;
                       db $8E,$BB,$8A,$4A,$01,$0B,$0F,$05   ;098AB8|        |098ABB;
                       db $01,$0C,$02,$0D,$0F,$05,$01,$0C   ;098AC0|        |00000C;
                       db $02,$0D,$0F,$05,$01,$0C,$02,$0D   ;098AC8|        |      ;
                       db $0F,$05,$01,$1C,$01,$01,$03,$02   ;098AD0|        |1C0105;
                       db $03,$28,$67,$0B,$0F,$05,$01,$04   ;098AD8|        |000028;
                       db $01,$00,$04,$05,$01,$06,$01,$00   ;098AE0|        |000000;
                       db $04,$07,$05,$08,$06,$05,$01,$06   ;098AE8|        |000007;
                       db $01,$03,$01,$00,$04,$05,$01,$06   ;098AF0|        |000003;
                       db $01,$00,$04,$09,$07,$08,$08,$05   ;098AF8|        |000000;
                       db $01,$04,$01,$41,$09,$42,$22,$05   ;098B00|        |000004;
                       db $01,$03,$01,$0E,$01,$02,$0A,$04   ;098B08|        |000003;
                       db $01,$0B,$0B,$05,$01,$04,$01,$0B   ;098B10|        |00000B;
                       db $0D,$05,$01,$0C,$01,$0D,$00,$05   ;098B18|        |090105;
                       db $01,$0C,$0B,$0D,$0E,$05,$01,$0C   ;098B20|        |00000C;
                       db $6D,$04,$01,$01,$04,$02,$04,$04   ;098B28|        |090104;
                       db $01,$0F,$10,$05,$01,$04,$01,$00   ;098B30|        |00000F;
                       db $11,$05,$01,$03,$01,$0B,$76,$05   ;098B38|        |000005;
                       db $01,$3A,$13,$0C,$01,$0D,$14,$05   ;098B40|        |00003A;
                       db $01,$04,$01,$0B,$15,$3F,$16,$0B   ;098B48|        |000004;
                       db $15,$39,$01,$05,$01,$3E,$01,$0D   ;098B50|        |000039;
                       db $17,$05,$01,$3C,$15,$39,$01,$3B   ;098B58|        |000005;
                       db $15,$0D,$0D,$05,$01,$3E,$01,$0D   ;098B60|        |00000D;
                       db $15,$05,$01,$3D,$18,$3B,$01,$04   ;098B68|        |000005;
                       db $01,$0B,$19,$05,$01,$00,$1A,$05   ;098B70|        |00000B;
                       db $01,$40,$1B,$0D,$19,$05,$01,$3F   ;098B78|        |000040;
                       db $1C,$11,$01,$12,$15,$3F,$16,$0B   ;098B80|        |090111;
                       db $0D,$05,$01,$04,$01,$17,$1D,$16   ;098B88|        |090105;
                       db $01,$05,$01,$17,$1E,$16,$0B,$05   ;098B90|        |000005;
                       db $01,$03,$01,$0B,$0F,$05,$01,$14   ;098B98|        |000003;
                       db $01,$01,$1F,$02,$1F,$04,$01,$0E   ;098BA0|        |000001;
                       db $01,$02,$0A,$04,$01,$15,$20,$0B   ;098BA8|        |000002;
                       db $0B,$05,$01,$00,$21,$21,$01,$05   ;098BB0|        |      ;
                       db $01,$0E,$01,$18,$03,$21,$01,$19   ;098BB8|        |00000E;
                       db $17,$08,$22,$05,$01,$03,$01,$08   ;098BC0|        |000008;
                       db $22,$05,$01,$1C,$01,$1A,$17,$08   ;098BC8|        |1C0105;
                       db $22,$05,$01,$03,$01,$08,$23,$05   ;098BD0|        |030105;
                       db $01,$1C,$01,$1D,$17,$08,$22,$05   ;098BD8|        |00001C;
                       db $01,$03,$01,$1E,$24,$1F,$17,$08   ;098BE0|        |000003;
                       db $22,$05,$01,$03,$01,$0B,$0F,$05   ;098BE8|        |030105;
                       db $01,$0C,$01,$0D,$0F,$05,$01,$0C   ;098BF0|        |00000C;
                       db $01,$0D,$0E,$05,$01,$20,$25,$0D   ;098BF8|        |00000D;
                       db $0E,$05,$01,$04,$01,$08,$6E,$05   ;098C00|        |090105;
                       db $01,$03,$01,$1D,$26,$08,$22,$05   ;098C08|        |000003;
                       db $01,$03,$01,$1E,$24,$1D,$26,$08   ;098C10|        |000003;
                       db $22,$05,$01,$03,$01,$04,$01,$0B   ;098C18|        |030105;
                       db $17,$05,$01,$0C,$01,$0D,$17,$05   ;098C20|        |000005;
                       db $01,$0C,$01,$0D,$27,$05,$01,$0C   ;098C28|        |00000C;
                       db $01,$04,$01,$0E,$01,$18,$0A,$15   ;098C30|        |000004;
                       db $28,$21,$01,$0B,$0F,$05,$01,$0C   ;098C38|        |      ;
                       db $01,$0D,$0F,$05,$01,$0C,$01,$0D   ;098C40|        |00000D;
                       db $0F,$05,$01,$15,$28,$1A,$29,$23   ;098C48|        |150105;
                       db $2A,$05,$01,$03,$01,$24,$2A,$05   ;098C50|        |      ;
                       db $01,$1C,$01,$19,$29,$23,$22,$05   ;098C58|        |00001C;
                       db $01,$03,$01,$23,$22,$05,$01,$1C   ;098C60|        |000003;
                       db $01,$0B,$2B,$05,$01,$0C,$01,$0D   ;098C68|        |00000B;
                       db $2B,$05,$01,$0C,$01,$0D,$2B,$05   ;098C70|        |      ;
                       db $01,$0C,$01,$0D,$2B,$05,$01,$0C   ;098C78|        |00000C;
                       db $01,$0D,$2B,$05,$01,$0C,$01,$04   ;098C80|        |00000D;
                       db $01,$0B,$2C,$25,$01,$05,$01,$0C   ;098C88|        |00000B;
                       db $01,$0D,$0F,$05,$01,$04,$01,$0B   ;098C90|        |00000D;
                       db $0F,$05,$01,$0C,$01,$0D,$0F,$05   ;098C98|        |0C0105;
                       db $01,$0C,$01,$3A,$2D,$0D,$0F,$05   ;098CA0|        |00000C;
                       db $01,$0D,$12,$26,$01,$20,$2E,$0D   ;098CA8|        |00000D;
                       db $12,$26,$01,$04,$01,$0B,$0B,$05   ;098CB0|        |000026;
                       db $01,$0C,$01,$3A,$2D,$0D,$2B,$05   ;098CB8|        |00000C;
                       db $01,$0D,$12,$26,$0D,$20,$2F,$0D   ;098CC0|        |00000D;
                       db $12,$26,$0D,$04,$01,$0B,$0B,$05   ;098CC8|        |000026;
                       db $01,$0C,$0F,$0D,$0B,$05,$01,$0C   ;098CD0|        |00000C;
                       db $0F,$0D,$0B,$05,$01,$0C,$0F,$0D   ;098CD8|        |050B0D;
                       db $0B,$05,$01,$1C,$01,$0B,$0B,$05   ;098CE0|        |      ;
                       db $01,$04,$01,$2A,$0D,$2A,$0D,$2A   ;098CE8|        |000004;
                       db $0D,$0E,$30,$18,$0A,$28,$31,$0B   ;098CF0|        |09300E;
                       db $0F,$05,$01,$0C,$01,$0D,$0F,$05   ;098CF8|        |0C0105;
                       db $01,$29,$01,$27,$01,$05,$01,$2B   ;098D00|        |000029;
                       db $01,$0E,$32,$18,$0A,$28,$31,$0B   ;098D08|        |00000E;
                       db $0F,$05,$01,$0C,$01,$0D,$0F,$05   ;098D10|        |0C0105;
                       db $01,$29,$01,$0B,$19,$05,$01,$04   ;098D18|        |000029;
                       db $01,$0B,$14,$05,$01,$20,$33,$0D   ;098D20|        |00000B;
                       db $14,$05,$01,$0C,$01,$2E,$0F,$00   ;098D28|        |000005;
                       db $34,$2C,$01,$05,$01,$29,$01,$0B   ;098D30|        |00002C;
                       db $14,$05,$01,$20,$35,$0D,$14,$05   ;098D38|        |000005;
                       db $01,$0C,$01,$2E,$0F,$00,$34,$2C   ;098D40|        |00000C;
                       db $01,$05,$01,$29,$01,$48,$36,$05   ;098D48|        |000005;
                       db $01,$48,$37,$05,$01,$48,$38,$05   ;098D50|        |000048;
                       db $01,$0B,$39,$05,$01,$2F,$01,$05   ;098D58|        |00000B;
                       db $01,$30,$01,$0D,$0B,$05,$01,$31   ;098D60|        |000030;
                       db $01,$2D,$36,$05,$01,$2D,$37,$05   ;098D68|        |00002D;
                       db $01,$2D,$38,$05,$01,$0B,$39,$05   ;098D70|        |00002D;
                       db $01,$2F,$01,$05,$01,$30,$01,$0D   ;098D78|        |00002F;
                       db $0B,$05,$01,$31,$01,$0B,$0F,$05   ;098D80|        |      ;
                       db $01,$0C,$01,$0D,$0F,$05,$01,$0C   ;098D88|        |00000C;
                       db $01,$0D,$12,$05,$01,$0B,$14,$05   ;098D90|        |00000D;
                       db $01,$20,$33,$0D,$0B,$05,$01,$29   ;098D98|        |000020;
                       db $01,$0B,$0F,$05,$01,$28,$3A,$0D   ;098DA0|        |00000B;
                       db $14,$05,$01,$29,$01,$32,$01,$22   ;098DA8|        |000005;
                       db $3B,$05,$01,$29,$01,$0E,$32,$18   ;098DB0|        |      ;
                       db $0A,$29,$01,$0E,$32,$18,$0A,$15   ;098DB8|        |      ;
                       db $3C,$0E,$32,$18,$0A,$15,$3C,$33   ;098DC0|        |09320E;
                       db $3D,$28,$3E,$0B,$2B,$05,$01,$0C   ;098DC8|        |093E28;
                       db $01,$0D,$2B,$05,$01,$0C,$01,$0D   ;098DD0|        |00000D;
                       db $2B,$05,$01,$0C,$01,$0D,$2B,$05   ;098DD8|        |      ;
                       db $01,$0C,$01,$0D,$2B,$05,$01,$0C   ;098DE0|        |00000C;
                       db $01,$21,$01,$0B,$12,$05,$01,$0C   ;098DE8|        |000021;
                       db $01,$0D,$00,$05,$01,$0C,$01,$0D   ;098DF0|        |00000D;
                       db $00,$05,$01,$0C,$01,$0D,$00,$05   ;098DF8|        |      ;
                       db $01,$0C,$3F,$0D,$17,$05,$01,$21   ;098E00|        |00000C;
                       db $01,$0B,$14,$05,$01,$04,$01,$0B   ;098E08|        |00000B;
                       db $0B,$05,$01,$0C,$01,$0D,$0F,$05   ;098E10|        |      ;
                       db $01,$0C,$01,$0D,$0B,$05,$01,$04   ;098E18|        |00000C;
                       db $01,$0B,$12,$05,$01,$00,$40,$05   ;098E20|        |00000B;
                       db $01,$04,$01,$00,$41,$05,$01,$38   ;098E28|        |000004;
                       db $01,$03,$01,$05,$01,$22,$72,$0D   ;098E30|        |000003;
                       db $0B,$05,$01,$0C,$01,$0D,$0B,$05   ;098E38|        |      ;
                       db $01,$0C,$01,$0D,$0F,$05,$01,$21   ;098E40|        |00000C;
                       db $01,$0B,$42,$05,$01,$3A,$43,$22   ;098E48|        |00000B;
                       db $6F,$21,$01,$22,$23,$49,$0B,$00   ;098E50|        |220121;
                       db $44,$05,$01,$04,$01,$00,$45,$05   ;098E58|        |      ;
                       db $01,$04,$01,$35,$01,$34,$0E,$0D   ;098E60|        |000004;
                       db $0B,$05,$01,$0C,$01,$0D,$0F,$05   ;098E68|        |      ;
                       db $01,$36,$01,$28,$46,$15,$14,$35   ;098E70|        |000036;
                       db $01,$0D,$12,$05,$01,$34,$47,$0D   ;098E78|        |00000D;
                       db $0F,$05,$01,$36,$01,$28,$48,$15   ;098E80|        |360105;
                       db $20,$0E,$49,$02,$0A,$04,$01,$0B   ;098E88|        |09490E;
                       db $14,$05,$01,$0C,$01,$0D,$0F,$05   ;098E90|        |000005;
                       db $01,$0C,$01,$0D,$0F,$05,$01,$21   ;098E98|        |00000C;
                       db $01,$05,$01,$39,$01,$08,$4A,$05   ;098EA0|        |000005;
                       db $01,$21,$01,$0D,$0C,$05,$01,$21   ;098EA8|        |000021;
                       db $01,$22,$2A,$05,$01,$21,$01,$0B   ;098EB0|        |000022;
                       db $12,$05,$01,$21,$01,$43,$4B,$23   ;098EB8|        |000005;
                       db $22,$05,$01,$03,$01,$23,$4A,$05   ;098EC0|        |030105;
                       db $01,$43,$4C,$23,$22,$05,$01,$47   ;098EC8|        |000043;
                       db $4D,$23,$22,$05,$01,$47,$4E,$0B   ;098ED0|        |092223;
                       db $0F,$05,$01,$0C,$01,$0D,$0F,$05   ;098ED8|        |0C0105;
                       db $01,$0C,$01,$0D,$0F,$05,$01,$0C   ;098EE0|        |00000C;
                       db $01,$0D,$0F,$05,$01,$0C,$01,$0D   ;098EE8|        |00000D;
                       db $0F,$05,$01,$04,$01,$0B,$12,$05   ;098EF0|        |040105;
                       db $01,$04,$01,$0B,$0F,$05,$01,$0C   ;098EF8|        |000004;
                       db $01,$0D,$0F,$05,$01,$0C,$01,$01   ;098F00|        |00000D;
                       db $4F,$44,$4F,$28,$50,$0D,$15,$05   ;098F08|        |284F44;
                       db $01,$0C,$01,$0D,$15,$05,$01,$28   ;098F10|        |00000C;
                       db $51,$0E,$27,$18,$4F,$0C,$01,$0D   ;098F18|        |00000E;
                       db $12,$26,$01,$0C,$01,$04,$01,$0B   ;098F20|        |000026;
                       db $0F,$05,$01,$0C,$01,$0D,$0F,$05   ;098F28|        |0C0105;
                       db $01,$0C,$01,$01,$4F,$44,$4F,$28   ;098F30|        |00000C;
                       db $52,$00,$53,$0D,$19,$05,$01,$28   ;098F38|        |000000;
                       db $51,$0E,$27,$18,$4F,$0C,$01,$0D   ;098F40|        |00000E;
                       db $12,$26,$01,$0C,$01,$04,$01,$08   ;098F48|        |000026;
                       db $70,$21,$01,$07,$54,$03,$01,$46   ;098F50|        |098F73;
                       db $55,$0B,$75,$05,$01,$46,$5C,$0D   ;098F58|        |00000B;
                       db $75,$05,$01,$46,$5C,$21,$01,$46   ;098F60|        |000005;
                       db $57,$0B,$15,$05,$01,$46,$58,$0D   ;098F68|        |00000B;
                       db $15,$05,$01,$46,$58,$0D,$12,$05   ;098F70|        |000005;
                       db $01,$46,$59,$0D,$15,$05,$01,$46   ;098F78|        |000046;
                       db $59,$21,$01,$46,$5A,$0B,$73,$05   ;098F80|        |090121;
                       db $01,$46,$56,$33,$5B,$3A,$68,$0D   ;098F88|        |000046;
                       db $74,$05,$01,$46,$56,$0D,$74,$05   ;098F90|        |000005;
                       db $01,$46,$5C,$0D,$74,$05,$01,$33   ;098F98|        |000046;
                       db $6B,$46,$56,$0D,$74,$05,$01,$3C   ;098FA0|        |      ;
                       db $0B,$46,$5D,$0D,$74,$05,$01,$46   ;098FA8|        |      ;
                       db $5E,$0D,$74,$05,$01,$3D,$4E,$46   ;098FB0|        |09740D;
                       db $5F,$0D,$17,$05,$01,$46,$60,$33   ;098FB8|        |05170D;
                       db $6C,$0D,$17,$05,$01,$46,$5F,$0D   ;098FC0|        |00170D;
                       db $17,$05,$01,$46,$60,$0D,$17,$05   ;098FC8|        |000005;
                       db $01,$29,$01,$46,$5A,$0D,$73,$05   ;098FD0|        |000029;
                       db $01,$46,$61,$33,$5B,$0D,$74,$05   ;098FD8|        |000046;
                       db $01,$46,$56,$0D,$74,$05,$01,$46   ;098FE0|        |000046;
                       db $56,$0D,$74,$05,$01,$3C,$0B,$46   ;098FE8|        |00000D;
                       db $62,$0D,$17,$05,$01,$46,$63,$0D   ;098FF0|        |09A700;
                       db $17,$05,$01,$3D,$4E,$0D,$17,$05   ;098FF8|        |000005;
                       db $01,$46,$60,$0D,$17,$05,$01,$46   ;099000|        |000046;
                       db $60,$0D,$17,$05,$01,$46,$60,$29   ;099008|        |      ;
                       db $01,$18,$0A,$29,$01,$0B,$0F,$05   ;099010|        |000018;
                       db $01,$0C,$02,$0D,$0F,$05,$01,$0C   ;099018|        |00000C;
                       db $02,$0D,$0F,$05,$01,$0C,$02,$0D   ;099020|        |      ;
                       db $0F,$05,$01,$1C,$01,$00,$1A,$07   ;099028|        |1C0105;
                       db $71,$0B,$17,$05,$01,$0C,$01,$0D   ;099030|        |00000B;
                       db $17,$05,$01,$0C,$01,$0D,$17,$05   ;099038|        |000005;
                       db $01,$0C,$01,$0D,$17,$05,$01,$21   ;099040|        |00000C;
                       db $01,$22,$22,$21,$01,$18,$0A,$0B   ;099048|        |000022;
                       db $0F,$05,$01,$28,$6A,$0D,$14,$05   ;099050|        |280105;
                       db $01,$21,$01,$22,$64,$21,$01,$46   ;099058|        |000021;
                       db $65,$0B,$0F,$05,$00,$46,$56,$0E   ;099060|        |00000B;
                       db $32,$18,$0A,$0B,$0F,$46,$56,$05   ;099068|        |000018;
                       db $00,$46,$56,$0B,$0F,$05,$00,$46   ;099070|        |      ;
                       db $56,$29,$01,$39,$01,$0B,$0F,$05   ;099078|        |000029;
                       db $00,$46,$58,$0B,$0F,$05,$00,$46   ;099080|        |      ;
                       db $59,$0B,$0F,$05,$00,$46,$58,$20   ;099088|        |090F0B;
                       db $66,$3E,$01,$1C,$01,$0E,$01,$02   ;099090|        |00003E;
                       db $0A,$28,$67,$0B,$0F,$05,$01,$04   ;099098|        |      ;
                       db $01,$0E,$01,$18,$0A,$04,$01,$0C   ;0990A0|        |00000E;
                       db $00,$00,$00,$00,$00,$06,$00,$00   ;0990A8|        |      ;
                       db $00,$00,$30,$01,$00,$20,$04,$04   ;0990B0|        |      ;
                       db $00,$05,$20,$00,$04,$03,$00,$05   ;0990B8|        |      ;
                       db $FF,$00,$01,$38,$00,$00,$00,$20   ;0990C0|        |380100;
                       db $10,$00,$00,$18,$00,$00,$01,$00   ;0990C8|        |0990CA;
                       db $00,$14,$00,$00,$08,$00,$00,$00   ;0990D0|        |      ;
                       db $80,$08,$00,$C0,$20,$3C,$00,$00   ;0990D8|        |0990E2;
                       db $2A,$00,$00,$40,$00,$00,$0C,$00   ;0990E0|        |      ;
                       db $00,$03,$01,$02,$04,$00,$00,$F9   ;0990E8|        |      ;
                       db $00,$00,$30,$00,$00,$01,$80,$20   ;0990F0|        |      ;
                       db $FE,$00,$00,$03,$01,$20,$00,$14   ;0990F8|        |090000;
                       db $00,$01,$06,$00,$02,$02,$20,$12   ;099100|        |      ;
                       db $00,$00,$03,$00,$10,$07,$08,$00   ;099108|        |      ;
                       db $07,$20,$00,$19,$1B,$00,$17,$03   ;099110|        |000020;
                       db $00,$04,$01,$01,$03,$00,$00,$22   ;099118|        |      ;
                       db $00,$00,$04,$01,$00,$04,$08,$00   ;099120|        |      ;
                       db $05,$00,$00,$0A,$00,$00,$39,$00   ;099128|        |000000;
                       db $00,$19,$08,$01,$19,$04,$01,$00   ;099130|        |      ;
                       db $FD,$FF,$0E,$06,$00,$00,$00,$03   ;099138|        |090EFF;
                       db $1A,$08,$02,$01,$00,$40,$28,$08   ;099140|        |      ;
                       db $02,$00,$08,$00,$01,$08,$00,$02   ;099148|        |      ;
                       db $08,$00,$A8,$00,$00,$0E,$04,$00   ;099150|        |      ;
                       db $04,$60,$00,$37,$00,$00,$00,$F0   ;099158|        |000060;
                       db $00,$0A,$43,$00,$F8,$F0,$00,$00   ;099160|        |      ;
                       db $E0,$50,$00,$A0,$10,$18,$00,$00   ;099168|        |      ;
                       db $06,$00,$00,$00,$A0,$20,$00,$80   ;099170|        |000000;
                       db $10,$0A,$12,$00,$15,$00,$00,$0A   ;099178|        |099184;
                       db $15,$00,$00,$03,$00,$07,$40,$00   ;099180|        |000000;
                       db $04,$01,$08,$04,$01,$09,$FD,$00   ;099188|        |000001;
                       db $00,$FA,$00,$00,$03,$00,$70,$10   ;099190|        |      ;
                       db $34,$00,$10,$36,$00,$10,$30,$00   ;099198|        |000000;
                       db $00,$80,$00,$08,$05,$00,$10,$8C   ;0991A0|        |      ;
                       db $01,$FF,$00,$00,$10,$90,$FF,$FF   ;0991A8|        |0000FF;
                       db $00,$FF,$FE,$00,$FF,$10,$96,$00   ;0991B0|        |      ;
                       db $00,$F8,$00,$FF,$00,$01,$10,$A0   ;0991B8|        |      ;
                       db $01,$10,$A0,$00,$FE,$00,$01,$FE   ;0991C0|        |000010;
                       db $00,$00,$10,$A2,$00,$10,$A8,$00   ;0991C8|        |      ;
                       db $10,$A8,$01,$08,$08,$00,$10,$D6   ;0991D0|        |09917A;
                       db $00,$2C,$01,$04,$10,$4C,$00,$42   ;0991D8|        |      ;
                       db $00,$00,$44,$00,$00,$0E,$08,$00   ;0991E0|        |      ;
                       db $00,$D0,$00,$00,$30,$00,$F0,$00   ;0991E8|        |      ;
                       db $00,$08,$20,$00,$0A,$20,$00,$09   ;0991F0|        |      ;
                       db $08,$00,$04,$04,$00,$09,$20,$00   ;0991F8|        |      ;
                       db $10,$00,$00,$02,$00,$00,$0C,$00   ;099200|        |099202;
                       db $00,$14,$00,$00                   ;099208|        |      ;
 
       UNREACH_09920C: db $AD,$EC,$07,$D0,$03,$20,$FF,$92   ;09920C|        |0907EC;
                       db $8A,$CD,$EC,$07,$F0,$02,$B0,$2E   ;099214|        |      ;
                       db $8D,$EC,$07,$A0,$00,$8C,$ED,$07   ;09921C|        |0907EC;
                       db $C8,$8C,$F1,$07,$AC,$EC,$07,$B9   ;099224|        |      ;
                       db $4E,$05,$F0,$14,$B9,$EF,$05,$29   ;09922C|        |09F005;
                       db $7F,$C9,$1F,$F0,$08,$C9,$1E,$F0   ;099234|        |F01FC9;
                       db $04,$C9,$1A,$D0,$03,$EE,$ED,$07   ;09923C|        |0000C9;
                       db $C8,$C0,$0D,$D0,$E2,$8A,$38,$E9   ;099244|        |      ;
                       db $01,$0A,$85,$04,$A0,$02,$B1,$02   ;09924C|        |00000A;
                       db $0A,$A8,$B9,$18,$93,$85,$00,$B9   ;099254|        |      ;
                       db $19,$93,$85,$01,$A4,$04,$B1,$00   ;09925C|        |098593;
                       db $85,$04,$C8,$B1,$00,$85,$05,$A0   ;099264|        |000004;
                       db $03,$B1,$02,$F0,$12,$AC,$EC,$07   ;09926C|        |0000B1;
                       db $B9,$38,$04,$18,$65,$04,$85,$04   ;099274|        |090438;
                       db $A9,$B0,$18,$65,$05,$85,$05,$BD   ;09927C|        |      ;
                       db $38,$04,$38,$E5,$04,$B0,$05,$49   ;099284|        |      ;
                       db $FF,$18,$69,$01,$C9,$08,$B0,$2D   ;09928C|        |016918;
                       db $BD,$1C,$04,$38,$E5,$05,$B0,$05   ;099294|        |09041C;
                       db $49,$FF,$18,$69,$01,$C9,$08,$B0   ;09929C|        |      ;
                       db $1C,$A5,$05,$9D,$1C,$04,$EC,$EC   ;0992A4|        |0905A5;
                       db $07,$F0,$05,$AD,$F1,$07,$D0,$0A   ;0992AC|        |0000F0;
                       db $CE,$ED,$07,$F0,$17,$A9,$00,$8D   ;0992B4|        |0907ED;
                       db $F1,$07,$4C,$C8,$FE,$20,$30,$FF   ;0992BC|        |000007;
                       db $A5,$00,$4A,$29,$0F,$9D,$65,$05   ;0992C4|        |000000;
                       db $FE,$C1,$05,$60,$A0,$01,$B1,$02   ;0992CC|        |0905C1;
                       db $85,$00,$AC,$EC,$07,$B9,$4E,$05   ;0992D4|        |000000;
                       db $F0,$16,$BD,$EF,$05,$29,$7F,$C9   ;0992DC|        |0992F4;
                       db $1F,$F0,$08,$C9,$1E,$F0,$04,$C9   ;0992E4|        |C908F0;
                       db $1A,$D0,$05,$A5,$00,$99,$C1,$05   ;0992EC|        |      ;
                       db $C8,$C0,$0D,$D0,$E0,$A9,$02,$8D   ;0992F4|        |      ;
                       db $EE,$07,$60,$A0,$01,$B9,$4E,$05   ;0992FC|        |096007;
                       db $F0,$09,$B9,$EF,$05,$29,$7F,$C9   ;099304|        |09930F;
                       db $48,$D0,$05,$C8,$C0,$0D,$D0,$ED   ;09930C|        |      ;
                       db $8C,$EC,$07,$60,$1C,$93,$34,$93   ;099314|        |0907EC;
                       db $60,$50,$70,$60,$70,$50,$70,$40   ;09931C|        |      ;
                       db $80,$80,$80,$60,$80,$50,$80,$40   ;099324|        |0992A6;
                       db $80,$30,$00,$00,$00,$00,$00,$00   ;09932C|        |09935E;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;099334|        |      ;
                       db $00,$E0,$00,$F0,$00,$E0,$00,$F0   ;09933C|        |      ;
                       db $00,$E0,$00,$F0,$00,$E0,$00,$F0   ;099344|        |      ;
 
       UNREACH_09934C: db $A0,$03,$8C,$EE,$07,$88,$8A,$CD   ;09934C|        |      ;
                       db $EC,$07,$D0,$01,$88,$BD,$EF,$05   ;099354|        |09D007;
                       db $29,$80,$11,$02,$9D,$EF,$05,$A9   ;09935C|        |      ;
                       db $00,$9D,$C1,$05,$60               ;099364|        |      ;
 
       UNREACH_099369: db $FE,$C1,$05,$AC,$EC,$07,$F0,$46   ;099369|        |0905C1;
                       db $B9,$4E,$05,$D0,$05,$A9,$03,$8D   ;099371|        |09054E;
                       db $EE,$07,$AD,$EE,$07,$F0,$34,$C8   ;099379|        |09AD07;
                       db $B9,$EF,$05,$29,$7F,$C9,$1B,$D0   ;099381|        |0905EF;
                       db $F6,$B9,$4E,$05,$F0,$F1,$86,$00   ;099389|        |0000B9;
                       db $98,$C5,$00,$D0,$0D,$AC,$EC,$07   ;099391|        |      ;
                       db $B9,$65,$05,$9D,$65,$05,$8D,$ED   ;099399|        |090565;
                       db $07,$60,$AD,$ED,$07,$85,$00,$BD   ;0993A1|        |000060;
                       db $65,$05,$8D,$ED,$07,$A5,$00,$9D   ;0993A9|        |000005;
                       db $65,$05,$60,$4C,$69,$95,$4C,$60   ;0993B1|        |000005;
                       db $95                               ;0993B9|        |000020;
 
       UNREACH_0993BA: db $20,$C8,$FE,$FE,$C1,$05,$A0,$01   ;0993BA|        |09FEC8;
                       db $B1,$02,$85,$00,$BD,$65,$05,$29   ;0993C2|        |000002;
                       db $04,$F0,$1A,$BD,$65,$05,$29,$08   ;0993CA|        |0000F0;
                       db $F0,$09,$A5,$00,$49,$FF,$18,$69   ;0993D2|        |0993DD;
                       db $01,$85,$00,$BD,$38,$04,$18,$65   ;0993DA|        |000085;
                       db $00,$9D,$38,$04,$60,$BD,$65,$05   ;0993E2|        |      ;
                       db $29,$08,$D0,$09,$A5,$00,$49,$FF   ;0993EA|        |      ;
                       db $18,$69,$01,$85,$00,$BD,$1C,$04   ;0993F2|        |      ;
                       db $18,$65,$00,$9D,$1C,$04,$60       ;0993FA|        |      ;
 
       UNREACH_099401: db $A0,$0A,$B9,$B4,$EF,$85,$00,$B9   ;099401|        |      ;
                       db $B5,$EF,$85,$01,$BD,$33,$06,$0A   ;099409|        |0000EF;
                       db $18,$7D,$33,$06,$18,$65,$00,$85   ;099411|        |      ;
                       db $00,$A5,$01,$69,$00,$85,$01,$FE   ;099419|        |      ;
                       db $C1,$05,$A0,$01,$B1,$02,$88,$0A   ;099421|        |000005;
                       db $18,$71,$00,$9D,$00,$04,$BD,$70   ;099429|        |      ;
                       db $04,$29,$40,$09,$20,$9D,$70,$04   ;099431|        |000029;
                       db $A0,$02,$B1,$02,$9D,$D8,$05,$60   ;099439|        |      ;
 
       UNREACH_099441: db $FE,$C1,$05,$BC,$45,$06,$A9,$0A   ;099441|        |0905C1;
                       db $4C,$5C,$EF                       ;099449|        |09EF5C;
 
       UNREACH_09944C: db $A0,$01,$B1,$02,$09,$80,$9D,$EF   ;09944C|        |      ;
                       db $05,$A9,$00,$9D,$C1,$05,$60       ;099454|        |0000A9;
 
       UNREACH_09945B: db $FE,$C1,$05,$BD,$65,$05,$18,$69   ;09945B|        |0905C1;
                       db $08,$29,$0F,$9D,$65,$05,$29,$08   ;099463|        |      ;
                       db $F0,$02,$A9,$01,$9D,$A8,$04,$60   ;09946B|        |09946F;
 
       UNREACH_099473: db $FE,$C1,$05,$20,$DE,$94,$90,$06   ;099473|        |0905C1;
                       db $B9,$4C,$04,$4C,$84,$94,$AD,$38   ;09947B|        |09044C;
                       db $04,$85,$00,$BD,$A8,$04,$F0,$04   ;099483|        |000085;
                       db $A9,$FC,$D0,$02,$A9,$04,$18,$65   ;09948B|        |      ;
                       db $00,$9D,$38,$04,$A9,$30,$9D,$1C   ;099493|        |      ;
                       db $04,$60                           ;09949B|        |000060;
 
       UNREACH_09949D: db $20,$DE,$94,$90,$1E,$A9,$70,$9D   ;09949D|        |0994DE;
                       db $1C,$04,$FE,$C1,$05,$A0,$01,$B1   ;0994A5|        |09FE04;
                       db $02,$9D,$D8,$05,$BD,$70,$04,$29   ;0994AD|        |      ;
                       db $77,$9D,$70,$04,$A9,$0A,$A0,$0C   ;0994B5|        |00009D;
                       db $4C,$5C,$EF,$A9,$01,$9D,$C1,$05   ;0994BD|        |09EF5C;
                       db $BD,$70,$04,$29,$77,$9D,$70,$04   ;0994C5|        |090470;
                       db $A9,$10,$9D,$D8,$05,$A9,$91,$9D   ;0994CD|        |      ;
                       db $EF,$05,$A9,$0A,$A0,$0B,$4C,$5C   ;0994D5|        |0AA905;
                       db $EF,$A0,$02,$B9,$62,$05,$C9,$03   ;0994DD|        |B902A0;
                       db $F0,$0B,$C9,$08,$F0,$07,$88,$C0   ;0994E5|        |0994F2;
                       db $FF,$D0,$F0,$18,$60,$38,$60       ;0994ED|        |18F0D0;
 
       UNREACH_0994F4: db $A9,$FF,$38,$FD,$38,$04,$85,$01   ;0994F4|        |      ;
                       db $A9,$00,$06,$01,$2A,$9D,$F2,$04   ;0994FC|        |      ;
                       db $A5,$01,$9D,$09,$05,$FE,$C1,$05   ;099504|        |000001;
                       db $A9,$00,$9D,$A8,$04,$A9,$04,$9D   ;09950C|        |      ;
                       db $65,$05,$60                       ;099514|        |000005;
 
       UNREACH_099517: db $BD,$8C,$04,$BC,$AA,$05,$C8,$20   ;099517|        |09048C;
                       db $5C,$EF,$FE,$C1,$05,$A0,$01,$B1   ;09951F|        |C1FEEF;
                       db $02,$85,$00,$F0,$0E,$BD,$A8,$04   ;099527|        |      ;
                       db $F0,$0C,$BD,$38,$04,$38,$E5,$00   ;09952F|        |09953D;
                       db $9D,$38,$04,$4C,$46,$95,$BD,$38   ;099537|        |090438;
                       db $04,$18,$65,$00,$9D,$38,$04,$A0   ;09953F|        |000018;
                       db $02,$B1,$02,$18,$7D,$1C,$04,$9D   ;099547|        |      ;
                       db $1C,$04,$60                       ;09954F|        |096004;
 
       UNREACH_099552: db $20,$C8,$FE                       ;099552|        |09FEC8;
 
       UNREACH_099555: db $FE,$C1,$05,$A0,$01,$B1,$02,$9D   ;099555|        |0905C1;
                       db $D8,$05,$60                       ;09955D|        |      ;
 
       UNREACH_099560: db $A9,$00,$9D,$EF,$05,$9D,$C1,$05   ;099560|        |      ;
                       db $60                               ;099568|        |      ;
 
       UNREACH_099569: db $BD,$EF,$05,$29,$80,$9D,$EF,$05   ;099569|        |0905EF;
 
       UNREACH_099571: db $A9,$00,$9D,$C1,$05,$60           ;099571|        |      ;
 
       UNREACH_099577: db $BD,$65,$05,$18,$69,$08,$29,$0F   ;099577|        |090565;
                       db $85,$05,$4C,$89,$95               ;09957F|        |000005;
 
          CODE_099584: LDA.W $0565,X                        ;099584|BD6505  |090565;
                       STA.B $05                            ;099587|8505    |000005;
                       INC.W $05C1,X                        ;099589|FEC105  |0905C1;
                       db $20                               ;09958C|        |      ;
                       dw UNREACH_0FFEC8                    ;09958D|        |0FFEC8;
                       LDY.B #$01                           ;09958F|A001    |      ;
                       LDA.B ($02),Y                        ;099591|B102    |000002;
                       STA.B $00                            ;099593|8500    |000000;
                       INY                                  ;099595|C8      |      ;
                       LDA.B ($02),Y                        ;099596|B102    |000002;
                       STA.B $01                            ;099598|8501    |000001;
                       INY                                  ;09959A|C8      |      ;
                       LDA.B ($02),Y                        ;09959B|B102    |000002;
                       STA.W $05D8,X                        ;09959D|9DD805  |0905D8;
                       LDA.B $05                            ;0995A0|A505    |000005;
                       AND.B #$07                           ;0995A2|2907    |      ;
                       BEQ UNREACH_0995BA                   ;0995A4|F014    |0995BA;
                       LDA.B $05                            ;0995A6|A505    |000005;
                       AND.B #$08                           ;0995A8|2908    |      ;
                       BEQ CODE_0995AF                      ;0995AA|F003    |0995AF;
                       JSR.W CODE_0995CE                    ;0995AC|20CE95  |0995CE;
 
          CODE_0995AF: LDA.B $00                            ;0995AF|A500    |000000;
                       STA.W $04F2,X                        ;0995B1|9DF204  |0904F2;
                       LDA.B $01                            ;0995B4|A501    |000001;
                       STA.W $0509,X                        ;0995B6|9D0905  |090509;
                       RTS                                  ;0995B9|60      |      ;
 
 
       UNREACH_0995BA: db $A5,$05,$29,$08,$D0,$03,$20,$CE   ;0995BA|        |000005;
                       db $95,$A5,$00,$9D,$20,$05,$A5,$01   ;0995C2|        |0000A5;
                       db $9D,$37,$05,$60                   ;0995CA|        |090537;
 
          CODE_0995CE: LDA.B $01                            ;0995CE|A501    |000001;
                       EOR.B #$FF                           ;0995D0|49FF    |      ;
                       CLC                                  ;0995D2|18      |      ;
                       ADC.B #$01                           ;0995D3|6901    |      ;
                       STA.B $01                            ;0995D5|8501    |000001;
                       LDA.B $00                            ;0995D7|A500    |000000;
                       EOR.B #$FF                           ;0995D9|49FF    |      ;
                       ADC.B #$00                           ;0995DB|6900    |      ;
                       STA.B $00                            ;0995DD|8500    |000000;
                       RTS                                  ;0995DF|60      |      ;
 
 
       UNREACH_0995E0: db $A0,$03,$B1,$02,$C9,$FF,$F0,$20   ;0995E0|        |      ;
                       db $0A,$A8,$B9,$DB,$96,$85,$00,$B9   ;0995E8|        |      ;
                       db $DC,$96,$85,$01,$BD,$65,$05,$29   ;0995F0|        |008596;
                       db $08,$F0,$03,$20,$CE,$95,$A5,$00   ;0995F8|        |      ;
                       db $9D,$F2,$04,$A5,$01,$9D,$09,$05   ;099600|        |0904F2;
                       db $A0,$01,$B1,$02,$9D,$37,$05,$C8   ;099608|        |      ;
                       db $B1,$02,$9D,$20,$05,$FE,$C1,$05   ;099610|        |000002;
                       db $60                               ;099618|        |      ;
 
       UNREACH_099619: db $A0,$02,$B1,$02,$0A,$A8,$B9,$DB   ;099619|        |      ;
                       db $96,$85,$00,$B9,$DC,$96,$85,$01   ;099621|        |000085;
                       db $BD,$65,$05,$29,$08,$F0,$03,$20   ;099629|        |090565;
                       db $CE,$95,$A5,$00,$9D,$F2,$04,$A5   ;099631|        |09A595;
                       db $01,$9D,$09,$05,$A0,$01,$B1,$02   ;099639|        |00009D;
                       db $0A,$A8,$B9,$D3,$96,$9D,$37,$05   ;099641|        |      ;
                       db $B9,$D4,$96,$9D,$20,$05,$FE,$C1   ;099649|        |0996D4;
                       db $05,$60                           ;099651|        |000060;
 
       UNREACH_099653: db $A0,$03,$B1,$02,$85,$00,$BD,$37   ;099653|        |      ;
                       db $05,$18,$65,$00,$9D,$37,$05,$BD   ;09965B|        |000018;
                       db $20,$05,$69,$00,$9D,$20,$05,$BD   ;099663|        |096905;
                       db $20,$05,$30,$63,$A0,$00,$B1,$02   ;09966B|        |093005;
                       db $C9,$44,$F0,$22,$C9,$02,$D0,$2A   ;099673|        |      ;
                       db $A0,$10,$BD,$4E,$05,$C9,$01,$D0   ;09967B|        |      ;
                       db $02,$A0,$18,$BD,$A8,$04,$F0,$04   ;099683|        |      ;
                       db $A9,$FC,$D0,$02,$A9,$04,$20,$1E   ;09968B|        |      ;
                       db $FC,$F0,$0F,$4C,$E3,$96,$FE,$C1   ;099693|        |090FF0;
                       db $05,$A9,$00,$9D,$20,$05,$9D,$37   ;09969B|        |0000A9;
                       db $05,$60,$A0,$01,$B1,$02,$0A,$A8   ;0996A3|        |000060;
                       db $B9,$D3,$96,$85,$01,$B9,$D4,$96   ;0996AB|        |0996D3;
                       db $85,$00,$20,$CE,$95,$BD,$20,$05   ;0996B3|        |000000;
                       db $C5,$00,$B0,$09,$D0,$11,$BD,$37   ;0996BB|        |000000;
                       db $05,$C5,$01,$B0,$0A,$A5,$00,$9D   ;0996C3|        |0000C5;
                       db $20,$05,$A5,$01,$9D,$37,$05,$60   ;0996CB|        |09A505;
                       db $00,$FC,$00,$FE,$00,$FD,$00,$F8   ;0996D3|        |      ;
                       db $00,$80,$00,$40,$00,$E0,$00,$00   ;0996DB|        |      ;
                       db $FE,$C1,$05,$A9,$00,$9D,$20,$05   ;0996E3|        |0905C1;
                       db $9D,$37,$05,$BD,$4E,$05,$C9,$01   ;0996EB|        |090537;
                       db $F0,$09,$BD,$1C,$04,$29,$F0,$9D   ;0996F3|        |0996FE;
                       db $1C,$04,$60,$BD,$1C,$04,$29,$F8   ;0996FB|        |096004;
                       db $9D,$1C,$04,$60                   ;099703|        |09041C;
 
       UNREACH_099707: db $DE,$D8,$05,$D0,$03,$FE,$C1,$05   ;099707|        |0905D8;
                       db $60                               ;09970F|        |      ;
 
       UNREACH_099710: db $BD,$65,$05,$18,$69,$04,$29,$0F   ;099710|        |090565;
                       db $9D,$65,$05,$FE,$C1,$05,$60       ;099718|        |090565;
 
       UNREACH_09971F: db $DE,$D8,$05,$F0,$03,$4C,$79,$97   ;09971F|        |0905D8;
                       db $FE,$C1,$05,$60                   ;099727|        |0905C1;
 
       UNREACH_09972B: db $BD,$45,$06,$C9,$10,$90,$42,$20   ;09972B|        |090645;
                       db $53,$97,$BD,$45,$06,$C9,$10,$B0   ;099733|        |000097;
                       db $0D,$BD,$F2,$04,$30,$08,$FE,$C1   ;09973B|        |09F2BD;
                       db $05,$A9,$00,$9D,$45,$06,$60       ;099743|        |0000A9;
 
       UNREACH_09974A: db $BD,$45,$06,$29,$7F,$C9,$10,$90   ;09974A|        |090645;
                       db $21,$BD,$33,$06,$D0,$21,$BD,$09   ;099752|        |0000BD;
                       db $05,$49,$FF,$18,$69,$01,$9D,$09   ;09975A|        |000049;
                       db $05,$BD,$F2,$04,$49,$FF,$69,$00   ;099762|        |0000BD;
                       db $9D,$F2,$04,$A9,$01,$9D,$33,$06   ;09976A|        |0904F2;
                       db $D0,$05,$A9,$00,$9D,$33,$06       ;099772|        |099779;
 
       UNREACH_099779: db $A9,$00,$85,$00,$20,$D6,$97,$85   ;099779|        |      ;
                       db $01,$A0,$01,$B1,$02,$18,$7D,$45   ;099781|        |0000A0;
                       db $06,$9D,$45,$06,$20,$D6,$97,$38   ;099789|        |00009D;
                       db $E5,$01,$85,$01,$B0,$0D,$A5,$01   ;099791|        |000001;
                       db $49,$FF,$18,$69,$01,$85,$01,$A9   ;099799|        |      ;
                       db $FF,$85,$00,$A0,$02,$B1,$02,$85   ;0997A1|        |A00085;
                       db $02,$F0,$06,$46,$01,$C6,$02,$D0   ;0997A9|        |      ;
                       db $FA,$BD,$45,$06,$29,$80,$F0,$06   ;0997B1|        |      ;
                       db $A5,$00,$49,$FF,$85,$00,$A5,$00   ;0997B9|        |000000;
                       db $F0,$09,$A5,$01,$49,$FF,$18,$69   ;0997C1|        |0997CC;
                       db $01,$85,$01,$BD,$1C,$04,$18,$65   ;0997C9|        |000085;
                       db $01,$9D,$1C,$04,$60,$BD,$45,$06   ;0997D1|        |00009D;
                       db $29,$3F,$85,$08,$BD,$45,$06,$29   ;0997D9|        |      ;
                       db $40,$F0,$07,$A9,$3F,$38,$E5,$08   ;0997E1|        |      ;
                       db $85,$08,$A4,$08,$B9,$F1,$97,$60   ;0997E9|        |000008;
                       db $00,$06,$0D,$13,$19,$1F,$25,$2C   ;0997F1|        |      ;
                       db $32,$38,$3E,$44,$4A,$50,$56,$5C   ;0997F9|        |000038;
                       db $62,$67,$6D,$73,$78,$7E,$83,$88   ;099801|        |09056B;
                       db $8E,$93,$98,$9D,$A2,$A7,$AB,$B0   ;099809|        |099893;
                       db $B4,$B9,$BD,$C1,$C5,$C9,$CD,$D0   ;099811|        |0000B9;
                       db $D4,$D7,$DB,$DE,$E1,$E4,$E7,$E9   ;099819|        |0000D7;
                       db $EC,$EE,$F0,$F2,$F4,$F6,$F7,$F9   ;099821|        |09F0EE;
                       db $FA,$FB,$FC,$FD,$FE,$FE,$FF,$FF   ;099829|        |      ;
 
       UNREACH_099831: db $A0,$02,$B1,$02,$9D,$D8,$05,$88   ;099831|        |      ;
                       db $B1,$02,$0A,$0A,$85,$08,$FE,$C1   ;099839|        |000002;
                       db $05,$BC,$65,$05,$98,$48,$B9,$93   ;099841|        |0000BC;
                       db $98,$48,$0A,$A8,$B9,$A3,$98,$85   ;099849|        |      ;
                       db $00,$B9,$A4,$98,$85,$01,$A4,$08   ;099851|        |      ;
                       db $20,$66,$98,$68,$10,$03,$20,$7A   ;099859|        |099866;
                       db $98,$68,$4C,$91,$99,$B1,$00,$85   ;099861|        |      ;
                       db $08,$C8,$B1,$00,$85,$09,$C8,$B1   ;099869|        |      ;
                       db $00,$85,$0A,$C8,$B1,$00,$85,$0B   ;099871|        |      ;
                       db $60,$A5,$08,$A4,$0A,$84,$08,$85   ;099879|        |      ;
                       db $0A,$A5,$09,$A4,$0B,$84,$09,$85   ;099881|        |      ;
                       db $0B,$60,$01,$00,$00,$01,$00,$00   ;099889|        |      ;
                       db $01,$01,$00,$01,$02,$81,$80,$81   ;099891|        |000001;
                       db $02,$01,$00,$01,$02,$81,$80,$81   ;099899|        |      ;
                       db $02,$01,$A9,$98,$D1,$98,$F9,$98   ;0998A1|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$20   ;0998A9|        |      ;
                       db $00,$00,$00,$40,$00,$00,$00,$60   ;0998B1|        |      ;
                       db $00,$00,$00,$80,$00,$00,$00,$A0   ;0998B9|        |      ;
                       db $00,$00,$00,$C0,$00,$00,$00,$E0   ;0998C1|        |      ;
                       db $00,$00,$01,$80,$00,$00,$02,$00   ;0998C9|        |      ;
                       db $00,$00,$00,$00,$00,$0C,$00,$1E   ;0998D1|        |      ;
                       db $00,$18,$00,$3B,$00,$25,$00,$59   ;0998D9|        |      ;
                       db $00,$31,$00,$76,$00,$3D,$00,$94   ;0998E1|        |      ;
                       db $00,$49,$00,$B1,$00,$56,$00,$CF   ;0998E9|        |      ;
                       db $00,$93,$01,$63,$00,$C3,$01,$D9   ;0998F1|        |      ;
                       db $00,$00,$00,$00,$00,$17,$00,$17   ;0998F9|        |      ;
                       db $00,$2D,$00,$2D,$00,$44,$00,$44   ;099901|        |      ;
                       db $00,$5B,$00,$5B,$00,$71,$00,$71   ;099909|        |      ;
                       db $00,$88,$00,$88,$00,$9E,$00,$9E   ;099911|        |      ;
                       db $01,$10,$01,$10,$01,$6A,$01,$6A   ;099919|        |000010;
 
       UNREACH_099921: db $A9,$00,$85,$00,$AC,$1E,$06,$B9   ;099921|        |      ;
                       db $40,$99,$9D,$D8,$05,$B9,$4D,$99   ;099929|        |      ;
                       db $85,$05,$A5,$00,$F0,$30,$1E,$D8   ;099931|        |000005;
                       db $05,$1E,$D8,$05,$4C,$67,$99,$05   ;099939|        |00001E;
                       db $05,$05,$05,$06,$06,$06,$07,$07   ;099941|        |000005;
                       db $07,$08,$08,$08,$07,$07,$07,$07   ;099949|        |000008;
                       db $06,$06,$06,$05,$05,$05,$04,$04   ;099951|        |000006;
                       db $04                               ;099959|        |0000A0;
 
       UNREACH_09995A: db $A0,$02,$B1,$02,$9D,$D8,$05       ;09995A|        |      ;
 
       UNREACH_099961: db $A0,$01,$B1,$02,$85,$05,$FE,$C1   ;099961|        |      ;
                       db $05,$BC,$65,$05,$98,$48,$B9,$CD   ;099969|        |0000BC;
                       db $99,$85,$04,$0A,$A8,$B9,$ED,$99   ;099971|        |090485;
                       db $85,$00,$B9,$EE,$99,$85,$01,$A5   ;099979|        |000000;
                       db $05,$0A,$0A,$A8,$20,$66,$98,$A5   ;099981|        |00000A;
                       db $04,$10,$03,$20,$7A,$98,$68,$4A   ;099989|        |000010;
                       db $4A,$4A,$A8,$B9,$8B,$98,$F0,$0D   ;099991|        |      ;
                       db $38,$A9,$00,$E5,$0B,$85,$0B,$A9   ;099999|        |      ;
                       db $00,$E5,$0A,$85,$0A,$B9,$8F,$98   ;0999A1|        |      ;
                       db $F0,$0D,$38,$A9,$00,$E5,$09,$85   ;0999A9|        |0999B8;
                       db $09,$A9,$00,$E5,$08,$85,$08,$A5   ;0999B1|        |      ;
                       db $08,$9D,$F2,$04,$A5,$09,$9D,$09   ;0999B9|        |      ;
                       db $05,$A5,$0A,$9D,$20,$05,$A5,$0B   ;0999C1|        |0000A5;
                       db $9D,$37,$05,$60,$00,$01,$02,$03   ;0999C9|        |090537;
                       db $04,$83,$82,$81,$80,$81,$82,$83   ;0999D1|        |000083;
                       db $04,$03,$02,$01,$00,$01,$02,$03   ;0999D9|        |000003;
                       db $04,$83,$82,$81,$80,$81,$82,$83   ;0999E1|        |000083;
                       db $04,$03,$02,$01,$F7,$99,$27,$9A   ;0999E9|        |000003;
                       db $57,$9A,$87,$9A,$B7,$9A,$00,$00   ;0999F1|        |00009A;
                       db $00,$00,$00,$00,$00,$40,$00,$00   ;0999F9|        |      ;
                       db $00,$80,$00,$00,$00,$C0,$00,$00   ;099A01|        |      ;
                       db $01,$00,$00,$00,$01,$40,$00,$00   ;099A09|        |000000;
                       db $01,$80,$00,$00,$01,$C0,$00,$00   ;099A11|        |000080;
                       db $04,$00,$00,$00,$02,$00,$00,$00   ;099A19|        |000000;
                       db $02,$80,$00,$00,$03,$00,$00,$00   ;099A21|        |      ;
                       db $00,$00,$00,$0C,$00,$3F,$00,$19   ;099A29|        |      ;
                       db $00,$7E,$00,$25,$00,$BC,$00,$32   ;099A31|        |      ;
                       db $00,$FB,$00,$3E,$01,$3A,$00,$4B   ;099A39|        |      ;
                       db $01,$79,$00,$57,$01,$B7,$00,$C7   ;099A41|        |000079;
                       db $03,$EC,$00,$63,$01,$F6,$00,$7C   ;099A49|        |0000EC;
                       db $02,$73,$00,$95,$02,$F1,$00,$00   ;099A51|        |      ;
                       db $00,$00,$00,$18,$00,$3B,$00,$31   ;099A59|        |      ;
                       db $00,$76,$00,$49,$00,$B1,$00,$62   ;099A61|        |      ;
                       db $00,$ED,$00,$7A,$01,$28,$00,$93   ;099A69|        |      ;
                       db $01,$63,$00,$AB,$01,$9E,$01,$87   ;099A71|        |000063;
                       db $03,$B2,$00,$C3,$01,$D9,$00,$F4   ;099A79|        |0000B2;
                       db $02,$4F,$01,$25,$02,$C5,$00,$00   ;099A81|        |      ;
                       db $00,$00,$00,$24,$00,$35,$00,$47   ;099A89|        |      ;
                       db $00,$6A,$00,$6B,$00,$A0,$00,$8E   ;099A91|        |      ;
                       db $00,$D5,$00,$B2,$01,$0A,$00,$D5   ;099A99|        |      ;
                       db $01,$3F,$00,$F9,$01,$74,$02,$38   ;099AA1|        |00003F;
                       db $03,$53,$01,$1C,$01,$A9,$01,$63   ;099AA9|        |000053;
                       db $02,$14,$01,$AA,$02,$7E,$00,$00   ;099AB1|        |      ;
                       db $00,$00,$00,$2D,$00,$2D,$00,$5B   ;099AB9|        |      ;
                       db $00,$5B,$00,$88,$00,$88,$00,$B5   ;099AC1|        |      ;
                       db $00,$B5,$00,$E2,$00,$E2,$01,$10   ;099AC9|        |      ;
                       db $01,$10,$01,$3D,$01,$3D,$02,$D4   ;099AD1|        |000010;
                       db $02,$D4,$01,$6A,$01,$6A,$01,$C4   ;099AD9|        |      ;
                       db $01,$C4,$02,$1F,$02,$1F,$A5,$00   ;099AE1|        |0000C4;
                       db $38,$E5,$01,$10,$04,$FE,$65,$05   ;099AE9|        |      ;
                       db $60,$DE,$65,$05,$60               ;099AF1|        |      ;
 
       UNREACH_099AF6: db $A0,$02,$84,$17,$C8,$B1,$02,$4C   ;099AF6|        |      ;
                       db $08,$9B                           ;099AFE|        |      ;
 
       UNREACH_099B00: db $A9,$01,$85,$17,$A5,$1F,$29,$07   ;099B00|        |      ;
                       db $85,$00,$BD,$33,$06,$29,$80,$F0   ;099B08|        |000000;
                       db $03,$4C,$C7,$9B,$BD,$33,$06,$09   ;099B10|        |00004C;
                       db $80,$9D,$33,$06,$A5,$00,$0A,$A8   ;099B18|        |099AB7;
                       db $B9,$D0,$9B,$85,$04,$B9,$D1,$9B   ;099B20|        |099BD0;
                       db $85,$05,$20,$30,$FF,$A0,$02,$B1   ;099B28|        |000005;
                       db $02,$D0,$03,$4C,$7B,$9B,$A5,$00   ;099B30|        |      ;
                       db $29,$1F,$09,$80,$9D,$33,$06,$BD   ;099B38|        |      ;
                       db $33,$06,$29,$7F,$38,$FD,$65,$05   ;099B40|        |000006;
                       db $F0,$69,$10,$1C,$49,$FF,$18,$69   ;099B48|        |099BB3;
                       db $01,$C9,$03,$90,$5E,$C9,$10,$B0   ;099B50|        |0000C9;
                       db $17,$BD,$65,$05,$38,$E5,$17,$29   ;099B58|        |0000BD;
                       db $1F,$9D,$65,$05,$FE,$C1,$05,$60   ;099B60|        |05659D;
                       db $C9,$03,$90,$47,$C9,$10,$B0,$E9   ;099B68|        |      ;
                       db $BD,$65,$05,$18,$65,$17,$29,$1F   ;099B70|        |090565;
                       db $4C,$61,$9B,$A5,$00,$4A,$29,$0F   ;099B78|        |099B61;
                       db $09,$80,$9D,$33,$06,$BD,$33,$06   ;099B80|        |      ;
                       db $29,$7F,$38,$FD,$65,$05,$F0,$23   ;099B88|        |      ;
                       db $10,$13,$49,$FF,$18,$69,$01,$C9   ;099B90|        |099BA5;
                       db $08,$B0,$0E,$BC,$65,$05,$88,$98   ;099B98|        |      ;
                       db $29,$0F,$4C,$61,$9B,$C9,$08,$B0   ;099BA0|        |      ;
                       db $F2,$BC,$65,$05,$C8,$98,$29,$0F   ;099BA8|        |0000BC;
                       db $4C,$61,$9B,$A0,$01,$B1,$02,$18   ;099BB0|        |099B61;
                       db $7D,$C1,$05,$9D,$C1,$05,$BD,$33   ;099BB8|        |0905C1;
                       db $06,$29,$7F,$9D,$33,$06,$60,$A0   ;099BC0|        |000029;
                       db $02,$B1,$02,$F0,$B8,$4C,$3F,$9B   ;099BC8|        |      ;
                       db $40,$50,$70,$50,$A0,$50,$D0,$50   ;099BD0|        |      ;
                       db $40,$70,$70,$70,$A0,$70,$D0,$70   ;099BD8|        |      ;
                       db $80,$A0,$80,$50                   ;099BE0|        |099B82;
 
       UNREACH_099BE4: db $A9,$02,$85,$17,$BD,$33,$06,$29   ;099BE4|        |      ;
                       db $80,$D0,$D8,$BD,$33,$06,$09,$80   ;099BEC|        |099BBE;
                       db $9D,$33,$06,$AD,$38,$04,$85,$04   ;099BF4|        |090633;
                       db $AD,$1C,$04,$85,$05,$4C,$2A,$9B   ;099BFC|        |09041C;
 
       UNREACH_099C04: db $A0,$01,$B1,$02,$18,$7D,$37,$05   ;099C04|        |      ;
                       db $9D,$37,$05,$A9,$00,$7D,$20,$05   ;099C0C|        |090537;
                       db $9D,$20,$05,$60                   ;099C14|        |090520;
 
       UNREACH_099C18: db $A9,$18,$9D,$EF,$05,$A9,$00,$9D   ;099C18|        |      ;
                       db $C1,$05,$9D,$57,$06,$9D,$70,$04   ;099C20|        |000005;
                       db $9D,$00,$04,$60                   ;099C28|        |090400;
 
       UNREACH_099C2C: db $FE,$C1,$05,$A0,$03,$B1,$02,$C9   ;099C2C|        |0905C1;
                       db $FF,$F0,$03,$9D,$A8,$04,$A0,$01   ;099C34|        |9D03F0;
                       db $B1,$02,$C9,$FF,$F0,$15,$C9,$FE   ;099C3C|        |000002;
                       db $F0,$0A,$9D,$8C,$04,$C8,$B1,$02   ;099C44|        |099C50;
                       db $9D,$00,$04,$60,$DE,$00,$04,$DE   ;099C4C|        |090400;
                       db $00,$04,$60,$FE,$00,$04,$FE,$00   ;099C54|        |      ;
                       db $04,$60                           ;099C5C|        |000060;
 
       UNREACH_099C5E: db $BD,$33,$06,$D0,$19,$AD,$38,$04   ;099C5E|        |090633;
                       db $85,$04,$AD,$1C,$04,$85,$05,$20   ;099C66|        |000004;
                       db $30,$FF,$A5,$00,$29,$1E,$9D,$45   ;099C6E|        |099C6F;
                       db $06,$A9,$01,$9D,$33,$06,$BD,$45   ;099C76|        |0000A9;
                       db $06,$DD,$65,$05,$F0,$26,$BD,$1D   ;099C7E|        |0000DD;
                       db $06,$F0,$09,$FE,$65,$05,$FE,$65   ;099C86|        |0000F0;
                       db $05,$4C,$98,$9C,$DE,$65,$05,$DE   ;099C8E|        |00004C;
                       db $65,$05,$BD,$65,$05,$29,$1E,$9D   ;099C96|        |000005;
                       db $65,$05,$A0,$01,$B1,$02,$9D,$D8   ;099C9E|        |000005;
                       db $05,$4C,$66,$9D,$FE,$1D,$06,$BD   ;099CA6|        |00004C;
                       db $1D,$06,$29,$01,$9D,$1D,$06,$A9   ;099CAE|        |092906;
                       db $00,$9D,$33,$06,$A0,$02,$B1,$02   ;099CB6|        |      ;
                       db $9D,$D8,$05,$4C,$66,$9D           ;099CBE|        |0905D8;
 
       UNREACH_099CC4: db $86,$10,$A0,$01,$B1,$02,$0A,$0A   ;099CC4|        |000010;
                       db $C8,$18,$71,$02,$18,$69,$03,$18   ;099CCC|        |      ;
                       db $65,$1D,$85,$16,$C8,$B1,$02,$85   ;099CD4|        |00001D;
                       db $15,$20,$04,$9D,$A6,$16,$A5,$15   ;099CDC|        |000020;
                       db $20,$EC,$9C,$A6,$10,$4C,$66,$9D   ;099CE4|        |099CEC;
                       db $9D,$00,$03,$E8,$60,$00,$3F,$0F   ;099CEC|        |090300;
                       db $16,$26,$20,$0F,$0B,$1C,$2A,$0F   ;099CF4|        |000026;
                       db $02,$09,$08,$0F,$02,$31,$12,$FF   ;099CFC|        |      ;
                       db $A6,$1D,$A9,$01,$20,$EC,$9C,$A0   ;099D04|        |00001D;
                       db $00,$B9,$F1,$9C,$20,$EC,$9C,$C9   ;099D0C|        |      ;
                       db $FF,$F0,$03,$C8,$D0,$F3,$86,$1D   ;099D14|        |C803F0;
                       db $A9,$04,$4C,$E9,$EC               ;099D1C|        |      ;
 
       UNREACH_099D21: db $BD,$70,$04,$09,$88,$9D,$70,$04   ;099D21|        |090470;
                       db $4C,$66,$9D                       ;099D29|        |099D66;
 
       UNREACH_099D2C: db $A0,$01,$B1,$02,$9D,$54,$04,$4C   ;099D2C|        |      ;
                       db $66,$9D                           ;099D34|        |00009D;
 
       UNREACH_099D36: db $A0,$01,$B1,$02,$9D,$33,$06,$4C   ;099D36|        |      ;
                       db $66,$9D                           ;099D3E|        |00009D;
 
       UNREACH_099D40: db $DE,$33,$06,$F0,$0C               ;099D40|        |090633;
 
       UNREACH_099D45: db $A0,$01,$B1,$02,$18,$7D,$C1,$05   ;099D45|        |      ;
                       db $9D,$C1,$05,$60,$4C,$66,$9D       ;099D4D|        |0905C1;
 
       UNREACH_099D54: db $A0,$01,$B1,$02,$20,$5F,$E2,$4C   ;099D54|        |      ;
                       db $66,$9D                           ;099D5C|        |00009D;
 
       UNREACH_099D5E: db $BD,$70,$04,$29,$77,$9D,$70,$04   ;099D5E|        |090470;
                       db $FE,$C1,$05,$60                   ;099D66|        |0905C1;
 
       UNREACH_099D6A: db $BD,$65,$05,$18,$69,$08,$29,$0F   ;099D6A|        |090565;
                       db $9D,$65,$05,$4C,$66,$9D           ;099D72|        |090565;
 
       UNREACH_099D78: db $BD,$EF,$05,$9D,$45,$06,$FE,$C1   ;099D78|        |0905EF;
                       db $05,$BD,$C1,$05,$9D,$33,$06,$A9   ;099D80|        |0000BD;
                       db $00,$9D,$C1,$05,$A0,$01,$B1,$02   ;099D88|        |      ;
                       db $29,$80,$9D,$EF,$05,$60           ;099D90|        |      ;
 
       UNREACH_099D96: db $BD,$45,$06,$9D,$EF,$05,$BD,$33   ;099D96|        |090645;
                       db $06,$9D,$C1,$05,$60               ;099D9E|        |00009D;
 
       UNREACH_099DA3: db $BD,$70,$04,$29,$BF,$9D,$70,$04   ;099DA3|        |090470;
                       db $4C,$66,$9D                       ;099DAB|        |099D66;
 
       UNREACH_099DAE: db $BD,$70,$04,$09,$40,$9D,$70,$04   ;099DAE|        |090470;
                       db $4C,$66,$9D                       ;099DB6|        |099D66;
 
       UNREACH_099DB9: db $A0,$01,$B1,$02,$20,$66,$87,$BD   ;099DB9|        |      ;
                       db $A8,$04,$99,$A8,$04,$BD,$65,$05   ;099DC1|        |      ;
                       db $99,$65,$05,$A9,$00,$99,$06,$06   ;099DC9|        |090565;
                       db $99,$C1,$05,$4C,$66,$9D           ;099DD1|        |0905C1;
 
       UNREACH_099DD7: db $A0,$01,$B1,$02,$18,$7D,$38,$04   ;099DD7|        |      ;
                       db $9D,$38,$04,$C8,$B1,$02,$18,$7D   ;099DDF|        |090438;
                       db $1C,$04,$9D,$1C,$04,$4C,$66,$9D   ;099DE7|        |099D04;
 
       UNREACH_099DEF: db $AD,$38,$04,$85,$04,$AD,$1C,$04   ;099DEF|        |090438;
                       db $85,$05,$20,$30,$FF,$A5,$00,$29   ;099DF7|        |000005;
                       db $10,$F0,$02,$A9,$01,$DD,$A8,$04   ;099DFF|        |099DF1;
                       db $F0,$09,$A5,$00,$18,$69,$10,$29   ;099E07|        |099E12;
                       db $1F,$85,$00,$A5,$00,$29,$10,$F0   ;099E0F|        |A50085;
                       db $12,$A5,$00,$C9,$15,$B0,$04,$A9   ;099E17|        |0000A5;
                       db $15,$D0,$18,$C9,$1C,$90,$14,$A9   ;099E1F|        |0000D0;
                       db $1B,$D0,$10,$A5,$00,$C9,$05,$B0   ;099E27|        |      ;
                       db $04,$A9,$05,$D0,$06,$C9,$0C,$90   ;099E2F|        |0000A9;
                       db $02,$A9,$0B,$9D,$65,$05,$4C,$66   ;099E37|        |      ;
                       db $9D                               ;099E3F|        |0940A9;
 
       UNREACH_099E40: db $A9,$40,$9D,$70,$04,$4C,$66,$9D   ;099E40|        |      ;
 
       UNREACH_099E48: db $AD,$1C,$04,$85,$05,$AD,$38,$04   ;099E48|        |09041C;
                       db $85,$04,$20,$30,$FF,$A5,$00,$85   ;099E50|        |000004;
                       db $06,$4A,$29,$0F,$85,$05,$A0,$01   ;099E58|        |00004A;
                       db $B1,$02,$85,$00,$C8,$B1,$02,$85   ;099E60|        |000002;
                       db $01,$C8,$B1,$02,$85,$02,$A5,$00   ;099E68|        |0000C8;
                       db $20,$66,$87,$B0,$03,$4C,$EA,$9E   ;099E70|        |098766;
                       db $84,$04,$A5,$02,$F0,$32,$C9,$01   ;099E78|        |000004;
                       db $D0,$03,$4C,$E3,$9E,$C9,$04,$F0   ;099E80|        |099E85;
                       db $43,$A9,$00,$99,$F2,$04,$99,$09   ;099E88|        |0000A9;
                       db $05,$99,$20,$05,$99,$37,$05,$A5   ;099E90|        |000099;
                       db $01,$38,$E9,$01,$99,$06,$06,$A5   ;099E98|        |000038;
                       db $02,$C9,$03,$F0,$03,$4C,$E3,$9E   ;099EA0|        |      ;
                       db $A5,$05,$99,$65,$05,$4C,$E3,$9E   ;099EA8|        |000005;
                       db $A4,$01,$88,$B9,$ED,$9E,$18,$65   ;099EB0|        |000001;
                       db $05,$29,$0F,$A4,$04,$99,$65,$05   ;099EB8|        |000029;
                       db $29,$08,$F0,$02,$A9,$01,$99,$A8   ;099EC0|        |      ;
                       db $04,$4C,$E3,$9E,$A4,$04,$A9,$00   ;099EC8|        |00004C;
                       db $99,$C1,$05,$99,$00,$04,$99,$70   ;099ED0|        |0905C1;
                       db $04,$A5,$06,$99,$65,$05,$A9,$80   ;099ED8|        |0000A5;
                       db $99,$EF,$05,$C6,$01,$F0,$03,$4C   ;099EE0|        |0905EF;
                       db $6E,$9E,$4C,$66,$9D,$FF,$00,$01   ;099EE8|        |094C9E;
                       db $03,$03,$03,$03,$04,$04,$04,$04   ;099EF0|        |000003;
                       db $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0D   ;099EF8|        |090C0C;
 
       UNREACH_099F00: db $A9,$18,$20,$66,$87,$90,$4E,$B9   ;099F00|        |      ;
                       db $1C,$04,$38,$E9,$20,$99,$1C,$04   ;099F08|        |093804;
                       db $AD,$38,$04,$38,$F9,$38,$04,$B0   ;099F10|        |090438;
                       db $05,$49,$FF,$18,$69,$01,$29,$F0   ;099F18|        |000049;
                       db $4A,$4A,$4A,$84,$05,$A8,$B9,$56   ;099F20|        |      ;
                       db $9F,$85,$00,$B9,$57,$9F,$85,$01   ;099F28|        |B90085;
                       db $BD,$A8,$04,$F0,$11,$A5,$00,$49   ;099F30|        |0904A8;
                       db $FF,$18,$69,$01,$85,$00,$A5,$01   ;099F38|        |016918;
                       db $49,$FF,$69,$00,$85,$01,$A4,$05   ;099F40|        |      ;
                       db $A5,$00,$99,$09,$05,$A5,$01,$99   ;099F48|        |000000;
                       db $F2,$04,$FE,$C1,$05,$60,$40,$00   ;099F50|        |000004;
                       db $50,$00,$A0,$00,$F0,$00,$40,$01   ;099F58|        |099F5A;
                       db $90,$01,$E0,$01,$30,$02,$80,$02   ;099F60|        |099F63;
                       db $D0,$02,$20,$03,$70,$03,$C0,$03   ;099F68|        |099F6C;
                       db $10,$04,$60,$04,$B0,$04           ;099F70|        |099F76;
 
       UNREACH_099F76: db $A9,$16,$85,$3F,$BD,$D8,$05,$D0   ;099F76|        |      ;
                       db $08,$FE,$C1,$05,$A9,$01,$85,$3F   ;099F7E|        |      ;
                       db $60,$A0,$01,$B1,$02,$D0,$0F,$BD   ;099F86|        |      ;
                       db $D8,$05,$29,$0F,$A8,$B9,$AC,$9F   ;099F8E|        |      ;
                       db $8D,$ED,$07,$4C,$A8,$9F,$BD,$D8   ;099F96|        |0907ED;
                       db $05,$29,$07,$A8,$B9,$BC,$9F,$8D   ;099F9E|        |000029;
                       db $ED,$07,$DE,$D8,$05,$60,$02,$03   ;099FA6|        |09DE07;
                       db $01,$07,$03,$06,$01,$09,$00,$05   ;099FAE|        |000007;
                       db $04,$01,$08,$02,$06,$00,$00,$03   ;099FB6|        |000001;
                       db $01,$02,$02,$01,$03,$00           ;099FBE|        |000002;
 
       UNREACH_099FC4: db $20,$3B,$A1,$A5,$1F,$0A,$0A,$0A   ;099FC4|        |09A13B;
                       db $0A,$C9,$D0,$90,$03,$18,$69,$80   ;099FCC|        |      ;
                       db $9D,$38,$04,$A9,$40,$9D,$1C,$04   ;099FD4|        |090438;
                       db $A9,$00,$9D,$F2,$04,$9D,$09,$05   ;099FDC|        |      ;
                       db $FE,$C1,$05,$20,$3B,$A1,$D0,$02   ;099FE4|        |0905C1;
                       db $A9,$01,$9D,$D8,$05,$A9,$88,$9D   ;099FEC|        |      ;
                       db $70,$04,$60                       ;099FF4|        |099FFA;
 
       UNREACH_099FF7: db $FE,$C1,$05,$A0,$01,$B1,$02,$85   ;099FF7|        |0905C1;
                       db $00,$C8,$B1,$02,$A8,$A5,$00,$4C   ;099FFF|        |      ;
                       db $5C,$EF                           ;09A007|        |3A4CEF;
 
       UNREACH_09A009: db $4C,$3A,$87                       ;09A009|        |09873A;
 
       UNREACH_09A00C: db $DE,$D8,$05,$F0,$12,$A9,$50,$9D   ;09A00C|        |0905D8;
                       db $70,$04,$BD,$D8,$05,$29,$03,$F0   ;09A014|        |09A01A;
                       db $09,$A9,$98,$9D,$70,$04,$60,$FE   ;09A01C|        |      ;
                       db $C1,$05,$60                       ;09A024|        |000005;
 
       UNREACH_09A027: db $A0,$01,$B1,$02,$0A,$A8,$B9,$3A   ;09A027|        |      ;
                       db $A0,$85,$00,$B9,$3B,$A0,$85,$01   ;09A02F|        |      ;
                       db $4C,$92,$A0,$40,$A0,$56,$A0,$6C   ;09A037|        |09A092;
                       db $A0,$04,$00,$FC,$00,$FA,$00,$06   ;09A03F|        |      ;
                       db $00,$00,$00,$F6,$00,$0A,$00,$F8   ;09A047|        |      ;
                       db $00,$FE,$00,$02,$00,$08,$00,$00   ;09A04F|        |      ;
                       db $00,$00,$00,$FE,$F8,$02,$F9,$00   ;09A057|        |      ;
                       db $F7,$00,$F8,$00,$F9,$00,$F8,$00   ;09A05F|        |000000;
                       db $F7,$00,$F8,$00,$F9,$00,$00,$00   ;09A067|        |000000;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;09A06F|        |      ;
                       db $F0,$00,$F9,$00,$F9,$00,$F9,$00   ;09A077|        |09A079;
                       db $F0,$00,$F9                       ;09A07F|        |09A081;
 
       UNREACH_09A082: db $A0,$01,$B1,$02,$0A,$A8,$B9,$B5   ;09A082|        |      ;
                       db $A0,$85,$00,$B9,$B6,$A0,$85,$01   ;09A08A|        |      ;
                       db $BD,$06,$06,$0A,$A8,$B1,$00,$18   ;09A092|        |090606;
                       db $7D,$38,$04,$9D,$38,$04,$C8,$B1   ;09A09A|        |090438;
                       db $00,$18,$7D,$1C,$04,$9D,$1C,$04   ;09A0A2|        |      ;
                       db $FE,$C1,$05,$A0,$02,$B1,$02,$9D   ;09A0AA|        |0905C1;
                       db $D8,$05,$60,$BB,$A0,$CB,$A0,$DB   ;09A0B2|        |      ;
                       db $A0,$04,$00,$FC,$00,$FA,$00,$06   ;09A0BA|        |      ;
                       db $00,$00,$00,$FC,$00,$06,$00,$FA   ;09A0C2|        |      ;
                       db $00,$00,$00,$00,$00,$FE,$F8,$02   ;09A0CA|        |      ;
                       db $F9,$00,$F7,$00,$F8,$00,$F9,$00   ;09A0D2|        |09F700;
                       db $F8,$00,$00,$00,$00,$00,$00,$00   ;09A0DA|        |      ;
                       db $00,$00,$00,$00,$F0,$00,$F9,$00   ;09A0E2|        |      ;
                       db $F9                               ;09A0EA|        |0901A0;
 
       UNREACH_09A0EB: db $A0,$01,$B1,$02,$9D,$65,$05,$4C   ;09A0EB|        |      ;
                       db $FE,$A0                           ;09A0F3|        |0920A0;
 
       UNREACH_09A0F5: db $20,$3B,$A1,$18,$69,$01,$9D,$D8   ;09A0F5|        |09A13B;
                       db $05,$4C,$66,$9D                   ;09A0FD|        |00004C;
 
       UNREACH_09A101: db $A9,$00,$85,$00,$A0,$01,$B9,$4E   ;09A101|        |      ;
                       db $05,$C9,$1A,$D0,$02,$E6,$00,$C8   ;09A109|        |0000C9;
                       db $C0,$0D,$D0,$F2,$A4,$00,$88,$D0   ;09A111|        |      ;
                       db $09,$A9,$88,$9D,$70,$04,$FE,$C1   ;09A119|        |      ;
                       db $05,$60,$4C,$3A,$87               ;09A121|        |000060;
 
       UNREACH_09A126: db $A9,$02,$8D,$F3,$07,$A9,$00,$20   ;09A126|        |      ;
                       db $F4,$87,$90,$03,$4C,$3A,$87,$A9   ;09A12E|        |099087;
                       db $01,$8D,$F3,$07,$60,$A5,$1F,$D0   ;09A136|        |00008D;
                       db $02,$A9,$65,$0A,$85,$00,$A5,$1F   ;09A13E|        |      ;
                       db $4A,$18,$65,$00,$85,$1F,$29,$0F   ;09A146|        |      ;
                       db $60                               ;09A14E|        |      ;
 
  entiyIndex_stuff_01: LDA.B #$00                           ;09A14F|A900    |      ;
                       STA.W $0657,X                        ;09A151|9D5706  |090657;
                       JSR.W CODE_09A4C3                    ;09A154|20C3A4  |09A4C3;
                       BNE CODE_09A178                      ;09A157|D01F    |09A178;
                       LDA.B #$40                           ;09A159|A940    |      ;
                       STA.W $0470,X                        ;09A15B|9D7004  |090470;
                       LDA.B #$01                           ;09A15E|A901    |      ;
                       STA.W $04A8,X                        ;09A160|9DA804  |0904A8;
                       LDA.B #$0C                           ;09A163|A90C    |      ;
                       STA.W $0565,X                        ;09A165|9D6505  |090565;
                       LDA.B #$10                           ;09A168|A910    |      ;
                       LDY.B #$26                           ;09A16A|A026    |      ;
                       db $20                               ;09A16C|        |      ;
                       dw CODE_0FEF6E                       ;09A16D|        |0FEF6E;
                       LDA.B r_bossActiveFlag               ;09A16F|A578    |000078;
                       BEQ CODE_09A192                      ;09A171|F01F    |09A192;
                       LDA.B #$44                           ;09A173|A944    |      ;
                       JMP.W setEnityAi_scriptInex          ;09A175|4C4F86  |09864F;
 
 
          CODE_09A178: LDA.W $05C1,X                        ;09A178|BDC105  |0905C1;
                       CMP.B #$08                           ;09A17B|C908    |      ;
                       BNE CODE_09A192                      ;09A17D|D013    |09A192;
                       LDA.B #$00                           ;09A17F|A900    |      ;
                       STA.W $0633,X                        ;09A181|9D3306  |090633;
                       STA.W $05EF,X                        ;09A184|9DEF05  |0905EF;
                       STA.W $05C1,X                        ;09A187|9DC105  |0905C1;
 
          CODE_09A18A: LDA.W $07F3                          ;09A18A|ADF307  |0907F3;
                       AND.B #$7F                           ;09A18D|297F    |      ;
                       STA.W $07F3                          ;09A18F|8DF307  |0907F3;
 
          CODE_09A192: RTS                                  ;09A192|60      |      ;
 
                       LDA.B #$00                           ;09A193|A900    |      ;
                       STA.W $0669,X                        ;09A195|9D6906  |090669;
                       STA.W $0657,X                        ;09A198|9D5706  |090657;
                       LDA.B #$C8                           ;09A19B|A9C8    |      ;
                       STA.W $0470,X                        ;09A19D|9D7004  |090470;
                       LDY.W $061D,X                        ;09A1A0|BC1D06  |09061D;
                       LDA.W $05EF,Y                        ;09A1A3|B9EF05  |0905EF;
                       AND.B #$7F                           ;09A1A6|297F    |      ;
                       CMP.B #$0A                           ;09A1A8|C90A    |      ;
                       BNE CODE_09A1DB                      ;09A1AA|D02F    |09A1DB;
                       LDA.W $05C1,Y                        ;09A1AC|B9C105  |0905C1;
                       CMP.B #$06                           ;09A1AF|C906    |      ;
                       BNE CODE_09A1D2                      ;09A1B1|D01F    |09A1D2;
                       LDA.B #$1C                           ;09A1B3|A91C    |      ;
                       STA.B $00                            ;09A1B5|8500    |000000;
                       LDA.W $04A8,Y                        ;09A1B7|B9A804  |0904A8;
                       BEQ CODE_09A1C0                      ;09A1BA|F004    |09A1C0;
                       LDA.B #$E4                           ;09A1BC|A9E4    |      ;
                       STA.B $00                            ;09A1BE|8500    |000000;
 
          CODE_09A1C0: LDA.W $0438,Y                        ;09A1C0|B93804  |090438;
                       CLC                                  ;09A1C3|18      |      ;
                       ADC.B $00                            ;09A1C4|6500    |000000;
                       STA.W $0438,X                        ;09A1C6|9D3804  |090438;
                       LDA.W $041C,Y                        ;09A1C9|B91C04  |09041C;
                       STA.W $041C,X                        ;09A1CC|9D1C04  |09041C;
                       JMP.W CODE_09A1DE                    ;09A1CF|4CDEA1  |09A1DE;
 
 
          CODE_09A1D2: LDA.B #$20                           ;09A1D2|A920    |      ;
                       STA.W $0438,X                        ;09A1D4|9D3804  |090438;
                       STA.W $041C,X                        ;09A1D7|9D1C04  |09041C;
                       RTS                                  ;09A1DA|60      |      ;
 
 
          CODE_09A1DB: JMP.W CODE_09873A                    ;09A1DB|4C3A87  |09873A;
 
 
          CODE_09A1DE: LDA.W $07F6                          ;09A1DE|ADF607  |0907F6;
                       BNE UNREACH_09A1F1                   ;09A1E1|D00E    |09A1F1;
                       LDA.B r_stage                        ;09A1E3|A532    |000032;
                       BEQ CODE_09A1EB                      ;09A1E5|F004    |09A1EB;
                       LDA.B #$20                           ;09A1E7|A920    |      ;
                       BNE CODE_09A1ED                      ;09A1E9|D002    |09A1ED;
 
          CODE_09A1EB: LDA.B #$10                           ;09A1EB|A910    |      ;
 
          CODE_09A1ED: STA.W $0657,X                        ;09A1ED|9D5706  |090657;
                       RTS                                  ;09A1F0|60      |      ;
 
 
       UNREACH_09A1F1: db $A9,$30,$D0,$F8,$20,$DE,$A1,$AC   ;09A1F1|        |      ;
                       db $F3,$07,$88,$D0,$21,$20,$C3,$A4   ;09A1F9|        |000007;
                       db $C9,$31,$F0,$14,$A9,$10,$20,$61   ;09A201|        |      ;
                       db $86,$20,$C8,$FE,$A9,$10,$A0,$03   ;09A209|        |000020;
                       db $20,$6E,$EF,$A9,$31,$4C,$4F,$86   ;09A211|        |09EF6E;
                       db $A9,$00,$9D,$57,$06,$60,$A9,$00   ;09A219|        |      ;
                       db $20,$F4,$87,$A5,$32,$F0,$1E,$BD   ;09A221|        |0987F4;
                       db $69,$06,$F0,$19,$20,$0B,$87,$90   ;09A229|        |      ;
                       db $14,$8A,$99,$06,$06,$BD,$8D,$06   ;09A231|        |00008A;
                       db $99,$8D,$06,$A9,$80,$99,$EF,$05   ;09A239|        |09068D;
                       db $A9,$88,$99,$70,$04,$A5,$32,$F0   ;09A241|        |      ;
                       db $02,$A9,$03,$85,$00,$BD,$57,$06   ;09A249|        |      ;
                       db $29,$03,$D0,$05,$A5,$00,$18,$69   ;09A251|        |      ;
                       db $01,$20,$E0,$88,$BD,$69,$06,$29   ;09A259|        |000020;
                       db $0F,$C9,$02,$F0,$0C,$20,$C3,$A4   ;09A261|        |F002C9;
                       db $C9,$0A,$D0,$05,$A9,$00,$9D,$69   ;09A269|        |      ;
                       db $06,$BD,$38,$04,$10,$0E,$C9,$FB   ;09A271|        |0000BD;
                       db $90,$13,$20,$FD,$A2,$A9,$FA,$9D   ;09A279|        |09A28E;
                       db $38,$04,$D0,$09,$C9,$02,$B0,$05   ;09A281|        |      ;
                       db $A9,$02,$9D,$38,$04,$20,$08,$86   ;09A289|        |      ;
                       db $20,$C3,$A4,$D0,$03,$4C,$29,$A3   ;09A291|        |09A4C3;
                       db $C9,$01,$D0,$49,$BD,$1C,$04,$C9   ;09A299|        |      ;
                       db $A8,$B0,$14,$A5,$17,$F0,$04,$A9   ;09A2A1|        |      ;
                       db $FC,$D0,$02,$A9,$04,$A0,$1C,$20   ;09A2A9|        |0902D0;
                       db $1E,$FC,$D0,$03,$4C,$2A,$A4,$BD   ;09A2B1|        |09D0FC;
                       db $A8,$04,$F0,$04,$A9,$F4,$D0,$02   ;09A2B9|        |      ;
                       db $A9,$0C,$85,$00,$A0,$10,$20,$1E   ;09A2C1|        |      ;
                       db $FC,$F0,$09,$20,$F0,$A2,$90,$01   ;09A2C9|        |0909F0;
                       db $60,$4C,$35,$A4,$A5,$00,$A0,$04   ;09A2D1|        |      ;
                       db $20,$1E,$FC,$F0,$11,$20,$F0,$A2   ;09A2D9|        |09FC1E;
                       db $B0,$0C,$4C,$3C,$A4,$C9,$0A,$F0   ;09A2E1|        |09A2EF;
                       db $05,$A9,$00,$9D,$33,$06,$60,$A5   ;09A2E9|        |0000A9;
                       db $32,$C9,$07,$D0,$31,$BD,$38,$04   ;09A2F1|        |0000C9;
                       db $C9,$30,$B0,$2A,$BD,$A8,$04,$49   ;09A2F9|        |      ;
                       db $01,$9D,$A8,$04,$BD,$65,$05,$18   ;09A301|        |00009D;
                       db $69,$08,$29,$0F,$9D,$65,$05,$BD   ;09A309|        |      ;
                       db $09,$05,$49,$FF,$18,$69,$01,$9D   ;09A311|        |      ;
                       db $09,$05,$BD,$F2,$04,$49,$FF,$69   ;09A319|        |      ;
                       db $00,$9D,$F2,$04,$38,$60,$18,$60   ;09A321|        |      ;
                       db $A5,$17,$DD,$A8,$04,$F0,$03,$4C   ;09A329|        |000017;
                       db $C5,$A3,$A5,$00,$C9,$50,$90,$03   ;09A331|        |0000A3;
                       db $4C,$C5,$A3,$C9,$30,$90,$4A,$38   ;09A339|        |09A3C5;
                       db $AD,$1C,$04,$E9,$08,$FD,$1C,$04   ;09A341|        |09041C;
                       db $B0,$05,$49,$FF,$18,$69,$01,$C9   ;09A349|        |09A350;
                       db $08,$90,$02,$B0,$6F,$A5,$28,$29   ;09A351|        |      ;
                       db $40,$D0,$54,$BD,$33,$06,$D0,$64   ;09A359|        |      ;
                       db $A9,$22,$20,$66,$87,$90,$09,$8A   ;09A361|        |      ;
                       db $99,$1D,$06,$A9,$C8,$99,$70,$04   ;09A369|        |09061D;
                       db $BD,$1D,$06,$29,$7F,$9D,$1D,$06   ;09A371|        |09061D;
                       db $A9,$01,$9D,$33,$06,$A9,$0A,$A0   ;09A379|        |      ;
                       db $01,$20,$6E,$EF,$A9,$0A,$4C,$4F   ;09A381|        |000020;
                       db $86,$BD,$1D,$06,$29,$80,$D0,$34   ;09A389|        |0000BD;
                       db $BD,$1D,$06,$09,$80,$9D,$1D,$06   ;09A391|        |09061D;
                       db $A5,$17,$9D,$A8,$04,$20,$43,$86   ;09A399|        |000017;
                       db $9D,$65,$05,$A9,$0A,$A0,$00,$20   ;09A3A1|        |090565;
                       db $6E,$EF,$A9,$0C,$4C,$4F,$86,$A5   ;09A3A9|        |09A9EF;
                       db $32,$F0,$05,$A9,$13,$9D,$57,$06   ;09A3B1|        |0000F0;
                       db $A9,$10,$A0,$4B,$20,$6E,$EF,$A9   ;09A3B9|        |      ;
                       db $09,$4C,$4F,$86,$BD,$4E,$05,$29   ;09A3C1|        |      ;
                       db $1F,$C9,$01,$D0,$3A,$A5,$32,$D0   ;09A3C9|        |D001C9;
                       db $1B,$BD,$38,$04,$C9,$18,$B0,$2F   ;09A3D1|        |      ;
                       db $BD,$1C,$04,$C9,$8C,$B0,$2E,$A9   ;09A3D9|        |09041C;
                       db $04,$9D,$65,$05,$A9,$00,$9D,$A8   ;09A3E1|        |00009D;
                       db $04,$4C,$3C,$A4,$BD,$38,$04,$C9   ;09A3E9|        |00004C;
                       db $E8,$90,$14,$BD,$1C,$04,$C9,$8C   ;09A3F1|        |      ;
                       db $B0,$13,$A9,$0C,$9D,$65,$05,$A9   ;09A3F9|        |09A40E;
                       db $01,$9D,$A8,$04,$4C,$3C,$A4,$A5   ;09A401|        |00009D;
                       db $1F,$C9,$80,$90,$11,$A5,$00,$C9   ;09A409|        |9080C9;
                       db $08,$90,$0B,$A5,$17,$9D,$A8,$04   ;09A411|        |      ;
                       db $20,$43,$86,$9D,$65,$05,$A9,$0A   ;09A419|        |098643;
                       db $A0,$0D,$20,$6E,$EF,$A9,$01,$D0   ;09A421|        |      ;
                       db $17,$A9,$0A,$A0,$04,$20,$6E,$EF   ;09A429|        |0000A9;
                       db $A9,$62,$D0,$0C,$20,$44,$A4,$A9   ;09A431|        |      ;
                       db $0B,$D0,$05,$20,$44,$A4,$A9,$02   ;09A439|        |      ;
                       db $4C,$4F,$86,$A9,$0A,$A0,$04,$4C   ;09A441|        |09864F;
                       db $6E,$EF,$20,$B6,$A4,$BD,$69,$06   ;09A449|        |0920EF;
                       db $D0,$40,$AD,$F3,$07,$D0,$3B,$20   ;09A451|        |09A493;
                       db $C3,$A4,$D0,$11,$A9,$87,$20,$4F   ;09A459|        |0000A4;
                       db $86,$A9,$0A,$A0,$05,$20,$6E,$EF   ;09A461|        |0000A9;
                       db $A9,$40,$9D,$70,$04,$BD,$38,$04   ;09A469|        |      ;
                       db $C9,$FC,$90,$02,$A9,$FB,$C9,$04   ;09A471|        |      ;
                       db $B0,$02,$A9,$04,$9D,$38,$04,$BD   ;09A479|        |09A47D;
                       db $1C,$04,$C9,$F8,$90,$02,$A9,$F7   ;09A481|        |09C904;
                       db $C9,$40,$B0,$02,$A9,$40,$9D,$1C   ;09A489|        |      ;
                       db $04,$60,$A9,$00,$9D,$57,$06,$BC   ;09A491|        |000060;
                       db $06,$06,$B9,$06,$06,$F0,$0A,$38   ;09A499|        |000006;
                       db $E9,$01,$B0,$02,$A9,$00,$99,$06   ;09A4A1|        |      ;
                       db $06,$20,$C3,$A4,$C9,$32,$F0,$E1   ;09A4A9|        |000020;
                       db $A9,$32,$4C,$4F,$86,$A9,$20,$AC   ;09A4B1|        |      ;
                       db $F6,$07,$F0,$02,$A9,$30,$9D,$57   ;09A4B9|        |000007;
                       db $06,$60                           ;09A4C1|        |000060;
 
          CODE_09A4C3: LDA.W $05EF,X                        ;09A4C3|BDEF05  |0905EF;
                       AND.B #$7F                           ;09A4C6|297F    |      ;
                       RTS                                  ;09A4C8|60      |      ;
 
 
  entiyIndex_stuff_02: LDA.B r_bossActiveFlag               ;09A4C9|A578    |000078;
                       BEQ CODE_09A4DA                      ;09A4CB|F00D    |09A4DA;
                       LDA.W $05D8,X                        ;09A4CD|BDD805  |0905D8;
                       CMP.B #$80                           ;09A4D0|C980    |      ;
                       BCS CODE_09A4F2                      ;09A4D2|B01E    |09A4F2;
                       INC.W $05D8,X                        ;09A4D4|FED805  |0905D8;
                       JMP.W entiyIndex_stuff_yX            ;09A4D7|4CE7A4  |09A4E7;
 
 
          CODE_09A4DA: JSR.W CODE_0985EE                    ;09A4DA|20EE85  |0985EE;
                       JSR.W entiyIndex_stuff_yX            ;09A4DD|20E7A4  |09A4E7;
                       LDA.B #$10                           ;09A4E0|A910    |      ;
                       LDY.B #$06                           ;09A4E2|A006    |      ;
                       db $4C                               ;09A4E4|        |      ;
 
                       dw CODE_0FEF6E                       ;09A4E5|        |0FEF6E;
 
  entiyIndex_stuff_yX: LDA.B #$01                           ;09A4E7|A901    |      ;
                       STA.W $04A8,X                        ;09A4E9|9DA804  |0904A8;
                       LDA.B #$0C                           ;09A4EC|A90C    |      ;
                       STA.W $0565,X                        ;09A4EE|9D6505  |090565;
 
          CODE_09A4F1: RTS                                  ;09A4F1|60      |      ;
 
 
          CODE_09A4F2: JSR.W CODE_09A500                    ;09A4F2|2000A5  |09A500;
                       LDA.B #$00                           ;09A4F5|A900    |      ;
                       STA.W $0606,X                        ;09A4F7|9D0606  |090606;
                       STA.W $05D8,X                        ;09A4FA|9DD805  |0905D8;
                       JMP.W CODE_09A18A                    ;09A4FD|4C8AA1  |09A18A;
 
 
          CODE_09A500: LDA.B #$02                           ;09A500|A902    |      ;
                       STA.B r_collisionPointXvalDiv32      ;09A502|8512    |000012;
                       LDA.B #$1F                           ;09A504|A91F    |      ;
                       STA.B r_collisionPointAbsoluteXInRoom;09A506|8513    |000013;
 
          CODE_09A508: LDA.B r_collisionPointAbsoluteXInRoom;09A508|A513    |000013;
                       JSR.W CODE_098766                    ;09A50A|206687  |098766;
                       BCC CODE_09A4F1                      ;09A50D|90E2    |09A4F1;
                       LDA.B r_collisionPointXvalDiv32      ;09A50F|A512    |000012;
                       STA.W $061D,Y                        ;09A511|991D06  |09061D;
                       LDA.B #$C8                           ;09A514|A9C8    |      ;
                       STA.W $0470,Y                        ;09A516|997004  |090470;
                       TXA                                  ;09A519|8A      |      ;
                       STA.W $0633,Y                        ;09A51A|993306  |090633;
                       LDA.B #$40                           ;09A51D|A940    |      ;
                       STA.W $067B,Y                        ;09A51F|997B06  |09067B;
                       INC.B r_collisionPointAbsoluteXInRoom;09A522|E613    |000013;
                       DEC.B r_collisionPointXvalDiv32      ;09A524|C612    |000012;
                       BNE CODE_09A508                      ;09A526|D0E0    |09A508;
                       LDA.B r_collisionPointXvalDiv32      ;09A528|A512    |000012;
                       STA.W $061D,X                        ;09A52A|9D1D06  |09061D;
                       JMP.W entiyIndex_stuff_yX            ;09A52D|4CE7A4  |09A4E7;
 
                       db $AD,$F3,$07,$F0,$03,$4C,$DC,$A5   ;09A530|        |0907F3;
                       db $A9,$00,$9D,$57,$06,$9D,$69,$06   ;09A538|        |      ;
                       db $BC,$33,$06,$B9,$EF,$05,$29,$7F   ;09A540|        |090633;
                       db $C9,$0E,$D0,$2F,$B9,$C1,$05,$C9   ;09A548|        |      ;
                       db $05,$90,$28,$A9,$30,$9D,$57,$06   ;09A550|        |000090;
                       db $BC,$33,$06,$A9,$10,$85,$00,$B9   ;09A558|        |090633;
                       db $A8,$04,$F0,$04,$A9,$F0,$85,$00   ;09A560|        |      ;
                       db $B9,$38,$04,$18,$65,$00,$9D,$38   ;09A568|        |090438;
                       db $04,$B9,$1C,$04,$18,$69,$10,$9D   ;09A570|        |0000B9;
                       db $1C,$04,$60,$A9,$00,$9D,$38,$04   ;09A578|        |096004;
                       db $9D,$1C,$04,$60,$AD,$F3,$07,$D0   ;09A580|        |09041C;
                       db $53,$BC,$33,$06,$B9,$EF,$05,$29   ;09A588|        |0000BC;
                       db $7F,$C9,$2F,$F0,$46,$B9,$38,$04   ;09A590|        |F02FC9;
                       db $9D,$38,$04,$B9,$1C,$04,$38,$E9   ;09A598|        |090438;
                       db $18,$9D,$1C,$04,$20,$DE,$A1,$A5   ;09A5A0|        |      ;
                       db $3D,$9D,$7B,$06,$A9,$02,$20,$E0   ;09A5A8|        |097B9D;
                       db $88,$BC,$33,$06,$BD,$7B,$06,$99   ;09A5B0|        |      ;
                       db $7B,$06,$A9,$00,$9D,$69,$06,$B9   ;09A5B8|        |      ;
                       db $69,$06,$29,$0F,$C9,$02,$F0,$0E   ;09A5C0|        |      ;
                       db $B9,$EF,$05,$29,$7F,$C9,$0D,$D0   ;09A5C8|        |0905EF;
                       db $05,$A9,$00,$9D,$69,$06,$A9,$C8   ;09A5D0|        |0000A9;
                       db $9D,$70,$04,$60,$4C,$3A,$87,$20   ;09A5D8|        |090470;
                       db $C3,$A4,$C9,$2F,$F0,$7F,$A9,$00   ;09A5E0|        |0000A4;
                       db $9D,$54,$04,$BD,$06,$06,$F0,$46   ;09A5E8|        |090454;
                       db $A9,$20,$9D,$70,$04,$BD,$06,$06   ;09A5F0|        |      ;
                       db $29,$04,$F0,$04,$A9,$00,$F0,$02   ;09A5F8|        |      ;
                       db $A9,$02,$9D,$54,$04,$DE,$06,$06   ;09A600|        |      ;
                       db $D0,$2B,$BD,$7B,$06,$38,$E9,$10   ;09A608|        |09A635;
                       db $B0,$02,$A9,$00,$9D,$7B,$06,$85   ;09A610|        |09A614;
                       db $3D,$A0,$0D,$B9,$4E,$05,$C9,$02   ;09A618|        |090DA0;
                       db $D0,$10,$BD,$1D,$06,$C9,$01,$D0   ;09A620|        |09A632;
                       db $09,$BD,$7B,$06,$99,$7B,$06,$4C   ;09A628|        |      ;
                       db $36,$A6,$88,$D0,$E6,$60,$A9,$40   ;09A630|        |0000A6;
                       db $9D,$70,$04,$AD,$EC,$07,$F0,$25   ;09A638|        |090470;
                       db $AD,$F6,$05,$C9,$91,$F0,$1E,$AD   ;09A640|        |0905F6;
                       db $C8,$05,$C9,$05,$90,$17,$AD,$3F   ;09A648|        |      ;
                       db $04,$38,$FD,$38,$04,$B0,$05,$49   ;09A650|        |000038;
                       db $FF,$18,$69,$01,$C9,$10,$B0,$05   ;09A658|        |016918;
                       db $A9,$40,$9D,$06,$06,$AD,$F3,$07   ;09A660|        |      ;
                       db $C9,$01,$F0,$08,$A9,$30,$9D,$57   ;09A668|        |      ;
                       db $06,$4C,$FD,$A6,$20,$C3,$A4,$C9   ;09A670|        |00004C;
                       db $2F,$F0,$4A,$A5,$32,$C9,$02,$F0   ;09A678|        |A54AF0;
                       db $29,$A0,$01,$86,$00,$C4,$00,$F0   ;09A680|        |      ;
                       db $1A,$A9,$00,$99,$4E,$05,$99,$EF   ;09A688|        |      ;
                       db $05,$99,$00,$04,$99,$8C,$04,$99   ;09A690|        |000099;
                       db $06,$06,$99,$1D,$06,$99,$33,$06   ;09A698|        |000006;
                       db $99,$45,$06,$C8,$C0,$0D,$D0,$DD   ;09A6A0|        |090645;
                       db $F0,$07,$8A,$48,$20,$04,$9D,$68   ;09A6A8|        |09A6B1;
                       db $AA,$A9,$30,$20,$61,$86,$20,$C8   ;09A6B0|        |      ;
                       db $FE,$A9,$10,$A0,$06,$20,$6E,$EF   ;09A6B8|        |0910A9;
                       db $A9,$2F,$4C,$4F,$86,$A5,$32,$C9   ;09A6C0|        |      ;
                       db $02,$F0,$31,$BD,$C1,$05,$C9,$09   ;09A6C8|        |      ;
                       db $D0,$2A,$EE,$EE,$07,$AD,$F3,$07   ;09A6D0|        |09A6FC;
                       db $09,$81,$8D,$F3,$07,$A9,$00,$9D   ;09A6D8|        |      ;
                       db $06,$06,$9D,$1D,$06,$9D,$33,$06   ;09A6E0|        |000006;
                       db $9D,$EF,$05,$9D,$C1,$05,$A9,$09   ;09A6E8|        |0905EF;
                       db $9D,$4E,$05,$BD,$1C,$04,$38,$E9   ;09A6F0|        |09054E;
                       db $10,$9D,$1C,$04,$60,$A9,$00,$20   ;09A6F8|        |09A697;
                       db $F4,$87,$AD,$F3,$07,$29,$40,$F0   ;09A700|        |09AD87;
                       db $07,$A9,$20,$9D,$70,$04,$D0,$05   ;09A708|        |0000A9;
                       db $A9,$40,$9D,$70,$04,$BD,$69,$06   ;09A710|        |      ;
                       db $29,$0F,$C9,$02,$F0,$03,$20,$31   ;09A718|        |      ;
                       db $82,$20,$08,$86,$20,$C3,$A4,$C9   ;09A720|        |09AF43;
                       db $0E,$F0,$27,$C9,$10,$F0,$24,$A5   ;09A728|        |0927F0;
                       db $00,$C9,$1A,$B0,$1E,$20,$F2,$A7   ;09A730|        |      ;
                       db $C9,$10,$B0,$17,$BD,$A8,$04,$C5   ;09A738|        |      ;
                       db $17,$F0,$03,$20,$E0,$A7,$A9,$0A   ;09A740|        |0000F0;
                       db $A0,$08,$20,$6E,$EF,$A9,$0E,$4C   ;09A748|        |      ;
                       db $4F,$86,$60,$20,$C3,$A4,$F0,$21   ;09A750|        |206086;
                       db $BC,$38,$04,$BD,$A8,$04,$F0,$06   ;09A758|        |090438;
                       db $C0,$10,$90,$06,$B0,$13,$C0,$F0   ;09A760|        |      ;
                       db $90,$0F,$20,$E0,$A7,$A9,$0A,$A0   ;09A768|        |09A779;
                       db $06,$20,$6E,$EF,$A9,$0D,$4C,$4F   ;09A770|        |000020;
                       db $86,$20,$C3,$A4,$C9,$10,$D0,$01   ;09A778|        |000020;
                       db $60,$BD,$33,$06,$D0,$19,$BD,$38   ;09A780|        |      ;
                       db $04,$C9,$18,$90,$15,$C9,$E8,$B0   ;09A788|        |0000C9;
                       db $11,$A9,$48,$9D,$33,$06,$20,$3B   ;09A790|        |0000A9;
                       db $A1,$C9,$0A,$B0,$02,$90,$28,$DE   ;09A798|        |0000C9;
                       db $33,$06,$A5,$17,$DD,$A8,$04,$F0   ;09A7A0|        |000006;
                       db $11,$BD,$45,$06,$D0,$07,$A5,$1F   ;09A7A8|        |0000BD;
                       db $0A,$0A,$9D,$45,$06,$DE,$45,$06   ;09A7B0|        |      ;
                       db $F0,$B0,$20,$C3,$A4,$F0,$04,$C9   ;09A7B8|        |09A76A;
                       db $0D,$F0,$03,$4C,$6D,$A7,$60,$20   ;09A7C0|        |0903F0;
                       db $F2,$A7,$C9,$08,$B0,$D4,$20,$43   ;09A7C8|        |0000A7;
                       db $86,$9D,$65,$05,$A9,$0A,$A0,$07   ;09A7D0|        |00009D;
                       db $20,$6E,$EF,$A9,$10,$4C,$4F,$86   ;09A7D8|        |09EF6E;
                       db $BD,$A8,$04,$49,$01,$29,$01,$9D   ;09A7E0|        |0904A8;
                       db $A8,$04,$A8,$B9,$01,$A8,$9D,$65   ;09A7E8|        |      ;
                       db $05,$60,$AD,$1C,$04,$38,$FD,$1C   ;09A7F0|        |000060;
                       db $04,$B0,$05,$49,$FF,$18,$69,$01   ;09A7F8|        |0000B0;
                       db $60,$04,$0C,$AD,$F3,$07,$10,$03   ;09A800|        |      ;
                       db $4C,$3A,$87,$20,$C8,$FE,$A9,$80   ;09A808|        |09873A;
                       db $9D,$EF,$05,$AD,$EC,$07,$F0,$10   ;09A810|        |0905EF;
                       db $C9,$02,$90,$06,$A9,$58,$9D,$70   ;09A818|        |      ;
                       db $04,$60,$A9,$50,$9D,$70,$04,$60   ;09A820|        |000060;
                       db $BD,$45,$06,$29,$80,$D0,$1C,$BD   ;09A828|        |090645;
                       db $33,$06,$D0,$13,$A9,$08,$9D,$33   ;09A830|        |000006;
                       db $06,$A9,$50,$9D,$70,$04,$BD,$45   ;09A838|        |0000A9;
                       db $06,$09,$80,$9D,$45,$06,$60,$DE   ;09A840|        |000009;
                       db $33,$06,$60,$BD,$33,$06,$D0,$F7   ;09A848|        |000006;
                       db $A9,$58,$9D,$70,$04,$FE,$45,$06   ;09A850|        |      ;
                       db $BD,$45,$06,$29,$7F,$A8,$C0,$10   ;09A858|        |090645;
                       db $D0,$02,$A0,$00,$98,$9D,$45,$06   ;09A860|        |09A864;
                       db $B9,$6F,$A8,$9D,$33,$06,$60,$40   ;09A868|        |09A86F;
                       db $20,$80,$10,$60,$90,$30,$C0,$08   ;09A870|        |091080;
                       db $70,$F0,$50,$D0,$A0,$E0,$B0,$20   ;09A878|        |09A86A;
                       db $DE,$A1,$AD,$F3,$07,$F0,$03,$4C   ;09A880|        |09ADA1;
                       db $3A,$87,$20,$C3,$A4,$C9,$0F,$D0   ;09A888|        |      ;
                       db $01,$60,$AD,$EC,$07,$D0,$3A,$20   ;09A890|        |000060;
                       db $1D,$A9,$D0,$21,$BD,$70,$04,$09   ;09A898|        |09D0A9;
                       db $98,$9D,$70,$04,$A9,$00,$9D,$D8   ;09A8A0|        |      ;
                       db $05,$A9,$80,$9D,$45,$06,$A9,$01   ;09A8A8|        |0000A9;
                       db $8D,$EC,$07,$A9,$D8,$9D,$70,$04   ;09A8B0|        |0907EC;
                       db $A9,$0F,$4C,$4F,$86,$DE,$45,$06   ;09A8B8|        |      ;
                       db $10,$0E,$BC,$45,$06,$C8,$D0,$08   ;09A8C0|        |09A8D0;
                       db $BD,$D8,$05,$F0,$03,$DE,$D8,$05   ;09A8C8|        |0905D8;
                       db $60,$BD,$C1,$05,$8D,$EC,$07,$20   ;09A8D0|        |      ;
                       db $C3,$A4,$D0,$1D,$A9,$00,$8D,$EC   ;09A8D8|        |0000A4;
                       db $07,$9D,$45,$06,$A9,$01,$9D,$D8   ;09A8E0|        |00009D;
                       db $05,$A9,$D8,$9D,$70,$04,$A9,$48   ;09A8E8|        |0000A9;
                       db $9D,$38,$04,$9D,$1C,$04,$20,$26   ;09A8F0|        |090438;
                       db $A9,$BD,$EF,$05,$C9,$0F,$D0,$14   ;09A8F8|        |      ;
                       db $BD,$C1,$05,$C9,$05,$90,$0D,$C9   ;09A900|        |0905C1;
                       db $08,$B0,$09,$BD,$70,$04,$29,$EF   ;09A908|        |      ;
                       db $9D,$70,$04,$60,$BD,$70,$04,$09   ;09A910|        |090470;
                       db $10,$9D,$70,$04,$60,$BD,$45,$06   ;09A918|        |09A8B7;
                       db $D0,$03,$BD,$D8,$05,$60,$A9,$03   ;09A920|        |09A925;
                       db $9D,$D8,$05,$A9,$80,$9D,$45,$06   ;09A928|        |0905D8;
                       db $60                               ;09A930|        |      ;
 
  entiyIndex_stuff_04: LDA.B r_bossActiveFlag               ;09A931|A578    |000078;
                       BEQ UNREACH_09A953                   ;09A933|F01E    |09A953;
                       JSR.W CODE_09A4C3                    ;09A935|20C3A4  |09A4C3;
                       BNE UNREACH_09A94B                   ;09A938|D011    |09A94B;
                       DEC.W $05D8,X                        ;09A93A|DED805  |0905D8;
                       BNE UNREACH_09A95B                   ;09A93D|D01C    |09A95B;
                       LDA.B #$0A                           ;09A93F|A90A    |      ;
                       LDY.B #$20                           ;09A941|A020    |      ;
                       db $20                               ;09A943|        |      ;
                       dw CODE_0FEF5C                       ;09A944|        |0FEF5C;
                       LDA.B #$46                           ;09A946|A946    |      ;
                       JMP.W setEnityAi_scriptInex          ;09A948|4C4F86  |09864F;
 
 
       UNREACH_09A94B: db $BD,$C1,$05,$C9,$02,$F0,$1A,$60   ;09A94B|        |0905C1;
 
       UNREACH_09A953: db $20,$EE,$85,$A9,$80,$9D,$D8,$05   ;09A953|        |0985EE;
 
       UNREACH_09A95B: db $A9,$00,$9D,$A8,$04,$A9,$04,$9D   ;09A95B|        |      ;
                       db $65,$05,$A9,$0A,$A0,$1F,$4C,$5C   ;09A963|        |000005;
                       db $EF,$A9,$40,$9D,$70,$04,$20,$8A   ;09A96B|        |9D40A9;
                       db $A1,$A9,$00,$9D,$D8,$05,$9D,$EF   ;09A973|        |0000A9;
                       db $05,$9D,$C1,$05,$60,$A9,$00,$9D   ;09A97B|        |00009D;
                       db $4E,$05,$9D,$00,$04,$9D,$8C,$04   ;09A983|        |099D05;
                       db $F0,$EC,$9D,$00,$03,$E8,$60,$A5   ;09A98B|        |09A979;
                       db $3D,$D0,$03,$4C,$A5,$E6,$20,$C3   ;09A993|        |0903D0;
                       db $A4,$C9,$48,$D0,$07,$A9,$00,$85   ;09A99B|        |0000C9;
                       db $BA,$4C,$56,$AB,$A9,$FF,$85,$BA   ;09A9A3|        |      ;
                       db $BD,$06,$06,$D0,$06,$8D,$EC,$07   ;09A9AB|        |090606;
                       db $8D,$EE,$07,$A0,$02,$BD,$1D,$06   ;09A9B3|        |0907EE;
                       db $F0,$09,$29,$08,$D0,$01,$88,$98   ;09A9BB|        |09A9C6;
                       db $9D,$54,$04,$BD,$38,$04,$C9,$04   ;09A9C3|        |090454;
                       db $B0,$02,$A9,$04,$C9,$FC,$90,$02   ;09A9CB|        |09A9CF;
                       db $A9,$FB,$9D,$38,$04,$BD,$1C,$04   ;09A9D3|        |      ;
                       db $C9,$40,$B0,$02,$A9,$40,$C9,$A0   ;09A9DB|        |      ;
                       db $90,$02,$A9,$9F,$9D,$1C,$04,$BC   ;09A9E3|        |09A9E7;
                       db $1D,$06,$F0,$0D,$88,$F0,$76,$98   ;09A9EB|        |09F006;
                       db $9D,$1D,$06,$A9,$0F,$9D,$8D,$06   ;09A9F3|        |09061D;
                       db $60,$BD,$65,$05,$29,$08,$F0,$02   ;09A9FB|        |      ;
                       db $A9,$01,$9D,$A8,$04,$BD,$69,$06   ;09AA03|        |      ;
                       db $29,$F0,$D0,$03,$4C,$A0,$AA,$A9   ;09AA0B|        |      ;
                       db $2B,$20,$5F,$E2,$A9,$00,$8D,$EE   ;09AA13|        |      ;
                       db $07,$9D,$69,$06,$20,$C8,$FE,$BD   ;09AA1B|        |00009D;
                       db $EF,$05,$29,$80,$9D,$EF,$05,$A0   ;09AA23|        |802905;
                       db $04,$BD,$06,$06,$D0,$02,$A0,$08   ;09AA2B|        |0000BD;
                       db $84,$00,$A5,$3D,$38,$E5,$00,$B0   ;09AA33|        |000000;
                       db $02,$A9,$00,$85,$3D,$BD,$06,$06   ;09AA3B|        |      ;
                       db $C9,$03,$D0,$16,$EC,$EC,$07,$D0   ;09AA43|        |      ;
                       db $05,$A9,$00,$8D,$EC,$07,$A0,$04   ;09AA4B|        |0000A9;
                       db $A9,$0E,$20,$5C,$EF,$A9,$C8,$4C   ;09AA53|        |      ;
                       db $4F,$86,$A9,$40,$9D,$1D,$06,$A9   ;09AA5B|        |40A986;
                       db $0F,$9D,$8D,$06,$60,$A9,$04,$20   ;09AA63|        |068D9D;
                       db $66,$87,$FE,$06,$06,$BD,$06,$06   ;09AA6B|        |000087;
                       db $99,$06,$06,$A9,$40,$99,$70,$04   ;09AA73|        |090606;
                       db $A9,$00,$9D,$1D,$06,$99,$1D,$06   ;09AA7B|        |      ;
                       db $9D,$54,$04,$99,$54,$04,$BD,$8D   ;09AA83|        |090454;
                       db $06,$29,$F0,$9D,$8D,$06,$99,$8D   ;09AA8B|        |000029;
                       db $06,$86,$17,$98,$AA,$20,$29,$AB   ;09AA93|        |000086;
                       db $A6,$17,$4C,$29,$AB,$20,$DE,$A1   ;09AA9B|        |000017;
                       db $BD,$06,$06,$0A,$A8,$B9,$86,$AB   ;09AAA3|        |090606;
                       db $85,$00,$B9,$87,$AB,$A4,$00,$20   ;09AAAB|        |000000;
                       db $1E,$FC,$85,$00,$BD,$06,$06,$D0   ;09AAB3|        |0985FC;
                       db $1B,$A5,$00,$F0,$17,$20,$C3,$A4   ;09AABB|        |      ;
                       db $D0,$12,$A5,$1F,$29,$01,$F0,$0C   ;09AAC3|        |09AAD7;
                       db $A9,$0A,$A0,$1F,$20,$5C,$EF,$A9   ;09AACB|        |      ;
                       db $09,$4C,$4F,$86,$20,$C3,$A4,$D0   ;09AAD3|        |      ;
                       db $54,$A0,$01,$B9,$4E,$05,$D0,$05   ;09AADB|        |      ;
                       db $C8,$C0,$0D,$D0,$F6,$84,$00,$E4   ;09AAE3|        |      ;
                       db $00,$D0,$28,$AD,$EE,$07,$F0,$05   ;09AAEB|        |      ;
                       db $C9,$03,$F0,$1F,$60,$A5,$1F,$C9   ;09AAF3|        |      ;
                       db $20,$B0,$18,$BD,$06,$06,$F0,$13   ;09AAFB|        |0918B0;
                       db $A9,$01,$8D,$EE,$07,$20,$3D,$AB   ;09AB03|        |      ;
                       db $20,$C3,$A4,$C9,$1A,$F0,$1E,$A9   ;09AB0B|        |09A4C3;
                       db $1A,$D0,$10,$A9,$00,$9D,$33,$06   ;09AB13|        |      ;
                       db $A5,$1F,$29,$01,$F0,$08,$20,$31   ;09AB1B|        |00001F;
                       db $AB,$A9,$19,$4C,$4F,$86,$20,$31   ;09AB23|        |      ;
                       db $AB,$A9,$18,$D0,$F6,$60,$A9,$1B   ;09AB2B|        |      ;
                       db $18,$7D,$06,$06,$A8,$A9,$0A,$4C   ;09AB33|        |      ;
                       db $5C,$EF,$A0,$01,$B9,$4E,$05,$C9   ;09AB3B|        |01A0EF;
                       db $04,$D0,$0A,$A9,$9A,$99,$EF,$05   ;09AB43|        |0000D0;
                       db $A9,$00,$99,$C1,$05,$C8,$C0,$0D   ;09AB4B|        |      ;
                       db $D0,$EA,$60,$BD,$C1,$05,$C9,$02   ;09AB53|        |09AB3F;
                       db $F0,$F8,$A9,$00,$85,$10,$A0,$01   ;09AB5B|        |09AB55;
                       db $B9,$4E,$05,$C9,$04,$D0,$02,$E6   ;09AB63|        |09054E;
                       db $10,$C8,$C0,$0D,$D0,$F2,$C6,$10   ;09AB6B|        |09AB35;
                       db $D0,$03,$20,$98,$AB,$20,$80,$A9   ;09AB73|        |09AB78;
                       db $A9,$68,$9D,$4E,$05,$A9,$65,$9D   ;09AB7B|        |      ;
                       db $EF,$05,$60,$F0,$08,$F8,$08,$F8   ;09AB83|        |F06005;
                       db $04,$FC,$04,$0F,$0F,$23,$1B,$FF   ;09AB8B|        |0000FC;
                       db $0F,$31,$23,$13,$FF               ;09AB93|        |132331;
 
       UNREACH_09AB98: db $A9,$50,$20,$61,$86,$A9,$02,$8D   ;09AB98|        |      ;
                       db $F3,$07,$20,$CE,$E5,$A9,$01,$20   ;09ABA0|        |000007;
                       db $F4,$87,$A9,$7B,$4C,$5F,$E2       ;09ABA8|        |09A987;
 
  entiyIndex_stuff_05: LDA.B r_bossActiveFlag               ;09ABAF|A578    |000078;
                       BEQ CODE_09ABBB                      ;09ABB1|F008    |09ABBB;
                       LDA.W $05C1,X                        ;09ABB3|BDC105  |0905C1;
                       CMP.B #$04                           ;09ABB6|C904    |      ;
                       BEQ CODE_09ABD4                      ;09ABB8|F01A    |09ABD4;
                       RTS                                  ;09ABBA|60      |      ;
 
 
          CODE_09ABBB: LDA.B #$CC                           ;09ABBB|A9CC    |      ;
                       STA.W $0470,X                        ;09ABBD|9D7004  |090470;
                       LDA.B #$00                           ;09ABC0|A900    |      ;
                       STA.W $04A8,X                        ;09ABC2|9DA804  |0904A8;
                       STA.W $0565,X                        ;09ABC5|9D6505  |090565;
                       LDA.B #$0A                           ;09ABC8|A90A    |      ;
                       LDY.B #$24                           ;09ABCA|A024    |      ;
                       db $20                               ;09ABCC|        |      ;
                       dw CODE_0FEF5C                       ;09ABCD|        |0FEF5C;
                       LDA.B #$45                           ;09ABCF|A945    |      ;
                       JMP.W setEnityAi_scriptInex          ;09ABD1|4C4F86  |09864F;
 
 
          CODE_09ABD4: TXA                                  ;09ABD4|8A      |      ;
                       CMP.B #$06                           ;09ABD5|C906    |      ;
                       BNE CODE_09ABEE                      ;09ABD7|D015    |09ABEE;
                       JSR.W CODE_09A18A                    ;09ABD9|208AA1  |09A18A;
                       LDY.B #$00                           ;09ABDC|A000    |      ;
                       STY.W $07EE                          ;09ABDE|8CEE07  |0907EE;
                       INY                                  ;09ABE1|C8      |      ;
                       STY.W $07EC                          ;09ABE2|8CEC07  |0907EC;
                       INY                                  ;09ABE5|C8      |      ;
                       STY.W $07EF                          ;09ABE6|8CEF07  |0907EF;
                       LDA.B #$06                           ;09ABE9|A906    |      ;
                       STA.W $07F0                          ;09ABEB|8DF007  |0907F0;
 
          CODE_09ABEE: LDA.B #$00                           ;09ABEE|A900    |      ;
                       STA.W $05D8,X                        ;09ABF0|9DD805  |0905D8;
                       STA.W $05EF,X                        ;09ABF3|9DEF05  |0905EF;
                       STA.W $05C1,X                        ;09ABF6|9DC105  |0905C1;
                       LDA.B #$40                           ;09ABF9|A940    |      ;
                       STA.W $0470,X                        ;09ABFB|9D7004  |090470;
                       JMP.W CODE_09ADAF                    ;09ABFE|4CAFAD  |09ADAF;
 
                       db $AC,$EF,$07,$88,$F0,$33,$A9,$01   ;09AC01|        |0907EF;
                       db $20,$E0,$88,$BC,$06,$06,$A9,$04   ;09AC09|        |0988E0;
                       db $85,$00,$B9,$A8,$04,$D0,$04,$A9   ;09AC11|        |000000;
                       db $FC,$85,$00,$B9,$38,$04,$18,$65   ;09AC19|        |090085;
                       db $00,$9D,$38,$04,$B9,$1C,$04,$38   ;09AC21|        |      ;
                       db $E9,$20,$9D,$1C,$04,$BD,$7B,$06   ;09AC29|        |      ;
                       db $99,$7B,$06,$A9,$00,$9D,$69,$06   ;09AC31|        |09067B;
                       db $60,$4C,$3A,$87,$20,$DE,$A1,$A9   ;09AC39|        |      ;
                       db $50,$9D,$70,$04,$20,$C3,$A4,$C9   ;09AC41|        |09ABE0;
                       db $1E,$F0,$24,$BD,$38,$04,$C9,$10   ;09AC49|        |0924F0;
                       db $B0,$02,$A9,$10,$C9,$F0,$90,$02   ;09AC51|        |09AC55;
                       db $A9,$EF,$9D,$38,$04,$BD,$1C,$04   ;09AC59|        |      ;
                       db $C9,$40,$B0,$02,$A9,$40,$C9,$F0   ;09AC61|        |      ;
                       db $90,$02,$A9,$EF,$9D,$1C,$04,$BD   ;09AC69|        |09AC6D;
                       db $69,$06,$85,$00,$BD,$69,$06,$29   ;09AC71|        |      ;
                       db $02,$D0,$12,$AD,$EF,$07,$D0,$08   ;09AC79|        |      ;
                       db $20,$31,$82,$A9,$40,$9D,$70,$04   ;09AC81|        |098231;
                       db $A9,$00,$9D,$69,$06,$AC,$EF,$07   ;09AC89|        |      ;
                       db $D0,$69,$AC,$F3,$07,$88,$D0,$08   ;09AC91|        |09ACFC;
                       db $A9,$00,$9D,$57,$06,$4C,$64,$AE   ;09AC99|        |      ;
                       db $A9,$01,$20,$F4,$87,$AD,$F3,$07   ;09ACA1|        |      ;
                       db $D0,$0F,$BD,$06,$06,$F0,$0B,$20   ;09ACA9|        |09ACBA;
                       db $C3,$A4,$D0,$05,$A9,$01,$8D,$EF   ;09ACB1|        |0000A4;
                       db $07,$60,$A9,$21,$20,$66,$87,$A5   ;09ACB9|        |000060;
                       db $3D,$99,$7B,$06,$A9,$C8,$99,$70   ;09ACC1|        |097B99;
                       db $04,$8A,$99,$06,$06,$8D,$EC,$07   ;09ACC9|        |00008A;
                       db $A9,$01,$9D,$06,$06,$AD,$38,$04   ;09ACD1|        |      ;
                       db $DD,$38,$04,$B0,$04,$A9,$0C,$D0   ;09ACD9|        |090438;
                       db $02,$A9,$04,$9D,$65,$05,$29,$08   ;09ACE1|        |      ;
                       db $F0,$02,$A9,$01,$9D,$A8,$04,$A9   ;09ACE9|        |09ACED;
                       db $0A,$A0,$21,$20,$5C,$EF,$A9,$1C   ;09ACF1|        |      ;
                       db $4C,$4F,$86,$88,$D0,$70,$EC,$EC   ;09ACF9|        |09864F;
                       db $07,$D0,$54,$BD,$06,$06,$C9,$01   ;09AD01|        |0000D0;
                       db $F0,$4E,$20,$C3,$A4,$D0,$48,$A9   ;09AD09|        |09AD59;
                       db $05,$20,$66,$87,$90,$26,$A9,$00   ;09AD11|        |000020;
                       db $99,$69,$06,$A9,$02,$99,$06,$06   ;09AD19|        |090669;
                       db $A9,$40,$99,$70,$04,$A9,$80,$9D   ;09AD21|        |      ;
                       db $EF,$05,$86,$00,$98,$AA,$A9,$0A   ;09AD29|        |008605;
                       db $A0,$24,$20,$5C,$EF,$A6,$00,$CE   ;09AD31|        |      ;
                       db $F0,$07,$D0,$D3,$A9,$0A,$A0,$24   ;09AD39|        |09AD42;
                       db $20,$5C,$EF,$A9,$02,$8D,$EF,$07   ;09AD41|        |09EF5C;
                       db $A9,$00,$8D,$EE,$07,$A9,$80,$9D   ;09AD49|        |      ;
                       db $EF,$05,$A9,$C0,$9D,$1D,$06,$60   ;09AD51|        |C0A905;
                       db $A9,$02,$9D,$06,$06,$A9,$06,$8D   ;09AD59|        |      ;
                       db $F0,$07,$A9,$0A,$A0,$28,$20,$5C   ;09AD61|        |09AD6A;
                       db $EF,$A9,$20,$4C,$4F,$86,$A9,$00   ;09AD69|        |4C20A9;
                       db $9D,$57,$06,$88,$D0,$76,$AD,$EE   ;09AD71|        |090657;
                       db $07,$C9,$02,$90,$0C,$AD,$1E,$06   ;09AD79|        |0000C9;
                       db $F0,$43,$DE,$1D,$06,$A5,$00,$D0   ;09AD81|        |09ADC6;
                       db $3C,$8A,$CD,$EC,$07,$D0,$0D,$AD   ;09AD89|        |09CD8A;
                       db $EE,$07,$D0,$1A,$A9,$01,$8D,$EE   ;09AD91|        |09D007;
                       db $07,$20,$4B,$AE,$20,$C3,$A4,$C9   ;09AD99|        |000020;
                       db $1E,$F0,$1C,$C9,$1B,$F0,$18,$A9   ;09ADA1|        |091CF0;
                       db $0A,$A0,$24,$4C,$5C,$EF           ;09ADA9|        |      ;
 
          CODE_09ADAF: JSR.W CODE_09A4C3                    ;09ADAF|20C3A4  |09A4C3;
                       BNE UNREACH_09ADC0                   ;09ADB2|D00C    |09ADC0;
                       LDA.B #$0A                           ;09ADB4|A90A    |      ;
                       LDY.B #$24                           ;09ADB6|A024    |      ;
                       db $20                               ;09ADB8|        |      ;
                       dw CODE_0FEF5C                       ;09ADB9|        |0FEF5C;
                       LDA.B #$19                           ;09ADBB|A919    |      ;
                       JMP.W setEnityAi_scriptInex          ;09ADBD|4C4F86  |09864F;
 
 
       UNREACH_09ADC0: db $A9,$03,$9D,$06,$06,$60,$A9,$03   ;09ADC0|        |      ;
                       db $8D,$EF,$07,$AC,$EC,$07,$B9,$4E   ;09ADC8|        |0907EF;
                       db $05,$C9,$05,$D0,$0A,$A9,$9F,$99   ;09ADD0|        |0000C9;
                       db $EF,$05,$A9,$00,$99,$C1,$05,$C8   ;09ADD8|        |00A905;
                       db $C0,$0D,$D0,$EA,$A9,$00,$8D,$ED   ;09ADE0|        |      ;
                       db $07,$8D,$EE,$07,$60,$88,$D0,$10   ;09ADE8|        |00008D;
                       db $AD,$EE,$07,$F0,$0A,$EC,$EC,$07   ;09ADF0|        |0907EE;
                       db $D0,$05,$A9,$04,$8D,$EF,$07,$60   ;09ADF8|        |09ADFF;
                       db $EC,$EC,$07,$F0,$12,$A9,$00,$9D   ;09AE00|        |0907EC;
                       db $4E,$05,$9D,$00,$04,$9D,$8C,$04   ;09AE08|        |099D05;
                       db $9D,$06,$06,$9D,$EF,$05,$60,$BD   ;09AE10|        |090606;
                       db $06,$06,$C9,$03,$F0,$17,$20,$C3   ;09AE18|        |000006;
                       db $A4,$D0,$11,$A9,$00,$8D,$EC,$07   ;09AE20|        |0000D0;
                       db $8D,$ED,$07,$8D,$EE,$07,$8D,$EF   ;09AE28|        |0907ED;
                       db $07,$9D,$06,$06,$60,$A9,$04,$9D   ;09AE30|        |00009D;
                       db $06,$06,$A9,$06,$8D,$F0,$07,$A9   ;09AE38|        |000006;
                       db $0A,$A0,$2C,$20,$5C,$EF,$A9,$20   ;09AE40|        |      ;
                       db $4C,$4F,$86,$A0,$01,$B9,$4E,$05   ;09AE48|        |09864F;
                       db $C9,$05,$D0,$0A,$A9,$9E,$99,$EF   ;09AE50|        |      ;
                       db $05,$A9,$00,$99,$C1,$05,$C8,$C0   ;09AE58|        |0000A9;
                       db $0D,$D0,$EA,$60,$20,$C3,$A4,$C9   ;09AE60|        |09EAD0;
                       db $22,$F0,$15,$C9,$23,$F0,$F4,$A9   ;09AE68|        |C915F0;
                       db $50,$20,$61,$86,$A9,$0A,$A0,$30   ;09AE70|        |09AE92;
                       db $20,$5C,$EF,$A9,$23,$4C,$4F,$86   ;09AE78|        |09EF5C;
                       db $A9,$06,$85,$48,$A9,$1F,$85,$49   ;09AE80|        |      ;
                       db $20,$3C,$E3,$20,$96,$AE,$EE,$F3   ;09AE88|        |09E33C;
                       db $07,$A9,$01,$4C,$F4,$87,$A0,$01   ;09AE90|        |0000A9;
                       db $B9,$4E,$05,$F0,$18,$C9,$05,$F0   ;09AE98|        |09054E;
                       db $14,$A9,$00,$99,$4E,$05,$99,$EF   ;09AEA0|        |0000A9;
                       db $05,$99,$00,$04,$99,$8C,$04,$99   ;09AEA8|        |000099;
                       db $38,$04,$99,$1C,$04,$C8,$C0,$0D   ;09AEB0|        |      ;
                       db $D0,$DE,$60,$20,$DE,$A1,$BD,$69   ;09AEB8|        |09AE98;
                       db $06,$F0,$08,$A9,$33,$20,$5F,$E2   ;09AEC0|        |0000F0;
                       db $4C,$3A,$87,$BD,$38,$04,$C9,$08   ;09AEC8|        |09873A;
                       db $90,$14,$C9,$F8,$B0,$10,$BD,$1C   ;09AED0|        |09AEE6;
                       db $04,$C9,$40,$90,$09,$C9,$F0,$B0   ;09AED8|        |0000C9;
                       db $05,$A9,$1D,$4C,$4F,$86,$4C,$3A   ;09AEE0|        |0000A9;
                       db $87                               ;09AEE8|        |0000A5;
 
  entiyIndex_stuff_06: LDA.B r_bossActiveFlag               ;09AEE9|A578    |000078;
                       BEQ UNREACH_09AF20                   ;09AEEB|F033    |09AF20;
                       LDA.W $0606,X                        ;09AEED|BD0606  |090606;
                       BEQ UNREACH_09AEF8                   ;09AEF0|F006    |09AEF8;
                       JSR.W CODE_09AF62                    ;09AEF2|2062AF  |09AF62;
                       JMP.W CODE_09B04E                    ;09AEF5|4C4EB0  |09B04E;
 
 
       UNREACH_09AEF8: db $BD,$EF,$05,$29,$7F,$D0,$16,$A5   ;09AEF8|        |0905EF;
                       db $33,$C9,$02,$F0,$0B,$A9,$06,$85   ;09AF00|        |0000C9;
                       db $17,$20,$54,$B4,$C6,$17,$D0,$F9   ;09AF08|        |000020;
                       db $A9,$47,$4C,$4F,$86,$20,$62,$AF   ;09AF10|        |      ;
                       db $B0,$01,$60,$C9,$80,$F0,$23,$60   ;09AF18|        |09AF1B;
 
       UNREACH_09AF20: db $A9,$E9,$9D,$70,$04,$A9,$00,$9D   ;09AF20|        |      ;
                       db $A8,$04,$A9,$08,$9D,$65,$05,$BD   ;09AF28|        |      ;
                       db $06,$06,$F0,$03,$4C,$3F,$B0,$A9   ;09AF30|        |000006;
                       db $9E,$9D,$00,$04,$A9,$0A,$9D,$8C   ;09AF38|        |09009D;
                       db $04,$60,$BD,$70,$04,$29,$01,$D0   ;09AF40|        |000060;
                       db $18,$A9,$00,$9D,$D8,$05,$9D,$EF   ;09AF48|        |      ;
                       db $05,$9D,$C1,$05,$A9,$60,$9D,$70   ;09AF50|        |00009D;
                       db $04,$AD,$F3,$07,$29,$7F,$8D,$F3   ;09AF58|        |0000AD;
                       db $07,$60                           ;09AF60|        |000060;
 
          CODE_09AF62: LDA.B r_blockLevel                   ;09AF62|A533    |000033;
 
                       CMP.B #$02                           ;09AF64|C902    |      ;
                       BEQ CODE_09AF73                      ;09AF66|F00B    |09AF73;
                       LDA.W $0438,X                        ;09AF68|BD3804  |090438;
                       AND.B #$F0                           ;09AF6B|29F0    |      ;
                       CMP.B #$20                           ;09AF6D|C920    |      ;
                       BEQ CODE_09AF7A                      ;09AF6F|F009    |09AF7A;
                       BNE UNREACH_09AF84                   ;09AF71|D011    |09AF84;
 
          CODE_09AF73: LDA.W $0438,X                        ;09AF73|BD3804  |090438;
                       AND.B #$F0                           ;09AF76|29F0    |      ;
                       BNE UNREACH_09AF84                   ;09AF78|D00A    |09AF84;
 
          CODE_09AF7A: LDA.W $0470,X                        ;09AF7A|BD7004  |090470;
                       AND.B #$76                           ;09AF7D|2976    |      ;
                       STA.W $0470,X                        ;09AF7F|9D7004  |090470;
                       CLC                                  ;09AF82|18      |      ;
                       RTS                                  ;09AF83|60      |      ;
 
 
       UNREACH_09AF84: db $38,$60,$A9,$60,$9D,$70,$04,$20   ;09AF84|        |      ;
                       db $DE,$A1,$A5,$33,$C9,$02,$D0,$22   ;09AF8C|        |09A5A1;
                       db $A5,$3D,$C9,$18,$B0,$1C,$A9,$17   ;09AF94|        |00003D;
                       db $85,$3D,$9D,$7B,$06,$20,$1C,$B0   ;09AF9C|        |00003D;
                       db $BD,$EF,$05,$29,$7F,$D0,$05,$A9   ;09AFA4|        |0905EF;
                       db $49,$4C,$4F,$86,$20,$16,$B4,$4C   ;09AFAC|        |      ;
                       db $DB,$B2,$BD,$1D,$06,$C9,$FF,$D0   ;09AFB4|        |      ;
                       db $1A,$20,$7D,$B0,$90,$14,$A9,$30   ;09AFBC|        |      ;
                       db $20,$61,$86,$A9,$06,$9D,$4E,$05   ;09AFC4|        |098661;
                       db $A9,$02,$8D,$F3,$07,$A9,$00,$20   ;09AFCC|        |      ;
                       db $F4,$87,$60,$AD,$F3,$07,$C9,$01   ;09AFD4|        |096087;
                       db $D0,$01,$60,$A9,$00,$20,$F4,$87   ;09AFDC|        |09AFDF;
                       db $BD,$69,$06,$29,$F0,$F0,$08,$A9   ;09AFE4|        |090669;
                       db $01,$20,$E0,$88,$20,$64,$B3,$A5   ;09AFEC|        |000020;
                       db $3D,$D0,$08,$A9,$7B,$20,$5F,$E2   ;09AFF4|        |0908D0;
                       db $4C,$C2,$B3,$20,$16,$B4,$20,$1C   ;09AFFC|        |09B3C2;
                       db $B0,$BD,$EF,$05,$29,$7F,$D0,$D2   ;09B004|        |09AFC3;
                       db $A5,$1F,$C9,$A0,$B0,$05,$A9,$24   ;09B00C|        |00001F;
                       db $4C,$4F,$86,$A9,$26,$4C,$4F,$86   ;09B014|        |09864F;
                       db $BD,$65,$05,$29,$10,$F0,$02,$A9   ;09B01C|        |090565;
                       db $01,$9D,$A8,$04,$BD,$65,$05,$C9   ;09B024|        |00009D;
                       db $12,$90,$06,$A9,$1F,$38,$FD,$65   ;09B02C|        |000090;
                       db $05,$4A,$29,$FE,$18,$69,$9A,$9D   ;09B034|        |00004A;
                       db $00,$04,$60,$A9,$0A,$9D,$8C,$04   ;09B03C|        |      ;
                       db $D0,$08,$A9,$60,$9D,$70,$04,$20   ;09B044|        |09B04E;
                       db $DE,$A1                           ;09B04C|        |09A5A1;
 
          CODE_09B04E: LDA.B r_blockLevel                   ;09B04E|A533    |000033;
                       CMP.B #$02                           ;09B050|C902    |      ;
                       BNE UNREACH_09B072                   ;09B052|D01E    |09B072;
                       LDA.W $0606,X                        ;09B054|BD0606  |090606;
                       CMP.B #$FF                           ;09B057|C9FF    |      ;
                       BEQ UNREACH_09B07D                   ;09B059|F022    |09B07D;
                       LDA.B r_HUD_healthBoss               ;09B05B|A53D    |00003D;
                       CMP.B #$18                           ;09B05D|C918    |      ;
                       BCS UNREACH_09B072                   ;09B05F|B011    |09B072;
                       JSR.W CODE_09B2BD                    ;09B061|20BDB2  |09B2BD;
                       LDA.W $054E,X                        ;09B064|BD4E05  |09054E;
                       BNE CODE_09B06A                      ;09B067|D001    |09B06A;
                       RTS                                  ;09B069|60      |      ;
 
 
          CODE_09B06A: LDA.B #$00                           ;09B06A|A900    |      ;
                       STA.W $0669,X                        ;09B06C|9D6906  |090669;
                       JMP.W CODE_09B105                    ;09B06F|4C05B1  |09B105;
 
 
       UNREACH_09B072: db $BD,$06,$06,$C9,$80,$90,$7B,$C9   ;09B072|        |090606;
                       db $FE,$F0,$5F                       ;09B07A|        |095FF0;
 
       UNREACH_09B07D: db $A9,$00,$9D,$57,$06,$9D,$09,$05   ;09B07D|        |      ;
                       db $9D,$F2,$04,$A5,$33,$C9,$02,$D0   ;09B085|        |0904F2;
                       db $0C,$BD,$1C,$04,$C9,$F8,$90,$45   ;09B08D|        |091CBD;
                       db $20,$3A,$87,$38,$60,$BD,$EF,$05   ;09B095|        |09873A;
                       db $29,$7F,$C9,$56,$D0,$08,$BD,$C1   ;09B09D|        |      ;
                       db $05,$C9,$02,$F0,$01,$60,$BD,$1C   ;09B0A5|        |0000C9;
                       db $04,$C5,$CA,$90,$28,$BD,$EF,$05   ;09B0AD|        |0000C5;
                       db $29,$7F,$C9,$25,$D0,$09,$BD,$C1   ;09B0B5|        |      ;
                       db $05,$C9,$0F,$D0,$18,$38,$60,$8A   ;09B0BD|        |0000C9;
                       db $C9,$01,$F0,$05,$A9,$FE,$9D,$06   ;09B0C5|        |      ;
                       db $06,$A9,$0A,$A0,$43,$20,$5C,$EF   ;09B0CD|        |0000A9;
                       db $A9,$25,$20,$4F,$86,$18,$60,$A9   ;09B0D5|        |      ;
                       db $00,$9D,$57,$06,$BD,$EF,$05,$29   ;09B0DD|        |      ;
                       db $7F,$D0,$0B,$A9,$00,$9D,$4E,$05   ;09B0E5|        |A90BD0;
                       db $9D,$00,$04,$9D,$8C,$04,$60,$BD   ;09B0ED|        |090400;
                       db $69,$06,$29,$F0,$F0,$0A,$A9,$28   ;09B0F5|        |      ;
                       db $20,$5F,$E2,$A9,$00,$9D,$69,$06   ;09B0FD|        |09E25F;
 
          CODE_09B105: LDA.W $07F3                          ;09B105|ADF307  |0907F3;
                       AND.B #$80                           ;09B108|2980    |      ;
                       BNE CODE_09B10F                      ;09B10A|D003    |09B10F;
                       JSR.W CODE_09B416                    ;09B10C|2016B4  |09B416;
 
          CODE_09B10F: LDA.W $04F2,X                        ;09B10F|BDF204  |0904F2;
                       ORA.W $0509,X                        ;09B112|1D0905  |090509;
                       ORA.W $0520,X                        ;09B115|1D2005  |090520;
                       ORA.W $0537,X                        ;09B118|1D3705  |090537;
                       BNE UNREACH_09B188                   ;09B11B|D06B    |09B188;
                       LDA.W $04F3                          ;09B11D|ADF304  |0904F3;
                       ORA.W $050A                          ;09B120|0D0A05  |09050A;
                       ORA.W $0521                          ;09B123|0D2105  |090521;
                       ORA.W $0538                          ;09B126|0D3805  |090538;
                       BEQ CODE_09B14F                      ;09B129|F024    |09B14F;
                       LDA.W $04F3                          ;09B12B|ADF304  |0904F3;
                       STA.W $04F2,X                        ;09B12E|9DF204  |0904F2;
                       STA.W $05C1,X                        ;09B131|9DC105  |0905C1;
                       LDA.W $050A                          ;09B134|AD0A05  |09050A;
                       STA.W $0509,X                        ;09B137|9D0905  |090509;
                       STA.W $05D8,X                        ;09B13A|9DD805  |0905D8;
                       LDA.W $0521                          ;09B13D|AD2105  |090521;
                       STA.W $0520,X                        ;09B140|9D2005  |090520;
                       STA.W $0633,X                        ;09B143|9D3306  |090633;
                       LDA.W $0538                          ;09B146|AD3805  |090538;
                       STA.W $0537,X                        ;09B149|9D3705  |090537;
                       STA.W $0645,X                        ;09B14C|9D4506  |090645;
 
          CODE_09B14F: LDA.W $0566                          ;09B14F|AD6605  |090566;
                       STA.W $0565,X                        ;09B152|9D6505  |090565;
                       JSR.W CODE_09B43B                    ;09B155|203BB4  |09B43B;
                       LDA.W $0565,X                        ;09B158|BD6505  |090565;
                       CLC                                  ;09B15B|18      |      ;
                       ADC.B #$10                           ;09B15C|6910    |      ;
                       AND.B #$1F                           ;09B15E|291F    |      ;
                       ASL A                                ;09B160|0A      |      ;
                       CPX.B #$02                           ;09B161|E002    |      ;
                       BNE CODE_09B168                      ;09B163|D003    |09B168;
                       CLC                                  ;09B165|18      |      ;
                       ADC.B #$40                           ;09B166|6940    |      ;
 
          CODE_09B168: TAY                                  ;09B168|A8      |      ;
                       LDA.W UNREACH_09B223,Y               ;09B169|B923B2  |09B223;
                       STA.B r_pointerQueue                 ;09B16C|8508    |000008;
                       LDA.W UNREACH_09B224,Y               ;09B16E|B924B2  |09B224;
                       STA.B $09                            ;09B171|8509    |000009;
                       LDY.B $00                            ;09B173|A400    |000000;
                       LDA.W $0438,Y                        ;09B175|B93804  |090438;
                       CLC                                  ;09B178|18      |      ;
                       ADC.B r_pointerQueue                 ;09B179|6508    |000008;
                       STA.W $0438,X                        ;09B17B|9D3804  |090438;
                       LDA.W $041C,Y                        ;09B17E|B91C04  |09041C;
                       CLC                                  ;09B181|18      |      ;
                       ADC.B $09                            ;09B182|6509    |000009;
                       STA.W $041C,X                        ;09B184|9D1C04  |09041C;
                       RTS                                  ;09B187|60      |      ;
 
 
       UNREACH_09B188: db $BD,$06,$06,$C9,$0B,$D0,$16,$A9   ;09B188|        |090606;
                       db $40,$1D,$70,$04,$9D,$70,$04,$20   ;09B190|        |      ;
                       db $B7,$B2,$20,$58,$B1,$B9,$4E,$05   ;09B198|        |0000B2;
                       db $D0,$03,$20,$3D,$B3,$20,$B7,$B2   ;09B1A0|        |09B1A5;
                       db $BD,$1D,$06,$D0,$3F,$BD,$C1,$05   ;09B1A8|        |09061D;
                       db $9D,$F2,$04,$BD,$D8,$05,$9D,$09   ;09B1B0|        |0904F2;
                       db $05,$BD,$33,$06,$9D,$20,$05,$BD   ;09B1B8|        |0000BD;
                       db $45,$06,$9D,$37,$05,$B9,$F2,$04   ;09B1C0|        |000006;
                       db $9D,$C1,$05,$B9,$09,$05,$9D,$D8   ;09B1C8|        |0905C1;
                       db $05,$B9,$20,$05,$9D,$33,$06,$B9   ;09B1D0|        |0000B9;
                       db $37,$05,$9D,$45,$06,$20,$3B,$B4   ;09B1D8|        |000005;
                       db $AC,$1E,$06,$B9,$40,$99,$9D,$1D   ;09B1E0|        |09061E;
                       db $06,$4C,$F3,$B1,$20,$4A,$B4,$DE   ;09B1E8|        |00004C;
                       db $1D,$06,$60,$A0,$A4,$BD,$06,$06   ;09B1F0|        |096006;
                       db $C9,$0B,$D0,$02,$A0,$AE,$84,$02   ;09B1F8|        |      ;
                       db $BD,$65,$05,$29,$10,$F0,$02,$A9   ;09B200|        |090565;
                       db $01,$9D,$A8,$04,$BD,$65,$05,$C9   ;09B208|        |00009D;
                       db $12,$90,$06,$A9,$1F,$38,$FD,$65   ;09B210|        |000090;
                       db $05,$4A,$29,$FE,$18,$65,$02,$9D   ;09B218|        |00004A;
                       db $00,$04,$60                       ;09B220|        |      ;
 
       UNREACH_09B223: db $00                               ;09B223|        |      ;
 
       UNREACH_09B224: db $F6,$02,$F6,$04,$F7,$06,$F8,$07   ;09B224|        |000002;
                       db $F9,$08,$FA,$09,$FC,$0A,$FE,$0A   ;09B22C|        |09FA08;
                       db $00,$0A,$02,$09,$04,$08,$06,$07   ;09B234|        |      ;
                       db $07,$06,$08,$04,$09,$02,$0A,$00   ;09B23C|        |000006;
                       db $0A,$FE,$0A,$FC,$09,$FA,$08,$F9   ;09B244|        |      ;
                       db $07,$F8,$06,$F7,$04,$F6,$02,$F6   ;09B24C|        |0000F8;
                       db $00,$F6,$FE,$F7,$FC,$F8,$FA,$F9   ;09B254|        |      ;
                       db $F9,$FA,$F8,$FC,$F7,$FE,$F6,$00   ;09B25C|        |09F8FA;
                       db $F2,$03,$F2,$06,$F3,$08,$F5,$0A   ;09B264|        |000003;
                       db $F6,$0B,$F8,$0D,$FA,$0E,$FD,$0E   ;09B26C|        |00000B;
                       db $00,$0E,$03,$0D,$06,$0B,$08,$0A   ;09B274|        |      ;
                       db $0A,$08,$0B,$06,$0D,$03,$0E,$00   ;09B27C|        |      ;
                       db $0E,$FD,$0E,$FA,$0D,$F8,$0B,$F6   ;09B284|        |090EFD;
                       db $0A,$F5,$08,$F3,$06,$F2,$03,$F2   ;09B28C|        |      ;
                       db $00,$F2,$FD,$F3,$FA,$F2,$FD,$F6   ;09B294|        |      ;
                       db $F6,$F8,$F5,$FA,$F3,$FD,$F2,$08   ;09B29C|        |0000F8;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;09B2A4|        |      ;
                       db $08,$08,$08,$08,$08,$08,$08,$08   ;09B2AC|        |      ;
                       db $08,$08,$08,$8A,$A8,$88,$84,$00   ;09B2B4|        |      ;
                       db $60                               ;09B2BC|        |      ;
 
          CODE_09B2BD: LDA.W $054F                          ;09B2BD|AD4F05  |09054F;
                       BNE UNREACH_09B2DA                   ;09B2C0|D018    |09B2DA;
                       LDA.W $0438,X                        ;09B2C2|BD3804  |090438;
                       STA.B $00                            ;09B2C5|8500    |000000;
                       LDA.B $D1                            ;09B2C7|A5D1    |0000D1;
                       AND.B #$80                           ;09B2C9|2980    |      ;
                       BEQ CODE_09B2D2                      ;09B2CB|F005    |09B2D2;
                       LDA.W $041C,X                        ;09B2CD|BD1C04  |09041C;
                       STA.B $00                            ;09B2D0|8500    |000000;
 
          CODE_09B2D2: LDA.B $D1                            ;09B2D2|A5D1    |0000D1;
                       ASL A                                ;09B2D4|0A      |      ;
                       STA.B $01                            ;09B2D5|8501    |000001;
                       JMP.W CODE_09B307                    ;09B2D7|4C07B3  |09B307;
 
 
       UNREACH_09B2DA: db $60,$AD,$F0,$05,$29,$7F,$C9,$49   ;09B2DA|        |      ;
                       db $D0,$07,$AD,$C2,$05,$C9,$06,$B0   ;09B2E2|        |09B2EB;
                       db $01,$60,$BD,$38,$04,$85,$00,$A9   ;09B2EA|        |000060;
                       db $80,$85,$01,$A9,$38,$85,$02,$20   ;09B2F2|        |09B279;
                       db $55,$B3,$B0,$56,$BD,$1C,$04,$85   ;09B2FA|        |0000B3;
                       db $00,$A9,$40,$85,$01               ;09B302|        |      ;
 
          CODE_09B307: LDA.B #$04                           ;09B307|A904    |      ;
                       STA.B $02                            ;09B309|8502    |000002;
                       JSR.W CODE_09B355                    ;09B30B|2055B3  |09B355;
                       BCS CODE_09B354                      ;09B30E|B044    |09B354;
                       CPX.B #$01                           ;09B310|E001    |      ;
                       BNE CODE_09B33D                      ;09B312|D029    |09B33D;
                       LDA.W $0520,X                        ;09B314|BD2005  |090520;
                       BEQ CODE_09B326                      ;09B317|F00D    |09B326;
                       CMP.B #$FF                           ;09B319|C9FF    |      ;
                       BNE CODE_09B32D                      ;09B31B|D010    |09B32D;
                       LDA.W $0537,X                        ;09B31D|BD3705  |090537;
                       CMP.B #$C0                           ;09B320|C9C0    |      ;
                       BCS CODE_09B337                      ;09B322|B013    |09B337;
                       BCC CODE_09B32D                      ;09B324|9007    |09B32D;
 
          CODE_09B326: LDA.W $0537,X                        ;09B326|BD3705  |090537;
                       CMP.B #$40                           ;09B329|C940    |      ;
                       BCC CODE_09B337                      ;09B32B|900A    |09B337;
 
          CODE_09B32D: LDA.W $041C,X                        ;09B32D|BD1C04  |09041C;
                       LSR A                                ;09B330|4A      |      ;
                       ORA.B #$80                           ;09B331|0980    |      ;
                       STA.B $D1                            ;09B333|85D1    |0000D1;
                       BNE CODE_09B33D                      ;09B335|D006    |09B33D;
 
          CODE_09B337: LDA.W $0438,X                        ;09B337|BD3804  |090438;
                       LSR A                                ;09B33A|4A      |      ;
                       STA.B $D1                            ;09B33B|85D1    |0000D1;
 
          CODE_09B33D: LDA.B #$00                           ;09B33D|A900    |      ;
                       STA.W $054E,X                        ;09B33F|9D4E05  |09054E;
                       STA.W $0400,X                        ;09B342|9D0004  |090400;
                       STA.W $05AA,X                        ;09B345|9DAA05  |0905AA;
                       STA.W $048C,X                        ;09B348|9D8C04  |09048C;
                       STA.W $05EF,X                        ;09B34B|9DEF05  |0905EF;
                       STA.W $05C1,X                        ;09B34E|9DC105  |0905C1;
                       JSR.W CODE_09B39E                    ;09B351|209EB3  |09B39E;
 
          CODE_09B354: RTS                                  ;09B354|60      |      ;
 
 
          CODE_09B355: LDA.B $00                            ;09B355|A500    |000000;
                       SEC                                  ;09B357|38      |      ;
                       SBC.B $01                            ;09B358|E501    |000001;
                       BCS CODE_09B361                      ;09B35A|B005    |09B361;
                       EOR.B #$FF                           ;09B35C|49FF    |      ;
                       CLC                                  ;09B35E|18      |      ;
                       ADC.B #$01                           ;09B35F|6901    |      ;
 
          CODE_09B361: CMP.B $02                            ;09B361|C502    |000002;
                       RTS                                  ;09B363|60      |      ;
 
                       db $BC,$1D,$06,$88,$F0,$F9,$98,$9D   ;09B364|        |09061D;
                       db $1D,$06,$A0,$02,$B9,$4E,$05,$C9   ;09B36C|        |09A006;
                       db $2D,$D0,$17,$B9,$06,$06,$C9,$80   ;09B374|        |0917D0;
                       db $B0,$10,$A9,$00,$99,$69,$06,$BD   ;09B37C|        |09B38E;
                       db $8D,$06,$99,$8D,$06,$C8,$C0,$0E   ;09B384|        |099906;
                       db $D0,$E2,$88,$A9,$FF,$99,$06,$06   ;09B38C|        |09B370;
                       db $98,$AA,$A9,$17,$20,$4F,$86,$A6   ;09B394|        |      ;
                       db $6C,$60                           ;09B39C|        |00A960;
 
          CODE_09B39E: LDA.B #$00                           ;09B39E|A900    |      ;
                       STA.B $00                            ;09B3A0|8500    |000000;
                       LDY.B #$01                           ;09B3A2|A001    |      ;
 
          CODE_09B3A4: LDA.W $054E,Y                        ;09B3A4|B94E05  |09054E;
                       BEQ CODE_09B3AB                      ;09B3A7|F002    |09B3AB;
                       INC.B $00                            ;09B3A9|E600    |000000;
 
          CODE_09B3AB: INY                                  ;09B3AB|C8      |      ;
                       CPY.B #$0D                           ;09B3AC|C00D    |      ;
                       BNE CODE_09B3A4                      ;09B3AE|D0F4    |09B3A4;
                       LDA.B $00                            ;09B3B0|A500    |000000;
                       BNE CODE_09B3C1                      ;09B3B2|D00D    |09B3C1;
                       LDA.W $061E                          ;09B3B4|AD1E06  |09061E;
                       STA.B r_bossDragonMisc               ;09B3B7|85BE    |0000BE;
                       LDA.B #$1C                           ;09B3B9|A91C    |      ;
                       STA.B r_gameTransition               ;09B3BB|852A    |00002A;
                       LDA.B r_HUD_healthBoss               ;09B3BD|A53D    |00003D;
                       STA.B r_bossDragonKingHP             ;09B3BF|85BD    |0000BD;
 
          CODE_09B3C1: RTS                                  ;09B3C1|60      |      ;
 
                       db $A0,$01,$B9,$4E,$05,$C9,$06,$F0   ;09B3C2|        |      ;
                       db $04,$C9,$2D,$D0,$31,$A9,$00,$99   ;09B3CA|        |0000C9;
                       db $69,$06,$C0,$01,$D0,$07,$A9,$FF   ;09B3D2|        |      ;
                       db $99,$1D,$06,$D0,$05,$A9,$FF,$99   ;09B3DA|        |09061D;
                       db $06,$06,$B9,$06,$B4,$99,$D8,$05   ;09B3E2|        |000006;
                       db $A9,$D6,$99,$EF,$05,$A9,$00,$99   ;09B3EA|        |      ;
                       db $C1,$05,$99,$F2,$04,$99,$09,$05   ;09B3F2|        |000005;
                       db $99,$20,$05,$99,$37,$05,$C8,$C0   ;09B3FA|        |090520;
                       db $0E,$D0,$BF,$60,$C0,$B0,$A0,$90   ;09B402|        |09BFD0;
                       db $80,$70,$60,$50,$40,$30,$20,$10   ;09B40A|        |09B47C;
                       db $10,$10,$10,$10                   ;09B412|        |09B424;
 
          CODE_09B416: LDA.W $0438,X                        ;09B416|BD3804  |090438;
                       CMP.B #$04                           ;09B419|C904    |      ;
                       BCS CODE_09B41F                      ;09B41B|B002    |09B41F;
                       LDA.B #$04                           ;09B41D|A904    |      ;
 
          CODE_09B41F: CMP.B #$FC                           ;09B41F|C9FC    |      ;
                       BCC CODE_09B425                      ;09B421|9002    |09B425;
                       LDA.B #$FB                           ;09B423|A9FB    |      ;
 
          CODE_09B425: STA.W $0438,X                        ;09B425|9D3804  |090438;
                       LDA.W $041C,X                        ;09B428|BD1C04  |09041C;
                       CMP.B #$30                           ;09B42B|C930    |      ;
                       BCS CODE_09B431                      ;09B42D|B002    |09B431;
                       LDA.B #$30                           ;09B42F|A930    |      ;
 
          CODE_09B431: CMP.B #$F0                           ;09B431|C9F0    |      ;
                       BCC CODE_09B437                      ;09B433|9002    |09B437;
                       LDA.B #$EF                           ;09B435|A9EF    |      ;
 
          CODE_09B437: STA.W $041C,X                        ;09B437|9D1C04  |09041C;
                       RTS                                  ;09B43A|60      |      ;
 
 
          CODE_09B43B: TXA                                  ;09B43B|8A      |      ;
                       TAY                                  ;09B43C|A8      |      ;
                       DEY                                  ;09B43D|88      |      ;
                       STY.B $00                            ;09B43E|8400    |000000;
                       LDA.W $0565,Y                        ;09B440|B96505  |090565;
                       LDY.W $0606,X                        ;09B443|BC0606  |090606;
                       STA.W $0782,Y                        ;09B446|998207  |090782;
                       RTS                                  ;09B449|60      |      ;
 
                       db $BC,$06,$06,$B9,$82,$07,$9D,$65   ;09B44A|        |090606;
                       db $05,$60,$A9,$26,$20,$C5,$87,$A9   ;09B452|        |000060;
                       db $88,$99,$70,$04,$A9,$48,$99,$1C   ;09B45A|        |      ;
                       db $04,$A9,$20,$99,$38,$04,$84,$16   ;09B462|        |0000A9;
                       db $A5,$17,$29,$07,$0A,$A8,$B9,$D3   ;09B46A|        |000017;
                       db $B4,$85,$00,$B9,$D4,$B4,$85,$01   ;09B472|        |000085;
                       db $B9,$E1,$B4,$85,$02,$B9,$E2,$B4   ;09B47A|        |09B4E1;
                       db $85,$03,$A4,$16,$A5,$00,$99,$09   ;09B482|        |000003;
                       db $05,$A5,$01,$99,$F2,$04,$A5,$02   ;09B48A|        |0000A5;
                       db $99,$37,$05,$A5,$03,$99,$20,$05   ;09B492|        |090537;
                       db $8A,$99,$06,$06,$60,$BC,$06,$06   ;09B49A|        |      ;
                       db $B9,$70,$04,$29,$88,$D0,$F5,$BD   ;09B4A2|        |090470;
                       db $EF,$05,$29,$7F,$D0,$19,$A9,$34   ;09B4AA|        |7F2905;
                       db $20,$5F,$E2,$A9,$0E,$9D,$8C,$04   ;09B4B2|        |09E25F;
                       db $A9,$18,$9D,$00,$04,$A9,$60,$9D   ;09B4BA|        |      ;
                       db $70,$04,$A9,$55,$4C,$4F,$86,$BD   ;09B4C2|        |09B4C8;
                       db $1C,$04,$C9,$F8,$90,$CE,$4C,$3A   ;09B4CA|        |09C904;
                       db $87,$10,$00,$20,$00,$30,$00,$40   ;09B4D2|        |000010;
                       db $00,$50,$00,$60,$00,$70,$00,$00   ;09B4DA|        |      ;
                       db $FF,$E0,$FF,$D0,$FE,$C0,$FF,$B0   ;09B4E2|        |D0FFE0;
                       db $FE,$A0,$FF,$90,$FD               ;09B4EA|        |09FFA0;
 
  entiyIndex_stuff_0D: LDA.W $07EC                          ;09B4EF|ADEC07  |0907EC;
                       BEQ CODE_09B4F7                      ;09B4F2|F003    |09B4F7;
                       JMP.W CODE_09B5B7                    ;09B4F4|4CB7B5  |09B5B7;
 
 
          CODE_09B4F7: LDA.B r_bossActiveFlag               ;09B4F7|A578    |000078;
                       BNE CODE_09B515                      ;09B4F9|D01A    |09B515;
                       LDA.B #$3C                           ;09B4FB|A93C    |      ;
                       STA.W $0606,X                        ;09B4FD|9D0606  |090606;
                       LDA.B #$01                           ;09B500|A901    |      ;
                       STA.W $04A8,X                        ;09B502|9DA804  |0904A8;
                       LDA.B #$A8                           ;09B505|A9A8    |      ;
                       STA.W $041C,X                        ;09B507|9D1C04  |09041C;
                       LDA.B #$10                           ;09B50A|A910    |      ;
                       LDY.B #$44                           ;09B50C|A044    |      ;
                       db $4C                               ;09B50E|        |      ;
 
                       dw CODE_0FEF5C                       ;09B50F|        |0FEF5C;
 
          CODE_09B511: DEC.W $0606,X                        ;09B511|DE0606  |090606;
                       RTS                                  ;09B514|60      |      ;
 
 
          CODE_09B515: LDA.W $0606,X                        ;09B515|BD0606  |090606;
                       BNE CODE_09B511                      ;09B518|D0F7    |09B511;
                       LDA.B #$60                           ;09B51A|A960    |      ;
                       STA.W $0470,X                        ;09B51C|9D7004  |090470;
                       LDA.W $05EF,X                        ;09B51F|BDEF05  |0905EF;
                       AND.B #$7F                           ;09B522|297F    |      ;
                       BNE UNREACH_09B54B                   ;09B524|D025    |09B54B;
                       LDA.B #$25                           ;09B526|A925    |      ;
                       JSR.W CODE_098766                    ;09B528|206687  |098766;
                       db $A9,$80,$99,$EF,$05,$A9,$E8,$99   ;09B52B|        |      ;
                       db $70,$04,$8A,$99,$06,$06,$A9,$02   ;09B533|        |09B539;
                       db $99,$00,$04,$A9,$40,$99,$7B,$06   ;09B53B|        |090400;
                       db $9D,$7B,$06,$A9,$D1,$4C,$4F,$86   ;09B543|        |09067B;
 
       UNREACH_09B54B: db $BD,$C1,$05,$C9,$07,$F0,$01,$60   ;09B54B|        |0905C1;
                       db $AD,$F3,$07,$29,$7F,$8D,$F3,$07   ;09B553|        |0907F3;
                       db $20,$62,$B5,$9D,$EF,$05,$60,$A9   ;09B55B|        |09B562;
                       db $00,$9D,$06,$06,$9D,$1D,$06,$9D   ;09B563|        |      ;
                       db $33,$06,$60,$A9,$E8,$9D,$70,$04   ;09B56B|        |000006;
                       db $A9,$02,$9D,$00,$04,$BC,$06,$06   ;09B573|        |      ;
                       db $B9,$06,$06,$C9,$03,$B0,$09,$A9   ;09B57B|        |090606;
                       db $01,$20,$E0,$88,$A5,$3D,$F0,$1E   ;09B583|        |000020;
                       db $A9,$00,$9D,$69,$06,$BC,$06,$06   ;09B58B|        |      ;
                       db $B9,$1C,$04,$38,$E9,$10,$9D,$1C   ;09B593|        |09041C;
                       db $04,$B9,$38,$04,$9D,$38,$04,$B9   ;09B59B|        |0000B9;
                       db $57,$06,$9D,$57,$06,$60,$4C,$3A   ;09B5A3|        |000006;
                       db $87,$A9,$00,$85,$BB,$85,$BA,$AD   ;09B5AB|        |0000A9;
                       db $EC,$07,$F0,$16                   ;09B5B3|        |09F007;
 
          CODE_09B5B7: LDA.B #$03                           ;09B5B7|A903    |      ;
                       STA.B r_bossSpecialHitbox            ;09B5B9|85BA    |0000BA;
                       LDY.W $07EC                          ;09B5BB|ACEC07  |0907EC;
                       DEY                                  ;09B5BE|88      |      ;
                       STY.B r_bossDopplegangerHitbox       ;09B5BF|84BC    |0000BC;
                       LDY.W $07EC                          ;09B5C1|ACEC07  |0907EC;
                       DEY                                  ;09B5C4|88      |      ;
                       BNE UNREACH_09B5CA                   ;09B5C5|D003    |09B5CA;
                       JMP.W CODE_09B963                    ;09B5C7|4C63B9  |09B963;
 
 
       UNREACH_09B5CA: db $4C,$5F,$BD,$20,$31,$82,$A5,$3D   ;09B5CA|        |09BD5F;
                       db $F0,$03,$4C,$A1,$B6,$AD,$ED,$07   ;09B5D2|        |09B5D7;
                       db $D0,$78,$A9,$00,$8D,$EE,$07,$A9   ;09B5DA|        |09B654;
                       db $06,$85,$17,$A9,$0D,$20,$66,$87   ;09B5E2|        |000085;
                       db $A5,$17,$99,$06,$06,$A9,$DE,$99   ;09B5EA|        |000017;
                       db $EF,$05,$A9,$60,$99,$70,$04,$A9   ;09B5F2|        |60A905;
                       db $10,$99,$8C,$04,$A9,$00,$99,$C1   ;09B5FA|        |09B595;
                       db $05,$84,$16,$A4,$17,$88,$B9,$95   ;09B602|        |000084;
                       db $B8,$85,$15,$B9,$9B,$B8,$A4,$16   ;09B60A|        |      ;
                       db $99,$65,$05,$A5,$15,$99,$00,$04   ;09B612|        |090565;
                       db $EE,$EE,$07,$C6,$17,$D0,$C4,$A5   ;09B61A|        |0907EE;
                       db $17,$9D,$06,$06,$BD,$1C,$04,$38   ;09B622|        |00009D;
                       db $E9,$10,$9D,$1C,$04,$A9,$80,$9D   ;09B62A|        |      ;
                       db $EF,$05,$A9,$F0,$9D,$00,$04,$A9   ;09B632|        |F0A905;
                       db $10,$9D,$8C,$04,$A9,$20,$9D,$70   ;09B63A|        |09B5D9;
                       db $04,$EE,$ED,$07,$A9,$7B,$20,$5F   ;09B642|        |0000EE;
                       db $E2,$A9,$43,$4C,$5F,$E2,$9D,$1C   ;09B64A|        |      ;
                       db $04,$60,$BD,$06,$06,$D0,$2B,$BD   ;09B652|        |000060;
                       db $1C,$04,$38,$E9,$01,$C9,$80,$B0   ;09B65A|        |093804;
                       db $ED,$AD,$EE,$07,$D0,$EB,$EE,$EC   ;09B662|        |09EEAD;
                       db $07,$A9,$80,$8D,$F3,$07,$A9,$40   ;09B66A|        |0000A9;
                       db $85,$3D,$9D,$7B,$06,$A9,$00,$9D   ;09B672|        |00003D;
                       db $45,$06,$20,$62,$B5,$A9,$30,$4C   ;09B67A|        |000006;
                       db $61,$86,$BD,$1C,$04,$29,$F8,$F0   ;09B682|        |000086;
                       db $10,$C9,$F8,$F0,$0C,$BD,$38,$04   ;09B68A|        |09B655;
                       db $29,$F8,$F0,$05,$C9,$F8,$F0,$01   ;09B692|        |      ;
                       db $60,$CE,$EE,$07,$4C,$3A,$87,$A9   ;09B69A|        |      ;
                       db $60,$9D,$70,$04,$A9,$30,$9D,$57   ;09B6A2|        |      ;
                       db $06,$BC,$06,$06,$D0,$50,$BD,$EF   ;09B6AA|        |0000BC;
                       db $05,$29,$7F,$D0,$08,$20,$85,$B8   ;09B6B2|        |000029;
                       db $A9,$D2,$4C,$4F,$86,$BD,$C1,$05   ;09B6BA|        |      ;
                       db $C9,$07,$F0,$05,$C9,$0D,$F0,$28   ;09B6C2|        |      ;
                       db $60,$A9,$01,$85,$17,$A9,$24,$20   ;09B6CA|        |      ;
                       db $66,$87,$A9,$00,$99,$06,$06,$A5   ;09B6D2|        |000087;
                       db $17,$99,$1D,$06,$A9,$60,$99,$70   ;09B6DA|        |000099;
                       db $04,$A9,$80,$99,$EF,$05,$A9,$C0   ;09B6E2|        |0000A9;
                       db $99,$1C,$04,$C6,$17,$10,$DE,$60   ;09B6EA|        |09041C;
                       db $FE,$06,$06,$A9,$30,$9D,$1D,$06   ;09B6F2|        |090606;
                       db $A9,$80,$9D,$EF,$05,$60,$88,$D0   ;09B6FA|        |      ;
                       db $51,$BD,$1D,$06,$D0,$48,$BD,$EF   ;09B702|        |0000BD;
                       db $05,$29,$7F,$D0,$08,$20,$85,$B8   ;09B70A|        |000029;
                       db $A9,$D2,$4C,$4F,$86,$BD,$C1,$05   ;09B712|        |      ;
                       db $C9,$07,$F0,$05,$C9,$0D,$F0,$20   ;09B71A|        |      ;
                       db $60,$A9,$24,$20,$66,$87,$A9,$01   ;09B722|        |      ;
                       db $99,$06,$06,$A9,$00,$99,$1D,$06   ;09B72A|        |090606;
                       db $A9,$60,$99,$70,$04,$A9,$80,$99   ;09B732|        |      ;
                       db $EF,$05,$A9,$C0,$99,$1C,$04,$60   ;09B73A|        |C0A905;
                       db $FE,$06,$06,$A9,$20,$9D,$1D,$06   ;09B742|        |090606;
                       db $A9,$80,$9D,$EF,$05,$60,$DE,$1D   ;09B74A|        |      ;
                       db $06,$60,$88,$D0,$2A,$BD,$1D,$06   ;09B752|        |000060;
                       db $D0,$F4,$BD,$38,$04,$9D,$1D,$06   ;09B75A|        |09B750;
                       db $29,$F0,$9D,$45,$06,$A9,$00,$9D   ;09B762|        |      ;
                       db $65,$05,$9D,$C1,$05,$BC,$33,$06   ;09B76A|        |000005;
                       db $B9,$A1,$B8,$DD,$1D,$06,$B0,$03   ;09B772|        |09B8A1;
                       db $FE,$65,$05,$FE,$06,$06,$60,$A9   ;09B77A|        |090565;
                       db $00,$9D,$57,$06,$88,$D0,$7C,$BD   ;09B782|        |      ;
                       db $D8,$05,$D0,$73,$BD,$65,$05,$F0   ;09B78A|        |      ;
                       db $16,$BD,$38,$04,$38,$E9,$10,$9D   ;09B792|        |0000BD;
                       db $38,$04,$29,$F0,$DD,$45,$06,$F0   ;09B79A|        |      ;
                       db $58,$90,$1A,$A9,$00,$F0,$54,$BD   ;09B7A2|        |      ;
                       db $38,$04,$18,$69,$10,$9D,$38,$04   ;09B7AA|        |      ;
                       db $29,$F0,$DD,$45,$06,$F0,$42,$B0   ;09B7B2|        |      ;
                       db $04,$A9,$00,$F0,$3E,$BD,$1D,$06   ;09B7BA|        |0000A9;
                       db $9D,$38,$04,$FE,$C1,$05,$BD,$C1   ;09B7C2|        |090438;
                       db $05,$C9,$04,$D0,$2C,$A9,$00,$9D   ;09B7CA|        |0000C9;
                       db $C1,$05,$BC,$33,$06,$B9,$A1,$B8   ;09B7D2|        |000005;
                       db $DD,$45,$06,$D0,$04,$FE,$06,$06   ;09B7DA|        |090645;
                       db $60,$A9,$10,$85,$00,$BD,$65,$05   ;09B7E2|        |      ;
                       db $F0,$04,$A9,$F0,$85,$00,$BD,$45   ;09B7EA|        |09B7F0;
                       db $06,$18,$65,$00,$29,$F0,$9D,$45   ;09B7F2|        |000018;
                       db $06,$A9,$00,$9D,$D8,$05,$60,$DE   ;09B7FA|        |0000A9;
                       db $D8,$05,$60,$20,$85,$B8,$BD,$D8   ;09B802|        |      ;
                       db $05,$D0,$F4,$BD,$65,$05,$F0,$16   ;09B80A|        |0000D0;
                       db $BD,$38,$04,$38,$E9,$10,$9D,$38   ;09B812|        |090438;
                       db $04,$29,$F0,$DD,$45,$06,$F0,$D9   ;09B81A|        |000029;
                       db $90,$1A,$A9,$00,$F0,$D5,$BD,$38   ;09B822|        |09B83E;
                       db $04,$18,$69,$10,$9D,$38,$04,$29   ;09B82A|        |000018;
                       db $F0,$DD,$45,$06,$F0,$C3,$B0,$04   ;09B832|        |09B811;
                       db $A9,$00,$F0,$BF,$BD,$1D,$06,$9D   ;09B83A|        |      ;
                       db $38,$04,$FE,$C1,$05,$BD,$C1,$05   ;09B842|        |      ;
                       db $C9,$04,$D0,$AD,$A9,$00,$9D,$C1   ;09B84A|        |      ;
                       db $05,$BD,$1D,$06,$29,$F0,$DD,$45   ;09B852|        |0000BD;
                       db $06,$D0,$11,$A9,$00,$9D,$06,$06   ;09B85A|        |0000D0;
                       db $FE,$33,$06,$BD,$33,$06,$29,$07   ;09B862|        |090633;
                       db $9D,$33,$06,$60,$A9,$10,$85,$00   ;09B86A|        |090633;
                       db $BD,$65,$05,$F0,$04,$A9,$F0,$85   ;09B872|        |090565;
                       db $00,$BD,$1D,$06,$18,$65,$00,$9D   ;09B87A|        |      ;
                       db $1D,$06,$60,$A0,$00,$AD,$38,$04   ;09B882|        |096006;
                       db $DD,$38,$04,$B0,$01,$C8,$98,$9D   ;09B88A|        |090438;
                       db $A8,$04,$60,$F4,$F6,$F8,$FA,$FC   ;09B892|        |      ;
                       db $FE,$04,$08,$0C,$14,$18,$1C,$80   ;09B89A|        |090804;
                       db $30,$80,$D0,$A0,$50,$A0,$D0,$A5   ;09B8A2|        |09B824;
                       db $3D,$D0,$03,$4C,$3A,$87,$A9,$00   ;09B8AA|        |0903D0;
                       db $9D,$57,$06,$20,$C8,$FE,$BD,$EF   ;09B8B2|        |090657;
                       db $05,$29,$7F,$D0,$49,$BD,$06,$06   ;09B8BA|        |000029;
                       db $F0,$0B,$AD,$38,$04,$9D,$38,$04   ;09B8C2|        |09B8CF;
                       db $A9,$D3,$4C,$4F,$86,$AD,$38,$04   ;09B8CA|        |      ;
                       db $38,$FD,$38,$04,$B0,$16,$49,$FF   ;09B8D2|        |      ;
                       db $18,$69,$01,$4A,$85,$00,$BD,$1D   ;09B8DA|        |      ;
                       db $06,$D0,$11,$AD,$38,$04,$38,$E5   ;09B8E2|        |0000D0;
                       db $00,$4C,$FC,$B8,$4A,$85,$00,$BD   ;09B8EA|        |      ;
                       db $1D,$06,$D0,$EF,$AD,$38,$04,$18   ;09B8F2|        |09D006;
                       db $65,$00,$29,$F0,$09,$08,$9D,$38   ;09B8FA|        |000000;
                       db $04,$A9,$D4,$4C,$4F,$86,$A5,$80   ;09B902|        |0000A9;
                       db $D0,$4D,$BD,$C1,$05,$C9,$04,$90   ;09B90A|        |09B959;
                       db $46,$AD,$38,$04,$38,$FD,$38,$04   ;09B912|        |0000AD;
                       db $B0,$05,$49,$FF,$18,$69,$01,$85   ;09B91A|        |09B921;
                       db $00,$BD,$06,$06,$F0,$08,$A5,$00   ;09B922|        |      ;
                       db $C9,$10,$B0,$2B,$90,$06,$A5,$00   ;09B92A|        |      ;
                       db $C9,$08,$B0,$23,$BD,$00,$04,$38   ;09B932|        |      ;
                       db $E9,$98,$4A,$A8,$B9,$5A,$B9,$85   ;09B93A|        |      ;
                       db $00,$BD,$1C,$04,$38,$ED,$1C,$04   ;09B942|        |      ;
                       db $B0,$05,$49,$FF,$18,$69,$01,$C5   ;09B94A|        |09B951;
                       db $00,$B0,$04,$A9,$30,$85,$81,$60   ;09B952|        |      ;
                       db $08,$18,$38,$58,$90,$08,$10,$28   ;09B95A|        |      ;
                       db $2E                               ;09B962|        |0906BD;
 
          CODE_09B963: LDA.W $0606,X                        ;09B963|BD0606  |090606;
                       BEQ UNREACH_09B96B                   ;09B966|F003    |09B96B;
                       JMP.W CODE_09BABE                    ;09B968|4CBEBA  |09BABE;
 
 
       UNREACH_09B96B: db $AD,$F3,$07,$29,$80,$D0,$03,$4C   ;09B96B|        |0907F3;
                       db $13,$BA,$BD,$45,$06,$D0,$70,$9D   ;09B973|        |0000BA;
                       db $69,$06,$9D,$57,$06,$A0,$32,$84   ;09B97B|        |      ;
                       db $4B,$C8,$84,$4C,$C8,$84,$48,$C8   ;09B983|        |      ;
                       db $84,$49,$20,$3C,$E3,$20,$5D,$E3   ;09B98B|        |000049;
                       db $A9,$F0,$20,$CB,$BB,$A9,$05,$85   ;09B993|        |      ;
                       db $17,$A9,$0D,$20,$66,$87,$8A,$99   ;09B99B|        |0000A9;
                       db $D8,$05,$A5,$17,$99,$06,$06,$A9   ;09B9A3|        |      ;
                       db $F0,$20,$D4,$BB,$A9,$80,$99,$EF   ;09B9AB|        |09B9CD;
                       db $05,$A5,$17,$99,$33,$06,$A9,$01   ;09B9B3|        |0000A5;
                       db $99,$1D,$06,$A9,$20,$99,$70,$04   ;09B9BB|        |09061D;
                       db $A9,$0D,$99,$7B,$06,$C6,$17,$D0   ;09B9C3|        |      ;
                       db $D0,$A9,$00,$9D,$33,$06,$A9,$01   ;09B9CB|        |09B976;
                       db $9D,$1D,$06,$FE,$45,$06,$A9,$60   ;09B9D3|        |09061D;
                       db $9D,$70,$04,$A9,$40,$85,$3D,$9D   ;09B9DB|        |090470;
                       db $7B,$06,$A9,$60,$4C,$5F,$E2,$A0   ;09B9E3|        |      ;
                       db $D2,$20,$DD,$BB,$20,$ED,$BB,$D0   ;09B9EB|        |000020;
                       db $1E,$A9,$D2,$20,$CB,$BB,$AD,$F3   ;09B9F3|        |09D2A9;
                       db $07,$29,$7F,$8D,$F3,$07,$A9,$30   ;09B9FB|        |000029;
                       db $9D,$58,$06,$9D,$59,$06,$9D,$5A   ;09BA03|        |090658;
                       db $06,$9D,$5B,$06,$9D,$5C,$06,$60   ;09BA0B|        |00009D;
                       db $A9,$60,$9D,$70,$04,$A4,$3D,$D0   ;09BA13|        |      ;
                       db $1D,$C8,$8C,$F3,$07,$BD,$EF,$05   ;09BA1B|        |098CC8;
                       db $29,$7F,$C9,$5D,$F0,$0D,$A9,$40   ;09BA23|        |      ;
                       db $20,$61,$86,$A9,$7B,$20,$5F,$E2   ;09BA2B|        |098661;
                       db $4C,$04,$BC,$4C,$2C,$BC,$A9,$00   ;09BA33|        |09BC04;
                       db $9D,$F2,$04,$A9,$60,$9D,$09,$05   ;09BA3B|        |0904F2;
                       db $BD,$45,$06,$29,$0F,$A8,$B9,$1B   ;09BA43|        |090645;
                       db $BD,$C9,$FF,$D0,$03,$AD,$38,$04   ;09BA4B|        |09FFC9;
                       db $38,$FD,$38,$04,$85,$00,$B0,$11   ;09BA53|        |      ;
                       db $49,$FF,$18,$69,$01,$85,$00,$A9   ;09BA5B|        |      ;
                       db $FF,$9D,$F2,$04,$A9,$A0,$9D,$09   ;09BA63|        |04F29D;
                       db $05,$A5,$00,$C9,$04,$B0,$0B,$FE   ;09BA6B|        |0000A5;
                       db $45,$06,$BD,$45,$06,$29,$F3,$9D   ;09BA73|        |000006;
                       db $45,$06,$20,$ED,$BB,$D0,$29,$BD   ;09BA7B|        |000006;
                       db $45,$06,$18,$69,$10,$29,$3F,$9D   ;09BA83|        |000006;
                       db $45,$06,$29,$F0,$4A,$4A,$4A,$A8   ;09BA8B|        |000006;
                       db $B9,$1F,$BD,$9D,$33,$06,$B9,$20   ;09BA93|        |09BD1F;
                       db $BD,$9D,$1D,$06,$B9,$27,$BD,$9D   ;09BA9B|        |091D9D;
                       db $37,$05,$B9,$28,$BD,$9D,$20,$05   ;09BAA3|        |000005;
                       db $BD,$1C,$04,$C9,$30,$B0,$02,$A9   ;09BAAB|        |09041C;
                       db $30,$C9,$80,$90,$02,$A9,$7F,$9D   ;09BAB3|        |09BA7E;
                       db $1C,$04,$60                       ;09BABB|        |096004;
 
          CODE_09BABE: LDA.W $07F3                          ;09BABE|ADF307  |0907F3;
                       AND.B #$80                           ;09BAC1|2980    |      ;
                       BEQ UNREACH_09BAD7                   ;09BAC3|F012    |09BAD7;
                       LDA.B #$00                           ;09BAC5|A900    |      ;
                       STA.W $0645,X                        ;09BAC7|9D4506  |090645;
                       JSR.W CODE_09BC86                    ;09BACA|2086BC  |09BC86;
                       JSR.W CODE_09BBED                    ;09BACD|20EDBB  |09BBED;
                       JSR.W CODE_09BCAB                    ;09BAD0|20ABBC  |09BCAB;
                       TAY                                  ;09BAD3|A8      |      ;
                       JMP.W CODE_09BBDD                    ;09BAD4|4CDDBB  |09BBDD;
 
 
       UNREACH_09BAD7: db $A9,$20,$9D,$70,$04,$AC,$F3,$07   ;09BAD7|        |      ;
                       db $88,$D0,$2C,$A9,$60,$9D,$70,$04   ;09BADF|        |      ;
                       db $BD,$EF,$05,$29,$7F,$C9,$5D,$F0   ;09BAE7|        |0905EF;
                       db $03,$4C,$09,$BC,$20,$2C,$BC,$90   ;09BAEF|        |00004C;
                       db $C5,$4C,$3A,$87,$BD,$69,$06,$29   ;09BAF7|        |00004C;
                       db $F0,$F0,$21,$A9,$28,$20,$5F,$E2   ;09BAFF|        |09BAF1;
                       db $4C,$23,$BB,$A9,$7A,$D0,$F6,$20   ;09BB07|        |09BB23;
                       db $86,$BC,$BD,$7B,$06,$F0,$E5,$A9   ;09BB0F|        |0000BC;
                       db $04,$20,$05,$89,$BD,$7B,$06,$F0   ;09BB17|        |000020;
                       db $EA,$20,$AC,$BB,$A9,$00,$9D,$69   ;09BB1F|        |      ;
                       db $06,$BD,$7B,$06,$D0,$0A,$20,$AB   ;09BB27|        |0000BD;
                       db $BC,$18,$69,$04,$9D,$00,$04,$60   ;09BB2F|        |096918;
                       db $BC,$45,$06,$D0,$0C,$20,$AB,$BC   ;09BB37|        |090645;
                       db $9D,$00,$04,$FE,$45,$06,$4C,$98   ;09BB3F|        |090400;
                       db $BB,$88,$D0,$17,$20,$ED,$BB,$D0   ;09BB47|        |      ;
                       db $11,$A9,$08,$9D,$33,$06,$20,$AB   ;09BB4F|        |0000A9;
                       db $BC,$18,$69,$02,$9D,$00,$04,$FE   ;09BB57|        |096918;
                       db $45,$06,$60,$88,$D0,$22,$DE,$33   ;09BB5F|        |000006;
                       db $06,$D0,$F7,$A9,$40,$9D,$33,$06   ;09BB67|        |0000D0;
                       db $A9,$29,$20,$66,$87,$A9,$DF,$99   ;09BB6F|        |      ;
                       db $EF,$05,$A9,$00,$99,$C1,$05,$A9   ;09BB77|        |00A905;
                       db $60,$99,$70,$04,$FE,$45,$06,$60   ;09BB7F|        |      ;
                       db $DE,$33,$06,$D0,$D5,$A9,$00,$9D   ;09BB87|        |090633;
                       db $45,$06,$20,$AB,$BC,$9D,$00,$04   ;09BB8F|        |000006;
                       db $60,$BD,$06,$06,$29,$03,$0A,$A8   ;09BB97|        |      ;
                       db $B9,$53,$BD,$9D,$33,$06,$B9,$54   ;09BB9F|        |09BD53;
                       db $BD,$9D,$1D,$06,$60,$BD,$69,$06   ;09BBA7|        |091D9D;
                       db $F0,$19,$A0,$01,$B9,$4E,$05,$C9   ;09BBAF|        |09BBCA;
                       db $0D,$D0,$0B,$A9,$00,$99,$69,$06   ;09BBB7|        |090BD0;
                       db $BD,$8D,$06,$99,$8D,$06,$C8,$C0   ;09BBBF|        |09068D;
                       db $0D,$D0,$E9,$60,$9D,$00,$04,$A9   ;09BBC7|        |09E9D0;
                       db $10,$9D,$8C,$04,$60,$99,$00,$04   ;09BBCF|        |09BB6E;
                       db $A9,$10,$99,$8C,$04,$60           ;09BBD7|        |      ;
 
          CODE_09BBDD: LDA.W $0633,X                        ;09BBDD|BD3306  |090633;
                       AND.B #$03                           ;09BBE0|2903    |      ;
                       BNE CODE_09BBE7                      ;09BBE2|D003    |09BBE7;
                       TYA                                  ;09BBE4|98      |      ;
                       BNE CODE_09BBE9                      ;09BBE5|D002    |09BBE9;
 
          CODE_09BBE7: LDA.B #$F0                           ;09BBE7|A9F0    |      ;
 
          CODE_09BBE9: STA.W $0400,X                        ;09BBE9|9D0004  |090400;
                       RTS                                  ;09BBEC|60      |      ;
 
 
          CODE_09BBED: LDA.W $061D,X                        ;09BBED|BD1D06  |09061D;
                       ORA.W $0633,X                        ;09BBF0|1D3306  |090633;
                       BEQ CODE_09BC03                      ;09BBF3|F00E    |09BC03;
                       DEC.W $0633,X                        ;09BBF5|DE3306  |090633;
                       LDY.W $0633,X                        ;09BBF8|BC3306  |090633;
                       INY                                  ;09BBFB|C8      |      ;
                       BNE CODE_09BC01                      ;09BBFC|D003    |09BC01;
                       DEC.W $061D,X                        ;09BBFE|DE1D06  |09061D;
 
          CODE_09BC01: LDA.B #$01                           ;09BC01|A901    |      ;
 
          CODE_09BC03: RTS                                  ;09BC03|60      |      ;
 
                       db $A9,$3F,$8D,$ED,$07,$A9,$00,$9D   ;09BC04|        |      ;
                       db $69,$06,$9D,$57,$06,$A9,$60,$9D   ;09BC0C|        |      ;
                       db $70,$04,$BD,$06,$06,$0A,$A8,$B9   ;09BC14|        |09BC1A;
                       db $2F,$BD,$9D,$09,$05,$B9,$30,$BD   ;09BC1C|        |099DBD;
                       db $9D,$F2,$04,$A9,$DD,$4C,$4F,$86   ;09BC24|        |0904F2;
                       db $A9,$00,$9D,$69,$06,$9D,$57,$06   ;09BC2C|        |      ;
                       db $BD,$C1,$05,$C9,$00,$D0,$18,$A9   ;09BC34|        |0905C1;
                       db $00,$A0,$08,$20,$1E,$FC,$F0,$0F   ;09BC3C|        |      ;
                       db $FE,$C1,$05,$A9,$0E,$A0,$08,$20   ;09BC44|        |0905C1;
                       db $5C,$EF,$A9,$40,$9D,$70,$04,$BD   ;09BC4C|        |40A9EF;
                       db $C1,$05,$C9,$06,$D0,$2A,$BC,$06   ;09BC54|        |000005;
                       db $06,$B9,$13,$BD,$49,$FF,$2D,$ED   ;09BC5C|        |0000B9;
                       db $07,$8D,$ED,$07,$D0,$18,$A9,$61   ;09BC64|        |00008D;
                       db $20,$5F,$E2,$EE,$EC,$07,$A9,$80   ;09BC6C|        |09E25F;
                       db $8D,$F3,$07,$A9,$00,$8D,$EE,$07   ;09BC74|        |0907F3;
                       db $8D,$EF,$07,$20,$6B,$BF,$38,$60   ;09BC7C|        |0907EF;
                       db $18,$60                           ;09BC84|        |      ;
 
          CODE_09BC86: LDA.W $0606,X                        ;09BC86|BD0606  |090606;
                       ASL A                                ;09BC89|0A      |      ;
                       TAY                                  ;09BC8A|A8      |      ;
                       LDA.W UNREACH_09BD3B,Y               ;09BC8B|B93BBD  |09BD3B;
                       STA.B $00                            ;09BC8E|8500    |000000;
                       LDA.W UNREACH_09BD3C,Y               ;09BC90|B93CBD  |09BD3C;
                       STA.B $01                            ;09BC93|8501    |000001;
                       LDY.W $05D8,X                        ;09BC95|BCD805  |0905D8;
                       LDA.W $0438,Y                        ;09BC98|B93804  |090438;
                       CLC                                  ;09BC9B|18      |      ;
                       ADC.B $00                            ;09BC9C|6500    |000000;
                       STA.W $0438,X                        ;09BC9E|9D3804  |090438;
                       LDA.W $041C,Y                        ;09BCA1|B91C04  |09041C;
                       CLC                                  ;09BCA4|18      |      ;
                       ADC.B $01                            ;09BCA5|6501    |000001;
                       STA.W $041C,X                        ;09BCA7|9D1C04  |09041C;
                       RTS                                  ;09BCAA|60      |      ;
 
 
          CODE_09BCAB: LDY.W $0606,X                        ;09BCAB|BC0606  |090606;
                       LDA.W UNREACH_09BD4D,Y               ;09BCAE|B94DBD  |09BD4D;
                       STA.W $04A8,X                        ;09BCB1|9DA804  |0904A8;
                       LDA.W UNREACH_09BD47,Y               ;09BCB4|B947BD  |09BD47;
                       RTS                                  ;09BCB7|60      |      ;
 
                       db $AC,$F3,$07,$88,$D0,$07,$AD,$EC   ;09BCB8|        |0907F3;
                       db $07,$C9,$02,$F0,$28,$A9,$30,$9D   ;09BCC0|        |0000C9;
                       db $57,$06,$AC,$EC,$07,$88,$F0,$20   ;09BCC8|        |000006;
                       db $BD,$1C,$04,$20,$E1,$BC,$B0,$15   ;09BCD0|        |09041C;
                       db $BD,$38,$04,$20,$E1,$BC,$B0,$0D   ;09BCD8|        |090438;
                       db $60,$29,$F8,$F0,$06,$C9,$F8,$F0   ;09BCE0|        |      ;
                       db $02,$18,$60,$38,$60,$4C,$3A,$87   ;09BCE8|        |      ;
                       db $BD,$C1,$05,$C9,$05,$D0,$1B,$A9   ;09BCF0|        |0905C1;
                       db $00,$A0,$08,$20,$1E,$FC,$F0,$12   ;09BCF8|        |      ;
                       db $A9,$0A,$20,$5F,$E2,$BD,$1C,$04   ;09BD00|        |      ;
                       db $29,$F0,$09,$08,$9D,$1C,$04,$FE   ;09BD08|        |      ;
                       db $C1,$05,$60,$01,$02,$04,$08,$10   ;09BD10|        |000005;
                       db $20,$40,$80,$80,$D0,$30,$FF,$80   ;09BD18|        |098040;
                       db $00,$00,$01,$00,$01,$C0,$00,$E0   ;09BD20|        |      ;
                       db $FF,$20,$00,$C0,$FF,$40,$00,$00   ;09BD28|        |C00020;
                       db $FF,$80,$00,$80,$FF,$00,$FF,$20   ;09BD30|        |800080;
                       db $01,$E0,$FE                       ;09BD38|        |0000E0;
 
       UNREACH_09BD3B: db $00                               ;09BD3B|        |      ;
 
       UNREACH_09BD3C: db $00,$F0,$08,$F8,$28,$00,$18,$10   ;09BD3C|        |      ;
                       db $08,$08,$28                       ;09BD44|        |      ;
 
       UNREACH_09BD47: db $D2,$C0,$C6,$CC,$C0,$C6           ;09BD47|        |0000C0;
 
       UNREACH_09BD4D: db $00,$01,$01,$00,$00,$00,$60,$00   ;09BD4D|        |      ;
                       db $20,$00,$40,$00,$70,$00,$80,$00   ;09BD55|        |094000;
                       db $30,$00,$AD,$F3,$07,$29,$80,$D0   ;09BD5D|        |09BD5F;
                       db $03,$4C,$67,$BE,$A9,$88,$9D,$70   ;09BD65|        |00004C;
                       db $04,$AD,$ED,$07,$C9,$0E,$B0,$69   ;09BD6D|        |0000AD;
                       db $A9,$02,$85,$04,$86,$16,$A9,$00   ;09BD75|        |      ;
                       db $85,$00,$85,$62,$AD,$ED,$07,$A0   ;09BD7D|        |000000;
                       db $05,$0A,$26,$62,$88,$D0,$FA,$18   ;09BD85|        |00000A;
                       db $69,$4A,$85,$61,$A5,$62,$69,$21   ;09BD8D|        |      ;
                       db $85,$62,$20,$B5,$E8,$AC,$EE,$07   ;09BD95|        |000062;
                       db $B9,$6E,$BF,$C9,$C0,$90,$0F,$29   ;09BD9D|        |09BF6E;
                       db $0F,$85,$03,$A9,$00,$20,$66,$BF   ;09BDA5|        |A90385;
                       db $C6,$03,$D0,$F9,$F0,$03,$20,$66   ;09BDAD|        |000003;
                       db $BF,$C8,$A5,$00,$C9,$0C,$D0,$E0   ;09BDB5|        |00A5C8;
                       db $8C,$EE,$07,$EE,$ED,$07,$20,$12   ;09BDBD|        |0907EE;
                       db $ED,$C6,$04,$D0,$B1,$AD,$ED,$07   ;09BDC5|        |0904C6;
                       db $C9,$0E,$90,$0A,$A9,$00,$8D,$EE   ;09BDCD|        |      ;
                       db $07,$A9,$08,$8D,$EF,$07,$A6,$16   ;09BDD5|        |0000A9;
                       db $60,$CE,$EF,$07,$D0,$18,$AD,$EE   ;09BDDD|        |      ;
                       db $07,$20,$6B,$BF,$AD,$EE,$07,$18   ;09BDE5|        |000020;
                       db $69,$08,$C9,$20,$B0,$09,$8D,$EE   ;09BDED|        |      ;
                       db $07,$A9,$08,$8D,$EF,$07,$60,$A9   ;09BDF5|        |0000A9;
                       db $31,$85,$49,$20,$3C,$E3,$A9,$00   ;09BDFD|        |000085;
                       db $8D,$F3,$07,$8D,$F1,$07,$8D,$F0   ;09BE05|        |0907F3;
                       db $07,$8D,$EE,$07,$8D,$ED,$07,$9D   ;09BE0D|        |00008D;
                       db $06,$06,$A9,$88,$9D,$70,$04,$A9   ;09BE15|        |000006;
                       db $80,$9D,$38,$04,$A9,$60,$9D,$1C   ;09BE1D|        |09BDBC;
                       db $04,$A9,$40,$85,$3D,$9D,$7B,$06   ;09BE25|        |0000A9;
                       db $A9,$0D,$20,$66,$87,$A9,$01,$99   ;09BE2D|        |      ;
                       db $06,$06,$85,$17,$A9,$88,$99,$70   ;09BE35|        |000006;
                       db $04,$A9,$8A,$20,$66,$87,$A9,$80   ;09BE3D|        |0000A9;
                       db $99,$EF,$05,$A9,$00,$99,$C1,$05   ;09BE45|        |0905EF;
                       db $99,$45,$06,$A5,$17,$F0,$02,$A9   ;09BE4D|        |090645;
                       db $04,$99,$33,$06,$A9,$60,$99,$70   ;09BE55|        |000099;
                       db $04,$C6,$17,$10,$DC,$60,$CE,$EF   ;09BE5D|        |0000C6;
                       db $07,$60,$BD,$06,$06,$F0,$69,$A9   ;09BE65|        |000060;
                       db $00,$9D,$57,$06,$AD,$F3,$07,$D0   ;09BE6D|        |      ;
                       db $56,$20,$ED,$BB,$D0,$51,$A9,$00   ;09BE75|        |000020;
                       db $9D,$A8,$04,$AC,$F1,$07,$B9,$55   ;09BE7D|        |0904A8;
                       db $BF,$C9,$01,$D0,$03,$9D,$A8,$04   ;09BE85|        |D001C9;
                       db $A8,$B9,$5D,$BF,$85,$10,$B9,$60   ;09BE8D|        |      ;
                       db $BF,$85,$11,$B9,$63,$BF,$20,$CB   ;09BE95|        |B91185;
                       db $BB,$A9,$E0,$9D,$EF,$05,$A9,$00   ;09BE9D|        |      ;
                       db $9D,$C1,$05,$A5,$10,$9D,$38,$04   ;09BEA5|        |0905C1;
                       db $A5,$11,$9D,$1C,$04,$EE,$F1,$07   ;09BEAD|        |000011;
                       db $AD,$F1,$07,$29,$07,$8D,$F1,$07   ;09BEB5|        |0907F1;
                       db $A9,$C0,$9D,$33,$06,$A9,$00,$9D   ;09BEBD|        |      ;
                       db $1D,$06,$A9,$20,$9D,$70,$04,$AC   ;09BEC5|        |09A906;
                       db $F3,$07,$88,$D0,$24,$4C,$3A,$87   ;09BECD|        |000007;
                       db $AC,$F3,$07,$88,$D0,$32,$CE,$EF   ;09BED5|        |0907F3;
                       db $07,$D0,$16,$AD,$EE,$07,$20,$6B   ;09BEDD|        |0000D0;
                       db $BF,$AD,$EE,$07,$38,$E9,$08,$90   ;09BEE5|        |07EEAD;
                       db $09,$8D,$EE,$07,$A9,$08,$8D,$EF   ;09BEED|        |      ;
                       db $07,$60,$AD,$F0,$07,$C9,$02,$D0   ;09BEF5|        |000060;
                       db $56,$A9,$80,$20,$61,$86,$A9,$02   ;09BEFD|        |0000A9;
                       db $8D,$F3,$07,$A9,$00,$4C,$F4,$87   ;09BF05|        |0907F3;
                       db $BD,$1D,$06,$F0,$17,$29,$04,$F0   ;09BF0D|        |09061D;
                       db $04,$A9,$28,$D0,$02,$A9,$20,$DE   ;09BF15|        |0000A9;
                       db $1D,$06,$D0,$02,$A9,$18,$20,$6B   ;09BF1D|        |09D006;
                       db $BF,$4C,$4C,$BF,$A9,$03,$20,$E0   ;09BF25|        |BF4C4C;
                       db $88,$A9,$00,$20,$F4,$87,$AD,$F3   ;09BF2D|        |      ;
                       db $07,$F0,$0A,$A9,$18,$8D,$EE,$07   ;09BF35|        |0000F0;
                       db $A9,$01,$8D,$EF,$07,$BD,$69,$06   ;09BF3D|        |      ;
                       db $F0,$05,$A9,$20,$9D,$1D,$06,$A9   ;09BF45|        |09BF4C;
                       db $00,$9D,$69,$06,$9D,$57,$06,$60   ;09BF4D|        |      ;
                       db $00,$01,$02,$01,$00,$02,$01,$02   ;09BF55|        |      ;
                       db $80,$60,$A0,$60,$8C,$8C,$E4,$E0   ;09BF5D|        |09BFBF;
                       db $E0,$E6,$00,$4C,$16,$ED,$4C,$A0   ;09BF65|        |      ;
                       db $E5,$40,$53,$C3,$41,$42,$C3,$8E   ;09BF6D|        |000040;
                       db $7A,$50,$4A,$6C,$C2,$51,$52,$C2   ;09BF75|        |      ;
                       db $80,$9E,$89,$43,$4D,$7C,$6F,$60   ;09BF7D|        |09BF1D;
                       db $61,$62,$63,$75,$98,$9E,$88,$00   ;09BF85|        |000062;
                       db $5C,$5F,$7F,$70,$71,$72,$73,$83   ;09BF8D|        |707F5F;
                       db $84,$96,$00,$00,$43,$44,$45,$46   ;09BF95|        |000096;
                       db $47,$48,$49,$00,$4B,$C2,$C2,$54   ;09BF9D|        |000048;
                       db $55,$56,$57,$58,$59,$5A,$5B,$C2   ;09BFA5|        |000056;
                       db $8A,$8B,$64,$65,$66,$67,$68,$69   ;09BFAD|        |      ;
                       db $6A,$6B,$8C,$8D,$9A,$9B,$74,$00   ;09BFB5|        |      ;
                       db $76,$77,$78,$79,$00,$7B,$9C,$9D   ;09BFBD|        |000077;
                       db $C4,$4E,$4F,$88,$89,$C4,$C3,$5D   ;09BFC5|        |00004E;
                       db $5E,$4F,$00,$99,$C4,$C3,$6D,$6E   ;09BFCD|        |09004F;
                       db $C2,$87,$C4,$C3,$7D,$7E,$C2,$97   ;09BFD5|        |      ;
                       db $C4,$C3,$81,$82,$C2,$85,$C4,$C2   ;09BFDD|        |0000C3;
                       db $90,$91,$92,$00,$94,$95,$C4,$FF   ;09BFE5|        |09BF78;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;09BFED|        |FFFFFF;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;09BFF5|        |FFFFFF;
                       db $FF,$FF,$FF                       ;09BFFD|        |00FFFF;
 
