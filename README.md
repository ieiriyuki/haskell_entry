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
