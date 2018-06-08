{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as BL
import qualified Stream as S
import qualified TestS1C1 as S1C1
--import qualified TestS1C2 as S1C2

--import Test.QuickCheck

default (BL.ByteString)

main :: IO ()
main = do
       putStr "\n"
       
       putStrLn S1C1.runTests

       putStr "S1C2: "
       BL.putStr $ S.xorHexStr "1c0111001f010100061a024b53535009181c" "686974207468652062756c6c277320657965"
       putStr "\n"

       --putStrLn "S1C3: "
       --putStrLn "  key: "
       --BL.putStr $ 
