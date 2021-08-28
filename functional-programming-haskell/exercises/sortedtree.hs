-- sortedtree.hs
-- Jeremy.Singer@glasgow.ac.uk
-- Example code for #FLhaskell course

-- Nodes contain integers, Leaves are empty
data Tree = Leaf | Node Int Tree Tree deriving Show



treeDepth :: Tree -> Int
-- longest path from root to a leaf
treeDepth Leaf = 0
treeDepth (Node _ leftSubtree rightSubtree) =
  1 + max (treeDepth leftSubtree) (treeDepth rightSubtree)


isSortedTree :: Tree -> Int -> Int -> Bool
-- is the tree sorted in-order?
-- the two Int params indicate min and max
-- for the current subtree
isSortedTree Leaf _ _ = True
isSortedTree (Node x leftSubtree rightSubtree) minVal maxVal =
    let leftSorted  = isSortedTree leftSubtree minVal x
        rightSorted = isSortedTree rightSubtree x maxVal
    in x >= minVal && x< maxVal && leftSorted && rightSorted


addNewMax :: Tree -> Tree
-- add a new max element to tree
-- will go down rightmost path to Leaf
addNewMax Leaf = Node 0 Leaf Leaf  -- input tree with no nodes
addNewMax (Node x t1 Leaf) = Node x t1 (Node (x+1) Leaf Leaf)  -- this is the rightmost Node
addNewMax (Node x t1 t2) = Node x t1 (addNewMax t2) -- intermediate node, go down right subtree

-- below are my implementations:
treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node payload leftSubtree rightSubtree) =
  payload + (treeSum leftSubtree) + (treeSum rightSubtree)

insertValueIntoTree :: Int -> Tree -> Tree
insertValueIntoTree value Leaf = (Node value Leaf Leaf)
insertValueIntoTree value (Node x leftSubtree rightSubtree) =
  if (value < x) then Node x (insertValueIntoTree value leftSubtree) rightSubtree
                 else Node x leftSubtree (insertValueIntoTree value rightSubtree)
-- insertValueIntoTree 7 (Node 2 (Node 1 Leaf Leaf) (Node 5 Leaf Leaf))
-- Output: Node 2 (Node 1 Leaf Leaf) (Node 5 Leaf (Node 7 Leaf Leaf))
-- insertValueIntoTree (-1) (Node 2 (Node 1 Leaf Leaf) (Node 5 Leaf Leaf))
-- Node 2 (Node 1 (Node (-1) Leaf Leaf) Leaf) (Node 5 Leaf Leaf)

convertTreeToList :: Tree -> [Int]
convertTreeToList Leaf = []
convertTreeToList (Node payload leftSubtree rightSubtree) = (convertTreeToList leftSubtree) ++ [payload] ++ (convertTreeToList rightSubtree)

--- convertTreeToList (Node 2 (Node 1 Leaf Leaf) (Node 5 Leaf Leaf))
--- output: [1,2,5]
-- convertTreeToList (Node 2 (Node 1 Leaf Leaf) (Node 5 Leaf (Node 7 Leaf Leaf)))
--- output: [1,2,5,7]
--convertTreeToList (Node 2 (Node 1 (Node (-1) Leaf Leaf) Leaf) (Node 5 Leaf Leaf))
-- output: [-1,1,2,5]

maxHelper :: Int -> [Int] -> Int
maxHelper x [] = x
maxHelper x (y:ys) = maxHelper greaterOfTheTwoElements ys
  where greaterOfTheTwoElements = if x > y then x else y