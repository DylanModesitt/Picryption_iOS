//
//  ProcessViewController.swift
//  Picryption
//
//  Created by Dylan C Modesitt on 4/28/17.
//  Copyright © 2017 Modesitt Systems. All rights reserved.
//

import UIKit

class ProcessViewController: UIViewController {
    
    // MARK - Variables
    var image: UIImage?
    var message: String?
    
    // MARK - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func didRequestDownload(_ sender: Any) {
        
        let image = self.image as? Image
        image?.encryptMessage(withMethod: SteganographyMethod.StandardLSBSteganography, withData: message?.toBinaryArray())
        
        // TODO finish imlimentation
    }

}
