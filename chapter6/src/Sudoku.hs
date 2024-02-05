module Sudoku where

import Data.List ((\\),
                  maximumBy,
                  nub)
import Data.Function (on)

type Cell = (Int, Int)
type Board = [(Cell, Int)]

cells :: [Cell]
cells = [ (x, y) | x <- [0..8], y <- [0..8] ]

area :: Cell -> Int
area (x, y) = x `div` 3 + y `div` 3 * 3

used :: Board -> Cell -> [Int]
used board cell = nub [ n
                      | (cell', n) <- board
                      , any (\f -> f cell == f cell') [ snd, fst, area ]
                      ]

solve :: Board -> [Board]
solve board | length board == 81 = [board]
solve board = [ (cell, n) : board
              | let remains = cells \\ map fst board
              , let cell = maximumBy (compare `on` length . used board) remains
              , n <- [1..9] \\ used board cell
              ] >>= solve
