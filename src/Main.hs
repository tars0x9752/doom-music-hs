module Main where

import Core (outputFilePath, sampleRate)
import qualified Data.ByteString.Builder as B
import qualified Data.ByteString.Lazy as B
import Data.Foldable (Foldable (fold))
import Score (simple)
import System.Process (runCommand)
import Text.Printf (printf)

save :: FilePath -> IO ()
save filePath = B.writeFile filePath $ B.toLazyByteString $ foldMap B.floatLE simple

play :: IO ()
play = do
  save outputFilePath
  _ <- runCommand $ printf "ffplay -autoexit -showmode 1 -f f32le -ar %f %s" sampleRate outputFilePath
  return ()

main :: IO ()
main = save outputFilePath