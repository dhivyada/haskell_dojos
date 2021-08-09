> Part 2.4

`George Boole` introduced his laws of logic around 150 years ago. They form the basis for `modern digital logic`.

* Boolean Negation

Boolean values are either `True` or `False`. `True` is the opposite of `False`, and vice versa. The not function returns the opposite boolean value, the logical complement. Try `not True`

* Double Negation
  
e.g. `not (not False)` and observe that the final result is the same as the initial value.

* The And operator

Use the `&&` infix operator as a boolean conjunction (`AND` function). This only evaluates to `True` when both its inputs are `True`.i.e. `True && True`. `False && True` evaluates  to `False`

* The Or operator

Boolean disjunction (logical OR) is the dual of the AND operation. In Haskell, use the infix `||` operator for `OR`. When at least one of the inputs is `True`, then the output of `OR` will be `True`. Try `True || False`. `False || False` evaluates to `False`

* Exclusive OR

Haskell also defines the `xor` function, which returns true when its two boolean arguments are different (one is True and the other is False). Try 
```haskell
True `xor` False
```
(Notice that we specify `xor` as an infix function with the backquotes here.). We can also write 
```haskell
xor True False
```

* It's straightforward to enumerate the `full truth table` for two-input boolean functions. We could use a list comprehension expression to enumerate the input values: `[(x,y) | x<-[False, True], y<-[False, True]]`. Then we could map the boolean function over these input values (extracted from the pairs). 
  
For instance, here are the enumerated output values for the xor function: `map (\inputs -> xor (fst inputs) (snd inputs)) [(x,y) | x<-[False, True], y<-[False, True]]`.

* Logic Operations with More Inputs

Sometimes, boolean logic functions like `AND` and `OR` have more than two inputs. Haskell supports these `multi-input boolean operations` with `and` and `or` functions that take a list of boolean values as a single input. Effectively, this is a fold of the `&&` or `||` operator over the input list of boolean values.

Try `and [False, True, False, True]` or `or [True, True, False]`, for instance.

* `if` Expressions

You might be used to `if` statements in imperative programming languages. Haskell has `if` expressions, which evaluate to either the `then` value or the `else` value, based on the `if` value.
Try `if 2*2==4 then "happy" else "sad"`.

* The Haskell if expression is equivalent to the `?: ternary operator` in C-like languages. The first subexpression (after the `if`) must have type Bool, then the subsequent two subexpressions (after `then and else` respectively) must have the same type as each other.

What happens if we supply a non-Boolean value for the first subexpression? Try 
```haskell
if 1 then 0 else -1
-- returns error : Haskell tries to interpret the first subexpression as a Bool value, and fails
```

* There are other ways to have typing issues with if expressions, for instance when the then and else subexpressions have different types. Try 
```haskell
if False then 42 else "foo"
-- Once again, this if expression fails to evaluate because of type errors. Haskell detects that the then value and the else value have incompatible types, so it complains.
```

* It is possible to have two values that are similar, i.e. they could be specialized to the same type, based on their type classes. For instance, try 
```haskell
if True then 42 else pi
-- 42.0
-- :: Floating a => a
```

* Let's recap what we've just discovered:

    - Boolean `not, &&,|| and xor` operations
    - Boolean functions on lists
    - `if/then/else` conditional expressions