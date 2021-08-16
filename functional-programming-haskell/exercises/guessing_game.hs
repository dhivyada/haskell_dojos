
check :: String -> String -> Char -> (Bool, String)
check wordToBeGuessed displayedWord guessedChar
  = (isPresent, newDisplayedWord)
  where combinations = zip wordToBeGuessed displayedWord
        newDisplayedWord = [if wordChar == guessedChar then wordChar else displayChar  | (wordChar, displayChar) <- combinations ]
        isPresent = guessedChar `elem` wordToBeGuessed

makeGuess :: String -> String -> Int -> IO()
makeGuess wordToBeGuessed displayedWord guessesLeft
  = do putStrLn (displayedWord ++ "    " ++ take guessesLeft (repeat '*'))
       putStrLn "Hello user. Enter your guess"
       guessedString <- getLine
       if length guessedString == 1
          then do
              let (correct, display') = check wordToBeGuessed displayedWord (guessedString!!0)
              let guessesLeft' = if correct then guessesLeft else guessesLeft-1
              turn wordToBeGuessed display' guessesLeft'
          else
            putStrLn "Please enter only one character"

turn :: String -> String -> Int -> IO()
turn wordToBeGuessed displayedWord guessesLeft
  = if guessesLeft == 0
      then putStrLn "You lost. Better luck next time 🎋"
    else if wordToBeGuessed == displayedWord
      then putStrLn "You won! That's awesome 🌳"
    else makeGuess wordToBeGuessed displayedWord guessesLeft

starman:: String -> Int -> IO()
starman wordToBeGuessed guessesAvailable
  = turn wordToBeGuessed paddedDashes guessesAvailable
  where paddedDashes = ['-' | x <- wordToBeGuessed]