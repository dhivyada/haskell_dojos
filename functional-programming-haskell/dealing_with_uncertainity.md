> Part 4.4

#Dealing with Uncertainty

####What do we do when computations fail to generate results? Examples include taking the head of an empty list, or finding the minimum value of a tree which turns out to be a Leaf.

Haskell provides `Maybe` values, which allow us to denote missing results with `Nothing`. This is `type-safe`, so much better than `null` in C-like languages. `Maybe` is like `Option` in Scala.

###Maybe:
* Haskell provides several mechanisms for handling computations that fail.
* First and the simplest mechanism is called `Maybe`
* Let's think about how a computation might fail.
* Imagine trying to process a list somehow. Say,

```haskell
process (x:xs)
-- Take the first element of the list. 
-- And you are given an empty list ❌. 
-- There isn't any first element
```
* Or imagine dividing 2 integers and the divisor is zero
```haskell
x `div` y
-- let x = 1
-- let y = 0
```
* We need a way to capture whether or not such a computation has succeeded or whether it's failed.
* This is the job of `Maybe`
* `Maybe` indicates success or failure of a computation
* Let's have a look at this data type. It's defined in the Haskell `prelude` - The standard library for Haskell
* You can refer to the `hackage` site which is the official documentation platform. [https://hackage.haskell.org/package/base-4.15.0.0/docs/Prelude.html](https://hackage.haskell.org/package/base-4.15.0.0/docs/Prelude.html)
* We can click on the `source` for `Maybe`
```haskell
data Maybe a = Nothing | Just a
  deriving (Eq, Ord)
-- the above is an algebraic data type 
-- type class Eq for equality
-- ord for comparison 
```
* Let's have a play with `Maybe`
* Imagine we want to find a function to find the maximum value of the list. Perhaps a list of integers.
* Let's start off by defining the `maxHelper` function
```haskell
*Main> maxHelper :: Int -> [Int] -> Int
*Main> maxHelper x [] = x
*Main> maxHelper x (y:ys) = maxHelper (if x > y then x else y) ys
```
```haskell
-- maxFromList : Takes an integer list and returns the max value from that list
maxFromList :: [Int] -> Maybe Int
maxFromList [] = Nothing 
maxFromList (x:xs) = Just (maxHelper x xs)
```
**Note:**
```haskell
*Main> :reload
-- used to reload the file that was loaded last
```

```haskell
*Main> maxFromList [1, 2, 3]
Just 3
*Main> maxFromList []
Nothing
```
* `Maybe` type means that the `type-checker` guarantess that the client code will check the result of the computation. Probably with a `case` expression. This is much more robust than C error codes.

* Once we've generated `Maybe` values, how do we propagate them in programs? Perhaps by using a lot of case statements? But surely there must be a better way. And there is. `Monads`!

####How to map functions over Maybe values:

```haskell
*Main> let inc = (1+)
*Main> :type inc
inc :: Num a => a -> a
*Main> inc 1
2
*Main> inc (Just 1)

<interactive>:105:1: error:
• Non type-variable argument in the constraint: Num (Maybe a)
(Use FlexibleContexts to permit this)
• When checking the inferred type
it :: forall a. (Num a, Num (Maybe a)) => Maybe a
```
* So, we understand that `inc` doesn't work on `Maybe` values
* However if we use the `fmap` function, which is a `higher order function`
```haskell
*Main> fmap inc (Just 1)
Just 2
*Main> :type fmap
fmap :: Functor f => (a -> b) -> f a -> f b
*Main> fmap inc (Just 2)
Just 3
*Main> fmap inc Nothing
Nothing
```
* `fmap` allows the `inc` to be applied to the value inside the `Maybe`. So `Just 1` now becomes `Just 2`
* 


