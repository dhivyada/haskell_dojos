> Part 2.6 & 2.7

#Introduction to I/0

* Computers interact with the outside world via `input and output (I/O)`. The Haskell programming language has specific support for `I/O` operations


* Haskell programs use the `I/O Monad` to interact with the `Input/Output`


* When a function is using input/output, it's type must contain `IO`


* The `IO Monad` ensures that the `input/output` operations occur in a `fixed sequence`. E.g. : We must check if the red button is pressed before we launch the missiles


* We can `write strings to console` using `putStrLn` and `reading character input from standard terminal` using `getLine`


* In most programming languages, the first thing you learn is how to print strings to the console — think PRINT in Basic
  or printf() in C. However input and output in Haskell are moderately complex, due to the `pure nature of the language`
  .


* The `read` and `show` functions are used for synthesizing `values from Strings and vice versa`


* ####Printing Strings:
    The Haskell function to print a character string to the terminal is called `putStrLn` (like `println` in `Java` or `print` in `Python`). Try printing a simple message like: `putStrLn "hello world"`
  

*  You can concatenate several strings with the `++` operator, and print out one long string -- make sure you put brackets around the code so putStrLn prints the entire string. For instance, try `putStrLn ("good " ++ "morning" ++ " everyone")`.


* Now let's read in a character string from user input, this is like `sscanf` in `C` or `input` in `Python`. Call the `getLine` function for this.


* Now let's chain together some input and output - with appropriate sequencing. We want to find the name of a person, then print out a personalized greeting. 
```haskell
  do { putStrLn "what is your name?"; x <- getLine; putStrLn ("hello " ++ x) }
```
The `do` block sequences `IO` actions.

* you can sequence IO operations with the `do` construct. Values are bound to variables using the `left arrow`. We could read this as `x gets a value from getLine`. Be aware that you can't use the standard assignment (with the `equals` operator) for `getLine`, since it is an `IO operation`.

Once we have got a value from `getLine`, and bound it to a variable, then we can do standard function calls on this value, and bind it to another variable -- for instance, let's turn a name into upper case: 
```
do { putStrLn "what is your name?"; n<-getLine; let nUpper = map toUpper n in putStrLn ("HELLO " ++ nUpper) }
```
We can import `toUpper` using `import Data.Char(toUpper)`

* The Read function

It is possible to read values as strings, and convert them into other types. This is like the `atoi` function in `C`. Try `read "42" :: Int`. You need the `::Int` type annotation otherwise it is not clear what type of number the input String is meant to represent.

* However `42` could also be a `floating-point` number, try `read "42"::Float`


* The `show` function is the dual of the read function. `show` takes a value and returns a String representation of that value. Try `show 42`.


* Notice that the returned value has the `String` type. Only `some types (those that derive Show)` can be `converted to Strings`


The `show` function allows arbitrary values to be printed. Try `putStrLn (show (6*7))`


* there is a single function called `print` that does the `composition of putStrLn and show` . try `print 42`

* Let's recap what we've discovered:

  - `getLine` and `putStrLn` for console input/output
  - using `do` to sequence IO actions
  - `<-` for binding values to variables with IO
  - `show` and `read` for converting from and to `String` values

    

