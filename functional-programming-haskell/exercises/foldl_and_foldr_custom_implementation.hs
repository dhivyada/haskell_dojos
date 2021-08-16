foldr_impl1            :: (a -> b -> b) -> b -> [a] -> b
foldr_impl1 k z = go
          where
            go []     = z
            go (y:ys) = y `k` go ys

foldr_impl2            :: (a -> b -> b) -> b -> [a] -> b
foldr_impl2 k z = go1
          where
            go1 []     = z
            go1 (y:ys) = y `k` go1 ys

foldr_impl3            :: (a -> b -> b) -> b -> ([a] -> b)
foldr_impl3 k z = go
          where
            go []     = z
            go (y:ys) = y `k` go ys

foldl_impl1        :: (b -> a -> b) -> b -> [a] -> b
foldl_impl1 f z0 xs0 = lgo z0 xs0
             where
                lgo z []     =  z
                lgo z (x:xs) = lgo (f z x) xs
