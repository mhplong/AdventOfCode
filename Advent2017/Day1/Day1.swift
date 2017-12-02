#!/usr/bin/swift

import Foundation

var filePath = CommandLine.arguments[1]

let fileManager = FileManager.default

let contents = fileManager.contents(atPath: filePath)!
var input = String(data: contents, encoding:String.Encoding.ascii)!
input = input.trimmingCharacters(in: ["\r", "\n"])

var numbers = Array(input)
var median = numbers.count / 2
var matchedNumbers: [Int] = []
for index in 0..<numbers.count {
    let value = Int(String(numbers[index]))!
    let nextIndex = (index+median) % numbers.count
    let nextValue = Int(String(numbers[nextIndex]))!
    if (value == nextValue) {
        matchedNumbers.append(value)
    }
}

print("Result \(matchedNumbers.reduce(0, +))")
