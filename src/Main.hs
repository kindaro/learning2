module Main where

main :: IO ()
main = return ()


compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x1:x2:xs)
    | x1 == x2 = compress $ x1 : xs
    | otherwise = x1 : (compress $ x2 : xs)

differential :: Num a => [a] -> [a]
differential [] = []
differential [x] = []
differential (x1:x2:xs) = (x2 - x1) : (differential $ x2 : xs)
