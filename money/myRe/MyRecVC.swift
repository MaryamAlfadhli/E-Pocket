//
//  ViewController.swift
//  myRe
//
//  Created by sumayah on 02/08/1443 AH.
//

import UIKit
import Foundation

class MyRecVC: UIViewController{
    
    var arrRec :[DataMyRe] = []
    
    @IBOutlet weak var myRecTableView: UITableView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myRecTableView.dataSource = self
        myRecTableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(setUpCell), name: NSNotification.Name(rawValue: "mewReAdded"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(currentReAdded), name: NSNotification.Name(rawValue: "currentReAdded"), object: nil)

        
        

    }
    
    @IBAction func AddBtn(_ sender: Any) {
        let s = self.storyboard?.instantiateViewController(withIdentifier: "newrecadded") as! NewRec
        present(s, animated: true, completion: nil)

    }
    
    
    @objc func setUpCell(reData: Notification){
        
        if let newRe = reData.userInfo?["addedData"] as? DataMyRe {
            arrRec.append(newRe)
            myRecTableView.reloadData()

        }
        
        
    
        
        
         
     }
    
    @objc func currentReAdded(notification: Notification){
           if let editRe = notification.userInfo?["editedData"] as? DataMyRe {
               if let index = notification.userInfo?["editedData"] as? Int {
                   arrRec[index] = editRe
                   print(arrRec[index])
                   myRecTableView.reloadData()
                
                

               }

           }
       }
  


}
extension MyRecVC : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyRecCellTableViewCell
        
        cell.lbtitle.text = arrRec[indexPath.row].retitle
    //image
        cell.MyRecImage.image = arrRec[indexPath.row].reImage
        cell.MyRecImage.layer.cornerRadius =
        cell.MyRecImage.frame.width / 2
//date to sering
        //"yyyy-MM-dd HH:mm:ss"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myString = formatter.string(from: arrRec[indexPath.row].reDate)
        cell.lbdate.text = myString
       
        return cell
       
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let myImage = arrRec[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "ImageView") as? ImageViewController
        
        if let viweController = vc {
            viweController.DataMyRe = myImage
            viweController.index = indexPath.row
            present(viweController, animated: true, completion: nil)
        }
      
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.arrRec.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
     
    
    
    
}




