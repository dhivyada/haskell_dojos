-- simple factorial definition

fact2 :: Int -> Int
fact2 n = if n == 0 then 1 else n * fact2(n-1)

-- rewrite the above definition to make it look neater
fact3 :: Int -> Int
fact3 0 = 1
fact3 n = n * fact3(n-1)
