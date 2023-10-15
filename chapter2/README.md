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

-- タプル
-- Either
-- Maybe
```
