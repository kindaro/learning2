module Main where


main :: IO ()
main = return ()


isPrime,isPrimeNaive :: Integer -> Bool
-- relies on primes < x
isPrime x
    | x < 5 = isPrimeNaive x
    | otherwise = undefined

isPrimeNaive x = length (divisorsNaive x) == 2

divisorsNaive :: Integer -> [(Integer, Integer)]
divisorsNaive n = filter (\x -> snd x == 0) $ map (quotRem n) $ [1..n]

primes :: [Integer]
primes = filter isPrime [1..]
