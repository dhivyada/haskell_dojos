> Part 3.2

#Recursive Functions on Lists

###Computing with lists

* There are two approaches to working with lists:
    * Write functions to do what you want, using recursive definitions that traverse the list structure.
    * Write combinations of the standard list processing functions.
* The second approach is preferred, but the standard list processing functions do need to be defined, and those definitions use the first approach (recursive definitions).
* We’ll cover both methods.


###Recursion on lists

* A list is built from the empty list `[]` and the function <math xmlns="http://www.w3.org/1998/Math/MathML">
  
  <mi>c</mi>
  <mi>o</mi>
  <mi>n</mi>
  <mi>s</mi>
  <mstyle>
  <mspace width="0.278em"></mspace>
  </mstyle>
  <mo>::</mo>
  <mstyle>
  <mspace width="0.278em"></mspace>
  </mstyle>
  <mi>a</mi>
  <mo stretchy="false">&#x2192;</mo>
  <mo stretchy="false">[</mo>
  <mi>a</mi>
  <mo stretchy="false">]</mo>
  <mo stretchy="false">&#x2192;</mo>
  <mo stretchy="false">[</mo>
  <mi>a</mi>
  <mo stretchy="false">]</mo>
  </math>.
  In Haskell, the function `cons` is actually written as the operator (`:`), in other words `:` is pronounced as `cons`

* Every list must be either
    * `[]` or
    * <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mo stretchy="false">(</mo>
  <mi>x</mi>
  <mo>:</mo>
  <mi>x</mi>
  <mi>s</mi>
  <mo stretchy="false">)</mo>
  </math> for some `x` (the head of the list) and `xs` the tail
  where <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mo stretchy="false">(</mo>
  <mi>x</mi>
  <mo>:</mo>
  <mi>x</mi>
  <mi>s</mi>
  <mo stretchy="false">)</mo>
  </math>  is pronounced as <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>x</mi>
  <mstyle>
  <mspace width="0.167em"></mspace>
  </mstyle>
  <mrow data-mjx-texclass="ORD">
  <mi data-mjx-variant="-tex-mathit" mathvariant="italic">cons</mi>
  </mrow>
  <mstyle>
  <mspace width="0.167em"></mspace>
  </mstyle>
  <mi>x</mi>
  <mi>s</mi>
  </math>
* The recursive definition follows the structure of the data: 
    * Base case of the recursion is `[]`.
    * Recursion (or induction) case is <math xmlns="http://www.w3.org/1998/Math/MathML">
      <mo stretchy="false">(</mo>
      <mi>x</mi>
      <mo>:</mo>
      <mi>x</mi>
      <mi>s</mi>
      <mo stretchy="false">)</mo>
      </math>.

###Some examples of recursion on lists
####Recursive definition of length
The length of a list can be computed recursively as follows:
```haskell        
length :: [a] -> Int           -- function type
length [] = 0                  -- base case
length (x:xs) = 1 + length xs  -- recursion case
```
####Recursive definition of filter

* `filter` is given a `predicate` (**a function that gives a Boolean result**) and `a list`, and returns a list of the elements that satisfy the predicate.
```haskell 
filter :: (a->Bool) -> [a] -> [a]
```

Filtering is useful for the “generate and test” programming paradigm.

```haskell 
filter (<5) [3,9,2,12,6,4] -- > [3,2,4]
```
The library definition for `filter` is shown below. This relies on `guards`

```haskell
filter :: (a -> Bool) -> [a] -> [a]
filter pred []    = []
filter pred (x:xs)
  | pred x         = x : filter pred xs
  | otherwise      = filter pred xs
```
##Computations over lists

* Many computations that would be `for/while` loops in an imperative language are naturally expressed as list computations in a functional language. 
* There are some common cases:
    * **Perform a computation on each element of a list**: `map`
    * **Iterate over a list, from left to right**: `foldl`
    * **Iterate over a list, from right to left**: `foldr`
* It’s good practice to use these three functions when applicable
* And there are some related functions that we’ll see later

###Function composition

* We can express a large computation by “chaining together” a sequence of functions that perform smaller computations
1. Start with an argument of type `a`
2. Apply a function <math xmlns="http://www.w3.org/1998/Math/MathML">
   <mi>g</mi>
   <mo>::</mo>
   <mi>a</mi>
   <mo accent="false" stretchy="false">&#x2192;</mo>
   <mi>b</mi>
   </math> to it, getting an intermediate result of type `b`
3. Then apply a function <math xmlns="http://www.w3.org/1998/Math/MathML">
   <mi>f</mi>
   <mo>::</mo>
   <mi>b</mi>
   <mo accent="false" stretchy="false">&#x2192;</mo>
   <mi>c</mi>
   </math> to the intermediate result, getting the final result of type `c`
* The entire computation (first `g` then `f`) is written as <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>f</mi>
  <mo>&#x2218;</mo>
  <mi>g</mi>
  </math>.
* This is traditional mathematical notation; just remember that in <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mi>f</mi>
  <mo>&#x2218;</mo>
  <mi>g</mi>
  </math>, the functions are used in right to left order.
* Haskell uses . as the function composition operator
```haskell
(.) :: (b->c) -> (a->b) -> a -> c
(f . g) x = f (g x)
```  

###Performing an operation on every element of a list: map

* `map` applies a function to every element of a list
```haskell
    map f [x0,x1,x2] -- > [f x0, f x1, f x2]
```
####Composition of maps

* `map` is one of the most commonly used tools in your functional toolkit

* A common style is to define a set of simple computations using map, and to compose them.
```haskell
    map f (map g xs) = map (f . g) xs
```

This theorem is frequently used, in both directions.


###Recursive definition of map
```haskell
map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs
```
##Folding a list (reduction)

* An iteration over a list to produce a singleton value is called a fold
* There are several variations: folding from the left, folding from the right, several variations having to do with “initialisation”, and some more advanced variations.
* Folds may look tricky at first, but they are extremely powerful, and they are used a lot! And they aren’t actually very complicated.

###Left fold: foldl
* foldl is _fold from the left_
* Think of it as an iteration across a list, going left to right.
* A typical application is `foldl f z xs`
* The `z::b` is an initial value.
* The `xs::[a]` argument is a list of values which we combine systematically using the supplied function `f`
* A useful intuition: think of the `z::b` argument as an **“accumulator”**.
* The function `f` takes the current value of the accumulator and a list element, and gives the new value of the accumulator.
```haskell
  foldl :: (b->a->b) -> b -> [a] -> b
```

###Examples of foldl with function notation

```md
foldl f z [] ---> z
foldl f z [x0] ---> f z x0
foldl f z [x0, x1] ---> f (f z x0) x1
foldl f z [x0, x1, x2] ---> f (f (f z x0) x1) x2
```

###Examples of foldl with infix notation

In this example, `+` denotes an arbitrary operator for `f`; it isn’t supposed to mean specifically addition.

```haskell
foldl (+) z []          -- > z
foldl (+) z [x0]        -- > z + x0
foldl (+) z [x0,x1]     -- > (z + x0) + x1
foldl (+) z [x0,x1,x2]  -- > ((z + x0) + x1) + x2
```
###Recursive definition of foldl
```haskell
foldl        :: (b -> a -> b) -> b -> [a] -> b
foldl f z0 xs0 = lgo z0 xs0
             where
                lgo z []     =  z
                lgo z (x:xs) = lgo (f z x) xs
```
###Right fold: foldr
* Similar to `foldl`, but works from right to left
```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
```

###Examples of foldr with function notation
```md
foldr f z [] ---> z
foldr f z [x0] ---> f x0 z
foldr f z [x0, x1] ---> f x0 (f x1 z)
foldr f z [x0, x1, x2] ---> f (f x0 (f x1 z)) x2
```
###Examples of foldr with operator notation
```haskell
foldr (+) z []          -- > z
foldr (+) z [x0]        -- > x0 + z
foldr (+) z [x0,x1]     -- > x0 + (x1 + z)
foldr (+) z [x0,x1,x2]  -- > x0 + (x1 + (x2 + z))
```
###Recursive definition of foldr
```haskell
foldr            :: (a -> b -> b) -> b -> [a] -> b
foldr k z = go
          where
            go []     = z
            go (y:ys) = y `k` go ys
```
###Relationship between foldr and list structure
We have seen that a list `[x0,x1,x2]` can also be written as
```haskell
    x0 :  x1 : x2 : []
```

Folding `cons (:)` over a list using the empty list [] as accumulator gives:
```haskell
foldr (:)  [] [x0,x1,x2]
-- >
x0 :  x1 : x2 : []
```
This is identical to constructing the list using `(:)` and `[]` ! We can formalise this relationship as follows:

```haskell
foldr cons [] xs = xs
```

###Some applications of folds

```haskell
sum xs = foldr (+) 0 xs
product xs = foldr (*) 1 xs
```

We can actually “factor out” the `xs` that appears at the right of each side of the equation, and write:

```haskell
sum      = foldr (+) 0
product  = foldr (*) 1
```

(This is sometimes called “point free” style because you’re programming solely with the functions; the data isn’t mentioned directly.)

Another recursive definition of `Fold` as given in [https://wiki.haskell.org/Fold](https://wiki.haskell.org/Fold )
```haskell
foldl f z []     = z                  

foldl f z (x:xs) = foldl f (f z x) xs

--- Same thing for foldr:

foldr f z []     = z 

foldr f z (x:xs) = f x (foldr f z xs) 
```