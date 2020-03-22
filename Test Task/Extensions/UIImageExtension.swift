import  UIKit


extension UIImageView {
    
func imageFromServerURL(urlString: String, defaultImage : String?) {
    if let di = defaultImage {
        self.image = UIImage(named: di)
    }

    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

        if error != nil {
            print(error?.localizedDescription ?? "Error")
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
        })

    }).resume()
  }
}
