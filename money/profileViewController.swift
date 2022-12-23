//
//  profileViewController.swift
//  money
//
//  Created by Maryam Aloudah on 07/03/2022.
//

import UIKit

class profileViewController: UIViewController , UITableViewDelegate ,UITableViewDataSource {
    var arrayprofie = [profileSettings] ()
    struct profileSettings{
        var title_p:String
        var icon:UIImage
     
    }
    @IBOutlet weak var itemsTable: UITableView!
    
    @IBOutlet weak var myReciptsBtn: UITableViewCell!
    
    @IBOutlet weak var profiletable: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell3 = profiletable.dequeueReusableCell(withIdentifier: "profileCellID") as! profileTableViewCell
        let data3 = arrayprofie[indexPath.row]
        
        cell3.setUpcellProfile( titleProfile : data3.title_p,
                                iconsProfile :data3.icon
                         
        )
        return cell3
    
    }
    
    
    



    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//    }
//
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if (indexPath.row == 2)
        {

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! MyRecVC
             self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
           // Navigate on other view
        }
    }
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profiletable.delegate = self
        profiletable.dataSource = self
        
//        UIImage(systemName: "globe")
//        UIImage(systemName: "gearshape.2.fill")
//        UIImage(systemName: "newspaper.fill")
        arrayprofie.append(profileSettings.init(title_p:"Language" ,icon:      UIImage(systemName: "globe")!))
        arrayprofie.append(profileSettings.init(title_p:"Settings" ,icon:        UIImage(systemName: "gearshape.2.fill")! ))
        arrayprofie.append(profileSettings.init(title_p:"My Recipts" ,icon:      UIImage(systemName: "newspaper.fill")!))
        
    }

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
