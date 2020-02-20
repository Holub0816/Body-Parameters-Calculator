import UIKit

class BmiController: UIViewController {
    
    
    @IBOutlet weak var wzrost: UITextField!
    
    @IBOutlet weak var wynik: UILabel!
    
    @IBOutlet weak var waga: UITextField!
    
    @IBOutlet weak var info: UILabel!
    
    
    var x = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wzrost.delegate = self as? UISearchTextFieldDelegate
        waga.delegate = self as? UISearchTextFieldDelegate

    }

    @IBAction func homeButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        wzrost.resignFirstResponder()
        waga.resignFirstResponder()
        
        
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        var calc = 0.0
        let wagaDouble = (waga?.text! as! NSString).doubleValue
        let wzrostDouble = (wzrost?.text! as! NSString).doubleValue
        var et = " "
        
        
        let ind = pow((wzrostDouble/100),2)
        calc = wagaDouble/ind
        calc = Double(round(100*calc)/100)
        wynik.text="Twoje BMI wynosi: \(calc)"
        
        if (calc < 16.0){
            et = "WYGŁODZENIE"
        }else if(calc > 16 && calc < 16.99){
            et = "WYCHUDZENIE"
        }else if(calc > 17 && calc < 18.49){
            et = "NIEDOWAGA"
        }else if(calc > 18.5 && calc < 24.99){
            et = "WARTOŚĆ PRAWIDŁOWA"
        }else if(calc > 25 && calc < 29.99){
            et = "NADWAGA"
        }else if(calc > 30 && calc < 34.99){
            et = "1 STOPIEŃ OTYŁOŚCI"
        }else if(calc > 35 && calc < 39.99){
            et = "2 STOPIEŃ OTYŁOŚCI"
        }else if(calc > 16){
            et = "OTYŁOŚĆ SKRAJNA"
        }
        info.text = et
    }
}

