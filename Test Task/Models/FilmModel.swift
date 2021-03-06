import UIKit


// MARK: - Films
struct Films: Decodable {
    var films: [Film]
}


// MARK: - Film
struct Film: Decodable {
    let id: Int
    let localized_name: String
    let name: String
    let year: Int
    let rating: Double?
    let image_url: String?
    let description: String?
    let genres: [String]
}

