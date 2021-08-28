> Part 4.1

####Until now, most of our Haskell programs have been fairly small. This week, we will focus on techniques for developing larger, non-trivial programs.

We will explore various ways to structure programs in Haskell, ideally to make the code more readable. We present an example text parser that uses the `Parsec` library. Finally, we will advocate the use of automated testing with the `QuickCheck` tool

###2 topics:
* some more advanced patterns of computation based on using functions as values
* E.g.: We'll look at `parsing`. `Parsing` is the process of analyzing text of a natural language or programming language according to the rules of formal grammar.
* You will learn to use `parsec`. You will learn to use the Haskell library built out of `monadic parser combinators`
* This might sound fairly complicated, but it's just a way of combining tiny building blocks into very powerful parts.
* Next topic is `program structure`. When you start building more complicated programs, then you have to start thinking a bit more carefully about how you structure your program. 
* We will first look at `program scope`. And `scoping` is the real key feature that you used to create modular programs.
* And then we will look at `conditionals`. You have already learnt the `if-then-else` conditional. But sometimes, that's not really the best way to structure the program with conditional expressions. And therefore Haskell provides you with a large number of alternatives. And we will visit all of them.
