//
//  CollectionViewController.swift
//  Home-MC3
//
//  Created by Ghada on 07/03/2022.
//

import UIKit
import Charts
import TinyConstraints

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var PieStack: UIStackView!
    var BarStack: UIStackView!
    lazy var piechart: PieChartView = {
        let pieChartView = PieChartView()
        pieChartView.sizeToFit()
        return pieChartView
    }()

    lazy var barchart: BarChartView = {
        let barChartView = BarChartView()
        barChartView.sizeToFit()
        return barChartView
    }()
    
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        
//        PieStack.addSubview(piechart)
//        piechart.width(320)
//        piechart.height(320)
//        piechart.centerInSuperview()
//
//        let l = piechart.legend
//        l.horizontalAlignment = .left
//        l.verticalAlignment = .center
//        l.orientation = .vertical
//        l.xEntrySpace = 7
//        l.yEntrySpace = 0
//        l.yOffset = 0
//        setDataPie()
        
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var Charts: [UIStackView] = [PieStack]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath) as! CollectionViewCell
        //cell.ChartStackView = Charts[indexPath.row]
        return cell
    }
    
    
//    func setDataPie(){
//        let set1 = PieChartDataSet(entries: entriesPie, label: "")
//        let data = PieChartData(dataSet: set1)
//        piechart.data = data
//        set1.colors = ChartColorTemplates.vordiplom()
//            + ChartColorTemplates.joyful()
//            + ChartColorTemplates.colorful()
//            + ChartColorTemplates.liberty()
//            + ChartColorTemplates.pastel()
//            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
//        set1.drawIconsEnabled = false
//        set1.sliceSpace = 2
//        
//        data.setValueFont(.systemFont(ofSize: 12, weight: .light))
//        data.setValueTextColor(.black)
//    }
//
//    let entriesPie = (0..<4).map { (i) -> PieChartDataEntry in
//        // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
//        let category:[String] = ["Car","Grocery","Intertanment","Bills"]
//        
//        return PieChartDataEntry(value: Double(arc4random_uniform(100)*20/5),label: category[i % category.count])
//                                
//    }
    

   
}
