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
-- | fail ;)
-- prop> countSpaces s == sum [ 1 | c <- s, c == ' ' ]
--
countSpaces :: String -> Int
countSpaces = length . filter (\x -> ' ' == x || '\t' == x)
