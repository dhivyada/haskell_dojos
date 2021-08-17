> Part 3.5

We will explore the behaviour of **foldl** and **foldr** in some detail. We will also investigate function composition with the `.` operator. This leads onto _point free_ style.

This tutorial introduces some more advanced computations with lists. You will learn how to create and use recursive functions to traverse lists.

This tutorial consists of the following sections:

* Computations with lists
* Function composition
* Folding a list (reduction)
* Point-free style 

#Computations over lists

Many computatations that would be for/while loops in an imperative language are naturally expressed as list computations in a functional language.

There are some common cases:

* Perform a computation on each element of a list: `map`
* Iterate over a list, from left to right: `foldl`
* Iterate over a list, from right to left: `foldr`

It’s good practice to use functions like `filter` and these three functions when applicable.Let's look at maps and folds in some more detail.

#Function composition

As explained in the notes, we can express a large computation by “chaining together” a sequence of functions that perform smaller computations using the (.) operator, e.g. `f . g`. This operation is particularly useful in the composition of map operations. A common style is to define a set of simple computations using map, and to compose them.

The following relationship is very useful to refactor your code:

`map f (map g xs) = map (f . g) xs`

This theorem is frequently used, in both directions. For example, if we want to take a list of numbers and perform two operations on each number, we could write:

`map (+5) (map (*3) [1..10])`

But we could equally write:

`map ((+5) . (*3)) [1..10]`

#Folding a list (reduction)

An iteration over a list to produce a singleton value is called a `fold`. There are several variations: folding from the left, folding from the right, several variations having to do with “initialisation”, and some more advanced variations.

Folds may look tricky at first, but they are extremely powerful, and they are used a lot! And they aren’t actually very complicated.

The left fold (`foldl`) processes the list from the left. Think of it as an iteration across a list, going left to right. 

A typical example is e.g.
`foldl (\acc elt -> elt:acc) "" "Reversing a string"`
which unsurprisingly reverts a string.

The right fold (`foldr`) is similar to foldl, but it works from right to left. 

Some typical examples are:
`sum xs = foldr (+) 0 xs` and
`product xs = foldr (*) 1 xs`

What happens if you replace foldl with foldr in the string reversal example?
```haskell
foldl (\acc elt -> elt:acc) "" "Reversing a string"
--- "gnirts a gnisreveR"
```
```haskell
foldr (\acc elt -> elt:acc) "" "Reversing a string"
```
The result is an error, because `foldr` and `foldl` expect different types of functions:

* `foldl` expects a function that takes as first argument the accumulator and as second argument the element of the list. The type signature is
```haskell
    foldl ::  (a -> b -> a) -> a -> [b] -> a
```

* `foldr` expects them in the opposite order, its type signature is
```haskell
    foldr ::  (a -> b -> b) -> b -> [a] -> b
```
So go ahead, change the order and try again. What do you get?
```haskell
foldl (\acc elt -> elt:acc) "" "Reversing a string"
```

```haskell
foldr (\elt acc -> elt:acc) "" "Reversing a string"
--- "Reversing a string"
```
As you can see, you get the same string back, no reversal occured. Can you change the definition to get a reversed string with foldr?
```haskell
foldr (\elt acc -> elt:acc) "" "Reversing a string"
```
```haskell
foldr (\elt acc -> acc++[elt]) "" "Reversing a string"
--- "gnirts a gnisreveR"
```

#Point-free style

We can actually “factor out” the xs that appears at the right of each side of the equation, and write:
```haskell
sum = foldr (+) 0

product = foldr (*) 1
```

This is called "point free" style,it means that you're programming solely with the functions; the data isn't mentioned directly.

Try this out for yourself and see if you can define other functions using this style.

```haskell
concat = foldr (++) ""
--- concat ["a", "b", "c"]
--- "abc"
```

In this tutorial you've learned to:

* Do computations over lists using `map`, `foldl` and `foldr`
* Program in `point-free style`


**While writing your own recursive functions, it is important to think very carefully about the base case and the induction case.**

**The induction case needs to ‘shrink’ the size of the data somehow — so it eventually gets down to the base case.**

* Folds are more powerful than maps (indeed, map is just a special case of fold). 

> Part 3.8

#Summary

The basic mechanism for computing on any data structure in Haskell is `recursion`. Recursion always has a `base case` and an `induction case`. For lists, the base case is the empty list `[]`, the induction case is adding an element to the list `x:xs`

For list operations, it is usually easier to use higher-order functions like `map` (performing an operation on every element of a list) and `foldl/foldr` (reducing a list to a single value). Sometimes these functions are referred to as `list combinators`.