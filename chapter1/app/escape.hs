-- echo '"&<>"' | stack runghc escape.hs

escape :: String -> String
escape str = str >>= escapeAmp >>= escapeOther where
    escapeAmp   '&' = "&amp;"
    escapeAmp     c = [c]
    escapeOther '<' = "&lt;"
    escapeOther '>' = "&gt;"
    escapeOther '"' = "&quot;"
    escapeOther   c = [c]

main :: IO()
main = do
    rawString <- getLine
    let escapedString = escape rawString
    putStrLn escapedString
