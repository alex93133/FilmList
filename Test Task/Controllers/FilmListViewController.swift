import UIKit


class FilmListViewController: UITableViewController {
    
    let urlString = "https://s3-eu-west-1.amazonaws.com/sequeniatesttask/films.json"
    var data: Films?
    var selectedFilmCell : Film?
    var sections = [FilmSectionModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FilmTableViewCell.setAttributesForCell(tableView: self.tableView)
        navigationItem.title = "Фильмы"
        refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
        getData()
    }
    
    func getData() {
        NetworkManager.fetchGenericJSON(urlString: urlString, type: Films.self, targetVC: self) { [weak self] (decodedData) in
            self?.data = decodedData
            self?.createSectionSorting(self!.data!)
            self?.tableView.reloadData()
        }
    }
    
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
        sections = titles.map { FilmSectionModel(title: String($0), films: filmDictionary[$0]!) }
    }
    
    @objc func refresh(sender:AnyObject) {
        getData()
        refreshControl?.endRefreshing()
    }
}
