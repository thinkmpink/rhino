{-# LANGUAGE OverloadedStrings #-}

module TestS1C2 (
       runTests ) where

import qualified Data.ByteString.Lazy as BL
import qualified Stream as S
import qualified SingleByteXOR as SbXOR
import qualified Control.Exception.Base as CB

default (BL.ByteString)

runTests :: String
runTests = let 
               act = SbXOR.decodeEnglish "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
               exp =
           in CB.assert (act == exp) "S1C2: passed"
