> Part 3.4

#Computing with lists

There are two approaches to working with lists:

* Write functions to do what you want, using recursive definitions that traverse the list structure.
* Write combinations of the standard list processing functions.

The second approach is preferred, but the standard list processing functions do need to be defined, and those definitions use the first approach (recursive definitions).We’ll cover both methods.

#Recursion on lists

As we have already seen, a list is built from the empty list `[]` and the function `cons` or in operator form `(:)`.

Every list must be either `[]` or `(x:xs)` for some `x` (`the head of the list`) and `xs` (`the tail`), where `(x:xs)` is an alternative syntax for `cons x xs`

The recursive definition follows the structure of the data:

* Base case of the recursion is `[]`.
* Recursion (or induction) case is `(x:xs)`.

However, in order to create such recursive definitions, we must first see how we can create `conditional functions`: `functions that define both the base case and the induction case`.

#Defining conditional functions

In Haskell, there are several ways to define conditional functions. The easiest way is to write a definition for each case, as is done in the notes, e.g.

```haskell
length [] = 0
length x:xs = 1 + length xs
```

Unfortunately, this style does not work in the web-based environment because it only supports _single-line expressions_. However, there are other ways. The most straightforward is to use an _if-then-else_ expression:

```haskell
length lst =
if lst == []
then 0
else let x:xs = lst in 1 + length xs
```

Alternatively, you can use what is known as **"guards"**, e.g.
```haskell
length lst
| lst == [] = 0
| otherwise = let x:xs = lst in 1 + length xs
```

This is particularly useful if you have many conditions (similar to a **"case"** statement in other languages)

Finally, you can use multi-line functions using the where-clause and semicolons:

```haskell
f = f' where f' 1 = 0; f' x = x + f' (x-1)
```

All of these can be written on a single line so you can use them in the web-based environment. So ho ahead and define your own length function, and try it out: `length ['a','c' .. 'w']`

```haskell
length = length' where length' [] = 0; length' (x:xs) = 1 + length' xs
--- length ['a','c' .. 'w']
--- 12
```

#Recursive definition example: filter

The function `filter` is given a predicate (a function that gives a Boolean result) and a list, and returns a list of the elements that satisfy the predicate.

Filtering is useful for the **“generate and test”** programming paradigm.

Try this `filter (<5) [3,9,2,12,6,4]` `-- > [3,2,4]` or create your own example.

* Now define your own filter function and use it to filter the example list `[3,9,2,12,6,4]`.

####My implementation:
```haskell
filter = filter' where filter' f [] = []; filter' f (x:xs) = if (f x == True) then (x:(filter' f xs)) else (filter' f xs);
```

####A possible recursive definition is:

```haskell
filter pred lst
| null lst = []
| otherwise = if pred x
then x:filter pred xs
else filter pred xs
where x:xs=lst
```

####Or on a single line: 

```haskell
filter pred lst | null lst = [] | otherwise = if pred x then x:filter pred xs else filter pred xs where x:xs=lst
```

####Let's recap what we've learned:

* Computing with lists and recursive functions
* Defining conditional functions in a variety of ways
* Computations over lists using filter
