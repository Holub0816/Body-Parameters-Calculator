import UIKit

class PppmController: UIViewController {
    
    @IBOutlet weak var wzrost: UITextField!
    
    @IBOutlet weak var waga: UITextField!
    
    @IBOutlet weak var wiek: UITextField!
    
    @IBOutlet weak var wynik: UILabel!
    
    @IBOutlet weak var plec: UISegmentedControl!
    
    var x = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wzrost.delegate=self as? UISearchTextFieldDelegate
        waga.delegate=self as? UISearchTextFieldDelegate
        wiek.delegate=self as? UISearchTextFieldDelegate

    }

    @IBAction func homeButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
               dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        wzrost.resignFirstResponder()
        waga.resignFirstResponder()
        wiek.resignFirstResponder()
        
    }
    
    @IBAction func selectSex(_ sender: Any)
    {
        switch plec.selectedSegmentIndex {
        case 0:
            x = "M"
        case 1:
            x = "K"
        default:
            x = "M"
        }
    }
     
    @IBAction func calculatePpm(_ sender: Any) {
        
        var calc = 0.0
        var a = 0.0
        var b = 0.0
        var c = 0.0
        var d = 0.0
        let wagaDouble = (waga?.text! as! NSString).doubleValue
        let wzrostDouble = (wzrost?.text as! NSString).doubleValue
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
        calc = a+(b*wagaDouble)+(c*wzrostDouble)-(d*wiekDouble)
        calc = Double(round(100*calc)/100)
        wynik.text="Twoje PPM wynosi: \(calc) kcal"
    }
    
}


