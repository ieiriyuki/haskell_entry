# chapter1

p.67

## usage

`stack build --install-ghc`
(or maybe `--resolver`)

## parallel.hs

- 並列化で本質的に強い計算パターンおよび設計見直しが必要となる
- c のサンプルではそれができていない、かつ難しい
- haskell では設計を変更しないとそもそも動かないため、一定の保守性が保たれる
- とはいえ haskell でも本当に速い並列化は難しい (遅延評価もあるため)
