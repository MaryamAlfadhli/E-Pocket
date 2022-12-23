//
//  planningViewController.swift
//  money
//
//  Created by Maryam Aloudah on 01/08/1443 AH.
//

import UIKit

class planningViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableview: UITableView!
    var arrplans = [saving] ()
//    var costing  = [32000, 22123, 7225]
//    var namesofplans = ["Wedding", "Loan", "Car"]
//    var sts = ["complete", "600 left", "complete"]
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "planingcell") as! planingTableViewCell
        let data = arrplans[indexPath.row]
        

     //   cell.contentView.layer.cornerRadius = 10.0
    
        
        cell.setupofCell(Cost: data.amount , statusofplan: data.status, Nameofplan: data.title )
        
        return cell

    }
    struct saving{
        var title:String
        var amount:Int
     //   var status:Bool
        var status:String
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        //layer rounded
//        diccoverPlans.layer.cornerRadius = 15;
       // diccoverPlans.layer.masksToBounds = true;
        
        arrplans.append(saving.init(title:"Wedding" ,amount: 32000 ,status:"completed" ))
        arrplans.append(saving.init(title:"Trip To LA" ,amount: 1230 ,status:"600 left" ))
        arrplans.append(saving.init(title:"Room Decor" ,amount: 1500 ,status:"complete" ))
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var diccoverPlans: UIView!
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
