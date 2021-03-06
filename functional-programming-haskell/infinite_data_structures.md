> Part 5.3

#Infinite Data Structures

####In the previous video, we looked at infinite lists. We can define an infinite list of consecutive integers as follows:

```haskell
[1..]
```

We can evaluate this list, but it won’t print out in its entirety — because it goes on for ever. To repeat a set of identical values, use the `repeat` function.

```haskell
repeat 'a'
```

Again, this list is infinite. Use the `take` and `drop` functions to deal with infinite lists. It’s `permitted to do a finite amount of processing in an infinite list, but not to traverse it infinitely`.

The reason why Haskell can process infinite lists is because it evaluates the lists in a `lazy` fashion — i.e. it only evaluates list elements as they are needed.

Now let’s have a look at two well-known integer lists. We will study their recursive definitions.

##Fibonacci Numbers

The nth Fibonacci number is the sum of the previous two Fibonacci numbers. The first two numbers are both 1. Then the third is 2, followed by 3, 5, etc.

```haskell
1, 1, 2, 3, 5, 8, 13, 21, ...
```

We can `evaluate individual elements` of this list using the `!!` indexed list selection. Or we could `take` the first `n` elements of the `fibs` list.

##Prime Numbers

Below is a series of `filter` expressions to calculate an infinite list of prime numbers.

```haskell
properfactors :: Int -> [Int]
properfactors x = filter (\y->(x `mod` y == 0)) [2..(x-1)]

numproperfactors :: Int -> Int
numproperfactors x = length (properfactors x)

primes :: [Int]
primes = filter (\x-> (numproperfactors x == 0)) [2..]
```
Let’s analyse how this definition works:

* The `properfactors` function takes an integer value `x` and returns a list of proper factors for x. Factors are numbers that divide x and leave no remainder. `Proper factors` for an integer x do not include 1 or x.
* The `numproperfactors` function simply counts how many proper factors there are for x, by returning the length of the `properfactors x` list.
* Finally, `primes` list uses the `filter` function to select integers x that have no factors in the range `2 to (x-1) inclusive`.

Can you think of other interesting infinite lists we might explore?

```haskell
perfectNumsTo :: [Int]
perfectNumsTo = filter (\x-> isPerfectNum x) [1..]
    where isPerfectNum n = n == sum (divisors n)
          divisors x = filter (\y -> x `mod` y ==0) [1..(x-1)]
```

###Factorial:
```haskell
facts = map (\x-> (foldr (*) 1 [1..x])) [1..]
```

###Create an infinite tree:
```haskell
data Tree = Leaf | Node Int Tree Tree deriving Show
mkInfiniteTree = Node 0 (mkInfiniteTree) (mkInfiniteTree)
```

