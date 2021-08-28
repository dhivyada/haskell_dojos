> Part 5.5

#Type Horror Stories

**Jeremy says**

I remember a student who was writing a Game of Thrones ‘top trumps’ computer program in Python. Users entered values into the system interactively, so ‘Tyrion’ had a Wisdom ranking of 95 and ‘Daenerys’ had a Wealth ranking of 70, etc.


However we discovered that the program had a subtle bug. 

* When we compared characters on the same ranking, a character with a score of ‘99’ would beat a character with a score of ‘100’. It took me ages to work out why…

* The problem was that the Python program represented these ranking values as `Strings`, and

```
"99" > "100"
```

* In terms of `String` comparisons. We needed to use the `int()` function to convert the `Strings` to `integer` values.

* Have you ever written a program in an `untyped` or `weakly typed language` and got things badly wrong? Would a `stronger type system` have helped you? 


