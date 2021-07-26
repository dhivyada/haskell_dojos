> Part 1.7

#Lambda functions:
* These are anonymous functions similar to Javascript
  Blocks
* These are very important, they are actually the foundation of the language 
* Functions without names are known as lambdas

####*In Javascript*:
```
f = function(x, y) { 
    return x * x + y * y
}
```
####*In Haskell*:
```haskell
f = \x y -> x * x + y * y
```

#Let expressions or Let Blocks:
In JavaScript functions typically are blocks of code:

    function roots(a,b,c) {
        det2 = b*b-4*a*c;
        det  = sqrt(det2);
        rootp = (-b + det)/a/2;
        rootm = (-b - det)/a/2;
        return [rootm,rootp]
    }

In Haskell, we would write this function as follows:
```haskell
    roots a b c = 
        let
            det2 = b*b-4*a*c;
            det  = sqrt(det2);
            rootp = (-b + det)/a/2;
            rootm = (-b - det)/a/2;
        in
            [rootm,rootp]
```    

Note that the let ... in ... construct is an expression, so it returns a value. That’s why there is no need for a return keyword.

#Conditionals:
###If-else statement:
In Python we could write a function with a condition like this:

```def max(x,y):
if x > y:
return x
else:
return y
```
Of course Haskell also has an if-then construct:
```haskell
    max x y = 
        if x > y
            then x
            else y
```

Again the if ... then ... else ... construct is an expression, so it returns a value.
    
###Case statement:

Many languages provide a case statement for conditions with more than two choices. For example, Ruby provides a case expression:

    Red = 1
    Blue = 2
    Yellow = 3

    color = set_color();
    action = case color 
        when Red then action1()
        when Blue then action2()
        when Yellow then action3()
    end

In Haskell, the case works and looks similar:
```haskell
    data Color = Red | Blue | Yellow

    color = set_color
    action = case color of
        Red -> action1
        Blue -> action2
        Yellow -> action3
```

Note however how we use the type as the value to decide on the case, where in other languages we need to define some kind of enumeration.

#Higher-order function
* Functions that operate on functions (i.e. that take functions as arguments)
```haskell
map(\x -> 2 * x) [1..10]
```
###Notes:

####Generics/Templates:

In Java and C++ there are generic data types (aka template types), such as:

    Map<String,Integer> set = new HashMap<String,Integer>();

In Haskell, you would write this as follows:

    set :: Data.Map.Map String Integer 
    set = Data.Map.empty

The main difference is of course that set in Haskell is not an object but an immutable variable, so where in Java you would say:

    set.put("Answer",42)

In Haskell you would say:

    set' = Data.Map.insert "Answer" 42 set

Because in Haskell variables are immutable, the return value of the insert call is bound to a new variable rather than updating the variable in place as in Java.
