import UIKit

class ConfigScreenVC: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet private weak var numberTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.submitButton.layer.cornerRadius = GeneralConstants.cornerRadius
    }

    // MARK: - IBActions

    @IBAction private func onSubmitClick(_ sender: Any) {
        let _validatedData = validateData()

        errorLabel.text = _validatedData.errorMessage
        errorLabel.isHidden = _validatedData.numberOfItems != nil

        if let numberOfItems = _validatedData.numberOfItems {
            self.navigateToListScreen(numberOfItems: numberOfItems)
        }
    }

    @IBAction private func onSkip(_ sender: Any) {
        self.navigateToListScreen(numberOfItems: GeneralConstants.defaultListSize)
    }

    // MARK: - Helper methods

    private func validateData() -> (numberOfItems: Int?, errorMessage: String?) {
        guard let fieldData = numberTextField.text, let number = Int(fieldData) else {
            return (nil, GeneralConstants.notNumber)
        }

        return number >= GeneralConstants.minListSize && number < GeneralConstants.maxListSize
            ? (number, nil)
            : (nil, GeneralConstants.invalidNumber)
    }
}


