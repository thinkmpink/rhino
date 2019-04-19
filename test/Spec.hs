{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Lazy as BL
import qualified Stream as S
import qualified TestS1C1 as S1C1
import qualified TestS1C2 as S1C2
import qualified TestS1C3 as S1C3

--import Test.QuickCheck

default (BL.ByteString)

main :: IO ()
main = do
       putStr "\n"
       
       putStrLn S1C1.runTests
       putStrLn S1C2.runTests
       putStrLn S1C3.runTests
