import UIKit


extension FilmInfoViewController {
    
    func fillRating(with rating: Double) {
        let ratingColor = FilmTableViewCell.changeColorForRating(rating)
        let str = "Рейтинг: \(rating)"
        let attributedString = NSMutableAttributedString(string: str)
        
        attributedString.addAttribute(NSAttributedString.Key.font, value:UIFont.systemFont(ofSize: 17.0, weight: .regular), range:NSMakeRange(0,14))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.label, range:NSMakeRange(0,9))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: ratingColor, range:NSMakeRange(9,5))
        
        ratingLabel.attributedText = attributedString
    }
    
    func fillDescription(_ description: String) {
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.lineSpacing = 7.0
        
        let attributedString = NSAttributedString(string: description, attributes:[NSAttributedString.Key.foregroundColor:UIColor.label,NSAttributedString.Key.paragraphStyle:attributedStringParagraphStyle,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15.0, weight: .regular)])
        
        self.descriptionTextView.attributedText = attributedString
    }
}
