//
//  NewRec.swift
//  myRe
//
//  Created by sumayah on 04/08/1443 AH.
//

import UIKit
import VisionKit


let nweRecNotificationkey = "com.matrix.newRecData"

class NewRec: UIViewController, UIImagePickerControllerDelegate  ,UINavigationControllerDelegate,UITextFieldDelegate{
    
    @IBOutlet weak var test: UIButton!
    var isCreation = true
    var editedRec : DataMyRe?
    var editedRecindex : Int?


    @IBOutlet weak var newRectitle: UITextField!
    @IBOutlet weak var newRecDate: UIDatePicker!
    @IBOutlet weak var newRecImage: UIImageView!
    
    @IBOutlet weak var mainBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRectitle.delegate = self
        if isCreation == false {
            mainBtn.setTitle("Edit", for: .normal)
            
            if let rec = editedRec {
                newRectitle.text = rec.retitle
                newRecDate.date = rec.reDate
                newRecImage.image = rec.reImage
                
            }
            
            
            
        }
        
       
    }

    private func configureDocumentView(){
        let scanningDocumentVC = VNDocumentCameraViewController()
        scanningDocumentVC.delegate = self
        self.present(scanningDocumentVC, animated: true, completion: nil)
    }
    @IBAction func newRecAdded(_ sender: Any) {
        if isCreation{
            
            let dataMyRe = DataMyRe(retitle: newRectitle.text!,reDate: newRecDate.date, reImage: newRecImage.image!)
            //        DataMyRe(retitle: newRectitle.text!, reImage: newRecImage.image!)
            //        let dataMyRe = DataMyRe(retitle: newRectitle.text!)
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "mewReAdded"), object: nil, userInfo: ["addedData":dataMyRe])
            //        NotificationCenter.default.post(name: Notification.Name(nweRecNotificationkey), object: nil , userInfo: ["mewReAdded":dataMyRe])
        }else
        {
            let edieDate = DataMyRe(retitle: newRectitle.text!,reDate: newRecDate.date, reImage: newRecImage.image!)
            NotificationCenter.default.post(name:NSNotification.Name(rawValue: "currentReAdded") , object: nil, userInfo: ["editedData":edieDate ,"editedIndex": editedRecindex])
          
        }
        dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func newRecimageup(_ sender: Any) {
        
         showphotoalert()

    }
    
    func showphotoalert(){
        let alert = UIAlertController(title: "Take photo from", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "camera", style: .default, handler: {action in
//            self.getPhoto(type: .camera)
            self.configureDocumentView()

            
        }))
        alert.addAction(UIAlertAction(title: "photo library", style: .default, handler: {action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
            present(alert, animated: true, completion: nil)
            
    }
    
//    @IBAction func TouchUpInsideCameraButton(_ sender: Any) {
//
//        configureDocumentView()
//    }
    

    
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.delegate = self
        present(picker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else{
            print("image not found")
            return
        }
        newRecImage.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
   
    
  
}



extension NewRec:VNDocumentCameraViewControllerDelegate{
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        
        for pageNumber in 0..<scan.pageCount{
            
             let image = scan.imageOfPage(at: pageNumber)
            
            newRecImage.image = image
           
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
