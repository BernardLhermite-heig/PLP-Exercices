{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer
import Language
import Semantics
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
happyExpList = Happy_Data_Array.listArray (0,323) ([0,10624,389,5056,0,2176,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,256,0,0,0,0,0,0,65024,63,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,0,256,0,8448,389,5056,0,2176,2,0,0,8448,389,5056,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,65024,8255,0,0,65032,63,0,0,0,0,0,1024,2,0,0,8448,389,5056,0,32768,65024,63,0,512,0,0,0,0,0,0,0,8448,389,5056,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,512,0,0,0,0,64,0,0,8192,0,3328,0,8448,389,5056,0,0,0,0,0,8448,389,5056,0,8448,389,5056,0,0,65024,63,0,2176,0,0,0,8448,389,5056,0,0,16,0,0,8448,389,5056,0,0,65024,16447,0,0,0,0,0,0,0,0,0,8192,32,960,0,0,65024,63,0,0,0,0,0,16384,65024,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65024,63,0,1024,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,8192,0,3072,0,8192,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,65024,63,0,8192,0,3328,0,32768,0,0,0,0,0,0,0,8192,0,3328,0,8448,389,5056,0,0,0,0,0,0,64,0,0,0,0,0,0,8448,421,5056,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,0,0,0,0,0,0,0,8192,0,3072,0,32768,0,0,0,8192,0,3328,0,16384,0,0,0,0,0,0,0,8192,32,960,0,16384,0,0,0,0,0,0,0,16384,0,0,0,0,0,0,0,0,0,0,0
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

action_3 _ = happyReduce_12

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

action_16 _ = happyReduce_44

action_17 _ = happyReduce_45

action_18 _ = happyReduce_41

action_19 _ = happyReduce_42

action_20 _ = happyReduce_9

action_21 _ = happyReduce_40

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
action_23 (62) = happyShift action_57
action_23 (23) = happyGoto action_31
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (36) = happyShift action_56
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

action_25 _ = happyReduce_30

action_26 (27) = happyShift action_54
action_26 (34) = happyShift action_55
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
action_27 (5) = happyGoto action_53
action_27 (13) = happyGoto action_8
action_27 (17) = happyGoto action_9
action_27 (21) = happyGoto action_10
action_27 (22) = happyGoto action_11
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (32) = happyShift action_52
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
action_29 _ = happyReduce_26

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

action_32 _ = happyReduce_46

action_33 _ = happyReduce_47

action_34 _ = happyReduce_48

action_35 _ = happyReduce_49

action_36 _ = happyReduce_50

action_37 _ = happyReduce_51

action_38 _ = happyReduce_52

action_39 _ = happyReduce_53

action_40 _ = happyReduce_54

action_41 _ = happyReduce_55

action_42 _ = happyReduce_56

action_43 _ = happyReduce_57

action_44 _ = happyReduce_58

action_45 (29) = happyShift action_49
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (26) = happyShift action_48
action_46 (8) = happyGoto action_47
action_46 _ = happyReduce_15

action_47 (39) = happyShift action_77
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (30) = happyShift action_73
action_48 (57) = happyShift action_74
action_48 (59) = happyShift action_75
action_48 (60) = happyShift action_76
action_48 (9) = happyGoto action_69
action_48 (10) = happyGoto action_70
action_48 (11) = happyGoto action_71
action_48 (12) = happyGoto action_72
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
action_49 (5) = happyGoto action_68
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
action_51 (5) = happyGoto action_65
action_51 (13) = happyGoto action_8
action_51 (14) = happyGoto action_66
action_51 (15) = happyGoto action_67
action_51 (17) = happyGoto action_9
action_51 (21) = happyGoto action_10
action_51 (22) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (25) = happyShift action_12
action_52 (30) = happyShift action_13
action_52 (33) = happyShift action_14
action_52 (35) = happyShift action_15
action_52 (40) = happyShift action_16
action_52 (41) = happyShift action_17
action_52 (55) = happyShift action_18
action_52 (56) = happyShift action_19
action_52 (57) = happyShift action_20
action_52 (58) = happyShift action_21
action_52 (61) = happyShift action_22
action_52 (5) = happyGoto action_64
action_52 (13) = happyGoto action_8
action_52 (17) = happyGoto action_9
action_52 (21) = happyGoto action_10
action_52 (22) = happyGoto action_11
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (42) = happyShift action_32
action_53 (43) = happyShift action_33
action_53 (44) = happyShift action_34
action_53 (45) = happyShift action_35
action_53 (46) = happyShift action_36
action_53 (47) = happyShift action_37
action_53 (48) = happyShift action_38
action_53 (49) = happyShift action_39
action_53 (50) = happyShift action_40
action_53 (51) = happyShift action_41
action_53 (52) = happyShift action_42
action_53 (53) = happyShift action_43
action_53 (54) = happyShift action_44
action_53 (23) = happyGoto action_31
action_53 _ = happyReduce_4

action_54 (24) = happyShift action_4
action_54 (28) = happyShift action_5
action_54 (6) = happyGoto action_63
action_54 (7) = happyGoto action_3
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (25) = happyShift action_12
action_55 (30) = happyShift action_13
action_55 (33) = happyShift action_14
action_55 (35) = happyShift action_15
action_55 (40) = happyShift action_16
action_55 (41) = happyShift action_17
action_55 (55) = happyShift action_18
action_55 (56) = happyShift action_19
action_55 (57) = happyShift action_20
action_55 (58) = happyShift action_21
action_55 (61) = happyShift action_22
action_55 (5) = happyGoto action_62
action_55 (13) = happyGoto action_8
action_55 (17) = happyGoto action_9
action_55 (21) = happyGoto action_10
action_55 (22) = happyGoto action_11
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (37) = happyShift action_61
action_56 (18) = happyGoto action_59
action_56 (19) = happyGoto action_60
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (25) = happyShift action_12
action_57 (30) = happyShift action_13
action_57 (33) = happyShift action_14
action_57 (35) = happyShift action_15
action_57 (40) = happyShift action_16
action_57 (41) = happyShift action_17
action_57 (55) = happyShift action_18
action_57 (56) = happyShift action_19
action_57 (57) = happyShift action_20
action_57 (58) = happyShift action_21
action_57 (61) = happyShift action_22
action_57 (5) = happyGoto action_58
action_57 (13) = happyGoto action_8
action_57 (17) = happyGoto action_9
action_57 (21) = happyGoto action_10
action_57 (22) = happyGoto action_11
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (42) = happyShift action_32
action_58 (43) = happyShift action_33
action_58 (44) = happyShift action_34
action_58 (45) = happyShift action_35
action_58 (46) = happyShift action_36
action_58 (47) = happyShift action_37
action_58 (48) = happyShift action_38
action_58 (49) = happyShift action_39
action_58 (50) = happyShift action_40
action_58 (51) = happyShift action_41
action_58 (52) = happyShift action_42
action_58 (53) = happyShift action_43
action_58 (54) = happyShift action_44
action_58 (63) = happyShift action_91
action_58 (23) = happyGoto action_31
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_5

action_60 (37) = happyShift action_61
action_60 (18) = happyGoto action_90
action_60 (19) = happyGoto action_60
action_60 _ = happyReduce_33

action_61 (30) = happyShift action_87
action_61 (38) = happyShift action_88
action_61 (55) = happyShift action_18
action_61 (56) = happyShift action_19
action_61 (57) = happyShift action_89
action_61 (58) = happyShift action_21
action_61 (20) = happyGoto action_85
action_61 (21) = happyGoto action_86
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (42) = happyShift action_32
action_62 (43) = happyShift action_33
action_62 (44) = happyShift action_34
action_62 (45) = happyShift action_35
action_62 (46) = happyShift action_36
action_62 (47) = happyShift action_37
action_62 (48) = happyShift action_38
action_62 (49) = happyShift action_39
action_62 (50) = happyShift action_40
action_62 (51) = happyShift action_41
action_62 (52) = happyShift action_42
action_62 (53) = happyShift action_43
action_62 (54) = happyShift action_44
action_62 (23) = happyGoto action_31
action_62 _ = happyReduce_3

action_63 _ = happyReduce_31

action_64 (31) = happyShift action_84
action_64 (42) = happyShift action_32
action_64 (43) = happyShift action_33
action_64 (44) = happyShift action_34
action_64 (45) = happyShift action_35
action_64 (46) = happyShift action_36
action_64 (47) = happyShift action_37
action_64 (48) = happyShift action_38
action_64 (49) = happyShift action_39
action_64 (50) = happyShift action_40
action_64 (51) = happyShift action_41
action_64 (52) = happyShift action_42
action_64 (53) = happyShift action_43
action_64 (54) = happyShift action_44
action_64 (23) = happyGoto action_31
action_64 _ = happyFail (happyExpListPerState 64)

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
action_65 _ = happyReduce_29

action_66 (27) = happyShift action_83
action_66 _ = happyReduce_25

action_67 _ = happyReduce_27

action_68 (42) = happyShift action_32
action_68 (43) = happyShift action_33
action_68 (44) = happyShift action_34
action_68 (45) = happyShift action_35
action_68 (46) = happyShift action_36
action_68 (47) = happyShift action_37
action_68 (48) = happyShift action_38
action_68 (49) = happyShift action_39
action_68 (50) = happyShift action_40
action_68 (51) = happyShift action_41
action_68 (52) = happyShift action_42
action_68 (53) = happyShift action_43
action_68 (54) = happyShift action_44
action_68 (23) = happyGoto action_31
action_68 _ = happyReduce_13

action_69 (27) = happyShift action_82
action_69 _ = happyReduce_16

action_70 _ = happyReduce_17

action_71 (57) = happyShift action_81
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_23

action_73 (30) = happyShift action_73
action_73 (59) = happyShift action_75
action_73 (60) = happyShift action_76
action_73 (11) = happyGoto action_80
action_73 (12) = happyGoto action_72
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (30) = happyShift action_79
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_21

action_76 _ = happyReduce_22

action_77 (25) = happyShift action_12
action_77 (30) = happyShift action_13
action_77 (33) = happyShift action_14
action_77 (35) = happyShift action_15
action_77 (40) = happyShift action_16
action_77 (41) = happyShift action_17
action_77 (55) = happyShift action_18
action_77 (56) = happyShift action_19
action_77 (57) = happyShift action_20
action_77 (58) = happyShift action_21
action_77 (61) = happyShift action_22
action_77 (5) = happyGoto action_78
action_77 (13) = happyGoto action_8
action_77 (17) = happyGoto action_9
action_77 (21) = happyGoto action_10
action_77 (22) = happyGoto action_11
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (42) = happyShift action_32
action_78 (43) = happyShift action_33
action_78 (44) = happyShift action_34
action_78 (45) = happyShift action_35
action_78 (46) = happyShift action_36
action_78 (47) = happyShift action_37
action_78 (48) = happyShift action_38
action_78 (49) = happyShift action_39
action_78 (50) = happyShift action_40
action_78 (51) = happyShift action_41
action_78 (52) = happyShift action_42
action_78 (53) = happyShift action_43
action_78 (54) = happyShift action_44
action_78 (23) = happyGoto action_31
action_78 _ = happyReduce_14

action_79 (30) = happyShift action_73
action_79 (57) = happyShift action_74
action_79 (59) = happyShift action_75
action_79 (60) = happyShift action_76
action_79 (10) = happyGoto action_100
action_79 (11) = happyGoto action_71
action_79 (12) = happyGoto action_72
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (32) = happyShift action_99
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_19

action_82 (30) = happyShift action_73
action_82 (57) = happyShift action_74
action_82 (59) = happyShift action_75
action_82 (60) = happyShift action_76
action_82 (10) = happyGoto action_98
action_82 (11) = happyGoto action_71
action_82 (12) = happyGoto action_72
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (25) = happyShift action_12
action_83 (30) = happyShift action_13
action_83 (33) = happyShift action_14
action_83 (35) = happyShift action_15
action_83 (40) = happyShift action_16
action_83 (41) = happyShift action_17
action_83 (55) = happyShift action_18
action_83 (56) = happyShift action_19
action_83 (57) = happyShift action_20
action_83 (58) = happyShift action_21
action_83 (61) = happyShift action_22
action_83 (5) = happyGoto action_65
action_83 (13) = happyGoto action_8
action_83 (15) = happyGoto action_97
action_83 (17) = happyGoto action_9
action_83 (21) = happyGoto action_10
action_83 (22) = happyGoto action_11
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_43

action_85 (39) = happyShift action_96
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_39

action_87 (25) = happyShift action_12
action_87 (30) = happyShift action_87
action_87 (33) = happyShift action_14
action_87 (35) = happyShift action_15
action_87 (38) = happyShift action_88
action_87 (40) = happyShift action_16
action_87 (41) = happyShift action_17
action_87 (55) = happyShift action_18
action_87 (56) = happyShift action_19
action_87 (57) = happyShift action_95
action_87 (58) = happyShift action_21
action_87 (61) = happyShift action_22
action_87 (5) = happyGoto action_28
action_87 (13) = happyGoto action_8
action_87 (17) = happyGoto action_9
action_87 (20) = happyGoto action_93
action_87 (21) = happyGoto action_94
action_87 (22) = happyGoto action_11
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_36

action_89 _ = happyReduce_37

action_90 _ = happyReduce_34

action_91 (25) = happyShift action_12
action_91 (30) = happyShift action_13
action_91 (33) = happyShift action_14
action_91 (35) = happyShift action_15
action_91 (40) = happyShift action_16
action_91 (41) = happyShift action_17
action_91 (55) = happyShift action_18
action_91 (56) = happyShift action_19
action_91 (57) = happyShift action_20
action_91 (58) = happyShift action_21
action_91 (61) = happyShift action_22
action_91 (5) = happyGoto action_92
action_91 (13) = happyGoto action_8
action_91 (17) = happyGoto action_9
action_91 (21) = happyGoto action_10
action_91 (22) = happyGoto action_11
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (42) = happyShift action_32
action_92 (43) = happyShift action_33
action_92 (44) = happyShift action_34
action_92 (45) = happyShift action_35
action_92 (46) = happyShift action_36
action_92 (47) = happyShift action_37
action_92 (48) = happyShift action_38
action_92 (49) = happyShift action_39
action_92 (50) = happyShift action_40
action_92 (51) = happyShift action_41
action_92 (52) = happyShift action_42
action_92 (53) = happyShift action_43
action_92 (54) = happyShift action_44
action_92 (23) = happyGoto action_31
action_92 _ = happyReduce_32

action_93 (32) = happyShift action_104
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (32) = happyReduce_39
action_94 _ = happyReduce_8

action_95 (32) = happyReduce_37
action_95 _ = happyReduce_9

action_96 (25) = happyShift action_12
action_96 (30) = happyShift action_13
action_96 (33) = happyShift action_14
action_96 (35) = happyShift action_15
action_96 (40) = happyShift action_16
action_96 (41) = happyShift action_17
action_96 (55) = happyShift action_18
action_96 (56) = happyShift action_19
action_96 (57) = happyShift action_20
action_96 (58) = happyShift action_21
action_96 (61) = happyShift action_22
action_96 (5) = happyGoto action_103
action_96 (13) = happyGoto action_8
action_96 (17) = happyGoto action_9
action_96 (21) = happyGoto action_10
action_96 (22) = happyGoto action_11
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_28

action_98 _ = happyReduce_18

action_99 (30) = happyShift action_73
action_99 (59) = happyShift action_75
action_99 (60) = happyShift action_76
action_99 (11) = happyGoto action_102
action_99 (12) = happyGoto action_72
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (32) = happyShift action_101
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (30) = happyShift action_73
action_101 (57) = happyShift action_74
action_101 (59) = happyShift action_75
action_101 (60) = happyShift action_76
action_101 (10) = happyGoto action_107
action_101 (11) = happyGoto action_71
action_101 (12) = happyGoto action_72
action_101 _ = happyFail (happyExpListPerState 101)

action_102 (31) = happyShift action_106
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (42) = happyShift action_32
action_103 (43) = happyShift action_33
action_103 (44) = happyShift action_34
action_103 (45) = happyShift action_35
action_103 (46) = happyShift action_36
action_103 (47) = happyShift action_37
action_103 (48) = happyShift action_38
action_103 (49) = happyShift action_39
action_103 (50) = happyShift action_40
action_103 (51) = happyShift action_41
action_103 (52) = happyShift action_42
action_103 (53) = happyShift action_43
action_103 (54) = happyShift action_44
action_103 (23) = happyGoto action_31
action_103 _ = happyReduce_35

action_104 (30) = happyShift action_87
action_104 (38) = happyShift action_88
action_104 (55) = happyShift action_18
action_104 (56) = happyShift action_19
action_104 (57) = happyShift action_89
action_104 (58) = happyShift action_21
action_104 (20) = happyGoto action_105
action_104 (21) = happyGoto action_86
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (31) = happyShift action_109
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_24

action_107 (31) = happyShift action_108
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_20

action_109 _ = happyReduce_38

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

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 6 happyReduction_13
happyReduction_13 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Definition happy_var_2 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 7 happyReduction_14
happyReduction_14 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Definition happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_0  8 happyReduction_15
happyReduction_15  =  HappyAbsSyn8
		 ([]
	)

happyReduce_16 = happySpecReduce_2  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  9 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_3:happy_var_1
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  10 happyReduction_19
happyReduction_19 (HappyTerminal (TokenPosn (Name happy_var_2) _ _))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Arg happy_var_1 happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 6 10 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_1) _ _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Arg (TTuple happy_var_3 happy_var_5) happy_var_1
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn11
		 (TInteger
	)

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (TBool
	)

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happyReduce 5 12 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TTuple (Arg happy_var_2 "") (Arg happy_var_4 "")
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 4 13 happyReduction_25
happyReduction_25 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (EApp happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  13 happyReduction_26
happyReduction_26 (HappyTerminal (TokenPosn (Name happy_var_2) _ _))
	_
	 =  HappyAbsSyn13
		 (EApp happy_var_2 []
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  14 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3:happy_var_1
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  16 happyReduction_30
happyReduction_30 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  16 happyReduction_31
happyReduction_31 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3:happy_var_1
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 6 17 happyReduction_32
happyReduction_32 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_1  18 happyReduction_33
happyReduction_33 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  18 happyReduction_34
happyReduction_34 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 19 happyReduction_35
happyReduction_35 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 ((happy_var_2,happy_var_4)
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_1  20 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn20
		 (PAny
	)

happyReduce_37 = happySpecReduce_1  20 happyReduction_37
happyReduction_37 (HappyTerminal (TokenPosn (Name happy_var_1) _ _))
	 =  HappyAbsSyn20
		 (PVar happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 5 20 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (PTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_1  20 happyReduction_39
happyReduction_39 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (PValue happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  21 happyReduction_40
happyReduction_40 (HappyTerminal (TokenPosn (Integer happy_var_1) _ _))
	 =  HappyAbsSyn21
		 (VInteger happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  21 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn21
		 (VBool True
	)

happyReduce_42 = happySpecReduce_1  21 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn21
		 (VBool False
	)

happyReduce_43 = happyReduce 5 21 happyReduction_43
happyReduction_43 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (VTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_44 = happySpecReduce_1  22 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn22
		 (Operator Arithmetic "-"
	)

happyReduce_45 = happySpecReduce_1  22 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn22
		 (Operator Logical "!"
	)

happyReduce_46 = happySpecReduce_1  23 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "+"
	)

happyReduce_47 = happySpecReduce_1  23 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "-"
	)

happyReduce_48 = happySpecReduce_1  23 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "*"
	)

happyReduce_49 = happySpecReduce_1  23 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "/"
	)

happyReduce_50 = happySpecReduce_1  23 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "%"
	)

happyReduce_51 = happySpecReduce_1  23 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn23
		 (Operator Relational "<"
	)

happyReduce_52 = happySpecReduce_1  23 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn23
		 (Operator Relational ">"
	)

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn23
		 (Operator Relational "<="
	)

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn23
		 (Operator Relational ">="
	)

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn23
		 (Operator Comparison "=="
	)

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn23
		 (Operator Comparison "!="
	)

happyReduce_57 = happySpecReduce_1  23 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn23
		 (Operator Logical "&&"
	)

happyReduce_58 = happySpecReduce_1  23 happyReduction_58
happyReduction_58 _
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


parseError [] = error "Parse error at beginning of expression"
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
