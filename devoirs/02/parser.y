{
module Parser where

import Lexer
import Language
}

%name parser
%tokentype { TokenPosn }
%error { parseError }

%token
    'behold'                { TokenPosn Behold _ _ }
    'summon'                { TokenPosn Summon _ _ }
    'with'                  { TokenPosn With _ _ }
    'and'                   { TokenPosn AndParam _ _ }
    'this'                  { TokenPosn This _ _ }
    'is'                    { TokenPosn Is _ _ }
    '('                     { TokenPosn LParen _ _ }
    ')'                     { TokenPosn RParen _ _ }
    'and his friend'        { TokenPosn AndHisFriend _ _ }
    'put that'              { TokenPosn PutThat _ _ }
    'into'                  { TokenPosn Into _ _ }
    'what is'               { TokenPosn WhatIs _ _ }
    '?'                     { TokenPosn QuestionMark _ _ }
    'perhaps'               { TokenPosn Perhaps _ _ }
    'who cares'             { TokenPosn WhoCares _ _ }
    'which does'            { TokenPosn WhichDoes _ _ }
    'neg'                   { TokenPosn Neg _ _ }
    'not'                   { TokenPosn Not _ _ }
    'plus'                  { TokenPosn Plus _ _ }
    'minus'                 { TokenPosn Minus _ _ }
    'times'                 { TokenPosn Mult _ _ }
    'split'                 { TokenPosn Div _ _ }
    'rest'                  { TokenPosn Mod _ _ }
    'weaker than'           { TokenPosn Lesser _ _ }
    'stronger than'         { TokenPosn Greater _ _ }
    'as weak as'            { TokenPosn LesserEq _ _ }
    'as strong as'          { TokenPosn GreaterEq _ _ }
    'same as'               { TokenPosn Eq _ _ }
    'different of'          { TokenPosn Neq _ _ }
    'both'                  { TokenPosn And _ _ }
    'either'                { TokenPosn Or _ _ }
    'yep'                   { TokenPosn Truthy _ _ }
    'pasyep'                { TokenPosn Falsy _ _ }
    'identifier'            { TokenPosn (Name $$) _ _ }
    'integer'               { TokenPosn (Integer $$) _ _ }
    'Integer'               { TokenPosn (Type "Integer") _ _ }
    'Boolean'               { TokenPosn (Type "Boolean") _ _ }
    'suppose'               { TokenPosn Suppose _ _ }
    'then we can conclude'  { TokenPosn ThenWeCanConclude _ _ }
    'rather than'           { TokenPosn RatherThan _ _ }

%right 'into'
%right 'either'
%right 'both'
%nonassoc 'same as' 'different of' 'as weak as' 'weaker than' 'as strong as' 'stronger than'
%left 'plus' 'minus'
%left 'times' 'split' 'rest'
%left 'neg' 'not'

%%

Statement
    : Definition                                                    {Def $1}
    | Expr                                                          {Expr $1}

Expr
    : 'put that' LetInDefs 'into' Expr                              {ELet $2 $4}
    | 'put that' 'into' Expr                                        {ELet [] $3}
    | 'what is' Expr '?' CaseOfs                                    {ECaseOf $2 $4}
    | UnaryOp Expr                                                  {EUnary $1 $2}
    | Expr BinaryOp Expr                                            {EBinary $2 $1 $3}
    | Literal                                                       {EValue $1}
    | 'identifier'                                                  {EVar $1}
    | FunctionApp                                                   {$1}
    | If                                                            {$1}
    | '(' Expr ')'                                                  {$2}

Definition
    : FunctionDef                                                   {$1}        
    | 'this' 'identifier' 'is' Expr                                 {Definition $2 [] $4}
   
FunctionDef
    : 'behold' 'identifier' FArgs 'which does' Expr                 {Definition $2 $3 $5}
FArgs
    :                                                               {[]}            
    | 'with' Args                                                   {$2}
Args
    : Arg                                                           {[$1]}
    | Args 'and' Arg                                                {$3:$1}
Arg
    : Type 'identifier'                                             {Arg $1 $2}
    | 'identifier' '(' Arg 'and his friend' Arg ')'                 {Arg (TTuple $3 $5) $1}
Type
    : 'Integer'                                                     {TInteger}
    | 'Boolean'                                                     {TBool}
    | TypeTuple                                                     {$1}
TypeTuple
    : '(' Type 'and his friend' Type ')'                            {TTuple (Arg $2 "") (Arg $4 "")} -- :t (5 and his friend (yep and his friend 4))

FunctionApp
    : 'summon' 'identifier' 'with' FunctionAppArgs                  {EApp $2 $4}
    | 'summon' 'identifier'                                         {EApp $2 []}
FunctionAppArgs
    : FunctionAppArg                                                {[$1]}
    | FunctionAppArgs 'and' FunctionAppArg                          {$3:$1}
FunctionAppArg
    : Expr                                                          {$1}
    
LetInDefs
    : Definition                                                    {[$1]}
    | LetInDefs 'and' Definition                                    {$3:$1}
    
If 
    : 'suppose' Expr 'then we can conclude' Expr 'rather than' Expr {EIf $2 $4 $6}

CaseOfs
    : CaseOf                                                        {[$1]}
    | CaseOf CaseOfs                                                {$1:$2}
CaseOf
    : 'perhaps' Pattern 'which does' Expr                           {($2,$4)}
Pattern
    : 'who cares'                                                   {PAny}
    | 'identifier'                                                  {PVar $1}
    | '(' Pattern 'and his friend' Pattern ')'                      {PTuple $2 $4}
    | Literal                                                       {PValue $1}
    -- TODO ambigue Pattern tuple

Literal
    : 'integer'                                                     {VInteger $1}
    | 'yep'                                                         {VBool True}
    | 'pasyep'                                                      {VBool False}
    | '(' Expr 'and his friend' Expr ')'                            {VTuple $2 $4}

UnaryOp
    : 'neg'                                                         {Operator Arithmetic "-"}
    | 'not'                                                         {Operator Logical "!"}

BinaryOp
    : 'plus'                                                        {Operator Arithmetic "+"}
    | 'minus'                                                       {Operator Arithmetic "-"}
    | 'times'                                                       {Operator Arithmetic "*"}
    | 'split'                                                       {Operator Arithmetic "/"}
    | 'rest'                                                        {Operator Arithmetic "%"}
    | 'weaker than'                                                 {Operator Relational "<"}
    | 'stronger than'                                               {Operator Relational ">"}
    | 'as weak as'                                                  {Operator Relational "<="}
    | 'as strong as'                                                {Operator Relational ">="}
    | 'same as'                                                     {Operator Comparison "=="}
    | 'different of'                                                {Operator Comparison "!="}
    | 'both'                                                        {Operator Logical "&&"}
    | 'either'                                                      {Operator Logical "||"}

{
parseError [] = error "Parse error at beginning or end of expression"
parseError (f:ts) = error $ "Parse error between " ++ show f ++ " and " ++ show l
    where l = last ts
}