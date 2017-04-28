//
//  MessageViewController.swift
//  Picryption
//
//  Created by Dylan C Modesitt on 4/28/17.
//  Copyright © 2017 Modesitt Systems. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    // MARK - Variables
    var image: UIImage?
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - View Controller Lifecycle 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.processParameters {
            let vc = segue.destination as? ProcessViewController
            vc?.image = image
            vc?.message = textView.text
        }
    }
    

    // MARK - Methods
    @IBAction func doneEditingText(_ sender: Any) {
        self.performSegue(withIdentifier: Segues.processParameters, sender: self)
    }
}
