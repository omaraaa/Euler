module Main where

import System.IO
import Data.Char
import Data.String
import Data.List

removeQ '\"' = ' '
removeQ ',' = ' '
removeQ c = c

reFac :: [a] -> [(Int, a)]
reFac l = f 1 l
	where f n l = if not $ null l then f (n+1) (tail l) ++ [(n, head l)]
				else []

charWorth "" = 0
charWorth s = (charWorth $ tail s) + (ord (head s)) - 64
getScore t = (fst t) * (charWorth (snd t))

main = do
	file <- openFile "p022_names.txt" ReadMode
	contents <- hGetContents file
	print (sum $ map getScore $ reFac $ sort $ words $ (map removeQ contents))
	hClose file
