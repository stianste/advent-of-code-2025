import java.io.File

fun main() {
  // Read input file (assumes input.txt is in the parent directory)
  val inputFile = File("../input.txt")

  val lines = inputFile.readLines()

  println("Day 01 Solution")
  println("===============")
  println("Read ${lines.size} lines from input.txt")
  println()

  val part1Result = solvePart1NaiveImperative(lines)
  println("Part 1: $part1Result")

  val part2Result = solvePart2SuperLazyNaive(lines)
  println("Part 2: $part2Result")

  val part1FunctionalResult = solvePart1Functional(lines)
  println("Part 1 (Functional): $part1FunctionalResult")
}

fun solvePart1NaiveImperative(lines: List<String>): Int {
  var numberOfHits = 0
  var currentPosition = 50

  mapAndSplit(lines).forEach { (direction, value) ->
    when (direction) {
      "R" -> currentPosition += value
      "L" -> currentPosition -= value
      else -> throw IllegalArgumentException("Unknown direction: $direction")
    }

    if (currentPosition % 100 == 0) {
      numberOfHits++
    }
  }

  return numberOfHits
}

fun solvePart2SuperLazyNaive(lines: List<String>): Int {
  var numberOfHits = 0
  var currentPosition = 50

  mapAndSplit(lines).forEach { (direction, value) ->
    when (direction) {
      "R" -> {
        repeat(value) {
          currentPosition++
          if (currentPosition % 100 == 0) {
            numberOfHits++
          }
        }
      }
      "L" -> {
        repeat(value) {
          currentPosition--
          if (currentPosition % 100 == 0) {
            numberOfHits++
          }
        }
      }
      else -> throw IllegalArgumentException("Unknown direction: $direction")
    }
  }

  return numberOfHits
}

fun solvePart1Functional(lines: List<String>): Int =
  mapAndSplit(lines)
    .fold(Pair(50, 0)) { (currentPosition, numberOfHits), (direction, value) ->
      val newPosition =
        when (direction) {
          "R" -> currentPosition + value
          "L" -> currentPosition - value
          else -> throw IllegalArgumentException("Unknown direction: $direction")
        }

      val hitsThisMove =
        if (newPosition % 100 == 0) {
          1
        } else {
          0
        }

      Pair(newPosition, numberOfHits + hitsThisMove)
    }
    .second

fun String.splitAtIndex(index: Int): Pair<String, String> = take(index) to substring(index)

fun mapAndSplit(lines: List<String>) =
  lines.map { it.splitAtIndex(1) }.map { Pair(it.first, it.second.toInt()) }

main()
