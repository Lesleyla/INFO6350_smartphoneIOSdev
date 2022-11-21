//
//  AddaPostViewController.swift
//  instatok
//
//  Created by 郭梦阳 on 11/19/22.
//

import UIKit
import CoreLocation
import FirebaseAuth
import FirebaseFirestore
/**
 1.create outlets for the image view
 2.add privacy in info.plist for images
 3.
 */

class AddaPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtCaption: UITextField!
    
    let locationManager = CLLocationManager()
    var addressText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
    }
    @IBAction func selectImageAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Take a Picture", message: "Awesome Picture", preferredStyle: .alert)
                
        let cameraAction = UIAlertAction(title: "Camera", style: .default){ action in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){ action in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ action in
            print("cancel Pressed")
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.image = image
        }
        picker.dismiss(animated: true)
    }
    
    @IBAction func postAction(_ sender: Any) {
        guard let caption = txtCaption.text else {return}
        let imageURL = "SomeImageURL"
        let timestamp = NSDate().timeIntervalSince1970
    }
    
}

extension AddaPostViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        print(lat)
        print(lng)
        
        getAddressFromLocation(location: location)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func getAddressFromLocation( location: CLLocation){
        
        let clGeoCoder = CLGeocoder()
        
        clGeoCoder.reverseGeocodeLocation(location) { placeMarks, error in
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            var address = ""
            guard let place = placeMarks?.first else { return }
            
            if place.name != nil {
                address += place.name! +  ", "
            }
            
            if place.locality != nil {
                address += place.locality! +  ", "
            }
            if place.subLocality != nil {
                address += place.subLocality! +  ", "
            }
            
            if place.postalCode != nil {
                address += place.postalCode! +  ", "
            }
            
            if place.country != nil {
                address += place.country!
            }
            
            print(address)
            addressText = address
            
        }
    }
}
