import UIKit


class FilmInfoViewController: UIViewController {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!


    var selectedFilmCell: Film!
    var sections: [FilmSectionModel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillInfo()
    }
    
    func fillInfo() {
        let film = selectedFilmCell!
        
        navigationItem.title = film.localized_name
        
        nameLabel.text = film.name
        yearLabel.text = "Год: \(film.year)"
        
        if let desciptionOfFilm = film.description {
            fillDescription(desciptionOfFilm)
        }
        
        if let rating = film.rating {
            fillRating(with: rating)
        }
        
        if let image = film.image {
            poster.image = image
        }
    }
}
