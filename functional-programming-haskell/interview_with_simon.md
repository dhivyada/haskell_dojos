> Part 3.12

#Interview with Simon Peyton Jones

* Haskell was the fruit of an international committee of about 20 people.
* It's one of the distinct languages to be designed by a group and being very successful in the long term.
* Haskell has a small conceptual core but it also has a lot of stuff around the outside. There is more than 1 syntax for doing things. There is `let` and `where`. There's `pattern matching` as well as `case expressions`. 
* Laziness - let us procrastinate as much as we have to. Let us not do any work unless it is absolutely needed. 
* John Hughes at Glasgow, wrote this very influential paper(`Why functional programming matters`). Lazy evaluation allows you to compose programs together in a way that you couldn't do before.
* You can write a program that generates all the possible moves in a game tree, that is an infinite tree. And separately, he walks over the tree and picks the right one.
* In an eager language, you'd have to meld those passes together into one.
* But in a lazy language, we can separate them. It's a powerful modularity mechanism.
* It's a powerful purity mechanism. It forces you to be pure, which retrospectively I think was the most important thing about it. 
* Over time, haskell has grown more strict. there are strictness annotations to allow the user more control over the evaluation order
* On the other hand, other strict languages have some kind of thunking mechanism to allow you to model lazy evaluation.
* Haskell is used in small startup companies - a company called `SchedMe` in `New York`, they use haskell for scheduling system.
* It's used in banks, `Standard Chartered` has a big haskell group. They write new spreadsheets in Haskell in Mu, which is a reimplementation of Haskell.
* Galois founded by John Launchbury is a successful company in the NorthWest United States. 
* Alice Miller is doing a lot of safety critical things in Haskell. They have a domain specific language for writing the control systems for cool quad copters. They write it in a very high level langugage which is essentially Haskell. And they compile that down to C which runs on the quad copter.
* Excel is Simon's second programming language. 
* Words of encouragement for novice functional programmers: 
    - particularly if you are used to writing imperative programs
    - Functional does feel a bit like rewiring your brain, which can feel a bit painful at first.
    - But the experience is once you come through the pain, you look at the entire functional programming
    - Haskell functional programming is like a radical and eloquent attack on the entire enterprise of writing programs.
    - It's not like.. well I'm going to switch syntax. It's just `C#` instead of `Java`
    - It's a whole different way of thinking about the problem.
    - And if you think about the complex problems, programs are the most complex artifacts that human beings have ever built. If you think about complex problems in a new way, that could shed a really new light on it.
    - One of the most interesting things about Haskell in particular is, it sticks remorselessly purely to central idea, which is a `programming with values and functions`, rather than with `mutation and side-effects`. Haskell is pretty remorselessly pure about that.
    - sometimes you do want to mutate things. and we do that with `monads`. when you want concurrent threads that are doing I/O in the world, that must be concurred, they must interact with each other in some stateful way
    - A good way to make them interact is using `transactional memory`. So, `transactional memory` is something that is hard to do in some imperative languages because every mutation of every memory location must be tracked. But in Haskell, because the mutation of the mutable locations are so carefully `partitioned in the type system` & a little bit awkward to get at as a programmer, then there are very few of them. So, transactional memory systems are efficient and effective. and they come out of the box with `GHC`.
    


SimonPJ mentioned that Excel is his 'second favourite programming language.' More info in a recent Microsoft podcast at [https://blubrry.com/microsoftresearch/76856095/120-advancing-excel-as-a-programming-language-with-andy-gordon-and-simon-peyton-jones/](https://blubrry.com/microsoftresearch/76856095/120-advancing-excel-as-a-programming-language-with-andy-gordon-and-simon-peyton-jones/) really interesting stuff!


Also available here [https://www.microsoft.com/en-us/research/podcast/advancing-excel-as-a-programming-language-with-andy-gordon-and-simon-peyton-jones/](https://www.microsoft.com/en-us/research/podcast/advancing-excel-as-a-programming-language-with-andy-gordon-and-simon-peyton-jones/)

