# Evaluation strategy

遅延評価

`mean' xs = let (res, len) = foldl (\(m, n) x -> (m + x / len, n + 1)) (0, 0) xs in res`
