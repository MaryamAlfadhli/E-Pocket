//
//  wishlistViewController.swift
//  money
//
//  Created by Maryam Aloudah on 07/03/2022.
//

import UIKit

class wishlistViewController: UIViewController , UITableViewDelegate ,  UITableViewDataSource  {
    
    @IBOutlet weak var wishtable: UITableView!
    var arraywishs = [wishlist] ()
    struct wishlist{
        var prodName:String
        var priceOfit:Int
     //   var status:Bool
        //var chart:String
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraywishs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = wishtable.dequeueReusableCell(withIdentifier: "checklistID") as! WishliistTableViewCell
        let data2 = arraywishs[indexPath.row]
        

        
    
        
        cell2.setupWlCell( price : data2.priceOfit, nameofproduct:data2.prodName
                          //, chartofwish: data2.chart
        )
        
        return cell2
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        wishtable.delegate = self
        wishtable.dataSource = self
        
        arraywishs.append(wishlist.init(prodName:"Dress" ,priceOfit:6000 ))
        arraywishs.append(wishlist.init(prodName:"Flowers" ,priceOfit:1200 ))
     
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

}
