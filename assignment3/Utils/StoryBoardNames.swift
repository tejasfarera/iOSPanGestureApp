import UIKit

enum StoryBoardNames: String {
    case imagePresenter = "ImagePresenter"
    case listScreen = "ListScreen"

    func instantiateController() -> UIViewController {
        let mainStoryboard = UIStoryboard(name: self.rawValue, bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: self.rawValue + "VC")
    }
}
