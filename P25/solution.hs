module Main where

sepDigs :: (Integral a) => a -> [a]
sepDigs 0 = []
sepDigs n = sepDigs (n `div` 10) ++ [n `mod` 10]

fib = (map f [0..] !!)
	where
		f 0 = 0
		f 1 = 1
		f x = fib (x-1) + fib (x-2)

solution = f 1
	where f x
		| (length $ sepDigs (fib x)) >= 1000 = x
		| otherwise = f (x+1)

main = print solution