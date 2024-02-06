module PowerOf2 where

newtype PowerOf2 = PowerOf2 Int deriving (Eq, Show)

-- | 2の累乗に対し, それが2の何乗かを返す
--   それ以外の時はエラーになる
--
-- >>> exponentPowerOf2 1
-- 0
-- >>> exponentPowerOf2 2
-- 1
-- >>> exponentPowerOf2 3
-- *** Exception: 3 is not a power of 2
-- >>> exponentPowerOf2 4
-- 2
-- >>> exponentPowerOf2 1024
-- 10
exponentPowerOf2 :: PowerOf2 -> Int
exponentPowerOf2 (PowerOf2 n) = expof2 0 n where
    expof2 :: Int -> Int -> Int
    expof2 r n
        | n == 1         = r
        | n < 1 || odd n = error (shows n " is not a power of 2")
        | otherwise      = expof2 (r + 1) (n `div` 2)
