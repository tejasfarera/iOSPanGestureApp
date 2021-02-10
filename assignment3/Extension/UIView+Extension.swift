import UIKit

extension UIView {

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    func showLoader(activityIndicator: UIActivityIndicatorView) {
        guard let _parentViewController = parentViewController else { return }
        activityIndicator.center = _parentViewController.view.center
        activityIndicator.startAnimating()
        self.parentViewController?.view.addSubview(activityIndicator)
    }

    func hideLoader(activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.removeFromSuperview()
        }
    }
}
