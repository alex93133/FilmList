import UIKit


class NetworkManager {
    
    static func decodeGenericJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let parsedJSON = try decoder.decode(type.self, from: data)
            return parsedJSON
        } catch let decodeError {
            print("Decoding error: \(decodeError)")
            return nil
        }
    }
    
    static func fetchGenericJSON<T: Decodable>(urlString: String, type: T.Type, targetVC: UIViewController, clossure: @escaping (T?) -> Void) {
        var decodedData : T?
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        AlertControllerManager.presentAllert(title: "Error", message: error.localizedDescription, targetVC: targetVC)
                    }
                    return
                }
                decodedData = decodeGenericJSON(type: type, data: data)
                DispatchQueue.main.async {
                    clossure(decodedData)
                }
            }.resume()
        }
    }
    
    static func getImage(urlString: String) -> UIImage? {
        let imageUrlString = urlString
        guard let imageUrl = URL(string: imageUrlString) else { return nil }
        let image = try? UIImage(withContentsOfUrl: imageUrl)
        return image
    }
}
