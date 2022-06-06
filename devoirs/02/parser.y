{
module Parser where

import Lexer
import Language
}

%name parser
%tokentype { TokenPosn }
%error { parseError }

%token
    'behold'                { TokenPosn Behold _}
    'summon'                { TokenPosn Summon _}
    'with'                  { TokenPosn With _}
    'and'                   { TokenPosn AndParam _}
    'this'                  { TokenPosn This _}
    'is'                    { TokenPosn Is _}
    '('                     { TokenPosn LParen _}
    ')'                     { TokenPosn RParen _}
    'and his friend'        { TokenPosn AndHisFriend _}
    'put that'              { TokenPosn PutThat _}
    'into'                  { TokenPosn Into _}
    'what is'               { TokenPosn WhatIs _}
    '?'                     { TokenPosn QuestionMark _}
    'perhaps'               { TokenPosn Perhaps _}
    'who cares'             { TokenPosn WhoCares _}
    'which does'            { TokenPosn WhichDoes _}
    'neg'                   { TokenPosn Neg _}
    'not'                   { TokenPosn Not _}
    'plus'                  { TokenPosn Plus _}
    'minus'                 { TokenPosn Minus _}
    'times'                 { TokenPosn Mult _}
    'split'                 { TokenPosn Div _}
    'rest'                  { TokenPosn Mod _}
    'weaker than'           { TokenPosn Lesser _}
    'stronger than'         { TokenPosn Greater _}
    'as weak as'            { TokenPosn LesserEq _}
    'as strong as'          { TokenPosn GreaterEq _}
    'same as'               { TokenPosn Eq _}
    'different of'          { TokenPosn Neq _}
    'both'                  { TokenPosn And _}
    'either'                { TokenPosn Or _}
    'yep'                   { TokenPosn Truthy _ }
    'pasyep'                { TokenPosn Falsy _ }
    'identifier'            { TokenPosn (Name $$) _ }
    'integer'               { TokenPosn (Integer $$) _ }
    'Integer'               { TokenPosn (Type "Integer") _ }
    'Boolean'               { TokenPosn (Type "Boolean") _ }

%right 'into'
%right 'either'
%right 'both'
%nonassoc 'same as' 'different of' 'as weak as' 'weaker than' 'as strong as' 'stronger than'
%left 'plus' 'minus'
%left 'times' 'split' 'rest'
%left 'neg' 'not'

%%

Statement
    : Definition                                {Def $1}
    -- | '(' Expr ')'                              {Expr $2}
    | Expr                                      {Expr $1}

Expr
    : 'put that' LetInDefs 'into' Expr          {ELet $2 $4}
    | 'what is' Expr '?' CaseOfs                {ECaseOf $2 $4}
    | UnaryOp Expr                              {EUnary $1 $2}
    | Expr BinaryOp Expr                        {EBinary $2 $1 $3}
    | Literal                                   {EValue $1}
    | 'identifier'                              {EVar $1}
    | FunctionApp                               {$1}

Definition
    : FunctionDef                               {$1}        
    | 'this' 'identifier' 'is' Expr             {Variable $2 $4}
   
FunctionDef
    : 'behold' 'identifier' FArgs 'which does' Expr   {Function $2 $3 $5}
    | 'behold' 'identifier' 'which does' Expr   {Function $2 [] $4}
FArgs
    : 'with' Args                               {$2}
Args
    : Arg                                       {[$1]}
    | Args 'and' Arg                            {$3:$1}
Arg
    : Type 'identifier'                         {Arg $1 $2}
    | TypeTuple                                 {Arg $1 ""}
Type
    : 'Integer'                                 {TInteger}
    | 'Boolean'                                 {TBool}
    | TypeTuple                                 {$1}
TypeTuple
    : '(' Type 'and his friend' Type ')'        {TTuple $2 $4}

FunctionApp
    : 'summon' 'identifier' 'with' FunctionAppArgs       {EApp $2 $4}
    | 'summon' 'identifier'                              {EApp $2 []}
FunctionAppArgs
    : FunctionAppArg                            {[$1]}
    | FunctionAppArgs 'and' FunctionAppArg      {$3:$1}
FunctionAppArg
    : Expr                                      {$1}
    
LetInDefs
    : Definition                                {[$1]}
    | LetInDefs 'and' Definition                {$3:$1}
    
CaseOfs
    : CaseOf                                    {[$1]}
    | CaseOf CaseOfs                            {$1:$2}
CaseOf
    : 'perhaps' Pattern 'which does' Expr       {($2,$4)}
Pattern
    : 'who cares'                               {PAny}
    | 'identifier'                              {PVar $1}
    | Literal                                   {PValue $1}

Literal
    : 'integer'                                 {VInteger $1}
    | 'yep'                                     {VBool True}
    | 'pasyep'                                  {VBool False}
    | '(' Expr 'and his friend' Expr ')'        {VTuple $2 $4}

UnaryOp
    : 'neg'                                     {'-'}
    | 'not'                                     {'!'}

BinaryOp
    : 'plus'                                    {"+"}
    | 'minus'                                   {"-"}
    | 'times'                                   {"*"}
    | 'split'                                   {"/"}
    | 'rest'                                    {"%"}
    | 'weaker than'                             {"<"}
    | 'stronger than'                           {">"}
    | 'as weak as'                              {"<="}
    | 'as strong as'                            {">="}
    | 'same as'                                 {"=="}
    | 'different of'                            {"!="}
    | 'both'                                    {"&&"}
    | 'either'                                  {"||"}

{


parseError [] = error "Parse error at beginning of expression"
parseError (f:ts) = error $ "Parse error between " ++ show f ++ " and " ++ show l
    where l = last ts
}