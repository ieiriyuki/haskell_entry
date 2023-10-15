-- p103
-- genconf.hs

module Nginx ( Conf, runConf
             , http, server, location
             , index, listen
             ) where

newtype Conf ctx a = Conf { unConf :: Int -> IO a }

instance Functor (Conf ctx) where
    fmap f conf = Conf (fmap f . unConf conf)
instance Applicative (Conf ctx) where
    pure = Conf . const . return
    f <*> x = Conf (\n -> unConf f n <*> unConf x n)
instance Monad (Conf ctx) where
    return = pure
    x >>= f = Conf (\n -> unConf x n >>= \a -> unConf (f a) n)

data GlobalCtx
data HTTPCtx
data ServerCtx
data LocationCtx

runConf :: Conf GlobalCtx a -> IO a
runConf conf = unConf conf 0

putStrLnWithIndent :: String -> Conf ctx ()
putStrLnWithIndent ss = Conf (\n -> putStrLn $ replicate n ' ' ++ ss)

unCtx :: Conf ctx a -> Conf ctx' a
unCtx = Conf . unConf

indented :: Conf ctx a -> Conf ctx' a
indented conf = Conf $ unConf conf . succ

http :: Conf HTTPCtx a -> Conf GlobalCtx a
http block = putStrLnWithIndent "http {" *>
             unCtx (indented block) <*
             putStrLnWithIndent "}"

server :: Conf ServerCtx a -> Conf HTTPCtx a
server block = putStrLnWithIndent "server {" *>
               unCtx (indented block) <*
               putStrLnWithIndent "}"

class LocationCtxBlockCtxs ctx
instance LocationCtxBlockCtxs ServerCtx
instance LocationCtxBlockCtxs LocationCtx
location :: LocationCtxBlockCtxs ctx => String -> Conf LocationCtx a -> Conf ctx a
location pattern block = putStrLnWithIndent ("location " ++ pattern ++ " {") *>
                         unCtx (indented block) <*
                         putStrLnWithIndent "}"

class IndexDirectiveCtxs ctx
instance IndexDirectiveCtxs HTTPCtx
instance IndexDirectiveCtxs ServerCtx
instance IndexDirectiveCtxs LocationCtx
index :: IndexDirectiveCtxs ctx => String -> Conf ctx ()
index file = putStrLnWithIndent $ "index " ++ file ++ ";"

listen :: String -> Conf ServerCtx ()
listen addrport = putStrLnWithIndent $ "listen " ++ addrport ++ ";"
