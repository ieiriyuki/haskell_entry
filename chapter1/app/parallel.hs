-- stack setup --install-ghc
-- stack install parallel
-- stack ghc ./app/parallel.hs
import Prelude
import Data.Int
import Control.Parallel

isPrime :: Int32 -> Bool
isPrime x = all (\n -> x `mod` n /= 0) [2 .. toEnum (floor $ sqrt $ fromIntegral x)]

arr :: [Int32]
arr = [ 2 .. 1000000 ]

main :: IO ()
main = do
    let primes = reduceP (fromEnum . isPrime) (+) arr -- 判定しながら集計
    putStr "primes: " >> print primes

reduceP :: (b -> a) -> (a -> a -> a) -> [b] -> a
reduceP f _ [x] = f x
reduceP f (<+>) xs = (ys `par` zs) `pseq` (ys <+> zs) where
    len = length xs
    (ys', zs') = splitAt (len `div` 2) xs
    ys = reduceP f (<+>) ys'
    zs = reduceP f (<+>) zs'
