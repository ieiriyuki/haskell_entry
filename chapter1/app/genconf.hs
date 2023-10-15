-- p103
-- stack setup --install-ghc
-- stack ghc genconf.hs
-- ./genconf

module Main where

import Nginx

main :: IO ()
main = runConf $ do
    http $ do
        server $ do
            listen "*:80"
            location "/" $ do
                -- listen "*:80" compile error
                index "index.html"
