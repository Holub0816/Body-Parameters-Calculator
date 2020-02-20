import UIKit
protocol AddCPMDelegate{
    func addCPM(cpm:Double)
}

class CpmController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var delegate: AddCPMDelegate?
    
    @IBOutlet weak var wzrost: UITextField!
    
    @IBOutlet weak var waga: UITextField!
    
    @IBOutlet weak var wiek: UITextField!
    
    @IBOutlet weak var plec: UISegmentedControl!
    
    @IBOutlet weak var aktywnosc: UIPickerView!
    
    
    @IBOutlet weak var wynik: UILabel!
    
    var x = ""
    
    let userDefault = UserDefaults.standard
    
    let tab:[(key:String,value:Double)] = [("Osoba chora leżąca w łóżku",1.0),("Bardzo niska",1.25),("Trening ok. 3 razy w tyg.",1.5),("Aktywny tryb życia",1.75),("Sportowiec/pracownik fizyczny",2.0)]
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        wzrost.delegate = self as? UISearchTextFieldDelegate
        waga.delegate = self as? UISearchTextFieldDelegate
        wiek.delegate = self as? UISearchTextFieldDelegate
        aktywnosc.delegate = self
        aktywnosc.dataSource = self
        
    }
  
    @IBAction func homeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }

    func numberOfComponents(in aktywnosc: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ aktywnosc: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tab.count
    }
    
    internal func pickerView(_ aktywnosc: UIPickerView, titleForRow row: Int, forComponent component:Int) -> String? {
        return tab[row].key
       
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        wzrost.resignFirstResponder()
        waga.resignFirstResponder()
        wiek.resignFirstResponder()
        
    }
    
    @IBAction func selectSex(_ sender: Any) {
    switch plec.selectedSegmentIndex {
           case 0:
               x = "M"
           case 1:
               x = "K"
           default:
               x = "M"
           }
    }
   
    @IBAction func calculate(_ sender: Any) {
    var calc = 0.0
    var a = 0.0
    var b = 0.0
    var c = 0.0
    var d = 0.0
    let e = aktywnosc.selectedRow(inComponent: 0)

        let wagaDouble = (waga?.text! as! NSString).doubleValue
        let wzrostDouble = (wzrost?.text! as! NSString).doubleValue
        let wiekDouble = (wiek?.text! as! NSString).doubleValue
        
        if x == "M" {
            a = 66.5
            b = 13.75
            c = 5.003
            d = 6.775
        }
        else{
            a = 665.1
            b = 9.563
            c = 1.85
            d = 4.676
        }
        calc = (a+(b*wagaDouble)+(c*wzrostDouble)-(d*wiekDouble))*tab[e].value
        calc = Double(round(100*calc)/100)
        wynik.text="Twoje CPM wynosi: \(calc) kcal"
        let calcString = calc.description
        
        userDefault.set(calcString, forKey: "CPM")
        userDefault.set(0.0, forKey: "current")
        
    }
    
    @IBAction func dodaj(_ sender: Any) {
        performSegue(withIdentifier: "fromCPMtoBar", sender: Any.self)
        wzrost.text = ""
        waga.text = ""
        wiek.text = ""
        wynik.text = ""}
}

