#! /usr/bin/env runhaskell

import qualified System.Environment as Env
import qualified Data.List as List

type Line  = String

main = do
  args <- Env.getArgs
  let fileName = args !! 0
  file <- readFile fileName
  let l = lines file
  putStr $ takeBaseName fileName
  putStr $ " {\n"
  putStr $ unlines $ map ("\t"++) $ map formatLine $ filterDefinitions l
  putStr $ "}\n"

filterDefinitions :: [Line] -> [Line]
filterDefinitions [] = []
filterDefinitions (l:ls)
  | l == ""              = (filterDefinitions ls)
  | fstChar == '\t'      = (filterDefinitions ls)
  | fstWord == "extends" = (filterDefinitions ls)
  | otherwise            = l:(filterDefinitions ls)
  where
    fstChar = head l
    fstWord = head $ words l

formatLine :: Line -> Line
formatLine [] = []
formatLine l@('f':'u':'n':'c':' ':ws) = init l
formatLine l = l

takeBaseName :: FilePath -> String
takeBaseName f = takeWhile (/='.') $ last $ splitIf (=='/') f

splitIf :: (Eq a) => (a -> Bool) -> [a] -> [[a]]
splitIf p l =  case dropWhile p l of
  [] -> []
  l' -> w : splitIf p l''
    where
      (w, l'') = break p l'

