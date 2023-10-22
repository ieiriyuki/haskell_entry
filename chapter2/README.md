# chapter2: Type and Value

## リテラル

```haskell
'a'  -- 文字
putChar

"aa" -- 文字列
putStr

-- lambda 式
\x -> x * 2

-- スペースが関数適用
(\x -> x * 2) 1
-- 関数適用の優先度が最高

-- haskellにおいて真偽値は値コンストラクタ
True
False
```

## 変数

binding には `let` を使う

```haskell
let one = 1
let dbl = \x -> 2 * x
```

## 型

```haskell
:: -- type annotation
let one :: Int; one = 1
:t Value -- check type

-- 演算子も関数
True && True
(&&) True True

-- 関数が第一級, 関数が関数の結果の値になれる
-- カリー化: n引数関数を1引数関数だけで構成される形にする
let andT = (&&) True
andT True

:t "hello, world"
:: [Char] -- 型指定しないとリスト型になるらしい
:: String -- でも ghc9.0.2 だと String だった

:t 0
0 :: Num p => p -- 型クラス

-- 型変数の入った型を多相型という
-- リスト, 型コンストラクタでもある
[]
1 : [] -- 先頭に要素を追加
head :: [a] -> a -- a=型変数
:t length
length :: Foldable t => t a -> Int
-- Foldable: 1つの値に畳みこむやり方が決められている構造, Python Sequence みたいな
-- t: Foldable な t
-- a: t の中身

-- タプル: 要素数は2で固定, 直積といえる
(1, "a")
(1 :: Int, 2 :: Double)
(True, "bar") :: (Bool, [Char])
fst (1, 2) -- function
snd (1, 2)

-- Either, 直和といえる
> Right "1" :: Either Int String
Right "1"

-- Maybe
> Just "a"
> Nothing
> import Data.Maybe
> : isJust
isJust :: Maybe a -> Bool
> isJust (Just 1)
True
> isJust (Nothing)
False

-- 型推論できる
```

## 型定義
```haskell
> type K = Double
> let convert = \c -> c + 273.15 :: Double
> :t convert
convert :: Double -> Double
> let convert :: C -> K; convert = \c -> c + 273.15 :: Double
convert :: C -> K

> newtype K = K Double -- 型名, 型コンストラクタ, 内部型
> let convert = \(C x) -> K (x + 273.15)

-- 完全に新しい型, algebraic data type
> data [newtype] [type var] ... = constructor1 [type] ...
                                | constructor2 [type] ...
> :{
    data HTTPStatus = OK
                    | Found
                    | NotFound
                    | ServiceUnavailable
:}
-- constructor { field :: type, field2 :: type}
> data RGBA = RGBA { getR :: Float
                   , getG :: Float
                   , getB :: Float
                   , getA :: Float }

-- polymorphic type
> data Coord a = Coord { getX :: a, getY :: a }
-- recursive type
> data Nat = Zero | Succ Nat
-- 二分木
> :{
    data Tree a = Leaf { element :: a }
                | Fork { element :: a
                       , left :: Tree a
                       , right :: Tree a
                       }
:}
> data Tree a = Leaf a | Fork (a, (Tree a, Tree a)) -- のようにも書ける
```
