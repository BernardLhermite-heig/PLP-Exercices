{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer
import Language
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23
	= HappyTerminal (TokenPosn)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,357) ([0,10624,389,5056,0,2176,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,256,0,0,0,0,0,0,65024,63,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,0,256,0,8448,389,5056,0,2176,2,0,0,8448,389,5056,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,65024,8255,0,0,65032,63,0,0,0,0,0,1024,2,0,0,8448,389,5056,0,49152,65024,63,0,512,0,0,0,0,0,0,0,8448,389,5056,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,512,0,0,0,0,64,0,0,8192,0,3328,0,8448,389,5056,0,0,0,0,0,8448,389,5056,0,0,0,0,0,8448,389,5056,0,0,65024,63,0,2176,0,0,0,8448,389,5056,0,0,16,0,0,8448,389,5056,0,0,65024,16447,0,0,0,0,0,0,0,0,0,8192,32,960,0,0,65024,63,0,0,0,0,0,16384,65024,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65024,63,0,1024,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,8192,0,3072,0,8192,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,65024,63,0,8192,0,3328,0,32768,0,0,0,0,0,0,0,8192,0,3328,0,8448,389,5056,0,0,0,0,0,0,64,0,0,0,0,0,0,8448,421,5056,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,0,0,0,32768,65024,63,0,32768,0,0,0,0,0,0,0,8448,421,5056,0,0,0,0,0,8448,389,5056,0,0,0,0,0,0,0,0,0,8192,0,3072,0,32768,0,0,0,8192,0,3328,0,16384,0,0,0,0,0,0,0,8192,32,960,0,16384,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Statement","Expr","Definition","FunctionDef","FArgs","Args","Arg","Type","TypeTuple","FunctionApp","FunctionAppArgs","FunctionAppArg","LetInDefs","If","CaseOfs","CaseOf","Pattern","Literal","UnaryOp","BinaryOp","'behold'","'summon'","'with'","'and'","'this'","'is'","'('","')'","'and his friend'","'put that'","'into'","'what is'","'?'","'perhaps'","'who cares'","'which does'","'neg'","'not'","'plus'","'minus'","'times'","'split'","'rest'","'weaker than'","'stronger than'","'as weak as'","'as strong as'","'same as'","'different of'","'both'","'either'","'yep'","'pasyep'","'identifier'","'integer'","'Integer'","'Boolean'","'suppose'","'then we can conclude'","'rather than'","%eof"]
        bit_start = st Prelude.* 64
        bit_end = (st Prelude.+ 1) Prelude.* 64
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..63]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (24) = happyShift action_4
action_0 (25) = happyShift action_12
action_0 (28) = happyShift action_5
action_0 (30) = happyShift action_13
action_0 (33) = happyShift action_14
action_0 (35) = happyShift action_15
action_0 (40) = happyShift action_16
action_0 (41) = happyShift action_17
action_0 (55) = happyShift action_18
action_0 (56) = happyShift action_19
action_0 (57) = happyShift action_20
action_0 (58) = happyShift action_21
action_0 (61) = happyShift action_22
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_7
action_0 (6) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (13) = happyGoto action_8
action_0 (17) = happyGoto action_9
action_0 (21) = happyGoto action_10
action_0 (22) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (24) = happyShift action_4
action_1 (28) = happyShift action_5
action_1 (6) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_13

action_4 (57) = happyShift action_46
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (57) = happyShift action_45
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (64) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (42) = happyShift action_32
action_7 (43) = happyShift action_33
action_7 (44) = happyShift action_34
action_7 (45) = happyShift action_35
action_7 (46) = happyShift action_36
action_7 (47) = happyShift action_37
action_7 (48) = happyShift action_38
action_7 (49) = happyShift action_39
action_7 (50) = happyShift action_40
action_7 (51) = happyShift action_41
action_7 (52) = happyShift action_42
action_7 (53) = happyShift action_43
action_7 (54) = happyShift action_44
action_7 (23) = happyGoto action_31
action_7 _ = happyReduce_2

action_8 _ = happyReduce_10

action_9 _ = happyReduce_11

action_10 _ = happyReduce_8

action_11 (25) = happyShift action_12
action_11 (30) = happyShift action_13
action_11 (33) = happyShift action_14
action_11 (35) = happyShift action_15
action_11 (40) = happyShift action_16
action_11 (41) = happyShift action_17
action_11 (55) = happyShift action_18
action_11 (56) = happyShift action_19
action_11 (57) = happyShift action_20
action_11 (58) = happyShift action_21
action_11 (61) = happyShift action_22
action_11 (5) = happyGoto action_30
action_11 (13) = happyGoto action_8
action_11 (17) = happyGoto action_9
action_11 (21) = happyGoto action_10
action_11 (22) = happyGoto action_11
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (57) = happyShift action_29
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (25) = happyShift action_12
action_13 (30) = happyShift action_13
action_13 (33) = happyShift action_14
action_13 (35) = happyShift action_15
action_13 (40) = happyShift action_16
action_13 (41) = happyShift action_17
action_13 (55) = happyShift action_18
action_13 (56) = happyShift action_19
action_13 (57) = happyShift action_20
action_13 (58) = happyShift action_21
action_13 (61) = happyShift action_22
action_13 (5) = happyGoto action_28
action_13 (13) = happyGoto action_8
action_13 (17) = happyGoto action_9
action_13 (21) = happyGoto action_10
action_13 (22) = happyGoto action_11
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (24) = happyShift action_4
action_14 (28) = happyShift action_5
action_14 (34) = happyShift action_27
action_14 (6) = happyGoto action_25
action_14 (7) = happyGoto action_3
action_14 (16) = happyGoto action_26
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (25) = happyShift action_12
action_15 (30) = happyShift action_13
action_15 (33) = happyShift action_14
action_15 (35) = happyShift action_15
action_15 (40) = happyShift action_16
action_15 (41) = happyShift action_17
action_15 (55) = happyShift action_18
action_15 (56) = happyShift action_19
action_15 (57) = happyShift action_20
action_15 (58) = happyShift action_21
action_15 (61) = happyShift action_22
action_15 (5) = happyGoto action_24
action_15 (13) = happyGoto action_8
action_15 (17) = happyGoto action_9
action_15 (21) = happyGoto action_10
action_15 (22) = happyGoto action_11
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_45

action_17 _ = happyReduce_46

action_18 _ = happyReduce_42

action_19 _ = happyReduce_43

action_20 _ = happyReduce_9

action_21 _ = happyReduce_41

action_22 (25) = happyShift action_12
action_22 (30) = happyShift action_13
action_22 (33) = happyShift action_14
action_22 (35) = happyShift action_15
action_22 (40) = happyShift action_16
action_22 (41) = happyShift action_17
action_22 (55) = happyShift action_18
action_22 (56) = happyShift action_19
action_22 (57) = happyShift action_20
action_22 (58) = happyShift action_21
action_22 (61) = happyShift action_22
action_22 (5) = happyGoto action_23
action_22 (13) = happyGoto action_8
action_22 (17) = happyGoto action_9
action_22 (21) = happyGoto action_10
action_22 (22) = happyGoto action_11
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (42) = happyShift action_32
action_23 (43) = happyShift action_33
action_23 (44) = happyShift action_34
action_23 (45) = happyShift action_35
action_23 (46) = happyShift action_36
action_23 (47) = happyShift action_37
action_23 (48) = happyShift action_38
action_23 (49) = happyShift action_39
action_23 (50) = happyShift action_40
action_23 (51) = happyShift action_41
action_23 (52) = happyShift action_42
action_23 (53) = happyShift action_43
action_23 (54) = happyShift action_44
action_23 (62) = happyShift action_58
action_23 (23) = happyGoto action_31
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (36) = happyShift action_57
action_24 (42) = happyShift action_32
action_24 (43) = happyShift action_33
action_24 (44) = happyShift action_34
action_24 (45) = happyShift action_35
action_24 (46) = happyShift action_36
action_24 (47) = happyShift action_37
action_24 (48) = happyShift action_38
action_24 (49) = happyShift action_39
action_24 (50) = happyShift action_40
action_24 (51) = happyShift action_41
action_24 (52) = happyShift action_42
action_24 (53) = happyShift action_43
action_24 (54) = happyShift action_44
action_24 (23) = happyGoto action_31
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_31

action_26 (27) = happyShift action_55
action_26 (34) = happyShift action_56
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (25) = happyShift action_12
action_27 (30) = happyShift action_13
action_27 (33) = happyShift action_14
action_27 (35) = happyShift action_15
action_27 (40) = happyShift action_16
action_27 (41) = happyShift action_17
action_27 (55) = happyShift action_18
action_27 (56) = happyShift action_19
action_27 (57) = happyShift action_20
action_27 (58) = happyShift action_21
action_27 (61) = happyShift action_22
action_27 (5) = happyGoto action_54
action_27 (13) = happyGoto action_8
action_27 (17) = happyGoto action_9
action_27 (21) = happyGoto action_10
action_27 (22) = happyGoto action_11
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (31) = happyShift action_52
action_28 (32) = happyShift action_53
action_28 (42) = happyShift action_32
action_28 (43) = happyShift action_33
action_28 (44) = happyShift action_34
action_28 (45) = happyShift action_35
action_28 (46) = happyShift action_36
action_28 (47) = happyShift action_37
action_28 (48) = happyShift action_38
action_28 (49) = happyShift action_39
action_28 (50) = happyShift action_40
action_28 (51) = happyShift action_41
action_28 (52) = happyShift action_42
action_28 (53) = happyShift action_43
action_28 (54) = happyShift action_44
action_28 (23) = happyGoto action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (26) = happyShift action_51
action_29 _ = happyReduce_27

action_30 (42) = happyShift action_32
action_30 (43) = happyShift action_33
action_30 (44) = happyShift action_34
action_30 (45) = happyShift action_35
action_30 (46) = happyShift action_36
action_30 (47) = happyShift action_37
action_30 (48) = happyShift action_38
action_30 (49) = happyShift action_39
action_30 (50) = happyShift action_40
action_30 (51) = happyShift action_41
action_30 (52) = happyShift action_42
action_30 (53) = happyShift action_43
action_30 (54) = happyShift action_44
action_30 (23) = happyGoto action_31
action_30 _ = happyReduce_6

action_31 (25) = happyShift action_12
action_31 (30) = happyShift action_13
action_31 (33) = happyShift action_14
action_31 (35) = happyShift action_15
action_31 (40) = happyShift action_16
action_31 (41) = happyShift action_17
action_31 (55) = happyShift action_18
action_31 (56) = happyShift action_19
action_31 (57) = happyShift action_20
action_31 (58) = happyShift action_21
action_31 (61) = happyShift action_22
action_31 (5) = happyGoto action_50
action_31 (13) = happyGoto action_8
action_31 (17) = happyGoto action_9
action_31 (21) = happyGoto action_10
action_31 (22) = happyGoto action_11
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_47

action_33 _ = happyReduce_48

action_34 _ = happyReduce_49

action_35 _ = happyReduce_50

action_36 _ = happyReduce_51

action_37 _ = happyReduce_52

action_38 _ = happyReduce_53

action_39 _ = happyReduce_54

action_40 _ = happyReduce_55

action_41 _ = happyReduce_56

action_42 _ = happyReduce_57

action_43 _ = happyReduce_58

action_44 _ = happyReduce_59

action_45 (29) = happyShift action_49
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (26) = happyShift action_48
action_46 (8) = happyGoto action_47
action_46 _ = happyReduce_16

action_47 (39) = happyShift action_78
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (30) = happyShift action_74
action_48 (57) = happyShift action_75
action_48 (59) = happyShift action_76
action_48 (60) = happyShift action_77
action_48 (9) = happyGoto action_70
action_48 (10) = happyGoto action_71
action_48 (11) = happyGoto action_72
action_48 (12) = happyGoto action_73
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (25) = happyShift action_12
action_49 (30) = happyShift action_13
action_49 (33) = happyShift action_14
action_49 (35) = happyShift action_15
action_49 (40) = happyShift action_16
action_49 (41) = happyShift action_17
action_49 (55) = happyShift action_18
action_49 (56) = happyShift action_19
action_49 (57) = happyShift action_20
action_49 (58) = happyShift action_21
action_49 (61) = happyShift action_22
action_49 (5) = happyGoto action_69
action_49 (13) = happyGoto action_8
action_49 (17) = happyGoto action_9
action_49 (21) = happyGoto action_10
action_49 (22) = happyGoto action_11
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (42) = happyShift action_32
action_50 (43) = happyShift action_33
action_50 (44) = happyShift action_34
action_50 (45) = happyShift action_35
action_50 (46) = happyShift action_36
action_50 (47) = happyShift action_37
action_50 (48) = happyShift action_38
action_50 (49) = happyShift action_39
action_50 (50) = happyShift action_40
action_50 (51) = happyShift action_41
action_50 (52) = happyShift action_42
action_50 (53) = happyShift action_43
action_50 (54) = happyShift action_44
action_50 (23) = happyGoto action_31
action_50 _ = happyReduce_7

action_51 (25) = happyShift action_12
action_51 (30) = happyShift action_13
action_51 (33) = happyShift action_14
action_51 (35) = happyShift action_15
action_51 (40) = happyShift action_16
action_51 (41) = happyShift action_17
action_51 (55) = happyShift action_18
action_51 (56) = happyShift action_19
action_51 (57) = happyShift action_20
action_51 (58) = happyShift action_21
action_51 (61) = happyShift action_22
action_51 (5) = happyGoto action_66
action_51 (13) = happyGoto action_8
action_51 (14) = happyGoto action_67
action_51 (15) = happyGoto action_68
action_51 (17) = happyGoto action_9
action_51 (21) = happyGoto action_10
action_51 (22) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_12

action_53 (25) = happyShift action_12
action_53 (30) = happyShift action_13
action_53 (33) = happyShift action_14
action_53 (35) = happyShift action_15
action_53 (40) = happyShift action_16
action_53 (41) = happyShift action_17
action_53 (55) = happyShift action_18
action_53 (56) = happyShift action_19
action_53 (57) = happyShift action_20
action_53 (58) = happyShift action_21
action_53 (61) = happyShift action_22
action_53 (5) = happyGoto action_65
action_53 (13) = happyGoto action_8
action_53 (17) = happyGoto action_9
action_53 (21) = happyGoto action_10
action_53 (22) = happyGoto action_11
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (42) = happyShift action_32
action_54 (43) = happyShift action_33
action_54 (44) = happyShift action_34
action_54 (45) = happyShift action_35
action_54 (46) = happyShift action_36
action_54 (47) = happyShift action_37
action_54 (48) = happyShift action_38
action_54 (49) = happyShift action_39
action_54 (50) = happyShift action_40
action_54 (51) = happyShift action_41
action_54 (52) = happyShift action_42
action_54 (53) = happyShift action_43
action_54 (54) = happyShift action_44
action_54 (23) = happyGoto action_31
action_54 _ = happyReduce_4

action_55 (24) = happyShift action_4
action_55 (28) = happyShift action_5
action_55 (6) = happyGoto action_64
action_55 (7) = happyGoto action_3
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (25) = happyShift action_12
action_56 (30) = happyShift action_13
action_56 (33) = happyShift action_14
action_56 (35) = happyShift action_15
action_56 (40) = happyShift action_16
action_56 (41) = happyShift action_17
action_56 (55) = happyShift action_18
action_56 (56) = happyShift action_19
action_56 (57) = happyShift action_20
action_56 (58) = happyShift action_21
action_56 (61) = happyShift action_22
action_56 (5) = happyGoto action_63
action_56 (13) = happyGoto action_8
action_56 (17) = happyGoto action_9
action_56 (21) = happyGoto action_10
action_56 (22) = happyGoto action_11
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (37) = happyShift action_62
action_57 (18) = happyGoto action_60
action_57 (19) = happyGoto action_61
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (25) = happyShift action_12
action_58 (30) = happyShift action_13
action_58 (33) = happyShift action_14
action_58 (35) = happyShift action_15
action_58 (40) = happyShift action_16
action_58 (41) = happyShift action_17
action_58 (55) = happyShift action_18
action_58 (56) = happyShift action_19
action_58 (57) = happyShift action_20
action_58 (58) = happyShift action_21
action_58 (61) = happyShift action_22
action_58 (5) = happyGoto action_59
action_58 (13) = happyGoto action_8
action_58 (17) = happyGoto action_9
action_58 (21) = happyGoto action_10
action_58 (22) = happyGoto action_11
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (42) = happyShift action_32
action_59 (43) = happyShift action_33
action_59 (44) = happyShift action_34
action_59 (45) = happyShift action_35
action_59 (46) = happyShift action_36
action_59 (47) = happyShift action_37
action_59 (48) = happyShift action_38
action_59 (49) = happyShift action_39
action_59 (50) = happyShift action_40
action_59 (51) = happyShift action_41
action_59 (52) = happyShift action_42
action_59 (53) = happyShift action_43
action_59 (54) = happyShift action_44
action_59 (63) = happyShift action_92
action_59 (23) = happyGoto action_31
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_5

action_61 (37) = happyShift action_62
action_61 (18) = happyGoto action_91
action_61 (19) = happyGoto action_61
action_61 _ = happyReduce_34

action_62 (30) = happyShift action_88
action_62 (38) = happyShift action_89
action_62 (55) = happyShift action_18
action_62 (56) = happyShift action_19
action_62 (57) = happyShift action_90
action_62 (58) = happyShift action_21
action_62 (20) = happyGoto action_86
action_62 (21) = happyGoto action_87
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (42) = happyShift action_32
action_63 (43) = happyShift action_33
action_63 (44) = happyShift action_34
action_63 (45) = happyShift action_35
action_63 (46) = happyShift action_36
action_63 (47) = happyShift action_37
action_63 (48) = happyShift action_38
action_63 (49) = happyShift action_39
action_63 (50) = happyShift action_40
action_63 (51) = happyShift action_41
action_63 (52) = happyShift action_42
action_63 (53) = happyShift action_43
action_63 (54) = happyShift action_44
action_63 (23) = happyGoto action_31
action_63 _ = happyReduce_3

action_64 _ = happyReduce_32

action_65 (31) = happyShift action_85
action_65 (42) = happyShift action_32
action_65 (43) = happyShift action_33
action_65 (44) = happyShift action_34
action_65 (45) = happyShift action_35
action_65 (46) = happyShift action_36
action_65 (47) = happyShift action_37
action_65 (48) = happyShift action_38
action_65 (49) = happyShift action_39
action_65 (50) = happyShift action_40
action_65 (51) = happyShift action_41
action_65 (52) = happyShift action_42
action_65 (53) = happyShift action_43
action_65 (54) = happyShift action_44
action_65 (23) = happyGoto action_31
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (42) = happyShift action_32
action_66 (43) = happyShift action_33
action_66 (44) = happyShift action_34
action_66 (45) = happyShift action_35
action_66 (46) = happyShift action_36
action_66 (47) = happyShift action_37
action_66 (48) = happyShift action_38
action_66 (49) = happyShift action_39
action_66 (50) = happyShift action_40
action_66 (51) = happyShift action_41
action_66 (52) = happyShift action_42
action_66 (53) = happyShift action_43
action_66 (54) = happyShift action_44
action_66 (23) = happyGoto action_31
action_66 _ = happyReduce_30

action_67 (27) = happyShift action_84
action_67 _ = happyReduce_26

action_68 _ = happyReduce_28

action_69 (42) = happyShift action_32
action_69 (43) = happyShift action_33
action_69 (44) = happyShift action_34
action_69 (45) = happyShift action_35
action_69 (46) = happyShift action_36
action_69 (47) = happyShift action_37
action_69 (48) = happyShift action_38
action_69 (49) = happyShift action_39
action_69 (50) = happyShift action_40
action_69 (51) = happyShift action_41
action_69 (52) = happyShift action_42
action_69 (53) = happyShift action_43
action_69 (54) = happyShift action_44
action_69 (23) = happyGoto action_31
action_69 _ = happyReduce_14

action_70 (27) = happyShift action_83
action_70 _ = happyReduce_17

action_71 _ = happyReduce_18

action_72 (57) = happyShift action_82
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_24

action_74 (30) = happyShift action_74
action_74 (59) = happyShift action_76
action_74 (60) = happyShift action_77
action_74 (11) = happyGoto action_81
action_74 (12) = happyGoto action_73
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (30) = happyShift action_80
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_22

action_77 _ = happyReduce_23

action_78 (25) = happyShift action_12
action_78 (30) = happyShift action_13
action_78 (33) = happyShift action_14
action_78 (35) = happyShift action_15
action_78 (40) = happyShift action_16
action_78 (41) = happyShift action_17
action_78 (55) = happyShift action_18
action_78 (56) = happyShift action_19
action_78 (57) = happyShift action_20
action_78 (58) = happyShift action_21
action_78 (61) = happyShift action_22
action_78 (5) = happyGoto action_79
action_78 (13) = happyGoto action_8
action_78 (17) = happyGoto action_9
action_78 (21) = happyGoto action_10
action_78 (22) = happyGoto action_11
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (42) = happyShift action_32
action_79 (43) = happyShift action_33
action_79 (44) = happyShift action_34
action_79 (45) = happyShift action_35
action_79 (46) = happyShift action_36
action_79 (47) = happyShift action_37
action_79 (48) = happyShift action_38
action_79 (49) = happyShift action_39
action_79 (50) = happyShift action_40
action_79 (51) = happyShift action_41
action_79 (52) = happyShift action_42
action_79 (53) = happyShift action_43
action_79 (54) = happyShift action_44
action_79 (23) = happyGoto action_31
action_79 _ = happyReduce_15

action_80 (30) = happyShift action_74
action_80 (57) = happyShift action_75
action_80 (59) = happyShift action_76
action_80 (60) = happyShift action_77
action_80 (10) = happyGoto action_103
action_80 (11) = happyGoto action_72
action_80 (12) = happyGoto action_73
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (32) = happyShift action_102
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_20

action_83 (30) = happyShift action_74
action_83 (57) = happyShift action_75
action_83 (59) = happyShift action_76
action_83 (60) = happyShift action_77
action_83 (10) = happyGoto action_101
action_83 (11) = happyGoto action_72
action_83 (12) = happyGoto action_73
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (25) = happyShift action_12
action_84 (30) = happyShift action_13
action_84 (33) = happyShift action_14
action_84 (35) = happyShift action_15
action_84 (40) = happyShift action_16
action_84 (41) = happyShift action_17
action_84 (55) = happyShift action_18
action_84 (56) = happyShift action_19
action_84 (57) = happyShift action_20
action_84 (58) = happyShift action_21
action_84 (61) = happyShift action_22
action_84 (5) = happyGoto action_66
action_84 (13) = happyGoto action_8
action_84 (15) = happyGoto action_100
action_84 (17) = happyGoto action_9
action_84 (21) = happyGoto action_10
action_84 (22) = happyGoto action_11
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_44

action_86 (39) = happyShift action_99
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_40

action_88 (25) = happyShift action_12
action_88 (30) = happyShift action_97
action_88 (33) = happyShift action_14
action_88 (35) = happyShift action_15
action_88 (38) = happyShift action_89
action_88 (40) = happyShift action_16
action_88 (41) = happyShift action_17
action_88 (55) = happyShift action_18
action_88 (56) = happyShift action_19
action_88 (57) = happyShift action_98
action_88 (58) = happyShift action_21
action_88 (61) = happyShift action_22
action_88 (5) = happyGoto action_94
action_88 (13) = happyGoto action_8
action_88 (17) = happyGoto action_9
action_88 (20) = happyGoto action_95
action_88 (21) = happyGoto action_96
action_88 (22) = happyGoto action_11
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_37

action_90 _ = happyReduce_38

action_91 _ = happyReduce_35

action_92 (25) = happyShift action_12
action_92 (30) = happyShift action_13
action_92 (33) = happyShift action_14
action_92 (35) = happyShift action_15
action_92 (40) = happyShift action_16
action_92 (41) = happyShift action_17
action_92 (55) = happyShift action_18
action_92 (56) = happyShift action_19
action_92 (57) = happyShift action_20
action_92 (58) = happyShift action_21
action_92 (61) = happyShift action_22
action_92 (5) = happyGoto action_93
action_92 (13) = happyGoto action_8
action_92 (17) = happyGoto action_9
action_92 (21) = happyGoto action_10
action_92 (22) = happyGoto action_11
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (42) = happyShift action_32
action_93 (43) = happyShift action_33
action_93 (44) = happyShift action_34
action_93 (45) = happyShift action_35
action_93 (46) = happyShift action_36
action_93 (47) = happyShift action_37
action_93 (48) = happyShift action_38
action_93 (49) = happyShift action_39
action_93 (50) = happyShift action_40
action_93 (51) = happyShift action_41
action_93 (52) = happyShift action_42
action_93 (53) = happyShift action_43
action_93 (54) = happyShift action_44
action_93 (23) = happyGoto action_31
action_93 _ = happyReduce_33

action_94 (32) = happyShift action_53
action_94 (42) = happyShift action_32
action_94 (43) = happyShift action_33
action_94 (44) = happyShift action_34
action_94 (45) = happyShift action_35
action_94 (46) = happyShift action_36
action_94 (47) = happyShift action_37
action_94 (48) = happyShift action_38
action_94 (49) = happyShift action_39
action_94 (50) = happyShift action_40
action_94 (51) = happyShift action_41
action_94 (52) = happyShift action_42
action_94 (53) = happyShift action_43
action_94 (54) = happyShift action_44
action_94 (23) = happyGoto action_31
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (32) = happyShift action_107
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (32) = happyReduce_40
action_96 _ = happyReduce_8

action_97 (25) = happyShift action_12
action_97 (30) = happyShift action_97
action_97 (33) = happyShift action_14
action_97 (35) = happyShift action_15
action_97 (38) = happyShift action_89
action_97 (40) = happyShift action_16
action_97 (41) = happyShift action_17
action_97 (55) = happyShift action_18
action_97 (56) = happyShift action_19
action_97 (57) = happyShift action_98
action_97 (58) = happyShift action_21
action_97 (61) = happyShift action_22
action_97 (5) = happyGoto action_28
action_97 (13) = happyGoto action_8
action_97 (17) = happyGoto action_9
action_97 (20) = happyGoto action_95
action_97 (21) = happyGoto action_96
action_97 (22) = happyGoto action_11
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (32) = happyReduce_38
action_98 _ = happyReduce_9

action_99 (25) = happyShift action_12
action_99 (30) = happyShift action_13
action_99 (33) = happyShift action_14
action_99 (35) = happyShift action_15
action_99 (40) = happyShift action_16
action_99 (41) = happyShift action_17
action_99 (55) = happyShift action_18
action_99 (56) = happyShift action_19
action_99 (57) = happyShift action_20
action_99 (58) = happyShift action_21
action_99 (61) = happyShift action_22
action_99 (5) = happyGoto action_106
action_99 (13) = happyGoto action_8
action_99 (17) = happyGoto action_9
action_99 (21) = happyGoto action_10
action_99 (22) = happyGoto action_11
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_29

action_101 _ = happyReduce_19

action_102 (30) = happyShift action_74
action_102 (59) = happyShift action_76
action_102 (60) = happyShift action_77
action_102 (11) = happyGoto action_105
action_102 (12) = happyGoto action_73
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (32) = happyShift action_104
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (30) = happyShift action_74
action_104 (57) = happyShift action_75
action_104 (59) = happyShift action_76
action_104 (60) = happyShift action_77
action_104 (10) = happyGoto action_110
action_104 (11) = happyGoto action_72
action_104 (12) = happyGoto action_73
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (31) = happyShift action_109
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (42) = happyShift action_32
action_106 (43) = happyShift action_33
action_106 (44) = happyShift action_34
action_106 (45) = happyShift action_35
action_106 (46) = happyShift action_36
action_106 (47) = happyShift action_37
action_106 (48) = happyShift action_38
action_106 (49) = happyShift action_39
action_106 (50) = happyShift action_40
action_106 (51) = happyShift action_41
action_106 (52) = happyShift action_42
action_106 (53) = happyShift action_43
action_106 (54) = happyShift action_44
action_106 (23) = happyGoto action_31
action_106 _ = happyReduce_36

action_107 (30) = happyShift action_88
action_107 (38) = happyShift action_89
action_107 (55) = happyShift action_18
action_107 (56) = happyShift action_19
action_107 (57) = happyShift action_90
action_107 (58) = happyShift action_21
action_107 (20) = happyGoto action_108
action_107 (21) = happyGoto action_87
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (31) = happyShift action_112
action_108 _ = happyFail (happyExpListPerState 108)

action_109 _ = happyReduce_25

action_110 (31) = happyShift action_111
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_21

action_112 _ = happyReduce_39

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Def happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Expr happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ELet happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	_
	 =  HappyAbsSyn5
		 (ELet [] happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 5 happyReduction_5
happyReduction_5 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ECaseOf happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn5
		 (EUnary happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn5
		 (EValue happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  5 happyReduction_9
happyReduction_9 (HappyTerminal (TokenPosn (Name happy_var_1) _ _))
	 =  HappyAbsSyn5
		 (EVar happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  5 happyReduction_10
happyReduction_10 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 6 happyReduction_14
happyReduction_14 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Definition happy_var_2 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5 7 happyReduction_15
happyReduction_15 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Definition happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_0  8 happyReduction_16
happyReduction_16  =  HappyAbsSyn8
		 ([]
	)

happyReduce_17 = happySpecReduce_2  8 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_3:happy_var_1
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  10 happyReduction_20
happyReduction_20 (HappyTerminal (TokenPosn (Name happy_var_2) _ _))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Arg happy_var_1 happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 6 10 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_1) _ _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Arg (TTuple happy_var_3 happy_var_5) happy_var_1
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (TInteger
	)

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn11
		 (TBool
	)

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happyReduce 5 12 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TTuple (Arg happy_var_2 "") (Arg happy_var_4 "")
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 13 happyReduction_26
happyReduction_26 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (EApp happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_2  13 happyReduction_27
happyReduction_27 (HappyTerminal (TokenPosn (Name happy_var_2) _ _))
	_
	 =  HappyAbsSyn13
		 (EApp happy_var_2 []
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3:happy_var_1
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  15 happyReduction_30
happyReduction_30 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3:happy_var_1
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 6 17 happyReduction_33
happyReduction_33 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_1  18 happyReduction_34
happyReduction_34 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  18 happyReduction_35
happyReduction_35 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 19 happyReduction_36
happyReduction_36 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 ((happy_var_2,happy_var_4)
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_1  20 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn20
		 (PAny
	)

happyReduce_38 = happySpecReduce_1  20 happyReduction_38
happyReduction_38 (HappyTerminal (TokenPosn (Name happy_var_1) _ _))
	 =  HappyAbsSyn20
		 (PVar happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 5 20 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (PTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_1  20 happyReduction_40
happyReduction_40 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (PValue happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  21 happyReduction_41
happyReduction_41 (HappyTerminal (TokenPosn (Integer happy_var_1) _ _))
	 =  HappyAbsSyn21
		 (VInteger happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  21 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn21
		 (VBool True
	)

happyReduce_43 = happySpecReduce_1  21 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn21
		 (VBool False
	)

happyReduce_44 = happyReduce 5 21 happyReduction_44
happyReduction_44 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (VTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_45 = happySpecReduce_1  22 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn22
		 (Operator Arithmetic "-"
	)

happyReduce_46 = happySpecReduce_1  22 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn22
		 (Operator Logical "!"
	)

happyReduce_47 = happySpecReduce_1  23 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "+"
	)

happyReduce_48 = happySpecReduce_1  23 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "-"
	)

happyReduce_49 = happySpecReduce_1  23 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "*"
	)

happyReduce_50 = happySpecReduce_1  23 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "/"
	)

happyReduce_51 = happySpecReduce_1  23 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "%"
	)

happyReduce_52 = happySpecReduce_1  23 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn23
		 (Operator Relational "<"
	)

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn23
		 (Operator Relational ">"
	)

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn23
		 (Operator Relational "<="
	)

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn23
		 (Operator Relational ">="
	)

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn23
		 (Operator Comparison "=="
	)

happyReduce_57 = happySpecReduce_1  23 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn23
		 (Operator Comparison "!="
	)

happyReduce_58 = happySpecReduce_1  23 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn23
		 (Operator Logical "&&"
	)

happyReduce_59 = happySpecReduce_1  23 happyReduction_59
happyReduction_59 _
	 =  HappyAbsSyn23
		 (Operator Logical "||"
	)

happyNewToken action sts stk [] =
	action 64 64 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenPosn Behold _ _ -> cont 24;
	TokenPosn Summon _ _ -> cont 25;
	TokenPosn With _ _ -> cont 26;
	TokenPosn AndParam _ _ -> cont 27;
	TokenPosn This _ _ -> cont 28;
	TokenPosn Is _ _ -> cont 29;
	TokenPosn LParen _ _ -> cont 30;
	TokenPosn RParen _ _ -> cont 31;
	TokenPosn AndHisFriend _ _ -> cont 32;
	TokenPosn PutThat _ _ -> cont 33;
	TokenPosn Into _ _ -> cont 34;
	TokenPosn WhatIs _ _ -> cont 35;
	TokenPosn QuestionMark _ _ -> cont 36;
	TokenPosn Perhaps _ _ -> cont 37;
	TokenPosn WhoCares _ _ -> cont 38;
	TokenPosn WhichDoes _ _ -> cont 39;
	TokenPosn Neg _ _ -> cont 40;
	TokenPosn Not _ _ -> cont 41;
	TokenPosn Plus _ _ -> cont 42;
	TokenPosn Minus _ _ -> cont 43;
	TokenPosn Mult _ _ -> cont 44;
	TokenPosn Div _ _ -> cont 45;
	TokenPosn Mod _ _ -> cont 46;
	TokenPosn Lesser _ _ -> cont 47;
	TokenPosn Greater _ _ -> cont 48;
	TokenPosn LesserEq _ _ -> cont 49;
	TokenPosn GreaterEq _ _ -> cont 50;
	TokenPosn Eq _ _ -> cont 51;
	TokenPosn Neq _ _ -> cont 52;
	TokenPosn And _ _ -> cont 53;
	TokenPosn Or _ _ -> cont 54;
	TokenPosn Truthy _ _ -> cont 55;
	TokenPosn Falsy _ _ -> cont 56;
	TokenPosn (Name happy_dollar_dollar) _ _ -> cont 57;
	TokenPosn (Integer happy_dollar_dollar) _ _ -> cont 58;
	TokenPosn (Type "Integer") _ _ -> cont 59;
	TokenPosn (Type "Boolean") _ _ -> cont 60;
	TokenPosn Suppose _ _ -> cont 61;
	TokenPosn ThenWeCanConclude _ _ -> cont 62;
	TokenPosn RatherThan _ _ -> cont 63;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 64 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(TokenPosn)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError [] = error "Parse error at beginning or end of expression"
parseError (f:ts) = error $ "Parse error between " ++ show f ++ " and " ++ show l
    where l = last ts
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
