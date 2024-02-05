module RLE where

import Data.List (group)

-- | ランレングス圧縮
--
-- >>> rle ""
-- ""
-- >>> rle "A"
-- "A1"
-- >>> rle "AAABBCCCCAAA"
-- "A3B2C4A3"
rle :: String -> String
rle = concat . map (rl2str . toPair) . group

rl2str :: (Char, Int) -> String
rl2str (c, n) = c : show n

toPair :: String -> (Char, Int)
toPair str = (head str, length str)
