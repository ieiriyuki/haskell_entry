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
