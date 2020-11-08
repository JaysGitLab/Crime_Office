//
//  AddEvent.swift
//  CrimeApp
//
//  Created by lucas on 11/8/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class AddEvent: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var newImage: UIImageView!
    @IBOutlet var newMain: UITextField!
    @IBOutlet var newDetail: UITextField!
    @IBOutlet var testImage: UIImageView!
    
    var imageName = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func useCamera(_ sender: UIButton) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alert = UIAlertController(title: "No Camera available!", message: "Please make sure your device has camera!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerController.SourceType.camera
            self.present(picker, animated: true, completion: nil)
            
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let capturedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            newImage.contentMode = .scaleToFill
            newImage.image = capturedImage
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveImage(_ sender: UIButton) {
        
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        self.imageName = newMain.text! + ".png"
        
        let fileURL = documentDirectory.appendingPathComponent(self.imageName)
        
        print(FileManager.default.fileExists(atPath: fileURL.path))
        
        if let imageData = newImage.image!.pngData(), !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try imageData.write(to: fileURL)
                print("file saved")
                let alert = UIAlertController(title: "Saved Sucess", message: "Success", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true, completion: nil)
            } catch {
                print("error saving file: ", error)
            }
        }
        
        do {
            let savedImage = try Data(contentsOf: fileURL)
            let image = UIImage(data: savedImage)
            testImage.contentMode = .scaleToFill
            self.testImage.image = image
        } catch {
            print("Image not found!")
        }
    }
    
    
    @IBAction func submitEvent(_ sender: UIButton) {
    }
    
    
    

}
