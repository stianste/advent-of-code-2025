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
kotlinc Main.kts -include-runtime -d Main.jar
java -jar Main.jar

# Option 2: Run as script
kotlinc -script Main.kts
```

### Haskell

Navigate to the day's haskell folder and run:

```bash
cd dayXX/haskell
cabal run
```

## Prerequisites

- **Kotlin**: [Kotlin compiler](https://kotlinlang.org/docs/command-line.html)
- **Haskell**: [GHCup](https://www.haskell.org/ghcup/) (installs GHC, cabal, and other tools)
  - Install GHCup: `curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh`
  - On macOS with Homebrew: `brew install ghcup`
  - This will install GHC (the compiler), cabal (build tool), and other Haskell tools

## Progress

- [ ] Day 01 - ⚙️ Boilerplate ready
