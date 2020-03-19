import UIKit


// MARK: - Section
struct Section {
    let title : String
    let films : [Film]
}


// MARK: - FilmListVC TableView extension
extension FilmListVC {
    
    
    // MARK: Overriden funcs
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.isEmpty ? 1 : sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections.isEmpty ? nil : sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.isEmpty ? 0 : sections[section].films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        let section = sections[indexPath.section]
        
        cell.localizedNameLabel.text = section.films[indexPath.row].localized_name
        cell.nameLabel.text = section.films[indexPath.row].name
        
        if let rating = section.films[indexPath.row].rating {
            cell.ratingLabel.text = "\(rating)"
            cell.ratingLabel.textColor =  CustomTableViewCell.changeColorForRating(rating)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tuple: (Int, Int) = (indexPath.section, indexPath.row)
        self.selectedCell = tuple
        
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let dvc   = segue.destination as? FilmInfoVC else { return }
        
        dvc.selectedCell = selectedCell
        dvc.sections = sections
    }
}
