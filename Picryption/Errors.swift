//
//  Errors.swift
//  Picryption
//
//  Created by Dylan Modesitt on 4/21/17.
//  Copyright © 2017 Modesitt Systems. All rights reserved.
//

import Foundation
import UIKit


enum ErrorType: String {
    case SteganographyFailedError = "Picryption Failed"
}

struct ErrorManager {
    
    static func presentErrorView(errorType: ErrorType) {
        ErrorManager.presentErrorView(errorMessage: errorType.rawValue)
    }
    
    static func presentErrorView(errorMessage: String) {
        let view = UIAlertView.simpleAlert(withTitle: "Error", andMessage: errorMessage)
        view.show()
    }
    
}
