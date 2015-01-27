module Main where

isLeap :: Int -> Bool
isLeap year =
	year `mod` 4 == 0 && (mod year 100 /= 0 || mod year 400 == 0)



calcWeekDay :: Int -> Int -> Int -> Int -> Int -> Int
calcWeekDay weekday sy ey sundays m
	| sy > ey = sundays
	| otherwise = 
				calcWeekDay (weekday+(f2 m sy)) 
				(if m==12 then sy+1 else sy) ey 
				(if mod weekday 7 == 0 then sundays+1 else sundays) 
				(if m==12 then 1 else m+1)
	where f2 mo year
		| mo == 1 = mod 31 7
		| mo == 2 = if isLeap year then mod 29 7 else mod 28 7
		| mo == 3 = mod 31 7
		| mo == 4 = mod 30 7
		| mo == 5 = mod 31 7
		| mo == 6 = mod 30 7
		| mo == 7 = mod 31 7
		| mo == 8 = mod 31 7
		| mo == 9 = mod 30 7
		| mo == 10 = mod 31 7
		| mo == 11 = mod 30 7
		| mo == 12 = mod 31 7

main :: IO ()
main = do
	print $ calcWeekDay 2 1901 2000 0 1
	putStrLn "done."
