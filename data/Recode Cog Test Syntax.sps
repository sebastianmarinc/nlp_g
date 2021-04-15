* Encoding: UTF-8.
*Recode Cognitive Tests for Correct (1), Wrong (0), or Missing (-99).

*Gc1 - Extended Range Vocab Test
*No penalty for guessing. Missing or incorrect = 0.

RECODE Gc1_1 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc1_1re.
RECODE Gc1_2 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc1_2re.
RECODE Gc1_3 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc1_3re.
RECODE Gc1_4 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc1_4re.
RECODE Gc1_5 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc1_5re.
RECODE Gc1_6 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_6re.
RECODE Gc1_7 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc1_7re.
RECODE Gc1_8 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc1_8re.
RECODE Gc1_9 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc1_9re.
RECODE Gc1_10 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc1_10re.
RECODE Gc1_11 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_11re.
RECODE Gc1_12 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc1_12re.
RECODE Gc1_13 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc1_13re.
RECODE Gc1_14 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_14re.
RECODE Gc1_15 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_15re.
RECODE Gc1_16 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc1_16re.
RECODE Gc1_17 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc1_17re.
RECODE Gc1_18 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_18re.
RECODE Gc1_19 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc1_19re.
RECODE Gc1_20 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc1_20re.
RECODE Gc1_21 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc1_21re.
RECODE Gc1_22 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_22re.
RECODE Gc1_23 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc1_23re.
RECODE Gc1_24 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc1_24re.
EXECUTE.

*Penalty for incorrect (-.25), in case I need to copy-paste later.

*RECODE Gc1_1 (1=-.25) (2=-.25) (3=-.25) (4=-.25) (5=1) (SYSMIS=0) INTO Gc1_1re.
*RECODE Gc1_2 (1=-.25) (2=-.25) (3=-.25) (4=1) (5=-.25) (SYSMIS=0) INTO Gc1_2re.
*RECODE Gc1_3 (1=-.25) (2=-.25) (3=1) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_3re.
*RECODE Gc1_4 (1=-.25) (2=-.25) (3=-.25) (4=-.25) (5=1) (SYSMIS=0) INTO Gc1_4re.
*RECODE Gc1_5 (1=-.25) (2=-.25) (3=1) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_5re.
*RECODE Gc1_6 (1=1) (2=-.25) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_6re.
*RECODE Gc1_7 (1=-.25) (2=-.25) (3=-.25) (4=-.25) (5=1) (SYSMIS=0) INTO Gc1_7re.
*RECODE Gc1_8 (1=-.25) (2=-.25) (3=-.25) (4=-.25) (5=1) (SYSMIS=0) INTO Gc1_8re.
*RECODE Gc1_9 (1=-.25) (2=-.25) (3=-.25) (4=1) (5=-.25) (SYSMIS=0) INTO Gc1_9re.
*RECODE Gc1_10 (1=-.25) (2=-.25) (3=1) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_10re.
*RECODE Gc1_11 (1=-.25) (2=1) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_11re.
*RECODE Gc1_12 (1=-.25) (2=-.25) (3=-.25) (4=1) (5=-.25) (SYSMIS=0) INTO Gc1_12re.
*RECODE Gc1_13 (1=-.25) (2=-.25) (3=-.25) (4=-.25) (5=1) (SYSMIS=0) INTO Gc1_13re.
*RECODE Gc1_14 (1=-.25) (2=1) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_14re.
*RECODE Gc1_15 (1=-.25) (2=1) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_15re.
*RECODE Gc1_16 (1=-.25) (2=-.25) (3=-.25) (4=-.25) (5=1) (SYSMIS=0) INTO Gc1_16re.
*RECODE Gc1_17 (1=-.25) (2=-.25) (3=-.25) (4=1) (5=-.25) (SYSMIS=0) INTO Gc1_17re.
*RECODE Gc1_18 (1=-.25) (2=1) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_18re.
*RECODE Gc1_19 (1=-.25) (2=-.25) (3=1) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_19re.
*RECODE Gc1_20 (1=-.25) (2=-.25) (3=-.25) (4=1) (5=-.25) (SYSMIS=0) INTO Gc1_20re.
*RECODE Gc1_21 (1=-.25) (2=-.25) (3=1) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_21re.
*RECODE Gc1_22 (1=1) (2=-.25) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_22re.
*RECODE Gc1_23 (1=-.25) (2=-.25) (3=1) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_23re.
*RECODE Gc1_24 (1=1) (2=-.25) (3=-.25) (4=-.25) (5=-.25) (SYSMIS=0) INTO Gc1_24re.
*EXECUTE.


*Compute Mean Score for Gc1 - Extended Range Vocab Test

COMPUTE Gc1_mean=MEAN(Gc1_1re, Gc1_2re, Gc1_3re, Gc1_4re, Gc1_5re, Gc1_6re, Gc1_7re, Gc1_8re, 
    Gc1_9re, Gc1_10re, Gc1_11re, Gc1_12re, Gc1_13re, Gc1_14re, Gc1_15re, Gc1_16re, Gc1_17re, Gc1_18re, 
    Gc1_19re, Gc1_20re, Gc1_21re, Gc1_22re, Gc1_23re, Gc1_24re).
EXECUTE.


*Gc2 - Advanced Vocab Test I

RECODE Gc2_1 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_1re.
RECODE Gc2_2 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_2re.
RECODE Gc2_3 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_3re.
RECODE Gc2_4 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc2_4re.
RECODE Gc2_5 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_5re.
RECODE Gc2_6 (1=1) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc2_6re.
RECODE Gc2_7 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_7re.
RECODE Gc2_8 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_8re.
RECODE Gc2_9 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc2_9re.
RECODE Gc2_10 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc2_10re.
RECODE Gc2_11 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc2_11re.
RECODE Gc2_12 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc2_12re.
RECODE Gc2_13 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc2_13re.
RECODE Gc2_14 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc2_14re.
RECODE Gc2_15 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc2_15re.
RECODE Gc2_16 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc2_16re.
RECODE Gc2_17 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc2_17re.
RECODE Gc2_18 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gc2_18re.
EXECUTE.

*Compute Mean score for Gc2 - Advanced Vocab Test I

COMPUTE Gc2_mean=Mean(Gc2_1re,Gc2_2re,Gc2_3re,Gc2_4re,Gc2_5re,Gc2_6re,Gc2_7re,Gc2_8re,Gc2_9re,
    Gc2_10re,Gc2_11re,Gc2_12re,Gc2_13re,Gc2_14re,Gc2_15re,Gc2_16re,Gc2_17re,Gc2_18re).
EXECUTE.


*Gc3 - Advanced Vocab Test II

RECODE Gc3_1 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc3_1re.
RECODE Gc3_2 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc3_2re.
RECODE Gc3_3 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc3_3re.
RECODE Gc3_4 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_4re.
RECODE Gc3_5 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_5re.
RECODE Gc3_6 (1=1) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_6re.
RECODE Gc3_7 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_7re.
RECODE Gc3_8 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_8re.
RECODE Gc3_9 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc3_9re.
RECODE Gc3_10 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc3_10re.
RECODE Gc3_11 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc3_11re.
RECODE Gc3_12 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc3_12re.
RECODE Gc3_13 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc3_13re.
RECODE Gc3_14 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gc3_14re.
RECODE Gc3_15 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_15re.
RECODE Gc3_16 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_16re.
RECODE Gc3_17 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gc3_17re.
RECODE Gc3_18 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gc3_18re.
EXECUTE.

*Compute Mean score for Gc3 - Advanced Vocab Test II

COMPUTE Gc3_mean=Mean(Gc3_1re,Gc3_2re,Gc3_3re,Gc3_4re,Gc3_5re,Gc3_6re,Gc3_7re,Gc3_8re,Gc3_9re,
    Gc3_10re,Gc3_11re,Gc3_12re,Gc3_13re,Gc3_14re,Gc3_15re,Gc3_16re,Gc3_17re,Gc3_18re).
EXECUTE.


*Gsm1, Gsm2, Gsm3 GOES HERE



*Recode Gf1 - Letter Sets Test

RECODE Gf1_1 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf1_1re.
RECODE Gf1_2 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf1_2re.
RECODE Gf1_3 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf1_3re.
RECODE Gf1_4 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf1_4re.
RECODE Gf1_5 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf1_5re.
RECODE Gf1_6 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf1_6re.
RECODE Gf1_7 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf1_7re.
RECODE Gf1_8 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf1_8re.
RECODE Gf1_9 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gf1_9re.
RECODE Gf1_10 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf1_10re.
RECODE Gf1_11 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf1_11re.
RECODE Gf1_12 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf1_12re.
RECODE Gf1_13 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf1_13re.
RECODE Gf1_14 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf1_14re.
RECODE Gf1_15 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf1_15re.
EXECUTE.

*Compute Mean score for Gf1 - Letter Sets Test

COMPUTE Gf1_mean=Mean(Gf1_1re,Gf1_2re,Gf1_3re,Gf1_4re,Gf1_5re,Gf1_6re,Gf1_7re,Gf1_8re,Gf1_9re,
    Gf1_10re,Gf1_11re,Gf1_12re,Gf1_13re,Gf1_14re,Gf1_15re).
EXECUTE.


*Recode Gf2 - Locations Test

RECODE Gf2_1 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf2_1re.
RECODE Gf2_2 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf2_2re.
RECODE Gf2_3 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf2_3re.
RECODE Gf2_4 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gf2_4re.
RECODE Gf2_5 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf2_5re.
RECODE Gf2_6 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf2_6re.
RECODE Gf2_7 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gf2_7re.
RECODE Gf2_8 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gf2_8re.
RECODE Gf2_9 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf2_9re.
RECODE Gf2_10 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf2_10re.
RECODE Gf2_11 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gf2_11re.
RECODE Gf2_12 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf2_12re.
RECODE Gf2_13 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gf2_13re.
RECODE Gf2_14 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gf2_14re.
EXECUTE.

*Compute mean score for Gf2 - Locations Test

COMPUTE Gf2_mean=Mean(Gf2_1re,Gf2_2re,Gf2_3re,Gf2_4re,Gf2_5re,Gf2_6re,Gf2_7re,Gf2_8re,Gf2_9re,
    Gf2_10re,Gf2_11re,Gf2_12re,Gf2_13re,Gf2_14re).
EXECUTE.


*Recode Gf3 - Figure Classification

RECODE Gf3_A1_1 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A1_1re.
RECODE Gf3_A1_2 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A1_2re.
RECODE Gf3_A1_3 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A1_3re.
RECODE Gf3_A1_4 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A1_4re.
RECODE Gf3_A1_5 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A1_5re.
RECODE Gf3_A1_6 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A1_6re.
RECODE Gf3_A1_7 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A1_7re.
RECODE Gf3_A1_8 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A1_8re.
RECODE Gf3_A2_1 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A2_1re.
RECODE Gf3_A2_2 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A2_2re.
RECODE Gf3_A2_3 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A2_3re.
RECODE Gf3_A2_4 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A2_4re.
RECODE Gf3_A2_5 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A2_5re.
RECODE Gf3_A2_6 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A2_6re.
RECODE Gf3_A2_7 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A2_7re.
RECODE Gf3_A2_8 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A2_8re.
RECODE Gf3_A3_1 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A3_1re.
RECODE Gf3_A3_2 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A3_2re.
RECODE Gf3_A3_3 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A3_3re.
RECODE Gf3_A3_4 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A3_4re.
RECODE Gf3_A3_5 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A3_5re.
RECODE Gf3_A3_6 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A3_6re.
RECODE Gf3_A3_7 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A3_7re.
RECODE Gf3_A3_8 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A3_8re.
RECODE Gf3_A4_1 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A4_1re.
RECODE Gf3_A4_2 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A4_2re.
RECODE Gf3_A4_3 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A4_3re.
RECODE Gf3_A4_4 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A4_4re.
RECODE Gf3_A4_5 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A4_5re.
RECODE Gf3_A4_6 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A4_6re.
RECODE Gf3_A4_7 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A4_7re.
RECODE Gf3_A4_8 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A4_8re.
RECODE Gf3_A5_1 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A5_1re.
RECODE Gf3_A5_2 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A5_2re.
RECODE Gf3_A5_3 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A5_3re.
RECODE Gf3_A5_4 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A5_4re.
RECODE Gf3_A5_5 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A5_5re.
RECODE Gf3_A5_6 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A5_6re.
RECODE Gf3_A5_7 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A5_7re.
RECODE Gf3_A5_8 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A5_8re.
RECODE Gf3_A6_1 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A6_1re.
RECODE Gf3_A6_2 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A6_2re.
RECODE Gf3_A6_3 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A6_3re.
RECODE Gf3_A6_4 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A6_4re.
RECODE Gf3_A6_5 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A6_5re.
RECODE Gf3_A6_6 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A6_6re.
RECODE Gf3_A6_7 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A6_7re.
RECODE Gf3_A6_8 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A6_8re.
RECODE Gf3_A7_1 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A7_1re.
RECODE Gf3_A7_2 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A7_2re.
RECODE Gf3_A7_3 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A7_3re.
RECODE Gf3_A7_4 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A7_4re.
RECODE Gf3_A7_5 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A7_5re.
RECODE Gf3_A7_6 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A7_6re.
RECODE Gf3_A7_7 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A7_7re.
RECODE Gf3_A7_8 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A7_8re.
RECODE Gf3_A8_1 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A8_1re.
RECODE Gf3_A8_2 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A8_2re.
RECODE Gf3_A8_3 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A8_3re.
RECODE Gf3_A8_4 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A8_4re.
RECODE Gf3_A8_5 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A8_5re.
RECODE Gf3_A8_6 (1=1) (2=0) (SYSMIS=0) INTO Gf3_A8_6re.
RECODE Gf3_A8_7 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A8_7re.
RECODE Gf3_A8_8 (1=0) (2=1) (SYSMIS=0) INTO Gf3_A8_8re.
RECODE Gf3_A9_1 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A9_1re.
RECODE Gf3_A9_2 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A9_2re.
RECODE Gf3_A9_3 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A9_3re.
RECODE Gf3_A9_4 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A9_4re.
RECODE Gf3_A9_5 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A9_5re.
RECODE Gf3_A9_6 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A9_6re.
RECODE Gf3_A9_7 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A9_7re.
RECODE Gf3_A9_8 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A9_8re.
RECODE Gf3_A10_1 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A10_1re.
RECODE Gf3_A10_2 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A10_2re.
RECODE Gf3_A10_3 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A10_3re.
RECODE Gf3_A10_4 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A10_4re.
RECODE Gf3_A10_5 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A10_5re.
RECODE Gf3_A10_6 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A10_6re.
RECODE Gf3_A10_7 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A10_7re.
RECODE Gf3_A10_8 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A10_8re.
RECODE Gf3_A11_1 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A11_1re.
RECODE Gf3_A11_2 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A11_2re.
RECODE Gf3_A11_3 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A11_3re.
RECODE Gf3_A11_4 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A11_4re.
RECODE Gf3_A11_5 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A11_5re.
RECODE Gf3_A11_6 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A11_6re.
RECODE Gf3_A11_7 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A11_7re.
RECODE Gf3_A11_8 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A11_8re.
RECODE Gf3_A12_1 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A12_1re.
RECODE Gf3_A12_2 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A12_2re.
RECODE Gf3_A12_3 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A12_3re.
RECODE Gf3_A12_4 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A12_4re.
RECODE Gf3_A12_5 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A12_5re.
RECODE Gf3_A12_6 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A12_6re.
RECODE Gf3_A12_7 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A12_7re.
RECODE Gf3_A12_8 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A12_8re.
RECODE Gf3_A13_1 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A13_1re.
RECODE Gf3_A13_2 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A13_2re.
RECODE Gf3_A13_3 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A13_3re.
RECODE Gf3_A13_4 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A13_4re.
RECODE Gf3_A13_5 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A13_5re.
RECODE Gf3_A13_6 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A13_6re.
RECODE Gf3_A13_7 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A13_7re.
RECODE Gf3_A13_8 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A13_8re.
RECODE Gf3_A14_1 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A14_1re.
RECODE Gf3_A14_2 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A14_2re.
RECODE Gf3_A14_3 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A14_3re.
RECODE Gf3_A14_4 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A14_4re.
RECODE Gf3_A14_5 (1=1) (2=0) (3=0) (SYSMIS=0) INTO Gf3_A14_5re.
RECODE Gf3_A14_6 (1=0) (2=0) (3=1) (SYSMIS=0) INTO Gf3_A14_6re.
RECODE Gf3_A14_7 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A14_7re.
RECODE Gf3_A14_8 (1=0) (2=1) (3=0) (SYSMIS=0) INTO Gf3_A14_8re.
EXECUTE.

*Compute mean score Gf3 - Figure Classification

COMPUTE Gf3_mean=Mean(Gf3_A1_1re,Gf3_A1_2re,Gf3_A1_3re,Gf3_A1_4re,Gf3_A1_5re,Gf3_A1_6re,Gf3_A1_7re,
    Gf3_A1_8re,Gf3_A2_1re,Gf3_A2_2re,Gf3_A2_3re,Gf3_A2_4re,Gf3_A2_5re,Gf3_A2_6re,Gf3_A2_7re,Gf3_A2_8re,
    Gf3_A3_1re,Gf3_A3_2re,Gf3_A3_3re,Gf3_A3_4re,Gf3_A3_5re,Gf3_A3_6re,Gf3_A3_7re,Gf3_A3_8re,Gf3_A4_1re,
    Gf3_A4_2re,Gf3_A4_3re,Gf3_A4_4re,Gf3_A4_5re,Gf3_A4_6re,Gf3_A4_7re,Gf3_A4_8re,Gf3_A5_1re,Gf3_A5_2re,
    Gf3_A5_3re,Gf3_A5_4re,Gf3_A5_5re,Gf3_A5_6re,Gf3_A5_7re,Gf3_A5_8re,Gf3_A6_1re,Gf3_A6_2re,Gf3_A6_3re,
    Gf3_A6_4re,Gf3_A6_5re,Gf3_A6_6re,Gf3_A6_7re,Gf3_A6_8re,Gf3_A7_1re,Gf3_A7_2re,Gf3_A7_3re,Gf3_A7_4re,
    Gf3_A7_5re,Gf3_A7_6re,Gf3_A7_7re,Gf3_A7_8re,Gf3_A8_1re,Gf3_A8_2re,Gf3_A8_3re,Gf3_A8_4re,Gf3_A8_5re,
    Gf3_A8_6re,Gf3_A8_7re,Gf3_A8_8re,Gf3_A9_1re,Gf3_A9_2re,Gf3_A9_3re,Gf3_A9_4re,Gf3_A9_5re,Gf3_A9_6re,
    Gf3_A9_7re,Gf3_A9_8re,Gf3_A10_1re,Gf3_A10_2re,Gf3_A10_3re,Gf3_A10_4re,Gf3_A10_5re,Gf3_A10_6re,
    Gf3_A10_7re,Gf3_A10_8re,Gf3_A11_1re,Gf3_A11_2re,Gf3_A11_3re,Gf3_A11_4re,Gf3_A11_5re,Gf3_A11_6re,
    Gf3_A11_7re,Gf3_A11_8re,Gf3_A12_1re,Gf3_A12_2re,Gf3_A12_3re,Gf3_A12_4re,Gf3_A12_5re,Gf3_A12_6re,
    Gf3_A12_7re,Gf3_A12_8re,Gf3_A13_1re,Gf3_A13_2re,Gf3_A13_3re,Gf3_A13_4re,Gf3_A13_5re,Gf3_A13_6re,
    Gf3_A13_7re,Gf3_A13_8re,Gf3_A14_1re,Gf3_A14_2re,Gf3_A14_3re,Gf3_A14_4re,Gf3_A14_5re,Gf3_A14_6re,
    Gf3_A14_7re,Gf3_A14_8re).
EXECUTE.


*Recode Gv1 - Form Board Test

RECODE Gv1_A1_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A1_1re.
RECODE Gv1_A1_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A1_2re.
RECODE Gv1_A1_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A1_3re.
RECODE Gv1_A1_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A1_4re.
RECODE Gv1_A1_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A1_5re.
RECODE Gv1_A2_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A2_1re.
RECODE Gv1_A2_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A2_2re.
RECODE Gv1_A2_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A2_3re.
RECODE Gv1_A2_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A2_4re.
RECODE Gv1_A2_5 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A2_5re.
RECODE Gv1_A3_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A3_1re.
RECODE Gv1_A3_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A3_2re.
RECODE Gv1_A3_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A3_3re.
RECODE Gv1_A3_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A3_4re.
RECODE Gv1_A3_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A3_5re.
RECODE Gv1_A4_1 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A4_1re.
RECODE Gv1_A4_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A4_2re.
RECODE Gv1_A4_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A4_3re.
RECODE Gv1_A4_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A4_4re.
RECODE Gv1_A4_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A4_5re.
RECODE Gv1_A5_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A5_1re.
RECODE Gv1_A5_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A5_2re.
RECODE Gv1_A5_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A5_3re.
RECODE Gv1_A5_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A5_4re.
RECODE Gv1_A5_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A5_5re.
RECODE Gv1_A6_1 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A6_1re.
RECODE Gv1_A6_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A6_2re.
RECODE Gv1_A6_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A6_3re.
RECODE Gv1_A6_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A6_4re.
RECODE Gv1_A6_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A6_5re.
RECODE Gv1_A7_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A7_1re.
RECODE Gv1_A7_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A7_2re.
RECODE Gv1_A7_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A7_3re.
RECODE Gv1_A7_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A7_4re.
RECODE Gv1_A7_5 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A7_5re.
RECODE Gv1_A8_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A8_1re.
RECODE Gv1_A8_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A8_2re.
RECODE Gv1_A8_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A8_3re.
RECODE Gv1_A8_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A8_4re.
RECODE Gv1_A8_5 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A8_5re.
RECODE Gv1_A9_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A9_1re.
RECODE Gv1_A9_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A9_2re.
RECODE Gv1_A9_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A9_3re.
RECODE Gv1_A9_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A9_4re.
RECODE Gv1_A9_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A9_5re.
RECODE Gv1_A10_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A10_1re.
RECODE Gv1_A10_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A10_2re.
RECODE Gv1_A10_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A10_3re.
RECODE Gv1_A10_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A10_4re.
RECODE Gv1_A10_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A10_5re.
RECODE Gv1_A11_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A11_1re.
RECODE Gv1_A11_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A11_2re.
RECODE Gv1_A11_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A11_3re.
RECODE Gv1_A11_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A11_4re.
RECODE Gv1_A11_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A11_5re.
RECODE Gv1_A12_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A12_1re.
RECODE Gv1_A12_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A12_2re.
RECODE Gv1_A12_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A12_3re.
RECODE Gv1_A12_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A12_4re.
RECODE Gv1_A12_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A12_5re.
RECODE Gv1_A13_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A13_1re.
RECODE Gv1_A13_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A13_2re.
RECODE Gv1_A13_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A13_3re.
RECODE Gv1_A13_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A13_4re.
RECODE Gv1_A13_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A13_5re.
RECODE Gv1_A14_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A14_1re.
RECODE Gv1_A14_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A14_2re.
RECODE Gv1_A14_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A14_3re.
RECODE Gv1_A14_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A14_4re.
RECODE Gv1_A14_5 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A14_5re.
RECODE Gv1_A15_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A15_1re.
RECODE Gv1_A15_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A15_2re.
RECODE Gv1_A15_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A15_3re.
RECODE Gv1_A15_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A15_4re.
RECODE Gv1_A15_5 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A15_5re.
RECODE Gv1_A16_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A16_1re.
RECODE Gv1_A16_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A16_2re.
RECODE Gv1_A16_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A16_3re.
RECODE Gv1_A16_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A16_4re.
RECODE Gv1_A16_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A16_5re.
RECODE Gv1_A17_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A17_1re.
RECODE Gv1_A17_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A17_2re.
RECODE Gv1_A17_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A17_3re.
RECODE Gv1_A17_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A17_4re.
RECODE Gv1_A17_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A17_5re.
RECODE Gv1_A18_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A18_1re.
RECODE Gv1_A18_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A18_2re.
RECODE Gv1_A18_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A18_3re.
RECODE Gv1_A18_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A18_4re.
RECODE Gv1_A18_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A18_5re.
RECODE Gv1_A19_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A19_1re.
RECODE Gv1_A19_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A19_2re.
RECODE Gv1_A19_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A19_3re.
RECODE Gv1_A19_4 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A19_4re.
RECODE Gv1_A19_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A19_5re.
RECODE Gv1_A20_1 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A20_1re.
RECODE Gv1_A20_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A20_2re.
RECODE Gv1_A20_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A20_3re.
RECODE Gv1_A20_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A20_4re.
RECODE Gv1_A20_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A20_5re.
RECODE Gv1_A21_1 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A21_1re.
RECODE Gv1_A21_2 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A21_2re.
RECODE Gv1_A21_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A21_3re.
RECODE Gv1_A21_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A21_4re.
RECODE Gv1_A21_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A21_5re.
RECODE Gv1_A22_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A22_1re.
RECODE Gv1_A22_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A22_2re.
RECODE Gv1_A22_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A22_3re.
RECODE Gv1_A22_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A22_4re.
RECODE Gv1_A22_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A22_5re.
RECODE Gv1_A23_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A23_1re.
RECODE Gv1_A23_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A23_2re.
RECODE Gv1_A23_3 (1=0) (2=1) (SYSMIS=0) INTO Gv1_A23_3re.
RECODE Gv1_A23_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A23_4re.
RECODE Gv1_A23_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A23_5re.
RECODE Gv1_A24_1 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A24_1re.
RECODE Gv1_A24_2 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A24_2re.
RECODE Gv1_A24_3 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A24_3re.
RECODE Gv1_A24_4 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A24_4re.
RECODE Gv1_A24_5 (1=1) (2=0) (SYSMIS=0) INTO Gv1_A24_5re.
EXECUTE.

*Compute Mean Score for Gv1 - Form Board Test

COMPUTE Gv1_mean=Mean(Gv1_A1_1re,Gv1_A1_2re,Gv1_A1_3re,Gv1_A1_4re,Gv1_A1_5re,Gv1_A2_1re,Gv1_A2_2re, 
    Gv1_A2_3re,Gv1_A2_4re,Gv1_A2_5re,Gv1_A3_1re,Gv1_A3_2re,Gv1_A3_3re,Gv1_A3_4re,Gv1_A3_5re,Gv1_A4_1re, 
    Gv1_A4_2re,Gv1_A4_3re,Gv1_A4_4re,Gv1_A4_5re,Gv1_A5_1re,Gv1_A5_2re,Gv1_A5_3re,Gv1_A5_4re,Gv1_A5_5re, 
    Gv1_A6_1re,Gv1_A6_2re,Gv1_A6_3re,Gv1_A6_4re,Gv1_A6_5re,Gv1_A7_1re,Gv1_A7_2re,Gv1_A7_3re,Gv1_A7_4re, 
    Gv1_A7_5re,Gv1_A8_1re,Gv1_A8_2re,Gv1_A8_3re,Gv1_A8_4re,Gv1_A8_5re,Gv1_A9_1re,Gv1_A9_2re,Gv1_A9_3re, 
    Gv1_A9_4re,Gv1_A9_5re,Gv1_A10_1re,Gv1_A10_2re,Gv1_A10_3re,Gv1_A10_4re,Gv1_A10_5re,Gv1_A11_1re, 
    Gv1_A11_2re,Gv1_A11_3re,Gv1_A11_4re,Gv1_A11_5re,Gv1_A12_1re,Gv1_A12_2re,Gv1_A12_3re,Gv1_A12_4re, 
    Gv1_A12_5re,Gv1_A13_1re,Gv1_A13_2re,Gv1_A13_3re,Gv1_A13_4re,Gv1_A13_5re,Gv1_A14_1re,Gv1_A14_2re, 
    Gv1_A14_3re,Gv1_A14_4re,Gv1_A14_5re,Gv1_A15_1re,Gv1_A15_2re,Gv1_A15_3re,Gv1_A15_4re,Gv1_A15_5re, 
    Gv1_A16_1re,Gv1_A16_2re,Gv1_A16_3re,Gv1_A16_4re,Gv1_A16_5re,Gv1_A17_1re,Gv1_A17_2re,Gv1_A17_3re, 
    Gv1_A17_4re,Gv1_A17_5re,Gv1_A18_1re,Gv1_A18_2re,Gv1_A18_3re,Gv1_A18_4re,Gv1_A18_5re,Gv1_A19_1re, 
    Gv1_A19_2re,Gv1_A19_3re,Gv1_A19_4re,Gv1_A19_5re,Gv1_A20_1re,Gv1_A20_2re,Gv1_A20_3re,Gv1_A20_4re, 
    Gv1_A20_5re,Gv1_A21_1re,Gv1_A21_2re,Gv1_A21_3re,Gv1_A21_4re,Gv1_A21_5re,Gv1_A22_1re,Gv1_A22_2re, 
    Gv1_A22_3re,Gv1_A22_4re,Gv1_A22_5re,Gv1_A23_1re,Gv1_A23_2re,Gv1_A23_3re,Gv1_A23_4re,Gv1_A23_5re, 
    Gv1_A24_1re,Gv1_A24_2re,Gv1_A24_3re,Gv1_A24_4re,Gv1_A24_5re). 
EXECUTE.

*Recode Gv2 - Paper Folding Test

RECODE Gv2_1 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv2_1re.
RECODE Gv2_2 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gv2_2re.
RECODE Gv2_3 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv2_3re.
RECODE Gv2_4 (1=0) (2=0) (3=0) (4=1) (5=0) (SYSMIS=0) INTO Gv2_4re.
RECODE Gv2_5 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv2_5re.
RECODE Gv2_6 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gv2_6re.
RECODE Gv2_7 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv2_7re.
RECODE Gv2_8 (1=0) (2=0) (3=1) (4=0) (5=0) (SYSMIS=0) INTO Gv2_8re.
RECODE Gv2_9 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gv2_9re.
RECODE Gv2_10 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gv2_10re.
EXECUTE.

*Compute mean score for Gv2 - Paper Folding Test.

COMPUTE Gv2_mean=Mean(Gv2_1re,Gv2_2re,Gv2_3re,Gv2_4re,Gv2_5re,Gv2_6re,Gv2_7re,Gv2_8re,Gv2_9re,
    Gv2_10re).
EXECUTE.

*Recode Gv3 - Surface Development Test

RECODE Gv3_A1_1 (1=0) (2=1) (3=0) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A1_1re.
RECODE Gv3_A1_2 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A1_2re.
RECODE Gv3_A1_3 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A1_3re.
RECODE Gv3_A1_4 (1=0) (2=0) (3=0) (4=0) (5=1) (6=0) (SYSMIS=0) INTO Gv3_A1_4re.
RECODE Gv3_A1_5 (1=0) (2=1) (3=0) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A1_5re.
RECODE Gv3_A2_1 (1=0) (2=0) (3=0) (4=0) (5=1) (6=0) (7=0) (SYSMIS=0) INTO Gv3_A2_1re.
RECODE Gv3_A2_2 (1=0) (2=0) (3=0) (4=1) (5=0) (6=0) (7=0) (SYSMIS=0) INTO Gv3_A2_2re.
RECODE Gv3_A2_3 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (7=0) (SYSMIS=0) INTO Gv3_A2_3re.
RECODE Gv3_A2_4 (1=0) (2=0) (3=0) (4=0) (5=0) (6=1) (7=0) (SYSMIS=0) INTO Gv3_A2_4re.
RECODE Gv3_A2_5 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (7=0) (SYSMIS=0) INTO Gv3_A2_5re.
RECODE Gv3_A3_1 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv3_A3_1re.
RECODE Gv3_A3_2 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv3_A3_2re.
RECODE Gv3_A3_3 (1=1) (2=0) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv3_A3_3re.
RECODE Gv3_A3_4 (1=0) (2=1) (3=0) (4=0) (5=0) (SYSMIS=0) INTO Gv3_A3_4re.
RECODE Gv3_A3_5 (1=0) (2=0) (3=0) (4=0) (5=1) (SYSMIS=0) INTO Gv3_A3_5re.
RECODE Gv3_A4_1 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A4_1re.
RECODE Gv3_A4_2 (1=0) (2=0) (3=1) (4=0) (5=0) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A4_2re.
RECODE Gv3_A4_3 (1=0) (2=0) (3=0) (4=0) (5=0) (6=0) (7=1) (8=0) (SYSMIS=0) INTO Gv3_A4_3re.
RECODE Gv3_A4_4 (1=0) (2=0) (3=0) (4=0) (5=0) (6=0) (7=0) (8=1) (SYSMIS=0) INTO Gv3_A4_4re.
RECODE Gv3_A4_5 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A4_5re.
RECODE Gv3_A5_1 (1=0) (2=0) (3=0) (4=0) (5=0) (6=1) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A5_1re.
RECODE Gv3_A5_2 (1=0) (2=0) (3=0) (4=0) (5=1) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A5_2re.
RECODE Gv3_A5_3 (1=0) (2=0) (3=1) (4=0) (5=0) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A5_3re.
RECODE Gv3_A5_4 (1=0) (2=0) (3=0) (4=1) (5=0) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A5_4re.
RECODE Gv3_A5_5 (1=0) (2=1) (3=0) (4=0) (5=0) (6=0) (7=0) (8=0) (SYSMIS=0) INTO Gv3_A5_5re.
RECODE Gv3_A6_1 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A6_1re.
RECODE Gv3_A6_2 (1=1) (2=0) (3=0) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A6_2re.
RECODE Gv3_A6_3 (1=0) (2=0) (3=0) (4=1) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A6_3re.
RECODE Gv3_A6_4 (1=0) (2=0) (3=1) (4=0) (5=0) (6=0) (SYSMIS=0) INTO Gv3_A6_4re.
RECODE Gv3_A6_5 (1=0) (2=0) (3=0) (4=0) (5=1) (6=0) (SYSMIS=0) INTO Gv3_A6_5re.
EXECUTE.

*Compute mean score for Gv3 - Surface Development Test.

COMPUTE Gv3_mean=Mean(Gv3_A1_1re,Gv3_A1_2re,Gv3_A1_3re,Gv3_A1_4re,Gv3_A1_5re,Gv3_A2_1re,Gv3_A2_2re,
    Gv3_A2_3re,Gv3_A2_4re,Gv3_A2_5re,Gv3_A3_1re,Gv3_A3_2re,Gv3_A3_3re,Gv3_A3_4re,Gv3_A3_5re,Gv3_A4_1re,
    Gv3_A4_2re,Gv3_A4_3re,Gv3_A4_4re,Gv3_A4_5re,Gv3_A5_1re,Gv3_A5_2re,Gv3_A5_3re,Gv3_A5_4re,Gv3_A5_5re,
    Gv3_A6_1re,Gv3_A6_2re,Gv3_A6_3re,Gv3_A6_4re,Gv3_A6_5re).
EXECUTE.


*Recode Gsm1 - Audio Number Span Test

RECODE Gsm1_1 (819572=1) (ELSE=0) INTO Gsm1_1re.
RECODE Gsm1_2 (4629=1) (ELSE=0) INTO Gsm1_2re.
RECODE Gsm1_3 (3714925816=1) (ELSE=0) INTO Gsm1_3re.
RECODE Gsm1_4 (926286=1) (ELSE=0) INTO Gsm1_4re.
RECODE Gsm1_5 (79538=1) (ELSE=0) INTO Gsm1_5re.
RECODE Gsm1_6 (529416837=1) (ELSE=0) INTO Gsm1_6re.
RECODE Gsm1_7 (26315=1) (ELSE=0) INTO Gsm1_7re.
RECODE Gsm1_8 (24851=1) (ELSE=0) INTO Gsm1_8re.
RECODE Gsm1_9 (68241397253=1) (ELSE=0) INTO Gsm1_9re.
RECODE Gsm1_10 (928571=1) (ELSE=0) INTO Gsm1_10re.
RECODE Gsm1_11 (74293586=1) (ELSE=0) INTO Gsm1_11re.
RECODE Gsm1_12 (437239=1) (ELSE=0) INTO Gsm1_12re.
RECODE Gsm1_13 (573169485172=1) (ELSE=0) INTO Gsm1_13re.
RECODE Gsm1_14 (62597183=1) (ELSE=0) INTO Gsm1_14re.
RECODE Gsm1_15 (47936158427=1) (ELSE=0) INTO Gsm1_15re.
RECODE Gsm1_16 (5187231=1) (ELSE=0) INTO Gsm1_16re.
RECODE Gsm1_17 (826917385964=1) (ELSE=0) INTO Gsm1_17re.
RECODE Gsm1_18 (519274836=1) (ELSE=0) INTO Gsm1_18re.
RECODE Gsm1_19 (7526491=1) (ELSE=0) INTO Gsm1_19re.
RECODE Gsm1_20 (32181465=1) (ELSE=0) INTO Gsm1_20re.
RECODE Gsm1_21 (3817=1) (ELSE=0) INTO Gsm1_21re.
RECODE Gsm1_22 (9463518=1) (ELSE=0) INTO Gsm1_22re.
RECODE Gsm1_23 (28496275931=1) (ELSE=0) INTO Gsm1_23re.
RECODE Gsm1_24 (62872361=1) (ELSE=0) INTO Gsm1_24re.
EXECUTE.

*Compute Mean score for Gsm1 - Audio Number Span Test

COMPUTE Gsm1_mean=Mean(Gsm1_1re,Gsm1_2re,Gsm1_3re,Gsm1_4re,Gsm1_5re,Gsm1_6re,Gsm1_7re,Gsm1_8re,
    Gsm1_9re,Gsm1_10re,Gsm1_11re,Gsm1_12re,Gsm1_13re,Gsm1_14re,Gsm1_15re,Gsm1_16re,Gsm1_17re,Gsm1_18re,
    Gsm1_19re,Gsm1_20re,Gsm1_21re,Gsm1_22re,Gsm1_23re,Gsm1_24re).
EXECUTE.

*Recode Gsm2 - Visual Number Span Test.

RECODE Gsm2_1 (415237=1) (ELSE=0) INTO Gsm2_1re.
RECODE Gsm2_2 (7256=1) (ELSE=0) INTO Gsm2_2re.
RECODE Gsm2_3 (8961372457=1) (ELSE=0) INTO Gsm2_3re.
RECODE Gsm2_4 (125274=1) (ELSE=0) INTO Gsm2_4re.
RECODE Gsm2_5 (21685=1) (ELSE=0) INTO Gsm2_5re.
RECODE Gsm2_6 (124956387=1) (ELSE=0) INTO Gsm2_6re.
RECODE Gsm2_7 (26534=1) (ELSE=0) INTO Gsm2_7re.
RECODE Gsm2_8 (85124=1) (ELSE=0) INTO Gsm2_8re.
RECODE Gsm2_9 (437216897253=1) (ELSE=0) INTO Gsm2_9re.
RECODE Gsm2_10 (918643=1) (ELSE=0) INTO Gsm2_10re.
RECODE Gsm2_11 (548643=1) (ELSE=0) INTO Gsm2_11re.
RECODE Gsm2_12 (932536=1) (ELSE=0) INTO Gsm2_12re.
RECODE Gsm2_13 (5397168425732=1) (ELSE=0) INTO Gsm2_13re.
RECODE Gsm2_14 (36541928=1) (ELSE=0) INTO Gsm2_14re.
RECODE Gsm2_15 (61584973621=1) (ELSE=0) INTO Gsm2_15re.
RECODE Gsm2_16 (34718954=1) (ELSE=0) INTO Gsm2_16re.
RECODE Gsm2_17 (147352819376=1) (ELSE=0) INTO Gsm2_17re.
RECODE Gsm2_18 (328564791=1) (ELSE=0) INTO Gsm2_18re.
RECODE Gsm2_19 (5132764=1) (ELSE=0) INTO Gsm2_19re.
RECODE Gsm2_20 (26513274=1) (ELSE=0) INTO Gsm2_20re.
RECODE Gsm2_21 (2516=1) (ELSE=0) INTO Gsm2_21re.
RECODE Gsm2_22 (8513742=1) (ELSE=0) INTO Gsm2_22re.
RECODE Gsm2_23 (56198527943=1) (ELSE=0) INTO Gsm2_23re.
RECODE Gsm2_24 (89742639=1) (ELSE=0) INTO Gsm2_24re.
EXECUTE.

*Compute mean score for Gsm2 - Visual Number Span Test.

COMPUTE Gsm2_mean=Mean(Gsm2_1re,Gsm2_2re,Gsm2_3re,Gsm2_4re,Gsm2_5re,Gsm2_6re,Gsm2_7re,Gsm2_8re,
    Gsm2_9re,Gsm2_10re,Gsm2_11re,Gsm2_12re,Gsm2_13re,Gsm2_14re,Gsm2_15re,Gsm2_16re,Gsm2_17re,Gsm2_18re,
    Gsm2_19re,Gsm2_20re,Gsm2_21re,Gsm2_22re,Gsm2_23re,Gsm2_24re).
EXECUTE.

*Recode Gsm3 - Audio Letter Span Test

RECODE Gsm3_1 ('kfc'=1) ('KFC'=1) ('kfcbegin'=1) ('K, F, C'=1) (ELSE=0) INTO Gsm3_1re.
RECODE Gsm3_2 ('hslyg'=1) ('HSLYG'=1) ('hslygbegin'=1) ('H, S, L, Y, G'=1) (ELSE=0) INTO Gsm3_2re.
RECODE Gsm3_3 ('pfrcwsgky'=1) ('PFRCWSGKY'=1) ('pfrcwsgkybegin'=1) ('P, F, R, C, W, S, G, K, Y'=1) (ELSE=0) INTO Gsm3_3re.
RECODE Gsm3_4 ('plscwkrfhg'=1) ('PLSCWKRFHG'=1) ('plscwkrfhgbegin'=1) ('P, L, S, C, W, K, R, F, H, G'=1) (ELSE=0) INTO Gsm3_4re.
RECODE Gsm3_5 ('rgs'=1) ('RGS'=1) ('rgsbegin'=1) ('R, G, S'=1) (ELSE=0) INTO Gsm3_5re.
RECODE Gsm3_6 ('lwcykrp'=1) ('LWCYKRP'=1) ('lwcykrpbegin'=1) ('L, W, C, Y, K, R, P'=1) (ELSE=0) INTO Gsm3_6re.
RECODE Gsm3_7 ('fsylch'=1) ('FSYLCH'=1) ('fsylchbegin'=1) ('F, S, Y, L, C, H'=1) (ELSE=0) INTO Gsm3_7re.
RECODE Gsm3_8 ('scfkwlp'=1) ('SCFKWLP'=1) ('scfkwlpbegin'=1) ('S, C, F, K, W, L, P'=1) (ELSE=0) INTO Gsm3_8re.
RECODE Gsm3_9 ('ycgpwlskhrf'=1) ('YCGPWLSKHRF'=1) ('ycgpwlskhrfbegin'=1) ('Y, C, G, P, W, L, S, K, H, R, F'=1) (ELSE=0) INTO Gsm3_9re.
RECODE Gsm3_10 ('wyscl'=1) ('WYSCL'=1) ('wysclbegin'=1) ('W, Y, S, C, L'=1) (ELSE=0) INTO Gsm3_10re.
RECODE Gsm3_11 ('pglfhkywcr'=1) ('PGLFHKYWCR'=1) ('pglfhkywcrbegin'=1) ('P, G, L, F, H, K, Y, W, C, R'=1) (ELSE=0) INTO Gsm3_11re.
RECODE Gsm3_12 ('cfgwksrlp'=1) ('CFGWKSRLP'=1) ('cfgwksrlpbegin'=1) ('C, F, G, W, K, S, R, L, P'=1) (ELSE=0) INTO Gsm3_12re.
RECODE Gsm3_13 ('hyrwspk'=1) ('HYRWSPK'=1) ('hyrwspkbegin'=1) ('H, Y, R, W, S, P, K'=1) (ELSE=0) INTO Gsm3_13re.
RECODE Gsm3_14 ('sflh'=1) ('SFLH'=1) ('sflhbegin'=1) ('S, F, L, H'=1) (ELSE=0) INTO Gsm3_14re.
RECODE Gsm3_15 ('cprkhswf'=1) ('CPRKHSWF'=1) ('cprkhswfbegin'=1) ('C, P, R, K, H, S, W, F'=1) (ELSE=0) INTO Gsm3_15re.
RECODE Gsm3_16 ('sfwgplkh'=1) ('SFWGPLKH'=1) ('sfwgplkhbegin'=1) ('S, F, W, G, P, L, K, H'=1) (ELSE=0) INTO Gsm3_16re.
RECODE Gsm3_17 ('kwgylr'=1) ('KWGYLR'=1) ('kwgylrbegin'=1) ('K, W, G, Y, L, R'=1) (ELSE=0) INTO Gsm3_17re.
RECODE Gsm3_18 ('fpsglhwkrc'=1) ('FPSGLHWKRC'=1) ('fpsglhwkrcbegin'=1) ('F, P, S, G, L, H, W, K, R, C'=1) (ELSE=0) INTO Gsm3_18re.
RECODE Gsm3_19 ('grhpcsfyw'=1) ('GRHPCSFYW'=1) ('grhpcsfywbegin'=1) ('G, R, H, P, C, S, F, Y, W'=1) (ELSE=0) INTO Gsm3_19re.
RECODE Gsm3_20 ('ycwsprf'=1) ('YCWSPRF'=1) ('ycwsprfbegin'=1) ('Y, C, W, S, P, R, F'=1) (ELSE=0) INTO Gsm3_20re.
RECODE Gsm3_21 ('rpfk'=1) ('RPFK'=1) ('rpfkbegin'=1) ('R, P, F, K'=1) (ELSE=0) INTO Gsm3_21re.
RECODE Gsm3_22 ('lgksycrfwkp'=1) ('LGKSYCRFWHP'=1) ('lgksycrfwkpbegin'=1) ('L, G, K, S, Y, C, R, F, W, H, P'=1) (ELSE=0) INTO Gsm3_22re.
RECODE Gsm3_23 ('cspgryhl'=1) ('CSPGRYHL'=1) ('cspgryhlbegin'=1) ('C, S, P, G, R, Y, H, L'=1) (ELSE=0) INTO Gsm3_23re.
RECODE Gsm3_24 ('fcghlpsk'=1) ('FCGHLPSK'=1) ('fcghlpskbegin'=1) ('F, C, G, H, L, P, S, K'=1) (ELSE=0) INTO Gsm3_24re.
EXECUTE.

*Compute mean scores for Gsm3 - Audio Letter Span Test

COMPUTE Gsm3_mean=Mean(Gsm3_1re,Gsm3_2re,Gsm3_3re,Gsm3_4re,Gsm3_5re,Gsm3_6re,Gsm3_7re,Gsm3_8re,
    Gsm3_9re,Gsm3_10re,Gsm3_11re,Gsm3_12re,Gsm3_13re,Gsm3_14re,Gsm3_15re,Gsm3_16re,Gsm3_17re,Gsm3_18re,
    Gsm3_19re,Gsm3_20re,Gsm3_21re,Gsm3_22re,Gsm3_23re,Gsm3_24re).
EXECUTE.
