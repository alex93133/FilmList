import UIKit


class FilmListVC: UITableViewController {
    
    
    // MARK: Properties
    var data: Films?
    
    let urlString = "https://s3-eu-west-1.amazonaws.com/sequeniatesttask/films.json"
    var selectedCell : (Int, Int)?
    
    var sections = [Section]()
    
    
    // MARK: Overriden funcs
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CustomTableViewCell.setAttributesForCell(tableView: self.tableView)
        self.navigationItem.title = "Фильмы"
        
        NetworkManager.fetchGenericJSON(urlString: urlString, type: Films.self, targetVC: self) { (decodedData) in
            
            self.data = decodedData
            self.createSectionSorting(self.data!)
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: Func
    func createSectionSorting(_ data: Films) {
        
        var titles = [Int]()
        titles = data.films.map({ (film) -> Int in
            film.year
        })
        
        titles = Array(Set(titles))
        titles.sort() {$0 < $1}
        
        var filmDictionary: [Int: [Film]] = [:]
        
        for element in data.films {
            if filmDictionary[element.year] == nil {
                filmDictionary[element.year] = [Film]()
            }
            filmDictionary[element.year]!.append(element)
        }
        sections = titles.map { Section(title: String($0), films: filmDictionary[$0]!) }
    }
}
