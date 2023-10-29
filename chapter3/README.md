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

