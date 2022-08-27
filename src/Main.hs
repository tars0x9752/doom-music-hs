module Main where

import Core (sampleRate, Pulse)
import qualified Data.ByteString.Builder as B
import qualified Data.ByteString.Lazy as B
import Data.Foldable (Foldable (fold))
import qualified Score
import System.Process (runCommand)
import Text.Printf (printf)

outputFilePath :: FilePath
outputFilePath = "output.raw"

save :: FilePath -> [Core.Pulse] -> IO ()
save filePath score = B.writeFile filePath $ B.toLazyByteString $ foldMap B.floatLE score

play :: IO ()
play = do
  save outputFilePath Score.doom
  _ <- runCommand $ printf "ffplay -autoexit -showmode 1 -f f32le -ar %f %s" sampleRate outputFilePath
  return ()

main :: IO ()
main = save outputFilePath Score.doom
