> Part 2.9

#Installing Haskell for Yourself


**GHC stands for the ‘Glasgow Haskell Compiler’. This is actually a set of components that allow you to execute Haskell programs on your local machine.**

`ghci` is the interpreter for the haskell compiler

`GHC` works on Windows, Mac and Linux - although you will need to follow different installation instructions below for each operating system. Sadly, it does not currently run on mobile devices. One alternative approach is to use a cloud-based Haskell environment like [repl.it](https://replit.com/languages/haskell).

The two bundled distributions of GHC are the [Haskell Platform](https://www.haskell.org/platform) and [Stack](https://docs.haskellstack.org/en/stable/README/). We give instructions for installing the Haskell Platform below, since this is what we use. However many people prefer Stack. Perhaps it’s best to consult the comments section to see what other learners are saying, then make your choice.

###Windows

Download the [installation program](https://www.haskell.org/platform/#windows) and follow the instructions. If you have a recent Windows version (7 or later) you will probably use the 64-bit Haskell. If you have an earlier Windows, you might need the 32-bit version.

###Mac OS X

Download the [installation program](https://www.haskell.org/platform/#osx) and follow the instructions. If you use homebrew, you can simply 

`brew install` [haskell-stack](https://formulae.brew.sh/formula/haskell-stack).

###Linux

Follow the [instructions](https://www.haskell.org/platform/#linux) for your distro. Most common distros have haskell-platform as a package in their package managers. You could also [build from source](https://ghc.haskell.org/trac/ghc/wiki/Building) if you are feeling more adventurous.

###How do I know it works?

You will need to open a terminal (cmd.exe on Windows, terminal on Mac OS, xterm on Linux) and type in `ghci` then press enter. If you see the prompt as in the screenshot above, then everything is ok. Type `:help` then press enter for an overview of the available commands; type `:quit` then press enter to finish `ghci`.
