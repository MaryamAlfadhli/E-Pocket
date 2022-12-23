import UIKit

protocol AddNewExpDelegate{
    func didselectedAddNewExpe(title:String,Date:Date,value:Double,categ :String, note:String)
}


class AddNewExp: UIViewController , UIPickerViewDelegate ,UIPickerViewDataSource,UITextFieldDelegate{
    
    var addNewExpDelegate : AddNewExpDelegate?

    @IBOutlet weak var UTitle: UITextField!
    @IBOutlet weak var UDate: UIDatePicker!
    @IBOutlet weak var UValue: UITextField!

    @IBOutlet weak var Ucateg: UITextField!
    let pickerCateg = UIPickerView()
    var ArrCateg = ["Education","...","ddjdd"]
    var Indx = 0

    @IBOutlet weak var UNote: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerCateg.dataSource=self
        pickerCateg.delegate = self

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let btnDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePicker))
        toolBar.setItems([btnDone], animated: true)

        Ucateg.inputAccessoryView = toolBar

        Ucateg.inputView = pickerCateg
    }


    @IBAction func BtnAddNew(_ sender: Any) {
        let Home1ViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        dismiss(animated: true, completion: nil)
        addNewExpDelegate?.didselectedAddNewExpe(title: UTitle.text!, Date: UDate.date, value: Double(UValue.text!)!, categ: Ucateg.text!, note: UNote.text!)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ArrCateg.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ArrCateg[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Indx = row
        Ucateg.text = ArrCateg[row]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc func closePicker(){
        Ucateg.text = ArrCateg[Indx]
                view.endEditing(true)
    }
}




