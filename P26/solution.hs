
primeFacsExp :: Integer -> [(Integer, Int)]

powerMod :: (Integral a, Integral b) => a -> a -> b -> a
powerMod m _ 0 =  1
powerMod m x n | n > 0 = f x' (n-1) x' where
  x' = x `rem` m
  f _ 0 y = y
  f a d y = g a d where
    g b i | even i    = g (b*b `rem` m) (i `quot` 2)
          | otherwise = f b (i-1) (b*y `rem` m)
powerMod m _ _  = error "powerMod: negative exponent"

multOrder a m 
  | gcd a m /= 1  = error "Arguments not coprime"
  | otherwise     = foldl1' lcm $ map (multOrder' a) $ primeFacsExp m
 
multOrder' a (p,k) = r where
  pk = p^k
  t = (p-1)*p^(k-1) -- totient \Phi(p^k)
  r = product $ map find_qd $ primeFacsExp $ t
  find_qd (q,e) = q^d where
    x = powerMod pk a (t `div` (q^e))
    d = length $ takeWhile (/= 1) $ iterate (\y -> powerMod pk y q) x