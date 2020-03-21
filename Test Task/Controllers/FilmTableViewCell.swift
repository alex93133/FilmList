import UIKit


class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var localizedNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    

    static func setAttributesForCell(tableView: UITableView) {
        tableView.tableFooterView    = UIView()
    }
    
    static func changeColorForRating(_ rating: Double) -> UIColor {
        switch rating {
        case ..<5 :
            return UIColor(named: "BadFilmColor")!
        case 5...7 :
            return UIColor(named: "NeutralFilmColor")!
        case 7... :
            return UIColor(named: "GoodFilmColor")!
        default:
            return .black
        }
    }
}
