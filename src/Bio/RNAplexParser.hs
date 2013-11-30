-- | Parse RNAplex output
--   For more information on RNAplex consult: <http://www.bioinf.uni-leipzig.de/Software/RNAplex/>

module Bio.RNAplexParser (
                       parseRNAplex,
                       readRNAplex,                                   
                       module Bio.RNAplexData
                      ) where

import Bio.RNAplexData
import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Token
import Text.ParserCombinators.Parsec.Language (emptyDef)    
import Control.Monad

-- | Parse the input as RNAzOutput datatype
parseRNAzOutput :: GenParser Char st RNAplexOutput
parseRNAzOutput = do
  rnaplexResults <- many1 (try parseRNAplexResult)   
  eof  
  return $ RNAplexOutput rnaplexResults

-- | Parse the consenus of RNAz results         
parseRNAplexInteraction :: GenParser Char st RNAplexInteraction
parseRNAplexInteraction = do
  space
  string (">") 
  targetIdentifier <- many1 (noneOf "\n")                
  newline
  string (">") 
  queryIdentifier <- many1 (noneOf "\n")                
  newline 
  dotBracket <- many1 (oneOf "().,")
  space
  targetDuplexBegin <- many1 integer
  char ','
  targetDuplexEnd <- many1 integer
  space
  char ':'
  space
  many1 space
  queryDuplexBegin <- many1 integer
  char ','
  queryDuplexEnd <- many1 integer
  many1 space
  char '('
  duplexEnergy <- float
  space
  char '='
  space
  duplexEnergyWithoutAccessiblity <- float
  space 
  char '+'
  many1 space
  queryAccessiblity <- float
  space 
  char '+'
  many1 space
  targetAccessibility <- float
  char ')'
  newline 
  return $ RNAzConsensus consensusSequence dotBracket
