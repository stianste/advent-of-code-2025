{-
  Advent of Code 2035 - Day 03

  How to run:
  cabal run
-}

module Main where

import Control.Exception (catch, IOException)
import Data.List.Split (splitOn)
import Data.Char (digitToInt)
import Data.List (tails)

main :: IO ()
main = do
  putStrLn "Day 03 Solution"
  putStrLn "==============="

  contents <- readInputFile "../input.txt"

  case contents of
    Nothing -> putStrLn "Error: Could not read input.txt"
    Just input -> do
      let inputLines = lines input

      putStrLn $ "Lines: " ++ show inputLines

      putStrLn $ show (maxCharge "818181911112111")

      let part1 = solvePart1 inputLines
      putStrLn $ "Part 1: " ++ show part1

      let part2 = solvePart2 inputLines
      putStrLn $ "Part 2: " ++ show part2

solvePart1 :: [String] -> Int
solvePart1 lines = sum $ map parseLine lines

parseLine :: String -> Int
parseLine line = maxCharge line

maxCharge :: String -> Int
maxCharge s =
  maximum
      [ 10 * d1 + d2
      | (x:rest) <- tails s
      , not (null rest)
      , let d1 = digitToInt x
      , let d2 = maximum (map digitToInt rest)
      ]


-- Part 2 solution
solvePart2 :: [String] -> Int
solvePart2 inputRanges = 0

readInputFile :: FilePath -> IO (Maybe String)
readInputFile path =
  catch (Just <$> readFile path)
        (\e -> const (return Nothing) (e :: IOException))
