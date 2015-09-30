module Spec where

import qualified Main
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "trivial" $ do
        it "says 2 * 2 equals 4" $
            2 * 2 == 4 `shouldBe` True
        it "says 2 * 2 equals 5" $
            2 * 2 == 5 `shouldBe` True
        it "says 2 * undefined equals 4" $
            2 * undefined == 4 `shouldBe` True
