> Part 4.3

#Guards, Guards!

####Haskell provides a notation for defining functions based on predicate values.

```haskell
f x
  | predicate1 = expression1
  | predicate2 = expression2
  | predicate3 = expression3
```

For instance, the _absolute_ value of a number is its magnitude, i.e. ignoring its sign. You could define a function to calculate the absolute value with an `if/then/else` conditional.

```haskell
absolute x = if (x<0) then (-x) else x
```

or with guards

```haskell
absolute x
  | x<0 = -x
  | otherwise = x
```

* Notice how there is no `equals` sign on the first line of the function definition — but `there is an equals sign after each guard`.
* The `otherwise` guard should always be last, it’s like the `default` case in a C-style switch statement.
* `Guards` are easier to read than `if/then/else` if there are _more than two conditional outcomes_.

For instance, think about scoring in the sport of Golf. For a single hole, a player takes a number of strokes. There is a ‘par’ score for the hole, which is the expected number of strokes.

```haskell
holeScore :: Int -> Int -> String
holeScore strokes par
  | strokes < par = show (par-strokes) ++ " under par"
  | strokes == par = "level par"
  | strokes > par = show(strokes-par) ++ " over par"
```

How could we tidy this up? Maybe we could turn the final guard into `otherwise` and also refactor with a `where` clause.

```haskell
holeScore :: Int -> Int -> String
holeScore strokes par
  | score < 0 = show (abs score) ++ " under par"
  | score == 0 = "level par"
  | otherwise = show(score) ++ " over par"
 where score = strokes-par
```

Notice that the `score` variable defined in the `where` clause is _in scope for all three guards_.

###Case expressions:

Recall from last week how we defined algebraic data types like binary trees. A value with an algebraic data type may have one of several different forms — such as a `Leaf` or a `Node`, in the case of `Tree` structures. Therefore to process such a value we need several segments of code, one for each possible form. The `case` expression examines the value, and chooses the corresponding clause. It’s like a guard, but it selects based on the form of the value, i.e. it does `pattern matching`.

Here is a `sum data type` for my pets.
```haskell
data Pet = Cat | Dog | Fish
```

And here is how I greet my pets.

```haskell
hello :: Pet -> String
hello x = 
  case x of
    Cat -> "meeow"
    Dog -> "woof"
    Fish -> "bubble"
```

Note that each pattern is followed by an arrow and then a value. Also note that _each pattern is vertically aligned_. _**Indentation really matters in Haskell!**_

OK, now suppose we want to make the data type a bit more sophisticated . Let’s add a `Parrot` with a `String` name.

```haskell
data Pet = Cat | Dog | Fish | Parrot String

hello :: Pet -> String
hello x = 
  case x of
    Cat -> "meeow"
    Dog -> "woof"
    Fish -> "bubble"
    Parrot name -> "pretty " ++ name
```

Now the pattern includes a variable, which is associated with the **concrete value** for the Parrot’s name.

```haskell
hello (Parrot "polly")
-- "pretty polly"
```
In the same way as there is a `catch-all` case for guards (`otherwise`), we can have a `catch-all` pattern for a case. It’s the underscore character, `_` which means ‘don’t care’ or ‘match anything’

So we could redefine `hello` as:
```haskell
hello :: Pet -> String
hello x =
  case x of
  Parrot name -> "pretty " ++ name
  _ -> "grunt"
```

How would you rewrite an `if` expression as a `case` expression? In fact, this is what happens in the core language. The `if` expression is just `syntactic sugar` that is **rewritten automatically**. Can you think of any more examples of syntactic sugar in Haskell? Please add your thoughts in the comments section below.

> Useful comments:

* A curiosity: "otherwise" is a variable defined in the Prelude as

```haskell
otherwise = True
```

This is why an `otherwise` guard will always return `True`, regardless of the parameters.

