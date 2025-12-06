{-
  Advent of Code 2025 - Day 01

  How to run:
  cabal run
-}

module Main where

import Control.Exception (catch, IOException)

main :: IO ()
main = do
  putStrLn "Day 01 Solution"
  putStrLn "==============="

  -- Read input file (assumes input.txt is in the parent directory)
  contents <- readInputFile "../input.txt"

  case contents of
    Nothing -> putStrLn "Error: Could not read input.txt"
    Just input -> do
      let inputLines = lines input
      putStrLn $ "Read " ++ show (length inputLines) ++ " lines from input.txt"
      putStrLn ""

      -- Part 1
      let part1Result = solvePart1 inputLines
      putStrLn $ "Part 1: " ++ show part1Result

      -- Part 2
      let part2Result = solvePart2 inputLines
      putStrLn $ "Part 2: " ++ show part2Result

-- Helper function to read input file with error handling
readInputFile :: FilePath -> IO (Maybe String)
readInputFile path =
  catch (Just <$> readFile path)
        (\e -> const (return Nothing) (e :: IOException))

parseLine :: String -> (Char, Int)
parseLine (d:v) = (d, read v)
parseLine _ = error "Invalid input line"

-- Part 1 solution
solvePart1 :: [String] -> Int
solvePart1 inputLines =
  let
    moves = map parseLine inputLines
    (_, hits) = foldl step (50, 0) moves
    step :: (Int, Int) -> (Char, Int) -> (Int, Int)
    step (pos, cumulatedHits) (dir, val) =
      let newPos = case dir of
            'R' -> pos + val
            'L' -> pos - val
            _   -> error $ "Unknown direction: " ++ [dir]
          newHits = if newPos `mod` 100 == 0 then cumulatedHits + 1 else cumulatedHits
      in (newPos, newHits)
  in hits

-- Part 2 solution
solvePart2 :: [String] -> String
solvePart2 _inputLines =
  -- TODO: Implement Part 2 solution
  "Not implemented yet"
