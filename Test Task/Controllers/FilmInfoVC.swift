import UIKit


class FilmInfoVC: UIViewController {
    
    
    // MARK: Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: Properties
    var selectedCell: (Int, Int)!
    var sections: [Section]!
    
    
    // MARK: Overriden funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInfo()
    }
    
    
    // MARK: Funcs
    func fillInfo() {
        
        let film = sections[selectedCell.0].films[selectedCell.1]
        
        self.navigationItem.title = film.localized_name
        
        nameLabel.text = film.name
        yearLabel.text = "Год: \(film.year)"
        
        if let desciptionOfFilm = film.description {
            fillDescription(desciptionOfFilm)
        }
        
        if let rating = film.rating {
            fillRating(with: rating)
        }
        
        if let image = film.image {
            posterImage.image = image
        }
    }
}
