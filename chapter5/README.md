# Monad

## Adhoc usage

```bash
stack build --install-ghc
stack ghci src/Lib.hs
```

## Type class

ある型が何らかの性質を持つことを示すインターフェース

```haskell
class Boollike a where
    fromBoollike :: a -> Bool

-- type class default implementation
class Eq a where
    (==) :: a -> a -> Bool
    x == y = not (x /= y)
    (/=) :: a -> a -> Bool
    x /= y = not (x == y)
```

### インターフェースや抽象クラスとの比較

- 後付けでインターフェースを与えられるかどうか
- 2か所以上に現れる同じインターフェースを持つ方が同じ型であることを強制できるか
- e.g. `ToInt.hs`

## Monad

- 文脈を持つ計算を扱う
- 組み合わせ方があらかじめ設定された計算
- 型クラスの一つ
- `((->) r)`: アロー演算子の左に`r`を適用する, モナドの一つ
- インターフェースとして多相性に利用できる

```haskell
class Monad m where
    return :: a -> m a -- provide type a with monad m
    (>>=)  :: m a -> (a -> m a) -> m b
    -- bind: combination of actions

action: モナドmの文脈を持つ型を結果に持つ関数

### monad laws

```haskell
return x >>= f = f x -- returnがbindの左単位元
m >>= return = m -- returnがbindの右単位元
(m >>= f) >>= g = m >>= (\x -> f x >>= g) -- bindの結合則
```

### do記法

syntax sugar

```haskell
m >>= f >>= g

do x <- m
   y <- f x
   -- let z = x + y -- 新たな変数に束縛できる
   g y
```

### Identity

何もしない。モナド変換子と組み合わせると便利。

```haskell
newtype Identity a = Identity { runIdentity :: a }

instance Monad Identity where
    return Identity
    Identity x >>= f = f x
```

### Maybe

失敗するかもしれない文脈

```haskell
instance Monad Maybe where
    return Just
    Just x >>= f = f x
    Nothing >>= _ = Nothing
```

### List

複数の可能性を持つ

```haskell
instance Monad [] where
    return = (:[])
    (>>=)  = concatMap
```

**list comprehension**

`[ expr | elem <- list, cond ]`

`list >>= \elem -> if cond then [expr] else []`

```haskell
primes:: [Integer]
primes = f [2..] where -- normal
    f (p : ns) = p : f (filter ((/= 0) . (`mod` p)) ns)

primes = f [2..] where -- comprehension
    f (p : ns) = p : f [ n | n <- ns, n `mod` p /= 0 ]
```
