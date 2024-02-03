square :: Integer -> Maybe Integer
square n
    | 0 <= n    = Just (n * n)
    | otherwise = Nothing

squareRoot :: Integer -> Maybe Integer
squareRoot n
    | 0 <= n    = squareRoot' 1
    | otherwise = Nothing
    where
        squareRoot' x
            | x * x < n = squareRoot' (x + 1)
            | n < x * x = Nothing
            | otherwise = Just x

-- Maybe Monad
squareAndSquareRoot1 :: Integer -> Maybe Integer
squareAndSquareRoot1 n = do
    nn <- square n
    squareRoot nn

squareAndSquareRoot2 :: Integer -> Integer -> Maybe Integer
squareAndSquareRoot2 m n = do
    mm <- square m
    nn <- square n
    squareRoot (mm * nn)

-- List Monad
lessThan :: Integer -> [Integer]
lessThan n = [0 .. n - 1]

plusMinus :: Integer -> Integer -> [Integer]
plusMinus x y = [x + y, x - y]

allPM0s :: Integer -> [Integer]
allPM0s n = do
    x <- lessThan n
    plusMinus 0 x

allPMs :: Integer -> Integer -> [Integer]
allPMs m n = do
    x <- lessThan m
    y <- lessThan n
    plusMinus x y

-- arrow monad
countOdd :: ((->) [Int]) -> Int
countOdd = length . filter odd

countEven :: ((->) [Int]) -> Int
countEven = length . filter even

countAll :: [Int] -> Int
countAll = do
    odds  <- countOdd
    evens <- countEven
    return (odds + evens)

-- seperate triple
triple :: Int -> Int
triple = do
    n <- id
    d <- (n+)
    (d+)

triple :: Int -> Int
triple = do
    d <- tripleA
    tripleB d

tripleA :: Int -> Int
tripleA = do
    n <- id
    (n+)

tripleB :: Int -> Int
tripleB d = do
    (d+)
-- bindで記法すると結合順が変わるように見える
-- モナド則3で保証している
