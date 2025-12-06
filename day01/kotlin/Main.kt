import java.io.File

/**
 * Advent of Code 2025 - Day 01
 * 
 * How to run:
 * 1. Using kotlinc (compile and run):
 *    kotlinc Main.kt -include-runtime -d Main.jar
 *    java -jar Main.jar
 * 
 * 2. Using kotlin script:
 *    kotlin Main.kt
 * 
 * 3. Using IntelliJ IDEA or other IDE:
 *    Open this file and run the main function
 */

fun main() {
    // Read input file (assumes input.txt is in the parent directory)
    val inputFile = File("../input.txt")
    
    if (!inputFile.exists()) {
        println("Error: input.txt not found")
        return
    }
    
    val lines = inputFile.readLines()
    
    println("Day 01 Solution")
    println("===============")
    println("Read ${lines.size} lines from input.txt")
    println()
    
    // Process each line
    lines.forEach { line ->
        // TODO: Implement your solution here
        println("Line: $line")
    }
    
    // Part 1
    val part1Result = solvePart1(lines)
    println("Part 1: $part1Result")
    
    // Part 2
    val part2Result = solvePart2(lines)
    println("Part 2: $part2Result")
}

fun solvePart1(lines: List<String>): Any {
    // TODO: Implement Part 1 solution
    return "Not implemented yet"
}

fun solvePart2(lines: List<String>): Any {
    // TODO: Implement Part 2 solution
    return "Not implemented yet"
}
