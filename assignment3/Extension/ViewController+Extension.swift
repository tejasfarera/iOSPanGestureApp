import UIKit

extension UIViewController {

    func presentImageScreen(imageURL: String) {
        guard let controller = StoryBoardNames.imagePresenter.instantiateController() as? ImagePresenterVC else {
            return
        }
        controller.imageURL = imageURL
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }

    func navigateToListScreen(numberOfItems: Int) {
        guard let controller = StoryBoardNames.listScreen.instantiateController() as? ListScreenVC else {
            return
        }
        controller.numberOfItems = numberOfItems
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
}
