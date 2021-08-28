maxHelper :: Int -> [Int] -> Int
maxHelper x [] = x
maxHelper x (y:ys) = maxHelper (if x > y then x else y) ys

-- maxHelper 42 []
-- 42

-- maxHelper (-1) [1, 2, 3]
-- 3

-- maxFromList : Takes an integer list and returns the max value from that list
maxFromList :: [Int] -> Maybe Int
maxFromList [] = Nothing
maxFromList (x:xs) = Just (maxHelper x xs)

-- Interesting question
f :: () -> String
f () = let x = (Just Nothing)
       in
        case x of
         (Just _) -> "something"
         Nothing -> "nothing"

--f()
--"something"