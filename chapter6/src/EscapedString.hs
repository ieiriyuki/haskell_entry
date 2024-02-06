{-# LANGUAGE FlexibleInstances #-}
module EscapedString
    ( EscapedString
    , fromString
    , toString
    ) where

import Data.List (isPrefixOf)

newtype EscapedString x = EscapedString { unEscapedString :: String } deriving Eq

instance Show (EscapedString x) where
    show = show . unEscapedString

fromString :: String -> EscapedString String
fromString = EscapedString

toString :: EscapedString String -> String
toString = unEscapedString

class EscapedStringLike s

instance EscapedStringLike String

class EscapeMethod m where
    escape :: EscapedStringLike s => EscapedString s -> EscapedString (m s)
    unescape :: EscapedStringLike s => EscapedString (m s) -> EscapedString s

data HTMLEscape s

instance EscapedStringLike s => EscapedStringLike (HTMLEscape s)

instance EscapeMethod HTMLEscape where
    escape = EscapedString . escape' . unEscapedString where
        escape' :: String -> String
        escape' str = str >>= escapeAmp >>= escapeOther where
            escapeAmp   '&' = "&amp;"
            escapeAmp    c  = [c]
            escapeOther '<' = "&lt;"
            escapeOther '>' = "&gt;"
            escapeOther '"' = "&quot;"
            escapeOther  c  = [c]
    unescape = EscapedString . unescape' . unEscapedString where
        unescape' :: String -> String
        unescape' = foldr (\c s -> unescapePrefix (c:s)) "" where
            unescapePrefix str
                | "&quot;" `isPrefixOf` str = '"':drop 6 str
                | "&gt;"   `isPrefixOf` str = '>':drop 4 str
                | "&lt;"   `isPrefixOf` str = '<':drop 4 str
                | "&amp;"  `isPrefixOf` str = '&':drop 5 str
                | otherwise                 = str

data StringEscape s

instance EscapedStringLike s => EscapedStringLike (StringEscape s)

instance EscapeMethod StringEscape where
    escape = EscapedString . show . unEscapedString
    unescape = EscapedString . read . unEscapedString
