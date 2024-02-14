module PowerOf2
    ( PowerOf2
    , makePowerOf2
    , exponentPowerOf2
    ) where

newtype PowerOf2 = PowerOf2 Int deriving (Eq, Show)

isPowerOf2 :: Int -> Bool
isPowerOf2 n
    | n == 1 = True
    | n < 1 || odd n = False
    | otherwise = isPowerOf2 (n `div` 2)

-- | 整数から2の累乗を生成する
--
-- >>> makePowerOf2 1
-- Just (PowerOf2 1)
-- >>> makePowerOf2 2
-- Just (PowerOf2 2)
-- >>> makePowerOf2 3
-- Nothing
-- >>> makePowerOf2 1024
-- Just (PowerOf2 1024)
makePowerOf2 :: Int -> Maybe PowerOf2
makePowerOf2 n
    | isPowerOf2 n = Just (PowerOf2 n)
    | otherwise    = Nothing

-- | 2の累乗に対し, それが2の何乗かを返す
--   それ以外の時はエラーになる
--
-- >>> exponentPowerOf2 (PowerOf2 1)
-- 0
-- >>> exponentPowerOf2 (PowerOf2 2)
-- 1
-- >>> exponentPowerOf2 (PowerOf2 4)
-- 2
-- >>> exponentPowerOf2 (PowerOf2 1024)
-- 10
exponentPowerOf2 :: PowerOf2 -> Int
exponentPowerOf2 (PowerOf2 n) = expof2 0 n where
    expof2 :: Int -> Int -> Int
    expof2 r n
        | n == 1    = r
        | otherwise = expof2 (r + 1) (n `div` 2)
