{-# LANGUAGE OverloadedStrings #-}

module TestS1C2 (
       runTests ) where

import qualified Data.ByteString.Lazy as BL
import qualified Stream as S
import qualified Control.Exception.Base as CB

default (BL.ByteString)

runTests :: String
runTests = let 
               act = S.xorHexStr "1c0111001f010100061a024b53535009181c" "686974207468652062756c6c277320657965"
               exp = "746865206b696420646f6e277420706c6179"
           in CB.assert (act == exp) "S1C2: passed"
