> Part 3.3

#Relationship between map & folds in functional language and loops in imperative language:
This tutorial explains the relationship between the higher-order list operations map, foldl and foldr and loops in an imperative language.

```haskell
-- our list
lst = [ 1.. 10]

-- map
f x = x*(x+1)
lst_ = map f lst

-- foldl
g = (/)
accl = foldl g 1 lst

-- foldr
g' = (/)
accr = foldr g' 1 lst

-- main
main = do
print lst_
print accl
print accr
```

```
# our list
lst = []
for i in 1 .. 10
    lst.push(i)
end

# operations to emulate map 
def f(x)
    x*(x+1)
end

lst_ = []

for elt in lst
    lst_.push( f(elt) )
end

puts lst_.inspect

# operations to emulate foldl
def g(acc,elt)
    acc/elt
end

acc = 1.0
for elt in lst
    acc = g(acc,elt)
end

puts acc

# operations to emulate foldr
def g_(acc,elt)
    elt/acc
end

acc = 1.0
for elt in lst.reverse
    acc = g_(acc,elt)
end

puts acc
```

##Summary
* In haskell, the functions on lists are abstracted into `map` and `foldl` or `foldr`.

`map` : loop over list element-by-element, append new element to new list

`foldl` : loop over list element-by-element, update accumulator using current accumulator and element

`foldr` : loop over reverse list element-by-element, update accumulator using current accumulator and element

**Note:**

    map :: (a -> b) -> [a] -> [b]
    foldl :: (b -> a -> b) -> b -> [a] -> b 
    foldr :: (a -> b -> b) -> b -> [a] -> b
