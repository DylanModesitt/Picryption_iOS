//
//  Image.swift
//  Picryption
//
//  Created by Dylan Modesitt on 4/21/17.
//  Copyright © 2017 Modesitt Systems. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

/*
 * The Image Class for Picryption
 *
 * Involves the changing of least significant bit of images
 * to encode data inside them. Notably, text.
 *
*/

enum SteganographyMethod {
    case StandardLSBSteganography
}

class Image: UIImage {
    
    // ToDo: Impliment this

    func encryptMessage(withMethod method: SteganographyMethod, withData data: [[Int]]?) {
        
        switch method {
        case .StandardLSBSteganography:
            encryptMessageWithLSB(withData: data)
            return
        }
        
    }
    
    private func encryptMessageWithLSB(withData data: [[Int]]?) {
        // iterate through every pixel
        // ajust pixel color to encode 3-bits of data 
        // ajust the data array to represent chagnes
        // continue 
        
        print("called")
        
        let pixelData = self.cgImage?.dataProvider?.data
        
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let height = Int(self.size.height)
        let width = Int(self.size.width)
        let zArry = [Int](repeating: 0, count:3)
        let yArry = [[Int]](repeating: zArry, count:width)
        let xArry = [[[Int]]](repeating: yArry, count:height)
        
        for (index, value) in xArry.enumerated() {
            for (index1, value1) in value.enumerated() {
                for (index2, var value2) in value1.enumerated() {
                    
                    let pixelInfo: Int = ((width * index) + index1) * 4 + index2
                    
                    value2 = Int(data[pixelInfo])
                    
                    print(value2)
                }
            }
        }
        
    }
    
    
}
