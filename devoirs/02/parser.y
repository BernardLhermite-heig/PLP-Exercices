{
module Parser where

import Lexer
-- import Src.Language
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
    'same as'               { TokenPosn Equal _}
    'different of'          { TokenPosn Neq _}
    'both'                  { TokenPosn And _}
    'either'                { TokenPosn Or _}
    'yep'                   { TokenPosn Truthy _ }
    'pasyep'                { TokenPosn Falsy _ }
    'identifier'            { TokenPosn (Variable _) _ }
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
    : Definition                                {Def $$}
    | Expr                                      {Expr $$}

Expr
    : 'put that' LetInDefs 'into' Expr          {ELet $2 $4}
    | 'what is' Expr '?' CaseOfs                {ECaseOf $2 $4}
    | UnaryOp Expr                              {EUnary $1 $2}
    | Expr BinaryOp Expr                        {EBinary $2 $1 $3}
    | Literal                                   {EValue $$}
    | 'identifier'                              {EVar $$}
    | FunctionApp                               {$$}

Definition
    : FunctionDef                               {$$}        
    | 'this' 'identifier' 'is' Expr             {Variable $2 $4}
   
FunctionDef
    : 'behold' 'identifier' FArgs 'which does' Expr   {Function $2 $5}
    | 'behold' 'identifier' 'which does' Expr   {Function $2 $4}
FArgs
    : 'with' Args                               {$2}
Args
    : Arg                                       {[$$]}
    | Args 'and' Arg                            {$3:$1}
Arg
    : Type 'identifier'                         {Arg $1 $2}
    | TypeTuple                                 {Arg $$ ""}
Type
    : 'Integer'                                 {TInteger}
    | 'Boolean'                                 {TBool}
    | TypeTuple                                 {$$}
TypeTuple
    : '(' Arg 'and his friend' Arg ')'          {TTuple $2 $4}
VariableName: 'identifier'                      {Identifier $$}

FunctionApp
    : 'summon' 'identifier'                              {EApp $1 []}
    | 'summon' 'identifier' 'with' FunctionAppArgs       {EApp $1 $3}
FunctionAppArgs
    : FunctionAppArg                            {[$$]}
    | FunctionAppArgs 'and' FunctionAppArg      {$2:$1}
FunctionAppArg
    : Expr                                      {Expr $$}
    
LetInDefs
    : Definition                                {[$$]}
    | LetInDefs 'and' Definition                {$3:$1}
    
CaseOfs
    : CaseOf                                    {[$$]}
    | CaseOf CaseOfs                            {$2:$1}
CaseOf
    : 'perhaps' Pattern 'which does' Expr       {($2,$4)}
Pattern
    : 'who cares'                               {PAny}
    | VariableName                              {PVar $$}
    | Literal                                   {PValue $$}

Literal
    : 'integer'                                 {VInteger $$}
    | 'yep'                                     {VBool True}
    | 'pasyep'                                  {VBool False}
    | '(' Expr 'and his friend' Expr ')'        {VTuple $2 $4}

UnaryOp
    : 'neg'                                     {'-'}
    | 'not'                                     {'!'}

BinaryOp
    : 'plus'                                    {'+'}
    | 'minus'                                   {'-'}
    | 'times'                                   {'*'}
    | 'split'                                   {'/'}
    | 'rest'                                    {'%'}
    | 'weaker than'                             {'<'}
    | 'stronger than'                           {'>'}
    | 'as weak as'                              {'<='}
    | 'as strong as'                            {'>='}
    | 'same as'                                 {'=='}
    | 'different of'                            {'!='}
    | 'both'                                    {'&&'}
    | 'either'                                  {'||'}

{

parseError ts = error $ "Parse error at " ++ show ts
}