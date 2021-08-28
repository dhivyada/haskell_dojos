> Part 5.7

#Curry is on the menu

##Partial Application and Currying

* ###Currying

####Consider a type signature of a function with three arguments:

```haskell
 f :: X -> Y -> Z -> A
```

The arrow “->” is `right-associative`, so this is the same as:

```haskell
    f :: X -> (Y -> (Z -> A))
```

What this means is that we can consider `f` as a `function` with `a single argument` of type `X` which returns a `function` of type `Y->Z->A`.

The technique of rewriting a `function of multiple arguments into a sequence of functions` with a single argument is called `currying`. We can illustrate this best using a lambda function:

```haskell
    \x y z -> ...
    \x -> (\y z -> ...)
    \x -> (\y -> (\z -> ... ))  
```

The name “currying”, is a reference to logician `Haskell Curry`. The concept was actually proposed originally by another logician, `Moses Schönfinkel`, but his name was not so catchy.

* ###Partial application

Partial application means that we don’t need to provide all arguments to a function. For example, given 

```haskell
    sq x y = x*x+y*y
```

We note that function application associates to the left, so the following equivalence holds

```haskell
sq x y = (sq x) y
```

We can therefore create a specialised function by partial application of x:

```haskell
sq4 = sq 4 -- = \y -> 16+y*y
sq4 3 -- = (sq 4) 3 = sq 4 3 = 25
```

This is why you can write things like:

```haskell
    doubles = map (*2) [1 .. ]
```

* We are going to introduce two new concepts that are `slightly more advanced`. 

* And they are currying and partial application. 

* So consider the function signature like this, where we have a type X, Y, Z, and return value of type A. 

```haskell
 f :: X -> Y -> Z -> A
```

* So this is a function that takes three arguments of three different types and produces a return value of type A. 

* However, the `arrow -> ` here in this type signature is meaningful. And also, it has a certain associativity. In fact, `it associates to the right`.

* And that means that, actually, we can write this expression also like this, which means that we actually can consider `f` as a function that takes an element of `type X` and returns a function of `(Y -> (Z -> A))`. 

* Similar, this return function, Y, can be considered both as a function of `(Y -> Z) -> A` or a function of `(Y-> (Z ->A))`. 

* So this idea that `you can always rewrite the function of a single argument returning another function` is called `currying`. 

* To illustrate this on an actual function, it’s easiest to use `lambda functions`. So suppose we have a `lambda` function of X, Y, and Z, and function body is completely irrelevant. 
```haskell
    \x y z -> ...
    \x -> (\y z -> ...)
    \x -> (\y -> (\z -> ... ))  
```
* Then to rewrite this, so that this becomes a function of a `single argument`. 

* We create a new lambda function, which is this one `\x -> (\y z -> ...)`. So the body remains completely untouched. 

* And we can rewrite this inner function once more. `\x -> (\y -> (\z -> ... ))`

* `And in this way, we have created a function of a single argument which returns a function of a single argument which returns a function of a single argument, which eventually returns the value.`

* So this is the typical technique known as `currying` you use `to transform multi-argument functions into single argument functions`. 

* So it’s named after the logician Haskell Curry. But actually, he wasn’t the first to invent this. The first one to invent this technique was called Moses Schonfinkel, another logician. But well, his name wasn’t so catchy, so they decided to go with currying. 

* `Another concept closely related to currying is that of` `partial application`. 

* For example, consider the function `sq`, which takes X and Y and returns the sum of the squares. 
```haskell
    sq x y = x*x+y*y
```
* This function can actually, again, be slightly rewritten as – because the `function application`, actually, is `left associative`. 
```haskell
sq x y = (sq x) y
```
* That means that what we have here is a function in its own right that operates on `y`. 

* So we can do other things like, for instance, say .. Let’s define `sq 4` as `sq4`. And now `sq4` is a new function which just takes one argument. 

```haskell
sq4 = sq 4 -- = \y -> 16+y*y
sq4 3 -- = (sq 4) 3 = sq 4 3 = 25
```

* If we now call `sq4` on value `3`, it will return `25`. This is an example of `partial application`. So basically, we’ve applied `4` to the function argument `x`, but we haven’t applied anything to `y`, and the result is a `new function`. And then we can use this new function for doing our computation. 

* So this technique of `partial application` is really used a lot in functional programming in Haskell, and it’s the reason why you can write things, for instance, like this.

```haskell
    doubles = map (*2) [1 .. ]
```

* So here, the `*2` is `partial application of the function multiplication` that we use as an operator here, so it takes two arguments and returns an argument. 
```haskell
(*) :: Num a => a -> a -> a
```
* We have applied it partially, using the `2`. We get a `new function`, which we can use in the `map`, because `map requires functions with a single argument`. And so we have a function that `doubles the elements of a list`.

```haskell
map :: (a -> b) -> [a] -> [b]
```

* So this was just to give you `a quick intuition` on `these key concepts` of `currying and partial application`. 

