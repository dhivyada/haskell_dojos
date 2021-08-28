-- Caesar's Cipher
-- Jeremy.Singer@glasgow.ac.uk
-- great example for QuickCheck

import Data.Char
-- Data.Char allows us to import utility functions to manipulate characters


shouldcipher :: Char -> Bool
-- is this a letter to be ciphered?
shouldcipher c = isLetter(c) && isAscii(c)
-- we only want to cipher letters and ascii characters. Haskell actually uses unicode character set
-- so no numbers and punctuation characters will be enciphered


cipherchar :: Int -> Char -> Char
-- enciphers single char at a time - NO WRAPPING
cipherchar shift originalPlainTextChar
 | shouldcipher originalPlainTextChar = resultingChar
 | otherwise      = originalPlainTextChar
  where integerCode = ord(originalPlainTextChar) + shift
        resultingChar = chr(integerCode)
-- type safety is important, so we can't add integer to character directly. Ord and Chr might be familiar to Python programmers


-- encipher a whole string
cipher :: Int -> [Char] -> [Char]
cipher shift plaintext = map (bettercipherchar shift) plaintext

-- encipher a whole string without the rotation
cipherBuggy :: Int -> [Char] -> [Char]
cipherBuggy shift plaintext = map (cipherchar shift) plaintext




decipher :: Int -> [Char] -> [Char]
-- inverse of cipher function
-- decipher is just the cipher function, but shifting in the opposite direction
-- this won't work correctly because we have not done the wrapping around for `Z`
decipher shift ciphertext = cipher (-shift) ciphertext

decipherBuggy :: Int -> [Char] -> [Char]
-- inverse of cipher function
-- decipher is just the cipher function, but shifting in the opposite direction
-- this won't work correctly because we have not done the wrapping around for `Z`
decipherBuggy shift ciphertext = cipherBuggy (-shift) ciphertext



wraparound shift c
-- should we wrap around the alphabet, if we shift past Z?
 | isLower(c) && ord(c)+shift > ord 'z' = True
 | isUpper(c) && ord(c)+shift > ord 'Z' = True
 | otherwise = False


bettercipherchar :: Int -> Char -> Char
-- implementation of character substitution with wrapping
bettercipherchar shift c
 | shouldcipher c =  chr(ord(c) + adjustedshift)
 | otherwise      = c
 where adjustedshift = let shift' = shift `mod` 26
                       in if (wraparound shift' c)
                          then shift'-26
                          else shift'

--quickCheck ((\shiftOffset -> (\plainText -> ((decipherBuggy shiftOffset (cipherBuggy shiftOffset plainText)) == plainText))) :: Int -> [Char] -> Bool)
--quickCheck ((\shiftOffset -> (\plainText -> ((decipher shiftOffset (cipher shiftOffset plainText)) == plainText))) :: Int -> [Char] -> Bool)