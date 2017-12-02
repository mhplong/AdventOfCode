#!/usr/bin/swift

import Foundation

var filePath = CommandLine.arguments[1]
print(filePath)
let fileManager = FileManager.default

let contents = fileManager.contents(atPath: filePath)!
var input = String(data: contents, encoding:String.Encoding.ascii)!
input = input.trimmingCharacters(in: ["\r", "\n"])

var numbers = Array(input)
var matchedNumbers: [Int] = []
for index in 0..<numbers.count {
    let value = Int(String(numbers[index]))!
    var nextValue: Int
    if (index+1 != numbers.count) {
        print(index+1)
        nextValue = Int(String(numbers[index+1]))!
    } else {
        nextValue = Int(String(numbers[0]))!
    }
    if (value == nextValue) {
        matchedNumbers.append(value)
    }
}

print("Result \(matchedNumbers.reduce(0, +))")
