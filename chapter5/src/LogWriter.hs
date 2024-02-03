import Control.Monad.Writer

logging :: String -> Writer [String] ()
logging s = tell [s]

fibWithLog :: Int -> Writer [String] Int
fibWithLog n = do
    logging ("fibWithLog " ++ show n)
    case n of
        0 -> return 1
        1 -> return 1
        n -> do
            a <- fibWithLog (n-2)
            b <- fibWithLog (n-1)
            return (a+b)
