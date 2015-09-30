module Spec where

import qualified Main
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "primes" $ do
        it "says 2 is a prime" $
            Main.isPrime 2 `shouldBe` True
        it "says 3 is a prime" $
            Main.isPrime 3 `shouldBe` True
        it "says 4 is composite" $
            Main.isPrime 4 `shouldBe` False
