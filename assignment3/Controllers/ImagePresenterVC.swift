import UIKit

class ImagePresenterVC: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private var panGesture: UIPanGestureRecognizer!

    // MARK: - Variables

    private var initialCenter = CGPoint()
    var imageURL: String = ""

    // MARK: - Controller life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.imageFromURL(urlString: imageURL, shouldShowLoader: true)
    }

    // MARK: - IBActions

    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        guard let gestureView = gesture.view else { return }

        if gesture.state == .began {
            // Save the view's original position.
            self.initialCenter = gestureView.center
        }

        if translation.y > 0 {
            gestureView.center = CGPoint(x: gestureView.center.x, y: gestureView.center.y + translation.y)
        }
        gesture.setTranslation(.zero, in: view)

        if gestureView.center.y > self.view.frame.height - GeneralConstants.safeAreaBottom {
            self.dismiss(animated: true, completion: nil)
        }
        if gesture.state == .ended {
            // Add the X and Y translation to the view's original position.
            UIView.animate(withDuration: GeneralConstants.defaultAnimationTime) { [weak self] in
                guard let this = self else { return }
                gestureView.center = this.initialCenter
                this.view.layoutIfNeeded()
            }
        }
    }
}
