# haskell_entry
[[増補改訂] 関数プログラミング実践入門の写経](https://gihyo.jp/book/2016/978-4-7741-8390-9)

## Haskell set up

https://www.haskell.org/get-started/

## Docker Help

```
docker compose up -d
docker compose exec app bash

cd helloworld
stack build --resolver ghc-9.6.3
# optionally use --resolver lts
```

> The `install` command does precisely one thing in addition to the build command: it copies any generated executables to the local binary directory.

- `stack path`
- `stack exec`
- `stack exec env`

## Style guide

- https://wiki.haskell.org/Programming_guidelines
- https://kowainik.github.io/posts/2019-02-06-style-guide
- https://github.com/tibbe/haskell-style-guide/blob/master/haskell-style.md

## Features of Haskell

- 開発効率が良い
  - 本質以外の記述が少ない
- バグが少ない
  - 安全を破らせないような設計ができる
- 並行並列処理に強い
  - 純粋である

## Stack Usage

https://docs.haskellstack.org/en/stable/
