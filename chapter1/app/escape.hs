-- echo '"&<>"' | stack runghc escape.hs

import HTMLEscapedString

main :: IO()
main = do
    rawString <- getLine
    let escapedString = escape rawString
    putHTMLEscapedStrLn escapedString
