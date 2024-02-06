-- ロジックパズル
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE EmptyCase #-}

module InferenceRule
    ( People(..)
    , Food(..)
    , Eat(..)
    , NotEat(..)
    ) where

data (:==:) :: k -> k -> * where
    Refl :: a :==: a

data Bottom

type Not p = p -> Bottom

type a :/=: b = Not (a :==: b)

class (a :: k) `Neq` (b :: k) where
    neq :: a :/=: b
    neq x = case x of {}

data People = Tonkichi
            | Chinpei
            | Kanta
              deriving (Eq, Show)

instance Tonkichi `Neq` Chinpei
instance Tonkichi `Neq` Kanta
instance Chinpei `Neq` Kanta
instance Chinpei `Neq` Tonkichi
instance Kanta `Neq` Tonkichi
instance Kanta `Neq` Chinpei

data Food = Curry
          | Ramen
          | Soba
            deriving (Eq, Show)

instance Curry `Neq` Ramen
instance Curry `Neq` Soba
instance Ramen `Neq` Soba
instance Ramen `Neq` Curry
instance Soba `Neq` Curry
instance Soba `Neq` Ramen

data Eat :: People -> Food -> * where
    EatRemainFood   :: ( f1 `Neq` f2
                       , f2 `Neq` f3
                       , f1 `Neq` f3
                       ) =>
                       p `NotEat` f1
                    -> p `NotEat` f2
                    -> p `Eat` f3

    RemainPeopleEat :: ( p1 `Neq` p2
                       , p2 `Neq` p3
                       , p1 `Neq` p3
                       ) =>
                       p1 `NotEat` f
                    -> p2 `NotEat` f
                    -> p3 `Eat` f

data NotEat :: People -> Food -> * where
    NotEatAnotherFood   :: ( f1 `Neq` f2
                           ) =>
                           p `Eat` f1
                        -> p `NotEat` f2

    AnotherPeopleNotEat :: ( p1 `Neq` p2
                           ) =>
                           p1 `Eat` f
                        -> p2 `NotEat` f
