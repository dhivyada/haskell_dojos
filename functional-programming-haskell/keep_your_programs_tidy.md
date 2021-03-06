> Part 4.2
#Keep Your Programs Tidy

####Scoping is an important way to keep your programs tidy. It involves limiting the region of the program in which names ‘exist’ and can be used.

In Haskell, a `let` expression provides local scope. A `let` expression has a series of equations defining variable values and a final expression (after the `in` keyword) that computes a value with those variables in scope.

Here is an example:
```haskell
let x = 2
in x*x
```
What will this expression evaluate to?

Ans =  4

Multiple variables can be defined in a single let
```haskell
let x = 2
y = 3
in x+y
```
What will this expression evaluate to?

Ans = 5

####Note that the variable names line up underneath one another This is good formatting practice, but is also needed for Haskell to interpret the code correctly. Like Python, whitespace is important in Haskell, certainly in let expressions anyway!

Sometimes in a `let`, one of the variables might depend on another — in the function below, `gallons` depends on `milespergallon`:

```haskell
journeycost :: Float -> Float -> Float
journeycost miles fuelcostperlitre = 
 let milespergallon = 35
     litrespergallon = 4.55
     gallons = miles/milespergallon
 in (gallons * litrespergallon * fuelcostperlitre)
```

Here’s a geometric example:

```haskell
let diameter = 2*radius
    circumference = pi*diameter
in (diameter, circumference)
```

By the way, `pi` is a defined constant in the `Haskell Prelude`.

####Where clauses
There is another syntax for introducing local variables, called the `where` clause. As we have seen, _Haskell is the Swiss army knife of programming languages: there are lots of ways of doing things_.

The `where` keyword, inside an equation, provides definitions for variables that are used in the equation.

Here are a couple of examples
```haskell
squareplusone :: Int -> Int
squareplusone x = xsquared + 1
  where xsquared = x*x
```
Note that `where` must be indented more than the start of the enclosing equation.

Like `let`, we can have multiple variables inside a `where` clause. Look at this temperature conversion function:

```haskell
-- converts Celcius to Fahrenheit
cel2fahr :: Float -> Float
cel2fahr x = (x*scalingfactor) + freezingpoint
 where scalingfactor = 9.0/5.0
       freezingpoint = 32
```
Again, notice that the variables defined in the `where` clause all line up underneath each other.

You might think `let` and `where` are very similar!

* Both introduce a local scope.
* Both allow any number of equations to be written.
* Both allow the equations to be written in any order, and variables defined in any equation can be used (“are in scope”) in the other equations.

However there are some important _differences_:


* `let` expressions are expressions; let can be used anywhere an expression is allowed.
* `where` clauses are not expressions; they can be used only to provide some local variables for a top level equation.

In which circumstances do you think it might it be better to use `let` instead of `where`? Or the other way round? Please write suggestions in the comments below.

* A useful article on this [https://wiki.haskell.org/Let_vs._Where](https://wiki.haskell.org/Let_vs._Where) 

* `Let` is an `expression`. so for example inside `lambda` functions you would be able to use `Let` but not `Where`. `Where` is bound to the syntactic structure, so they can be used across `guards` where `Let` cannot.

