import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func b1Pressed(_ sender: Any) {
        let alert = UIAlertController(title: "BMI", message: "Wskaźnik masy ciała. Klasyfikacja została opracowana wyłącznie dla dorosłych i nie moźe być stosowana u dzieci.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                present(alert,animated: true,completion: nil)
    }
    
    @IBAction func b2Pressed(_ sender: Any) {
        let alert = UIAlertController(title: "CPM", message: "Całkowita przemiana materii - zapotrzebowanie organizmu ludzkiego na składniki odżywcze oraz mikro- i makroelementy wstosynku całodobowym. ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert,animated: true,completion: nil)
    }
    
    @IBAction func b3Pressed(_ sender: Any) {
        let alert = UIAlertController(title: "PPM", message: "Podstawowa przemiana materii (metabolizm podstawowy)szy poziom przemian energetycznych, warunkujący dostarczenie energii niezbędnej do zachowania podstawowych funkcji życiowych.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert,animated: true,completion: nil)
    }
    @IBAction func b4Pressed(_ sender: Any) {
        let alert = UIAlertController(title: "BF %", message: "Procent tkanki tłuszczowej. Zawiera niezbędną tkankę tłuszczową i tłuszcz zapasowy.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert,animated: true,completion: nil)
    }
    @IBAction func b5Pressed(_ sender: Any) {
        let alert = UIAlertController(title: "Dodaj posiłek", message: "Wpisz liczbę kalorii spożytego posiłku i sprawdź czy wypełniłeś dzienne zapotrzebowanie organizmu.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert,animated: true,completion: nil)
    }
    
}


