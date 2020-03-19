import UIKit


class CustomTableViewCell: UITableViewCell {
    
    
    // MARK: Outlets
    @IBOutlet weak var localizedNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    // MARK: Funcs
    static func setAttributesForCell(tableView: UITableView) {
        
        tableView.tableFooterView    = UIView()
        tableView.estimatedRowHeight = 110
    }
    
    static func changeColorForRating(_ rating: Double) -> UIColor {
        
        switch rating {
        case ..<5 :
            return UIColor(red: 255/255, green: 11/255, blue: 11/255, alpha: 1)
        case 5...7 :
            return UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        case 7... :
            return UIColor(red: 0, green: 123/255, blue: 0, alpha: 1)
        default:
            return .black
        }
    }
}
