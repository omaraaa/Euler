
sepDigs :: (Integral a) => a -> [a]
sepDigs 0 = []
sepDigs n = sepDigs (n `div` 10) ++ [n `mod` 10]

joinDigs :: (Integral a) => [a] -> a
joinDigs [] = 0
joinDigs l = joinDigs (tail l) + ((head l) * 10^(length l - 1))

shift :: [a] -> Int -> [a]
shift l n = drop n l ++ take n l

f digs d2 s
	| s >= (length digs)+1 = []
	| otherwise = [head digs] ++ f (shift d2 (s)) d2 (s+1)

getLexList :: (Integral a) => a -> [a]
getLexList n = f (sepDigs n) (sepDigs n) 1

factorial 1 = 1
factorial n = n * (factorial $ n-1)

f1 [] pl n = pl ++ [n]
f1 l pl n 
 | n > last l = (init l) ++ [n] ++ [last l] ++ pl
 | otherwise = f1 (init l) ([last l] ++ pl) n

f2 l = (init $ f1 (take (length l - 2) l) [] (last (init l))) ++ [last l] ++ [last $ f1 (init $ init l) [] (last (init l))]

joinHead x y = joinDigs $ [x] ++ (sepDigs y)

getLex l [] = []
getLex l n
 | length l < 4 = [joinDigs l] ++ fLex1 l 0 []
 | otherwise = (map (joinHead (head n)) (getLex (filter (/= head n) l) (filter (/= head n) l))) ++  getLex l (tail n) 
 	where fLex1 l n pl
	 	| n == (factorial $ length l)-1 = pl
	 	| (length pl > 1) && (last (init pl)) == (last pl) = fLex1 (f2 l) n ((init pl) ++ [joinDigs (f2 l)])
	 	| otherwise = fLex1 (f1 (init l) [] (last l)) (n+1) (pl ++ [joinDigs (f1 (init l) [] (last l))])
 

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
	