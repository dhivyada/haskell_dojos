> Part 2.2

* Relational operators test the relation between values, e.g. `==` tests whether two values are equal. These relational operators generally evaluate to boolean values.


* Another function that returns a boolean value is the list membership function called `elem`. 


* Not all types are comparable in Haskell. The ones that can be checked for equality have type `Eq` (an `Int`, for example, is also an `Eq`), and the ones that can be checked for order (`<, >, <=, >=`) have type `Ord`.


* `True` and `False` are `boolean` values


* Use the `/=` operator (it's supposed to look like `an equals sign with a line through it`), to test for inequality, e.g. `1 /= 2`. 


* Compare strings for equality `"hello" == "hola"` and inequality `"foo" /= "bar"`


* You can apply these operations to other data types. You might also try comparing two Bools directly, e.g. `True /= False`.


* Comparing `True == 1` will throw an error. This equality test fails: Haskell cannot compare two values that have different types.


* Haskell supports the standard comparison/relational operators, `<, <=, >, >=`. Try a simple comparison, e.g. `10 > 9`

* Relational operators also work on lists, in a dictionary-order manner (lexicographic). e.g. Try [1,2,3] < [1,2,3,4]

* Since strings are lists of characters in Haskell, we can do the same kinds of comparison operations on strings. Check whether `Aardvark` comes before `Aaronic` in the dictionary with this code: `"Aardvark" < "Aaronic"`

* Now let's think about list membership. We want a boolean function that returns true if a value is part of a list, and false otherwise. This is the `elem` function. Try `elem 1 [1,2,3]`

* The `elem` function can be written `infix`, like an arithmetic operator, by enclosing its name in backquotes ``. Try ```3 `elem` [1, 2, 3, 4, 5]```.

* Haskell permits any two-argument function to be written as an `infix` operator using `backquote characters`. For a further example, try the max function as an infix operator: ```42 `max` 13```

* any Haskell `infix` operator, e.g. `+`, can be written as a `prefix` operator by enclosing it in `parentheses`, like `(+) 1 1`

* Let's recap what we've just discovered:

  - Equality and Comparison Operators
  - Testing List membership with the elem function
  - Using infix and prefix operations. 

