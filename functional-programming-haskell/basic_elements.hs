--Haskell basics
--Part 1.2: Expressions, functions, types, lists

--EXPRESSIONS:
a = 2
b = 3
c = 4
v = (b*b-4*a*c)/2*a
v
--Output = -23.0

--FUNCTIONS:
hello name = "Hello, " ++ name
hello "Someone"
--Output = "Hello, Someone"

--TYPES:
square :: Int -> Int -> Int
square x y = x * x + y * y
square 2 4
--Output = 20

--LISTS:
lst = ["A", "list", "of", "strings"]
