module Main where


main :: IO ()
main = return ()


compress :: Eq a => [a] -> [a]
compress (x1:x2:xs)
    | x1 == x2   =       recur
    | otherwise  =  x1 : recur
    where recur = compress $ x2 : xs
compress xs = xs


differential :: Num a => [a] -> [a]
differential (x1:x2:xs) = (x2 - x1) : (differential $ x2 : xs)
differential _ = []

functionBreaks = compress . (map signum) . differential

