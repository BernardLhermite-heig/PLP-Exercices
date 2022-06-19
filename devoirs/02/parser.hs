{-# OPTIONS_GHC -w #-}
module Parser where

import Lexer
import Language
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,414) ([0,19040,97,1264,0,136,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,0,4096,0,0,0,0,0,0,65024,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,16384,24904,61440,4,34816,32,0,0,33792,1556,20224,0,8448,389,5056,0,18496,97,1264,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,6226,15360,1,0,63488,33023,0,0,0,0,0,0,0,0,0,32768,65504,3,0,0,0,0,0,516,0,0,16384,24904,61440,4,0,57356,1023,0,2048,0,0,0,8448,389,5056,0,18496,97,1264,0,21008,24,316,0,5252,6,79,0,34081,49153,19,16384,24904,61440,4,4096,6226,15360,1,33792,1556,20224,0,8448,389,5056,0,18496,97,1264,0,21008,24,316,0,5252,6,79,0,34081,49153,19,0,4,0,0,8192,0,0,0,0,256,0,0,8192,0,3328,0,18496,97,1264,0,0,65504,3,0,0,32760,0,0,0,62,0,0,32768,15,0,0,57344,3,0,0,63488,0,0,0,15872,0,0,0,3968,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,32768,3,0,33792,1556,20224,0,0,0,0,0,18496,97,1264,0,0,65504,3,0,34,0,0,0,34081,49153,19,0,1024,0,0,4096,6226,15360,1,0,63488,255,1,0,0,0,0,0,0,0,0,512,2,60,0,0,65528,0,0,0,0,0,0,32784,4095,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65408,15,0,64,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,2,49152,0,32768,0,0,0,0,0,0,0,0,0,0,0,21008,24,316,0,0,65528,0,0,32,0,13,0,32,0,0,0,0,0,0,32768,0,13312,0,8448,389,5056,0,0,0,0,0,0,4,0,0,0,0,0,0,42273,49153,19,0,0,0,0,0,0,0,0,0,0,0,0,8448,389,5056,0,0,0,0,0,2048,65504,3,0,512,0,0,0,0,0,0,16384,26952,61440,4,0,0,0,0,33792,1556,20224,0,0,0,0,0,0,0,0,0,512,0,192,0,512,0,0,0,32,0,13,0,16,0,0,0,0,0,0,32768,128,3840,0,16384,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Statement","Expr","Definition","FunctionDef","FArgs","Args","Arg","Type","TypeTuple","FunctionApp","FunctionAppArgs","FunctionAppArg","LetInDefs","If","CaseOfs","CaseOf","Pattern","Literal","'behold'","'summon'","'with'","'and'","'this'","'is'","'('","')'","'and his friend'","'put that'","'into'","'what is'","'?'","'perhaps'","'who cares'","'which does'","'neg'","'not'","'plus'","'minus'","'times'","'split'","'rest'","'weaker than'","'stronger than'","'as weak as'","'as strong as'","'same as'","'different of'","'both'","'either'","'yep'","'pasyep'","'identifier'","'integer'","'Integer'","'Boolean'","'suppose'","'then we can conclude'","'rather than'","%eof"]
        bit_start = st Prelude.* 62
        bit_end = (st Prelude.+ 1) Prelude.* 62
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..61]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (22) = happyShift action_4
action_0 (23) = happyShift action_11
action_0 (26) = happyShift action_5
action_0 (28) = happyShift action_12
action_0 (31) = happyShift action_13
action_0 (33) = happyShift action_14
action_0 (38) = happyShift action_15
action_0 (39) = happyShift action_16
action_0 (53) = happyShift action_17
action_0 (54) = happyShift action_18
action_0 (55) = happyShift action_19
action_0 (56) = happyShift action_20
action_0 (59) = happyShift action_21
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_7
action_0 (6) = happyGoto action_2
action_0 (7) = happyGoto action_3
action_0 (13) = happyGoto action_8
action_0 (17) = happyGoto action_9
action_0 (21) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_4
action_1 (26) = happyShift action_5
action_1 (6) = happyGoto action_2
action_1 (7) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_26

action_4 (55) = happyShift action_45
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (55) = happyShift action_44
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (62) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (40) = happyShift action_31
action_7 (41) = happyShift action_32
action_7 (42) = happyShift action_33
action_7 (43) = happyShift action_34
action_7 (44) = happyShift action_35
action_7 (45) = happyShift action_36
action_7 (46) = happyShift action_37
action_7 (47) = happyShift action_38
action_7 (48) = happyShift action_39
action_7 (49) = happyShift action_40
action_7 (50) = happyShift action_41
action_7 (51) = happyShift action_42
action_7 (52) = happyShift action_43
action_7 _ = happyReduce_2

action_8 _ = happyReduce_23

action_9 _ = happyReduce_24

action_10 _ = happyReduce_21

action_11 (55) = happyShift action_30
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (23) = happyShift action_11
action_12 (28) = happyShift action_12
action_12 (31) = happyShift action_13
action_12 (33) = happyShift action_14
action_12 (38) = happyShift action_15
action_12 (39) = happyShift action_16
action_12 (53) = happyShift action_17
action_12 (54) = happyShift action_18
action_12 (55) = happyShift action_19
action_12 (56) = happyShift action_20
action_12 (59) = happyShift action_21
action_12 (5) = happyGoto action_29
action_12 (13) = happyGoto action_8
action_12 (17) = happyGoto action_9
action_12 (21) = happyGoto action_10
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (22) = happyShift action_4
action_13 (26) = happyShift action_5
action_13 (32) = happyShift action_28
action_13 (6) = happyGoto action_26
action_13 (7) = happyGoto action_3
action_13 (16) = happyGoto action_27
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (23) = happyShift action_11
action_14 (28) = happyShift action_12
action_14 (31) = happyShift action_13
action_14 (33) = happyShift action_14
action_14 (38) = happyShift action_15
action_14 (39) = happyShift action_16
action_14 (53) = happyShift action_17
action_14 (54) = happyShift action_18
action_14 (55) = happyShift action_19
action_14 (56) = happyShift action_20
action_14 (59) = happyShift action_21
action_14 (5) = happyGoto action_25
action_14 (13) = happyGoto action_8
action_14 (17) = happyGoto action_9
action_14 (21) = happyGoto action_10
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_11
action_15 (28) = happyShift action_12
action_15 (31) = happyShift action_13
action_15 (33) = happyShift action_14
action_15 (38) = happyShift action_15
action_15 (39) = happyShift action_16
action_15 (53) = happyShift action_17
action_15 (54) = happyShift action_18
action_15 (55) = happyShift action_19
action_15 (56) = happyShift action_20
action_15 (59) = happyShift action_21
action_15 (5) = happyGoto action_24
action_15 (13) = happyGoto action_8
action_15 (17) = happyGoto action_9
action_15 (21) = happyGoto action_10
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_11
action_16 (28) = happyShift action_12
action_16 (31) = happyShift action_13
action_16 (33) = happyShift action_14
action_16 (38) = happyShift action_15
action_16 (39) = happyShift action_16
action_16 (53) = happyShift action_17
action_16 (54) = happyShift action_18
action_16 (55) = happyShift action_19
action_16 (56) = happyShift action_20
action_16 (59) = happyShift action_21
action_16 (5) = happyGoto action_23
action_16 (13) = happyGoto action_8
action_16 (17) = happyGoto action_9
action_16 (21) = happyGoto action_10
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_55

action_18 _ = happyReduce_56

action_19 _ = happyReduce_22

action_20 _ = happyReduce_54

action_21 (23) = happyShift action_11
action_21 (28) = happyShift action_12
action_21 (31) = happyShift action_13
action_21 (33) = happyShift action_14
action_21 (38) = happyShift action_15
action_21 (39) = happyShift action_16
action_21 (53) = happyShift action_17
action_21 (54) = happyShift action_18
action_21 (55) = happyShift action_19
action_21 (56) = happyShift action_20
action_21 (59) = happyShift action_21
action_21 (5) = happyGoto action_22
action_21 (13) = happyGoto action_8
action_21 (17) = happyGoto action_9
action_21 (21) = happyGoto action_10
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (40) = happyShift action_31
action_22 (41) = happyShift action_32
action_22 (42) = happyShift action_33
action_22 (43) = happyShift action_34
action_22 (44) = happyShift action_35
action_22 (45) = happyShift action_36
action_22 (46) = happyShift action_37
action_22 (47) = happyShift action_38
action_22 (48) = happyShift action_39
action_22 (49) = happyShift action_40
action_22 (50) = happyShift action_41
action_22 (51) = happyShift action_42
action_22 (52) = happyShift action_43
action_22 (60) = happyShift action_69
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_7

action_24 _ = happyReduce_6

action_25 (34) = happyShift action_68
action_25 (40) = happyShift action_31
action_25 (41) = happyShift action_32
action_25 (42) = happyShift action_33
action_25 (43) = happyShift action_34
action_25 (44) = happyShift action_35
action_25 (45) = happyShift action_36
action_25 (46) = happyShift action_37
action_25 (47) = happyShift action_38
action_25 (48) = happyShift action_39
action_25 (49) = happyShift action_40
action_25 (50) = happyShift action_41
action_25 (51) = happyShift action_42
action_25 (52) = happyShift action_43
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_44

action_27 (25) = happyShift action_66
action_27 (32) = happyShift action_67
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (23) = happyShift action_11
action_28 (28) = happyShift action_12
action_28 (31) = happyShift action_13
action_28 (33) = happyShift action_14
action_28 (38) = happyShift action_15
action_28 (39) = happyShift action_16
action_28 (53) = happyShift action_17
action_28 (54) = happyShift action_18
action_28 (55) = happyShift action_19
action_28 (56) = happyShift action_20
action_28 (59) = happyShift action_21
action_28 (5) = happyGoto action_65
action_28 (13) = happyGoto action_8
action_28 (17) = happyGoto action_9
action_28 (21) = happyGoto action_10
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (29) = happyShift action_63
action_29 (30) = happyShift action_64
action_29 (40) = happyShift action_31
action_29 (41) = happyShift action_32
action_29 (42) = happyShift action_33
action_29 (43) = happyShift action_34
action_29 (44) = happyShift action_35
action_29 (45) = happyShift action_36
action_29 (46) = happyShift action_37
action_29 (47) = happyShift action_38
action_29 (48) = happyShift action_39
action_29 (49) = happyShift action_40
action_29 (50) = happyShift action_41
action_29 (51) = happyShift action_42
action_29 (52) = happyShift action_43
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (24) = happyShift action_62
action_30 _ = happyReduce_40

action_31 (23) = happyShift action_11
action_31 (28) = happyShift action_12
action_31 (31) = happyShift action_13
action_31 (33) = happyShift action_14
action_31 (38) = happyShift action_15
action_31 (39) = happyShift action_16
action_31 (53) = happyShift action_17
action_31 (54) = happyShift action_18
action_31 (55) = happyShift action_19
action_31 (56) = happyShift action_20
action_31 (59) = happyShift action_21
action_31 (5) = happyGoto action_61
action_31 (13) = happyGoto action_8
action_31 (17) = happyGoto action_9
action_31 (21) = happyGoto action_10
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (23) = happyShift action_11
action_32 (28) = happyShift action_12
action_32 (31) = happyShift action_13
action_32 (33) = happyShift action_14
action_32 (38) = happyShift action_15
action_32 (39) = happyShift action_16
action_32 (53) = happyShift action_17
action_32 (54) = happyShift action_18
action_32 (55) = happyShift action_19
action_32 (56) = happyShift action_20
action_32 (59) = happyShift action_21
action_32 (5) = happyGoto action_60
action_32 (13) = happyGoto action_8
action_32 (17) = happyGoto action_9
action_32 (21) = happyGoto action_10
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (23) = happyShift action_11
action_33 (28) = happyShift action_12
action_33 (31) = happyShift action_13
action_33 (33) = happyShift action_14
action_33 (38) = happyShift action_15
action_33 (39) = happyShift action_16
action_33 (53) = happyShift action_17
action_33 (54) = happyShift action_18
action_33 (55) = happyShift action_19
action_33 (56) = happyShift action_20
action_33 (59) = happyShift action_21
action_33 (5) = happyGoto action_59
action_33 (13) = happyGoto action_8
action_33 (17) = happyGoto action_9
action_33 (21) = happyGoto action_10
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (23) = happyShift action_11
action_34 (28) = happyShift action_12
action_34 (31) = happyShift action_13
action_34 (33) = happyShift action_14
action_34 (38) = happyShift action_15
action_34 (39) = happyShift action_16
action_34 (53) = happyShift action_17
action_34 (54) = happyShift action_18
action_34 (55) = happyShift action_19
action_34 (56) = happyShift action_20
action_34 (59) = happyShift action_21
action_34 (5) = happyGoto action_58
action_34 (13) = happyGoto action_8
action_34 (17) = happyGoto action_9
action_34 (21) = happyGoto action_10
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (23) = happyShift action_11
action_35 (28) = happyShift action_12
action_35 (31) = happyShift action_13
action_35 (33) = happyShift action_14
action_35 (38) = happyShift action_15
action_35 (39) = happyShift action_16
action_35 (53) = happyShift action_17
action_35 (54) = happyShift action_18
action_35 (55) = happyShift action_19
action_35 (56) = happyShift action_20
action_35 (59) = happyShift action_21
action_35 (5) = happyGoto action_57
action_35 (13) = happyGoto action_8
action_35 (17) = happyGoto action_9
action_35 (21) = happyGoto action_10
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (23) = happyShift action_11
action_36 (28) = happyShift action_12
action_36 (31) = happyShift action_13
action_36 (33) = happyShift action_14
action_36 (38) = happyShift action_15
action_36 (39) = happyShift action_16
action_36 (53) = happyShift action_17
action_36 (54) = happyShift action_18
action_36 (55) = happyShift action_19
action_36 (56) = happyShift action_20
action_36 (59) = happyShift action_21
action_36 (5) = happyGoto action_56
action_36 (13) = happyGoto action_8
action_36 (17) = happyGoto action_9
action_36 (21) = happyGoto action_10
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (23) = happyShift action_11
action_37 (28) = happyShift action_12
action_37 (31) = happyShift action_13
action_37 (33) = happyShift action_14
action_37 (38) = happyShift action_15
action_37 (39) = happyShift action_16
action_37 (53) = happyShift action_17
action_37 (54) = happyShift action_18
action_37 (55) = happyShift action_19
action_37 (56) = happyShift action_20
action_37 (59) = happyShift action_21
action_37 (5) = happyGoto action_55
action_37 (13) = happyGoto action_8
action_37 (17) = happyGoto action_9
action_37 (21) = happyGoto action_10
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (23) = happyShift action_11
action_38 (28) = happyShift action_12
action_38 (31) = happyShift action_13
action_38 (33) = happyShift action_14
action_38 (38) = happyShift action_15
action_38 (39) = happyShift action_16
action_38 (53) = happyShift action_17
action_38 (54) = happyShift action_18
action_38 (55) = happyShift action_19
action_38 (56) = happyShift action_20
action_38 (59) = happyShift action_21
action_38 (5) = happyGoto action_54
action_38 (13) = happyGoto action_8
action_38 (17) = happyGoto action_9
action_38 (21) = happyGoto action_10
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (23) = happyShift action_11
action_39 (28) = happyShift action_12
action_39 (31) = happyShift action_13
action_39 (33) = happyShift action_14
action_39 (38) = happyShift action_15
action_39 (39) = happyShift action_16
action_39 (53) = happyShift action_17
action_39 (54) = happyShift action_18
action_39 (55) = happyShift action_19
action_39 (56) = happyShift action_20
action_39 (59) = happyShift action_21
action_39 (5) = happyGoto action_53
action_39 (13) = happyGoto action_8
action_39 (17) = happyGoto action_9
action_39 (21) = happyGoto action_10
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (23) = happyShift action_11
action_40 (28) = happyShift action_12
action_40 (31) = happyShift action_13
action_40 (33) = happyShift action_14
action_40 (38) = happyShift action_15
action_40 (39) = happyShift action_16
action_40 (53) = happyShift action_17
action_40 (54) = happyShift action_18
action_40 (55) = happyShift action_19
action_40 (56) = happyShift action_20
action_40 (59) = happyShift action_21
action_40 (5) = happyGoto action_52
action_40 (13) = happyGoto action_8
action_40 (17) = happyGoto action_9
action_40 (21) = happyGoto action_10
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (23) = happyShift action_11
action_41 (28) = happyShift action_12
action_41 (31) = happyShift action_13
action_41 (33) = happyShift action_14
action_41 (38) = happyShift action_15
action_41 (39) = happyShift action_16
action_41 (53) = happyShift action_17
action_41 (54) = happyShift action_18
action_41 (55) = happyShift action_19
action_41 (56) = happyShift action_20
action_41 (59) = happyShift action_21
action_41 (5) = happyGoto action_51
action_41 (13) = happyGoto action_8
action_41 (17) = happyGoto action_9
action_41 (21) = happyGoto action_10
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (23) = happyShift action_11
action_42 (28) = happyShift action_12
action_42 (31) = happyShift action_13
action_42 (33) = happyShift action_14
action_42 (38) = happyShift action_15
action_42 (39) = happyShift action_16
action_42 (53) = happyShift action_17
action_42 (54) = happyShift action_18
action_42 (55) = happyShift action_19
action_42 (56) = happyShift action_20
action_42 (59) = happyShift action_21
action_42 (5) = happyGoto action_50
action_42 (13) = happyGoto action_8
action_42 (17) = happyGoto action_9
action_42 (21) = happyGoto action_10
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (23) = happyShift action_11
action_43 (28) = happyShift action_12
action_43 (31) = happyShift action_13
action_43 (33) = happyShift action_14
action_43 (38) = happyShift action_15
action_43 (39) = happyShift action_16
action_43 (53) = happyShift action_17
action_43 (54) = happyShift action_18
action_43 (55) = happyShift action_19
action_43 (56) = happyShift action_20
action_43 (59) = happyShift action_21
action_43 (5) = happyGoto action_49
action_43 (13) = happyGoto action_8
action_43 (17) = happyGoto action_9
action_43 (21) = happyGoto action_10
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (27) = happyShift action_48
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (24) = happyShift action_47
action_45 (8) = happyGoto action_46
action_45 _ = happyReduce_29

action_46 (37) = happyShift action_89
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (28) = happyShift action_85
action_47 (55) = happyShift action_86
action_47 (57) = happyShift action_87
action_47 (58) = happyShift action_88
action_47 (9) = happyGoto action_81
action_47 (10) = happyGoto action_82
action_47 (11) = happyGoto action_83
action_47 (12) = happyGoto action_84
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (23) = happyShift action_11
action_48 (28) = happyShift action_12
action_48 (31) = happyShift action_13
action_48 (33) = happyShift action_14
action_48 (38) = happyShift action_15
action_48 (39) = happyShift action_16
action_48 (53) = happyShift action_17
action_48 (54) = happyShift action_18
action_48 (55) = happyShift action_19
action_48 (56) = happyShift action_20
action_48 (59) = happyShift action_21
action_48 (5) = happyGoto action_80
action_48 (13) = happyGoto action_8
action_48 (17) = happyGoto action_9
action_48 (21) = happyGoto action_10
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (40) = happyShift action_31
action_49 (41) = happyShift action_32
action_49 (42) = happyShift action_33
action_49 (43) = happyShift action_34
action_49 (44) = happyShift action_35
action_49 (45) = happyShift action_36
action_49 (46) = happyShift action_37
action_49 (47) = happyShift action_38
action_49 (48) = happyShift action_39
action_49 (49) = happyShift action_40
action_49 (50) = happyShift action_41
action_49 (51) = happyShift action_42
action_49 (52) = happyShift action_43
action_49 _ = happyReduce_20

action_50 (40) = happyShift action_31
action_50 (41) = happyShift action_32
action_50 (42) = happyShift action_33
action_50 (43) = happyShift action_34
action_50 (44) = happyShift action_35
action_50 (45) = happyShift action_36
action_50 (46) = happyShift action_37
action_50 (47) = happyShift action_38
action_50 (48) = happyShift action_39
action_50 (49) = happyShift action_40
action_50 (50) = happyShift action_41
action_50 (51) = happyShift action_42
action_50 _ = happyReduce_19

action_51 (40) = happyShift action_31
action_51 (41) = happyShift action_32
action_51 (42) = happyShift action_33
action_51 (43) = happyShift action_34
action_51 (44) = happyShift action_35
action_51 (45) = happyFail []
action_51 (46) = happyFail []
action_51 (47) = happyFail []
action_51 (48) = happyFail []
action_51 (49) = happyFail []
action_51 (50) = happyFail []
action_51 _ = happyReduce_18

action_52 (40) = happyShift action_31
action_52 (41) = happyShift action_32
action_52 (42) = happyShift action_33
action_52 (43) = happyShift action_34
action_52 (44) = happyShift action_35
action_52 (45) = happyFail []
action_52 (46) = happyFail []
action_52 (47) = happyFail []
action_52 (48) = happyFail []
action_52 (49) = happyFail []
action_52 (50) = happyFail []
action_52 _ = happyReduce_17

action_53 (40) = happyShift action_31
action_53 (41) = happyShift action_32
action_53 (42) = happyShift action_33
action_53 (43) = happyShift action_34
action_53 (44) = happyShift action_35
action_53 (45) = happyFail []
action_53 (46) = happyFail []
action_53 (47) = happyFail []
action_53 (48) = happyFail []
action_53 (49) = happyFail []
action_53 (50) = happyFail []
action_53 _ = happyReduce_16

action_54 (40) = happyShift action_31
action_54 (41) = happyShift action_32
action_54 (42) = happyShift action_33
action_54 (43) = happyShift action_34
action_54 (44) = happyShift action_35
action_54 (45) = happyFail []
action_54 (46) = happyFail []
action_54 (47) = happyFail []
action_54 (48) = happyFail []
action_54 (49) = happyFail []
action_54 (50) = happyFail []
action_54 _ = happyReduce_15

action_55 (40) = happyShift action_31
action_55 (41) = happyShift action_32
action_55 (42) = happyShift action_33
action_55 (43) = happyShift action_34
action_55 (44) = happyShift action_35
action_55 (45) = happyFail []
action_55 (46) = happyFail []
action_55 (47) = happyFail []
action_55 (48) = happyFail []
action_55 (49) = happyFail []
action_55 (50) = happyFail []
action_55 _ = happyReduce_14

action_56 (40) = happyShift action_31
action_56 (41) = happyShift action_32
action_56 (42) = happyShift action_33
action_56 (43) = happyShift action_34
action_56 (44) = happyShift action_35
action_56 (45) = happyFail []
action_56 (46) = happyFail []
action_56 (47) = happyFail []
action_56 (48) = happyFail []
action_56 (49) = happyFail []
action_56 (50) = happyFail []
action_56 _ = happyReduce_13

action_57 _ = happyReduce_10

action_58 _ = happyReduce_9

action_59 _ = happyReduce_8

action_60 (42) = happyShift action_33
action_60 (43) = happyShift action_34
action_60 (44) = happyShift action_35
action_60 _ = happyReduce_12

action_61 (42) = happyShift action_33
action_61 (43) = happyShift action_34
action_61 (44) = happyShift action_35
action_61 _ = happyReduce_11

action_62 (23) = happyShift action_11
action_62 (28) = happyShift action_12
action_62 (31) = happyShift action_13
action_62 (33) = happyShift action_14
action_62 (38) = happyShift action_15
action_62 (39) = happyShift action_16
action_62 (53) = happyShift action_17
action_62 (54) = happyShift action_18
action_62 (55) = happyShift action_19
action_62 (56) = happyShift action_20
action_62 (59) = happyShift action_21
action_62 (5) = happyGoto action_77
action_62 (13) = happyGoto action_8
action_62 (14) = happyGoto action_78
action_62 (15) = happyGoto action_79
action_62 (17) = happyGoto action_9
action_62 (21) = happyGoto action_10
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_25

action_64 (23) = happyShift action_11
action_64 (28) = happyShift action_12
action_64 (31) = happyShift action_13
action_64 (33) = happyShift action_14
action_64 (38) = happyShift action_15
action_64 (39) = happyShift action_16
action_64 (53) = happyShift action_17
action_64 (54) = happyShift action_18
action_64 (55) = happyShift action_19
action_64 (56) = happyShift action_20
action_64 (59) = happyShift action_21
action_64 (5) = happyGoto action_76
action_64 (13) = happyGoto action_8
action_64 (17) = happyGoto action_9
action_64 (21) = happyGoto action_10
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (40) = happyShift action_31
action_65 (41) = happyShift action_32
action_65 (42) = happyShift action_33
action_65 (43) = happyShift action_34
action_65 (44) = happyShift action_35
action_65 (45) = happyShift action_36
action_65 (46) = happyShift action_37
action_65 (47) = happyShift action_38
action_65 (48) = happyShift action_39
action_65 (49) = happyShift action_40
action_65 (50) = happyShift action_41
action_65 (51) = happyShift action_42
action_65 (52) = happyShift action_43
action_65 _ = happyReduce_4

action_66 (22) = happyShift action_4
action_66 (26) = happyShift action_5
action_66 (6) = happyGoto action_75
action_66 (7) = happyGoto action_3
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (23) = happyShift action_11
action_67 (28) = happyShift action_12
action_67 (31) = happyShift action_13
action_67 (33) = happyShift action_14
action_67 (38) = happyShift action_15
action_67 (39) = happyShift action_16
action_67 (53) = happyShift action_17
action_67 (54) = happyShift action_18
action_67 (55) = happyShift action_19
action_67 (56) = happyShift action_20
action_67 (59) = happyShift action_21
action_67 (5) = happyGoto action_74
action_67 (13) = happyGoto action_8
action_67 (17) = happyGoto action_9
action_67 (21) = happyGoto action_10
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (35) = happyShift action_73
action_68 (18) = happyGoto action_71
action_68 (19) = happyGoto action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (23) = happyShift action_11
action_69 (28) = happyShift action_12
action_69 (31) = happyShift action_13
action_69 (33) = happyShift action_14
action_69 (38) = happyShift action_15
action_69 (39) = happyShift action_16
action_69 (53) = happyShift action_17
action_69 (54) = happyShift action_18
action_69 (55) = happyShift action_19
action_69 (56) = happyShift action_20
action_69 (59) = happyShift action_21
action_69 (5) = happyGoto action_70
action_69 (13) = happyGoto action_8
action_69 (17) = happyGoto action_9
action_69 (21) = happyGoto action_10
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (40) = happyShift action_31
action_70 (41) = happyShift action_32
action_70 (42) = happyShift action_33
action_70 (43) = happyShift action_34
action_70 (44) = happyShift action_35
action_70 (45) = happyShift action_36
action_70 (46) = happyShift action_37
action_70 (47) = happyShift action_38
action_70 (48) = happyShift action_39
action_70 (49) = happyShift action_40
action_70 (50) = happyShift action_41
action_70 (51) = happyShift action_42
action_70 (52) = happyShift action_43
action_70 (61) = happyShift action_103
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_5

action_72 (35) = happyShift action_73
action_72 (18) = happyGoto action_102
action_72 (19) = happyGoto action_72
action_72 _ = happyReduce_47

action_73 (28) = happyShift action_99
action_73 (36) = happyShift action_100
action_73 (53) = happyShift action_17
action_73 (54) = happyShift action_18
action_73 (55) = happyShift action_101
action_73 (56) = happyShift action_20
action_73 (20) = happyGoto action_97
action_73 (21) = happyGoto action_98
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (40) = happyShift action_31
action_74 (41) = happyShift action_32
action_74 (42) = happyShift action_33
action_74 (43) = happyShift action_34
action_74 (44) = happyShift action_35
action_74 (45) = happyShift action_36
action_74 (46) = happyShift action_37
action_74 (47) = happyShift action_38
action_74 (48) = happyShift action_39
action_74 (49) = happyShift action_40
action_74 (50) = happyShift action_41
action_74 (51) = happyShift action_42
action_74 (52) = happyShift action_43
action_74 _ = happyReduce_3

action_75 _ = happyReduce_45

action_76 (29) = happyShift action_96
action_76 (40) = happyShift action_31
action_76 (41) = happyShift action_32
action_76 (42) = happyShift action_33
action_76 (43) = happyShift action_34
action_76 (44) = happyShift action_35
action_76 (45) = happyShift action_36
action_76 (46) = happyShift action_37
action_76 (47) = happyShift action_38
action_76 (48) = happyShift action_39
action_76 (49) = happyShift action_40
action_76 (50) = happyShift action_41
action_76 (51) = happyShift action_42
action_76 (52) = happyShift action_43
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (40) = happyShift action_31
action_77 (41) = happyShift action_32
action_77 (42) = happyShift action_33
action_77 (43) = happyShift action_34
action_77 (44) = happyShift action_35
action_77 (45) = happyShift action_36
action_77 (46) = happyShift action_37
action_77 (47) = happyShift action_38
action_77 (48) = happyShift action_39
action_77 (49) = happyShift action_40
action_77 (50) = happyShift action_41
action_77 (51) = happyShift action_42
action_77 (52) = happyShift action_43
action_77 _ = happyReduce_43

action_78 (25) = happyShift action_95
action_78 _ = happyReduce_39

action_79 _ = happyReduce_41

action_80 (40) = happyShift action_31
action_80 (41) = happyShift action_32
action_80 (42) = happyShift action_33
action_80 (43) = happyShift action_34
action_80 (44) = happyShift action_35
action_80 (45) = happyShift action_36
action_80 (46) = happyShift action_37
action_80 (47) = happyShift action_38
action_80 (48) = happyShift action_39
action_80 (49) = happyShift action_40
action_80 (50) = happyShift action_41
action_80 (51) = happyShift action_42
action_80 (52) = happyShift action_43
action_80 _ = happyReduce_27

action_81 (25) = happyShift action_94
action_81 _ = happyReduce_30

action_82 _ = happyReduce_31

action_83 (55) = happyShift action_93
action_83 _ = happyFail (happyExpListPerState 83)

action_84 _ = happyReduce_37

action_85 (28) = happyShift action_85
action_85 (57) = happyShift action_87
action_85 (58) = happyShift action_88
action_85 (11) = happyGoto action_92
action_85 (12) = happyGoto action_84
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (28) = happyShift action_91
action_86 _ = happyFail (happyExpListPerState 86)

action_87 _ = happyReduce_35

action_88 _ = happyReduce_36

action_89 (23) = happyShift action_11
action_89 (28) = happyShift action_12
action_89 (31) = happyShift action_13
action_89 (33) = happyShift action_14
action_89 (38) = happyShift action_15
action_89 (39) = happyShift action_16
action_89 (53) = happyShift action_17
action_89 (54) = happyShift action_18
action_89 (55) = happyShift action_19
action_89 (56) = happyShift action_20
action_89 (59) = happyShift action_21
action_89 (5) = happyGoto action_90
action_89 (13) = happyGoto action_8
action_89 (17) = happyGoto action_9
action_89 (21) = happyGoto action_10
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (40) = happyShift action_31
action_90 (41) = happyShift action_32
action_90 (42) = happyShift action_33
action_90 (43) = happyShift action_34
action_90 (44) = happyShift action_35
action_90 (45) = happyShift action_36
action_90 (46) = happyShift action_37
action_90 (47) = happyShift action_38
action_90 (48) = happyShift action_39
action_90 (49) = happyShift action_40
action_90 (50) = happyShift action_41
action_90 (51) = happyShift action_42
action_90 (52) = happyShift action_43
action_90 _ = happyReduce_28

action_91 (28) = happyShift action_85
action_91 (55) = happyShift action_86
action_91 (57) = happyShift action_87
action_91 (58) = happyShift action_88
action_91 (10) = happyGoto action_114
action_91 (11) = happyGoto action_83
action_91 (12) = happyGoto action_84
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (30) = happyShift action_113
action_92 _ = happyFail (happyExpListPerState 92)

action_93 _ = happyReduce_33

action_94 (28) = happyShift action_85
action_94 (55) = happyShift action_86
action_94 (57) = happyShift action_87
action_94 (58) = happyShift action_88
action_94 (10) = happyGoto action_112
action_94 (11) = happyGoto action_83
action_94 (12) = happyGoto action_84
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (23) = happyShift action_11
action_95 (28) = happyShift action_12
action_95 (31) = happyShift action_13
action_95 (33) = happyShift action_14
action_95 (38) = happyShift action_15
action_95 (39) = happyShift action_16
action_95 (53) = happyShift action_17
action_95 (54) = happyShift action_18
action_95 (55) = happyShift action_19
action_95 (56) = happyShift action_20
action_95 (59) = happyShift action_21
action_95 (5) = happyGoto action_77
action_95 (13) = happyGoto action_8
action_95 (15) = happyGoto action_111
action_95 (17) = happyGoto action_9
action_95 (21) = happyGoto action_10
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_57

action_97 (37) = happyShift action_110
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_53

action_99 (23) = happyShift action_11
action_99 (28) = happyShift action_108
action_99 (31) = happyShift action_13
action_99 (33) = happyShift action_14
action_99 (36) = happyShift action_100
action_99 (38) = happyShift action_15
action_99 (39) = happyShift action_16
action_99 (53) = happyShift action_17
action_99 (54) = happyShift action_18
action_99 (55) = happyShift action_109
action_99 (56) = happyShift action_20
action_99 (59) = happyShift action_21
action_99 (5) = happyGoto action_105
action_99 (13) = happyGoto action_8
action_99 (17) = happyGoto action_9
action_99 (20) = happyGoto action_106
action_99 (21) = happyGoto action_107
action_99 _ = happyFail (happyExpListPerState 99)

action_100 _ = happyReduce_50

action_101 _ = happyReduce_51

action_102 _ = happyReduce_48

action_103 (23) = happyShift action_11
action_103 (28) = happyShift action_12
action_103 (31) = happyShift action_13
action_103 (33) = happyShift action_14
action_103 (38) = happyShift action_15
action_103 (39) = happyShift action_16
action_103 (53) = happyShift action_17
action_103 (54) = happyShift action_18
action_103 (55) = happyShift action_19
action_103 (56) = happyShift action_20
action_103 (59) = happyShift action_21
action_103 (5) = happyGoto action_104
action_103 (13) = happyGoto action_8
action_103 (17) = happyGoto action_9
action_103 (21) = happyGoto action_10
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (40) = happyShift action_31
action_104 (41) = happyShift action_32
action_104 (42) = happyShift action_33
action_104 (43) = happyShift action_34
action_104 (44) = happyShift action_35
action_104 (45) = happyShift action_36
action_104 (46) = happyShift action_37
action_104 (47) = happyShift action_38
action_104 (48) = happyShift action_39
action_104 (49) = happyShift action_40
action_104 (50) = happyShift action_41
action_104 (51) = happyShift action_42
action_104 (52) = happyShift action_43
action_104 _ = happyReduce_46

action_105 (30) = happyShift action_64
action_105 (40) = happyShift action_31
action_105 (41) = happyShift action_32
action_105 (42) = happyShift action_33
action_105 (43) = happyShift action_34
action_105 (44) = happyShift action_35
action_105 (45) = happyShift action_36
action_105 (46) = happyShift action_37
action_105 (47) = happyShift action_38
action_105 (48) = happyShift action_39
action_105 (49) = happyShift action_40
action_105 (50) = happyShift action_41
action_105 (51) = happyShift action_42
action_105 (52) = happyShift action_43
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (30) = happyShift action_118
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (30) = happyReduce_53
action_107 _ = happyReduce_21

action_108 (23) = happyShift action_11
action_108 (28) = happyShift action_108
action_108 (31) = happyShift action_13
action_108 (33) = happyShift action_14
action_108 (36) = happyShift action_100
action_108 (38) = happyShift action_15
action_108 (39) = happyShift action_16
action_108 (53) = happyShift action_17
action_108 (54) = happyShift action_18
action_108 (55) = happyShift action_109
action_108 (56) = happyShift action_20
action_108 (59) = happyShift action_21
action_108 (5) = happyGoto action_29
action_108 (13) = happyGoto action_8
action_108 (17) = happyGoto action_9
action_108 (20) = happyGoto action_106
action_108 (21) = happyGoto action_107
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (30) = happyReduce_51
action_109 _ = happyReduce_22

action_110 (23) = happyShift action_11
action_110 (28) = happyShift action_12
action_110 (31) = happyShift action_13
action_110 (33) = happyShift action_14
action_110 (38) = happyShift action_15
action_110 (39) = happyShift action_16
action_110 (53) = happyShift action_17
action_110 (54) = happyShift action_18
action_110 (55) = happyShift action_19
action_110 (56) = happyShift action_20
action_110 (59) = happyShift action_21
action_110 (5) = happyGoto action_117
action_110 (13) = happyGoto action_8
action_110 (17) = happyGoto action_9
action_110 (21) = happyGoto action_10
action_110 _ = happyFail (happyExpListPerState 110)

action_111 _ = happyReduce_42

action_112 _ = happyReduce_32

action_113 (28) = happyShift action_85
action_113 (57) = happyShift action_87
action_113 (58) = happyShift action_88
action_113 (11) = happyGoto action_116
action_113 (12) = happyGoto action_84
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (30) = happyShift action_115
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (28) = happyShift action_85
action_115 (55) = happyShift action_86
action_115 (57) = happyShift action_87
action_115 (58) = happyShift action_88
action_115 (10) = happyGoto action_121
action_115 (11) = happyGoto action_83
action_115 (12) = happyGoto action_84
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (29) = happyShift action_120
action_116 _ = happyFail (happyExpListPerState 116)

action_117 (40) = happyShift action_31
action_117 (41) = happyShift action_32
action_117 (42) = happyShift action_33
action_117 (43) = happyShift action_34
action_117 (44) = happyShift action_35
action_117 (45) = happyShift action_36
action_117 (46) = happyShift action_37
action_117 (47) = happyShift action_38
action_117 (48) = happyShift action_39
action_117 (49) = happyShift action_40
action_117 (50) = happyShift action_41
action_117 (51) = happyShift action_42
action_117 (52) = happyShift action_43
action_117 _ = happyReduce_49

action_118 (28) = happyShift action_99
action_118 (36) = happyShift action_100
action_118 (53) = happyShift action_17
action_118 (54) = happyShift action_18
action_118 (55) = happyShift action_101
action_118 (56) = happyShift action_20
action_118 (20) = happyGoto action_119
action_118 (21) = happyGoto action_98
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (29) = happyShift action_123
action_119 _ = happyFail (happyExpListPerState 119)

action_120 _ = happyReduce_38

action_121 (29) = happyShift action_122
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_34

action_123 _ = happyReduce_52

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
	_
	 =  HappyAbsSyn5
		 (EUnary (Operator Arithmetic "-") happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (EUnary (Operator Logical "!") happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Arithmetic "*") happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Arithmetic "/") happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  5 happyReduction_10
happyReduction_10 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Arithmetic "%") happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  5 happyReduction_11
happyReduction_11 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Arithmetic "+") happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Arithmetic "-") happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  5 happyReduction_13
happyReduction_13 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Relational "<") happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  5 happyReduction_14
happyReduction_14 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Relational ">") happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  5 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Relational "<=") happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  5 happyReduction_16
happyReduction_16 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Relational ">=") happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  5 happyReduction_17
happyReduction_17 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Comparison "==") happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  5 happyReduction_18
happyReduction_18 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Comparison "!=") happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  5 happyReduction_19
happyReduction_19 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Logical "&&") happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  5 happyReduction_20
happyReduction_20 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (EBinary (Operator Logical "||") happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  5 happyReduction_21
happyReduction_21 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn5
		 (EValue happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  5 happyReduction_22
happyReduction_22 (HappyTerminal (TokenPosn (Name happy_var_1) _ _))
	 =  HappyAbsSyn5
		 (EVar happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  5 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  5 happyReduction_24
happyReduction_24 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  5 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  6 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 6 happyReduction_27
happyReduction_27 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Definition happy_var_2 [] happy_var_4
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 5 7 happyReduction_28
happyReduction_28 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Definition happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_0  8 happyReduction_29
happyReduction_29  =  HappyAbsSyn8
		 ([]
	)

happyReduce_30 = happySpecReduce_2  8 happyReduction_30
happyReduction_30 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  9 happyReduction_31
happyReduction_31 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  9 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_3:happy_var_1
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  10 happyReduction_33
happyReduction_33 (HappyTerminal (TokenPosn (Name happy_var_2) _ _))
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Arg happy_var_1 happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happyReduce 6 10 happyReduction_34
happyReduction_34 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_1) _ _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Arg (TTuple happy_var_3 happy_var_5) happy_var_1
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  11 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn11
		 (TInteger
	)

happyReduce_36 = happySpecReduce_1  11 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn11
		 (TBool
	)

happyReduce_37 = happySpecReduce_1  11 happyReduction_37
happyReduction_37 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 5 12 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (TTuple (Arg happy_var_2 "") (Arg happy_var_4 "")
	) `HappyStk` happyRest

happyReduce_39 = happyReduce 4 13 happyReduction_39
happyReduction_39 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenPosn (Name happy_var_2) _ _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (EApp happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_2  13 happyReduction_40
happyReduction_40 (HappyTerminal (TokenPosn (Name happy_var_2) _ _))
	_
	 =  HappyAbsSyn13
		 (EApp happy_var_2 []
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  14 happyReduction_42
happyReduction_42 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3:happy_var_1
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  15 happyReduction_43
happyReduction_43 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  16 happyReduction_44
happyReduction_44 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  16 happyReduction_45
happyReduction_45 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_3:happy_var_1
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happyReduce 6 17 happyReduction_46
happyReduction_46 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_1  18 happyReduction_47
happyReduction_47 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  18 happyReduction_48
happyReduction_48 (HappyAbsSyn18  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1:happy_var_2
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happyReduce 4 19 happyReduction_49
happyReduction_49 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 ((happy_var_2,happy_var_4)
	) `HappyStk` happyRest

happyReduce_50 = happySpecReduce_1  20 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn20
		 (PAny
	)

happyReduce_51 = happySpecReduce_1  20 happyReduction_51
happyReduction_51 (HappyTerminal (TokenPosn (Name happy_var_1) _ _))
	 =  HappyAbsSyn20
		 (PVar happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happyReduce 5 20 happyReduction_52
happyReduction_52 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (PTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (PValue happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  21 happyReduction_54
happyReduction_54 (HappyTerminal (TokenPosn (Integer happy_var_1) _ _))
	 =  HappyAbsSyn21
		 (VInteger happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  21 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn21
		 (VBool True
	)

happyReduce_56 = happySpecReduce_1  21 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn21
		 (VBool False
	)

happyReduce_57 = happyReduce 5 21 happyReduction_57
happyReduction_57 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (VTuple happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 62 62 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenPosn Behold _ _ -> cont 22;
	TokenPosn Summon _ _ -> cont 23;
	TokenPosn With _ _ -> cont 24;
	TokenPosn AndParam _ _ -> cont 25;
	TokenPosn This _ _ -> cont 26;
	TokenPosn Is _ _ -> cont 27;
	TokenPosn LParen _ _ -> cont 28;
	TokenPosn RParen _ _ -> cont 29;
	TokenPosn AndHisFriend _ _ -> cont 30;
	TokenPosn PutThat _ _ -> cont 31;
	TokenPosn Into _ _ -> cont 32;
	TokenPosn WhatIs _ _ -> cont 33;
	TokenPosn QuestionMark _ _ -> cont 34;
	TokenPosn Perhaps _ _ -> cont 35;
	TokenPosn WhoCares _ _ -> cont 36;
	TokenPosn WhichDoes _ _ -> cont 37;
	TokenPosn Neg _ _ -> cont 38;
	TokenPosn Not _ _ -> cont 39;
	TokenPosn Plus _ _ -> cont 40;
	TokenPosn Minus _ _ -> cont 41;
	TokenPosn Mult _ _ -> cont 42;
	TokenPosn Div _ _ -> cont 43;
	TokenPosn Mod _ _ -> cont 44;
	TokenPosn Lesser _ _ -> cont 45;
	TokenPosn Greater _ _ -> cont 46;
	TokenPosn LesserEq _ _ -> cont 47;
	TokenPosn GreaterEq _ _ -> cont 48;
	TokenPosn Eq _ _ -> cont 49;
	TokenPosn Neq _ _ -> cont 50;
	TokenPosn And _ _ -> cont 51;
	TokenPosn Or _ _ -> cont 52;
	TokenPosn Truthy _ _ -> cont 53;
	TokenPosn Falsy _ _ -> cont 54;
	TokenPosn (Name happy_dollar_dollar) _ _ -> cont 55;
	TokenPosn (Integer happy_dollar_dollar) _ _ -> cont 56;
	TokenPosn (Type "Integer") _ _ -> cont 57;
	TokenPosn (Type "Boolean") _ _ -> cont 58;
	TokenPosn Suppose _ _ -> cont 59;
	TokenPosn ThenWeCanConclude _ _ -> cont 60;
	TokenPosn RatherThan _ _ -> cont 61;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 62 tk tks = happyError' (tks, explist)
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
