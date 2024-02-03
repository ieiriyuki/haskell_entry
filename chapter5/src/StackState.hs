import Control.Monad.State

push :: a -> State [a] ()
push = modify . (:)

pop :: State [a] a
pop = do
    value <- gets head
    modify tail
    return value

applyTop :: (a -> a) -> State [a] ()
applyTop f = do
    a <- pop
    push (f a)

-- runState (applyTop (+10)) [0..9]
