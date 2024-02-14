module Main (main) where

import Sudoku
import Data.List
import Data.Function

main :: IO ()
main = case solve problem of
    answer : _ -> mapM_ print $ format answer
    []         -> putStrLn "invalid problem"

format :: Board -> [[Int]]
format = map (map snd) . transpose . groupBy ((==) `on` (fst . fst)) . sort

problem :: Board
problem = [ ((3, 0), 8)
          , ((5, 0), 1)
          , ((6, 1), 4)
          , ((7, 1), 3)
          , ((0, 2), 5)
          , ((4, 3), 7)
          , ((6, 3), 8)
          , ((6, 4), 1)
          , ((1, 5), 2)
          , ((4, 5), 3)
          , ((0, 6), 6)
          , ((7, 6), 7)
          , ((8, 6), 5)
          , ((2, 7), 3)
          , ((3, 7), 4)
          , ((3, 8), 2)
          , ((6, 8), 6)
          ]
