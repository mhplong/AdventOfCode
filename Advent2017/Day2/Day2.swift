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
    var lowestNumber: Int!
    var highestNumber = 0
    for number in row.split(separator: "\t") {
        let value = Int(number)!
        
        lowestNumber = lowestNumber ?? value
        
        lowestNumber = min(lowestNumber, value)
        highestNumber = max(highestNumber, value)
    }
    print("\(lowestNumber!): \(highestNumber)")
    checksum.append(highestNumber - lowestNumber!)
}
print(checksum)
print(checksum.reduce(0, +))
