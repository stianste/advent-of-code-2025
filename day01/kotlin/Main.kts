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

  val part2Result = solvePart2(lines)
  println("Part 2: $part2Result")
}

fun solvePart1NaiveImperative(lines: List<String>): Int {
  var numberOfHits = 0
  var currentPosition = 50

  lines
    .map { it.splitAtIndex(1) }
    .map { Pair(it.first, it.second.toInt()) }
    .forEach { (direction, value) ->
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

fun solvePart2(lines: List<String>): Any {
  // TODO: Implement Part 2 solution
  return "Not implemented yet"
}

fun String.splitAtIndex(index: Int): Pair<String, String> = take(index) to substring(index)

main()
