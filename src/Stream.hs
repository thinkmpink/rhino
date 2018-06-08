module Stream
    ( hexToRaw
    , rawToHex
    , hexToBase64
    , xor
    , xorHexStr
    ) where

import qualified Data.Bits as B
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Base64.Lazy as B64
import qualified Data.Word8 as W8


hexToBase64 :: BL.ByteString -> BL.ByteString
hexToBase64 = B64.encode . hexToRaw

hexToRaw :: BL.ByteString -> BL.ByteString
hexToRaw = packHexBytes . (BL.map hexCharToByte)

rawToHex :: BL.ByteString -> BL.ByteString
rawToHex = (BL.map byteToHexChar) . unpackHexBytes

hexCharToByte :: W8.Word8 -> W8.Word8
hexCharToByte c = 
    case W8.isHexDigit c of
        True | c >= 48 && c <= 57 -> (c - 48) :: W8.Word8 
             | c >= 65 && c <= 90 -> (c - 55) :: W8.Word8
             | c >= 97 && c <= 122 -> (c - 87) :: W8.Word8
        False ->  -1 :: W8.Word8

byteToHexChar :: W8.Word8 -> W8.Word8
byteToHexChar c =
    if c >= 0 && c <= 9
        then (c + 48) :: W8.Word8
        else if c > 9 && c <= 15
            then (c + 87) :: W8.Word8
            else -1 :: W8.Word8

packHexBytes :: BL.ByteString -> BL.ByteString
packHexBytes x 
    | x == BL.empty = x
    | otherwise     = BL.cons c $ packHexBytes rest 
    where
        two = BL.take 2 x
        rest = BL.drop 2 x
        a = shiftL' 4 . BL.head $ two
        b = (BL.last two) B..&. 0x0F
        c = a B..|. b

unpackHexBytes :: BL.ByteString -> BL.ByteString
unpackHexBytes x
    | x == BL.empty = x
    | otherwise     = BL.cons a $ BL.cons b $ unpackHexBytes t
    where 
        t = BL.tail x
        c = BL.head x
        a = (shiftR' 4 c) B..&. 0x0F
        b = c B..&. 0x0F

shiftL' :: (B.Bits a) => Int -> a -> a
shiftL' = flip B.shiftL

shiftR' :: (B.Bits a) => Int -> a -> a
shiftR' = flip B.shiftR

xor :: BL.ByteString -> BL.ByteString -> BL.ByteString
xor a b = BL.pack (BL.zipWith B.xor a b)

xorHexStr :: BL.ByteString -> BL.ByteString -> BL.ByteString
xorHexStr a b = rawToHex $ xor (hexToRaw a) (hexToRaw b)
