
import UIKit
import Charts
import TinyConstraints
import Foundation

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, ChartViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,AddNewExpDelegate {
    

    @IBAction func addNewExpBtn(_ sender: Any) {
        let AddNewExp = self.storyboard?.instantiateViewController(withIdentifier: "AddNewExp") as! AddNewExp
        present(AddNewExp, animated: true, completion: nil)
        AddNewExp.addNewExpDelegate = self

    }
    @IBOutlet weak var calendarBtn: UIButton!
    @IBOutlet weak var toggle: UISegmentedControl!
    @IBOutlet weak var Charts: UICollectionView!
    @IBOutlet weak var chartStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalSpending: UILabel!
    
    
    var ChartsArray: [UIView]! =  nil
    var selected  = false
    //set the X and Y Axis values for the bar chart
    var barX = [NSLocalizedString("January", comment: ""),NSLocalizedString("February", comment: ""),NSLocalizedString("March", comment: "")]
    var barY = [241,342,53]
    //set the categories and its values for the pie chart
    let pieCategory:[String] = [NSLocalizedString("Car", comment: "String"),NSLocalizedString("Grocery", comment: ""),NSLocalizedString("Entertainment", comment: ""),NSLocalizedString("Bills", comment: "")]
    let pieValues = [235,632,162,464]
    
    // array for charts label
    let labels = [NSLocalizedString("Current Month", comment: "") ,NSLocalizedString("Last 3 months", comment: "")]
    //set The table data
    var months: [String] = [NSLocalizedString("January", comment: ""),NSLocalizedString("February", comment: ""),NSLocalizedString("March", comment: ""),NSLocalizedString("April", comment: ""),NSLocalizedString("May", comment: ""),NSLocalizedString("June", comment: ""),NSLocalizedString("July", comment: ""),NSLocalizedString("Augest", comment: ""),NSLocalizedString("September", comment: ""),NSLocalizedString("October", comment: ""),NSLocalizedString("November", comment: ""),NSLocalizedString("December", comment: ""),]
        var infoM: [String] = []//Numbersgenerator(12)
        var infoD: [String] = []
        var totalSpendingM = ""
        var totalSpendingW = ""
        let formatter = NumberFormatter()
    
    func Numbersgenerator (_ x: Int,_ mult: Double)-> [String]{
        var array: [String] = []
        var ts = 0
             
   
        for i in 0..<x
        {
            var random = Int(Double(arc4random_uniform(200))+11.27*mult)
            var loc = formatter.string(from: NSNumber(value: random))
      
            array.append("\(loc!.description) \(NSLocalizedString("SAR", comment: ""))")
            ts+=random
        }
         var tsLoc = formatter.string(from: NSNumber(value: ts))
  
        if x == 12 {
            
            totalSpendingM = tsLoc!.description
        }
        else {
            totalSpendingW = tsLoc!.description
        }
        return array
    }
    var days: [String] = [NSLocalizedString("Sunday", comment: ""),NSLocalizedString("Monday", comment: ""),NSLocalizedString("Tuesday", comment: ""),NSLocalizedString("Wednesday", comment: ""),NSLocalizedString("Thursday", comment: ""),NSLocalizedString("Friday", comment: ""),NSLocalizedString("Saturday", comment: "")]

    // create pie chart
    lazy var piechart: PieChartView = {
        let pieChartView = PieChartView()
        pieChartView.legend.enabled = false
        pieChartView.accessibilityLabel = "Current month expenses based on categories"
        return pieChartView
    }()
    // create bar chart
    lazy var barchart: BarChartView = {
        let barChartView = BarChartView()
        barChartView.legend.enabled = false
        barChartView.accessibilityLabel = "Last 3 months expenses"
        return barChartView
    }()
    // color templates for the chart
    let chartcolors = ChartColorTemplates.vordiplom()
        + ChartColorTemplates.joyful()
        + ChartColorTemplates.colorful()
        + ChartColorTemplates.liberty()
        + ChartColorTemplates.pastel()
        + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Charts.dataSource = self
        Charts.delegate = self
        toggle.addTarget(self, action: #selector(self.onSwitchValueChanged), for: .valueChanged)
        ChartsArray = [piechart,barchart]
        barchart.width(355)
        barchart.height(200)
        piechart.width(355)
        piechart.height(250)
        infoM = Numbersgenerator(12,100)
        infoD = Numbersgenerator(7, 10)
        formatter.locale = Locale.current
        setDataPie()
        setDataBar()

    }

        @objc func onSwitchValueChanged (switch: UISwitch){
            selected.toggle()
            tableView.reloadData()
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DaysTableViewCell
    
        if selected == false{
            totalSpending.text = "\(totalSpendingW) \(NSLocalizedString("SAR", comment: ""))"
            cell.setupCell(dayS: days[indexPath.row], infoS: infoD[indexPath.row])
          }
            else {
            totalSpending.text = "\(totalSpendingM) \(NSLocalizedString("SAR", comment: ""))"
            cell.setupCell(dayS: months[indexPath.row], infoS: infoM[indexPath.row])
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChartsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homecell", for: indexPath) as! CollectionViewCell
        cell.ChartView.addSubview(ChartsArray[indexPath.row])
        cell.chartTitle.text = labels[indexPath.row]
    
        if indexPath.row == 1{
            barchart.bottomToSuperview()
        }
        return cell
    }
    
    func setDataPie(){
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<pieValues.count
        {
            let dataEntry = PieChartDataEntry(value: Double(pieValues[i]),label: pieCategory[i % pieCategory.count])
            dataEntries.append(dataEntry)
            dataEntry.accessibilityLabel = "Entry\(i)"
        }
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: NSLocalizedString("Current Month", comment: ""))
        let data = PieChartData(dataSet: chartDataSet)
        piechart.data = data
        chartDataSet.colors = chartcolors
        chartDataSet.sliceSpace = 2
        piechart.entryLabelColor = .black
        data.setValueTextColor(.black)
        data.setValueFont(.systemFont(ofSize: 14, weight: .light))
    }
  
    @objc(BarChartFormatter)
    public class BarChartFormatter: NSObject, IAxisValueFormatter
    {
        var names = [String]()

        public func stringForValue(_ valueE: Double, axis: AxisBase?) -> String
        {
            return names[Int(valueE)]
        }

        public func setValues(values: [String])
        {
            self.names = values
        }
    }
    
    func setDataBar(){
        let formatter = BarChartFormatter()
        formatter.setValues(values: barX)
        let xaxis:XAxis = XAxis()
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<barY.count
        {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(barY[i]))
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
        let chartData = BarChartData(dataSet: chartDataSet)
        barchart.data = chartData
        xaxis.valueFormatter = formatter
        barchart.rightAxis.enabled = false
        barchart.xAxis.labelPosition = .bottom
        barchart.xAxis.valueFormatter = xaxis.valueFormatter
        barchart.xAxis.granularityEnabled = true
        barchart.xAxis.granularity = 1.0
        barchart.xAxis.labelFont = .systemFont(ofSize: 14, weight: .light)
        barchart.leftAxis.labelFont = .systemFont(ofSize: 14, weight: .light)
        chartData.setValueFont(.systemFont(ofSize: 14, weight: .light))
        chartDataSet.colors = chartcolors
    }
    
    func didselectedAddNewExpe(title: String, Date: Date, value: Double, categ: String, note: String) {

    }
}

