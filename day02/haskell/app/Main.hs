{-
  Advent of Code 2025 - Day 02

  How to run:
  cabal run
-}

module Main where

import Control.Exception (catch, IOException)
import Data.List.Split (splitOn)

main :: IO ()
main = do
  putStrLn "Day 02 Solution"
  putStrLn "==============="

  contents <- readInputFile "../input.txt"

  case contents of
    Nothing -> putStrLn "Error: Could not read input.txt"
    Just input -> do
      let rangeTuples = parseRanges $ splitOn "," $ head $ lines input
      putStrLn $ "Read " ++ show (length rangeTuples) ++ " ranges from input.txt"
      putStrLn ""

      -- Part 1
      let invalidIDs = solvePart1 rangeTuples
      putStrLn $ "Part 1: " ++ show (sum invalidIDs)

      -- Part 2
      let part2Result = solvePart2 rangeTuples
      putStrLn $ "Part 2: " ++ show part2Result

solvePart1 :: [(Int, Int)] -> [Int]
solvePart1 inputRanges =
  [ n | (start, end) <- inputRanges, n <- [start..end], isRepeatedTwice n ]

parseRanges :: [String] -> [(Int, Int)]
parseRanges = map parseRange
  where
    parseRange s =
      case splitOn "-" s of
        [start, end] -> (read start, read end)
        _ -> error $ "Invalid range: " ++ s

isRepeatedTwice :: Int -> Bool
isRepeatedTwice n =
  let s = show n
      len = length s
  in len `mod` 2 == 0 && let (first, second) = splitAt (len `div` 2) s in first == second

-- Part 2 solution
solvePart2 :: [(Int, Int)] -> String
solvePart2 _inputRanges =
  -- TODO: Implement Part 2 solution
  "Not implemented yet"

readInputFile :: FilePath -> IO (Maybe String)
readInputFile path =
  catch (Just <$> readFile path)
        (\e -> const (return Nothing) (e :: IOException))

parseLine :: String -> (Char, Int)
parseLine (d:v) = (d, read v)
parseLine _ = error "Invalid input line"
