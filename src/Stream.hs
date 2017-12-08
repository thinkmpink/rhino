module Stream
    ( hexToRaw
      -- rawToHex
    ) where

import qualified Data.ByteString.Lazy as BL
import qualified Data.Word8 as W8
import qualified Data.Bits as B

hexToRaw :: BL.ByteString -> BL.ByteString
hexToRaw = (BL.map hexCharToByte)
--hexToRaw = packHexBytes . (BL.map hexCharToByte)

-- rawToHex :: BL.ByteString -> BL.ByteString

--rawToHex = (BL.map byteToHexChar) . unpackHexBytes

hexCharToByte :: W8.Word8 -> W8.Word8
hexCharToByte c = 
    case W8.isHexDigit c of
       True | c >= 48 && c <= 57 -> ((fromIntegral c) - 48) :: W8.Word8 
            | c >= 65 && c <= 90 -> ((fromIntegral c) - 55) :: W8.Word8
            | c >= 97 && c <= 122 -> ((fromIntegral c) - 87) :: W8.Word8
       False ->  -1 :: W8.Word8


--byteToHexChar ::  W8.Word8 -> W8.Word8
--byteToHexChar = undefined 

--packHexBytes :: BL.ByteString -> BL.ByteString
--packHexBytes x 
--    | x == BL.empty = x
--    | otherwise     = BL.cons c $ packHexBytes rest 
--    where
--        two = BL.take 2 x
--        rest = BL.drop 2 x
--        a = B.shiftL (C.ord . BL.head $ two) 4
--        b = (C.ord . BL.last $ two) B..&. 0x0F
--        c = C.chr $ a B..|. b
--
--unpackHexBytes :: BL.ByteString -> BL.ByteString
--unpackHexBytes x
--    | x == BL.empty = x
--    | otherwise     = BL.cons a $ BL.cons b $ unpackHexBytes t
--    where 
--        t = BL.tail x
--        c = BL.head x
--        a = C.chr . (0x0F B..&.) . (B.shiftR $ C.ord c) $ 4
--        b = C.chr . (0x0F B..&.) . C.ord $ c



