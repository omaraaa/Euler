module Main where

sepDigs :: (Integral a) => a -> [a]
sepDigs 0 = []
sepDigs n = sepDigs (n `div` 10) ++ [n `mod` 10]

joinDigs :: (Integral a) => [a] -> a
joinDigs [] = 0
joinDigs l = joinDigs (tail l) + ((head l) * 10^(length l - 1))


factorial 1 = 1
factorial n = n * (factorial $ n-1)


treePath :: Int -> Int -> [Int]
treePath e f = [(e-1) `quot` (factorial(f-1))] ++ f1 (e-1) (f-1)
	where f1 e f
		| (factorial (f-1)) == 0 = error "ASDFAD"
		| f  <= 2 = [e `mod` 2] ++ [0]
		| otherwise = [ ((e `mod` (factorial f)) `quot` (factorial (f-1)))] ++ f1 e (f-1) 

treeToLex [] [] = []
treeToLex path digits 
	| length path /= length digits = error "wow" 
	| otherwise = [digits !! (head path)] ++ treeToLex (tail path)  (filter (/= (digits !! (head path))) digits)

solution n l 
	| n > (factorial $ length l) = error "permutation given larger then lexicographic permutations possible for digit sequence"
	| otherwise = joinDigs $ treeToLex (treePath n (length l)) l

main = print $ solution 1000000 [0,1,2,3,4,5,6,7,8,9]	