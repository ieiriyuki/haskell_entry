import Control.Monad.Writer

-- appEndoが未定義でエラる
newtype Endo a = Endo (appEndo :: a -> a)

instance Monoid (Endo a) where
    mempty = Endo id
    Endo a `mappend` Endo b = Endo (a . b)

enable :: (a -> a) -> Writer (Endo a) ()
enable = tell . Endo

plusEvenMinusOdd :: [Int] -> Writer (Endo Int) ()
plusEvenMinusOdd [] = return ()
plusEvenMinusOdd (n:ns) = do
    enable (\x -> if even n then x + n else x - n)
    plusEvenMinusOdd ns

-- execWriter (plusEvenMinusOdd []) `appEndo` 0
