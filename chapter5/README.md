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
