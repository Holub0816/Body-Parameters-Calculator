import UIKit

class BfController: UIViewController {
    
    @IBOutlet weak var talia: UITextField!
    
    @IBOutlet weak var waga: UITextField!
    
    @IBOutlet weak var plec: UISegmentedControl!
    
    @IBOutlet weak var wynik: UILabel!
    
    var x = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        talia.delegate = self as? UISearchTextFieldDelegate
        waga.delegate = self as? UISearchTextFieldDelegate
    }

    @IBAction func homeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
               dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        talia.resignFirstResponder()
        waga.resignFirstResponder()
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
        let wagaDouble = (waga?.text! as! NSString).doubleValue
        let taliaDouble = (talia?.text! as! NSString).doubleValue
        var calc = 0.0
        let a = 4.15*taliaDouble
        let b = a/2.54
        let c = 0.082*wagaDouble*2.2
        var d = 0.0
        
        if x == "M" {
            d = b-c-98.42
        }
        else{
            d = b-c-76.76
        }
        let e = wagaDouble*2.2
        
        calc = d/e*100
        calc = Double(round(100*calc)/100)
        wynik.text="Twoje BF % wynosi: \(calc) %"
    }
}
