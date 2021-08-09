> Part 2.10

* Type `ghci` which is the interpreter for `Glasgow Haskell Compiler`

* The prompt will say `Prelude>` which says the standard Haskell library `Prelude` has been loaded

* Let's type a string

````haskell
Prelude> "Hi Everyone"
"Hi Everyone"
````

* Let's find the type 
````haskell
Prelude> :type "Hi Everyone"
"Hi Everyone" :: [Char]
````
Here `[Char]` is equivalent to `String`

* Some other types 

````haskell
Prelude> 42
42
Prelude> 1 + 1
2
Prelude> let x = 3
Prelude> x
3
Prelude> x + 1
4
````

* Functions on `strings` 
````haskell
Prelude> length "hi everyone"
11
Prelude> reverse "hi everyone"
"enoyreve ih"
````

* Single line functions can be defined using `let` and give the single line definition here with `ghci`
````haskell
Prelude> let fact n = if n == 0 then 1 else n *fact(n-1)
Prelude> fact 0
1
Prelude> fact 3
6
Prelude> fact 5
120
````

* It might be that we need to `load` a `haskell source code` file into `ghci`. You can use `relative path name` (relative to the directory that `ghci` is running in), or you can use `absolute path name` as well. `:t` is shorthand for the `:type` command. You can quit by typing `:quit` or `Ctrl + D`

````haskell
Prelude> :load functional-programming-haskell/exercises/factorial.hs
[1 of 1] Compiling Main             ( functional-programming-haskell/exercises/factorial.hs, interpreted )
Ok, one module loaded.

*Main> fact2 10
3628800

*Main> :type fact2
fact2 :: Int -> Int

*Main> :t fact2
fact2 :: Int -> Int

*Main> map fact2 [1..10]
[1,2,6,24,120,720,5040,40320,362880,3628800]

*Main> :load functional-programming-haskell/exercises/factorial.hs
[1 of 1] Compiling Main             ( functional-programming-haskell/exercises/factorial.hs, interpreted )
Ok, one module loaded.

*Main> map fact3 [1..10]
[1,2,6,24,120,720,5040,40320,362880,3628800]

*Main> fact3 (-1)
*** Exception: stack overflow

*Main> :quit
Leaving GHCi.
````

* Let us do some I/O. `+m` is for `multiline`
````haskell
Prelude> putStrLn "hello"
hello
Prelude> do x <- getLine

<interactive>:2:4: error:
    The last statement in a 'do' block must be an expression
      x <- getLine
Prelude> 
Prelude> set +m
Prelude> do x <- getLine
Prelude|    putStrLn ("hello " ++ x)
Prelude|
dhivya
hello dhivya      
````

* Let's create a new file called `nobles.hs`. `:l` is short for `:load`
````haskell
Prelude> :l functional-programming-haskell/exercises/nobles.hs
[1 of 1] Compiling Main             ( functional-programming-haskell/exercises/nobles.hs, interpreted )
Ok, one module loaded.
*Main> mknoble "Alex Ferguson"
"Sir Alex Ferguson"
````

```haskell
*Main> :load functional-programming-haskell/exercises/nobles.hs
[1 of 1] Compiling Main             ( functional-programming-haskell/exercises/nobles.hs, interpreted )
Ok, one module loaded.
*Main> makeNobleGeneric False "Alex Ferguson"
"Sir Alex Ferguson"
*Main> makeNobleGeneric True "Helen Mirren"
"Dame Helen Mirren"
*Main> :t makeNobleGeneric
makeNobleGeneric :: Bool -> String -> String
```
```haskell
Prelude> :load functional-programming-haskell/exercises/nobles.hs
[1 of 1] Compiling Main             ( functional-programming-haskell/exercises/nobles.hs, interpreted )
Ok, one module loaded.
*Main> makeNobleRefactored Male "Alex Ferguson"
"Sir Alex Ferguson"
*Main> makeNobleRefactored Female "Helen Mirren"
"Dame Helen Mirren"
```
