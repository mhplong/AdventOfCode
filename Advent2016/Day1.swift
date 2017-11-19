#!/usr/bin/swift

import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .medium
let formattedDate = dateFormatter.string(from: Date())

print("Hello \(formattedDate) !!!")
