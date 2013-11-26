-- | This module contains a hierarchical data structure for
--   RNAplex output
--   For more information on RNAplex consult: <http://www.bioinf.uni-leipzig.de/Software/RNAplex/>

module Bio.RNAplexData where
    
-- | RNAplex output consists of a set of interactions 
data RNAplexOutput = RNAplexOutput
  {
    RNAplexOutput :: [RNAplexInteraction]
  }
  deriving (Show, Eq)

-- | Data structure for individual interaction between a target and query nucleic acid seqence
data RNAplexInteraction = RNAplexInteraction
  { 
    targetIdentifier :: ByteString,
    queryIdentifier :: ByteString,
    secondaryStructure :: ByteString,
    targetDuplexBegin :: Int,
    targetDuplexEnd :: Int,
    queryDuplexBegin :: Int,
    queryDuplexEnd :: Int,
    duplexEnergy :: Double,
    duplexEnergyWithoutAccessiblity :: Double,
    queryAccessiblity :: Maybe Double,
    targetAccessibility :: Maybe Double,
  }
  deriving (Show, Eq)
