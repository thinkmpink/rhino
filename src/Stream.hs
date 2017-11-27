module Stream
    ( hexToRaw
    ) where

import qualified Data.ByteString.Lazy.Char8 as C8
import qualified Data.Char as C
import qualified Data.Bits as B

hexToRaw :: C8.ByteString -> C8.ByteString
hexToRaw = packHexBytes . (C8.map hexCharToByte)

hexCharToByte :: C.Char -> C.Char
hexCharToByte = C.chr . C.digitToInt

packHexBytes :: C8.ByteString -> C8.ByteString
packHexBytes x 
   | x == C8.empty = x
   | otherwise     = C8.cons c $ packHexBytes rest 
   where
    two = C8.take 2 x
    rest = C8.drop 2 x
    a = B.shiftL (C.ord . C8.head $ two) 4
    b = (C.ord . C8.last $ two) B..&. 0x0F
    c = C.chr $ a B..&. b
