> Part 3.9

#Define Your Own Data Types

So far we have looked at the basic built-in data types like Int and Boolean. We can combine these basic types to generate custom data types, using algebraic sums and products.

#Haskell Data types:

A `type` is a set of values that are related, a family of values that belong together.

So far we've seen the `Bool data type`, which consists of values `True and False`. 
```haskell
True :: Bool
False :: Bool
```
We've also used the `Int data type`, which consists of whole number values 

```haskell
1::Int
42::Int
-13::Int
minBound::Int
maxBound::Int
```
These values may differ depending on whether your OS is 32-bit or 64-bit
```haskell
maxBound :: Int
-- 9223372036854775807
minBound :: Int
-- -9223372036854775808
```

Next, we've looked at
```haskell
'a' :: Char
[1, 2, 3] :: Int List
("victoria", 1837) :: (String, Int)
```

We've looked at `function types` to describe argument and return types.

```haskell
inc :: Int -> Int
inc n = n + 1
```
Now, we want to think about `user-defined types`, creating `custom data types for our own programs`

#Sum data type
First, we'll consider a simple type that consists of `a finite set of alternative values`.

Apparently, in the Amazon Jungle, there is a tribe who count _one, two, many_. They have no distinct words for larger integers than two. We can represent this type in haskell as follows:

```haskell
data SimpleNum = One | Two | Many
```
`data` indicates that we're defining a new type. The name of the type and name of the values should start with `capital letters`. The alternative values are separated with a `vertical bar` character

Let us print these values:
```haskell
*Main> data SimpleNum = One | Two | Many
*Main> One

<interactive>:89:1: error:
    • No instance for (Show SimpleNum) arising from a use of ‘print’
    • In a stmt of an interactive GHCi command: print it
```
To print it out, add `deriving Show` to the type definition. `Show` is a type class. Any type must derive `Show` if we are to print out it's values
```haskell
*Main> data SimpleNum = One | Two | Many deriving Show
*Main> One
One
*Main> :t One
One :: SimpleNum
```
Let's write a function to convert from `Int` to `SimpleNum` values.

Use multiline support in `ghci` to type function over several lines.
`:set +m`

```haskell
*Main> let convert 1 = One
*Main|     convert 2 = Two
*Main|     convert _ = Many
*Main|
```
`convert` takes an input `Int`, a value that has a type belonging to the `Num` data class. And returns a `SimpleNum` output.
```haskell
*Main> convert 1
One
*Main> convert 300
Many
*Main> map convert [1..5]
[One,Two,Many,Many,Many]
```
That was a custom data type with alternative values, otherwise known as a `Sum` data type.

#Record Data type
Now, let's think about a `record` data type, that stores a portfolio of values.
Let's store `cricket scores`. When a team bats in cricket, you need to know two integer values - the first is the number of runs scored by the team, the second is the number of players who are eliminated.
E.g.: A good score for the New Zealand team might be 350 for 4 - 350 runs scored for the loss of 4 players.

We can represent this as a `Product` data type. 
```haskell
*Main> data CricketScore = Score [Char] Int Int deriving Show
*Main> let x = Score "New Zealand" 350 4
*Main|
*Main> x
Score "New Zealand" 350 4
*Main> :t x
x :: CricketScore
```
Score is a `type constructor` that takes a String and two Int arguments and returns a cricket score value.
* `type constructor` is similar to `Struct` in `Golang`.

#Algebraic data types
In general, these kinds of custom data types are called `algebraic data types`. The algebraic values relate to `algebraic sums` and the record values relate to `algebraic products`. This is part of `Type theory`.

#Summary: 
* We used the `data` keyword to define a custom data type
* Types must derive the `show` type class if you want to see the values printed out
* We use `vertical bars` to specify alternatives.
`... | Alternative1 | Alternative2 | ...` or `Sum` data types
* We used `type constructors` to build `record` types like score values in cricket. 
`Score [Char] Int Int` which are `product data types`
