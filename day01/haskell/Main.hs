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
      
      -- Process each line
      mapM_ (\line -> putStrLn $ "Line: " ++ line) inputLines
      
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

-- Part 1 solution
solvePart1 :: [String] -> String
solvePart1 _inputLines = 
  -- TODO: Implement Part 1 solution
  "Not implemented yet"

-- Part 2 solution
solvePart2 :: [String] -> String
solvePart2 _inputLines = 
  -- TODO: Implement Part 2 solution
  "Not implemented yet"
