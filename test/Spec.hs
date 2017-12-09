{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as BL
import qualified Stream as S

default (BL.ByteString)

main :: IO ()
main = do
       putStr "\n"
       BL.putStr $ S.hexToBase64 "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
       putStr "\n"
