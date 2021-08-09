> Part 2.3

* The `zip` function is used to combine `a pair of lists into a list of pairs`. Since lists are such fundamental data structures in functional programming, it’s important to be able to manipulate them in flexible and powerful ways.
  
```haskell
zip [1, 2, 3] [4, 5, 6]
--- [(1,4), (2,6), (3,6)]
```

* In haskell, a string is a list of characters

```haskell
zip [1, 2, 3] "abc"
--- [(1,'a'), (2,'b'), (3,'c')]
```

* `zip3`

```haskell
zip3 "glasgow" "beijing" "nairobi"
--- [('g','b','n'),('l','e','a'),('a','i','i'),('s','j','r'),('g','i','o'),('o','n','b'),('w','g','i')]
```

* `zip` with lists of `uneven lengths : length of the output => length of the shorter of the 2 inputs
```haskell
length [1..10]
--- 10
length ['a'..'z']
--- 26
```
```haskell
zip [1..10] ['a'..'z']
--- [(1,'a'),(2,'b'),(3,'c'),(4,'d'),(5,'e'),(6,'f'),(7,'g'),(8,'h'),(9,'i'),(10,'j')]
```
* `zipWith`
```haskell
zipWith max [1,2,3] [0, 2, 4]
--- [1,2,4]
```
```haskell
zipWith (+) [1,2,3] [0, 2, 4]
--- [1,4,7]
```
* How to write the `zip` function using the more generic `zipWith` function
```haskell
zipFunc = \x y -> (x, y)
zipWith zipFunc [1, 2, 3] "abc"
```
* Writing the above use-case with the help of `currying`
```haskell
zipFunc = \x -> (\y -> (x, y))
zipWith zipFunc [1, 2, 3] "abc"
```

* An example: 

In a board game, let's say you have a list of players and a list of cards (a deck), and you want to give a card to each player. You can simply do:

`firstHand = zip players deck`

* Very useful talk - it also talks about zip : 
[Infinite Data Structures: To Infinity & Beyond! - Computerphile](https://www.youtube.com/watch?v=bnRNiE_OVWA)