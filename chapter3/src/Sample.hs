-- stack ghci src/Sample.hs
-- > digits 10
-- > 2
digits :: Int -> Int
digits = length . show

-- > :r
-- > square 10
-- > 100
square :: Num a => a -> a
square = (^ 2)
