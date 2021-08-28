> Part 4.10

#Check my Program is Correct:

####QuickCheck is a useful tool for automatically generating test cases for your Haskell programs. It’s widely used in industrial settings.

We explore the Caesar’s Cipher implementation in this section

##QuickCheck:
* It is a powerful automation testing tool.
* This allows us to run `randomly generated tests` on our code, to ensure that the code meets certain correctness properties that we specify.
* `Quickcheck` comes as part of the Haskell platform
* It's widely used in the software industry.
* Many modern telecom software products are tested using Quickcheck.

Let us implement a `substitution cipher`
* Let us do Caeser cipher where we encode letters by shifting them a certain number of places in the alphabet.
* Let us shift `1` letter at a time. And `Z` maps to `A`. So it is `rotation` rather than `shifting`
* Note: Haskell uses `unicode` character set
* Let us use the `QuickCheck` library to generate random test cases to debug the `decipher` function
```haskell
*Main> :load functional-programming-haskell/exercises/cipher.hs
[1 of 1] Compiling Main             ( functional-programming-haskell/exercises/cipher.hs, interpreted )
Ok, one module loaded.
*Main> cipher 1 "hello"
"ifmmp"
*Main> cipher 3 "veni vidi vici"
"yhql ylgl ylfl"
*Main> decipher 3 "veni vidi vici"
"sbkf sfaf sfzf"
*Main> decipher 3 "yhql ylgl ylfl"
"veni vidi vici"
*Main> import Test.QuickCheck
```
* Use `cabal install QuickCheck` to install it
```haskell
*Main Test.QuickCheck> quickCheck ((\shiftOffset -> (\plainText -> ((decipherBuggy shiftOffset (cipherBuggy shiftOffset plainText)) == plainText))) :: Int -> [Char] -> Bool)
*** Failed! Falsified (after 9 tests and 5 shrinks):
1
"z"
```
* Using the randomly generated tests of `QuickCheck`, the bug is found.
```haskell
*Main Test.QuickCheck> cipherBuggy 1 "z"
"{"
*Main Test.QuickCheck> decipherBuggy 1 "{"
"{"
*Main Test.QuickCheck> cipherBuggy (-1) "z"
"y"
-- we decipher only letters. For other characters, we return the character itself.
```
```haskell
*Main Test.QuickCheck> quickCheck ((\shiftOffset -> (\plainText -> ((decipher shiftOffset (cipher shiftOffset plainText)) == plainText))) :: Int -> [Char] -> Bool)
+++ OK, passed 100 tests.
*Main Test.QuickCheck>
```
* Types are helpful for `QuickCheck` to generate the right kind of inputs.
* The passing tests give us some confidence that the code might be correct.
* We can actually trace the `QuickCheck` function to see what the randomly generated data looks like.
```haskell
*Main Test.QuickCheck> verboseCheck ((\shiftOffset -> (\plainText -> ((decipher shiftOffset (cipher shiftOffset plainText)) == plainText))) :: Int -> [Char] -> Bool)
```
* Word of warning: Even though the property is correct for all tests, it doesn't guarantee that our code is correct. 
* `Edjser Dijkstra` - the famous computer scientist said "Testing can only show the presence of bugs, not the absence". However, `QuickCheck` provides a nice way to generate automated random tests, to have more confidence that the code does what it is supposed to do.
