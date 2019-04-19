

module SingleByteXOR (
        decodeEnglish
        ) where

import qualified Stream as S
import qualified Data.ByteString.Lazy as BL
import qualified Data.Word8 as W8

type Frequency = (W8.Word8, Int64)

englishFrequencies :: W8.Word8 -> Int64
englishFrequencies w8 = let
    s = W8.show w8
    freq
      | s == "e"  = 21912
      | s == "t"  = 16517
      | s == "a"  = 14810
      | s == "o"  = 14003
      | s == "i"  = 13318
      | s == "n"  = 12666
      | s == "s"  = 11450
      | s == "r"  = 10977
      | s == "h"  = 10795
      | s == "d"  = 7874
      | s == "l"  = 7253
      | s == "u"  = 5246
      | s == "c"  = 4943
      | s == "m"  = 4761
      | s == "f"  = 4200
      | s == "y"  = 3853
      | s == "w"  = 3819
      | s == "g"  = 3693
      | s == "p"  = 3316
      | s == "b"  = 2715
      | s == "v"  = 2019
      | s == "k"  = 1257
      | s == "x"  = 315
      | s == "q"  = 205
      | s == "j"  = 188
      | s == "z"  = 128
      | otherwise = 0
    in freq

decodeEnglish :: BL.ByteString -> BL.ByteString
-- map xor over characters, sort by english score, return top
decodeEnglish s = let
    allChars = [0::W8.Word8 .. 127::W8.Word8]
    rawS = S.hexToRaw s
    xorResults = map (S.xor rawS . BL.take (BL.length s) . BL.repeat) allChars
    scores = map (score englishFrequencies) xorResults
  in last $ sortOn snd scores


score :: (W8.Word8 -> Int64) -> BL.ByteString -> (BL.ByteString, Int64)
score a b = undefined
