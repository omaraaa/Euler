module Main where
{-# LANGUAGE BangPatterns #-}

import Data.Function (fix)

f :: (Int -> Int) -> Int -> Int
f mf 0 = 0
f mf n = max n $ mf (div n 2) +
                 mf (div n 3) +
                 mf (div n 4)

f_list :: [Int]
f_list = map (f faster_f) [0..]

faster_f :: Int -> Int
faster_f n = f_list !! n

isqrt :: Int -> Int
isqrt = ceiling . sqrt . fromIntegral

isPrime k = null [ x | x <- [2..isqrt k], k `mod`x  == 0]

getDivisors k = [x | x <- [1.. (k-1)], k `rem` x == 0]

isAbdnt x 
	| isPrime x = False
	| otherwise = if (sum $ getDivisors x) > x then True else False

abList = [x | x <- [1..], isAbdnt x]--abList (x-1) ++ if isAbdnt x then [x] else []

test x n = (x-n) `elem` (takeWhile (<x) abList)

sumACheck x = f x (takeWhile (<x) abList)
	where
		f x [] = True
		f x l = if isAbdnt (x - (head l)) then False else f x (tail l)



checkAList 0 = 0
checkAList x = checkAList (x-1) + if sumACheck x then x else 0

main :: IO()
main = do 
	print $ (checkAList 28123)