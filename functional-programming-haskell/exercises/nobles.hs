-- make people noble

mknoble :: String -> String
mknoble name = "Sir " ++ name

makeNobleGeneric :: Bool -> String -> String
makeNobleGeneric isFemale name = (if isFemale then "Dame " else "Sir ")
                                  ++ name

data Gender = Male | Female
makeNobleRefactored :: Gender -> String -> String
makeNobleRefactored gender name =
  let nobleSalutation = case gender of
                            Female -> ("Dame ")
                            Male -> ("Sir ")
  in nobleSalutation ++ name