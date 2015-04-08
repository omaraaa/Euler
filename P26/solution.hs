import Data.List
import Data.Ord

isEven n 
  | n `mod` 2 == 0 = True
  | otherwise = False

divs n = [x | x <- [2..(n-1)], n `rem` x == 0]

isqrt :: Int -> Int
isqrt = ceiling . sqrt . fromIntegral
isPrime k = null [ x | x <- [2..isqrt k], k `mod`x  == 0]

multOrder m  = f 10 m 1
  where 
    f a m n 
      | n >= m = 0
      | mod (a^n) m == 1 = n
      | otherwise = f a m (n+1)

getRNum n
  | length (divs n) <= 1 = (n, multOrder n)
  | length (divs n) > 1 = f1 (n)  (divs n)
  | otherwise = (n, -1)
    where 
      f1 n d
        | multOrder (head d) == 0 && multOrder (last d) == 0 = (n, 0)
        | multOrder (head d) == 0 = (n, multOrder (last d))
        | multOrder (last d) == 0 = (n, multOrder (head d))
        | otherwise = (n,lcm (multOrder (head d)) (multOrder (last d)))

solution = sortBy (comparing $  snd) $ map getRNum [x | x <- [2..1000]]

main = do
  print $ fst $ last $ solution