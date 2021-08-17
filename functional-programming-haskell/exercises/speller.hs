-- My implementation
transformWords :: [[Char]] -> [[Char]]
transformWords words = map transform words

transform :: [Char] -> [Char]
transform word = (take 1 word) ++ " is for " ++ word

speller :: [[Char]] -> [Char]
speller words = foldr (\elt acc -> addSeparator elt acc (length words)) "" (transformWords words)

addSeparator :: [Char] -> [Char] -> Int -> [Char]
addSeparator elt acc numberOfWords
  | hasAtLeastTwoWords && isLastWord = "and " ++  elt ++ acc
  | hasAtLeastTwoWords && not isLastWord = elt ++ ", " ++ acc
  | not hasAtLeastTwoWords = elt ++ acc
  where hasAtLeastTwoWords = numberOfWords > 1
        isLastWord = null acc

-- Another nice implementation
speller_one :: [Char] -> [Char]
speller_one word@(c:_) = c : " is for " ++ word

non_empty :: [Char] -> Bool
non_empty "" = False
non_empty word = True

concatenator :: [[Char]] -> [Char]
concatenator [] = ""
concatenator [x] = x
concatenator [x, y] = x ++ ", and " ++ y
concatenator (x:xs) = x ++ ", " ++ concatenator xs

speller2 :: [[Char]] -> [Char]
speller2 [] = ""
speller2 words = concatenator (map speller_one (filter non_empty words))
