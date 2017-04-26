//
//  Extensions.swift
//  Picryption
//
//  Created by Dylan Modesitt on 4/21/17.
//  Copyright © 2017 Modesitt Systems. All rights reserved.
//

import Foundation
import UIKit


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
    
    // returns the nuymber in binary form (as an array of ints 0, or 1)
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

extension UIAlertView {
    static func simpleAlert(withTitle title: String, andMessage message: String) -> UIAlertView {
        let alert = self.init()
        alert.title = title
        alert.message = message
        alert.addButton(withTitle: "Ok")
        return alert
    }
}

extension UIColor {
    // Create a color for iOS from a hexCode
    static func fromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
}


extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}


extension UIViewController {
    
    func setStatusBarLight() {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func setStatusBarDefault() {
        UIApplication.shared.statusBarStyle = .default
    }
    
}


extension String {
    
    func toDate() -> NSDate? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.date(from: self) as NSDate?
    }
    
}

extension String {
    func toTime() -> NSDate? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.date(from: self) as NSDate?
    }
}


extension NSDate {
    
    func toDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: self as Date)
    }
    
    
    func toTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter.string(from: self as Date)
    }
    
    func toDateTraditionallyFormatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: self as Date)
    }
    
}
