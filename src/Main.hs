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


existsPairWithSum m xs
    | filter (<1) (differential xs) /= [] = Nothing -- We require the list be strictly ascending.
    | n < 2 = Nothing
    | n == 2 && tupleGreater == m = Just True
    | n == 2 && tupleGreater /= m = Just False
    | tupleGreater > m && tupleLesser < m = Just False
    | tupleGreater < m = Just False
    | tupleLesser > m = existsPairWithSum m (reverse $ tail rs)
    | otherwise = Just True
    where
        n = length xs
        rs = reverse xs
        tupleGreater = rs!!0 + rs!!1 -- Since rs is descending,
        tupleLesser = rs!!1 + rs!!2  -- tupleLesser is smaller than tupleGreater.
