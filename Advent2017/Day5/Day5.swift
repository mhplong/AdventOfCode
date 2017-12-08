#!/usr/bin/swift
import Foundation

let filePath = CommandLine.arguments[1]

let fileManager = FileManager.default
let contents = fileManager.contents(atPath: filePath)!
let input = String(data: contents, encoding:String.Encoding.ascii)!
var instructions = input.split(separator: "\n").map { Int($0)! }
var steps = 0

var index = 0
while(index < instructions.count) {
    let offset = instructions[index]
    if (offset > 2) {
        instructions[index] -= 1
    } else {
        instructions[index] += 1
    }
    steps += 1
    index += offset
    if (index >= instructions.count) {
        break
    }
}
print(steps)
