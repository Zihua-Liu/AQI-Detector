//
//  ResultViewController.swift
//  Weather
//
//  Created by liuzihua on 17/5/20.
//  Copyright © 2017年 liuzihua. All rights reserved.
//

import UIKit
import Foundation

class ResultViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    open var result: Int = 0
    
    @IBOutlet weak var ResultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.text = String(result)
    }
    
    @IBAction func UseCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    @IBAction func UseLibrary(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        let UploadController = UIStoryboard(name: "Upload", bundle: nil).instantiateViewController(withIdentifier: "upload")
        let uploadcontroller = UploadController as! UploadViewController
        uploadcontroller.image = image
        picker.dismiss(animated: true, completion: nil)
        present(UploadController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
