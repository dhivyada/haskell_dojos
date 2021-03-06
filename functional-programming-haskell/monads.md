> Part 2.8

#I/O and a First Encounter with Monads:


Pure Functions

So far, we have concentrated on pure functions. These kinds of functions take values as arguments, do some processing of those values, then return a result value. A pure function does not depend on the ‘state of the world’. The computation is entirely self-contained and independent. Given the same arguments, a pure function will always return the same result.
I/O is Impure

Input and output (I/O) operations are impure. They influence and interact with the ‘outside world’. Essentially, this is the only way to make computers do interesting things.

So far we have looked at the getLine function, which reads input from the user and returns it as a special kind of String value — an IO String. We have also used the putStrLn function, which takes a String input and prints it to the terminal, returning an empty IO value, i.e. IO ().

The point of IO types is that we don’t want to mix up pure and impure functions — the type system keeps us honest. We know from a function’s type whether it is involved with I/O.
Sequencing Actions

Look at this simple function below.

let greet() = do
planet <- getLine
home <- getLine
putStrLn ("greetings " ++ planet ++ "ling.")
putStrLn ("I am from " ++ home ++ ".")
putStrLn "Take me to your leader."

In our tryhaskell web interpreter, you would need to enter it as a (very long!) one-liner:

do { planet <- getLine; home <- getLine; putStrLn ("greetings " ++ planet ++ "ling."); putStrLn ("I am from " ++ home ++ "."); putStrLn "Take me to your leader."}

Let’s try this out… copy and paste the one-liner into our tryhaskell online system. NB check there are no trailing space characters in your pasted expression — use backspace to remove them. Press enter to evaluate the one-liner, then at the > prompt type Earth (enter) then Mars (enter). You should then see:

greetings Earthling.
I am from Mars.
Take me to your leader.

Notice that the ordering is important here:

    we want the first getLine call to get the name of the planet we have landed on
    we want the second getLine call to get the name of where we are from.

Order of function evaluation doesn’t matter in pure code - e.g.

let a = reverse "winston"
b = reverse "churchill"
in "sir " ++ a ++ " " ++ b

Again, in tryhaskell, we should use a lengthy one-liner:

let a= reverse "winston"; b = reverse "churchill"  in "sir " ++a ++" "++ b

It doesn’t matter whether we do the first reverse before the second — the result of the expression is still the same. However this is not the case where I/O is concerned. Sequencing is vital for I/O actions.

One more thing to notice: inside the do, we associate results of IO functions with names using <-. Inside the let, we associate pure function results with names using =.
Monads are Hiding Below

The do notation allows us to sequence actions. This looks just like a sequence of commands in an imperative programming language. However, do is only syntactic sugar. Underneath, it is rewritten as a chain of function calls where the output of the first function becomes the input of the second function. The bind operator accomplishes this function sequencing. It is a key part of the IO monad. We are starting to scratch the surface of Haskell IO and discover it is highly complex. We will reserve discussion of Monads and bind operators for later in the course.
Summary

For now, all we need to understand is:

    I/O operations are impure
    use do to specify a sequence of actions
    use <- inside a do to associate input values with names
    any value or function that involves I/O has IO in its type
* `<-` is the `bind` operator
* a sequence of I/O actions is described as being _in the IO Monad_

