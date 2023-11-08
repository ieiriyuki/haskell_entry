module Lazy where


nats :: [Integer]
nats = 0 : map (+1) nats

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
