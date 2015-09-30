module Spec where

import qualified Main
import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "compress" $ do
        it "compresses [1..10] to the same" $
            Main.compress [1..10] `shouldBe` [1..10]
        it "compresses take 5 $ repeat 1 to [1]" $
            Main.compress (take 5 $ repeat 1) `shouldBe` [1]
        it "compresses amma to ama" $
            Main.compress "amma" `shouldBe` "ama"

    describe "differential" $ do
        it "differential [1, 2, 3] is [1, 1]" $
            Main.differential [1, 2, 3] `shouldBe` [1, 1]
