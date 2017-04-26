//: Playground - noun: a place where people can play

import UIKit

var str = "He"


extension String {
    
    // obvious extensions for the purpose of taking strings in and out of binary
    // sequences
    
    func toBinary() -> Data? {
        return self.data(using: String.Encoding.utf8, allowLossyConversion: false)
    }
    
    func toBinaryString(withFormat: String) -> String? {
        return self.toBinary()?.reduce("", { $0 + String(format: withFormat, $1)})
    }
    
    func toBinaryArray() -> [[Int]] {
        var binaryRepresentation: [[Int]] = []
        let binary = self.toBinary()!
        for byte in binary {
            print(byte)
            binaryRepresentation.append(Int(byte).toBinaryArray())
        }
        return binaryRepresentation
    }
    
}

extension Int {
    
    func toBinaryArray() -> [Int] {
        var binaryBuilder: [Int] = []
        var number = self
        while number != 1 {
            binaryBuilder.append(number % 2)
            number /= 2
        }
        binaryBuilder.append(1)
        return binaryBuilder.reversed()
    }
    
}


print(str.toBinaryArray())

