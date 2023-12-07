module Lib
    ( someFunc,
      BoolLike,
      fromBoolLike,
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

class BoolLike a where
    fromBoolLike :: a -> Bool

instance BoolLike Int where
    fromBoolLike = (0 /=)

instance BoolLike (Maybe a) where
    fromBoolLike Nothing = False
    fromBoolLike (Just _) = True

instance BoolLike Bool where
    fromBoolLike x = x
