module Main where

import Core (outputFilePath, sampleRate, Pulse)
import qualified Data.ByteString.Builder as B
import qualified Data.ByteString.Lazy as B
import Data.Foldable (Foldable (fold))
import Score (doom)
import System.Process (runCommand)
import Text.Printf (printf)

score :: [Core.Pulse]
score = Score.doom

save :: FilePath -> IO ()
save filePath = B.writeFile filePath $ B.toLazyByteString $ foldMap B.floatLE score

play :: IO ()
play = do
  save outputFilePath
  _ <- runCommand $ printf "ffplay -autoexit -showmode 1 -f f32le -ar %f %s" sampleRate outputFilePath
  return ()

main :: IO ()
main = save outputFilePath
