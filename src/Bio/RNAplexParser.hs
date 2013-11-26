-- | Parse RNAplex output
--   For more information on RNAplex consult: <http://www.bioinf.uni-leipzig.de/Software/RNAplex/>

module Bio.RNAplexParser (
                       parseRNAplex,
                       readRNAplex,                                   
                       module Bio.RNAplexData
                      ) where

import Bio.RNAplexData   
import Control.Monad
