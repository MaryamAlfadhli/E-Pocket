//
//  ImageViewController.swift
//  myRe
//
//  Created by sumayah on 08/08/1443 AH.
//

import UIKit

class ImageViewController: UIViewController {
    
    var DataMyRe : DataMyRe!
    var index : Int!

    @IBOutlet weak var reimageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reimageview.image = DataMyRe.reImage

//        NotificationCenter.default.addObserver(self, selector: #selector(showImage), name: NSNotification.Name(rawValue: "mewReAdded"), object: nil)
        
//        reimageview.image = DataMyRe.reImage

        // Do any additional setup after loading the view.
    }
    
//    @objc func showImage(reData: Notification){
//        reimageview.image = DataMyRe.reImage  
//        
//        }
    

    @IBAction func EditBtn(_ sender: Any) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "newrecadded") as! NewRec
//        navigationController?.pushViewController(VC, animated: true)
        VC.isCreation = false
        VC.editedRec = DataMyRe
        VC.editedRecindex = index
        present(VC, animated: true, completion: nil)
        
        
        
    }
    
}
