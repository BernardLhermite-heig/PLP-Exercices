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
happyExpList = Happy_Data_Array.listArray (0,219) ([0,10624,389,960,0,2176,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,256,0,0,0,0,0,0,65024,63,0,0,0,0,0,0,0,0,0,8448,389,960,0,0,0,256,0,8448,389,960,0,2176,2,0,0,8448,389,960,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65032,63,0,0,0,0,0,1024,2,0,0,8448,389,960,0,32768,65024,63,0,512,0,0,0,0,0,0,0,8448,389,960,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,512,0,0,0,0,64,0,0,8192,0,3072,0,8448,389,960,0,0,0,0,0,8448,389,960,0,8448,389,960,0,0,65024,63,0,2176,0,0,0,8448,389,960,0,0,16,0,0,0,0,0,0,0,0,0,0,8192,32,960,0,0,65024,63,0,0,0,0,0,16384,65024,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65024,63,0,1024,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,8192,0,3072,0,0,0,0,0,0,0,0,0,8448,389,960,0,0,65024,63,0,32768,0,0,0,0,0,0,0,0,0,0,0,8192,0,3072,0,8448,389,960,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,960,0,0,0,0,0,0,0,0,0,8192,0,3072,0,16384,0,0,0,0,0,0,0,0,0,0,0
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
action_0 (25) = happyShift action_11
action_0 (28) = happyShift action_5
action_0 (30) = happyShift action_12
action_0 (33) = happyShift action_13
action_0 (35) = happyShift action_14
action_0 (40) = happyShift action_15
action_0 (41) = happyShift action_16
action_0 (55) = happyShift action_17
action_0 (56) = happyShift action_18
action_0 (57) = happyShift action_19
action_0 (58) = happyShift action_20
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_7
action_0 (6) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (13) = happyGoto action_8
action_0 (21) = happyGoto action_9
action_0 (22) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (24) = happyShift action_4
action_1 (28) = happyShift action_5
action_1 (6) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_11

action_4 (57) = happyShift action_43
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (57) = happyShift action_42
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (64) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (42) = happyShift action_29
action_7 (43) = happyShift action_30
action_7 (44) = happyShift action_31
action_7 (45) = happyShift action_32
action_7 (46) = happyShift action_33
action_7 (47) = happyShift action_34
action_7 (48) = happyShift action_35
action_7 (49) = happyShift action_36
action_7 (50) = happyShift action_37
action_7 (51) = happyShift action_38
action_7 (52) = happyShift action_39
action_7 (53) = happyShift action_40
action_7 (54) = happyShift action_41
action_7 (23) = happyGoto action_28
action_7 _ = happyReduce_2

action_8 _ = happyReduce_10

action_9 _ = happyReduce_8

action_10 (25) = happyShift action_11
action_10 (30) = happyShift action_12
action_10 (33) = happyShift action_13
action_10 (35) = happyShift action_14
action_10 (40) = happyShift action_15
action_10 (41) = happyShift action_16
action_10 (55) = happyShift action_17
action_10 (56) = happyShift action_18
action_10 (57) = happyShift action_19
action_10 (58) = happyShift action_20
action_10 (5) = happyGoto action_27
action_10 (13) = happyGoto action_8
action_10 (21) = happyGoto action_9
action_10 (22) = happyGoto action_10
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (57) = happyShift action_26
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (25) = happyShift action_11
action_12 (30) = happyShift action_12
action_12 (33) = happyShift action_13
action_12 (35) = happyShift action_14
action_12 (40) = happyShift action_15
action_12 (41) = happyShift action_16
action_12 (55) = happyShift action_17
action_12 (56) = happyShift action_18
action_12 (57) = happyShift action_19
action_12 (58) = happyShift action_20
action_12 (5) = happyGoto action_25
action_12 (13) = happyGoto action_8
action_12 (21) = happyGoto action_9
action_12 (22) = happyGoto action_10
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (24) = happyShift action_4
action_13 (28) = happyShift action_5
action_13 (34) = happyShift action_24
action_13 (6) = happyGoto action_22
action_13 (7) = happyGoto action_3
action_13 (16) = happyGoto action_23
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (25) = happyShift action_11
action_14 (30) = happyShift action_12
action_14 (33) = happyShift action_13
action_14 (35) = happyShift action_14
action_14 (40) = happyShift action_15
action_14 (41) = happyShift action_16
action_14 (55) = happyShift action_17
action_14 (56) = happyShift action_18
action_14 (57) = happyShift action_19
action_14 (58) = happyShift action_20
action_14 (5) = happyGoto action_21
action_14 (13) = happyGoto action_8
action_14 (21) = happyGoto action_9
action_14 (22) = happyGoto action_10
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_42

action_16 _ = happyReduce_43

action_17 _ = happyReduce_39

action_18 _ = happyReduce_40

action_19 _ = happyReduce_9

action_20 _ = happyReduce_38

action_21 (36) = happyShift action_53
action_21 (42) = happyShift action_29
action_21 (43) = happyShift action_30
action_21 (44) = happyShift action_31
action_21 (45) = happyShift action_32
action_21 (46) = happyShift action_33
action_21 (47) = happyShift action_34
action_21 (48) = happyShift action_35
action_21 (49) = happyShift action_36
action_21 (50) = happyShift action_37
action_21 (51) = happyShift action_38
action_21 (52) = happyShift action_39
action_21 (53) = happyShift action_40
action_21 (54) = happyShift action_41
action_21 (23) = happyGoto action_28
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_29

action_23 (27) = happyShift action_51
action_23 (34) = happyShift action_52
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (25) = happyShift action_11
action_24 (30) = happyShift action_12
action_24 (33) = happyShift action_13
action_24 (35) = happyShift action_14
action_24 (40) = happyShift action_15
action_24 (41) = happyShift action_16
action_24 (55) = happyShift action_17
action_24 (56) = happyShift action_18
action_24 (57) = happyShift action_19
action_24 (58) = happyShift action_20
action_24 (5) = happyGoto action_50
action_24 (13) = happyGoto action_8
action_24 (21) = happyGoto action_9
action_24 (22) = happyGoto action_10
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (32) = happyShift action_49
action_25 (42) = happyShift action_29
action_25 (43) = happyShift action_30
action_25 (44) = happyShift action_31
action_25 (45) = happyShift action_32
action_25 (46) = happyShift action_33
action_25 (47) = happyShift action_34
action_25 (48) = happyShift action_35
action_25 (49) = happyShift action_36
action_25 (50) = happyShift action_37
action_25 (51) = happyShift action_38
action_25 (52) = happyShift action_39
action_25 (53) = happyShift action_40
action_25 (54) = happyShift action_41
action_25 (23) = happyGoto action_28
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (26) = happyShift action_48
action_26 _ = happyReduce_25

action_27 (42) = happyShift action_29
action_27 (43) = happyShift action_30
action_27 (44) = happyShift action_31
action_27 (45) = happyShift action_32
action_27 (46) = happyShift action_33
action_27 (47) = happyShift action_34
action_27 (48) = happyShift action_35
action_27 (49) = happyShift action_36
action_27 (50) = happyShift action_37
action_27 (51) = happyShift action_38
action_27 (52) = happyShift action_39
action_27 (53) = happyShift action_40
action_27 (54) = happyShift action_41
action_27 (23) = happyGoto action_28
action_27 _ = happyReduce_6

action_28 (25) = happyShift action_11
action_28 (30) = happyShift action_12
action_28 (33) = happyShift action_13
action_28 (35) = happyShift action_14
action_28 (40) = happyShift action_15
action_28 (41) = happyShift action_16
action_28 (55) = happyShift action_17
action_28 (56) = happyShift action_18
action_28 (57) = happyShift action_19
action_28 (58) = happyShift action_20
action_28 (5) = happyGoto action_47
action_28 (13) = happyGoto action_8
action_28 (21) = happyGoto action_9
action_28 (22) = happyGoto action_10
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_44

action_30 _ = happyReduce_45

action_31 _ = happyReduce_46

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

action_42 (29) = happyShift action_46
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (26) = happyShift action_45
action_43 (8) = happyGoto action_44
action_43 _ = happyReduce_14

action_44 (39) = happyShift action_71
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (30) = happyShift action_68
action_45 (59) = happyShift action_69
action_45 (60) = happyShift action_70
action_45 (9) = happyGoto action_64
action_45 (10) = happyGoto action_65
action_45 (11) = happyGoto action_66
action_45 (12) = happyGoto action_67
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (25) = happyShift action_11
action_46 (30) = happyShift action_12
action_46 (33) = happyShift action_13
action_46 (35) = happyShift action_14
action_46 (40) = happyShift action_15
action_46 (41) = happyShift action_16
action_46 (55) = happyShift action_17
action_46 (56) = happyShift action_18
action_46 (57) = happyShift action_19
action_46 (58) = happyShift action_20
action_46 (5) = happyGoto action_63
action_46 (13) = happyGoto action_8
action_46 (21) = happyGoto action_9
action_46 (22) = happyGoto action_10
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (42) = happyShift action_29
action_47 (43) = happyShift action_30
action_47 (44) = happyShift action_31
action_47 (45) = happyShift action_32
action_47 (46) = happyShift action_33
action_47 (47) = happyShift action_34
action_47 (48) = happyShift action_35
action_47 (49) = happyShift action_36
action_47 (50) = happyShift action_37
action_47 (51) = happyShift action_38
action_47 (52) = happyShift action_39
action_47 (53) = happyShift action_40
action_47 (54) = happyShift action_41
action_47 (23) = happyGoto action_28
action_47 _ = happyReduce_7

action_48 (25) = happyShift action_11
action_48 (30) = happyShift action_12
action_48 (33) = happyShift action_13
action_48 (35) = happyShift action_14
action_48 (40) = happyShift action_15
action_48 (41) = happyShift action_16
action_48 (55) = happyShift action_17
action_48 (56) = happyShift action_18
action_48 (57) = happyShift action_19
action_48 (58) = happyShift action_20
action_48 (5) = happyGoto action_60
action_48 (13) = happyGoto action_8
action_48 (14) = happyGoto action_61
action_48 (15) = happyGoto action_62
action_48 (21) = happyGoto action_9
action_48 (22) = happyGoto action_10
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (25) = happyShift action_11
action_49 (30) = happyShift action_12
action_49 (33) = happyShift action_13
action_49 (35) = happyShift action_14
action_49 (40) = happyShift action_15
action_49 (41) = happyShift action_16
action_49 (55) = happyShift action_17
action_49 (56) = happyShift action_18
action_49 (57) = happyShift action_19
action_49 (58) = happyShift action_20
action_49 (5) = happyGoto action_59
action_49 (13) = happyGoto action_8
action_49 (21) = happyGoto action_9
action_49 (22) = happyGoto action_10
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (42) = happyShift action_29
action_50 (43) = happyShift action_30
action_50 (44) = happyShift action_31
action_50 (45) = happyShift action_32
action_50 (46) = happyShift action_33
action_50 (47) = happyShift action_34
action_50 (48) = happyShift action_35
action_50 (49) = happyShift action_36
action_50 (50) = happyShift action_37
action_50 (51) = happyShift action_38
action_50 (52) = happyShift action_39
action_50 (53) = happyShift action_40
action_50 (54) = happyShift action_41
action_50 (23) = happyGoto action_28
action_50 _ = happyReduce_4

action_51 (24) = happyShift action_4
action_51 (28) = happyShift action_5
action_51 (6) = happyGoto action_58
action_51 (7) = happyGoto action_3
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (25) = happyShift action_11
action_52 (30) = happyShift action_12
action_52 (33) = happyShift action_13
action_52 (35) = happyShift action_14
action_52 (40) = happyShift action_15
action_52 (41) = happyShift action_16
action_52 (55) = happyShift action_17
action_52 (56) = happyShift action_18
action_52 (57) = happyShift action_19
action_52 (58) = happyShift action_20
action_52 (5) = happyGoto action_57
action_52 (13) = happyGoto action_8
action_52 (21) = happyGoto action_9
action_52 (22) = happyGoto action_10
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (37) = happyShift action_56
action_53 (18) = happyGoto action_54
action_53 (19) = happyGoto action_55
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_5

action_55 (37) = happyShift action_56
action_55 (18) = happyGoto action_83
action_55 (19) = happyGoto action_55
action_55 _ = happyReduce_32

action_56 (30) = happyShift action_12
action_56 (38) = happyShift action_81
action_56 (55) = happyShift action_17
action_56 (56) = happyShift action_18
action_56 (57) = happyShift action_82
action_56 (58) = happyShift action_20
action_56 (20) = happyGoto action_79
action_56 (21) = happyGoto action_80
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (42) = happyShift action_29
action_57 (43) = happyShift action_30
action_57 (44) = happyShift action_31
action_57 (45) = happyShift action_32
action_57 (46) = happyShift action_33
action_57 (47) = happyShift action_34
action_57 (48) = happyShift action_35
action_57 (49) = happyShift action_36
action_57 (50) = happyShift action_37
action_57 (51) = happyShift action_38
action_57 (52) = happyShift action_39
action_57 (53) = happyShift action_40
action_57 (54) = happyShift action_41
action_57 (23) = happyGoto action_28
action_57 _ = happyReduce_3

action_58 _ = happyReduce_30

action_59 (31) = happyShift action_78
action_59 (42) = happyShift action_29
action_59 (43) = happyShift action_30
action_59 (44) = happyShift action_31
action_59 (45) = happyShift action_32
action_59 (46) = happyShift action_33
action_59 (47) = happyShift action_34
action_59 (48) = happyShift action_35
action_59 (49) = happyShift action_36
action_59 (50) = happyShift action_37
action_59 (51) = happyShift action_38
action_59 (52) = happyShift action_39
action_59 (53) = happyShift action_40
action_59 (54) = happyShift action_41
action_59 (23) = happyGoto action_28
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (42) = happyShift action_29
action_60 (43) = happyShift action_30
action_60 (44) = happyShift action_31
action_60 (45) = happyShift action_32
action_60 (46) = happyShift action_33
action_60 (47) = happyShift action_34
action_60 (48) = happyShift action_35
action_60 (49) = happyShift action_36
action_60 (50) = happyShift action_37
action_60 (51) = happyShift action_38
action_60 (52) = happyShift action_39
action_60 (53) = happyShift action_40
action_60 (54) = happyShift action_41
action_60 (23) = happyGoto action_28
action_60 _ = happyReduce_28

action_61 (27) = happyShift action_77
action_61 _ = happyReduce_24

action_62 _ = happyReduce_26

action_63 (42) = happyShift action_29
action_63 (43) = happyShift action_30
action_63 (44) = happyShift action_31
action_63 (45) = happyShift action_32
action_63 (46) = happyShift action_33
action_63 (47) = happyShift action_34
action_63 (48) = happyShift action_35
action_63 (49) = happyShift action_36
action_63 (50) = happyShift action_37
action_63 (51) = happyShift action_38
action_63 (52) = happyShift action_39
action_63 (53) = happyShift action_40
action_63 (54) = happyShift action_41
action_63 (23) = happyGoto action_28
action_63 _ = happyReduce_12

action_64 (27) = happyShift action_76
action_64 _ = happyReduce_15

action_65 _ = happyReduce_16

action_66 (57) = happyShift action_75
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (57) = happyReduce_22
action_67 _ = happyReduce_19

action_68 (30) = happyShift action_68
action_68 (59) = happyShift action_69
action_68 (60) = happyShift action_70
action_68 (11) = happyGoto action_73
action_68 (12) = happyGoto action_74
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_20

action_70 _ = happyReduce_21

action_71 (25) = happyShift action_11
action_71 (30) = happyShift action_12
action_71 (33) = happyShift action_13
action_71 (35) = happyShift action_14
action_71 (40) = happyShift action_15
action_71 (41) = happyShift action_16
action_71 (55) = happyShift action_17
action_71 (56) = happyShift action_18
action_71 (57) = happyShift action_19
action_71 (58) = happyShift action_20
action_71 (5) = happyGoto action_72
action_71 (13) = happyGoto action_8
action_71 (21) = happyGoto action_9
action_71 (22) = happyGoto action_10
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (42) = happyShift action_29
action_72 (43) = happyShift action_30
action_72 (44) = happyShift action_31
action_72 (45) = happyShift action_32
action_72 (46) = happyShift action_33
action_72 (47) = happyShift action_34
action_72 (48) = happyShift action_35
action_72 (49) = happyShift action_36
action_72 (50) = happyShift action_37
action_72 (51) = happyShift action_38
action_72 (52) = happyShift action_39
action_72 (53) = happyShift action_40
action_72 (54) = happyShift action_41
action_72 (23) = happyGoto action_28
action_72 _ = happyReduce_13

action_73 (32) = happyShift action_87
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_22

action_75 _ = happyReduce_18

action_76 (30) = happyShift action_68
action_76 (59) = happyShift action_69
action_76 (60) = happyShift action_70
action_76 (10) = happyGoto action_86
action_76 (11) = happyGoto action_66
action_76 (12) = happyGoto action_67
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (25) = happyShift action_11
action_77 (30) = happyShift action_12
action_77 (33) = happyShift action_13
action_77 (35) = happyShift action_14
action_77 (40) = happyShift action_15
action_77 (41) = happyShift action_16
action_77 (55) = happyShift action_17
action_77 (56) = happyShift action_18
action_77 (57) = happyShift action_19
action_77 (58) = happyShift action_20
action_77 (5) = happyGoto action_60
action_77 (13) = happyGoto action_8
action_77 (15) = happyGoto action_85
action_77 (21) = happyGoto action_9
action_77 (22) = happyGoto action_10
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_41

action_79 (39) = happyShift action_84
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_37

action_81 _ = happyReduce_35

action_82 _ = happyReduce_36

action_83 _ = happyReduce_33

action_84 (25) = happyShift action_11
action_84 (30) = happyShift action_12
action_84 (33) = happyShift action_13
action_84 (35) = happyShift action_14
action_84 (40) = happyShift action_15
action_84 (41) = happyShift action_16
action_84 (55) = happyShift action_17
action_84 (56) = happyShift action_18
action_84 (57) = happyShift action_19
action_84 (58) = happyShift action_20
action_84 (5) = happyGoto action_89
action_84 (13) = happyGoto action_8
action_84 (21) = happyGoto action_9
action_84 (22) = happyGoto action_10
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_27

action_86 _ = happyReduce_17

action_87 (30) = happyShift action_68
action_87 (59) = happyShift action_69
action_87 (60) = happyShift action_70
action_87 (11) = happyGoto action_88
action_87 (12) = happyGoto action_74
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (31) = happyShift action_90
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (42) = happyShift action_29
action_89 (43) = happyShift action_30
action_89 (44) = happyShift action_31
action_89 (45) = happyShift action_32
action_89 (46) = happyShift action_33
action_89 (47) = happyShift action_34
action_89 (48) = happyShift action_35
action_89 (49) = happyShift action_36
action_89 (50) = happyShift action_37
action_89 (51) = happyShift action_38
action_89 (52) = happyShift action_39
action_89 (53) = happyShift action_40
action_89 (54) = happyShift action_41
action_89 (23) = happyGoto action_28
action_89 _ = happyReduce_34

action_90 _ = happyReduce_23

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
happyReduction_9 (HappyTerminal (TokenPosn (Name happy_var_1) _))
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

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 6 happyReduction_12
happyReduction_12 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Definition happy_var_2 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 5 7 happyReduction_13
happyReduction_13 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Definition happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_0  8 happyReduction_14
happyReduction_14  =  HappyAbsSyn8
		 ([]
	)

happyReduce_15 = happySpecReduce_2  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  9 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_3:happy_var_1
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  10 happyReduction_18
happyReduction_18 (HappyTerminal (TokenPosn (Name happy_var_2) _))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Arg happy_var_1 happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (Arg happy_var_1 ""
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (TInteger
	)

happyReduce_21 = happySpecReduce_1  11 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn11
		 (TBool
	)

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happyReduce 5 12 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 4 13 happyReduction_24
happyReduction_24 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (EApp happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_2  13 happyReduction_25
happyReduction_25 (HappyTerminal (TokenPosn (Name happy_var_2) _))
	_
	 =  HappyAbsSyn13
		 (EApp happy_var_2 []
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  14 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3:happy_var_1
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  16 happyReduction_29
happyReduction_29 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  16 happyReduction_30
happyReduction_30 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3:happy_var_1
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 6 17 happyReduction_31
happyReduction_31 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_1  18 happyReduction_32
happyReduction_32 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  18 happyReduction_33
happyReduction_33 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 4 19 happyReduction_34
happyReduction_34 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 ((happy_var_2,happy_var_4)
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  20 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn20
		 (PAny
	)

happyReduce_36 = happySpecReduce_1  20 happyReduction_36
happyReduction_36 (HappyTerminal (TokenPosn (Name happy_var_1) _))
	 =  HappyAbsSyn20
		 (PVar happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  20 happyReduction_37
happyReduction_37 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (PValue happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  21 happyReduction_38
happyReduction_38 (HappyTerminal (TokenPosn (Integer happy_var_1) _))
	 =  HappyAbsSyn21
		 (VInteger happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  21 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn21
		 (VBool True
	)

happyReduce_40 = happySpecReduce_1  21 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn21
		 (VBool False
	)

happyReduce_41 = happyReduce 5 21 happyReduction_41
happyReduction_41 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (VTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_1  22 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn22
		 (Operator Arithmetic "-"
	)

happyReduce_43 = happySpecReduce_1  22 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn22
		 (Operator Logical "!"
	)

happyReduce_44 = happySpecReduce_1  23 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "+"
	)

happyReduce_45 = happySpecReduce_1  23 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "-"
	)

happyReduce_46 = happySpecReduce_1  23 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "*"
	)

happyReduce_47 = happySpecReduce_1  23 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "/"
	)

happyReduce_48 = happySpecReduce_1  23 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn23
		 (Operator Arithmetic "%"
	)

happyReduce_49 = happySpecReduce_1  23 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn23
		 (Operator Relational "<"
	)

happyReduce_50 = happySpecReduce_1  23 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn23
		 (Operator Relational ">"
	)

happyReduce_51 = happySpecReduce_1  23 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn23
		 (Operator Relational "<="
	)

happyReduce_52 = happySpecReduce_1  23 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn23
		 (Operator Relational ">="
	)

happyReduce_53 = happySpecReduce_1  23 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn23
		 (Operator Comparison "=="
	)

happyReduce_54 = happySpecReduce_1  23 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn23
		 (Operator Comparison "!="
	)

happyReduce_55 = happySpecReduce_1  23 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn23
		 (Operator Logical "&&"
	)

happyReduce_56 = happySpecReduce_1  23 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn23
		 (Operator Logical "||"
	)

happyNewToken action sts stk [] =
	action 64 64 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenPosn Behold _ -> cont 24;
	TokenPosn Summon _ -> cont 25;
	TokenPosn With _ -> cont 26;
	TokenPosn AndParam _ -> cont 27;
	TokenPosn This _ -> cont 28;
	TokenPosn Is _ -> cont 29;
	TokenPosn LParen _ -> cont 30;
	TokenPosn RParen _ -> cont 31;
	TokenPosn AndHisFriend _ -> cont 32;
	TokenPosn PutThat _ -> cont 33;
	TokenPosn Into _ -> cont 34;
	TokenPosn WhatIs _ -> cont 35;
	TokenPosn QuestionMark _ -> cont 36;
	TokenPosn Perhaps _ -> cont 37;
	TokenPosn WhoCares _ -> cont 38;
	TokenPosn WhichDoes _ -> cont 39;
	TokenPosn Neg _ -> cont 40;
	TokenPosn Not _ -> cont 41;
	TokenPosn Plus _ -> cont 42;
	TokenPosn Minus _ -> cont 43;
	TokenPosn Mult _ -> cont 44;
	TokenPosn Div _ -> cont 45;
	TokenPosn Mod _ -> cont 46;
	TokenPosn Lesser _ -> cont 47;
	TokenPosn Greater _ -> cont 48;
	TokenPosn LesserEq _ -> cont 49;
	TokenPosn GreaterEq _ -> cont 50;
	TokenPosn Eq _ -> cont 51;
	TokenPosn Neq _ -> cont 52;
	TokenPosn And _ -> cont 53;
	TokenPosn Or _ -> cont 54;
	TokenPosn Truthy _ -> cont 55;
	TokenPosn Falsy _ -> cont 56;
	TokenPosn (Name happy_dollar_dollar) _ -> cont 57;
	TokenPosn (Integer happy_dollar_dollar) _ -> cont 58;
	TokenPosn (Type "Integer") _ -> cont 59;
	TokenPosn (Type "Boolean") _ -> cont 60;
	TokenPosn Suppose _ -> cont 61;
	TokenPosn ThenWeCanConclude _ -> cont 62;
	TokenPosn RatherThan _ -> cont 63;
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
