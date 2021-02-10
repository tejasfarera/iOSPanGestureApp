import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    public func imageFromURL(urlString: String, shouldShowLoader: Bool = false, shouldMakeImageRound: Bool = false) {

        // Check image in cache before retrieve
        if searchImageInCache(urlString: urlString) {
            if shouldMakeImageRound { self.layer.cornerRadius = self.frame.width / 2.0 }
            return
        }

        guard let url = URL(string: urlString) else {
            print(GeneralConstants.urlFailure)
            return
        }

        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        if shouldShowLoader { self.showLoader(activityIndicator: activityIndicator) }

        // Fetch data on background thread
        DispatchQueue.global(qos: .background).async {

            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) -> Void in
                // hide loader
                self?.hideLoader(activityIndicator: activityIndicator)

                if error != nil {
                    print(error ?? GeneralConstants.imageDownloadError)
                    return
                }
                DispatchQueue.main.async {
                    guard let this = self, let _data = data, let image = UIImage(data: _data) else { return }
                    self?.image = image
                    if shouldMakeImageRound { this.layer.cornerRadius = this.frame.width / 2.0 }
                    imageCache.setObject(image, forKey: urlString as NSString)
                }

            }.resume()
        }
    }

    func searchImageInCache(urlString: String) -> Bool {
        guard let cachedImage = imageCache.object(forKey: urlString as NSString) else { return false }
        self.image = cachedImage
        return true
    }
}
