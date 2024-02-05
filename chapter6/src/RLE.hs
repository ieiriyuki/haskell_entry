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
rle = fromCharAndRunLength . toCharAndRunLength

fromCharAndRunLength :: [(Char, Int)] -> String
fromCharAndRunLength = concat . map rl2str

rl2str :: (Char, Int) -> String
rl2str = undefined

toCharAndRunLength :: String -> [(Char, Int)]
toCharAndRunLength = undefined
