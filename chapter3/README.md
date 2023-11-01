# chapter3: function

```haskell
-- 中置記法
> 12 `gcd` 15

-- 2項演算子の関数化
> (++) [1,2] [3,4]

-- セクション: 演算子の左右どちらかに
-- 引数を与えたうえで () で囲む
> (2 ^)
> (^ 3)

```

## 関数合成

*h(x) = (f ○ g)(x) = f(g(x))*

`f . g`

## 関数定義

`cd src; stack ghci Sample.hs`

基本

```haskell
func :: context => type -> type
func arg ... arg = expr
```

### pattern match

上に定義されたパターンを優先する

```haskell
func pattern ... pattern = expr
ultimate :: Int -> String
ultimate 42 = "人生"
ultimate n = show n
```

pattern match = コンストラクトの逆計算

```haskell
maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just a) = [a]

listToMaybe :: [a] -> Maybe a
listToMaybe []       = Nothing
listToMaybe (a : as) = Just a

deepning :: String -> String
deepning (' ':' ':xs) = "    " ++ xs
deepning (' ':xs)     = "  " ++ xs
deepning xs           = xs
```

パターンを網羅していないと実行時エラーが起こる

as pattern: @

`_` をプレースホルダとして使える、束縛しない、`_xs` でもいい

```haskell
deepning :: String -> String
deepning s@(' ':' ':_) = "  " ++ s
deepning s@(' ':_)     = " " ++ s
deepning s             = s
```

### guard

データの性質に合わせて関数を決める

```haskell
func :: context => type -> type
func arg ... arg
    | guard cond1 = expr1
    | gurad cond2 = expr2

safeSqrt :: (Ord a, Floating a) => a -> Maybe a
safeSqrt x
    | x < 0     = Nothing
    | otherwise = Just (sqrt x)
```

### combination

```haskell
caseOfFirstLetter :: String -> String
caseOfFirstLetter "" = "empty"
caseOfFirstLetter (x:xs)
    | 'a' <= x && x <= 'z' = "lower"
    | 'A' <= x && x <= 'Z' = "upper"
    | otherwise            = "other"
```
