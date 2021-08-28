#Lazy is Good

####Laziness is a key feature of the Haskell programming language. 

* The main idea is that we only _evaluate_ expressions `when they are actually needed`. 
* Unlike Haskell, most programming languages implement `eager evaluation`.

* In real life, laziness is frowned upon and considered to be a bad thing. 
* However, in programming languages `laziness` is a feature and may be considered a good thing. 
* Haskell is a `lazy` language. This means that the evaluation of expressions is delayed until their values are actually needed. 
* The opposite is `eager evaluation`, which is what most programming languages implement, like C, Java, and Python. 
* For instance, consider this expression– `f(1+1)`, given this function definition `f x = 0`. In an eager language, the calculation `(1+1)` is done when the function `f` is invoked. This is `call by value`. 
* Whereas in a lazy language, like Haskell, the calculation `(1+1)` is only done when the parameter value is used in the function body, known as `call by need`.
* So in a `lazy` language, `if a parameter value is never needed then the parameter is never evaluated`. Consider
```haskell
f: Int -> Int -> Int
f x y = y
```
* then `f(1+ 1)(2+2)` has value `4` and the calculation of `1+1` is never performed. Formally, we say the function `f` is `strict` `in its second argument`. 

* Some values do not terminate when we try to evaluate them. 
* The simplest `non-terminating` value is called [bottom](https://wiki.haskell.org/Bottom), written in mathematical notation '⊥' as shown here. Its recursive definition in Haskell is `bot = bot`.

* A function is `strict` in its argument if when we supply bottom as that argument the function `fails to terminate`.
* `f bot 42` `terminates fine` since we never evaluate the first argument
* `f 42 bot` loops `forever`, or at least until we press Ctrl-C in the GHC interactive console. 

#Infinite data structures:
####Laziness is a very useful when dealing with infinite data.

* For example, think of the infinite list of `1` values. 
* That’s an infinite list where each element is the integer `1`. We can define this in `GHCi` as follows. 
```haskell
ones = 1 : ones
--- See the `recursive nature` of the definition here
```  
* What value is returned by `head ones`? 
```haskell
head ones
-- output = 1
-- Simply the integer value one. 
```
* What value is returned by `tail ones`?
```haskell
tail ones
-- output = [1, 1, 1, .........
-- An infinite list 
-- I need to press Ctrl-C to interrupt this printing and evaluation of the expression
```
* The same is true if I just try to evaluate the whole expression `ones`. 
```haskell
ones
-- output = [1, 1, 1, .........
-- I get another infinite list of one values. 
-- I need to press Ctrl-C to interrupt this printing and evaluation of the expression
```  
* The `take` function selects a `finite number` of elements from the front of a `potentially infinite list`. 
* So let’s say 
```haskell
take 3 ones
-- output: the finite list of 3 one values
```
* The `drop` function `drops elements from the front of the list` and `returns the rest of the list`. 
```haskell
drop 3 ones
-- output = [1, 1, 1, .........
-- Again, it’s infinite so I’m going to press Ctrl-C to interrupt the evaluation.
```

#In Summary:
* if computations are not needed, then they won’t be evaluated - `call by need`
* And, we can compute with infinite data structures so long **as we don’t traverse the structure infinitely**. 
 