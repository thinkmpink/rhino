{-# LANGUAGE OverloadedStrings #-}

module TestS1C1 (
       runTests ) where

import qualified Data.ByteString.Lazy as BL
import qualified Stream as S
import qualified Control.Exception.Base as CB

default (BL.ByteString)

runTests :: String
runTests = let 
               act = S.hexToBase64 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
               exp = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"
           in CB.assert (act == exp) "S1C1: passed"
