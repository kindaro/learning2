module Spec where

import Main
import Test.Hspec

spec :: IO ()
spec = hspec $ do
    describe "compress" $ do
        it "compresses [1..10] to the same" $
            compress [1..10] `shouldBe` [1..10]
        it "compresses take 5 $ repeat 1 to [1]" $
            compress (take 5 $ repeat 1) `shouldBe` [1]
        it "compresses amma to ama" $
            compress "amma" `shouldBe` "ama"
        it "compresses [1] to [1]" $
            compress [1] `shouldBe` [1]
        it "compresses [] to []" $
             ([] :: [()]) `shouldBe` ([])

    describe "differential" $ do
        it "differential [1, 2, 3] is [1, 1]" $
            differential [1, 2, 3] `shouldBe` [1, 1]

    describe "functionBreaks" $ do
        it "[1, 2, 3, 4, 3, 2, 1] breaks as [1, -1]" $
            functionBreaks ( [1.. 4] ++ [3, 2.. 1] ) `shouldBe` [1, -1]

    describe "existsPairWithSum" $ do
        it' $ existsPairWithSum 3 [1] `shouldBe` Nothing
        it' $ existsPairWithSum 3 [2,1] `shouldBe` Nothing
        it' $ existsPairWithSum 3 [0,1,2,100] `shouldBe` Just True
        it' $ existsPairWithSum 3 [0,1,3,100] `shouldBe` Just False
        it' $ existsPairWithSum 3 [-1,0,1] `shouldBe` Just False
        it' $ existsPairWithSum 3 [7,8,9] `shouldBe` Just False


it' = it "--"
