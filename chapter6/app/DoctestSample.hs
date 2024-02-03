module DoctestSample where

-- | 文字列中のスペースの個数
--
-- >>> countSpaces ""
-- 0
-- >>> countSpaces "aaa"
-- 0
-- >>> countSpaces "a a a"
-- 2
-- >>> countSpaces "    "
-- 4
--
countSpaces :: String -> Int
countSpaces = length . filter (== ' ')
