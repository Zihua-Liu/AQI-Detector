//
//  ViewController.swift
//  Weather
//
//  Created by liuzihua on 17/5/7.
//  Copyright © 2017年 liuzihua. All rights reserved.
//

import UIKit
import Foundation

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    open var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    @IBAction func useLibrary(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func uploadImage(_ sender: UIButton) {
        var result:Int?
        //上传地址
        let url = URL(string: "http://162.105.146.180:8031/upload.php")
        //请求
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        
        try? UIImageJPEGRepresentation(image!, 0.1)?.write(to: URL(fileURLWithPath: NSHomeDirectory() + "/tmp/a.jpg"), options: [.atomic])
        
        //上传数据流
        let documents =  NSHomeDirectory() + "/tmp/a.jpg"
        let imgData = try! Data(contentsOf: URL(fileURLWithPath: documents))
        
        let uploadTask = session.uploadTask(with: request as URLRequest, from: imgData, completionHandler: {
            (data:Data?, response:URLResponse?, error:Error?) -> Void in
            //上传完毕后
            if error != nil{
                result = -1
                print(error)
            }else{
                let str = NSString(data: data!, encoding:String.Encoding.utf8.rawValue)
                result = str?.integerValue
                print("上传完毕：\(str)")
            }
        } as! (Data?, URLResponse?, Error?) -> Void)
        //使用resume方法启动任务
        uploadTask.resume()
        while result == nil{
            
        }
        
        let ResultController = UIStoryboard(name: "Result", bundle: nil).instantiateViewController(withIdentifier: "result")
        let resultcontroller = ResultController as! ResultViewController
        resultcontroller.result = result!
        present(ResultController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerControllerDidCancel")
        picker.dismiss(animated: true, completion: nil)
    }
}

