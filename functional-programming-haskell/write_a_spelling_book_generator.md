> Part 3.7

**Are you familiar with children’s alphabetical spelling books? They say things like: a is for apple, b is for baby, and c is for cat**

Now that you know about Haskell list functions, you can develop a function to generate the text for a spelling book, given a list of words.

Suppose the function is called `speller` then it should have the following type:

```haskell
speller :: [[Char]] -> [Char]
```
recalling that a list of `Char` elements is a `String` in Haskell.

Typical executions of the `speller` function would look like this:

```haskell
speller ["abacus"] -- > "a is for abacus"
speller [] -- > ""
speller ["apple", "banana", "coconut"] 
 -- > "a is for apple, b is for banana, and c is for coconut"
speller ["whisky", "x-ray"]
 -- > "w is for whisky, and x is for x-ray"
```

Your task is to develop the Haskell speller function. You are allowed to define small _helper_ functions, perhaps to generate a single letter’s phrase from a word: `f "zoo" -- > "z is for zoo"`. You are also allowed to use the standard Haskell list functions like `map` and `foldr` if appropriate.

Write your Haskell source code in a .hs file, and copy/paste it into the exercise activity below. At the end of this week, we will ask learners to peer-review submitted code anonymously, by comparing it with other submissions.

