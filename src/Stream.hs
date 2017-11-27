module Stream
    ( hexToRaw
    ) where

import qualified Data.ByteString.Lazy.Char8 as C8
import qualified Data.Char as C

hexToRaw :: C8.ByteString -> C8.ByteString
hexToRaw = packHexBytes . (C8.map hexCharToByte)

hexCharToByte :: C.Char -> C.Char
hexCharToByte = C.chr . C.digitToInt

packHexBytes :: C8.ByteString -> C8.ByteString
packHexBytes = id
