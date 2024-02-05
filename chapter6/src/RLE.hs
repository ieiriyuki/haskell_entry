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
fromCharAndRunLength = concat . rls2strs

rls2strs :: [(Char, Int)] -> [String]
rls2strs = undefined

toCharAndRunLength :: String -> [(Char, Int)]
toCharAndRunLength = undefined
