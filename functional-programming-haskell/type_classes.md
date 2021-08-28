#Type Classes

Inevitably, we have glossed over some of the more complex parts of Haskell while we have been introducing the language. Now it’s time to explore one of the ideas we have bumped into on several occasions already — `type classes`.


* What’s the type of 42? Either `:type 42` into `ghci`
```haskell
:t 42
-- 42 :: Num p => p
```
You should get back `Num a => a` — whereas you might have thought the answer should be `Int`. The `Num` is a type class, which specifies a family of types including integer and floating-point types.

We also anticipated type classes when we used the `deriving Show` clause to print out our custom data types. Now it’s time to explain type classes in more detail. 

* In any high level programming language, there are many number like types. 
* In haskell, we have seen `Int`, `Float`, `Integer` (these have infinite precision, like BigIntegers in Java)
* **Key insight:** Many arithmetic functions can be applied to values from any number like type. E.g. : Addition or multiplication
```haskell
Prelude> 2+2
4
Prelude> 2+pi
5.141592653589793
Prelude> 2*2
4
Prelude> 2*pi
6.283185307179586
```
* This is where the notion of type-classes comes in handy.
* **Type class is a family of types which provides an implementation for common functions**
* Let's hav a look at the type of `+`
```haskell
Prelude> :type (+)
(+) :: Num a => a -> a -> a
```
This means, given a type `a` belonging to the `Num` type class, then the `+` function takes 2 `a` parameters and returns an `a` result. `a` is a type variable.  
* The part of the type before the `=>` here is called the `context` of the type.
* This expresses type class membership for type variables like `a`
* So, a `typeclass` is a generalized family of similar types.
* Let's look at some other type classes. The `eq` type class means we can compare values of such types with the `==` operator.
```haskell
Prelude> :type (==)
(==) :: Eq a => a -> a -> Bool
Prelude> 1 == 1
True
```
* So `Int` is an instance of the `Eq` type classes
* The `Ord` type class means we can order values of such types with relational operators like less than and greater than.
* The `Ord` type class requires members to implement relational operators like `<` and `>`
```haskell
Prelude> :type (<)
(<) :: Ord a => a -> a -> Bool
```
* This is like `IComparable` interface in `C#`
```haskell
Prelude> "aaron" > "aardvark"
True
```
* The `Show` type class requires members to implement the `show` function
* The `Show` type class means we can generate values that represent values of such types. Like `toString` in `Java`
* When we say `show 42`, I get back a string `"42"`
```haskell
Prelude> show 42
"42"
Prelude> show False
"False"
```
* The `Read` typeclass means we can generate values of such types from the string values. It is like a `parse` method.
```haskell
Prelude> read "1"
*** Exception: Prelude.read: no parse
Prelude> read "1"::Int
1
Prelude> read "True"::Bool
True
```
* To specify that a type belongs to a type class, we will use the `Deriving` clause in the type definition. 
* Let's go back to our `SimpleNum` class
```haskell
Prelude> data SimpleNum = One | Two | Many deriving (Show, Read)
--- (Show, Read) is a set of type classes to implement
```
* This means we can convert `SimpleNum` valus into `strings` using the `show` function and vice versa using `read` function.

```haskell
Prelude> show One
"One"
Prelude> show Two
"Two"
Prelude> show Many
"Many"
-- in each case we return a string
```

```haskell
Prelude> read "One"
*** Exception: Prelude.read: no parse
Prelude> read "One"::SimpleNum
One
```
```haskell
Prelude> One == One

<interactive>:58:1: error:
    • No instance for (Eq SimpleNum) arising from a use of ‘==’
    • In the expression: One == One
      In an equation for ‘it’: it = One == One
Prelude> data SimpleNum = One | Two | Many deriving (Show, Read, Eq)
Prelude> One == One
True
Prelude> One == Two
False
```
* After deriving `Eq` class, we are able to equate 2 SimpleNum values.
```haskell
Prelude> One == "One"

<interactive>:62:8: error:
    • Couldn't match expected type ‘SimpleNum’
                  with actual type ‘[Char]’
    • In the second argument of ‘(==)’, namely ‘"One"’
      In the expression: One == "One"
      In an equation for ‘it’: it = One == "One"
```

* The above error message is because `SimpleNum` are of a different type than `String`
* There is a default implementation of `SimpleNum` which is used to compare `SimpleNum`
* There is a mechanism for defining typeclass implementations.

##Summary:
* Type classes were one of the early innovations of the haskell programming language.
* A Type class constrained member types (instances) to conform to certain type signatures effectively(an API constraints)
* This is a little like Object-Oriented Programming.
* `Type classes` are like `Interfaces` in `C# and Java`
* Types in the type class are like concrete implementations of interfaces
* Type classes provide a neat mechanism to provide `operator overloading` in Haskell language
* We've seen this with functions like `==`, relational operators and `show` and `read` functions.