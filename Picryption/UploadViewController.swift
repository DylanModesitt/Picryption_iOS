//
//  UploadViewController.swift
//  Picryption
//
//  Created by Dylan C Modesitt on 4/28/17.
//  Copyright © 2017 Modesitt Systems. All rights reserved.
//

import UIKit
import Photos

class UploadViewController: UIViewController, UINavigationControllerDelegate {
    
    // MARK: -Variables

    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var imagePicker = UIImagePickerController()
    
    var image: UIImage?
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        managePermissions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.goToMessage {
            let vc = segue.destination as? MessageViewController
            vc?.image = image
        }
    }
    
    
    // MARK: - IB Methods
    @IBAction func uploadImage(_ sender: Any) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            setImagePickerPreferences()
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    

}

extension UploadViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: { () -> Void in
            print("Image view controller was dimissed")
        })
        
        if let pickedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            self.image = pickedImage
            self.performSegue(withIdentifier: Segues.goToMessage, sender: self)
        }
        
    }
    
    
}


// Methods Extensions
extension UploadViewController {
    
    func managePermissions() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            print("Authorized")
            break
        case .denied, .restricted :
            
            UIAlertView.simpleAlert(withTitle: "Picryption Requires Photo Access", andMessage: "Please go to your settings -> Privacy -> Photo & Video and enable Picryption to use your photos!").show()
            
        case .notDetermined:
            // ask for permissions
            PHPhotoLibrary.requestAuthorization() { status in }
            
        }
    }
    
    func setImagePickerPreferences() {
        print("Setting preferences")
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum;
        imagePicker.allowsEditing = false
    }
    
}
