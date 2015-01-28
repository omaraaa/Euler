module Main where

fact x = f x 1
	where f num count
		| num == 1 = count
		| otherwise = f (num-1) (count*num)

seprateDigits n l
	| n == 0 = l
	| otherwise = seprateDigits (n `div` 10) (l ++ [n `mod` 10])

main :: IO()
main = print $ sum (seprateDigits (fact 100) [])