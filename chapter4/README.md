# Evaluation strategy

## 遅延評価

`mean' xs = let (res, len) = foldl (\(m, n) x -> (m + x / len, n + 1)) (0, 0) xs in res`

### 最左最外簡約

最左最外簡約で停止しないラムダ式はどのような順でも停止しない

### WHNF 弱冠頭正規形

- weak head normal form
- これ以上、適用する値がない関数
- 式の先頭にコンストラクタが出た状態の値

## 評価戦略

与えられた式を計算し結果を得るときの計算順の決め方

reduction (簡約): `(\x -> 変数xを含むかもしれない式A) 式B` を `式A中の変数xを全て式Bに置き換えた式` に変換する規則

正規形: 式中のどの部分についても簡約にできない式

### サンク thunk

評価が行われないまま放置されている計算予定オブジェクト

グラフ簡約: 必要としている式同士の関係のグラフからキャッシュ利用を判断する

### 利点と欠点

- 積極評価
  - 現在の計算機アーキテクチャと相性がいい
  - レジスタやメモリにおいても使いやすい
  - 高速にしやすい
  - 使われないかもしれないが計算するコスト
- 遅延評価
  - 計算せずに済むベネフィット
  - 計算の定義と実行を分離できる
  - 現在の計算機アーキテクチャと相性が良くない
  - 使われないかもしれない計算予定を作るコスト
  - 作った計算予定を破棄するコスト

## 制御

`:sprint` で評価状況を確認できる

サンクをつぶす: 部分的に評価を強要する

- `seq` をつかう
- `!` を使う
```haskell
data X a = X !a
data X = X1  Int
       | X2 !Int
       deriving Show
x1 = X1 (1 + 1)
x2 = X2 (1 + 1)
```
- data で定義したデータ型のフィールドはデフォルトで遅延評価
- newtype で定義したデータ型のフィールドはデフォルトでWHNFまで評価される
  - `newtype Y = Y Int deriving Show`
- BangPatterns: 関数定義の引数変数, let, whereでの変数束縛に`!`をつける
  - bind時に評価する
```haskell
ignore1  x = ()
ignore2 !x = ()
ignore3  x = let !a = x in ()
ignore4  x = () where !a = x
```
- モジュール単位でつぶす: `Strict`, `StrictData`によるファイル単位で積極評価
- 変数束縛などに対しデフォルトで `!` 付きの状態とみなす
- `stack exec ghci -- -XStrictData Lazy`
- 使いどころを判断できなければ積極評価にはしない
- `space leak`: 評価されず、不要とも判断できない肥大化するサンク
```haskell
-- space leakを持つ例
total :: Num a => [a] -> a
total xs = total' 0 xs where
  total' acc [] = acc
  total' acc (x:xs) = total' (acc + x) xs
```
- BangPatternsを使って回避できる
- 正格性解析 (strictness analysis): 正格に計算しても全体の結果に影響がなく、遅延させる意味がない箇所
