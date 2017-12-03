#!/usr/bin/swift

import Foundation

var filePath = CommandLine.arguments[1]

let fileManager = FileManager.default

let contents = fileManager.contents(atPath: filePath)!
var input = String(data: contents, encoding:String.Encoding.ascii)!
input = input.trimmingCharacters(in: ["\r", "\n"])

var checksum: [Int] = []
var rows = input.split(separator: "\n")
for row in rows {
    var lowerNumber = 1
    var higherNumber = 2
    var numbers = row.split(separator: "\t")
    for baseIndex in 0..<numbers.count {
        let value = Int(numbers[baseIndex])!
        for index in baseIndex..<numbers.count {
            let secondValue = Int(numbers[(index+1) % numbers.count])!
            let lowerBound = min(value, secondValue)
            let upperBound = max(value, secondValue)
            if (upperBound % lowerBound == 0) {
                lowerNumber = lowerBound
                higherNumber = upperBound
            }
        }
    }
    print("\(higherNumber): \(lowerNumber)")
    checksum.append(higherNumber / lowerNumber)
}
print(checksum)
print(checksum.reduce(0, +))
