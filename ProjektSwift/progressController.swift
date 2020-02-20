import UIKit
class progressController: UIViewController {
    
    @IBOutlet weak var meal: UITextField!
    
    @IBOutlet weak var l: UILabel!
    
    var percent = 0.0
    
//    var cpm = (UserDefaults.standard.object(forKey: "CPM") as! NSString).floatValue
    
    var cpm :Float=0.0
    var currentCpm : Float = 0.0
        
    @IBOutlet weak var current: UILabel!
    
    @IBOutlet weak var bar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meal.delegate = self as? UISearchTextFieldDelegate
        if(UserDefaults.standard.object(forKey: "CPM") == nil){
            let alert = UIAlertController(title: "UWAGA!!!", message: "Musisz najpierw obliczyć swoje CPM1", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alert,animated: true,completion: nil)
            
        }else{
            cpm=(UserDefaults.standard.object(forKey: "CPM") as! NSString).floatValue
        }
        if(UserDefaults.standard.object(forKey: "current") != nil){
            currentCpm = UserDefaults.standard.object(forKey: "current") as! Float
        }
        
        bar.progress = currentCpm/cpm
        bar.setProgress(bar.progress, animated: true)
        l.text = "\(currentCpm)/\(cpm) kcal"
        current.text = "Spełniono \(Double(round((currentCpm/cpm)*100))) % zapotrzebowania"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        meal.resignFirstResponder()
    }
    
    @IBAction func click(_ sender: Any) {
        if(cpm == 0.0){
            let alert = UIAlertController(title: "UWAGA!!!", message: "Musisz najpierw obliczyć swoje CPM", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alert,animated: true,completion: nil)
        }else{
        perform(#selector(update))
        l.text = "\(currentCpm)/\(cpm) kcal"
        UserDefaults.standard.set(currentCpm, forKey: "current")
        }}
    
    
    @IBAction func homeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func update()
    {
        currentCpm = currentCpm + (meal.text! as! NSString).floatValue
        
        bar.progress = currentCpm/cpm
        bar.setProgress(bar.progress, animated: true)
        percent = Double(round((currentCpm/cpm)*100))
        current.text = "Spełniono \(percent) % zapotrzebowania"
        
        if(currentCpm >= cpm){
            
            bar.progressTintColor = UIColor.red
            
            let alert = UIAlertController(title: "UWAGA!!!", message: "Spełniłeś zapotrzebowanie kaloryczne", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alert,animated: true,completion: nil)
        }
    }
    
    @IBAction func zeruj(_ sender: Any) {
        cpm = 0.0
        currentCpm = 0.0
        bar.setProgress(0.0, animated: true)
        l.text = "\(currentCpm)/\(cpm) kcal"
        current.text = "Spełniono \(0) % zapotrzebowania"
    }
   
    
    
}
