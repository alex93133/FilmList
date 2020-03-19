import UIKit

class AlertControllerManager {
    
    
    static func presentAllert (title: String, message: String, targetVC : UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAlert = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        
        alert.addAction(closeAlert)
       
        targetVC.present(alert, animated: true, completion: nil)
    }
}


