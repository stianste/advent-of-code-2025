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
      let invalidIDs2 = solvePart2 rangeTuples
      putStrLn $ "Part 2: " ++ show (sum invalidIDs2)

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

isRepeatedPattern :: Int -> Bool
isRepeatedPattern n =
  -- Bottom up approach. So for 123123123, start by 1, create 111111111, check if that equals 123123123 – nope.
  -- Then check 12, which is not divisible by the string length, so we move on.
  -- Then substring 123, create 123123123, which is a match. Do this for all substrings from 1 to half the length of the string.
  let s = show n
      strLen = length s
      isValidRepeat subLen =
        strLen `isDivisibleBy` subLen &&
        let pattern = take subLen s
            repeatCount = strLen `div` subLen
            repeated = concat $ replicate repeatCount pattern
        in repeated == s
  in any isValidRepeat [1 .. strLen `div` 2]


isDivisibleBy :: Int -> Int -> Bool
isDivisibleBy n m = n `mod` m == 0

-- Part 2 solution
solvePart2 :: [(Int, Int)] -> [Int]
solvePart2 inputRanges =
  [ n | (start, end) <- inputRanges, n <- [start..end], isRepeatedPattern n ]

readInputFile :: FilePath -> IO (Maybe String)
readInputFile path =
  catch (Just <$> readFile path)
        (\e -> const (return Nothing) (e :: IOException))

parseLine :: String -> (Char, Int)
parseLine (d:v) = (d, read v)
parseLine _ = error "Invalid input line"
