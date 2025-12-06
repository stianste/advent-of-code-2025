# Advent of Code 2025

My solutions for [Advent of Code 2025](https://adventofcode.com/2025) in multiple programming languages.

## Structure

Each day is organized in its own folder with the following structure:

```
dayXX/
├── input.txt          # Puzzle input
├── kotlin/
│   └── Main.kt       # Kotlin solution
└── haskell/
    └── Main.hs       # Haskell solution
```

## Languages

- **Kotlin**: Modern JVM language with concise syntax
- **Haskell**: Purely functional programming language

## Running Solutions

### Kotlin

Navigate to the day's kotlin folder and run:

```bash
cd dayXX/kotlin
# Option 1: Compile and run
kotlinc Main.kt -include-runtime -d Main.jar
java -jar Main.jar

# Option 2: Run as script
kotlin Main.kt
```

### Haskell

Navigate to the day's haskell folder and run:

```bash
cd dayXX/haskell
# Option 1: Compile and run
ghc Main.hs -o main
./main

# Option 2: Run directly with interpreter
runhaskell Main.hs
```

## Prerequisites

- **Kotlin**: [Kotlin compiler](https://kotlinlang.org/docs/command-line.html)
- **Haskell**: [GHC](https://www.haskell.org/ghc/) or [Stack](https://docs.haskellstack.org/)

## Progress

- [x] Day 01