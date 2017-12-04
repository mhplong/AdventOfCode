#!/usr/bin/swift
import Foundation

let filePath = CommandLine.arguments[1]

let fileManager = FileManager.default
let contents = fileManager.contents(atPath: filePath)!
let input = String(data: contents, encoding:String.Encoding.ascii)!
var validCount = 0
for row in input.split(separator: "\r\n")
{
    var valid = true;
    var dictionary : [Substring: Int] = [:]
    for word in row.split(separator: " ") {
        let sortedWord = Substring(word.sorted(by: <))
        if (dictionary[sortedWord] == 1) {
            valid = false
        }
        dictionary[sortedWord] = 1
    }
    if (valid) {
        validCount += 1
    }
}
print(validCount)
